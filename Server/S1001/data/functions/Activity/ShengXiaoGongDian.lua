--#include "data\config\activity\ShengXiaoGongDianCfg.lua" once
--进入生肖宫殿
HandleShengXiaoGongDian = function(sysarg,sysid,packet)
    local nType = DataPack.readByte(packet) 
	if nType ==0 then 	--得到信息
		SendShengXiaoGongDianInfo(sysarg)
	elseif nType==1 then --选择勾选
		ChooseShengXiaoGongDian(sysarg,DataPack.readByte(packet))
	elseif nType==2 then --随机进入小地图
		EnterShengXiaoGongDian(sysarg)
	elseif nType==3 then --返回大厅
		Actor.enterScene(sysarg,564 ,ShengXiaoGongDianCfg.ScenePoint.centerPoint[1],ShengXiaoGongDianCfg.ScenePoint.centerPoint[2])
		Actor.deleteTimer(sysarg,53)
		RemindClientToChangeTimer(sysarg,0)
	elseif nType==4 then --退出地图	
		Actor.returnCity(sysarg)
	end
end

--发送是否勾选的信息
SendShengXiaoGongDianInfo = function(sysarg)
    local pack = DataPack.allocPacket(sysarg,151,44)
	local dVar = Actor.getDyanmicVar(sysarg)
	DataPack.writeByte(pack,0) --消息类型0
	if dVar.isChoose_shengxiaogongdian ==nil or dVar.isChoose_shengxiaogongdian==0 then 
		--print("0")
	    DataPack.writeByte(pack,0)
	else 
		DataPack.writeByte(pack,1)
		--print("1")
	end
	
	--今天初始化时间
	local var = Actor.getStaticVar(sysarg)
	if var.newdays.sxgdTime==nil then 
		var.newdays.sxgdTime = ShengXiaoGongDianCfg.freeGiveTime
	end 
	if var.newdays.sxgdTime<0 then 
		var.newdays.sxgdTime = 0 
	end
	--print("var.newdays.sxgdTime="..var.newdays.sxgdTime)
	DataPack.writeUInt(pack,var.newdays.sxgdTime)
	--print("var.newdays.sxgdTime="..var.newdays.sxgdTime)
    DataPack.flush(pack)

end

--是否勾选
ChooseShengXiaoGongDian  = function(sysarg,isChoose)
	isChoose = tonumber(isChoose)
	local dVar = Actor.getDyanmicVar(sysarg)
	dVar.isChoose_shengxiaogongdian = isChoose
	SendShengXiaoGongDianInfo(sysarg)
end

--进入生肖宫殿
EnterShengXiaoGongDian = function(sysarg)
	
	--判断进入元宝是否足够
	if Actor.getMoneyCount(sysarg,3) < ShengXiaoGongDianCfg.enterNeedYB then
		Actor.sendTipmsg(sysarg,"元宝不足",ttFlyTip)
		return 
	end
    
	--是否勾选
	local dVar = Actor.getDyanmicVar(sysarg)
	if dVar.isChoose_shengxiaogongdian ==nil then 
		dVar.isChoose_shengxiaogongdian=0
	end
	
	local var = Actor.getStaticVar(sysarg)
	--今天初始化时间
	if var.newdays.sxgdTime==nil then 
		var.newdays.sxgdTime = ShengXiaoGongDianCfg.freeGiveTime
	end 
	
	local randNumber = System.getRandomNumber(12)+1 --产生1~s的
	if dVar.randNumberInSXGD~=nil then 
		while randNumber==dVar.randNumberInSXGD do 
			randNumber = System.getRandomNumber(12)+1
		end
	end
	dVar.randNumberInSXGD = randNumber
	
	local cgf = ShengXiaoGongDianCfg.ScenePoint.roomPoint[randNumber]
	local roomName  = cgf[3]
	
	--时间大于0，可以直接进入房间
	if var.newdays.sxgdTime>0 then
		dVar.SXGD_calTime=0 --把房间里面的计时器设置为0
		dVar.SXGD_calYb=0 --把房间元宝计算器设置为0
		Actor.enterScene(sysarg,564 ,cgf[1],cgf[2])
		
	else --时间小于0
		if dVar.isChoose_shengxiaogongdian ==0 then --没够勾选
			Actor.sendTipmsg(sysarg,"您的时间为0 ,请勾选自动续费方可进入",ttFlyTip)
			return 
		else --勾选了
			----判断进入元宝是否足够呆上一次
			--if Actor.getMoneyCount(sysarg,3) < ShengXiaoGongDianCfg.enterNeedYB+ShengXiaoGongDianCfg.BuyTheTime[2] then
			--	Actor.sendTipmsg(sysarg,"元宝不足",ttFlyTip)
			--	return 
			--end
			dVar.SXGD_calTime=0 --把房间里面的计时器设置为0
			dVar.SXGD_calYb=0 --把房间元宝计算器设置为0
			Actor.enterScene(sysarg,564 ,cgf[1],cgf[2])
		end
	end
	
	--扣钱
	Actor.changeMoney( sysarg, 3, -ShengXiaoGongDianCfg.enterNeedYB, LogIds.entershenxiaogongdian, "进入生肖宫殿房间")
	--加定时器
	Actor.addTimer(sysarg,53,1000)
	RemindClientToChangeTimer(sysarg,1) --开始计算
	
	local playerList = LuaHelp.getSceneActorListById(564)
	if playerList ~= nil then 
		for i, v in ipairs(playerList) do
			if v~=nil then 
				Actor.sendTipmsg(v,string.format("<(n%s)>玩家飞入%s地图",Actor.getName(sysarg),roomName),ttChatWindow)
			end
		end
	end
end

--提醒前端关定时器
function RemindClientToChangeTimer(sysarg,types)
	types = tonumber(types)
	local pack = DataPack.allocPacket(sysarg,151,44)
	local dVar = Actor.getDyanmicVar(sysarg)
	DataPack.writeByte(pack,1) --消息类型告诉前端，是否需要知道开启定时器
	DataPack.writeByte(pack,types)
	DataPack.flush(pack)
	
	--发送勾选情况给前端
	if types==0 then 
		local dVar = Actor.getDyanmicVar(sysarg)
		dVar.isChoose_shengxiaogongdian = 0
		SendShengXiaoGongDianInfo(sysarg)
	end
end

--function changeTime(sysarg)
--	local var = Actor.getStaticVar(sysarg)
--	var.newdays.sxgdTime = 60;
--end

MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cShengXiaoGongDian,HandleShengXiaoGongDian)