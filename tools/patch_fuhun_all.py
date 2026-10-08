"""Add a one-click soul material button to the existing Flash equipment page.

Only the page constructor, event lifecycle, selection visibility, click handler
and batch reply refresh change. Existing protocol sender already sends type 4
with the selected equipment GUID and no material GUID. Preserve all other
methods, class traits, constants and SWF resources.
"""
from __future__ import annotations

import argparse
from pathlib import Path
import struct
import zlib

from patch_activity_entries import q, relocate
from patch_appearance_upgrade import extend_pools, inspect_abc, pools
from patch_auto_medicine_frequency import Block
from patch_bag_client import ABCReader, encode_u30
from patch_drop_pickup_retry import abc_section, instructions

ROOT = Path(__file__).resolve().parents[1]
CLIENT = ROOT / "web/GameFrame.swf"
Q = {"_editor": 19890, "_mainCell": 19861, "_tab": 19858,
     "selectedIndex": 6104, "data": 1513, "visible": 1832,
     "MouseEvent": 5, "CLICK": 33809, "addEventListener": 13671,
     "removeEventListener": 13672, "onUpgrade": 19872,
     "currentTarget": 43310, "isMax": 19875, "UserItem": 137,
     "ChatFunc": 1510, "doFlyTipMsg": 31323, "CliffordCC": 11028,
     "sendFuHunUpgrade": 37609, "updateGrid": 19882}


def field(name):
    return b"\xd0" + q(0x66, Q[name])


def button():
    return field("_editor") + q(0x66, Q["fuHunAllButton"])


def main_item():
    return field("_mainCell") + q(0x66, Q["data"])


def only(code, pattern):
    matches = [op.start for op in instructions(code)
               if code[op.start:op.start + len(pattern)] == pattern]
    if len(matches) != 1:
        raise ValueError("Unexpected soul page instruction pattern")
    return matches[0]


