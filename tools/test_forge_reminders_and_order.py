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


BASELINE = 'ece39dd017c1441df357049a4fe4c0ff5402c9eb'


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

    def test_every_visible_button_opens_its_named_page_without_ornaments(self):
        fixture = feature_tests.ClientTests()
        titles = dict(zip(('EquipBoostStrengthenPage2', 'EquipBoostCombinPage',
                           'EquipSlotNestPage', 'NoteSoulPage',
                           'EquipBoostZhuLingPage', 'EquipBoostWuXingPage',
                           'EquipBoostFuHunPage'),
                          ('强化', '合成', '镶嵌', '注魂', '注灵', '五行', '附魂')))
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
                self.assertLessEqual(len(nav['children']), 7)
                self.assertNotIn(TITLE, [b['caption'] for b in nav['children']])
                obj['m_navBar'] = nav
                fixture.run_method(6173, obj, globals_, (10000,))
                expected_index = entries.index('EquipBoostZhuLingPage') if level >= 80 else 0
                self.assertEqual(obj['selectedIndex'], expected_index)

    def test_seven_forge_buttons_fit_inside_the_window(self):
        buttons = [{} for _ in range(7)]
        nav = {}

        def invoke(target, name, values):
            if name == 'getChildAt': return buttons[values[0]]
            if name == 'setSize':
                target['width'], target['height'] = values

        self.run_method(18240, nav, globals_={
            'buttonCount': len(buttons), 'm_nDirection': 1,
            'NavigateBarDirection': {'NBD_HORIZONTAL': 0, 'NBD_VERTICAL': 1},
            'm_nLeftSpace': 0, 'm_nTopSpace': 0, 'm_nRightSpace': 0,
            'm_nBottomSpace': 0, 'm_nButtonSpace': -10,
            '_owners': {'getChildAt': nav, 'setSize': nav},
        }, invoke=invoke)
        # createUI positions the bar at m_nTopSpace (40) + 7. The original
        # seven 70px buttons have a 60px step and fit in the 510px window.
        self.assertLessEqual(47 + max(b['y'] + b['height'] for b in buttons), 510)

    def test_treasure_keeps_its_ornament_page_for_all_open_conditions(self):
        method = self.classes['BaoWuWin']['instance']['checkTitle'][0]
        for day, circle in product((1, 3, 4, 30), (0, 3, 5)):
            with self.subTest(day=day, circle=circle):
                pages = [{'class': name} for name in (
                    'TreasureSysPage', 'DouLiPage', 'JunGuPage',
                    'EquipBoostOrnamentPage', 'GuardDragonPage', 'MentalPage', 'FatePage')]
                sheets = {'numChildren': 0, 'pages': []}
                obj = {'pages': pages, '_sheets': sheets,
                       '_tipsIconArr': [{}, {}, {}, {}]}

                def invoke(target, name, values):
                    if name == 'addPage':
                        target['pages'].append(values[0])
                        target['numChildren'] += 1

                self.run_method(method, obj, globals_={
                    'GlobalFunc': {'sectionOpenDays': day},
                    'GlobalData': {'role': {'actorCircle': circle}},
                }, invoke=invoke)
                self.assertEqual([p['class'] for p in sheets['pages']].count(
                    'EquipBoostOrnamentPage'), 1)

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
        self.assertEqual(names, self.names)
        self.assertEqual(classes, self.classes)
        changed = set()
        for mid, (s, n, limits) in bodies.items():
            ns, nn, nl = self.bodies[mid]
            self.assertEqual(limits, nl)
            if old_abc[s:s + n] != self.abc[ns:ns + nn]:
                changed.add(mid)
        self.assertEqual(changed, {6166, 6173})
        self.assertEqual(patch_reminders(patch_main(source)), CLIENT.read_bytes())
        self.assertEqual(patch_main(CLIENT.read_bytes()), CLIENT.read_bytes())
        self.assertEqual(patch_reminders(CLIENT.read_bytes()), CLIENT.read_bytes())
        # The page's eligibility checks, nested marks and success animation
        # remain byte-identical, including all their helper methods.
        for name, (mid, _) in classes['EquipBoostCombinPage']['instance'].items():
            s, n, _ = bodies[mid]
            ns, nn, _ = self.bodies[mid]
            self.assertEqual(old_abc[s:s + n], self.abc[ns:ns + nn], name)


if __name__ == '__main__':
    unittest.main(verbosity=2)
