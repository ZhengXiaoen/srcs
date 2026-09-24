--修罗地宫二层
{
	scenceid = 42,
	scencename = Lang.SceneName.s00042,
	mapfilename = "42XiuLuoDiGong2Ceng",
	minlevel = 1,
	zlevel = 4,	--转生等级限制
	needCircle = 4,--转生等级，限制玩家非法传送
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
	sceneWidth = 212,
	sceneHeight = 216,
	posx = 124,
	posy = 121,

	area =
	{
		{	name = Lang.SceneName.s00042, range = { 10,10,20,20,60,50}, center = { 100,109 },
		attri = {{type=18,value = {}},
                         --{type=20,value = {}},--禁止穿人
		         {type=19,value = {}},	--默认配置场景
                         {type=23,value = {1,2,3,4} }, --禁止使用行会拉传"，参数：【召唤1，行会集结令2，行会回城卷3】
			 {type=34,value = {515}},--限制使用物品:行会召集令
                         {type=30,value = {1,2,3,4} },--禁止被行会拉传
			 {type=24,value = {} }, --禁止使用夫妻传送
			 -- {type=6,value = {}},--如果玩家在这个区域挂掉或重新上线，会转移到之前的非重配地图区域，无参数
			  {type=97,value = {}}, --黑暗区域   
			 {type=25,value = {}},}}, --禁止使用师徒传送     
			                                                                                  

	},

--refresh项用来配置这个场景的刷怪点，每个场景可以有多个刷怪点，可以用include包含多个刷怪点
	refresh =
	{
--#include "refresh42.lua"
	},

--这里配置这个场景出现的NPC，如果有多个NPC，这配置多行，每一项（行）表示一个NPC
	npc =
	{
		--funcId NPC的功能的ID,1 帮派 2 仓库 3 传送 4 装备  5 武器 6 修理 7 药店  8 副本  9 杂货，默认是0可以不配置

	},

  teleport =
  {
		--传送点设置
		{ posx = 39, posy = 181,toSceneid = 41,toPosx = 154, toPosy = 44,modelid = 62700,name = Lang.SceneName.s00041, randompos =1,},  --2层→1层
		{ posx = 140, posy = 43,toSceneid = 43,toPosx = 70, toPosy = 126,modelid = 62700,name = Lang.SceneName.s00043, randompos =1,},  --2层→3层

  },

},