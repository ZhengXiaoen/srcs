--勇闯天关
--#include "data\config\activity\YongChuangTianGuanCfg.lua" once
--fubenId 122 ~ 122+29
--这脚本的onKilMonsterInYongZheChuangGuang函数热更不了

--后端下发
--1是5秒刷怪倒计时
--2是1分钟打怪的倒计时
--3是5秒进入下1关的倒计时


EnterYongZheChuangGuang = function(sysarg)
	--判断等级
	local nActorLevel = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	if nActorLevel<60 then 
		Actor.sendTipmsg(sysarg,"您等级不够60级，无法进入",ttFlyTip)
		return 
	end
	
	--是否已经是过了最高层了
	local var = Actor.getStaticVar(sysarg) 
	var.SYCGLayer = var.days.SYCGLayer
	if var.SYCGLayer == nil then 
		var.SYCGLayer = 1
	end
	if var.SYCGLayer > 30  then 
		Actor.sendTipmsg(sysarg,"您最高层已经通关，请明天再来吧",ttFlyTip)
		return 
	end
	
	--判断背包空格
	if Item.getBagEmptyGridCount(sysarg) < 2 then
		Actor.sendTipmsg(sysarg, "背包至少有2个空位才能进入", ttFlyTip)
		return
	end
	
	--判断是否够钱 	--扣钱
	if Actor.changeMoney(sysarg,0,-100000,LogIds.YongChuangTianGuan, "进入勇闯天关")==false then 
		if Actor.changeMoney(sysarg,1,-100000,LogIds.YongChuangTianGuan, "进入勇闯天关")==false then
			Actor.sendTipmsg(sysarg,"您绑定金币/金币不足，无法进入",ttFlyTip)
			return 
		end
	end
		
	--进入副本
	local fbid = var.SYCGLayer -1 + 122
	local Hfuben = Fuben.createFuBen(fbid)  --1:表示副本ID
	if Hfuben == 0 then return end
	if Actor.enterFuBen(sysarg, Hfuben,-1,-1,-1) == false then return  end  --从NPC那将玩家传进副本
	
	var.days.IsHasEnterYCTG = 1 --今天进入了勇闯天关
	
	Actor.addTimer(sysarg,25,5*1000)--自动挂机
	
	--给个倒计时刷怪
	Actor.sendTipmsg(sysarg,"怪物将在5秒后刷出",ttFlyTip)
	Actor.addTimer(sysarg,42, 5*1000)
	
	
	--随机库的index-----------------------------------------------------------------
	if var.newdays.YZCGaward==nil then 
		var.newdays.YZCGaward={}
	end
	
	local index = math.floor((var.SYCGLayer-1)/5)+1
	local cfg =YongChuangTianGuanCfg.award[index] 
	
	if var.newdays.YZCGaward[var.SYCGLayer]==nil then 
		var.newdays.YZCGaward[var.SYCGLayer]={}
		
	end
	
	--如果这个数字没有随机出来
	if #var.newdays.YZCGaward[var.SYCGLayer]==0 then 
		var.newdays.YZCGaward[var.SYCGLayer][1]=1

		for j=1,#cfg do 
			local nRandNum = System.getRandomNumber(10000) + 1		--随机数
			if nRandNum<=cfg[j].rate then 
				var.newdays.YZCGaward[var.SYCGLayer][1]=j
			end
		end
	
	end
	--随机库的index-----------------------------------------------------------------
	
	
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sYongChuangTianGuan) 
	DataPack.writeByte(netPack, 1) --进入的5秒倒计时
	DataPack.writeByte(netPack, var.SYCGLayer) --进入第几关
	DataPack.writeByte(netPack, var.newdays.YZCGaward[var.SYCGLayer][1])
	DataPack.flush(netPack)
	
	Actor.addTimer(sysarg,45, 5*1000)
		
end

