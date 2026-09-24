--军魂之地
{
	scenceid = 413,
	scencename = Lang.SceneName.s00413,
	mapfilename = "152JunHunZhiDi",
	minlevel = 1,
	forbiddenitem = {},	--限制物品，这是一个数字列表，代表有这些物品的玩家不能进入
	--forbiddenpet = {5,3},	--限制的坐骑（宠物），不能带这些坐骑（宠物）入内，这也是个数字列表
	forbiddenskill = {},	--限制的技能列表，有这些技能的玩家不能进入
	nopk = 0,	--0表示可以pk，1表示不可以，默认是0
	progress = 0,
	--在世界地图上的坐标x
	--music = "3.mp3",
	--musicInterval=60,
	worldmapPosx = 0,
	worldmapPosy = 0,
	--场景的长宽,是指格子数的长宽
	sceneWidth = 72,
	sceneHeight = 80,
	sceneType=0,

	area =
	{
		{ name = Lang.SceneName.s00413, range = { 0,0,75,0,75,71,0,71}, center = { 36,58},
			attri ={
					{ type = 6,  value = {} },
					{ type = 23,  value = {1,2,3,4} },
					{ type = 30,  value = {1,2,3,4} },	--禁止行会的召集，传送
					{ type = 18,  value = {} },---穿人
                    -- { type = 20, value = {}},--禁止穿人
					{ type = 34, value = {515}},--限制使用物品(行会召唤令)
					{ type = 19,  value = {} },--穿怪
					
				},
		},

		{ name = Lang.SceneName.a00009s, range = { 31,41,40,41,40,50,31,50}, center = { 36,46},
			attri ={
					{ type = 6,  value = {} },
					{ type = 23,  value = {1,2,3,4} },
					{ type = 30,  value = {1,2,3,4} },	--禁止行会的召集，传送
					{ type = 18,  value = {} },---穿人
                    -- { type = 20, value = {}},--禁止穿人
					{ type = 34, value = {515}},--限制使用物品(行会召唤令)
					{ type = 19,  value = {} },--穿怪
					{ type = 101,  value = {} },-- 军魂之地泡点区域
					
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
		
	},

  teleport =
  {
		



  },

   landscape=
 {
 	
    {posx1=34,posy1=41,posx2=34,posy2=41,modelid=112,xinterval=0,yinterval=0},  --军魂之地泡点区域
    {posx1=37,posy1=41,posx2=37,posy2=41,modelid=112,xinterval=0,yinterval=0},  --军魂之地泡点区域
    {posx1=40,posy1=41,posx2=40,posy2=41,modelid=112,xinterval=0,yinterval=0},  --军魂之地泡点区域

    {posx1=40,posy1=44,posx2=40,posy2=44,modelid=112,xinterval=0,yinterval=0},  --军魂之地泡点区域
    {posx1=40,posy1=47,posx2=40,posy2=47,modelid=112,xinterval=0,yinterval=0},  --军魂之地泡点区域
    {posx1=40,posy1=50,posx2=40,posy2=50,modelid=112,xinterval=0,yinterval=0},  --军魂之地泡点区域

    {posx1=37,posy1=50,posx2=37,posy2=50,modelid=112,xinterval=0,yinterval=0},  --军魂之地泡点区域
    {posx1=34,posy1=50,posx2=34,posy2=50,modelid=112,xinterval=0,yinterval=0},  --军魂之地泡点区域
    {posx1=31,posy1=50,posx2=31,posy2=50,modelid=112,xinterval=0,yinterval=0},  --军魂之地泡点区域

    {posx1=31,posy1=47,posx2=31,posy2=47,modelid=112,xinterval=0,yinterval=0},  --军魂之地泡点区域
    {posx1=31,posy1=44,posx2=31,posy2=44,modelid=112,xinterval=0,yinterval=0},  --军魂之地泡点区域
    {posx1=31,posy1=41,posx2=31,posy2=41,modelid=112,xinterval=0,yinterval=0},  --军魂之地泡点区域




 },

},