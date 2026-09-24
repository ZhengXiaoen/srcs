--活动地图-世界boss
{
	scenceid = 119,
	scencename = Lang.SceneName.s00119,
	mapfilename = "120ShiJieBoss",
	minlevel = 80,
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
	sceneWidth = 104,
	sceneHeight = 104,
	
	--seckillId = 5,	--秒杀活动Id 对应与表 SecKill (data\config\activity\seckill.lua) 里的ID 默认为0 不能秒

	area =
	{
		{ name = Lang.SceneName.s00119, range = { 10,10,20,20,60,50}, center = { 35,62},
		attri = {
						{type=1, value = {}},--世界安全区
                       -- {type=3,value = {}},  --战斗专门区域，打死人不用负责任
                        {type=18,value = {}},  --穿人
                        {type=19,value = {}},    --穿怪
						{type=41,value = {2000}},--自动加经验，每秒3538点
                        {type=6,value = {}},  --重配地图",如果玩家在这个区域挂掉或重新上线，会转移到之前的非重配地图区域，无参数
                       -- {type=44,value = {}},  --禁止原地复活
                        {type=34,value = {515,682491}},--限制使用物品:行会召集令，复活石，随机传送石
                        {type=23,value = {1,2,3,4}},--禁止使用行会拉传
						{type=50,value = {0}},--强制攻击模式，和平模式
                        {type=30,value = {1,2,3,4}},--禁止被行会拉传
                       -- {type=80,value = {}},  --所在场景不爆装备
                        --{type=45,value = {}},}}, --限制坐骑
		 }},
	},

--refresh项用来配置这个场景的刷怪点，每个场景可以有多个刷怪点，可以用include包含多个刷怪点
	refresh =
	{
    --#include "refresh119.lua"
	},

--这里配置这个场景出现的NPC，如果有多个NPC，这配置多行，每一项（行）表示一个NPC
	npc =
	{
		--funcId NPC的功能的ID,1 帮派 2 仓库 3 传送 4 装备  5 武器 6 修理 7 药店  8 副本  9 杂货，默认是0可以不配置
		--{id = 226, posx = 55, posy = 27},	--武林争霸裁判

	},

  teleport =
  {
  		--传送点设置
		--{ posx =  65, posy = 66,toSceneid = 60,toPosx = 80, toPosy = 212,modelid = 62700,name = Lang.SceneName.s00060 },  --1层一→2层
  },

 landscape=
 {
	--{posx1=39,posy1=40,posx2=39,posy2=40,modelid=65,xinterval=0,yinterval=0},  --锣鼓
	--{posx1=40,posy1=39,posx2=40,posy2=39,modelid=65,xinterval=0,yinterval=0},  --锣鼓
	--{posx1=38,posy1=41,posx2=38,posy2=41,modelid=65,xinterval=0,yinterval=0},  --锣鼓

	--{posx1=59,posy1=60,posx2=59,posy2=60,modelid=69,xinterval=0,yinterval=0},  --锣鼓
	--{posx1=60,posy1=59,posx2=60,posy2=59,modelid=69,xinterval=0,yinterval=0},  --锣鼓
	--{posx1=58,posy1=61,posx2=58,posy2=61,modelid=69,xinterval=0,yinterval=0},  --锣鼓

  },

},