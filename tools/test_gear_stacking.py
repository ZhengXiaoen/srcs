"""Replay mount wear machine code, wing Lua and synchronized item resources."""
import argparse
import base64
import hashlib
from pathlib import Path
import json
import re
import struct
import subprocess
import sys
import unittest

parser = argparse.ArgumentParser(add_help=False)
parser.add_argument('--deps', type=Path)
parser.add_argument('--lua-path', type=Path)
parser.add_argument('--binary', type=Path)
options, remaining = parser.parse_known_args()
for directory in (options.deps, options.lua_path):
    if directory:
        sys.path.insert(0, str(directory))
from lupa.lua51 import LuaRuntime
import pefile
from test_item_count_u16_native import (
    Machine, BASE, HEAP, unpack, unchanged, UC_X86_REG_RCX, UC_X86_REG_RDX,
    UC_X86_REG_R8, UC_X86_REG_R9, UC_X86_REG_RSP,
)
from patch_gear_stack_native import SOURCE_HASH, SERVER, patch
from patch_box_stacking import ROOT, ITEM_DIR, DUP, appearance_groups, wing_equipment_ids, server_items, stack_limit
from patch_guild_quest_config import read_cbp, read_pack

BINARY = options.binary or SERVER
PACKAGE = ROOT / 'Server/S1001/x64/gear-stack.patch.json'


def original_server():
    source = SERVER.read_bytes()
    if hashlib.sha256(source).hexdigest() == SOURCE_HASH:
        return source
    package = json.loads(PACKAGE.read_text('utf-8'))
    if hashlib.sha256(source).hexdigest() != package['targetSha256']:
        raise AssertionError('Unexpected installed server')
    result = bytearray(source[:package['sourceLength']])
    for edit in reversed(package['edits']):
        before = base64.b64decode(edit['before'])
        if before:
            result[edit['offset']:edit['offset']+len(before)] = before
    assert hashlib.sha256(result).hexdigest() == SOURCE_HASH
    return bytes(result)


class WearMachine(Machine):
    def __init__(self, count, item_id=6865, item_type=122, bind=1, old=False,
                 takeoff=True, allow=True, allocation=True, remove=True):
        super().__init__(BINARY)
        self.count_before, self.allow, self.takeoff, self.remove = count, allow, takeoff, remove
        self.old, self.responses, self.wear_calls, self.removals = old, [], [], []
        self.props = {6: 100, 0x53: 1, 0x52: 0}
        self.horse, self.actor, self.config, self.packet = HEAP+0x8000, HEAP+0x8200, HEAP+0x9000, HEAP+0x9500
        self.u.mem_write(self.horse+8, struct.pack('<Q', self.actor))
        self.u.mem_write(self.std+0x30, bytes([item_type]))
        self.original = self.add(count, 42, bind)
        self.u.mem_write(self.original+8, struct.pack('<H', item_id))
        self.before = self.read(self.original, 129)
        if not allocation:
            self.allocfail = 0
        self.extra_allowed = [(0x1db020, 0x1db580)]

    def hook(self, machine, address, size, data):
        rva = address-BASE
        rcx, rdx, r8 = (machine.reg_read(register) for register in
                        (UC_X86_REG_RCX, UC_X86_REG_RDX, UC_X86_REG_R8))
        if rva == 0x2a7f30:
            self.removals.append((rdx, r8))
            if not self.remove:
                self.ret(0)
                return
        result = None
        if rva == 0xe2e0:
            result = 1
        elif rva == 0x1de400:
            result = self.config
        elif rva == 0xe000:
            result = self.props.get(rdx, 0)
        elif rva == 0x185e70:
            result = HEAP+0x9800
        elif rva == 0x185e40:
            result = 0
        elif rva == 0x39cf0:
            machine.mem_write(rdx, struct.pack('<Q', 42)); result = self.packet
        elif rva == 0x2e670:
            result = self.container
        elif rva == 0x2a8650:
            result = list(self.items).index(rdx)
        elif rva == 0x11dfd0:
            result = 1
        elif rva == 0x286960:
            result = 0 if self.allow else HEAP+0x9900
        elif rva == 0x2300e0:
            result = 0
        elif rva == 0x17f0f0:
            result = int(self.before[0x2e] % 8 > 0)
        elif rva == 0x1dc120:
            result = int(self.old)
        elif rva == 0x1dba70:
            result = 1 if self.takeoff else 0
        elif rva == 0x1dc350:
            self.wear_calls.append((rdx, r8)); result = 0
        elif rva == 0xe060:
            self.props[rdx] = unpack(self.read(r8, 4)); result = 0
        elif rva == 0x80900:
            result = 0
        elif rva == 0x22d3f0:
            result = self.packet
        elif rva == 0xbd30:
            self.responses.append(rdx & 255); result = rcx
        elif rva == 0x22da10:
            result = 0
        if result is not None:
            self.ret(result)
            return
        super().hook(machine, address, size, data)

    def wear(self):
        self.run(0x1db020, self.horse, self.packet)


