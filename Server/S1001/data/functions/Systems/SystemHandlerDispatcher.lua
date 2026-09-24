--#ifndef _SYSTEM_HANDLER_DISPATCHER_INCLIDED_ 
--#define _SYSTEM_HANDLER_DISPATCHER_INCLIDED_

--#include "SystemHandlerDispatcherImplement.lua" 

--#include "ShortCut\ShortCutSystem.lua" once                                          
--#include "NPCTrade\NPCTradeSystem.lua" once
--#include "NPCRepair\NpcRepairSystem.lua" once    
--#include "data\config\equipSynthesis\SpecialRingDamoCfg.lua" once
--#include "TimeReward\TimeRewardSystem.lua" once
--#include "Interactive\InteracteSystem.lua" once      
--#include "Miscs\MiscSystems.lua" once   
---#include "Archive\ArchiveSystem.lua" once
--#include "Archive\LuckyRollAwardHandler.lua" once
--#include "FightSystem\autoFightSystem.lua" once  
  --#include "SpaceCopyFunc.lua" once
  --#include "DeputyEventFunc.lua" once
  --#include "ShortcutsEventFunc.lua" once
	--#include "TimeReward\TimeMoneyRewardSystem.lua" once

--#include "GemSystem\GemSystem.lua" once
--#include "PaTaSystem\PaTaFuben.lua" once

--#include "CrossServerSystem\SystemHandler.lua" once
--#include "ActivitySystem\ActivityHandle.lua" once
--#include "Miscs\MisSystemEx.lua" once   


--[[
    将默认的系统消息处理分派插入到通知表中 
]]

EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeOnClientData, SystemHandlerDispatcher.dispatcher)

--#endif //end of _SYSTEM_HANDLER_DISPATCHER_INCLIDED_