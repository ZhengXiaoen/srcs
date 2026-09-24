--激情闭关
{
	scenceid = 110,
	scencename = Lang.SceneName.s00110,
	mapfilename = "132JiQingChuangGuan",
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
	sceneWidth = 96,
	sceneHeight = 88,
--	sceneType=2,
--	posx = 48,
--	posy = 110,

	area =
	{
		{ name = Lang.SceneName.a00095, range = { 31,37,54,14,73,37,54,60}, center = { 56,35},
		attri = {
              {type=3,value = {}},  --战斗专门区域，打死人不用负责任
              {type=20,value = {}}, --禁止穿人
              {type= 19,  value = {} },--传怪
			        --{type=41,value = {3538}},--自动加经验，每秒3538点
              {type=6,value = {}},  --重配地图",如果玩家在这个区域挂掉或重新上线，会转移到之前的非重配地图区域，无参数
              -- {type=44,value = {}},  --禁止原地复活
              {type=34,value = {515,682,491,502498}},--限制使用物品:行会召集令，复活石，随机传送石 ，荒古传送卷。
              {type=23,value = {1,2,3,4} },--禁止使用行会拉传
              {type=30,value = {1,2,3,4} },--禁止被行会拉传
 		  {type=50,value = {2} },--强制开启行会模式
              {type=80,value = {}},  --所在场景不爆装备
              --{type=45,value = {}},}}, --限制坐骑

			 }},

		{ name = Lang.SceneName.a00094, range = {18,56,27,47,41,61,32,70}, center = { 30,58},inherit = false,
		attri = {
				{type=18,value = {}},--穿人
				{type=1, value = {}},--世界安全区
				{type=19,value = {}},--穿怪
				--{type=39,value = {}},--城镇，表示回城卷或者回城复活，就会回到这里
                        {type=6,value = {}},  --重配地图",如果玩家在这个区域挂掉或重新上线，会转移到之前的非重配地图区域，无参数
                        {type=34,value = {515,682,491,502498}},--限制使用物品:行会召集令，复活石，随机传送石 ，荒古传送卷。
                        {type=23,value = {1,2,3,4} },--禁止使用行会拉传
                        {type=30,value = {1,2,3,4} },--禁止被行会拉传
				{type=87,value = {}},--新手保护有效
                        {type=80,value = {}},  --所在场景不爆装备
				--{type=46,value = {26,64, 34,72}},--安全区复活点 （不要再激情闭关设置安全复活点，不然跨区域的时候会保存）

			 }},
		
		{ name = Lang.SceneName.a00095, range = {27,46,34,39,49,54,42,61}, center = { 40,50},inherit = false,
    attri = {
             {type=3,value = {}},  --战斗专门区域，打死人不用负责任
              {type=18,value = {}}, --穿人
              {type= 19,  value = {} },--传怪
              --{type=41,value = {3538}},--自动加经验，每秒3538点
              {type=6,value = {}},  --重配地图",如果玩家在这个区域挂掉或重新上线，会转移到之前的非重配地图区域，无参数
              -- {type=44,value = {}},  --禁止原地复活
              {type=34,value = {515,682,491,502498}},--限制使用物品:行会召集令，复活石，随机传送石 ，荒古传送卷。
              {type=23,value = {1,2,3,4} },--禁止使用行会拉传
              {type=30,value = {1,2,3,4} },--禁止被行会拉传
              {type=50,value = {2} },--强制开启行会模式
              {type=80,value = {}},  --所在场景不爆装备
              --{type=45,value = {}},}}, --限制坐骑

       }},


		
		

	},

