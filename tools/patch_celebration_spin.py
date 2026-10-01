"""Sync celebration spin thresholds and scale client gates by activity duration.

Only the two spin tables, three relevant methods and their language-pack copies
change. The shared spin page keeps the Spring Festival thresholds unchanged.
"""
from __future__ import annotations

import argparse
import copy
from pathlib import Path
import re
import struct
import zlib

from patch_activity_entries import q, relocate
from patch_bag_client import ABCReader, encode_u30
from patch_drop_pickup_retry import abc_section, instructions
from patch_god_equip_state import inspect_abc
from patch_guild_quest_config import read_cbp, read_pack, write_cbp, write_pack

ROOT = Path(__file__).resolve().parents[1]
CLIENT = ROOT / "web/GameFrame.swf"
LANG = ROOT / "web/v2/lang/zh-cn"
CONFIGS = (
    ("oneyearactivitycfg.cbp", "Server/S1001/data/config/OneYearActivity.lua", "XiaoFeiZhuanPan", 7),
    ("QingDianActivityCfg.cbp", "Server/S1001/data/config/activity/QingDianActivityCfg.lua", "XiaoFeiZhuanPanNew", 3),
)
Q = {"Math": 43301, "ceil": 43575, "needPay": 14710,
     "GlobalData": 1507, "yearAcitveDataMgr": 31288, "totalDay": 4811,
     "QingDianActiveWin": 7620, "totalOpenDay": 35309,
     "QDZhuanPanPage": 18777, "NewYearZhuanPanPage": 18042}


def scale_factor(kind):
    if kind == "year":
        return (q(0x60, Q["GlobalData"]) + q(0x66, Q["yearAcitveDataMgr"])
                + q(0x66, Q["totalDay"]) + b"\xa2\x24\x07\xa3")
    return q(0x60, Q["QingDianActiveWin"]) + q(0x66, Q["totalOpenDay"]) + b"\xa2\x24\x03\xa3"


def threshold_read(cfg_local, kind):
    value = q(0x60, Q["Math"]) + cfg_local + q(0x66, Q["needPay"])
    if kind == "shared":
        # Shared by year, QingDian and Spring Festival pages. Spring uses its
        # existing integer thresholds; only the two celebration pages scale.
        year, qd = scale_factor("year"), scale_factor("qd")
        spring_test = b"\xd0" + q(0xB2, Q["NewYearZhuanPanPage"])
        qd_test = b"\xd0" + q(0xB2, Q["QDZhuanPanPage"])
        block = qd_test + b"\x11" + (len(year) + 4).to_bytes(3, "little")
        block += year + b"\x10" + len(qd).to_bytes(3, "little") + qd
        value += spring_test + b"\x11" + len(block).to_bytes(3, "little") + block
    else:
        value += scale_factor(kind)
    return value + q(0x46, Q["ceil"], 1)


def patch_abc(source):
    names, _, original_bodies = inspect_abc(source, "YearActiveZhuanPanPage")
    for name, index in Q.items():
        if names[index] != name:
            raise ValueError(f"Unexpected client QName for {name}: {names[index]}")
    changes = []
    targets = (("YearActiveZhuanPanPage", "infoBack", b"\xd2", "shared", 2),
               ("QingDianActiveWin", "updateTurn", b"\x62\x04", "qd", 1),
               ("YearAcitveDataMgr", "canGetAward", b"\xd3", "year", 1))
    for cls, method_name, cfg_local, kind, count in targets:
        _, methods, bodies = inspect_abc(source, cls)
        method = methods[method_name][0]
        start, size, limits = bodies[method]
        code = source[start:start + size]
        old = cfg_local + q(0x66, Q["needPay"])
        new = threshold_read(cfg_local, kind)
        positions = [op.start for op in instructions(code)
                     if code[op.start:op.start + len(old)] == old]
        patched = [op.start for op in instructions(code)
                   if code[op.start:op.start + len(new)] == new]
        edits = []
        if patched:
            if len(patched) != count or len(positions) != count:
                raise ValueError("Partially patched celebration gate")
        else:
            if len(positions) != count:
                raise ValueError(f"Unexpected threshold reads in {cls}.{method_name}")
            edits = [(p, p + len(old), new) for p in positions]
        if kind == "year" and not patched:
            # The server and spin page use table zero throughout the activity.
            # The old red dot selected curDay-1 and disappeared after day one.
            old_index = (q(0x60, 1507) + q(0x66, 31288) + q(0x66, 3394) + b"\x93")
            if code.count(old_index) != 1:
                raise ValueError("Unexpected anniversary red-dot table selector")
            pos = code.index(old_index)
            edits.append((pos, pos + len(old_index), b"\x24\x00"))
        updated, moved = relocate(code, edits)
        if kind == "shared":
            # Retain already claimed tiers when upgrading an active activity.
            # Start counting at getIndex and skip those tiers before evaluating
            # new thresholds, so the deficit refers to the next unclaimed tier.
            old_init = b"\xd0\x24\x00" + q(0x68, 18024)
            new_init = b"\xd0\xd0" + q(0x46, 18040, 0) + q(0x68, 18024)
            if old_init in updated:
                if updated.count(old_init) != 1:
                    raise ValueError("Unexpected spin count initializer")
                ops = instructions(updated)
                loop = next(op.start for op in ops if op.opcode == 0xD6 and
                            updated[op.end:op.end + 2] == b"\xd0\x46")
                start_guard = next(op.end for op in ops if op.start == loop)
                increment = next(op.start for op in ops if op.opcode == 0xC2 and op.operands == (4,))
                guard = b"\x62\x04\xd0" + q(0x46, 18040, 0) + b"\x15"
                guard += (increment - start_guard).to_bytes(3, "little")
                init_pos = updated.index(old_init)
                updated, compatibility_moved = relocate(updated, [
                    (init_pos, init_pos + len(old_init), new_init),
                    (start_guard, start_guard, guard),
                ])
                old_moved = moved
                moved = lambda offset, a=old_moved, b=compatibility_moved: b(a(offset))
            elif updated.count(new_init) != 1:
                raise ValueError("Missing claimed-tier compatibility initializer")
        if updated == code:
            continue
        # Update method limits/length and relocate all existing exceptions.
        reader = ABCReader(source)
        reader.pos = start + size
        exceptions = []
        for _ in range(reader.u30()):
            a, b, target, exception_type, variable = (reader.u30() for _ in range(5))
            exceptions.append((moved(a), moved(b), moved(target), exception_type, variable))
        header = b"".join(encode_u30(v) for v in (method, *limits, size))
        if source[start - len(header):start] != header:
            raise ValueError("Unexpected client method header")
        replacement = b"".join(encode_u30(v) for v in (method, max(limits[0], 5), *limits[1:], len(updated)))
        replacement += updated + encode_u30(len(exceptions))
        replacement += b"".join(encode_u30(v) for row in exceptions for v in row)
        changes.append((start - len(header), reader.pos, replacement, method))
    result = bytearray(source)
    for start, end, value, _ in sorted(changes, reverse=True):
        result[start:end] = value
    result = bytes(result)
    _, _, after = inspect_abc(result, "YearActiveZhuanPanPage")
    changed_methods = {m for _, _, _, m in changes}
    for method, (start, size, limits) in original_bodies.items():
        new_start, new_size, new_limits = after[method]
        if method not in changed_methods and (limits != new_limits or source[start:start + size] != result[new_start:new_start + new_size]):
            raise ValueError("Unrelated client method changed")
    first = min(start for start, _, _, _ in changes) if changes else len(source)
    if source[:first] != result[:first]:
        raise ValueError("Client constant pools or traits changed")
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


