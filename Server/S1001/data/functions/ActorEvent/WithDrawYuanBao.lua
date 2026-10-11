
--#include "data\config\guide\paysales.lua" once --充值促销系统
--#include "data\functions\Systems\PaySalesSystem\Common.lua" once

--#include "data\functions\Systems\PaySalesSystem\SurpriseRet.lua" once --惊喜回馈

--#include "data\functions\Activity\Festival\FestivalWithDrawYuanbao.lua" once  --新春反馈
--#include "data\functions\Systems\Platforms\7KPlatform.lua" once
--#include "data\functions\Systems\Platforms\BtyouPlatform.lua" once
--#include "data\functions\player.lua" once
--#include "data\functions\Activity\PublicTest.lua" once  --公测活动
--#include "data\functions\modules\OpenServer_Pay_Rank.lua" once --开服充值活动
--#include "data\functions\SuperLuckStarFunc.lua" once
--#include "data\functions\OldPlayerReturnFunc.lua" once
--#include "data\config\activity\OpenServerAwardCfg.lua" once
--#include "data\config\activity\XiaoFeiZhuanPan.lua" once
--#include "data\config\activity\QingDianActivityCfg.lua" once --庆典活动
--#include "data\config\activity\SanRenHongLiCfg.lua" once  --散人红利
--#include "data\config\new_activity\festival\activity_jingji.lua" once --散人竞技


--提取元宝
EventCallDispatcher.WithDrawYuanBaoHandler = function (sysarg, args)
	local nYuanBao = args[1]	--提取元宝数目
	
	OnCumulativeRecharge(sysarg,nYuanBao)  --合区充值
	
	--OnDoubleEggRecharge(sysarg,nYuanBao)   --双蛋充值
 
	OnOpenServerRecharge(sysarg,nYuanBao)  --公测开区前7天充值
	
	OnOneHundredActivity(sysarg,nYuanBao)  --百服活动
	
	OnLobarRecharge(sysarg,nYuanBao)	   --51活动
	
	OnPayExtractWing(sysarg,nYuanBao);	--player.lua里的元宝提取回调

	OnPaySalesWithDrawYuanBao(sysarg, nYuanBao)
	
	OnSurpriseRetWithDrawYuanBao(sysarg, nYuanBao)

	OnFestivalWithDrawYuanbao(sysarg, nYuanBao)
	
	--合并为一个函数
	GetPeyYuanBaoHandlerEx(sysarg,args)
	
	--OnPublicTestWithDrawYB(sysarg, nYuanBao) -- 公测充值
	OnLivenessWithDrawYB(sysarg, nYuanBao)
	
	ht_OnWithDrawYuanBao(sysarg, nYuanBao)

     local actorID = Actor.getIntProperty(sysarg, PROP_ENTITY_ID);
    
    Pay_Rank_UpdateItem(actorID,Actor.getName(sysarg),nYuanBao)
	
	-- 放在 GetPeyYuanBaoHandlerEx() 之后
	OnLuaEvent(LuaEventId.ActorPayMoney, sysarg, nYuanBao)
    
end

EventCallDispatcher.YuanBaoChangedEventHandler = function (sysarg, args)
	local nYuanBao = args[1]	--改变元宝数目
	local nLogId = args[2] --日志ID
	local isConsume = args[3] -- number 值，0为不是，1为是
	
	if isConsume == 1 and nYuanBao < 0 then		
		OnConsumeYuanBaoEvent(sysarg, -nYuanBao, nLogId)
	end
end

