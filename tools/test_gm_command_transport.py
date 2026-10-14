"""Replay actual AVM2 chat packets through the shipped native GM parser.

Ruffle executes button clicks and ChatCC/CustomByteArray serialization offline.
Unicorn executes the server chat receiver, token parser and @func callback;
only packet reads, game APIs, CRT and ScriptValueList storage are replaced.
No live sockets, accounts, game services or databases are touched.
"""
import functools
import os
from pathlib import Path
import re
import struct
import subprocess
import sys
import unittest

DEPS = Path(__file__).resolve().parent/'fixtures/pickup-test-deps'
sys.path.insert(0, str(DEPS))

from patch_activity_entries import q, relocate
from patch_appearance_upgrade import extend_pools, inspect_abc, pools
from patch_drop_pickup_retry import abc_section, instructions
from patch_gm_commands import ACTIONS, CLIENT, PICKUP_LABEL, integer, u
from patch_item_count_u16_client import inspect_abc_full
import test_gm_commands as handlers
from test_gm_open_runtime import build_fixture, run_fixture

BASE, HEAP, STACK, STOP = 0x140000000, 0x20000000, 0x30000000, 0x40000000
BINARY = CLIENT.parent.parent/'Server/S1001/x64/LogicServerCQ64_R.exe'


@functools.lru_cache(maxsize=1)
def image():
    import pefile
    return pefile.PE(str(BINARY)).get_memory_mapped_image()


