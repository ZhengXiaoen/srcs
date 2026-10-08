"""Run saved-claim refresh through the shipped panel deletion methods."""
from __future__ import annotations

import subprocess
import sys
import unittest

from patch_activity_reminders import CLIENT, ROOT, normalize
from patch_activity_entries import strings_of
from patch_competition_hongli_reminders import parameter_positions
from patch_drop_pickup_retry import abc_section, instructions
from patch_god_equip_state import inspect_abc
from patch_anniversary_row_and_icon_refresh import METHODS, login_refresh, patch_swf
from patch_super_anniversary import bytecode_requirements
from patch_anniversary_reopen import METHODS as REOPEN_METHODS, patch_swf as reopen_patch
from test_daily_activity_icons import DailyIconsTests

BASELINE = '34ff0c8'


class IconRefreshTests(DailyIconsTests):
    @classmethod
    def setUpClass(cls):
        super().setUpClass()
        cls.params = parameter_positions(cls.abc)

    def setUp(self):
        super().setUp()
        self.panel = {'_btnArr': []}; self.second = {}; self.second_buttons = {}
        self.globals['NavTopBtnPanel2']['_instance'] = self.panel
        self.globals['NavTopBtnPanel'] = {'_instance': self.second}
        self.globals['MsgButtonTypes']['RIGHT_Top_YearActive'] = 99
        self.globals['GlobalData']['yearAcitveDataMgr'] = {'curDay': 1, 'totalDay': 7}
        self.globals['YearActiveEvent'] = {'DAYCHANGE': 'year_day'}

    def run_code(self, mid, obj=None, arg=None, **kw):
        if mid == 6496 and arg is not None and self.names[self.params[mid][0][1]] != arg.get('class'):
            raise TypeError('Event cannot be coerced to the declared callback parameter')
        return super().run_code(mid, obj, arg, **kw)

    def invoke(self, obj, name, args):
        if name == '__construct__': return {'type': args[0], 'class': 'CliffordEvent'}
        if name == 'getBtn': return self.second_buttons.get(args[0])
        if name == 'canGetAward': return args[0] in obj.get('available', [])
        if name == 'addBtn2':
            target = self.second_buttons if obj is self.globals['NavTopBtnPanel'] else self.buttons
            if args[0] not in target:
                target[args[0]] = {'ident': args[2], 'effect': False, 'userData': []}
                if target is self.buttons: self.panel['_btnArr'].append({'btn': target[args[0]]})
            return
        if name == 'delBtn':
            if obj is self.globals['NavTopBtnPanel2']:
                expected = len(self.params[18980])
                if len(args) != expected: raise TypeError('First-row delBtn argument count mismatch')
                self.globals['_instance'] = self.panel
                return super().run_code(18980, obj, args[0])
            if obj is self.panel: return super().run_code(19006, obj, args[0])
            if obj is self.globals['NavTopBtnPanel']:
                if len(args) != len(self.params[11119]): raise TypeError('Second-row delBtn argument count mismatch')
                self.second_buttons.pop(args[0], None); return
        if name == 'delBtnByIdent': return super().run_code(19001, self.panel, args[0])
        if name == 'dispose': return
        if name == 'removeChild': self.buttons.pop(args[0]['ident'], None); return
        if name == 'updateLayout': return
        if name == 'splice': del obj[args[0]:args[0] + args[1]]; return
        if name == 'getNewGuoQingInfo':
            if len(args) != len(self.params[8632]): raise TypeError('National Day query argument count mismatch')
            self.requests.append(('national', args[0])); return
        return super().invoke(obj, name, args)

    def test_patch_changes_only_reviewed_methods_and_preserves_artwork(self):
        before = subprocess.check_output(['git', 'show', BASELINE + ':web/GameFrame.swf'], cwd=ROOT)
        self.assertEqual(CLIENT.read_bytes(), reopen_patch(patch_swf(before)))
        self.assertEqual(CLIENT.read_bytes(), patch_swf(CLIENT.read_bytes()))
        raw, (_, _, a, b) = abc_section(before); old, _ = normalize(raw[a:b]); _, _, bodies = inspect_abc(old)
        changed = set()
        for mid, (a, b, limits) in bodies.items():
            c, d, new_limits = self.bodies[mid]
            if old[a:a + b] != self.abc[c:c + d] or limits != new_limits: changed.add(mid)
        self.assertEqual(METHODS | REOPEN_METHODS, changed)
        self.assertEqual(strings_of(old), self.strings)
        old_params = parameter_positions(old)
        self.assertEqual([(6496, [330], [331])], [(mid, [v for _, v in old_params[mid]], [v for _, v in values])
                                               for mid, values in self.params.items()
                                               if [v for _, v in old_params[mid]] != [v for _, v in values]])

    def test_old_release_reproduces_delete_signature_and_event_type_failures(self):
        before = subprocess.check_output(['git', 'show', BASELINE + ':web/GameFrame.swf'], cwd=ROOT)
        raw, (_, _, a, b) = abc_section(before); old, _ = normalize(raw[a:b])
        saved = self.abc, self.names, self.bodies, self.strings, self.params
        try:
            self.abc = old; self.names, _, self.bodies = inspect_abc(old)
            self.strings = strings_of(old); self.params = parameter_positions(old)
            self.national['guoQingSign'][7] = 1
            with self.assertRaisesRegex(TypeError, 'argument count'): self.run_code(6381)
            with self.assertRaisesRegex(TypeError, 'coerced'):
                self.run_code(6496, arg={'class': 'CliffordEvent', 'type': 'icon'})
        finally: self.abc, self.names, self.bodies, self.strings, self.params = saved

    def test_login_refresh_hides_claims_saved_before_patch_and_requests_current_state(self):
        self.invoke(self.globals['NavTopBtnPanel2'], 'addBtn2', [88, '', 88])
        self.invoke(self.globals['NavTopBtnPanel2'], 'addBtn2', [77, '', 77])
        self.national['guoQingSign'][7] = 1; self.mgr.update(pos=49, hasAward=0)
        a, b, _ = self.bodies[6333]; code = self.abc[a:a + b]
        start = code.index(login_refresh()); end = start + len(login_refresh())
        self.run_code(6333, start=start, end=end)
        self.assertNotIn(88, self.buttons); self.assertNotIn(77, self.buttons)
        self.assertEqual([('national', 1), ('national', 2), 1], self.requests)

    def test_anniversary_creation_reminders_and_closing_use_second_row(self):
        a, b, _ = self.bodies[6497]; code = self.abc[a:a + b]; ops = instructions(code)
        marker = next(o.start for o in ops if o.opcode == 0x66 and o.operands[0] == 38323)
        start = marker - 6
        end = next(o.start for o in ops if o.opcode == 0x10 and o.start > marker)
        # Creation calls checkOneYearActive; the spy allows the real row creation to finish.
        original = self.invoke
        def invoke(obj, name, args):
            if name == 'checkOneYearActive': return
            return original(obj, name, args)
        self.invoke = invoke
        self.run_code(6497, start=start, end=end, locals_={0: self.nav, 4: 99})
        self.assertIn(99, self.second_buttons); self.assertNotIn(99, self.buttons)
        self.globals['GlobalData']['yearAcitveDataMgr']['available'] = [13]
        self.run_code(6379); self.assertTrue(self.second_buttons[99]['effect'])
        self.globals['GlobalData']['yearAcitveDataMgr']['available'] = []
        self.run_code(6379); self.assertFalse(self.second_buttons[99]['effect'])
        self.globals['GlobalData']['yearAcitveDataMgr']['curDay'] = 0
        self.run_code(6380); self.assertNotIn(99, self.second_buttons)

    def test_flash_stack_local_and_scope_limits_cover_all_changed_paths(self):
        for mid in METHODS:
            a, b, limits = self.bodies[mid]
            required = bytecode_requirements(self.abc[a:a + b], self.names, limits[2])
            for have, need in zip((limits[0], limits[1], limits[3]), required): self.assertGreaterEqual(have, need)


if __name__ == '__main__':
    if '--lua-path' in sys.argv:
        index = sys.argv.index('--lua-path'); sys.path.insert(0, sys.argv[index + 1]); del sys.argv[index:index + 2]
    unittest.main(defaultTest='IconRefreshTests')
