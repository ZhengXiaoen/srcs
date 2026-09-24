--奔跑吧老哥。
{
	scenceid = 217,
	scencename = Lang.SceneName.s00217,
	mapfilename = "147BenPao2",
	minlevel = 60,
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
	sceneWidth = 192,
	sceneHeight = 208,
--	sceneType=2,
--	posx = 48,
--	posy = 110,
    isAddUpExp = 0, --杀怪后是否累加经验，0：杀怪后直接加经验(默认值)；1：杀怪后不加经验，累积起来，结束时再一起加（或多倍购买）；2：杀怪后直接加经验并累积（前端展示或多倍购买）
	area =
	{
		{ name = Lang.SceneName.s00217, range = { 10,10,20,20,60,50}, center = { 100,25},
		attri = {
                        {type=1, value = {}},--世界安全区
                        {type=20,value = {}}, --禁止穿人
                        {type=21,value = {}}, --禁止穿怪
			--{type=41,value = {3538}},--自动加经验，每秒3538点
                        {type=6,value = {}},  --重配地图",如果玩家在这个区域挂掉或重新上线，会转移到之前的非重配地图区域，无参数
                      
						{type=34,value = {515,682502,498,491}},--限制物品使用（随机传送卷，续命丹，随机传送石，行会召集令）
                        {type=23,value = {1,2,3,4} },--禁止使用行会拉传
                        {type=30,value = {1,2,3,4} },--禁止被行会拉传
                        {type=83,value = {}},     --禁止使用火墙
						{type=33,value = {5}},     --禁止使用野蛮
                        {type=80,value = {}},  --所在场景不爆装备
                        --{type=45,value = {}},}}, --限制坐骑

			 }},	

	},

--refresh项用来配置这个场景的刷怪点，每个场景可以有多个刷怪点，可以用include包含多个刷怪点
	refresh =
	{
--#include "refresh217.lua"
	},

--这里配置这个场景出现的NPC，如果有多个NPC，这配置多行，每一项（行）表示一个NPC
	npc =
	{
		--funcId NPC的功能的ID,1 帮派 2 仓库 3 传送 4 装备  5 武器 6 修理 7 药店  8 副本  9 杂货，默认是0可以不配置

        -- {id = 380, posx = 215, posy = 98}, --烈焰大使
        -- {id = 380, posx = 184, posy = 64}, --奔跑迷惑
        -- {id = 380, posx = 140, posy = 25}, --奔跑迷惑
        {id = 239, posx = 103, posy = 30}, --奔跑迷惑103,30
	},

  teleport =
  {
		--传送点设置
		--{ posx = 41, posy = 115,toSceneid = 16,toPosx = 115, toPosy = 58,modelid = 50000,name = Lang.SceneName.s00016 },  --猪洞四层→猪洞三层
		{ posx = 98, posy = 29,toSceneid = 342 ,toPosx = 30, toPosy = 44,modelid = 62700,name = Lang.SceneName.s00342 },  --2层去3层世界BOSS
			

  },
  
  landscape=
 {
				{posx1=98,posy1=182,posx2=100,posy2=180,modelid=102,xinterval=0,yinterval=0},  --箭头
				{posx1=91,posy1=176,posx2=91,posy2=174,modelid=103,xinterval=0,yinterval=0},  --箭头
				{posx1=87,posy1=178,posx2=83,posy2=177,modelid=104,xinterval=0,yinterval=0},  --箭头			
			 
   },

},