--荒古之地
{
	scenceid = 284,
	scencename = Lang.SceneName.s00284,
	mapfilename = "23XuKongGuMu3Ceng",
	minlevel = 45,
	forbiddenitem = {1,2},	--限制物品，这是一个数字列表，代表有这些物品的玩家不能进入
	forbiddenskill = {100,20},	--限制的技能列表，有这些技能的玩家不能进入
	nopk = 0,	--0表示可以pk，1表示不可以，默认是0
	progress = 0,
	worldmapPosx = 0,
	worldmapPosy = 0,
	--场景的长宽,是指格子数的长宽
	sceneWidth = 140,
	sceneHeight = 120,
	area =
	{
		{ name = Lang.SceneName.s00284, range = { 0,0,200,0,200,200}, center = { 43,83},
		attri = {
			 			{type=20,value = {}},--禁止穿人
                        {type=19,value = {}}, --穿怪
                        {type=6,value = {}},  --重配地图",如果玩家在这个区域挂掉或重新上线，会转移到之前的非重配地图区域，无参数
                      --  {type=44,value = {}},  --禁止原地复活
                        {type=34,value = {515,682}},--限制使用物品:行会召集令，复活石，随机传送石
                        {type=23,value = {1,2,3,4} },--禁止使用行会拉传
                        {type=30,value = {1,2,3,4} },--禁止被行会拉传
			 }},	

	},
--refresh项用来配置这个场景的刷怪点，每个场景可以有多个刷怪点，可以用include包含多个刷怪点
	refresh =
	{
--#include "refresh284.lua"
	},

--这里配置这个场景出现的NPC，如果有多个NPC，这配置多行，每一项（行）表示一个NPC
	npc =
	{

	},

  teleport =
  {

  },

},