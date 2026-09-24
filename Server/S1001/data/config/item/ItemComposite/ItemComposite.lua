
--物品合成 
--#include "..\..\..\language\LangCode.txt"

--道具合成
ItemComposite = 
{
	{
		title = Lang.ScriptTips.zf086,		--灵珠合成
		config =
		{
			--二级灵珠
			{
				showrate = 10000,			--显示成功率 (showrate/100)% 10000为基数
				realrate = 10000,			--实际成功率 (realrate/100)%
				desc = Lang.ScriptTips.zf087,	--说明
				consumes = 				--消耗材料需求
				{
					--yb:元宝替换数(去掉此值代表此项消耗不能使用元宝替代)
					{type = 0, id = 280, count = 4, quality = 0, strong = 0, yb = 18},
					{type = 6, id = 0, count = 5000}
				},
				awards = 	--合成后物品 只能是一个 且必须type=0 客户端根据ID显示标题
				{
					{type = 0, id = 281, count = 1, quality = 0, strong = 0},
				},
			},

			--三级灵珠
			{
				showrate = 10000,			--显示成功率 (showrate/100)%
				realrate = 10000,			--实际成功率 (realrate/100)%
				desc = Lang.ScriptTips.zf088,	--说明
				consumes = 				--消耗材料需求
				{
					--yb:元宝替换数(去掉此值代表此项消耗不能使用元宝替代)
					{type = 0, id = 281, count = 4, quality = 0, strong = 0, yb = 54},
					{type = 6, id = 0, count = 5000}
				},
				awards = 	--合成后物品 只能是一个 且必须type=0
				{
					{type = 0, id = 282, count = 1, quality = 0, strong = 0},
				},
			},

			
			
			--四级灵珠
			{
				showrate = 10000,			--显示成功率 (showrate/100)%
				realrate = 10000,			--实际成功率 (realrate/100)%
				desc = Lang.ScriptTips.zf08801,	--说明
				consumes = 				--消耗材料需求
				{
					--yb:元宝替换数(去掉此值代表此项消耗不能使用元宝替代)
					{type = 0, id = 282, count = 4, quality = 0, strong = 0, yb = 162},
					{type = 6, id = 0, count = 5000}
				},
				awards = 	--合成后物品 只能是一个 且必须type=0
				{
					{type = 0, id = 283, count = 1, quality = 0, strong = 0},
				},
			},
		},
	},

	
--[[	{
		title = Lang.ScriptTips.zf113,		--灵珠转生
		config =
		{
			--1转一级灵珠
			{
				showrate = 10000,			--显示成功率 (showrate/100)% 10000为基数
				realrate = 10000,			--实际成功率 (realrate/100)%
				desc = Lang.ScriptTips.zf114,	--说明
				consumes = 				--消耗材料需求
				{
					--yb:元宝替换数(去掉此值代表此项消耗不能使用元宝替代)
					{type = 0, id = 280, count = 2, quality = 0, strong = 0, yb = 18},
					{type = 6, id = 0, count = 5000}
				},
				awards = 	--合成后物品 只能是一个 且必须type=0 客户端根据ID显示标题
				{
					{type = 0, id = 280, count = 1, quality = 1, strong = 0},
				},
			},

			--2转一级灵珠
			{
				showrate = 10000,			--显示成功率 (showrate/100)%
				realrate = 10000,			--实际成功率 (realrate/100)%
				desc = Lang.ScriptTips.zf115,	--说明
				consumes = 				--消耗材料需求
				{
					--yb:元宝替换数(去掉此值代表此项消耗不能使用元宝替代)
					{type = 0, id = 280, count = 2, quality = 1, strong = 0, yb = 36},
					{type = 6, id = 0, count = 5000}
				},
				awards = 	--合成后物品 只能是一个 且必须type=0
				{
					{type = 0, id = 280, count = 1, quality = 2, strong = 0},
				},
			},

						
			--3转一级灵珠
			{
				showrate = 10000,			--显示成功率 (showrate/100)%
				realrate = 10000,			--实际成功率 (realrate/100)%
				desc = Lang.ScriptTips.zf116,	--说明
				consumes = 				--消耗材料需求
				{
					--yb:元宝替换数(去掉此值代表此项消耗不能使用元宝替代)
					{type = 0, id = 280, count = 2, quality = 2, strong = 0, yb = 72},
					{type = 6, id = 0, count = 5000}
				},
				awards = 	--合成后物品 只能是一个 且必须type=0
				{
					{type = 0, id = 280, count = 1, quality = 3, strong = 0},
				},
			},
			
			
			--4转一级灵珠
			{
				showrate = 10000,			--显示成功率 (showrate/100)%
				realrate = 10000,			--实际成功率 (realrate/100)%
				desc = Lang.ScriptTips.zf117,	--说明
				consumes = 				--消耗材料需求
				{
					--yb:元宝替换数(去掉此值代表此项消耗不能使用元宝替代)
					{type = 0, id = 280, count = 2, quality = 3, strong = 0, yb = 144},
					{type = 6, id = 0, count = 5000}
				},
				awards = 	--合成后物品 只能是一个 且必须type=0
				{
					{type = 0, id = 280, count = 1, quality = 4, strong = 0},
				},
			},
			
				--5转一级灵珠
			{
				showrate = 10000,			--显示成功率 (showrate/100)%
				realrate = 10000,			--实际成功率 (realrate/100)%
				desc = Lang.ScriptTips.zf118,	--说明
				consumes = 				--消耗材料需求
				{
					--yb:元宝替换数(去掉此值代表此项消耗不能使用元宝替代)
					{type = 0, id = 280, count = 2, quality = 4, strong = 0, yb = 288},
					{type = 6, id = 0, count = 5000}
				},
				awards = 	--合成后物品 只能是一个 且必须type=0
				{
					{type = 0, id = 280, count = 1, quality = 5, strong = 0},
				},
			},
		},
	},
	
	
	]]
	
	
	{
		title = Lang.ScriptTips.zf096,		--技能书合成
		config =
		{
			--天龙旋风斩2级
			{
				showrate = 10000,			--显示成功率 (showrate/100)% 10000为基数
				realrate = 10000,			--实际成功率 (realrate/100)%
				desc = Lang.ScriptTips.zf097,	--说明
				consumes = 				--消耗材料需求
				{
					--yb:元宝替换数(去掉此值代表此项消耗不能使用元宝替代)
					{type = 0, id = 705, count = 5, quality = 0, strong = 0, yb = 18},
					{type = 6, id = 0, count = 5000}
				},
				awards = 	--合成后物品 只能是一个 且必须type=0 客户端根据ID显示标题
				{
					{type = 0, id = 706, count = 1, quality = 0, strong = 0},
				},
			},

			--天龙旋风斩3级
			{
				showrate = 10000,			--显示成功率 (showrate/100)%
				realrate = 10000,			--实际成功率 (realrate/100)%
				desc = Lang.ScriptTips.zf098,	--说明
				consumes = 				--消耗材料需求
				{
					--yb:元宝替换数(去掉此值代表此项消耗不能使用元宝替代)
					{type = 0, id = 706, count = 5, quality = 0, strong = 0, yb = 90},
					{type = 6, id = 0, count = 5000}
				},
				awards = 	--合成后物品 只能是一个 且必须type=0
				{
					{type = 0, id = 707, count = 1, quality = 0, strong = 0},
				},
			},
				
			--天龙旋风斩4级
			{
				showrate = 10000,			--显示成功率 (showrate/100)%
				realrate = 10000,			--实际成功率 (realrate/100)%
				desc = Lang.ScriptTips.zf099,	--说明
				consumes = 				--消耗材料需求
				{
					--yb:元宝替换数(去掉此值代表此项消耗不能使用元宝替代)
					{type = 0, id = 707, count = 5, quality = 0, strong = 0, yb = 450},
					{type = 6, id = 0, count = 5000}
				},
				awards = 	--合成后物品 只能是一个 且必须type=0
				{
					{type = 0, id = 708, count = 1, quality = 0, strong = 0},
				},
			},
			--天龙旋风斩5级
			{
				showrate = 10000,			--显示成功率 (showrate/100)%
				realrate = 10000,			--实际成功率 (realrate/100)%
				desc = Lang.ScriptTips.zf100,	--说明
				consumes = 				--消耗材料需求
				{
					--yb:元宝替换数(去掉此值代表此项消耗不能使用元宝替代)
					{type = 0, id = 708, count = 5, quality = 0, strong = 0, yb = 2250},
					{type = 6, id = 0, count = 5000}
				},
				awards = 	--合成后物品 只能是一个 且必须type=0
				{
					{type = 0, id = 709, count = 1, quality = 0, strong = 0},
				},
			},
				
			--焚天烈焰术2级
			{
				showrate = 10000,			--显示成功率 (showrate/100)% 10000为基数
				realrate = 10000,			--实际成功率 (realrate/100)%
				desc = Lang.ScriptTips.zf097,	--说明
				consumes = 				--消耗材料需求
				{
					--yb:元宝替换数(去掉此值代表此项消耗不能使用元宝替代)
					{type = 0, id = 710, count = 5, quality = 0, strong = 0, yb = 18},
					{type = 6, id = 0, count = 5000}
				},
				awards = 	--合成后物品 只能是一个 且必须type=0 客户端根据ID显示标题
				{
					{type = 0, id = 711, count = 1, quality = 0, strong = 0},
				},
			},

			--焚天烈焰术3级
			{
				showrate = 10000,			--显示成功率 (showrate/100)%
				realrate = 10000,			--实际成功率 (realrate/100)%
				desc = Lang.ScriptTips.zf098,	--说明
				consumes = 				--消耗材料需求
				{
					--yb:元宝替换数(去掉此值代表此项消耗不能使用元宝替代)
					{type = 0, id = 711, count = 5, quality = 0, strong = 0, yb = 90},
					{type = 6, id = 0, count = 5000}
				},
				awards = 	--合成后物品 只能是一个 且必须type=0
				{
					{type = 0, id = 712, count = 1, quality = 0, strong = 0},
				},
			},
				
			--焚天烈焰术4级
			{
				showrate = 10000,			--显示成功率 (showrate/100)%
				realrate = 10000,			--实际成功率 (realrate/100)%
				desc = Lang.ScriptTips.zf099,	--说明
				consumes = 				--消耗材料需求
				{
					--yb:元宝替换数(去掉此值代表此项消耗不能使用元宝替代)
					{type = 0, id = 712, count = 5, quality = 0, strong = 0, yb = 450},
					{type = 6, id = 0, count = 5000}
				},
				awards = 	--合成后物品 只能是一个 且必须type=0
				{
					{type = 0, id = 713, count = 1, quality = 0, strong = 0},
				},
			},
			--焚天烈焰术5级
			{
				showrate = 10000,			--显示成功率 (showrate/100)%
				realrate = 10000,			--实际成功率 (realrate/100)%
				desc = Lang.ScriptTips.zf100,	--说明
				consumes = 				--消耗材料需求
				{
					--yb:元宝替换数(去掉此值代表此项消耗不能使用元宝替代)
					{type = 0, id = 713, count = 5, quality = 0, strong = 0, yb = 2250},
					{type = 6, id = 0, count = 5000}
				},
				awards = 	--合成后物品 只能是一个 且必须type=0
				{
					{type = 0, id = 714, count = 1, quality = 0, strong = 0},
				},
			},
	
			--幽灵符咒术2级
			{
				showrate = 10000,			--显示成功率 (showrate/100)% 10000为基数
				realrate = 10000,			--实际成功率 (realrate/100)%
				desc = Lang.ScriptTips.zf097,	--说明
				consumes = 				--消耗材料需求
				{
					--yb:元宝替换数(去掉此值代表此项消耗不能使用元宝替代)
					{type = 0, id = 715, count = 5, quality = 0, strong = 0, yb = 18},
					{type = 6, id = 0, count = 5000}
				},
				awards = 	--合成后物品 只能是一个 且必须type=0 客户端根据ID显示标题
				{
					{type = 0, id = 716, count = 1, quality = 0, strong = 0},
				},
			},

			--幽灵符咒术3级
			{
				showrate = 10000,			--显示成功率 (showrate/100)%
				realrate = 10000,			--实际成功率 (realrate/100)%
				desc = Lang.ScriptTips.zf098,	--说明
				consumes = 				--消耗材料需求
				{
					--yb:元宝替换数(去掉此值代表此项消耗不能使用元宝替代)
					{type = 0, id = 716, count = 5, quality = 0, strong = 0, yb = 90},
					{type = 6, id = 0, count = 5000}
				},
				awards = 	--合成后物品 只能是一个 且必须type=0
				{
					{type = 0, id = 717, count = 1, quality = 0, strong = 0},
				},
			},
				
			--幽灵符咒术4级
			{
				showrate = 10000,			--显示成功率 (showrate/100)%
				realrate = 10000,			--实际成功率 (realrate/100)%
				desc = Lang.ScriptTips.zf099,	--说明
				consumes = 				--消耗材料需求
				{
					--yb:元宝替换数(去掉此值代表此项消耗不能使用元宝替代)
					{type = 0, id = 717, count = 5, quality = 0, strong = 0, yb = 450},
					{type = 6, id = 0, count = 5000}
				},
				awards = 	--合成后物品 只能是一个 且必须type=0
				{
					{type = 0, id = 718, count = 1, quality = 0, strong = 0},
				},
			},
			--幽灵符咒术5级
			{
				showrate = 10000,			--显示成功率 (showrate/100)%
				realrate = 10000,			--实际成功率 (realrate/100)%
				desc = Lang.ScriptTips.zf100,	--说明
				consumes = 				--消耗材料需求
				{
					--yb:元宝替换数(去掉此值代表此项消耗不能使用元宝替代)
					{type = 0, id = 718, count = 5, quality = 0, strong = 0, yb = 2250},
					{type = 6, id = 0, count = 5000}
				},
				awards = 	--合成后物品 只能是一个 且必须type=0
				{
					{type = 0, id = 719, count = 1, quality = 0, strong = 0},
				},
			},
		},
	},

	{
		title = Lang.ScriptTips.zf300,		--转生技能书合成
		config =
		{
			--2级金钟罩
			{
				showrate = 10000,			--显示成功率 (showrate/100)% 10000为基数
				realrate = 10000,			--实际成功率 (realrate/100)%
				desc = Lang.ScriptTips.zf301,	--说明
				consumes = 				--消耗材料需求
				{
					--yb:元宝替换数(去掉此值代表此项消耗不能使用元宝替代)
					{type = 0, id = 1745, count = 3, quality = 0, strong = 0 ,yb = 888},
					{type = 6, id =   0, count = 1000}
				},
				awards = 	--合成后物品 只能是一个 且必须type=0 客户端根据ID显示标题
				{
					{type = 0, id = 1746, count = 1, quality = 0, strong = 0},
				},
			},
			--3级金钟罩
			{
				showrate = 10000,			--显示成功率 (showrate/100)% 10000为基数
				realrate = 10000,			--实际成功率 (realrate/100)%
				desc = Lang.ScriptTips.zf302,	--说明
				consumes = 				--消耗材料需求
				{
					--yb:元宝替换数(去掉此值代表此项消耗不能使用元宝替代)
					{type = 0, id = 1746, count = 3, quality = 0, strong = 0,yb = 2664},
					{type = 6, id =   0, count = 1000}
				},
				awards = 	--合成后物品 只能是一个 且必须type=0 客户端根据ID显示标题
				{
					{type = 0, id = 1747, count = 1, quality = 0, strong = 0},
				},
			},	
							--2级金鬼火
			{
				showrate = 10000,			--显示成功率 (showrate/100)% 10000为基数
				realrate = 10000,			--实际成功率 (realrate/100)%
				desc = Lang.ScriptTips.zf303,	--说明
				consumes = 				--消耗材料需求
				{
					--yb:元宝替换数(去掉此值代表此项消耗不能使用元宝替代)
					{type = 0, id = 1748, count = 3, quality = 0, strong = 0,yb = 888},
					{type = 6, id =   0, count = 1000}
				},
				awards = 	--合成后物品 只能是一个 且必须type=0 客户端根据ID显示标题
				{
					{type = 0, id = 1749, count = 1, quality = 0, strong = 0},
				},
			},	
				--3级鬼火
				{
				showrate = 10000,			--显示成功率 (showrate/100)% 10000为基数
				realrate = 10000,			--实际成功率 (realrate/100)%
				desc = Lang.ScriptTips.zf304,	--说明
				consumes = 				--消耗材料需求
				{
					--yb:元宝替换数(去掉此值代表此项消耗不能使用元宝替代)
					{type = 0, id = 1749, count = 3, quality = 0, strong = 0,yb = 2664},
					{type = 6, id =   0, count = 1000}
				},
				awards = 	--合成后物品 只能是一个 且必须type=0 客户端根据ID显示标题
				{
					{type = 0, id = 1750, count = 1, quality = 0, strong = 0},
				},
				},					
							--2级诅咒
			{
				showrate = 10000,			--显示成功率 (showrate/100)% 10000为基数
				realrate = 10000,			--实际成功率 (realrate/100)%
				desc = Lang.ScriptTips.zf305,	--说明
				consumes = 				--消耗材料需求
				{
					--yb:元宝替换数(去掉此值代表此项消耗不能使用元宝替代)
					{type = 0, id = 1751, count = 3, quality = 0, strong = 0,yb = 888},
					{type = 6, id =   0, count = 1000}
				},
				awards = 	--合成后物品 只能是一个 且必须type=0 客户端根据ID显示标题
				{
					{type = 0, id = 1752, count = 1, quality = 0, strong = 0},
				},
			},				--3级诅咒
			{
				showrate = 10000,			--显示成功率 (showrate/100)% 10000为基数
				realrate = 10000,			--实际成功率 (realrate/100)%
				desc = Lang.ScriptTips.zf306,	--说明
				consumes = 				--消耗材料需求
				{
					--yb:元宝替换数(去掉此值代表此项消耗不能使用元宝替代)
					{type = 0, id = 1752, count = 3, quality = 0, strong = 0,yb = 2664},
					{type = 6, id =   0, count = 1000}
				},
				awards = 	--合成后物品 只能是一个 且必须type=0 客户端根据ID显示标题
				{
					{type = 0, id = 1753, count = 1, quality = 0, strong = 0},
				},

			},
		},			
	
	},
	
	
	
	
	
	{
		title = Lang.ScriptTips.zf101,		--装备合成
		config =
		{
			--一级勋章
			{
				showrate = 5000,			--显示成功率 (showrate/100)% 10000为基数
				realrate = 5000,			--实际成功率 (realrate/100)%
				desc = Lang.ScriptTips.zf102,	--说明
				consumes = 				--消耗材料需求
				{
					--yb:元宝替换数(去掉此值代表此项消耗不能使用元宝替代)
					{type = 0, id = 680, count = 4, quality = 0, strong = 0, yb = 1},
					{type = 6, id =   0, count = 1000}
				},
				awards = 	--合成后物品 只能是一个 且必须type=0 客户端根据ID显示标题
				{
					{type = 0, id = 692, count = 1, quality = 0, strong = 0},
				},
			},

		},
	},

	{
		title = Lang.ScriptTips.zf103,		--物品合成
		config =
		{
			--鉴定图鉴
			{
				showrate = 8000,			--显示成功率 (showrate/100)% 10000为基数
				realrate = 8000,			--实际成功率 (realrate/100)%
				desc = Lang.ScriptTips.zf104,	--说明
				consumes = 				--消耗材料需求
				{
					--yb:元宝替换数(去掉此值代表此项消耗不能使用元宝替代)
					{type = 0, id = 680, count = 3, quality = 0, strong = 0, yb = 1},
					--{type = 0, id = 681, count = 1, quality = 0, strong = 0, yb = 10},
					{type = 6, id =   0, count = 1000}
				},
				awards = 	--合成后物品 只能是一个 且必须type=0 客户端根据ID显示标题
				{
					{type = 0, id = 277, count = 1, quality = 0, strong = 0},
				},
			},

			--清洗砂
			{
				showrate = 8000,			--显示成功率 (showrate/100)%
				realrate = 8000,			--实际成功率 (realrate/100)%
				desc = Lang.ScriptTips.zf105,	--说明
				consumes = 				--消耗材料需求
				{
					--yb:元宝替换数(去掉此值代表此项消耗不能使用元宝替代)
					{type = 0, id = 680, count = 8, quality = 0, strong = 0, yb = 1},
					{type = 0, id = 681, count = 1, quality = 0, strong = 0, yb = 10},
					{type = 6, id =   0, count = 1000}
				},
				awards = 	--合成后物品 只能是一个 且必须type=0
				{
					{type = 0, id = 278, count = 1, quality = 0, strong = 0},
				},
			},

		},
	},

	
	{
		title = Lang.ScriptTips.zf108,		--翅膀合成
		config =
		{
			--鉴定图鉴
			{
				showrate = 10000,			--显示成功率 (showrate/100)% 10000为基数
				realrate = 10000,			--实际成功率 (realrate/100)%
				desc = Lang.ScriptTips.zf109,	--说明
				consumes = 				--消耗材料需求
				{
					--yb:元宝替换数(去掉此值代表此项消耗不能使用元宝替代)
					{type = 0, id = 1020, count = 1, quality = 0, strong = 0, yb = 0},
					{type = 0, id = 265, count = 1, quality = 0, strong = 0, yb = 0},
					{type = 6, id =   0, count = 1000}
				},
				awards = 	--合成后物品 只能是一个 且必须type=0 客户端根据ID显示标题
				{
					{type = 0, id = 259, count = 1, quality = 0, strong = 0},
				},
			},


		},
	},	
	
	{
		title = Lang.ScriptTips.zf110,		--魔晶石合成
		config =
		{
			--2级魔晶石
			{
				showrate = 10000,			--显示成功率 (showrate/100)% 10000为基数
				realrate = 10000,			--实际成功率 (realrate/100)%
				desc = Lang.ScriptTips.zf111,	--说明
				consumes = 				--消耗材料需求
				{
					--yb:元宝替换数(去掉此值代表此项消耗不能使用元宝替代)
					{type = 0, id = 1503, count = 10, quality = 0, strong = 0},
					{type = 6, id =   0, count = 1000}
				},
				awards = 	--合成后物品 只能是一个 且必须type=0 客户端根据ID显示标题
				{
					{type = 0, id = 1504, count = 1, quality = 0, strong = 0},
				},
			},
			--3级魔晶石
			{
				showrate = 10000,			--显示成功率 (showrate/100)% 10000为基数
				realrate = 10000,			--实际成功率 (realrate/100)%
				desc = Lang.ScriptTips.zf112,	--说明
				consumes = 				--消耗材料需求
				{
					--yb:元宝替换数(去掉此值代表此项消耗不能使用元宝替代)
					{type = 0, id = 1504, count = 10, quality = 0, strong = 0},
					{type = 6, id =   0, count = 1000}
				},
				awards = 	--合成后物品 只能是一个 且必须type=0 客户端根据ID显示标题
				{
					{type = 0, id = 1505, count = 1, quality = 0, strong = 0},
				},
			},

		},
	},		
	
	
	--技巧项链
	--[[{
		title = Lang.ScriptTips.zf080,		--主类菜单名字
		config = 
		{
			--中级技巧项链
			{
				showrate = 5000,			--显示成功率 (showrate/100)% 10000为基数
				realrate = 5000,			--实际成功率 (realrate/100)%
				desc = Lang.ScriptTips.zf081,	--说明
				consumes = 				--消耗材料需求
				{
					--yb:元宝替换数(去掉此值代表此项消耗不能使用元宝替代) duraOdds:耐久差 = 最大耐久-当前耐久
					{type = 0, id = 567, count = 3, quality = 0, strong = 0, duraOdds = 0, yb = 100}, 
					{type = 6, id = 0, count = 1000}
				},
				awards = 	--合成后物品 只能是一个 且必须type=0 客户端根据ID显示标题
				{
					{type = 0, id = 568, count = 1, quality = 0, strong = 0},
				},
			},
			
			--搞基技巧项链
			{
				showrate = 10000,			--显示成功率 (showrate/100)%
				realrate = 10000,			--实际成功率 (realrate/100)%
				desc = Lang.ScriptTips.zf082,	--说明
				consumes = 				--消耗材料需求
				{
					--yb:元宝替换数(去掉此值代表此项消耗不能使用元宝替代) duraOdds:耐久差 = 最大耐久-当前耐久
					{type = 0, id = 568, count = 3, quality = 0, strong = 0, duraOdds = 0, yb = 100}, 
					{type = 6, id = 0, count = 1000}
				},
				awards = 	--合成后物品 只能是一个 且必须type=0
				{
					{type = 0, id = 569, count = 1, quality = 0, strong = 0},
				},
			},
			
			--超级技巧项链
			{
				showrate = 10000,			--显示成功率 (showrate/100)%
				realrate = 10000,			--实际成功率 (realrate/100)%
				desc = Lang.ScriptTips.zf089,	--说明
				consumes = 				--消耗材料需求
				{
					--yb:元宝替换数(去掉此值代表此项消耗不能使用元宝替代) duraOdds:耐久差 = 最大耐久-当前耐久
					{type = 0, id = 569, count = 3, quality = 0, strong = 0, duraOdds = 0, yb = 100}, 
					{type = 6, id = 0, count = 1000}
				},
				awards = 	--合成后物品 只能是一个 且必须type=0
				{
					{type = 0, id = 570, count = 1, quality = 0, strong = 0},
				},
			},
			
			
			--究极技巧项链
			{
				showrate = 10000,			--显示成功率 (showrate/100)%
				realrate = 10000,			--实际成功率 (realrate/100)%
				desc = Lang.ScriptTips.zf090,	--说明
				consumes = 				--消耗材料需求
				{
					--yb:元宝替换数(去掉此值代表此项消耗不能使用元宝替代) duraOdds:耐久差 = 最大耐久-当前耐久
					{type = 0, id = 570, count = 3, quality = 0, strong = 0, duraOdds = 0, yb = 100}, 
					{type = 6, id = 0, count = 1000}
				},
				awards = 	--合成后物品 只能是一个 且必须type=0
				{
					{type = 0, id = 571, count = 1, quality = 0, strong = 0},
				},
			},

		},
	},]]
	
	
	
	
	
	--丹药合成
--[[	{
		title = Lang.ScriptTips.zf083,		--主类菜单名字
		config = 
		{
			--中级技巧项链
			{
				showrate = 9500,			--显示成功率 (showrate/100)%
				realrate = 5000,			--实际成功率 (realrate/100)%
				desc = Lang.ScriptTips.zf084,	--说明
				consumes = 				--消耗材料需求
				{
					--yb:元宝替换数(去掉此值代表此项消耗不能使用元宝替代)
					{type = 0, id = 279, count = 3, quality = 0, strong = 0, yb = 1001}, 
					{type = 0, id = 111, count = 2, quality = 0, strong = 0, yb = 100}, 
					{type = 6, id = 0, count = 1003}
				},
				awards = 	--合成后物品 只能是一个 且必须type=0
				{
					{type = 0, id = 497, count = 1, quality = 0, strong = 0},
				},
			},
		},
	},
	
	--杂物合成
	{
		title = Lang.ScriptTips.zf085,		--主类菜单名字
		config = 
		{

		},
	},  ]]
	
	}