"""Install a categorized GM command page in the shipped AVM2 client.

Append one class, its script initializer and methods. Preserve original ABC
records and SWF assets except the GM window and broken GM listener cleanup.
"""
from pathlib import Path
import argparse
import struct
import zlib

from patch_activity_entries import q, relocate
from patch_appearance_upgrade import extend_pools, inspect_abc, pools
from patch_auto_medicine_frequency import Block
from patch_bag_client import ABCReader, encode_u30
from patch_drop_pickup_retry import abc_section, instructions
from patch_item_count_u16_client import inspect_abc_full
from patch_bag_bind_sort import method_info_end

CLIENT = Path(__file__).resolve().parents[1] / "web/GameFrame.swf"
CLASS = "CustomerServiceCommandPage"
LABEL = "一键聚怪"
COMMAND = '@func gmCommand "gmAbsorbBosses"'
KILL_LABEL = "一键杀怪"
KILL_COMMAND = '@func gmCommand "killAll"'
CATEGORIES = ["常用查询", "角色养成", "材料设置", "装备发放", "地图规则", "数据清理"]
# label, command, category, parameter mode (0:none, 1:Lua, 2:item, 3:money), tooltip
ACTIONS = [
    ("创建物品", "@MAKE", 0, 2, "参数：物品名称，必填"),
    ("增加金币", "@addmoney 1", 0, 3, "参数：金币数量，1~1000000000整数，默认1000"),
    ("增加绑金", "@addmoney 0", 0, 3, "参数：绑金数量，1~1000000000整数，默认1000"),
    ("增加元宝", "@addmoney 3", 0, 3, "参数：元宝数量，1~1000000000整数，默认1000"),
    ("模拟充值", "GmRecharge", 0, 1, "参数：充值元宝，1~1000000整数，默认1000"),
    ("开区天数", "whatday", 0, 0, "查询开区天数"),
    ("当前地图ID", "ckmapid", 0, 0, "查询当前地图ID"),
    ("设置等级", "setlevel", 1, 1, "参数：1~255整数，默认255"),
    ("角色转职", "TestChangeJob", 1, 1, "参数：1战士、2法师、3道士，默认1"),
    ("一键满属性", "GmOneKeyFullAttribute", 1, 0, "等级255，核心系统材料21亿"),
    ("军魂瓶充能", "addjunhunping", 1, 1, "参数：设置军魂瓶值，0~50000整数，默认50000"),
    ("行会旗帜经验", "SetGuildFlagExp", 1, 1, "参数：旗帜经验，0~2100000000整数，默认50000"),
    *[(label, name, 2, 1, "参数：0~2100000000整数，默认" + default)
      for label, name, default in [
          ("护符碎片", "sethufu", "50000"), ("护盾碎片", "setdun", "50000"),
          ("宝石结晶", "setbaoshi", "50000"), ("圣珠结晶", "setshengzhu", "50000"),
          ("特戒结晶", "settejie", "50000"), ("成就点", "setchengj", "50000"),
          ("转生灵力", "setzsll", "50000"), ("血炼精华", "setxuelian", "50000"),
          ("功勋", "setgongxun", "50000"), ("斗笠精华", "setdouli", "50000"),
          ("军魂值", "setjunhun", "50000"), ("心法值", "setxinfa", "50000"),
          ("内功", "setneigong", "50000"), ("元神灵力", "setyuanshen", "50000"),
          ("注魂值", "setzhuhun", "50000"), ("注灵值", "setlingli", "50000"),
          ("龙灵经验", "setlongling", "100000"), ("灵宠献祭值", "setspiritpet", "50000")]],
    ("转生装备套装", "GiveTotal", 3, 1, "参数：转生等级1~7/9/11/13或套装名，默认5"),
    ("龙腾圣武套装", "GmGiveLongTeng", 3, 0, "按角色性别发放龙腾圣武全套"),
    ("至尊屠龙套装", "GmGiveZhiZun", 3, 0, "按角色性别发放神·至尊屠龙全套"),
    ("军团职位全套", "givelegion", 3, 0, "发放军团职位升级全套，需要31个背包空位"),
    ("Boss爆元宝开关", "togglebosspay", 4, 1, "参数：0关闭、1开启；留空切换"),
    ("Boss奖励倍率", "setbossrate", 4, 1, "参数：0~10000，可填小数，默认1.5"),
    ("清理寻宝数据", "qlck2", 5, 0, "清空当前角色寻宝仓库、积分和寻宝次数"),
    ("重置开服活动", "tobezero", 5, 0, "重置全服开服活动领取人数与自身领取标志"),
]
Q = {"Button54":15659,"Label":371,"TextInput0":8984,"Array":22,
     "autoSize":11017,"height":1618,"width":1617,"caption":11014,
     "move":1631,"addChild":1868,"push":43315,"currentTarget":43310,
     "ChatFunc":1510,"doChatMessage":31355,"index":44065,"m_panelBg":15602,
     "name":3144,"visible":1832,"enabled":1621,"text":5897,"toolTip":1623,
     "length":3237,"MouseEvent":5,"CLICK":33809,"addEventListener":13671,
     "removeEventListener":13672,"gmLevel":4202,"GlobalData":1507,"role":11237,
     "RegExp":906,"test":11650,"split":43284,"Number":21,
     "CustomerServiceBasePage":15600,"_stateBtnList":5581}


