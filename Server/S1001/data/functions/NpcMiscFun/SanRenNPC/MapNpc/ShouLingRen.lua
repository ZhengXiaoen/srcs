--守陵人

local t = {}

t.main = function(sysarg)
	local sID = Actor.getSceneId(sysarg)
	local str="返回土城"
	local echo=""

	local mapid = Actor.getSceneId(sysarg);
	local SceneHandle = Fuben.getSceneHandleById(mapid);
	local monnum = Fuben.getLiveMonsterCount(SceneHandle, 0);

	if sID~=268 then 
		str="进入下一层"
		echo = [[

  <(c0xFFb6946c)本层怪物刷新时间为10分钟,清理完之后才可进入下一层.> 

<(idecoLine#315)>

  <(c0xFFb6946c)因为皇陵毒气的原因,所以你要备好回血的药品..>

  <(c0xFFb6946c)第><2><(c0xFFb6946c)层开始进入后每5秒减少><2888><(c0xFFb6946c)点生命值.>
  <(c0xFFb6946c)第><3><(c0xFFb6946c)层有皇陵帝魂的存在,所以会每5秒减少><5888><(c0xFFb6946c)点生命值.> 


  <(c0xFFb6946c)当前地图还剩><]]..monnum..[[><(c0xFFb6946c)只怪.>

<(idecoLine#315)>

  <(c0xFF888888)*第3层BOSS刷新时间为60分钟2只,死亡必掉技能书.>
	]];
	end

	echo=echo.."\\		   	<#BN"..str.."/@chuansong>"
	return echo;
end

t.chuansong=function(sysarg)
	local sID = Actor.getSceneId(sysarg)
	local nHandle = Fuben.getSceneHandleById(sID, 0)
	if Fuben.getLiveMonsterCount(nHandle) == 0 or sID == 268 then  
		if sID == 268 then 
			Actor.enterScene(sysarg,83,-1,-1)
		else
			Actor.enterScene(sysarg,sID+1,-1,-1)
		end
	else 
		Actor.sendTipmsg(sysarg,"需要清空本层怪物才能传送", ttFlyTip) 
	end
end

function GetNpcShouLingRen() return t end