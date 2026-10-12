"""Execute the installed confirmation bytecode and verify its narrow patch."""
import subprocess
import unittest
from functools import cmp_to_key

from patch_bag_bind_sort import CLIENT, PROMPT, CHECK_LABEL, ENTRY, STATE, patch_swf, patch_refresh_abc
from patch_drop_pickup_retry import abc_section, instructions
from patch_appearance_upgrade import inspect_abc, pools
from patch_item_count_u16_client import inspect_abc_full

BASELINE = "d5cb2faab95bd4af2ddd4c1a06d088768a6d1279"
REFRESH_BASELINE = "bec638f371dda5b8597df6180026cf3c4bdc5e04"

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


class Grid:
    def __init__(self):
        self.cells = [{"data": None, "lock": False} for _ in range(256)]


class BagSnapshotVM:
    """Run shipped snapshot/sort/filter/grid bytecode with only IO/UI fixtures.

    UserItem parsing is covered by the existing count-protocol tests. A packet
    fixture supplies the decoded objects here; the real BagCC loop, initializer,
    category insertion, sort callback, events and grid rebuilding still execute.
    """
    def __init__(self, swf=None):
        raw, (_, _, start, end) = abc_section(swf or CLIENT.read_bytes())
        self.abc = raw[start:end]
        self.names, self.catalog, self.bodies = inspect_abc(self.abc)
        self.pool = pools(self.abc)
        self.mgr = {"class": "UserItemMgr", "bagItems": None,
                    "bagItemsNotSort": None, "bagItemTypeIndex": [0] * 7,
                    "goodHasChange": False}
        self.grid = Grid()
        self.page = {"class": "BackPackWin", "_gridAll": self.grid}
        self.events, self.calls = [], []
        self.classes = {"GlobalData": {"itemDataMgr": self.mgr, "role": {"vipGride": 0}},
                        "BackPackWin": {"instance": self.page}, "UserItemMgr": {
                            "BAG_TYPE_ALL": 0, "BAG_TYPE_EQUIP": 1, "BAG_TYPE_MEDICINAL": 2,
                            "BAG_TYPE_TASK": 3, "BAG_TYPE_OTHER": 4, "BAG_TYPE_HERO": 5,
                            "BAG_TYPE_MAGIC": 6}, "MAX_VOLUME": 256,
                        "Math": {"class": "Math"}, "ItemFunc": {"class": "ItemFunc"}}
        self.classes["GameConstItem"] = {"Config_Drup_Collect": []}

    def property(self, obj, name):
        if isinstance(obj, Grid):
            return len(obj.cells) if name == "maxCount" else getattr(obj, name, None)
        if isinstance(obj, list):
            return len(obj) if name == "length" else None
        if isinstance(obj, dict):
            if name in obj:
                return obj[name]
            cl = obj.get("class")
            if cl in self.catalog and name in self.catalog[cl]["instance"]:
                return (obj, self.catalog[cl]["instance"][name][0])
        return None

    def call(self, obj, name, args):
        self.calls.append(name)
        if name == "readShort":
            return len(obj["items"])
        if name == "initEvent":
            return None  # Event listener identity is stable in Flash.
        if name == "getItemBagType":
            return args[0]["bagType"]
        if name == "getBagItemCount":
            return len(self.mgr["bagItems"])
        if name == "sortItemFunction":
            return (args[0]["wItemId"] > args[1]["wItemId"]) - (args[0]["wItemId"] < args[1]["wItemId"])
        if name == "dispatchEvent":
            event = args[0]
            self.events.append(event[0])
            if event[0] == "USERITEM_INIT_COMPLETE":
                self.run(self.page, "initCompleteHadnler", (event,))
            return None
        if name in ("doLevelChange", "checkBagIsFull", "initCheckSynthesis", "sendCollectEquipStatus"):
            return None
        if name == "min":
            return min(args)
        if isinstance(obj, Grid):
            if name == "clear":
                for cell in obj.cells:
                    cell["data"] = None
                return None
            if name == "getByIndex":
                return obj.cells[args[0]]
            if name == "setData":
                obj.cells[args[0]]["data"] = args[1]
                return None
        if isinstance(obj, list):
            if name == "concat":
                return obj.copy()
            if name == "slice":
                return obj[args[0]:args[1]]
            if name == "push":
                obj.extend(args)
                return len(obj)
            if name == "indexOf":
                return next((i for i, value in enumerate(obj) if value is args[0]), -1)
            if name == "splice":
                start, count, *values = args
                removed = obj[start:start + count]
                obj[start:start + count] = values
                return removed
            if name == "sort":
                target, method = args[0]
                obj.sort(key=cmp_to_key(lambda first, second: self.run(target, method, (first, second))))
                return obj
        if isinstance(obj, dict) and obj.get("class") in self.catalog:
            cl = obj["class"]
            scope = "static" if cl == "BagCC" else "instance"
            if name in self.catalog[cl][scope]:
                return self.run(obj, self.catalog[cl][scope][name][0], args)
        raise AssertionError((name, obj, args))

    def run(self, receiver, method, args=()):
        if isinstance(method, str):
            cl = receiver["class"]
            method = self.catalog[cl]["static" if cl == "BagCC" else "instance"][method][0]
        start, size, limits = self.bodies[method]
        ops = {op.start: op for op in instructions(self.abc[start:start + size])}
        local = {0: receiver, **{i + 1: value for i, value in enumerate(args)}}
        stack, pos, maximum = [], 0, 0
        for _ in range(20000):
            op = ops[pos]
            pos = op.end
            kind, values = op.opcode, op.operands
            if 0xd0 <= kind <= 0xd3:
                stack.append(local[kind - 0xd0])
            elif 0xd4 <= kind <= 0xd7:
                local[kind - 0xd4] = stack.pop()
            elif kind == 0x62:
                stack.append(local[values[0]])
            elif kind == 0x63:
                local[values[0]] = stack.pop()
            elif kind in (0x30, 0x29):
                stack.pop()
            elif kind == 0x09:
                pass
            elif kind in (0x60, 0x5d):
                name = self.names[values[0]]
                stack.append(self.classes.get(name, {"class": name}))
            elif kind == 0x66:
                name = self.names[values[0]]
                if self.pool["names"][3][values[0]][0] in (27, 28):
                    index = stack.pop()
                    stack.append(stack.pop()[index])
                else:
                    obj = stack.pop()
                    if isinstance(obj, dict) and obj.get("class") == "ItemEvent":
                        stack.append(name)
                    else:
                        stack.append(self.property(obj, name))
            elif kind in (0x61, 0x68):
                value = stack.pop()
                if self.pool["names"][3][values[0]][0] in (27, 28):
                    index, obj = stack.pop(), stack.pop()
                    obj[index] = value
                else:
                    obj, name = stack.pop(), self.names[values[0]]
                    if isinstance(obj, Grid):
                        setattr(obj, name, value)
                    else:
                        obj[name] = value
            elif kind in (0x24, 0x25):
                stack.append(values[0])
            elif kind == 0x20:
                stack.append(None)
            elif kind in (0x26, 0x27):
                stack.append(kind == 0x26)
            elif kind == 0x2c:
                stack.append(self.pool["strings"][3][values[0]])
            elif kind in (0x80, 0x87, 0x82):
                if kind == 0x87:
                    stack.pop()
                    value = stack.pop()
                    stack.append(value)
            elif kind == 0x73:
                stack.append(int(stack.pop()))
            elif kind == 0x76:
                value = stack.pop()
                stack.append(value is not None and value is not False and value != 0)
            elif kind == 0x96:
                stack.append(not stack.pop())
            elif kind == 0x2a:
                stack.append(stack[-1])
            elif kind == 0x53:
                types = [stack.pop() for _ in range(values[0])]
                stack.pop()
                stack.append({"class": "Vector", "type": types[0]["class"]})
            elif kind in (0x42, 0x4a):
                count = values[0] if kind == 0x42 else values[1]
                arguments = [stack.pop() for _ in range(count)][::-1]
                target = stack.pop()
                name = target["class"]
                if name == "Vector":
                    stack.append([0 if target.get("type") == "uint" else None] * (arguments[0] if arguments else 0))
                elif name == "UserItem":
                    packet = arguments[0]
                    stack.append(packet["items"][packet["index"]])
                    packet["index"] += 1
                elif name == "ItemEvent":
                    stack.append(arguments)
                else:
                    raise AssertionError(name)
            elif kind == 0x56:
                stack.append([stack.pop() for _ in range(values[0])][::-1])
            elif kind in (0x46, 0x4f):
                arguments = [stack.pop() for _ in range(values[1])][::-1]
                result = self.call(stack.pop(), self.names[values[0]], arguments)
                if kind == 0x46:
                    stack.append(result)
            elif kind in (0xa0, 0xa1, 0xa2, 0xab, 0xb0):
                right, left = stack.pop(), stack.pop()
                stack.append({0xa0: lambda: left + right, 0xa1: lambda: left - right,
                              0xa2: lambda: left * right, 0xab: lambda: left == right,
                              0xb0: lambda: left >= right}[kind]())
            elif kind in (0x91, 0x93):
                stack.append(stack.pop() + (1 if kind == 0x91 else -1))
            elif kind == 0xc2:
                local[values[0]] += 1
            elif kind == 0x08:
                local.pop(values[0], None)
            elif kind in (0x10, 0x11, 0x12, 0x13, 0x14, 0x0d, 0x0e, 0x15, 0x0c):
                if kind == 0x10:
                    take = True
                elif kind in (0x11, 0x12):
                    value = stack.pop()
                    truth = value is not None and value is not False and value != 0
                    take = truth == (kind == 0x11)
                else:
                    right, left = stack.pop(), stack.pop()
                    take = {0x13: lambda: left == right, 0x14: lambda: left != right,
                            0x0d: lambda: not left <= right, 0x0e: lambda: not left > right,
                            0x15: lambda: left < right, 0x0c: lambda: not left < right}[kind]()
                if take:
                    pos = op.branches[0][1]
            elif kind in (0x47, 0x48):
                result = stack.pop() if kind == 0x48 else None
                assert not stack
                assert maximum <= limits[0], (method, maximum, limits)
                assert max(local) < limits[1], (method, local, limits)
                return result
            else:
                raise AssertionError((method, hex(kind)))
            maximum = max(maximum, len(stack))
        raise AssertionError("Snapshot bytecode did not terminate")

    def snapshot(self, items):
        self.run({"class": "BagCC"}, "doQueryMyItem", ({"items": items, "index": 0},))


