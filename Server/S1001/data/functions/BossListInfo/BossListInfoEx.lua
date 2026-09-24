--#include "data\config\BossListInfo\BossListInfo.lua" once
--#include "data\config\monster\AdvanceMonsterEquipCfg.lua" once
--#include "data\config\monster\SRRefreshMonster.lua" once
function GetBoosListInfoForSceneName(sceneName)
    for i =1,table.getn(BossListInfo) do
        if BossListInfo[i].sceneName == sceneName then
            return BossListInfo[i]
        end
    end
    return nil
end


--获取左侧信息栏
function HandleGetLeftBoosListInfo(sysarg)
    if System.isCrossServer() ==  true and Actor.getEnterCrossType(sysarg) == 2 then
        return
    end
    
    -- 玩家有可能没有初始化完成就调用了
    if not Actor.IsActorInited(sysarg) then
		return
	end
	
    local nCount = table.getn(BossListInfo)
   
    local pack= DataPack.allocPacket(sysarg,139,205)
    DataPack.writeByte(pack,0)
    DataPack.writeByte(pack,nCount)
    for i =1,nCount do
        DataPack.writeString(pack,BossListInfo[i].sceneName)
    end
    DataPack.flush(pack)
end


function HandleGetRightBoosListInfo(sysarg,sceneName)

    if type(sceneName) == "table" then
        local info = GetBoosListInfoForSceneName(sceneName[1])
        if info == nil then return end
        HandleTestBoos(sysarg, info.args, sceneName[1], sceneName[2] );
        return
    end
    local info = GetBoosListInfoForSceneName(sceneName)
    if info == nil then return end

    if bossid then
        HandleTestBoos(sysarg, info.args, sceneName, bossid );
    else
        HandleTestBoos(sysarg,info.args,sceneName)
    end
   -- ShowRightBossListInfo(sysarg,info.scripte)
   
end

--玩家传送到BOSS地图显示右侧对话框
function HandlePlayerEnterSceneBossTips(sysarg,nSceneId)
    nSceneId = tonumber(nSceneId)
    if Actor.existTimer(sysarg,39) then
        Actor.deleteTimer(sysarg,39) 
    end 
    local temp = {}
    for i = 1,table.getn(RefreshMonsterData) do
        if RefreshMonsterData[i].mapid == nSceneId then
            table.insert( temp, RefreshMonsterData[i])
        end
    end
    if table.getn(temp) > 0 then
        HandlePlayerEnterSceneBossRefresh(sysarg,temp,nSceneId)
        --添加刷新定时器id
        Actor.addTimer(sysarg,39,30 * 1000)
    end
end

