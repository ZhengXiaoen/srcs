"""Run the shipped AVM2 lifecycle and compare reopen work against the old release."""
from __future__ import annotations

import subprocess
import unittest

from patch_wanfu_opening import BASELINE, CLIENT, METHODS, patch_swf
from patch_activity_entries import ROOT, QD_ARRAYS, strings_of
from patch_activity_reminders import normalize
from patch_drop_pickup_retry import abc_section, instructions
from patch_god_equip_state import inspect_abc
from test_activity_reminders import execute

PAGES = ['QDLoginPage', 'QDRechargePage', 'QDAccRechargePage', 'QDFlashSalePage',
         'QDHongYunDangTouPage', 'QDConsumePage', 'QDZhenBaoGePage', 'QDHaoLiPage']


def unpack(source):
    raw, (_, _, a, b) = abc_section(source)
    abc, _ = normalize(raw[a:b])
    names, _, bodies = inspect_abc(abc)
    return abc, names, strings_of(abc), bodies


class Window(dict):
    def __setitem__(self, key, value):
        if key == 'selectedIndex':
            self.vm.run(6040, self, value)
        else:
            super().__setitem__(key, value)


class PageControl(dict):
    def get(self, key, default=None):
        if key == 'activePage':
            return self['pages'][self['activePageIndex']]
        if key == 'pageCount':
            return len(self['pages'])
        return super().get(key, default)


class PageClasses(list):
    def __setitem__(self, key, value):
        if isinstance(key, str): setattr(self, key, value)
        else: super().__setitem__(key, value)

    def get(self, key, default=None): return getattr(self, key, default)


class Lifecycle:
    def __init__(self, data):
        self.abc, self.names, self.strings, self.bodies = data
        self.created = []; self.events = []; self.listeners = []; self.layouts = 0
        self.timers = []; self.calls = []
        self.globals = {n: {'class': n} for n in ('DataEventDispatcher', 'CliffordCC', 'MiscCC')}
        for n in ('MouseEvent', 'Event', 'OtherEvent', 'CliffordEvent', 'PropertyEvent', 'DreamEvent'):
            self.globals[n] = {name: name for name in self.names}
        self.globals.update(GlobalData={'qdActivityDataMgr': {'szQingdian': 0,'rechargeDays':[],
            'rechargeStatu':[],'haoli':None}}, GameData={'qingdianActiveProvider':{'cfg':{'EveryTotalPay':[{}]}}},
            ScrollPolicy={'ON': 'on'}, QingDianActiveWin={'totalOpenDay':3,'openDay':1})
        self.obj = Window(_oldButton=None, _oldIndex=-1, tempClass=None, _pageCtrl=None,
                          _basesprite_0={})
        self.obj.vm = self
        # Arrays are distinct AS3 objects even though their current contents match.
        for field in QD_ARRAYS.values():
            self.obj[field] = PageClasses({'class': name} for name in PAGES)
        for i in (0,1,2,3,10,11,13,14):
            self.obj['_loaderbasebutton_'+str(i)] = {'button': i}

    def run(self, method, obj=None, arg=None, **kwargs):
        a, size, limits = self.bodies[method]
        result, maximum = execute(self.abc[a:a+size], self.names, self.strings,
                                  {0: self.obj if obj is None else obj, 1: arg},
                                  self.globals, self.invoke, **kwargs)
        if maximum > limits[0]:
            raise AssertionError((method, maximum, limits))
        return result

    def invoke(self, obj, name, args):
        self.calls.append((obj, name, args))
        if name == '__construct__':
            cls = obj['class']
            if cls == 'CustomPageControl':
                return PageControl(pages=[], activePageIndex=0)
            page = {'class': cls, 'live': False}
            if cls in PAGES: self.created.append(page)
            return page
        if name == 'push': obj.extend(args)
        elif name == 'addPage': obj['pages'].append(args[0])
        elif name == 'getPage': return obj['pages'][args[0]]
        elif name == 'indexOf': return next((i for i,b in enumerate(obj) if b is args[0]), -1)
        elif name in ('resetnavBar', 'resetInit', 'changePage'):
            return self.run({'resetnavBar':6024,'resetInit':6025,'changePage':6041}[name], obj)
        elif name in ('onLoginResultHandler','onTehuiResultHandler','onAccRecharge','updateHaoLiTips'):pass
        elif name in ('initEvent','removeEvent'):
            self.events.append((obj['class'],name))
            obj['live'] = name == 'initEvent'
        elif name == 'setSelect': obj['selected'] = args[0]
        elif name == 'update':
            if obj is self.obj.get('_scrollPane0'): self.layouts += 1
        elif name in ('addEventListener','removeEventListener'):
            self.listeners.append((id(obj), name, args))
        elif name == 'setTimeout': self.timers.append(args)
        elif name in ('addChild','removeChild','move','setSize'): pass
        else: raise ValueError((name, args))

    def children(self):
        # End before unrelated inherited drag/centering properties.
        a,size,_ = self.bodies[6023]
        end = next(o.start for o in instructions(self.abc[a:a+size]) if o.opcode == 0x5e)
        self.run(6023, end=end)

    def open(self, variant=None):
        if variant is not None: self.globals['GlobalData']['qdActivityDataMgr']['szQingdian'] = variant
        self.run(6026)

    def close(self): self.run(6027)
    def click(self, index): self.run(6039, arg={'currentTarget': self.obj['_buttons'][index]})


class WanfuOpeningTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.before_source = subprocess.check_output(['git','show',BASELINE+':web/GameFrame.swf'],cwd=ROOT)
        cls.source = CLIENT.read_bytes()
        cls.before = unpack(cls.before_source); cls.after = unpack(cls.source)

    def test_baseline_rebuilds_eight_pages_and_initializes_hidden_pages_on_every_open(self):
        vm = Lifecycle(self.before); vm.children()
        self.assertEqual(8,len(vm.created))
        for count in (16,24,32):
            vm.events.clear(); vm.open()
            self.assertEqual(count,len(vm.created))
            self.assertEqual(PAGES,[n for n,event in vm.events if event=='initEvent'])
            vm.close()
        self.assertEqual(6,len(vm.timers))

    def test_repeated_open_reuses_pages_and_only_refreshes_the_default_page(self):
        vm = Lifecycle(self.after); vm.children()
        self.assertEqual([],vm.created)
        for _ in range(20):
            vm.events.clear(); vm.open()
            self.assertEqual(8,len(vm.created))
            self.assertEqual([('QDLoginPage','initEvent')],vm.events)
            self.assertEqual([True]+[False]*7,[p['live'] for p in vm.obj['_pageCtrl']['pages']])
            vm.close()
            self.assertFalse(any(p['live'] for p in vm.created))
            self.assertIsNone(vm.obj['_oldButton'])
        self.assertEqual(20,vm.layouts); self.assertEqual([],vm.timers)
        added=[(obj,args) for obj,name,args in vm.listeners if name=='addEventListener']
        removed=[(obj,args) for obj,name,args in vm.listeners if name=='removeEventListener']
        self.assertEqual(added,removed)

    def test_switches_stop_old_page_activate_new_page_and_same_click_does_no_work(self):
        vm=Lifecycle(self.after);vm.children();vm.open()
        for index in range(1,8):
            vm.events.clear();vm.click(index)
            self.assertEqual([(PAGES[index-1],'removeEvent'),(PAGES[index],'initEvent')],vm.events)
            self.assertEqual([i==index for i in range(8)],[p['live'] for p in vm.created])
            self.assertEqual([i==index for i in range(8)],[b.get('selected',False) for b in vm.obj['_buttons']])
            vm.events.clear();vm.click(index);self.assertEqual([],vm.events)
        vm.close();vm.open()
        self.assertEqual(0,vm.obj['_pageCtrl']['activePageIndex'])
        self.assertEqual(8,len(vm.created))
        for index in (-1,8,99):
            vm.events.clear();vm.run(6040,arg=index);self.assertEqual([],vm.events)
        vm.run(6039,arg=None);vm.run(6039,arg={'currentTarget':None})

    def test_all_five_variants_rebuild_only_when_the_array_changes(self):
        vm=Lifecycle(self.after);vm.children()
        for count,(variant,field) in enumerate(((0,'PAGE_CLASS'),(1,'PAGE_CLASSB'),(2,'PAGE_CLASSC'),
                                               (3,'PAGE_CLASSD'),(4,'PAGE_CLASSE')),1):
            vm.open(variant)
            self.assertIs(vm.obj[field],vm.obj['tempClass'])
            self.assertEqual(count*8,len(vm.created))
            self.assertFalse(any(p['live'] for p in vm.created[:-8]))
            self.assertEqual(PAGES,[p['class'] for p in vm.obj['_pageCtrl']['pages']])
            vm.close();vm.open(variant);self.assertEqual(count*8,len(vm.created));vm.close()

    def test_duration_changes_rebuild_day_dependent_pages_and_same_duration_reuses_them(self):
        vm=Lifecycle(self.after);vm.children();vm.open();vm.close()
        for count,duration in enumerate((7,12,3),2):
            vm.globals['QingDianActiveWin']['totalOpenDay']=duration
            vm.open();self.assertEqual(count*8,len(vm.created))
            self.assertEqual(duration,vm.obj['tempClass'].get('totalOpenDay'))
            vm.close();vm.open();self.assertEqual(count*8,len(vm.created));vm.close()
        vm.globals['QingDianActiveWin']['openDay']=2;vm.open()
        self.assertEqual(40,len(vm.created));self.assertEqual(2,vm.obj['tempClass'].get('openDay'))

    def test_navigator_reopens_the_cached_window_and_legacy_links_select_current_pages(self):
        vm=Lifecycle(self.after);vm.children();vm.open();vm.close()
        a,size,limits=vm.bodies[479];code=vm.abc[a:a+size]
        cache={216:vm.obj}
        # Execute the dictionary guard and creation block of the real navigator.
        _,stack=execute(code,vm.names,vm.strings,{0:{},1:216},
                        {'_winDictionary':cache},lambda *_:self.fail('cached window was reconstructed'),
                        start=479,end=567)
        self.assertIs(vm.obj,cache[216]);self.assertLessEqual(stack,limits[0])
        vm.open()
        retained=(0,1,2,3,8,10,12,13)
        for old in range(-1,17):
            vm.run(6040,arg=0);vm.events.clear();vm.run(6042,arg=old)
            self.assertEqual(retained.index(old) if old in retained else 0,
                             vm.obj['_pageCtrl']['activePageIndex'])
        self.assertEqual(8,len(vm.created))

    def test_actual_recharge_listener_removal_is_symmetric_and_stops_animation(self):
        for data,is_old in ((self.before,True),(self.after,False)):
            vm=Lifecycle(data)
            page={key:{} for key in ('_loaderbasebutton_2','_loaderbasebutton_1','_tabBar','_mdpmovie_0')}
            calls=[]
            def invoke(obj,name,args): calls.append((id(obj),name,args))
            a,size,_=vm.bodies[18058];code=vm.abc[a:a+size]
            end=next(o.start for i,o in enumerate(instructions(code)) if o.opcode==0xd0 and o.start>120)
            _,stack=execute(code,vm.names,vm.strings,{0:page},vm.globals,invoke,end=end)
            added=[(obj,args) for obj,name,args in calls if name=='addEventListener'];calls.clear()
            a,size,limits=vm.bodies[18059]
            _,stack=execute(vm.abc[a:a+size],vm.names,vm.strings,{0:page},vm.globals,invoke)
            removed=[(obj,args) for obj,name,args in calls if name=='removeEventListener']
            self.assertEqual(6,len(added));self.assertLessEqual(stack,limits[0])
            if is_old:self.assertEqual(5,len(removed));self.assertEqual(1,sum(n=='addEventListener' for _,n,_ in calls))
            else:self.assertEqual(added,removed);self.assertFalse(any(n=='addEventListener' for _,n,_ in calls))
            self.assertEqual('stop',calls[-1][1])

    def test_page_requests_are_sent_only_after_selecting_the_page(self):
        vm=Lifecycle(self.after);vm.children()
        vm.globals['GameData']['qingdianActiveProvider']['cfg']['XiaoFeiZhuanPan']={'isOpen':False}
        requests=[];spies=vm.invoke
        methods={'QDLoginPage':18111,'QDRechargePage':18058,'QDAccRechargePage':17961,
                 'QDFlashSalePage':17939,'QDHongYunDangTouPage':17970,'QDConsumePage':17925,
                 'QDZhenBaoGePage':17983,'QDHaoLiPage':18124}
        def invoke(obj,name,args):
            if name=='__construct__':
                page=spies(obj,name,args)
                if page.get('class') in PAGES:
                    page.update({key:{} for key in ('_loaderbasebutton_2','_loaderbasebutton_1','_tabBar',
                        '_mdpmovie_0','_loaderbasebutton_0','_simplelinklabel_0','_simplelinklabel_1',
                        'luckBtn','luckBtnEffect','_button4_0')});page['_btns']=[{} for _ in range(6)]
                return page
            if name=='initEvent':
                spies(obj,name,args);return vm.run(methods[obj['class']],obj)
            if name in ('sendQDActiveInfo','requestPublicReleaseData'):
                requests.append((name,args));return None
            if name in ('start','getInfo','updateDate','updateRecharge','init'):return None
            return spies(obj,name,args)
        vm.invoke=invoke;vm.open()
        self.assertEqual([('sendQDActiveInfo',[0,11])],requests)
        requests.clear();vm.click(5)
        self.assertEqual(['requestPublicReleaseData']*2,[name for name,args in requests])
        requests.clear();vm.click(3)
        self.assertEqual([('sendQDActiveInfo',[0,3])],requests)
        requests.clear();vm.click(3);self.assertEqual([],requests)

    def test_hidden_page_reminders_follow_new_replies_without_initializing_the_page(self):
        vm=Lifecycle(self.after);vm.children();vm.open()
        vm.globals['GameData']={'qingdianActiveProvider':{'cfg':{'EveryTotalPay':[{}]}}}
        vm.globals['GlobalData']['qdActivityDataMgr'].update(rechargeDays=[1],rechargeStatu=[[0,0,0]])
        vm.run(6033);self.assertTrue(vm.obj['tipsIcon2']['visible'])
        vm.globals['GlobalData']['qdActivityDataMgr']['rechargeStatu']=[[1,0,0]]
        vm.run(6033);self.assertFalse(vm.obj['tipsIcon2']['visible'])
        self.assertEqual([('QDLoginPage','initEvent')],vm.events)

    def test_initial_marks_use_cached_state_without_hidden_queries_or_missing_reply_errors(self):
        vm=Lifecycle(self.after);vm.children()
        calls=[];original=vm.invoke
        def invoke(obj,name,args):
            if name in ('onLoginResultHandler','onTehuiResultHandler','onAccRecharge','updateHaoLiTips'):
                calls.append(name)
            return original(obj,name,args)
        vm.invoke=invoke;vm.open()
        self.assertEqual(['onLoginResultHandler','onTehuiResultHandler'],calls)
        self.assertFalse(any(vm.obj[k]['visible'] for k in ('tipsIcon0','tipsIcon1','tipsIcon2','tipsIcon4','tipsIcon6')))
        vm.close();calls.clear()
        vm.globals['GlobalData']['qdActivityDataMgr'].update(rechargeDays=[1],rechargeStatu=[[0,0,0]],haoli=[1]*5)
        vm.open();self.assertEqual(['onLoginResultHandler','onTehuiResultHandler','onAccRecharge','updateHaoLiTips'],calls)

    def test_only_nine_methods_change_and_every_other_packaged_byte_is_preserved(self):
        self.assertEqual(self.source,patch_swf(self.before_source))
        self.assertEqual(self.source,patch_swf(self.source))
        old,_,oldstrings,oldb=self.before;new,_,newstrings,newb=self.after
        changed=set()
        for method,(a,size,limits) in oldb.items():
            b,length,newlimits=newb[method]
            if old[a:a+size]!=new[b:b+length] or limits!=newlimits:changed.add(method)
        self.assertEqual(METHODS,changed);self.assertEqual(oldstrings,newstrings)
        # Replacing only these method records must exactly restore the whole ABC.
        from patch_bag_client import ABCReader,encode_u30
        restored=bytearray(new);edits=[]
        for method in METHODS:
            spans=[]
            for abc,bodies in ((old,oldb),(new,newb)):
                a,size,limits=bodies[method]
                header=b''.join(encode_u30(v) for v in (method,*limits,size))
                r=ABCReader(abc);r.pos=a+size
                for _ in range(r.u30()):
                    for _ in range(5):r.u30()
                spans.append((a-len(header),r.pos))
            (a,b),(c,d)=spans;edits.append((c,d,old[a:b]))
        for a,b,value in sorted(edits,reverse=True):restored[a:b]=value
        self.assertEqual(old,restored)
        oldraw,(ot,op,oa,ob)=abc_section(self.before_source)
        newraw,(nt,np,na,nb)=abc_section(self.source)
        self.assertEqual(oldraw[8:ot+2],newraw[8:nt+2])
        self.assertEqual(oldraw[op:oa],newraw[np:na]);self.assertEqual(oldraw[ob:],newraw[nb:])
        for path in ('web/v2/lang/zh-cn/zh-cn.dat','web/v2/lang/zh-cn/QingDianActivityCfg.cbp',
                     'Server/S1001/data/config/activity/QingDianActivityCfg.lua'):
            self.assertEqual(subprocess.check_output(['git','show',BASELINE+':'+path],cwd=ROOT),(ROOT/path).read_bytes())

    def test_branch_destinations_loop_labels_and_local_slots_remain_valid(self):
        abc,_,_,bodies=self.after
        for method in METHODS:
            a,size,limits=bodies[method];code=abc[a:a+size];ops=instructions(code)
            boundaries={o.start for o in ops}
            for o in ops:
                if o.opcode in (0x62,0x63,0xc2,0xc3,0x08):self.assertLess(o.operands[0],limits[1])
                if 0xd0<=o.opcode<=0xd7:self.assertLess((o.opcode-0xd0)%4,limits[1])
                for _,target,_ in o.branches:
                    self.assertIn(target,boundaries,(method,target))
                    if target<=o.start:self.assertEqual(0x09,code[target],(method,target))


if __name__=='__main__':unittest.main(verbosity=2)
