-- 角色升级的一些处理
--lua script

--#include "data\config\item\SkillBookItemData.lua" once
--#include "data\config\quest\MiscQuest.lua" once
--#include "data\config\quest\EntrustReward.lua" once
--#include "data\functions\Activity\OpenTenDaysActivity\LevelingMan.lua" once
--#include "data\functions\player.lua" once -- 角色处理

--玩家升级的时候灌满他宝物的灵力
function OnLevelUpFullGemValue(sysarg)
	local equipedGemPtr = Actor.getCurrEquipedGem(sysarg)
	if (equipedGemPtr == nil) then
		--print("equipedGemPtr == nil")
		return
	end
	--升级直接加到200
	Actor.giveAward(sysarg,18,0,200,0,0,1,0,663,"levelup")
end

--#include "data\config\hero\HeroConfig.lua" once
function HeroOpenTips(sysarg)
	local config = HeroConfig
	if not config then return end
	local circle = Actor.getIntProperty(sysarg, PROP_ACTOR_CIRCLE)
	local level = Actor.getIntProperty(sysarg, PROP_CREATURE_LEVEL)
	if System.hasHeroSystemOpen() == true and Hero.getHeroCount(sysarg) == 0 and circle == 0 and level >= config.level then
		local npcPos = config.npcPos
		--Actor.sendMoveToMsg(sysarg, npcPos.sceneName, npcPos.x, npcPos.y, string.format(Lang.ScriptTips.c000105, npcPos.sceneName, npcPos.npcName), Lang.ScriptTips.c000106)
		local npack = DataPack.allocPacket(sysarg, 44, 22)
	    if not npack then return end
	    DataPack.flush(npack)
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.c000107, npcPos.npcName, npcPos.sceneName, npcPos.npcName), ttChatWindow)
	end
end

function NewPlayerProtectBuff(sysarg, nowLevel)
	if (nowLevel >= 70 and Actor.hasBuff(sysarg, 93, -1)) then
		Actor.delBuff(sysarg, 93, -1)
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.pk00011, ttFlyTip)
	end
end



EventCallDispatcher.ActorLevelUpHandler = function (sysarg, arg)
	local oldLevel = arg[2]
	local myLevel = Actor.getIntProperty(sysarg, PROP_CREATURE_LEVEL)	
	local myJob = Actor.getIntProperty( sysarg, PROP_ACTOR_VOCATION )
	local vipType = Actor.getVipType(sysarg)
	for k, v in ipairs(SkillBoolConfig) do
		if v.jop_id == myJob then
			if vipType == enVIPSupremacy and v.vipActorLv and v.vipActorLv == myLevel then
				local curLevel = Actor.getSkillLevel(sysarg, v.skill_id)
				if curLevel == 0 then
					Actor.startLearnSkill(sysarg, v.skill_id, v.vip_level)
				elseif curLevel <= v.vip_level then
					Actor.setSkillProperty(sysarg, v.skill_id, 1, v.vip_level)
				end
			end
			if v.freeLearnLv then
				if Actor.getSkillLevel(sysarg, v.skill_id) > 0 then
					Actor.setFullAnger(sysarg)
				else
					if v.freeLearnLv == myLevel then
						Actor.startLearnSkill( sysarg, v.skill_id, v.skill_Level)
					end
				end
			end
		end
	end
	--SendCSExtInfoToClient(sysarg)
	OnLevelUpFullGemValue(sysarg)
	--需要通知前端打开登陆器了
	OnCheckDownloadLauncher(sysarg,myLevel)
	HeroOpenTips(sysarg)
	NewPlayerProtectBuff(sysarg, myLevel)
	
	--屏蔽世界文明等级 2015.8.4
	if myLevel >= WordCultureConfig.minStartLevel then
		OnSetCultureLevel(sysarg,myLevel)
	end
	
	-- 处理玩家等级提升
	OnPlayerLevelUp(sysarg, oldLevel)

	local myLevel = Actor.getIntProperty(sysarg, PROP_CREATURE_LEVEL)
	if myLevel == EntrustReward.BookQuestLevel then
        if System.isCrossServer() == false then 
            local netPack = DataPack.allocPacket(sysarg,6, 16)  --申请一个数据包
		    if netPack then
			    DataPack.writeWord(netPack, EntrustReward.BookQuestId)
			    DataPack.flush(netPack)
		    end
        end

	end
	
	--各系统开放等级,暂时填写（坐骑、翅膀）,以后需要其他系统提示，往后面加开放等级
	local level = {65,60,48,59,53,62,75} 
	local circle = Actor.getUIntProperty(sysarg, PROP_ACTOR_CIRCLE)
	if circle == 0 and myLevel >= level[3] then
		local length = {}
		for key,value in ipairs(level) do
			if myLevel >= value then
				local ActorFlag = Actor.getActorFlag(sysarg,key-1)
				if ActorFlag < 1 then
					table.insert(length,key)
				end
			end
		end
		
		if table.getn(length) > 0 then
			local netPack = DataPack.allocPacket(sysarg,139, 102)  --申请一个数据包	
			for key,value in ipairs(length) do
				DataPack.writeByte(netPack,value)
				Actor.setActorFlag(sysarg,value-1)
			end
			DataPack.flush(netPack)
		end
	end
	if myLevel >= 60 then
		UpLevelGiveTips(sysarg)
	end
	
	local var = Actor.getStaticVar(sysarg)
	if myLevel >= 60 and circle == 0 then
		--Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf125,ttFlyTip)
		
		local config = BottlesExpConfig
		if not config then return end
			
		if not Actor.checkActorLevel(sysarg,GlobalConfig.nOpenBottlesLevel) then
			return 
		end
		
