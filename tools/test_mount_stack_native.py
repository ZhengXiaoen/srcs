"""Execute the actual x64 mount helper with emulated container/allocator APIs."""
import argparse
from pathlib import Path
import struct
import sys
import unittest

from patch_mount_stack_native import BASE, ORIGINAL, SERVER, helper, patch


class MountNativeTests(unittest.TestCase):
    def run_helper(self, count, allocation=True, removal=True):
        from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
        from unicorn.x86_const import (UC_X86_REG_RAX,UC_X86_REG_RCX,UC_X86_REG_RDX,
                                      UC_X86_REG_R8,UC_X86_REG_R9,UC_X86_REG_RSP,UC_X86_REG_RBX,
                                      UC_X86_REG_RBP,UC_X86_REG_RSI,UC_X86_REG_RDI,
                                      UC_X86_REG_R12,UC_X86_REG_R13,UC_X86_REG_R14,UC_X86_REG_R15)
        uc=Uc(UC_ARCH_X86,UC_MODE_64)
        uc.mem_map(BASE,0x600000)
        uc.mem_map(0x10000000,0x20000)
        address=BASE+0x550000;uc.mem_write(address,helper(address))
        stack=0x10018008;original=0x10001000;clone=0x10002000;slot=0x10003000
        old=bytearray((i*7%256 for i in range(0x98)))
        struct.pack_into('<QH',old,0,42,6888);old[0x2d]=count;old[0x2e]=1
        uc.mem_write(original,bytes(old));uc.mem_write(slot,struct.pack('<Q',original))
        sentinel=BASE+0x5f0000;uc.mem_write(stack,struct.pack('<Q',sentinel))
        uc.mem_write(stack+0x28,struct.pack('<Q',0x48e))
        uc.reg_write(UC_X86_REG_RSP,stack);uc.reg_write(UC_X86_REG_RCX,0x10004000)
        uc.reg_write(UC_X86_REG_RDX,slot);uc.reg_write(UC_X86_REG_R8,count)
        uc.reg_write(UC_X86_REG_R9,0x10005000)
        preserved=[UC_X86_REG_RBX,UC_X86_REG_RBP,UC_X86_REG_RSI,UC_X86_REG_RDI,
                   UC_X86_REG_R12,UC_X86_REG_R13,UC_X86_REG_R14,UC_X86_REG_R15]
        for register in preserved:uc.reg_write(register,123456+register)
        calls=[];destroyed=[]
        api={0xe7b0,0x2ef70,0xa1060,0x2a7f30,0xdec0,0xa1460}
        def hook(machine,pc,size,user):
            rva=pc-BASE
            if rva not in api:return
            rsp=machine.reg_read(UC_X86_REG_RSP)
            self.assertEqual(8,rsp%16)
            calls.append(rva)
            rcx=machine.reg_read(UC_X86_REG_RCX);rdx=machine.reg_read(UC_X86_REG_RDX)
            if rva in (0xe7b0,0xdec0):result=0x10006000
            elif rva==0x2ef70:result=0x10007000
            elif rva==0xa1060:
                result=clone if allocation else 0
                fresh=bytearray(0x98);struct.pack_into('<Q',fresh,0,99)
                fresh[0x81]=1;fresh[0x88:]=b'allocator-meta!!'
                machine.mem_write(clone,bytes(fresh))
            elif rva==0x2a7f30:
                self.assertEqual(0x10004000,rcx);self.assertEqual(original,rdx)
                self.assertEqual(1,machine.reg_read(UC_X86_REG_R8))
                self.assertEqual(0x48e,struct.unpack('<Q',machine.mem_read(rsp+0x28,8))[0])
                self.assertEqual(0,machine.mem_read(rsp+0x30,1)[0])
                result=int(removal)
                if removal:machine.mem_write(original+0x2d,bytes([count-1]))
            else:
                self.assertEqual(clone,rdx);destroyed.append(rdx);result=0
            machine.reg_write(UC_X86_REG_RAX,result)
            # Simulate clobbering every volatile argument register.
            for register in [UC_X86_REG_RCX,UC_X86_REG_RDX,UC_X86_REG_R8,UC_X86_REG_R9]:
                machine.reg_write(register,0xeeeeeeee)
            ret=struct.unpack('<Q',machine.mem_read(rsp,8))[0]
            machine.reg_write(UC_X86_REG_RSP,rsp+8)
            from unicorn.x86_const import UC_X86_REG_RIP
            machine.reg_write(UC_X86_REG_RIP,ret)
        uc.hook_add(UC_HOOK_CODE,hook);uc.emu_start(address,sentinel,count=2000)
        for register in preserved:self.assertEqual(123456+register,uc.reg_read(register))
        self.assertEqual(stack+8,uc.reg_read(UC_X86_REG_RSP))
        pointer=struct.unpack('<Q',uc.mem_read(slot,8))[0]
        remainder=uc.mem_read(original,0x98)
        if count>1 and allocation and removal:
            self.assertEqual(clone,pointer)
            new=uc.mem_read(clone,0x98)
            self.assertEqual(99,struct.unpack('<Q',new[:8])[0])
            self.assertEqual(1,new[0x2d]);self.assertEqual(1,new[0x81])
            self.assertEqual(b'allocator-meta!!',new[0x88:])
            expected=bytearray(old[8:0x81]);expected[0x2d-8]=1
            self.assertEqual(expected,new[8:0x81])
            # The native success destroys clone; the failure returns clone only.
            uc.mem_write(clone,b'\0'*0x98)
            self.assertEqual(count-1,uc.mem_read(original+0x2d,1)[0])
            self.assertEqual(count,(count-1)+1)
        else:self.assertEqual(original,pointer)
        expected=bytearray(old)
        succeeded=removal and (count==1 or allocation)
        if succeeded:expected[0x2d]-=1
        self.assertEqual(expected,remainder)
        self.assertEqual(int(succeeded),uc.reg_read(UC_X86_REG_RAX))
        if count>1 and allocation and not removal:self.assertEqual([clone],destroyed)
        else:self.assertFalse(destroyed)
        return calls

    def test_stack_200_preserves_remainder_guid_attributes_and_allocator_metadata(self):
        self.run_helper(200)

    def test_single_item_uses_existing_ownership_flow(self):
        self.assertNotIn(0xa1060,self.run_helper(1))

    def test_two_items_and_allocation_failure(self):
        self.run_helper(2);self.assertNotIn(0x2a7f30,self.run_helper(200,allocation=False))

    def test_failed_remove_disposes_clone_and_retains_original(self):
        self.run_helper(200,removal=False);self.run_helper(1,removal=False)

    def test_complete_native_wear_replacement_rollback_and_validation_flow(self):
        import pefile
        from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE
        from unicorn.x86_const import (UC_X86_REG_RAX,UC_X86_REG_RCX,UC_X86_REG_RDX,
                                      UC_X86_REG_R8,UC_X86_REG_RSP,UC_X86_REG_RIP)
        source=patch(SERVER.read_bytes());pe=pefile.PE(data=source)
        for count,takeoff,allow in [(200,0,True),(2,0,True),(1,0,True),
                                    (200,-1,True),(200,0,False)]:
            uc=Uc(UC_ARCH_X86,UC_MODE_64);uc.mem_map(BASE,0x600000)
            for section in pe.sections:uc.mem_write(BASE+section.VirtualAddress,section.get_data())
            uc.mem_map(0x10000000,0x200000)
            mount=0x10001000;actor=0x10002000;packet=0x10003000;bag=0x10004000
            config=0x10005000;std=0x10006000;array=0x10007000
            item=0x10008000;clone=0x10009000;stack=0x101f0008;sentinel=BASE+0x5f0000
            def put64(address,value):uc.mem_write(address,struct.pack('<Q',value))
            put64(mount+8,actor);put64(packet,42);put64(array,item)
            original=bytearray(0x98);struct.pack_into('<QH',original,0,42,6888)
            original[0x2d]=count;original[0x2e]=1;uc.mem_write(item,bytes(original))
            put64(stack,sentinel);uc.reg_write(UC_X86_REG_RSP,stack)
            uc.reg_write(UC_X86_REG_RCX,mount);uc.reg_write(UC_X86_REG_RDX,packet)
            deleted=[];returned=[];slots=[];responses=[];calls=[]
            native={0xe2e0,0xe7b0,0x14a90,0x1de400,0xe000,0x185e70,0x185e40,
                    0x39cf0,0x17ef20,0x2e670,0x2a8650,0x1cf160,0x21970,0x21920,
                    0x11e3a0,0x286960,0x2300e0,0x2ef70,0xa1060,0x2a7f30,
                    0x1dbe40,0x2a71e0,0xdec0,0xa1460,0x1ddaf0,0x80900,
                    0x22d3f0,0xbd30,0x22da10}
            def hook(machine,pc,size,user):
                rva=pc-BASE
                if rva not in native:return
                rsp=machine.reg_read(UC_X86_REG_RSP);self.assertEqual(8,rsp%16)
                rcx=machine.reg_read(UC_X86_REG_RCX);rdx=machine.reg_read(UC_X86_REG_RDX)
                r8=machine.reg_read(UC_X86_REG_R8);calls.append(rva)
                result=0
                if rva==0xe2e0:result=1
                elif rva in [0xe7b0,0x14a90,0x185e70,0x21970,0x2ef70,0xdec0]:result=0x1000a000
                elif rva==0x1de400:result=config
                elif rva==0xe000:result=100
                elif rva==0x39cf0:machine.mem_write(rdx,struct.pack('<Q',42));result=packet
                elif rva==0x17ef20:machine.mem_write(rdx,b'\0');result=packet
                elif rva==0x2e670:result=bag
                elif rva==0x2a8650:result=0
                elif rva==0x1cf160:result=array
                elif rva==0x21920:result=std
                elif rva==0x11e3a0:result=1
                elif rva==0x286960:result=0 if allow else 0x1000b000
                elif rva==0xa1060:
                    fresh=bytearray(0x98);struct.pack_into('<Q',fresh,0,99);fresh[0x81]=1
                    machine.mem_write(clone,bytes(fresh));result=clone
                elif rva==0x2a7f30:
                    self.assertEqual(bag,rcx);self.assertEqual(item,rdx);self.assertEqual(1,r8)
                    machine.mem_write(item+0x2d,bytes([count-1]));result=1
                elif rva==0x1dbe40:result=takeoff & 0xffffffffffffffff
                elif rva==0x2a71e0:
                    self.assertEqual(bag,rcx);returned.append(rdx)
                    single=machine.mem_read(rdx,0x98);self.assertEqual(1,single[0x2d])
                    # Existing container merges the single item back into the
                    # original stack on failure; model that existing API.
                    machine.mem_write(item+0x2d,bytes([count]));result=1
                elif rva==0xa1460:deleted.append(rdx)
                elif rva==0x1ddaf0:slots.append((rdx,r8))
                elif rva==0x22d3f0:result=0x1000c000
                elif rva==0xbd30:responses.append(rdx & 0xff);result=rcx
                machine.reg_write(UC_X86_REG_RAX,result)
                ret=struct.unpack('<Q',machine.mem_read(rsp,8))[0]
                machine.reg_write(UC_X86_REG_RSP,rsp+8);machine.reg_write(UC_X86_REG_RIP,ret)
            uc.hook_add(UC_HOOK_CODE,hook)
            uc.emu_start(BASE+0x1dc550,sentinel,count=3000)
            if not allow:
                self.assertNotIn(0x2a7f30,calls);self.assertFalse(slots)
                self.assertEqual(count,uc.mem_read(item+0x2d,1)[0])
            elif takeoff<0:
                self.assertEqual([clone],returned);self.assertFalse(deleted);self.assertFalse(slots)
                self.assertEqual(count,uc.mem_read(item+0x2d,1)[0])
            else:
                self.assertEqual([clone if count>1 else item],deleted);self.assertFalse(returned)
                self.assertEqual([(0,1)],slots);self.assertEqual([42,10,0,1],responses)
                self.assertEqual(count-1,uc.mem_read(item+0x2d,1)[0])

    def test_pe_patch_preserves_other_code_and_unwind_records(self):
        import pefile
        import hashlib
        source=SERVER.read_bytes()
        self.assertEqual(ORIGINAL,hashlib.sha256(source).hexdigest())
        result=patch(source);self.assertEqual(result,patch(result))
        old,new=pefile.PE(data=source),pefile.PE(data=result)
        for previous,current in zip(old.sections,new.sections):
            data=bytearray(current.get_data())
            if previous.Name.startswith(b'.text'):
                for rva,size in [(0x1dc75c,1),(0x1dc801,5),(0x1dc80e,5)]:
                    offset=rva-previous.VirtualAddress;data[offset:offset+size]=previous.get_data()[offset:offset+size]
            elif previous.Name.startswith(b'.pdata'):
                directory=old.OPTIONAL_HEADER.DATA_DIRECTORY[3]
                offset=directory.VirtualAddress-previous.VirtualAddress+directory.Size
                data[offset:offset+12]=previous.get_data()[offset:offset+12]
            self.assertEqual(previous.get_data(),data)
        d=old.OPTIONAL_HEADER.DATA_DIRECTORY[3];nd=new.OPTIONAL_HEADER.DATA_DIRECTORY[3]
        self.assertEqual(old.get_data(d.VirtualAddress,d.Size),new.get_data(nd.VirtualAddress,d.Size))
        records=[struct.unpack('<III',new.get_data(nd.VirtualAddress+i,12)) for i in range(0,nd.Size,12)]
        self.assertEqual(sorted(records),records)
        self.assertEqual(b'\x01\x04\x01\0\x04\xe2\0\0',new.get_data(records[-1][2],8))


if __name__=='__main__':
    parser=argparse.ArgumentParser();parser.add_argument('--deps',type=Path);args=parser.parse_args()
    if args.deps:sys.path.insert(0,str(args.deps))
    unittest.main(argv=[sys.argv[0]],verbosity=2)
