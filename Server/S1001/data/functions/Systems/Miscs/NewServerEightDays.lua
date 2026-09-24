--新区八天
--#include "data\language\LangCode.txt" once
--#include "data\config\activityconfig\OpenServerTenDays\OpenServerConfig.lua" once

--获取处理
MiscsImplement.GetNewServerEightDaysHandle = function( sysarg, msgid, packet )
	local nIndex = DataPack.readByte(packet)
	sendTopicDayRankInfo(sysarg,nIndex)
end

function sendOnlineTopicDayRankInfo(nDays)
	local players = LuaHelp.getAllActorList();
	if players then	
		for k, v in ipairs(players) do
			sendTopicDayRankInfo(v,nDays)
		end
	end
end

function sendTopicDayRankInfo(sysarg,nIndex)	
	if nIndex <= 0 or nIndex > 4 then 
		return
	end
	
	local var = System.getStaticVar()

	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sSendNewServerEightDaysInfo)
	if nIndex == 1 then
		if not var.TopLevel then
			var.TopLevel = {}
			for i = 1,3 do
				var.TopLevel[i] = {}
				for j = 1,4 do
					var.TopLevel[i][j] = {}
				end
			end
		end
		
		DataPack.writeByte(netPack, nIndex)
		DataPack.writeByte(netPack, 9)
		for i = 1,3 do
			for j = 1, 3 do
				if not var.TopLevel[i][j].id then
					DataPack.writeString(netPack, "")
					DataPack.writeByte(netPack, 0)
					DataPack.writeByte(netPack, 0)
				else
					DataPack.writeString(netPack, var.TopLevel[i][j].name)
					DataPack.writeByte(netPack, var.TopLevel[i][j].circle)
					DataPack.writeByte(netPack, var.TopLevel[i][j].level)
				end
			end
		end
	elseif nIndex == 2 then
		if not var.TopChop then
			var.TopChop = {}
			for i = 1,4 do
				var.TopChop[i] = {actorid=0,name="",value=0}
			end
		end
		
		DataPack.writeByte(netPack, nIndex)
		DataPack.writeByte(netPack, 3)
		for i = 1, 3 do
			if var.TopChop[i] == nil or var.TopChop[i].actorid == nil then
				DataPack.writeString(netPack, "")
				DataPack.writeByte(netPack, 0)
				DataPack.writeInt(netPack, 0)
			else
				DataPack.writeString(netPack, var.TopChop[i].name)
				DataPack.writeByte(netPack, var.TopChop[i].value)
				DataPack.writeInt(netPack, 0)
			end
		end
	elseif nIndex == 3 then
		if not var.TopMount then
			var.TopMount = {}
			for i = 1,4 do
				var.TopMount[i] = {actorid=0,name="",ridelevel=0,rideExp=0}
			end
		end
		
		DataPack.writeByte(netPack, nIndex)
		DataPack.writeByte(netPack, 3)
		for i = 1, 3 do			
			if var.TopMount[i] == nil or var.TopMount[i].actorid == nil then
				DataPack.writeString(netPack, "")
				DataPack.writeByte(netPack, 0)
				DataPack.writeInt(netPack, 0)
			else
				DataPack.writeString(netPack, var.TopMount[i].name)
				DataPack.writeByte(netPack, var.TopMount[i].ridelevel)
				DataPack.writeInt(netPack, var.TopMount[i].rideExp)
			end
		end
	elseif nIndex == 4 then
		if not var.TopSwing then
			var.TopSwing = {}
			for i = 1,4 do
				var.TopSwing[i] = {actorid=0,name="",swingLevel=0,swingExp=0}
			end
		end
		
		DataPack.writeByte(netPack, nIndex)
		DataPack.writeByte(netPack, 3)
		for i = 1, 3 do
			if var.TopSwing[i] == nil or var.TopSwing[i].actorid == nil then
				DataPack.writeString(netPack, "")
				DataPack.writeByte(netPack, 0)
				DataPack.writeInt(netPack, 0)
				
			else
				DataPack.writeString(netPack, var.TopSwing[i].name)
				DataPack.writeByte(netPack, var.TopSwing[i].swingLevel)
				DataPack.writeInt(netPack, var.TopSwing[i].swingExp)
			end
		end
	end	
	DataPack.flush(netPack)
end

function ClearTenDaysActivity(nDays)
	local var = System.getStaticVar()
	if nDays >= 2 then 
		var.NewServerTopWeapon = {}
		var.NewServerTopWeapon[1] = {}
		var.NewServerTopWeapon[2] = {}
	end
	if nDays >= 3 then
		var.TopMount = {}
	end

	if nDays >= 4 then
		var.TopSwing = {}
	end

	if nDays >= 5 then
		var.TopGuild = nil
	end
	
	if nDays >= 6 then
		var.TopMagicEquip = {}
	end
	if nDays >= 7 then
		var.TopMercenar = {}
	end
	if nDays >= 8 then
		var.TopVip = {}
	end
end

MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cGetNewServerEightDaysInfo, MiscsImplement.GetNewServerEightDaysHandle)