"""Add gold brick 83 to Other Items auto-pickup and sync the language pack.

Only the item ID range changes. Existing player pickup switches and the gold
brick's rewards, item type, and drop protections remain authoritative.
"""
from __future__ import annotations

import argparse
import struct
from pathlib import Path

from patch_guild_quest_config import Node, read_cbp, read_pack, write_cbp, write_node, write_pack

ROOT = Path(__file__).resolve().parents[1]
SERVER = ROOT / "Server/S1001/data/config/help/SystemConfig.lua"
CLIENT = ROOT / "web/v2/lang/zh-cn/SystemConfig.cbp"
PACK = ROOT / "web/v2/lang/zh-cn/zh-cn.dat"
OTHER_ITEMS = 13
GOLD_BRICK = 83


def other_items(tree):
    rows = [row for row in tree.children if row.child("type").number() == OTHER_ITEMS]
    if len(rows) != 1:
        raise ValueError("Expected one Other Items pickup category")
    row = rows[0]
    if row.child("itemtype").number() != 0:
        raise ValueError("Other Items is not an item-ID pickup category")
    defaults = row.child("selectTypes").child("0")
    if defaults.child("0").number() != 1 or defaults.child("1").number() != 1:
        raise ValueError("Expected pickup and item-name display enabled by default")
    return row


def patch_config(source):
    header, tree = read_cbp(source)
    row = other_items(tree)
    ranges = row.child("idRange").child("0")
    original_payload = write_node(tree)
    hits = [r for r in ranges.children
            if r.child("0").number() <= GOLD_BRICK <= r.child("1").number()]
    if hits:
        if len(hits) != 1:
            raise ValueError("Duplicate gold-brick pickup ranges")
        return source
    if [r.name for r in ranges.children] != [str(i) for i in range(len(ranges.children))]:
        raise ValueError("Non-contiguous pickup range indexes")
    addition = Node(str(len(ranges.children)), 4, children=[
        Node("0", 2, struct.pack("<d", GOLD_BRICK)),
        Node("1", 2, struct.pack("<d", GOLD_BRICK)),
    ])
    ranges.children.append(addition)
    updated = write_cbp(header, tree)
    _, check = read_cbp(updated)
    checked_ranges = other_items(check).child("idRange").child("0")
    checked_ranges.children.pop()
    if write_node(check) != original_payload:
        raise ValueError("Unrelated client pickup settings changed")
    return updated


def patch_server(source):
    start = source.index(b'\t\ttype = 13,')
    line_start = source.index(b'\t\tidRange = ', start)
    line_end = source.index(b'\n', line_start)
    line = source[line_start:line_end]
    if b'{83,83}' in line:
        return source
    marker = b'}}},'
    if line.count(marker) != 1:
        raise ValueError("Unexpected server Other Items range structure")
    updated_line = line.replace(marker, b'},{83,83}}},', 1)
    return source[:line_start] + updated_line + source[line_end:]


def verify(config, pack, server):
    from lupa.lua51 import LuaRuntime
    _, tree = read_cbp(config)
    entries = read_pack(pack)
    matches = [data for name, data in entries if name == CLIENT.name]
    if matches != [config]:
        raise ValueError("Standalone pickup settings and language-pack copy differ")
    lua = LuaRuntime(unpack_returned_tuples=True)
    lua.execute(server.decode("utf-8"))
    server_rows = list(lua.globals().SystemConfig.values())
    if len(server_rows) != len(tree.children):
        raise ValueError("Server/client pickup category counts differ")
    for client_row in tree.children:
        rows = [r for r in server_rows if r.type == client_row.child("type").number()]
        if len(rows) != 1:
            raise ValueError("Missing server pickup category")
        row = rows[0]
        if row.itemtype != client_row.child("itemtype").number():
            raise ValueError("Server/client pickup item types differ")
        for name in ("idRange", "selectTypes"):
            def unpack_lua(value):
                if hasattr(value, "values"):
                    return [unpack_lua(v) for v in value.values()]
                return value
            def unpack_cbp(node):
                return ([unpack_cbp(c) for c in node.children]
                        if node.kind == 4 else node.number())
            if unpack_lua(row[name]) != unpack_cbp(client_row.child(name)):
                raise ValueError(f"Server/client pickup {name} differ")
    ranges = other_items(tree).child("idRange").child("0")
    if not any(r.child("0").number() <= GOLD_BRICK <= r.child("1").number()
               for r in ranges.children):
        raise ValueError("Gold brick is still excluded from auto-pickup")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--lua-path", type=Path)
    parser.add_argument("--verify-only", action="store_true")
    args = parser.parse_args()
    if args.lua_path:
        import sys
        sys.path.insert(0, str(args.lua_path))
    server, client, pack = SERVER.read_bytes(), CLIENT.read_bytes(), PACK.read_bytes()
    if args.verify_only:
        verify(client, pack, server)
        print("Verified gold-brick auto-pickup, defaults, and all server/client pickup ranges")
        return
    entries = read_pack(pack)
    if write_pack(entries) != pack:
        raise ValueError("Language pack did not round-trip")
    indices = [i for i, (name, _) in enumerate(entries) if name == CLIENT.name]
    if len(indices) != 1 or entries[indices[0]][1] != client:
        raise ValueError("Packed pickup settings differ before patching")
    updated_client = patch_config(client)
    updated_server = patch_server(server)
    entries[indices[0]] = (CLIENT.name, updated_client)
    updated_pack = write_pack(entries)
    before = read_pack(pack)
    after = read_pack(updated_pack)
    if [(n, b) for n, b in before if n != CLIENT.name] != [
            (n, b) for n, b in after if n != CLIENT.name]:
        raise ValueError("Unrelated packed resources changed")
    verify(updated_client, updated_pack, updated_server)
    SERVER.write_bytes(updated_server)
    CLIENT.write_bytes(updated_client)
    PACK.write_bytes(updated_pack)
    print("Added gold brick 83 to Other Items; server, standalone client, and pack verified")


if __name__ == "__main__":
    main()
