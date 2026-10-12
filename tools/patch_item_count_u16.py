"""Generate isolated, version-locked item-count patch candidates.

The on-disk CUserItem stays 129 bytes: count low8 at 0x2d, high8 at
0x80. Never widen 0x2d in place: 0x2e contains binding flags.
This tool does not install files or start services. See the accompanying
report for runtime validation still required before deployment.
"""
from __future__ import annotations

import argparse
from collections import Counter
import hashlib
import json
from pathlib import Path
import sys

ROOT = Path(__file__).resolve().parents[1]
LOGIC_SHA256 = "175c95cd1113c16de69d66455355cbfdd38286226a4b9a24c9f5e415af5608a6"
SUPPORTED_LOGIC_SHA256 = {
    LOGIC_SHA256,
    # Current server: existing .jjmount/.jjbuy/.wjsurv patches are preserved.
    # The original six sections have only four .text differences, all outside
    # count patch sites; current-version evidence records their exact ranges.
    "349df27401b8ebca1ba4bf4012f85c4a3424bfd26215c6e091c6048d334631e2",
}
CAPACITY, STACK_LIMIT = 65535, 9999
EXCLUDED_KINDS = {"nonitem", "copy-excluded", "cache-only"}


def register_family(name):
    aliases = {
        "rax": ("rax", "eax", "ax", "al"),
        "rbx": ("rbx", "ebx", "bx", "bl"),
        "rcx": ("rcx", "ecx", "cx", "cl"),
        "rdx": ("rdx", "edx", "dx", "dl"),
        "rsi": ("rsi", "esi", "si", "sil"),
        "rdi": ("rdi", "edi", "di", "dil"),
        "rbp": ("rbp", "ebp", "bp", "bpl"),
        "rsp": ("rsp", "esp", "sp", "spl"),
    }
    aliases.update({f"r{i}": (f"r{i}", f"r{i}d", f"r{i}w", f"r{i}b")
                    for i in range(8, 16)})
    return next(family for family in aliases.values() if name in family)


