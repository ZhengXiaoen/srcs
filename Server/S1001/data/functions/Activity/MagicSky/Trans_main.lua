--[[File:Trans_main.lua]]
--魔幻星宫：星宫使者

--#include "Common.lua" once --通用
--#include "RankPointer.lua" once	--排行榜指针
--#include "data\functions\Activity\Common\Consumes.lua" once --活动通用 消耗
--#include "data\functions\Activity\Common\Awards.lua" once --活动通用 奖励
--#include "data\functions\Activity\Common\Scene.lua" once --活动通用 场景


local ThisNpc = NpcDialog[npcId] -- 别名

--[[
    函数名称：传送
    函数描述：NPC交互入口
    参数 sysarg 的描述：
]]
function ThisNpc.main(sysarg)	
	if (not FloorConfig) then return "" end
	if (not MsRankPt) then return "" end
	local sceneId = Actor.getSceneId(sysarg)
	local index = GetFloorConfigIndex(FloorConfig, sceneId)
	if index == 0 then return "" end
	local floor = FloorConfig[index] ; -- 当前层的配置
	
	local str = ""
	str = str.."\\<#BL"..Lang.Activity.a00056f3.."/@ShowRouletteOp>"  --
	if floor.randConsumes and table.getn(floor.randConsumes) > 0 then
		str = str.."\\<#BL"..Lang.Activity.a00035.."/@TransMs>"  --<随机传送>
	end
	if floor.upConsumes and table.getn(floor.upConsumes) > 0 then
		str = str.."\\<#BL"..string.format(Lang.Activity.a00036, floor.upConsumes[1].count).."/@AskUpTrans,1,"..floor.upConsumes[1].count..">"  --<向上传送一层（需消耗XX元宝）>
	end
	if floor.upConsumes1 and table.getn(floor.upConsumes1) > 0 then
		str = str.."\\<#BL"..string.format(Lang.Activity.a000361, floor.upConsumes1[1].count).."/@AskUpTrans,2,"..floor.upConsumes1[1].count..">"  --<向上传送一层（需消耗XX金币）>
	end
	if floor.UpgradeByItem and table.getn(floor.UpgradeByItem) > 0 then
		str = str.."\\<#BL".. Lang.Activity.a00056f .."/@AskUpTransByItem>"  --<向上传送一层（使用道具）>
	end
	--[[if (floor.floorAward and table.getn(floor.floorAward) > 0) or (floor.rankAward and table.getn(floor.rankAward) > 0) then
		str = str.."\\<#BL"..Lang.Activity.a00037.."/@GetFloorAward>"  --<领取本层奖励>
	end--]]
	if (floor.oneCard and table.getn(floor.oneCard)) and (floor.allCard and table.getn(floor.allCard)) then
		str = str.."\\<#BL"..Lang.Activity.a00038.."/@Exchange>"  --<兑换>
	end
	
	str = str.."\\<#BL"..Lang.Activity.a00039.."/@AskExitMsMap>"  --<离开活动>

	return str
end

ThisNpc.ShowRouletteOp 	= ShowRouletteOp; 	-- 在 Commonlua
ThisNpc.AskExitMsMap 	= AskExitMsMap;		-- 在 Commonlua
		


-- 轮盘部分 - 结束


function GetCurFloor(sysarg)
	if (not FloorConfig) then return  end
	if (not MsRankPt) then return  end
	local sceneId = Actor.getSceneId(sysarg)
	local index = GetFloorConfigIndex(FloorConfig, sceneId)
	if index == 0 then return  end
	local floor = FloorConfig[index] ; -- 当前层的配置
	return index, floor;
end

function ThisNpc.AskUpTransByItem(sysarg)
	local index, floor = GetCurFloor(sysarg);
	if not floor then return end;
	
	local bDone = false;
	for _, v in pairs(floor.UpgradeByItem or {}) do
		if( Actor.getItemCount(sysarg,v.id,-1,-1) >= v.count) then
			local next = FloorConfig[index+1]
			if not next then
				System.trace("Can't find next floor config!")
				return
			end
			
			--if Consumes.CheckAndRemove(sysarg, config.upConsumes, 701, Lang.LogTips.ml00002) ~= true then return end
			Actor.removeItem(sysarg,itemid, v.count, -1,-1,-1,"AskUpTransByItem",5)      --删除一个物品
			
			if Actor.enterScene(sysarg, next.sid, unpack(next.range)) == true then
				Actor.changeActivityProgress(sysarg, index+1, -2)
				Actor.sendTipmsg(sysarg, Lang.Activity.a00056f2, ttFlyTip);
				GetFloorAward(sysarg); -- 领取奖励
			end
			Actor.closeNPCDialog(sysarg) 
			bDone = true;
			break;
		end
	end
	if not bDone then
		Actor.sendTipmsg(sysarg, Lang.Activity.a00056f1, ttFlyTip);
	end
