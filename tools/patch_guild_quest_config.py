"""Update the client guild quest config and sync its language-pack copy.

The server uses 1-based quest indexes. The client resource contains 0-based
entries, so index 16 is added for the last ordinary quest. Silver privilege
entries occupy indexes 17 through 32; index 16 is also kept as a valid normal
entry. Only the guild quest config is touched.
"""

from __future__ import annotations

import argparse
import hashlib
import struct
import zlib
from dataclasses import dataclass, field
from pathlib import Path


ORIGINAL_SHA256 = "30371c0fb6b836759f6ac5547c79be73f04e23c172a11168eabfdf05d476c01d"
PREVIOUS_PATCHED_SHA256 = "3e76f381ac905ee68c259739cff43f6cd3d0f0e665111cc44e7eb8c9f2acfb77"
HEADER_SIZE = 64


@dataclass
class Node:
    name: str
    kind: int
    value: bytes = b""
    children: list[Node] = field(default_factory=list)

    def child(self, name: str) -> Node:
        matches = [item for item in self.children if item.name == name]
        if len(matches) != 1:
            raise ValueError(f"Expected one CBP child named {name!r}")
        return matches[0]

    def number(self) -> float:
        if self.kind != 2 or len(self.value) != 8:
            raise ValueError(f"CBP node {self.name!r} is not a number")
        return struct.unpack("<d", self.value)[0]

    def set_number(self, value: int) -> None:
        if self.kind != 2:
            raise ValueError(f"CBP node {self.name!r} is not a number")
        self.value = struct.pack("<d", value)


def read_node(data: bytes, pos: int) -> tuple[Node, int]:
    if pos + 2 > len(data):
        raise ValueError("Truncated CBP node")
    name_size, kind = data[pos], data[pos + 1]
    pos += 2
    if kind == 2:
        value = data[pos : pos + 8]
        pos += 8
        count = 0
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
        value = b""
    else:
        raise ValueError(f"Unsupported CBP node type {kind}")
    if kind != 3:
        name = data[pos : pos + name_size].decode("utf-8")
        pos += name_size
    children = []
    for _ in range(count):
        child, pos = read_node(data, pos)
        children.append(child)
    return Node(name, kind, value, children), pos


def write_node(node: Node) -> bytes:
    name = node.name.encode("utf-8")
    if len(name) > 255:
        raise ValueError("CBP key is too long")
    if node.kind == 2:
        return bytes((len(name), node.kind)) + node.value + name
    elif node.kind == 3:
        return bytes((len(name), node.kind)) + struct.pack("<Q", len(node.value)) + name + node.value
    elif node.kind == 4:
        return (bytes((len(name), node.kind)) + struct.pack("<Q", len(node.children))
                + name + b"".join(write_node(child) for child in node.children))
    else:
        raise ValueError(f"Unsupported CBP node type {node.kind}")


def read_cbp(source: bytes) -> tuple[bytes, Node]:
    if len(source) < HEADER_SIZE or source[:4] != b"CBP\0":
        raise ValueError("Invalid CBP header")
    size, compressed_size = struct.unpack_from("<II", source, 8)
    if len(source) != HEADER_SIZE + compressed_size:
        raise ValueError("Invalid compressed CBP size")
    data = zlib.decompress(source[HEADER_SIZE:])
    if len(data) != size:
        raise ValueError("Invalid decompressed CBP size")
    root, end = read_node(data, 0)
    if end != len(data) or write_node(root) != data:
        raise ValueError("CBP payload did not round-trip")
    return source[:HEADER_SIZE], root


def write_cbp(header: bytes, root: Node) -> bytes:
    data = write_node(root)
    compressed = zlib.compress(data, level=9)
    result = bytearray(header)
    struct.pack_into("<II", result, 8, len(data), len(compressed))
    return bytes(result) + compressed


def clone(node: Node, name: str) -> Node:
    return Node(name, node.kind, node.value, [clone(child, child.name) for child in node.children])


def set_quest(entry: Node, *, flag: int, spirit: int) -> None:
    if entry.child("monsterNum").number() not in (20, 25, 30):
        raise ValueError("Unexpected original monster count")
    if entry.child("zhanLiZhi").number() != 1000:
        raise ValueError("Unexpected original flag reward")
    if entry.child("lingLi").number() != 300:
        raise ValueError("Unexpected original spirit reward")
    entry.child("monsterNum").set_number(20)
    entry.child("zhanLiZhi").set_number(flag)
    entry.child("lingLi").set_number(spirit)


def patch(source: bytes) -> bytes:
    source_hash = hashlib.sha256(source).hexdigest()
    if source_hash not in (ORIGINAL_SHA256, PREVIOUS_PATCHED_SHA256):
        raise ValueError("Guild quest CBP differs from the expected versions")
    header, root = read_cbp(source)
    config = root.child("ForClient")
    if source_hash == PREVIOUS_PATCHED_SHA256:
        if config.kind != 4 or len(config.children) != 33:
            raise ValueError("Expected 33 previously patched guild quest entries")
        for entry in config.children:
            if entry.child("monsterNum").number() != 1:
                raise ValueError("Unexpected previously patched monster count")
            entry.child("monsterNum").set_number(20)
        return write_cbp(header, root)
    if config.kind != 4 or len(config.children) != 16:
        raise ValueError("Expected 16 original guild quest entries")
    originals = [config.child(str(index)) for index in range(16)]
    for index, entry in enumerate(originals):
        if entry.name != str(index):
            raise ValueError("Guild quest entries are out of order")

    # The server transmits indexes 1..16; add normal index 16 for completeness.
    config.children.append(clone(originals[15], "16"))
    # Silver privilege uses client indexes 17..32, leaving server indexes intact.
    for index in range(1, 17):
        source_entry = originals[min(index, 15)]
        vip_entry = clone(source_entry, str(index + 16))
        set_quest(vip_entry, flag=400000, spirit=8000)
        config.children.append(vip_entry)
    for entry in config.children[:17]:
        set_quest(entry, flag=250000, spirit=5000)
    return write_cbp(header, root)


def read_pack(source: bytes) -> list[tuple[str, bytes]]:
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
        entries.append((name, source[pos : pos + size]))
        pos += size
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


def sync_pack(source: bytes, pack: bytes) -> bytes:
    """Replace only the guild quest entry in the packed language resources."""
    _, root = read_cbp(source)
    config = root.child("ForClient")
    if [entry.name for entry in config.children] != [str(i) for i in range(33)]:
        raise ValueError("Expected 33 guild quest entries")
    entries = read_pack(pack)
    if write_pack(entries) != pack:
        raise ValueError("Language pack did not round-trip")
    matches = [i for i, (name, _) in enumerate(entries) if name == "guildxiangyaochumocfg.cbp"]
    if len(matches) != 1:
        raise ValueError("Expected one packed guild quest config")
    old = entries[matches[0]][1]
    read_cbp(old)
    if old == source:
        return pack
    entries[matches[0]] = (entries[matches[0]][0], source)
    return write_pack(entries)


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("source", type=Path)
    parser.add_argument("output", type=Path)
    parser.add_argument("--sync-pack", action="store_true", help="Sync an already patched CBP into zh-cn.dat")
    args = parser.parse_args()
    if args.source.resolve() == args.output.resolve():
        parser.error("Use separate input and output paths")
    if args.sync_pack:
        patched = sync_pack(args.source.read_bytes(), args.output.read_bytes())
    else:
        patched = patch(args.source.read_bytes())
    args.output.write_bytes(patched)
    print(f"Wrote {args.output} ({len(patched)} bytes)")


if __name__ == "__main__":
    main()
