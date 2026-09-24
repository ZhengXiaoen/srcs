--lua script
--#include "data\functions\ExpandFunc\CampFunctionLimit.lua" once  --阵营检测
--#include "data\config\guild\FreshSbkMonster.lua" once 
--#include "data\config\guild\GuildBiaoChe.lua"  once  --基本设置 
--#include "data\config\guild\Guild.lua"  once  --基本设置 
--#include "data\config\activityconfig\CombineServerActivity\CombineActivity.lua"  once
--#include "data\config\skill\SkillConfig.txt"  once 
--#include "data\functions\Activity\Common\Awards.lua" once
----#include "guildBiaoChe\GuildDartCommon.lua" once

--升级帮派技能,args = [操作的类型,技能的ID]
function setUpGuildSkill( sysarg, args )
	local skillId = args[2] 
	if(skillId == nil) then return end
	
	local index = 0
	local count = table.getn(GuildSkillConfig)
	
	local nPos = Actor.getGuildPos(sysarg)

	if((nPos ~= 2) and (nPos ~= 3))	then	--只有帮主或副帮主才能升级帮派技能
		Actor.sendTipmsg(sysarg, Lang.TaskTalk.t00702, ttDialog)
		return
	end

	for i=1,count do
		if skillId == GuildSkillConfig[i].id then
			index = i
			break
		end
	end

	if index == 0 then return end

	local skillLevel = Actor.getGuildSkillLevel(sysarg,skillId)	--获得技能的等级
	
	--已经是最高等级
	if skillLevel >= table.getn(GuildSkillConfig[index].skillSubLevel) then
		Actor.sendTipmsg(sysarg, Lang.TaskTalk.t00703, ttDialog)
		return
	end
	
	local sType =0
	local sCount = 0
	local bConsume

	local bResult
	for i=1,table.getn(GuildSkillConfig[index].skillSubLevel[skillLevel+1].upConds) do
		sType = GuildSkillConfig[index].skillSubLevel[skillLevel+1].upConds[i].cond
		sCount = GuildSkillConfig[index].skillSubLevel[skillLevel+1].upConds[i].count
		bConsume = GuildSkillConfig[index].skillSubLevel[skillLevel+1].upConds[i].consume

		bResult = Actor.canUpGuildSkillLevel(sysarg,sType,sCount,bConsume)

		if bResult ==false then
			return 
		end
	end

	--保存数据
	Actor.saveDbGuildSkill(sysarg,skillId,skillLevel+1)
end

--扣除升级帮派技能资源,args = [操作的类型,技能的ID]
function finishUpGuildSkill( sysarg, args )
	local skillId = args[2] 
	if(skillId == nil) then return end
	
	local index = 0
	local count = table.getn(GuildSkillConfig)

	for i=1,count do
		if skillId == GuildSkillConfig[i].id then
			index = i
			break
		end
	end

	if index == 0 then return end

	local skillLevel = Actor.getGuildSkillLevel(sysarg,skillId)	--获得技能的等级

	if skillLevel > table.getn(GuildSkillConfig[index].skillSubLevel) then
		return
	end

	local sType =0
	local sCount = 0
	local bConsume

	local bResult
	if skillLevel <= 0 then
		skillLevel = 1
	end
	for i=1,table.getn(GuildSkillConfig[index].skillSubLevel[skillLevel].upConds) do
		sType = GuildSkillConfig[index].skillSubLevel[skillLevel].upConds[i].cond
		sCount = GuildSkillConfig[index].skillSubLevel[skillLevel].upConds[i].count
		bConsume = GuildSkillConfig[index].skillSubLevel[skillLevel].upConds[i].consume
		
		if (bConsume == true) then
			Actor.decountUpGuildSkill(sysarg,sType,sCount,bConsume)
		end

	end
	
	local pack = DataPack.allocPacket(sysarg, 10, 26)
	if (pack ~= nil) then
		DataPack.flush(pack)
	end
	
	local skillName = SkillConfig[skillId+1].name
	local str2 = string.format(Lang.GuildLang.z00021,Actor.getName(sysarg),skillName,skillLevel)

	Actor.sendGuildMsg(sysarg,smGuildCommon,str2,128)	--发帮派广播
	
	countCoin = GuildSkillConfig[index].skillSubLevel[skillLevel].upConds[2].count
	countYs = GuildSkillConfig[index].skillSubLevel[skillLevel].upConds[3].count
	
	local str3
	if countYs > 0 then
		str3 = string.format(Lang.GuildLang.z00020,Actor.getName(sysarg),countCoin,countYs,skillName,skillLevel)
		Actor.addEventRecord(sysarg,str3,19,countCoin,countYs,skillLevel,Actor.getName(sysarg),skillName)
	else
		str3 = string.format(Lang.GuildLang.z00022,Actor.getName(sysarg),countCoin,skillName,skillLevel)
		Actor.addEventRecord(sysarg,str3,20,countCoin,skillLevel,0,Actor.getName(sysarg),skillName)
	end

	--发送给所有在线的帮派成员
	--Actor.sendGuildSkillToAllMember(sysarg,skillId,skillLevel)