class NativeGM:
    def __init__(self):
        from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
        from unicorn.x86_const import UC_X86_REG_RSP
        self.u = Uc(UC_ARCH_X86, UC_MODE_64)
        raw = image()
        self.u.mem_map(BASE, (len(raw)+4095)&~4095)
        self.u.mem_write(BASE, raw)
        for addr in [HEAP, STACK, STOP]:self.u.mem_map(addr, 0x40000)
        self.u.mem_write(STOP, b'\xf4')
        self.actor, self.chat = HEAP+0x1000, HEAP+0x2000
        self.u.mem_write(self.chat+8, struct.pack('<Q', self.actor))
        # The real static initializer installs this function entry at startup.
        self.u.mem_write(0x14049b230, struct.pack('<Qi4xQi4x', HEAP+0x3000, 9, 0x1401b0610, 0))
        self.u.mem_write(HEAP+0x3000, b'func\0')
        self.u.mem_write(0x1403f75a8,struct.pack('<Q',STOP+0x100))
        self.u.mem_write(0x1403f7538,struct.pack('<Q',STOP+0x108))
        self.lists, self.calls, self.tips = {}, [], []
        self.u.hook_add(UC_HOOK_CODE, self.hook)
        self.u.reg_write(UC_X86_REG_RSP, STACK+0x20000)

    def text(self, address):
        data = bytearray()
        for i in range(4096):
            byte = self.u.mem_read(address+i, 1)[0]
            if not byte:return data.decode('utf-8')
            data.append(byte)
        raise AssertionError('Unterminated native text')

    def ret(self, value=0):
        from unicorn.x86_const import UC_X86_REG_RAX, UC_X86_REG_RIP, UC_X86_REG_RSP
        sp=self.u.reg_read(UC_X86_REG_RSP)
        address=struct.unpack('<Q',self.u.mem_read(sp,8))[0]
        self.u.reg_write(UC_X86_REG_RAX,value&0xffffffffffffffff)
        self.u.reg_write(UC_X86_REG_RSP,sp+8)
        self.u.reg_write(UC_X86_REG_RIP,address)

    def hook(self, machine, address, size, _):
        from unicorn.x86_const import UC_X86_REG_RCX, UC_X86_REG_RDX, UC_X86_REG_R8
        c,d,e=[machine.reg_read(reg) for reg in [UC_X86_REG_RCX,UC_X86_REG_RDX,UC_X86_REG_R8]]
        if address==STOP:machine.emu_stop();return
        if address in [0x140173980,0x1401aa7d0,0x1401b0610]:
            self.calls.append(('entry',address))
        # Execute the receiver and its GM route, the parser and @func body.
        if any(a<=address<b for a,b in [(0x140173980,0x140173b5d),(0x140174945,0x14017494f),
                                      (0x1401aa7d0,0x1401aab99),(0x1401b0610,0x1401b0824)]):return
        if address==0x14000e000:self.ret(0);return
        if address==0x1400eb7e0:self.ret(9);return
        # Model only the packet-reader boundary; command handling is native.
        if address==0x14017ef20:
            machine.mem_write(d,bytes([self.packet[0]]));self.packet=self.packet[1:];self.ret(c);return
        if address==0x14002d230:
            length=struct.unpack('<H',self.packet[:2])[0]
            value=self.packet[2:2+length]
            assert self.packet[2+length]==0 and length<e
            machine.mem_write(d,value+b'\0');self.packet=self.packet[3+length:];self.ret(length);return
        if address==0x140004710:self.ret(len(self.packet));return
        if address in [0x140039d40,0x140009270]:
            count=4 if address==0x140039d40 else 2
            machine.mem_write(d,self.packet[:count]);self.packet=self.packet[count:];self.ret(c);return
        if address==0x1403c5576:machine.mem_write(c,bytes([d&255])*e);self.ret(c);return
        if address==0x14002c430:
            text=self.text(c);index=text.find(chr(d));self.ret(c+len(text[:index].encode()) if index>=0 else 0);return
        if address==STOP+0x100:
            assert self.text(d)=='func'
            self.ret(0 if self.text(c).lower()=='func' else 1);return
        if address==0x1403c5792:
            value=(self.text(c)+self.text(d)).encode()+b'\0';machine.mem_write(c,value);self.ret(c);return
        if address==0x1403c5582:self.ret(len(self.text(c).encode()));return
        if address==0x1403c557c:machine.mem_write(c,bytes(machine.mem_read(d,e)));self.ret(c);return
        if address==STOP+0x108:
            match=re.match(r'\s*([+-]?\d+)',self.text(c));self.ret(int(match[1]) if match else 0);return
        if address==0x14002e4a0:self.lists[c]=[];self.ret(c);return
        if address==0x140270110:self.lists[c].append(('actor',d));self.ret(c);return
        if address in [0x14002d410,0x14002d580]:self.lists[c].append(self.text(d));self.ret(c);return
        if address==0x14002d370:self.lists[c].append(struct.unpack('<i',struct.pack('<I',d&0xffffffff))[0]);self.ret(c);return
        if address in [0x14000dec0,0x14002ed90,0x14002e740]:self.ret(HEAP+0x4000);return
        if address==0x14033b440:
            self.calls.append(('lua',self.text(d),tuple(self.lists[e])));self.ret(1);return
        if address==0x14002e530:self.ret();return
        if address==0x1402528e0:self.ret(HEAP+0x3000);return
        if address==0x1403e2310:self.ret();return
        if address==0x1400809b0:self.tips.append(self.text(d));self.ret();return
        raise AssertionError(f'Unexpected native path {address:#x}')

    def receive(self, packet):
        from unicorn.x86_const import UC_X86_REG_RCX,UC_X86_REG_RDX,UC_X86_REG_R8,UC_X86_REG_RSP
        sp=STACK+0x20000
        self.packet=packet
        self.u.mem_write(sp,struct.pack('<Q',STOP)+bytes(0x200))
        self.u.reg_write(UC_X86_REG_RSP,sp)
        for reg,val in [(UC_X86_REG_RCX,self.chat),(UC_X86_REG_RDX,1),(UC_X86_REG_R8,HEAP+0x5000)]:
            self.u.reg_write(reg,val)
        self.u.emu_start(0x140173980,STOP+1,count=100000)
        assert not self.packet,'Native receiver left packet fields unread'
        calls=[call for call in self.calls if call[0]=='lua']
        assert len(calls)==1 and calls[0][1]=='gmCommand'
        assert calls[0][2][0]==('actor',self.actor)
        assert all(('entry',entry) in self.calls for entry in [0x140173980,0x1401aa7d0,0x1401b0610])
        return [call[2] for call in calls]


def command_cases():
    values={'TestChangeJob':'2','setbossrate':'1.5','GiveTotal':'起源','togglebosspay':'0'}
    for label,command,_,mode,_ in ACTIONS:
        if mode>1:continue
        yield command,''
        if mode:yield command,values.get(command,'100')
        if mode and command.startswith('set') and command!='setlevel':yield command,'0'
        if command=='togglebosspay':yield command,'1'


