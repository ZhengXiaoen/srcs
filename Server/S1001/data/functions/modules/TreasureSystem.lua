--#include "data\config\item\TreasureSystemCfg.lua" once

--index从1开始，在c++那里保存也是从1开始

--宝物系统
MisTreasureSystemHandle = function(sysarg,sysid,packet)

	local nCircle = Actor.getIntProperty(sysarg, PROP_ACTOR_CIRCLE)
	local nLevel = Actor.getIntProperty(sysarg, PROP_CREATURE_LEVEL)
	if nType~=0 then 
		if  nCircle<TreasureSystemCfg.needCircle then 
			return 
		end
		if nLevel<TreasureSystemCfg.needLevel then 
			return
		end
	end
	
	local nType = DataPack.readByte(packet)
	if nType==0 then --请求信息
		SendClientTreasureSystemInfo(sysarg)
	elseif nType==1 then --进阶
		handleBTreasure(sysarg,DataPack.readByte(packet))
	elseif nType==2 then --升级
		handleLevelUpTreasure(sysarg,DataPack.readByte(packet))
	elseif nType==3 then --出战
		Choose_TreasureChoose(sysarg,DataPack.readByte(packet))
	end
end
--	
--请求信息
SendClientTreasureSystemInfo = function(sysarg)
	----宝物1234，n阶，n级
	local var = Actor.getStaticVar(sysarg)
	
	local pack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sTreasureSystem)
	DataPack.writeByte(pack,0) --类型
	
	for i=1,#TreasureSystemCfg.treasuerInfo do 
		DataPack.writeByte(pack,Actor.getFabaoJieByIndex(sysarg,i))
		DataPack.writeInt(pack,Actor.getFabaoLevelByIndex(sysarg,i))
	end

	DataPack.writeByte(pack,Actor.getFabaoChoose(sysarg))	
	DataPack.flush(pack)
end

--选择出战
function Choose_TreasureChoose(sysarg,index)
	index =tonumber(index)
	if index<0 or index>#TreasureSystemCfg.treasuerInfo then 
		print("非法选择")
		return 
	end	
	if index ~=0 then 
		local var = Actor.getStaticVar(sysarg)
		local Jie = Actor.getFabaoJieByIndex(sysarg,index)
		if Jie==0 then 
			print("还没有激活,不能选择")
			return 
		end
	end
	
	Actor.setFabaoChoose(sysarg,index)
	
	--选择出战
	local pack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sTreasureSystem)
	DataPack.writeByte(pack,1) --类型
	DataPack.writeByte(pack,Actor.getFabaoChoose(sysarg))	
	DataPack.flush(pack)
end

--升阶 
function handleBTreasure(sysarg,index)
	index =tonumber(index)
	
	--排除非法输入
	if index<=0 or index>#TreasureSystemCfg.treasuerInfo then 
		print("非法选择")
		return 
	end
	
	local myJob = Actor.getIntProperty( sysarg, PROP_ACTOR_VOCATION )
	local Jie = Actor.getFabaoJieByIndex(sysarg,index)	
	
	local nextJieCfg = TreasureSystemCfg.treasuerInfo[index].classAttrs[myJob][Jie + 1]
	if nextJieCfg == nil then
		Actor.sendTipmsg(sysarg, "当前已是最大阶", ttFlyTip)
		return
	end
		
	if Jie==0 then 
		--背包有多少
		local hasItemCount = Actor.getItemCount(sysarg,TreasureSystemCfg.treasuerInfo[index].breakLevelNeedItem) 
		--需要扣除多少
		local needItemCount = TreasureSystemCfg.treasuerInfo[index].classConsumeCounts[1]
		
		if hasItemCount <needItemCount then
			Actor.sendTipmsg(sysarg, "所需激活物品不够", ttFlyTip)
			return 
		end			
		
		Actor.removeItem(sysarg, TreasureSystemCfg.treasuerInfo[index].breakLevelNeedItem, needItemCount, -1, -1, -1, "宝物激活", LogIds.treasureBrokeOrLevelup)
		Actor.sendTipmsg(sysarg, "激活成功", ttFlyTip)
		Jie=1
	else 
		--背包有多少
		local hasItemCount = Actor.getItemCount(sysarg,TreasureSystemCfg.treasuerInfo[index].breakLevelNeedItem) 
		--需要扣除多少
		local needItemCount = TreasureSystemCfg.treasuerInfo[index].classConsumeCounts[Jie+1]
		
		if hasItemCount <needItemCount then
			Actor.sendTipmsg(sysarg, "所需升阶物品不够", ttFlyTip)
			return 
		end		
		
		Actor.removeItem(sysarg, TreasureSystemCfg.treasuerInfo[index].breakLevelNeedItem, needItemCount, -1, -1, -1, "宝物升阶", LogIds.treasureBrokeOrLevelup)	
		Actor.sendTipmsg(sysarg, "升阶成功", ttFlyTip)
		Jie=1+Jie
	end

	Actor.setFabaoJieByIndex(sysarg,index,Jie)
	
	local Jie = Actor.getFabaoJieByIndex(sysarg,index)
	local Level = Actor.getFabaoLevelByIndex(sysarg,index)
	
	
	System.sendCommonLog(LogIds.treasureBroken,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),index,Jie-1,Jie,index.."宝物突破")
	
	local pack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sTreasureSystem)
	DataPack.writeByte(pack,2) --类型
	DataPack.writeByte(pack,index)	
	DataPack.writeByte(pack,Jie)
	DataPack.writeInt(pack,Level)
	DataPack.flush(pack)
	
	
	Actor.collectOperate(sysarg,0) -- 重新计算属性
	Actor.collectOperate(sysarg,1) -- 刷新外观
	
