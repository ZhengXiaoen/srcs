"""Replay real equipment properties, overlap, wear and failure paths offline."""
import argparse
import base64
import hashlib
import json
from pathlib import Path
import struct
import subprocess
import sys
import unittest

parser = argparse.ArgumentParser(add_help=False)
parser.add_argument('--deps',type=Path)
parser.add_argument('--binary',type=Path)
parser.add_argument('--package',type=Path)
options, remaining = parser.parse_known_args()
if options.deps: sys.path.insert(0,str(options.deps))
from test_item_count_u16_native import (
    Machine, BASE, HEAP, STOP, unpack, p64, unchanged,
    UC_X86_REG_RCX,UC_X86_REG_RDX,UC_X86_REG_R8,UC_X86_REG_R9,UC_X86_REG_RSP)
from patch_all_equipment_native import ROOT, SERVER, SOURCE_HASH, LEGACY_HASHES, HOOKS, patch, restore, equipment_package

BINARY = options.binary or SERVER
PACKAGE = options.package or ROOT/'Server/S1001/x64/equipment-stack.patch.json'


class EquipmentMachine(Machine):
    def __init__(self,kind=1):
        super().__init__(BINARY)
        self.u.mem_write(self.std+0x30,bytes([kind]))
        self.extra_allowed = [(0x328660,0x328b40),(0x286bc0,0x286c20),
                              (0x2eed0,0x2ef00),(0x2a8dd0,0x2a8f70)]
        self.default_strength = 0

    def plain(self,count,guid,bind=1):
        ptr = self.add(count,guid,bind)
        data = bytearray(129)
        data[:8]=p64(guid); data[8:10]=struct.pack('<H',1000);data[0x2e]=bind
        self.u.mem_write(ptr,bytes(data)); self.setcount(ptr,count)
        return ptr

    def hook(self,u,address,size,data):
        if address-BASE==0x2a8dd0:
            return  # Execute the original strengthen comparison.
        if address-BASE==0x196aa0:
            self.ret(self.default_strength);return
        if address-BASE==0x2aa9b0:
            # Model the real constructor's configured durability for plain gear.
            ptr=u.reg_read(UC_X86_REG_RCX)
            kind=self.read(self.std+0x30,1)[0]
            if kind!=115: self.u.mem_write(ptr+0xd,self.read(self.std+0x38,2)*2)
            self.u.mem_write(ptr+0x19,self.read(self.std+0x68,4))
            self.ret();return
        super().hook(u,address,size,data)