--消费元宝，该函数可热更(@rsf)
function OnConsumeYuanBaoEvent(sysarg, nYuanBao, nLogId)
	local actorVar = Actor.getStaticVar(sysarg)
	if actorVar.days == nil then actorVar.days = {} end
	if actorVar.newdays == nil then actorVar.newdays = {} end
					
    --老兵回归，重刷
     local sys = System.getStaticVar()
     if sys.oldplayer ~= nil then
         
         local var = Actor.getStaticVar(sysarg)
         if var.dayoldplayerconsume == nil then var.dayoldplayerconsume = 0 end
         var.dayoldplayerconsume = var.dayoldplayerconsume + nYuanBao
         OldPlayerReturnGetInfo(sysarg)
     end
	OnRankingConsumeYbEvent(sysarg, nYuanBao)
	
	
	--周年庆典
	local svar = System.getStaticVar()
	local isInOneYearActivity =true
	if svar.StartOneYear_OpenDay==nil then 
		isInOneYearActivity =false 
	end
	if svar.isDringOneYearAct ==nil or svar.isDringOneYearAct<1 or svar.isDringOneYearAct>svar.StartOneYear_OpenDay then 
		isInOneYearActivity=false 
	end
	if (isInOneYearActivity==true) then
		ClearOneYear_Data(sysarg)
		local var = Actor.getStaticVar(sysarg)
		if var.OneYearAct_Data.XFZPCosume ==nil then
			var.OneYearAct_Data.XFZPCosume = nYuanBao
		else
			var.OneYearAct_Data.XFZPCosume = var.OneYearAct_Data.XFZPCosume + nYuanBao
		end
		
		GetOneYearActInfo(sysarg,11)
	end
	
	
	-- 万服庆典消费转盘已下架，不再累计或发送提醒。
	
	--是否在春节活动，累加消费次数
	if is_spring_festival_time()==true then 
		ClearAllSpringData(sysarg) --清除上次活动的数据
		
		local var = Actor.getStaticVar(sysarg)
		if var.Spring_Data.XFZPCosume ==nil then
			var.Spring_Data.XFZPCosume = nYuanBao
		else
			var.Spring_Data.XFZPCosume = var.Spring_Data.XFZPCosume + nYuanBao
		end
		
		GetSpringXiaoFeiZhuanPanData(sysarg)
	end
	
	
	--五一活动时候消费，平时也是可以用的。。。
	local var = Actor.getStaticVar(sysarg)
	local dayConsumeYB_WUYI = var.dayConsumeYB_WUYI
	if dayConsumeYB_WUYI == nil then
		dayConsumeYB_WUYI = nYuanBao
	else
		dayConsumeYB_WUYI = dayConsumeYB_WUYI + nYuanBao
	end
	var.dayConsumeYB_WUYI = dayConsumeYB_WUYI
	
	System.sendCommonLog(LogIds.xiaofeiLog,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),nLogId,nYuanBao,dayConsumeYB_WUYI,"消费日志总数")
	
	OnLuaEvent(LuaEventId.ActorConsumeYb, sysarg, nYuanBao)
	local newdays = var.newdays
	if newdays == nil then
		newdays = {}
		var.newdays = newdays
	end
	
	--System.trace(Actor.getIntProperty(sysarg,PROP_ENTITY_ID).." dayconsumeLog:"..var.dayConsumeYB_WUYI)
	
	--------------------------这个是计算消费转盘，能够得到多少次转盘机会-------------------------------
	--local nNowDt = System.getCurrMiniTime()
	--local y,m,d,nHour,nMinute,nSecond = System.GetSystemTimeInMiniTime(nNowDt)
	--if y==2018 and m==4 and d==25 then 
	--	if var.dayCountRunLuck==nil then 
	--		var.dayCountRunLuck = var.dayConsumeYBCanChangeRun
	--	end
	--end
	local Yb = XiaoFeiZhuanPan.cosumeEveryYB
	if ZP_IsUseOld() then 
	
		if var.dayCountRunLuck==nil then 
			var.dayCountRunLuck = nYuanBao
		else 
			var.dayCountRunLuck = nYuanBao + var.dayCountRunLuck 
		end
		
		
		
		if var.dayCountRunLuck>=Yb then 
			local addTime  = math.floor(var.dayCountRunLuck/Yb)
			var.dayCountRunLuck = var.dayCountRunLuck - addTime*Yb
			
			--转盘可以转的次数
			if newdays.ZPcanDoTime ==nil then
				newdays.ZPcanDoTime = addTime
			else 
				newdays.ZPcanDoTime = newdays.ZPcanDoTime + addTime
			end	
		end
		
		
		
		
		local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sXiaoFeiZhuanPan)
		DataPack.writeByte(netPack,1)
		if newdays.ZPcanDoTime ==nil then
			DataPack.writeInt(netPack,0)
		else
			DataPack.writeInt(netPack,newdays.ZPcanDoTime)
		end
		DataPack.writeUInt(netPack,dayConsumeYB_WUYI)
		DataPack.flush(netPack)
			

	else 
		local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sXiaoFeiZhuanPan)
		DataPack.writeByte(netPack,1)
		if newdays.ZPhasDoTime ==nil then
			DataPack.writeInt(netPack,math.floor(dayConsumeYB_WUYI/Yb))
		else
			DataPack.writeInt(netPack,math.floor(dayConsumeYB_WUYI/Yb)-newdays.ZPhasDoTime)
		end
		DataPack.writeUInt(netPack,dayConsumeYB_WUYI)
		DataPack.flush(netPack)
		
	end
	--var.dayConsumeYBCanChangeRun = dayConsumeYBCanChangeRun
	--------------------------这个是计算消费转盘，能够得到多少次转盘机会-------------------------------
	
	

	--消费实时更新
	sendClientConsumeInfo(sysarg)
	
	--开服活动的7天消费
	--local openServerDay = System.getDaysSinceOpenServer()
	--if openServerDay<1 or openServerDay>7 then 
	--	return 
	--end
	--
	----其他的一部分在c++拦截了
	--local canNotBeConsume={
	--2420,--个人押镖
	--2636, --行会镖车押镖
	--2665, --天降红包
	--}
	--for i=1,#canNotBeConsume do 
	--	if nLogId ==canNotBeConsume[i] then 
	--		return --这个会把以上消费拦截
	--	end
	--end
	--
	--if var.days.senveDcosume ==nil then 
	--	var.days.senveDcosume=0 
	--end
	--var.days.senveDcosume = var.days.senveDcosume + nYuanBao
	--SendSevenDayCosumesMoney(sysarg)
	
	
	--大吉大利，累计消费
	--local svar = System.getStaticVar()
	if (svar.isDringDaJiDaLi ==nil or svar.isDringDaJiDaLi<2 or svar.isDringDaJiDaLi>3)==false then 
		ClearDaJiDaLi_Data(sysarg,2)
		local var = Actor.getStaticVar(sysarg)
		if var.DJDL_Data.Consume==nil then
			var.DJDL_Data.Consume = nYuanBao
		else
		    var.DJDL_Data.Consume = nYuanBao + var.DJDL_Data.Consume
		end
	end
	
	--(这个是计算消费转盘，能够得到多少次转盘机会-------------------------------
	--local dayConsumeYBCanChangeRun = var.dayConsumeYBCanChangeRun
	--if dayConsumeYBCanChangeRun == nil then
	--	dayConsumeYBCanChangeRun = nYuanBao
	--else
	--	dayConsumeYBCanChangeRun = dayConsumeYBCanChangeRun + nYuanBao
	--end
	--
	--local Yb = XiaoFeiZhuanPan.cosumeEveryYB
	--if dayConsumeYBCanChangeRun>=Yb then 
	--	local addTime  = math.floor(dayConsumeYBCanChangeRun/Yb)
	--	dayConsumeYBCanChangeRun = dayConsumeYBCanChangeRun - addTime*Yb
	--	
	--	--转盘可以转的次数
	--	if var.newdays.ZPcanDoTime ==nil then 
	--		var.newdays.ZPcanDoTime = addTime
	--	else 
	--		var.newdays.ZPcanDoTime = var.newdays.ZPcanDoTime + addTime
	--	end	
	--end
	
	

	
end


function UpdateQingDianEveryTotalPayProgressByDailyPay(sysarg, var, svar)
	if (svar.isDringQingDianActivity == nil or svar.isDringQingDianActivity < 1 or svar.QingDian_openDay == nil or svar.isDringQingDianActivity > svar.QingDian_openDay) == false then
		ClearQingDian_Data(sysarg) -- 清除上次活动的数据

		local cfg = QingDianActivityCfg.EveryTotalPay
		if var.QDHD_Data.payTotal == nil then
			var.QDHD_Data.payTotal = {}
		end

		-- 控制一天只可以加一次
		if var.days.qingdianPayTime == nil then
			var.days.qingdianPayTime = {}
		end
		for i = 1, #cfg do
			if cfg[i].needPay <= var.days.PeyNum then
				if var.QDHD_Data.payTotal[i] == nil then
					var.QDHD_Data.payTotal[i] = 1
					var.days.qingdianPayTime[i] = 1
				else
					if svar.isDringQingDianActivity ~= nil and var.QDHD_Data.payTotal[i] >= svar.isDringQingDianActivity then
					else
						if var.days.qingdianPayTime[i] == nil then
							var.QDHD_Data.payTotal[i] = 1 + var.QDHD_Data.payTotal[i]
							var.days.qingdianPayTime[i] = 1
						end
					end
				end
			end
		end
	end
end

function UpdateSanRenHongLiEveryTotalPayProgressByDailyPay(sysarg, var, svar)
	if (svar.isDringSanRenHongLi == nil or svar.isDringSanRenHongLi < 1 or svar.isDringSanRenHongLi > 3) == false then
		ClearSanRenHongLi_Data(sysarg) -- 清除上次活动的数据

		local cfg = SanRenHongLiCfg.EveryTotalPay
		if var.SRHL_Data.payTotal == nil then
			var.SRHL_Data.payTotal = {}
		end

		-- 控制一天只可以加一次
		if var.days.hongliPayTime == nil then
			var.days.hongliPayTime = {}
		end
		for i = 1, #cfg do
			if cfg[i].needPay <= var.days.PeyNum then
				if var.SRHL_Data.payTotal[i] == nil then
					var.SRHL_Data.payTotal[i] = 1
					var.days.hongliPayTime[i] = 1
				else
					if svar.isDringSanRenHongLi ~= nil and var.SRHL_Data.payTotal[i] >= svar.isDringSanRenHongLi then
					else
						if var.days.hongliPayTime[i] == nil then
							var.SRHL_Data.payTotal[i] = 1 + var.SRHL_Data.payTotal[i]
							var.days.hongliPayTime[i] = 1
						end
					end
				end
			end
		end
	end
end


function GetPeyYuanBaoHandlerEx(sysarg, args)
	--print("WithDrawYuanBaoHandler")
	local nYuanBao = args[1]	--获取充值元宝数目
	local var = Actor.getStaticVar(sysarg)
	if var.days == nil then var.days = {} end
	if not var.nYuanBao_timedGift then
		var.nYuanBao_timedGift = 0
	end
	if System.getDaysSinceOpenServer() <= 7 then  --开服前7天，玩家累积充值的总数量
		var.nYuanBao_timedGift = var.nYuanBao_timedGift + nYuanBao
	end
	
	if not var.getFlag then
		local pack = DataPack.allocPacket(sysarg, 26, 67)
		DataPack.writeByte(pack,0)
		DataPack.flush(pack)		
	end
	
	--获取玩家私人变量
	
	local peyNum = var.days.PeyNum
	if not peyNum then 
		var.days.PeyNum = 0 --每天充值数量
		peyNum = var.days.PeyNum
	end
	local peyflag = var.days.PeyFlag
	if not peyflag then 
		var.days.PeyFlag = 0	--每天领取的标识
		peyflag = var.days.PeyFlag
	end	

	local RechargeIntegral = var.RechInt
	if not RechargeIntegral then 
		var.RechInt = 0
	end
	
	local YuanBao = var.nYuanBao
	if not YuanBao then 
		var.nYuanBao = nYuanBao
	end 
	
	var.RechInt = var.RechInt + nYuanBao
	
	-- print("var.RechInt="..var.RechInt)  --累计充值500RMB，发送邮件
	--if var.YBgift==nil and var.RechInt>=50000 then   --这个别的地方有用到
	
	--累计充值500RMB，发送邮件
	local curPoint = Actor.getIntProperty(sysarg, PROP_ACTOR_VIP_POINT) --这个就是总元宝数量，用作计算vip值的，是最准确的
	curPoint = curPoint + nYuanBao
  
  --[[变态版屏蔽
	if var.YBgift==nil and curPoint>=50000  then 
        local PayArrInfo = 
        {
            [3] = 
            {
                QQ = "800002075",
                Name = "51",
            },
            [5] = 
            {
                QQ = "3002905838",
                Name = "搜狗",
            },
            -- [6] =
            -- {
            --     QQ = "2355479139",
            --     Name = "5399",
            -- },

        }
        local nSpid = System.getSpid()

        local PayInfo = PayArrInfo[nSpid]
        if PayInfo ~= nil then
            local actorID = Actor.getIntProperty(sysarg, PROP_ENTITY_ID);
           local str = ""
           --搜狗不一样的
           if nSpid == 5 then
                str ="您好，\\\\我是您在"..PayInfo.Name.."《"..System.getServerNameEx().."》的<(c0xFF00b050)专属贵宾客服经理>，很高兴为您服务；\\\\这是我们为您准备的一份<(c0xFF00b050)见面礼>哦！祝您成就"..System.getServerNameEx().."！\\\\充满3000元即可添加贵宾企业QQ ，享受更加贴心的服务，添加有更多惊喜哦！"
           else
                str = "您好，\\\\我是您在"..PayInfo.Name.."《"..System.getServerNameEx().."》的<(c0xFF00b050)专属贵宾客服经理>，很高兴为您服务；\\\\这是我们为您准备的一份<(c0xFF00b050)见面礼>哦！祝您成就"..System.getServerNameEx().."！\\\\添加贵宾企业<(c0xFFff0000)QQ>：<(c0xFFff0000)"..PayInfo.QQ..">，享受更加贴心的服务，添加有更多惊喜哦！"
           end
          
           System.AddMail(actorID,6,0,"《"..System.getServerNameEx().."》专属客服",str,0,0,"5138,1,1")
		    --System.AddMail(actorID,6,0,"《"..System.getServerNameEx().."》专属客服","您好，\\\\我是您在51《"..System.getServerNameEx().."》的<(c0xFF00b050)专属贵宾客服经理>，很高兴为您服务；\\\\这是我们为您准备的一份<(c0xFF00b050)见面礼>哦！祝您成就"..System.getServerNameEx().."！\\\\添加贵宾企业<(c0xFFff0000)QQ>：<(c0xFFff0000)800002075>，享受更加贴心的服务，添加有更多惊喜哦！",0,0,"5138,1,1")
        end
		
		var.YBgift =1
	end
	--]]

	--获取上次领取每次充值礼包时间和本次登录时间
	local loginTime = System.getCurrMiniTime()
	local lastPeyTime = var.lastPeyTime
	if not lastPeyTime then
		lastPeyTime = loginTime
		var.lastPeyTime = loginTime
	end

	--检查是否同一天
	if System.isSameDay(loginTime, lastPeyTime) == false then
		var.days.PeyNum = 0				--如果不是同一天，则清空上次的领取标识和充值数量
		var.days.PeyFlag = 0
		var.days.PeyNum = var.days.PeyNum + nYuanBao
	else
		var.days.PeyNum = peyNum + nYuanBao
	end
	var.lastPeyTime = System.getCurrMiniTime()
	--下发今天充值的元宝数
	
	--完成活跃度任务
	if var.days.PeyNum>=1000 then 
		OnFinish_Liveness(sysarg,7)
	end
	

	SendTodayPay(sysarg);
	
	SendCombineData(sysarg)
      --老兵回归，重刷
     local sys = System.getStaticVar()
     if sys.oldplayer ~= nil then
         OldPlayerReturnGetInfo(sysarg)
     end
	 
	 
	 --开服活动,累计充值
	local openSeverDay = System.getDaysSinceOpenServer()
	if openSeverDay>=1 and openSeverDay<=7 then 
		local cfg = OpenServerAward[12].list.PayRMB

		if var.OScontinuePay==nil then 
			var.OScontinuePay={}
		end
		--for i=1,#cfg do 
			var.OScontinuePay[openSeverDay] = var.days.PeyNum
		--end
		
		--7日的充值数据全部下发
		local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sOpenSeverContinuePay)
		DataPack.writeByte(netPack, 0)
		for i=1,7 do 
			if var.OScontinuePay[i]==nil then 
				DataPack.writeInt(netPack, 0)
			else 
				DataPack.writeInt(netPack, var.OScontinuePay[i])
			end
		end
		DataPack.flush(netPack)
	end
	
	--大吉大利，累计充值
	local svar = System.getStaticVar()
	if (svar.isDringDaJiDaLi ==nil or svar.isDringDaJiDaLi<1 or svar.isDringDaJiDaLi>3)==false then 
		ClearDaJiDaLi_Data(sysarg,3)
		local var = Actor.getStaticVar(sysarg)
		--if var.DJDL_Data.chongzhi==nil then
		--	var.DJDL_Data.chongzhi = nYuanBao
		--else
		--    var.DJDL_Data.chongzhi = nYuanBao + var.DJDL_Data.chongzhi
		--end
		
		local cfg =activity_DaJiDaLi.payGiveAwardNew.needMoney
		if var.days.dajidaliAddFlag ==nil then 
			var.days.dajidaliAddFlag={}
		end
		for i=1,#cfg do 
			if var.days.PeyNum >=cfg[i] and var.days.dajidaliAddFlag[i]==nil then --今天第一次完成充值
				var.days.dajidaliAddFlag[i]=1
				if var.DJDL_Data.chongzhiDataNew==nil then 
					var.DJDL_Data.chongzhiDataNew={}
				end
				if var.DJDL_Data.chongzhiDataNew[i]==nil then 
					var.DJDL_Data.chongzhiDataNew[i]=1
				else 
					var.DJDL_Data.chongzhiDataNew[i] = 1 + var.DJDL_Data.chongzhiDataNew[i]
				end
				
				if var.DJDL_Data.chongzhiDataNew[i]>svar.isDringDaJiDaLi then --容错，不能比当前天数大
					var.DJDL_Data.chongzhiDataNew[i] = svar.isDringDaJiDaLi
				end
				--print("var.DJDL_Data.chongzhiDataNew[i]="..var.DJDL_Data.chongzhiDataNew[i])
				
			end
		end
		GetDaJiDaLiInfo(sysarg,12)
	end
	
	
	UpdateQingDianEveryTotalPayProgressByDailyPay(sysarg, var, svar)
	
	--在国庆活动里面
	if GetNationalIndexDay ~= nil and EnsureNationalDayRewardCycle ~= nil and
		NationalDayActivityCfg ~= nil and NationalDayActivityCfg.NationalDayNew ~= nil then
		local dayIndex = GetNationalIndexDay()
		if dayIndex>=1 and dayIndex<=7 then
			EnsureNationalDayRewardCycle(sysarg)
			if var.days.PeyNum>=NationalDayActivityCfg.NationalDayNew[dayIndex].needYB then
				if var.nationalDayInfoNew==nil then
					var.nationalDayInfoNew=0
				end
				if System.getIntBit(var.nationalDayInfoNew,dayIndex)==0 then
					var.nationalDayInfoNew = System.setIntBit(var.nationalDayInfoNew,dayIndex,true)
					--给前端发协议
					if SentNationalDayInfoNew ~= nil then SentNationalDayInfoNew(sysarg) end
				end
			end
		end
	end
	
	
	UpdateSanRenHongLiEveryTotalPayProgressByDailyPay(sysarg, var, svar)
	
	
	--是否在竞技活动里面，是的话，判断超过3000，10000的累计天数有多少
	if (svar.isDringJingJi ==nil or svar.isDringJingJi<1 or svar.JingJiOpenDay==nil or svar.isDringJingJi>svar.JingJiOpenDay)==false then 
		ClearJingJi_Data(sysarg)
		local var = Actor.getStaticVar(sysarg)
		
		local cfg =activity_jingji.payGiveAwardNew.needMoney
		if var.days.jingjiAddFlag ==nil then 
			var.days.jingjiAddFlag={}
		end
		for i=1,#cfg do 
			if var.days.PeyNum >=cfg[i] and var.days.jingjiAddFlag[i]==nil then --今天第一次完成充值
				var.days.jingjiAddFlag[i]=1
				if var.JingJi_Data.chongzhiDataNew==nil then 
					var.JingJi_Data.chongzhiDataNew={}
				end
				if var.JingJi_Data.chongzhiDataNew[i]==nil then 
					var.JingJi_Data.chongzhiDataNew[i]=1
				else 
					var.JingJi_Data.chongzhiDataNew[i] = 1 + var.JingJi_Data.chongzhiDataNew[i]
				end
				
				if var.JingJi_Data.chongzhiDataNew[i]>svar.isDringJingJi then --容错，不能比当前天数大
					var.JingJi_Data.chongzhiDataNew[i] = svar.isDringJingJi
				end
				--print("var.JingJi_Data.chongzhiDataNew[i]="..var.JingJi_Data.chongzhiDataNew[i])
				
			end
		end
		
		GetJingjiiInfo(sysarg,3)
	end	
	
	--是否在春节里面，是的话，判断超过100,500,2000的累计天数有多少
	if (is_spring_festival_time()==true) then 
		ClearAllSpringData(sysarg) --清除上次活动的数据
		
		local cfg = SpringFestivalCfg.EveryTotalPay
		if var.Spring_Data == nil then var.Spring_Data = {} end
		if var.Spring_Data.payTotal == nil then 
			var.Spring_Data.payTotal = {}
		end
		
		--控制一天只可以加一次
		if var.days.spring_payTime==nil then 
			var.days.spring_payTime ={}
		end
		
		local springOpenDay = get_spring_festival_day_count()
		
		for i=1,#cfg do 
			if cfg[i].needPay<=var.days.PeyNum then 
				if var.Spring_Data.payTotal[i] == nil then 
					var.Spring_Data.payTotal[i]=1
					var.days.spring_payTime[i]=1

				else 
					if var.Spring_Data.payTotal[i]>=springOpenDay then 
					
					else 

						if var.days.spring_payTime[i]==nil then 
							var.Spring_Data.payTotal[i] = 1 + var.Spring_Data.payTotal[i]
							var.days.spring_payTime[i] = 1
						end

					end
				end
			end
		end
		if GetSpringLiJiChongzhi ~= nil then
			GetSpringLiJiChongzhi(sysarg)
		end
	end
	
