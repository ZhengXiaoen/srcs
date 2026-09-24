--远古羊窟
{
	scenceid = 5,
	scencename = Lang.SceneName.s00005,
	mapfilename = "05YuanGuYangKu",
	minlevel = 30,
	forbiddenitem = {1,2},	--限制物品，这是一个数字列表，代表有这些物品的玩家不能进入
	--forbiddenpet = {5,3},	--限制的坐骑（宠物），不能带这些坐骑（宠物）入内，这也是个数字列表
	forbiddenskill = {100,20},	--限制的技能列表，有这些技能的玩家不能进入
	nopk = 0,	--0表示可以pk，1表示不可以，默认是0
	progress = 0,
	--在世界地图上的坐标x
	--music = "9.mp3",
	--musicInterval=60,
	worldmapPosx = 0,
	worldmapPosy = 0,
	--场景的长宽,是指格子数的长宽
	sceneWidth = 128,
	sceneHeight = 136,
--	sceneType=2,
--	posx = 48,
--	posy = 110,

	area =
	{
		{ 
		name = Lang.SceneName.s00005, range = { 10,10,20,20,60,50}, center = { 37,32},
		attri = {
			{type=18,value = {}}, --穿人
			{type=19,value = {}},  --穿怪
			{type=97,value = {}}, --黑暗区域
		}
		},
	},

--refresh项用来配置这个场景的刷怪点，每个场景可以有多个刷怪点，可以用include包含多个刷怪点
	refresh =
	{
--#include "refresh5.lua"
	},

--这里配置这个场景出现的NPC，如果有多个NPC，这配置多行，每一项（行）表示一个NPC
	npc =
	{
		--funcId NPC的功能的ID,1 帮派 2 仓库 3 传送 4 装备  5 武器 6 修理 7 药店  8 副本  9 杂货，默认是0可以不配置

        --{id = 47, posx = 53, posy = 30}, --烈焰大使
		  -- {id = 346, posx = 53, posy = 48},--BOSS挑战
		  -- {id = 347, posx = 81, posy = 63},--BOSS挑战
		  -- {id = 348, posx = 68, posy = 94},--BOSS挑战


	},

  teleport =
  {
		--传送点设置
		{ posx = 46, posy = 108,toSceneid = 166,toPosx = 42, toPosy = 44,modelid = 62700,name = Lang.SceneName.s00166 },  --猪洞四层→猪洞三层

  },

},