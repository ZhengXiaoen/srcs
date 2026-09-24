--#include "data\config\activity\LevelGrowthReward.lua" once

--下发获取人数
MiscsImplement.handleGetGiftNumOp = function (sysarg, msgid,packet)

	local netPack = DataPack.allocPacket(sysarg, 139, 94)
	
	--获取全局静态变量
	local Globalvar = System.getStaticVar()
	local ActorSvar = Actor.getStaticVar(sysarg)
	
	local GloballevelGiftBag = Globalvar.GlevelGiftBag
	local SvarGrowFlag = ActorSvar.levelGiftBag
	
	local myLevel = Actor.getIntProperty(sysarg, PROP_CREATURE_LEVEL)
	local myCircle = Actor.getIntProperty(sysarg,PROP_ACTOR_CIRCLE)
	
	if not SvarGrowFlag then ActorSvar.levelGiftBag = {} SvarGrowFlag = ActorSvar.levelGiftBag end
	if not GloballevelGiftBag then Globalvar.GlevelGiftBag = {} GloballevelGiftBag = Globalvar.GlevelGiftBag end
--	if GloballevelGiftBag and SvarGrowFlag then
		for index, value in ipairs(LevelGrowthReward) do
			if value.type == 0 then
				DataPack.writeByte(netPack,index)
				if GloballevelGiftBag[index] == nil then
					GloballevelGiftBag[index] = 0
				end
				DataPack.writeInt(netPack,GloballevelGiftBag[index])
				
				if SvarGrowFlag[index] == nil then
					SvarGrowFlag[index] = 0
				end
				
				if GloballevelGiftBag[index] >= value.MaxActorNum and value.MaxActorNum > -1 then --领取人数上限已满
					DataPack.writeByte(netPack,2)
				else
					if value.type == 0 and  myLevel < value.Require and myCircle == 0 then -- 等级还没达到
						DataPack.writeByte(netPack,2)
					elseif value.type == 1 and myCircle < value.Require then --转生还没达到
						DataPack.writeByte(netPack,2)
					elseif SvarGrowFlag[index] == 1 then
						DataPack.writeByte(netPack,1)
					else
						DataPack.writeByte(netPack,SvarGrowFlag[index])	--0 ： 可以领
					end
				end
			end
		end
--	end
	DataPack.flush(netPack)
end


--注册回调函数	
--EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeGetGiftNum, EventCallDispatcher.handleGetGiftNumOp)
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.sSendGetReceiveGift, MiscsImplement.handleGetGiftNumOp)