"""Read-only Windows stack-unwind checks for an isolated item-count package.

PE images are placed in PAGE_READWRITE memory; their entrypoints and machine
code are never executed. This tests the host OS unwind API against metadata.
"""
import sys,ctypes,struct,json,argparse,hashlib
from pathlib import Path

ntdll=ctypes.WinDLL('ntdll')
kernel=ctypes.WinDLL('kernel32',use_last_error=True)
kernel.VirtualAlloc.argtypes=[ctypes.c_void_p,ctypes.c_size_t,ctypes.c_uint32,ctypes.c_uint32]
kernel.VirtualAlloc.restype=ctypes.c_void_p
kernel.VirtualFree.argtypes=[ctypes.c_void_p,ctypes.c_size_t,ctypes.c_uint32]
unwind=ntdll.RtlVirtualUnwind
unwind.argtypes=[ctypes.c_uint32,ctypes.c_uint64,ctypes.c_uint64,ctypes.c_void_p,
                 ctypes.c_void_p,ctypes.POINTER(ctypes.c_void_p),ctypes.POINTER(ctypes.c_uint64),ctypes.c_void_p]
unwind.restype=ctypes.c_void_p

def allocation(size):
    address=kernel.VirtualAlloc(None,size,0x3000,0x04)
    if not address: raise ctypes.WinError(ctypes.get_last_error())
    return address

def load(data):
    import pefile
    p=pefile.PE(data=data)
    address=allocation(p.OPTIONAL_HEADER.SizeOfImage+0x1000)
    ctypes.memmove(address,p.get_memory_mapped_image(),len(p.get_memory_mapped_image()))
    return p,address

def run(data,manifest,original=None):
    import pefile
    from capstone import Cs,CS_ARCH_X86,CS_MODE_64
    p,address=load(data)
    stack=allocation(0x20000); sp=stack+0x8000
    ctypes.memmove(stack,bytes((i*19+7)%256 for i in range(0x20000)),0x20000)
    fns={e.struct.BeginAddress:e.struct for e in p.DIRECTORY_ENTRY_EXCEPTION}
    if original is not None:
        original_pe=pefile.PE(data=original)
        for block in manifest['blocks']:
            ctypes.memmove(address+block['site_rva'],original_pe.get_data(block['site_rva'],block['end_rva']-block['site_rva']),block['end_rva']-block['site_rva'])
    def virtual(rva,function,delta):
        buffer=ctypes.create_string_buffer(1248); caddr=(ctypes.addressof(buffer)+15)&~15
        context=(ctypes.c_ubyte*1232).from_address(caddr)
        struct.pack_into('<I',context,48,0x10000b)
        struct.pack_into('<I',context,68,0x202)
        for offset in range(120,256,8):struct.pack_into('<Q',context,offset,0x33330000+offset*0x100)
        struct.pack_into('<Q',context,152,sp-delta)
        struct.pack_into('<Q',context,248,address+rva)
        runtime=(ctypes.c_uint32*3)(function.BeginAddress,function.EndAddress,function.UnwindData)
        handler_data=ctypes.c_void_p();establisher=ctypes.c_uint64()
        handler=unwind(2,address,address+rva,ctypes.addressof(runtime),caddr,
                       ctypes.byref(handler_data),ctypes.byref(establisher),None)
        values={o:struct.unpack_from('<Q',context,o)[0] for o in [144,152,160,168,176,216,224,232,240,248]}
        return values,handler,handler_data.value,establisher.value
    passed=0
    for block in manifest['blocks']:
        original_fn=next(e.struct for e in p.DIRECTORY_ENTRY_EXCEPTION
                         if e.struct.BeginAddress<=block['site_rva']<e.struct.EndAddress)
        baseline=virtual(block['site_rva'],original_fn,0)
        ctypes.memmove(address+block['site_rva'],bytes.fromhex(block['patch']),len(bytes.fromhex(block['patch'])))
        detour=virtual(block['site_rva'],original_fn,0)
        assert detour[0]==baseline[0] and detour[1]==baseline[1] and detour[3]==baseline[3],('original detour unwind',hex(block['site_rva']))
        if original is not None:
            ctypes.memmove(address+block['site_rva'],original_pe.get_data(block['site_rva'],block['end_rva']-block['site_rva']),block['end_rva']-block['site_rva'])
        passed+=1
        code=bytes.fromhex(block['trampoline'])
        for ins in Cs(CS_ARCH_X86,CS_MODE_64).disasm(code,block['cave_rva']):
            segment=next(s for s in manifest['temporary_stack_segments'] if s['begin']<=ins.address<s['end'])
            cave_fn=next(e.struct for e in p.DIRECTORY_ENTRY_EXCEPTION if e.struct.BeginAddress<=ins.address<e.struct.EndAddress)
            actual=virtual(ins.address,cave_fn,segment['delta'])
            assert actual[0]==baseline[0],(hex(ins.address),ins.mnemonic,segment['delta'],actual[0],baseline[0])
            assert actual[1]==baseline[1],(hex(ins.address),'handler',actual[1],baseline[1])
            if actual[1] is not None:
                assert actual[3]==baseline[3],(hex(ins.address),'establisher',actual[3],baseline[3])
            passed+=1
    kernel.VirtualFree(address,0,0x8000);kernel.VirtualFree(stack,0,0x8000)
    return passed

def verify_package(project_root,output_dir):
    from verify_count_helpers_unwind import verify_helpers
    root,output=Path(project_root).resolve(),Path(output_dir).resolve()
    evidence=json.loads((output/'patch-evidence.json').read_text(encoding='utf-8'))
    result=dict(windows_api='RtlVirtualUnwind',image_executed=False,
                memory_protection='PAGE_READWRITE',targets={})
    for name,relative in [('logic','Server/S1001/x64/LogicServerCQ64_R.exe'),
                          ('db','Server/common/x64/DBServer64_R.exe')]:
        candidate=(output/relative).read_bytes();original=(root/relative).read_bytes()
        manifest=evidence[name]
        if hashlib.sha256(candidate).hexdigest()!=manifest['candidate_sha256']:
            raise ValueError('Candidate fingerprint differs from evidence')
        if hashlib.sha256(original).hexdigest()!=manifest['original_sha256']:
            raise ValueError('Original fingerprint differs from evidence')
        result['targets'][name]=dict(candidate_sha256=manifest['candidate_sha256'],
             block_instruction_boundaries=run(candidate,manifest,original),
             independent_helpers=verify_helpers(candidate,manifest),status='passed')
    result['total_boundaries']=sum(t['block_instruction_boundaries']+t['independent_helpers']['total_boundaries']
                                   for t in result['targets'].values())
    return result


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--project-root',type=Path,default=Path(__file__).resolve().parents[1])
    parser.add_argument('--output-dir',type=Path,required=True)
    parser.add_argument('--deps',type=Path)
    args=parser.parse_args()
    if args.deps:sys.path.insert(0,str(args.deps.resolve()))
    result=verify_package(args.project_root,args.output_dir)
    (args.output_dir/'windows-unwind-evidence.json').write_text(json.dumps(result,ensure_ascii=False,indent=2),encoding='utf-8')
    print(json.dumps(result,ensure_ascii=False,indent=2))


if __name__=='__main__':main()
