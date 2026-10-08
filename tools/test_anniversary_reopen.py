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

BASELINE = '658b049'


class ListState(dict):
    def __setitem__(self, key, value):
        super().__setitem__(key, value)
        if key == 'selectedIndex':
            super().__setitem__('selectedData', self['dataProvider'][value])


class Globals(dict):
    def get(self, key, default=None):
        if key == 'DAY_CHANGE': return super().get('_owners')['DAY_CHANGE']['DAY_CHANGE']
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

    def test_day_change_rebuilds_pages_and_keeps_selected_slot(self):
        self.run_method(22159); old = self.select(13)
        self.static['DAY_CHANGE'] = True; self.run_method(22163)
        new = self.select(13)
        self.assertIsNot(old, new); self.assertIsNone(old['parent']); self.assertFalse(old['active'])
        self.assertFalse(self.static['DAY_CHANGE'])
        self.assertEqual(list(DISPLAY_IDS), self.win['_list']['dataProvider'])

    def test_day_change_while_closed_rebuilds_without_reactivating_discarded_pages(self):
        self.run_method(22159); old = self.select(12); self.run_method(22160)
        inits = old['inits']; self.static['DAY_CHANGE'] = True; self.run_method(22159)
        self.assertIsNot(old, self.select(12)); self.assertEqual(inits, old['inits'])
        self.assertIsNone(old['parent']); self.assertFalse(old['timer'])

    def test_fresh_window_initializes_when_shared_day_flag_is_already_false(self):
        self.static['DAY_CHANGE'] = False; self.run_method(22159)
        self.assertTrue(self.select(1)['visible'])

    def test_retired_navigation_fails_without_hiding_retained_content(self):
        self.run_method(22159); page = self.select(1)
        for slot in (8, 16):
            self.run_method(22165, arg=slot)
            self.assertIs(self.win['_pageCtrl'][1], page); self.assertTrue(page['visible'])

    def test_patch_preserves_all_artwork_other_methods_and_flash_limits(self):
        before = subprocess.check_output(['git', 'show', BASELINE + ':web/GameFrame.swf'], cwd=CLIENT.parent.parent)
        self.assertEqual(CLIENT.read_bytes(), patch_swf(before))
        self.assertEqual(CLIENT.read_bytes(), patch_swf(CLIENT.read_bytes()))
        raw, (_, _, a, b) = abc_section(before); old, _ = normalize(raw[a:b]); _, _, bodies = inspect_abc(old)
        changed = set()
        for mid, (start, length, limits) in bodies.items():
            now, size, current = self.bodies[mid]
            if old[start:start + length] != self.abc[now:now + size] or current != limits: changed.add(mid)
        self.assertEqual(METHODS, changed)
        self.assertEqual(strings_of(old), self.strings)
        for mid in METHODS:
            limits = self.bodies[mid][2]
            required = bytecode_requirements(self.code(mid), self.names, limits[2])
            for have, need in zip((limits[0], limits[1], limits[3]), required): self.assertGreaterEqual(have, need)


if __name__ == '__main__':
    unittest.main(verbosity=2)
