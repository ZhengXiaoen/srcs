--#include "data\functions\Systems\TimeReward\TimeLotteryReward.lua" once

--客户端登陆处理
EventCallDispatcher.LoginDailyLottery = function ( sysarg )
	local time = System.getCurrMiniTime()
	local var = Actor.getStaticVar( sysarg )	--获得上次剩余的在线抽奖记录
	ClearLottryInfo( sysarg )
	if var.LottryInfo then
		if math.floor(var.LottryInfo[3]/LotteryDeploy.DAYTIME) ~= math.floor(time/LotteryDeploy.DAYTIME) then
			ClearLottryInfo( sysarg )
		end
	end	
end

function ClearLottryInfo( sysarg )
		
		local var = Actor.getStaticVar( sysarg )
		var.LottryInfo = {}
		var.LottryInfo[1] = 0						--在线累积时间
		var.LottryInfo[2] = 0						--在线累积抽奖次数
    	var.LottryInfo[3] = 0                    	--记录时间用于判断隔天    	
    	var.LottryInfo[4]={}
    	var.LottryInfo[4][1]=0					--记录上次抽奖ID
    	var.LottryInfo[4][2]=0					--记录上次抽奖ID
    	var.LottryInfo[4][3]=0					--记录上次抽奖ID
    	var.LottryInfo[4][4]=0					--记录上次抽奖ID

		var.LottryInfo[5] = {}
    	var.LottryInfo[5][1] = 0						--记录这次抽奖ID
    	var.LottryInfo[5][2] = 0						--记录这次抽奖ID
    	var.LottryInfo[5][3] = 0						--记录这次抽奖ID
    	var.LottryInfo[5][4] = 0						--记录这次抽奖ID

end

--新的一天
EventCallDispatcher.NewDailyLottery = function ( sysarg )
	ClearLottryInfo( sysarg )
end

-- 处理客户端抽奖请求
MiscsImplement.HandleLottery = function ( sysarg )
	--local var = Actor.getStaticVar( sysarg )
	--if not var.LottryInfo then		
	--	return
	--end
	--local curTime = System.getCurrMiniTime()
	--var.LottryInfo[1] = curTime - Actor.getLoginTime( sysarg ) + (var.LottryInfo[1] or 0)
	--local avalidLotteryCount = math.floor(var.LottryInfo[1] / LotteryDeploy.seconds) - (var.LottryInfo[2] or 0)
	--if(avalidLotteryCount < 1) then
	--	Actor.sendTipmsg(sysarg,Lang.Misc.L000001, ttFlyTip)
	--	return
	--end
	--local itemList = var.LottryInfo[5]
	--local itemCount = #itemList
	--local count = 0
	--for i=1,itemCount do
	--	local itemInfo = OnlineLotteryAward[itemList[i]]
	--	if itemInfo.type == 0 then		
	--		count = count + Item.getAddItemNeedGridCount( sysarg, itemInfo.id, itemInfo.count, itemInfo.quality, itemInfo.strong)
	--	end
	--end
	--local bagIdxs = Item.getBagEmptyGridCount( sysarg )	
	--if bagIdxs < count then
	--	Actor.sendTipmsg( sysarg,string.format(Lang.ScriptTips.tf00008, count),ttFlyTip )
	--	return
	--end
	--for i=1,itemCount do
	--	local itemInfo = OnlineLotteryAward[itemList[i]]
	--	Actor.giveAward(sysarg, itemInfo.type,itemInfo.id,itemInfo.count,itemInfo.strong,itemInfo.quality,itemInfo.bind, 0,0, Lang.LogTips.l00138)
	--end
    --
	--var.LottryInfo[2] = (var.LottryInfo[2] or 0) + 1
	--var.LottryInfo[3] = curTime
    --
	--for i=1,itemCount do
	--	var.LottryInfo[4][i] = itemList[i]
	--end		
    --
	--local npack = DataPack.allocPacket(sysarg,139,91)  --申请一个数据包
	--if (npack == nil) then
	--	return
	--end
	--DataPack.writeByte(npack,1)    
	--DataPack.flush(npack)   --发送数据包
end

--下发客户端抽奖情况请求
MiscsImplement.GetLotteryInfo = function ( sysarg )	
	--服务端返回在线信息 
--	local npack = DataPack.allocPacket(sysarg,139,90)  --申请一个数据包
--	if (npack == nil) then
--		return
--	end
--	local var = Actor.getStaticVar( sysarg )	
--	if not var.LottryInfo then		
--		ClearLottryInfo( sysarg )
--	end

--	local curTime = System.getCurrMiniTime()
--	var.LottryInfo[1] = curTime - Actor.getLoginTime( sysarg ) 
--	local onlineTime = var.LottryInfo[1]
--	local avalidLotteryCount = math.floor(onlineTime / LotteryDeploy.seconds) - (var.LottryInfo[2] or 0)	
--	if avalidLotteryCount > 0 then
--		local count = 4
--		local sameIdList = {}
--		local maxId = #OnlineLotteryAward
--        local nLoopIndex=  0
--		while count > 0 do
--			local id = math.random(1,maxId)
--			if not sameIdList[id] then
--				sameIdList[id] = 1
--				var.LottryInfo[5][count] = id
--				count = count - 1
--			end
--             nLoopIndex = nLoopIndex + 1
--            if nLoopIndex > 10000 then
--                    System.trace("LoopIndex GemExChangeStr")
--                    break
--            end
--		end
--	end	
-- 	DataPack.writeUInt(npack,math.floor(onlineTime/60))
-- 	DataPack.writeByte(npack,avalidLotteryCount) 
-- 	for i=1,4 do
-- 		DataPack.writeByte(npack,var.LottryInfo[4][i])  
-- 	end
-- 	for i=1,4 do
-- 		DataPack.writeByte(npack,var.LottryInfo[5][i])  
-- 	end
--	DataPack.flush(npack)   --发送数据包	
end

EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeUserLogin, EventCallDispatcher.LoginDailyLottery)
--MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cDailyLottery, MiscsImplement.GetLotteryInfo)
--MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cExchangeLotteryTimes, MiscsImplement.HandleLottery)
EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeNewDayArrive, EventCallDispatcher.NewDailyLottery)