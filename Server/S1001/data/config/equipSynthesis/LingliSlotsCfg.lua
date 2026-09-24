-- 灵力装备槽
LingliSlotsCfg = {
	
	openLevel = 70, -- 开放等级
	
	-- 用于提示
	slotNames = {"武器", "衣服", "头盔", "项链", "左手镯", "右手镯", "左戒指", "右戒指", "腰带", "靴子"},
	
	-- 注意：顺序不能改	
	slotList = {
		-- 武器
		{

			-- -- (a1) 级
			-- {
			-- 	lingli = (a2), -- 升到该等级需要的灵力值
				
			-- 	attrs = {
			-- 		-- (a3)
	        --         {
	        --             {type = (a4), value = (a5), }, --(a6)
	        --             {type = (a7), value = (a8), }, --(a9)
	        --             {type = (a10), value = (a11), }, --(a12)
			-- 			{type = (a13), value = (a14), }, --(a15)
	        --         },
			-- 		-- (a16)
	        --         {
	        --             {type = (a17), value = (a18), }, --(a19)
	        --             {type = (a20), value = (a21), }, --(a22)
	        --             {type = (a23), value = (a24), }, --(a25)
			-- 			{type = (a26), value = (a27), }, --(a28)
	        --         },
			-- 		-- (a29)
	        --         {
	        --             {type = (a30), value = (a31), }, --(a32)
	        --             {type = (a33), value = (a34), }, --(a35)
	        --             {type = (a36), value = (a37), }, --(a38)
			-- 			{type = (a39), value = (a40), }, --(a41)
	        --         },
	        --     },
	        -- },



						-- 1 级
			{
				lingli = 200, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 120, }, --物理攻击小
	                    {type = 11, value = 30, }, --物理攻击大
	                    {type = 29, value = 3, }, --准确
						{type = 31, value = 3, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 120, }, --魔法攻击小
	                    {type = 15, value = 30, }, --魔法攻击大
	                    {type = 29, value = 3, }, --准确
						{type = 31, value = 3, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 120, }, --道术攻击小
	                    {type = 19, value = 30, }, --道术攻击大
	                    {type = 29, value = 3, }, --准确
						{type = 31, value = 3, }, --闪避
	                },
	            },
	        },
			-- 2 级
			{
				lingli = 400, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 216, }, --物理攻击小
	                    {type = 11, value = 55, }, --物理攻击大
	                    {type = 29, value = 6, }, --准确
						{type = 31, value = 6, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 216, }, --魔法攻击小
	                    {type = 15, value = 55, }, --魔法攻击大
	                    {type = 29, value = 6, }, --准确
						{type = 31, value = 6, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 216, }, --道术攻击小
	                    {type = 19, value = 55, }, --道术攻击大
	                    {type = 29, value = 6, }, --准确
						{type = 31, value = 6, }, --闪避
	                },
	            },
	        },
			-- 3 级
			{
				lingli = 800, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 336, }, --物理攻击小
	                    {type = 11, value = 85, }, --物理攻击大
	                    {type = 29, value = 10, }, --准确
						{type = 31, value = 10, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 336, }, --魔法攻击小
	                    {type = 15, value = 85, }, --魔法攻击大
	                    {type = 29, value = 10, }, --准确
						{type = 31, value = 10, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 336, }, --道术攻击小
	                    {type = 19, value = 85, }, --道术攻击大
	                    {type = 29, value = 10, }, --准确
						{type = 31, value = 10, }, --闪避
	                },
	            },
	        },
			-- 4 级
			{
				lingli = 1600, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 480, }, --物理攻击小
	                    {type = 11, value = 120, }, --物理攻击大
	                    {type = 29, value = 15, }, --准确
						{type = 31, value = 15, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 480, }, --魔法攻击小
	                    {type = 15, value = 120, }, --魔法攻击大
	                    {type = 29, value = 15, }, --准确
						{type = 31, value = 15, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 480, }, --道术攻击小
	                    {type = 19, value = 120, }, --道术攻击大
	                    {type = 29, value = 15, }, --准确
						{type = 31, value = 15, }, --闪避
	                },
	            },
	        },
			-- 5 级
			{
				lingli = 3200, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 650, }, --物理攻击小
	                    {type = 11, value = 163, }, --物理攻击大
	                    {type = 29, value = 21, }, --准确
						{type = 31, value = 21, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 650, }, --魔法攻击小
	                    {type = 15, value = 163, }, --魔法攻击大
	                    {type = 29, value = 21, }, --准确
						{type = 31, value = 21, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 650, }, --道术攻击小
	                    {type = 19, value = 163, }, --道术攻击大
	                    {type = 29, value = 21, }, --准确
						{type = 31, value = 21, }, --闪避
	                },
	            },
	        },
			-- 6 级
			{
				lingli = 4500, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 840, }, --物理攻击小
	                    {type = 11, value = 210, }, --物理攻击大
	                    {type = 29, value = 28, }, --准确
						{type = 31, value = 28, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 840, }, --魔法攻击小
	                    {type = 15, value = 210, }, --魔法攻击大
	                    {type = 29, value = 28, }, --准确
						{type = 31, value = 28, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 840, }, --道术攻击小
	                    {type = 19, value = 210, }, --道术攻击大
	                    {type = 29, value = 28, }, --准确
						{type = 31, value = 28, }, --闪避
	                },
	            },
	        },
			-- 7 级
			{
				lingli = 9000, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 1056, }, --物理攻击小
	                    {type = 11, value = 300, }, --物理攻击大
	                    {type = 29, value = 38, }, --准确
						{type = 31, value = 38, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 1056, }, --魔法攻击小
	                    {type = 15, value = 300, }, --魔法攻击大
	                    {type = 29, value = 38, }, --准确
						{type = 31, value = 38, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 1056, }, --道术攻击小
	                    {type = 19, value = 300, }, --道术攻击大
	                    {type = 29, value = 38, }, --准确
						{type = 31, value = 38, }, --闪避
	                },
	            },
	        },
			-- 8 级
			{
				lingli = 18500, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 1296, }, --物理攻击小
	                    {type = 11, value = 423, }, --物理攻击大
	                    {type = 29, value = 50, }, --准确
						{type = 31, value = 50, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 1296, }, --魔法攻击小
	                    {type = 15, value = 423, }, --魔法攻击大
	                    {type = 29, value = 50, }, --准确
						{type = 31, value = 50, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 1296, }, --道术攻击小
	                    {type = 19, value = 423, }, --道术攻击大
	                    {type = 29, value = 50, }, --准确
						{type = 31, value = 50, }, --闪避
	                },
	            },
	        },
			-- 9 级
			{
				lingli = 28500, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 1560, }, --物理攻击小
	                    {type = 11, value = 582, }, --物理攻击大
	                    {type = 29, value = 65, }, --准确
						{type = 31, value = 65, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 1560, }, --魔法攻击小
	                    {type = 15, value = 582, }, --魔法攻击大
	                    {type = 29, value = 65, }, --准确
						{type = 31, value = 65, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 1560, }, --道术攻击小
	                    {type = 19, value = 582, }, --道术攻击大
	                    {type = 29, value = 65, }, --准确
						{type = 31, value = 65, }, --闪避
	                },
	            },
	        },
			-- 10 级
			{
				lingli = 39800, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 1850, }, --物理攻击小
	                    {type = 11, value = 762, }, --物理攻击大
	                    {type = 29, value = 80, }, --准确
						{type = 31, value = 80, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 1850, }, --魔法攻击小
	                    {type = 15, value = 762, }, --魔法攻击大
	                    {type = 29, value = 80, }, --准确
						{type = 31, value = 80, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 1850, }, --道术攻击小
	                    {type = 19, value = 762, }, --道术攻击大
	                    {type = 29, value = 80, }, --准确
						{type = 31, value = 80, }, --闪避
	                },
	            },
	        },
			-- 11 级
			{
				lingli = 52000, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 2160, }, --物理攻击小
	                    {type = 11, value = 965, }, --物理攻击大
	                    {type = 29, value = 95, }, --准确
						{type = 31, value = 95, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 2160, }, --魔法攻击小
	                    {type = 15, value = 965, }, --魔法攻击大
	                    {type = 29, value = 95, }, --准确
						{type = 31, value = 95, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 2160, }, --道术攻击小
	                    {type = 19, value = 965, }, --道术攻击大
	                    {type = 29, value = 95, }, --准确
						{type = 31, value = 95, }, --闪避
	                },
	            },
	        },
			-- 12 级
			{
				lingli = 68000, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 2500, }, --物理攻击小
	                    {type = 11, value = 1198, }, --物理攻击大
	                    {type = 29, value = 110, }, --准确
						{type = 31, value = 110, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 2500, }, --魔法攻击小
	                    {type = 15, value = 1198, }, --魔法攻击大
	                    {type = 29, value = 110, }, --准确
						{type = 31, value = 110, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 2500, }, --道术攻击小
	                    {type = 19, value = 1198, }, --道术攻击大
	                    {type = 29, value = 110, }, --准确
						{type = 31, value = 110, }, --闪避
	                },
	            },
	        },


		},
		
		-- 衣服
		{
						-- 1 级
			{
				lingli = 200, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 120, }, --物理攻击小
	                    {type = 11, value = 30, }, --物理攻击大
	                    {type = 29, value = 3, }, --准确
						{type = 31, value = 3, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 120, }, --魔法攻击小
	                    {type = 15, value = 30, }, --魔法攻击大
	                    {type = 29, value = 3, }, --准确
						{type = 31, value = 3, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 120, }, --道术攻击小
	                    {type = 19, value = 30, }, --道术攻击大
	                    {type = 29, value = 3, }, --准确
						{type = 31, value = 3, }, --闪避
	                },
	            },
	        },
			-- 2 级
			{
				lingli = 400, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 216, }, --物理攻击小
	                    {type = 11, value = 55, }, --物理攻击大
	                    {type = 29, value = 6, }, --准确
						{type = 31, value = 6, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 216, }, --魔法攻击小
	                    {type = 15, value = 55, }, --魔法攻击大
	                    {type = 29, value = 6, }, --准确
						{type = 31, value = 6, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 216, }, --道术攻击小
	                    {type = 19, value = 55, }, --道术攻击大
	                    {type = 29, value = 6, }, --准确
						{type = 31, value = 6, }, --闪避
	                },
	            },
	        },
			-- 3 级
			{
				lingli = 800, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 336, }, --物理攻击小
	                    {type = 11, value = 85, }, --物理攻击大
	                    {type = 29, value = 10, }, --准确
						{type = 31, value = 10, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 336, }, --魔法攻击小
	                    {type = 15, value = 85, }, --魔法攻击大
	                    {type = 29, value = 10, }, --准确
						{type = 31, value = 10, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 336, }, --道术攻击小
	                    {type = 19, value = 85, }, --道术攻击大
	                    {type = 29, value = 10, }, --准确
						{type = 31, value = 10, }, --闪避
	                },
	            },
	        },
			-- 4 级
			{
				lingli = 1600, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 480, }, --物理攻击小
	                    {type = 11, value = 120, }, --物理攻击大
	                    {type = 29, value = 15, }, --准确
						{type = 31, value = 15, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 480, }, --魔法攻击小
	                    {type = 15, value = 120, }, --魔法攻击大
	                    {type = 29, value = 15, }, --准确
						{type = 31, value = 15, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 480, }, --道术攻击小
	                    {type = 19, value = 120, }, --道术攻击大
	                    {type = 29, value = 15, }, --准确
						{type = 31, value = 15, }, --闪避
	                },
	            },
	        },
			-- 5 级
			{
				lingli = 3200, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 650, }, --物理攻击小
	                    {type = 11, value = 163, }, --物理攻击大
	                    {type = 29, value = 21, }, --准确
						{type = 31, value = 21, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 650, }, --魔法攻击小
	                    {type = 15, value = 163, }, --魔法攻击大
	                    {type = 29, value = 21, }, --准确
						{type = 31, value = 21, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 650, }, --道术攻击小
	                    {type = 19, value = 163, }, --道术攻击大
	                    {type = 29, value = 21, }, --准确
						{type = 31, value = 21, }, --闪避
	                },
	            },
	        },
			-- 6 级
			{
				lingli = 4500, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 840, }, --物理攻击小
	                    {type = 11, value = 210, }, --物理攻击大
	                    {type = 29, value = 28, }, --准确
						{type = 31, value = 28, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 840, }, --魔法攻击小
	                    {type = 15, value = 210, }, --魔法攻击大
	                    {type = 29, value = 28, }, --准确
						{type = 31, value = 28, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 840, }, --道术攻击小
	                    {type = 19, value = 210, }, --道术攻击大
	                    {type = 29, value = 28, }, --准确
						{type = 31, value = 28, }, --闪避
	                },
	            },
	        },
			-- 7 级
			{
				lingli = 9000, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 1056, }, --物理攻击小
	                    {type = 11, value = 300, }, --物理攻击大
	                    {type = 29, value = 38, }, --准确
						{type = 31, value = 38, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 1056, }, --魔法攻击小
	                    {type = 15, value = 300, }, --魔法攻击大
	                    {type = 29, value = 38, }, --准确
						{type = 31, value = 38, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 1056, }, --道术攻击小
	                    {type = 19, value = 300, }, --道术攻击大
	                    {type = 29, value = 38, }, --准确
						{type = 31, value = 38, }, --闪避
	                },
	            },
	        },
			-- 8 级
			{
				lingli = 18500, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 1296, }, --物理攻击小
	                    {type = 11, value = 423, }, --物理攻击大
	                    {type = 29, value = 50, }, --准确
						{type = 31, value = 50, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 1296, }, --魔法攻击小
	                    {type = 15, value = 423, }, --魔法攻击大
	                    {type = 29, value = 50, }, --准确
						{type = 31, value = 50, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 1296, }, --道术攻击小
	                    {type = 19, value = 423, }, --道术攻击大
	                    {type = 29, value = 50, }, --准确
						{type = 31, value = 50, }, --闪避
	                },
	            },
	        },
			-- 9 级
			{
				lingli = 28500, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 1560, }, --物理攻击小
	                    {type = 11, value = 582, }, --物理攻击大
	                    {type = 29, value = 65, }, --准确
						{type = 31, value = 65, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 1560, }, --魔法攻击小
	                    {type = 15, value = 582, }, --魔法攻击大
	                    {type = 29, value = 65, }, --准确
						{type = 31, value = 65, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 1560, }, --道术攻击小
	                    {type = 19, value = 582, }, --道术攻击大
	                    {type = 29, value = 65, }, --准确
						{type = 31, value = 65, }, --闪避
	                },
	            },
	        },
			-- 10 级
			{
				lingli = 39800, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 1850, }, --物理攻击小
	                    {type = 11, value = 762, }, --物理攻击大
	                    {type = 29, value = 80, }, --准确
						{type = 31, value = 80, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 1850, }, --魔法攻击小
	                    {type = 15, value = 762, }, --魔法攻击大
	                    {type = 29, value = 80, }, --准确
						{type = 31, value = 80, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 1850, }, --道术攻击小
	                    {type = 19, value = 762, }, --道术攻击大
	                    {type = 29, value = 80, }, --准确
						{type = 31, value = 80, }, --闪避
	                },
	            },
	        },
			-- 11 级
			{
				lingli = 52000, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 2160, }, --物理攻击小
	                    {type = 11, value = 965, }, --物理攻击大
	                    {type = 29, value = 95, }, --准确
						{type = 31, value = 95, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 2160, }, --魔法攻击小
	                    {type = 15, value = 965, }, --魔法攻击大
	                    {type = 29, value = 95, }, --准确
						{type = 31, value = 95, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 2160, }, --道术攻击小
	                    {type = 19, value = 965, }, --道术攻击大
	                    {type = 29, value = 95, }, --准确
						{type = 31, value = 95, }, --闪避
	                },
	            },
	        },
			-- 12 级
			{
				lingli = 68000, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 2500, }, --物理攻击小
	                    {type = 11, value = 1198, }, --物理攻击大
	                    {type = 29, value = 110, }, --准确
						{type = 31, value = 110, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 2500, }, --魔法攻击小
	                    {type = 15, value = 1198, }, --魔法攻击大
	                    {type = 29, value = 110, }, --准确
						{type = 31, value = 110, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 2500, }, --道术攻击小
	                    {type = 19, value = 1198, }, --道术攻击大
	                    {type = 29, value = 110, }, --准确
						{type = 31, value = 110, }, --闪避
	                },
	            },
	        },


		},
		
		-- 头盔
		{
						-- 1 级
			{
				lingli = 200, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 120, }, --物理攻击小
	                    {type = 11, value = 30, }, --物理攻击大
	                    {type = 29, value = 3, }, --准确
						{type = 31, value = 3, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 120, }, --魔法攻击小
	                    {type = 15, value = 30, }, --魔法攻击大
	                    {type = 29, value = 3, }, --准确
						{type = 31, value = 3, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 120, }, --道术攻击小
	                    {type = 19, value = 30, }, --道术攻击大
	                    {type = 29, value = 3, }, --准确
						{type = 31, value = 3, }, --闪避
	                },
	            },
	        },
			-- 2 级
			{
				lingli = 400, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 216, }, --物理攻击小
	                    {type = 11, value = 55, }, --物理攻击大
	                    {type = 29, value = 6, }, --准确
						{type = 31, value = 6, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 216, }, --魔法攻击小
	                    {type = 15, value = 55, }, --魔法攻击大
	                    {type = 29, value = 6, }, --准确
						{type = 31, value = 6, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 216, }, --道术攻击小
	                    {type = 19, value = 55, }, --道术攻击大
	                    {type = 29, value = 6, }, --准确
						{type = 31, value = 6, }, --闪避
	                },
	            },
	        },
			-- 3 级
			{
				lingli = 800, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 336, }, --物理攻击小
	                    {type = 11, value = 85, }, --物理攻击大
	                    {type = 29, value = 10, }, --准确
						{type = 31, value = 10, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 336, }, --魔法攻击小
	                    {type = 15, value = 85, }, --魔法攻击大
	                    {type = 29, value = 10, }, --准确
						{type = 31, value = 10, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 336, }, --道术攻击小
	                    {type = 19, value = 85, }, --道术攻击大
	                    {type = 29, value = 10, }, --准确
						{type = 31, value = 10, }, --闪避
	                },
	            },
	        },
			-- 4 级
			{
				lingli = 1600, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 480, }, --物理攻击小
	                    {type = 11, value = 120, }, --物理攻击大
	                    {type = 29, value = 15, }, --准确
						{type = 31, value = 15, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 480, }, --魔法攻击小
	                    {type = 15, value = 120, }, --魔法攻击大
	                    {type = 29, value = 15, }, --准确
						{type = 31, value = 15, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 480, }, --道术攻击小
	                    {type = 19, value = 120, }, --道术攻击大
	                    {type = 29, value = 15, }, --准确
						{type = 31, value = 15, }, --闪避
	                },
	            },
	        },
			-- 5 级
			{
				lingli = 3200, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 650, }, --物理攻击小
	                    {type = 11, value = 163, }, --物理攻击大
	                    {type = 29, value = 21, }, --准确
						{type = 31, value = 21, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 650, }, --魔法攻击小
	                    {type = 15, value = 163, }, --魔法攻击大
	                    {type = 29, value = 21, }, --准确
						{type = 31, value = 21, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 650, }, --道术攻击小
	                    {type = 19, value = 163, }, --道术攻击大
	                    {type = 29, value = 21, }, --准确
						{type = 31, value = 21, }, --闪避
	                },
	            },
	        },
			-- 6 级
			{
				lingli = 4500, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 840, }, --物理攻击小
	                    {type = 11, value = 210, }, --物理攻击大
	                    {type = 29, value = 28, }, --准确
						{type = 31, value = 28, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 840, }, --魔法攻击小
	                    {type = 15, value = 210, }, --魔法攻击大
	                    {type = 29, value = 28, }, --准确
						{type = 31, value = 28, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 840, }, --道术攻击小
	                    {type = 19, value = 210, }, --道术攻击大
	                    {type = 29, value = 28, }, --准确
						{type = 31, value = 28, }, --闪避
	                },
	            },
	        },
			-- 7 级
			{
				lingli = 9000, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 1056, }, --物理攻击小
	                    {type = 11, value = 300, }, --物理攻击大
	                    {type = 29, value = 38, }, --准确
						{type = 31, value = 38, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 1056, }, --魔法攻击小
	                    {type = 15, value = 300, }, --魔法攻击大
	                    {type = 29, value = 38, }, --准确
						{type = 31, value = 38, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 1056, }, --道术攻击小
	                    {type = 19, value = 300, }, --道术攻击大
	                    {type = 29, value = 38, }, --准确
						{type = 31, value = 38, }, --闪避
	                },
	            },
	        },
			-- 8 级
			{
				lingli = 18500, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 1296, }, --物理攻击小
	                    {type = 11, value = 423, }, --物理攻击大
	                    {type = 29, value = 50, }, --准确
						{type = 31, value = 50, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 1296, }, --魔法攻击小
	                    {type = 15, value = 423, }, --魔法攻击大
	                    {type = 29, value = 50, }, --准确
						{type = 31, value = 50, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 1296, }, --道术攻击小
	                    {type = 19, value = 423, }, --道术攻击大
	                    {type = 29, value = 50, }, --准确
						{type = 31, value = 50, }, --闪避
	                },
	            },
	        },
			-- 9 级
			{
				lingli = 28500, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 1560, }, --物理攻击小
	                    {type = 11, value = 582, }, --物理攻击大
	                    {type = 29, value = 65, }, --准确
						{type = 31, value = 65, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 1560, }, --魔法攻击小
	                    {type = 15, value = 582, }, --魔法攻击大
	                    {type = 29, value = 65, }, --准确
						{type = 31, value = 65, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 1560, }, --道术攻击小
	                    {type = 19, value = 582, }, --道术攻击大
	                    {type = 29, value = 65, }, --准确
						{type = 31, value = 65, }, --闪避
	                },
	            },
	        },
			-- 10 级
			{
				lingli = 39800, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 1850, }, --物理攻击小
	                    {type = 11, value = 762, }, --物理攻击大
	                    {type = 29, value = 80, }, --准确
						{type = 31, value = 80, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 1850, }, --魔法攻击小
	                    {type = 15, value = 762, }, --魔法攻击大
	                    {type = 29, value = 80, }, --准确
						{type = 31, value = 80, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 1850, }, --道术攻击小
	                    {type = 19, value = 762, }, --道术攻击大
	                    {type = 29, value = 80, }, --准确
						{type = 31, value = 80, }, --闪避
	                },
	            },
	        },
			-- 11 级
			{
				lingli = 52000, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 2160, }, --物理攻击小
	                    {type = 11, value = 965, }, --物理攻击大
	                    {type = 29, value = 95, }, --准确
						{type = 31, value = 95, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 2160, }, --魔法攻击小
	                    {type = 15, value = 965, }, --魔法攻击大
	                    {type = 29, value = 95, }, --准确
						{type = 31, value = 95, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 2160, }, --道术攻击小
	                    {type = 19, value = 965, }, --道术攻击大
	                    {type = 29, value = 95, }, --准确
						{type = 31, value = 95, }, --闪避
	                },
	            },
	        },
			-- 12 级
			{
				lingli = 68000, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 2500, }, --物理攻击小
	                    {type = 11, value = 1198, }, --物理攻击大
	                    {type = 29, value = 110, }, --准确
						{type = 31, value = 110, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 2500, }, --魔法攻击小
	                    {type = 15, value = 1198, }, --魔法攻击大
	                    {type = 29, value = 110, }, --准确
						{type = 31, value = 110, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 2500, }, --道术攻击小
	                    {type = 19, value = 1198, }, --道术攻击大
	                    {type = 29, value = 110, }, --准确
						{type = 31, value = 110, }, --闪避
	                },
	            },
	        },


		},
		
		-- 项链
		{
						-- 1 级
			{
				lingli = 200, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 120, }, --物理攻击小
	                    {type = 11, value = 30, }, --物理攻击大
	                    {type = 29, value = 3, }, --准确
						{type = 31, value = 3, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 120, }, --魔法攻击小
	                    {type = 15, value = 30, }, --魔法攻击大
	                    {type = 29, value = 3, }, --准确
						{type = 31, value = 3, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 120, }, --道术攻击小
	                    {type = 19, value = 30, }, --道术攻击大
	                    {type = 29, value = 3, }, --准确
						{type = 31, value = 3, }, --闪避
	                },
	            },
	        },
			-- 2 级
			{
				lingli = 400, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 216, }, --物理攻击小
	                    {type = 11, value = 55, }, --物理攻击大
	                    {type = 29, value = 6, }, --准确
						{type = 31, value = 6, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 216, }, --魔法攻击小
	                    {type = 15, value = 55, }, --魔法攻击大
	                    {type = 29, value = 6, }, --准确
						{type = 31, value = 6, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 216, }, --道术攻击小
	                    {type = 19, value = 55, }, --道术攻击大
	                    {type = 29, value = 6, }, --准确
						{type = 31, value = 6, }, --闪避
	                },
	            },
	        },
			-- 3 级
			{
				lingli = 800, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 336, }, --物理攻击小
	                    {type = 11, value = 85, }, --物理攻击大
	                    {type = 29, value = 10, }, --准确
						{type = 31, value = 10, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 336, }, --魔法攻击小
	                    {type = 15, value = 85, }, --魔法攻击大
	                    {type = 29, value = 10, }, --准确
						{type = 31, value = 10, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 336, }, --道术攻击小
	                    {type = 19, value = 85, }, --道术攻击大
	                    {type = 29, value = 10, }, --准确
						{type = 31, value = 10, }, --闪避
	                },
	            },
	        },
			-- 4 级
			{
				lingli = 1600, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 480, }, --物理攻击小
	                    {type = 11, value = 120, }, --物理攻击大
	                    {type = 29, value = 15, }, --准确
						{type = 31, value = 15, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 480, }, --魔法攻击小
	                    {type = 15, value = 120, }, --魔法攻击大
	                    {type = 29, value = 15, }, --准确
						{type = 31, value = 15, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 480, }, --道术攻击小
	                    {type = 19, value = 120, }, --道术攻击大
	                    {type = 29, value = 15, }, --准确
						{type = 31, value = 15, }, --闪避
	                },
	            },
	        },
			-- 5 级
			{
				lingli = 3200, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 650, }, --物理攻击小
	                    {type = 11, value = 163, }, --物理攻击大
	                    {type = 29, value = 21, }, --准确
						{type = 31, value = 21, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 650, }, --魔法攻击小
	                    {type = 15, value = 163, }, --魔法攻击大
	                    {type = 29, value = 21, }, --准确
						{type = 31, value = 21, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 650, }, --道术攻击小
	                    {type = 19, value = 163, }, --道术攻击大
	                    {type = 29, value = 21, }, --准确
						{type = 31, value = 21, }, --闪避
	                },
	            },
	        },
			-- 6 级
			{
				lingli = 4500, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 840, }, --物理攻击小
	                    {type = 11, value = 210, }, --物理攻击大
	                    {type = 29, value = 28, }, --准确
						{type = 31, value = 28, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 840, }, --魔法攻击小
	                    {type = 15, value = 210, }, --魔法攻击大
	                    {type = 29, value = 28, }, --准确
						{type = 31, value = 28, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 840, }, --道术攻击小
	                    {type = 19, value = 210, }, --道术攻击大
	                    {type = 29, value = 28, }, --准确
						{type = 31, value = 28, }, --闪避
	                },
	            },
	        },
			-- 7 级
			{
				lingli = 9000, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 1056, }, --物理攻击小
	                    {type = 11, value = 300, }, --物理攻击大
	                    {type = 29, value = 38, }, --准确
						{type = 31, value = 38, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 1056, }, --魔法攻击小
	                    {type = 15, value = 300, }, --魔法攻击大
	                    {type = 29, value = 38, }, --准确
						{type = 31, value = 38, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 1056, }, --道术攻击小
	                    {type = 19, value = 300, }, --道术攻击大
	                    {type = 29, value = 38, }, --准确
						{type = 31, value = 38, }, --闪避
	                },
	            },
	        },
			-- 8 级
			{
				lingli = 18500, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 1296, }, --物理攻击小
	                    {type = 11, value = 423, }, --物理攻击大
	                    {type = 29, value = 50, }, --准确
						{type = 31, value = 50, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 1296, }, --魔法攻击小
	                    {type = 15, value = 423, }, --魔法攻击大
	                    {type = 29, value = 50, }, --准确
						{type = 31, value = 50, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 1296, }, --道术攻击小
	                    {type = 19, value = 423, }, --道术攻击大
	                    {type = 29, value = 50, }, --准确
						{type = 31, value = 50, }, --闪避
	                },
	            },
	        },
			-- 9 级
			{
				lingli = 28500, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 1560, }, --物理攻击小
	                    {type = 11, value = 582, }, --物理攻击大
	                    {type = 29, value = 65, }, --准确
						{type = 31, value = 65, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 1560, }, --魔法攻击小
	                    {type = 15, value = 582, }, --魔法攻击大
	                    {type = 29, value = 65, }, --准确
						{type = 31, value = 65, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 1560, }, --道术攻击小
	                    {type = 19, value = 582, }, --道术攻击大
	                    {type = 29, value = 65, }, --准确
						{type = 31, value = 65, }, --闪避
	                },
	            },
	        },
			-- 10 级
			{
				lingli = 39800, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 1850, }, --物理攻击小
	                    {type = 11, value = 762, }, --物理攻击大
	                    {type = 29, value = 80, }, --准确
						{type = 31, value = 80, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 1850, }, --魔法攻击小
	                    {type = 15, value = 762, }, --魔法攻击大
	                    {type = 29, value = 80, }, --准确
						{type = 31, value = 80, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 1850, }, --道术攻击小
	                    {type = 19, value = 762, }, --道术攻击大
	                    {type = 29, value = 80, }, --准确
						{type = 31, value = 80, }, --闪避
	                },
	            },
	        },
			-- 11 级
			{
				lingli = 52000, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 2160, }, --物理攻击小
	                    {type = 11, value = 965, }, --物理攻击大
	                    {type = 29, value = 95, }, --准确
						{type = 31, value = 95, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 2160, }, --魔法攻击小
	                    {type = 15, value = 965, }, --魔法攻击大
	                    {type = 29, value = 95, }, --准确
						{type = 31, value = 95, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 2160, }, --道术攻击小
	                    {type = 19, value = 965, }, --道术攻击大
	                    {type = 29, value = 95, }, --准确
						{type = 31, value = 95, }, --闪避
	                },
	            },
	        },
			-- 12 级
			{
				lingli = 68000, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 2500, }, --物理攻击小
	                    {type = 11, value = 1198, }, --物理攻击大
	                    {type = 29, value = 110, }, --准确
						{type = 31, value = 110, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 2500, }, --魔法攻击小
	                    {type = 15, value = 1198, }, --魔法攻击大
	                    {type = 29, value = 110, }, --准确
						{type = 31, value = 110, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 2500, }, --道术攻击小
	                    {type = 19, value = 1198, }, --道术攻击大
	                    {type = 29, value = 110, }, --准确
						{type = 31, value = 110, }, --闪避
	                },
	            },
	        },


		},
		
		-- 左手镯
		{
						-- 1 级
			{
				lingli = 200, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 120, }, --物理攻击小
	                    {type = 11, value = 30, }, --物理攻击大
	                    {type = 29, value = 3, }, --准确
						{type = 31, value = 3, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 120, }, --魔法攻击小
	                    {type = 15, value = 30, }, --魔法攻击大
	                    {type = 29, value = 3, }, --准确
						{type = 31, value = 3, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 120, }, --道术攻击小
	                    {type = 19, value = 30, }, --道术攻击大
	                    {type = 29, value = 3, }, --准确
						{type = 31, value = 3, }, --闪避
	                },
	            },
	        },
			-- 2 级
			{
				lingli = 400, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 216, }, --物理攻击小
	                    {type = 11, value = 55, }, --物理攻击大
	                    {type = 29, value = 6, }, --准确
						{type = 31, value = 6, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 216, }, --魔法攻击小
	                    {type = 15, value = 55, }, --魔法攻击大
	                    {type = 29, value = 6, }, --准确
						{type = 31, value = 6, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 216, }, --道术攻击小
	                    {type = 19, value = 55, }, --道术攻击大
	                    {type = 29, value = 6, }, --准确
						{type = 31, value = 6, }, --闪避
	                },
	            },
	        },
			-- 3 级
			{
				lingli = 800, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 336, }, --物理攻击小
	                    {type = 11, value = 85, }, --物理攻击大
	                    {type = 29, value = 10, }, --准确
						{type = 31, value = 10, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 336, }, --魔法攻击小
	                    {type = 15, value = 85, }, --魔法攻击大
	                    {type = 29, value = 10, }, --准确
						{type = 31, value = 10, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 336, }, --道术攻击小
	                    {type = 19, value = 85, }, --道术攻击大
	                    {type = 29, value = 10, }, --准确
						{type = 31, value = 10, }, --闪避
	                },
	            },
	        },
			-- 4 级
			{
				lingli = 1600, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 480, }, --物理攻击小
	                    {type = 11, value = 120, }, --物理攻击大
	                    {type = 29, value = 15, }, --准确
						{type = 31, value = 15, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 480, }, --魔法攻击小
	                    {type = 15, value = 120, }, --魔法攻击大
	                    {type = 29, value = 15, }, --准确
						{type = 31, value = 15, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 480, }, --道术攻击小
	                    {type = 19, value = 120, }, --道术攻击大
	                    {type = 29, value = 15, }, --准确
						{type = 31, value = 15, }, --闪避
	                },
	            },
	        },
			-- 5 级
			{
				lingli = 3200, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 650, }, --物理攻击小
	                    {type = 11, value = 163, }, --物理攻击大
	                    {type = 29, value = 21, }, --准确
						{type = 31, value = 21, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 650, }, --魔法攻击小
	                    {type = 15, value = 163, }, --魔法攻击大
	                    {type = 29, value = 21, }, --准确
						{type = 31, value = 21, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 650, }, --道术攻击小
	                    {type = 19, value = 163, }, --道术攻击大
	                    {type = 29, value = 21, }, --准确
						{type = 31, value = 21, }, --闪避
	                },
	            },
	        },
			-- 6 级
			{
				lingli = 4500, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 840, }, --物理攻击小
	                    {type = 11, value = 210, }, --物理攻击大
	                    {type = 29, value = 28, }, --准确
						{type = 31, value = 28, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 840, }, --魔法攻击小
	                    {type = 15, value = 210, }, --魔法攻击大
	                    {type = 29, value = 28, }, --准确
						{type = 31, value = 28, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 840, }, --道术攻击小
	                    {type = 19, value = 210, }, --道术攻击大
	                    {type = 29, value = 28, }, --准确
						{type = 31, value = 28, }, --闪避
	                },
	            },
	        },
			-- 7 级
			{
				lingli = 9000, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 1056, }, --物理攻击小
	                    {type = 11, value = 300, }, --物理攻击大
	                    {type = 29, value = 38, }, --准确
						{type = 31, value = 38, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 1056, }, --魔法攻击小
	                    {type = 15, value = 300, }, --魔法攻击大
	                    {type = 29, value = 38, }, --准确
						{type = 31, value = 38, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 1056, }, --道术攻击小
	                    {type = 19, value = 300, }, --道术攻击大
	                    {type = 29, value = 38, }, --准确
						{type = 31, value = 38, }, --闪避
	                },
	            },
	        },
			-- 8 级
			{
				lingli = 18500, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 1296, }, --物理攻击小
	                    {type = 11, value = 423, }, --物理攻击大
	                    {type = 29, value = 50, }, --准确
						{type = 31, value = 50, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 1296, }, --魔法攻击小
	                    {type = 15, value = 423, }, --魔法攻击大
	                    {type = 29, value = 50, }, --准确
						{type = 31, value = 50, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 1296, }, --道术攻击小
	                    {type = 19, value = 423, }, --道术攻击大
	                    {type = 29, value = 50, }, --准确
						{type = 31, value = 50, }, --闪避
	                },
	            },
	        },
			-- 9 级
			{
				lingli = 28500, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 1560, }, --物理攻击小
	                    {type = 11, value = 582, }, --物理攻击大
	                    {type = 29, value = 65, }, --准确
						{type = 31, value = 65, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 1560, }, --魔法攻击小
	                    {type = 15, value = 582, }, --魔法攻击大
	                    {type = 29, value = 65, }, --准确
						{type = 31, value = 65, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 1560, }, --道术攻击小
	                    {type = 19, value = 582, }, --道术攻击大
	                    {type = 29, value = 65, }, --准确
						{type = 31, value = 65, }, --闪避
	                },
	            },
	        },
			-- 10 级
			{
				lingli = 39800, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 1850, }, --物理攻击小
	                    {type = 11, value = 762, }, --物理攻击大
	                    {type = 29, value = 80, }, --准确
						{type = 31, value = 80, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 1850, }, --魔法攻击小
	                    {type = 15, value = 762, }, --魔法攻击大
	                    {type = 29, value = 80, }, --准确
						{type = 31, value = 80, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 1850, }, --道术攻击小
	                    {type = 19, value = 762, }, --道术攻击大
	                    {type = 29, value = 80, }, --准确
						{type = 31, value = 80, }, --闪避
	                },
	            },
	        },
			-- 11 级
			{
				lingli = 52000, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 2160, }, --物理攻击小
	                    {type = 11, value = 965, }, --物理攻击大
	                    {type = 29, value = 95, }, --准确
						{type = 31, value = 95, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 2160, }, --魔法攻击小
	                    {type = 15, value = 965, }, --魔法攻击大
	                    {type = 29, value = 95, }, --准确
						{type = 31, value = 95, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 2160, }, --道术攻击小
	                    {type = 19, value = 965, }, --道术攻击大
	                    {type = 29, value = 95, }, --准确
						{type = 31, value = 95, }, --闪避
	                },
	            },
	        },
			-- 12 级
			{
				lingli = 68000, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 2500, }, --物理攻击小
	                    {type = 11, value = 1198, }, --物理攻击大
	                    {type = 29, value = 110, }, --准确
						{type = 31, value = 110, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 2500, }, --魔法攻击小
	                    {type = 15, value = 1198, }, --魔法攻击大
	                    {type = 29, value = 110, }, --准确
						{type = 31, value = 110, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 2500, }, --道术攻击小
	                    {type = 19, value = 1198, }, --道术攻击大
	                    {type = 29, value = 110, }, --准确
						{type = 31, value = 110, }, --闪避
	                },
	            },
	        },


		},
		
		-- 右手镯
		{
						-- 1 级
			{
				lingli = 200, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 120, }, --物理攻击小
	                    {type = 11, value = 30, }, --物理攻击大
	                    {type = 29, value = 3, }, --准确
						{type = 31, value = 3, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 120, }, --魔法攻击小
	                    {type = 15, value = 30, }, --魔法攻击大
	                    {type = 29, value = 3, }, --准确
						{type = 31, value = 3, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 120, }, --道术攻击小
	                    {type = 19, value = 30, }, --道术攻击大
	                    {type = 29, value = 3, }, --准确
						{type = 31, value = 3, }, --闪避
	                },
	            },
	        },
			-- 2 级
			{
				lingli = 400, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 216, }, --物理攻击小
	                    {type = 11, value = 55, }, --物理攻击大
	                    {type = 29, value = 6, }, --准确
						{type = 31, value = 6, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 216, }, --魔法攻击小
	                    {type = 15, value = 55, }, --魔法攻击大
	                    {type = 29, value = 6, }, --准确
						{type = 31, value = 6, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 216, }, --道术攻击小
	                    {type = 19, value = 55, }, --道术攻击大
	                    {type = 29, value = 6, }, --准确
						{type = 31, value = 6, }, --闪避
	                },
	            },
	        },
			-- 3 级
			{
				lingli = 800, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 336, }, --物理攻击小
	                    {type = 11, value = 85, }, --物理攻击大
	                    {type = 29, value = 10, }, --准确
						{type = 31, value = 10, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 336, }, --魔法攻击小
	                    {type = 15, value = 85, }, --魔法攻击大
	                    {type = 29, value = 10, }, --准确
						{type = 31, value = 10, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 336, }, --道术攻击小
	                    {type = 19, value = 85, }, --道术攻击大
	                    {type = 29, value = 10, }, --准确
						{type = 31, value = 10, }, --闪避
	                },
	            },
	        },
			-- 4 级
			{
				lingli = 1600, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 480, }, --物理攻击小
	                    {type = 11, value = 120, }, --物理攻击大
	                    {type = 29, value = 15, }, --准确
						{type = 31, value = 15, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 480, }, --魔法攻击小
	                    {type = 15, value = 120, }, --魔法攻击大
	                    {type = 29, value = 15, }, --准确
						{type = 31, value = 15, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 480, }, --道术攻击小
	                    {type = 19, value = 120, }, --道术攻击大
	                    {type = 29, value = 15, }, --准确
						{type = 31, value = 15, }, --闪避
	                },
	            },
	        },
			-- 5 级
			{
				lingli = 3200, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 650, }, --物理攻击小
	                    {type = 11, value = 163, }, --物理攻击大
	                    {type = 29, value = 21, }, --准确
						{type = 31, value = 21, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 650, }, --魔法攻击小
	                    {type = 15, value = 163, }, --魔法攻击大
	                    {type = 29, value = 21, }, --准确
						{type = 31, value = 21, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 650, }, --道术攻击小
	                    {type = 19, value = 163, }, --道术攻击大
	                    {type = 29, value = 21, }, --准确
						{type = 31, value = 21, }, --闪避
	                },
	            },
	        },
			-- 6 级
			{
				lingli = 4500, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 840, }, --物理攻击小
	                    {type = 11, value = 210, }, --物理攻击大
	                    {type = 29, value = 28, }, --准确
						{type = 31, value = 28, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 840, }, --魔法攻击小
	                    {type = 15, value = 210, }, --魔法攻击大
	                    {type = 29, value = 28, }, --准确
						{type = 31, value = 28, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 840, }, --道术攻击小
	                    {type = 19, value = 210, }, --道术攻击大
	                    {type = 29, value = 28, }, --准确
						{type = 31, value = 28, }, --闪避
	                },
	            },
	        },
			-- 7 级
			{
				lingli = 9000, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 1056, }, --物理攻击小
	                    {type = 11, value = 300, }, --物理攻击大
	                    {type = 29, value = 38, }, --准确
						{type = 31, value = 38, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 1056, }, --魔法攻击小
	                    {type = 15, value = 300, }, --魔法攻击大
	                    {type = 29, value = 38, }, --准确
						{type = 31, value = 38, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 1056, }, --道术攻击小
	                    {type = 19, value = 300, }, --道术攻击大
	                    {type = 29, value = 38, }, --准确
						{type = 31, value = 38, }, --闪避
	                },
	            },
	        },
			-- 8 级
			{
				lingli = 18500, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 1296, }, --物理攻击小
	                    {type = 11, value = 423, }, --物理攻击大
	                    {type = 29, value = 50, }, --准确
						{type = 31, value = 50, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 1296, }, --魔法攻击小
	                    {type = 15, value = 423, }, --魔法攻击大
	                    {type = 29, value = 50, }, --准确
						{type = 31, value = 50, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 1296, }, --道术攻击小
	                    {type = 19, value = 423, }, --道术攻击大
	                    {type = 29, value = 50, }, --准确
						{type = 31, value = 50, }, --闪避
	                },
	            },
	        },
			-- 9 级
			{
				lingli = 28500, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 1560, }, --物理攻击小
	                    {type = 11, value = 582, }, --物理攻击大
	                    {type = 29, value = 65, }, --准确
						{type = 31, value = 65, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 1560, }, --魔法攻击小
	                    {type = 15, value = 582, }, --魔法攻击大
	                    {type = 29, value = 65, }, --准确
						{type = 31, value = 65, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 1560, }, --道术攻击小
	                    {type = 19, value = 582, }, --道术攻击大
	                    {type = 29, value = 65, }, --准确
						{type = 31, value = 65, }, --闪避
	                },
	            },
	        },
			-- 10 级
			{
				lingli = 39800, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 1850, }, --物理攻击小
	                    {type = 11, value = 762, }, --物理攻击大
	                    {type = 29, value = 80, }, --准确
						{type = 31, value = 80, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 1850, }, --魔法攻击小
	                    {type = 15, value = 762, }, --魔法攻击大
	                    {type = 29, value = 80, }, --准确
						{type = 31, value = 80, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 1850, }, --道术攻击小
	                    {type = 19, value = 762, }, --道术攻击大
	                    {type = 29, value = 80, }, --准确
						{type = 31, value = 80, }, --闪避
	                },
	            },
	        },
			-- 11 级
			{
				lingli = 52000, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 2160, }, --物理攻击小
	                    {type = 11, value = 965, }, --物理攻击大
	                    {type = 29, value = 95, }, --准确
						{type = 31, value = 95, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 2160, }, --魔法攻击小
	                    {type = 15, value = 965, }, --魔法攻击大
	                    {type = 29, value = 95, }, --准确
						{type = 31, value = 95, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 2160, }, --道术攻击小
	                    {type = 19, value = 965, }, --道术攻击大
	                    {type = 29, value = 95, }, --准确
						{type = 31, value = 95, }, --闪避
	                },
	            },
	        },
			-- 12 级
			{
				lingli = 68000, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 2500, }, --物理攻击小
	                    {type = 11, value = 1198, }, --物理攻击大
	                    {type = 29, value = 110, }, --准确
						{type = 31, value = 110, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 2500, }, --魔法攻击小
	                    {type = 15, value = 1198, }, --魔法攻击大
	                    {type = 29, value = 110, }, --准确
						{type = 31, value = 110, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 2500, }, --道术攻击小
	                    {type = 19, value = 1198, }, --道术攻击大
	                    {type = 29, value = 110, }, --准确
						{type = 31, value = 110, }, --闪避
	                },
	            },
	        },


		},
		
		-- 左戒指
		{
						-- 1 级
			{
				lingli = 200, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 120, }, --物理攻击小
	                    {type = 11, value = 30, }, --物理攻击大
	                    {type = 29, value = 3, }, --准确
						{type = 31, value = 3, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 120, }, --魔法攻击小
	                    {type = 15, value = 30, }, --魔法攻击大
	                    {type = 29, value = 3, }, --准确
						{type = 31, value = 3, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 120, }, --道术攻击小
	                    {type = 19, value = 30, }, --道术攻击大
	                    {type = 29, value = 3, }, --准确
						{type = 31, value = 3, }, --闪避
	                },
	            },
	        },
			-- 2 级
			{
				lingli = 400, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 216, }, --物理攻击小
	                    {type = 11, value = 55, }, --物理攻击大
	                    {type = 29, value = 6, }, --准确
						{type = 31, value = 6, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 216, }, --魔法攻击小
	                    {type = 15, value = 55, }, --魔法攻击大
	                    {type = 29, value = 6, }, --准确
						{type = 31, value = 6, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 216, }, --道术攻击小
	                    {type = 19, value = 55, }, --道术攻击大
	                    {type = 29, value = 6, }, --准确
						{type = 31, value = 6, }, --闪避
	                },
	            },
	        },
			-- 3 级
			{
				lingli = 800, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 336, }, --物理攻击小
	                    {type = 11, value = 85, }, --物理攻击大
	                    {type = 29, value = 10, }, --准确
						{type = 31, value = 10, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 336, }, --魔法攻击小
	                    {type = 15, value = 85, }, --魔法攻击大
	                    {type = 29, value = 10, }, --准确
						{type = 31, value = 10, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 336, }, --道术攻击小
	                    {type = 19, value = 85, }, --道术攻击大
	                    {type = 29, value = 10, }, --准确
						{type = 31, value = 10, }, --闪避
	                },
	            },
	        },
			-- 4 级
			{
				lingli = 1600, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 480, }, --物理攻击小
	                    {type = 11, value = 120, }, --物理攻击大
	                    {type = 29, value = 15, }, --准确
						{type = 31, value = 15, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 480, }, --魔法攻击小
	                    {type = 15, value = 120, }, --魔法攻击大
	                    {type = 29, value = 15, }, --准确
						{type = 31, value = 15, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 480, }, --道术攻击小
	                    {type = 19, value = 120, }, --道术攻击大
	                    {type = 29, value = 15, }, --准确
						{type = 31, value = 15, }, --闪避
	                },
	            },
	        },
			-- 5 级
			{
				lingli = 3200, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 650, }, --物理攻击小
	                    {type = 11, value = 163, }, --物理攻击大
	                    {type = 29, value = 21, }, --准确
						{type = 31, value = 21, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 650, }, --魔法攻击小
	                    {type = 15, value = 163, }, --魔法攻击大
	                    {type = 29, value = 21, }, --准确
						{type = 31, value = 21, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 650, }, --道术攻击小
	                    {type = 19, value = 163, }, --道术攻击大
	                    {type = 29, value = 21, }, --准确
						{type = 31, value = 21, }, --闪避
	                },
	            },
	        },
			-- 6 级
			{
				lingli = 4500, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 840, }, --物理攻击小
	                    {type = 11, value = 210, }, --物理攻击大
	                    {type = 29, value = 28, }, --准确
						{type = 31, value = 28, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 840, }, --魔法攻击小
	                    {type = 15, value = 210, }, --魔法攻击大
	                    {type = 29, value = 28, }, --准确
						{type = 31, value = 28, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 840, }, --道术攻击小
	                    {type = 19, value = 210, }, --道术攻击大
	                    {type = 29, value = 28, }, --准确
						{type = 31, value = 28, }, --闪避
	                },
	            },
	        },
			-- 7 级
			{
				lingli = 9000, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 1056, }, --物理攻击小
	                    {type = 11, value = 300, }, --物理攻击大
	                    {type = 29, value = 38, }, --准确
						{type = 31, value = 38, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 1056, }, --魔法攻击小
	                    {type = 15, value = 300, }, --魔法攻击大
	                    {type = 29, value = 38, }, --准确
						{type = 31, value = 38, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 1056, }, --道术攻击小
	                    {type = 19, value = 300, }, --道术攻击大
	                    {type = 29, value = 38, }, --准确
						{type = 31, value = 38, }, --闪避
	                },
	            },
	        },
			-- 8 级
			{
				lingli = 18500, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 1296, }, --物理攻击小
	                    {type = 11, value = 423, }, --物理攻击大
	                    {type = 29, value = 50, }, --准确
						{type = 31, value = 50, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 1296, }, --魔法攻击小
	                    {type = 15, value = 423, }, --魔法攻击大
	                    {type = 29, value = 50, }, --准确
						{type = 31, value = 50, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 1296, }, --道术攻击小
	                    {type = 19, value = 423, }, --道术攻击大
	                    {type = 29, value = 50, }, --准确
						{type = 31, value = 50, }, --闪避
	                },
	            },
	        },
			-- 9 级
			{
				lingli = 28500, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 1560, }, --物理攻击小
	                    {type = 11, value = 582, }, --物理攻击大
	                    {type = 29, value = 65, }, --准确
						{type = 31, value = 65, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 1560, }, --魔法攻击小
	                    {type = 15, value = 582, }, --魔法攻击大
	                    {type = 29, value = 65, }, --准确
						{type = 31, value = 65, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 1560, }, --道术攻击小
	                    {type = 19, value = 582, }, --道术攻击大
	                    {type = 29, value = 65, }, --准确
						{type = 31, value = 65, }, --闪避
	                },
	            },
	        },
			-- 10 级
			{
				lingli = 39800, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 1850, }, --物理攻击小
	                    {type = 11, value = 762, }, --物理攻击大
	                    {type = 29, value = 80, }, --准确
						{type = 31, value = 80, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 1850, }, --魔法攻击小
	                    {type = 15, value = 762, }, --魔法攻击大
	                    {type = 29, value = 80, }, --准确
						{type = 31, value = 80, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 1850, }, --道术攻击小
	                    {type = 19, value = 762, }, --道术攻击大
	                    {type = 29, value = 80, }, --准确
						{type = 31, value = 80, }, --闪避
	                },
	            },
	        },
			-- 11 级
			{
				lingli = 52000, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 2160, }, --物理攻击小
	                    {type = 11, value = 965, }, --物理攻击大
	                    {type = 29, value = 95, }, --准确
						{type = 31, value = 95, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 2160, }, --魔法攻击小
	                    {type = 15, value = 965, }, --魔法攻击大
	                    {type = 29, value = 95, }, --准确
						{type = 31, value = 95, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 2160, }, --道术攻击小
	                    {type = 19, value = 965, }, --道术攻击大
	                    {type = 29, value = 95, }, --准确
						{type = 31, value = 95, }, --闪避
	                },
	            },
	        },
			-- 12 级
			{
				lingli = 68000, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 2500, }, --物理攻击小
	                    {type = 11, value = 1198, }, --物理攻击大
	                    {type = 29, value = 110, }, --准确
						{type = 31, value = 110, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 2500, }, --魔法攻击小
	                    {type = 15, value = 1198, }, --魔法攻击大
	                    {type = 29, value = 110, }, --准确
						{type = 31, value = 110, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 2500, }, --道术攻击小
	                    {type = 19, value = 1198, }, --道术攻击大
	                    {type = 29, value = 110, }, --准确
						{type = 31, value = 110, }, --闪避
	                },
	            },
	        },

		},
		
		-- 右戒指
		{
						-- 1 级
			{
				lingli = 200, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 120, }, --物理攻击小
	                    {type = 11, value = 30, }, --物理攻击大
	                    {type = 29, value = 3, }, --准确
						{type = 31, value = 3, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 120, }, --魔法攻击小
	                    {type = 15, value = 30, }, --魔法攻击大
	                    {type = 29, value = 3, }, --准确
						{type = 31, value = 3, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 120, }, --道术攻击小
	                    {type = 19, value = 30, }, --道术攻击大
	                    {type = 29, value = 3, }, --准确
						{type = 31, value = 3, }, --闪避
	                },
	            },
	        },
			-- 2 级
			{
				lingli = 400, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 216, }, --物理攻击小
	                    {type = 11, value = 55, }, --物理攻击大
	                    {type = 29, value = 6, }, --准确
						{type = 31, value = 6, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 216, }, --魔法攻击小
	                    {type = 15, value = 55, }, --魔法攻击大
	                    {type = 29, value = 6, }, --准确
						{type = 31, value = 6, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 216, }, --道术攻击小
	                    {type = 19, value = 55, }, --道术攻击大
	                    {type = 29, value = 6, }, --准确
						{type = 31, value = 6, }, --闪避
	                },
	            },
	        },
			-- 3 级
			{
				lingli = 800, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 336, }, --物理攻击小
	                    {type = 11, value = 85, }, --物理攻击大
	                    {type = 29, value = 10, }, --准确
						{type = 31, value = 10, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 336, }, --魔法攻击小
	                    {type = 15, value = 85, }, --魔法攻击大
	                    {type = 29, value = 10, }, --准确
						{type = 31, value = 10, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 336, }, --道术攻击小
	                    {type = 19, value = 85, }, --道术攻击大
	                    {type = 29, value = 10, }, --准确
						{type = 31, value = 10, }, --闪避
	                },
	            },
	        },
			-- 4 级
			{
				lingli = 1600, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 480, }, --物理攻击小
	                    {type = 11, value = 120, }, --物理攻击大
	                    {type = 29, value = 15, }, --准确
						{type = 31, value = 15, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 480, }, --魔法攻击小
	                    {type = 15, value = 120, }, --魔法攻击大
	                    {type = 29, value = 15, }, --准确
						{type = 31, value = 15, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 480, }, --道术攻击小
	                    {type = 19, value = 120, }, --道术攻击大
	                    {type = 29, value = 15, }, --准确
						{type = 31, value = 15, }, --闪避
	                },
	            },
	        },
			-- 5 级
			{
				lingli = 3200, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 650, }, --物理攻击小
	                    {type = 11, value = 163, }, --物理攻击大
	                    {type = 29, value = 21, }, --准确
						{type = 31, value = 21, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 650, }, --魔法攻击小
	                    {type = 15, value = 163, }, --魔法攻击大
	                    {type = 29, value = 21, }, --准确
						{type = 31, value = 21, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 650, }, --道术攻击小
	                    {type = 19, value = 163, }, --道术攻击大
	                    {type = 29, value = 21, }, --准确
						{type = 31, value = 21, }, --闪避
	                },
	            },
	        },
			-- 6 级
			{
				lingli = 4500, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 840, }, --物理攻击小
	                    {type = 11, value = 210, }, --物理攻击大
	                    {type = 29, value = 28, }, --准确
						{type = 31, value = 28, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 840, }, --魔法攻击小
	                    {type = 15, value = 210, }, --魔法攻击大
	                    {type = 29, value = 28, }, --准确
						{type = 31, value = 28, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 840, }, --道术攻击小
	                    {type = 19, value = 210, }, --道术攻击大
	                    {type = 29, value = 28, }, --准确
						{type = 31, value = 28, }, --闪避
	                },
	            },
	        },
			-- 7 级
			{
				lingli = 9000, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 1056, }, --物理攻击小
	                    {type = 11, value = 300, }, --物理攻击大
	                    {type = 29, value = 38, }, --准确
						{type = 31, value = 38, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 1056, }, --魔法攻击小
	                    {type = 15, value = 300, }, --魔法攻击大
	                    {type = 29, value = 38, }, --准确
						{type = 31, value = 38, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 1056, }, --道术攻击小
	                    {type = 19, value = 300, }, --道术攻击大
	                    {type = 29, value = 38, }, --准确
						{type = 31, value = 38, }, --闪避
	                },
	            },
	        },
			-- 8 级
			{
				lingli = 18500, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 1296, }, --物理攻击小
	                    {type = 11, value = 423, }, --物理攻击大
	                    {type = 29, value = 50, }, --准确
						{type = 31, value = 50, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 1296, }, --魔法攻击小
	                    {type = 15, value = 423, }, --魔法攻击大
	                    {type = 29, value = 50, }, --准确
						{type = 31, value = 50, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 1296, }, --道术攻击小
	                    {type = 19, value = 423, }, --道术攻击大
	                    {type = 29, value = 50, }, --准确
						{type = 31, value = 50, }, --闪避
	                },
	            },
	        },
			-- 9 级
			{
				lingli = 28500, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 1560, }, --物理攻击小
	                    {type = 11, value = 582, }, --物理攻击大
	                    {type = 29, value = 65, }, --准确
						{type = 31, value = 65, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 1560, }, --魔法攻击小
	                    {type = 15, value = 582, }, --魔法攻击大
	                    {type = 29, value = 65, }, --准确
						{type = 31, value = 65, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 1560, }, --道术攻击小
	                    {type = 19, value = 582, }, --道术攻击大
	                    {type = 29, value = 65, }, --准确
						{type = 31, value = 65, }, --闪避
	                },
	            },
	        },
			-- 10 级
			{
				lingli = 39800, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 1850, }, --物理攻击小
	                    {type = 11, value = 762, }, --物理攻击大
	                    {type = 29, value = 80, }, --准确
						{type = 31, value = 80, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 1850, }, --魔法攻击小
	                    {type = 15, value = 762, }, --魔法攻击大
	                    {type = 29, value = 80, }, --准确
						{type = 31, value = 80, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 1850, }, --道术攻击小
	                    {type = 19, value = 762, }, --道术攻击大
	                    {type = 29, value = 80, }, --准确
						{type = 31, value = 80, }, --闪避
	                },
	            },
	        },
			-- 11 级
			{
				lingli = 52000, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 2160, }, --物理攻击小
	                    {type = 11, value = 965, }, --物理攻击大
	                    {type = 29, value = 95, }, --准确
						{type = 31, value = 95, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 2160, }, --魔法攻击小
	                    {type = 15, value = 965, }, --魔法攻击大
	                    {type = 29, value = 95, }, --准确
						{type = 31, value = 95, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 2160, }, --道术攻击小
	                    {type = 19, value = 965, }, --道术攻击大
	                    {type = 29, value = 95, }, --准确
						{type = 31, value = 95, }, --闪避
	                },
	            },
	        },
			-- 12 级
			{
				lingli = 68000, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 2500, }, --物理攻击小
	                    {type = 11, value = 1198, }, --物理攻击大
	                    {type = 29, value = 110, }, --准确
						{type = 31, value = 110, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 2500, }, --魔法攻击小
	                    {type = 15, value = 1198, }, --魔法攻击大
	                    {type = 29, value = 110, }, --准确
						{type = 31, value = 110, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 2500, }, --道术攻击小
	                    {type = 19, value = 1198, }, --道术攻击大
	                    {type = 29, value = 110, }, --准确
						{type = 31, value = 110, }, --闪避
	                },
	            },
	        },


		},
		
		-- 腰带
		{
						-- 1 级
			{
				lingli = 200, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 120, }, --物理攻击小
	                    {type = 11, value = 30, }, --物理攻击大
	                    {type = 29, value = 3, }, --准确
						{type = 31, value = 3, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 120, }, --魔法攻击小
	                    {type = 15, value = 30, }, --魔法攻击大
	                    {type = 29, value = 3, }, --准确
						{type = 31, value = 3, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 120, }, --道术攻击小
	                    {type = 19, value = 30, }, --道术攻击大
	                    {type = 29, value = 3, }, --准确
						{type = 31, value = 3, }, --闪避
	                },
	            },
	        },
			-- 2 级
			{
				lingli = 400, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 216, }, --物理攻击小
	                    {type = 11, value = 55, }, --物理攻击大
	                    {type = 29, value = 6, }, --准确
						{type = 31, value = 6, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 216, }, --魔法攻击小
	                    {type = 15, value = 55, }, --魔法攻击大
	                    {type = 29, value = 6, }, --准确
						{type = 31, value = 6, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 216, }, --道术攻击小
	                    {type = 19, value = 55, }, --道术攻击大
	                    {type = 29, value = 6, }, --准确
						{type = 31, value = 6, }, --闪避
	                },
	            },
	        },
			-- 3 级
			{
				lingli = 800, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 336, }, --物理攻击小
	                    {type = 11, value = 85, }, --物理攻击大
	                    {type = 29, value = 10, }, --准确
						{type = 31, value = 10, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 336, }, --魔法攻击小
	                    {type = 15, value = 85, }, --魔法攻击大
	                    {type = 29, value = 10, }, --准确
						{type = 31, value = 10, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 336, }, --道术攻击小
	                    {type = 19, value = 85, }, --道术攻击大
	                    {type = 29, value = 10, }, --准确
						{type = 31, value = 10, }, --闪避
	                },
	            },
	        },
			-- 4 级
			{
				lingli = 1600, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 480, }, --物理攻击小
	                    {type = 11, value = 120, }, --物理攻击大
	                    {type = 29, value = 15, }, --准确
						{type = 31, value = 15, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 480, }, --魔法攻击小
	                    {type = 15, value = 120, }, --魔法攻击大
	                    {type = 29, value = 15, }, --准确
						{type = 31, value = 15, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 480, }, --道术攻击小
	                    {type = 19, value = 120, }, --道术攻击大
	                    {type = 29, value = 15, }, --准确
						{type = 31, value = 15, }, --闪避
	                },
	            },
	        },
			-- 5 级
			{
				lingli = 3200, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 650, }, --物理攻击小
	                    {type = 11, value = 163, }, --物理攻击大
	                    {type = 29, value = 21, }, --准确
						{type = 31, value = 21, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 650, }, --魔法攻击小
	                    {type = 15, value = 163, }, --魔法攻击大
	                    {type = 29, value = 21, }, --准确
						{type = 31, value = 21, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 650, }, --道术攻击小
	                    {type = 19, value = 163, }, --道术攻击大
	                    {type = 29, value = 21, }, --准确
						{type = 31, value = 21, }, --闪避
	                },
	            },
	        },
			-- 6 级
			{
				lingli = 4500, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 840, }, --物理攻击小
	                    {type = 11, value = 210, }, --物理攻击大
	                    {type = 29, value = 28, }, --准确
						{type = 31, value = 28, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 840, }, --魔法攻击小
	                    {type = 15, value = 210, }, --魔法攻击大
	                    {type = 29, value = 28, }, --准确
						{type = 31, value = 28, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 840, }, --道术攻击小
	                    {type = 19, value = 210, }, --道术攻击大
	                    {type = 29, value = 28, }, --准确
						{type = 31, value = 28, }, --闪避
	                },
	            },
	        },
			-- 7 级
			{
				lingli = 9000, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 1056, }, --物理攻击小
	                    {type = 11, value = 300, }, --物理攻击大
	                    {type = 29, value = 38, }, --准确
						{type = 31, value = 38, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 1056, }, --魔法攻击小
	                    {type = 15, value = 300, }, --魔法攻击大
	                    {type = 29, value = 38, }, --准确
						{type = 31, value = 38, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 1056, }, --道术攻击小
	                    {type = 19, value = 300, }, --道术攻击大
	                    {type = 29, value = 38, }, --准确
						{type = 31, value = 38, }, --闪避
	                },
	            },
	        },
			-- 8 级
			{
				lingli = 18500, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 1296, }, --物理攻击小
	                    {type = 11, value = 423, }, --物理攻击大
	                    {type = 29, value = 50, }, --准确
						{type = 31, value = 50, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 1296, }, --魔法攻击小
	                    {type = 15, value = 423, }, --魔法攻击大
	                    {type = 29, value = 50, }, --准确
						{type = 31, value = 50, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 1296, }, --道术攻击小
	                    {type = 19, value = 423, }, --道术攻击大
	                    {type = 29, value = 50, }, --准确
						{type = 31, value = 50, }, --闪避
	                },
	            },
	        },
			-- 9 级
			{
				lingli = 28500, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 1560, }, --物理攻击小
	                    {type = 11, value = 582, }, --物理攻击大
	                    {type = 29, value = 65, }, --准确
						{type = 31, value = 65, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 1560, }, --魔法攻击小
	                    {type = 15, value = 582, }, --魔法攻击大
	                    {type = 29, value = 65, }, --准确
						{type = 31, value = 65, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 1560, }, --道术攻击小
	                    {type = 19, value = 582, }, --道术攻击大
	                    {type = 29, value = 65, }, --准确
						{type = 31, value = 65, }, --闪避
	                },
	            },
	        },
			-- 10 级
			{
				lingli = 39800, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 1850, }, --物理攻击小
	                    {type = 11, value = 762, }, --物理攻击大
	                    {type = 29, value = 80, }, --准确
						{type = 31, value = 80, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 1850, }, --魔法攻击小
	                    {type = 15, value = 762, }, --魔法攻击大
	                    {type = 29, value = 80, }, --准确
						{type = 31, value = 80, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 1850, }, --道术攻击小
	                    {type = 19, value = 762, }, --道术攻击大
	                    {type = 29, value = 80, }, --准确
						{type = 31, value = 80, }, --闪避
	                },
	            },
	        },
			-- 11 级
			{
				lingli = 52000, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 2160, }, --物理攻击小
	                    {type = 11, value = 965, }, --物理攻击大
	                    {type = 29, value = 95, }, --准确
						{type = 31, value = 95, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 2160, }, --魔法攻击小
	                    {type = 15, value = 965, }, --魔法攻击大
	                    {type = 29, value = 95, }, --准确
						{type = 31, value = 95, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 2160, }, --道术攻击小
	                    {type = 19, value = 965, }, --道术攻击大
	                    {type = 29, value = 95, }, --准确
						{type = 31, value = 95, }, --闪避
	                },
	            },
	        },
			-- 12 级
			{
				lingli = 68000, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 2500, }, --物理攻击小
	                    {type = 11, value = 1198, }, --物理攻击大
	                    {type = 29, value = 110, }, --准确
						{type = 31, value = 110, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 2500, }, --魔法攻击小
	                    {type = 15, value = 1198, }, --魔法攻击大
	                    {type = 29, value = 110, }, --准确
						{type = 31, value = 110, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 2500, }, --道术攻击小
	                    {type = 19, value = 1198, }, --道术攻击大
	                    {type = 29, value = 110, }, --准确
						{type = 31, value = 110, }, --闪避
	                },
	            },
	        },


		},
		
		-- 靴子
		{
						-- 1 级
			{
				lingli = 200, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 120, }, --物理攻击小
	                    {type = 11, value = 30, }, --物理攻击大
	                    {type = 29, value = 3, }, --准确
						{type = 31, value = 3, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 120, }, --魔法攻击小
	                    {type = 15, value = 30, }, --魔法攻击大
	                    {type = 29, value = 3, }, --准确
						{type = 31, value = 3, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 120, }, --道术攻击小
	                    {type = 19, value = 30, }, --道术攻击大
	                    {type = 29, value = 3, }, --准确
						{type = 31, value = 3, }, --闪避
	                },
	            },
	        },
			-- 2 级
			{
				lingli = 400, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 216, }, --物理攻击小
	                    {type = 11, value = 55, }, --物理攻击大
	                    {type = 29, value = 6, }, --准确
						{type = 31, value = 6, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 216, }, --魔法攻击小
	                    {type = 15, value = 55, }, --魔法攻击大
	                    {type = 29, value = 6, }, --准确
						{type = 31, value = 6, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 216, }, --道术攻击小
	                    {type = 19, value = 55, }, --道术攻击大
	                    {type = 29, value = 6, }, --准确
						{type = 31, value = 6, }, --闪避
	                },
	            },
	        },
			-- 3 级
			{
				lingli = 800, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 336, }, --物理攻击小
	                    {type = 11, value = 85, }, --物理攻击大
	                    {type = 29, value = 10, }, --准确
						{type = 31, value = 10, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 336, }, --魔法攻击小
	                    {type = 15, value = 85, }, --魔法攻击大
	                    {type = 29, value = 10, }, --准确
						{type = 31, value = 10, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 336, }, --道术攻击小
	                    {type = 19, value = 85, }, --道术攻击大
	                    {type = 29, value = 10, }, --准确
						{type = 31, value = 10, }, --闪避
	                },
	            },
	        },
			-- 4 级
			{
				lingli = 1600, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 480, }, --物理攻击小
	                    {type = 11, value = 120, }, --物理攻击大
	                    {type = 29, value = 15, }, --准确
						{type = 31, value = 15, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 480, }, --魔法攻击小
	                    {type = 15, value = 120, }, --魔法攻击大
	                    {type = 29, value = 15, }, --准确
						{type = 31, value = 15, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 480, }, --道术攻击小
	                    {type = 19, value = 120, }, --道术攻击大
	                    {type = 29, value = 15, }, --准确
						{type = 31, value = 15, }, --闪避
	                },
	            },
	        },
			-- 5 级
			{
				lingli = 3200, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 650, }, --物理攻击小
	                    {type = 11, value = 163, }, --物理攻击大
	                    {type = 29, value = 21, }, --准确
						{type = 31, value = 21, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 650, }, --魔法攻击小
	                    {type = 15, value = 163, }, --魔法攻击大
	                    {type = 29, value = 21, }, --准确
						{type = 31, value = 21, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 650, }, --道术攻击小
	                    {type = 19, value = 163, }, --道术攻击大
	                    {type = 29, value = 21, }, --准确
						{type = 31, value = 21, }, --闪避
	                },
	            },
	        },
			-- 6 级
			{
				lingli = 4500, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 840, }, --物理攻击小
	                    {type = 11, value = 210, }, --物理攻击大
	                    {type = 29, value = 28, }, --准确
						{type = 31, value = 28, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 840, }, --魔法攻击小
	                    {type = 15, value = 210, }, --魔法攻击大
	                    {type = 29, value = 28, }, --准确
						{type = 31, value = 28, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 840, }, --道术攻击小
	                    {type = 19, value = 210, }, --道术攻击大
	                    {type = 29, value = 28, }, --准确
						{type = 31, value = 28, }, --闪避
	                },
	            },
	        },
			-- 7 级
			{
				lingli = 9000, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 1056, }, --物理攻击小
	                    {type = 11, value = 300, }, --物理攻击大
	                    {type = 29, value = 38, }, --准确
						{type = 31, value = 38, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 1056, }, --魔法攻击小
	                    {type = 15, value = 300, }, --魔法攻击大
	                    {type = 29, value = 38, }, --准确
						{type = 31, value = 38, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 1056, }, --道术攻击小
	                    {type = 19, value = 300, }, --道术攻击大
	                    {type = 29, value = 38, }, --准确
						{type = 31, value = 38, }, --闪避
	                },
	            },
	        },
			-- 8 级
			{
				lingli = 18500, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 1296, }, --物理攻击小
	                    {type = 11, value = 423, }, --物理攻击大
	                    {type = 29, value = 50, }, --准确
						{type = 31, value = 50, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 1296, }, --魔法攻击小
	                    {type = 15, value = 423, }, --魔法攻击大
	                    {type = 29, value = 50, }, --准确
						{type = 31, value = 50, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 1296, }, --道术攻击小
	                    {type = 19, value = 423, }, --道术攻击大
	                    {type = 29, value = 50, }, --准确
						{type = 31, value = 50, }, --闪避
	                },
	            },
	        },
			-- 9 级
			{
				lingli = 28500, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 1560, }, --物理攻击小
	                    {type = 11, value = 582, }, --物理攻击大
	                    {type = 29, value = 65, }, --准确
						{type = 31, value = 65, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 1560, }, --魔法攻击小
	                    {type = 15, value = 582, }, --魔法攻击大
	                    {type = 29, value = 65, }, --准确
						{type = 31, value = 65, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 1560, }, --道术攻击小
	                    {type = 19, value = 582, }, --道术攻击大
	                    {type = 29, value = 65, }, --准确
						{type = 31, value = 65, }, --闪避
	                },
	            },
	        },
			-- 10 级
			{
				lingli = 39800, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 1850, }, --物理攻击小
	                    {type = 11, value = 762, }, --物理攻击大
	                    {type = 29, value = 80, }, --准确
						{type = 31, value = 80, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 1850, }, --魔法攻击小
	                    {type = 15, value = 762, }, --魔法攻击大
	                    {type = 29, value = 80, }, --准确
						{type = 31, value = 80, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 1850, }, --道术攻击小
	                    {type = 19, value = 762, }, --道术攻击大
	                    {type = 29, value = 80, }, --准确
						{type = 31, value = 80, }, --闪避
	                },
	            },
	        },
			-- 11 级
			{
				lingli = 52000, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 2160, }, --物理攻击小
	                    {type = 11, value = 965, }, --物理攻击大
	                    {type = 29, value = 95, }, --准确
						{type = 31, value = 95, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 2160, }, --魔法攻击小
	                    {type = 15, value = 965, }, --魔法攻击大
	                    {type = 29, value = 95, }, --准确
						{type = 31, value = 95, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 2160, }, --道术攻击小
	                    {type = 19, value = 965, }, --道术攻击大
	                    {type = 29, value = 95, }, --准确
						{type = 31, value = 95, }, --闪避
	                },
	            },
	        },
			-- 12 级
			{
				lingli = 68000, -- 升到该等级需要的灵力值
				
				attrs = {
					-- 战士
	                {
	                    {type = 9, value = 2500, }, --物理攻击小
	                    {type = 11, value = 1198, }, --物理攻击大
	                    {type = 29, value = 110, }, --准确
						{type = 31, value = 110, }, --闪避
	                },
					-- 法师
	                {
	                    {type = 13, value = 2500, }, --魔法攻击小
	                    {type = 15, value = 1198, }, --魔法攻击大
	                    {type = 29, value = 110, }, --准确
						{type = 31, value = 110, }, --闪避
	                },
					-- 道士
	                {
	                    {type = 17, value = 2500, }, --道术攻击小
	                    {type = 19, value = 1198, }, --道术攻击大
	                    {type = 29, value = 110, }, --准确
						{type = 31, value = 110, }, --闪避
	                },
	            },
	        },

		},
	},
	
	-- 套装配置(当所有槽位都达到该等级时则激活该套装属性)
	suitAttrs = {
		-- 等级从小到大排序
		--  {
		-- level = (a1), -- 达到的等级
			
		-- ---- 套装属性
		-- 	attrs = {
		-- 		-- 
        --         {
        --             {type = (a2), value = (a3), }, --(a4)
        --             {type = (a5), value = (a6), }, --(a7)
        --             {type = (a8), value = (a9), }, --(a10)
		-- 			{type = (a11), value = (a12), }, --(a13)
		-- 			{type = (a14), value = (a15), }, --(a16)
        --         },
		-- 		-- 
        --         {
        --             {type = (a17), value = (a18), }, --(a19)
        --             {type = (a20), value = (a21), }, --(a22)
		-- 			{type = (a23), value = (a24), }, --(a25)
		-- 			{type = (a26), value = (a27), }, --(a28)
		-- 			{type = (a29), value = (a30), }, --(a31)
        --         },
		-- 		-- 
        --         {
        --             {type = (a32), value = (a33), }, --(a34)
		-- 			{type = (a35), value = (a36), }, --(a37)
		-- 			{type = (a38), value = (a39), }, --(a40)
		-- 			{type = (a41), value = (a42), }, --(a43)
		-- 			{type = (a44), value = (a45), }, --(a46)
        --         },
        --     },			
		-- },
		{
		level = 3, -- 达到的等级
			
		---- 套装属性
			attrs = {
				-- 
                {
                    {type = 5, value = 3000, }, --战士HP
                    {type = 9, value = 100, }, --物理攻击
                    {type = 11, value = 100, }, --物理攻击
					{type = 128, value = 100, }, --暴击几率
					{type = 129, value = 1500, }, --暴击值
                },
				-- 
                {
                    {type = 5, value = 1800, }, --法师HP
                    {type = 13, value = 100, }, --魔法攻击
					{type = 15, value = 100, }, --魔法攻击
					{type = 128, value = 100, }, --暴击几率
					{type = 129, value = 1500, }, --暴击值
                },
				-- 
                {
                    {type = 5, value = 2400, }, --道士HP
					{type = 17, value = 100, }, --道术攻击
					{type = 19, value = 100, }, --道术攻击
					{type = 128, value = 100, }, --暴击几率
					{type = 129, value = 1500, }, --暴击值
                },
            },			
		},
		
 {
		level = 6, -- 达到的等级
			
		---- 套装属性
			attrs = {
				-- 
                {
                    {type = 5, value = 9000, }, --战士HP
                    {type = 9, value = 285, }, --物理攻击
                    {type = 11, value = 285, }, --物理攻击
					{type = 128, value = 200, }, --暴击几率
					{type = 129, value = 5000, }, --暴击值
                },
				-- 
                {
                    {type = 5, value = 5400, }, --法师HP
                    {type = 13, value = 285, }, --魔法攻击
					{type = 15, value = 285, }, --魔法攻击
					{type = 128, value = 200, }, --暴击几率
					{type = 129, value = 5000, }, --暴击值
                },
				-- 
                {
                    {type = 5, value = 7200, }, --道士HP
					{type = 17, value = 285, }, --道术攻击
					{type = 19, value = 285, }, --道术攻击
					{type = 128, value = 200, }, --暴击几率
					{type = 129, value = 5000, }, --暴击值
                },
            },			
		},
 {
		level = 9, -- 达到的等级
			
		---- 套装属性
			attrs = {
				-- 
                {
                    {type = 5, value = 15000, }, --战士HP
                    {type = 9, value = 580, }, --物理攻击
                    {type = 11, value = 580, }, --物理攻击
					{type = 128, value = 300, }, --暴击几率
					{type = 129, value = 10500, }, --暴击值
                },
				-- 
                {
                    {type = 5, value = 9000, }, --法师HP
                    {type = 13, value = 580, }, --魔法攻击
					{type = 15, value = 580, }, --魔法攻击
					{type = 128, value = 300, }, --暴击几率
					{type = 129, value = 10500, }, --暴击值
                },
				-- 
                {
                    {type = 5, value = 12000, }, --道士HP
					{type = 17, value = 580, }, --道术攻击
					{type = 19, value = 580, }, --道术攻击
					{type = 128, value = 300, }, --暴击几率
					{type = 129, value = 10500, }, --暴击值
                },
            },			
		},
 {
		level = 12, -- 达到的等级
			
		---- 套装属性
			attrs = {
				-- 
                {
                    {type = 5, value = 25000, }, --战士HP
                    {type = 9, value = 980, }, --物理攻击
                    {type = 11, value = 980, }, --物理攻击
					{type = 128, value = 500, }, --暴击几率
					{type = 129, value = 20000, }, --暴击值
                },
				-- 
                {
                    {type = 5, value = 15000, }, --法师HP
                    {type = 13, value = 980, }, --魔法攻击
					{type = 15, value = 980, }, --魔法攻击
					{type = 128, value = 500, }, --暴击几率
					{type = 129, value = 20000, }, --暴击值
                },
				-- 
                {
                    {type = 5, value = 20000, }, --道士HP
					{type = 17, value = 980, }, --道术攻击
					{type = 19, value = 980, }, --道术攻击
					{type = 128, value = 500, }, --暴击几率
					{type = 129, value = 20000, }, --暴击值
                },
            },			
		},

	},
}