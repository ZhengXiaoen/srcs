"""Fix defense and maximum attack branches in the warrior equipment rate pass.

The existing array is [5,7,9,11,13,15,17,19,21,23,25,27]. Its loop compares
the ARRAY INDEX against attribute IDs 11,15,19, so only index 11 (magic defense
maximum) is reachable. Select indexes 3,5,7 for the originally intended maximum
attacks and indexes 8 through 11 for all defense fields. Health, mana and minimum
attacks already receive the initial base equipment rate; leave that pass intact.
Retain the existing calculation and rounding.
"""

import argparse
import base64
import hashlib
import json
from pathlib import Path
import sys


ROOT = Path(__file__).resolve().parents[1]
SERVER = ROOT / "Server/S1001/x64/LogicServerCQ64_R.exe"
PACKAGE = SERVER.with_name("warrior-defense-rate.patch.json")
SOURCE_HASH = "107bf958c53e0c9d498377a0adfcca50902d7f940f6d40f525c5fd7645c40f58"
CONDITION_RVA = 0x1D3591
OLD = bytes.fromhex("83 bc 24 b8 0c 00 00 0b 74 16 "
                    "83 bc 24 b8 0c 00 00 0f 74 0c "
                    "83 bc 24 b8 0c 00 00 13 74 02 eb 6b")
# The existing loop bounds indexes to 0..11. Select 3,5,7..11; all branches
# retain the original destinations 0x1d35b1 (apply) and 0x1d361c (skip).
NEW = bytes.fromhex("83 bc 24 b8 0c 00 00 03 74 16 "
                    "83 bc 24 b8 0c 00 00 05 74 0c "
                    "83 bc 24 b8 0c 00 00 07 72 6d 90 90")


def patch(source):
    import pefile
    pe = pefile.PE(data=source)
    offset = pe.get_offset_from_rva(CONDITION_RVA)
    before = source[offset:offset + len(OLD)]
    if before == NEW:
        restored = source[:offset] + OLD + source[offset + len(OLD):]
        if hashlib.sha256(restored).hexdigest() != SOURCE_HASH:
            raise ValueError("Patched server contains unrelated changes")
        return source
    if hashlib.sha256(source).hexdigest() != SOURCE_HASH or before != OLD:
        raise ValueError("Unsupported server version; no bytes written")
    return source[:offset] + NEW + source[offset + len(OLD):]


def package(source, result):
    import pefile
    offset = pefile.PE(data=source).get_offset_from_rva(CONDITION_RVA)
    return dict(sourceSha256=hashlib.sha256(source).hexdigest(),
                targetSha256=hashlib.sha256(result).hexdigest(),
                sourceLength=len(source), targetLength=len(result),
                edits=[dict(offset=offset, before=base64.b64encode(OLD).decode(),
                            after=base64.b64encode(NEW).decode())])


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--deps", type=Path)
    parser.add_argument("--source", type=Path, default=SERVER)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    if args.deps:
        sys.path.insert(0, str(args.deps))
    source = args.source.read_bytes()
    result = patch(source)
    if source == result:
        import pefile
        offset = pefile.PE(data=source).get_offset_from_rva(CONDITION_RVA)
        source = source[:offset] + OLD + source[offset + len(OLD):]
    # Keep the running executable intact; the existing start flow installs this
    # verified package after all previous native patches and before launching.
    PACKAGE.write_text(json.dumps(package(source, result), indent=2) + "\n", encoding="utf-8")
    if args.output:
        args.output.write_bytes(result)
    print("Warrior defense rate installation package generated")


if __name__ == "__main__":
    main()
