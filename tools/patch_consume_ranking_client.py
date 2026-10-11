"""Describe the sole Wanfu consumption ranking in client panels.

Only two ABC string constants change; all method bodies and other SWF tags
remain byte-identical. Use --check to verify the patched client and rewards.
"""

from __future__ import annotations

import argparse
import re
import struct
import zlib
from pathlib import Path

from patch_bag_client import ABCReader, encode_u30
from patch_daily_recharge_client import read_pack
from patch_guild_quest_config import read_cbp


ROOT = Path(__file__).resolve().parents[1]
CLIENT = ROOT / "web/GameFrame.swf"
REPLACEMENTS = {
    "每晚0点通过邮件发放排名奖励": "每晚0点邮件发放万服庆典消费排行奖励",
    "(每天0点结算排名奖励，奖励以邮件发放)": "(每天0点通过邮件发放万服庆典消费排行奖励)",
}
PREVIOUS = {
    "每晚0点通过邮件发放排名奖励": "每晚0点邮件发奖，周年庆典、万服庆典分别结算",
    "(每天0点结算排名奖励，奖励以邮件发放)": "(每天0点邮件发奖，与万服庆典同时开启时分别发奖)",
}


def patch_abc(source: bytes) -> bytes:
    reader = ABCReader(source)
    reader.skip(4)
    for _ in range(reader.u30() - 1):
        reader.u30()
    for _ in range(reader.u30() - 1):
        reader.u30()
    reader.skip(8 * (reader.u30() - 1))
    patches = []
    found = set()
    for _ in range(reader.u30() - 1):
        start = reader.pos
        size = reader.u30()
        text = source[reader.pos:reader.pos + size].decode("utf-8")
        reader.skip(size)
        for old, new in REPLACEMENTS.items():
            if any(value in text for value in (old, new, PREVIOUS[old])) and "消费" in text:
                if old in found or "邮件" not in text:
                    raise ValueError("Unexpected consumption ranking description")
                found.add(old)
                if new not in text:
                    previous = PREVIOUS[old]
                    encoded = text.replace(previous, new).replace(old, new).encode("utf-8")
                    patches.append((start, reader.pos, encode_u30(len(encoded)) + encoded))
    if found != REPLACEMENTS.keys():
        raise ValueError("Both consumption ranking descriptions must be present")
    suffix = source[reader.pos:]
    result = bytearray(source)
    for start, end, replacement in reversed(patches):
        result[start:end] = replacement
    if suffix != bytes(result[len(result) - len(suffix):]):
        raise ValueError("ABC method bodies or other pools changed")
    return bytes(result)


def patch_swf(source: bytes) -> bytes:
    if source[:3] != b"CWS":
        raise ValueError("Expected a compressed SWF")
    swf = source[:8] + zlib.decompress(source[8:])
    if len(swf) != struct.unpack_from("<I", source, 4)[0]:
        raise ValueError("Invalid SWF length")
    pos = 8 + (5 + (swf[8] >> 3) * 4 + 7) // 8 + 4
    while pos < len(swf):
        start = pos
        header = struct.unpack_from("<H", swf, pos)[0]
        pos += 2
        size = header & 63
        if size == 63:
            size = struct.unpack_from("<I", swf, pos)[0]
            pos += 4
        end = pos + size
        if header >> 6 == 82:
            if header & 63 != 63:
                raise ValueError("Expected long DoABC tag")
            abc_start = swf.index(b"\0", pos + 4, end) + 1
            abc = patch_abc(swf[abc_start:end])
            if abc == swf[abc_start:end]:
                return source
            patched = (swf[:start + 2] + struct.pack("<I", abc_start - pos + len(abc))
                       + swf[pos:abc_start] + abc + swf[end:])
            patched = patched[:4] + struct.pack("<I", len(patched)) + patched[8:]
            if patched[8:start] != swf[8:start] or patched[-len(swf[end:]):] != swf[end:]:
                raise ValueError("Unrelated SWF tags changed")
            return patched[:8] + zlib.compress(patched[8:], level=9)
        pos = end
    raise ValueError("Missing client ABC")


def verify_rewards():
    directory = ROOT / "web/v2/lang/zh-cn"
    entries = dict(read_pack((directory / "zh-cn.dat").read_bytes()))
    for name in ("PublicTestCfg.cbp", "QingDianActivityCfg.cbp", "oneyearactivitycfg.cbp"):
        if entries[name] != (directory / name).read_bytes():
            raise ValueError(f"Packed and standalone config differ: {name}")
    _, root = read_cbp(entries["PublicTestCfg.cbp"])
    ranking = root.child("YbConsumeRanking")
    source = (ROOT / "Server/S1001/data/config/activity/PublicTestCfg.lua").read_text(encoding="utf-8-sig")
    source = re.sub(r"--[^\r\n]*", "", source)
    source = source[source.index("YbConsumeRanking = {"):source.index("HeroSuperCloth = {")]
    minimums = [int(value) for value in re.findall(r"minConsume\s*=\s*(\d+)", source)]
    if [int(ranking.child("minConsume").number())] + [int(tier.child("minConsume").number()) for tier in ranking.child("awardList").children] != minimums:
        raise ValueError("Client and server consumption thresholds differ")
    mail_awards = re.findall(r'mailAward\s*=\s*"([^"]+)"', source)
    for tier, mail in zip(ranking.child("awardList").children, mail_awards, strict=True):
        client = [tuple(int(item.child(field).number()) for field in ("id", "count", "bind")) for item in tier.child("award").children]
        expected = [tuple(int(value) for value in item.split(",")) for item in mail.split("/")]
        if client != expected:
            raise ValueError("Client items, quantities or binding differ from server mail")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    verify_rewards()
    source = CLIENT.read_bytes()
    patched = patch_swf(source)
    if patch_swf(patched) != patched:
        raise ValueError("Client patch is not idempotent")
    if args.check:
        if source != patched:
            raise ValueError("Client consumption reward descriptions need syncing")
    elif source != patched:
        CLIENT.write_bytes(patched)
    print("Verified both client descriptions, all reward tiers and matching packed configs.")


if __name__ == "__main__":
    main()