end

--充值赠送神器
EventCallDispatcher.GetRecharge = function (sysarg,args)
	--判断角色是否充值了
	if 0 >= Actor.getUIntProperty(sysarg, PROP_ACTOR_DRAW_YB_COUNT) then
		--您尚未充值，无法领取奖励.. (4)
		Actor.sendTipmsg(sysarg, Lang.Activity.czzs001, ttDialog)
		return
	end
	
	--判断是否已经领取
	local var = Actor.getStaticVar(sysarg)
	local getFlag = var.getFlag
	if not getFlag then 
		var.getFlag = 0
		getFlag = var.getFlag
	else
		if 1 == getFlag then
			--已经领取了,--关闭图标
			local pack = DataPack.allocPacket(sysarg, 26, 67)
			DataPack.writeByte(pack,1)
			DataPack.flush(pack)
			return
		end
	end
	
	--检查背包空格子数量
	if 0 >= Item.getBagEmptyGridCount(sysarg) then
		--请至少整理出一个背包空格来容纳奖励..(4)
		Actor.sendTipmsg(sysarg, Lang.Activity.czzs002, ttDialog)
		return
	end
	
	--[[
	--要添加的道具ID
	local addItemID = 698
	--道具时间限制
	local itemTimeLimit = 43200
	
	--添加到背包
	if Actor.addItem(sysarg,addItemID,0,0,1,1,itemTimeLimit,"GetRecharge",954) >= 1 then
		--修改领取标志位
		var.getFlag = 1
		
		--关闭图标
		local pack = DataPack.allocPacket(sysarg, 26, 67)
		DataPack.writeByte(pack,1)
		DataPack.flush(pack)
		
		--恭喜您成功领取了充值神器奖励!(256)
		Actor.sendTipmsg(sysarg, Lang.Activity.czzs003, ttFlyTip)
		--玩家XXXX成功领取了充值特别奖励,绝世神器XXXXX一把!(聊天框+2)
		System.broadcastTipmsg(string.format(Lang.ScriptTips.zf598,Actor.getName(sysarg),Item.getItemLinkMsg(addItemID)),ttScreenCenter+ ttChatWindow)		
	else
		print("Award Item Error , ItemId is 698,  ActorName = "..Actor.getName(sysarg))
	end
	--]]
