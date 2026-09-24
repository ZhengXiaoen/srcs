--#include "data\config\monster\ModBossTips.lua" once

function getConfig(nBossId,nTypeBoss)
	for key ,value in ipairs(ModBossConfig) do
		if value.BossId == nBossId and value.type == nTypeBoss then
			return value
		end
	end
end

function checkEnterBossCondition(sysarg,config)
	
	--护送皇杆
	local var = Actor.getStaticVar(sysarg)
	if var.ybstate == 1 then
		Actor.sendTipmsg(sysarg,Lang.Activity.k00046, ttFlyTip) 
		return false
	end
	
	--摆摊
	if Actor.hasState(sysarg,esStateStall) then
		Actor.sendTipmsg(sysarg,Lang.stall001.zf137,ttFlyTip)
		return false
	end
	
	--在副本
	if Actor.getFubenId(sysarg) > 0 then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf138,ttFlyTip)
		return false 
	end

	--在武林争霸中
	if Actor.getSceneId(sysarg) == 58 then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf138,ttFlyTip)
		return false
	end
	
	--检测等级
	if Actor.checkActorLevel(sysarg,config.level,config.circle) == false then
		Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf137,config.circle,config.level),ttFlyTip)
		return false
	end

	if config.viplevel > 0 then
		local nCurVip = Actor.getIntProperty(sysarg,PROP_ACTOR_VIP_GRADE)
		if nCurVip < config.viplevel then
			Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf188,config.viplevel),ttFlyTip)
			return false
		end
	end
	
	return true
end

MiscsImplement.handleEnterBossScene = function(sysarg,msgid,packet)
	
	local nTypeBoss = DataPack.readByte(packet)
	local nBossId = DataPack.readShort(packet)
	
	if not nTypeBoss or nTypeBoss<= 0 or nTypeBoss > 3 then return end
	if not nBossId or nBossId <= 0 then return end
		
	if not ModBossConfig then return false end

	local config = getConfig(nBossId,nTypeBoss)
	if not config then return false end
	
	if checkEnterBossCondition(sysarg,config) == false then 
		return false
	end
	
	if Actor.enterScene(sysarg,config.SceneId) == false then
		print("enter boss scene error")
	end
        Actor.openguajiGuide(sysarg,1);------弹出挂机窗口
end

MiscsImplement.handleGetBossReliveTime = function(sysarg,msgid,packet)
	local nBossId = DataPack.readShort(packet)
	nBossId =tonumber(nBossId)

	local sVar = System.getStaticVar()
	local leftTime = 0
	if sVar.outsideBossKilledTime~=nil and sVar.outsideBossKilledTime[nBossId]~=nil then 
		leftTime = System.getCurrMiniTime()-sVar.outsideBossKilledTime[nBossId]
		if leftTime<0 then 
			leftTime =0 
		end
	end
	
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sGetBossReliveTime)
	DataPack.writeShort(netPack, nBossId)
	DataPack.writeUInt(netPack, leftTime)--下发过了多长时间。
	DataPack.flush(netPack)
end


MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cEnterBossScene, MiscsImplement.handleEnterBossScene)
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cGetBossReliveTime, MiscsImplement.handleGetBossReliveTime)