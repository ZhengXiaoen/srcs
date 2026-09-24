NationalDayActivityCfg=
{
	--1登录礼包
	LoginGift = 
	{
		award = 
		{
				{type = 0, id = 507, count = 8,bind = 1},--金条(绑定)*5
				{type = 0, id = 5469, count = 5,bind = 1},--烟花*5	
				{type = 0, id = 561, count = 1,bind = 1},--天山雪莲120W*3
				{type = 0, id = 678, count = 15,bind = 1},--疗伤药*199				
				{type = 0, id = 548, count = 10,bind = 1},--战将附体令*3
				{type = 0, id = 504, count = 3,bind = 1},--赎罪药水*3
					
		}
	},
	
	--2充值礼包   w w  w .  c n   1 2 1. c o  m
	ChongZhiGift =
	{
		{
			needChongzhiYB = 1000, --一天的是累计的
			jiazhi = 5888,
			award = 
			{
				{type = 0, id = 5170, count = 1,bind = 1},--转生修为丹(小)*2
				{type = 0, id = 5469, count = 8,bind = 1},--烟花*5
				{type = 0, id = 459, count = 388,bind = 1},--神级经验玉*5
				{type = 0, id = 527, count = 2,bind = 1},--二阶宝石袋*3 
				{type = 0, id = 625, count = 1,bind = 1},--星纹强化石*388	
				{type = 0, id = 5468, count = 3,bind = 1},--万年人参*588	
		
			}
		}
	},

	--3集字活动
	JiZiActivity=
	{
		JiZiId ={5446,5447,5448,5449,5450,5451,5452},
		needCollect = 
		{
			{
				{type = 0, id = 5446, count = 1,bind = 1},
				{type = 0, id = 5447, count = 1,bind = 1},
				{type = 0, id = 5448, count = 1,bind = 1},
				{type = 0, id = 5449, count = 1,bind = 1},
			},
			{
				{type = 0, id = 5446, count = 1,bind = 1},
				{type = 0, id = 5447, count = 1,bind = 1},
				{type = 0, id = 5448, count = 1,bind = 1},
				{type = 0, id = 5449, count = 1,bind = 1},
				{type = 0, id = 5451, count = 1,bind = 1},
				{type = 0, id = 5452, count = 1,bind = 1},
			},
			{
				{type = 0, id = 5446, count = 1,bind = 1},
				{type = 0, id = 5447, count = 1,bind = 1},
				{type = 0, id = 5448, count = 1,bind = 1},
				{type = 0, id = 5449, count = 1,bind = 1},
				{type = 0, id = 5450, count = 1,bind = 1},
				{type = 0, id = 5451, count = 1,bind = 1},
				{type = 0, id = 5452, count = 1,bind = 1},
			},
		},
		award = 
		{
			{
				{type = 0, id = 5454, count = 1,bind = 1},--集字初级礼包	
			},
			{
				{type = 0, id = 5455, count = 1,bind = 1},--集字中级礼包	
			},
			{
				{type = 0, id = 5456, count = 1,bind = 1},--集字高级礼包	
			}	
		}
	},

	--4金币富翁
	JinBiFuWeng = 
	{
		rands={{1,5},{2,5},{3,5},{4,5},{5,5},{6,30},{7,40},}, --从1开始随机，有10分值1的机会随机到1,要是随机不到就到下一个
		YaoJiang={
			{
				online = 3600,	--当天累积在线时间（秒）60分钟
				canRunTime=1,	 --	
			},
			{
				online = 7200,	
				canRunTime=1,
			},
			{
				online = 10800,	
				canRunTime=1,
			},
			{
				online = 14400,	
				canRunTime=1,
			},
			{
				online = 18000,	
				canRunTime=1,
			},
			{
				online = 21600,	
				canRunTime=1,
			},
			{
				online = 25200,	
				canRunTime=1,
			},
		},
	},
	
	--5绝版称号
	OnlyTitle = {
		{
			needMoney = 9888,
			titleId =36,
		},
		{
			--需要的物品
			needItem =5469,
			needItemCount =288,--数量
			titleId =37,
		}
	},
	
	--6庆典BOSS
	NalDayActivityWangChengBoss = {
		sceneId = 10,
		bossId = 955,
		x=92,
		y=86,
        hpNocite = {90,70,50,30,20,10}, --百分比公告 
	},
	
	--新的国庆活动
	NationalDayNew = 
	{
		--第一天
		{
			needYB = 18800,
			jiazhi = 58000,
			name = "国庆活动第1天充值",
			award = 
			
				{
					{type = 0, id = 6938, count = 1,bind = 1,sex = 0},--夏威夷男	
					{type = 0, id = 6939, count = 1,bind = 1,sex = 1},--夏威夷女
				},
		
		},
		
		--第2天
		{
			needYB = 38800,
			jiazhi = 128000,
			name = "国庆活动第2天充值",
			award = 
				{
					{type = 0, id = 6651, count = 1,bind = 1,sex = 0},--春节男	
					{type = 0, id = 6652, count = 1,bind = 1,sex = 1},--春节女
				},
		
		},
		--第3天
		{
			needYB = 58800,
			jiazhi = 188000,
			name = "国庆活动第3天充值",
			award = 
				{
					{type = 0, id = 7199, count = 1,bind = 1,sex = 0},--至高直拳男	
					{type = 0, id = 7200, count = 1,bind = 1,sex = 1},--至高直拳女
				},
		
		},
		--第4天
		{
			needYB = 128000,
			jiazhi = 388000,
			name = "国庆活动第4天充值",
			award = 
				{
					{type = 0, id = 6650, count = 1,bind = 1,sex = 0},--新春幻武	
					{type = 0, id = 6650, count = 1,bind = 1,sex = 1},--新春幻武
				},
		
		},
		--第5天
		{
			needYB = 128000,
			jiazhi = 388000,
			name = "国庆活动第5天充值",
			award = 
				{
					{type = 0, id = 6940, count = 1,bind = 1,sex = 0},--大鲨鱼	
					{type = 0, id = 6940, count = 1,bind = 1,sex = 1},--大鲨鱼
				},
		
		},
		--第6天
		{
			needYB = 398000,
			jiazhi = 1280000,
			name = "国庆活动第6天充值",
			award = 
				{
					{type = 0, id = 7653, count = 1,bind = 1,sex = 0},--秦皇圣剑	
					{type = 0, id = 7653, count = 1,bind = 1,sex = 1},--秦皇圣剑
				},
		
		},
		--第7天
		{
			needYB = 398000,
			jiazhi = 1280000,
			name = "国庆活动第7天充值",
			award = 
				{
					{type = 0, id = 7654, count = 1,bind = 1,sex = 0},--绝版坐骑	
					{type = 0, id = 7654, count = 1,bind = 1,sex = 1},--绝版坐骑
				},
		
		},
	
	
	},
	

	
}