"""Execute the installed confirmation bytecode and verify its narrow patch."""
import subprocess
import unittest

from patch_bag_bind_sort import CLIENT, PROMPT, CHECK_LABEL, ENTRY, STATE, patch_swf
from patch_drop_pickup_retry import abc_section, instructions
from patch_appearance_upgrade import inspect_abc, pools

BASELINE = "d5cb2faab95bd4af2ddd4c1a06d088768a6d1279"

class ClientVM:
    def __init__(self):
        raw, (_, _, start, end) = abc_section(CLIENT.read_bytes())
        self.abc = raw[start:end]
        self.names, self.catalog, self.bodies = inspect_abc(self.abc)
        self.strings = pools(self.abc)["strings"][3]
        self.page = {"_btnNames": {}, "_sortBagBtn": {"enabled": True}}
        self.dialogs, self.calls = [], []

    def run(self, method=None, args=()):
        method = method if method is not None else self.catalog["BackPackWin"]["instance"]["onClickSortBagBtn"][0]
        start, size, limits = self.bodies[method]
        ops = {op.start: op for op in instructions(self.abc[start:start + size])}
        local = {0: self.page, **{i + 1: arg for i, arg in enumerate(args)}}
        stack, pos, maximum = [], 0, 0
        for _ in range(1000):
            op = ops[pos]; pos = op.end
            kind, values = op.opcode, op.operands
            if 0xd0 <= kind <= 0xd3: stack.append(local[kind - 0xd0])
            elif 0xd4 <= kind <= 0xd7: local[kind - 0xd4] = stack.pop()
            elif kind == 0x30: stack.pop()
            elif kind == 0x60: stack.append({"class": self.names[values[0]], "instance": self.page, "itemDataMgr": {}})
            elif kind == 0x66: stack.append(stack.pop().get(self.names[values[0]]))
            elif kind in (0x61, 0x68):
                value, obj = stack.pop(), stack.pop(); obj[self.names[values[0]]] = value
            elif kind in (0x24, 0x25): stack.append(values[0])
            elif kind == 0x2c: stack.append(self.strings[values[0]])
            elif kind == 0x20: stack.append(None)
            elif kind in (0x26, 0x27): stack.append(kind == 0x26)
            elif kind == 0x80: pass
            elif kind == 0x40: stack.append(values[0])
            elif kind == 0x56:
                count = values[0]; array = stack[-count:]; del stack[-count:]; stack.append(array)
            elif kind in (0x46, 0x4f):
                name, count = self.names[values[0]], values[1]
                arguments = stack[-count:] if count else []
                if count: del stack[-count:]
                target, result = stack.pop(), None
                self.calls.append((name, arguments))
                if name == "show": self.dialogs.append(arguments)
                elif name == "onClickSortBagBtn": self.run(args=arguments)
                elif name == "getInstance": result = {}
                elif name not in ("sendTalkToNPC", "sendQueryBagItem", "replaceNoSortItems", "changeTypeHnadler", "removeItem", "addItem"):
                    raise AssertionError(name)
                if kind == 0x46: stack.append(result)
            elif kind in (0x10, 0x11, 0x12, 0x14):
                if kind == 0x10: take = True
                elif kind in (0x11, 0x12):
                    value = stack.pop()
                    truth = True if isinstance(value, (dict, list)) else bool(value)
                    take = truth == (kind == 0x11)
                else:
                    right, left = stack.pop(), stack.pop(); take = left != right
                if take: pos = op.branches[0][1]
            elif kind == 0x47:
                assert not stack
                assert maximum <= limits[0], (maximum, limits)
                assert max(local) < limits[1]
                return
            else: raise AssertionError(hex(kind))
            maximum = max(maximum, len(stack))
        raise AssertionError("Bytecode did not terminate")

    def reply(self, confirm, checked=False):
        self.run(self.dialogs[-1][2], ({"checkSelceted": checked}, 0 if confirm else 1))

    def requests(self):
        return [args for name, args in self.calls if name == "sendTalkToNPC"]


class BagConfirmationTests(unittest.TestCase):
    def test_cancel_never_binds_even_if_checked(self):
        vm = ClientVM(); vm.run(args=({},))
        self.assertEqual(vm.requests(), [])
        self.assertEqual(vm.dialogs[0][0], PROMPT)
        self.assertEqual(vm.dialogs[0][1], ["确定", "取消"])
        self.assertEqual(vm.dialogs[0][3], CHECK_LABEL)
        vm.reply(False, True)
        self.assertEqual(vm.requests(), [])
        self.assertFalse(vm.page["_btnNames"].get(STATE[0]))
        self.assertFalse(vm.page["_btnNames"][STATE[1]])
        vm.run(args=({},)); self.assertEqual(len(vm.dialogs), 2)

    def test_confirm_binds_and_queries_in_order(self):
        vm = ClientVM(); vm.run(args=({},)); vm.reply(True)
        self.assertEqual(vm.requests(), [[0, ENTRY]])
        calls = [name for name, _ in vm.calls]
        self.assertLess(calls.index("sendTalkToNPC"), calls.index("sendQueryBagItem"))
        self.assertFalse(vm.page["_sortBagBtn"]["enabled"])
        vm.run(args=({},)); self.assertEqual(len(vm.dialogs), 2)

    def test_checked_confirmation_skips_only_current_session(self):
        vm = ClientVM(); vm.run(args=({},)); vm.reply(True, True)
        vm.run(args=({},))
        self.assertEqual(len(vm.dialogs), 1)
        self.assertEqual(vm.requests(), [[0, ENTRY], [0, ENTRY]])
        vm.run(vm.catalog["BackPackWin"]["static"]["reset"][0])
        vm.run(args=({},))
        self.assertEqual(len(vm.dialogs), 2)
        self.assertEqual(vm.requests(), [[0, ENTRY], [0, ENTRY]])
        fresh = ClientVM(); fresh.run(args=({},))
        self.assertEqual(len(fresh.dialogs), 1)
        self.assertEqual(fresh.requests(), [])

    def test_duplicate_click_does_not_open_more_dialogs(self):
        vm = ClientVM()
        for _ in range(5): vm.run(args=({},))
        self.assertEqual(len(vm.dialogs), 1)
        self.assertEqual(vm.requests(), [])

    def test_historical_sort_method_and_current_patch_idempotence(self):
        original = subprocess.check_output(["git", "show", BASELINE + ":web/GameFrame.swf"])
        # Other tasks have subsequently changed the SWF. Compare this feature's
        # method only; whole-file equality against the historic SWF is stale.
        candidate = patch_swf(original)
        def sort_body(swf):
            raw, (_, _, start, end) = abc_section(swf)
            abc=raw[start:end]
            _, catalog, bodies=inspect_abc(abc)
            method=catalog["BackPackWin"]["instance"]["onClickSortBagBtn"][0]
            pos,size,limits=bodies[method]
            return abc[pos:pos+size],limits
        self.assertEqual(sort_body(candidate), sort_body(CLIENT.read_bytes()))
        self.assertEqual(patch_swf(candidate), candidate)
        self.assertEqual(patch_swf(CLIENT.read_bytes()), CLIENT.read_bytes())


if __name__ == "__main__":
    unittest.main()
