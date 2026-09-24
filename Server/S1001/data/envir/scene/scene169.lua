--模拟攻城战
{
	scenceid = 169,
	scencename = Lang.SceneName.s00169,
	mapfilename = "103ShiJieBoss5",
	minlevel = 40,
	forbiddenitem = {1,2},	--限制物品，这是一个数字列表，代表有这些物品的玩家不能进入
	--forbiddenpet = {5,3},	--限制的坐骑（宠物），不能带这些坐骑（宠物）入内，这也是个数字列表
	forbiddenskill = {100,20},	--限制的技能列表，有这些技能的玩家不能进入
	nopk = 0,	--0表示可以pk，1表示不可以，默认是0
	progress = 0,
	--在世界地图上的坐标x
	--music = "4.mp3",
	--musicInterval=60,
	worldmapPosx = 0,
	worldmapPosy = 0,
	--场景的长宽,是指格子数的长宽
	sceneWidth = 80,
	sceneHeight = 88,

	area =
	{
		{ name = Lang.SceneName.s00169, range = { 10,10,20,20,60,50}, center = { 62,69},
		attri = {{type=18,value = {}},  --穿人
		         {type=19,value = {}},  --穿怪
			 {type=44,value = {}},  --禁止原地复活
			 {type=6,value = {}}, --"重配地图",如果玩家在这个区域挂掉或重新上线，会转移到之前的非重配地图区域，无参数
			 {type=34,value = {680}},--限制使用物品:传送小飞鞋
			 {type = 23,  value = {1,2,3,4} },     --禁止使用行会拉传
			 {type = 30,  value = {1,2,3,4} },
				--默认配置场景，禁止被行会拉传，传送，不爆装备
			 }},


	},

--refresh项用来配置这个场景的刷怪点，每个场景可以有多个刷怪点，可以用include包含多个刷怪点
	refresh =
	{
--#include "refresh169.lua"
	},

--这里配置这个场景出现的NPC，如果有多个NPC，这配置多行，每一项（行）表示一个NPC
	npc =
	{
		--funcId NPC的功能的ID,1 帮派 2 仓库 3 传送 4 装备  5 武器 6 修理 7 药店  8 副本  9 杂货，默认是0可以不配置

        --{id = 47, posx = 63, posy = 50,script = "data/script/FuBenScriptNpc/DiYuShiZhe.lua",modelid = 291,icon = 1,funcId = 0,title=Lang.NpcTitle.n00028, idleInterval = 20000}, --王城至尊
	
	},

  teleport =
  {
		--传送点设置
		{ posx = 37, posy = 22,toSceneid = 9,toPosx = 228, toPosy = 241,modelid = 62700,name = Lang.SceneName.s00009 },  --→土城

  },
   landscape=
 {
				{posx1=65,posy1=63,posx2=65,posy2=63,modelid=98,xinterval=0,yinterval=0},  --火墙
				{posx1=63,posy1=62,posx2=62,posy2=62,modelid=98,xinterval=0,yinterval=0},  --火墙
				{posx1=66,posy1=67,posx2=66,posy2=67,modelid=98,xinterval=0,yinterval=0},  --火墙
                --{posx1=66,posy1=56,posx2=66,posy2=56,modelid=98,xinterval=0,yinterval=0},  --火墙

				--{posx1=60,posy1=56,posx2=60,posy2=56,modelid=98,xinterval=0,yinterval=0},  --火墙
				{posx1=61,posy1=55,posx2=61,posy2=55,modelid=98,xinterval=0,yinterval=0},  --火墙
				{posx1=59,posy1=59,posx2=59,posy2=59,modelid=98,xinterval=0,yinterval=0},  --火墙
                {posx1=61,posy1=58,posx2=61,posy2=58,modelid=98,xinterval=0,yinterval=0},  --火墙
				--{posx1=60,posy1=59,posx2=60,posy2=59,modelid=98,xinterval=0,yinterval=0},  --火墙

				--{posx1=67,posy1=65,posx2=67,posy2=65,modelid=98,xinterval=0,yinterval=0},  --火墙
				--{posx1=50,posy1=69,posx2=50,posy2=69,modelid=98,xinterval=0,yinterval=0},  --火墙
				{posx1=51,posy1=68,posx2=51,posy2=68,modelid=98,xinterval=0,yinterval=0},  --火墙
				{posx1=52,posy1=72,posx2=52,posy2=72,modelid=98,xinterval=0,yinterval=0},  --火墙

				--{posx1=53,posy1=71,posx2=53,posy2=71,modelid=98,xinterval=0,yinterval=0},  --火墙
				{posx1=56,posy1=74,posx2=56,posy2=74,modelid=98,xinterval=0,yinterval=0},  --火墙
				{posx1=55,posy1=59,posx2=55,posy2=59,modelid=98,xinterval=0,yinterval=0},  --火墙
				--{posx1=56,posy1=59,posx2=56,posy2=59,modelid=98,xinterval=0,yinterval=0},  --火墙
				
				{posx1=37,posy1=60,posx2=37,posy2=60,modelid=98,xinterval=0,yinterval=0},  --火墙
				--{posx1=36,posy1=61,posx2=36,posy2=61,modelid=98,xinterval=0,yinterval=0},  --火墙
				--{posx1=35,posy1=61,posx2=35,posy2=61,modelid=98,xinterval=0,yinterval=0},  --火墙
				--{posx1=34,posy1=54,posx2=34,posy2=54,modelid=98,xinterval=0,yinterval=0},  --火墙
				{posx1=35,posy1=54,posx2=35,posy2=54,modelid=98,xinterval=0,yinterval=0},  --火墙
				--{posx1=35,posy1=57,posx2=35,posy2=57,modelid=98,xinterval=0,yinterval=0},  --火墙

				{posx1=34,posy1=50,posx2=34,posy2=50,modelid=98,xinterval=0,yinterval=0},  --火墙
				--{posx1=41,posy1=50,posx2=41,posy2=50,modelid=98,xinterval=0,yinterval=0},  --火墙
				{posx1=42,posy1=50,posx2=42,posy2=50,modelid=98,xinterval=0,yinterval=0},  --火墙
				--{posx1=41,posy1=49,posx2=41,posy2=49,modelid=98,xinterval=0,yinterval=0},  --火墙

				--{posx1=32,posy1=46,posx2=32,posy2=46,modelid=98,xinterval=0,yinterval=0},  --火墙
				{posx1=33,posy1=46,posx2=33,posy2=46,modelid=98,xinterval=0,yinterval=0},  --火墙
                --{posx1=34,posy1=45,posx2=34,posy2=45,modelid=98,xinterval=0,yinterval=0},  --火墙

				{posx1=44,posy1=41,posx2=44,posy2=41,modelid=98,xinterval=0,yinterval=0},  --火墙
				--{posx1=45,posy1=42,posx2=45,posy2=42,modelid=98,xinterval=0,yinterval=0},  --火墙
				--{posx1=46,posy1=43,posx2=46,posy2=43,modelid=98,xinterval=0,yinterval=0},  --火墙
                {posx1=38,posy1=47,posx2=38,posy2=47,modelid=98,xinterval=0,yinterval=0},  --火墙
			    {posx1=47,posy1=43,posx2=47,posy2=43,modelid=98,xinterval=0,yinterval=0},  --火墙
			    --{posx1=50,posy1=41,posx2=50,posy2=41,modelid=98,xinterval=0,yinterval=0},  --火墙
			    {posx1=51,posy1=40,posx2=51,posy2=40,modelid=98,xinterval=0,yinterval=0},  --火墙
			    --{posx1=49,posy1=35,posx2=49,posy2=35,modelid=98,xinterval=0,yinterval=0},  --火墙

                --{posx1=55,posy1=39,posx2=55,posy2=39,modelid=98,xinterval=0,yinterval=0},  --火墙
                --{posx1=54,posy1=39,posx2=54,posy2=39,modelid=98,xinterval=0,yinterval=0},  --火墙  

                --{posx1=51,posy1=37,posx2=51,posy2=37,modelid=98,xinterval=0,yinterval=0},  --火墙
                --{posx1=49,posy1=31,posx2=49,posy2=31,modelid=98,xinterval=0,yinterval=0},  --火墙
                --{posx1=48,posy1=32,posx2=48,posy2=32,modelid=98,xinterval=0,yinterval=0},  --火墙

                --{posx1=41,posy1=34,posx2=41,posy2=34,modelid=98,xinterval=0,yinterval=0},  --火墙
                {posx1=40,posy1=35,posx2=40,posy2=35,modelid=98,xinterval=0,yinterval=0},  --火墙
                --{posx1=20,posy1=41,posx2=20,posy2=41,modelid=98,xinterval=0,yinterval=0},  --火墙
                --{posx1=22,posy1=43,posx2=22,posy2=43,modelid=98,xinterval=0,yinterval=0},  --火墙
                --{posx1=28,posy1=43,posx2=28,posy2=43,modelid=98,xinterval=0,yinterval=0},  --火墙
                --{posx1=43,posy1=28,posx2=43,posy2=28,modelid=98,xinterval=0,yinterval=0},  --火墙
                {posx1=30,posy1=20,posx2=30,posy2=20,modelid=98,xinterval=0,yinterval=0},  --火墙
                --{posx1=29,posy1=20,posx2=29,posy2=20,modelid=98,xinterval=0,yinterval=0},  --火墙
                {posx1=33,posy1=28,posx2=33,posy2=28,modelid=98,xinterval=0,yinterval=0},  --火墙

                --{posx1=34,posy1=29,posx2=34,posy2=29,modelid=98,xinterval=0,yinterval=0},  --火墙
                {posx1=35,posy1=28,posx2=35,posy2=28,modelid=98,xinterval=0,yinterval=0},  --火墙

                --{posx1=41,posy1=30,posx2=41,posy2=30,modelid=98,xinterval=0,yinterval=0},  --火墙
                {posx1=40,posy1=31,posx2=40,posy2=31,modelid=98,xinterval=0,yinterval=0},  --火墙

                --{posx1=33,posy1=38,posx2=33,posy2=38,modelid=98,xinterval=0,yinterval=0},  --火墙
                {posx1=32,posy1=39,posx2=32,posy2=39,modelid=98,xinterval=0,yinterval=0},  --火墙

                --{posx1=25,posy1=33,posx2=25,posy2=33,modelid=98,xinterval=0,yinterval=0},  --火墙
                --{posx1=25,posy1=34,posx2=25,posy2=34,modelid=98,xinterval=0,yinterval=0},  --火墙

                {posx1=24,posy1=34,posx2=24,posy2=34,modelid=98,xinterval=0,yinterval=0},  --火墙
    

                --{posx1=15,posy1=34,posx2=15,posy2=34,modelid=98,xinterval=0,yinterval=0},  --火墙
                --{posx1=16,posy1=33,posx2=16,posy2=33,modelid=98,xinterval=0,yinterval=0},  --火墙
                --{posx1=18,posy1=31,posx2=18,posy2=31,modelid=98,xinterval=0,yinterval=0},  --火墙
                --{posx1=20,posy1=29,posx2=20,posy2=29,modelid=98,xinterval=0,yinterval=0},  --火墙
                --{posx1=21,posy1=28,posx2=21,posy2=28,modelid=98,xinterval=0,yinterval=0},  --火墙
                {posx1=22,posy1=27,posx2=22,posy2=27,modelid=98,xinterval=0,yinterval=0},  --火墙
                --{posx1=24,posy1=25,posx2=24,posy2=25,modelid=98,xinterval=0,yinterval=0},  --火墙
                --{posx1=26,posy1=23,posx2=26,posy2=23,modelid=98,xinterval=0,yinterval=0},  --火墙
                --{posx1=30,posy1=19,posx2=30,posy2=19,modelid=98,xinterval=0,yinterval=0},  --火墙
                {posx1=27,posy1=22,posx2=27,posy2=22,modelid=98,xinterval=0,yinterval=0},  --火墙
                --{posx1=32,posy1=17,posx2=32,posy2=17,modelid=98,xinterval=0,yinterval=0},  --火墙
                --{posx1=33,posy1=16,posx2=33,posy2=16,modelid=98,xinterval=0,yinterval=0},  --火墙
                {posx1=35,posy1=14,posx2=35,posy2=14,modelid=98,xinterval=0,yinterval=0},  --火墙
                --{posx1=36,posy1=15,posx2=36,posy2=15,modelid=98,xinterval=0,yinterval=0},  --火墙

                {posx1=38,posy1=17,posx2=38,posy2=17,modelid=98,xinterval=0,yinterval=0},  --火墙
                --{posx1=40,posy1=19,posx2=40,posy2=19,modelid=98,xinterval=0,yinterval=0},  --火墙
                {posx1=41,posy1=20,posx2=41,posy2=20,modelid=98,xinterval=0,yinterval=0},  --火墙
                --{posx1=42,posy1=21,posx2=42,posy2=21,modelid=98,xinterval=0,yinterval=0},  --火墙
                --{posx1=44,posy1=23,posx2=44,posy2=23,modelid=98,xinterval=0,yinterval=0},  --火墙
                --{posx1=45,posy1=24,posx2=45,posy2=24,modelid=98,xinterval=0,yinterval=0},  --火墙
                --{posx1=46,posy1=25,posx2=46,posy2=25,modelid=98,xinterval=0,yinterval=0},  --火墙

			--	{posx1=59,posy1=50,posx2=59,posy2=50,modelid=90,xinterval=0,yinterval=0},  --火龙气焰
			--	{posx1=48,posy1=41,posx2=48,posy2=41,modelid=90,xinterval=0,yinterval=0},  --火龙气焰
			--	{posx1=56,posy1=25,posx2=56,posy2=25,modelid=90,xinterval=0,yinterval=0},  --火龙气焰
			--	{posx1=62,posy1=51,posx2=62,posy2=51,modelid=90,xinterval=0,yinterval=0},  --火龙气焰
			--	{posx1=36,posy1=48,posx2=36,posy2=48,modelid=90,xinterval=0,yinterval=0},  --火龙气焰
			--
			--	{posx1=47,posy1=30,posx2=47,posy2=30,modelid=91,xinterval=0,yinterval=0},  --冰咆哮
			--	{posx1=51,posy1=38,posx2=51,posy2=38,modelid=91,xinterval=0,yinterval=0},  --冰咆哮
			--	{posx1=53,posy1=54,posx2=53,posy2=54,modelid=91,xinterval=0,yinterval=0},  --冰咆哮
			--	{posx1=51,posy1=52,posx2=51,posy2=52,modelid=91,xinterval=0,yinterval=0},  --冰咆哮
			--	{posx1=36,posy1=44,posx2=36,posy2=44,modelid=91,xinterval=0,yinterval=0},  --冰咆哮
			 
   },

},