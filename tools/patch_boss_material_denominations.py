"""Replace many low-value BOSS materials with equal-value larger denominations.

Keep native drop records. A split with a remainder is allowed only for guaranteed,
ungrouped drops, so it cannot turn one random reward into independent rolls.
Preserve the original bytes of every field except item ID, count and item comment.
"""
from __future__ import annotations

from collections import Counter, defaultdict
from pathlib import Path
import re

from patch_guild_quest_config import read_cbp, read_pack

ROOT = Path(__file__).resolve().parents[1]
BASE = ROOT / "Server/S1001/data/config/monster"
MONSTERS = BASE / "StdMonster.txt"
FAMILIES = (
    ("护盾碎片", ((568, 100), (569, 1000), (570, 10000))),
    ("宝石结晶", ((537, 100), (538, 1000), (539, 10000))),
    ("圣珠结晶", ((572, 100), (573, 1000), (574, 10000))),
    ("护符碎片", ((534, 100), (535, 1000), (536, 10000))),
    ("特戒结晶", ((527, 1), (530, 10), (528, 100), (529, 10000))),
    # Plain soul 5171 uses a different saved pickup category; keep it unchanged.
    ("神魂", ((5165, 10), (5166, 100), (5167, 1000), (5168, 10000))),
    ("元神丹", ((6297, 10000), (6374, 50000), (6298, 100000))),
    ("成就令牌", ((488, 2000), (489, 20000), (490, 200000))),
    ("功勋令牌", ((484, 1000), (485, 10000), (486, 100000))),
    ("战将灵力丹", ((551, 100000), (552, 1000000), (553, 10000000))),
    ("斗笠精华", ((5645, 10000), (5646, 100000), (5647, 1000000))),
    ("火龙结晶", ((7194, 100), (7195, 1000), (7196, 10000))),
)
BY_ID = {item: (name, value, levels)
         for name, levels in FAMILIES for item, value in levels}


def fields(line):
    return {key.decode(): int(value) for key, value in
            re.findall(rb"(\w+)\s*=\s*(-?\d+)", line.split(b"--", 1)[0])}


def references(source):
    result = defaultdict(list)
    for block in re.split(rb"\r?\n\{\r?\n", source)[1:]:
        mid = re.search(rb"entityid=(\d+)", block)
        kind = re.search(rb"monsterType=(\d+)", block)
        if mid and kind:
            for filename in re.findall(rb'drops\\([^"\r\n]+)', block):
                result[filename.decode()].append((int(mid[1]), int(kind[1])))
    return result


def replacement(row):
    if (row.get("type") != 0 or row.get("id") not in BY_ID
            or row.get("count", 0) <= 0 or row.get("propability", 0) <= 0
            or row.get("mincount", 0) != 0 or row.get("maxcount", 0) != 0
            or row.get("group", 0) != 0):
        return None
    _, value, levels = BY_ID[row["id"]]
    remainder = row["count"] * value
    output = []
    for item, denomination in reversed(levels):
        if denomination < value:
            continue
        count, remainder = divmod(remainder, denomination)
        if count:
            output.append((item, count))
    if remainder or sum(count for _, count in output) >= row["count"]:
        return None
    if len(output) > 1 and row["propability"] != 1:
        return None
    return output


def replace_line(line, item, count, names):
    newline = b"\r\n" if line.endswith(b"\r\n") else b"\n" if line.endswith(b"\n") else b""
    body = line.removesuffix(newline) if newline else line
    code, separator, _ = body.partition(b"--")
    code, id_changes = re.subn(rb"\bid=\d+", b"id=" + str(item).encode(), code)
    code, count_changes = re.subn(rb"\bcount=\d+", b"count=" + str(count).encode(), code)
    if id_changes != 1 or count_changes != 1:
        raise ValueError("Unexpected drop record format")
    return code + (separator + names[item].encode("gbk") if separator else b"") + newline


