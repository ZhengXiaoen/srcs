"""Execute both native warrior rate stages with health/defense-only behavior."""
import argparse
import base64
import hashlib
import json
from pathlib import Path
import struct
import sys
import unittest

import test_warrior_defense_rate as previous
from patch_warrior_survival_rate import SERVER, PACKAGE, SECTION, BASE, SOURCE_HASH, patch


class SurvivalRateTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        import pefile
        cls.source=SERVER.read_bytes()
        cls.package=json.loads(PACKAGE.read_text(encoding='utf-8'))
        if hashlib.sha256(cls.source).hexdigest()==cls.package['targetSha256']:
            data=bytearray(cls.source)
            for edit in reversed(cls.package['edits']):
                before=base64.b64decode(edit['before'])
                data[edit['offset']:edit['offset']+len(before)]=before
            cls.source=bytes(data[:cls.package['sourceLength']])
        assert hashlib.sha256(cls.source).hexdigest()==SOURCE_HASH
        cls.result=patch(cls.source)
        cls.rva=next(s.VirtualAddress for s in pefile.PE(data=cls.result).sections if s.Name.rstrip(b'\0')==SECTION)

    def test_initial_base_rate_adds_only_health_and_four_defense_fields(self):
        from unicorn import UC_HOOK_CODE
        from unicorn.x86_const import UC_X86_REG_RSP,UC_X86_REG_RCX,UC_X86_REG_RDX,UC_X86_REG_R8,UC_X86_REG_RAX,UC_X86_REG_RIP
        for rate in (0,10,100):
            machine=previous.WarriorAttributeTests().machine(self.result)
            stack=0x10004000
            machine.reg_write(UC_X86_REG_RSP,stack)
            machine.mem_write(stack+0x950,struct.pack('<i',rate))
            for kind in previous.FIELDS:
                machine.mem_write(stack+0x40+kind*4,struct.pack('<i',1000))
            def memset(uc,pc,size,user):
                if pc!=BASE+0x3C5576:return
                ptr=uc.reg_read(UC_X86_REG_RCX);n=uc.reg_read(UC_X86_REG_R8)
                uc.mem_write(ptr,bytes([uc.reg_read(UC_X86_REG_RDX)&255])*n)
                sp=uc.reg_read(UC_X86_REG_RSP)
                ret=struct.unpack('<Q',uc.mem_read(sp,8))[0]
                uc.reg_write(UC_X86_REG_RAX,ptr);uc.reg_write(UC_X86_REG_RSP,sp+8);uc.reg_write(UC_X86_REG_RIP,ret)
            machine.hook_add(UC_HOOK_CODE,memset)
            machine.emu_start(BASE+0x1D31BD,BASE+0x1D321C,count=30000)
            for kind in previous.FIELDS:
                expected=1000+(rate*10 if kind in (5,21,23,25,27) else 0)
                self.assertEqual(struct.unpack('<i',machine.mem_read(stack+0x40+kind*4,4))[0],expected,(rate,kind))

    def test_later_rate_adds_only_health_and_four_defense_fields(self):
        case=previous.WarriorAttributeTests()
        for rate in (0,1,10,50,100):
            expected=[]
            for index in range(12):
                old=1000+index*10;value=old+100
                gain=struct.unpack('<f',struct.pack('<f',value*(rate/100)))[0]
                expected.append(value+int(gain) if rate>0 and index in (0,8,9,10,11) else old)
            self.assertEqual(case.later_rate_pass(self.result,rate),tuple(expected))

    def test_generic_actor_attack_percent_remains_unchanged(self):
        case=previous.WarriorAttributeTests()
        case.patched=self.result
        case.test_generic_actor_percent_pass_handles_all_twelve_fields()

    def test_package_preserves_unrelated_bytes_and_native_metadata(self):
        import pefile
        result=bytearray(self.source);result.extend(b'\0'*(self.package['targetLength']-len(result)))
        changed=set()
        for edit in self.package['edits']:
            before=base64.b64decode(edit['before']);after=base64.b64decode(edit['after'])
            self.assertEqual(self.source[edit['offset']:edit['offset']+len(before)],before)
            result[edit['offset']:edit['offset']+len(after)]=after
            changed.update(range(edit['offset'],edit['offset']+len(after)))
        self.assertEqual(bytes(result),self.result)
        self.assertEqual(hashlib.sha256(result).hexdigest(),self.package['targetSha256'])
        self.assertEqual(patch(self.result),self.result)
        self.assertTrue(all(a==b or i in changed for i,(a,b) in enumerate(zip(self.source,self.result))))
        old=pefile.PE(data=self.source);new=pefile.PE(data=self.result)
        self.assertEqual(old.OPTIONAL_HEADER.DATA_DIRECTORY[3].Size+12,new.OPTIONAL_HEADER.DATA_DIRECTORY[3].Size)
        entry=new.get_data(new.OPTIONAL_HEADER.DATA_DIRECTORY[3].VirtualAddress+old.OPTIONAL_HEADER.DATA_DIRECTORY[3].Size,12)
        start,end,unwind=struct.unpack('<III',entry)
        self.assertEqual(start,self.rva);self.assertGreater(end,start)
        self.assertEqual(new.get_data(unwind,8),bytes.fromhex('01 04 01 00 04 42 00 00'))
        with self.assertRaises(ValueError):patch(self.source[:-1]+bytes([self.source[-1]^1]))


if __name__=='__main__':
    parser=argparse.ArgumentParser();parser.add_argument('--deps',type=Path);args=parser.parse_args()
    if args.deps:sys.path.insert(0,str(args.deps))
    unittest.main(argv=[sys.argv[0]],verbosity=2)