def pickup_profiles():
    yield [0]*22
    yield [31]*22
    yield [i%16+(16 if i%2 else 0) for i in range(1,23)]


def transport_fixture(source, gm_level=9):
    import zlib
    source=build_fixture(source,gm_level)
    data,(tag,payload,a,b)=abc_section(source)
    include_pickup=PICKUP_LABEL in pools(data[a:b])['strings'][3]
    texts=['GM_PACKET','|','普通聊天','2026/10/14','GM_TRANSPORT_DONE','click','']
    texts += [value for _,value in command_cases()]
    direct=['@func gmCommand "gmAbsorbBosses"','@func gmCommand "killAll"',
            '@func gmCommand "setlevel" "100" extra','@func gmCommand "killAll" 1','普通聊天']
    texts += direct
    abc,ss,added=extend_pools(data[a:b],texts,[('','trace')])
    names,cat,_=inspect_abc(abc);full=inspect_abc_full(abc);pool=pools(abc)
    def name(value):
        return next(i for i,n in enumerate(pool['names'][3]) if n and n[0]==7 and names[i]==value)
    def st(value):return q(0x2c,ss[value])
    def get(obj,value):return obj+q(0x66,name(value))
    def call(obj,value,*args):return obj+b''.join(args)+q(0x4f,name(value),len(args))
    edits=[]
    def replace(mid,code,stack=10):
        old=full['bodies'][mid];limits=list(old['limits']);limits[0]=max(stack,limits[0])
        assert not old['exceptions'] and old['body_traits']==b'\0'
        edits.append((old['record_start'],old['end'],u(mid,*limits,len(code))+code+b'\0\0'))
    # Bridge the immediate-chat event to its real sender at the event boundary.
    replace(cat['ChatFunc']['static']['doChatMessage'][0],
            b'\xd0\x30'+call(q(0x60,name('ChatCC')),'sendChatMessage',b'\xd2',b'\xd1')+b'\x47')
    # Deterministic time dependency; actual CustomByteArray writes are retained.
    replace(cat['DateTimeUtils']['static']['toDateTimeString'][0],b'\xd0\x30'+st('2026/10/14')+b'\x48')
    replace(cat['GlobalFunc']['static']['getCurrentServerDate'][0],
            b'\xd0\x30'+q(0x5d,name('Date'))+q(0x4a,name('Date'),0)+b'\x48')
    mid=cat['ChatCC']['static']['sendChatMessage'][0];code=full['bodies'][mid]['code']
    ops=instructions(code)
    socket=next(op.start for op in ops if op.opcode==0x60 and names[op.operands[0]]=='MainGameSocket')
    packet=q(0x62,6)
    capture=packet+integer(0)+q(0x61,name('position'))
    capture+=q(0x5d,added['trace'])+st('GM_PACKET')
    for method in ['readUnsignedByte']*3+['readCustomBytes','readUnsignedInt','readUnsignedShort']:
        capture+=st('|')+b'\xa0'+packet+q(0x46,name(method),0)+b'\xa0'
    capture+=q(0x4f,added['trace'],1)+b'\x47'
    replace(mid,code[:socket]+capture)
    mid=cat['GameFrame']['instance']['onAddToStage'][0];code=full['bodies'][mid]['code']
    page=b'\xd3'
    language=get(q(0x60,name('LangManager')),'Lang')
    clicks=language+b''.join(st('') for _ in range(27))+q(0x56,27)+q(0x61,name('chat'))
    for command,value in command_cases():
        index=next(i for i,action in enumerate(ACTIONS) if action[1]==command)
        clicks+=get(page,'_gmInput')+st(value)+q(0x61,name('text'))
        button=get(page,'_gmButtons')+integer(index)+q(0x66,44065)
        clicks+=call(button,'dispatchEvent',q(0x5d,name('MouseEvent'))+st('click')+q(0x4a,name('MouseEvent'),1))
    if include_pickup:
        config=get(q(0x60,name('GlobalData')),'systemConfigDataMgr')
        clicks+=q(0x60,name('GlobalData'))+q(0x5d,name('SystemConfigDataMgr'))+q(0x4a,name('SystemConfigDataMgr'),0)+q(0x61,name('systemConfigDataMgr'))
        button=get(b'\xd2','userData')+integer(2)+q(0x66,44065)+integer(8)+q(0x66,44065)
        for profile in pickup_profiles():
            for pickup_type,value in enumerate(profile,1):
                clicks+=call(config,'setPickUpSelectIndexByType',integer(pickup_type),integer(value%16))
                clicks+=call(config,'setPickUpSelectByType',integer(pickup_type),integer(0),b'\x26' if value>=16 else b'\x27')
                # The name-display toggle deliberately differs from pickup.
                clicks+=call(config,'setPickUpSelectByType',integer(pickup_type),integer(1),b'\x27' if value>=16 else b'\x26')
            clicks+=call(button,'dispatchEvent',q(0x5d,name('MouseEvent'))+st('click')+q(0x4a,name('MouseEvent'),1))
    for command in direct:
        # All send through the same production transport as the buttons.
        clicks+=call(q(0x60,name('ChatCC')),'sendChatMessage',integer(1),st(command))
    clicks+=q(0x5d,added['trace'])+st('GM_TRANSPORT_DONE')+q(0x4f,added['trace'],1)
    # Before DONE, the real command page is in local3 and initialized.
    point=next(op.start for op in instructions(code) if op.opcode==0x5d and
               code[op.start:op.start+20].find(q(0x2c,pool['strings'][3].index('GM_HARNESS_CATEGORIES_OK')))>=0)
    code,_=relocate(code,[(point,point,clicks)]);replace(mid,code,30)
    for start,end,value in sorted(edits,reverse=True):abc=abc[:start]+value+abc[end:]
    output=data[:tag+2]+struct.pack('<I',a-payload+len(abc))+data[payload:a]+abc+data[b:]
    output=output[:4]+struct.pack('<I',len(output))+output[8:]
    return output[:8]+zlib.compress(output[8:],9)