--刷新tips右侧栏
function HandlePlayerEnterSceneBossRefresh(sysarg,temp,nSceneId)
    if not temp then return; end
    local e = "\\";

    local svar = System.getDyanmicVar(sysarg);
    local s = svar.srRefreshMonster;		--记录是否存活,1为存活,0为没有
    local remaining = svar.srrmRemaining;	--记录刷怪剩余时间,如果等于0就刷
    if s == nil then svar.srRefreshMonster = {}; s = svar.srRefreshMonster; end
    if remaining == nil then svar.srrmRemaining = {}; remaining = svar.srrmRemaining; end


    for i = 1,table.getn(temp) do
        local d = temp[i];

        local nMaxMonsterNameLen =0
        local nMaxMapss = 16 
        local nMaxTime = 0

        local MonsterName = System.getMonsterNameById(d.monid);
        local SceneName = Fuben.getSceneNameById(d.mapid);
        local nShowLen = GetUtf8ShowLen(MonsterName)
        if nShowLen > nMaxMonsterNameLen   then
            nMaxMonsterNameLen = nShowLen
        end
        local mapsss = string.format("(%s,%s)", d.x, d.y);
        local mapgo = string.format("%s%s",SceneName, mapsss)

        local sTime = ""
        if s[d.bj] == 1 then
            sTime = "<(c0xFF00CCFF)存活>";
        else
            local syt = remaining[d.bj];
            if syt == nil then syt = 0; end
            sTime = "<"..syt.."分钟后复活>";
        end
        nShowLen = GetUtf8ShowLen(sTime)
        if nShowLen > nMaxTime then
            nMaxTime = nShowLen
        end

                local showLen = 0
                local kg = "";
                showLen = GetUtf8ShowLen(MonsterName)
                if showLen < nMaxMapss then
                    for j =1,nMaxMapss - showLen do
                         kg = kg .. " "   
                    end
                end

        local sMapGo = string.format(" <#c0xFFFF9900#%s/@onBossMapGo,%s,%s,%s,%s>%s %s", MonsterName, d.mapid, d.x, d.y, d.monid, kg, sTime);
       
        e = e .. sMapGo.."\\";
    end
    local sceneCfg =
    {
        {
            layer =1,
            sceneId = {98,303,304,305,306,307,388,389,390,391,392,414,415,416,417,418,},
        },
        {
            layer =2,
            sceneId = {99,308,309,310,311,312,393,394,395,396,397,419,420,421,422,423,},
        },
        {
            layer = 3,
            sceneId = {100,313,314,315,316,317,398,399,400,401,402,},
        },
        {
            layer = 4,
            sceneId = {101,378,379,380,381,382,},
        },
        {
            layer = 5,
            sceneId = {102,383,384,385,386,387,},
        },
    }
   
    local nIndex = 0
    for i = 1,table.getn(sceneCfg) do
        for j = 1,table.getn(sceneCfg[i].sceneId) do
            if nSceneId == sceneCfg[i].sceneId[j] then
                 nIndex = i + 1
                break

            end
        end
    end
    local bTab = false
    if nIndex > 0 and nIndex <= table.getn(sceneCfg) then
        
        e = e .. "\\      <前往"..sceneCfg[nIndex].layer.."层/@HandleKillBossEnterLayer,"..tostring(nIndex).."|点击即可自动寻路至NPC处>"
        bTab = true
    end

    nIndex = nIndex - 2
    if nIndex > 0 and nIndex <= table.getn(sceneCfg) then
        if bTab == true then
            e  = e.."      "   
         else
            e= e.." "   
        end
         e = e .. "  <前往"..sceneCfg[nIndex].layer.."层/@HandleKillBossEnterLayer,"..tostring(nIndex).."|点击即可自动寻路至NPC处>\\"
    end
    e = e.."\\"
    --e = e .. "\\ <刷新当前地图BOSS存活信息/@HandlePlayerEnterSceneBossTips,"..nSceneId..">"
    ShowRightBossListInfo(sysarg,2,e);
  
end

function HandleKillBossEnterLayer(sysarg,nIndex)
   
    local sceneCfg =
    { 
        {
            layer =1,
            sceneId = {98,303,304,305,306,307,388,389,390,391,392,414,415,416,417,418,},
        },
        {
            layer =2,
            sceneId = {99,308,309,310,311,312,393,394,395,396,397,419,420,421,422,423,},
        },
        {
            layer = 3,
            sceneId = {100,313,314,315,316,317,398,399,400,401,402,},
        },
        {
            layer = 4,
            sceneId = {101,378,379,380,381,382,},
        },
        {
            layer = 5,
            sceneId = {102,383,384,385,386,387,},
        },
    }
    
    if nIndex == nil then return end
    nIndex = nIndex[1]
    nIndex = tonumber(nIndex)
   
    if nIndex <= 0 or nIndex > table.getn(sceneCfg) then
        return 
    end
--    local nNeedCount = 100000
--    if Actor.getMoneyCount(sysarg,mtBindCoin) < nNeedCount then
--        Actor.sendTipmsg(sysarg,"绑金不足"..nNeedCount.."，无法传送。",ttFlyTip)
--        return
--    end
--    local bChuan = false
--    local cfg = sceneCfg[nIndex]
   local nSceneId = Actor.getSceneId(sysarg)
--    for j = 1,table.getn(cfg.sceneId) do
--       local _list = LuaHelp.getSceneActorListById(cfg.sceneId[j])  
--       if _list == nil then _list = {} end
--        if table.getn(_list) < 30 then
--                    bChuan = true
--                  local sceneName = Fuben.getSceneNameById(cfg.sceneId[j]); 
--                   Actor.telportSceneRandPos(sysarg,sceneName)
--                break
--        end
--    end
--    if bChuan == false then
--      local sceneName = Fuben.getSceneNameById(cfg.sceneId[1]); 
--      Actor.telportSceneRandPos(sysarg,sceneName)
--    end
    Actor.autoFindPathToNpc(sysarg,nSceneId,"散人殿堂")
    --Actor.changeMoney(sysarg,mtBindCoin,-nNeedCount,LogIds.sanrendiantang,"散人殿堂进入")
