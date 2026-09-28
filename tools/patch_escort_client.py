"""Sync the merged daily escort count and rewards in the Flash client."""

from __future__ import annotations

import hashlib
import struct
import zlib
from pathlib import Path

from patch_bag_client import encode_u30
from patch_guild_quest_config import read_cbp, read_pack, write_cbp, write_pack


EXPECTED_SWF = "d9d6cd590eda72ca8a7b38b608ac20602c51e6353b192155eb2d9f440f1013aa"
EXPECTED_CBP = "24cd150935d81c88fa3c31fa2ca766e6ff81bffb80433256fe11e76ed74af2e6"
EXPECTED_PACK = "6fd05ee718cff48e18da8df159e4ed6624522170b78cf36b22f9fcea8492576e"
CONFIG_NAME = "stdActivityCfg.cbp"
BASE_BIND_COIN = (100000, 150000, 200000, 250000, 300000)
BASE_FEATS = (1000, 1500, 2000, 2500, 3000)
NORMAL_MULTIPLIER = 15


def check_hash(source: bytes, expected: str, label: str) -> None:
    if hashlib.sha256(source).hexdigest() != expected:
        raise ValueError(f"{label} differs from the expected version")


def patch_config(source: bytes) -> bytes:
    header, root = read_cbp(source)
    config = root.child("DuoBeiYaSong")
    daily = config.child("maxEscort")
    if daily.number() != 3:
        raise ValueError("Unexpected original escort limit")
    daily.set_number(1)

    cars = config.child("tBiaoche").children
    if len(cars) != 5:
        raise ValueError("Expected five escort carts")
    for index, car in enumerate(cars):
        awards = car.child("Awards").children
        if len(awards) != 3:
            raise ValueError("Unexpected escort awards")
        coin = awards[1].child("count")
        feats = awards[2].child("count")
        if (awards[1].child("type").number(), coin.number(),
                awards[2].child("type").number(), feats.number()) != (
                    5, BASE_BIND_COIN[index], 41, BASE_FEATS[index]):
            raise ValueError(f"Unexpected escort awards for cart {index}")
        coin.set_number(BASE_BIND_COIN[index] * NORMAL_MULTIPLIER)
        feats.set_number(BASE_FEATS[index] * NORMAL_MULTIPLIER)

    rules = config.child("activityCfg")
    addition = r"\6.每日押镖合并为1次；奖励按原3次合并并提高5倍，黄金特权按原4次计算。"
    if rules.kind != 3 or b"<(c0xffff0000)5." not in rules.value:
        raise ValueError("Unexpected escort rules text")
    rules.value += addition.encode("utf-8")
    result = write_cbp(header, root)
    read_cbp(result)
    return result


def patch_pack(source: bytes, old_config: bytes, new_config: bytes) -> bytes:
    entries = read_pack(source)
    if write_pack(entries) != source:
        raise ValueError("Language pack did not round-trip")
    positions = [i for i, (name, value) in enumerate(entries) if name == CONFIG_NAME]
    if len(positions) != 1 or entries[positions[0]][1] != old_config:
        raise ValueError("Packed escort config differs from the standalone copy")
    entries[positions[0]] = (CONFIG_NAME, new_config)
    return write_pack(entries)


def patch_method(abc: bytes, method: int, limits: bytes, code_length: int,
                 old_fragment: bytes, new_fragment: bytes, prefix: bytes) -> tuple[int, int, bytes]:
    marker = encode_u30(method) + limits + encode_u30(code_length) + prefix
    if abc.count(marker) != 1:
        raise ValueError(f"Could not locate escort method {method}")
    start = abc.index(marker) + len(encode_u30(method)) + len(limits)
    code_start = start + len(encode_u30(code_length))
    code = abc[code_start:code_start + code_length]
    if code.count(old_fragment) != 1:
        raise ValueError(f"Escort method {method} does not match the expected code")
    patched = code.replace(old_fragment, new_fragment, 1)
    return start, code_start + code_length, encode_u30(len(patched)) + patched


def patch_abc(abc: bytes) -> bytes:
    # The golden privilege branch previously displayed maxEscort + 1.
    limit = patch_method(
        abc, 7419, bytes((3, 2, 15, 16)), 76,
        bytes.fromhex("66 f0 4c 66 bb 76 24 01 a0 68 f5 4c"),
        bytes.fromhex("66 f0 4c 66 bb 76 24 00 a0 68 f5 4c"),
        bytes.fromhex("d0 30 d0 d1 4e b4 0e 01"),
    )

    # The CBP contains 15x ordinary rewards. Golden privilege uses 20x,
    # so display count * (3 + bool(goldTimer)) / 3 for both reward labels.
    reward_factor = bytes.fromhex(
        "24 03 60 cc 0d 66 aa fb 01 66 86 62 76 73 a0 a2 24 03 a3"
    )
    reward_marker = (
        encode_u30(7427) + bytes((4, 6, 15, 16)) + encode_u30(352)
        + bytes.fromhex("d0 30 20 85 d7 d1 93 73")
    )
    if abc.count(reward_marker) != 1:
        raise ValueError("Could not locate the escort reward display method")
    start = abc.index(reward_marker) + len(encode_u30(7427)) + 4
    code_start = start + len(encode_u30(352))
    code = abc[code_start:code_start + 352]
    if code[289:307] != bytes.fromhex("d0 66 ec 4c 62 04 66 a7 ae 01 66 aa 1d d3 a0 61 86 56"):
        raise ValueError("Unexpected escort reward display tail")
    bind_award = bytes.fromhex(
        "d0 66 e8 4c 62 04 66 b4 76 24 01 66 c9 de 02 66 cc de 02 61 86 56"
    )
    feats_award = bytes.fromhex(
        "d0 66 e9 4c 62 04 66 b4 76 24 02 66 c9 de 02 66 cc de 02 61 86 56"
    )
    for fragment in (bind_award, feats_award):
        if code.count(fragment) != 1:
            raise ValueError("Unexpected escort award label code")
        code = code.replace(fragment, fragment[:-3] + reward_factor + fragment[-3:], 1)
    reward = (start, code_start + 352, encode_u30(len(code)) + code)

    result = bytearray(abc)
    for begin, end, replacement in sorted((limit, reward), reverse=True):
        result[begin:end] = replacement
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
    root = Path(__file__).resolve().parents[1]
    swf_path = root / "web/GameFrame.swf"
    config_path = root / "web/v2/lang/zh-cn" / CONFIG_NAME
    pack_path = root / "web/v2/lang/zh-cn/zh-cn.dat"
    swf = swf_path.read_bytes()
    config = config_path.read_bytes()
    pack = pack_path.read_bytes()
    check_hash(swf, EXPECTED_SWF, "GameFrame.swf")
    check_hash(config, EXPECTED_CBP, CONFIG_NAME)
    check_hash(pack, EXPECTED_PACK, "zh-cn.dat")
    patched_config = patch_config(config)
    patched_pack = patch_pack(pack, config, patched_config)
    patched_swf = patch_swf(swf)
    swf_path.write_bytes(patched_swf)
    config_path.write_bytes(patched_config)
    pack_path.write_bytes(patched_pack)
    print("Updated escort count and rewards in the client and packed resources")


if __name__ == "__main__":
    main()
