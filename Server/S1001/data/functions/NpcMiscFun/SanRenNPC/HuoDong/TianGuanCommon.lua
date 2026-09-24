--天关公共接口

RandTGId = 0 --塞子摇出的场景ID
TGNeedYuanBaoList = {[83]=0,[84]=20,[85]=30,[86]=40,[87]=50,[88]=60} --通关需要元宝
TianGuanList = {83,84,85,86,87,88}
--闯入每一关可以获取的奖励
TianGuanReward = {}
TianGuanReward[84] = {
	{type = 20, id = 0, count=2000000, quality=0, strong=0, bind=1},
}
TianGuanReward[85] = {
	{type = 20, id = 0, count=3000000, quality=0, strong=0, bind=1},
}
TianGuanReward[86] = {
	{type = 20, id = 0, count=4000000, quality=0, strong=0, bind=1},
}
TianGuanReward[87] = {
	{type = 20, id = 0, count=5000000, quality=0, strong=0, bind=1},
}
TianGuanReward[88] = {
	{type = 20, id = 0, count=6000000, quality=0, strong=0, bind=1},
}

--最后通关的奖励
TGRewardInfo = {
	[1] = {name = "一",count=20000000,yb = {[2]=140,[3]=285,[5]=570},},
	[2] = {name = "二",count=24000000,yb = {[2]=155,[3]=310,[5]=620},},
	[3] = {name = "三",count=28000000,yb = {[2]=170,[3]=340,[5]=680},},
	[4] = {name = "四",count=32000000,yb = {[2]=185,[3]=370,[5]=740},},
	[5] = {name = "五",count=36000000,yb = {[2]=200,[3]=400,[5]=800},},
	[6] = {name = "六",count=40000000,yb = {[2]=215,[3]=430,[5]=860},},
	[7] = {name = "七",count=44000000,yb = {[2]=230,[3]=460,[5]=920},},
	[8] = {name = "八",count=48000000,yb = {[2]=242,[3]=485,[5]=980},},
	[9] = {name = "九",count=52000000,yb = {[2]=257,[3]=515,[5]=1030},},
	[10] = {name = "十",count=56000000,yb = {[2]=285,[3]=570,[5]=1140},},
}

function RandScene(sysarg)
	if not Actor.isKillAllMonster(sysarg,0) then
		Actor.sendTipmsg(sysarg, string.format("该层的怪物还没杀完，您暂时不能通关"), 256)
		return
	end	
	local npack = DataPack.allocPacket(sysarg,LogicCmd.miscSys.sysId,LogicCmd.miscSys.sub.sSendfbRandScene)  --申请一个数据包
	if npack == nil then
		print("allocPacket is nil!")
		return
	end
	RandTGId = GetTGSceneIndex(sysarg)
	local nextSceneId,nextIndex = GetNextTGSceneId(sysarg)
	if nextSceneId == 0 then return end
	DataPack.writeByte(npack,RandTGId)
	if TianGuanList[RandTGId] == nextSceneId then
		DataPack.writeByte(npack,1)
	else
		DataPack.writeByte(npack,0)
	end
	DataPack.writeByte(npack,nextIndex)
	DataPack.flush(npack)
end

function BuyYuBao(sysarg)
--[[	if not Actor.isKillAllMonster(sysarg,0) then
		Actor.sendTipmsg(sysarg, string.format("该层的怪物还没杀完，您暂时不能通关"), 256);
		return
	end	--]]
	local nextSceneId,nextId = GetNextTGSceneId(sysarg)
	if nextSceneId == 0 then return end
	if Actor.getMoneyCount(sysarg,3) >= TGNeedYuanBaoList[nextSceneId] then
		Actor.changeMoney(sysarg,3,-TGNeedYuanBaoList[nextSceneId],GameLog.cNewTianGuanDirectly,"TianGuan")
		Actor.enterScene(sysarg, nextSceneId, -1, -1)
		if TianGuanReward[nextSceneId] then
			for _,info in ipairs(TianGuanReward[nextSceneId]) do
				if info.type ~= 20 then
					Actor.giveAward( sysarg, info.type, info.id, info.count,0, 0, 1, 0,998,  "get tianguan reward")
				else
				   Actor.addExp( sysarg, info.count, 0, 0)
				   --System.broadcastTipmsg(string.format("恭喜玩家<(c0xFF00FF00)%s>闯入天关第<(c0xFF00FF00)%d>层，获得经验<(c0xFF00FF00)%d>",Actor.getName(sysarg),nextId,info.count), ttScreenCenter+ttChatWindow)
				end
			end
		end
	else
		Actor.sendTipmsg(sysarg, string.format("您的元宝不足%d,通关失败,请充值元宝后再来闯关吧.",TGNeedYuanBaoList[nextSceneId]), 256)
		return
	end
