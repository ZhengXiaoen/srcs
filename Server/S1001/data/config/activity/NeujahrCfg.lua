--元旦活动
NeujahrCfg =
{
		
	--活动时间（开始-结束(包括结束当天)）
	time = {2018,1,1, 2018,1,3},

	--登录礼包
	LoginGift = 
	{
		award = 
		{
				{type = 0, id = 507, count = 5,bind = 1},--金条(绑定)*5
				{type = 0, id = 547, count = 3,bind = 1},--江湖令*3	
				{type = 0, id = 561, count = 1,bind = 1},--天山雪莲120W*3
				{type = 0, id = 80, count = 199,bind = 1},--疗伤药*199				
				{type = 0, id = 463, count = 3,bind = 1},--战将附体令*3
				{type = 0, id = 510, count = 3,bind = 1},--赎罪药水*3
					
		}
	},
	
	--充值礼包
	ChongZhiGift =
	{
		{
			needChongzhiYB = 1000, --一天的是累计的
			jiazhi = 6888,
			award = 
			{
				{type = 0, id = 542, count = 2,bind = 1},--转生修为丹(小)*2
				{type = 0, id = 5126, count = 1,bind = 1},--中级BOSS挑战卷*1
				{type = 0, id = 5468, count = 5,bind = 1},--神级经验玉*5
				{type = 0, id = 6130, count = 2,bind = 1},--灵力精华中*2
				{type = 0, id = 469, count = 15,bind = 1},--书页
				{type = 0, id = 81, count = 588,bind = 1},--万年人参*588	
		
			}
		}
	},


	--全服双倍
	
	--兑换有礼(兑换灯笼)
	JiYanHua =
	{
		--第1档
		{
			YanHuaId = 6359,
			needItemCount = 10,
			txt="元旦礼包",
			award={
				{type = 0, id = 459, count = 100,bind = 1},--星纹强化石*100
				{type = 0, id = 511, count = 20,bind = 1},--100万经验丹*20
				{type = 0, id = 548, count = 2,bind = 1},--转生地宫证明*2
				{type = 0, id = 6360, count = 1,bind = 1},--元旦大礼包*1
				  },
		},
		--第2档
		{
			YanHuaId = 6359,
			needItemCount = 30,
			txt="元旦大礼包",
			award={
				{type = 0, id = 459, count = 400,bind = 1},--星纹强化石*400
				{type = 0, id = 511, count = 80,bind = 1},--100万经验丹*80
				{type = 0, id = 548, count = 8,bind = 1},--转生地宫证明*8
				{type = 0, id = 6360, count = 4,bind = 1},--元旦大礼包*4
				  },
		},
		--第3档
		{
			YanHuaId = 6359,
			needItemCount = 50,
			txt="元旦超级礼包",
			award={
				{type = 0, id = 459, count = 800,bind = 1},--星纹强化石*800
				{type = 0, id = 511, count = 160,bind = 1},--100万经验丹*160
				{type = 0, id = 548, count = 16,bind = 1},--转生地宫证明*16
				{type = 0, id = 6360, count = 8,bind = 1},--元旦大礼包*8
				  },
		},
		--第4档
		{
			YanHuaId = 6359,
			needItemCount = 100,
			txt="元旦终极礼包",
			award={
				{type = 0, id = 459, count = 1800,bind = 1},--星纹强化石*1800
				{type = 0, id = 511, count = 360,bind = 1},--100万经验丹*360
				{type = 0, id = 548, count = 36,bind = 1},--转生地宫证明*36
				{type = 0, id = 6360, count = 18,bind = 1},--元旦大礼包*18
				  },
		},

	},

}