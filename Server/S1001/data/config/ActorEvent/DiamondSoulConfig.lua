--钻石之灵配置
-- 已经屏蔽
--[[
DiamondSoulConfig =
{
	--三转打开钻石之灵
	OpenCircle = 3,
	--开放等级
	OpenLevel = 90;
	--每次升级钻灵都降5级
	DropLevel = 5;
	--钻石之灵最大等级
	MaxLevel = 4,
	DiamondSoulLevel = {
	--绿钻
		{
			level = 1,
			exchangeLevel = 90, --升级的等级
			consume=
			{{ type = 0, id = 529, count = 30}},
			--attackMultiply = 1.1, --攻击力加的倍数
			--hpMultiply={{job=1,multiply=0.01},{job=2,mutiply=0.02},{job=3,mutiply=0.015}},  --hp的倍数职业不同 倍数不同
			multiply=
			{{job=1,attackMultiply=1.1,hpMultiply=0.13},{job=2,attackMultiply=1.1,attackMultiply=1.1,hpMultiply=0.2},{job=3,attackMultiply=1.1,hpMultiply=0.15}},  --hp的倍数职业不同 倍数不同			
		},
	--紫钻	
		{
			level = 2,
			exchangeLevel = 95, --升级的等级
			consume=
			{{ type = 0, id = 528, count = 30}},
			--attackMultiply = 1.2, --攻击力加的倍数
			multiply={{job=1,attackMultiply=1.2,hpMultiply=0.24},{job=2,attackMultiply=1.2,hpMultiply=0.41},{job=3,attackMultiply=1.2,hpMultiply=0.31}},  --hp的倍数职业不同 倍数不同
		},
	--红钻	
		{
			level = 3,
			exchangeLevel = 100, --升级的等级
			consume=
			{{ type = 0, id = 688, count = 30}},
			--attackMultiply = 1.3, --攻击力加的倍数
			multiply={{job=1,attackMultiply=1.3,hpMultiply=0.36},{job=2,attackMultiply=1.3,hpMultiply=0.66},{job=3,attackMultiply=1.3,hpMultiply=0.51}},  --hp的倍数职业不同 倍数不同
		},
	--金钻	
		{
			level = 4,
			exchangeLevel = 105, --升级的等级
			consume=
			{{ type = 0, id = 689, count = 30}},
			--attackMultiply = 1.4, --攻击力加的倍数
			multiply={{job=1,attackMultiply=1.4,hpMultiply=0.51},{job=2,attackMultiply=1.4,hpMultiply=0.96},{job=3,attackMultiply=1.4,hpMultiply=0.76}},  --hp的倍数职业不同 倍数不同
		},
	},
}
--]]