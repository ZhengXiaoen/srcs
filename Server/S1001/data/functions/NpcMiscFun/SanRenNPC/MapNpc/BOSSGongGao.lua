--BOSS公告 2017/03/21 废弃

NpcDialog[381] = {};

NpcDialog[381].main = function(sysarg)
				-- local svar = System.getDyanmicVar(sysarg);
				-- local s = svar.srRefreshMonster;
				-- for i = 1,81 do
				-- 	s[i] = 0
				-- end
	local echo = [[

  <(c0xFFeabc78)点击以下地图查看对应BOSS刷新信息:>

<(idecoLine#315)>

  ]]..string.format("<查看散人殿堂/@onCkBoss,10,16|%s>",NpcDialog[381].onCkBoss1(10,16))..[[
  
  ]]..string.format("<查看BOSS之家/@onCkBoss,17,39|%s>",NpcDialog[381].onCkBoss1(17,39))..[[
  
  ]]..string.format("<查看军团镇狱/@onCkBoss,40,45|%s>",NpcDialog[381].onCkBoss1(40,45))..[[
  
  
  ]]..string.format("<查看野外1转地图/@onCkBoss,46,48|%s>",NpcDialog[381].onCkBoss1(46,48))..[[
  
  ]]..string.format("<查看野外2转地图/@onCkBoss,49,52|%s>",NpcDialog[381].onCkBoss1(49,52))..[[
  
  ]]..string.format("<查看野外3转地图/@onCkBoss,53,55|%s>",NpcDialog[381].onCkBoss1(53,55))..[[
  
  ]]..string.format("<查看野外4转地图/@onCkBoss,56,59|%s>",NpcDialog[381].onCkBoss1(56,59))..[[
  
  ]]..string.format("<查看野外5转地图/@onCkBoss,60,63|%s>",NpcDialog[381].onCkBoss1(60,63))..[[
  
  ]]..string.format("<查看野外6转地图/@onCkBoss,64,67|%s>",NpcDialog[381].onCkBoss1(64,67))..[[
  
  ]]..string.format("<查看野外7转地图/@onCkBoss,68,70|%s>",NpcDialog[381].onCkBoss1(68,70))..[[
  
  ]]..string.format("<查看野外9转地图/@onCkBoss,71,72|%s>",NpcDialog[381].onCkBoss1(71,72))..[[
  
  ]]..string.format("<查看野外11转地图/@onCkBoss,73,75|%s>",NpcDialog[381].onCkBoss1(73,75))..[[

  ]]..string.format("<混沌地界1层/@onCkBoss,112,113|%s>",NpcDialog[381].onCkBoss1(112,113))..[[

  ]]..string.format("<混沌地界2层/@onCkBoss,114,116|%s>",NpcDialog[381].onCkBoss1(114,116))..[[
	  
  ]]..string.format("<混沌地界3层/@onCkBoss,117,119|%s>",NpcDialog[381].onCkBoss1(117,119))..[[
  
  
  ]]..string.format("<查看野外全民BOSS/@onCkBoss,76,81|%s>",NpcDialog[381].onCkBoss1(76,81))..[[

]]
	return echo;
end

NpcDialog[381].onCkBoss = function(sysarg,a,b)
	a = tonumber(a);
	b = tonumber(b);
	local e = "\\\\";
	for i = 1,#RefreshMonsterData do
		local d = RefreshMonsterData[i];
		for k = a,b do
			if d.bj == k then
				local MonsterName = System.getMonsterNameById(d.monid);
				local SceneName = Fuben.getSceneNameById(d.mapid);
				local MonsterZt = "";
				local svar = System.getDyanmicVar(sysarg);
				local s = svar.srRefreshMonster;
				if s == nil then svar.srRefreshMonster = {}; s = svar.srRefreshMonster; end
				if s[k] == 1 then
					MonsterZt = "<(c0xFF00FF00)已刷新>";
				else
					local remaining = svar.srrmRemaining or {}
					local syt = remaining[k] or 0
					MonsterZt = "<"..syt.."分钟后刷新>";
				end
				--<(c0xFF888888)(刷新时间为%s分钟)>  d.rsftime
				e = e .. string.format("<(c0xFFFFFF00)%s>在<(c0xFFFFFF00)%s(%s,%s)>,状态:%s\\", MonsterName, SceneName, d.x, d.y, MonsterZt);
			end
		end
	end
	Actor.sendTipmsg(sysarg, e, 4);
end

NpcDialog[381].onCkBoss1 = function(a,b)
	a = tonumber(a);
	b = tonumber(b);
	local e = "#";
	print("a.."..a)
	print("b.."..b)
	for i = 1,#RefreshMonsterData do
		local d = RefreshMonsterData[i];
		for k = a,b do
			if d.bj == k then
				local MonsterName = System.getMonsterNameById(d.monid);
				local SceneName = Fuben.getSceneNameById(d.mapid);
				local MonsterZt = "";
				local svar = System.getDyanmicVar(sysarg);
				local s = svar.srRefreshMonster;
				if s == nil then svar.srRefreshMonster = {}; s = svar.srRefreshMonster; end
				if s[k] == 1 then
					MonsterZt = "&00FF00&已刷新";
				else
					local remaining = svar.srrmRemaining or {}
					local syt = remaining[k] or 0
					MonsterZt = ""..syt.."分钟后刷新";
				end
				--<(c0xFF888888)(刷新时间为%s分钟)>  d.rsftime
				e = e .. string.format("&ffff00&%s&eabc78&在&ffff00&%s(%s,%s),&eabc78&状态:%s##", MonsterName,SceneName,d.x,d.y,MonsterZt);
			end
		end
	end
	return e
end


function GetNpcBOSSGongGao() return NpcDialog[381] end

