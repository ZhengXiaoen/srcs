"""Execute GM page AVM2 layout, category selection and command serialization."""
from pathlib import Path
import math
import re
import subprocess
import unittest

from patch_appearance_upgrade import inspect_abc, pools
from patch_drop_pickup_retry import abc_section, instructions
from patch_gm_commands import ACTIONS, CATEGORIES, CLASS, CLIENT, Q, patch_swf


class PageVM:
    def __init__(self, abc):
        self.abc = abc
        self.names, self.catalog, self.bodies = inspect_abc(abc)
        self.strings = pools(abc)['strings'][3]
        self.page = {'m_panelBg': {'children': []}}
        self.commands = []
        self.globals = {'ChatFunc': {}}
        self.listeners = {}

    def run(self, name, event=None):
        method = self.catalog[CLASS]['instance'][name][0]
        start, size, limits = self.bodies[method]
        ops = {o.start: o for o in instructions(self.abc[start:start+size])}
        loc = {0:self.page,1:event}
        stack = []
        pos = 0
        maximum = 0
        for _ in range(30000):
            o = ops[pos]; pos = o.end
            op, args = o.opcode, o.operands
            if 0xd0 <= op <= 0xd3: stack.append(loc[op-0xd0])
            elif 0xd4 <= op <= 0xd7: loc[op-0xd4]=stack.pop()
            elif op==0x62: stack.append(loc[args[0]])
            elif op==0x63: loc[args[0]]=stack.pop()
            elif op in (0x5d,0x60):stack.append(self.globals.get(self.names[args[0]],{}))
            elif op==0x66:
                key=stack.pop() if args[0]==Q['index'] else self.names[args[0]]
                obj=stack.pop()
                if key=='length':value=len(obj)
                elif key=='gmClick':value='gmClick'
                else:value=obj[key]
                stack.append(value)
            elif op in (0x61,0x68):
                value,obj=stack.pop(),stack.pop();obj[self.names[args[0]]]=value
            elif op in (0x24,0x25):stack.append(args[0])
            elif op==0x2c:stack.append(self.strings[args[0]])
            elif op in (0x26,0x27):stack.append(op==0x26)
            elif op in (0x30,0x29):stack.pop()
            elif op==0x56:
                count=args[0]; values=stack[-count:] if count else []
                if count:del stack[-count:]
                stack.append(values)
            elif op in (0x80,0x09):pass
            elif op==0x75:
                value=stack.pop()
                try:value=float(value)
                except (ValueError,TypeError):value=math.nan
                stack.append(value)
            elif op==0x4a:
                count=args[1];vals=stack[-count:] if count else []
                if count:del stack[-count:]
                stack.pop();name=self.names[args[0]]
                if name=='RegExp':value=re.compile(vals[0])
                elif name=='Button54':value={'width':77,'height':31,'visible':True,'enabled':True}
                elif name=='TextInput0':value={'width':100,'height':27,'text':''}
                elif name=='Label':value={'caption':'','height':20}
                else:raise AssertionError('Unexpected class '+name)
                stack.append(value)
            elif op in (0x4f,0x46):
                name,count=self.names[args[0]],args[1]
                vals=stack[-count:] if count else []
                if count:del stack[-count:]
                target=stack.pop();value=None
                if name=='push':target.extend(vals)
                elif name=='move':target['x'],target['y']=vals
                elif name=='addChild':target.setdefault('children',[]).extend(vals)
                elif name=='split':value=target.split(vals[0])
                elif name=='test':value=target.search(vals[0]) is not None
                elif name=='doChatMessage':self.commands.extend(vals)
                elif name=='addEventListener':self.listeners.setdefault(id(target),set()).add(tuple(vals))
                elif name=='removeEventListener':self.listeners.setdefault(id(target),set()).discard(tuple(vals))
                else:raise AssertionError('Unexpected call '+name)
                if op==0x46:stack.append(value)
            elif op==0xc2:loc[args[0]]+=1
            elif op==0xa0:
                right,left=stack.pop(),stack.pop();stack.append(left+right)
            elif op==0xac:
                right,left=stack.pop(),stack.pop()
                stack.append(left is right if isinstance(left,dict) or isinstance(right,dict) else type(left)==type(right) and left==right)
            elif op==0x96:stack.append(not stack.pop())
            elif op in (0x10,0x11,0x12,0x13,0x14,0x15,0x17,0x18,0x1a):
                if op==0x10:take=True
                elif op in (0x11,0x12):take=bool(stack.pop())==(op==0x11)
                else:
                    right,left=stack.pop(),stack.pop()
                    equal=left is right if isinstance(left,dict) or isinstance(right,dict) else left==right
                    take={0x13:equal,0x14:not equal,0x15:lambda:left<right,0x17:lambda:left>right,0x18:lambda:left>=right,0x1a:not equal}[op]
                    if callable(take):take=take()
                if take:pos=o.branches[0][1]
            elif op==0x47:
                assert not stack, 'Nonempty stack at return'
                assert maximum<=limits[0],(maximum,limits)
                return
            else:raise AssertionError(f'Unexpected GM opcode {op:#x}')
            maximum=max(maximum,len(stack))
        raise AssertionError('Page did not terminate')


class CommandClientTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        data,(_,_,a,b)=abc_section(CLIENT.read_bytes());cls.abc=data[a:b]
        cls.names,cls.catalog,cls.bodies=inspect_abc(cls.abc)

    def vm(self):
        vm=PageVM(self.abc);vm.run('gmInit');return vm

    def click(self,vm,button,param=''):
        vm.page['_gmInput']['text']=param;vm.commands.clear()
        vm.run('gmClick',{'currentTarget':button})
        return vm.commands

    def test_all_commands_layout_and_categories(self):
        vm=self.vm();buttons=vm.page['_gmButtons'];self.assertEqual(len(ACTIONS),len(buttons))
        for i,category in enumerate(vm.page['_gmCategories']):
            self.click(vm,category,'old parameter')
            self.assertEqual('',vm.page['_gmInput']['text'])
            self.assertEqual([j!=i for j in range(6)],[c['enabled'] for c in vm.page['_gmCategories']])
            shown=[b for b in buttons if b['visible']]
            self.assertEqual([a[0] for a in ACTIONS if a[2]==i],[b['caption'] for b in shown])
            for b in shown:
                self.assertGreaterEqual(b['y'],83);self.assertLessEqual(b['y']+b['height'],277)
                self.assertGreaterEqual(b['x'],0);self.assertLessEqual(b['x']+b['width'],408)
                for other in shown:
                    if other is b:continue
                    self.assertTrue(b['x']+b['width']<=other['x'] or other['x']+other['width']<=b['x'] or b['y']+b['height']<=other['y'] or other['y']+other['height']<=b['y'])
            self.assertEqual([],vm.commands)

    def test_every_lua_command_uses_fixed_dispatch_and_correct_parameter(self):
        vm=self.vm()
        for button,action in zip(vm.page['_gmButtons'],ACTIONS):
            label,command,category,mode,tip=action
            if mode>1:continue
            expected='@func gmCommand "'+command+'"'+(' "123"' if mode else '')
            self.assertEqual([expected],self.click(vm,button,'123'),label)
            expected='@func gmCommand "'+command+'"'+(' ""' if mode else '')
            self.assertEqual([expected],self.click(vm,button),label)
            self.assertIn('参数' if mode else tip,button['toolTip'])
        suite=next(b for b in vm.page['_gmButtons'] if b['caption']=='转生装备套装')
        self.assertEqual(['@func gmCommand "GiveTotal" "起源"'],self.click(vm,suite,'起源'))
        rate=next(b for b in vm.page['_gmButtons'] if b['caption']=='Boss奖励倍率')
        self.assertEqual(['@func gmCommand "setbossrate" "1.5"'],self.click(vm,rate,'1.5'))

    def test_native_money_bounds_and_invalid_text_are_never_sent(self):
        vm=self.vm()
        for i in range(1,4):
            button=vm.page['_gmButtons'][i];command=ACTIONS[i][1]
            maximum=1000000000
            for value in ['', '1',str(maximum)]:
                self.assertEqual([command+' '+(value or '1000')],self.click(vm,button,value))
            for value in ['-1','0','1.5','nan','inf',str(maximum+1),'100\n',' 1','1 @func killAll','９９']:
                self.assertEqual([],self.click(vm,button,value),value)
                self.assertTrue(vm.page['_gmHint']['caption'].endswith('错误'))

    def test_item_and_lua_parameters_reject_command_separators(self):
        vm=self.vm();make=vm.page['_gmButtons'][0];material=vm.page['_gmButtons'][12]
        self.assertEqual(['@MAKE 霸主战刃'],self.click(vm,make,'霸主战刃'))
        for value in ['', '名称\n', 'a b','@func','a;killAll','a|b','a"b','a\\b','x'*65]:
            self.assertEqual([],self.click(vm,make,value))
        for value in ['500\n','1 2','@func','a;killAll','a|b','a"b','a\\b','x'*65]:
            self.assertEqual([],self.click(vm,material,value))

    def test_page_event_cleanup_and_reopen(self):
        vm=self.vm()
        vm.globals['MouseEvent']={'CLICK':'click'}
        expected=len(ACTIONS)+len(CATEGORIES)
        for _ in range(3):
            vm.run('initEvent');self.assertEqual(expected,sum(len(x) for x in vm.listeners.values()))
            vm.run('removeEvent');self.assertEqual(0,sum(len(x) for x in vm.listeners.values()))

    def test_patch_reproduction_and_no_retired_gm_commands(self):
        baseline=subprocess.check_output(['git','show','5e5792c:web/GameFrame.swf'],cwd=CLIENT.parent.parent)
        self.assertEqual(CLIENT.read_bytes(),patch_swf(baseline))
        self.assertEqual(CLIENT.read_bytes(),patch_swf(CLIENT.read_bytes()))
        for action in ACTIONS:self.assertNotIn(action[1],('xfzp10','xfzp100'))

    def test_flash_loop_verification_and_existing_page_upgrade(self):
        from patch_gm_commands import label_backward_branches
        from patch_item_count_u16_client import inspect_abc_full
        baseline=subprocess.check_output(['git','show','5e5792c:web/GameFrame.swf'],cwd=CLIENT.parent.parent)
        data,(tag,_,a,b)=abc_section(baseline)
        before=data[a:b]
        names,catalog,_=inspect_abc(before)
        old=inspect_abc_full(before)['bodies']
        current=inspect_abc_full(self.abc)['bodies']
        changed={catalog[CLASS]['instance'][name][0] for name in ['initEvent','removeEvent','gmClick']}
        transport=catalog['ChatCC']['static']['sendChatMessage'][0]
        for mid,body in old.items():
            if mid in changed:
                self.assertNotEqual(body['code'],current[mid]['code'])
                self.assertEqual(label_backward_branches(body['code']),current[mid]['code'])
                self.assertEqual(body['limits'],current[mid]['limits'])
                ops=instructions(current[mid]['code']);by={op.start:op for op in ops}
                for op in ops:
                    for _,target,_ in op.branches:
                        if target<op.start:self.assertEqual(0x09,by[target].opcode)
            elif mid==transport:
                from patch_gm_commands import repair_gm_chat_timestamp
                fixed=inspect_abc_full(repair_gm_chat_timestamp(before))['bodies'][mid]
                self.assertEqual(fixed['code'],current[mid]['code'])
                self.assertEqual(body['limits'],current[mid]['limits'])
            else:
                self.assertEqual(before[body['record_start']:body['end']],
                                 self.abc[current[mid]['record_start']:current[mid]['end']],mid)
        # A fresh install and an in-place upgrade must produce the same artifact.
        fresh=subprocess.check_output(['git','show','5e5792c^:web/GameFrame.swf'],cwd=CLIENT.parent.parent)
        self.assertEqual(CLIENT.read_bytes(),patch_swf(fresh))
        current_data,(_,_,c,d)=abc_section(CLIENT.read_bytes())
        self.assertEqual(data[8:tag+2],current_data[8:tag+2])
        self.assertEqual(data[tag+6:a],current_data[tag+6:c])
        self.assertEqual(data[b:],current_data[d:])

    def test_original_player_and_common_pages_detach_focus_listeners(self):
        names,catalog,bodies=inspect_abc(self.abc)
        for cls in ['CustomerServiceCommonPage','CustomerServicePlayerPage']:
            start,size,_=bodies[catalog[cls]['instance']['removeEvent'][0]]
            calls=[names[o.operands[0]] for o in instructions(self.abc[start:start+size]) if o.opcode==0x4f]
            self.assertNotIn('addEventListener',calls)
            self.assertIn('removeEventListener',calls)

    def test_original_gm_buttons_use_listener_owner(self):
        names,catalog,bodies=inspect_abc(self.abc)
        for cls in ['CustomerServiceWin','CustomerServiceCommonPage','CustomerServicePlayerPage','CustomerServiceGamePage']:
            start,size,_=bodies[catalog[cls]['instance']['onBtnClick'][0]]
            properties=[names[o.operands[0]] for o in instructions(self.abc[start:start+size]) if o.opcode==0x66]
            self.assertIn('currentTarget',properties)
            self.assertNotIn('target',properties)

    def test_page_metadata_and_permission_gate(self):
        from patch_gm_commands import sections
        from patch_bag_client import ABCReader
        sec=sections(self.abc)
        self.assertIn(CLASS,self.catalog)
        # New class initializer captures the same inheritance scopes as the
        # original page, and the page can resolve protected panel properties.
        methods=self.catalog[CLASS]
        self.assertEqual((1,1,14,15),self.bodies[methods['constructor']][2])
        reader=ABCReader(self.abc);reader.pos=sec['ci']
        def skip_traits():
            for _ in range(reader.u30()):
                reader.u30();attr=reader.byte();reader.u30();reader.u30()
                if attr&15 in (0,6):
                    if reader.u30():reader.byte()
                if attr&64:
                    for _ in range(reader.u30()):reader.u30()
        found=False
        for _ in range(sec['count']):
            name=reader.u30();reader.u30();flags=reader.byte()
            protected=reader.u30() if flags&8 else None
            if self.names_if(name)==CLASS:
                self.assertTrue(flags&8);self.assertEqual(0x18,pools(self.abc)['namespaces'][3][protected][0]);found=True
            for _ in range(reader.u30()):reader.u30()
            reader.u30();skip_traits()
        self.assertTrue(found)
        start,size,_=self.bodies[self.catalog['CustomerServiceWin']['instance']['init'][0]]
        ops=instructions(self.abc[start:start+size])
        marker=next(i for i,o in enumerate(ops) if o.opcode==0x4a and self.names_if(o.operands[0])==CLASS)
        prior=ops[marker-5:marker]
        self.assertTrue(any(o.opcode==0x24 and o.operands==(9,) for o in prior))
        self.assertTrue(any(o.opcode==0x15 for o in prior))

    def names_if(self,index):return self.names[index]

    def test_tutorial_updates_commands_preserving_other_sections(self):
        from patch_gm_commands import update_tutorial
        prefix='本地安装设置\r\n保留现有配置\r\n\r\n'
        sample=prefix+'@func xfzp10\r\n@func xfzp100\r\n@addmoney 1金币 2绑金 3元宝\r\n@func setbossrate 1.5\r\n@func GiveTotal 起源\r\n'
        result=update_tutorial(b'\xef\xbb\xbf'+sample.encode())
        text=result.decode('utf-8-sig')
        self.assertTrue(text.startswith(prefix))
        self.assertNotIn('xfzp',text)
        self.assertIn('0绑金 1金币 2绑定元宝 3元宝',text)
        self.assertIn('@func setbossrate "1.5"',text)
        self.assertIn('@func GiveTotal "起源"',text)
        self.assertEqual(result,update_tutorial(result))


if __name__=='__main__':unittest.main()