--屏蔽经验瓶
--[[
		if System.getDaysSinceOpenServer() > 1 then			
			if not var.days.UseBottesNum then
				var.days.UseBottesNum = 0
			end
			local netPack = DataPack.allocPacket(sysarg, 139,124)
			DataPack.writeByte(netPack, config.MaxUse-var.days.UseBottesNum)
			DataPack.flush(netPack)
		end
--]]
	end
	
	if myLevel >= LaborActivityCfg.LoginGift.needLevel and IsOpenActivity(LaborActivityCfg) == 5 then
		if not var.LaborLoginDay or var.LaborLoginDay == 0 then
			var.LaborLoginDay = 1
			SendLaborActivityData(sysarg)
		end
	end
	
	if myLevel >= MergerServerCfg.LoginAward.needLevel then
		local CombineDays = System.getDaysSinceCombineServer()
		if CombineDays > 0 and CombineDays < 6 then
			if not var.CombineLoginDay or var.CombineLoginDay == 0 then
				var.CombineLoginDay = 1
			end
			SendCombineData(sysarg)
		end
	end
	
	if myLevel == 80 and circle == 0 then		
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf126,ttFlyTip)
	end
	
end

function OnCheckDownloadLauncher( sysarg ,myLevel)

	for k, lv in ipairs(DownloadLauncherInfo.NoticeLv) do
		if lv == myLevel then
			local netPack = DataPack.allocPacket(sysarg, 6, 14)
			if netPack then
				DataPack.flush(netPack)
			end
			break
		end
	end
end

--设置世界等级
function OnSetCultureLevel (sysarg,level)
	
	local nCurMaxLevel = System.getCultureLevel()
	if level >= nCurMaxLevel then
		-- for key ,value in ipairs(WordCultureConfig.CultureCfg) do
		-- 	if Actor.hasBuffById(sysarg, value.buffId) then
		-- 		Actor.delBuffById(sysarg,value.buffId)
		-- 	end
		-- end
		System.setCultureLevel(level)
	-- else
	-- 	local nGapLevel = nCurMaxLevel-level
	-- 	for key ,value in ipairs(WordCultureConfig.CultureCfg) do
	-- 		if nGapLevel >= value.minLevel and nGapLevel <= value.maxLevel then
	-- 			for k ,v in ipairs(WordCultureConfig.CultureCfg) do
	-- 				if Actor.hasBuffById(sysarg, v.buffId) then
	-- 					Actor.delBuffById(sysarg,v.buffId)
	-- 				end
	-- 			end
	-- 			Actor.addBuffById(sysarg,value.buffId)
	-- 			break
	-- 		end
	-- 	end
	end
end


EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeLevel, EventCallDispatcher.ActorLevelUpHandler)

