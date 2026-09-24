--lua script
--#include "data\language\LangCode.txt" once
--#include "data\config\guild\Guild.lua" once
--#include "data\functions\guildOperate\UpGuildSkillOper.lua" once	--帮派技能升级

	--#include "data\config\task\GroupLeaderConquest\GroupLeaderConquestConst.inc" once --盟主争夺战常量设置 
--#include "data\functions\FunctionGift\FunctionGift.lua" once
OpFuncList = {}

EventCallDispatcher.handlerGuildCallImplement = function (sysarg,arg)
	if arg[1] == nil then return end
	local func = OpFuncList[arg[1]]
	if func ~= nil then
		func(sysarg,arg)
	end
end

--使用召集单个会员
OpFuncList[1] = function(sysarg,arg)
	local ActorPtr = arg[2]   --被召唤人的指针
	
	local nYb = GuildConfig.global.zjYb			--召唤元宝数量

	if ActorPtr == nil  then return end
	local fbid = Actor.getFubenId(sysarg)
	local mfbid = Actor.getFubenId(ActorPtr)
	if  fbid > 0  then 
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.f00007,ttFlyTip)
		return
	end
	if mfbid > 0 then 
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.f00008,ttFlyTip)
		return 
	end
	
	local n_mYb = Actor.getMoneyCount(sysarg, mtYuanbao)

	if n_mYb < nYb then								
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.f00009,ttFlyTip)
		return
	end

	local fhandle = Actor.getFubenHandle(sysarg)
	local sceneid = Actor.getSceneId(sysarg)
	local posx = Actor.getIntProperty(sysarg,PROP_ENTITY_POSX)
	local posy = Actor.getIntProperty(sysarg,PROP_ENTITY_POSY)
	if Actor.enterFuBen(ActorPtr,fhandle,sceneid,posx,posy) then 
		Actor.changeMoney(sysarg, mtYuanbao, -nYb, GameLog.clGuildUseYbToCall, Lang.LogTips.l00170)
	end
end

--帮派升级的操作
OpFuncList[2] = function(sysarg,arg)
	local guildPos = Actor.getGuildPos(sysarg)
	if guildPos ~= smGuildLeader and guildPos ~=2 then
		Actor.sendTipmsg(sysarg,Lang.GuildLang.t003,ttFlyTip)
		return
	end
	local level = Actor.getGuildLevel(sysarg)
	if level <= 0 then return end
	if level >= 5 then	--5级已经是最大等级
		Actor.sendTipmsg(sysarg,Lang.GuildLang.t002,ttFlyTip)
		return
	end
	local config = GuildConfig.guildLevel[level].upgrade	--配置文件
	local currFr = Actor.getGuildFr(sysarg)	--当前繁荣度
	local txt = string.format(Lang.GuildLang.t001,level,currFr,config.fr,config.itemCount)
	guildUpLevel(sysarg,arg)
	--Actor.messageBox(sysarg,0,0,txt,Lang.GuildLang.t004.."/guildUpLevel",Lang.GuildLang.t005.."/guildCancelFunc",NULL)
end