def oversize_helper(address, context):
    """Page an already validated AddUserItem carrier without losing its metadata.

    RCX is the caller's existing stack frame. A full accepted clone belongs
    to the original container; a partially merged clone is still ours and
    is destroyed after recording the amount accepted. The original carrier
    retains all unaccepted units. Its final <=9999 remainder goes through
    the original ownership path. Only volatile registers are used.
    """
    from keystone import Ks, KS_ARCH_X86, KS_MODE_64
    base = context["image_base"]
    invoke = f"""
        mov r10,[rsp+0x40]
        mov rax,[r10+0x1b0]
        mov [rsp+0x20],rax
        mov rax,[r10+0x1b8]
        mov [rsp+0x28],rax
        mov rax,[r10+0x1c0]
        mov [rsp+0x30],rax
        mov rax,[r10+0x1c8]
        mov [rsp+0x38],rax
        mov rcx,[r10+0x190]
        mov rdx,[rsp+0x58]
        mov r8,[r10+0x1a0]
        mov r9,[r10+0x1a8]
        call {base+0x2a71e0}
    """
    assembly = f"""
        sub rsp,0xf8
        mov [rsp+0x40],rcx
        mov qword ptr [rsp+0x48],0
        mov rax,[rcx+0x198]
        mov [rsp+0x68],rax
        movzx edx,byte ptr [rax+0x80]
        shl edx,8
        mov dl,byte ptr [rax+0x2d]
        cmp edx,9999
        jbe original
        mov rax,[rcx+0x88]
        cmp byte ptr [rax+0x31],1
        jbe original
        again:
        mov rax,[rsp+0x68]
        movzx edx,byte ptr [rax+0x80]
        shl edx,8
        mov dl,byte ptr [rax+0x2d]
        mov [rsp+0x60],rdx
        cmp edx,9999
        jbe final
        call {base+0xe7b0}
        mov rcx,rax
        call {base+0x2ef70}
        mov rcx,rax
        mov dl,1
        mov r10,[rsp+0x40]
        mov r8,[r10+0x1a0]
        mov r9,[r10+0x1a8]
        call {base+0xa1060}
        test rax,rax
        jz done
        mov [rsp+0x58],rax
        mov rdx,[rax]
        mov [rsp+0x70],rdx
        mov rcx,rax
        mov rdx,[rsp+0x68]
        mov r8d,129
        call {base+0x3c557c}
        mov rax,[rsp+0x58]
        mov rdx,[rsp+0x70]
        mov [rax],rdx
        mov byte ptr [rax+0x2d],15
        mov byte ptr [rax+0x80],39
        {invoke}
        mov [rsp+0x50],rax
        cmp rax,9999
        je accepted
        call {base+0xdec0}
        mov rcx,rax
        mov rdx,[rsp+0x58]
        mov r10,[rsp+0x40]
        mov r8,[r10+0x1a0]
        mov r9,[r10+0x1a8]
        call {base+0xa1460}
        accepted:
        mov rax,[rsp+0x50]
        add [rsp+0x48],rax
        mov rdx,[rsp+0x60]
        sub rdx,rax
        mov rax,[rsp+0x68]
        mov byte ptr [rax+0x2d],dl
        shr edx,8
        mov byte ptr [rax+0x80],dl
        cmp qword ptr [rsp+0x50],9999
        je again
        jmp done
        final:
        mov rax,[rsp+0x68]
        mov [rsp+0x58],rax
        {invoke}
        add [rsp+0x48],rax
        done:
        mov rax,[rsp+0x48]
        add rsp,0xf8
        ret
        original:
        mov rax,-1
        add rsp,0xf8
        ret
    """
    return bytes(Ks(KS_ARCH_X86, KS_MODE_64).asm(assembly, address)[0])


def replacement_assembly(entry):
    """Explicitly reviewed operations only; no search/replace by offset."""
    kind = entry["kind"]
    if kind in ("local-width", "explicit"):
        return entry["replacement_asm"]
    base = entry.get("base_register")
    value = entry.get("value_register")
    used = {register_family(r)[0] for r in (base, value) if r}
    scratch = next(r for r in ("r10", "r11", "r9", "r8") if r not in used)
    _, sd, _, sb = register_family(scratch)
    if base == "rsp" and kind != "cache-saturate":
        raise ValueError("Stack-based item accesses require explicit assembly")
    if kind == "read":
        _, vd, _, _ = register_family(value)
        # Read high first: the destination may alias the item pointer.
        return (f"pushfq; push {scratch}; movzx {sd},byte ptr [{base}+0x80]; "
                f"movzx {vd},byte ptr [{base}+0x2d]; shl {sd},8; "
                f"or {vd},{sd}; pop {scratch}; popfq")
    if kind in ("clear", "write"):
        if value:
            _, vd, _, _ = register_family(value)
            return (f"pushfq; push {scratch}; mov {sd},{vd}; shr {sd},8; "
                    f"mov byte ptr [{base}+0x80],{sb}; "
                    f"mov byte ptr [{base}+0x2d],{value}; pop {scratch}; popfq")
        immediate = int(entry["original"].rsplit(",", 1)[1].strip(), 0)
        if not 0 <= immediate <= CAPACITY:
            raise ValueError("Count constant outside uint16")
        return (f"mov byte ptr [{base}+0x2d],{immediate & 255}; "
                f"mov byte ptr [{base}+0x80],{immediate >> 8}")
    if kind == "compare":
        immediate = int(entry["original"].rsplit(",", 1)[1].strip(), 0)
        return (f"push {scratch}; movzx {sd},byte ptr [{base}+0x80]; "
                f"shl {sd},8; mov {sb},byte ptr [{base}+0x2d]; "
                f"cmp {sd},{immediate}; pop {scratch}")
    if kind == "dup-limit":
        _, vd, _, _ = register_family(value)
        return (f"pushfq; movzx {vd},byte ptr [{base}+0x31]; cmp {vd},1; "
                f"jle keep; mov {vd},{STACK_LIMIT}; keep: popfq")
    if kind == "cache-saturate":
        # nNum is followed by the GUID. Keep its layout and only use it as
        # a positive cache; the actual sale count is held in CUserItem.
        displacement = int(entry["displacement"], 0) + 16
        return (f"pushfq; push {scratch}; mov {sd},eax; cmp {sd},255; "
                f"jbe keep; mov {sd},255; keep: "
                f"mov byte ptr [rsp+{displacement}],{sb}; pop {scratch}; popfq")
    raise ValueError("Unreviewed count operation: " + kind)


