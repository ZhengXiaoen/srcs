"""Run pickup regression cases against the packed client's actual AVM2 code.

No Flash runtime or live server is required. Execute the changed assignment and
the unchanged nearest-drop selector in a small, strict interpreter with mocked
map, clock, backpack and saved pickup settings. Use --baseline with a pre-patch
SWF to demonstrate the formerly permanent skip after an unconfirmed request.
"""
from __future__ import annotations

import argparse
import math
from pathlib import Path
import unittest

from patch_bag_client import ABCReader
from patch_god_equip_state import inspect_abc
from patch_guild_quest_config import read_cbp
from patch_drop_pickup_retry import CLIENT, ROOT, abc_section, instructions, retry_assignment

BASELINE = None


def code_for(swf, class_name, method):
    data, (_, _, start, end) = abc_section(swf)
    abc = data[start:end]
    names, traits, bodies = inspect_abc(abc, class_name)
    pos, size, limits = bodies[traits[method][0]]
    return names, abc[pos:pos + size], limits


def integer_pool(swf):
    data, (_, _, start, end) = abc_section(swf)
    reader = ABCReader(data[start:end])
    reader.skip(4)
    values = [0]
    for _ in range(reader.u30() - 1):
        value = reader.u30()
        values.append(value - (1 << 32) if value >= (1 << 31) else value)
    return values


class PickupVM:
    def __init__(self, names, ints, world):
        self.names, self.ints, self.world = names, ints, world

    def run(self, code, locals_, stack=None):
        stack = [] if stack is None else list(stack)
        ops = {op.start: op for op in instructions(code)}
        pc = 0
        steps = 0
        while pc < len(code):
            steps += 1
            if steps > 10000:
                raise AssertionError("Pickup bytecode did not terminate")
            op = ops[pc]
            pc = op.end
            kind = op.opcode
            args = op.operands
            if kind in (0x02, 0x09, 0x80, 0x76):
                pass
            elif kind == 0x30:
                stack.pop()  # pushscope: the mocked globals remain available
            elif kind == 0x20:
                stack.append(None)
            elif kind == 0x24:
                stack.append(args[0])
            elif kind == 0x25:
                stack.append(args[0])
            elif kind == 0x26:
                stack.append(True)
            elif kind == 0x27:
                stack.append(False)
            elif kind == 0x2D:
                stack.append(self.ints[args[0]])
            elif kind == 0x29:
                stack.pop()
            elif kind == 0x2A:
                stack.append(stack[-1])
            elif 0xD0 <= kind <= 0xD3:
                stack.append(locals_[kind - 0xD0])
            elif 0xD4 <= kind <= 0xD7:
                locals_[kind - 0xD4] = stack.pop()
            elif kind == 0x62:
                stack.append(locals_[args[0]])
            elif kind == 0x63:
                locals_[args[0]] = stack.pop()
            elif kind == 0x60:
                stack.append(self.world[self.names[args[0]]])
            elif kind == 0x5D:
                stack.append(self.world)
            elif kind == 0x66:
                name = self.names[args[0]]
                if not name:  # MultinameL: array index comes from the stack
                    index, owner = stack.pop(), stack.pop()
                    stack.append(owner[index])
                else:
                    owner = stack.pop()
                    stack.append(len(owner) if name == "length" else owner[name])
            elif kind == 0x61:
                value, owner = stack.pop(), stack.pop()
                name = self.names[args[0]]
                owner[name] = int(value) if name == "canPickTime" else value
            elif kind == 0x46:
                index, count = args
                call_args = [stack.pop() for _ in range(count)][::-1]
                owner = stack.pop()
                stack.append(owner[self.names[index]](*call_args))
            elif kind == 0x87:
                stack.pop()  # astypelate, all supplied drops have the correct type
            elif kind == 0x73:
                stack.append(int(stack.pop()))
            elif kind == 0x75:
                stack.append(float(stack.pop()))
            elif kind in (0x93, 0xC1):
                stack.append(stack.pop() - 1)
            elif kind == 0x96:
                stack.append(not stack.pop())
            elif kind in (0xA0, 0xA1, 0xA3, 0xAB):
                b, a = stack.pop(), stack.pop()
                stack.append({0xA0: lambda: a + b, 0xA1: lambda: a - b,
                              0xA3: lambda: a / b, 0xAB: lambda: a == b}[kind]())
            elif kind == 0x10:
                pc = op.branches[0][1]
            elif kind in (0x11, 0x12):
                take = bool(stack.pop())
                if take == (kind == 0x11):
                    pc = op.branches[0][1]
            elif kind in (0x0C, 0x0F, 0x14, 0x17):
                b, a = stack.pop(), stack.pop()
                take = {0x0C: lambda: not a < b, 0x0F: lambda: not a >= b,
                        0x14: lambda: a != b, 0x17: lambda: a > b}[kind]()
                if take:
                    pc = op.branches[0][1]
            elif kind == 0x48:
                return stack.pop()
            else:
                raise AssertionError(f"Unmocked selector opcode {kind:#x} at {op.start}")
        return stack


class PickupRetryTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.client = CLIENT.read_bytes()
        cls.names, cls.selector, _ = code_for(cls.client, "LogicManager", "getNearestDropPacket")
        cls.ints = integer_pool(cls.client)
        cls.assignment = retry_assignment()
        _, cfg = read_cbp((ROOT / "web/v2/lang/zh-cn/SystemConfig.cbp").read_bytes())
        cls.ranges = {int(row.child("type").number()):
                      [(r.child("0").number(), r.child("1").number())
                       for r in row.child("idRange").child("0").children if len(r.children) == 2]
                      for row in cfg.children if row.child("itemtype").number() == 0}
        for class_name, methods in {"LocalPlayer": ["setCurrentXY"],
                                    "GameLogic": ["onPathTargetArrived", "onMouseDown", "onMouseClick"]}.items():
            for method in methods:
                _, code, _ = code_for(cls.client, class_name, method)
                assert cls.assignment in code

    def environment(self, item_id=537, count=4):
        clock = {"ms": 12345}
        switches = {8: True, 13: True}
        state = {"capacity": True}

        def pickup(item, action):
            match = next((cat for cat, ranges in self.ranges.items()
                          if any(lo <= item <= hi for lo, hi in ranges)), None)
            return switches.get(match, False)

        drop = {"isAlreadyPickup": False, "isCheck": False, "mapId": 1,
                "canPickTime": 0, "itemType": -1, "itemId": item_id,
                "currentX": 10, "currentY": 10, "name": f"material x{count}"}
        drop["isPickTime"] = lambda: clock["ms"] / 1000 < drop["canPickTime"]
        manager = {"m_DropPacketList": [drop]}
        world = {"getTimer": lambda: clock["ms"], "Boolean": bool,
                 "MapDropItemPacket": object, "GameMap": {"defaultMap": {
                     "currentX": 10, "currentY": 10, "mapId": 1}},
                 "Math": {"sqrt": math.sqrt, "pow": pow}, "CallBack": {
                     "isCanPickUpByPack": lambda d: state["capacity"],
                     "getPickUpStatusByItemId": pickup,
                     "getPickUpSelectByType": lambda kind, action: switches.get(kind, False)}}
        vm = PickupVM(self.names, self.ints, world)
        select = lambda: vm.run(self.selector, [manager, True] + [None] * 9)
        send = lambda: vm.run(self.assignment, [], [drop])
        return clock, switches, state, drop, manager, select, send

    def test_unconfirmed_stacks_retry_for_all_reported_counts(self):
        for item, count in [(537, 2), (537, 4), (568, 6), (568, 7), (572, 4), (83, 1), (538, 200)]:
            with self.subTest(item=item, count=count):
                clock, _, _, drop, _, select, send = self.environment(item, count)
                self.assertIs(select(), drop)
                send()  # suppressed, lost or rejected request: no DROP_ITEM_DEL
                self.assertIsNone(select())
                clock["ms"] += 999
                self.assertIsNone(select())
                clock["ms"] += 1001
                self.assertIs(select(), drop)
                send()
                clock["ms"] += 2000
                self.assertIs(select(), drop)

    def test_server_confirmation_stops_retry_and_leaves_next_drop(self):
        clock, _, _, drop, manager, select, send = self.environment()
        send()
        other = dict(drop, itemId=568, canPickTime=0)
        other["isPickTime"] = lambda: clock["ms"] / 1000 < other["canPickTime"]
        manager["m_DropPacketList"].append(other)
        self.assertIs(select(), other)  # a pending stack does not block other drops
        manager["m_DropPacketList"].remove(other)
        manager["m_DropPacketList"].remove(drop)  # actual DROP_ITEM_DEL behavior
        clock["ms"] += 3000
        self.assertIsNone(select())

    def test_retry_delay_exceeds_sender_throttle_at_second_boundaries(self):
        for fraction in (0, 1, 345, 998, 999):
            with self.subTest(fraction=fraction):
                clock, _, _, drop, _, select, send = self.environment()
                clock["ms"] = 12000 + fraction
                send()
                delay = drop["canPickTime"] * 1000 - clock["ms"]
                self.assertGreater(delay, 1000)
                self.assertLessEqual(delay, 2000)
                clock["ms"] += 1000
                self.assertIsNone(select())
                clock["ms"] = drop["canPickTime"] * 1000
                self.assertIs(select(), drop)

    def test_category_backpack_protection_and_map_filters_remain(self):
        clock, switches, state, drop, _, select, _ = self.environment()
        switches[8] = False
        self.assertIsNone(select())
        self.assertFalse(drop["isCheck"])
        switches[8] = True
        self.assertIs(select(), drop)  # no manual settings save or drop refresh
        state["capacity"] = False
        self.assertIsNone(select())
        state["capacity"] = True
        drop["canPickTime"] = 20
        self.assertIsNone(select())
        clock["ms"] = 21000
        self.assertIs(select(), drop)
        drop["mapId"] = 2
        self.assertIsNone(select())
        drop["mapId"] = 1
        drop["isAlreadyPickup"] = True  # non-pickable under-map image remains excluded
        self.assertIsNone(select())

    def test_baseline_reproduces_permanent_skip(self):
        if BASELINE is None:
            self.skipTest("Use --baseline to demonstrate the old permanent skip")
        names, code, _ = code_for(Path(BASELINE).read_bytes(), "LocalPlayer", "setCurrentXY")
        fragment = b"\x26\x61\x91\x3b"
        self.assertIn(fragment, code)
        clock, _, _, drop, _, select, _ = self.environment()
        self.assertIs(select(), drop)
        vm = PickupVM(names, self.ints, {"getTimer": lambda: clock["ms"]})
        vm.run(fragment, [], [drop])
        clock["ms"] += 60000
        self.assertIsNone(select())


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--baseline", type=Path)
    args = parser.parse_args()
    BASELINE = args.baseline
    unittest.main(argv=[__file__], verbosity=2)
