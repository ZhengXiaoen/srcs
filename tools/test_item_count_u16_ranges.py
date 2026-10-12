"""Execute full-argument count guard blocks in a generated candidate PE."""
import argparse,hashlib,json,struct
from pathlib import Path
from test_item_count_u16_native import *
VALUES=(0,1,255,256,9999,10000,65535,65536,-1)
def main():
 p=argparse.ArgumentParser();p.add_argument('--deps',type=Path);p.add_argument('--binary',type=Path,required=True);p.add_argument('--evidence',type=Path,required=True);p.add_argument('--output',type=Path);args=p.parse_args();report=json.loads(args.evidence.read_text(encoding='utf8'));blocks=report['logic']['blocks'];results=[]
 for name,site,field,low,fail,success in [('CreateItem',0x328d36,0x58,1,0x328ea9,None),('AddItemOptionalOverride',0x329269,0x80,0,0x32924f,None),('AddSellItem',0x32a5ab,0x40,1,0x32a5a2,None),('CreateDropBox',0x3352d2,0xe8,1,0x33561c,None)]:
  b=next(b for b in blocks if b['site_rva']<=site<b['end_rva']);assert b['site_rva']==site,(name,b)
  for value in VALUES:
   m=Machine(args.binary);a=m.add(7777);before=m.read(a,129);sp=m.sp;valid=low<=value<=65535;end=b['end_rva'] if valid else fail;m.extra_allowed=[(b['site_rva'],b['end_rva'])];m.u.reg_write(UC_X86_REG_RSP,sp);m.u.reg_write(UC_X86_REG_RAX,a);m.u.reg_write(UC_X86_REG_RCX,HEAP+0x6000);m.u.reg_write(UC_X86_REG_RDX,0xabcdef);m.u.mem_write(sp+field,struct.pack('<I',value&0xffffffff));m.u.emu_start(BASE+site,BASE+end,count=1000);assert m.u.reg_read(UC_X86_REG_RIP)==BASE+end;assert m.u.reg_read(UC_X86_REG_RSP)==sp
   if valid:
    if name=='CreateItem':assert m.u.reg_read(UC_X86_REG_RAX)==HEAP+0x6000 and m.u.reg_read(UC_X86_REG_RCX)==HEAP+0x6000
    elif name=='AddItemOptionalOverride':assert bool(m.u.reg_read(UC_X86_REG_EFLAGS)&0x40)==(value==0)
    elif name=='AddSellItem':assert m.count(a)==value;unchanged(before,m.read(a,129))
    else:assert m.u.reg_read(UC_X86_REG_RCX)==sp+0x78
   else:assert m.read(a,129)==before
   results.append({'test':name+'CapacityGuard','input':value,'accepted':valid,'stop_rva':hex(end),'item_unchanged_on_reject':not valid})
 out={'binary':str(args.binary),'sha256':hashlib.sha256(args.binary.read_bytes()).hexdigest(),'execution':'Unicorn candidate guard and covered successor instructions; no Windows process started','case_count':len(results),'tests':results,'limitations':['tests stop at verified original success/failure continuation','mock singleton getter for CreateItem; no real allocation or world drop']}
 if args.output:args.output.write_text(json.dumps(out,indent=2),encoding='utf8')
 print(json.dumps({'cases':len(results),'sha256':out['sha256']}))
if __name__=='__main__':main()
