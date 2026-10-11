--#include "data\functions\Activity\SpringFestivalActivity.lua" once
--#include "data\config\RedPacketCfg.lua" once
--春节活动 :限时抢购特惠礼包 ,集字有奖,鸿运当头
-------------------------------------------------------------------------------------------------------------------------------------
function spring_XianShiQiangGou_main(sysarg, packet)
	--是否在开关时间内
	if is_spring_festival_time()~=true then 
		return
	end
	
	local msgId = DataPack.readByte(packet)
	if msgId == 1 then -- 获得数据
		GetSpringXianShibuyInfo(sysarg)
	elseif msgId == 2 then -- 购买
		GetSpringXianShiQiangGou(sysarg, DataPack.readByte(packet))	
	end
end

GetSpringXianShibuyInfo = function(sysarg)

	local springOpenDay = get_spring_festival_day_count()
	local cfg = nil
	if SpringFestivalCfg ~= nil then
		cfg = SpringFestivalCfg.XianShiQiangGou
	end
	if cfg == nil or springOpenDay<1 or springOpenDay>#cfg then 
		return 	
	end

	--超出了天数，没有配置就不做处理
	if cfg[springOpenDay]==nil then 
		return 
	end
	
	local var = Actor.getStaticVar(sysarg)
	
	local netPack = DataPack.allocPacket(sysarg,139,LogicCmd.miscSys.sub.sSendSpringFestivalData)
	DataPack.writeByte(netPack,9)
	
	if var.newdays==nil then 
		var.newdays={}
	end
		
	if var.newdays.springXSbuys==nil then 
		var.newdays.springXSbuys={}
	end
	
	for i=1,#cfg[springOpenDay] do 
		if var.newdays.springXSbuys[i]==nil then 
			DataPack.writeByte(netPack,0)	
		else 
			DataPack.writeByte(netPack,var.newdays.springXSbuys[i])	--把代码今天买了多少次发下去。。。
		end
	end
	DataPack.flush(netPack)
end


--购买限时抢购的
GetSpringXianShiQiangGou = function(sysarg,index)
	--是否在开关时间内
	if is_spring_festival_time()~=true then 
		return
	end
	
	if index <=0 then 
		return 
	end
	
	local springOpenDay = get_spring_festival_day_count()
	local cfg = nil
	if SpringFestivalCfg ~= nil then
		cfg = SpringFestivalCfg.XianShiQiangGou
	end
	
	if cfg == nil or springOpenDay<1 or springOpenDay>#cfg then 
		return 
	end
	
	local dayCfg = cfg[springOpenDay]
	if dayCfg==nil then 
		--天数不对，太大了
		print("配置是空的")
		return 
	end
	
	local cgf = dayCfg[index]
	if cgf ==nil or cgf.canBuyTime == nil or cgf.award == nil or cgf.needMoney == nil then 
		print("配置是空的")
		return 
	end
		
	--判断买了多少次，是否超过次数
	local var = Actor.getStaticVar(sysarg)
	
	if var.newdays==nil then 
		var.newdays={}
	end
	
	if var.newdays.springXSbuys==nil then 
		var.newdays.springXSbuys={}
	end
	
	if var.newdays.springXSbuys[index]==nil then 
		var.newdays.springXSbuys[index]=0
	end
	
	--超过可以购买的次数
	if var.newdays.springXSbuys[index]>=cgf.canBuyTime then 
		Actor.sendTipmsg(sysarg,"购买失败,今天已经超过购买次数了",ttFlyTip)
		return 
	end

	
	local function isBuys(i)
		if dayCfg[i] == nil or dayCfg[i].canBuyTime == nil then
			return false
		end
		if var.newdays.springXSbuys[i]==nil then
			return false
		end
		return var.newdays.springXSbuys[i]>=dayCfg[i].canBuyTime
	end
	
	if index==4 then
		if isBuys(1)==false then 
			System.trace("springfestivalxianshigoumai:"..Actor.getName(sysarg))
			return
		end
	end
	if index==5 then
		if isBuys(2)==false then 
			System.trace("springfestivalxianshigoumai:"..Actor.getName(sysarg))
			return
		end
	end
	if index==6 then
		if isBuys(3)==false then 
			System.trace("springfestivalxianshigoumai:"..Actor.getName(sysarg))
			return
		end
	end
	if index==7 then
		if isBuys(1)==false or isBuys(4)==false then 
			System.trace("springfestivalxianshigoumai:"..Actor.getName(sysarg))
			return
		end
	end
	if index==8 then
		if isBuys(2)==false or isBuys(5)==false then 
			System.trace("springfestivalxianshigoumai:"..Actor.getName(sysarg))
			return
		end
	end
	if index==9 then
		if isBuys(3)==false or isBuys(6)==false then 
			System.trace("springfestivalxianshigoumai:"..Actor.getName(sysarg))
			return
		end
	end
	
	--判断格子够不够
	if not Awards.CheckBagGridCount(sysarg, cgf.award) then
		return
	end

	--判断钱够不够
	if Actor.changeMoney(sysarg, 3, -cgf.needMoney, LogIds.SpringXianShiQiangGou, cgf.award[1].txt) == false then
		Actor.sendTipmsg(sysarg,"元宝不足", ttFlyTip);
		return -- 元宝不足
	end
	
	Actor.sendTipmsg(sysarg,"购买"..cgf.name.."成功",ttFlyTip)
	--给东西
	Awards.Give(sysarg,cgf.award,LogIds.SpringXianShiQiangGou,"春节限时抢购")
	--改记录买了是多少次
	var.newdays.springXSbuys[index]=var.newdays.springXSbuys[index]+1
	--记录下来
	System.sendCommonLog(LogIds.SpringXianShiQiangGou,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,"","",cgf.award[1].txt)
	--给前端发协议
	GetSpringXianShibuyInfo(sysarg)
	
	System.broadcastTipmsg(string.format("<(n%s)>玩家通过限时抢购购买了%s,此物品只有今天特惠出售.<我也要购买/@@showWin,243,3>",Actor.getName(sysarg),Item.getItemLinkMsg(cgf.award[1].id)), ttChatWindow)
