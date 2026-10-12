"""Run the complete GM window in Ruffle with the shipped UI classes and skins.

Set GM_RUFFLE_EXE to an existing Ruffle executable, then run this file.
The offline fixture replaces only game startup, omits the discarded mainActor.gm
read, and exposes the GM window's page controls through userData for inspection.
It never logs in or sends GM commands. Socket connections are denied.
"""
from pathlib import Path
import os
import struct
import subprocess
import tempfile
import time
import unittest
import zlib

from patch_activity_entries import q
from patch_appearance_upgrade import extend_pools, inspect_abc, pools
from patch_drop_pickup_retry import abc_section, instructions
from patch_gm_commands import CLASS, CLIENT, integer, u
from patch_guild_quest_config import read_cbp
from patch_item_count_u16_client import inspect_abc_full

ROOT = CLIENT.parent.parent
Q = {'Loader':3246, 'URLRequest':48, 'Event':2, 'MouseEvent':5,
     'TextFormat':57, 'Role':413, 'GameLanguage':11035, 'LangManager':1562,
     'SkinMgr':6330, 'UIManager':3111, 'GlobalData':1507,
     'CustomerServiceWin':293, 'getInstance':34201, 'initSkin':35059,
     'initialize':32962, 'defaultTextFormat':1734, 'Lang':31947,
     'customerService':11270, 'role':11237, 'name':3144, 'gmLevel':4202,
     'gameWidth':31066, 'gameHeight':31067, 'onAddToStage':1030,
     'contentLoaderInfo':43590, 'currentTarget':43310, 'COMPLETE':42611,
     'addEventListener':13671, 'dispatchEvent':13673, 'load':1966,
     'addChild':1868, 'removeChild':1869, 'userData':1622,
     '_pageCtrl':5577, '_navBar':5575, 'getPage':15593, 'selectedIndex':6104,
     'index':44065}


def build_fixture(source, gm_level=9):
    data, (tag, payload, start, end) = abc_section(source)
    _, lang = read_cbp((CLIENT.parent/'v2/lang/zh-cn/clientlang.cbp').read_bytes())
    labels = [node.value.decode('utf-8') for node in
              next(node for node in lang.children if node.name=='customerService').children]
    skin_url = (CLIENT.parent/'v2/commonasset/gameskin.swf').as_uri()
    phases = ['START', 'SKIN_OK', 'WINDOW_OK', 'CATEGORIES_OK', 'REOPEN_OK', 'DONE']
    texts = labels + ['GM_HARNESS_'+phase for phase in phases]
    texts += ['SimSun', 'GM runtime test', skin_url, 'click']
    abc, strings, added = extend_pools(data[start:end], texts, [('', 'trace')])
    names, catalog, _ = inspect_abc(abc)
    full = inspect_abc_full(abc)
    for name, index in Q.items():
        if name!='index' and names[index]!=name:
            raise ValueError('Unexpected runtime fixture QName: '+name)
    table = pools(abc)
    def public_name(name):
        return next(i for i, value in enumerate(table['names'][3])
                    if value and value[0]==7 and value[1]==1 and names[i]==name)
    def st(text):return q(0x2c, strings[text])
    def trace(phase):return q(0x5d, added['trace'])+st('GM_HARNESS_'+phase)+q(0x4f,added['trace'],1)
    def get(obj,name):return obj+q(0x66, Q[name])
    def put(obj,name,value):return obj+value+q(0x61, Q[name])
    def build(name,*args):return q(0x5d,Q[name])+b''.join(args)+q(0x4a,Q[name],len(args))
    def call(obj,name,*args):return obj+b''.join(args)+q(0x4f,Q[name],len(args))
    def global_(name):return q(0x60,Q[name])
    this, loader, win, page = b'\xd0', b'\xd1', b'\xd2', b'\xd3'
    ctor=this+b'\x30'+this+b'\x49\0'+trace('START')
    ctor+=build('Loader')+b'\xd5'+call(this,'addChild',loader)
    ctor+=call(get(loader,'contentLoaderInfo'),'addEventListener',
               get(global_('Event'),'COMPLETE'),get(this,'onAddToStage'))
    ctor+=call(loader,'load',build('URLRequest',st(skin_url)))+b'\x47'
    code=this+b'\x30'+call(global_('SkinMgr'),'initSkin',get(loader,'currentTarget'))+trace('SKIN_OK')
    code+=call(global_('UIManager'),'initialize',this)
    code+=put(global_('UIManager'),'defaultTextFormat',build('TextFormat',st('SimSun'),integer(12)))
    code+=put(global_('GlobalData'),'role',build('Role'))
    role=get(global_('GlobalData'),'role')
    code+=put(role,'gmLevel',integer(gm_level))+put(role,'name',st('GM runtime test'))
    code+=put(global_('GlobalData'),'gameWidth',integer(1024))
    code+=put(global_('GlobalData'),'gameHeight',integer(768))
    code+=put(global_('LangManager'),'Lang',build('GameLanguage'))
    code+=put(get(global_('LangManager'),'Lang'),'customerService',
              b''.join(st(t) for t in labels)+q(0x56,len(labels)))
    code+=global_('CustomerServiceWin')+q(0x46,Q['getInstance'],0)+b'\xd6'+trace('WINDOW_OK')
    code+=call(this,'addChild',win)
    control=get(win,'userData')+integer(0)+q(0x66,Q['index'])
    nav=get(win,'userData')+integer(1)+q(0x66,Q['index'])
    for tab in range(4 if gm_level>=9 else 2):
        code+=put(nav,'selectedIndex',integer(tab))
    if gm_level>=9:
        code+=control+integer(3)+q(0x46,Q['getPage'],1)+q(0x80,public_class(abc))+b'\xd7'
        for category in range(6):
            button=page+q(0x66,public_name('_gmCategories'))+integer(category)+q(0x66,Q['index'])
            code+=call(button,'dispatchEvent',build('MouseEvent',st('click')))
            result=q(0x5d,added['trace'])+st('click')+integer(category)+b'\xa0'+button+q(0x66,public_name('enabled'))+b'\xa0'+q(0x4f,added['trace'],1)
            code+=result
    code+=trace('CATEGORIES_OK')
    for _ in range(3):
        code+=call(this,'removeChild',win)+call(this,'addChild',win)
    code+=trace('REOPEN_OK')+trace('DONE')+b'\x47'
    edits=[]
    def replace(mid,body_code,stack=None,locals_=None):
        old=full['bodies'][mid]
        if old['exceptions'] or old['body_traits']!=b'\0':
            raise ValueError('Unexpected offline fixture body traits')
        instructions(body_code)
        limits=list(old['limits'])
        if stack is not None:limits[0]=max(limits[0],stack)
        if locals_ is not None:limits[1]=max(limits[1],locals_)
        body=u(mid,*limits,len(body_code))+body_code+b'\0\0'
        edits.append((old['record_start'],old['end'],body))
    replace(catalog['GameFrame']['constructor'],ctor,4,2)
    replace(catalog['GameFrame']['instance']['onAddToStage'][0],code,len(labels)+2,4)
    win_mid=catalog['CustomerServiceWin']['constructor']
    original=full['bodies'][win_mid]['code']
    discarded=q(0x60,2834)+q(0x66,32899)+q(0x66,2652)+b'\x29\x47'
    if not original.endswith(discarded):raise ValueError('Unexpected discarded actor read')
    replace(win_mid,original[:-len(discarded)]+b'\x47')
    init_mid=catalog['CustomerServiceWin']['instance']['init'][0]
    original=full['bodies'][init_mid]['code']
    expose=put(this,'userData',get(this,'_pageCtrl')+get(this,'_navBar')+q(0x56,2))
    replace(init_mid,original[:-1]+expose+b'\x47')
    for a,b,value in sorted(edits,reverse=True):abc=abc[:a]+value+abc[b:]
    output=data[:tag+2]+struct.pack('<I',start-payload+len(abc))+data[payload:start]+abc+data[end:]
    output=output[:4]+struct.pack('<I',len(output))+output[8:]
    return output[:8]+zlib.compress(output[8:],9)


