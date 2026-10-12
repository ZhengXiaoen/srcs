"""Execute real candidate native functions with mocked allocation/container IO.

No Windows processes/services/databases are started. Counts and branches are
executed by Unicorn from candidate PE; mocks are explicitly listed in report.
"""
import argparse,hashlib,json,struct,sys,functools
from pathlib import Path
_deps_parser=argparse.ArgumentParser(add_help=False);_deps_parser.add_argument('--deps',type=Path)
_deps_args,_=_deps_parser.parse_known_args()
if _deps_args.deps:sys.path.insert(0,str(_deps_args.deps.resolve()))
import pefile
from unicorn import Uc,UC_ARCH_X86,UC_MODE_64,UC_HOOK_CODE,UC_HOOK_MEM_INVALID,UC_HOOK_MEM_READ,UC_HOOK_MEM_WRITE
from unicorn.x86_const import *
BASE=0x140000000;HEAP=0x20000000;STACK=0x30000000;STOP=0x40000000
def p64(v):return struct.pack('<Q',v&0xffffffffffffffff)
def unpack(b):return int.from_bytes(b,'little')
@functools.lru_cache(maxsize=2)
def mapped_binary(binary):
 pe=pefile.PE(str(binary));return pe,pe.get_memory_mapped_image()
def item_bytes(count,guid=1,flag=5):
 b=bytearray((i*37+11)%256 for i in range(129));b[:8]=p64(guid);b[8:10]=struct.pack('<H',1000);b[0xa]=0;b[0xb]=0;b[0xc]=177;b[0x16]=203;b[0x19:0x1d]=b'\0'*4;b[0x2d]=count&255;b[0x2e]=flag;b[0x35]=0;b[0x62]=0;b[0x80]=count>>8;return bytes(b)
