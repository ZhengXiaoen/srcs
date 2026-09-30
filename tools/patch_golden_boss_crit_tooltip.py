"""Add the golden-rights BOSS critical retry benefit to the existing client tooltip.

Keep every ABC string index, instruction and other SWF tag unchanged.
"""
from pathlib import Path
import struct
import zlib

from patch_bag_client import ABCReader, encode_u30
from patch_drop_pickup_retry import abc_section


ROOT = Path(__file__).resolve().parents[1]
CLIENT = ROOT / "web/GameFrame.swf"
ORIGINAL = (
    "黄金属性BUFF：<BR><img src='decoLine#100'/><BR>"
    "生命上限:<font color='#00ff00'>2000</font><BR>"
    "魔法上限:<font color='#00ff00'>2000</font><BR>"
)
UPDATED = ORIGINAL + (
    "<BR><font color='#ff00ff'>钞能力</font> <font color='#ffd700'>黄金权益</font><BR>"
    "Boss奖励暴击首次判定失败后，额外判定一次：<BR>"
    "幸运暴击<font color='#00ff00'>15%</font>，"
    "神级暴击<font color='#ff6600'>8%</font><BR>"
    "神级暴击需先触发幸运暴击。<BR>"
)


def patch_abc(source):
    reader = ABCReader(source)
    reader.skip(4)
    for _ in range(2):
        for _ in range(reader.u30() - 1):
            reader.u30()
    reader.skip(8 * (reader.u30() - 1))
    matches = []
    already_updated = 0
    for _ in range(reader.u30() - 1):
        start = reader.pos
        length = reader.u30()
        value = source[reader.pos:reader.pos + length].decode("utf-8")
        reader.skip(length)
        if value == ORIGINAL:
            matches.append((start, reader.pos))
        elif value == UPDATED:
            already_updated += 1
    if already_updated == 1 and not matches:
        return source
    if len(matches) != 1 or already_updated:
        raise ValueError("Expected exactly one original golden-rights tooltip")
    start, end = matches[0]
    text = UPDATED.encode("utf-8")
    replacement = encode_u30(len(text)) + text
    result = source[:start] + replacement + source[end:]
    restored = result[:start] + source[start:end] + result[start + len(replacement):]
    if restored != source:
        raise ValueError("Unrelated ABC bytes changed")
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
        raise ValueError("Unrelated SWF tags changed")
    return result[:8] + zlib.compress(result[8:], 9)


def main():
    before = CLIENT.read_bytes()
    after = patch_swf(before)
    if after != before:
        CLIENT.write_bytes(after)
        print("Updated the golden-rights tooltip; other client content preserved")
    else:
        print("Golden-rights tooltip already updated")


if __name__ == "__main__":
    main()