def public_class(abc):
    table=pools(abc)
    return next(i for i,value in enumerate(table['names'][3])
                if value and value[0]==7 and table['strings'][3][value[2]]==CLASS)


def run_fixture(executable, source, gm_level=9):
    with tempfile.TemporaryDirectory(prefix='gm-open-') as folder:
        root=Path(folder)
        swf=root/'gm.swf';swf.write_bytes(build_fixture(source,gm_level))
        log_path=root/'runtime.log'
        args=[executable,'--storage','memory','--tcp-connections','deny',
              '--filesystem-access-mode','allow','--open-url-mode','deny',
              '--config',str(root/'config'),'--max-execution-duration','5','--no-gui',str(swf)]
        kwargs={}
        if os.name=='nt':
            startup=subprocess.STARTUPINFO()
            startup.dwFlags|=subprocess.STARTF_USESHOWWINDOW
            startup.wShowWindow=0
            kwargs['startupinfo']=startup
        with log_path.open('wb') as log:
            process=subprocess.Popen(args,stdout=log,stderr=log,
                                     env={**os.environ,'RUST_LOG':'info'},**kwargs)
            try:
                deadline=time.monotonic()+15
                while time.monotonic()<deadline and process.poll() is None:
                    output=log_path.read_text(encoding='utf-8',errors='replace')
                    if 'GM_HARNESS_DONE' in output or 'ERROR ruffle_core::avm2' in output:break
                    time.sleep(0.1)
            finally:
                if process.poll() is None:
                    process.terminate()
                    try:process.wait(timeout=3)
                    except subprocess.TimeoutExpired:process.kill();process.wait()
        return log_path.read_text(encoding='utf-8',errors='replace')


@unittest.skipUnless(os.environ.get('GM_RUFFLE_EXE'),'Set GM_RUFFLE_EXE for the real AVM2 runtime regression')
class OpenGMRuntimeTests(unittest.TestCase):
    def test_previous_client_reproduces_flash_verification_failure(self):
        source=subprocess.check_output(['git','show','5e5792c:web/GameFrame.swf'],cwd=ROOT)
        output=run_fixture(os.environ['GM_RUFFLE_EXE'],source)
        self.assertIn('GM_HARNESS_WINDOW_OK',output,output)
        self.assertIn('VerifyError: Error #1021',output,output)
        self.assertIn('CustomerServiceWin/onAddedToStage()',output,output)

    def test_fixed_window_categories_close_and_reopen(self):
        for gm_level in [3,9]:
            with self.subTest(gm_level=gm_level):
                output=run_fixture(os.environ['GM_RUFFLE_EXE'],CLIENT.read_bytes(),gm_level)
                for phase in ['WINDOW_OK','CATEGORIES_OK','REOPEN_OK','DONE']:
                    self.assertIn('GM_HARNESS_'+phase,output,output)
                self.assertNotIn('ERROR ruffle_core::avm2',output,output)
                if gm_level>=9:
                    for category in range(6):
                        self.assertIn('avm_trace: click'+str(category)+'false',output,output)


if __name__=='__main__':unittest.main()
