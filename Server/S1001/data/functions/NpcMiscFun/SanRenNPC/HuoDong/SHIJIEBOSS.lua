local t = {}--
t.main = function(sysarg)
	--//主显示内容
     local strRewardicon = string.format("<(%s)> <(%s)> <(%s)> <(%s)>","iaward#1000#1#1#114","iaward#1000#1#1#123","iaward#1000#1#1#132","iaward#1000#1#1#5171")
	local echo = [[

 <(c0xFF00c0ff)世界BOSS简单描述:><(idecoLine#350)>
      <(c0xFFb6946c)1.活动限时 ><(c0xFF00FF00)10分钟>

      <(c0xFFb6946c)2.击败世界boss有几率掉落><(c0xFF00FF00)转生装备>

      <(c0xFFb6946c)3.世界boss所掉装备><(c0xFF00FF00)无归属><(c0xFFb6946c)，先抢先得！>

      <(c0xFFb6946c)4.最后一刀击杀世界boss，可获得><补刀王><(c0xFFb6946c)称号>
      
      <(c0xFFb6946c)5.荣登伤害排名者,在活动结束后将获得神秘奖励.>

 <(c0xFF00c0ff)世界BOSS参与条件:><(idecoLine#350)>
      <(ifragments#16#18)><(c0xFFb6946c)等级限制: ><(c0xFF00FF00)80级>

      <(ifragments#16#18)><(c0xFFb6946c)活动时间: ><(c0xFF00FF00)19:25 - 19:35> 

  <#BN进入活动/@enter>




]]
	return echo;
end

t.enter = function(sysarg)
    local sVar = System.getStaticVar()
    if sVar.worldbossing == nil or sVar.worldbossing == false then
		Actor.sendTipmsg(sysarg, "活动未开启", ttFlyTip)
        return 
    end
	
	local plv = Actor.getIntProperty(sysarg, PROP_CREATURE_LEVEL)
	if plv < 80 then
		Actor.sendTipmsg(sysarg, "等级不足80级，无法参加", ttFlyTip)
		return;
	end
	
    Actor.telportSceneRandPos(sysarg,Fuben.getSceneNameById(119))
end



function GetNpcSHIJIEBOSS() return t end