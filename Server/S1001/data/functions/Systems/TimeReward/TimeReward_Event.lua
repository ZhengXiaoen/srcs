--在线奖励以及新手奖励系统中于登录登出相关联的事件处理

--#include "data\config\achieve\titles.lua" once


--第一次登入游戏的新手玩家奖励
EventCallDispatcher._CheckSetFirstLoginTimeAward = function (sysarg, arg)
	if arg == nil then return end
	local isFirstLogin = arg[1]
	--print("arg[1]:"..arg[1])
	if (isFirstLogin == 1) then
		--Actor.GiveTitle(sysarg,1)
		--Actor.setUIntProperty(sysarg,PROP_ACTOR_CURTITLE, 1) --第一次进入游戏的默认称号
		--设置称号buff
		local titleName = Titles[2].name
		local buffs = Titles[2].buff
		for i = 1, #buffs do
		  Actor.addBuff(sysarg, buffs[i].type, buffs[i].group, buffs[i].value, -1, 1, titleName)
		end
	
		--[[
		local pid = Actor.getIntProperty( sysarg, PROP_ENTITY_ID )
		
		--首次登陆送新手礼包
		--doReward( sysarg, 1 )	--2011.8.10 zac:改成任务送
		
		--二次封测修改为绑定元宝 
		--Actor.changeMoney(sysarg,mtBindYuanbao,1888,GameLog.clNpcGiveMoney,"erCiFengCe")
		--记录第一次登陆日期，用于判断从第二日算起，角色每日登录可获得188绑定元宝 
		local nYear,nMonth,nDay = System.getDate(0,0,0)
		local var = Actor.getStaticVar(sysarg)
		local loginDay = var.loginDay  --获得前一次上线日期
		if loginDay == nil then
			var.loginDay = {}
			loginDay = var.loginDay
		end
		if loginDay[1] ~= nMonth then loginDay[1] = nMonth end
		if loginDay[2] ~= nDay then loginDay[2] = nDay end
		--]]
	else
		--[[
		--从第二日算起，角色每日登录可获得188绑定元宝
		local nYear,nMonth,nDay = System.getDate(0,0,0)
		local var = Actor.getStaticVar(sysarg)
		local loginDay = var.loginDay  --获得前一次上线日期 
		if loginDay == nil then
			var.loginDay = {}
			loginDay = var.loginDay
			loginDay[1] = nMonth
			loginDay[2] = nDay
		end
		--当上次登陆日期跟本次登陆不同则给予188绑定元宝 
		if loginDay[1] ~= nMonth or loginDay[2] ~= nDay then
			--Actor.changeMoney(sysarg,mtBindYuanbao,188,GameLog.clNpcGiveMoney,"erCiFengCe")
		end
		--记录上线日期 
		loginDay[1] = nMonth
		loginDay[2] = nDay
		--]]
	end
	--print("first login end")
end


EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeUserLogin, EventCallDispatcher._CheckSetFirstLoginTimeAward)
