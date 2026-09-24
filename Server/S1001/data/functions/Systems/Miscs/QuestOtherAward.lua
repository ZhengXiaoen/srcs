--任务额外奖励
--#include "data\config\quest\QuestOtherAward.lua" once
local QuestAwardFun = {}
--送宝宝
QuestAwardFun[1] = function(sysarg,value)
	local QuestPet = {
		[278]={level=1,aiId=228,liveTime=0},
		[279]={level=1,aiId=228,liveTime=0},
		[280]={level=1,aiId=228,liveTime=0},
		[281]={level=1,aiId=228,liveTime=0},
	}

	if not QuestPet[value] then
		return
	end

	for petId,petInfo in pairs(QuestPet) do
		if Pet.getPetCountById(sysarg,petId) > 0 then
			return
		end
	end

	Pet.addPet(sysarg, value, QuestPet[value].level, QuestPet[value].aiId,  QuestPet[value].liveTime)
	Actor.sendTipmsg(sysarg,"恭喜你获得系统随机赠送的宝宝一只!",ttFlyTip)
end



function MiscsImplement.QuestOtherAward(sysarg, msgid,packet)
	local nQuestId = DataPack.readShort(packet)
	local nType = DataPack.readByte(packet)
	local nValue = DataPack.readShort(packet)

	local QuestAwardInfo
	local isVaildQuest = false
	for i =1,#QuestOtherAward do
		if nQuestId and nQuestId == QuestOtherAward[i].nQuestId then
			QuestAwardInfo = QuestOtherAward[i]
			for j = 1,#QuestAwardInfo.nAward do
				if nType and nType == QuestAwardInfo.nAward[j].type then
					isVaildQuest=true
				end
			end
		end
	end
	
	if not isVaildQuest then
		return
	end

	local myLevel = Actor.getIntProperty(sysarg, PROP_CREATURE_LEVEL)
	if myLevel <  QuestAwardInfo.nMinLevel or myLevel >= QuestAwardInfo.nMaxLevel then
		return
	end

	if QuestAwardFun[nType] then
		QuestAwardFun[nType](sysarg,nValue)
	end
end


--MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cGetQuestOtherAward,MiscsImplement.QuestOtherAward)