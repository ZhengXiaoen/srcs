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
failRemoval = false
Item = {ipItemCount=1, ipItemStrong=2, ipItemBind=4, ipItemStaticPropStart=44, ipItemDupCount=68}
Item.getBagItemCount = function() return #bag end
Item.getItemPtrByIndex = function(_, index) return bag[index+1] end
Item.getItemId = function(item) assert(not item.destroyed) return item.id end
Item.getItemGuid = function(item) assert(not item.destroyed) return item.guid end
Item.getBagItemPtrByGuid = function(_, guid)
 for _, item in ipairs(bag) do if item.guid == guid then return item end end
end
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
 for _, stack in ipairs(bag) do assert(stack.bind~=0, 'merge started before all items were bound') end
 if failRemoval then return 0 end
 for i, candidate in ipairs(bag) do if candidate==item then table.remove(bag,i); break end end
 item.count=0; removed[#removed+1]=item.guid; return count
end
Item.addItem = function(_, item, _, _, count)
 assert(not item.destroyed); additions[#additions+1]=item.guid; item.count=count
 for _, target in ipairs(bag) do
  if target.id==item.id then
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

    def test_real_native_remove_and_reinsert(self):
        from test_item_count_u16_native import Machine, unchanged
        binary=ROOT/'Server/S1001/x64/LogicServerCQ64_R.exe'
        self.assertEqual(hashlib.sha256(binary.read_bytes()).hexdigest(),
                         'd3aafe43859f02a96b61fcf46201aa1ba5305e125ae5f7948ff850ca1aedf6b0',
                         'Engine changed: audit native function addresses before running')
        for source,target in [(1,0),(255,256),(256,9999),(9999,1),(9999,9999)]:
            with self.subTest(source=source,target=target):
                machine=Machine(binary);item=machine.add(source,1,flag=1)
                if target:machine.add(target,2,flag=1)
                before={guid:machine.read(ptr,129) for guid,ptr in machine.items.items()}
                self.assertEqual(machine.run(0x2a7f30,machine.container,item,source,0,0,0),source)
                self.assertNotIn(1,machine.items);self.assertNotIn(item,machine.destroyed)
                machine.setcount(item,source)
                self.assertEqual(machine.run(0x2a71e0,machine.container,item,0,0,1,0,0,1),source)
                self.assertEqual(sum(machine.count(ptr) for ptr in machine.items.values()),source+target)
                for guid,ptr in machine.items.items():
                    self.assertLessEqual(machine.count(ptr),9999)
                    unchanged(before[guid],machine.read(ptr,129))


if __name__=='__main__':
    unittest.main(argv=[sys.argv[0]]+remaining)