class BagSnapshotTests(unittest.TestCase):
    def item(self, guid, item_id=6703, count=1, kind=4):
        return {"class": "UserItem", "series": guid, "wItemId": item_id, "btCount": count,
                "stdItem": {"id": item_id, "bagType": kind}}

    def test_original_query_discards_merged_snapshot_and_leaves_hole(self):
        old = subprocess.check_output(["git", "show", REFRESH_BASELINE + ":web/GameFrame.swf"])
        vm = BagSnapshotVM(old)
        first, second, other = self.item(1), self.item(2), self.item(3, 7197)
        vm.snapshot([first, second, other])
        vm.mgr["bagItems"].remove(second)
        vm.grid.cells[1]["data"] = None  # Original delete notification clears only its cell.
        vm.snapshot([self.item(1, count=2), other])
        self.assertEqual(vm.grid.cells[0]["data"]["btCount"], 1)
        self.assertIsNone(vm.grid.cells[1]["data"])
        self.assertIs(vm.grid.cells[2]["data"], other)
        self.assertEqual(vm.events.count("USERITEM_INIT_COMPLETE"), 1)

    def test_full_query_replaces_items_and_compacts_grid_after_merge(self):
        vm = BagSnapshotVM()
        vm.snapshot([self.item(1), self.item(2), self.item(3, 7197)])
        vm.grid.cells[1]["data"] = None
        vm.mgr["goodHasChange"] = False
        merged, other = self.item(1, count=2), self.item(3, 7197)
        vm.snapshot([other, merged])
        self.assertEqual([item["series"] for item in vm.mgr["bagItems"]], [1, 3])
        self.assertEqual([cell["data"] for cell in vm.grid.cells[:2]], [merged, other])
        self.assertTrue(all(cell["data"] is None for cell in vm.grid.cells[2:]))
        self.assertEqual(vm.page["currentCount"], 2)
        self.assertEqual(vm.events.count("USERITEM_INIT_COMPLETE"), 2)
        self.assertTrue(vm.mgr["goodHasChange"])

    def test_repeated_snapshots_reset_categories_and_preserve_filter_results(self):
        vm = BagSnapshotVM()
        for repeat in range(4):
            items = [self.item(1, 7197, kind=4), self.item(2, 50, kind=1),
                     self.item(3, 6703, kind=4), self.item(4, 99, kind=2)]
            vm.snapshot(items)
            self.assertEqual(vm.mgr["bagItemTypeIndex"], [0, 0, 1, 2, 2, 4, 4])
            self.assertEqual([item["series"] for item in vm.run(vm.mgr, "getItemsByType", (1,))], [2])
            self.assertEqual([item["series"] for item in vm.run(vm.mgr, "getItemsByType", (4,))], [3, 1])
            self.assertEqual(vm.events.count("USERITEM_INIT_COMPLETE"), repeat + 1)

    def test_empty_full_snapshot_clears_old_items_and_all_cells(self):
        vm = BagSnapshotVM()
        vm.snapshot([self.item(1), self.item(2)])
        vm.snapshot([])
        self.assertEqual(vm.mgr["bagItems"], [])
        self.assertEqual(vm.mgr["bagItemsNotSort"], [])
        self.assertEqual(vm.mgr["bagItemTypeIndex"], [0] * 7)
        self.assertEqual(vm.page["currentCount"], 0)
        self.assertTrue(all(cell["data"] is None for cell in vm.grid.cells))

    def test_refresh_patch_changes_only_initializer_and_is_idempotent(self):
        old = subprocess.check_output(["git", "show", REFRESH_BASELINE + ":web/GameFrame.swf"])
        raw, (_, _, start, end) = abc_section(old)
        abc = raw[start:end]
        patched = patch_refresh_abc(abc)
        before, after = inspect_abc_full(abc), inspect_abc_full(patched)
        self.assertEqual(before["classes"], after["classes"])
        changed = [method for method, body in before["bodies"].items()
                   if any(body[key] != after["bodies"][method][key]
                          for key in ("code", "limits", "exceptions", "body_traits"))]
        self.assertEqual(changed, [3406])
        self.assertEqual(patch_refresh_abc(patched), patched)


if __name__ == "__main__":
    unittest.main()
