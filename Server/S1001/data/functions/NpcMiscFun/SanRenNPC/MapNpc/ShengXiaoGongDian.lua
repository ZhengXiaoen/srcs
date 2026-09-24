

local t = {}

t.main = function(sysarg)

		echo = [[

	<(c0xFFff9000)开放时间：开服第六日，5转以上玩家方可进入！>

<(idecoLine#330)>

<(c0xFF00c0ff) 1.生肖宫殿有12个生肖房间与大厅,可随机传送到生肖房间中>

<(c0xFF00c0ff) 2.大厅为免费活动区,进入十二生肖房间需元宝以及活动时间.>

<(c0xFF00c0ff) 3.每日赠送1小时活动时间,勾选自动扣费后每10秒扣除10元宝.>

< 4.大厅每隔6小时刷新特级BOSS一只,生肖BOSS每隔2小时刷新.>

<(c0xFFff9000) ps.在生肖房间PK不增加PK值,不掉落装备,死亡后的安全复活为原地复活.>


 
 
 <#BN进入地图/@enterScene>

	]];


	return echo;
end

t.enterScene =function(sysarg)

	local openServerDay = System.getDaysSinceOpenServer()
	if openServerDay<6 then 
		Actor.sendTipmsg(sysarg,"开服第6天开启此功能,敬请关注", ttFlyTip) 
		return 
	end
	local nCircle = Actor.getIntProperty(sysarg, PROP_ACTOR_CIRCLE)
	if nCircle<5 then
		Actor.sendTipmsg(sysarg,"请5转以后再来", ttFlyTip) 
		return	
	end
	--每次进入都为0
	local dVar = Actor.getDyanmicVar(sysarg)
	dVar.isChoose_shengxiaogongdian = 0
	
	Actor.enterScene(sysarg, 564,40,224)		
	System.broadcastTipmsg(string.format("<(n%s)>玩家进入生肖宫殿<(x沙漠土城:162:145:[传])>",Actor.getName(sysarg)),128)
	--SendShengXiaoGongDianInfo(sysarg)
end

function GetNpcShengXiaoGongDian() return t end