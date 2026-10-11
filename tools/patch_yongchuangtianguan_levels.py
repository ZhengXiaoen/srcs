"""Apply the Tongtian Tower HP-based level curve to Tian Guan bosses."""

from __future__ import annotations

import argparse
import re

from patch_tongtianta_levels import (
    CLIENT_MONSTERS, CLIENT_PACK, SCENE_NAMES, SERVER_MONSTERS,
    update_client, update_pack,
)


FIRST_ID = 837
LAST_ID = 866
MIN_HP = 960_000
MAX_HP = 72_000_000
MIN_LEVEL = 80
MAX_LEVEL = 200


def level_for_hp(hp: int) -> int:
    if not MIN_HP <= hp <= MAX_HP:
        raise ValueError(f"Boss HP is outside the intended scale: {hp}")
    span = MAX_HP - MIN_HP
    return MIN_LEVEL + ((hp - MIN_HP) * (MAX_LEVEL - MIN_LEVEL) + span // 2) // span


def update_server(source: bytes) -> tuple[bytes, dict[int, int]]:
    levels = {}
    hit_points = {}

    def replace(match: re.Match[bytes]) -> bytes:
        entity_id = int(match.group(1))
        if not FIRST_ID <= entity_id <= LAST_ID:
            return match.group(0)
        block = match.group(0)
        hp_matches = list(re.finditer(rb"(?m)^        nMaxHp=(\d+),\r?$", block))
        level_matches = list(re.finditer(rb"(?m)^        level=(\d+),\r?$", block))
        if len(hp_matches) != 1 or len(level_matches) != 1 or entity_id in levels:
            raise ValueError(f"Invalid server boss entry {entity_id}")
        hit_points[entity_id] = int(hp_matches[0].group(1))
        levels[entity_id] = level_for_hp(hit_points[entity_id])
        level_match = level_matches[0]
        return (
            block[:level_match.start(1)]
            + str(levels[entity_id]).encode("ascii")
            + block[level_match.end(1):]
        )

    pattern = rb"(?ms)^        entityid=(\d+),\r?\n.*?(?=^        entityid=|\Z)"
    updated = re.sub(pattern, replace, source)
    if set(levels) != set(range(FIRST_ID, LAST_ID + 1)):
        raise ValueError("Expected exactly 30 Tian Guan bosses")
    if hit_points[FIRST_ID] != MIN_HP or hit_points[LAST_ID] != MAX_HP:
        raise ValueError("Boss HP endpoints do not match the intended scale")
    if any(levels[i] >= levels[i + 1] for i in range(FIRST_ID, LAST_ID)):
        raise ValueError("Boss levels must increase with HP")
    return updated, levels


def update_scene_names(source: bytes, levels: dict[int, int]) -> bytes:
    found = set()

    def replace(match: re.Match[bytes]) -> bytes:
        entity_id = int(match.group(1))
        if entity_id not in levels:
            return match.group(0)
        if entity_id in found:
            raise ValueError(f"Duplicate scene name {entity_id}")
        found.add(entity_id)
        start = match.start(2) - match.start()
        end = match.end(2) - match.start()
        return match.group(0)[:start] + str(levels[entity_id]).encode("ascii") + match.group(0)[end:]

    pattern = rb'(?m)^mon0*(\d+) = "[^"\r\n]*?\(Lv(\d+)\)"[^\r\n]*'
    updated = re.sub(pattern, replace, source)
    if found != set(levels):
        raise ValueError("Missing Tian Guan scene labels")
    return updated


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--sync-client", action="store_true", help="Also sync the client Boss level display")
    args = parser.parse_args()
    server, levels = update_server(SERVER_MONSTERS.read_bytes())
    names = update_scene_names(SCENE_NAMES.read_bytes(), levels)
    updates = [(SERVER_MONSTERS, server), (SCENE_NAMES, names)]
    if args.sync_client:
        original_client = CLIENT_MONSTERS.read_bytes()
        client = update_client(original_client, levels)
        pack = update_pack(CLIENT_PACK.read_bytes(), original_client, client)
        updates.extend(((CLIENT_MONSTERS, client), (CLIENT_PACK, pack)))
    for path, value in updates:
        path.write_bytes(value)
    print("Tian Guan Boss levels:", ", ".join(f"{i - FIRST_ID + 1}:{levels[i]}" for i in sorted(levels)))


if __name__ == "__main__":
    main()
