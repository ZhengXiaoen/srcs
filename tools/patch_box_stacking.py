"""Enable stacking for gift packs and boxes, including all client copies.

Change only dup. Preserve existing stack limits above one, item attributes,
rewards, localization, and every unrelated language-pack entry.
Use --check to audit the deployed server and client resources without writing.
"""

from __future__ import annotations

import argparse
from collections import Counter
from pathlib import Path
import re

from patch_guild_quest_config import read_cbp, read_pack, write_cbp, write_pack


ROOT = Path(__file__).resolve().parents[1]
ITEM_DIR = ROOT / "Server/S1001/data/config/item"
SERVER = ITEM_DIR / "StdItems.txt"
LANGUAGE = ROOT / "Server/S1001/data/language/Zh-CN/Item.lua"
CLIENT_DIR = ROOT / "web/v2/lang/zh-cn"
PACK = CLIENT_DIR / "zh-cn.dat"
STACK_LIMIT = 200
BOX_NAME = re.compile(r"礼包|箱|盒")
ITEM_BLOCK = re.compile(rb"(?m)^\{\r?\n  id=(\d+),.*?(?=^\},?\r?$)", re.S)
DUP = re.compile(rb"(?m)^(  dup=)(\d+)(,\r?$)")


def server_items(source: bytes) -> dict[int, bytes]:
    matches = list(ITEM_BLOCK.finditer(source))
    items = {int(match[1]): match[0] for match in matches}
    if len(items) != len(matches) or not items:
        raise ValueError("Duplicate or missing server item definitions")
    return items


def stack_limit(block: bytes) -> int:
    matches = list(DUP.finditer(block))
    if len(matches) != 1:
        raise ValueError("Expected exactly one item stack limit")
    return int(matches[0][2])


def targets(source: bytes) -> tuple[dict[int, int], dict[int, str]]:
    names = {int(item): name for item, name in re.findall(
        r'\bn(\d+)="([^"\r\n]*)"', LANGUAGE.read_text(encoding="utf-8-sig"))
        if BOX_NAME.search(name)}
    items = server_items(source)
    comments = {item for item, block in items.items()
                if BOX_NAME.search(block.splitlines()[1].decode("gbk"))}
    if comments != names.keys():
        raise ValueError("Localized and server gift/box lists differ")
    limits = {}
    for item in names:
        block = items[item]
        kind = re.search(rb"(?m)^  type=(\d+),", block)
        if kind is None or int(kind[1]) not in (102, 106):
            raise ValueError(f"Item {item} is not a functional/reward box")
        limit = stack_limit(block)
        if limit < 1:
            raise ValueError(f"Invalid stack limit for item {item}")
        limits[item] = STACK_LIMIT if limit == 1 else limit
    return limits, names


def patch_text(source: bytes, limits: dict[int, int]) -> tuple[bytes, int]:
    changed = 0

    def replace(match):
        nonlocal changed
        item, block = int(match[1]), match[0]
        if item not in limits or stack_limit(block) == limits[item]:
            return block
        updated = DUP.sub(lambda field: field[1] + str(limits[item]).encode() + field[3], block)
        if DUP.sub(rb"\1LIMIT\3", block) != DUP.sub(rb"\1LIMIT\3", updated):
            raise ValueError("An unrelated server item field changed")
        changed += 1
        return updated

    output = ITEM_BLOCK.sub(replace, source)
    before, after = server_items(source), server_items(output)
    if before.keys() != after.keys():
        raise ValueError("Server item IDs changed")
    for item, block in before.items():
        if item not in limits and block != after[item]:
            raise ValueError("An unrelated server item changed")
        if item in limits and stack_limit(after[item]) != limits[item]:
            raise ValueError("Server item stack limit was not updated")
    return output, changed


def patch_client(source: bytes, limits: dict[int, int]) -> tuple[bytes, int, set[int]]:
    header, root = read_cbp(source)
    original = read_cbp(source)[1]
    changed, found = 0, set()
    for row in root.children:
        item = int(row.child("id").number())
        if item not in limits:
            continue
        if item in found:
            raise ValueError("Duplicate client box definition")
        found.add(item)
        dup = row.child("dup")
        if dup.number() != limits[item]:
            dup.set_number(limits[item])
            changed += 1
    for before, after in zip(original.children, root.children):
        item = int(before.child("id").number())
        if item in limits:
            before.child("dup").set_number(limits[item])
        if before != after:
            raise ValueError("An unrelated client item or field changed")
    if not changed:
        return source, changed, found
    output = write_cbp(header, root)
    if read_cbp(output)[1] != root:
        raise ValueError("Patched client item table did not round-trip")
    return output, changed, found


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    limits, _ = targets(SERVER.read_bytes())
    outputs, changes = {}, Counter()
    paths = [SERVER, ITEM_DIR / "StdItems - 副本.txt",
             *sorted((ITEM_DIR / "stdItemForClient").glob("StdItems*.txt"))]
    for path in paths:
        source = path.read_bytes()
        if path.name == "StdItems5.txt" and not ITEM_BLOCK.search(source):
            continue
        output, count = patch_text(source, limits)
        if count:
            outputs[path] = output
        changes[path.relative_to(ROOT).as_posix()] = count

    pack_source = PACK.read_bytes()
    entries = read_pack(pack_source)
    if write_pack(entries) != pack_source or len(dict(entries)) != len(entries):
        raise ValueError("Invalid or duplicate language-pack entries")
    packed = dict(entries)
    client_outputs, found = {}, set()
    for path in sorted(CLIENT_DIR.glob("stditems*.cbp")):
        source = path.read_bytes()
        if packed.get(path.name) != source:
            raise ValueError(f"Packed and standalone {path.name} differ")
        output, count, seen = patch_client(source, limits)
        found.update(seen)
        if count:
            outputs[path] = output
            client_outputs[path.name] = output
        changes[path.relative_to(ROOT).as_posix()] = count
    if found != limits.keys():
        raise ValueError("Missing client gift/box definitions")
    updated_entries = [(name, client_outputs.get(name, value)) for name, value in entries]
    updated_pack = write_pack(updated_entries)
    verified = read_pack(updated_pack)
    if verified != updated_entries or any(before != after for before, after in
            zip(entries, verified) if before[0] not in client_outputs):
        raise ValueError("An unrelated language-pack resource changed")
    if updated_pack != pack_source:
        outputs[PACK] = updated_pack

    if args.check:
        if outputs:
            raise ValueError("Gift/box stack limits have not been fully synced")
    else:
        for path, output in outputs.items():
            path.write_bytes(output)
    print(f"Verified {len(limits)} gift/box items; existing stackable limits preserved.")
    print(f"Updated {len(outputs)} files; {changes[SERVER.relative_to(ROOT).as_posix()]} "
          "server items newly stackable.")
    for path, count in changes.items():
        if count:
            print(f"{path}: {count} stack limits")
    print("Item IDs, rewards, attributes, names, descriptions and unrelated packed resources unchanged.")


if __name__ == "__main__":
    main()
