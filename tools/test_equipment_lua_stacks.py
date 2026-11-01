"""Replay equipment sorting, inherited rewards and merged-pointer wear in Lua 5.1."""
import argparse
from pathlib import Path
import sys
import unittest

parser = argparse.ArgumentParser(add_help=False)
parser.add_argument('--lua-path', type=Path)
options, remaining = parser.parse_known_args()
if options.lua_path:
    sys.path.insert(0, str(options.lua_path))
from lupa.lua51 import LuaRuntime
import test_bag_bind_sort_server as bag_sort

ROOT = Path(__file__).resolve().parents[1]
FUNCTIONS = ROOT / 'Server/S1001/data/functions'


class EquipmentLuaStackTests(unittest.TestCase):
    def runtime(self):
        return bag_sort.BagSortTests('test_trading_does_not_change_or_move_items').runtime()

    def add(self, lua, *args, **kwargs):
        return bag_sort.BagSortTests('test_trading_does_not_change_or_move_items').add(lua, *args, **kwargs)

    def test_special_soul_equipment_stays_separate_even_when_equal(self):
        for item_type in (1, 2, 3, 4, 6, 7, 8, 9):
            for level, exp in ((1, 0), (0, 100), (25, 12345)):
                with self.subTest(item_type=item_type, level=level, exp=exp):
                    lua = self.runtime()
                    for guid in (1, 2):
                        item = self.add(lua, guid, 3, type=item_type)
                        item.fuhun[1], item.fuhun[2] = level, exp
                    lua.globals().BindAndSortBag(1)
                    self.assertEqual(2, len(lua.globals().bag))
                    self.assertEqual(0, len(lua.globals().removed))

    def test_plain_equipment_merges_and_other_system_shared_fields_remain_valid(self):
        for item_type in (1, 2, 5, 10, 11, 13, 40, 64, 115, 120, 122, 126, 130, 201):
            with self.subTest(item_type=item_type):
                lua = self.runtime()
                for guid in (1, 2):
                    item = self.add(lua, guid, 3, type=item_type)
                    item.attrs[11] = 42
                    if item_type not in (1, 2):
                        # Non-soul systems reuse the raw field for valid growth attributes.
                        item.fuhun[1], item.fuhun[2] = 3, 250
                lua.globals().BindAndSortBag(1)
                self.assertEqual((1, 6), (len(lua.globals().bag), lua.globals().bag[1].count))

    def prepared_runtime(self, merge=True):
        lua = self.runtime()
        source = self.add(lua, 100, 1, type=7, bind=1)
        source.attrs[6] = 17
        lua.execute('table.remove(bag,1)')
        lua.globals().prepared = source
        different = self.add(lua, 200, 5, type=7, bind=1)
        different.attrs[6] = 18
        target = self.add(lua, 300, 8, type=7, bind=1)
        target.attrs[6] = 17
        lua.globals().merge = merge
        lua.execute('''
            wearCalls = {}; addedItems = {}; failAdd = false; partialAdd = false
            Item.addItem = function(_,item,comment,log,amount)
                assert(not item.destroyed)
                if failAdd then return 0 end
                local accepted = partialAdd and 0 or item.count
                if merge then
                    bag[2].count = bag[2].count + accepted
                    item.destroyed = true
                else bag[#bag+1] = item end
                return accepted
            end
            Item.equipItem = function(_,item,replace,slot)
                assert(not item.destroyed, 'wear used merged temporary pointer')
                wearCalls[#wearCalls+1] = {guid=item.guid,replace=replace,slot=slot,count=item.count}
            end
        ''')
        return lua

    def test_auto_wear_finds_live_matching_stack_after_temporary_pointer_is_freed(self):
        lua = self.prepared_runtime()
        g = lua.globals()
        self.assertEqual(1, g.LocalDT.AddAndEquipPreparedItem(1, g.prepared, 'test', 51, 0, 7))
        self.assertTrue(g.prepared.destroyed)
        self.assertEqual((300, 0, 7, 9), tuple(g.wearCalls[1][key] for key in ('guid', 'replace', 'slot', 'count')))
        self.assertEqual(5, g.bag[1].count)

    def test_auto_wear_uses_surviving_guid_and_rejects_failed_add(self):
        lua = self.prepared_runtime(merge=False)
        g = lua.globals()
        g.LocalDT.AddAndEquipPreparedItem(1, g.prepared, 'test', 51, 0, -1)
        self.assertEqual(100, g.wearCalls[1].guid)
        for mode in ('failAdd', 'partialAdd'):
            lua = self.prepared_runtime()
            g = lua.globals()
            setattr(g, mode, True)
            self.assertEqual(0, g.LocalDT.AddAndEquipPreparedItem(1, g.prepared, 'test', 51, 0, -1))
            self.assertEqual(0, len(g.wearCalls))

    def test_synthesis_preserves_inherited_properties_before_native_merge(self):
        source = (FUNCTIONS/'ActorEvent/EquipOpHandle.lua').read_text('utf-8-sig')
        code = source[source.index('function DoEquipSynthesis('):source.index('EquipOpFuncList[EquipOpId.enSynthesis]')]
        for count in (1, 9999):
            lua = LuaRuntime(unpack_returned_tuples=True)
            lua.execute('''
                GameLog={cNewEquipSynthesisConsume=1}; Lang={ScriptTips={eoh0003='failed'}}
                ttFlyTip=0; achievements=0
                CheckAllConsume=function() return true end
                DeductAllConsume=function() return true end
                OneHundredSynthesisEquip=function() end
                material={id=10,count=1,bind=1,attrs={[2]=7,[10]=15,[11]=23,[12]=31}}
                Item={ipItemCount=1,ipItemStrong=2,ipItemBind=4,ipItemStrongLimit=10,
                    ipItemAppraisal=11,ipItemSuperAttrLevel=12}
                Item.getBagItemPtrById=function() return material end
                Item.getItemProperty=function(_,item,prop)
                    assert(not item.destroyed)
                    if prop==4 then return item.bind end
                    return item.attrs[prop] or 0
                end
                Item.createItem=function(id,count,strong,quality,bind)
                    return {id=id,count=count,bind=bind,attrs={[2]=strong}}
                end
                Item.setItemProperty=function(_,item,prop,value)
                    assert(not item.destroyed); item.attrs[prop]=value; return true
                end
                Item.addItem=function(_,item)
                    assert(item.attrs[2]==7 and item.attrs[10]==15 and item.attrs[11]==23 and item.attrs[12]==31)
                    assert(item.bind==1); inheritedCount=item.count; item.destroyed=true; return item.count
                end
                Actor={removeItemByPtr=function(_,item,n) item.count=item.count-n;item.destroyed=true;return n end,
                    triggerAchieveEvent=function() achievements=achievements+1 end,sendTipmsg=function() end}
            ''')
            lua.execute(code)
            cfg = lua.table_from({'consume': lua.table_from([lua.table_from({'type':0,'id':10,'count':1})]),
                                  'award': lua.table_from({'id':123,'count':count}), 'rate':10000})
            self.assertEqual(1, lua.globals().DoEquipSynthesis(1, cfg, True))
            self.assertEqual((count, 1), (lua.globals().inheritedCount, lua.globals().achievements))

    def spirit_runtime(self):
        lua = LuaRuntime(unpack_returned_tuples=True)
        lua.execute('''
            EventCallDispatcher={}; ttFlyTip=0; LogIds={SFighterTakeOffEquip=7}
            state={level=4,bind=1,exp=350}; bagCount=200; failAdd=false; failCreate=false; failClear=false; dealing=false
            Actor={isDealing=function() return dealing end,getSpiritFighterLevel=function() return 1 end,
                getSpiritFighterEquip=function() return true,state.level,state.bind,state.exp end,
                setSpiritFighterEquip=function(_,slot,level,bind,exp)
                    if failClear and level==0 then return false end
                    state={level=level,bind=bind,exp=exp}; return true
                end,sendTipmsg=function() end,collectOperate=function() recalculated=true end}
            Item={ipHeroDamageRate=2,ipRealInjury=3}
            Item.createItem=function(id,count,strong,quality,bind)
                if failCreate then return nil end
                return {id=id,count=count,bind=bind,attrs={}}
            end
            Item.setItemProperty=function(_,item,prop,value)
                assert(not item.destroyed);item.attrs[prop]=value;return true
            end
            Item.addItem=function(_,item)
                assert(item.id==7057 and item.count==1 and item.bind==1)
                assert(item.attrs[2]==4 and item.attrs[3]==350)
                if failAdd then return 0 end
                bagCount=bagCount+1;item.destroyed=true;return 1
            end
            Item.getBagEmptyGridCount=function() error('same stack does not require a free grid') end
            DataPack={readByte=function(packet) return packet.slot end,allocPacket=function() return {} end,
                writeByte=function() end,flush=function() end}
        ''')
        lua.execute((FUNCTIONS/'modules/spirit_fighter.lua').read_text('utf-8-sig'))
        return lua

    def test_spirit_return_merges_without_a_free_grid_and_failure_preserves_equipped_item(self):
        lua = self.spirit_runtime()
        g = lua.globals()
        g.TakeOffSpiritFighterEquip(1, lua.table_from({'slot':0}))
        self.assertEqual((201, 0, 0), (g.bagCount, g.state.level, g.state.exp))
        self.assertTrue(g.recalculated)
        for mode in ('failAdd', 'failCreate', 'failClear', 'dealing'):
            with self.subTest(mode=mode):
                lua = self.spirit_runtime()
                g = lua.globals()
                setattr(g, mode, True)
                g.TakeOffSpiritFighterEquip(1, lua.table_from({'slot':0}))
                self.assertEqual((200, 4, 1, 350), (g.bagCount, g.state.level, g.state.bind, g.state.exp))


if __name__ == '__main__':
    unittest.main(argv=[sys.argv[0], *remaining], verbosity=2)