end

function ShowRightBossListInfo(sysarg,btype,str)
    if System.isCrossServer() ==  true and Actor.getEnterCrossType(sysarg) == 2 then
        return
    end
    
    -- 玩家有可能没有初始化完成就调用了
    if not Actor.IsActorInited(sysarg) then
		return
	end
	
    local pack= DataPack.allocPacket(sysarg,139,205)
    DataPack.writeByte(pack,btype)
    DataPack.writeString(pack,str)
    DataPack.flush(pack)
end
function HandleGetBoosListInfoCallBack(sysarg,packet)
    local szFuncName = DataPack.readString(packet)
    local argCount = DataPack.readByte(packet) --参数数量
   
    local arr_arg = {}
    for i = 1,argCount do
        table.insert(arr_arg,DataPack.readString(packet))
    end
    
	
		
    local globalFunc = _G[szFuncName]
		if globalFunc then
			 globalFunc(sysarg, arr_arg)
	    end
end

function StringTab(n,string,z)
    local kg = "";
    local kg_num = n - string.len(string) / z * 2;
    for i = 1,kg_num do
        kg = kg .. " ";
    end
    return string .. kg;
end

function onBossMapGo(sysarg,data)
   -- print("onBossMapGo")
--    local SceneId = tonumber(data[1]);
--    local x = tonumber(data[2]);
--    local y = tonumber(data[3]);
--    local monsterId = tonumber(data[4]);

--    local mySceneId = Actor.getSceneId(sysarg);

--    if mySceneId == SceneId then
--        Actor.autoFindPathToKillMonster(sysarg, SceneId, x, y, monsterId,1);
--    else
--        Actor.sendTipmsg(sysarg, string.format("您当前不在<%s>地图上,无法寻路过去哟.", Fuben.getSceneNameById(SceneId)), ttFlyTip);
--    end
end
function GetUtf8ShowLen(str)
    local nLen = 0
     for ch in string.gmatch(str,"([%z\1-\127\194-\244][\128-\191]*)") do
        if #ch ~= 1 then
            nLen = nLen + 2
        else
            nLen = nLen + 1
        end
        
     end
    
     return nLen
end

function HandleBossTransfer(sysarg,arg)
   
    local npc_mapname = arg[1]
    local npc_npcx = tonumber(arg[2])
    local npc_npcy = tonumber(arg[3])
    local npc_npcname =arg[4]
    local nSceneID = Fuben.getSceneIdByName(npc_mapname)
    if nSceneID == 0 then return end
    local nNeedMoney = 100000
    if Actor.getMoneyCount(sysarg,mtBindCoin) < nNeedMoney then
        if Actor.getMoneyCount(sysarg,mtCoin) < nNeedMoney then
            Actor.sendTipmsg(sysarg,"绑金/金币不足"..nNeedMoney..",无法传送!",ttFlyTip)
            return
        else
            Actor.changeMoney(sysarg,mtCoin,-nNeedMoney,LogIds.bosschuansong,"野外boss传送")
        end
    else
        Actor.changeMoney(sysarg,mtBindCoin,-nNeedMoney,LogIds.bosschuansong,"野外boss传送")
    end
  
    Actor.enterScene(sysarg,nSceneID,npc_npcx,npc_npcy) 
  
    System.broadcastTipmsg(string.format("<(n%s)>进入<%s>.", Actor.getName(sysarg),npc_mapname),ttChatWindow)
--    if string.len(npc_npcname) > 0 then
--         local dVar =  Actor.getDyanmicVar(sysarg)
--        dVar.talkbossnpc = npc_npcname
--        Actor.addTimer(sysarg,46,500)
--    end
    -- print(npc_mapname,npc_npcx,npc_npcy,npc_npcname)
