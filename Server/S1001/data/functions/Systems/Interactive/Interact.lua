
--温泉互动

local KissTime = 180 --拥吻时间

--#include "Common.lua" once
--#include "data\functions\Activity\Common\Awards.lua" once

--检测搞基条件 sysarg:自己 ActorPtr：对方 type:1攻 2受
function CheckKissCondition(sysarg, ActorPtr, type)
	if CheckInteract(sysarg, ActorPtr) ~= true then 
		return false
	end
	
	if Actor.getIntProperty(sysarg,PROP_ACTOR_SEX) == Actor.getIntProperty(ActorPtr,PROP_ACTOR_SEX) then
		Actor.sendTipmsg(sysarg,Lang.Activity.a00140,ttFlyTip)
		return false
	end
	
	if Actor.hasMapAreaAttri(sysarg,aaSwimArea) ~= true then 
		Actor.sendTipmsg(sysarg,Lang.Activity.a00141,ttFlyTip)
		return false
	end

	--自己是否在搞基，对方是否在搞基
	if Actor.hasState(sysarg, esStateKiss) ~= false or Actor.hasState(sysarg, esKissInLand) ~= false then
		local tips = ""
		if type == 1 then
			tips = Lang.Activity.a00142
		else
			tips = Lang.Activity.a00143
		end
		Actor.sendTipmsg(sysarg,tips,ttFlyTip)
		return false
	end
	if Actor.hasState(ActorPtr, esStateKiss) ~= false or Actor.hasState(ActorPtr, esKissInLand) ~= false then
		local tips = ""
		if type == 1 then
			tips = Lang.Activity.a00144
		else
			tips = Lang.Activity.a00145
		end
		Actor.sendTipmsg(sysarg,tips,ttFlyTip)
		return false
	end
	
	return true
end

--邀请搞基
function InviteKiss(sysarg,name)
	
	local ActorPtr = System.getActorPtr(name)	--目标玩家
	
	if CheckKissCondition(sysarg, ActorPtr, 1) ~= true then return end
	
	if CheckInteractData(sysarg, 4) ~= true then
		Actor.sendTipmsg(sysarg, Lang.Activity.a00146, ttFlyTip)
		return 
	end
	
	local mySelfName = Actor.getName(sysarg)
	--local mySelfId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
	local actorid = Actor.getIntProperty(ActorPtr,PROP_ENTITY_ID)
	
	
	local svar = Actor.getStaticVar(sysarg)
	if svar.autoAcceptSpringAction == 0 then		--不自动接收对方玩家的互动请求
		local handle = Actor.getHandle(thisNPC)
		local nActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
		Actor.messageBox(sysarg, handle, actorid, string.format(Lang.Activity.a00147, mySelfName), Lang.Activity.a00148.."/RespuestKiss,"..mySelfName, Lang.Activity.a00149.."/Cancel", nil, 0, 1, string.format(Lang.Activity.a00150, mySelfName),37,0,nActorId)
		Actor.sendTipmsg(sysarg, Lang.Activity.a00151, ttFlyTip)
	else	--自动，则目标玩家自动接受
		RespuestKiss(ActorPtr, mySelfName)
	end
end

--回复搞基
function RespuestKiss(sysarg, reqName)
	local index = 4
	local reqName = tostring(reqName) or ""
	
	local ActorPtr = System.getActorPtr(reqName)
	
	if CheckKissCondition(sysarg, ActorPtr, 2) ~= true then return end
	
	local result, times = ReduceInteractData(ActorPtr, index)
	if result ~= true then return end 
	
	local x, y = Actor.getEntityPosition(ActorPtr,0,0)
	
	local rand = math.random(2)
	local dir = {2, 6}
	Actor.setDir(sysarg,dir[rand])		--右
	Actor.setDir(ActorPtr,dir[rand])	--左
	
	--瞬移到对方的位置
	System.telportSceneDelay(sysarg,Actor.getSceneId(ActorPtr),x,y,200)
	--Actor.enterScene(sysarg, Actor.getSceneId(ActorPtr),x,y)
	
	local tbData = {{type = index, count = times}}
	
	SendInteractData(ActorPtr, tbData)
	
	Actor.startPractice(sysarg, 0, 0, ActorPtr, 4, 0, KissTime)
	Actor.startPractice(ActorPtr, 0, 0, sysarg, 4, 0, KissTime)
	
	local config = InteractConfig[index]
	if not config then return end
	--己方奖励
	if config[6] then
		Awards.Give(sysarg, config[6], 205, Lang.LogTips.l00086)
	end
	
	--对方奖励
	if config[5] then
		Awards.Give(ActorPtr, config[5], 205, Lang.LogTips.l00086)
	end
	
	InteractSay(sysarg, config[8], ActorPtr, config[7])
