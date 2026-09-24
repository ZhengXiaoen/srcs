--青青草原
{
	scenceid = 341,
	scencename = Lang.SceneName.s00341,
	mapfilename = "48LvZuFeng4Ceng",
	minlevel = 1,
	forbiddenitem = {1,2},	--限制物品，这是一个数字列表，代表有这些物品的玩家不能进入
	--forbiddenpet = {5,3},	--限制的坐骑（宠物），不能带这些坐骑（宠物）入内，这也是个数字列表
	forbiddenskill = {100,20},	--限制的技能列表，有这些技能的玩家不能进入
	nopk = 0,	--0表示可以pk，1表示不可以，默认是0
	progress = 0,
	--在世界地图上的坐标x
	--music = "2.mp3",
	worldmapPosx = 0,
	worldmapPosy = 0,
	--场景的长宽,是指格子数的长宽
	sceneWidth = 128,
	sceneHeight = 120,


	area =
	{
		{ name = Lang.SceneName.s00341, range = { 10,10,20,20,60,50}, center = { 40,96 },
		attri = {{type=18,value = {}},
		         {type=19,value = {}},	--默认配置场景


			 }},

	},

--refresh项用来配置这个场景的刷怪点，每个场景可以有多个刷怪点，可以用include包含多个刷怪点
	refresh =
	{
--#include "refresh341.lua"
	},

--这里配置这个场景出现的NPC，如果有多个NPC，这配置多行，每一项（行）表示一个NPC
	npc =
	{

	},

  teleport =
  {


  },

},
