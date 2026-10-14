"""Execute installed GM button layout and commands with the actual AVM2 code."""
from pathlib import Path
import unittest

from patch_appearance_upgrade import inspect_abc, pools
from patch_drop_pickup_retry import abc_section, instructions
from patch_gm_commands import (CLIENT, COMMAND, LABEL, Q, patch_swf, KILL_COMMAND,
                               KILL_LABEL, PICKUP_LABEL, PICKUP_COMMAND_PREFIX)
from patch_guild_quest_config import read_cbp


class GMVM:
    def __init__(self, abc):
        self.names, self.catalog, self.bodies = inspect_abc(abc)
        self.strings = pools(abc)["strings"][3]
        self.abc = abc
        _, lang = read_cbp((CLIENT.parent / "v2/lang/zh-cn/clientlang.cbp").read_bytes())
        customer = next(node for node in lang.children if node.name == "customerService")
        labels = [node.value.decode("utf-8") for node in customer.children]
        self.globals = {"LangManager": {"Lang": {"customerService": labels}},
                        "GlobalData": {"role": {"name": "GM测试角色"}}, "ChatFunc": {}}
        self.page = {}
        self.commands = []
        self.listeners = []
        self.pickup_indices = {i: i % 16 for i in range(1, 23)}
        self.pickup_enabled = {i: i % 2 == 1 for i in range(1, 23)}
        self.pickup_reads = []
        self.globals['GlobalData']['systemConfigDataMgr'] = {}

    def run(self, name, argument=None, start_at=0):
        method = self.catalog["CustomerServiceWin"]["instance"][name][0]
        start, size, limits = self.bodies[method]
        ops = {op.start: op for op in instructions(self.abc[start:start + size])}
        local = {0: self.page, 1: argument}
        stack = []
        pos, maximum = start_at, 0
        for _ in range(10000):
            op = ops[pos]
            pos = op.end
            kind, args = op.opcode, op.operands
            if kind in range(0xd0, 0xd4): stack.append(local[kind - 0xd0])
            elif kind in range(0xd4, 0xd8): local[kind - 0xd4] = stack.pop()
            elif kind == 0x62: stack.append(local[args[0]])
            elif kind == 0x63: local[args[0]] = stack.pop()
            elif kind == 0x08: local.pop(args[0], None)
            elif kind in (0x60, 0x5d): stack.append(self.globals.get(self.names[args[0]], {}))
            elif kind == 0x66:
                key = stack.pop() if args[0] == Q["index"] else self.names[args[0]]
                obj = stack.pop()
                stack.append(len(obj) if key == "length" else obj[key])
            elif kind in (0x61, 0x68):
                value, obj = stack.pop(), stack.pop()
                obj[self.names[args[0]]] = value
            elif kind in (0x24, 0x25): stack.append(args[0])
            elif kind == 0x2c: stack.append(self.strings[args[0]])
            elif kind == 0x20: stack.append(None)
            elif kind in (0x26, 0x27): stack.append(kind == 0x26)
            elif kind in (0x30, 0x29): stack.pop()
            elif kind == 0x2a: stack.append(stack[-1])
            elif kind in (0x80, 0x87, 0x09):
                if kind == 0x87: stack.pop()  # astypelate consumes its class
            elif kind == 0x73: stack.append(int(stack.pop()))
            elif kind == 0x56:
                count = args[0]
                values = stack[-count:] if count else []
                if count: del stack[-count:]
                stack.append(values)
            elif kind == 0x4a:
                if args[1]: del stack[-args[1]:]
                stack.pop()
                if self.names[args[0]] == "Array": result = []
                elif self.names[args[0]] == "Button54": result = {"width": 77, "height": 31}
                else: raise AssertionError("Unexpected constructor")
                stack.append(result)
            elif kind in (0x46, 0x4f):
                name, count = self.names[args[0]], args[1]
                values = stack[-count:] if count else []
                if count: del stack[-count:]
                target = stack.pop()
                result = None
                if name == "SplitString": result = values[0].split(",")
                elif name == "push": target.extend(values)
                elif name == "move": target["x"], target["y"] = values
                elif name == "addChild": self.page.setdefault("children", []).extend(values)
                elif name == "doChatMessage": self.commands.extend(values)
                elif name == "getPickUpSelectIndexByType":
                    self.pickup_reads.append((name, tuple(values)))
                    result = self.pickup_indices[values[0]]
                elif name == "getPickUpSelectByType":
                    self.pickup_reads.append((name, tuple(values)))
                    assert values[1] == 0
                    result = self.pickup_enabled[values[0]]
                elif name == "join": result = values[0].join(map(str, target))
                else: raise AssertionError(f"Unexpected call: {name}")
                if kind == 0x46: stack.append(result)
            elif kind == 0xc2: local[args[0]] += 1
            elif kind == 0xa0:
                right, left = stack.pop(), stack.pop()
                stack.append(left + right)
            elif kind in (0x10, 0x11, 0x12, 0x15, 0x17, 0x1a):
                if kind == 0x10: take = True
                elif kind in (0x11, 0x12): take = bool(stack.pop()) == (kind == 0x11)
                else:
                    right, left = stack.pop(), stack.pop()
                    take = left < right if kind == 0x15 else left > right if kind == 0x17 else left is not right
                if take: pos = op.branches[0][1]
            elif kind == 0x1b:
                index = stack.pop()
                case = index + 1 if 0 <= index <= args[0] else 0
                pos = op.branches[case][1]
            elif kind == 0x47:
                assert not stack, "Stack must be empty at return"
                assert maximum <= limits[0], (maximum, limits)
                return
            else: raise AssertionError(f"Unhandled GM opcode: {kind:#x}")
            maximum = max(maximum, len(stack))
        raise AssertionError("GM code did not terminate")


class GMClientTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        source = CLIENT.read_bytes()
        if patch_swf(source) != source:
            raise AssertionError("GM patch is not installed")
        data, (_, _, a, b) = abc_section(source)
        cls.abc = data[a:b]

    def vm(self):
        vm = GMVM(self.abc)
        # Start at the original six-button construction segment after tab setup.
        method = vm.catalog["CustomerServiceWin"]["instance"]["init"][0]
        start, size, _ = vm.bodies[method]
        ops = instructions(vm.abc[start:start + size])
        marker = next(i for i, op in enumerate(ops)
                      if op.opcode == 0x68 and vm.names[op.operands[0]] == "_stateBtnList")
        vm.run("init", start_at=ops[marker - 3].start)
        return vm

    def test_layout_next_to_show_title_and_no_overlap(self):
        vm = self.vm()
        buttons = vm.page["_stateBtnList"]
        self.assertEqual(9, len(buttons))
        title, pull = buttons[4], buttons[6]
        self.assertEqual("显示头衔", title["caption"])
        self.assertEqual(LABEL, pull["caption"])
        self.assertEqual((324, 50), (pull["x"], pull["y"]))
        self.assertEqual(title["y"], pull["y"])
        self.assertGreater(pull["x"], title["x"] + title["width"])
        self.assertLessEqual(pull["x"] + pull["width"], 442 - 17)
        self.assertEqual(buttons, vm.page["children"])
        kill = buttons[7]
        self.assertEqual(KILL_LABEL, kill["caption"])
        self.assertEqual((324, 78), (kill["x"], kill["y"]))
        self.assertGreaterEqual(kill["y"], pull["y"] + pull["height"])
        pickup = buttons[8]
        self.assertEqual(PICKUP_LABEL, pickup['caption'])
        self.assertEqual((324, 106), (pickup['x'], pickup['y']))
        self.assertGreaterEqual(pickup['y'], kill['y'] + kill['height'])
        self.assertLessEqual(pickup['y'] + pickup['height'], 143)
        # Actual four-tab skin is 272 pixels wide at x=17, ending before x=324.
        self.assertGreaterEqual(pickup['x'], 17 + 272)

    def test_one_click_one_command_and_existing_commands(self):
        vm = self.vm()
        expected = ["@sethide GM测试角色 1", "@sethide GM测试角色 0",
                    "@superman 0", "@superman 1", "@setgm 1", "@setgm 0", COMMAND, KILL_COMMAND,
                    PICKUP_COMMAND_PREFIX + ','.join(str(vm.pickup_indices[i] +
                    (16 if vm.pickup_enabled[i] else 0)) for i in range(1, 23)) + '"']
        for button, command in zip(vm.page["_stateBtnList"], expected):
            vm.commands.clear()
            vm.run("onBtnClick", {"target": button, "currentTarget": button})
            self.assertEqual([command], vm.commands)

    def test_pickup_uses_all_current_indices_and_only_automatic_toggle(self):
        vm = self.vm()
        button = vm.page['_stateBtnList'][8]
        for enabled in (False, True):
            vm.pickup_reads.clear(); vm.commands.clear()
            vm.pickup_indices = {i: 15 if enabled else 0 for i in range(1, 23)}
            vm.pickup_enabled = {i: enabled for i in range(1, 23)}
            vm.run('onBtnClick', {'target': {}, 'currentTarget': button})
            self.assertEqual([PICKUP_COMMAND_PREFIX + ','.join([str(31 if enabled else 0)] * 22) + '"'], vm.commands)
            self.assertEqual([(name, (i,) if name == 'getPickUpSelectIndexByType' else (i, 0))
                              for i in range(1, 23)
                              for name in ('getPickUpSelectIndexByType', 'getPickUpSelectByType')], vm.pickup_reads)

    def test_listener_lifecycle_still_covers_all_state_buttons(self):
        vm = self.vm()
        methods = vm.catalog["CustomerServiceWin"]["instance"]
        for method_name, expected in (("onAddedToStage", "addEventListener"),
                                      ("onRemovedFromStage", "removeEventListener")):
            start, size, _ = vm.bodies[methods[method_name][0]]
            ops = instructions(vm.abc[start:start + size])
            self.assertTrue(any(op.opcode == 0x66 and vm.names[op.operands[0]] == "_stateBtnList" for op in ops))
            self.assertTrue(any(op.opcode == 0x4f and vm.names[op.operands[0]] == expected for op in ops))
            self.assertTrue(any(op.opcode == 0x32 for op in ops))  # hasnext2 iterates the whole list


if __name__ == "__main__":
    unittest.main()
