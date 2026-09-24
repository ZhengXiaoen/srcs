
-- 王陵配置
wangling_cfg = {
	need_level = 80, -- 开放等级
	
	scene_id = 194,	--王陵场景ID
	
	bindyb_enter = 1000, -- 每天前 3 次花费绑定元宝进入
	yb_enter_base = 500, -- 每天从第 4 次开始花费元宝进入
	yb_enter_add = 100, -- 每次递增的元宝数
	
	monster_list = { -- 怪物列表
		{
			monster_id = 567, -- 暮光亡魂
			name = "暮光亡魂",
			miasma = 20, -- 瘴气值
			dropAward = {
				{type = 0, id = 721, count = 1, quality = 0, strong = 0, bind = 1},
				{type = 0, id = 722, count = 1, quality = 0, strong = 0, bind = 1},
				{type = 0, id = 723, count = 1, quality = 0, strong = 0, bind = 1},
				{type = 0, id = 724, count = 1, quality = 0, strong = 0, bind = 1},
				{type = 0, id = 29, count = 1, quality = 0, strong = 0, bind = 1},--7转武器
				{type = 0, id = 30, count = 1, quality = 0, strong = 0, bind = 1},--7转武器
				{type = 0, id = 31, count = 1, quality = 0, strong = 0, bind = 1},--7转武器
                                {type = 0, id = 653, count = 1, quality = 0, strong = 0, bind = 1},--霸者吊坠
				{type = 0, id = 654, count = 1, quality = 0, strong = 0, bind = 1},--霸者面甲
				{type = 0, id = 655, count = 1, quality = 0, strong = 0, bind = 1},--霸者护肩
				{type = 0, id = 656, count = 1, quality = 0, strong = 0, bind = 1},--霸者护膝
				{type = 0, id = 94, count = 1, quality = 0, strong = 0, bind = 1},--7转衣服
				{type = 0, id = 96, count = 1, quality = 0, strong = 0, bind = 1},--7转衣服
				{type = 0, id = 98, count = 1, quality = 0, strong = 0, bind = 1},--7转衣服
			};
		},
		{
			monster_id = 568, -- 不归尊者
			name = "不归尊者",
			miasma = 25, -- 瘴气值
						dropAward = {
				{type = 0, id = 721, count = 1, quality = 0, strong = 0, bind = 1},
				{type = 0, id = 722, count = 1, quality = 0, strong = 0, bind = 1},
				{type = 0, id = 723, count = 1, quality = 0, strong = 0, bind = 1},
				{type = 0, id = 724, count = 1, quality = 0, strong = 0, bind = 1},
				{type = 0, id = 29, count = 1, quality = 0, strong = 0, bind = 1},--7转武器
				{type = 0, id = 30, count = 1, quality = 0, strong = 0, bind = 1},--7转武器
				{type = 0, id = 31, count = 1, quality = 0, strong = 0, bind = 1},--7转武器
                                {type = 0, id = 653, count = 1, quality = 0, strong = 0, bind = 1},--霸者吊坠
				{type = 0, id = 654, count = 1, quality = 0, strong = 0, bind = 1},--霸者面甲
				{type = 0, id = 655, count = 1, quality = 0, strong = 0, bind = 1},--霸者护肩
				{type = 0, id = 656, count = 1, quality = 0, strong = 0, bind = 1},--霸者护膝
				{type = 0, id = 94, count = 1, quality = 0, strong = 0, bind = 1},--7转衣服
				{type = 0, id = 96, count = 1, quality = 0, strong = 0, bind = 1},--7转衣服
				{type = 0, id = 98, count = 1, quality = 0, strong = 0, bind = 1},--7转衣服
			};
		},
		{
			monster_id = 569, -- 魔化老妖
			name = "魔化老妖",
			miasma = 30, -- 瘴气值
						dropAward = {
				{type = 0, id = 721, count = 1, quality = 0, strong = 0, bind = 1},
				{type = 0, id = 722, count = 1, quality = 0, strong = 0, bind = 1},
				{type = 0, id = 723, count = 1, quality = 0, strong = 0, bind = 1},
				{type = 0, id = 724, count = 1, quality = 0, strong = 0, bind = 1},
				{type = 0, id = 29, count = 1, quality = 0, strong = 0, bind = 1},--7转武器
				{type = 0, id = 30, count = 1, quality = 0, strong = 0, bind = 1},--7转武器
				{type = 0, id = 31, count = 1, quality = 0, strong = 0, bind = 1},--7转武器
                                {type = 0, id = 653, count = 1, quality = 0, strong = 0, bind = 1},--霸者吊坠
				{type = 0, id = 654, count = 1, quality = 0, strong = 0, bind = 1},--霸者面甲
				{type = 0, id = 655, count = 1, quality = 0, strong = 0, bind = 1},--霸者护肩
				{type = 0, id = 656, count = 1, quality = 0, strong = 0, bind = 1},--霸者护膝
				{type = 0, id = 94, count = 1, quality = 0, strong = 0, bind = 1},--7转衣服
				{type = 0, id = 96, count = 1, quality = 0, strong = 0, bind = 1},--7转衣服
				{type = 0, id = 98, count = 1, quality = 0, strong = 0, bind = 1},--7转衣服
			};
		},
		{
			monster_id = 570, -- 断月天王
			name = "断月天王",
			miasma = 35, -- 瘴气值
			dropAward = {
				{type = 0, id = 721, count = 1, quality = 0, strong = 0, bind = 1},
				{type = 0, id = 722, count = 1, quality = 0, strong = 0, bind = 1},
				{type = 0, id = 723, count = 1, quality = 0, strong = 0, bind = 1},
				{type = 0, id = 724, count = 1, quality = 0, strong = 0, bind = 1},
				{type = 0, id = 29, count = 1, quality = 0, strong = 0, bind = 1},--7转武器
				{type = 0, id = 30, count = 1, quality = 0, strong = 0, bind = 1},--7转武器
				{type = 0, id = 31, count = 1, quality = 0, strong = 0, bind = 1},--7转武器
                                {type = 0, id = 653, count = 1, quality = 0, strong = 0, bind = 1},--霸者吊坠
				{type = 0, id = 654, count = 1, quality = 0, strong = 0, bind = 1},--霸者面甲
				{type = 0, id = 655, count = 1, quality = 0, strong = 0, bind = 1},--霸者护肩
				{type = 0, id = 656, count = 1, quality = 0, strong = 0, bind = 1},--霸者护膝
				{type = 0, id = 94, count = 1, quality = 0, strong = 0, bind = 1},--7转衣服
				{type = 0, id = 96, count = 1, quality = 0, strong = 0, bind = 1},--7转衣服
				{type = 0, id = 98, count = 1, quality = 0, strong = 0, bind = 1},--7转衣服
			};
		},
		{
			monster_id = 571, -- 诛邪教皇
			name = "诛邪教皇",
			miasma = 40, -- 瘴气值
			dropAward = {
				{type = 0, id = 721, count = 1, quality = 0, strong = 0, bind = 1},
				{type = 0, id = 722, count = 1, quality = 0, strong = 0, bind = 1},
				{type = 0, id = 723, count = 1, quality = 0, strong = 0, bind = 1},
				{type = 0, id = 724, count = 1, quality = 0, strong = 0, bind = 1},
				{type = 0, id = 29, count = 1, quality = 0, strong = 0, bind = 1},--7转武器
				{type = 0, id = 30, count = 1, quality = 0, strong = 0, bind = 1},--7转武器
				{type = 0, id = 31, count = 1, quality = 0, strong = 0, bind = 1},--7转武器
                                {type = 0, id = 653, count = 1, quality = 0, strong = 0, bind = 1},--霸者吊坠
				{type = 0, id = 654, count = 1, quality = 0, strong = 0, bind = 1},--霸者面甲
				{type = 0, id = 655, count = 1, quality = 0, strong = 0, bind = 1},--霸者护肩
				{type = 0, id = 656, count = 1, quality = 0, strong = 0, bind = 1},--霸者护膝
				{type = 0, id = 94, count = 1, quality = 0, strong = 0, bind = 1},--7转衣服
				{type = 0, id = 96, count = 1, quality = 0, strong = 0, bind = 1},--7转衣服
				{type = 0, id = 98, count = 1, quality = 0, strong = 0, bind = 1},--7转衣服
			};
		},
		{
			monster_id = 572, -- 血影魔王
			name = "血影魔王",
			miasma = 50, -- 瘴气值
					dropAward = {
				{type = 0, id = 721, count = 1, quality = 0, strong = 0, bind = 1},
				{type = 0, id = 722, count = 1, quality = 0, strong = 0, bind = 1},
				{type = 0, id = 723, count = 1, quality = 0, strong = 0, bind = 1},
				{type = 0, id = 724, count = 1, quality = 0, strong = 0, bind = 1},
				{type = 0, id = 29, count = 1, quality = 0, strong = 0, bind = 1},--7转武器
				{type = 0, id = 30, count = 1, quality = 0, strong = 0, bind = 1},--7转武器
				{type = 0, id = 31, count = 1, quality = 0, strong = 0, bind = 1},--7转武器
                                {type = 0, id = 653, count = 1, quality = 0, strong = 0, bind = 1},--霸者吊坠
				{type = 0, id = 654, count = 1, quality = 0, strong = 0, bind = 1},--霸者面甲
				{type = 0, id = 655, count = 1, quality = 0, strong = 0, bind = 1},--霸者护肩
				{type = 0, id = 656, count = 1, quality = 0, strong = 0, bind = 1},--霸者护膝
				{type = 0, id = 94, count = 1, quality = 0, strong = 0, bind = 1},--7转衣服
				{type = 0, id = 96, count = 1, quality = 0, strong = 0, bind = 1},--7转衣服
				{type = 0, id = 98, count = 1, quality = 0, strong = 0, bind = 1},--7转衣服
			};
		},
		{
			monster_id = 573, -- 幽暗龙皇
			name = "幽暗龙皇",
			miasma = 60, -- 瘴气值
			dropAward = {
				{type = 0, id = 721, count = 1, quality = 0, strong = 0, bind = 1},
				{type = 0, id = 722, count = 1, quality = 0, strong = 0, bind = 1},
				{type = 0, id = 723, count = 1, quality = 0, strong = 0, bind = 1},
				{type = 0, id = 724, count = 1, quality = 0, strong = 0, bind = 1},
				{type = 0, id = 29, count = 1, quality = 0, strong = 0, bind = 1},--7转武器
				{type = 0, id = 30, count = 1, quality = 0, strong = 0, bind = 1},--7转武器
				{type = 0, id = 31, count = 1, quality = 0, strong = 0, bind = 1},--7转武器
                                {type = 0, id = 653, count = 1, quality = 0, strong = 0, bind = 1},--霸者吊坠
				{type = 0, id = 654, count = 1, quality = 0, strong = 0, bind = 1},--霸者面甲
				{type = 0, id = 655, count = 1, quality = 0, strong = 0, bind = 1},--霸者护肩
				{type = 0, id = 656, count = 1, quality = 0, strong = 0, bind = 1},--霸者护膝
				{type = 0, id = 94, count = 1, quality = 0, strong = 0, bind = 1},--7转衣服
				{type = 0, id = 96, count = 1, quality = 0, strong = 0, bind = 1},--7转衣服
				{type = 0, id = 98, count = 1, quality = 0, strong = 0, bind = 1},--7转衣服
			};
		},
	},
}