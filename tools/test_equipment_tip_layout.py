"""Execute shipped tooltip bytecode to check direct and backpack callers."""
from __future__ import annotations

import subprocess
import unittest

from patch_activity_entries import strings_of
from patch_drop_pickup_retry import abc_section, instructions
from patch_equipment_tip_layout import BASELINE, CLIENT, ROOT, patch_swf
from patch_god_equip_state import inspect_abc
from test_activity_reminders import execute


class EquipmentTipLayoutTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.original = subprocess.check_output(
            ['git', 'show', BASELINE + ':web/GameFrame.swf'], cwd=ROOT)
        cls.current = CLIENT.read_bytes()
        cls.patched = patch_swf(cls.original)

    def setUp(self):
        self.use_swf(self.current)
        self.panel = {'children': [], '_container': {}, 'PANEL_SPACE': 10}
        for i in range(1, 4):
            self.panel['_panel' + str(i)] = {
                'x': 0, 'y': 0, 'uiWidth': 280, 'parent': None, 'tipText': ''}
        self.panel['_panel1']['parent'] = self.panel
        self.panel['children'].append(self.panel['_panel1'])

    def use_swf(self, source):
        data, (_, _, start, end) = abc_section(source)
        self.abc = data[start:end]
        self.names, self.methods, self.bodies = inspect_abc(self.abc, 'GameItemTipsPanel')
        self.strings = strings_of(self.abc)

    def run_code(self, name, *args):
        start, length, limits = self.bodies[self.methods[name][0]]
        code = self.abc[start:start + length]
        for op in instructions(code):
            if 0xd0 <= op.opcode <= 0xd7:
                self.assertLess((op.opcode - 0xd0) % 4, limits[1])
            if op.opcode in (0x62, 0x63):
                self.assertLess(op.operands[0], limits[1])
        globals_ = {'GameItemTips': {'SEPERATOR': '||||'}, 'ComUtils': {},
                    'addChild': self.panel, 'PANEL_SPACE': self.panel['PANEL_SPACE']}
        value, maximum = execute(code, self.names, self.strings,
                                 dict(enumerate((self.panel, *args))), globals_, self.invoke)
        self.assertLessEqual(maximum, limits[0], name)
        return value

    def invoke(self, obj, name, args):
        if name == 'split':
            return obj.split(args[0])
        if name == 'max':
            return max(args)
        if name in ('layoutDlg', 'updateLayout'):
            return self.run_code(name, *args)
        if name == 'clear':
            if obj is self.panel:
                for i in (2, 3):
                    section = obj['_panel' + str(i)]
                    obj['children'][:] = [v for v in obj['children'] if v is not section]
                    section['parent'] = None
                for i in (1, 2, 3):
                    obj['_panel' + str(i)]['tipText'] = ''
            return
        if name == 'addChild':
            args[0]['parent'] = obj
            obj['children'].append(args[0])
            return
        if name == 'addToParent':
            args[0]['parent'] = args[1]
            return
        if name == 'hide':
            self.panel['parent'] = None
            return
        if name == 'getBounds':
            self.assertIs(obj, args[0])
            return {'right': max(v['x'] + v['uiWidth'] for v in self.visible())}
        raise ValueError((name, args))

    def visible(self):
        return [self.panel['_panel' + str(i)] for i in (1, 2, 3)
                if self.panel['_panel' + str(i)]['parent'] is self.panel]

    def assert_no_overlap(self):
        sections = sorted(self.visible(), key=lambda v: v['x'])
        for left, right in zip(sections, sections[1:]):
            self.assertGreaterEqual(right['x'], left['x'] + left['uiWidth'])
        self.assertTrue(all(v['y'] == 0 for v in sections))

    def test_original_direct_show_reproduces_overlapping_equipment_and_fate(self):
        self.use_swf(self.original)
        self.run_code('show', '掉落装备||||命格信息')
        self.assertEqual([0, 0], [v['x'] for v in self.visible()])

    def test_direct_show_with_one_two_or_three_sections(self):
        for text in ('装备', '掉落装备||||命格信息', '背包装备||||身上装备||||命格信息'):
            with self.subTest(text=text):
                self.run_code('show', text)
                self.assertEqual(text.split('||||'), [v['tipText'] for v in self.visible()])
                self.assert_no_overlap()

    def test_widths_and_repeated_direct_show_after_leftward_backpack_layout(self):
        for widths in ((180, 300, 240), (480, 140, 390)):
            for i, width in enumerate(widths, 1):
                self.panel['_panel' + str(i)]['uiWidth'] = width
            for _ in range(5):
                self.run_code('show', '背包装备||||身上装备||||命格信息')
                self.run_code('layoutDlg', False)
                self.assert_no_overlap()
                self.assertLess(self.panel['_panel1']['x'], 0)
                self.run_code('show', '通知装备||||命格信息')
                self.assertEqual(2, len(self.visible()))
                self.assertEqual(10, self.panel['_panel1']['x'])
                self.assert_no_overlap()
                self.run_code('show', '装备')
                self.assertEqual(1, len(self.visible()))

    def test_backpack_can_still_choose_both_layout_directions(self):
        for direction in (True, False):
            self.run_code('show', '背包装备||||身上装备||||命格信息')
            self.run_code('layoutDlg', direction)
            self.assert_no_overlap()
            for i in (1, 2, 3):
                self.assertEqual(direction, self.panel['_panel' + str(i)]['x'] > 0)

    def test_empty_show_still_hides(self):
        self.run_code('show', '装备||||命格信息')
        self.run_code('show', '')
        self.assertIsNone(self.panel['parent'])

    def test_links_keep_all_columns_visible_at_the_right_edge_while_moving(self):
        _, methods, _ = inspect_abc(self.abc, 'GameRichFiled')
        stage = {'stageWidth': 1280, 'stageHeight': 720}
        self.panel['height'] = 200
        self.panel['width'] = 280
        for text in ('装备', '掉落装备||||命格信息', '装备||||对比装备||||命格信息'):
            self.run_code('show', text)
            for name, entry in (('onOver', 132), ('onMove', 110)):
                for x in (100, 800, 1200):
                    with self.subTest(text=text, event=name, x=x):
                        start, length, limits = self.bodies[methods[name][0]]
                        _, maximum = execute(self.abc[start:start + length], self.names, self.strings,
                                             {0: {'stage': stage}, 3: {'x': x, 'y': 100}},
                                             {'_tipSp': self.panel, 'stage': stage}, self.invoke, start=entry)
                        self.assertLessEqual(maximum, limits[0])
                        self.assert_no_overlap()
                        for v in self.visible():
                            self.assertGreaterEqual(self.panel['x'] + v['x'], 0)
                            self.assertLessEqual(self.panel['x'] + v['x'] + v['uiWidth'], 1280)

    def test_only_layout_and_link_boundaries_change_and_patch_is_repeatable(self):
        self.assertEqual(self.patched, patch_swf(self.patched))
        self.assertEqual(self.current, patch_swf(self.current))
        before, before_tag = abc_section(self.original)
        after, after_tag = abc_section(self.current)
        self.assertEqual(before[:4], after[:4])
        self.assertEqual(before[8:before_tag[0]], after[8:after_tag[0]])
        self.assertEqual(before[before_tag[1]:before_tag[2]],
                         after[after_tag[1]:after_tag[2]])
        self.assertEqual(before[before_tag[3]:], after[after_tag[3]:])
        old_abc = before[before_tag[2]:before_tag[3]]
        new_abc = after[after_tag[2]:after_tag[3]]
        _, old_methods, old_bodies = inspect_abc(old_abc, 'GameItemTipsPanel')
        _, new_methods, new_bodies = inspect_abc(new_abc, 'GameItemTipsPanel')
        self.assertEqual(old_methods, new_methods)
        method = old_methods['show'][0]
        _, links, _ = inspect_abc(old_abc, 'GameRichFiled')
        changed_methods = {method, links['onOver'][0], links['onMove'][0]}
        first_start, _, _ = old_bodies[min(changed_methods)]
        self.assertEqual(old_abc[:first_start - 2], new_abc[:first_start - 2])
        self.assertEqual(set(old_bodies), set(new_bodies))
        for index in old_bodies:
            old_start, old_length, old_limits = old_bodies[index]
            new_start, new_length, new_limits = new_bodies[index]
            self.assertEqual(old_limits, new_limits)
            if index not in changed_methods:
                self.assertEqual(old_abc[old_start:old_start + old_length],
                                 new_abc[new_start:new_start + new_length])
        self.assertEqual(self.patched, self.current)


if __name__ == '__main__':
    unittest.main()
