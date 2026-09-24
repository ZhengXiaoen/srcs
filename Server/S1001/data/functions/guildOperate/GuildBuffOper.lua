--lua script
--#include "data\language\LangCode.txt" once --语言包 
--#include "data\config\guild\GuildBuff.lua" once 
--#include "GuildOnTimeFuc.lua" once	--测试用

--开启光环
function OnOpenGuildBuffOp(sysarg,args)
	local nId = args[2]

	if nId == nil then return end

	local nNum = table.getn(GuildBuff.buffList)

	if (nId > nNum) or (nId < 1) then return end

	local gCoin = Actor.getGuildCoin(sysarg)

	if gCoin < GuildBuff.buffList[nId].needGuildCoin then
		--local tipmsg= string.format(Lang.GuildLang.x00074,nNeedGrid) --通知用户，需要空出多少个空格
		Actor.sendTipmsg( sysarg, Lang.GuildLang.z00050,ttFlyTip )
		return
	end
	
	local nPos = Actor.getGuildPos(sysarg)
	if nPos ~= 2 and nPos~= 3 then
		Actor.sendTipmsg( sysarg, Lang.GuildLang.z00109,ttFlyTip )
		return
	end

	Actor.changeGuildCoin(sysarg,-GuildBuff.buffList[nId].needGuildCoin)	--扣除行会资金
	
	local ItemTable = GuildBuff.buffList[nId].buffAre

	--添加行会buff
	Actor.addGuildBuff(sysarg,ItemTable.buffType,ItemTable.buffGroup, ItemTable.value, ItemTable.times, ItemTable.interval, ItemTable.buffName, ItemTable.timeOverlay)

	Actor.sendGuildMsg(sysarg,0,string.format(Lang.GuildLang.b00013,ItemTable.buffName),2+128)
end

--开启行会级别buff
function OnOpenGuildLevelBuffOp(sysarg,args)
	local nId = args[2]

	if nId == nil then return end

	local nNum = table.getn(GuildBuff)

	if (nId > nNum) or (nId < 1) then return end
	
	local ItemTable = GuildBuff[nId]

	Actor.sendGuildMsg(sysarg,0,string.format(Lang.GuildLang.b00013,"等级"..nId.."的BUFF"),2+128)	
	for i=1,#ItemTable do
		Actor.addGuildBuff(sysarg,ItemTable[i].buffType,ItemTable[i].buffGroup, ItemTable[i].value, ItemTable[i].times, ItemTable[i].interval, ItemTable[i].buffName, ItemTable[i].timeOverlay)
	end
end

--成员退出帮会
function LeftGuildLevelBuffCl(sysarg,args)
	local nId = args[2]
	if nId == nil then return end
	local nNum = table.getn(GuildBuff)
	if (nId > nNum) or (nId < 1) then return end	
	local ItemTable = GuildBuff[nId]	
	for i=1,#ItemTable do
		Actor.delBuff(sysarg,ItemTable[i].buffType,ItemTable[i].buffGroup)
	end
end

--成员加入帮会
function JoinGuildLevelBuffOp(sysarg,args)
	local nId = args[2]
	if nId == nil then return end
	local nNum = table.getn(GuildBuff)
	if (nId > nNum) or (nId < 1) then return end	
	local ItemTable = GuildBuff[nId]
	for i=1,#ItemTable do
		Actor.addBuff(sysarg,ItemTable[i].buffType,ItemTable[i].buffGroup, ItemTable[i].value, ItemTable[i].times, ItemTable[i].interval, ItemTable[i].buffName, ItemTable[i].timeOverlay)
	end 
end

--下发语音聊天频道信息
function OnSendGuildChannelInfo(sysarg,args)
	if System.isCrossServer() == true then return end
	local nCount = table.getn(GuildConfig.guildChat)
	
	if nCount <= 0 then return end

	local pack = DataPack.allocPacket(sysarg, 10, 46)

	if (pack ~= nil) then
		DataPack.writeInt(pack,nCount)

		for i=1,nCount do
			DataPack.writeChar(pack,GuildConfig.guildChat[i].gType)
			DataPack.writeString(pack,GuildConfig.guildChat[i].chatName)
			DataPack.writeString(pack,GuildConfig.guildChat[i].DownloadAddressD)
			DataPack.writeString(pack,GuildConfig.guildChat[i].LickAddress)
		end

		DataPack.flush(pack)
	end

