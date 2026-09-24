--lua script
--处理帮派相关的操作

--#include "data\config\guild\GxShopConfig.lua" once		--帮派商店配置
--#include "data\config\guild\GuildBiaoChe.lua" once		--帮派镖车配置
--#include "data\config\guild\Guild.lua" once
--#include "data\config\guild\GuildSiegeConfig.lua" once

--#include "data\functions\guildOperate\UpGuildSkillOper.lua" once	--帮派技能升级
--#include "data\functions\guildOperate\ExchangeGuildGx.lua" once	--帮派商店
--#include "data\functions\guildOperate\GuildBuffOper.lua" once		--开启行会光环
--#include "data\functions\guildOperate\GuildBuildingCommon.lua" once
--#include "data\functions\guildOperate\GuildBoss.lua" once

--[[
local   gLeft = 3,			--离开帮派
local	gUpSkill = 4		--升级帮派技能
local   cUoSkill = 5		--扣除升级帮派技能所需的资源
local   gExchangeGx = 6		--行会商店购买物品
local   gDart = 7		--镖车的信息
local   gRefresh = 8		--镖车刷新
local   gDoRefresh = 9		--进行镖车刷新
local   gCreateBoss = 10	--发起封印兽碑挑战
local   gBossScore = 11		--膜拜
local   gGetBossInfo = 12	--请求封印兽碑的信息
local   gLeftGuild = 13		--退出帮派
local   gAddChanllengeTimes = 14 	--增加个人挑战的次数
local   gSendBlessing = 15	--欢迎新成员
local   gOpenGuildBuff = 16,	--开启行会光环
local   gSendChatInfo = 17,	--下发语音频道的信息
local   gSendSbkOwnMsg = 18,	--下发沙巴克的基本信息
local   gGetSbkWeal = 19,	--领取沙巴克福利
local   gGetFirstSbkAward = 20,	--领取首个沙巴克占领的奖励
local   gGetDefendSbkAward = 21,	--首个守沙三次的行会首领奖励
local   gGetDefendSecSbkAward = 22,	 --首个守沙三次的行会的副首领的奖励
local   gGetCombineSbkAward = 23,		--首个占领沙巴克的行会的首领的奖励
local   gGetCombineSecSbkAward = 24,	--首个占领沙巴克行会的服首领的奖励
local   gGetCombineDefendSbkAward = 25,		--首个守沙三次的行会首领奖励
local   gGetCombineDefendSecSbkAward = 26,	--首个守沙三次的副首领奖励
local   gGetSxFormData = 27,				--获取上香面板数据
local   gActorSxOp = 28,					-- 玩家上香
local   gAddSxTimesOp = 29,					--增加上香的次数
local   gGetGuanGongFashion = 30,			--领取拜关公时装
local   gGetGuildMoonData = 31,				-- 获取月光宝盒的数据
local   gExploreMoonBoxOp = 32,				-- 行会探险
local   gGetMoonBoxItemOp = 33,				-- 领取月光宝盒的物品
local   gGuildBuildingUpOp = 34,			-- 行会建筑升级
local   gClearGuildCdTimeOp = 35,			-- 清除行会建筑冷却时间
local   gExploreFinishop = 36,				-- 探险动画播放完毕
local   gSendMoonBoxExploreTimes = 37,		-- 下发月光宝盒的次数
local   gOpenGuildLevelBuff = 38,		-- 开启行会级别buff
local   gJoinOpGuildLevelBuff = 39,		-- 成员加入添加行会级别buff
local   gLeftClGuildLevelBuff = 40,		-- 成员退出删除行会级别buff
local 	gSendSbkLeaderNameList = 41,	--下发沙巴克管理层名字
local   gSendSignUpGuildList = 42,		--下发今天报名帮战和明天报名帮战
local   gGetSbkAward = 43,				--获取沙巴克奖励
local	gGetLeaderPrivilege = 44,		--领取城主特权
local   gRemoveGuildeDepot = 45,		--取出行会仓库物品
local   gSignUpGuildMap = 46,			--报名行会秘境
local   gEnterGuildMap = 47,			--进入行会秘境
local   gDonateResult = 48,				--行会捐献结果
local   gGetGuildBossInfo = 49,			--获得行会BOSS信息
local   gBreedGuildBoss = 50,			--饲养行会BOSS
local   gEnterGuildBossFuben = 51,		--进入行会BOSS副本
local   gCallGuildBoss = 52,			--召唤行会BOSS
local   gExitGuildBossFuben = 53,		--退出行会BOSS副本
--]]

