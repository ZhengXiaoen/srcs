--元宝花费礼包
YuanbaoGiftUseTable = 
{
	-- 新服必需在7天之内才可以用，旧服则没有时间限制
	newServerTime = {2015,10,16},
	
	giveItem = {
		{ 60, 880 }, -- 60 级送物品 880
		{ 73, 888 },
		{ 76, 884 },
	},
	
	gifts = {
		{
			item_id = 880, --青铜礼包(翅膀)
			needYb = 888, --需要花费元宝
			award =
			{
				{type = 0,id = 881,count = 1,bind=1}, -- 白银礼包(翅膀)
				{type = 0,id = 541,count = 35,bind=1}, -- 精羽毛
			},
		},
		{
			item_id = 881, --白银礼包(翅膀)
			needYb = 1888, --需要花费元宝
			award =
			{
				{type = 0,id = 882,count = 1,bind=1}, -- 黄金礼包(翅膀)
				{type = 0,id = 541,count = 85,bind=1}, -- 精羽毛
			},
		},
		{
			item_id = 882, --黄金礼包(翅膀)
			needYb = 4888, --需要花费元宝
			award =
			{
				{type = 0,id = 883,count = 1,bind=1}, -- 钻石礼包(翅膀)
				{type = 0,id = 541,count = 230,bind=1}, -- 精羽毛
			},
		},
		{
			item_id = 883, --钻石礼包(翅膀)
			needYb = 8888, --需要花费元宝
			award =
			{
				{type = 0,id = 541,count = 450,bind=1}, -- 精羽毛
			},
		},
		---------------------------------------
		{
			item_id = 888, --青铜礼包(宝石)
			needYb = 888, --需要花费元宝
			award =
			{
				{type = 0,id = 889,count = 1,bind=1}, -- 白银礼包(宝石)
				{type = 0,id = 537,count = 20,bind=1}, -- 宝石结晶(小)
			},
		},
		{
			item_id = 889, --白银礼包(宝石)
			needYb = 1888, --需要花费元宝
			award =
			{
				{type = 0,id = 890,count = 1,bind=1}, -- 黄金礼包(宝石)
				{type = 0,id = 537,count = 50,bind=1}, -- 宝石结晶(小)
			},
		},
		{
			item_id = 890, --黄金礼包(宝石)
			needYb = 4888, --需要花费元宝
			award =
			{
				{type = 0,id = 891,count = 1,bind=1}, -- 钻石礼包(宝石)
				{type = 0,id = 537,count = 160,bind=1}, -- 宝石结晶(小)
			},
		},
		{
			item_id = 891, --钻石礼包(宝石)
			needYb = 8888, --需要花费元宝
			award =
			{
				{type = 0,id = 537,count = 350,bind=1}, -- 宝石结晶(小)
			},
		},
		---------------------------------------
		{
			item_id = 884, --青铜礼包(灵珠)
			needYb = 888, --需要花费元宝
			award =
			{
				{type = 0,id = 885,count = 1,bind=1}, -- 白银礼包(灵珠)
				{type = 0,id = 816,count = 20,bind=1}, -- 灵珠碎片(小)
			},
		},
		{
			item_id = 885, --白银礼包(灵珠)
			needYb = 1888, --需要花费元宝
			award =
			{
				{type = 0,id = 886,count = 1,bind=1}, -- 黄金礼包(灵珠)
				{type = 0,id = 816,count = 50,bind=1}, -- 灵珠碎片(小)
			},
		},
		{
			item_id = 886, --黄金礼包(灵珠)
			needYb = 4888, --需要花费元宝
			award =
			{
				{type = 0,id = 887,count = 1,bind=1}, -- 钻石礼包(灵珠)
				{type = 0,id = 816,count = 160,bind=1}, -- 灵珠碎片(小)
			},
		},
		{
			item_id = 887, --钻石礼包(灵珠)
			needYb = 8888, --需要花费元宝
			award =
			{
				{type = 0,id = 816,count = 350,bind=1}, -- 灵珠碎片(小)
			},
		},
	},
}
