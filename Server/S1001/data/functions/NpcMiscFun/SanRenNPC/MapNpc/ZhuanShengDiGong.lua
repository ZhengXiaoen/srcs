
--转生地宫
--地图id287~297,条件1~11转
local t = {

	data = {
		{mapname = "一转神殿", bj = 1, zlv = {1}, mapid = 287, zmid = 548, dev = 1,refTime = 120},
		{mapname = "二转神殿", bj = 2, zlv = {2}, mapid = 288, zmid = 548, dev = 1,refTime = 120},
		{mapname = "三转神殿", bj = 3, zlv = {3}, mapid = 289, zmid = 548, dev = 2,refTime = 120},
		{mapname = "四转神殿", bj = 4, zlv = {4}, mapid = 290, zmid = 548, dev = 2,refTime = 120},
		{mapname = "五转神殿", bj = 5, zlv = {5}, mapid = 291, zmid = 548, dev = 3,refTime = 120},
		{mapname = "六转神殿", bj = 6, zlv = {6}, mapid = 292, zmid = 548, dev = 5,refTime = 120},
		{mapname = "七转神殿", bj = 7, zlv = {7,8}, mapid = 293, zmid = 548, dev = 10,refTime = 240},
		{mapname = "九转神殿", bj = 8, zlv = {9,10}, mapid = 294, zmid = 548, dev = 15,refTime = 300},
		{mapname = "11转神殿", bj = 9, zlv = {11,12}, mapid = 295, zmid = 548, dev = 25,refTime = 360},
		{mapname = "13转神殿", bj = 9, zlv = {13,14,15}, mapid = 296, zmid = 548, dev = 40,refTime = 480},
	},
	data2 = {
		--{mapname = "一转暗之神殿", bj = 81, zlv = {1}, mapid = 320, zmid = 548, dev = 1,refTime = 120},
		--{mapname = "二转暗之神殿", bj = 82, zlv = {2}, mapid = 321, zmid = 548, dev = 1,refTime = 120},
		--{mapname = "三转暗之神殿", bj = 83, zlv = {3}, mapid = 322, zmid = 548, dev = 2,refTime = 120},
		--{mapname = "四转暗之神殿", bj = 84, zlv = {4}, mapid = 323, zmid = 548, dev = 2,refTime = 120},
		--{mapname = "五转暗之神殿", bj = 85, zlv = {5}, mapid = 324, zmid = 548, dev = 3,refTime = 120},
		--{mapname = "六转暗之神殿", bj = 86, zlv = {6}, mapid = 325, zmid = 548, dev = 5,refTime = 120},
		--{mapname = "七转暗之神殿", bj = 87, zlv = {7,8}, mapid = 326, zmid = 548, dev = 10,refTime = 240},
		--{mapname = "九转暗之神殿", bj = 88, zlv = {9,10,11,12,13}, mapid = 327, zmid = 548, dev = 20,refTime = 300},
		----{mapname = "11转暗之神殿", bj = 89, zlv = {11,12,13}, mapid = 328, zmid = 548, dev = 50,},
	},
	data3 = {
		--{mapname = "一转重装神殿", bj = 90, zlv = {1}, mapid = 329, zmid = 548, dev = 1,refTime = 120},
		--{mapname = "二转重装神殿", bj = 91, zlv = {2}, mapid = 330, zmid = 548, dev = 1,refTime = 120},
		--{mapname = "三转重装神殿", bj = 92, zlv = {3}, mapid = 331, zmid = 548, dev = 2,refTime = 120},
		--{mapname = "四转重装神殿", bj = 93, zlv = {4}, mapid = 332, zmid = 548, dev = 2,refTime = 120},
		--{mapname = "五转重装神殿", bj = 94, zlv = {5}, mapid = 333, zmid = 548, dev = 3,refTime = 120},
		--{mapname = "六转重装神殿", bj = 95, zlv = {6}, mapid = 334, zmid = 548, dev = 5,refTime = 120},
		--{mapname = "七转重装神殿", bj = 96, zlv = {7,8}, mapid = 335, zmid = 548, dev = 15,refTime = 240},
		--{mapname = "九转重装神殿", bj = 97, zlv = {9,10,11,12,13}, mapid = 336, zmid = 548, dev = 20,refTime = 300},
		----{mapname = "11转重装神殿", bj = 98, zlv = {11,12,13}, mapid = 337, zmid = 548, dev = 75,},
	},
};

t.buyzm = function(sysarg)
	Actor.openDialogs(sysarg,diBuyAnItem,548);
end

