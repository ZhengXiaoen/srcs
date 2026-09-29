"""Sync one-time seven-day reward contents with the client and language pack.

Only sevenDaysActivitycfg.cbp changes in the language pack. Client interface
captions and artwork remain unchanged. Use --check to verify without writing.
"""

from __future__ import annotations

import argparse
import re
import struct
from pathlib import Path

from patch_daily_recharge_client import read_cbp, read_pack, write_cbp, write_pack
from patch_guild_quest_config import Node


ROOT = Path(__file__).resolve().parents[1]
SERVER = ROOT / "Server/S1001/data/config/activity/SevenDaysActivitycfg.lua"
CLIENT = ROOT / "web/v2/lang/zh-cn/sevenDaysActivitycfg.cbp"
PACK = CLIENT.parent / "zh-cn.dat"
def server_rewards() -> list[list[dict[str, int]]]:
    source = re.sub(r"--[^\r\n]*", "", SERVER.read_text(encoding="utf-8-sig"))
    days = re.findall(r"\{\s*((?:\{[^{}]+\}\s*,\s*)+)\}", source)
    if len(days) != 7:
        raise ValueError("Expected seven server reward days")
    result = []
    for day in days:
        items = []
        for table in re.findall(r"\{([^{}]+)\}", day):
            fields = {}
            for field in table.split(","):
                match = re.fullmatch(r"\s*(type|id|count|bind)\s*=\s*(\d+)\s*", field)
                if not match or match[1] in fields:
                    raise ValueError("Invalid reward field")
                fields[match[1]] = int(match[2])
            if fields.keys() != {"type", "id", "count", "bind"} or fields["type"] != 0 or fields["bind"] != 1 or fields["count"] < 1:
                raise ValueError("Expected positive, bound item rewards")
            items.append(fields)
        if len(items) != 6:
            raise ValueError("Expected five base rewards and one special reward")
        result.append(items)
    return result


def patch_config(source: bytes, days: list[list[dict[str, int]]]) -> bytes:
    header, root = read_cbp(source)
    if [day.name for day in root.children] != [str(i) for i in range(7)]:
        raise ValueError("Unexpected client day indexes")
    for day, items in zip(root.children, days):
        day.children = [Node(str(i), 4, children=[
            Node(name, 2, struct.pack("<d", item[name])) for name in ("type", "id", "count", "bind")
        ]) for i, item in enumerate(items)]
    if root == read_cbp(source)[1]:
        return source
    output = write_cbp(header, root)
    if read_cbp(output)[1] != root:
        raise ValueError("Updated reward config did not round-trip")
    return output


def sync_pack(source: bytes, old_config: bytes, new_config: bytes) -> bytes:
    entries = read_pack(source)
    if write_pack(entries) != source:
        raise ValueError("Language pack did not round-trip")
    positions = [i for i, (name, _) in enumerate(entries) if name == CLIENT.name]
    if len(positions) != 1 or entries[positions[0]][1] != old_config:
        raise ValueError("Packed and standalone seven-day configs differ")
    original = list(entries)
    entries[positions[0]] = (CLIENT.name, new_config)
    output = write_pack(entries)
    verified = read_pack(output)
    if verified != entries or any(before != after for i, (before, after) in enumerate(zip(original, verified)) if i != positions[0]):
        raise ValueError("Unrelated packed resources changed")
    return output


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    config, pack = CLIENT.read_bytes(), PACK.read_bytes()
    updated_config = patch_config(config, server_rewards())
    outputs = [(CLIENT, config, updated_config), (PACK, pack, sync_pack(pack, config, updated_config))]
    if args.check:
        if any(old != new for _, old, new in outputs):
            raise ValueError("Seven-day client rewards have not been synced")
    else:
        for path, old, new in outputs:
            if old != new:
                path.write_bytes(new)
    print("Verified seven reward days and matching packed config; other resources are unchanged.")


if __name__ == "__main__":
    main()
