activity_jingji =
{

	--登录奖励1
	loginGiveAward = 
	{
		Info = {
			name = "登录奖励",
			nameForClient= "<font color='#bbb07e'>累计登录达到</font><font color='#00c513'>1天</font>",
			award ={
				{type = 0, id = 81,count = 88,bind = 1},--万年人参*88		
				{type = 0, id = 507,count = 3,bind = 1},--金条(绑定)*3
				{type = 0, id = 537,count = 4,bind = 1},--宝石结晶(100)*4
				{type = 0, id = 572,count = 4,bind = 1},--圣珠结晶(100)*4
				{type = 0, id = 6660,count = 30,bind = 1},--女娲神石*30
				{type = 0, id = 561,count = 1,bind = 1},--女娲神石*30
			 },			
		},
	},
	--充值转盘2
	JingjiZhuanPan= 
	{		
		--最高免费5次
		toptime = 10,
		--记录的上限
		logCount =50, 
		
		--每充值5000元宝
		needPay =10000,
		
		award ={
				{name = "星纹强化石",type = 0,id = 459,count = 100,bind = 1,rate = 5,},
				{name = "元神丹(小)",type = 0,id = 6297,count = 1,bind = 1,rate = 5,},
				{name = "五行石",type = 0,id = 6403,count = 5,bind = 1,rate = 5,},
				{name = "五彩石",type = 0,id = 6271,count = 5,bind = 1,rate = 5,},
				{name = "圣珠结晶(1000)",type = 0,id = 573,count = 1,bind = 1,rate = 5,},
				{name = "宝石结晶(1000)",type = 0,id = 538,count = 1,bind = 1,rate = 5,},
				{name = "1级羽毛",type = 0,id = 464,count = 100,bind = 1,rate = 5,},
				{name = "转生修为丹(小)",type = 0,id = 542,count = 1,bind = 1,rate = 15,},
				{name = "火龙结晶(小)",type = 0,id = 7194,count = 1,bind = 1,rate = 15,},
				{name = "功勋令牌(小)",type = 0,id = 484,count = 1,bind = 1,rate = 15,},
				{name = "斗笠精华(小)",type = 0,id = 5645,count = 1,bind = 1,rate = 15,},
				{name = "成就令牌(小)",type = 0,id = 488,count = 1,bind = 1,rate = 15,},
				{name = "火龙结晶(小)",type = 0,id = 7194,count = 1,bind = 1,rate = 16,},
				{name = "特戒结晶(1)",type = 0,id = 527,count = 1,bind = 1,rate = 16,},
				{name = "神魂",type = 0,id = 5171,count = 50,bind = 1,rate = 17,},
				{name = "三阶宝石袋",type = 0,id = 5365,count = 1,bind = 1,rate = 18,},
				{name = "女娲神石",type = 0,id = 6660,count = 20,bind = 1,rate = 19,},
				{name = "绿色生肖袋",type = 0,id = 6369,count = 1,bind = 1,rate = 20,},
				{name = "时装礼盒",type = 0,id = 6657,count = 1,bind = 1,rate = 21,},
				{name = "灵器礼盒",type = 0,id = 6658,count = 1,bind = 1,rate = 22,},
				{name = "蓝色生肖带",type = 0,id = 6370,count = 1,bind = 1,rate = 23,},
				{name = "幻羽礼盒",type = 0,id = 6371,count = 1,bind = 1,rate = 24,},
				{name = "饰品箱",type = 0,id = 6368,count = 1,bind = 1,rate = 25,},
				{name = "豪礼宝箱",type = 0,id = 6363,count = 1,bind = 1,rate = 26,},
				{name = "传世礼盒",type = 0,id = 6659,count = 1,bind = 1,rate = 27,},
				{name = "坐骑礼盒",type = 0,id = 7047,count = 1,bind = 1,rate = 28,},
				{name = "三国时装礼盒",type = 0,id = 7051,count = 1,bind = 1,rate = 29,},
				{name = "紫色生肖袋",type = 0,id = 6819,count = 1,bind = 1,rate = 35,},	
			},
	},

	--累计充值3
	payGiveAwardNew	= 
	{
		needMoney ={200000,1000000},
		Info = 
		{
			--第1档
			{
				{
					name = "充值累计1天",
					nameForClient= "<font color='#fac74b'>累计1天充值达到</font><font color='#00c513'>20万元宝</font>",
					--needMoney = 1000,
					award =
					{
						{type = 0,id = 7780,count = 2,bind = 1},--仙钻*4
						{type = 0,id = 7046,count = 10,bind = 1},--三国时装碎片*10
						{type = 0,id = 6363,count = 2,bind = 1},--壕礼宝箱*2
						{type = 0,id = 6369,count = 1,bind = 1},--绿色生肖袋
						{type = 0,id = 7282,count = 2,bind = 1},--九龍珠
					},
				},
				
				{
					name = "充值累计2天",
					nameForClient= "<font color='#fac74b'>累计2天充值达到</font><font color='#00c513'>20万元宝</font>",
					--needMoney = 1000,
					award =
					{
						{type = 0,id = 7780,count = 4,bind = 1},--仙钻*4
						{type = 0,id = 7043,count = 1,bind = 1},--足迹礼盒*1
						{type = 0,id = 6363,count = 3,bind = 1},--豪礼宝箱*3
						{type = 0,id = 6370,count = 1,bind = 1},--蓝色生肖袋*1
						{type = 0,id = 7282,count = 4,bind = 1},--九龍珠*4
					},
				},
				
				{
					name = "充值累计3天",
					nameForClient= "<font color='#fac74b'>累计3天充值达到</font><font color='#00c513'>20万元宝</font>",
					--needMoney = 1000,
					award =
					{
						{type = 0,id = 7780,count = 6,bind = 1},--仙钻*4
						{type = 0,id = 7046,count = 10,bind = 1},--三国时装碎片*10
						{type = 0,id = 6363,count = 4,bind = 1},--豪礼宝箱*4
						{type = 0,id = 6370,count = 2,bind = 1},--蓝色生肖带*2
						{type = 0,id = 7282,count = 6,bind = 1},--九龍珠*6
					},
				},
			
			
			},
			
			--第2档
			{
				{
					name = "充值累计1天",
					nameForClient= "<font color='#fac74b'>累计1天充值达到</font><font color='#00c513'>200万元宝</font>",
					--needMoney = 1000,
					award =
					{
						{type = 0,id = 7039,count = 1,bind = 1},--至尊屠龙碎片*1
						{type = 0,id = 6887,count = 2,bind = 1},--龍装Ⅰ首饰*2
						{type = 0,id = 7781,count = 2,bind = 1},--仙钻*10
						{type = 0,id = 6370,count = 2,bind = 1},--蓝色生肖袋*2
						{type = 0,id = 7282,count = 10,bind = 1},--九龍珠*10
					},
				},
				
				{
					name = "充值累计2天",
					nameForClient= "<font color='#fac74b'>累计2天充值达到</font><font color='#00c513'>200万元宝</font>",
					--needMoney = 1000,
					award =
					{
						{type = 0,id = 7039,count = 2,bind = 1},--至尊屠龙碎片*2
						{type = 0,id = 6887,count = 4,bind = 1},--龍装Ⅰ首饰*4
						{type = 0,id = 7781,count = 3,bind = 1},--仙钻*10
						{type = 0,id = 6819,count = 1,bind = 1},--紫色生肖袋*1
						{type = 0,id = 7282,count = 10,bind = 1},--九龍珠*10
					},
				},
				
				{
					name = "充值累计3天",
					nameForClient= "<font color='#fac74b'>累计3天充值达到</font><font color='#00c513'>200万元宝</font>",
					--needMoney = 1000,
					award =
					{
						{type = 0,id = 7039,count = 3,bind = 1},--至尊屠龙碎片*3
						{type = 0,id = 6820,count = 4,bind = 1},--龍装Ⅱ装备箱*1
						{type = 0,id = 7781,count = 5,bind = 1},--仙钻*10
						{type = 0,id = 6819,count = 2,bind = 1},--紫色生肖袋*2
						{type = 0,id = 7282,count = 10,bind = 1},--九龍珠*10
					},
				},
			
			
			},
		},	
	},
	
	--折扣特卖4
	SpecilDeal = 
	{
		{
			name = "坐骑丹",
			needMoney =7000,
			Money =10000,
			count =10,
			award =
			{
				{type = 0, id = 6862,count = 10,bind = 1},--坐骑丹
			},
		},
		{
			name = "火龙结晶(小)",
			needMoney =7000,
			Money =10000,
			count =10,
			award =
			{
				{type = 0, id = 7194,count = 10,bind = 1},--火龙结晶(小)
		    },
		},
		{
			name = "九龍珠",
			needMoney =21000,
			Money =30000,
			count =10,
			award =
			{
				{type = 0, id = 7282,count = 10,bind = 1},--九龍珠
			},
		},
		{
			name = "宝石结晶(1000)",
			needMoney =70000,
			Money =100000,
			count =10,
			award =
			{
				{type = 0, id = 538,count = 10,bind = 1},--宝石结晶(1000)
			},
		},
		{
			name = "圣珠结晶(1000)",
			needMoney =70000,
			Money =100000,
			count =10,
			award =
			{
				{type = 0, id = 573,count = 10,bind = 1},--圣珠结晶(1000)
			},
		},
		{
			name = "特戒结晶(1)",
			needMoney =70000,
			Money =100000,
			count =10,
			award =
			{
				{type = 0, id = 527,count = 10,bind = 1},--特戒结晶(1)
			},
		},
		{
			name = "1级羽毛",
			needMoney =7000,
			Money =10000,
			count =10,
			award =
			{
				{type = 0, id = 464,count = 100,bind = 1},--1级羽毛
			},
		},
		{
			name = "神魂",
			needMoney =7000,
			Money =10000,
			count =10,
			award =
			{
				{type = 0, id = 5171,count = 50,bind = 1},--转生修为丹(小)
			},
		},
		{
			name = "斗笠精华(小)",
			needMoney =7000,
			Money =10000,
			count =10,
			award =
			{
				{type = 0, id = 5645,count = 10,bind = 1},--斗笠精华(小)
			},
		},
		{
			name = "戒灵粉尘(100)",
			needMoney =7000,
			Money =10000,
			count =10,
			award =
			{
				{type = 0, id = 7618,count = 10,bind = 1},--戒灵粉尘(100)
			},
		},
		{
			name = "元神丹(小)",
			needMoney =70000,
			Money =100000,
			count =10,
			award =
			{
				{type = 0, id = 6297,count = 10,bind = 1},--元神丹(小)
			},
		},
		{
			name = "转生修为丹(小)",
			needMoney =35000,
			Money =50000,
			count =10,
			award =
			{
				{type = 0, id = 542,count = 5,bind = 1},--转生修为丹(小)
			},
		},
	
	},
   --宝石竞技 6
   GemRank =
   {
    --第一档
        {
            count = 30000,   --消耗数量
            award = 
            {
                {type = 0, id = 6691,count = 5,bind = 1},--西游时装碎片*5
            },
        },
     --第二档
        {
            count = 60000,   --消耗数量
            award = 
            {
                {type = 0, id = 6691,count = 10,bind = 1},--西游时装碎片*10
            },
        },
     --第三档
        {
            count = 120000,   --消耗数量
            award = 
            {
                {type = 0, id = 6691,count = 15,bind = 1},--西游时装碎片*15
            },
        },
     --第四档
        {
            count = 180000,   --消耗数量
            award = 
            {
                {type = 0, id = 6691,count = 20,bind = 1},--西游时装碎片*20
            },
        },
     --第五档
        {
            count = 300000,   --消耗数量
            award = 
            {
                {type = 0, id = 6691,count = 25,bind = 1},--西游时装碎片*25
            },
        },
   },
  --圣珠竞技 7
   PeartRank =
   {
    --第一档
        {
            count = 30000,   --消耗数量
            award = 
            {
                {type = 0, id = 7810,count = 5,bind = 1},--幻羽碎片*5
            },
        },
     --第二档
        {
            count = 60000,   --消耗数量
            award = 
            {
                {type = 0, id = 7810,count = 10,bind = 1},--幻羽碎片*10
            },
        },
     --第三档
        {
            count = 120000,   --消耗数量
            award = 
            {
                {type = 0, id = 7810,count = 15,bind = 1},--幻羽碎片*15
            },
        },
     --第四档
        {
            count = 180000,   --消耗数量
            award = 
            {
                {type = 0, id = 7810,count = 20,bind = 1},--幻羽碎片*20
            },
        },
     --第五档
        {
            count = 300000,   --消耗数量
            award = 
            {
                {type = 0, id = 7810,count = 25,bind = 1},--幻羽碎片*25
            },
        },
   },
  --坐骑丹竞技 8
   MountRank =
   {
    --第一档
        {
            count = 300,   --消耗数量
            award = 
            {
                {type = 0, id = 7811,count = 5,bind = 1},--坐骑碎片*5
            },
        },
     --第二档
        {
            count = 600,   --消耗数量
            award = 
            {
                {type = 0, id = 7811,count = 10,bind = 1},--坐骑碎片*5
            },
        },
     --第三档
        {
            count = 1200,   --消耗数量
            award = 
            {
                {type = 0, id = 7811,count = 15,bind = 1},--坐骑碎片*10
            },
        },
     --第四档
        {
            count = 1800,   --消耗数量
            award = 
            {
                {type = 0,id = 7811,count = 20,bind = 1},--坐骑碎片*15
            },
        },
     --第五档
        {
            count = 3000,   --消耗数量
            award = 
            {
                {type = 0, id = 7811,count = 25,bind = 1},--坐骑碎片*20
            },
        },
   },
   --特戒竞技 9
   RingRank =
   {
    --第一档
        {
            count = 30,   --消耗数量
            award = 
            {
                {type = 0, id = 7046,count = 5,bind = 1},--三国时装碎片*5
            },
        },
     --第二档
        {
            count = 60,   --消耗数量
            award = 
            {
                {type = 0, id = 7046,count = 10,bind = 1},--三国时装碎片*5
            },
        },
     --第三档
        {
            count = 90,   --消耗数量
            award = 
            {
                {type = 0, id = 7046,count = 15,bind = 1},--三国时装碎片*10
            },
        },
     --第四档
        {
            count = 180,   --消耗数量
            award = 
            {
                {type = 0, id = 7046,count = 20,bind = 1},--三国时装碎片*15
            },
        },
     --第五档
        {
            count = 300,   --消耗数量
            award = 
            {
                {type = 0, id = 7046,count = 25,bind = 1},--三国时装碎片*20
            },
        },
   },
   --绝版武器 10
   SpecialWeapon = 
   {
        --竞技大赛
        {
            {   
                texiao = 129,
                consume = 
                {
                    {type = 15, id = 0, count = 188888},
                },
                award = 
                {
                    {type = 0, id = 7719,count = 1,bind = 1},--转生修为丹(小)
                },
            },
        },
        --圣诞来袭
        {
             {
                texiao = 292,
                consume = 
                {
                    {type = 15, id = 0, count = 198888},
                },
                award = 
                {
                    {type = 0, id = 7802,count = 1,bind = 1,sex = 0},--转生修为丹(小)
                    {type = 0, id = 7803,count = 1,bind = 1,sex = 1},--转生修为丹(小)
                },
           
            },
            {
                texiao = 130,
                consume = 
                {
                    {type = 15, id = 0, count = 198888},
                },
                award = 
                {
                    {type = 0, id = 7804,count = 1,bind = 1},--转生修为丹(小)
                },
            },
        },
   },
   
	-- 消费狂欢：(圣诞来袭)
	ChristmasConsume = 
	{
		{
			consumeYb = 100000, -- 每日消费满多少元宝
			award = 
			{
				{type = 0,id = 7812,count = 5,bind = 1},--雪球
				{type = 0,id = 459,count = 18,bind = 1},--星纹强化石*18
				{type = 0,id = 81,count = 68,bind = 1},--万年人参*68
				{type = 0,id = 7197,count = 5,bind = 1},--玛法晶块*5
				{type = 0,id = 6691,count = 5,bind = 1},--西游时装碎片*5
				{type = 0,id = 7780,count = 2,bind = 1},--仙钻*2
			},
		},
		{
			consumeYb = 200000, -- 每日消费满多少元宝
			award = 
			{
				{type = 0,id = 7812,count = 5,bind = 1},--雪球
				{type = 0,id = 459,count = 28,bind = 1},--星纹强化石*28
				{type = 0,id = 81,count = 128,bind = 1},--万年人参*128
				{type = 0,id = 7197,count = 10,bind = 1},--玛法晶块*10
				{type = 0,id = 6691,count = 10,bind = 1},--西游时装碎片*10
				{type = 0,id = 7780,count = 4,bind = 1},--仙钻*2
			},
		},
		{
			consumeYb = 300000, -- 每日消费满多少元宝
			award = 
			{
				{type = 0,id = 7812,count = 5,bind = 1},--雪球
				{type = 0,id = 459,count = 38,bind = 1},--星纹强化石*38
				{type = 0,id = 81,count = 188,bind = 1},--万年人参*188
				{type = 0,id = 7197,count = 15,bind = 1},--玛法晶块*15
				{type = 0,id = 6691,count = 18,bind = 1},--西游时装碎片*18
				{type = 0,id = 7780,count = 6,bind = 1},--仙钻*2
			},
		},
		{
			consumeYb = 500000, -- 每日消费满多少元宝
			award = 
			{
				{type = 0,id = 7812,count = 5,bind = 1},--雪球
				{type = 0,id = 459,count = 58,bind = 1},--星纹强化石*58
				{type = 0,id = 81,count = 258,bind = 1},--万年人参*258
				{type = 0,id = 7197,count = 20,bind = 1},--玛法晶块*20
				{type = 0,id = 6657,count = 1,bind = 1},--西游时装礼盒*1
				{type = 0,id = 7780,count = 8,bind = 1},--仙钻*2
			},
		},
	},
	
	-- 圣诞BOSS：(圣诞来袭)
	ChristmasBoss = 
	{
		sceneId = 10,
		bossId = 1395, -- boss ID
		range = {0,0,-1,-1}-- boss 范围，左上角坐标，右下角坐标
	},
}