end

function InteractSay(say1, sayTbl1, say2, sayTbl2)
	local boSave = false
	--己方说话
	if sayTbl1 and say1 and table.getn(sayTbl1) > 0 then
		local randNum = math.random(table.getn(sayTbl1))
		local say = sayTbl1[randNum]
		if say then
			if type(say) == 'number' then
				Actor.sendVipSmile(say1, 0, say)
			else
				Actor.sendChat(say1, ciChannelNear, say, boSave)
			end
		end
	end
	
	--对方说话
	if sayTbl2 and say2 and table.getn(sayTbl2) > 0 then
		local randNum = math.random(table.getn(sayTbl2))
		local say = sayTbl2[randNum]
		if say then
			if type(say) == 'number' then
				Actor.sendVipSmile(say2, 0, say)
			else
				Actor.sendChat(say2, ciChannelNear, say, boSave)
			end
		end
	end
end

function Cancel()
	
end

function CheckInteract(sysarg, ActorPtr)
	
	if ActorPtr == nil then
		Actor.sendTipmsg(sysarg, Lang.Activity.a00152,ttFlyTip)
		return false
	end
	
	if Actor.isDeath(sysarg) then 
		return false 
	end
	
	if Actor.isDeath(ActorPtr) then
		Actor.sendTipmsg(sysarg, Lang.Activity.a00153,ttFlyTip)
		return false
	end
	
	if Actor.isOnBoard(sysarg) then
		Actor.sendTipmsg(sysarg, Lang.Activity.a00154,ttFlyTip)
		return false
	end
	
	if Actor.isOnBoard(ActorPtr) then
		Actor.sendTipmsg(sysarg,Lang.Activity.a00155,ttFlyTip)
		return false
	end
	
	--是否同屏，是否有位置搞基
	if not Actor.isInSameScreen(sysarg, ActorPtr) then
		Actor.sendTipmsg(sysarg,Lang.Activity.a00156,ttFlyTip)
		return false
	end
	return true
end

--递肥皂
function DeliverSoap(sysarg, name)
	--print("Interactive.DeliverSoap() "..name)
	local index = 1
	local ActorPtr = System.getActorPtr(name)
	
	if CheckInteract(sysarg, ActorPtr) ~= true then 
		return false
	end
	
	local svar = Actor.getStaticVar(sysarg)
	local InteractTimes = svar.days.InteractTimes

	if not InteractTimes[index] then return end
	
	local config = InteractConfig[index]
	if not config then return end
	if InteractTimes[index] <= 0 and config[3] ~= nil and config[3] > 0 then
		local handle = Actor.getHandle(thisNPC)
		Actor.messageBox(sysarg, handle, 0, string.format(Lang.Activity.a00157, config[3]), Lang.Activity.a00158.."/OnDeliverSoap,"..name.."", Lang.Activity.a00159.."/Cancel", nil)
		return
	end
	
	OnDeliverSoap(sysarg, name)
end

