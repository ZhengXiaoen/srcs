--BOSS之家
local t = {
	{mapid = 77, vlv = 1, bl = 34, yb = 100, boss = {
			{"1转",60,3},
			{"2转",90,2},
			{"3转",120,2},
			{"4转",150,2},
		},
	},
	{mapid = 78, vlv = 3, bl = 35, yb = 500, boss = {
			{"3转",120,2},
			{"4转",150,2},
			{"5转",180,2},
			{"6转",210,2},
		},
	},
	{mapid = 79, vlv = 7, bl = 36, yb = 2000, boss = {
			{"4转",150,1},
			{"5转",180,1},
			{"6转",210,1},
			{"7转",240,1},
			{"9转",300,1},
			{"11转",360,1},
		},
	},

	{mapid = 630, vlv = 9, bl = 37, yb = 5000, boss = {
			{"7转",240,2},
			{"9转",300,2},
			{"11转",360,1},
		},
	},


}

t.main = function(sysarg)
	local echo = "";
	local vip_level = tonumber(Actor.getIntProperty(sysarg,PROP_ACTOR_VIP_GRADE));	--取出玩家VIP等级0~12
	local vip_lv = {};
	local map_name = {};
	local map_boss = {};
	local map_yb = {};
	for i = 1,#t do
		if vip_level < t[i].vlv then
			vip_lv[i] = string.format("<(c0xFF888888)vip%s级进入免费>",t[i].vlv);
		else
			vip_lv[i] = string.format("<(c0xFFfddc00)vip%s级进入免费>",t[i].vlv);
		end
		map_name[i] = Fuben.getSceneNameById(t[i].mapid);
		map_yb[i] = t[i].yb;
		local tbs = t[i].boss;
		map_boss[i] = "";
		for k = 1,#tbs do
			local tbstr = "&fddc00&%s&b6946c& BOSS刷新时间为 &fddc00&%s&b6946c& 分钟 &fddc00&%s&b6946c& 只#";
			--print(tbs[k][1],tbs[k][2],tbs[k][3])
			map_boss[i] = map_boss[i] .. string.format(tbstr, tbs[k][1], tbs[k][2], tbs[k][3]);
			
		end
		
	end

	echo = echo .. [[

    <(c0xFFeabc78)身为VIP的您请选择要进入的地图:> 

<(idecoLine#315)>

	<进入]] .. map_name[1] .. [[/@BOSS,1|]]..map_boss[1]..[[><(c0xFFb6946c)(需要]]..map_yb[1]..[[元宝,>]] .. vip_lv[1] .. [[<(c0xFFb6946c))> 

	<进入]] .. map_name[2] .. [[/@BOSS,2|]]..map_boss[2]..[[><(c0xFFb6946c)(需要]]..map_yb[2]..[[元宝,>]] .. vip_lv[2] .. [[<(c0xFFb6946c))> 

	<进入]] .. map_name[3] .. [[/@BOSS,3|]]..map_boss[3]..[[><(c0xFFb6946c)(需要]]..map_yb[3]..[[元宝,>]] .. vip_lv[3] .. [[<(c0xFFb6946c))> 

	<进入]] .. map_name[4] .. [[/@BOSS,4|]]..map_boss[4]..[[><(c0xFFb6946c)(需要]]..map_yb[4]..[[元宝,>]] .. vip_lv[4] .. [[<(c0xFFb6946c))> 

	<(c0xFF846f57)VIP玩家可以免费进入，非VIP玩家可花费元宝进入>
<(idecoLine#315)>
    <(c0xFFeabc78)其它BOSS简单攻略:>
	<(c0xFF846f57)军团使者 → 军团地图 → 转生装备>
	<(c0xFF846f57)散人殿堂 → 威 龙 城 → 转生装备>
	<(c0xFF846f57)荒古之地 → 荒古卷轴 → 战将装备>
	<(c0xFF846f57)秦始皇陵 → 沙漠土城 → 高级技能>
	<(c0xFF846f57)传 送 员 → 沙漠土城 → 转生装备>
	<(c0xFF846f57)转生地宫 → 沙漠土城 → 转生装备>

]];
	
	--只为了一个任务特殊处理的
	--[[
	二：转世重生任务完成后，继续延续增加一个任务！
	：需要82级触发，任务内容：击杀2只76级以上BOSS便可完成。然后再找boss之家NPC完成。 
	奖励：特戒结晶x1
	推荐地图：BOSS之家、赤月洞窟
	提示文字：BOSS之家刷新时间减半！
	--]]
	local var = Actor.getStaticVar(sysarg)
	local pLv = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	if var.betonSHENJIAFinish ~=nil and var.betonSHENJIAFinish==1 and (pLv >=82 or var.speicltaskKM~=nil )and var.speicltaskKM~=nil and var.speicltaskKM==5 then --完成了任务的时候
		echo=[[
		<(idecoLine#330)>
<(c0xFF00c0ff)友情提示：>
  <右上角><(c0xFF00FF00)挑战BOSS><面板的><(c0xFF00FF00)野外BOSS><可查看全服BOSS掉落信息.>
	<(c0xFF846f57)军团使者 → 军团地图 → 转生装备>
	<(c0xFF846f57)散人殿堂 → 威 龙 城 → 转生装备>
	<(c0xFF846f57)荒古之地 → 荒古卷轴 → 战将装备>
	<(c0xFF846f57)秦始皇陵 → 沙漠土城 → 高级技能>
	<(c0xFF846f57)转生地宫 → 沙漠土城 → 转生装备>\]]
		echo=echo.."<#BN完成任务/@FinishspecialTask2>"
			local smbl = {90,91,92,93,94,95,99,100,101,102,103,104,108,109,110,111,112,113};
	for j = 1,#smbl do
		
		if j == 6 or  j == 12 or j == 18 then
			echo = echo .. NpcDialog[393].ipk(smbl[j]) .. "\\";
		else
			echo = echo .. NpcDialog[393].ipk(smbl[j]) .. " ";
		end
	end
	end


	return echo;
end

--完成了额外任务
t.FinishspecialTask2 = function(sysarg)
	local var = Actor.getStaticVar(sysarg)
	local bagIdxs = Item.getBagEmptyGridCount( sysarg )
	if bagIdxs < 1 then
		Actor.sendTipmsg(sysarg, "背包不足", ttFlyTip)  
		return
	end
	if var.betonSHENJIAFinish==nil or  var.betonSHENJIAFinish~=1 then 
		return 
	end
	var.betonSHENJIAFinish=2
	Actor.addItem(sysarg, 527,0,0,1,1,0,"额外任务2",1)
	Quest_ShuaXin(sysarg)
	return t.main(sysarg)
end

t.BOSS = function(sysarg,idx)
	if not idx then return; end	--判断idx参数是否存在, 如果不存在就 return
	idx = tonumber(idx); --将idx参数转为为数值型
	
	local mapid = t[idx].mapid;	--取出即将传送进入的地图ID
	local vlv = t[idx].vlv; --取出即将传送进入的地图需求的VIP等级 
	local vip_level = tonumber(Actor.getIntProperty(sysarg,PROP_ACTOR_VIP_GRADE));	--取出玩家VIP等级0~12


	local offvip = 0;

	if vip_level < vlv then	--判断玩家VIP等级是否小于地图进去需求的VIP等级
		offvip = 1;
	end

	local needYB = t[idx].yb;
	if offvip == 1 then
		if needYB > Actor.getIntProperty(sysarg, PROP_ACTOR_YUANBAO) then 
			Actor.sendTipmsg(sysarg, string.format("您的元宝不足%s或是VIP等级不足%s,进入失败.", needYB, vlv), ttFlyTip);
			return;
		else
			Actor.changeMoney(sysarg, 3, -needYB, 2642, "EnterBossZhiJia");
		end
	end

	
	-- if get_d_val(sysarg,t[idx].bl) < 1 then
	-- 	Actor.sendTipmsg(sysarg, "您进入当前地图的剩余时间已经用完,请明天再来吧!", 256);
	-- 	return;
	-- end
	if Actor.canTelport(sysarg,mapid) then --判断是否可传送到指定地图
		local map_name = Fuben.getSceneNameById(mapid);	--根据地图ID取地图名字
		--System.telportSceneDefaultPoint(sysarg,map_name); --将玩家传送到指定地图, 参数1是玩家指针, 参数2是地图名字
		
		--随机传送		
		local h=0
		local w=0
		local times=0
		for i=1,10000 do --循环1万次找随机点
			local bHandle = Fuben.getSceneHandleById(mapid,0)
			
			h = System.getRandomNumber(Fuben.getScenHeight(bHandle)) + 1
			w = System.getRandomNumber(Fuben.getSceenWidth(bHandle)) + 1
			Fuben.onCanMove(bHandle,h,w)
			if Fuben.onCanMove(bHandle,h,w)== true then
				break
			end
			times=i
		end
		if times < 10000 then 
			System.telportScene(sysarg,	mapid, h, w)
		else 
			System.telportSceneDefaultPoint(sysarg,map_name)
		end
		
		
		local NpcName = Actor.getTalkNpcName(sysarg); --取出正在对话的NPC名字
		local StrNpcE = string.format("<%s/M威龙城:125:165:%s><(x威龙城:125:165:%s)>",NpcName,NpcName,NpcName);
		--Actor.addTimer(sysarg, 19, 60000);
		--del_d_val(sysarg,t[idx].bl,1);
		--Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)失去> <(c0xFF0090ff)%s(%s)分钟当前地图时间>", 1, get_d_val(sysarg,t[idx].bl)),1);
		if offvip == 0 then 
			System.broadcastTipmsg(string.format("VIP玩家<(n%s)>通过%s进入<%s>打BOSS爆装备了.",Actor.getName(sysarg),StrNpcE,map_name),128)
		else 
			System.broadcastTipmsg(string.format("玩家<(n%s)>通过%s进入<%s>打BOSS爆装备了.",Actor.getName(sysarg),StrNpcE,map_name),128)
		end

	end
end

function GetNpcBOSSZhiJia() return t end

