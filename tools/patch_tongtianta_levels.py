"""Sync Tongtian Tower guardian levels with their server HP and client pack."""

from __future__ import annotations

import re
from pathlib import Path

from patch_guild_quest_config import read_cbp, read_pack, write_cbp, write_pack


ROOT = Path(__file__).resolve().parents[1]
SERVER_MONSTERS = ROOT / "Server/S1001/data/config/monster/StdMonster.txt"
SCENE_NAMES = ROOT / "Server/S1001/data/language/Zh-CN/SceneName.lua"
CLIENT_DIR = ROOT / "web/v2/lang/zh-cn"
CLIENT_MONSTERS = CLIENT_DIR / "monster.cbp"
CLIENT_PACK = CLIENT_DIR / "zh-cn.dat"
FIRST_ID = 1361
LAST_ID = 1390
MIN_HP = 1_440_000
MAX_HP = 108_000_000
MIN_LEVEL = 80
MAX_LEVEL = 200


def level_for_hp(hp: int) -> int:
    span = MAX_HP - MIN_HP
    return min(MAX_LEVEL, MIN_LEVEL + ((hp - MIN_HP) * (MAX_LEVEL - MIN_LEVEL) + span // 2) // span)


def update_server(source: bytes) -> tuple[bytes, dict[int, int]]:
    starts = list(re.finditer(rb"(?m)^        entityid=(\d+),\r?$", source))
    parts = []
    levels = {}
    previous_end = 0
    for index, match in enumerate(starts):
        entity_id = int(match.group(1))
        if not FIRST_ID <= entity_id <= LAST_ID:
            continue
        end = starts[index + 1].start() if index + 1 < len(starts) else len(source)
        block = source[match.start():end]
        hp_match = re.search(rb"(?m)^        nMaxHp=(\d+),\r?$", block)
        level_match = re.search(rb"(?m)^        level=(\d+),\r?$", block)
        if hp_match is None or level_match is None or entity_id in levels:
            raise ValueError(f"Invalid server monster entry {entity_id}")
        level = level_for_hp(int(hp_match.group(1)))
        levels[entity_id] = level
        parts.extend((source[previous_end:match.start()], block[:level_match.start(1)], str(level).encode("ascii"), block[level_match.end(1):]))
        previous_end = end
    parts.append(source[previous_end:])
    if set(levels) != set(range(FIRST_ID, LAST_ID + 1)):
        raise ValueError("Expected exactly 30 tower guardians")
    if levels[FIRST_ID] != MIN_LEVEL or levels[LAST_ID] != MAX_LEVEL:
        raise ValueError("Tower HP endpoints do not match the intended scale")
    if any(levels[i] >= levels[i + 1] for i in range(FIRST_ID, LAST_ID)):
        raise ValueError("Tower levels must increase with HP")
    return b"".join(parts), levels


def update_scene_names(source: bytes, levels: dict[int, int]) -> bytes:
    found = set()

    def replace(match: re.Match[bytes]) -> bytes:
        entity_id = int(match.group(1))
        if entity_id in found:
            raise ValueError(f"Duplicate scene name {entity_id}")
        found.add(entity_id)
        return match.group(0).replace(match.group(2), f"Lv{levels[entity_id]}".encode("ascii"), 1)

    pattern = rb"(?m)^mon00(1(?:36[1-9]|3[7-8]\d|390)) = \"[^\"\r\n]*?(Lv\d+)\)\"[^\r\n]*"
    updated = re.sub(pattern, replace, source)
    if found != set(levels):
        raise ValueError("Missing tower scene labels")
    return updated


def update_client(source: bytes, levels: dict[int, int]) -> bytes:
    header, root = read_cbp(source)
    found = set()
    for monster in root.children:
        entity_id = int(monster.child("entityid").number())
        if entity_id in levels:
            if entity_id in found:
                raise ValueError(f"Duplicate client monster {entity_id}")
            found.add(entity_id)
            monster.child("level").set_number(levels[entity_id])
    if found != set(levels):
        raise ValueError("Missing client tower guardians")
    updated = write_cbp(header, root)
    if read_cbp(updated)[1] != root:
        raise ValueError("Client monster config failed round-trip")
    return updated


def update_pack(source: bytes, original_monsters: bytes, updated_monsters: bytes) -> bytes:
    entries = read_pack(source)
    if write_pack(entries) != source:
        raise ValueError("Client pack failed round-trip")
    indices = [index for index, (name, _) in enumerate(entries) if name == "monster.cbp"]
    if len(indices) != 1 or entries[indices[0]][1] != original_monsters:
        raise ValueError("Packed monster config differs from the standalone file")
    entries[indices[0]] = ("monster.cbp", updated_monsters)
    updated = write_pack(entries)
    if read_pack(updated) != entries:
        raise ValueError("Updated client pack failed round-trip")
    return updated


def main() -> None:
    server, levels = update_server(SERVER_MONSTERS.read_bytes())
    names = update_scene_names(SCENE_NAMES.read_bytes(), levels)
    original_client = CLIENT_MONSTERS.read_bytes()
    client = update_client(original_client, levels)
    pack = update_pack(CLIENT_PACK.read_bytes(), original_client, client)
    SERVER_MONSTERS.write_bytes(server)
    SCENE_NAMES.write_bytes(names)
    CLIENT_MONSTERS.write_bytes(client)
    CLIENT_PACK.write_bytes(pack)
    print("Tower guardian levels:", ", ".join(f"{i - FIRST_ID + 1}:{levels[i]}" for i in sorted(levels)))


if __name__ == "__main__":
    main()
