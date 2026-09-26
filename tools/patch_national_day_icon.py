"""Move the National Day gift button to the first top-button row.

The four bytecode references cover button creation and its status indicators.
They all look up RIGHT_TOP_GUO_QING_BTN through NavTopBtnPanel (second row);
NavTopBtnPanel2 is the first row. Both class references have equal length.
"""

import hashlib
import struct
import zlib
from pathlib import Path


EXPECTED_SHA256 = "3f4fe9d121a8da1e79992befc8237be3e26d828ac40617c60c4dd338a48c2605"
SECOND_ROW_REFERENCE = bytes.fromhex("60 a0 3f 60 fc 65 66 b7 ab 02")
FIRST_ROW_REFERENCE = bytes.fromhex("60 9e 3f 60 fc 65 66 b7 ab 02")
REFERENCE_COUNT = 4
SECOND_ROW_LOOKUP = FIRST_ROW_REFERENCE + bytes.fromhex("46 ef ab 02")  # getBtn
FIRST_ROW_LOOKUP = FIRST_ROW_REFERENCE + bytes.fromhex("46 f6 cb 02")   # getPaneBtn2ByType
LOOKUP_COUNT = 2


def main() -> None:
    path = Path(__file__).resolve().parents[1] / "web/GameFrame.swf"
    source = path.read_bytes()
    if hashlib.sha256(source).hexdigest() != EXPECTED_SHA256:
        raise ValueError("GameFrame.swf differs from the inspected version")
    if source[:3] != b"CWS":
        raise ValueError("Expected zlib-compressed SWF")
    unpacked = source[:8] + zlib.decompress(source[8:])
    if len(unpacked) != struct.unpack_from("<I", source, 4)[0]:
        raise ValueError("Invalid SWF length")
    if unpacked.count(SECOND_ROW_REFERENCE) != REFERENCE_COUNT:
        raise ValueError("Unexpected National Day button references")
    if unpacked.count(FIRST_ROW_REFERENCE):
        raise ValueError("National Day button is already on the first row")
    patched = unpacked.replace(SECOND_ROW_REFERENCE, FIRST_ROW_REFERENCE)
    if patched.count(SECOND_ROW_LOOKUP) != LOOKUP_COUNT:
        raise ValueError("Unexpected National Day status lookups")
    patched = patched.replace(SECOND_ROW_LOOKUP, FIRST_ROW_LOOKUP)
    result = patched[:8] + zlib.compress(patched[8:], level=9)
    if zlib.decompress(result[8:]).count(FIRST_ROW_REFERENCE) != REFERENCE_COUNT:
        raise ValueError("National Day button patch failed verification")
    if zlib.decompress(result[8:]).count(FIRST_ROW_LOOKUP) != LOOKUP_COUNT:
        raise ValueError("National Day status patch failed verification")
    path.write_bytes(result)


if __name__ == "__main__":
    main()
