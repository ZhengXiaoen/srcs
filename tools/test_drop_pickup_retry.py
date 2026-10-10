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
OVERLAP_BASELINE = None


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
            elif kind == 0xC2:
                locals_[args[0]] += 1
            elif kind in (0xA0, 0xA1, 0xA3, 0xAB, 0xAE, 0xB0):
                b, a = stack.pop(), stack.pop()
                stack.append({0xA0: lambda: a + b, 0xA1: lambda: a - b,
                              0xA3: lambda: a / b, 0xAB: lambda: a == b,
                              0xAE: lambda: a <= b, 0xB0: lambda: a >= b}[kind]())
            elif kind == 0x10:
                pc = op.branches[0][1]
            elif kind in (0x11, 0x12):
                take = bool(stack.pop())
                if take == (kind == 0x11):
                    pc = op.branches[0][1]
            elif kind in (0x0C, 0x0D, 0x0E, 0x0F, 0x13, 0x14, 0x15, 0x17, 0x18):
                b, a = stack.pop(), stack.pop()
                take = {0x0C: lambda: not a < b, 0x0D: lambda: not a <= b,
                        0x0E: lambda: not a > b, 0x0F: lambda: not a >= b,
                        0x13: lambda: a == b, 0x14: lambda: a != b,
                        0x15: lambda: a < b, 0x17: lambda: a > b,
                        0x18: lambda: a >= b}[kind]()
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
        _, cls.coordinate_selector, cls.coordinate_limits = code_for(
            cls.client, "LogicManager", "getDropPacketByXY")
        cls.ints = integer_pool(cls.client)
        cls.assignment = retry_assignment()
        _, cfg = read_cbp((ROOT / "web/v2/lang/zh-cn/SystemConfig.cbp").read_bytes())
        cls.lookup_names, cls.lookup_code, cls.lookup_limits = code_for(
            cls.client, "SystemConfigDataMgr", "getPickUpStatusByItemId")

        def value(node):
            if node.kind == 2:
                return node.number()
            if node.kind == 3:
                return node.value.decode("utf-8")
            if node.kind != 4:
                raise AssertionError(f"Unexpected pickup config kind {node.kind}")
            if [c.name for c in node.children] == [str(i) for i in range(len(node.children))]:
                return [value(c) for c in node.children]
            return {c.name: value(c) for c in node.children}

        cls.config = value(cfg)
        cls.ranges = {int(row.child("type").number()):
                      [(r.child("0").number(), r.child("1").number())
                       for r in row.child("idRange").child("0").children if len(r.children) == 2]
                      for row in cfg.children if row.child("itemtype").number() == 0}
        for class_name, methods in {"LocalPlayer": ["setCurrentXY"],
                                    "GameLogic": ["onPathTargetArrived", "onMouseDown", "onMouseClick"]}.items():
            for method in methods:
                _, code, _ = code_for(cls.client, class_name, method)
                assert cls.assignment in code

    def environment(self, item_id=537, count=4, selector="nearest", automatic=True):
        clock = {"ms": 12345}
        switches = {8: True, 13: True}
        state = {"capacity": True}

        def pickup(item, action):
            # Run the real item-range lookup too; category order is authoritative.
            owner = {"getPickUpSelectIndexByType": lambda kind: 0,
                     "getPickUpSelectByType": lambda kind, action: switches.get(kind, False)}
            vm = PickupVM(self.lookup_names, self.ints, {
                "GameData": {"systemConfigProvider": {"getCfg": lambda: self.config}}})
            return vm.run(self.lookup_code,
                          [owner, item, action] + [None] * (self.lookup_limits[1] - 3))

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
        if selector == "coordinate":
            select = lambda: vm.run(self.coordinate_selector,
                                   [manager, 10, 10, automatic]
                                   + [None] * (self.coordinate_limits[1] - 4))
        else:
            select = lambda: vm.run(self.selector, [manager, automatic] + [None] * 9)
        send = lambda: vm.run(self.assignment, [], [drop])
        return clock, switches, state, drop, manager, select, send

    @staticmethod
    def overlapping_drop(drop, clock, **changes):
        other = dict(drop, **changes)
        other["isPickTime"] = lambda: clock["ms"] / 1000 < other["canPickTime"]
        return other

    def test_pending_overlapping_drop_does_not_hide_eligible_material(self):
        clock, _, _, drop, manager, select, send = self.environment(selector="coordinate")
        other = self.overlapping_drop(drop, clock, itemId=568)
        manager["m_DropPacketList"] = [other, drop]
        self.assertIs(select(), drop)
        send()
        self.assertIs(select(), other)
        manager["m_DropPacketList"].remove(other)
        self.assertIsNone(select())
        clock["ms"] += 2000
        self.assertIs(select(), drop)

    def test_overlapping_exclusions_only_skip_the_excluded_drop(self):
        for changes in ({"isAlreadyPickup": True}, {"mapId": 2},
                        {"isCheck": True}, {"canPickTime": 30}, {"itemId": 85}):
            with self.subTest(changes=changes):
                clock, _, _, drop, manager, select, _ = self.environment(selector="coordinate")
                blocked = self.overlapping_drop(drop, clock, **changes)
                manager["m_DropPacketList"].append(blocked)
                self.assertIs(select(), drop)
                manager["m_DropPacketList"].remove(drop)
                self.assertIsNone(select())

    def test_backpack_rejection_does_not_hide_stackable_drop_on_same_tile(self):
        clock, _, _, drop, manager, _, _ = self.environment(selector="coordinate")
        # The real callback may reject equipment while accepting a material
        # that fits into an existing stack in a full backpack.
        # Use actual selector bytecode with a per-item backpack callback.
        names, code, limits = code_for(self.client, "LogicManager", "getDropPacketByXY")
        blocked = self.overlapping_drop(drop, clock, itemType=5)
        manager["m_DropPacketList"].append(blocked)
        vm = PickupVM(names, self.ints, {
            "GameMap": {"defaultMap": {"mapId": 1}}, "Boolean": bool,
            "CallBack": {"isCanPickUpByPack": lambda item: item is drop,
                         "getPickUpStatusByItemId": lambda item, action: True}})
        self.assertIs(vm.run(code, [manager, 10, 10, True] + [None] * (limits[1] - 4)), drop)

    def test_overlap_scan_keeps_coordinate_and_manual_pickup_rules(self):
        clock, _, _, drop, manager, select, _ = self.environment(selector="coordinate")
        manager["m_DropPacketList"] = [self.overlapping_drop(drop, clock, currentX=11),
                                      self.overlapping_drop(drop, clock, currentY=11)]
        self.assertIsNone(select())
        clock, _, _, drop, manager, select, _ = self.environment(
            item_id=85, selector="coordinate", automatic=False)
        drop["isCheck"] = True
        drop["canPickTime"] = 30
        manager["m_DropPacketList"].append(self.overlapping_drop(drop, clock, isAlreadyPickup=True))
        self.assertIs(select(), drop)  # explicit pickup retains its category bypass

    def test_continuous_pickup_with_accumulating_overlapping_drops(self):
        clock, _, _, drop, manager, select, send = self.environment(selector="coordinate")
        clock["ms"] = 6 * 60 * 60 * 1000
        old_drops = []
        for cycle in range(1000):
            # Repeated new drops, lost request, retry and server confirmation.
            # Old filtered items remain on the same tile until despawn.
            old_drops.extend([self.overlapping_drop(drop, clock, itemId=85),
                              self.overlapping_drop(drop, clock, isAlreadyPickup=True)])
            old_drops = old_drops[-12:]  # oldest drops expire
            manager["m_DropPacketList"] = [drop] + old_drops
            self.assertIs(select(), drop)
            send()
            self.assertIsNone(select())
            clock["ms"] += 2000
            self.assertIs(select(), drop)
            manager["m_DropPacketList"].remove(drop)
            self.assertIsNone(select())
            clock["ms"] += 30000

    def test_baseline_reproduces_overlapping_drop_blockage(self):
        if OVERLAP_BASELINE is None:
            self.skipTest("Use --overlap-baseline to demonstrate same-tile blockage")
        names, code, limits = code_for(Path(OVERLAP_BASELINE).read_bytes(),
                                      "LogicManager", "getDropPacketByXY")
        clock, _, _, drop, manager, _, _ = self.environment(selector="coordinate")
        blocked = self.overlapping_drop(drop, clock, canPickTime=30)
        manager["m_DropPacketList"].append(blocked)
        vm = PickupVM(names, self.ints, {
            "GameMap": {"defaultMap": {"mapId": 1}}, "Boolean": bool,
            "CallBack": {"isCanPickUpByPack": lambda item: True,
                         "getPickUpStatusByItemId": lambda item, action: True}})
        args = [manager, 10, 10, True] + [None] * (limits[1] - 4)
        self.assertIsNone(vm.run(code, args))  # old code hides the eligible drop
        self.assertIs(vm.run(self.coordinate_selector, args), drop)

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

    def test_finished_accessories_follow_accessory_switch_and_backpack_protection(self):
        for item in range(5140, 5144):
            with self.subTest(item=item):
                _, switches, state, drop, _, select, _ = self.environment(item, 1)
                switches[14] = True
                self.assertIs(select(), drop)
                switches[14] = False
                self.assertIsNone(select())
                switches[14] = True
                self.assertIs(select(), drop)
                state["capacity"] = False
                self.assertIsNone(select())

    def test_illusion_wing_souls_follow_other_items_instead_of_yuanbao_switch(self):
        for item in range(7157, 7161):
            with self.subTest(item=item):
                clock, switches, state, drop, _, select, send = self.environment(item, 1)
                switches[12] = False
                self.assertIs(select(), drop)
                switches[13] = False
                switches[12] = True
                self.assertIsNone(select())
                switches[13] = True
                self.assertIs(select(), drop)
                state["capacity"] = False
                self.assertIsNone(select())
                state["capacity"] = True
                drop["canPickTime"] = 20
                self.assertIsNone(select())
                clock["ms"] = 21000
                self.assertIs(select(), drop)
                send()
                self.assertIsNone(select())
                clock["ms"] += 2000
                self.assertIs(select(), drop)

        _, switches, _, drop, _, select, _ = self.environment(85, 1)
        self.assertIsNone(select())  # Yuanbao items still follow their own switch.
        switches[12] = True
        self.assertIs(select(), drop)

    def test_wing_and_mount_equipment_follow_other_items_switch_and_pickup_protection(self):
        for item in (*range(6865, 6885), *range(6983, 7003)):
            with self.subTest(item=item):
                clock, switches, state, drop, _, select, send = self.environment(item, 1)
                self.assertIs(select(), drop)
                switches[13] = False
                self.assertIsNone(select())
                switches[13] = True
                self.assertIs(select(), drop)
                state["capacity"] = False
                self.assertIsNone(select())
                state["capacity"] = True
                send()
                self.assertIsNone(select())
                clock["ms"] += 2000
                self.assertIs(select(), drop)

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
    parser.add_argument("--overlap-baseline", type=Path)
    args = parser.parse_args()
    BASELINE = args.baseline
    OVERLAP_BASELINE = args.overlap_baseline
    unittest.main(argv=[__file__], verbosity=2)
