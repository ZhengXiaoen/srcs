"""Sync the 30/100 RMB opening gifts with the standalone and packed client.

The four milestones are 2, 3, 5 and 7 days. Only nine reward slots change;
all other opening activities and language-pack entries must remain identical.
Use --check to verify the server/client rewards without writing files.
"""

from __future__ import annotations

import argparse
import re
from pathlib import Path

from patch_guild_quest_config import read_cbp, read_pack, write_cbp, write_pack


ROOT = Path(__file__).resolve().parents[1]
SERVER = ROOT / "Server/S1001/data/config/activity/OpenServerAwardCfg.lua"
CLIENT = ROOT / "web/v2/lang/zh-cn/openserverawardCfg.cbp"
PACK = CLIENT.parent / "zh-cn.dat"
DAYS = (2, 3, 5, 7)
PAY = (30000, 100000)
# (tier, milestone, reward slot): ((original id, count), (new id, count))
CHANGES = {
    **{(0, day, 5): ((6918 + day, 1), (6658, 10)) for day in range(4)},
    (0, 3, 3): ((6658, 1), (6659, 1)),
    **{(1, day, 5): ((6921 + day, 1), (7650, 1)) for day in range(4)},
}


def server_rewards():
    text = SERVER.read_text(encoding="utf-8-sig")
    section = text.split("-- 12. 累计连续充值", 1)[1].split("-- 13 材料返利", 1)[0]
    section = re.sub(r"--[^\r\n]*", "", section)
    days = re.search(r"totalDays\s*=\s*\{([^{}]+)\}", section)
    if days is None or tuple(map(int, days[1].split(","))) != DAYS:
        raise ValueError("Unexpected server reward milestones")
    groups = re.split(r"needPayYb\s*=\s*(\d+)\s*,", section)
    if len(groups) != 5:
        raise ValueError("Expected two server opening-gift tiers")
    result = []
    for tier, payment in enumerate(PAY):
        if int(groups[1 + tier * 2]) != payment:
            raise ValueError("Unexpected server payment threshold")
        items = []
        for table in re.findall(r"\{([^{}]+)\}", groups[2 + tier * 2]):
            fields = {}
            for field in table.split(","):
                match = re.fullmatch(r"\s*(type|id|count|bind)\s*=\s*(\d+)\s*", field)
                if not match or match[1] in fields:
                    raise ValueError("Invalid server reward field")
                fields[match[1]] = int(match[2])
            if (fields.keys() != {"type", "id", "count", "bind"}
                    or fields["type"] != 0 or fields["bind"] != 1 or fields["count"] < 1):
                raise ValueError("Expected positive bound item rewards")
            items.append(fields)
        if len(items) != 24:
            raise ValueError("Expected four milestones with six rewards each")
        result.append([items[start:start + 6] for start in range(0, 24, 6)])
    for (tier, day, slot), (_, expected) in CHANGES.items():
        reward = result[tier][day][slot]
        if (reward["id"], reward["count"]) != expected:
            raise ValueError("Server opening gifts do not contain the requested rewards")
    return result


def patch_config(source, rewards):
    header, root = read_cbp(source)
    original = read_cbp(source)[1]
    activity = root.child("11")  # Server activity 12 has client index 11.
    if [node.number() for node in activity.child("openTime").children] != [1, 7]:
        raise ValueError("Unexpected client activity window")
    listing = activity.child("list")
    if tuple(node.number() for node in listing.child("totalDays").children) != DAYS:
        raise ValueError("Unexpected client reward milestones")
    tiers = listing.child("PayRMB").children
    if [node.name for node in tiers] != ["0", "1"]:
        raise ValueError("Unexpected client opening-gift tiers")
    for tier, node in enumerate(tiers):
        if node.child("needPayYb").number() != PAY[tier]:
            raise ValueError("Server and client payment thresholds differ")
        milestones = node.child("award").children
        if [day.name for day in milestones] != [str(i) for i in range(4)]:
            raise ValueError("Unexpected client milestone indexes")
        for day, milestone in enumerate(milestones):
            if [item.name for item in milestone.children] != [str(i) for i in range(6)]:
                raise ValueError("Unexpected client reward slots")
            for slot, item in enumerate(milestone.children):
                expected = rewards[tier][day][slot]
                current = {field.name: field.number() for field in item.children}
                change = CHANGES.get((tier, day, slot))
                if change:
                    if (current.get("id"), current.get("count")) not in change:
                        raise ValueError("Unexpected original client gift")
                    current.update(id=expected["id"], count=expected["count"])
                if current != expected:
                    raise ValueError("An unrelated client reward differs from the server")
                if change:
                    item.child("id").set_number(expected["id"])
                    item.child("count").set_number(expected["count"])
    if root == original:
        return source
    for before, after in zip(original.children, root.children):
        if before.name != "11" and before != after:
            raise ValueError("An unrelated opening activity changed")
    result = write_cbp(header, root)
    if read_cbp(result)[1] != root:
        raise ValueError("Patched client config did not round-trip")
    return result


def sync_pack(source, old_config, new_config):
    original = read_pack(source)
    if write_pack(original) != source:
        raise ValueError("Language pack did not round-trip")
    positions = [i for i, (name, _) in enumerate(original) if name == CLIENT.name]
    if len(positions) != 1 or original[positions[0]][1] != old_config:
        raise ValueError("Packed and standalone opening configs differ")
    entries = list(original)
    entries[positions[0]] = (CLIENT.name, new_config)
    result = write_pack(entries)
    verified = read_pack(result)
    if verified != entries or any(before != after for i, (before, after) in
                                 enumerate(zip(original, verified)) if i != positions[0]):
        raise ValueError("An unrelated packed resource changed")
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    config, pack = CLIENT.read_bytes(), PACK.read_bytes()
    updated = patch_config(config, server_rewards())
    outputs = [(CLIENT, config, updated), (PACK, pack, sync_pack(pack, config, updated))]
    if args.check:
        if any(old != new for _, old, new in outputs):
            raise ValueError("Opening-gift client rewards have not been synced")
    else:
        for path, old, new in outputs:
            if old != new:
                path.write_bytes(new)
    print("Verified both tiers, all eight milestones and matching packed config; "
          "unrelated resources are unchanged.")


if __name__ == "__main__":
    main()
