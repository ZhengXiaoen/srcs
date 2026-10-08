"""Sync all fifteen anniversary material rebate tiers into the client pack."""
from copy import deepcopy
from pathlib import Path
import re

from patch_daily_recharge_client import read_cbp, read_pack, write_cbp, write_pack, write_node

ROOT = Path(__file__).resolve().parents[1]
SERVER = ROOT / 'Server/S1001/data/config/new_activity/festival/activity_jingji.lua'
DIRECTORY = ROOT / 'web/v2/lang/zh-cn'
KEYS = ('GemRank', 'PeartRank', 'MountRank', 'RingRank')
ITEMS = (6691, 7810, 7811, 7046)


def server_rows():
    source = SERVER.read_text('utf-8-sig')
    result = {}
    for key, item in zip(KEYS, ITEMS):
        block = re.search(r'^   ' + key + r'\s*=\s*\{(.*?)^   \},', source, re.M | re.S)
        if block is None:
            raise ValueError(f'Missing server material table: {key}')
        rows = []
        for threshold, reward in re.findall(
                r'count\s*=\s*(\d+),\s*--[^\n]*\n\s*award\s*=\s*\{\s*\{([^{}]+)\}', block[1]):
            fields = {name: int(value) for name, value in re.findall(r'(\w+)\s*=\s*(\d+)', reward)}
            rows.append((int(threshold), fields))
        if len(rows) != 15 or any(a[0] >= b[0] for a, b in zip(rows, rows[1:])):
            raise ValueError(f'Expected fifteen increasing tiers: {key}')
        for index, (_, reward) in enumerate(rows, 1):
            if reward != dict(type=0, id=item, count=index * 5, bind=1):
                raise ValueError(f'Unexpected reward in {key} tier {index}')
        result[key] = rows
    return result


def patch_config(source):
    header, root = read_cbp(source)
    before = {node.name: write_node(node) for node in root.children if node.name not in KEYS}
    for key, rows in server_rows().items():
        table = root.child(key)
        if len(table.children) not in (5, 15):
            raise ValueError(f'Unexpected client tier count: {key}')
        for index, node in enumerate(table.children):
            threshold, reward = rows[index]
            actual = {field.name: field.number() for field in node.child('award').children[0].children}
            if node.name != str(index) or node.child('count').number() != threshold or actual != reward:
                raise ValueError(f'Client/server mismatch: {key} tier {index + 1}')
        template = table.children[-1]
        for index in range(len(table.children), len(rows)):
            node = deepcopy(template)
            node.name = str(index)
            threshold, reward = rows[index]
            node.child('count').set_number(threshold)
            for field, value in reward.items():
                node.child('award').children[0].child(field).set_number(value)
            table.children.append(node)
    if before != {node.name: write_node(node) for node in root.children if node.name not in KEYS}:
        raise ValueError('Unrelated client configuration changed')
    return write_cbp(header, root)


def main():
    config_path = DIRECTORY / 'activityjingji.cbp'
    pack_path = DIRECTORY / 'zh-cn.dat'
    source, pack = config_path.read_bytes(), pack_path.read_bytes()
    entries = read_pack(pack)
    if write_pack(entries) != pack:
        raise ValueError('Language pack did not round-trip')
    matches = [i for i, (name, _) in enumerate(entries) if name == config_path.name]
    if len(matches) != 1 or entries[matches[0]][1] != source:
        raise ValueError('Packed and standalone material configs differ')
    updated = patch_config(source)
    if patch_config(updated) != updated:
        raise ValueError('Material config patch is not idempotent')
    entries[matches[0]] = (config_path.name, updated)
    updated_pack = write_pack(entries)
    if read_pack(updated_pack) != entries:
        raise ValueError('Updated language pack did not round-trip')
    config_path.write_bytes(updated)
    pack_path.write_bytes(updated_pack)
    print('Synced fifteen tiers for all four materials; other pack entries are unchanged.')


if __name__ == '__main__':
    main()
