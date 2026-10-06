"""Verify independent temple fragment/finished drops, scope and client resources."""
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
FINISHED_IDS = {5140, 5141, 5142, 5143}
FINISHED_RATES = {293: 5, 294: 7, 295: 11, 296: 15}
FINISHED_BASELINE = "c8dbcbb"
TEXT_BASELINE = "c77e197"
BASELINE = "451cefe"


def old(path):
    return subprocess.check_output(
        ["git", "show", BASELINE + ":" + path.relative_to(ROOT).as_posix()], cwd=ROOT)


def runtime():
    lua = LuaRuntime(encoding=None)
    lua.execute(b'''
        scene = 287; combineDays = 1; roll = 0; kind = 1; upper = false
        finishedRoll = 99; randomCalls = 0
        drops = {}; created = {}; ordinaryCalls = 0; commonCalls = 0
        failCreate = false; killerType = 0
        System = {
            getDaysSinceCombineServer = function() error('temple drops must not depend on merging') end,
            getRandomNumber = function(n)
                assert(n == 100); randomCalls = randomCalls + 1
                return randomCalls == 1 and roll or finishedRoll
            end
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
    lua.execute(b'''
        originalHandler = HandlerMonsterByKilled
        HandlerMonsterByKilled = function(...)
            randomCalls = 0
            return originalHandler(...)
        end
    ''')
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

    def test_uncombined_server_wrong_map_wrong_monster_and_pet_warrior(self):
        lua = runtime()
        g = lua.globals()
        for scene, monster, days, killer in (
            (288, 647, 1, 1), (101, 647, 1, 1), (287, 545, 1, 1),
            (296, 656, 1, 1), (296, 657, 1, 1), (287, 647, 1, None),
        ):
            g[b"scene"], g[b"combineDays"] = scene, days
            g[b"drops"] = lua.table()
            self.assertTrue(g[b"HandlerMonsterByKilled"](99, killer, monster, 0, scene, None))
            self.assertEqual(0, len(g[b"drops"]))
        for scene, monsters, rate, low, high in TIERS:
            for monster in monsters:
                for days in (0, 1):
                    g[b"scene"], g[b"combineDays"] = scene, days
                    g[b"drops"] = lua.table()
                    g[b"HandlerMonsterByKilled"](99, 1, monster, 0, scene, None)
                    self.assertEqual(1, len(g[b"drops"]))
        for monster in (1343, 1344, 1345):
            g[b"scene"], g[b"combineDays"] = 296, 0
            for upper, count in ((False, 2), (True, 3)):
                g[b"upper"] = upper
                for roll in range(100):
                    g[b"roll"] = roll
                    g[b"drops"] = lua.table()
                    g[b"HandlerMonsterByKilled"](99, 1, monster, 0, 296, None)
                    self.assertEqual(1, len(g[b"drops"]))
                    self.assertEqual(count, g[b"drops"][1][b"count"])
        g[b"roll"] = 0
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
        from patch_yuangu_store import PRODUCTS
        client = ROOT / "web/v2/lang/zh-cn"
        previous = read_pack(subprocess.check_output(
            ["git", "show", TEXT_BASELINE + ":web/v2/lang/zh-cn/zh-cn.dat"], cwd=ROOT))
        current = read_pack((client / "zh-cn.dat").read_bytes())
        self.assertEqual([n for n, _ in previous], [n for n, _ in current])
        changed = {a[0] for a, b in zip(previous, current) if a != b}
        item_ids = {
            "stditems.cbp": IDS | FINISHED_IDS | {491},
            "stditems1.cbp": {491},
            "stditems3.cbp": IDS | FINISHED_IDS,
            "stditems4.cbp": {item for item, _ in PRODUCTS},
        }
        task_text = {
            "LivenessActivityCfg.cbp": (("livenessTask", "1", "tips"),
                                        "每次完成[每日首充]任务都可获得<25点>活跃奖励!"),
            "brotherQingMiDuTask.cbp": (("2", "0", "txt"), "每日首冲"),
        }
        self.assertEqual(set(item_ids) | set(task_text), changed)
        language = (DATA / "language/Zh-CN/Item.lua").read_text("utf-8")
        original_language = subprocess.check_output(
            ["git", "show", "1ebaf28^:Server/S1001/data/language/Zh-CN/Item.lua"], cwd=ROOT).decode("utf-8-sig")
        for name, data in current:
            if name not in changed:
                self.assertEqual(dict(previous)[name], data)
                continue
            self.assertEqual((client / name).read_bytes(), data)
            _, before = read_cbp(dict(previous)[name])
            _, after = read_cbp(data)
            expected = copy.deepcopy(before)
            if name in task_text:
                path, text = task_text[name]
                node = expected
                for key in path:
                    node = node.child(key)
                node.value = text.encode("utf-8")
                self.assertEqual(expected, after)
                continue
            modified = {int(node.child("id").number()) for node in after.children
                        if node != before.child(node.name)}
            self.assertEqual(item_ids[name], modified)
            for item in item_ids[name]:
                node = next(n for n in after.children if n.child("id").number() == item)
                desc = re.search(rf'i{item}="([^"\r\n]+)"', language)[1].replace("\\\\", "\\")
                self.assertEqual(desc, node.child("desc").value.decode("utf-8"))
                expected.child(node.name).child("desc").value = node.child("desc").value
                self.assertNotIn("掉率", desc)
                self.assertNotIn("远古积分商城", desc)
                if item in IDS:
                    original_desc = re.search(rf'i{item}="([^"\r\n]+)"', original_language)[1].replace("\\\\", "\\")
                    self.assertEqual(original_desc, desc)
                if item in FINISHED_IDS:
                    self.assertIn("[主宰饰品]", desc)
                    self.assertIn("锻造-合成", desc)
                    self.assertIn("最高可获得10级锤炼属性", desc)
                    self.assertNotIn("只在合服后", desc)
                if item == 491:
                    self.assertNotIn("灵力丹", desc)
            self.assertEqual(expected, after)

    def test_finished_drops_every_boss_exact_percent_four_items_and_one_bound_item(self):
        lua = runtime()
        g = lua.globals()
        self.assertEqual(sorted(FINISHED_IDS), list(g[b"ZhuanShengAccessoryDropCfg"][b"finishedItems"].values()))
        for scene, monsters, *_ in TIERS:
            g[b"scene"] = scene
            rate = FINISHED_RATES.get(scene, 0)
            self.assertEqual(rate or None, g[b"ZhuanShengAccessoryDropCfg"][b"tiers"][scene][b"finishedRate"])
            for monster in monsters:
                successes = 0
                g[b"roll"] = 99
                for value in range(100):
                    g[b"finishedRoll"] = value
                    g[b"drops"] = lua.table()
                    g[b"HandlerMonsterByKilled"](99, 1, monster, 0, scene, None)
                    finished = [drop for drop in g[b"drops"].values() if drop[b"id"] in FINISHED_IDS]
                    self.assertEqual(int(value < rate), len(finished))
                    successes += len(finished)
                self.assertEqual(rate, successes)
                if not rate:
                    continue
                g[b"finishedRoll"] = 0
                for kind in range(1, 5):
                    g[b"kind"] = kind
                    for upper in (False, True):
                        g[b"upper"] = upper
                        g[b"drops"] = lua.table()
                        g[b"HandlerMonsterByKilled"](99, 1, monster, 0, scene, None)
                        finished = [drop for drop in g[b"drops"].values() if drop[b"id"] in FINISHED_IDS]
                        self.assertEqual([(5139 + kind, 1, 1)],
                                         [tuple(drop[key] for key in (b"id", b"count", b"bind")) for drop in finished])

    def test_fragment_and_finished_rolls_are_independent_and_survive_failed_item_creation(self):
        lua = runtime()
        g = lua.globals()
        for scene, monsters, rate, *_ in TIERS:
            if scene not in FINISHED_RATES:
                continue
            g[b"scene"] = scene
            for fragment_roll in range(100):
                for finished_roll in range(100):
                    g[b"roll"], g[b"finishedRoll"] = fragment_roll, finished_roll
                    g[b"drops"] = lua.table()
                    g[b"HandlerMonsterByKilled"](99, 1, monsters[0], 0, scene, None)
                    drops = list(g[b"drops"].values())
                    self.assertEqual(int(fragment_roll < rate), sum(drop[b"id"] in IDS for drop in drops))
                    self.assertEqual(int(finished_roll < FINISHED_RATES[scene]), sum(drop[b"id"] in FINISHED_IDS for drop in drops))
        lua.execute(b'''
            scene = 293; roll = 0; finishedRoll = 0; drops = {}
            create = Item.createItem
            Item.createItem = function(id, ...)
                if id >= 5152 and id <= 5155 then return nil end
                return create(id, ...)
            end
            HandlerMonsterByKilled(99, 1, 653, 0, 293, nil)
        ''')
        self.assertEqual(1, len(g[b"drops"]))
        self.assertIn(g[b"drops"][1][b"id"], FINISHED_IDS)

    def test_finished_drops_respect_map_boss_killer_scope_and_have_no_merge_requirement(self):
        lua = runtime()
        g = lua.globals()
        g[b"finishedRoll"] = 0
        for scene, monster, killer in ((101, 653, 1), (293, 647, 1), (294, 653, 1),
                                       (296, 656, 1), (296, 1343, None)):
            g[b"scene"] = scene
            g[b"drops"] = lua.table()
            g[b"HandlerMonsterByKilled"](99, killer, monster, 0, scene, None)
            self.assertEqual(0, len(g[b"drops"]))
        for scene, monsters, *_ in TIERS:
            if scene not in FINISHED_RATES:
                continue
            g[b"scene"], g[b"roll"] = scene, 99
            for monster in monsters:
                for killer_type in (0, 2, 3):
                    g[b"killerType"], g[b"combineDays"] = killer_type, 0
                    g[b"drops"] = lua.table()
                    g[b"HandlerMonsterByKilled"](99, 1, monster, 0, scene, None)
                    self.assertEqual(1, sum(drop[b"id"] in FINISHED_IDS for drop in g[b"drops"].values()))

    def test_changed_scripts_compile_together_without_new_outer_locals(self):
        lua = runtime()
        files = ("config/monster/ZhuanShengAccessoryDropCfg.lua", "functions/MonsterFunction.lua",
                 "functions/NpcMiscFun/SanRenNPC/MapNpc/ZhuanShengDiGong.lua")
        sources = []
        for relative in files:
            source = (DATA / relative).read_bytes().removeprefix(b"\xef\xbb\xbf")
            baseline = subprocess.check_output(["git", "show", FINISHED_BASELINE + ":Server/S1001/data/" + relative], cwd=ROOT)
            self.assertEqual(re.findall(rb"(?m)^local .*$", baseline), re.findall(rb"(?m)^local .*$", source))
            sources.append(source)
        self.assertTrue(lua.eval(b"function(s) return assert(loadstring(s)) ~= nil end")(b"\n".join(sources)))

    def test_temple_entry_keeps_entry_cost_and_refresh_time_without_drop_text(self):
        lua = runtime()
        lua.execute(b'''
            PROP_ACTOR_CIRCLE = 1
            Actor.getIntProperty = function() return 1 end
            System.getDyanmicVar = function() return {} end
            Item.getItemName = function() return 'proof' end
        ''')
        lua.execute((DATA / "functions/NpcMiscFun/SanRenNPC/MapNpc/ZhuanShengDiGong.lua").read_bytes().removeprefix(b"\xef\xbb\xbf"))
        text = lua.globals()[b"GetNpcZhuanShengDiGong"]()[b"main"](1).decode("utf-8")
        self.assertNotIn("主宰", text)
        self.assertNotIn("掉率", text)
        self.assertEqual(10, text.count("/@EnterScene,"))
        self.assertEqual(10, text.count("刷新时间"))
        self.assertIn("进入需要 1 张 proof#刷新时间 120 分钟", text)
        self.assertIn("进入需要 40 张 proof#刷新时间 480 分钟", text)


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
