"""Run native single/one-key cultivation through the real Lua rebate handler."""
from __future__ import annotations

import argparse
import base64
import hashlib
import json
from pathlib import Path
import struct
import sys
import unittest

from patch_jingji_mount_consumption import BASE, CALL, ROOT, SERVER, helper, patch


class JingjiMountConsumptionTests(unittest.TestCase):
    def run_upgrade(self, *, one_key=False, inventory=400, required=300,
                    removed=None, auto_buy=False, active_type=2, current_day=1):
        import pefile
        from lupa.lua51 import LuaRuntime
        from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
        from unicorn.x86_const import (UC_X86_REG_RAX, UC_X86_REG_RCX, UC_X86_REG_RDX,
            UC_X86_REG_R8, UC_X86_REG_R9, UC_X86_REG_RSP, UC_X86_REG_RIP,
            UC_X86_REG_RBX, UC_X86_REG_RBP, UC_X86_REG_RSI, UC_X86_REG_RDI,
            UC_X86_REG_R12, UC_X86_REG_R13, UC_X86_REG_R14, UC_X86_REG_R15)
        source = patch(SERVER.read_bytes())
        pe = pefile.PE(data=source)
        lua = LuaRuntime(unpack_returned_tuples=True)
        lua.execute('''
            state={};svar={JingJiOpenDay=3,JingJiActivityTypes=2,isDringJingJi=1,StartJingJi_MiNitime=100}
            Actor={getStaticVar=function() return state end,sendTipmsg=function() end,getName=function() return 'test' end,getIntProperty=function() return 1 end}
            System={getStaticVar=function() return svar end,broadcastTipmsg=function() end,isCrossServer=function() return false end}
            LogicCmd={miscSysEx={sub={sJingJI_Acts=1}}};LogIds={JingJiActivity=1}
            RegisterBackCmd=function() end
            ttFlyTip=1;ttChatWindow=2;packets={};given=0
            Awards={CheckBagGridCount=function() return true end,Give=function() given=given+1 end}
            DataPack={allocPacket=function() return {} end,
                writeByte=function(p,v) p[#p+1]=v end,writeInt=function(p,v) p[#p+1]=v end,
                readByte=function(p) return p.index end,flush=function(p) packets[#packets+1]=p end}
        ''')
        lua.execute((ROOT / 'Server/S1001/data/config/new_activity/festival/activity_jingji.lua').read_text('utf-8-sig'))
        lua.execute((ROOT / 'Server/S1001/data/functions/new_activity/festival/activity_jingji.lua').read_text('utf-8-sig'))
        lua.execute((ROOT / 'Server/S1001/data/functions/new_activity/festival/ActivityRankFunc.lua').read_text('utf-8-sig'))
        player=(ROOT / 'Server/S1001/data/functions/player.lua').read_text('utf-8-sig')
        lua.execute(player[player.index('function ClearJingJi_Data('):player.index('function OnOpenServerKillBossAddBuff(')])
        lua.globals().svar.JingJiActivityTypes = active_type
        lua.globals().svar.isDringJingJi = current_day

        uc = Uc(UC_ARCH_X86, UC_MODE_64)
        uc.mem_map(BASE, 0x600000)
        for section in pe.sections:
            uc.mem_write(BASE + section.VirtualAddress, section.get_data())
        uc.mem_map(0x10000000, 0x200000)
        horse=0x10001000;actor=0x10002000;packet=0x10003000;bag=0x10004000
        provider=0x10005000;config=provider+0x110;level_config=0x10006000
        stack=0x101f0008;sentinel=BASE+0x5f0000
        uc.mem_write(horse+8,struct.pack('<Q',actor))
        uc.mem_write(bag+0x48,struct.pack('<Q',actor))
        uc.mem_write(config,struct.pack('<IIII',80,6862,100,10))
        uc.mem_write(level_config,struct.pack('<II',required,100000))
        uc.mem_write(stack,struct.pack('<Q',sentinel))
        uc.reg_write(UC_X86_REG_RSP,stack);uc.reg_write(UC_X86_REG_RCX,horse)
        uc.reg_write(UC_X86_REG_RDX,packet)
        preserved=[UC_X86_REG_RBX,UC_X86_REG_RBP,UC_X86_REG_RSI,UC_X86_REG_RDI,
                   UC_X86_REG_R12,UC_X86_REG_R13,UC_X86_REG_R14,UC_X86_REG_R15]
        for register in preserved:uc.reg_write(register,123456+register)
        calls=[];removals=[];callbacks=[];values=[];properties=[];request_bytes=iter((int(auto_buy),int(one_key)))
        native={0xe2e0,0xe7b0,0x14a90,0x1de400,0xe000,0x15e030,0x17ef20,0x11f110,
                0x1dc190,0x2e670,0x2a86e0,0x230140,0x984b0,0x6e3c0,0x2a79b0,
                0x22eda0,0xe060,0x80900,0x3fdc0,0x22d3f0,0xbd30,0x22da10,
                0x2e4a0,0x270110,0x2d370,0xdec0,0x2ed90,0x2e740,0x33b440,0x2e530}
        # Imported sprintf address is read from the actual RIP-relative operand.
        import capstone
        cs=capstone.Cs(capstone.CS_ARCH_X86,capstone.CS_MODE_64);cs.detail=True
        inst=next(cs.disasm(pe.get_data(0x1dab84,6),BASE+0x1dab84))
        import_slot=inst.address+inst.size+inst.operands[0].mem.disp
        sprintf=struct.unpack('<Q',uc.mem_read(import_slot,8))[0]
        if not BASE <= sprintf < BASE+0x600000:
            uc.mem_map(sprintf & ~0xfff,0x1000)

        def cstring(address):
            return bytes(uc.mem_read(address,80)).split(b'\0')[0].decode('ascii')

        def hook(machine,pc,size,user):
            rva=pc-BASE
            if rva not in native and pc != sprintf:return
            rsp=machine.reg_read(UC_X86_REG_RSP);self.assertEqual(8,rsp%16)
            rcx=machine.reg_read(UC_X86_REG_RCX);rdx=machine.reg_read(UC_X86_REG_RDX)
            r8=machine.reg_read(UC_X86_REG_R8);r9=machine.reg_read(UC_X86_REG_R9)
            calls.append(rva);result=0
            if pc==sprintf:result=0
            elif rva==0xe2e0:result=1
            elif rva in (0xe7b0,0x14a90,0xdec0,0x2ed90,0x2e740):result=0x10007000
            elif rva==0x1de400:result=provider
            elif rva==0xe000:result={6:80,0x53:1,0x3e:0}[rdx]
            elif rva==0x15e030:result=101
            elif rva==0x17ef20:machine.mem_write(rdx,bytes([next(request_bytes)]));result=packet
            elif rva==0x11f110:result=level_config
            elif rva==0x1dc190:result=required
            elif rva==0x2e670:result=bag
            elif rva==0x2a86e0:self.assertEqual(6862,rdx);result=inventory
            elif rva==0x984b0:result=10000000
            elif rva==0x6e3c0:machine.mem_write(rcx,bytes(16))
            elif rva==0x2a79b0:
                self.assertEqual(bag,rcx);self.assertEqual(0x487,r9)
                self.assertEqual(0xffffffff,struct.unpack('<I',machine.mem_read(rsp+0x28,4))[0])
                item_id=struct.unpack('<H',machine.mem_read(rdx+2,2))[0]
                count=struct.unpack('<H',machine.mem_read(rdx+6,2))[0]
                self.assertEqual(6862,item_id);removals.append(count)
                result=count if removed is None else removed
            elif rva==0x22eda0:result=1
            elif rva==0xe060:properties.append(rdx)
            elif rva==0x3fdc0:result=0
            elif rva==0x22d3f0:result=0x10008000
            elif rva==0xbd30:result=rcx
            elif rva==0x2e4a0:values.clear();result=rcx
            elif rva in (0x270110,0x2d370):values.append(rdx);result=rcx
            elif rva==0x33b440:
                self.assertEqual('HandleAddNewRankCount',cstring(rdx))
                self.assertEqual(r8,r9);self.assertEqual([actor,8],values[:2])
                callbacks.append(tuple(values))
                lua.globals().HandleAddNewRankCount(*values);result=1
            for register in (UC_X86_REG_RCX,UC_X86_REG_RDX,UC_X86_REG_R8,UC_X86_REG_R9):
                machine.reg_write(register,0xeeeeeeee)
            machine.reg_write(UC_X86_REG_RAX,result)
            ret=struct.unpack('<Q',machine.mem_read(rsp,8))[0]
            machine.reg_write(UC_X86_REG_RSP,rsp+8);machine.reg_write(UC_X86_REG_RIP,ret)
        uc.hook_add(UC_HOOK_CODE,hook)
        uc.emu_start(BASE+0x1da6b0,sentinel,count=5000)
        self.assertEqual(stack+8,uc.reg_read(UC_X86_REG_RSP))
        for register in preserved:self.assertEqual(123456+register,uc.reg_read(register))
        return lua,removals,callbacks,properties,calls

    def test_single_and_one_key_use_real_quantity_and_unlock_rebate(self):
        for one_key,required in ((False,1),(False,2),(False,300),(True,300)):
            lua,removals,callbacks,_,_=self.run_upgrade(one_key=one_key,required=required)
            self.assertEqual([required],removals);self.assertEqual(required,callbacks[0][2])
            self.assertEqual(required,lua.globals().state.JingJi_Data[8].count)
            self.assertEqual(required,lua.globals().packets[1][3])
            if required>=300:
                lua.globals().MiscHandleGetNewRankInfo(1,8,2,lua.table_from({'index':1}))
                self.assertEqual(1,lua.globals().given)
                self.assertEqual(1,lua.globals().state.JingJi_Data[8].isGive[1])

    def test_failed_and_partial_removal_preserve_native_failure_behavior(self):
        for removed in (0,2):
            lua,_,callbacks,properties,_=self.run_upgrade(removed=removed)
            self.assertEqual([],properties)
            self.assertEqual(1 if removed else 0,len(callbacks))
            self.assertEqual(removed,lua.globals().state.JingJi_Data[8].count if removed else 0)

    def test_inventory_shortage_and_pure_yuanbao_substitution_do_not_add_records(self):
        for auto_buy,inventory in ((False,2),(True,0)):
            lua,removals,callbacks,_,_=self.run_upgrade(inventory=inventory,auto_buy=auto_buy)
            self.assertEqual([],removals);self.assertEqual([],callbacks)
            self.assertIsNone(lua.globals().state.JingJi_Data)

    def test_mixed_item_and_yuanbao_substitution_counts_only_removed_pills(self):
        lua,removals,callbacks,_,_=self.run_upgrade(inventory=20,auto_buy=True,one_key=True)
        self.assertEqual([20],removals);self.assertEqual(20,callbacks[0][2])
        self.assertEqual(20,lua.globals().state.JingJi_Data[8].count)

    def test_christmas_closed_and_expired_activity_do_not_record(self):
        for active_type,day in ((1,1),(0,1),(2,0),(2,4)):
            lua,_,callbacks,_,_=self.run_upgrade(active_type=active_type,current_day=day)
            self.assertEqual(1,len(callbacks));self.assertIsNone(lua.globals().state.JingJi_Data)

    def test_installer_package_is_exact_and_only_the_upgrade_call_changes(self):
        import pefile
        source=SERVER.read_bytes();result=patch(source)
        self.assertEqual(result,patch(result))
        package=json.loads((ROOT/'Server/S1001/x64/jingji-mount-consumption.patch.json').read_text('utf-8'))
        if hashlib.sha256(source).hexdigest()==package['targetSha256']:
            # Recover the package source for byte-scope comparison after install.
            source=bytearray(source[:package['sourceLength']])
            for edit in package['edits']:
                before=base64.b64decode(edit['before']);offset=edit['offset']
                source[offset:offset+len(before)]=before
            source=bytes(source)
        rebuilt=bytearray(source+bytes(package['targetLength']-len(source)))
        for edit in package['edits']:
            offset=edit['offset'];before=base64.b64decode(edit['before'])
            self.assertEqual(before,source[offset:offset+len(before)])
            after=base64.b64decode(edit['after']);rebuilt[offset:offset+len(after)]=after
        self.assertEqual(result,bytes(rebuilt));self.assertEqual(package['targetSha256'],hashlib.sha256(result).hexdigest())
        before=pefile.PE(data=source);after=pefile.PE(data=result)
        text=before.sections[0];original=bytearray(text.get_data());expected=bytearray(original)
        offset=CALL-text.VirtualAddress;expected[offset:offset+5]=after.get_data(CALL,5)
        self.assertEqual(bytes(expected),after.sections[0].get_data())
        for old_section,new_section in zip(before.sections[1:],after.sections[1:]):
            data=bytearray(new_section.get_data())
            if old_section.Name.startswith(b'.pdata'):
                old_directory=before.OPTIONAL_HEADER.DATA_DIRECTORY[3]
                offset=old_directory.VirtualAddress-old_section.VirtualAddress+old_directory.Size
                data[offset:offset+12]=old_section.get_data()[offset:offset+12]
            self.assertEqual(old_section.get_data(),bytes(data))
        self.assertEqual(before.sections[-1].get_data(),after.sections[-2].get_data())
        section=after.sections[-1];code,payload=helper(BASE+section.VirtualAddress)
        self.assertEqual(payload,after.get_data(section.VirtualAddress,len(payload)))
        directory=after.OPTIONAL_HEADER.DATA_DIRECTORY[3]
        records=list(struct.iter_unpack('<III',after.get_data(directory.VirtualAddress,directory.Size)))
        start,end,unwind=records[-1]
        self.assertEqual((section.VirtualAddress,section.VirtualAddress+len(code)),(start,end))
        self.assertEqual(bytes.fromhex('01 07 02 00 07 01 43 00'),after.get_data(unwind,8))


if __name__=='__main__':
    parser=argparse.ArgumentParser();parser.add_argument('--deps',type=Path)
    args=parser.parse_args()
    if args.deps:sys.path.insert(0,str(args.deps))
    unittest.main(argv=[sys.argv[0]],verbosity=2)
