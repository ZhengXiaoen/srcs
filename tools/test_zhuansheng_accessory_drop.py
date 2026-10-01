"""Verify temple fragment probabilities, boundaries, scope and client resources."""
from __future__ import annotations

import argparse
import copy
from pathlib import Path
import re
import subprocess
import sys
import unittest

ROOT = Path(__file__).resolve().parents[1]
DATA = ROOT / "Server/S1001/data"
TIERS = [
    (287, (647, 705, 696), 10, 1, 1),
    (288, (648, 706, 697), 20, 1, 1),
    (289, (649, 707, 698), 30, 1, 1),
    (290, (650, 708, 699), 40, 1, 2),
    (291, (651, 709, 700), 50, 1, 2),
    (292, (652, 710, 701), 60, 1, 2),
    (293, (653, 711, 702), 70, 2, 2),
    (294, (654, 712, 703), 80, 2, 2),
    (295, (655, 713, 704), 90, 2, 3),
    (296, (1343, 1344, 1345), 100, 2, 3),
]
IDS = {5152, 5153, 5154, 5155}
BASELINE = "451cefe"


def old(path):
    return subprocess.check_output(
        ["git", "show", BASELINE + ":" + path.relative_to(ROOT).as_posix()], cwd=ROOT)


def runtime():
    lua = LuaRuntime(encoding=None)
    lua.execute(b'''
        scene = 287; combineDays = 1; roll = 0; kind = 1; upper = false
        drops = {}; created = {}; ordinaryCalls = 0; commonCalls = 0
        failCreate = false; killerType = 0
        System = {
            getDaysSinceCombineServer = function() return combineDays end,
            getRandomNumber = function(n) assert(n == 100); return roll end
        }
        math.random = function(a, b)
            if a == 1 and b == 4 then return kind end
            return upper and b or a
        end
        Actor = {
            getSceneId = function() return scene end,
            getEntityType = function() return killerType end
        }
        Item = {
            createItem = function(id, count, strong, quality, bind)
                assert(strong == 0 and quality == 0 and bind == 1)
                if failCreate then return nil end
                local item = {id = id, count = count, bind = bind}
                table.insert(created, item); return item
            end,
            createDropItem = function(monster, item, log, reason, owner)
                assert(monster == 99 and log == 2824)
                assert(reason == 'ZhuanShengAccessory' and owner == nil)
                table.insert(drops, item)
            end
        }
        OneTimesDropMonsters = {}; MonsterForQuest = {}; ShareHitMonsterForQuest = {}
        MonDieDispatcher = {CommonDieFunc = function() commonCalls = commonCalls + 1 end}
        function OnMonsterByKilled() ordinaryCalls = ordinaryCalls + 1 end
    ''')
    lua.execute((DATA / "functions/LogIds.lua").read_bytes().removeprefix(b"\xef\xbb\xbf"))
    lua.execute((DATA / "config/monster/ZhuanShengAccessoryDropCfg.lua").read_bytes())
    lua.execute((DATA / "functions/MonsterFunction.lua").read_bytes())
    return lua


