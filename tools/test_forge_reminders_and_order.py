"""Execute forge button creation, navigation and reminder callbacks from the SWF."""
from itertools import product
import subprocess
import unittest

from patch_activity_reminders import normalize, relocate
from patch_appearance_upgrade import inspect_abc, pools
from patch_drop_pickup_retry import abc_section, instructions
from patch_forge_combin_tab_reminder import patch_swf as patch_reminders
from patch_merge_feature_gates import CLIENT, ROOT, TITLE, patch_main
from test_activity_reminders import execute
import test_merge_feature_gates as feature_tests


BASELINE = 'b5c4d0625ce4ca86a5a088dfe8ee1076fe356893'


class ForgeTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        data, (_, _, a, b) = abc_section(CLIENT.read_bytes())
        cls.abc, _ = normalize(data[a:b])
        cls.names, cls.classes, cls.bodies = inspect_abc(cls.abc)
        cls.strings = pools(cls.abc)['strings'][3]
        feature_tests.ClientTests.setUpClass()

    def run_method(self, mid, obj, args=(), globals_=None, invoke=None):
        start, size, limits = self.bodies[mid]
        code = self.abc[start:start + size]
        # The shared executor lacks nop and decrement_i. On these integer
        # counters decrement has identical behavior and instruction width.
        code, _ = relocate(code, [(op.start, op.end,
                                  b'\x93' if op.opcode == 0xc1 else b'')
                                 for op in instructions(code)
                                 if op.opcode in (2, 0xc1)])
        result, maximum = execute(code, self.names, self.strings,
                                  {0: obj, **dict(enumerate(args, 1))},
                                  globals_ or {}, invoke or (lambda *a: None))
        self.assertLessEqual(maximum, limits[0])
        return result

    def test_every_visible_button_opens_its_named_page_and_ornament_is_last(self):
        fixture = feature_tests.ClientTests()
        titles = dict(zip(('EquipBoostStrengthenPage2', 'EquipBoostCombinPage',
                           'EquipSlotNestPage', 'NoteSoulPage',
                           'EquipBoostZhuLingPage', 'EquipBoostWuXingPage',
                           'EquipBoostFuHunPage', 'EquipBoostOrnamentPage'),
                          ('强化', '合成', '镶嵌', '注魂', '注灵', '五行', '附魂', '饰品')))
        for day, circle, level in product((1, 6, 7, 8, 30), (0, 3, 5), (1, 80)):
            with self.subTest(day=day, circle=circle, level=level):
                obj, globals_ = fixture.catalog(day, circle, level)
                entries = [entry['class'] for entry in obj['m_pageClass']]
                pages = [{'class': name, 'caption': caption}
                         for name, caption in zip(entries, obj['m_pageCaptions'])]
                control = {'pageCount': len(pages), 'activePageIndex': 0}
                nav = {'m_PageControl': None, 'buttonCount': 0, 'children': []}

                def invoke(target, name, values):
                    if name == 'getPage': return pages[values[0]]
                    if name == '__construct__': return {'class': 'CustomButton'}
                    if name == 'addChild':
                        nav['children'].append(values[0])
                        nav['buttonCount'] += 1
                    if name == 'getChildIndex': return nav['children'].index(values[0])

                # Execute CustomNavigateBar.pageControl, which creates buttons
                # from pages in reverse order, rather than inferring the UI.
                self.run_method(4959, nav, (control,), invoke=invoke)
                for index, button in enumerate(nav['children']):
                    expected = titles[entries[index]]
                    self.assertEqual(button['caption'],
                                     "<textformat leading='7'>" + expected[0]
                                     + '<BR>' + expected[1] + '</textformat>')
                    nav['selectedIndex'] = -1
                    click_globals = {'m_PageControl': control, 'm_nSelectedIndex': -1,
                                     'getChildIndex': nav}
                    self.run_method(18238, nav, ({'target': button},),
                                    click_globals, invoke)
                    self.assertEqual(nav['selectedIndex'], index)
                    # Execute the page controller's visibility switch with the
                    # index selected by the actual button mouse-down handler.
                    self.run_method(14413, control, (nav['selectedIndex'],),
                                    {'numChildren': len(pages)},
                                    lambda target, name, values: pages[values[0]]
                                    if name == 'getChildAt' else None)
                    self.assertEqual([page['class'] for page in pages if page['visible']],
                                     [entries[index]])
                self.assertEqual(nav['children'][-1]['caption'], TITLE)
                obj['m_navBar'] = nav
                fixture.run_method(6173, obj, globals_, (10000,))
                self.assertEqual(obj['selectedIndex'], len(entries) - 1)

    def test_entry_clears_stale_marks_without_querying_synthesis(self):
        for can_combine, old_mark in product((False, True), repeat=2):
            button = {'visible': old_mark}
            calls = []

            def invoke(target, name, values):
                calls.append(name)
                if name == 'setTxt': target['visible'] = values[0]
                if name == 'isCanCombin': return can_combine

            self.run_method(24442, {'_equipBoostBtn': button},
                            globals_={'GlobalData': {'itemDataMgr': {}}}, invoke=invoke)
            self.assertFalse(button['visible'])
            self.assertEqual(calls, ['setTxt'])

    def test_opening_keeps_page_marks_and_zhuling_mark_but_hides_combin_tab(self):
        pages = [{'class': name} for name in ('EquipBoostCombinPage',
                                             'EquipBoostZhuLingPage',
                                             'EquipBoostOrnamentPage')]
        for ready in (False, True):
            obj = {'m_pageControl': {'pageCount': len(pages)},
                   'm_mark': {'visible': True}, 'm_ZhuLingMark': {'visible': False},
                   'm_navBar': {}, 'selectedIndex': 0}
            refreshed = []

            def invoke(target, name, values):
                if name == 'getPage': return pages[values[0]]
                if name == 'checkCanUpgrade':
                    target['pageMark'] = ready
                    refreshed.append(target['class'])
                    return ready

            self.run_method(6167, obj, (None,),
                            {'GlobalData': {'role': {'actorCircle': 5}}}, invoke)
            self.assertFalse(obj['m_mark']['visible'])
            self.assertEqual(obj['m_ZhuLingMark']['visible'], ready)
            self.assertEqual(pages[0]['pageMark'], ready)
            self.assertEqual(refreshed, ['EquipBoostCombinPage', 'EquipBoostZhuLingPage'])

    def test_material_and_success_callbacks_preserve_success_effect(self):
        page = {'class': 'EquipBoostCombinPage'}
        for mid, ready in product((6170, 6171), (False, True)):
            obj = {'m_pageControl': {'pageCount': 1}, 'm_mark': {'visible': True}}
            effects = []

            def invoke(target, name, values):
                if name == 'getPage': return page
                if name == 'checkCombin': self.run_method(6172, target, values, invoke=invoke)
                if name == 'playSuccessEff': effects.append(target)

            self.run_method(mid, obj, ({'data': ready},), invoke=invoke)
            self.assertFalse(obj['m_mark']['visible'])
            self.assertEqual(effects, [page] if mid == 6170 else [])

    def test_only_two_method_bytes_change_and_all_resources_are_preserved(self):
        source = subprocess.check_output(['git', 'show', BASELINE + ':web/GameFrame.swf'], cwd=ROOT)
        old_data, (tag, _, a, b) = abc_section(source)
        old_abc, _ = normalize(old_data[a:b])
        names, classes, bodies = inspect_abc(old_abc)
        new_data, (new_tag, _, na, nb) = abc_section(CLIENT.read_bytes())
        self.assertEqual(old_data[8:tag], new_data[8:new_tag])
        self.assertEqual(old_data[b:], new_data[nb:])
        self.assertEqual(len(old_abc), len(self.abc))
        self.assertEqual(names, self.names)
        self.assertEqual(classes, self.classes)
        allowed = set()
        changed = set()
        for mid, (s, n, limits) in bodies.items():
            self.assertEqual((s, n, limits), self.bodies[mid])
            if old_abc[s:s + n] != self.abc[s:s + n]:
                changed.add(mid)
                allowed.update(range(s, s + n))
        self.assertEqual(changed, {6166, 24442})
        self.assertTrue(all(i in allowed for i, (a, b) in enumerate(zip(old_abc, self.abc)) if a != b))
        self.assertEqual(patch_reminders(patch_main(source)), CLIENT.read_bytes())
        self.assertEqual(patch_main(CLIENT.read_bytes()), CLIENT.read_bytes())
        self.assertEqual(patch_reminders(CLIENT.read_bytes()), CLIENT.read_bytes())
        # The page's eligibility checks, nested marks and success animation
        # remain byte-identical, including all their helper methods.
        for name, (mid, _) in classes['EquipBoostCombinPage']['instance'].items():
            s, n, _ = bodies[mid]
            self.assertEqual(old_abc[s:s + n], self.abc[s:s + n], name)


if __name__ == '__main__':
    unittest.main(verbosity=2)