--递肥皂
function OnDeliverSoap(sysarg, name)
	local index = 1
	local ActorPtr = System.getActorPtr(name)
	
	if CheckInteract(sysarg, ActorPtr) ~= true then 
		return false
	end
	
	local config = InteractConfig[index]
	if not config then return end
	
	local item  = config[4]		--互动必定需要的道具（肥皂）
	if item ~= 0 then
		if Actor.getItemCount(sysarg, item) <= 0 then
			local itemName = Item.getItemName(item)
			Actor.sendTipmsg(sysarg, string.format(Lang.Activity.a00160, itemName), ttFlyTip)
			return
		end
	end
	
	local svar = Actor.getStaticVar(sysarg)
	local InteractTimes = svar.days.InteractTimes
	if not InteractTimes[index] then return end
	
	if InteractTimes[index] <= 0 then
		local yb  = config[3]
		local hasYb = Actor.getMoneyCount(sysarg, 3)
		if yb == nil or yb <= 0 then
			Actor.sendTipmsg(sysarg, Lang.Activity.a00194, ttFlyTip)
			return
		end
		if hasYb < yb then
			Actor.sendTipmsg(sysarg, Lang.Activity.a00193, ttFlyTip)
			return 
		end
		if yb ~= 0 then
			if Actor.changeMoney(sysarg, 3, -yb, GameLog.clNpcDelMoney, Lang.LogTips.l00087) ~= true then
				return
			end
		end
	else
		InteractTimes[index] = InteractTimes[index] - 1
		svar.days.InteractTimes[index] = InteractTimes[index]
	end
	
	local item  = config[4]
	if item ~= 0 then
		if Actor.getItemCount(sysarg, item) > 0 then
			if Actor.removeItem(sysarg, item, 1) < 1 then
				return false
			end
		else
			local itemName = Item.getItemName(item)
			Actor.sendTipmsg(sysarg, string.format(Lang.Activity.a00160, itemName), ttFlyTip)
			return
		end
	end
	
	local tbData = {{type = index, count = InteractTimes[index]}}
	
	SendInteractData(sysarg, tbData)
	
	--己方奖励
	if config[5] then
		Awards.Give(sysarg, config[5], 205, Lang.LogTips.l00087)
	end
	Actor.sendTipmsg(sysarg, string.format(Lang.Activity.a00161, name), ttFlyTip)
	--对方奖励
	if config[6] then
		Awards.Give(ActorPtr, config[6], 205, Lang.LogTips.l00087)
	end
	Actor.sendTipmsg(ActorPtr, string.format(Lang.Activity.a00162, Actor.getName(sysarg)), ttFlyTip)
	
	InteractSay(sysarg, config[7], ActorPtr, config[8])
end


--搓背
function RubBack(sysarg, name)
	--print("Interactive.RubBack() "..name)
	local index = 2
	local ActorPtr = System.getActorPtr(name)
	
	if CheckInteract(sysarg, ActorPtr) ~= true then 
		return false
	end
	
	local svar = Actor.getStaticVar(sysarg)
	local InteractTimes = svar.days.InteractTimes

	if not InteractTimes[index] then return end
	
	local config = InteractConfig[index]
	if not config then return end
	if InteractTimes[index] <= 0 and config[3] ~= nil and config[3] > 0 then
		local handle = Actor.getHandle(thisNPC)
		Actor.messageBox(sysarg, handle, 0, string.format(Lang.Activity.a00163, config[3]), Lang.Activity.a00158.."/OnRubBack,"..name.."", Lang.Activity.a00159.."/Cancel", nil)
		return
	end
	
	OnRubBack(sysarg, name)
end

--搓背
function OnRubBack(sysarg, name)

	local index = 2
	local ActorPtr = System.getActorPtr(name)
	
	if CheckInteract(sysarg, ActorPtr) ~= true then 
		return false
	end
	
	local config = InteractConfig[index]
	if not config then return end
	
	local item  = config[4]
	if item ~= 0 then
		if Actor.getItemCount(sysarg, item) <= 0 then
			local itemName = Item.getItemName(item)
			Actor.sendTipmsg(sysarg, string.format(Lang.Activity.a00160, itemName), ttFlyTip)
			return
		end
	end
	
	local svar = Actor.getStaticVar(sysarg)
	local InteractTimes = svar.days.InteractTimes
	if not InteractTimes[index] then return end
	
	if InteractTimes[index] <= 0 then
		local yb  = config[3]
		local hasYb = Actor.getMoneyCount(sysarg, 3)
		if yb == nil or yb <= 0 then
			Actor.sendTipmsg(sysarg, Lang.Activity.a00194, ttFlyTip)
			return
		end
		if hasYb < yb then
			Actor.sendTipmsg(sysarg, Lang.Activity.a00193, ttFlyTip)
			return 
		end
		if yb ~= 0 then
			if Actor.changeMoney(sysarg, 3, -yb,  GameLog.clNpcDelMoney, Lang.LogTips.l00088) ~= true then
				return
			end
		end
	else
		InteractTimes[index] = InteractTimes[index] - 1
		svar.days.InteractTimes[index] = InteractTimes[index]
	end
	
	local item  = config[4]
	if item ~= 0 then
		if Actor.getItemCount(sysarg, item) > 0 then
			if Actor.removeItem(sysarg, item, 1) < 1 then
				return false
			end
		else
			local itemName = Item.getItemName(item)
			Actor.sendTipmsg(sysarg, string.format(Lang.Activity.a00160, itemName), ttFlyTip)
			return
		end
	end
	
	local tbData = {{type = index, count = InteractTimes[index]}}
	
	SendInteractData(sysarg, tbData)
	
	--己方奖励
	if config[5] then
		Awards.Give(sysarg, config[5], 205, Lang.LogTips.l00088)
	end
	Actor.sendTipmsg(sysarg, string.format(Lang.Activity.a00165, name), ttFlyTip)
	--对方奖励
	if config[6] then
		Awards.Give(ActorPtr, config[6], 205, Lang.LogTips.l00088)
	end
	Actor.sendTipmsg(ActorPtr, string.format(Lang.Activity.a00166, Actor.getName(sysarg)), ttFlyTip)
	
	InteractSay(sysarg, config[7], ActorPtr, config[8])
