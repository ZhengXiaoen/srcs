
--#include "data\functions\MkzFunc.lua" once
local t = {
	
	mapdata = {
		--{type = 1, mapid = 1, lv = 10, mapname =	"散 人 镇"},-----散人变逐日
		{type = 1, mapid = 9, lv = 65, mapname =	"威 龙 城"},
		{type = 1, mapid = 83, lv = 80, mapname =	"沙漠土城"},
		{type = 1, mapid = 10, lv = 60, mapname =	"热血王城"},
		
		{type = 2, mapid = 6, lv = 30, mapname =	"远古猪洞"},
		{type = 2, mapid = 7, lv = 50, mapname =	"险恶寺庙"},
		{type = 2, mapid = 12, lv = 65, mapname =	"变异洞窟", tips = "每jun一层都有极品Boss刷新,最后一层刷10阶boss掉落极品装备,快来抢夺吧"},
		{type = 2, mapid = 14, lv = 70, mapname =	"幽冥矿区", tips = "每一层都有极品Boss刷新,最后一层刷10阶boss掉落极品装备,快来抢夺吧"},
		{type = 2, mapid = 16, lv = 72, mapname =	"死亡棺材", tips = "每一层都有极品Boss刷新,最后一层刷10阶boss掉落极品装备,快来抢夺吧"},
		{type = 2, mapid = 19, lv = 74, mapname =	"异教宫殿", tips = "每一层都有极品Boss刷新,最后一层刷10阶boss掉落极品装备,快来抢夺吧"},
		{type = 2, mapid = 21, lv = 76, mapname =	"虚空古墓", tips = "每一层都有极品Boss刷新,最后一层刷boss掉落1转装备,快来抢夺吧"},
		{type = 2, mapid = 24, lv = 78, mapname =	"破碎寺庙", tips = "每一层都有极品Boss刷新,最后一层刷boss掉落1转装备,快来抢夺吧"},
		{type = 2, mapid = 27, lv = 80, mapname =	"蛮荒禁地", tips = "每一层都有极品Boss刷新,最后一层刷boss掉落1转装备,快来抢夺吧"},
		{type = 3, mapid = 31, lv = 0, zlv = 1, mapname =	"迷失宫殿",	szcc = "一转", tips = "BOSS有很大机率掉落2转装备"},
		{type = 3, mapid = 34, lv = 0, zlv = 2, mapname =	"赤月洞窟",	szcc = "二转", tips = "BOSS有很大机率掉落2转装备"},
		{type = 3, mapid = 38, lv = 0, zlv = 3, mapname =	"妖族幻境",	szcc = "三转", tips = "BOSS有很大机率掉落3转装备"},
		{type = 3, mapid = 41, lv = 0, zlv = 4, mapname =	"修罗地宫",	szcc = "四转", tips = "BOSS有很大机率掉落4转装备"},
		{type = 3, mapid = 45, lv = 0, zlv = 5, mapname =	"吕 祖 峰",	szcc = "五转", tips = "BOSS很大有机率掉落5转装备"},
		{type = 3, mapid = 49, lv = 0, zlv = 6, mapname =	"龙 王 湾",	szcc = "六转", tips = "BOSS很大有机率掉落6转装备"},
		{type = 3, mapid = 53, lv = 0, zlv = 7, mapname =	"炽 焰 山",	szcc = "七转", tips = "BOSS很大有机率掉落7转装备"},
		{type = 3, mapid = 56, lv = 0, zlv = 8, mapname =	"雷炎魔窟",	szcc = "八转", tips = "BOSS很大有机率掉落7转装备"},
		{type = 3, mapid = 58, lv = 0, zlv = 9, mapname =	"极北之地",	szcc = "九转", tips = "BOSS很大有机率掉落9转装备"},
		{type = 3, mapid = 66, lv = 0, zlv = 10, mapname =	"九 龍 殿", szcc = "十转", tips = "BOSS很大有机率掉落10/11转装备"},
		{type = 3, mapid = 669, lv = 0, zlv = 12, mapname =	"水晶宫殿", szcc = "十二转", tips = "BOSS很大有机率掉落11/12/13转装备"},

		{type = 4, mapid = 104, lv = 65, zlv = 0, vlv = 0, mapname =	"免费泡点", tips = "地图内每5秒增加经验/护符碎片/绑定金币,可购买双倍时间.时间永久保存.离开地图停止计时."},
		{type = 4, mapid = 105, lv = 65, zlv = 0, vlv = 1, mapname =	"会员泡点", tips = "地图内每5秒增加经验/护符碎片/绑定金币#VIP1-VIP12的泡点奖励不同#可购买双倍时间.时间永久保存.离开地图停止计时."},
		--{type = 4, mapid = 106, lv = 65, zlv = 0, vlv = 3, mapname =	"贵族练级", tips = "挂机地图怪物友善和谐,所以避免暴力,它们最多掉血3000,再不能高了."},
		--{type = 4, mapid = 341, lv = 65, zlv = 0, vlv = 0, mapname =	"#c0xFFFFFF00#青青草原", tips = "法师佩戴首充武器使用引雷术攻击里面的怪物有机率召唤为宝宝##角色下线或死亡宝宝消失##变异恶蛆1分钟刷新#变异月魔5分钟刷新#变异石像10分钟刷新"},
		{type = 4, mapid = 343, lv = 65, zlv = 0, vlv = 0, mapname =	"#c0xFFFFFF00#废弃矿洞", tips = "里面有丰富的矿产宝藏,普通矿石可自动出售兑换绑金#高级矿石可有机率兑换到转生修为哦"},
		{type = 4, mapid = 413, lv = 80, zlv = 0, vlv = 0, mapname =	"#c0xFFFFFF00#军魂之地", tips = "每日2点45首次刷新,随后每隔2小时便刷新军魂boss.#死亡后可触发旗帜泡点每5秒增加一定量军魂值.#还伴随着掉落大量极品装备材料"},
		{type = 4, mapid = 433, lv = 0, zlv = 5, vlv = 0, mapname =	"#c0xFFFFFF00#雪域冰宫", tips = "超极品boss爆率丰富,均有机率掉落7转装备以及元宝道具幻羽精华."},
	},

};


