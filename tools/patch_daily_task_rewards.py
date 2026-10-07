"""Sync condensed daily-task recovery rewards and verify other packed resources."""

import argparse
from pathlib import Path

from patch_guild_quest_config import read_cbp, read_pack, write_cbp, write_pack


ROOT = Path(__file__).resolve().parents[1]
RESOURCES = ROOT / "web/v2/lang/zh-cn"
NAME = "copybackconfig.cbp"


def update(source):
    header, root = read_cbp(source)
    entry = root.child("0")
    assert entry.child("copyName").value.decode("utf-8") == "战无双"
    awards = entry.child("copyAwards")
    assert len(awards.children) == 2
    for index, kind, before, after in ((0, 2, 5000000, 25000000), (1, 57, 2000, 10000)):
        award = awards.child(str(index))
        assert award.child("type").number() == kind
        assert award.child("id").number() == 0
        count = award.child("count")
        assert count.number() in (before, after)
        count.set_number(after)
    result = write_cbp(header, root)
    read_cbp(result)
    # Reversing only these two counts must restore the complete original tree.
    for index, count in ((0, 5000000), (1, 2000)):
        awards.child(str(index)).child("count").set_number(count)
    _, original = read_cbp(source)
    if source != result:
        assert root == original, "Unrelated recovery config changed"
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    config_path = RESOURCES / NAME
    pack_path = RESOURCES / "zh-cn.dat"
    source = config_path.read_bytes()
    result = update(source)
    original = read_pack(pack_path.read_bytes())
    entries = [(name, result if name.lower() == NAME else data) for name, data in original]
    matches = [(name, data) for name, data in original if name.lower() == NAME]
    assert len(matches) == 1 and matches[0][1] == source
    packed = write_pack(entries)
    verified = read_pack(packed)
    assert [(name, data) for name, data in original if name.lower() != NAME] == [
        (name, data) for name, data in verified if name.lower() != NAME
    ], "Unrelated packed resources changed"
    if args.check:
        assert source == result and pack_path.read_bytes() == packed, "Daily rewards need synchronization"
    else:
        config_path.write_bytes(result)
        pack_path.write_bytes(packed)
    print("PASS: condensed daily recovery rewards; all other packed resources unchanged")


if __name__ == "__main__":
    main()
