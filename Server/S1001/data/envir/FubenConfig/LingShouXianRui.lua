--#include "..\..\language\LangCode.txt"

--灵兽献瑞副本配置
LingShouXianRuiFubenCfg = {
	fuben_id 		= 0, --灵兽献瑞副本ID
	sceneId 		= 89,--场景ID
	SceneName		= Lang.SceneName.s00089,
	buy_level_limit = 80, --限定几级以上玩家才可购买	
	huff_buff_id	= 57, --发怒BuffId
	--huff_time 		= 30, --发怒持续时间(秒)，在buff中配置
	max_use_count 	= 50, --每次最多能使用多少个天雷弹(大中小总数)
	attack_area		= {{35,42}, {56,63}}, --攻击区域{{x1,y1},{x2,y2}}
	monster_id		= 87, --灵兽ID
	skill_cfg 		= { skill_id = 62, skill_level = 1 },
	point = {{39,45},{52,44},{50,57},{39,57}},
	activityTime = 1200,
	item_cfg = {
		--小天雷弹
		{
			BuyNum = 10,
			--经验
			{
				icon = 665,
				name = Lang.Activity.tld001,
				huff_rate = 5,
				buy_money = {type = 15,count = 1000,logs = {965,Lang.LogTips.l00183}}, --购买需要多少元宝
				awards = {
							{type = 2, id = 0, count = 10000, strong = 0, quality = 0, bind = false},
						 },
			},
			--金钱
			{
				icon = 666,
				name = Lang.Activity.tld002,
				huff_rate = 5,
				buy_money = {type = 15,count = 1000,logs = {965,Lang.LogTips.l00183}}, --购买需要多少元宝
				awards = {
							{type = 5, id = 0, count = 10000, strong = 0, quality = 0, bind = false},
						},
			},
			--材料
			{
				icon = 667,
				name = Lang.Activity.tld003,
				huff_rate = 5,
				buy_money = {type = 15,count = 1000,logs = {965,Lang.LogTips.l00183}}, --购买需要多少元宝
				awards = { --多个材料可以往下添加
							{
								{type = 0, id = 511, count = 1, strong = 0, quality = 0, bind = false},
							},
							{
								{type = 0, id = 510, count = 1, strong = 0, quality = 0, bind = false},
							}
						},
			},
		},
				--中天雷弹
		{
			BuyNum = 10,
			--经验
			{
				icon = 662,
				name = Lang.Activity.tld004,
				huff_rate = 5,
				buy_money = {type = 15,count = 1000,logs = {965,Lang.LogTips.l00183}}, --购买需要多少元宝
				awards = {
							{type = 2, id = 0, count = 10000, strong = 0, quality = 0, bind = false},
						 },
			},
			--金钱
			{
				icon = 663,
				name = Lang.Activity.tld005,
				huff_rate = 5,
				buy_money = {type = 15,count = 1000,logs = {965,Lang.LogTips.l00183}}, --购买需要多少元宝
				awards = {
							{type = 5, id = 0, count = 10000, strong = 0, quality = 0, bind = false},
						},
			},
			--材料
			{
				icon = 664,
				name = Lang.Activity.tld006,
				huff_rate = 5,
				buy_money = {type = 15,count = 1000,logs = {965,Lang.LogTips.l00183}}, --购买需要多少元宝
				awards = {
							{
								{type = 0, id = 511, count = 1, strong = 0, quality = 0, bind = false},
							},
							{
								{type = 0, id = 510, count = 1, strong = 0, quality = 0, bind = false},
							}
						},
			},
		},
		--高天雷弹
		{
			BuyNum = 10,
			--经验
			{
				icon = 659,
				name = Lang.Activity.tld007,
				huff_rate = 5,
				buy_money = {type = 15,count = 1000,logs = {965,Lang.LogTips.l00183}}, --购买需要多少元宝
				awards = {
							{type = 2, id = 0, count = 10000, strong = 0, quality = 0, bind = false},
						 },
			},
			--金钱
			{
				icon = 660,
				name = Lang.Activity.tld008,
				huff_rate = 5,
				buy_money = {type = 15,count = 1000,logs = {965,Lang.LogTips.l00183}}, --购买需要多少元宝
				awards = {
							{type = 5, id = 0, count = 10000, strong = 0, quality = 0, bind = false},
						},
			},
			--材料
			{
				icon = 661,
				name = Lang.Activity.tld009,
				huff_rate = 5,
				buy_money = {type = 15,count = 1000,logs = {965,Lang.LogTips.l00183}}, --购买需要多少元宝
				awards = {
							{
								{type = 0, id = 511, count = 1, strong = 0, quality = 0, bind = false},
							},
							{
								{type = 0, id = 510, count = 1, strong = 0, quality = 0, bind = false},
							}
						},
			},
		},
	},
	
}