end

--获得帮派运镖的信息
function GetGuildDartInfo( sysarg, args )
	local svar = Actor.getDyanmicVar(sysarg)
	local pack = DataPack.allocPacket(sysarg, 10, 30)
	local campId = Actor.getCampId(sysarg)  --获取实体所属阵营
	local dest = GuildDartConst.Dest[campId]  --目标 信息
	local acces = GuildDartConst.Src[campId]

	local var = Actor.getStaticVar(sysarg)

	if var.days.GuildDartOpenTimes == nil then  --开启次数
		var.days.GuildDartOpenTimes = {}                        
	end
	
	if (var.days.GuildDartOpenTimes[campId] == nil) then
  		var.days.GuildDartOpenTimes[campId] = 0
	end
	  --判断是否有镖车 	local GuildDartMonHdl = svar.GuildDartMonster
	
	local sid
	local sname
	local GuildDartMonHdl = svar.GuildDartMonster
	local cId
	if (GuildDartMonHdl == nil or GuildDartMonHdl == 0) then
		sid = acces.sid
		sname = acces.snpcname
		cId = 0
	else
		sid = dest.destsceneid
		sname = dest.destnpcname
		cId = 1
	end

	if (pack ~= nil) then
	  --print(Actor.getHandle(monster))
		DataPack.writeInt64(pack, 0)			--下属句柄
		DataPack.writeString(pack, "biao")		-- 下属名称							
		DataPack.writeInt(pack, 0)			-- 下属模型Id
		DataPack.writeChar(pack, 1)                     --消息中是否有目标点信息 1表示后面紧跟着目标点信息 0表示后面无目标点信息
		DataPack.writeInt(pack, sid)       --目标点场景ID
		DataPack.writeString(pack, sname)    --目标NPC名称
		--vip类型
		local bVip = Actor.isVIPByType(sysarg,2)
		
		local zNum = 0
		if(bVip == true) then
			zNum = GuildDartConst.VipOpenTimes
		else
			zNum = GuildDartConst.OpenTimes
		end
		DataPack.writeByte(pack,zNum)  --运镖的总次数
		DataPack.writeByte(pack,var.days.GuildDartOpenTimes[campId])  --次数
		DataPack.writeByte(pack,cId)
		DataPack.flush(pack)
	end

	SendGuildActionLeftTimeAndAward(sysarg,0,0)
end

