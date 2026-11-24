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

    def war_equip_runtime(self):
        lua = LuaRuntime(unpack_returned_tuples=True)
        config = FUNCTIONS.parent/'config/equipSynthesis/EquipWarCfg.lua'
        lua.execute(config.read_bytes())
        player = (FUNCTIONS/'player.lua').read_text('utf-8-sig')
        lua.execute('LocalDT = {}')
        lua.execute(player[player.index('LocalDT.GetWarEquipConfig ='):player.index('--//登录游戏触发')])
        stove = (FUNCTIONS/'EquipEnhance/EquipStove.lua').read_text('utf-8-sig')
        start = stove.index('function MiscExWarEquipUpLev(')
        lua.execute(stove[start:stove.index('\nMiscsImplement.registerMsgHandler', start)])
        lua.execute('''
            itWarWeaponPos=53; itWarShoesPos=62; ttFlyTip=1; ttChatWindow=128
            PROP_ACTOR_VOCATION='job'; PROP_ACTOR_SEX='sex'; PROP_ENTITY_ID='id'
            PROP_ACTOR_BIND_COIN='bindCoin'; PROP_ACTOR_COIN='coin'; mtCoin=1; mtBindCoin=0
            LogIds={WarEquipActive=2427, WarEquipUplevel=2428}; sex=0
            equipped={[0]={id=100, progress=999}}; materials={}; tips={}; packets={}; notices={}
            Item={ipItemInsureTimes=34, ipItemID=0,
                getEquipByPos=function(_,slot) return equipped[slot] end,
                getBagEmptyGridCount=function() return 1 end,
                getItemProperty=function(_,item) return item.progress end,
                getItemName=function(id) return tostring(id) end,
                getItemId=function(item) return item.id end,
                createItem=function(id,count,_,quality,bind)
                    assert(count==1 and quality==0 and bind==1)
                    if not failCreate then return {id=id, progress=0} end
                end,
                modifyItemProperty=function(item,prop,value)
                    assert(not item.owned and prop==34)
                    if failPrepare then return false end
                    item.progress=value; return true
                end,
                releaseItemPtr=function(item) assert(not item.owned); released=true end,
                setItemProperty=function(_,item,prop,value)
                    assert(item.owned, 'owned-item setter called before equipping')
                    if prop==34 then item.progress=value else item.id=value end
                    return true
                end,
            }
            Actor={getIntProperty=function(_,prop)
                    if prop=='job' or prop=='id' then return 1 end
                    if prop=='sex' then return sex end
                    return 0
                end,
                getItemCount=function(_,id) return materials[id] or 0 end,
                removeItem=function(_,id,count) materials[id]=materials[id]-count; return count end,
                changeMoney=function(_,_,amount) assert(amount==0) end,
                sendTipmsg=function(_,text) tips[#tips+1]=text end,
                collectOperate=function() end,getName=function() return 'tester' end,
            }
            System={getIntByte=function(value,byte) return math.floor(value/256^byte)%256 end,
                setIntByte=function(stage,byte,star) assert(byte==1); return stage+star*256 end,
                sendCommonLog=function() end, broadcastTipmsg=function(text) notices[#notices+1]=text end,
                trace=function(text) error(text) end,
            }
            DataPack={readByte=function(packet) return packet end,
                allocPacket=function(_,system,command) assert(system==151 and command==30);return {} end,
                writeByte=function(packet,slot) packet.slot=slot end,
                flush=function(packet) packets[#packets+1]=packet.slot end,
            }
            LocalDT.AddAndEquipPreparedItem=function(_,item,_,_,replace,side,count)
                assert(item.progress==0x0101 and replace==0 and count==1)
                for _,cfg in ipairs(EquipWarCfg) do
                    for _,id in ipairs(cfg.upLev[1].destItemId[1]) do
                        if id==item.id then
                            local slot=assert(cfg.equipPos[side+1]); assert(not equipped[slot])
                            equipped[slot]=item; item.owned=true; return 1
                        end
                    end
                end
                error('unexpected war equipment')
            end
        ''')
        return lua

    def test_war_equip_activation_uses_the_actual_slot_and_unlocks_fragment_upgrade(self):
        for slot in range(53, 63):
            for sex in (0, 1):
                with self.subTest(slot=slot, sex=sex):
                    g = self.war_equip_runtime().globals()
                    g.sex = sex
                    cfg, _ = g.LocalDT.GetWarEquipConfig(slot)
                    activation = cfg.upLev[1].consume[2].itemid
                    g.materials[activation], g.materials[5576] = 1, 20
                    g.MiscExWarEquipUpLev(1, 21, slot)
                    item = g.equipped[slot]
                    self.assertEqual((cfg.upLev[1].destItemId[1][sex+1], 0x0101), (item.id, item.progress))
                    self.assertEqual(0, g.materials[activation])
                    self.assertEqual(20, g.materials[5576])
                    g.MiscExWarEquipUpLev(1, 21, slot)
                    self.assertEqual((0x0201, 0), (item.progress, g.materials[5576]))
                    self.assertEqual([slot, slot], list(g.packets.values()))
                    self.assertEqual(999, g.equipped[0].progress)

    def test_old_war_equip_recovers_before_material_check_and_keeps_valid_progress(self):
        lua = self.war_equip_runtime()
        g = lua.globals()
        g.equipped[58] = lua.table_from({'id': 5516, 'progress': 0, 'owned': True})
        g.equipped[57] = lua.table_from({'id': 5516, 'progress': 0x0a01, 'owned': True})
        g.MiscExWarEquipUpLev(1, 21, 58)
        self.assertEqual(0x0101, g.equipped[58].progress)
        self.assertIn('不足20个', g.tips[1])
        self.assertEqual(0, len(g.packets))
        g.materials[5576] = 20
        g.MiscExWarEquipUpLev(1, 21, 58)
        self.assertEqual((0x0201, 0x0a01), (g.equipped[58].progress, g.equipped[57].progress))
        cfg, _ = g.LocalDT.GetWarEquipConfig(57)
        cost = cfg.upLev[11].consume[2]
        g.materials[cost.itemid] = cost.count
        g.MiscExWarEquipUpLev(1, 21, 57)
        self.assertEqual((5517, 0x0102, 0), (g.equipped[57].id, g.equipped[57].progress, g.materials[cost.itemid]))

    def test_war_equip_prepare_failure_does_not_use_activation_material(self):
        for flag in ('failCreate', 'failPrepare'):
            g = self.war_equip_runtime().globals()
            g[flag] = True
            g.materials[5536] = 1
            g.MiscExWarEquipUpLev(1, 21, 53)
            self.assertEqual(1, g.materials[5536])
            self.assertIsNone(g.equipped[53])
            self.assertEqual(0, len(g.packets))
            self.assertEqual(flag == 'failPrepare', bool(g.released))

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
