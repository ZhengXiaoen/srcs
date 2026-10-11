"""Add the backpack binding confirmation without recompiling other Flash code.

Reuse MsgCheckBox and keep session state on the backpack's existing Array.
Append one callback method; every existing unrelated method, trait and SWF
resource is preserved byte for byte. The NPC request and bag query use the
same ordered socket, so the full bag refresh follows server binding/merging.
"""
from pathlib import Path
import argparse
import struct
import zlib

from patch_activity_entries import q, relocate
from patch_appearance_upgrade import extend_pools, inspect_abc, pools
from patch_auto_medicine_frequency import Block
from patch_bag_client import ABCReader, encode_u30
from patch_drop_pickup_retry import abc_section, instructions
from patch_item_count_u16_client import inspect_abc_full

CLIENT = Path(__file__).resolve().parents[1] / "web/GameFrame.swf"
PROMPT = "此功能会让背包中的非绑定物品绑定，若不想绑定请放入仓库。是否继续整理？"
CHECK_LABEL = "本次不再提示"
ENTRY = "BindAndSortBag"
STATE = ("bagBindSkipPrompt", "bagBindPromptPending")
Q = {"MsgCheckBox": 326, "show": 1531, "checkSelceted": 13591,
     "BackPackWin": 399, "instance": 30725, "_btnNames": 9983,
     "onClickSortBagBtn": 10026, "MsgSender": 11023,
     "sendTalkToNPC": 5690, "BagCC": 15729, "sendQueryBagItem": 41568}


def method_info_end(source):
    r = ABCReader(source)
    r.pos = pools(source)["names"][2]
    start = r.pos
    count = r.u30()
    content = r.pos
    for _ in range(count):
        params = r.u30()
        r.u30()
        for _ in range(params):
            r.u30()
        r.u30()
        flags = r.byte()
        if flags & 8:
            for _ in range(r.u30()):
                r.u30(); r.byte()
        if flags & 128:
            for _ in range(params):
                r.u30()
    return start, content, r.pos, count


