"""Exercise the actual GM Lua handlers without changing a running server.

Run with --lua-path tools/fixtures/pickup-test-deps for the bundled Lua 5.1.
"""
import argparse
from pathlib import Path
import re
import subprocess
import sys
import unittest

ROOT = Path(__file__).resolve().parents[1]
DATA = ROOT / "Server/S1001/data"
PLAYER = DATA / "functions/player.lua"
MATERIALS = (
    "sethufu", "setdun", "setbaoshi", "setshengzhu", "settejie",
    "setchengj", "setzsll", "setgongxun", "setdouli", "setjunhun",
    "setxinfa", "setneigong", "setyuanshen", "setzhuhun", "setlingli",
    "setlongling", "setspiritpet", "setxuelian",
)


def source(path):
    return path.read_bytes().removeprefix(b"\xef\xbb\xbf").rstrip(b"\0").decode("utf-8")


def function(text, name):
    start = text.index("function " + name + "(")
    end = re.search(r"^end\s*$", text[start:], re.M)
    return text[start:start + end.end()]


class GmCommandTests(unittest.TestCase):
    def setUp(self):
        from lupa.lua51 import LuaRuntime
        self.lua = LuaRuntime(unpack_returned_tuples=True)
        text = source(PLAYER)
        self.lua.execute("""
LocalDT={};player={entityType=0,gm=1,job=1,sex=0,guild=12,handle=99,scene={}}
var={d={[12]=123,[199]=777},godSoulValue=456,allOffLineTime=789,TreasureHuntValue=88}
svar={openSrvAward={1,2},unrelated=123};props={};messages={};added={};bottles={}
calls={};bagSpace=100;maxDura=50000;guildExists=true;mutations=0;rechargeSuccess=true
GlobalConfig={nBuyItemGetPointRate=10}
ttFlyTip,ttDialog=1,2
Actor={
 getEntityType=function(p) return p.entityType end,getGMLevel=function(p) return p.gm end,
 sendTipmsg=function(p,t) assert(p==player);table.insert(messages,t) end,
 getStaticVar=function() return var end,
 getIntProperty=function(_,key)
  if key==PROP_ACTOR_VOCATION then return player.job end
  if key==PROP_ACTOR_SEX then return player.sex end
  return props[key] or 0
 end,
 getUIntProperty=function(_,key) return props[key] or 0 end,
 setIntProperty=function(_,key,val) props[key]=val;mutations=mutations+1 end,
 setUIntProperty=function(_,key,val) props[key]=val;mutations=mutations+1 end,
 collectOperate=function() calls.collect=(calls.collect or 0)+1 end,
 setXinFaValue=function(_,n) calls.xinfa=n;mutations=mutations+1 end,
 setXinFaData=function(_,n) calls.xinfaLevel=n;mutations=mutations+1 end,
 setSoulValue=function(_,n) calls.soul=n;mutations=mutations+1 end,
 setSpiritPetExp=function(_,n) calls.pet=n;mutations=mutations+1 end,
 setXueLianValue=function(_,n) calls.blood=n;mutations=mutations+1 end,
 changeVocation=function(_,n) player.job=n;mutations=mutations+1 end,
 getGuildId=function() return player.guild end,
 getSceneHandle=function() return player.handle end,getScenePtr=function() return player.scene end,
 getSceneId=function() return 83 end,
 addItem=function(p,id,a,b,num) assert(p==player and a==0 and b==0);table.insert(added,{id=id,num=num}) end,
 changeMoney=function(p,t,n,way,comment,flag)
  assert(p==player and t==3 and way==138 and comment=='GM_PAY_MONEY' and flag==false)
  calls.recharge={t,n,way,comment,flag}
  if not rechargeSuccess then return false end
  props[PROP_ACTOR_YUANBAO]=(props[PROP_ACTOR_YUANBAO] or 0)+n
  props[PROP_ACTOR_DRAW_YB_COUNT]=(props[PROP_ACTOR_DRAW_YB_COUNT] or 0)+n
  props[PROP_ACTOR_STOREPOINT]=(props[PROP_ACTOR_STOREPOINT] or 0)+n*GlobalConfig.nBuyItemGetPointRate
  props[PROP_ACTOR_VIP_POINT]=(props[PROP_ACTOR_VIP_POINT] or 0)+n
  return true
 end,
}
System={getStaticVar=function() return svar end,saveStaticVar=function() calls.save=(calls.save or 0)+1 end,
 getDaysSinceOpenServer=function() return 5 end,getDaysSinceCombineServer=function() return 2 end}
Guild={setFlagExp=function(id,n) calls.flag={id,n};return guildExists end}
Fuben={killAllMonsters=function(p,h,die,skip) calls.kill={p,h,die,skip};return 7 end}
Item={getBagEmptyGridCount=function() return bagSpace end,
 getBagItemCount=function() return #bottles end,getItemPtrByIndex=function(_,i) return bottles[i+1] end,
 getItemId=function(item) return item.id end,getItemProperty=function(_,item) return item.dura end,
 getItemPropertyById=function(id,prop) assert(id==5453 and prop==Item.ipItemStaticDuaMax);return maxDura end,
 getItemGuid=function(item) return item end,
 setItemDura=function(_,item,n) item.dura=n;calls.bottle=item end,
 ipItemStaticDuaMax=1,ipItemDua=2}
Dmkj={clearStore=function() calls.clear=true end}
Quest_ShuaXin=function() calls.quest=(calls.quest or 0)+1 end
SendMianJuInfo=function() calls.mianju=(calls.mianju or 0)+1 end
SendJunGuInfo=function() calls.jungu=(calls.jungu or 0)+1 end
set_d_val=function(_,k,n) var.d[k]=n end
XinFaSystemCfg={XinFaLevelUp={1,2,3,4}}
""")
        for i, name in enumerate(sorted(set(re.findall(r"\bPROP_\w+", text))), 1):
            self.lua.globals()[name] = i
        for name in (*MATERIALS, "setlevel", "whatday", "ckmapid", "killAll", "qlck2",
                     "TestChangeJob", "SetGuildFlagExp", "GiveTotal", "GmOneKeyFullAttribute",
                     "GmGiveLongTeng", "GmGiveZhiZun", "givelegion", "togglebosspay", "setbossrate"):
            self.lua.execute(function(text, name))
        self.lua.execute(function(source(DATA / "functions/EquipEnhance/JungGu.lua"), "addjunhunping"))
        self.lua.execute(function(source(DATA / "functions/Activity/OpenServerAward.lua"), "tobezero"))
        self.lua.execute(text[text.index("-- GM 面板统一入口："):])

    def command(self, name, *args):
        g = self.lua.globals()
        return g.gmCommand(g.player, name, *args)

    def check(self, code):
        self.lua.execute(code)

    def test_every_whitelist_command_exists_and_default_dispatches(self):
        self.check("""
for name,cfg in pairs(LocalDT.GmCommandConfig) do
 assert(type(_G[name])=='function',name)
 local previous=_G[name];local received={}
 _G[name]=function(p,n) assert(p==player);received.value=n;received.called=true end
 gmCommand(player,name)
 assert(received.called,name)
 if cfg.kind=='number' and not cfg.optional then
  assert(received.value==(cfg.uiDefault or cfg.default),name)
 elseif cfg.kind=='suite' then assert(received.value==5)
 else assert(received.value==nil) end
 _G[name]=previous
end
""")

    def test_non_gm_and_non_player_cannot_dispatch_or_call_handlers_directly(self):
        self.check("""
for name in pairs(LocalDT.GmCommandConfig) do
 local previous=_G[name];_G[name]=function() error('unauthorized dispatch '..name) end
 player.gm=0;gmCommand(player,name);player.gm=1
 player.entityType=1;gmCommand(player,name);player.entityType=0
 _G[name]=previous
end
player.gm=0
for name in pairs(LocalDT.GmCommandConfig) do _G[name](player) end
assert(mutations==0 and #added==0 and next(calls)==nil)
assert(not LocalDT.GmRequire(nil))
""")

    def test_unknown_commands_and_extra_parameters_do_not_execute(self):
        self.check("""
secret=function() error('unknown function executed') end
gmCommand(player,'secret');gmCommand(player,'xfzp10');gmCommand(player,'xfzp100')
gmCommand(player,0);gmCommand(player,'setlevel',50,'extra');gmCommand(player,'killAll',1)
assert(mutations==0 and next(calls)==nil and #messages==6)
""")

    def test_native_func_argument_parsing_requires_quoted_command_and_decimal(self):
        # Actual LogicServerCQ64_R.exe callback 0x1401b0610 passes a quoted
        # token as text and every other token through atoi (REA inspected).
        def native(tokens):
            arguments = []
            for token in tokens:
                if token.startswith('"'):
                    arguments.append(token[1:-1] if 3 <= len(token) <= 1019 else "")
                else:
                    match = re.match(r"\s*([+-]?\d+)",token)
                    arguments.append(int(match[1]) if match else 0)
            g = self.lua.globals()
            g.gmCommand(g.player,*arguments)
        native(["setlevel","255"])
        self.check("assert(mutations==0)")
        native(['"setlevel"','"255"'])
        self.check("assert(props[PROP_CREATURE_LEVEL]==255)")
        native(['"setbossrate"','"1.5"'])
        self.check("assert(svar.bossPayMoneyBaseRate==1.5)")
        native(['"GiveTotal"','"起源"'])
        self.check("assert(#added==8 and added[1].id==586)")
        native(['"togglebosspay"','""'])
        self.check("assert(svar.disableBossPayMoney==1)")

    def test_numeric_invalid_values_never_reach_handlers(self):
        self.check("""
for name,cfg in pairs(LocalDT.GmCommandConfig) do
 if cfg.kind=='number' then
  local previous=_G[name];_G[name]=function() error('invalid argument reached '..name) end
  for _,value in ipairs({'abc',{},false,0/0,math.huge,-math.huge,cfg.min-1,cfg.max+1}) do
   gmCommand(player,name,value)
  end
  if cfg.integer then gmCommand(player,name,cfg.min+0.5) end
  _G[name]=previous
 end
end
assert(mutations==0 and next(calls)==nil)
""")

    def test_numeric_bounds_and_numeric_strings_are_accepted(self):
        self.check("""
for name,cfg in pairs(LocalDT.GmCommandConfig) do
 if cfg.kind=='number' then
  local previous=_G[name];local last=nil;_G[name]=function(_,n) last=n end
  gmCommand(player,name,tostring(cfg.min));assert(last==cfg.min,name)
  gmCommand(player,name,tostring(cfg.max));assert(last==cfg.max,name)
  _G[name]=previous
 end
end
""")

    def test_all_materials_use_panel_defaults_and_keep_unrelated_fields(self):
        for name in MATERIALS:
            self.command(name)
        self.check("""
assert(props[PROP_ACTOR_MAGIC_SOUL]==50000 and props[PROP_ACTOR_SHIELD_SPIRIT]==50000)
assert(props[PROP_ACTOR_GEM_CRYSTAL]==50000 and props[PROP_ACTOR_PEARL_CHIP]==50000)
assert(props[PROP_ACTOR_RING_CRYSTAL]==50000 and props[PROP_ACTOR_ACIEVEPOINT]==50000)
assert(props[PROP_ACTOR_CIRCLE_SOUL]==50000 and props[PROP_ACTOR_HONOR_VALUE]==50000)
assert(props[PROP_ACTOR_INNER_EXP]==50000 and props[PROP_ACTOR_YUANSHEN_EXP]==50000)
assert(props[PROP_ACTOR_LINGLI_VALUE]==50000 and props[PROP_ACTOR_GUARD_DRAGON_EXP]==100000)
assert(var.MianJinZhi==50000 and var.JunGuZhi==50000)
assert(calls.xinfa==50000 and calls.soul==50000 and calls.pet==50000 and calls.blood==50000)
assert(calls.xinfaLevel==nil and var.d[12]==123 and var.godSoulValue==456 and var.allOffLineTime==789)
assert(calls.collect==18 and calls.mianju==1 and calls.jungu==1)
sethufu(player);assert(props[PROP_ACTOR_MAGIC_SOUL]==2100000000)
""")

    def test_full_attribute_keeps_timed_map_offline_and_godsoul_fields(self):
        self.command("GmOneKeyFullAttribute")
        self.check("""
assert(props[PROP_CREATURE_LEVEL]==255 and calls.xinfa==2100000000 and calls.xinfaLevel==4)
assert(calls.soul==2100000000 and calls.blood==2100000000 and var.JunGuZhi==2100000000)
assert(var.d[12]==123 and var.godSoulValue==456 and var.allOffLineTime==789 and calls.quest==1)
""")

    def test_kill_uses_current_instance_and_real_death(self):
        self.command("killAll")
        self.check("assert(calls.kill[1]==player and calls.kill[2]==99 and calls.kill[3]==true and calls.kill[4]==-1)")
        self.check("calls.kill=nil;player.handle=0")
        self.command("killAll")
        self.check("assert(calls.kill==nil);player.handle=99;player.scene=nil")
        self.command("killAll")
        self.check("assert(calls.kill==nil)")

    def test_guild_flag_requires_existing_guild(self):
        self.check("player.guild=0")
        self.command("SetGuildFlagExp")
        self.check("assert(calls.flag==nil);player.guild=12;guildExists=false")
        self.command("SetGuildFlagExp")
        self.check("assert(calls.flag[1]==12 and calls.flag[2]==50000 and #messages==2)")
        self.check("guildExists=true")
        self.command("SetGuildFlagExp", 0)
        self.check("assert(calls.flag[2]==0)")

    def test_bottle_selects_highest_unfilled_and_respects_config_capacity(self):
        self.check("bottles={{id=1,dura=100},{id=5453,dura=10},{id=5453,dura=80},{id=5453,dura=100}};maxDura=100")
        self.command("addjunhunping")
        self.check("assert(calls.bottle==bottles[3] and bottles[3].dura==100 and bottles[2].dura==10)")
        self.command("addjunhunping", 0)
        self.check("assert(calls.bottle==bottles[2] and bottles[2].dura==0)")
        self.check("calls.bottle=nil;bottles={{id=5453,dura=100}}")
        self.command("addjunhunping")
        self.check("assert(calls.bottle==nil)")

    def test_boss_pay_toggle_and_decimal_rate(self):
        self.command("togglebosspay")
        self.check("assert(svar.disableBossPayMoney==1)")
        self.command("togglebosspay", "")
        self.check("assert(svar.disableBossPayMoney==0)")
        self.command("togglebosspay", 0)
        self.check("assert(svar.disableBossPayMoney==1)")
        self.command("togglebosspay", 1)
        self.check("assert(svar.disableBossPayMoney==0)")
        self.command("setbossrate")
        self.check("assert(svar.bossPayMoneyBaseRate==1.5)")
        self.command("setbossrate", "0.25")
        self.check("assert(svar.bossPayMoneyBaseRate==0.25);setbossrate(player);assert(svar.bossPayMoneyBaseRate==0.25)")

    def test_cleanup_only_changes_documented_fields(self):
        self.command("qlck2")
        self.check("assert(calls.clear and var.TreasureHuntValue==0 and var.d[199]==0 and var.d[12]==123)")
        self.command("tobezero")
        self.check("assert(svar.openSrvAward==nil and var.openSrvFlags==0 and svar.unrelated==123 and calls.save==1)")

    def test_recharge_default_keeps_original_native_way_and_all_stats(self):
        self.command("GmRecharge")
        self.check("""
assert(calls.recharge[2]==1000 and props[PROP_ACTOR_YUANBAO]==1000)
assert(props[PROP_ACTOR_DRAW_YB_COUNT]==1000 and props[PROP_ACTOR_STOREPOINT]==10000)
assert(props[PROP_ACTOR_VIP_POINT]==1000)
""")

    def test_recharge_exact_limits_pass_and_one_more_never_mutates(self):
        for property_name,maximum in (("PROP_ACTOR_YUANBAO",4294967294),
                                      ("PROP_ACTOR_DRAW_YB_COUNT",2147483647),
                                      ("PROP_ACTOR_VIP_POINT",4294967294)):
            with self.subTest(property=property_name):
                self.check(f"props={{}};calls.recharge=nil;props[{property_name}]={maximum-1000}")
                self.command("GmRecharge",1000)
                self.check(f"assert(props[{property_name}]=={maximum});calls.recharge=nil")
                self.command("GmRecharge",1)
                self.check(f"assert(calls.recharge==nil and props[{property_name}]=={maximum})")
        self.check("props={};calls.recharge=nil;props[PROP_ACTOR_STOREPOINT]=2147483647-10000")
        self.command("GmRecharge",1000)
        self.check("assert(props[PROP_ACTOR_STOREPOINT]==2147483647);calls.recharge=nil")
        self.command("GmRecharge",1)
        self.check("assert(calls.recharge==nil and props[PROP_ACTOR_STOREPOINT]==2147483647)")

    def test_recharge_multiplier_zero_invalid_config_and_large_product(self):
        self.check("GlobalConfig.nBuyItemGetPointRate=0;props[PROP_ACTOR_STOREPOINT]=2147483647")
        self.command("GmRecharge",1)
        self.check("assert(calls.recharge and props[PROP_ACTOR_STOREPOINT]==2147483647)")
        for invalid in (-1,0.5,float("nan"),float("inf"),2147483648,"10"):
            self.lua.globals().GlobalConfig.nBuyItemGetPointRate = invalid
            self.check("props={};calls.recharge=nil")
            self.command("GmRecharge",1)
            self.check("assert(calls.recharge==nil and next(props)==nil)")
        self.check("GlobalConfig=nil")
        self.command("GmRecharge",1)
        self.check("assert(calls.recharge==nil);GlobalConfig={nBuyItemGetPointRate=2147483647}")
        self.command("GmRecharge",2)
        self.check("assert(calls.recharge==nil)")
        self.command("GmRecharge",1)
        self.check("assert(calls.recharge and props[PROP_ACTOR_STOREPOINT]==2147483647)")

    def test_recharge_rejects_invalid_current_fields_and_handles_native_failure(self):
        for property_name in ("PROP_ACTOR_YUANBAO","PROP_ACTOR_DRAW_YB_COUNT",
                              "PROP_ACTOR_STOREPOINT","PROP_ACTOR_VIP_POINT"):
            for invalid in (-1,0.5,float("nan"),float("inf")):
                self.check("props={};calls.recharge=nil")
                self.lua.globals().props[self.lua.globals()[property_name]] = invalid
                self.command("GmRecharge",1)
                self.check("assert(calls.recharge==nil)")
        self.check("props={};rechargeSuccess=false")
        self.command("GmRecharge",1)
        self.check("assert(calls.recharge and next(props)==nil and string.find(messages[#messages],'失败'))")

    def test_equipment_sets_match_shipped_vocation_sex_and_counts(self):
        raw = (DATA / "config/item/StdItems.txt").read_bytes().decode("gbk", errors="replace")
        starts = list(re.finditer(r"(?m)^\s*id=(\d+)\s*,", raw))
        records = {int(m[1]): raw[m.start():starts[i+1].start() if i+1 < len(starts) else len(raw)]
                   for i, m in enumerate(starts)}
        suites = {1:430, 2:439, 3:448, 4:577, 5:586, 6:595, 7:87, 9:114, 11:141, 13:168}
        for key, start in suites.items():
            for job in (1, 2, 3):
                for sex in (0, 1):
                    with self.subTest(suite=key, job=job, sex=sex):
                        self.check(f"player.job={job};player.sex={sex};added={{}}")
                        self.command("GiveTotal", key)
                        entries = list(self.lua.globals().added.values())
                        base = start + (job-1)*9 if key >= 7 else start
                        expected = {base+i-1: 2 if i in (6,7) else 1 for i in range(1,10)
                                    if i not in (2,3) or i == 2+sex}
                        self.assertEqual({e.id:e.num for e in entries}, expected)
                        for item_id in expected:
                            self.assertIn(item_id, records)
                            conditions = dict((int(c), int(v)) for c, v in re.findall(r"\{cond=(\d+),value=(\d+)\}", records[item_id]))
                            self.assertIn(conditions.get(3), (None,job))
                            self.assertIn(conditions.get(2), (None,sex))
        for name, base in (("GmGiveLongTeng",7273),("GmGiveZhiZun",7621)):
            for sex in (0,1):
                self.check(f"player.sex={sex};added={{}}")
                self.command(name)
                self.check(f"assert(#added==8 and added[2].id=={base+1+sex} and added[5].num==2 and added[6].num==2)")

    def test_invalid_suite_and_small_bag_never_give_partial_equipment(self):
        for value in (0, 8, 10, 12, 1.5, "unknown", float("nan"), float("inf")):
            self.command("GiveTotal", value)
        self.check("assert(#added==0);bagSpace=9")
        for name in ("GiveTotal", "GmGiveLongTeng", "GmGiveZhiZun"):
            self.command(name)
        self.check("assert(#added==0);bagSpace=30")
        self.command("givelegion")
        self.check("assert(#added==0);bagSpace=31")
        self.command("givelegion")
        self.check("assert(#added==28)")

    def test_removed_wheel_commands_keep_normal_multi_draw(self):
        text = source(DATA / "functions/Activity/XiaoFeiZhuanPan.lua")
        self.assertNotRegex(text, r"\bfunction\s+xfzp(?:10|100)\b")
        self.assertIn("function AskLucklyZP_multiDraw", text)
        self.assertIn("LocalDT.XFZPAutoReply", text)

    def test_modified_lua_compiles_without_added_top_level_locals(self):
        from lupa.lua51 import LuaRuntime
        lua = LuaRuntime(unpack_returned_tuples=True)
        for relative in ("functions/player.lua", "functions/EquipEnhance/JungGu.lua",
                         "functions/Activity/OpenServerAward.lua", "functions/Activity/XiaoFeiZhuanPan.lua"):
            text = source(DATA / relative)
            result = lua.eval("function(s)local f,e=loadstring(s);return f~=nil,e end")(text)
            self.assertEqual(result, (True,None), relative)
            repo_path = "Server/S1001/data/" + relative
            old = subprocess.check_output(["git", "show", "HEAD:"+repo_path], cwd=ROOT).decode("utf-8-sig")
            self.assertEqual(re.findall(r"^local\s+.*",text,re.M), re.findall(r"^local\s+.*",old,re.M), relative)


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--lua-path")
    args, rest = parser.parse_known_args()
    if args.lua_path:
        sys.path.insert(0, str(ROOT / args.lua_path))
    unittest.main(argv=[sys.argv[0], *rest])
