--庆典活动
--#include "data\config\activity\QingDianActivityCfg.lua" once
--#include "data\functions\modules\YbConsumeRanking.lua" once -- 月度活动 元宝消耗排行榜
--#include "data\functions\new_activity\qingdian\treasure_hunt.lua" once -- 庆典活动--寻宝


QingDianActivitys = function (sysarg, sysid, packet)
	if not Actor.IsActorInited(sysarg) then
		return
	end
	
	--是否在开关时间内
	local svar = System.getStaticVar()	
	local msgid = DataPack.readByte(packet)
	
	if msgid == 0 then	--获取数据
		GetQingDianActivityInfo(sysarg,DataPack.readByte(packet))
	elseif msgid == 1 then --登录礼包
		GetQingDianActivityLoginGift(sysarg)
	elseif msgid == 2 then --充值礼包
		GetQingDianActivityChongZhiGift(sysarg,DataPack.readByte(packet))
	elseif msgid == 3 then --限时抢购
		GetQingDianActivityXianShiQiangGou(sysarg,DataPack.readByte(packet))
	elseif msgid== 4 then --金钱富翁
		GetQingDianActivityJinQianFuWen(sysarg)
	elseif msgid== 5 then --兑换烟花
		GetQingDianActivityDuiHuanYanhua(sysarg,DataPack.readByte(packet))
	elseif msgid== 6 then --神秘商店
		local optType = DataPack.readByte(packet) --操作类型
		if optType==1 then --购买商品
			BuyInShenMiStore(sysarg,DataPack.readByte(packet))--购买第几个
		elseif optType==2 then --刷新神秘商店
			FreshenTheShenMiStore(sysarg)
		elseif optType==3 then --请求神秘商店的所有记录
			SendShenMiStoreAllR(sysarg)
		end
	elseif msgid==7 then  --购买翅膀
		BuyQingDianActivitySwing(sysarg,DataPack.readByte(packet))
	elseif msgid==8 then  --兑换集字
		GetQingDianJiZiGift(sysarg,DataPack.readByte(packet))
	elseif msgid ==9 then  --鸿运当头
		local optType = DataPack.readByte(packet) --操作类型
		if optType==1 then --购买特惠
			BuyHongYunDangTouTeHui(sysarg)
		elseif optType==2 then --请求个人数数据
			SendHongYunDangTouUserData(sysarg)
		end
	elseif msgid ==10 then --消费转盘
		--是否在开关时间内
		local svar = System.getStaticVar()
		if svar.QingDian_openDay==nil then 
			return 
		end
		if svar.isDringQingDianActivity ==nil or svar.isDringQingDianActivity<1 or svar.isDringQingDianActivity>svar.QingDian_openDay then 
			return 
		end
		
		if QingDianActivityCfg.XiaoFeiZhuanPan.isOpen==false then 
			return 
		end
	
		--暂时先屏蔽了
		return 
		
		--local optType = DataPack.readByte(packet) --操作类型
		--if optType==1 then --请求抽奖次数
		--	AskQingDianZP_canRunTime(sysarg)
		--elseif optType==2 then --请求奖品信息
		--	AskQingDianZP_awardInfo(sysarg)
		--elseif optType==3 then --抽奖全部记录
		--	AskQingDianZP_logInfo(sysarg)
		--elseif optType==4 then --请求抽奖
		--	AskQingDianZP_lotteryDraw(sysarg)
		--elseif optType==5 then --领取奖励
		--	AskQingDianZP_getAward(sysarg)
		--elseif optType==6 then --请求刷新奖品
		--	--判断钱够不够
		--	if Actor.changeMoney(sysarg, 3, -QingDianActivityCfg.XiaoFeiZhuanPan.refRandNeedYB, LogIds.QingDianActivity, "刷新奖品") == false then
		--		Actor.sendTipmsg(sysarg,"元宝不足", ttFlyTip);
		--		return -- 元宝不足
		--	end
		--	AskQingDianZP_RefawardInfo(sysarg)
		--	Actor.sendTipmsg(sysarg,"奖品刷新成功", ttFlyTip);
		--end
	elseif msgid ==11 then  --累计登录
		GetQD_totalLoginGift(sysarg,DataPack.readByte(packet))
	elseif msgid ==12 then --每天充值总数累计
		GetQD_EveryTotalPayGife(sysarg,DataPack.readByte(packet),DataPack.readByte(packet))
	elseif msgid ==13 then  --绝版珍宝
		BuyJueShiZhenBaoNew(sysarg,DataPack.readByte(packet))
	elseif msgid ==14 then  --消费转盘
		GetQD_FeiZhuanPan(sysarg)
	elseif msgid ==15 then  --灵器出世
		BuyQingDianActivityFaBao(sysarg,DataPack.readByte(packet))
	elseif msgid ==16 then  --中秋月饼兑换
		qd_moon_exchange(sysarg, packet)
	elseif msgid ==17 then  --寻宝赠送豪礼
		qd_get_hunt_times_award(sysarg, packet)
	elseif msgid ==18 then  --购买珍宝阁物品
		qd_buy_shop_item(sysarg, packet)
	end
end

GetQingDianActivityLoginGift = function (sysarg)
--
--	--是否在开关时间内
--	local svar = System.getStaticVar()
--	if svar.QingDian_openDay==nil then 
--		return 
--	end
--	if svar.isDringQingDianActivity ==nil or svar.isDringQingDianActivity<1 or svar.isDringQingDianActivity>svar.QingDian_openDay then 
--		return 
--	end
--	
--	--没有配置
--	local award = QingDianActivityCfg.LoginGift.award
--	if not award then 
--		print("The QingDianActivity Login Award Config is nil ,Read file error")
--		return  
--	end
--	
--	--判断是否领取过
--	local var = Actor.getStaticVar(sysarg)
--	if var.newdays==nil then 
--		var.newdays={}
--	end
--	if var.newdays.QingDianLoginGift ~=nil then 
--		Actor.sendTipmsg(sysarg,string.format("你已经领取过该奖励，无法再次领取"),ttFlyTip)
--		return 
--	end
--	
--	--背包不足
--	if not Awards.CheckBagGridCount(sysarg, award) then
--		return 
--	end
--	
--	--给奖励
--	local bResult = Awards.Give(sysarg, award, LogIds.QingDianActivity,"庆典活动登录礼包")
--	if bResult == false then
--		print("QingDianActivity Login Gift error, actor name = "..Actor.getName(sysarg))
--		return 
--	end
--	var.newdays.QingDianLoginGift = 1
--	
--	Actor.sendTipmsg(sysarg,"领取奖励成功",ttFlyTip)
--	
--	System.broadcastTipmsg(string.format("<(n%s)>玩家领取了庆典活动的登录礼包,<我也要领取/@@showWin,216,0>",Actor.getName(sysarg)), ttChatWindow)
--	
--	System.sendCommonLog(LogIds.QingDianActivity,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,"庆典活动登录礼包")
--
--	GetQingDianActivityInfo(sysarg,1)
--	--和前端对接
end

GetQingDianActivityChongZhiGift= function (sysarg,index)
	--是否在开关时间内
	local svar = System.getStaticVar()
	if svar.QingDian_openDay==nil then 
		return 
	end
	if svar.isDringQingDianActivity ==nil or svar.isDringQingDianActivity<1 or svar.isDringQingDianActivity>svar.QingDian_openDay then 
		return 
	end
	
	if index<1 or index>#QingDianActivityCfg.ChongZhiGift then 
		return 
	end
	
	--没有配置
	local award = QingDianActivityCfg.ChongZhiGift[index].award
	if not award then 
		print("The QingDianActivity ChongZhi Award Config is nil ,Read file error")
		return  
	end
	
	--充值不够
	local var = Actor.getStaticVar(sysarg)
	local nPeyCount = var.days.PeyNum
	if not nPeyCount then 
		Actor.sendTipmsg(sysarg,string.format("你今天充值不足%s元宝，无法领取奖励",QingDianActivityCfg.ChongZhiGift[index].needChongzhiYB),ttFlyTip)
		return
	elseif nPeyCount < QingDianActivityCfg.ChongZhiGift[index].needChongzhiYB then
		Actor.sendTipmsg(sysarg,string.format("你今天充值不足%s元宝，无法领取奖励",QingDianActivityCfg.ChongZhiGift[index].needChongzhiYB),ttFlyTip)
		return
	end
	
	
	--判断是否领取过
	if var.days.QingDianChongZhiGift2 ~=nil and var.days.QingDianChongZhiGift2[index]~=nil then 
		Actor.sendTipmsg(sysarg,string.format("你已经领取过该奖励，无法再次领取"),ttFlyTip)
		return 
	end
	
	--背包不足
	if not Awards.CheckBagGridCount(sysarg, award) then
		return 
	end
	
	--给奖励
	local bResult = Awards.Give(sysarg, award, LogIds.QingDianActivity,"庆典活动充值礼包")
	if bResult == false then
		print("QingDianActivity ChongZhi Gift error, actor name = "..Actor.getName(sysarg))
		return 
	end
	
	if var.days.QingDianChongZhiGift2==nil then var.days.QingDianChongZhiGift2={} end 
	var.days.QingDianChongZhiGift2[index] = 1
	
	Actor.sendTipmsg(sysarg,"领取奖励成功",ttFlyTip)
	
	System.broadcastTipmsg(string.format("<(n%s)>玩家领取了庆典活动的充值特惠礼包,价值%s元宝<我也要领取/@@showWin,216,1>",Actor.getName(sysarg),QingDianActivityCfg.ChongZhiGift[index].jiazhi), ttChatWindow)
	
	System.sendCommonLog(LogIds.QingDianActivity,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),index,0,0,"庆典活动充值礼包")

	GetQingDianActivityInfo(sysarg,2)
	--和前端对接
end


