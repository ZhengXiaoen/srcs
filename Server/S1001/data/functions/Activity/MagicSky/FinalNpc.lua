--最后层的NPC

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
	if index == 0 or (index ~= #FloorConfig) then return "" end
	local floor = FloorConfig[index] ; -- 当前层的配置
	
	local str = ""
	
	---[[
	if (floor.FinalAward and table.getn(floor.FinalAward) > 0) then
		str = str.."\\<#BL"..Lang.Activity.a00056f14.."/@GetFinalAward>"  --<领取最终奖励>
	end--]]
	str = str.."\\<#BL"..Lang.Activity.a00056f3.."/@ShowRouletteOp>"  -- 轮盘的
	-- 传送到其他层
	str = str.."\\<#BL"..Lang.Activity.a00056f7.."/@ShowGoToOtherFloorMenu>"  
	-- 闯关排名
	str = str.."\\<#BL"..Lang.Activity.a00056f10.."/@ShowMSRanking>"  
	
	str = str.."\\<#BL"..Lang.Activity.a00039.."/@AskExitMsMap>"  --<离开活动>
	--str = str.."\\<#BL".. "Test888888888" .."/@Test>"  --<测试>
	return str
end

ThisNpc.ShowRouletteOp 	= ShowRouletteOp; 	-- 在 Common.lua
ThisNpc.AskExitMsMap 	= AskExitMsMap;		-- 在 Common.lua
ThisNpc.GoToTargetFloor = GoToTargetFloor; 	-- 在 Common.lua

function ThisNpc.ShowGoToOtherFloorMenu(sysarg)
	local str = ""
	str = Lang.Activity.a00056f9;
	for i = 1, #FloorConfig - 1 do
		str = string.format("%s\\<#BL%s/@GoToTargetFloor,%d>", str, Lang.Activity["a00056f8"..i], i);
	end
	str = str .. Lang.ScriptTips.back001; 
	return str;
end

function ThisNpc.ShowMSRanking(sysarg)
	local str = ""
	str = Lang.Activity.a00056f9;
	local pRank = Ranking.getRanking(MsFinalAwardRankPt.RankName);
	if not pRank then return "" end
	local count = Ranking.getRankItemCount(pRank);
	for i = 0, count-1 do
		local pRankItem = Ranking.getItemFromIndex(pRank, i);
		local id = Ranking.getId(pRankItem);
		str = str .. "\\"..Lang.Activity["a00056f11".. i+1] ..":".. Ranking.getSub(pRankItem,0);
	end
	
	str = str .. Lang.ScriptTips.back001; 
	return str;
end

--领取最终奖励
function ThisNpc.GetFinalAward(sysarg)
	if CheckActivityCondition(sysarg) ~= true then return end
	local sceneId = Actor.getSceneId(sysarg)
	local index = GetFloorConfigIndex(FloorConfig, sceneId)
	if index == 0 then return end
	local config = FloorConfig[index]
	
	if (not config.FinalAward or table.getn(config.FinalAward) == 0)
	then return end -- 没有奖励配置

	local pRank = Ranking.getRanking(MsFinalAwardRankPt.RankName)
	if not pRank then return  end
	local userId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
	local pItem = Ranking.getItemPtrFromId(pRank, userId)
	if pItem then 
		-- 已经领过啦
		Actor.sendTipmsg(sysarg, Lang.Activity.a00056f12, ttFlyTip);
		return;
	end	
	
	--背包判断
	local bHasEnough, needCount = Awards.CheckBagGridCount(sysarg, config.floorAward);
	if not bHasEnough then return end;
	
	--最终奖励
	local count = Ranking.getRankItemCount(pRank) + 1;
	local nRank = count;
	for k, v in pairs(config.FinalAward) do
		if nRank >= v.rankInterval[1] and nRank <= v.rankInterval[2] then
			Awards.Give(sysarg, v.awards, 100, Lang.LogTips.ml00004);
			for i = 0, count do
				local pRankItem = Ranking.getItemFromIndex(i);
				local nPoint = Ranking.getPoint(pRankItem);
				local nId = Ranking.getId(pRankItem);
				Ranking.updateItem(pRank, nId, nPoint+1 );
			end
			pItem = Ranking.addItem(pRank, userId, 0);
			--设置领取标志
			local name = Actor.getName(sysarg); --print("player name="..name);
			Ranking.setSub(pItem, 0, name); -- 保存玩家名字
			return;
		end
	end
end