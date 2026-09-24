--采集怪奖励
CollectingMonsterCfg =
{
	--檀木宝箱
	{
		monsterid=494,
		name="檀木宝箱",
		reward = {			
			{type = 5, id = 0, min = 50000, max = 200000, quality = 0, strong = 0, bind = 1,job = 0},--绑定金币5W

		}, 
	},
	--青铜宝箱
	{
		monsterid=495,
		name="青铜宝箱",
		reward = {			

			{type = 5, id = 0, min = 100000, max = 200000, quality = 0, strong = 0, bind = 1,job = 0},--绑定金币5W
			{type = 2, id = 0, min = 200000, max = 3000000, quality = 0, strong = 0, bind = 1,job = 0},--绑定金币5W


		}, 
	},
	--白银宝箱
	{
		monsterid=496,
		name="白银宝箱",
		reward = {			
			{type = 5, id = 0, min = 100000, max = 200000, quality = 0, strong = 0, bind = 1,job = 0},--绑定金币5W
			{type = 2, id = 0, min = 200000, max = 3000000, quality = 0, strong = 0, bind = 1,job = 0},--绑定金币5W
			{type = 46, id = 0, min = 500, max = 2000, quality = 0, strong = 0, bind = 1,job = 0},--绑定金币5W
			{type = 45, id = 0, min = 500, max = 2000, quality = 0, strong = 0, bind = 1,job = 0},--绑定金币5W
			{type = 41, id = 0, min = 200, max = 1000, quality = 0, strong = 0, bind = 1,job = 0},--绑定金币5W						
			{type = 11, id = 0, min = 500, max = 2000, quality = 0, strong = 0, bind = 1,job = 0},--绑定金币5W

		}, 
		propability2	= 15 ,	--机率	
		reward2 = { --1组		    
			[1]={type=0,id=469,count=1,quality = 0, strong = 0, bind = 0,job = 0},  --书页
		},
		propability3	= 200 ,				
		reward3 = {--2组		    	
			[1]={type=0,id=469,count=1,quality = 0, strong = 0, bind = 0,job = 0},  --书页
		}, 
	},
	--黄金宝箱
	{
		monsterid=497,
		name="黄金宝箱",
		reward = {			
			{type = 5, id = 0, min = 100000, max = 200000, quality = 0, strong = 0, bind = 1,job = 0},--绑定金币5W
			{type = 2, id = 0, min = 200000, max = 3000000, quality = 0, strong = 0, bind = 1,job = 0},--绑定金币5W
			{type = 46, id = 0, min = 500, max = 2000, quality = 0, strong = 0, bind = 1,job = 0},--绑定金币5W
			{type = 45, id = 0, min = 500, max = 2000, quality = 0, strong = 0, bind = 1,job = 0},--绑定金币5W
			{type = 41, id = 0, min = 200, max = 1000, quality = 0, strong = 0, bind = 1,job = 0},--绑定金币5W						
			{type = 11, id = 0, min = 500, max = 2000, quality = 0, strong = 0, bind = 1,job = 0},--绑定金币5W
			{type = 47, id = 0, min = 20, max = 100, quality = 0, strong = 0, bind = 1,job = 0},--绑定金币5W						
			{type = 42, id = 0, min = 20, max = 100, quality = 0, strong = 0, bind = 1,job = 0},--绑定金币5W		
		}, 
		propability2	= 15 ,	--机率
		reward2 = { --1组		    	
			[1]={type=0,id=469,count=1,quality = 0, strong = 0, bind = 0,job = 0},  --书页
		},
		propability3	= 200 ,				
		reward3 = {--2组	
			[1]={type=0,id=469,count=1,quality = 0, strong = 0, bind = 0,job = 0},  --书页
		},
	},
	--流金宝箱
	{
		monsterid=498,
		name="流金宝箱",
		reward = {			--基本掉落
			{type = 46, id = 0, min = 500, max = 2000, quality = 0, strong = 0, bind = 1,job = 0},--绑定金币5W
			{type = 45, id = 0, min = 500, max = 2000, quality = 0, strong = 0, bind = 1,job = 0},--绑定金币5W
			{type = 41, id = 0, min = 200, max = 1000, quality = 0, strong = 0, bind = 1,job = 0},--绑定金币5W						
			{type = 11, id = 0, min = 500, max = 2000, quality = 0, strong = 0, bind = 1,job = 0},--绑定金币5W
			{type = 47, id = 0, min = 20, max = 100, quality = 0, strong = 0, bind = 1,job = 0},--绑定金币5W						
			{type = 42, id = 0, min = 20, max = 100, quality = 0, strong = 0, bind = 1,job = 0},--绑定金币5W
			{type = 48, id = 0, min = 1, max = 1, quality = 0, strong = 0, bind = 1,job = 0},--绑定金币5W
		},
		propability2	= 50 ,	--机率	
		reward2 = { --1组
			[1]={type=0,id=469,count=1,quality = 0, strong = 0, bind = 0,job = 0},  --书页
		},
		propability3	= 200 ,				
		reward3 = {--2组
			[1]={type=0,id=469,count=1,quality = 0, strong = 0, bind = 0,job = 0},  --书页
		},
	},
	--白金宝箱
	{
		monsterid=1183,
		name="白金宝箱",
		reward = {			--基本掉落

			{type = 0, id = 5363, min = 1, max = 1, quality = 0, strong = 0, bind = 1,job = 0},--一阶宝石袋
			{type = 0, id = 5645, min = 1, max = 1, quality = 0, strong = 0, bind = 1,job = 0},--斗笠精华(小)
			{type = 0, id = 5165, min = 1, max = 1, quality = 0, strong = 0, bind = 1,job = 0},--神魂(10)
			{type = 0, id = 6217, min = 1, max = 1, quality = 0, strong = 0, bind = 1,job = 0},--9朵玫瑰
			{type = 0, id = 4741, min = 1, max = 1, quality = 0, strong = 0, bind = 1,job = 0},--九花玉露丸
			{type = 0, id = 572, min = 1, max = 1, quality = 0, strong = 0, bind = 1,job = 0},--圣珠结晶(100)
			{type = 0, id = 569, min = 1, max = 1, quality = 0, strong = 0, bind = 1,job = 0},--护盾碎片(1000颗)
			{type = 0, id = 551, min = 1, max = 1, quality = 0, strong = 0, bind = 1,job = 0},--战将灵力丹(小)
			{type = 0, id = 537, min = 1, max = 1, quality = 0, strong = 0, bind = 1,job = 0},--宝石结晶(100)
			{type = 0, id = 535, min = 1, max = 1, quality = 0, strong = 0, bind = 1,job = 0},--护符碎片(1000颗)
			{type = 0, id = 488, min = 1, max = 1, quality = 0, strong = 0, bind = 1,job = 0},--成就令牌(小)
		},

	},
	--钻石宝箱
	{
		monsterid=1184,
		name="钻石宝箱",
		reward = {			--基本掉落
			{type = 0, id = 493, min = 1, max = 1, quality = 0, strong = 0, bind = 1,job = 0},--翅膀魂石·白虎
			{type = 0, id = 494, min = 1, max = 1, quality = 0, strong = 0, bind = 1,job = 0},--翅膀魂石·青龙
			{type = 0, id = 495, min = 1, max = 1, quality = 0, strong = 0, bind = 1,job = 0},--翅膀魂石·朱雀
			{type = 0, id = 527, min = 1, max = 1, quality = 0, strong = 0, bind = 1,job = 0},--特戒结晶(1)
			{type = 0, id = 542, min = 1, max = 1, quality = 0, strong = 0, bind = 1,job = 0},--转生修为丹(小)
			{type = 0, id = 573, min = 1, max = 1, quality = 0, strong = 0, bind = 1,job = 0},--圣珠结晶(1000)
			{type = 0, id = 538, min = 1, max = 1, quality = 0, strong = 0, bind = 1,job = 0},--宝石结晶(1000)
			{type = 0, id = 5166, min = 1, max = 1, quality = 0, strong = 0, bind = 1,job = 0},--神魂(100)
			{type = 0, id = 5364, min = 1, max = 1, quality = 0, strong = 0, bind = 1,job = 0},--二阶宝石袋
		},
		propability2	= 1388 ,	--机率	
		reward2 = { --1组
			[1]={type=0,id=88 ,count=1,quality = 0, strong = 0, bind = 0,job = 0},  --冲天战甲(男)
			[2]={type=0,id=89 ,count=1,quality = 0, strong = 0, bind = 0,job = 0},  --冲天战甲(女)
			[3]={type=0,id=97 ,count=1,quality = 0, strong = 0, bind = 0,job = 0},  --冲天魔袍(男)
			[4]={type=0,id=98 ,count=1,quality = 0, strong = 0, bind = 0,job = 0},  --冲天魔袍(女)
			[5]={type=0,id=106,count=1,quality = 0, strong = 0, bind = 0,job = 0},  --冲天道衣(男)
			[6]={type=0,id=107,count=1,quality = 0, strong = 0, bind = 0,job = 0},  --冲天道衣(女)
		},
		propability3	= 1588 ,				
		reward3 = {--2组
			[1]={type=0,id=87,count=1,quality = 0, strong = 0, bind = 0,job = 0},  --冲天战刀
			[2]={type=0,id=96,count=1,quality = 0, strong = 0, bind = 0,job = 0},  --冲天魔杖
			[3]={type=0,id=105,count=1,quality = 0, strong = 0, bind = 0,job = 0},  --冲天道剑
		}, 
	},
}
