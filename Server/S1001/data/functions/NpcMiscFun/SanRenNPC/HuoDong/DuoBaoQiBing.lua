----#include "data\functions\Systems\ActivitySystem\DuoBaoQiBing.lua" once

local t = {}
t.main = function(sysarg)
	--//主显示内容
    --local nHour,nMinute,nSecond = System.getTime();
    --local strRewardicon = string.format("<(%s)> <(%s)> <(%s)>","iaward#24#1","iaward#6#1","iaward#2#1")
	local echo = [[

<(c0xFF00c0ff)夺宝奇兵参与条件：><(idecoLine#350)>

  <(c0xFFb6946c)进入等级:> <(c0xFF00FF00)等级大于><(c0xFF00FF00)80><(c0xFF00FF00)级>
  <(c0xFFb6946c)进入时间:> <(c0xFF00FF00)21:05 - 21:20>

<(c0xFF00c0ff)夺宝奇兵介绍：><(idecoLine#350)>

  <(c0xFFb6946c)1. 活动开始后刷新窃宝贼1只,死亡掉落>]]..Item.getItemLinkMsg(304)..[[<(c0xFFb6946c).>
  <(c0xFFb6946c)2. 拾取宝箱的玩家将获得><(c0xFF00FF00)持宝人><(c0xFFb6946c)称号,获得称号后每><(c0xFF00FF00)5秒><(c0xFFb6946c)获   得><(c0xFF00FF00)10元宝><(c0xFFb6946c).(活动地图内PK不红名)>
  <(c0xFFb6946c)3. 活动结束前><(c0xFF00FF00)5分钟><(c0xFFb6946c),持宝人即可开启宝藏箱获><(c0xFF00FF00)宝藏奖励><(c0xFFb6946c).>
  <(c0xFFb6946c)4. 持宝人死亡或下线或离开活动地图,宝藏箱会掉在地上.>
  <(c0xFFb6946c)5. 活动期间死亡可通过活动NPC反复进入此活动地图.>

                  <#BN进入夺宝奇兵/@duobaoqibing>



]]
	 return echo;
end





--  <(c0xFF00c0ff)活动描述><(idecoLine#350)>
--     <(c0xFFb6946c)1. 地图中有大量BOSS,掉落装备无归属手快者得>
--     <(c0xFFb6946c)2. 击败BOSS掉落大量高阶装备>
--     <(c0xFFb6946c)3. 死亡后，角色将会被传到土城安全区；选择原地复活>
--        <(c0xFFb6946c)可在活动地图中复活>
--     <(c0xFFb6946c)4. 活动期间内进入活动地图次数不限>
--     <(c0xFFb6946c)5. 活动活动地图PK不红名>

--  <(c0xFF00c0ff)参与条件><(idecoLine#350)>
--     <(ifragments#16#18)><(c0xFFb6946c)特殊限制: ><(c0xFF00FF00)等级达到80级>
--     <(ifragments#16#18)><(c0xFFb6946c)活动时间: >]].."<(c0xFF00FF00)".."21:30-22:30"..[[>
--     <(ifragments#16#18)><(c0xFFb6946c)活动奖励: >]]..strRewardicon..[[
-- <#BN参加活动/@duobaoqibing>

 t.duobaoqibing = function (sysarg)
 	enter_duobaoqibing(sysarg)
 end

function GetNpcSanDuoBaoQiBing() return t end