end

--按摩
function Massage(sysarg, name)
	local index = 3
	local ActorPtr = System.getActorPtr(name)
	
	if CheckInteract(sysarg, ActorPtr) ~= true then 
		return false
	end
	
	local svar = Actor.getStaticVar(sysarg)
	local InteractTimes = svar.days.InteractTimes
	
	
	if not InteractTimes[index] then return end
	
	local config = InteractConfig[index]
	if not config then return end
	if InteractTimes[index] <= 0 and config[3] ~= nil and config[3] > 0 then
		local handle = Actor.getHandle(thisNPC)
		Actor.messageBox(sysarg, handle, 0, string.format(Lang.Activity.a00164, config[3]), Lang.Activity.a00158.."/OnMassage,"..name.."", Lang.Activity.a00159.."/Cancel", nil)
		return
	end
	
	OnMassage(sysarg, name)
end

--按摩
function OnMassage(sysarg, name)
	local index = 3
	local ActorPtr = System.getActorPtr(name)
	
	if CheckInteract(sysarg, ActorPtr) ~= true then 
		return false
	end
	
	local config = InteractConfig[index]
	if not config then return end
	
	local item  = config[4]
	if item ~= 0 then
		if Actor.getItemCount(sysarg, item) <= 0 then
			local itemName = Item.getItemName(item)
			Actor.sendTipmsg(sysarg, string.format(Lang.Activity.a00160, itemName), ttFlyTip)
			return
		end
	end
	
	local svar = Actor.getStaticVar(sysarg)
	local InteractTimes = svar.days.InteractTimes
	if not InteractTimes[index] then return end
	
	if InteractTimes[index] <= 0 then
		local yb  = config[3]
		local hasYb = Actor.getMoneyCount(sysarg, 3)
		if yb == nil or yb <= 0 then
			Actor.sendTipmsg(sysarg, Lang.Activity.a00194, ttFlyTip)
			return
		end
		if hasYb < yb then
			Actor.sendTipmsg(sysarg, Lang.Activity.a00193, ttFlyTip)
			return 
		end
		if yb ~= 0 then
			if Actor.changeMoney(sysarg, 3, -yb,  GameLog.clNpcDelMoney, Lang.LogTips.l00089) ~= true then
				return
			end
		end
	else
		InteractTimes[index] = InteractTimes[index] - 1
		svar.days.InteractTimes[index] = InteractTimes[index]
	end
	
	local item  = config[4]
	if item ~= 0 then
		if Actor.getItemCount(sysarg, item) > 0 then
			if Actor.removeItem(sysarg, item, 1) < 1 then
				return false
			end
		else
			local itemName = Item.getItemName(item)
			Actor.sendTipmsg(sysarg, string.format(Lang.Activity.a00160, itemName), ttFlyTip)
			return
		end
	end
	
	local tbData = {{type = index, count = InteractTimes[index]}}
	
	SendInteractData(sysarg, tbData)
	
	--己方奖励
	if config[5] then
		Awards.Give(sysarg, config[5], 205, Lang.LogTips.l00089)
	end
	Actor.sendTipmsg(sysarg, string.format(Lang.Activity.a00167, name), ttFlyTip)
	--对方奖励
	if config[6] then
		Awards.Give(ActorPtr, config[6], 205, Lang.LogTips.l00089)
	end
	Actor.sendTipmsg(ActorPtr, string.format(Lang.Activity.a00168, Actor.getName(sysarg)), ttFlyTip)
	
	InteractSay(sysarg, config[7], ActorPtr, config[8])
