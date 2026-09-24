--#include "data\config\NationalDayActivityCfg.lua" once

--预告
function NalDayActivityBossings(nMinute)
	--是否在开关时间内
	local svar = System.getStaticVar()
	if svar.National_openDay ==nil or svar.National_openDay==0 then 
		return 
	end
	
	if svar.isDringNational ==nil or svar.isDringNational<1 or svar.isDringNational>svar.National_openDay then 
		return 
	end
	
	-----------------------------------------------------------------------------------------------------------------
    local str =nMinute.."分钟后,携带极品装备的国庆boss将现身<(c0xFFFF0000)热血王城>。<查看活动/@@showWin,155,3>"
    System.broadcastTipmsg(str,ttScreenCenter + ttChatWindow)
    if tonumber(nMinute) == 1 then
        System.addTimer("NalDayActivityBossingEx",1000 * 20,-1)
    end
end

function NalDayActivityBossingEx()
	--是否在开关时间内
	local svar = System.getStaticVar()
	if svar.National_openDay ==nil or svar.National_openDay==0 then 
		return 
	end
	
	if svar.isDringNational ==nil or svar.isDringNational<1 or svar.isDringNational>svar.National_openDay then 
		return 
	end
	
	
    local cfg = NationalDayActivityCfg.NalDayActivityWangChengBoss
    local ex = "我也要参加<(x"..Fuben.getSceneNameById(cfg.sceneId)..":"..cfg.x..":"..cfg.y..":[传])>"
    local str = "携带极品装备的国庆boss将现身<(c0xFFFF0000)热血王城>"..ex
    System.broadcastTipmsg(str,ttScreenCenter+ ttChatWindow)
end

--活动开始
function NalDayActivityBossingStart()
	--是否在开关时间内
	local svar = System.getStaticVar()
	if svar.National_openDay ==nil or svar.National_openDay==0 then 
		return 
	end
	
	if svar.isDringNational ==nil or svar.isDringNational<1 or svar.isDringNational>svar.National_openDay then 
		return 
	end
	
	
    System.deleteTimer("NalDayActivityBossingEx")
    local cfg = NationalDayActivityCfg.NalDayActivityWangChengBoss
    local sVar = System.getDyanmicVar()
    sVar.NalDayActivityBossing = 1 
    local hScene = Fuben.getSceneHandleById(cfg.sceneId, 0)
    sVar.NalDayActivityboss = {}
    sVar.NalDayActivityboss.hp = {}
    for i= 1,table.getn(cfg.hpNocite) do
         sVar.NalDayActivityboss.hp[i] = 0
    end
    Fuben.clearMonster(hScene,cfg.bossId)
	local pMonster = Fuben.createMonster(hScene, cfg.bossId, cfg.x, cfg.y, 0)
    sVar.NalDayActivityboss.handle = Actor.getHandle(pMonster) 
	--这里的面板是需要改的
    System.broadcastTipmsg("国庆boss已现身热血王城，请火速前往击杀。<查看活动/@@showWin,155,3>",ttScreenCenter+ ttChatWindow)
end
--活动倒计时
function NalDayActivityBossingEnding()
   	----是否在开关时间内
	--local svar = System.getStaticVar()
	--if svar.National_openDay ==nil or svar.National_openDay==0 then 
	--	return 
	--end
	--
	--if svar.isDringNational ==nil or svar.isDringNational<1 or svar.isDringNational>svar.National_openDay then 
	--	return 
	--end
	--
	--
    --local cfg = QingDianActivityCfg.QingDianActivityWangChengBoss
    --local playList = LuaHelp.getSceneActorListById( cfg.sceneId)
    --for k, plyPtr in ipairs(playList or {}) do
	--		--这个需要协议换吗？？显示不同的字？
    --    	local pack = DataPack.allocPacket(plyPtr,139,233)
    --        DataPack.writeInt(pack,60) 
    --        DataPack.flush(pack)
	--end
end

--活动结束
function NalDayActivityBossingEnd()
    local nHour,nMin,nSec = System.getTime(0,0,0)
    print("活动结束!!"..nMin)
    if nMin == 55 then
        	--是否在开关时间内
	    local svar = System.getStaticVar()
	    if svar.QingDian_openDay==nil then 
		    return 
	    end
	    if svar.isDringQingDianActivity ==nil or svar.isDringQingDianActivity<1 or svar.isDringQingDianActivity>svar.QingDian_openDay then 
		    return 
	    end
        local sVar = System.getDyanmicVar()
        sVar.QingDianActivityBossing = nil
        local cfg = QingDianActivityCfg.QingDianActivityWangChengBoss
        local hScene = Fuben.getSceneHandleById(cfg.sceneId, 0)
        Fuben.clearMonster(hScene,cfg.bossId)  
	    System.broadcastTipmsg("庆典boss活动结束",ttScreenCenter+ ttChatWindow)
    else
    	--是否在开关时间内
	    local svar = System.getStaticVar()
	    if svar.National_openDay ==nil or svar.National_openDay==0 then 
		    return 
	    end
	
	    if svar.isDringNational ==nil or svar.isDringNational<1 or svar.isDringNational>svar.National_openDay then 
		    return 
	    end
	
        local sVar = System.getDyanmicVar()
        sVar.NalDayActivityBossing = nil
        local cfg = NationalDayActivityCfg.NalDayActivityWangChengBoss
        local hScene = Fuben.getSceneHandleById(cfg.sceneId, 0)
        Fuben.clearMonster(hScene,cfg.bossId)  
	    System.broadcastTipmsg("国庆boss活动结束",ttScreenCenter+ ttChatWindow)
        
    end

end
