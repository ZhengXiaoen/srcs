local t = {}

t.main = function(sysarg)
	--因为元宝少于2000时会自动改变状态，界面状态的维护很麻烦，所以还是两个按钮都放出来吧
		
	local echo = [[

    <(c0xFFeabc78)天神护体 之 护体神盾>

<(idecoLine#330)>

    <(c0xFFff9000)护体神盾:> <(c0xFFeabc78)生命值 +20%, 魔法值 +10%>
    <(c0xFFff9000)         > <(c0xFFeabc78)物理防御 +10%, 魔法防御 +10%>

    <(c0xFFff9000)开启条件:> <(c0xFF846f57)携带元宝数量不小于2000既可免费开启>
    <(c0xFFff9000)失效条件:> <(c0xFF846f57)当你元宝小于2000时,护体效果将自动消失>

<(idecoLine#330)>

   		  <开启护体神盾效果/@OpenShield|开启后人物身边会有一个盾字标识>

   		  <关闭护体神盾效果/@CloseShield|免费关闭>

    <(c0xFF00c0ff)PS:下线以及被击杀不会关闭天神护体>

<(idecoLine#330)>

    <若开启神盾仍被击杀,则会掉落50元宝,玩家可随意捡取>
]];


	return echo;
end

--[[
NpcDialog[322].ChangeShieldState = function(sysarg, state)
	local isok = false
	if state == 0 then
		isok = NpcDialog[322].CloseShield(sysarg)
	else
		isok = NpcDialog[322].OpenShield(sysarg)
	end
	
	--如果成功则改变界面
	if isok then
		return NpcDialog[322].main(sysarg)
	end
end
--]]

t.OpenShield = function(sysarg)
	-- CActor::OnNpcTalk 中已经判断与NPC的距理了
	
	if Actor.hasState(sysarg,esStateShield) then
		Actor.sendTipmsg(sysarg,"您的护体效果已经开启了",ttFlyTip)
		return false
	end
	
	local myYb = Actor.getUIntProperty(sysarg, PROP_ACTOR_YUANBAO)
	if myYb < 2000 then
		Actor.sendTipmsg(sysarg,"元宝不足，开启护体效果失败！",ttFlyTip)
		return false
	end
	
	if Actor.addState(sysarg,esStateShield) == false then
		Actor.sendTipmsg(sysarg,"开启护体效果失败！",ttFlyTip)
		return false
	end
	
	Actor.collectOperate(sysarg,0)
	
	local RwData = {"xxxx", "威龙城", 136,141, "我也要开启"}
	local NpcName = string.format("<%s/M%s:%s:%s:%s>", RwData[5], RwData[2], RwData[3], RwData[4], RwData[5]);
	local NpctFly = string.format("<(x%s:%s:%s:%s)>", RwData[2], RwData[3], RwData[4], RwData[5]);
	
	System.broadcastTipmsg(string.format("恭喜<(n%s)>玩家，开启了天神护体,大幅度增加属性,%s %s", Actor.getName(sysarg), NpcName, NpctFly),128);
	Actor.sendTipmsg(sysarg,"您已成功开启护体效果！",ttFlyTip)
    local nActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
    System.sendCommonLog(LogIds.opengodhuti,nActorId,Actor.getName(sysarg))
	return true
end

t.CloseShield = function(sysarg)
	-- CActor::OnNpcTalk 中已经判断与NPC的距理了
	
	if not Actor.hasState(sysarg,esStateShield) then
		Actor.sendTipmsg(sysarg,"您的护体效果是关闭的",ttFlyTip)
		return false
	end
	
	if Actor.removeState(sysarg,esStateShield) == false then
		Actor.sendTipmsg(sysarg,"关闭护体效果失败！",ttFlyTip)
		return false
	end
	
	Actor.collectOperate(sysarg,0)
	Actor.sendTipmsg(sysarg,"您的护体效果已经关闭！",ttFlyTip)
 local nActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
    System.sendCommonLog(LogIds.closegodhuti,nActorId,Actor.getName(sysarg))
	return true
end

function GetNpcTianJiDaShi() return t end