--lua script
--VIP 相关的脚本处理   
-- var.fb.addFbCount 变量保存着增加副本进入次数  
-- var.addHoleTrainCnt 变量保存着增加洞窟修炼进入次数
--#include "data\config\vocation\VocationConfig.lua" once
--#include "data\config\item\SkillBookItemData.lua" once
--#include "data\config\vip\VipConfig.lua" once  --vip配置
--#include "data\functions\VipFunc\VipScriptFunc.lua" once
--#include "data\functions\VipFunc\ActiveRewardFunc.lua" once

-- @brief: 处理添加称号奖励效果
EventCallDispatcher.VIPAward_addTitleHandler = function (sysarg, award, addOrRemove)
	if (addOrRemove == 1) then		
		Actor.GiveTitle(sysarg, award.param1)
	else
		Actor.GiveupTitle(sysarg, award.param1)		
	end
end

-- @brief: 处理添加Buff奖励效果
EventCallDispatcher.VIPAward_addBuffHandler = function(sysarg, award, addOrRemove)
	--print("award.param1",award.param1, addOrRemove)
	if (addOrRemove == 1) then
		Actor.addBuffById(sysarg, award.param1)
		--award.param7 = award.param7 or 0
		--award.param6 = award.param6 or ""
		--Actor.addBuff(sysarg, award.param1, award.param2, award.param3, award.param4, award.param5, award.param6, false, nil, award.param7)
	else		
		Actor.delBuffById(sysarg, award.param1)
		--Actor.delBuff(sysarg, award.param1, award.param2)		
	end
end

-- @brief: 增加常规副本进入次数奖励效果
EventCallDispatcher.VIPAward_addFubenEnterCountHandler = function(sysarg, award, addOrRemove)
	local var = Actor.getDyanmicVar(sysarg)
 	local fb = var.fb
 	if fb == nil then 
    var.fb = {}
    fb = var.fb
  end
  
  if (fb.addFbCount == nil) then  
  	fb.addFbCount = 0
  end  
 
	if (addOrRemove == 1) then		
		fb.addFbCount = fb.addFbCount + award.param1
	else		
		if (fb.addFbCount > 0) then
			fb.addFbCount = fb.addFbCount - award.param1
		end
	end			
end

-- @brief: 增加洞窟静修进入次数奖励效果
EventCallDispatcher.VIPAward_addHoleTrainEnterCountHandler = function(sysarg, award, addOrRemove)
	local dvar = Actor.getDyanmicVar(sysarg)
	
  if (dvar.addHoleTrainCnt == nil) then  
  	dvar.addHoleTrainCnt = 0
  end  
	if (addOrRemove == 1) then		
		dvar.addHoleTrainCnt = dvar.addHoleTrainCnt + award.param1
	else
		if (dvar.addHoleTrainCnt > 0) then
			dvar.addHoleTrainCnt = dvar.addHoleTrainCnt - award.param1
		end		
	end		
end

-- @brief: 赠送仓库奖励效果
EventCallDispatcher.VIPAward_presentStorageHandler = function(sysarg, award, addOrRemove)
	-- 每次上线都会更新，所以这里需要
end

-- @brief: 增加日常任务次数
EventCallDispatcher.VIPAward_addDailyTaskCountHandler = function(sysarg, award, addOrRemove)
	-- 修改日常任务可执行次数	
	local nCount = award.param1
	if (addOrRemove ~= 1) then
		nCount = 0
	end
	Actor.setMiscData(sysarg, 1, nCount)
end

EventCallDispatcher.VIPAward_setVIPDefaultHeadIcon = function(sysarg)
	local svar = Actor.getStaticVar(sysarg)
	local icon = svar.iconId
	if (icon == nil) then
		local occu = Actor.getIntProperty(sysarg, PROP_ACTOR_VOCATION)+1
		local occu_cfg = VocationConfig[occu]
		if (occu_cfg == nil) then
			print("occu_cfg = nil , occu=" .. occu)
			return
		end
		icon = occu_cfg.nDefaultIcon
	end
	
	if (icon ~= nil) then
		Actor.changeIcon(sysarg, icon)
	end
end

-- @brief: 更改头像
EventCallDispatcher.VIPAward_updateHeadIconHandler = function(sysarg, award, addOrRemove)	
	if (addOrRemove ~= 1) then -- VIP过期后需要恢复默认头像		
		EventCallDispatcher.VIPAward_setVIPDefaultHeadIcon(sysarg)
	end
end

