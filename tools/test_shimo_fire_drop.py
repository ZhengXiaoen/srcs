"""Regress Shimo fire probability, drop notices and actual client pickup selection."""
from pathlib import Path
import re
import subprocess
import sys
import unittest

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(Path.home() / 'AppData/Local/Temp/codex-lupa'))
from lupa.lua51 import LuaRuntime
import test_boss_material_drop as material
from patch_box_stacking import server_items
from patch_gold_brick_pickup import verify
from patch_guild_quest_config import read_cbp, read_pack, write_node
import test_drop_pickup_retry as pickup

material.LuaRuntime = LuaRuntime
BASELINE = '0bea6a0'
TARGETS = set(range(1295, 1315))
CLIENT = ROOT / 'web/v2/lang/zh-cn'


def original(path):
    return subprocess.check_output(['git', 'show', BASELINE + ':' + path], cwd=ROOT)


def runtime():
    return material.BossMaterialDropTests().runtime()


def fire_rows(lua):
    return [row for row in lua.globals().drops.values() if row.id == 7052]


def fire_messages(lua):
    return [row.msg for row in lua.globals().messages.values() if 'item7052' in row.msg]


class ShimoFireTests(unittest.TestCase):
    def test_all_twenty_bosses_exact_probability_and_notice_quantity(self):
        lua = runtime()
        references = {mid for mid, ids in lua.globals().LocalDT.BossMaterialDropMonsters.items()
                      if 3000 in ids.values()}
        self.assertEqual(TARGETS, references)
        refresh = (ROOT / material.DATA / 'config/monster/SRRefreshMonster.lua').read_text(encoding='utf-8-sig')
        self.assertEqual(TARGETS, {int(mid) for scene, mid in re.findall(
            r'mapid\s*=\s*(\d+)[^\r\n]+?monid\s*=\s*(\d+)', refresh)
            if int(scene) in (634, 635, 636, 637)})
        for mid in TARGETS:
            successes = 0
            for roll in range(100):
                lua.execute(f'randomValue={roll};drops={{}};messages={{}};drop({{}},{{}},{mid})')
                rows, notices = fire_rows(lua), fire_messages(lua)
                self.assertEqual(int(roll < 14), len(rows), (mid, roll))
                self.assertEqual(len(rows), len(notices))
                if rows:
                    self.assertEqual((1, 0), (rows[0].count, rows[0].bind))
                    self.assertIn(' x1', notices[0])
                    successes += 1
            self.assertEqual(14, successes)

    def test_player_pet_hero_and_one_time_guard(self):
        for kind in (0, 2, 3):
            lua = runtime()
            lua.execute(f'randomValue=0;HandlerMonsterByKilled({{}},{{kind={kind}}},1295,0,634,nil)')
            self.assertEqual(1, len(fire_rows(lua)))
            self.assertEqual(1, len(fire_messages(lua)))
        lua = runtime()
        lua.execute('OneTimesDropMonsters[1295]=true;actor={};monster={}')
        self.assertTrue(lua.execute('return HandlerMonsterByKilled(monster,actor,1295,0,634,nil)'))
        self.assertFalse(lua.execute('return HandlerMonsterByKilled(monster,actor,1295,0,634,nil)'))
        self.assertEqual(1, len(fire_rows(lua)))

    def test_failed_creation_or_landing_does_not_announce(self):
        for flag in ('failCreate', 'failDrop'):
            lua = runtime()
            lua.execute(f'LocalDT.BossMaterialDropMonsters[1295]={{3000}};{flag}=true;drop({{}},{{}},1295)')
            self.assertEqual(0, len(fire_rows(lua)))
            self.assertEqual(0, len(fire_messages(lua)))
            self.assertEqual(int(flag == 'failDrop'), lua.globals().released)

    def test_original_rewards_and_random_draws_are_preserved(self):
        before, after = runtime(), runtime()
        before.execute(original(material.FUNCTION))
        # Isolate the deliberately changed fire roll from all original rewards.
        for lua in (before, after):
            lua.execute('''
for mid, ids in pairs(LocalDT.BossMaterialDropMonsters) do
 for i=#ids,1,-1 do if ids[i]==3000 then table.remove(ids,i) end end
end
''')
        for mid in after.globals().LocalDT.BossMaterialDropMonsters.keys():
            for roll in (0, 1, 13, 14, 99):
                for lua in (before, after):
                    lua.execute(f'randomValue={roll};drops={{}};draws=0;drop({{}},{{}},{mid})')
                self.assertEqual(material.BossMaterialDropTests().actual(before),
                                 material.BossMaterialDropTests().actual(after), (mid, roll))
                self.assertEqual(before.globals().draws, after.globals().draws)

    def test_actual_client_selector_and_player_switches(self):
        pickup.PickupRetryTests.setUpClass()
        case = pickup.PickupRetryTests()
        clock, switches, state, drop, _, select, send = case.environment(7052, 1)
        self.assertIs(select(), drop)
        switches[13] = False
        self.assertIsNone(select())
        switches[13] = True
        self.assertIs(select(), drop)
        state['capacity'] = False
        self.assertIsNone(select())
        state['capacity'] = True
        send()
        self.assertIsNone(select())
        clock['ms'] += 2000
        self.assertIs(select(), drop)

    def test_pickup_pack_and_unrelated_resources_are_preserved(self):
        config = (CLIENT / 'SystemConfig.cbp').read_bytes()
        packed = (CLIENT / 'zh-cn.dat').read_bytes()
        server = (ROOT / 'Server/S1001/data/config/help/SystemConfig.lua').read_bytes()
        verify(config, packed, server)
        old = read_pack(original('web/v2/lang/zh-cn/zh-cn.dat'))
        new = read_pack(packed)
        self.assertEqual([(n, b) for n, b in old if n != 'SystemConfig.cbp'],
                         [(n, b) for n, b in new if n != 'SystemConfig.cbp'])
        _, tree = read_cbp(config)
        ranges = next(r for r in tree.children if r.child('type').number() == 13).child('idRange').child('0')
        self.assertEqual([7052, 7052], [n.number() for n in ranges.children.pop().children])
        self.assertEqual(write_node(read_cbp(original('web/v2/lang/zh-cn/SystemConfig.cbp'))[1]),
                         write_node(tree))

    def test_item_name_icon_and_notice_metadata(self):
        item_path = 'Server/S1001/data/config/item/StdItems.txt'
        block = server_items((ROOT / item_path).read_bytes())[7052]
        self.assertIn(b'  dropBroadcast=-1,', block)
        copy = server_items((ROOT / 'Server/S1001/data/config/item/stdItemForClient/StdItems4.txt').read_bytes())[7052]
        self.assertEqual(block, copy)
        found = []
        for path in CLIENT.glob('stditems*.cbp'):
            for row in read_cbp(path.read_bytes())[1].children:
                if row.child('id').number() == 7052:
                    found.append(row)
        self.assertTrue(found)
        for row in found:
            self.assertEqual('凡·南明离火', row.child('name').value.decode('utf-8'))
            self.assertEqual(31060, row.child('icon').number())
            self.assertEqual(200, row.child('dup').number())
        for path in (item_path, 'Server/S1001/data/config/item/stdItemForClient/StdItems4.txt'):
            previous = original(path)
            previous_block = server_items(previous)[7052]
            self.assertEqual(previous.replace(previous_block, previous_block.replace(
                b'  dropBroadcast=0,', b'  dropBroadcast=-1,')), (ROOT / path).read_bytes())

    def test_complete_global_chunk_compiles_without_new_outer_locals(self):
        import test_merge_feature_gates as full
        full.LuaRuntime = LuaRuntime
        full.ServerTests().test_complete_global_include_chunk_compiles()
        self.assertEqual(re.findall(rb'(?m)^local .*', original(material.FUNCTION)),
                         re.findall(rb'(?m)^local .*', (ROOT / material.FUNCTION).read_bytes()))


if __name__ == '__main__':
    unittest.main(verbosity=2)
