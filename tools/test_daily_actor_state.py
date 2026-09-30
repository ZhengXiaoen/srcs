"""Regress daily completion with the shipped engine's actual CCLVariant userdata.

Runs an isolated copy of the engine's variable bridge, not a game server. No
live process or database is modified. Requires Windows x64, Lua 5.1 lupa and
pefile. The engine hash guards the internal addresses used below. Source is
compiled by standard Lua 5.1 before loading into the isolated engine runtime;
the game executable's startup and CRT initialization are deliberately skipped.

The real Quest_ShuaXin, OnPlayerLevelUp, liveness and growth-gift handlers run.
Only external game APIs are simulated. --baseline checks that the pre-fix code
reproduces the three reported symptoms (missing main task, repeat gifts, days
nil error).
"""

import argparse
import ctypes as c
import hashlib
import os
import subprocess
import sys
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
FUNCTIONS = ROOT / 'Server/S1001/data/functions'
NPC = 'NpcMiscFun/SanRenNPC/MapNpc/ZhanWuShuang.lua'
ENGINE_HASH = '6c3dc87475d4e04bb7dcc5301ec47689480fab987298dffbb09943a214ee63cf'

parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--lua-path', type=Path)
parser.add_argument('--engine-deps', type=Path, help='Directory containing pefile')
parser.add_argument('--baseline', action='store_true')
parser.add_argument('--baseline-ref', default='037ff22', help='Pre-fix revision to reproduce')
parser.add_argument('--worker', type=Path, help=argparse.SUPPRESS)
args = parser.parse_args()
if os.name != 'nt' or c.sizeof(c.c_void_p) != 8:
    raise SystemExit('This native bridge regression requires Windows x64')
for dependency in (args.lua_path, args.engine_deps):
    if dependency:
        sys.path.insert(0, str(dependency))
import pefile
from lupa.lua51 import LuaRuntime

src = ROOT / 'Server/S1001/x64/LogicServerCQ64_R.exe'
if hashlib.sha256(src.read_bytes()).hexdigest() != ENGINE_HASH:
    raise SystemExit('Engine version changed: audit the internal addresses first')

# Let the OS dispose the isolated native VM before its parent removes the DLL.
# The engine's CRT startup is intentionally absent, so unloading C++ callbacks
# while Python is still finalizing could call into an unmapped module.
if args.worker is None:
    with tempfile.TemporaryDirectory(prefix='SRCS-DailyState-') as directory:
        command = [sys.executable, str(Path(__file__).resolve()), '--worker', directory]
        for flag, value in (('--lua-path', args.lua_path), ('--engine-deps', args.engine_deps)):
            if value:
                command.extend((flag, str(value)))
        if args.baseline:
            command.extend(('--baseline', '--baseline-ref', args.baseline_ref))
        result = subprocess.run(command, cwd=ROOT)
    raise SystemExit(result.returncode)

def report_failure(kind, value, traceback):
    sys.__excepthook__(kind, value, traceback)
    sys.stderr.flush()
    os._exit(1)

sys.excepthook = report_failure
p = pefile.PE(str(src))
p.FILE_HEADER.Characteristics |= 0x2000
p.OPTIONAL_HEADER.AddressOfEntryPoint = 0
out = args.worker / 'bridge.dll'
p.write(str(out))
search = os.add_dll_directory(str(src.parent))
dll = c.WinDLL(str(out))
base = dll._handle

def fn(rva, ret, *signature):
    return c.WINFUNCTYPE(ret, *signature)(base + rva)

# Disable only the isolated runtime's statistics registration.
c.c_int.from_address(base + 0x4e54c8).value = 1
fn(0x3ec9b0, None)()
fn(0x3ec9d0, None)()
L = fn(0x3ad070, c.c_void_p)()
for rva in (0x3caa00, 0x3c71d0, 0x3c9340, 0x3cb600):
    fn(rva, c.c_int, c.c_void_p)(L)
    fn(0x3ab0b0, None, c.c_void_p, c.c_int)(L, 0)
fn(0x3d5e70, None, c.c_void_p)(L)
root = c.create_string_buffer(24)
fn(0x7bb0, None, c.c_void_p)(c.addressof(root))

compiler = LuaRuntime(encoding=None)
compile_source = compiler.eval(b'function(s) return string.dump(assert(loadstring(s))) end')

def run(source):
    code = compile_source(source.encode('utf-8'))
    status = fn(0x3acf80, c.c_int, c.c_void_p, c.c_char_p, c.c_size_t, c.c_char_p)(
        L, code, len(code), b'@daily-state-regression')
    if status == 0:
        status = fn(0x3ac020, c.c_int, c.c_void_p, c.c_int, c.c_int, c.c_int)(L, 0, 0, 0)
    if status:
        message = fn(0x3ab520, c.c_char_p, c.c_void_p, c.c_int, c.c_void_p)(L, -1, None)
        raise RuntimeError(message.decode('utf-8', 'replace'))

def source(file):
    return (FUNCTIONS / file).read_text(encoding='utf-8-sig').rstrip('\0\r\n')