GetQingDianActivityXianShiQiangGou = function(sysarg,index)
	--是否在开关时间内
	local svar = System.getStaticVar()
	if svar.QingDian_openDay==nil then 
		return 
	end
	if svar.isDringQingDianActivity ==nil or svar.isDringQingDianActivity<1 or svar.isDringQingDianActivity>svar.QingDian_openDay then 
		return 
	end
	
	if QingDianActivityCfg.XianShiQiangGou[svar.isDringQingDianActivity]==nil then 
		--天数不对，太大了
		print("配置是空的")
		return 
	end
	
	local cgf = QingDianActivityCfg.XianShiQiangGou[svar.isDringQingDianActivity][index]
	if cgf ==nil then 
		print("配置是空的")
		return 
	end
	
	--判断买了多少次，是否超过次数
	local var = Actor.getStaticVar(sysarg)
	if var.days.QingDianbuys==nil then 
		var.days.QingDianbuys={}
	end
	
	if var.days.QingDianbuys[index]==nil then 
		var.days.QingDianbuys[index]=0
	end
	
	--超过可以购买的次数
	if var.days.QingDianbuys[index]>=cgf.canBuyTime then 
		Actor.sendTipmsg(sysarg,"购买失败,今天已经超过购买次数了",ttFlyTip)
		return 
	end
	
	----如果买的是第2档，要第一档买完才可以
	--if index==4 or index==5 or index==6 then
	--	for i=1,3 do 
	--		if var.days.QingDianbuys[i]<QingDianActivityCfg.XianShiQiangGou[svar.isDringQingDianActivity][i].canBuyTime then 
	--			System.trace("qingdianxianshigoumai:"..Actor.getName(sysarg))
	--			return
	--		end
	--	end
	--end
	--
	----如果买的是第3档，要第1，2档买完才可以
	--if index==7 or index==8 or index==9 then
	--	for i=1,6 do 
	--		if var.days.QingDianbuys[i]<QingDianActivityCfg.XianShiQiangGou[svar.isDringQingDianActivity][i].canBuyTime then 
	--			System.trace("qingdianxianshigoumai:"..Actor.getName(sysarg))
	--			return
	--		end
	--	end
	--end
	local function isBuys(i)
		if var.days.QingDianbuys[i]==nil then
			return false
		end
		return var.days.QingDianbuys[i]>=QingDianActivityCfg.XianShiQiangGou[svar.isDringQingDianActivity][i].canBuyTime
	end
	
	if index==4 then
		if isBuys(1)==false then 
			System.trace("qingdianxianshigoumai:"..Actor.getName(sysarg))
			return
		end
	end
	if index==5 then
		if isBuys(2)==false then 
			System.trace("qingdianxianshigoumai:"..Actor.getName(sysarg))
			return
		end
	end
	if index==6 then
		if isBuys(3)==false then 
			System.trace("qingdianxianshigoumai:"..Actor.getName(sysarg))
			return
		end
	end
	if index==7 then
		if isBuys(1)==false or isBuys(4)==false then 
			System.trace("qingdianxianshigoumai:"..Actor.getName(sysarg))
			return
		end
	end
	if index==8 then
		if isBuys(2)==false or isBuys(5)==false then 
			System.trace("qingdianxianshigoumai:"..Actor.getName(sysarg))
			return
		end
	end
	if index==9 then
		if isBuys(3)==false or isBuys(6)==false then 
			System.trace("qingdianxianshigoumai:"..Actor.getName(sysarg))
			return
		end
	end
	
	--判断格子够不够
	if not Awards.CheckBagGridCount(sysarg, cgf.award) then
		return
	end

	--判断钱够不够
	if Actor.changeMoney(sysarg, 3, -cgf.needMoney, LogIds.QingDianActivity, cgf.award[1].txt) == false then
		Actor.sendTipmsg(sysarg,"元宝不足", ttFlyTip);
		return -- 元宝不足
	end
	
	Actor.sendTipmsg(sysarg,"购买"..cgf.name.."成功",ttFlyTip)
	--给东西
	Awards.Give(sysarg,cgf.award,LogIds.QingDianActivity,"庆典限时抢购")
	--改记录买了是多少次
	var.days.QingDianbuys[index]=var.days.QingDianbuys[index]+1
	--记录下来
	System.sendCommonLog(LogIds.QingDianActivity,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,"","",cgf.award[1].txt)
	--给前端发协议
	GetQingDianActivityInfo(sysarg,3)
	
	System.broadcastTipmsg(string.format("<(n%s)>玩家通过限时抢购购买了%s,此物品只有今天特惠出售.<我也要购买/@@showWin,216,3>",Actor.getName(sysarg),Item.getItemLinkMsg(cgf.award[1].id)), ttChatWindow)
end

--金钱富翁，摇号
GetQingDianActivityJinQianFuWen = function(sysarg)
--	--是否在开关时间内
--	local svar = System.getStaticVar()
--	if svar.QingDian_openDay==nil then 
--		return 
--	end
--	if svar.isDringQingDianActivity ==nil or svar.isDringQingDianActivity<1 or svar.isDringQingDianActivity>svar.QingDian_openDay then 
--		return 
--	end
--	--判断今天充值的钱数,	--判断今天摇号的次数
--	local var = Actor.getStaticVar(sysarg)
--	local nPeyCount = var.days.PeyNum
--	local canYaoHaoTime = 0
--	if not nPeyCount then 
--		Actor.sendTipmsg(sysarg,string.format("没有摇奖次数或次数用完"),ttFlyTip)
--		return
--	else
--		for i=1,#QingDianActivityCfg.JinBiFuWeng.YaoJiang do
--			if nPeyCount >= QingDianActivityCfg.JinBiFuWeng.YaoJiang[i].chongzhiYb then
--				canYaoHaoTime = canYaoHaoTime + QingDianActivityCfg.JinBiFuWeng.YaoJiang[i].canRunTime
--			end
--		end
--	end
--	if var.days.QingDianYaoHaoTime ==nil then 
--		var.days.QingDianYaoHaoTime = 0
--	end	
--	
--	if var.days.QingDianYaoHaoTime>=canYaoHaoTime then 
--		Actor.sendTipmsg(sysarg,string.format("没有摇奖次数或次数用完"),ttFlyTip)
--		return 
--	end
--	
--	--开始摇号1~9
--	local randNumber=1
--	for i=1,#QingDianActivityCfg.JinBiFuWeng.rands do 
--		if System.getRandomNumber(QingDianActivityCfg.JinBiFuWeng.rands[i][2])==0 then  --产生0~n的随机
--			randNumber= QingDianActivityCfg.JinBiFuWeng.rands[i][1]
--		end
--	end
--	
--	if var.days.QingDianYaoHao ==nil then 
--		var.days.QingDianYaoHao = {}
--	end
--	
--	var.days.QingDianYaoHao[var.days.QingDianYaoHaoTime+1] =randNumber
--	
--	local addmoney=0
--	for i=1,var.days.QingDianYaoHaoTime+1 do 
--		addmoney = addmoney + var.days.QingDianYaoHao[i]* Ten_n(i-1)
--	end
--	
--	--给钱
--	Actor.changeMoney(sysarg,0,addmoney,LogIds.QingDianActivity,(var.days.QingDianYaoHaoTime+1).."庆典摇奖")
--	--改变摇号记录
--	var.days.QingDianYaoHaoTime = var.days.QingDianYaoHaoTime + 1
--	--记录下来
--	System.sendCommonLog(LogIds.QingDianActivity,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,var.days.QingDianYaoHaoTime.."庆典摇奖")
--	--发协议给前端
--	GetQingDianActivityInfo(sysarg,4)
--	
--	--把摇号动画停止下来
--	local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sYaoHaoBoDonghua)
--	DataPack.flush(netPack)
--	
--	if var.days.QingDianYaoHaoTime>=6 then 
--		System.broadcastTipmsg(string.format("<(n%s)>玩家通过金币富翁获得绑金*%s<我也要获取/@@showWin,216,5>",Actor.getName(sysarg),addmoney), ttChatWindow)
--	end
end

--10的n次方
function Ten_n(n)
	n = tonumber(n)
	local s=1
	if n~=0 then 
		for i=1,n do 
			s = s *10
		end
	end
	return s
end


--兑换烟花
GetQingDianActivityDuiHuanYanhua = function(sysarg,index)
--	--是否在开关时间内
--	local svar = System.getStaticVar()
--	if svar.QingDian_openDay==nil then 
--		return 
--	end
--	if svar.isDringQingDianActivity ==nil or svar.isDringQingDianActivity<1 or svar.isDringQingDianActivity>svar.QingDian_openDay then 
--		return 
--	end
--
--		
--	--判断index是否合法
--	if index<1 or index>#QingDianActivityCfg.JiYanHua then 
--		return 
--	end
--	
--	--判断是否有足够的位置容纳奖品
--	if not Awards.CheckBagGridCount(sysarg, QingDianActivityCfg.JiYanHua[index].award) then
--		return 
--	end
--	
--	
--	--判断所需的烟花是否足够
--	if Actor.getItemCount(sysarg,QingDianActivityCfg.JiYanHua[index].YanHuaId)<QingDianActivityCfg.JiYanHua[index].needItemCount then  
--		Actor.sendTipmsg(sysarg,"烟花不够",ttFlyTip)
--		return 
--	end
--	
--	--判断是否已经兑换过
--	local var = Actor.getStaticVar(sysarg)
--	if var.days.QingDianYanHua==nil then var.days.QingDianYanHua={} end
--	if var.days.QingDianYanHua[index]~=nil and var.days.QingDianYanHua[index]==1 then 
--		Actor.sendTipmsg(sysarg,"一天只能兑换一次",ttFlyTip)
--		return 
--	end
--	
--	var.days.QingDianYanHua[index]=1
--
--	--扣除烟花
--	Actor.removeItem(sysarg,QingDianActivityCfg.JiYanHua[index].YanHuaId,QingDianActivityCfg.JiYanHua[index].needItemCount)
--	
--	--给奖励
--	Awards.Give(sysarg, QingDianActivityCfg.JiYanHua[index].award, LogIds.QingDianActivity,index.."庆典勤劳致富")
--	--记录下来
--	System.sendCommonLog(LogIds.QingDianActivity,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,index.."庆典勤劳致富")
--	
--	--发协议给前端
--	GetQingDianActivityInfo(sysarg,5)
--
--	System.broadcastTipmsg(string.format("<(n%s)>玩家使用烟花*%s兑换勤劳致富礼包，10阶以上BOSS掉落烟花.<我也要兑换/@@showWin,216,6>",Actor.getName(sysarg),QingDianActivityCfg.JiYanHua[index].needItemCount), ttChatWindow)
end

function PrintQingDiaInfo(sysarg)
    local svar = System.getStaticVar()
    local str = "未开启"
    if svar.QingDian_type == nil then
            str = svar.QingDian_type
    end
    local str = "庆典类型"..svar.QingDian_type
    Actor.sendTipmsg(sysarg,str,ttFlyTip)
end
--购买庆典活动翅膀
BuyQingDianActivitySwing = function(sysarg,index)
	--是否在开关时间内
	local svar = System.getStaticVar()
	if svar.QingDian_openDay==nil then 
		return 
	end
	if svar.isDringQingDianActivity ==nil or svar.isDringQingDianActivity<1 or svar.isDringQingDianActivity>svar.QingDian_openDay then 
		return 
	end
	
	-- 不在这4种庆典时则不能购买
	if svar.QingDian_type ~= 1 and svar.QingDian_type ~= 2 and svar.QingDian_type ~= 3 and svar.QingDian_type ~= 4 then
		return
	end
	
    local cfg = QingDianActivityCfg.BuySwing

	--判断index是否合法
	if index<1 or index>#cfg then 
		return 
	end	
	
	--计算一种开启了多少次庆典活动，下一次开的时候，数据是要清空的
	if svar.StartQDHDtime ==nil or svar.StartQDHDtime==0 then 
		svar.StartQDHDtime = 1
	end	
	
	local var = Actor.getStaticVar(sysarg)	
	
	--判断是否买过
	if var.buyQDswing ~= nil and var.buyQDswing[svar.StartQDHDtime] ~= nil and var.buyQDswing[svar.StartQDHDtime][index]~=nil then 
		Actor.sendTipmsg(sysarg,"不能重复购买",ttFlyTip)
		return 
	end
	
	--判断是否够位置
	if not Awards.CheckBagGridCount(sysarg, cfg[index].award) then
		return 
	end
	
	--判断钱够不够
	if Actor.changeMoney(sysarg, 3, -cfg[index].needMoney, LogIds.QingDianActivity, cfg[index].award[1].txt) == false then
		Actor.sendTipmsg(sysarg,"元宝不足", ttFlyTip);
		return -- 元宝不足
	end			
	
	if var.buyQDswing==nil then 
		var.buyQDswing={}
		var.buyQDswing[svar.StartQDHDtime]={}
	else
		if var.buyQDswing[svar.StartQDHDtime]==nil then -- 新活动开始
			var.buyQDswing={} -- 清空上次活动的数据
			var.buyQDswing[svar.StartQDHDtime]={}
		end
	end
	
	--给东西
	Awards.Give(sysarg,cfg[index].award,LogIds.QingDianActivity,"购买庆典翅膀"..index)
	
	--设置已经购买了
	var.buyQDswing[svar.StartQDHDtime][index]=1	
	
	Actor.sendTipmsg(sysarg,"购买成功",ttFlyTip)	
	
	--记录下来
	System.sendCommonLog(LogIds.QingDianActivity,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,"购买庆典翅膀"..index)
	--给前端发协议
	GetQingDianActivityInfo(sysarg,7)
	
	System.broadcastTipmsg(string.format("<(n%s)>玩家财大气粗购买%s.<我也要购买/@@showWin,216,8>",Actor.getName(sysarg),Item.getItemLinkMsg(cfg[index].award[1].id)), ttChatWindow)
end

