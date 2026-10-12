"""Backpack binding and direct stack consolidation; no live server is touched."""
import argparse
import hashlib
import json
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
failRemoval = false; failWrite = false; dealing = false
Actor = {isDealing=function() return dealing end}
Item = {ipItemCount=1, ipItemStrong=2, ipItemBind=4, ipItemType=5, ipItemStaticPropStart=44, ipItemDupCount=68}
Item.getBagItemCount = function() return #bag end
Item.getItemPtrByIndex = function(_, index) return bag[index+1] end
Item.getItemId = function(item) assert(not item.destroyed) return item.id end
Item.getItemGuidStr = function(item) assert(not item.destroyed) return tostring(item.guid) end
Item.getBagItemPtrByGuid = function() return nil end
Item.getItemProperty = function(_, item, prop)
 assert(not item.destroyed)
 if prop==1 then return item.count, 0 end
 if prop==4 then return item.bind, 0 end
 if prop==5 then return item.type, item.extra[prop] or 0 end
 return item.attrs[prop] or 0, item.extra[prop] or 0
end
Item.setItemProperty = function(_, item, prop, value)
 assert(not item.destroyed)
 if prop==4 then item.bind=value; changes[#changes+1]=item.guid
 elseif prop==1 then
  if failWrite then return false end
  item.count=value
 else error('unexpected property') end
 return true
end
Item.getItemPropertyById = function(id) return id==999 and 1 or 9999 end
Item.GetItemRuneAttr = function(_, item, index) return item.runes[index] or 0, item.runeValues[index] or 0 end
Item.getFuHunInfo = function(item, kind) return item.fuhun[kind] or 0 end
Item.removeItem = function(_, item, count, _, _, destroy)
 assert(destroy==true and item.count>=count and not item.destroyed)
 for _, stack in ipairs(bag) do assert(stack.bind%8~=0, 'merge started before all items were bound') end
 if failRemoval then return 0 end
 item.count=item.count-count; removed[#removed+1]=item.guid
 if item.count==0 then
  for i, candidate in ipairs(bag) do if candidate==item then table.remove(bag,i); break end end
  item.destroyed=true
 end
 return count
end
Item.addItem = function() error('sort must not reinsert an item') end
'''


class BagSortTests(unittest.TestCase):
    def runtime(self):
        lua = LuaRuntime(unpack_returned_tuples=True)
        lua.execute(SETUP)
        lua.execute(CODE)
        return lua

    def add(self, lua, guid, count=1, item_id=100, bind=0, **kwargs):
        data = dict(guid=guid, count=count, id=item_id, bind=bind, type=120,
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
         assert(#removed==2 and #changes==3)''')

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
            item_type=int(re.search(rb'\btype=(\d+)',block)[1])
            first=lua.globals().bag[1];first.type=item_type
            second=self.add(lua,2,1,item_id,9,type=item_type)
            # Different unused payloads must not prevent ordinary items stacking.
            if item_type!=120:
                for index in range(5):
                    first.runes[index]=173;first.runeValues[index]=float('nan')
                    second.runes[index]=3;second.runeValues[index]=4.5
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

    def test_each_attribute_difference_preserved_while_equal_pair_merges(self):
        for field, indices in [('attrs',range(2,44)), ('extra',range(2,44)),
                               ('runes',range(5)), ('runeValues',range(5)), ('fuhun',[1,2])]:
            for index in indices:
                if field in ('attrs','extra') and index==4:
                    continue
                with self.subTest(field=field, index=index):
                    lua = self.runtime()
                    self.add(lua,1,255)
                    item = self.add(lua,2,256)
                    if field=='attrs' and index==5:
                        item.type=7
                    else:
                        item[field][index]=7
                    if field=='runeValues': item.runes[index]=1
                    self.add(lua,3,1)
                    lua.globals().BindAndSortBag(42)
                    self.assertEqual(len(lua.globals().bag),2)
                    self.assertEqual(len(lua.globals().removed),1)
                    self.assertEqual(item.type if field=='attrs' and index==5 else item[field][index],7)

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

    def test_failed_removal_rolls_back_target_count(self):
        lua=self.runtime();self.add(lua,1,255);self.add(lua,2,256)
        lua.execute('failRemoval=true');lua.globals().BindAndSortBag(42)
        self.assertEqual(len(lua.globals().additions),0)
        self.assertEqual([lua.globals().bag[i].count for i in (1,2)],[255,256])

    def test_inactive_rune_nan_does_not_block_merge(self):
        lua=self.runtime()
        for guid,bind in [(1,0),(2,1)]:
            item=self.add(lua,guid,bind=bind)
            for index in range(5): item.runeValues[index]=float('nan')
        lua.globals().BindAndSortBag(42)
        self.assertEqual(len(lua.globals().bag),1)
        self.assertEqual(lua.globals().bag[1].count,2)

    def test_matching_expiry_and_tao_strength_merge_without_reinsertion(self):
        lua=self.runtime()
        for guid,bind in [(1,0),(2,1)]:
            item=self.add(lua,guid,count=256,bind=bind)
            item.attrs[23]=123456;item.attrs[41]=7
        lua.globals().BindAndSortBag(42)
        self.assertEqual(len(lua.globals().bag),1)
        self.assertEqual(lua.globals().bag[1].count,512)

    def test_target_write_failure_never_removes_source(self):
        lua=self.runtime();self.add(lua,1,255);self.add(lua,2,256)
        lua.execute('failWrite=true');lua.globals().BindAndSortBag(42)
        self.assertEqual(len(lua.globals().removed),0)
        self.assertEqual([lua.globals().bag[i].count for i in (1,2)],[255,256])

    def test_respects_actual_stack_limit_and_retains_remainder(self):
        lua=self.runtime();lua.execute('Item.getItemPropertyById=function() return 10 end')
        for guid,count in [(1,8),(2,7),(3,6)]: self.add(lua,guid,count)
        lua.globals().BindAndSortBag(42)
        self.assertEqual([lua.globals().bag[i].count for i in (1,2,3)],[10,10,1])

    def test_sources_compile_and_entry_is_whitelisted(self):
        lua=self.runtime()
        for path, encoding in [('player.lua','utf-8-sig'),('GlobalNpcFunctions.lua','gbk')]:
            result=lua.eval('loadstring')((ROOT/'Server/S1001/data/functions'/path).read_text(encoding))
            self.assertNotIsInstance(result,tuple)
        whitelist=(ROOT/'Server/S1001/data/functions/GlobalNpcFunctions.lua').read_text('gbk')
        self.assertRegex(whitelist,r'\bBindAndSortBag\s*=\s*1')

    def native_runtime(self, source_count=1, target_count=1, expiry=0, tao=0, inactive_nan=False):
        from test_item_count_u16_native import Machine, BASE, HEAP, unpack
        class NativeMachine(Machine):
            def hook(self,u,addr,size,data):
                if addr-BASE==0xd9a0: self.ret(0);return
                if addr-BASE==0x2e670: self.ret(self.container);return
                if addr-BASE in (0x2e5f0,0x297eb0): self.ret(0);return
                if addr-BASE==0x28fff0:
                    from unicorn.x86_const import UC_X86_REG_R8, UC_X86_REG_R9
                    self.u.mem_write(self.u.reg_read(UC_X86_REG_R8),(1).to_bytes(4,'little'))
                    self.u.mem_write(self.u.reg_read(UC_X86_REG_R9),bytes(4))
                    self.ret(1);return
                if addr-BASE in (0x288300,0x28f570,0x3c5894,0x2b0810,0x3c8c18,0x3fdc0): self.ret(0);return
                super().hook(u,addr,size,data)
        binary=ROOT/'Server/S1001/x64/LogicServerCQ64_R.exe'
        from patch_item_add_optional_count import TARGET_HASH
        self.assertEqual(hashlib.sha256(binary.read_bytes()).hexdigest(),TARGET_HASH,
                         'Engine changed: audit REA addresses before running')
        machine=NativeMachine(binary)
        machine.extra_allowed=[(0x3281b0,0x32822f),(0x287500,0x288248),(0x329220,0x329377),(0x328660,0x328b3e),
            (0x3298b0,0x329d40),(0x286bc0,0x286c20),(0x2eed0,0x2ef00),
            (0x18ed80,0x18ee00),(0x196aa0,0x196b80),(0x3285b0,0x328651),
            (0x1b3710,0x1b3746),(0x32b420,0x32b475),(0x32b4d0,0x32b503)]
        from test_item_count_u16_native import STOP, p64
        machine.u.mem_write(BASE+0x3f7550,p64(STOP+0x100))
        actor=HEAP+0x8000;out=HEAP+0x9000
        machine.u.mem_write(machine.std+0x30,bytes([106]))
        for guid,flags,count in [(1,0,source_count),(2,9,target_count)]:
            ptr=machine.add(1,guid,flags)
            data=bytearray(129);data[:8]=guid.to_bytes(8,'little')
            data[8:10]=(7160).to_bytes(2,'little');data[0x2e]=flags
            data[0x19:0x1d]=expiry.to_bytes(4,'little');data[0x62]=tao
            if inactive_nan:
                for index in range(5): data[0x68+index*5:0x6c+index*5]=bytes.fromhex('0000c07f')
            machine.u.mem_write(ptr,bytes(data));machine.setcount(ptr,count)
        machine.u.mem_write(machine.container+0x31,bytes([1]))
        machine.u.mem_write(machine.container+0x38,p64(actor))
        machine.u.mem_write(machine.container+0x48,p64(actor))
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
        item.setItemProperty=lambda _,ptr,prop,val: bool(machine.run(0x3281b0,actor,ptr,prop,val)&255)
        def rune_value(_,ptr,index,*unused):
            import struct
            kind=machine.run(0x3285b0,actor,ptr,index,out)
            return kind,struct.unpack('<f',machine.read(out,4))[0]
        item.GetItemRuneAttr=rune_value
        item.getFuHunInfo=lambda ptr,kind:machine.run(0x32b420,ptr,kind)
        item.removeItem=lambda _,ptr,count,log,id,destroy:machine.run(0x3292e0,actor,ptr,count,0,id,int(destroy))
        item.addItem=lambda _,ptr,log,id,count:machine.run(0x329220,actor,ptr,0,id,count,0)
        return lua,machine,actor

    def test_lua_sort_with_real_native_properties_setter_and_removal(self):
        for counts in [(1,1),(255,256),(256,9999),(9999,1)]:
            for expiry,tao,nan in [(0,0,False),(123456,0,False),(0,7,False),(123456,7,True)]:
                with self.subTest(counts=counts,expiry=expiry,tao=tao,nan=nan):
                    lua,machine,actor=self.native_runtime(*counts,expiry,tao,nan)
                    before={guid:machine.read(p,129) for guid,p in machine.items.items()}
                    lua.globals().BindAndSortBag(actor)
                    total=sum(counts)
                    self.assertEqual(len(machine.items),(total+9998)//9999)
                    self.assertEqual(sum(machine.count(p) for p in machine.items.values()),total)
                    for p in machine.items.values():
                        self.assertLessEqual(machine.count(p),9999)
                        self.assertEqual(int.from_bytes(machine.read(p+0x19,4),'little'),expiry)
                        self.assertEqual(machine.read(p+0x62,1),bytes([tao]))
                        from test_item_count_u16_native import unchanged,unpack
                        unchanged(before[unpack(machine.read(p,8))],machine.read(p,129),skip=(0x2d,0x2e,0x80))
                    lua.globals().BindAndSortBag(actor)
                    self.assertEqual(sum(machine.count(p) for p in machine.items.values()),total)

    def captured_material_runtime(self, case):
        lua,machine,actor=self.native_runtime()
        machine.items.clear()
        for guid,row in enumerate(case['items'],1):
            ptr=machine.add(1,guid,0)
            raw=bytearray(129)
            raw[:8]=guid.to_bytes(8,'little')
            raw[8:10]=case['id'].to_bytes(2,'little')
            raw[0x2e]=row['bind']
            raw[0x67:0x80]=bytes.fromhex(row['unused_rune_payload'])
            machine.u.mem_write(ptr,bytes(raw))
            machine.setcount(ptr,row['count'])
        machine.u.mem_write(machine.std+0x30,bytes([case['type']]))
        return lua,machine,actor

    def test_captured_material_payloads_merge_with_real_native_engine(self):
        from test_item_count_u16_native import unchanged,unpack
        fixture=json.loads((ROOT/'tools/fixtures/bag_sort_material_items.json').read_text('utf-8'))
        for case in fixture['cases']:
            with self.subTest(item_id=case['id']):
                lua,machine,actor=self.captured_material_runtime(case)
                before={guid:machine.read(ptr,129) for guid,ptr in machine.items.items()}
                total=sum(row['count'] for row in case['items'])
                lua.globals().BindAndSortBag(actor)
                self.assertEqual(len(machine.items),1)
                ptr=next(iter(machine.items.values()))
                self.assertEqual(machine.count(ptr),total)
                unchanged(before[unpack(machine.read(ptr,8))],machine.read(ptr,129),skip=(0x2d,0x2e,0x80))
                lua.globals().BindAndSortBag(actor)
                self.assertEqual(len(machine.items),1)
                self.assertEqual(machine.count(ptr),total)

    def test_previous_sort_rejects_captured_material_payloads(self):
        import subprocess
        source=subprocess.check_output(['git','show','bc20001:Server/S1001/data/functions/player.lua'],cwd=ROOT).decode('utf-8-sig')
        legacy=source[source.index('LocalDT.GetBagSortItemAttributes ='):source.index('-- 清除旧神戒')]
        fixture=json.loads((ROOT/'tools/fixtures/bag_sort_material_items.json').read_text('utf-8'))
        for case in fixture['cases']:
            with self.subTest(item_id=case['id']):
                lua,machine,actor=self.captured_material_runtime(case)
                lua.execute(legacy)
                lua.globals().BindAndSortBag(actor)
                self.assertGreater(len(machine.items),1)
                self.assertEqual(sum(machine.count(ptr) for ptr in machine.items.values()),
                                 sum(row['count'] for row in case['items']))

    def test_real_rune_payloads_remain_distinct(self):
        lua,machine,actor=self.native_runtime()
        machine.u.mem_write(machine.std+0x30,bytes([120]))
        first,second=list(machine.items.values())
        machine.u.mem_write(first+0x67,bytes([1])+bytes.fromhex('0000803f'))
        machine.u.mem_write(second+0x67,bytes([1])+bytes.fromhex('00000040'))
        lua.globals().BindAndSortBag(actor)
        self.assertEqual(len(machine.items),2)
        self.assertEqual(sum(machine.count(ptr) for ptr in machine.items.values()),2)


    def test_previous_sort_reproduces_two_slots_with_real_native_engine(self):
        import subprocess
        source=subprocess.check_output(['git','show','35cfeb1:Server/S1001/data/functions/player.lua'],cwd=ROOT).decode('utf-8-sig')
        legacy=source[source.index('LocalDT.GetBagSortItemAttributes ='):source.index('-- 清除旧神戒')]
        for expiry,tao,nan in [(123456,0,False),(0,7,False),(0,0,True)]:
            with self.subTest(expiry=expiry,tao=tao,nan=nan):
                lua,machine,actor=self.native_runtime(expiry=expiry,tao=tao,inactive_nan=nan)
                lua.execute(legacy)
                lua.globals().BindAndSortBag(actor)
                self.assertEqual(len(machine.items),2)
                self.assertEqual(sum(machine.count(p) for p in machine.items.values()),2)
                self.assertTrue(all(machine.read(p+0x2e,1)[0]%8==1 for p in machine.items.values()))

    def test_real_native_remove_and_reinsert(self):
        from test_item_count_u16_native import Machine, unchanged, BASE, HEAP
        binary=ROOT/'Server/S1001/x64/LogicServerCQ64_R.exe'
        from patch_item_add_optional_count import SOURCE_HASH, TARGET_HASH
        self.assertIn(hashlib.sha256(binary.read_bytes()).hexdigest(),
                         (SOURCE_HASH, TARGET_HASH),
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
