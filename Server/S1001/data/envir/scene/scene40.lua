--妖族幻境三层
{
	scenceid = 40,
	scencename = Lang.SceneName.s00040,
	mapfilename = "40YaoZuHuanJing3Ceng",
	minlevel = 1,
	zlevel=3,
	needCircle = 3,--转生等级，限制玩家非法传送
	--forbiddenitem = {1,2},	--限制物品，这是一个数字列表，代表有这些物品的玩家不能进入
	--forbiddenpet = {5,3},	--限制的坐骑（宠物），不能带这些坐骑（宠物）入内，这也是个数字列表
	--forbiddenskill = {100,20},	--限制的技能列表，有这些技能的玩家不能进入
	nopk = 0,	--0表示可以pk，1表示不可以，默认是0
	progress = 0,
	--在世界地图上的坐标x
        --music = "2.mp3",
	worldmapPosx = 0,
	worldmapPosy = 0,
	--场景的长宽,是指格子数的长宽
	sceneWidth = 208,
	sceneHeight = 208,


	area =
	{
		{ name = Lang.SceneName.s00040, range = { 10,10,20,20,60,50}, center = { 87,128 },
		attri = {{type=18,value = {}},
                         --{type=20,value = {}},--禁止穿人
		         -- {type=6,value = {}},--如果玩家在这个区域挂掉或重新上线，会转移到之前的非重配地图区域，无参数
		         {type=19,value = {}},	--默认配置场景
			 {type=24,value = {} }, --禁止使用夫妻传送
			 {type=34,value = {515}},--限制使用物品:行会召集令
                         {type=23,value = {1,2,3,4} },--禁止使用行会拉传
                         {type=30,value = {1,2,3,4} },--禁止被行会拉传
			 {type=25,value = {}},}}, --禁止使用师徒传送
			


	},

--refresh项用来配置这个场景的刷怪点，每个场景可以有多个刷怪点，可以用include包含多个刷怪点
	refresh =
	{
--#include "refresh40.lua"
	},

--这里配置这个场景出现的NPC，如果有多个NPC，这配置多行，每一项（行）表示一个NPC
	npc =
	{

	},

  teleport =
  {
		--传送点设置
		{ posx =  96, posy = 138,toSceneid = 39,toPosx = 42, toPosy = 50,modelid = 62700,name = Lang.SceneName.s00039, randompos =1,},  --3层一→2层
		---{ posx =  206, posy = 168,toSceneid = 41,toPosx = 40, toPosy = 69,modelid = 62700,name = Lang.SceneName.s00041 },  --3层一→4层

  },

},