--购买庆典活动 灵器出世
BuyQingDianActivityFaBao = function(sysarg,index)
	--是否在开关时间内
	local svar = System.getStaticVar()
	if svar.QingDian_openDay==nil then 
		return 
	end
	if svar.isDringQingDianActivity ==nil or svar.isDringQingDianActivity<1 or svar.isDringQingDianActivity>svar.QingDian_openDay then 
		return 
	end
	
	-- 不在这4种庆典时则不能购买
	if svar.QingDian_type ~= 1 and svar.QingDian_type ~= 2 and svar.QingDian_type ~= 3 and svar.QingDian_type ~= 4 then
		return
	end
	
    local cfg = QingDianActivityCfg.BuyFaBao

	--判断index是否合法
	if index<1 or index>#cfg then 
		return 
	end	
	
	--计算一种开启了多少次庆典活动，下一次开的时候，数据是要清空的
	if svar.StartQDHDtime ==nil or svar.StartQDHDtime==0 then 
		svar.StartQDHDtime = 1
	end	
	
	local var = Actor.getStaticVar(sysarg)	
	
	--判断是否买过
	if var.buyQDFaBao ~= nil and var.buyQDFaBao[svar.StartQDHDtime] ~= nil and var.buyQDFaBao[svar.StartQDHDtime][index]~=nil then 
		Actor.sendTipmsg(sysarg,"不能重复购买",ttFlyTip)
		return 
	end
	
	--判断是否够位置
	if not Awards.CheckBagGridCount(sysarg, cfg[index].award) then
		return 
	end
	
	--判断钱够不够
	if Actor.changeMoney(sysarg, 3, -cfg[index].needMoney, LogIds.QingDianActivity, cfg[index].award[1].txt) == false then
		Actor.sendTipmsg(sysarg,"元宝不足", ttFlyTip);
		return -- 元宝不足
	end			
	
	if var.buyQDFaBao==nil then 
		var.buyQDFaBao={}
		var.buyQDFaBao[svar.StartQDHDtime]={}
	else
		if var.buyQDFaBao[svar.StartQDHDtime]==nil then -- 新活动开始
			var.buyQDFaBao={} -- 清空上次活动的数据
			var.buyQDFaBao[svar.StartQDHDtime]={}
		end
	end
	
	--给东西
	Awards.Give(sysarg,cfg[index].award,LogIds.QingDianActivity,"购买庆典灵器"..index)
	
	--设置已经购买了
	var.buyQDFaBao[svar.StartQDHDtime][index]=1	
	
	Actor.sendTipmsg(sysarg,"购买成功",ttFlyTip)	
	
	--记录下来
	System.sendCommonLog(LogIds.QingDianActivity,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,"购买庆典灵器"..index)
	--给前端发协议
	GetQingDianActivityInfo(sysarg,15)
	
	System.broadcastTipmsg(string.format("<(n%s)>玩家财大气粗购买%s.<我也要购买/@@showWin,216,8>",Actor.getName(sysarg),Item.getItemLinkMsg(cfg[index].award[1].id)), ttChatWindow)
end




--领取集字活动奖励
GetQingDianJiZiGift= function(sysarg,index)
	--是否在开关时间内
	local svar = System.getStaticVar()
	if svar.QingDian_openDay==nil then 
		return 
	end
	if svar.isDringQingDianActivity ==nil or svar.isDringQingDianActivity<1 or svar.isDringQingDianActivity>svar.QingDian_openDay then 
		return 
	end

		
	--判断index是否合法
	if index<1 or index>#QingDianActivityCfg.QingDianJiZi.needCollect then 
		return 
	end
	
	--判断今天是否兑换过
	local var = Actor.getStaticVar(sysarg)
	--if var.days.qingdianjizhi==nil then 
	--	var.days.qingdianjizhi={}
	--end
	--if var.days.qingdianjizhi[index]~=nil then 
	--	Actor.sendTipmsg(sysarg,"一天只能兑换一次",ttFlyTip)
	--	return 
	--end
	
	--判断背包里面的所需物品是否足够
	for i=1,#QingDianActivityCfg.QingDianJiZi.needCollect[index] do 
		local idindex = QingDianActivityCfg.QingDianJiZi.needCollect[index][i].id-5648
		if Actor.getItemCount(sysarg,QingDianActivityCfg.QingDianJiZi.JiZiId[idindex])<=0 then  
			Actor.sendTipmsg(sysarg,"道具不足，无法兑换",ttFlyTip)
			return 
		end
	end
	--背包不足
	if not Awards.CheckBagGridCount(sysarg, QingDianActivityCfg.QingDianJiZi.award[index]) then
		return 
	end
    
	--扣除物品
	for i=1,#QingDianActivityCfg.QingDianJiZi.needCollect[index] do 
		local idindex = QingDianActivityCfg.QingDianJiZi.needCollect[index][i].id -5648
		Actor.removeItem(sysarg,QingDianActivityCfg.QingDianJiZi.JiZiId[idindex],1)
	end
		
	local bResult = Awards.Give(sysarg, QingDianActivityCfg.QingDianJiZi.award[index], LogIds.QingDianActivity,"庆典集字")
	if bResult == false then
		print("qingdian Collect Zi Gift error, actor name = "..Actor.getName(sysarg))
		return 
	end
	Actor.sendTipmsg(sysarg,"领取奖励成功",ttFlyTip)
	
	--var.days.qingdianjizhi[index]=1
	
	
	GetQingDianActivityInfo(sysarg,8)
	
	System.broadcastTipmsg(string.format("玩家<(n%s)>玩家集齐了[%s] ,兑换了%s大奖<我也要领取/@@showWin,216,6>",Actor.getName(sysarg),QingDianActivityCfg.QingDianJiZi.award[index][1].txt,QingDianActivityCfg.QingDianJiZi.award[index][1].name),ttChatWindow)
	System.sendCommonLog(LogIds.QingDianActivity,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,index.."庆典集字")
end

--购买鸿运当头特惠
BuyHongYunDangTouTeHui= function(sysarg)
	--是否在开关时间内
	local svar = System.getStaticVar()
	if svar.QingDian_openDay==nil then 
		return 
	end
	if svar.isDringQingDianActivity ==nil or svar.isDringQingDianActivity<1 or svar.isDringQingDianActivity>svar.QingDian_openDay then 
		return 
	end
	
	--只个配置只有3天
	if svar.isDringQingDianActivity>7 then 
		return 
	end
	
	--如果数据还没有初始化，那就初始化数据
	if svar.HYDT_data.days==nil then 
		ClearHongYunDangTouSystemData()
	end
	
	
	local cfg  = QingDianActivityCfg.HongYunDangTou[svar.isDringQingDianActivity]
	
	
	--检查总数量是否已经卖完了
	if svar.HYDT_data.TeHuiTotal[svar.isDringQingDianActivity] ==nil then 
		svar.HYDT_data.TeHuiTotal[svar.isDringQingDianActivity] =0
	end
	if svar.HYDT_data.TeHuiTotal[svar.isDringQingDianActivity]>=100 then 
		Actor.sendTipmsg(sysarg,"今日特惠的剩余数量为0",ttFlyTip)
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
	Actor.changeMoney( sysarg, 3, -cfg.TeHui.needMoney, LogIds.QingDianActivity, cfg.TeHui.award[1].txt)
	--给奖励
	Awards.Give(sysarg,cfg.TeHui.award,LogIds.QingDianActivity,cfg.TeHui.award[1].txt)
	--扣除特惠的总次数
	svar.HYDT_data.TeHuiTotal[svar.isDringQingDianActivity] = svar.HYDT_data.TeHuiTotal[svar.isDringQingDianActivity]+1 
	
	
	------------------------------------虚线以内，是要在21点前才会有用21点后点击就没有用了-----------------------------------------------------
	local hour,mins,secs = System.getTime()
	
	---改了时间，几点开奖，必须改这里
	if hour<21 then 
		--随机数字
		local s=0
		local leftTable = svar.HYDT_data.leftTable[svar.isDringQingDianActivity]		
		if leftTable ~= nil then
			s=#leftTable
		end
		
		if s==0 then 
			Actor.sendTipmsg(sysarg,"参数错误",ttFlyTip)
			System.trace("hongyundangtou,has error")
			return 
		end
		local randNumber = System.getRandomNumber(s)+1 --产生1~s的 在未抽中的表中随机抽中一个
		local thisNumber = svar.HYDT_data.leftTable[svar.isDringQingDianActivity][randNumber] --拿出这个号码
		
		--把这个幸运数字抽出来
		--不能直接remove svar.HYDT_data.leftTable,所以找个中间表
		local tempTable ={}
		for i=1,s do 
			tempTable[i] = svar.HYDT_data.leftTable[svar.isDringQingDianActivity][i]
		end
		
		table.remove(tempTable,randNumber) --在未抽的表中删除这个号码
		
		svar.HYDT_data.leftTable[svar.isDringQingDianActivity] ={}
		for i=1,s-1 do 
			svar.HYDT_data.leftTable[svar.isDringQingDianActivity][i] = tempTable[i]
		end
		
		--记录自己得到的数字
		local var = Actor.getStaticVar(sysarg)
		if var.newdays==nil then 
			var.newdays={}
		end
	
		if var.newdays.HYDT_LuckNumber ==nil then var.newdays.HYDT_LuckNumber = {} end
		var.newdays.HYDT_LuckNumber[#var.newdays.HYDT_LuckNumber+1] = thisNumber
		
		--系统要记录这个数字的主人的姓名和id
		svar.HYDT_data.NumberData[thisNumber] ={}
		svar.HYDT_data.NumberData[thisNumber].name = Actor.getName(sysarg)
		svar.HYDT_data.NumberData[thisNumber].userID = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
		svar.HYDT_data.NumberData[thisNumber].sex = Actor.getIntProperty(sysarg,PROP_ACTOR_SEX)
		
		System.broadcastTipmsg(string.format("<(n%s)>玩家购买了鸿运当头今日特惠,获得一个幸运数字,祝福他拿大奖吧,<我也要购买/@@showWin,216,9>",Actor.getName(sysarg)),ttChatWindow)
	end
	----------------------------------------------------------------------------------------------
	--给前端发协议
	SendHongYunDangTouUserData(sysarg)
end

--发送鸿运当头的常变的个人数据
SendHongYunDangTouUserData=function(sysarg)
	--是否在开关时间内
	local svar = System.getStaticVar()
	if svar.QingDian_openDay==nil then 
		return 
	end
	if svar.isDringQingDianActivity ==nil or svar.isDringQingDianActivity<1 or svar.isDringQingDianActivity>svar.QingDian_openDay then 
		return 
	end
	--只个配置只有3天
	if svar.isDringQingDianActivity>7 then 
		return 
	end
	
	--如果数据还没有初始化，那就初始化数据
	if svar.HYDT_data.days==nil then 
		ClearHongYunDangTouSystemData()
	end
	
	
	local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sQingDianActivity)
	DataPack.writeByte(netPack,9)
	DataPack.writeByte(netPack,1)
	
	--发送剩余的特惠数量
	local totalNumber = svar.HYDT_data.TeHuiTotal[svar.isDringQingDianActivity]
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
	if var.newdays.HYDT_LuckNumber ==nil then var.newdays.HYDT_LuckNumber = {} end
	local myTable = var.newdays.HYDT_LuckNumber
	DataPack.writeByte(netPack,#myTable)
	if #myTable~=0 then
		for i=1,#myTable do 
			DataPack.writeByte(netPack,myTable[i])
		end
	end
	DataPack.flush(netPack)
end

--鸿运当头开奖
HongYunDangTou_Run =function()
	--是否在开关时间内
	local svar = System.getStaticVar()
	if svar.QingDian_openDay==nil then 
		return 
	end
	if svar.isDringQingDianActivity ==nil or svar.isDringQingDianActivity<1 or svar.isDringQingDianActivity>svar.QingDian_openDay then 
		return 
	end
	
	--只个配置只有3天
	if svar.isDringQingDianActivity>7 then 
		return 
	end
	
	--如果数据还没有初始化，那就初始化数据
	if svar.HYDT_data.days==nil then 
		ClearHongYunDangTouSystemData()
	end
	
	local randNumber = System.getRandomNumber(100)+1 --产生1~s的
	local svar = System.getStaticVar()
	
	
	local cfg  = QingDianActivityCfg.HongYunDangTou[svar.isDringQingDianActivity]
	
	--保存幸运号码
	if svar.HYDT_data.days[svar.isDringQingDianActivity] == nil then
		svar.HYDT_data.days[svar.isDringQingDianActivity] = {}
	end
	svar.HYDT_data.days[svar.isDringQingDianActivity].luckNumber = randNumber
	
	local  luckUser= svar.HYDT_data.NumberData[randNumber]
	if luckUser ~=nil then 
		svar.HYDT_data.days[svar.isDringQingDianActivity].luckUser = luckUser.name 
		--广播，发邮件
		--luckUser.userID 
		local nSex = luckUser.sex
		local strAward  =""
		local needdouhao = "/"
		for i=1,#cfg.HongYun_Award do
			--如果是用-1就都给，否则分性别改
			if cfg.HongYun_Award[i].sex == nSex or cfg.HongYun_Award[i].sex==-1 then 
				strAward = strAward ..cfg.HongYun_Award[i].id..","..cfg.HongYun_Award[i].count..","..cfg.HongYun_Award[i].bind..needdouhao
			end 
		end
		--print("strAward="..strAward)
		System.AddMail(luckUser.userID,6,0,"鸿运当头大奖","尊敬的玩家您好,\\\\恭喜您在今日的鸿运当头中荣获大奖,现奖励在邮件附件中,请及时领取!\\\\祝您游戏愉快!",0,0,strAward)
		System.broadcastTipmsg("鸿运当头今日幸运数字为：<(c0xFF00FF00)"..randNumber..string.format(">,恭喜<(n%s)>",luckUser.name).."获得今天的鸿运大奖",ttChatWindow)
				
		System.trace("hongyundangtou,randNumber="..randNumber..",userID="..luckUser.userID)
	else 
		--广播
		 System.broadcastTipmsg("鸿运当头今日幸运数字为：<(c0xFF00FF00)"..randNumber..">,很遗憾,鸿运大奖将无人获得",ttChatWindow)
		 System.trace("hongyundangtou,randNumber="..randNumber..",userID=wu")
	end
	
	--要把今天的什么人拿了什么数据清空
	svar.HYDT_data.NumberData={}
	
	--给前端发消息
	GetQingDianActivityInfo(sysarg,9)
end

--把鸿运当头的系统数据给清除了
ClearHongYunDangTouSystemData =function()
	local svar = System.getStaticVar()
	svar.HYDT_data = {}
	
	--清空全部的幸运号码和幸运儿
	svar.HYDT_data.days = {}
	svar.HYDT_data.days[1] = {}
	svar.HYDT_data.days[2] = {}
	svar.HYDT_data.days[3] = {}
	svar.HYDT_data.days[4] = {}
	svar.HYDT_data.days[5] = {}
	svar.HYDT_data.days[6] = {}
	svar.HYDT_data.days[7] = {}
	
	for i=1,7 do
		svar.HYDT_data.days[i].luckNumber = 0
		svar.HYDT_data.days[i].luckUser = "无"
	end
	
	--初始化一下剩余未抽中的号码
	svar.HYDT_data.leftTable ={}
	svar.HYDT_data.leftTable[1]={}
	svar.HYDT_data.leftTable[2]={}
	svar.HYDT_data.leftTable[3]={}
	svar.HYDT_data.leftTable[4]={}
	svar.HYDT_data.leftTable[5]={}
	svar.HYDT_data.leftTable[6]={}
	svar.HYDT_data.leftTable[7]={}
	
	for j=1,7 do
		for i=1,100 do 
			svar.HYDT_data.leftTable[j][i]=i
		end
	end
	

	--清空特惠总数控制表
	svar.HYDT_data.TeHuiTotal ={}
	
	--把什么人拿了什么数字给清空的了
	svar.HYDT_data.NumberData={}
end


------------------------------------------------------------消费转盘系统---------------------------------------
--获得可以抽奖的次数
function AskQingDianZP_canRunTime(sysarg)
	
	local var = Actor.getStaticVar(sysarg)
	
	local svar = System.getStaticVar()
	if svar.StartQDHDtime ==nil or svar.StartQDHDtime==0 then 
		svar.StartQDHDtime = 1
	end
	local StartQDHDtime = svar.StartQDHDtime
	
	if var.QD_ZPcount==nil then var.QD_ZPcount ={} end 
	
	if var.QD_ZPcount[StartQDHDtime]==nil then 
		var.QD_ZPcount={} --把之前活动的数据清了
		var.QD_ZPcount[StartQDHDtime] =0
	end
	
	local dayConsumeYB = var.dayConsumeYB
	if dayConsumeYB == nil then
		dayConsumeYB = 0
	end
	
	
	local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sQingDianActivity)
	DataPack.writeByte(netPack,10)
	DataPack.writeByte(netPack,1)
	DataPack.writeInt(netPack,var.QD_ZPcount[StartQDHDtime])
	DataPack.writeUInt(netPack,dayConsumeYB)
	DataPack.flush(netPack)
	
