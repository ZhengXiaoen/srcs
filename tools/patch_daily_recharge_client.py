"""Sync the client million-yuanbao daily reward with the server config.

The client reads EveryDayPayGiftCfg.cbp from zh-cn.dat; the standalone CBP is
kept identical to the packed copy. Only the seven million-tier rewards change:
50 talisman fragments (item 536) become 10 holy pearl crystals (item 574).
"""

from __future__ import annotations

import hashlib
import struct
import zlib
from pathlib import Path

from patch_guild_quest_config import Node


CLIENT_SHA256 = "0d783ac46a611fd090751fa846dae616a3a1d4d21685ac9af67c9fa56fc62db8"
PACK_SHA256 = "a96f5eff690617a4c28c81f5bde5c162bd198a24e666706711070e695804fae2"
CBP_HEADER_SIZE = 64
CONFIG_NAME = "EveryDayPayGiftCfg.cbp"
MILLION_GROUPS = {"0", "1", "2", "3", "4", "5", "7"}


def read_node(data: bytes, pos: int) -> tuple[Node, int]:
    if pos + 2 > len(data):
        raise ValueError("Truncated CBP node")
    name_size, kind = data[pos], data[pos + 1]
    pos += 2
    if kind == 2:
        value = data[pos : pos + 8]
        pos += 8
        count = 0
        name = data[pos : pos + name_size].decode("utf-8")
        pos += name_size
    elif kind == 3:
        size = struct.unpack_from("<Q", data, pos)[0]
        pos += 8
        name = data[pos : pos + name_size].decode("utf-8")
        pos += name_size
        value = data[pos : pos + size]
        pos += size
        count = 0
    elif kind == 4:
        count = struct.unpack_from("<Q", data, pos)[0]
        pos += 8
        name = data[pos : pos + name_size].decode("utf-8")
        pos += name_size
        value = b""
    else:
        raise ValueError(f"Unsupported CBP node type: {kind}")
    if pos > len(data):
        raise ValueError("Truncated CBP value")
    children = []
    for _ in range(count):
        child, pos = read_node(data, pos)
        children.append(child)
    return Node(name, kind, value, children), pos


def write_node(node: Node) -> bytes:
    name = node.name.encode("utf-8")
    if len(name) > 255:
        raise ValueError("CBP node name is too long")
    prefix = bytes((len(name), node.kind))
    if node.kind == 2:
        return prefix + node.value + name
    if node.kind == 3:
        return prefix + struct.pack("<Q", len(node.value)) + name + node.value
    if node.kind == 4:
        return (
            prefix
            + struct.pack("<Q", len(node.children))
            + name
            + b"".join(write_node(child) for child in node.children)
        )
    raise ValueError(f"Unsupported CBP node type: {node.kind}")


def read_cbp(source: bytes) -> tuple[bytes, Node]:
    if len(source) < CBP_HEADER_SIZE or source[:4] != b"CBP\0":
        raise ValueError("Invalid CBP header")
    size, compressed_size = struct.unpack_from("<II", source, 8)
    if len(source) != CBP_HEADER_SIZE + compressed_size:
        raise ValueError("Invalid CBP size")
    data = zlib.decompress(source[CBP_HEADER_SIZE:])
    if len(data) != size:
        raise ValueError("Invalid CBP payload size")
    root, end = read_node(data, 0)
    if end != len(data) or write_node(root) != data:
        raise ValueError("CBP did not round-trip")
    return source[:CBP_HEADER_SIZE], root


def write_cbp(header: bytes, root: Node) -> bytes:
    data = write_node(root)
    compressed = zlib.compress(data, level=9)
    result = bytearray(header)
    struct.pack_into("<II", result, 8, len(data), len(compressed))
    return bytes(result) + compressed


def read_pack(source: bytes) -> list[tuple[str, bytes]]:
    if len(source) < 4:
        raise ValueError("Truncated language pack")
    count = struct.unpack_from("<I", source, 0)[0]
    pos = 4
    entries = []
    for _ in range(count):
        name_size = source[pos]
        pos += 1
        name = source[pos : pos + name_size].decode("utf-8")
        pos += name_size
        size = struct.unpack_from("<I", source, pos)[0]
        pos += 4
        value = source[pos : pos + size]
        pos += size
        entries.append((name, value))
    if pos != len(source):
        raise ValueError("Language pack has trailing data")
    return entries


def write_pack(entries: list[tuple[str, bytes]]) -> bytes:
    result = bytearray(struct.pack("<I", len(entries)))
    for name, value in entries:
        encoded = name.encode("utf-8")
        if len(encoded) > 255:
            raise ValueError("Language pack entry name is too long")
        result += bytes((len(encoded),)) + encoded
        result += struct.pack("<I", len(value)) + value
    return bytes(result)


def patch_rewards(root: Node) -> None:
    changed_groups = set()
    for group in root.children:
        million_tiers = [
            tier for tier in group.children
            if tier.child("needPayMoney").number() == 1_000_000
        ]
        if not million_tiers:
            continue
        if len(million_tiers) != 1 or group.name not in MILLION_GROUPS:
            raise ValueError(f"Unexpected million-tier group: {group.name}")
        awards = million_tiers[0].child("award").children
        if len(awards) != 7:
            raise ValueError("Unexpected million-tier award count")
        fragment, gem = awards[2], awards[3]
        if (
            fragment.child("type").number(),
            fragment.child("id").number(),
            fragment.child("count").number(),
            gem.child("id").number(),
            gem.child("count").number(),
        ) != (0, 536, 50, 539, 10):
            raise ValueError(f"Unexpected million-tier rewards in group {group.name}")
        fragment.child("id").set_number(574)
        fragment.child("count").set_number(10)
        changed_groups.add(group.name)
    if changed_groups != MILLION_GROUPS:
        raise ValueError(f"Missing million-tier groups: {MILLION_GROUPS - changed_groups}")


def main() -> None:
    root_dir = Path(__file__).resolve().parents[1]
    client_path = root_dir / "web/v2/lang/zh-cn" / CONFIG_NAME
    pack_path = root_dir / "web/v2/lang/zh-cn/zh-cn.dat"
    client = client_path.read_bytes()
    pack = pack_path.read_bytes()
    if hashlib.sha256(client).hexdigest() != CLIENT_SHA256:
        raise ValueError("Client CBP differs from the expected version")
    if hashlib.sha256(pack).hexdigest() != PACK_SHA256:
        raise ValueError("Language pack differs from the expected version")

    entries = read_pack(pack)
    if write_pack(entries) != pack:
        raise ValueError("Language pack did not round-trip")
    indices = [index for index, (name, _) in enumerate(entries) if name == CONFIG_NAME]
    if len(indices) != 1 or entries[indices[0]][1] != client:
        raise ValueError("Packed and standalone daily-recharge configs differ")

    header, root = read_cbp(client)
    patch_rewards(root)
    patched_client = write_cbp(header, root)
    read_cbp(patched_client)
    entries[indices[0]] = (CONFIG_NAME, patched_client)
    patched_pack = write_pack(entries)
    if read_pack(patched_pack)[indices[0]][1] != patched_client:
        raise ValueError("Patched language pack is inconsistent")

    client_path.write_bytes(patched_client)
    pack_path.write_bytes(patched_pack)
    print(f"Updated seven million-tier client rewards in {client_path} and {pack_path}")


if __name__ == "__main__":
    main()
