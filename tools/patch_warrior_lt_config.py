"""Sync the 250-level warrior exercise limit into both client resources."""

from __future__ import annotations

import hashlib
from pathlib import Path

from patch_daily_recharge_client import read_cbp, read_pack, write_cbp, write_pack


EXPECTED_CBP_SHA256 = "d5b8b304f199345e11c86c0d6ff0b7cf1d3d9a2f473cbd8dd9d1b8af9eec3c20"
EXPECTED_PACK_SHA256 = "d22a07f2c4fce67b31eb2800917e18d8f63c6fe949998952e3f606a18dae3538"
CONFIG_NAME = "heroExerciseCfg.cbp"


def main() -> None:
    root_dir = Path(__file__).resolve().parents[1]
    config_path = root_dir / "web/v2/lang/zh-cn" / CONFIG_NAME
    pack_path = root_dir / "web/v2/lang/zh-cn/zh-cn.dat"
    config = config_path.read_bytes()
    pack = pack_path.read_bytes()
    if hashlib.sha256(config).hexdigest() != EXPECTED_CBP_SHA256:
        raise ValueError("Client exercise config differs from the inspected version")
    if hashlib.sha256(pack).hexdigest() != EXPECTED_PACK_SHA256:
        raise ValueError("Language pack differs from the inspected version")

    header, root = read_cbp(config)
    if root.child("maxlev").number() != 200:
        raise ValueError("Expected the client level limit to be 200")
    root.child("maxlev").set_number(250)
    updated = write_cbp(header, root)
    if read_cbp(updated)[1].child("maxlev").number() != 250:
        raise ValueError("Updated exercise config failed verification")

    entries = read_pack(pack)
    if write_pack(entries) != pack:
        raise ValueError("Language pack did not round-trip")
    indices = [index for index, (name, _) in enumerate(entries) if name == CONFIG_NAME]
    if len(indices) != 1 or entries[indices[0]][1] != config:
        raise ValueError("Packed exercise config does not match the standalone file")
    entries[indices[0]] = (CONFIG_NAME, updated)
    updated_pack = write_pack(entries)
    if read_pack(updated_pack)[indices[0]][1] != updated:
        raise ValueError("Updated language pack failed verification")

    config_path.write_bytes(updated)
    pack_path.write_bytes(updated_pack)


if __name__ == "__main__":
    main()
