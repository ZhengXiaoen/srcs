"""Add the GM map-BOSS pull button beside the existing title button.

Append to CustomerServiceWin's state button list so the original event lifecycle
registers and removes its listener. Preserve the six original buttons and their
commands, every unrelated ABC method, and all other SWF resources.
"""
from pathlib import Path
import argparse
import struct
import zlib

from patch_activity_entries import q, relocate
from patch_appearance_upgrade import extend_pools, inspect_abc, pools
from patch_auto_medicine_frequency import Block
from patch_bag_client import ABCReader, encode_u30
from patch_drop_pickup_retry import abc_section, instructions

CLIENT = Path(__file__).resolve().parents[1] / "web/GameFrame.swf"
LABEL = "一键吸附"
COMMAND = "@func gmAbsorbBosses"
Q = {"Button54": 15659, "autoSize": 11017, "height": 1618,
     "caption": 11014, "move": 1631, "addChild": 1868,
     "_stateBtnList": 5581, "push": 43315, "currentTarget": 43310,
     "ChatFunc": 1510, "doChatMessage": 31355, "index": 44065}


def patch_abc(original):
    # The categorized GM page supersedes this toolbar-only patch.
    if "CustomerServiceCommandPage" in pools(original)["strings"][3]:
        return original
    if COMMAND in pools(original)["strings"][3]:
        return original
    source, strings, _ = extend_pools(original, [LABEL, COMMAND], [])
    names, catalog, bodies = inspect_abc(source)
    for key, index in Q.items():
        if key != "index" and names[index] != key:
            raise ValueError(f"Unexpected GM QName: {key}")
    page = catalog["CustomerServiceWin"]
    edits = []

    def change(method, transform):
        start, size, limits = bodies[method]
        code, moved = transform(source[start:start + size])
        instructions(code)
        reader = ABCReader(source)
        reader.pos = start + size
        exceptions = []
        for _ in range(reader.u30()):
            a, b, target, kind, variable = (reader.u30() for _ in range(5))
            exceptions.append((moved(a), moved(b), moved(target), kind, variable))
        header = b"".join(encode_u30(x) for x in (method, *limits, size))
        if source[start - len(header):start] != header:
            raise ValueError("Unexpected GM method header")
        value = b"".join(encode_u30(x) for x in (method, *limits, len(code)))
        value += code + encode_u30(len(exceptions))
        value += b"".join(encode_u30(x) for row in exceptions for x in row)
        edits.append((start - len(header), reader.pos, value, method))

    def init(code):
        if bodies[page["instance"]["init"][0]][2] != (7, 12, 15, 16):
            raise ValueError("Unexpected GM constructor limits")
        ops = instructions(code)
        if len(code) != 512 or ops[-1].opcode != 0x47:
            raise ValueError("Unexpected GM button creation loop")
        # Original columns are x=17/120/222 and rows y=50/78; Button54 is 77 wide.
        # Reuse local 11, which holds the last Button54 from the completed loop.
        extra = (q(0x5d, Q["Button54"]) + q(0x4a, Q["Button54"], 0)
                 + q(0x80, Q["Button54"]) + b"\x63\x0b"
                 + b"\x62\x0b\x27" + q(0x61, Q["autoSize"])
                 + b"\x62\x0b\x24\x1b" + q(0x61, Q["height"])
                 + b"\x62\x0b" + q(0x2c, strings[LABEL]) + q(0x61, Q["caption"])
                 + b"\x62\x0b" + q(0x25, 324) + b"\x24\x32" + q(0x4f, Q["move"], 2)
                 + b"\xd0\x62\x0b" + q(0x4f, Q["addChild"], 1)
                 + b"\xd0" + q(0x66, Q["_stateBtnList"])
                 + b"\x62\x0b" + q(0x4f, Q["push"], 1))
        return relocate(code, [(ops[-1].start, ops[-1].end, extra + b"\x47")])

    def click(code):
        if len(code) != 324 or code[:2] != b"\xd0\x30":
            raise ValueError("Unexpected GM button command handler")
        block = Block()
        block.emit(b"\xd1" + q(0x66, Q["currentTarget"])
                   + b"\xd0" + q(0x66, Q["_stateBtnList"])
                   + b"\x24\x06" + q(0x66, Q["index"]))
        block.branch(0x1a, "normal")  # ifstrictne
        block.emit(q(0x60, Q["ChatFunc"]) + q(0x2c, strings[COMMAND])
                   + q(0x4f, Q["doChatMessage"], 1) + b"\x47")
        block.label("normal")
        extra, _ = block.finish()
        return relocate(code, [(2, 2, extra)])

    change(page["instance"]["init"][0], init)
    change(page["instance"]["onBtnClick"][0], click)
    result = bytearray(source)
    for start, end, value, _ in sorted(edits, reverse=True):
        result[start:end] = value
    result = bytes(result)
    _, after_catalog, after_bodies = inspect_abc(result)
    if catalog != after_catalog:
        raise ValueError("Client class traits changed")
    changed = {method for _, _, _, method in edits}
    for method, (start, size, limits) in bodies.items():
        after_start, after_size, after_limits = after_bodies[method]
        if method not in changed and (limits != after_limits or
                source[start:start + size] != result[after_start:after_start + after_size]):
            raise ValueError(f"Unrelated client method changed: {method}")
    # Restore the two replaced byte ranges to prove all remaining ABC bytes match.
    restored = bytearray(result)
    shift = 0
    changed_ranges = []
    for start, end, value, _ in sorted(edits):
        changed_ranges.append((start + shift, start + shift + len(value), source[start:end]))
        shift += len(value) - (end - start)
    for start, end, value in reversed(changed_ranges):
        restored[start:end] = value
    if bytes(restored) != source:
        raise ValueError("Unrelated ABC data changed")
    return result


def patch_swf(source):
    data, (tag, payload, start, end) = abc_section(source)
    abc = patch_abc(data[start:end])
    if abc == data[start:end]:
        return source
    result = (data[:tag + 2] + struct.pack("<I", start - payload + len(abc))
              + data[payload:start] + abc + data[end:])
    result = result[:4] + struct.pack("<I", len(result)) + result[8:]
    if result[8:tag] != data[8:tag] or result[start + len(abc):] != data[end:]:
        raise ValueError("Unrelated SWF resources changed")
    return result[:8] + zlib.compress(result[8:], 9)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    source = CLIENT.read_bytes()
    result = patch_swf(source)
    if args.check:
        if result != source:
            raise SystemExit("GM BOSS pull button is not installed")
        print("GM BOSS pull button verified")
    else:
        CLIENT.write_bytes(result)
        print("GM BOSS pull button installed")
