"""Remove rank requirements and sync ancient-points products and prices."""

from __future__ import annotations

import argparse
import copy
from pathlib import Path

from patch_guild_quest_config import read_cbp, read_pack, write_cbp, write_pack


ROOT = Path(__file__).resolve().parents[1]
LANG_DIR = ROOT / "web/v2/lang/zh-cn"
CERTIFICATES = {70001: 1, 70002: 1500, 70003: 2500, 70004: 4000, 70005: 6000, 70006: 8500}
PRICE = 88888
PRODUCTS = (
    (7805, "圣诞彩翼"),
    (7040, "金背巨猿"),
    (7654, "蝙蝠战车"),
    (7199, "至高之拳(男)"),
    (7200, "至高之拳(女)"),
    (7655, "哥特军装(男)"),
    (7656, "哥特军装(女)"),
    (7701, "网球达人(男)"),
    (7702, "网球达人(女)"),
    (7711, "红衣主教(男)"),
    (7712, "红衣主教(女)"),
    (7802, "圣诞礼服(男)"),
    (7803, "圣诞礼服(女)"),
    (7823, "猪年战甲"),
    (7824, "猪年战衣"),
    (6650, "新春幻武"),
    (7077, "龙光"),
    (6940, "大鲨鱼"),
    (6938, "夏威夷(男)"),
    (6939, "夏威夷(女)"),
    (7653, "秦皇圣剑"),
    (7696, "不朽丶冰冷"),
    (7804, "圣诞杖"),
    (7719, "主教圣剑"),
    (7822, "黄金裁决"),
)


def patch_store(source: bytes) -> bytes:
    header, root = read_cbp(source)
    original = copy.deepcopy(root)
    items = root.child("4").child("items")
    expected_items = original.child("4").child("items")
    if not 45 <= len(items.children) <= 45 + len(PRODUCTS):
        raise ValueError("Unexpected ancient-points inventory")
    for store_id, required_rank in CERTIFICATES.items():
        matches = [item for item in items.children if item.child("id").number() == store_id]
        if len(matches) != 1 or matches[0].child("item").number() != store_id - 63996:
            raise ValueError(f"Unexpected rank certificate: {store_id}")
        item = matches[0]
        rank_fields = [field for field in item.children if field.name == "rankPoint"]
        if rank_fields and (len(rank_fields) != 1 or rank_fields[0].number() != required_rank):
            raise ValueError(f"Unexpected rank requirement: {store_id}")
        item.children = [field for field in item.children if field.name != "rankPoint"]
        expected = next(item for item in expected_items.children if item.child("id").number() == store_id)
        expected.children = [field for field in expected.children if field.name != "rankPoint"]

    template = next(item for item in items.children if item.child("id").number() == 70045)
    for offset, (item_id, item_name) in enumerate(PRODUCTS):
        store_id = 70046 + offset
        product = copy.deepcopy(template)
        product.name = str(45 + offset)
        product.child("id").set_number(store_id)
        product.child("item").set_number(item_id)
        price = product.child("price").child("0")
        if price.child("type").number() != 8 or price.child("bind").value != b"\x01" + b"\x00" * 7:
            raise ValueError("Unexpected ancient-points currency or binding")
        price.child("price").set_number(PRICE)
        price.child("oldPrice").set_number(PRICE)
        existing = [item for group in root.children for item in group.child("items").children
                    if item.child("id").number() == store_id]
        if existing:
            if len(existing) != 1 or existing[0] != product or items.children[45 + offset] != product:
                raise ValueError(f"Unexpected existing product: {item_name}")
        else:
            if len(items.children) != 45 + offset or any(item.child("item").number() == item_id for item in items.children):
                raise ValueError(f"Unexpected product order or duplicate item: {item_name}")
            items.children.append(product)
            expected_items.children.append(copy.deepcopy(product))
    if original != root:
        raise ValueError("Unrelated store changes")
    return write_cbp(header, root)


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true", help="Verify resources without writing")
    args = parser.parse_args()
    pack_path = LANG_DIR / "zh-cn.dat"
    source_pack = pack_path.read_bytes()
    entries = read_pack(source_pack)
    if write_pack(entries) != source_pack:
        raise ValueError("Language pack did not round-trip")
    original_entries = list(entries)
    updated = {}
    for name, patch in (("store.cbp", patch_store),):
        positions = [index for index, entry in enumerate(entries) if entry[0] == name]
        if len(positions) != 1:
            raise ValueError(f"Missing or duplicate packed config: {name}")
        position = positions[0]
        source = (LANG_DIR / name).read_bytes()
        if entries[position][1] != source:
            raise ValueError(f"Packed config differs from its standalone copy: {name}")
        header, config = read_cbp(source)
        if write_cbp(header, config) != source:
            raise ValueError(f"Config did not round-trip: {name}")
        updated[name] = patch(source)
        if args.check and updated[name] != source:
            raise ValueError(f"Client config has not been synced: {name}")
        entries[position] = (name, updated[name])
    if any(before != after for before, after in zip(original_entries, entries) if before[0] not in updated):
        raise ValueError("Unrelated packed resources changed")
    output_pack = write_pack(entries)
    if read_pack(output_pack) != entries:
        raise ValueError("Updated language pack did not round-trip")
    if not args.check:
        for name, config in updated.items():
            (LANG_DIR / name).write_bytes(config)
        pack_path.write_bytes(output_pack)
    print(f"Verified six unrestricted certificates and {len(PRODUCTS)} products for {PRICE} ancient points.")


if __name__ == "__main__":
    main()