end

--下发沙巴克基本信息
function OnSendSbkMsgInfo(sysarg,args)
	--if Guild.getSbkCityOwner()<= 0 then return end
	local sbkPosCfg = GuildSiegeConfig.AwardSbkPostion
	local nCount = table.getn(sbkPosCfg)

	if nCount <= 0 then return end

	local netPack = DataPack.allocPacket(sysarg, 10, 51)
	if netPack then
		local nGuildName = Guild.getGuildName(Guild.getSbkCityOwnerGuildId())
		if not nGuildName then
			nGuildName = ""
		end
		DataPack.writeString(netPack, nGuildName)
		DataPack.writeInt(netPack, nCount)
		for i, tab in ipairs(sbkPosCfg) do
			DataPack.writeByte(netPack, i)
			local nName = System.getSbkPostionName(i)
			if not nName then
				nName = ""
			end

			DataPack.writeString(netPack,nName)
			DataPack.writeByte(netPack, tab.itemNum)
			DataPack.writeUInt(netPack, 0)   --玩家id
			DataPack.writeByte(netPack, 1)	 --职业
			DataPack.writeByte(netPack, 0)	 --性别
			DataPack.writeInt(netPack, 11)   --模型id
			DataPack.writeInt(netPack, 12)	 --武器外观
			DataPack.writeInt(netPack, 13)   --翅膀外观
			DataPack.writeWord(netPack, 15)  --头像
		end
		DataPack.writeUInt(netPack, System.getSBKRevenue())
		DataPack.writeByte(netPack, System.getfSbkReceive())
		DataPack.writeByte(netPack, System.getffSbkReceive())
		DataPack.flush(netPack)
	end
end

--获取沙巴克福利
function OnGetSbkWeal(sysarg,args)
	local nSbkPos = args[2]
	
	local nCount = table.getn(GuildSiegeConfig.AwardSbkPostion)
	if nSbkPos > 0 and nSbkPos <=  nCount then

		local avar = Actor.getStaticVar(sysarg)

		if avar.days.mygetSbkWealState == nil then
			avar.days.mygetSbkWealState = 0
		end

		if avar.days.mygetSbkWealState == 1 then
			Actor.sendTipmsg( sysarg, Lang.GuildLang.z00079,ttFlyTip )
			return
		end
		
		local var = System.getStaticVar()
		
		if var.getSbkWealState == nil then
			var.getSbkWealState = {}
		end

		if var.getSbkWealState[nSbkPos] == nil then
			var.getSbkWealState[nSbkPos] = 0
		end 
		
		if var.getSbkWealState[nSbkPos] == 1 then
			Actor.sendTipmsg( sysarg, Lang.GuildLang.z00078,ttFlyTip )
			return
		end

		local itemID = GuildSiegeConfig.AwardSbkPostion[nSbkPos].itemId
		local itemQuality = 0
		local itemStrong = 0
		local itemCount =GuildSiegeConfig.AwardSbkPostion[nSbkPos].itemNum
		local itemName = Item.getItemName(itemID) or ""
		local itemBind = GuildSiegeConfig.AwardSbkPostion[nSbkPos].itemBind

		--背包不够
		local nGridCount= Item.getBagEmptyGridCount(sysarg)
		local nNeedGrid = Item.getAddItemNeedGridCount(sysarg,itemID,itemCount,itemQuality, itemStrong)
		if(nNeedGrid > nGridCount) then
			local tipmsg= string.format(Lang.ScriptTips.x00074,nNeedGrid) --通知用户，需要空出多少个空格
			Actor.sendTipmsg( sysarg, tipmsg,ttFlyTip )
			return
		end
		
		var.getSbkWealState[nSbkPos] = 1
		avar.days.mygetSbkWealState = 1
		Actor.addItem(sysarg,itemID,itemQuality,itemStrong,itemCount,itemBind,0,"沙巴克福利",1)
	end
end

