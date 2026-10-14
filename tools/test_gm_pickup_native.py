"""Replay the shipped GM pickup API and original loot/rule bodies offline.

Unicorn executes native instructions; only external Lua/game/CRT boundaries
are modeled. No running server, player, database or network is used.
"""
import functools
from pathlib import Path
import struct
import sys
import unittest

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0,str(ROOT/'tools/fixtures/pickup-test-deps'))
import pefile
from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
from unicorn.x86_const import *
import patch_gm_pickup_native as patcher

BASE, HEAP, STACK, STOP = patcher.BASE, 0x20000000, 0x30000000, 0x40000000


@functools.lru_cache(maxsize=1)
def build():
    data=patcher.SERVER.read_bytes()
    pe=pefile.PE(data=data)
    if any(s.Name==patcher.SECTION for s in pe.sections):
        old=bytearray(data[:patcher.LENGTH])
        for pos,value in patcher.RESTORE.items():old[pos:pos+len(value)]=value
        pos=pe.get_offset_from_rva(patcher.HOOK)
        old[pos:pos+5]=b'\xe8'+struct.pack('<i',0x3c1250-patcher.HOOK-5)
        data=bytes(old)
    return data, patcher.patch(data)


class Replay:
    def __init__(self):
        self.pe=pefile.PE(data=build()[1]);section=self.pe.sections[-1]
        self.reg,self.api,self.rules,self.loot=[BASE+section.VirtualAddress+o for o in [0,0x100,0x500,0x900]]
        self.u=Uc(UC_ARCH_X86,UC_MODE_64)
        image=self.pe.get_memory_mapped_image()
        self.u.mem_map(BASE,(len(image)+4095)&~4095);self.u.mem_write(BASE,image)
        for addr in [HEAP,STACK,STOP]:self.u.mem_map(addr,0x10000)
        self.actor,self.drop,self.item,self.scene=HEAP+0x1000,HEAP+0x5000,HEAP+0x7000,HEAP+0x9000
        self.recog,self.owner,self.camp,self.actor_camp,self.drop_camp,self.cross_camp=123,0,0,0,0,0
        self.active,self.gm,self.cross,self.cross_scene=True,1,False,False
        self.bag_fits,self.trading,self.recovery=True,False,False
        self.present=True;self.query=True;self.arguments={1:self.actor,2:self.drop,3:0}
        self.pushed=[];self.bag=[];self.money=[];self.events=[];self.tips=[];self.registrations=[];self.calls=[]
        self.put(self.actor+0x100,'Q',self.scene);self.put(self.drop+0x100,'Q',self.scene)
        self.put(self.actor+0x110,'II',77,0);self.put(self.drop+0x110,'II',self.recog,3)
        self.put(self.actor+0x1ef8,'Q',self.actor)
        self.put(self.drop+0x240,'Q',self.item);self.put(self.item+8,'H',85)
        self.put(self.item+0x2d,'H',13);self.put(self.item+0x30,'Q',0x0123456789abcdef)
        self.put(self.drop+0x288,'Q',2000);self.put(self.drop+0x290,'Q',1500)
        self.put(self.drop+0x2a0,'Q',900);self.put(self.drop+0x2a8,'B',255)
        self.lists={};self.u.hook_add(UC_HOOK_CODE,self.hook)

    def put(self,addr,fmt,*values):self.u.mem_write(addr,struct.pack('<'+fmt,*values))
    def get(self,addr,fmt):return struct.unpack('<'+fmt,self.u.mem_read(addr,struct.calcsize('<'+fmt)))[0]
    def text(self,addr):
        raw=bytearray()
        while self.u.mem_read(addr,1)!=b'\0':raw.extend(self.u.mem_read(addr,1));addr+=1
        return raw.decode()
    def ret(self,n=0):
        sp=self.u.reg_read(UC_X86_REG_RSP);self.u.reg_write(UC_X86_REG_RAX,n&0xffffffffffffffff)
        self.u.reg_write(UC_X86_REG_RIP,self.get(sp,'Q'));self.u.reg_write(UC_X86_REG_RSP,sp+8)
    def hook(self,u,a,size,_):
        c,d,e=[u.reg_read(r) for r in [UC_X86_REG_RCX,UC_X86_REG_RDX,UC_X86_REG_R8]]
        if a==STOP:u.emu_stop();return
        # New code, both original rules and copied rules, loot and leaf getters.
        if (self.reg<=a<self.api or self.api<=a<self.rules or self.rules<=a<self.rules+839
            or self.loot<=a<self.loot+1909 or BASE+patcher.RULES<=a<BASE+patcher.RULES_END
            or any(x<=a<x+0x12 for x in [0x1401e4cd0,0x1401e4d60,0x1401e4d80])):return
        self.calls.append(a)
        if a==0x1403c03c0:self.ret(self.arguments[d]);return
        if a==0x1403c0210:
            assert u.reg_read(UC_X86_REG_XMM2)==0
            u.reg_write(UC_X86_REG_XMM0,int.from_bytes(struct.pack('<d',self.arguments[3]),'little'));self.ret();return
        if a==0x1403ab760:
            self.pushed.append(struct.unpack('<d',u.reg_read(UC_X86_REG_XMM1).to_bytes(16,'little')[:8])[0]);self.ret();return
        if a==0x1403ab9c0:self.pushed.append(bool(d));self.ret();return
        if a==0x1403c1250:self.registrations.append((c,self.text(d),e));self.ret();return
        if a==0x1400eb7e0:self.ret(self.gm);return
        if a==0x14000e2e0:self.ret(self.active if c==self.drop else 1);return
        if a in [0x14000dec0,0x14000e7b0,0x14000df00,0x14002ed90,0x14002e740,
                 0x140014a90,0x140021970]:self.ret(HEAP+0xa000);return
        if a==0x14004c340:
            handle=self.get(d,'Q');self.ret(self.drop if self.present and handle==(3<<32|self.recog) else 0);return
        if a==0x14001a280:self.ret(1000);return
        if a==0x14002ef00:self.ret(self.cross);return
        if a==0x14002e6b0:self.put(HEAP+0xa014,'B',4 if self.cross_scene else 0);self.ret(HEAP+0xa000);return
        if a==0x14001ee30:self.ret(self.owner);return
        if a==0x140206110:self.ret(self.camp);return
        if a==0x14000e000:
            if c==self.actor:self.ret({0:77,0x3a:self.actor_camp,0x3b:self.drop_camp}.get(d,0))
            else:self.ret(1234 if d==3 else 0)
            return
        if a==0x14000d930:
            x,y=(10,10) if c==self.actor else (999,777)
            self.put(d,'i',x);self.put(e,'i',y);self.ret();return
        if a==0x1403e2310:self.ret();return
        if a==0x140252f00:self.ret(self.drop+0x150);return
        if a==0x140252ee0:self.ret(self.drop+0x152);return
        if a==0x140060250:self.ret(0);return
        if a==0x14000d720:self.put(c,'Q',0);self.ret(c);return
        if a==0x14005d830:self.put(c,'II',e,d);self.ret(c);return
        if a in [0x14000d800,0x14000d9f0]:
            if a==0x14000d800:u.mem_write(c,bytes(u.mem_read(d,8)));self.ret(c)
            else:u.mem_write(d,bytes(u.mem_read(c+0x110,8)));self.ret(d)
            return
        if a==0x14005d8a0:self.ret(self.get(c,'I'));return
        if a in [0x14000d7e0,0x14022da10,0x14002e530]:self.ret();return
        if a==0x1402300e0:self.tips.append(d);self.ret();return
        if a==0x140230140:self.tips.append(d);self.ret();return
        if a==0x14002e4a0:self.lists[c]=[];self.ret(c);return
        if a in [0x140270110,0x14006d480,0x14002d370]:self.lists[c].append(d);self.ret(c);return
        if a==0x14033b440:
            event=self.text(d);self.events.append(event)
            if event=='VipRecoveryInit_Auto':self.lists[u.reg_read(UC_X86_REG_R9)]=[self.recovery]
            self.ret(1);return
        if a==0x14002e510:self.ret(len(self.lists[c]));return
        if a==0x1400d6190:self.ret(HEAP+0xa100);return
        if a==0x14002eed0:self.ret(1);return
        if a==0x14002e340:self.ret(self.recovery);return
        if a==0x14025bdb0:self.put(self.drop+0x240,'Q',0);self.ret();return
        if a==0x14004ccf0:self.present=False;self.active=False;self.ret();return
        if a==0x14000dc50:assert d==4;self.ret(self.trading);return
        if a==0x14002e670:self.ret(HEAP+0xb000);return
        if a==0x1402a6c20:assert d==self.item;self.ret(self.bag_fits);return
        if a==0x1402a71e0:
            self.bag.append(bytes(u.mem_read(d,0x81)));assert e==self.drop+0x21c
            self.ret(1);return
        if a==0x140021920:self.ret(0);return
        if a==0x1401e4da0:self.ret(0);return
        if a==0x14025c560:self.ret(1234);return
        if a==0x14022eda0:self.money.append((d,e));self.ret();return
        if a==0x14025c2e0:self.ret();return
        if a==0x14022d3f0:self.ret(HEAP+0xc000);return
        if a in [0x14000bd30,0x14000b630,0x1400c1c60]:self.ret(c);return
        raise AssertionError(f'Unexpected native path {a:#x}')

    def run(self,entry,*args):
        sp=STACK+0x8000;self.put(sp,'Q',STOP);self.u.reg_write(UC_X86_REG_RSP,sp)
        for r,n in zip([UC_X86_REG_RCX,UC_X86_REG_RDX,UC_X86_REG_R8],args):self.u.reg_write(r,n)
        self.u.emu_start(entry,STOP+1,count=20000)
        assert self.u.reg_read(UC_X86_REG_RIP)==STOP
        return self.u.reg_read(UC_X86_REG_RAX)
    def pickup(self):self.arguments[3]=self.recog;return self.run(self.api,HEAP+0xd000)


