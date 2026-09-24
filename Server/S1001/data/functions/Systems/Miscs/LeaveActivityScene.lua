

--#include "data\functions\Activity\Answer\AnswerCommon.lua" once
--#include "data\functions\FuBenNpcFunc\FubenCommonFunc.lua" once
--#include "data\functions\Activity\Meet\RandNpcShopCommon.lua" once
--#include "data\config\activityconfig\Arena\warriorArena.lua" once
--#include "data\config\activityconfig\Arena\ArenaRank.lua" once
--#include "data\config\friend\MarriedConfig.lua" once

--离开活动场景，玩家点击按钮，离开活动场景
--开始吟唱，然后注册一个吟唱回调函数


--离开活动场景 
MiscsImplement.LeaveActivityScene = function (sysarg,msgid, packet)
	Actor.returnCity(sysarg)
end

--特殊答题操作
MiscsImplement.AnswerSelectOpt = function ( sysarg, msgid, packet )
	local optType = DataPack.readByte(packet)
	local ansType = DataPack.readByte( packet)
	local optResult = DataPack.readByte(packet)
	OnAnswerSelected( sysarg, optType, ansType, optResult)
end

function MiscsImplement.GetPassFubenAward( sysarg, msgid, packet )
	local fubenId = DataPack.readByte( packet )
	if fubenId > 250 then
		GetRandPetGood( sysarg, fubenId)
	else
		GetPassAward( sysarg, fubenId )
	end
end

function MiscsImplement.GetAnswerAwardList( sysarg, msgid, packet)
	SendAnswerAwardList(sysarg)
end

function MiscsImplement.SentCenterCity( sysarg, msgid, packet )
	SendToCenterCity(sysarg)
end

MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cActivitySceneLeave, MiscsImplement.LeaveActivityScene)
--MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cAnswerSelectOpt, 		MiscsImplement.AnswerSelectOpt)
MiscsImplement.registerMsgHandler(62, MiscsImplement.GetPassFubenAward)
MiscsImplement.registerMsgHandler(63, MiscsImplement.GetAnswerAwardList)
MiscsImplement.registerMsgHandler(68, MiscsImplement.SentCenterCity)