class Machine:
 def __init__(self,binary):
  self.pe,image=mapped_binary(str(binary));self.u=Uc(UC_ARCH_X86,UC_MODE_64);self.image_length=len(image);self.u.mem_map(BASE,(len(image)+0xfff)&~0xfff);self.u.mem_write(BASE,image);self.u.mem_map(HEAP,0x40000);self.u.mem_map(STACK,0x40000);self.u.mem_map(STOP,0x10000);self.u.mem_write(STOP,b'\xf4');self.sp=STACK+0x20000;self.container=HEAP+0x100;self.vtable=HEAP+0x1000;self.std=HEAP+0x4000;self.nextitem=HEAP+0x10000;self.items={};self.calls=[];self.steps=0;self.returned=False
  self.freegrids=100;self.stdvalid=True;self.destroyed=[];self.allocated=0;self.allocfail=None;self.extra_allowed=[];self.u.mem_write(self.container,p64(self.vtable)+b'\0'*0x80);self.u.mem_write(self.std,b'\0'*0x1400);self.u.mem_write(self.std+0x31,b'\xc8')
  for n in range(0,0x80,8):self.u.mem_write(self.vtable+n,p64(STOP+0x100+n))
  self.u.hook_add(UC_HOOK_CODE,self.hook);self.u.hook_add(UC_HOOK_MEM_INVALID,self.badmem);self.u.hook_add(UC_HOOK_MEM_READ|UC_HOOK_MEM_WRITE,self.check_dead)
 def check_dead(self,u,access,addr,size,value,data):
  if any(a<=addr<a+129 or a<addr+size<=a+129 for a in self.destroyed):raise AssertionError(f'use after DestroyItem at{addr:#x} RIP{u.reg_read(UC_X86_REG_RIP):#x}')
 def badmem(self,u,access,addr,size,value,data):raise AssertionError(f'invalid memory at{addr:#x} RIP{u.reg_read(UC_X86_REG_RIP):#x}')
 def read(self,addr,n):return bytes(self.u.mem_read(addr,n))
 def count(self,addr):return self.read(addr+0x2d,1)[0]|self.read(addr+0x80,1)[0]<<8
 def setcount(self,addr,c):self.u.mem_write(addr+0x2d,bytes([c&255]));self.u.mem_write(addr+0x80,bytes([c>>8]))
 def add(self,c,guid=1,flag=5):
  a=self.nextitem;self.nextitem+=0x100;self.u.mem_write(a,item_bytes(c,guid,flag));self.items[guid]=a;return a
 def ret(self,value=0):
  self.u.reg_write(UC_X86_REG_RAX,value&0xffffffffffffffff);rsp=self.u.reg_read(UC_X86_REG_RSP);target=unpack(self.read(rsp,8));self.u.reg_write(UC_X86_REG_RSP,rsp+8);self.u.reg_write(UC_X86_REG_RIP,target)
 def hook(self,u,addr,size,data):
  self.steps+=1
  if self.steps>200000:raise AssertionError('instruction limit')
  if addr==STOP:self.returned=True;u.emu_stop();return
  rva=addr-BASE;c=u.reg_read(UC_X86_REG_RCX);d=u.reg_read(UC_X86_REG_RDX);e=u.reg_read(UC_X86_REG_R8)
  if STOP+0x100<=addr<STOP+0x180:
   self.calls.append(('vtable',hex(addr-STOP-0x100)));self.ret(0);return
  if rva==0x2a85c0:self.calls.append(('GetItemByGuid',d));self.ret(self.items.get(d,0));return
  if rva==0xb9730:self.calls.append(('FreeGridCount',));self.ret(self.freegrids);return
  if rva in(0xe7b0,0x14a90,0x21970,0x2ef70,0xdec0):self.ret(HEAP+0x6000);return
  if rva==0x21920:self.ret(self.std if self.stdvalid else 0);return
  if rva==0x6e3c0:self.u.mem_write(c,b'\0'*36);self.ret(c);return
  if rva==0xa1060:
   if self.allocfail is not None and self.allocated>=self.allocfail:self.ret(0);return
   a=self.nextitem;self.nextitem+=0x100;self.allocated+=1;self.u.mem_write(a,item_bytes(0,0x9988776600+self.allocated));self.calls.append(('AllocateItem',a));self.ret(a);return
  if rva==0x3c557c:self.u.mem_write(c,self.read(d,e));self.ret(c);return
  if rva==0x293130:
   a=unpack(self.read(d,8));guid=unpack(self.read(a,8));self.items[guid]=a;self.freegrids-=1;self.calls.append(('AddPointer',guid,self.count(a)));self.ret(1);return
  if rva==0x2a8250:
   a=self.items.pop(d,None);self.calls.append(('RemovePointer',d));self.ret(bool(a));return
  if rva==0xa1460:
   assert d not in self.destroyed,'double DestroyItem';self.destroyed.append(d);self.calls.append(('DestroyItem',d));self.ret();return
  if rva==0x2a8dd0:self.ret(0);return
  if rva==0x1cf160:
   arr=HEAP+0x3000;items=list(self.items.values());self.u.mem_write(arr,b''.join(p64(a) for a in items)+p64(0));self.ret(arr);return
  if rva==0x398610:self.ret(len(self.items));return
  if rva==0x3e2310:self.calls.append(('logger',));self.ret();return
  if rva==0x286c20:self.ret(1);return
  if rva==0x2aa9b0:self.calls.append(('SetItemProperties',));self.ret();return
  if rva==0x2ae3a0:self.calls.append(('AddItemAudit',));self.ret();return
  # Execute these core functions and all candidate trampolines for real.
  allowed=[(0x2a63f0,0x2a6a30),(0x2a6dc0,0x2a71d0),(0x2a71e0,0x2a79a0),(0x2a7f30,0x2a8240),(0x2a8ae0,0x2a8dc8),(0x2a8f70,0x2a9160),(0x41a70,0x41cba),(0x1c7d84,0x1c7d9e),(0x1c8127,0x1c812e)]
  if BASE<=addr<BASE+self.image_length:
   sec=next((s for s in self.pe.sections if s.VirtualAddress<=rva<s.VirtualAddress+max(s.Misc_VirtualSize,s.SizeOfRawData)),None)
   if any(a<=rva<b for a,b in allowed+self.extra_allowed) or (sec and sec.Name.rstrip(b'\0') not in (b'.text',b'.rdata',b'.data',b'.pdata',b'.rsrc',b'.reloc',b'.mtstack')):return
  raise AssertionError(f'unmocked function at{addr:#x}, RVA{rva:#x}')
 def run(self,fn,*args):
  self.steps=0;self.returned=False;self.u.reg_write(UC_X86_REG_RSP,self.sp);self.u.mem_write(self.sp,p64(STOP)+b'\0'*0x200)
  nonvolatile=(UC_X86_REG_RBX,UC_X86_REG_RBP,UC_X86_REG_RSI,UC_X86_REG_RDI,UC_X86_REG_R12,UC_X86_REG_R13,UC_X86_REG_R14,UC_X86_REG_R15);sentinels={reg:0x55aa00000000+j for j,reg in enumerate(nonvolatile)}
  for reg,value in sentinels.items():self.u.reg_write(reg,value)
  for reg,arg in zip((UC_X86_REG_RCX,UC_X86_REG_RDX,UC_X86_REG_R8,UC_X86_REG_R9),args):self.u.reg_write(reg,arg)
  for j,arg in enumerate(args[4:]):self.u.mem_write(self.sp+0x28+j*8,p64(arg))
  self.u.emu_start(BASE+fn,STOP+1,count=200000);assert self.returned,'did not return';assert self.u.reg_read(UC_X86_REG_RSP)==self.sp+8,'stack mismatch';assert all(self.u.reg_read(reg)==value for reg,value in sentinels.items()),'nonvolatile register changed';return self.u.reg_read(UC_X86_REG_RAX)