end
-------------------------------------------------------------------------------------------------------------------------------------














-------------------------------------------------------------------------------------------------------------------------------------
--集字活动
function spring_JiZi_main(sysarg, packet)
	if SpringFestivalCfg.SpringJiZi.isOpen == false then return end

	--是否在开关时间内
	if is_spring_festival_time()~=true then 
		return
	end
	
	local msgId = DataPack.readByte(packet)
	if msgId == 1 then -- 换取奖品
		GetSpringJiZiGift(sysarg, DataPack.readByte(packet))	
	end
end


--领取集字活动奖励
GetSpringJiZiGift= function(sysarg,index)
	if SpringFestivalCfg.SpringJiZi.isOpen == false then return end

	--判断index是否合法
	if index<1 or index>#SpringFestivalCfg.SpringJiZi.needCollect then 
		return 
	end
	
	--判断背包里面的所需物品是否足够
	for i=1,#SpringFestivalCfg.SpringJiZi.needCollect[index] do 
		local idindex = SpringFestivalCfg.SpringJiZi.needCollect[index][i].id-SpringFestivalCfg.SpringJiZi.JiZiId[1]+1
		if Actor.getItemCount(sysarg,SpringFestivalCfg.SpringJiZi.JiZiId[idindex],-1,-1,-1)<=0 then  
			Actor.sendTipmsg(sysarg,"道具不足，无法兑换",ttFlyTip)
			return 
		end
	end
	--背包不足
	if not Awards.CheckBagGridCount(sysarg, SpringFestivalCfg.SpringJiZi.award[index]) then
		return 
	end
    
	--扣除物品
	for i=1,#SpringFestivalCfg.SpringJiZi.needCollect[index] do 
		local idindex = SpringFestivalCfg.SpringJiZi.needCollect[index][i].id -SpringFestivalCfg.SpringJiZi.JiZiId[1]+1
		Actor.removeItem(sysarg,SpringFestivalCfg.SpringJiZi.JiZiId[idindex],1)
	end
		
	local bResult = Awards.Give(sysarg, SpringFestivalCfg.SpringJiZi.award[index], LogIds.SpringJIZI,"春节集字")
	if bResult == false then
		print("spring Collect Zi Gift error, actor name = "..Actor.getName(sysarg))
		return 
	end
	Actor.sendTipmsg(sysarg,"领取奖励成功",ttFlyTip)
		
	
	--兑换成功告诉前端
	local netPack = DataPack.allocPacket(sysarg,139,LogicCmd.miscSys.sub.sSendSpringFestivalData)
	DataPack.writeByte(netPack,10)
	DataPack.flush(netPack)
	
	System.broadcastTipmsg(string.format("玩家<(n%s)>玩家集齐了[%s] ,兑换了%s大奖<我也要领取/@@showWin,243,8>",Actor.getName(sysarg),SpringFestivalCfg.SpringJiZi.award[index][1].txt,SpringFestivalCfg.SpringJiZi.award[index][1].name),ttChatWindow)
	System.sendCommonLog(LogIds.SpringJIZI,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,index.."春节集字")
end
---------------------------------------------------------------------------------------------------------------------------------

















------------------------------------------------------------------------------------------------------------------------------