t.characters = function(sysarg,type,i)
	type = tonumber(type);
	i = tonumber(i);
	local mid = Actor.getSceneId(sysarg);
	local pLv = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL);
	local zLv = Actor.getIntProperty(sysarg,PROP_ACTOR_CIRCLE);
	local vLv = Actor.getIntProperty(sysarg,PROP_ACTOR_VIP_GRADE);
	local td = t.mapdata;

	local mapname = td[i].mapname;
	local maplevel = td[i].lv;

	local zmaplevel = 0;
	if td[i].zlv then
		zmaplevel = td[i].zlv;
	end
	local vmaplevel = 0;
	if td[i].vlv then
		vmaplevel = td[i].vlv;
	end
	local soff = "24bb50";
	if pLv < maplevel then soff = "705e45"; end
	if zLv < zmaplevel then soff = "705e45"; end
	if vLv < vmaplevel then soff = "705e45"; end
	local soffEX = string.format("<(c0xFF%s)(%s级)>",soff,maplevel);

	if type == 2 then soffEX = string.format("<(c0xFF%s)(%s级)>",soff,maplevel); end
	if type == 3 then soffEX = string.format("<(c0xFF%s)(%s)>",soff,td[i].szcc); end
	if type == 4 then
		if vmaplevel > 0 then
			soffEX = string.format("<(c0xFF%s)(vip%s)>",soff,vmaplevel);
		end
		if zmaplevel>0 then 
			local zmaplevelZ ="一"
			if zmaplevel==5 then
				zmaplevelZ="五"
			end
			soffEX = string.format("<(c0xFF%s)(%s转)>",soff,zmaplevelZ);
		end
	end

	local mfg = i;
	if type == 2 or type == 3 then mfg = mfg - 3; end

	local a,b = math.modf(mfg / 3);
	local mfgf = "\\\\    ";
	if b ~= 0 then mfgf = " "; end
	if type == 1 then mfgf = " "; end

	local tipsf = "";
	if td[i].tips then
		tipsf = td[i].tips;
	end
	    
	--开服第四天开启军魂之地
	if td[i].mapid == 413 and System.getDaysSinceOpenServer() < 4 then
		return ""
    end
	
	return string.format("<%s/@maptoEX,%s,%s|%s>%s%s", mapname, type, i, tipsf, soffEX, mfgf);
end