class WearMachine(EquipmentMachine):
    def __init__(self,count=9999,kind=1,magic=False):
        super().__init__(kind)
        self.magic=magic;self.allow=True;self.event=True;self.old_return=True
        self.hero=kind>200
        self.real_takeoff=False
        self.equipment=HEAP+0x8000;self.actor=HEAP+0x8500;self.guid=HEAP+0x8600
        self.equipvtable=HEAP+0x8700;self.responses=[];self.worn=[];self.removals=[]
        self.u.mem_write(self.equipment,p64(self.equipvtable))
        self.u.mem_write(self.equipment+8,p64(self.actor) if magic else p64(0))
        self.u.mem_write(self.equipvtable,p64(STOP+0x200)+p64(STOP+0x208))
        self.u.mem_write(BASE+0x3f7550,p64(STOP+0x210))
        self.source=self.plain(count,42)
        self.u.mem_write(self.guid,p64(42))
        self.u.mem_write(self.container+0x31,b'\x01')
        self.u.mem_write(self.container+0x38,p64(self.actor))
        self.u.mem_write(self.container+0x48,p64(self.actor))
        self.extra_allowed += [(0x283a30,0x2845d0),(0x285c80,0x286700),(0x1e7370,0x1e771a)]

    def hook(self,u,address,size,data):
        rva=address-BASE
        rcx,rdx,r8,r9=(u.reg_read(reg) for reg in
            (UC_X86_REG_RCX,UC_X86_REG_RDX,UC_X86_REG_R8,UC_X86_REG_R9))
        if address==STOP+0x200:
            self.worn.append((r8,r9,self.count(r9))); self.ret();return
        if address==STOP+0x208:
            self.worn.append(('off',r8,self.count(r8)));self.ret();return
        if address==STOP+0x210:
            self.ret();return
        if rva==0x2e670:self.ret(self.container);return
        if rva==0x2a8650:
            found=next((i for i,(guid,_) in enumerate(self.items.items()) if guid==rdx),-1)
            self.ret(found);return
        if rva==0x286960:self.ret(0 if self.allow else 0x57);return
        if rva==0x2845e0:self.ret(int(self.event));return
        if rva==0x283870:self.ret(0 if self.allow else 0x57);return
        if rva==0x00d9a0:self.ret(0);return
        if rva==0x00e000:self.ret(100);return
        if rva==0x3fdc0:self.ret(0);return
        if rva in (0x3c5894,0x288300,0x080900,0x1e9790,0x16d9f0,0x2e5f0,0x297eb0):self.ret(0);return
        if rva==0x2300e0:self.responses.append(rdx);self.ret(0);return
        if rva==0x2a82c0:
            guid,ptr=list(self.items.items())[rdx]
            self.removals.append((guid,self.count(ptr)))
            del self.items[guid];self.freegrids+=1;self.ret(1);return
        if rva==0x284c40:
            if self.real_takeoff:return
            if not self.old_return:self.ret(0);return
            oldguid=unpack(self.read(r8,8));self.items[oldguid]=r8;self.freegrids-=1
            self.u.mem_write(self.equipment+8,p64(0));self.ret(1);return
        if rva==0x1e8110:self.worn.append((0,rdx,self.count(rdx)));self.ret(1);return
        if rva==0x1e77b0:
            if self.real_takeoff:return
            self.ret(int(self.old_return));return
        if rva==0x285c10:self.ret(0);return
        if rva==0x2528e0:self.ret(0);return
        if rva==0x1e8090:
            self.worn.append(('off',rdx,self.count(rdx)))
            self.u.mem_write(self.equipment+0x60,p64(0));self.ret();return
        if rva in (0x22d3f0,):self.ret(HEAP+0x8800);return
        if rva==0x00bd30:self.responses.append(rdx);self.ret(rcx);return
        if rva==0x22da10:self.ret(0);return
        if rva==0x2a8250:
            ptr=self.items.get(rdx)
            if ptr:self.removals.append((rdx,self.count(ptr)));self.freegrids+=1
        super().hook(u,address,size,data)

    def wear(self):
        if self.magic:return self.run(0x1e7370,self.equipment,self.guid)&255
        return self.run(0x283a30,self.equipment,self.actor,self.guid,int(self.hero),0)&255


class TreasureMachine(EquipmentMachine):
    """Execute AddItemToStore, with actor/config/notification IO mocked."""
    def __init__(self,kind=106):
        super().__init__(kind)
        self.store=HEAP+0x9000
        self.u.mem_write(self.store+8,p64(HEAP+0x8500))
        self.u.mem_write(self.store+0x18,self.read(self.container,0x90))
        self.container=self.store+0x18
        self.extra_allowed += [(0x18d2f0,0x18d423)]
        self.added=[]

    def hook(self,u,address,size,data):
        if address-BASE in (0x21000,0x1ee30,0x16d9f0):
            self.ret();return
        if address-BASE==0x2a63f0:
            self.added.append((u.reg_read(UC_X86_REG_RCX),
                               self.read(u.reg_read(UC_X86_REG_RDX),36)))
        super().hook(u,address,size,data)

    def reward(self,count,bind=1):
        self.run(0x18d2f0,self.store,1000,count,0,0,bind,1,HEAP+0x9500,0)


