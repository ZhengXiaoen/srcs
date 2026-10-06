"""Run the actual warrior reset and attack-rate instructions in an x64 emulator."""

import argparse
import hashlib
import json
import struct
import sys
import unittest

from patch_warrior_attack_rate import PACKAGE, SOURCE_HASH, patch, restore_package
from patch_warrior_survival_rate import BASE, SERVER, PACKAGE as SURVIVAL_PACKAGE
import test_warrior_defense_rate as previous

FIELDS = previous.FIELDS

ATTACKS = (9, 11, 13, 15, 17, 19)


def f32(value):
    return struct.unpack('<f', struct.pack('<f', value))[0]


def rated(value, rate):
    return value + int(f32(f32(value)*f32(f32(rate)/100)))


class AttackRateTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.description = json.loads(PACKAGE.read_text(encoding='utf-8'))
        cls.source = SERVER.read_bytes()
        if hashlib.sha256(cls.source).hexdigest() == cls.description['targetSha256']:
            cls.source = restore_package(cls.source, cls.description)
        assert hashlib.sha256(cls.source).hexdigest() == SOURCE_HASH
        cls.result = patch(cls.source)

    def reset(self, source, rates, base_values, fixed_values, extra_values=None, actor_percent=0):
        from unicorn import UC_HOOK_CODE
        from unicorn.x86_const import (UC_X86_REG_RSP, UC_X86_REG_RCX, UC_X86_REG_RDX,
            UC_X86_REG_R8, UC_X86_REG_R9, UC_X86_REG_RAX, UC_X86_REG_RIP)
        uc = previous.WarriorAttributeTests().machine(source)
        stack, system, actor, cfg, hero = 0x10004008, 0x10009000, 0x1000a000, 0x1000b000, 0x10011000
        stop = BASE + 0x5f0000
        uc.reg_write(UC_X86_REG_RSP, stack)
        uc.reg_write(UC_X86_REG_RCX, system)
        uc.reg_write(UC_X86_REG_RDX, hero)
        uc.reg_write(UC_X86_REG_R8, 0)
        uc.reg_write(UC_X86_REG_R9, 0)
        uc.mem_write(stack, struct.pack('<Q', stop))
        uc.mem_write(system+8, struct.pack('<Q', actor))
        for kind, value in base_values.items():
            uc.mem_write(cfg+kind*4, struct.pack('<i', value))
        for slot, rate in enumerate(rates):
            item = 0x1000d000+slot*0x80
            uc.mem_write(hero+0xc60+slot*8+8, struct.pack('<Q', item))
            uc.mem_write(item+0x16, bytes([rate]))
        ignored = {0x1d80d0, 0x287110, 0x5f090, 0xe000, 0x1d6b60}
        returned = {0xe7b0: 0x1000f000, 0x14a90: 0x1000f100,
                    0x147e0: 0x1000f200, 0x14740: cfg, 0xded0: 0x1000f300, 0x62420: 0x1000f400}
        def return_from_call(value=0):
            sp = uc.reg_read(UC_X86_REG_RSP)
            ret = struct.unpack('<Q', uc.mem_read(sp, 8))[0]
            uc.reg_write(UC_X86_REG_RAX, value)
            uc.reg_write(UC_X86_REG_RSP, sp+8)
            uc.reg_write(UC_X86_REG_RIP, ret)
        def add_values(ptr, values):
            for kind, value in values.items():
                old = struct.unpack('<i', uc.mem_read(ptr+kind*4, 4))[0]
                uc.mem_write(ptr+kind*4, struct.pack('<i', old+value))
        def external_call(uc, pc, size, user):
            rva = pc-BASE
            if rva in ignored:
                return_from_call()
            elif rva in returned:
                return_from_call(returned[rva])
            elif rva == 0x3c5576:
                ptr = uc.reg_read(UC_X86_REG_RCX)
                uc.mem_write(ptr, bytes([uc.reg_read(UC_X86_REG_RDX)&255])*uc.reg_read(UC_X86_REG_R8))
                return_from_call(ptr)
            elif rva == 0x284d10:
                ptr = uc.reg_read(UC_X86_REG_RDX)
                add_values(ptr, fixed_values)
                for kind in ATTACKS:
                    uc.mem_write(ptr+(kind+1)*4, struct.pack('<f', actor_percent))
                return_from_call(ptr)
            elif rva == 0x189eb0:
                ptr = uc.reg_read(UC_X86_REG_R9)
                add_values(ptr, extra_values or {})
                return_from_call(ptr)
        uc.hook_add(UC_HOOK_CODE, external_call)
        uc.emu_start(BASE+0x1d3080, stop, count=150000)
        self.assertEqual(uc.reg_read(UC_X86_REG_RIP), stop, 'Reset must return normally')
        return {kind: struct.unpack('<i', uc.mem_read(hero+0x44+kind*4, 4))[0] for kind in FIELDS}

    def test_ten_percent_scales_attack_minimum_and_maximum_once(self):
        base = {kind: 1000 if index%2==0 else 3000 for index, kind in enumerate(ATTACKS)}
        fixed = {kind: 50 if index%2==0 else 150 for index, kind in enumerate(ATTACKS)}
        extra = {kind: 200 if index%2==0 else 600 for index, kind in enumerate(ATTACKS)}
        result = self.reset(self.result, [10], base, fixed, extra)
        for minimum, maximum in zip(ATTACKS[::2], ATTACKS[1::2]):
            self.assertEqual(result[minimum], 1375)
            self.assertEqual(result[maximum], 4125)
            self.assertEqual(result[maximum], 3*result[minimum])

    def test_zero_and_five_equipment_rates_add_instead_of_compounding(self):
        base = {kind: 1000+i*333 for i, kind in enumerate(FIELDS)}
        fixed = {kind: 50+i*13 for i, kind in enumerate(FIELDS)}
        for rates in ([], [0], [1], [10], [10]*5, [20]*5):
            result = self.reset(self.result, rates, base, fixed)
            for kind in ATTACKS:
                self.assertEqual(result[kind], rated(base[kind]+fixed[kind], sum(rates)), (rates,kind))
        self.assertEqual(self.reset(self.result, [10]*5, {9:1000, 11:3000}, {})[11], 4500)

    def test_previous_attack_maximum_inflation_reproduces(self):
        survival = json.loads(SURVIVAL_PACKAGE.read_text(encoding='utf-8'))
        prior = restore_package(self.source, survival)
        base = {9:1000, 11:3000}; fixed = {9:50, 11:150}
        previous = self.reset(prior, [10]*5, base, fixed)
        corrected = self.reset(self.result, [10]*5, base, fixed)
        self.assertEqual(previous[9], 1550)  # Fixed lower attack misses the rate.
        self.assertEqual(previous[11], 11475)  # 3.825 times the base upper attack.
        self.assertEqual(corrected[9], 1575)
        self.assertEqual(corrected[11], 4725)

    def test_survival_values_unchanged_and_mana_excluded(self):
        base = {kind: 1000+i*100 for i,kind in enumerate(FIELDS)}
        fixed = {kind: 50+i*10 for i,kind in enumerate(FIELDS)}
        for rates in ([], [10], [10]*5):
            old = self.reset(self.source, rates, base, fixed)
            new = self.reset(self.result, rates, base, fixed)
            for kind in (5,7,21,23,25,27):
                self.assertEqual(new[kind], old[kind], (rates,kind))

    def test_generic_actor_percentage_still_applies_after_equipment_rate(self):
        result = self.reset(self.result, [10], {kind:1000 for kind in ATTACKS}, {}, actor_percent=0.1)
        # Native actor percentages use the existing pre-rate snapshot, adding
        # 100 here. Keep this separate rate source and its basis unchanged.
        for kind in ATTACKS: self.assertEqual(result[kind], 1200)
        case = previous.WarriorAttributeTests()
        case.patched = self.result
        case.test_generic_actor_percent_pass_handles_all_twelve_fields()

    def test_patch_package_and_unwind_metadata(self):
        import base64
        import pefile
        result = bytearray(self.source)
        changed = set()
        for edit in self.description['edits']:
            before, after = base64.b64decode(edit['before']), base64.b64decode(edit['after'])
            self.assertEqual(self.source[edit['offset']:edit['offset']+len(before)], before)
            result[edit['offset']:edit['offset']+len(after)] = after
            changed.update(range(edit['offset'], edit['offset']+len(after)))
        self.assertEqual(bytes(result), self.result)
        self.assertEqual(hashlib.sha256(result).hexdigest(), self.description['targetSha256'])
        self.assertEqual(len(self.source), len(self.result))
        self.assertTrue(all(a==b or i in changed for i,(a,b) in enumerate(zip(self.source,self.result))))
        self.assertEqual(patch(self.result), self.result)
        old, new = pefile.PE(data=self.source), pefile.PE(data=self.result)
        old_dir, new_dir = old.OPTIONAL_HEADER.DATA_DIRECTORY[3], new.OPTIONAL_HEADER.DATA_DIRECTORY[3]
        self.assertEqual(new_dir.Size, old_dir.Size+12)
        start,end,unwind = struct.unpack('<III', new.get_data(new_dir.VirtualAddress+old_dir.Size,12))
        self.assertGreater(start, struct.unpack('<I',old.get_data(old_dir.VirtualAddress+old_dir.Size-12,4))[0])
        self.assertGreater(end,start)
        self.assertEqual(new.get_data(unwind,4), bytes.fromhex('01 00 00 00'))
        with self.assertRaises(ValueError): patch(self.source[:-1]+bytes([self.source[-1]^1]))


if __name__ == '__main__':
    parser = argparse.ArgumentParser(); parser.add_argument('--deps'); args = parser.parse_args()
    if args.deps: sys.path.insert(0, args.deps)
    unittest.main(argv=[sys.argv[0]], verbosity=2)
