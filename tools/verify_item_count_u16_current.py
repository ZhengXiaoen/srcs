"""Verify current-version preservation and rerun the retained jump-table audit."""
from __future__ import annotations
import argparse
import hashlib
import json
from pathlib import Path
import struct
import sys


def run(root, candidate):
    import pefile
    from capstone import Cs, CS_ARCH_X86, CS_MODE_64
    from capstone.x86 import X86_OP_IMM, X86_OP_MEM, X86_REG_RIP
    relative = Path('Server/S1001/x64/LogicServerCQ64_R.exe')
    original = (root / relative).read_bytes()
    updated = (candidate / relative).read_bytes()
    old, new = pefile.PE(data=original), pefile.PE(data=updated)
    evidence = json.loads((candidate / 'patch-evidence.json').read_text(encoding='utf-8'))
    manifest = evidence['logic']
    assert hashlib.sha256(original).hexdigest() == manifest['original_sha256']
    assert hashlib.sha256(updated).hexdigest() == manifest['candidate_sha256']
    blocks = manifest['blocks']
    assert len(blocks) == 209
    preserved = []
    for section in old.sections:
        rva, size = section.VirtualAddress, section.Misc_VirtualSize
        before = bytearray(old.get_data(rva, size))
        after = new.get_data(rva, size)
        for block in blocks:
            site = block['site_rva']
            patch = bytes.fromhex(block['patch'])
            if rva <= site < rva + size:
                assert site + len(patch) <= rva + size
                before[site-rva:site-rva+len(patch)] = patch
        assert bytes(before) == after, ('unrelated section bytes changed', section.Name)
        preserved.append(dict(name=section.Name.rstrip(b'\0').decode(), size=size,
                              unrelated_bytes_unchanged=True))
    audit_path = root / 'tools/item_count_u16_jumptable_audit.json'
    audit = json.loads(audit_path.read_text(encoding='utf-8'))
    total = 0
    def middle(target):
        return [b['site_rva'] for b in blocks if b['site_rva'] < target < b['end_rva']]
    for table in audit['switch_tables']:
        address, cases = int(table['table'], 0), table['cases']
        # The last three switches use a byte index table before the RVA table.
        # Their case counts are the index-byte counts, not RVA-entry counts.
        index_tables = {0x32810c: 0x328160, 0x328a88: 0x328b00, 0x329c7c: 0x329cf0}
        if address in index_tables:
            indices = old.get_data(index_tables[address], cases)
            assert indices == new.get_data(index_tables[address], cases)
            raw = old.get_data(address, (max(indices) + 1) * 4)
            values = struct.unpack('<' + 'I' * (max(indices) + 1), raw)
            targets = [values[i] for i in indices]
        else:
            raw = old.get_data(address, cases * 4)
            targets = struct.unpack('<' + 'I' * cases, raw)
        assert raw == new.get_data(address, len(raw))
        assert set(targets) == {int(t, 0) for t in table['unique_targets']}
        assert not any(middle(t) for t in targets)
        total += cases
    cs = Cs(CS_ARCH_X86, CS_MODE_64); cs.detail = True
    references = []
    base = old.OPTIONAL_HEADER.ImageBase
    ranges = [(e.struct.BeginAddress, e.struct.EndAddress)
              for e in old.DIRECTORY_ENTRY_EXCEPTION]
    # Existing appended patches can have entry points without .pdata entries.
    ranges += [(s.VirtualAddress, s.VirtualAddress + s.Misc_VirtualSize)
               for s in old.sections if s.Characteristics & 0x20000000
               and s.Name.rstrip(b'\0') != b'.text']
    for start, end in ranges:
        for ins in cs.disasm(old.get_data(start, end-start), base + start):
            for operand in ins.operands:
                target = None
                if operand.type == X86_OP_IMM:
                    target = operand.imm - base
                elif operand.type == X86_OP_MEM and operand.mem.base == X86_REG_RIP:
                    target = ins.address + ins.size + operand.mem.disp - base
                if target is not None and middle(target):
                    references.append(dict(instruction=hex(ins.address-base), target=hex(target)))
    assert not references, references
    audit['candidate_sha256'] = manifest['candidate_sha256']
    audit['blocks'] = len(blocks)
    audit['original_sha256'] = manifest['original_sha256']
    audit['rip_or_immediate_code_address_middle_references'] = references
    audit['current_version_verification'] = dict(sections=preserved,
        tables=len(audit['switch_tables']), cases=total,
        existing_patches_preserved=['.mtstack', '.jjmount', '.jjbuy', '.wjsurv'])
    audit_path.write_text(json.dumps(audit, ensure_ascii=False, indent=2), encoding='utf-8')
    (candidate / 'current-version-verification.json').write_text(
        json.dumps(audit['current_version_verification'], ensure_ascii=False, indent=2), encoding='utf-8')
    print(json.dumps(dict(status='passed', tables=len(audit['switch_tables']), cases=total,
                         sections=len(preserved)), ensure_ascii=False))


if __name__ == '__main__':
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--project-root', type=Path, required=True)
    p.add_argument('--candidate-dir', type=Path, required=True)
    p.add_argument('--deps', type=Path)
    args = p.parse_args()
    if args.deps: sys.path.insert(0, str(args.deps))
    run(args.project_root.resolve(), args.candidate_dir.resolve())