def patch_template(source, names):
    output, changes = [], []
    for number, line in enumerate(source.splitlines(keepends=True), 1):
        row = fields(line) if re.match(rb"\s*\{type=", line) else {}
        replacement_rows = replacement(row)
        if replacement_rows is None:
            output.append(line)
            continue
        changed = [replace_line(line, item, count, names) for item, count in replacement_rows]
        for new_line in changed:
            new_row = fields(new_line)
            if {k: v for k, v in new_row.items() if k not in ("id", "count")} != {
                    k: v for k, v in row.items() if k not in ("id", "count")}:
                raise ValueError("A drop condition changed")
        _, value, _ = BY_ID[row["id"]]
        if row["count"] * value != sum(BY_ID[item][1] * count for item, count in replacement_rows):
            raise ValueError("Material value changed")
        output.extend(changed)
        changes.append((number, row["id"], row["count"], replacement_rows))
    return b"".join(output), changes


def item_names():
    lang = ROOT / "web/v2/lang/zh-cn"
    pack = dict(read_pack((lang / "zh-cn.dat").read_bytes()))
    names = {}
    for path in lang.glob("stditems*.cbp"):
        data = path.read_bytes()
        if pack[path.name] != data:
            raise ValueError("Client item file and packed copy differ")
        _, tree = read_cbp(data)
        for row in tree.children:
            item = int(row.child("id").number())
            if item in BY_ID:
                raw = row.child("name").value
                try:
                    name = raw.decode("utf-8")
                except UnicodeDecodeError:
                    name = raw.decode("gbk")
                if name == "null":
                    continue
                if item in names and names[item] != name:
                    raise ValueError("Client item names differ")
                names[item] = name
    if set(names) != set(BY_ID):
        raise ValueError("Missing material client definition")
    return names


def main():
    names = item_names()
    original_monsters = MONSTERS.read_bytes()
    refs = references(original_monsters)
    plans, changes = {}, []
    for path in sorted((BASE / "drops").glob("drops*.lua")):
        if not any(kind == 4 for _, kind in refs[path.name]):
            continue
        before = path.read_bytes()
        after, rows = patch_template(before, names)
        if rows:
            plans[path] = after
            changes.extend((path.name, *row) for row in rows)
    if not changes:
        print("BOSS material denominations already updated")
        return

    # Monster 545 shares drops1511 with BOSSes. Keep its original reward items.
    shared = {path.name for path in plans if any(kind != 4 for _, kind in refs[path.name])}
    if shared != {"drops1511.lua"}:
        raise ValueError("Unexpected shared non-BOSS drop template")
    normal_copy = BASE / "drops/drops1511Normal.lua"
    if normal_copy.exists():
        raise ValueError("Normal monster template already exists")
    plans[normal_copy] = (BASE / "drops/drops1511.lua").read_bytes()
    blocks = re.split(rb"(\r?\n\{\r?\n)", original_monsters)
    modified = 0
    for index, block in enumerate(blocks):
        if re.search(rb"entityid=545,", block):
            old = b'--#include "drops\\drops1511.lua"'
            if block.count(old) != 1:
                raise ValueError("Unexpected monster 545 drop reference")
            blocks[index] = block.replace(old, b'--#include "drops\\drops1511Normal.lua"', 1)
            modified += 1
    if modified != 1:
        raise ValueError("Missing shared normal monster")
    plans[MONSTERS] = b"".join(blocks)

    for path, source in plans.items():
        if any(re.match(rb"\s*\{type=[56],", line) for line in source.splitlines()):
            raise ValueError("Gold reintroduced")
        path.write_bytes(source)
    affected = {mid for filename, *_ in changes for mid, kind in refs[filename] if kind == 4}
    categories = Counter(BY_ID[item][0] for _, _, item, _, _ in changes)
    print(f"Updated {len(changes)} rewards in {len(plans) - 2} templates for {len(affected)} BOSSes")
    print(dict(categories))
    for filename, number, item, count, result in changes:
        print(f"{filename}:{number} {item} x{count} -> {result}")


if __name__ == "__main__":
    main()