--获得帮派镖车的刷新
function GetGuildDartRefresh( sysarg, args )
	local campId = Actor.getCampId(sysarg)  --获取实体所属阵营

	  --判断是否有镖车 
	local svar = Actor.getDyanmicVar(sysarg) 
	local GuildDartMonHdl = svar.GuildDartMonster
  
	if (GuildDartMonHdl == nil or GuildDartMonHdl == 0) then
		Actor.sendTipmsg(sysarg, Lang.TaskTalk.t00479, ttDialog)
		return nil
	end

	local x,y = GuildDartConst.Src[campId].x, GuildDartConst.Src[campId].y  --获取实体X Y坐标
	local sid = GuildDartConst.Src[campId].sid
	local aX,aY = Actor.getEntityPosition(sysarg,0,0) --获取实体X Y坐标
	local aSid = Actor.getSceneId(sysarg)
	--if (sid ~= aSid or math.abs(x-aX) > 10 or (math.abs(y-aY) > 10)) then 
		--Actor.sendTipmsg(sysarg, Lang.TaskTalk.t00699, ttDialog)
		--return nil
	--end

	local level = Actor.getIntProperty( sysarg, PROP_CREATURE_LEVEL )
	local guildLevel = Actor.getGuildLevel(sysarg)

	local gExp = GuildDartReward.initExp[level][guildLevel] or 0 
	local gGx = GuildDartReward.initGx or 0 
	local guildCoin = GuildDartReward.awardCoin or 0 
	
	local num = 1
	if(svar.GuildDartType ~= nil) then
		 num = svar.GuildDartType
	end
	--发送客户端打开更换镖车界面
	SendToClentGuildChangeSlave(sysarg, GuildDartHorse, 1, num, gExp, guildCoin, gGx)
end

--进行镖车刷新
function GetGuildDoRefresh( sysarg, args )
	local consumeType = args[2]	--刷新的类型

	GuildChangeSlave(sysarg,0,consumeType)
end

--
function LeftGuildOper( sysarg, args )
	OnGuildDartFailed(sysarg,GuildDartConst.DartSetup.CampDartFailUnknown)
end

function WelcomeNewMemberOp( sysarg, args )
	local nType = args[2]
	local nActorId = args[3]
	
	local nName = Actor.findGuildMemberName(sysarg,nActorId)
	if nName == nil then return end
	
	local actorPtr = Actor.getActorByName(nName)

	if actorPtr == nil then return end
	
	local tempStr
	local userName = Actor.getName(sysarg)
	--[[
		--送经验
		if nType == 1 then
			tempStr = string.format(Lang.GuildLang.z00047,userName,GuildConfig.global.sendexp)
			Actor.giveAward(actorPtr, 2, 0,GuildConfig.global.sendexp, 0, 0, 1, 0, 205, "guild welcome")
			Actor.giveAward(sysarg, 2, 0,GuildConfig.global.sendexp, 0, 0, 1, 0,205, "guild welcome")
		--送金币
		elseif nType == 2 then
			tempStr = string.format(Lang.GuildLang.z00048,userName,GuildConfig.global.sendBindCoin)
			Actor.giveAward(actorPtr, 6, 0,GuildConfig.global.sendBindCoin, 0, 0, 1, 0,205, "guild welcome")	
			Actor.giveAward(sysarg, 6, 0,GuildConfig.global.sendBindCoin, 0, 0, 1, 0,205, "guild welcome")
		--送荣誉
		elseif nType ==  3 then
			tempStr = string.format(Lang.GuildLang.z00049,userName,GuildConfig.global.sendGuildGx)
			--local nValue = Actor.getIntProperty(actorPtr,PROP_ACTOR_HONOUR)
			--Actor.setProperty(actorPtr,PROP_ACTOR_HONOUR, nValue+GuildConfig.global.sendGuildGx)

			--local nValue = Actor.getIntProperty(sysarg,PROP_ACTOR_HONOUR)
			--Actor.setProperty(sysarg,PROP_ACTOR_HONOUR, nValue+GuildConfig.global.sendGuildGx)
			Actor.giveAward(actorPtr, 21, 0,GuildConfig.global.sendGuildGx, 0, 0, 1, 0,205, "guild welcome")	
			Actor.giveAward(sysarg, 21, 0,GuildConfig.global.sendGuildGx, 0, 0, 1, 0,205, "guild welcome")	
		end

		if tempStr ~= nil then
			Actor.sendTipmsg(actorPtr, tempStr, ttChatWindow + ttScreenCenter)
		end
	]]
	
	local maxNum = GuildConfig.global.MaxLangNum
	local randNum = System.getRandomNumber(maxNum)  -- 返回[0-100]的随机数

	if randNum <1 then
		randNum = 1
	end

	if randNum > maxNum then
		randNum = maxNum
	end
	
	if randNum == nil then return end
	local str1 = string.format(Lang.GuildWelComeLang[randNum],nName)

	if str1 ~= nil then
		Actor.sendWelcomeToNewMember(sysarg,str1)
	end
