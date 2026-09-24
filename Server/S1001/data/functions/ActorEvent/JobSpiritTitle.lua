--#include "data\config\SpiritTitle.lua" once


--兑换雇佣兵封号


local function ChangeJobTitle(sysarg, JobNum)

	local vocation = Actor.getIntProperty(sysarg, PROP_ACTOR_VOCATION) --获取职业 1:战士  2：法师  3：道士
	local mercenlevel = Actor.getIntProperty(sysarg,PROP_ACTOR_MERCENA_LEVEL)--获取玩家雇佣兵等级

	if not SpiritTitles[vocation] or not SpiritTitles[vocation][JobNum+1] then
		print("SpiritTitles cfg error!")	
	end

	local equipCfg = SpiritTitles[vocation][JobNum+1]	--兑换的下标数  一列有10个封号，ID：0~9

	--已经兑换过该称号 
	if Actor.HasTitle(sysarg,equipCfg.id) then	
		--SendSpiritTitleOptResult(sysarg,OpType,1)
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf536,ttFlyTip)
		return
	end	
	
	--雇佣兵等级不足
	if mercenlevel < equipCfg.mercenlevel then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf553,ttFlyTip)
		return
	end

	--没按顺序去兑换
--[[	if not Actor.HasTitle(sysarg,equipCfg.id) then	
		if JobTitleNum > 0 then
			if not Actor.HasTitle(sysarg,equipCfg.id-1) then --检查前一个称号兑换过没
				--SendSpiritTitleOptResult(sysarg,OpType,2)
				Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf537,ttFlyTip)
				return
			end
		end		
	end--]]

	--检查消耗
	local expendData = {}
	local isok = CheckOneConsume(sysarg, false, equipCfg.consume, true, expendData)
	if not isok then 
		--SendSpiritTitleOptResult(sysarg,OpType,3)
		return
	end
	
	--扣除消耗
	isok = DeductOneConsume(sysarg, false, equipCfg.consume, GameLog.cNewChangeJobTitleConsume)		
	if not isok then

		--SendSpiritTitleOptResult(sysarg, opType, 4,false) --扣除消耗出错	
		return

	end		

	--添加一个称号给玩家
	local TitleName = Actor.getTitleName(equipCfg.id);
	Actor.GiveTitle(sysarg,equipCfg.id)
	local msg = string.format(Lang.ScriptTips.zf538,TitleName)
	Actor.sendTipmsg(sysarg,msg,ttFlyTip)

	--SendSpiritTitleOptResult(sysarg,OpType,0)
	local netPack = DataPack.allocPacket(sysarg, 26, 56)
	DataPack.writeByte(netPack, 0)
	DataPack.flush(netPack)
	

	return true

end

--战功值兑换接口
EventCallDispatcher.handleSpiritTitleOp = function (sysarg, args)
	if not args then return false end

	local JobTitleNum = args[1]	   --那一列的第几个
	if JobTitleNum >= 0 then
		ChangeJobTitle(sysarg, JobTitleNum)
	end

end

--注册回调函数	
EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeSpiritTitle, EventCallDispatcher.handleSpiritTitleOp)  