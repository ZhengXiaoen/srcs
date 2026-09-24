--#include "data\envir\FubenConfig\CaiFuGuangChang.lua" once

MiscsImplement.enterTianGuanScene = function (sysarg, msgid, packet)
	
	local var = Actor.getStaticVar(sysarg)

	if InitTimeGuanTimes(sysarg) <= 0 then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf299,ttFlyTip)
		return
	end		
	
	if not CheckEnterTianGuan(sysarg) then
		return
	end
	
	local Hfuben = Fuben.createFuBen(68)
	Actor.enterFuBen(sysarg,Hfuben,83,40,44)
	var.days.tianGuanAward = nil
	var.days.TGTimes = var.days.TGTimes - 1
	UpdateTimeGuanTimes(sysarg,var.days.TGTimes)
end

function CheckEnterTianGuan(sysarg)
	
	local var = Actor.getStaticVar(sysarg)
	if var.ybstate == 1 then
		Actor.sendTipmsg(sysarg,Lang.Activity.k00046, ttFlyTip) 
		return false
	end
	
	--在副本中
	local fubenId = Actor.getFubenId(sysarg)
	if fubenId > 0 then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf568, ttFlyTip) 
		return false
	end
	
	--在武林争霸中
	if Actor.getSceneId(sysarg) == 58 then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf138,ttFlyTip)
		return false
	end
	
	return true
end

function UpdateTimeGuanTimes(sysarg,times)
	if System.isCrossServer() == true then return end
	local netPack = DataPack.allocPacket(sysarg, 139, 127)
	DataPack.writeByte(netPack,1)
	DataPack.writeByte(netPack,times)
	DataPack.flush(netPack)
end

function InitTimeGuanTimes(sysarg)
	local var = Actor.getStaticVar(sysarg)
	if not var.days.TGTimes then
		var.days.TGTimes = 3
	end
	
	return var.days.TGTimes
end

-- 勇者闯关 暂时屏蔽
--MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cEnterTianGuan, MiscsImplement.enterTianGuanScene)

