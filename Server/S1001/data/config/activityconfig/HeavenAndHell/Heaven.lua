
--九天冰宫
HeavenConfig = 
{
	keyBoss = {mid = 618, sid = 8, x = 175, y = 200, liveTime = 3600},	--钥匙BOSS配置
	
	teleportRange = 10,
	
	--楼层配置
	Floors =
	{
		{sid = 125, x = 33, y = 124, bp = 3000, item = {id = 1170, count = 1}},		--一层 sid:场景ID x:传送x y:传送y bp:限制战力 item:需求物品
		{sid = 126, x = 100, y = 92, bp = 3500, item = {id = 1170, count = 2}},		--二层
		{sid = 127, x = 76, y = 78, bp = 4000, item = {id = 1170, count = 3}},		--三层
	},
	
	returnArea = {sid = 8, x = 152, y = 182},	--返回区域
	
	
	--每个单位1小时，作用次数为2次，用钱购买时间就相当于购买作用次数，interval是单位时间，不用变。
	--buffType：87挂机地图 利用groupId区分各个挂机地图 (0温泉 1雷泽 2九天冰宫 3深渊烈域)
	--必须到C++里进行处理
	buff = {buffType = 87, groupId = 2, value = 0, times = 1, interval = 14400, buffName = Lang.Activity.t00216, timeOverlay = true},	--控制进入BUFF
	
	--套装兑换
	suitExchange = 
	{
		
		{
			title = Lang.Activity.t00217,	--标题
			consumes = {1153,1154,1155,1156,1157,1158,1159},	--全部消耗
			awards = 	--产出其中一个
			{
				{type = 0, id = 231, count = 1,bind=0},
				{type = 0, id = 235, count = 1,bind=0},
				{type = 0, id = 232, count = 1,bind=0},
				{type = 0, id = 242, count = 1,bind=0},
				{type = 0, id = 246, count = 1,bind=0},
				{type = 0, id = 243, count = 1,bind=0},
				{type = 0, id = 253, count = 1,bind=0},
				{type = 0, id = 257, count = 1,bind=0},
				{type = 0, id = 254, count = 1,bind=0},
			},
		},
		{
			title = Lang.Activity.t00218,	--标题
			consumes = {1160,1161,1162,1163,1164,1165},	--全部消耗
			awards = 	--产出其中一个
			{
				{type = 0, id = 233, count = 1,bind=0},
				{type = 0, id = 230, count = 1,bind=0},
				{type = 0, id = 229, count = 1,bind=0},
				{type = 0, id = 244, count = 1,bind=0},
				{type = 0, id = 241, count = 1,bind=0},
				{type = 0, id = 240, count = 1,bind=0},
				{type = 0, id = 255, count = 1,bind=0},
				{type = 0, id = 252, count = 1,bind=0},
				{type = 0, id = 251, count = 1,bind=0},
			},
		},
		{
			title = Lang.Activity.t00219,	--标题
			consumes = {1166,1167,1168,1169},	--全部消耗
			awards = 	--产出其中一个
			{
				{type = 0, id = 226, count = 1,bind=0},
				{type = 0, id = 227, count = 1,bind=0},
				{type = 0, id = 228, count = 1,bind=0},
				{type = 0, id = 234, count = 1,bind=0},
				{type = 0, id = 237, count = 1,bind=0},
				{type = 0, id = 238, count = 1,bind=0},
				{type = 0, id = 239, count = 1,bind=0},
				{type = 0, id = 245, count = 1,bind=0},
				{type = 0, id = 248, count = 1,bind=0},
				{type = 0, id = 249, count = 1,bind=0},
				{type = 0, id = 250, count = 1,bind=0},
				{type = 0, id = 256, count = 1,bind=0},
			},
		},
	},
}