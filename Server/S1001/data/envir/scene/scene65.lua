--极北之地八层
{
	scenceid = 65,
	scencename = Lang.SceneName.s00065,
	mapfilename = "65JiBeiZhiDi8Ceng",
	minlevel = 1,
	zlevel = 9,	--转生等级限制
	needCircle = 9,--转生等级，限制玩家非法传送
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
	sceneHeight = 128,
--	sceneType=2,
--	posx = 48,
--	posy = 110,

	area =
	{
		{ name = Lang.SceneName.s00065, range = { 10,10,20,20,60,50}, center = { 68,66},
		attri = {
                        {type=3,value = {}},  --战斗专门区域，打死人不用负责任
                        {type=20,value = {}}, --禁止穿人
                        -- {type=21,value = {}}, --禁止穿怪
                        {type=19,value = {}}, --穿怪
                        --{type=6,value = {}},  --重配地图",如果玩家在这个区域挂掉或重新上线，会转移到之前的非重配地图区域，无参数
                        --{type=44,value = {}},  --禁止原地复活
                        {type=34,value = {515,682}},--限制使用物品:行会召集令，复活石，随机传送石
                        {type=23,value = {1,2,3,4} },--禁止使用行会拉传
                        {type=30,value = {1,2,3,4} },--禁止被行会拉传
                        --{type=80,value = {}},  --所在场景不爆装备
                        --{type=45,value = {}},}}, --限制坐骑

			 }},	

	},

--refresh项用来配置这个场景的刷怪点，每个场景可以有多个刷怪点，可以用include包含多个刷怪点
	refresh =
	{
--#include "refresh65.lua"
	},

--这里配置这个场景出现的NPC，如果有多个NPC，这配置多行，每一项（行）表示一个NPC
	npc =
	{
		--funcId NPC的功能的ID,1 帮派 2 仓库 3 传送 4 装备  5 武器 6 修理 7 药店  8 副本  9 杂货，默认是0可以不配置

        --{id = 47, posx = 53, posy = 30}, --烈焰大使
	},

  teleport =
  {
		--传送点设置
		--{ posx = 41, posy = 115,toSceneid = 16,toPosx = 115, toPosy = 58,modelid = 50000,name = Lang.SceneName.s00016 },  --猪洞四层→猪洞三层
		  { posx = 82, posy = 82,toSceneid = 59,toPosx = 35, toPosy = 61,modelid = 62700,name = Lang.SceneName.s00059, randompos =1,},  --8层→7层
  },

},