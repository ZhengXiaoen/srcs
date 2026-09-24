--购买降妖除魔提示框
function Buy_XiangYaoChuMoWndTip(sysarg)
	local str = "<(c0xFF888888)您要消耗><(c0xFFff0000)50元宝><(c0xFF888888)购买一次降妖除魔<br/><(c0xFF00FF00)(选择放弃购买,将不在面板上显示)>"
	Actor.messageBox(sysarg,0,0,str, "购买一次/Buy_XiangYaoChuMo,1,50", "放弃购买/Buy_XiangYaoChuMo,2,0", NULL, 0)
end

function Buy_XiangYaoChuMo(sysarg, type, nMoney)
	if tonumber(type) == 1 then --购买一次
		--//读取变量
		local var = Actor.getStaticVar(sysarg);
		local d = var.d;
		if d == nil then 
			Actor.sendTipmsg(sysarg, "购买失败!", ttFlyTip);
			return
		end
		
		local buyXYCHM = var.days.buyXYCHM;
		if not buyXYCHM then
			buyXYCHM = 0;
		end
		
		if Actor.changeMoney(sysarg, mtYuanbao, -nMoney, GameLog.cXiangyaochumoBuyTimes, "降妖除魔次数购买", true) then
			var.days.buyXYCHM = buyXYCHM + 1;
			d[8] = 0;
			d[3] = 2;
			if Actor.canTelport(sysarg, 0, d[7]) then
				Quest_ShuaXin(sysarg);
				Actor.telportSceneRandPos(sysarg, d[7]);
				--Actor.openarrowsguide(sysarg,1006,5,108,2);
				--Actor.openquestarrowsguide(sysarg,5000,1,10,2)
				--System.telportSceneDefaultPoint(sysarg,d.sence);
				--System.telportRandPos(sysarg);
				Giveback(sysarg);
				Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.qt00005, d[7], d[8], d[6]), ttFlyTip);
				--Actor.setAutoBattle(sysarg,true);
				Actor.addEffect(sysarg,160,6,600,0);
				Actor.openguajiGuide(sysarg, 1);------弹出挂机窗口
			end
		end
	elseif	tonumber(type) == 2 then --放弃购买
		local var = Actor.getStaticVar(sysarg);
		local d = var.d;
		if d == nil then 
			Actor.sendTipmsg(sysarg,"放弃购买失败!", ttFlyTip);
			return
		end
		var.days.BuyXYChMFlag = 1 
		Quest_ShuaXin(sysarg);
	end
end

--购买皇杠提示框
function Buy_HuangGangWndTip(sysarg)
--[[
	local str = "<(c0xFFFF0000)您要消耗200元宝购买一次领取皇杠<br/><(c0xFF00FF00)(选择放弃购买,将不在面板上显示)>"
	Actor.messageBox(sysarg,0,0,str, "购买一次/Buy_HuangGang,1", "放弃购买/Buy_HuangGang,2", NULL, 0)
	--]]
end

-- 购买皇杠
function Buy_HuangGang(sysarg,type)
--[[
	if tonumber(type) == 1 then --购买一次
		--//读取变量
		local var = Actor.getStaticVar(sysarg);
		local applyTimes = var.days.darttms

		if var.days.darttms >= EscortDartConfig.OpenTimes then
			applyTimes = EscortDartConfig.OpenTimes
		end

		if var.ActorBuyApplyTimes ~= nil and var.ActorBuyApplyTimes >= 3 then
			Actor.sendTipmsg(sysarg,string.format("<(c0xFFff0000)您今天已经额外购买满%s次了,明天再来吧.>",5),256);
			return
		end

		local money = 200

		if Actor.changeMoney(sysarg,3,-money,GameLog.cHuangGangBuyTimes,"领取皇杠次数购买",true) then
			if var.ActorBuyApplyTimes ~= nil then
				var.ActorBuyApplyTimes = var.ActorBuyApplyTimes + 1
			else
				var.ActorBuyApplyTimes = 1
			end
		
			var.days.darttms = applyTimes - 1
			Actor.sendTipmsg(sysarg,"购买成功!",256);
			Quest_ShuaXin(sysarg);
		end
	elseif	tonumber(type) == 2 then --放弃购买
		local var = Actor.getStaticVar(sysarg);
		local d = var.d;
		if d == nil then 
			Actor.sendTipmsg(sysarg,"放弃购买失败!",256);
			return
		end
		var.days.BuyHuangGangFlag = 1 
		Quest_ShuaXin(sysarg);
	end
	--]]
end

--购买采集珍珠提示框

function Buy_CaiJiZhenZhuWndTip(sysarg)
	local str = "<(c0xFFFF0000)您要消耗100元宝购买一次采集珍珠<br/><(c0xFF00FF00)(选择放弃购买,将不在面板上显示)>"
	Actor.messageBox(sysarg,0,0,str, "购买一次/Buy_CaiJiZhenZhu,1", "放弃购买/Buy_CaiJiZhenZhu,2", NULL, 0)
end

function Buy_CaiJiZhenZhu(sysarg,type)
	if tonumber(type) == 1 then --购买一次
		local var = Actor.getStaticVar(sysarg)
		if not var.BuyPearlTimes then
			var.BuyPearlTimes = 3
		elseif var.BuyPearlTimes <= 0 then
			Actor.sendTipmsg(sysarg,"今日购买次数达到上限,请明天再来",256)
			return
		end
	
		if not Actor.changeMoney(sysarg,3,-100,GameLog.cBuyPearlTimes,"采集珍珠次数购买",true) then
			Actor.sendTipmsg(sysarg,"元宝不足,购买失败",256)
			return
		end
	
		local d = var.d
		var.BuyPearlTimes = var.BuyPearlTimes - 1
		if d[31] > 0 then
			d[31] = d[31] + 1
		else
			d[31] = 1
		end
		Quest_ShuaXin(sysarg);
	elseif	tonumber(type) == 2 then --放弃购买
		local var = Actor.getStaticVar(sysarg);
		local d = var.d;
		if d == nil then 
			Actor.sendTipmsg(sysarg,"放弃购买失败!",256);
			return
		end
		var.days.BuyCaiJiZhenZhuFlag = 1 
		Quest_ShuaXin(sysarg);
	end
end