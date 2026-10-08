"""Exercise actual Lua material accounting and installed Flash soul button code."""
from pathlib import Path
import subprocess
import sys
import unittest

from patch_fuhun_all import CLIENT, ROOT, patch_swf
from patch_appearance_upgrade import inspect_abc, pools
from patch_drop_pickup_retry import abc_section, instructions
from test_activity_entries import execute as constructor_execute

sys.path.insert(0, str(Path.home() / "AppData/Local/Temp/codex-lupa"))
from lupa.lua51 import LuaRuntime

BASELINE = "62b92342e20c13484aa10fdf6176ae9c5ab924b1"
SERVER = ROOT / "Server/S1001/data/functions/EquipEnhance/FuHunHandle.lua"
SETUP = r'''
LocalDT = {}; bag = {}; removed = {}; logs = {}; tips = {}; replies = {}
circle = 5; failures = {}; main = {guid=100,id=100,kind=7,circle=5,job=1,dragon=0,super=0,exp=10,level=0,base=0}
Item = {ipItemType='kind',ipItemNeedCircle='circle',ipDragonEquipLevel='dragon',
 ipItemSuperAttrLevel='super',ipItemaddFuHunExp='base',ipItemNeedVocation='job',
 getEquipPtrByGuid=function(_,guid) if main and main.guid==guid then return main end end,
 getBagItemPtrByGuid=function(_,guid) for _,v in ipairs(bag) do if v.guid==guid then return v end end end,
 getItemPtrByIndex=function(_,index) return bag[index+1] end,
 getBagItemCount=function() return #bag end,
 getItemProperty=function(_,ptr,kind) return ptr[kind] end,
 getItemPropertyById=function(id,kind) if main and main.id==id then return main[kind] end
  for _,v in ipairs(bag) do if v.id==id then return v[kind] end end end,
 getItemId=function(ptr) return ptr.id end,
 getItemGuid=function(ptr) return ptr.guid end,
 getItemGuidStr=function(ptr) return tostring(ptr.guid) end,
 getItemName=function() return '测试戒指' end,
 getFuHunInfo=function(ptr,kind) return kind==1 and ptr.level or ptr.exp end,
 setFuHunInfo=function(_,ptr,kind,value) ptr[kind==1 and 'level' or 'exp']=value end,
}
Actor = {
 getIntProperty=function() return circle end, getName=function() return '测试角色' end,
 sendTipmsg=function(_,message) tips[#tips+1]=message end,
 removeItemByPtr=function(_,ptr,count)
  assert(count==1)
  if failures[ptr.guid] then return 0 end
  for i,v in ipairs(bag) do if v==ptr then table.remove(bag,i);removed[#removed+1]=ptr.guid;return 1 end end
  error('重复扣除材料')
 end,
 collectOperate=function() error('附魂只累加经验，不应自动升级') end,
}
System = {sendCommonLog=function(...) logs[#logs+1]={...} end}
DataPack = {
 readByte=function(packet) return packet.kind end,
 readInt64=function(packet) packet.index=(packet.index or 0)+1;return packet[packet.index] end,
 allocPacket=function() local p={};replies[#replies+1]=p;return p end,
 writeByte=function(p,v) p[#p+1]=v end,flush=function() end,
}
LogicCmd={miscSysEx={sub={cFuHunHandle=64,sFuHunHandle=70}}}
LogIds={zhuangbeifuhun=1,zhuanbeifuhunExpChange=2}
MiscsImplementEx={registerMsgHandler=function(_,fn) handler=fn end}
'''


