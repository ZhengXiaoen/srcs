"""Sync all fifteen anniversary material rebate tiers into the client pack."""
from copy import deepcopy
from pathlib import Path
import re

from patch_daily_recharge_client import read_cbp, read_pack, write_cbp, write_pack, write_node
from patch_activity_entries import q
from patch_activity_reminders import GAME, call, get, prop, normalize, relocate
from patch_bag_client import ABCReader, encode_u30
from patch_super_anniversary import CLIENT, abc_section, assemble, inspect_abc, instructions, bytecode_requirements

ROOT = Path(__file__).resolve().parents[1]
SERVER = ROOT / 'Server/S1001/data/config/new_activity/festival/activity_jingji.lua'
DIRECTORY = ROOT / 'web/v2/lang/zh-cn'
KEYS = ('GemRank', 'PeartRank', 'MountRank', 'RingRank')
ITEMS = (6691, 7810, 7811, 7046)
METHODS = {15829}


def patch_swf(source):
    """Build the scrollable reward list from the selected material's tier count."""
    raw, (_, _, a, b) = abc_section(source)
    abc, positions = normalize(raw[a:b])
    names, _, bodies = inspect_abc(abc)
    mid = 15829
    start, size, limits = bodies[mid]
    code = abc[start:start + size]
    ops = instructions(code)
    # The final loop is the reward-row builder, after the separate red-dot scan.
    condition = next(i for i in range(len(ops) - 1, -1, -1) if ops[i].opcode == 0x15)
    bound = ops[condition - 1]
    index = ops[condition - 2]
    cfg = call(prop(GAME, 32246), 11394)
    selector = next(o.operands[0] for o in ops if o.opcode == 0x66 and names[o.operands[0]] == '_selectIndex')
    dynamic = next(o.operands[0] for o in ops if o.opcode == 0x61 and not names[o.operands[0]])
    length = next(o.operands[0] for o in ops if o.opcode == 0x66 and names[o.operands[0]] == 'length')
    value = (b''.join(prop(cfg, field) for field in (24596, 24599, 24597, 24598))
             + q(0x56, 4) + prop(get(0), selector) + q(0x66, dynamic) + q(0x66, length))
    if bound.opcode == 0x66 and bound.operands == (length,) and value in code:
        return source
    if index.opcode != 0x62 or index.operands != (5,):
        raise ValueError('Unexpected material row loop')
    if bound.opcode != 0x24 or bound.operands != (5,):
        raise ValueError('Unexpected fixed material row limit')
    updated = relocate(code, [(bound.start, bound.end, value)])[0]
    stack, registers, scopes = bytecode_requirements(updated, names, limits[2])
    new_limits = (max(limits[0], stack), max(limits[1], registers), limits[2], max(limits[3], scopes))
    reader = ABCReader(abc)
    reader.pos = start + size
    if reader.u30():
        raise ValueError('Unexpected material page exception handlers')
    header = b''.join(encode_u30(v) for v in (mid, *limits, size))
    if abc[start - len(header):start] != header:
        raise ValueError('Unexpected material page method header')
    replacement = b''.join(encode_u30(v) for v in (mid, *new_limits, len(updated))) + updated + b'\0'
    lo, hi = start - len(header), reader.pos
    result = bytearray(abc[:lo] + replacement + abc[hi:])
    _, _, after = inspect_abc(result)
    for method, (old_start, old_size, old_limits) in bodies.items():
        new_start, new_size, actual = after[method]
        if method != mid and (actual != old_limits or abc[old_start:old_start + old_size] != result[new_start:new_start + new_size]):
            raise ValueError(f'Unrelated client method {method} changed')
    if result[:lo] + abc[lo:hi] + result[lo + len(replacement):] != abc:
        raise ValueError('Unrelated client metadata changed')
    for pos in positions:
        result[pos] = 0
    return assemble(source, bytes(result))


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
    client = CLIENT.read_bytes()
    updated_client = patch_swf(client)
    if patch_swf(updated_client) != updated_client:
        raise ValueError('Material page patch is not idempotent')
    config_path.write_bytes(updated)
    pack_path.write_bytes(updated_pack)
    if updated_client != client:
        CLIENT.write_bytes(updated_client)
    print('Synced material tiers and scrollable client rows; unrelated resources unchanged.')


if __name__ == '__main__':
    main()
