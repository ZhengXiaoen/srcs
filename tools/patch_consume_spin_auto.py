"""Add adjacent refresh/automatic controls and acknowledged fast draw batches.

Edit the current SWF without recompiling unrelated classes or graphics. Preserve
existing constants, add only this page's labels/state names, and verify every
unrelated method and SWF tag. Automatic batches use request 9, replies 9/10.
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
Q = {"editJson": 8430, "linkBtn": 8387, "_isTurn": 8403,
     "leftNum": 8415, "stop": 8429, "CliffordCC": 11028,
     "getCostTurnData": 37591, "MouseEvent": 5, "CLICK": 33809,
     "addEventListener": 13671, "removeEventListener": 13672,
     "refeshGoods": 8420, "currentTarget": 43310, "text": 5897,
     "data": 1513, "GlobalData": 1507, "costTurnMgr": 31286,
     "readInt": 43482, "readUnsignedInt": 43478,
     "managerLeftNum": 3838, "costGold": 3839, "updateInfo": 8419}


def prop(name):
    return b"\xd0" + q(0x66, Q["editJson"]) + q(0x66, Q[name])


def assign(name, value):
    return b"\xd0" + q(0x66, Q["editJson"]) + value + q(0x61, Q[name])


def caption(value):
    return prop("xfzpAutoButton") + q(0x2c, value) + q(0x61, Q["text"])


def send_auto():
    return (b"\xd0\x26" + q(0x68, Q["_isTurn"])
            + q(0x60, Q["CliffordCC"]) + b"\x24\x09"
            + q(0x4f, Q["getCostTurnData"], 1))


def only(code, pattern):
    positions = [op.start for op in instructions(code)
                 if code[op.start:op.start + len(pattern)] == pattern]
    if len(positions) != 1:
        raise ValueError("Unexpected consumption spin instruction pattern")
    return positions[0]


def patch_abc(original):
    _, original_catalog, original_bodies = inspect_abc(original)
    constructor = original_catalog["QDCostTurnWin"]["constructor"]
    start, size, _ = original_bodies[constructor]
    original_strings = pools(original)["strings"][3]
    if q(0x2c, original_strings.index("刷新奖品")) not in original[start:start + size]:
        required = ("xfzpAutoButton", "xfzpAuto", "自动", "208,311", "270,311")
        if not all(name in original_strings for name in required):
            raise ValueError("Unrecognized already modified consumption spin page")
        return original
    source, strings, added = extend_pools(original,
        ["刷新", "自动", "停止", "208,311", "270,311",
         "跳过动画，快速抽完剩余次数；再次点击停止", "_simplelinklabel_1"],
        [("", "xfzpAutoButton"), ("", "xfzpAuto")])
    Q.update(added)
    names, catalog, bodies = inspect_abc(source)
    for key, index in Q.items():
        expected = "leftNum" if key == "managerLeftNum" else key
        if names[index] != expected:
            raise ValueError(f"Unexpected QName {key}: {names[index]}")
    modifications = []

    def change(method, transform, stack=None):
        start, size, limits = bodies[method]
        code = source[start:start + size]
        updated, moved = transform(code)
        instructions(updated)
        r = ABCReader(source)
        r.pos = start + size
        exceptions = []
        for _ in range(r.u30()):
            a, b, t, kind, variable = (r.u30() for _ in range(5))
            exceptions.append((moved(a), moved(b), moved(t), kind, variable))
        header = b"".join(encode_u30(v) for v in (method, *limits, size))
        if source[start - len(header):start] != header:
            raise ValueError("Unexpected ABC method header")
        updated_limits = (max(limits[0], stack or 0), *limits[1:])
        value = b"".join(encode_u30(v) for v in (method, *updated_limits, len(updated)))
        value += updated + encode_u30(len(exceptions))
        value += b"".join(encode_u30(v) for row in exceptions for v in row)
        modifications.append((start - len(header), r.pos, value, method))

    def patch_constructor(code):
        template_start = only(code, q(0x2c, original_strings.index("className"))
                              + q(0x2c, original_strings.index("CommonUI.Button.SimpleLinkLabel")))
        ops = instructions(code)
        template_end = next(op.end for op in ops if op.start > template_start and op.opcode == 0x55)
        template = code[template_start:template_end]
        def text_replace(block, before, after):
            old, new = q(0x2c, original_strings.index(before)), q(0x2c, after)
            if block.count(old) != 1:
                raise ValueError("Unexpected button description")
            return block.replace(old, new)
        refresh = text_replace(template, "刷新奖品", strings["刷新"])
        refresh = text_replace(refresh, "224,311", strings["208,311"])
        automatic = text_replace(template, "刷新奖品", strings["自动"])
        automatic = text_replace(automatic, "224,311", strings["270,311"])
        automatic = text_replace(automatic, "_simplelinklabel_0", strings["_simplelinklabel_1"])
        automatic = text_replace(automatic, "刷新需消耗500元宝<br>每日0点自动刷新",
                                 strings["跳过动画，快速抽完剩余次数；再次点击停止"])
        array = next(op for op in ops if op.start == template_end)
        if array.opcode != 0x56 or array.operands != (9,):
            raise ValueError("Unexpected consumption spin component count")
        # createUIByJson returns the named controls in local 1. Keep new state
        # on the existing dynamic editJson Object, avoiding new sealed traits.
        capture = (assign("xfzpAutoButton", b"\xd1" + q(0x2c, strings["_simplelinklabel_1"])
                          + q(0x66, 44587)) + assign("xfzpAuto", b"\x27"))
        capture_at = only(code, b"\xd1" + q(0x2c, original_strings.index("_image_2")))
        return relocate(code, [(template_start, template_end, refresh + automatic),
                               (array.start, array.end, q(0x56, 10)),
                               (capture_at, capture_at + 1, capture + b"\xd1")])

    change(constructor, patch_constructor, 53)
    page = catalog["QDCostTurnWin"]["instance"]
    for method_name, listener in (("onAddedToStage", "addEventListener"),
                                  ("onRemovedFromStage", "removeEventListener")):
        def lifecycle(code, listener=listener):
            pattern = (b"\xd0" + q(0x66, Q["linkBtn"]) + q(0x60, Q["MouseEvent"])
                       + q(0x66, Q["CLICK"]) + b"\xd0" + q(0x66, Q["refeshGoods"])
                       + q(0x4f, Q[listener], 2))
            at = only(code, pattern)
            extra = (prop("xfzpAutoButton") + q(0x60, Q["MouseEvent"])
                     + q(0x66, Q["CLICK"]) + b"\xd0" + q(0x66, Q["refeshGoods"])
                     + q(0x4f, Q[listener], 2))
            if listener == "removeEventListener":
                extra += assign("xfzpAuto", b"\x27") + caption(strings["自动"])
            return relocate(code, [(at, at + len(pattern), pattern + extra)])
        change(page[method_name][0], lifecycle)

    def click(code):
        block = Block()
        block.emit(b"\xd1" + q(0x66, Q["currentTarget"]) + prop("xfzpAutoButton"))
        block.branch(0x14, "refresh")
        block.emit(prop("xfzpAuto"))
        block.branch(0x12, "start")
        block.emit(assign("xfzpAuto", b"\x27") + caption(strings["自动"]) + b"\x47")
        block.label("start")
        block.emit(b"\xd0" + q(0x66, Q["_isTurn"]))
        block.branch(0x11, "return")
        block.emit(b"\xd0" + q(0x66, Q["leftNum"]) + b"\x24\x00")
        block.branch(0x0e, "return")
        block.emit(assign("xfzpAuto", b"\x26") + caption(strings["停止"]) + send_auto())
        block.label("return")
        block.emit(b"\x47")
        block.label("refresh")
        value, external = block.finish()
        assert not external
        return relocate(code, [(2, 3, value + b"\xd0")])
    change(page["refeshGoods"][0], click, 3)

    def reply(code):
        block = Block()
        block.emit(b"\xd1" + q(0x66, Q["data"]) + b"\x24\x09")
        block.branch(0x13, "batch")
        block.emit(b"\xd1" + q(0x66, Q["data"]) + b"\x24\x0a")
        block.branch(0x14, "normal")
        block.label("batch")
        block.emit(b"\xd0" + q(0x4f, Q["stop"], 0) + b"\xd0" + q(0x4f, Q["updateInfo"], 0))
        block.emit(b"\xd1" + q(0x66, Q["data"]) + b"\x24\x09")
        block.branch(0x14, "finish")
        block.emit(prop("xfzpAuto"))
        block.branch(0x12, "finish")
        block.emit(b"\xd0" + q(0x66, Q["leftNum"]) + b"\x24\x00")
        block.branch(0x0e, "finish")
        block.emit(send_auto() + b"\x47")
        block.label("finish")
        block.emit(assign("xfzpAuto", b"\x27") + caption(strings["自动"]) + b"\x47")
        block.label("normal")
        value, external = block.finish()
        assert not external
        return relocate(code, [(2, 3, value + code[2:3])])
    change(page["updatePoint"][0], reply)

    def parse_reply(code):
        # Replies 9/10 share the established count/consumption payload of 1.
        if code[18:25] != b"\xd2\x24\x01\x14\x24\x00\x00":
            raise ValueError("Unexpected consumption spin response parser")
        gate = Block()
        for operation in (9, 10):
            gate.emit(b"\xd2\x24" + bytes([operation]))
            gate.branch(0x13, "count")
        gate.emit(code[18:25])
        gate.label("count")
        value, _ = gate.finish()
        # Skip the original type-1 condition for 9/10. The original branch at
        # 21 still targets original offset 61 after relocation.
        updated, moved = relocate(code, [(18, 18, value[:len(value) - 7])])
        instructions(updated)
        return updated, moved
    change(catalog["CliffordCC"]["static"]["doCostTurnBack"][0], parse_reply)

    result = bytearray(source)
    for start, end, value, _ in sorted(modifications, reverse=True):
        result[start:end] = value
    result = bytes(result)
    _, after_catalog, after_bodies = inspect_abc(result)
    changed = {method for _, _, _, method in modifications}
    if catalog != after_catalog or result[:min(a for a, _, _, _ in modifications)] != source[:min(a for a, _, _, _ in modifications)]:
        raise ValueError("Unrelated class traits changed")
    for method, (start, size, limits) in original_bodies.items():
        new_start, new_size, new_limits = after_bodies[method]
        if method not in changed and (limits != new_limits or original[start:start + size] != result[new_start:new_start + new_size]):
            raise ValueError(f"Unrelated method changed: {method}")
    return result


def patch_swf(source):
    data, (tag, payload, start, end) = abc_section(source)
    abc = patch_abc(data[start:end])
    if abc == data[start:end]:
        return source
    result = (data[:tag + 2] + struct.pack("<I", start - payload + len(abc))
              + data[payload:start] + abc + data[end:])
    result = result[:4] + struct.pack("<I", len(result)) + result[8:]
    if result[8:tag] != data[8:tag] or result[start + len(abc):] != data[end:]:
        raise ValueError("Unrelated SWF resources changed")
    return result[:8] + zlib.compress(result[8:], 9)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    source = CLIENT.read_bytes()
    updated = patch_swf(source)
    if patch_swf(updated) != updated:
        raise ValueError("Automatic spin patch is not idempotent")
    if args.check:
        if source != updated:
            raise ValueError("Automatic spin client patch missing")
    elif source != updated:
        CLIENT.write_bytes(updated)
    print("Verified refresh/automatic controls, acknowledged batches and unchanged unrelated client resources.")


if __name__ == "__main__":
    main()