SpringHongYunDangTouMaxDay = function()
	if SpringFestivalCfg == nil or SpringFestivalCfg.HongYunDangTou == nil then
		return 0
	end

	return #SpringFestivalCfg.HongYunDangTou
end

EnsureSpringHongYunDangTouSystemData = function()
	local maxDay = SpringHongYunDangTouMaxDay()
	if maxDay <= 0 then
		return nil
	end

	local svar = System.getStaticVar()
	if svar.SpringHYDT_data == nil then
		svar.SpringHYDT_data = {}
	end

	local data = svar.SpringHYDT_data
	if data.days == nil then
		data.days = {}
	end
	for day=1,maxDay do
		if data.days[day] == nil then
			data.days[day] = {}
		end
		if data.days[day].luckNumber == nil then
			data.days[day].luckNumber = 0
		end
		if data.days[day].luckUser == nil then
			data.days[day].luckUser = "无"
		end
	end

	if data.leftTable == nil then
		data.leftTable = {}
	end
	for day=1,maxDay do
		if data.leftTable[day] == nil then
			data.leftTable[day] = {}
			for i=1,100 do
				data.leftTable[day][i] = i
			end
		end
	end

	if data.TeHuiTotal == nil then
		data.TeHuiTotal = {}
	end
	if data.NumberData == nil then
		data.NumberData = {}
	end

	return data
end

