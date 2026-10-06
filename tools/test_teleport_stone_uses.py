"""Verify the installed stone configuration and execute its client getters."""
import struct
import unittest

from patch_teleport_stone_uses import ROOT, IDS, USES, BLOCK, patch_swf
from patch_drop_pickup_retry import abc_section
from patch_appearance_upgrade import inspect_abc
from patch_guild_quest_config import read_cbp, read_pack
from test_drop_pickup_retry import PickupVM


class TeleportStoneTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.client = (ROOT / "web/GameFrame.swf").read_bytes()
        data, (_, _, a, b) = abc_section(cls.client)
        cls.abc = data[a:b]
        cls.names, cls.classes, cls.bodies = inspect_abc(cls.abc)

    def getter(self, method, item, value):
        mid = self.classes["UserItem"]["instance"][method][0]
        start, size, _ = self.bodies[mid]
        vm = PickupVM(self.names, [], {"Math": {
            "floor": __import__("math").floor,
            "round": lambda number: __import__("math").floor(number + 0.5),
        }})
        return vm.run(self.abc[start:start + size], [{
            "wItemId": item, "wDura": value, "wDuraMax": value,
        }])

    def test_target_getters_show_exact_remaining_and_maximum_uses(self):
        for item in IDS:
            for value in (0, 1, 2, 9998, 9999, 37528, 65000, 65535):
                with self.subTest(item=item, value=value):
                    self.assertEqual(value, self.getter("displayDura", item, value))
                    self.assertEqual(value, self.getter("displayDuraMax", item, value))

    def test_other_items_preserve_original_rounding(self):
        for item in (1, 491, 497, 499, 500, 503, 65535):
            for value in (0, 999, 1000, 1500, 37528, 50000):
                self.assertEqual(value // 1000, self.getter("displayDura", item, value))
                self.assertEqual(int(value / 1000 + 0.5),
                                 self.getter("displayDuraMax", item, value))

    def test_server_and_client_copies_have_matching_durability(self):
        item_dir = ROOT / "Server/S1001/data/config/item"
        for path in [item_dir / "StdItems.txt", *item_dir.glob("StdItems - *.txt"),
                     item_dir / "stdItemForClient/StdItems1.txt"]:
            rows = {int(m[1]): m[0] for m in BLOCK.finditer(path.read_bytes())}
            for item in IDS:
                self.assertRegex(rows[item], rb"(?m)^  dura=9999,\r?$")
                self.assertRegex(rows[item], rb"(?m)^  useDurDrop=1,\r?$")
        client_dir = ROOT / "web/v2/lang/zh-cn"
        packed = dict(read_pack((client_dir / "zh-cn.dat").read_bytes()))
        for name in ("stditems.cbp", "stditems1.cbp"):
            source = (client_dir / name).read_bytes()
            self.assertEqual(source, packed[name])
            rows = {int(row.child("id").number()): row
                    for row in read_cbp(source)[1].children}
            for item in IDS:
                self.assertEqual(USES, rows[item].child("dura").number())
        self.assertEqual(USES, struct.unpack("<H", struct.pack("<H", USES))[0])

    def test_client_patch_is_idempotent(self):
        self.assertEqual(self.client, patch_swf(self.client))


if __name__ == "__main__":
    unittest.main()
