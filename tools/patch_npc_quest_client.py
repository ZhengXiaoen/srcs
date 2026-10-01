"""Stop NPC dialog closure from resending the last task button.

The sequence is the complete NPCTalkWin.onWinClose body exported from the
current client. Replace only its sendFirstBtnCode call with five AVM2 nops;
method lengths, branch offsets, constant pools and every other byte stay intact.
"""

from __future__ import annotations

import argparse
import struct
import zlib
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
CLIENT = ROOT / "web/GameFrame.swf"
# ABC method 1518 is NPCTalkWin.onWinClose: stack 1, locals 2, scope 15/16,
# code length 16, no exceptions or traits. onAutoClick has the same code but
# a different method ID, so include the method record to leave it unchanged.
ORIGINAL = bytes.fromhex("ee 0b 01 02 0f 10 10 d0 30 60 9c 80 02 12 05 00 00 d0 4f 9f 0f 00 47 00 00")
PATCHED = ORIGINAL[:17] + b"\x02" * 5 + ORIGINAL[22:]


def patch_swf(source: bytes) -> bytes:
    if source[:3] != b"CWS":
        raise ValueError("Expected compressed GameFrame.swf")
    data = source[:8] + zlib.decompress(source[8:])
    if len(data) != struct.unpack_from("<I", source, 4)[0]:
        raise ValueError("Invalid SWF length")
    if data.count(PATCHED) == 1 and data.count(ORIGINAL) == 0:
        return source
    if data.count(ORIGINAL) != 1 or data.count(PATCHED) != 0:
        raise ValueError("NPCTalkWin.onWinClose does not match the verified body")
    offset = data.index(ORIGINAL)
    updated = data[:offset] + PATCHED + data[offset + len(ORIGINAL):]
    changes = [i for i, (before, after) in enumerate(zip(data, updated)) if before != after]
    if len(updated) != len(data) or changes != list(range(offset + 17, offset + 22)):
        raise ValueError("Unrelated client bytecode changed")
    return source[:8] + zlib.compress(updated[8:], 9)


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    original = CLIENT.read_bytes()
    updated = patch_swf(original)
    if args.check:
        if updated != original:
            raise ValueError("NPC closure fix has not been applied")
    else:
        CLIENT.write_bytes(updated)
    print("Verified: closing NPC dialogs cannot resubmit the old task button.")


if __name__ == "__main__":
    main()