end

--给予首次占领的沙巴克行会奖励
function OnGiveFirstSbkGuildAward(sysarg,args)
	if Awards.CheckBagGridCount(sysarg,GuildConfig.FirstSbkAwards) then
		Awards.Give(sysarg,GuildConfig.FirstSbkAwards,61,Lang.GuildLang.m00158)
		local str = string.format(Lang.GuildLang.z00121,Actor.getName(sysarg),Item.getItemName(GuildConfig.FirstSbkAwards[1].id))
		System.broadcastTipmsg(str,2+128)
	end
end

--守沙三次的奖励
function OnGiveDefendThreeSbkAward(sysarg,args)
	if Awards.CheckBagGridCount(sysarg,GuildConfig.DefendSbkThreeAward) then
		local nGuildId = Actor.getIntProperty( sysarg, PROP_ACTOR_GUILD_ID )
		local sname = ""
		if nGuildId > 0 then
			sname = Actor.getGuildName(nGuildId)
		end
		Awards.Give(sysarg,GuildConfig.DefendSbkThreeAward,833,Lang.GuildLang.z00125,5)				--表示产生5类极品属性
		local str = string.format(Lang.GuildLang.z00124,sname,Actor.getName(sysarg),Actor.getName(sysarg))
		System.broadcastTipmsg(str,2+128)
	end
end

--首个守沙三次的行会的副首领的奖励
function OnGiveDefendSbkSecAward(sysarg,args)
	if Awards.CheckBagGridCount(sysarg,GuildConfig.DefendSenMonsterAward) then
		local nGuildId = Actor.getIntProperty( sysarg, PROP_ACTOR_GUILD_ID )
		local sname = ""
		if nGuildId > 0 then
			sname = Actor.getGuildName(nGuildId)
		end
		Awards.Give(sysarg,GuildConfig.DefendSenMonsterAward,822,Lang.GuildLang.z00125)
		--local str = string.format(Lang.GuildLang.z00140,sname,Actor.getName(sysarg),Actor.getName(sysarg))
		--System.broadcastTipmsg(str,2+128)
		Actor.sendTipmsg(sysarg, Lang.GuildLang.z00140, ttFlyTip)
	end
end

--退出行会的处理
function OpMemLeftGuildOp(sysarg)
	local nSceenId = Actor.getSceneId(sysarg)
	if nSceenId == SbkGuildMonsterConfig.nSceenId then		--在沙巴克副本内
		Actor.enterScene(sysarg,SbkGuildMonsterConfig.outSceenId,unpack(SbkGuildMonsterConfig.outRange))
	end
    --行会boss-退出行会后不允许挑战boss
    local var = Actor.getStaticVar(sysarg)
    var.guildbosskill = 1
    if Actor.getFubenId(sysarg) > 0 then
        local arrScene = {650,651,652,653,654,655,656,657,658,659,660,661,662,663,664}
        for i = 1,#arrScene do
            if nSceenId == arrScene[i] then
                Actor.exitFuben(sysarg)
                break
            end
        end
    end
end

