"""Exercise the patched activity arrays, actual AVM2 filters and legacy links."""
from __future__ import annotations

from dataclasses import dataclass
from itertools import product
import unittest

from patch_activity_entries import CLIENT, CONSTRUCTORS, QD_ARRAYS, patch_swf
from patch_drop_pickup_retry import abc_section, instructions
from patch_god_equip_state import inspect_abc
from patch_activity_entries import strings_of


@dataclass(frozen=True)
class Ref:
    name: str


def execute(code, names, strings, locals_, start=0, end=None, open_slots=(), day=1):
    """Run inspected bytecode with resource/page creation and network calls as spies."""
    ops = {op.start: op for op in instructions(code)}
    stack = []
    calls = []
    maximum = 0
    pos = start
    for _ in range(10000):
        if pos == end:
            return locals_, calls, maximum
        op = ops[pos]
        pos = op.end
        kind = op.opcode
        args = op.operands
        if kind == 0xD0 or kind in range(0xD1, 0xD4):
            stack.append(locals_[kind - 0xD0])
        elif kind == 0x62:
            stack.append(locals_[args[0]])
        elif kind in range(0xD4, 0xD8):
            locals_[kind - 0xD4] = stack.pop()
        elif kind == 0x63:
            locals_[args[0]] = stack.pop()
        elif kind == 0x30:
            stack.pop()
        elif kind == 0x20:
            stack.append(None)
        elif kind in (0x24, 0x25):
            stack.append(args[0])
        elif kind == 0x2C:
            stack.append(strings[args[0]])
        elif kind == 0x60:
            stack.append(Ref(names[args[0]]))
        elif kind == 0x5D:
            stack.append(Ref("global"))
        elif kind == 0x4A:
            count = args[1]
            if count:
                del stack[-count:]
            stack.pop()
            calls.append(("construct", [names[args[0]]]))
            stack.append(Ref(names[args[0]]))
        elif kind == 0x66:
            obj = stack.pop()
            name = names[args[0]]
            if isinstance(obj, dict):
                stack.append(obj[name])
            elif name == "curDay":
                stack.append(day)
            else:
                stack.append(Ref(name))
        elif kind == 0x68:
            value = stack.pop()
            obj = stack.pop()
            obj[names[args[0]]] = value
        elif kind == 0x56:
            count = args[0]
            items = stack[-count:] if count else []
            if count:
                del stack[-count:]
            stack.append(items)
        elif kind == 0x55:
            count = args[0] * 2
            values = stack[-count:]
            del stack[-count:]
            stack.append(dict(zip(values[::2], values[1::2])))
        elif kind in (0x46, 0x4F, 0x4E):
            name, count = names[args[0]], args[1]
            params = stack[-count:] if count else []
            if count:
                del stack[-count:]
            obj = stack.pop()
            calls.append((name, params))
            if name == "push":
                obj.extend(params)
            elif name == "checkActivityOpen":
                stack.append(params[0] in open_slots)
            elif kind == 0x46:
                raise ValueError(f"Unimplemented method {name}")
        elif kind in (0xA0, 0xA1, 0xA2, 0xAB, 0xAF):
            right, left = stack.pop(), stack.pop()
            stack.append({0xA0: lambda: left + right, 0xA1: lambda: left - right,
                          0xA2: lambda: left * right, 0xAB: lambda: left == right,
                          0xAF: lambda: left > right}[kind]())
        elif kind == 0xC2:
            locals_[args[0]] += 1
        elif kind == 0xC3:
            locals_[args[0]] -= 1
        elif kind == 0x73:
            stack.append(int(stack.pop()))
        elif kind == 0x80:
            pass
        elif kind == 0x2A:
            stack.append(stack[-1])
        elif kind == 0x29:
            stack.pop()
        elif kind in (0x10, 0x12, 0x13, 0x15):
            if kind == 0x10:
                take = True
            elif kind == 0x12:
                take = not stack.pop()
            else:
                right, left = stack.pop(), stack.pop()
                take = left == right if kind == 0x13 else left < right
            if take:
                pos = op.branches[0][1]
        elif kind == 0x47:
            if stack:
                raise ValueError("Nonempty stack on activity method return")
            return locals_, calls, maximum
        elif kind == 0x48:
            locals_["return"] = stack.pop()
            if stack:
                raise ValueError("Nonempty stack on module return")
            return locals_, calls, maximum
        else:
            raise ValueError(f"Unexpected opcode {kind:#x} in activity scenario")
        maximum = max(maximum, len(stack))
    raise ValueError("Activity scenario did not terminate")


class ActivityEntriesTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.source = CLIENT.read_bytes()
        data, (_, _, start, end) = abc_section(cls.source)
        cls.abc = data[start:end]
        cls.strings = strings_of(cls.abc)
        cls.classes = {name: inspect_abc(cls.abc, name) for name in CONSTRUCTORS}

    def body(self, class_name, method):
        names, traits, bodies = self.classes[class_name]
        method = CONSTRUCTORS[class_name] if method == "constructor" else traits[method][0]
        start, length, limits = bodies[method]
        return names, self.abc[start:start + length], limits

    def constructor_fields(self, class_name, last_field):
        names, code, limits = self.body(class_name, "constructor")
        end = next(op.end for op in instructions(code)
                   if op.opcode == 0x68 and names[op.operands[0]] == last_field)
        result, _, maximum = execute(code, names, self.strings, {0: {}}, end=end)
        self.assertLessEqual(maximum, limits[0])
        return result[0]

    def test_all_qingdian_variants_match_retained_buttons(self):
        fields = self.constructor_fields("QingDianActiveWin", "PAGE_CLASSE")
        navigation = fields["editJson"]["childCom"][2]["childCom"]
        defined = {entry["instanceName"]: entry for entry in navigation}
        self.assertNotIn("_loaderbasebutton_7", defined)
        self.assertNotIn("_loaderbasebutton_12", defined)
        self.assertNotIn("_loaderbasebutton_4", defined)
        self.assertNotIn("_loaderbasebutton_5", defined)
        self.assertNotIn("_loaderbasebutton_15", defined)
        self.assertEqual(len(defined), 10)
        names, code, _ = self.body("QingDianActiveWin", "createChildren")
        ops = instructions(code)
        button_names = [names[ops[i - 1].operands[0]] for i, op in enumerate(ops)
                        if op.opcode == 0x4F and names[op.operands[0]] == "push"]
        self.assertEqual(button_names, ["_loaderbasebutton_" + str(i)
                                      for i in [0, 1, 2, 3, 9, 10, 11, 6, 13, 14]])
        self.assertEqual({defined[b]["addBtnTxtBmp"].split(",")[0] for b in button_names},
                         {"464", "434", "1145", "550", "600", "661", "840",
                          "1102", "1250", "1042"})
        self.assertEqual(len([op for op in ops if op.opcode == 0x66
                                    and names[op.operands[0]] in {"_loaderbasebutton_4", "_loaderbasebutton_5",
                                                               "_loaderbasebutton_7", "_loaderbasebutton_12",
                                                               "_loaderbasebutton_15"}]), 0)
        for key, treasure in zip(QD_ARRAYS.values(), ["", "B", "C", "D", "E"]):
            pages = [ref.name for ref in fields[key]]
            self.assertEqual(pages, ["QDLoginPage", "QDRechargePage", "QDAccRechargePage",
                                    "QDFlashSalePage",
                                    "QDCollectWordPage", "QDHongYunDangTouPage", "QDConsumePage",
                                    "QDZhuanPanPage", "QDZhenBaoGePage", "QDHaoLiPage"])

    def test_legacy_qingdian_links_preserve_page_destination(self):
        names, code, limits = self.body("QingDianActiveWin", "setNavIndex")
        for old in range(15):
            target, calls, maximum = execute(code, names, self.strings, {0: {}, 1: old})
            self.assertLessEqual(maximum, limits[0])
            if old in (4, 5, 7, 11, 14):
                self.assertFalse(calls)
                self.assertNotIn("selectedIndex", target[0])
            else:
                mapped = old - sum(old > index for index in (4, 5, 7, 11, 14))
                self.assertEqual(target[0]["selectedIndex"], mapped)
                self.assertEqual(calls, [("setNavIndex", [mapped])])

    def filter_scenario(self, class_name, slot, open_slots=(), day=1):
        names, code, limits = self.body(class_name, "onDayChange")
        ops = instructions(code)
        start = next(op.end for op in ops if op.opcode == 0x63 and op.operands == (5,)
                     and op.start > 60)
        end = next(op.start for op in ops if op.opcode == 0x32 and op.operands == (10, 9))
        local, calls, maximum = execute(code, names, self.strings,
                                       {2: [], 3: slot, 5: 1000 + slot}, start, end, open_slots, day)
        self.assertLessEqual(maximum, limits[0])
        return local, calls

    def test_dajidali_all_open_state_combinations_keep_protocol_indices(self):
        fields = self.constructor_fields("DaJiDaLiWin", "PAGES")
        self.assertIsNone(fields["PAGES"][4])
        self.assertEqual(len(fields["PAGES"]), 11)
        for flags in product((False, True), repeat=11):
            open_slots = {i for i, enabled in enumerate(flags) if enabled}
            for slot in range(11):
                local, calls = self.filter_scenario("DaJiDaLiWin", slot, open_slots)
                self.assertEqual(local[3], slot + 1)
                self.assertEqual(local[2], [1000 + slot] if slot in open_slots and slot != 4 else [])
                requests = [params for name, params in calls if name == "setTimeout"]
                self.assertEqual([params[-1] for params in requests],
                                 [slot + 1] if slot in open_slots and slot != 4 else [])
                if slot == 4:
                    self.assertFalse(calls)

    def test_year_days_and_remaining_request_mapping(self):
        fields = self.constructor_fields("YearActiveWin", "PAGES")
        self.assertIsNone(fields["PAGES"][5])
        self.assertIsNone(fields["PAGES"][6])
        self.assertEqual(fields["PAGES"][7], Ref("YearActiveFashionPage"))
        self.assertEqual(len(fields["PAGES"]), 12)
        for day in range(1, 9):
            for slot in range(12):
                local, _ = self.filter_scenario("YearActiveWin", slot, day=day)
                eligible = slot not in (5, 6) and not (slot == 8 and day > 5) and not (slot == 9 and day > 6)
                self.assertEqual(local[2], [1000 + slot] if eligible else [])
                self.assertEqual(local[3], slot + 1)
        names, code, _ = self.body("YearActiveWin", "onAddedToStage")
        requests = [code[op.start - 1] for op in instructions(code)
                    if op.opcode == 0x4F and names[op.operands[0]] == "sendYearActiveInfo"]
        self.assertEqual(requests, [2, 3, 4, 8, 9])

    def test_patch_is_complete_and_idempotent(self):
        self.assertEqual(patch_swf(self.source), self.source)

    def test_dynamic_modules_construct_the_patched_windows(self):
        for wrapper, window in (("DaJiDaLi", "DaJiDaLiWin"), ("YearActive", "YearActiveWin")):
            path = CLIENT.parent / "v2/modules" / wrapper.lower() / (wrapper + ".swf")
            data, (_, _, start, end) = abc_section(path.read_bytes())
            abc = data[start:end]
            # The shared GameFrame inspector assumes nonempty constant pools.
            # Empty wrapper pools use zero counts, equivalent to reserved-only 1.
            self.assertEqual(abc[4:7], b"\0\0\0")
            abc = abc[:4] + b"\1\1\1" + abc[7:]
            names, traits, bodies = inspect_abc(abc, wrapper)
            # These modules contain only the wrapper; page classes live in GameFrame.
            self.assertIsNone(inspect_abc(abc, window)[1])
            start, length, limits = bodies[traits["getView"][0]]
            local, calls, maximum = execute(abc[start:start + length], names, strings_of(abc), {0: {}})
            self.assertEqual(calls, [("construct", [window])])
            self.assertEqual(local["return"], Ref(window))
            self.assertLessEqual(maximum, limits[0])


if __name__ == "__main__":
    unittest.main()
