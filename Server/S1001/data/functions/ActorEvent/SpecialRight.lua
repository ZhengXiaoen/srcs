--#include "data\functions\SpecialTitle.lua" once --特权
--#include "data\config\SpecialTitleCfg.lua" once
function isEnoughtMoney(sysarg,types)
	types=tonumber(types)
	local myYb = Actor.getIntProperty( sysarg, PROP_ACTOR_YUANBAO)
	local needYB = SpecialTitleCfg.allBuyMoney
	if types~=4 then
		needYB=SpecialTitleCfg.title[types].money
	end
	--print("needYB="..needYB)
	--print("myYb="..myYb)
	if needYB>myYb then 
		Actor.sendTipmsg(sysarg, "没有足够的元宝", ttFlyTip);
		return false
	end
	if Actor.changeMoney(sysarg, 3, -needYB, 2641, "SpecialRight") then 
		return true
	end
end



--前端获取信息
function GetSpecialRightInfo(sysarg, sysid, packet)
	SendTheInfo(sysarg)
end

----前端购买
function BuySpecialRight(sysarg, sysid,packet)
	local TypeID = DataPack.readByte(packet)
	--local TypeID =tonumber(sysid)
	local var = Actor.getStaticVar(sysarg)
	if var.specialRight==nil then var.specialRight={} end
	
	local addTimes =2592000
	
	if TypeID == 1 then 
		--收钱，判断，各种什么的给奖励
		if isEnoughtMoney(sysarg,1) == false then 
			return 
		end
		AddSpecialTitleTime(sysarg,1,addTimes)
		
		local actorID = Actor.getIntProperty(sysarg, PROP_ENTITY_ID);
		-- 首次购买给 48个格子和奖励, 非首次购买则只给奖励
		if var.specialRight[1]==nil then 
			System.AddMail(actorID, 0, 0, "黄铜特权购买奖励", "尊敬的玩家您好,\\\\您购买了黄铜特权。开启了"..SpecialTitleCfg.depotgridcount.."个仓库格子");
			var.specialRight[1]=1
			--赠送格子
			local nCount = Actor.getUserDepotGridCount(sysarg)
			Actor.setUserDepotGridCount(sysarg,nCount + SpecialTitleCfg.depotgridcount)
			var.isGiveDepotGrid = true
		end 
        	
       	-- 给奖励
        local awardCfg = SpecialTitleCfg.title[1].AwardCfg
		local strAward = string.format("%d,%d,%d", awardCfg[2].id, awardCfg[2].count, awardCfg[2].bind)
		System.AddMail(actorID,6,0,"黄铜特权购买奖励","尊敬的玩家您好,\\\\您购买了黄铜特权。可获得堕天使之魂*1",0,0,strAward)
		
		if var.days.EDspecialR1==nil then 
			local strAward = ""..SpecialTitleCfg.title[1].EveryDayAwardCfg[1].id..","..SpecialTitleCfg.title[1].EveryDayAwardCfg[1].count..","..SpecialTitleCfg.title[1].EveryDayAwardCfg[1].bind
			System.AddMail(actorID,6,0,"黄铜特权每日奖励","尊敬的玩家您好,\\\\您购买的黄铜特权每日免费奖励。可获得"..SpecialTitleCfg.title[1].EveryDayAwardCfg[1].name.."*"..SpecialTitleCfg.title[1].EveryDayAwardCfg[1].count,0,0,strAward)	
			var.days.EDspecialR1=1
		end		
		System.broadcastTipmsg(string.format("%s购买了%s,每日可免费领取丰厚奖励<我也要购买/@@showWin,187>",Actor.getName(sysarg),"黄铜特权"), ttChatWindow)
	elseif  TypeID == 2 then
		if isEnoughtMoney(sysarg,2)==false then
			return
		end

		GuildXiangYaoChuMoRemaining(sysarg)
		AddSpecialTitleTime(sysarg,2,addTimes)
		Quest_ShuaXin(sysarg)
		
		local actorID = Actor.getIntProperty(sysarg, PROP_ENTITY_ID);
		-- 不分是否首次购买了
		if var.specialRight[2]==nil then 		
			var.specialRight[2]=1			
		end
		
		-- 给奖励
		local awardCfg = SpecialTitleCfg.title[2].AwardCfg
		local strAward = string.format("%d,%d,%d", awardCfg[1].id, awardCfg[1].count, awardCfg[1].bind)
		strAward = strAward .. string.format("/%d,%d,%d", awardCfg[2].id, awardCfg[2].count, awardCfg[2].bind)		
		System.AddMail(actorID,6,0,"白银特权购买奖励","尊敬的玩家您好,\\\\您购买了白银特权。可获得战天使之魂*1,血影冥光魂*1",0,0,strAward)
		
		if var.days.EDspecialR2==nil then 
			local strAward = ""..SpecialTitleCfg.title[2].EveryDayAwardCfg[1].id..","..SpecialTitleCfg.title[2].EveryDayAwardCfg[1].count..","..SpecialTitleCfg.title[2].EveryDayAwardCfg[1].bind
			System.AddMail(actorID,6,0,"白银特权每日奖励","尊敬的玩家您好,\\\\您购买的白银特权每日免费奖励。可获得"..SpecialTitleCfg.title[2].EveryDayAwardCfg[1].name.."*"..SpecialTitleCfg.title[2].EveryDayAwardCfg[1].count,0,0,strAward)
			var.days.EDspecialR2=1
		end
		System.broadcastTipmsg(string.format("%s购买了%s,每日可免费领取丰厚奖励<我也要购买/@@showWin,187>",Actor.getName(sysarg),"白银特权"), ttChatWindow)
	elseif  TypeID == 3 then 
		if isEnoughtMoney(sysarg,3) == false then 
			return 
		end
		AddSpecialTitleTime(sysarg,3,addTimes)
		
		local actorID = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
		-- 不分是否首次购买了
		if var.specialRight[3]==nil then 			
			var.specialRight[3]=1
		end 
			
		-- 给奖励
		local awardCfg = SpecialTitleCfg.title[3].AwardCfg
		local strAward = string.format("%d,%d,%d", awardCfg[1].id, awardCfg[1].count, awardCfg[1].bind)
		strAward = strAward .. string.format("/%d,%d,%d", awardCfg[2].id, awardCfg[2].count, awardCfg[2].bind)
		strAward = strAward .. string.format("/%d,%d,%d", awardCfg[3].id, awardCfg[3].count, awardCfg[3].bind)			
		System.AddMail(actorID,6,0,"黄金特权购买奖励","尊敬的玩家您好,\\\\您购买的黄金特权。可获得光芒天照灵*1,烈焰火之魂*1,金轮仙之魂*1",0,0,strAward)
		
		if var.days.EDspecialR3==nil then 
			local strAward = ""..SpecialTitleCfg.title[3].EveryDayAwardCfg[1].id..","..SpecialTitleCfg.title[3].EveryDayAwardCfg[1].count..","..SpecialTitleCfg.title[3].EveryDayAwardCfg[1].bind
			System.AddMail(actorID,6,0,"黄金特权每日奖励","尊敬的玩家您好,\\\\您购买的黄金特权每日免费奖励。可获得"..SpecialTitleCfg.title[3].EveryDayAwardCfg[1].name.."*"..SpecialTitleCfg.title[3].EveryDayAwardCfg[1].count,0,0,strAward)
			var.days.EDspecialR3=1
		end
		System.broadcastTipmsg(string.format("%s购买了%s,每日可免费领取丰厚奖励<我也要购买/@@showWin,187>",Actor.getName(sysarg),"黄金特权"), ttChatWindow)
	elseif  TypeID == 4 then
       
		if isEnoughtMoney(sysarg,4) == false then
			return
		end

		GuildXiangYaoChuMoRemaining(sysarg)
		AddSpecialTitleTime(sysarg,1,addTimes)
		AddSpecialTitleTime(sysarg,2,addTimes)
		AddSpecialTitleTime(sysarg,3,addTimes)
		Quest_ShuaXin(sysarg)
        --格子奖励2017.5.23
        if var.isGiveDepotGrid == nil then
             local nCount = Actor.getUserDepotGridCount(sysarg)
		    Actor.setUserDepotGridCount(sysarg,nCount + SpecialTitleCfg.depotgridcount)
		    var.isGiveDepotGrid = true
            System.AddMail(actorID, 0, 0, "黄铜特权购买奖励", "尊敬的玩家您好,\\\\您购买了黄铜特权。开启了"..SpecialTitleCfg.depotgridcount.."个仓库格子");
        end

		--购买奖励+每日奖励一起给了
		local actorID = Actor.getIntProperty(sysarg, PROP_ENTITY_ID);
		if var.specialRight[1]==nil then 
			System.AddMail(actorID, 0, 0, "黄铜特权购买奖励", "尊敬的玩家您好,\\\\您购买了黄铜特权。开启了"..SpecialTitleCfg.depotgridcount.."个仓库格子");
			var.specialRight[1]=1
		end 
		
		-- 给奖励1
		local awardCfg = SpecialTitleCfg.title[1].AwardCfg
		local strAward = string.format("%d,%d,%d", awardCfg[2].id, awardCfg[2].count, awardCfg[2].bind)
		System.AddMail(actorID,6,0,"黄铜特权购买奖励","尊敬的玩家您好,\\\\您购买了黄铜特权。可获得堕天使之魂*1",0,0,strAward)
        	
		if var.days.EDspecialR1==nil then 
			local strAward = ""..SpecialTitleCfg.title[1].EveryDayAwardCfg[1].id..","..SpecialTitleCfg.title[1].EveryDayAwardCfg[1].count..","..SpecialTitleCfg.title[1].EveryDayAwardCfg[1].bind
			System.AddMail(actorID,6,0,"黄铜特权每日奖励","尊敬的玩家您好,\\\\您购买的黄铜特权每日免费奖励。可获得"..SpecialTitleCfg.title[1].EveryDayAwardCfg[1].name.."*"..SpecialTitleCfg.title[1].EveryDayAwardCfg[1].count,0,0,strAward)
			var.days.EDspecialR1=1
		end		
		
		if var.specialRight[2]==nil then 
			var.specialRight[2]=1
		end
		
		-- 给奖励2
		awardCfg = SpecialTitleCfg.title[2].AwardCfg
		strAward = string.format("%d,%d,%d", awardCfg[1].id, awardCfg[1].count, awardCfg[1].bind)
		strAward = strAward .. string.format("/%d,%d,%d", awardCfg[2].id, awardCfg[2].count, awardCfg[2].bind)		
		System.AddMail(actorID,6,0,"白银特权购买奖励","尊敬的玩家您好,\\\\您购买了白银特权。可获得战天使之魂*1,血影冥光魂*1",0,0,strAward)
				
		if var.days.EDspecialR2==nil then 
			local strAward = ""..SpecialTitleCfg.title[2].EveryDayAwardCfg[1].id..","..SpecialTitleCfg.title[2].EveryDayAwardCfg[1].count..","..SpecialTitleCfg.title[2].EveryDayAwardCfg[1].bind
			System.AddMail(actorID,6,0,"白银特权每日奖励","尊敬的玩家您好,\\\\您购买的白银特权每日免费奖励。可获得"..SpecialTitleCfg.title[2].EveryDayAwardCfg[1].name.."*"..SpecialTitleCfg.title[2].EveryDayAwardCfg[1].count,0,0,strAward)
			var.days.EDspecialR2=1
		end
		
		if var.specialRight[3]==nil then 	
			var.specialRight[3]=1			
		end
		
		-- 给奖励3
		local awardCfg = SpecialTitleCfg.title[3].AwardCfg
		local strAward = string.format("%d,%d,%d", awardCfg[1].id, awardCfg[1].count, awardCfg[1].bind)
		strAward = strAward .. string.format("/%d,%d,%d", awardCfg[2].id, awardCfg[2].count, awardCfg[2].bind)
		strAward = strAward .. string.format("/%d,%d,%d", awardCfg[3].id, awardCfg[3].count, awardCfg[3].bind)			
		System.AddMail(actorID,6,0,"黄金特权购买奖励","尊敬的玩家您好,\\\\您购买的黄金特权。可获得光芒天照灵*1,烈焰火之魂*1,金轮仙之魂*1",0,0,strAward)
		
		if var.days.EDspecialR3==nil then 
			local strAward = ""..SpecialTitleCfg.title[3].EveryDayAwardCfg[1].id..","..SpecialTitleCfg.title[3].EveryDayAwardCfg[1].count..","..SpecialTitleCfg.title[3].EveryDayAwardCfg[1].bind
			System.AddMail(actorID,6,0,"黄金特权每日奖励","尊敬的玩家您好,\\\\您购买的黄金特权每日免费奖励。可获得"..SpecialTitleCfg.title[3].EveryDayAwardCfg[1].name.."*"..SpecialTitleCfg.title[3].EveryDayAwardCfg[1].count,0,0,strAward)
			var.days.EDspecialR3=1
		end
		
		
		System.broadcastTipmsg(string.format("<(n%s)>一次性购买了<全部特权/@@showWin,187>,享受了折扣价并可每日可免费领取丰厚奖励以及特权:个人副本一键通关,个人副本<3>倍领取打<8>折,杀怪经验增加<20％>,死亡掉落装备机率降低<20％>,炼狱获得经验增加<10％>,每日押镖奖励按原<4次>合并发放,行会除魔奖励按原<8次>合并发放,享受自动回收装备功能(装备回收或随身回收处开启).<我也要购买/@@showWin,187>",Actor.getName(sysarg)), ttChatWindow)
		System.broadcastTipmsg(string.format("<(n%s)>玩家财大气粗一次性购买了全部特权,从此享受多项福利,荣获各种特权,从此走上人生巅峰",Actor.getName(sysarg)), ttScreenCenter)
	else 
		return 
	end
	
	--如果3个称号都有，那就给称号
	if IsSpeciaTitleVipAll(sysarg) == true then 
		--print("得到称号")
		Actor.setTopTitle(sysarg,SpecialTitleCfg.headtitleid,true)
	end
	
	local myJob = Actor.getIntProperty( sysarg, PROP_ACTOR_VOCATION )
			
	--添加buff
	if IsSpeciaTitleVip(sysarg,1)==true then 
		for i=1,#SpecialTitleCfg.title[1].buffid do 
			if Actor.hasBuffById(sysarg,SpecialTitleCfg.title[1].buffid[i])== false then --没有这个buff就添加上
				Actor.addBuffById(sysarg,SpecialTitleCfg.title[1].buffid[i])
			end
		end
		
		if Actor.hasBuffById(sysarg,SpecialTitleCfg.title[1].buffid2[myJob])== false then --没有这个buff就添加上
			Actor.addBuffById(sysarg,SpecialTitleCfg.title[1].buffid2[myJob])
		end	
	end
	if IsSpeciaTitleVip(sysarg,2)==true then 
		for i=1,#SpecialTitleCfg.title[2].buffid do 
			if Actor.hasBuffById(sysarg,SpecialTitleCfg.title[2].buffid[i])== false then --没有这个buff就添加上
				Actor.addBuffById(sysarg,SpecialTitleCfg.title[2].buffid[i])
			end
		end
		if Actor.hasBuffById(sysarg,SpecialTitleCfg.title[2].buffid2[myJob])== false then --没有这个buff就添加上
			Actor.addBuffById(sysarg,SpecialTitleCfg.title[2].buffid2[myJob])
		end	
		
	end
	if IsSpeciaTitleVip(sysarg,3)==true then 
		for i=1,#SpecialTitleCfg.title[3].buffid do 
			if Actor.hasBuffById(sysarg,SpecialTitleCfg.title[3].buffid[i])== false then --没有这个buff就添加上
				Actor.addBuffById(sysarg,SpecialTitleCfg.title[3].buffid[i])
			end
		end
		
		if Actor.hasBuffById(sysarg,SpecialTitleCfg.title[3].buffid2[myJob])== false then --没有这个buff就添加上
			Actor.addBuffById(sysarg,SpecialTitleCfg.title[3].buffid2[myJob])
		end	
	end
	
	Actor.deleteTimer(sysarg,31)
    Actor.addTimer(sysarg,31,1000 * 60)
		
	Actor.sendTipmsg(sysarg, "开通特权成功", ttFlyTip);
	SendTheInfo(sysarg)
