
--军团战
{
	scenceid = 107,
	scencename = Lang.SceneName.s00107,
	mapfilename = "127MoJingZhanChang",
	minlevel = 70,
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
	sceneWidth = 232,
	sceneHeight = 224,
--	sceneType=2,
--	posx = 48,
--	posy = 110,

	area =
	{
		{
			name = Lang.SceneName.s00107, range = { 0,0, 231,0, 231,223, 0,223}, center = { 120,106},
			attri = 
			{
					{type=20,value = {}},--禁止穿人
					{type=34,value = {515,680502,498,678,821,822,823,824,491}},--限制物品使用
			        --{type=46,value = {73,29,126,176}},--安全复活区, 不要在军团战中配置安全复活区，否则玩家不在军团战时也会复活到这里
					{type=3,value = {}},  --战斗专门区域，打死人不用负责任
					{type=19,value = {}},--穿怪
					{type=80,value = {}},--场景不爆装备
					{type=26,value = {}},--禁止使用随机
					{type=27,value = {}},--禁止使用药品
					{type=54,value = {}},--禁止使用药品
					{type=41,value = {1000}},--自动加经验，每秒3538点
					{type=24,value = {}},--禁止使用夫妻传送
					{type=25,value = {}},--禁止使用师徒传送
					{type=50,value = {5}},--强制攻击模式，军团模式
					{type=23,value = {1,2,3,4}},--"禁止被行会拉传"，参数：【召唤1，行会集结令2，行会回城卷3】
					{type=30,value = {1,2,3,4}},--"禁止使用行会拉传"，参数：【召唤1，行会集结令2，行会回城卷3】
					{type=6,value = {}},--默认配置场景
			},
		},	

		{	--三个安全区
			name = Lang.SceneName.a00117,--烈焰
			range = { 190,172, 202,184, 192,194, 180,182 },	--范围点,3个坐标点以上连成线.
			center = { 191,182 }, --范围点内的中心点
			attri = {
				
				{type=1,value = {}}, 	--安全区		
				{type=99,value = {3}}, --军团专属安全区
			 },
		},

		{	--三个安全区
			name = Lang.SceneName.a00118,---雷霆
			range = { 39,173, 51,185, 41,195, 29,183 },	--范围点,3个坐标点以上连成线.
			center = { 40,183 }, --范围点内的中心点
			attri = {
				
				{type=1,value = {}}, 	--安全区
                {type=99,value = {1}}, --军团专属安全区		
				
			 },
		},

		{	--三个安全区
			name = Lang.SceneName.a00116,---光芒
			range = { 120,27, 134,41, 124,51, 110,37 },	--范围点,3个坐标点以上连成线.
			center = { 121,38 }, --范围点内的中心点
			attri = {
				
				{type=1,value = {}}, 	--安全区	
                {type=99,value = {2}}, --军团专属安全区		
				
			 },
		},
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

  landscape=
 {


	{posx1=190,posy1=172,posx2=190,posy2=172,modelid=76,xinterval=0,yinterval=0},  --安全区边线leiyan
	{posx1=188,posy1=174,posx2=188,posy2=174,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=186,posy1=176,posx2=186,posy2=176,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=184,posy1=178,posx2=184,posy2=178,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=182,posy1=180,posx2=182,posy2=180,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=180,posy1=182,posx2=180,posy2=182,modelid=76,xinterval=0,yinterval=0},  --安全区边线

	{posx1=182,posy1=184,posx2=182,posy2=184,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=184,posy1=186,posx2=184,posy2=186,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=186,posy1=188,posx2=186,posy2=188,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=188,posy1=190,posx2=188,posy2=190,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=190,posy1=192,posx2=190,posy2=192,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=192,posy1=194,posx2=192,posy2=194,modelid=76,xinterval=0,yinterval=0},  --安全区边线

	{posx1=194,posy1=192,posx2=194,posy2=192,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=196,posy1=190,posx2=196,posy2=190,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=198,posy1=188,posx2=198,posy2=188,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=200,posy1=186,posx2=200,posy2=186,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=202,posy1=184,posx2=202,posy2=184,modelid=76,xinterval=0,yinterval=0},  --安全区边线

	{posx1=200,posy1=182,posx2=200,posy2=182,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=198,posy1=180,posx2=198,posy2=180,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=196,posy1=178,posx2=196,posy2=178,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=194,posy1=176,posx2=194,posy2=176,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=192,posy1=174,posx2=192,posy2=174,modelid=76,xinterval=0,yinterval=0},  --安全区边线


	{posx1=39,posy1=173,posx2=39,posy2=173,modelid=76,xinterval=0,yinterval=0},  --安全区边线===leiting
	{posx1=37,posy1=175,posx2=37,posy2=175,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=35,posy1=177,posx2=35,posy2=177,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=33,posy1=179,posx2=33,posy2=179,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=31,posy1=181,posx2=31,posy2=181,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=29,posy1=183,posx2=29,posy2=183,modelid=76,xinterval=0,yinterval=0},  --安全区边线

	{posx1=31,posy1=185,posx2=31,posy2=185,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=33,posy1=187,posx2=33,posy2=187,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=35,posy1=189,posx2=35,posy2=189,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=37,posy1=191,posx2=37,posy2=191,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=39,posy1=193,posx2=39,posy2=193,modelid=76,xinterval=0,yinterval=0},  --安全区边线

	{posx1=41,posy1=195,posx2=41,posy2=195,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=43,posy1=193,posx2=43,posy2=193,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=45,posy1=191,posx2=45,posy2=191,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=47,posy1=189,posx2=47,posy2=189,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=49,posy1=187,posx2=49,posy2=187,modelid=76,xinterval=0,yinterval=0},  --安全区边线

	{posx1=51,posy1=185,posx2=51,posy2=185,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=49,posy1=183,posx2=49,posy2=183,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=47,posy1=181,posx2=47,posy2=181,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=45,posy1=179,posx2=45,posy2=179,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=43,posy1=177,posx2=43,posy2=177,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=41,posy1=175,posx2=41,posy2=175,modelid=76,xinterval=0,yinterval=0},  --安全区边线

	{posx1=120,posy1=27,posx2=120,posy2=27,modelid=76,xinterval=0,yinterval=0},  --安全区边线-guangmang
	{posx1=118,posy1=29,posx2=118,posy2=29,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=116,posy1=31,posx2=116,posy2=31,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=114,posy1=33,posx2=114,posy2=33,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=112,posy1=35,posx2=112,posy2=35,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=110,posy1=37,posx2=110,posy2=37,modelid=76,xinterval=0,yinterval=0},  --安全区边线

	{posx1=112,posy1=39,posx2=112,posy2=39,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=114,posy1=41,posx2=114,posy2=41,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=116,posy1=43,posx2=116,posy2=43,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=118,posy1=45,posx2=118,posy2=45,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=120,posy1=47,posx2=120,posy2=47,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=122,posy1=49,posx2=122,posy2=49,modelid=76,xinterval=0,yinterval=0},  --安全区边线

	{posx1=124,posy1=51,posx2=124,posy2=51,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=126,posy1=49,posx2=126,posy2=49,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=128,posy1=47,posx2=128,posy2=47,modelid=76,xinterval=0,yinterval=0},  --安全区边线

	{posx1=130,posy1=45,posx2=130,posy2=45,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=132,posy1=43,posx2=132,posy2=43,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=134,posy1=41,posx2=134,posy2=41,modelid=76,xinterval=0,yinterval=0},  --安全区边线

	{posx1=132,posy1=39,posx2=132,posy2=39,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=130,posy1=37,posx2=130,posy2=37,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=128,posy1=35,posx2=128,posy2=35,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=126,posy1=33,posx2=126,posy2=33,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=124,posy1=31,posx2=124,posy2=31,modelid=76,xinterval=0,yinterval=0},  --安全区边线
	{posx1=122,posy1=29,posx2=122,posy2=29,modelid=76,xinterval=0,yinterval=0},  --安全区边线




  },

},