class TempleFragmentTests(unittest.TestCase):
    def test_every_boss_exact_percentage_and_kind_quantity_boundaries(self):
        lua = runtime()
        g = lua.globals()
        cfg = g[b"ZhuanShengAccessoryDropCfg"]
        self.assertEqual(sorted(IDS), list(cfg[b"items"].values()))
        self.assertEqual(10, len(list(cfg[b"tiers"].items())))
        for scene, monsters, rate, low, high in TIERS:
            tier = cfg[b"tiers"][scene]
            self.assertEqual(list(monsters), list(tier[b"monsters"].values()))
            self.assertEqual((rate, low, high), tuple(tier[k] for k in (b"rate", b"mincount", b"maxcount")))
            for monster in monsters:
                g[b"scene"] = scene
                successes = 0
                for roll in range(100):
                    g[b"roll"] = roll
                    g[b"drops"] = lua.table()
                    self.assertTrue(g[b"HandlerMonsterByKilled"](99, 1, monster, 0, scene, None))
                    self.assertEqual(int(roll < rate), len(g[b"drops"]))
                    successes += len(g[b"drops"])
                self.assertEqual(rate, successes)
                g[b"roll"] = 0
                for kind in range(1, 5):
                    g[b"kind"] = kind
                    for upper, count in ((False, low), (True, high)):
                        g[b"upper"] = upper
                        g[b"drops"] = lua.table()
                        g[b"HandlerMonsterByKilled"](99, 1, monster, 0, scene, None)
                        drop = g[b"drops"][1]
                        self.assertEqual((5151 + kind, count, 1),
                                         tuple(drop[k] for k in (b"id", b"count", b"bind")))
        self.assertEqual(g[b"ordinaryCalls"], g[b"commonCalls"])

    def test_uncombined_wrong_map_wrong_monster_and_pet_warrior(self):
        lua = runtime()
        g = lua.globals()
        for scene, monster, days, killer in (
            (287, 647, 0, 1), (287, 647, -1, 1), (296, 1343, 0, 1),
            (288, 647, 1, 1), (101, 647, 1, 1), (287, 545, 1, 1),
            (296, 656, 1, 1), (296, 657, 1, 1), (287, 647, 1, None),
        ):
            g[b"scene"], g[b"combineDays"] = scene, days
            g[b"drops"] = lua.table()
            self.assertTrue(g[b"HandlerMonsterByKilled"](99, killer, monster, 0, scene, None))
            self.assertEqual(0, len(g[b"drops"]))
        for killer_type in (0, 2, 3):
            g[b"scene"], g[b"combineDays"], g[b"killerType"] = 296, 1, killer_type
            g[b"drops"] = lua.table()
            g[b"HandlerMonsterByKilled"](99, 1, 1343, 0, 296, None)
            self.assertEqual(1, len(g[b"drops"]))
        g[b"failCreate"] = True
        g[b"drops"] = lua.table()
        self.assertTrue(g[b"HandlerMonsterByKilled"](99, 1, 1343, 0, 296, None))
        self.assertEqual(0, len(g[b"drops"]))

    def test_only_old_fragment_rows_removed_no_native_duplicates(self):
        drops = DATA / "config/monster/drops"
        names = [*(f"drops{i}.lua" for i in range(2190, 2198)), "drops2330.lua"]
        removed = 0
        for name in names:
            original = old(drops / name)
            lines = original.splitlines(keepends=True)
            def fragment(line):
                match = re.search(rb"\bid=(\d+),", line)
                return bool(match and int(match[1]) in IDS)
            self.assertEqual(4, sum(map(fragment, lines)))
            removed += sum(map(fragment, lines))
            self.assertEqual(b"".join(line for line in lines if not fragment(line)),
                             (drops / name).read_bytes())
        self.assertEqual(36, removed)
        source = DATA / "config/monster/StdMonster.txt"
        self.assertEqual(old(source), source.read_bytes())
        expected = {mid for _, mids, *_ in TIERS for mid in mids}
        references = set()
        for block in re.split(rb"\r?\n\{\r?\n", source.read_bytes())[1:]:
            mid = int(re.search(rb"entityid=(\d+)", block)[1])
            includes = re.findall(rb'drops\\([^"\r\n]+)', block)
            if any(n.decode() in names for n in includes):
                references.add(mid)
            if mid in expected:
                for name in includes:
                    self.assertFalse(re.search(rb"\bid=(?:514[0-3]|515[2-5]|6368),", (drops / name.decode()).read_bytes()))
        self.assertEqual(expected, references)

    def test_server_client_pack_descriptions_and_other_resources_unchanged(self):
        from patch_guild_quest_config import read_cbp, read_pack
        client = ROOT / "web/v2/lang/zh-cn"
        previous = read_pack(old(client / "zh-cn.dat"))
        current = read_pack((client / "zh-cn.dat").read_bytes())
        self.assertEqual([n for n, _ in previous], [n for n, _ in current])
        changed = {a[0] for a, b in zip(previous, current) if a != b}
        self.assertEqual({"stditems.cbp", "stditems3.cbp"}, changed)
        language = (DATA / "language/Zh-CN/Item.lua").read_text("utf-8")
        for name, data in current:
            if name not in changed:
                self.assertEqual(dict(previous)[name], data)
                continue
            self.assertEqual((client / name).read_bytes(), data)
            _, before = read_cbp(dict(previous)[name])
            _, after = read_cbp(data)
            expected = copy.deepcopy(before)
            for item in IDS:
                node = next(n for n in after.children if n.child("id").number() == item)
                desc = re.search(rf'i{item}="([^"\r\n]+)"', language)[1].replace("\\\\", "\\")
                self.assertEqual(desc, node.child("desc").value.decode("utf-8"))
                expected.child(node.name).child("desc").value = node.child("desc").value
                self.assertIn("合服后转生神殿天、地、暗BOSS掉落", desc)
            self.assertEqual(expected, after)

    def test_temple_entry_shows_same_config_values(self):
        lua = runtime()
        lua.execute(b'''
            PROP_ACTOR_CIRCLE = 1
            Actor.getIntProperty = function() return 1 end
            System.getDyanmicVar = function() return {} end
            Item.getItemName = function() return 'proof' end
        ''')
        lua.execute((DATA / "functions/NpcMiscFun/SanRenNPC/MapNpc/ZhuanShengDiGong.lua").read_bytes().removeprefix(b"\xef\xbb\xbf"))
        text = lua.globals()[b"GetNpcZhuanShengDiGong"]()[b"main"](1).decode("utf-8")
        for _, _, rate, low, high in TIERS:
            count = str(low) if low == high else f"{low}-{high}"
            self.assertIn(f"碎片掉率 {rate}%，每次 {count} 个", text)


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