def runtime_packets(source):
    output=run_fixture(os.environ['GM_RUFFLE_EXE'],source,fixture_builder=transport_fixture)
    if 'GM_TRANSPORT_DONE' not in output or 'ERROR ruffle_core::avm2' in output:
        raise AssertionError(output)
    packets=[]
    for match in re.finditer(r'avm_trace: GM_PACKET\|(\d+)\|(\d+)\|(\d+)\|([^\r\n|]*)\|(\d+)\|(\d+)',output):
        system,sub,channel,text,sign,length=match.groups()
        assert (int(system),int(sub))==(9,1)
        raw=text.encode('utf-8')
        packets.append((text,struct.pack('<BH',int(channel),len(raw))+raw+b'\0'+struct.pack('<IH',int(sign),int(length))))
    return packets


@unittest.skipUnless(os.environ.get('GM_RUFFLE_EXE'),'Set GM_RUFFLE_EXE for AVM2 packet replay')
class GMTransportTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):cls.packets=runtime_packets(CLIENT.read_bytes())

    def test_previous_client_reproduces_extra_timestamp_argument(self):
        previous=subprocess.check_output(['git','show','db51213:web/GameFrame.swf'],cwd=CLIENT.parent.parent)
        packets=runtime_packets(previous)
        query=next(p for text,p in packets if text.startswith('@func gmCommand "whatday"'))
        recharge=next(p for text,p in packets if text.startswith('@func gmCommand "GmRecharge" ""'))
        for packet,expected in [(query,('whatday',0)),(recharge,('GmRecharge','',0))]:
            args=NativeGM().receive(packet)[0]
            self.assertEqual(expected,args[1:])
            handler=handlers.GmCommandTests();handler.setUp()
            handler.command(*args[1:])
            handler.check("assert(mutations==0 and string.find(messages[#messages],'参数数量不正确'))")

    def test_all_lua_buttons_reach_handlers_with_expected_arguments_and_defaults(self):
        expected=list(command_cases())
        self.assertEqual(len(expected)+5+len(list(pickup_profiles())),len(self.packets))
        for (command,value),(text,packet) in zip(expected,self.packets):
            with self.subTest(command=command,value=value):
                self.assertNotIn('<ST>',text)
                args=NativeGM().receive(packet)[0]
                cfg_args=(command,value) if next(a[3] for a in ACTIONS if a[1]==command) else (command,)
                self.assertEqual(cfg_args,args[1:])
                handler=handlers.GmCommandTests();handler.setUp()
                handler.lua.globals().observed=None
                handler.lua.execute('_G["'+command+'"] = function(_,value) observed={value=value} end')
                handler.command(*args[1:])
                handler.check('assert(observed~=nil)')
                handler.lua.globals().command_name=command
                handler.lua.globals().input_value=value
                handler.check("""
local cfg=LocalDT.GmCommandConfig[command_name]
local expected=nil
if cfg.kind=='number' then
 if input_value=='' then
  if not cfg.optional then expected=cfg.uiDefault or cfg.default end
 else expected=tonumber(input_value) end
elseif cfg.kind=='suite' then
 expected=input_value=='' and cfg.default or input_value
end
assert(observed.value==expected,command_name)
""")
                handler.check("for _,message in ipairs(messages) do assert(not string.find(message,'参数数量不正确')) end")
                self.assertEqual(len(text.encode()),struct.unpack('<H',packet[-2:])[0])
        for expected,(text,packet) in zip(['gmAbsorbBosses','killAll'],self.packets[-5:-3]):
            self.assertEqual((expected,),NativeGM().receive(packet)[0][1:])

    def test_pickup_button_transports_live_player_configuration_as_one_argument(self):
        start=len(list(command_cases()))
        for profile,(text,packet) in zip(pickup_profiles(),self.packets[start:-5]):
            profile_text=','.join(map(str,profile))
            self.assertEqual('@func gmCommand "gmPickupAll" "'+profile_text+'" ',text)
            self.assertNotIn('<ST>',text)
            self.assertEqual(('gmPickupAll',profile_text),NativeGM().receive(packet)[0][1:])
            self.assertEqual(len(text.encode()),struct.unpack('<H',packet[-2:])[0])

    def test_real_handlers_receive_values_and_extra_arguments_stay_rejected(self):
        assertions={'GmRecharge':"assert(calls.recharge[2]==1000)",
                    'whatday':"assert(#messages==1)",'ckmapid':"assert(#messages==1)",
                    'setlevel':"assert(props[PROP_CREATURE_LEVEL]==255)",
                    'TestChangeJob':"assert(player.job==2)",
                    'GmOneKeyFullAttribute':"assert(props[PROP_CREATURE_LEVEL]==255)",
                    'setbossrate':"assert(svar.bossPayMoneyBaseRate==1.5)",
                    'GiveTotal':"assert(#added==8 and added[1].id==586)"}
        selected={'TestChangeJob':'2','setbossrate':'1.5','GiveTotal':'起源'}
        for command,check in assertions.items():
            index=list(command_cases()).index((command,selected.get(command,'')))
            args=NativeGM().receive(self.packets[index][1])[0]
            handler=handlers.GmCommandTests();handler.setUp();handler.command(*args[1:]);handler.check(check)
        for command,check in [('GmRecharge',"assert(calls.recharge[2]==100)"),
                              ('setlevel',"assert(props[PROP_CREATURE_LEVEL]==100)")]:
            index=list(command_cases()).index((command,'100'))
            args=NativeGM().receive(self.packets[index][1])[0]
            handler=handlers.GmCommandTests();handler.setUp();handler.command(*args[1:]);handler.check(check)
        for text,packet in self.packets[-3:-1]:
            args=NativeGM().receive(packet)[0]
            handler=handlers.GmCommandTests();handler.setUp();handler.command(*args[1:])
            handler.check("assert(mutations==0 and next(calls)==nil and string.find(messages[#messages],'参数数量不正确'))")

    def test_normal_chat_retains_timestamp_and_original_length(self):
        text,packet=self.packets[-1]
        self.assertEqual('普通聊天<ST>2026/10/14</ST>',text)
        self.assertEqual(len('普通聊天'.encode()),struct.unpack('<H',packet[-2:])[0])
        self.assertNotEqual(0,struct.unpack('<I',packet[-6:-2])[0])


if __name__=='__main__':unittest.main()