class NativeWearTests(unittest.TestCase):
    def test_all_twenty_mount_equipment_ids_wear_one_and_keep_stack(self):
        items = server_items((ITEM_DIR/'StdItems.txt').read_bytes())
        for item in sorted(appearance_groups()['ride_gear']):
            kind = int(re.search(rb'\btype=(\d+)', items[item])[1])
            with self.subTest(item=item):
                model = WearMachine(200, item, kind)
                model.wear()
                self.assertEqual([(model.original, 1)], model.removals)
                self.assertEqual(199, model.count(model.original))
                self.assertNotIn(model.original, model.destroyed)
                self.assertEqual([(kind-122, model.before[0x62])], model.wear_calls)
                unchanged(model.before, model.read(model.original, 129))

    def test_uint16_boundaries_binding_and_attributes(self):
        for count in (2, 255, 256, 9999, 65535):
            for binding in (0, 1, 3, 9, 253):
                with self.subTest(count=count, binding=binding):
                    model = WearMachine(count, bind=binding)
                    model.wear()
                    self.assertEqual(count-1, model.count(model.original))
                    unchanged(model.before, model.read(model.original, 129))
                    self.assertEqual([42, 4, 0, 255 if binding % 8 else 1], model.responses)
                    clone = model.destroyed[0]
                    # Read after emulation directly: check_dead rejects any runtime use after free.
                    data = bytes(model.u.mem_read(clone, 129))
                    self.assertNotEqual(42, unpack(data[:8]))
                    self.assertEqual((1, 0), (data[0x2d], data[0x80]))
                    unchanged(model.before, data, tuple(range(8))+(0x2d, 0x80))

    def test_single_unit_keeps_original_ownership_path(self):
        model = WearMachine(1)
        model.wear()
        self.assertNotIn(42, model.items)
        self.assertEqual([model.original], model.destroyed)
        self.assertEqual(0, model.allocated)

    def test_no_free_grid_needed_to_wear_stack(self):
        model = WearMachine(9999)
        model.freegrids = 0
        model.wear()
        self.assertEqual(9998, model.count(model.original))
        self.assertEqual(0, model.freegrids)

    def test_denial_allocation_and_removal_failures_keep_every_unit(self):
        for values in ({'allow': False}, {'allocation': False}, {'remove': False}):
            model = WearMachine(9999, **values)
            model.wear()
            self.assertEqual(model.before, model.read(model.original, 129))
            self.assertFalse(model.wear_calls)
            self.assertFalse(model.responses)
            self.assertNotIn(model.original, model.destroyed)

    def test_old_equipment_return_failure_uses_real_native_merge_rollback(self):
        for count in (2, 256, 9999):
            model = WearMachine(count, old=True, takeoff=False)
            model.freegrids = 0
            model.wear()
            self.assertEqual(model.before, model.read(model.original, 129))
            self.assertFalse(model.wear_calls)
            self.assertFalse(model.responses)
            self.assertEqual(1, len(model.items))
            self.assertNotIn(model.original, model.destroyed)

    def test_zero_count_and_wrong_types_are_rejected_before_consumption(self):
        for count, kind in ((0, 122), (2, 106), (2, 126)):
            model = WearMachine(count, item_type=kind)
            model.wear()
            self.assertEqual(model.before, model.read(model.original, 129))
            self.assertFalse(model.removals)
            self.assertFalse(model.wear_calls)

    def test_pe_payload_unwind_and_installer_package_preserve_prior_code(self):
        source = original_server()
        result = patch(source)
        self.assertEqual(result, patch(result))
        self.assertEqual(result, BINARY.read_bytes())
        old, new = pefile.PE(data=source), pefile.PE(data=result)
        self.assertEqual(old.FILE_HEADER.NumberOfSections, new.FILE_HEADER.NumberOfSections)
        for before in old.sections:
            actual = bytearray(new.get_data(before.VirtualAddress, before.Misc_VirtualSize))
            if before.Name.startswith(b'.text'):
                for rva, size in ((0x1db2a3, 1), (0x1db378, 5), (0x1db385, 5)):
                    start = rva-before.VirtualAddress
                    actual[start:start+size] = old.get_data(rva, size)
            self.assertEqual(old.get_data(before.VirtualAddress, before.Misc_VirtualSize), actual)
        olddir, newdir = old.OPTIONAL_HEADER.DATA_DIRECTORY[3], new.OPTIONAL_HEADER.DATA_DIRECTORY[3]
        self.assertEqual(old.get_data(olddir.VirtualAddress, olddir.Size),
                         new.get_data(newdir.VirtualAddress, olddir.Size))
        records = [struct.unpack('<III', new.get_data(newdir.VirtualAddress+i, 12))
                   for i in range(0, newdir.Size, 12)]
        self.assertEqual(sorted(records), records)
        package = json.loads(PACKAGE.read_text('utf-8'))
        replay = bytearray(source+b'\0'*(package['targetLength']-len(source)))
        for edit in package['edits']:
            before, after = (base64.b64decode(edit[field]) for field in ('before', 'after'))
            self.assertEqual(before, source[edit['offset']:edit['offset']+len(before)])
            replay[edit['offset']:edit['offset']+len(after)] = after
        self.assertEqual(result, replay)


