"""Sync only VIP gold-brick counts with the server's fragment rewards."""

from __future__ import annotations

import argparse
import re
from pathlib import Path

from patch_daily_recharge_client import read_cbp, read_pack, write_cbp, write_pack


ROOT = Path(__file__).resolve().parents[1]
CONFIG_NAME = "vipconfig.cbp"
SERVER_PATH = ROOT / "Server/S1001/data/config/vip/VipConfig.lua"
CLIENT_PATH = ROOT / "web/v2/lang/zh-cn" / CONFIG_NAME
PACK_PATH = CLIENT_PATH.parent / "zh-cn.dat"
BRICK_LEVELS = {1, 2, 3, 4, 5, 8, 9, 10, 11, 12}


def read_server_rewards(source: bytes) -> dict[int, list[dict[str, int]]]:
    text = re.sub(r"--[^\r\n]*", "", source.decode("utf-8-sig"))
    levels = list(re.finditer(r"\bvip\s*=\s*(\d+)\s*,", text))
    rewards = {}
    for index, level in enumerate(levels):
        end = levels[index + 1].start() if index + 1 < len(levels) else len(text)
        block = text[level.end() : end]
        tables = re.findall(r"\breward\s*=\s*\{(.*?)^\s*}\s*,", block, re.S | re.M)
        if len(tables) != 1:
            raise ValueError("Expected one reward table per VIP level")
        items = []
        for entry in re.findall(r"\{([^{}]*)}", tables[0]):
            fields = {}
            for field in entry.strip().rstrip(",").split(","):
                match = re.fullmatch(r"\s*(\w+)\s*=\s*(-?\d+)\s*", field)
                if match is None or match[1] in fields:
                    raise ValueError("Unsupported or duplicate VIP reward field")
                fields[match[1]] = int(match[2])
            if not {"type", "id", "count", "bind", "sex"} <= fields.keys():
                raise ValueError("VIP reward is missing required fields")
            items.append(fields)
        number = int(level[1])
        if number in rewards or not items:
            raise ValueError("Duplicate or empty VIP reward level")
        rewards[number] = items
    if set(rewards) != set(range(1, 13)):
        raise ValueError("Expected VIP levels 1 through 12")
    for level, items in rewards.items():
        fragments = [item["count"] for item in items if item["id"] in (536, 570)]
        bricks = [item for item in items if item["id"] == 509]
        if len(fragments) != 2 or fragments[0] != fragments[1] or fragments[0] <= 0:
            raise ValueError(f"VIP{level} fragment counts do not agree")
        if len(bricks) != int(level in BRICK_LEVELS):
            raise ValueError(f"Unexpected VIP{level} gold-brick reward")
        if bricks and (bricks[0]["type"] != 0 or bricks[0]["count"] != fragments[0]):
            raise ValueError(f"VIP{level} gold-brick count must match fragments")
    return rewards


def fields_of(node) -> dict[str, int]:
    fields = {}
    for field in node.children:
        value = field.number()
        if field.name in fields or value != int(value):
            raise ValueError("Invalid client VIP reward field")
        fields[field.name] = int(value)
    return fields


def patch_client(source: bytes, server: dict[int, list[dict[str, int]]]) -> bytes:
    header, root = read_cbp(source)
    grades = root.child("VipGrade")
    if [level.name for level in grades.children] != [str(index) for index in range(12)]:
        raise ValueError("Unexpected client VIP levels")
    for level in grades.children:
        number = int(level.name) + 1
        rewards = level.child("reward")
        if [item.name for item in rewards.children] != [str(index) for index in range(len(rewards.children))]:
            raise ValueError("Client VIP reward indexes are out of order")
        fields = [fields_of(item) for item in rewards.children]
        for item_id in (536, 570):
            actual = [item for item in fields if item["id"] == item_id]
            expected = [item for item in server[number] if item["id"] == item_id]
            if actual != expected:
                raise ValueError(f"VIP{number} fragment rewards differ from the server")
        bricks = [item for item in rewards.children if fields_of(item)["id"] == 509]
        expected = [item for item in server[number] if item["id"] == 509]
        if len(bricks) != len(expected):
            raise ValueError(f"Unexpected VIP{number} gold-brick reward")
        if not bricks:
            continue
        actual = fields_of(bricks[0])
        if {name: value for name, value in actual.items() if name != "count"} != {
            name: value for name, value in expected[0].items() if name != "count"
        } or actual["count"] not in (509, expected[0]["count"]):
            raise ValueError(f"Unexpected VIP{number} gold-brick fields or count")
        bricks[0].child("count").set_number(expected[0]["count"])
    if read_cbp(source)[1] == root:
        return source
    output = write_cbp(header, root)
    if read_cbp(output)[1] != root:
        raise ValueError("Patched VIP config did not round-trip")
    return output


def sync_pack(source: bytes, original_client: bytes, updated_client: bytes) -> bytes:
    entries = read_pack(source)
    if write_pack(entries) != source:
        raise ValueError("Language pack did not round-trip")
    positions = [index for index, (name, _) in enumerate(entries) if name == CONFIG_NAME]
    if len(positions) != 1 or entries[positions[0]][1] != original_client:
        raise ValueError("Packed and standalone VIP configs differ")
    if updated_client == original_client:
        return source
    original_entries = list(entries)
    entries[positions[0]] = (CONFIG_NAME, updated_client)
    output = write_pack(entries)
    verified = read_pack(output)
    if verified != entries or any(before != after for index, (before, after)
                                  in enumerate(zip(original_entries, verified)) if index != positions[0]):
        raise ValueError("Unrelated packed resources changed")
    return output


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true", help="Verify without modifying resources")
    args = parser.parse_args()
    server = read_server_rewards(SERVER_PATH.read_bytes())
    source = CLIENT_PATH.read_bytes()
    output = patch_client(source, server)
    pack = PACK_PATH.read_bytes()
    updated_pack = sync_pack(pack, source, output)
    if args.check:
        if source != output or pack != updated_pack:
            raise ValueError("VIP client resources have not been synced")
    else:
        if source != output:
            CLIENT_PATH.write_bytes(output)
        if pack != updated_pack:
            PACK_PATH.write_bytes(updated_pack)
    print("Verified VIP gold-brick counts; other rewards and VIP6/7 remain unchanged.")


if __name__ == "__main__":
    main()
