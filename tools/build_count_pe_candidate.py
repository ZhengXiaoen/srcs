"""Version-locked, offline x64 PE trampoline construction.

The module never writes files, starts a process or installs a candidate.
Dependencies are loaded only when build_candidate is called. A candidate is
not a claim of gameplay correctness or approval to deploy.
"""
from __future__ import annotations

import bisect
import hashlib
import struct


class UnsupportedPatch(ValueError):
    pass


def _align(value, alignment):
    return (value + alignment - 1) // alignment * alignment


def _integer(value):
    return int(value, 0) if isinstance(value, str) else int(value)


def _old_bytes(value):
    return bytes.fromhex(value) if isinstance(value, str) else bytes(value)


def _near_jump(source, target):
    # CS override is ignored for near jumps in x64, but prevents Windows v1
    # epilog recognizer interpreting a detour as an original tail-call epilog.
    distance = target - source - 6
    if not -(1 << 31) <= distance < (1 << 31):
        raise UnsupportedPatch("Trampoline jump is outside rel32 range")
    return b"\x2e\xe9" + struct.pack("<i", distance)


def build_candidate(exe_bytes, expected_sha256, sites, replace_instruction=None,
                    *, cave_stride=0x400, section_name=b".count16", helpers=None,
                    helper_stride=0x1000):
    """Return {bytes, manifest}; refuse unsupported or ambiguous instructions.

    sites: {rva, old, name, replacement, terminal?}; old may cover several
    instructions. replacement(context, new_va) returns bytes or assembly.
    A global replace_instruction callback is also accepted. context contains
    rva, ins, image_base, old, end and entry. Non-replaced successor instructions
    are automatically preserved with RIP/direct-relative operands relocated.
    terminal=True means the callback already jumps to the original end.
    helpers: independent {name, code(va,context), frame_size, prolog_size}
    functions with one stack-allocation prolog and no nonvolatile writes.
    All site/helper contexts contain helpers[name] as a VA, helper_rvas[name]
    as an RVA, and helper_addrs[name] as {va,rva}.

    Unwind support: x64 frameRegister=0 body sites; each temporary stack-depth
    range chains to cloned original unwind data. Recognized FH3 FuncInfo IP
    maps are cloned and extended with cave state transitions. Unsupported
    exception formats and original prolog/epilog sites are refused.
    """
    import pefile
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64, CS_GRP_JUMP, CS_GRP_CALL
    from capstone.x86 import X86_OP_IMM, X86_OP_MEM, X86_OP_REG, X86_REG_RIP, X86_REG_RSP
    from keystone import Ks, KS_ARCH_X86, KS_MODE_64

    original = bytes(exe_bytes)
    digest = hashlib.sha256(original).hexdigest()
    if digest.lower() != expected_sha256.lower():
        raise UnsupportedPatch("Executable SHA256 does not match exact supported version")
    pe = pefile.PE(data=original, fast_load=False)
    if pe.FILE_HEADER.Machine != 0x8664 or pe.OPTIONAL_HEADER.Magic != 0x20b:
        raise UnsupportedPatch("Only native x64 PE32+ candidates are supported")
    base = pe.OPTIONAL_HEADER.ImageBase
    cs = Cs(CS_ARCH_X86, CS_MODE_64); cs.detail = True
    ks = Ks(KS_ARCH_X86, KS_MODE_64)
    assemble = lambda source, address: bytes(ks.asm(source, address)[0])
    functions = [(e.struct.BeginAddress, e.struct.EndAddress, e.struct.UnwindData)
                 for e in getattr(pe, "DIRECTORY_ENTRY_EXCEPTION", [])]
    functions.sort()
    begins = [f[0] for f in functions]
    if any(a[1] > b[0] for a, b in zip(functions, functions[1:])):
        raise UnsupportedPatch("Original runtime function ranges overlap")

    def function_at(rva):
        index = bisect.bisect_right(begins, rva) - 1
        if index < 0 or not functions[index][0] <= rva < functions[index][1]:
            raise UnsupportedPatch(f"Site {rva:x} has no x64 runtime function metadata")
        return functions[index]

    def decode(data, rva):
        result = list(cs.disasm(data, base + rva))
        if sum(i.size for i in result) != len(data):
            raise UnsupportedPatch(f"Incomplete instruction decode at {rva:x}")
        return result

    unwind_cache = {}

    def unwind(function):
        if function in unwind_cache:
            return unwind_cache[function]
        begin, end, unwind_rva = function
        head = pe.get_data(unwind_rva, 4)
        version, flags, prolog, count, frame = head[0] & 7, head[0] >> 3, head[1], head[2], head[3]
        if version != 1 or flags & 4 or frame != 0:
            raise UnsupportedPatch(f"Unsupported original unwind/frame format at {begin:x}")
        length = 4 + _align(count, 2) * 2
        raw = pe.get_data(unwind_rva, length)
        info = dict(function=function, raw=raw, flags=flags, prolog=prolog,
                    handler=None, funcinfo=None, ipstates=[])
        if flags & 3:
            handler, funcinfo = struct.unpack("<II", pe.get_data(unwind_rva + length, 8))
            fields = list(struct.unpack("<10I", pe.get_data(funcinfo, 40)))
            if fields[0] != 0x19930522 or fields[5] > 100000:
                raise UnsupportedPatch(f"Unrecognized C++ exception handler/FuncInfo at {begin:x}")
            ipstates = [struct.unpack("<Ii", pe.get_data(fields[6] + j * 8, 8))
                        for j in range(fields[5])]
            if not ipstates or ipstates != sorted(ipstates) or ipstates[0][0] > begin:
                raise UnsupportedPatch(f"Invalid original FH3 IP state map at {begin:x}")
            info.update(handler=handler, funcinfo=fields, ipstates=ipstates)
        unwind_cache[function] = info
        return info

    def state_at(info, rva):
        if not info["ipstates"]:
            return -1
        points = [p[0] for p in info["ipstates"]]
        index = bisect.bisect_right(points, rva) - 1
        if index < 0:
            raise UnsupportedPatch("FH3 map does not cover patched instruction")
        return info["ipstates"][index][1]

    entries = []
    for site in sites:
        e = dict(site)
        e["rva"] = _integer(e.get("rva", e.get("site")))
        e["old"] = _old_bytes(e["old"])
        e["end"] = e["rva"] + len(e["old"])
        if "end" in site and _integer(site["end"]) != e["end"]:
            raise UnsupportedPatch("Explicit block end conflicts with old bytes")
        if not e["old"] or pe.get_data(e["rva"], len(e["old"])) != e["old"]:
            raise UnsupportedPatch(f"Original instruction bytes mismatch at {e['rva']:x}")
        function = function_at(e["rva"])
        if e["end"] > function[1]:
            raise UnsupportedPatch("Patch crosses original function boundary")
        info = unwind(function)
        if e["rva"] < function[0] + info["prolog"]:
            raise UnsupportedPatch("Original prolog cannot be overwritten")
        e["instructions"] = decode(e["old"], e["rva"])
        e["function"] = function
        if len({state_at(info, i.address - base) for i in e["instructions"]}) > 1:
            raise UnsupportedPatch("Precombined replacement crosses a C++ state transition")
        entries.append(e)
    entries.sort(key=lambda e: e["rva"])
    if not entries:
        raise UnsupportedPatch("No patch sites supplied")
    if any(a["end"] > b["rva"] for a, b in zip(entries, entries[1:])):
        raise UnsupportedPatch("Patch manifest instruction ranges overlap")

    function_instructions = {}
    cs_function = Cs(CS_ARCH_X86, CS_MODE_64); cs_function.detail = True; cs_function.skipdata = True
    for e in entries:
        f = e["function"]
        if f not in function_instructions:
            # MSVC places jump-table data in some RUNTIME_FUNCTION ranges.
            # The site and emitted code remain strict-decoded; a noninstruction
            # record is never eligible as a preserved successor.
            function_instructions[f] = [i for i in cs_function.disasm(pe.get_data(f[0], f[1]-f[0]), base+f[0]) if i.id]
        boundaries = {i.address - base for i in function_instructions[f]}
        if e["rva"] not in boundaries:
            raise UnsupportedPatch("Manifest site is not a verified original instruction boundary")

    # Collect incoming direct edges before choosing an interval. A short store
    # immediately before a branch target must borrow its predecessor instead
    # of swallowing that target as a successor.
    direct_edges = set()
    cs_scan = Cs(CS_ARCH_X86, CS_MODE_64); cs_scan.detail = True; cs_scan.skipdata = True
    text_sections = [s for s in pe.sections if s.Name.rstrip(b"\0") == b".text"]
    for section in text_sections:
        for ins in cs_scan.disasm(section.get_data()[:section.Misc_VirtualSize], base+section.VirtualAddress):
            if ins.id and (ins.group(CS_GRP_JUMP) or ins.group(CS_GRP_CALL)) and ins.operands and ins.operands[0].type == X86_OP_IMM:
                direct_edges.add((ins.address-base, ins.operands[0].imm-base))
    for begin, end, _ in functions:
        for ins in cs_function.disasm(pe.get_data(begin,end-begin),base+begin):
            if ins.id and (ins.group(CS_GRP_JUMP) or ins.group(CS_GRP_CALL)) and ins.operands and ins.operands[0].type == X86_OP_IMM:
                direct_edges.add((ins.address-base,ins.operands[0].imm-base))
    incoming_targets = sorted({target for _,target in direct_edges})

    def has_incoming_middle(start,end):
        index = bisect.bisect_right(incoming_targets,start)
        return index < len(incoming_targets) and incoming_targets[index] < end

    intervals = []
    for e in entries:
        block = dict(start=e["rva"], end=e["end"], function=e["function"], entries=[e])
        instructions = function_instructions[e["function"]]
        while block["end"] - block["start"] < 6:
            following = next((i for i in instructions if i.address - base == block["end"]), None)
            if following is not None and not has_incoming_middle(block["start"],block["end"]+following.size):
                block["end"] += following.size
                continue
            preceding = next((i for i in instructions if i.address-base+i.size==block["start"]),None)
            if (preceding is not None and preceding.address-base >= e["function"][0]+unwind(e["function"])["prolog"]
                    and not has_incoming_middle(preceding.address-base,block["end"])):
                block["start"] = preceding.address-base
                continue
            raise UnsupportedPatch(f"Cannot select six whole bytes without swallowing incoming target at {e['rva']:x}")
        intervals.append(block)
    blocks=[]
    for block in sorted(intervals,key=lambda b:b["start"]):
        if blocks and block["start"] < blocks[-1]["end"]:
            previous=blocks[-1]
            if previous["function"] != block["function"]:
                raise UnsupportedPatch("Overlapping blocks cross function boundary")
            previous["end"]=max(previous["end"],block["end"])
            previous["entries"].extend(block["entries"])
            previous["entries"].sort(key=lambda e:e["rva"])
        else:
            blocks.append(block)
    # An earlier extended interval can swallow a later interval; the loop
    # above handles it, but this explicit assertion is retained as a guard.
    if any(a["end"] > b["start"] for a, b in zip(blocks, blocks[1:])):
        raise UnsupportedPatch("Grouped patch blocks overlap")

    def epilog_addresses(f):
        instructions = function_instructions[f]
        result = set()
        for index, ins in enumerate(instructions):
            if ins.mnemonic.startswith("ret"):
                result.add(ins.address - base)
                prev = index - 1
                while prev >= 0 and instructions[prev].mnemonic in ("pop", "nop"):
                    result.add(instructions[prev].address - base); prev -= 1
                if prev >= 0:
                    text = instructions[prev].mnemonic + " " + instructions[prev].op_str
                    if text.startswith("add rsp,") or text.startswith("lea rsp,"):
                        result.add(instructions[prev].address - base)
        return result

    block_starts = [b["start"] for b in blocks]

    def inside_middle(target):
        index = bisect.bisect_right(block_starts, target) - 1
        return index >= 0 and blocks[index]["start"] < target < blocks[index]["end"]

    for block in blocks:
        block["instructions"] = [i for i in function_instructions[block["function"]]
                                  if block["start"] <= i.address - base < block["end"]]
        if any(i.address - base in epilog_addresses(block["function"]) for i in block["instructions"]):
            raise UnsupportedPatch("Original epilog instruction cannot be overwritten")
        terminal = [e for e in block["entries"] if e.get("terminal")]
        if terminal and (len(block["entries"]) != 1 or terminal[0]["end"] != block["end"]):
            raise UnsupportedPatch("Terminal replacement must cover its complete grouped block")

    # Scan runtime ranges and all remaining .text bytes. skipdata is used only
    # for the section-wide incoming-edge check, never for patch decoding.
    incoming_checked = len(direct_edges)
    for source,target in sorted(direct_edges):
        if inside_middle(target):
            raise UnsupportedPatch(f"Direct branch/call enters overwritten middle at {source:x} -> {target:x}")

    new_header = pe.sections[-1].get_file_offset() + 40
    first_raw = min(s.PointerToRawData for s in pe.sections if s.SizeOfRawData)
    if new_header + 40 > first_raw or new_header + 40 > pe.OPTIONAL_HEADER.SizeOfHeaders:
        raise UnsupportedPatch("PE header has no room for one extra section")
    if any(original[new_header:new_header + 40]):
        raise UnsupportedPatch("Nonzero PE header bytes would be overwritten")
    section_rva = _align(max(pe.OPTIONAL_HEADER.SizeOfImage,
                             max(s.VirtualAddress + max(s.Misc_VirtualSize, s.SizeOfRawData) for s in pe.sections)),
                         pe.OPTIONAL_HEADER.SectionAlignment)
    helper_specs = [dict(h) for h in (helpers or [])]
    helper_names = [h["name"] for h in helper_specs]
    if len(helper_names) != len(set(helper_names)):
        raise UnsupportedPatch("Duplicate independent helper name")
    helper_rvas = {h["name"]: section_rva + len(blocks)*cave_stride + index*helper_stride
                   for index,h in enumerate(helper_specs)}
    helper_vas = {name: base+rva for name,rva in helper_rvas.items()}
    helper_context = dict(image_base=base,helpers=helper_vas,helper_rvas=helper_rvas,
                          helper_addrs={name:dict(va=base+rva,rva=rva) for name,rva in helper_rvas.items()})
    blob = bytearray(len(blocks) * cave_stride + len(helper_specs)*helper_stride)
    segments = []
    extra_states = {}
    relocations = []

    def protect_detour_jumps(code,address):
        """Rebuild callback-local labels after widening every direct JMP.

        Windows may classify a direct jump to another runtime range as an
        epilog even when it occurs in the middle of a replacement sequence.
        The ignored CS prefix avoids that classification. Conditional branches
        are fixed to rel32 so the second pass has a stable layout.
        """
        instructions=decode(code,address-base)
        new_addresses={};cursor=address
        for ins in instructions:
            new_addresses[ins.address]=cursor
            direct=bool(ins.operands and ins.operands[0].type==X86_OP_IMM)
            if ins.mnemonic=="jmp" and direct:size=6
            elif ins.group(CS_GRP_JUMP) and direct and (ins.bytes[0] in range(0x70,0x80) or ins.bytes[:1]==b"\x0f"):size=6
            else:size=ins.size
            cursor+=size
        new_addresses[address+len(code)]=cursor
        result=bytearray()
        for ins in instructions:
            new=new_addresses[ins.address]
            if (ins.group(CS_GRP_JUMP) or ins.group(CS_GRP_CALL)) and ins.operands and ins.operands[0].type==X86_OP_IMM:
                original_target=ins.operands[0].imm
                if address<=original_target<=address+len(code) and original_target not in new_addresses:
                    raise UnsupportedPatch("Callback branch targets a noninstruction boundary")
                target=new_addresses.get(original_target,original_target)
                if ins.mnemonic=="jmp":part=_near_jump(new,target)
                elif ins.mnemonic=="call":part=b"\xe8"+struct.pack("<i",target-new-5)
                elif ins.bytes[0] in range(0x70,0x80):part=b"\x0f"+bytes([ins.bytes[0]+0x10])+struct.pack("<i",target-new-6)
                elif ins.bytes[:1]==b"\x0f" and ins.bytes[1] in range(0x80,0x90):part=ins.bytes[:2]+struct.pack("<i",target-new-6)
                else:
                    part=bytearray(ins.bytes);distance=target-new-ins.size
                    if ins.imm_size!=1 or not -128<=distance<=127:raise UnsupportedPatch("Callback loop branch cannot be widened")
                    part[ins.imm_offset]=distance&255;part=bytes(part)
            else:
                part=bytearray(ins.bytes)
                for operand in ins.operands:
                    if operand.type==X86_OP_MEM and operand.mem.base==X86_REG_RIP:
                        target=ins.address+ins.size+operand.mem.disp
                        if target in new_addresses:target=new_addresses[target]
                        distance=target-new-ins.size
                        if ins.disp_size!=4 or not -(1<<31)<=distance<(1<<31):raise UnsupportedPatch("Callback RIP operand cannot be relocated")
                        part[ins.disp_offset:ins.disp_offset+4]=struct.pack("<i",distance)
                part=bytes(part)
            result.extend(part)
        return bytes(result)

    def relocate(ins, address):
        code = bytearray(ins.bytes)
        if (ins.group(CS_GRP_JUMP) or ins.group(CS_GRP_CALL)) and ins.operands and ins.operands[0].type == X86_OP_IMM:
            target = ins.operands[0].imm
            if ins.mnemonic == "call":
                code = b"\xe8" + struct.pack("<i", target - address - 5)
            elif ins.mnemonic == "jmp":
                code = _near_jump(address, target)
            elif ins.bytes[0] in range(0x70, 0x80):
                code = b"\x0f" + bytes([ins.bytes[0] + 0x10]) + struct.pack("<i", target - address - 6)
            elif ins.bytes[:1] == b"\x0f" and len(ins.bytes) >= 2 and ins.bytes[1] in range(0x80, 0x90):
                code = ins.bytes[:2] + struct.pack("<i", target - address - 6)
            else:
                distance = target - address - ins.size
                if ins.imm_size != 1 or not -128 <= distance <= 127:
                    raise UnsupportedPatch("Cannot safely relocate loop/jcxz or unfamiliar branch")
                code[ins.imm_offset] = distance & 255
            relocations.append(dict(kind="relative-control", old_rva=ins.address-base,
                                    new_rva=address-base, target_rva=target-base))
        else:
            for operand in ins.operands:
                if operand.type == X86_OP_MEM and operand.mem.base == X86_REG_RIP:
                    target = ins.address + ins.size + operand.mem.disp
                    distance = target - address - len(code)
                    if ins.disp_size != 4 or not -(1 << 31) <= distance < (1 << 31):
                        raise UnsupportedPatch("RIP operand is outside supported displacement range")
                    code[ins.disp_offset:ins.disp_offset + 4] = struct.pack("<i", distance)
                    relocations.append(dict(kind="rip-memory", old_rva=ins.address-base,
                                            new_rva=address-base, target_rva=target-base))
        return bytes(code)

    def add_states(function, start, instructions, source_rva, depths):
        info = unwind(function)
        if info["handler"] is not None and any(depths):
            # CHAIN+ALLOC restores the caller context, but Windows reports
            # EstablisherFrame from pre-unwind RSP. A language handler would
            # then see a frame displaced by the temporary pushes.
            raise UnsupportedPatch("Temporary push/pop inside a language-handler function requires explicit frame correction")
        state = state_at(info, source_rva)
        extra_states.setdefault(function, []).append((start, state))
        for ins, delta in zip(instructions, depths):
            if delta not in (0, 8, 16):
                raise UnsupportedPatch("Only reversible 0/8/16-byte temporary stack depths are supported")
            segments.append((ins.address-base, ins.address-base+ins.size, delta, function))

    def stack_depths(code, address):
        instructions = decode(code, address-base)
        depth, result = 0, []
        pushed = []
        offsets = {i.address for i in instructions}
        for ins in instructions:
            result.append(depth)
            if ins.mnemonic in ("push", "pushfq"):
                operand = "flags" if ins.mnemonic == "pushfq" else ins.op_str
                if operand not in ("flags", "rax", "rcx", "rdx", "r8", "r9", "r10", "r11"):
                    raise UnsupportedPatch("Temporary pushes may save only flags or volatile x64 registers")
                pushed.append(operand)
                depth += 8
            elif ins.mnemonic in ("pop", "popfq"):
                operand = "flags" if ins.mnemonic == "popfq" else ins.op_str
                if not pushed or pushed.pop() != operand:
                    raise UnsupportedPatch("Temporary push/pop register order does not match")
                depth -= 8
            elif ins.operands and ins.operands[0].type == X86_OP_REG and ins.operands[0].reg == X86_REG_RSP:
                raise UnsupportedPatch("Replacement changes RSP outside supported push/pop pattern")
            if not 0 <= depth <= 16:
                raise UnsupportedPatch("Replacement temporary stack allocation is unsupported")
        if depth != 0:
            raise UnsupportedPatch("Replacement does not restore RSP")
        # Internal branches must preserve stack depth. Also refuse outbound
        # branches with unbalanced pushes and re-entry to original middles.
        depth_at = {i.address: d for i, d in zip(instructions, result)}
        for ins, delta in zip(instructions, result):
            if ins.group(CS_GRP_JUMP) and ins.operands and ins.operands[0].type == X86_OP_IMM:
                target = ins.operands[0].imm
                if target in offsets:
                    if depth_at[target] != delta:
                        raise UnsupportedPatch("Replacement branch crosses a temporary-stack state")
                elif delta != 0 or inside_middle(target-base):
                    raise UnsupportedPatch("Replacement branch leaves with unbalanced stack or targets overwritten middle")
            # Absolute image addresses in immediate data require additional
            # base relocations, which are deliberately unsupported here.
            if not ins.group(CS_GRP_JUMP) and not ins.group(CS_GRP_CALL):
                if any(o.type == X86_OP_IMM and base <= o.imm < base + pe.OPTIONAL_HEADER.SizeOfImage for o in ins.operands):
                    raise UnsupportedPatch("Replacement embeds an unrelocated absolute image address")
        return instructions, result

    block_reports = []
    for index, block in enumerate(blocks):
        start = section_rva + index * cave_stride
        address, output, consumed = base + start, bytearray(), set()
        by_rva = {e["rva"]: e for e in block["entries"]}
        for ins in block["instructions"]:
            rva = ins.address-base
            if rva in consumed:
                continue
            e = by_rva.get(rva)
            if e:
                context = dict(helper_context,rva=rva,ins=ins,old=e["old"],end=e["end"],entry=e)
                callback = e.get("replacement", replace_instruction)
                if callback is not None:
                    code = callback(context, address)
                else:
                    code = e.get("replacement_asm")
                    if code is None:
                        raise UnsupportedPatch("No instruction replacement supplied")
                code = assemble(code, address) if isinstance(code, str) else bytes(code)
                code = protect_detour_jumps(code,address)
                consumed.update(i.address-base for i in e["instructions"])
            else:
                code = relocate(ins, address)
            newins, depths = stack_depths(code, address)
            add_states(block["function"], address-base, newins, rva, depths)
            output.extend(code); address += len(code)
        if not any(e.get("terminal") for e in block["entries"]):
            jump = _near_jump(address, base + block["end"])
            jumpins = decode(jump, address-base)
            add_states(block["function"], address-base, jumpins, block["end"]-1, [0])
            output.extend(jump)
        else:
            last = list(cs.disasm(output, base+start))[-1]
            if last.mnemonic != "jmp" or last.operands[0].type != X86_OP_IMM or last.operands[0].imm != base+block["end"]:
                raise UnsupportedPatch("Terminal callback must end with a direct jump to original block end")
        if len(output) > cave_stride:
            raise UnsupportedPatch("Generated grouped trampoline exceeds fixed layout slot")
        blob[index*cave_stride:index*cave_stride+len(output)] = output
        patch = _near_jump(base+block["start"], base+start) + b"\x90"*(block["end"]-block["start"]-6)
        block_reports.append(dict(site_rva=block["start"], end_rva=block["end"], cave_rva=start,
                                  old=pe.get_data(block["start"], block["end"]-block["start"]).hex(),
                                  patch=patch.hex(), trampoline=bytes(output).hex(),
                                  names=[e.get("name", "") for e in block["entries"]]))

    def append(data, alignment=4):
        offset = _align(len(blob), alignment)
        blob.extend(b"\0"*(offset-len(blob)))
        rva = section_rva + offset
        blob.extend(data)
        return rva

    helper_reports=[]
    helper_functions=[]
    nonvolatile={"rbx","rbp","rsi","rdi","r12","r13","r14","r15"}
    nonvolatile.update(f"xmm{i}" for i in range(6,16))
    aliases={"ebx":"rbx","bx":"rbx","bl":"rbx","bh":"rbx",
             "ebp":"rbp","bp":"rbp","bpl":"rbp","esi":"rsi","si":"rsi","sil":"rsi",
             "edi":"rdi","di":"rdi","dil":"rdi"}
    for number in range(12,16):
        aliases.update({f"r{number}{suffix}":f"r{number}" for suffix in ("d","w","b")})
    for h in helper_specs:
        name=h["name"];rva=helper_rvas[name];address=base+rva
        callback=h.get("code",h.get("replacement"))
        code=callback(address,dict(helper_context,name=name)) if callable(callback) else callback
        code=assemble(code,address) if isinstance(code,str) else bytes(code)
        if not code or len(code)>helper_stride:
            raise UnsupportedPatch("Independent helper is empty or exceeds fixed slot")
        instructions=decode(code,rva)
        frame=_integer(h["frame_size"]);prolog=_integer(h["prolog_size"])
        if frame<32 or frame%16!=8 or frame>0xffff*8:
            raise UnsupportedPatch("Helper frame must include shadow space and x64 call alignment")
        first=instructions[0]
        if (first.mnemonic!="sub" or len(first.operands)!=2 or first.operands[0].type!=X86_OP_REG
                or first.operands[0].reg!=X86_REG_RSP or first.operands[1].type!=X86_OP_IMM
                or first.operands[1].imm!=frame or first.size!=prolog):
            raise UnsupportedPatch("Helper prolog must be exactly its declared sub rsp,frame_size")
        by_address={i.address:i for i in instructions}
        stack_in={address:0};queue=[address]
        while queue:
            pc=queue.pop();ins=by_address[pc];depth=stack_in[pc];after=depth
            regs_read,regs_write=ins.regs_access()
            if any(aliases.get(ins.reg_name(reg),ins.reg_name(reg)) in nonvolatile for reg in regs_write):
                raise UnsupportedPatch("Helper writes a nonvolatile register without save/unwind metadata")
            if ins.mnemonic in ("push","pushfq","pop","popfq","enter","leave"):
                raise UnsupportedPatch("Helper must use only its single declared stack frame")
            if ins.operands and ins.operands[0].type==X86_OP_REG and ins.operands[0].reg==X86_REG_RSP:
                if pc==address:
                    after=frame
                elif (ins.mnemonic=="add" and len(ins.operands)==2 and ins.operands[1].type==X86_OP_IMM
                        and ins.operands[1].imm==frame and depth==frame):
                    after=0
                else:
                    raise UnsupportedPatch("Unsupported independent-helper stack change")
            if ins.group(CS_GRP_CALL) and (depth!=frame or after!=frame):
                raise UnsupportedPatch("Helper call occurs outside its allocated/aligned frame")
            if ins.group(CS_GRP_CALL) and ins.operands and ins.operands[0].type==X86_OP_IMM:
                if inside_middle(ins.operands[0].imm-base):
                    raise UnsupportedPatch("Independent helper call targets an overwritten instruction middle")
            next_pc=pc+ins.size;successors=[]
            if ins.mnemonic.startswith("ret"):
                if depth!=0 or ins.mnemonic!="ret" or ins.operands:
                    raise UnsupportedPatch("Helper return does not restore its frame")
            elif ins.group(CS_GRP_JUMP):
                if not ins.operands or ins.operands[0].type!=X86_OP_IMM or ins.operands[0].imm not in by_address:
                    raise UnsupportedPatch("Independent helper jump leaves its own function")
                successors.append(ins.operands[0].imm)
                if ins.mnemonic!="jmp":successors.append(next_pc)
            else:
                successors.append(next_pc)
            for target in successors:
                if target not in by_address:
                    raise UnsupportedPatch("Independent helper falls through outside its code")
                if target in stack_in:
                    if stack_in[target]!=after:raise UnsupportedPatch("Helper control flow joins incompatible stack states")
                else:
                    stack_in[target]=after;queue.append(target)
            if not ins.group(CS_GRP_JUMP) and not ins.group(CS_GRP_CALL):
                if any(o.type==X86_OP_IMM and base<=o.imm<base+pe.OPTIONAL_HEADER.SizeOfImage for o in ins.operands):
                    raise UnsupportedPatch("Helper embeds an unrelocated absolute image address")
        if len(stack_in)!=len(instructions):
            raise UnsupportedPatch("Independent helper contains unverified unreachable instructions")
        offset=rva-section_rva;blob[offset:offset+len(code)]=code
        # UWOP_ALLOC_LARGE with OpInfo=0 consumes two slots. Stack allocation
        # applies only after the complete prolog instruction has executed.
        unwind_code=bytes([1,prolog,2,0,prolog,1])+struct.pack("<H",frame//8)
        unwind_rva=append(unwind_code)
        helper_functions.append((rva,rva+len(code),unwind_rva))
        helper_reports.append(dict(name=name,rva=rva,va=address,size=len(code),code=code.hex(),
                                   frame_size=frame,prolog_size=prolog,unwind_rva=unwind_rva,
                                   instruction_stack_states=[dict(rva=i.address-base,depth=stack_in[i.address]) for i in instructions]))

    clones = {}
    exception_reports = []
    for function, states in extra_states.items():
        info = unwind(function)
        raw = info["raw"]
        cloned_funcinfo = None
        if info["handler"] is not None:
            # Original state table entries are retained. Each cave end resets
            # to -1 so unused padding is not assigned a live C++ state.
            map_entries = list(info["ipstates"]) + list(states)
            for b in block_reports:
                if function_at(b["site_rva"]) == function:
                    map_entries.append((b["cave_rva"] + len(bytes.fromhex(b["trampoline"])), -1))
            merged = {}
            for ip, state in map_entries:
                if ip in merged and merged[ip] != state:
                    raise UnsupportedPatch("Conflicting C++ state mappings in candidate")
                merged[ip] = state
            sorted_map = sorted(merged.items())
            map_rva = append(b"".join(struct.pack("<Ii", *p) for p in sorted_map))
            fields = list(info["funcinfo"]); fields[5], fields[6] = len(sorted_map), map_rva
            cloned_funcinfo = append(struct.pack("<10I", *fields))
            raw += struct.pack("<II", info["handler"], cloned_funcinfo)
        cloned_unwind = append(raw)
        clones[function] = (function[0], function[1], cloned_unwind)
        exception_reports.append(dict(function_rva=function[0], original_unwind_rva=function[2],
                                      cloned_unwind_rva=cloned_unwind, handler_rva=info["handler"],
                                      cloned_funcinfo_rva=cloned_funcinfo,
                                      original_ip_states=len(info["ipstates"]), added_ip_states=len(states)))

    # Coalesce only contiguous instructions with equal depth/function. The
    # prolog size is zero: CodeOffset=0 allocation already applies at BeginPC.
    coalesced = []
    for start, end, delta, function in sorted(segments):
        if coalesced and coalesced[-1][1] == start and coalesced[-1][2:] == [delta, function]:
            coalesced[-1][1] = end
        else:
            coalesced.append([start, end, delta, function])
    new_functions = []
    unwind_by_depth = {}
    for start, end, delta, function in coalesced:
        key = function, delta
        if key not in unwind_by_depth:
            count = 1 if delta else 0
            raw = bytes([1 | (4 << 3), 0, count, 0])
            if delta:
                raw += bytes([0, 2 | (((delta-8)//8) << 4), 0, 0])
            raw += struct.pack("<III", *clones[function])
            unwind_by_depth[key] = append(raw)
        new_functions.append((start, end, unwind_by_depth[key]))
    new_functions.extend(helper_functions)
    complete_functions = sorted(functions + new_functions)
    if any(a[1] > b[0] for a, b in zip(complete_functions, complete_functions[1:])):
        raise UnsupportedPatch("Candidate runtime function ranges overlap")
    pdata_rva = append(b"".join(struct.pack("<III", *f) for f in complete_functions))
    pdata_size = len(complete_functions)*12

    candidate = bytearray(original)
    raw_offset = _align(len(candidate), pe.OPTIONAL_HEADER.FileAlignment)
    raw_size = _align(len(blob), pe.OPTIONAL_HEADER.FileAlignment)
    candidate.extend(b"\0"*(raw_offset-len(candidate)))
    candidate.extend(blob); candidate.extend(b"\0"*(raw_size-len(blob)))
    header = struct.pack("<8sIIIIIIHHI", section_name[:8], len(blob), section_rva,
                         raw_size, raw_offset, 0, 0, 0, 0, 0x60000020)
    candidate[new_header:new_header+40] = header
    struct.pack_into("<H", candidate, pe.FILE_HEADER.get_field_absolute_offset("NumberOfSections"),
                     pe.FILE_HEADER.NumberOfSections+1)
    struct.pack_into("<I", candidate, pe.OPTIONAL_HEADER.get_field_absolute_offset("SizeOfImage"),
                     _align(section_rva+len(blob), pe.OPTIONAL_HEADER.SectionAlignment))
    struct.pack_into("<I", candidate, pe.OPTIONAL_HEADER.get_field_absolute_offset("SizeOfCode"),
                     pe.OPTIONAL_HEADER.SizeOfCode+raw_size)
    exception_dir = pe.OPTIONAL_HEADER.DATA_DIRECTORY[3]
    struct.pack_into("<II", candidate, exception_dir.get_file_offset(), pdata_rva, pdata_size)
    security_dir = pe.OPTIONAL_HEADER.DATA_DIRECTORY[4]
    # Any original Authenticode signature no longer verifies modified bytes.
    struct.pack_into("<II", candidate, security_dir.get_file_offset(), 0, 0)
    for b in block_reports:
        offset = pe.get_offset_from_rva(b["site_rva"])
        candidate[offset:offset+b["end_rva"]-b["site_rva"]] = bytes.fromhex(b["patch"])
    struct.pack_into("<I", candidate, pe.OPTIONAL_HEADER.get_field_absolute_offset("CheckSum"), 0)
    check = pefile.PE(data=bytes(candidate))
    struct.pack_into("<I", candidate, pe.OPTIONAL_HEADER.get_field_absolute_offset("CheckSum"), check.generate_checksum())
    result = bytes(candidate)
    # Independently reparse emitted structures and verify every covered byte.
    verify = pefile.PE(data=result)
    parsed_functions = [(e.struct.BeginAddress, e.struct.EndAddress, e.struct.UnwindData)
                        for e in verify.DIRECTORY_ENTRY_EXCEPTION]
    if parsed_functions != complete_functions:
        raise UnsupportedPatch("Emitted exception directory did not reparse identically")
    for b in block_reports:
        if verify.get_data(b["site_rva"], len(bytes.fromhex(b["patch"]))).hex() != b["patch"]:
            raise UnsupportedPatch("Emitted original-site patch mismatch")
        if verify.get_data(b["cave_rva"], len(bytes.fromhex(b["trampoline"]))).hex() != b["trampoline"]:
            raise UnsupportedPatch("Emitted trampoline mismatch")
    return dict(bytes=result, manifest=dict(deployable=False, original_sha256=digest,
                candidate_sha256=hashlib.sha256(result).hexdigest(), image_base=base,
                section_rva=section_rva, section_size=len(blob), blocks=block_reports,
                helpers=helper_reports,
                runtime_function_count=len(complete_functions), new_runtime_functions=new_functions,
                temporary_stack_segments=[dict(begin=s, end=e, delta=d, function=f[0])
                                          for s, e, d, f in coalesced],
                exception_clones=exception_reports, exception_directory_rva=pdata_rva,
                exception_directory_size=pdata_size, direct_edges_checked=incoming_checked,
                preserved_instruction_relocations=relocations,
                limitations=["offline candidate; original server never executed",
                             "FH3 stack/IP-state metadata is structurally cloned; actual exception dispatch requires runtime validation",
                             "temporary push/pop accepted only for original functions without language handlers",
                             "indirect jump-table incoming edges require target-specific coverage outside this generic builder",
                             "original Authenticode signature directory cleared after modifying bytes"]))
