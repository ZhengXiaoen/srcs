"""Sync the fixed maximum warrior equipment rate in client item descriptions."""
from copy import deepcopy
from pathlib import Path
import re

from patch_box_stacking import server_items
from patch_guild_quest_config import read_cbp, read_pack, write_cbp, write_pack

ROOT = Path(__file__).resolve().parents[1]
CLIENT = ROOT / "web/v2/lang/zh-cn/stditems1.cbp"
PACK = CLIENT.parent / "zh-cn.dat"
LANGUAGE = ROOT / "Server/S1001/data/language/Zh-CN/Item.lua"
RULE = "<(c0xFF00ff00)全属性倍率固定最高：10>"


def warrior_ids():
    items = server_items((ROOT / "Server/S1001/data/config/item/StdItems.txt").read_bytes())
    result = set()
    for item, block in items.items():
        if 201 <= int(re.search(rb"(?m)^  type=(\d+),", block)[1]) <= 205:
            if int(re.search(rb"heroDamageRate=(\d+),", block)[1]) != 10:
                raise ValueError("Warrior equipment maximum changed")
            result.add(item)
    if len(result) != 50:
        raise ValueError("Unexpected warrior equipment IDs")
    return result


def patch_client(source, ids):
    header, before = read_cbp(source)
    root = deepcopy(before)
    found = set()
    for row in root.children:
        item = int(row.child("id").number())
        if item in ids:
            if not 201 <= row.child("type").number() <= 205 or row.child("heroDamageRate").number() != 10:
                raise ValueError("Server and client warrior equipment differ")
            desc = row.child("desc")
            rule = RULE.encode("utf-8")
            if rule not in desc.value:
                desc.value += b"\\\\" + rule
            found.add(item)
    if found != ids:
        raise ValueError("Missing client warrior equipment")
    expected = deepcopy(root)
    for old, new in zip(before.children, expected.children):
        if int(old.child("id").number()) in ids:
            new.child("desc").value = old.child("desc").value
    if expected != before:
        raise ValueError("Unrelated client item fields changed")
    return write_cbp(header, root)


def patch_language(source, ids):
    for item in sorted(ids):
        pattern = rb'(i' + str(item).encode() + rb'=")(.*?)(",)'
        matches = list(re.finditer(pattern, source))
        if len(matches) != 1:
            raise ValueError("Missing item language description")
        match = matches[0]
        if RULE.encode("utf-8") not in match[2]:
            replacement = match[1] + match[2] + b"\\\\" + RULE.encode("utf-8") + match[3]
            source = source[:match.start()] + replacement + source[match.end():]
    return source


def main():
    ids = warrior_ids()
    source = CLIENT.read_bytes()
    updated = patch_client(source, ids)
    entries = read_pack(PACK.read_bytes())
    if write_pack(entries) != PACK.read_bytes():
        raise ValueError("Language pack failed round-trip")
    positions = [i for i, (name, _) in enumerate(entries) if name == CLIENT.name]
    if len(positions) != 1 or entries[positions[0]][1] != source:
        raise ValueError("Standalone and packed items differ")
    entries[positions[0]] = (CLIENT.name, updated)
    packed = write_pack(entries)
    if read_pack(packed) != entries:
        raise ValueError("Updated pack failed verification")
    language = patch_language(LANGUAGE.read_bytes(), ids)
    CLIENT.write_bytes(updated)
    PACK.write_bytes(packed)
    LANGUAGE.write_bytes(language)
    print("Verified 50 fixed maximum warrior equipment descriptions; other resource entries preserved")


if __name__ == "__main__":
    main()
