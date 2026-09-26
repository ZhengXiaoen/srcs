"""Sync the tenfold sworn-brother rewards in client resources."""

from __future__ import annotations

import hashlib
import struct
import zlib
from pathlib import Path

from patch_bag_client import ABCReader, encode_u30
from patch_guild_quest_config import read_cbp, read_pack, write_cbp, write_pack


ROOT = Path(__file__).resolve().parents[1]
CONFIG_NAME = "brotherQingMiDuTask.cbp"
OLD_REWARDS = ((200, 200, 200, 250, 300), (50, 150, 1000), (300,))

# The first help text predates the current 200-point reward. Both help texts
# must describe the actual 2000-point, five-claim daily reward after this patch.
TEXT_REPLACEMENTS = {
    39987: (
        "在线1小时领取100点亲密值，每天最多领取500点",
        "在线1小时领取2000点亲密值，每天最多领取10000点",
    ),
    43512: ("每天最多可领取1000点", "每天最多可领取10000点"),
    44954: ("可领取200点亲密度", "可领取2000点亲密度"),
    44955: ("已领200点亲密度", "已领2000点亲密度"),
    44957: (
        "在线满1小时可领取200点亲密度，每天最多可领取1000，次日凌晨重置",
        "在线满1小时可领取2000点亲密度，每天最多可领取10000，次日凌晨重置",
    ),
}


def patch_config(source: bytes) -> bytes:
    header, root = read_cbp(source)
    if len(root.children) != len(OLD_REWARDS):
        raise ValueError("Unexpected sworn-brother task groups")
    for group, expected in zip(root.children, OLD_REWARDS):
        if len(group.children) != len(expected):
            raise ValueError("Unexpected sworn-brother task count")
        for task, old_reward in zip(group.children, expected):
            value = task.child("value")
            if value.number() != old_reward:
                raise ValueError("Unexpected sworn-brother task reward")
            value.set_number(old_reward * 10)
    result = write_cbp(header, root)
    read_cbp(result)
    return result


def patch_abc(abc: bytes) -> bytes:
    reader = ABCReader(abc)
    reader.skip(4)
    for _ in range(reader.u30() - 1):
        reader.u30()  # signed integer pool
    for _ in range(reader.u30() - 1):
        reader.u30()  # unsigned integer pool
    reader.skip(8 * (reader.u30() - 1))  # double pool

    changes = []
    for index in range(1, reader.u30()):
        start = reader.pos
        length = reader.u30()
        raw = abc[reader.pos : reader.pos + length]
        reader.skip(length)
        if index not in TEXT_REPLACEMENTS:
            continue
        old, new = TEXT_REPLACEMENTS[index]
        text = raw.decode("utf-8")
        if text.count(old) != 1:
            raise ValueError(f"Unexpected Flash help text at index {index}")
        patched = text.replace(old, new, 1).encode("utf-8")
        changes.append((start, reader.pos, encode_u30(len(patched)) + patched))
    if len(changes) != len(TEXT_REPLACEMENTS):
        raise ValueError("Missing sworn-brother Flash text")

    result = bytearray(abc)
    for start, end, value in reversed(changes):
        result[start:end] = value
    return bytes(result)


def patch_swf(source: bytes) -> bytes:
    if source[:3] != b"CWS":
        raise ValueError("Expected a compressed Flash client")
    data = source[:8] + zlib.decompress(source[8:])
    if len(data) != struct.unpack_from("<I", source, 4)[0]:
        raise ValueError("Invalid Flash length")
    rect_size = (5 + (data[8] >> 3) * 4 + 7) // 8
    offset = 8 + rect_size + 4
    while offset < len(data):
        tag_start = offset
        tag = struct.unpack_from("<H", data, offset)[0]
        offset += 2
        length = tag & 63
        if length == 63:
            length = struct.unpack_from("<I", data, offset)[0]
            offset += 4
        tag_end = offset + length
        if tag >> 6 == 82:
            if tag & 63 != 63:
                raise ValueError("Expected a long DoABC tag")
            abc_start = data.index(b"\0", offset + 4, tag_end) + 1
            patched = patch_abc(data[abc_start:tag_end])
            tag_size = abc_start - offset + len(patched)
            data = (data[:tag_start + 2] + struct.pack("<I", tag_size)
                    + data[tag_start + 6:abc_start] + patched + data[tag_end:])
            data = data[:4] + struct.pack("<I", len(data)) + data[8:]
            return data[:8] + zlib.compress(data[8:], level=9)
        offset = tag_end
    raise ValueError("Flash client ABC not found")


def main() -> None:
    config_path = ROOT / "web/v2/lang/zh-cn" / CONFIG_NAME
    pack_path = ROOT / "web/v2/lang/zh-cn/zh-cn.dat"
    swf_path = ROOT / "web/GameFrame.swf"
    config = config_path.read_bytes()
    pack = pack_path.read_bytes()
    swf = swf_path.read_bytes()
    entries = read_pack(pack)
    if write_pack(entries) != pack:
        raise ValueError("Language pack did not round-trip")
    positions = [i for i, (name, _) in enumerate(entries) if name == CONFIG_NAME]
    if len(positions) != 1 or entries[positions[0]][1] != config:
        raise ValueError("Packed task config differs from its standalone copy")

    updated_config = patch_config(config)
    entries[positions[0]] = (CONFIG_NAME, updated_config)
    updated_pack = write_pack(entries)
    updated_swf = patch_swf(swf)
    config_path.write_bytes(updated_config)
    pack_path.write_bytes(updated_pack)
    swf_path.write_bytes(updated_swf)
    for path, before in ((config_path, config), (pack_path, pack), (swf_path, swf)):
        print(f"{path.name}: {hashlib.sha256(before).hexdigest()} -> "
              f"{hashlib.sha256(path.read_bytes()).hexdigest()}")


if __name__ == "__main__":
    main()
