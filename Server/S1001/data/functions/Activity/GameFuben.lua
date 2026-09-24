--#include "data\config\activity\GameFubenCfg.lua"
--#include "data\functions\FuBenNpcFunc\FubenCommonFunc.lua" once
--#include "data\functions\FuBenNpcFunc\NewFubenFunc.lua" once


function InitFubenWindow(sysarg,fubenId)
	if fubenId <= 0 then return false end

	local fbdata = FuBen[fubenId]
	if fbdata == nil then return false end

	local netPack = DataPack.allocPacket(sysarg, 26, 69)
	if (netPack == nil) then return false end
	DataPack.writeUInt(netPack, fubenId)
	DataPack.writeString(netPack, fbdata.fbname)
	DataPack.writeUInt(netPack, fbdata.fbTime)
	DataPack.writeUInt(netPack, 1)
	DataPack.writeByte(netPack, 0)
	
	DataPack.flush(netPack)
	if fubenId == 3 then
		Actor.sendTipmsg(sysarg,string.format("请别忘记使用<(c0xFFff0000)多倍经验卷>哦",5),4); 
	end
	
	return true
end

--请求获取副本信息
function HandleGetFubenInfo( sysarg, msgid, packet )
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sSendFubenInfo)
	
	local fubenCount = #GameFubenCfg.fubenList
	DataPack.writeByte(netPack, fubenCount)	
			
	local leftTimes
	local buyTimes
	local defaultTimes
	for i, v in ipairs(GameFubenCfg.fubenList) do
		leftTimes, buyTimes, defaultTimes = get_fb_left_times(sysarg, v.fubenId)	
		DataPack.writeByte(netPack, defaultTimes + buyTimes) -- 总次数	
		DataPack.writeByte(netPack, leftTimes)
	end

	DataPack.flush(netPack)
end

--请求进入副本
function HandleEnterFuben( sysarg, msgid, packet )
	
	--检查哪些地图是不能进入个人副本的
	local canEnterFBTable = {119,11,80,81,109,110,111,112,113,114,115,116,117,118,120,121,216,217,218,234,342,340}
	for i=1,#canEnterFBTable do 
		if Actor.getSceneId(sysarg) == canEnterFBTable[i] then
			Actor.sendTipmsg(sysarg,"此地图不能进入个人副本",ttFlyTip)
			return 
		end
	end


	local fubenId = DataPack.readByte(packet)
	fubenId=tonumber(fubenId)
	
	if (fubenId ==113 or fubenId ==183 ) and IsSpeciaTitleVip(sysarg,1) ==false then 
		Actor.sendTipmsg(sysarg,string.format("您没有黄铜特权，不能进入此副本"),ttFlyTip)
		return 
	end
	if (fubenId ==114 or fubenId ==184 or fubenId ==185 ) and IsSpeciaTitleVip(sysarg,2) ==false then 
		Actor.sendTipmsg(sysarg,string.format("您没有白银特权，不能进入此副本"),ttFlyTip)
		return 
	end
	if (fubenId ==115 or fubenId ==186 or fubenId ==187 ) and IsSpeciaTitleVip(sysarg,3) ==false then 
		Actor.sendTipmsg(sysarg,string.format("您没有黄金特权，不能进入此副本"),ttFlyTip)
		return 
	end
	local cfg, idx = GetFubenInfoByFubenId(fubenId)
	if cfg == nil then return end
	
	local isNeedItem = false
	--if cfg.needItem ~= nil and cfg.needItem.id ~= nil and cfg.needItem.count > 0 then
	--	isNeedItem = true
	--end
	
	--检查进去要扣得物品和id
	local sVar = Actor.getStaticVar(sysarg)
	
	if not sVar.days.fbtms then sVar.days.fbtms = {} end
	if not sVar.days.fbtms[fubenId] then sVar.days.fbtms[fubenId] = {} end
	local enteredTimes = sVar.days.fbtms[fubenId][1] --已经进去了几次,没进过是第0次
	if not enteredTimes then enteredTimes = 0 end
	
	
	local needItemId = 0
	local needItemCount = 0
	
	if #cfg.needItem<enteredTimes+1 then 
		needItemId = cfg.needItem[#cfg.needItem].id
		needItemCount = cfg.needItem[#cfg.needItem].count
	else 
		needItemId = cfg.needItem[enteredTimes+1].id
		needItemCount = cfg.needItem[enteredTimes+1].count
	end
	
	if cfg.needItem ~= nil and needItemId ~= nil and needItemCount > 0 then
		isNeedItem = true
	end
	
	
	local nowVar =get_taskflags_val(sysarg)
	
	if isNeedItem and not(nowVar== 85 and fubenId==100)  and not(nowVar== 91 and fubenId==101)  and not(nowVar== 95 and fubenId==102)then--任务不扣消耗
		--if Actor.getItemCount(sysarg,cfg.needItem.id) < cfg.needItem.count then
		--	Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf640,Item.getItemName(cfg.needItem.id),cfg.needItem.count),ttFlyTip)
		--	return			
		--end
		
		if Actor.getItemCount(sysarg,needItemId) < needItemCount then
			Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf640,Item.getItemName(needItemId),needItemCount),ttFlyTip)
			return			
		end
		
	end
	
	local isok = start_enter_fuben(sysarg, fubenId)
	
	if isok then
		if isNeedItem and not(nowVar== 85 and fubenId==100)  and not(nowVar== 91 and fubenId==101)  and not(nowVar== 95 and fubenId==102)then--任务不扣消耗
			
			if Actor.removeItem(sysarg,needItemId,needItemCount,-1,-1,-1,"EnterFubenConsume", 5) ~= needItemCount then 
			--if Actor.removeItem(sysarg,cfg.needItem.id,cfg.needItem.count,-1,-1,-1,"EnterFubenConsume", 5) ~= cfg.needItem.count then 
				print("HandleEnterFuben remove item count ~= need Remove item count, Actorid = "..Actor.getIntProperty(sysarg,PROP_ENTITY_ID))
			end
		end
		
		InitFubenWindow(sysarg, fubenId)
		--完成活跃度
		OnFinish_Liveness(sysarg,13)
		Actor.addTimer(sysarg,25,2000)
	end
	
