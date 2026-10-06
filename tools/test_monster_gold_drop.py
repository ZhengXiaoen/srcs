"""Audit removed monster gold and the one-brick-per-BOSS replacement.

Use --lua-path for an isolated lupa installation. No live game process is used.
"""
from __future__ import annotations

import argparse
from collections import Counter
from pathlib import Path
import re
import subprocess
import sys
import unittest

ROOT = Path(__file__).resolve().parents[1]
BASE = Path("Server/S1001/data/config/monster")
MONSTERS = BASE / "StdMonster.txt"
GOLD = re.compile(rb"\s*\{type=[56],")
BRICK_INCLUDE = re.compile(
    rb'--#include "drops\\dropsBossGoldBrick(?:Protected)?\.lua"\r?\n')
BASELINE = "d5a72c8^"
MATERIAL_VALUES = {
    568: ("shield", 100), 569: ("shield", 1000), 570: ("shield", 10000),
    535: ("talisman", 1000), 536: ("talisman", 10000),
    5165: ("soul", 10), 5166: ("soul", 100),
}


def old(path):
    return subprocess.check_output(
        ["git", "show", BASELINE + ":" + path.as_posix()], cwd=ROOT)


def fields(line):
    return {k.decode(): int(v) for k, v in re.findall(rb"(\w+)=(-?\d+)", line)}


def blocks(data):
    return {int(re.search(rb"entityid=(\d+)", block)[1]): block
            for block in re.split(rb"\r?\n\{\r?\n", data)[1:]}


def guaranteed_material_values(data):
    """Compare equivalent denominations while keeping every drop condition."""
    other, values = [], Counter()
    for line in data.splitlines(keepends=True):
        row = fields(line.split(b"--", 1)[0]) if line.lstrip().startswith(b"{type=") else {}
        if (row.get("type") == 0 and row.get("id") in MATERIAL_VALUES
                and row.get("propability") == 1 and row.get("group") == 0
                and row.get("mincount") == 0 and row.get("maxcount") == 0):
            if row["count"] <= 0:
                raise ValueError("Material reward count must remain positive")
            family, value = MATERIAL_VALUES[row["id"]]
            conditions = tuple(sorted((k, v) for k, v in row.items() if k not in ("id", "count")))
            values[(family, conditions)] += value * row["count"]
        else:
            other.append(line)
    return b"".join(other), values


class MonsterGoldDropTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        lua = LuaRuntime(unpack_returned_tuples=True)
        lua.execute("LocalDT={}")
        lua.execute((ROOT / BASE / "BossMaterialDropCfg.lua").read_bytes())
        cls.materials = {int(k): [dict(row.items()) for _, row in table.items()]
                         for k, table in lua.globals().LocalDT.BossMaterialDrops.items()}
        cls.original_monsters = old(MONSTERS)
        cls.monsters = blocks((ROOT / MONSTERS).read_bytes())
        cls.originals = blocks(cls.original_monsters)
        paths = subprocess.check_output(
            ["git", "ls-tree", "-r", "--name-only", BASELINE,
             (BASE / "drops").as_posix()], cwd=ROOT).decode().splitlines()
        cls.original_drops = {Path(path): old(Path(path)) for path in paths
                              if re.search(r"/drops\d+\.lua$", path)}
        cls.coin_rows = {int(path.stem[5:]): [fields(line)
                        for line in data.splitlines() if GOLD.match(line)]
                        for path, data in cls.original_drops.items()}
        cls.expected = {}
        for mid, block in cls.originals.items():
            rows = [row for index in re.findall(rb'drops\\drops(\d+)\.lua', block)
                    for row in cls.coin_rows.get(int(index), [])
                    if row["count"] > 0 and row["propability"] > 0]
            if int(re.search(rb"monsterType=(\d+)", block)[1]) == 4 and rows:
                assert any(row["propability"] == 1 for row in rows), mid
                cls.expected[mid] = max(row["LootTime"] for row in rows)

    def test_all_gold_removed_and_other_drop_values_unchanged(self):
        changed = removed = 0
        for path, original in self.original_drops.items():
            wanted = b"".join(line for line in original.splitlines(keepends=True)
                              if not GOLD.match(line))
            reference = subprocess.check_output(
                ["git", "show", "4b74c90:" + path.as_posix()], cwd=ROOT)
            remaining = reference
            for cfg in self.materials.get(int(path.stem[5:]), []):
                matching = next(line for line in remaining.splitlines(keepends=True)
                                if line.startswith(b"{type=") and all(fields(line).get(k)==v for k,v in cfg.items()))
                remaining = remaining.replace(matching, b"", 1)
            # These native stone rows are now replaced by BOSS equipment-tier groups.
            if path.name in {*(f"drops{i}.lua" for i in range(2190,2198)), "drops2330.lua"}:
                remaining = b"".join(line for line in remaining.splitlines(keepends=True)
                                     if fields(line).get("id") != 5648)
            self.assertEqual(remaining, (ROOT / path).read_bytes(), path)
            # Temple fragments now use their own Lua drop configuration.
            if path.name in {*(f"drops{i}.lua" for i in range(2190,2198)),"drops2330.lua"}:
                wanted=b"".join(line for line in wanted.splitlines(keepends=True)
                                if fields(line).get("id") not in {5152,5153,5154,5155})
            self.assertEqual(guaranteed_material_values(wanted),
                             guaranteed_material_values(reference), path)
            if any(GOLD.match(line) for line in original.splitlines()):
                changed += 1
                removed += sum(bool(GOLD.match(line)) for line in original.splitlines())
        self.assertEqual((162, 265), (changed, removed))
        shared_original = self.original_drops[BASE / "drops/drops1511.lua"]
        self.assertEqual(b"".join(line for line in shared_original.splitlines(keepends=True)
                                  if not GOLD.match(line)),
                         (ROOT / BASE / "drops/drops1511Normal.lua").read_bytes())
        for path in (ROOT / BASE / "drops").glob("*.lua"):
            self.assertFalse(any(GOLD.match(line) for line in path.read_bytes().splitlines()), path)

    def test_only_original_coin_bosses_get_exactly_one_brick(self):
        self.assertEqual(582, len(self.expected))
        for mid, block in self.monsters.items():
            includes = BRICK_INCLUDE.findall(block)
            self.assertEqual(int(mid in self.expected), len(includes), mid)
            if includes:
                self.assertEqual(4, int(re.search(rb"monsterType=(\d+)", block)[1]))
                self.assertEqual(bool(self.expected[mid]), b"Protected" in includes[0])
            cleaned = BRICK_INCLUDE.sub(b"", block)
            if mid == 545:
                cleaned = cleaned.replace(b'drops\\drops1511Normal.lua', b'drops\\drops1511.lua')
            self.assertEqual(self.originals[mid], cleaned, mid)
        current = (ROOT / MONSTERS).read_bytes()
        self.assertEqual(1, current.count(b'drops\\drops1511Normal.lua'))
        self.assertEqual(self.original_monsters,
                         BRICK_INCLUDE.sub(b"", current).replace(
                             b'drops\\drops1511Normal.lua', b'drops\\drops1511.lua'))
        self.assertEqual(5, sum(bool(v) for v in self.expected.values()))

    def test_gold_brick_is_guaranteed_unbound_item_and_keeps_protection(self):
        for filename, loot in (("dropsBossGoldBrick.lua", 0),
                               ("dropsBossGoldBrickProtected.lua", 10)):
            rows = [fields(line) for line in (ROOT / BASE / "drops" / filename).read_bytes().splitlines()
                    if line.startswith(b"{type=")]
            self.assertEqual(1, len(rows))
            self.assertEqual({"type": 0, "id": 508, "count": 1, "propability": 1,
                              "bind": 0, "group": 0, "LootTime": loot},
                             {k: rows[0][k] for k in ("type", "id", "count", "propability",
                                                     "bind", "group", "LootTime")})
            self.assertTrue(all(v == 0 for k, v in rows[0].items()
                                if k not in ("id", "count", "propability", "LootTime")))

    def test_entire_monster_config_compiles_in_lua51(self):
        def expand(path, ancestors=()):
            self.assertNotIn(path, ancestors)
            data = path.read_bytes().removeprefix(b"\xef\xbb\xbf")
            def include(match):
                target = path.parent / match[1].decode().replace("\\", "/")
                # The language header initializes localization; compile only
                # needs the Lang references, so omit that unrelated header.
                if target.name == "LangCode.txt":
                    return b""
                return expand(target.resolve(), ancestors + (path,))
            return re.sub(rb'(?m)^--#include "([^"]+)"[^\r\n]*', include, data)
        expanded = expand((ROOT / MONSTERS).resolve())
        lua = LuaRuntime(encoding=None, unpack_returned_tuples=True)
        self.assertTrue(lua.eval(b"function(s) return assert(loadstring(s)) ~= nil end")(expanded))
        self.assertEqual(582, expanded.count(b"type=0,id=508,count=1,"))

    def test_frontend_item_and_pack_copy_match_server(self):
        from patch_guild_quest_config import read_cbp, read_pack
        client = ROOT / "web/v2/lang/zh-cn"
        pack = dict(read_pack((client / "zh-cn.dat").read_bytes()))
        found = []
        for path in client.glob("stditems*.cbp"):
            self.assertEqual(path.read_bytes(), pack[path.name], path.name)
            _, tree = read_cbp(path.read_bytes())
            for node in tree.children:
                if any(c.name == "id" and int(c.number()) == 508 for c in node.children):
                    found.append(node)
        self.assertTrue(found)
        for item in found:
            self.assertEqual("金砖(绑金)", item.child("name").value.decode("utf-8"))
            self.assertIn(b"600,000", item.child("desc").value)
            self.assertEqual(200, item.child("dup").number())
            self.assertEqual(102, item.child("type").number())
        normal = (ROOT / "Server/S1001/data/config/item/NormalItemDatas.lua").read_bytes()
        self.assertRegex(normal, rb"item_id\s*=\s*508,\s*value\s*=\s*600000")
        _, monster = read_cbp((client / "monster.cbp").read_bytes())
        self.assertEqual((client / "monster.cbp").read_bytes(), pack["monster.cbp"])
        self.assertTrue(all({c.name for c in node.children} ==
                            {"level", "name", "modelid", "entityid", "monsterType"}
                            for node in monster.children))


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--lua-path", type=Path)
    parser.add_argument("--baseline-ref", default=BASELINE)
    args = parser.parse_args()
    BASELINE = args.baseline_ref
    if args.lua_path:
        sys.path.insert(0, str(args.lua_path))
    from lupa.lua51 import LuaRuntime
    unittest.main(argv=[sys.argv[0]], verbosity=2)