def logic_manifest(binary, other_manifest):
    import pefile
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    from capstone.x86 import X86_OP_MEM, X86_OP_REG, X86_OP_IMM
    if hashlib.sha256(binary).hexdigest() not in SUPPORTED_LOGIC_SHA256:
        raise ValueError("Unsupported logic server fingerprint")
    pe = pefile.PE(data=binary)
    base = pe.OPTIONAL_HEADER.ImageBase
    cs = Cs(CS_ARCH_X86, CS_MODE_64); cs.detail = True
    entries = json.loads(Path(other_manifest).read_text(encoding="utf-8"))["entries"]
    tail_audit = Path(other_manifest).with_name("item_count_u16_tail_audit.json")
    for patch in json.loads(tail_audit.read_text(encoding="utf-8"))["guild_exit_patches"]:
        entries.append(dict(patch, kind="explicit"))
    entries.extend([
        dict(rva="0x2a6654", bytes="e807aadfff", kind="explicit", function="AddItem allocation failure guard",
             original="call allocItem", replacement_asm=f"call {base+0xa1060}; test rax,rax; jz {base+0x2a690f}",
             evidence_type="NULL allocation stops paging through original notification and accepted-count return; last successful item remains intact"),
        dict(rva="0x6da9f", bytes="0fb69092000000", kind="explicit", function="SendAuctionItemData",
             original="movzx edx,byte ptr [rax+0x92]", replacement_asm="movzx edx,word ptr [rax+0x92]",
             evidence_type="auction stores ItemOPParam.wCount as uint16; paired client reads uint16"),
        dict(rva="0x6daab", bytes="e880e2f9ff", kind="explicit", function="SendAuctionItemData",
             original="call byte packet writer", replacement_asm=f"call {base+0xb630}",
             evidence_type="use existing WORD packet writer; paired client method14702"),
    ])
    core = {0x2a63f0, 0x2a6c20, 0x2a6dc0, 0x2a6f20, 0x2a71e0,
            0x2a7f30, 0x2a82c0, 0x2a86e0, 0x2a88d0, 0x2a8ae0,
            0x2a8c40, 0x2a8f70}
    all_instructions = {}
    for record in pe.DIRECTORY_ENTRY_EXCEPTION:
        f = record.struct
        instructions = list(cs.disasm(pe.get_data(f.BeginAddress, f.EndAddress-f.BeginAddress),
                                      base+f.BeginAddress))
        for ins in instructions:
            all_instructions[ins.address-base] = (ins, f.BeginAddress)
        if f.BeginAddress not in core:
            continue
        for ins in instructions:
            mem = next((o for o in ins.operands if o.type == X86_OP_MEM
                        and o.mem.disp == 0x2d and o.mem.index == 0), None)
            if mem is None:
                continue
            if ins.mnemonic == "movzx":
                kind = "read"
            elif ins.mnemonic == "mov":
                kind = "clear" if ins.operands[1].type == X86_OP_IMM and ins.operands[1].imm == 0 else "write"
            else:
                raise ValueError("Unreviewed core item-count instruction")
            value_op = next((o for o in ins.operands if o.type == X86_OP_REG), None)
            entries.append(dict(rva=hex(ins.address-base), function_rva=hex(f.BeginAddress),
                                function="CUserItemContainer", kind=kind, bytes=ins.bytes.hex(),
                                original=ins.mnemonic+" "+ins.op_str,
                                base_register=ins.reg_name(mem.mem.base),
                                value_register=ins.reg_name(value_op.reg) if value_op else None,
                                evidence_type="current PE instruction and reviewed container function"))
    local_width = {0x2a66ad, 0x2a6eab, 0x2a6eb8, 0x2a7129, 0x2a718d,
                   0x2a76ba, 0x2a77bd, 0x2a8002, 0x2a9090}
    for rva in sorted(local_width):
        ins, fn = all_instructions[rva]
        if ins.mnemonic != "movzx" or "byte ptr [rsp" not in ins.op_str:
            raise ValueError("Unexpected count-local instruction")
        entries.append(dict(rva=hex(rva), function_rva=hex(fn), function="CUserItemContainer",
                            kind="local-width", bytes=ins.bytes.hex(), original=ins.mnemonic+" "+ins.op_str,
                            replacement_asm="movzx "+ins.op_str.replace("byte ptr", "word ptr"),
                            evidence_type="local is an existing qword; count branch reviewed"))
    gates = {
        0x2a6dd3: "cmp qword ptr [rsp+0x70],1; jl reject; cmp qword ptr [rsp+0x70],9999; jg reject; mov rdx,qword ptr [rsp+0x68]; jmp okay; reject: xor al,al; jmp " + str(base+0x2a6f09) + "; okay:",
        0x2878e0: "cmp qword ptr [rsp+0x1a8],9999; ja reject; movzx ecx,word ptr [rsp+0x1a8]; jmp okay; reject: jmp " + str(base+0x287531) + "; okay:",
        0x327f3f: "cmp dword ptr [rsp+0x70],9999; ja reject; movzx ecx,word ptr [rsp+0x70]; jmp okay; reject: jmp " + str(base+0x3280ff) + "; okay:",
    }
    # Replace count-local entries with checked versions, using full arguments
    # before narrowing. Direct setters reject oversized/negative requests.
    entries = [e for e in entries if int(e["rva"],0) not in gates]
    for rva, assembly in gates.items():
        ins, fn = all_instructions[rva]
        entries.append(dict(rva=hex(rva), bytes=ins.bytes.hex(), function_rva=hex(fn),
                            kind="explicit", function="9999 stack limit guard",
                            original=ins.mnemonic+" "+ins.op_str, replacement_asm=assembly,
                            evidence_type="reviewed split and direct count setter failure paths"))
    range_guards = json.loads(Path(other_manifest).with_name("item_count_u16_range_guards.json").read_text(encoding="utf-8"))
    range_addresses = {int(e["rva"],0) for e in range_guards}
    entries = [e for e in entries if int(e["rva"],0) not in range_addresses]
    entries.extend(range_guards)
    gate, fn = all_instructions[0x2a756b]
    entries.append(dict(rva="0x2a756b", bytes=gate.bytes.hex(), function_rva=hex(fn),
                        kind="oversize-gate", function="AddUserItem validated carrier paging",
                        original=gate.mnemonic+" "+gate.op_str))
    # Exclude Container+0x31 (AddUserItem 72e5/732d/7342) and NPC boolean
    # configuration (2f4e49); those fields are not CStdItem.m_btDupCount.
    dup_reads = {0x28a8ae, 0x2a64cb, 0x2a654b, 0x2a6566, 0x2a6a96,
                 0x2a7107, 0x2a7584, 0x2a8c00, 0x2a8d91, 0x329bd3}
    for rva in sorted(dup_reads):
        ins, fn = all_instructions[rva]
        mem = next(o for o in ins.operands if o.type == X86_OP_MEM)
        if ins.mnemonic != "movzx" or mem.mem.disp != 0x31:
            raise ValueError("Unexpected StdItem count-limit instruction")
        entries.append(dict(rva=hex(rva), function_rva=hex(fn), function="CStdItem dup consumer",
                            kind="dup-limit", bytes=ins.bytes.hex(), original=ins.mnemonic+" "+ins.op_str,
                            base_register=ins.reg_name(mem.mem.base),
                            value_register=ins.reg_name(ins.operands[0].reg),
                            evidence_type="reviewed CStdItem pointer origin; values >1 map to9999"))
    seen = set()
    for entry in entries:
        rva = int(entry["rva"], 0)
        if rva in seen:
            raise ValueError("Duplicate patch/audit site")
        seen.add(rva)
        if pe.get_data(rva, len(bytes.fromhex(entry["bytes"]))).hex() != entry["bytes"]:
            raise ValueError("Manifest original bytes do not match executable")
    return entries


