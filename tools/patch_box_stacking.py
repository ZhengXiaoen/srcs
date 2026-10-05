"""Enable stacking for boxes, activation items and ride gear in all client copies.

Change only dup. Preserve existing stack limits above one, item attributes,
rewards, localization, and every unrelated language-pack entry.
Use --check to audit the deployed server and client resources without writing.
Thor/Legend activation materials use type 106. Type 64..71 Legend equipment
and type 115 spirit equipment are excluded.
Ride, shield and fashion item IDs come from their actual system configurations.
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
MATERIAL_NAME = re.compile(r"^(?:雷神|传世)")
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


def appearance_groups() -> dict[str, set[int]]:
    def config(path: str) -> bytes:
        source = (ROOT / "Server/S1001/data/config" / path).read_bytes()
        return re.sub(rb"--[^\r\n]*", b"", source)

    def ids(field: bytes, source: bytes) -> set[int]:
        return {int(value) for value in re.findall(rb"\b" + field + rb"\s*=\s*(\d+)", source)}

    shields = re.search(rb"\bShenDunIds\s*=\s*\{([^}]+)\}",
                        config("equipSynthesis/ShenDunCfg.lua"))
    gear = re.search(rb"\bequips\s*=\s*\{(.*?)\n\s*\},",
                     config("ride/RideGameConfig.lua"), re.S)
    if shields is None or gear is None:
        raise ValueError("Missing shield or ride equipment configuration")
    groups = {
        "ride": ids(b"horseId", config("ride/HuanhuaHorseCfg.lua")) |
                ids(b"needItemId", config("ride/SuperHorseCfg.lua")),
        "ride_gear": {int(value) for value in re.findall(rb"\d+", gear[1])},
        "shield": {int(value) for value in re.findall(rb"\d+", shields[1])},
        "fashion": ids(b"itemId", config("modules/fashion_dress_cfg.lua")),
    }
    if any(not group for group in groups.values()):
        raise ValueError("Empty appearance item group")
    return groups


def targets(source: bytes) -> tuple[dict[int, int], dict[int, str]]:
    all_names = {int(item): name for item, name in re.findall(
        r'\bn(\d+)="([^"\r\n]*)"', LANGUAGE.read_text(encoding="utf-8-sig"))}
    names = {item: name for item, name in all_names.items() if BOX_NAME.search(name)}
    items = server_items(source)
    comments = {item for item, block in items.items()
                if BOX_NAME.search(block.splitlines()[1].decode("gbk"))}
    if comments != names.keys():
        raise ValueError("Localized and server gift/box lists differ")
    materials = {item: name for item, name in all_names.items()
                 if MATERIAL_NAME.search(name) and
                 re.search(rb"(?m)^  type=(\d+),", items[item])[1] == b"106"}
    for item, name in materials.items():
        if name not in items[item].splitlines()[1].decode("gbk"):
            raise ValueError("Localized and server material names differ")
    names.update(materials)
    groups = appearance_groups()
    for group, ids in groups.items():
        for item in ids:
            if item not in items or item not in all_names:
                raise ValueError(f"Missing {group} item {item}")
            kind = int(re.search(rb"(?m)^  type=(\d+),", items[item])[1])
            allowed = (122, 123, 124, 125) if group == "ride_gear" else (102, 106)
            if kind not in allowed:
                raise ValueError(f"Unexpected {group} item type for {item}")
            names[item] = all_names[item]
    limits = {}
    for item in names:
        block = items[item]
        kind = re.search(rb"(?m)^  type=(\d+),", block)
        allowed = (122, 123, 124, 125) if item in groups["ride_gear"] else (102, 106)
        if kind is None or int(kind[1]) not in allowed:
            raise ValueError(f"Item {item} is not a functional/reward item")
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
    print(f"Verified {len(limits)} box/activation/ride items; existing stackable limits preserved.")
    print(f"Updated {len(outputs)} files; {changes[SERVER.relative_to(ROOT).as_posix()]} "
          "server items newly stackable.")
    for path, count in changes.items():
        if count:
            print(f"{path}: {count} stack limits")
    print("Item IDs, rewards, attributes, names, descriptions and unrelated packed resources unchanged.")


if __name__ == "__main__":
    main()
