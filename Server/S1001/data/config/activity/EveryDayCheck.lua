--每日签到奖励表
EveryDayCheck = 
{
	-- 补签消耗
	supplementConsume = {type = 15, count = 10},
	
	-- 每月天数
	monthDays = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
	
	rewardList = { -- count and countOnce must match
		{ reward = {type = 0, id = 538, count = 2, bind = 1, countOnce = 2}}, -- Day 1: Gem crystal (1000)
		{ reward = {type = 0, id = 573, count = 2, bind = 1, countOnce = 2}}, -- Day 2: Holy pearl crystal (1000)
		{ reward = {type = 0, id = 553, count = 5, bind = 1, countOnce = 5}}, -- Day 3: Warrior spirit pill (large)
		{ reward = {type = 0, id = 509, count = 5, bind = 1, countOnce = 5}}, -- Day 4: Bound gold brick (large)
		{ reward = {type = 0, id = 538, count = 2, bind = 1, countOnce = 2}}, -- Day 5: Gem crystal (1000)
		{ reward = {type = 0, id = 573, count = 2, bind = 1, countOnce = 2}}, -- Day 6: Holy pearl crystal (1000)
		{ reward = {type = 0, id = 553, count = 5, bind = 1, countOnce = 5}}, -- Day 7: Warrior spirit pill (large)
		{ reward = {type = 0, id = 509, count = 5, bind = 1, countOnce = 5}}, -- Day 8: Bound gold brick (large)
		{ reward = {type = 0, id = 538, count = 2, bind = 1, countOnce = 2}}, -- Day 9: Gem crystal (1000)
		{ reward = {type = 0, id = 573, count = 2, bind = 1, countOnce = 2}}, -- Day 10: Holy pearl crystal (1000)
		{ reward = {type = 0, id = 553, count = 5, bind = 1, countOnce = 5}}, -- Day 11: Warrior spirit pill (large)
		{ reward = {type = 0, id = 509, count = 5, bind = 1, countOnce = 5}}, -- Day 12: Bound gold brick (large)
		{ reward = {type = 0, id = 538, count = 2, bind = 1, countOnce = 2}}, -- Day 13: Gem crystal (1000)
		{ reward = {type = 0, id = 573, count = 2, bind = 1, countOnce = 2}}, -- Day 14: Holy pearl crystal (1000)
		{ reward = {type = 0, id = 553, count = 5, bind = 1, countOnce = 5}}, -- Day 15: Warrior spirit pill (large)
		{ reward = {type = 0, id = 509, count = 5, bind = 1, countOnce = 5}}, -- Day 16: Bound gold brick (large)
		{ reward = {type = 0, id = 538, count = 2, bind = 1, countOnce = 2}}, -- Day 17: Gem crystal (1000)
		{ reward = {type = 0, id = 573, count = 2, bind = 1, countOnce = 2}}, -- Day 18: Holy pearl crystal (1000)
		{ reward = {type = 0, id = 553, count = 5, bind = 1, countOnce = 5}}, -- Day 19: Warrior spirit pill (large)
		{ reward = {type = 0, id = 509, count = 5, bind = 1, countOnce = 5}}, -- Day 20: Bound gold brick (large)
		{ reward = {type = 0, id = 538, count = 2, bind = 1, countOnce = 2}}, -- Day 21: Gem crystal (1000)
		{ reward = {type = 0, id = 573, count = 2, bind = 1, countOnce = 2}}, -- Day 22: Holy pearl crystal (1000)
		{ reward = {type = 0, id = 553, count = 5, bind = 1, countOnce = 5}}, -- Day 23: Warrior spirit pill (large)
		{ reward = {type = 0, id = 509, count = 5, bind = 1, countOnce = 5}}, -- Day 24: Bound gold brick (large)
		{ reward = {type = 0, id = 538, count = 2, bind = 1, countOnce = 2}}, -- Day 25: Gem crystal (1000)
		{ reward = {type = 0, id = 573, count = 2, bind = 1, countOnce = 2}}, -- Day 26: Holy pearl crystal (1000)
		{ reward = {type = 0, id = 553, count = 5, bind = 1, countOnce = 5}}, -- Day 27: Warrior spirit pill (large)
		{ reward = {type = 0, id = 509, count = 5, bind = 1, countOnce = 5}}, -- Day 28: Bound gold brick (large)
		{ reward = {type = 0, id = 538, count = 2, bind = 1, countOnce = 2}}, -- Day 29: Gem crystal (1000)
		{ reward = {type = 0, id = 573, count = 2, bind = 1, countOnce = 2}}, -- Day 30: Holy pearl crystal (1000)
		{ reward = {type = 0, id = 553, count = 5, bind = 1, countOnce = 5}}, -- Day 31: Warrior spirit pill (large)
	},

	-- Cumulative sign-in rewards
	AccumulatedDaysAward =
	{
		{
			days = 2,
			reward =
			{
				{type = 0, id = 464, count = 400, quality = 0, strong = 0, bind = 1, countOnce = 400}, -- Level 1 feather
				{type = 0, id = 459, count = 400, quality = 0, strong = 0, bind = 1, countOnce = 400}, -- Star pattern enhancement stone
				{type = 0, id = 509, count = 40, quality = 0, strong = 0, bind = 1, countOnce = 40}, -- Bound gold brick (large)
				{type = 0, id = 553, count = 10, quality = 0, strong = 0, bind = 1, countOnce = 10}, -- Warrior spirit pill (large)
			},
		},
		{
			days = 5,
			reward =
			{
				{type = 0, id = 464, count = 1000, quality = 0, strong = 0, bind = 1, countOnce = 1000}, -- Level 1 feather
				{type = 0, id = 459, count = 1000, quality = 0, strong = 0, bind = 1, countOnce = 1000}, -- Star pattern enhancement stone
				{type = 0, id = 509, count = 100, quality = 0, strong = 0, bind = 1, countOnce = 100}, -- Bound gold brick (large)
				{type = 0, id = 553, count = 25, quality = 0, strong = 0, bind = 1, countOnce = 25}, -- Warrior spirit pill (large)
			},
		},
		{
			days = 10,
			reward =
			{
				{type = 0, id = 464, count = 2000, quality = 0, strong = 0, bind = 1, countOnce = 2000}, -- Level 1 feather
				{type = 0, id = 459, count = 2000, quality = 0, strong = 0, bind = 1, countOnce = 2000}, -- Star pattern enhancement stone
				{type = 0, id = 509, count = 200, quality = 0, strong = 0, bind = 1, countOnce = 200}, -- Bound gold brick (large)
				{type = 0, id = 553, count = 50, quality = 0, strong = 0, bind = 1, countOnce = 50}, -- Warrior spirit pill (large)
			},
		},
		{
			days = 17,
			reward =
			{
				{type = 0, id = 464, count = 3400, quality = 0, strong = 0, bind = 1, countOnce = 3400}, -- Level 1 feather
				{type = 0, id = 459, count = 3400, quality = 0, strong = 0, bind = 1, countOnce = 3400}, -- Star pattern enhancement stone
				{type = 0, id = 509, count = 340, quality = 0, strong = 0, bind = 1, countOnce = 340}, -- Bound gold brick (large)
				{type = 0, id = 553, count = 85, quality = 0, strong = 0, bind = 1, countOnce = 85}, -- Warrior spirit pill (large)
			},
		},
		{
			days = 26,
			reward =
			{
				{type = 0, id = 464, count = 5200, quality = 0, strong = 0, bind = 1, countOnce = 5200}, -- Level 1 feather
				{type = 0, id = 459, count = 5200, quality = 0, strong = 0, bind = 1, countOnce = 5200}, -- Star pattern enhancement stone
				{type = 0, id = 509, count = 520, quality = 0, strong = 0, bind = 1, countOnce = 520}, -- Bound gold brick (large)
				{type = 0, id = 553, count = 130, quality = 0, strong = 0, bind = 1, countOnce = 130}, -- Warrior spirit pill (large)
			},
		},
	}
}