def patch_config(source, server, key, days):
    text = (ROOT / server).read_text("utf-8-sig").split(key + " =", 1)[1]
    text = text[:text.index("\n\t},")]
    text = re.sub(r"--[^\r\n]*", "", text)
    thresholds = [int(n) for n in re.findall(r"needPay\s*=\s*(\d+)", text)]
    rewards = re.findall(r"\{type\s*=\s*(\d+),\s*id\s*=\s*(\d+),\s*count\s*=\s*(\d+),\s*bind\s*=\s*(\d+)", text)
    if len(thresholds) != 12 or thresholds[-1] != days * 3000000 or len(rewards) != 12:
        raise ValueError("Invalid celebration server tiers")
    header, root = read_cbp(source)
    expected = copy.deepcopy(root)
    tiers = root.child(key).child("0").children
    if len(tiers) != 12:
        raise ValueError("Expected twelve client spin tiers")
    for tier, threshold, reward in zip(tiers, thresholds, rewards, strict=True):
        if tier.child("needPay").number() not in (threshold, threshold // 2):
            raise ValueError("Unexpected old client threshold")
        award = tier.child("award").children
        if len(award) != 1 or tuple(int(award[0].child(field).number()) for field in ("type", "id", "count", "bind")) != tuple(map(int, reward)):
            raise ValueError("Client/server spin rewards differ")
        tier.child("needPay").set_number(threshold)
        expected.child(key).child("0").child(tier.name).child("needPay").set_number(threshold)
    if expected != root:
        raise ValueError("Unrelated client config changed")
    return source if read_cbp(source)[1] == root else write_cbp(header, root)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    pack_path = LANG / "zh-cn.dat"
    pack = pack_path.read_bytes()
    entries = read_pack(pack)
    outputs = []
    replacements = {}
    for name, server, key, days in CONFIGS:
        path = LANG / name
        old = path.read_bytes()
        if dict(entries)[name] != old:
            raise ValueError("Packed and standalone spin config differ")
        updated = patch_config(old, server, key, days)
        outputs.append((path, old, updated))
        replacements[name] = updated
    updated_entries = [(name, replacements.get(name, value)) for name, value in entries]
    updated_pack = pack if updated_entries == entries else write_pack(updated_entries)
    if read_pack(updated_pack) != updated_entries or any(a != b for a, b in zip(entries, updated_entries) if a[0] not in replacements):
        raise ValueError("Unrelated packed resource changed")
    swf = CLIENT.read_bytes()
    updated_swf = patch_swf(swf)
    if patch_swf(updated_swf) != updated_swf:
        raise ValueError("Spin patch is not idempotent")
    outputs.extend(((pack_path, pack, updated_pack), (CLIENT, swf, updated_swf)))
    if args.check:
        if any(old != new for _, old, new in outputs):
            raise ValueError("Celebration client thresholds need syncing")
    else:
        for path, old, new in outputs:
            if old != new:
                path.write_bytes(new)
    print("Verified 24 reward tiers, dynamic client gates, matching packed configs and unchanged unrelated resources.")


if __name__ == "__main__":
    main()