end

--请求奖品信息
function AskQingDianZP_awardInfo(sysarg)
	local var = Actor.getStaticVar(sysarg)
	if var.days.QD_ZPawardInfo==nil then 
		AskQingDianZP_RefawardInfo(sysarg)
		return 
	end
	
	local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sQingDianActivity)
	DataPack.writeByte(netPack,10)
	DataPack.writeByte(netPack,2)
	for i=1,#var.days.QD_ZPawardInfo do 
		DataPack.writeByte(netPack,var.days.QD_ZPawardInfo[i])
		--print("var.days.QD_ZPawardInfo[i]="..var.days.QD_ZPawardInfo[i])
	end
	DataPack.flush(netPack)
end

--获得记录信息
function AskQingDianZP_logInfo(sysarg)
	
	local var = Actor.getStaticVar(sysarg)
	local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sQingDianActivity)
	DataPack.writeByte(netPack,10)
	DataPack.writeByte(netPack,3)
	
	local svar = System.getStaticVar()
	if svar.StartQDHDtime ==nil or svar.StartQDHDtime==0 then 
		svar.StartQDHDtime = 1
	end
	local StartQDHDtime = svar.StartQDHDtime
	
	if svar.QD_ZPLog ==nil then 
		svar.QD_ZPLog={}
	end
	
	if svar.QD_ZPLog[StartQDHDtime] ==nil then 	
		DataPack.writeByte(netPack,0)
	else 
		
		local logs = lua_string_split(svar.QD_ZPLog[StartQDHDtime],"|")
		--print(0)
		if #logs>0 then 
			if #logs>=50 then 
				DataPack.writeByte(netPack,50)
				local count = #logs-49
				for i=count,#logs do 
					local nameAnditem = lua_string_split(logs[i],",")
					DataPack.writeByte(netPack,tonumber(nameAnditem[2]))
					DataPack.writeString(netPack,nameAnditem[1])
					--print(tonumber(logs[i]))
				end
			else 
				DataPack.writeByte(netPack,#logs)
				for i=1,#logs do 
					local nameAnditem = lua_string_split(logs[i],",")
					DataPack.writeByte(netPack,tonumber(nameAnditem[2]))
					DataPack.writeString(netPack,nameAnditem[1])
					--print(tonumber(logs[i]))
				end
			end
			
		else 
			DataPack.writeByte(netPack,0)
		end
	end
	
	DataPack.flush(netPack)
end

--抽奖
function AskQingDianZP_lotteryDraw(sysarg)

	--是否有抽奖次数
	local svar = System.getStaticVar()
	if svar.StartQDHDtime ==nil or svar.StartQDHDtime==0 then 
		svar.StartQDHDtime = 1
	end
	local StartQDHDtime = svar.StartQDHDtime
	
	local var = Actor.getStaticVar(sysarg)
	if var.QD_ZPcount==nil then var.QD_ZPcount ={} end 
	if var.QD_ZPcount[StartQDHDtime]==nil then 
		var.QD_ZPcount[StartQDHDtime] =0
	end
	
	local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sQingDianActivity)
	DataPack.writeByte(netPack,10)
	DataPack.writeByte(netPack,4)
	
	if var.QD_ZPcount[StartQDHDtime]<1 then 
		DataPack.writeByte(netPack,0)
		DataPack.flush(netPack)
		Actor.sendTipmsg(sysarg,"没有抽奖次数",ttFlyTip)
		return 
	end
			
		
	--如果没有空位，就不让他抽奖(让前端这样做一下)
	local bagIdxs = Item.getBagEmptyGridCount( sysarg )
	if	bagIdxs<1 then 
		DataPack.writeByte(netPack,0)
		DataPack.flush(netPack)
		Actor.sendTipmsg(sysarg,"背包不足",ttFlyTip)
		return
	end
		
	if var.days.QD_ZPawardInfo==nil then 
		AskQingDianZP_RefawardInfo(sysarg) 
	end
		
	--开始抽奖
	local cgf= QingDianActivityCfg.XiaoFeiZhuanPan.award
	local hasAward = 0
	for i=1,#var.days.QD_ZPawardInfo do 
		if System.getRandomNumber(cgf[var.days.QD_ZPawardInfo[i]].rate) + 1 ==1 then 
			hasAward = var.days.QD_ZPawardInfo[i]
		end
	end
	
	--如果是0，那就取最低概率的那一个
	if hasAward==0 then 
		local minRate =100000
		local minIndex = 100000
		for i=1,#var.days.QD_ZPawardInfo do 
			if cgf[var.days.QD_ZPawardInfo[i]].rate <minRate then 
				minRate =cgf[var.days.QD_ZPawardInfo[i]].rate
				minIndex = var.days.QD_ZPawardInfo[i]
			end
		end
		hasAward = minIndex
	end
	
	--告诉前端抽中哪个
	

	DataPack.writeByte(netPack,hasAward)
	DataPack.flush(netPack)
	
	--先扣次数，不然可以无限抽奖了
	var.QD_ZPcount[StartQDHDtime] = var.QD_ZPcount[StartQDHDtime] -1
	
	var.QD_ZPgetAwardIndex = hasAward
	
end

