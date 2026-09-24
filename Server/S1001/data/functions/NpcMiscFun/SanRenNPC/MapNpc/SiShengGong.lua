
local t = {
	data = 
	{	
		{needMoney = 500000, needZhanLi = 600000,bossId = 1061,sceneId = 434 ,bossName = "圣•青龙",awards={{id=1,count=2,bind=1},{id=2,count=3,bind =1},},},  
		{needMoney = 500000, needZhanLi = 700000,bossId = 1062,sceneId = 435 ,bossName = "圣•朱雀",awards={{id=1,count=2,bind=1},{id=2,count=3,bind =1},},},
		{needMoney = 500000, needZhanLi = 800000,bossId = 1063,sceneId = 436 ,bossName = "圣•白虎",awards={{id=1,count=2,bind=1},{id=2,count=3,bind =1},},},
		{needMoney = 500000, needZhanLi = 1000000,bossId = 1064,sceneId = 437 ,bossName = "圣•玄武",awards={{id=1,count=2,bind=1},{id=2,count=3,bind =1},},},
		{needMoney = 800000, needZhanLi = 1400000,bossId = 1065,sceneId = 438 ,bossName = "魔•巫师",awards={{id=1,count=2,bind=1},{id=2,count=3,bind =1},},},
		{needMoney = 800000, needZhanLi = 1600000,bossId = 1066,sceneId = 439 ,bossName = "魔•蛟龙",awards={{id=1,count=2,bind=1},{id=2,count=3,bind =1},},},
		{needMoney = 800000, needZhanLi = 1800000,bossId = 1067,sceneId = 440 ,bossName = "魔•死神",awards={{id=1,count=2,bind=1},{id=2,count=3,bind =1},},},
		{needMoney = 800000, needZhanLi = 2000000,bossId = 1068,sceneId = 441 ,bossName = "魔•领主",awards={{id=1,count=2,bind=1},{id=2,count=3,bind =1},},},
        {needMoney = 1500000, needZhanLi = 2400000,bossId = 1357,sceneId = 692 ,bossName = "神•盖苏文",awards={{id=1,count=2,bind=1},{id=2,count=3,bind =1},},},
		{needMoney = 1500000, needZhanLi = 2800000,bossId = 1358,sceneId = 693 ,bossName = "神•宇文成都",awards={{id=1,count=2,bind=1},{id=2,count=3,bind =1},},},
		{needMoney = 1500000, needZhanLi = 3200000,bossId = 1359,sceneId = 694 ,bossName = "神•二郎神",awards={{id=1,count=2,bind=1},{id=2,count=3,bind =1},},},
		{needMoney = 1500000, needZhanLi = 3600000,bossId = 1360,sceneId = 695 ,bossName = "神•龙太子",awards={{id=1,count=2,bind=1},{id=2,count=3,bind =1},},},

		{needMoney = 2000000, needZhanLi = 2500000,bossId = 1391,sceneId = 727 ,bossName = "仙宫东将",awards={{id=1,count=2,bind=1},{id=2,count=3,bind =1},},},
		{needMoney = 2000000, needZhanLi = 3000000,bossId = 1392,sceneId = 728 ,bossName = "仙宫南将",awards={{id=1,count=2,bind=1},{id=2,count=3,bind =1},},},
		{needMoney = 2000000, needZhanLi = 3500000,bossId = 1393,sceneId = 729 ,bossName = "仙宫西将",awards={{id=1,count=2,bind=1},{id=2,count=3,bind =1},},},
		{needMoney = 2000000, needZhanLi = 4000000,bossId = 1394,sceneId = 730 ,bossName = "仙宫北将",awards={{id=1,count=2,bind=1},{id=2,count=3,bind =1},},},
	}

}
t.main = function(sysarg)

	local sVar = System.getStaticVar()
	if sVar.siShenGong==nil then 
		sVar.siShenGong ={}
	end
	
	function isKill(bossId)
		if sVar.siShenGong[bossId] ==nil then 
			return "<(c0xFF00ff00)[未首杀]>"
		else
			return "<(c0xFFa7a7a7)[已首杀]>"
		end
	end
	
	--//主显示内容
	local echo = [[
<(c0xFFeabc78)刷新说明：
	1.圣兽刷新时间为24小时.
	2.首杀圣兽可领取><9888元宝><(c0xFFeabc78)奖励以及全平台播报.奖励名誉双丰收！>
<(idecoLine#330)>
	]]..isKill(t.data[1].bossId)..[[ <挑战]]..t.data[1].bossName..[[/@enterScene,1|每次进入所需50W绑定金币/金币><(c0xFFffff00)《战力要求大于:600000》>
<(idecoLine#330)>
	]]..isKill(t.data[2].bossId)..[[ <挑战]]..t.data[2].bossName..[[/@enterScene,2|每次进入所需50W绑定金币/金币><(c0xFFffff00)《战力要求大于:700000》>
<(idecoLine#330)>
	]]..isKill(t.data[3].bossId)..[[ <挑战]]..t.data[3].bossName..[[/@enterScene,3|每次进入所需50W绑定金币/金币><(c0xFFffff00)《战力要求大于:800000》>
<(idecoLine#330)>
	]]..isKill(t.data[4].bossId)..[[ <挑战]]..t.data[4].bossName..[[/@enterScene,4|每次进入所需50W绑定金币/金币><(c0xFFffff00)《战力要求大于:1000000》>

 <挑战四圣兽/@main>   <挑战四魔王/@main2>   <挑战四神将/@main3>   <挑战四仙将/@main4>		 
<(idecoLine#330)>	
<(c0xFFeabc78)掉落显示：>
]]
	local smbl = {144,145,146,5385,5657,5947,153,154,155,5661,5658,5948,162,163,164,4615,5659,5949};
	for j = 1,#smbl do
		
		if j == 6 or  j == 12 or j == 18 then
			echo = echo .. t.ipk(smbl[j]) .. "\\";
		else
			echo = echo .. t.ipk(smbl[j]) .. " ";
		end
	end



	 return echo;

end

-- NpcDialog[393].ipk = function(id)
--     if not id then id = 1; end
--     return string.format("<(iitem#%s#1)>",id);
-- end

--

t.main2 = function(sysarg)
	--//主显示内容
	local echo = [[
<(c0xFFeabc78)刷新说明：
	1.魔王刷新时间为24小时.
	2.首杀魔王可领取><9888元宝><(c0xFFeabc78)奖励以及全平台播报.奖励名誉双丰收！>
<(idecoLine#330)>
	]]..isKill(t.data[5].bossId)..[[ <挑战]]..t.data[5].bossName..[[/@enterScene,5|每次进入所需80W绑定金币/金币><(c0xFFffff00)《战力要求大于:1400000》>
<(idecoLine#330)>
	]]..isKill(t.data[6].bossId)..[[ <挑战]]..t.data[6].bossName..[[/@enterScene,6|每次进入所需80W绑定金币/金币><(c0xFFffff00)《战力要求大于:1600000》>
<(idecoLine#330)>
	]]..isKill(t.data[7].bossId)..[[ <挑战]]..t.data[7].bossName..[[/@enterScene,7|每次进入所需80W绑定金币/金币><(c0xFFffff00)《战力要求大于:1800000》>
<(idecoLine#330)>
	]]..isKill(t.data[8].bossId)..[[ <挑战]]..t.data[8].bossName..[[/@enterScene,8|每次进入所需80W绑定金币/金币><(c0xFFffff00)《战力要求大于:2000000》>
				
 <挑战四圣兽/@main>   <挑战四魔王/@main2>   <挑战四神将/@main3>   <挑战四仙将/@main4>
<(idecoLine#330)>	
<(c0xFFeabc78)掉落显示：>
]]
	local smbl = {144,145,146,5385,5657,5947,153,154,155,5661,5658,5948,162,163,164,4615,5659,5949};
	for j = 1,#smbl do
		
		if j == 6 or  j == 12 or j == 18 then
			echo = echo .. t.ipk(smbl[j]) .. "\\";
		else
			echo = echo .. t.ipk(smbl[j]) .. " ";
		end
	end



	 return echo;
end

t.main3 = function(sysarg)
	--//主显示内容
	local echo = [[
<(c0xFFeabc78)刷新说明：
	1.神将刷新时间为24小时.
	2.首杀神将可领取><9888元宝><(c0xFFeabc78)奖励以及全平台播报.奖励名誉双丰收！>
<(idecoLine#330)>
	]]..isKill(t.data[9].bossId)..[[ <挑战]]..t.data[9].bossName..[[/@enterScene,9|每次进入所需150W绑定金币/金币><(c0xFFffff00)《战力要求大于:2400000》>
<(idecoLine#330)>
	]]..isKill(t.data[10].bossId)..[[ <挑战]]..t.data[10].bossName..[[/@enterScene,10|每次进入所需150W绑定金币/金币><(c0xFFffff00)《战力要求大于:2800000》>
<(idecoLine#330)>
	]]..isKill(t.data[11].bossId)..[[ <挑战]]..t.data[11].bossName..[[/@enterScene,11|每次进入所需150W绑定金币/金币><(c0xFFffff00)《战力要求大于:3200000》>
<(idecoLine#330)>
	]]..isKill(t.data[12].bossId)..[[ <挑战]]..t.data[12].bossName..[[/@enterScene,12|每次进入所需150W绑定金币/金币><(c0xFFffff00)《战力要求大于:3600000》>
				
 <挑战四圣兽/@main>   <挑战四魔王/@main2>   <挑战四神将/@main3>   <挑战四仙将/@main4>	
<(idecoLine#330)>	
<(c0xFFeabc78)掉落显示：>
]]
	local smbl = {144,145,146,5385,5657,5947,153,154,155,5661,5658,5948,162,163,164,4615,5659,5949};
	for j = 1,#smbl do
		
		if j == 6 or  j == 12 or j == 18 then
			echo = echo .. t.ipk(smbl[j]) .. "\\";
		else
			echo = echo .. t.ipk(smbl[j]) .. " ";
		end
	end



	 return echo;
end



t.main4 = function(sysarg)
	--//主显示内容
	local echo = [[
<(c0xFFeabc78)刷新说明：
	1.神将刷新时间为24小时.
	2.首杀神将可领取><9888元宝><(c0xFFeabc78)奖励以及全平台播报.奖励名誉双丰收！>
<(idecoLine#330)>
	]]..isKill(t.data[13].bossId)..[[ <挑战]]..t.data[13].bossName..[[/@enterScene,13|每次进入所需200W绑定金币/金币><(c0xFFffff00)《战力要求大于:2500000》>
<(idecoLine#330)>
	]]..isKill(t.data[14].bossId)..[[ <挑战]]..t.data[14].bossName..[[/@enterScene,14|每次进入所需200W绑定金币/金币><(c0xFFffff00)《战力要求大于:3000000》>
<(idecoLine#330)>
	]]..isKill(t.data[15].bossId)..[[ <挑战]]..t.data[15].bossName..[[/@enterScene,15|每次进入所需200W绑定金币/金币><(c0xFFffff00)《战力要求大于:3500000》>
<(idecoLine#330)>
	]]..isKill(t.data[16].bossId)..[[ <挑战]]..t.data[16].bossName..[[/@enterScene,16|每次进入所需200W绑定金币/金币><(c0xFFffff00)《战力要求大于:4000000》>
				
 <挑战四圣兽/@main>   <挑战四魔王/@main2>   <挑战四神将/@main3>   <挑战四仙将/@main4>	
<(idecoLine#330)>	
<(c0xFFeabc78)掉落显示：>
]]
	local smbl = {144,145,146,5385,5657,5947,153,154,155,5661,5658,5948,162,163,164,4615,5659,5949};
	for j = 1,#smbl do
		
		if j == 6 or  j == 12 or j == 18 then
			echo = echo .. t.ipk(smbl[j]) .. "\\";
		else
			echo = echo .. t.ipk(smbl[j]) .. " ";
		end
	end



	 return echo;
end


--进入

-- t.NpcDialog[393].ipk = function(id)
--     if not id then id = 1; end
--     return string.format("<(iitem#%s#1)>",id);
-- end
t.ipk = function(id)
    if not id then id = 1; end
    return string.format("<(iitem#%s#1)>",id);
end


t.enterScene =function(sysarg,index)

	index =tonumber(index)
	--判断战力
	local nMyBattle = Actor.getIntProperty(sysarg, PROP_ACTOR_BATTLE_POWER)
	if nMyBattle < t.data[index].needZhanLi then 
		Actor.sendTipmsg(sysarg,"战力不足", ttFlyTip) 
		if index<5 then 
			return t.main(sysarg)
		else 	
			return t.main2(sysarg)
		end
	end
	
	--判断金币
	local MC = 2;
	local needMoneys = t.data[index].needMoney
    if Actor.getMoneyCount(sysarg,1) >= needMoneys then MC = 1; end
    if Actor.getMoneyCount(sysarg,0) >= needMoneys then MC = 0; end
    if MC == 2 then
        Actor.sendTipmsg(sysarg, string.format("您的绑金或金币不足 <%s>.",needMoneys), 256);
        return ;
    end
	
	Actor.changeMoney(sysarg, MC, -needMoneys,LogIds.sishengong, "四圣宫" );
	
	--进入地图
	Actor.enterScene(sysarg,t.data[index].sceneId,100,100)
	--广播
	local strlog = ""
	if index<5 then 
		strlog = string.format("<(n%s)>玩家实力非凡,踏入四圣宫挑战四圣,顶级装备随便爆!!<(x威龙城:141:136:[传])>",Actor.getName(sysarg))
		-- System.broadcastTipmsg(strlog,ttChatWindow )
	elseif index >= 5 and index <= 8 then	
		strlog = string.format("<(n%s)>玩家实力非凡,踏入魔宫挑战魔王,顶级装备随便爆!!<(x威龙城:141:136:[传])>",Actor.getName(sysarg))
    else
        strlog = string.format("<(n%s)>玩家实力非凡,踏入神宫挑战神将,顶级装备随便爆!!<(x威龙城:141:136:[传])>",Actor.getName(sysarg))
	end
	if index >= 13 and index <= 16 then
		strlog = string.format("<(n%s)>玩家实力非凡,踏入仙宫挑战仙将,顶级装备随便爆!!<(x威龙城:141:136:[传])>",Actor.getName(sysarg))
	end
	System.broadcastTipmsg(strlog,ttChatWindow+ ttScreenCenter)
	--Actor.sendTipmsg(sysarg,strlog,ttChatWindow)
	
end

function GetNpcSiShengGong() return t end


--func getShouSha 1061
function getShouSha(sysarg,id)
	id = tonumber(id)
	local sVar = System.getStaticVar()
	if sVar.siShenGong==nil then 
		Actor.sendTipmsg(sysarg,"没有首杀",ttFlyTip)
	elseif sVar.siShenGong[id]==nil then 
		Actor.sendTipmsg(sysarg,"没有首杀",ttFlyTip)
	else 
		Actor.sendTipmsg(sysarg,"已经被首杀",ttFlyTip)
	end
					
end