end

--下发今天充值的元宝数
function SendTodayPay(sysarg)
	local var = Actor.getStaticVar(sysarg)
	if var.days == nil then var.days = {} end
	local pay = var.days.PeyNum
	
	--0也要发，因为有可能是隔天
	if (pay == nil) then pay = 0 end
	if System.isCrossServer() == true then return end
	local pack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sSendTodayPay)
	DataPack.writeInt(pack, pay)
	DataPack.flush(pack)
end

function OnCumulativeRecharge(sysarg,nYuanBao)
	
	local CombineDays = System.getDaysSinceCombineServer()
	if CombineDays > 5 or CombineDays <= 0 then 	
		return 
	end
	
	local var = Actor.getStaticVar(sysarg)
	if not var.CombineCumulative then
		var.CombineCumulative = 0
	end
	
	var.CombineCumulative = var.CombineCumulative + nYuanBao
	SendCombineData(sysarg)
end

function OnDoubleEggRecharge(sysarg,nYuanBao)
	
	--local nYear,nMonth,nDate = System.getDate();
	--if (nMonth == 12 and nDate < 25) or (nMonth == 1 and nDate > 3) then
	--	return
	--end
    --
	--local var = Actor.getStaticVar(sysarg)
	--if not var.days.DoubleEggPay then
	--	var.days.DoubleEggPay = {}
	--	var.days.DoubleEggPay[1] = 0
	--	var.days.DoubleEggPay[2] = 0
	--end
	--
	--if var.days.DoubleEggPay[1] == 0 then
	--	var.days.DoubleEggPay[1] = 0
	--end
	--var.days.DoubleEggPay[2] = var.days.DoubleEggPay[2] + nYuanBao
	--
	--if not var.DoubleEggLotteryScore then
	--	var.DoubleEggLotteryScore = 0
	--end
	--var.DoubleEggLotteryScore = var.DoubleEggLotteryScore + nYuanBao
