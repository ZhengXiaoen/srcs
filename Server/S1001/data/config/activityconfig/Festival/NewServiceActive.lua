--[[File:NewServiceActive.lua]]

--#include "..\..\..\language\LangCode.txt" once

NewServiceActive = {
	--开服新活动界面配置	
	UiName = Lang.Activity.new01,				--主界面标题		
	--选项配置
	options = {
		{
			optionName = Lang.Activity.new02,    --选项名字			(冲级晋级)
			desc = Lang.Activity.new0001,			--活动描述	   （活动时间。。。。。。。。。）
			explanation = Lang.Activity.new0002,    --活动说明 （如何快速升级？ 1，，，2，）
			title = "",                             --说明的标题
			listName = Lang.Activity.new0009, -- 角色等级,剩余名额,奖励物品 
			actList = {
				{					

					optionName = Lang.Activity.new0013,    -- [3转]70
					initialCount = 1,      --0/1 初始值
					totalCount = 8,     -- 100, 总的值
					level = 70,         -- 等级
					circle = 3,         -- 转
					point = 0,          --魂石分数
					awards = {
						{type = 0, id = 644,count = 1,quality = 0, strong = 0, bind = 0},
						{type = 0, id = 794,count = 1,quality = 0, strong = 0, bind = 0,},
						{type = 0, id = 784,count = 1,quality = 0, strong = 0, bind = 0,},						
						{type = 0, id = 785,count = 1,quality = 0, strong = 0, bind = 0,},						

					},
				},

				{						
					optionName = Lang.Activity.new0014,    -- [2转]60
					level = 60,         -- 等级
					circle = 2,         -- 转
					point = 0,          --魂石分数
					initialCount = 5,      --0/1 初始值
					totalCount = 16,     -- 100, 总的值
					awards = {
						{type = 0, id = 644,count = 1,quality = 0, strong = 0, bind = 0},
						{type = 0, id = 794,count = 1,quality = 0, strong = 0, bind = 0,},							
						{type = 0, id = 795,count = 1,quality = 0, strong = 0, bind = 0,},							

					},
				},

				{						
					optionName = Lang.Activity.new0015,    -- [1转]50
					level = 50,         -- 等级
					circle = 1,         -- 转
					point = 0,          --魂石分数
					initialCount = 10,      --0/1 初始值
					totalCount = 32,     -- 100, 总的值
					awards = {
						{type = 0, id = 644,count = 1,quality = 0, strong = 0, bind = 0},
						{type = 0, id = 794,count = 1,quality = 0, strong = 0, bind = 0,},							

					},
				},

				{						
					optionName = Lang.Activity.new0016,    -- 70
					level = 70,         -- 等级
					circle = 0,         -- 3转
					point = 0,          --魂石分数
					initialCount = 15,      --0/1 初始值
					totalCount = 64,     -- 100, 总的值
					awards = {
						{type = 0, id = 644,count = 1,quality = 0, strong = 0, bind = 0},
						--{type = 0, id = 794,count = 1,quality = 0, strong = 0, bind = 0,},							

					},
				},

				{						
					optionName = Lang.Activity.new0017,    -- 60
					level = 60,         -- 等级
					circle = 0,         -- 转
					point = 0,          --魂石分数
					initialCount = 20,      --0/1 初始值
					totalCount = 128,     -- 100, 总的值
					awards = {
						{type = 0, id = 644,count = 1,quality = 0, strong = 0, bind = 0},
						--{type = 0, id = 794,count = 1,quality = 0, strong = 0, bind = 0,},							

					},
				},

			},
		},

		{
			optionName = Lang.Activity.new03,    --选项名字			(坐骑晋级)
			desc = Lang.Activity.new0003,			--活动描述	   （活动时间。。。。。。。。。）
			explanation = Lang.Activity.new0004,    --活动说明 （如何快速升级？ 1，，，2，）
			title = "",                             --说明的标题
			listName = Lang.Activity.new0010, -- 角色等级,剩余名额,奖励物品 
			actList = {
				{					

					optionName = Lang.Activity.new0013,    -- [3转]70
					initialCount = 1,      --0/1 初始值
					totalCount = 8,     -- 100, 总的值
					level = 81,         -- 等级
					circle = 0,         -- 转
					point = 0,          --魂石分数
					awards = {
						{type = 0, id = 644,count = 1,quality = 0, strong = 0, bind = 0},
						{type = 0, id = 794,count = 1,quality = 0, strong = 0, bind = 0,},
						{type = 0, id = 784,count = 1,quality = 0, strong = 0, bind = 0,},						
						{type = 0, id = 785,count = 1,quality = 0, strong = 0, bind = 0,},						

					},
				},

				{						
					optionName = Lang.Activity.new0014,    -- [2转]60
					level = 71,         -- 等级
					circle = 0,         -- 转
					point = 0,          --魂石分数
					initialCount = 5,      --0/1 初始值
					totalCount = 16,     -- 100, 总的值
					awards = {
						{type = 0, id = 644,count = 1,quality = 0, strong = 0, bind = 0},
						{type = 0, id = 794,count = 1,quality = 0, strong = 0, bind = 0,},							
						{type = 0, id = 795,count = 1,quality = 0, strong = 0, bind = 0,},							

					},
				},

				{						
					optionName = Lang.Activity.new0015,    -- [1转]50
					level = 61,         -- 等级
					circle = 0,         -- 转
					point = 0,          --魂石分数
					initialCount = 10,      --0/1 初始值
					totalCount = 32,     -- 100, 总的值
					awards = {
						{type = 0, id = 644,count = 1,quality = 0, strong = 0, bind = 0},
						{type = 0, id = 794,count = 1,quality = 0, strong = 0, bind = 0,},							

					},
				},

				{						
					optionName = Lang.Activity.new0016,    -- 70
					level = 51,         -- 等级
					circle = 0,         -- 3转
					point = 0,          --魂石分数
					initialCount = 15,      --0/1 初始值
					totalCount = 64,     -- 100, 总的值
					awards = {
						{type = 0, id = 644,count = 1,quality = 0, strong = 0, bind = 0},
						--{type = 0, id = 794,count = 1,quality = 0, strong = 0, bind = 0,},							

					},
				},

				{						
					optionName = Lang.Activity.new0017,    -- 60
					level = 41,         -- 等级
					circle = 0,         -- 转
					point = 0,          --魂石分数
					initialCount = 20,      --0/1 初始值
					totalCount = 128,     -- 100, 总的值
					awards = {
						{type = 0, id = 644,count = 1,quality = 0, strong = 0, bind = 0},
						--{type = 0, id = 794,count = 1,quality = 0, strong = 0, bind = 0,},							

					},
				},

			},
		},

		{
			optionName = Lang.Activity.new04,    --选项名字			(英雄等级)
			desc = Lang.Activity.new0005,			--活动描述	   （活动时间。。。。。。。。。）
			explanation = Lang.Activity.new0006,    --活动说明 （如何快速升级？ 1，，，2，）
			title = "",                             --说明的标题
			listName = Lang.Activity.new0011, -- 角色等级,剩余名额,奖励物品 
			actList = {
				{					

					optionName = Lang.Activity.new0013,    -- [3转]70
					initialCount = 1,      --0/1 初始值
					totalCount = 8,     -- 100, 总的值
					level = 70,         -- 等级
					circle = 3,         -- 转
					point = 0,          --魂石分数
					awards = {
						{type = 0, id = 644,count = 1,quality = 0, strong = 0, bind = 0},
						{type = 0, id = 794,count = 1,quality = 0, strong = 0, bind = 0,},
						{type = 0, id = 784,count = 1,quality = 0, strong = 0, bind = 0,},						
						{type = 0, id = 785,count = 1,quality = 0, strong = 0, bind = 0,},						

					},
				},

				{						
					optionName = Lang.Activity.new0014,    -- [2转]60
					level = 60,         -- 等级
					circle = 2,         -- 转
					point = 0,          --魂石分数
					initialCount = 5,      --0/1 初始值
					totalCount = 16,     -- 100, 总的值
					awards = {
						{type = 0, id = 644,count = 1,quality = 0, strong = 0, bind = 0},
						{type = 0, id = 794,count = 1,quality = 0, strong = 0, bind = 0,},							
						{type = 0, id = 795,count = 1,quality = 0, strong = 0, bind = 0,},							

					},
				},

				{						
					optionName = Lang.Activity.new0015,    -- [1转]50
					level = 50,         -- 等级
					circle = 1,         -- 转
					point = 0,          --魂石分数
					initialCount = 10,      --0/1 初始值
					totalCount = 32,     -- 100, 总的值
					awards = {
						{type = 0, id = 644,count = 1,quality = 0, strong = 0, bind = 0},
						{type = 0, id = 794,count = 1,quality = 0, strong = 0, bind = 0,},							

					},
				},

				{						
					optionName = Lang.Activity.new0016,    -- 70
					level = 70,         -- 等级
					circle = 0,         -- 3转
					point = 0,          --魂石分数
					initialCount = 15,      --0/1 初始值
					totalCount = 64,     -- 100, 总的值
					awards = {
						{type = 0, id = 644,count = 1,quality = 0, strong = 0, bind = 0},
						--{type = 0, id = 794,count = 1,quality = 0, strong = 0, bind = 0,},							

					},
				},

				{						
					optionName = Lang.Activity.new0017,    -- 60
					level = 60,         -- 等级
					circle = 0,         -- 转
					point = 0,          --魂石分数
					initialCount = 20,      --0/1 初始值
					totalCount = 128,     -- 100, 总的值
					awards = {
						{type = 0, id = 644,count = 1,quality = 0, strong = 0, bind = 0},
						--{type = 0, id = 794,count = 1,quality = 0, strong = 0, bind = 0,},							

					},
				},

			},
		},


		{
			optionName = Lang.Activity.new05,    --选项名字			(魂石评分)
			desc = Lang.Activity.new0007,			--活动描述	   （活动时间。。。。。。。。。）
			explanation = Lang.Activity.new0008,    --活动说明 （如何快速升级？ 1，，，2，）
			title = "",                             --说明的标题
			listName = Lang.Activity.new0012, -- 角色等级,剩余名额,奖励物品 
			actList = {
				{					

					optionName = "20000",    --Lang.Activity.new0013,    -- [3转]70
					initialCount = 1,      --0/1 初始值
					totalCount = 8,     -- 100, 总的值
					level = 0,         -- 等级
					circle = 0,         -- 转
					point = 20000,          --魂石分数
					awards = {
						{type = 0, id = 644,count = 1,quality = 0, strong = 0, bind = 0},
						{type = 0, id = 794,count = 1,quality = 0, strong = 0, bind = 0,},
						{type = 0, id = 784,count = 1,quality = 0, strong = 0, bind = 0,},						
						{type = 0, id = 785,count = 1,quality = 0, strong = 0, bind = 0,},						

					},
				},

				{						
					optionName = "15800",  --Lang.Activity.new0014,    -- [2转]60
					level = 0,         -- 等级
					circle = 0,         -- 转
					point = 15800,          --魂石分数
					initialCount = 5,      --0/1 初始值
					totalCount = 16,     -- 100, 总的值
					awards = {
						{type = 0, id = 644,count = 1,quality = 0, strong = 0, bind = 0},
						{type = 0, id = 794,count = 1,quality = 0, strong = 0, bind = 0,},							
						{type = 0, id = 795,count = 1,quality = 0, strong = 0, bind = 0,},							

					},
				},

				{						
					optionName = "12000", --Lang.Activity.new0015,    -- [1转]50
					level = 0,         -- 等级
					circle = 0,         -- 转
					point = 12000,          --魂石分数
					initialCount = 10,      --0/1 初始值
					totalCount = 32,     -- 100, 总的值
					awards = {
						{type = 0, id = 644,count = 1,quality = 0, strong = 0, bind = 0},
						{type = 0, id = 794,count = 1,quality = 0, strong = 0, bind = 0,},							

					},
				},

				{						
					optionName = "10000",  --Lang.Activity.new0016,    -- 70
					level = 0,         -- 等级
					circle = 0,         -- 3转
					point = 10000,          --魂石分数
					initialCount = 15,      --0/1 初始值
					totalCount = 64,     -- 100, 总的值
					awards = {
						{type = 0, id = 644,count = 1,quality = 0, strong = 0, bind = 0},
						--{type = 0, id = 794,count = 1,quality = 0, strong = 0, bind = 0,},							

					},
				},

				{						
					optionName = "8000",    --Lang.Activity.new0017,    -- 60
					level = 0,         -- 等级
					circle = 0,         -- 转
					point = 8000,          --魂石分数
					initialCount = 20,      --0/1 初始值
					totalCount = 128,     -- 100, 总的值
					awards = {
						{type = 0, id = 644,count = 1,quality = 0, strong = 0, bind = 0},
						--{type = 0, id = 794,count = 1,quality = 0, strong = 0, bind = 0,},							

					},
				},
			},
		},


	},
}
