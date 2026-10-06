"""Derive BOSS temper-stone tiers from actual equipment drops; --check is read-only."""
from __future__ import annotations

import argparse
from collections import Counter, defaultdict
from pathlib import Path
import re

from patch_box_stacking import server_items

ROOT = Path(__file__).resolve().parents[1]
BASE = ROOT / "Server/S1001/data/config/monster"
CONFIG = BASE / "BossTemperStoneDropCfg.lua"
ITEM_ID = 5648


def fields(line):
    return {k.decode(): int(v) for k, v in
            re.findall(rb"(\w+)\s*=\s*(-?\d+)", line.split(b"--", 1)[0])}


def stone_row(line):
    return line.lstrip().startswith(b"{type=") and fields(line).get("id") == ITEM_ID


def derive_tiers():
    items = server_items((ROOT / "Server/S1001/data/config/item/StdItems.txt").read_bytes())
    equipment = {}
    for item, block in items.items():
        kind = int(re.search(rb"(?m)^  type=(\d+),", block)[1])
        # Player equipment; exclude boxes and other materials with rebirth conditions.
        if 1 <= kind < 14 or 87 <= kind <= 94:
            values = re.findall(rb"\{cond=13,value=(\d+)\}", block)
            equipment[item] = max(map(int, values), default=0)
    tiers, users = {}, defaultdict(list)
    templates = {p.name: p.read_bytes() for p in (BASE / "drops").glob("*.lua")}
    for block in re.split(rb"\r?\n\{\r?\n", (BASE / "StdMonster.txt").read_bytes())[1:]:
        mid = int(re.search(rb"entityid=(\d+)", block)[1])
        kind = int(re.search(rb"monsterType=(\d+)", block)[1])
        highest = 0
        for name in re.findall(rb'--#include "drops\\([^"\r\n]+)"', block):
            filename = name.decode()
            users[filename].append(mid)
            if kind != 4:
                continue
            for line in templates[filename].splitlines():
                if not line.lstrip().startswith(b"{type="):
                    continue
                row = fields(line)
                if (row.get("type") == 0 and row.get("propability", 0) > 0
                        and (row.get("count", 0) > 0 or row.get("maxcount", 0) > 0)):
                    highest = max(highest, equipment.get(row.get("id"), 0))
        if highest >= 1:
            tiers[mid] = highest
    return tiers, templates, users


def config_bytes(tiers):
    lines = [
        "-- 锤炼石按最高装备转生等级上下浮动 2 个，封顶 15 后减半向下取整，至少 1 个整组必掉。",
        "-- 由 tools/patch_boss_temper_stone.py 生成；装备或掉落模板变更后重新生成。",
        "LocalDT.BossTemperStoneDrop = {",
        "\titemId = 5648, bind = 1, fluctuation = 2, maxCount = 15,",
        "\tmonsters = {",
    ]
    lines.extend(f"\t\t[{mid}] = {tier}," for mid, tier in sorted(tiers.items()))
    lines.extend(["\t},", "}", ""])
    return "\r\n".join(lines).encode("utf-8")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    tiers, templates, users = derive_tiers()
    if not tiers:
        raise ValueError("No eligible bosses")
    expected = config_bytes(tiers)
    if args.check:
        assert CONFIG.read_bytes() == expected, "BOSS equipment tiers changed; regenerate configuration"
    else:
        CONFIG.write_bytes(expected)
    removed = 0
    for filename, source in templates.items():
        rows = [line for line in source.splitlines(keepends=True) if stone_row(line)]
        if not rows:
            continue
        assert users[filename] and all(mid in tiers for mid in users[filename]), filename
        if args.check:
            raise AssertionError(filename + ": native stone drop would duplicate the group")
        (BASE / "drops" / filename).write_bytes(b"".join(
            line for line in source.splitlines(keepends=True) if not stone_row(line)))
        removed += len(rows)
    print(f"Eligible BOSS: {len(tiers)}; equipment tiers: {dict(sorted(Counter(tiers.values()).items()))}; removed native rows: {removed}")


if __name__ == "__main__":
    main()
