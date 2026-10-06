"""Audit equipment-derived tiers and exercise actual stone drops in Lua 5.1."""
from __future__ import annotations

import argparse
from pathlib import Path
import re
import subprocess
import sys
import unittest

import test_boss_material_drop as material
from patch_boss_temper_stone import BASE, CONFIG, ROOT, config_bytes, derive_tiers, stone_row

BASELINE = "4b74c90"


class BossTemperStoneTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.tiers, _, _ = derive_tiers()

    def runtime(self, original_materials=False):
        lua = material.BossMaterialDropTests().runtime()
        lua.execute(CONFIG.read_bytes())
        lua.execute("""
chanceRoll=0
originalRandom=System.getRandomNumber
System.getRandomNumber=function(n)
 local value=originalRandom(n)
 return n==10000 and chanceRoll or value
end
""")
        if not original_materials:
            lua.execute("LocalDT.BossMaterialDropMonsters={}")
        return lua

    def test_configuration_matches_actual_equipment_not_boss_name_or_preview(self):
        self.assertEqual(config_bytes(self.tiers), CONFIG.read_bytes())
        self.assertEqual(540, len(self.tiers))
        self.assertEqual(13, max(self.tiers.values()))
        self.assertEqual({715: 2, 737: 2, 755: 1, 765: 3, 1343: 13, 1344: 12, 1345: 12},
                         {mid: self.tiers[mid] for mid in (715,737,755,765,1343,1344,1345)})
        self.assertNotIn(545, self.tiers)  # Normal monster sharing a BOSS equipment template.
        self.assertNotIn(750, self.tiers)  # Low-tier personal BOSS.

    def test_every_boss_every_possible_quantity_single_bound_stack(self):
        lua = self.runtime()
        for mid, tier in self.tiers.items():
            low, high = 1, 3
            for value in range(high-low+1):
                lua.execute(f"randomValue={value};drops={{}};messages={{}};draws=0;drop({{}},{{}},{mid})")
                rows = list(lua.globals().drops.values())
                expected = low+value
                self.assertEqual(int(expected > 0), len(rows), mid)
                self.assertEqual(2, lua.globals().draws)
                self.assertEqual(int(expected > 0), len(lua.globals().messages))
                if expected == 0:
                    self.assertEqual(0, lua.globals().errors)
                    continue
                item = rows[0]
                self.assertEqual((5648,1,expected), (item.id,item.bind,item.count), mid)
                self.assertIn(f" x{expected}", lua.globals().messages[1].msg)

    def test_probability_threshold_every_roll_and_future_tier_cap(self):
        lua = self.runtime()
        for tier in (*range(1,14),30):
            expected = 500+(min(tier,13)-1)*125
            lua.execute(f"LocalDT.BossTemperStoneDrop.monsters[999999]={tier}")
            lua.execute(f"""
successes=0
for roll=0,9999 do
 chanceRoll=roll;drops={{}};messages={{}};draws=0
 drop({{}},{{}},999999)
 if roll<{expected} then
  assert(#drops==1 and drops[1].id==5648 and drops[1].count==1)
  assert(draws==2 and #messages==1)
  successes=successes+1
 else
  assert(#drops==0 and draws==1 and #messages==0 and errors==0 and released==0)
 end
end
""")
            self.assertEqual(expected,lua.globals().successes,tier)

    def test_every_boss_probability_success_and_failure_boundaries(self):
        lua = self.runtime()
        for mid,tier in self.tiers.items():
            rate=500+(tier-1)*125
            for roll,expected in ((rate-1,1),(rate,0)):
                lua.execute(f"chanceRoll={roll};drops={{}};messages={{}};drop({{}},{{}},{mid})")
                self.assertEqual(expected,len(lua.globals().drops),mid)
                self.assertEqual(expected,len(lua.globals().messages),mid)

    def test_player_pet_hero_and_one_time_guard(self):
        for kind in (0,2,3):
            lua = self.runtime()
            lua.execute(f"randomValue=2;HandlerMonsterByKilled({{}},{{kind={kind}}},1343,0,0,nil)")
            self.assertEqual(3,lua.globals().drops[1].count)
        lua = self.runtime()
        lua.execute("randomValue=1;OneTimesDropMonsters[755]=true;actor={};monster={}")
        self.assertTrue(lua.execute("return HandlerMonsterByKilled(monster,actor,755,0,0,nil)"))
        self.assertFalse(lua.execute("return HandlerMonsterByKilled(monster,actor,755,0,0,nil)"))
        self.assertEqual(1,len(lua.globals().drops))

    def test_unknown_normal_low_tier_and_nil_never_drop_stones(self):
        lua = self.runtime()
        lua.execute("drop({}, {}, 545);drop({}, {}, 750);drop({}, {}, 999999);drop({},nil,755);drop(nil,{},755)")
        self.assertEqual(0,len(lua.globals().drops))

    def test_creation_failure_releases_pointer_and_does_not_broadcast(self):
        for flag, released in (("failCreate",0),("failDrop",1)):
            lua = self.runtime()
            lua.execute(f"{flag}=true;drop({{}},{{}},1343)")
            self.assertEqual(0,len(lua.globals().drops))
            self.assertEqual(0,lua.globals().broadcasts)
            self.assertEqual(released,lua.globals().released)
            self.assertEqual(1,lua.globals().errors)

    def test_unrelated_materials_and_random_sequence_preserved(self):
        for mid in self.tiers:
            base = material.BossMaterialDropTests().runtime()
            changed = self.runtime(original_materials=True)
            for lua in (base,changed):
                lua.execute("sequence=0;System.getRandomNumber=function(n) sequence=sequence+1;if n==10000 then return 0 end;return sequence%n end")
                lua.execute(f"drop({{}},{{}},{mid})")
            original = material.BossMaterialDropTests().actual(base)
            current = material.BossMaterialDropTests().actual(changed)
            current.pop((5648,1),None)
            self.assertEqual(original,current,mid)
            self.assertEqual(base.globals().sequence+2, changed.globals().sequence,mid)

    def test_native_stone_rows_removed_and_every_other_byte_preserved(self):
        removed = 0
        for name in [*(f"drops{i}.lua" for i in range(2190,2198)), "drops2330.lua"]:
            path = BASE / "drops" / name
            original = subprocess.check_output(["git","show",BASELINE+":"+path.relative_to(ROOT).as_posix()],cwd=ROOT)
            removed += sum(stone_row(line) for line in original.splitlines())
            self.assertEqual(b"".join(line for line in original.splitlines(keepends=True) if not stone_row(line)),path.read_bytes())
        self.assertEqual(9,removed)
        for path in (BASE / "drops").glob("*.lua"):
            self.assertFalse(any(stone_row(line) for line in path.read_bytes().splitlines()),path)

    def test_combined_scripts_compile_without_new_outer_locals(self):
        path = ROOT / material.FUNCTION
        original = subprocess.check_output(["git","show",BASELINE+":"+material.FUNCTION],cwd=ROOT)
        current = path.read_bytes()
        self.assertEqual(re.findall(rb"(?m)^local .*",original),re.findall(rb"(?m)^local .*",current))
        combined = b"\n".join([material.source(material.CONFIG),CONFIG.read_bytes(),current])
        lua = material.LuaRuntime(encoding=None)
        self.assertTrue(lua.eval(b"function(s) return assert(loadstring(s))~=nil end")(combined))

    def test_frontend_stone_id_name_icon_stack_and_pack_copy(self):
        from patch_box_stacking import server_items
        from patch_guild_quest_config import read_cbp,read_pack
        server=server_items((ROOT/"Server/S1001/data/config/item/StdItems.txt").read_bytes())[5648]
        client=ROOT/"web/v2/lang/zh-cn"
        packed=dict(read_pack((client/"zh-cn.dat").read_bytes()))
        found=[]
        for path in client.glob("stditems*.cbp"):
            self.assertEqual(path.read_bytes(),packed[path.name])
            for row in read_cbp(path.read_bytes())[1].children:
                if row.child("id").number()==5648:
                    found.append(row)
        self.assertTrue(found)
        for row in found:
            self.assertEqual("锤炼石",row.child("name").value.decode("utf-8"))
            for field in ("type","icon","dup"):
                self.assertEqual(int(re.search(fr"(?m)^  {field}=(\d+),".encode(),server)[1]),row.child(field).number())


if __name__ == "__main__":
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--lua-path",type=Path)
    args=parser.parse_args()
    if args.lua_path:sys.path.insert(0,str(args.lua_path))
    from lupa.lua51 import LuaRuntime
    material.LuaRuntime=LuaRuntime
    unittest.main(argv=[sys.argv[0]],verbosity=2)
