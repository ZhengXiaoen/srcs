"""Exercise every map/BOSS preview against actual drops and client item icons."""
import argparse
import re
import sys
import unittest

from patch_boss_equipment_drop import DATA, ROOT
from patch_guild_quest_config import read_cbp, read_pack
from patch_wild_boss_drop_preview import OUTPUT, generate


class PreviewTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        result, cls.actual, cls.monsters, cls.maps, cls.items, cls.meta, cls.conds = generate()
        assert OUTPUT.read_bytes() == result
        from lupa.lua51 import LuaRuntime
        cls.lua = LuaRuntime(unpack_returned_tuples=True)
        cls.lua.execute('''
LocalDT={};state={};vocation=1;sex=0;PROP_ACTOR_VOCATION=1;PROP_ACTOR_SEX=2
System={getDyanmicVar=function() return state end,getMonsterNameById=function(id) return 'BOSS'..id end}
Actor={getIntProperty=function(_,prop) if prop==PROP_ACTOR_SEX then return sex end;return vocation end}
Fuben={getSceneNameById=function(id) return 'map'..id end}
''')
        for path in ['config/BossListInfo/BossListInfo.lua','config/monster/SRRefreshMonster.lua',
                     'config/monster/BossEquipmentPreviewCfg.lua','config/monster/WildBossDropPreviewCfg.lua',
                     'functions/BossListInfo/BossEquipmentPreview.lua','functions/BossListInfo/BossListInfoEx.lua']:
            cls.lua.execute((DATA / path).read_text('utf-8-sig'))
        cls.lua.execute('ShowRightBossListInfo=function(_,kind,text) assert(kind==1);preview=text end')

    def assert_preview(self, info, mid, cfg, pool, sex, job):
        g = self.lua.globals()
        g.sex, g.vocation = sex, job
        g.HandleTestBoos(1, info.args, info.sceneName, mid)
        # Only the two drop rows contain item markup; each row remains <= 6.
        rows = [[int(iid) for iid in re.findall(r'<\(iitem#(\d+)#1\)>', row)]
                for row in g.preview.split('\\')]
        actual_rows = [row for row in rows if row]
        expected = [row for row in [cfg['equipment'][sex], cfg['special']] if row]
        self.assertEqual(expected, actual_rows)
        ids = [iid for row in actual_rows for iid in row]
        self.assertLessEqual(len(ids), 12)
        self.assertEqual(len(ids), len(set(ids)))
        self.assertTrue(set(ids) <= pool)
        self.assertTrue(all(len(row) <= 6 for row in actual_rows))
        self.assertTrue(all(self.meta[iid]['kind'] in (1, 2) for iid in cfg['equipment'][sex]))
        for iid in cfg['special']:
            kind = self.meta[iid]['kind']
            self.assertFalse(1 <= kind < 14 or 87 <= kind <= 94)
        # Every profession gets its highest actually droppable weapon and clothing.
        for profession in (1, 2, 3):
            for kind in (1, 2):
                choices = [iid for iid in pool if self.meta[iid]['kind'] == kind
                           and self.conds[iid].get(3, 0) in (0, profession)
                           and (kind == 1 or self.conds[iid].get(2, sex) == sex)]
                if choices:
                    highest = max(self.meta[iid]['tier'] for iid in choices)
                    self.assertTrue(any(self.meta[iid]['kind'] == kind
                                        and self.meta[iid]['tier'] == highest
                                        and self.conds[iid].get(3, 0) in (0, profession)
                                        for iid in cfg['equipment'][sex]))

    def test_all_map_and_boss_requests_both_sexes_all_professions(self):
        g = self.lua.globals()
        total = 0
        for info in g.BossListInfo.values():
            args = info.args
            mids = {int(row.monid) for row in g.RefreshMonsterData.values()
                    if args[1] <= row.bj <= args[2]}
            mids.update(int(g.RefreshMonsterData[index].monid) for index in (args.add or {}).values())
            key = str(int(args[1])) + ':' + str(int(args[2]))
            for sex in (0, 1):
                for job in (1, 2, 3):
                    self.assert_preview(info, None, self.maps[key],
                                        set().union(*(self.actual[mid] for mid in mids)), sex, job)
                    total += 1
                    for mid in sorted(mids):
                        self.assert_preview(info, str(mid), self.monsters[mid], self.actual[mid], sex, job)
                        total += 1
        self.assertGreater(total, 1400)
        print('Verified', total, 'real map/BOSS request combinations')

    def test_chiyou_wings_stay_in_second_row(self):
        wings = {6983, 6988, 6993, 6998}
        for cfg in [self.maps['812:820'], *(self.monsters[mid] for mid in range(1279, 1288))]:
            self.assertTrue(wings <= set(cfg['special']))
            self.assertEqual(6, len(cfg['equipment'][0]))

    def test_real_rebirth_tiers_and_no_invalid_placeholders(self):
        self.assertEqual([168,169,177,178,186,187], self.monsters[1391]['equipment'][0])
        self.assertEqual([168,169,177,178,186,187], self.maps['850:850']['equipment'][0])
        self.assertEqual([439,440], self.monsters[647]['equipment'][0])

    def test_client_item_ids_types_icons_and_pack_match(self):
        candidates = {iid for cfg in [*self.monsters.values(), *self.maps.values()]
                      for row in [*cfg['equipment'], cfg['special']] for iid in row}
        client = ROOT / 'web/v2/lang/zh-cn'
        packed = dict(read_pack((client / 'zh-cn.dat').read_bytes()))
        found = {}
        for path in client.glob('stditems*.cbp'):
            self.assertEqual(path.read_bytes(), packed[path.name])
            for row in read_cbp(path.read_bytes())[1].children:
                iid = int(row.child('id').number())
                if iid in candidates:
                    found[iid] = row
        self.assertEqual(candidates, found.keys())
        for iid, row in found.items():
            self.assertEqual(self.meta[iid]['kind'], row.child('type').number())
            self.assertEqual(int(self.items[iid][b'icon']), row.child('icon').number())
            self.assertGreater(row.child('icon').number(), 0)


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--lua-path')
    args, remaining = parser.parse_known_args()
    if args.lua_path:
        sys.path.insert(0, args.lua_path)
    unittest.main(argv=[sys.argv[0]] + remaining)
