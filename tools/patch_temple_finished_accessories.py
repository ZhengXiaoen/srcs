"""Synchronize four temple accessory descriptions without changing other assets."""
from __future__ import annotations

import argparse
from pathlib import Path
import re

from patch_guild_quest_config import read_cbp, read_pack, write_cbp, write_pack

ROOT = Path(__file__).resolve().parents[1]
ITEM_IDS = {5140, 5141, 5142, 5143}
RESOURCES = {"stditems.cbp", "stditems3.cbp"}


def descriptions():
    language = (ROOT / "Server/S1001/data/language/Zh-CN/Item.lua").read_text("utf-8-sig")
    return {item: re.search(rf'i{item}="([^"\r\n]+)"', language)[1].replace("\\\\", "\\")
            for item in ITEM_IDS}


def patch_config(source):
    header, root = read_cbp(source)
    expected = descriptions()
    found = set()
    for node in root.children:
        item = int(node.child("id").number())
        if item in expected:
            if item in found:
                raise ValueError("Duplicate finished accessory record")
            found.add(item)
            node.child("desc").value = expected[item].encode("utf-8")
    if found != ITEM_IDS:
        raise ValueError("Missing finished accessory record")
    return write_cbp(header, root)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    directory = ROOT / "web/v2/lang/zh-cn"
    pack_path = directory / "zh-cn.dat"
    source = pack_path.read_bytes()
    entries = read_pack(source)
    if write_pack(entries) != source:
        raise ValueError("Language pack did not round-trip")
    updates = {}
    for name in RESOURCES:
        standalone = (directory / name).read_bytes()
        positions = [index for index, (entry, data) in enumerate(entries) if entry == name]
        if len(positions) != 1 or entries[positions[0]][1] != standalone:
            raise ValueError("Packed and standalone accessory resources differ")
        updated = patch_config(standalone)
        if args.check and updated != standalone:
            raise ValueError("Missing temple finished accessory descriptions")
        updates[name] = updated
        entries[positions[0]] = (name, updated)
    updated_pack = write_pack(entries)
    if args.check:
        if updated_pack != source:
            raise ValueError("Packed accessory descriptions are outdated")
    else:
        for name, data in updates.items():
            (directory / name).write_bytes(data)
        pack_path.write_bytes(updated_pack)
    print("Verified four finished accessory descriptions and both packed item catalogs.")


if __name__ == "__main__":
    main()