def patch_abc(original):
    original_strings = pools(original)["strings"][3]
    if PROMPT in original_strings:
        return original
    source, strings, added = extend_pools(original, [PROMPT, CHECK_LABEL, ENTRY, "确定", "取消"],
                                         [("", s) for s in STATE])
    names, catalog, bodies = inspect_abc(source)
    for name, index in Q.items():
        if names[index] != name:
            raise ValueError(f"Unexpected QName {name}: {names[index]}")
    full = inspect_abc_full(source)
    method = catalog["BackPackWin"]["instance"]["onClickSortBagBtn"][0]
    body = full["bodies"][method]
    if body["limits"] != (3, 2, 15, 16) or body["exceptions"] or body["body_traits"] != b"\0":
        raise ValueError("Unexpected backpack sort method layout")
    info_start, info_content, info_end, callback = method_info_end(source)

    def state(name, window=b"\xd0"):
        return window + q(0x66, Q["_btnNames"])

    def assign(name, value, window=b"\xd0"):
        return state(name, window) + value + q(0x61, added[name])

    # A null argument is used only by the confirmation callback. A real click
    # checks the session flag and refuses duplicate modal dialogs.
    b = Block()
    b.emit(b"\xd1")
    b.branch(0x12, "sort")
    b.emit(state(STATE[0]) + q(0x66, added[STATE[0]]))
    b.branch(0x11, "sort")
    b.emit(state(STATE[1]) + q(0x66, added[STATE[1]]))
    b.branch(0x11, "return")
    b.emit(assign(STATE[1], b"\x26"))
    b.emit(q(0x60, Q["MsgCheckBox"]) + q(0x2c, strings[PROMPT])
           + q(0x2c, strings["确定"]) + q(0x2c, strings["取消"]) + q(0x56, 2)
           + q(0x40, callback) + q(0x2c, strings[CHECK_LABEL]) + q(0x4f, Q["show"], 4))
    b.label("return")
    b.emit(b"\x47")
    b.label("sort")
    b.emit(q(0x60, Q["MsgSender"]) + b"\x24\0" + q(0x2c, strings[ENTRY])
           + q(0x4f, Q["sendTalkToNPC"], 2) + q(0x60, Q["BagCC"])
           + q(0x4f, Q["sendQueryBagItem"], 0))
    prefix, external = b.finish()
    assert not external
    code, _ = relocate(body["code"], [(2, 2, prefix)])
    instructions(code)

    # Callback signature matches MsgCheckBox.show: (CustomMessageBox, int).
    # Only Confirm commits the checkbox state and starts the operation.
    b = Block()
    b.emit(q(0x60, Q["BackPackWin"]) + q(0x66, Q["instance"]) + b"\xd7\xd3")
    b.branch(0x12, "return")
    b.emit(assign(STATE[1], b"\x27", b"\xd3") + b"\xd2\x24\0")
    b.branch(0x14, "return")
    b.emit(assign(STATE[0], b"\xd1" + q(0x80, Q["MsgCheckBox"])
                  + q(0x66, Q["checkSelceted"]), b"\xd3"))
    b.emit(b"\xd3\x20" + q(0x4f, Q["onClickSortBagBtn"], 1))
    b.label("return")
    b.emit(b"\x47")
    callback_code, external = b.finish()
    assert not external
    instructions(callback_code)
    info = b"".join(encode_u30(x) for x in (2, 1, 25, 4, 0)) + b"\0"
    callback_body = b"".join(encode_u30(x) for x in (callback, 3, 4, 16, 16, len(callback_code)))
    callback_body += callback_code + b"\0\0"
    replacement = b"".join(encode_u30(x) for x in (method, 5, 2, 15, 16, len(code))) + code + b"\0\0"
    reset = catalog["BackPackWin"]["static"]["reset"][0]
    reset_body = full["bodies"][reset]
    if reset_body["exceptions"] or reset_body["body_traits"] != b"\0":
        raise ValueError("Unexpected backpack reset layout")
    window = q(0x60, Q["BackPackWin"]) + q(0x66, Q["instance"])
    b = Block()
    b.emit(window)
    b.branch(0x12, "return")
    for name in STATE:
        b.emit(assign(name, b"\x27", window))
    b.label("return")
    reset_extra, external = b.finish()
    assert not external
    reset_code, _ = relocate(reset_body["code"], [(len(reset_body["code"]) - 1,
                                                    len(reset_body["code"]) - 1, reset_extra)])
    reset_limits = (max(2, reset_body["limits"][0]), *reset_body["limits"][1:])
    reset_replacement = b"".join(encode_u30(x) for x in (reset, *reset_limits, len(reset_code))) + reset_code + b"\0\0"
    r = ABCReader(source)
    r.pos = full["body_section"]
    body_count = r.u30()
    changes = [(info_start, info_end, encode_u30(callback + 1) + source[info_content:info_end] + info),
               (full["body_section"], r.pos, encode_u30(body_count + 1)),
               (body["record_start"], body["end"], replacement),
               (reset_body["record_start"], reset_body["end"], reset_replacement),
               (len(source), len(source), callback_body)]
    result = bytearray(source)
    for start, end, value in sorted(changes, reverse=True):
        result[start:end] = value
    result = bytes(result)
    after = inspect_abc_full(result)
    if full["classes"] != after["classes"]:
        raise ValueError("Unrelated class traits changed")
    for index, old in full["bodies"].items():
        new = after["bodies"][index]
        if index not in (method, reset) and any(old[key] != new[key] for key in ("code", "limits", "exceptions", "body_traits")):
            raise ValueError(f"Unrelated method changed: {index}")
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
    result = patch_swf(source)
    if args.check:
        if result != source:
            raise SystemExit("Backpack binding confirmation is not installed")
        print("Backpack binding confirmation verified")
    else:
        CLIENT.write_bytes(result)
        print("Backpack binding confirmation installed")
