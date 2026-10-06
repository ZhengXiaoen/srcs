"""Sync Chiyou wing equipment sources in the client and packed resource."""
from pathlib import Path
import re

from patch_guild_quest_config import read_cbp, write_cbp
from patch_daily_recharge_client import read_pack, write_pack


ROOT = Path(__file__).resolve().parents[1]
ITEMS = (6983, 6988, 6993, 6998)
CONFIG = "stditems4.cbp"


def patch_descriptions(source, language):
    header, root = read_cbp(source)
    found = set()
    for node in root.children:
        item = int(node.child("id").number())
        if item in ITEMS:
            match = re.search(rf'i{item}="([^"\r\n]+)"', language)
            if match is None:
                raise ValueError(f"Missing server description: {item}")
            desc = match[1].replace("\\\\", "\\")
            if "【蚩尤地宫BOSS掉落】" not in desc:
                raise ValueError(f"Missing Chiyou source: {item}")
            node.child("desc").value = desc.encode("utf-8")
            found.add(item)
    if found != set(ITEMS):
        raise ValueError(f"Unexpected client wing items: {found}")
    return write_cbp(header, root)


def main():
    client = ROOT / "web/v2/lang/zh-cn"
    path = client / CONFIG
    pack_path = client / "zh-cn.dat"
    language = (ROOT / "Server/S1001/data/language/Zh-CN/Item.lua").read_text("utf-8-sig")
    source = path.read_bytes()
    entries = read_pack(pack_path.read_bytes())
    matches = [value for name, value in entries if name == CONFIG]
    if matches != [source]:
        raise ValueError("Standalone and packed item configs differ")
    result = patch_descriptions(source, language)
    if read_cbp(result)[1] == read_cbp(source)[1]:
        print("Chiyou wing descriptions already synchronized")
        return
    entries = [(name, result if name == CONFIG else value) for name, value in entries]
    packed = write_pack(entries)
    if read_pack(packed) != entries:
        raise ValueError("Language pack did not round-trip")
    path.write_bytes(result)
    pack_path.write_bytes(packed)
    print("Synchronized four wing descriptions; other packed resources preserved")


if __name__ == "__main__":
    main()
