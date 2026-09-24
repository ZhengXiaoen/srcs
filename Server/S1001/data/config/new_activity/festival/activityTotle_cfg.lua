--全部都写在一起，不要这么麻烦
activityTotle_cfg =
{
	--活动时间 [开始--结束(包括结束当天)]，这里填个时间，避免每次开新区时都要去后台设置一下
	time = {2018,7,13, 2018,7,15},

	-- 节日活动[每日充值]相关配置
	festival_acts_pay_money_cfg = {		
		{
			money = 1000,
			award = {
					 {type = 0, id = 6660,count = 10,bind = 1},--女娲石		
					 {type = 0, id = 6403,count = 10,bind = 1},--五行石
					 {type = 0, id = 5363,count = 5,bind = 1},--1阶宝石袋
					 {type = 0, id = 860,count = 1,bind = 1},--宝藏钥匙
			},
		},
		{
			money = 5000,
			award = {
					 {type = 0, id = 6660,count = 15,bind = 1},--女娲石		
					 {type = 0, id = 6403,count = 15,bind = 1},--五行石
					 {type = 0, id = 5363,count = 10,bind = 1},--1阶宝石袋
					 {type = 0, id = 860,count = 3,bind = 1},--宝藏钥匙
			},
		},
		{
			money = 10000,
			award = {
					 {type = 0, id = 6660,count = 32,bind = 1},--女娲石		
					 {type = 0, id = 6403,count = 30,bind = 1},--五行石
					 {type = 0, id = 860,count = 5,bind = 1},--宝藏钥匙		
					 {type = 0, id = 527,count = 1,bind = 1},--特戒结晶	
			},
		},
	
	},
	
	--在线一个小时给一个箱子
	onlineTime = 
	{
		giveId = 6863,
		maxCanGet =8,
		--展示道具，每天跨天后随机排列。
		showItem = 
		{
				509,536,570,573,538,489,542,552,6403,6217,6817,6862,6271,527,485,561,
				
		},
	},
	
	
	--消费
	consume = 
	{
		{
			money = 1000,
			award = {
					 {type = 0, id = 6731,count = 88,bind = 1},--培元丹		
					 {type = 0, id = 459,count = 88,bind = 1},--锻造石
					 {type = 0, id = 6817,count = 3,bind = 1},--峡谷召唤卷
					 {type = 0, id = 6862,count = 3,bind = 1},--坐骑丹
			},
		},
		
		{
			money = 5000,
			award = {
					 {type = 0, id = 6731,count = 188,bind = 1},--培元丹		
					 {type = 0, id = 459,count = 188,bind = 1},--锻造石
					 {type = 0, id = 6817,count = 10,bind = 1},--峡谷召唤卷
					 {type = 0, id = 6862,count = 10,bind = 1},--坐骑丹
			},
		},
		
		
		{
			money = 10000,
			award = {
					 {type = 0, id = 6731,count = 288,bind = 1},--培元丹		
					 {type = 0, id = 459,count = 288,bind = 1},--锻造石
					 {type = 0, id = 6817,count = 15,bind = 1},--峡谷召唤卷
					 {type = 0, id = 6862,count = 15,bind = 1},--坐骑丹
					 {type = 0, id = 6690,count = 1,bind = 1},--时装碎片礼盒
			},
		},
		
		{
			money = 20000,
			award = {
					 {type = 0, id = 6731,count = 388,bind = 1},--培元丹		
					 {type = 0, id = 459,count = 388,bind = 1},--锻造石
					 {type = 0, id = 6817,count = 20,bind = 1},--峡谷召唤卷
					 {type = 0, id = 6862,count = 20,bind = 1},--坐骑丹
					 {type = 0, id = 6690,count = 2,bind = 1},--时装碎片礼盒
			},
		},
	
	
	},
	
	--绝版秀
	buySomething = 
	{
		{
			money = 9888,
			award = {
				{type = 0, id = 6864, count = 1, bind = 1},--节日礼包
			},
		},
	
	}
	

}