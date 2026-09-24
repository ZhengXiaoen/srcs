--local t = {}--
NpcDialog[387] = {}
NpcDialog[387].main = function(sysarg)
	--//主显示内容
	local echo = [[
  <(c0xFFb6946c)夺宝奇兵 狭路相逢勇者胜>

<(idecoLine#315)>
  <(c0xFFb6946c)活动参与条件:> <(c0xFF888888)等级大于><(c0xFF00FF00)80><(c0xFF888888)级>
  
  <(c0xFFb6946c)活动时间范围:> <(c0xFF00FF00)21:15 - 21:30>
<(idecoLine#315)>

  <(c0xFF888888)1. 活动开始后刷新窃宝贼1只,死亡掉落>]]..Item.getItemLinkMsg(304)..[[<(c0xFF888888).>

  <(c0xFF888888)2. 拾取宝箱的玩家将获得><(c0xFF00c0ff)持宝人><(c0xFF888888)称号,获得称号后每><(c0xFF00c0ff)5秒><(c0xFF888888)获得><(c0xFF00c0ff)10元宝><(c0xFF888888).(活动地图内PK不红名)>

  <(c0xFF888888)3. 持宝人死亡或下线或离开活动地图,宝藏箱会掉在地上.>

  <(c0xFF888888)4. 活动结束前><(c0xFF00c0ff)5分钟><(c0xFF888888),持宝人即可开启宝藏箱获><(c0xFF00c0ff)宝藏奖励><(c0xFF888888).>

  <(c0xFF888888)5. 活动期间死亡可通过活动NPC反复进入此活动地图.>
  <(idecoLine#315)>
                      <离开活动/@enterScene>


]]
	return echo;
end
NpcDialog[387].enterScene = function(sysarg)
	Actor.enterScene(sysarg,83,164,138)
end


--function GetNpcDuoBaoChuanSong() return t end