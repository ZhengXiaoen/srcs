--腾讯任务集市处理文件

--函数列表
TencentMarketFuncList = {}

--任务列表
TencentMarketTaskList = 
{
	"1105242790T320160408135901",
}

--请求类型
TencentMarketApplyType = 
{
	check = "check",
	check_award = "check_award",
	award = "award",
}

--执行结果
ExecutionResult = 
{
	Success = 0,		--步骤已完成 或 奖励发放成功
	NotActor = 1,       --用户尚未在应用内创建角色
	Unfinished = 2,     --用户尚未完成本步骤
	Awardrepeat = 3,    --该步骤奖励已发放过
	GiveFaild = 4,      --发货失败
}

--注册任务
function RegisterTencentMarketFunc(TaskID, step, func)
	--判断任务存在
	if not TencentMarketFuncList[TaskID] then
		TencentMarketFuncList[TaskID] = {}
	end
	
	--判断步骤存在
	if not TencentMarketFuncList[TaskID][step] then
		TencentMarketFuncList[TaskID][step] = func
	else	
		--已经存在
		print("TaskID = " .. TaskID .. ", step = " .. step .. ", Repeated registration!!!")
	end
end

--执行
function ExecutionTencentMarketFunc(sysarg, TaskID, step, type)
	--步骤一和四单独处理
	if 1 == step then
		return TencentEnterAppAward(sysarg)
	end
	
	if 4 == step then
		return TencentContinuousLoginAward(sysarg)
	end
	
	--判断任务存在
	if not TencentMarketFuncList[TaskID] then
		print("TencentMarketFuncList[" .. TaskID .. "] is nil!")
		return -1
	end
	
	--判断步骤存在
	if not TencentMarketFuncList[TaskID][step] then
		print("TencentMarketFuncList[" .. TaskID .. "][" .. step .. "] is nil!")
		return -1
	end
	
	return TencentMarketFuncList[TaskID][step](sysarg, type)
end

--收到任务集市请求, 必须要返回值
--参数1 : 请求类型		string
	--check: 开发者仅需要查询任务步骤是否完成，返回步骤完成状态。
	--check_award: 开发者需要查询任务步骤是否完成，若步骤已完成，直接给用户发货（payitem），并返回发货是否成功。
	--award: 平台通知开发者直接给给用户发货，开发者返回发货是否成功。 
--参数2 : 任务ID		string
--参数3 : 步骤ID		int

--返回值
-- 0: 步骤已完成 或 奖励发放成功
-- 1: 用户尚未在应用内创建角色
-- 2：用户尚未完成本步骤
-- 3：该步骤奖励已发放过
-- 4：发货失败
EventCallDispatcher.handleMarketScript = function(sysarg, args)
	return ExecutionTencentMarketFunc(sysarg, args[2], args[3], args[1])
end

--进入游戏奖励
function TencentEnterAppAward(sysarg)
	local var = Actor.getStaticVar(sysarg)
	local TXFlags = var.TXFlags
	if TXFlags == nil then TXFlags = 0 end
	
	if System.getIntBit(TXFlags, 27) ~= 0 then -- 27:进入游戏奖励
		return ExecutionResult.Awardrepeat
	end

	if not Awards.Give(sysarg, TencentMarketConfig.EnterAppAward, LogIds.TXMarketEnterAppAward, "TXEnterAward") then
		return ExecutionResult.GiveFaild
	end
	
	TXFlags = System.setIntBit(TXFlags, 27, true)
	var.TXFlags = TXFlags
	
	return ExecutionResult.Success
end

--连续登陆奖励
function TencentContinuousLoginAward(sysarg)
	local var = Actor.getStaticVar(sysarg)
	local TXFlags = var.TXFlags
	if TXFlags == nil then TXFlags = 0 end
	
	if System.getIntBit(TXFlags, 28) ~= 0 then -- 28:连续登陆奖励
		return ExecutionResult.Awardrepeat
	end
		
	if not Awards.Give(sysarg, TencentMarketConfig.ContinuousLoginAward, LogIds.TXMarketContinuousLoginAward, "TXLoginAward") then
		return ExecutionResult.GiveFaild
	end
	
	TXFlags = System.setIntBit(TXFlags, 28, true)
	var.TXFlags = TXFlags

	return ExecutionResult.Success
end

--************任务1和4是固定处理的,以下只需要处理2,3就可以了

