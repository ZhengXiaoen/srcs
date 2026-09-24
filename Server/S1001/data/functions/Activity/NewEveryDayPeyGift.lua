--#include "data\config\activity\EveryDayPayGiftCfg.lua" once
--#include "data\functions\Activity\PublicTest.lua" once

-- 每日领取位会跨天清空，旧日已经受理但未发完的奖励必须独立保存并补发。
local function retryPreviousNewEveryDayGifts(sysarg, var, today)
	local receipts = var.newEveryDayGiftGrants
	if receipts == nil then return end
	for key, receipt in pairs(receipts) do
		if receipt.day ~= today and receipt.progress and receipt.progress.items then
			if Awards.GiveTracked(sysarg, receipt.progress.items, receipt.progress, GameLog.cGiveNewEverydayAward, "补发往期每日充值奖励") then
				receipts[key] = nil
			end
		end
	end
end

--领取每日充值大礼包
MiscsImplement.handleGetPayGiftOp2 = function (sysarg,msgid,packet)
	
	local level = DataPack.readByte(packet);
	local var = Actor.getStaticVar(sysarg)
	if var.days == nil then var.days = {} end
	local today = System.getToday()
	retryPreviousNewEveryDayGifts(sysarg, var, today)
	local nConfig
	if EveryDayPayGiftCfg then
		local nDays = System.getDaysSinceOpenServer()
		local count = #EveryDayPayGiftCfg - 1 -- 去掉最后一个特别的礼包
		if nDays <= count then
			nConfig = EveryDayPayGiftCfg[nDays]
		else
			nConfig = EveryDayPayGiftCfg[count]
		end
	end
	if level == 0 then
		
		SendNewEveryDayData(sysarg,nConfig)
		return
	end
	
	local key = tostring(today)..":"..tostring(level)
	local receipts = var.newEveryDayGiftGrants
	local receipt = receipts and receipts[key]
	-- 已受理的奖励使用冻结清单；只有首次领取才依赖当下的活动配置。
	if receipt == nil and (not nConfig or not nConfig[level]) then return end
	
	--领取的方法又修改了,没有分页了。。。。。
	--if level>5 then --大于5，出现分页
	--	local openServerDay = System.getDaysSinceOpenServer()
	--	if openServerDay<4 then --4天前不能取得分页的奖品
	--		return 
	--	end
	--end
	
	if not var.days.newEveryDayGiftFlag then
		var.days.newEveryDayGiftFlag = {}
	elseif var.days.newEveryDayGiftFlag[level] then
		return
	end
	
	
	--领取的方法又修改了,没有分页了。。。。。
	----前三天是取配置表中第一页内容，4天后就是取1 2 3 4页的。 
	----领取方式就是 领了第1页的第2个奖励，那同时第2 3 4页的第2个奖励就不能领取了。
	----现在其他页的第二个奖励显示为已领取，需要改成领取按钮变暗。
    --
	----判断是否是分页的同一个内容，虽然前端可以判断变暗，以免外挂刷协议
	--local page_index = level%5
	--if page_index==0 then page_index =5 end   --判断是第几个，
	--
	----其他分页的第几个也不能领取
	--if var.days.newEveryDayGiftFlag[page_index] or var.days.newEveryDayGiftFlag[page_index+5] or var.days.newEveryDayGiftFlag[page_index+10] or var.days.newEveryDayGiftFlag[page_index+15] then 
	--	return
	--end
	
	
	
	
	
	local awards
	
	-- 如果是在月度活动期间则是月度奖励
	-- 屏蔽月度活动期间的奖励
--	if IsMonthActivityTime() then
--		awards = nConfig[level].monthAward
--	else
		awards = receipt and receipt.progress.items or nConfig[level].award
--	end

	if receipt == nil then
		local nPeyCount = var.days.PeyNum
		if not nPeyCount or nPeyCount < nConfig[level].needPayMoney then return end
		local progress = {}
		if Awards.PrepareTracked(awards, progress) ~= true then return end
		if receipts == nil then
			receipts = {}
			var.newEveryDayGiftGrants = receipts
		end
		receipt = {day = today, level = level, progress = progress}
		receipts[key] = receipt
	end
	-- GiveTracked 只重试尚未明确成功的项目，并自行检查剩余奖励所需的背包空间。
	if not Awards.GiveTracked(sysarg, receipt.progress.items, receipt.progress, GameLog.cGiveNewEverydayAward, "每日充值奖励") then return end
	var.days.newEveryDayGiftFlag[level] = 1
	receipts[key] = nil

	if nConfig and nConfig[level] then
		System.broadcastTipmsg(string.format(Lang.ScriptTips.zf363,Actor.getName(sysarg),nConfig[level].worth,nConfig[level].name),2048)
		System.broadcastTipmsg(string.format(Lang.ScriptTips.zf363,Actor.getName(sysarg),nConfig[level].worth,nConfig[level].name).."<我要领取/@@showWin,104>",ttChatWindow)
	end
	
	SendNewEveryDayData(sysarg,nConfig)

	-- 记录日志
	local nActorId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
	System.sendCommonLog(GameLog.cGetPayGift,nActorId,'',level,0,0,'','','','','','','',"Get Day Pay Gift")
end

function SendNewEveryDayData(sysarg,config)
	
	if not config then return end
	
	local var = Actor.getStaticVar(sysarg)
	if not var.days.newEveryDayGiftFlag then
		var.days.newEveryDayGiftFlag = {}
	end
	
	local nPeyCount = 0
	if var.days.PeyNum then 
		nPeyCount = var.days.PeyNum
	end
	
	local npack = DataPack.allocPacket(sysarg,139,142) 
	DataPack.writeByte(npack, #config)
	local nFlag = var.days.newEveryDayGiftFlag
	for key,data in ipairs(config) do
		if nFlag[key] then
			DataPack.writeByte(npack, 2)
		else
			if nPeyCount >= data.needPayMoney then
				DataPack.writeByte(npack, 1)
			else
				DataPack.writeByte(npack, 0)
			end
		end
	end
	DataPack.flush(npack)
end

MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cGetNewEveryDayAward, MiscsImplement.handleGetPayGiftOp2)