"""Verify Spring recharge rotations, boundaries, claims and resource isolation."""
from __future__ import annotations

import argparse
import copy
from pathlib import Path
import re
import subprocess
import sys
import unittest

from patch_guild_quest_config import read_cbp, read_pack
from patch_spring_recharge import CLIENT, PACK, ROOT, SERVER, patch_config, server_rewards

BASELINE = "de3e7aa"


def baseline(path):
    return subprocess.check_output(["git", "show", BASELINE + ":" +
        path.relative_to(ROOT).as_posix()], cwd=ROOT)


class SpringRechargeTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.lua = LuaRuntime(unpack_returned_tuples=True)
        cls.lua.execute(SERVER.read_text("utf-8-sig"))
        cls.config = cls.lua.globals().SpringFestivalCfg.EveryTotalPay

    def slot(self, tier, slot):
        return [(self.config[tier].days[day].award[slot].id,
                 self.config[tier].days[day].award[slot].count) for day in range(1, 13)]

    def test_thresholds_and_ten_wan_rewards(self):
        self.assertEqual([100000, 500000, 1000000, 2000000],
                         [self.config[i].needPay for i in range(1, 5)])
        self.assertEqual([(i, 1) for i in [7043,7690,7047,7827,6887,7813] * 2], self.slot(1, 3))
        self.assertEqual([(6369, n) for n in [1,1,1,1,1,2,3,4,5,6,7,8]], self.slot(1, 5))

    def test_fifty_wan_rewards(self):
        self.assertEqual([(5951, n) for n in [20,20,20,20,20,30,40,50,60,70,80,90]], self.slot(2, 1))
        self.assertEqual([(7039, 1)] * 12, self.slot(2, 3))
        self.assertEqual([(7049, 2),(7048, 2)] * 6, self.slot(2, 4))

    def test_hundred_wan_rewards(self):
        self.assertEqual([(7651,1),(6659,1),(7651,2),(6659,2),(7651,3),(6659,3),
                          (7651,4),(6659,4),(7651,5),(6659,5),(7651,6),(6659,6)], self.slot(3, 3))
        self.assertEqual([(6402,10),(7151,80),(6402,15),(7151,120),(6402,20),(7151,160),
                          (6402,25),(7151,200),(6402,30),(7151,240),(6402,35),(7151,280)], self.slot(3, 5))

    def test_two_hundred_wan_rewards(self):
        self.assertEqual([(7039, n) for n in [4,8,12,16,20,24,28,32,36,40,44,48]], self.slot(4, 1))
        self.assertEqual([(6364,1)] * 4 + [(6714,1)] * 4 + [(7182,1)] * 4, self.slot(4, 3))
        self.assertEqual([(5661,20),(7052,5),(5661,30),(7052,8),(5661,40),(7052,11),
                          (5661,50),(7052,14),(5661,60),(7052,17),(5661,70),(7052,20)], self.slot(4, 4))
        self.assertEqual([(6371,2),(6658,2),(6371,4),(6658,4),(6371,6),(6658,6),
                          (6371,8),(6658,8),(6371,10),(6658,10),(6371,12),(6658,12)], self.slot(4, 5))

    def test_server_changes_only_requested_slots(self):
        old = LuaRuntime(unpack_returned_tuples=True)
        old.execute(baseline(SERVER).decode("utf-8-sig"))
        original = old.globals().SpringFestivalCfg.EveryTotalPay
        changes = [{3,5}, {1,3,4}, {3,5}, {1,3,4,5}]
        for tier in range(1, 5):
            for day in range(1, 13):
                self.assertEqual(5, len(self.config[tier].days[day].award))
                for slot in range(1, 6):
                    actual = self.config[tier].days[day].award[slot]
                    self.assertEqual(0, actual.type)
                    self.assertEqual(1, actual.bind)
                    self.assertGreater(actual.count, 0)
                    if slot not in changes[tier - 1]:
                        for field in ("type", "id", "count", "bind"):
                            self.assertEqual(original[tier].days[day].award[slot][field], actual[field])
        before, after = baseline(SERVER), SERVER.read_bytes()
        self.assertEqual(before.split(b"\tEveryTotalPay =", 1)[0], after.split(b"\tEveryTotalPay =", 1)[0])
        self.assertEqual(before.split(b"\tXiaoFeiZhuanPanNew =", 1)[1], after.split(b"\tXiaoFeiZhuanPanNew =", 1)[1])

    def test_client_and_pack_match_and_preserve_other_resources(self):
        source = CLIENT.read_bytes()
        self.assertEqual(source, patch_config(source, server_rewards()))
        before = read_cbp(baseline(CLIENT))[1]
        after = copy.deepcopy(read_cbp(source)[1])
        after.child("EveryTotalPay").children = before.child("EveryTotalPay").children
        self.assertEqual(before, after)
        old_pack, new_pack = read_pack(baseline(PACK)), read_pack(PACK.read_bytes())
        self.assertEqual([n for n, _ in old_pack], [n for n, _ in new_pack])
        self.assertEqual([CLIENT.name], [name for (name, a), (_, b) in
                         zip(old_pack, new_pack, strict=True) if a != b])
        self.assertEqual(source, dict(new_pack)[CLIENT.name])

    def test_reward_item_ids_exist_in_server_and_shipped_client(self):
        server_ids = {int(v) for v in re.findall(rb'(?m)^\s*id\s*=\s*(\d+)',
            (ROOT / 'Server/S1001/data/config/item/StdItems.txt').read_bytes())}
        client_ids = set()
        for path in CLIENT.parent.glob('stditems*.cbp'):
            for item in read_cbp(path.read_bytes())[1].children:
                client_ids.add(int(item.child('id').number()))
        reward_ids = {int(self.config[tier].days[day].award[slot].id)
            for tier in range(1, 5) for day in range(1, 13) for slot in range(1, 6)}
        self.assertFalse(reward_ids - server_ids)
        self.assertFalse(reward_ids - client_ids)

    def runtime(self):
        lua = LuaRuntime(unpack_returned_tuples=True)
        lua.execute(SERVER.read_text("utf-8-sig"))
        lua.execute('''var={days={PeyNum=0},Spring_Data={},SpringTime=1};day=1;given={};tips={}
            get_spring_festival_day_count=function() return day end
            register_spring_festival_func=function() end
            register_spring_festival_start_end_func=function() end
            register_spring_festival_login_func=function() end
            register_spring_festival_online_cross_day_func=function() end
            is_spring_festival_time=function() return true end
            Actor={getStaticVar=function() return var end,sendTipmsg=function(a,t) table.insert(tips,t) end,
                getName=function() return "test" end,getIntProperty=function() return 1 end}
            DataPack={allocPacket=function() return {} end,writeByte=function() end,flush=function() end}
            LogicCmd={miscSys={sub={sSendSpringFestivalData=1}}}
            Awards={CheckBagGridCount=function() return true end,
                Give=function(a,rewards) table.insert(given,rewards);return true end}
            LogIds={spring_lijichongzhi=1};System={sendCommonLog=function() end,broadcastTipmsg=function() end,
                getStaticVar=function() return {SpringTime=1} end,isCrossServer=function() return false end}
        ''')
        lua.execute((ROOT / 'Server/S1001/data/functions/Activity/spring/spring_total.lua').read_text('utf-8-sig'))
        return lua

    def test_progress_threshold_edges_and_once_per_day(self):
        for tier, amount in enumerate([100000,500000,1000000,2000000], 1):
            for pay, expected in [(amount-1,0),(amount,1),(amount+1,1)]:
                lua = self.runtime()
                lua.globals().var.days.PeyNum = pay
                lua.execute('GetSpringLiJiChongzhi(1);GetSpringLiJiChongzhi(1)')
                self.assertEqual(expected, lua.eval(f'var.Spring_Data.payTotal[{tier}] or 0'))
            lua = self.runtime()
            lua.globals().var.days.PeyNum = amount
            lua.execute('GetSpringLiJiChongzhi(1);day=2;var.days.spring_payTime={};GetSpringLiJiChongzhi(1);GetSpringLiJiChongzhi(1)')
            self.assertEqual(2, lua.eval(f'var.Spring_Data.payTotal[{tier}]'))

    def test_each_claim_uses_updated_rewards_and_cannot_repeat(self):
        lua = self.runtime()
        lua.execute('day=12;var.Spring_Data.payTotal={12,12,12,12}')
        for tier in range(1, 5):
            for day in range(1, 13):
                lua.execute(f'GetSpringLiJiChongzhiGife(1,{tier},{day});GetSpringLiJiChongzhiGife(1,{tier},{day})')
                actual = lua.globals().given[(tier-1)*12+day]
                for slot in range(1, 6):
                    for field in ('id','count','bind','type'):
                        self.assertEqual(self.config[tier].days[day].award[slot][field], actual[slot][field])
        self.assertEqual(48, lua.eval('#given'))


if __name__ == '__main__':
    parser = argparse.ArgumentParser(); parser.add_argument('--lua-path', type=Path); args = parser.parse_args()
    if args.lua_path: sys.path.insert(0, str(args.lua_path))
    from lupa.lua51 import LuaRuntime
    unittest.main(argv=[sys.argv[0]], verbosity=2)
