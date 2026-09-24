--#include "data\config\activity\EveryDayCheck.lua" once
--#include "data\functions\Activity\Common\Awards.lua" once
--#include "data\functions\lua_utils.lua" once

-- 新的每日签到

--每日签到(成功返回true，否则返回false)
EventCallDispatcher.handleEveryDayCheck = function (sysarg, args)
	-- Actor.sendTipmsg(sysarg, "签到功能暂时未开放", ttFlyTip)
	-- return false
	
	local checkDay = args[1]	--签到日期(几号)
	--local rewardIdx = args[2]	--奖励ID
	local rewardIdx = args[1]
	
	
	local logStr = "签到";
	
	local cfg = EveryDayCheck.rewardList[rewardIdx];
	if cfg == nil then
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.edc0004, tAward.days), ttFlyTip);
		return false 
	end

	local var = Actor.getStaticVar(sysarg);
	local qdAgain = var.days.qdAgain;
	if not qdAgain then
		qdAgain = 0;
	end
	
	local y, m, d = System.getDate();
	local nSignIn = Actor.getUIntProperty(sysarg, PROP_ACTOR_SIGNIN)
	local newSignIn = System.setIntBit(nSignIn, checkDay - 1, true);
	
	if newSignIn==nSignIn then 
		Actor.sendTipmsg(sysarg,"不能重复签到",ttFlyTip)
		return 
	end
	
	if newSignIn == nSignIn then
		-- 当天才可以再签一次
		if d == checkDay and qdAgain == 0 then
			if not var.days.PeyNum or var.days.PeyNum == 0 then		-- 今天是否有充值过
				-- 需要弹出 "充值1元宝即可再领取1次奖励"提示
				SendRecommendTips(sysarg,"1");
				return false;
			else
				local reward = { cfg.reward }
				if not Awards.CheckBagGridCount(sysarg, reward) then
					return false
				end
				
				logStr = "再签一次";
				if Awards.Give(sysarg, reward, GameLog.cSigninGift, logStr) == false then
					return false -- 背包空间不足
				end
				
				var.days.qdAgain = 1
				loadSignAgain(sysarg,var.days)
				Actor.sendTipmsg(sysarg, Lang.ScriptTips.edc0006, ttFlyTip)
				return true
			end
		else
			Actor.sendTipmsg(sysarg, Lang.ScriptTips.edc0003, ttFlyTip);
			return false;
		end
	end
	
	local myVipLevel = Actor.getIntProperty(sysarg, PROP_ACTOR_VIP_GRADE)
	local monthDays = EveryDayCheck.monthDays;
	local consumeData = {}
	if d ~= checkDay and checkDay <= monthDays[m] and myVipLevel<2 then -- 补签(vip2免费补签)
		local isok = CheckOneConsume(sysarg, false, EveryDayCheck.supplementConsume, true, consumeData);
		if not isok then
			return false 
		end
	end
	
	local reward = { cfg.reward }
	if not Awards.CheckBagGridCount(sysarg, reward) then
		return false
	end
	
	if d ~= checkDay and checkDay <= monthDays[m] and myVipLevel<2 then -- 补签(vip2免费补签)
		logStr = "补签";
		local isok = DeductOneConsume(sysarg, false, EveryDayCheck.supplementConsume, GameLog.cSigninGift)		
		if not isok then return false end	
	end
	
	if myVipLevel>0 then --如果是vip，就给双倍
		for i,v in ipairs(reward) do 
			v.count=v.countOnce*2
		end
	else
		for i,v in ipairs(reward) do 
			v.count=v.countOnce
		end
	end
	
	if Awards.Give(sysarg, reward, GameLog.cSigninGift, logStr) == false then
		return false -- 背包空间不足
	end
	
	Actor.setUIntProperty(sysarg, PROP_ACTOR_SIGNIN, newSignIn);
	Actor.sendTipmsg(sysarg, Lang.ScriptTips.edc0005, ttFlyTip);
	
	--补签和正常签都算完成活跃度
	OnFinish_Liveness(sysarg,1)
	
	return true;
end

