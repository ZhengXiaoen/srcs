"""Sample ground drops near one actor without attaching a debugger or changing memory.

This supports the current, explicitly verified LogicServer build only. Samples
show server state, not whether the client sent a pickup request. Disappearance
may mean pickup, expiry, map cleanup or another actor's pickup.
"""
from __future__ import annotations

import argparse
import ctypes as C
import hashlib
import json
from pathlib import Path
import struct
import subprocess
import time


SERVER_SHA256 = "d3aafe43859f02a96b61fcf46201aa1ba5305e125ae5f7948ff850ca1aedf6b0"
ROOT = Path(__file__).resolve().parents[1]


def image_info(pid):
    # The only substituted input is argparse's integer PID.
    command = (f"$p=Get-Process -Id {pid} -ErrorAction Stop; "
               "@{path=$p.Path;base=[long]$p.Modules[0].BaseAddress} | ConvertTo-Json -Compress")
    return json.loads(subprocess.check_output(
        ["powershell.exe", "-NoProfile", "-NonInteractive", "-Command", command],
        encoding="utf-8", creationflags=subprocess.CREATE_NO_WINDOW))


def image_bytes(source, rva, size):
    pe = struct.unpack_from("<I", source, 0x3C)[0]
    count = struct.unpack_from("<H", source, pe + 6)[0]
    optional_size = struct.unpack_from("<H", source, pe + 20)[0]
    for i in range(count):
        offset = pe + 24 + optional_size + i * 40
        virtual_size, start, raw_size, raw = struct.unpack_from("<4I", source, offset + 8)
        if start <= rva and rva + size <= start + raw_size:
            return source[raw + rva - start:raw + rva - start + size]
    raise ValueError(f"RVA {rva:#x} is not backed by file bytes")


class Reader:
    def __init__(self, pid):
        self.kernel = C.WinDLL("kernel32", use_last_error=True)
        self.kernel.OpenProcess.argtypes = [C.c_uint32, C.c_int, C.c_uint32]
        self.kernel.OpenProcess.restype = C.c_void_p
        self.kernel.ReadProcessMemory.argtypes = [C.c_void_p, C.c_void_p, C.c_void_p,
                                                  C.c_size_t, C.POINTER(C.c_size_t)]
        self.kernel.ReadProcessMemory.restype = C.c_int
        self.kernel.CloseHandle.argtypes = [C.c_void_p]
        self.handle = self.kernel.OpenProcess(0x410, False, pid)  # QUERY_INFORMATION | VM_READ
        if not self.handle:
            raise C.WinError(C.get_last_error())

    def read(self, address, size):
        buffer = C.create_string_buffer(size)
        actual = C.c_size_t()
        if (not self.kernel.ReadProcessMemory(self.handle, address, buffer, size, C.byref(actual))
                or actual.value != size):
            raise OSError(C.get_last_error(), f"Cannot read {address:#x}")
        return buffer.raw

    def u64(self, address):
        return struct.unpack("<Q", self.read(address, 8))[0]

    def close(self):
        self.kernel.CloseHandle(self.handle)

    def objects(self, manager, offset):
        # CWorldEntityList starts with CBaseLinkedList: head +8, node value +0,
        # next +0x10. A live traversal is non-atomic; every sample reports errors.
        node = self.u64(manager + offset + 8)
        seen = set()
        while node:
            if node in seen or len(seen) >= 10000:
                raise ValueError("Cyclic or oversized live entity list")
            seen.add(node)
            yield self.u64(node)
            node = self.u64(node + 0x10)

    def properties(self, obj, base, source):
        getter = self.u64(self.u64(obj) + 0x28)
        # Validate this object's actual vtable getter before interpreting fields.
        code = self.read(getter, 32)
        prefix = bytes.fromhex("48894c2408488b4424084805")
        if not code.startswith(prefix) or code[16] != 0xC3:
            raise ValueError("Unsupported property getter")
        offset = struct.unpack_from("<I", code, 12)[0]
        if offset not in (0xFE0, 0x248):
            raise ValueError("Unexpected property layout")
        if code[:17] != image_bytes(source, getter - base, 17):
            raise ValueError("Runtime property getter differs from the verified image")
        return struct.unpack("<5i", self.read(obj + offset + 0x28, 20))


def decode_name(raw):
    raw = raw.split(b"\0", 1)[0]
    for encoding in ("utf-8", "gbk"):
        try:
            return raw.decode(encoding)
        except UnicodeDecodeError:
            pass
    return raw.hex()


