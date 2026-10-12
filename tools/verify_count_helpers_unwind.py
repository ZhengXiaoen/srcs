"""Validate candidate independent helpers with Windows RtlVirtualUnwind.

Only allocates non-executable memory containing a mapped image and artificial
stack. Never executes the image or writes any target file.
"""
import ctypes
import struct


def verify_helpers(exe_bytes, manifest):
    import pefile
    kernel=ctypes.WinDLL('kernel32',use_last_error=True)
    kernel.VirtualAlloc.argtypes=[ctypes.c_void_p,ctypes.c_size_t,ctypes.c_uint32,ctypes.c_uint32]
    kernel.VirtualAlloc.restype=ctypes.c_void_p
    kernel.VirtualFree.argtypes=[ctypes.c_void_p,ctypes.c_size_t,ctypes.c_uint32]
    unwind=ctypes.WinDLL('ntdll').RtlVirtualUnwind
    unwind.argtypes=[ctypes.c_uint32,ctypes.c_uint64,ctypes.c_uint64,ctypes.c_void_p,
                     ctypes.c_void_p,ctypes.POINTER(ctypes.c_void_p),ctypes.POINTER(ctypes.c_uint64),ctypes.c_void_p]
    unwind.restype=ctypes.c_void_p
    pe=pefile.PE(data=exe_bytes)
    image=kernel.VirtualAlloc(None,pe.OPTIONAL_HEADER.SizeOfImage+0x1000,0x3000,0x04)
    stack=kernel.VirtualAlloc(None,0x20000,0x3000,0x04)
    if not image or not stack:raise ctypes.WinError(ctypes.get_last_error())
    results=[]
    try:
        mapped=pe.get_memory_mapped_image();ctypes.memmove(image,mapped,len(mapped))
        entry_sp=stack+0x10000;return_address=0x1122334455667788
        ctypes.c_uint64.from_address(entry_sp).value=return_address
        for helper in manifest.get('helpers',[]):
            runtime=(ctypes.c_uint32*3)(helper['rva'],helper['rva']+helper['size'],helper['unwind_rva'])
            count=0
            for record in helper['instruction_stack_states']:
                raw=ctypes.create_string_buffer(1248);address=(ctypes.addressof(raw)+15)&~15
                context=(ctypes.c_ubyte*1232).from_address(address)
                struct.pack_into('<I',context,48,0x10000b)
                struct.pack_into('<Q',context,152,entry_sp-record['depth'])
                struct.pack_into('<Q',context,248,image+record['rva'])
                sentinel={offset:0x33330000+offset*0x100 for offset in (144,160,168,176,216,224,232,240)}
                for offset,value in sentinel.items():struct.pack_into('<Q',context,offset,value)
                handler_data=ctypes.c_void_p();establisher=ctypes.c_uint64()
                handler=unwind(2,image,image+record['rva'],ctypes.addressof(runtime),address,
                               ctypes.byref(handler_data),ctypes.byref(establisher),None)
                if struct.unpack_from('<Q',context,152)[0]!=entry_sp+8 or struct.unpack_from('<Q',context,248)[0]!=return_address:
                    raise AssertionError(('helper stack/return unwind',helper['name'],record))
                if any(struct.unpack_from('<Q',context,offset)[0]!=value for offset,value in sentinel.items()):
                    raise AssertionError(('helper nonvolatile unwind',helper['name'],record))
                if handler is not None:raise AssertionError(('unexpected helper handler',helper['name'],record))
                count+=1
            results.append(dict(name=helper['name'],instruction_boundaries=count,status='passed'))
        return dict(windows_api='RtlVirtualUnwind',results=results,
                    total_boundaries=sum(r['instruction_boundaries'] for r in results),
                    image_executed=False,memory_protection='PAGE_READWRITE')
    finally:
        kernel.VirtualFree(image,0,0x8000);kernel.VirtualFree(stack,0,0x8000)