function guildUpLevel(sysarg,arg)
	local guildPos = Actor.getGuildPos(sysarg)
	if guildPos ~= smGuildLeader and guildPos ~=2  then
		Actor.sendTipmsg(sysarg,Lang.GuildLang.t003,ttFlyTip)
		return
	end
	local level = Actor.getGuildLevel(sysarg)
	if level <= 0 then return end
	if level >= 5 then	--5级已经是最大等级
		Actor.sendTipmsg(sysarg,Lang.GuildLang.t002,ttFlyTip)
		return
	end
	local config = GuildConfig.guildLevel[level].upgrade	--配置文件
	local currFr = Actor.getGuildFr(sysarg)	--当前繁荣度
	if currFr < config.fr then
		Actor.sendTipmsg(sysarg,Lang.GuildLang.t006,ttFlyTip)
		return
	end
	local itemcount = Actor.getItemCount(sysarg,GuildConfig.global.upItemId)
	if itemcount < config.itemCount then
		Actor.sendTipmsg(sysarg,string.format(Lang.GuildLang.t007,config.itemCount),ttFlyTip)
		return
	end
	local gCoin =Actor.getGuildCoin(sysarg)	--帮派资金
	
	if gCoin < config.needmoney then
		Actor.sendTipmsg(sysarg,string.format(Lang.GuildLang.z00001,config.itemCount),ttFlyTip)
		return
	end
	
	local campName = Camp.getCampName(Actor.getCamp(sysarg))
	local userName = Actor.getName(sysarg)
	local guildName = Actor.getGuildName(sysarg)

	Actor.changeGuildCoin(sysarg,-config.needmoney)
	--Actor.removeItem(sysarg,GuildConfig.global.upItemId,config.itemCount,-1,-1,-1,Actor.getGuildName(sysarg),27)
	Actor.upGuildLevel(sysarg)			--升级帮派

	local gStr = string.format(Lang.GuildLang.z00031,userName,config.needmoney,level+1)

	Actor.sendGuildMsg(sysarg,smGuildCommon,gStr,128)	--发帮派广播
	Actor.addEventRecord(sysarg,gStr,23,config.needmoney,level+1,0,userName,null)
	
	System.broadcastTipmsg(string.format(Lang.GuildLang.z00018, campName, guildName,userName, level+1), ttScreenCenter)

	Actor.giveGuildUpLevelAchieve(sysarg)		--给所有人成就
	Actor.notifyUpdateGuildInfo(sysarg)			--通知所有人帮派信息已更新
	Actor.triggerQuestEvent( sysarg, 6, level + 1 , 1)		--提高帮派等级
end

function guildCancelFunc(sysarg,arg)
end

--离开帮派的操作
OpFuncList[3] = function(sysarg,arg)
  --在盟主争夺战中脱离帮派
  --GroupLeaderConquestLeftFunc(sysarg,arg)
  --OpMemLeftGuildOp(sysarg)
  ----------------------------------
end

--加入帮派/创建帮派
OpFuncList[54] = function(sysarg,arg)
    print("加入帮派功能礼包:"..Actor.getName(sysarg))
    OnCompleteGiftTask(sysarg,5)
	local var = Actor.getStaticVar(sysarg)
	if var.JGuild==nil then 
		local awardIdAndCount=0
		local myID = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
		awardIdAndCount=System.setInt2Byte(awardIdAndCount,true,1)
		awardIdAndCount=System.setInt2Byte(awardIdAndCount,false,633)
		System.AddMail(myID,6,0,"行会大礼包","亲爱的玩家，\\\\恭喜您加入行会,特赠送一个礼包,加入一个强大的行会将真正的开启无兄弟不传奇的追日旅程。\\\\加入行会您将获得以下主要福利：\\\\1.互换装备：使用贡献值可兑换行会仓库中的装备，装备打不到再也不用愁了！\\\\2.行会加成：加入行会即可获得攻击力加成\\\\3.行会活动：王城霸主、行会激战等众多行会专属活动等待着您的参加。\\\\祝游戏愉快！",awardIdAndCount,0)	
		var.JGuild = 1
	end
	Quest_ShuaXin(sysarg)
end

--[[
    函数名称：GroupLeaderConquestLeftFunc
    函数描述：在盟主争夺战中脱离帮派
    参数 sysarg 的描述：执行对象
    参数 arg 的描述： 参数列表
]]
function GroupLeaderConquestLeftFunc(sysarg,arg)
--	if GroupLeaderConquestConst.ReturnPos ~= nil then exitTbl = GroupLeaderConquestConst.ReturnPos else return end
--  --获取角色阵营
--  local camp = Actor.getCampId( sysarg)
--  local sceneId = Actor.getSceneId(sysarg)
--  if sceneId == GroupLeaderConquestConst.GroupBattleMap[camp].sid then
--	  --根据阵营回城
--	  if exitTbl[camp] ~= nil then
--		  local randX = System.getRandomNumber(exitTbl[camp][4])
--		  Actor.enterScene(sysarg,exitTbl[camp][1],exitTbl[camp][2]+randX,exitTbl[camp][3])
--	  end
--  end
end

EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeGuildCall, EventCallDispatcher.handlerGuildCallImplement)