end

--随机传送
function ThisNpc.TransMs(sysarg)
	if CheckActivityCondition(sysarg) ~= true then return end
	
	local sceneId = Actor.getSceneId(sysarg)
	local index = GetFloorConfigIndex(FloorConfig, sceneId)
	if index == 0 then return end
	local config = FloorConfig[index]
	--消耗检测
	if Consumes.Check(sysarg, config.randConsumes) ~= true then return end
	
	local randNum = math.random(100)
	
	--随机判断
	local fid = 0
	for k,v in pairs(config.trans) do
		if randNum >= v.rate[1] and randNum <= v.rate[2] then
			fid = v.fid
			break
		end
	end
	
	local lossTips = ""
	if fid == 0 or fid <= index then 
		lossTips = Lang.Activity.a00041
		--Actor.sendTipmsg(sysarg, Lang.Activity.a00041, ttFlyTip)
	end
	
	local newConsumes, result = TransMsReturn(sysarg, config.randConsumes, randNum, lossTips)
	if result == false then
		Actor.sendTipmsg(sysarg, lossTips, ttFlyTip)
	end
	
	if table.getn(newConsumes) ~= table.getn(config.randConsumes) then
		newConsumes = config.randConsumes
	end
	
	--消耗
	if Consumes.Remove(sysarg, newConsumes, 101, Lang.LogTips.ml00001) ~= true then return end
	
	if fid > 0 then
		local enter = FloorConfig[fid]
		if not enter then
			System.trace(string.format("Can't find trans fid config! fid = %d", fid))
			return 
		end
		if Actor.enterScene(sysarg, enter.sid, unpack(enter.range)) == true then
			Actor.changeActivityProgress(sysarg, fid, -2)
		end
	end
	Actor.closeNPCDialog(sysarg) 
end

--询问跳楼
--type 1 元宝，2金币
function ThisNpc.AskUpTrans(sysarg, type, needYb)
	type = tonumber(type);
	local NPChandle = Actor.getHandle(thisNPC)
	local sAskMsg = "";
	if type == 1 then sAskMsg = string.format(Lang.Activity.a00056e, needYb)
	elseif type == 2 then sAskMsg = string.format(Lang.Activity.a00056e1, needYb) end
	Actor.messageBox(sysarg,NPChandle,0,sAskMsg,Lang.ScriptTips.mt00004.."/UpTrans,"..type,Lang.ScriptTips.mt00005.."/Cancel",nil,0,0,nil,0,0,0,1)
end

--向上传送一层
function UpTrans(sysarg,type)
	if CheckActivityCondition(sysarg) ~= true then return end
	
	local sceneId = Actor.getSceneId(sysarg)
	local index = GetFloorConfigIndex(FloorConfig, sceneId)
	if index == 0 then return end
	local config = FloorConfig[index]
	
	--[[
	local next = FloorConfig[index+1]
	if not next then
		System.trace("Can't find next floor config!")
		return
	end--]]
	
	type = tonumber(type);
	if type == 1 then 
		if Consumes.CheckAndRemove(sysarg, config.upConsumes, 701, Lang.LogTips.ml00002) ~= true then return end
	elseif type == 2 then 
		if Consumes.CheckAndRemove(sysarg, config.upConsumes1, 701, Lang.LogTips.ml00002) ~= true then return end
	end
	GoToTargetFloor(sysarg, index+1);
	--GoToTargetFloor(sysarg, 12);
end