end

--升级
function handleLevelUpTreasure(sysarg,index)
	index =tonumber(index)
	
	--排除非法输入
	if index<=0 or index>#TreasureSystemCfg.treasuerInfo then 
		print("非法选择")
		return 
	end

	local var = Actor.getStaticVar(sysarg)

	local myJob = Actor.getIntProperty( sysarg, PROP_ACTOR_VOCATION )
	local Jie = Actor.getFabaoJieByIndex(sysarg,index)
	local Level = Actor.getFabaoLevelByIndex(sysarg,index)
	
	local hasItemCount =0
	if Jie==0 then --还没有激活
		Actor.sendTipmsg(sysarg,"请先激活",ttFlyTip)
		return 
	else

		local needBroke = 0
		local TopLevel = false
		for i=1,#TreasureSystemCfg.classMaxLevels do
			if Level==TreasureSystemCfg.classMaxLevels[i] then 
				needBroke = i+1
				if i==#TreasureSystemCfg.classMaxLevels then 
					TopLevel = true
				end
			end
		end
		if TopLevel ==true then 
			Actor.sendTipmsg(sysarg, "当前已是最高等级", ttFlyTip)
			return 
		end
		
		local nextLevelCfg = TreasureSystemCfg.treasuerInfo[index].levelAttrs[myJob][Level + 1]
		if nextLevelCfg == nil then
			Actor.sendTipmsg(sysarg, "当前已是最高等级", ttFlyTip)
			return 
		end
		
		--需要升阶
		if needBroke~=0 and needBroke==Jie+1 then 
			Actor.sendTipmsg(sysarg,"请先升阶",ttFlyTip)
			return 
		else --普通升级
			
			--背包有多少
			hasItemCount = Actor.getItemCount(sysarg,TreasureSystemCfg.levelUpNeedItem) 
			--print("hasItemCount="..hasItemCount)
			--需要扣除多少
			local needItemCount = TreasureSystemCfg.treasuerInfo[index].levelConsumeCounts[Level+1]
			
			if hasItemCount <needItemCount then
				Actor.sendTipmsg(sysarg, "所需升级物品不够", ttFlyTip)
				return 
			end		
			
			Actor.removeItem(sysarg, TreasureSystemCfg.levelUpNeedItem, needItemCount, -1, -1, -1, "宝物升级", LogIds.treasureBrokeOrLevelup)	
			Actor.sendTipmsg(sysarg, "升级成功", ttFlyTip)
			Level =Level+1
		end
	
	end	
	
	--Actor.setFabaoJieByIndex(sysarg,index,Jie)
	Actor.setFabaoLevelByIndex(sysarg,index,Level)
	
	
	--local Jie = Actor.getFabaoJieByIndex(sysarg,index)
	local Level = Actor.getFabaoLevelByIndex(sysarg,index)
	
	
	System.sendCommonLog(LogIds.treasureLevelUp,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),index,Level-1,Level,index.."宝物升级")
	
	local pack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sTreasureSystem)
	DataPack.writeByte(pack,2) --类型
	DataPack.writeByte(pack,index)	
	DataPack.writeByte(pack,Jie)
	DataPack.writeInt(pack,Level)
	DataPack.flush(pack)
	
	
	Actor.collectOperate(sysarg,0) -- 重新计算属性
	Actor.collectOperate(sysarg,1) -- 刷新外观
end


MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cTreasureSystem,MisTreasureSystemHandle)

--测试用的
function printTresureSystem(sysarg,index)
	index = tonumber(index)
	print("ooooooo:"..Actor.getFabaoJieByIndex(sysarg,index))
	print("ooooooo:"..Actor.getFabaoLevelByIndex(sysarg,index))
end