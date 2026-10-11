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
import subprocess
import unittest

from patch_bag_client import ABCReader, encode_u30
from patch_god_equip_state import inspect_abc
from patch_guild_quest_config import read_cbp
from patch_drop_pickup_retry import (CLIENT, ROOT, abc_section, instructions,
                                     patch_failed_pickup_path, patch_movement_pickup,
                                     retry_assignment)

BASELINE = None
OVERLAP_BASELINE = None
IDLE_BASELINE = None
COMBAT_BASELINE = None
MOVEMENT_BASELINE = "c5f3249efe228ce16a3a91cf2e58b2fb5392e181"


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
            if kind in (0x02, 0x09, 0x80, 0x76, 0x82):
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
            elif kind == 0x08:
                locals_[args[0]] = None
            elif kind == 0x60:
                stack.append(self.world[self.names[args[0]]])
            elif kind in (0x5D, 0x5E):
                stack.append(self.world)
            elif kind == 0x66:
                name = self.names[args[0]]
                if not name:  # MultinameL: array index comes from the stack
                    index, owner = stack.pop(), stack.pop()
                    stack.append(owner[index])
                else:
                    owner = stack.pop()
                    stack.append(len(owner) if name == "length" else owner[name])
            elif kind in (0x61, 0x68):
                value, owner = stack.pop(), stack.pop()
                name = self.names[args[0]]
                owner[name] = int(value) if name == "canPickTime" else value
            elif kind in (0x46, 0x4F, 0x4E):
                index, count = args
                call_args = [stack.pop() for _ in range(count)][::-1]
                owner = stack.pop()
                name = "superUpdate" if kind == 0x4E else self.names[index]
                result = owner[name](*call_args)
                if kind == 0x46:
                    stack.append(result)
            elif kind == 0x4A:
                index, count = args
                call_args = [stack.pop() for _ in range(count)][::-1]
                factory = stack.pop()
                stack.append(factory[self.names[index]](*call_args))
            elif kind == 0x87:
                stack.pop()  # astypelate, all supplied drops have the correct type
            elif kind in (0x73, 0x74):
                stack.append(int(stack.pop()))
            elif kind == 0x75:
                stack.append(float(stack.pop()))
            elif kind in (0x93, 0xC1):
                stack.append(stack.pop() - 1)
            elif kind in (0x91, 0xC0):
                stack.append(stack.pop() + 1)
            elif kind == 0x96:
                stack.append(not stack.pop())
            elif kind == 0xC2:
                locals_[args[0]] += 1
            elif kind in (0xA0, 0xA1, 0xA2, 0xA3, 0xAB, 0xAD, 0xAE, 0xAF, 0xB0):
                b, a = stack.pop(), stack.pop()
                stack.append({0xA0: lambda: a + b, 0xA1: lambda: a - b,
                              0xA2: lambda: a * b, 0xA3: lambda: a / b,
                              0xAB: lambda: a == b, 0xAD: lambda: a < b,
                              0xAE: lambda: a <= b, 0xAF: lambda: a > b,
                              0xB0: lambda: a >= b}[kind]())
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
            elif kind == 0x47:
                return None
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

    def environment(self, item_id=537, count=4, selector="nearest", automatic=True,
                    indexes=None):
        clock = {"ms": 12345}
        switches = {8: True, 13: True}
        state = {"capacity": True}

        def pickup(item, action):
            # Run the real item-range lookup too; category order is authoritative.
            owner = {"getPickUpSelectIndexByType": lambda kind: (indexes or {}).get(kind, 0),
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

    def movement_environment(self, source=None, item_id=537):
        """Run the real tile selector, movement pickup block and request sender."""
        clock, switches, state, drop, manager, _, _ = self.environment(item_id, 3)
        switches[14] = True  # the existing accessory/material category includes tempering stone
        names, code, limits = code_for(source or self.client, "LocalPlayer", "setCurrentXY")
        ops = instructions(code)
        first = next(op.start for op in ops
                     if op.opcode == 0x60 and names[op.operands[0]] == "AutoPick")
        last = next(op.start for op in ops
                    if op.opcode == 0x60 and names[op.operands[0]] == "LogicEventDispatcher")
        # Keep original instruction offsets and exit targets while isolating
        # pickup from unrelated movement animation and event dispatch.
        movement = b"\x02" * first + code[first:last] + b"\x47"
        instructions(movement)
        data, (_, _, a, b) = abc_section(self.client)
        sender_names, _, bodies = inspect_abc(data[a:b], "MsgSender")
        sender_markers = [b"\x60" + encode_u30(index)
                          for index in (37281, 37282)]
        candidates = [data[a + pos:a + pos + size] for pos, size, _ in bodies.values()
                      if all(marker in data[a + pos:a + pos + size] for marker in sender_markers)]
        self.assertEqual(len(candidates), 1)
        sender_code = candidates[0]
        packets = []
        sender_world = {"getTimer": lambda: clock["ms"], "lastPickItemId": 0,
                        "nextPickSaveItemTime": 0,
                        "PacketTypes": {"DROP": "drop"},
                        "ClientPacketTypes": {"DROP_ITEM_PICKUP": "pickup"},
                        "sendMsgFn": lambda packet: packets.append(packet["recog"])}

        def packet():
            result = {}
            result["writeCmd"] = lambda family, command: self.assertEqual(
                (family, command), ("drop", "pickup"))
            result["writeUnsignedInt"] = lambda recog: result.update(recog=recog)
            return result

        sender_world["CustomByteArray"] = packet
        sender_vm = PickupVM(sender_names, self.ints, sender_world)
        sender = lambda recog: sender_vm.run(sender_code, [sender_world, recog, None, None])

        def category(item, action):
            owner = {"getPickUpSelectIndexByType": lambda kind: 0,
                     "getPickUpSelectByType": lambda kind, action: switches.get(kind, False)}
            return PickupVM(self.lookup_names, self.ints, {
                "GameData": {"systemConfigProvider": {"getCfg": lambda: self.config}}}
            ).run(self.lookup_code, [owner, item, action]
                  + [None] * (self.lookup_limits[1] - 3))

        selector_world = {"GameMap": {"defaultMap": {"mapId": 1}}, "Boolean": bool,
                          "CallBack": {"isCanPickUpByPack": lambda d: state["capacity"],
                                       "getPickUpStatusByItemId": category,
                                       "getPickUpSelectByType": lambda kind, action:
                                       switches.get(kind, False)}}
        selector_vm = PickupVM(self.names, self.ints, selector_world)
        at_xy = lambda x, y: selector_vm.run(self.coordinate_selector,
            [manager, x, y, True] + [None] * (self.coordinate_limits[1] - 4))
        player = {"m_autoPickLastTime": 0}
        world = {"AutoPick": True, "getTimer": lambda: clock["ms"],
                 "AUTO_PICK_TIME_INTERVAL": 500,
                 "LogicManager": {"defaultManager": {"getDropPacketByXY": at_xy}},
                 "MsgSender": {"sendPickupDropItem": sender}}
        move = lambda x, y: PickupVM(names, self.ints, world).run(
            movement, [player, x, y] + [None] * (limits[1] - 3))
        drop["m_nRecog"] = 42
        return clock, switches, state, drop, manager, player, world, sender_world, packets, move

    def test_movement_collects_different_tiles_within_player_interval(self):
        for item in (537, 5648):  # gemstone crystal (100), tempering stone
            with self.subTest(item=item):
                clock, _, _, drop, manager, _, _, _, packets, move = (
                    self.movement_environment(item_id=item))
                other = self.overlapping_drop(drop, clock, currentX=11, m_nRecog=43)
                manager["m_DropPacketList"].append(other)
                move(10, 10)
                clock["ms"] += 250
                move(11, 10)
                self.assertEqual(packets, [42, 43])
                for _ in range(20):
                    move(10, 10)
                    move(11, 10)
                self.assertEqual(packets, [42, 43])  # each drop retains its own cooldown

    def test_movement_retries_suppressed_request_and_stops_after_confirmation(self):
        clock, _, _, drop, manager, _, _, sender_world, packets, move = (
            self.movement_environment())
        sender_world.update(lastPickItemId=42, nextPickSaveItemTime=clock["ms"] + 1000)
        move(10, 10)  # real MsgSender suppresses a duplicate, no server confirmation
        self.assertEqual(packets, [])
        for _ in range(10):
            clock["ms"] += 100
            move(10, 10)
        self.assertEqual(packets, [])
        clock["ms"] = drop["canPickTime"] * 1000
        move(10, 10)
        self.assertEqual(packets, [42])
        for _ in range(20):
            move(10, 10)
        self.assertEqual(packets, [42])
        clock["ms"] = drop["canPickTime"] * 1000
        move(10, 10)  # accepted send without acknowledgement still retries once per cooldown
        self.assertEqual(packets, [42, 42])
        manager["m_DropPacketList"].remove(drop)  # DROP_ITEM_DEL
        clock["ms"] += 3000
        move(10, 10)
        self.assertEqual(packets, [42, 42])

    def test_movement_preserves_category_capacity_protection_and_auto_pick_switch(self):
        for reason in ("category", "capacity", "protection", "disabled", "excluded", "map"):
            with self.subTest(reason=reason):
                _, switches, state, drop, _, _, world, _, packets, move = (
                    self.movement_environment())
                if reason == "category": switches[8] = False
                elif reason == "capacity": state["capacity"] = False
                elif reason == "protection": drop["canPickTime"] = 30
                elif reason == "disabled": world["AutoPick"] = False
                elif reason == "excluded": drop["isCheck"] = True
                else: drop["mapId"] = 2
                move(10, 10)
                self.assertEqual(packets, [])

    def test_movement_baseline_loses_second_tile_and_patch_changes_only_the_gate(self):
        source = subprocess.check_output(["git", "show", MOVEMENT_BASELINE + ":web/GameFrame.swf"],
                                         cwd=ROOT)
        clock, _, _, drop, manager, _, _, _, packets, move = self.movement_environment(source)
        other = self.overlapping_drop(drop, clock, currentX=11, m_nRecog=43)
        manager["m_DropPacketList"].append(other)
        move(10, 10)
        clock["ms"] += 250
        move(11, 10)
        self.assertEqual(packets, [42])  # retained original SWF reproduces the skip
        data, (tag, payload, a, b) = abc_section(source)
        abc = data[a:b]
        patched = patch_movement_pickup(abc)
        self.assertEqual(len(patched), len(abc))
        differences = [i for i, (old, new) in enumerate(zip(abc, patched)) if old != new]
        self.assertEqual(len(differences), 4)
        self.assertEqual(differences, list(range(differences[0], differences[0] + 4)))
        self.assertEqual(patch_movement_pickup(patched), patched)
        names, traits, bodies = inspect_abc(abc, "LocalPlayer")
        pos, size, _ = bodies[traits["setCurrentXY"][0]]
        self.assertTrue(pos <= differences[0] < differences[-1] < pos + size)
        self.assertEqual(inspect_abc(patched, "LocalPlayer")[2], bodies)
        current, (current_tag, current_payload, current_a, current_b) = abc_section(self.client)
        expected = patch_failed_pickup_path(patched)
        self.assertEqual(current[current_a:current_b], expected)
        self.assertEqual((current_tag, current_payload, current_a), (tag, payload, a))
        self.assertEqual(current[8:tag], data[8:tag])
        self.assertEqual(current[payload:current_a], data[payload:a])
        self.assertEqual(current[current_b:], data[b:])  # other SWF tags remain identical
        _, _, new_bodies = inspect_abc(expected, "LocalPlayer")
        changed = []
        for method, (old_start, old_size, old_limits) in bodies.items():
            new_start, new_size, new_limits = new_bodies[method]
            self.assertEqual(new_limits, old_limits)
            if abc[old_start:old_start + old_size] != expected[new_start:new_start + new_size]:
                changed.append(method)
            else:
                self.assertEqual(old_size, new_size)
        self.assertEqual(set(changed), {traits["setCurrentXY"][0],
                                        traits["leaveForNearestItemForAutoFight"][0]})
        self.assertEqual(patch_failed_pickup_path(expected), expected)

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

    def stationary_environment(self, source=None, item_id=537, indexes=None):
        clock, switches, state, drop, manager, select, _ = self.environment(
            item_id, selector="coordinate", indexes=indexes)
        nearest = self.environment(item_id, indexes=indexes)
        nearest[4]["m_DropPacketList"] = manager["m_DropPacketList"]
        names, update, limits = code_for(source or self.client, "LocalPlayer", "update")
        calls = []
        player = {"m_dwUpdateTick": 0, "m_autoPickLastTime": 0,
                  "m_dwActionTimeOut": 0, "m_StateLoopEffect": None,
                  "m_nAction": 0, "currentX": 10, "currentY": 10,
                  "superUpdate": lambda tick: None}
        player.update(autoFighting=False, m_boUnderPath=False)
        player.update({name: False for name in ("moving", "jumping", "died",
                       "isDivineSwording", "stalling", "practice", "fastBattling")})
        drop["m_nRecog"] = 42

        def at_xy(x, y, auto):
            self.assertEqual((x, y, auto), (10, 10, True))
            return select()

        def nearest_drop(auto):
            self.assertTrue(auto)
            nearest[0]["ms"] = clock["ms"]
            nearest[1].clear()
            nearest[1].update(switches)
            nearest[2].update(state)
            return nearest[5]()

        def leave_for_drop():
            item = nearest_drop(True)
            self.assertIsNotNone(item)
            self.invoke_pickup_path(player, item, True)

        player.update(paths=[], leaveForNearestItemForAutoFight=leave_for_drop)
        world = {"getTimer": lambda: clock["ms"], "AutoPick": True,
                 "Math": {"abs": abs},
                 "GameMap": {"defaultMap": {"loadingMap": False}},
                 "LogicManager": {"defaultManager": {"getDropPacketByXY": at_xy,
                                  "getNearestDropPacket": nearest_drop}},
                 "MsgSender": {"sendPickupDropItem": lambda recog: calls.append(recog)},
                 "StandardActions": {"SA_RUN": 1, "SA_WALK": 2}}
        vm = PickupVM(names, self.ints, world)
        tick = lambda: vm.run(update, [player, clock["ms"]] + [None] * (limits[1] - 2))
        return clock, switches, state, drop, manager, player, world, calls, tick

    def invoke_pickup_path(self, player, drop, accepted):
        """Exercise the shipped pickup helper, including its failure recovery."""
        names, code, limits = code_for(self.client, "LocalPlayer", "leaveForNearestItemForAutoFight")

        def leave_for(x, y, action):
            self.assertEqual(action, ("resume_fight", drop))
            player["pathAttempts"] = player.get("pathAttempts", 0) + 1
            if accepted:
                player["paths"].append((x, y, drop["itemId"]))
                player["m_boUnderPath"] = True
            return accepted

        player["stopAutoFight"] = lambda: player.update(autoFighting=False)
        player["startAutoFight"] = lambda: player.update(autoFighting=True)
        player["leaveFor"] = leave_for
        world = {"LogicManager": {"defaultManager": {
            "getNearestDropPacket": lambda automatic: drop}},
            "PathEndAction": lambda kind, item: (kind, item),
            "PathEndActionType": {"PE_ACT_FIGHT_AND_PICKUP": "resume_fight"}}
        PickupVM(names, self.ints, world).run(code, [player] + [None] * (limits[1] - 1))

    def test_failed_pickup_path_resumes_fight_and_later_update_can_succeed(self):
        clock, _, _, drop, _, player, _, calls, tick = self.stationary_environment()
        drop["currentX"] = 11
        player["autoFighting"] = True
        player["leaveForNearestItemForAutoFight"] = lambda: self.invoke_pickup_path(player, drop, False)
        tick()
        self.assertEqual(player["pathAttempts"], 1)
        self.assertTrue(player["autoFighting"])
        self.assertFalse(player["m_boUnderPath"])
        self.assertEqual(calls, [])
        tick()
        clock["ms"] += 250
        tick()
        self.assertEqual(player["pathAttempts"], 1)
        clock["ms"] += 750
        player["leaveForNearestItemForAutoFight"] = lambda: self.invoke_pickup_path(player, drop, True)
        tick()
        self.assertEqual(player["pathAttempts"], 2)
        self.assertEqual(player["paths"], [(11, 10, 537)])
        self.assertFalse(player["autoFighting"])
        self.assertTrue(player["m_boUnderPath"])

    def test_continuously_failed_pickup_paths_retry_only_on_later_ticks(self):
        clock, _, _, drop, _, player, _, calls, tick = self.stationary_environment()
        drop["currentX"] = 11
        player["autoFighting"] = True
        player["leaveForNearestItemForAutoFight"] = lambda: self.invoke_pickup_path(player, drop, False)
        for count in range(1, 11):
            tick()
            self.assertEqual(player["pathAttempts"], count)
            self.assertTrue(player["autoFighting"])
            self.assertEqual(player["paths"], [])
            for _ in range(10):
                tick()
            self.assertEqual(player["pathAttempts"], count)
            clock["ms"] += 1000
        self.assertEqual(calls, [])

    def test_auto_fight_collects_nearby_first_tier_weapon_and_both_clothes(self):
        for item_id in (430, 431, 432):
            with self.subTest(item=item_id):
                clock, switches, _, drop, manager, player, _, calls, tick = (
                    self.stationary_environment(item_id=item_id))
                switches[5] = True  # unmodified default for all rebirth equipment
                drop.update(currentX=11, currentY=12)
                player.update(autoFighting=True, m_boDoAttack=True)
                tick()
                self.assertEqual(player["paths"], [(11, 12, item_id)])
                self.assertEqual(calls, [])  # pickup uses path arrival, never at a distance
                clock["ms"] += 2000
                tick()
                self.assertEqual(len(player["paths"]), 1)
                drop.update(currentX=10, currentY=10)
                player.update(m_boUnderPath=False)
                clock["ms"] += 500
                tick()
                self.assertEqual(calls, [42])
                manager["m_DropPacketList"].clear()
                clock["ms"] += 2000
                tick()
                self.assertEqual(calls, [42])

    def test_nearby_equipment_preserves_settings_protection_capacity_and_distance(self):
        for reason in ("disabled", "tier", "protected", "capacity", "far_x", "far_y",
                       "manual", "path", "moving", "died", "jumping", "autopick"):
            with self.subTest(reason=reason):
                indexes = {5: 1} if reason == "tier" else None
                clock, switches, state, drop, _, player, world, calls, tick = (
                    self.stationary_environment(item_id=430, indexes=indexes))
                switches[5] = reason != "disabled"
                drop.update(currentX=11)
                player["autoFighting"] = reason != "manual"
                if reason == "protected": drop["canPickTime"] = 20
                if reason == "capacity": state["capacity"] = False
                if reason == "far_x": drop["currentX"] = 13
                if reason == "far_y": drop["currentY"] = 13
                if reason == "path": player["m_boUnderPath"] = True
                if reason in ("moving", "died", "jumping"): player[reason] = True
                if reason == "autopick": world["AutoPick"] = False
                tick()
                self.assertEqual(player["paths"], [])
                self.assertEqual(calls, [])

    def test_nearby_equipment_recovers_when_protection_ends_during_attacks(self):
        clock, switches, _, drop, _, player, _, calls, tick = (
            self.stationary_environment(item_id=431))
        switches[5] = True
        drop.update(currentX=12, currentY=10, canPickTime=20)
        player.update(autoFighting=True, m_boDoAttack=True)
        tick()
        self.assertEqual(player["paths"], [])
        clock["ms"] = 20000
        tick()
        self.assertEqual(player["paths"], [(12, 10, 431)])
        self.assertEqual(calls, [])

    def test_existing_pickup_path_uses_action_that_resumes_auto_fight(self):
        _, switches, _, drop, manager, select, _ = self.environment(430)
        switches[5] = True
        drop.update(currentX=11, currentY=12)
        names, code, limits = code_for(
            self.client, "LocalPlayer", "leaveForNearestItemForAutoFight")
        paths, stopped = [], []
        player = {"stopAutoFight": lambda: stopped.append(True),
                  "leaveFor": lambda x, y, action: (paths.append((x, y, action)) or True),
                  "startAutoFight": lambda: self.fail("Drop exists; must schedule pickup")}
        world = {"LogicManager": {"defaultManager": {"getNearestDropPacket":
                  lambda automatic: select()}},
                 "PathEndAction": lambda kind, item: (kind, item),
                 "PathEndActionType": {"PE_ACT_FIGHT_AND_PICKUP": "resume_fight"}}
        PickupVM(names, self.ints, world).run(code, [player] + [None] * (limits[1] - 1))
        self.assertEqual(stopped, [True])
        self.assertEqual(paths, [(11, 12, ("resume_fight", drop))])

    def test_baseline_reproduces_nearby_equipment_skipped_during_continuous_combat(self):
        if COMBAT_BASELINE is None:
            self.skipTest("Use --combat-baseline to demonstrate combat pickup gap")
        clock, switches, _, drop, _, player, _, calls, tick = self.stationary_environment(
            Path(COMBAT_BASELINE).read_bytes(), item_id=430)
        switches[5] = True
        drop.update(currentX=11)
        player.update(autoFighting=True, m_boDoAttack=True)
        for _ in range(10):
            tick()
            clock["ms"] += 2000
        self.assertEqual(player["paths"], [])
        self.assertEqual(calls, [])

    def test_all_boss_weapon_and_clothes_candidates_follow_default_equipment_switch(self):
        from lupa.lua51 import LuaRuntime
        lua = LuaRuntime(unpack_returned_tuples=True)
        lua.execute("LocalDT={}")
        lua.execute((ROOT / "Server/S1001/data/config/monster/BossEquipmentDropCfg.lua")
                    .read_text("utf-8"))
        ids = {int(item) for profile in lua.globals().LocalDT.BossEquipmentDrop.profiles.values()
               for weights in profile.weights.values() for row in weights.values()
               for field in ("weapons", "clothes") for item in row[field].values()}
        self.assertTrue({430, 431, 432}.issubset(ids))
        for item_id in sorted(ids):
            for selector in ("nearest", "coordinate"):
                with self.subTest(item=item_id, selector=selector):
                    _, switches, _, drop, _, select, _ = self.environment(
                        item_id, 1, selector=selector)
                    switches[5] = True
                    self.assertIs(select(), drop)
                    switches[5] = False
                    self.assertIsNone(select())

    def test_single_drop_retries_without_moving(self):
        clock, _, _, drop, manager, player, _, calls, tick = self.stationary_environment()
        tick()
        self.assertEqual(calls, [42])
        tick()  # same tick never repeats the scan
        clock["ms"] += 500
        tick()
        self.assertEqual(calls, [42])
        clock["ms"] += 1500
        tick()  # no server acknowledgement: retry while standing on same tile
        self.assertEqual(calls, [42, 42])
        self.assertEqual((player["currentX"], player["currentY"]), (10, 10))
        manager["m_DropPacketList"].clear()  # server confirms collection
        clock["ms"] += 2000
        tick()
        self.assertEqual(calls, [42, 42])

    def test_single_drop_recovers_after_protection_settings_and_capacity_change(self):
        clock, switches, state, drop, _, _, _, calls, tick = self.stationary_environment()
        drop["canPickTime"] = 20
        tick()
        self.assertEqual(calls, [])
        clock["ms"] = 20000
        state["capacity"] = False
        tick()
        self.assertEqual(calls, [])
        state["capacity"] = True
        switches[8] = False
        clock["ms"] += 500
        tick()
        self.assertEqual(calls, [])
        switches[8] = True
        clock["ms"] += 500
        tick()
        self.assertEqual(calls, [42])

    def test_stationary_pickup_respects_disabled_and_unavailable_player_states(self):
        for name in ("moving", "jumping", "died", "isDivineSwording",
                     "stalling", "practice", "fastBattling"):
            with self.subTest(state=name):
                _, _, _, _, _, player, _, calls, tick = self.stationary_environment()
                player[name] = True
                tick()
                self.assertEqual(calls, [])
        for guard in ("disabled", "loading", "no_map", "no_manager"):
            with self.subTest(guard=guard):
                _, _, _, _, _, _, world, calls, tick = self.stationary_environment()
                if guard == "disabled":
                    world["AutoPick"] = False
                elif guard == "loading":
                    world["GameMap"]["defaultMap"]["loadingMap"] = True
                elif guard == "no_map":
                    world["GameMap"]["defaultMap"] = None
                else:
                    world["LogicManager"]["defaultManager"] = None
                tick()
                self.assertEqual(calls, [])

    def test_stationary_pickup_preserves_movement_throttle_and_long_session_retries(self):
        clock, _, _, _, _, player, _, calls, tick = self.stationary_environment()
        player["m_autoPickLastTime"] = clock["ms"] - 100
        tick()
        self.assertEqual(calls, [])
        clock["ms"] += 500
        tick()
        self.assertEqual(calls, [42])
        clock["ms"] = 12 * 60 * 60 * 1000
        for _ in range(100):
            tick()
            clock["ms"] += 2000
        self.assertEqual(len(calls), 101)

    def test_baseline_reproduces_single_drop_missing_stationary_retry(self):
        if IDLE_BASELINE is None:
            self.skipTest("Use --idle-baseline to demonstrate missing stationary retries")
        clock, _, _, _, _, _, _, calls, tick = self.stationary_environment(
            Path(IDLE_BASELINE).read_bytes())
        for _ in range(10):
            tick()
            clock["ms"] += 2000
        self.assertEqual(calls, [])  # old player updates never recheck the tile

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
    parser.add_argument("--idle-baseline", type=Path)
    parser.add_argument("--combat-baseline", type=Path)
    args = parser.parse_args()
    BASELINE = args.baseline
    OVERLAP_BASELINE = args.overlap_baseline
    IDLE_BASELINE = args.idle_baseline
    COMBAT_BASELINE = args.combat_baseline
    unittest.main(argv=[__file__], verbosity=2)