t.main = function(sysarg)

	local mid = Actor.getSceneId(sysarg);
	local td = t.mapdata;
	local e = "";
			
	local svar = System.getDyanmicVar()
	if svar.useChuanSongStone~=nil and svar.useChuanSongStone==1 then
		e="<title/传送神石>"
	end
	
	if svar.useChuanSongStone ==nil then --非传送石
		local nowVar =get_taskflags_val(sysarg)
		local ta = task_all[nowVar]
		if  ta~=nil and nowVar == 30 and ta.type == 4 then   --需要改的now
			local sVar = Actor.getDyanmicVar(sysarg)
			sVar.nowNumberOfStep=1
			Actor.openarrowsguide(sysarg, 1005, 110, 160, 1);
			Actor.addTimer(sysarg,20,7*1000)
		end
		if  ta~=nil and nowVar == 49 and ta.type == 4 then   --需要改的now
			local sVar = Actor.getDyanmicVar(sysarg)
			sVar.nowNumberOfStep=1
			Actor.openarrowsguide(sysarg, 1005, 210, 160, 1);
			Actor.addTimer(sysarg,20,7*1000)
		end
		if nowVar == 72 and ta.type == 4 then   --需要改的now
			local sVar = Actor.getDyanmicVar(sysarg)
			sVar.nowNumberOfStep=1
			Actor.openarrowsguide(sysarg, 1005, 335, 160, 1);
			Actor.addTimer(sysarg,20,7*1000)
		end
		
		if nowVar == 96 and ta.type == 4 then   --需要改的now
			local sVar = Actor.getDyanmicVar(sysarg)
			sVar.nowNumberOfStep=1
			Actor.openarrowsguide(sysarg, 1005, 107, 200, 1);
		end
		
	end

	e = e .. "    <(inpcTalkImg#7#70#20)>\\<(idecoLine#330)>\\    ";
	for i = 1,#td do
		local mapid = td[i].mapid;
		local type = td[i].type;
		if mapid ~= mid and type == 1 then--npc传送+使用传送石
			-- if svar.useChuanSongStone ~=nil and svar.useChuanSongStone ==1 then
			-- 	if mapid == 10 then --换行
			-- 		e=e.."\\\\    "
			-- 	end
			-- end
			e = e .. t.characters(sysarg,type,i);
		elseif mapid == mid and type == 1 and svar.useChuanSongStone ~=nil and svar.useChuanSongStone ==1 then--使用传送石
			-- if mapid == 10 then --换行
			-- 	e=e.."\\\\    "
			-- end
			e = e .. t.characters(sysarg,type,i);
		end
	end
	e = e .. "\\    <(inpcTalkImg#11#70#20)>\\<(idecoLine#330)>\\    ";
	for i = 1,#td do
		local mapid = td[i].mapid;
		local type = td[i].type;
		if mapid ~= mid and type == 2 then--npc传送+使用传送石
			e = e .. t.characters(sysarg,type,i);
		elseif mapid == mid and type == 2 and svar.useChuanSongStone ~=nil and svar.useChuanSongStone ==1 then--使用传送石
			e = e .. t.characters(sysarg,type,i);		
		end
	end
	for i = 1,#td do
		local mapid = td[i].mapid;
		local type = td[i].type;
		--本来沙漠土城和威龙城是不一样的，现在要弄成一样的。
		--if mid == 83 and type == 3 and svar.useChuanSongStone ==nil then--npc传送
		--	e = e .. t.characters(sysarg,type,i);
		--end
		if mapid ~= mid and type == 3 then--npc传送+使用传送石
			e = e .. t.characters(sysarg,type,i);
		elseif mapid == mid and type == 3 and svar.useChuanSongStone ~=nil and svar.useChuanSongStone ==1 then--使用传送石
			e = e .. t.characters(sysarg,type,i);
		end
	end
	if svar.useChuanSongStone ~=nil and svar.useChuanSongStone ==1 then
		e = e .. "<(inpcTalkImg#12#70#20)>\\<(idecoLine#330)>\\    ";
	else 
		e = e .. "<(inpcTalkImg#12#70#20)>\\<(idecoLine#330)>\\    ";
	end
	for i = 1,#td do
		local mapid = td[i].mapid;
		local type = td[i].type;
		if mapid ~= mid and type == 4 then--npc传送+使用传送石
			e = e .. t.characters(sysarg,type,i);
		elseif mapid == mid and type == 4 and svar.useChuanSongStone ~=nil and svar.useChuanSongStone ==1 then--使用传送石
			e = e .. t.characters(sysarg,type,i);
		end
	end
	svar.useChuanSongStone = nil
	return e;
end

