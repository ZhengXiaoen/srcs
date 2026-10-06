"""Rebalance warrior exercise growth and its existing client attribute display."""

from pathlib import Path
import re
import zlib

from patch_bag_client import ABCReader, encode_u30
from patch_drop_pickup_retry import abc_section
from patch_god_equip_state import inspect_abc


ROOT = Path(__file__).resolve().parents[1]
SERVER = ROOT / "Server/S1001/data/config/ActorEvent/HeroExerciseCfg.lua"
CLIENT = ROOT / "web/GameFrame.swf"
VIEW = ROOT / "tools/WarriorLTWin.as"
ROW = re.compile(rb"(?m)^.*\{leve\s*=\s*(\d+),.*$")
ATTR = re.compile(rb"(type\s*=\s*(\d+),\s*value\s*=\s*)(\d+)")


def patch_server(source):
    levels = []

    def update_row(match):
        level = int(match[1])
        levels.append(level)
        progress = level - 1
        values = {
            143: 10_000 * progress // 249,
            # Equal linear and quadratic components keep early upgrades useful,
            # then smoothly increase the gain towards the 500,000 cap.
            144: 500 + 499_500 * progress * (249 + progress) // (2 * 249 * 249),
        }
        if level > 200:
            extra = level - 200
            values.update({5: extra * 100_000, **{t: extra * 500 for t in (21, 23, 25, 27)}})
        seen = set()

        def update_attr(attr):
            kind = int(attr[2])
            if kind not in values or kind in seen:
                raise ValueError(f"Unexpected attribute {kind} at level {level}")
            seen.add(kind)
            return attr[1] + str(values[kind]).encode()

        row = ATTR.sub(update_attr, match[0])
        if seen != set(values):
            raise ValueError(f"Missing attributes at level {level}")
        return row

    result = ROW.sub(update_row, source)
    if levels != list(range(1, 251)):
        raise ValueError("Expected all 250 exercise levels in order")
    return result


def display_edits(abc):
    reader = ABCReader(abc)
    reader.skip(4)
    integers = [0]
    for _ in range(reader.u30() - 1):
        integers.append(reader.u30())
    _, traits, bodies = inspect_abc(abc, "WarriorLTWin")
    if traits is None:
        raise ValueError("Missing warrior exercise window")
    start, length, limits = bodies[traits["formatLtAttrs"][0]]
    if limits != (4, 4, 15, 16):
        raise ValueError("Unexpected attribute display method limits")
    # Preserve instruction lengths, pool indexes, branches and debug records.
    replacements = (
        (b"\xd3\x2d" + encode_u30(integers.index(50_000)) + b"\xa2",
         b"\xd3\x2d" + encode_u30(integers.index(100_000)) + b"\xa2", 1),
        (b"\xd3\x24\x64\xa2",
         b"\xd3\x2d" + encode_u30(integers.index(500)) + b"\xa2", 2),
        (b"\xd3\x25\xc8\x01\xa2", b"\xd3\x25\xf4\x03\xa2", 2),
    )
    return start, length, replacements


def patch_swf(source):
    data, (_, _, abc_start, abc_end) = abc_section(source)
    abc = data[abc_start:abc_end]
    start, length, replacements = display_edits(abc)
    old_code = abc[start:start + length]
    code = old_code
    for old, new, count in replacements:
        if len(old) != len(new):
            raise ValueError("Display edit would change instruction length")
        if code.count(new) == count and not code.count(old):
            continue
        if code.count(old) != count or code.count(new):
            raise ValueError("Unexpected warrior attribute display multiplier")
        code = code.replace(old, new)
    if code == old_code:
        return source
    absolute = abc_start + start
    result = data[:absolute] + code + data[absolute + length:]
    inspect_abc(result[abc_start:abc_end], "WarriorLTWin")
    return result[:8] + zlib.compress(result[8:], 9)


def patch_view(source):
    old = b'_loc3_ * 50000 + "<BR>\xe7\x89\xa9\xe9\x98\xb2'
    new = b'_loc3_ * 100000 + "<BR>\xe7\x89\xa9\xe9\x98\xb2'
    if old in source:
        if source.count(old) != 1:
            raise ValueError("Unexpected life display in ActionScript source")
        source = source.replace(old, new)
        for before in (b'_loc3_ * 100 + "-" + _loc3_ * 200',):
            if source.count(before) != 2:
                raise ValueError("Unexpected defense display in ActionScript source")
            source = source.replace(before, b'_loc3_ * 500 + "-" + _loc3_ * 500')
    elif source.count(new) != 1:
        raise ValueError("Missing life display in ActionScript source")
    return source


def main():
    changes = {SERVER: patch_server(SERVER.read_bytes()),
               CLIENT: patch_swf(CLIENT.read_bytes()),
               VIEW: patch_view(VIEW.read_bytes())}
    for path, data in changes.items():
        if data != path.read_bytes():
            path.write_bytes(data)
            print(f"Updated {path.relative_to(ROOT)}")


if __name__ == "__main__":
    main()