--请求得到抽奖奖励
function AskQingDianZP_getAward(sysarg)
	local var = Actor.getStaticVar(sysarg)
	
	local cgf= QingDianActivityCfg.XiaoFeiZhuanPan.award
		
	local svar = System.getStaticVar()
	if svar.StartQDHDtime ==nil or svar.StartQDHDtime==0 then 
		svar.StartQDHDtime = 1
	end
	local StartQDHDtime = svar.StartQDHDtime
	
	if svar.QD_ZPLog ==nil then 
		svar.QD_ZPLog={}
	end
	

	
	--有奖励没领取（这个防止断线重连）
	if var.QD_ZPgetAwardIndex ~=nil and var.QD_ZPgetAwardIndex~=0 then 
		--给奖励
		--local bagIdxs = Item.getBagEmptyGridCount( sysarg )
		--if	bagIdxs<1 then 
		if not Awards.CheckBagGridCount(sysarg, {cgf[var.QD_ZPgetAwardIndex]}) then
			--return
			Actor.sendTipmsg(sysarg,"奖品已经发到邮件",ttFlyTip)
			local nActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
			System.AddMail(nActorId,6,0,"消费转盘奖品","这是消费转盘奖品",0,0,cgf[var.QD_ZPgetAwardIndex].id..","..cgf[var.QD_ZPgetAwardIndex].count..","..cgf[var.QD_ZPgetAwardIndex].bind)
		else
			Awards.Give(sysarg, {cgf[var.QD_ZPgetAwardIndex]}, LogIds.QingDianActivity, "消费转盘")
		end

		--写log
		if svar.QD_ZPLog[StartQDHDtime] ==nil then 	
			svar.QD_ZPLog ={} --把之前的记录都清了
			svar.QD_ZPLog[StartQDHDtime] =""..Actor.getName(sysarg)..","..var.QD_ZPgetAwardIndex
		else 
			svar.QD_ZPLog[StartQDHDtime] = svar.QD_ZPLog[StartQDHDtime] .."|"..Actor.getName(sysarg)..","..var.QD_ZPgetAwardIndex
		end
		
		--print("svar.QD_ZPLog[StartQDHDtime]="..svar.QD_ZPLog[StartQDHDtime])
	
		--优化代码，把多于50条的截掉
		local logs = lua_string_split(svar.QD_ZPLog[StartQDHDtime],"|")
		--print("#logs="..#logs)
			
		if #logs>50 then 
			local pos = string.find(svar.QD_ZPLog[StartQDHDtime], "|")
			if (not pos) then
			else 
				svar.QD_ZPLog[StartQDHDtime] = string.sub(svar.QD_ZPLog[StartQDHDtime], pos + 1, #svar.QD_ZPLog[StartQDHDtime]);
			end
		end
		
		
		System.broadcastTipmsg(string.format("恭喜<(n%s)>玩家通过消费转盘获得%s,拿到就是赚到!<我也要去/@@showWin,216,11>",Actor.getName(sysarg),cgf[var.QD_ZPgetAwardIndex].name),ttChatWindow)
		
		
		local playerList = LuaHelp.getAllActorList()  --获取在线玩家对象列表
		for k, plyPtr in ipairs(playerList or {}) do
			local netPack = DataPack.allocPacket(plyPtr,151,LogicCmd.miscSysEx.sub.sQingDianActivity)
			DataPack.writeByte(netPack,10)
			DataPack.writeByte(netPack,5)
			DataPack.writeByte(netPack,var.QD_ZPgetAwardIndex)
			DataPack.writeString(netPack,Actor.getName(sysarg))
			DataPack.flush(netPack)
		end	
		
		var.QD_ZPgetAwardIndex =nil
	end
	
end

--是否在奖励tables里面
function IsInQD_ZPawardTable(tables,index)
	for i=1,#tables do 
		if tables[i] == index then 
			return true
		end
	end
	
	return false
end

--请求刷新奖品
function AskQingDianZP_RefawardInfo(sysarg)
	local var = Actor.getStaticVar(sysarg)
	--if var.days.QD_ZPawardInfo==nil then 
	var.days.QD_ZPawardInfo ={}
	--end
	
	local i=1
	local cgf= QingDianActivityCfg.XiaoFeiZhuanPan.award
	--轮一遍概率
	while i<=#cgf and  #var.days.QD_ZPawardInfo<8 do 
		if System.getRandomNumber(cgf[i].rate) + 1 ==1 then --被选中了
			var.days.QD_ZPawardInfo[#var.days.QD_ZPawardInfo+1]=i
		end
		i = i + 1
	end
	
	--如果不够8个，那就把概率高的塞进去
	for i=1,#cgf do 
		if  #var.days.QD_ZPawardInfo<8 and  IsInQD_ZPawardTable(var.days.QD_ZPawardInfo,i)==false then 
			var.days.QD_ZPawardInfo[#var.days.QD_ZPawardInfo+1]=i
		end
	end
	--for i=1,#var.days.QD_ZPawardInfo do 
	--	print(""..var.days.QD_ZPawardInfo[i])
	--end 
	--把奖品信息发给前端
	AskQingDianZP_awardInfo(sysarg)
end


------------------------------------------------------------消费转盘系统-----------------------------------------------------	



--得到累计登录奖励
function GetQD_totalLoginGift(sysarg,index)
	
	local svar = System.getStaticVar()
	if svar.isDringQingDianActivity ==nil or svar.isDringQingDianActivity<index then 
		return 
	end
	
	
	local level= Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	if level<80 then 
		Actor.sendTipmsg(sysarg,"不够80级",ttFlyTip)
		return 
	end
	
	ClearQingDian_Data(sysarg)
	
	local var = Actor.getStaticVar(sysarg)
	if var.QDHD_Data.login ==nil then 
		var.QDHD_Data.login = 1
	end
	
	if var.QDHD_Data.loginflag ==nil then
		var.QDHD_Data.loginflag={}
	end
	
	
	--没有配置
	local cfg = QingDianActivityCfg.TotalLoginAward[index]
	if not cfg then 
		print("The qingdian Login Award Config is nil ,Read file error")
		return  
	end
	
	if var.QDHD_Data.login<index then 
		Actor.sendTipmsg(sysarg,"还没达到领取条件",ttFlyTip)
		return 
	end
	
	if var.QDHD_Data.loginflag[index]~=nil and var.QDHD_Data.loginflag[index]==1 then 
		Actor.sendTipmsg(sysarg,"不能重复领取",ttFlyTip)
		return 
	end
	
	
	local award = cfg.award
	
	--背包不足
	if not Awards.CheckBagGridCount(sysarg, award) then
		return 
	end
	
	var.QDHD_Data.loginflag[index] = 1
	
	--给奖励
	local bResult = Awards.Give(sysarg, award, LogIds.QingDianActivity,cfg.name)
	if bResult == false then
		print("qingdian Login Gift error, actor name = "..Actor.getName(sysarg))
		return 
	end
	
	GetQingDianActivityInfo(sysarg,11)
		
	Actor.sendTipmsg(sysarg,"领取奖励成功",ttFlyTip)
	
	System.sendCommonLog(LogIds.QingDianActivity,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,cfg.name)

	System.broadcastTipmsg(string.format("<(n%s)>玩家领取了庆典活动登录奖励,超级丰盛<我也要领取/@@showWin,216,0>",Actor.getName(sysarg)), ttChatWindow)
end

--得到庆典每天充值礼物
function GetQD_EveryTotalPayGife(sysarg,x,y)

	local cfg = QingDianActivityCfg.EveryTotalPay
	if x<1 or x>#cfg then 
		return 
	end
	
	if y<1 or y>#cfg[x].days then 
		return 
	end
	local var = Actor.getStaticVar(sysarg)
	
	ClearQingDian_Data(sysarg)
	
	if var.QDHD_Data.payTotal  == nil then 
		var.QDHD_Data.payTotal = {}
	end
	
	if var.QDHD_Data.payTotalFalg  == nil then 
		var.QDHD_Data.payTotalFalg = {}
	end
	
	if var.QDHD_Data.payTotalFalg[x]==nil then 
		var.QDHD_Data.payTotalFalg[x] ={}
	end
		
	if var.QDHD_Data.payTotalFalg[x][y] ~=nil and var.QDHD_Data.payTotalFalg[x][y]==1 then	
		Actor.sendTipmsg(sysarg,"不能重复领取",ttFlyTip)
		return 
	end
	
	if var.QDHD_Data.payTotal[x]==nil or var.QDHD_Data.payTotal[x]<y then 
		Actor.sendTipmsg(sysarg,"累计达到充值金额的天数不足",ttFlyTip)
		return 
	end
	
	
	
	local award = cfg[x].days[y].award
	
	--背包不足
	if not Awards.CheckBagGridCount(sysarg, award) then
		return 
	end
	
	var.QDHD_Data.payTotalFalg[x][y] = 1
	
	--给奖励
	local bResult = Awards.Give(sysarg, award, LogIds.qingdianleijichongzhi,"连续累计充值")
	if bResult == false then
		print("qingdian leijipay Gift error, actor name = "..Actor.getName(sysarg))
		return 
	end
	
	GetQingDianActivityInfo(sysarg,12)
		
	Actor.sendTipmsg(sysarg,"领取奖励成功",ttFlyTip)
	
	System.sendCommonLog(LogIds.qingdianleijichongzhi,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,x.."档"..y.."天")

	System.broadcastTipmsg(string.format("<(n%s)>玩家领取了庆典活动连续累计充值礼包,超级丰盛<我也要领取/@@showWin,216,2>",Actor.getName(sysarg)), ttChatWindow)
	
end




function BuyJueShiZhenBaoNew(sysarg,index)
	--是否在开关时间内
	local svar = System.getStaticVar()
	if svar.QingDian_openDay==nil then 
		return 
	end
	if svar.isDringQingDianActivity ==nil or svar.isDringQingDianActivity<1 or svar.isDringQingDianActivity>svar.QingDian_openDay then 
		return 
	end
	
    local cfg = QingDianActivityCfg.BuyJueShiZhenBao

	--判断index是否合法
	if index<1 or index>#cfg then 
		return 
	end
	
	--ClearQingDian_Data(sysarg)
	local var = Actor.getStaticVar(sysarg)
	
	--if var.JueShiZhenBao5 ==nil then 
	--	var.JueShiZhenBao5 ={}
	--end
	--var.JueShiZhenBao5 是卖大鲨鱼
	--var.JueShiZhenBao5 是卖网球达人
	
	if var.JueShiZhenBao5~=nil and var.JueShiZhenBao5==1 then 
		Actor.sendTipmsg(sysarg,"不能重复购买",ttFlyTip)
		return 
	end
	
	
	--判断是否够位置
	if not Awards.CheckBagGridCount(sysarg, cfg[index].award) then
		return 
	end
	
	--判断钱够不够
	if Actor.changeMoney(sysarg, 3, -cfg[index].needMoney, LogIds.qingdianbuyjueban, cfg[index].award[1].txt) == false then
		Actor.sendTipmsg(sysarg,"元宝不足", ttFlyTip);
		return -- 元宝不足
	end
	
	Actor.sendTipmsg(sysarg,"购买成功",ttFlyTip)
	--给东西
	Awards.Give(sysarg,cfg[index].award,LogIds.qingdianbuyjueban,"购买庆典绝版"..index)
	--改记录买了是多少次
	var.JueShiZhenBao5=1
	
	--记录下来
	System.sendCommonLog(LogIds.qingdianbuyjueban,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,"购买庆典绝版"..index)
	--给前端发协议
	GetQingDianActivityInfo(sysarg,13)
	
	local nSex = Actor.getIntProperty(sysarg, PROP_ACTOR_SEX)
	if nSex==0 then 
		System.broadcastTipmsg(string.format("<(n%s)>玩家财大气粗购买%s.<我也要购买/@@showWin,216,7>",Actor.getName(sysarg),Item.getItemLinkMsg(cfg[index].award[1].id)), ttChatWindow)
	else
		System.broadcastTipmsg(string.format("<(n%s)>玩家财大气粗购买%s.<我也要购买/@@showWin,216,7>",Actor.getName(sysarg),Item.getItemLinkMsg(cfg[index].award[2].id)), ttChatWindow)
	end
end

--消费转盘
function GetQD_FeiZhuanPan(sysarg)
	local var = Actor.getStaticVar(sysarg)
	local svar = System.getStaticVar()
	if QingDianActivityCfg.XiaoFeiZhuanPanNew[1]==nil then 
		Actor.sendTipmsg(sysarg,"配置错误",ttFlyTip)
		return
	end
	
	--初始化
	ClearQingDian_Data(sysarg)
	if var.QDHD_Data.XFZP ==nil then
		var.QDHD_Data.XFZP=1
	end
	
	
	local cfg = QingDianActivityCfg.XiaoFeiZhuanPanNew[1]
	
	if var.QDHD_Data.XFZP>#cfg then
		Actor.sendTipmsg(sysarg,"配置错误",ttFlyTip)
		return
	end
	
	cfg = cfg[var.QDHD_Data.XFZP]
	
	-- 门槛按本轮活动总天数缩放，向上取整，末档恰为天数×300万元宝。
	local needSpend = math.ceil(cfg.needPay * (svar.QingDian_openDay or 3) / 3)
	
	if var.QDHD_Data.XFZPCosume==nil or needSpend>var.QDHD_Data.XFZPCosume then 
		Actor.sendTipmsg(sysarg,"消费不足",ttFlyTip)
		return 
	end
	
	
	
	if not Awards.CheckBagGridCount(sysarg, cfg.award) then
		--return
		Actor.sendTipmsg(sysarg,"奖品已经发到邮件",ttFlyTip)
		local nActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
		System.AddMail(nActorId,6,0,"庆典活动消费转盘奖品","庆典活动消费转盘奖励",0,0,cfg.award[1].id..","..cfg.award[1].count..","..cfg.award[1].bind)
	else
		Awards.Give(sysarg,cfg.award,LogIds.qingdianzhuanpan,"庆典活动消费转盘")
	end
		
	
	--改记录买了是多少次
	var.QDHD_Data.XFZP = var.QDHD_Data.XFZP +1
	--记录下来
	System.sendCommonLog(LogIds.qingdianzhuanpan,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,var.QDHD_Data.XFZP-1,"","",cfg.award[1].txt)
	--给前端发协议
	GetQingDianActivityInfo(sysarg,14)
	
	System.broadcastTipmsg(string.format("<(n%s)>玩家通过消费转盘领取了%s,<我也要领取/@@showWin,216,7>",Actor.getName(sysarg),Item.getItemLinkMsg(cfg.award[1].id)), ttChatWindow)
end

	

--返回信息
GetQingDianActivityInfo = function(sysarg,index)
	
	if not Actor.IsActorInited(sysarg) then
		return
	end
	
	--是否在开关时间内
	local svar = System.getStaticVar()
	if index~=6 then 
		if svar.QingDian_openDay==nil then 
		
			return 
		end
		if svar.isDringQingDianActivity ==nil or svar.isDringQingDianActivity<1 or svar.isDringQingDianActivity>svar.QingDian_openDay then 

			return 
		end
	end
	
	if index==6 then 
		if svar.SHENMISTORE_openDay ==nil then 
			return 
		end
		if svar.isDringShenMiSD ==nil or svar.isDringShenMiSD<1 or svar.isDringShenMiSD>svar.SHENMISTORE_openDay then 
			return 
		end
	end

	local var = Actor.getStaticVar(sysarg)
	if index== 1 then
		local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sQingDianActivity)
        DataPack.writeByte(netPack,1)
		if var.newdays==nil then 
			var.newdays={}
		end
		if (var.newdays.QingDianLoginGift ==nil) then 
			DataPack.writeByte(netPack,1)
		else 
			DataPack.writeByte(netPack,0)
		end
        DataPack.flush(netPack)
	elseif index== 2 then
		local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sQingDianActivity)
        DataPack.writeByte(netPack,2)
		for i=1,#QingDianActivityCfg.ChongZhiGift do 
			if (var.days.QingDianChongZhiGift2 ==nil or var.days.QingDianChongZhiGift2[i]==nil ) then 
				DataPack.writeByte(netPack,1)
			else 
				DataPack.writeByte(netPack,0)
			end
		end
        DataPack.flush(netPack)
	elseif index== 3 then
	
		--超出了天数，没有配置就不做处理
		if QingDianActivityCfg.XianShiQiangGou[svar.isDringQingDianActivity]==nil then 
			return 
		end
		
		local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sQingDianActivity)
		DataPack.writeByte(netPack,3)
		if var.days.QingDianbuys==nil then 
			var.days.QingDianbuys={}
		end
				
		for i=1,#QingDianActivityCfg.XianShiQiangGou[svar.isDringQingDianActivity] do 
			if var.days.QingDianbuys[i]==nil then 
				DataPack.writeByte(netPack,0)	
			else 
				DataPack.writeByte(netPack,var.days.QingDianbuys[i])	--把代码今天买了多少次发下去。。。
			end
		end
		DataPack.flush(netPack)
	elseif index== 4 then
		local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sQingDianActivity)
		DataPack.writeByte(netPack,4)
		if var.days.QingDianYaoHaoTime ==nil then 
			var.days.QingDianYaoHaoTime = 0
		end	
		--print("var.days.QingDianYaoHaoTime="..var.days.QingDianYaoHaoTime)
		DataPack.writeByte(netPack,var.days.QingDianYaoHaoTime) --一共摇号多少次
		if var.days.QingDianYaoHaoTime~=0 then 
			for i=1,var.days.QingDianYaoHaoTime do 
				--print("var.days.QingDianYaoHao[var.days.QingDianYaoHaoTime]="..var.days.QingDianYaoHao[i])
				DataPack.writeByte(netPack,var.days.QingDianYaoHao[i])--摇号的数据全部发下去
			end
		end
		DataPack.flush(netPack)
	elseif index== 5 then
		local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sQingDianActivity)
		DataPack.writeByte(netPack,5)
		
		local var = Actor.getStaticVar(sysarg)
		if var.days.QingDianYanHua==nil then var.days.QingDianYanHua={} end
		for i=1,#QingDianActivityCfg.JiYanHua do 
			if var.days.QingDianYanHua[i]~=nil and var.days.QingDianYanHua[i]==1 then 
				DataPack.writeByte(netPack,1)
			else 
				DataPack.writeByte(netPack,0)
			end
		end
		DataPack.flush(netPack)
		
	elseif index== 6 then
		if var.days.firstFreInToday ==nil then 
			RandTheShenMiStore(sysarg) --今天第一次上线刷一次
			var.days.firstFreInToday=1
			return 
		end
		
		if var.randTable==nil then 
			RandTheShenMiStore(sysarg) --重刷的时候就已经下发了数据了，不用再下发
			return 
		end
		
		--购买标记
		if var.ShenMiStorebuyFlag==nil then 
			var.ShenMiStorebuyFlag ={}
		end
		for i=1,4 do
			if var.ShenMiStorebuyFlag[i]==nil then 
				var.ShenMiStorebuyFlag[i]=0
			end
		end
		
		local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sQingDianActivity)
		DataPack.writeByte(netPack,6)
		--4个物品都是什么
		DataPack.writeInt(netPack,var.randTable[1])
		DataPack.writeInt(netPack,var.randTable[2])
		DataPack.writeInt(netPack,var.randTable[3])
		DataPack.writeInt(netPack,var.randTable[4])
		
		--是否已经该买过这4个物品
		DataPack.writeByte(netPack,var.ShenMiStorebuyFlag[1])
		DataPack.writeByte(netPack,var.ShenMiStorebuyFlag[2])
		DataPack.writeByte(netPack,var.ShenMiStorebuyFlag[3])
		DataPack.writeByte(netPack,var.ShenMiStorebuyFlag[4])
		DataPack.flush(netPack)
		
		--print(var.randTable[1])
		--print(var.randTable[2])
		--print(var.randTable[3])
		--print(var.randTable[4])
		----
		--print(var.ShenMiStorebuyFlag[1])
		--print(var.ShenMiStorebuyFlag[2])
		--print(var.ShenMiStorebuyFlag[3])
		--print(var.ShenMiStorebuyFlag[4])
	elseif index ==7 then 
		--计算一种开启了多少次庆典活动，下一次开的时候，数据是要清空的
		if svar.StartQDHDtime ==nil or svar.StartQDHDtime==0 then 
			svar.StartQDHDtime = 1
		end
		
		local var = Actor.getStaticVar(sysarg)
		
		local buyFlags = nil		
		if var.buyQDswing ~= nil then
			buyFlags = var.buyQDswing[svar.StartQDHDtime]
		end
		
		local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sQingDianActivity)
		DataPack.writeByte(netPack,7)
		
		for i=1,#QingDianActivityCfg.BuySwing do 
			if buyFlags == nil or buyFlags[i] == nil then
				DataPack.writeByte(netPack,0)
			else
				DataPack.writeByte(netPack,1)
			end			
		end
		DataPack.flush(netPack)			
	elseif index==8 then 
		--初始化
		--local var = Actor.getStaticVar(sysarg)
		--if var.days.qingdianjizhi==nil then 
		--	var.days.qingdianjizhi={}
		--end
		
		local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sQingDianActivity)
		DataPack.writeByte(netPack,8)
		--for i=1,#QingDianActivityCfg.QingDianJiZi.needCollect do
		--	if var.days.qingdianjizhi[i]==nil or var.days.qingdianjizhi[i]==0 then 
		--		DataPack.writeByte(netPack,0)
		--	else 
		--		DataPack.writeByte(netPack,1)
		--	end
		--end
		DataPack.flush(netPack)
	elseif index==9 then 
		--只个配置只有3天
		if svar.isDringQingDianActivity>7 then 
			return 
		end
		--如果数据还没有初始化，那就初始化数据
		if svar.HYDT_data==nil or svar.HYDT_data.days==nil then 
			ClearHongYunDangTouSystemData()
		end
		
		local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sQingDianActivity)
		DataPack.writeByte(netPack,9)
		DataPack.writeByte(netPack,0)
		--把三期的信息全都发出来
		for i=1,7 do 
			--避免报错
			if svar.HYDT_data.days[i]==nil then 
				svar.HYDT_data.days[i]={}
				svar.HYDT_data.days[i].luckNumber = 0
				svar.HYDT_data.days[i].luckUser = "无"
			end
		
			DataPack.writeByte(netPack,svar.HYDT_data.days[i].luckNumber)
			DataPack.writeString(netPack,svar.HYDT_data.days[i].luckUser)
		end
		DataPack.flush(netPack)
	elseif index ==11 then 
		ClearQingDian_Data(sysarg)
		local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sQingDianActivity)
		DataPack.writeByte(netPack,11)
		if var.QDHD_Data.login ==nil then 
			var.QDHD_Data.login = 1
		end
		DataPack.writeByte(netPack,var.QDHD_Data.login)
		local cfg =QingDianActivityCfg.TotalLoginAward
		for i=1,#cfg do 
			if var.QDHD_Data.loginflag==nil then 
				DataPack.writeByte(netPack,0)
			else 
				if var.QDHD_Data.loginflag[i]==nil then 
					DataPack.writeByte(netPack,0)
				else 
					DataPack.writeByte(netPack,1)
				end
			end
		end
		DataPack.flush(netPack)
	elseif index==12 then 
		ClearQingDian_Data(sysarg)
		
		local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sQingDianActivity)
		DataPack.writeByte(netPack,12)
		
		local cfg =QingDianActivityCfg.EveryTotalPay
		
		if var.QDHD_Data.payTotal  == nil then 
			var.QDHD_Data.payTotal = {}
		end
		
		if var.QDHD_Data.payTotalFalg  == nil then 
			var.QDHD_Data.payTotalFalg = {}
		end
		
		for i=1,#cfg do 
			if var.QDHD_Data.payTotal[i]~=nil then 
				DataPack.writeByte(netPack,var.QDHD_Data.payTotal[i])
				--print("var.QDHD_Data.payTotal[i]="..var.QDHD_Data.payTotal[i])
			else 
				DataPack.writeByte(netPack,0)
				--print("var.QDHD_Data.payTotal[i]=0")
			end
		end
		
		--是否领取了
		for i=1,#cfg do 
			for j=1,#cfg[i].days do 
				if var.QDHD_Data.payTotalFalg[i]==nil then 
					DataPack.writeByte(netPack,0)
				else 
					if var.QDHD_Data.payTotalFalg[i][j]==nil then 
						DataPack.writeByte(netPack,0)
					else
						DataPack.writeByte(netPack,1)
					end
				end
			end
		end
        DataPack.flush(netPack)
		
		
	elseif index ==13 then 
		--ClearQingDian_Data(sysarg)
		--if var.JueShiZhenBao5 ==nil then 
		--	var.JueShiZhenBao5 ={}
		--end
		
		local cfg = QingDianActivityCfg.BuyJueShiZhenBao
		local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sQingDianActivity)
		DataPack.writeByte(netPack,13)
		for i=1,#cfg do 
			if var.JueShiZhenBao5~=nil and var.JueShiZhenBao5==1 then 
				DataPack.writeByte(netPack,1)
			else 
				DataPack.writeByte(netPack,0)
			end
		end
		DataPack.flush(netPack)
	elseif index==14 then 
		ClearQingDian_Data(sysarg)
		
		local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sQingDianActivity)
		DataPack.writeByte(netPack,14)
		if var.QDHD_Data.XFZPCosume ==nil then
			DataPack.writeUInt(netPack,0)
		else	
			DataPack.writeUInt(netPack,var.QDHD_Data.XFZPCosume) --消费额度
		end
		
		if var.QDHD_Data.XFZP ==nil then
			DataPack.writeByte(netPack,0)
		else
			DataPack.writeByte(netPack,var.QDHD_Data.XFZP-1) --已经转到第几个
		end
		DataPack.flush(netPack)
	elseif index ==15 then 
		--计算一种开启了多少次庆典活动，下一次开的时候，数据是要清空的
		if svar.StartQDHDtime ==nil or svar.StartQDHDtime==0 then 
			svar.StartQDHDtime = 1
		end
		
		local var = Actor.getStaticVar(sysarg)
		
		local buyFlags = nil		
		if var.buyQDFaBao ~= nil then
			buyFlags = var.buyQDFaBao[svar.StartQDHDtime]
		end
		
		local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sQingDianActivity)
		DataPack.writeByte(netPack,15)
		
		for i=1,#QingDianActivityCfg.BuyFaBao do 
			if buyFlags == nil or buyFlags[i] == nil then
				DataPack.writeByte(netPack,0)
			else
				DataPack.writeByte(netPack,1)
			end			
		end
		DataPack.flush(netPack)	
	elseif index == 16 then -- 中秋月饼收集活动
		qd_send_moon_activity_data(sysarg)
	elseif index == 17 then -- 寻宝赠送豪礼活动
		qd_send_hunt_times_activity_data(sysarg)
	elseif index == 18 then -- 珍宝阁活动
		qd_send_shop_activity_data(sysarg)
	end	
