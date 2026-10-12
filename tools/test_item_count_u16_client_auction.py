"""Verify generated auction/client candidates offline; never runs a server."""
from __future__ import annotations

import argparse
import hashlib
import importlib
import json
from pathlib import Path
import struct
import sys


def sha(data):
    return hashlib.sha256(data).hexdigest()


def run(root, tools_dir, output):
    import pefile
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn.x86_const import UC_X86_REG_RIP, UC_X86_REG_RSP, UC_X86_REG_RCX, UC_X86_REG_RDX, UC_X86_REG_RAX
    client = importlib.import_module("patch_item_count_u16_client")
    if Path(client.__file__).resolve().parent != tools_dir:
        raise ValueError("Client patch module resolved outside selected tools directory")
    client.configure_dependencies(tools_dir)
    relative = Path("Server/S1001/x64/LogicServerCQ64_R.exe")
    source = (root / relative).read_bytes()
    from patch_item_count_u16 import SUPPORTED_LOGIC_SHA256
    if sha(source) not in SUPPORTED_LOGIC_SHA256:
        raise ValueError("Source server is not the audited version")
    candidate = (output / relative).read_bytes()
    if source == candidate:
        raise ValueError("Output server is not a patched candidate")
    pe = pefile.PE(data=candidate)
    base = pe.OPTIONAL_HEADER.ImageBase
    if base != 0x140000000:
        raise ValueError("Unexpected candidate image base")
    if candidate[:2] != b"MZ" or pe.FILE_HEADER.Machine != 0x8664:
        raise ValueError("Expected x64 PE candidate")
    uc = Uc(UC_ARCH_X86, UC_MODE_64)
    uc.mem_map(base, (pe.OPTIONAL_HEADER.SizeOfImage + 0xfff) & ~0xfff)
    uc.mem_write(base, pe.get_memory_mapped_image())
    uc.mem_map(0x200000, 0x20000); uc.mem_map(0x300000, 0x10000)
    mgr, actor, packet, frame, sentinel = 0x201000, 0x203000, 0x204000, 0x30f000, 0x205000
    rows, writes, ended = [], [], []

    def returning(value):
        rsp = uc.reg_read(UC_X86_REG_RSP)
        ret = struct.unpack("<Q", uc.mem_read(rsp, 8))[0]
        uc.reg_write(UC_X86_REG_RAX, value)
        uc.reg_write(UC_X86_REG_RSP, rsp + 8); uc.reg_write(UC_X86_REG_RIP, ret)

    def hook(uc, address, size, _):
        if address == sentinel:
            uc.emu_stop(); return
        rva = address - base
        if rva == 0xd9a0:  # User session state, zero allows this UI message.
            returning(0)
        elif rva == 0x22d3f0:  # Begin packet.
            returning(packet)
        elif rva in (0xbd30, 0xb630, 0xc1c60):
            width = {0xbd30: 1, 0xb630: 2, 0xc1c60: 4}[rva]
            assert uc.reg_read(UC_X86_REG_RCX) == packet
            value = uc.reg_read(UC_X86_REG_RDX) & ((1 << (8 * width)) - 1)
            writes.append((width, value)); returning(packet)
        elif rva == 0x22da10:  # End/send packet.
            ended.append(True); returning(0)

    uc.hook_add(UC_HOOK_CODE, hook)
    boundaries = [0, 1, 127, 128, 200, 249, 255, 256, 9998, 9999, 10000, 32767, 32768, 65535]
    for count in boundaries:
        data = bytearray(0xb0)
        struct.pack_into("<H", data, 0x8e, 5363); struct.pack_into("<H", data, 0x92, count)
        data[0x8c] = 2; data[0x8d] = 3; data[0x90] = 1
        struct.pack_into("<I", data, 0x88, 3600)
        uc.mem_write(mgr, bytes(data)); uc.mem_write(frame, struct.pack("<Q", sentinel))
        uc.reg_write(UC_X86_REG_RSP, frame)
        uc.reg_write(UC_X86_REG_RCX, mgr); uc.reg_write(UC_X86_REG_RDX, actor)
        writes.clear(); ended.clear()
        uc.emu_start(base + 0x6da30, sentinel, count=3000)
        assert ended == [True], (count, writes, ended, hex(uc.reg_read(UC_X86_REG_RIP)))
        expected = [(1, 12), (1, 9), (2, 5363), (2, count), (1, 2), (1, 3), (1, 1), (4, 3600)]
        assert writes == expected, (count, writes)
        wire = b"".join(value.to_bytes(width, "little") for width, value in writes)
        assert len(wire) == 13
        assert struct.unpack("<HHBBBI", wire[2:]) == (5363, count, 2, 3, 1, 3600)
        rows.append(dict(count=count, writes=list(writes), wire_hex=wire.hex()))

    original = (root / "web/GameFrame.swf").read_bytes()
    result, _ = client.patch_swf(original)
    assert result == (output / "web/GameFrame.swf").read_bytes(), "Client output differs from exact reviewed patch"
    _, tags = client.swf_tags(result)
    abc = next(p for kind, _, p in tags if kind == 82)
    abc = abc[abc.index(b"\0", 4) + 1:]
    parsed = client.inspect_abc_full(abc)
    assert parsed["classes"]["ShopCC"]["doAuctionItemInfoBack"] == 14702
    assert parsed["bodies"][14702]["code"][32:37] == b"\x46" + client.encode_u30(client.Q["readUnsignedShort"]) + b"\x00"
    u = parsed["bodies"][5252]["code"]
    expected = (b"\xd0\xd0\x66" + client.encode_u30(client.Q["btCount"]) +
                b"\xd1\x46" + client.encode_u30(client.Q["readUnsignedByte"]) +
                b"\x00\x24\x08\xa5\xa9\x61" + client.encode_u30(client.Q["btCount"]))
    assert u[584:584 + len(expected)] == expected
    # Interpret the verified sequence without invoking a Flash runtime.
    for count in range(65536):
        obj = {"btCount": count & 0xff}; stack = [obj, obj]
        stack.append(stack.pop()["btCount"])
        stack.append(count >> 8); stack.append(8)
        shift = stack.pop(); value = stack.pop(); stack.append(value << shift)
        value = stack.pop(); low = stack.pop(); stack.append(low | value)
        value = stack.pop(); stack.pop()["btCount"] = value
        assert not stack and obj["btCount"] == count
    report = dict(evidence_type="Unicorn offline candidate replay with packet API stubs; complete ABC verification",
                  deployed_target_executed=False, native_boundaries=rows, native_replay_cases=len(rows),
                  avm2_high_byte_values=65536, avm2_stack_balanced=True,
                  client_candidate_sha256=sha(result), native_candidate_sha256=sha(candidate),
                  limitation="Packet API calls are modeled; actual network, server startup, storage and gameplay have not been tested")
    (output / "client-auction-verification.json").write_text(json.dumps(report, indent=2), encoding="utf-8")
    return {k: v for k, v in report.items() if k != "native_boundaries"}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--root", type=Path, required=True)
    parser.add_argument("--deps", type=Path, required=True)
    parser.add_argument("--tools-dir", type=Path, default=Path(__file__).resolve().parent)
    parser.add_argument("--output-dir", type=Path, required=True, help="Existing generated native/client candidate directory")
    args = parser.parse_args()
    root, output, tools = args.root.resolve(), args.output_dir.resolve(), args.tools_dir.resolve()
    if root == output or root in output.parents:
        raise ValueError("Candidate output must be outside deployed project")
    if not (tools / "patch_item_count_u16_client.py").is_file():
        raise ValueError("Selected tools directory lacks the reviewed client patch module")
    sys.path.insert(0, str(args.deps.resolve())); sys.path.insert(0, str(tools))
    print(json.dumps(run(root, tools, output), indent=2))


if __name__ == "__main__":
    main()
