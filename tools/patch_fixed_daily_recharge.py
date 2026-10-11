"""Keep day-seven daily recharge display identical to the first six days."""
from __future__ import annotations

from copy import deepcopy
from pathlib import Path

from patch_daily_recharge_client import (
    CONFIG_NAME, read_cbp, read_pack, write_cbp, write_node, write_pack,
)

ROOT = Path(__file__).resolve().parents[1]
CLIENT = ROOT / "web/v2/lang/zh-cn" / CONFIG_NAME
PACK = CLIENT.parent / "zh-cn.dat"


def patch_config(source: bytes) -> bytes:
    header, root = read_cbp(source)
    if [group.name for group in root.children] != [str(i) for i in range(9)]:
        raise ValueError("Unexpected daily recharge groups")
    previous = [write_node(group) for group in root.children]
    fixed = deepcopy(root.children[0])
    fixed.name = "6"
    if write_node(root.children[6]) == write_node(fixed):
        return source
    thresholds = [int(t.child("needPayMoney").number()) for t in root.children[6].children]
    if thresholds != [1000, 5000, 10000, 20000, 50000, 100000]:
        raise ValueError("Unexpected day-seven recharge thresholds")
    root.children[6] = fixed
    patched = write_cbp(header, root)
    _, after = read_cbp(patched)
    if any(write_node(group) != previous[i]
           for i, group in enumerate(after.children) if i != 6):
        raise ValueError("Unrelated daily recharge group changed")
    return patched


def patch_pack(source: bytes, config: bytes, patched: bytes) -> bytes:
    entries = read_pack(source)
    if write_pack(entries) != source:
        raise ValueError("Language pack did not round-trip")
    indices = [i for i, (name, _) in enumerate(entries) if name == CONFIG_NAME]
    if len(indices) != 1 or entries[indices[0]][1] != config:
        raise ValueError("Packed and standalone daily recharge configs differ")
    index = indices[0]
    updated = list(entries)
    updated[index] = (CONFIG_NAME, patched)
    result = write_pack(updated)
    after = read_pack(result)
    if len(after) != len(entries) or any(
        entry != entries[i] for i, entry in enumerate(after) if i != index
    ):
        raise ValueError("Unrelated packaged resource changed")
    return result


def main() -> None:
    original = CLIENT.read_bytes()
    patched = patch_config(original)
    packed = patch_pack(PACK.read_bytes(), original, patched)
    CLIENT.write_bytes(patched)
    PACK.write_bytes(packed)
    print("Daily recharge display fixed; other configuration groups/resources unchanged")


if __name__ == "__main__":
    main()