end

--后端发送信息
function SendTheInfo(sysarg)
	local var = Actor.getStaticVar(sysarg)
	if var.specialRight==nil then var.specialRight={} end
	local netPack = DataPack.allocPacket(sysarg, 139, 216)
	for i =1,table.getn(SpecialTitleCfg.title) do
		if IsSpeciaTitleVip(sysarg,i) == true then 
			local sec ,day =GetSpecialTitleSurplusTime(sysarg,i)
			--print("sec="..sec)
			DataPack.writeUInt(netPack,sec)
			if var.specialRight[i]==nil then 
				DataPack.writeByte(netPack,0)
				--print("pppp:0")
			else 
				DataPack.writeByte(netPack,1)
				--print("pppp:1")
			end
		else 
			DataPack.writeUInt(netPack,0)
			--print("sec=0")
			if var.specialRight[i]==nil then 
				DataPack.writeByte(netPack,0)
				--print("pppp:0")
			else 
				DataPack.writeByte(netPack,1)
				--print("pppp:1")
			end
		end
	end
    --是否扩充仓库格子
    if var.isGiveDepotGrid ~= nil then
        DataPack.writeByte(netPack,1)
    else
        DataPack.writeByte(netPack,0) 
    end
	DataPack.flush(netPack)
end

MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cSpecialRightInfo, GetSpecialRightInfo)
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cBuySpecialRight, BuySpecialRight)