end

--[[
0 幻羽庆典
1 时装庆典
2 龙装庆典
3 法宝庆典
4 传世庆典
0 到 3 活动开启时，庆典活动-消费排名 也要开启，如果以后有 4 5 活动也要开启

]]
--开始庆典活动
StartQingDianActivity = function(openday , nowOpenday,nType) --开几天，当前是第几天,庆典类型

	local svar = System.getStaticVar()
	if (svar.QingDian_openDay==nil or svar.isDringQingDianActivity ==nil or svar.isDringQingDianActivity<1 or svar.isDringQingDianActivity>svar.QingDian_openDay)==false then 
		System.trace("please end the qingdian activity first")
		return 
	end
	
	if nType == nil then nType = 0 end
    nType = tonumber(nType)
	--以免活动期间挂机了，这个挺麻烦的。。

	if nowOpenday==nil or nowOpenday==0 then --默认当天是第1天
		svar.isDringQingDianActivity = 1
	else 
		nowOpenday = tonumber(nowOpenday)
		svar.isDringQingDianActivity = nowOpenday
	end
	svar.QingDian_type = nType
		
	if openday~=nil then 
		openday =tonumber(openday)
		svar.QingDian_openDay = openday
	end
	if svar.QingDian_openDay==nil then --默认开启为3天
		svar.QingDian_openDay=3
	end
	
	--计算一种开启了多少次庆典活动，下一次开的时候，数据是要清空的
	if svar.StartQDHDtime ==nil or svar.StartQDHDtime==0 then 
		svar.StartQDHDtime = 1
	else
		svar.StartQDHDtime = 1 + svar.StartQDHDtime
	end
	
	local startQDHDtime = svar.StartQDHDtime
	
	svar.StartQDHD_MiNitime = System.getCurrMiniTime()
	
	System.saveStaticVar()
	System.trace("qingdian startQDHDtime = "..startQDHDtime)
	
	ClearHongYunDangTouSystemData()
	OnYbConsumeRanking_ActivityStart(1, svar.isDringQingDianActivity, svar.QingDian_openDay)
	
	local playerList = LuaHelp.getAllActorList()
	if not playerList then return end
	if svar.QingDian_type == nil then 
        svar.QingDian_type = 0
    end
    
    local _isDringQingDianActivity = svar.isDringQingDianActivity
    local _QingDian_openDay = svar.QingDian_openDay
    local _QingDian_type = svar.QingDian_type
    
	for i, player in ipairs(playerList) do
		--是否开启庆典活动
		local netPack = DataPack.allocPacket(player,151,LogicCmd.miscSysEx.sub.sQingDianActivityIsOpen)
		DataPack.writeByte(netPack,_isDringQingDianActivity)	--开启第几天
		DataPack.writeByte(netPack,_QingDian_openDay)	--一共开启几天

	    DataPack.writeByte(netPack,_QingDian_type)
		DataPack.flush(netPack)
	end
