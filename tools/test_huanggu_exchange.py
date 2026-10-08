"""Verify the real NPC exchange, shared Boss rewards and native drop groups."""
from pathlib import Path
import re
import sys
import unittest

sys.path.insert(0, str(Path.home() / "AppData/Local/Temp/codex-lupa"))
from lupa.lua51 import LuaRuntime
from compile_boss_drop_lua import DATA, expand

NPC = DATA / "functions/NpcMiscFun/SanRenNPC/MapNpc/GaoJiDuanZaoShi.lua"
CFG = DATA / "config/monster/HuangGuRewardCfg.lua"
SETUP = '''
LocalDT={}; Item={ipItemType=1}; Actor={}; System={};
LogIds={HuangGuBossDrop=2823}; ttFlyTip=1;
Lang={ScriptTips={mt00001='需要%d格背包空间'}};
bound=0;unbound=0;empty=100;given={};tips={};removed=0;giveFail=false;removeFail=false;
Item.getItemPropertyById=function(id) if id>=1783 and id<=1869 then return 201 end return 3 end
Item.getAddItemNeedGridCount=function(_,id,count) return id<1000 and 1 or count end
Item.getBagEmptyGridCount=function() return empty end
Item.getItemName=function() return '道具' end
get_d_val=function() return 0 end
System.getRandomNumber=function(n) return n-1 end
Actor.sendTipmsg=function(_,msg) table.insert(tips,msg) end
Actor.getItemCount=function(_,id,q,s,bind) assert(id==491); return bind==1 and bound or unbound end
Actor.removeItem=function(_,id,count,q,s,bind)
 assert(id==491);local take=removeFail and math.max(count-1,0) or count;
 if bind==1 then bound=bound-take else unbound=unbound-take end;removed=removed+take;return take
end
Actor.addItem=function(_,id,q,s,count,bind)
 assert(id==491);if bind==1 then bound=bound+count else unbound=unbound+count end;return count
end
Actor.giveAward=function(_,kind,id,count,q,s,bind)
 if giveFail then return false end;assert(kind==0 and bind==0);given[id]=(given[id] or 0)+count;return true
end
Actor.getIntProperty=function() return 1 end
System.trace=function() end
'''


def runtime():
    lua = LuaRuntime(unpack_returned_tuples=True)
    lua.execute(SETUP)
    lua.execute(expand(CFG).decode('utf-8', errors='replace'))
    lua.execute((DATA / "functions/Activity/Common/Awards.lua").read_text('utf-8-sig'))
    lua.execute(NPC.read_text('utf-8-sig'))
    lua.execute("npc=GetNpcWanShiTong(); math.random=function(a,b) return b or a end")
    return lua