t.maptoEX = function(sysarg,type,i)

	if not type then return; end
	if not i then return; end
	type = tonumber(type);
	i = tonumber(i);
	local td = t.mapdata;
	if not td[i] then return; end

	local pLv = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL);
	local zLv = Actor.getIntProperty(sysarg,PROP_ACTOR_CIRCLE);
	local vLv = Actor.getIntProperty(sysarg,PROP_ACTOR_VIP_GRADE);
	local mapid = td[i].mapid;

	local maplevel = td[i].lv;

	local zmaplevel = 0;
	if td[i].zlv then
		zmaplevel = td[i].zlv;
	end
	local vmaplevel = 0;
	if td[i].vlv then
		vmaplevel = td[i].vlv;
	end

	if pLv < maplevel then
		Actor.sendTipmsg(sysarg, string.format("您的等级不足%s级,传送失败..", maplevel) ,4);
		return t.main(sysarg);
	end
	if zLv < zmaplevel then
		Actor.sendTipmsg(sysarg, string.format("您的转生等级不足%s级,传送失败..", zmaplevel) ,4);
		return t.main(sysarg);
	end
	if vLv < vmaplevel then
		Actor.sendTipmsg(sysarg, string.format("您的VIP等级不足%s级,传送失败..", vmaplevel) ,4);
		return t.main(sysarg);
	end
    if mapid == 413 then
        if System.getDaysSinceOpenServer() < 4 then
            Actor.sendTipmsg(sysarg,"开服第四天开启",ttFlyTip)
            return t.main(sysarg);
        end
    end
	if Actor.canTelport(sysarg,mapid) then
		local mname = Fuben.getSceneNameById(mapid); 
		
        local DefaultPointMapId = {9,10,83,6,7,12} --固定传送场景坐标id
        local bFind = false
        for i = 1,table.getn(DefaultPointMapId) do
            if mapid == DefaultPointMapId[i] then
                 System.telportSceneDefaultPoint(sysarg,mname)
                 
                 bFind = true
                 break
            end
        end
        if bFind ==false then
                
                Actor.telportSceneRandPos(sysarg,mname);
				if mapid == 105 or mapid == 104 then 
					enterGuaJiScene(sysarg)
					local dvar = Actor.getDyanmicVar(sysarg)
					dvar.vipGuaJiExpAll = nil 
					dvar.vipGuaJiHFAll = nil 
					dvar.vipGuaJiJingBi = nil 
				end
                --军魂之地
                if mapid == 413 then
                   
                    MkzSendBossRefreshTime(sysarg)
                end
        end
		
	end 

	local svar = System.getDyanmicVar()
	if svar.useChuanSongStone ==nil then --非传送石
		local nowVar =get_taskflags_val(sysarg)
		local ta = task_all[nowVar]
		local sVar = Actor.getDyanmicVar(sysarg)
		if  ta~=nil and nowVar == 30 and ta.type == 4 and sVar.nowNumberOfStep ==1 and mapid==6 then   --需要改的now
			sVar.nowNumberOfStep=sVar.nowNumberOfStep+1 --计算点击引导步骤用的
			Actor.addTimer(sysarg,14,1000)
			--MasterStokeAcceptTask(sysarg,ta.npcid) --14号定时器代替此函数触发，这个是延时触发	
		end
	
		if  ta~=nil and nowVar == 49 and ta.type == 4 and sVar.nowNumberOfStep ==1 and mapid==7 then   --需要改的now
			sVar.nowNumberOfStep=sVar.nowNumberOfStep+1 --计算点击引导步骤用的
			Actor.addTimer(sysarg,14,1000)
			--MasterStokeAcceptTask(sysarg,ta.npcid) --14号定时器代替此函数触发，这个是延时触发	
		end
	
		if nowVar == 72 and ta.type == 4 and sVar.nowNumberOfStep ==1 and mapid==12 then   --需要改的now
			sVar.nowNumberOfStep=sVar.nowNumberOfStep+1 --计算点击引导步骤用的
			Actor.addTimer(sysarg,14,1000)
			--MasterStokeAcceptTask(sysarg,ta.npcid) --14号定时器代替此函数触发，这个是延时触发	
		end
		
		if nowVar == 96 and ta.type == 4 and sVar.nowNumberOfStep ==1 and mapid==14 then   --需要改的now
			sVar.nowNumberOfStep=sVar.nowNumberOfStep+1 --计算点击引导步骤用的
			Actor.addTimer(sysarg,14,1000)
			--MasterStokeAcceptTask(sysarg,ta.npcid) --14号定时器代替此函数触发，这个是延时触发	
		end
	end
end

function GetNpcChuanSongYuan() return t end

--全局函数，别删除。用于传送石调用
function maptoEX(sysarg,type,i)
	t.maptoEX(sysarg,type,i)
end