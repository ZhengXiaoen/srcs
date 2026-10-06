"""Verify exercise balance, unchanged costs and the shipped Flash display."""

from pathlib import Path
import argparse
import re
import subprocess
import sys
import unittest

from patch_daily_recharge_client import read_cbp, read_pack
from patch_warrior_lt_growth import (
    ROOT, SERVER, CLIENT, VIEW, display_edits, patch_server, patch_swf, patch_view,
)
from patch_drop_pickup_retry import abc_section


BASELINE = "39d0693ef43499664d6070b40e855c95e66c3d29"


def original(path):
    return subprocess.check_output(
        ["git", "show", BASELINE + ":" + path.relative_to(ROOT).as_posix()], cwd=ROOT)


class GrowthTests(unittest.TestCase):
    def setUp(self):
        self.lua = LuaRuntime(unpack_returned_tuples=True)
        self.lua.execute(SERVER.read_text(encoding="utf-8-sig"))
        self.cfg = self.lua.globals().HeroExerciseCfg

    def test_all_levels_are_monotonic_and_reach_caps(self):
        rows = self.cfg.upgradecfg
        self.assertEqual(self.cfg.maxlev, 250)
        self.assertEqual(len(rows), 250)
        previous = None
        for level in range(1, 251):
            row = rows[level]
            self.assertEqual(row.leve, level)
            attrs = {a.type: a.value for a in row.Attrs.values()}
            self.assertGreaterEqual(attrs[143], 0)
            self.assertLessEqual(attrs[143], 10000)
            self.assertGreaterEqual(attrs[144], 0)
            self.assertLessEqual(attrs[144], 500000)
            if previous:
                self.assertIn(attrs[143] - previous[143], (40, 41))
                self.assertGreater(attrs[144], previous[144])
            previous = attrs
        self.assertEqual(rows[1].Attrs[1].value, 0)
        self.assertEqual(previous[143], 10000)
        self.assertEqual(previous[144], 500000)

    def test_extra_growth_starts_after_200_and_is_per_level(self):
        for level in range(1, 251):
            attrs = {a.type: a.value for a in self.cfg.upgradecfg[level].Attrs.values()}
            expected = {143, 144} | ({5, 21, 23, 25, 27} if level > 200 else set())
            self.assertEqual(set(attrs), expected)
            if level > 200:
                self.assertEqual(attrs[5], (level - 200) * 100000)
                for kind in (21, 23, 25, 27):
                    self.assertEqual(attrs[kind], (level - 200) * 500)

    def test_costs_and_unrelated_server_bytes_are_unchanged(self):
        old = original(SERVER)
        new = SERVER.read_bytes()
        pattern = rb"(type\s*=\s*\d+,\s*value\s*=\s*)\d+"
        self.assertEqual(re.sub(pattern, rb"\1VALUE", old), re.sub(pattern, rb"\1VALUE", new))
        self.assertEqual(patch_server(new), new)

    def test_flash_changes_only_the_five_display_multipliers(self):
        old, section = abc_section(original(CLIENT))
        new, new_section = abc_section(CLIENT.read_bytes())
        self.assertEqual(section, new_section)
        a, b = section[2:]
        start, length, replacements = display_edits(old[a:b])
        absolute = a + start
        self.assertEqual(old[:absolute], new[:absolute])
        self.assertEqual(old[absolute + length:], new[absolute + length:])
        old_code = old[absolute:absolute + length]
        code = new[absolute:absolute + length]
        for before, after, count in replacements:
            self.assertEqual(code.count(after), count)
            self.assertEqual(code.count(before), 0)
            code = code.replace(after, before)
        self.assertEqual(code, old_code)
        self.assertEqual(patch_swf(CLIENT.read_bytes()), CLIENT.read_bytes())
        self.assertEqual(patch_view(original(VIEW)), VIEW.read_bytes())

    def test_client_level_limit_and_language_pack_match(self):
        config = ROOT / "web/v2/lang/zh-cn/heroExerciseCfg.cbp"
        root = read_cbp(config.read_bytes())[1]
        self.assertEqual(root.child("maxlev").number(), self.cfg.maxlev)
        self.assertEqual(dict(read_pack(config.with_name("zh-cn.dat").read_bytes()))[config.name],
                         config.read_bytes())


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--lua-path", type=Path)
    args = parser.parse_args()
    if args.lua_path:
        sys.path.insert(0, str(args.lua_path))
    from lupa.lua51 import LuaRuntime
    unittest.main(argv=[sys.argv[0]], verbosity=2)
