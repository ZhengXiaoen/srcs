--#include "data\functions\Systems\ActivitySystem\JuntuanZhan.lua" once

local t = {}
t.main = function(sysarg)
	--//主显示内容
	local echo = [[

  <(c0xFF00c0ff)军团阵营战介绍：><(idecoLine#350)>

      <(c0xFFb6946c)1. 个人积分：击败其他军团玩家可获得积分；>
      <(c0xFFb6946c)2. 军团积分：本军团成员获得的积分总和；>
      <(c0xFFb6946c)3. 该地图PK不增加PK值；>

  <(c0xFF00c0ff)军团阵营战参与条件：><(idecoLine#330)>
      <(ifragments#16#18)><(c0xFFb6946c)等级限制: ><(c0xFFeabc78)加入><(c0xFF00FF00)军团><(c0xFFeabc78),并且等级达到><(c0xFF00FF00)80级>
      <(ifragments#16#18)><(c0xFFb6946c)进入时间: ><(c0xFF00FF00)19:00 - 19:20> <(c0xFFb6946c)(结束时间为><(c0xFF00FF00)19:20><(c0xFFb6946c))>
      <(ifragments#16#18)><(c0xFFb6946c)入口关闭时间: ><(c0xFF00FF00)19:10>

  <(c0xFF00c0ff)军团阵营战奖励：><(idecoLine#330)>
      <(c0xFFb6946c)1. 个人积分排名越高奖励越好> <领取个人奖励/@GetPersonalAward>
      <(c0xFFb6946c)2. 参与活动且获胜军团将获更多奖励> <领取军团奖励/@GetLegionaryAward>




<#BN参加军团战/@EnterActivity>
]]
	 return echo;
end

t.EnterActivity = function (sysarg)
	enter_juntuanzhan(sysarg)
end

t.GetPersonalAward = function (sysarg)
	get_juntuanzhan_award(sysarg)
end

t.GetLegionaryAward = function (sysarg)
	get_juntuanzhan_juntuan_award(sysarg)
end





function GetNpcJunTuanZhan() return t end