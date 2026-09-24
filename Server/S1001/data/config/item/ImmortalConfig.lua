ImmortalConfig = 
{
	breakthrough = 
	{
		{
			id = 1,
			needLevel = 75,    	--需要人物等级
			needCircle = 0,	   	--需要人物转数
			Probability = 25,	--成功率25%
			name = "一重(炼气期)",
			sceneID = 160,
			
			consume = 
			{
				{type = 51,id = 132,count = 300},--50金刚石，51真元值--130是金刚石变量，132是真元值变量
			},
			
			addAttrs=
			{
				--战士（当前等级增加的总属性）
				{
					{type=9,value=40,},
					{type=11,value=100,},
					{type=13,value=40,},
					{type=15,value=100,},
					{type=17,value=40,},
					{type=19,value=100,},
					{type=21,value=20,},
					{type=23,value=40,},
					{type=25,value=16,},
					{type=27,value=32,},
				},
				--法师
				{
					{type=9,value=40,},
					{type=11,value=100,},
					{type=13,value=40,},
					{type=15,value=100,},
					{type=17,value=40,},
					{type=19,value=100,},
					{type=21,value=20,},
					{type=23,value=40,},
					{type=25,value=16,},
					{type=27,value=32,},
				},
				--道士
				{
					{type=9,value=40,},
					{type=11,value=100,},
					{type=13,value=40,},
					{type=15,value=100,},
					{type=17,value=40,},
					{type=19,value=100,},
					{type=21,value=20,},
					{type=23,value=40,},
					{type=25,value=16,},
					{type=27,value=32,},
				},
			},
		},
		{
			id = 2,
			needLevel = 78,
			needCircle = 0,
			name = "一重(筑基期)",
			Probability = 30,--成功率30%
			sceneID = 160,
			
			consume = 
			{
				{type = 51,id = 132,count = 500},--消耗500点真元值
			},
			
			addAttrs=
			{
				--战士（当前等级增加的总属性）
				{
					{type=9,value=52,},
					{type=11,value=130,},
					{type=13,value=52,},
					{type=15,value=130,},
					{type=17,value=52,},
					{type=19,value=130,},
					{type=21,value=26,},
					{type=23,value=52,},
					{type=25,value=21,},
					{type=27,value=42,},
				},
				--法师
				{
					{type=9,value=52,},
					{type=11,value=130,},
					{type=13,value=52,},
					{type=15,value=130,},
					{type=17,value=52,},
					{type=19,value=130,},
					{type=21,value=26,},
					{type=23,value=52,},
					{type=25,value=21,},
					{type=27,value=42,},
				},
				--道士
				{
					{type=9,value=52,},
					{type=11,value=130,},
					{type=13,value=52,},
					{type=15,value=130,},
					{type=17,value=52,},
					{type=19,value=130,},
					{type=21,value=26,},
					{type=23,value=52,},
					{type=25,value=21,},
					{type=27,value=42,},
				},
			},
		},
		{
			id = 3,
			needLevel = 80,
			name = "一重(开光期)",
			needCircle = 1,
			Probability = 35,
			sceneID = 160,
			
			consume = 
			{
				{type = 51,id = 132,count = 1000},--消耗1000点真元值
			},		
			
			addAttrs=
			{
				--战士（当前等级增加的总属性）
				{
					{type=9,value=72,},
					{type=11,value=180,},
					{type=13,value=72,},
					{type=15,value=180,},
					{type=17,value=72,},
					{type=19,value=180,},
					{type=21,value=36,},
					{type=23,value=72,},
					{type=25,value=29,},
					{type=27,value=58,},
				},
				--法师
				{
					{type=9,value=72,},
					{type=11,value=180,},
					{type=13,value=72,},
					{type=15,value=180,},
					{type=17,value=72,},
					{type=19,value=180,},
					{type=21,value=36,},
					{type=23,value=72,},
					{type=25,value=29,},
					{type=27,value=58,},
				},
				--道士
				{
					{type=9,value=72,},
					{type=11,value=180,},
					{type=13,value=72,},
					{type=15,value=180,},
					{type=17,value=72,},
					{type=19,value=180,},
					{type=21,value=36,},
					{type=23,value=72,},
					{type=25,value=29,},
					{type=27,value=58,},
				},
			},
		},
		{
			id = 4,
			needLevel = 80,
			name = "一重(开光期)",
			needCircle = 1,
			Probability = 100,
			sceneID = 160,
			
			consume = 
			{
				{type = 50,id = 130,count = 20},--消耗20颗金刚石
			},
						
			addAttrs=
			{
				--战士（当前等级增加的总属性）
				{
					{type=9,value=100,},
					{type=11,value=250,},
					{type=13,value=100,},
					{type=15,value=250,},
					{type=17,value=100,},
					{type=19,value=250,},
					{type=21,value=50,},
					{type=23,value=100,},
					{type=25,value=40,},
					{type=27,value=80,},
				},
				--法师
				{
					{type=9,value=100,},
					{type=11,value=250,},
					{type=13,value=100,},
					{type=15,value=250,},
					{type=17,value=100,},
					{type=19,value=250,},
					{type=21,value=50,},
					{type=23,value=100,},
					{type=25,value=40,},
					{type=27,value=80,},
				},
				--道士
				{
					{type=9,value=100,},
					{type=11,value=250,},
					{type=13,value=100,},
					{type=15,value=250,},
					{type=17,value=100,},
					{type=19,value=250,},
					{type=21,value=50,},
					{type=23,value=100,},
					{type=25,value=40,},
					{type=27,value=80,},
				},
			},
		},
		{
			id = 5,
			needLevel = 80,
			name = "二重(融合期)",
			needCircle = 2,
			Probability = 40,
			sceneID = 161,
			
			consume = 
			{
				{type = 51,id = 132,count = 4000},--消耗4000点真元值
			},		
			
			addAttrs=
			{
				--战士（当前等级增加的总属性）
				{
					{type=9,value=136,},
					{type=11,value=340,},
					{type=13,value=136,},
					{type=15,value=340,},
					{type=17,value=136,},
					{type=19,value=340,},
					{type=21,value=68,},
					{type=23,value=136,},
					{type=25,value=55,},
					{type=27,value=109,},
				},
				--法师
				{
					{type=9,value=136,},
					{type=11,value=340,},
					{type=13,value=136,},
					{type=15,value=340,},
					{type=17,value=136,},
					{type=19,value=340,},
					{type=21,value=68,},
					{type=23,value=136,},
					{type=25,value=55,},
					{type=27,value=109,},
				},
				--道士
				{
					{type=9,value=136,},
					{type=11,value=340,},
					{type=13,value=136,},
					{type=15,value=340,},
					{type=17,value=136,},
					{type=19,value=340,},
					{type=21,value=68,},
					{type=23,value=136,},
					{type=25,value=55,},
					{type=27,value=109,},
				},
			},
		},
		{
			id = 6,
			needLevel = 80,
			name = "二重(金丹期)",
			needCircle = 3,
			Probability = 45,
			sceneID = 161,
			
			consume = 
			{
				{type = 51,id = 132,count = 8000},--消耗8000点真元值
			},		
			
			addAttrs=
			{
				--战士（当前等级增加的总属性）
				{
					{type=9,value=180,},
					{type=11,value=450,},
					{type=13,value=180,},
					{type=15,value=450,},
					{type=17,value=180,},
					{type=19,value=450,},
					{type=21,value=90,},
					{type=23,value=180,},
					{type=25,value=72,},
					{type=27,value=144,},
				},
				--法师
				{
					{type=9,value=180,},
					{type=11,value=450,},
					{type=13,value=180,},
					{type=15,value=450,},
					{type=17,value=180,},
					{type=19,value=450,},
					{type=21,value=90,},
					{type=23,value=180,},
					{type=25,value=72,},
					{type=27,value=144,},
				},
				--道士
				{
					{type=9,value=180,},
					{type=11,value=450,},
					{type=13,value=180,},
					{type=15,value=450,},
					{type=17,value=180,},
					{type=19,value=450,},
					{type=21,value=90,},
					{type=23,value=180,},
					{type=25,value=72,},
					{type=27,value=144,},
				},
			},
		},
		{
			id = 7,
			needLevel = 80,
			name = "二重(元婴期)",
			needCircle = 4,
			Probability = 50,
			sceneID = 161,
			
			consume = 
			{
				{type = 51,id = 132,count = 16000},--消耗16000点真元值
			},		
			
			addAttrs=
			{
				--战士（当前等级增加的总属性）
				{
					{type=9,value=232,},
					{type=11,value=580,},
					{type=13,value=232,},
					{type=15,value=580,},
					{type=17,value=232,},
					{type=19,value=580,},
					{type=21,value=116,},
					{type=23,value=232,},
					{type=25,value=93,},
					{type=27,value=186,},
				},
				--法师
				{
					{type=9,value=232,},
					{type=11,value=580,},
					{type=13,value=232,},
					{type=15,value=580,},
					{type=17,value=232,},
					{type=19,value=580,},
					{type=21,value=116,},
					{type=23,value=232,},
					{type=25,value=93,},
					{type=27,value=186,},
				},
				--道士
				{
					{type=9,value=232,},
					{type=11,value=580,},
					{type=13,value=232,},
					{type=15,value=580,},
					{type=17,value=232,},
					{type=19,value=580,},
					{type=21,value=116,},
					{type=23,value=232,},
					{type=25,value=93,},
					{type=27,value=186,},
				},
			},
		},
		{
			id = 8,
			needLevel = 80,
			name = "二重(元婴期)",
			needCircle = 4,
			Probability = 100,
			sceneID = 161,
			
			consume = 
			{
				{type = 50,id = 130,count = 80},--消耗80颗金刚石
			},		
			
			addAttrs=
			{
				--战士（当前等级增加的总属性）
				{
					{type=9,value=292,},
					{type=11,value=730,},
					{type=13,value=292,},
					{type=15,value=730,},
					{type=17,value=292,},
					{type=19,value=730,},
					{type=21,value=146,},
					{type=23,value=292,},
					{type=25,value=117,},
					{type=27,value=234,},
				},
				--法师
				{
					{type=9,value=292,},
					{type=11,value=730,},
					{type=13,value=292,},
					{type=15,value=730,},
					{type=17,value=292,},
					{type=19,value=730,},
					{type=21,value=146,},
					{type=23,value=292,},
					{type=25,value=117,},
					{type=27,value=234,},
				},
				--道士
				{
					{type=9,value=292,},
					{type=11,value=730,},
					{type=13,value=292,},
					{type=15,value=730,},
					{type=17,value=292,},
					{type=19,value=730,},
					{type=21,value=146,},
					{type=23,value=292,},
					{type=25,value=117,},
					{type=27,value=234,},
				},
			},
		},
		{
			id = 9,
			needLevel = 80,
			name = "三重(出窍期)",
			needCircle = 5,
			Probability = 55,
			sceneID = 162,
			
			consume = 
			{
				{type = 51,id = 132,count = 32000},--消耗32000点真元值
			},	
			
			addAttrs=
			{
				--战士（当前等级增加的总属性）
				{
					{type=9,value=360,},
					{type=11,value=900,},
					{type=13,value=360,},
					{type=15,value=900,},
					{type=17,value=360,},
					{type=19,value=900,},
					{type=21,value=180,},
					{type=23,value=360,},
					{type=25,value=144,},
					{type=27,value=288,},
				},
				--法师
				{
					{type=9,value=360,},
					{type=11,value=900,},
					{type=13,value=360,},
					{type=15,value=900,},
					{type=17,value=360,},
					{type=19,value=900,},
					{type=21,value=180,},
					{type=23,value=360,},
					{type=25,value=144,},
					{type=27,value=288,},
				},
				--道士
				{
					{type=9,value=360,},
					{type=11,value=900,},
					{type=13,value=360,},
					{type=15,value=900,},
					{type=17,value=360,},
					{type=19,value=900,},
					{type=21,value=180,},
					{type=23,value=360,},
					{type=25,value=144,},
					{type=27,value=288,},
				},
			},
		},
		{
			id = 10,
			needLevel = 80,
			name = "三重(化神期)",
			needCircle = 6,
			Probability = 60,
			sceneID = 162,
			
			consume = 
			{
				{type = 51,id = 132,count = 64000},--消耗64000点真元值
			},
						
			addAttrs=
			{
				--战士（当前等级增加的总属性）
				{
					{type=9,value=436,},
					{type=11,value=1090,},
					{type=13,value=436,},
					{type=15,value=1090,},
					{type=17,value=436,},
					{type=19,value=1090,},
					{type=21,value=218,},
					{type=23,value=436,},
					{type=25,value=175,},
					{type=27,value=349,},
				},
				--法师
				{
					{type=9,value=436,},
					{type=11,value=1090,},
					{type=13,value=436,},
					{type=15,value=1090,},
					{type=17,value=436,},
					{type=19,value=1090,},
					{type=21,value=218,},
					{type=23,value=436,},
					{type=25,value=175,},
					{type=27,value=349,},
				},
				--道士
				{
					{type=9,value=436,},
					{type=11,value=1090,},
					{type=13,value=436,},
					{type=15,value=1090,},
					{type=17,value=436,},
					{type=19,value=1090,},
					{type=21,value=218,},
					{type=23,value=436,},
					{type=25,value=175,},
					{type=27,value=349,},
				},
			},
		},
		{
			id = 11,
			needLevel = 80,
			name = "三重(合体期)",
			needCircle = 7,
			Probability = 65,
			sceneID = 162,
			
			consume = 
			{
				{type = 51,id = 132,count = 128000},--消耗128000点真元值
			},
						
			addAttrs=
			{
				--战士（当前等级增加的总属性）
				{
					{type=9,value=520,},
					{type=11,value=1300,},
					{type=13,value=520,},
					{type=15,value=1300,},
					{type=17,value=520,},
					{type=19,value=1300,},
					{type=21,value=260,},
					{type=23,value=520,},
					{type=25,value=208,},
					{type=27,value=416,},
				},
				--法师
				{
					{type=9,value=520,},
					{type=11,value=1300,},
					{type=13,value=520,},
					{type=15,value=1300,},
					{type=17,value=520,},
					{type=19,value=1300,},
					{type=21,value=260,},
					{type=23,value=520,},
					{type=25,value=208,},
					{type=27,value=416,},
				},
				--道士
				{
					{type=9,value=520,},
					{type=11,value=1300,},
					{type=13,value=520,},
					{type=15,value=1300,},
					{type=17,value=520,},
					{type=19,value=1300,},
					{type=21,value=260,},
					{type=23,value=520,},
					{type=25,value=208,},
					{type=27,value=416,},
				},
			},
		},	
		{
			id = 12,
			needLevel = 80,
			name = "三重(合体期)",
			needCircle = 7,
			Probability = 100,
			sceneID = 162,
			
			consume = 
			{
				{type = 50,id = 130,count = 150},--消耗150颗金刚石
			},
						
			addAttrs=
			{
				--战士（当前等级增加的总属性）
				{
					{type=9,value=612,},
					{type=11,value=1530,},
					{type=13,value=612,},
					{type=15,value=1530,},
					{type=17,value=612,},
					{type=19,value=1530,},
					{type=21,value=306,},
					{type=23,value=612,},
					{type=25,value=245,},
					{type=27,value=490,},
				},
				--法师
				{
					{type=9,value=612,},
					{type=11,value=1530,},
					{type=13,value=612,},
					{type=15,value=1530,},
					{type=17,value=612,},
					{type=19,value=1530,},
					{type=21,value=306,},
					{type=23,value=612,},
					{type=25,value=245,},
					{type=27,value=490,},
				},
				--道士
				{
					{type=9,value=612,},
					{type=11,value=1530,},
					{type=13,value=612,},
					{type=15,value=1530,},
					{type=17,value=612,},
					{type=19,value=1530,},
					{type=21,value=306,},
					{type=23,value=612,},
					{type=25,value=245,},
					{type=27,value=490,},
				},
			},
		},
		{
			id = 13,
			needLevel = 80,
			name = "四重(洞虚期)",
			needCircle = 8,
			Probability = 70,
			sceneID = 163,
			
			consume = 
			{
				{type = 51,id = 132,count = 256000},--消耗256000点真元
			},
						
			addAttrs=
			{
				--战士（当前等级增加的总属性）
				{
					{type=9,value=712,},
					{type=11,value=1780,},
					{type=13,value=712,},
					{type=15,value=1780,},
					{type=17,value=712,},
					{type=19,value=1780,},
					{type=21,value=356,},
					{type=23,value=712,},
					{type=25,value=285,},
					{type=27,value=570,},
				},
				--法师
				{
					{type=9,value=712,},
					{type=11,value=1780,},
					{type=13,value=712,},
					{type=15,value=1780,},
					{type=17,value=712,},
					{type=19,value=1780,},
					{type=21,value=356,},
					{type=23,value=712,},
					{type=25,value=285,},
					{type=27,value=570,},
				},
				--道士
				{
					{type=9,value=712,},
					{type=11,value=1780,},
					{type=13,value=712,},
					{type=15,value=1780,},
					{type=17,value=712,},
					{type=19,value=1780,},
					{type=21,value=356,},
					{type=23,value=712,},
					{type=25,value=285,},
					{type=27,value=570,},
				},
			},
		},
		{
			id = 14,
			needLevel = 80,
			name = "四重(大乘期)",
			needCircle = 9,
			Probability = 75,
			sceneID = 163,
			
			consume = 
			{
				{type = 51,id = 132,count = 512000},--消耗512000点真元
			},
						
			addAttrs=
			{
				--战士（当前等级增加的总属性）
				{
					{type=9,value=820,},
					{type=11,value=2050,},
					{type=13,value=820,},
					{type=15,value=2050,},
					{type=17,value=820,},
					{type=19,value=2050,},
					{type=21,value=410,},
					{type=23,value=820,},
					{type=25,value=328,},
					{type=27,value=656,},
				},
				--法师
				{
					{type=9,value=820,},
					{type=11,value=2050,},
					{type=13,value=820,},
					{type=15,value=2050,},
					{type=17,value=820,},
					{type=19,value=2050,},
					{type=21,value=410,},
					{type=23,value=820,},
					{type=25,value=328,},
					{type=27,value=656,},
				},
				--道士
				{
					{type=9,value=820,},
					{type=11,value=2050,},
					{type=13,value=820,},
					{type=15,value=2050,},
					{type=17,value=820,},
					{type=19,value=2050,},
					{type=21,value=410,},
					{type=23,value=820,},
					{type=25,value=328,},
					{type=27,value=656,},
				},
			},
		},
		{
			id = 15,
			needLevel = 80,
			name = "四重(渡劫期)",
			needCircle = 10,
			Probability = 80,
			sceneID = 163,
			
			consume = 
			{
				{type = 51,id = 132,count = 1024000},--消耗1024000点真元
			},
						
			addAttrs=
			{
				--战士（当前等级增加的总属性）
				{
					{type=9,value=936,},
					{type=11,value=2340,},
					{type=13,value=936,},
					{type=15,value=2340,},
					{type=17,value=936,},
					{type=19,value=2340,},
					{type=21,value=468,},
					{type=23,value=936,},
					{type=25,value=375,},
					{type=27,value=749,},
				},
				--法师
				{
					{type=9,value=936,},
					{type=11,value=2340,},
					{type=13,value=936,},
					{type=15,value=2340,},
					{type=17,value=936,},
					{type=19,value=2340,},
					{type=21,value=468,},
					{type=23,value=936,},
					{type=25,value=375,},
					{type=27,value=749,},
				},
				--道士
				{
					{type=9,value=936,},
					{type=11,value=2340,},
					{type=13,value=936,},
					{type=15,value=2340,},
					{type=17,value=936,},
					{type=19,value=2340,},
					{type=21,value=468,},
					{type=23,value=936,},
					{type=25,value=375,},
					{type=27,value=749,},
				},
			},
		},
--		{
--			id = 16,
--			needLevel = 60,
--			needCircle = 1,
--			Probability = 100,
--			sceneID = 163,
--			
--			consume = 
--			{
--				{type = 50,id = 130,count = 100},
--			},
--						
--			addAttrs=
--			{
--				--战士（当前等级增加的总属性）
--				{
--					{type=9,value=6,},
--					{type=11,value=25,},
--					{type=13,value=6,},
--					{type=15,value=25,},
--					{type=17,value=6,},
--					{type=19,value=25,},
--					{type=21,value=25,},
--					{type=23,value=25,},
--					{type=25,value=25,},
--					{type=27,value=25,},
--				},
--				--法师
--				{
--					{type=9,value=6,},
--					{type=11,value=25,},
--					{type=13,value=6,},
--					{type=15,value=25,},
--					{type=17,value=6,},
--					{type=19,value=25,},
--					{type=21,value=25,},
--					{type=23,value=25,},
--					{type=25,value=25,},
--					{type=27,value=25,},
--				},
--				--道士
--				{
--					{type=9,value=6,},
--					{type=11,value=25,},
--					{type=13,value=6,},
--					{type=15,value=25,},
--					{type=17,value=6,},
--					{type=19,value=25,},
--					{type=21,value=25,},
--					{type=23,value=25,},
--					{type=25,value=25,},
--					{type=27,value=25,},
--				},
--			},
--		},																													
	}
}