def sample(reader, base, source, actor_name):
    tick_before = reader.u64(reader.u64(base + 0x4ACD90) + 0x68)
    engine = reader.u64(base + 0x4ACD90)
    manager = engine + 0x78
    actors = []
    for obj in reader.objects(manager, 0x1C0):
        if decode_name(reader.read(obj + 0x18, 32)) != actor_name:
            continue
        props = reader.properties(obj, base, source)
        actors.append({"pointer": hex(obj), "actor_id": props[0], "xy": list(props[1:3]),
                       "scene_pointer": hex(reader.u64(obj + 0x100))})
    if len(actors) > 1:
        raise ValueError("Actor name is ambiguous")
    drops = []
    if actors:
        actor = actors[0]
        for obj in reader.objects(manager, 0x500):
            if hex(reader.u64(obj + 0x100)) != actor["scene_pointer"]:
                continue
            props = reader.properties(obj, base, source)
            item = reader.u64(obj + 0x240)
            if not item:
                continue  # This monitor selects item entities, not currency entities.
            raw = reader.read(item, 129)
            x, y = props[1:3]
            drops.append({"pointer": hex(obj), "item_id": struct.unpack_from("<H", raw, 8)[0],
                          "count": raw[0x2D] + (raw[0x80] << 8), "binding_flags": raw[0x2E],
                          "xy": [x, y],
                          "display_xy": [reader.u64(obj + 0x2B0), reader.u64(obj + 0x2B8)],
                          "same_tile": [x, y] == actor["xy"],
                          "distance_tiles": max(abs(x - actor["xy"][0]), abs(y - actor["xy"][1])),
                          "owner_actor_id": props[0],
                          "expire_remaining_ms": reader.u64(obj + 0x288) - tick_before,
                          "owner_protect_remaining_ms": reader.u64(obj + 0x290) - tick_before,
                          "can_pick_remaining_ms": reader.u64(obj + 0x2A0) - tick_before})
    return {"server_tick_before": tick_before, "server_tick_after": reader.u64(engine + 0x68),
            "actor": actors[0] if actors else None, "drops": drops,
            "atomic": False, "pickup_requests_observed": False}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--pid", type=int, required=True)
    parser.add_argument("--actor", default="欧皇")
    parser.add_argument("--seconds", type=float, default=45)
    parser.add_argument("--interval-ms", type=int, default=250)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    if args.pid <= 0 or not 0 < args.seconds <= 3600 or not 50 <= args.interval_ms <= 10000:
        parser.error("PID must be positive, duration 0..3600 seconds and interval 50..10000 ms")
    info = image_info(args.pid)
    path = Path(info["path"])
    if path.resolve() != (ROOT / "Server/S1001/x64/LogicServerCQ64_R.exe").resolve():
        raise ValueError("Selected PID is not this workspace's LogicServer")
    source = path.read_bytes()
    if hashlib.sha256(source).hexdigest() != SERVER_SHA256:
        raise ValueError("Unsupported server build; revalidate offsets before sampling")
    reader = Reader(args.pid)
    try:
        base = info["base"]
        for rva, size in ((0xDEc0, 8), (0x1E1710, 48), (0x25BF00, 32)):
            if reader.read(base + rva, size) != image_bytes(source, rva, size):
                raise ValueError("Running server bytes do not match the verified image")
        args.output.parent.mkdir(parents=True, exist_ok=True)
        # Avoid overwriting earlier observation evidence.
        with args.output.open("x", encoding="utf-8") as output:
            output.write(json.dumps({"kind": "identity", "pid": args.pid,
                "server_sha256": SERVER_SHA256, "image_base": hex(base), "actor": args.actor,
                "interval_ms": args.interval_ms, "duration_seconds": args.seconds,
                "read_only": True, "limitations": ["Non-atomic live samples", "No request/call tracing",
                    "Disappearance does not prove pickup", "Transient states between samples are unknown"]},
                ensure_ascii=False) + "\n")
            started = time.monotonic()
            samples = errors = drop_samples = 0
            while time.monotonic() - started < args.seconds:
                try:
                    row = sample(reader, base, source, args.actor)
                    drop_samples += bool(row["drops"])
                except (OSError, ValueError) as error:
                    row = {"error": str(error), "atomic": False}
                    errors += 1
                row.update({"kind": "sample", "elapsed_ms": round((time.monotonic() - started) * 1000)})
                output.write(json.dumps(row, ensure_ascii=False) + "\n")
                output.flush()
                samples += 1
                time.sleep(args.interval_ms / 1000)
        print(json.dumps({"output": str(args.output.resolve()), "samples": samples,
                          "errors": errors, "samples_with_drops": drop_samples}, ensure_ascii=False))
    finally:
        reader.close()


if __name__ == "__main__":
    main()