def u(*values): return b"".join(encode_u30(x) for x in values)
def integer(value):
    return b"\x24"+bytes([value & 255]) if -128<=value<=127 else q(0x25,value)
def local(i): return bytes([0xd0+i]) if i<4 else q(0x62,i)
def store(i): return bytes([0xd4+i]) if i<4 else q(0x63,i)


def sections(data):
    """Locate class/script records without reserializing existing definitions."""
    ms, mc, me, methods = method_info_end(data)
    r = ABCReader(data); r.pos=me
    for _ in range(r.u30()):
        r.u30()
        for _ in range(r.u30()): r.u30(); r.u30()
    def traits():
        for _ in range(r.u30()):
            r.u30(); attr=r.byte(); r.u30();r.u30()
            if attr&15 in (0,6):
                if r.u30():r.byte()
            if attr&64:
                for _ in range(r.u30()):r.u30()
    cs=r.pos; count=r.u30();ci=r.pos
    for _ in range(count):
        r.u30();r.u30();flags=r.byte()
        if flags&8:r.u30()
        for _ in range(r.u30()):r.u30()
        r.u30();traits()
    ce=r.pos
    for _ in range(count):r.u30();traits()
    ss=r.pos; scripts=r.u30();si=r.pos
    for _ in range(scripts):r.u30();traits()
    se=r.pos;bc=r.u30();bi=r.pos
    return dict(ms=ms,mc=mc,me=me,methods=methods,cs=cs,ci=ci,ce=ce,
                ss=ss,si=si,se=se,scripts=scripts,count=count,bc=bc,bi=bi)