--任务步骤2
function LevelUpAndInvitation(sysarg, type)
	local var = Actor.getStaticVar(sysarg)
	local TXFlags = var.TXFlags
	if TXFlags == nil then TXFlags = 0 end
	
	if System.getIntBit(TXFlags, 29) ~= 0 then -- 29:任务步骤2
		return ExecutionResult.Awardrepeat
	end
	
	local config = TencentMarketConfig.LevelUpAndInvitation
	local canGet = false
	
	--等级达到几级并且有过一次邀请好友
	-- 16:是否邀请过腾讯好友
	--if System.getIntBit(TXFlags, 16) ~= 0 and Actor.checkActorLevel(sysarg, config.Level) then
	--	canGet = true
	--end
	
	--等级达到几级
	local actorLevel = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	canGet = actorLevel >= config.Level

	if TencentMarketApplyType.check == type then
		if not canGet then
			return ExecutionResult.Unfinished
		end
	elseif TencentMarketApplyType.check_award == type then
		if System.getIntBit(TXFlags, 29) ~= 0 then -- 29:任务步骤2
			return ExecutionResult.Awardrepeat
		end
		
		if not canGet then
			return ExecutionResult.Unfinished
		end
		
		if not Awards.Give(sysarg, config.award, LogIds.TXMarketLevelUpAndInvitation, "LevelUpInvitation") then
			return ExecutionResult.GiveFaild
		end
		
		TXFlags = System.setIntBit(TXFlags, 29, true)
		var.TXFlags = TXFlags
		
	elseif TencentMarketApplyType.award == type then
		if System.getIntBit(TXFlags, 29) ~= 0 then -- 29:任务步骤2			
			return ExecutionResult.Awardrepeat
		end
		
		if not Awards.Give(sysarg, config.award, LogIds.TXMarketLevelUpAndInvitation, "LevelUpInvitation") then
			return ExecutionResult.GiveFaild
		end
		
		TXFlags = System.setIntBit(TXFlags, 29, true)
		var.TXFlags = TXFlags
	end
	
	return ExecutionResult.Success
end

--任务步骤3
function TencentEquipSuitAward(sysarg, type)
		
	local config = TencentMarketConfig.EquipSuitAward
	--[[	
	local canGet = true
	--套装
	--直接获取全身装备,取等级
	for i = 1, #config.items do
		local item = Item.getEquipByType( sysarg, config.items[i][1], config.items[i][2] )
		if Item.getItemProperty(sysarg, item, 152) ~= config.level then
			canGet = false
			break
		end
	end
	--]]
	
	-- 额外的5金券是后台自动发的,逻辑器不需要处理
			
	local var = Actor.getStaticVar(sysarg)
	local TXFlags = var.TXFlags
	if TXFlags == nil then TXFlags = 0 end
	
	if System.getIntBit(TXFlags, 30) ~= 0 then -- 30:任务步骤3
		return ExecutionResult.Awardrepeat
	end
	
	if TencentMarketApplyType.check == type then
		-- 任务:穿戴一套多少级的装备
		local nCount = Actor.GetEquipCountByLevel(sysarg,config.level)
		local canGet = nCount >= config.EquipCount
	
		if not canGet then
			return ExecutionResult.Unfinished
		end
	elseif TencentMarketApplyType.check_award == type or TencentMarketApplyType.award == type then
		if System.getIntBit(TXFlags, 30) ~= 0 then -- 30:任务步骤3
			return ExecutionResult.Awardrepeat
		end
		
		-- 任务:穿戴一套多少级的装备
		local nCount = Actor.GetEquipCountByLevel(sysarg,config.level)
		local canGet = nCount >= config.EquipCount
		
		if not canGet then
			return ExecutionResult.Unfinished
		end
		
		-- 后台自动发送金卷,这里不用给奖励
		--if not Awards.Give(sysarg, config.award, LogIds.TXMarketSuitAward, "TXSuitAward") then
		--	return ExecutionResult.GiveFaild
		--end
		
		TXFlags = System.setIntBit(TXFlags, 30, true)
		var.TXFlags = TXFlags
	end
	
	return ExecutionResult.Success
end

RegisterTencentMarketFunc(TencentMarketTaskList[1], 2, LevelUpAndInvitation)
RegisterTencentMarketFunc(TencentMarketTaskList[1], 3, TencentEquipSuitAward)

EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeMarketScript, EventCallDispatcher.handleMarketScript)
