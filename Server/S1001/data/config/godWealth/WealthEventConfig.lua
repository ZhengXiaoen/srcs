--财神事件的配置

--lua script
--#include "..\..\language\LangCode.txt"

WealthEventConfig =
{	
	wealthRankName = "GodWealthRank",
	wealthRankFile = "GodWealthRank.txt",

	maxRollTimes = 1000,			--最大的投骰子次数

	--每一关对应有事件的格子数量   {1,5} 对应 {第几关,格子数}
	haveEvents = 
	{
		{1,25},
		{2,30},
		{3,36},
	},
	
	--每一关的事件最大数
	maxCount = 
	{
		{{1,2},{2,5},{3,5},{4,2},{5,2},{6,2},{7,0},{8,2},{9,9},{10,1},{11,1},},
		{{1,3},{2,6},{3,5},{4,2},{5,4},{6,1},{7,0},{8,3},{9,10},{10,1},{11,1},},
		{{1,4},{2,7},{3,5},{4,2},{5,6},{6,1},{7,0},{8,4},{9,11},{10,1},{11,1},},
	},
	
	--登陆时固定的财富事件
	loginEvent = 
	{
		--{2,3}对应为{格子数，事件id}
		{2,3},
		{3,9},
		{4,4},
		{6,9},
		{8,2},
		{9,9},
		{10,8},
		{11,6},
		{13,9},
		{14,9},
		{15,1},
		{16,4},
		{17,1},
		{18,5},
		{19,11},
		{20,9},
		{21,3},
		{23,6},
		{24,2},
		{26,9},
		{28,8},
		{29,9},
		{30,2},
		{31,4},
		{32,3},
		{34,9},
	},

	--普通事件随机的概率 {1,2} 对应 {事件id，权重}
	nomalRate = {{1,1},{2,2},{3,3},{4,4},{5,3},{6,3},{8,3},{9,5},{11,3},},
	
	--惊喜事件随机的概率
	surprisedRate = {{10,2},},
	
	--每关通关的奖励
	finishAwards =
	{
		--第一关
		{
			index = 1,			--关卡的id
			awards = 
			{
				{ type = 0, id = 1585, count = 1, strong = 0, quality = 0, bind = 1, rate = 100,},
			},
		},

		--第二关
		{
			index = 2,			--关卡的id
			awards = 
			{
				{ type = 0, id = 1586, count = 1, strong = 0, quality = 0, bind = 1, rate = 100,},
			},
		},

		--第三关
		{
			index = 3,			--关卡的id
			awards = 
			{
				{ type = 0, id = 1587, count = 1, strong = 0, quality = 0, bind = 1, rate = 100,},
			},
		},
	},

	--所有事件
	events =
	{
		--恭喜发财
		{
			id = 1,									--事件id

			--	(随机获得如下奖励)  rate=20表示随机到的概率为20%
			awards = 
			{
				{ type = 7, id = 0, count = 68, strong = 0, quality = 0, bind = 0, rate = 20,},
				{ type = 7, id = 0, count = 688, strong = 0, quality = 0, bind = 0, rate = 2,},
				{ type = 7, id = 0, count = 1688, strong = 0, quality = 0, bind = 0, rate = 1,},
				{ type = 6, id = 0, count = 88888, strong = 0, quality = 0, bind = 0, rate = 40,},
				{ type = 6, id = 0, count = 888888, strong = 0, quality = 0, bind = 0, rate = 7,},
				{ type = 6, id = 0, count = 8888888, strong = 0, quality = 0, bind = 0, rate = 1,},
				{ type = 21, id = 0, count = 3888, strong = 0, quality = 0, bind = 0, rate = 25,},
				{ type = 21, id = 0, count = 38888, strong = 0, quality = 0, bind = 0, rate = 3,},
				{ type = 21, id = 0, count = 138888, strong = 0, quality = 0, bind = 0, rate = 1,},
			},
		},

		--财神福袋
		{
			id = 2,									--事件id

			--  (随机获得如下物品奖励)
			awards = 
			{
				{ type = 0, id = 280, count = 1, strong = 0, quality = 0, bind = 1,rate = 10,},
				{ type = 0, id = 704, count = 1, strong = 0, quality = 0, bind = 1,rate = 8,},
				{ type = 0, id = 777, count = 1, strong = 0, quality = 0, bind = 1,rate = 9,},
				{ type = 0, id = 778, count = 1, strong = 0, quality = 0, bind = 1,rate = 5,},
				{ type = 0, id = 779, count = 1, strong = 0, quality = 0, bind = 1,rate = 1,},
				{ type = 0, id = 787, count = 1, strong = 0, quality = 0, bind = 1,rate = 9,},
				{ type = 0, id = 788, count = 1, strong = 0, quality = 0, bind = 1,rate = 5,},
				{ type = 0, id = 789, count = 1, strong = 0, quality = 0, bind = 1,rate = 1,},
				{ type = 0, id = 354, count = 1, strong = 0, quality = 0, bind = 1,rate = 16, },
				{ type = 0, id = 1712, count = 1, strong = 0, quality = 0, bind = 1,rate = 12, },
				{ type = 0, id = 1656, count = 1, strong = 0, quality = 0, bind = 1,rate = 1, },
				{ type = 0, id = 1073, count = 1, strong = 0, quality = 0, bind = 1,rate = 9, },
				{ type = 0, id = 1075, count = 1, strong = 0, quality = 0, bind = 1,rate = 9, },
				{ type = 0, id = 379, count = 1, strong = 0, quality = 0, bind = 1,rate = 5, },
			},
		},

		--天罡霸体
		{
			id = 3,									--事件id

			--事件奖励
			awards = 
			{
				--{ type = 0, id = 575, count = 1, strong = 0, quality = 0, bind = 0 },
			},
			
			-- 随机获得如下BUFF奖励
			AddBuff = 
			{
				{buffType= 64, value=1, buffGroup= 106,times =1,interval= 1800,needDelete = true,timeOverlay = true,buffName = Lang.Activity.t00095,rate = 20,}, 
				{buffType= 6, value=0.1, buffGroup= 106,times =1,interval= 600,needDelete = true,timeOverlay = true,buffName = Lang.Activity.t00096,rate = 20,}, 
				{buffType= 8, value=0.1, buffGroup= 106,times =1,interval= 600,needDelete = true,timeOverlay = true,buffName = Lang.Activity.t00097,rate = 20,}, 
				{buffType= 23, value=100, buffGroup= 106,times =1,interval= 600,needDelete = true,timeOverlay = true,buffName = Lang.Activity.t00098,rate = 20,}, 
				{buffType= 27, value=100, buffGroup= 106,times =1,interval= 600,needDelete = true,timeOverlay = true,buffName = Lang.Activity.t00099,rate = 20,}, 
			},
		},

		--财神降临
		{
			id = 4,									--事件id

			--随机获得奖励： 
			awards = 
			{
				{ type = 0, id = 930, count = 20, strong = 0, quality = 0, bind = 1,rate = 18, },
				{ type = 0, id = 931, count = 20, strong = 0, quality = 0, bind = 1,rate = 18, },
				{ type = 0, id = 932, count = 20, strong = 0, quality = 0, bind = 1,rate = 18, },
				{ type = 0, id = 559, count = 1, strong = 0, quality = 0, bind = 1,rate = 30, },
				{ type = 0, id = 1540, count = 1, strong = 0, quality = 0, bind = 1,rate = 15, },
				{ type = 0, id = 618, count = 1, strong = 0, quality = 0, bind = 1,rate = 1,},
			},
		},

		--财神拦路
		{
			id = 5,									--事件id

			--
			awards = 
			{
				--{ type = 0, id = 575, count = 1, strong = 0, quality = 0, bind = 0 },
			},
		},

		--筋斗云
		{
			id = 6,									--事件id
			
			addNum = 3,								--向前飞的最大格数

			--事件奖励
			awards = 
			{
				--{ type = 0, id = 575, count = 1, strong = 0, quality = 0, bind = 0 },
			},
		},

		--财神宝藏
		{
			id = 7,									--事件id
			
			FbId = 2,								--财神宝藏副本id
			nSceneId = 20,							--财神宝藏的场景id
			nPosX = 14,								--进入的坐标x
			nPosY = 14,								--进入的坐标y

			--事件奖励
			awards = 
			{
				--{ type = 0, id = 575, count = 1, strong = 0, quality = 0, bind = 0 },
			},
		},

		--打道回府
		{
			id = 8,									--事件id

			--随机后退的最大格数
			rebackNum = 5,

			--事件奖励
			awards = 
			{
				--{ type = 0, id = 575, count = 1, strong = 0, quality = 0, bind = 0 },
			},
		},

		--财神任务
		{
			id = 9,									--事件id
			
			--随机获得的任务id,为任务id
			nQuestId = {8065},

			--事件奖励
			awards = 
			{
				--{ type = 0, id = 575, count = 1, strong = 0, quality = 0, bind = 0 },
			},
		},

		--天降元宝
		{
			id = 10,									--事件id
			
			--事件奖励
			awards = 
			{
				{ type = 15, id = 0, count = 8, strong = 0, quality = 0, bind = 0, rate = 80, },
				{ type = 15, id = 0, count = 18, strong = 0, quality = 0, bind = 0, rate = 10, },
				{ type = 15, id = 0, count = 38, strong = 0, quality = 0, bind = 0, rate = 6, },
				{ type = 15, id = 0, count = 88, strong = 0, quality = 0, bind = 0, rate = 3, },
				{ type = 15, id = 0, count = 888, strong = 0, quality = 0, bind = 0, rate = 1, },
			},
		},

		--翻天覆地
		{
			id = 11,								--事件id

			--事件奖励
			awards = 
			{
				--{ type = 0, id = 575, count = 1, strong = 0, quality = 0, bind = 0 },
			},
		},
	},
}
