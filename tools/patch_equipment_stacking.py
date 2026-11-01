"""Sync equipment stack limits without changing item attributes or resources.

The native wearer accepts the standard equipment range 1..92; dedicated systems
use spirit items, runes, totems, mount/wing parts, fighter parts and hero gear.
Types 0, 93/94 (unused placeholders), materials and consumables are excluded.
Per-instance attribute and soul compatibility is enforced by the engine patch,
not by the shared item definition's dup field.
"""
from __future__ import annotations

import argparse
from collections import Counter
from pathlib import Path
import re

from patch_box_stacking import (
    ROOT, ITEM_DIR, SERVER, CLIENT_DIR, PACK, server_items,
    patch_text, patch_client,
)
from patch_guild_quest_config import read_pack, write_pack


STACK_LIMIT = 9999
EQUIPMENT_TYPES = frozenset(range(1, 93)) | frozenset(
    (115, 120, 121, *range(122, 131), *range(201, 206)))


def is_equipment_type(kind: int) -> bool:
    return kind in EQUIPMENT_TYPES


def equipment_ids(source: bytes | None = None) -> set[int]:
    if source is None:
        source = SERVER.read_bytes()
    result = set()
    for item, block in server_items(source).items():
        match = re.search(rb"(?m)^  type=(\d+),", block)
        if match is None:
            raise ValueError(f"Missing item type: {item}")
        if is_equipment_type(int(match[1])):
            result.add(item)
    if not result:
        raise ValueError("No equipment definitions found")
    return result


def build_outputs() -> tuple[dict[Path, bytes], Counter, set[int]]:
    ids = equipment_ids()
    limits = dict.fromkeys(ids, STACK_LIMIT)
    outputs, changes = {}, Counter()
    paths = [SERVER, ITEM_DIR / "StdItems - 副本.txt",
             *sorted((ITEM_DIR / "stdItemForClient").glob("StdItems*.txt"))]
    for path in paths:
        source = path.read_bytes()
        if path.name == "StdItems5.txt" and not re.search(rb"(?m)^  id=", source):
            continue
        output, count = patch_text(source, limits)
        if count:
            outputs[path] = output
        changes[path.relative_to(ROOT).as_posix()] = count

    pack_source = PACK.read_bytes()
    entries = read_pack(pack_source)
    if write_pack(entries) != pack_source or len(dict(entries)) != len(entries):
        raise ValueError("Invalid or duplicate language-pack entries")
    packed, replacements, found = dict(entries), {}, set()
    for path in sorted(CLIENT_DIR.glob("stditems*.cbp")):
        source = path.read_bytes()
        if packed.get(path.name) != source:
            raise ValueError(f"Packed and standalone {path.name} differ")
        output, count, seen = patch_client(source, limits)
        # stditems.cbp is the maintained legacy aggregate (IDs 1..6128);
        # split tables also contain those IDs. Validate each copy independently.
        found.update(seen)
        if count:
            outputs[path] = output
            replacements[path.name] = output
        changes[path.relative_to(ROOT).as_posix()] = count
    if found != ids:
        raise ValueError(f"Equipment client coverage mismatch: {sorted(found ^ ids)}")

    updated_entries = [(name, replacements.get(name, value)) for name, value in entries]
    updated_pack = write_pack(updated_entries)
    verified = read_pack(updated_pack)
    if verified != updated_entries or any(before != after for before, after in
            zip(entries, verified) if before[0] not in replacements):
        raise ValueError("An unrelated packed resource changed")
    if updated_pack != pack_source:
        outputs[PACK] = updated_pack
    return outputs, changes, ids


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    outputs, changes, ids = build_outputs()
    if args.check:
        if outputs:
            raise ValueError("Equipment stack limits have not been fully synced")
    else:
        for path, output in outputs.items():
            path.write_bytes(output)
    print(f"Verified {len(ids)} equipment definitions; stack limit {STACK_LIMIT}.")
    print(f"Updated {len(outputs)} files; "
          f"{changes[SERVER.relative_to(ROOT).as_posix()]} server limits changed.")
    for path, count in changes.items():
        if count:
            print(f"{path}: {count}")
    print("Only dup changed; all other item fields and packed resources preserved.")


if __name__ == "__main__":
    main()