class HuangGuExchangeTests(unittest.TestCase):
    def test_cost_matches_real_hidden_entry_probability_and_buttons(self):
        lua = runtime()
        entry = (DATA / 'functions/ActorEvent/NormalItem/CQUseItemFunc.lua').read_text('utf-8-sig')
        denominator = int(re.search(r'mapid = 286, jl = (\d+)', entry)[1])
        self.assertEqual(denominator, lua.globals().LocalDT.HuangGuReward.scrollCount)
        text = lua.globals().npc.main(1)
        self.assertLess(text.index('【衣服互换】'), text.index('【荒古卷轴兑换】'))
        for button in ('<1次/@onHuangGuExchange,1|消耗10张', '<10次/@onHuangGuExchange,10|消耗100张'):
            self.assertIn(button, text)

    def test_single_and_ten_rolls_and_mixed_binding_scrolls(self):
        for count in (1, 10):
            lua = runtime()
            lua.execute(f'bound=3;unbound={count*10-3};npc.onHuangGuExchange(1,"{count}")')
            g = lua.globals()
            self.assertEqual((0, 0, count*10, count*5), (g.bound, g.unbound, g.removed, g.given[552]))
            self.assertIsNone(g.given[553])
            self.assertEqual('兑换成功', g.tips[1][:4])

    def test_insufficient_scrolls_full_bag_and_invalid_arguments_do_not_charge(self):
        for setup, count in [('bound=9', '1'), ('unbound=99', '10'), ('bound=100;empty=0', '10')]:
            lua = runtime()
            lua.execute(setup+f';npc.onHuangGuExchange(1,{count})')
            self.assertEqual(0, lua.globals().removed)
            self.assertEqual([], list(lua.globals().given.items()))
        for argument in ('nil', '0', '2', '-1', '1.5', '"bad"', '10000'):
            lua = runtime()
            lua.execute(f'bound=100;npc.onHuangGuExchange(1,{argument})')
            self.assertEqual(0, lua.globals().removed)

    def test_removal_and_first_award_failure_return_original_binding(self):
        for flag in ('removeFail', 'giveFail'):
            lua = runtime()
            lua.execute(f'bound=3;unbound=7;{flag}=true;npc.onHuangGuExchange(1,1)')
            g = lua.globals()
            self.assertEqual((3, 7), (g.bound, g.unbound))
            self.assertEqual([], list(g.given.items()))

    def test_spirit_probability_boundary_and_quantity_range(self):
        for draw, expected in [(29, 2), (30, None)]:
            lua = runtime()
            lua.execute(f'System.getRandomNumber=function(n) if n==100 then return {draw} end return n-1 end;r=npc.rollHuangGuRewards(1)')
            rewards = {row.id: row.count for row in lua.globals().r.values()}
            self.assertEqual(expected, rewards.get(553))
            self.assertEqual(5, rewards[552])
        lua = runtime()
        lua.execute('math.random=function(a,b) return a end;System.getRandomNumber=function() return 0 end;r=npc.rollHuangGuRewards(10)')
        rewards = {row.id: row.count for row in lua.globals().r.values()}
        self.assertEqual((30, 10), (rewards[552], rewards[553]))
        self.assertTrue(all(row.bind == 0 for row in lua.globals().r.values()))

    def test_native_equipment_group_members_kept_and_success_stops_group(self):
        lua = runtime()
        native = lua.eval('{' + (DATA / 'config/monster/drops/drops2130.lua').read_bytes().decode('gbk', errors='replace') + '}')
        actual = lua.globals().LocalDT.HuangGuReward.equipmentDrops
        self.assertEqual([dict(row.items()) for row in native.values()], [dict(row.items()) for row in actual.values()])
        # A successful ordinary equipment roll consumes the group without awarding warrior equipment.
        lua.execute('''
LocalDT.HuangGuReward.equipmentDrops={
 {id=433,count=1,propability=1,group=1,bind=0},
 {id=1783,count=1,propability=1,group=1,bind=0}}
calls=0;System.getRandomNumber=function() calls=calls+1;return 0 end
r=npc.rollHuangGuRewards(1)
assert(#r==2 and r[1].id==552 and r[2].id==553 and calls==2)
System.getRandomNumber=function(n) if n==2 then return 1 end return 0 end
r=npc.rollHuangGuRewards(10);assert(r[3].id==1783 and r[3].count==10)
''')

    def test_boss_still_uses_same_spirit_rules_and_only_correct_scene(self):
        lua = runtime()
        source = (DATA / 'functions/MonsterFunction.lua').read_text('utf-8-sig')
        begin = source.index('function HandlerMonsterByKilled(')
        end = source.index('\nfunction HandlerMonsterByTeamMenber(', begin)
        lua.execute('''
scene=286;drops={};Actor.getSceneId=function() return scene end
Item.createItem=function(id,count,q,s,bind) return {id=id,count=count,bind=bind} end
Item.createDropItem=function(_,item) table.insert(drops,item) end
System.getRandomNumber=function() return 0 end
OnMonsterByKilled=function() end;MonDieDispatcher={CommonDieFunc=function() end}
CheckAndSetIsDropItemWhenMonsterKilled=function() return false end
LocalDT.DropZhuanShengAccessory=function() end
''')
        lua.execute(source[begin:end])
        lua.execute('HandlerMonsterByKilled(1,1,635);assert(#drops==2 and drops[1].id==552 and drops[1].count==5 and drops[2].id==553 and drops[2].count==2);drops={};scene=285;HandlerMonsterByKilled(1,1,635);assert(#drops==0);scene=286;HandlerMonsterByKilled(1,1,658);assert(#drops==0)')

    def test_lua51_merged_monster_script_and_npc_compile(self):
        lua = LuaRuntime(encoding=None, unpack_returned_tuples=True)
        for path in (NPC, DATA / 'functions/MonsterFunction.lua'):
            result = lua.eval(b'loadstring')(expand(path))
            self.assertFalse(isinstance(result, tuple), result)


if __name__ == '__main__':
    unittest.main(verbosity=2)
