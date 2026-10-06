"""Give teleport stones 9999 uses, consuming one durability per use.

Only item IDs 498, 501 and 502 change. Their client getters display raw
durability; all other items retain the existing /1000 conversion.
"""
from __future__ import annotations

import argparse
from pathlib import Path
import re

from patch_bag_client import encode_u30
from patch_drop_pickup_retry import abc_section
from patch_activity_reminders import relocate
from patch_appearance_upgrade import inspect_abc
from patch_merge_feature_gates import assemble, replace_body
from patch_guild_quest_config import read_cbp, read_pack, write_cbp, write_pack

ROOT = Path(__file__).resolve().parents[1]
IDS = {498, 501, 502}
USES = 9999
BLOCK = re.compile(rb"(?m)^\{\r?\n  id=(\d+),.*?(?=^\},?\r?$)", re.S)


def getter_guard(field):
    # if (wItemId == target) return raw durability; otherwise keep the getter.
    raw = b"\xd0\x66" + encode_u30(field) + b"\x48"
    return b"".join(
        b"\xd0\x66" + encode_u30(6379) + b"\x25" + encode_u30(item)
        + b"\x14" + len(raw).to_bytes(3, "little") + raw
        for item in sorted(IDS)
    )


def patch_swf(source):
    data, (_, _, start, end) = abc_section(source)
    original = data[start:end]
    result = original
    for method, field, rounding in (("displayDura", 6383, "floor"),
                                     ("displayDuraMax", 6384, "round")):
        names, classes, bodies = inspect_abc(result)
        assert names[6379] == "wItemId"
        assert names[field] == ("wDura" if field == 6383 else "wDuraMax")
        mid = classes["UserItem"]["instance"][method][0]
        pos, size, limits = bodies[mid]
        code = result[pos:pos + size]
        guard = getter_guard(field)
        if code[2:2 + len(guard)] == guard:
            continue
        expected = (b"\xd0\x30\x60" + encode_u30(names.index("Math"))
                    + b"\xd0\x66" + encode_u30(field) + b"\x25\xe8\x07\xa3\x46"
                    + encode_u30(names.index(rounding)) + b"\x01\x48")
        assert code == expected, (method, "Unexpected original getter")
        new, moved = relocate(code, [(2, 2, guard)])
        result = replace_body(result, mid, new, limits, moved)
    _, _, before = inspect_abc(original)
    _, classes, after = inspect_abc(result)
    targets = {classes["UserItem"]["instance"][m][0]
               for m in ("displayDura", "displayDuraMax")}
    assert before.keys() == after.keys()
    for mid, (pos, size, limits) in before.items():
        npos, nsize, nlimits = after[mid]
        assert limits == nlimits
        if mid not in targets:
            assert original[pos:pos + size] == result[npos:npos + nsize], mid
    return source if original == result else assemble(source, result)


def patch_text(source):
    seen = set()

    def replace(match):
        item = int(match[1])
        if item not in IDS:
            return match[0]
        assert item not in seen
        seen.add(item)
        block = match[0]
        for field, value in ((b"dura", USES), (b"useDurDrop", 1)):
            pattern = re.compile(rb"(?m)^(  " + field + rb"=)(\d+)(,\r?$)")
            assert len(pattern.findall(block)) == 1
            block = pattern.sub(lambda m: m[1] + str(value).encode() + m[3], block)
        return block

    result = BLOCK.sub(replace, source)
    assert seen == IDS
    return result


def patch_cbp(source):
    header, table = read_cbp(source)
    original = read_cbp(source)[1]
    seen = set()
    for before, after in zip(original.children, table.children):
        item = int(after.child("id").number())
        if item in IDS:
            assert item not in seen
            seen.add(item)
            before.child("dura").set_number(USES)
            after.child("dura").set_number(USES)
        assert before == after
    assert seen == IDS
    if read_cbp(source)[1] == table:
        return source
    result = write_cbp(header, table)
    assert read_cbp(result)[1] == table
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    item_dir = ROOT / "Server/S1001/data/config/item"
    client_dir = ROOT / "web/v2/lang/zh-cn"
    outputs = {}
    for path in [item_dir / "StdItems.txt", *item_dir.glob("StdItems - *.txt"),
                 item_dir / "stdItemForClient/StdItems1.txt"]:
        outputs[path] = patch_text(path.read_bytes())
    pack = client_dir / "zh-cn.dat"
    pack_source = pack.read_bytes()
    entries = read_pack(pack_source)
    assert write_pack(entries) == pack_source and len(dict(entries)) == len(entries)
    updates = {}
    for name in ("stditems.cbp", "stditems1.cbp"):
        path = client_dir / name
        source = path.read_bytes()
        assert dict(entries)[name] == source
        updates[name] = patch_cbp(source)
        outputs[path] = updates[name]
    updated = [(name, updates.get(name, data)) for name, data in entries]
    outputs[pack] = write_pack(updated)
    assert read_pack(outputs[pack]) == updated
    assert all(a == b for a, b in zip(entries, updated) if a[0] not in updates)
    client = ROOT / "web/GameFrame.swf"
    outputs[client] = patch_swf(client.read_bytes())
    changed = {path: data for path, data in outputs.items() if path.read_bytes() != data}
    if args.check:
        assert not changed, [str(path) for path in changed]
    else:
        for path, data in changed.items():
            path.write_bytes(data)
    print(f"Verified three stones: {USES} uses, one durability per use; changed {len(changed)} files.")


if __name__ == "__main__":
    main()
