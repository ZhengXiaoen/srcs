"""Replay actual bag Lua with native insertion and optional-count regression.

Uses synthetic actor/container IO; no live character, database or server is
modified. Native count guards, paging and stacking execute from the real PE.
"""
import argparse
import functools
import hashlib
from pathlib import Path
import re
import struct
import sys
import tempfile
import unittest

parser = argparse.ArgumentParser(add_help=False)
parser.add_argument('--deps', type=Path)
parser.add_argument('--lua-path', type=Path)
args, rest = parser.parse_known_args()
if args.deps:
    sys.path.insert(0, str(args.deps))
if args.lua_path:
    sys.path.insert(0, str(args.lua_path))
from lupa.lua51 import LuaRuntime
from patch_item_add_optional_count import ROOT, SOURCE_HASH, patch
import test_item_count_u16_native as native
from test_item_count_u16_native import Machine, BASE, HEAP
from patch_box_stacking import server_items, stack_limit

ENGINE = ROOT/'Server/S1001/x64/LogicServerCQ64_R.exe'
SOURCE = (ROOT/'Server/S1001/data/functions/Qfunctions.lua').read_text('utf-8-sig')
BEGIN = SOURCE.index('function onFuWenBox(')
CODE = SOURCE[BEGIN:SOURCE.index('\nfunction ', BEGIN + 1)]
CONFIG = (ROOT/'Server/S1001/data/config/item/NormalItemDatas.lua').read_text('utf-8-sig')
CONFIG = CONFIG[CONFIG.index('FuWenBox = {'):CONFIG.index('JiZiLiBao = {')]
ITEMS = server_items((ROOT/'Server/S1001/data/config/item/StdItems.txt').read_bytes())


@functools.lru_cache(maxsize=2)
def mapped_binary(binary):
    # PE(data=...) avoids holding a Windows file mapping during temp cleanup.
    import pefile
    pe = pefile.PE(data=Path(binary).read_bytes())
    return pe, pe.get_memory_mapped_image()


native.mapped_binary = mapped_binary


class ExportMachine(Machine):
    def hook(self, u, addr, size, data):
        if addr - BASE == 0xd9a0:
            self.ret(0)
            return
        if addr - BASE == 0x2e670:
            self.ret(self.container)
            return
        super().hook(u, addr, size, data)


class BagRewardTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.directory = tempfile.TemporaryDirectory(prefix='SRCS-item-bags-')
        cls.binary = Path(cls.directory.name)/'LogicServerCQ64_R.exe'
        cls.fixed = patch(ENGINE.read_bytes())
        cls.binary.write_bytes(cls.fixed)

    @classmethod
    def tearDownClass(cls):
        import gc
        gc.collect()
        mapped_binary.cache_clear()
        cls.directory.cleanup()

    def machine(self, path=None, dup=9999):
        machine = ExportMachine(path or self.binary)
        machine.extra_allowed = [(0x329220, 0x3292d1)]
        machine.u.mem_write(machine.std + 0x31, bytes([200 if dup > 1 else 1]))
        return machine

    def carrier(self, machine, item_id, count=1, guid=1):
        ptr = machine.add(count, guid, flag=1)
        data = bytearray(129)
        data[:8] = struct.pack('<Q', guid)
        data[8:10] = struct.pack('<H', item_id)
        data[0x2e] = 1
        machine.u.mem_write(ptr, bytes(data))
        machine.setcount(ptr, count)
        return ptr

    def test_patch_changes_only_conditional_jump_and_is_idempotent(self):
        restored = bytearray(self.fixed)
        import pefile
        offset = pefile.PE(data=self.fixed).get_offset_from_rva(0x55400c)
        restored[offset] = 0x87
        self.assertEqual(hashlib.sha256(restored).hexdigest(), SOURCE_HASH)
        self.assertEqual(patch(self.fixed), self.fixed)

    def test_original_expansion_rejects_actual_lua_default(self):
        import pefile
        original = bytearray(self.fixed)
        pe = pefile.PE(data=self.fixed)
        original[pe.get_offset_from_rva(0x55400c)] = 0x87
        # The shipped Lua binding loads this double as argument 5's default.
        image = pe.get_memory_mapped_image()
        self.assertEqual(struct.unpack('<d', image[0x3f8840:0x3f8848])[0], -1)
        self.assertEqual(image[0x36f159:0x36f161], bytes.fromhex('f20f1015df960800'))
        old = Path(self.directory.name)/'regression.exe'
        old.write_bytes(original)
        machine = self.machine(old)
        ptr = self.carrier(machine, 3607)
        machine.items.clear()
        self.assertEqual(machine.run(0x329220, HEAP+0x8000, ptr, 0, 0, -1, 0), 0)
        self.assertFalse(machine.items)

    def test_signed_optional_counts_and_positive_overrides(self):
        for value in (-2147483648, -2, -1, 0, 1, 255, 256, 9999, 10000, 65535, 65536, 2147483647):
            with self.subTest(count=value):
                machine = self.machine()
                ptr = self.carrier(machine, 5323, count=256)
                machine.items.clear()
                before = machine.read(ptr, 129)
                accepted = machine.run(0x329220, HEAP+0x8000, ptr, 0, 2393, value, 0)
                expected = 256 if value <= 0 else value if value <= 65535 else 0
                self.assertEqual(accepted, expected)
                self.assertEqual(sum(machine.count(p) for p in machine.items.values()), expected)
                if not expected:
                    self.assertEqual(machine.read(ptr, 129), before)

    def test_all_bag_rewards_and_merge_with_native_insertion(self):
        lua = LuaRuntime(unpack_returned_tuples=True)
        lua.execute(CONFIG)
        configs = list(lua.globals().FuWenBox.values())
        self.assertEqual(len(configs), 19)
        selections = {8: range(1, 9), 9: range(1, 9), 10: range(1, 7),
                      11: range(1, 7), 12: range(1, 7), 18: range(1, 7), 19: range(1, 7)}
        checked = 0
        for cfg in configs:
            for choice in selections.get(cfg.index, (1,)):
                for merge in (False, True):
                    with self.subTest(bag=cfg.item_id, choice=choice, merge=merge):
                        self.exercise_bag(cfg, choice, merge)
                        checked += 1
        self.assertEqual(checked, 116)

    def exercise_bag(self, cfg, choice, merge):
        lua = LuaRuntime(unpack_returned_tuples=True)
        lua.execute('Item={ipheroDamageRateEx=1,ipItemType=2,ipHeroDamageRate=3}; Actor={}; System={}; ttFlyTip=1; LocalDT={}')
        machine = self.machine()
        actor, item = lua.globals().Actor, lua.globals().Item
        events, created = [], []
        actor.sendTipmsg = lambda *a: events.append('tip')
        actor.removeItemByPtr = lambda *a: events.append('remove') or 1
        item.getBagEmptyGridCount = lambda *a: 1
        item.getItemName = lambda *a: 'bag'
        def create(item_id, count, *a):
            kind = int(re.search(rb'(?m)^  type=(\d+),', ITEMS[item_id])[1])
            machine.u.mem_write(machine.std+0x31, bytes([200 if stack_limit(ITEMS[item_id]) > 1 else 1]))
            existing = self.carrier(machine, item_id, count=256, guid=2) if merge and stack_limit(ITEMS[item_id]) > 1 else None
            ptr = self.carrier(machine, item_id, count)
            del machine.items[1]
            created.append((ptr, item_id, kind, existing))
            events.append('create')
            return ptr
        item.createItem = create
        def prop(_, ptr, key, *a):
            assert ptr not in machine.destroyed
            events.append('read')
            return (10 if created[-1][2] in range(201,206) else 0) if key==1 else created[-1][2]
        item.getItemProperty = prop
        item.SetItemRuneAttr = lambda *a: events.append('runes')
        def setprop(_, ptr, key, value):
            assert ptr not in machine.destroyed and value == 10
            events.append('rate')
        item.setItemProperty = setprop
        def add(_, ptr, log=None, log_id=0, count=-1):
            self.assertTrue(log)
            self.assertEqual(log_id, 2393)
            events.append('add')
            result = machine.run(0x329220, HEAP+0x8000, ptr, 0, log_id, count, 0)
            self.assertEqual(result, 1)
            return result
        item.addItem = add
        lua.globals().System.getRandomNumber = lambda *a: self.fail('Warrior maximum was randomized')
        lua.globals().selected = choice
        lua.execute('math.random=function(n) assert(selected<=n); return selected end')
        lua.execute(CODE)
        lua.globals().onFuWenBox(1, 0, lua.table(), lua.table_from(dict(cfg.items())), 0, 1)
        ptr, item_id, kind, existing = created[0]
        self.assertEqual(events[-1], 'add')
        self.assertEqual(events.count('remove'), 1)
        self.assertEqual(sum(machine.count(p) for p in machine.items.values()), 257 if existing else 1)
        if existing:
            self.assertIn(ptr, machine.destroyed)
            self.assertEqual(machine.count(existing), 257)
        if cfg.index==8:
            self.assertIn(item_id, range(3607,3615))
        elif cfg.index==9:
            self.assertIn(item_id, range(3615,3623))
        elif cfg.index in (10,11,12,18,19):
            level = {10:0,11:1,12:2,18:3,19:4}[cfg.index]
            self.assertIn(item_id, [base+level for base in (5323,5338,5343,5348,5353,5358)])

    def test_no_bag_space_or_failed_removal_does_not_award(self):
        for space in (0, 1):
            lua = LuaRuntime(unpack_returned_tuples=True)
            lua.execute('Item={}; Actor={}; ttFlyTip=1')
            lua.globals().Item.getBagEmptyGridCount = lambda *a: space
            lua.globals().Item.getItemName = lambda *a: 'bag'
            lua.globals().Actor.sendTipmsg = lambda *a: None
            lua.globals().Actor.removeItemByPtr = lambda *a: 0
            lua.globals().Item.createItem = lambda *a: self.fail('Award created on failure')
            lua.execute(CODE)
            self.assertFalse(lua.globals().onFuWenBox(1,0,lua.table(),lua.table_from(dict(item_id=4614,index=8)),0,1))


if __name__ == '__main__':
    unittest.main(argv=[sys.argv[0], *rest])
