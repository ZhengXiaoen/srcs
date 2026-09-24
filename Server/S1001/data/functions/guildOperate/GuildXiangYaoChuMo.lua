--#include "data\functions\guildOperate\GuildXiangYaoChuMo_Cfg.lua" once
--#include "data\functions\OldPlayerReturnFunc.lua"  once
--请求降妖除魔的信息
MisGuildXiangYaoChuMo = function(sysarg, msgid, packet)

	if Actor.getGuildId(sysarg)==0 then
		Actor.sendTipmsg(sysarg,"还没有加入行会",ttFlyTip)
		return 
	end
	local nIndex =DataPack.readByte(packet)
	if nIndex==1 then --请求总信息
		SendGuildXiangYaoChuMoInfo(sysarg)
    elseif nIndex==2 then --接受任务
		JieShouRenWuGuildxycm(sysarg)
    elseif nIndex==3 then --完成任务
		WanChengRenWuGuildxycm(sysarg,DataPack.readByte(packet))
    elseif nIndex==4 then --传送去杀怪
		ChuanSongShaGuixycm(sysarg)
	elseif nIndex==5 then --请求log
		GetGuildFlagExpLog(sysarg)
    end
end

--行会降妖除魔总信息
SendGuildXiangYaoChuMoInfo = function(sysarg)
	local var = Actor.getStaticVar(sysarg)
	if var.newdays==nil then 
		var.newdays={}
	end
	
	--判断是否有任务，没有任务就，就给一个任务，有任务就直接发消息
	if var.Guild_xycmFlag==nil then 
		var.Guild_xycmFlag=1 
	end
	if var.Guild_xycmFlag==1 then --接受任务状态
		--按照等级分配任务
		local pLv = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
		local pCircle = Actor.getIntProperty(sysarg,PROP_ACTOR_CIRCLE)
		
		--判断索引
		local cfg = GuildXiangYaoChuMo_Cfg.Tasks
		var.Guild_xycmIndex = 1
		
		local maxUseLv = 0
		for i=1,#cfg do
			if pCircle==0 then --角色的转数为0
				if pLv>=cfg[i].lvSatrt and pLv<=cfg[i].lvEnd then --在区间内
					var.Guild_xycmIndex =i
					break
				elseif 0==cfg[i].lvSatrt and 0==cfg[i].lvEnd then --已经不是这个区间了
					if i-1>0 then 
						var.Guild_xycmIndex =i-1 --取上一个索引
						break 
					end
				end	
			else  --角色的转数不为0
				if pCircle==cfg[i].circle  then 
					var.Guild_xycmIndex =i
					break
				end	
				if i==#cfg then --已经是最后一个了
					var.Guild_xycmIndex =#cfg
				end
			end
		end
	end
	
	local pack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sGuildXiangYaoChuMo)
	DataPack.writeByte(pack,0) --总的信息
		
	--今天剩余任务的次数
	if var.newdays.Guild_xycmTime ==nil then 
		local xycmTimecfg = 5
		if IsSpeciaTitleVip(sysarg,2) ==true then 
			xycmTimecfg = 5+3
		end
		var.newdays.Guild_xycmTime =xycmTimecfg
	elseif var.newdays.Guild_xycmTime<0 then 
		var.newdays.Guild_xycmTime=0
	end
	DataPack.writeByte(pack,var.newdays.Guild_xycmTime) --次数
	--print("var.newdays.Guild_xycmTime="..var.newdays.Guild_xycmTime)
		
	DataPack.writeByte(pack,var.Guild_xycmFlag)--任务的状态
	
	if var.Guild_xycmIndex==nil then 
		var.Guild_xycmIndex=1 
	end
	
	if var.Guild_xycmKillC==nil or var.Guild_xycmFlag==1 then  --没有接任务的时候就是为0的
		var.Guild_xycmKillC=0 
	end
	--print("var.Guild_xycmIndex="..var.Guild_xycmIndex)
	--print("var.Guild_xycmKillC="..var.Guild_xycmKillC)
	DataPack.writeByte(pack,var.Guild_xycmIndex)--任务的索引
	DataPack.writeByte(pack,var.Guild_xycmKillC)	--当前xx只

	DataPack.flush(pack)
end

--改变了杀怪数量
ChangeGuildxycmKillCount = function(sysarg)
	local pack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sGuildXiangYaoChuMo)
	DataPack.writeByte(pack,1) --杀怪的信息
	if var.Guild_xycmKillC==nil then 
		var.Guild_xycmKillC=0 
	end
	DataPack.writeByte(pack,var.Guild_xycmKillC)	--当前xx只
	DataPack.flush(pack)
