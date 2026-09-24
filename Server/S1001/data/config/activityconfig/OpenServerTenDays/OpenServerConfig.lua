--lua script
--#include "data\language\LangCode.txt" once   --语言包

OpenServerConfig = 
{
	activitys = 
	{
		--第一天 练级狂人（鲜花）奖励：100级职业武器强化+8 x 1
		{
			openDays = 1,			--开服第一天
			rankName = "OpenServerTenDays1",			--保存的文件名称
			fileName = "OpenServerTenDays1.txt",
			minLevel = 50,				--最小等级
			columnName = 
			{
				{cName = Lang.Activity.w00073,},		--职业
				{cName = Lang.Activity.w00074,},		--姓名
				{cName = Lang.Activity.w00075,},		--转生次数
				{cName = Lang.Activity.w00076,},		--等级
				{cName = Lang.Activity.w00077,},		--经验
				{cName = Lang.Activity.w00078,},		--状态   0 还没发放奖励 1 已发放奖励
			},
			
			--主题活动的奖励(已弃用)
			awards = 
			{
				{ type = 0, id = 574, count = 1, strong = 0, quality = 0, bind = 0 },
			},
			--奖励规则1
			firstAwards = 
			{
				{ type = 0, id = 181, count = 1, strong = 8, quality = 0, bind = 0, circle = 3, job = 1},
				{ type = 0, id = 190, count = 1, strong = 8, quality = 0, bind = 0, circle = 3, job = 2},
				{ type = 0, id = 199, count = 1, strong = 8, quality = 0, bind = 0, circle = 3, job = 3},
			},

			--全民活动的奖励
			allAwards = 
			{
				{ type = 0, id = 754, count = 1, bind = 0, strong = 0, quality = 0, sex = 0}, -- 龙马精神男（12小时）
				{ type = 0, id = 755, count = 1, bind = 0, strong = 0, quality = 0, sex = 1}, -- 龙马精神女（12小时）

			},
			needValue = 1,				--全民奖励需要一转

			effectId = 1,				--鲜花的特效id
			lastTime = 60,				--鲜花持续的特效的时间 单位秒

		},

		--第二天 第一神器  添加性别
		{
			openDays = 2,			
			rankName = "OpenServerTenDays2",			
			fileName = "OpenServerTenDays2.txt",
			columnName = 
			{
				--type 1 时装 2 神器
				{cName = "type",},
				{cName = "name",},
				{cName = "shape",},
				{cName = "state",},	
			},

			awards = 
			{
				{ type = 0, id = 574, count = 1, strong = 0, quality = 0, bind = 0 },
			},

			firstAwards = 
			{
				{ type = 0, id = 182, count = 1, strong = 8, quality = 0, bind = 0, circle = 3, sex = 0, job = 1},
				{ type = 0, id = 191, count = 1, strong = 8, quality = 0, bind = 0, circle = 3, sex = 0, job = 2},
				{ type = 0, id = 200, count = 1, strong = 8, quality = 0, bind = 0, circle = 3, sex = 0, job = 3},
				{ type = 0, id = 183, count = 1, strong = 8, quality = 0, bind = 0, circle = 3, sex = 1, job = 1 },
				{ type = 0, id = 192, count = 1, strong = 8, quality = 0, bind = 0, circle = 3, sex = 1, job = 2 },
				{ type = 0, id = 201, count = 1, strong = 8, quality = 0, bind = 0, circle = 3, sex = 1, job = 3 },

			},

			--全民活动的奖励
			allAwards = 
			{
				{ type = 0, id = 416, count = 1, strong = 0, quality = 0, bind = 1 },	--中级兽魂石×1
				{ type = 0, id = 655, count = 5, strong = 0, quality = 0, bind = 1 },	--鉴宝镜×5

			},
			needValue = 10,				--全民奖励需要时装或等级达到五级

			monster =
			{
				{nSceenId=8, nMonsterID = 192, posX1 = 190, posX2 = 190,  posY = 208, nCount = 1, nLiveTime = 0,},
			},
			effectId = 1,				--鲜花的特效id
			lastTime = 60,				--鲜花持续的特效
		},

		

		--第三天 坐骑 奖励：腰带
		{
			openDays = 3,			
			rankName = "OpenServerTenDays3",			
			fileName = "OpenServerTenDays3.txt",
			columnName = 
			{
				{cName = "jop",},
				{cName = "state",},	
				{cName = "id",},
				{cName = "name",},
				{cName = "state",},
			},

			awards = 
			{
				{ type = 0, id = 574, count = 1, strong = 0, quality = 0, bind = 0 },
			},

			firstAwards = 
			{
				{ type = 0, id = 188, count = 1, strong = 8, quality = 0, bind = 0, circle = 3, job = 1 },
				{ type = 0, id = 197, count = 1, strong = 8, quality = 0, bind = 0, circle = 3, job = 2 },
				{ type = 0, id = 206, count = 1, strong = 8, quality = 0, bind = 0, circle = 3, job = 3 },
			},

			--全民活动的奖励
			allAwards = 
			{
				{ type = 0, id = 574, count = 1000, strong = 0, quality = 0, bind = 1 },	--魔晶×1000
				{ type = 0, id = 655, count = 5, strong = 0, quality = 0, bind = 1 },	--鉴宝镜×5
			},
			needValue = 4,				--全民奖励需要坐骑等级

			--结算后的奖励
			AddBuff = 
			{
				{buffType= 64, value=2, buffGroup= 106,times =1,interval= 1800,needDelete = true,timeOverlay = true,buffName = Lang.Activity.t00059,}, 
			},
			effectId = 1,				--鲜花的特效id
			lastTime = 60,				--鲜花持续的特效
		},

		

		--第四天 第一翅膀（经验Buff）奖励：宝石
		{
			openDays = 4,			
			rankName = "OpenServerTenDays4",			
			fileName = "OpenServerTenDays4.txt",
			columnName = 
			{
				{cName = "name",},	
				{cName = "swingid",},	
				{cName = "swinglevel",},
				{cName = "battle",},
				{cName = "state",},
			},

			awards = 
			{
				{ type = 0, id = 574, count = 1, strong = 0, quality = 0, bind = 0 },
			},

			firstAwards = 
			{
				{ type = 0, id = 189, count = 1, strong = 8, quality = 0, bind = 0, circle = 3, job = 1 },
				{ type = 0, id = 198, count = 1, strong = 8, quality = 0, bind = 0, circle = 3, job = 2 },
				{ type = 0, id = 207, count = 1, strong = 8, quality = 0, bind = 0, circle = 3, job = 3 },
			},
			
			--全民活动的奖励
			allAwards = 
			{
				{ type = 0, id = 402, count = 100, strong = 0, quality = 0, bind = 1 },	--法宝进阶石×100
				{ type = 0, id = 655, count = 5, strong = 0, quality = 0, bind = 1 },	--鉴宝镜×5
			},
			needValue = 286,				--全民奖励需要翅膀ID

			--结算后的奖励
			AddBuff = 
			{
				{buffType= 64, value=2, buffGroup= 106,times =1,interval= 1800,needDelete = true,timeOverlay = true,buffName = Lang.Activity.t00050,}, 
			},
			effectId = 1,				--鲜花的特效id
			lastTime = 60,				--鲜花持续的特效
		},

		--第五天 首次城主（鲜花）奖励：武器
		{
			openDays = 5,			
			rankName = "OpenServerTenDays5",			
			fileName = "OpenServerTenDays5.txt",
			columnName = 
			{
				{cName = "jop",},		
				{cName = "state",},	
				{cName = "id",},
				{cName = "name",},
			},

			awards = 
			{
				{ type = 0, id = 574, count = 1, strong = 0, quality = 0, bind = 0 },
			},

			firstAwards = 
			{
				{ type = 0, id = 184, count = 1, strong = 8, quality = 0, bind = 0, circle = 3, job = 1 },
				{ type = 0, id = 193, count = 1, strong = 8, quality = 0, bind = 0, circle = 3, job = 2 },
				{ type = 0, id = 202, count = 1, strong = 8, quality = 0, bind = 0, circle = 3, job = 3 },
			},

			--全民活动的奖励
			allAwards = 
			{
				{ type = 0, id = 655, count = 1, strong = 0, quality = 0, bind = 1 },	--鉴宝镜×5
			},
			needValue = 2,			--0 全部在线人 2普通王城成员

			effectId = 1,				--鲜花的特效id
			lastTime = 60,				--鲜花持续的特效

		},

		--第六天 第一法宝 奖励：项链
		{
			openDays = 6,			
			rankName = "OpenServerTenDays6",
			fileName = "OpenServerTenDays6.txt",
			columnName = 
			{
				{cName = "jop",},
				{cName = "state",},	
				{cName = "id",},
				{cName = "name",},
				{cName = "state",},	
			},

			awards = 
			{
				{ type = 0, id = 574, count = 1, strong = 0, quality = 0, bind = 0 },
			},

			firstAwards = 
			{
				{ type = 0, id = 185, count = 1, strong = 8, quality = 0, bind = 0, circle = 3, job = 1 },
				{ type = 0, id = 194, count = 1, strong = 8, quality = 0, bind = 0, circle = 3, job = 2 },
				{ type = 0, id = 203, count = 1, strong = 8, quality = 0, bind = 0, circle = 3, job = 3 },
			},

			--全民活动的奖励
			allAwards = 
			{
				{ type = 0, id = 336, count = 2, strong = 0, quality = 0, bind = 1 },	--完美10星符×2
				{ type = 0, id = 655, count = 5, strong = 0, quality = 0, bind = 1 },	--鉴宝镜×5
			},
			needValue = 465,				--全民奖励需要法宝的ID

			monster =
			{
				{nSceenId=8, nMonsterID = 192, posX1 = 190, posX2 = 190,  posY = 208, nCount = 1, nLiveTime = 0,},
			},
			effectId = 1,				--鲜花的特效id
			lastTime = 60,				--鲜花持续的特效
		},

		--第七天 第一佣兵 奖励：护腕
		{
			openDays = 7,			
			rankName = "OpenServerTenDays7",
			fileName = "OpenServerTenDays7.txt",
			columnName = 
			{
				{cName = "jop",},
				{cName = "state",},		
			},

			awards = 
			{
				{ type = 0, id = 574, count = 1, strong = 0, quality = 0, bind = 0 },
			},

			firstAwards = 
			{
				{ type = 0, id = 186, count = 1, strong = 8, quality = 0, bind = 0, circle = 3, job = 1 },
				{ type = 0, id = 195, count = 1, strong = 8, quality = 0, bind = 0, circle = 3, job = 2 },
				{ type = 0, id = 204, count = 1, strong = 8, quality = 0, bind = 0, circle = 3, job = 3 },
			},

			--全民活动的奖励
			allAwards = 
			{
				{ type = 0, id = 337, count = 2, strong = 0, quality = 0, bind = 1 },	--完美11星符×2
				{ type = 0, id = 655, count = 5, strong = 0, quality = 0, bind = 1 },	--鉴宝镜×5
			},
			needValue = 7,				--全民奖励需要等级


			monster =
			{
				{nSceenId=8, nMonsterID = 192, posX1 = 190, posX2 = 190,  posY = 208, nCount = 1, nLiveTime = 0,},
			},
			effectId = 1,				--鲜花的特效id
			lastTime = 60,				--鲜花持续的特效
		},

		--第八天 第一会员 奖励：靴子
		{
			openDays = 8,			
			rankName = "OpenServerTenDays8",
			fileName = "OpenServerTenDays8.txt",
			columnName = 
			{
				{cName = "jop",},
				{cName = "state",},	
				{cName = "id",},
				{cName = "name",},
				{cName = "state",},	
			},

			awards = 
			{
				{ type = 0, id = 574, count = 1, strong = 0, quality = 0, bind = 0 },
			},

			firstAwards = 
			{
				{ type = 0, id = 208, count = 2, strong = 0, quality = 0, bind = 0, job = 1 },
				{ type = 0, id = 217, count = 2, strong = 0, quality = 0, bind = 0, job = 2 },
				{ type = 0, id = 226, count = 2, strong = 0, quality = 0, bind = 0, job = 3 },
			},

			--全民活动的奖励
			allAwards = 
			{
				{ type = 5, id = 0, count = 300000000, strong = 0, quality = 0, bind = 1 },	--完美11星符×2
			},
			needValue = 5,				--全民奖励需要的等级

			monster =
			{
				{nSceenId=8, nMonsterID = 192, posX1 = 190, posX2 = 190,  posY = 208, nCount = 1, nLiveTime = 0,},
			},
			effectId = 1,				--鲜花的特效id
			lastTime = 60,				--鲜花持续的特效
		},
---------------------------------------------------------------------------------------------------------
		--第九天 鉴定宗师（经验buff）奖励：手套
		{
			openDays = 9,			
			rankName = "OpenServerTenDays9",
			fileName = "OpenServerTenDays9.txt",
			columnName = 
			{
				{cName = "jop",},	
				{cName = "state",},		
			},

			awards = 
			{
				{ type = 0, id = 574, count = 1, strong = 0, quality = 0, bind = 0 },
			},

			firstAwards = 
			{
				{ type = 0, id = 574, count = 1, strong = 0, quality = 0, bind = 0 },
				{ type = 0, id = 574, count = 1, strong = 0, quality = 0, bind = 0 },
				{ type = 0, id = 574, count = 1, strong = 0, quality = 0, bind = 0 },
			},

			--全民活动的奖励
			allAwards = 
			{
				{ type = 0, id = 969, count = 1, strong = 0, quality = 0, bind = 1 },	--五级魂石大礼包×1
			},
			needValue = 300,				--全民奖励鉴定积分达100次

			--结算后的奖励
			AddBuff = 
			{
				{buffType= 64, value=2, buffGroup= 106,times =1,interval= 1800,needDelete = true,timeOverlay = true,buffName = Lang.Activity.t00057,}, 
			},

			AuthenScroe = 1,			--消耗鉴定图标获得积分
			ClearScroe = 6,				--清洗积分
			SuoScroe = 6,				--鉴定锁消耗积分
		},

		--第十天 职业战力比拼（鲜花） 奖励：翅膀
		{
			openDays = 10,			
			rankName = "OpenServerTenDays10",
			fileName = "OpenServerTenDays10.txt",
			columnName = 
			{
				{cName = "name",},
				{cName = "jop",},
				{cName = "state",},		
			},

			awards = 
			{
				{ type = 0, id = 574, count = 1, strong = 0, quality = 0, bind = 0 },
			},

			firstAwards = 
			{
				{ type = 0, id = 574, count = 1, strong = 0, quality = 0, bind = 0 },
				{ type = 0, id = 574, count = 1, strong = 0, quality = 0, bind = 0 },
				{ type = 0, id = 574, count = 1, strong = 0, quality = 0, bind = 0 },
			},

			--全民活动的奖励
			allAwards = 
			{
				{ type = 0, id = 970, count = 1, strong = 0, quality = 0, bind = 1 },	--灵珠大礼包×1
			},
			needValue = 2000,				--全民奖励战力达3000

			effectId = 1,				--鲜花的特效id
			lastTime = 30,				--鲜花持续的特效

		},
	},
}

