"""Verify the GM command against Lua 5.1 without touching the running server.

Run with --lua-path tools/fixtures/pickup-test-deps when lupa is not installed.
The GM command implementation is in Server/S1001/data/functions/player.lua.
"""
import argparse
from pathlib import Path
import sys
import unittest

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / "Server/S1001/data/functions/player.lua"
MARKER = "-- GM 面板统一入口："


class AbsorbBossTests(unittest.TestCase):
    def setUp(self):
        from lupa.lua51 import LuaRuntime
        self.lua = LuaRuntime(unpack_returned_tuples=True)
        source = SOURCE.read_text("utf-8-sig")
        compiled = self.lua.eval("loadstring")(source)
        if isinstance(compiled, tuple):
            raise AssertionError(compiled[1])
        self.lua.execute("""
LocalDT = {}; PROP_ENTITY_ID = 1; ttFlyTip = 1
scene = {}; otherScene = {}; monsters = {}; messages = {}; attempts = {}; moved = {}
player = {entityType=0, gmLevel=1, scene=scene, sceneId=83, x=100, y=100}
Actor = {
    getEntityType=function(e) return e.entityType end,
    getGMLevel=function(e) return e.gmLevel end,
    isDeath=function(e) return e.dead or false end,
    getScenePtr=function(e) return e.scene end,
    getSceneId=function(e) return e.sceneId end,
    getEntityPosition=function(e,x,y) assert(x==0 and y==0);return e.x,e.y end,
    getIntProperty=function(e,p) assert(p==PROP_ENTITY_ID);return e.id end,
    getMonsterOwner=function(e) return e.owner end,
    sendTipmsg=function(e,text,kind) assert(e==player and kind==ttFlyTip);table.insert(messages,text) end,
    enterScene=function(e,id,x,y,rx,ry)
        assert(e~=player and id==player.sceneId and rx==0 and ry==0)
        table.insert(attempts,{e=e,x=x,y=y})
        if e.blocked or x<0 or y<0 or e.rejectNear and math.abs(x-player.x)<=1 and math.abs(y-player.y)<=1 then
            return false
        end
        if e.disappear then e.scene=otherScene;return false end
        e.x=x;e.y=y;table.insert(moved,e);return true
    end
}
LuaHelp = {getSceneMonsterListByType=function(s,kind) assert(s==scene and kind==4);return monsters end}
System = {getMonsterTypeById=function(id) return id==2 and 1 or 4 end}
function boss(options)
    local e={entityType=1,id=1,scene=scene,sceneId=83,x=500,y=500,hp=123,mp=45,
        reward=678,refreshIndex=9,bornX=500,bornY=500,lifetime=111,damageOwner=222}
    for k,v in pairs(options or {}) do e[k]=v end
    table.insert(monsters,e);return e
end
""")
        self.lua.execute(source[source.index(MARKER):])

    def run_lua(self, setup, assertions):
        self.lua.execute(setup)
        self.lua.globals().gmAbsorbBosses(self.lua.globals().player)
        self.lua.execute(assertions)

    def test_current_instance_live_bosses_keep_all_existing_state(self):
        self.run_lua("a=boss();b=boss({hp=789})", """
assert(#moved==2)
for _,e in ipairs(monsters) do
    assert(e.scene==scene and math.abs(e.x-player.x)<=3 and math.abs(e.y-player.y)<=3)
    assert(e.x~=player.x or e.y~=player.y)
    assert(e.mp==45 and e.reward==678 and e.refreshIndex==9)
    assert(e.bornX==500 and e.bornY==500 and e.lifetime==111 and e.damageOwner==222)
end
assert(a.hp==123 and b.hp==789)
""")

    def test_non_gm_cannot_move_or_enumerate_monsters(self):
        self.run_lua("player.gmLevel=0;a=boss();LuaHelp.getSceneMonsterListByType=function() error('unauthorized enumeration') end",
                     "assert(#attempts==0 and a.x==500 and #messages==1)")

    def test_dead_player_cannot_absorb(self):
        self.run_lua("player.dead=true;a=boss()", "assert(#attempts==0 and a.x==500 and #messages==1)")

    def test_scene_instance_dead_normal_and_owned_entities_are_excluded(self):
        self.run_lua("""
valid=boss();wrongScene=boss({scene=otherScene});dead=boss({dead=true})
normal=boss({id=2});pet=boss({owner=player});corpse=boss({entityType=12})
zeroOwner=boss({owner=0})
""", """
assert(#moved==2 and moved[1]==valid and moved[2]==zeroOwner)
assert(wrongScene.x==500 and dead.x==500 and normal.x==500 and pet.x==500 and corpse.x==500)
""")

    def test_duplicate_monster_pointer_is_only_moved_once(self):
        self.run_lua("a=boss();table.insert(monsters,a)", "assert(#moved==1 and #attempts==1)")

    def test_blocked_nearest_tiles_fall_back_near_the_player(self):
        self.run_lua("a=boss({rejectNear=true})", """
assert(#moved==1 and #attempts>1)
assert(math.abs(a.x-player.x)==2 or math.abs(a.y-player.y)==2)
""")

    def test_fully_blocked_boss_stays_in_place_and_other_boss_still_moves(self):
        self.run_lua("a=boss({blocked=true});b=boss()", """
assert(#moved==1 and moved[1]==b and a.x==500 and a.y==500 and a.hp==123)
assert(#messages==1 and string.find(messages[1],'1'))
""")

    def test_monster_leaving_scene_stops_retrying(self):
        self.run_lua("a=boss({disappear=true})", "assert(#attempts==1 and #moved==0)")

    def test_map_edge_uses_other_surrounding_tiles(self):
        self.run_lua("player.x=0;player.y=0;a=boss()", "assert(#moved==1 and a.x>=0 and a.y>=0 and #attempts>1)")

    def test_empty_or_nil_scene_list_is_reported(self):
        self.run_lua("LuaHelp.getSceneMonsterListByType=function() return nil end", "assert(#attempts==0 and #messages==1)")

    def test_complete_global_include_chunk_compiles(self):
        # Reuse the established server preprocessor check, including its handling
        # of the engine-provided language data and two legacy GBK smart quotes.
        from lupa.lua51 import LuaRuntime
        import test_timed_activity_startup as startup
        startup.LuaRuntime = LuaRuntime
        startup.StartupTests().test_all_global_includes_compile()


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--lua-path")
    args, rest = parser.parse_known_args()
    if args.lua_path:
        sys.path.insert(0, args.lua_path)
    unittest.main(argv=[sys.argv[0], *rest])