--首个合区占领沙巴克的行会的首领的奖励
function OnGiveCombineSbkAwardOp(sysarg,args)
	if Awards.CheckBagGridCount(sysarg,CombineActivity[1].allAwards[1].awards) then
		local nGuildId = Actor.getIntProperty( sysarg, PROP_ACTOR_GUILD_ID )
		local sname = ""
		if nGuildId > 0 then
			sname = Actor.getGuildName(nGuildId)
		end
		Awards.Give(sysarg,CombineActivity[1].allAwards[1].awards,817,Lang.GuildLang.z00146)
		local str = string.format(Lang.GuildLang.z00147,sname,Actor.getName(sysarg),Actor.getName(sysarg))
		System.broadcastTipmsg(str,2+128)
	end
end

--首个合区占领沙巴克行会的服首领的奖励
function OnGiveCombineSecSbkAwardOp(sysarg,args)
	local freeBagCount = Item.getBagEmptyGridCount(sysarg)

	if freeBagCount >= 4 then
		local nGuildId = Actor.getIntProperty( sysarg, PROP_ACTOR_GUILD_ID )
		local nJob = Actor.getIntProperty( sysarg, PROP_ACTOR_VOCATION )
		local sname = ""
		if nGuildId > 0 then
			sname = Actor.getGuildName(nGuildId)
		end
		local awardConfig = CombineActivity[1].allAwards[2].awards
		for i=1,table.getn(CombineActivity[1].allAwards[2].awards) do
			local bCanAward = false
			if awardConfig[i].job == nil then
				bCanAward = true
			elseif awardConfig[i].job > 0 and awardConfig[i].job == nJob then
				bCanAward = true
			end

			if bCanAward == true then
				Actor.giveAward(sysarg,awardConfig[i].type,awardConfig[i].id,awardConfig[i].count,awardConfig[i].quality,awardConfig[i].strong,awardConfig[i].bind,0,817,Lang.GuildLang.z00146)
			end
			--Awards.Give(sysarg,CombineActivity[1].allAwards[2].awards,817,Lang.GuildLang.z00146)
		end
	end
end

--首个合区守沙三次的行会首领奖励
function OnGiveCombineDefendSbkAwardOp(sysarg,args)
	if Awards.CheckBagGridCount(sysarg,CombineActivity[2].allAwards[1].awards) then
		local nGuildId = Actor.getIntProperty( sysarg, PROP_ACTOR_GUILD_ID )
		local sname = ""
		if nGuildId > 0 then
			sname = Actor.getGuildName(nGuildId)
		end
		Awards.Give(sysarg,CombineActivity[2].allAwards[1].awards,817,Lang.GuildLang.z00149)
		local str = string.format(Lang.GuildLang.z00148,sname,Actor.getName(sysarg),Actor.getName(sysarg))
		System.broadcastTipmsg(str,2+128)
	end
end

--首个合区守沙三次的副首领奖励
function OnGiveCombineDefendSecSbkAwardOp(sysarg,args)
	local freeBagCount = Item.getBagEmptyGridCount(sysarg)
	if freeBagCount >= 4 then
		local nGuildId = Actor.getIntProperty( sysarg, PROP_ACTOR_GUILD_ID )
		local nJob = Actor.getIntProperty( sysarg, PROP_ACTOR_VOCATION )
		local sname = ""
		if nGuildId > 0 then
			sname = Actor.getGuildName(nGuildId)
		end
		
		local awardConfig = CombineActivity[2].allAwards[2].awards
		for i=1,table.getn(CombineActivity[2].allAwards[2].awards) do
			local bCanAward = false
			if awardConfig[i].job == nil then
				bCanAward = true
			elseif awardConfig[i].job > 0 and awardConfig[i].job == nJob then
				bCanAward = true
			end

			if bCanAward == true then
				Actor.giveAward(sysarg,awardConfig[i].type,awardConfig[i].id,awardConfig[i].count,awardConfig[i].quality,awardConfig[i].strong,awardConfig[i].bind,0,817,Lang.GuildLang.z00149)
			end
			--Awards.Give(sysarg,CombineActivity[2].allAwards[2].awards,817,Lang.GuildLang.z00149)
		end
	end
end
