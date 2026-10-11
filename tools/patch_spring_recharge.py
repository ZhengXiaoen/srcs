"""Sync Spring recharge thresholds and daily rewards with the shipped client.

Only EveryTotalPay changes in SpringFestivalCfg.cbp, and only that config
changes in zh-cn.dat. Use --check to verify synchronization without writing.
"""
from __future__ import annotations

import argparse
import copy
import re
from pathlib import Path

from patch_guild_quest_config import read_cbp, read_pack, write_cbp, write_pack

ROOT = Path(__file__).resolve().parents[1]
SERVER = ROOT / "Server/S1001/data/config/activity/SpringFestivalCfg.lua"
CLIENT = ROOT / "web/v2/lang/zh-cn/SpringFestivalCfg.cbp"
PACK = CLIENT.with_name("zh-cn.dat")


def server_rewards():
    source = SERVER.read_text("utf-8-sig")
    section = source.split("\tEveryTotalPay =", 1)[1].split("\tXiaoFeiZhuanPanNew =", 1)[0]
    section = re.sub(r"--[^\r\n]*", "", section)
    tiers = []
    for amount, days in re.findall(r"needPay\s*=\s*(\d+)(.*?)(?=needPay\s*=|\Z)", section, re.S):
        awards = []
        for day in re.findall(r"award\s*=\s*\{((?:\s*\{[^{}]+\}\s*,)+)\s*\}", days):
            items = []
            for table in re.findall(r"\{([^{}]+)\}", day):
                fields = re.findall(r"(type|id|count|bind)\s*=\s*(\d+)", table)
                item = {key: int(value) for key, value in fields}
                if len(fields) != 4 or item.keys() != {"type", "id", "count", "bind"}:
                    raise ValueError("Unexpected Spring reward fields")
                if item["type"] != 0 or item["bind"] != 1 or item["count"] < 1:
                    raise ValueError("Expected positive, bound item rewards")
                items.append(item)
            if len(items) != 5:
                raise ValueError("Expected five Spring recharge rewards per day")
            awards.append(items)
        if len(awards) != 12:
            raise ValueError("Expected twelve Spring recharge days")
        tiers.append((int(amount), awards))
    if [amount for amount, _ in tiers] != [100000, 500000, 1000000, 2000000]:
        raise ValueError("Unexpected Spring recharge thresholds")
    return tiers


def patch_config(source, tiers):
    header, root = read_cbp(source)
    original = copy.deepcopy(root)
    config = root.child("EveryTotalPay")
    if [tier.name for tier in config.children] != [str(i) for i in range(4)]:
        raise ValueError("Unexpected client recharge tiers")
    for tier, (amount, days) in zip(config.children, tiers, strict=True):
        tier.child("needPay").set_number(amount)
        entries = tier.child("days").children
        if [day.name for day in entries] != [str(i) for i in range(12)]:
            raise ValueError("Unexpected client recharge days")
        for day, awards in zip(entries, days, strict=True):
            cells = day.child("award").children
            if [cell.name for cell in cells] != [str(i) for i in range(5)]:
                raise ValueError("Unexpected client reward slots")
            for cell, item in zip(cells, awards, strict=True):
                for field, value in item.items():
                    cell.child(field).set_number(value)
    if root == original:
        return source
    updated = write_cbp(header, root)
    verified = read_cbp(updated)[1]
    if verified != root:
        raise ValueError("Updated Spring config did not round-trip")
    verified.child("EveryTotalPay").children = original.child("EveryTotalPay").children
    if verified != original:
        raise ValueError("Unrelated Spring configuration changed")
    return updated


def sync_pack(source, old_config, new_config):
    entries = read_pack(source)
    if write_pack(entries) != source:
        raise ValueError("Language pack did not round-trip")
    indexes = [i for i, (name, _) in enumerate(entries) if name == CLIENT.name]
    if len(indexes) != 1 or entries[indexes[0]][1] != old_config:
        raise ValueError("Standalone and packed Spring configs differ")
    original = list(entries)
    entries[indexes[0]] = (CLIENT.name, new_config)
    output = write_pack(entries)
    verified = read_pack(output)
    if verified != entries or any(before != after for i, (before, after) in
            enumerate(zip(original, verified, strict=True)) if i != indexes[0]):
        raise ValueError("Unrelated packed resources changed")
    return output


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    config, pack = CLIENT.read_bytes(), PACK.read_bytes()
    updated = patch_config(config, server_rewards())
    outputs = [(CLIENT, config, updated), (PACK, pack, sync_pack(pack, config, updated))]
    if args.check:
        if any(old != new for _, old, new in outputs):
            raise ValueError("Spring recharge client resources need synchronization")
    else:
        for path, old, new in outputs:
            if old != new:
                path.write_bytes(new)
    print("Verified four thresholds and 240 daily rewards; other packed resources are unchanged.")


if __name__ == "__main__":
    main()