class NativePickupTests(unittest.TestCase):
    def test_metadata_and_existing_registration(self):
        r=Replay();r.run(r.api,HEAP+0xd000);self.assertEqual(r.pushed,[85,-1,123]);self.assertTrue(r.present)
        r.put(HEAP+0xf000,'11s',b'getEntity\0\0');r.run(r.reg,HEAP+0xd000,HEAP+0xf000,0x14034ece0)
        self.assertEqual([n for _,n,_ in r.registrations],['getEntity','gmDropPickup'])
        self.assertEqual(r.registrations[1][2],r.api)

    def test_item_uses_original_quantity_attributes_callbacks_and_deletion(self):
        r=Replay();r.pickup();self.assertEqual(r.pushed,[True]);self.assertFalse(r.present)
        self.assertEqual(len(r.bag),1);self.assertEqual(struct.unpack_from('<H',r.bag[0],0x2d)[0],13)
        self.assertEqual(struct.unpack_from('<Q',r.bag[0],0x30)[0],0x0123456789abcdef)
        self.assertIn('VipRecoveryInit_Auto',r.events)

    def test_money_and_recovery_keep_original_flow(self):
        for t in range(9):
            r=Replay();r.put(r.drop+0x240,'Q',0);r.put(r.drop+0x2a8,'B',t);r.pickup()
            self.assertEqual(r.money,[(t,1234)]);self.assertIn('OnLootAddMoneyEvent',r.events)
            self.assertFalse(r.present);self.assertEqual(r.pushed,[True])
        r=Replay();r.recovery=True;r.bag_fits=False;r.pickup()
        self.assertFalse(r.present);self.assertEqual(r.bag,[]);self.assertEqual(r.pushed,[True])

    def test_bag_full_and_trading_do_not_destroy_drop(self):
        for field,tip in [('bag_fits',0x117),('trading',0x40e)]:
            r=Replay();setattr(r,field,field=='trading');r.pickup()
            self.assertTrue(r.present);self.assertEqual(r.get(r.drop+0x240,'Q'),r.item)
            self.assertEqual(r.bag,[]);self.assertEqual(r.pushed,[False]);self.assertIn(tip,r.tips)

    def test_all_non_distance_rules_match_original(self):
        for label in ['expired','wait','owner','camp','cross-no-camp','cross-camp','allowed-owner','allowed-expired-protection']:
            r=Replay()
            if label=='expired':r.put(r.drop+0x288,'Q',999)
            if label=='wait':r.put(r.drop+0x2a0,'Q',1001)
            if label=='owner':r.owner=88
            if label=='camp':r.camp=3;r.drop_camp=4
            if label.startswith('cross'):
                r.cross=r.cross_scene=True;r.actor_camp=4
                if label=='cross-camp':r.put(r.drop+0x2c0,'I',5)
            if label=='allowed-owner':r.owner=77
            if label=='allowed-expired-protection':r.owner=88;r.put(r.drop+0x290,'Q',999)
            original=r.run(BASE+patcher.RULES,r.drop,r.actor)
            copied=r.run(r.rules,r.drop,r.actor)
            self.assertEqual(copied,0 if original==0x2d2 else original,label)
            if not label.startswith('allowed'):
                self.assertNotEqual(copied,0,label);r.pickup();self.assertTrue(r.present)

    def test_permission_scene_identity_and_bad_arguments(self):
        for case in ['gm','entity','scene','inactive','removed','stale','negative','fraction','nan','infinity','overflow']:
            r=Replay()
            if case=='gm':r.gm=0
            if case=='entity':r.put(r.actor+0x114,'I',1)
            if case=='scene':r.put(r.drop+0x100,'Q',r.scene+0x100)
            if case=='inactive':r.active=False
            if case=='removed':r.present=False
            if case=='stale':r.arguments[2]=HEAP+0x4000  # readable pointer, different entity
            value={'negative':-1,'fraction':1.5,'nan':float('nan'),'infinity':float('inf'),'overflow':4294967296}.get(case,r.recog)
            r.arguments[3]=value;r.run(r.api,HEAP+0xd000)
            self.assertEqual(r.bag,[],case);self.assertEqual(r.pushed,[False],case)
        r=Replay();r.arguments[2]=0x77770000;r.arguments[3]=r.recog+1
        r.run(r.api,HEAP+0xd000)  # stale/unmapped pointer must never be dereferenced
        self.assertEqual(r.pushed,[False])

    def test_relocation_idempotence_and_win64_unwind(self):
        before,after=build();self.assertEqual(patcher.patch(after),after)
        original=pefile.PE(data=before);updated=pefile.PE(data=after)
        allowed={i for pos,value in patcher.RESTORE.items() for i in range(pos,pos+len(value))}
        hook=original.get_offset_from_rva(patcher.HOOK);allowed.update(range(hook,hook+5))
        self.assertTrue(all(i in allowed for i,(a,b) in enumerate(zip(before,after)) if a!=b))
        for b,e in [(patcher.LOOT,patcher.LOOT_END),(patcher.RULES,patcher.RULES_END)]:
            self.assertEqual(original.get_data(b,e-b),updated.get_data(b,e-b))
        d=updated.OPTIONAL_HEADER.DATA_DIRECTORY[3]
        rows=list(struct.iter_unpack('<III',updated.get_data(d.VirtualAddress,d.Size)))
        self.assertEqual(rows,sorted(rows));self.assertEqual(len(rows),original.OPTIONAL_HEADER.DATA_DIRECTORY[3].Size//12+4)
        for b,e,u in rows[-4:]:self.assertEqual(updated.get_data(u,1),b'\x01')


if __name__=='__main__':unittest.main()
