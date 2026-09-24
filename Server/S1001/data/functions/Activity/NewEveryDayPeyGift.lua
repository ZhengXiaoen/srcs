--#include "data\config\activity\EveryDayPayGiftCfg.lua" once
--#include "data\functions\Activity\PublicTest.lua" once

--领取每日充值大礼包
MiscsImplement.handleGetPayGiftOp2 = function (sysarg,msgid,packet)
	
	local level = DataPack.readByte(packet);
	
	if not EveryDayPayGiftCfg then return end
	
	local nDays = System.getDaysSinceOpenServer()
	local count = #EveryDayPayGiftCfg - 1 -- 去掉最后一个特别的礼包
	local nConfig 
	if nDays <= count then
		nConfig = EveryDayPayGiftCfg[nDays]
	else
		nConfig = EveryDayPayGiftCfg[count]
	end

	if level == 0 then
		
		SendNewEveryDayData(sysarg,nConfig)
		return
	end
	
	if not nConfig[level] then return end
	
	--领取的方法又修改了,没有分页了。。。。。
	--if level>5 then --大于5，出现分页
	--	local openServerDay = System.getDaysSinceOpenServer()
	--	if openServerDay<4 then --4天前不能取得分页的奖品
	--		return 
	--	end
	--end
	
	local var = Actor.getStaticVar(sysarg)
	local nPeyCount = var.days.PeyNum
	if not nPeyCount then 
		return
	elseif nPeyCount < nConfig[level].needPayMoney then
		return
	end
	
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
		awards = nConfig[level].award
--	end

	--检查背包
	if not Awards.CheckBagGridCount(sysarg, awards) then
		return
	end
	
	Awards.Give(sysarg, awards, GameLog.cGiveNewEverydayAward, "每日充值奖励")
	var.days.newEveryDayGiftFlag[level] = 1

	System.broadcastTipmsg(string.format(Lang.ScriptTips.zf363,Actor.getName(sysarg),nConfig[level].worth,nConfig[level].name),2048)
	System.broadcastTipmsg(string.format(Lang.ScriptTips.zf363,Actor.getName(sysarg),nConfig[level].worth,nConfig[level].name).."<我要领取/@@showWin,104>",ttChatWindow)
	
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