def native_sites(entries, assemble):
    result = []
    for entry in entries:
        if entry["kind"] in EXCLUDED_KINDS:
            continue
        if entry["kind"] == "oversize-gate":
            def gate(context, address):
                return assemble(f"mov rcx,rsp; call {context['helpers']['oversize']}; "
                                f"cmp rax,-1; je original; jmp {context['image_base']+0x2a7998}; "
                                "original: mov rax,qword ptr [rsp+0x198]", address)
            result.append(dict(rva=int(entry["rva"],0), old=entry["bytes"], replacement=gate,
                               name=entry["function"]))
            continue
        assembly = replacement_assembly(entry)
        def callback(context, address, text=assembly):
            return assemble(text, address)
        result.append(dict(rva=int(entry["rva"], 0), old=entry["bytes"],
                           replacement=callback, name=entry["function"]+":"+entry["kind"]))
    return result


def verify_output(root, output):
    """Run the checks against exactly the files in this candidate directory."""
    from test_item_count_u16_fragments import run as fragments
    from test_item_count_u16_native import suite, guild_suite
    import test_item_count_u16_paging as paging
    import test_item_count_u16_ranges as ranges
    import test_item_count_u16_allocation as allocation
    from test_item_count_u16_client_auction import run as client_auction
    from test_count_builder_unwind import verify_package
    binary = output / "Server/S1001/x64/LogicServerCQ64_R.exe"
    evidence = output / "patch-evidence.json"
    results = dict(fragments=fragments(root))
    core = suite(binary) + guild_suite(binary, evidence)
    results["core"] = dict(status="passed", binary=str(binary),
                           sha256=hashlib.sha256(binary.read_bytes()).hexdigest(),
                           case_count=sum(len(row["observations"]) if "observations" in row else 1
                                          for row in core),
                           tests=core,
                           execution="Unicorn candidate code with mocked IO; no Windows service started",
                           limitations=["Guild check executes replacement blocks, not the whole withdrawal transaction",
                                        "No actual save/relogin test"])
    (output / "native-core-tests.json").write_text(json.dumps(results["core"], ensure_ascii=False, indent=2), encoding="utf-8")
    # The paging test's CLI is also independently runnable. Reuse its tested
    # entry point here without launching a game process.
    previous = sys.argv
    try:
        sys.argv = [str(Path(paging.__file__)), "--binary", str(binary),
                    "--evidence", str(evidence), "--output", str(output / "native-paging-tests.json")]
        paging.main()
    finally:
        sys.argv = previous
    results["paging"] = json.loads((output / "native-paging-tests.json").read_text(encoding="utf-8"))
    try:
        sys.argv = [str(Path(ranges.__file__)), "--binary", str(binary),
                    "--evidence", str(evidence), "--output", str(output / "native-range-tests.json")]
        ranges.main()
    finally:
        sys.argv = previous
    results["ranges"] = json.loads((output / "native-range-tests.json").read_text(encoding="utf-8"))
    try:
        sys.argv = [str(Path(allocation.__file__)), "--binary", str(binary),
                    "--output", str(output / "native-allocation-tests.json")]
        allocation.main()
    finally:
        sys.argv = previous
    results["allocation"] = json.loads((output / "native-allocation-tests.json").read_text(encoding="utf-8"))
    results["client_auction"] = client_auction(root, Path(__file__).resolve().parent, output)
    results["windows_unwind"] = verify_package(root, output)
    (output / "windows-unwind-evidence.json").write_text(json.dumps(results["windows_unwind"], ensure_ascii=False, indent=2), encoding="utf-8")
    (output / "verification.json").write_text(json.dumps(results, ensure_ascii=False, indent=2), encoding="utf-8")
    return results


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--project-root", type=Path, default=ROOT)
    parser.add_argument("--deps", type=Path)
    parser.add_argument("--output-dir", required=True, type=Path)
    parser.add_argument("--test", action="store_true", help="DB, native, paging, client and Windows unwind checks")
    args = parser.parse_args()
    if args.deps:
        sys.path.insert(0, str(args.deps.resolve()))
    root, output = args.project_root.resolve(), args.output_dir.resolve()
    if root == output or root in output.parents:
        raise ValueError("Only isolated output outside the deployed project is supported")
    from build_count_pe_candidate import build_candidate
    from patch_item_count_u16_client import build_candidate as build_client
    from patch_item_count_u16_db import candidate_specs, build_trampoline, EXPECTED_SHA256, test_candidates
    from keystone import Ks, KS_ARCH_X86, KS_MODE_64
    ks = Ks(KS_ARCH_X86, KS_MODE_64)
    assemble = lambda text, address: bytes(ks.asm(text, address)[0])
    source = root / "Server/S1001/x64/LogicServerCQ64_R.exe"
    entries = logic_manifest(source.read_bytes(), Path(__file__).with_name("item_count_u16_sites.json"))
    logic = build_candidate(source.read_bytes(), hashlib.sha256(source.read_bytes()).hexdigest(), native_sites(entries, assemble),
                            helpers=[dict(name="oversize", code=oversize_helper,
                                          frame_size=0xf8, prolog_size=7)])
    db_path = root / "Server/common/x64/DBServer64_R.exe"
    db_sites = []
    for spec in candidate_specs():
        def callback(context, address, spec=spec):
            return build_trampoline(spec, address, context["image_base"], assemble)
        # DB build_trampoline includes its own jump back to spec.resume.
        db_sites.append(dict(rva=spec["site"], old=spec["old"], replacement=callback,
                             name=spec["name"], terminal=True))
    db = build_candidate(db_path.read_bytes(), EXPECTED_SHA256, db_sites)
    client = build_client(root, output, Path(__file__).resolve().parent)
    for relative, data in (("Server/S1001/x64/LogicServerCQ64_R.exe", logic["bytes"]),
                           ("Server/common/x64/DBServer64_R.exe", db["bytes"])):
        target = output / relative; target.parent.mkdir(parents=True, exist_ok=True); target.write_bytes(data)
    report = dict(deployable=False, capacity=CAPACITY, stack_limit=STACK_LIMIT,
                  logic=logic["manifest"], db=db["manifest"], client=client,
                  audit_kinds=dict(Counter(e["kind"] for e in entries)))
    if args.test:
        report["db_tests"] = test_candidates(db_path)
    (output / "patch-evidence.json").write_text(json.dumps(report, ensure_ascii=False, indent=2), encoding="utf-8")
    if args.test:
        verify_output(root, output)
    print(json.dumps({"output": str(output), "deployable": False, "capacity": CAPACITY,
                      "stack_limit": STACK_LIMIT}, ensure_ascii=False))


if __name__ == "__main__":
    main()