-- 签到积累天数操作
function handleCheckDayCountOpt(sysarg, sysid, packet)
	-- print("签到功能暂时未开放")
	-- return false

	if sysid ~= LogicCmd.miscSys.sub.cGetAccumulatedDaysAward then
		return false;
	end
	
	local nIndx = DataPack.readByte(packet);--奖励索引
	if not nIndx then
		return false;
	end
	
	-- 奖励不存在
	local tAward = EveryDayCheck.AccumulatedDaysAward[nIndx];
	if not tAward then
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.edc0004, tAward.days), ttFlyTip);
		return false;
	end
	
	-- 是否已领取过
	local var = Actor.getStaticVar(sysarg);
	local ljqdAward = var.ljqdAward;
	if not ljqdAward then
		ljqdAward = 0;
	end

	if System.getIntBit(ljqdAward, nIndx - 1) == 1 then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.edc0002, ttFlyTip);
		return false;
	end

	-- 统计签到天数
	local nSignIn = Actor.getUIntProperty(sysarg, PROP_ACTOR_SIGNIN)
	local i = 0;
	local nDayCount = 0;
	local monthDays = EveryDayCheck.monthDays;
	local y, m, d = System.getDate();
	while i < monthDays[m] do
		if System.getIntBit(nSignIn, i) == 1 then
			nDayCount = nDayCount + 1;
		end
		i = i + 1;
	end

	if nDayCount < tAward.days then
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.edc0001, tAward.days), ttFlyTip);
		return false;
	end
	
	local myVipLevel = Actor.getIntProperty(sysarg, PROP_ACTOR_VIP_GRADE)
	--if myVipLevel>0 then --如果是vip，就给双倍
	--	for i,v in ipairs(tAward.reward) do 
	--		v.count=v.countOnce*2
	--	end
	--else
		for i,v in ipairs(tAward.reward) do 
			v.count=v.countOnce
		end
	--end
	
	
	-- 领取奖励
	local gridCount = Item.getBagEmptyGridCount(sysarg);
	if Awards.Give(sysarg, tAward.reward, LogIds.SignInCumulativeAward, logStr) == false then
		return false;
	end
	
	var.ljqdAward = System.setIntBit(ljqdAward, nIndx - 1, true);
	sendAccumulateSignAwardFlag(sysarg,var)
	Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.edc0007, tAward.days), ttFlyTip);
	return true;
end

EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeEveryDayCheck, EventCallDispatcher.handleEveryDayCheck);
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cGetAccumulatedDaysAward, handleCheckDayCountOpt);

--[[/////////////////////////////////////////////////////////////////////////////////////////////
local function GetSigninGift(sysarg,GiftId)
	
	if not EveryDayCheck[GiftId] then return end

	local Everydaycheck = EveryDayCheck[GiftId]
	
	--获取玩家静态变量
	local var = Actor.getStaticVar(sysarg)
	local SigninGift = var.SigninGift
	if not SigninGift then
		var.SigninGift = {}
		SigninGift = var.SigninGift
	end
	
	if SigninGift[GiftId] > 0 then
		return
	end
	
	local SigninDays = Actor.getIntProperty(sysarg, PROP_ACTOR_CHECKINS) -- PROP_ACTOR_CHECKINS 已经挪为它用
	if SigninDays < Everydaycheck.days then
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.zf561,Everydaycheck.days), ttFlyTip)
		return
	end

	GiftConfig = Everydaycheck.reward
	VipGiftConfig = Everydaycheck.vipreward
	local myVipLevel = Actor.getIntProperty(sysarg, PROP_ACTOR_VIP_GRADE)
	--检查背包空格是否足够
	if myVipLevel > 0 then
		local bResult, BagCount = Awards.CheckBagGridCount(sysarg, GiftConfig,1)
		local bVipResult, BagVipCount = Awards.CheckBagGridCount(sysarg, VipGiftConfig,1)
		local count = BagCount + BagVipCount
	
		local bagCount = Item.getBagEmptyGridCount(sysarg)
		if count > bagCount then
			Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.mt00001, count), ttFlyTip)
			return
		end
	else
		if not Awards.CheckBagGridCount(sysarg, GiftConfig) then
			return
		end
	end
	
	--奖品一个物品给玩家
	Awards.Give(sysarg, GiftConfig, GameLog.cSigninGift, "SigninGift")
	
	if myVipLevel > 0 then
		Awards.Give(sysarg, VipGiftConfig, GameLog.cSigninGift, "SigninGift")
	end
	var.SigninGift[GiftId] = 2	--标示2为已领取
	Actor.sendTipmsg(sysarg,Lang.ScriptTips.tf00014,ttFlyTip)

	local netPack = DataPack.allocPacket(sysarg, 139, 100)
	for key = 1,#EveryDayCheck do
		if SigninGift[key] == nil then
			SigninGift[key] = 0
		end
		
		DataPack.writeByte(netPack, SigninGift[key])
	end
	DataPack.flush(netPack)
end

--领取每日签到奖品接口
MiscsImplement.handleGetGiftBagOp = function (sysarg, msgid,packet)
	
	if not packet then return false end
	local GetTypeID = DataPack.readByte(packet)

	if GetTypeID <= #EveryDayCheck then
		GetSigninGift(sysarg, GetTypeID)
	end
end

--领取每日签到奖品接口
MiscsImplement.handleGetGiftflag = function (sysarg, msgid,packet)
	
	--获取玩家静态变量
	local var = Actor.getStaticVar(sysarg)
	local SigninGift = var.SigninGift
	if not SigninGift then
		var.SigninGift = {}
		SigninGift = var.SigninGift
	end

	
	
	local netPack = DataPack.allocPacket(sysarg, 139, 100)
	for key = 1,#EveryDayCheck do
		if SigninGift[key] == nil then
			SigninGift[key] = 0
		end
	
		DataPack.writeByte(netPack, SigninGift[key])
	end
	DataPack.flush(netPack)
end

--注册回调函数	
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cGiveCheckGift, MiscsImplement.handleGetGiftBagOp)
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cCheckGiftflag, MiscsImplement.handleGetGiftflag)
--]]