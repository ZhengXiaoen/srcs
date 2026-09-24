--#include "data\config\BossListInfo\BossListInfo.lua" once
--#include "data\config\monster\SRRefreshMonster.lua" once
--#include "data\config\monster\AdvanceMonsterEquipCfg.lua" once

function GetKillBoosListInfoForSceneName(sceneName)
    for i =1,table.getn(BossListInfo) do
        if BossListInfo[i].sceneName == sceneName then
            return BossListInfo[i]
        end
    end
    return nil
end
--获取左侧信息栏
function HandleGetLeftKillBoosListInfo(sysarg)
    
   local zLv = Actor.getIntProperty(sysarg,PROP_ACTOR_CIRCLE);
    local cfg = GetKillBossLeftBtnTable(zLv)
     local nCount = table.getn(cfg)
    local pack= DataPack.allocPacket(sysarg,139,228)
    DataPack.writeByte(pack,0)
    DataPack.writeByte(pack,nCount)
    for i =1,nCount do
        DataPack.writeString(pack,cfg[i].szName.."/"..cfg[i].szName..","..cfg[i].nMonsterId)
    end
    DataPack.flush(pack)
end

--获取可击杀BOSS的左边按钮列表
function GetKillBossLeftBtnTable(zLv)
    local svar = System.getDyanmicVar();
	local s = svar.srRefreshMonster;		--记录是否存活,1为存活,0为没有

	if s == nil then svar.srRefreshMonster = {}; s = svar.srRefreshMonster; end
    local ret_cfg = {}
   
    for i = 1,table.getn(RefreshMonsterData) do
        local cfg = RefreshMonsterData[i]

        local dg = 1;   --dg == 1 才显示
        local dgboss = {
            {bossid = 647, lv = {1}, },--天之★迷失之王
            {bossid = 648, lv = {2}, },--天之★赤月之王
            {bossid = 649, lv = {3}, },--天之★妖蛮之王
            {bossid = 650, lv = {4}, },--天之★修罗之王
            {bossid = 651, lv = {5}, },--天之★四脚魔王
            {bossid = 652, lv = {6}, },--天之★真龙之王
            {bossid = 653, lv = {7,8}, },--天之★炽焰山王
            {bossid = 654, lv = {9,10,11,12,13}, },--天之★雷炎之王
            {bossid = 696, lv = {1}, },--暗之★迷失教主
            {bossid = 697, lv = {2}, },--暗之★赤月教主
            {bossid = 698, lv = {3}, },--暗之★妖蛮教主
            {bossid = 699, lv = {4}, },--暗之★修罗教主
            {bossid = 700, lv = {5}, },--暗之★四脚魔王
            {bossid = 701, lv = {6}, },--暗之★真龙教主
            {bossid = 702, lv = {7,8}, },--暗之★炽炎教主
            {bossid = 703, lv = {9,10,11,12,13}, },--暗之★骷髅教主
            {bossid = 705, lv = {1}, },--重装★迷失教主
            {bossid = 706, lv = {2}, },--重装★赤月教主
            {bossid = 707, lv = {3}, },--重装★妖蛮教主
            {bossid = 708, lv = {4}, },--重装★修罗教主
            {bossid = 709, lv = {5}, },--重装★四脚魔王
            {bossid = 710, lv = {6}, },--重装★真龙教主
            {bossid = 711, lv = {7,8}, },--重装★炽炎教主
            {bossid = 712, lv = {9,10,11,12,13}, },--重装★雷炎教主

        };  --转身地宫BOSS根据转生等级显示
        zLv = tonumber(zLv)
        for i = 1,#dgboss do
            if cfg.monid == dgboss[i].bossid then
                dg = 0;
                for k = 1,#dgboss[i].lv do
                    if zLv == dgboss[i].lv[k] then dg = 1; end
                    --print(string.format("dgboss[i].bossid:%s dg:%s zLv:%s dgboss[i].lv[k]:%s", dgboss[i].bossid, dg, zLv, dgboss[i].lv[k]))
                end
            end
        end

    
        if s[cfg.bj] == 1 and cfg.kill == 1 and dg == 1 and cfg.notshow == nil then
         --去重
            local bFind = false
            for j = 1,table.getn(ret_cfg) do
                local szName = System.getMonsterNameById(cfg.monid) 
                if ret_cfg[j].nMonsterId == cfg.monid or ret_cfg[j].szName == szName then
                    bFind = true
                    break
                end
            end
            if bFind == false then
                local t_cfg = {}
                t_cfg.szName = System.getMonsterNameById(cfg.monid) 
                t_cfg.nMonsterId = cfg.monid
               
                table.insert(ret_cfg,t_cfg)
            end
        end
       
    end
    --根据等级排序
     local sort = function(a, b)
        local naLevel = System.getMonsterLevelById(a.nMonsterId)
        local nbLevel = System.getMonsterLevelById(b.nMonsterId)
		return naLevel < nbLevel
	end
    table.sort(ret_cfg,sort)
    return ret_cfg