--领取本层奖励
function GetFloorAward(sysarg)
	if CheckActivityCondition(sysarg) ~= true then return end
	local sceneId = Actor.getSceneId(sysarg)
	local index = GetFloorConfigIndex(FloorConfig, sceneId)
	if index == 0 then return end
	local config = FloorConfig[index]
	
	if (not config.floorAward or table.getn(config.floorAward) == 0) and
	(not config.rankAward or table.getn(config.rankAward) == 0)
	then return end -- 没有奖励配置
	

	if CheckGetAward(sysarg, index) ~= false then
		Actor.sendTipmsg(sysarg, Lang.Activity.a00042, ttFlyTip)
		return
	end
	
	--背包判断
	local bHas1, needCount1 = true, 0
	if config.floorAward and table.getn(config.floorAward) > 0 then
		bHas1, needCount1 = Awards.CheckBagGridCount(sysarg, config.floorAward)
	end
	if config.rankAward and table.getn(config.rankAward) > 0 and bHas1 == true then
		local bHas2, needCount2 = Awards.CheckBagGridCount(sysarg, config.rankAward[1].awards)
		if bHas2 == true then
			local needCount = needCount1 + needCount2
			local hasCount = Item.getBagEmptyGridCount(sysarg)
			if hasCount < needCount then 
				Actor.sendTipmsg(sysarg, string.format(Lang.Activity.a00043, needCount), ttFlyTip)
				return
			end
		end
	end
	
	local pRank = Ranking.getRanking(MsRankPt.RankName)
	local userId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
	local pItem = Ranking.getItemPtrFromId(pRank, userId)
	
	--设置领取标志
	Ranking.setSub(pItem, index, 1)
	
	--楼层奖励
	if config.floorAward and table.getn(config.floorAward) > 0 then
		Awards.Give(sysarg, config.floorAward, 100, Lang.LogTips.ml00003)
	end
	
	local dval = System.getDyanmicVar()
	
	if not dval.MagicSkyRank then
		dval.MagicSkyRank = {}
		for i=1, table.getn(FloorConfig) do
			dval.MagicSkyRank[i] = 0
		end
	end
	dval.MagicSkyRank[index] = dval.MagicSkyRank[index] + 1
	
	local nRank = tonumber(dval.MagicSkyRank[index])
	
	--排行榜奖励
	if config.rankAward and table.getn(config.rankAward) > 0 then
		for k, v in pairs(config.rankAward) do
			if nRank >= v.rankInterval[1] and nRank <= v.rankInterval[2] then
				Awards.Give(sysarg, v.awards, 100, Lang.LogTips.ml00004)
				break
			end
		end
	end
	if nRank >= 1 and nRank <= 3 then
		System.broadcastTipmsg(string.format(Lang.Activity.a00044, Actor.getName(sysarg), index, nRank), ttScreenCenter+ttChatWindow)
	end
	
	-- 恭喜你成功达到第N层（3、6、9、12），神庙使者用魔力送给你大量的经验！
	Actor.sendTipmsg(sysarg, string.format(Lang.Activity.a00045, index), ttFlyTip);
	return 
end

--兑换
function ThisNpc.Exchange(sysarg)
	if CheckActivityCondition(sysarg) ~= true then return end
	local str = Lang.Activity.a00046
	str = str.."\\<#BL"..Lang.Activity.a00047.."/@OnExchange, 1>"  --<单张星座卡兑换>
	str = str.."\\<#BL"..Lang.Activity.a00048.."/@OnExchange, 2>"  --<星宫卡兑换星宫礼包>
	return str
end

--卡兑换 idx: 1单张星座卡兑换 2星宫卡兑换星宫礼包
function OnExchange(sysarg, idx)
	local idx = tonumber(idx)
	local subId = 0
	if CheckGetAward(sysarg, subId) ~= false then
		Actor.sendTipmsg(sysarg, Lang.Activity.a00049, ttFlyTip)
		return
	end
	
	local sceneId = Actor.getSceneId(sysarg)
	local index = GetFloorConfigIndex(FloorConfig, sceneId)
	if index == 0 then return end
	local config = FloorConfig[index]
	
	local consumes = {}
	local awards = {}
	local logStr, errTips = "", ""
	
	
	if idx == 1 then
		awards = config.oneCard.awards
		logStr = Lang.LogTips.ml00005
		errTips = Lang.Activity.a00050
		
		for k, v in pairs(config.oneCard.consumes) do
			local quality = v.quality or 0
			local strong = v.strong or 0
			local bind = v.bind or -1
			local param = v.param or 0
			local bCheck = Actor.checkConsume(sysarg, v.type, v.id, v.count, quality, strong, bind, param) 
			if bCheck == true then
				local consume = {type = v.type, id = v.id, count = v.count, quality = quality, strong = strong, bind = bind, param = param}
				table.insert(consumes, consume)
				break
			end
		end
		if table.getn(consumes) == 0 then 
			Actor.sendTipmsg(sysarg, errTips, ttFlyTip)
			return
		end
	else
		consumes = config.allCard.consumes
		awards = config.allCard.awards
		logStr = Lang.LogTips.ml00006
		errTips = Lang.Activity.a00051
	end
	
	if table.getn(consumes) == 0 or table.getn(awards) == 0 then return end
	
	if Awards.CheckBagGridCount(sysarg, awards) ~= true then return end
	
	if Consumes.Check(sysarg, consumes, errTips) ~= true then return end
	
	local pRank = Ranking.getRanking(MsRankPt.RankName)
	local userId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
	local pItem = Ranking.getItemPtrFromId(pRank, userId)
	
	--设置领取标志
	Ranking.setSub(pItem, subId, 1)

	Consumes.Remove(sysarg, consumes, 101, logStr)
	
	--楼层奖励
	Awards.Give(sysarg, awards, 100, logStr)
	
	return Lang.Activity.a00052
end


--离开场景
function ExitMsMap(sysarg)
	--直接把玩家传出来
	--local Pos = LuaHelp.getReloadMapPos(sysarg) 
	local retScene = FloorConfig[1].retScene
	if Actor.enterScene(sysarg, retScene.sid, unpack(retScene.range)) == true then
		Actor.closeActivityWind(sysarg)
	end
	Actor.closeNPCDialog(sysarg) 
end



