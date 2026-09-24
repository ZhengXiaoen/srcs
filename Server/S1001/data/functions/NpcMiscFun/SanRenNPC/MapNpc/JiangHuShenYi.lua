NpcDialog[358] = {needMoney={100000,100000,50,50}}--金币，元宝
NpcDialog[358].main = function(sysarg)
	--//主显示内容
	local echo = [[

  <(c0xFFb6946c)我是老中医,包治百病.>

<(idecoLine#330)>

  <我要立刻满血满蓝/@recover,3> <(c0xFFb6946c)花费 50 元宝>

  <我要立刻满血满蓝/@recover,1> <(c0xFFb6946c)花费 100,000 金币>



]]
	return echo;
end

NpcDialog[358].recover = function(sysarg,tpyes)
	local t = NpcDialog[358];
	tpyes = tonumber(tpyes)
	local maxhp = Actor.getIntProperty(sysarg,PROP_CREATURE_MAXHP);
	local hp = Actor.getIntProperty(sysarg,PROP_CREATURE_HP);
	
	local maxmp = Actor.getIntProperty(sysarg,PROP_CREATURE_MAXMP);
	local mp = Actor.getIntProperty(sysarg,PROP_CREATURE_MP);
	
	if maxhp == hp and maxmp == mp then 
		Actor.sendTipmsg(sysarg,"您目前是满血满蓝,不需要治疗.",256) 
		return 
	end

	if tpyes == 1 and Actor.getMoneyCount(sysarg,tpyes) < t.needMoney[tpyes+1] then Actor.sendTipmsg(sysarg,string.format("您的金币不足%s,有足够金币再来吧.",t.needMoney[tpyes+1]),256) return end
	if tpyes == 3 and Actor.getMoneyCount(sysarg,tpyes) < t.needMoney[tpyes+1] then Actor.sendTipmsg(sysarg,string.format("您的元宝不足%s,充值元宝后再来吧.",t.needMoney[tpyes+1]),256) return end
	
	Actor.changeMoney(sysarg,tpyes,-t.needMoney[tpyes+1],2601,"江湖神医扣钱")

	Actor.setIntProperty(sysarg,PROP_CREATURE_HP,maxhp)
	Actor.setIntProperty(sysarg,PROP_CREATURE_MP,maxmp)
	Actor.sendTipmsg(sysarg,"您已经被治愈,感觉精力充沛了吧!",256);

	local NpcName = Actor.getTalkNpcName(sysarg);
	local sTipmsg = "<(n%s)>找到<%s>瞬间满血满蓝.";
	System.broadcastTipmsg(string.format(sTipmsg, Actor.getName(sysarg), NpcName),128);

end