def patch_abc(original):
    original_strings = pools(original)["strings"][3]
    if "_fuhun_all" in original_strings:
        return original
    texts = ["_fuhun_all", "一键附魂", "235,11",
             "消耗背包中全部可用的同部位材料装备，增加当前装备附魂经验",
             "CommonUI.Button.SimpleLinkLabel", "text", "0xffd34a"]
    source, strings, added = extend_pools(original, texts, [("", "fuHunAllButton")])
    Q.update(added)
    names, catalog, bodies = inspect_abc(source)
    for key, index in Q.items():
        if names[index] != key:
            raise ValueError(f"Unexpected QName {key}: {names[index]}")
    page = catalog["EquipBoostFuHunPage"]
    modifications = []

    def change(method, transform, stack=None):
        start, size, limits = bodies[method]
        updated, moved = transform(source[start:start + size])
        instructions(updated)
        reader = ABCReader(source)
        reader.pos = start + size
        exceptions = []
        for _ in range(reader.u30()):
            a, b, target, kind, variable = (reader.u30() for _ in range(5))
            exceptions.append((moved(a), moved(b), moved(target), kind, variable))
        header = b"".join(encode_u30(v) for v in (method, *limits, size))
        if source[start - len(header):start] != header:
            raise ValueError("Unexpected ABC method header")
        limits = (max(limits[0], stack or 0), *limits[1:])
        replacement = b"".join(encode_u30(v) for v in (method, *limits, len(updated)))
        replacement += updated + encode_u30(len(exceptions))
        replacement += b"".join(encode_u30(v) for row in exceptions for v in row)
        modifications.append((start - len(header), reader.pos, replacement, method))

    def constructor(code):
        # Append to the soul tab's sprite so the transfer tab hides it naturally.
        array = next(op for op in instructions(code) if op.start == 849)
        if array.opcode != 0x56 or array.operands != (11,):
            raise ValueError("Unexpected soul tab component count")
        spec = {"className": "CommonUI.Button.SimpleLinkLabel", "instanceName": "_fuhun_all",
                "text": "一键附魂", "move": "235,11", "color": "0xffd34a",
                "toolTip": texts[3], "exporttype": 0}
        component = b""
        for key, value in spec.items():
            component += q(0x2c, strings.get(key, original_strings.index(key) if key in original_strings else 0))
            component += b"\x24\x00" if value == 0 else q(0x2c, strings.get(value, original_strings.index(value) if value in original_strings else 0))
        component += q(0x55, len(spec))
        capture = (b"\xd0\xd1" + q(0x68, Q["_editor"])
                   + field("_editor") + b"\xd1" + q(0x2c, strings["_fuhun_all"])
                   + q(0x66, 47429) + q(0x61, Q["fuHunAllButton"])
                   + button() + b"\x27" + q(0x61, Q["visible"]))
        at = only(code, b"\xd0\x20" + q(0x68, Q["_editor"]))
        return relocate(code, [(array.start, array.end, component + q(0x56, 12)),
                               (at, at + 2 + len(q(0x68, Q["_editor"])), capture)])

    change(page["constructor"], constructor, 63)
    for name, listener in (("initEvent", "addEventListener"), ("removeEvent", "removeEventListener")):
        def lifecycle(code, listener=listener):
            extra = (button() + q(0x60, Q["MouseEvent"]) + q(0x66, Q["CLICK"])
                     + field("onUpgrade") + q(0x4f, Q[listener], 2))
            return relocate(code, [(2, 2, extra)])
        change(page["instance"][name][0], lifecycle)

    def click(code):
        block = Block()
        block.emit(b"\xd1" + q(0x66, Q["currentTarget"]) + button())
        block.branch(0x14, "normal")
        block.emit(field("_tab") + q(0x66, Q["selectedIndex"]) + b"\x24\x00")
        block.branch(0x14, "return")
        block.emit(main_item())
        block.branch(0x11, "selected")
        block.emit(q(0x60, Q["ChatFunc"]) + q(0x2c, original_strings.index("请放入主装备"))
                   + q(0x4f, Q["doFlyTipMsg"], 1))
        block.branch(0x10, "return")
        block.label("selected")
        block.emit(b"\xd0" + main_item() + q(0x80, Q["UserItem"]) + q(0x46, Q["isMax"], 1))
        block.branch(0x11, "return")
        block.emit(q(0x60, Q["CliffordCC"]) + b"\x24\x04" + main_item()
                   + q(0x80, Q["UserItem"]) + q(0x4f, Q["sendFuHunUpgrade"], 2))
        block.label("return")
        block.emit(b"\x47")
        block.label("normal")
        extra, external = block.finish()
        assert not external
        return relocate(code, [(2, 2, extra)])
    change(page["instance"]["onUpgrade"][0], click)

    def visibility(code):
        block = Block()
        block.emit(button() + field("_tab") + q(0x66, Q["selectedIndex"]) + b"\x24\x00\xab")
        block.branch(0x12, "hidden")
        block.emit(main_item() + b"\x76")
        block.branch(0x10, "set")
        block.label("hidden")
        block.emit(b"\x27")
        block.label("set")
        block.emit(q(0x61, Q["visible"]))
        extra, external = block.finish()
        assert not external
        return relocate(code, [(len(code) - 1, len(code) - 1, extra)])
    change(page["instance"]["updateData"][0], visibility, 4)

    def clear(code):
        extra = button() + b"\x27" + q(0x61, Q["visible"])
        return relocate(code, [(2, 2, extra)])
    change(page["instance"]["clearSelectData"][0], clear)

    def reply(code):
        block = Block()
        block.emit(b"\xd1" + q(0x66, Q["data"]) + b"\x24\x04")
        block.branch(0x14, "normal")
        block.emit(b"\xd0" + q(0x4f, Q["updateGrid"], 0))
        block.label("normal")
        extra, _ = block.finish()
        return relocate(code, [(2, 2, extra)])
    change(page["instance"]["onUpgradeRes"][0], reply)

    result = bytearray(source)
    for start, end, replacement, _ in sorted(modifications, reverse=True):
        result[start:end] = replacement
    result = bytes(result)
    _, after_catalog, after_bodies = inspect_abc(result)
    if catalog != after_catalog:
        raise ValueError("Unrelated class traits changed")
    changed = {method for _, _, _, method in modifications}
    for method, (start, size, limits) in bodies.items():
        new_start, new_size, new_limits = after_bodies[method]
        if method not in changed and (limits != new_limits or source[start:start + size] != result[new_start:new_start + new_size]):
            raise ValueError(f"Unrelated method changed: {method}")
    return result


def patch_swf(source):
    data, (tag, payload, start, end) = abc_section(source)
    abc = patch_abc(data[start:end])
    if abc == data[start:end]:
        return source
    result = data[:tag + 2] + struct.pack("<I", start - payload + len(abc)) + data[payload:start] + abc + data[end:]
    result = result[:4] + struct.pack("<I", len(result)) + result[8:]
    if result[8:tag] != data[8:tag] or result[start + len(abc):] != data[end:]:
        raise ValueError("Unrelated SWF resources changed")
    return result[:8] + zlib.compress(result[8:], 9)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    source = CLIENT.read_bytes()
    updated = patch_swf(source)
    if args.check:
        if source != updated:
            raise SystemExit("Soul batch button patch is not installed")
        print("Soul batch button patch verified")
    else:
        CLIENT.write_bytes(updated)
        print("Soul batch button patch installed")