end


--2013/05/16由递香皂改为抚摸
--抚摸次数：免费次数+替代道具的数量之和
function Fondle(sysarg, name)
	--print("Interactive.Fondle() "..name)
	local index = 1
	local	idxitem = 11
	local ActorPtr = System.getActorPtr(name)	--对方玩家
	
	if CheckInteract(sysarg, ActorPtr) ~= true then 
		return false
	end
	
	local svar = Actor.getStaticVar(sysarg)
	local InteractTimes = svar.days.InteractTimes

	if not InteractTimes[index] then return end
	
	local config = InteractConfig[index]
	if not config then return end
	if InteractTimes[index] <= 0 and  InteractTimes[idxitem] >= config[9] then	--免费次数和道具次数已经用完
		Actor.sendTipmsg(sysarg, Lang.Activity.aa0001, ttFlyTip)
		return
	end
	
	OnFondle(sysarg, name)
end

--2013/05/16由递香皂改为抚摸
--抚摸次数：免费次数+替代道具的数量之和
function OnFondle(sysarg, name)
	--print("Interactive.OnFondle() "..name)
	local index = 1
	local idxitem = 11		--使用道具的次数
	local ActorPtr = System.getActorPtr(name)
	
	if CheckInteract(sysarg, ActorPtr) ~= true then 
		return false
	end
	
	local config = InteractConfig[index]
	if not config then return end
	
	local svar = Actor.getStaticVar(sysarg)
	local InteractTimes = svar.days.InteractTimes
	if not InteractTimes[index] then return end
	
	if InteractTimes[index] > 0 then 	--还有免费次数
		InteractTimes[index] = InteractTimes[index] - 1		--免费次数减一
		svar.days.InteractTimes[freeidx] = InteractTimes[freeidx]
		if InteractTimes[index] == 0 then
				local exttime = config[9] - InteractTimes[idxitem]
				Actor.sendTipmsg(sysarg, string.format(Lang.Activity.aa0004, exttime), ttFlyTip)
		end
	else	--没有免费次数
		if InteractTimes[idxitem] < config[9] then	--还有额外次数
			local item  = config[2]		--替代道具
			if item ~= 0 then
				if Actor.getItemCount(sysarg, item) > 0 then	--是否拥有道具
					if Actor.removeItem(sysarg, item, 1) < 1 then	--扣除一个道具
						return false
					end
					InteractTimes[idxitem] = InteractTimes[idxitem] + 1		--额外次数加一
					local exttime = config[9] - InteractTimes[idxitem]
					if exttime > 0 then
						Actor.sendTipmsg(sysarg, string.format(Lang.Activity.aa0004, exttime), ttFlyTip)
					else
						Actor.sendTipmsg(sysarg, Lang.Activity.a00198, ttFlyTip)
					end
				else
					Actor.sendTipmsg(sysarg, Lang.Activity.a00198, ttFlyTip)
					return
				end
			end
		else	--没有额外次数
			Actor.sendTipmsg(sysarg, Lang.Activity.aa0001, ttFlyTip)
			return
		end
	end 
	
	local tbData = {{type = index, count = InteractTimes[index]}}
	SendInteractData(sysarg, tbData)
	
	--己方奖励
	if config[5] then
		Awards.Give(sysarg, config[5], 205, Lang.LogTips.l00087)
	end
	Actor.sendTipmsg(sysarg, string.format(Lang.Activity.aa0002, name), ttFlyTip)
	--对方奖励
	if config[6] then
		Awards.Give(ActorPtr, config[6], 205, Lang.LogTips.l00087)
	end
	Actor.sendTipmsg(ActorPtr, string.format(Lang.Activity.aa0003, Actor.getName(sysarg)), ttFlyTip)
	
	InteractSay(sysarg, config[7], ActorPtr, config[8])
	broadcaseToScene(Actor.getSceneId(sysarg), string.format(Lang.Activity.a00199, Actor.getName(sysarg), name))