end

--接受任务
JieShouRenWuGuildxycm = function(sysarg)
	local var = Actor.getStaticVar(sysarg)
	if var.Guild_xycmFlag==nil then 
		var.Guild_xycmFlag=1 
	end
	if var.Guild_xycmFlag~=1 then --接受任务状态
		Actor.sendTipmsg(sysarg,"不能重复接受任务",ttFlyTip)
	end
	
	if var.newdays==nil then 
		var.newdays={}
	end
		
	if var.newdays.Guild_xycmTime ==nil then 
		local xycmTimecfg = 5
		if IsSpeciaTitleVip(sysarg,2) ==true then 
			xycmTimecfg = 5+3
		end
	
		var.newdays.Guild_xycmTime =xycmTimecfg
	elseif var.newdays.Guild_xycmTime<=0 then 
		var.newdays.Guild_xycmTime=0
		Actor.sendTipmsg(sysarg,"今天的次数已经用完了",ttFlyTip)
		return 
	end
	
	--改变杀怪数量
	var.Guild_xycmKillC=0
	var.Guild_xycmFlag=2 --改变接受任务状态
	Quest_ShuaXin(sysarg)
	SendGuildXiangYaoChuMoInfo(sysarg)
	----------------------传送去杀怪
	ChuanSongShaGuixycm(sysarg)
end

--完成任务
WanChengRenWuGuildxycm = function(sysarg,index)
	index = tonumber(index)
	local var = Actor.getStaticVar(sysarg)
	if var.Guild_xycmFlag==nil then 
		var.Guild_xycmFlag=1 
	end
	if var.Guild_xycmFlag==1 then 
		Actor.sendTipmsg(sysarg,"还没有接受任务",ttFlyTip)
		return 
	end
	if var.Guild_xycmIndex==nil then 
		Actor.sendTipmsg(sysarg,"还没有接受任务",ttFlyTip)
		var.Guild_xycmIndex=1 
		return 
	end
	
	local cfg2= GuildXiangYaoChuMo_Cfg.ForClient
	if var.Guild_xycmFlag==2 and var.Guild_xycmKillC>=cfg2[var.Guild_xycmIndex].monsterNum then --有任务，并且已经完成了
		--给奖励
		local myYb = Actor.getIntProperty( sysarg, PROP_ACTOR_YUANBAO)
		if index==1 then
			--System.sendCommonLog(LogIds.guildxycmAwrdsone,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,"行会除魔领取")
		elseif index==2 then 
			if myYb < cfg2[var.Guild_xycmIndex].needYb2 then
				Actor.sendTipmsg(sysarg, "元宝不足", ttFlyTip)
				return
			end
			Actor.changeMoney(sysarg, 3, -cfg2[var.Guild_xycmIndex].needYb2, LogIds.guildxycmAwrds, "行会除魔2倍领取")
		elseif index==3 then 
			if myYb < cfg2[var.Guild_xycmIndex].needYb3 then
				Actor.sendTipmsg(sysarg, "元宝不足", ttFlyTip)
				return
			end
			Actor.changeMoney(sysarg, 3, -cfg2[var.Guild_xycmIndex].needYb3, LogIds.guildxycmAwrds, "行会除魔3倍领取")
		end
		--老兵回归 双倍
        local sys = System.getStaticVar()
        if sys.oldplayer ~= nil then
            local aVar = InitOldPlayerReturnInfo(sysarg)
            if aVar.oldplayret.isold == 1 then
                index = index * OldPlayerReturnCfg[1].Daily.rate
            end
        end
		--给奖励
		local myGuildId = Actor.getGuildId(sysarg)
		if myGuildId ~= 0 then 
			--Actor.sendTipmsg(sysarg,"完成任务给奖励",ttFlyTip)
			local flagExp = cfg2[var.Guild_xycmIndex].zhanLiZhi*index --这个要记录下来，显示用的
			Guild.setFlagExp(myGuildId,Guild.getFlagExp(myGuildId) +flagExp)  --设置行会旗帜经验
			Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)获得> <(c0xFF0090ff)%s%s>", flagExp, "战旗值"), 1);
			--做记录
			DoGuildFlagExpLog(sysarg,myGuildId,flagExp,index)
			
			local lingli  =cfg2[var.Guild_xycmIndex].lingLi*index
			System.sendCommonLog(LogIds.guildxycmAwrdsone,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,Actor.getUIntProperty(sysarg, PROP_ACTOR_LINGLI_VALUE),Actor.getUIntProperty(sysarg, PROP_ACTOR_LINGLI_VALUE)+lingli,"行会除魔领取")
			Actor.setUIntProperty(sysarg, PROP_ACTOR_LINGLI_VALUE,Actor.getUIntProperty(sysarg, PROP_ACTOR_LINGLI_VALUE)+lingli) --给灵力值
			Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)获得> <(c0xFF0090ff)%s%s>", lingli, "灵力值"), 1);
		end
		var.Guild_xycmKillC=0  --没有杀怪
		var.Guild_xycmFlag=1  --没有接受任务
		var.Guild_xycmIndex = 1 --index为1
		--扣除次数
		if var.newdays.Guild_xycmTime ==nil then 
			local xycmTimecfg = 5
			if IsSpeciaTitleVip(sysarg,2) ==true then 
				xycmTimecfg = 5+3
			end
	
			var.newdays.Guild_xycmTime =xycmTimecfg
		end
		var.newdays.Guild_xycmTime = var.newdays.Guild_xycmTime -1
		
		Quest_ShuaXin(sysarg)
		SendGuildXiangYaoChuMoInfo(sysarg)
	else 
		Actor.sendTipmsg(sysarg,"任务还没有完成",ttFlyTip)
	end
