--#include "data\config\activity\ActivityGiftConfig.lua" once
--#include "data\functions\Activity\Common\Awards.lua" once


MiscsImplement.GetPeyGiftInfo = function(sysarg)
	local var = Actor.getStaticVar( sysarg )
	--每日充值1到5阶段的标志
	local peyflag = var.days.PeyFlag
	if not peyflag then 
		var.days.PeyFlag = 0
		peyflag = var.days.PeyFlag
	end
	
	local peyNum = var.days.PeyNum
	if not peyNum then 
		var.days.PeyNum = 0 
		peyNum = var.days.PeyNum
	end
	
	local npack = DataPack.allocPacket(sysarg,139,LogicCmd.miscSys.sub.sSendPeyFlag) 
	DataPack.writeUInt(npack, peyflag)	
	DataPack.flush(npack)

end


--领取每日充值大礼包
MiscsImplement.handleGetPeyGiftOp = function (sysarg,msgid,packet)
	--print("handleGetPeyGiftOp")
	--领取哪个等级的礼包
	local level = DataPack.readByte(packet);
	if (level < 1 or level > 18) then
		print("handleGetPeyGiftOp，level error")
		return;
	end

	--获取玩家的静态变量   存储玩家的元宝数量
	local var = Actor.getStaticVar(sysarg)
	local peyNum = var.days.PeyNum
	if not peyNum then 
		var.days.PeyNum = 0
		peyNum = var.days.PeyNum
	end	
	
	--获取玩家的静态变量   存储玩家的领取标识
	local peyflag = var.days.PeyFlag
	if not peyflag then 
		var.days.PeyFlag = 0
		peyflag = var.days.PeyFlag
	end		

	local flag = System.getIntBit(peyflag, level - 1)	
	if flag > 0 then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf540, ttFlyTip)
		return
	end

	local giftConfig = ActivityGiftConfig.RechargeGift[6 + level]
	if giftConfig == nil then
		print("handleGetPeyGiftOp，config error")
		return;
	end
	
	--3选1检测
	if giftConfig.group then
		for _,id in ipairs(giftConfig.group) do
			local flag = System.getIntBit(peyflag, id-7)
			if flag > 0 then
				Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf540, ttFlyTip)
				return
			end
		end
	end
	
	local openServerDay = System.getDaysSinceOpenServer()
	if openServerDay < giftConfig.openSeverDay then
		return
	end

	if peyNum < giftConfig.money then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.zf549, ttFlyTip)
		return
	end

	--检查背包
	if not Awards.CheckBagGridCount(sysarg, giftConfig.reward) then
		return
	end
	
	local logstr = string.format(Lang.LogTips.l00171, level)
	--奖品一个物品给玩家
	Awards.Give(sysarg, giftConfig.reward, 995, logstr)
	--设置领取标识
	var.days.PeyFlag = System.setIntBit(peyflag, level - 1, true)
	Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf550,ttFlyTip)
	var.lastPeyTime = System.getCurrMiniTime()

	local name = Actor.getName(sysarg)
	System.broadcastTipmsg(string.format(Lang.ScriptTips.zf589,name,giftConfig.name),2048)
	
	local npack = DataPack.allocPacket(sysarg,139,LogicCmd.miscSys.sub.sSendPeyFlag) 
	DataPack.writeUInt(npack, var.days.PeyFlag)	
	DataPack.flush(npack)
end

--[[--玩家在线跨天清空充值数据
EventCallDispatcher.NewDayAcrriveCircleFunc = function (sysarg,arg)
	-- 重置当天的充值数据
	local var = Actor.getStaticVar(sysarg)
	var.days.PeyNum = nil
	var.days.PeyFlag = nil
end--]]

MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cGetPeyFlag, MiscsImplement.GetPeyGiftInfo)
--MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cGetPeyMoney, MiscsImplement.handleGetPeyGiftOp)
--EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeNewDayArrive, EventCallDispatcher.NewDayAcrriveCircleFunc)