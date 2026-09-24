--#include "data\functions\Systems\ActivitySystem\jumozhichaoHandle.lua" once
-- local t = {}
NpcDialog[393] = {}
NpcDialog[393].main = function(sysarg)
	--//主显示内容
	local echo = ""
	echo = [[


  <(c0xFFeabc78)玛雅神殿一共有3层,每次进入所需1张玛雅神殿证明>
  <(c0xFFeabc78)散人殿堂10阶BOSS掉落 也可直接><购买玛雅神殿证明/@buyzm|散人殿堂10阶BOSS可掉落#也可直接进行购买>

<(idecoLine#330)>
<(c0xFF00c0ff)友情提示：>
  <右上角><(c0xFF00FF00)挑战BOSS><面板的><(c0xFF00FF00)野外BOSS><可查看全服BOSS掉落信息.>
  <#BN进入地图/@enterScene>
]];
	local smbl = {90,91,92,93,94,95,99,100,101,102,103,104,108,109,110,111,112,113};
	for j = 1,#smbl do
		
		if j == 6 or  j == 12 or j == 18 then
			echo = echo .. NpcDialog[393].ipk(smbl[j]) .. "\\";
		else
			echo = echo .. NpcDialog[393].ipk(smbl[j]) .. " ";
		end
	end



  

	 return echo;
end

NpcDialog[393].buyzm = function(sysarg)
	Actor.openDialogs(sysarg,diBuyAnItem,5475);
end

NpcDialog[393].ipk = function(id)
    if not id then id = 1; end
    return string.format("<(iitem#%s#1)>",id);
end


NpcDialog[393].enterScene = function(sysarg)
	local needItem = 5475
	local enterSceneId = 424
	local enterLevel =80
	
	--判断数量
	local itemCount = Actor.getItemCount(sysarg,needItem)
	if itemCount < 1 then
		Actor.sendTipmsg(sysarg, "没有"..Item.getItemName(5475)..",进入失败", 256);
		return 
	end
	--判断等级
	local nActorLevel = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	if nActorLevel<enterLevel then 
		Actor.sendTipmsg(sysarg, "等级不足"..enterLevel.."级,进入失败", 256);
		return 
	end
	
	--扣除物品
	Actor.removeItem(sysarg,needItem,1)
	
	--进入scene
	local mapName = Fuben.getSceneNameById(enterSceneId)
	Actor.telportSceneRandPos(sysarg,mapName)
	
	--记录
	System.sendCommonLog(LogIds.jinrumayafuben,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,"进入玛雅神殿")
end