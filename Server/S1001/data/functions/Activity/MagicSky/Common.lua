
--#include "data\functions\GlobalDefine.lua" once 
--#include "AutoRun.lua" once --时间执行
--#include "data\config\activityconfig\MagicSky\FloorConfig.lua" once	--每个楼层配置


--判断常规条件
function CheckCondition(sysarg, tCondition)
	local config = tCondition
	
	local condCount = 0
	
	local condsNum = table.getn(config.Condition)
	for i=1, condsNum do
		local cond = config.Condition[i]
		if cond[1] >= 0 or cond[1] < PROP_MAX_ACTOR then
			if (cond[1] == PROP_CREATURE_LEVEL) then
				if Actor.checkActorLevel(sysarg, cond[2], 0) == true then
					condCount = condCount + 1
				end
			else
				local value = Actor.getIntProperty(sysarg, cond[1])
				if value >= cond[2] then
					condCount = condCount + 1
				end
			end
		else
			System.trace(string.format("Error:Error Check Condition Error! id = %d", index))
		end
	end
	
	local mustCount = config.MustCount
	if mustCount > condsNum then
		mustCount = condsNum
	end
	
	if condCount < mustCount then
		Actor.sendTipmsg(sysarg, config.CannotTips, ttFlyTip)
		return false
	end
	
	return true
end

--获取楼层配置
function GetFloorConfigIndex(floorConfig, sceneId)
	for k, v in pairs(floorConfig) do
		if v.sid == sceneId then
			return k
		end
	end
	System.trace("Error:Can't find floor config!")
	return 0
end

--判断活动条件状态
function CheckActivityCondition(sysarg)
	local config = FloorConfig
	if CheckCondition(sysarg, config[1].conds) ~= true then return false end
	
	local dval = System.getDyanmicVar()
	if dval.MagicSkyStart ~= 1 then
		Actor.sendTipmsg(sysarg, Lang.Activity.a00033, ttFlyTip)
		return false
	end
	return true
end

function CheckGetAward(sysarg, index)
	local pRank = Ranking.getRanking(MsRankPt.RankName)
	if not pRank then return true end
	local userId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
	local pItem = Ranking.getItemPtrFromId(pRank, userId)
	if pItem then 
		local bFlag = Ranking.getSub(pItem, index)
		if bFlag ~= "-" then
			return true
		end
	else
		pItem = Ranking.addItem(pRank, userId, 0)
	end
	return false
end

--消耗返还
function TransMsReturn(sysarg, consumes, randNum, lossTips)
	local newConsumes = {}
	local randNum = tonumber(randNum)
	local result = false
	for k, v in pairs(consumes) do
		if v.rate and randNum >= v.rate[1] and randNum <= v.rate[2] then
			local rcount = math.floor(v.count*v.percent)
			local consume = {type = v.type, id = v.id, count = math.abs(v.count-rcount)}
			local tips = ""
			if consume.type ~= 0 then
				local name = Award_cn[consume.type] or ""
				if name ~= "" then
					tips = string.format(Lang.Activity.a00056, rcount, name)
				end
			elseif(consume.id > 0) then
				local name = Item.getItemLinkMsg(consume.id)
				tips = string.format(Lang.Activity.a00056, name, consume.count)
			end
			tips = lossTips..tips
			Actor.sendTipmsg(sysarg, tips, ttFlyTip)	
			table.insert(newConsumes, consume)
			result = true
		else
			table.insert(newConsumes, v)
		end
	end
	return newConsumes, result
end

-- 直接跳到targetIdx层
function GoToTargetFloor(sysarg, targetIdx)
	targetIdx = tonumber(targetIdx);
	local next = FloorConfig[targetIdx];
	if not next then
		System.trace("Can't find next floor config!")
		return
	end
	
	if Actor.enterScene(sysarg, next.sid, unpack(next.range)) == true then
		--Actor.changeActivityProgress(sysarg, targetIdx, -2)
		Actor.sendTipmsg(sysarg, Lang.Activity.a00056f2, ttFlyTip);
		GetFloorAward(sysarg); -- 领取奖励
		UpdateMSBoard();
	end
	Actor.closeNPCDialog(sysarg) 	
end
		
-- 轮盘部分 - 开始
function ShowRouletteOp(sysarg)
	-- 发个协议给客户端
	local npack = DataPack.allocPacket(sysarg,139,77)  --申请一个数据包
	if (npack == nil) then
		--print("npack:nil")
		return
	end
	DataPack.writeByte(npack, #RouletteCfg.InnerRing); -- 内层个数
	for _, v in pairs(RouletteCfg.InnerRing or {})do 
		DataPack.writeByte(npack, v); -- 内层数据	
	end ;
	DataPack.writeByte(npack, #RouletteCfg.OutterRing); -- 外层个数
	for _, v in pairs(RouletteCfg.OutterRing or {})do 
		DataPack.writeByte(npack, v); -- 外层数据	
		--print(v);
	end ;

	DataPack.flush(npack);
end

--询问是否离开地图
function AskExitMsMap(sysarg)
	local sAskMsg = Lang.Activity.a00040
	local NPChandle = Actor.getHandle(thisNPC)
	Actor.messageBox(sysarg,NPChandle,0,sAskMsg,Lang.ScriptTips.mt00004.."/ExitMsMap",Lang.ScriptTips.mt00005.."/OnCancleBtn",nil)
end
