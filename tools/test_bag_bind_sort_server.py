"""Backpack binding and native reinsertion checks; no live server is touched."""
import argparse
import hashlib
import re
import sys
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
parser = argparse.ArgumentParser(add_help=False)
parser.add_argument('--deps', type=Path)
options, remaining = parser.parse_known_args()
if options.deps:
    sys.path.insert(0, str(options.deps))
from lupa.lua51 import LuaRuntime

SOURCE = (ROOT / 'Server/S1001/data/functions/player.lua').read_text('utf-8-sig')
CODE = SOURCE[SOURCE.index('LocalDT.GetBagSortItemAttributes ='):SOURCE.index('-- 清除旧神戒')]

SETUP = '''
LocalDT = {}; bag = {}; warehouse = {}; equipped = {}; removed = {}; additions = {}; changes = {}
failRemoval = false; dealing = false
Actor = {isDealing=function() return dealing end}
Item = {ipItemCount=1, ipItemStrong=2, ipItemBind=4, ipItemStaticPropStart=44, ipItemDupCount=68}
Item.getBagItemCount = function() return #bag end
Item.getItemPtrByIndex = function(_, index) return bag[index+1] end
Item.getItemId = function(item) assert(not item.destroyed) return item.id end
Item.getItemGuidStr = function(item) assert(not item.destroyed) return tostring(item.guid) end
Item.getBagItemPtrByGuid = function() return nil end
Item.getItemProperty = function(_, item, prop)
 assert(not item.destroyed)
 if prop==1 then return item.count, 0 end
 if prop==4 then return item.bind, 0 end
 return item.attrs[prop] or 0, item.extra[prop] or 0
end
Item.setItemProperty = function(_, item, prop, value)
 assert(prop==4 and not item.destroyed); item.bind=value; changes[#changes+1]=item.guid; return true
end
Item.getItemPropertyById = function(id) return id==999 and 1 or 9999 end
Item.GetItemRuneAttr = function(_, item, index) return item.runes[index] or 0, item.runeValues[index] or 0 end
Item.getFuHunInfo = function(item, kind) return item.fuhun[kind] or 0 end
Item.removeItem = function(_, item, count, _, _, destroy)
 assert(destroy==false and item.count==count and not item.destroyed)
 for _, stack in ipairs(bag) do assert(stack.bind%8~=0, 'merge started before all items were bound') end
 if failRemoval then return 0 end
 for i, candidate in ipairs(bag) do if candidate==item then table.remove(bag,i); break end end
 item.count=0; removed[#removed+1]=item.guid; return count
end
Item.addItem = function(_, item, _, _, count)
 assert(not item.destroyed); additions[#additions+1]=item.guid; item.count=count
 for _, target in ipairs(bag) do
  if target.id==item.id and target.bind%8==item.bind%8 then
   local take=math.min(9999-target.count, item.count)
   target.count=target.count+take; item.count=item.count-take
  end
 end
 if item.count==0 then item.destroyed=true else table.insert(bag,item) end
 return count
end
'''


