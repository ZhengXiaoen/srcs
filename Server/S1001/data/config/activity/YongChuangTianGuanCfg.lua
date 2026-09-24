--勇闯天关
YongChuangTianGuanCfg = 
{
	--fubenId 122 ~ 122+29
	--不能随便换奖励，因为这个和一键通关的发邮件有关（改了告诉后端。。。。。。。。。。。。。。）
	
	SceneId ={348,377}, --第一个~第2个参数共30层
	showAward = 
	{
		{type = 0, id = 5363, count = 0, quality = 0, strong = 0, bind = 1},--一阶宝石袋
		{type = 0, id = 5364, count = 0, quality = 0, strong = 0, bind = 1},--二阶宝石袋
		{type = 0, id = 80, count = 0, quality = 0, strong = 0, bind = 1},--疗伤药
		{type = 2, id = 0, count = 200000, quality = 0, strong = 0, bind = 1},--经验值
		{type = 0, id = 507, count = 0, quality = 0, strong = 0, bind = 1},--绑定金币
		{type = 0, id = 572, count = 0, quality = 0, strong = 0, bind = 1},--圣珠结晶
		{type = 0, id = 537, count = 0, quality = 0, strong = 0, bind = 1},--宝石结晶
	},
	award = 
	{
		--第1个随机库
		{
			{	
				rate =7000,
				giveAward={
					{type = 0, id = 5363, count = 1, quality = 0, strong = 0, bind = 1},--宝箱
					{type = 0, id = 80, count = 50, quality = 0, strong = 0, bind = 1},--疗伤药
					{type = 2, id = 0, count = 2000000, quality = 0, strong = 0, bind = 1},--经验
				}
			},
			{	
				rate =1500,
				giveAward={
					{type = 0, id = 5363, count = 2, quality = 0, strong = 0, bind = 1},--宝箱
					{type = 0, id = 80, count = 80, quality = 0, strong = 0, bind = 1},--疗伤药
					{type = 2, id = 0, count = 3000000, quality = 0, strong = 0, bind = 1},--经验
				}
			},
			{	rate =500,
				giveAward={
					{type = 0, id = 5363, count = 3, quality = 0, strong = 0, bind = 1},--宝箱
					{type = 0, id = 80, count = 50, quality = 0, strong = 0, bind = 1},--疗伤药
					{type = 2, id = 0, count = 2500000, quality = 0, strong = 0, bind = 1},--经验
				}
			},
			-- {	
			-- 	rate =1500,
			-- 	giveAward={
			-- 		{type = 0, id = 5364, count = 2, quality = 0, strong = 0, bind = 1},--宝箱
			-- 		{type = 0, id = 80, count = 80, quality = 0, strong = 0, bind = 1},--疗伤药
			-- 		{type = 2, id = 0, count = 3000000, quality = 0, strong = 0, bind = 1},--经验
			-- 	}
			-- },

		},
		--第2个随机库
		{
			{	
				rate =7000,
				giveAward={
					{type = 0, id = 5363, count = 1, quality = 0, strong = 0, bind = 1},--宝箱
					{type = 0, id = 80, count = 50, quality = 0, strong = 0, bind = 1},--疗伤药
					{type = 45, id = 0, count = 2000, quality = 0, strong = 0, bind = 1},--经验
				}
			},
			{	
				rate =1500,
				giveAward={
					{type = 0, id = 5363, count = 2, quality = 0, strong = 0, bind = 1},--宝箱
					{type = 0, id = 80, count = 80, quality = 0, strong = 0, bind = 1},--疗伤药
					{type = 45, id = 0, count = 4000, quality = 0, strong = 0, bind = 1},--经验
				}
			},
			{	
				rate =500,
				giveAward={
					{type = 0, id = 5363, count = 3, quality = 0, strong = 0, bind = 1},--宝箱
					{type = 0, id = 80, count = 50, quality = 0, strong = 0, bind = 1},--疗伤药
					{type = 45, id = 0, count = 6000, quality = 0, strong = 0, bind = 1},--经验
				}
			},
			-- {	rate =7000,
			-- 	giveAward={
			-- 		{type = 0, id = 5364, count = 1, quality = 0, strong = 0, bind = 1},--宝箱
			-- 		{type = 0, id = 80, count = 50, quality = 0, strong = 0, bind = 1},--疗伤药
			-- 		{type = 45, id = 0, count = 2000, quality = 0, strong = 0, bind = 1},--经验
			-- 	}
			-- },
			-- {	
			-- 	rate =1500,
			-- 	giveAward={
			-- 		{type = 0, id = 5364, count = 2, quality = 0, strong = 0, bind = 1},--宝箱
			-- 		{type = 0, id = 80, count = 80, quality = 0, strong = 0, bind = 1},--疗伤药
			-- 		{type = 45, id = 0, count = 4000, quality = 0, strong = 0, bind = 1},--经验
			-- 	}
			-- },
			-- {	
			-- 	rate =500,
			-- 	giveAward={
			-- 		{type = 0, id = 5364, count = 3, quality = 0, strong = 0, bind = 1},--宝箱
			-- 		{type = 0, id = 80, count = 50, quality = 0, strong = 0, bind = 1},--疗伤药
			-- 		{type = 45, id = 0, count = 6000, quality = 0, strong = 0, bind = 1},--经验
			-- 	}
			-- },

		},		
		
		--第3个随机库
		{
			{	
				rate =6000,
				giveAward={
					{type = 0, id = 5363, count = 1, quality = 0, strong = 0, bind = 1},--宝箱
					{type = 0, id = 80, count = 50, quality = 0, strong = 0, bind = 1},--疗伤药
					{type = 46, id = 0, count = 2000, quality = 0, strong = 0, bind = 1},--经验
				}
			},
			{	
				rate =3000,
				giveAward={
					{type = 0, id = 5363, count = 2, quality = 0, strong = 0, bind = 1},--宝箱
					{type = 0, id = 80, count = 80, quality = 0, strong = 0, bind = 1},--疗伤药
					{type = 46, id = 0, count = 4000, quality = 0, strong = 0, bind = 1},--经验
				}
			},
			{	
				rate =500,
				giveAward={
					{type = 0, id = 5364, count = 1, quality = 0, strong = 0, bind = 1},--宝箱
					{type = 0, id = 80, count = 50, quality = 0, strong = 0, bind = 1},--疗伤药
					{type = 46, id = 0, count = 6000, quality = 0, strong = 0, bind = 1},--经验
				}
			},
			-- {	rate =7000,
			-- 	giveAward={
			-- 		{type = 0, id = 5364, count = 1, quality = 0, strong = 0, bind = 1},--宝箱
			-- 		{type = 0, id = 80, count = 50, quality = 0, strong = 0, bind = 1},--疗伤药
			-- 		{type = 46, id = 0, count = 2000, quality = 0, strong = 0, bind = 1},--经验
			-- 	}
			-- },
			-- {	
			-- 	rate =1500,
			-- 	giveAward={
			-- 		{type = 0, id = 5364, count = 2, quality = 0, strong = 0, bind = 1},--宝箱
			-- 		{type = 0, id = 80, count = 80, quality = 0, strong = 0, bind = 1},--疗伤药
			-- 		{type = 46, id = 0, count = 4000, quality = 0, strong = 0, bind = 1},--经验
			-- 	}
			-- },
			-- {	
			-- 	rate =500,
			-- 	giveAward={
			-- 		{type = 0, id = 5364, count = 3, quality = 0, strong = 0, bind = 1},--宝箱
			-- 		{type = 0, id = 80, count = 50, quality = 0, strong = 0, bind = 1},--疗伤药
			-- 		{type = 46, id = 0, count = 6000, quality = 0, strong = 0, bind = 1},--经验
			-- 	}
			-- },

		},		
		
		--第4个随机库
		{
			{	
				rate =5000,
				giveAward={
					{type = 0, id = 5363, count = 1, quality = 0, strong = 0, bind = 1},--宝箱
					{type = 0, id = 80, count = 50, quality = 0, strong = 0, bind = 1},--疗伤药
					{type = 42, id = 0, count = 100, quality = 0, strong = 0, bind = 1},--经验
				}
			},
			{	
				rate =4000,
				giveAward={
					{type = 0, id = 5363, count = 2, quality = 0, strong = 0, bind = 1},--宝箱
					{type = 0, id = 80, count = 80, quality = 0, strong = 0, bind = 1},--疗伤药
					{type = 42, id = 0, count = 200, quality = 0, strong = 0, bind = 1},--经验
				}
			},
			{	
				rate =1000,
				giveAward={
					{type = 0, id = 5364, count = 1, quality = 0, strong = 0, bind = 1},--宝箱
					{type = 0, id = 80, count = 50, quality = 0, strong = 0, bind = 1},--疗伤药
					{type = 42, id = 0, count = 400, quality = 0, strong = 0, bind = 1},--经验
				}
			},

			-- {	rate =7000,
			-- 	giveAward={
			-- 		{type = 0, id = 5364, count = 1, quality = 0, strong = 0, bind = 1},--宝箱
			-- 		{type = 0, id = 80, count = 50, quality = 0, strong = 0, bind = 1},--疗伤药
			-- 		{type = 42, id = 0, count = 100, quality = 0, strong = 0, bind = 1},--经验
			-- 	}
			-- },
			-- {	
			-- 	rate =1500,
			-- 	giveAward={
			-- 		{type = 0, id = 5364, count = 2, quality = 0, strong = 0, bind = 1},--宝箱
			-- 		{type = 0, id = 80, count = 80, quality = 0, strong = 0, bind = 1},--疗伤药
			-- 		{type = 42, id = 0, count = 200, quality = 0, strong = 0, bind = 1},--经验
			-- 	}
			-- },
			-- {	
			-- 	rate =500,
			-- 	giveAward={
			-- 		{type = 0, id = 5364, count = 3, quality = 0, strong = 0, bind = 1},--宝箱
			-- 		{type = 0, id = 80, count = 50, quality = 0, strong = 0, bind = 1},--疗伤药
			-- 		{type = 42, id = 0, count = 400, quality = 0, strong = 0, bind = 1},--经验
			-- 	}
			-- },

		},		
		
		--第5个随机库
		{
			{	
				rate =5000,
				giveAward={
					{type = 0, id = 5363, count = 1, quality = 0, strong = 0, bind = 1},--宝箱
					{type = 0, id = 80, count = 50, quality = 0, strong = 0, bind = 1},--疗伤药
					{type = 47, id = 0, count = 100, quality = 0, strong = 0, bind = 1},--经验
				}
			},
			{	
				rate =4000,
				giveAward={
					{type = 0, id = 5363, count = 2, quality = 0, strong = 0, bind = 1},--宝箱
					{type = 0, id = 80, count = 80, quality = 0, strong = 0, bind = 1},--疗伤药
					{type = 47, id = 0, count = 200, quality = 0, strong = 0, bind = 1},--经验
				}
			},
			{	
				rate =1500,
				giveAward={
					{type = 0, id = 5364, count = 1, quality = 0, strong = 0, bind = 1},--宝箱
					{type = 0, id = 80, count = 50, quality = 0, strong = 0, bind = 1},--疗伤药
					{type = 47, id = 0, count = 400, quality = 0, strong = 0, bind = 1},--经验
				}
			},
			-- {	rate =7000,
			-- 	giveAward={
			-- 		{type = 0, id = 5364, count = 1, quality = 0, strong = 0, bind = 1},--宝箱
			-- 		{type = 0, id = 80, count = 50, quality = 0, strong = 0, bind = 1},--疗伤药
			-- 		{type = 47, id = 0, count = 100, quality = 0, strong = 0, bind = 1},--经验
			-- 	}
			-- },
			-- {	
			-- 	rate =1500,
			-- 	giveAward={
			-- 		{type = 0, id = 5364, count = 2, quality = 0, strong = 0, bind = 1},--宝箱
			-- 		{type = 0, id = 80, count = 80, quality = 0, strong = 0, bind = 1},--疗伤药
			-- 		{type = 47, id = 0, count = 200, quality = 0, strong = 0, bind = 1},--经验
			-- 	}
			-- },
			-- {	
			-- 	rate =500,
			-- 	giveAward={
			-- 		{type = 0, id = 5364, count = 3, quality = 0, strong = 0, bind = 1},--宝箱
			-- 		{type = 0, id = 80, count = 50, quality = 0, strong = 0, bind = 1},--疗伤药
			-- 		{type = 47, id = 0, count = 400, quality = 0, strong = 0, bind = 1},--经验
			-- 	}
			-- },

		},	
		
		--第6个随机库
		{
			{
				rate =5000,
				giveAward={
					{type = 0, id = 5363, count = 1, quality = 0, strong = 0, bind = 1},--宝箱
					{type = 0, id = 80, count = 50, quality = 0, strong = 0, bind = 1},--疗伤药
					{type = 5, id = 0, count = 100000, quality = 0, strong = 0, bind = 1},--经验
				}
			},
			{	
				rate =4000,
				giveAward={
					{type = 0, id = 5363, count = 2, quality = 0, strong = 0, bind = 1},--宝箱
					{type = 0, id = 80, count = 80, quality = 0, strong = 0, bind = 1},--疗伤药
					{type = 5, id = 0, count = 200000, quality = 0, strong = 0, bind = 1},--经验
				}
			},
			{	
				rate =1500,
				giveAward={
					{type = 0, id = 5364, count = 2, quality = 0, strong = 0, bind = 1},--宝箱
					{type = 0, id = 80, count = 50, quality = 0, strong = 0, bind = 1},--疗伤药
					{type = 5, id = 0, count = 300000, quality = 0, strong = 0, bind = 1},--经验
				}
			},
			{	
				rate =500,
				giveAward={
					{type = 0, id = 5365, count = 1, quality = 0, strong = 0, bind = 1},--宝箱
					{type = 0, id = 80, count = 50, quality = 0, strong = 0, bind = 1},--疗伤药
					{type = 5, id = 0, count = 400000, quality = 0, strong = 0, bind = 1},--经验
				}
			},

			-- {	rate =7000,
			-- 	giveAward={
			-- 		{type = 0, id = 5364, count = 1, quality = 0, strong = 0, bind = 1},--宝箱
			-- 		{type = 0, id = 80, count = 50, quality = 0, strong = 0, bind = 1},--疗伤药
			-- 		{type = 5, id = 0, count = 100000, quality = 0, strong = 0, bind = 1},--经验
			-- 	}
			-- },
			-- {	
			-- 	rate =1500,
			-- 	giveAward={
			-- 		{type = 0, id = 5364, count = 2, quality = 0, strong = 0, bind = 1},--宝箱
			-- 		{type = 0, id = 80, count = 80, quality = 0, strong = 0, bind = 1},--疗伤药
			-- 		{type = 5, id = 0, count = 200000, quality = 0, strong = 0, bind = 1},--经验
			-- 	}
			-- },
			-- {	
			-- 	rate =500,
			-- 	giveAward={
			-- 		{type = 0, id = 5364, count = 3, quality = 0, strong = 0, bind = 1},--宝箱
			-- 		{type = 0, id = 80, count = 50, quality = 0, strong = 0, bind = 1},--疗伤药
			-- 		{type = 5, id = 0, count = 300000, quality = 0, strong = 0, bind = 1},--经验
			-- 	}
			-- },

		},
	}
}