"""Restore signed optional Item.addItem counts in the installed 9999 engine.

Only JA becomes JG in the existing trampoline. Its size, offsets, flags on
the success path and all unwind metadata remain unchanged. Nonpositive counts
keep the carrier quantity, matching the original API and Lua's default -1.
"""
import argparse
import hashlib
from pathlib import Path
import sys

ROOT = Path(__file__).resolve().parents[1]
SOURCE_HASH = 'd3aafe43859f02a96b61fcf46201aa1ba5305e125ae5f7948ff850ca1aedf6b0'
TARGET_HASH = 'db25163cbeb87623cd075f85189a5a0a2bdea6c71e20d57fa73f948f437b5456'
GUARD_RVA = 0x554000
OLD = bytes.fromhex('81bc2480000000ffff00000f870e000000')
NEW = OLD[:12] + b'\x8f' + OLD[13:]


def patch(source):
    import pefile
    pe = pefile.PE(data=source)
    offset = pe.get_offset_from_rva(GUARD_RVA)
    result = bytearray(source)
    if source[offset:offset + len(OLD)] == NEW:
        result[offset:offset + len(OLD)] = OLD
        if hashlib.sha256(result).hexdigest() != SOURCE_HASH:
            raise ValueError('Unsupported patched engine')
        return source
    if (hashlib.sha256(source).hexdigest() != SOURCE_HASH or
            source[offset:offset + len(OLD)] != OLD):
        raise ValueError('Unsupported engine or optional-count guard')
    result[offset:offset + len(OLD)] = NEW
    assert sum(a != b for a, b in zip(source, result)) == 1
    return bytes(result)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--deps', type=Path)
    parser.add_argument('--source', type=Path, default=ROOT/'Server/S1001/x64/LogicServerCQ64_R.exe')
    parser.add_argument('--output', type=Path, required=True)
    args = parser.parse_args()
    if args.deps:
        sys.path.insert(0, str(args.deps))
    result = patch(args.source.read_bytes())
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_bytes(result)
    print('Optional-count guard restored:', hashlib.sha256(result).hexdigest())