class NativeEquipmentTests(unittest.TestCase):
    def reward(self,m,count,bind=1,item_id=1000):
        op=HEAP+0x7000;payload=bytearray(36)
        payload[2:4]=struct.pack('<H',item_id);payload[4]=bind
        payload[6:8]=struct.pack('<H',count);m.u.mem_write(op,bytes(payload))
        return m.run(0x2a63f0,m.container,op,0,0,0)

    def test_non_equipment_templates_merge_and_keep_original_strength_check(self):
        for kind in (0,93,101,102,103,106,107,114,116,119,131,200,206,255):
            with self.subTest(kind=kind):
                m=EquipmentMachine(kind);a=m.plain(80,1)
                op=HEAP+0x7000;payload=bytearray(36)
                payload[2:4]=struct.pack('<H',1000);payload[4]=1
                m.u.mem_write(op,bytes(payload));before=m.read(a,129)
                self.assertEqual(9919,m.run(0x2a8c40,m.container,op,a))
                self.assertEqual(before,m.read(a,129))
                m.u.mem_write(a+0xc,b'\x01')
                self.assertEqual(0,m.run(0x2a8c40,m.container,op,a))

    def test_xianli_repeated_eighty_rewards_merge_and_split_at_9999(self):
        for item_id in (7151,7152,7153):
            m=EquipmentMachine(102)
            for n in range(1,126):
                self.assertEqual(80,self.reward(m,80,item_id=item_id))
                counts=[m.count(p) for p in m.items.values()]
                self.assertEqual(80*n,sum(counts))
                self.assertEqual((80*n+9998)//9999,len(counts))
                self.assertTrue(all(c<=9999 for c in counts))
                for p in m.items.values():
                    self.assertEqual(item_id,unpack(m.read(p+8,2)))
            self.assertEqual([9999,1],counts)

    def test_material_rewards_merge_in_full_bag_and_separate_binding(self):
        for kind in (102,106):
            m=EquipmentMachine(kind);a=m.plain(80,1);m.freegrids=0
            self.assertEqual(80,self.reward(m,80));self.assertEqual(160,m.count(a))
            self.assertEqual(0,self.reward(m,80,bind=0));self.assertEqual(160,m.count(a))
            m.setcount(a,9990)
            self.assertEqual(9,self.reward(m,80));self.assertEqual(9999,m.count(a))
            self.assertEqual(0,self.reward(m,80));self.assertEqual(9999,m.count(a))
            m.freegrids=1
            self.assertEqual(80,self.reward(m,80,bind=0))
            self.assertEqual(80,self.reward(m,80,bind=0))
            self.assertEqual([9999,160],[m.count(p) for p in m.items.values()])

    def test_treasure_entry_merges_repeated_rewards_and_preserves_count_limits(self):
        for kind in (102,106):
            m=TreasureMachine(kind)
            for n in range(1,5):
                m.reward(80)
                self.assertEqual([80*n],[m.count(p) for p in m.items.values()])
                container,param=m.added[-1]
                self.assertEqual(m.container,container)
                self.assertEqual(80,unpack(param[6:8]))
            m.setcount(next(iter(m.items.values())),9990)
            m.reward(80)
            self.assertEqual([9999,71],[m.count(p) for p in m.items.values()])
            m.freegrids=0;m.reward(80)
            self.assertEqual([9999,151],[m.count(p) for p in m.items.values()])
            m.reward(80,bind=0)
            self.assertEqual([9999,151],[m.count(p) for p in m.items.values()])

    def test_explicit_overlap_uses_every_real_dynamic_property_and_keeps_payloads(self):
        # Each field affects one actual getter, rather than a simulated attribute map.
        offsets=[0xa,0xb,0xc,*range(0x11,0x19),*range(0x1d,0x2d),0x2f,
                 0x30,0x31,0x34,0x35,*range(0x36,0x3d),*range(0x62,0x67),0xd,0xf]
        for kind in (1,5,13,40,64,115,120,121,122,126,130,201):
            for offset in offsets:
                with self.subTest(kind=kind,offset=offset):
                    m=EquipmentMachine(kind);a=m.plain(3,1);b=m.plain(8,2)
                    m.u.mem_write(a+offset,b'\x01')
                    before=(m.read(a,129),m.read(b,129))
                    self.assertEqual(0,m.run(0x2a8ae0,m.container,a,b))
                    self.assertEqual(before,(m.read(a,129),m.read(b,129)))
        m=EquipmentMachine();a=m.plain(256,1,1);b=m.plain(255,2,9)
        self.assertEqual(9744,m.run(0x2a8ae0,m.container,a,b))
        self.assertEqual(1,m.run(0x2a6f20,m.container,1,2)&255)
        self.assertEqual(511,m.count(b))

    def test_special_soul_never_merges_even_when_both_equipment_items_match(self):
        for kind in (1,2,3,4,6,7,8,9):
            m=EquipmentMachine(kind);a=m.plain(3,1);b=m.plain(8,2)
            for ptr in (a,b):m.u.mem_write(ptr+0x25,struct.pack('<I',0x01000064))
            self.assertEqual(0,m.run(0x2a8ae0,m.container,a,b))
        m=EquipmentMachine(130);a=m.plain(3,1);b=m.plain(8,2)
        for ptr in (a,b):m.u.mem_write(ptr+0x25,struct.pack('<I',0x01000064))
        self.assertEqual(9991,m.run(0x2a8ae0,m.container,a,b))

    def test_actual_item_add_preserves_custom_attributes_and_full_bag_rollback(self):
        # AddUserItem historically reduced the source to a reward template. Run
        # its complete merge path: matching instances must work without a grid,
        # while a different or soul instance must retain every unaccepted unit.
        for kind in (1,40,115,120,122,126,130,201):
            for different,free in ((False,0),(True,0),(True,1)):
                m=EquipmentMachine(kind);a=m.plain(256,1);b=m.plain(999,2)
                m.u.mem_write(a+0x21,struct.pack('<I',37))
                m.u.mem_write(b+0x21,struct.pack('<I',38 if different else 37))
                del m.items[1];m.freegrids=free
                before=(m.read(a,129),m.read(b,129))
                added=m.run(0x2a71e0,m.container,a,0,0,0,0,0,0)
                accepted=not different or free>0
                self.assertEqual(256 if accepted else 0,added,(kind,different,free))
                self.assertEqual(1255 if accepted else 999,sum(m.count(p) for p in m.items.values()))
                if not different:self.assertIn(a,m.destroyed)
                else:
                    self.assertNotIn(a,m.destroyed)
                    self.assertEqual(before[0],m.read(a,129))
                unchanged(before[1],m.read(b,129))
        for free in (0,1):
            m=EquipmentMachine();a=m.plain(1,1);b=m.plain(999,2)
            for ptr in (a,b):m.u.mem_write(ptr+0x25,struct.pack('<I',0x01000064))
            del m.items[1];m.freegrids=free
            self.assertEqual(free,m.run(0x2a71e0,m.container,a,0,0,0,0,0,0))
            self.assertEqual(999,m.count(b))

    def test_runes_compare_active_values_and_ignore_inactive_payload(self):
        for slot in range(5):
            m=EquipmentMachine(120);a=m.plain(3,1);b=m.plain(8,2)
            off=0x67+5*slot
            m.u.mem_write(a+off+1,bytes.fromhex('0000c07f'))
            self.assertEqual(9991,m.run(0x2a8ae0,m.container,a,b))
            m.u.mem_write(a+off,b'\x01');m.u.mem_write(b+off,b'\x01')
            self.assertEqual(0,m.run(0x2a8ae0,m.container,a,b))
            for ptr in (a,b):m.u.mem_write(ptr+off+1,struct.pack('<f',2.5))
            self.assertEqual(9991,m.run(0x2a8ae0,m.container,a,b))
            m.u.mem_write(b+off+1,struct.pack('<f',3.5))
            self.assertEqual(0,m.run(0x2a8ae0,m.container,a,b))
        # Other equipment systems have no rune slots.
        m=EquipmentMachine(1);a=m.plain(3,1);b=m.plain(8,2)
        m.u.mem_write(a+0x67,b'\x01')
        self.assertEqual(9991,m.run(0x2a8ae0,m.container,a,b))

    def test_template_rewards_do_not_merge_into_custom_or_soul_equipment(self):
        for kind in (1,5,40,64,120,122,130,201):
            for offset in (0x11,0x17,0x1d,0x21,0x25,0x29,0x2f,0x30,0x34,0x36,0x38,0x3c,0x63):
                m=EquipmentMachine(kind);a=m.plain(8,1)
                op=HEAP+0x7000;payload=bytearray(36);payload[2:4]=struct.pack('<H',1000);payload[4]=1
                m.u.mem_write(op,bytes(payload))
                self.assertEqual(9991,m.run(0x2a8c40,m.container,op,a))
                m.u.mem_write(a+offset,b'\x01')
                self.assertEqual(0,m.run(0x2a8c40,m.container,op,a),(kind,offset))

    def test_ordinary_and_hero_wear_keep_selected_guid_and_one_unit(self):
        for kind in (1,2,3,4,5,6,7,8,9,10,11,13,40,64,92,201,205):
            for count in (1,2,255,256,9999):
                m=WearMachine(count,kind)
                before=m.read(m.source,129)
                self.assertEqual(1,m.wear(),(kind,count))
                self.assertEqual([(42,1)],m.removals)
                self.assertEqual(1,m.count(m.source))
                self.assertEqual(count-1,sum(m.count(p) for p in m.items.values()))
                self.assertNotIn(m.source,m.destroyed)
                unchanged(before,m.read(m.source,129),skip=(0x2d,0x80,0x33))
                for ptr in m.items.values():
                    unchanged(before,m.read(ptr,129),skip=tuple(range(8))+(0x2d,0x80,0x33))

    def test_wear_full_bag_and_failures_preserve_every_unit(self):
        m=WearMachine(9999);m.freegrids=0
        self.assertEqual(1,m.wear());self.assertEqual(9998,sum(m.count(p) for p in m.items.values()))
        for mode in ('allow','event','allocation','old_return','full'):
            m=WearMachine(9999);before=m.read(m.source,129)
            if mode=='allocation':m.allocfail=0
            elif mode in ('old_return','full'):
                old=m.plain(1,99);del m.items[99]
                m.u.mem_write(m.equipment+8,p64(old))
                if mode=='full':m.freegrids=0
                else:m.old_return=False
            else:setattr(m,mode,False)
            self.assertEqual(0,m.wear(),mode)
            self.assertEqual(before,m.read(m.source,129),mode)
            self.assertEqual(9999,sum(m.count(p) for p in m.items.values()))
            self.assertFalse(m.worn)

    def test_magic_equipment_stack_wear_and_failed_validation(self):
        for count in (1,2,256,9999):
            m=WearMachine(count,115,True)
            self.assertEqual(1,m.wear())
            self.assertEqual([(42,1)],m.removals)
            self.assertEqual(count-1,sum(m.count(p) for p in m.items.values()))
        for mode in ('allow','allocation','full'):
            m=WearMachine(9999,115,True);before=m.read(m.source,129)
            if mode=='allow':m.allow=False
            elif mode=='allocation':m.allocfail=0
            else:m.freegrids=0;m.u.mem_write(m.equipment+0x60,p64(HEAP+0x8900))
            self.assertEqual(0,m.wear())
            self.assertEqual(before,m.read(m.source,129))

    def test_takeoff_with_native_merge_does_not_read_freed_pointer(self):
        for kind,magic in ((1,False),(201,False),(115,True)):
            for free,different,soul in ((0,False,False),(0,True,False),(0,False,True),(1,True,False)):
                if soul and kind!=1:continue
                m=WearMachine(1,kind,magic);m.real_takeoff=True
                m.extra_allowed += [(0x2849d0,0x284dc0)]
                del m.items[42]
                m.u.mem_write(m.equipment+(0x60 if magic else 8),p64(m.source))
                target=m.plain(200,99)
                if different:m.u.mem_write(target+0x21,b'\x01')
                if soul:
                    for ptr in (m.source,target):m.u.mem_write(ptr+0x25,struct.pack('<I',0x01000064))
                m.freegrids=free;before=m.read(m.source,129)
                if magic:result=m.run(0x1e77b0,m.equipment,m.source)&255
                else:result=m.run(0x284c40,m.equipment,m.actor,m.source,1,int(m.hero))&255
                success=free>0 or not (different or soul)
                self.assertEqual(int(success),result,(kind,free,different,soul))
                self.assertEqual(200+int(success),sum(m.count(ptr) for ptr in m.items.values()))
                if success:
                    self.assertIn(m.source,m.destroyed)
                    self.assertEqual(('off',m.source,1),m.worn[0])
                    self.assertEqual(0,unpack(m.read(m.equipment+(0x60 if magic else 8),8)))
                else:
                    self.assertNotIn(m.source,m.destroyed)
                    self.assertEqual(before,m.read(m.source,129))

    def test_patch_package_replays_preserves_unrelated_code_and_rebuilds(self):
        result=BINARY.read_bytes();source=restore(result)
        self.assertEqual(SOURCE_HASH,hashlib.sha256(source).hexdigest())
        self.assertEqual(result,patch(source));self.assertEqual(result,patch(result))
        p=json.loads(PACKAGE.read_text('utf-8'))
        replay=bytearray(source+b'\0'*(p['targetLength']-len(source)))
        for e in p['edits']:
            before,after=(base64.b64decode(e[k]) for k in ('before','after'))
            self.assertEqual(before,source[e['offset']:e['offset']+len(before)])
            replay[e['offset']:e['offset']+len(after)]=after
        self.assertEqual(result,replay)
        for upgrade in p.get('upgrades',[]):
            legacy=bytearray(result[:upgrade['sourceLength']])
            for edit in upgrade['edits']:
                before=base64.b64decode(edit['before'])
                legacy[edit['offset']:edit['offset']+len(before)]=before
            self.assertIn(hashlib.sha256(legacy).hexdigest(),LEGACY_HASHES)
            self.assertEqual(source,restore(bytes(legacy)))
            self.assertEqual(result,patch(bytes(legacy)))
            upgraded=bytearray(legacy+b'\0'*(upgrade['targetLength']-len(legacy)))
            for edit in upgrade['edits']:
                before,after=(base64.b64decode(edit[k]) for k in ('before','after'))
                self.assertEqual(before,legacy[edit['offset']:edit['offset']+len(before)])
                upgraded[edit['offset']:edit['offset']+len(after)]=after
            self.assertEqual(result,upgraded)
        self.assertEqual(p,equipment_package(result,result,p))
        corrupt=bytearray(result);corrupt[-1]^=1
        with self.assertRaises(ValueError):patch(bytes(corrupt))
        from pefile import PE
        old,new=PE(data=source),PE(data=result)
        for section in old.sections[:-1]:
            a=old.get_data(section.VirtualAddress,section.Misc_VirtualSize)
            b=bytearray(new.get_data(section.VirtualAddress,section.Misc_VirtualSize))
            if section.Name.startswith(b'.text'):
                for rva,before in HOOKS.items():
                    start=rva-section.VirtualAddress;b[start:start+len(before)]=before
            self.assertEqual(a,b)
        directory=new.OPTIONAL_HEADER.DATA_DIRECTORY[3]
        records=[struct.unpack('<III',new.get_data(directory.VirtualAddress+i,12))
                 for i in range(0,directory.Size,12)]
        self.assertEqual(sorted(records),records)


if __name__=='__main__': unittest.main(argv=[sys.argv[0],*remaining],verbosity=2)