def wing_runtime(item_id=6983, count=200, old=0):
    lua = LuaRuntime(unpack_returned_tuples=True)
    lua.execute('''
bag={}; props={}; var={}; tips={}; removals={}; additions={}
freeGrids=10; failAdd=false; failRemove=false; dealing=false
PROP_ACTOR_SWINGID=1; PROP_ACTOR_SWINGEQUITMNET=2; ttFlyTip=1
LogIds={}; BaseTypes={ActorEventId={}}; EventCallDispatcher={registerEventCall=function() end}
Actor={
 isDealing=function() return dealing end,
 getUIntProperty=function(_,p) return props[p] or 0 end,
 setUIntProperty=function(_,p,v) props[p]=v end,
 getStaticVar=function() return var end,
 collectOperate=function() end,
 sendTipmsg=function(_,s) tips[#tips+1]=s end,
 removeItemByPtr=function(_,p,n)
  assert(n==1 and not p.destroyed)
  if failRemove then return 0 end
  p.count=p.count-n;removals[#removals+1]=n
  if p.count==0 then p.destroyed=true;bag[p.id]=nil end
  return n
 end,
 addItem=function(_,id,a,b,n,bind,c,comment,log,x,y,z,w,tao)
  assert(n==1 and tao==6)
  if failAdd then return 0 end
  local p=bag[id]
  if p and p.count<9999 then p.count=p.count+1
  elseif freeGrids>0 then freeGrids=freeGrids-1;bag[id]={id=id,count=1,tao=tao}
  else return 0 end
  additions[#additions+1]={id=id,count=n,tao=tao};return n
 end,
}
Item={ipItemID=1,
 getBagItemPtrByGuid=function(_,guid) for _,p in pairs(bag) do if p.guid==guid then return p end end end,
 getItemProperty=function(_,p,k) assert(not p.destroyed and k==1);return p.id end,
 getBagEmptyGridCount=function() return freeGrids end,
 getAddItemNeedGridCount=function(_,id,n)
  local p=bag[id];return p and p.count+n<=9999 and 0 or 1
 end,
 createItem=function() error('No temporary item may outlive native merge') end,
 setItemProperty=function() error('Do not access an inserted/merged item pointer') end,
}
DataPack={readUint64=function(p) return p.guid end,allocPacket=function() return {} end,
 writeInt=function() end,flush=function() end}
System={getIntByte=function(v,i) return math.floor((v or 0)/256^i)%256 end,
 setIntByte=function(v,i,b) v=v or 0;return v+(b-math.floor(v/256^i)%256)*256^i end}
''')
    lua.execute((ITEM_DIR/'SwingEquip.lua').read_text('utf-8-sig'))
    lua.execute((ROOT/'Server/S1001/data/functions/ActorEvent/SwingEquipHandler.lua').read_text('utf-8-sig'))
    lua.globals().props[1] = 684
    lua.globals().props[2] = old
    lua.globals().bag[item_id] = lua.table_from(dict(id=item_id, count=count, guid=42, tao=6))
    return lua


