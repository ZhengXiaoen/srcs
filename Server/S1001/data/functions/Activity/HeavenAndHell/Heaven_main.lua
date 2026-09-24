--九天冰宫 土城：冰宫使者
--#include "data\config\activityconfig\HeavenAndHell\Heaven.lua" once	--
--#include "data\functions\Activity\Common\Awards.lua" once

HeavenNotify = 
{
	Lang.Activity.t00213,
	Lang.Activity.t00214,
	Lang.Activity.t00215,
}

--[[
SuitNotice =
{
	"\\<(c0xFF00FF00)需要神韵：天枢神韵、天璇神韵、天玑神韵、天权神韵、玉衡神韵、开阳神韵、摇光神韵>",
	"\\<(c0xFF00FF00)需要神韵：闪灵神韵、血灵神韵、剑灵神韵、魔灵神韵、变灵神韵、动灵神韵>",
	"\\<(c0xFF00FF00)需要神韵：东方持国天王神韵、南方增长天王神韵、西方广目天王神韵、北方多闻天王神韵>",
}
--]]

SuitNeed =
{
	Lang.Activity.t00225,
	Lang.Activity.t00226,
	Lang.Activity.t00227,
}


--[[
    函数名称：传送
    函数描述：NPC交互入口
    参数 sysarg 的描述：
]]
function Heaven_Main(sysarg)	
	
	
	local config = HeavenConfig
	if (not config) then return "" end
	local str = ""
	local floors = config.Floors
	local findex = GetFloorIndex(sysarg, floors)
	if findex == 0 then
		str = str.."\\<#BL"..Lang.Activity.t00200.."/@EnterHeaven, 1, 0>"  --<进入九天冰宫>
		str = str.."\\<#BL"..Lang.Activity.t00220.."/@SuitExchange>"  --<套装兑换>
		str = str.."\\<#BL"..Lang.Activity.a00031.."/@AboutHeaven>"  --<详情>
	elseif (Actor.hasBuff(sysarg, config.buff.buffType, config.buff.groupId) == true) then
		if floors[findex-1] then
			local sName = Fuben.getSceneNameById(floors[findex-1].sid)
			str = str.."\\<#BL"..string.format(Lang.Activity.t00201, sName).."/@TelportHeaven, "..(findex-1)..">"  --<进入九天冰宫>
		end
		if floors[findex+1] then
			local sName = Fuben.getSceneNameById(floors[findex+1].sid)
			str = str.."\\<#BL"..string.format(Lang.Activity.t00201, sName).."/@EnterHeaven, "..(findex+1)..","..findex..">"  --<进入九天冰宫>
		end
		str = str.."\\<#BL"..Lang.Activity.t00202.."/@AskExitHeavenMap>"  --<回到土城>
	else
		str = str.."\\<#BL"..Lang.Activity.t00202.."/@AskExitHeavenMap>"  --<回到土城>
	end
	
	
	str = str.."\\<#BL"..Lang.Activity.a00032.."/@exit>"  --<离开>
	return str
end

--获取当前楼层索引
function GetFloorIndex(sysarg, floors)
	local sid = Actor.getSceneId(sysarg)
	for k, v in ipairs(floors) do
		if sid == v.sid then
			return k
		end
	end
	return 0
end


--直接传送 不检测
function TelportHeaven(sysarg, findex)
	local findex = tonumber(findex)
	local config = HeavenConfig
	local floor = config.Floors[findex]
	if not floor then return end
	if Actor.enterScene(sysarg, floor.sid, floor.x, floor.y, 3, 3) == true then
		local buff = config.buff
		local sceneName = Fuben.getSceneNameById(floor.sid)
		local mapTime = Actor.getBuffRemainTime(sysarg, buff.buffType, buff.groupId)
		Actor.initActivityWind(sysarg, sceneName, mapTime, HeavenNotify[findex])
	end
end


