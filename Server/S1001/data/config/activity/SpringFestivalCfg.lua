-- 春节活动
SpringFestivalCfg = 
{
	--活动时间（开始-结束(包括结束当天)）,这里的时间改了 config\dmkj\CharItemActivity.lua 这里的时间也要改
	--这里改了时间，寻宝的时间也要改
	time = {2019,2,2, 2019,2,13},
	
	--1 新春红包
	RedPacket = 
	{
		ybmin = 10, -- 红包最小元宝
		ybmax = 99, -- 红包最大元宝
		
		awardList = {

			{
				needCount = 9, -- 需要发送的红包数
				award = 
				{
					 {type = 0, id = 459,count = 888,bind = 1},--星纹强化石		
					 {type = 0, id = 464,count = 188,bind = 1},--1级羽毛
					 {type = 0, id = 536,count = 1,bind = 1},--护符碎片
					 {type = 0, id = 570,count = 1,bind = 1},--护盾碎片

				},
			},
			
			{
				needCount = 18, -- 需要发送的红包数
				award = 
				{
					 {type = 0, id = 459,count = 1888,bind = 1},--星纹强化石		
					 {type = 0, id = 464,count = 288,bind = 1},--1级羽毛
					 {type = 0, id = 536,count = 2,bind = 1},--护符碎片
					 {type = 0, id = 570,count = 2,bind = 1},--护盾碎片			
				},
			},
			
			{
				needCount = 27, -- 需要发送的红包数
				award = 
				{
					 {type = 0, id = 459,count = 2888,bind = 1},--星纹强化石		
					 {type = 0, id = 464,count = 388,bind = 1},--1级羽毛
					 {type = 0, id = 536,count = 3,bind = 1},--护符碎片
					 {type = 0, id = 570,count = 3,bind = 1},--护盾碎片				
				},
			},
			
			{
				needCount = 36, -- 需要发送的红包数
				award = 
				{
					 {type = 0, id = 459,count = 3888,bind = 1},--星纹强化石		
					 {type = 0, id = 464,count = 488,bind = 1},--1级羽毛
					 {type = 0, id = 536,count = 5,bind = 1},--护符碎片
					 {type = 0, id = 570,count = 5,bind = 1},--护盾碎片			
				},
			},
		},
	},
	
	--2 开门送礼
	LoginGift = 
	{
		-- 登陆奖励
		loginAwards = {
			-- 第1天
			{
				{type = 0, id = 561,count = 1,bind = 1},--天山雪莲120W		
				{type = 0, id = 507,count = 3,bind = 1},--金条
				{type = 0, id = 548,count = 8,bind = 1},--转生地宫证明
				{type = 0, id = 678,count = 15,bind = 1},--副本传送卷
				{type = 0, id = 81,count = 99,bind = 1},--万年人参
				{type = 0, id = 482,count = 1,bind = 1},--超级经验玉


			},
			-- 第2天
			{
				{type = 0, id = 561,count = 1,bind = 1},--天山雪莲120W		
				{type = 0, id = 507,count = 3,bind = 1},--金条
				{type = 0, id = 548,count = 8,bind = 1},--转生地宫证明
				{type = 0, id = 678,count = 15,bind = 1},--副本传送卷
				{type = 0, id = 81,count = 99,bind = 1},--万年人参
				{type = 0, id = 482,count = 1,bind = 1},--超级经验玉				
			},
			-- 第3天
			{
				{type = 0, id = 561,count = 1,bind = 1},--天山雪莲120W		
				{type = 0, id = 507,count = 3,bind = 1},--金条
				{type = 0, id = 548,count = 8,bind = 1},--转生地宫证明
				{type = 0, id = 678,count = 15,bind = 1},--副本传送卷
				{type = 0, id = 81,count = 99,bind = 1},--万年人参
				{type = 0, id = 482,count = 1,bind = 1},--超级经验玉				
			},
			-- 第4天
			{
				{type = 0, id = 561,count = 1,bind = 1},--天山雪莲120W		
				{type = 0, id = 507,count = 3,bind = 1},--金条
				{type = 0, id = 548,count = 8,bind = 1},--转生地宫证明
				{type = 0, id = 678,count = 15,bind = 1},--副本传送卷
				{type = 0, id = 81,count = 99,bind = 1},--万年人参
				{type = 0, id = 482,count = 1,bind = 1},--超级经验玉					
			},
			-- 第5天
			{
				{type = 0, id = 561,count = 1,bind = 1},--天山雪莲120W		
				{type = 0, id = 507,count = 3,bind = 1},--金条
				{type = 0, id = 548,count = 8,bind = 1},--转生地宫证明
				{type = 0, id = 678,count = 15,bind = 1},--副本传送卷
				{type = 0, id = 81,count = 99,bind = 1},--万年人参
				{type = 0, id = 482,count = 1,bind = 1},--超级经验玉				
			},
			-- 第6天
			{
				{type = 0, id = 561,count = 1,bind = 1},--天山雪莲120W		
				{type = 0, id = 507,count = 3,bind = 1},--金条
				{type = 0, id = 548,count = 8,bind = 1},--转生地宫证明
				{type = 0, id = 678,count = 15,bind = 1},--副本传送卷
				{type = 0, id = 81,count = 99,bind = 1},--万年人参
				{type = 0, id = 482,count = 1,bind = 1},--超级经验玉					
			},
			-- 第7天
			{
				{type = 0, id = 561,count = 1,bind = 1},--天山雪莲120W		
				{type = 0, id = 507,count = 3,bind = 1},--金条
				{type = 0, id = 548,count = 8,bind = 1},--转生地宫证明
				{type = 0, id = 678,count = 15,bind = 1},--副本传送卷
				{type = 0, id = 81,count = 99,bind = 1},--万年人参
				{type = 0, id = 482,count = 1,bind = 1},--超级经验玉				
			},
			-- 第8天
			{
				{type = 0, id = 561,count = 1,bind = 1},--天山雪莲120W		
				{type = 0, id = 507,count = 3,bind = 1},--金条
				{type = 0, id = 548,count = 8,bind = 1},--转生地宫证明
				{type = 0, id = 678,count = 15,bind = 1},--副本传送卷
				{type = 0, id = 81,count = 99,bind = 1},--万年人参
				{type = 0, id = 482,count = 1,bind = 1},--超级经验玉						
			},
			-- 第9天
			{
				{type = 0, id = 561,count = 1,bind = 1},--天山雪莲120W		
				{type = 0, id = 507,count = 3,bind = 1},--金条
				{type = 0, id = 548,count = 8,bind = 1},--转生地宫证明
				{type = 0, id = 678,count = 15,bind = 1},--副本传送卷
				{type = 0, id = 81,count = 99,bind = 1},--万年人参
				{type = 0, id = 482,count = 1,bind = 1},--超级经验玉					
			},
			-- 第10天
			{
				{type = 0, id = 561,count = 1,bind = 1},--天山雪莲120W		
				{type = 0, id = 507,count = 3,bind = 1},--金条
				{type = 0, id = 548,count = 8,bind = 1},--转生地宫证明
				{type = 0, id = 678,count = 15,bind = 1},--副本传送卷
				{type = 0, id = 81,count = 99,bind = 1},--万年人参
				{type = 0, id = 482,count = 1,bind = 1},--超级经验玉				
			},
			-- 第11天
			{
				{type = 0, id = 561,count = 1,bind = 1},--天山雪莲120W		
				{type = 0, id = 507,count = 3,bind = 1},--金条
				{type = 0, id = 548,count = 8,bind = 1},--转生地宫证明
				{type = 0, id = 678,count = 15,bind = 1},--副本传送卷
				{type = 0, id = 81,count = 99,bind = 1},--万年人参
				{type = 0, id = 482,count = 1,bind = 1},--超级经验玉					
			},
			-- 第12天
			{
				{type = 0, id = 561,count = 1,bind = 1},--天山雪莲120W		
				{type = 0, id = 507,count = 3,bind = 1},--金条
				{type = 0, id = 548,count = 8,bind = 1},--转生地宫证明
				{type = 0, id = 678,count = 15,bind = 1},--副本传送卷
				{type = 0, id = 81,count = 99,bind = 1},--万年人参
				{type = 0, id = 482,count = 1,bind = 1},--超级经验玉					
			},
		},
		
		-- 累计登陆奖励
		addupLoginAwards = {			
			{
				needCount = 3, -- 需要登陆天数
				award = 
				{
					 {type = 0, id = 6371,count = 1,bind = 1},--幻羽礼盒	
					 {type = 0, id = 6657,count = 1,bind = 1},--时装礼盒	
					 {type = 0, id = 538,count = 3,bind = 1},--宝石碎片	
					 {type = 0, id = 573,count = 3,bind = 1},--圣珠碎片					
				},
			},
			
			{
				needCount = 6, -- 需要登陆天数
				award = 
				{
					 {type = 0, id = 6658,count = 1,bind = 1},--灵器礼盒
					 {type = 0, id = 7043,count = 1,bind = 1},--足迹礼盒
					 {type = 0, id = 538,count = 5,bind = 1},--宝石碎片	
					 {type = 0, id = 573,count = 5,bind = 1},--圣珠碎片		
				},
			},
			
			{
				needCount = 9, -- 需要登陆天数
				award = 
				{
					 {type = 0, id = 6659,count = 1,bind = 1},--传世礼盒	
					 {type = 0, id = 7651,count = 1,bind = 1},--雷神礼盒	
					 {type = 0, id = 538,count = 7,bind = 1},--宝石碎片	
					 {type = 0, id = 573,count = 7,bind = 1},--圣珠碎片					
				},
			},
			
			{
				needCount = 12, -- 需要登陆天数
				award = 
				{
					 {type = 0, id = 7051,count = 1,bind = 1},--三国礼盒	
					 {type = 0, id = 7047,count = 1,bind = 1},--坐骑礼盒	
					 {type = 0, id = 538,count = 10,bind = 1},--宝石碎片	
					 {type = 0, id = 573,count = 10,bind = 1},--圣珠碎片						
				},
			},
		},
	},
	
	--3 春节年兽
	Monsters = {
		sceneId = 629,
		enterX = 29,
		enterY = 72,
		
		-- liveTime 生存时间（秒），0为无限
		monsterList = {
			{monsterId = 1261, x1=17, y1=50, x2 = 30, y2 = 59, count = 1, liveTime = 18000},	
			{monsterId = 1262, x1=22, y1=71, x2 = 39, y2 = 82, count = 1, liveTime = 18000},
			{monsterId = 1263, x1=35, y1=96, x2 = 49, y2 = 111, count = 1, liveTime = 18000},
			{monsterId = 1264, x1=68, y1=101, x2 = 102, y2 = 115, count = 1, liveTime = 18000},
			{monsterId = 1265, x1=76, y1=46, x2 = 94, y2 = 62, count = 1, liveTime = 18000},			
		},
	},
	
	-- 4 新春集字
	-- 新春集字 用原来的 config\dmkj\CharItemActivity.lua
	
	-- 5 绝版年货
	goods = {
		isOpen = false, -- 已下架

		itemList = {
			{itemId = 7821, count = 1, bind = 1, yb = 6888},
			{itemId = 7822, count = 1, bind = 1, yb = 19888},
			{itemId = 7823, count = 1, bind = 1, sex = 0, yb = 12888},
			{itemId = 7824, count = 1, bind = 1, sex = 1, yb = 12888},
		}
	},
	
	-- 6 守岁礼包
	shousui =
    {
        isOpen = false, -- 守岁礼包已下架
        money = 18888, --奖金池
    },
	-- 7 新春寻宝
	xunbao =  --前端展示用的
	{			
		QingDianXunBaoB = --时装庆典寻宝
		{
			 
			{
				{type = 0, id = 5949, count = 1,bind = 1,job = 1},--战士9转武器
				{type = 0, id = 5657, count = 1,bind = 1,job = 1},--战士9转衣服
				{type = 0, id = 5658, count = 1,bind = 1,job = 1},--战士9转靴子
			},

		
			{
				{type = 0, id = 5949, count = 1,bind = 1,job = 1},--战士9转武器
				{type = 0, id = 5657, count = 1,bind = 1,job = 1},--战士9转衣服
				{type = 0, id = 5658, count = 1,bind = 1,job = 1},--战士9转靴子
			},

	
			{
				{type = 0, id = 5949, count = 1,bind = 1,job = 1},--战士9转武器
				{type = 0, id = 5657, count = 1,bind = 1,job = 1},--战士9转衣服
				{type = 0, id = 5658, count = 1,bind = 1,job = 1},--战士9转靴子
			},
		},
		
		QingDianXunBaoC = --龍装庆典寻宝
		{
			 
			{
				{type = 0, id = 5969, count = 1,bind = 1,job = 1},--战士9转武器
				{type = 0, id = 5970, count = 1,bind = 1,job = 1},--战士9转衣服
				{type = 0, id = 5971, count = 1,bind = 1,job = 1},--战士9转靴子
			},

		
			{
				{type = 0, id = 5969, count = 1,bind = 1,job = 2},--战士9转武器
				{type = 0, id = 5970, count = 1,bind = 1,job = 2},--战士9转衣服
				{type = 0, id = 5971, count = 1,bind = 1,job = 2},--战士9转靴子
			},

	
			{
				{type = 0, id = 5969, count = 1,bind = 1,job = 3},--战士9转武器
				{type = 0, id = 5970, count = 1,bind = 1,job = 3},--战士9转衣服	
				{type = 0, id = 5971, count = 1,bind = 1,job = 3},--战士9转靴子
			},
		},

		QingDianXunBaoD = --法宝庆典寻宝
		{
			 
			{
				{type = 0, id = 6247, count = 1,bind = 1,job = 1},--阴阳镜
				{type = 0, id = 6248, count = 1,bind = 1,job = 1},--祝融剑
				{type = 0, id = 6249, count = 1,bind = 1,job = 1},--火凤幡
			},

		
			{
				{type = 0, id = 6247, count = 1,bind = 1,job = 1},--阴阳镜
				{type = 0, id = 6248, count = 1,bind = 1,job = 1},--祝融剑
				{type = 0, id = 6249, count = 1,bind = 1,job = 1},--火凤幡
			},

	
			{
				{type = 0, id = 6247, count = 1,bind = 1,job = 1},--阴阳镜
				{type = 0, id = 6248, count = 1,bind = 1,job = 1},--祝融剑
				{type = 0, id = 6249, count = 1,bind = 1,job = 1},--火凤幡
			},
		},

		QingDianXunBaoE = --传世庆典寻宝
		{
			 
			{
				{type = 0, id = 6393, count = 1,bind = 1,job = 1},--传世衣服
				{type = 0, id = 6396, count = 1,bind = 1,job = 1},--头盔
				{type = 0, id = 6402, count = 1,bind = 1,job = 1},--宝钻
			},

		
			{
				{type = 0, id = 6393, count = 1,bind = 1,job = 1},--传世衣服
				{type = 0, id = 6396, count = 1,bind = 1,job = 1},--头盔
				{type = 0, id = 6402, count = 1,bind = 1,job = 1},--宝钻
			},

	
			{
				{type = 0, id = 6393, count = 1,bind = 1,job = 1},--传世衣服
				{type = 0, id = 6396, count = 1,bind = 1,job = 1},--头盔
				{type = 0, id = 6402, count = 1,bind = 1,job = 1},--宝钻
			},
		},
	
	
	
	},
	
	-- 8 新春充值
	payMoney = 
	{
		-- 每日充值奖励
		payAwards = {			
			{
				payCount = 1000, -- 需要充值元宝
				award = 
				{
					 {type = 0, id = 6660,count = 20,bind = 1},--女娲石		
					 {type = 0, id = 6403,count = 20,bind = 1},--五行石
					 {type = 0, id = 5363,count = 10,bind = 1},--1阶宝石袋
					 {type = 0, id = 81,count = 288,bind = 1},--万年人参
					 {type = 0, id = 860,count = 2,bind = 1},--宝藏钥匙


				},
			},
			
			{
				payCount = 10000, -- 需要充值元宝
				award = 
				{
					 {type = 0, id = 6660,count = 40,bind = 1},--女娲石		
					 {type = 0, id = 6403,count = 40,bind = 1},--五行石
					 {type = 0, id = 5363,count = 15,bind = 1},--1阶宝石袋
					 {type = 0, id = 860,count = 5,bind = 1},--宝藏钥匙		
					 {type = 0, id = 527,count = 1,bind = 1},--特戒结晶	
				},
			},			
		
		},
	},
	
	--9限时抢购
	XianShiQiangGou ={
		--第一天
		{
			--物品1
			{
			name = "火龙限购礼包",
			yuanJia =3800,
			needMoney =1588,
			canBuyTime = 1, -- 购买次数
			award={
				{type = 0, id = 7194, count = 38,bind = 1,txt="庆典第1天火龙1档"},--火龙结晶 38
				  },
			},
			--物品2
			{
			name = "宝石限购礼包",
			yuanJia =3800,
			needMoney =1288,
			canBuyTime = 1,
			award={
				{type = 0, id = 537, count = 38,bind = 1,txt="庆典第1天宝石结晶1档"},--宝石结晶*3800
				  },
			},
			--物品3
			{
			name = "圣珠限购礼包",
			yuanJia =3800,
			needMoney =1288,
			canBuyTime = 1,
			award={
				{type = 0, id = 572, count = 38,bind = 1,txt="庆典第1天圣珠结晶1档"},--圣珠结晶*3800
				  },
			},
			--------------------------------------------------------------------------------买完一个商品，对应位置商品跳转到下一档
			
			--物品4
			{
			txt ="商城无出售",
			name = "火龙限购礼包",
			yuanJia =0,
			needMoney =8588,
			canBuyTime = 1, -- 购买次数
			award={
				{type = 0, id = 7195, count = 18,bind = 1,txt="庆典第1天火龙2档"},--火龙中 *18
				  },
			},
			--物品5
			{
			name = "宝石限购礼包",
			yuanJia =17600,
			needMoney =7688,
			canBuyTime = 1,
			award={
				{type = 0, id = 537, count = 176,bind = 1,txt="庆典第1天宝石2档"},--宝石结晶*17600
				  },
			},
			--物品6
			{
			name = "圣珠限购礼包",
			yuanJia =17600,
			needMoney =7688,
			canBuyTime = 1,
			award={
				{type = 0, id = 572, count = 176,bind = 1,txt="庆典第1天圣珠2档"},--圣珠结晶*17600
				  },
			},
			
			------------------------------------------------------------------------------买完一个商品，对应位置商品跳转到下一档
			--物品7
			{
			txt ="商城无出售",
			name = "羽毛限购礼包",
			yuanJia =0,
			needMoney =12588,
			canBuyTime = 1, -- 购买次数
			award={
				{type = 0, id = 7195, count = 28,bind = 1,txt="庆典第1天火龙3档"},--火龙中*28
				  },
			},
			--物品8
			{
			name = "宝石限购礼包",
			yuanJia =27500,
			needMoney =12588,
			canBuyTime = 1,
			award={
				{type = 0, id = 537, count = 275,bind = 1,txt="庆典第1天宝石3档"},--宝石结晶*27500
				  },
			},
			--物品9
			{
			name = "圣珠限购礼包",
			yuanJia =27500,
			needMoney =12588,
			canBuyTime = 1,
			award={
				{type = 0, id = 572, count = 275,bind = 1,txt="庆典第1天圣珠3档"},--圣珠结晶*27500
				  },
			},
			
		},
		--第二天
		{
			--------------------------------------------------------------------------------
			--物品1
			{
			name = "羽毛限购礼包",
			yuanJia =3800,
			needMoney =1288,
			canBuyTime = 1,
			award={
				{type = 0, id = 465, count = 128,bind = 1,txt="庆典第2天羽毛1档"},--2级羽毛*128
				  },
			},
			--物品2
			{
			name = "成就限购令牌",
			yuanJia =4000,
			needMoney =1288,
			canBuyTime = 1,
			award={
				{type = 0, id = 489, count = 4,bind = 1,txt="庆典第2天成就1档"},--成就令牌(中)*4
				  },
			},
			--物品3
			{
			txt ="商城无出售",
			name = "神魂限购礼包",
			yuanJia =0,
			needMoney =1588,
			canBuyTime = 1,
			award={
				{type = 0, id = 5171, count = 258,bind = 1,txt="庆典第2天神魂1档"},--神魂*258
				  },
			},
			--------------------------------------------------------------------------------买完一个商品，对应位置商品跳转到下一档
			
			--物品4
			{
			name = "羽毛限购礼包",
			yuanJia =18000,
			needMoney =7688,
			canBuyTime = 1,
			award={
				{type = 0, id = 465, count = 600,bind = 1,txt="庆典第2天羽毛2档"},--2级羽毛*600
				  },
			},
			--物品5
			{
			name = "成就限购令牌",
			yuanJia =19600,
			needMoney =7688,
			canBuyTime = 1,
			award={
				{type = 0, id = 490, count = 2,bind = 1,txt="庆典第2天成就2档"},--成就令牌(大)*2
				  },
			},
			--物品6
			{
			txt ="商城无出售",
			name = "神魂限购礼包",
			yuanJia =0,
			needMoney =8588,
			canBuyTime = 1,
			award={
				{type = 0, id = 5171, count = 1188,bind = 1,txt="庆典第2天神魂2档"},--神魂*1188
				  },
			},
			
			-------------------------------------------------------------------------------买完一个商品，对应位置商品跳转到下一档
			
			
			--物品7
			{
			name = "羽毛限购礼包",
			yuanJia =18000,
			needMoney =11888,
			canBuyTime = 1,
			award={
				{type = 0, id = 465, count = 900,bind = 1,txt="庆典第2天羽毛3档"},--2级羽毛*900
				  },
			},
			--物品8
			{
			name = "成就限购令牌",
			yuanJia =29400,
			needMoney =11888,
			canBuyTime = 1,
			award={
				{type = 0, id = 490, count = 3,bind = 1,txt="庆典第2天成就3档"},--成就令牌(大)*3
				  },
			},
			--物品9
			{
			txt ="商城无出售",
			name = "神魂限购礼包",
			yuanJia =0,
			needMoney =11888,
			canBuyTime = 1,
			award={
				{type = 0, id = 5171, count = 1888,bind = 1,txt="庆典第2天神魂3档"},--神魂*1188
				  },
			},
		},
		--第三天
		{
			--物品1
			{
			name = "羽毛限购礼包",
			yuanJia =4000,
			needMoney =1288,
			canBuyTime = 1,
			award={
				{type = 0, id = 466, count = 45,bind = 1,txt="庆典第3天羽毛1档"},--3级羽毛*45
				  },
			},
			--物品2
			{
			txt ="商城无出售",
			name = "镶嵌限购礼包",
			yuanJia =0,
			needMoney =1588,
			canBuyTime = 1,
			award={
				{type = 0, id = 5364, count = 7,bind = 1,txt="庆典第3天宝石袋1档"},--2阶宝石袋*7
				  },
			},
			--物品3
			{
			name = "特戒限购礼包",
			yuanJia =8000,
			needMoney =3388,
			canBuyTime = 1,
			award={
				{type = 0, id = 527, count = 8,bind = 1,txt="庆典第3天特戒1档"},--特戒结晶*6
				  },
			},
			
			--物品4---------------第二档
			{
			name = "羽毛限购礼包",
			yuanJia =18000,
			needMoney =7688,
			canBuyTime = 1,
			award={
				{type = 0, id = 466, count = 200,bind = 1,txt="庆典第3天羽毛2档"},--3级羽毛*200
				  },
			},
			--物品5
			{
			txt ="商城无出售",
			name = "镶嵌限购礼包",
			yuanJia =0,
			needMoney =8588,
			canBuyTime = 1,
			award={
				{type = 0, id = 5364, count = 30,bind = 1,txt="庆典第3天宝石袋2档"},--2阶宝石袋*30
				  },
			},
			--物品6
			{
			name = "特戒限购礼包",
			yuanJia =27000,
			needMoney =11588,
			canBuyTime = 1,
			award={
				{type = 0, id = 527, count = 27,bind = 1,txt="庆典第3天特戒2档"},--特戒结晶*27
				  },
			},
			
			--物品7---------------第三档
			{
			name = "羽毛限购礼包",
			yuanJia =27900,
			needMoney =11888,
			canBuyTime = 1,
			award={
				{type = 0, id = 466, count = 310,bind = 1,txt="庆典第3天羽毛3档"},--3级羽毛*310
				  },
			},
			--物品8
			{
			txt ="商城无出售",
			name = "镶嵌限购礼包",
			yuanJia =0,
			needMoney =12888,
			canBuyTime = 1,
			award={
				{type = 0, id = 5364, count = 48,bind = 1,txt="庆典第3天宝石袋3档"},--2阶宝石袋*48
				  },
			},
			--物品9
			{
			name = "特戒限购礼包",
			yuanJia =39000,
			needMoney =16888,
			canBuyTime = 1,
			award={
				{type = 0, id = 527, count = 39,bind = 1,txt="庆典第3天特戒3档"},--特戒结晶*39
				  },
			},
		},
		--第四天
		{
			--------------------------------------------------------------------------------
			--物品1
			{
			txt ="商城无出售",
			name = "注魂限购礼包",
			yuanJia =0,
			needMoney =1900,
			canBuyTime = 1,
			award={
				{type = 0, id = 6372, count = 3,bind = 1,txt="庆典第4天注魂1档"},
				  },
			},
			--物品2
			{
			name = "元神限购礼包",
			yuanJia =3000,
			needMoney =1588,
			canBuyTime = 1,
			award={
				{type = 0, id = 6297, count = 3,bind = 1,txt="庆典第4天元神1档"},
				  },
			},
			--物品3
			{
			name = "斗笠限购礼包",
			yuanJia =3000,
			needMoney =1588,
			canBuyTime = 1,
			award={
				{type = 0, id = 5646, count = 3,bind = 1,txt="庆典第4天斗笠1档"},
				  },
			},
			--------------------------------------------------------------------------------买完一个商品，对应位置商品跳转到下一档
			
			--物品4
			{
			txt ="商城无出售",
			name = "注魂限购礼包",
			yuanJia =0,
			needMoney =6700,
			canBuyTime = 1,
			award={
				{type = 0, id = 6373, count = 1,bind = 1,txt="庆典第4天注魂2档"},--2级羽毛*600
				  },
			},
			--物品5
			{
			name = "元神限购礼包",
			yuanJia =10000,
			needMoney =6588,
			canBuyTime = 1,
			award={
				{type = 0, id = 6298, count = 1,bind = 1,txt="庆典第4天元神2档"},--神魂*1188
				  },
			},
			--物品6
			{
			name = "斗笠限购礼包",
			yuanJia =10000,
			needMoney =6588,
			canBuyTime = 1,
			award={
				{type = 0, id = 5647, count = 1,bind = 1,txt="庆典第4天斗笠2档"},--神魂*1188
				  },
			},
			
			-------------------------------------------------------------------------------买完一个商品，对应位置商品跳转到下一档
			
			
			--物品7
			{
			txt ="商城无出售",
			name = "注魂限购礼包",
			yuanJia =0,
			needMoney =20000,
			canBuyTime = 1,
			award={
				{type = 0, id = 6373, count = 3,bind = 1,txt="庆典第4天注魂3档"},--2级羽毛*900
				  },
			},
			--物品8
			{
			name = "元神限购礼包",
			yuanJia =30000,
			needMoney =18888,
			canBuyTime = 1,
			award={
				{type = 0, id = 6298, count = 3,bind = 1,txt="庆典第4天元神3档"},--成就令牌(大)*3
				  },
			},
			--物品9
			{
			name = "斗笠限购礼包",
			yuanJia =30000,
			needMoney =18888,
			canBuyTime = 1,
			award={
				{type = 0, id = 5647, count = 3,bind = 1,txt="庆典第4天斗笠3档"},--神魂*1188
				  },
			},
		},
		--第五天
		{
			--------------------------------------------------------------------------------
			--物品1
			{
			txt ="商城无出售",
			name = "注魂限购礼包",
			yuanJia =0,
			needMoney =1900,
			canBuyTime = 1,
			award={
				{type = 0, id = 6372, count = 3,bind = 1,txt="庆典第5天注魂1档"},
				  },
			},
			--物品2
			{
			name = "元神限购礼包",
			yuanJia =3000,
			needMoney =1588,
			canBuyTime = 1,
			award={
				{type = 0, id = 6297, count = 3,bind = 1,txt="庆典第5天元神1档"},
				  },
			},
			--物品3
			{
			txt ="商城无出售",
			name = "火龙限购礼包",
			yuanJia =0,
			needMoney =1688,
			canBuyTime = 1,
			award={
				{type = 0, id = 7195, count = 3,bind = 1,txt="庆典第5天火龙1档"},
				  },
			},
			--------------------------------------------------------------------------------买完一个商品，对应位置商品跳转到下一档
			
			--物品4
			{
			txt ="商城无出售",
			name = "注魂限购礼包",
			yuanJia =0,
			needMoney =6700,
			canBuyTime = 1,
			award={
				{type = 0, id = 6373, count = 1,bind = 1,txt="庆典第5天注魂2档"},--2级羽毛*600
				  },
			},
			--物品5
			{
			name = "元神限购礼包",
			yuanJia =10000,
			needMoney =6388,
			canBuyTime = 1,
			award={
				{type = 0, id = 6298, count = 1,bind = 1,txt="庆典第5天元神2档"},--神魂*1188
				  },
			},
			--物品6
			{
			txt ="商城无出售",
			name = "火龙限购礼包",
			yuanJia =0,
			needMoney =6588,
			canBuyTime = 1,
			award={
				{type = 0, id = 7196, count = 1,bind = 1,txt="庆典第5天火龙2档"},--神魂*1188
				  },
			},
			
			-------------------------------------------------------------------------------买完一个商品，对应位置商品跳转到下一档
			
			
			--物品7
			{
			txt ="商城无出售",
			name = "注魂限购礼包",
			yuanJia =0,
			needMoney =19888,
			canBuyTime = 1,
			award={
				{type = 0, id = 6373, count = 3,bind = 1,txt="庆典第5天注魂3档"},--2级羽毛*900
				  },
			},
			--物品8
			{
			name = "元神限购礼包",
			yuanJia =30000,
			needMoney =18888,
			canBuyTime = 1,
			award={
				{type = 0, id = 6298, count = 3,bind = 1,txt="庆典第5天元神3档"},--成就令牌(大)*3
				  },
			},
			--物品9
			{
			txt ="商城无出售",
			name = "火龙限购礼包",
			yuanJia =0,
			needMoney =18888,
			canBuyTime = 1,
			award={
				{type = 0, id = 7196, count = 3,bind = 1,txt="庆典第5天火龙3档"},--神魂*1188
				  },
			},
		},	


		--第六天
		{
			--------------------------------------------------------------------------------
			--物品1
			{
			name = "潜能限购礼包",
			yuanJia =3000,
			needMoney =1588,
			canBuyTime = 1,
			award={
				{type = 0, id = 7064, count = 3,bind = 1,txt="庆典第6天潜能1档"},--潜能
				  },
			},
			--物品2
			{
			name = "血炼限购礼包",
			yuanJia =3000,
			needMoney =1588,
			canBuyTime = 1,
			award={
				{type = 0, id = 6915, count = 3,bind = 1,txt="庆典第6天血炼1档"},--血炼
				  },
			},
			--物品3
			{
			txt ="商城无出售",
			name = "镶嵌限购礼包",
			yuanJia =0,
			needMoney =1688,
			canBuyTime = 1,
			award={
				{type = 0, id = 5364, count = 7,bind = 1,txt="庆典第6天宝石袋1档"},--2阶宝石袋*7
				  },
			},
			--------------------------------------------------------------------------------买完一个商品，对应位置商品跳转到下一档
			
			--物品4
			{
			name = "潜能限购礼包",
			yuanJia =10000,
			needMoney =6388,
			canBuyTime = 1,
			award={
				{type = 0, id = 7065, count = 1,bind = 1,txt="庆典第6天潜能2档"},--潜能
				  },
			},
			--物品5
			{
			name = "血炼限购礼包",
			yuanJia =10000,
			needMoney =6388,
			canBuyTime = 1,
			award={
				{type = 0, id = 6916, count = 1,bind = 1,txt="庆典第6天血炼2档"},--血炼
				  },
			},
			--物品6
			{
			txt ="商城无出售",
			name = "镶嵌限购礼包",
			yuanJia =0,
			needMoney =8588,
			canBuyTime = 1,
			award={
				{type = 0, id = 5364, count = 30,bind = 1,txt="庆典第6天宝石袋2档"},--2阶宝石袋*30
				  },
			},
			
			-------------------------------------------------------------------------------买完一个商品，对应位置商品跳转到下一档
			
			
			--物品7
			{
			name = "潜能限购礼包",
			yuanJia =30000,
			needMoney =18888,
			canBuyTime = 1,
			award={
				{type = 0, id = 7065, count = 3,bind = 1,txt="庆典第6天潜能3档"},--潜能
				  },
			},
			--物品8
			{
			name = "血炼限购礼包",
			yuanJia =30000,
			needMoney =18888,
			canBuyTime = 1,
			award={
				{type = 0, id = 6916, count = 3,bind = 1,txt="庆典第6天血炼3档"},--血炼
				  },
			},
			--物品9
			{
			txt ="商城无出售",
			name = "镶嵌限购礼包",
			yuanJia =0,
			needMoney =12888,
			canBuyTime = 1,
			award={
				{type = 0, id = 5364, count = 48,bind = 1,txt="庆典第6天宝石袋3档"},--2阶宝石袋*48
				  },
			},
		},	
		--第七天
		{
			--------------------------------------------------------------------------------
			--物品1
			{
			name = "戒灵限购礼包",
			yuanJia =6000,
			needMoney =3388,
			canBuyTime = 1,
			award={
				{type = 0, id = 7619, count = 6,bind = 1,txt="庆典第7天戒灵1档"},
				  },
			},
			--物品2
			{
			name = "特戒限购礼包",
			yuanJia =8000,
			needMoney =3488,
			canBuyTime = 1,
			award={
				{type = 0, id = 527, count = 8,bind = 1,txt="庆典第7天特戒1档"},--特戒结晶*6
				  },
			},
			--物品3
			{
			name = "斗笠限购礼包",
			yuanJia =3000,
			needMoney =1588,
			canBuyTime = 1,
			award={
				{type = 0, id = 5646, count = 3,bind = 1,txt="庆典第7天斗笠1档"},
				  },
			},
			--------------------------------------------------------------------------------买完一个商品，对应位置商品跳转到下一档
			
			--物品4
			{
			name = "戒灵限购礼包",
			yuanJia =20000,
			needMoney =13588,
			canBuyTime = 1,
			award={
				{type = 0, id = 7620, count = 2,bind = 1,txt="庆典第7天戒灵2档"},
				  },
			},
			--物品5
			{
			name = "特戒限购礼包",
			yuanJia =27000,
			needMoney =11588,
			canBuyTime = 1,
			award={
				{type = 0, id = 527, count = 27,bind = 1,txt="庆典第7天特戒2档"},--特戒结晶*27
				  },
			},
			--物品6
			{
			name = "斗笠限购礼包",
			yuanJia =20000,
			needMoney =11588,
			canBuyTime = 1,
			award={
				{type = 0, id = 5647, count = 2,bind = 1,txt="庆典第7天斗笠2档"},
				  },
			},
			
			-------------------------------------------------------------------------------买完一个商品，对应位置商品跳转到下一档
			
			
			--物品7
			{
			name = "戒灵限购礼包",
			yuanJia =60000,
			needMoney =38888,
			canBuyTime = 1,
			award={
				{type = 0, id = 7620, count = 6,bind = 1,txt="庆典第7天戒灵3档"},--神魂*1188
				  },
			},
			--物品8
			{
			name = "特戒限购礼包",
			yuanJia =39000,
			needMoney =16888,
			canBuyTime = 1,
			award={
				{type = 0, id = 527, count = 39,bind = 1,txt="庆典第7天特戒3档"},--特戒结晶*39
				  },
			},
			--物品9
			{
			name = "斗笠限购礼包",
			yuanJia =30000,
			needMoney =18888,
			canBuyTime = 1,
			award={
				{type = 0, id = 5647, count = 3,bind = 1,txt="庆典第7天斗笠3档"},--神魂*1188
				  },
			},
		},	

		--第八天
		{
			--------------------------------------------------------------------------------
			--物品1
			{
			txt ="商城无出售",
			name = "注魂限购礼包",
			yuanJia =0,
			needMoney =1900,
			canBuyTime = 1,
			award={
				{type = 0, id = 6372, count = 3,bind = 1,txt="庆典第8天注魂1档"},
				  },
			},
			--物品2
			{
			name = "元神限购礼包",
			yuanJia =3000,
			needMoney =1588,
			canBuyTime = 1,
			award={
				{type = 0, id = 6297, count = 3,bind = 1,txt="庆典第8天元神1档"},
				  },
			},
			--物品3
			{
			txt ="商城无出售",
			name = "火龙限购礼包",
			yuanJia =0,
			needMoney =1688,
			canBuyTime = 1,
			award={
				{type = 0, id = 7195, count = 3,bind = 1,txt="庆典第8天火龙1档"},
				  },
			},
			--------------------------------------------------------------------------------买完一个商品，对应位置商品跳转到下一档
			
			--物品4
			{
			txt ="商城无出售",
			name = "注魂限购礼包",
			yuanJia =0,
			needMoney =6700,
			canBuyTime = 1,
			award={
				{type = 0, id = 6373, count = 1,bind = 1,txt="庆典第8天注魂2档"},--2级羽毛*600
				  },
			},
			--物品5
			{
			name = "元神限购礼包",
			yuanJia =10000,
			needMoney =6388,
			canBuyTime = 1,
			award={
				{type = 0, id = 6298, count = 1,bind = 1,txt="庆典第8天元神2档"},--神魂*1188
				  },
			},
			--物品6
			{
			txt ="商城无出售",
			name = "火龙限购礼包",
			yuanJia =0,
			needMoney =6588,
			canBuyTime = 1,
			award={
				{type = 0, id = 7196, count = 1,bind = 1,txt="庆典第8天火龙2档"},--神魂*1188
				  },
			},
			
			-------------------------------------------------------------------------------买完一个商品，对应位置商品跳转到下一档
			
			
			--物品7
			{
			txt ="商城无出售",
			name = "注魂限购礼包",
			yuanJia =0,
			needMoney =19888,
			canBuyTime = 1,
			award={
				{type = 0, id = 6373, count = 3,bind = 1,txt="庆典第8天注魂3档"},--2级羽毛*900
				  },
			},
			--物品8
			{
			name = "元神限购礼包",
			yuanJia =30000,
			needMoney =18888,
			canBuyTime = 1,
			award={
				{type = 0, id = 6298, count = 3,bind = 1,txt="庆典第8天元神3档"},--成就令牌(大)*3
				  },
			},
			--物品9
			{
			txt ="商城无出售",
			name = "火龙限购礼包",
			yuanJia =0,
			needMoney =18888,
			canBuyTime = 1,
			award={
				{type = 0, id = 7196, count = 3,bind = 1,txt="庆典第8天火龙3档"},--神魂*1188
				  },
			},
		},	

		--第九天
		{
			--物品1
			{
			name = "羽毛限购礼包",
			yuanJia =4000,
			needMoney =1288,
			canBuyTime = 1,
			award={
				{type = 0, id = 466, count = 45,bind = 1,txt="庆典第9天羽毛1档"},--3级羽毛*45
				  },
			},
			--物品2
			{
			txt ="商城无出售",
			name = "镶嵌限购礼包",
			yuanJia =0,
			needMoney =1588,
			canBuyTime = 1,
			award={
				{type = 0, id = 5364, count = 7,bind = 1,txt="庆典第9天宝石袋1档"},--2阶宝石袋*7
				  },
			},
			--物品3
			{
			name = "特戒限购礼包",
			yuanJia =8000,
			needMoney =3388,
			canBuyTime = 1,
			award={
				{type = 0, id = 527, count = 8,bind = 1,txt="庆典第9天特戒1档"},--特戒结晶*6
				  },
			},
			
			--物品4---------------第二档
			{
			name = "羽毛限购礼包",
			yuanJia =18000,
			needMoney =7688,
			canBuyTime = 1,
			award={
				{type = 0, id = 466, count = 200,bind = 1,txt="庆典第9天羽毛2档"},--3级羽毛*200
				  },
			},
			--物品5
			{
			txt ="商城无出售",
			name = "镶嵌限购礼包",
			yuanJia =0,
			needMoney =8588,
			canBuyTime = 1,
			award={
				{type = 0, id = 5364, count = 30,bind = 1,txt="庆典第9天宝石袋2档"},--2阶宝石袋*30
				  },
			},
			--物品6
			{
			name = "特戒限购礼包",
			yuanJia =27000,
			needMoney =11588,
			canBuyTime = 1,
			award={
				{type = 0, id = 527, count = 27,bind = 1,txt="庆典第9天特戒2档"},--特戒结晶*27
				  },
			},
			
			--物品7---------------第三档
			{
			name = "羽毛限购礼包",
			yuanJia =27900,
			needMoney =11888,
			canBuyTime = 1,
			award={
				{type = 0, id = 466, count = 310,bind = 1,txt="庆典第9天羽毛3档"},--3级羽毛*310
				  },
			},
			--物品8
			{
			txt ="商城无出售",
			name = "镶嵌限购礼包",
			yuanJia =0,
			needMoney =12888,
			canBuyTime = 1,
			award={
				{type = 0, id = 5364, count = 48,bind = 1,txt="庆典第9天宝石袋3档"},--2阶宝石袋*48
				  },
			},
			--物品9
			{
			name = "特戒限购礼包",
			yuanJia =39000,
			needMoney =16888,
			canBuyTime = 1,
			award={
				{type = 0, id = 527, count = 39,bind = 1,txt="庆典第9天特戒3档"},--特戒结晶*39
				  },
			},
		},

		--第十天
		{
			--物品1
			{
			name = "火龙限购礼包",
			yuanJia =3800,
			needMoney =1588,
			canBuyTime = 1, -- 购买次数
			award={
				{type = 0, id = 7194, count = 38,bind = 1,txt="庆典第10天火龙1档"},--火龙结晶 38
				  },
			},
			--物品2
			{
			name = "宝石限购礼包",
			yuanJia =3800,
			needMoney =1288,
			canBuyTime = 1,
			award={
				{type = 0, id = 537, count = 38,bind = 1,txt="庆典第10天宝石结晶1档"},--宝石结晶*3800
				  },
			},
			--物品3
			{
			name = "圣珠限购礼包",
			yuanJia =3800,
			needMoney =1288,
			canBuyTime = 1,
			award={
				{type = 0, id = 572, count = 38,bind = 1,txt="庆典第10天圣珠结晶1档"},--圣珠结晶*3800
				  },
			},
			--------------------------------------------------------------------------------买完一个商品，对应位置商品跳转到下一档
			
			--物品4
			{
			txt ="商城无出售",
			name = "火龙限购礼包",
			yuanJia =0,
			needMoney =8588,
			canBuyTime = 1, -- 购买次数
			award={
				{type = 0, id = 7195, count = 18,bind = 1,txt="庆典第10天火龙2档"},--火龙中 *18
				  },
			},
			--物品5
			{
			name = "宝石限购礼包",
			yuanJia =17600,
			needMoney =7688,
			canBuyTime = 1,
			award={
				{type = 0, id = 537, count = 176,bind = 1,txt="庆典第10天宝石2档"},--宝石结晶*17600
				  },
			},
			--物品6
			{
			name = "圣珠限购礼包",
			yuanJia =17600,
			needMoney =7688,
			canBuyTime = 1,
			award={
				{type = 0, id = 572, count = 176,bind = 1,txt="庆典第10天圣珠2档"},--圣珠结晶*17600
				  },
			},
			
			------------------------------------------------------------------------------买完一个商品，对应位置商品跳转到下一档
			--物品7
			{
			txt ="商城无出售",
			name = "羽毛限购礼包",
			yuanJia =0,
			needMoney =12588,
			canBuyTime = 1, -- 购买次数
			award={
				{type = 0, id = 7195, count = 28,bind = 1,txt="庆典第10天火龙3档"},--火龙中*28
				  },
			},
			--物品8
			{
			name = "宝石限购礼包",
			yuanJia =27500,
			needMoney =12588,
			canBuyTime = 1,
			award={
				{type = 0, id = 537, count = 275,bind = 1,txt="庆典第10天宝石3档"},--宝石结晶*27500
				  },
			},
			--物品9
			{
			name = "圣珠限购礼包",
			yuanJia =27500,
			needMoney =12588,
			canBuyTime = 1,
			award={
				{type = 0, id = 572, count = 275,bind = 1,txt="庆典第10天圣珠3档"},--圣珠结晶*27500
				  },
			},
			
		},

		--第十一天
		{
			--------------------------------------------------------------------------------
			--物品1
			{
			txt ="商城无出售",
			name = "注魂限购礼包",
			yuanJia =0,
			needMoney =1900,
			canBuyTime = 1,
			award={
				{type = 0, id = 6372, count = 3,bind = 1,txt="庆典第11天注魂1档"},
				  },
			},
			--物品2
			{
			name = "元神限购礼包",
			yuanJia =3000,
			needMoney =1588,
			canBuyTime = 1,
			award={
				{type = 0, id = 6297, count = 3,bind = 1,txt="庆典第11天元神1档"},
				  },
			},
			--物品3
			{
			name = "斗笠限购礼包",
			yuanJia =3000,
			needMoney =1588,
			canBuyTime = 1,
			award={
				{type = 0, id = 5646, count = 3,bind = 1,txt="庆典第11天斗笠1档"},
				  },
			},
			--------------------------------------------------------------------------------买完一个商品，对应位置商品跳转到下一档
			
			--物品4
			{
			txt ="商城无出售",
			name = "注魂限购礼包",
			yuanJia =0,
			needMoney =6700,
			canBuyTime = 1,
			award={
				{type = 0, id = 6373, count = 1,bind = 1,txt="庆典第11天注魂2档"},--2级羽毛*600
				  },
			},
			--物品5
			{
			name = "元神限购礼包",
			yuanJia =10000,
			needMoney =6588,
			canBuyTime = 1,
			award={
				{type = 0, id = 6298, count = 1,bind = 1,txt="庆典第11天元神2档"},--神魂*1188
				  },
			},
			--物品6
			{
			name = "斗笠限购礼包",
			yuanJia =10000,
			needMoney =6588,
			canBuyTime = 1,
			award={
				{type = 0, id = 5647, count = 1,bind = 1,txt="庆典第11天斗笠2档"},--神魂*1188
				  },
			},
			
			-------------------------------------------------------------------------------买完一个商品，对应位置商品跳转到下一档
			
			
			--物品7
			{
			txt ="商城无出售",
			name = "注魂限购礼包",
			yuanJia =0,
			needMoney =20000,
			canBuyTime = 1,
			award={
				{type = 0, id = 6373, count = 3,bind = 1,txt="庆典第11天注魂3档"},--2级羽毛*900
				  },
			},
			--物品8
			{
			name = "元神限购礼包",
			yuanJia =30000,
			needMoney =18888,
			canBuyTime = 1,
			award={
				{type = 0, id = 6298, count = 3,bind = 1,txt="庆典第11天元神3档"},--成就令牌(大)*3
				  },
			},
			--物品9
			{
			name = "斗笠限购礼包",
			yuanJia =30000,
			needMoney =18888,
			canBuyTime = 1,
			award={
				{type = 0, id = 5647, count = 3,bind = 1,txt="庆典第11天斗笠3档"},--神魂*1188
				  },
			},
		},

		--第十二天
		{
			--------------------------------------------------------------------------------
			--物品1
			{
			name = "戒灵限购礼包",
			yuanJia =6000,
			needMoney =3388,
			canBuyTime = 1,
			award={
				{type = 0, id = 7619, count = 6,bind = 1,txt="庆典第12天戒灵1档"},
				  },
			},
			--物品2
			{
			name = "特戒限购礼包",
			yuanJia =8000,
			needMoney =3488,
			canBuyTime = 1,
			award={
				{type = 0, id = 527, count = 8,bind = 1,txt="庆典第12天特戒1档"},--特戒结晶*6
				  },
			},
			--物品3
			{
			name = "斗笠限购礼包",
			yuanJia =3000,
			needMoney =1588,
			canBuyTime = 1,
			award={
				{type = 0, id = 5646, count = 3,bind = 1,txt="庆典第12天斗笠1档"},
				  },
			},
			--------------------------------------------------------------------------------买完一个商品，对应位置商品跳转到下一档
			
			--物品4
			{
			name = "戒灵限购礼包",
			yuanJia =20000,
			needMoney =13588,
			canBuyTime = 1,
			award={
				{type = 0, id = 7620, count = 2,bind = 1,txt="庆典第12天戒灵2档"},
				  },
			},
			--物品5
			{
			name = "特戒限购礼包",
			yuanJia =27000,
			needMoney =11588,
			canBuyTime = 1,
			award={
				{type = 0, id = 527, count = 27,bind = 1,txt="庆典第12天特戒2档"},--特戒结晶*27
				  },
			},
			--物品6
			{
			name = "斗笠限购礼包",
			yuanJia =20000,
			needMoney =11588,
			canBuyTime = 1,
			award={
				{type = 0, id = 5647, count = 2,bind = 1,txt="庆典第12天斗笠2档"},
				  },
			},
			
			-------------------------------------------------------------------------------买完一个商品，对应位置商品跳转到下一档
			
			
			--物品7
			{
			name = "戒灵限购礼包",
			yuanJia =60000,
			needMoney =38888,
			canBuyTime = 1,
			award={
				{type = 0, id = 7620, count = 6,bind = 1,txt="庆典第12天戒灵3档"},--神魂*1188
				  },
			},
			--物品8
			{
			name = "特戒限购礼包",
			yuanJia =39000,
			needMoney =16888,
			canBuyTime = 1,
			award={
				{type = 0, id = 527, count = 39,bind = 1,txt="庆典第12天特戒3档"},--特戒结晶*39
				  },
			},
			--物品9
			{
			name = "斗笠限购礼包",
			yuanJia =30000,
			needMoney =18888,
			canBuyTime = 1,
			award={
				{type = 0, id = 5647, count = 3,bind = 1,txt="庆典第12天斗笠3档"},--神魂*1188
				  },
			},
		},	

	},
	
	--10集字有奖
	SpringJiZi = 
	{
		isOpen = false, -- 已下架

		--字的id(id必须连续！！！！！！！！！！！！！！)
		JiZiId ={5649,5650,5651,5652,5653,5654,5655,5656},
		--需要收集的物品
		needCollect = 
		{
			{
				{type = 0, id = 5649, count = 1,bind = 1},
				{type = 0, id = 5650, count = 1,bind = 1},
			},
			{
				{type = 0, id = 5649, count = 1,bind = 1},
				{type = 0, id = 5650, count = 1,bind = 1},
				{type = 0, id = 5651, count = 1,bind = 1},
				{type = 0, id = 5652, count = 1,bind = 1},
			},
			{
				{type = 0, id = 5649, count = 1,bind = 1},
				{type = 0, id = 5650, count = 1,bind = 1},
				{type = 0, id = 5651, count = 1,bind = 1},
				{type = 0, id = 5652, count = 1,bind = 1},
				{type = 0, id = 5653, count = 1,bind = 1},
				{type = 0, id = 5654, count = 1,bind = 1},
			},
			{
				{type = 0, id = 5649, count = 1,bind = 1},
				{type = 0, id = 5650, count = 1,bind = 1},
				{type = 0, id = 5651, count = 1,bind = 1},
				{type = 0, id = 5652, count = 1,bind = 1},
				{type = 0, id = 5653, count = 1,bind = 1},
				{type = 0, id = 5654, count = 1,bind = 1},
				{type = 0, id = 5655, count = 1,bind = 1},
				{type = 0, id = 5656, count = 1,bind = 1},
			},
		},
		award = 
		{
			{
				{type = 5, id = 0, count = 580000,bind = 1,txt="庆典",name ="58W绑定金币" },
			},
			{
				{type = 15, id = 0, count = 1500,bind = 0,txt="庆典来袭",name ="1500元宝"},
			},
			{
				{type = 15, id = 0, count = 15000,bind = 0,txt="庆典来袭嗨爆",name ="15000元宝"},
			},	
			{
				{type = 15, id = 0, count = 58000,bind = 0,txt="庆典来袭嗨爆全服",name ="58000元宝"},
			}	
		}
	},
	
	
	
	--11鸿运当头
	HongYunDangTou = 
	{
		--第一天
		{
			
			TeHui=
			{
				needMoney = 2188,
				award={
						{type = 0, id = 489, count = 3,bind = 1,txt="鸿运特惠成就"},
					},
			
			},
			HongYun_Award = --鸿运大奖，发邮件
			{
				{ id = 6013, count = 1,bind = 1,sex = -1, txt = "鸿运武器"}
			}
		},
		--第二天
		{
			TeHui=
			{
				needMoney = 2188,
				award={
						{type = 0, id = 527, count = 3,bind = 1,txt="鸿运特惠结晶"},
					},
				
			},
			HongYun_Award = --鸿运大奖，发邮件
			{
				{ id = 6014, count = 1,bind = 1,sex = 0,txt = "鸿运衣服男"},
				{ id = 6015, count = 1,bind = 1,sex = 1,txt = "鸿运衣服女"},
			}
		},
		--第三天
		{
			TeHui=
			{
				needMoney = 2188,
				award={
						{type = 0, id = 465, count = 100,bind = 1,txt="鸿运特惠羽毛"},
					},
			},
			HongYun_Award = --鸿运大奖，发邮件
			{
				{ id = 6012, count = 1,bind = 1,sex = -1,txt = "鸿运称号"}
			}
		},
		--第四天
		{
			
			TeHui=
			{
				needMoney = 2188,
				award={
						{type = 0, id = 489, count = 3,bind = 1,txt="鸿运特惠成就"},
					},
			
			},
			HongYun_Award = --鸿运大奖，发邮件
			{
				{ id = 6013, count = 1,bind = 1,sex = -1, txt = "鸿运武器"}
			}
		},
		--第五天
		{
			TeHui=
			{
				needMoney = 2188,
				award={
						{type = 0, id = 527, count = 3,bind = 1,txt="鸿运特惠结晶"},
					},
				
			},
			HongYun_Award = --鸿运大奖，发邮件
			{
				{ id = 6014, count = 1,bind = 1,sex = 0,txt = "鸿运衣服男"},
				{ id = 6015, count = 1,bind = 1,sex = 1,txt = "鸿运衣服女"},
			}
		},
		--第六天
		{
			TeHui=
			{
				needMoney = 2188,
				award={
						{type = 0, id = 465, count = 100,bind = 1,txt="鸿运特惠羽毛"},
					},
			},
			HongYun_Award = --鸿运大奖，发邮件
			{
				{ id = 6012, count = 1,bind = 1,sex = -1,txt = "鸿运称号"}
			}
		},
		--第七天
		{
			
			TeHui=
			{
				needMoney = 2188,
				award={
						{type = 0, id = 489, count = 3,bind = 1,txt="鸿运特惠成就"},
					},
			
			},
			HongYun_Award = --鸿运大奖，发邮件
			{
				{ id = 6013, count = 1,bind = 1,sex = -1, txt = "鸿运武器"}
			}
		},
		--第八天
		{
			TeHui=
			{
				needMoney = 2188,
				award={
						{type = 0, id = 527, count = 3,bind = 1,txt="鸿运特惠结晶"},
					},
				
			},
			HongYun_Award = --鸿运大奖，发邮件
			{
				{ id = 6014, count = 1,bind = 1,sex = 0,txt = "鸿运衣服男"},
				{ id = 6015, count = 1,bind = 1,sex = 1,txt = "鸿运衣服女"},
			}
		},
		--第九天
		{
			TeHui=
			{
				needMoney = 2188,
				award={
						{type = 0, id = 465, count = 100,bind = 1,txt="鸿运特惠羽毛"},
					},
			},
			HongYun_Award = --鸿运大奖，发邮件
			{
				{ id = 6012, count = 1,bind = 1,sex = -1,txt = "鸿运称号"}
			}
		},
		--第十天
		{
			
			TeHui=
			{
				needMoney = 2188,
				award={
						{type = 0, id = 489, count = 3,bind = 1,txt="鸿运特惠成就"},
					},
			
			},
			HongYun_Award = --鸿运大奖，发邮件
			{
				{ id = 6013, count = 1,bind = 1,sex = -1, txt = "鸿运武器"}
			}
		},
		--第11天
		{
			TeHui=
			{
				needMoney = 2188,
				award={
						{type = 0, id = 527, count = 3,bind = 1,txt="鸿运特惠结晶"},
					},
				
			},
			HongYun_Award = --鸿运大奖，发邮件
			{
				{ id = 6014, count = 1,bind = 1,sex = 0,txt = "鸿运衣服男"},
				{ id = 6015, count = 1,bind = 1,sex = 1,txt = "鸿运衣服女"},
			}
		},
		--第12天
		{
			TeHui=
			{
				needMoney = 2188,
				award={
						{type = 0, id = 465, count = 100,bind = 1,txt="鸿运特惠羽毛"},
					},
			},
			HongYun_Award = --鸿运大奖，发邮件
			{
				{ id = 6012, count = 1,bind = 1,sex = -1,txt = "鸿运称号"}
			}
		},
	
	},

	
	--12每日总共充值
	EveryTotalPay = 
	{
		{
			name ="累计充值达标天",
			needPay =100000,
			days = 
			{
				--累计1天超过needPay
				{
					award ={
					{type = 0, id = 7780,count = 1,bind = 1},--仙钻2
					{type = 0, id = 7194,count = 5,bind = 1},--火龙结晶小
					{type = 0, id = 7043,count = 1,bind = 1},--足迹礼盒
                    {type = 0, id = 6363,count = 1,bind = 1},--壕礼宝箱
                    {type = 0, id = 6369,count = 1,bind = 1},--绿色生肖袋
					       }
				},
				--累计2天超过needPay
				{
					award ={
					{type = 0, id = 7780,count = 2,bind = 1},--仙钻2
					{type = 0, id = 7194,count = 10,bind = 1},--火龙结晶小
					{type = 0, id = 7690,count = 1,bind = 1},--神盾礼盒
                    {type = 0, id = 6363,count = 2,bind = 1},--壕礼宝箱
                    {type = 0, id = 6369,count = 1,bind = 1},--绿色生肖袋
					       }
				},
				--累计3天超过needPay
				{
					award ={
					{type = 0, id = 7780,count = 3,bind = 1},--仙钻2
					{type = 0, id = 7194,count = 20,bind = 1},--火龙结晶小
					{type = 0, id = 7047,count = 1,bind = 1},--坐骑礼盒
                    {type = 0, id = 6363,count = 3,bind = 1},--壕礼宝箱
                    {type = 0, id = 6369,count = 1,bind = 1},--绿色生肖袋
					       }
				},
				--累计4天超过needPay
				{
					award ={
					{type = 0, id = 7780,count = 4,bind = 1},--仙钻2
					{type = 0, id = 7194,count = 30,bind = 1},--火龙结晶小
					{type = 0, id = 7827,count = 1,bind = 1},--神戒宝盒
                    {type = 0, id = 6363,count = 4,bind = 1},--壕礼宝箱
                    {type = 0, id = 6369,count = 1,bind = 1},--绿色生肖袋
					       }
				},
				--累计5天超过needPay
				{
					award ={
					{type = 0, id = 7780,count = 5,bind = 1},--仙钻2
					{type = 0, id = 7194,count = 40,bind = 1},--火龙结晶小
					{type = 0, id = 6887,count = 1,bind = 1},--龍装Ⅰ首饰箱
                    {type = 0, id = 6363,count = 5,bind = 1},--壕礼宝箱
                    {type = 0, id = 6369,count = 1,bind = 1},--绿色生肖袋
					       }
				},
				--累计6天超过needPay
				{
					award ={
					{type = 0, id = 7780,count = 6,bind = 1},--仙钻2
					{type = 0, id = 7194,count = 50,bind = 1},--火龙结晶小
					{type = 0, id = 7813,count = 1,bind = 1},--太初仙装礼盒
                    {type = 0, id = 6363,count = 6,bind = 1},--壕礼宝箱
                    {type = 0, id = 6369,count = 2,bind = 1},--绿色生肖袋
					       }
				},

				--累计7天超过needPay
				{
					award ={
					{type = 0, id = 7780,count = 7,bind = 1},--仙钻2
					{type = 0, id = 7194,count = 60,bind = 1},--火龙结晶小
					{type = 0, id = 7043,count = 1,bind = 1},--足迹礼盒
                    {type = 0, id = 6363,count = 7,bind = 1},--壕礼宝箱
                    {type = 0, id = 6369,count = 3,bind = 1},--绿色生肖袋
					       }
				},

				--累计8天超过needPay
				{
					award ={
					{type = 0, id = 7780,count = 8,bind = 1},--仙钻2
					{type = 0, id = 7194,count = 70,bind = 1},--火龙结晶小
					{type = 0, id = 7690,count = 1,bind = 1},--神盾礼盒
                    {type = 0, id = 6363,count = 8,bind = 1},--壕礼宝箱
                    {type = 0, id = 6369,count = 4,bind = 1},--绿色生肖袋
					       }
				},

				--累计9天超过needPay
				{
					award ={
					{type = 0, id = 7780,count = 9,bind = 1},--仙钻2
					{type = 0, id = 7194,count = 80,bind = 1},--火龙结晶小
					{type = 0, id = 7047,count = 1,bind = 1},--坐骑礼盒
                    {type = 0, id = 6363,count = 9,bind = 1},--壕礼宝箱
                    {type = 0, id = 6369,count = 5,bind = 1},--绿色生肖袋
					       }
				},

				--累计10天超过needPay
				{
					award ={
					{type = 0, id = 7780,count = 10,bind = 1},--仙钻2
					{type = 0, id = 7194,count = 90,bind = 1},--火龙结晶小
					{type = 0, id = 7827,count = 1,bind = 1},--神戒宝盒
                    {type = 0, id = 6363,count = 10,bind = 1},--壕礼宝箱
                    {type = 0, id = 6369,count = 6,bind = 1},--绿色生肖袋
					       }
				},

				--累计11天超过needPay
				{
					award ={
					{type = 0, id = 7780,count = 11,bind = 1},--仙钻2
					{type = 0, id = 7194,count = 100,bind = 1},--火龙结晶小
					{type = 0, id = 6887,count = 1,bind = 1},--龍装Ⅰ首饰箱
                    {type = 0, id = 6363,count = 11,bind = 1},--壕礼宝箱
                    {type = 0, id = 6369,count = 7,bind = 1},--绿色生肖袋
					       }
				},

				--累计12天超过needPay
				{
					award ={
					{type = 0, id = 7780,count = 12,bind = 1},--仙钻2
					{type = 0, id = 7194,count = 110,bind = 1},--火龙结晶小
					{type = 0, id = 7813,count = 1,bind = 1},--太初仙装礼盒
                    {type = 0, id = 6363,count = 12,bind = 1},--壕礼宝箱
                    {type = 0, id = 6369,count = 8,bind = 1},--绿色生肖袋
					       }
				},
			},
		},
		
		{
			name ="累计充值达标天",
			needPay =500000,
			days = 
			{
				--累计1天超过needPay
				{
					award ={
                    {type = 0, id = 5951,count = 20,bind = 1},--时装升星符
					{type = 0, id = 7195,count = 2,bind = 1},--火龙结晶中					
					{type = 0, id = 7039,count = 1,bind = 1},--至尊屠龙碎片
					{type = 0, id = 7049,count = 2,bind = 1},--翅膀装备礼盒
                    {type = 0, id = 6363,count = 1,bind = 1},--壕礼宝箱
					       }
				},
				--累计2天超过needPay
				{
					award ={
					{type = 0, id = 5951,count = 20,bind = 1},--时装升星符
					{type = 0, id = 7195,count = 4,bind = 1},--火龙结晶中
					{type = 0, id = 7039,count = 1,bind = 1},--至尊屠龙碎片
					{type = 0, id = 7048,count = 2,bind = 1},--坐骑装备礼盒
                    {type = 0, id = 6363,count = 2,bind = 1},--壕礼宝箱
					       }
				},
				--累计3天超过needPay
				{
					award ={
					{type = 0, id = 5951,count = 20,bind = 1},--时装升星符
					{type = 0, id = 7195,count = 6,bind = 1},--火龙结晶中
					{type = 0, id = 7039,count = 1,bind = 1},--至尊屠龙碎片
					{type = 0, id = 7049,count = 2,bind = 1},--翅膀装备礼盒
                    {type = 0, id = 6363,count = 4,bind = 1},--壕礼宝箱
					       }
				},
				--累计4天超过needPay
				{
					award ={
                    {type = 0, id = 5951,count = 20,bind = 1},--时装升星符
					{type = 0, id = 7195,count = 8,bind = 1},--火龙结晶中
					{type = 0, id = 7039,count = 1,bind = 1},--至尊屠龙碎片
					{type = 0, id = 7048,count = 2,bind = 1},--坐骑装备礼盒
                    {type = 0, id = 6363,count = 6,bind = 1},--壕礼宝箱
					       }
				},
				--累计5天超过needPay
				{
					award ={
					{type = 0, id = 5951,count = 20,bind = 1},--时装升星符
					{type = 0, id = 7195,count = 10,bind = 1},--火龙结晶中
					{type = 0, id = 7039,count = 1,bind = 1},--至尊屠龙碎片
					{type = 0, id = 7049,count = 2,bind = 1},--翅膀装备礼盒
                    {type = 0, id = 6363,count = 8,bind = 1},--壕礼宝箱
					       }
				},
				--累计6天超过needPay
				{
					award ={
					{type = 0, id = 5951,count = 30,bind = 1},--时装升星符
					{type = 0, id = 7195,count = 12,bind = 1},--火龙结晶中
					{type = 0, id = 7039,count = 1,bind = 1},--至尊屠龙碎片
					{type = 0, id = 7048,count = 2,bind = 1},--坐骑装备礼盒
                    {type = 0, id = 6363,count = 10,bind = 1},--壕礼宝箱
					       }
				},
				--累计7天超过needPay
				{
					award ={
					{type = 0, id = 5951,count = 40,bind = 1},--时装升星符
					{type = 0, id = 7195,count = 15,bind = 1},--火龙结晶中
					{type = 0, id = 7039,count = 1,bind = 1},--至尊屠龙碎片
					{type = 0, id = 7049,count = 2,bind = 1},--翅膀装备礼盒
                    {type = 0, id = 6363,count = 12,bind = 1},--壕礼宝箱
					       }
				},
				--累计8天超过needPay
				{
					award ={
					{type = 0, id = 5951,count = 50,bind = 1},--时装升星符
					{type = 0, id = 7195,count = 18,bind = 1},--火龙结晶中
					{type = 0, id = 7039,count = 1,bind = 1},--至尊屠龙碎片
					{type = 0, id = 7048,count = 2,bind = 1},--坐骑装备礼盒
                    {type = 0, id = 6363,count = 14,bind = 1},--壕礼宝箱
					       }
				},
				--累计9天超过needPay
				{
					award ={
					{type = 0, id = 5951,count = 60,bind = 1},--时装升星符
					{type = 0, id = 7195,count = 21,bind = 1},--火龙结晶中
					{type = 0, id = 7039,count = 1,bind = 1},--至尊屠龙碎片
					{type = 0, id = 7049,count = 2,bind = 1},--翅膀装备礼盒
                    {type = 0, id = 6363,count = 16,bind = 1},--壕礼宝箱
					       }
				},
				--累计10天超过needPay
				{
					award ={
					{type = 0, id = 5951,count = 70,bind = 1},--时装升星符
					{type = 0, id = 7195,count = 25,bind = 1},--火龙结晶中
					{type = 0, id = 7039,count = 1,bind = 1},--至尊屠龙碎片
					{type = 0, id = 7048,count = 2,bind = 1},--坐骑装备礼盒
                    {type = 0, id = 6363,count = 18,bind = 1},--壕礼宝箱
					       }
				},
				--累计11天超过needPay
				{
					award ={
					{type = 0, id = 5951,count = 80,bind = 1},--时装升星符
					{type = 0, id = 7195,count = 30,bind = 1},--火龙结晶中
					{type = 0, id = 7039,count = 1,bind = 1},--至尊屠龙碎片
					{type = 0, id = 7049,count = 2,bind = 1},--翅膀装备礼盒
                    {type = 0, id = 6363,count = 20,bind = 1},--壕礼宝箱
					       }
				},
				--累计12天超过needPay
				{
					award ={
					{type = 0, id = 5951,count = 90,bind = 1},--时装升星符
					{type = 0, id = 7195,count = 35,bind = 1},--火龙结晶中
					{type = 0, id = 7039,count = 1,bind = 1},--至尊屠龙碎片
					{type = 0, id = 7048,count = 2,bind = 1},--坐骑装备礼盒
                    {type = 0, id = 6363,count = 25,bind = 1},--壕礼宝箱
					       }
				},

			},
		},

		{
			name ="累计充值达标天",
			needPay =1000000,
			days = 
			{
				--累计1天超过needPay
				{
					award ={
					{type = 0, id = 7196,count = 1,bind = 1},--火龙结晶大
					{type = 0, id = 7039,count = 1,bind = 1},--屠龙至尊碎片
					{type = 0, id = 7651,count = 1,bind = 1},--雷神首饰礼盒
                    {type = 0, id = 6363,count = 5,bind = 1},--壕礼宝箱
                    {type = 0, id = 6402,count = 10,bind = 1},--传世宝钻
					       }
				},
				--累计2天超过needPay
				{
					award ={
					{type = 0, id = 7196,count = 2,bind = 1},--火龙结晶大
					{type = 0, id = 7039,count = 2,bind = 1},--屠龙至尊碎片
					{type = 0, id = 6659,count = 1,bind = 1},--传世礼盒
                    {type = 0, id = 6363,count = 10,bind = 1},--壕礼宝箱
                    {type = 0, id = 7151,count = 80,bind = 1},--仙力(1点)
					       }
				},
				--累计3天超过needPay
				{
					award ={
					{type = 0, id = 7196,count = 3,bind = 1},--火龙结晶大
					{type = 0, id = 7039,count = 3,bind = 1},--屠龙至尊碎片
					{type = 0, id = 7651,count = 2,bind = 1},--雷神首饰礼盒
                    {type = 0, id = 6363,count = 15,bind = 1},--壕礼宝箱
                    {type = 0, id = 6402,count = 15,bind = 1},--传世宝钻
					       }
				},
				--累计4天超过needPay
				{
					award ={
					{type = 0, id = 7196,count = 4,bind = 1},--火龙结晶大
					{type = 0, id = 7039,count = 4,bind = 1},--屠龙至尊碎片
					{type = 0, id = 6659,count = 2,bind = 1},--传世礼盒
                    {type = 0, id = 6363,count = 20,bind = 1},--壕礼宝箱
                    {type = 0, id = 7151,count = 120,bind = 1},--仙力(1点)
					       }
				},
				--累计5天超过needPay
				{
					award ={
					{type = 0, id = 7196,count = 5,bind = 1},--火龙结晶大
					{type = 0, id = 7039,count = 5,bind = 1},--屠龙至尊碎片
					{type = 0, id = 7651,count = 3,bind = 1},--雷神首饰礼盒
                    {type = 0, id = 6363,count = 25,bind = 1},--壕礼宝箱
                    {type = 0, id = 6402,count = 20,bind = 1},--传世宝钻
					       }
				},
				--累计6天超过needPay
				{
					award ={
					{type = 0, id = 7196,count = 6,bind = 1},--火龙结晶大
					{type = 0, id = 7039,count = 6,bind = 1},--屠龙至尊碎片
					{type = 0, id = 6659,count = 3,bind = 1},--传世礼盒
                    {type = 0, id = 6363,count = 30,bind = 1},--壕礼宝箱
                    {type = 0, id = 7151,count = 160,bind = 1},--仙力(1点)
					       }
				},
				--累计7天超过needPay
				{
					award ={
					{type = 0, id = 7196,count = 7,bind = 1},--火龙结晶大
					{type = 0, id = 7039,count = 7,bind = 1},--屠龙至尊碎片
					{type = 0, id = 7651,count = 4,bind = 1},--雷神首饰礼盒
                    {type = 0, id = 6363,count = 35,bind = 1},--壕礼宝箱
                    {type = 0, id = 6402,count = 25,bind = 1},--传世宝钻
					       }
				},
				--累计8天超过needPay
				{
					award ={
					{type = 0, id = 7196,count = 8,bind = 1},--火龙结晶大
					{type = 0, id = 7039,count = 8,bind = 1},--屠龙至尊碎片
					{type = 0, id = 6659,count = 4,bind = 1},--传世礼盒
                    {type = 0, id = 6363,count = 40,bind = 1},--壕礼宝箱
                    {type = 0, id = 7151,count = 200,bind = 1},--仙力(1点)
					       }
				},
				--累计9天超过needPay
				{
					award ={
					{type = 0, id = 7196,count = 9,bind = 1},--火龙结晶大
					{type = 0, id = 7039,count = 9,bind = 1},--屠龙至尊碎片
					{type = 0, id = 7651,count = 5,bind = 1},--雷神首饰礼盒
                    {type = 0, id = 6363,count = 45,bind = 1},--壕礼宝箱
                    {type = 0, id = 6402,count = 30,bind = 1},--传世宝钻
					       }
				},
				--累计10天超过needPay
				{
					award ={
					{type = 0, id = 7196,count = 10,bind = 1},--火龙结晶大
					{type = 0, id = 7039,count = 10,bind = 1},--屠龙至尊碎片
					{type = 0, id = 6659,count = 5,bind = 1},--传世礼盒
                    {type = 0, id = 6363,count = 50,bind = 1},--壕礼宝箱
                    {type = 0, id = 7151,count = 240,bind = 1},--仙力(1点)
					       }
				},
				--累计11天超过needPay
				{
					award ={
					{type = 0, id = 7196,count = 11,bind = 1},--火龙结晶大
					{type = 0, id = 7039,count = 11,bind = 1},--屠龙至尊碎片
					{type = 0, id = 7651,count = 6,bind = 1},--雷神首饰礼盒
                    {type = 0, id = 6363,count = 55,bind = 1},--壕礼宝箱
                    {type = 0, id = 6402,count = 35,bind = 1},--传世宝钻
					       }
				},
				--累计12天超过needPay
				{
					award ={
					{type = 0, id = 7196,count = 12,bind = 1},--火龙结晶大
					{type = 0, id = 7039,count = 12,bind = 1},--屠龙至尊碎片
					{type = 0, id = 6659,count = 6,bind = 1},--传世礼盒
                    {type = 0, id = 6363,count = 60,bind = 1},--壕礼宝箱
                    {type = 0, id = 7151,count = 280,bind = 1},--仙力(1点)
					       }
				},
			},
		},


		{
			name ="累计充值达标天",
			needPay =2000000,
			days = 
			{
				--累计1天超过needPay
				{
					award ={
					{type = 0, id = 7039,count = 4,bind = 1},--至尊屠龙碎片
					{type = 0, id = 7650,count = 2,bind = 1},--龙腾首饰箱
					{type = 0, id = 6364,count = 1,bind = 1},--九转装备箱
                    {type = 0, id = 5661,count = 20,bind = 1},--幻羽精华
                    {type = 0, id = 6371,count = 2,bind = 1},--幻羽礼盒
					       }
				},
				--累计2天超过needPay
				{
					award ={
					{type = 0, id = 7039,count = 8,bind = 1},--至尊屠龙碎片
					{type = 0, id = 7650,count = 3,bind = 1},--龙腾首饰箱
					{type = 0, id = 6364,count = 1,bind = 1},--九转装备箱
                    {type = 0, id = 7052,count = 5,bind = 1},--凡·南明离火
                   {type = 0, id = 6658,count = 2,bind = 1},--灵器礼盒
					       }
				},
				--累计3天超过needPay
				{
					award ={
					{type = 0, id = 7039,count = 12,bind = 1},--至尊屠龙碎片
					{type = 0, id = 7650,count = 4,bind = 1},--龙腾首饰箱
					{type = 0, id = 6364,count = 1,bind = 1},--九转装备箱
                    {type = 0, id = 5661,count = 30,bind = 1},--幻羽精华
                   {type = 0, id = 6371,count = 4,bind = 1},--幻羽礼盒
					       }
				},
				--累计4天超过needPay
				{
					award ={
					{type = 0, id = 7039,count = 16,bind = 1},--至尊屠龙碎片
					{type = 0, id = 7650,count = 5,bind = 1},--龙腾首饰箱
					{type = 0, id = 6364,count = 1,bind = 1},--九转装备箱
                    {type = 0, id = 7052,count = 8,bind = 1},--凡·南明离火
                   {type = 0, id = 6658,count = 4,bind = 1},--灵器礼盒
					       }
				},
				--累计5天超过needPay
				{
					award ={
					{type = 0, id = 7039,count = 20,bind = 1},--至尊屠龙碎片
					{type = 0, id = 7650,count = 6,bind = 1},--龙腾首饰箱
					{type = 0, id = 6714,count = 1,bind = 1},--十一转装备箱
                    {type = 0, id = 5661,count = 40,bind = 1},--幻羽精华
                    {type = 0, id = 6371,count = 6,bind = 1},--幻羽礼盒
					       }
				},
				--累计6天超过needPay
				{
					award ={
					{type = 0, id = 7039,count = 24,bind = 1},--至尊屠龙碎片
					{type = 0, id = 7650,count = 7,bind = 1},--龙腾首饰箱
					{type = 0, id = 6714,count = 1,bind = 1},--十一转装备箱
                    {type = 0, id = 7052,count = 11,bind = 1},--凡·南明离火
                    {type = 0, id = 6658,count = 6,bind = 1},--灵器礼盒
					       }
				},
				--累计7天超过needPay
				{
					award ={
					{type = 0, id = 7039,count = 28,bind = 1},--至尊屠龙碎片
					{type = 0, id = 7650,count = 8,bind = 1},--龙腾首饰箱
					{type = 0, id = 6714,count = 1,bind = 1},--十一转装备箱
                    {type = 0, id = 5661,count = 50,bind = 1},--幻羽精华
                   {type = 0, id = 6371,count = 8,bind = 1},--幻羽礼盒
					       }
				},
				--累计8天超过needPay
				{
					award ={
					{type = 0, id = 7039,count = 32,bind = 1},--至尊屠龙碎片
					{type = 0, id = 7650,count = 9,bind = 1},--龙腾首饰箱
					{type = 0, id = 6714,count = 1,bind = 1},--十一转装备箱
                    {type = 0, id = 7052,count = 14,bind = 1},--凡·南明离火
                   {type = 0, id = 6658,count = 8,bind = 1},--灵器礼盒
					       }
				},
				--累计9天超过needPay
				{
					award ={
					{type = 0, id = 7039,count = 36,bind = 1},--至尊屠龙碎片
					{type = 0, id = 7650,count = 10,bind = 1},--龙腾首饰箱
					{type = 0, id = 7182,count = 1,bind = 1},--13转装备箱
                    {type = 0, id = 5661,count = 60,bind = 1},--幻羽精华
                   {type = 0, id = 6371,count = 10,bind = 1},--幻羽礼盒
					       }
				},
				--累计10天超过needPay
				{
					award ={
					{type = 0, id = 7039,count = 40,bind = 1},--至尊屠龙碎片
					{type = 0, id = 7650,count = 11,bind = 1},--龙腾首饰箱
					{type = 0, id = 7182,count = 1,bind = 1},--13转装备箱
                    {type = 0, id = 7052,count = 17,bind = 1},--凡·南明离火
                   {type = 0, id = 6658,count = 10,bind = 1},--灵器礼盒
					       }
				},
				--累计11天超过needPay
				{
					award ={
					{type = 0, id = 7039,count = 44,bind = 1},--至尊屠龙碎片
					{type = 0, id = 7650,count = 12,bind = 1},--龙腾首饰箱
					{type = 0, id = 7182,count = 1,bind = 1},--13转装备箱
                    {type = 0, id = 5661,count = 70,bind = 1},--幻羽精华
                   {type = 0, id = 6371,count = 12,bind = 1},--幻羽礼盒
					       }
				},
				--累计12天超过needPay
				{
					award ={
					{type = 0, id = 7039,count = 48,bind = 1},--至尊屠龙碎片
					{type = 0, id = 7650,count = 13,bind = 1},--龙腾首饰箱
					{type = 0, id = 7182,count = 1,bind = 1},--13转装备箱
                    {type = 0, id = 7052,count = 20,bind = 1},--凡·南明离火
                   {type = 0, id = 6658,count = 12,bind = 1},--灵器礼盒
					       }
				},
			},
		},
	
	},
	

	--13消费转盘
	XiaoFeiZhuanPanNew = 
	{
		isOpen = false, -- 已下架

		{
			--第1挡
			{
				needPay = 8800,
				award={
						{type = 0, id = 5365, count = 12,bind = 1,txt="三阶宝石袋"},
				},
			},
			--第2挡
			{
				needPay = 18800,
				award={
						{type = 0, id = 6929, count = 1,bind = 1,txt="周年庆礼盒②"},
				},
			},
			--第3挡
			{
				needPay = 38800,
				award={
						{type = 0, id = 6930, count = 1,bind = 1,txt="周年庆礼盒③"},
				},
			},
			--第4挡
			{
				needPay = 88800,
				award={
						{type = 0, id = 6931, count = 1,bind = 1,txt="周年庆礼盒④"},
				},
			},
			--第5挡
			{
				needPay = 156800,
				award={
					{type = 0, id = 6365, count = 1,bind = 1,txt="七转装备箱"},
				},
			},
			--第6挡
			{
				needPay = 258000,
				award={
						{type = 0, id = 6820, count = 1,bind = 1,txt="龍装Ⅱ装备箱"},
				},
			},
			
			--第7挡
			{
				needPay = 386000,
				award={
						{type = 0, id = 6364, count = 1,bind = 1,txt="九转装备箱"},
				},
			},
			
			--第8挡
			{
				needPay = 546000,
				award={
						{type = 0, id = 6821, count = 1,bind = 1,txt="龍装Ⅲ装备箱"},
				},
			},
			--第9挡
			{
				needPay = 776000,
				award={
						{type = 0, id = 6714, count = 1,bind = 1,txt="十一转装备箱"},
				},
			},
			
			--第10挡
			{
				needPay = 1134000,
				award={
						{type = 0, id = 7181, count = 1,bind = 1,txt="十三转首饰箱"},
				},
			},
			--第11挡
			{
				needPay = 1984000,
				award={
						{type = 0, id = 7695, count = 1,bind = 0,txt="至尊屠龙牌"},
				},
			},
			--第12挡
			{
				needPay = 5564000,
				award={
						{type = 0, id = 7557, count = 1,bind = 0,txt="至尊屠龙令"},
				},
			},
		},
	},
	
	
	--14寻宝赠送豪礼(寻宝返利)
	hunt_times = {		
		{ times = 200, award = { 
			{type = 0, id = 6657, count = 1,bind = 1},
			{type = 0, id = 6371, count = 1,bind = 1},
			{type = 0, id = 5364, count = 1,bind = 1},
			{type = 0, id = 6370, count = 1,bind = 1},
			{type = 0, id = 7780, count = 2,bind = 1} --仙钻2颗
		
		 } },
		{ times = 300, award = { 
			{type = 0, id = 7047, count = 1,bind = 1},
			{type = 0, id = 7043, count = 1,bind = 1},
			{type = 0, id = 5364, count = 2,bind = 1},
			{type = 0, id = 6370, count = 2,bind = 1},
			{type = 0, id = 7781, count = 1,bind = 1} --仙钻5颗
			
		 } },
		{ times = 500, award = { 
			{type = 0, id = 7051, count = 1,bind = 1},
			{type = 0, id = 6659, count = 1,bind = 1},
			{type = 0, id = 5364, count = 3,bind = 1},
			{type = 0, id = 6370, count = 3,bind = 1},
			{type = 0, id = 7781, count = 2,bind = 1} --仙钻5颗
		} },
		{ times = 800, award = { 
			{type = 0, id = 7039, count = 1,bind = 1},
			{type = 0, id = 6887, count = 1,bind = 1},
			{type = 0, id = 5365, count = 1,bind = 1},
			{type = 0, id = 6370, count = 4,bind = 1},
			{type = 0, id = 7781, count = 3,bind = 1} --仙钻5颗
		} },
		{ times = 1000, award = { 
			{type = 0, id = 7039, count = 2,bind = 1},
			{type = 0, id = 7650, count = 1,bind = 1},
			{type = 0, id = 5365, count = 2,bind = 1},
			{type = 0, id = 6370, count = 5,bind = 1},
			{type = 0, id = 7781, count = 4,bind = 1} --仙钻5颗 
		} },	
	},
}