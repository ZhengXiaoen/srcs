"""Multiply daily God Soul exchange rewards in server and client configs by ten."""

from __future__ import annotations

import re
from pathlib import Path

from patch_daily_recharge_client import (
    read_cbp,
    read_pack,
    write_cbp,
    write_pack,
)


OLD_VALUES = (10, 12, 15, 20, 26, 38, 3, 6, 10, 15, 20, 25, 50, 40, 100, 80, 200, 150, 108, 5, 20)
CONFIG_NAME = "godSoulCfg.cbp"


def main() -> None:
    root_dir = Path(__file__).resolve().parents[1]
    server_path = root_dir / "Server/S1001/data/config/GodSoulCfg.lua"
    client_path = root_dir / "web/v2/lang/zh-cn" / CONFIG_NAME
    pack_path = client_path.parent / "zh-cn.dat"

    server = server_path.read_bytes()
    marker = b"    ExChange ="
    if server.count(marker) != 1:
        raise ValueError("Expected one daily exchange section")
    prefix, exchange = server.split(marker, 1)
    pattern = rb"(\bValue\s*=\s*)(\d+)(\s*,)"
    found = tuple(int(match.group(2)) for match in re.finditer(pattern, exchange))
    if found != OLD_VALUES:
        raise ValueError(f"Unexpected server reward values: {found}")
    values = iter(OLD_VALUES)
    patched_exchange = re.sub(
        pattern,
        lambda match: match.group(1) + str(next(values) * 10).encode("ascii") + match.group(3),
        exchange,
    )
    patched_server = prefix + marker + patched_exchange

    client = client_path.read_bytes()
    header, root = read_cbp(client)
    entries = root.child("ExChange").children
    if len(entries) != len(OLD_VALUES):
        raise ValueError("Unexpected client exchange count")
    for index, (entry, old_value) in enumerate(zip(entries, OLD_VALUES)):
        if entry.name != str(index) or entry.child("Value").number() != old_value:
            raise ValueError(f"Unexpected client reward at index {index}")
        entry.child("Value").set_number(old_value * 10)
    patched_client = write_cbp(header, root)
    read_cbp(patched_client)

    pack = pack_path.read_bytes()
    packed_entries = read_pack(pack)
    indices = [index for index, (name, _) in enumerate(packed_entries) if name == CONFIG_NAME]
    if len(indices) != 1 or packed_entries[indices[0]][1] != client:
        raise ValueError("Packed and standalone God Soul configs differ")
    packed_entries[indices[0]] = (CONFIG_NAME, patched_client)
    patched_pack = write_pack(packed_entries)
    if read_pack(patched_pack)[indices[0]][1] != patched_client:
        raise ValueError("Patched language pack is inconsistent")

    server_path.write_bytes(patched_server)
    client_path.write_bytes(patched_client)
    pack_path.write_bytes(patched_pack)
    print(f"Updated {len(OLD_VALUES)} daily God Soul rewards in server and client configs")


if __name__ == "__main__":
    main()