end
function HandleTestBoos(sysarg,arragr,sceneNameEEE,bossid)

	local a = tonumber(arragr[1]);
	local b = tonumber(arragr[2]);
    local npc_mapname = arragr[4];
    local npc_npcname = arragr[5];
    local npc_npcx = arragr[6];
    local npc_npcy = arragr[7];
    
    --Actor.sendTipmsg(sysarg, string.format("<(c0xFFd5d5d5)%s>地图的BOSS信息刷新成功.", arragr[3]), 256);
    --local npccss = string.format("<(x%s:%s:%s:%s)>", npc_mapname, npc_npcx, npc_npcy, npc_npcname);
    local npccss = ""
    if string.find(npc_mapname,"散人殿堂") ~= nil then
        npccss  = string.format("<传/@HandleBossTransfer,%s,%s,%s,%s>", npc_mapname, npc_npcx, npc_npcy, npc_npcname);
    else
        npccss = string.format("<(x%s:%s:%s:%s)>", npc_mapname, npc_npcx, npc_npcy, npc_npcname);
    end
     

	local e = string.format("<(c0xFFd5d5d5)以下是> <(c0xFF00CCFF)%s>%s <(c0xFFd5d5d5)BOSS刷新信息:> <#c0xFFd5d5d5#刷新信息/@HandleGetRightBoosListInfo,%s|点击实时刷新以下地图BOSS信息>\\\\", arragr[3], npccss, sceneNameEEE);

    local svar = System.getDyanmicVar(sysarg);
    local s = svar.srRefreshMonster;		--记录是否存活,1为存活,0为没有
    local remaining = svar.srrmRemaining;	--记录刷怪剩余时间,如果等于0就刷
    if s == nil then svar.srRefreshMonster = {}; s = svar.srRefreshMonster; end
    if remaining == nil then svar.srrmRemaining = {}; remaining = svar.srrmRemaining; end

    local bossstr = "<%s><(c0xFFd5d5d5) 在> %s <(c0xFFd5d5d5)状态:>%s <#c0xFFFFFF00#查看极品掉落/@HandleGetRightBoosListInfo,%s,%s>\\";
    --先取出最长的显示长度
    
    local nMaxMonsterNameLen =0
    local nMaxMapss = 0 
    local nMaxTime = 0
    for i = 1,#RefreshMonsterData do
		local d = RefreshMonsterData[i];
		for k = a,b do
			if d.bj == k then
				local MonsterName = System.getMonsterNameById(d.monid);
                local SceneName = Fuben.getSceneNameById(d.mapid);
                local nShowLen = GetUtf8ShowLen(MonsterName)
                if nShowLen > nMaxMonsterNameLen   then
                    nMaxMonsterNameLen = nShowLen
                end
                local mapsss = string.format("(%s,%s)", d.x, d.y);
                local mapgo = string.format("%s%s",SceneName, mapsss)
               
                nShowLen = GetUtf8ShowLen(mapgo)
                if nShowLen > nMaxMapss then
                    nMaxMapss = nShowLen
                end
                local sTime = ""
                if s[k] == 1 then
					sTime = "存活";
				else
                    local syt = remaining[k];
                    if syt == nil then syt = 0; end
					sTime = syt.."分钟后复活";
				end
                nShowLen = GetUtf8ShowLen(sTime)
                if nShowLen > nMaxTime then
                    nMaxTime = nShowLen
                end
             
            end
        end
    end
	for i = 1,#RefreshMonsterData do
		local d = RefreshMonsterData[i];
		for k = a,b do
			if d.bj == k then
				local MonsterName = System.getMonsterNameById(d.monid);
				local SceneName = Fuben.getSceneNameById(d.mapid);
				local MonsterZt = "";
                local bFlag =1
                if s[k] == 1 then
					MonsterZt = "存活";
                    bFlag  = 0
				else
                    local syt = remaining[k];
                    if syt == nil then syt = 0; end
					MonsterZt = syt.."分钟后复活";
				end


