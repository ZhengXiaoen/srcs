"""Expand server includes and compile complete Lua 5.1 script chunks."""
import argparse,re,sys
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
SERVER=ROOT/'Server/S1001'
DATA=SERVER/'data'

def expand(path,seen=None):
    seen=seen if seen is not None else set()
    source=path.read_bytes().removeprefix(b'\xef\xbb\xbf').split(b'\0',1)[0]
    # This server runs the zh-CN language branch; skip inactive preprocessor blocks.
    source=re.sub(rb'--#if LANGUAGE == zh-TW\r?\n.*?--#endif',b'',source,flags=re.S)
    source=re.sub(rb'--\[(=*)\[.*?\]\1\]',b'',source,flags=re.S)
    def include(m):
        name=m[1].decode().replace('\\','/')
        choices=[path.parent/name,SERVER/name,DATA/'functions'/name,DATA/name]
        choices.extend(parent/name for parent in path.parents if parent.is_relative_to(SERVER))
        target=next((p.resolve() for p in choices if p.is_file()),None)
        if target is None:
            matches=list(DATA.rglob(Path(name).name))
            if len(matches)==1:target=matches[0]
        if target is None:raise FileNotFoundError((path,name))
        if m[2] and target in seen:return b''
        seen.add(target)
        return expand(target,seen)
    return re.sub(rb'^--#include[ \t]+"([^"\r\n]+)"[ \t]*(once)?[^\r\n]*',include,source,flags=re.M)

if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--lua-path');args=p.parse_args()
    if args.lua_path:sys.path.insert(0,args.lua_path)
    from lupa.lua51 import LuaRuntime
    lua=LuaRuntime(encoding=None,unpack_returned_tuples=True)
    # GlobalFunction is checked by the real server preprocessor/startup.
    for name in ['functions/MonsterFunction.lua','config/monster/StdMonster.txt','config/monster/AdvanceMonsterEquipCfg.lua']:
        code=expand(DATA/name)
        result=lua.eval(b'loadstring')(code)
        if isinstance(result,tuple):raise RuntimeError(result[1])
        print('Compiled',name,len(code),'bytes')