GuildOpFuncList = {}

EventCallDispatcher.HandlerGuildOp = function (sysarg, args)
 --print("参数："..args[1])
  if args[1] == nil then return end   --第1个参数  升级帮派技能
  local func = GuildOpFuncList[args[1]]
  if func ~= nil then
    return func(sysarg, args)
  end
end

GuildOpFuncList[3] = function (sysarg,args)
	OpMemLeftGuildOp(sysarg)
end

--帮贡兑换
GuildOpFuncList[6] = function (sysarg,args)
  GuildExchangeGx( sysarg, args )
end

--镖车的信息
GuildOpFuncList[7] = function (sysarg,args)
  GetGuildDartInfo( sysarg, args )
end

--镖车的信息
GuildOpFuncList[8] = function (sysarg,args)
  GetGuildDartRefresh( sysarg, args )
end

--镖车刷新
GuildOpFuncList[9] = function (sysarg,args)
  GetGuildDoRefresh( sysarg, args )
end

--发起封印兽碑挑战
GuildOpFuncList[10] = function (sysarg,args)
	GuildCreateBoss( sysarg, args )
end

--请求封印兽碑的信息
GuildOpFuncList[12] = function (sysarg,args)
	OnSendGuildBossToClient( sysarg )
end

--退出帮派
GuildOpFuncList[13] = function (sysarg,args)
	LeftGuildOper( sysarg, args )
end

--增加个人挑战的次数
GuildOpFuncList[14] = function (sysarg,args)
	OnAddChanllengeTimes( sysarg, args )
end

--欢迎新成员
GuildOpFuncList[15] = function (sysarg,args)
	WelcomeNewMemberOp( sysarg, args )
end

--开启行会光环
GuildOpFuncList[16] = function (sysarg,args)
	OnOpenGuildBuffOp(sysarg,args)
end

--开启行会光环
GuildOpFuncList[17] = function (sysarg,args)
	OnSendGuildChannelInfo(sysarg,args)
end

--下发沙巴克基本信息
GuildOpFuncList[18] = function (sysarg,args)
	OnSendSbkMsgInfo(sysarg,args)
end

--领取沙巴克福利
GuildOpFuncList[19] = function (sysarg,args)
	OnGetSbkWeal(sysarg,args)
end

--给予首次占领的沙巴克行会奖励
GuildOpFuncList[20] = function (sysarg,args)
	OnGiveFirstSbkGuildAward(sysarg,args)
end

--首个守沙三次的行会首领奖励
GuildOpFuncList[21] = function (sysarg,args)
	OnGiveDefendThreeSbkAward(sysarg,args)
end

--首个守沙三次的行会的副首领的奖励
GuildOpFuncList[22] = function (sysarg,args)
	OnGiveDefendSbkSecAward(sysarg,args)
end

--首个占领沙巴克的行会的首领的奖励
GuildOpFuncList[23] = function (sysarg,args)
	OnGiveCombineSbkAwardOp(sysarg,args)
end

--首个占领沙巴克行会的服首领的奖励
GuildOpFuncList[24] = function (sysarg,args)
	OnGiveCombineSecSbkAwardOp(sysarg,args)
end

--首个守沙三次的行会首领奖励
GuildOpFuncList[25] = function (sysarg,args)
	OnGiveCombineDefendSbkAwardOp(sysarg,args)