-- @brief: 提高打坐经验
EventCallDispatcher.VIPAward_addPractiseExpHandler = function(sysarg, award, addOrRemove)
end

-- @brief: 免费时装
EventCallDispatcher.VIPAward_getFashionAddress = function(sysarg, award, addOrRemove)
end

-- @brief: 黄钻专属表情
EventCallDispatcher.VIPAward_getEmote = function(sysarg, award, addOrRemove)
end

-- @brief: VIP时装优惠
EventCallDispatcher.VIPAward_getFashionAddressDiscount = function(sysarg, award, addOrRemove)
end

-- @brief: 修为提升
EventCallDispatcher.VIPAward_addXiuWei = function(sysarg, award, addOrRemove)
	local nCount = award.param1
	if (addOrRemove ~= 1) then
		nCount = 0
	end
		
	Actor.setMiscData(sysarg, 2, nCount)	
end

-- @brief：VIP速传次数
EventCallDispatcher.VIPAward_addTransfer = function(sysarg,award,addOrRemove)
end

-- @brief：战魂兑换经验
EventCallDispatcher.VIPAward_addDraugConvertExp = function(sysarg,award, addOrRemove)
	local Draugvar = Actor.getDyanmicVar(sysarg)
 	local draug = Draugvar.draug
 	if draug == nil then 
		Draugvar.draug = {}
		draug = Draugvar.draug
	end
  
  if (draug.addFbCount == nil) then  
  	draug.addFbCount = 0
  end  
 
	if (addOrRemove == 1) then		
		draug.addFbCount = draug.addFbCount + award.param1		
	end	
end


-- @brief：VIP效果处理表
local VIPAwardHandlers = {
	EventCallDispatcher.VIPAward_addTitleHandler,
	EventCallDispatcher.VIPAward_addBuffHandler,
	EventCallDispatcher.VIPAward_addFubenEnterCountHandler,
	EventCallDispatcher.VIPAward_presentStorageHandler,
	EventCallDispatcher.VIPAward_addDailyTaskCountHandler,
	EventCallDispatcher.VIPAward_addPractiseExpHandler,	
	EventCallDispatcher.VIPAward_addHoleTrainEnterCountHandler,
	EventCallDispatcher.VIPAward_updateHeadIconHandler,
	EventCallDispatcher.VIPAward_getFashionAddress,
	EventCallDispatcher.VIPAward_getEmote,
	EventCallDispatcher.VIPAward_getFashionAddressDiscount,
	EventCallDispatcher.VIPAward_addXiuWei,
	EventCallDispatcher.VIPAward_addTransfer,
	EventCallDispatcher.VIPAward_addDraugConvertExp,
}

-- @brief: 处理指定奖励项
-- @param award: 奖励配置数据，lua表结构，参见data\config\vip\vip*中的奖励配置项
-- @param addOrRemove: 添加奖励效果还是移除奖励效果
EventCallDispatcher.handleVIPAward = function(sysarg, award)
	local award_type = award.tp		
	if award_type <= 0 then return end
	
	local hdl = VIPAwardHandlers[award_type]
	if (hdl) then
		hdl(sysarg, award, true)
	end
end

-- @brief: 处理指定类型的VIP奖励
-- @param viptype: VIP类型，分红钻、蓝钻、黄钻
-- @param addOrRemove: 添加奖励效果还是移除奖励效果
EventCallDispatcher.handleVIPAwardByType = function(sysarg,vipLevel)
	local oneVip = VipConfig.VipGrade[vipLevel]
	
	if not oneVip then
		print("get vip config error. viptype=" .. viptype)
		return
	end
	
	if oneVip.Effect ~= nil then	
		for k, v in ipairs(oneVip.Effect) do
			EventCallDispatcher.handleVIPAward(sysarg, v)
		end
	end
end

-- @brief: 删除角色老的VIP效果。主要是之前VIP添加的一些Buff。
EventCallDispatcher.RemoveOldVIPEffect = function(sysarg, arg)
end

-- @brief: 角色VIP状态发生改变
EventCallDispatcher.OnActorVipUpdate = function(sysarg, arg)
	local vipLevel = arg[1]
	EventCallDispatcher.handleVIPAwardByType(sysarg,vipLevel)
end

EventCallDispatcher.OldVIPEffectBuffTable = {
	{ btype=71, groupid=93, }, -- 红钻效果：打怪经验增加30%，可与经验丹叠加使用
	{ btype=91, groupid=94, }, -- 蓝钻效果：获得声望时，额外获取30%声望 
	{ btype=90, groupid=95, }, -- 蓝钻效果：获得阵营贡献时，额外获得20%声望
}

