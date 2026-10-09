"""Execute shipped window lifecycle across reopen, selection and day changes."""
from __future__ import annotations

import subprocess
import sys
import unittest

from patch_activity_entries import strings_of
from patch_anniversary_reopen import (CLIENT, SLOTS, DISPLAY_IDS, METHODS, patch_swf,
                                     abc_section, normalize, inspect_abc, instructions,
                                     bytecode_requirements)
from test_activity_reminders import execute
from test_activity_reminders import config_value
from patch_guild_quest_config import read_cbp
from patch_anniversary_material_rebate import METHODS as MATERIAL_METHODS, patch_swf as material_page_patch
from patch_anniversary_day_refresh import METHODS as DAY_METHODS, patch_swf as day_patch

BASELINE = '658b049'


class ListState(dict):
    def __setitem__(self, key, value):
        super().__setitem__(key, value)
        if key == 'selectedIndex':
            super().__setitem__('selectedData', self['dataProvider'][value])


class Globals(dict):
    def get(self, key, default=None):
        owners = super().get('_owners', {})
        if key in owners: return owners[key].get(key, default)
        return super().get(key, default)


class ReopenTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        raw, (_, _, a, b) = abc_section(CLIENT.read_bytes())
        cls.abc, _ = normalize(raw[a:b]); cls.names, cls.classes, cls.bodies = inspect_abc(cls.abc)
        cls.strings = strings_of(cls.abc)

    def setUp(self):
        self.static = {'DAY_CHANGE': True}
        self.win = {'_list': ListState(selectedData=None), '_pageCtrl': [], '_cIndex': -1}
        self.pages = []; self.requests = []; self.listeners = set()
        self.globals = Globals(ACTIVITYS=self.static, Event={'CHANGE': 'change'},
                               CliffordCC={}, DataEventDispatcher={}, _owners={'DAY_CHANGE': self.static})
        for cls in ('YearActiveEvent', 'CliffordEvent', 'OtherEvent', 'PropertyEvent', 'DaJiDaLiEvent'):
            self.globals[cls] = {'class': cls}
        self.run_method(22157, self.static)
        self.globals['ACTIVITYS'] = self.static['ACTIVITYS']
        # Use the shipped page array, without unrelated UI construction.
        code = self.code(22158)
        end = next(o.end for o in instructions(code) if o.opcode == 0x68 and self.names[o.operands[0]] == 'PAGES')
        self.run_method(22158, end=end)

    def code(self, mid):
        start, size, _ = self.bodies[mid]
        return self.abc[start:start + size]

    def run_method(self, mid, obj=None, arg=None, **kw):
        return execute(self.code(mid), self.names, self.strings,
                       {0: self.win if obj is None else obj, 1: arg}, self.globals, self.invoke, **kw)

    def invoke(self, obj, name, args):
        if name == 'indexOf': return obj.index(args[0]) if args[0] in obj else -1
        if name == '__construct__':
            page = {'class': obj['class'], 'parent': None, 'visible': True, 'active': False, 'timer': False,
                    'updates': 0, 'inits': 0, 'removes': 0}
            self.pages.append(page); return page
        if name in ('onDayChange', 'onChange', 'createPage'):
            mid = self.classes['YearActiveWin']['instance'][name][0]
            return self.run_method(mid, obj, args[0] if args else None)[0]
        if name == 'addChild':
            args[0]['parent'] = obj; return
        if name == 'removeChild':
            args[0]['parent'] = None; return
        if name == 'initEvent':
            self.assertTrue(obj['visible'], 'Page must be visible before initialization/data callbacks')
            self.assertIs(obj['parent'], self.win, 'Page must be attached before data callbacks')
            self.assertTrue(any(p is obj for p in self.win['_pageCtrl']), 'Page must be cached before callbacks')
            self.assertFalse(obj['active'], 'Repeated open must not duplicate active page listeners')
            obj.update(active=True, timer=True, inits=obj['inits'] + 1); return
        if name == 'removeEvent':
            obj.update(active=False, timer=False, removes=obj['removes'] + 1); return
        if name == 'update':
            obj['updates'] += 1; return
        if name in ('addEventListener', 'removeEventListener'):
            def identity(value):
                return (value[0], value[1], id(value[2])) if isinstance(value, tuple) and len(value) == 3 else str(value)
            listener = (id(obj), identity(args[0]), identity(args[1]))
            if name == 'addEventListener': self.listeners.add(listener)
            else: self.listeners.discard(listener)
            return
        if name in ('sendYearActiveInfo', 'getjjActiveInfo', 'getHongLiInfo', 'sendDjdlInfo', 'sendQDActiveInfo'):
            self.requests.append((name, args)); return
        if name == 'move': obj['position'] = args; return

    def select(self, slot):
        self.win['_list']['selectedIndex'] = self.win['_list']['dataProvider'].index(self.static['ACTIVITYS'][slot])
        self.run_method(22162)
        page = self.win['_pageCtrl'][slot]
        self.assertTrue(page['visible']); self.assertTrue(page['active'])
        self.assertIs(page['parent'], self.win)
        self.assertEqual([472, 192], page['position'])
        return page

    def test_every_page_survives_twenty_close_open_cycles_and_selection(self):
        self.run_method(22159)
        original = {slot: self.select(slot) for slot in SLOTS}
        for _ in range(20):
            self.run_method(22160)
            self.assertFalse(self.listeners)
            for page in original.values():
                self.assertFalse(page['active']); self.assertFalse(page['timer'])
                self.assertIs(page['parent'], self.win)
            self.run_method(22159)
            for slot, page in original.items(): self.assertIs(self.select(slot), page)
            self.assertEqual(len(SLOTS), len(self.pages))
        self.assertFalse(any(name == 'sendYearActiveInfo' and args == [0, 9]
                             or name == 'sendQDActiveInfo' and args == [0, 12] for name, args in self.requests))

    def test_day_change_keeps_pages_and_selected_slot(self):
        self.run_method(22159); old = self.select(13)
        self.static['DAY_CHANGE'] = True; self.run_method(22163)
        new = self.select(13)
        self.assertIs(old, new); self.assertIs(old['parent'], self.win); self.assertTrue(old['active'])
        self.assertFalse(self.static['DAY_CHANGE'])
        self.assertEqual(list(DISPLAY_IDS), self.win['_list']['dataProvider'])

    def test_day_change_while_closed_reuses_only_selected_page(self):
        self.run_method(22159); old = self.select(12); self.run_method(22160)
        inits = old['inits']; self.static['DAY_CHANGE'] = True; self.run_method(22159)
        self.assertIs(old, self.win['_pageCtrl'][12]); self.assertEqual(inits + 1, old['inits'])
        self.assertIs(old['parent'], self.win); self.assertTrue(old['timer'])

    def test_fresh_window_initializes_when_shared_day_flag_is_already_false(self):
        self.static['DAY_CHANGE'] = False; self.run_method(22159)
        self.assertTrue(self.select(1)['visible'])

    def test_retired_navigation_fails_without_hiding_retained_content(self):
        self.run_method(22159); page = self.select(1)
        for slot in (8, 16):
            self.run_method(22165, arg=slot)
            self.assertIs(self.win['_pageCtrl'][1], page); self.assertTrue(page['visible'])

    def test_only_selected_page_is_active_and_hidden_pages_are_not_reinitialized(self):
        self.run_method(22159)
        original = {slot: self.select(slot) for slot in SLOTS}
        selected = self.select(4)
        before = {slot: page['inits'] for slot, page in original.items()}
        self.run_method(22160); self.run_method(22159)
        for slot, page in original.items():
            self.assertEqual(slot == 4, page['active'])
            self.assertEqual(slot == 4, page['visible'])
            self.assertEqual(before[slot] + (slot == 4), page['inits'])
        self.assertIs(selected, self.win['_pageCtrl'][4])

    def test_all_tabs_survive_repeated_midnights_and_week_rollover(self):
        self.run_method(22159)
        original = {slot: self.select(slot) for slot in SLOTS}
        for day in (2, 3, 4, 5, 6, 7, 1, 2):
            for slot in SLOTS:
                selected = self.select(slot)
                self.static['DAY_CHANGE'] = day % 2 == 0
                requests = len(self.requests)
                self.run_method(22163)
                self.assertIs(original[slot], selected)
                self.assertIs(selected, self.win['_pageCtrl'][slot])
                self.assertTrue(selected['visible']); self.assertTrue(selected['active'])
                self.assertEqual(slot, self.win['_cIndex'])
                self.assertEqual(1, sum(p['active'] for p in self.pages))
                self.assertEqual([('sendYearActiveInfo', [0, 2]), ('sendYearActiveInfo', [0, 8])],
                                 self.requests[requests:])
                self.assertTrue(all(p['parent'] is self.win for p in self.pages))
        self.assertEqual(len(SLOTS), len(self.pages))

    def test_hidden_page_initialization_failure_does_not_interrupt_reopen(self):
        self.run_method(22159); hidden = self.select(1); selected = self.select(4)
        self.run_method(22160)
        original = self.invoke
        def invoke(obj, name, args):
            if obj is hidden and name == 'initEvent': raise RuntimeError('Hidden login data unavailable')
            return original(obj, name, args)
        self.invoke = invoke
        self.run_method(22159)
        self.assertTrue(selected['visible']); self.assertTrue(selected['active'])
        self.assertFalse(hidden['active'])
        self.run_method(22160); self.assertFalse(self.listeners)

    def test_selected_page_stays_visible_when_refresh_callback_fails(self):
        self.run_method(22159); selected = self.select(12); self.select(4)
        original = self.invoke
        def invoke(obj, name, args):
            if obj is selected and name == 'initEvent': raise RuntimeError('Delayed material data')
            return original(obj, name, args)
        self.invoke = invoke
        with self.assertRaisesRegex(RuntimeError, 'Delayed material'):
            self.select(12)
        self.assertTrue(selected['visible']); self.assertIs(selected['parent'], self.win)
        self.assertEqual(12, self.win['_cIndex'])
        self.invoke = original
        self.assertIs(selected, self.select(12))

    def test_invalid_selection_preserves_current_content_and_listeners(self):
        self.run_method(22159); selected = self.select(4)
        for invalid in (None, 123456, self.static['ACTIVITYS'][8], self.static['ACTIVITYS'][16]):
            self.win['_list']['selectedData'] = invalid
            self.run_method(22162)
            self.assertEqual(4, self.win['_cIndex'])
            self.assertTrue(selected['visible']); self.assertTrue(selected['active'])

    def test_previous_release_exposes_hidden_init_and_detach_failures(self):
        before = subprocess.check_output(['git', 'show', '97bed66:web/GameFrame.swf'], cwd=CLIENT.parent.parent)
        raw, (_, _, a, b) = abc_section(before); old, _ = normalize(raw[a:b])
        _, _, bodies = inspect_abc(old)
        saved_code, saved_invoke = self.code, self.invoke
        self.run_method(22159); hidden = self.select(1); selected = self.select(4)
        self.run_method(22160)
        def old_code(mid):
            start, size, _ = bodies[mid]; return old[start:start + size]
        def fail_hidden(obj, name, args):
            if obj is hidden and name == 'initEvent': raise RuntimeError('Hidden login data unavailable')
            return saved_invoke(obj, name, args)
        try:
            self.code = old_code; self.invoke = fail_hidden
            with self.assertRaisesRegex(RuntimeError, 'Hidden login'):
                self.run_method(22159)
            self.assertFalse(selected['active'])
            self.code = saved_code
            self.run_method(22159); self.assertTrue(selected['active'])
            def fail_detach(obj, name, args):
                if name == 'removeChild': raise RuntimeError('Removed sprite stage unavailable')
                return saved_invoke(obj, name, args)
            self.invoke = fail_detach; self.static['DAY_CHANGE'] = True
            self.code = old_code
            with self.assertRaisesRegex(RuntimeError, 'stage unavailable'):
                self.run_method(22163)
            self.code = saved_code; self.static['DAY_CHANGE'] = True
            self.run_method(22163)
            self.assertTrue(selected['visible']); self.assertTrue(selected['active'])
        finally:
            self.code, self.invoke = saved_code, saved_invoke

    def test_midnight_patch_changes_only_five_window_methods_from_current_release(self):
        before = subprocess.check_output(['git', 'show', '97bed66:web/GameFrame.swf'], cwd=CLIENT.parent.parent)
        self.assertEqual(CLIENT.read_bytes(), day_patch(before))
        self.assertEqual(CLIENT.read_bytes(), day_patch(CLIENT.read_bytes()))
        raw, (_, _, a, b) = abc_section(before); old, _ = normalize(raw[a:b]); _, _, bodies = inspect_abc(old)
        changed = {mid for mid, (start, size, limits) in bodies.items()
                   if old[start:start + size] != self.code(mid) or limits != self.bodies[mid][2]}
        self.assertEqual(DAY_METHODS, changed)

    def test_reported_pages_execute_real_init_callbacks_and_cleanup_across_midnight(self):
        cfg_dir = CLIENT.parent / 'v2/lang/zh-cn'
        configs = {name: config_value(read_cbp((cfg_dir / name).read_bytes())[1])
                   for name in ('oneyearactivitycfg.cbp', 'activityjingji.cbp', 'SanRenHongLiCfg.cbp')}
        year = {'curDay': 1, 'totalDay': 7, 'loginDay': 1, 'loginStatus': [0] * 7}
        hong = {'jingjiFanliUseNum': [0] * 4, 'jingJiFanliGet': [[0] * 15 for _ in range(4)],
                'hongLiRank': [], 'hongLiMyRank': 0, 'hongLiMyRecharge': 0, 'hongLiTurnTime': 0}
        self.globals.update(GlobalData={'yearAcitveDataMgr': year, 'cliffordDataMgr': hong,
                                        'itemDataMgr': {'curPayGold': 0}},
                            GameData={'jingji2Provider': {'cfg': configs['activityjingji.cbp']},
                                      'oneYearActiveProvider': {'data': configs['oneyearactivitycfg.cbp']}},
                            GlobalFunc={}, MouseEvent={'CLICK': 'click'}, TimerEvent={'TIMER': 'timer'},
                            Math={})
        self.globals['_owners']['_type'] = {'_type': 6}
        initializers = {'YearActiveLoginPage': 18100, 'HongLiTreasurePage': 15769,
                        'AnniversaryHongLiTurnPage': 29899, 'JingjiFanLiPage': 15826}
        removers = {'YearActiveLoginPage': 18101, 'HongLiTreasurePage': 15770,
                    'AnniversaryHongLiTurnPage': 29900, 'JingjiFanLiPage': 15827}
        original = self.invoke
        def invoke(obj, name, args):
            if name == '__construct__':
                if obj['class'] in ('QuestAward', 'Object'): return {}
                page = original(obj, name, args)
                if page['class'] == 'YearActiveLoginPage':
                    page.update(_loginCells=[{'cell': i} for i in range(7)], _getIndex=0,
                                _btn={}, _mdpmovie_0={}, _image_4={}, _timeLab={}, _grid={})
                elif page['class'] == 'HongLiTreasurePage':
                    page.update(_cells=[{} for _ in range(10)], _label_1={}, _label_11={}, _label_12={},
                                _image_1={}, _image_2={}, _image_3={}, _fNameLab={}, _sNameLab={}, _tNameLab={})
                elif page['class'] == 'AnniversaryHongLiTurnPage':
                    page.update(_btn={}, _timer={}, _cfg=configs['SanRenHongLiCfg.cbp']['LuckeyZhuanPan'],
                                _label_1={}, _label_2={}, _label_3={}, _label_4={}, _label_5={})
                elif page['class'] == 'JingjiFanLiPage':
                    page.update(_label_8={}, _tabBar={'selectedIndex': 0}, _selectIndex=0,
                                mark=[{} for _ in range(4)], _list={})
                else: raise AssertionError(f'Unexpected page class {page["class"]}')
                return page
            if name in ('initEvent', 'removeEvent') and isinstance(obj, dict) and 'cell' in obj: return
            if name in ('initEvent', 'removeEvent') and obj.get('class') in initializers:
                original(obj, name, args)
                if obj['class'] == 'YearActiveLoginPage':
                    self.run_method(17215 if name == 'initEvent' else 17216, obj)
                return self.run_method((initializers if name == 'initEvent' else removers)[obj['class']], obj)[0]
            if name in ('infoBack', 'getCurDay', 'getStatu', 'getCfg', 'setSelect', 'init', 'updateTime', 'updateInfo'):
                if name == 'getCfg' and obj.get('class') is None: return obj['cfg']
                mid = self.classes[obj['class']]['instance'][name][0]
                return self.run_method(mid, obj, args[0] if args else None)[0]
            if name == 'min': return min(args)
            if name == 'getServerTime': return 1
            if name == 'getUseTime': return str(args[1])
            if name == 'hasGetAward': obj['status'] = args[0]; return
            if name == 'getChildAt': return {}
            if name == 'setData': obj.setdefault('rewards', {})[args[0]] = args[1]; return
            if name == 'stop': obj['stopped'] = True; return
            return original(obj, name, args)
        self.invoke = invoke
        self.run_method(22159)
        original_pages = {slot: self.select(slot) for slot in (1, 4, 12, 13)}
        for day in (2, 7, 1):
            year['curDay'] = day
            # Keep the previous login packet until the current-day reply arrives.
            year['loginStatus'] = [1] * 7
            for slot, page in original_pages.items():
                self.assertIs(page, self.select(slot))
                before = len(self.requests)
                self.static['DAY_CHANGE'] = True; self.run_method(22163)
                requests = self.requests[before:]
                self.assertIn(('sendYearActiveInfo', [0, 2]), requests)
                if slot == 4:
                    self.assertIn(('getHongLiInfo', [0, 6]), requests)
                    self.run_method(15773, page, {})
                    self.assertIn('未上榜', page['_label_12']['caption'])
                elif slot == 13:
                    self.assertIn(('getHongLiInfo', [0, 4]), requests)
                    hong['hongLiTurnTime'] = 0; self.run_method(29903, page, {})
                    self.assertIn('当前剩余次数', page['_label_4']['caption'])
                elif slot == 12:
                    self.assertEqual({6, 7, 8, 9}, {args[0] for name, args in requests if name == 'getjjActiveInfo'})
                    for message in (6, 7, 8, 9): self.run_method(15829, page, {'data': message})
                    self.assertEqual(15, len(page['_list']['dataProvider']))
                else:
                    year.update(loginDay=day, loginStatus=[0] * 7)
                    self.run_method(18102, page, {})
                    self.assertTrue(page['_grid']['rewards']); self.assertEqual(0, page['_getIndex'])
                self.assertTrue(page['visible']); self.assertTrue(page['active'])
                self.run_method(22160); self.assertFalse(self.listeners)
                self.assertTrue(all(not p['active'] for p in self.pages))
                self.run_method(22159); self.assertIs(page, self.win['_pageCtrl'][slot])

    def test_patch_preserves_all_artwork_other_methods_and_flash_limits(self):
        before = subprocess.check_output(['git', 'show', BASELINE + ':web/GameFrame.swf'], cwd=CLIENT.parent.parent)
        self.assertEqual(CLIENT.read_bytes(), day_patch(material_page_patch(patch_swf(before))))
        self.assertEqual(CLIENT.read_bytes(), patch_swf(CLIENT.read_bytes()))
        raw, (_, _, a, b) = abc_section(before); old, _ = normalize(raw[a:b]); _, _, bodies = inspect_abc(old)
        changed = set()
        for mid, (start, length, limits) in bodies.items():
            now, size, current = self.bodies[mid]
            if old[start:start + length] != self.abc[now:now + size] or current != limits: changed.add(mid)
        self.assertEqual(METHODS | MATERIAL_METHODS | DAY_METHODS, changed)
        self.assertEqual(strings_of(old), self.strings)
        for mid in METHODS | DAY_METHODS:
            limits = self.bodies[mid][2]
            required = bytecode_requirements(self.code(mid), self.names, limits[2])
            for have, need in zip((limits[0], limits[1], limits[3]), required): self.assertGreaterEqual(have, need)


if __name__ == '__main__':
    unittest.main(verbosity=2)