end



--2013/05/16由递搓背改为按摩
--抚摸次数：免费次数+替代道具的数量之和
function Chirismus(sysarg, name)
	--print("Interactive.Chirismus() "..name)
	local index = 2
	local	idxitem = 21
	local ActorPtr = System.getActorPtr(name)	--对方玩家
	
	if CheckInteract(sysarg, ActorPtr) ~= true then 
		return false
	end
	
	local svar = Actor.getStaticVar(sysarg)
	local InteractTimes = svar.days.InteractTimes

	if not InteractTimes[index] then return end
	
	local config = InteractConfig[index]
	if not config then return end
	if InteractTimes[index] <= 0 and  InteractTimes[idxitem] >= config[9] then	--免费次数和道具次数已经用完
		Actor.sendTipmsg(sysarg, Lang.Activity.aa0005, ttFlyTip)
		return
	end
	
	OnChirismus(sysarg, name)
end

--2013/05/16由递搓背改为按摩
--抚摸次数：免费次数+替代道具的数量之和
function OnChirismus(sysarg, name)
	local index = 2
	local idxitem = 21		--使用道具的次数
	local ActorPtr = System.getActorPtr(name)
	
	if CheckInteract(sysarg, ActorPtr) ~= true then 
		return false
	end
	
	local config = InteractConfig[index]
	if not config then return end
	
	local svar = Actor.getStaticVar(sysarg)
	local InteractTimes = svar.days.InteractTimes
	if not InteractTimes[index] then return end
	
	if InteractTimes[index] > 0 then 	--还有免费次数
		InteractTimes[index] = InteractTimes[index] - 1		--免费次数减一
		svar.days.InteractTimes[freeidx] = InteractTimes[freeidx]
		if InteractTimes[index] == 0 then
				local exttime = config[9] - InteractTimes[idxitem]
				Actor.sendTipmsg(sysarg, string.format(Lang.Activity.aa0010, exttime), ttFlyTip)
		end
	else	--没有免费次数
		if InteractTimes[idxitem] < config[9] then	--还有额外次数
			local item  = config[2]		--替代道具
			if item ~= 0 then
				if Actor.getItemCount(sysarg, item) > 0 then	--是否拥有道具
					if Actor.removeItem(sysarg, item, 1) < 1 then	--扣除一个道具
						return false
					end
					InteractTimes[idxitem] = InteractTimes[idxitem] + 1		--额外次数加一
					local exttime = config[9] - InteractTimes[idxitem]
					if exttime > 0 then
						Actor.sendTipmsg(sysarg, string.format(Lang.Activity.aa0010, exttime), ttFlyTip)
					else
						Actor.sendTipmsg(sysarg, Lang.Activity.aa0005, ttFlyTip)
					end
				else
					Actor.sendTipmsg(sysarg, Lang.Activity.aa0008, ttFlyTip)
					return
				end
			end
		else	--没有额外次数
			Actor.sendTipmsg(sysarg, Lang.Activity.aa0005, ttFlyTip)
			return
		end
	end 
	
	local tbData = {{type = index, count = InteractTimes[index]}}
	SendInteractData(sysarg, tbData)
	
	--己方奖励
	if config[5] then
		Awards.Give(sysarg, config[5], 205, Lang.LogTips.l00087)
	end
	Actor.sendTipmsg(sysarg, string.format(Lang.Activity.aa0006, name), ttFlyTip)
	--对方奖励
	if config[6] then
		Awards.Give(ActorPtr, config[6], 205, Lang.LogTips.l00087)
	end
	Actor.sendTipmsg(ActorPtr, string.format(Lang.Activity.aa0007, Actor.getName(sysarg)), ttFlyTip)
	
	InteractSay(sysarg, config[7], ActorPtr, config[8])
	broadcaseToScene(Actor.getSceneId(sysarg), string.format(Lang.Activity.aa0009, Actor.getName(sysarg), name))
end


--全场景广播
function broadcaseToScene(sceneID, Msg)
	local hScene = Fuben.getSceneHandleById(sceneID, 0)
	Fuben.sendMsgToScene(hScene, Msg, ttChatWindow)
end