def function(file, name):
    code = source(file)
    start = code.index('function ' + name + '(')
    end = code.find('\nfunction ', start + 1)
    return code[start:end if end != -1 else None]

# Reuse the existing external-API setup, then replace state with real userdata.
import test_main_quest_submit as main
run(main.SETUP)
fn(0x3d5550, c.c_int, c.c_void_p, c.c_void_p)(L, c.addressof(root))
fn(0x3abce0, None, c.c_void_p, c.c_int, c.c_char_p)(L, -10002, b'state')
run("""
PROP_ACTOR_SEX=3;PROP_ACTOR_VOCATION=4;PROP_ENTITY_ID=5
Actor.getIntProperty=function(_,id) if id==PROP_CREATURE_LEVEL then return level elseif id==PROP_ACTOR_VOCATION then return 1 else return 0 end end
Actor.getUIntProperty=Actor.getIntProperty
Actor.getNpcPos=function() return 130,130 end
Actor.hasQuest=function() return true end
Actor.getLegionId=function() return 0 end
Actor.getGuildId=function() return 1 end
System.getDaysSinceOpenServer=function() return 1 end
System.getSpid=function() return 0 end
mailCount=0;System.AddMail=function() mailCount=mailCount+1 end
Fuben.getSceneWidth=function() return 200 end
Fuben.getSceneHeight=function() return 200 end
Fuben.getScenHeight=function() return 200 end
Fuben.getSceenWidth=function() return 200 end
Fuben.getSceneHandleById=function() return 0 end
Fuben.onCanMove=function() return true end
System.telportScene=function(_,id) scene=id end
CreateGuideFollower=function() end;dispatchGuideFollowerEvent=function() end;deleteGuideFollower=function() end
sendHyperLink=function() end
Item.getItemLinkMsg=function(id) return 'item'..id end
TianJiangHongBaoCfg={startLevel1=99};TianJiangHongBaoCfg2={}
SpecialQuest_UpdateTitle=function(_,_,title) lastTitle=title end
MiscsImplement={registerMsgHandler=function() end}
LogicCmd={miscSys={sub={cGrowGiftBag=1,sSendGetReceiveGift=2,sLivenessActivity=3}}}
Lang.ScriptTips=setmetatable({},{__index=function(_,k) return k end});Lang.LogTips={l00215='gift'}
Awards={CheckBagGridCount=function()return true end,Give=function() giftAwards=giftAwards+1 end}
DataPack.readByte=function() return giftId or 1 end
DataPack.allocPacket=function(_,system,command) local p={system=system,command=command,values={}};lastPacket=p;return p end
DataPack.writeByte=function(p,value) table.insert(p.values,value) end
DataPack.writeInt=DataPack.writeByte
DataPack.writeUInt=DataPack.writeByte
giftAwards=0
SendLivenessIconStatus=function()end
GuildXiangYaoChuMoRemaining=function() return 0 end
GuildCaiLiaoRemaining=function() return 0 end
state.days={};state.d={};state.d[2]=9;state.d[7]=10;state.taskflags_val=65
state.RiChangRenWuFlag=1;state.RiChangRenWuFinish=1;state.RiChangRenWuType=0;state.RiChangRenWuIndex=1
state.levelGiftBag={};state.levelGiftBag[1]=1
""")

run(source('StdTask.lua') + '\n_G.task_all=task_all')
run(source('ActorFlags.lua'))
run(source('NpcMiscFun/SanRenNPC/ZhuXianRenWu.lua'))
run(function('SpecialQuest.lua', 'Quest_ShuaXin'))
run(function('player.lua', 'checkIsFinishTask'))
run(function('player.lua', 'OnPlayerLevelUp'))
for config in ('LivenessActivityCfg.lua', 'LevelGrowthReward.lua'):
    run((ROOT / 'Server/S1001/data/config/activity' / config).read_text(encoding='utf-8-sig'))
run(source('Activity/LivenessActivity.lua'))
run(source('Activity/GetGrowGiftBag.lua'))
run(source('Activity/GetGrowGfitNum.lua'))
npc = source(NPC)
if args.baseline:
    npc = subprocess.check_output(['git', 'show', args.baseline_ref + ':' +
          (FUNCTIONS / NPC).relative_to(ROOT).as_posix()], cwd=ROOT).decode('utf-8-sig')
run(npc)
dispatcher = source('NpcMiscFun/NpcEventDispatcher.lua')
run(dispatcher[dispatcher.index('function OnNpcEvent('):dispatcher.index('function OnNpcTimer(')])

run("""
NpcDialog[251]=GetNpcRiChangChuMo()
level=59
MakeTheConfigSame()
state.taskflags_val=64;state.RiChangRenWuFlag=0;state.RiChangRenWuFinish=0;state.RiChangRenWuIndex=2;state.d[2]=10
dynamic.nowNumberOfStep=1
OnNpcEvent({},251,'rcJieShouRenWu')
assert(state.taskflags_val==65,'accept must advance one step')
assert(state.RiChangRenWuFlag==1,'daily not accepted')
assert(state.d[2]==9,'wrong remaining count')
state.RiChangRenWuFinish=1;scene=9
Actor.addExp=function(actor,amount)
 exp=exp+amount
 if amount>=2500000 then
  local ok,message=pcall(GetLivenessActivityInfo,actor)
  callbackError=not ok and message or nil
  local old=level;level=62;OnPlayerLevelUp(actor,old)
 end
end
""")