--				if s[k] == 1 then
--					MonsterZt = "<(c0xFF00CCFF)存活>";
--				else
--                    local syt = remaining[k];
--                    if syt == nil then syt = 0; end
--					MonsterZt = "<"..syt.."分钟后复活>";
--				end
                local mapsss = string.format("(%s,%s)", d.x, d.y);
             
                local mapgo = string.format("%s%s",SceneName, mapsss)

                local showLen = 0
                showLen = GetUtf8ShowLen(mapgo)
                if showLen < nMaxMapss then
                    for j =1,nMaxMapss - showLen do
                         mapsss = mapsss.." "   
                    end
                end
                
                local sMapGo = string.format("<#c0xFF00CCFF#%s%s/@onBossMapGo,%s,%s,%s,%s>", SceneName, mapsss, d.mapid, d.x, d.y, d.monid);
			    showLen  = GetUtf8ShowLen(MonsterName)
              
                if showLen < nMaxMonsterNameLen then
                    for j =1,nMaxMonsterNameLen - showLen do
                        MonsterName = MonsterName.." "
                    end
                end
                showLen  = GetUtf8ShowLen(MonsterZt)
              
                if showLen < nMaxTime then
                    for j =1,nMaxTime - showLen do
                        MonsterZt = MonsterZt.." "
                    end
                  
                end

                if bFlag == 0 then
                    MonsterZt ="<(c0xFF00CCFF)"..MonsterZt..">"
                else    
                    MonsterZt = "<"..MonsterZt..">"
                end
                e = e .. string.format(bossstr, MonsterName, sMapGo, MonsterZt, sceneNameEEE, d.monid);
          
			end
		end
	end

    --额外增加显示
    if arragr.add then
        for k = 1,#arragr.add do
            local i = arragr.add[k];
            local d = RefreshMonsterData[i];
            local MonsterName = System.getMonsterNameById(d.monid);
            local SceneName = Fuben.getSceneNameById(d.mapid);
            local MonsterZt = "";
            local bFlag =1
            if s[d.bj] == 1 then
				MonsterZt = "存活";
                bFlag  = 0
			else
                local syt = remaining[d.bj];
                if syt == nil then syt = 0; end
				MonsterZt = syt.."分钟后复活";
			end

            local mapsss = string.format("(%s,%s)", d.x, d.y);
            local mapgo = string.format("%s%s",SceneName, mapsss)
            local showLen =0 
            local showLen = 0
            showLen = GetUtf8ShowLen(mapgo)
            if showLen < nMaxMapss then
                for j =1,nMaxMapss - showLen do
                        mapsss = mapsss.." "   
                end
            end
            local sMapGo = string.format("<#c0xFF00CCFF#%s%s/@onBossMapGo,%s,%s,%s,%s>", SceneName, mapsss, d.mapid, d.x, d.y, d.monid);
		    
            showLen  = GetUtf8ShowLen(MonsterName)
              
            if showLen < nMaxMonsterNameLen then
                for j =1,nMaxMonsterNameLen - showLen do
                    MonsterName = MonsterName.." "
                end
            end

             showLen  = GetUtf8ShowLen(MonsterZt)
              
                if showLen < nMaxTime then
                    for j =1,nMaxTime - showLen do
                        MonsterZt = MonsterZt.." "
                    end
                  
                end

                if bFlag == 0 then
                    MonsterZt ="<(c0xFF00CCFF)"..MonsterZt..">"
                else    
                    MonsterZt = "<"..MonsterZt..">"
                end
            e = e .. string.format(bossstr, MonsterName, sMapGo, MonsterZt, sceneNameEEE, d.monid);
        end
    end

    if bossid then
        local bossid = tonumber(bossid);
        e = e .. string.format("\\<(idecoLine#435)>\\\\<%s>%s <(c0xFFd5d5d5)的主要极品掉落产出:>\\\\        ", System.getMonsterNameById(bossid), npccss);
        for j = 1,#BossEquipCfg do
            if bossid == BossEquipCfg[j][1] then
                local job = Actor.getIntProperty(sysarg,PROP_ACTOR_VOCATION);
                local ame = BossEquipCfg[j];
                if ame then

                    local fa,fb = 2,#ame
                    if table.getn(ame) == 19 then
                        if job == 1 then fa,fb = 2,7; end
                        if job == 2 then fa,fb = 8,13; end
                        if job == 3 then fa,fb = 14,19; end
                    end

                    for u = fa,fb do
                        e = e .. ipk(ame[u]) .. " ";
                        if u == 7 or  u == 13 or u == 19 then
                            e = e .. "\\        ";
                        end
                    end
                end
                break;
            end
        end
    else
        if arragr.itemlist then
            local job = Actor.getIntProperty(sysarg,PROP_ACTOR_VOCATION);
            local il = arragr.itemlist;
            local fa,fb = 1,#il
            if table.getn(il) == 18 then
                if job == 1 then fa,fb = 1,6; end
                if job == 2 then fa,fb = 7,12; end
                if job == 3 then fa,fb = 13,18; end
            end

            e = e .. string.format("\\<(idecoLine#435)>\\\\<(c0xFFd5d5d5)在> <(c0xFF00CCFF)%s>%s <(c0xFFd5d5d5)中BOSS极品掉落产出:>\\\\        ", arragr[3], npccss);
            
            for j = fa,fb do
                e = e .. ipk(il[j]) .. " ";
                if j == 6 or  j == 12 or j == 18 then
                    e = e .. "\\        ";
                end
            end
        end
    end





    ShowRightBossListInfo(sysarg,1, e);

