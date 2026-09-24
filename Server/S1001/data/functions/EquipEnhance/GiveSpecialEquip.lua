--#include "data\config\item\SpecialEquipConfig.lua" once

--到达等级直接点击赠送
function FreeGiveSpecial(sysarg)
	
	if not GiveSpecialEquipCfg then return end
	
	local var = Actor.getStaticVar(sysarg)
	if var.freeSpecialFlag then
		return
	end
	
	local config = GiveSpecialEquipCfg[1]
	if not config then return end
		
	if Actor.checkActorLevel(sysarg,config.level) == false then
		Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf198,config.level),ttFlyTip)   
		return
	end

	local award = config.award
	local nHasCount = Item.getBagEmptyGridCount(sysarg)
	local nNeedCount = Item.getAddItemNeedGridCount(sysarg,award.id,award.count)
	if nHasCount < nNeedCount then
		Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf180,nNeedCount),ttFlyTip)
		return
	end
	
	var.freeSpecialFlag = 1
	Actor.giveAward(sysarg,award.type,award.id,award.count,0,0,0,0,300,"获取赠送盾牌")
	
	local netPack = DataPack.allocPacket(sysarg, 139, 119)
	DataPack.writeByte(netPack, 1)
	DataPack.flush(netPack)
end

--到达等级自动开启计算领取时间倒计时
function TimeGiveSpecial(sysarg)
	
	if not GiveSpecialEquipCfg then return end	
	local var = Actor.getStaticVar(sysarg)
	if not var.giveEquip then
		return
	end
	local giveEquip = var.giveEquip
	if giveEquip[4] == 1 then
		return 
	end
	
	local config = GiveSpecialEquipCfg[giveEquip[1]]
	if not config then return false end
	
	local nCurMini = System.getCurrMiniTime()
	
	if (giveEquip[2] - (nCurMini-giveEquip[3])) <= 0 then
		
		local award = config.award
		local nHasCount = Item.getBagEmptyGridCount(sysarg)
		local nNeedCount = Item.getAddItemNeedGridCount(sysarg,award.id,award.count)
		if nHasCount < nNeedCount then
			Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf180,nNeedCount),ttFlyTip)
			return
		end
		
		Actor.giveAward(sysarg,award.type,award.id,award.count,0,0,0,0,300,"获取赠送盾牌")
		if giveEquip[1] < #GiveSpecialEquipCfg then
			var.giveEquip[2] = 0
			SendEquipInfo(sysarg,giveEquip[1]+1)
		else
			var.giveEquip[4] = 1
			local netPack = DataPack.allocPacket(sysarg, 139, 119)
			DataPack.writeByte(netPack, 1)
			DataPack.writeByte(netPack, 0)
			DataPack.writeInt(netPack, 0)
			DataPack.writeInt(netPack,0)
			DataPack.flush(netPack)
		end
	else
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf152,ttFlyTip)
	end
end

function SendEquipInfo(sysarg,index)

	if not GiveSpecialEquipCfg then return end

	local config
	for _,value in ipairs(GiveSpecialEquipCfg) do
		if value.id == index then
			config = value
		end
	end
	if not config then return end

	local var = Actor.getStaticVar(sysarg)
	if not var.giveEquip then
		var.giveEquip = {}
		var.giveEquip[1] = 1 	--在配置表赠送的ID
		var.giveEquip[2] = GiveSpecialEquipCfg[1].needTime	--领取需要的时间
	else
		if var.giveEquip[2] <= 0 then
			var.giveEquip[1] = config.id
			var.giveEquip[2] = config.needTime
		else
			return
		end
	end
	
	var.giveEquip[3] = System.getCurrMiniTime()
	var.giveEquip[4] = 0
	local giveEquip = var.giveEquip

	local netPack = DataPack.allocPacket(sysarg, 139, 119)
	DataPack.writeByte(netPack, giveEquip[4])
	DataPack.writeByte(netPack, giveEquip[1])
	DataPack.writeInt(netPack, giveEquip[2])
	DataPack.writeInt(netPack, config.needTime)
	DataPack.flush(netPack)
end

MiscsImplement.GetGiveEquip = function(sysarg, msgid, packet)

	FreeGiveSpecial(sysarg)
end

--MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cGetSpecialEquip, MiscsImplement.GetGiveEquip)

EventCallDispatcher.SaveEquipTime = function(sysarg)
	
	local var = Actor.getStaticVar(sysarg)
	if not var.giveEquip then
		return
	end
	local giveEquip = var.giveEquip
	
	if giveEquip[4] == 1 then
		return 
	end
	
	local nCurMini = System.getCurrMiniTime()
	local nTime = giveEquip[2] - (nCurMini-giveEquip[3])
	if nTime < 0 then
		nTime = 0
	end
	giveEquip[2] = nTime
end

function sendGiveSpecialInfo(sysarg)
	
	if not GiveSpecialEquipCfg then return end
	
	if Actor.checkActorLevel(sysarg,GiveSpecialEquipCfg[1].ShowLevel) == false then
		return
	end
	
	local var = Actor.getStaticVar(sysarg)
	local netPack = DataPack.allocPacket(sysarg, 139, 119)
	if not var.freeSpecialFlag then
		DataPack.writeByte(netPack, 0)
	else
		DataPack.writeByte(netPack, 1)
	end
	DataPack.flush(netPack)
end

EventCallDispatcher.SendEquipTime = function(sysarg)
	sendGiveSpecialInfo(sysarg)
end

--EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeUserLogout, EventCallDispatcher.SaveEquipTime) 
--EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeUserLogin, EventCallDispatcher.SendEquipTime)