def patch_abc(original):
    if CLASS in pools(original)["strings"][3]: return original
    texts=[CLASS,LABEL,COMMAND,KILL_LABEL,KILL_COMMAND,"a|killAll|4|0","GM命令","参数", "留空使用默认值",
           "请输入有效物品名","金额格式或范围错误","参数格式错误",
           "|",""," ",'"',' "',"1000",'@func gmCommand "',"c","^[0-9]{1,10}$(?![\\s\\S])", '^[^\\s@;|"\\\\]{1,64}$(?![\\s\\S])',
           '^[^\\s@;|"\\\\]{0,64}$(?![\\s\\S])',"1000000000"]
    texts += CATEGORIES
    for label,command,category,mode,tip in ACTIONS:
        texts += [label,tip,f"a|{command}|{category}|{mode}","@func gmCommand "+command]
    texts += [f"c|{i}" for i in range(len(CATEGORIES))]
    slots=["_gmButtons","_gmInput","_gmHint","_gmCategories"]
    methods=["gmInit","gmClick"]
    source,s,added=extend_pools(original,texts,
        [("view.game.CustomerService.page",CLASS)]+[("",x) for x in slots+methods])
    table=pools(source);ns=table['namespaces'];protected=(0x18,s[CLASS])
    protected_index=len(ns[3])
    source=(source[:ns[0]]+u(protected_index+1)+source[ns[1]:ns[2]]+
            bytes([protected[0]])+u(protected[1])+source[ns[2]:])
    n,catalog,bodies=inspect_abc(source);full=inspect_abc_full(source);sec=sections(source)
    for key,index in Q.items():
        if key!='index' and n[index]!=key:raise ValueError(f"Unexpected QName {key}")
    def get(name,obj=b"\xd0"):return obj+q(0x66,added.get(name,Q.get(name)))
    def setprop(obj,name,val):return obj+val+q(0x61,added.get(name,Q.get(name)))
    def st(text):return q(0x2c,s[text])
    def member(index,obj):return obj+integer(index)+q(0x66,Q['index'])
    def call(obj,name,*args):return obj+b"".join(args)+q(0x4f,Q[name],len(args))
    def build(kind,index):return q(0x5d,Q[kind])+q(0x4a,Q[kind],0)+store(index)
    def button(label,x,y,width,tag,tip,visible=True,index=1,parent=None):
        obj=local(index)
        return (build('Button54',index)+setprop(obj,'autoSize',b'\x27')+
                setprop(obj,'width',integer(width))+setprop(obj,'height',integer(27))+
                setprop(obj,'caption',st(label))+setprop(obj,'name',st(tag))+
                setprop(obj,'toolTip',st(tip))+setprop(obj,'visible',b'\x26' if visible else b'\x27')+
                call(obj,'move',integer(x),integer(y))+call(get('m_panelBg') if parent is None else parent,'addChild',obj))
    # New page remains an ordinary CustomerServiceBasePage for the window's lifecycle.
    init=b'\xd0\x30'
    for name in ['_gmButtons','_gmCategories']:
        init+=b'\xd0'+q(0x56,0)+q(0x68,added[name])
    for i,label in enumerate(CATEGORIES):
        init+=button(label,5+i*67,10,64,f'c|{i}',label)
        init+=setprop(local(1),'enabled',b'\x27' if i==0 else b'\x26')
        init+=call(get('_gmCategories'),'push',local(1))
    init+=build('Label',1)+setprop(local(1),'caption',st('参数'))
    init+=call(local(1),'move',integer(10),integer(49))+call(get('m_panelBg'),'addChild',local(1))
    init+=b'\xd0'+q(0x5d,Q['TextInput0'])+q(0x4a,Q['TextInput0'],0)+q(0x68,added['_gmInput'])
    init+=setprop(get('_gmInput'),'text',st(''))+setprop(get('_gmInput'),'width',integer(190))
    init+=call(get('_gmInput'),'move',integer(60),integer(44))
    init+=call(get('m_panelBg'),'addChild',get('_gmInput'))
    init+=b'\xd0'+q(0x5d,Q['Label'])+q(0x4a,Q['Label'],0)+q(0x68,added['_gmHint'])
    init+=setprop(get('_gmHint'),'caption',st('留空使用默认值'))
    init+=call(get('_gmHint'),'move',integer(260),integer(49))
    init+=call(get('m_panelBg'),'addChild',get('_gmHint'))
    counts={}
    for label,command,category,mode,tip in ACTIONS:
        i=counts.get(category,0);counts[category]=i+1
        init+=button(label,10+(i%3)*131,83+(i//3)*31,126,f'a|{command}|{category}|{mode}',tip,category==0)
        init+=call(get('_gmButtons'),'push',local(1))
    init+=b'\x47'
    def lifecycle(add):
        b=Block();b.emit(b'\xd0\x30');b.emit(integer(0)+store(1))
        b.label('loop')
        b.emit(local(1)+get('_gmButtons')+q(0x66,Q['length']))
        b.branch(0x18,'categories') # ifge
        b.emit(call(member_local('_gmButtons',1),'addEventListener' if add else 'removeEventListener',
                    q(0x60,Q['MouseEvent'])+q(0x66,Q['CLICK']),get('gmClick')))
        b.emit(q(0xc2,1));b.branch(0x10,'loop')
        b.label('categories');b.emit(integer(0)+store(1));b.label('catloop')
        b.emit(local(1)+get('_gmCategories')+q(0x66,Q['length']));b.branch(0x18,'return')
        b.emit(call(member_local('_gmCategories',1),'addEventListener' if add else 'removeEventListener',
                    q(0x60,Q['MouseEvent'])+q(0x66,Q['CLICK']),get('gmClick')))
        b.emit(q(0xc2,1));b.branch(0x10,'catloop');b.label('return');b.emit(b'\x47')
        return b.finish()[0]
    def member_local(slot,i):return get(slot)+local(i)+q(0x66,Q['index'])
    b=Block();b.emit(b'\xd0\x30')
    b.emit(get('name',get('currentTarget',b'\xd1'))+st('|')+q(0x46,Q['split'],1)+q(0x80,Q['Array'])+store(2))
    b.emit(setprop(get('_gmHint'),'caption',st('留空使用默认值')))
    b.emit(member(0,local(2))+st('c'));b.branch(0x1a,'action')
    b.emit(setprop(get('_gmInput'),'text',st(''))+integer(0)+store(3))
    b.label('visibleloop');b.emit(local(3)+get('_gmButtons')+q(0x66,Q['length']));b.branch(0x18,'catselected')
    obj=member_local('_gmButtons',3)
    b.emit(obj+get('name',obj)+st('|')+q(0x46,Q['split'],1)+integer(2)+q(0x66,Q['index'])+
           member(1,local(2))+b'\xac'+q(0x61,Q['visible']))
    b.emit(q(0xc2,3));b.branch(0x10,'visibleloop')
    b.label('catselected');b.emit(integer(0)+store(3));b.label('catselectedloop')
    b.emit(local(3)+get('_gmCategories')+q(0x66,Q['length']));b.branch(0x18,'return')
    obj=member_local('_gmCategories',3)
    b.emit(obj+obj+get('currentTarget',b'\xd1')+b'\xac\x96'+q(0x61,Q['enabled']))
    b.emit(q(0xc2,3));b.branch(0x10,'catselectedloop')
    b.label('action')
    b.emit(get('text',get('_gmInput'))+store(3))
    b.emit(member(3,local(2))+b'\x75'+store(4))
    b.emit(local(4)+integer(2));b.branch(0x15,'lua')
    b.emit(local(4)+integer(2));b.branch(0x14,'money')
    b.emit(q(0x5d,Q['RegExp'])+st('^[^\\s@;|"\\\\]{1,64}$(?![\\s\\S])')+st('')+q(0x4a,Q['RegExp'],2)+local(3)+q(0x46,Q['test'],1))
    b.branch(0x11,'native');b.emit(setprop(get('_gmHint'),'caption',st('请输入有效物品名')));b.branch(0x10,'return')
    b.label('money');b.emit(local(3)+st(''));b.branch(0x1a,'validate')
    b.emit(st('1000')+store(3));b.label('validate')
    b.emit(q(0x5d,Q['RegExp'])+st('^[0-9]{1,10}$(?![\\s\\S])')+st('')+q(0x4a,Q['RegExp'],2)+local(3)+q(0x46,Q['test'],1))
    b.branch(0x12,'invalidmoney');b.emit(local(3)+b'\x75'+integer(1));b.branch(0x15,'invalidmoney')
    b.emit(local(3)+b'\x75'+st('1000000000')+b'\x75');b.branch(0x17,'invalidmoney')
    b.label('native')
    b.emit(q(0x60,Q['ChatFunc'])+member(1,local(2))+st(' ')+b'\xa0'+local(3)+b'\xa0'+q(0x4f,Q['doChatMessage'],1));b.branch(0x10,'return')
    b.label('invalidmoney');b.emit(setprop(get('_gmHint'),'caption',st('金额格式或范围错误')));b.branch(0x10,'return')
    b.label('lua')
    b.emit(local(4)+integer(0));b.branch(0x13,'validlua')
    b.emit(q(0x5d,Q['RegExp'])+st('^[^\\s@;|"\\\\]{0,64}$(?![\\s\\S])')+st('')+q(0x4a,Q['RegExp'],2)+local(3)+q(0x46,Q['test'],1))
    b.branch(0x11,'validlua');b.emit(setprop(get('_gmHint'),'caption',st('参数格式错误')));b.branch(0x10,'return')
    b.label('validlua')
    b.emit(q(0x60,Q['ChatFunc'])+st('@func gmCommand "')+member(1,local(2))+b'\xa0'+st('"')+b'\xa0')
    b.emit(local(4)+integer(0));b.branch(0x13,'sendlua')
    b.emit(st(' "')+b'\xa0'+local(3)+b'\xa0'+st('"')+b'\xa0');b.label('sendlua');b.emit(q(0x4f,Q['doChatMessage'],1))
    b.label('return');b.emit(b'\x47');click=b.finish()[0]
    # Append methods and class definitions; all originals retain their indices.
    mid=sec['methods'];ids=dict(zip(['cinit','ctor','init','add','remove','click','script'],range(mid,mid+7)))
    info=lambda params:u(len(params),1,*params,0)+b'\0'
    infos=info([])*3+info([])*2+info([Q['MouseEvent']])+info([])
    newclass=sec['count']
    def trait(name,kind,index):return u(added.get(name,Q.get(name)))+bytes([kind])+u(0,index)
    traits=b''.join(trait(x,0,Q['TextInput0'] if x=='_gmInput' else Q['Label'] if x=='_gmHint' else Q['Array'])+b'\0' for x in slots)
    traits+=trait('gmInit',1,ids['init'])+trait('gmClick',1,ids['click'])
    traits+=u(3112)+b'\x21'+u(0,ids['add'])+u(3113)+b'\x21'+u(0,ids['remove'])
    instance=u(added[CLASS],Q['CustomerServiceBasePage'])+b'\x09'+u(protected_index,0,ids['ctor'],8)+traits
    classinfo=u(ids['cinit'],0)
    script=u(ids['script'],1,added[CLASS])+b'\x04'+u(0,newclass)
    scriptcode=b'\xd0\x30'+q(0x5d,added[CLASS])
    for parent in [25,291,20,17,19,38,733,727,780,901,Q['CustomerServiceBasePage']]:
        scriptcode+=q(0x60,parent)+b'\x30'
    scriptcode+=q(0x60,Q['CustomerServiceBasePage'])+q(0x58,newclass)+b'\x1d'*11+q(0x68,added[CLASS])+b'\x47'
    newcodes=[('cinit',b'\xd0\x30\x47',(1,1,13,14)),
              ('ctor',b'\xd0\x30\xd0\x49\0\xd0'+q(0x4f,added['gmInit'],0)+b'\x47',(1,1,14,15)),
              ('init',init,(4,2,14,15)),('add',lifecycle(True),(4,2,14,15)),
              ('remove',lifecycle(False),(4,2,14,15)),('click',click,(7,5,14,15)),
              ('script',scriptcode,(2,1,1,13))]
    def body(mid,code,limits):instructions(code);return u(mid,*limits,len(code))+code+b'\0\0'
    newbodies=b''.join(body(ids[name],code,lim) for name,code,lim in newcodes)
    edits=[(sec['ms'],sec['me'],u(mid+7)+source[sec['mc']:sec['me']]+infos),
           (sec['cs'],sec['ci'],u(newclass+1)),(sec['ce'],sec['ce'],instance),
           (sec['ss'],sec['si'],classinfo+u(sec['scripts']+1)),(sec['se'],sec['bi'],script+u(sec['bc']+7)),
           (len(source),len(source),newbodies)]
    changed=set()
    def change(mid,code,limits=None):
        old=full['bodies'][mid]
        if old['exceptions'] or old['body_traits']!=b'\0':raise ValueError('Unexpected GM body traits')
        edits.append((old['record_start'],old['end'],body(mid,code,limits or old['limits'])))
        changed.add(mid)
    win=catalog['CustomerServiceWin']['instance'];start,size,_=bodies[win['init'][0]];code=source[start:start+size]
    # Keep original three tabs and insert the restricted fourth after tab setup.
    b=Block();b.emit(q(0x60,Q['GlobalData'])+q(0x66,Q['role'])+q(0x66,Q['gmLevel'])+integer(9));b.branch(0x15,'normal')
    b.emit(q(0x5d,added[CLASS])+q(0x4a,added[CLASS],0)+q(0x80,Q['CustomerServiceBasePage'])+store(10))
    b.emit(setprop(local(10),'caption',st('GM命令')))
    b.emit(call(b'\xd0'+q(0x66,5577),'addChild',local(10)))
    b.emit(local(10)+integer(-5)+q(0x61,1656));b.label('normal');insert=b.finish()[0]
    labelop=next(o for o in instructions(code) if o.opcode==0x2c and pools(source)['strings'][3][o.operands[0]]=='一键吸附')
    extra=button(KILL_LABEL,324,78,77,'a|killAll|4|0',KILL_LABEL,index=11,parent=b'\xd0')
    extra+=call(get('_stateBtnList'),'push',local(11))
    patched,_=relocate(code,[(295,296,insert+b'\xd0'),(labelop.start,labelop.end,st(LABEL)),(size-1,size-1,extra)])
    change(win['init'][0],patched)
    start,size,_=bodies[win['onBtnClick'][0]];code=source[start:start+size]
    pull=next(o for o in instructions(code) if o.opcode==0x2c and pools(source)['strings'][3][o.operands[0]]=='@func gmAbsorbBosses')
    b=Block();b.emit(get('currentTarget',b'\xd1')+member(7,get('_stateBtnList')));b.branch(0x1a,'normal')
    b.emit(q(0x60,Q['ChatFunc'])+st(KILL_COMMAND)+q(0x4f,Q['doChatMessage'],1)+b'\x47');b.label('normal')
    patched,_=relocate(code,[(2,2,b.finish()[0]),(pull.start,pull.end,st(COMMAND))]);change(win['onBtnClick'][0],patched)
    # Original cleanup registered focus listeners again (and common page used
    # a killed local). Detach each actual input, preserving all other GM logic.
    for cls,fields in [('CustomerServiceCommonPage',[15610]),('CustomerServicePlayerPage',[15617,15621,15618])]:
        mid=catalog[cls]['instance']['removeEvent'][0];start,size,_=bodies[mid];code=source[start:start+size]
        ops=instructions(code);fixes=[]
        for op in ops:
            if op.opcode==0x4f and op.operands==(Q['addEventListener'],2):fixes.append((op.start,op.end,q(0x4f,Q['removeEventListener'],2)))
        if cls=='CustomerServiceCommonPage':
            fixes.append((116,117,b'\xd0'+q(0x66,15610)))
        code,_=relocate(code,fixes);change(mid,code)
    # Button skins have child display objects. Use the listener owner so a
    # caption/background click resolves to the same button as an edge click.
    for cls in ['CustomerServiceWin','CustomerServiceCommonPage','CustomerServicePlayerPage','CustomerServiceGamePage']:
        mid=catalog[cls]['instance']['onBtnClick'][0]
        old=full['bodies'][mid]
        existing=next((i for i,(a,b,v) in enumerate(edits) if a==old['record_start']),None)
        if existing is not None:
            reader=ABCReader(edits[existing][2])
            for _ in range(5):reader.u30()
            size=reader.u30();code=edits[existing][2][reader.pos:reader.pos+size]
        else:code=old['code']
        fixes=[(o.start,o.end,q(0x66,Q['currentTarget'])) for o in instructions(code)
               if o.opcode==0x66 and o.operands==(6311,)]
        if fixes:
            code,_=relocate(code,fixes)
            if existing is not None:edits[existing]=(old['record_start'],old['end'],body(mid,code,old['limits']))
            else:change(mid,code)
    result=bytearray(source)
    for a,b,value in sorted(edits,reverse=True):result[a:b]=value
    result=bytes(result);after=inspect_abc_full(result);_,cat,_=inspect_abc(result)
    for cls,value in catalog.items():
        if cat[cls]!=value:raise ValueError('Existing class traits changed: '+cls)
    for mid,value in full['bodies'].items():
        if mid not in changed and source[value['record_start']:value['end']] != result[after['bodies'][mid]['record_start']:after['bodies'][mid]['end']]:
            raise ValueError(f'Unrelated ABC body changed: {mid}')
    restored=bytearray(result);shift=0;restore=[]
    for a,b,value in sorted(edits):restore.append((a+shift,a+shift+len(value),source[a:b]));shift+=len(value)-(b-a)
    for a,b,value in reversed(restore):restored[a:b]=value
    if bytes(restored)!=source:raise ValueError('Unrelated ABC records changed')
    return result


def patch_swf(source):
    data,(tag,payload,start,end)=abc_section(source);abc=patch_abc(data[start:end])
    if abc==data[start:end]:return source
    result=data[:tag+2]+struct.pack('<I',start-payload+len(abc))+data[payload:start]+abc+data[end:]
    result=result[:4]+struct.pack('<I',len(result))+result[8:]
    if result[8:tag]!=data[8:tag] or result[start+len(abc):]!=data[end:]:raise ValueError('Unrelated SWF assets changed')
    return result[:8]+zlib.compress(result[8:],9)


def update_tutorial(source):
    """Update only GM instructions in the local, ignored deployment tutorial."""
    bom=source.startswith(b'\xef\xbb\xbf')
    text=source.decode('utf-8-sig')
    replacements={
        '1金币 2绑金 3元宝':'0绑金 1金币 2绑定元宝 3元宝',
        '@paymoney 1000（充值1000元宝）':'@func gmCommand "GmRecharge" "1000"（模拟充值1000元宝，检查余额、累计充值及积分上限）',
        '@func TestChangeJob （转职）':'@func TestChangeJob 1 （转职：1战士、2法师、3道士）',
        '@func SetGuildFlagExp  （设置行会旗帜经验）':'@func SetGuildFlagExp 50000 （设置行会旗帜经验）',
        '@func tobezero（清理数据）':'@func tobezero（重置全服开服活动领取人数与自身领取标志）',
        '@func addjunhunping 50000 （给背包的军魂瓶充满）':'@func addjunhunping 50000 （设置背包军魂瓶值，不超过瓶容量）',
        '@func GiveTotal 起源':'@func GiveTotal "起源"',
        '@func setbossrate 1.5':'@func setbossrate "1.5"',
    }
    lines=text.splitlines(keepends=True)
    result=[]
    for line in lines:
        if 'xfzp10' in line or 'xfzp100' in line:continue
        for old,new in replacements.items():line=line.replace(old,new)
        result.append(line)
    text=''.join(result)
    if '教程命令已加入 GM 面板的“GM命令”页' not in text:
        eol='\r\n' if '\r\n' in text else '\n'
        text=text.rstrip('\r\n')+eol*2+eol.join([
            '教程命令已加入 GM 面板的“GM命令”页，按常用查询、角色养成、材料设置、装备发放、地图规则、数据清理分类。',
            '填写参数后点击对应功能；留空使用按钮提示的默认值。显示头衔右侧为一键聚怪，其下为一键杀怪。',
            '命令行统一入口示例：@func gmCommand "setlevel" "255"，@func gmCommand "setbossrate" "1.5"，@func gmCommand "GiveTotal" "起源"。',
            ''])
    return (b'\xef\xbb\xbf' if bom else b'')+text.encode('utf-8')


if __name__=='__main__':
    parser=argparse.ArgumentParser(description=__doc__);parser.add_argument('--check',action='store_true');args=parser.parse_args()
    source=CLIENT.read_bytes();result=patch_swf(source)
    if args.check:
        if source!=result:raise SystemExit('GM command page is not installed')
        print('GM command page verified')
    else:
        CLIENT.write_bytes(result)
        tutorial=CLIENT.parent.parent/'文本教程.txt'
        if tutorial.exists():tutorial.write_bytes(update_tutorial(tutorial.read_bytes()))
        print('GM command page installed')
