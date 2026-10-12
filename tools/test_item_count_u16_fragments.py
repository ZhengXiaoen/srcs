"""Execute generated count instructions and compare registers/adjacent bytes."""
import argparse
import hashlib
from pathlib import Path
import struct
import sys

from patch_item_count_u16 import LOGIC_SHA256, logic_manifest, replacement_assembly, register_family


def run(root):
    from keystone import Ks, KS_ARCH_X86, KS_MODE_64
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64
    from unicorn import x86_const as r
    ks = Ks(KS_ARCH_X86, KS_MODE_64)
    base, memory, stack, item = 0x140000000, 0x10000000, 0x10018000, 0x10002000
    source = (root / "Server/S1001/x64/LogicServerCQ64_R.exe").read_bytes()
    entries = logic_manifest(source, Path(__file__).with_name("item_count_u16_sites.json"))
    regs = {name: getattr(r, "UC_X86_REG_" + name.upper()) for name in
            ("rax", "rbx", "rcx", "rdx", "rsi", "rdi", "rbp", "rsp", "r8", "r9", "r10", "r11", "r12", "r13", "r14", "r15")}
    vectors = 0
    for entry in entries:
        if entry["kind"] not in ("read", "write", "clear", "compare", "dup-limit", "cache-saturate"):
            continue
        assembly = replacement_assembly(entry)
        code = bytes(ks.asm(assembly, base)[0])
        for count in (0, 1, 127, 128, 200, 255, 256, 257, 9998, 9999, 10000, 32768, 65535):
            for flags in (0x202, 0xad7):
                uc = Uc(UC_ARCH_X86, UC_MODE_64)
                uc.mem_map(base, 0x1000); uc.mem_write(base, code)
                uc.mem_map(memory, 0x20000)
                for index, (name, reg) in enumerate(regs.items()):
                    uc.reg_write(reg, 0x12340000 + index*0x111)
                uc.reg_write(r.UC_X86_REG_RSP, stack)
                uc.reg_write(r.UC_X86_REG_EFLAGS, flags)
                before = bytearray((i*19+11)%256 for i in range(0x98))
                before[0x2d] = count & 255; before[0x80] = count >> 8
                before[0x31] = count & 255
                uc.mem_write(item, bytes(before))
                kind = entry["kind"]
                br, vr = entry.get("base_register"), entry.get("value_register")
                if br and br != "rsp":
                    uc.reg_write(regs[register_family(br)[0]], item)
                if kind in ("write", "cache-saturate") and vr:
                    uc.reg_write(regs[register_family(vr)[0]], count)
                states = {name: uc.reg_read(reg) for name, reg in regs.items()}
                uc.emu_start(base, base+len(code), count=100)
                after = bytes(uc.mem_read(item, 0x98))
                changed = set()
                expected = bytearray(before)
                if kind == "read":
                    destination = register_family(vr)[0]; changed.add(destination)
                    assert uc.reg_read(regs[destination]) == count, entry
                elif kind in ("write", "clear"):
                    written = count if vr else int(entry["original"].rsplit(",", 1)[1], 0)
                    expected[0x2d] = written & 255; expected[0x80] = written >> 8
                elif kind == "dup-limit":
                    destination = register_family(vr)[0]; changed.add(destination)
                    original = count & 255
                    assert uc.reg_read(regs[destination]) == (9999 if original > 1 else original), entry
                elif kind == "compare":
                    expected_cmp = bytes(ks.asm("cmp eax,1", base)[0])
                    cmp_uc = Uc(UC_ARCH_X86, UC_MODE_64); cmp_uc.mem_map(base, 0x1000)
                    cmp_uc.mem_write(base, expected_cmp); cmp_uc.reg_write(r.UC_X86_REG_RAX, count)
                    cmp_uc.reg_write(r.UC_X86_REG_EFLAGS, flags); cmp_uc.emu_start(base, base+len(expected_cmp))
                    assert (uc.reg_read(r.UC_X86_REG_EFLAGS) & 0x8d5) == (cmp_uc.reg_read(r.UC_X86_REG_EFLAGS) & 0x8d5)
                elif kind == "cache-saturate":
                    offset = int(entry["displacement"], 0)
                    assert uc.mem_read(stack+offset, 1)[0] == min(count, 255)
                assert after == expected, (entry, count)
                for name, previous in states.items():
                    if name not in changed:
                        assert uc.reg_read(regs[name]) == previous, (entry, name, count)
                if kind != "compare":
                    assert uc.reg_read(r.UC_X86_REG_EFLAGS) == flags, entry
                vectors += 1
    return dict(status="passed", vectors=vectors, source_sha256=hashlib.sha256(source).hexdigest(),
                coverage="generated replacement instructions; original core functions tested separately")


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--root", type=Path, default=Path(__file__).resolve().parents[1])
    parser.add_argument("--deps", type=Path)
    args = parser.parse_args()
    if args.deps: sys.path.insert(0, str(args.deps))
    print(run(args.root))
