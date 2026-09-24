--行会乐园
{
	scenceid = 339,
	scencename = Lang.SceneName.s00339,
	mapfilename = "142JiQingHangHui",
	minlevel = 80,
	forbiddenitem = {1,2},	--限制物品，这是一个数字列表，代表有这些物品的玩家不能进入
	nopk = 0,
	progress = 0,
	worldmapPosx = 0,
	worldmapPosy = 0,
	sceneWidth = 104,
	sceneHeight = 96,
	area =
	{
		{ name = Lang.SceneName.s00339, range = { 0,0,200,0,200,200}, center = { 71,46},
		attri = {
                        {type=18,value = {}}, --穿人
                        {type=19,value = {}}, --穿怪
                        {type=6,value = {}},  --重配地图",如果玩家在这个区域挂掉或重新上线，会转移到之前的非重配地图区域，无参数
                        --{type=44,value = {}},  --禁止原地复活
                       {type=34,value = {515,682,491}},--限制使用物品:行会召集令，复活石，随机传送石
                        {type=23,value = {1,2,3,4} },--禁止使用行会拉传
                        {type=30,value = {1,2,3,4} },--禁止被行会拉传
                        {type=3,value = {}}, --战斗专门区域，打死人不用负责任
                        {type=50,value = {2}}, --强制攻击模式：0和平模式，1团队模式，2帮派模式，3阵营模式，4杀戮模式，5联盟模式, 6阵营模式, 7军团模式
		}},
	},

	refresh = {},
	npc = {},
	teleport = {},
},