def unchanged(before,after,skip=(0x2d,0x80)):
 assert all(before[i]==after[i] for i in range(129) if i not in skip),'unrelated item metadata changed'
def guild_suite(binary,evidence):
 blocks=json.loads(Path(evidence).read_text(encoding='utf-8'))['logic']['blocks'];results=[]
 sites=(0x1c7d84,0x1c7d96,0x1c8127)
 selected={s:next(b for b in blocks if b['site_rva']<=s<b['end_rva']) for s in sites}
 for count in(0,1,255,256,9999,65535):
  for exited in(0,1):
   m=Machine(binary);a=m.add(count);m.u.mem_write(a-4,struct.pack('<I',exited));before=m.read(a-16,145);sp=m.sp;m.u.reg_write(UC_X86_REG_RSP,sp);m.u.mem_write(sp+0x50,m.read(a,129))
   def block(s):
    b=selected[s];m.steps=0;m.u.emu_start(BASE+b['site_rva'],BASE+b['end_rva'],count=1000);assert m.u.reg_read(UC_X86_REG_RIP)==BASE+b['end_rva'];assert m.u.reg_read(UC_X86_REG_RSP)==sp
   m.u.reg_write(UC_X86_REG_RAX,a-0x10);m.u.reg_write(UC_X86_REG_RCX,0);block(sites[0]);assert m.u.reg_read(UC_X86_REG_RAX)==a;assert m.u.reg_read(UC_X86_REG_RDX)==a;assert unpack(m.read(sp+0x190,8))==a
   block(sites[1]);assert m.u.reg_read(UC_X86_REG_RAX)==exited;assert m.count(sp+0x50)==count;assert m.read(a-16,145)==before
   m.u.reg_write(UC_X86_REG_RAX,a);block(sites[2]);assert unpack(m.read(a-4,4))==1;assert m.count(a)==count;after=m.read(a-16,145);assert all(before[i]==after[i] for i in range(145) if not 12<=i<16)
   results.append({'test':'GuildExitFlagThreeSites','count':count,'initial_exit':exited,'exit_read':exited,'exit_written':1,'item_metadata_preserved':True})
 return results