end

--做旗帜log
DoGuildFlagExpLog =function(sysarg,GuildId,value,rate)

	local name =Actor.getName(sysarg)
	local sVar = System.getStaticVar()
	if sVar.GuildFlagExpLog == nil then --初始化记录
		sVar.GuildFlagExpLog={}
	end
	if sVar.GuildFlagExpLog[GuildId]==nil then --初始化行会记录和指针
		sVar.GuildFlagExpLog[GuildId]={}
		sVar.GuildFlagExpLog[GuildId].logs={}
		sVar.GuildFlagExpLog[GuildId].Point =1  --做一个循环队列，把记录记下,这是一个尾指针
	end
	
	if sVar.GuildFlagExpLog[GuildId].Point==nil or sVar.GuildFlagExpLog[GuildId].Point>GuildXiangYaoChuMo_Cfg.LogCount then 
		sVar.GuildFlagExpLog[GuildId].Point=1
	end
	
	if sVar.GuildFlagExpLog[GuildId].logs==nil then --初始化行会记录
		sVar.GuildFlagExpLog[GuildId].logs={}
	end
	
	if sVar.GuildFlagExpLog[GuildId].logs[sVar.GuildFlagExpLog[GuildId].Point]==nil then --初始化第n条的记录
		sVar.GuildFlagExpLog[GuildId].logs[sVar.GuildFlagExpLog[GuildId].Point]={}
	end
    
	
	
	
	if rate==1 then
		sVar.GuildFlagExpLog[GuildId].logs[sVar.GuildFlagExpLog[GuildId].Point] = name.."免费领取除魔奖励"..value.."点" --写进第n条记录
	else
		sVar.GuildFlagExpLog[GuildId].logs[sVar.GuildFlagExpLog[GuildId].Point] = name.."领取3倍除魔奖励"..value.."点"
	end
	
	sVar.GuildFlagExpLog[GuildId].Point=1+sVar.GuildFlagExpLog[GuildId].Point --指针移位
	
	if sVar.GuildFlagExpLog[GuildId].Point>GuildXiangYaoChuMo_Cfg.LogCount then 
		sVar.GuildFlagExpLog[GuildId].Point=1
	end
	
	--给自己传信息。。/也可以全行会传，但是没有必要
	GetGuildFlagExpLog(sysarg)
end

--清除log
ClearGuildFlagExpLog = function()
	local sVar = System.getStaticVar()
	sVar.GuildFlagExpLog={}
end