end

--结束庆典活动
EndQingDianActivity = function()
	local svar = System.getStaticVar()
	svar.isDringQingDianActivity = nil
	System.saveStaticVar()
	
	OnYbConsumeRanking_ActivityEnd(1)
	
	local playerList = LuaHelp.getAllActorList()
	if not playerList then return end
	
	for i, player in ipairs(playerList) do
		--是否开启庆典活动
		local netPack = DataPack.allocPacket(player,151,LogicCmd.miscSysEx.sub.sQingDianActivityIsOpen)
		DataPack.writeByte(netPack,0)
		DataPack.writeByte(netPack,0)
        DataPack.writeByte(netPack,0)
		DataPack.flush(netPack)
	end
end
	

QingDianActivityIsOpen = function (sysarg, sysid, packet)
	local svar = System.getStaticVar()
	if svar.isDringQingDianActivity==nil then 
		svar.isDringQingDianActivity = 0
	end
	local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sQingDianActivityIsOpen)
    DataPack.writeByte(netPack,svar.isDringQingDianActivity)
	if svar.QingDian_openDay==nil then 
		DataPack.writeByte(netPack,0)
	else 
		DataPack.writeByte(netPack,svar.QingDian_openDay)
	end
    if svar.QingDian_type == nil then 
        svar.QingDian_type = 0
    end
	DataPack.writeByte(netPack,svar.QingDian_type)
	DataPack.flush(netPack)
end
































----------------------------------------------------------------------------------------------------------
--------------------------------------------------神秘商店-------------------------------------------------
--------------------------神秘商店，改成开启关闭时间不和庆典活动搞在一次，但是接口还是一样的，判断开启和接受协议要注意----------------------------------------
function Fre_ShenMiInitServer()
	System.addTimer("Fre_ShenMiStoreTime",1000,-1)
end

Fre_ShenMiStoreTime =function()
	
	local svar = System.getStaticVar()
	if svar.SHENMISTORE_openDay ==nil then 
		return 
	end
	if svar.isDringShenMiSD ==nil or svar.isDringShenMiSD<1 or svar.isDringShenMiSD>svar.SHENMISTORE_openDay then 
		return 
	end
	
	local dvar =System.getDyanmicVar()
    
	if dvar.Fre_ShenMiStore~=nil then --不允许刷新
		dvar.Fre_ShenMiStore = dvar.Fre_ShenMiStore + 1
		if dvar.Fre_ShenMiStore>500 then 
			dvar.Fre_ShenMiStore=nil   --重置允许刷新(达到了时间就刷新)
		end
	end
	
	local nHour,nMin,nSec = System.getTime(0,0,0)
	if nHour % 2 == 0 and nMin == 0 then
		if dvar.Fre_ShenMiStore ==nil then --允许刷新
			dvar.Fre_ShenMiStore =1		--刷新一次后重置不允许刷新
			--做事
			local playerList = LuaHelp.getAllActorList()  --获取在线玩家对象列表
			for k, v in ipairs(playerList or {}) do
				RandTheShenMiStore(v)
				
				if Actor.getIntProperty(v,PROP_CREATURE_LEVEL)>=80 then 
					local actorID = Actor.getIntProperty(v, PROP_ENTITY_ID);
					System.AddMail(actorID,0,0,"神秘商店已刷新","亲爱的玩家，\\\\神秘商店已刷新,超级特价商品不容错过.机不可失失不再来啊!")
				end
			end		
			--广播给在线的所有人 神秘商店已刷新，超级特价商品不容错过。我也要买
			--System.broadcastTipmsg("神秘商店刷新",ttChatWindow)
			--print("刷新！！！")

		end
	end
end

--发送全部的记录信息
SendShenMiStoreAllR = function(sysarg)
	
	local svar = System.getStaticVar()
	if svar.SHENMISTORE_openDay ==nil then 
		return 
	end
	if svar.isDringShenMiSD ==nil or svar.isDringShenMiSD<1 or svar.isDringShenMiSD>svar.SHENMISTORE_openDay then 
		return 
	end
	
	local dvar =System.getDyanmicVar()
	if dvar.QingDianStoreLog==nil then 
		dvar.QingDianStoreLog={}
	end
	local Tiaoshu = #dvar.QingDianStoreLog
	if Tiaoshu>50 then 
		Tiaoshu=50
	end
	if Tiaoshu==0 then 
		--就是没有记录啊
		local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sQingDianActivitySendAllLog)
		DataPack.writeByte(netPack,0)
		DataPack.flush(netPack)
		return 
	end
	if dvar.QingDianStoreLogPoint == nil then dvar.QingDianStoreLogPoint=0 end	
	
	local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sQingDianActivitySendAllLog)
	DataPack.writeByte(netPack,Tiaoshu)
	
	--从尾指针后一位开始读，到总条数
	for i=dvar.QingDianStoreLogPoint+1,Tiaoshu do
		DataPack.writeString( netPack, dvar.QingDianStoreLog[i])
	end
	
	--从第一位开始读，到尾指针
	for i=1,dvar.QingDianStoreLogPoint do
		DataPack.writeString( netPack, dvar.QingDianStoreLog[i])
	end
	DataPack.flush(netPack)
	
end

--在神秘商店里面买东西
BuyInShenMiStore = function(sysarg,index)
	--是否在开关时间内
	local svar = System.getStaticVar()
	if svar.SHENMISTORE_openDay ==nil then 
		return 
	end
	if svar.isDringShenMiSD ==nil or svar.isDringShenMiSD<1 or svar.isDringShenMiSD>svar.SHENMISTORE_openDay then 
		return 
	end
	
	--越界
	if index<1 or index>4 then 
		return 
	end
	
	local var = Actor.getStaticVar(sysarg)
	if var.randTable==nil then  --当这个表什么都没有的时候
		RandTheShenMiStore(sysarg)
	end
	
	if var.ShenMiStorebuyFlag==nil then --第几个索引是否购买过
		var.ShenMiStorebuyFlag={}
	end
	
	--判断是否已经购买过
	if var.ShenMiStorebuyFlag[index]~=nil and var.ShenMiStorebuyFlag[index]==1 then 
		Actor.sendTipmsg(sysarg,"只能购买一次",ttFlyTip)
		return 
	end
	--判断是否有足够的位置容纳奖品
	if not Awards.CheckBagGridCount(sysarg, QingDianActivityCfg.ShenMiShangDian.ShangPing[var.randTable[index]].award) then
		return 
	end
	
	local moneyTypeNow = QingDianActivityCfg.ShenMiShangDian.ShangPing[var.randTable[index]].moneyType
	local moneyTip = "绑定金币"
	if moneyTypeNow==0 then 
		moneyTip = "绑定金币"
	elseif moneyTypeNow==1 then 
		moneyTip = "金币"
	elseif moneyTypeNow==3 then 
		moneyTip = "元宝"
	end
	--判断金钱够不够
	if Actor.changeMoney(sysarg, QingDianActivityCfg.ShenMiShangDian.ShangPing[var.randTable[index]].moneyType, -QingDianActivityCfg.ShenMiShangDian.ShangPing[var.randTable[index]].needYb, LogIds.ShenMiShangDian, var.randTable[index].."神秘商店购买") == false then
		Actor.sendTipmsg(sysarg,moneyTip.."不足", ttFlyTip);
		return -- 元宝不足
	end
	--给奖励
	Awards.Give(sysarg, QingDianActivityCfg.ShenMiShangDian.ShangPing[var.randTable[index]].award, LogIds.ShenMiShangDian, var.randTable[index].."神秘商店购买")
	
	--初始化购买标记
	if var.ShenMiStorebuyFlag==nil then 
		var.ShenMiStorebuyFlag ={}
	end
	--购买了要标记好。。。
	var.ShenMiStorebuyFlag[index]=1
	
	--将log写入
	local awardNow = QingDianActivityCfg.ShenMiShangDian.ShangPing[var.randTable[index]].award[1]
	local logs = string.format("<(n%s)>以%s%s购买了%s个%s",Actor.getName(sysarg),QingDianActivityCfg.ShenMiShangDian.ShangPing[var.randTable[index]].needYb,moneyTip,awardNow.count,Item.getItemLinkMsg(awardNow.id))
	local dvar =System.getDyanmicVar()
	if dvar.QingDianStoreLog==nil then 
		dvar.QingDianStoreLog={}    --这是一个数组，最大是50条记录， 变成一个循环队列，
	end
	
	if dvar.QingDianStoreLogPoint == nil then --这个是循环队列的尾指针，  尾指针是最新一个，尾指针前一个是倒数第2新，尾指针后一个有可能是最旧的，有可能不存在（50个没排满）
		dvar.QingDianStoreLogPoint=1
	elseif  dvar.QingDianStoreLogPoint~=50 then 
		dvar.QingDianStoreLogPoint= 1 + dvar.QingDianStoreLogPoint
	elseif  dvar.QingDianStoreLogPoint==50 then --覆盖第一次
		dvar.QingDianStoreLogPoint=1
	end	
	
	dvar.QingDianStoreLog[dvar.QingDianStoreLogPoint] = logs
	
	--广播给在线的所有人
	local playerList = LuaHelp.getAllActorList()  --获取在线玩家对象列表
	for k, v in ipairs(playerList or {}) do
		local netPack = DataPack.allocPacket(v,151,LogicCmd.miscSysEx.sub.sQingDianActivitySendOneLog)
		DataPack.writeString(netPack,logs)
		DataPack.flush(netPack)
	end		
	
	System.broadcastTipmsg(string.format("<(n%s)>在神秘商店购买了折扣商品%s个%s,赚翻了!<我也要购买/@@showWin,217>",Actor.getName(sysarg),awardNow.count,Item.getItemLinkMsg(awardNow.id)),ttChatWindow)

	--记录下来
	System.sendCommonLog(LogIds.ShenMiShangDian,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0, var.randTable[index].."神秘商店购买")
	
	--发协议给前端
	if var.ShenMiStorebuyFlag[1]~=nil and var.ShenMiStorebuyFlag[1]==1 
	and var.ShenMiStorebuyFlag[2]~=nil and var.ShenMiStorebuyFlag[2]==1 
	and var.ShenMiStorebuyFlag[3]~=nil and var.ShenMiStorebuyFlag[3]==1 
	and var.ShenMiStorebuyFlag[4]~=nil and var.ShenMiStorebuyFlag[4]==1 then --要是都买完了，就马上刷新
		RandTheShenMiStore(sysarg)
		return 
	end
	
	GetQingDianActivityInfo(sysarg,6)