def suite(binary):
 results=[]
 for total,split in[(256,1),(256,255),(9999,255),(9999,256),(9999,5000),(65535,9999),(65535,255)]:
  m=Machine(binary);a=m.add(total);before=m.read(a,129);rv=m.run(0x2a6dc0,m.container,1,split)&255;assert rv==1;assert m.count(a)==total-split;new=next(v for k,v in m.items.items() if k!=1);assert m.count(new)==split;unchanged(before,m.read(a,129));unchanged(before,m.read(new,129),skip=tuple(range(8))+(0x2d,0x80));assert unpack(m.read(new,8))!=1;results.append({'test':'SplitItem','input':[total,split],'remaining':m.count(a),'new':m.count(new)})
 for total,remove in[(256,1),(9999,255),(9999,256),(65535,9999),(9999,9999),(256,9999),(65535,65535)]:
  m=Machine(binary);a=m.add(total);before=m.read(a,129);rv=m.run(0x2a7f30,m.container,a,remove,0,0,1);assert rv==min(total,remove);assert m.count(a)==max(0,total-remove);unchanged(before,m.read(a,129));results.append({'test':'DeleteItem','input':[total,remove],'removed':rv,'remaining':m.count(a)})
 for source,target in[(1,255),(255,256),(256,255),(9999,9998),(9999,0),(65535,255),(256,9999)]:
  m=Machine(binary);a=m.add(source,1);b=m.add(target,2);beforea=m.read(a,129);beforeb=m.read(b,129);rv=m.run(0x2a6f20,m.container,1,2)&255;amount=min(source,max(0,9999-target));assert rv==int(amount>0);assert m.count(b)==target+amount;assert m.count(b)<=9999
  if source>amount:assert m.count(a)==source-amount;unchanged(beforea,m.read(a,129))
  else:assert 1 not in m.items
  unchanged(beforeb,m.read(b,129));results.append({'test':'MergeItem','input':[source,target],'transferred':amount,'target':m.count(b),'source_active':1 in m.items})
 # Full native CanOverlapCountEx preserves 16-bit counts and the 9999 cap.
 for target in(0,1,255,256,9998,9999,65535):
  m=Machine(binary);a=m.add(1,1);b=m.add(target,2);rv=m.run(0x2a8ae0,m.container,a,b);assert rv==max(0,9999-target);results.append({'test':'GetCanOverlapCountEx','target':target,'room':rv})
 # Execute AddUserItem in an empty container, including real overlap traversal.
 # This deliberately reports whether the existing insertion path enforces9999.
 add=[]
 for count in(255,256,9999,10000,65535):
  m=Machine(binary);a=m.add(count,1);m.items.clear();m.u.mem_write(m.container+0x18,p64(0));m.u.mem_write(m.container+0x20,p64(0))
  rv=m.run(0x2a71e0,m.container,a,0,0,0,0,0,0);insert=[x for x in m.calls if x[0]=='AddPointer'];add.append({'input':count,'return':rv,'inserted_counts':[x[2] for x in insert]})
 results.append({'test':'AddUserItemInsertionPolicy','observations':add,'enforces9999':all(all(n<=9999 for n in row['inserted_counts']) for row in add)})
 for total,free in[(256,1),(9999,1),(10000,2),(65535,7),(65535,6),(65535,1),(65535,0)]:
  m=Machine(binary);m.freegrids=free;param=HEAP+0x7000;fields=bytearray(36);fields[2:4]=struct.pack('<H',1000);fields[4]=5;fields[6:8]=struct.pack('<H',total);m.u.mem_write(param,bytes(fields));rv=m.run(0x2a63f0,m.container,param,0,0,0);insert=[x[2] for x in m.calls if x[0]=='AddPointer'];assert all(n<=9999 for n in insert);assert sum(insert)==rv;assert rv==min(total,free*9999);results.append({'test':'AddItemPaging','total':total,'free_grids':free,'added':rv,'inserted_counts':insert})
 return results
def main():
 p=argparse.ArgumentParser();p.add_argument('--deps',type=Path);p.add_argument('--binary',type=Path,required=True);p.add_argument('--evidence',type=Path);p.add_argument('--output',type=Path);args=p.parse_args();results=suite(args.binary)
 if args.evidence:results+=guild_suite(args.binary,args.evidence)
 out={'binary':str(args.binary),'sha256':hashlib.sha256(args.binary.read_bytes()).hexdigest(),'execution':'Unicorn emulation of candidate PE; Windows service never started','case_count':sum(len(r['observations']) if 'observations' in r else 1 for r in results),'tests':results,'mocks':['GetItemByGuid, FreeGridCount, StdItemProvider, allocation, memcpy, ItemOPParam constructor, container pointer insertion/removal, vtable IO/log notifications','GetCanOverlapCountEx executes real quantity checks; strengthen compatibility helper mocked false'],'limitations':['mocked IO is not a client/server/database integration test','GUID allocation synthetic, clone preservation compared byte-by-byte','Guild check executes the three replacement blocks, not whole withdrawal transaction','No actual save/relogin test']};text=json.dumps(out,ensure_ascii=False,indent=2);print(text)
 if args.output:args.output.write_text(text,encoding='utf-8')
if __name__=='__main__':main()