end

function ipk(id)
    if not id then id = 1; end
    return string.format("<(iitem#%s#1)>",id);
end

-- d = {monid=0,mapid=0,x=0,y=0,refreshTime=0}
function BuildCrossBossInfoUIString(d)
    local e = ""
        
    local nMaxMonsterNameLen = 0
    local nMaxMapss = 16 
    local nMaxTime = 0

    local MonsterName = System.getMonsterNameById(d.monid)
    local SceneName = Fuben.getSceneNameById(d.mapid)
    
    local MonsterNameLen = GetUtf8ShowLen(MonsterName)
    local nShowLen = MonsterNameLen
    if nShowLen > nMaxMonsterNameLen then
        nMaxMonsterNameLen = nShowLen
    end
    local mapsss = string.format("(%s,%s)", d.x, d.y)
    local mapgo = string.format("%s%s",SceneName, mapsss)

    local sTime = ""
    if d.refreshTime == 0 then
        sTime = "<(c0xFF00CCFF)存活>"
    else
    	local syt = d.refreshTime - System.getCurrMiniTime()
    	if syt < 0 then syt = 0 end
        syt = math.floor((syt + 59) / 60)
        sTime = "<"..syt.."分钟后复活>"
    end
    nShowLen = GetUtf8ShowLen(sTime)
    if nShowLen > nMaxTime then
        nMaxTime = nShowLen
    end

	local kg = ""
    nShowLen = MonsterNameLen
    if nShowLen < nMaxMapss then
        for j =1,nMaxMapss - nShowLen do
             kg = kg .. " "   
        end
    end

    local sMapGo = string.format(" <#c0xFFFF9900#%s/@onBossMapGo,%s,%s,%s,%s>%s %s", MonsterName, d.mapid, d.x, d.y, d.monid, kg, sTime)
    e = e .. sMapGo.."\\"    
     
    return e
end

function BuildAllCrossBossInfoUIString(sceneId)
	if sceneId == 0 then return end
	
	local cfg = nil
	for i, v in ipairs(YuanGuZhanChangCfg.RefMonsters) do
		if v.mapId == sceneId then
			cfg = v
			break
		end			
	end
	
	if cfg == nil then return end	
	
	local e = "\\" -- 换行
	
	local count = 0
	local bossInfoList = LuaHelp.getAllCrossBossInfoFromSceneId(sceneId)
	if bossInfoList ~= nil then
		count = math.floor(#bossInfoList / 2)
	end
	
	local info = {monid=0,mapid=sceneId,x=0,y=0,refreshTime=0}
	for i, bossId in ipairs(cfg.bossIds) do
		info.monid = bossId
		info.x = cfg.points[i][1]
		info.y = cfg.points[i][2]
		info.refreshTime = 0
		
		for j = 1, count do
			if bossInfoList[j * 2 - 1] == bossId then
				info.refreshTime = bossInfoList[j * 2]
				break
			end
		end
		
		e = e .. BuildCrossBossInfoUIString(info)
	end	
		
	e = e .. "\\        <离开远古战场/@Button_ExitYuanGuZhanChang>"
	
	return e	
end

function RefreshCrossBossInfoUIToActor(sysarg)
	local sceneId = Actor.getSceneId(sysarg)
	local e = BuildAllCrossBossInfoUIString(sceneId)
	if e == nil then return end
	
	ShowRightBossListInfo(sysarg, 2, e)
end

function RefreshCrossBossInfoUIToAllActor(sceneId)
	local e = BuildAllCrossBossInfoUIString(sceneId)
	if e == nil then return end
	
	local playerList = LuaHelp.getSceneActorListById(sceneId)	
	if playerList == nil then return end
	
	for i = 1, #playerList do
		local player = playerList[i]
		if player then
			ShowRightBossListInfo(player, 2, e)
		end
	end
	
end

-- 退出远古战场
function Button_ExitYuanGuZhanChang(sysarg)
	if not System.isCrossServer() then return end
	
	Actor.exitCrossServer(sysarg)
end