--进入九天冰宫
function EnterHeaven(sysarg, findex, nowFloor)
	local findex = tonumber(findex)
	local nowFloor = tonumber(nowFloor)
	local config = HeavenConfig
	if not config then return end
	
	local floor = config.Floors[findex]
	if not floor then return end
	
	local sceneName = Fuben.getSceneNameById(floor.sid)
	
	
	local bp = Actor.getIntProperty(sysarg, PROP_ACTOR_BATTLE_POWER)
	if floor.bp and bp < floor.bp then
		Actor.sendTipmsg(sysarg, string.format(Lang.Activity.t00204,sceneName,floor.bp), ttFlyTip)
		return
	end
	local svar = Actor.getStaticVar(sysarg)
	local buff = config.buff
	if svar.days.heavenFlag and Actor.hasBuff(sysarg, buff.buffType, buff.groupId) ~= true then
		Actor.sendTipmsg(sysarg, Lang.Activity.t00205, ttFlyTip)
		return 
	end
	
	local teamList = LuaHelp.getTeamMemberList(sysarg)
	if teamList then
		for k, v in ipairs(teamList) do
			if v ~= sysarg then
				if floor.bp then
					local bp = Actor.getIntProperty(v, PROP_ACTOR_BATTLE_POWER)
					if bp < floor.bp then
						Actor.sendTipmsg(sysarg, string.format(Lang.Activity.t00206,Actor.getName(v),sceneName,floor.bp), ttFlyTip)
						return
					end
					
					local svar = Actor.getStaticVar(v)
					local heavenFlag = svar.days.heavenFlag
					if heavenFlag and Actor.hasBuff(v, buff.buffType, buff.groupId) ~= true then
						Actor.sendTipmsg(sysarg, string.format(Lang.Activity.t00207,Actor.getName(v)), ttFlyTip)
						return 
					end
					if Actor.isDeath(v) then
						Actor.sendTipmsg(sysarg, string.format(Lang.Activity.t00224,Actor.getName(v)), ttFlyTip)
						return 
					end
				end
			end
		end
	end
	
	if floor.item then
		local itemCount = Actor.getItemCount(sysarg, floor.item.id, 0, 0, -1)
		if itemCount < floor.item.count then
			local itemName = Item.getItemName(floor.item.id)
			--Actor.sendTipmsg(sysarg, string.format(Lang.Activity.t00203,floor.item.count,itemName,sceneName), ttFlyTip)
			local npcHandle = Actor.getHandle(thisNPC)
			local sAskMsg = string.format(Lang.Activity.t00228, itemName, floor.item.count)
			Actor.messageBox(sysarg,npcHandle,0,sAskMsg,Lang.ScriptTips.x00078.."/BuyMustItem,"..floor.item.id,Lang.ScriptTips.mt00005.."/Cancel",nil)
			return
		end
	end
	
	--消耗
	if floor.item and Actor.removeItem(sysarg, floor.item.id, floor.item.count) < floor.item.count then
		return
	end
	
	local masterScene, masterX, masterY = Actor.getSceneName(sysarg, 0, 0)
	
	EnterFloor(sysarg, floor, buff, sceneName, findex)
	
	local username = Actor.getName(sysarg)
	local itemName = ""
	if floor.item then
		itemName = Item.getItemName(floor.item.id)
	end
	
	if teamList then
		for k, v in ipairs(teamList) do
			if v ~= sysarg then
				local memberScene, memberX, memberY = Actor.getSceneName(v, 0, 0)
				if (masterScene == memberScene) and (math.abs(masterX - memberX) <= config.teleportRange) and (math.abs(masterY - memberY) <= config.teleportRange) then
					EnterFloor(v, floor, buff, sceneName, findex)
				end
			end
		end
		
		if nowFloor == 0 and itemName ~= "" then
			System.broadcastTipmsg(string.format(Lang.Activity.t00208, username,itemName,sceneName), ttScreenCenter)
		end
	else
		if nowFloor == 0 and itemName ~= "" then
			System.broadcastTipmsg(string.format(Lang.Activity.t00209, username,itemName,sceneName), ttScreenCenter)
		end
	end
end

function EnterFloor(sysarg, floor, buff, sceneName, findex)
	if Actor.enterScene(sysarg, floor.sid, floor.x, floor.y, 3, 3) == true then
		local svar = Actor.getStaticVar(sysarg)
		local heavenFlag = svar.days.heavenFlag
		if not heavenFlag then
			svar.days.heavenFlag = 1
			Actor.addBuff( sysarg, buff.buffType, buff.groupId, buff.value, buff.times, buff.interval, buff.buffName, buff.timeOverlay)
		end
		local mapTime = Actor.getBuffRemainTime(sysarg, buff.buffType, buff.groupId)
		Actor.initActivityWind(sysarg, sceneName, mapTime, HeavenNotify[findex])
	end
end

function BuyMustItem(sysarg, itemId)
	Actor.openDialogs(sysarg,diBuyAnItem,tostring(itemId))
end


--详情
function AboutHeaven(sysarg)
	local str = ""
	str = str..Lang.Activity.t00210
	str = str.."\\<#BL"..Lang.Activity.a00101.."/@main>"  --<返回>
	return str