end


--主动刷新神秘商店
FreshenTheShenMiStore = function(sysarg)
	--是否在开关时间内
	local svar = System.getStaticVar()
	if svar.SHENMISTORE_openDay ==nil then 
		return 
	end
	if svar.isDringShenMiSD ==nil or svar.isDringShenMiSD<1 or svar.isDringShenMiSD>svar.SHENMISTORE_openDay then 
		return 
	end
	
	local var = Actor.getStaticVar(sysarg)
	if var.randTable==nil then  --当这个表什么都没有的时候
		RandTheShenMiStore(sysarg)
		return 
	end
	
	--购买标记
	if var.ShenMiStorebuyFlag==nil then 
		var.ShenMiStorebuyFlag ={}
	end
	for i=1,4 do
		if var.ShenMiStorebuyFlag[i]==nil then 
			var.ShenMiStorebuyFlag[i]=0
		end
	end
		
	--4个都购买了，可以免费刷新
	if var.ShenMiStorebuyFlag[1]==1 and var.ShenMiStorebuyFlag[2]==1 and var.ShenMiStorebuyFlag[3]==1 and var.ShenMiStorebuyFlag[4]==1 then 
		RandTheShenMiStore(sysarg)
		return 
	end
	
	--判断钱够不够
	if Actor.changeMoney(sysarg, 3, -QingDianActivityCfg.ShenMiShangDian.Fre_Money, LogIds.ShenMiShangDian, "刷新神秘商店") == false then
		Actor.sendTipmsg(sysarg,"元宝不足", ttFlyTip);
		return -- 元宝不足
	end
	
	Actor.sendTipmsg(sysarg,"刷新成功",ttFlyTip)
	RandTheShenMiStore(sysarg)
end

--神秘商店的随机
RandTheShenMiStore = function(sysarg)
	--是否在开关时间内
	local svar = System.getStaticVar()
	if svar.SHENMISTORE_openDay ==nil then 
		return 
	end
	if svar.isDringShenMiSD ==nil or svar.isDringShenMiSD<1 or svar.isDringShenMiSD>svar.SHENMISTORE_openDay then 
		return 
	end
	
	local var = Actor.getStaticVar(sysarg)
	local randTable = {} --用来装随机到的物品序列
	
	--是否已经存在在randTable中
	local function Evenhas(n)
		if #randTable~=0 then
			for i=1,#randTable do 
				if randTable[i]==n then 
					return true
				end
			end
		end
		return false
	end
	
	--计算总权重
	--local s=0
	--local  TableWeightForRand = {}--用来存着权重点
	--for i=1,#QingDianActivityCfg.ShenMiShangDian.ShangPing do 
	--	s = s + QingDianActivityCfg.ShenMiShangDian.ShangPing[i].weight
	--	TableWeightForRand[i] = s
	--end
	
	--随出商品
	local j=1
	while #randTable<4 do
		j=j+1
		if j==10000 then 
			print("可能死循环了，没有4个以上概率很高的物品导致的,可以产生相同的物品，破解死循环")
		end
		--local randNumber = System.getRandomNumber(s)+1 --产生1~s的
		--for i=1,#QingDianActivityCfg.ShenMiShangDian.ShangPing do 
		--	if randNumber<=TableWeightForRand[i] then --在这个范围之内的数
		--		if Evenhas(i)==false or j>=10000 then --没有加入表的
		--			local tablecount = #randTable
		--			randTable[tablecount+1] = i
		--			break
		--		end
		--	end
		--end
		
		for i=1,#QingDianActivityCfg.ShenMiShangDian.ShangPing do 
			local randNumber = System.getRandomNumber(QingDianActivityCfg.ShenMiShangDian.ShangPing[i].weight)
			if randNumber==0 then 
				if Evenhas(i)==false or j>=10000 then --没有加入表的
					local tablecount = #randTable
					randTable[tablecount+1] = i
					break
				end
			end
		end
	end
	
	--表的复制
	var.randTable ={}
	var.randTable[1] = randTable[1]
	var.randTable[2] = randTable[2]
	var.randTable[3] = randTable[3]
	var.randTable[4] = randTable[4]
	
	--初始化购买标记
	if var.ShenMiStorebuyFlag==nil then 
		var.ShenMiStorebuyFlag ={}
	end
	for i=1,4 do
		var.ShenMiStorebuyFlag[i]=0
	end
	
	--告诉前端物品刷新
	local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sQingDianActivity)
	DataPack.writeByte(netPack,6) --发送物品信息
	DataPack.writeInt(netPack,var.randTable[1])
	DataPack.writeInt(netPack,var.randTable[2])
	DataPack.writeInt(netPack,var.randTable[3])
	DataPack.writeInt(netPack,var.randTable[4])
	
	DataPack.writeByte(netPack,0)--是否买过
	DataPack.writeByte(netPack,0)
	DataPack.writeByte(netPack,0)
	DataPack.writeByte(netPack,0)
	
	--调试，看看随机到什么商品
	--print(var.randTable[1])
	--print(var.randTable[2])
	--print(var.randTable[3])
	--print(var.randTable[4])
	DataPack.flush(netPack)
	
end
--------------------------------------------------------------------------------------------------------------

--开始神秘商店
StartShenMiActivity = function( openday , nowOpenday)
	--以免活动期间挂机了，这个挺麻烦的。。
	local svar = System.getStaticVar()
	if nowOpenday==nil or nowOpenday==0 then 
		svar.isDringShenMiSD = 1
	else 
		nowOpenday = tonumber(nowOpenday)
		svar.isDringShenMiSD = nowOpenday
	end

	
	if openday~=nil then 
		openday =tonumber(openday)
		svar.SHENMISTORE_openDay = openday
	end
	if svar.SHENMISTORE_openDay==nil then --默认开启为3天
		svar.SHENMISTORE_openDay=3
	end
	svar.StartShenMi_MiNitime = System.getCurrMiniTime()
	System.saveStaticVar()
	
	--print("svar.SHENMISTORE_openDay="..svar.SHENMISTORE_openDay)
	
	local playerList = LuaHelp.getAllActorList()
	if not playerList then return end
	
	for i, player in ipairs(playerList) do
		--是否开启庆典活动
		local netPack = DataPack.allocPacket(player,151,LogicCmd.miscSysEx.sub.sShenMiShangDianIsOpen)
		DataPack.writeByte(netPack,svar.isDringShenMiSD)	--开启第几天
		DataPack.writeByte(netPack,svar.SHENMISTORE_openDay)	--一共开启几天
		DataPack.flush(netPack)
	end
	
	--把记录清空，把指针归0
	local dvar =System.getDyanmicVar()
	dvar.QingDianStoreLog={}
	dvar.QingDianStoreLogPoint=0
	
	
end

--关闭神秘商店
EndShenMiActivity = function()
	local svar = System.getStaticVar()
	svar.isDringShenMiSD = nil
	System.saveStaticVar()
	
	local playerList = LuaHelp.getAllActorList()
	if not playerList then return end
	
	for i, player in ipairs(playerList) do
		--是否开启庆典活动
		local netPack = DataPack.allocPacket(player,151,LogicCmd.miscSysEx.sub.sShenMiShangDianIsOpen)
		DataPack.writeByte(netPack,0)
		DataPack.writeByte(netPack,0)
		DataPack.flush(netPack)
	end
end
	
--神秘商店是否开启
ShenMiShangDianIsOpen = function (sysarg, sysid, packet)
	local svar = System.getStaticVar()
	
	--如果没有开启状态下
	if svar.isDringShenMiSD==nil or svar.isDringShenMiSD==0 then 
		local dvar = System.getDyanmicVar()
		--因为是合服第一天，所以把神秘商店开起来。。
		if dvar.isCombineStartShenMi ~=nil and dvar.isCombineStartShenMi==1 then 
			dvar.isCombineStartShenMi=nil 
			StartShenMiActivity(3,1)
		end
	end
	
	
	if svar.isDringShenMiSD==nil then 
		svar.isDringShenMiSD = 0
	end
	local netPack = DataPack.allocPacket(sysarg,151,LogicCmd.miscSysEx.sub.sShenMiShangDianIsOpen)
    DataPack.writeByte(netPack,svar.isDringShenMiSD)
	if svar.SHENMISTORE_openDay==nil then 
		DataPack.writeByte(netPack,0)
	else 
		DataPack.writeByte(netPack,svar.SHENMISTORE_openDay)
	end
	DataPack.flush(netPack)
end



MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cQingDianActivity, QingDianActivitys)
MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cQingDianActivityIsOpen, QingDianActivityIsOpen)
MiscsImplementEx.registerMsgHandler(LogicCmd.miscSysEx.sub.cShenMiShangDianIsOpen, ShenMiShangDianIsOpen)

function checkQingDian(sysarg)
	local svar = System.getStaticVar()
	print("svar.isDringQingDianActivity="..svar.isDringQingDianActivity)
	System.broadcastTipmsg(string.format("<(n%s)>玩家购买了鸿运当头今日特惠,获得一个幸运数字,祝福他拿大奖吧,<我也要购买/@@showWin,216,9>",Actor.getName(sysarg)),ttChatWindow)
end


--8700要补上的消费元宝数量
--@func changeQingDianConsume "君不色" 8700
function cQDC(sysarg,name,addnumber)
	local name =tostring(name)
	local addnumber = tonumber(addnumber)
	
	
	local pActor = Actor.getActorByName(name)
	if pActor then
		local var = Actor.getStaticVar(pActor)
		ClearQingDian_Data(pActor)
		if var.QDHD_Data.XFZPCosume==nil then 
			var.QDHD_Data.XFZPCosume = addnumber
		else 
			var.QDHD_Data.XFZPCosume = var.QDHD_Data.XFZPCosume + addnumber
		end
		Actor.sendTipmsg(sysarg,"修复成功",ttFlyTip)
	else 
		Actor.sendTipmsg(sysarg,"没有这人",ttFlyTip)
	end
end