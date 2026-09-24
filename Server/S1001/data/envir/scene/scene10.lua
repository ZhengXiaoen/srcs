--热血王城
{
	scenceid = 10,
	scencename = Lang.SceneName.s00010,
	mapfilename = "91ReXueShaCheng",
	minlevel = 26,
	forbiddenitem = {1,2},	--限制物品，这是一个数字列表，代表有这些物品的玩家不能进入
	--forbiddenpet = {5,3},	--限制的坐骑（宠物），不能带这些坐骑（宠物）入内，这也是个数字列表
	forbiddenskill = {100,20},	--限制的技能列表，有这些技能的玩家不能进入
	nopk = 0,	--0表示可以pk，1表示不可以，默认是0
	progress = 0,
	--music = "4.mp3",
	--musicInterval=60,
	--在世界地图上的坐标x
	worldmapPosx = 0,
	worldmapPosy = 0,
	--场景的长宽,是指格子数的长宽
	sceneWidth = 168,
	sceneHeight = 168,
	posx = 141,
	posy = 125,
	area =
	{
		-- { name = Lang.SceneName.a00003, range = { 10,10,20,20,30,25 }, center = { 141,125 }, 
		-- attri = {{type=18,value = {}},  --穿人
		--          {type=19,value = {}},}},	--穿怪


		{ name = Lang.SceneName.a00002, range = { 27,85,100,15,172,85,97,161 }, center = { 138,144 }, --王城区域
		attri = {
		     {type=18,value = {}},  --穿人
		     {type=19,value = {}},  --穿怪
             --{type=100,value = {1}}, --禁止商城购买道具
			 {type=44,value = {}},--禁止原地复活
			 {type=79,value = { 1 }},--区域玩家属性，1表示进入沙巴克区域
			 --{type=20,value = {}},--禁止穿人
			 {type=30,  value = {1,2,3,4} },--禁止被行会拉传
			 {type=40,  value = {}},}}, --新手保护失效
             

  --                { name = Lang.SceneName.a00009, range = { 94,75,98,71,100,74,96,78 }, center = { 141,125 }, -- 楼梯
		-- attri = {
		--      {type=19,value = {}},  --穿怪
		-- 	 {type=44,value = {}},--禁止原地复活
		-- 	 {type=79,value = { 1 }},--区域玩家属性，1表示进入沙巴克区域
		-- 	 {type=20,value = {}},--禁止穿人
		-- 	 {type=30,  value = {1,2,3,4} },--禁止被行会拉传
		-- 	 {type=40,  value = {}},}}, --新手保护失效
             
               -- { name = Lang.SceneName.a00089, range = { 158,50,192,85,179,98,145,64}, center = { 169,74},
		--attri = {{ type = 86,  value = {} },--游泳地图
		        -- {type=6,value = {}},--如果玩家在这个区域挂掉或重新上线，会转移到之前的非重配地图区域，无参数
		        -- { type = 1,   value = {}},--世界安全区
			-- { type = 83,  value = {}},--禁止使用火墙
			-- { type = 45,  value = {} },--禁止骑马
			-- { type = 33,  value = {} }, --限制使用技能，后面是技能ID
			-- { type = 34,  value = {}},--限制使用物品，后面是物品ID
			-- { type = 85,  value = {} },}},	--鸳鸯区域

               -- { name = Lang.SceneName.a00000, range = { 89,135,119,106,137,125,108,154 }, center = { 108,122 }, 
		--attri = {{type=1,value = {}},           --世界安全区
		        -- {type=6,value = {}},--如果玩家在这个区域挂掉或重新上线，会转移到之前的非重配地图区域，无参数
		         --{type=39,value = {}},          --城镇
			-- {type=78,value = {}},          --摆摊区域
			-- {type=46,value = {}},          --安全复活点
			-- {type=83,value = {}},          --禁止使用火墙
			-- {type=60,value = {}},}},       --禁止自动战斗

		

	},

--refresh项用来配置这个场景的刷怪点，每个场景可以有多个刷怪点，可以用include包含多个刷怪点
	refresh =
	{
----#include "refresh4.lua"
	},

--这里配置这个场景出现的NPC，如果有多个NPC，这配置多行，每一项（行）表示一个NPC
	npc =
	{
		--funcId NPC的功能的ID,1 帮派 2 仓库 3 传送 4 装备  5 武器 6 修理 7 药店  8 副本  9 杂货  10 书店，默认是0可以不配置

		--{id = 230, posx = 133, posy = 117},---王城管家
--		{id = 42, posx = 119, posy = 114},--指挥官
--		--{id = 43, posx = 69, posy = 179},--张三叔
--		--{id = 44, posx = 165, posy = 25},--边界美人
--		--{id = 45, posx = 200, posy = 25},--边关探子
--		{id = 117, posx = 38, posy = 146},--跑环3
--		{id = 127,posx = 206, posy = 145},--跑环13
--		{id = 137,posx = 123, posy = 67},--跑环23
		-- {id = 116, posx = 141,posy = 121},--
		-- {id = 117, posx = 93,posy = 80},--
		-- {id = 118, posx = 102,posy = 35},--
		
		{id = 384, posx = 110, posy = 95},--军火商人
		{id = 386, posx = 90, posy = 41},--九殿下



	},

  teleport =
  {
		--传送点设置
		 { posx =  136, posy = 148,toSceneid = 9,toPosx = 219, toPosy =  43,modelid = 62700,name = Lang.SceneName.s00009 },  --王城→炎龙城
		 { posx =  69, posy = 63,toSceneid = 11,toPosx = 45, toPosy =  45,modelid = 62700,name = Lang.SceneName.s00011,randompos =1,sbk=1, },  --王城→皇宫
		 { posx =  72, posy = 60,toSceneid = 11,toPosx = 48, toPosy =  42,modelid = 62700,name = Lang.SceneName.s00011,randompos =1, sbk=1,},  --王城→皇宫

	-- { posx =  92, posy = 63,toSceneid = 51,toPosx = 53, toPosy =  40,modelid = 62702,name = Lang.SceneName.s00049 },  --王城→右皇宫
	-- { posx =  84, posy = 69,toSceneid = 51,toPosx = 33, toPosy =  58,modelid = 62701,name = Lang.SceneName.s00049 },  --王城→旁皇宫
		


    },

 landscape=
 {
	-- {posx1=145,posy1=121,posx2=145,posy2=121,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	-- {posx1=147,posy1=123,posx2=147,posy2=123,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	-- {posx1=149,posy1=125,posx2=149,posy2=125,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	-- {posx1=151,posy1=127,posx2=151,posy2=127,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	-- {posx1=153,posy1=129,posx2=153,posy2=129,modelid=76,xinterval=0,yinterval=0},  --安全区边线

	-- {posx1=151,posy1=131,posx2=137,posy2=129,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	-- {posx1=149,posy1=133,posx2=139,posy2=131,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	-- {posx1=147,posy1=135,posx2=141,posy2=133,modelid=76,xinterval=0,yinterval=0},  --安全区边线

	-- {posx1=137,posy1=129,posx2=137,posy2=129,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	-- {posx1=139,posy1=131,posx2=139,posy2=131,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	-- {posx1=141,posy1=133,posx2=141,posy2=133,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	-- {posx1=143,posy1=135,posx2=143,posy2=135,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	-- {posx1=145,posy1=137,posx2=145,posy2=137,modelid=76,xinterval=0,yinterval=0},  --安全区边线

	-- {posx1=139,posy1=127,posx2=139,posy2=127,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	-- {posx1=141,posy1=125,posx2=141,posy2=125,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	-- {posx1=143,posy1=123,posx2=143,posy2=123,modelid=76,xinterval=0,yinterval=0},  --安全区边线

 },

},