--BOSS之家里面传送员
local t = {
	{mapid = 77, vlv = 3, bl = 34, yb = 500, boss = {
			{"1转",60,1},
			{"2转",90,1},
			{"3转",120,1},
			{"4转",150,1},
			{"5转",180,1},
			{"6转",210,1},
		},
	},
	{mapid = 78, vlv = 5, bl = 35, yb = 1000, boss = {
			{"1转",60,1},
			{"2转",90,1},
			{"3转",120,1},
			{"4转",150,1},
			{"5转",180,1},
			{"6转",210,1},
		},
	},
	{mapid = 79, vlv = 7, bl = 36,  yb = 2000,boss = {
			{"1转",60,1},
			{"2转",90,1},
			{"3转",120,1},
			{"4转",150,1},
			{"5转",180,1},
			{"6转",210,1},
			{"7转",240,1},
			{"9转",300,1},
			{"11转",360,1},
		},
	},

	{mapid = 630, vlv = 9, bl = 37,  yb = 5000,boss = {
			{"5转",180,1},
			{"6转",210,1},
			{"7转",240,1},
			{"9转",300,1},
			{"11转",360,1},
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
	for i = 1,#t do
		if vip_level < t[i].vlv then
			vip_lv[i] = string.format("<(c0xFFb6946c)(><(c0xFFb6946c)需要%s元宝,><(c0xFF888888)vip%s级进入免费><(c0xFFb6946c))>",t[i].yb,t[i].vlv);
		else
			vip_lv[i] = string.format("<(c0xFFb6946c)(><(c0xFFb6946c)需要%s元宝,><(c0xFFfddc00)vip%s级进入免费><(c0xFFb6946c))>",t[i].yb,t[i].vlv);
		end
		map_name[i] = Fuben.getSceneNameById(t[i].mapid);

		local tbs = t[i].boss;
		map_boss[i] = "";
		for k = 1,#tbs do
			local tbstr = "&fddc00&%s&b6946c& BOSS刷新时间为 &fddc00&%s&b6946c& 分钟 &fddc00&%s&b6946c& 只#";
			print(tbs[k][1],tbs[k][2],tbs[k][3])
			map_boss[i] = map_boss[i] .. string.format(tbstr, tbs[k][1], tbs[k][2], tbs[k][3]);
			
		end
		
	end


	echo = echo .. [[

    <(c0xFFeabc78)您可以在我这里快速传送到其他2层去:>

<(idecoLine#315)>

]];	
	for i = 1,#t do
		print(Actor.getSceneId(sysarg),t[i].mapid)
		if Actor.getSceneId(sysarg) ~= t[i].mapid then
			echo = echo .. string.format("      <进入%s/@BOSS,%s|%s>%s\\\\", map_name[i], i, map_boss[i], vip_lv[i]);
		end
	end

	return echo;

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
	

	--if vip_level < vlv then	--判断玩家VIP等级是否小于地图进去需求的VIP等级
	--	Actor.sendTipmsg(sysarg, string.format("您的VIP等级不足 <%s> 级, 进入失败!\\请提升VIP等级之后再来找我进入吧.",vlv), 4);
	--	return;
	--end
	
	
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
		if times <10000 then 
			System.telportScene(sysarg,	mapid, h, w)
		else 
			System.telportSceneDefaultPoint(sysarg,map_name)
		end
		
		
		local NpcName = Actor.getTalkNpcName(sysarg); --取出正在对话的NPC名字
		local StrNpcE = string.format("<%s/M威龙城:125:165:%s><(x威龙城:125:165:%s)>",NpcName,NpcName,NpcName);
		--Actor.addTimer(sysarg, 19, 60000);
		--del_d_val(sysarg,t[idx].bl,1);
		--Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)失去> <(c0xFF0090ff)%s(%s)分钟当前地图时间>", 1, get_d_val(sysarg,t[idx].bl)),1);
		System.broadcastTipmsg(string.format("VIP玩家<(n%s)>通过%s进入<%s>打BOSS爆装备了.",Actor.getName(sysarg),StrNpcE,map_name),128);
	end
end



function GetNpcBOSSZHIJIAYI() return t end