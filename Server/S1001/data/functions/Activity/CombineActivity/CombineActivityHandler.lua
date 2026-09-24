--lua script

--#include "MysiticShopOp.lua" once

--[[
local	cSendMysticItemList = 1,			--下发神秘商店的物品
local   cBuyMysticItemOp = 2,				--购买神秘商店的物品
local   cFreshMysticShop = 3,				--刷新神秘商店的物品
local   cGetCombineActivityAward = 4,		--领取合区的奖励
local   cGetCombineLevelAward = 5,			--领取合区等级达到奖励
local   cDrayCombineOp = 6,					--合区后提取元宝处理
]]

CombineActivityOpFuncList = {}

EventCallDispatcher.HandlerCombineActivityOp = function (sysarg, args)
 --print("参数："..args[1])
  if args[1] == nil then return end   
  local func = CombineActivityOpFuncList[args[1]]
  if func ~= nil then
    func(sysarg, args) 
  end
end

--下发神秘商店的物品
CombineActivityOpFuncList[1] = function (sysarg,args)
	SendCombineMysticItemOp(sysarg)
end

--购买神秘商店的物品
CombineActivityOpFuncList[2] = function (sysarg,args)
	OnBuyMysticItemOp(sysarg,args)
end

--刷新神秘商店的物品
CombineActivityOpFuncList[3] = function (sysarg,args)
	OnFreshMysticItemOp(sysarg,args)
end

--领取合区的奖励
CombineActivityOpFuncList[4] = function (sysarg,args)
	OnGetCombineActivityAward(sysarg,args)
end

--领取等级到达60级的合区奖励
CombineActivityOpFuncList[5] = function (sysarg,args)
	OnGetCombineLevelAward(sysarg,args)
end

--合区后提取元宝处理
CombineActivityOpFuncList[6] = function (sysarg,args)
	OnCombineDrayOp(sysarg,args)
end

--EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeCombineAcivity, EventCallDispatcher.HandlerCombineActivityOp)
