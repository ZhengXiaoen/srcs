--GM工作室
{
	scenceid = 174,
	scencename = "GM工作室",
	mapfilename = "3BiQiHuangGong",
	minlevel = 11,
	forbiddenitem = {1,2},	--限制物品，这是一个数字列表，代表有这些物品的玩家不能进入
	--forbiddenpet = {5,3},	--限制的坐骑（宠物），不能带这些坐骑（宠物）入内，这也是个数字列表
	forbiddenskill = {100,20},	--限制的技能列表，有这些技能的玩家不能进入
	nopk = 0,	--0表示可以pk，1表示不可以，默认是0
	progress = 0,
	music = "biqicheng.mp3",
	--musicInterval=60,
	--在世界地图上的坐标x
	worldmapPosx = 0,
	worldmapPosy = 0,
	--场景的长宽,是指格子数的长宽
	sceneWidth = 108,
	sceneHeight = 104,
	posx = 20,
	posy = 43,
	area =
	{
		{ name = "GM工作室", range = { 10,10,20,20,60,50 }, center = { 49,58},attri = {{type=18,value = {}},{type=19,value = {}},{type=1,value = {}},{type=45,value = {}},{type=46,value = {}},{type=87,value = {}},}},
	},

--refresh项用来配置这个场景的刷怪点，每个场景可以有多个刷怪点，可以用include包含多个刷怪点
	refresh =
	{

	},

--这里配置这个场景出现的NPC，如果有多个NPC，这配置多行，每一项（行）表示一个NPC
	npc =
	{
		{id = 250, posx = 52, posy = 54},
	},

  teleport =
  {

  },

},