end
function HandleGetRightKillBoosListInfo(sysarg,str)
    local pos = string.find(str, ",")
    if pos == nil or pos == 0 then return end
    --local t = lua_string_split(str,",")
    local szName = string.sub(str,1,pos-1)
    local nMonsterId = tonumber(string.sub(str,pos+1,string.len(str)))
   
    local table_map={}
    local table_itemid ={}
    for i =1,table.getn(RefreshMonsterData) do
        local cfg = RefreshMonsterData[i]
        
           if System.getMonsterNameById(cfg.monid)  == szName then
             table.insert(table_map,cfg)
            end
    end
    --取掉落道具
    for i =1,table.getn(BossEquipCfg) do
        local cfg= BossEquipCfg[i]
        if cfg[1] == nMonsterId then
            for j =2,table.getn(cfg) do
                table.insert(table_itemid,cfg[j])
            end
            break
        end
    end
    ShowRightKillBossListInfo(sysarg,nMonsterId,table_itemid,table_map)
end

function ShowRightKillBossListInfo(sysarg,nMonsterId,table_itemid,table_map)
    local pack= DataPack.allocPacket(sysarg,139,228)
    DataPack.writeByte(pack,1)
    DataPack.writeInt(pack,nMonsterId)
    local nItemCount = table.getn(table_itemid)
    DataPack.writeByte(pack,nItemCount)
    for i =1,nItemCount do
        DataPack.writeWord(pack,table_itemid[i])
    end
    local nMapCount = table.getn(table_map)
    
    local szMap = ""

    --构造文字连接
    local svar = System.getDyanmicVar();
	local s = svar.srRefreshMonster;		--记录是否存活,1为存活,0为没有

	if s == nil then svar.srRefreshMonster = {}; s = svar.srRefreshMonster; end
    for i = 1,table.getn(table_map) do
        local move = table_map[i].move
        local szMapName = Fuben.getSceneNameById(table_map[i].mapid)
        if s[table_map[i].bj] == 1 then
            if move ~= nil then
                local link = string.format("<(c0xFF00CC00)"..szMapName..">".."<(x%s:%s:%s:%s)>", move.mapname, move.mapx , move.mapy, move.npcname);
                szMap = szMap.."    "..link
            end
        else
            if move ~= nil then
                local link = "<(c0xFF7B8483)"..szMapName.."[传]>"
                szMap = szMap.."    "..link
            end

        end
        if i % 3 == 0 then 
            szMap = szMap.."\\"
        end
    end
    
    DataPack.writeString(pack,szMap)
    DataPack.flush(pack)
   
end
function HandleGetKillBoosListInfoCallBack(sysarg,packet)
    local szFuncName = DataPack.readString(packet)
    local argCount = DataPack.readByte(packet) --参数数量
    --print("szFuncName:"..szFuncName)
    local arr_arg = {}
    for i = 1,argCount do
        table.insert(arr_arg,DataPack.readString(packet))
    end
    local globalFunc = _G[szFuncName]
		if globalFunc then
			 globalFunc(sysarg, arr_arg)
	    end
end



function onKillBossMapGo(sysarg,data)
    local SceneId = tonumber(data[1]);
    local x = tonumber(data[2]);
    local y = tonumber(data[3]);
    local monsterId = tonumber(data[4]);
    
    local mySceneId = Actor.getSceneId(sysarg);
    --print(mySceneId,SceneId)
    if mySceneId == SceneId then
        Actor.autoFindPathToKillMonster(sysarg, SceneId, x, y, monsterId);
    else
        Actor.sendTipmsg(sysarg, string.format("您当前不在<%s>地图上,无法寻路过去哟.", Fuben.getSceneNameById(SceneId)), ttFlyTip);
    end
end






MiscsImplement.HandleKillBossListInfo =  function( sysarg, msgid, packet )
    local type = DataPack.readByte(packet)
    if type == 0 then
        HandleGetLeftKillBoosListInfo(sysarg)
    elseif type == 1 then
        
        HandleGetRightKillBoosListInfo(sysarg,DataPack.readString(packet))
    elseif type == 2 then
        HandleGetKillBoosListInfoCallBack(sysarg,packet)
    end
end


MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cKillBossInfo, MiscsImplement.HandleKillBossListInfo)