end

function OnOpenServerRecharge(sysarg,nYuanBao)
	
	local nOpenDays = System.getDaysSinceOpenServer()
	if nOpenDays > 7 then
		return
	end

	local var = Actor.getStaticVar(sysarg)
	if not var.OpenServerLotteryScore then
		var.OpenServerLotteryScore = 0
	end
	
	var.OpenServerLotteryScore = var.OpenServerLotteryScore + nYuanBao
end

function OnOneHundredActivity(sysarg,nYuanBao)
	
	-- 获得白服活动状态（0:关闭，1:开启，2:结束且显示图标）
	if System.getHundredServerStatus() ~= 1 then
		return
	end

	if not OneHundredActivityCfg then return end
	local config = OneHundredActivityCfg.MissionStepGift[1]
	
	local var = Actor.getStaticVar(sysarg)
	if not var.MissionStep then
		var.MissionStep = 0
	end
	
	if not var.oneHundredPay then
		var.oneHundredPay = 0
	end
	
	if var.MissionStep >= 1 then
		return
	end
	
	var.oneHundredPay = var.oneHundredPay + nYuanBao
	if var.oneHundredPay >= config.finishCount then
		var.MissionStep = 1
		Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf356,var.MissionStep),ttDialog)
	end
end

function OnLobarRecharge(sysarg,nYuanBao)
	
	if IsOpenActivity(LaborActivityCfg) ~= 5 then
		return
	end
	
	local var = Actor.getStaticVar(sysarg)
	if not var.LaborSinglePayValue then
		var.LaborSinglePayValue = 0
	end
	
	if var.LaborSinglePayValue == 0 then
		var.LaborSinglePayValue = nYuanBao
	else
		if not var.LobarSinglePayFlag then
			var.LobarSinglePayFlag = {}
		end
	
		local nGiveId = 0
		for i = 1,#LaborActivityCfg.SinglePay do
			if var.LobarSinglePayFlag[i] then
				nGiveId = i
				break
			end
		end
		
		if nGiveId <= 0 and var.LaborSinglePayValue < nYuanBao then
			var.LaborSinglePayValue = nYuanBao
		end
	end
	
	if not var.LaborCumulativePayValue then
		var.LaborCumulativePayValue = 0
	end
	
	var.LaborCumulativePayValue = var.LaborCumulativePayValue + nYuanBao
end



EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeWithDrawYuanBao, EventCallDispatcher.WithDrawYuanBaoHandler)
EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeYuanbaoChangedEvent, EventCallDispatcher.YuanBaoChangedEventHandler)

EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeGetRecharge, EventCallDispatcher.GetRecharge)		--充值赠送神器
