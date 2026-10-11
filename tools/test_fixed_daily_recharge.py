"""Verify fixed rewards through real Lua handlers and client list bytecode."""
from __future__ import annotations

import argparse
import subprocess
import sys
import unittest
from pathlib import Path

from patch_fixed_daily_recharge import (
    CLIENT, CONFIG_NAME, PACK, ROOT, patch_config, patch_pack,
    read_cbp, read_pack, write_node,
)
from patch_drop_pickup_retry import abc_section
from patch_god_equip_state import inspect_abc
from test_recharge_reminders import execute, strings_of

CONFIG = ROOT / "Server/S1001/data/config/activity/EveryDayPayGiftCfg.lua"
HANDLER = ROOT / "Server/S1001/data/functions/Activity/NewEveryDayPeyGift.lua"
DAYS = (0, 1, 2, 6, 7, 8, 9, 30, 1000)
BASELINE_REF = "fcea12d"


def values(row):
    if hasattr(row, "items"):
        return {key: values(value) for key, value in row.items()}
    return row


def cbp_values(node):
    if node.kind == 4:
        return {child.name: cbp_values(child) for child in node.children}
    if node.kind == 2:
        return node.number()
    if node.kind == 3:
        return node.value.decode("utf-8")
    raise ValueError(node.kind)


class FixedRechargeTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.client = CLIENT.read_bytes()
        _, cls.config = read_cbp(cls.client)
        data, (_, _, start, end) = abc_section((ROOT / "web/GameFrame.swf").read_bytes())
        cls.abc = data[start:end]
        cls.names, traits, bodies = inspect_abc(cls.abc, "EverydayRechargeWin2")
        start, size, cls.limits = bodies[traits["updateList"][0]]
        cls.code = cls.abc[start:start + size]
        cls.strings = strings_of(cls.abc)

    def runtime(self, day=7, pay=0, flags=None, bag=True):
        lua = LuaRuntime(unpack_returned_tuples=True)
        lua.globals().openDay = day
        lua.execute('''
player={days={PeyNum=0,newEveryDayGiftFlag={}}};packets={};given={};bag=true
MiscsImplement={registerMsgHandler=function()end}
LogicCmd={miscSys={sub={cGetNewEveryDayAward=145}}}
GameLog={cGiveNewEverydayAward=1,cGetPayGift=2}
Lang={ScriptTips={zf363='%s %s %s'}};ttChatWindow=1;PROP_ENTITY_ID=1
System={getDaysSinceOpenServer=function()return openDay end,
 broadcastTipmsg=function()end,sendCommonLog=function()end}
Actor={getStaticVar=function()return player end,getName=function()return 'test' end,
 getIntProperty=function()return 1 end}
DataPack={readByte=function(p)return p end,allocPacket=function()return {} end,
 writeByte=function(p,v)table.insert(p,v)end,flush=function(p)table.insert(packets,p)end}
Awards={CheckBagGridCount=function()return bag end,
 Give=function(_,award)table.insert(given,award)end}
''')
        lua.execute(CONFIG.read_text("utf-8-sig"))
        lua.execute(HANDLER.read_text("utf-8-sig"))
        lua.globals().player.days.PeyNum = pay
        lua.globals().bag = bag
        for index, flag in (flags or {}).items():
            lua.globals().player.days.newEveryDayGiftFlag[index] = flag
        return lua

    def test_only_day_seven_config_changed(self):
        previous = subprocess.check_output(["git", "show", "d892026:" + CONFIG.relative_to(ROOT).as_posix()], cwd=ROOT)
        before = LuaRuntime(unpack_returned_tuples=True)
        before.execute(previous.decode("utf-8-sig"))
        after = self.runtime().globals().EveryDayPayGiftCfg
        expected = values(before.globals().EveryDayPayGiftCfg[1])
        self.assertEqual(len(after), 9)
        for day in range(1, 10):
            self.assertEqual(values(after[day]), expected if day == 7
                             else values(before.globals().EveryDayPayGiftCfg[day]))

    def test_claim_rewards_and_thresholds_all_days(self):
        for day in DAYS:
            for tier in range(1, 8):
                with self.subTest(day=day, tier=tier):
                    lua = self.runtime(day)
                    g = lua.globals()
                    row = g.EveryDayPayGiftCfg[1][tier]
                    g.player.days.PeyNum = row.needPayMoney - 1
                    g.MiscsImplement.handleGetPayGiftOp2(1, 145, tier)
                    self.assertEqual(len(g.given), 0)
                    g.player.days.PeyNum = row.needPayMoney
                    g.MiscsImplement.handleGetPayGiftOp2(1, 145, tier)
                    self.assertEqual(values(g.given[1]), values(row.award))
                    self.assertEqual(g.player.days.newEveryDayGiftFlag[tier], 1)
                    g.MiscsImplement.handleGetPayGiftOp2(1, 145, tier)
                    self.assertEqual(len(g.given), 1)

    def test_packet_flags_and_bag_failure(self):
        for day in DAYS:
            lua = self.runtime(day, pay=100000, flags={1: 1, 3: 1})
            g = lua.globals()
            g.MiscsImplement.handleGetPayGiftOp2(1, 145, 0)
            self.assertEqual(values(g.packets[1]), dict(enumerate([7, 2, 1, 2, 0, 0, 0, 0], 1)))
            g.bag = False
            g.MiscsImplement.handleGetPayGiftOp2(1, 145, 2)
            self.assertEqual(len(g.given), 0)
            self.assertIsNone(g.player.days.newEveryDayGiftFlag[2])

    def test_effective_client_display_matches_fixed_server_rewards(self):
        groups = [[{"index": i, **cbp_values(tier)} for i, tier in enumerate(group.children)]
                  for group in self.config.children]
        expected = values(self.runtime().globals().EveryDayPayGiftCfg[1])
        for day in DAYS[1:]:
            state, _, maximum = execute(self.code, self.names, self.strings,
                {0: {"_list": {"items": []}}, 1: None},
                {"GlobalFunc": {"sectionOpenDays": day},
                 "GameData": {"everydayRechargeCfgProvider": {"config": groups}},
                 "GlobalData": {"everydayRechargeStatus": [0] * 7}})
            items = state[0]["_list"]["items"]
            self.assertEqual(len(items), 6)
            self.assertLessEqual(maximum, self.limits[0])
            for tier in items:
                server = expected[tier["index"] + 1]
                for field in ("name", "needPayMoney", "worth"):
                    self.assertEqual(tier[field], server[field])
                for index, award in tier["award"].items():
                    for field in ("type", "id", "count", "bind"):
                        self.assertEqual(award[field], server["award"][int(index) + 1][field])

    def test_packed_resources_preserved_and_patch_idempotent(self):
        previous = subprocess.check_output(["git", "show", "d892026:web/v2/lang/zh-cn/EveryDayPayGiftCfg.cbp"], cwd=ROOT)
        self.assertEqual(patch_config(previous), self.client)
        self.assertEqual(patch_config(self.client), self.client)
        before_pack = subprocess.check_output(["git", "show", BASELINE_REF + ":web/v2/lang/zh-cn/zh-cn.dat"], cwd=ROOT)
        self.assertEqual(patch_pack(before_pack, previous, self.client), PACK.read_bytes())
        self.assertEqual(dict(read_pack(PACK.read_bytes()))[CONFIG_NAME], self.client)
        _, before = read_cbp(previous)
        for index in range(9):
            if index != 6:
                self.assertEqual(write_node(before.children[index]), write_node(self.config.children[index]))


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--lua-path")
    args, remaining = parser.parse_known_args()
    if args.lua_path:
        sys.path.insert(0, args.lua_path)
    from lupa.lua51 import LuaRuntime
    unittest.main(argv=[sys.argv[0], *remaining], verbosity=2)