end

--退出副本
function HandleExitFuben( sysarg, msgid, packet )
	local fubenId = DataPack.readByte(packet)
	onExitFubenFunc(sysarg)
end

--领取副本通关奖励
function HandleGetFubenPassAward( sysarg, msgid, packet)

	local awardType = DataPack.readByte(packet) -- 1 为单倍奖励，2 为双倍奖励
	if not CanGetFubenPassAward(sysarg) then return end

	local fubenId = Actor.getFubenId(sysarg)	
	if fubenId <= 0 then return end -- 不在副本中
	local cfg, fb_idx = GetFubenInfoByFubenId(fubenId)
	if cfg == nil then return end
	if awardType == 2 then -- 领取双倍奖励
		local consumeData = {}
		local isok = CheckOneConsume(sysarg, false, cfg.doubleConsume, true, consumeData)				
		if not isok then return end	
	end
	local myexp = 0
	--for _,v in ipairs(FubenAwardCfg) do
	--	if v.fubenId == fubenId then 
	--		myexp=v.award[1].count
	--	end
	--end
	myexp=cfg.award[1].count
	if awardType == 2 then
		myexp=myexp*3--3倍奖励
	end
	--扣除消耗
	if awardType == 2 then
	
		local strlog ="个人副本"
		local tables = GameFubenCfg.fubenList
		for _,v in pairs(tables) do 
			if v.fubenId == fubenId then 
				strlog = v.fubenName
				break
			end
		end
		
		local isok = DeductOneConsume(sysarg, false, cfg.doubleConsume, GameLog.cNewFuBenAwardConsume, strlog)	
		if not isok then return end
	end
	Actor.addExp(sysarg,myexp)

	--设置已经领取了奖励
	SetGotFubenPassAward(sysarg)
	
	onExitFubenFunc(sysarg)
	-- 返回结果
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sSendGetPassAwardResult)	
	DataPack.writeByte(netPack, fubenId)
	DataPack.writeByte(netPack, 1)
	DataPack.flush(netPack)

end

--购买进入副本次数
function HandleBuyFubenTimes( sysarg, msgid, packet )
	local fubenId = DataPack.readByte(packet)
	
	local cfg, fb_idx = GetFubenInfoByFubenId(fubenId)
	if cfg == nil then return end
		
	if not buy_fb_times(sysarg, fubenId) then return end
		
	Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf120, ttFlyTip)
	local left_times
	local buy_times
	local default_times
	
	left_times, buy_times, default_times = get_fb_left_times(sysarg, fubenId)
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sSendFubenLeftTimes)	
	DataPack.writeByte(netPack, fubenId)
	DataPack.writeByte(netPack, fb_idx)
	DataPack.writeByte(netPack, default_times + buy_times)
	DataPack.writeByte(netPack, left_times)
	DataPack.flush(netPack)
end


MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cGetFubenInfo, HandleGetFubenInfo)
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cEnterFuben, HandleEnterFuben)
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cExitFuben, HandleExitFuben)
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cGetFubenPassAward, HandleGetFubenPassAward)
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cFubenBuyTimes, HandleBuyFubenTimes)


-- 富贵兽副本
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cGetFuGuiShouBubenInfo, HandleGetFuGuiShouFubenInfo)
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cEnterFuGuiShouBuben, HandleEnterFuGuiShouFuben)
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cExitFuGuiShouBuben, HandleExitFuGuiShouFuben)
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cFuGuiShouDoubleExp, HandleFuGuiShouDoubleExp)
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cCreateFuGuiShou, HandleCreateFuGuiShou)