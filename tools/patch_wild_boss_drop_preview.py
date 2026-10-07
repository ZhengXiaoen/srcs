"""Generate two-row wild BOSS previews from current native and scripted drops."""
from __future__ import annotations

import argparse
from collections import defaultdict
import re

from patch_boss_equipment_drop import DATA, build, load, serialize

OUTPUT = DATA / "config/monster/WildBossDropPreviewCfg.lua"


def generate(lua_path=None):
    lua, items, meta, baseline = load(lua_path)
    equipment, _ = build(lua, items, meta, baseline)
    # Expand repeated drop templates in place: their indexes are significant.
    source = (DATA / "config/monster/StdMonster.txt").read_bytes()
    source = source.split(b"-- BOSS equipment override;")[0]
    source = re.sub(rb'--#include "drops\\([^"\r\n]+)"',
                    lambda m: (DATA / "config/monster/drops" / m[1].decode()).read_bytes(), source)
    lua.execute(source)
    lua.execute(b"LocalDT={}")
    for path in ("config/monster/BossMaterialDropCfg.lua",
                 "config/monster/BossTemperStoneDropCfg.lua",
                 "config/BossListInfo/BossListInfo.lua", "config/monster/SRRefreshMonster.lua"):
        lua.execute((DATA / path).read_bytes())
    g = lua.globals()
    native = {int(row[b"entityid"]): row for row in g.StdMonster.values()}
    actual = defaultdict(set)
    for mid, monster in native.items():
        rule = equipment["monsters"].get(mid)
        disabled = set(rule["disabled"]) if rule else set()
        for index, row in monster[b"drops"].items():
            if (index not in disabled and row[b"type"] == 0 and row[b"propability"] > 0
                    and ((row[b"count"] or 0) > 0 or (row[b"maxcount"] or 0) > 0)):
                actual[mid].add(int(row[b"id"]))
        if rule:
            profile = equipment["profiles"][rule["profile"] - 1]
            for weights in profile["weights"]:
                for row in weights:
                    actual[mid].update(row["weapons"] + row["clothes"])
            for group in profile["mixed"]:
                actual[mid].update(row["id"] for row in group if not row["omit"])
        for drop_id in (g.LocalDT.BossMaterialDropMonsters[mid] or {}).values():
            for row in g.LocalDT.BossMaterialDrops[drop_id].values():
                if ((row[b"rate"] or 0) > 0 or (row[b"propability"] or 0) > 0) and ((row[b"count"] or 0) > 0 or (row[b"maxcount"] or 0) > 0):
                    actual[mid].add(int(row[b"id"]))
        if g.LocalDT.BossTemperStoneDrop[b"monsters"][mid]:
            actual[mid].add(int(g.LocalDT.BossTemperStoneDrop[b"itemId"]))

    preferred = {int(row[1]): [int(iid) for index, iid in sorted(row.items()) if index > 1]
                 for row in g.BossEquipCfg.values()}
    conds = {iid: {int(c[b"cond"]): int(c[b"value"]) for c in item[b"conds"].values()}
             for iid, item in items.items()}

    def valid(iid):
        return iid in items and lua.globals().Item[("n" + str(iid)).encode()] not in (None, b"null")

    def preview(monsters, priority):
        pool = {iid for mid in monsters for iid in actual[mid] if valid(iid)}
        rows = []
        for sex in (0, 1):
            row = []
            for job in (1, 2, 3):
                for kind in (1, 2):
                    candidates = [iid for iid in pool if meta[iid]["kind"] == kind
                                  and conds[iid].get(3, 0) in (0, job)
                                  and (kind == 1 or conds[iid].get(2, sex) == sex)]
                    # Use the real rebirth condition, including 8/10/12-tier suits.
                    candidates.sort(key=lambda iid: (-meta[iid]["tier"], -conds[iid].get(1, 0), iid))
                    if candidates and candidates[0] not in row:
                        row.append(candidates[0])
            rows.append(row)
        special = []
        for iid in [*priority, *sorted(pool)]:
            kind = meta.get(iid, {}).get("kind", 0)
            if (iid in pool and iid not in special and not (1 <= kind < 14 or 87 <= kind <= 94)):
                special.append(iid)
                if len(special) == 6:
                    break
        return {"equipment": rows, "special": special}

    configs = {}
    maps = {}
    for info in g.BossListInfo.values():
        args = info[b"args"]
        monsters = []
        for row in g.RefreshMonsterData.values():
            if args[1] <= row[b"bj"] <= args[2]:
                monsters.append(int(row[b"monid"]))
        for index in (args[b"add"] or {}).values():
            monsters.append(int(g.RefreshMonsterData[index][b"monid"]))
        priority = [int(iid) for _, iid in sorted((args[b"itemlist"] or {}).items())]
        key = str(int(args[1])) + ":" + str(int(args[2]))
        assert key not in maps, key
        maps[key] = preview(monsters, priority)
        for mid in monsters:
            configs[mid] = preview([mid], preferred.get(mid, []))
    for mid, priority in preferred.items():
        configs[mid] = preview([mid], priority)
    lines = ["-- 由 tools/patch_wild_boss_drop_preview.py 按实际掉落生成；装备和掉落变更后重新生成。",
             "-- 第一排战法道武器、衣服，第二排最多六件特殊掉落；衣服按查看者性别展示。",
             "LocalDT.WildBossDropPreview = {", "monsters={"]
    lines.extend(f"[{mid}]={serialize(config)}," for mid, config in sorted(configs.items()))
    lines.extend(["},", "maps={"])
    lines.extend(f'["{key}"]={serialize(config)},' for key, config in maps.items())
    lines.extend(["},", "}", ""])
    return "\n".join(lines).encode("utf8"), actual, configs, maps, items, meta, conds


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--lua-path")
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    result, _, monsters, maps, *_ = generate(args.lua_path)
    if args.check:
        assert OUTPUT.read_bytes() == result, "Wild BOSS preview is stale"
    else:
        OUTPUT.write_bytes(result)
    print(f"Verified {len(monsters)} BOSS previews and {len(maps)} map previews")
