"""Execute the shipped x64 rate calculations and audit the narrow native patch."""

import argparse
import base64
import hashlib
import json
from pathlib import Path
import struct
import sys
import unittest

from patch_warrior_defense_rate import SERVER, PACKAGE, OLD, NEW, CONDITION_RVA, patch


FIELDS = (5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27)
BASE = 0x140000000


class WarriorAttributeTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        import pefile
        cls.source = SERVER.read_bytes()
        pe = pefile.PE(data=cls.source)
        offset = pe.get_offset_from_rva(CONDITION_RVA)
        if cls.source[offset:offset + len(OLD)] == NEW:
            cls.source = cls.source[:offset] + OLD + cls.source[offset + len(OLD):]
        cls.patched = patch(cls.source)

    def machine(self, source):
        import pefile
        from unicorn import Uc, UC_ARCH_X86, UC_MODE_64
        uc = Uc(UC_ARCH_X86, UC_MODE_64)
        uc.mem_map(BASE, 0x600000)
        uc.mem_write(BASE, pefile.PE(data=source).get_memory_mapped_image())
        uc.mem_map(0x10000000, 0x20000)
        return uc

    def later_rate_pass(self, source, rate):
        from unicorn.x86_const import UC_X86_REG_RSP
        uc = self.machine(source)
        stack, cfg, hero = 0x10004000, 0x10008000, 0x10009000
        uc.reg_write(UC_X86_REG_RSP, stack)
        uc.mem_write(stack + 0x950, struct.pack("<i", rate))
        uc.mem_write(stack + 0x348, struct.pack("<Q", cfg))
        uc.mem_write(stack + 0xcd8, struct.pack("<Q", hero))
        # Different values catch incorrect indexes and swapped fields.
        for index, kind in enumerate(FIELDS):
            uc.mem_write(cfg + kind * 4, struct.pack("<i", 100))
            uc.mem_write(hero + 0x44 + kind * 4, struct.pack("<i", 1000 + index * 10))
        uc.emu_start(BASE + 0x1D3472, BASE + 0x1D3621, count=10000)
        return tuple(struct.unpack("<i", uc.mem_read(hero + 0x44 + t * 4, 4))[0] for t in FIELDS)

    def test_original_bug_reproduces_only_magic_defense_maximum(self):
        result = self.later_rate_pass(self.source, 10)
        self.assertEqual(result[:11], tuple(1000 + i * 10 for i in range(11)))
        self.assertEqual(result[11], 1331)

    def test_all_defense_and_three_maximum_attacks_gain_rate(self):
        selected = {3, 5, 7, 8, 9, 10, 11}
        for rate in (1, 10, 50, 100):
            with self.subTest(rate=rate):
                expected = []
                for index in range(12):
                    old = 1000 + index * 10
                    value = old + 100
                    gain = struct.unpack("<f", struct.pack("<f", value * (rate / 100)))[0]
                    expected.append(value + int(gain) if index in selected else old)
                self.assertEqual(self.later_rate_pass(self.patched, rate), tuple(expected))

    def test_zero_or_negative_rate_does_not_change_any_attribute(self):
        for rate in (0, -10):
            self.assertEqual(self.later_rate_pass(self.patched, rate), tuple(1000 + i * 10 for i in range(12)))

    def test_initial_base_rate_handles_all_twelve_fields(self):
        from unicorn.x86_const import UC_X86_REG_RSP, UC_X86_REG_RCX, UC_X86_REG_XMM1
        uc = self.machine(self.patched)
        stack, calc, stop = 0x10004008, 0x10009000, BASE + 0x5F0000
        uc.mem_write(stack, struct.pack("<Q", stop))
        uc.reg_write(UC_X86_REG_RSP, stack)
        uc.reg_write(UC_X86_REG_RCX, calc)
        uc.reg_write(UC_X86_REG_XMM1, int.from_bytes(struct.pack("<f", 0.1) + b"\0" * 12, "little"))
        for kind in FIELDS:
            uc.mem_write(calc + kind * 4, struct.pack("<i", 1000))
        uc.emu_start(BASE + 0x1F4C0, stop, count=10000)
        for kind in FIELDS:
            self.assertEqual(struct.unpack("<i", uc.mem_read(calc + kind * 4, 4))[0], 100)

    def test_generic_actor_percent_pass_handles_all_twelve_fields(self):
        from unicorn.x86_const import UC_X86_REG_RSP, UC_X86_REG_RCX, UC_X86_REG_RDX, UC_X86_REG_R8
        uc = self.machine(self.patched)
        stack, calc, source, stop = 0x10004008, 0x10008000, 0x10009000, BASE + 0x5F0000
        uc.mem_write(stack, struct.pack("<Q", stop))
        for register, value in ((UC_X86_REG_RSP, stack), (UC_X86_REG_RCX, calc),
                                (UC_X86_REG_RDX, source), (UC_X86_REG_R8, 0)):
            uc.reg_write(register, value)
        for kind in FIELDS:
            uc.mem_write(calc + kind * 4, struct.pack("<i", 1000))
            uc.mem_write(source + kind * 4, struct.pack("<i", 1000))
            uc.mem_write(calc + (kind + 1) * 4, struct.pack("<f", 0.1))
        uc.emu_start(BASE + 0x20850, stop, count=10000)
        for kind in FIELDS:
            self.assertEqual(struct.unpack("<i", uc.mem_read(calc + kind * 4, 4))[0], 1100)
            self.assertEqual(bytes(uc.mem_read(calc + (kind + 1) * 4, 4)), b"\0" * 4)

    def test_only_reviewed_block_changes_and_package_matches(self):
        import pefile
        offset = pefile.PE(data=self.source).get_offset_from_rva(CONDITION_RVA)
        self.assertEqual(len(self.source), len(self.patched))
        self.assertEqual(self.source[:offset], self.patched[:offset])
        self.assertEqual(self.source[offset + len(OLD):], self.patched[offset + len(OLD):])
        self.assertEqual(patch(self.patched), self.patched)
        package = json.loads(PACKAGE.read_text(encoding="utf-8"))
        result = bytearray(self.source)
        for edit in package["edits"]:
            before, after = base64.b64decode(edit["before"]), base64.b64decode(edit["after"])
            self.assertEqual(result[edit["offset"]:edit["offset"] + len(before)], before)
            result[edit["offset"]:edit["offset"] + len(after)] = after
        self.assertEqual(result, self.patched)
        self.assertEqual(hashlib.sha256(result).hexdigest(), package["targetSha256"])
        with self.assertRaises(ValueError):
            patch(self.source[:-1] + bytes([self.source[-1] ^ 1]))


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--deps", type=Path)
    args = parser.parse_args()
    if args.deps:
        sys.path.insert(0, str(args.deps))
    unittest.main(argv=[sys.argv[0]], verbosity=2)
