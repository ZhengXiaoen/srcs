"""Execute the shipped activity bytecode against actual claim and reply states."""
from __future__ import annotations

import argparse
from itertools import product
import math
import subprocess
import struct
import sys
import unittest
import zlib

from patch_activity_entries import strings_of
from patch_activity_reminders import (BASELINE, CLIENT, MODULE, ROOT, Code,
                                      mark_loop_targets, normalize, patch_swf)
from patch_drop_pickup_retry import abc_section, instructions
from patch_god_equip_state import inspect_abc
from patch_guild_quest_config import read_cbp, read_pack
from patch_bag_client import ABCReader, encode_u30


# This dynamically loaded module was ignored by Git before this fix. These six
# original bodies were captured before editing; the rest of the module stays
# byte-identical. Retain them as a reproducible regression baseline.
MODULE_ORIGINAL = {
    7: ((3, 7, 14, 15), 'd030208017d62400d72080366304d0d14eee010160ef01600466f001d066324ff1010260ef01600466f201d066314ff3010260ef01600966f401d066304ff3010260ef01600466f501d0662f4ff1010260ef01600466f601d0662e4ff1010224006305d0661d826306101600000962066205238017d6d2600566f701d066334ff1010232060511e3ffff080608052400d71015000009d06623d366dc0160368780362a63044f5300c203d3d0662266e10115e0ffff47'),
    8: ((3, 7, 14, 15), 'd030208017d62400d72080366304d0d14ef8010160ef01600466f001d066324ff1010260ef01600466f201d066314ff3010260ef01600966f401d066304ff3010260ef01600466f501d0662f4ff1010260ef01600466f601d0662e4ff1010224006305d0661d826306101600000962066205238017d6d2600566f701d066334ff3010232060511e3ffff080608052400d71015000009d06623d366dc0160368780362a63044f5400c203d3d0662266e10115e0ffff47'),
    9: ((4, 6, 14, 15), 'd0302400d660e90166f90166fa0173d760fb0166fc0146fd010066fe01806a630424006305103f000009d3620466ff01620566dc010c080000620573d610350000d3620466ff01620466ff0166e1019366dc010f0f0000620466ff0166e1019373d610100000c2056205620466ff0166e10115b3ffffd260e901668002668102a124000e0b0000d0662a2661e80110070000d0662a2761e80147'),
    10: ((2, 14, 14, 15), 'd0302400d62400d72080076305240063062080820263082400630960fb0166fc0146fd01006683028007630460e901668002668402800763072400630a620482630b106e000009620b620a2380820263082400630660e901668002668502d366dc0173d660e901668002668402d366dc01800763052400630c620582630d1025000009620d620c23732a63092400ab2a12050000296206d2ad12080000d066272661e80147c206320d0c11d4ffff080d080cc203320b0a118bffff080b080ad066272761e80147'),
    11: ((2, 2, 14, 15), 'd030d0204f3101d0204f2f0147'),
    41: ((3, 1, 13, 14), 'd030d06678600566f701d0667d4ff3010247'),
}


def baseline_swf(path):
    if path == CLIENT:
        return subprocess.check_output(['git', 'show', BASELINE + ':web/GameFrame.swf'], cwd=ROOT)
    data, (tag, payload, a, b) = abc_section(path.read_bytes())
    abc, positions = normalize(data[a:b]); _, _, bodies = inspect_abc(abc, 'HongLiActiveWin'); edits = []
    for mid, (limits, hex_) in MODULE_ORIGINAL.items():
        start, size, current_limits = bodies[mid]; r = ABCReader(abc); r.pos = start + size
        if r.u30() != 0: raise ValueError('Unexpected module exceptions')
        header = b''.join(encode_u30(v) for v in (mid, *current_limits, size)); code = bytes.fromhex(hex_)
        replacement = b''.join(encode_u30(v) for v in (mid, *limits, len(code))) + code + b'\0'
        edits.append((start - len(header), r.pos, replacement))
    result = bytearray(abc)
    for start, end, value in sorted(edits, reverse=True): result[start:end] = value
    for pos in positions: result[pos] = 0
    swf = data[:tag + 2] + struct.pack('<I', a - payload + len(result)) + data[payload:a] + result + data[b:]
    swf = swf[:4] + struct.pack('<I', len(swf)) + swf[8:]
    return swf[:8] + zlib.compress(swf[8:], 9)


def truth(value):
    return True if isinstance(value, (dict, list, tuple)) else bool(value)


def strict(left, right):
    if isinstance(left, (int, float)) and not isinstance(left, bool):
        return isinstance(right, (int, float)) and not isinstance(right, bool) and left == right
    return type(left) == type(right) and left == right