end

function Y(sysarg)
	local nextSceneId,nextId = GetNextTGSceneId(sysarg)
	if TianGuanList[nextId] == nextSceneId then
		Actor.enterScene(sysarg, nextSceneId, -1, -1)
		if TianGuanReward[nextSceneId] then
			for _,info in ipairs(TianGuanReward[nextSceneId]) do
				if info.type ~= 20 then
					Actor.giveAward( sysarg, info.type, info.id, info.count,0, 0, 1, 0,998,  "get tianguan reward")
				else
				   Actor.addExp( sysarg, info.count, 0, 0)
				  -- System.broadcastTipmsg(string.format("恭喜玩家<(c0xFF00FF00)%s>闯入天关第<(c0xFF00FF00)%d>层，获得经验<(c0xFF00FF00)%d>",Actor.getName(sysarg),nextId,info.count), ttScreenCenter+ttChatWindow)
				end
			end
		end
	end
end

function N(sysarg)
	Actor.reuseAllMonster(sysarg,Actor.getSceneId(sysarg))	
end



function GetNextTGSceneId(sysarg)
	local nSceneId = Actor.getSceneId(sysarg)
	local nextSceneId = 0
	if nSceneId >= 83 and nSceneId < 88 then
		nextSceneId = nSceneId+1
	end
	for i=1,#TianGuanList do
		if nextSceneId == TianGuanList[i] then
			return nextSceneId,i
		end
	end
	return 0,0
end

function GetTGSceneIndex(sysarg)
--	local RandList = {[83]={},[84]={100,600,700,800,900,1000},[85]={100,200,600,750,900,1000},[86]={150,300,450,700,850,1000},[87]={150,300,450,600,900,1000},[88]={150,300,450,600,750,1000}}
--	local nextSceneId = GetNextTGSceneId(sysarg)
--	local RandIndexList = RandList[nextSceneId]
--	for i=1,#RandIndexList do
--		if System.getRandomNumber(1000) + 1 <= RandIndexList[i] then
--			return i
--		end
--	end
--	return 1
	local a = {
		{83,90},
		{84,80},
		{85,70},
		{86,60},
		{87,50},
		{88,40},
	};
	for i = 1,#a do
		if GetNextTGSceneId(sysarg) == a[i][1] then
			local c = math.random(1,100);
			if c <= a[i][2] then
				return i;
			end
		end
	end
	local c = math.random(1,6);
	if c == 6 then c = c - 1; end
	if c == 1 then c = c + 1; end
	return c
end

function GetFinalTGReward(sysarg,mupli)
	local var = Actor.getStaticVar(sysarg)

	if not var.TianGuanAwardId then
		var.TianGuanAwardId = 1
	end

	if var.getTGAward == 1 then
		Actor.sendTipmsg(sysarg, string.format("您已经领过奖励"), 256);
		return
	end
	local nTGAwardInfo = TGRewardInfo[var.TianGuanAwardId]
	if tonumber(mupli) > 1 then
		if Actor.getMoneyCount(sysarg,3) >= tonumber(nTGAwardInfo.yb[mupli]) then
			Actor.changeMoney(sysarg,3,-nTGAwardInfo.yb[mupli],GameLog.cExChangeStarPearl,"TianGuan")
		else
			Actor.sendTipmsg(sysarg, string.format("您的元宝不足%s,通关失败,请充值元宝后再来领奖吧.",nTGAwardInfo.yb[mupli]), 256)
			return
		end
	end
	--if not IsEnoughBagGrids(sysarg,TGRewardInfo) then
	  -- return
	--end
	var.getTGAward=1
	if nTGAwardInfo.count then
		local nAwardExp = nTGAwardInfo.count*mupli
		Actor.addExp( sysarg,nAwardExp , 0, 0)
		local nStr = string.format("恭喜玩家<(c0xFF00FF00)%s>顺利通过六层天关，领取了通关奖励<(c0xFF00FF00)%d>经验!",Actor.getName(sysarg),nAwardExp)
		System.broadcastTipmsg(nStr, ttScreenCenter+ttChatWindow)
	end
	Actor.exitActivityScene(sysarg)
end