--refresh项用来配置这个场景的刷怪点，每个场景可以有多个刷怪点，可以用include包含多个刷怪点
	refresh =
	{

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

  },
  landscape = 

        --16,63,28,50,44,70,33,83
  {
          --{posx1=16,posy1=63,posx2=16,posy2=63,modelid=76,xinterval=0,yinterval=0},  --安全区边线
          {posx1=28,posy1=48,posx2=28,posy2=48,modelid=76,xinterval=0,yinterval=0},  --安全区边线
          {posx1=30,posy1=50,posx2=30,posy2=50,modelid=76,xinterval=0,yinterval=0},  --安全区边线
          {posx1=32,posy1=52,posx2=32,posy2=52,modelid=76,xinterval=0,yinterval=0},  --安全区边线
          {posx1=34,posy1=54,posx2=34,posy2=54,modelid=76,xinterval=0,yinterval=0},  --安全区边线
          {posx1=36,posy1=56,posx2=36,posy2=56,modelid=76,xinterval=0,yinterval=0},  --安全区边线
          {posx1=38,posy1=58,posx2=38,posy2=58,modelid=76,xinterval=0,yinterval=0},  --安全区边线
          {posx1=40,posy1=60,posx2=40,posy2=60,modelid=76,xinterval=0,yinterval=0},  --安全区边线
          -- {posx1=42,posy1=62,posx2=42,posy2=61,modelid=76,xinterval=0,yinterval=0},  --安全区边线


-- 

          {posx1=20,posy1=56,posx2=20,posy2=56,modelid=76,xinterval=0,yinterval=0},  --安全区边线
          {posx1=22,posy1=58,posx2=22,posy2=58,modelid=76,xinterval=0,yinterval=0},  --安全区边线
          {posx1=24,posy1=60,posx2=24,posy2=60,modelid=76,xinterval=0,yinterval=0},  --安全区边线
          {posx1=26,posy1=62,posx2=26,posy2=62,modelid=76,xinterval=0,yinterval=0},  --安全区边线
          {posx1=28,posy1=64,posx2=28,posy2=64,modelid=76,xinterval=0,yinterval=0},  --安全区边线
          {posx1=30,posy1=66,posx2=30,posy2=66,modelid=76,xinterval=0,yinterval=0},  --安全区边线
          {posx1=32,posy1=68,posx2=32,posy2=68,modelid=76,xinterval=0,yinterval=0},  --安全区边线
          -- {posx1=34,posy1=69,posx2=34,posy2=69,modelid=76,xinterval=0,yinterval=0},  --安全区边线
                -- {posx1=22,posy1=58,posx2=22,posy2=58,modelid=76,xinterval=0,yinterval=0},  --安全区边线

          {posx1=54,posy1=36,posx2=54,posy2=36,modelid=99,xinterval=0,yinterval=0},--红泡点
          {posx1=58,posy1=32,posx2=58,posy2=32,modelid=99,xinterval=0,yinterval=0},--红泡点
          {posx1=54,posy1=32,posx2=54,posy2=32,modelid=99,xinterval=0,yinterval=0},--红泡点
          {posx1=58,posy1=36,posx2=58,posy2=36,modelid=99,xinterval=0,yinterval=0},--红泡点
          {posx1=56,posy1=38,posx2=56,posy2=38,modelid=99,xinterval=0,yinterval=0},--红泡点
          {posx1=56,posy1=30,posx2=56,posy2=30,modelid=99,xinterval=0,yinterval=0},--红泡点
          --{posx1=65,posy1=56,posx2=65,posy2=56,modelid=99,xinterval=0,yinterval=0},--红泡点

          -- {posx1=51,posy1=36,posx2=51,posy2=36,modelid=99,xinterval=0,yinterval=0},--红泡点
          -- {posx1=54,posy1=40,posx2=54,posy2=40,modelid=99,xinterval=0,yinterval=0},--红泡点
          -- {posx1=57,posy1=42,posx2=57,posy2=42,modelid=99,xinterval=0,yinterval=0},--红泡点
          -- {posx1=47,posy1=32,posx2=47,posy2=32,modelid=99,xinterval=0,yinterval=0},--红泡点
          -- {posx1=60,posy1=46,posx2=60,posy2=46,modelid=99,xinterval=0,yinterval=0},--红泡点

          {posx1=52,posy1=34,posx2=52,posy2=34,modelid=99,xinterval=0,yinterval=0},--红泡点
          {posx1=60,posy1=34,posx2=60,posy2=34,modelid=99,xinterval=0,yinterval=0},--红泡点
          -- {posx1=62,posy1=41,posx2=62,posy2=41,modelid=101,xinterval=0,yinterval=0},--橙泡点
          -- {posx1=51,posy1=29,posx2=51,posy2=29,modelid=101,xinterval=0,yinterval=0},--橙泡点

          -- {posx1=57,posy1=29,posx2=57,posy2=29,modelid=100,xinterval=0,yinterval=0},--紫泡点
          {posx1=56,posy1=34,posx2=56,posy2=34,modelid=100,xinterval=0,yinterval=0},--紫泡点

          {posx1=40,posy1=53,posx2=40,posy2=53,modelid=102,xinterval=0,yinterval=0},  --箭头
  }

},