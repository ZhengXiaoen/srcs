--#include "data\functions\Systems\ActivitySystem\wlzbPaoDianHandle.lua" once
npcId = 226
NpcDialog[npcId] = {}
--t = NpcDialog[npcId]

NpcDialog[npcId].main = function(sysarg)
local strRewardicon = string.format("<(%s)> <(%s)>","iaward#26#1", "iaward#3#1" )
	local str = [[

  <(c0xFF00c0ff)活动规则:>
    <(c0x88888888)1、活动开启后,玩家可以进入活动地图进行 PK,活动开启10分钟后则无法进入>
    <(c0x88888888)2、活动地图中死亡会掉落物品,不增加PK值,无法原地复活>
    <(c0x88888888)3、活动地图中不能使用传送类,召唤类道具>
    <(c0x88888888)4、活动开启10分钟后,当地图中只剩下1人,则可以申请成为武林盟主>

  <(c0xFF00c0ff)最终奖励:>
    ]]..strRewardicon..[[

]]
	--local str = ""
	--str = str..Lang.Activity.a00061
	str = str.."<#BN"..Lang.Activity.a00062.."/@OnBeTheChief>"
	return str
end

NpcDialog[npcId].OnBeTheChief = function ( sysarg )
	get_wlzb_award(sysarg)
end



--t.OnBeTheChief = function ( sysarg )
--	local str = ""
--
--	local svar = System.getDyanmicVar()
--	--if svar.WuLinZhengBaStartFlag == nil then		
--		--svar.WuLinZhengBaStartFlag = 0
--	--end
--
--	--if svar.WuLinZhengBaStartFlag == 0 then			
--		--str = Lang.Activity.w00004
--		--Actor.sendTipmsg(sysarg, Lang.Activity.w00004, ttFlyTip)
--		--return
--	--end
--	
--	if svar.WuLinEnterFlag == nil then
--		svar.WuLinEnterFlag = 0
--	end
--
--	if svar.WuLinEnterFlag == 0 then
--		Actor.sendTipmsg(sysarg, Lang.Activity.w00008, ttFlyTip)
--		return
--	end
--
--	local playerList = LuaHelp.getSceneAliveActorListById(StdActivityCfg.WuLinZhengBa.lowSceenId)	
--	if playerList ~= nil then
--		if table.getn(playerList) == 1 then
--			for j = 1, #playerList do
--				local player = playerList[j]
--				if player then
--					local nActorId = Actor.getIntProperty(player,PROP_ENTITY_ID)
--					local nName = Actor.getName(player)
--					
--					local nPrimId = GetWLMZId()
--					if nPrimId and nPrimId > 0 then
--						if nPrimId == nActorId then
--							Actor.sendTipmsg(player, Lang.Activity.w00025, ttFlyTip)
--						else
--							Actor.sendTipmsg(player, Lang.Activity.w00114, ttFlyTip)
--						end
--						return
--					end
--					if Awards.CheckBagGridCount(player,StdActivityCfg.WuLinZhengBa.awardsMaster) == false then
--						return
--					end
--					Actor.setSocialMask(player,smIsWulinMaster,true)
--					BeWuLinChief(player,1,nActorId,nName)
--					break
--				end
--			end
--		elseif table.getn(playerList) > 1 then
--			--str = Lang.Activity.w00024
--			Actor.sendTipmsg(sysarg, Lang.Activity.w00024, ttFlyTip)
--			return
--		end
--	end
--end
--
--
--t.OnLeftActivity = function(sysarg)
--	local str = ""
--	
--	str = Lang.Activity.w00009
--
--	str = str.."\\<"..Lang.Activity.w00010.."/@OnClickOk>"
--	str = str.."\\<"..Lang.Activity.w00011.."/@OnClickCancle>"
--
--	return str
--end
--
--
--t.OnClickOk = function(sysarg)
--
--	local var = Actor.getStaticVar(sysarg)
--	if var.days.WuLinZhengBaSignUpFlag then 
--		var.days.WuLinZhengBaSignUpFlag = 2
--	end
--
--	local nPosX = System.getRandomNumber(StdActivityCfg.WuLinZhengBa.outMapX[2]-StdActivityCfg.WuLinZhengBa.outMapX[1])
--	nPosX = nPosX + StdActivityCfg.WuLinZhengBa.outMapX[1]
--
--	local nPosY = System.getRandomNumber(StdActivityCfg.WuLinZhengBa.outMapY[2]-StdActivityCfg.WuLinZhengBa.outMapY[1])
--	nPosY = nPosY + StdActivityCfg.WuLinZhengBa.outMapY[1]
--
--	local bResult = Actor.enterScene(sysarg,StdActivityCfg.WuLinZhengBa.outSceenId,nPosX,nPosY)
--	if bResult then
--		OnAddPet(sysarg)
--	end
--end
--
--
--t.OnClickCancle = function(sysarg)
--	Actor.closeNPCDialog(sysarg)
--end
--