--#ifndef _ACTOR_EVENT_DISPATCHER_
--#define _ACTOR_EVENT_DISPATCHER_
--[[ActorEventDispatcher.lua]]
--延时回调类型表
LocalDT.ScriptDelayConfig = {}
--延时回调类型


--#include "AEDispatcherImplement.lua" once

--#include "ScriptDelayCallBackItem\ScriptDelayCallBack.lua" once	--脚本延迟回调

--#include "ItemEventHandler.lua" once

--#include "EquipEnhanceHandler.lua" once   

--#include "FBOPHandler.lua" once      
--#include "LeaveTeamHandler.lua" once
--#include "ActorDieHandler.lua" once 
--#include "ActorLoginHandler.lua" once    
--#include "ActorLogOutHandler.lua" once
--#include "GuildCallHandler.lua" once
--#include "DefPracticeHandler.lua" once
--#include "LevelUPFriendCongHandler.lua" once
	--#include "ChallengeHandler.lua" once
--#include "..\Systems\TimeReward\TimeReward_Event.lua" once 
   --#include "..\SpaceCopys\ChallengeLogOut.lua" once
--#include "ActorFinishAchieveHandler.lua" once
--#include "LogOutExpHandler.lua" once
--#include "ActorGetExpOverUpperLmt.lua" once
--#include "FirstLoginLearnSkill.lua" once 
--#include "NewDayArriveHandler.lua" once
--#include "OnAsyncOpResultHandler.lua" once
--#include "OnFubenTimeoutHandler.lua" once
--#include "OnLearnSkill.lua" once
--#include "OnUseSkill.lua" once
--#include "GuardActionHandler.lua" once
--#include "OnBeKilledByActorInclude.lua" once
	--#include "..\Systems\TimeReward\TimeMoneyReward_Event.lua" once
--#include "PlantYuanbaoHandler.lua" once
	--#include "CampDartHandler.lua" once
--#include "VIPHandler.lua" once
--#include "CrossGuildHandle.lua" once
--#include "BrotherHandle.lua" once
--#include "HeroHandle.lua" once
--#include "GemHandle.lua" once
--#include "StoreHandle.lua" once
--#include "DmkjHandle.lua" once
--#include "LevelUpHandler.lua" once
--#include "guildHandler.lua" once
--#include "RelationHandle.lua" once
--#include "guildDateHandler.lua" once
--#include "AddToTeam.lua" once
--#include "CombatHandler.lua" once
--#include "FriendHandler.lua" once
--#include "LootDropItemHandle.lua" once
--#include "DiamondHandler.lua" once
--#include "PictureGuildOver.lua" once
--#include "data/functions/Activity/OpenTenDaysActivity/WholeActivityAward.lua" once
--#include "WithDrawYuanBao.lua" once
--#include "data/functions/Activity/CombineActivity/CombineActivityHandler.lua" once
--#include "HundredServer.lua" once  --百服活动
--#include "data/functions/Activity/CrossBoss/CrossHandle.lua" once
--#include "data/functions/Activity/GodWealth/GodWealthHandle.lua" once
--#include "MagicItemHandle.lua" once
--#include "EquipOpHandle.lua" once

----#include "OnTelePort.lua" once
--#include "data/functions/ActorEvent/MagicEquipHandler.lua" once
--#include "data/functions/ActorEvent/GildHandler.lua" once
--#include "data/functions/ActorEvent/SwingEquipHandler.lua" once
--#include "data/functions/ActorEvent/SavvyHandler.lua" once
--#include "data/functions/ActorEvent/JobSpiritTitle.lua" once
--#include "data/functions/Activity/ActivityHandle.lua" once
--#include "data/functions/DropBroadcast.lua" once
--#include "data/functions/ActorEvent/BatchBoxHandle.lua" once
--#include "data/functions/ActorEvent/AcceptQuest.lua" once
--#include "data/functions/ActorEvent/AvoidEvent.lua" once
--#include "data/functions/ActorEvent/FuBenAward.lua" once
--#include "data/functions/ActorEvent/PetEventHandle.lua" once
--#include "data/functions/ActorEvent/ActivityTipWin.lua" once
--#include "data/functions/Fuben/ChallengeBoss.lua" once
--#include "data/functions/ActorEvent/ImmortalEvent.lua" once
--#include "data/functions/ActorEvent/OfflineMsg.lua" once
--#include "MiscEventHandler.lua" once
--#include "data/functions/ActorEvent/GiffGaffHandler.lua" once
--#include "data/functions/ActorEvent/EquipSlotStrong.lua" once
--#include "data/functions/ActorEvent/MailHandler.lua" once
--#include "data/functions/ActorEvent/EquipSlotSoul.lua" once
--#include "data/functions/ActorEvent/ResetPropertys.lua" once -- 脚本重置属性事件
--#include "data/functions/Activity/spring/spring_redpacket.lua" once -- 春节活动--红包
--#include "data/functions/Activity/spring/spring_login_gift.lua" once -- 春节活动--开门送礼
--#include "data/functions/Activity/spring/spring_monster.lua" once -- 春节活动--春节年兽
--#include "data/functions/Activity/spring/spring_goods.lua" once -- 春节活动--绝版年货
--#include "data/functions/Activity/spring/spring_pay.lua" once -- 春节活动--新春充值
--#include "data/functions/Activity/spring/spring_total.lua" once --春节活动 :限时抢购特惠礼包 ,集字有奖,鸿运当头 ,消费排行 (都写在一块好了)
--#include "data/functions/modules/spirit_fighter.lua" once -- 战灵系统
--#include "data/functions/modules/spirit_pet.lua" once -- 灵兽



--调用对应的事件函数，处理不同的事件，如角色升级等
--param sysarg:角色指针
--param eventId:事件id
--param args:对应的参数列表
function OnActorEvent(sysarg, eventId, ...)
  --print("eventID:"..eventId)
  if sysarg ~= nil then
    local var = Actor.getStaticVar(sysarg)
    if var ~= nil and var.days == nil then var.days = {} end
    if var ~= nil and var.newdays == nil then var.newdays = {} end
  end
  local ret = false
  local fnTable = EventCallDispatcher[eventId]
  if fnTable then 	  
	  for i = 1, #fnTable do
	    ret = fnTable[i](sysarg, arg)
	  end
  end
  return ret
end

--角色跨服登录限制
function OnCsActorLoginLmt()
--#ifdef _COMMON_SERVER_
	return true
--#else
	return false
--#endif
end


EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeScriptOfflineMsg, OnScriptOfflineMsgEvent)
EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeSpiritFighterOp, EventCallDispatcher.SpiritFighterOp) --战灵操作
EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeSpiritPetOp, EventCallDispatcher.SpiritPetOp) --灵兽操作


--#endif  //end of _ACTOR_EVENT_DISPATCHER_