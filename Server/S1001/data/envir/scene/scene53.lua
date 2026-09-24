--炽焰山一层
{
	scenceid = 53,
	scencename = Lang.SceneName.s00053,
	mapfilename = "53ChiYanShan1Ceng",
	minlevel = 110,	--等级限制
	zlevel = 7,	--转生等级限制
	needCircle = 7,--转生等级，限制玩家非法传送
	--forbiddenitem = {1,2},	--限制物品，这是一个数字列表，代表有这些物品的玩家不能进入
	--forbiddenpet = {5,3},	--限制的坐骑（宠物），不能带这些坐骑（宠物）入内，这也是个数字列表
	--forbiddenskill = {100,20},	--限制的技能列表，有这些技能的玩家不能进入
	nopk = 0,	--0表示可以pk，1表示不可以，默认是0
	progress = 0,
	--在世界地图上的坐标x
	--music = "2.mp3",
	--musicInterval=60,
	worldmapPosx = 0,
	worldmapPosy = 0,
	--场景的长宽,是指格子数的长宽
	sceneWidth = 136,
	sceneHeight = 128,
	posx = 12,
	posy = 24,

	area =
	{
		{ name = Lang.SceneName.s00053, range = { 10,10,20,20,60,50}, center = { 39,27},
		attri = {{type=18,value = {}},
                         --{type=20,value = {}},--禁止穿人
		         {type=19,value = {}},	--默认配置场景
                         {type=23,value = {1,2,3,4} }, --禁止使用行会拉传"，参数：【召唤1，行会集结令2，行会回城卷3】
			 {type=24,value = {} }, --禁止使用夫妻传送
			 {type=25,value = {}},}}, --禁止使用师徒传送

	},

--refresh项用来配置这个场景的刷怪点，每个场景可以有多个刷怪点，可以用include包含多个刷怪点
	refresh =
	{
--#include "refresh53.lua"
	},

--这里配置这个场景出现的NPC，如果有多个NPC，这配置多行，每一项（行）表示一个NPC
	npc =
	{
		--funcId NPC的功能的ID,1 帮派 2 仓库 3 传送 4 装备  5 武器 6 修理 7 药店  8 副本  9 杂货，默认是0可以不配置
		--{id = 54, posx = 197 , posy = 125},--清扬道长
		--{id = 55, posx = 163 , posy = 44},--明月仙子
		--{id = 56, posx = 58 , posy = 178},--方云居士

	},

  teleport =
  {
		--传送点设置
		{ posx = 34, posy = 17,toSceneid = 54,toPosx = 50, toPosy = 42,modelid = 62700,name = Lang.SceneName.s00054, randompos =1,},  --1层→2层
		{ posx = 37, posy = 98,toSceneid = 83,toPosx = 161, toPosy =  132,modelid = 62700,name = Lang.SceneName.s00083 },  --1层→王城

  },

},