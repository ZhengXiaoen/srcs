activity_DaJiDaLi =
{

	--登录奖励1
	loginGiveAward = 
	{
		--图标第几天显示
		openDay = {1,2,3},
		Info = {
			--连续登录1天
			{	
				name = "累计登录第1天",
				nameForClient= "<font color='#bbb07e'>累计登录达到</font><font color='#00c513'>1天</font>",
				award ={
					{type = 0, id = 507,count = 5,bind = 1},--金条(绑金)		
					{type = 0, id = 5363,count = 5,bind = 1},--一阶宝石袋
					{type = 0, id = 6886,count = 2,bind = 1},--补天石
					{type = 0, id = 459,count = 30,bind = 1},--星纹强化石
					{type = 0, id = 5171,count = 10,bind = 1},--神魂
				 }
			},
			
			--连续登录2天
			{	
				name = "累计登录第2天",
				nameForClient= "<font color='#bbb07e'>累计登录达到</font><font color='#00c513'>2天</font>",
				award ={
					{type = 0, id = 507,count = 7,bind = 1},--金条(绑金)		
					{type = 0, id = 5363,count = 7,bind = 1},--一阶宝石袋
					{type = 0, id = 6886,count = 3,bind = 1},--补天石
					{type = 0, id = 459,count = 50,bind = 1},--星纹强化石
					{type = 0, id = 5171,count = 20,bind = 1},--神魂
				 }
			},
			
			
			--连续登录3天
			{	
				name = "累计登录第3天",
				nameForClient= "<font color='#bbb07e'>累计登录达到</font><font color='#00c513'>3天</font>",
				award ={
					{type = 0, id = 507,count = 10,bind = 1},--金条(绑金)		
					{type = 0, id = 5363,count = 10,bind = 1},--一阶宝石袋
					{type = 0, id = 6886,count = 5,bind = 1},--补天石
					{type = 0, id = 459,count = 100,bind = 1},--星纹强化石
					{type = 0, id = 5171,count = 30,bind = 1},--神魂
				 }
			},
			
			
		},
	
	},

	--充值赠送 (累计三天有效)
	payGiveAward = 
	{
		--图标第几天显示
		openDay = {1,2,3},
		Info = 
		{
			--第1档
			{
				name = "充值有礼第1档",
				nameForClient= "<font color='#fac74b'>充值达到</font><font color='#00c513'>10000元宝</font>",
				needMoney = 10000,
				award =
				{
					{type = 0, id = 542,count = 1,bind = 1},--转生修为丹(小)
					{type = 0, id = 6731,count = 50,bind = 1},--培元丹
					{type = 0, id = 6862,count = 3,bind = 1},--坐骑丹
					{type = 0, id = 6660,count = 20,bind = 1},--女娲神石
				},
			},
			
			--第2档
			{
				name = "充值有礼第2档",
				nameForClient= "<font color='#fac74b'>充值达到</font><font color='#00c513'>50000元宝</font>",
				needMoney = 50000,
				award =
				{
					{type = 0, id = 542,count = 2,bind = 1},--转生修为丹(小)
					{type = 0, id = 6731,count = 100,bind = 1},--培元丹
					{type = 0, id = 6862,count = 10,bind = 1},--坐骑丹
					{type = 0, id = 6660,count = 30,bind = 1},--女娲神石
				},
			},
			--第3档
			{
				name = "充值有礼第3档",
				nameForClient= "<font color='#fac74b'>充值达到</font><font color='#00c513'>100000元宝</font>",
				needMoney = 100000,
				award =
				{
					{type = 0, id = 543,count = 1,bind = 1},--转生修为丹(中)
					{type = 0, id = 6731,count = 200,bind = 1},--培元丹
					{type = 0, id = 6862,count = 20,bind = 1},--坐骑丹
					{type = 0, id = 6660,count = 40,bind = 1},--女娲神石
				},
			},
			--第4档
			{
				name = "充值有礼第4档",
				nameForClient= "<font color='#fac74b'>充值达到</font><font color='#00c513'>200000元宝</font>",
				needMoney = 200000,
				award =
				{
					{type = 0, id = 543,count = 2,bind = 1},--转生修为丹(小)
					{type = 0, id = 6731,count = 500,bind = 1},--培元丹
					{type = 0, id = 6862,count = 50,bind = 1},--坐骑丹
					{type = 0, id = 6660,count = 50,bind = 1},--女娲神石
				},
			},
			--第5档
			{
				name = "充值有礼第5档",
				nameForClient= "<font color='#fac74b'>充值达到</font><font color='#00c513'>500000元宝</font>",
				needMoney = 500000,
				award =
				{
					{type = 0, id = 544,count = 1,bind = 1},--转生修为丹(小)
					{type = 0, id = 6731,count = 800,bind = 1},--培元丹
					{type = 0, id = 6862,count = 80,bind = 1},--坐骑丹
					{type = 0, id = 6660,count = 60,bind = 1},--女娲神石
				},
			},
			
			
		},
	
	},
	
	--为民除害3 （1-3天有效）
	killBoss = 
	{
		openDay = {1,2,3},
		Info = 
		{
			--第1档
			{
				name = "消灭15只BOSS",
				nameForClient= "<font color='#fac74b'>消灭野外BOSS</font><font color='#00c513'>15只</font>",
				needKillCount = 15,
				award =
				{
					{type = 0, id = 548,count = 10,bind = 1},--转生地宫证明		
					{type = 0, id = 678,count = 20,bind = 1},--副本传送卷
					{type = 0, id = 6817,count = 3,bind = 1},--峡谷召唤卷
					{type = 0, id = 6886,count = 2,bind = 1},--补天石
				},
			},
			
			
			--第2档
			{
				name = "消灭25只BOSS",
				nameForClient= "<font color='#fac74b'>消灭野外BOSS</font><font color='#00c513'>25只</font>",
				needKillCount = 25,
				award =
				{
					{type = 0, id = 548,count = 20,bind = 1},--转生地宫证明		
					{type = 0, id = 678,count = 40,bind = 1},--副本传送卷
					{type = 0, id = 6817,count = 6,bind = 1},--峡谷召唤卷
					{type = 0, id = 6886,count = 4,bind = 1},--补天石
				},
			},
			
			
			--第3档
			{
				name = "消灭40只BOSS",
				nameForClient= "<font color='#fac74b'>消灭野外BOSS</font><font color='#00c513'>40只</font>",
				needKillCount = 40,
				award =
				{
					{type = 0, id = 548,count = 30,bind = 1},--转生地宫证明		
					{type = 0, id = 678,count = 60,bind = 1},--副本传送卷
					{type = 0, id = 6817,count = 9,bind = 1},--峡谷召唤卷
					{type = 0, id = 6886,count = 6,bind = 1},--补天石
				},
			},
			--第4档
			{
				name = "消灭60只BOSS",
				nameForClient= "<font color='#fac74b'>消灭野外BOSS</font><font color='#00c513'>60只</font>",
				needKillCount = 60,
				award =
				{
					{type = 0, id = 548,count = 40,bind = 1},--转生地宫证明		
					{type = 0, id = 678,count = 80,bind = 1},--副本传送卷
					{type = 0, id = 6817,count = 12,bind = 1},--峡谷召唤卷
					{type = 0, id = 6886,count = 8,bind = 1},--补天石
				},
			},
			--第5档
			{
				name = "消灭80只BOSS",
				nameForClient= "<font color='#fac74b'>消灭野外BOSS</font><font color='#00c513'>80只</font>",
				needKillCount = 80,
				award =
				{
					{type = 0, id = 548,count = 50,bind = 1},--转生地宫证明		
					{type = 0, id = 678,count = 100,bind = 1},--副本传送卷
					{type = 0, id = 6817,count = 15,bind = 1},--峡谷召唤卷
					{type = 0, id = 6886,count = 10,bind = 1},--补天石
				},
			},
		}
	
	
	},
	

	
	--激情pk4
	happyPK = 
	{
		openDay = {1,2,3},
		Info = 
		{
			--第1档
			{
				name = "激情泡点击败3人",
				nameForClient= "<font color='#fac74b'>激情泡点击败</font><font color='#00c513'>3人</font>",
				killInScene = 110, --激情跑点的sceneid
				needKillCount = 3,
				award =
				{
					{type = 0, id = 85,count = 3,bind = 1},--祝福油		
					{type = 0, id = 537,count = 2,bind = 1},--宝石结晶
					{type = 0, id = 572,count = 2,bind = 1},--圣珠结晶
					{type = 0, id = 4741,count = 1,bind = 1},--九花玉露丸
				},
			},
			--第2档
			{
				name = "激情泡点击败6人",
				nameForClient= "<font color='#fac74b'>激情泡点击败</font><font color='#00c513'>6人</font>",
				killInScene = 110, --激情跑点的sceneid
				needKillCount = 6,
				award =
				{
					{type = 0, id = 85,count = 6,bind = 1},--祝福油		
					{type = 0, id = 537,count = 4,bind = 1},--宝石结晶
					{type = 0, id = 572,count = 4,bind = 1},--圣珠结晶
					{type = 0, id = 4741,count = 2,bind = 1},--九花玉露丸
				},
			},
			--第3档
			{
				name = "激情泡点击败12人",
				nameForClient= "<font color='#fac74b'>激情泡点击败</font><font color='#00c513'>12人</font>",
				killInScene = 110, --激情跑点的sceneid
				needKillCount = 12,
				award =
				{
					{type = 0, id = 85,count = 9,bind = 1},--祝福油		
					{type = 0, id = 537,count = 6,bind = 1},--宝石结晶
					{type = 0, id = 572,count = 6,bind = 1},--圣珠结晶
					{type = 0, id = 4741,count = 3,bind = 1},--九花玉露丸
				},
			},
			--第4档
			{
				name = "激情泡点击败20人",
				nameForClient= "<font color='#fac74b'>激情泡点击败</font><font color='#00c513'>20人</font>",
				killInScene = 110, --激情跑点的sceneid
				needKillCount = 20,
				award =
				{
					{type = 0, id = 85,count = 12,bind = 1},--祝福油		
					{type = 0, id = 537,count = 10,bind = 1},--宝石结晶
					{type = 0, id = 572,count = 10,bind = 1},--圣珠结晶
					{type = 0, id = 4741,count = 5,bind = 1},--九花玉露丸
				},
			},
			
			
			--第1档
			{
				name = "夺宝奇兵击败3人",
				nameForClient= "<font color='#fac74b'>夺宝奇兵击败</font><font color='#00c513'>3人</font>",
				killInScene = 234, --夺宝奇兵的sceneid
				needKillCount = 3,
				award =
				{
					{type = 0, id = 85,count = 3,bind = 1},--祝福油		
					{type = 0, id = 535,count = 8,bind = 1},--护符碎片(1000颗)
					{type = 0, id = 569,count = 8,bind = 1},--护盾碎片(1000颗)
					{type = 0, id = 6353,count = 2,bind = 1},--内功丹(小)
				},
			},
			--第2档
			{
				name = "夺宝奇兵击败6人",
				nameForClient= "<font color='#fac74b'>夺宝奇兵击败</font><font color='#00c513'>6人</font>",
				killInScene = 234, --夺宝奇兵的sceneid
				needKillCount = 6,
				award =
				{
					{type = 0, id = 85,count = 6,bind = 1},--祝福油		
					{type = 0, id = 535,count = 16,bind = 1},--护符碎片(1000颗)
					{type = 0, id = 569,count = 16,bind = 1},--护盾碎片(1000颗)
					{type = 0, id = 6353,count = 4,bind = 1},--内功丹(小)
				},
			},
			--第3档
			{
				name = "夺宝奇兵击败12人",
				nameForClient= "<font color='#fac74b'>夺宝奇兵击败</font><font color='#00c513'>12人</font>",
				killInScene = 234, --夺宝奇兵的sceneid
				needKillCount = 12,
				award =
				{
					{type = 0, id = 85,count = 9,bind = 1},--祝福油		
					{type = 0, id = 535,count = 24,bind = 1},--护符碎片(1000颗)
					{type = 0, id = 569,count = 24,bind = 1},--护盾碎片(1000颗)
					{type = 0, id = 6353,count = 6,bind = 1},--内功丹(小)
				},
			},
			--第4档
			{
				name = "夺宝奇兵击败20人",
				nameForClient= "<font color='#fac74b'>夺宝奇兵击败</font><font color='#00c513'>20人</font>",
				killInScene = 234, --夺宝奇兵的sceneid
				needKillCount = 20,
				award =
				{
					{type = 0, id = 85,count = 12,bind = 1},--祝福油		
					{type = 0, id = 535,count = 40,bind = 1},--护符碎片(1000颗)
					{type = 0, id = 569,count = 40,bind = 1},--护盾碎片(1000颗)
					{type = 0, id = 6353,count = 10,bind = 1},--内功丹(小)
				},
			},
			
		},
	
	},
	
	
	--每日限购5 (1-3天有效)
	buyGiveAward = 
	{
		openDay = {1,2,3},
		Info = 
		{
			{
				needMoney =68888,
				name ="68888元宝礼包",
				award =
				{
					{type = 0, id = 6657,count = 1,bind = 1},--时装礼盒	
					{type = 0, id = 6371,count = 1,bind = 1},--幻羽礼盒
					{type = 0, id = 6658,count = 1,bind = 1},--灵器礼盒
					{type = 0, id = 7043,count = 1,bind = 1},--足迹礼盒
					{type = 0, id = 6886,count = 200,bind = 1},--补天石
				},
			},
			
			{
				needMoney =128888,
				name ="128888元宝礼包",
				award =
				{
					{type = 0, id = 6658,count = 1,bind = 1},--灵器礼盒	
					{type = 0, id = 7047,count = 1,bind = 1},--坐骑礼盒	
					{type = 0, id = 6887,count = 1,bind = 1},--龍装1礼盒	
					{type = 0, id = 6659,count = 1,bind = 1},--传世首饰
					{type = 0, id = 6886,count = 300,bind = 1},--补天石
				},
			},
		},	
	},
	
	

	--第二天的活动
	
	--消费赠送6 （当日）
	comsumeGiveAward = 
	{
		openDay = {2,3},
		Info = 
		{
			{
				needMoney =10000,
				name ="消费1万元宝",
				nameForClient= "<font color='#fac74b'>消费达到</font><font color='#00c513'>1万元宝</font>",
				award =
				{
					{type = 0, id = 6403,count = 2,bind = 1},--五行石
					{type = 0, id = 6886,count = 2,bind = 1},--补天石
					{type = 0, id = 6709,count = 3,bind = 1},--蒙尘宝鉴
					{type = 0, id = 5363,count = 6,bind = 1},--一阶宝石袋
					{type = 0, id = 6691,count = 4,bind = 1},--时装碎片
				},
			},
			
			{
				needMoney =50000,
				name ="消费5万元宝",
				nameForClient= "<font color='#fac74b'>消费达到</font><font color='#00c513'>5万元宝</font>",
				award =
				{
					{type = 0, id = 6403,count = 4,bind = 1},--五行石
					{type = 0, id = 6886,count = 4,bind = 1},--补天石
					{type = 0, id = 6709,count = 6,bind = 1},--蒙尘宝鉴
					{type = 0, id = 5363,count = 12,bind = 1},--一阶宝石袋
					{type = 0, id = 6691,count = 8,bind = 1},--时装碎片
				},
			},
			{
				needMoney =100000,
				name ="消费10万元宝",
				nameForClient= "<font color='#fac74b'>消费达到</font><font color='#00c513'>10万元宝</font>",
				award =
				{
					{type = 0, id = 6403,count = 8,bind = 1},--五行石
					{type = 0, id = 6886,count = 8,bind = 1},--补天石
					{type = 0, id = 6709,count = 9,bind = 1},--蒙尘宝鉴
					{type = 0, id = 5363,count = 20,bind = 1},--一阶宝石袋
					{type = 0, id = 6691,count = 12,bind = 1},--时装碎片
				},
			},
			{
				needMoney =200000,
				name ="消费20万元宝",
				nameForClient= "<font color='#fac74b'>消费达到</font><font color='#00c513'>20万元宝</font>",
				award =
				{
					{type = 0, id = 7645,count = 1,bind = 1},--礼包一
					{type = 0, id = 6657,count = 1,bind = 1},--时装礼盒
					{type = 0, id = 5171,count = 20,bind = 1},--神魂20
					{type = 0, id = 5364,count = 4,bind = 1},--二阶宝石袋
					{type = 0, id = 6691,count = 16,bind = 1},--时装碎片
				},
			},
			{
				needMoney =500000,
				name ="消费50万元宝",
				nameForClient= "<font color='#fac74b'>消费达到</font><font color='#00c513'>50万元宝</font>",
				award =
				{
					{type = 0, id = 7646,count = 1,bind = 1},--礼包2
					{type = 0, id = 6371,count = 1,bind = 1},--幻羽礼盒
					{type = 0, id = 5171,count = 50,bind = 1},--神魂20
					{type = 0, id = 5364,count = 8,bind = 1},--二阶宝石袋
					{type = 0, id = 6691,count = 20,bind = 1},--时装碎片
				},
			},

			{
				needMoney =800000,
				name ="消费80万元宝",
				nameForClient= "<font color='#fac74b'>消费达到</font><font color='#00c513'>80万元宝</font>",
				award =
				{
					{type = 0, id = 7647,count = 1,bind = 1},--礼包3
					{type = 0, id = 7047,count = 1,bind = 1},--坐骑礼盒
					{type = 0, id = 5171,count = 80,bind = 1},--神魂80
					{type = 0, id = 5364,count = 12,bind = 1},--二阶宝石袋
					{type = 0, id = 6691,count = 25,bind = 1},--时装碎片
				},
			},

			{
				needMoney =1000000,
				name ="消费100万元宝",
				nameForClient= "<font color='#fac74b'>消费达到</font><font color='#00c513'>100万元宝</font>",
				award =
				{
					{type = 0, id = 7648,count = 1,bind = 1},--礼包4
					{type = 0, id = 6887,count = 1,bind = 1},--龍装礼盒
					{type = 0, id = 6659,count = 1,bind = 1},--传世礼盒
					{type = 0, id = 5171,count = 100,bind = 1},--神魂80
					{type = 0, id = 5365,count = 2,bind = 1},--三阶宝石袋
					{type = 0, id = 6691,count = 30,bind = 1},--时装碎片
				},
			},

			{
				needMoney =2000000,
				name ="消费200万元宝",
				nameForClient= "<font color='#fac74b'>消费达到</font><font color='#00c513'>200万元宝</font>",
				award =
				{
					{type = 0, id = 7649,count = 1,bind = 1},--礼包5
					{type = 0, id = 7039,count = 3,bind = 1},--至尊屠龙碎片
					{type = 0, id = 7650,count = 1,bind = 1},--龙腾首饰礼盒
					{type = 0, id = 5171,count = 200,bind = 1},--神魂80
					{type = 0, id = 5365,count = 4,bind = 1},--二阶宝石袋
					{type = 0, id = 6691,count = 40,bind = 1},--时装碎片
				},
			},
		},	
	},
	
	
	--副本多倍领取7  （当天）
	duobeiGiveAward = 
	{
		openDay = {2,3},
		Info = 
		{
			{
				needTime =3,
				name="领取3次多倍副本礼包",
				nameForClient= "<font color='#fac74b'>领取三倍达到</font><font color='#00c513'>3次</font>",
				award =
				{
					{type = 0, id = 459,count = 30,bind = 1},--星纹强化石		
					{type = 0, id = 81,count = 18,bind = 1},--万年人参
					{type = 0, id = 6369,count = 1,bind = 1},--绿色生肖袋
					{type = 0, id = 507,count = 3,bind = 1},--金条(绑金)
				},
			},
			
			{
				needTime =5,
				name ="领取5次多倍副本",
				nameForClient= "<font color='#fac74b'>领取三倍达到</font><font color='#00c513'>5次</font>",
				award =
				{
					{type = 0, id = 459,count = 50,bind = 1},--星纹强化石		
					{type = 0, id = 81,count = 28,bind = 1},--万年人参
					{type = 0, id = 6369,count = 1,bind = 1},--绿色生肖袋
					{type = 0, id = 507,count = 5,bind = 1},--金条(绑金)
				},
			},
			{
				needTime =8,
				name ="领取8次多倍副本",
				nameForClient= "<font color='#fac74b'>领取三倍达到</font><font color='#00c513'>8次</font>",
				award =
				{
					{type = 0, id = 459,count = 80,bind = 1},--星纹强化石		
					{type = 0, id = 81,count = 48,bind = 1},--万年人参
					{type = 0, id = 6369,count = 1,bind = 1},--绿色生肖袋
					{type = 0, id = 507,count = 8,bind = 1},--金条(绑金)
				},
			},
			{
				needTime =12,
				name ="领取12次多倍副本",
				nameForClient= "<font color='#fac74b'>领取三倍达到</font><font color='#00c513'>12次</font>",
				award =
				{
					{type = 0, id = 459,count = 120,bind = 1},--星纹强化石		
					{type = 0, id = 81,count = 68,bind = 1},--万年人参
					{type = 0, id = 6369,count = 1,bind = 1},--绿色生肖袋
					{type = 0, id = 507,count = 12,bind = 1},--金条(绑金)
				},
			},
			{
				needTime =18,
				name ="领取18次多倍副本",
				nameForClient= "<font color='#fac74b'>领取三倍达到</font><font color='#00c513'>18次</font>",
				award =
				{
					{type = 0, id = 459,count = 180,bind = 1},--星纹强化石		
					{type = 0, id = 81,count = 88,bind = 1},--万年人参
					{type = 0, id = 6369,count = 1,bind = 1},--绿色生肖袋
					{type = 0, id = 507,count = 18,bind = 1},--金条(绑金)
				},
			},
		},	
	},
	
	--进入跨服8  （当天）
	enterCross = 
	{
		openDay = {2,3},
		
		--进入3v3
		enter3V3 = 
		{	
			enterTime = 5,
			name = "参与5次3v3竞技",
				nameForClient= "<font color='#fac74b'>参与3V3竞技达到</font><font color='#00c513'>5次</font>",
			award =
			{
				{type = 0, id = 81,count = 58,bind = 1},--万年人参		
				{type = 0, id = 459,count = 88,bind = 1},--星纹强化石
				{type = 0, id = 464,count = 88,bind = 1},--1级羽毛
				{type = 0, id = 5171,count = 20,bind = 1},--神魂
			},
		},
		
		--消耗屠魔点
		consumeTuMoDian =
		{	
			--消耗1
			{
				spend =300,
				name = "消耗300屠魔点",
				nameForClient= "<font color='#fac74b'>消耗</font><font color='#00c513'>300点</font><font color='#fac74b'>屠魔值</font>",
				award =
				{
					{type = 0, id = 81,count = 58,bind = 1},--万年人参		
				    {type = 0, id = 459,count = 88,bind = 1},--星纹强化石
				    {type = 0, id = 464,count = 88,bind = 1},--1级羽毛
				    {type = 0, id = 5171,count = 20,bind = 1},--神魂
				},
			},
			--消耗2
			{
				spend =400,
				name = "消耗400屠魔点",
				nameForClient= "<font color='#fac74b'>消耗</font><font color='#00c513'>400点</font><font color='#fac74b'>屠魔值</font>",
				award =
				{
					{type = 0, id = 81,count = 88,bind = 1},--万年人参		
				    {type = 0, id = 459,count = 128,bind = 1},--星纹强化石
				    {type = 0, id = 464,count = 128,bind = 1},--1级羽毛
				    {type = 0, id = 5171,count = 50,bind = 1},--神魂
				},
			},
			--消耗3
			{
				spend =500,
				name = "消耗500屠魔点",
				nameForClient= "<font color='#fac74b'>消耗</font><font color='#00c513'>500点</font><font color='#fac74b'>屠魔值</font>",
				award =
				{
					{type = 0, id = 81,count = 88,bind = 1},--万年人参		
				    {type = 0, id = 459,count = 128,bind = 1},--星纹强化石
				    {type = 0, id = 464,count = 128,bind = 1},--1级羽毛
				    {type = 0, id = 5171,count = 50,bind = 1},--神魂
				},
			},
			--消耗4
			{
				spend =600,
				name = "消耗600屠魔点",
				nameForClient= "<font color='#fac74b'>消耗</font><font color='#00c513'>600点</font><font color='#fac74b'>屠魔值</font>",
				award =
				{
					{type = 0, id = 81,count = 88,bind = 1},--万年人参		
				    {type = 0, id = 459,count = 128,bind = 1},--星纹强化石
				    {type = 0, id = 464,count = 128,bind = 1},--1级羽毛
				    {type = 0, id = 5171,count = 50,bind = 1},--神魂
				},
			},
			
		
		},
	
		--参与3次远古押镖
		enterYuanGuYaBiao = 
		{
			enterTime = 3,
			name = "参与3次远古押镖",
			nameForClient= "<font color='#fac74b'>参与远古押镖达到</font><font color='#00c513'>3次</font>",
			award =
			{
				    {type = 0, id = 81,count = 58,bind = 1},--万年人参		
				    {type = 0, id = 459,count = 88,bind = 1},--星纹强化石
				    {type = 0, id = 464,count = 88,bind = 1},--1级羽毛
				    {type = 0, id = 5171,count = 20,bind = 1},--神魂
			},
		},
	},


---第三天配置
	
	--寻宝返利9
	xunbaoGiveAward =
	{
		openDay = {3},
		Info = 
		{
			--寻宝1
			{
				name = "寻宝返利1档",
			    nameForClient= "<font color='#fac74b'>探宝达到</font><font color='#00c513'>100次</font>",
				times =100,
				award =
				{
					{type = 0, id = 6886,count = 3,bind = 1},--补天石		
					{type = 0, id = 6271,count = 2,bind = 1},--五彩石
					{type = 0, id = 5951,count = 2,bind = 1},--时装升星符
					{type = 0, id = 5661,count = 2,bind = 1},--幻羽精华
				},
			},

			--寻宝2
			{
				name = "寻宝返利2档",
			    nameForClient= "<font color='#fac74b'>探宝达到</font><font color='#00c513'>300次</font>",
				times =300,
				award =
				{
					{type = 0, id = 6886,count = 6,bind = 1},--补天石		
					{type = 0, id = 6271,count = 4,bind = 1},--五彩石
					{type = 0, id = 5951,count = 4,bind = 1},--时装升星符
					{type = 0, id = 5661,count = 4,bind = 1},--幻羽精华
				},
			},

			--寻宝3
			{
				name = "寻宝返利3档",
			    nameForClient= "<font color='#fac74b'>探宝达到</font><font color='#00c513'>500次</font>",
				times =500,
				award =
				{
					{type = 0, id = 6886,count = 9,bind = 1},--补天石		
					{type = 0, id = 6271,count = 6,bind = 1},--五彩石
					{type = 0, id = 5951,count = 6,bind = 1},--时装升星符
					{type = 0, id = 5661,count = 6,bind = 1},--幻羽精华
				},
			},

			--寻宝4
			{
				name = "寻宝返利4档",
			    nameForClient= "<font color='#fac74b'>探宝达到</font><font color='#00c513'>1000次</font>",
				times =1000,
				award =
				{
					{type = 0, id = 6886,count = 12,bind = 1},--补天石		
					{type = 0, id = 6271,count = 8,bind = 1},--五彩石
					{type = 0, id = 5951,count = 8,bind = 1},--时装升星符
					{type = 0, id = 5661,count = 8,bind = 1},--幻羽精华
				},
			},

			--寻宝5
			{
				name = "寻宝返利5档",
			    nameForClient= "<font color='#fac74b'>探宝达到</font><font color='#00c513'>1500次</font>",
				times =1500,
				award =
				{
					{type = 0, id = 6886,count = 15,bind = 1},--补天石		
					{type = 0, id = 6271,count = 10,bind = 1},--五彩石
					{type = 0, id = 5951,count = 10,bind = 1},--时装升星符
					{type = 0, id = 5661,count = 10,bind = 1},--幻羽精华
				},
			},
		
		
		
		
		},
	},

	
	--勇闯险地10  （当天）
	chuangdituGiveAward =
	{
		openDay = {3},
		Info = 
		{
			--符文密境
			{
				name = "勇闯符文密境",
			    nameForClient= "<font color='#fac74b'>在</font><font color='#00c513'>符文秘籍</font><font color='#fac74b'>消灭BOSS达到</font><font color='#00c513'>3只</font>",
				sceneId ={634,635,636,637},
				times = 3,
				needBoss = true, --必须杀boss的写true，任意怪写boss
				award =
				{
					{type = 0, id = 5455,count = 1,bind = 1},--中级礼包		
					{type = 0, id = 6372,count = 2,bind = 1},--注魂丹(小)
					{type = 0, id = 6702,count = 2,bind = 1},--洛阳铲
					{type = 0, id = 507,count = 5,bind = 1},--金条(绑金)
				},
			},
			
			--蚩尤地宫
			{
				name = "勇闯蚩尤地宫",
			    nameForClient= "<font color='#fac74b'>在</font><font color='#00c513'>蚩尤地宫</font><font color='#fac74b'>消灭BOSS达到</font><font color='#00c513'>3只</font>",
				sceneId ={632},
				times = 3,
				needBoss = true, --必须杀boss的写true，任意怪写boss
				award =
				{
					{type = 0, id = 5455,count = 1,bind = 1},--中级礼包		
					{type = 0, id = 6372,count = 2,bind = 1},--注魂丹(小)
					{type = 0, id = 6702,count = 2,bind = 1},--洛阳铲
					{type = 0, id = 507,count = 5,bind = 1},--金条(绑金)
				},
			},
			
			
			--元神地宫1-6层
			{
				name = "勇闯元神地宫",
			    nameForClient= "<font color='#fac74b'>在</font><font color='#00c513'>元神地宫</font><font color='#fac74b'>消灭怪物达到</font><font color='#00c513'>180只</font>",
				sceneId ={569,570,571,572,573,574},
				times = 180,
				needBoss = false, --必须杀boss的写true，任意怪写boss
				award =
				{
					{type = 0, id = 5455,count = 1,bind = 1},--中级礼包		
					{type = 0, id = 6372,count = 2,bind = 1},--注魂丹(小)
					{type = 0, id = 6702,count = 2,bind = 1},--洛阳铲
					{type = 0, id = 507,count = 5,bind = 1},--金条(绑金)
				},
			},

			--混乱地界
			{
				name = "勇闯混乱地界",
			    nameForClient= "<font color='#fac74b'>在</font><font color='#00c513'>混乱地界</font><font color='#fac74b'>消灭怪物达到</font><font color='#00c513'>50只</font>",
				sceneId ={569,570,571,572,573,574},
				sceneId ={568},
				times = 50,
				needBoss = false, --必须杀boss的写true，任意怪写boss
				award =
				{
					{type = 0, id = 5455,count = 1,bind = 1},--中级礼包		
					{type = 0, id = 6372,count = 2,bind = 1},--注魂丹(小)
					{type = 0, id = 6702,count = 2,bind = 1},--洛阳铲
					{type = 0, id = 507,count = 5,bind = 1},--金条(绑金)
				},
			},

			--混沌地界
			{
				name = "勇闯混沌地界",
			    nameForClient= "<font color='#fac74b'>在</font><font color='#00c513'>混沌地界</font><font color='#fac74b'>消灭BOSS达到</font><font color='#00c513'>3只</font>",
				sceneId ={344,345,346,633},
				times = 3,
				needBoss = true, --必须杀boss的写true，任意怪写boss
				award =
				{
					{type = 0, id = 5455,count = 1,bind = 1},--中级礼包		
					{type = 0, id = 6372,count = 2,bind = 1},--注魂丹(小)
					{type = 0, id = 6702,count = 2,bind = 1},--洛阳铲
					{type = 0, id = 507,count = 5,bind = 1},--金条(绑金)
				},
			},
		
		
		
		
		},
	},

	
	
	--小怪终结者11
	killMonsterGiveAward =
	{
		openDay = {3},
		Info = 
		{
			--第1档
			{
				name = "小怪终结者1阶",
				nameForClient= "<font color='#bbb07e'>消灭任意怪物</font><font color='#00c513'>1000只</font>",
				needKill =1000,
				award =
				{
					{type = 0, id = 5455,count = 1,bind = 1},--中级礼包		
					{type = 0, id = 561,count = 1,bind = 1},--天山雪莲(120w)
					{type = 0, id = 5468,count = 1,bind = 1},--神级经验玉
					{type = 0, id = 6862,count = 2,bind = 1},--坐骑丹
				},
			
			},

			--第2档
			{
				name = "小怪终结者2阶",
				nameForClient= "<font color='#bbb07e'>消灭任意怪物</font><font color='#00c513'>2000只</font>",
				needKill =2000,
				award =
				{
					{type = 0, id = 5455,count = 1,bind = 1},--中级礼包		
					{type = 0, id = 561,count = 2,bind = 1},--天山雪莲(120w)
					{type = 0, id = 5468,count = 2,bind = 1},--神级经验玉
					{type = 0, id = 6862,count = 4,bind = 1},--坐骑丹
				},
			
			},

			--第3档
			{
				name = "小怪终结者3阶",
				nameForClient= "<font color='#bbb07e'>消灭任意怪物</font><font color='#00c513'>3000只</font>",
				needKill =3000,
				award =
				{
					{type = 0, id = 5455,count = 1,bind = 1},--中级礼包		
					{type = 0, id = 561,count = 3,bind = 1},--天山雪莲(120w)
					{type = 0, id = 5468,count = 3,bind = 1},--神级经验玉
					{type = 0, id = 6862,count = 6,bind = 1},--坐骑丹
				},
			
			},

			--第4档
			{
				name = "小怪终结者4阶",
				nameForClient= "<font color='#bbb07e'>消灭任意怪物</font><font color='#00c513'>5000只</font>",
				needKill =5000,
				award =
				{
					{type = 0, id = 5455,count = 1,bind = 1},--中级礼包		
					{type = 0, id = 561,count = 4,bind = 1},--天山雪莲(120w)
					{type = 0, id = 5468,count = 4,bind = 1},--神级经验玉
					{type = 0, id = 6862,count = 8,bind = 1},--坐骑丹
				},
			
			},

			--第5档
			{
				name = "小怪终结者5阶",
				nameForClient= "<font color='#bbb07e'>消灭任意怪物</font><font color='#00c513'>8000只</font>",
				needKill =8000,
				award =
				{
					{type = 0, id = 5455,count = 1,bind = 1},--中级礼包		
					{type = 0, id = 561,count = 5,bind = 1},--天山雪莲(120w)
					{type = 0, id = 5468,count = 5,bind = 1},--神级经验玉
					{type = 0, id = 6862,count = 10,bind = 1},--坐骑丹
				},
			
			},
		},
	
	},
	
	--累计充值12
	payGiveAwardNew	= 
	{
		--图标第几天显示
		openDay = {1,2,3},
		needMoney ={10000,100000},
		Info = 
		{
			--第1档
			{
				{
					name = "充值累计1天",
					nameForClient= "<font color='#fac74b'>累计1天充值达到</font><font color='#00c513'>10000元宝</font>",
					--needMoney = 1000,
					award =
					{
						{type = 0, id = 542,count = 1,bind = 1},--转生修为丹(小)
						{type = 0, id = 6862,count = 3,bind = 1},--坐骑丹
						{type = 0, id = 6660,count = 10,bind = 1},--女娲神石
						{type = 0, id = 81,count = 18,bind = 1},--万年人参
					},
				},
				
				{
					name = "充值累计2天",
					nameForClient= "<font color='#fac74b'>累计2天充值达到</font><font color='#00c513'>10000元宝</font>",
					--needMoney = 1000,
					award =
					{
						{type = 0, id = 542,count = 2,bind = 1},--转生修为丹(小)
						{type = 0, id = 6862,count = 6,bind = 1},--坐骑丹
						{type = 0, id = 6660,count = 20,bind = 1},--女娲神石
						{type = 0, id = 81,count = 28,bind = 1},--万年人参
					},
				},
				
				{
					name = "充值累计3天",
					nameForClient= "<font color='#fac74b'>累计3天充值达到</font><font color='#00c513'>10000元宝</font>",
					--needMoney = 1000,
					award =
					{
						{type = 0, id = 542,count = 3,bind = 1},--转生修为丹(小)
						{type = 0, id = 6862,count = 10,bind = 1},--坐骑丹
						{type = 0, id = 6660,count = 30,bind = 1},--女娲神石
						{type = 0, id = 81,count = 38,bind = 1},--万年人参
					},
				},
			
			
			},
			
			--第2档
			{
				{
					name = "充值累计1天",
					nameForClient= "<font color='#fac74b'>累计1天充值达到</font><font color='#00c513'>100000元宝</font>",
					--needMoney = 1000,
					award =
					{
						{type = 0, id = 543,count = 1,bind = 1},--转生修为丹(小)
						{type = 0, id = 6862,count = 20,bind = 1},--坐骑丹
						{type = 0, id = 6660,count = 20,bind = 1},--女娲神石
						{type = 0, id = 81,count = 58,bind = 1},--万年人参
					},
				},
				
				{
					name = "充值累计2天",
					nameForClient= "<font color='#fac74b'>累计2天充值达到</font><font color='#00c513'>100000元宝</font>",
					--needMoney = 1000,
					award =
					{
						{type = 0, id = 543,count = 2,bind = 1},--转生修为丹(小)
						{type = 0, id = 6862,count = 40,bind = 1},--坐骑丹
						{type = 0, id = 6660,count = 40,bind = 1},--女娲神石
						{type = 0, id = 81,count = 88,bind = 1},--万年人参
					},
				},
				
				{
					name = "充值累计3天",
					nameForClient= "<font color='#fac74b'>累计3天充值达到</font><font color='#00c513'>100000元宝</font>",
					--needMoney = 1000,
					award =
					{
						{type = 0, id = 543,count = 3,bind = 1},--转生修为丹(小)
						{type = 0, id = 6862,count = 80,bind = 1},--坐骑丹
						{type = 0, id = 6660,count = 80,bind = 1},--女娲神石
						{type = 0, id = 81,count = 188,bind = 1},--万年人参
					},
				},
			
			
			},
		},	
	},





}