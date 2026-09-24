
--充值促销系统 
PaySales = 
{

--坐骑促销
	--[[
	{
		id = 1,				--id标识 这个也是客户端按钮ID 需要通知客户端添加
		
		--时间只能使用其中之一 同个ID 不能重叠 
		--同时必须在scripttimer中配置 开始时间
		--{ month={},day={},week={},hour={0},minute ={0},openserverdays={3},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "PaySalesStart"}, --开始时间
		openDay = {3, 4},		--开服时间段 	--如果此项配置为nil 则使用 combineDay 时间段
		combineDay = {1, 2},	--合服服时间段 	--如果此项配置为nil 则使用 (openTime) 时间段
		openTime = {2012,9,24,10,0,0, 2012,9,26,10,0,0},	--开启开始-结束时间
		
		goalCount = 1888,		--目标元宝数
		awardItemId = 995,			--礼包ID
		
		imageList = 
		{
			{name = 00100,x = 51,y = 62},	--name:图片编号 x:图片摆放x坐标 y:图片摆放y坐标
			{name = 00101,x = 177,y = 239},
			{name = 00102,x = 142,y = 227},
			{name = 00103,x = 63,y = 248},
			{name = 00104,x = 428,y = 26},
			{name = 00105,x = 111,y = 0},
		},
		awards = 
		{
			{type = 0, id = 971, count = 1},	--领取礼包必须为第一个
			{type = 0, id = 1044, count = 5},					
			{type = 0, id = 731, count = 10},
			{type = 0, id = 918, count = 1},	
			{type = 0, id = 626, count = 5},				
			{type = 0, id = 383, count = 5},		
			{type = 0, id = 379, count = 10},		

			
		},
	},
	--]]
	
	
	{
		id = 1,				--id标识
		
		openDay = {3, 4},		--开服时间段 	--如果此项配置为nil 则使用 combineDay 时间段2012-11-19

		
		goalCount = 1888,		--目标元宝数
		awardItemId = 0,			--礼包ID
		
		imageList = 
		{
			{name = 00100,x = 51,y = 62},	--name:图片编号 x:图片摆放x坐标 y:图片摆放y坐标
			{name = 00101,x = 177,y = 239},
			{name = 00102,x = 142,y = 227},
			{name = 00103,x = 63,y = 248},
			{name = 00104,x = 428,y = 26},
			{name = 00105,x = 111,y = 0},
		},
		awards = 
		{
			-- {type = 0, id = 971, count = 1},	--领取礼包必须为第一个
			-- {type = 0, id = 1044, count = 5},					
			-- {type = 0, id = 731, count = 10},
			-- {type = 0, id = 918, count = 1},	
			-- {type = 0, id = 626, count = 5},				
			-- {type = 0, id = 383, count = 5},		
			-- {type = 0, id = 379, count = 10},		

			
		},
	},
	--魂石促销
	{
		id = 2,				--id标识
		
		openDay = {5, 6},		--开服时间段 	--如果此项配置为nil 则使用 (beginTime - overTime) 时间段

		
		goalCount = 1888,		--目标元宝数
		awardItemId = 0,			--礼包ID
		
		imageList = 
		{
			{name = 00200,x = 51,y = 62},	--name:图片编号 x:图片摆放x坐标 y:图片摆放y坐标--文字
			{name = 00101,x = 177,y = 239},--奖励框标题
			{name = 00202,x = 142,y = 227},--重点奖励的原画
			{name = 00103,x = 63,y = 248},--奖励框
			{name = 00204,x = 428,y = 26},--主题原画
			{name = 00201,x = 111,y = 0},--大标题
		},
		awards = 
		{

			
			-- {type = 0, id = 800, count = 1},	--领取礼包必须为第一个
			-- {type = 0, id = 906, count = 3},		
			-- {type = 0, id = 779, count = 1},
			-- {type = 0, id = 789, count = 1},	
			-- {type = 0, id = 809, count = 1},				
			-- {type = 0, id = 383, count = 5},		
			-- {type = 0, id = 379, count = 10},		

		},
	},
	
	
		--英雄促销
	{
		id = 3,				--id标识
		
		openDay = {7, 8},		--开服时间段 	--如果此项配置为nil 则使用 (beginTime - overTime) 时间段
		
		goalCount = 1888,		--目标元宝数
		awardItemId = 0,			--礼包ID
		
		imageList = 
		{
			{name = 00300,x = 51,y = 62},	--name:图片编号 x:图片摆放x坐标 y:图片摆放y坐标--文字
			{name = 00101,x = 177,y = 239},--奖励框标题
			{name = 00302,x = 142,y = 227},--重点奖励的原画
			{name = 00103,x = 63,y = 248},--奖励框
			{name = 00304,x = 428,y = 26},--主题原画
			{name = 00301,x = 111,y = 0},--大标题
		},
		awards = 
		{
			-- {type = 0, id = 920, count = 1},	--领取礼包必须为第一个
			-- {type = 0, id = 1066, count = 3},					
			-- {type = 0, id = 830, count = 3},
			-- {type = 0, id = 832, count = 5},	
			-- {type = 0, id = 1004, count = 1},				
			-- {type = 0, id = 383, count = 5},		
			-- {type = 0, id = 379, count = 10},		

		
		},
	},
	
	
	
		--合服促销
	{
		id = 4,				--id标识
		
		combineDay = {1, 2},	--合服服时间段 	--如果此项配置为nil 则使用 (openTime) 时间段
		
		
		goalCount = 1888,		--目标元宝数
		awardItemId = 0,			--礼包ID
		
		imageList = 
		{
			{name = 00400,x = 58,y = 69},	--name:图片编号 x:图片摆放x坐标 y:图片摆放y坐标--文字
			{name = 00101,x = 177,y = 239},--奖励框标题
			{name = 00302,x = 133,y = 227},--重点奖励的原画
			{name = 00103,x = 63,y = 248},--奖励框
			{name = 00404,x = 451,y = -43},--主题原画
			{name = 00401,x = 111,y = 0},--大标题
		},
		awards = 
		{
			-- {type = 0, id = 1037, count = 1},	--领取礼包必须为第一个
			-- {type = 0, id = 282, count = 4},					
			-- {type = 0, id = 1172, count = 5},
			-- {type = 0, id = 731, count = 20},	
			-- {type = 0, id = 1076, count = 1},				
			-- {type = 0, id = 799, count = 1},		
			-- {type = 0, id = 830, count = 5},		

		
		},
	},
		--圣诞促销
	{
		id = 5,				--id标识
		
		openTime = {2012,12,24,0,0,0, 2012,12,25,23,59,59},	--开启开始-结束时间
		
		
		goalCount = 1888,		--目标元宝数
		awardItemId = 1432,			--礼包ID
		
		imageList = 
		{
			{name = 00500,x = 58,y = 69},	--name:图片编号 x:图片摆放x坐标 y:图片摆放y坐标--文字
			{name = 00101,x = 177,y = 239},--奖励框标题
			{name = 00502,x = 155,y = 256},--重点奖励的原画
			{name = 00103,x = 63,y = 248},--奖励框
			{name = 00504,x = 425,y = 22},--主题原画
			{name = 00501,x = 111,y = 0},--大标题
		},
		awards = 
		{
			{type = 0, id = 1385, count = 1},	--领取礼包必须为第一个
			{type = 0, id = 1037, count = 3},					
			{type = 0, id = 1119, count = 1},
			{type = 0, id = 283, count = 4},	
			{type = 0, id = 1402, count = 2},				
			{type = 0, id = 1362, count = 5},		
			{type = 0, id = 910, count = 10},		

		
		},
	},
			--元旦促销
	{
		id = 6,				--id标识
		
		openTime = {2012,12,31,0,0,0, 2013,1,31,23,59,59},	--开启开始-结束时间
		
		
		goalCount = 2888,		--目标元宝数
		awardItemId = 1433,			--礼包ID
		
		imageList = 
		{
			{name = 00600,x = 58,y = 69},	--name:图片编号 x:图片摆放x坐标 y:图片摆放y坐标--文字
			{name = 00106,x = 177,y = 239},--奖励框标题
			{name = 00602,x = 155,y = 261},--重点奖励的原画
			{name = 00103,x = 63,y = 248},--奖励框
			{name = 00604,x = 427,y = 40},--主题原画
			{name = 00601,x = 111,y = 0},--大标题
		},
		awards = 
		{
			{type = 0, id = 1402, count = 6},	--领取礼包必须为第一个
			{type = 0, id = 1121, count = 1},					
			{type = 0, id = 283, count = 8},
			{type = 0, id = 1037, count = 5},	
			{type = 0, id = 1362, count = 10},				
			{type = 0, id = 1172, count = 10},		
			{type = 0, id = 910, count = 10},		

		
		},
	},
	
}
