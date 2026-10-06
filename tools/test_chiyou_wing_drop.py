"""Audit Chiyou drop scope, real NPC/BOSS previews and client resource changes."""
import argparse
import copy
from pathlib import Path
import re
import subprocess
import sys
import unittest

from patch_chiyou_wing_descriptions import ITEMS, patch_descriptions
from patch_guild_quest_config import read_cbp
from patch_daily_recharge_client import read_pack, write_pack


ROOT = Path(__file__).resolve().parents[1]
DATA = ROOT / "Server/S1001/data"
BASELINE = "75239d99aed878b51035c5720cea83c567e1c243"
MONSTERS = set(range(1279, 1288))
INCLUDE = b'--#include "drops\\dropsChiyouWing.lua"\r\n'


def old(path):
    return subprocess.check_output(
        ["git", "show", BASELINE + ":" + path.relative_to(ROOT).as_posix()], cwd=ROOT)


def monster_blocks(source):
    return {int(re.search(rb"entityid=(\d+)", block)[1]): block
            for block in re.split(rb"\r?\n\{\r?\n", source)[1:]
            if re.search(rb"entityid=(\d+)", block)}


class ChiyouWingTests(unittest.TestCase):
    def test_actual_monster_drops_match_mount_probability_and_only_chiyou_bosses(self):
        path = DATA / "config/monster/StdMonster.txt"
        source = path.read_bytes()
        self.assertEqual(old(path), source.replace(INCLUDE, b""))
        blocks = monster_blocks(source)
        self.assertEqual(MONSTERS, {item for item, block in blocks.items() if INCLUDE in block})
        lua = LuaRuntime(encoding=None)
        lua.execute(b"Lang={EntityName={},SceneName={}}")
        drop_root = DATA / "config/monster/drops"
        reference = lua.eval(b"{" + (drop_root / "drops2375.lua").read_bytes() + b"}")

        def expand(match):
            path = DATA / "config/monster" / match[1].decode().replace("\\", "/")
            return path.read_bytes().rstrip(b"\0")

        for monster in MONSTERS:
            block = re.sub(rb'^--#include "([^"\r\n]+)"[^\r\n]*',
                           expand, blocks[monster], flags=re.M)
            config = lua.eval(b"{" + block.rstrip().removesuffix(b","))
            drops = [dict(row.items()) for row in config[b"drops"].values()
                     if row[b"id"] in ITEMS]
            self.assertEqual(list(ITEMS), [row[b"id"] for row in drops])
            for expected, actual in zip(reference.values(), drops):
                expected = dict(expected.items())
                expected[b"id"] = actual[b"id"]
                self.assertEqual(expected, actual)
                self.assertEqual((18, 1, 1, 0), tuple(actual[key] for key in
                                                      (b"propability", b"count", b"bind", b"group")))

    def test_real_map_and_individual_boss_previews_all_vocations(self):
        lua = LuaRuntime(unpack_returned_tuples=True)
        lua.execute('''
state={};vocation=1;PROP_ACTOR_VOCATION=1
System={getDyanmicVar=function() return state end,
 getMonsterNameById=function(id) return 'BOSS'..id end}
Actor={getIntProperty=function() return vocation end}
Fuben={getSceneNameById=function(id) return '地图'..id end}
ShowRightBossListInfo=function(_,kind,text) assert(kind==1);preview=text end
''')
        for path in ("config/BossListInfo/BossListInfo.lua", "config/monster/SRRefreshMonster.lua",
                     "functions/BossListInfo/BossListInfoEx.lua"):
            lua.execute((DATA / path).read_text("utf-8-sig"))
        lua.execute("ShowRightBossListInfo=function(_,kind,text) assert(kind==1);preview=text end")
        g = lua.globals()
        info = g.GetBoosListInfoForSceneName("蚩尤地宫")
        spawned = {row.monid for row in g.RefreshMonsterData.values() if row.mapid == 632}
        self.assertEqual(MONSTERS, spawned)
        for job in (1, 2, 3):
            g.vocation = job
            for monster in (None, *sorted(MONSTERS)):
                g.HandleTestBoos(1, info.args, "蚩尤地宫", monster)
                icons = [int(item) for item in re.findall(r"<\(iitem#(\d+)#1\)>", g.preview)]
                self.assertEqual(list(ITEMS), [item for item in icons if item in ITEMS])
                self.assertEqual(13, len(icons))

    def test_npc_explains_four_sources_and_keeps_entry_functionality(self):
        import test_chiyou_fill
        test_chiyou_fill.LuaRuntime = LuaRuntime
        lua = test_chiyou_fill.ChiyouFillTests().runtime(daily=10)
        npc = lua.globals().NpcDialog[394]
        text = npc.main(1)
        for name in ("凡·羽骨", "凡·羽灵", "凡·羽魂", "凡·羽翼"):
            self.assertIn(name, text)
        self.assertIn("蚩尤地宫BOSS有几率掉落翅膀装备", text)
        npc.onEnterMapFunc(1)
        self.assertEqual(1, lua.globals().entered)

    def test_language_pack_changes_only_four_descriptions_and_keeps_icons(self):
        client = ROOT / "web/v2/lang/zh-cn"
        pack_path = client / "zh-cn.dat"
        previous = read_pack(old(pack_path))
        current = read_pack(pack_path.read_bytes())
        self.assertEqual([name for name, _ in previous], [name for name, _ in current])
        changed = {name for (name, before), (_, after) in zip(previous, current) if before != after}
        self.assertEqual({"stditems4.cbp"}, changed)
        packed = dict(current)["stditems4.cbp"]
        path = client / "stditems4.cbp"
        self.assertEqual(packed, path.read_bytes())
        before_header, before = read_cbp(old(path))
        after_header, after = read_cbp(packed)
        self.assertEqual(before_header[:8] + before_header[16:], after_header[:8] + after_header[16:])
        expected = copy.deepcopy(before)
        language = (DATA / "language/Zh-CN/Item.lua").read_text("utf-8-sig")
        modified = set()
        for node in expected.children:
            item = int(node.child("id").number())
            if item in ITEMS:
                desc = re.search(rf'i{item}="([^"\r\n]+)"', language)[1].replace("\\\\", "\\")
                self.assertIn("【蚩尤地宫BOSS掉落】", desc)
                self.assertIn("【探索宝藏】", desc)
                node.child("desc").value = desc.encode("utf-8")
                modified.add(item)
        self.assertEqual(set(ITEMS), modified)
        self.assertEqual(expected, after)
        self.assertEqual(after, read_cbp(patch_descriptions(packed, language))[1])
        self.assertEqual(pack_path.read_bytes(), write_pack(current))


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--lua-path", type=Path)
    args = parser.parse_args()
    if args.lua_path:
        sys.path.insert(0, str(args.lua_path))
    from lupa.lua51 import LuaRuntime
    unittest.main(argv=[sys.argv[0]], verbosity=2)
