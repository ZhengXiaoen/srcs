--#include "data\config\activity\QingDianActivityCfg.lua" once


--预告
function QianDianActivityBossing(nMinute)
	--是否在开关时间内
	local svar = System.getStaticVar()
	if svar.QingDian_openDay==nil then 
		return 
	end
	if svar.isDringQingDianActivity ==nil or svar.isDringQingDianActivity<1 or svar.isDringQingDianActivity>svar.QingDian_openDay then 
		return 
	end
	
	
	--提示什么的，和合服王城boss是完成一样的，必须要改
	--这里的面板是需要改的
    local str =nMinute.."分钟后,携带极品装备的庆典boss黑罗刹将现身<(c0xFFFF0000)热血王城>。<查看活动/@@showWin,216,4>"
    System.broadcastTipmsg(str,ttScreenCenter + ttChatWindow)
    if tonumber(nMinute) == 1 then
        System.addTimer("QianDianActivityBossingEx",1000 * 20,-1)
    end
end

function QianDianActivityBossingEx()
	--是否在开关时间内
	local svar = System.getStaticVar()
	if svar.QingDian_openDay==nil then 
		return 
	end
	if svar.isDringQingDianActivity ==nil or svar.isDringQingDianActivity<1 or svar.isDringQingDianActivity>svar.QingDian_openDay then 
		return 
	end
	
    local cfg = QingDianActivityCfg.QingDianActivityWangChengBoss
    local ex = "我也要参加<(x"..Fuben.getSceneNameById(cfg.sceneId)..":"..cfg.x..":"..cfg.y..":[传])>"
    local str = "携带极品装备的庆典boss黑罗刹将现身<(c0xFFFF0000)热血王城>"..ex
    System.broadcastTipmsg(str,ttScreenCenter+ ttChatWindow)
end

--活动开始
function QianDianActivityBossingStart()
	--是否在开关时间内
	local svar = System.getStaticVar()
	if svar.QingDian_openDay==nil then 
		return 
	end
	if svar.isDringQingDianActivity ==nil or svar.isDringQingDianActivity<1 or svar.isDringQingDianActivity>svar.QingDian_openDay then 
		return 
	end
	
    System.deleteTimer("QianDianActivityBossingEx")
    local cfg = QingDianActivityCfg.QingDianActivityWangChengBoss
    local sVar = System.getDyanmicVar()
    sVar.QingDianActivityBossing = 1 
    local hScene = Fuben.getSceneHandleById(cfg.sceneId, 0)
    sVar.QingDianActivityboss = {}
    sVar.QingDianActivityboss.hp = {}
    for i= 1,table.getn(cfg.hpNocite) do
         sVar.QingDianActivityboss.hp[i] = 0
    end
	
	local openSeverDay = System.getDaysSinceOpenServer()
		
	local bossids = cfg.bossId[3]
	if openSeverDay<=cfg.openSeverDays[1] then 
		bossids=cfg.bossId[1]
	elseif  openSeverDay<=cfg.openSeverDays[2] then 
		bossids=cfg.bossId[2]
	end
    Fuben.clearMonster(hScene,bossids)
	local pMonster = Fuben.createMonster(hScene, bossids, cfg.x, cfg.y, 0)
    sVar.QingDianActivityboss.handle = Actor.getHandle(pMonster) 
	--这里的面板是需要改的
    System.broadcastTipmsg("庆典boss黑罗刹已现身热血王城，请火速前往击杀。<查看活动/@@showWin,216,4>",ttScreenCenter+ ttChatWindow)
end
--活动倒计时
function QianDianActivityBossingEnding()
   	--是否在开关时间内
	local svar = System.getStaticVar()
	if svar.QingDian_openDay==nil then 
		return 
	end
	if svar.isDringQingDianActivity ==nil or svar.isDringQingDianActivity<1 or svar.isDringQingDianActivity>svar.QingDian_openDay then 
		return 
	end
	
    local cfg = QingDianActivityCfg.QingDianActivityWangChengBoss
    local playList = LuaHelp.getSceneActorListById( cfg.sceneId)
    for k, plyPtr in ipairs(playList or {}) do
			--这个需要协议换吗？？显示不同的字？
        	local pack = DataPack.allocPacket(plyPtr,139,233)
            DataPack.writeInt(pack,60) 
            DataPack.flush(pack)
	end
end

--活动结束
function QianDianActivityBossingEnd()
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
	
	
	local openSeverDay = System.getDaysSinceOpenServer()
		
	local bossids = cfg.bossId[3]
	if openSeverDay<=cfg.openSeverDays[1] then 
		bossids=cfg.bossId[1]
	elseif  openSeverDay<=cfg.openSeverDays[2] then 
		bossids=cfg.bossId[2]
	end
	
	
    Fuben.clearMonster(hScene,bossids)  
	System.broadcastTipmsg("庆典boss活动结束",ttScreenCenter+ ttChatWindow)
end
