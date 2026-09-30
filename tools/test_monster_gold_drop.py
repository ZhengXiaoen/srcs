"""Audit removed monster gold and the one-brick-per-BOSS replacement.

Use --lua-path for an isolated lupa installation. No live game process is used.
"""
from __future__ import annotations

import argparse
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
BASELINE = "d5a72c8"


def old(path):
    return subprocess.check_output(
        ["git", "show", BASELINE + ":" + path.as_posix()], cwd=ROOT)


def fields(line):
    return {k.decode(): int(v) for k, v in re.findall(rb"(\w+)=(-?\d+)", line)}


def blocks(data):
    return {int(re.search(rb"entityid=(\d+)", block)[1]): block
            for block in re.split(rb"\r?\n\{\r?\n", data)[1:]}


class MonsterGoldDropTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
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

    def test_all_gold_removed_and_other_drop_bytes_unchanged(self):
        changed = removed = 0
        for path, original in self.original_drops.items():
            wanted = b"".join(line for line in original.splitlines(keepends=True)
                              if not GOLD.match(line))
            self.assertEqual(wanted, (ROOT / path).read_bytes(), path)
            if wanted != original:
                changed += 1
                removed += sum(bool(GOLD.match(line)) for line in original.splitlines())
        self.assertEqual((162, 265), (changed, removed))
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
            self.assertEqual(self.originals[mid], BRICK_INCLUDE.sub(b"", block), mid)
        self.assertEqual(self.original_monsters,
                         BRICK_INCLUDE.sub(b"", (ROOT / MONSTERS).read_bytes()))
        self.assertEqual(5, sum(bool(v) for v in self.expected.values()))

    def test_gold_brick_is_guaranteed_unbound_item_and_keeps_protection(self):
        for filename, loot in (("dropsBossGoldBrick.lua", 0),
                               ("dropsBossGoldBrickProtected.lua", 10)):
            rows = [fields(line) for line in (ROOT / BASE / "drops" / filename).read_bytes().splitlines()
                    if line.startswith(b"{type=")]
            self.assertEqual(1, len(rows))
            self.assertEqual({"type": 0, "id": 83, "count": 1, "propability": 1,
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
        self.assertEqual(582, expanded.count(b"type=0,id=83,count=1,"))

    def test_frontend_item_and_pack_copy_match_server(self):
        from patch_guild_quest_config import read_cbp, read_pack
        client = ROOT / "web/v2/lang/zh-cn"
        pack = dict(read_pack((client / "zh-cn.dat").read_bytes()))
        found = []
        for path in client.glob("stditems*.cbp"):
            self.assertEqual(path.read_bytes(), pack[path.name], path.name)
            _, tree = read_cbp(path.read_bytes())
            for node in tree.children:
                if any(c.name == "id" and int(c.number()) == 83 for c in node.children):
                    found.append(node)
        self.assertTrue(found)
        for item in found:
            self.assertEqual("金砖", item.child("name").value.decode("utf-8"))
            self.assertIn(b"600,000", item.child("desc").value)
            self.assertEqual(200, item.child("dup").number())
            self.assertEqual(102, item.child("type").number())
        normal = (ROOT / "Server/S1001/data/config/item/NormalItemDatas.lua").read_bytes()
        self.assertRegex(normal, rb"item_id\s*=\s*83,\s*value\s*=\s*600000")
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
