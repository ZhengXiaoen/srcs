--[[File:ResDesertCfg.lua]]


ResDesertCfg = {
	scene = 52; -- 活动场景id
	range = {10,20}; -- 入口点
	activityTime = 3600; -- 活动时间，单位：秒
	items = {
		-- id  上限        贡献
		[8] = {limit = 99, gx = 1, rankIdx = 0},
		[8] = {limit = 99, gx = 1, rankIdx = 0},		
	}; -- 活动中的物品id

	endCountdown = 30; -- 结束前多少秒开始倒计时
	CreateMonstersInterval = 120; -- 刷怪时间间隔，单位：秒
	-- 怪物
	Monsters = {
		{nMonsterID = 118, posX1 = 62, posX2 = 84,  posY = 66, nCount = 1, nLiveTime = 0,},	--角斗之王1
		{nMonsterID = 119, posX1 = 76, posX2 = 84,  posY = 66, nCount = 1, nLiveTime = 0,},	--角斗之王2
		{nMonsterID = 120, posX1 = 70, posX2 = 79,  posY = 71, nCount = 1, nLiveTime = 0,},	--角斗之王3
	};
	
	-- 有资源的时候的buff
	BUFF =
		-- 杀死采集怪，1 ~ 10 层BUFF
		-- 类型        buff的值       分组       作用的次数  作用的间隔，单位秒 时间是否叠加    名字 
		{buffType= 68, value=1000, buffGroup= 106,times =1,interval= 30, timeOverlay =true,buffName = Lang.Activity.a00029a,},
	ResRankPt =
	{
		RankName = "ResRank",
		RankFile = "ResRank.txt",
		RankColumn = 	--排行榜列标题表
		{
			{"Item1", 0}, 	--{标题, 是否客户端显示}	--物品1 id
			{"Count1", 0}, 	--{标题, 是否客户端显示}	--物品1 次数
			{"Item2", 0}, 	--{标题, 是否客户端显示}	--物品1 id
			{"Count2", 0}, 	--{标题, 是否客户端显示}	--物品1 次数

		},	
		ClinetShowCount = 0,
		ClientShow = 0,
	};
}
