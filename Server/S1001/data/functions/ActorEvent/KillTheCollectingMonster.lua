--#include "data\config\activity\CollectingMonsterAward.lua" once
--#include "data\functions\Activity\Common\Awards.lua" once
function OnKillTheCollection(sysarg, index,sceneId,handle)
	if index <= 0 then return end -- 没有奖励
	if Actor.getEntity(handle) == nil then return end

	local cfg = CollectingMonsterCfg[index]
	if cfg == nil then return end
	
	if cfg.monsterid == 1184 then -- 皇宫大乱斗活动 钻石宝箱 (收费箱子)
		if Actor.getMoneyCount(sysarg, mtYuanbao) < 500 then
			Actor.sendTipmsg(sysarg, "元宝不足500，挖取失败！", ttFlyTip)
			return
		end
	end

	local GiftConfig = cfg.reward
	local randomNmber = math.random(1,#GiftConfig)
	
	local Gift=GiftConfig[randomNmber]--基本掉落
	local Gift2=nil --几率掉落
	local Gift3=nil --几率掉落
	local Gifts={}
	local Gifts2={}

	local str=""
	table.insert(Gifts, Gift)
	
	local GiftConfig2 = cfg.reward2
	local randomNmber2 = cfg.propability2
	if GiftConfig2~= nil then 
		if randomNmber2~=nil then
			randomNmber2 = math.random(1,randomNmber2)
			--print("randomNmber2"..randomNmber2)
			if randomNmber2 ==1 then 
				Gift2=GiftConfig2[math.random(1,#GiftConfig2)]
				table.insert(Gifts2, Gift2)
			end
		end
	end
	
	local GiftConfig3 = cfg.reward3
	local randomNmber3 = cfg.propability3
	if GiftConfig3~= nil then 
		if randomNmber3~=nil then
			randomNmber3 = math.random(1,randomNmber3)
			--print("randomNmber3"..randomNmber3)
			if randomNmber3 ==1 then 
				Gift3=GiftConfig3[math.random(1,#GiftConfig3)]
				table.insert(Gifts2, Gift3)
			end
		end
	end	
	
	for i,v in ipairs(Gifts) do 
		v.count = math.random(v.min,v.max)
		
		if v.type == 0 then
			str = str .. Item.getItemName(v.id) .. " x" .. v.count
		else
			str = str .. StringFromAwardType(v.type) .. " x" .. v.count
		end
	end
	
	if cfg.monsterid == 1184 then -- 皇宫大乱斗活动 钻石宝箱 (收费箱子)
		local checkAward={}
		
		for i,v in ipairs(Gifts) do 
			table.insert(checkAward, v)
		end
		
		if Gift2~=nil then 
			table.insert(checkAward, Gift2)
		end
		
		if Gift3~=nil then 
			table.insert(checkAward, Gift3)
		end
		
		if Awards.CheckBagGridCount(sysarg, checkAward) ~= true then
			return -- 背包空间不足
		end
		
		if Actor.changeMoney(sysarg, mtYuanbao, -500, LogIds.PalaceFightingOpenBox, "钻石宝箱") == false then
			return
		end
	end

	local str2=""
	Awards.Give(sysarg, Gifts,2618,cfg.name)
	if Awards.Give(sysarg, Gifts2,2618,cfg.name)== true then 
		if Gift2~=nil then 
			str2=str2..Item.getItemLinkMsg(Gift2.id)
		elseif  Gift3~=nil then 	
			str2=str2..Item.getItemLinkMsg(Gift3.id)
		end
	end
	local mapName = Fuben.getSceneNameById(sceneId)
	local mapname,mapx,mapy = Actor.getSceneName(sysarg);
	System.broadcastTipmsg(string.format("恭喜<(n%s)>玩家,在<(c0xFF00FF00)%s(%s,%s)>,开启<(c0xFF00FF00)%s>获得了<(c0xFF00FF00)%s> %s.",Actor.getName(sysarg),mapname,mapx,mapy, cfg.name,str,str2),ttChatWindow)
	Actor.sendTipmsg(sysarg,string.format("恭喜您,在<(c0xFF00FF00)%s(%s,%s)>,开启<(c0xFF00FF00)%s>获得了<(c0xFF00FF00)%s> %s.",mapname,mapx,mapy, cfg.name,str,str2),ttFlyTip)
	--Actor.sendTipmsg(sysarg,"恭喜您，开启宝箱获得 "..str, ttFlyTip) 
end