t.main = function(sysarg)
	--//主显示内容
	local mycircle = Actor.getIntProperty(sysarg, PROP_ACTOR_CIRCLE);
	local d = t.data;
	local d2 = t.data2;
	local d3 = t.data3;
	local svar = System.getDyanmicVar(sysarg);
	local s = svar.srRefreshMonster;		--记录是否存活,1为存活,0为没有
	if s == nil then svar.srRefreshMonster = {}; s = svar.srRefreshMonster; end
	local bh = {};
	for k = 1,1 do
		if not bh[k] then
			bh[k] = {};
		end
		local temptable = d;
		if k == 2 then temptable = d2; end
		if k == 3 then temptable = d3; end


    
    local remaining = svar.srrmRemaining;	--记录刷怪剩余时间,如果等于0就刷
    if remaining == nil then svar.srrmRemaining = {}; remaining = svar.srrmRemaining; end

		for i = 1,#temptable do
			if s[temptable[i].bj] == 1 then
				bh[k][i] = "&00FF00&已刷新&ffffff&";
			else
				--local a,b = math.modf(svar.srRefreshMonsterTime / 120);
				local syt = remaining[temptable[i].bj];
				if syt == nil then syt = 0; end
				bh[k][i] = "&FF0000&"..syt.."分钟后刷新&ffffff&";
			end
		end
	end

	local e = [[

  <(c0xFFb6946c)对应转生即可进入对应转生的地图.><购买转生地宫证明/@buyzm|各野外地图怪物均可掉落 转生地宫证明##也可直接进行购买>

<(idecoLine#315)>

]];

	for i = 1,#d do
		local ckstr = "#c0xFF888888#%s";
		for k = 1,#d[i].zlv do
			if mycircle == d[i].zlv[k] then ckstr = "<showEff%s>"; end
		end
        local str = string.format("      <"..ckstr.."/@EnterScene,%s|进入需要 %s 张 %s#刷新时间 %s 分钟>   ", d[i].mapname, i, d[i].dev, Item.getItemName(d[i].zmid),d[i].refTime);
		--local str = string.format("    <"..ckstr.."/@EnterScene,%s|进入需要 %s 张 %s#刷新时间 %s 分钟##当前BOSS状态: %s>\\\\", d[i].mapname, i, d[i].dev, Item.getItemName(d[i].zmid),d[i].refTime, bh[1][i]);
		--local str2 = string.format("    <"..ckstr.."/@EnterScene2,%s|进入需要 %s 张 %s#刷新时间 %s 分钟##当前BOSS状态: %s##&00FF00&主要掉落衣服>", d2[i].mapname, i, d2[i].dev, Item.getItemName(d2[i].zmid), d2[i].refTime,bh[2][i]);
		--local str3 = string.format("    <"..ckstr.."/@EnterScene3,%s|进入需要 %s 张 %s#刷新时间 %s 分钟##当前BOSS状态: %s##&00FF00&主要掉落武器>\\\\", d3[i].mapname, i, d3[i].dev, Item.getItemName(d3[i].zmid),d2[i].refTime, bh[3][i]);
		--e = e .. str .. str2 .. str3;
		e = e .. str
		if i%3==0 then 
			e = e.."\\\\"
		end
	end


	 return e;
end

t.EnterScene = function(sysarg,idx) return t.EnterSceneEx(sysarg,idx,t.data); end
t.EnterScene2 = function(sysarg,idx) return t.EnterSceneEx(sysarg,idx,t.data2); end
t.EnterScene3 = function(sysarg,idx) return t.EnterSceneEx(sysarg,idx,t.data3); end

t.EnterSceneEx = function(sysarg,idx,table)
	if not idx then return; end
	if not table then return; end
	idx = tonumber(idx);
	local d = table;
	if not d[idx] then return; end
	local mycircle = Actor.getIntProperty(sysarg, PROP_ACTOR_CIRCLE);
	local zlv = d[idx].zlv;
	local mapid = d[idx].mapid;
	local zmid = d[idx].zmid;
	local dev = d[idx].dev;
	if Actor.getItemCount(sysarg, zmid) < dev then
        Actor.sendTipmsg(sysarg, string.format("您的 <%s> 不足 <%s> ,进入失败..", Item.getItemName(zmid), dev), 256);
        return;
    end
	local b = 0;
	for k = 1,#zlv do
		if mycircle == zlv[k] then b = 1; break; end
	end
	if b == 0 then
        Actor.sendTipmsg(sysarg, "您的转生等级不对哟,进入失败.", 256);
        return;
	end
	Actor.removeItem(sysarg, zmid, dev, -1,-1,-1);
	Actor.enterScene(sysarg, mapid, -1, -1);
	System.broadcastTipmsg(string.format("<(n%s)>进入了<%s>.",Actor.getName(sysarg), Fuben.getSceneNameById(mapid) ),ttChatWindow)
end


function GetNpcZhuanShengDiGong() return t end