EventCallDispatcher.OldVIPEffectTitleTable = {
	31,
	32,
	33
}

-- @brief: 清除老的VIP效果
EventCallDispatcher.OnActorRemoveOldVIPEffect = function (sysarg, arg)			
	-- 删除老的Buff
	for i=1, table.getn(EventCallDispatcher.OldVIPEffectBuffTable) do
		Actor.delBuff(sysarg, EventCallDispatcher.OldVIPEffectBuffTable[i].btype, EventCallDispatcher.OldVIPEffectBuffTable[i].groupid)		
	end
	
	-- 删除老的称号
	for i=1, table.getn(EventCallDispatcher.OldVIPEffectTitleTable) do
		Actor.GiveupTitle(sysarg, EventCallDispatcher.OldVIPEffectTitleTable[i])				
	end
	
	-- 恢复默认头像
	EventCallDispatcher.VIPAward_setVIPDefaultHeadIcon(sysarg)
end

EventCallDispatcher.OnGetActorVipInfo = function( sysarg, arg )
	local sVar = Actor.getStaticVar(sysarg)
	local optType = arg[1]
	if optType > 0 then			--新的vip
		local nNowDt = System.getCurrMiniTime()
		if sVar.VipExperienceDate and sVar.VipExperienceDate > nNowDt then
			return true
		end
		return false
	else					--判断vip领取每日奖励
		local vipAwardFlag = 0
		if sVar.days.VipRewardDate and sVar.days.VipRewardDate == 1 then
			vipAwardFlag = sVar.days.VipRewardDate
		end
		return vipAwardFlag == 1
	end
end

function GetVipDayAward(sysarg)
	local sVar = Actor.getStaticVar(sysarg)
	--local vipGiftBag = sVar["vipGiftBag"]
	--if not vipGiftBag then
		--vipGiftBag = {}	
	--end 
	local netPack = DataPack.allocPacket(sysarg, 54, 2)
	if netPack then
		local vipLevel = Actor.getIntProperty(sysarg,PROP_ACTOR_VIP_GRADE)
		
		--数据异常
		if vipLevel > #VipConfig.VipGrade then
			print("vipLevel["..vipLevel.."] tool big")
			return
		end
		
		DataPack.writeInt(netPack, System.GetVipNum());
		--print("Actor.getVipAwardFlag(sysarg)",sVar.DayRewardFlag or 0)
		DataPack.writeByte(netPack, sVar.DayRewardFlag or 0)
		--print("vipLevel===============",vipLevel)
		DataPack.writeByte(netPack,vipLevel)
		for i = 1,vipLevel do
		    local str = "vipGift" ..i
			--print("strstrstrstrstrstrstr=====",str,   sVar[str] or 0)
			DataPack.writeByte(netPack,sVar[str] or 0)
			--if vipGiftBag[i] == nil or vipGiftBag[i] == 0 then
				--DataPack.writeByte(netPack,1)
			--else
				--DataPack.writeByte(netPack,0)
			--end
		end
		--print("Actor.getIntProperty(sysarg,PROP_ACTOR_VIP_POINT)",Actor.getIntProperty(sysarg,PROP_ACTOR_VIP_POINT))
		DataPack.writeUint64(netPack,Actor.getIntProperty(sysarg,PROP_ACTOR_VIP_POINT))
		DataPack.flush(netPack)
	end
end

EventCallDispatcher.OnSendNewVipInfo = function(sysarg, arg)
	GetVipDayAward(sysarg)
end

function OnVipScriptFunc(sysarg,funcName, ...)
	--print("funcName arg=======================",funcName,arg)
	print("OnVipScriptFunc--------------");
	local func = VipFunc[funcName]
	if func then
		--print("OnVipScriptFunc")
		return func(sysarg, unpack(arg))
	end
end

--活跃奖励
function OnActiveRewardScriptFunc(sysarg,funcName, ...)
	local func = ActiveRewardFunc[funcName]
	if func then
		return func(sysarg, unpack(arg))
	end
end

EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeUpdateVipInfo, 	EventCallDispatcher.OnActorVipUpdate)
--EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeRemoveOldVIPEffect, EventCallDispatcher.OnActorRemoveOldVIPEffect)
--EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeGetVipInfo, EventCallDispatcher.OnGetActorVipInfo)
EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeSendVipInfo, EventCallDispatcher.OnSendNewVipInfo)
--EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeGetVipScriptInfo, OnVipScriptFunc)
