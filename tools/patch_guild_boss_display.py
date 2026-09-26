"""Fix guild Boss reward preview after the client reorders claimed bosses.

The selected item is already stored in _indexCfg. GuildBOSSPageII.setSelect
incorrectly reads rewards from _canChallengeCfg[_index], where the array has
been reordered by claim state. Replace that lookup with _indexCfg.award.award.
NOP padding keeps every ABC bytecode and exception offset unchanged.
"""

from __future__ import annotations

import hashlib
import struct
import zlib
from pathlib import Path


EXPECTED_SHA256 = "936bc62331b0088b88c2df40f1f9661432a3d5a386fe6a62dbe0e1f389648c25"
OLD_LOOKUP = bytes.fromhex(
    "d0 66 d6 81 01 d0 66 c6 81 01 66 ff ed 02 60 c8 81 01 87 66 bc 33 66 bc 33"
)
NEW_LOOKUP = bytes.fromhex("d0 66 c7 81 01 66 bc 33 66 bc 33")
PADDED_LOOKUP = NEW_LOOKUP + bytes((0x02,)) * (len(OLD_LOOKUP) - len(NEW_LOOKUP))


def patch(source: bytes) -> bytes:
    if hashlib.sha256(source).hexdigest() != EXPECTED_SHA256:
        raise ValueError("GameFrame.swf differs from the inspected version")
    if source[:3] != b"CWS":
        raise ValueError("Expected zlib-compressed SWF")

    uncompressed = source[:8] + zlib.decompress(source[8:])
    if len(uncompressed) != struct.unpack_from("<I", source, 4)[0]:
        raise ValueError("SWF length mismatch")

    rect_size = (5 + (uncompressed[8] >> 3) * 4 + 7) // 8
    offset = 8 + rect_size + 4
    found = 0
    while offset < len(uncompressed):
        header = struct.unpack_from("<H", uncompressed, offset)[0]
        offset += 2
        tag_length = header & 0x3F
        if tag_length == 0x3F:
            tag_length = struct.unpack_from("<I", uncompressed, offset)[0]
            offset += 4
        tag_end = offset + tag_length
        if tag_end > len(uncompressed):
            raise ValueError("Truncated SWF tag")
        if header >> 6 == 82:
            abc_start = uncompressed.index(b"\0", offset + 4, tag_end) + 1
            abc = uncompressed[abc_start:tag_end]
            occurrences = abc.count(OLD_LOOKUP)
            if occurrences:
                if occurrences != 1 or found:
                    raise ValueError("Expected exactly one guild Boss reward lookup")
                uncompressed = (
                    uncompressed[:abc_start]
                    + abc.replace(OLD_LOOKUP, PADDED_LOOKUP, 1)
                    + uncompressed[tag_end:]
                )
                found = 1
        offset = tag_end
    if found != 1 or uncompressed.count(OLD_LOOKUP) != 0:
        raise ValueError("Guild Boss reward lookup was not patched uniquely")
    if uncompressed.count(PADDED_LOOKUP) != 1:
        raise ValueError("Patched guild Boss reward lookup is missing")
    return uncompressed[:8] + zlib.compress(uncompressed[8:], level=9)


if __name__ == "__main__":
    path = Path(__file__).resolve().parents[1] / "web" / "GameFrame.swf"
    patched = patch(path.read_bytes())
    path.write_bytes(patched)
    print(f"Patched {path}")