--得到log
GetGuildFlagExpLog = function(sysarg)
	
	local GuildId = Actor.getGuildId(sysarg)
	
	local sVar = System.getStaticVar()
	if sVar.GuildFlagExpLog == nil then --初始化记录
		sVar.GuildFlagExpLog={}
	end
	if sVar.GuildFlagExpLog[GuildId]==nil then --初始化行会记录和指针
		sVar.GuildFlagExpLog[GuildId]={}
		sVar.GuildFlagExpLog[GuildId].logs={}
		sVar.GuildFlagExpLog[GuildId].Point =1  --做一个循环队列，把记录记下,这是一个尾指针
	end
	
	if sVar.GuildFlagExpLog[GuildId].Point==nil or sVar.GuildFlagExpLog[GuildId].Point>GuildXiangYaoChuMo_Cfg.LogCount then 
		sVar.GuildFlagExpLog[GuildId].Point=1
	end
	
	if sVar.GuildFlagExpLog[GuildId].logs==nil then --初始化行会记录
		sVar.GuildFlagExpLog[GuildId].logs={}
	end
	
	--if sVar.GuildFlagExpLog[GuildId].logs[sVar.GuildFlagExpLog[GuildId].Point]=nil then --初始化第n条的记录
	--	sVar.GuildFlagExpLog[GuildId].logs[sVar.GuildFlagExpLog[GuildId].Point]=={}
	--end
	
	local pack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sGuildXiangYaoChuMo)
	DataPack.writeByte(pack,2) --记录
	DataPack.writeByte(pack,#sVar.GuildFlagExpLog[GuildId].logs)
	if #sVar.GuildFlagExpLog[GuildId].logs==0 then --如果记录为0条，发0
		DataPack.writeByte(pack,0) 
		--print("条数0")
	else	
		if #sVar.GuildFlagExpLog[GuildId].logs>=GuildXiangYaoChuMo_Cfg.LogCount then --如果记录大于等于50条
			--print("条数"..GuildXiangYaoChuMo_Cfg.LogCount)
			--后半段是队头，前半段是队尾
			for i=sVar.GuildFlagExpLog[GuildId].Point,#sVar.GuildFlagExpLog[GuildId].logs do --写入循环队列前半段
				DataPack.writeString(pack,sVar.GuildFlagExpLog[GuildId].logs[i]) 
				--print(sVar.GuildFlagExpLog[GuildId].logs[i])
			end
			
			for i=1,sVar.GuildFlagExpLog[GuildId].Point-1 do 
				DataPack.writeString(pack,sVar.GuildFlagExpLog[GuildId].logs[i]) --写入循环队列后半段
				--print(sVar.GuildFlagExpLog[GuildId].logs[i])
			end 
			
		else 
			--print("条数"..#sVar.GuildFlagExpLog[GuildId].logs)
			for i=1,#sVar.GuildFlagExpLog[GuildId].logs do 
				DataPack.writeString(pack,sVar.GuildFlagExpLog[GuildId].logs[i]) 
				--print(sVar.GuildFlagExpLog[GuildId].logs[i])
			end
		end
	end
	
	DataPack.flush(pack)
end


--传送去杀怪
ChuanSongShaGuixycm = function(sysarg)

	local var = Actor.getStaticVar(sysarg)
	if var.Guild_xycmFlag==nil then 
		var.Guild_xycmFlag=1 
	end
	if var.Guild_xycmFlag==1 then 
		Actor.sendTipmsg(sysarg,"还没有接受任务",ttFlyTip)
		return 
	end	
	
	if var.Guild_xycmFlag==2 then
		--传送到地图
		--挂机
		ChuanSongGuaJiGuildxycm(sysarg)
	end
end

--传送,挂机
ChuanSongGuaJiGuildxycm = function(sysarg)
	local var = Actor.getStaticVar(sysarg)
	
	if var.Guild_xycmIndex==nil then 
		Actor.sendTipmsg(sysarg,"还没有接受任务",ttFlyTip)
		var.Guild_xycmIndex=1 
		return 
		
	end
	
	local cfg = GuildXiangYaoChuMo_Cfg.Tasks
	local mapId=GuildXiangYaoChuMo_Cfg.ForClient[var.Guild_xycmIndex].mapId
	if cfg[var.Guild_xycmIndex].x==0 and cfg[var.Guild_xycmIndex].y == 0 then 
		local h=0
		local w=0
		local times=0
		
		for i=1,10000 do --循环1万次找随机点
			local bHandle = Fuben.getSceneHandleById(mapId,0)
			
			h = System.getRandomNumber(Fuben.getScenHeight(bHandle)) + 1
			w = System.getRandomNumber(Fuben.getSceenWidth(bHandle)) + 1
			Fuben.onCanMove(bHandle,h,w)
			if Fuben.onCanMove(bHandle,h,w)== true then
				break
			end
			times=i
		end
		if times <10000 then 
			System.telportScene(sysarg,	mapId, h, w)
		else 
			local mapname = Fuben.getSceneNameById(mapId)
			System.telportSceneDefaultPoint(sysarg,mapname)
		end
	else 
		System.telportScene(sysarg,	mapId, cfg[var.Guild_xycmIndex].x,cfg[var.Guild_xycmIndex].y)
	end
	
	 Actor.addTimer(sysarg,25,1000*3)
end


















MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cGuildXiangYaoChuMo,MisGuildXiangYaoChuMo) --爱奇艺vip登录