def execute(code, names, strings, locals_, globals_, invoke, start=0, end=None):
    ops = {o.start: o for o in instructions(code)}; stack = []; maximum = 0; pos = start
    for _ in range(100000):
        if pos == end: return None, maximum
        op = ops[pos]; pos = op.end; kind, args = op.opcode, op.operands
        if 0xd0 <= kind <= 0xd3: stack.append(locals_.get(kind - 0xd0))
        elif 0xd4 <= kind <= 0xd7: locals_[kind - 0xd4] = stack.pop()
        elif kind == 0x62: stack.append(locals_.get(args[0]))
        elif kind == 0x63: locals_[args[0]] = stack.pop()
        elif kind in (0x20, 0x24, 0x25, 0x26, 0x27, 0x2c):
            stack.append(None if kind == 0x20 else True if kind == 0x26 else False if kind == 0x27
                         else strings[args[0]] if kind == 0x2c else args[0])
        elif kind in (0x09, 0x80, 0x82): pass
        elif kind == 0x30: stack.pop()
        elif kind == 0x60: stack.append(globals_.get(names[args[0]], {'class': names[args[0]]}))
        elif kind == 0x66:
            name = names[args[0]]; key = name if name else stack.pop(); obj = stack.pop()
            if name == 'length': value = len(obj)
            elif isinstance(obj, (list, tuple)): value = obj[key] if 0 <= key < len(obj) else None
            elif isinstance(obj, dict): value = obj.get(key, ('method', key, obj))
            else: raise ValueError(f'Property {name} on {obj}')
            stack.append(value)
        elif kind in (0x61, 0x68):
            name = names[args[0]]; value = stack.pop(); key = name if name else stack.pop(); obj = stack.pop()
            obj[key] = value
        elif kind in (0x46, 0x4f, 0x4e):
            count = args[1]; values = stack[-count:] if count else []
            if count: del stack[-count:]
            obj = stack.pop(); name = names[args[0]]
            result = None if kind == 0x4e else invoke(obj, name, values)
            if kind == 0x46: stack.append(result)
        elif kind == 0x56:
            count = args[0]; values = stack[-count:] if count else []
            if count: del stack[-count:]
            stack.append(list(values))
        elif kind == 0x49:
            if args[0]: del stack[-args[0]:]
            stack.pop()
        elif kind == 0x87: stack.pop()
        elif kind == 0x2a: stack.append(stack[-1])
        elif kind == 0x29: stack.pop()
        elif kind in (0x73, 0x76, 0x93):
            value = stack.pop(); stack.append(int(value or 0) if kind == 0x73 else truth(value) if kind == 0x76 else value - 1)
        elif kind == 0xc2: locals_[args[0]] += 1
        elif kind == 0x32:
            obj, index = args; locals_[index] += 1; stack.append(locals_[index] <= len(locals_[obj]))
        elif kind == 0x23:
            index, obj = stack.pop(), stack.pop(); stack.append(obj[index - 1])
        elif kind == 0x08: locals_[args[0]] = None
        elif kind in (0xa0, 0xa1, 0xa2, 0xa3, 0xab, 0xad, 0xae, 0xaf, 0xb0):
            right, left = stack.pop(), stack.pop()
            value = {0xa0: lambda: left + right, 0xa1: lambda: left - right,
                     0xa2: lambda: left * right, 0xa3: lambda: left / right,
                     0xab: lambda: left == right, 0xad: lambda: left < right,
                     0xae: lambda: left <= right, 0xaf: lambda: left > right,
                     0xb0: lambda: left >= right}[kind]()
            stack.append(value)
        elif 0x0c <= kind <= 0x1a:
            if kind == 0x10: take = True
            elif kind in (0x11, 0x12):
                take = truth(stack.pop()); take = take if kind == 0x11 else not take
            else:
                right, left = stack.pop(), stack.pop()
                try:
                    take = {0x0c: lambda: not left < right, 0x0d: lambda: not left <= right,
                            0x0e: lambda: not left > right, 0x0f: lambda: not left >= right,
                            0x13: lambda: left == right, 0x14: lambda: left != right,
                            0x15: lambda: left < right, 0x16: lambda: left <= right,
                            0x17: lambda: left > right, 0x18: lambda: left >= right,
                            0x19: lambda: strict(left, right), 0x1a: lambda: not strict(left, right)}[kind]()
                except TypeError: take = kind in (0x0c, 0x0d, 0x0e, 0x0f)
            if take: pos = op.branches[0][1]
        elif kind == 0x1b:
            index = stack.pop(); branch = index + 1 if 0 <= index <= args[0] else 0
            pos = op.branches[branch][1]
        elif kind in (0x47, 0x48):
            result = stack.pop() if kind == 0x48 else None
            if stack: raise ValueError(f'Nonempty stack at return: {stack}')
            return result, maximum
        else: raise ValueError(f'Unsupported opcode {kind:#x} at {op.start}')
        maximum = max(maximum, len(stack))
    raise ValueError('Method did not terminate')


def config_value(node):
    if node.kind == 2: return node.number()
    if node.kind == 1: return bool(int.from_bytes(node.value, 'little'))
    if node.kind == 3: return node.value.decode('utf-8')
    if node.children and all(c.name.isdecimal() for c in node.children):
        return [config_value(c) for c in node.children]
    return {c.name: config_value(c) for c in node.children}


class ActivityRemindersTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.abc = {}; cls.before = {}; cls.symbols = {}
        cls.cache = {}
        for path, module in ((CLIENT, False), (MODULE, True)):
            source = path.read_bytes()
            raw, (_, _, a, b) = abc_section(source); cls.abc[module], _ = normalize(raw[a:b])
            old = baseline_swf(path)
            raw, (_, _, a, b) = abc_section(old); cls.before[module], _ = normalize(raw[a:b])
            cls.symbols[module] = inspect_abc(cls.abc[module], 'HongLiActiveWin' if module else 'NavTopRightArea')
        cls.configs = {}
        for name in ('SanRenHongLiCfg.cbp', 'activity_DajiDaLi.cbp', 'oneyearactivitycfg.cbp'):
            _, root = read_cbp((ROOT / 'web/v2/lang/zh-cn' / name).read_bytes())
            cls.configs[name] = config_value(root)

    def setUp(self):
        self.requests = []; self.listeners = []; self.buttons = {}; self.nav = {}
        self.hong = {'hongLiDay': 1, 'hongLiLoginGet': -1, 'hongLiEveryDayRechargeGet': -1,
                     'hongLiTurnTime': -1, 'hongLiRechargeDays': [], 'hongLiRechargeStatu': []}
        self.dj = {'openDay': 1, 'loginCount': 0, 'loginStatus': [], 'rechargeDays': [],
                   'rechargeAwardsHasGet': [], 'rechargeCount': 9999999, 'rechargeStatus': []}
        for name in ('bossCount', 'pkCount', 'duobaoCount', 'consumeCount', 'copyCount', 'pvpCount',
                     'spendCount', 'escortCount', 'treasureCount', 'monsterCount'): self.dj[name] = 0
        for name in ('bossStatus', 'pkStatus', 'consumeStatus', 'copyStatus', 'pvpStatus',
                     'treasureStatus', 'cWorldStatus', 'monsterStatus', 'cWorldCounts'): self.dj[name] = []
        self.year = {'curDay': 1, 'totalDay': 7, 'loginDay': 1, 'loginStatus': [],
                     'rechargeStatu': -1, 'accRechargeStatus': [], 'curPayNum': 0, 'index': 0}
        self.items = {'curPayGold': 0, 'bag': {}}
        self.role = {'level': 80, 'money': 0}
        self.cfg_hong = self.configs['SanRenHongLiCfg.cbp']
        self.cfg_dj = self.configs['activity_DajiDaLi.cbp']
        self.cfg_year = self.configs['oneyearactivitycfg.cbp']
        self.dj_cfgs = [self.cfg_dj[k] for k in ('loginGiveAward', 'payGiveAward', 'killBoss', 'happyPK',
                        'buyGiveAward', 'comsumeGiveAward', 'duobeiGiveAward', 'enterCross',
                        'xunbaoGiveAward', 'chuangdituGiveAward', 'killMonsterGiveAward', 'payGiveAwardNew')]
        self.globals = {'GlobalData': {'cliffordDataMgr': self.hong, 'dajidaliDataMgr': self.dj,
                        'yearAcitveDataMgr': self.year, 'itemDataMgr': self.items, 'role': self.role},
                        'GameData': {'hongliProvider': {'cfg': self.cfg_hong},
                                     'daJiDaLiDataProvider': {'cfgs': self.dj_cfgs},
                                     'oneYearActiveProvider': {'data': self.cfg_year}},
                        'MsgButtonTypes': {'RIGHT_TOP_HONG_LI_BTN': 'hong', 'RIGHT_Top_DAJIDALI': 'dj',
                                           'RIGHT_Top_YearActive': 'year', 'RIGHT_QING_DIAN': 'qd'},
                        'CliffordEvent': {k: k for k in ('HONG_LI_DAY', 'HONG_LI_ACC_RECHARGE_STATU',
                             'HONG_LI_EVERYDAY_LOGIN', 'HONG_LI_EVERYDAY_ECHARGE', 'HONG_LI_TURN_TIME')},
                        'DaJiDaLiEvent': {'OPEN_DAY': 'OPEN_DAY', 'STATU_CHANGE': 'STATU_CHANGE'},
                        'YearActiveEvent': {'DAYCHANGE': 'DAYCHANGE'},
                        'OtherEvent': {'EVERYDAY_RECHARGE_DATA_CHANGE': 'EVERYDAY_RECHARGE_DATA_CHANGE'}}

    def run_method(self, method, obj, arg=None, module=False, before=False, start=0, end=None, extra=None):
        abc = self.before[module] if before else self.abc[module]
        key = (module, before)
        if key not in self.cache:
            names, _, bodies = inspect_abc(abc, 'HongLiActiveWin' if module else 'NavTopRightArea')
            self.cache[key] = names, bodies, strings_of(abc)
        names, bodies, strings = self.cache[key]
        a, size, limits = bodies[method]
        result, maximum = execute(abc[a:a + size], names, strings, {0: obj, 1: arg, **(extra or {})},
                                  self.globals, self.invoke, start, end)
        self.assertLessEqual(maximum, limits[0], f'method {method} exceeds max_stack')
        return result

    def invoke(self, obj, name, args):
        if name == 'indexOf': return obj.index(args[0]) if args[0] in obj else -1
        if name == 'ceil': return math.ceil(args[0])
        if name == 'getCfg': return obj['cfg']
        if name == 'getDataByIndex': return obj['cfgs'][args[0]] if 0 <= args[0] < len(obj['cfgs']) else None
        if name == 'checkActivityOpen': return 0 <= args[0] < 12 and args[1] in obj['cfgs'][args[0]]['openDay']
        if name == 'getRoleMoneyByType': return obj['money']
        if name == 'getBagItemCountById': return obj['bag'].get(args[0], 0)
        if name == 'getEffect': return None
        if name == 'checkQDShowEffect': return self.run_method(6403, obj)
        if name in ('getBtn', 'getPaneBtnByType'): return self.buttons.get(args[0])
        if name == 'delBtn': self.buttons.pop(args[0], None); return None
        if name == 'addBtn2': self.buttons[args[0]] = {'effect': True}; return None
        if name == 'setEffect': obj['effect'] = args[0]; return None
        if name == 'checkAddBtn':
            abc = self.abc[False]; names, _, bodies = self.symbols[False]
            a, size, _ = bodies[6497]; code = abc[a:a + size]
            button = args[1]
            marker = next(o.start for o in instructions(code) if o.opcode == 0x66
                          and o.operands == ((38315,) if button == 'dj' else (38323,)))
            start = max(o.start for o in instructions(code) if o.start < marker and o.opcode == 0x09)
            end = next(o.branches[0][1] for o in instructions(code)
                       if o.start > marker and o.opcode == 0x10)
            return self.run_method(6497, self.nav, args[0], start=start, end=end,
                                   extra={2: button, 4: True})
        if name in ('getHongLiInfo', 'sendDjdlInfo', 'sendYearActiveInfo'):
            self.requests.append((name, tuple(args))); return None
        if name == 'canGetAward': return self.run_method(2648 if obj is self.dj else 4080, obj, args[0])
        if name in ('hongLiActiveOpen', 'onDJDLDayChange', 'checkOneYearActive', 'onYearactiveChange'):
            if name == 'onYearactiveChange': return self.run_method(6379, obj, args[0] if args else None)
            return self.run_method({'hongLiActiveOpen': 6335, 'onDJDLDayChange': 6382,
                                    'checkOneYearActive': 6380}[name], obj, args[0] if args else None)
        if name in ('addEventListener', 'removeEventListener'):
            self.listeners.append((name, args)); return None
        if name in ('updateTime', 'updateTotalRechargeInfo', 'dataChangeHandler', 'updatereChargeInfo', 'updateLoginInfo'):
            return self.run_method({'updateTime': 9, 'updateTotalRechargeInfo': 10, 'dataChangeHandler': 11,
                    'updatereChargeInfo': 12, 'updateLoginInfo': 13}[name], obj, args[0], True)
        if name in ('initEvent', 'removeEvent'): return None
        raise ValueError(f'Unsupported method {name}')

    def hong_dot(self, event='HONG_LI_EVERYDAY_LOGIN'):
        self.buttons.setdefault('hong', {'effect': True})
        self.run_method(6335, self.nav, {'type': event})
        return self.buttons['hong']['effect']

    def test_baseline_reproduces_empty_glow_and_claimed_login(self):
        self.run_method(6335, self.nav, {'type': 'state'}, before=True)
        self.assertTrue(self.buttons['hong']['effect'])
        self.year['loginStatus'] = [1] * 7
        self.assertTrue(self.run_method(4080, self.year, 1, before=True))
        self.year.update(rechargeStatu=0, accRechargeStatus=[1] * 3); self.items['curPayGold'] = 99999
        self.assertTrue(self.run_method(4080, self.year, 3, before=True))

    def test_hong_first_login_payment_and_all_claimed_states(self):
        for login, first, pay in product((-1, 0, 1), (-1, 0, 1), (0, 1, 10000)):
            self.hong.update(hongLiLoginGet=login, hongLiEveryDayRechargeGet=first)
            self.items['curPayGold'] = pay
            self.assertEqual(self.hong_dot(), login == 0 or first == 0 and pay > 0)

    def test_hong_accumulated_days_and_claim_states_match_server(self):
        self.hong.update(hongLiLoginGet=1, hongLiEveryDayRechargeGet=1)
        for days, flags in product(product(range(4), repeat=2), product(range(2), repeat=6)):
            self.hong['hongLiRechargeDays'] = days
            self.hong['hongLiRechargeStatu'] = [list(flags[:3]), list(flags[3:])]
            expected = any(days[t] >= d + 1 and flags[t * 3 + d] == 0 for t in range(2) for d in range(3))
            self.assertEqual(self.hong_dot(), expected, (days, flags))
            win = {'tipsIcon2': {}}
            self.run_method(10, win, None, True)
            self.assertEqual(win['tipsIcon2']['visible'], expected)

    def test_hong_spin_requires_remaining_draw_and_enough_currency(self):
        cfg = self.cfg_hong['LuckeyZhuanPan']; self.hong.update(hongLiLoginGet=1, hongLiEveryDayRechargeGet=1)
        for index in range(len(cfg['needPay'])):
            self.hong['hongLiTurnTime'] = index
            for pay, money in product((cfg['needPay'][index] - 1, cfg['needPay'][index]),
                                      (cfg['needYB'][index] - 1, cfg['needYB'][index])):
                self.items['curPayGold'] = pay; self.role['money'] = money
                expected = pay >= cfg['needPay'][index] and money >= cfg['needYB'][index]
                self.assertEqual(self.hong_dot(), expected)
                win = {'tipsIcon5': {}}; self.run_method(9, win, None, True)
                self.assertEqual(win['tipsIcon5']['visible'], expected)
        self.hong['hongLiTurnTime'] = len(cfg['needPay']); self.assertFalse(self.hong_dot())

    def test_hong_open_day_claim_and_payment_replies_do_not_loop(self):
        self.run_method(6335, self.nav, None)
        self.assertEqual(self.requests, [('getHongLiInfo', (0, i)) for i in (1, 2, 3, 4)])
        self.assertFalse(self.buttons['hong']['effect'])
        self.requests.clear(); self.hong['hongLiLoginGet'] = 0
        self.assertTrue(self.hong_dot())
        self.hong['hongLiLoginGet'] = 1; self.assertFalse(self.hong_dot())
        self.assertEqual(self.requests, [])
        self.hong_dot('HONG_LI_DAY'); self.assertEqual(len(self.requests), 4)
        self.requests.clear(); self.hong_dot('EVERYDAY_RECHARGE_DATA_CHANGE'); self.assertEqual(len(self.requests), 4)
        self.hong['hongLiDay'] = 0; self.run_method(6335, self.nav, {'type': 'HONG_LI_DAY'})
        self.assertNotIn('hong', self.buttons)

    def test_dj_new_recharge_days_ignore_old_protocol(self):
        for days, flags in product(product(range(4), repeat=2), product(range(2), repeat=6)):
            self.dj.update(rechargeDays=days, rechargeAwardsHasGet=[list(flags[:3]), list(flags[3:])])
            expected = any(days[t] >= d + 1 and flags[t * 3 + d] == 0 for t in range(2) for d in range(3))
            self.assertEqual(self.run_method(2648, self.dj, 2), expected)
        self.dj.update(rechargeDays=[3, 3], rechargeAwardsHasGet=[[], []])
        self.assertFalse(self.run_method(2648, self.dj, 2))

    def test_dj_hidden_closed_and_unknown_states_never_remind(self):
        self.assertFalse(self.run_method(2648, self.dj, 5))
        for day in range(5):
            self.dj['openDay'] = day
            self.dj.update(loginCount=3, loginStatus=[1, 1, 0])
            self.assertEqual(self.run_method(2648, self.dj, 1), day == 3)
        for status, count, slot in (('bossStatus', 'bossCount', 3), ('consumeStatus', 'consumeCount', 6),
                ('copyStatus', 'copyCount', 7), ('treasureStatus', 'treasureCount', 9),
                ('cWorldStatus', 'cWorldCounts', 10), ('monsterStatus', 'monsterCount', 11)):
            self.dj.update(openDay=3); self.dj[status] = []
            self.dj[count] = [9999999] * 10 if count == 'cWorldCounts' else 9999999
            self.assertFalse(self.run_method(2648, self.dj, slot), slot)
            self.dj[status] = [0] * len(self.dj_cfgs[slot - 1]['Info'])
            self.assertTrue(self.run_method(2648, self.dj, slot), slot)
            self.dj[status] = [1] * len(self.dj[status])
            self.assertFalse(self.run_method(2648, self.dj, slot), slot)
        for slot, counts in ((4, ('pkCount', 'duobaoCount')), (8, ('pvpCount', 'spendCount', 'escortCount'))):
            status = 'pkStatus' if slot == 4 else 'pvpStatus'
            for count in counts: self.dj[count] = 9999999
            self.dj[status] = []; self.assertFalse(self.run_method(2648, self.dj, slot))
            count = len(self.dj_cfgs[slot - 1]['Info']) if slot == 4 else len(self.dj_cfgs[7]['consumeTuMoDian']) + 2
            self.dj[status] = [0] * count
            self.assertTrue(self.run_method(2648, self.dj, slot))
            self.dj[status] = [1] * len(self.dj[status])
            self.assertFalse(self.run_method(2648, self.dj, slot))

    def test_dj_entry_queries_visible_pages_then_refreshes_without_queries(self):
        self.run_method(6382, self.nav, None)
        self.assertEqual(self.requests, [('sendDjdlInfo', (0, i)) for i in (1, 12, 3, 4)])
        self.assertFalse(self.buttons['dj']['effect'])
        self.requests.clear(); self.dj.update(loginCount=1, loginStatus=[0, 0, 0])
        self.run_method(6382, self.nav, {'type': 'STATU_CHANGE'}); self.assertTrue(self.buttons['dj']['effect'])
        self.dj['loginStatus'] = [1, 0, 0]
        self.run_method(6382, self.nav, {'type': 'STATU_CHANGE'}); self.assertFalse(self.buttons['dj']['effect'])
        self.assertEqual(self.requests, [])
        self.dj['openDay'] = 0; self.run_method(6382, self.nav, {'type': 'OPEN_DAY'})
        self.assertNotIn('dj', self.buttons)

    def test_year_login_all_claim_states_days_and_level(self):
        for flags in product(range(2), repeat=7):
            self.year['loginStatus'] = list(flags)
            for day in (1, 3, 7):
                self.year.update(curDay=day, loginDay=day)
                for level in (79, 80):
                    self.role['level'] = level
                    expected = level >= 80 and 0 in flags[:day]
                    self.assertEqual(self.run_method(4080, self.year, 1), expected)
        self.year.update(loginStatus=[], loginDay=7, curDay=7)
        self.assertFalse(self.run_method(4080, self.year, 1))

    def test_year_first_charge_page_and_dot_use_server_threshold(self):
        for status, pay in product((-1, 0, 1), (0, 1, 999, 1000, 1001)):
            self.year['rechargeStatu'] = status; self.items['curPayGold'] = pay
            expected = status == 0 and pay >= 1000
            self.assertEqual(self.run_method(4080, self.year, 2), expected)
            page = {k: {} for k in ('_loaderbasebutton_1', '_loaderbasebutton_2', '_image_5', '_mdpmovie_0')}
            self.run_method(28528, page)
            self.assertEqual(page['_loaderbasebutton_2']['visible'], expected)

    def test_year_total_charge_uses_each_own_claim_flag(self):
        thresholds = [t['needPay'] for t in self.cfg_year['EveryDayTotalPay']]
        for flags, pay, first in product(product(range(2), repeat=3), (0, 1999, 2000, 4999, 5000, 9999, 10000), (0, 1)):
            self.year.update(accRechargeStatus=list(flags), rechargeStatu=first); self.items['curPayGold'] = pay
            expected = any(pay >= need and flags[i] == 0 for i, need in enumerate(thresholds))
            self.assertEqual(self.run_method(4080, self.year, 3), expected)
        self.year['accRechargeStatus'] = []; self.assertFalse(self.run_method(4080, self.year, 3))

    def test_year_closed_word_and_spin_states(self):
        self.year.update(loginStatus=[1] * 7, rechargeStatu=1, accRechargeStatus=[1] * 3)
        for id_ in (5649, 5650): self.items['bag'][id_] = 1
        self.assertTrue(self.run_method(4080, self.year, 11))
        self.items['bag'][5650] = 0; self.assertFalse(self.run_method(4080, self.year, 11))
        # Dynamic-duration spin logic from previous patches is retained.
        self.year.update(curPayNum=300000, index=0, curDay=1, totalDay=7)
        threshold = self.cfg_year['XiaoFeiZhuanPan'][0][0]['needPay']
        self.year['curPayNum'] = threshold - 1; self.assertFalse(self.run_method(4080, self.year, 10))
        self.year['curPayNum'] = threshold; self.assertTrue(self.run_method(4080, self.year, 10))
        self.year['index'] = 1; self.assertFalse(self.run_method(4080, self.year, 10))
        for day in (0, 8):
            self.year['curDay'] = day
            for slot in (1, 2, 3, 10, 11): self.assertFalse(self.run_method(4080, self.year, slot))

    def test_year_entry_requests_spin_data_and_claims_extinguish_glow(self):
        self.run_method(6380, self.nav, None)
        self.assertEqual(self.requests, [('sendYearActiveInfo', (0, i)) for i in (2, 3, 4, 11, 12)])
        self.assertFalse(self.buttons['year']['effect'])
        self.requests.clear(); self.year['loginStatus'] = [0] * 7
        self.run_method(6379, self.nav, {'type': 'STATU_CHANGE'}); self.assertTrue(self.buttons['year']['effect'])
        self.year['loginStatus'] = [1] * 7
        self.run_method(6379, self.nav, {'type': 'STATU_CHANGE'}); self.assertFalse(self.buttons['year']['effect'])
        self.assertEqual(self.requests, [])
        self.run_method(6380, self.nav, {'type': 'DAYCHANGE'}); self.assertEqual(len(self.requests), 5)

    def test_hong_window_listener_lifecycle_and_live_refresh(self):
        win = {'_btns': [], '_pages': [], '_pagesClass': [],
               **{f'tipsIcon{i}': {} for i in (0, 1, 2, 5)}}
        self.run_method(7, win, None, True)
        self.assertTrue(all(name == 'addEventListener' for name, _ in self.listeners))
        added = [args[0] for _, args in self.listeners]; self.listeners.clear()
        self.run_method(8, win, None, True)
        self.assertEqual([args[0] for _, args in self.listeners], added)
        self.assertTrue(all(name == 'removeEventListener' for name, _ in self.listeners))
        self.hong.update(hongLiEveryDayRechargeGet=0, hongLiTurnTime=0)
        self.items['curPayGold'] = 10000; self.role['money'] = 10000
        self.run_method(11, win, None, True)
        self.assertTrue(win['tipsIcon1']['visible']); self.assertTrue(win['tipsIcon5']['visible'])

    def test_top_activity_state_bag_money_and_level_listeners_are_paired(self):
        names, bodies, _ = self.cache.setdefault((False, False),
              (self.symbols[False][0], self.symbols[False][2], strings_of(self.abc[False])))
        expected = {('CliffordEvent', event, 'hongLiActiveOpen') for event in
                    ('HONG_LI_ACC_RECHARGE_STATU', 'HONG_LI_EVERYDAY_LOGIN',
                     'HONG_LI_EVERYDAY_ECHARGE', 'HONG_LI_TURN_TIME')}
        expected |= {('DaJiDaLiEvent', 'STATU_CHANGE', 'onDJDLDayChange'),
                     ('ItemEvent', 'BAG_ITEM_COUNT_CHANGE', 'onYearactiveChange'),
                     ('PropertyEvent', 'MAIN_LEVEL_CHANGE', 'onYearactiveChange')}
        for method, listener in ((6333, 'addEventListener'), (6377, 'removeEventListener')):
            a, size, _ = bodies[method]; ops = instructions(self.abc[False][a:a + size]); found = set()
            for i, op in enumerate(ops):
                if op.opcode == 0x4f and names[op.operands[0]] == listener and i >= 5:
                    block = ops[i - 5:i]
                    if [p.opcode for p in block] == [0x60, 0x60, 0x66, 0xd0, 0x66]:
                        found.add(tuple(names[block[j].operands[0]] for j in (1, 2, 4)))
            self.assertTrue(expected <= found)
        for method, callbacks in ((6353, (8122,)), (6437, (8171, 8122, 8174))):
            a, size, _ = bodies[method]; code = self.abc[False][a:a + size]
            for callback in callbacks:
                from patch_activity_reminders import call, get
                self.assertIn(call(get(0), callback, b'\x20', void=True), code)

    def test_scalar_statuses_are_unknown_until_the_first_server_reply(self):
        self.run_method(2720, self.hong)
        self.run_method(4078, self.year)
        self.assertEqual([self.hong[n] for n in ('hongLiLoginGet', 'hongLiEveryDayRechargeGet', 'hongLiTurnTime')],
                         [-1, -1, -1])
        self.assertEqual(self.year['rechargeStatu'], -1)

    def test_all_modified_bytecode_paths_have_balanced_stack_and_local_limits(self):
        # Explore the control-flow graph, including paths not taken by claim
        # scenarios; Flash verifies these paths before executing a method.
        for module, methods in ((False, (2648, 2720, 4078, 4080, 6333, 6334, 6335, 6353, 6357, 6377, 6379, 6380, 6382, 6403, 6408, 6437, 6497, 28528)),
                                (True, (7, 8, 9, 10, 11, 41))):
            names, _, bodies = self.symbols[module]
            for method in methods:
                a, size, limits = bodies[method]; ops = {o.start: o for o in instructions(self.abc[module][a:a + size])}
                pending = [(0, 0)]; seen = {}
                while pending:
                    pos, depth = pending.pop()
                    if pos in seen:
                        self.assertEqual(seen[pos], depth, (method, pos)); continue
                    seen[pos] = depth; op = ops[pos]; k, args = op.opcode, op.operands
                    consumed, added = 0, 0
                    if 0xd0 <= k <= 0xd3 or k in (0x60, 0x62, 0x20, 0x24, 0x25, 0x26, 0x27, 0x2c, 0x5d): added = 1
                    elif 0xd4 <= k <= 0xd7 or k in (0x63, 0x29, 0x30, 0x48): consumed = 1
                    elif k in (0x66, 0x61, 0x68):
                        dynamic = not names[args[0]]
                        consumed = (1 if k == 0x66 else 2) + dynamic; added = int(k == 0x66)
                    elif k in (0x46, 0x4f, 0x4e, 0x4a):
                        consumed = args[1] + 1; added = int(k in (0x46, 0x4a))
                    elif k in (0x49, 0x56): consumed = args[0] + int(k == 0x49); added = int(k == 0x56)
                    elif k == 0x2a: consumed, added = 1, 2
                    elif k in (0x73, 0x76, 0x80, 0x82, 0x85, 0x93, 0x96, 0xb2): consumed, added = 1, 1
                    elif k == 0x87: consumed, added = 2, 1
                    elif k in (0x1e, 0x23): consumed, added = 2, 1
                    elif k == 0x32: added = 1
                    elif k == 0x1b or k in (0x11, 0x12): consumed = 1
                    elif 0x0c <= k <= 0x1a and k != 0x10: consumed = 2
                    elif 0xa0 <= k <= 0xb1: consumed, added = 2, 1
                    elif k not in (0x09, 0x08, 0xc2, 0x47, 0x10):
                        self.fail(f'Unhandled verifier opcode {k:#x} in {method}')
                    self.assertGreaterEqual(depth, consumed, (method, pos))
                    new_depth = depth - consumed + added
                    self.assertLessEqual(new_depth, limits[0], (method, pos))
                    if k in (0x62, 0x63, 0x08, 0xc2): self.assertLess(args[0], limits[1])
                    if k in (0x47, 0x48): self.assertEqual(new_depth, 0); continue
                    targets = [t for _, t, _ in op.branches]
                    if k not in (0x10, 0x1b): targets.append(op.end)
                    pending.extend((target, new_depth) for target in targets)

    def test_all_activity_back_edges_have_flash_verifier_labels(self):
        for module, methods in ((False, (2648, 4080, 6334, 6335, 6403, 6497)), (True, (7, 8, 10))):
            for method in methods:
                a, size, _ = self.symbols[module][2][method]
                code = self.abc[module][a:a + size]
                for op in instructions(code):
                    for _, target, _ in op.branches:
                        if target <= op.start:
                            self.assertEqual(code[target], 0x09, (module, method, op.start, target))

    def test_previous_release_reproduces_invalid_loops_and_only_four_bodies_are_repaired(self):
        for module, path, expected in ((False, CLIENT, {2648, 4080, 6335}), (True, MODULE, {10})):
            previous = subprocess.check_output(['git', 'show', '5fd7a08:' + path.relative_to(ROOT).as_posix()], cwd=ROOT)
            raw, (_, _, a, b) = abc_section(previous); old, _ = normalize(raw[a:b])
            repaired = patch_swf(previous, module)
            release = subprocess.check_output(['git', 'show', '22bfbc8:' + path.relative_to(ROOT).as_posix()], cwd=ROOT)
            self.assertEqual(repaired, release)
            raw, (_, _, a, b) = abc_section(repaired); fixed, _ = normalize(raw[a:b])
            _, _, fixed_bodies = inspect_abc(fixed, 'HongLiActiveWin' if module else 'NavTopRightArea')
            _, _, bodies = inspect_abc(old, 'HongLiActiveWin' if module else 'NavTopRightArea')
            invalid = set(); changed = set()
            for method, (a, size, limits) in bodies.items():
                b, length, new_limits = fixed_bodies[method]
                before, after = old[a:a + size], fixed[b:b + length]
                if before == after and limits == new_limits: continue
                changed.add(method)
                self.assertEqual(limits, new_limits)
                self.assertEqual(mark_loop_targets(before)[0], after)
                known_targets = set()
                for op in instructions(before):
                    for _, target, _ in op.branches:
                        if target <= op.start and target not in known_targets and before[target] != 0x09:
                            invalid.add(method)
                        known_targets.add(target)
            self.assertEqual(invalid, expected)
            self.assertEqual(changed, expected)
            # Verifies ABC metadata, constant pools and every non-code SWF tag,
            # as well as upgrading the deployed version without duplicate edits.
            from patch_main_activity_reminders import patch_swf as main_entries
            self.assertEqual(repaired if module else main_entries(repaired), path.read_bytes())

    def test_loop_label_relocation_preserves_forward_backward_and_self_branches(self):
        c = Code(); c.add(b'\xd0\x30')
        c.branch(0x10, 'forward')
        c.label('loop'); c.add(b'\x02')
        c.label('forward'); c.branch(0x10, 'loop')
        c.label('self'); c.branch(0x10, 'self')
        c.add(b'\x47')
        for pos, name in c.branches:
            from patch_drop_pickup_retry import encode_s24
            c.code[pos:pos + 3] = encode_s24(c.labels[name] - pos - 3)
        before = bytes(c.code); after, moved = mark_loop_targets(before)
        new_ops = {o.start: o for o in instructions(after)}
        for op in instructions(before):
            pos = moved(op.start) + int(after[moved(op.start)] == 0x09)
            self.assertEqual(after[pos:pos + 1], before[op.start:op.start + 1])
            self.assertEqual(tuple(t for _, t, _ in new_ops[pos].branches),
                             tuple(moved(t) for _, t, _ in op.branches))
        self.assertEqual(moved(len(before)), len(after))
        self.assertEqual(mark_loop_targets(after)[0], after)
        self.assertEqual(c.finish(), after)

    def test_only_expected_methods_and_no_other_packaged_resources_change(self):
        from patch_main_activity_reminders import METHODS, patch_swf as main_entries
        expected = {False: {2648, 2720, 4078, 4080, 6333, 6335, 6353, 6377, 6380, 6382, 6437, 6497, 28528} | METHODS,
                    True: {7, 8, 9, 10, 11, 41}}
        for module in (False, True):
            _, _, old = inspect_abc(self.before[module], 'HongLiActiveWin' if module else 'NavTopRightArea')
            _, _, new = self.symbols[module]; changed = set()
            for m, (a, n, limits) in old.items():
                b, length, new_limits = new[m]
                if self.before[module][a:a + n] != self.abc[module][b:b + length] or limits != new_limits: changed.add(m)
            self.assertEqual(changed, expected[module])
            path = MODULE if module else CLIENT
            old_swf = baseline_swf(path)
            upgraded = patch_swf(old_swf, module)
            self.assertEqual(upgraded if module else main_entries(upgraded), path.read_bytes())
            self.assertEqual(patch_swf(path.read_bytes(), module), path.read_bytes())

    def test_client_server_and_language_pack_rewards_match(self):
        lua = LuaRuntime(unpack_returned_tuples=True)
        pack = dict(read_pack((ROOT / 'web/v2/lang/zh-cn/zh-cn.dat').read_bytes()))
        for name, file, var in (('SanRenHongLiCfg.cbp', 'activity/SanRenHongLiCfg.lua', 'SanRenHongLiCfg'),
                ('activity_DajiDaLi.cbp', 'new_activity/festival/activity_DaJiDaLi.lua', 'activity_DaJiDaLi'),
                ('oneyearactivitycfg.cbp', 'OneYearActivity.lua', 'OneYearActivityCfg')):
            source = (ROOT / 'web/v2/lang/zh-cn' / name).read_bytes()
            matches = [v for k, v in pack.items() if k.lower() == name.lower()]
            self.assertEqual(len(matches), 1)
            self.assertEqual(source, matches[0])
            lua.execute((ROOT / 'Server/S1001/data/config' / file).read_text('utf-8-sig'))
            server = lua.globals()[var]

            def verify(value, expected):
                if isinstance(value, list):
                    self.assertEqual(len(value), len(expected))
                    for i, child in enumerate(value): verify(child, expected[i + 1])
                elif isinstance(value, dict):
                    for key, child in value.items():
                        if key in ('id', 'count', 'bind', 'type', 'needPay', 'needYB', 'needMoney'):
                            verify(child, expected[key])
                        elif isinstance(child, (list, dict)) and expected[key] is not None:
                            verify(child, expected[key])
                elif isinstance(value, (int, bool)): self.assertEqual(value, expected)
            verify(self.configs[name], server)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__); parser.add_argument('--lua-path')
    args, rest = parser.parse_known_args()
    if args.lua_path: sys.path.insert(0, args.lua_path)
    from lupa.lua51 import LuaRuntime
    unittest.main(argv=[sys.argv[0], *rest])