class ClientVM:
    def __init__(self, abc):
        self.abc = abc
        self.names, self.catalog, self.bodies = inspect_abc(abc)
        self.strings = pools(abc)["strings"][3]
        self.button = {"visible": False}
        self.main = {"series": 100, "max": False}
        self.page = {"_editor": {"fuHunAllButton": self.button},
                     "_tab": {"selectedIndex": 0}, "_mainCell": {"data": self.main},
                     "_consumeCell": {"data": None}, "_getCell": {}, "_mdpmovie_0": {},
                     "_mdpmovie_1": {}, "_image_4": {}, "_image_5": {}, "_lastCell": None,
                     "_curAttr": {}, "_nextAttr": {}, "_label_2": {}}
        self.requests = []
        self.calls = []
        self.tips = []

    def run(self, method, argument=None):
        index = self.catalog["EquipBoostFuHunPage"]["instance"][method][0]
        start, size, limits = self.bodies[index]
        ops = {op.start: op for op in instructions(self.abc[start:start + size])}
        local = {0: self.page, 1: argument}
        stack = []
        pos = 0
        maximum = 0
        for _ in range(10000):
            op = ops[pos]; pos = op.end; kind, args = op.opcode, op.operands
            if kind in range(0xd0, 0xd4): stack.append(local[kind - 0xd0])
            elif kind in range(0xd4, 0xd8): local[kind - 0xd4] = stack.pop()
            elif kind == 0x62: stack.append(local[args[0]])
            elif kind == 0x63: local[args[0]] = stack.pop()
            elif kind == 0x08: local.pop(args[0], None)
            elif kind in (0x60, 0x5d): stack.append({"class": self.names[args[0]]})
            elif kind == 0x66:
                obj = stack.pop(); stack.append(obj.get(self.names[args[0]], {}))
            elif kind in (0x61, 0x68):
                value, obj = stack.pop(), stack.pop(); obj[self.names[args[0]]] = value
            elif kind in (0x24, 0x25): stack.append(args[0])
            elif kind == 0x2c: stack.append(self.strings[args[0]])
            elif kind == 0x20: stack.append(None)
            elif kind in (0x26, 0x27): stack.append(kind == 0x26)
            elif kind == 0x30: stack.pop()
            elif kind == 0x2a: stack.append(stack[-1])
            elif kind == 0x29: stack.pop()
            elif kind in (0x73, 0x80, 0x82): pass
            elif kind == 0x76: stack.append(bool(stack.pop()))
            elif kind == 0x96: stack.append(not stack.pop())
            elif kind == 0xab:
                right, left = stack.pop(), stack.pop(); stack.append(left == right)
            elif kind in (0x46, 0x4f):
                name, count = self.names[args[0]], args[1]
                values = stack[-count:] if count else []
                if count: del stack[-count:]
                target = stack.pop(); result = None
                self.calls.append((name, values))
                if name == "isMax": result = values[0]["max"]
                elif name == "sendFuHunUpgrade": self.requests.append(values)
                elif name == "doFlyTipMsg": self.tips.append(values[0])
                elif name == "isMain": result = self.page["_mainCell"]["data"] is None
                elif name in ("updateAttr", "getTextLabel", "updateGrid"): pass
                else: raise ValueError(f"Unsupported call {name}")
                if kind == 0x46: stack.append(result)
            elif kind in (0x10, 0x11, 0x12, 0x14):
                if kind == 0x10: take = True
                elif kind in (0x11, 0x12): take = bool(stack.pop()) == (kind == 0x11)
                else:
                    right, left = stack.pop(), stack.pop(); take = left != right
                if take: pos = op.branches[0][1]
            elif kind == 0x47:
                self.assert_limits(stack, maximum, limits)
                return
            else: raise ValueError(f"Unsupported opcode {kind:#x}")
            maximum = max(maximum, len(stack))
        raise ValueError("Client method did not terminate")

    @staticmethod
    def assert_limits(stack, maximum, limits):
        assert not stack
        assert maximum <= limits[0], (maximum, limits)


class SoulTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.swf = CLIENT.read_bytes()
        data, (_, _, start, end) = abc_section(cls.swf)
        cls.abc = data[start:end]

    def server(self):
        lua = LuaRuntime(unpack_returned_tuples=True)
        lua.execute(SETUP)
        lua.execute(SERVER.read_text("utf-8-sig"))
        # Use the shipped 5-turn warrior ring experience curve for inheritance.
        lua.execute((ROOT / "Server/S1001/data/config/item/FuHunLevelInfo.lua").read_text("utf-8-sig"))
        return lua

    def material(self, lua, guid, **kwargs):
        data = dict(guid=guid, id=guid, kind=7, circle=5, job=1, dragon=0, super=0, exp=0, level=0, base=20)
        data.update(kwargs)
        lua.globals().bag[len(lua.globals().bag) + 1] = lua.table_from(data)

    def request(self, lua, kind=4, material=None):
        packet = {1: 100, "kind": kind}
        if material is not None: packet[2] = material
        lua.globals().handler(1, 151, lua.table_from(packet))

    def test_all_materials_accounted_once_with_inherited_experience(self):
        lua = self.server()
        for i in range(1, 257): self.material(lua, 1000 + i, super=i % 3, exp=i, level=i % 3)
        expected = lua.eval('''function()
         local n=main.exp
         for _,v in ipairs(bag) do local mult=v.super==0 and 1 or (v.super%2==1 and 3 or 9)
          n=n+v.base*mult+v.exp+calFuHunLevelUpUsedExp(1,v) end
         return n end''')()
        self.request(lua)
        self.assertEqual(lua.globals().main.exp, expected)
        self.assertEqual(len(lua.globals().removed), 256)
        self.assertEqual(len(lua.globals().bag), 0)
        self.assertEqual(len(lua.globals().logs), 256)
        self.assertEqual(len(lua.globals().replies), 1)
        self.assertEqual(lua.globals().replies[1][1], 4)
        self.assertEqual(lua.globals().main.level, 0)
        self.request(lua)
        self.assertEqual(lua.globals().main.exp, expected)
        self.assertEqual(len(lua.globals().removed), 256)

    def test_material_filter_preserves_other_items(self):
        lua = self.server()
        self.material(lua, 1, kind=6)
        self.material(lua, 2, circle=3)
        self.material(lua, 3, dragon=1)
        self.material(lua, 4, circle=4)
        self.material(lua, 5, circle=12)
        self.request(lua)
        self.assertEqual([lua.globals().bag[i].guid for i in range(1, 4)], [1, 2, 3])
        self.assertEqual(lua.globals().main.exp, 50)

    def test_invalid_main_and_actor_consume_nothing(self):
        for change in ("circle=4", "main=nil", "main.circle=4", "main.kind=5", "main.level=25"):
            lua = self.server(); self.material(lua, 1); lua.execute(change); self.request(lua)
            self.assertEqual(len(lua.globals().removed), 0, change)

    def test_failed_deduction_does_not_grant_experience(self):
        lua = self.server()
        self.material(lua, 1); self.material(lua, 2); self.material(lua, 3)
        lua.execute("failures[2]=true"); self.request(lua)
        self.assertEqual(lua.globals().main.exp, 30)
        self.assertEqual(len(lua.globals().bag), 2)
        self.assertEqual(len(lua.globals().logs), 1)

    def test_single_material_path_still_uses_original_reply(self):
        lua = self.server(); self.material(lua, 1, super=2, exp=17, level=1)
        expected = 10 + 20 * 9 + 17 + lua.globals().calFuHunLevelUpUsedExp(1, lua.globals().bag[1])
        self.request(lua, kind=1, material=1)
        self.assertEqual(lua.globals().main.exp, expected)
        self.assertEqual(lua.globals().replies[1][1], 1)

    def test_button_layout_and_caption(self):
        names, catalog, bodies = inspect_abc(self.abc)
        start, size, limits = bodies[catalog["EquipBoostFuHunPage"]["constructor"]]
        code = self.abc[start:start + size]
        end = next(op.end for op in instructions(code) if op.opcode == 0x68 and names[op.operands[0]] == "_editor")
        local, _, maximum = constructor_execute(code, names, pools(self.abc)["strings"][3], {0: {}}, end=end)
        sprite = local[0]["_editor"]["childCom"][0]
        spec = next(row for row in sprite["childCom"] if row["instanceName"] == "_fuhun_all")
        self.assertEqual(spec["text"], "一键附魂")
        self.assertEqual(spec["move"], "235,11")
        self.assertEqual(spec["className"], "CommonUI.Button.SimpleLinkLabel")
        self.assertLessEqual(maximum, limits[0])

    def test_click_sends_only_selected_equipment(self):
        vm = ClientVM(self.abc); vm.run("onUpgrade", {"currentTarget": vm.button})
        self.assertEqual(vm.requests, [[4, vm.main]])
        self.assertFalse(vm.tips)

    def test_empty_max_and_transfer_tab_do_not_send(self):
        for change in ("empty", "max", "transfer"):
            vm = ClientVM(self.abc)
            if change == "empty": vm.page["_mainCell"]["data"] = None
            elif change == "max": vm.main["max"] = True
            else: vm.page["_tab"]["selectedIndex"] = 1
            vm.run("onUpgrade", {"currentTarget": vm.button})
            self.assertFalse(vm.requests, change)

    def test_visibility_follows_main_selection(self):
        vm = ClientVM(self.abc); vm.run("updateData"); self.assertTrue(vm.button["visible"])
        vm.page["_mainCell"]["data"] = None; vm.run("updateData"); self.assertFalse(vm.button["visible"])
        vm.page["_mainCell"]["data"] = vm.main; vm.page["_tab"]["selectedIndex"] = 1
        vm.run("updateData"); self.assertFalse(vm.button["visible"])
        vm.button["visible"] = True; vm.run("clearSelectData"); self.assertFalse(vm.button["visible"])

    def test_unrelated_client_methods_and_resources_unchanged(self):
        original = subprocess.check_output(["git", "show", f"{BASELINE}:web/GameFrame.swf"], cwd=ROOT)
        before, (_, _, start, end) = abc_section(original)
        old = before[start:end]
        after, (_, _, new_start, new_end) = abc_section(self.swf)
        self.assertEqual(before[end:], after[new_end:])
        _, old_catalog, old_bodies = inspect_abc(old)
        _, new_catalog, new_bodies = inspect_abc(self.abc)
        self.assertEqual(old_catalog, new_catalog)
        allowed = {"constructor", "initEvent", "removeEvent", "onUpgrade", "updateData", "clearSelectData", "onUpgradeRes"}
        page = old_catalog["EquipBoostFuHunPage"]
        allowed_ids = {page["constructor"]} | {value[0] for key, value in page["instance"].items() if key in allowed}
        changed = set()
        for index, (at, size, limits) in old_bodies.items():
            nat, nsize, nlimits = new_bodies[index]
            if old[at:at + size] != self.abc[nat:nat + nsize] or limits != nlimits: changed.add(index)
        self.assertEqual(changed, allowed_ids)
        self.assertEqual(patch_swf(self.swf), self.swf)


if __name__ == "__main__":
    unittest.main()