class BagSortTests(unittest.TestCase):
    def runtime(self):
        lua = LuaRuntime(unpack_returned_tuples=True)
        lua.execute(SETUP)
        lua.execute(CODE)
        return lua

    def add(self, lua, guid, count=1, item_id=100, bind=0, **kwargs):
        data = dict(guid=guid, count=count, id=item_id, bind=bind,
                    attrs=lua.table(), extra=lua.table(), runes=lua.table(),
                    runeValues=lua.table(), fuhun=lua.table())
        data.update(kwargs)
        item = lua.table_from(data)
        lua.globals().bag[len(lua.globals().bag)+1] = item
        return item

    def test_bind_then_merge_preserves_count_and_isolation(self):
        lua = self.runtime()
        for guid, count, bind in [(1,255,0), (2,256,1), (3,9999,0)]:
            self.add(lua, guid, count, bind=bind)
        self.add(lua, 4, item_id=999)
        lua.execute('warehouse={{bind=0}}; equipped={{bind=0}}')
        self.assertEqual(lua.globals().BindAndSortBag(42), 'null')
        lua.execute('''local sum=0; for _,item in ipairs(bag) do
         assert(item.bind==1 and item.count<=9999); if item.id==100 then sum=sum+item.count end end
         assert(sum==10510 and #bag==3); assert(warehouse[1].bind==0 and equipped[1].bind==0)
         assert(#removed==3 and #changes==3)''')

    def test_native_compatible_binding_flags_merge_for_all_stackable_ids(self):
        from patch_box_stacking import server_items, stack_limit
        items=server_items((ROOT/'Server/S1001/data/config/item/StdItems.txt').read_bytes())
        checked=[]
        for item_id,block in items.items():
            if stack_limit(block)<=1: continue
            lua=self.runtime()
            limits=lua.table_from({item_id:stack_limit(block)})
            lua.globals().limits=limits
            lua.execute('Item.getItemPropertyById=function(id) return limits[id] end')
            self.add(lua,1,1,item_id,0)
            second=self.add(lua,2,1,item_id,9)
            lua.globals().BindAndSortBag(42)
            self.assertEqual(len(lua.globals().bag),1,item_id)
            self.assertEqual(lua.globals().bag[1].count,2,item_id)
            self.assertEqual(second.bind,9,'existing high flags must be preserved')
            checked.append(item_id)
        self.assertIn(7160,checked)
        self.assertGreater(len(checked),1000)

    def test_unbound_high_flags_preserved_and_merge_immediately(self):
        lua=self.runtime()
        self.add(lua,1,255,bind=8)
        self.add(lua,2,256,bind=9)
        lua.globals().BindAndSortBag(42)
        self.assertEqual(len(lua.globals().bag),1)
        self.assertEqual((lua.globals().bag[1].count,lua.globals().bag[1].bind),(511,9))

    def test_trading_does_not_change_or_move_items(self):
        lua=self.runtime();self.add(lua,1,bind=0);self.add(lua,2,bind=1)
        lua.execute('dealing=true');lua.globals().BindAndSortBag(42)
        self.assertEqual(len(lua.globals().changes),0)
        self.assertEqual(len(lua.globals().removed),0)
        self.assertEqual(len(lua.globals().bag),2)

    def test_full_guid_strings_survive_merge_and_reordering(self):
        lua=self.runtime()
        self.add(lua,'18446462603027742721',count=255)
        self.add(lua,'18446462603027742722',count=256,bind=1)
        self.add(lua,'18446462603027742723',count=1,item_id=101)
        lua.globals().BindAndSortBag(42)
        self.assertEqual(len(lua.globals().bag),2)
        self.assertEqual(sum(lua.globals().bag[i].count for i in (1,2)),512)

    def test_different_native_binding_modes_stay_separate(self):
        lua=self.runtime();self.add(lua,1,bind=1);self.add(lua,2,bind=3)
        lua.globals().BindAndSortBag(42)
        self.assertEqual(len(lua.globals().bag),2)
        self.assertEqual(len(lua.globals().removed),0)

    def test_each_readable_attribute_difference_blocks_id(self):
        for field, indices in [('attrs',range(2,44)), ('extra',range(2,44)),
                               ('runes',range(5)), ('runeValues',range(5)), ('fuhun',[1,2])]:
            for index in indices:
                if field in ('attrs','extra') and index==4:
                    continue
                with self.subTest(field=field, index=index):
                    lua = self.runtime()
                    self.add(lua,1,255)
                    item = self.add(lua,2,256)
                    item[field][index]=7
                    self.add(lua,3,1)
                    lua.globals().BindAndSortBag(42)
                    self.assertEqual(len(lua.globals().bag),3)
                    self.assertEqual(len(lua.globals().removed),0)
                    self.assertEqual(item[field][index],7)

    def test_equal_equipment_attributes_and_fuhun_can_merge(self):
        lua = self.runtime()
        for guid, count in [(1,1),(2,3)]:
            item=self.add(lua,guid,count)
            item.attrs[6]=1;item.attrs[11]=50;item.fuhun[1]=9;item.fuhun[2]=125
            item.runes[0]=13;item.runeValues[0]=4.5
        lua.globals().BindAndSortBag(42)
        self.assertEqual(len(lua.globals().bag),1)
        item=lua.globals().bag[1]
        self.assertEqual((item.count,item.attrs[6],item.attrs[11],item.fuhun[2]),(4,1,50,125))

    def test_empty_nil_single_nonstack_and_oversize(self):
        lua=self.runtime();self.assertIsNone(lua.globals().BindAndSortBag(None))
        self.assertEqual(lua.globals().BindAndSortBag(42),'null')
        self.add(lua,1,1,101);self.add(lua,2,1,999);self.add(lua,3,1,999)
        self.add(lua,4,10000,102);self.add(lua,5,10000,102)
        lua.globals().BindAndSortBag(42)
        self.assertEqual(len(lua.globals().removed),0)
        self.assertEqual(len(lua.globals().bag),5)

    def test_failed_removal_does_not_insert(self):
        lua=self.runtime();self.add(lua,1,255);self.add(lua,2,256)
        lua.execute('failRemoval=true');lua.globals().BindAndSortBag(42)
        self.assertEqual(len(lua.globals().additions),0)
        self.assertEqual([lua.globals().bag[i].count for i in (1,2)],[255,256])

    def test_sources_compile_and_entry_is_whitelisted(self):
        lua=self.runtime()
        for path, encoding in [('player.lua','utf-8-sig'),('GlobalNpcFunctions.lua','gbk')]:
            result=lua.eval('loadstring')((ROOT/'Server/S1001/data/functions'/path).read_text(encoding))
            self.assertNotIsInstance(result,tuple)
        whitelist=(ROOT/'Server/S1001/data/functions/GlobalNpcFunctions.lua').read_text('gbk')
        self.assertRegex(whitelist,r'\bBindAndSortBag\s*=\s*1')

    def test_lua_sort_with_real_native_item_properties_and_insertion(self):
        from test_item_count_u16_native import Machine, BASE, HEAP, unpack
        class NativeMachine(Machine):
            def hook(self,u,addr,size,data):
                if addr-BASE==0xd9a0: self.ret(0);return
                if addr-BASE==0x2e670: self.ret(self.container);return
                super().hook(u,addr,size,data)
        machine=NativeMachine(ROOT/'Server/S1001/x64/LogicServerCQ64_R.exe')
        machine.extra_allowed=[(0x329220,0x329377),(0x328660,0x328b3e),
            (0x3298b0,0x329d40),(0x286bc0,0x286c20),(0x2eed0,0x2ef00),
            (0x18ed80,0x18ee00),(0x196aa0,0x196b80),(0x3285b0,0x328651),
            (0x1b3710,0x1b3746),(0x32b420,0x32b475),(0x32b4d0,0x32b503)]
        actor=HEAP+0x8000;out=HEAP+0x9000
        machine.u.mem_write(machine.std+0x30,bytes([106]))
        for guid,flags in [(1,0),(2,9)]:
            ptr=machine.add(1,guid,flags)
            data=bytearray(129);data[:8]=guid.to_bytes(8,'little')
            data[8:10]=(7160).to_bytes(2,'little');data[0x2e]=flags
            machine.u.mem_write(ptr,bytes(data));machine.setcount(ptr,1)
        lua=self.runtime();item=lua.globals().Item
        item.getBagItemCount=lambda _:len(machine.items)
        item.getItemPtrByIndex=lambda _,i:list(machine.items.values())[i]
        item.getItemId=lambda ptr:unpack(machine.read(ptr+8,2))
        item.getItemGuidStr=lambda ptr:str(unpack(machine.read(ptr,8)))
        def property_value(_,ptr,prop,*unused):
            value=machine.run(0x328660,actor,ptr,prop,out)
            return (value if value<0x80000000 else value-0x100000000),unpack(machine.read(out,4))
        item.getItemProperty=property_value
        item.getItemPropertyById=lambda id,prop:machine.run(0x3298b0,id,prop)
        item.setItemProperty=lambda _,ptr,prop,val:machine.u.mem_write(ptr+0x2e,bytes([val]))
        def rune_value(_,ptr,index,*unused):
            import struct
            kind=machine.run(0x3285b0,actor,ptr,index,out)
            return kind,struct.unpack('<f',machine.read(out,4))[0]
        item.GetItemRuneAttr=rune_value
        item.getFuHunInfo=lambda ptr,kind:machine.run(0x32b420,ptr,kind)
        item.removeItem=lambda _,ptr,count,log,id,destroy:machine.run(0x3292e0,actor,ptr,count,0,id,int(destroy))
        item.addItem=lambda _,ptr,log,id,count:machine.run(0x329220,actor,ptr,0,id,count,0)
        lua.globals().BindAndSortBag(actor)
        self.assertEqual(len(machine.items),1)
        ptr=next(iter(machine.items.values()))
        self.assertEqual(machine.count(ptr),2)
        self.assertEqual(machine.read(ptr+0x2e,1),bytes([9]))

    def test_real_native_remove_and_reinsert(self):
        from test_item_count_u16_native import Machine, unchanged, BASE, HEAP
        binary=ROOT/'Server/S1001/x64/LogicServerCQ64_R.exe'
        self.assertEqual(hashlib.sha256(binary.read_bytes()).hexdigest(),
                         'd3aafe43859f02a96b61fcf46201aa1ba5305e125ae5f7948ff850ca1aedf6b0',
                         'Engine changed: audit native function addresses before running')
        class ExportMachine(Machine):
            def hook(self,u,addr,size,data):
                rva=addr-BASE
                if rva==0xd9a0: self.ret(0);return
                if rva==0x2e670: self.ret(self.container);return
                super().hook(u,addr,size,data)
        for source,target in [(1,0),(255,256),(256,9999),(9999,1),(9999,9999)]:
            with self.subTest(source=source,target=target):
                machine=ExportMachine(binary);machine.extra_allowed=[(0x329220,0x329377)]
                item=machine.add(source,1,flag=1)
                if target:machine.add(target,2,flag=9)
                before={guid:machine.read(ptr,129) for guid,ptr in machine.items.items()}
                self.assertEqual(machine.run(0x3292e0,HEAP+0x8000,item,source,0,39,0),source)
                self.assertNotIn(1,machine.items);self.assertNotIn(item,machine.destroyed)
                self.assertEqual(machine.run(0x329220,HEAP+0x8000,item,0,39,source,0),source)
                self.assertEqual(sum(machine.count(ptr) for ptr in machine.items.values()),source+target)
                for guid,ptr in machine.items.items():
                    self.assertLessEqual(machine.count(ptr),9999)
                    unchanged(before[guid],machine.read(ptr,129))


if __name__=='__main__':
    unittest.main(argv=[sys.argv[0]]+remaining)