--在勇者闯关副本里面杀怪
function onKilMonsterInYongZheChuangGuang(sysarg,monId)
	local var = Actor.getStaticVar(sysarg) 
	if Actor.getSceneId(sysarg) >=348 and  Actor.getSceneId(sysarg)<=377  then
		
		--local hScene = Actor.getSceneHandle(sysarg)
		--if Fuben.getLiveMonsterCount(hScene,0) > 0  then --这样不行，因为一开始是没有怪物的
		--	print("使用毒了，退出了")
		--	return 
		--end
		--怪物id 837~ 837+29
		if monId<837 or monId>837+29 then 
			--print("使用毒了，退出了")
			return 
		end
		
		--删除出去的定时器
		Actor.deleteTimer(sysarg,43)
		
		--记录通关变量
		if var.SYCGLayer == nil then 
			var.SYCGLayer = 1
		end
		--记录通关
		System.sendCommonLog(GameLog.YongChuangTianGuan,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,var.SYCGLayer.."通关")

		
		--广播
		local RwData = {"xxx", "沙漠土城", 155, 120, "我也要参加"}
		local NpcName = string.format("<%s/M%s:%s:%s:%s>", RwData[5], RwData[2], RwData[3], RwData[4], RwData[5])
		local NpctFly = string.format("<(x%s:%s:%s:%s)>", RwData[2], RwData[3], RwData[4], RwData[5])	
		
		--local GuangBoGuanShu = { 3,6,9,12,15,18,21,24,27,30}
		--for i=1,#GuangBoGuanShu do 
		--	if var.SYCGLayer==GuangBoGuanShu[i] then 
		--		System.broadcastTipmsg(string.format("<(n%s)>玩家实力强悍,顺利通过天关%s层.获得"..Item.getItemLinkMsg(YongChuangTianGuanCfg.award[1].id).." %s %s",Actor.getName(sysarg),var.SYCGLayer,NpcName,NpctFly), ttChatWindow)
		--	end
		--end

		--排名 (排名先屏蔽)
		--InityongRanking()
		--local ranking = Ranking.getRanking("YongChuangTianGuan.txt")
		--if ranking then
		--	local myId = Actor.getIntProperty( sysarg, PROP_ENTITY_ID )
		--	local item = Ranking.getItemPtrFromId( ranking, myId)
		--	if item~=nil then 	
		--		if Ranking.getPoint(item)<var.days.SYCGLayer then --进步了
		--			SetYCTGPaiMing(sysarg,var.days.SYCGLayer)
		--		end
		--	else
		--		SetYCTGPaiMing(sysarg,var.days.SYCGLayer) --第一次，直接设置
		--	end
		--end
		--------------------------------------------------------------------------------------排名
		
		--取消挂机
		Actor.stopAutoFight(sysarg)
		
		--给奖励------------------------
		--随机库的index-----------------------------------------------------------------
		if var.newdays.YZCGaward==nil then 
			var.newdays.YZCGaward={}
		end

		local index = math.floor((var.SYCGLayer-1)/5)+1
		local cfg =YongChuangTianGuanCfg.award[index] 

		if var.newdays.YZCGaward[var.SYCGLayer]==nil then 
			var.newdays.YZCGaward[var.SYCGLayer]={}
			
		end

		--如果这个数字没有随机出来
		if #var.newdays.YZCGaward[var.SYCGLayer]==0 then 
			var.newdays.YZCGaward[var.SYCGLayer][1]=1
	    
			for j=1,#cfg do 
				local nRandNum = System.getRandomNumber(10000) + 1		--随机数
				if nRandNum<=cfg[j].rate then 
					var.newdays.YZCGaward[var.SYCGLayer][1]=j
				end
			end
		end

		local awardTable = {}
		local awardTable2 = {}
		
		for i=1,3 do 
			local index2 = var.newdays.YZCGaward[var.SYCGLayer][1]

			if cfg[index2].giveAward[i].type==0 then 
				table.insert(awardTable,cfg[index2].giveAward[i])
			else 
				table.insert(awardTable2,cfg[index2].giveAward[i])
			end
		end
		
		if #awardTable~=0 then 
			if Awards.CheckBagGridCount(sysarg, awardTable) == false then 
				local actorID = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
				if #awardTable==2 then 
					System.AddMail(actorID,6,0,"勇闯天关","勇闯天关奖励",0,0,awardTable[1].id..","..awardTable[1].count..",1/"..awardTable[2].id..","..awardTable[2].count..",1")
				elseif  #awardTable==3 then 
					System.AddMail(actorID,6,0,"勇闯天关","勇闯天关奖励",0,0,awardTable[1].id..","..awardTable[1].count..",1/"..awardTable[2].id..","..awardTable[2].count..",1".."/"..awardTable[3].id..","..awardTable[3].count..",1")
				elseif  #awardTable==1 then 
					System.AddMail(actorID,6,0,"勇闯天关","勇闯天关奖励",0,0,awardTable[1].id..","..awardTable[1].count..",1")
				end
				Actor.sendTipmsg(sysarg,"背包空位不足，已将奖励发送到邮件了")
			else 
				Awards.Give(sysarg, awardTable, LogIds.YongChuangTianGuan, "勇闯天关")
			end
		end
		
		
		--给经验的，不需要
		if #awardTable2~=0 then 
			if Awards.Give(sysarg, awardTable2, LogIds.YongChuangTianGuan, "勇闯天关") == false then	
				
			end
		end
		
		--随机库的index-----------------------------------------------------------------
		--记录通过的最高关
		if var.TGtopLayer==nil or var.TGtopLayer==0 then 
			var.TGtopLayer=var.SYCGLayer
		elseif var.SYCGLayer>var.TGtopLayer then 
			var.TGtopLayer=var.SYCGLayer
		end
		
		var.SYCGLayer = 1 + var.SYCGLayer
		var.days.SYCGLayer = var.SYCGLayer
		
		Actor.addTimer(sysarg, 44, 5*1000)
		
		local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sYongChuangTianGuan) 
		DataPack.writeByte(netPack, 3) --进入下一关倒计时
		DataPack.flush(netPack)
		
		
		

		--分开给，因为有一个是要判断背包的空位的
		--给奖励，不够的位置话邮件给
		--local awardTable = {}
		--table.insert(awardTable,YongChuangTianGuanCfg.award[1])
		--table.insert(awardTable,YongChuangTianGuanCfg.award[2])
		
		--if Awards.CheckBagGridCount(sysarg, awardTable) == false then 
		--	local actorID = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
		--	System.AddMail(actorID,6,0,"勇闯天关","勇闯天关奖励",0,0,awardTable[1].id..","..awardTable[1].count..",1/"..awardTable[2].id..","..awardTable[2].count..",1")
		--	Actor.sendTipmsg(sysarg,"背包空位不足，已将奖励发送到邮件了")
		--else 
		--	Awards.Give(sysarg, awardTable, LogIds.YongChuangTianGuan, "勇闯天关")
		--end
		--
		----给经验的，不需要
		--local awardTable2 = {}
		--table.insert(awardTable2,YongChuangTianGuanCfg.award[3])
		--if Awards.Give(sysarg, awardTable2, LogIds.YongChuangTianGuan, "勇闯天关") == false then	
		--	
		--end
	end
end

--初始化排行榜
function InityongRanking()
	local ranking = Ranking.getRanking("YongChuangTianGuan.txt")
	if not ranking then
		ranking = Ranking.add( "YongChuangTianGuan.txt", 1000, 1, 10)
		if ranking then			
			if not Ranking.load(ranking,"YongChuangTianGuan.txt") then
				Ranking.addColumn(ranking, "name")
			end
			Ranking.addRef(ranking)  --有什么用？？？
		end
		Ranking.save(ranking, "YongChuangTianGuan.txt",true)
	end
end

--设置排名
function SetYCTGPaiMing(sysarg,addPoint)
	local ranking = Ranking.getRanking("YongChuangTianGuan.txt")
	if ranking then
		local myId = Actor.getIntProperty( sysarg, PROP_ENTITY_ID )
		local item = Ranking.getItemPtrFromId( ranking, myId)
		if item then
			Ranking.setItem(ranking, myId, addPoint)	
		else
			item = Ranking.addItem(ranking, myId, addPoint)
			if item then
				Ranking.setSub(item, 0, Actor.getName(sysarg)) --下标从0开始
			end
		end
		Ranking.save(ranking, "YongChuangTianGuan.txt",true)
	end
end

--在npc身上读取排名

