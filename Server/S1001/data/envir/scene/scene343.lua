--矿洞
{
	scenceid = 343,
	scencename = Lang.SceneName.s00343,
	mapfilename = "148WaKuang3",
	minlevel = 80,
	forbiddenitem = {1,2},	--限制物品，这是一个数字列表，代表有这些物品的玩家不能进入
	nopk = 0,
	progress = 0,
	worldmapPosx = 0,
	worldmapPosy = 0,
	sceneWidth = 92,
	sceneHeight = 104,
	area =
	{
		{ name = Lang.SceneName.s00343, range = { 0,0,200,0,200,200,0,200}, center = { 27,73},
		attri = {
						{type=1, value = {}},--世界安全区
                        {type=18,value = {}}, --穿人
                        {type=19,value = {}}, --禁止穿怪
                        {type=6,value = {}},  --重配地图",如果玩家在这个区域挂掉或重新上线，会转移到之前的非重配地图区域，无参数
                       -- {type=44,value = {}},  --禁止原地复活
                        {type=34,value = {515,682,491}},--限制使用物品:行会召集令，复活石，随机传送石
                        {type=23,value = {1,2,3,4} },--禁止使用行会拉传
                        {type=30,value = {1,2,3,4} },--禁止被行会拉传
						{type=56,value = {}}, --禁止交易
--{type=81,value = {}},--地图挖矿区域

		}},
	},

	refresh = {

--#include "refresh343.lua"
	},
	npc = {},
	teleport = {
			{ posx = 74, posy = 38,toSceneid = 9,toPosx = 141, toPosy = 151,modelid = 62700,name = Lang.SceneName.s00009 },  --到威龙城
			
	},
	landscape=
 {
		--{posx1=105,posy1=69,posx2=106,posy2=68,modelid=111,xinterval=0,yinterval=0},--矿石
		--{posx1=111,posy1=71,posx2=112,posy2=70,modelid=110,xinterval=0,yinterval=0},--矿石

  },
},