"""Verify four native material marks, independent claims and page reentry."""
from __future__ import annotations

from patch_activity_window_lifecycle import MAIN_METHODS as WINDOW_METHODS, patch_swf as window_lifecycle

from itertools import product
import subprocess
import sys
import unittest

from patch_activity_reminders import CLIENT, ROOT, normalize
from patch_drop_pickup_retry import abc_section, instructions
from patch_god_equip_state import inspect_abc
from patch_jingji_material_tabs import BASELINE, METHODS, MARKS, SLOT, create_marks, page_traits, patch_swf, refresh_marks
from test_jingji_material_reminders import JingjiMaterialReminderTests, KEYS


class JingjiMaterialTabTests(JingjiMaterialReminderTests):
    def setUp(self):
        super().setUp()
        self.buttons = [{'width': 120, 'children': []} for _ in KEYS]
        self.page = {'_tabBar': {'selectedIndex': 0}, '_selectIndex': 0, '_list': {}}
        self.objects = []; self.native_events = []
        self.globals['JingjiFanLiPage'] = self.globals['_type'] = {}
        self.globals['Event'] = {'CHANGE': 'change'}

    def invoke(self, obj, name, args):
        if name == 'getButton': return self.buttons[args[0]]
        if name == 'addChild': obj['children'].append(args[0]); return
        if name == '__construct__' and not args:
            value = {'class': obj['class']}
            if obj['class'] == 'PlaintMark': self.objects.append(value)
            return value
        if name in ('addEventListener', 'removeEventListener'):
            self.native_events.append((name, args)); return
        if name == 'int': return int(args[0] or 0)
        if name == 'setSelect':
            self.run_code(15828, obj, args[0], end=165)
            return self.invoke({}, 'getjjActiveInfo', [self.globals['_type']['_type'], 1])
        if name == 'getjjActiveInfo':
            self.requests.append(args)
            # Simulate replies from a server without mutating the requested flags.
            msg = args[0]; event = {'type': 'material', 'data': msg}
            self.run_code(15829, self.page, event); return
        if name == 'dispatchEvent':
            result = super().invoke(obj, name, args)
            if 'mark' not in self.page: self.create()
            self.run_code(15829, self.page, args[0]); return result
        return super().invoke(obj, name, args)

    def create(self):
        a, size, _ = self.bodies[15825]
        self.run_code(15825, self.page, start=size - len(create_marks()) - 1)

    def refresh_tabs(self):
        if 'mark' not in self.page: self.create()
        self.run_code(15829, self.page, {'data': 6})
        return tuple(mark['visible'] for mark in self.page['mark'])

    def test_four_native_marks_are_created_once_at_their_buttons(self):
        self.create()
        self.assertEqual(['PlaintMark'] * 4, [v['class'] for v in self.objects])
        for button, mark in zip(self.buttons, self.page['mark']):
            self.assertEqual([mark], button['children'])
            self.assertEqual((102, -6, False), (mark['x'], mark['y'], mark['visible']))
        self.run_code(15829, self.page, {'data': 6})
        self.run_code(15829, self.page, {'data': 9})
        self.assertEqual(4, len(self.objects))

    def test_all_four_mark_combinations_are_independent_of_selected_project(self):
        self.mgr['jingjiFanliUseNum'] = [999999] * 4
        for available, selected in product(product((False, True), repeat=4), range(4)):
            self.mgr['jingJiFanliGet'] = [[0 if ready else 1] * 5 for ready in available]
            self.page['_selectIndex'] = self.page['_tabBar']['selectedIndex'] = selected
            self.assertEqual(available, self.refresh_tabs(), (available, selected))
            self.assertEqual((any(available), any(available)), self.refresh())

    def test_each_material_tier_matches_entry_native_parent_and_claim_button(self):
        for tier, key in enumerate(KEYS):
            for index, row in enumerate(self.cfg[key]):
                for count, status in product((row['count'] - 1, row['count'], row['count'] + 1), (0, 1)):
                    self.mgr['jingjiFanliUseNum'] = [0] * 4; self.mgr['jingjiFanliUseNum'][tier] = count
                    self.mgr['jingJiFanliGet'] = [[1] * 5 for _ in KEYS]
                    self.mgr['jingJiFanliGet'][tier][index] = status
                    expected = count >= row['count'] and status == 0
                    self.assertEqual(tuple(expected if i == tier else False for i in range(4)), self.refresh_tabs())
                    self.assertEqual((expected, expected), self.refresh())

    def test_page_reentry_refreshes_all_four_projects_and_queries_other_three(self):
        self.create(); self.mgr['jingjiFanliUseNum'] = [999999] * 4
        self.mgr['jingJiFanliGet'] = [[0] * 5 for _ in KEYS]
        self.globals['GlobalFunc'] = {}
        # Run the page activation after its existing countdown caption.
        self.run_code(15826, self.page, start=77)
        self.assertEqual([[6, 1], [7, 1], [9, 1], [8, 1]], self.requests)
        self.assertEqual((True,) * 4, self.refresh_tabs())
        self.mgr['jingJiFanliGet'] = [[1] * 5 for _ in KEYS]
        self.run_code(15827, self.page)
        self.page['_tabBar']['selectedIndex'] = 2
        self.requests.clear(); self.run_code(15826, self.page, start=77)
        self.assertEqual([[9, 1], [6, 1], [7, 1], [8, 1]], self.requests)
        self.assertEqual((False,) * 4, self.refresh_tabs())
        self.assertEqual(4, len(self.objects))
        self.assertEqual(['addEventListener', 'addEventListener', 'removeEventListener',
                          'removeEventListener', 'addEventListener', 'addEventListener'],
                         [name for name, _ in self.native_events])

    def test_missing_claim_states_and_closed_activity_clear_all_four(self):
        self.create(); self.mgr['jingjiFanliUseNum'] = [999999] * 4
        for flags in ([[], [], [], []], [None] * 4, [[1] * 5 for _ in KEYS]):
            self.mgr['jingJiFanliGet'] = flags
            for mark in self.page['mark']: mark['visible'] = True
            self.assertEqual((False,) * 4, self.refresh_tabs())
        self.mgr['jingJiFanliGet'] = [[0] * 5 for _ in KEYS]
        for field, value in (('activeType', 1), ('activeNow', 4), ('jingJiFanliGet', None)):
            old = self.mgr[field]; self.mgr[field] = value
            self.assertEqual((False,) * 4, self.refresh_tabs()); self.mgr[field] = old

    def test_resource_scope_and_existing_event_listeners(self):
        source = subprocess.check_output(['git', 'show', BASELINE + ':web/GameFrame.swf'], cwd=ROOT)
        self.assertEqual(self.source, window_lifecycle(patch_swf(source))); self.assertEqual(self.source, patch_swf(self.source))
        raw, (_, _, a, b) = abc_section(source); before, _ = normalize(raw[a:b]); _, _, old = inspect_abc(before)
        changed = set()
        for mid, (a, size, limits) in old.items():
            b, length, after_limits = self.bodies[mid]
            if before[a:a + size] != self.abc[b:b + length] or limits != after_limits: changed.add(mid)
        self.assertEqual(METHODS | WINDOW_METHODS, changed)
        lo, hi, count, fields = page_traits(before); new_lo, new_hi, new_count, new_fields = page_traits(self.abc)
        self.assertEqual((count + 1, fields + [MARKS]), (new_count, new_fields))
        self.assertTrue(self.abc[new_lo:new_hi].endswith(SLOT))
        for mid in changed:
            a, size, limits = self.bodies[mid]; code = self.abc[a:a + size]
            for op in instructions(code):
                if op.opcode in (0x62, 0x63, 0xc2): self.assertLess(op.operands[0], limits[1])
                for _, target, _ in op.branches:
                    if target <= op.start: self.assertEqual(0x09, code[target])
        for path in ('Server/S1001/data/config/new_activity/festival/activity_jingji.lua',
                     'web/v2/lang/zh-cn/activityjingji.cbp', 'web/v2/lang/zh-cn/zh-cn.dat'):
            self.assertEqual(subprocess.check_output(['git', 'show', BASELINE + ':' + path], cwd=ROOT),
                             (ROOT / path).read_bytes(), path)


if __name__ == '__main__':
    import argparse
    parser = argparse.ArgumentParser(); parser.add_argument('--lua-path'); args = parser.parse_args()
    if args.lua_path: sys.path.insert(0, args.lua_path)
    unittest.main(argv=[sys.argv[0]], defaultTest='JingjiMaterialTabTests', verbosity=2)
