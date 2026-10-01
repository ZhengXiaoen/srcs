"""Set every configured skill upgrade proficiency requirement to 10.

Change only condition 21 inside trainConds for levels above the first learned
level. Disabled conditions, learning requirements, damage, mana, skill books,
maximum levels and other conditions are preserved. Sync the standalone client
configuration and its language-pack copy, auditing every unrelated field.
"""
from __future__ import annotations

import argparse
from pathlib import Path
import re

from patch_guild_quest_config import read_cbp, read_pack, write_cbp, write_node, write_pack

ROOT = Path(__file__).resolve().parents[1]
SKILLS = ROOT / "Server/S1001/data/config/skill"
CLIENT = ROOT / "web/v2/lang/zh-cn/skillconfig.cbp"
PACK = CLIENT.parent / "zh-cn.dat"
VALUE = 10
CONDITION = re.compile(rb"(\bcond\s*=\s*21\s*,\s*value\s*=\s*)(\d+)")
LEVEL_FILE = re.compile(r"Skill_(\d+)_(\d+)\.lua")


def upgrade_spans(source):
    # Retain offsets and line endings while hiding line comments from matching.
    active = b"".join(line.split(b"--", 1)[0].ljust(len(line), b" ")
                      for line in source.splitlines(keepends=True))
    spans = []
    for match in re.finditer(rb"\btrainConds\s*=\s*\{", active):
        start, end, depth = match.end(), match.end(), 1
        while depth and end < len(active):
            depth += (active[end] == 123) - (active[end] == 125)
            end += 1
        if depth:
            raise ValueError("Unclosed skill trainConds")
        for cond in CONDITION.finditer(active, start, end):
            spans.append(cond.span(2))
    return spans


def patch_server(source):
    output = bytearray(source)
    for start, end in reversed(upgrade_spans(source)):
        output[start:end] = str(VALUE).encode()
    return bytes(output)


def client_requirements(tree):
    output = {}
    for skill in tree.children:
        skill_id = int(skill.child("id").number())
        for level in skill.child("skillSubLevel").children:
            for cond in level.child("trainConds").children:
                if cond.child("cond").number() == 21:
                    key = (skill_id, int(level.name) + 1)
                    if key in output:
                        raise ValueError("Duplicate skill proficiency requirement")
                    output[key] = cond.child("value").number()
    return output


def patch_client(source):
    header, tree = read_cbp(source)
    original = write_node(tree)
    old_values = []
    for skill in tree.children:
        for level in skill.child("skillSubLevel").children:
            if int(level.name) == 0:
                continue
            for cond in level.child("trainConds").children:
                if cond.child("cond").number() == 21:
                    node = cond.child("value")
                    old_values.append((node, node.value))
                    node.set_number(VALUE)
    result = write_cbp(header, tree)
    for node, value in old_values:
        node.value = value
    if write_node(tree) != original:
        raise ValueError("Unrelated skill configuration changed")
    if result == source or all(value == VALUE for (skill, level), value
                               in client_requirements(read_cbp(source)[1]).items() if level > 1):
        return source
    return result


def server_requirements():
    from lupa.lua51 import LuaRuntime

    def expand(path):
        source = path.read_bytes().removeprefix(b"\xef\xbb\xbf")
        # Two legacy, unused display strings use smart quotes accepted by the
        # server's extended Lua parser. Normalize only this verification copy.
        source = re.sub(rb'desc\s*=\s*\xa1\xb0\xa1\xb1', b'desc=""', source)

        def include(match):
            relative = match[1].decode().replace("\\", "/")
            return b"" if relative.endswith("LangCode.txt") else expand(path.parent / relative)

        return re.sub(rb'(?m)^\s*--#include\s+"([^"]+)"[^\r\n]*', include, source)

    lua = LuaRuntime(encoding=None)
    lua.execute(b'Lang={Skill=setmetatable({}, {__index=function()return "language"end})}')
    lua.execute(expand(SKILLS / "SkillConfig.txt"))
    skills = lua.globals()[b"SkillConfig"]
    result = {}
    for _, skill in skills.items():
        for level, sub in skill[b"skillSubLevel"].items():
            for _, cond in sub[b"trainConds"].items():
                if cond[b"cond"] == 21:
                    key = (skill[b"id"], level)
                    if key in result:
                        raise ValueError("Duplicate server skill proficiency condition")
                    result[key] = cond[b"value"]
    return len(skills), result


def verify():
    client = CLIENT.read_bytes()
    matches = [data for name, data in read_pack(PACK.read_bytes()) if name == CLIENT.name]
    if matches != [client]:
        raise ValueError("Standalone and packed skill configs differ")
    _, tree = read_cbp(client)
    skill_count, server = server_requirements()
    actual = client_requirements(tree)
    if server != actual or skill_count != len(tree.children):
        raise ValueError("Server/client skill IDs, levels or proficiency requirements differ")
    upgrades = {key: value for key, value in server.items() if key[1] > 1}
    if not upgrades or any(value != VALUE for value in upgrades.values()):
        raise ValueError("An active upgrade proficiency requirement is not 10")
    source_count = 0
    for path in SKILLS.joinpath("skillData").glob("Skill_*.lua"):
        match = LEVEL_FILE.fullmatch(path.name)
        if match and int(match[2]) > 1:
            source = path.read_bytes()
            spans = upgrade_spans(source)
            if any(int(source[a:b]) != VALUE for a, b in spans):
                raise ValueError(f"Skill source still has an old requirement: {path.name}")
            source_count += len(spans)
    print(f"Verified {len(upgrades)} active upgrade requirements for "
          f"{len({key[0] for key in upgrades})} skills, {source_count} source conditions; "
          f"all {skill_count} server/client skill IDs and levels match")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--verify-only", action="store_true")
    parser.add_argument("--lua-path", type=Path)
    args = parser.parse_args()
    if args.lua_path:
        import sys
        sys.path.insert(0, str(args.lua_path))
    if args.verify_only:
        verify()
        return

    client, pack = CLIENT.read_bytes(), PACK.read_bytes()
    entries = read_pack(pack)
    if write_pack(entries) != pack:
        raise ValueError("Language pack does not round-trip")
    positions = [i for i, (name, _) in enumerate(entries) if name == CLIENT.name]
    if len(positions) != 1 or entries[positions[0]][1] != client:
        raise ValueError("Packed skill config differs before editing")
    skill_count, server = server_requirements()
    _, tree = read_cbp(client)
    if server != client_requirements(tree) or skill_count != len(tree.children):
        raise ValueError("Server/client skill requirements differ before editing")
    edits = []
    for path in sorted(SKILLS.joinpath("skillData").glob("Skill_*.lua")):
        match = LEVEL_FILE.fullmatch(path.name)
        if match and int(match[2]) > 1:
            source = path.read_bytes()
            updated = patch_server(source)
            if updated != source:
                edits.append((path, updated))
    updated_client = patch_client(client)
    entries[positions[0]] = (CLIENT.name, updated_client)
    updated_pack = write_pack(entries)
    if [(n, b) for n, b in read_pack(updated_pack) if n != CLIENT.name] != [
            (n, b) for n, b in read_pack(pack) if n != CLIENT.name]:
        raise ValueError("Unrelated packed resources changed")
    for path, data in edits:
        path.write_bytes(data)
    if updated_client != client:
        CLIENT.write_bytes(updated_client)
        PACK.write_bytes(updated_pack)
    verify()
    print(f"Updated {len(edits)} skill level source files and synchronized the client pack")


if __name__ == "__main__":
    main()