end

--首个守沙三次的副首领奖励
GuildOpFuncList[26] = function (sysarg,args)
	OnGiveCombineDefendSecSbkAwardOp(sysarg,args)
end

--获取上香面板数据
GuildOpFuncList[27] = function (sysarg,args)
	OnSendShxFormData(sysarg,args)
end

--玩家上香
GuildOpFuncList[28] = function (sysarg,args)
	OnActorSxOp(sysarg,args)
end

--玩家上香
GuildOpFuncList[29] = function (sysarg,args)
	OnAddSxTimesOp(sysarg,args)
end

--领取拜关公时装
GuildOpFuncList[30] = function (sysarg,args)
	OnGetGuanGongFashion(sysarg,args)
end

--获取月光宝盒的数据
GuildOpFuncList[31] = function (sysarg,args)
	OnGetGuildMoonBoxData(sysarg,args)
end

--行会探险
GuildOpFuncList[32] = function (sysarg,args)
	OnGuildExploreOp(sysarg,args)
end

--领取月光宝盒的物品
GuildOpFuncList[33] = function (sysarg,args)
	OnGetExploreItemIdOp(sysarg,args)
end

--行会建筑升级
GuildOpFuncList[34] = function (sysarg,args)
	OnUpGuildBuildingOp(sysarg,args)
end

--清除行会建筑冷却时间
GuildOpFuncList[35] = function (sysarg,args)
	OnClearGuildBuildCdTime(sysarg,args)
end

--探险动画播放完毕
GuildOpFuncList[36] = function (sysarg,args)
	OnExploreFinishOp(sysarg,args)
end

--下发月光宝盒的次数
GuildOpFuncList[37] = function (sysarg,args)
	OnSendExploreTimesToClient(sysarg)
end

--开启行会级别buff
GuildOpFuncList[38] = function (sysarg,args)
	OnOpenGuildLevelBuffOp(sysarg,args)
end

--成员加入添加行会级别buff
GuildOpFuncList[39] = function (sysarg,args)
	JoinGuildLevelBuffOp(sysarg,args)
end

--成员退出删除行会级别buff
GuildOpFuncList[40] = function (sysarg,args)
	LeftGuildLevelBuffCl(sysarg,args)
end

--下发沙巴克管理层名字
GuildOpFuncList[41] = function (sysarg,args)
	SendGuildSbkLeaderName(sysarg,args)
end

--下发今天报名帮战和明天报名帮战
GuildOpFuncList[42] = function (sysarg,args)
	SendSignUpGuildList(sysarg,args)
end

--获取沙巴克奖励
GuildOpFuncList[43] = function (sysarg,args)
	GetSbkAward(sysarg,args)
end

--领取城主特权
GuildOpFuncList[44] = function (sysarg,args)
	GetLeaderPrivilege(sysarg,args)
end

--取出行会仓库物品
GuildOpFuncList[45] = function (sysarg,args)
	return GetGuildDepotItem(sysarg,args)
end

--行会捐献结果
GuildOpFuncList[48] = function (sysarg,args)
	GuildDonateResult(sysarg,args)
end

--获得行会BOSS信息
GuildOpFuncList[49] = function (sysarg,args)
	SendGuildBossInfo(sysarg)
end

--饲养行会BOSS
GuildOpFuncList[50] = function (sysarg,args)
	BreedGuildBoss(sysarg)
end

--进入行会BOSS副本
GuildOpFuncList[51] = function (sysarg,args)
	EnterGuildBossFuben(sysarg)
end

--召唤行会BOSS
GuildOpFuncList[52] = function (sysarg,args)
	CallGuildBoss(sysarg)
end

--退出行会BOSS副本
GuildOpFuncList[53] = function (sysarg,args)
	ExitGuildBossFuben(sysarg)
end

EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeGuild, EventCallDispatcher.HandlerGuildOp)
