--暗黑禁地
{
	scenceid = 264,
	scencename = Lang.SceneName.s00264,
	mapfilename = "08YuanGuManHuang",
	minlevel = 60,
	forbiddenitem = {1,2},	--限制物品，这是一个数字列表，代表有这些物品的玩家不能进入
	--forbiddenpet = {5,3},	--限制的坐骑（宠物），不能带这些坐骑（宠物）入内，这也是个数字列表
	forbiddenskill = {100,20},	--限制的技能列表，有这些技能的玩家不能进入
	nopk = 0,	--0表示可以pk，1表示不可以，默认是0
	progress = 0,
	--在世界地图上的坐标x
	--music = "2.mp3",
	--musicInterval=60,
	worldmapPosx = 0,
	worldmapPosy = 0,
    --场景的长宽,是指格子数的长宽
	sceneWidth = 208,
	sceneHeight = 184,
	posx = 212,
	posy = 195,
	area =
	{
		{ name = Lang.SceneName.s00264, range = { 10,10,20,20,60,50}, center = { 68,92},
		attri = {
				{type=18,value = {}}, --穿人
			 {type=19,value = {}},  --穿怪
			 {type=97,value = {}}, --黑暗区域
			 {type=6,value = {}},--如果玩家在这个区域挂掉或重新上线，会转移到之前的非重配地图区域，无参数
					 			}
		},

		
	},

--refresh项用来配置这个场景的刷怪点，每个场景可以有多个刷怪点，可以用include包含多个刷怪点
	refresh =
	{
--#include "refresh264.lua"
	},

--这里配置这个场景出现的NPC，如果有多个NPC，这配置多行，每一项（行）表示一个NPC
	npc =
	{
		--funcId NPC的功能的ID,1 帮派 2 仓库 3 传送 4 装备  5 武器 6 修理 7 药店  8 副本  9 杂货  10 书店，默认是0可以不配置
		-- {id = 107, posx = 46 , posy = 32},
		{id = 373, posx = 176, posy = 22},--传送员
		-- {id = 108, posx = 98 , posy = 36},
		-- {id = 109, posx = 103 , posy = 73},
		-- {id = 107, posx = 55 , posy = 112},
		-- {id = 108, posx = 102 , posy = 131},
		-- {id = 109, posx = 167 , posy = 99},

	},

  teleport =
  {
		--传送点设置
		-- { posx = 176, posy = 22,toSceneid =  28,toPosx =  38, toPosy =  161,modelid = 62700,name = Lang.SceneName.s00028 },  --蛮荒1层→2层
		--{ posx = 176, posy = 20,toSceneid =  22,toPosx =  39, toPosy =  162,modelid = 62700,name = Lang.SceneName.s00022 },  --1层→2层
		{ posx =  112, posy = 39,toSceneid =  265,toPosx = 161, toPosy =  131,modelid = 62700,name = Lang.SceneName.s00265 },  --到暗黑沙漠


  },

landscape=
 {
--posx1,posy1 表示左上角坐标,posx1,posy2 表示右下角坐标,xInterval表示横向间隔多远一个点，yInterval表示纵向多远打一个点
		--{posx1=162,posy1=161,posx2=183,posy2=179,modelid=3,xinterval=2,yinterval=2},  --安全区的路灯
 },

},