end


--询问是否离开地图
function AskExitHeavenMap(sysarg)
	local sAskMsg = Lang.Activity.t00211
	local NPChandle = Actor.getHandle(thisNPC)
	Actor.messageBox(sysarg,NPChandle,0,sAskMsg,Lang.ScriptTips.mt00004.."/ExitHeavenMap",Lang.ScriptTips.mt00005.."/Cancel",nil)
end

--离开场景
function ExitHeavenMap(sysarg)
	--直接把玩家传出来
	--local Pos = LuaHelp.getReloadMapPos(sysarg) 
	local retScene = HeavenConfig.returnArea
	if Actor.enterScene(sysarg, retScene.sid, retScene.x, retScene.y, 2, 2) == true then
		Actor.closeActivityWind(sysarg)
	end
	Actor.closeNPCDialog(sysarg) 
end

function Cancel(sysarg)

end

--创建钥匙怪
function CreateHeavenKeyBoss()
	local config = HeavenConfig.keyBoss
	if not config then return end
	
	local hScene = Fuben.getSceneHandleById(config.sid, 0)
	local pMonster = Fuben.createMonster(hScene, config.mid, config.x, config.y, config.liveTime)
	if pMonster then
		local scene = Fuben.getSceneNameById(config.sid)
		System.broadcastTipmsg(string.format(Lang.Activity.t00212, Actor.getName(pMonster),scene,scene,config.x,config.y,config.x,config.y), ttScreenCenter+ttChatWindow)
	end
	
end


function SuitExchange(sysarg)
	local config = HeavenConfig
	if not config.suitExchange then return end
	local str = Lang.Activity.t00221
	for k, v in ipairs(config.suitExchange) do
		str = str.."\\<#BL"..v.title.."/@SelectSuitExchange,"..k..">"  --<套装兑换>
	end
	
	str = str.."\\<#BL"..Lang.Activity.a00101.."/@main>"  --<返回>
	return str
end

function SelectSuitExchange(sysarg, type)
	local type = tonumber(type)
	local suits = HeavenConfig.suitExchange[type]
	if not suits then return end
	--local str = "<(idecoLine#260)>\\\\"
	local str = Lang.Activity.t00222
	--[[
	if SuitNotice[type] then
		str = str..SuitNotice[type]
	end
	--]]
	for k, v in ipairs(suits.awards) do
		local desc = Item.getAwardDesc(v.type, v.id)
		str = str.." <#BL"..desc.."/@OnSuitExchange,"..type..","..k..">"  --<套装兑换>
		--[[
		str = str.." <#B"..desc.."/@OnSuitExchange,"..type..","..k..">"  --<套装兑换>
		if k % 3 == 0 then
			str = str.."\\\\"
		else
			str = str..getStrBackNopStr(desc, 18)
		end
		--]]
	end
	
	str = str.."\\<#BL"..Lang.Activity.a00101.."/@SuitExchange>"  --<返回>
	return str
end

function OnSuitExchange(sysarg, type, idx)
	local type = tonumber(type)
	local idx = tonumber(idx)
	local suits = HeavenConfig.suitExchange[type]
	if not suits then return end
	
	local award = suits.awards[idx]
	if not award then return end
	
	local awards = {award}
	
	if Awards.CheckBagGridCount(sysarg, awards) ~= true then
		return
	end
	
	for k, v in ipairs(suits.consumes) do
		if Actor.getItemCount(sysarg, v) < 1 then
			local tips = ""
			if SuitNeed[type] then
				tips = SuitNeed[type]
			else
				local itemName = Item.getItemName(v)
				tips = string.format(Lang.Activity.t00223, itemName)
			end
			Actor.sendTipmsg(sysarg, tips, ttFlyTip)
			return
		end
	end
	
	for k, v in ipairs(suits.consumes) do
		if Actor.removeItem(sysarg, v, 1) < 1 then
			System.trace(string.format("Error: removeItem Error , itemid=%d, userid=%d", v, Actor.getIntProperty(sysarg, PROP_ENTITY_ID)))
			return
		end
	end
	
	Awards.Give(sysarg, awards, 1, Lang.LogTips.l00108)
	
end

function getStrBackNopStr(Str, nLen)
	local i
	local nopstr = ""
	
	for i = 1, nLen - string.len(Str) do
		if i % 3 == 0 then
			nopstr = nopstr .. "  "
		end
	end

	return nopstr
end


table.insert(MainFnTable, Heaven_Main)