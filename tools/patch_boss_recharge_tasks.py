"""Sync Boss recharge eligibility text without changing task rewards."""

from __future__ import annotations

import argparse
import copy
from pathlib import Path

from patch_guild_quest_config import read_cbp, read_pack, write_cbp, write_pack


ROOT = Path(__file__).resolve().parents[1]
LANG_DIR = ROOT / "web/v2/lang/zh-cn"
REPLACEMENTS = {
    "LivenessActivityCfg.cbp": (
        ("livenessTask", "1", "tips"),
        "每次完成[每日首充]任务都可获得<25点>活跃奖励!",
        "每次完成[每日首充]任务都可获得<25点>活跃奖励!（Boss元宝直充同样计入）",
    ),
    "brotherQingMiDuTask.cbp": (
        ("2", "0", "txt"),
        "每日首冲",
        "首充/Boss直充",
    ),
}


def patch_config(source: bytes, name: str) -> bytes:
    header, root = read_cbp(source)
    if write_cbp(header, root) != source:
        raise ValueError(f"Config did not round-trip: {name}")
    original = copy.deepcopy(root)
    path, old_text, new_text = REPLACEMENTS[name]
    node = root
    original_node = original
    for part in path:
        matches = [child for child in node.children if child.name == part]
        original_matches = [child for child in original_node.children if child.name == part]
        if len(matches) != 1 or len(original_matches) != 1:
            raise ValueError(f"Missing or duplicate task field: {name}/{part}")
        node = matches[0]
        original_node = original_matches[0]
    if node.kind != 3 or node.value.decode("utf-8") not in (old_text, new_text):
        raise ValueError(f"Unexpected task text: {name}")
    if node.value.decode("utf-8") == new_text:
        return source
    node.value = new_text.encode("utf-8")
    original_node.value = node.value
    if original != root:
        raise ValueError(f"Unrelated config changes: {name}")
    return write_cbp(header, root)


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true", help="Verify without writing resources")
    args = parser.parse_args()
    pack_path = LANG_DIR / "zh-cn.dat"
    original_pack = pack_path.read_bytes()
    entries = read_pack(original_pack)
    if write_pack(entries) != original_pack:
        raise ValueError("Language pack did not round-trip")
    original_entries = list(entries)
    updated_configs = {}
    for name in REPLACEMENTS:
        positions = [index for index, entry in enumerate(entries) if entry[0] == name]
        if len(positions) != 1:
            raise ValueError(f"Missing or duplicate packed config: {name}")
        position = positions[0]
        original_config = (LANG_DIR / name).read_bytes()
        if entries[position][1] != original_config:
            raise ValueError(f"Packed config differs from standalone copy: {name}")
        patched = patch_config(original_config, name)
        if args.check and patched != original_config:
            raise ValueError(f"Client task text has not been synced: {name}")
        updated_configs[name] = patched
        entries[position] = (name, patched)
    for before, after in zip(original_entries, entries):
        if before[0] not in REPLACEMENTS and before != after:
            raise ValueError(f"Unrelated packed resource changes: {before[0]}")
    updated_pack = write_pack(entries)
    if read_pack(updated_pack) != entries:
        raise ValueError("Updated language pack did not round-trip")
    if not args.check:
        for name, config in updated_configs.items():
            (LANG_DIR / name).write_bytes(config)
        pack_path.write_bytes(updated_pack)
    print("Verified two task descriptions; rewards and unrelated resources are unchanged.")


if __name__ == "__main__":
    main()
