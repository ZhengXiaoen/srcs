"""Exercise Chiyou stone contributions with the actual Lua 5.1 NPC handlers."""
import argparse
from pathlib import Path
import sys
import unittest

ROOT = Path(__file__).resolve().parents[1]
SCRIPT = ROOT / "Server/S1001/data/functions/NpcMiscFun/SanRenNPC/MapNpc/MoFaJieZhen.lua"


class ChiyouFillTests(unittest.TestCase):
    def runtime(self, layer=0, stones=0, daily=None, bound=0):
        lua = LuaRuntime(unpack_returned_tuples=True)
        lua.execute('''
LocalDT={};NpcDialog={};svar={};player={days={}}
stones=0;bound=0;removed=0;money=0;bosses=0;entered=0;logs={};tips={};broadcasts={}
LogIds={chiyoujiezhen=1,MoFaJieZhen=2};PROP_ENTITY_ID=1
mtYuanbao=3;ttFlyTip=16;ttChatWindow=128
Actor={
 getItemCount=function(_,id) assert(id==5581);return stones+bound end,
 removeItem=function(_,id,count,q,s,b,label,log)
  assert(id==5581 and count>0 and count<=stones+bound)
  assert(q==-1 and s==-1 and b==-1 and log==2)
  if failRemove then return 0 end
  count=math.min(count,removeLimit or count)
  local take=math.min(count,stones);stones=stones-take;bound=bound-(count-take)
  removed=removed+count;return count
 end,
 changeMoney=function(_,kind,value,log) assert(kind==3 and log==2);money=money+value end,
 getStaticVar=function() return player end,
 getIntProperty=function() return 100 end,
 getName=function() return 'tester' end,
 sendTipmsg=function(_,tip) table.insert(tips,tip) end,
 enterScene=function(_,id,x,y) assert(id==632 and x==-1 and y==-1);entered=entered+1 end,
 getEntityPosition=function() return 93,86 end,
}
System={
 getStaticVar=function() return svar end,
 sendCommonLog=function(...) table.insert(logs,{...}) end,
 broadcastTipmsg=function(msg,kind) table.insert(broadcasts,{msg,kind}) end,
}
Fuben={
 getSceneHandleById=function(id,fuben) assert(id==10 and fuben==0);return 10 end,
 createMonster=function(scene,id,x,y,kind)
  assert(scene==10 and id==1043 and x==93 and y==86 and kind==0)
  assert(removed>0);bosses=bosses+1;return 1
 end,
}
''')
        lua.execute(SCRIPT.read_text(encoding="utf-8-sig"))
        g = lua.globals()
        g.svar.allGlodStore = layer
        g.stones, g.bound = stones, bound
        g.player.days.MFJZtime = daily
        return lua

    def contribute(self, lua, fill=True):
        return lua.globals().NpcDialog[394][
            "onFillShenShiFunc" if fill else "onGiveShenShiFunc"](1)

    def test_fill_stops_at_first_boss_and_preserves_extra_stones(self):
        lua = self.runtime(layer=94, stones=100, daily=7)
        dialog = self.contribute(lua)
        g = lua.globals()
        self.assertEqual((5, 95, 0, 1, 1500, 12),
                         (g.removed, g.stones, g.svar.allGlodStore, g.bosses,
                          g.money, g.player.days.MFJZtime))
        self.assertIn("0 层", dialog)
        self.assertIn("1500元宝", g.tips[1])
        self.assertIn("1500元宝", g.broadcasts[2][1])
        g.NpcDialog[394].onEnterMapFunc(1)
        self.assertEqual(1, g.entered)

    def test_insufficient_stones_uses_every_owned_stone_without_boss(self):
        lua = self.runtime(layer=30, stones=6, daily=2)
        self.contribute(lua)
        g = lua.globals()
        self.assertEqual((6, 0, 36, 0, 1800, 8),
                         (g.removed, g.stones, g.svar.allGlodStore, g.bosses,
                          g.money, g.player.days.MFJZtime))
        g.NpcDialog[394].onEnterMapFunc(1)
        self.assertEqual(0, g.entered)
        self.contribute(lua)
        self.assertEqual((6, 1800), (g.removed, g.money))

    def test_bound_and_unbound_stacks_are_both_available(self):
        lua = self.runtime(layer=90, stones=2, bound=3)
        self.contribute(lua)
        g = lua.globals()
        self.assertEqual((0, 0, 5, 95, 1500, 5),
                         (g.stones, g.bound, g.removed, g.svar.allGlodStore,
                          g.money, g.player.days.MFJZtime))

    def test_full_empty_array_and_last_stone_boundaries(self):
        for layer, stones in ((0, 99), (0, 1000), (98, 1), (98, 2)):
            with self.subTest(layer=layer, stones=stones):
                lua = self.runtime(layer=layer, stones=stones)
                self.contribute(lua)
                g = lua.globals()
                used = 99-layer
                self.assertEqual((used, stones-used, 0, 1, used*300, used),
                                 (g.removed, g.stones, g.svar.allGlodStore,
                                  g.bosses, g.money, g.player.days.MFJZtime))

    def test_single_contribution_remains_one_stone(self):
        for layer, boss in ((12, 0), (98, 1)):
            lua = self.runtime(layer=layer, stones=100, daily=4)
            self.contribute(lua, fill=False)
            g = lua.globals()
            self.assertEqual((1, 99, boss, 300, 5),
                             (g.removed, g.stones, g.bosses, g.money, g.player.days.MFJZtime))
            self.assertEqual(0 if boss else layer+1, g.svar.allGlodStore)

    def test_no_stones_and_failed_removal_do_not_advance_or_reward(self):
        for fill in (True, False):
            for stones, fail in ((0, False), (10, True)):
                lua = self.runtime(layer=94, stones=stones, daily=2)
                g = lua.globals();g.failRemove = fail
                self.contribute(lua, fill=fill)
                self.assertEqual((0, stones, 94, 0, 0, 2),
                                 (g.removed, g.stones, g.svar.allGlodStore,
                                  g.bosses, g.money, g.player.days.MFJZtime))
                self.assertIn("魔法神石不足", g.tips[1])
                self.assertEqual((0, 0), (len(g.logs), len(g.broadcasts)))

    def test_partial_removal_rewards_only_the_actual_consumed_quantity(self):
        lua = self.runtime(layer=94, stones=100)
        g = lua.globals();g.removeLimit = 3
        self.contribute(lua)
        self.assertEqual((3, 97, 97, 0, 900, 3),
                         (g.removed, g.stones, g.svar.allGlodStore,
                          g.bosses, g.money, g.player.days.MFJZtime))

    def test_fill_reads_latest_shared_layer_and_initializes_missing_state(self):
        lua = self.runtime(stones=100)
        g = lua.globals();g.svar.allGlodStore = None
        dialog = g.NpcDialog[394].main(1)
        self.assertEqual(0, g.svar.allGlodStore)
        self.assertLess(dialog.index("<投入神石/"), dialog.index("<一键填满/"))
        self.assertLess(dialog.index("<一键填满/"), dialog.index("<#BN蚩尤地宫/"))
        self.assertIn("\n\t<一键填满/@onFillShenShiFunc>", dialog)
        g.svar.allGlodStore = 98  # Another player contributes after the dialog opens.
        self.contribute(lua)
        self.assertEqual((1, 99, 1), (g.removed, g.stones, g.bosses))


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--lua-path", type=Path)
    args = parser.parse_args()
    if args.lua_path:
        sys.path.insert(0, str(args.lua_path))
    from lupa.lua51 import LuaRuntime
    unittest.main(argv=[sys.argv[0]], verbosity=2)