--购买鸿运当头特惠
BuySpringHongYunDangTouTeHui= function(sysarg)
	
	local springOpenDay = get_spring_festival_day_count()
	local maxDay = SpringHongYunDangTouMaxDay()
	if springOpenDay>maxDay or springOpenDay <1 then 
		return 
	end
	
	local data = EnsureSpringHongYunDangTouSystemData()
	if data == nil then return end
	
	
	local cfg  = SpringFestivalCfg.HongYunDangTou[springOpenDay]
	if cfg == nil or cfg.TeHui == nil or cfg.TeHui.award == nil then return end
	
	
	--检查总数量是否已经卖完了
	if data.TeHuiTotal[springOpenDay] ==nil then 
		data.TeHuiTotal[springOpenDay] =0
	end
	if data.TeHuiTotal[springOpenDay]>=100 then 
		Actor.sendTipmsg(sysarg,"今日特惠的剩余数量为0",ttFlyTip)
		return 
	end

	local hour,mins,secs = System.getTime()
	local needLuckNumber = hour<21
	local leftTable = data.leftTable[springOpenDay]
	local leftCount = 0
	if leftTable ~= nil then
		leftCount = #leftTable
	end
	if needLuckNumber and leftCount==0 then
		Actor.sendTipmsg(sysarg,"参数错误",ttFlyTip)
		System.trace("hongyundangtou,has error")
		return 
	end

	--检查金钱是否足够
	if Actor.getMoneyCount(sysarg,3) <cfg.TeHui.needMoney then
		Actor.sendTipmsg(sysarg,"元宝不足",ttFlyTip)
		return 
	 end
	 
	--检查背包空间是否满足
	if not Awards.CheckBagGridCount(sysarg,cfg.TeHui.award) then
		return 
	end
	
	--扣金钱
	if Actor.changeMoney( sysarg, 3, -cfg.TeHui.needMoney, LogIds.SpringHongYunDangTou, cfg.TeHui.award[1].txt) == false then
		Actor.sendTipmsg(sysarg,"元宝不足",ttFlyTip)
		return 
	end
	--给奖励
	Awards.Give(sysarg,cfg.TeHui.award,LogIds.SpringHongYunDangTou,cfg.TeHui.award[1].txt)
	--扣除特惠的总次数
	data.TeHuiTotal[springOpenDay] = data.TeHuiTotal[springOpenDay]+1 
	
	
	------------------------------------虚线以内，是要在21点前才会有用21点后点击就没有用了-----------------------------------------------------
	---改了时间，几点开奖，必须改这里
	if needLuckNumber then 
		--随机数字
		local s = leftCount
		local randNumber = System.getRandomNumber(s)+1 --产生1~s的 在未抽中的表中随机抽中一个
		local thisNumber = data.leftTable[springOpenDay][randNumber] --拿出这个号码
		
		--把这个幸运数字抽出来
		--不能直接remove data.leftTable,所以找个中间表
		local tempTable ={}
		for i=1,s do 
			tempTable[i] = data.leftTable[springOpenDay][i]
		end
		
		table.remove(tempTable,randNumber) --在未抽的表中删除这个号码
		
		data.leftTable[springOpenDay] ={}
		for i=1,s-1 do 
			data.leftTable[springOpenDay][i] = tempTable[i]
		end
		
		--记录自己得到的数字
		local var = Actor.getStaticVar(sysarg)
		if var.newdays==nil then 
			var.newdays={}
		end
	
		if var.newdays.SpringHYDT_LuckNumber ==nil then var.newdays.SpringHYDT_LuckNumber = {} end
		var.newdays.SpringHYDT_LuckNumber[#var.newdays.SpringHYDT_LuckNumber+1] = thisNumber
		
		--系统要记录这个数字的主人的姓名和id
		data.NumberData[thisNumber] ={}
		data.NumberData[thisNumber].name = Actor.getName(sysarg)
		data.NumberData[thisNumber].userID = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
		data.NumberData[thisNumber].sex = Actor.getIntProperty(sysarg,PROP_ACTOR_SEX)
		
		System.broadcastTipmsg(string.format("<(n%s)>玩家购买了鸿运当头今日特惠,获得一个幸运数字,祝福他拿大奖吧,<我也要购买/@@showWin,243,4>",Actor.getName(sysarg)),ttChatWindow)
	end
	----------------------------------------------------------------------------------------------
	--给前端发协议
	SendSpringHongYunDangTouUserData(sysarg)
end

--发送鸿运当头的常变的个人数据
SendSpringHongYunDangTouUserData=function(sysarg)

	local springOpenDay = get_spring_festival_day_count()
	local maxDay = SpringHongYunDangTouMaxDay()
	
	if springOpenDay>maxDay or springOpenDay<1 then 
		return 
	end
	
	local data = EnsureSpringHongYunDangTouSystemData()
	if data == nil then return end
	

	local netPack = DataPack.allocPacket(sysarg,139,LogicCmd.miscSys.sub.sSendSpringFestivalData)
	DataPack.writeByte(netPack,11)
	DataPack.writeByte(netPack,1)
	
	--发送剩余的特惠数量
	local totalNumber = data.TeHuiTotal[springOpenDay]
	if totalNumber ==nil then 
		DataPack.writeByte(netPack,100)
	else 
		DataPack.writeByte(netPack,100-totalNumber)
	end
	--发送我所拥有的幸运号码
	local var = Actor.getStaticVar(sysarg)
	if var.newdays==nil then 
		var.newdays={}
	end
	if var.newdays.SpringHYDT_LuckNumber ==nil then var.newdays.SpringHYDT_LuckNumber = {} end
	local myTable = var.newdays.SpringHYDT_LuckNumber
	DataPack.writeByte(netPack,#myTable)
	--print("#myTable"..#myTable)
	if #myTable~=0 then
		for i=1,#myTable do 
			DataPack.writeByte(netPack,myTable[i])
			--print("myTable[i]"..myTable[i])
		end
	end

	DataPack.flush(netPack)
end

--鸿运当头开奖
SpringHongYunDangTou_Run =function()
	local springOpenDay = get_spring_festival_day_count()
	local maxDay = SpringHongYunDangTouMaxDay()

	if springOpenDay>maxDay or springOpenDay<1 then 
		return 
	end

	local data = EnsureSpringHongYunDangTouSystemData()
	if data == nil then return end

	local randNumber = System.getRandomNumber(100)+1 --产生1~s的
	
	
	local cfg  = SpringFestivalCfg.HongYunDangTou[springOpenDay]
	if cfg == nil or cfg.HongYun_Award == nil then return end
	
	--保存幸运号码
	data.days[springOpenDay].luckNumber = randNumber

	local  luckUser= data.NumberData[randNumber]
	if luckUser ~=nil then 
		data.days[springOpenDay].luckUser = luckUser.name 
		--广播，发邮件
		--luckUser.userID 
		local nSex = luckUser.sex
		local strAward = ""
		local separator = ""
		for i=1,#cfg.HongYun_Award do
			--如果是用-1就都给，否则分性别改
			if cfg.HongYun_Award[i].sex == nSex or cfg.HongYun_Award[i].sex==-1 then 
				strAward = strAward..separator..cfg.HongYun_Award[i].id..","..cfg.HongYun_Award[i].count..","..cfg.HongYun_Award[i].bind
				separator = "/"
			end 
		end
		if strAward ~= "" then
			System.AddMail(luckUser.userID,6,0,"鸿运当头大奖","尊敬的玩家您好,\\\\恭喜您在今日的鸿运当头中荣获大奖,现奖励在邮件附件中,请及时领取!\\\\祝您游戏愉快!",0,0,strAward)
			System.broadcastTipmsg("鸿运当头今日幸运数字为：<(c0xFF00FF00)"..randNumber..string.format(">,恭喜<(n%s)>",luckUser.name).."获得今天的鸿运大奖",ttChatWindow)
		end
		System.trace("springhongyundangtou,randNumber="..randNumber..",userID="..luckUser.userID)
	else 
		--广播
		 System.broadcastTipmsg("鸿运当头今日幸运数字为：<(c0xFF00FF00)"..randNumber..">,很遗憾,鸿运大奖将无人获得",ttChatWindow)
		 System.trace("springhongyundangtou,randNumber="..randNumber..",userID=wu")
	end
	
	--要把今天的什么人拿了什么数据清空
	data.NumberData={}
	
	--给前端发消息
	--SendHongYunDangTouAllData(sysarg)
end

SendHongYunDangTouAllData=function(sysarg)
	local springOpenDay = get_spring_festival_day_count()
	local maxDay = SpringHongYunDangTouMaxDay()
	if springOpenDay>maxDay or  springOpenDay<1 then 
		return 
	end
	
	local data = EnsureSpringHongYunDangTouSystemData()
	if data == nil then return end
	
	local netPack = DataPack.allocPacket(sysarg,139,LogicCmd.miscSys.sub.sSendSpringFestivalData)
	DataPack.writeByte(netPack,11)
	DataPack.writeByte(netPack,0)
	for i=1,maxDay do 
		DataPack.writeByte(netPack,data.days[i].luckNumber)
		DataPack.writeString(netPack,data.days[i].luckUser)
	end
	DataPack.flush(netPack)
end

--把鸿运当头的系统数据给清除了
ClearSpringHongYunDangTouSystemData =function()
	local svar = System.getStaticVar()
	local maxDay = SpringHongYunDangTouMaxDay()
	if maxDay <= 0 then maxDay = 12 end
	svar.SpringHYDT_data = {}
	
	--清空全部的幸运号码和幸运儿
	svar.SpringHYDT_data.days = {}
	for i=1,maxDay do 
		svar.SpringHYDT_data.days[i] = {}
	end
	for i=1,maxDay do
		svar.SpringHYDT_data.days[i].luckNumber = 0
		svar.SpringHYDT_data.days[i].luckUser = "无"
	end
	
	--初始化一下剩余未抽中的号码
	svar.SpringHYDT_data.leftTable ={}
	
	for i=1,maxDay do 
		svar.SpringHYDT_data.leftTable[i]={}
	end 
	for j=1,maxDay do
		for i=1,100 do 
			svar.SpringHYDT_data.leftTable[j][i]=i
		end
	end
	

	--清空特惠总数控制表
	svar.SpringHYDT_data.TeHuiTotal ={}
	
	--把什么人拿了什么数字给清空的了
	svar.SpringHYDT_data.NumberData={}
end


--开始或结束都清数据
function spring_hongyun_activity_start_or_end(is_start, is_started_server)
	
	local svar = System.getStaticVar()
	if is_start then 
		if is_started_server then
			EnsureSpringHongYunDangTouSystemData()
		else
			ClearSpringHongYunDangTouSystemData()
		end
		
		if svar.SpringTime == nil or svar.SpringTime <= 0 then
			local Year,Month,Day,nHour,nMinute,nSecond = System.GetSystemTimeInMiniTime(System.getCurrMiniTime())
			local refreshTime = System.encodeNumTime(Year,Month,Day,0,0,0)
			svar.SpringTime = refreshTime
			System.saveStaticVar()
		end

        -- 守岁礼包已下架，保留独立抢红包活动的数据。
        if SpringFestivalCfg.shousui.isOpen ~= false then
            local sys = System.getStaticVar()
            sys.redpack = nil
            InitRedPacket(false)
        end
      
	else 
		svar.SpringHYDT_data = nil
	end
end

--鸿运当头数据
function spring_Hongyun_main(sysarg, packet)
	--是否在开关时间内
	if is_spring_festival_time()~=true then 
		return
	end

	
	local optType = DataPack.readByte(packet) --操作类型
	if optType==1 then --购买特惠
		BuySpringHongYunDangTouTeHui(sysarg)
	elseif optType==2 then --请求个人数数据
		SendSpringHongYunDangTouUserData(sysarg)
	elseif optType==3 then --请求总数据
		SendHongYunDangTouAllData(sysarg)
	end
end
------------------------------------------------------------------------------------------------------------------------------

--累计充值
function spring_Lijichongzhi_main(sysarg,packet)
	--是否在开关时间内
	if is_spring_festival_time()~=true then 
		return
	end

	local optType = DataPack.readByte(packet) --操作类型
	if optType ==0 then 
		GetSpringLiJiChongzhi(sysarg)
	elseif optType ==1 then 
		GetSpringLiJiChongzhiGife(sysarg,DataPack.readByte(packet),DataPack.readByte(packet))
	end
end

--累计充值数据
function GetSpringLiJiChongzhi(sysarg)

	ClearAllSpringData(sysarg)
	local netPack = DataPack.allocPacket(sysarg,139,LogicCmd.miscSys.sub.sSendSpringFestivalData)
	DataPack.writeByte(netPack,12)
	
	local cfg =SpringFestivalCfg.EveryTotalPay
	local var = Actor.getStaticVar(sysarg)
	
	-- 兜底同步：即使充值更新链路未触发，这里也按当日充值额回补一次累计达标天数
	if var.days == nil then var.days = {} end
	if var.days.spring_payTime == nil then var.days.spring_payTime = {} end
	local peyNum = var.days.PeyNum
	if peyNum == nil then peyNum = 0 end
	local springOpenDay = get_spring_festival_day_count()
	
	if var.Spring_Data.payTotal  == nil then 
		var.Spring_Data.payTotal = {}
	end
	
	if var.Spring_Data.payTotalFalg  == nil then 
		var.Spring_Data.payTotalFalg = {}
	end

	for i=1,#cfg do
		if cfg[i].needPay <= peyNum then
			if var.Spring_Data.payTotal[i] == nil then
				var.Spring_Data.payTotal[i] = 1
				var.days.spring_payTime[i] = 1
			else
				if var.Spring_Data.payTotal[i] < springOpenDay and var.days.spring_payTime[i] == nil then
					var.Spring_Data.payTotal[i] = var.Spring_Data.payTotal[i] + 1
					var.days.spring_payTime[i] = 1
				end
			end
		end
	end
	
	for i=1,#cfg do 
		if var.Spring_Data.payTotal[i]~=nil then 
			DataPack.writeByte(netPack,var.Spring_Data.payTotal[i])
			--print("var.Spring_Data.payTotal[i]="..var.Spring_Data.payTotal[i])
		else 
			DataPack.writeByte(netPack,0)
			--print("var.Spring_Data.payTotal[i]=0")
		end
	end
	
	--是否领取了
	for i=1,#cfg do 
		for j=1,#cfg[i].days do 
			if var.Spring_Data.payTotalFalg[i]==nil then 
				DataPack.writeByte(netPack,0)
			else 
				if var.Spring_Data.payTotalFalg[i][j]==nil then 
					DataPack.writeByte(netPack,0)
				else
					DataPack.writeByte(netPack,1)
				end
			end
		end
	end
    DataPack.flush(netPack)
end

--得到奖励
function GetSpringLiJiChongzhiGife(sysarg,x,y)

	local cfg = SpringFestivalCfg.EveryTotalPay
	if x<1 or x>#cfg then 
		return 
	end
	
	if y<1 or y>#cfg[x].days then 
		return 
	end
	local var = Actor.getStaticVar(sysarg)
	
	ClearAllSpringData(sysarg)
	-- 领取前先兜底更新累计充值进度，避免客户端状态已过期导致误判不可领
	GetSpringLiJiChongzhi(sysarg)
	
	if var.Spring_Data.payTotal  == nil then 
		var.Spring_Data.payTotal = {}
	end
	
	if var.Spring_Data.payTotalFalg  == nil then 
		var.Spring_Data.payTotalFalg = {}
	end
	
	if var.Spring_Data.payTotalFalg[x]==nil then 
		var.Spring_Data.payTotalFalg[x] ={}
	end
		
	if var.Spring_Data.payTotalFalg[x][y] ~=nil and var.Spring_Data.payTotalFalg[x][y]==1 then	
		Actor.sendTipmsg(sysarg,"不能重复领取",ttFlyTip)
		return 
	end
	if var.Spring_Data.payTotal[x]==nil or var.Spring_Data.payTotal[x]<y then 
		Actor.sendTipmsg(sysarg,"累计达到充值金额的天数不足",ttFlyTip)
		return 
	end
	
	
	
	local award = cfg[x].days[y].award
	
	--背包不足
	if not Awards.CheckBagGridCount(sysarg, award) then
		return 
	end
	
	var.Spring_Data.payTotalFalg[x][y] = 1
	
	--给奖励
	local bResult = Awards.Give(sysarg, award, LogIds.spring_lijichongzhi,"连续累计充值")
	if bResult == false then
		print("spring_lijichongzhi leijipay Gift error, actor name = "..Actor.getName(sysarg))
		return 
	end
	
	GetSpringLiJiChongzhi(sysarg)
		
	Actor.sendTipmsg(sysarg,"领取奖励成功",ttFlyTip)
	
	System.sendCommonLog(LogIds.spring_lijichongzhi,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,x.."档"..y.."天")

	System.broadcastTipmsg(string.format("<(n%s)>玩家领取了春节连续累计充值礼包,超级丰盛<我也要领取/@@showWin,243,2>",Actor.getName(sysarg)), ttChatWindow)
	
end

------------------------------------------------------------------------------

--消费转盘
function spring_xiaofeizhuanpan_main(sysarg,packet)
	if SpringFestivalCfg.XiaoFeiZhuanPanNew.isOpen == false then return end
	--是否在开关时间内
	if is_spring_festival_time()~=true then 
		return
	end

	local optType = DataPack.readByte(packet) --操作类型
	if optType ==0 then 
		GetSpringXiaoFeiZhuanPanData(sysarg)
	elseif optType ==1 then 
		GetSpringXiaoFeiZhuanPanGife(sysarg)
	end
end

--消费转盘数据
function GetSpringXiaoFeiZhuanPanData(sysarg)
	if SpringFestivalCfg.XiaoFeiZhuanPanNew.isOpen == false then return end
	ClearAllSpringData(sysarg)
	local var = Actor.getStaticVar(sysarg)
	
	local netPack = DataPack.allocPacket(sysarg,139,LogicCmd.miscSys.sub.sSendSpringFestivalData)
	DataPack.writeByte(netPack,13)
	if var.Spring_Data.XFZPCosume ==nil then
		DataPack.writeUInt(netPack,0)
		--print("var.Spring_Data.XFZPCosume=0")
	else	
		DataPack.writeUInt(netPack,var.Spring_Data.XFZPCosume) --消费额度
		--print("var.Spring_Data.XFZPCosume="..var.Spring_Data.XFZPCosume)
	end
	
	if var.Spring_Data.XFZP ==nil then
		DataPack.writeByte(netPack,0)
		--print("var.Spring_Data.XFZP=0")
	else
		DataPack.writeByte(netPack,var.Spring_Data.XFZP-1) --已经转到第几个
		--print("var.Spring_Data.XFZP="..var.Spring_Data.XFZP-1)
	end
	DataPack.flush(netPack)
end

--消费转盘
function GetSpringXiaoFeiZhuanPanGife(sysarg)
	if SpringFestivalCfg.XiaoFeiZhuanPanNew.isOpen == false then return end

	local var = Actor.getStaticVar(sysarg)
	local svar = System.getStaticVar()
	if SpringFestivalCfg.XiaoFeiZhuanPanNew[1]==nil then 
		Actor.sendTipmsg(sysarg,"配置错误",ttFlyTip)
		return
	end
	
	--初始化
	ClearAllSpringData(sysarg)
	if var.Spring_Data.XFZP ==nil then
		var.Spring_Data.XFZP=1
	end
	
	
	local cfg = SpringFestivalCfg.XiaoFeiZhuanPanNew[1]
	
	if var.Spring_Data.XFZP>#cfg then
		Actor.sendTipmsg(sysarg,"配置错误",ttFlyTip)
		return
	end
	
	cfg = cfg[var.Spring_Data.XFZP]
	
	local needSpend = cfg.needPay
	
	if var.Spring_Data.XFZPCosume==nil or needSpend>var.Spring_Data.XFZPCosume then 
		Actor.sendTipmsg(sysarg,"消费不足",ttFlyTip)
		return 
	end
	
	
	
	if not Awards.CheckBagGridCount(sysarg, cfg.award) then
		--return
		Actor.sendTipmsg(sysarg,"奖品已经发到邮件",ttFlyTip)
		local nActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
		System.AddMail(nActorId,6,0,"春节活动消费转盘奖品","春节活动消费转盘奖励",0,0,cfg.award[1].id..","..cfg.award[1].count..","..cfg.award[1].bind)
	else
		Awards.Give(sysarg,cfg.award,LogIds.spring_xiaofeizhuangpan,"春节活动消费转盘")
	end
		
	
	--改记录买了是多少次
	var.Spring_Data.XFZP = var.Spring_Data.XFZP +1
	--记录下来
	System.sendCommonLog(LogIds.spring_xiaofeizhuangpan,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,var.Spring_Data.XFZP-1,"","",cfg.award[1].txt)
	--给前端发协议
	GetSpringXiaoFeiZhuanPanData(sysarg)
	
	System.broadcastTipmsg(string.format("<(n%s)>玩家通过消费转盘领取了%s,<我也要领取/@@showWin,243,7>",Actor.getName(sysarg),Item.getItemLinkMsg(cfg.award[1].id)), ttChatWindow)
end

----------------------------------------------------------------------------------------------------

--寻宝返利
function spring_xunbaofanli_main(sysarg,packet)
	--是否在开关时间内
	if is_spring_festival_time()~=true then 
		return
	end

	local optType = DataPack.readByte(packet) --操作类型
	if optType ==0 then 
		GetSpringXunBaoFanLiData(sysarg)
	elseif optType ==1 then 
		GetSpringXunBaoFanLiGife(sysarg,DataPack.readByte(packet))
	end
end

function GetSpringXunBaoFanLiData(sysarg)
		
	local var = Actor.getStaticVar(sysarg)	
	if var.newdays == nil then var.newdays = {} end
		
	local XunBaoTime = var.newdays.XunBaoTime
	if XunBaoTime == nil then XunBaoTime = 0 end
		
	if var.newdays.Spring_hunt_times_flags == nil then var.newdays.Spring_hunt_times_flags = 0 end
	
	local netPack = DataPack.allocPacket(sysarg,139,LogicCmd.miscSys.sub.sSendSpringFestivalData)
	DataPack.writeByte(netPack,14)
	DataPack.writeUInt(netPack, XunBaoTime)	-- 寻宝次数
	--print("XunBaoTime="..XunBaoTime)
	DataPack.writeUInt(netPack, var.newdays.Spring_hunt_times_flags)
	--print("var.newdays.Spring_hunt_times_flags="..var.newdays.Spring_hunt_times_flags)	
		
	DataPack.flush(netPack)	
end

--寻宝赠送豪礼
function GetSpringXunBaoFanLiGife(sysarg, index)
	
	local var = Actor.getStaticVar(sysarg)
	if var.newdays == nil then var.newdays = {} end
	
	local XunBaoTime = var.newdays.XunBaoTime
	if XunBaoTime == nil then XunBaoTime = 0 end

	if index < 1 or index > 32 then return end
	
	local item_cfg = SpringFestivalCfg.hunt_times[index]
	if item_cfg == nil then return end
	
	if XunBaoTime < item_cfg.times then
		Actor.sendTipmsg(sysarg, "您今天的寻宝次数不足"..item_cfg.times.."次", ttFlyTip)
		return
	end
	
	local Spring_hunt_times_flags = var.newdays.Spring_hunt_times_flags
	if Spring_hunt_times_flags == nil then Spring_hunt_times_flags = 0 end
	
	local f = System.getIntBit(Spring_hunt_times_flags, index-1)
	if (f ~= 0) then
		Actor.sendTipmsg(sysarg, "该奖励已经领取", ttFlyTip)
		return
	end
	
	if Awards.CheckBagGridCount(sysarg, item_cfg.award) ~= true then
		return 
	end
	
	if Awards.GiveNoCheck(sysarg, item_cfg.award, LogIds.springxunbaofanli, tostring(index)) == false then
		Actor.sendTipmsg(sysarg, "赠送豪礼失败!", ttFlyTip)
		local actorId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
		print("Awards.Give fail, qd_get_hunt_times_award actorid="..actorId..",index="..index)
		return
	end
	
	Spring_hunt_times_flags = System.setIntBit(Spring_hunt_times_flags, index-1, true)
	var.newdays.Spring_hunt_times_flags = Spring_hunt_times_flags
	
	Actor.sendTipmsg(sysarg, "赠送豪礼成功!", ttFlyTip)
	
	GetSpringXunBaoFanLiData(sysarg)
end

register_spring_festival_func(9, spring_XianShiQiangGou_main)
register_spring_festival_func(10, spring_JiZi_main)
register_spring_festival_func(11, spring_Hongyun_main)

register_spring_festival_func(12, spring_Lijichongzhi_main)
register_spring_festival_func(13, spring_xiaofeizhuanpan_main)
register_spring_festival_func(14, spring_xunbaofanli_main)


--每次用哪个之前
function ClearAllSpringData(sysarg)
	local svar = System.getStaticVar()
	local var = Actor.getStaticVar(sysarg) 
	--跨服不改变数据
	if System.isCrossServer()==true then 
		return 
	end
	
	if var.Spring_Data==nil then 
		var.Spring_Data ={}
	end
	
	--春节还没有开
	if svar.SpringTime ==nil then 
		return 
	end
	
	if var.SpringTime ==nil or var.SpringTime~=svar.SpringTime then 
		
		if var.SpringTime==nil then 
			var.SpringTime=0
		end
		
		local actorid = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
		--System.trace(actorid.." clear dajidali date , on the way "..n.."    var.StartJingJi_MiNitime="..var.StartJingJi_MiNitime..",svar.StartJingJi_MiNitime="..svar.StartJingJi_MiNitime)
		var.SpringTime = svar.SpringTime
		var.Spring_Data ={} --把所有的数据清了
		
		
		--累计发送新年红包数
		var.spring_redpacket_totalCount = 0
		--累计领取红包奖励
		var.spring_flags =0
		
		--累计登录
		var.spring_login_count =0
		var.spring_login_flags =0

    
        
   
	end	
end

register_spring_festival_start_end_func(spring_hongyun_activity_start_or_end)