class WingAndResourceTests(unittest.TestCase):
    def test_all_twenty_wing_ids_wear_one_and_return_to_existing_stack(self):
        for item_id in sorted(wing_equipment_ids()):
            for count in (1, 2, 200, 256, 9999):
                with self.subTest(item=item_id, count=count):
                    lua = wing_runtime(item_id, count)
                    g = lua.globals()
                    g.TakeOnSwingEquipment(1, lua.table_from({'guid': 42}))
                    slot = (item_id-6983)//5
                    level = (item_id-6983)%5+1
                    self.assertEqual(level, g.System.getIntByte(g.props[2], slot))
                    self.assertEqual(count-1, g.bag[item_id].count if g.bag[item_id] else 0)
                    self.assertTrue(g.TakeOffSwingEquipment(1, slot+1))
                    self.assertEqual(count, g.bag[item_id].count)
                    self.assertEqual(0, g.System.getIntByte(g.props[2], slot))
                    self.assertEqual(6, g.additions[1].tao)

    def test_wing_replacement_and_failed_return_do_not_drop_equipment(self):
        lua = wing_runtime(6984, 200, old=1); g = lua.globals()
        g.TakeOnSwingEquipment(1, lua.table_from({'guid': 42}))
        self.assertEqual((199, 1, 2), (g.bag[6984].count, g.bag[6983].count, g.props[2]))
        g.failAdd = True
        self.assertFalse(g.TakeOffSwingEquipment(1, 1))
        self.assertEqual((199, 2), (g.bag[6984].count, g.props[2]))
        g.failAdd = False; g.freeGrids = 0
        self.assertTrue(g.TakeOffSwingEquipment(1, 1))
        self.assertEqual(200, g.bag[6984].count)

    def test_wing_trading_removal_failure_and_unactivated_state(self):
        for name in ('dealing', 'failRemove', 'inactive'):
            lua = wing_runtime(); g = lua.globals()
            if name == 'inactive': g.props[1] = 0
            else: setattr(g, name, True)
            g.TakeOnSwingEquipment(1, lua.table_from({'guid': 42}))
            self.assertEqual((200, 0), (g.bag[6983].count, g.props[2]))

    def test_sync_all_copies_and_preserve_every_unrelated_field_and_resource(self):
        ids = appearance_groups()['ride_gear'] | wing_equipment_ids()
        wings = wing_equipment_ids()
        for path in [ITEM_DIR/'StdItems.txt', *sorted((ITEM_DIR/'stdItemForClient').glob('StdItems*.txt'))]:
            relative = path.relative_to(ROOT).as_posix()
            before = subprocess.check_output(['git', 'show', '6e0c613:'+relative], cwd=ROOT)
            after = path.read_bytes()
            self.assertEqual(DUP.sub(rb'\1LIMIT\3', before), DUP.sub(rb'\1LIMIT\3', after))
            olditems = server_items(before) if b'  id=' in before else {}
            for item, block in server_items(after).items() if b'  id=' in after else []:
                if item in ids: self.assertEqual(9999, stack_limit(block))
                elif item in olditems: self.assertEqual(block, olditems[item])
        client = ROOT/'web/v2/lang/zh-cn'
        packed = read_pack((client/'zh-cn.dat').read_bytes())
        oldpack = read_pack(subprocess.check_output(['git', 'show', '6e0c613:web/v2/lang/zh-cn/zh-cn.dat'], cwd=ROOT))
        self.assertEqual([x[0] for x in oldpack], [x[0] for x in packed])
        for (name, old), (_, new) in zip(oldpack, packed):
            if name != 'stditems4.cbp': self.assertEqual(old, new, name)
        source = subprocess.check_output(['git', 'show', '6e0c613:web/v2/lang/zh-cn/stditems4.cbp'], cwd=ROOT)
        _, previous = read_cbp(source)
        _, current = read_cbp((client/'stditems4.cbp').read_bytes())
        found = set()
        for row in previous.children:
            item = int(row.child('id').number())
            if item in wings:
                self.assertEqual(1, row.child('dup').number());row.child('dup').set_number(9999);found.add(item)
        self.assertEqual(wings, found)
        self.assertEqual(previous, current)
        self.assertEqual((client/'stditems4.cbp').read_bytes(), dict(packed)['stditems4.cbp'])


if __name__ == '__main__':
    unittest.main(argv=[sys.argv[0], *remaining], verbosity=2)
