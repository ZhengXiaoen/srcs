"""Execute the real full candidate AddUserItem paging helper and guards."""
import argparse,hashlib,json,random,struct,sys
from pathlib import Path
from test_item_count_u16_native import *
def paging(total,targets,free,fail=None):
 m=Machine(BINARY);a=m.add(total,1);m.items.clear();before=m.read(a,129);existing=[m.add(t,j+2) for j,t in enumerate(targets)];saved=[m.read(v,129) for v in existing];m.freegrids=free;m.allocfail=fail
 rv=m.run(0x2a71e0,m.container,a,0,0,1,2,3,1)
 expected=min(total,sum(9999-t for t in targets)+free*9999) if fail is None else None
 if expected is not None:assert rv==expected,(rv,expected,total,targets,free)
 added=sum(m.count(v) for v in m.items.values())-sum(targets);assert added==rv
 assert all(1<=m.count(v)<=9999 for v in m.items.values())
 if a not in m.items.values() and a not in m.destroyed:assert m.count(a)+rv==total
 for b,v in zip(saved,existing):unchanged(b,m.read(v,129))
 for v in m.items.values():
  if v not in existing:unchanged(before,m.read(v,129),skip=tuple(range(8))+(0x2d,0x80))
 guids=[unpack(m.read(v,8)) for v in m.items.values()];assert len(guids)==len(set(guids))
 for c in m.destroyed:assert c not in m.items.values()
 return {'test':'AddUserItemPaging','total':total,'existing':targets,'free_grids':free,'allocation_fail_after':fail,'accepted':rv,'active_counts':[m.count(v) for v in m.items.values()],'original_owned_by_caller':a not in m.items.values() and a not in m.destroyed,'caller_remaining':m.count(a) if a not in m.items.values() and a not in m.destroyed else None,'destroyed_clone_count':len(m.destroyed),'new_guids_unique':True,'metadata_preserved':True,'no_use_after_destroy':True}
def setter_guards(binary,evidence):
 results=[]
 for value in(0,1,255,256,9999,10000,65535,65536,-1):
  valid=0<=value<=9999
  m=Machine(binary);a=m.add(7777);before=m.read(a,129);m.extra_allowed=[(0x2878e0,0x2878f3)];m.u.reg_write(UC_X86_REG_RSP,m.sp);m.u.reg_write(UC_X86_REG_RAX,a);m.u.mem_write(m.sp+0x1a8,p64(value));end=0x2878f3 if valid else 0x287531;m.u.emu_start(BASE+0x2878e0,BASE+end,count=1000);assert m.u.reg_read(UC_X86_REG_RIP)==BASE+end
  assert m.count(a)==(value if valid else 7777);unchanged(before,m.read(a,129));results.append({'test':'BagCountSetterGuard','requested':value,'accepted':valid,'count':m.count(a)})
  m=Machine(binary);a=m.add(7777);before=m.read(a,129);m.extra_allowed=[(0x327f3f,0x327f4c)];m.u.reg_write(UC_X86_REG_RSP,m.sp);m.u.reg_write(UC_X86_REG_RAX,a);m.u.mem_write(m.sp+0x70,struct.pack('<I',value&0xffffffff));end=0x328103 if valid else 0x3280ff;m.u.emu_start(BASE+0x327f3f,BASE+end,count=1000);assert m.u.reg_read(UC_X86_REG_RIP)==BASE+end
  assert m.count(a)==(value if valid else 7777);unchanged(before,m.read(a,129));results.append({'test':'LuaCountSetterGuard','requested':value,'accepted':valid,'count':m.count(a)})
 return results
def main():
 global BINARY
 p=argparse.ArgumentParser();p.add_argument('--deps',type=Path);p.add_argument('--binary',type=Path,required=True);p.add_argument('--evidence',type=Path);p.add_argument('--output',type=Path);args=p.parse_args();BINARY=args.binary
 results=[]
 for total,targets,free in [(10000,[],0),(10000,[],1),(10000,[],2),(65535,[],0),(65535,[],1),(65535,[],6),(65535,[],7),(65535,[9998],0),(65535,[255],0),(10000,[9998],0),(65535,[1,255,256,9998],0),(65535,[1,255,256,9998],1),(10000,[1],0),(10000,[1],1),(65535,[9999],7),(65535,[9999],0),(10000,[1,1],0),(10000,[1,1],1)]:results.append(paging(total,targets,free))
 for total,targets,free,fail in [(65535,[],7,0),(65535,[],7,1),(65535,[],7,3),(65535,[1],7,1),(65535,[9998],0,1),(10000,[],2,0)]:results.append(paging(total,targets,free,fail))
 random.seed(14999)
 for n in range(60):results.append(paging(random.randrange(1,65536),[random.randrange(1,10000) for _ in range(random.randrange(0,5))],random.randrange(0,8)))
 for total,split in[(65535,10000),(65535,50000),(65535,65534),(9999,10000),(9999,0),(9999,65536),(9999,-1),(65535,9999),(9999,256)]:
  m=Machine(BINARY);a=m.add(total);before=m.read(a,129);rv=m.run(0x2a6dc0,m.container,1,split)&255;expected=int(1<=split<=9999 and total-split>=1);assert rv==expected
  if not expected:assert m.read(a,129)==before;assert len(m.items)==1
  else:assert m.count(a)==total-split;assert all(m.count(v)<=9999 for v in m.items.values() if v!=a)
  results.append({'test':'SplitItemGuard','total':total,'split':split,'accepted':rv,'remaining':m.count(a)})
 if args.evidence:results+=setter_guards(BINARY,args.evidence)
 out={'binary':str(BINARY),'sha256':hashlib.sha256(BINARY.read_bytes()).hexdigest(),'execution':'real candidate x64 code under Unicorn; no Windows service started','case_count':len(results),'tests':results,'mocks':['allocator with fresh GUIDs and controlled allocation failure','containers and free grid counts','provider, memcpy, strength compatibility helper, notifications and IO'],'limitations':['no DB/client transaction, actual save or relogin test','allocation failure covered in paging helper only; AddItem original allocation failure not modeled','direct setters execute guard and write blocks, not whole functions']}
 if args.output:args.output.write_text(json.dumps(out,indent=2),encoding='utf8')
 print(json.dumps({'cases':len(results),'sha256':out['sha256'],'output':str(args.output) if args.output else None}))
if __name__=='__main__':main()