if args.baseline:
    run("""
OnNpcEvent({},251,'rcWanChengRenWu')
assert(state.taskflags_val==nil,'baseline must lose main progress')
assert(state.levelGiftBag==nil,'baseline must lose gift flags')
assert(string.find(lastTitle,'打boss,送特戒',1,true),'baseline must show end-of-main title')
assert(callbackError and string.find(callbackError,"field 'days'",1,true),'baseline must reproduce days nil during reward callback')
MiscsImplement.handleGetGiftBagOp({},0,{})
assert(giftAwards==1,'baseline must allow previously claimed gift again')
""")
    print('PASS: old daily submission reproduces lost main progress, repeat gift and days nil')
else:
    run("""
OnNpcEvent({},251,'rcWanChengRenWu')
assert(callbackError==nil,'reward callback raised days nil')
assert(state.taskflags_val==65,'main task lost')
assert(state.levelGiftBag[1]==1,'claimed gift lost')
assert(string.find(lastTitle,'提升等级',1,true),'wrong main title')
assert(not string.find(lastTitle,'打boss,送特戒',1,true),'main finished early')
assert(exp==2500000,'wrong exp')
assert(inner==10000,'wrong inner')
assert(state.days.KoRccmTime==1,'wrong daily count')
assert(state.d[2]==9,'daily attempts reset')
assert(state.days.LivenessData.xiangyaochumo==1,'liveness lost')
GetLivenessActivityInfo({})
MiscsImplement.handleGetGiftNumOp({},0,{})
assert(lastPacket.system==139 and lastPacket.command==94,'wrong gift-state packet')
assert(lastPacket.values[1]==1 and lastPacket.values[3]==1,'client must receive already-claimed flag')
MiscsImplement.handleGetGiftBagOp({},0,{})
assert(giftAwards==0,'gift claimed twice')
OnNpcEvent({},251,'rcWanChengRenWu')
assert(exp==2500000 and inner==10000,'daily claimed twice')
OnNpcEvent({},37,'onAcceptTask')
assert(state.taskflags_val==66,'following main task blocked')
""")
    print('PASS: first acceptance, reward-triggered upgrade, real quest refresh, liveness, gift packet and following main task')
    run("""
-- Existing characters and repeated dailies must preserve every permanent mark.
for index=1,7 do
 state.taskflags_val=65;state.give55LvGift=1;state.give40LvGift=1
 state.levelGiftBag[1]=1;state.days.keep=123;state.days.KoRccmTime=0
 state.newdays={};state.newdays.keep=456;state.extflags=789
 state.RiChangRenWuFlag=1;state.RiChangRenWuFinish=1;state.RiChangRenWuType=0;state.RiChangRenWuIndex=index;state.d[7]=10
 level=59;exp=0;inner=0;mailCount=0
 OnNpcEvent({},251,'rcWanChengRenWu')
 assert(state.taskflags_val==65 and state.levelGiftBag[1]==1,'permanent progress lost')
 assert(state.days.keep==123 and state.newdays.keep==456 and state.extflags==789,'unrelated data changed')
 assert(inner==10000,'inner reward changed')
 assert(mailCount==0,'upgrade resent already-issued gift mail')
end
-- A missing daily table is initialized without replacing permanent state.
state.days=nil;state.taskflags_val=65;state.RiChangRenWuIndex=2;state.RiChangRenWuFlag=1;state.RiChangRenWuFinish=1;state.d[7]=10
level=59;exp=0;inner=0
OnNpcEvent({},251,'rcWanChengRenWu')
assert(state.taskflags_val==65 and state.levelGiftBag[1]==1,'nil-days initialization overwrote progress')
assert(state.days.KoRccmTime==1,'daily state not initialized')
-- Completion without an upgrade must retain the same permanent records.
Actor.addExp=function(_,amount) exp=exp+amount end
state.RiChangRenWuIndex=2;state.RiChangRenWuFlag=1;state.RiChangRenWuFinish=1;state.d[7]=10
level=62;exp=0;inner=0
OnNpcEvent({},251,'rcWanChengRenWu')
assert(state.taskflags_val==65 and state.levelGiftBag[1]==1,'non-upgrade completion overwrote progress')
-- An unclaimed gift remains claimable once, and only once.
giftId=2;giftAwards=0
MiscsImplement.handleGetGiftBagOp({},0,{})
assert(giftAwards==1 and state.levelGiftBag[2]==1,'unclaimed gift blocked')
MiscsImplement.handleGetGiftBagOp({},0,{})
assert(giftAwards==1,'new gift claimed twice')
""")
    print('PASS: existing/nil daily state, 7 reward bands, upgrade/no upgrade, mail flags and one-time gifts')

# The worker owns the isolated VM; process exit releases it without calling
# the uninitialized game CRT teardown. The parent then removes the DLL copy.
sys.stdout.flush()
os._exit(0)
