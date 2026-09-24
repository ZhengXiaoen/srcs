--修罗地宫三层
{
	scenceid = 43,
	scencename = Lang.SceneName.s00043,
	mapfilename = "43XiuLuoDiGong3Ceng",
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
	sceneWidth = 168,
	sceneHeight = 160,
	posx = 17,
	posy = 85,

	area =
	{
		{ name = Lang.SceneName.s00043, range = { 10,10,20,20,60,50}, center = { 91,72},
		attri = {{type=18,value = {}},
                         --{type=20,value = {}},--禁止穿人
		         {type=19,value = {}},	--默认配置场景
			 {type=34,value = {515}},--限制使用物品:行会召集令
                         {type=23,value = {1,2,3,4} },--禁止使用行会拉传
                         {type=30,value = {1,2,3,4} },--禁止被行会拉传
			 {type=24,value = {} }, --禁止使用夫妻传送
			 -- {type=6,value = {}},--如果玩家在这个区域挂掉或重新上线，会转移到之前的非重配地图区域，无参数
			 {type=97,value = {}}, --黑暗区域
			 {type=25,value = {}},}}, --禁止使用师徒传送
			 

	},

--refresh项用来配置这个场景的刷怪点，每个场景可以有多个刷怪点，可以用include包含多个刷怪点
	refresh =
	{
--#include "refresh43.lua"
	},

--这里配置这个场景出现的NPC，如果有多个NPC，这配置多行，每一项（行）表示一个NPC
	npc =
	{
   
	},

  teleport =
  {
		--传送点设置
		{ posx = 72, posy = 128,toSceneid = 42,toPosx = 138, toPosy = 45,modelid = 62700,name = Lang.SceneName.s00042, randompos =1,},  --3层→2层
		-- { posx = 96, posy = 27,toSceneid = 44,toPosx = 37, toPosy = 97,modelid = 62700,name = Lang.SceneName.s00044 },  --3层→4层


  },

},