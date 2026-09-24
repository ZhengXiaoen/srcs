--第二层表,为合服控制的表,第一个表是未合服的
{
	{
		openday = 7,		--开服天数, 5天之内存在,进入这个表后就不再进入下一个表

		items = 
		{
			--战士
			{

				{
					money = 3000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 8,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1159, prob = 11, count = 1, notice = true, hundred = 11},
						{itemid = 1217, prob = 9 , count = 1, notice = true, hundred = 9 },
						{itemid = 1275, prob = 8 , count = 1, notice = true, hundred = 8 },
						{itemid = 1333, prob = 8 , count = 1, notice = true, hundred = 8 },
						{itemid = 1391, prob = 8 , count = 1, notice = true, hundred = 8 },
						{itemid = 1449, prob = 7 , count = 1, notice = true, hundred = 7 },
					},
				},
				{
					money = 10000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 8,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1159, prob = 11, count = 1, notice = true, hundred = 11},
						{itemid = 1217, prob = 9 , count = 1, notice = true, hundred = 9 },
						{itemid = 1275, prob = 8 , count = 1, notice = true, hundred = 8 },
						{itemid = 1333, prob = 8 , count = 1, notice = true, hundred = 8 },
						{itemid = 1391, prob = 8 , count = 1, notice = true, hundred = 8 },
						{itemid = 1449, prob = 7 , count = 1, notice = true, hundred = 7 },
					},
				},
				{
					money = 30000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 5,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1160, prob = 11, count = 1, notice = true,broadcast = true, hundred = 11},
						{itemid = 1218, prob = 9 , count = 1, notice = true,broadcast = true, hundred = 9 },
						{itemid = 1276, prob = 8 , count = 1, notice = true,broadcast = true, hundred = 8 },
						{itemid = 1334, prob = 8 , count = 1, notice = true,broadcast = true, hundred = 8 },
						{itemid = 1392, prob = 8 , count = 1, notice = true,broadcast = true, hundred = 8 },
						{itemid = 1450, prob = 7 , count = 1, notice = true,broadcast = true, hundred = 7 },
					},
				},
				{
					money = 60000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1159, prob = 11, count = 1, notice = true, hundred = 11},
						{itemid = 1217, prob = 9 , count = 1, notice = true, hundred = 9 },
						{itemid = 1275, prob = 8 , count = 1, notice = true, hundred = 8 },
						{itemid = 1333, prob = 8 , count = 1, notice = true, hundred = 8 },
						{itemid = 1391, prob = 8 , count = 1, notice = true, hundred = 8 },
						{itemid = 1449, prob = 7 , count = 1, notice = true, hundred = 7 },
					},
				},
				{
					money = 90000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 15,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1160, prob = 11, count = 1, notice = true,broadcast = true, hundred = 11},
						{itemid = 1218, prob = 9 , count = 1, notice = true,broadcast = true, hundred = 9 },
						{itemid = 1276, prob = 8 , count = 1, notice = true,broadcast = true, hundred = 8 },
						{itemid = 1334, prob = 8 , count = 1, notice = true,broadcast = true, hundred = 8 },
						{itemid = 1392, prob = 8 , count = 1, notice = true,broadcast = true, hundred = 8 },
						{itemid = 1450, prob = 7 , count = 1, notice = true,broadcast = true, hundred = 7 },
					},
				},
				{
					money = 120000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1159, prob = 11, count = 1, notice = true, hundred = 11},
						{itemid = 1217, prob = 9 , count = 1, notice = true, hundred = 9 },
						{itemid = 1275, prob = 8 , count = 1, notice = true, hundred = 8 },
						{itemid = 1333, prob = 8 , count = 1, notice = true, hundred = 8 },
						{itemid = 1391, prob = 8 , count = 1, notice = true, hundred = 8 },
						{itemid = 1449, prob = 7 , count = 1, notice = true, hundred = 7 },
					},
				},
				{
					money = 150000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 15,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1160, prob = 11, count = 1, notice = true, broadcast = true, hundred = 11}, --8转首饰
						{itemid = 1218, prob = 9 , count = 1, notice = true, broadcast = true, hundred = 9 }, --8转首饰
						{itemid = 1276, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1334, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1392, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1450, prob = 7 , count = 1, notice = true, broadcast = true, hundred = 7 }, --8转首饰
					},
				},
				{
					money = 180000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 12,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1161, prob = 11, count = 1, notice = true, broadcast = true, hundred = 11}, --10转首饰
						{itemid = 1219, prob = 9 , count = 1, notice = true, broadcast = true, hundred = 9}, --10转首饰
						{itemid = 1277, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8}, --10转首饰
						{itemid = 1335, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8}, --10转首饰
						{itemid = 1393, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8}, --10转首饰
						{itemid = 1451, prob = 7 , count = 1, notice = true, broadcast = true, hundred = 7}, --10转首饰
					},
				},
				{
					count = 200,	--寻宝次数大于此值才会进入
					maxcount = 250,	--寻宝次数等于此值必定进入
					limit = 1,		--限制进入次数,-1为不限制
					prob = 5,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 2201, prob = 26, count = 1, notice = true, hundred = 26},  --欢
						{itemid = 2200, prob = 10, count = 1, notice = true, hundred = 10},  --狂
						{itemid = 2199, prob = 3 , count = 1, notice = true, hundred = 3 },   --民
						{itemid = 2198, prob = 1 , count = 1, notice = true, hundred = 1 },   --全
					},
				},
				{
					money = 0,	--寻宝花费数大于此值才会进入此表
					limit = -1,		--限制进入次数,-1为不限制
					prob = 1,

					--道具列表
					items = 
					{
						--id,概率,数量,广播

						{itemid = 2110, prob = 25888, count = 1, notice = false, hundred = 25888}, --一级暴击宝石 
						{itemid = 2110, prob = 25888, count = 1, notice = false, hundred = 25888}, --一级暴击宝石 
						{itemid = 2276, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 25888}, --铁血武器        
						{itemid = 2277, prob = 25668, count = 1, notice = true, broadcast = true, hundred = 25668}, --铁血衣服(男)
						{itemid = 2284, prob = 25588, count = 1, notice = true, broadcast = true, hundred = 25588}, --铁血衣服(女)

						{itemid = 2344, prob = 15288, count = 1, notice = true, hundred = 6888}, --傲视狂舞斩(英雄)    
						{itemid = 2354, prob = 15188, count = 1, notice = true, hundred = 6888}, --乾坤降魔杖(英雄)    
						{itemid = 2364, prob = 15088, count = 1, notice = true, hundred = 6888}, --紫金龙皇剑(英雄)    
						{itemid = 2380, prob = 15088, count = 1, notice = true, hundred = 6888}, --傲视狂舞甲(男)(英雄)
						{itemid = 2381, prob = 15088, count = 1, notice = true, hundred = 6888}, --傲视狂舞甲(女)(英雄)
						{itemid = 2400, prob = 15088, count = 1, notice = true, hundred = 6888}, --乾坤降魔衣(男)(英雄)
						{itemid = 2401, prob = 15088, count = 1, notice = true, hundred = 6888}, --乾坤降魔衣(女)(英雄)
						{itemid = 2420, prob = 15088, count = 1, notice = true, hundred = 6888}, --紫金龙皇甲(男)(英雄)
						{itemid = 2421, prob = 15088, count = 1, notice = true, hundred = 6888}, --紫金龙皇甲(女)(英雄)

						{itemid = 2345, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙战剑(英雄)      
						{itemid = 2355, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙魔杖(英雄)    
						{itemid = 2365, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙宝剑(英雄)    
						{itemid = 2382, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙战甲(男)(英雄)
						{itemid = 2383, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙战甲(女)(英雄)
						{itemid = 2402, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙魔衣(男)(英雄)
						{itemid = 2403, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙魔衣(女)(英雄)
						{itemid = 2422, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙道袍(男)(英雄)
						{itemid = 2423, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙道袍(女)(英雄)

						{itemid = 2346, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王战剑(英雄)     
						{itemid = 2356, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王魔杖(英雄)    
						{itemid = 2366, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王道剑(英雄)    
						{itemid = 2384, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王战甲(男)(英雄)
						{itemid = 2385, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王战甲(女)(英雄)
						{itemid = 2404, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王魔衣(男)(英雄)
						{itemid = 2405, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王魔衣(女)(英雄)
						{itemid = 2424, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王道袍(男)(英雄)
						{itemid = 2425, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王道袍(女)(英雄)

						{itemid = 1279, prob = 41588, count = 1, notice = true, broadcast = true, hundred = 32888}, --至尊斗佛战镯    
						{itemid = 1337, prob = 41888, count = 1, notice = true, broadcast = true, hundred = 32888}, --至尊斗佛战戒
						{itemid = 1163, prob = 42585, count = 1, notice = true, broadcast = true, hundred = 32585}, --至尊斗佛战盔
						{itemid = 1221, prob = 42688, count = 1, notice = true, broadcast = true, hundred = 32888}, --至尊斗佛战链    
						{itemid = 1395, prob = 42988, count = 1, notice = true, broadcast = true, hundred = 32888}, --至尊斗佛战带
						{itemid = 1453, prob = 42885, count = 1, notice = true, broadcast = true, hundred = 32585}, --至尊斗佛战靴

						{itemid = 765, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 59888}, --神之斩    
						{itemid = 766, prob = 35888, count = 1, notice = true, broadcast = true, hundred = 58888}, --神之甲
						{itemid = 767, prob = 28585, count = 1, notice = true, broadcast = true, hundred = 58585}, --神之盔
						{itemid = 768, prob = 28881, count = 1, notice = true, broadcast = true, hundred = 59888}, --神之链    
						{itemid = 769, prob = 28882, count = 1, notice = true, broadcast = true, hundred = 58888}, --神之镯
						{itemid = 770, prob = 28585, count = 1, notice = true, broadcast = true, hundred = 58585}, --神之戒
						{itemid = 771, prob = 28883, count = 1, notice = true, broadcast = true, hundred = 59888}, --神之带    
						{itemid = 772, prob = 28988, count = 1, notice = true, broadcast = true, hundred = 59888}, --神之靴

						{itemid = 987 , prob = 39888, count = 1, notice = true, broadcast = true, hundred = 59888}, --至尊斗佛斩        
						{itemid = 1061, prob = 35888, count = 1, notice = true, broadcast = true, hundred = 58888}, --至尊斗佛战甲(男)
						{itemid = 1062, prob = 35585, count = 1, notice = true, broadcast = true, hundred = 58585}, --至尊斗佛战甲(女)

						{itemid = 986 , prob = 32888, count = 1, notice = true, broadcast = true, hundred = 59888}, --斗佛之斩        
						{itemid = 1059, prob = 31888, count = 1, notice = true, broadcast = true, hundred = 58888}, --斗佛战甲(男)
						{itemid = 1060, prob = 31585, count = 1, notice = true, broadcast = true, hundred = 58585}, --斗佛战甲(女)

						{itemid = 984 , prob = 159888, count = 1, notice = true, broadcast = true, hundred = 59888}, --8转武器        
						{itemid = 1055, prob = 158888, count = 1, notice = true, broadcast = true, hundred = 58888}, --8转衣服(男)
						{itemid = 1056, prob = 158585, count = 1, notice = true, broadcast = true, hundred = 58585}, --8转衣服(女)

						{itemid = 983 , prob = 39888, count = 1, notice = true, broadcast = true, hundred = 39888}, --傲视狂舞斩    
						{itemid = 1053, prob = 38888, count = 1, notice = true, broadcast = true, hundred = 38888}, --傲视狂舞甲(男)
						{itemid = 1054, prob = 38585, count = 1, notice = true, broadcast = true, hundred = 38585}, --傲视狂舞甲(女)

						{itemid = 1278, prob = 21588, count = 1, notice = true, broadcast = true, hundred = 32888}, --斗佛战镯    
						{itemid = 1336, prob = 21888, count = 1, notice = true, broadcast = true, hundred = 32888}, --斗佛战戒
						{itemid = 1162, prob = 22585, count = 1, notice = true, broadcast = true, hundred = 32585}, --斗佛战盔
						{itemid = 1220, prob = 22688, count = 1, notice = true, broadcast = true, hundred = 32888}, --斗佛战链    
						{itemid = 1394, prob = 22988, count = 1, notice = true, broadcast = true, hundred = 32888}, --斗佛战带
						{itemid = 1452, prob = 22885, count = 1, notice = true, broadcast = true, hundred = 32585}, --斗佛战靴

						{itemid = 1161, prob = 42888, count = 1, notice = true, broadcast = true, hundred = 32888}, --10转首饰    
						{itemid = 1219, prob = 42888, count = 1, notice = true, broadcast = true, hundred = 32888}, --10转首饰
						{itemid = 1277, prob = 42585, count = 1, notice = true, broadcast = true, hundred = 32585}, --10转首饰
						{itemid = 1335, prob = 42888, count = 1, notice = true, broadcast = true, hundred = 32888}, --10转首饰    
						{itemid = 1393, prob = 42888, count = 1, notice = true, broadcast = true, hundred = 32888}, --10转首饰
						{itemid = 1451, prob = 42585, count = 1, notice = true, broadcast = true, hundred = 32585}, --10转首饰

						{itemid = 1160, prob = 22888, count = 1, notice = true, broadcast = true, hundred = 22888}, --8转首饰    
						{itemid = 1218, prob = 22888, count = 1, notice = true, broadcast = true, hundred = 22888}, --8转首饰
						{itemid = 1276, prob = 22585, count = 1, notice = true, broadcast = true, hundred = 22585}, --8转首饰
						{itemid = 1334, prob = 22888, count = 1, notice = true, broadcast = true, hundred = 22888}, --8转首饰    
						{itemid = 1392, prob = 22888, count = 1, notice = true, broadcast = true, hundred = 22888}, --8转首饰
						{itemid = 1450, prob = 22585, count = 1, notice = true, broadcast = true, hundred = 22585}, --8转首饰

						{itemid = 2291, prob = 26968, count = 1, notice = true, broadcast = true, hundred = 2359}, --圣·新年达人(男) 
						{itemid = 2292, prob = 26868, count = 1, notice = true, broadcast = true, hundred = 2349}, --圣·新年达人(女) 
						{itemid = 2310, prob = 26768, count = 1, notice = true, broadcast = true, hundred = 2339}, --圣·情侣时装(男) 
						{itemid = 2311, prob = 26668, count = 1, notice = true, broadcast = true, hundred = 2329}, --圣·情侣时装(女) 
						{itemid = 2297, prob = 26568, count = 1, notice = true, broadcast = true, hundred = 2319}, --圣·返璞归真(男) 
						{itemid = 2300, prob = 26468, count = 1, notice = true, broadcast = true, hundred = 2309}, --圣·返璞归真(女) 
						{itemid = 2327, prob = 26368, count = 1, notice = true, broadcast = true, hundred = 2305}, --圣·新春时装(男)
						{itemid = 2328, prob = 26268, count = 1, notice = true, broadcast = true, hundred = 2300}, --圣·新春时装(女) 
						{itemid = 2290, prob = 26168, count = 1, notice = true, broadcast = true, hundred = 1888}, --圣·棒棒糖
						{itemid = 2306, prob = 26068, count = 1, notice = true, broadcast = true, hundred = 1887}, --圣·玫瑰花 
						{itemid = 2303, prob = 26066, count = 1, notice = true, broadcast = true, hundred = 1886}, --圣·反璞归真

						{itemid = 2887, prob = 12888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世之刃  
						{itemid = 2888, prob = 11888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世之甲
						{itemid = 2889, prob = 5888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世头盔
						{itemid = 2890, prob = 5888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世项链
						{itemid = 2891, prob = 5888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世手镯
						{itemid = 2892, prob = 5888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世戒指
						{itemid = 2893, prob = 5888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世靴子
						{itemid = 2894, prob = 5888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世腰带

						{itemid = 1159, prob = 6568, count = 1, notice = true, hundred = 16568}, --6转首饰
						{itemid = 1217, prob = 6567, count = 1, notice = true, hundred = 16567}, --6转首饰
						{itemid = 1275, prob = 6566, count = 1, notice = true, hundred = 16566}, --6转首饰
						{itemid = 1333, prob = 6565, count = 1, notice = true, hundred = 16565}, --6转首饰
						{itemid = 1391, prob = 6564, count = 1, notice = true, hundred = 16564}, --6转首饰
						{itemid = 1449, prob = 6563, count = 1, notice = true, hundred = 16563}, --6转首饰

						{itemid = 1159, prob = 6568, count = 1, notice = true, hundred = 16568}, --6转首饰
						{itemid = 1217, prob = 6567, count = 1, notice = true, hundred = 16567}, --6转首饰
						{itemid = 1275, prob = 6566, count = 1, notice = true, hundred = 16566}, --6转首饰
						{itemid = 1333, prob = 6565, count = 1, notice = true, hundred = 16565}, --6转首饰
						{itemid = 1391, prob = 6564, count = 1, notice = true, hundred = 16564}, --6转首饰
						{itemid = 1449, prob = 6563, count = 1, notice = true, hundred = 16563}, --6转首饰

						{itemid = 1159, prob = 6568, count = 1, notice = true, hundred = 16568}, --6转首饰
						{itemid = 1217, prob = 6567, count = 1, notice = true, hundred = 16567}, --6转首饰
						{itemid = 1275, prob = 6566, count = 1, notice = true, hundred = 16566}, --6转首饰
						{itemid = 1333, prob = 6565, count = 1, notice = true, hundred = 16565}, --6转首饰
						{itemid = 1391, prob = 6564, count = 1, notice = true, hundred = 16564}, --6转首饰
						{itemid = 1449, prob = 6563, count = 1, notice = true, hundred = 16563}, --6转首饰

						{itemid = 982 , prob = 12588, count = 1, notice = true, hundred = 12588}, --天武神剑    
						{itemid = 1051, prob = 12888, count = 1, notice = true, hundred = 12888}, --天武神甲(男)
						{itemid = 1052, prob = 12878, count = 1, notice = true, hundred = 12878}, --天武神甲(女)

						{itemid = 2209, prob = 16888, count = 1, notice = true, hundred = 16888}, --盾牌碎片(特)
						{itemid = 2213, prob = 16887, count = 1, notice = true, hundred = 16887}, --宝石碎片(特)
						{itemid = 2217, prob = 16886, count = 1, notice = true, hundred = 16886}, --魂珠碎片(特)
						{itemid = 566 , prob = 16885, count = 1, notice = true, hundred = 16885}, --超级转生丹  
						{itemid = 163 , prob = 16884, count = 1, notice = true, hundred = 16884}, --超级成就令牌
						{itemid = 162 , prob = 16883, count = 1, notice = true, hundred = 16883}, --超级灵力丹  
						{itemid = 675 , prob = 16882, count = 1, notice = true, hundred = 16882}, --999朵玫瑰花 
						{itemid = 528 , prob = 16881, count = 1, notice = true, hundred = 16881}, --特戒碎片包  
						{itemid = 2225, prob = 16880, count = 1, notice = true, hundred = 16880}, --护符碎片(特)

						{itemid = 3007, prob = 3207, count = 1, notice = true, broadcast = true, hundred = 3839}, --龙行天下 
						{itemid = 3008, prob = 3208, count = 1, notice = true, broadcast = true, hundred = 3829}, --如影随形 
						{itemid = 3009, prob = 3209, count = 1, notice = true, broadcast = true, hundred = 3819}, --双龙出海 
						{itemid = 3010, prob = 3210, count = 1, notice = true, broadcast = true, hundred = 3809}, --丘比特   
						{itemid = 3011, prob = 3211, count = 1, notice = true, broadcast = true, hundred = 3805}, --神龙开道 
						{itemid = 3012, prob = 3212, count = 1, notice = true, broadcast = true, hundred = 3800}, --冰火之歌 
						{itemid = 3013, prob = 3213, count = 1, notice = true, broadcast = true, hundred = 3088}, --弥勒笑佛
						{itemid = 3014, prob = 3214, count = 1, notice = true, broadcast = true, hundred = 3087}, --熊二快跑

						{itemid = 1158, prob = 3288, count = 1, notice = true, hundred = 8888},	--4转首饰
						{itemid = 1216, prob = 3278, count = 1, notice = true, hundred = 8878},	--4转首饰
						{itemid = 1274, prob = 3268, count = 1, notice = true, hundred = 8868},	--4转首饰
						{itemid = 1332, prob = 3258, count = 1, notice = true, hundred = 8858},	--4转首饰
						{itemid = 1390, prob = 3248, count = 1, notice = true, hundred = 8848},	--4转首饰
						{itemid = 1448, prob = 3238, count = 1, notice = true, hundred = 8838},	--4转首饰

						{itemid = 1158, prob = 3288, count = 1, notice = true, hundred = 8888},	--4转首饰
						{itemid = 1216, prob = 3278, count = 1, notice = true, hundred = 8878},	--4转首饰
						{itemid = 1274, prob = 3268, count = 1, notice = true, hundred = 8868},	--4转首饰
						{itemid = 1332, prob = 3258, count = 1, notice = true, hundred = 8858},	--4转首饰
						{itemid = 1390, prob = 3248, count = 1, notice = true, hundred = 8848},	--4转首饰
						{itemid = 1448, prob = 3238, count = 1, notice = true, hundred = 8838},	--4转首饰

						{itemid = 1158, prob = 3288, count = 1, notice = true, hundred = 8888},	--4转首饰
						{itemid = 1216, prob = 3278, count = 1, notice = true, hundred = 8878},	--4转首饰
						{itemid = 1274, prob = 3268, count = 1, notice = true, hundred = 8868},	--4转首饰
						{itemid = 1332, prob = 3258, count = 1, notice = true, hundred = 8858},	--4转首饰
						{itemid = 1390, prob = 3248, count = 1, notice = true, hundred = 8848},	--4转首饰
						{itemid = 1448, prob = 3238, count = 1, notice = true, hundred = 8838},	--4转首饰

						{itemid = 1158, prob = 3288, count = 1, notice = true, hundred = 8888},	--4转首饰
						{itemid = 1216, prob = 3278, count = 1, notice = true, hundred = 8878},	--4转首饰
						{itemid = 1274, prob = 3268, count = 1, notice = true, hundred = 8868},	--4转首饰
						{itemid = 1332, prob = 3258, count = 1, notice = true, hundred = 8858},	--4转首饰
						{itemid = 1390, prob = 3248, count = 1, notice = true, hundred = 8848},	--4转首饰
						{itemid = 1448, prob = 3238, count = 1, notice = true, hundred = 8838},	--4转首饰

						{itemid = 2635, prob = 9099, count = 1, notice = true, broadcast = true, hundred = 3289}, --青龙阵石 
						{itemid = 2636, prob = 9089, count = 1, notice = true, broadcast = true, hundred = 3289}, --白虎阵石 
						{itemid = 2637, prob = 9079, count = 1, notice = true, broadcast = true, hundred = 3279}, --朱雀阵石 
						{itemid = 2638, prob = 9069, count = 1, notice = true, broadcast = true, hundred = 3269}, --玄武阵石
	
						{itemid = 1940, prob = 988, count = 1, notice = true, hundred = 8888},	--五级羽毛
						{itemid = 1941, prob = 988, count = 1, notice = true, broadcast = true, hundred = 3289}, --六级羽毛 

						{itemid = 636 , prob = 2989, count = 1, notice = true, broadcast = true, hundred = 3289}, --马鞍 
						{itemid = 624 , prob = 2988, count = 1, notice = true, broadcast = true, hundred = 3289}, --蹄铁 
						{itemid = 628 , prob = 2987, count = 1, notice = true, broadcast = true, hundred = 3279}, --缰绳 
						{itemid = 632 , prob = 2986, count = 1, notice = true, broadcast = true, hundred = 3269}, --马镫

						{itemid = 640 , prob = 2889, count = 1, notice = true, broadcast = true, hundred = 3289}, --银光闪豹 
						{itemid = 641 , prob = 2879, count = 1, notice = true, broadcast = true, hundred = 3279}, --万圣战轮 
						{itemid = 642 , prob = 2869, count = 1, notice = true, broadcast = true, hundred = 3269}, --蒸朋怒鲨
						{itemid = 643 , prob = 2889, count = 1, notice = true, broadcast = true, hundred = 3289}, --百鸟朝凤 

						{itemid = 588 , prob = 3089, count = 1, notice = true, broadcast = true, hundred = 3289}, --关羽时装 
						{itemid = 592 , prob = 3079, count = 1, notice = true, broadcast = true, hundred = 3279}, --赵云时装 
						{itemid = 596 , prob = 3069, count = 1, notice = true, broadcast = true, hundred = 3269}, --吕布时装
						{itemid = 612 , prob = 3089, count = 1, notice = true, broadcast = true, hundred = 3289}, --大乔时装 
						{itemid = 616 , prob = 3079, count = 1, notice = true, broadcast = true, hundred = 3279}, --小乔时装 
						{itemid = 620 , prob = 3069, count = 1, notice = true, broadcast = true, hundred = 3269}, --貂蝉时装

						{itemid = 600 , prob = 2889, count = 1, notice = true, broadcast = true, hundred = 3289}, --青龙偃月刀 
						{itemid = 604 , prob = 2879, count = 1, notice = true, broadcast = true, hundred = 3279}, --百鸟朝凤枪 
						{itemid = 608 , prob = 2869, count = 1, notice = true, broadcast = true, hundred = 3269}, --方天画戟

						{itemid = 492 , prob = 3239, count = 1, notice = true, broadcast = true, hundred = 3839}, --返璞归真 
						{itemid = 493 , prob = 3229, count = 1, notice = true, broadcast = true, hundred = 3829}, --鸾凤和鸣 
						{itemid = 494 , prob = 3219, count = 1, notice = true, broadcast = true, hundred = 3819}, --双龙出海 
						{itemid = 495 , prob = 3209, count = 1, notice = true, broadcast = true, hundred = 3809}, --紫翼东升 

						{itemid = 341 , prob = 2839, count = 1, notice = true, broadcast = true, hundred = 3839}, --法老服饰(男) 
						{itemid = 342 , prob = 2829, count = 1, notice = true, broadcast = true, hundred = 3829}, --法老服饰(女) 
						{itemid = 350 , prob = 2819, count = 1, notice = true, broadcast = true, hundred = 3819}, --拳击战服(男) 
						{itemid = 351 , prob = 2809, count = 1, notice = true, broadcast = true, hundred = 3809}, --拳击战服(女) 
						{itemid = 2319, prob = 2805, count = 1, notice = true, broadcast = true, hundred = 3805}, --菊花一锦(男) 
						{itemid = 2320, prob = 2800, count = 1, notice = true, broadcast = true, hundred = 3800}, --菊花一锦(女) 
						{itemid = 2316, prob = 2788, count = 1, notice = true, broadcast = true, hundred = 3088}, --菊花
						{itemid = 338 , prob = 2787, count = 1, notice = true, broadcast = true, hundred = 3087}, --法老权杖 
						{itemid = 347 , prob = 2786, count = 1, notice = true, broadcast = true, hundred = 3086}, --拳击暴雷

						{itemid = 327, prob = 2588, count = 1, notice = true, broadcast = true, hundred = 2588}, --足迹
						{itemid = 328, prob = 2587, count = 1, notice = true, broadcast = true, hundred = 2587}, --足迹
						{itemid = 329, prob = 2586, count = 1, notice = true, broadcast = true, hundred = 2586}, --足迹
						{itemid = 330, prob = 2585, count = 1, notice = true, broadcast = true, hundred = 2585}, --足迹
						{itemid = 331, prob = 2584, count = 1, notice = true, broadcast = true, hundred = 2584}, --足迹
						{itemid = 332, prob = 2583, count = 1, notice = true, broadcast = true, hundred = 2583}, --足迹
						{itemid = 333, prob = 2582, count = 1, notice = true, broadcast = true, hundred = 2582}, --足迹
						{itemid = 334, prob = 2581, count = 1, notice = true, broadcast = true, hundred = 2581}, --足迹 
						{itemid = 335, prob = 2580, count = 1, notice = true, broadcast = true, hundred = 2580}, --足迹

						{itemid = 2156, prob = 2059, count = 1, notice = true, broadcast = true, hundred = 2359}, --新年达人(男) 
						{itemid = 2157, prob = 2049, count = 1, notice = true, broadcast = true, hundred = 2349}, --新年达人(女) 
						{itemid = 2308, prob = 2039, count = 1, notice = true, broadcast = true, hundred = 2339}, --情侣时装(男) 
						{itemid = 2309, prob = 2029, count = 1, notice = true, broadcast = true, hundred = 2329}, --情侣时装(女) 
						{itemid = 2296, prob = 2019, count = 1, notice = true, broadcast = true, hundred = 2319}, --返璞归真(男) 
						{itemid = 2299, prob = 2009, count = 1, notice = true, broadcast = true, hundred = 2309}, --返璞归真(女) 
						{itemid = 2325, prob = 2005, count = 1, notice = true, broadcast = true, hundred = 2305}, --新春时装(男) 
						{itemid = 2326, prob = 2000, count = 1, notice = true, broadcast = true, hundred = 2300}, --新春时装(女) 
						{itemid = 2155, prob = 1688, count = 1, notice = true, broadcast = true, hundred = 1888}, --棒棒糖
						{itemid = 2305, prob = 1687, count = 1, notice = true, broadcast = true, hundred = 1887}, --玫瑰花 
						{itemid = 2302, prob = 1686, count = 1, notice = true, broadcast = true, hundred = 1886}, --反璞归真
						{itemid = 2203, prob = 1388, count = 1, notice = true, broadcast = true, hundred = 1688},--神器碎片
						{itemid = 2204, prob = 1388, count = 1, notice = true, broadcast = true, hundred = 1688},--神甲碎片

						{itemid = 1157, prob = 1388, count = 1, notice = true, hundred = 1388}, --2转首饰 
						{itemid = 1215, prob = 1378, count = 1, notice = true, hundred = 1378}, --2转首饰 
						{itemid = 1273, prob = 1368, count = 1, notice = true, hundred = 1368}, --2转首饰 
						{itemid = 1331, prob = 1358, count = 1, notice = true, hundred = 1358}, --2转首饰 
						{itemid = 1389, prob = 1348, count = 1, notice = true, hundred = 1348}, --2转首饰 
						{itemid = 1447, prob = 1338, count = 1, notice = true, hundred = 1338}, --2转首饰 
														     
						{itemid = 1157, prob = 1388, count = 1, notice = true, hundred = 1388}, --2转首饰 
						{itemid = 1215, prob = 1378, count = 1, notice = true, hundred = 1378}, --2转首饰 
						{itemid = 1273, prob = 1368, count = 1, notice = true, hundred = 1368}, --2转首饰 
						{itemid = 1331, prob = 1358, count = 1, notice = true, hundred = 1358}, --2转首饰 
						{itemid = 1389, prob = 1348, count = 1, notice = true, hundred = 1348}, --2转首饰 
						{itemid = 1447, prob = 1338, count = 1, notice = true, hundred = 1338}, --2转首饰 

						{itemid = 1157, prob = 1388, count = 1, notice = true, hundred = 1388}, --2转首饰 
						{itemid = 1215, prob = 1378, count = 1, notice = true, hundred = 1378}, --2转首饰 
						{itemid = 1273, prob = 1368, count = 1, notice = true, hundred = 1368}, --2转首饰 
						{itemid = 1331, prob = 1358, count = 1, notice = true, hundred = 1358}, --2转首饰 
						{itemid = 1389, prob = 1348, count = 1, notice = true, hundred = 1348}, --2转首饰 
						{itemid = 1447, prob = 1338, count = 1, notice = true, hundred = 1338}, --2转首饰 
														     
						{itemid = 1157, prob = 1388, count = 1, notice = true, hundred = 1388}, --2转首饰 
						{itemid = 1215, prob = 1378, count = 1, notice = true, hundred = 1378}, --2转首饰 
						{itemid = 1273, prob = 1368, count = 1, notice = true, hundred = 1368}, --2转首饰 
						{itemid = 1331, prob = 1358, count = 1, notice = true, hundred = 1358}, --2转首饰 
						{itemid = 1389, prob = 1348, count = 1, notice = true, hundred = 1348}, --2转首饰 
						{itemid = 1447, prob = 1338, count = 1, notice = true, hundred = 1338}, --2转首饰 

						{itemid = 981 , prob = 3088, count = 1, notice = true, hundred = 3088}, --轩辕神剑    
						{itemid = 1049, prob = 3090, count = 1, notice = true, hundred = 3090}, --轩辕神甲(男)
						{itemid = 1050, prob = 3080, count = 1, notice = true, hundred = 3080}, --轩辕神甲(女)

						{itemid = 1156, prob = 788, count = 1, notice = true, hundred = 788}, --1转首饰 
						{itemid = 1214, prob = 778, count = 1, notice = true, hundred = 778}, --1转首饰 
						{itemid = 1272, prob = 768, count = 1, notice = true, hundred = 768}, --1转首饰 
						{itemid = 1330, prob = 758, count = 1, notice = true, hundred = 758}, --1转首饰 
						{itemid = 1388, prob = 748, count = 1, notice = true, hundred = 748}, --1转首饰 
						{itemid = 1446, prob = 738, count = 1, notice = true, hundred = 738}, --1转首饰 
														   
						{itemid = 1156, prob = 788, count = 1, notice = true, hundred = 788}, --1转首饰 
						{itemid = 1214, prob = 778, count = 1, notice = true, hundred = 778}, --1转首饰 
						{itemid = 1272, prob = 768, count = 1, notice = true, hundred = 768}, --1转首饰 
						{itemid = 1330, prob = 758, count = 1, notice = true, hundred = 758}, --1转首饰 
						{itemid = 1388, prob = 748, count = 1, notice = true, hundred = 748}, --1转首饰 
						{itemid = 1446, prob = 738, count = 1, notice = true, hundred = 738}, --1转首饰 

						{itemid = 1156, prob = 788, count = 1, notice = true, hundred = 788}, --1转首饰 
						{itemid = 1214, prob = 778, count = 1, notice = true, hundred = 778}, --1转首饰 
						{itemid = 1272, prob = 768, count = 1, notice = true, hundred = 768}, --1转首饰 
						{itemid = 1330, prob = 758, count = 1, notice = true, hundred = 758}, --1转首饰 
						{itemid = 1388, prob = 748, count = 1, notice = true, hundred = 748}, --1转首饰 
						{itemid = 1446, prob = 738, count = 1, notice = true, hundred = 738}, --1转首饰 
														   
						{itemid = 1156, prob = 788, count = 1, notice = true, hundred = 788}, --1转首饰 
						{itemid = 1214, prob = 778, count = 1, notice = true, hundred = 778}, --1转首饰 
						{itemid = 1272, prob = 768, count = 1, notice = true, hundred = 768}, --1转首饰 
						{itemid = 1330, prob = 758, count = 1, notice = true, hundred = 758}, --1转首饰 
						{itemid = 1388, prob = 748, count = 1, notice = true, hundred = 748}, --1转首饰 
						{itemid = 1446, prob = 738, count = 1, notice = true, hundred = 738}, --1转首饰 

						{itemid = 980 , prob = 2288, count = 1, notice = true, hundred = 2088}, --伏虎令剑    
						{itemid = 1047, prob = 2290, count = 1, notice = true, hundred = 2290}, --伏虎战甲(男)
						{itemid = 1048, prob = 2280, count = 1, notice = true, hundred = 2280}, --伏虎战甲(女)

						{itemid = 2210, prob = 698, count = 1, notice = true, hundred = 698}, --盾牌碎片(大)    
						{itemid = 2214, prob = 678, count = 1, notice = true, hundred = 678}, --宝石碎片(大)    
						{itemid = 2218, prob = 668, count = 1, notice = true, hundred = 668}, --魂珠碎片(大)    
						{itemid = 565 , prob = 688, count = 1, notice = true, hundred = 688}, --高级转生丹      
						{itemid = 145 , prob = 698, count = 1, notice = true, hundred = 698}, --高级成就令牌    
						{itemid = 161 , prob = 678, count = 1, notice = true, hundred = 678}, --高级灵力丹      
						{itemid = 674 , prob = 668, count = 1, notice = true, hundred = 668}, --99朵玫瑰花      
						{itemid = 849 , prob = 658, count = 1, notice = true, hundred = 658}, --五倍经验(2小时) 
						{itemid = 2111, prob = 618, count = 1, notice = true, hundred = 618}, --二级暴击宝石    
						{itemid = 160 , prob = 388, count = 1, notice = true, hundred = 388},  --灵力丹(大)      
						{itemid = 527 , prob = 386, count = 1, notice = true, hundred = 386},  --特戒碎片        
						{itemid = 2226, prob = 885, count = 1, notice = true, hundred = 885}, --护符碎片(大)      

						{itemid = 979 , prob = 828, count = 1, notice = true,  hundred = 828}, --修罗之刃      
						{itemid = 1045, prob = 828, count = 1, notice = true,  hundred = 828}, --修罗战甲(男)  
						{itemid = 1046, prob = 828, count = 1, notice = true,  hundred = 828}, --修罗战甲(女)  

						{itemid = 2123, prob = 2638, count = 1, notice = false, hundred = 238}, --子鼠玉佩  
						{itemid = 2124, prob = 2638, count = 1, notice = false, hundred = 237}, --丑牛玉佩  
						{itemid = 2125, prob = 2638, count = 1, notice = false, hundred = 236}, --寅虎玉佩  
						{itemid = 2126, prob = 2638, count = 1, notice = false, hundred = 235}, --卯兔玉佩  
						{itemid = 2127, prob = 2638, count = 1, notice = false, hundred = 234}, --辰龙玉佩  
						{itemid = 2128, prob = 2638, count = 1, notice = false, hundred = 233}, --巳蛇玉佩 
						{itemid = 2129, prob = 2638, count = 1, notice = false, hundred = 238}, --午马玉佩  
						{itemid = 2130, prob = 2638, count = 1, notice = false, hundred = 237}, --未羊玉佩  
						{itemid = 2131, prob = 2638, count = 1, notice = false, hundred = 236}, --申猴玉佩  
						{itemid = 2132, prob = 2638, count = 1, notice = false, hundred = 235}, --酉鸡玉佩  
						{itemid = 2133, prob = 2638, count = 1, notice = false, hundred = 234}, --戌狗玉佩  
						{itemid = 2134, prob = 2638, count = 1, notice = false, hundred = 233}, --亥猪玉佩 

						{itemid = 1155, prob = 108, count = 1, notice = false, hundred = 108}, --90级首饰  
						{itemid = 1213, prob = 107, count = 1, notice = false, hundred = 107}, --90级首饰  
						{itemid = 1271, prob = 106, count = 1, notice = false, hundred = 106}, --90级首饰  
						{itemid = 1329, prob = 105, count = 1, notice = false, hundred = 105}, --90级首饰  
						{itemid = 1387, prob = 104, count = 1, notice = false, hundred = 104}, --90级首饰  
						{itemid = 1445, prob = 103, count = 1, notice = false, hundred = 103}, --90级首饰 

						{itemid = 1155, prob = 108, count = 1, notice = false, hundred = 108}, --90级首饰  
						{itemid = 1213, prob = 107, count = 1, notice = false, hundred = 107}, --90级首饰  
						{itemid = 1271, prob = 106, count = 1, notice = false, hundred = 106}, --90级首饰  
						{itemid = 1329, prob = 105, count = 1, notice = false, hundred = 105}, --90级首饰  
						{itemid = 1387, prob = 104, count = 1, notice = false, hundred = 104}, --90级首饰  
						{itemid = 1445, prob = 103, count = 1, notice = false, hundred = 103}, --90级首饰 

						{itemid = 2197, prob = 18, count = 1, notice = false, hundred = 18},    --典
						{itemid = 2196, prob = 17, count = 1, notice = false, hundred = 17},    --庆
						{itemid = 2195, prob = 16, count = 1, notice = false, hundred = 16},    --服
						{itemid = 2193, prob = 15, count = 1, notice = false, hundred = 15},    --千
						{itemid = 2886, prob = 16, count = 1, notice = false, hundred = 14}, --传世宝钻 
						{itemid = 841, prob = 30, count = 1, notice = false, hundred = 10}, --圣兽灵石 
						{itemid = 818 , prob = 4 , count = 1, notice = false, hundred = 1 }, --英雄经验丹  
						{itemid = 513 , prob = 1 , count = 1, notice = false, hundred = 1 }, --经验丹(大)   
					},
				},
			},
			--法师
			{
				{
					money = 3000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 8,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1178, prob = 11, count = 1, notice = true, hundred = 11},
						{itemid = 1236, prob = 9 , count = 1, notice = true, hundred = 9 },
						{itemid = 1294, prob = 8 , count = 1, notice = true, hundred = 8 },
						{itemid = 1352, prob = 8 , count = 1, notice = true, hundred = 8 },
						{itemid = 1410, prob = 8 , count = 1, notice = true, hundred = 8 },
						{itemid = 1468, prob = 7 , count = 1, notice = true, hundred = 7 },
					},
				},
				{
					money = 10000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 8,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1178, prob = 11, count = 1, notice = true, hundred = 11},
						{itemid = 1236, prob = 9 , count = 1, notice = true, hundred = 9 },
						{itemid = 1294, prob = 8 , count = 1, notice = true, hundred = 8 },
						{itemid = 1352, prob = 8 , count = 1, notice = true, hundred = 8 },
						{itemid = 1410, prob = 8 , count = 1, notice = true, hundred = 8 },
						{itemid = 1468, prob = 7 , count = 1, notice = true, hundred = 7 },
					},
				},
				{
					money = 30000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 5,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1179, prob = 11, count = 1, notice = true,broadcast = true, hundred = 11},
						{itemid = 1237, prob = 9 , count = 1, notice = true,broadcast = true, hundred = 9 },
						{itemid = 1295, prob = 8 , count = 1, notice = true,broadcast = true, hundred = 8 },
						{itemid = 1353, prob = 8 , count = 1, notice = true,broadcast = true, hundred = 8 },
						{itemid = 1411, prob = 8 , count = 1, notice = true,broadcast = true, hundred = 8 },
						{itemid = 1469, prob = 7 , count = 1, notice = true,broadcast = true, hundred = 7 },
					},
				},
				{
					money = 60000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1178, prob = 11, count = 1, notice = true, hundred = 11},
						{itemid = 1236, prob = 9 , count = 1, notice = true, hundred = 9 },
						{itemid = 1294, prob = 8 , count = 1, notice = true, hundred = 8 },
						{itemid = 1352, prob = 8 , count = 1, notice = true, hundred = 8 },
						{itemid = 1410, prob = 8 , count = 1, notice = true, hundred = 8 },
						{itemid = 1468, prob = 7 , count = 1, notice = true, hundred = 7 },
					},
				},
				{
					money = 90000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 15,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1179, prob = 11, count = 1, notice = true,broadcast = true, hundred = 11},
						{itemid = 1237, prob = 9 , count = 1, notice = true,broadcast = true, hundred = 9 },
						{itemid = 1295, prob = 8 , count = 1, notice = true,broadcast = true, hundred = 8 },
						{itemid = 1353, prob = 8 , count = 1, notice = true,broadcast = true, hundred = 8 },
						{itemid = 1411, prob = 8 , count = 1, notice = true,broadcast = true, hundred = 8 },
						{itemid = 1469, prob = 7 , count = 1, notice = true,broadcast = true, hundred = 7 },
					},
				},
				{
					money = 120000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1178, prob = 11, count = 1, notice = true, hundred = 11},
						{itemid = 1236, prob = 9 , count = 1, notice = true, hundred = 9 },
						{itemid = 1294, prob = 8 , count = 1, notice = true, hundred = 8 },
						{itemid = 1352, prob = 8 , count = 1, notice = true, hundred = 8 },
						{itemid = 1410, prob = 8 , count = 1, notice = true, hundred = 8 },
						{itemid = 1468, prob = 7 , count = 1, notice = true, hundred = 7 },
					},
				},
				{
					money = 150000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 15,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1179, prob = 11, count = 1, notice = true, broadcast = true, hundred = 11}, --8转首饰
						{itemid = 1237, prob = 9 , count = 1, notice = true, broadcast = true, hundred = 9 }, --8转首饰
						{itemid = 1295, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1353, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1411, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1469, prob = 7 , count = 1, notice = true, broadcast = true, hundred = 7 }, --8转首饰
					},
				},
				{
					money = 180000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 12,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1180, prob = 11, count = 1, notice = true, broadcast = true, hundred = 11}, --10转首饰
						{itemid = 1238, prob = 9 , count = 1, notice = true, broadcast = true, hundred = 9}, --10转首饰
						{itemid = 1296, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8}, --10转首饰
						{itemid = 1354, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8}, --10转首饰
						{itemid = 1412, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8}, --10转首饰
						{itemid = 1470, prob = 7 , count = 1, notice = true, broadcast = true, hundred = 7}, --10转首饰
					},
				},
				{
					count = 200,	--寻宝次数大于此值才会进入
					maxcount = 250,	--寻宝次数等于此值必定进入
					limit = 1,		--限制进入次数,-1为不限制
					prob = 5,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 2201, prob = 26, count = 1, notice = true, hundred = 26},  --欢
						{itemid = 2200, prob = 10, count = 1, notice = true, hundred = 10},  --狂
						{itemid = 2199, prob = 3 , count = 1, notice = true, hundred = 3},   --民
						{itemid = 2198, prob = 1 , count = 1, notice = true, hundred = 1},   --全
					},
				},
				{
					money = 0,	--寻宝花费数大于此值才会进入此表
					limit = -1,		--限制进入次数,-1为不限制
					prob = 1,

					--道具列表
					items = 
					{
						--id,概率,数量,广播

						{itemid = 2110, prob = 25888, count = 1, notice = false, hundred = 25888}, --一级暴击宝石 
						{itemid = 2110, prob = 25888, count = 1, notice = false, hundred = 25888}, --一级暴击宝石 
						{itemid = 2276, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 25888}, --铁血武器        
						{itemid = 2277, prob = 25668, count = 1, notice = true, broadcast = true, hundred = 25668}, --铁血衣服(男)
						{itemid = 2284, prob = 25588, count = 1, notice = true, broadcast = true, hundred = 25588}, --铁血衣服(女)

						{itemid = 2344, prob = 15288, count = 1, notice = true, hundred = 6888}, --傲视狂舞斩(英雄)    
						{itemid = 2354, prob = 15188, count = 1, notice = true, hundred = 6888}, --乾坤降魔杖(英雄)    
						{itemid = 2364, prob = 15088, count = 1, notice = true, hundred = 6888}, --紫金龙皇剑(英雄)    
						{itemid = 2380, prob = 15088, count = 1, notice = true, hundred = 6888}, --傲视狂舞甲(男)(英雄)
						{itemid = 2381, prob = 15088, count = 1, notice = true, hundred = 6888}, --傲视狂舞甲(女)(英雄)
						{itemid = 2400, prob = 15088, count = 1, notice = true, hundred = 6888}, --乾坤降魔衣(男)(英雄)
						{itemid = 2401, prob = 15088, count = 1, notice = true, hundred = 6888}, --乾坤降魔衣(女)(英雄)
						{itemid = 2420, prob = 15088, count = 1, notice = true, hundred = 6888}, --紫金龙皇甲(男)(英雄)
						{itemid = 2421, prob = 15088, count = 1, notice = true, hundred = 6888}, --紫金龙皇甲(女)(英雄)

						{itemid = 2345, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙战剑(英雄)      
						{itemid = 2355, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙魔杖(英雄)    
						{itemid = 2365, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙宝剑(英雄)    
						{itemid = 2382, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙战甲(男)(英雄)
						{itemid = 2383, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙战甲(女)(英雄)
						{itemid = 2402, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙魔衣(男)(英雄)
						{itemid = 2403, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙魔衣(女)(英雄)
						{itemid = 2422, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙道袍(男)(英雄)
						{itemid = 2423, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙道袍(女)(英雄)

						{itemid = 2346, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王战剑(英雄)     
						{itemid = 2356, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王魔杖(英雄)    
						{itemid = 2366, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王道剑(英雄)    
						{itemid = 2384, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王战甲(男)(英雄)
						{itemid = 2385, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王战甲(女)(英雄)
						{itemid = 2404, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王魔衣(男)(英雄)
						{itemid = 2405, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王魔衣(女)(英雄)
						{itemid = 2424, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王道袍(男)(英雄)
						{itemid = 2425, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王道袍(女)(英雄)

						{itemid = 1298, prob = 41588, count = 1, notice = true, broadcast = true, hundred = 32888}, --杀神法镯    
						{itemid = 1356, prob = 41888, count = 1, notice = true, broadcast = true, hundred = 32888}, --杀神法戒
						{itemid = 1182, prob = 42585, count = 1, notice = true, broadcast = true, hundred = 32585}, --杀神法盔
						{itemid = 1240, prob = 42688, count = 1, notice = true, broadcast = true, hundred = 32888}, --杀神法链    
						{itemid = 1414, prob = 42988, count = 1, notice = true, broadcast = true, hundred = 32888}, --杀神法带
						{itemid = 1472, prob = 42885, count = 1, notice = true, broadcast = true, hundred = 32585}, --杀神法靴

						{itemid = 765, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 59888}, --神之斩    
						{itemid = 766, prob = 35888, count = 1, notice = true, broadcast = true, hundred = 58888}, --神之甲
						{itemid = 767, prob = 28585, count = 1, notice = true, broadcast = true, hundred = 58585}, --神之盔
						{itemid = 768, prob = 28881, count = 1, notice = true, broadcast = true, hundred = 59888}, --神之链    
						{itemid = 769, prob = 28882, count = 1, notice = true, broadcast = true, hundred = 58888}, --神之镯
						{itemid = 770, prob = 28585, count = 1, notice = true, broadcast = true, hundred = 58585}, --神之戒
						{itemid = 771, prob = 28883, count = 1, notice = true, broadcast = true, hundred = 59888}, --神之带    
						{itemid = 772, prob = 28988, count = 1, notice = true, broadcast = true, hundred = 59888}, --神之靴

						{itemid = 1006, prob = 39888, count = 1, notice = true, broadcast = true, hundred = 59888}, --至尊杀神杖        
						{itemid = 1099, prob = 35888, count = 1, notice = true, broadcast = true, hundred = 58888}, --至尊杀神披风(男)
						{itemid = 1100, prob = 35585, count = 1, notice = true, broadcast = true, hundred = 58585}, --至尊杀神披风(女)

						{itemid = 1005, prob = 32888, count = 1, notice = true, broadcast = true, hundred = 59888}, --杀神之杖        
						{itemid = 1097, prob = 31888, count = 1, notice = true, broadcast = true, hundred = 58888}, --杀神披风(男)
						{itemid = 1098, prob = 31585, count = 1, notice = true, broadcast = true, hundred = 58585}, --杀神披风(女)

						{itemid = 1003, prob = 159888, count = 1, notice = true, broadcast = true, hundred = 59888}, --8转武器    
						{itemid = 1093, prob = 158888, count = 1, notice = true, broadcast = true, hundred = 58888}, --8转衣服(男)
						{itemid = 1094, prob = 158585, count = 1, notice = true, broadcast = true, hundred = 58585}, --8转衣服(女)

						{itemid = 1002, prob = 39888, count = 1, notice = true, broadcast = true, hundred = 39888}, --傲视狂舞斩    
						{itemid = 1091, prob = 38888, count = 1, notice = true, broadcast = true, hundred = 38888}, --傲视狂舞甲(男)
						{itemid = 1092, prob = 38585, count = 1, notice = true, broadcast = true, hundred = 38585}, --傲视狂舞甲(女)

						{itemid = 1297, prob = 21588, count = 1, notice = true, broadcast = true, hundred = 32888}, --杀神法镯    
						{itemid = 1355, prob = 21888, count = 1, notice = true, broadcast = true, hundred = 32888}, --杀神法戒
						{itemid = 1181, prob = 22585, count = 1, notice = true, broadcast = true, hundred = 32585}, --杀神法盔
						{itemid = 1239, prob = 22688, count = 1, notice = true, broadcast = true, hundred = 32888}, --杀神法链    
						{itemid = 1413, prob = 22988, count = 1, notice = true, broadcast = true, hundred = 32888}, --杀神法带
						{itemid = 1471, prob = 22885, count = 1, notice = true, broadcast = true, hundred = 32585}, --杀神法靴

						{itemid = 1180, prob = 42888, count = 1, notice = true, broadcast = true, hundred = 32888}, --10转首饰    
						{itemid = 1238, prob = 42888, count = 1, notice = true, broadcast = true, hundred = 32888}, --10转首饰
						{itemid = 1296, prob = 42585, count = 1, notice = true, broadcast = true, hundred = 32585}, --10转首饰
						{itemid = 1354, prob = 42888, count = 1, notice = true, broadcast = true, hundred = 32888}, --10转首饰    
						{itemid = 1412, prob = 42888, count = 1, notice = true, broadcast = true, hundred = 32888}, --10转首饰
						{itemid = 1470, prob = 42585, count = 1, notice = true, broadcast = true, hundred = 32585}, --10转首饰

						{itemid = 1179, prob = 22888, count = 1, notice = true, broadcast = true, hundred = 22888}, --8转首饰
						{itemid = 1237, prob = 22888, count = 1, notice = true, broadcast = true, hundred = 22888}, --8转首饰
						{itemid = 1295, prob = 22585, count = 1, notice = true, broadcast = true, hundred = 22585}, --8转首饰
						{itemid = 1353, prob = 22888, count = 1, notice = true, broadcast = true, hundred = 22888}, --8转首饰
						{itemid = 1411, prob = 22888, count = 1, notice = true, broadcast = true, hundred = 22888}, --8转首饰
						{itemid = 1469, prob = 22585, count = 1, notice = true, broadcast = true, hundred = 22585}, --8转首饰

						{itemid = 2291, prob = 26968, count = 1, notice = true, broadcast = true, hundred = 2359}, --圣·新年达人(男) 
						{itemid = 2292, prob = 26868, count = 1, notice = true, broadcast = true, hundred = 2349}, --圣·新年达人(女) 
						{itemid = 2310, prob = 26768, count = 1, notice = true, broadcast = true, hundred = 2339}, --圣·情侣时装(男) 
						{itemid = 2311, prob = 26668, count = 1, notice = true, broadcast = true, hundred = 2329}, --圣·情侣时装(女) 
						{itemid = 2297, prob = 26568, count = 1, notice = true, broadcast = true, hundred = 2319}, --圣·返璞归真(男) 
						{itemid = 2300, prob = 26468, count = 1, notice = true, broadcast = true, hundred = 2309}, --圣·返璞归真(女) 
						{itemid = 2327, prob = 26368, count = 1, notice = true, broadcast = true, hundred = 2305}, --圣·新春时装(男)
						{itemid = 2328, prob = 26268, count = 1, notice = true, broadcast = true, hundred = 2300}, --圣·新春时装(女) 
						{itemid = 2290, prob = 26168, count = 1, notice = true, broadcast = true, hundred = 1888}, --圣·棒棒糖
						{itemid = 2306, prob = 26068, count = 1, notice = true, broadcast = true, hundred = 1887}, --圣·玫瑰花 
						{itemid = 2303, prob = 26066, count = 1, notice = true, broadcast = true, hundred = 1886}, --圣·反璞归真

						{itemid = 2887, prob = 12888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世之刃  
						{itemid = 2888, prob = 11888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世之甲
						{itemid = 2889, prob = 5888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世头盔
						{itemid = 2890, prob = 5888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世项链
						{itemid = 2891, prob = 5888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世手镯
						{itemid = 2892, prob = 5888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世戒指
						{itemid = 2893, prob = 5888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世靴子
						{itemid = 2894, prob = 5888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世腰带

						{itemid = 1178, prob = 6568, count = 1, notice = true, hundred = 16568}, --6转首饰
						{itemid = 1236, prob = 6567, count = 1, notice = true, hundred = 16567}, --6转首饰
						{itemid = 1294, prob = 6566, count = 1, notice = true, hundred = 16566}, --6转首饰
						{itemid = 1352, prob = 6565, count = 1, notice = true, hundred = 16565}, --6转首饰
						{itemid = 1410, prob = 6564, count = 1, notice = true, hundred = 16564}, --6转首饰
						{itemid = 1468, prob = 6563, count = 1, notice = true, hundred = 16563}, --6转首饰

						{itemid = 1178, prob = 6568, count = 1, notice = true, hundred = 16568}, --6转首饰
						{itemid = 1236, prob = 6567, count = 1, notice = true, hundred = 16567}, --6转首饰
						{itemid = 1294, prob = 6566, count = 1, notice = true, hundred = 16566}, --6转首饰
						{itemid = 1352, prob = 6565, count = 1, notice = true, hundred = 16565}, --6转首饰
						{itemid = 1410, prob = 6564, count = 1, notice = true, hundred = 16564}, --6转首饰
						{itemid = 1468, prob = 6563, count = 1, notice = true, hundred = 16563}, --6转首饰

						{itemid = 1178, prob = 6568, count = 1, notice = true, hundred = 16568}, --6转首饰
						{itemid = 1236, prob = 6567, count = 1, notice = true, hundred = 16567}, --6转首饰
						{itemid = 1294, prob = 6566, count = 1, notice = true, hundred = 16566}, --6转首饰
						{itemid = 1352, prob = 6565, count = 1, notice = true, hundred = 16565}, --6转首饰
						{itemid = 1410, prob = 6564, count = 1, notice = true, hundred = 16564}, --6转首饰
						{itemid = 1468, prob = 6563, count = 1, notice = true, hundred = 16563}, --6转首饰

						{itemid = 1001, prob = 12588, count = 1, notice = true, hundred = 12588}, --天武神剑    
						{itemid = 1089, prob = 12888, count = 1, notice = true, hundred = 12888}, --天武神甲(男)
						{itemid = 1090, prob = 12878, count = 1, notice = true, hundred = 12878}, --天武神甲(女)

						{itemid = 2209, prob = 16888, count = 1, notice = true, hundred = 16888}, --盾牌碎片(特)
						{itemid = 2213, prob = 16887, count = 1, notice = true, hundred = 16887}, --宝石碎片(特)
						{itemid = 2217, prob = 16886, count = 1, notice = true, hundred = 16886}, --魂珠碎片(特)
						{itemid = 566 , prob = 16885, count = 1, notice = true, hundred = 16885}, --超级转生丹  
						{itemid = 163 , prob = 16884, count = 1, notice = true, hundred = 16884}, --超级成就令牌
						{itemid = 162 , prob = 16883, count = 1, notice = true, hundred = 16883}, --超级灵力丹  
						{itemid = 675 , prob = 16882, count = 1, notice = true, hundred = 16882}, --999朵玫瑰花 
						{itemid = 528 , prob = 16881, count = 1, notice = true, hundred = 16881}, --特戒碎片包  
						{itemid = 2225, prob = 16880, count = 1, notice = true, hundred = 16880}, --护符碎片(特)

						{itemid = 3007, prob = 3207, count = 1, notice = true, broadcast = true, hundred = 3839}, --龙行天下 
						{itemid = 3008, prob = 3208, count = 1, notice = true, broadcast = true, hundred = 3829}, --如影随形 
						{itemid = 3009, prob = 3209, count = 1, notice = true, broadcast = true, hundred = 3819}, --双龙出海 
						{itemid = 3010, prob = 3210, count = 1, notice = true, broadcast = true, hundred = 3809}, --丘比特   
						{itemid = 3011, prob = 3211, count = 1, notice = true, broadcast = true, hundred = 3805}, --神龙开道 
						{itemid = 3012, prob = 3212, count = 1, notice = true, broadcast = true, hundred = 3800}, --冰火之歌 
						{itemid = 3013, prob = 3213, count = 1, notice = true, broadcast = true, hundred = 3088}, --弥勒笑佛
						{itemid = 3014, prob = 3214, count = 1, notice = true, broadcast = true, hundred = 3087}, --熊二快跑

						{itemid = 1177, prob = 3288, count = 1, notice = true, hundred = 8888}, --4转首饰
						{itemid = 1235, prob = 3278, count = 1, notice = true, hundred = 8878}, --4转首饰
						{itemid = 1293, prob = 3268, count = 1, notice = true, hundred = 8868}, --4转首饰
						{itemid = 1351, prob = 3258, count = 1, notice = true, hundred = 8858}, --4转首饰
						{itemid = 1409, prob = 3248, count = 1, notice = true, hundred = 8848}, --4转首饰
						{itemid = 1467, prob = 3238, count = 1, notice = true, hundred = 8838}, --4转首饰
								        
						{itemid = 1177, prob = 3288, count = 1, notice = true, hundred = 8888}, --4转首饰
						{itemid = 1235, prob = 3278, count = 1, notice = true, hundred = 8878}, --4转首饰
						{itemid = 1293, prob = 3268, count = 1, notice = true, hundred = 8868}, --4转首饰
						{itemid = 1351, prob = 3258, count = 1, notice = true, hundred = 8858}, --4转首饰
						{itemid = 1409, prob = 3248, count = 1, notice = true, hundred = 8848}, --4转首饰
						{itemid = 1467, prob = 3238, count = 1, notice = true, hundred = 8838}, --4转首饰
								        
						{itemid = 1177, prob = 3288, count = 1, notice = true, hundred = 8888}, --4转首饰
						{itemid = 1235, prob = 3278, count = 1, notice = true, hundred = 8878}, --4转首饰
						{itemid = 1293, prob = 3268, count = 1, notice = true, hundred = 8868}, --4转首饰
						{itemid = 1351, prob = 3258, count = 1, notice = true, hundred = 8858}, --4转首饰
						{itemid = 1409, prob = 3248, count = 1, notice = true, hundred = 8848}, --4转首饰
						{itemid = 1467, prob = 3238, count = 1, notice = true, hundred = 8838}, --4转首饰
								        
						{itemid = 1177, prob = 3288, count = 1, notice = true, hundred = 8888}, --4转首饰
						{itemid = 1235, prob = 3278, count = 1, notice = true, hundred = 8878}, --4转首饰
						{itemid = 1293, prob = 3268, count = 1, notice = true, hundred = 8868}, --4转首饰
						{itemid = 1351, prob = 3258, count = 1, notice = true, hundred = 8858}, --4转首饰
						{itemid = 1409, prob = 3248, count = 1, notice = true, hundred = 8848}, --4转首饰
						{itemid = 1467, prob = 3238, count = 1, notice = true, hundred = 8838}, --4转首饰

						{itemid = 2635, prob = 9099, count = 1, notice = true, broadcast = true, hundred = 3289}, --青龙阵石 
						{itemid = 2636, prob = 9089, count = 1, notice = true, broadcast = true, hundred = 3289}, --白虎阵石 
						{itemid = 2637, prob = 9079, count = 1, notice = true, broadcast = true, hundred = 3279}, --朱雀阵石 
						{itemid = 2638, prob = 9069, count = 1, notice = true, broadcast = true, hundred = 3269}, --玄武阵石
	
						{itemid = 1940, prob = 988, count = 1, notice = true, hundred = 8888},	--五级羽毛
						{itemid = 1941, prob = 988, count = 1, notice = true, broadcast = true, hundred = 3289}, --六级羽毛 

						{itemid = 636 , prob = 2989, count = 1, notice = true, broadcast = true, hundred = 3289}, --马鞍 
						{itemid = 624 , prob = 2988, count = 1, notice = true, broadcast = true, hundred = 3289}, --蹄铁 
						{itemid = 628 , prob = 2987, count = 1, notice = true, broadcast = true, hundred = 3279}, --缰绳 
						{itemid = 632 , prob = 2986, count = 1, notice = true, broadcast = true, hundred = 3269}, --马镫

						{itemid = 640 , prob = 2889, count = 1, notice = true, broadcast = true, hundred = 3289}, --银光闪豹 
						{itemid = 641 , prob = 2879, count = 1, notice = true, broadcast = true, hundred = 3279}, --万圣战轮 
						{itemid = 642 , prob = 2869, count = 1, notice = true, broadcast = true, hundred = 3269}, --蒸朋怒鲨
						{itemid = 643 , prob = 2889, count = 1, notice = true, broadcast = true, hundred = 3289}, --百鸟朝凤 

						{itemid = 588 , prob = 3089, count = 1, notice = true, broadcast = true, hundred = 3289}, --关羽时装 
						{itemid = 592 , prob = 3079, count = 1, notice = true, broadcast = true, hundred = 3279}, --赵云时装 
						{itemid = 596 , prob = 3069, count = 1, notice = true, broadcast = true, hundred = 3269}, --吕布时装
						{itemid = 612 , prob = 3089, count = 1, notice = true, broadcast = true, hundred = 3289}, --大乔时装 
						{itemid = 616 , prob = 3079, count = 1, notice = true, broadcast = true, hundred = 3279}, --小乔时装 
						{itemid = 620 , prob = 3069, count = 1, notice = true, broadcast = true, hundred = 3269}, --貂蝉时装

						{itemid = 600 , prob = 2889, count = 1, notice = true, broadcast = true, hundred = 3289}, --青龙偃月刀 
						{itemid = 604 , prob = 2879, count = 1, notice = true, broadcast = true, hundred = 3279}, --百鸟朝凤枪 
						{itemid = 608 , prob = 2869, count = 1, notice = true, broadcast = true, hundred = 3269}, --方天画戟

						{itemid = 492 , prob = 3239, count = 1, notice = true, broadcast = true, hundred = 3839}, --返璞归真 
						{itemid = 493 , prob = 3229, count = 1, notice = true, broadcast = true, hundred = 3829}, --鸾凤和鸣 
						{itemid = 494 , prob = 3219, count = 1, notice = true, broadcast = true, hundred = 3819}, --双龙出海 
						{itemid = 495 , prob = 3209, count = 1, notice = true, broadcast = true, hundred = 3809}, --紫翼东升 

						{itemid = 341 , prob = 2839, count = 1, notice = true, broadcast = true, hundred = 3839}, --法老服饰(男) 
						{itemid = 342 , prob = 2829, count = 1, notice = true, broadcast = true, hundred = 3829}, --法老服饰(女) 
						{itemid = 350 , prob = 2819, count = 1, notice = true, broadcast = true, hundred = 3819}, --拳击战服(男) 
						{itemid = 351 , prob = 2809, count = 1, notice = true, broadcast = true, hundred = 3809}, --拳击战服(女) 
						{itemid = 2319, prob = 2805, count = 1, notice = true, broadcast = true, hundred = 3805}, --菊花一锦(男) 
						{itemid = 2320, prob = 2800, count = 1, notice = true, broadcast = true, hundred = 3800}, --菊花一锦(女) 
						{itemid = 2316, prob = 2788, count = 1, notice = true, broadcast = true, hundred = 3088}, --菊花
						{itemid = 338 , prob = 2787, count = 1, notice = true, broadcast = true, hundred = 3087}, --法老权杖 
						{itemid = 347 , prob = 2786, count = 1, notice = true, broadcast = true, hundred = 3086}, --拳击暴雷

						{itemid = 327, prob = 2588, count = 1, notice = true, broadcast = true, hundred = 2588}, --足迹
						{itemid = 328, prob = 2587, count = 1, notice = true, broadcast = true, hundred = 2587}, --足迹
						{itemid = 329, prob = 2586, count = 1, notice = true, broadcast = true, hundred = 2586}, --足迹
						{itemid = 330, prob = 2585, count = 1, notice = true, broadcast = true, hundred = 2585}, --足迹
						{itemid = 331, prob = 2584, count = 1, notice = true, broadcast = true, hundred = 2584}, --足迹
						{itemid = 332, prob = 2583, count = 1, notice = true, broadcast = true, hundred = 2583}, --足迹
						{itemid = 333, prob = 2582, count = 1, notice = true, broadcast = true, hundred = 2582}, --足迹
						{itemid = 334, prob = 2581, count = 1, notice = true, broadcast = true, hundred = 2581}, --足迹 
						{itemid = 335, prob = 2580, count = 1, notice = true, broadcast = true, hundred = 2580}, --足迹

						{itemid = 2156, prob = 2059, count = 1, notice = true, broadcast = true, hundred = 2359}, --新年达人(男) 
						{itemid = 2157, prob = 2049, count = 1, notice = true, broadcast = true, hundred = 2349}, --新年达人(女) 
						{itemid = 2308, prob = 2039, count = 1, notice = true, broadcast = true, hundred = 2339}, --情侣时装(男) 
						{itemid = 2309, prob = 2029, count = 1, notice = true, broadcast = true, hundred = 2329}, --情侣时装(女) 
						{itemid = 2296, prob = 2019, count = 1, notice = true, broadcast = true, hundred = 2319}, --返璞归真(男) 
						{itemid = 2299, prob = 2009, count = 1, notice = true, broadcast = true, hundred = 2309}, --返璞归真(女) 
						{itemid = 2325, prob = 2005, count = 1, notice = true, broadcast = true, hundred = 2305}, --新春时装(男) 
						{itemid = 2326, prob = 2000, count = 1, notice = true, broadcast = true, hundred = 2300}, --新春时装(女) 
						{itemid = 2155, prob = 1688, count = 1, notice = true, broadcast = true, hundred = 1888}, --棒棒糖
						{itemid = 2305, prob = 1687, count = 1, notice = true, broadcast = true, hundred = 1887}, --玫瑰花 
						{itemid = 2302, prob = 1686, count = 1, notice = true, broadcast = true, hundred = 1886}, --反璞归真
						{itemid = 2203, prob = 1388, count = 1, notice = true, broadcast = true, hundred = 1688},--神器碎片
						{itemid = 2204, prob = 1388, count = 1, notice = true, broadcast = true, hundred = 1688},--神甲碎片

						{itemid = 1176, prob = 1388, count = 1, notice = true, hundred = 1388}, --2转首饰 
						{itemid = 1234, prob = 1378, count = 1, notice = true, hundred = 1378}, --2转首饰 
						{itemid = 1292, prob = 1368, count = 1, notice = true, hundred = 1368}, --2转首饰 
						{itemid = 1350, prob = 1358, count = 1, notice = true, hundred = 1358}, --2转首饰 
						{itemid = 1408, prob = 1348, count = 1, notice = true, hundred = 1348}, --2转首饰 
						{itemid = 1466, prob = 1338, count = 1, notice = true, hundred = 1338}, --2转首饰 
														     
						{itemid = 1176, prob = 1388, count = 1, notice = true, hundred = 1388}, --2转首饰
						{itemid = 1234, prob = 1378, count = 1, notice = true, hundred = 1378}, --2转首饰
						{itemid = 1292, prob = 1368, count = 1, notice = true, hundred = 1368}, --2转首饰
						{itemid = 1350, prob = 1358, count = 1, notice = true, hundred = 1358}, --2转首饰
						{itemid = 1408, prob = 1348, count = 1, notice = true, hundred = 1348}, --2转首饰
						{itemid = 1466, prob = 1338, count = 1, notice = true, hundred = 1338}, --2转首饰

						{itemid = 1176, prob = 1388, count = 1, notice = true, hundred = 1388}, --2转首饰 
						{itemid = 1234, prob = 1378, count = 1, notice = true, hundred = 1378}, --2转首饰 
						{itemid = 1292, prob = 1368, count = 1, notice = true, hundred = 1368}, --2转首饰 
						{itemid = 1350, prob = 1358, count = 1, notice = true, hundred = 1358}, --2转首饰 
						{itemid = 1408, prob = 1348, count = 1, notice = true, hundred = 1348}, --2转首饰 
						{itemid = 1466, prob = 1338, count = 1, notice = true, hundred = 1338}, --2转首饰 
														     
						{itemid = 1176, prob = 1388, count = 1, notice = true, hundred = 1388}, --2转首饰
						{itemid = 1234, prob = 1378, count = 1, notice = true, hundred = 1378}, --2转首饰
						{itemid = 1292, prob = 1368, count = 1, notice = true, hundred = 1368}, --2转首饰
						{itemid = 1350, prob = 1358, count = 1, notice = true, hundred = 1358}, --2转首饰
						{itemid = 1408, prob = 1348, count = 1, notice = true, hundred = 1348}, --2转首饰
						{itemid = 1466, prob = 1338, count = 1, notice = true, hundred = 1338}, --2转首饰

						{itemid = 1000, prob = 3088, count = 1, notice = true, hundred = 3088}, --轩辕神剑    
						{itemid = 1087, prob = 3090, count = 1, notice = true, hundred = 3090}, --轩辕神甲(男)
						{itemid = 1088, prob = 3080, count = 1, notice = true, hundred = 3080}, --轩辕神甲(女)

						{itemid = 1175, prob = 788, count = 1, notice = true, hundred = 788}, --1转首饰 
						{itemid = 1233, prob = 778, count = 1, notice = true, hundred = 778}, --1转首饰 
						{itemid = 1291, prob = 768, count = 1, notice = true, hundred = 768}, --1转首饰 
						{itemid = 1349, prob = 758, count = 1, notice = true, hundred = 758}, --1转首饰 
						{itemid = 1407, prob = 748, count = 1, notice = true, hundred = 748}, --1转首饰 
						{itemid = 1465, prob = 738, count = 1, notice = true, hundred = 738}, --1转首饰 
														   
						{itemid = 1175, prob = 788, count = 1, notice = true, hundred = 788}, --1转首饰 
						{itemid = 1233, prob = 778, count = 1, notice = true, hundred = 778}, --1转首饰 
						{itemid = 1291, prob = 768, count = 1, notice = true, hundred = 768}, --1转首饰 
						{itemid = 1349, prob = 758, count = 1, notice = true, hundred = 758}, --1转首饰 
						{itemid = 1407, prob = 748, count = 1, notice = true, hundred = 748}, --1转首饰 
						{itemid = 1465, prob = 738, count = 1, notice = true, hundred = 738}, --1转首饰 

						{itemid = 1175, prob = 788, count = 1, notice = true, hundred = 788}, --1转首饰 
						{itemid = 1233, prob = 778, count = 1, notice = true, hundred = 778}, --1转首饰 
						{itemid = 1291, prob = 768, count = 1, notice = true, hundred = 768}, --1转首饰 
						{itemid = 1349, prob = 758, count = 1, notice = true, hundred = 758}, --1转首饰 
						{itemid = 1407, prob = 748, count = 1, notice = true, hundred = 748}, --1转首饰 
						{itemid = 1465, prob = 738, count = 1, notice = true, hundred = 738}, --1转首饰 
														   
						{itemid = 1175, prob = 788, count = 1, notice = true, hundred = 788}, --1转首饰 
						{itemid = 1233, prob = 778, count = 1, notice = true, hundred = 778}, --1转首饰 
						{itemid = 1291, prob = 768, count = 1, notice = true, hundred = 768}, --1转首饰 
						{itemid = 1349, prob = 758, count = 1, notice = true, hundred = 758}, --1转首饰 
						{itemid = 1407, prob = 748, count = 1, notice = true, hundred = 748}, --1转首饰 
						{itemid = 1465, prob = 738, count = 1, notice = true, hundred = 738}, --1转首饰 

						{itemid = 999 , prob = 2288, count = 1, notice = true, hundred = 2288}, --伏虎令剑    
						{itemid = 1085, prob = 2290, count = 1, notice = true, hundred = 2290}, --伏虎战甲(男)
						{itemid = 1086, prob = 2280, count = 1, notice = true, hundred = 2280}, --伏虎战甲(女)

						{itemid = 2210, prob = 898, count = 1, notice = true, hundred = 898}, --盾牌碎片(大)    
						{itemid = 2214, prob = 878, count = 1, notice = true, hundred = 878}, --宝石碎片(大)    
						{itemid = 2218, prob = 868, count = 1, notice = true, hundred = 868}, --魂珠碎片(大)    
						{itemid = 565 , prob = 888, count = 1, notice = true, hundred = 888}, --高级转生丹      
						{itemid = 145 , prob = 898, count = 1, notice = true, hundred = 898}, --高级成就令牌    
						{itemid = 161 , prob = 878, count = 1, notice = true, hundred = 878}, --高级灵力丹      
						{itemid = 674 , prob = 868, count = 1, notice = true, hundred = 868}, --99朵玫瑰花      
						{itemid = 849 , prob = 858, count = 1, notice = true, hundred = 858}, --五倍经验(2小时) 
						{itemid = 2111, prob = 818, count = 1, notice = true, hundred = 818}, --二级暴击宝石    
						{itemid = 160 , prob = 588, count = 1, notice = true, hundred = 588},  --灵力丹(大)      
						{itemid = 527 , prob = 586, count = 1, notice = true, hundred = 586},  --特戒碎片        
						{itemid = 2226, prob = 885, count = 1, notice = true, hundred = 885}, --护符碎片(大)      

						{itemid = 998 , prob = 828, count = 1, notice = true,  hundred = 828}, --修罗之刃      
						{itemid = 1083, prob = 828, count = 1, notice = true,  hundred = 828}, --修罗战甲(男)  
						{itemid = 1084, prob = 828, count = 1, notice = true,  hundred = 828}, --修罗战甲(女)  

						{itemid = 2123, prob = 2638, count = 1, notice = false, hundred = 238}, --子鼠玉佩  
						{itemid = 2124, prob = 2638, count = 1, notice = false, hundred = 237}, --丑牛玉佩  
						{itemid = 2125, prob = 2638, count = 1, notice = false, hundred = 236}, --寅虎玉佩  
						{itemid = 2126, prob = 2638, count = 1, notice = false, hundred = 235}, --卯兔玉佩  
						{itemid = 2127, prob = 2638, count = 1, notice = false, hundred = 234}, --辰龙玉佩  
						{itemid = 2128, prob = 2638, count = 1, notice = false, hundred = 233}, --巳蛇玉佩 
						{itemid = 2129, prob = 2638, count = 1, notice = false, hundred = 238}, --午马玉佩  
						{itemid = 2130, prob = 2638, count = 1, notice = false, hundred = 237}, --未羊玉佩  
						{itemid = 2131, prob = 2638, count = 1, notice = false, hundred = 236}, --申猴玉佩  
						{itemid = 2132, prob = 2638, count = 1, notice = false, hundred = 235}, --酉鸡玉佩  
						{itemid = 2133, prob = 2638, count = 1, notice = false, hundred = 234}, --戌狗玉佩  
						{itemid = 2134, prob = 2638, count = 1, notice = false, hundred = 233}, --亥猪玉佩 

						{itemid = 1174, prob = 108, count = 1, notice = false, hundred = 108}, --90级首饰  
						{itemid = 1232, prob = 107, count = 1, notice = false, hundred = 107}, --90级首饰  
						{itemid = 1290, prob = 106, count = 1, notice = false, hundred = 106}, --90级首饰  
						{itemid = 1348, prob = 105, count = 1, notice = false, hundred = 105}, --90级首饰  
						{itemid = 1406, prob = 104, count = 1, notice = false, hundred = 104}, --90级首饰  
						{itemid = 1464, prob = 103, count = 1, notice = false, hundred = 103}, --90级首饰 

						{itemid = 1174, prob = 108, count = 1, notice = false, hundred = 108}, --90级首饰  
						{itemid = 1232, prob = 107, count = 1, notice = false, hundred = 107}, --90级首饰  
						{itemid = 1290, prob = 106, count = 1, notice = false, hundred = 106}, --90级首饰  
						{itemid = 1348, prob = 105, count = 1, notice = false, hundred = 105}, --90级首饰  
						{itemid = 1406, prob = 104, count = 1, notice = false, hundred = 104}, --90级首饰  
						{itemid = 1464, prob = 103, count = 1, notice = false, hundred = 103}, --90级首饰 

						{itemid = 2197, prob = 18, count = 1, notice = false, hundred = 18},    --典
						{itemid = 2196, prob = 17, count = 1, notice = false, hundred = 17},    --庆
						{itemid = 2195, prob = 16, count = 1, notice = false, hundred = 16},    --服
						{itemid = 2193, prob = 15, count = 1, notice = false, hundred = 15},    --千
						{itemid = 2886, prob = 16, count = 1, notice = false, hundred = 14}, --传世宝钻 
						{itemid = 841, prob = 30, count = 1, notice = false, hundred = 10}, --圣兽灵石 
						{itemid = 818 , prob = 4 , count = 1, notice = false, hundred = 1 }, --英雄经验丹  
						{itemid = 513 , prob = 1 , count = 1, notice = false, hundred = 1 }, --经验丹(大)   

					},
				},
			},
			--道士
			{
				{
					money = 3000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 8,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1197, prob = 11, count = 1, notice = true, hundred = 11},
						{itemid = 1255, prob = 9 , count = 1, notice = true, hundred = 9 },
						{itemid = 1313, prob = 8 , count = 1, notice = true, hundred = 8 },
						{itemid = 1371, prob = 8 , count = 1, notice = true, hundred = 8 },
						{itemid = 1429, prob = 8 , count = 1, notice = true, hundred = 8 },
						{itemid = 1487, prob = 7 , count = 1, notice = true, hundred = 7 },
					},
				},
				{
					money = 10000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 12,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1197, prob = 11, count = 1, notice = true, hundred = 11},
						{itemid = 1255, prob = 9 , count = 1, notice = true, hundred = 9 },
						{itemid = 1313, prob = 8 , count = 1, notice = true, hundred = 8 },
						{itemid = 1371, prob = 8 , count = 1, notice = true, hundred = 8 },
						{itemid = 1429, prob = 8 , count = 1, notice = true, hundred = 8 },
						{itemid = 1487, prob = 7 , count = 1, notice = true, hundred = 7 },
					},
				},
				{
					money = 30000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 5,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1198, prob = 11, count = 1, notice = true,broadcast = true, hundred = 11},
						{itemid = 1256, prob = 9 , count = 1, notice = true,broadcast = true, hundred = 9 },
						{itemid = 1314, prob = 8 , count = 1, notice = true,broadcast = true, hundred = 8 },
						{itemid = 1372, prob = 8 , count = 1, notice = true,broadcast = true, hundred = 8 },
						{itemid = 1430, prob = 8 , count = 1, notice = true,broadcast = true, hundred = 8 },
						{itemid = 1488, prob = 7 , count = 1, notice = true,broadcast = true, hundred = 7 },
					},
				},
				{
					money = 60000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1197, prob = 11, count = 1, notice = true, hundred = 11},
						{itemid = 1255, prob = 9 , count = 1, notice = true, hundred = 9 },
						{itemid = 1313, prob = 8 , count = 1, notice = true, hundred = 8 },
						{itemid = 1371, prob = 8 , count = 1, notice = true, hundred = 8 },
						{itemid = 1429, prob = 8 , count = 1, notice = true, hundred = 8 },
						{itemid = 1487, prob = 7 , count = 1, notice = true, hundred = 7 },
					},
				},
				{
					money = 90000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 15,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1198, prob = 11, count = 1, notice = true,broadcast = true, hundred = 11},
						{itemid = 1256, prob = 9 , count = 1, notice = true,broadcast = true, hundred = 9 },
						{itemid = 1314, prob = 8 , count = 1, notice = true,broadcast = true, hundred = 8 },
						{itemid = 1372, prob = 8 , count = 1, notice = true,broadcast = true, hundred = 8 },
						{itemid = 1430, prob = 8 , count = 1, notice = true,broadcast = true, hundred = 8 },
						{itemid = 1488, prob = 7 , count = 1, notice = true,broadcast = true, hundred = 7 },
					},
				},
				{
					money = 120000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1197, prob = 11, count = 1, notice = true, hundred = 11},
						{itemid = 1255, prob = 9 , count = 1, notice = true, hundred = 9 },
						{itemid = 1313, prob = 8 , count = 1, notice = true, hundred = 8 },
						{itemid = 1371, prob = 8 , count = 1, notice = true, hundred = 8 },
						{itemid = 1429, prob = 8 , count = 1, notice = true, hundred = 8 },
						{itemid = 1487, prob = 7 , count = 1, notice = true, hundred = 7 },
					},
				},
				{
					money = 150000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 12,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1198, prob = 11, count = 1, notice = true, broadcast = true, hundred = 11}, --8转首饰
						{itemid = 1256, prob = 9 , count = 1, notice = true, broadcast = true, hundred = 9}, --8转首饰
						{itemid = 1314, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8}, --8转首饰
						{itemid = 1372, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8}, --8转首饰
						{itemid = 1430, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8}, --8转首饰
						{itemid = 1488, prob = 7 , count = 1, notice = true, broadcast = true, hundred = 7}, --8转首饰
					},
				},
				{
					money = 180000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 12,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1199, prob = 11, count = 1, notice = true, broadcast = true, hundred = 11}, --10转首饰
						{itemid = 1257, prob = 9 , count = 1, notice = true, broadcast = true, hundred = 9}, --10转首饰
						{itemid = 1315, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8}, --10转首饰
						{itemid = 1373, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8}, --10转首饰
						{itemid = 1431, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8}, --10转首饰
						{itemid = 1489, prob = 7 , count = 1, notice = true, broadcast = true, hundred = 7}, --10转首饰
					},
				},
				{
					count = 200,	--寻宝次数大于此值才会进入
					maxcount = 250,	--寻宝次数等于此值必定进入
					limit = 1,		--限制进入次数,-1为不限制
					prob = 5,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 2201, prob = 26, count = 1, notice = true, hundred = 26},  --欢
						{itemid = 2200, prob = 10, count = 1, notice = true, hundred = 10},  --狂
						{itemid = 2199, prob = 3 , count = 1, notice = true, hundred = 3},   --民
						{itemid = 2198, prob = 1 , count = 1, notice = true, hundred = 1},   --全
					},
				},
				{
					money = 0,	--寻宝花费数大于此值才会进入此表
					limit = -1,		--限制进入次数,-1为不限制
					prob = 1,

					--道具列表
					items = 
					{
						--id,概率,数量,广播

						{itemid = 2110, prob = 25888, count = 1, notice = false, hundred = 25888}, --一级暴击宝石 
						{itemid = 2110, prob = 25888, count = 1, notice = false, hundred = 25888}, --一级暴击宝石 
						{itemid = 2276, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 25888}, --铁血武器        
						{itemid = 2277, prob = 25668, count = 1, notice = true, broadcast = true, hundred = 25668}, --铁血衣服(男)
						{itemid = 2284, prob = 25588, count = 1, notice = true, broadcast = true, hundred = 25588}, --铁血衣服(女)

						{itemid = 2344, prob = 15288, count = 1, notice = true, hundred = 6888}, --傲视狂舞斩(英雄)    
						{itemid = 2354, prob = 15188, count = 1, notice = true, hundred = 6888}, --乾坤降魔杖(英雄)    
						{itemid = 2364, prob = 15088, count = 1, notice = true, hundred = 6888}, --紫金龙皇剑(英雄)    
						{itemid = 2380, prob = 15088, count = 1, notice = true, hundred = 6888}, --傲视狂舞甲(男)(英雄)
						{itemid = 2381, prob = 15088, count = 1, notice = true, hundred = 6888}, --傲视狂舞甲(女)(英雄)
						{itemid = 2400, prob = 15088, count = 1, notice = true, hundred = 6888}, --乾坤降魔衣(男)(英雄)
						{itemid = 2401, prob = 15088, count = 1, notice = true, hundred = 6888}, --乾坤降魔衣(女)(英雄)
						{itemid = 2420, prob = 15088, count = 1, notice = true, hundred = 6888}, --紫金龙皇甲(男)(英雄)
						{itemid = 2421, prob = 15088, count = 1, notice = true, hundred = 6888}, --紫金龙皇甲(女)(英雄)

						{itemid = 2345, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙战剑(英雄)      
						{itemid = 2355, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙魔杖(英雄)    
						{itemid = 2365, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙宝剑(英雄)    
						{itemid = 2382, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙战甲(男)(英雄)
						{itemid = 2383, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙战甲(女)(英雄)
						{itemid = 2402, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙魔衣(男)(英雄)
						{itemid = 2403, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙魔衣(女)(英雄)
						{itemid = 2422, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙道袍(男)(英雄)
						{itemid = 2423, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙道袍(女)(英雄)

						{itemid = 2346, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王战剑(英雄)     
						{itemid = 2356, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王魔杖(英雄)    
						{itemid = 2366, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王道剑(英雄)    
						{itemid = 2384, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王战甲(男)(英雄)
						{itemid = 2385, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王战甲(女)(英雄)
						{itemid = 2404, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王魔衣(男)(英雄)
						{itemid = 2405, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王魔衣(女)(英雄)
						{itemid = 2424, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王道袍(男)(英雄)
						{itemid = 2425, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王道袍(女)(英雄)

						{itemid = 1317, prob = 41588, count = 1, notice = true, broadcast = true, hundred = 32888}, --至尊诛仙道镯    
						{itemid = 1375, prob = 41888, count = 1, notice = true, broadcast = true, hundred = 32888}, --至尊诛仙道戒
						{itemid = 1201, prob = 42585, count = 1, notice = true, broadcast = true, hundred = 32585}, --至尊诛仙道盔
						{itemid = 1259, prob = 42688, count = 1, notice = true, broadcast = true, hundred = 32888}, --至尊诛仙道链    
						{itemid = 1433, prob = 42988, count = 1, notice = true, broadcast = true, hundred = 32888}, --至尊诛仙道带
						{itemid = 1491, prob = 42885, count = 1, notice = true, broadcast = true, hundred = 32585}, --至尊诛仙道靴

						{itemid = 765, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 59888}, --神之斩    
						{itemid = 766, prob = 35888, count = 1, notice = true, broadcast = true, hundred = 58888}, --神之甲
						{itemid = 767, prob = 28585, count = 1, notice = true, broadcast = true, hundred = 58585}, --神之盔
						{itemid = 768, prob = 28881, count = 1, notice = true, broadcast = true, hundred = 59888}, --神之链    
						{itemid = 769, prob = 28882, count = 1, notice = true, broadcast = true, hundred = 58888}, --神之镯
						{itemid = 770, prob = 28585, count = 1, notice = true, broadcast = true, hundred = 58585}, --神之戒
						{itemid = 771, prob = 28883, count = 1, notice = true, broadcast = true, hundred = 59888}, --神之带    
						{itemid = 772, prob = 28988, count = 1, notice = true, broadcast = true, hundred = 59888}, --神之靴

						{itemid = 1025, prob = 39888, count = 1, notice = true, broadcast = true, hundred = 59888}, --至尊诛仙扇        
						{itemid = 1137, prob = 35888, count = 1, notice = true, broadcast = true, hundred = 58888}, --至尊诛仙道袍(男)
						{itemid = 1138, prob = 35585, count = 1, notice = true, broadcast = true, hundred = 58585}, --至尊诛仙道袍(女)

						{itemid = 1024, prob = 32888, count = 1, notice = true, broadcast = true, hundred = 59888}, --诛仙之扇        
						{itemid = 1135, prob = 31888, count = 1, notice = true, broadcast = true, hundred = 58888}, --诛仙道袍(男)
						{itemid = 1136, prob = 31585, count = 1, notice = true, broadcast = true, hundred = 58585}, --诛仙道袍(女)

						{itemid = 1022, prob = 159888, count = 1, notice = true, broadcast = true, hundred = 59888}, --8转武器    
						{itemid = 1131, prob = 158888, count = 1, notice = true, broadcast = true, hundred = 58888}, --8转衣服(男)
						{itemid = 1132, prob = 158585, count = 1, notice = true, broadcast = true, hundred = 58585}, --8转衣服(女)

						{itemid = 1021, prob = 39888, count = 1, notice = true, broadcast = true, hundred = 39888}, --傲视狂舞斩    
						{itemid = 1129, prob = 38888, count = 1, notice = true, broadcast = true, hundred = 38888}, --傲视狂舞甲(男)
						{itemid = 1130, prob = 38585, count = 1, notice = true, broadcast = true, hundred = 38585}, --傲视狂舞甲(女)

						{itemid = 1316, prob = 21588, count = 1, notice = true, broadcast = true, hundred = 32888}, --诛仙道镯    
						{itemid = 1374, prob = 21888, count = 1, notice = true, broadcast = true, hundred = 32888}, --诛仙道戒
						{itemid = 1200, prob = 22585, count = 1, notice = true, broadcast = true, hundred = 32585}, --诛仙道盔
						{itemid = 1258, prob = 22688, count = 1, notice = true, broadcast = true, hundred = 32888}, --诛仙道链    
						{itemid = 1432, prob = 22988, count = 1, notice = true, broadcast = true, hundred = 32888}, --诛仙道带
						{itemid = 1490, prob = 22885, count = 1, notice = true, broadcast = true, hundred = 32585}, --诛仙道靴

						{itemid = 1199, prob = 42888, count = 1, notice = true, broadcast = true, hundred = 32888}, --10转首饰    
						{itemid = 1257, prob = 42888, count = 1, notice = true, broadcast = true, hundred = 32888}, --10转首饰
						{itemid = 1315, prob = 42585, count = 1, notice = true, broadcast = true, hundred = 32585}, --10转首饰
						{itemid = 1373, prob = 42888, count = 1, notice = true, broadcast = true, hundred = 32888}, --10转首饰    
						{itemid = 1431, prob = 42888, count = 1, notice = true, broadcast = true, hundred = 32888}, --10转首饰
						{itemid = 1489, prob = 42585, count = 1, notice = true, broadcast = true, hundred = 32585}, --10转首饰

						{itemid = 1198, prob = 22888, count = 1, notice = true, broadcast = true, hundred = 22888}, --8转首饰
						{itemid = 1256, prob = 22888, count = 1, notice = true, broadcast = true, hundred = 22888}, --8转首饰
						{itemid = 1314, prob = 22585, count = 1, notice = true, broadcast = true, hundred = 22585}, --8转首饰
						{itemid = 1372, prob = 22888, count = 1, notice = true, broadcast = true, hundred = 22888}, --8转首饰
						{itemid = 1430, prob = 22888, count = 1, notice = true, broadcast = true, hundred = 22888}, --8转首饰
						{itemid = 1488, prob = 22585, count = 1, notice = true, broadcast = true, hundred = 22585}, --8转首饰

						{itemid = 2291, prob = 26968, count = 1, notice = true, broadcast = true, hundred = 2359}, --圣·新年达人(男) 
						{itemid = 2292, prob = 26868, count = 1, notice = true, broadcast = true, hundred = 2349}, --圣·新年达人(女) 
						{itemid = 2310, prob = 26768, count = 1, notice = true, broadcast = true, hundred = 2339}, --圣·情侣时装(男) 
						{itemid = 2311, prob = 26668, count = 1, notice = true, broadcast = true, hundred = 2329}, --圣·情侣时装(女) 
						{itemid = 2297, prob = 26568, count = 1, notice = true, broadcast = true, hundred = 2319}, --圣·返璞归真(男) 
						{itemid = 2300, prob = 26468, count = 1, notice = true, broadcast = true, hundred = 2309}, --圣·返璞归真(女) 
						{itemid = 2327, prob = 26368, count = 1, notice = true, broadcast = true, hundred = 2305}, --圣·新春时装(男)
						{itemid = 2328, prob = 26268, count = 1, notice = true, broadcast = true, hundred = 2300}, --圣·新春时装(女) 
						{itemid = 2290, prob = 26168, count = 1, notice = true, broadcast = true, hundred = 1888}, --圣·棒棒糖
						{itemid = 2306, prob = 26068, count = 1, notice = true, broadcast = true, hundred = 1887}, --圣·玫瑰花 
						{itemid = 2303, prob = 26066, count = 1, notice = true, broadcast = true, hundred = 1886}, --圣·反璞归真

						{itemid = 2887, prob = 12888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世之刃  
						{itemid = 2888, prob = 11888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世之甲
						{itemid = 2889, prob = 5888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世头盔
						{itemid = 2890, prob = 5888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世项链
						{itemid = 2891, prob = 5888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世手镯
						{itemid = 2892, prob = 5888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世戒指
						{itemid = 2893, prob = 5888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世靴子
						{itemid = 2894, prob = 5888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世腰带

						{itemid = 1197, prob = 6568, count = 1, notice = true, hundred = 16568}, --6转首饰
						{itemid = 1255, prob = 6567, count = 1, notice = true, hundred = 16567}, --6转首饰
						{itemid = 1313, prob = 6566, count = 1, notice = true, hundred = 16566}, --6转首饰
						{itemid = 1371, prob = 6565, count = 1, notice = true, hundred = 16565}, --6转首饰
						{itemid = 1429, prob = 6564, count = 1, notice = true, hundred = 16564}, --6转首饰
						{itemid = 1487, prob = 6563, count = 1, notice = true, hundred = 16563}, --6转首饰

						{itemid = 1197, prob = 6568, count = 1, notice = true, hundred = 16568}, --6转首饰
						{itemid = 1255, prob = 6567, count = 1, notice = true, hundred = 16567}, --6转首饰
						{itemid = 1313, prob = 6566, count = 1, notice = true, hundred = 16566}, --6转首饰
						{itemid = 1371, prob = 6565, count = 1, notice = true, hundred = 16565}, --6转首饰
						{itemid = 1429, prob = 6564, count = 1, notice = true, hundred = 16564}, --6转首饰
						{itemid = 1487, prob = 6563, count = 1, notice = true, hundred = 16563}, --6转首饰

						{itemid = 1197, prob = 6568, count = 1, notice = true, hundred = 16568}, --6转首饰
						{itemid = 1255, prob = 6567, count = 1, notice = true, hundred = 16567}, --6转首饰
						{itemid = 1313, prob = 6566, count = 1, notice = true, hundred = 16566}, --6转首饰
						{itemid = 1371, prob = 6565, count = 1, notice = true, hundred = 16565}, --6转首饰
						{itemid = 1429, prob = 6564, count = 1, notice = true, hundred = 16564}, --6转首饰
						{itemid = 1487, prob = 6563, count = 1, notice = true, hundred = 16563}, --6转首饰

						{itemid = 1020, prob = 12588, count = 1, notice = true, hundred = 12588}, --天武神剑    
						{itemid = 1127, prob = 12888, count = 1, notice = true, hundred = 12888}, --天武神甲(男)
						{itemid = 1128, prob = 12878, count = 1, notice = true, hundred = 12878}, --天武神甲(女)

						{itemid = 2209, prob = 16888, count = 1, notice = true, hundred = 16888}, --盾牌碎片(特)
						{itemid = 2213, prob = 16887, count = 1, notice = true, hundred = 16887}, --宝石碎片(特)
						{itemid = 2217, prob = 16886, count = 1, notice = true, hundred = 16886}, --魂珠碎片(特)
						{itemid = 566 , prob = 16885, count = 1, notice = true, hundred = 16885}, --超级转生丹  
						{itemid = 163 , prob = 16884, count = 1, notice = true, hundred = 16884}, --超级成就令牌
						{itemid = 162 , prob = 16883, count = 1, notice = true, hundred = 16883}, --超级灵力丹  
						{itemid = 675 , prob = 16882, count = 1, notice = true, hundred = 16882}, --999朵玫瑰花 
						{itemid = 528 , prob = 16881, count = 1, notice = true, hundred = 16881}, --特戒碎片包  
						{itemid = 2225, prob = 16880, count = 1, notice = true, hundred = 16880}, --护符碎片(特)

						{itemid = 3007, prob = 3207, count = 1, notice = true, broadcast = true, hundred = 3839}, --龙行天下 
						{itemid = 3008, prob = 3208, count = 1, notice = true, broadcast = true, hundred = 3829}, --如影随形 
						{itemid = 3009, prob = 3209, count = 1, notice = true, broadcast = true, hundred = 3819}, --双龙出海 
						{itemid = 3010, prob = 3210, count = 1, notice = true, broadcast = true, hundred = 3809}, --丘比特   
						{itemid = 3011, prob = 3211, count = 1, notice = true, broadcast = true, hundred = 3805}, --神龙开道 
						{itemid = 3012, prob = 3212, count = 1, notice = true, broadcast = true, hundred = 3800}, --冰火之歌 
						{itemid = 3013, prob = 3213, count = 1, notice = true, broadcast = true, hundred = 3088}, --弥勒笑佛
						{itemid = 3014, prob = 3214, count = 1, notice = true, broadcast = true, hundred = 3087}, --熊二快跑

						{itemid = 1196, prob = 3288, count = 1, notice = true, hundred = 8888}, --4转首饰
						{itemid = 1254, prob = 3278, count = 1, notice = true, hundred = 8878}, --4转首饰
						{itemid = 1312, prob = 3268, count = 1, notice = true, hundred = 8868}, --4转首饰
						{itemid = 1370, prob = 3258, count = 1, notice = true, hundred = 8858}, --4转首饰
						{itemid = 1428, prob = 3248, count = 1, notice = true, hundred = 8848}, --4转首饰
						{itemid = 1486, prob = 3238, count = 1, notice = true, hundred = 8838}, --4转首饰
								        
						{itemid = 1196, prob = 3288, count = 1, notice = true, hundred = 8888}, --4转首饰
						{itemid = 1254, prob = 3278, count = 1, notice = true, hundred = 8878}, --4转首饰
						{itemid = 1312, prob = 3268, count = 1, notice = true, hundred = 8868}, --4转首饰
						{itemid = 1370, prob = 3258, count = 1, notice = true, hundred = 8858}, --4转首饰
						{itemid = 1428, prob = 3248, count = 1, notice = true, hundred = 8848}, --4转首饰
						{itemid = 1486, prob = 3238, count = 1, notice = true, hundred = 8838}, --4转首饰
								        
						{itemid = 1196, prob = 3288, count = 1, notice = true, hundred = 8888}, --4转首饰
						{itemid = 1254, prob = 3278, count = 1, notice = true, hundred = 8878}, --4转首饰
						{itemid = 1312, prob = 3268, count = 1, notice = true, hundred = 8868}, --4转首饰
						{itemid = 1370, prob = 3258, count = 1, notice = true, hundred = 8858}, --4转首饰
						{itemid = 1428, prob = 3248, count = 1, notice = true, hundred = 8848}, --4转首饰
						{itemid = 1486, prob = 3238, count = 1, notice = true, hundred = 8838}, --4转首饰
								        
						{itemid = 1196, prob = 3288, count = 1, notice = true, hundred = 8888}, --4转首饰
						{itemid = 1254, prob = 3278, count = 1, notice = true, hundred = 8878}, --4转首饰
						{itemid = 1312, prob = 3268, count = 1, notice = true, hundred = 8868}, --4转首饰
						{itemid = 1370, prob = 3258, count = 1, notice = true, hundred = 8858}, --4转首饰
						{itemid = 1428, prob = 3248, count = 1, notice = true, hundred = 8848}, --4转首饰
						{itemid = 1486, prob = 3238, count = 1, notice = true, hundred = 8838}, --4转首饰

						{itemid = 2635, prob = 9099, count = 1, notice = true, broadcast = true, hundred = 3289}, --青龙阵石 
						{itemid = 2636, prob = 9089, count = 1, notice = true, broadcast = true, hundred = 3289}, --白虎阵石 
						{itemid = 2637, prob = 9079, count = 1, notice = true, broadcast = true, hundred = 3279}, --朱雀阵石 
						{itemid = 2638, prob = 9069, count = 1, notice = true, broadcast = true, hundred = 3269}, --玄武阵石
	
						{itemid = 1940, prob = 988, count = 1, notice = true, hundred = 8888},	--五级羽毛
						{itemid = 1941, prob = 988, count = 1, notice = true, broadcast = true, hundred = 3289}, --六级羽毛 

						{itemid = 636 , prob = 2989, count = 1, notice = true, broadcast = true, hundred = 3289}, --马鞍 
						{itemid = 624 , prob = 2988, count = 1, notice = true, broadcast = true, hundred = 3289}, --蹄铁 
						{itemid = 628 , prob = 2987, count = 1, notice = true, broadcast = true, hundred = 3279}, --缰绳 
						{itemid = 632 , prob = 2986, count = 1, notice = true, broadcast = true, hundred = 3269}, --马镫

						{itemid = 640 , prob = 2889, count = 1, notice = true, broadcast = true, hundred = 3289}, --银光闪豹 
						{itemid = 641 , prob = 2879, count = 1, notice = true, broadcast = true, hundred = 3279}, --万圣战轮 
						{itemid = 642 , prob = 2869, count = 1, notice = true, broadcast = true, hundred = 3269}, --蒸朋怒鲨
						{itemid = 643 , prob = 2889, count = 1, notice = true, broadcast = true, hundred = 3289}, --百鸟朝凤 

						{itemid = 588 , prob = 3089, count = 1, notice = true, broadcast = true, hundred = 3289}, --关羽时装 
						{itemid = 592 , prob = 3079, count = 1, notice = true, broadcast = true, hundred = 3279}, --赵云时装 
						{itemid = 596 , prob = 3069, count = 1, notice = true, broadcast = true, hundred = 3269}, --吕布时装
						{itemid = 612 , prob = 3089, count = 1, notice = true, broadcast = true, hundred = 3289}, --大乔时装 
						{itemid = 616 , prob = 3079, count = 1, notice = true, broadcast = true, hundred = 3279}, --小乔时装 
						{itemid = 620 , prob = 3069, count = 1, notice = true, broadcast = true, hundred = 3269}, --貂蝉时装

						{itemid = 600 , prob = 2889, count = 1, notice = true, broadcast = true, hundred = 3289}, --青龙偃月刀 
						{itemid = 604 , prob = 2879, count = 1, notice = true, broadcast = true, hundred = 3279}, --百鸟朝凤枪 
						{itemid = 608 , prob = 2869, count = 1, notice = true, broadcast = true, hundred = 3269}, --方天画戟

						{itemid = 492 , prob = 3239, count = 1, notice = true, broadcast = true, hundred = 3839}, --返璞归真 
						{itemid = 493 , prob = 3229, count = 1, notice = true, broadcast = true, hundred = 3829}, --鸾凤和鸣 
						{itemid = 494 , prob = 3219, count = 1, notice = true, broadcast = true, hundred = 3819}, --双龙出海 
						{itemid = 495 , prob = 3209, count = 1, notice = true, broadcast = true, hundred = 3809}, --紫翼东升 

						{itemid = 341 , prob = 2839, count = 1, notice = true, broadcast = true, hundred = 3839}, --法老服饰(男) 
						{itemid = 342 , prob = 2829, count = 1, notice = true, broadcast = true, hundred = 3829}, --法老服饰(女) 
						{itemid = 350 , prob = 2819, count = 1, notice = true, broadcast = true, hundred = 3819}, --拳击战服(男) 
						{itemid = 351 , prob = 2809, count = 1, notice = true, broadcast = true, hundred = 3809}, --拳击战服(女) 
						{itemid = 2319, prob = 2805, count = 1, notice = true, broadcast = true, hundred = 3805}, --菊花一锦(男) 
						{itemid = 2320, prob = 2800, count = 1, notice = true, broadcast = true, hundred = 3800}, --菊花一锦(女) 
						{itemid = 2316, prob = 2788, count = 1, notice = true, broadcast = true, hundred = 3088}, --菊花
						{itemid = 338 , prob = 2787, count = 1, notice = true, broadcast = true, hundred = 3087}, --法老权杖 
						{itemid = 347 , prob = 2786, count = 1, notice = true, broadcast = true, hundred = 3086}, --拳击暴雷

						{itemid = 327, prob = 2588, count = 1, notice = true, broadcast = true, hundred = 2588}, --足迹
						{itemid = 328, prob = 2587, count = 1, notice = true, broadcast = true, hundred = 2587}, --足迹
						{itemid = 329, prob = 2586, count = 1, notice = true, broadcast = true, hundred = 2586}, --足迹
						{itemid = 330, prob = 2585, count = 1, notice = true, broadcast = true, hundred = 2585}, --足迹
						{itemid = 331, prob = 2584, count = 1, notice = true, broadcast = true, hundred = 2584}, --足迹
						{itemid = 332, prob = 2583, count = 1, notice = true, broadcast = true, hundred = 2583}, --足迹
						{itemid = 333, prob = 2582, count = 1, notice = true, broadcast = true, hundred = 2582}, --足迹
						{itemid = 334, prob = 2581, count = 1, notice = true, broadcast = true, hundred = 2581}, --足迹 
						{itemid = 335, prob = 2580, count = 1, notice = true, broadcast = true, hundred = 2580}, --足迹

						{itemid = 2156, prob = 2059, count = 1, notice = true, broadcast = true, hundred = 2359}, --新年达人(男) 
						{itemid = 2157, prob = 2049, count = 1, notice = true, broadcast = true, hundred = 2349}, --新年达人(女) 
						{itemid = 2308, prob = 2039, count = 1, notice = true, broadcast = true, hundred = 2339}, --情侣时装(男) 
						{itemid = 2309, prob = 2029, count = 1, notice = true, broadcast = true, hundred = 2329}, --情侣时装(女) 
						{itemid = 2296, prob = 2019, count = 1, notice = true, broadcast = true, hundred = 2319}, --返璞归真(男) 
						{itemid = 2299, prob = 2009, count = 1, notice = true, broadcast = true, hundred = 2309}, --返璞归真(女) 
						{itemid = 2325, prob = 2005, count = 1, notice = true, broadcast = true, hundred = 2305}, --新春时装(男) 
						{itemid = 2326, prob = 2000, count = 1, notice = true, broadcast = true, hundred = 2300}, --新春时装(女) 
						{itemid = 2155, prob = 1688, count = 1, notice = true, broadcast = true, hundred = 1888}, --棒棒糖
						{itemid = 2305, prob = 1687, count = 1, notice = true, broadcast = true, hundred = 1887}, --玫瑰花 
						{itemid = 2302, prob = 1686, count = 1, notice = true, broadcast = true, hundred = 1886}, --反璞归真
						{itemid = 2203, prob = 1388, count = 1, notice = true, broadcast = true, hundred = 1688},--神器碎片
						{itemid = 2204, prob = 1388, count = 1, notice = true, broadcast = true, hundred = 1688},--神甲碎片

						{itemid = 1195, prob = 1388, count = 1, notice = true, hundred = 1388}, --2转首饰 
						{itemid = 1253, prob = 1378, count = 1, notice = true, hundred = 1378}, --2转首饰 
						{itemid = 1311, prob = 1368, count = 1, notice = true, hundred = 1368}, --2转首饰 
						{itemid = 1369, prob = 1358, count = 1, notice = true, hundred = 1358}, --2转首饰 
						{itemid = 1427, prob = 1348, count = 1, notice = true, hundred = 1348}, --2转首饰 
						{itemid = 1485, prob = 1338, count = 1, notice = true, hundred = 1338}, --2转首饰 
														     
						{itemid = 1195, prob = 1388, count = 1, notice = true, hundred = 1388}, --2转首饰 
						{itemid = 1253, prob = 1378, count = 1, notice = true, hundred = 1378}, --2转首饰 
						{itemid = 1311, prob = 1368, count = 1, notice = true, hundred = 1368}, --2转首饰 
						{itemid = 1369, prob = 1358, count = 1, notice = true, hundred = 1358}, --2转首饰 
						{itemid = 1427, prob = 1348, count = 1, notice = true, hundred = 1348}, --2转首饰 
						{itemid = 1485, prob = 1338, count = 1, notice = true, hundred = 1338}, --2转首饰 

						{itemid = 1195, prob = 1388, count = 1, notice = true, hundred = 1388}, --2转首饰 
						{itemid = 1253, prob = 1378, count = 1, notice = true, hundred = 1378}, --2转首饰 
						{itemid = 1311, prob = 1368, count = 1, notice = true, hundred = 1368}, --2转首饰 
						{itemid = 1369, prob = 1358, count = 1, notice = true, hundred = 1358}, --2转首饰 
						{itemid = 1427, prob = 1348, count = 1, notice = true, hundred = 1348}, --2转首饰 
						{itemid = 1485, prob = 1338, count = 1, notice = true, hundred = 1338}, --2转首饰 
														     
						{itemid = 1195, prob = 1388, count = 1, notice = true, hundred = 1388}, --2转首饰 
						{itemid = 1253, prob = 1378, count = 1, notice = true, hundred = 1378}, --2转首饰 
						{itemid = 1311, prob = 1368, count = 1, notice = true, hundred = 1368}, --2转首饰 
						{itemid = 1369, prob = 1358, count = 1, notice = true, hundred = 1358}, --2转首饰 
						{itemid = 1427, prob = 1348, count = 1, notice = true, hundred = 1348}, --2转首饰 
						{itemid = 1485, prob = 1338, count = 1, notice = true, hundred = 1338}, --2转首饰 

						{itemid = 1019, prob = 3088, count = 1, notice = true, hundred = 3688}, --轩辕神剑    
						{itemid = 1125, prob = 3090, count = 1, notice = true, hundred = 3690}, --轩辕神甲(男)
						{itemid = 1126, prob = 3080, count = 1, notice = true, hundred = 3680}, --轩辕神甲(女)

						{itemid = 1194, prob = 788, count = 1, notice = true, hundred = 788}, --1转首饰 
						{itemid = 1252, prob = 778, count = 1, notice = true, hundred = 778}, --1转首饰 
						{itemid = 1310, prob = 768, count = 1, notice = true, hundred = 768}, --1转首饰 
						{itemid = 1368, prob = 758, count = 1, notice = true, hundred = 758}, --1转首饰 
						{itemid = 1426, prob = 748, count = 1, notice = true, hundred = 748}, --1转首饰 
						{itemid = 1484, prob = 738, count = 1, notice = true, hundred = 738}, --1转首饰 
														   
						{itemid = 1194, prob = 788, count = 1, notice = true, hundred = 788}, --1转首饰 
						{itemid = 1252, prob = 778, count = 1, notice = true, hundred = 778}, --1转首饰 
						{itemid = 1310, prob = 768, count = 1, notice = true, hundred = 768}, --1转首饰 
						{itemid = 1368, prob = 758, count = 1, notice = true, hundred = 758}, --1转首饰 
						{itemid = 1426, prob = 748, count = 1, notice = true, hundred = 748}, --1转首饰 
						{itemid = 1484, prob = 738, count = 1, notice = true, hundred = 738}, --1转首饰 

						{itemid = 1194, prob = 788, count = 1, notice = true, hundred = 788}, --1转首饰 
						{itemid = 1252, prob = 778, count = 1, notice = true, hundred = 778}, --1转首饰 
						{itemid = 1310, prob = 768, count = 1, notice = true, hundred = 768}, --1转首饰 
						{itemid = 1368, prob = 758, count = 1, notice = true, hundred = 758}, --1转首饰 
						{itemid = 1426, prob = 748, count = 1, notice = true, hundred = 748}, --1转首饰 
						{itemid = 1484, prob = 738, count = 1, notice = true, hundred = 738}, --1转首饰 
														   
						{itemid = 1194, prob = 788, count = 1, notice = true, hundred = 788}, --1转首饰 
						{itemid = 1252, prob = 778, count = 1, notice = true, hundred = 778}, --1转首饰 
						{itemid = 1310, prob = 768, count = 1, notice = true, hundred = 768}, --1转首饰 
						{itemid = 1368, prob = 758, count = 1, notice = true, hundred = 758}, --1转首饰 
						{itemid = 1426, prob = 748, count = 1, notice = true, hundred = 748}, --1转首饰 
						{itemid = 1484, prob = 738, count = 1, notice = true, hundred = 738}, --1转首饰 

						{itemid = 1018, prob = 2288, count = 1, notice = true, hundred = 2288}, --伏虎令剑    
						{itemid = 1123, prob = 2290, count = 1, notice = true, hundred = 2290}, --伏虎战甲(男)
						{itemid = 1124, prob = 2280, count = 1, notice = true, hundred = 2280}, --伏虎战甲(女)

						{itemid = 2210, prob = 898, count = 1, notice = true, hundred = 898}, --盾牌碎片(大)    
						{itemid = 2214, prob = 878, count = 1, notice = true, hundred = 878}, --宝石碎片(大)    
						{itemid = 2218, prob = 868, count = 1, notice = true, hundred = 868}, --魂珠碎片(大)    
						{itemid = 565 , prob = 888, count = 1, notice = true, hundred = 888}, --高级转生丹      
						{itemid = 145 , prob = 898, count = 1, notice = true, hundred = 898}, --高级成就令牌    
						{itemid = 161 , prob = 878, count = 1, notice = true, hundred = 878}, --高级灵力丹      
						{itemid = 674 , prob = 868, count = 1, notice = true, hundred = 868}, --99朵玫瑰花      
						{itemid = 849 , prob = 858, count = 1, notice = true, hundred = 858}, --五倍经验(2小时) 
						{itemid = 2111, prob = 818, count = 1, notice = true, hundred = 818}, --二级暴击宝石    
						{itemid = 160 , prob = 588, count = 1, notice = true, hundred = 588},  --灵力丹(大)      
						{itemid = 527 , prob = 586, count = 1, notice = true, hundred = 586},  --特戒碎片        
						{itemid = 2226, prob = 885, count = 1, notice = true, hundred = 885}, --护符碎片(大)      

						{itemid = 1017, prob = 828, count = 1, notice = true,  hundred = 828}, --修罗之刃      
						{itemid = 1121, prob = 828, count = 1, notice = true,  hundred = 828}, --修罗战甲(男)  
						{itemid = 1122, prob = 828, count = 1, notice = true,  hundred = 828}, --修罗战甲(女)  

						{itemid = 2123, prob = 2638, count = 1, notice = false, hundred = 238}, --子鼠玉佩  
						{itemid = 2124, prob = 2638, count = 1, notice = false, hundred = 237}, --丑牛玉佩  
						{itemid = 2125, prob = 2638, count = 1, notice = false, hundred = 236}, --寅虎玉佩  
						{itemid = 2126, prob = 2638, count = 1, notice = false, hundred = 235}, --卯兔玉佩  
						{itemid = 2127, prob = 2638, count = 1, notice = false, hundred = 234}, --辰龙玉佩  
						{itemid = 2128, prob = 2638, count = 1, notice = false, hundred = 233}, --巳蛇玉佩 
						{itemid = 2129, prob = 2638, count = 1, notice = false, hundred = 238}, --午马玉佩  
						{itemid = 2130, prob = 2638, count = 1, notice = false, hundred = 237}, --未羊玉佩  
						{itemid = 2131, prob = 2638, count = 1, notice = false, hundred = 236}, --申猴玉佩  
						{itemid = 2132, prob = 2638, count = 1, notice = false, hundred = 235}, --酉鸡玉佩  
						{itemid = 2133, prob = 2638, count = 1, notice = false, hundred = 234}, --戌狗玉佩  
						{itemid = 2134, prob = 2638, count = 1, notice = false, hundred = 233}, --亥猪玉佩 

						{itemid = 1193, prob = 108, count = 1, notice = false, hundred = 108}, --90级首饰  
						{itemid = 1251, prob = 107, count = 1, notice = false, hundred = 107}, --90级首饰  
						{itemid = 1309, prob = 106, count = 1, notice = false, hundred = 106}, --90级首饰  
						{itemid = 1367, prob = 105, count = 1, notice = false, hundred = 105}, --90级首饰  
						{itemid = 1425, prob = 104, count = 1, notice = false, hundred = 104}, --90级首饰  
						{itemid = 1483, prob = 103, count = 1, notice = false, hundred = 103}, --90级首饰 

						{itemid = 1193, prob = 108, count = 1, notice = false, hundred = 108}, --90级首饰  
						{itemid = 1251, prob = 107, count = 1, notice = false, hundred = 107}, --90级首饰  
						{itemid = 1309, prob = 106, count = 1, notice = false, hundred = 106}, --90级首饰  
						{itemid = 1367, prob = 105, count = 1, notice = false, hundred = 105}, --90级首饰  
						{itemid = 1425, prob = 104, count = 1, notice = false, hundred = 104}, --90级首饰  
						{itemid = 1483, prob = 103, count = 1, notice = false, hundred = 103}, --90级首饰 

						{itemid = 2197, prob = 18, count = 1, notice = false, hundred = 18},    --典
						{itemid = 2196, prob = 17, count = 1, notice = false, hundred = 17},    --庆
						{itemid = 2195, prob = 16, count = 1, notice = false, hundred = 16},    --服
						{itemid = 2193, prob = 15, count = 1, notice = false, hundred = 15},    --千
						{itemid = 2886, prob = 16, count = 1, notice = false, hundred = 14}, --传世宝钻 
						{itemid = 841, prob = 30, count = 1, notice = false, hundred = 10}, --圣兽灵石 
						{itemid = 818 , prob = 4 , count = 1, notice = false, hundred = 1 }, --英雄经验丹  
						{itemid = 513 , prob = 1 , count = 1, notice = false, hundred = 1 }, --经验丹(大)   
					},
				},
			},
		},
	},
	{
		openday = 9999,		--开服天数, 5天之内存在,进入这个表后就不再进入下一个表

		items = 
		{
			--战士
			{
				{
					money = 3000,		--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 5,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1159, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1217, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1275, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1333, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1391, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1449, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1178, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1236, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1294, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1352, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1410, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1468, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1197, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1255, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1313, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1371, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1429, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1487, prob = 18, count = 1, notice = true, hundred = 18},
					},
				},

				{
					money = 10000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 8,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1159, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1217, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1275, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1333, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1391, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1449, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1178, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1236, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1294, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1352, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1410, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1468, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1197, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1255, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1313, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1371, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1429, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1487, prob = 18, count = 1, notice = true, hundred = 18},
					},
				},
				{
					money = 30000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 12,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1160, prob = 11, count = 1, notice = true, broadcast = true, hundred = 11}, --8转首饰
						{itemid = 1218, prob = 9 , count = 1, notice = true, broadcast = true, hundred = 9 }, --8转首饰
						{itemid = 1276, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1334, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1392, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1450, prob = 7 , count = 1, notice = true, broadcast = true, hundred = 7 }, --8转首饰
					},
				},
				{
					money = 60000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1159, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1217, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1275, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1333, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1391, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1449, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1178, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1236, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1294, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1352, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1410, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1468, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1197, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1255, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1313, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1371, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1429, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1487, prob = 18, count = 1, notice = true, hundred = 18},
					},
				},
				{
					money = 90000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 15,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1160, prob = 11, count = 1, notice = true, broadcast = true, hundred = 11}, --8转首饰
						{itemid = 1218, prob = 9 , count = 1, notice = true, broadcast = true, hundred = 9 }, --8转首饰
						{itemid = 1276, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1334, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1392, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1450, prob = 7 , count = 1, notice = true, broadcast = true, hundred = 7 }, --8转首饰
					},
				},
				{
					money = 120000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1159, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1217, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1275, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1333, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1391, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1449, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1178, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1236, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1294, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1352, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1410, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1468, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1197, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1255, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1313, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1371, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1429, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1487, prob = 18, count = 1, notice = true, hundred = 18},
					},
				},
				{
					money = 150000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 15,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1160, prob = 11, count = 1, notice = true, broadcast = true, hundred = 11}, --8转首饰
						{itemid = 1218, prob = 9 , count = 1, notice = true, broadcast = true, hundred = 9 }, --8转首饰
						{itemid = 1276, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1334, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1392, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1450, prob = 7 , count = 1, notice = true, broadcast = true, hundred = 7 }, --8转首饰
					},
				},
				{
					money = 180000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 12,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1161, prob = 11, count = 1, notice = true, broadcast = true, hundred = 11}, --10转首饰
						{itemid = 1219, prob = 9 , count = 1, notice = true, broadcast = true, hundred = 9 }, --10转首饰
						{itemid = 1277, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --10转首饰
						{itemid = 1335, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --10转首饰
						{itemid = 1393, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --10转首饰
						{itemid = 1451, prob = 7 , count = 1, notice = true, broadcast = true, hundred = 7 }, --10转首饰
					},
				},
				{
					count = 200,	--寻宝次数大于此值才会进入
					maxcount = 250,	--寻宝次数等于此值必定进入
					limit = 1,		--限制进入次数,-1为不限制
					prob = 5,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 2201, prob = 26, count = 1, notice = true, hundred = 26},  --欢
						{itemid = 2200, prob = 10, count = 1, notice = true, hundred = 10},  --狂
						{itemid = 2199, prob = 3 , count = 1, notice = true, hundred = 3},   --民
						{itemid = 2198, prob = 1 , count = 1, notice = true, hundred = 1},   --全
					},
				},
				{
					money = 0,	--寻宝花费数大于此值才会进入此表
					limit = -1,		--限制进入次数,-1为不限制
					prob = 1,

					--道具列表
					items = 
					{
						--id,概率,数量,广播

						{itemid = 2276, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 25888}, --铁血武器        
						{itemid = 2277, prob = 25668, count = 1, notice = true, broadcast = true, hundred = 25668}, --铁血衣服(男)
						{itemid = 2284, prob = 25588, count = 1, notice = true, broadcast = true, hundred = 25588}, --铁血衣服(女)

						{itemid = 2344, prob = 15288, count = 1, notice = true, hundred = 6888}, --傲视狂舞斩(英雄)    
						{itemid = 2354, prob = 15188, count = 1, notice = true, hundred = 6888}, --乾坤降魔杖(英雄)    
						{itemid = 2364, prob = 15088, count = 1, notice = true, hundred = 6888}, --紫金龙皇剑(英雄)    
						{itemid = 2380, prob = 15088, count = 1, notice = true, hundred = 6888}, --傲视狂舞甲(男)(英雄)
						{itemid = 2381, prob = 15088, count = 1, notice = true, hundred = 6888}, --傲视狂舞甲(女)(英雄)
						{itemid = 2400, prob = 15088, count = 1, notice = true, hundred = 6888}, --乾坤降魔衣(男)(英雄)
						{itemid = 2401, prob = 15088, count = 1, notice = true, hundred = 6888}, --乾坤降魔衣(女)(英雄)
						{itemid = 2420, prob = 15088, count = 1, notice = true, hundred = 6888}, --紫金龙皇甲(男)(英雄)
						{itemid = 2421, prob = 15088, count = 1, notice = true, hundred = 6888}, --紫金龙皇甲(女)(英雄)

						{itemid = 2345, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙战剑(英雄)      
						{itemid = 2355, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙魔杖(英雄)    
						{itemid = 2365, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙宝剑(英雄)    
						{itemid = 2382, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙战甲(男)(英雄)
						{itemid = 2383, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙战甲(女)(英雄)
						{itemid = 2402, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙魔衣(男)(英雄)
						{itemid = 2403, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙魔衣(女)(英雄)
						{itemid = 2422, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙道袍(男)(英雄)
						{itemid = 2423, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙道袍(女)(英雄)

						{itemid = 2346, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王战剑(英雄)     
						{itemid = 2356, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王魔杖(英雄)    
						{itemid = 2366, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王道剑(英雄)    
						{itemid = 2384, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王战甲(男)(英雄)
						{itemid = 2385, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王战甲(女)(英雄)
						{itemid = 2404, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王魔衣(男)(英雄)
						{itemid = 2405, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王魔衣(女)(英雄)
						{itemid = 2424, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王道袍(男)(英雄)
						{itemid = 2425, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王道袍(女)(英雄)

						{itemid = 1279, prob = 41588, count = 1, notice = true, broadcast = true, hundred = 32888}, --至尊斗佛战镯    
						{itemid = 1337, prob = 41888, count = 1, notice = true, broadcast = true, hundred = 32888}, --至尊斗佛战戒
						{itemid = 1163, prob = 42585, count = 1, notice = true, broadcast = true, hundred = 32585}, --至尊斗佛战盔
						{itemid = 1221, prob = 42688, count = 1, notice = true, broadcast = true, hundred = 32888}, --至尊斗佛战链    
						{itemid = 1395, prob = 42988, count = 1, notice = true, broadcast = true, hundred = 32888}, --至尊斗佛战带
						{itemid = 1453, prob = 42885, count = 1, notice = true, broadcast = true, hundred = 32585}, --至尊斗佛战靴

						{itemid = 765, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 59888}, --神之斩    
						{itemid = 766, prob = 35888, count = 1, notice = true, broadcast = true, hundred = 58888}, --神之甲
						{itemid = 767, prob = 28585, count = 1, notice = true, broadcast = true, hundred = 58585}, --神之盔
						{itemid = 768, prob = 28881, count = 1, notice = true, broadcast = true, hundred = 59888}, --神之链    
						{itemid = 769, prob = 28882, count = 1, notice = true, broadcast = true, hundred = 58888}, --神之镯
						{itemid = 770, prob = 28585, count = 1, notice = true, broadcast = true, hundred = 58585}, --神之戒
						{itemid = 771, prob = 28883, count = 1, notice = true, broadcast = true, hundred = 59888}, --神之带    
						{itemid = 772, prob = 28988, count = 1, notice = true, broadcast = true, hundred = 59888}, --神之靴

						{itemid = 987 , prob = 39888, count = 1, notice = true, broadcast = true, hundred = 59888}, --至尊斗佛斩        
						{itemid = 1061, prob = 35888, count = 1, notice = true, broadcast = true, hundred = 58888}, --至尊斗佛战甲(男)
						{itemid = 1062, prob = 35585, count = 1, notice = true, broadcast = true, hundred = 58585}, --至尊斗佛战甲(女)

						{itemid = 986 , prob = 32888, count = 1, notice = true, broadcast = true, hundred = 59888}, --斗佛之斩        
						{itemid = 1059, prob = 31888, count = 1, notice = true, broadcast = true, hundred = 58888}, --斗佛战甲(男)
						{itemid = 1060, prob = 31585, count = 1, notice = true, broadcast = true, hundred = 58585}, --斗佛战甲(女)

						{itemid = 984 , prob = 159888, count = 1, notice = true, broadcast = true, hundred = 59888}, --8转武器        
						{itemid = 1055, prob = 158888, count = 1, notice = true, broadcast = true, hundred = 58888}, --8转衣服(男)
						{itemid = 1056, prob = 158585, count = 1, notice = true, broadcast = true, hundred = 58585}, --8转衣服(女)

						{itemid = 983 , prob = 32886, count = 1, notice = true, broadcast = true, hundred = 32886}, --傲视狂舞斩    
						{itemid = 1053, prob = 32883, count = 1, notice = true, broadcast = true, hundred = 32883}, --傲视狂舞甲(男)
						{itemid = 1054, prob = 32586, count = 1, notice = true, broadcast = true, hundred = 32586}, --傲视狂舞甲(女)

						{itemid = 1278, prob = 21588, count = 1, notice = true, broadcast = true, hundred = 32888}, --斗佛战镯    
						{itemid = 1336, prob = 21888, count = 1, notice = true, broadcast = true, hundred = 32888}, --斗佛战戒
						{itemid = 1162, prob = 22585, count = 1, notice = true, broadcast = true, hundred = 32585}, --斗佛战盔
						{itemid = 1220, prob = 22688, count = 1, notice = true, broadcast = true, hundred = 32888}, --斗佛战链    
						{itemid = 1394, prob = 22988, count = 1, notice = true, broadcast = true, hundred = 32888}, --斗佛战带
						{itemid = 1452, prob = 22885, count = 1, notice = true, broadcast = true, hundred = 32585}, --斗佛战靴

						{itemid = 1161, prob = 42888, count = 1, notice = true, broadcast = true, hundred = 32888}, --10转首饰    
						{itemid = 1219, prob = 42888, count = 1, notice = true, broadcast = true, hundred = 32888}, --10转首饰
						{itemid = 1277, prob = 42585, count = 1, notice = true, broadcast = true, hundred = 32585}, --10转首饰
						{itemid = 1335, prob = 42888, count = 1, notice = true, broadcast = true, hundred = 32888}, --10转首饰    
						{itemid = 1393, prob = 42888, count = 1, notice = true, broadcast = true, hundred = 32888}, --10转首饰
						{itemid = 1451, prob = 42585, count = 1, notice = true, broadcast = true, hundred = 32585}, --10转首饰

						{itemid = 1160, prob = 22888, count = 1, notice = true, broadcast = true, hundred = 22888}, --8转首饰    
						{itemid = 1218, prob = 22888, count = 1, notice = true, broadcast = true, hundred = 22888}, --8转首饰
						{itemid = 1276, prob = 22585, count = 1, notice = true, broadcast = true, hundred = 22585}, --8转首饰
						{itemid = 1334, prob = 22888, count = 1, notice = true, broadcast = true, hundred = 22888}, --8转首饰    
						{itemid = 1392, prob = 22888, count = 1, notice = true, broadcast = true, hundred = 22888}, --8转首饰
						{itemid = 1450, prob = 22585, count = 1, notice = true, broadcast = true, hundred = 22585}, --8转首饰

						{itemid = 2291, prob = 26968, count = 1, notice = true, broadcast = true, hundred = 2359}, --圣·新年达人(男) 
						{itemid = 2292, prob = 26868, count = 1, notice = true, broadcast = true, hundred = 2349}, --圣·新年达人(女) 
						{itemid = 2310, prob = 26768, count = 1, notice = true, broadcast = true, hundred = 2339}, --圣·情侣时装(男) 
						{itemid = 2311, prob = 26668, count = 1, notice = true, broadcast = true, hundred = 2329}, --圣·情侣时装(女) 
						{itemid = 2297, prob = 26568, count = 1, notice = true, broadcast = true, hundred = 2319}, --圣·返璞归真(男) 
						{itemid = 2300, prob = 26468, count = 1, notice = true, broadcast = true, hundred = 2309}, --圣·返璞归真(女) 
						{itemid = 2327, prob = 26368, count = 1, notice = true, broadcast = true, hundred = 2305}, --圣·新春时装(男)
						{itemid = 2328, prob = 26268, count = 1, notice = true, broadcast = true, hundred = 2300}, --圣·新春时装(女) 
						{itemid = 2290, prob = 26168, count = 1, notice = true, broadcast = true, hundred = 1888}, --圣·棒棒糖
						{itemid = 2306, prob = 26068, count = 1, notice = true, broadcast = true, hundred = 1887}, --圣·玫瑰花 
						{itemid = 2303, prob = 26066, count = 1, notice = true, broadcast = true, hundred = 1886}, --圣·反璞归真

						{itemid = 2887, prob = 12888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世之刃  
						{itemid = 2888, prob = 11888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世之甲
						{itemid = 2889, prob = 5888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世头盔
						{itemid = 2890, prob = 5888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世项链
						{itemid = 2891, prob = 5888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世手镯
						{itemid = 2892, prob = 5888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世戒指
						{itemid = 2893, prob = 5888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世靴子
						{itemid = 2894, prob = 5888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世腰带

						{itemid = 1159, prob = 6568, count = 1, notice = true, hundred = 15568}, --6转首饰
						{itemid = 1217, prob = 6567, count = 1, notice = true, hundred = 15567}, --6转首饰
						{itemid = 1275, prob = 6566, count = 1, notice = true, hundred = 15566}, --6转首饰
						{itemid = 1333, prob = 6565, count = 1, notice = true, hundred = 15565}, --6转首饰
						{itemid = 1391, prob = 6564, count = 1, notice = true, hundred = 15564}, --6转首饰
						{itemid = 1449, prob = 6563, count = 1, notice = true, hundred = 15563}, --6转首饰
								        
						{itemid = 1178, prob = 6558, count = 1, notice = true, hundred = 15558}, --6转首饰
						{itemid = 1236, prob = 6557, count = 1, notice = true, hundred = 15557}, --6转首饰
						{itemid = 1294, prob = 6556, count = 1, notice = true, hundred = 15556}, --6转首饰
						{itemid = 1352, prob = 6555, count = 1, notice = true, hundred = 15555}, --6转首饰
						{itemid = 1410, prob = 6553, count = 1, notice = true, hundred = 15553}, --6转首饰
						{itemid = 1468, prob = 6552, count = 1, notice = true, hundred = 15552}, --6转首饰
								        
						{itemid = 1197, prob = 6538, count = 1, notice = true, hundred = 15538}, --6转首饰
						{itemid = 1255, prob = 6537, count = 1, notice = true, hundred = 15537}, --6转首饰
						{itemid = 1313, prob = 6536, count = 1, notice = true, hundred = 15536}, --6转首饰
						{itemid = 1371, prob = 6535, count = 1, notice = true, hundred = 15535}, --6转首饰
						{itemid = 1429, prob = 6533, count = 1, notice = true, hundred = 15533}, --6转首饰
						{itemid = 1487, prob = 6532, count = 1, notice = true, hundred = 15532}, --6转首饰

						{itemid = 982 , prob = 13588, count = 1, notice = true, hundred = 13588}, --天武神剑    
						{itemid = 1051, prob = 12888, count = 1, notice = true, hundred = 12888}, --天武神甲(男)
						{itemid = 1052, prob = 12878, count = 1, notice = true, hundred = 12878}, --天武神甲(女)
						{itemid = 1001, prob = 12588, count = 1, notice = true, hundred = 12588}, --天武神剑    
						{itemid = 1089, prob = 12888, count = 1, notice = true, hundred = 12888}, --天武神甲(男)
						{itemid = 1090, prob = 12878, count = 1, notice = true, hundred = 12878}, --天武神甲(女)
						{itemid = 1020, prob = 12588, count = 1, notice = true, hundred = 12588}, --天武神剑    
						{itemid = 1127, prob = 12888, count = 1, notice = true, hundred = 12888}, --天武神甲(男)
						{itemid = 1128, prob = 12878, count = 1, notice = true, hundred = 12878}, --天武神甲(女)

						{itemid = 2209, prob = 16888, count = 1, notice = true, hundred = 16888}, --盾牌碎片(特)
						{itemid = 2213, prob = 16887, count = 1, notice = true, hundred = 16887}, --宝石碎片(特)
						{itemid = 2217, prob = 16886, count = 1, notice = true, hundred = 16886}, --魂珠碎片(特)
						{itemid = 566 , prob = 16885, count = 1, notice = true, hundred = 16885}, --超级转生丹  
						{itemid = 163 , prob = 16884, count = 1, notice = true, hundred = 16884}, --超级成就令牌
						{itemid = 162 , prob = 16883, count = 1, notice = true, hundred = 16883}, --超级灵力丹  
						{itemid = 675 , prob = 16882, count = 1, notice = true, hundred = 16882}, --999朵玫瑰花 
						{itemid = 528 , prob = 16881, count = 1, notice = true, hundred = 16881}, --特戒碎片包  
						{itemid = 2225, prob = 16880, count = 1, notice = true, hundred = 16880}, --护符碎片(特)

						{itemid = 3007, prob = 3207, count = 1, notice = true, broadcast = true, hundred = 3839}, --龙行天下 
						{itemid = 3008, prob = 3208, count = 1, notice = true, broadcast = true, hundred = 3829}, --如影随形 
						{itemid = 3009, prob = 3209, count = 1, notice = true, broadcast = true, hundred = 3819}, --双龙出海 
						{itemid = 3010, prob = 3210, count = 1, notice = true, broadcast = true, hundred = 3809}, --丘比特   
						{itemid = 3011, prob = 3211, count = 1, notice = true, broadcast = true, hundred = 3805}, --神龙开道 
						{itemid = 3012, prob = 3212, count = 1, notice = true, broadcast = true, hundred = 3800}, --冰火之歌 
						{itemid = 3013, prob = 3213, count = 1, notice = true, broadcast = true, hundred = 3088}, --弥勒笑佛
						{itemid = 3014, prob = 3214, count = 1, notice = true, broadcast = true, hundred = 3087}, --熊二快跑

						{itemid = 1158, prob = 3288, count = 1, notice = true, hundred = 8888},  --4转首饰
						{itemid = 1216, prob = 3278, count = 1, notice = true, hundred = 8878},  --4转首饰
						{itemid = 1274, prob = 3268, count = 1, notice = true, hundred = 8868},  --4转首饰
						{itemid = 1332, prob = 3258, count = 1, notice = true, hundred = 8858},  --4转首饰
						{itemid = 1390, prob = 3248, count = 1, notice = true, hundred = 8848},  --4转首饰
						{itemid = 1448, prob = 3238, count = 1, notice = true, hundred = 8838},  --4转首饰

						{itemid = 1177, prob = 3288, count = 1, notice = true, hundred = 8888}, --4转首饰
						{itemid = 1235, prob = 3278, count = 1, notice = true, hundred = 8878}, --4转首饰
						{itemid = 1293, prob = 3268, count = 1, notice = true, hundred = 8868}, --4转首饰
						{itemid = 1351, prob = 3258, count = 1, notice = true, hundred = 8858}, --4转首饰
						{itemid = 1409, prob = 3248, count = 1, notice = true, hundred = 8848}, --4转首饰
						{itemid = 1467, prob = 3238, count = 1, notice = true, hundred = 8838}, --4转首饰

						{itemid = 1196, prob = 3288, count = 1, notice = true, hundred = 8888}, --4转首饰
						{itemid = 1254, prob = 3278, count = 1, notice = true, hundred = 8878}, --4转首饰
						{itemid = 1312, prob = 3268, count = 1, notice = true, hundred = 8868}, --4转首饰
						{itemid = 1370, prob = 3258, count = 1, notice = true, hundred = 8858}, --4转首饰
						{itemid = 1428, prob = 3248, count = 1, notice = true, hundred = 8848}, --4转首饰
						{itemid = 1486, prob = 3238, count = 1, notice = true, hundred = 8838}, --4转首饰

						{itemid = 1158, prob = 3288, count = 1, notice = true, hundred = 8888},  --4转首饰
						{itemid = 1216, prob = 3278, count = 1, notice = true, hundred = 8878},  --4转首饰
						{itemid = 1274, prob = 3268, count = 1, notice = true, hundred = 8868},  --4转首饰
						{itemid = 1332, prob = 3258, count = 1, notice = true, hundred = 8858},  --4转首饰
						{itemid = 1390, prob = 3248, count = 1, notice = true, hundred = 8848},  --4转首饰
						{itemid = 1448, prob = 3238, count = 1, notice = true, hundred = 8838},  --4转首饰

						{itemid = 1177, prob = 3288, count = 1, notice = true, hundred = 8888}, --4转首饰
						{itemid = 1235, prob = 3278, count = 1, notice = true, hundred = 8878}, --4转首饰
						{itemid = 1293, prob = 3268, count = 1, notice = true, hundred = 8868}, --4转首饰
						{itemid = 1351, prob = 3258, count = 1, notice = true, hundred = 8858}, --4转首饰
						{itemid = 1409, prob = 3248, count = 1, notice = true, hundred = 8848}, --4转首饰
						{itemid = 1467, prob = 3238, count = 1, notice = true, hundred = 8838}, --4转首饰

						{itemid = 1196, prob = 3288, count = 1, notice = true, hundred = 8888}, --4转首饰
						{itemid = 1254, prob = 3278, count = 1, notice = true, hundred = 8878}, --4转首饰
						{itemid = 1312, prob = 3268, count = 1, notice = true, hundred = 8868}, --4转首饰
						{itemid = 1370, prob = 3258, count = 1, notice = true, hundred = 8858}, --4转首饰
						{itemid = 1428, prob = 3248, count = 1, notice = true, hundred = 8848}, --4转首饰
						{itemid = 1486, prob = 3238, count = 1, notice = true, hundred = 8838}, --4转首饰

						{itemid = 981 , prob = 3288, count = 1, notice = true, hundred = 3288}, --轩辕神剑    
						{itemid = 1049, prob = 3290, count = 1, notice = true, hundred = 3290}, --轩辕神甲(男)
						{itemid = 1050, prob = 3280, count = 1, notice = true, hundred = 3280}, --轩辕神甲(女)
						{itemid = 1000, prob = 3288, count = 1, notice = true, hundred = 3288}, --轩辕神剑    
						{itemid = 1087, prob = 3290, count = 1, notice = true, hundred = 3290}, --轩辕神甲(男)
						{itemid = 1088, prob = 3280, count = 1, notice = true, hundred = 3280}, --轩辕神甲(女)
						{itemid = 1019, prob = 3288, count = 1, notice = true, hundred = 3288}, --轩辕神剑    
						{itemid = 1125, prob = 3290, count = 1, notice = true, hundred = 3290}, --轩辕神甲(男)
						{itemid = 1126, prob = 3280, count = 1, notice = true, hundred = 3280}, --轩辕神甲(女)

						{itemid = 2635, prob = 9099, count = 1, notice = true, broadcast = true, hundred = 3289}, --青龙阵石 
						{itemid = 2636, prob = 9089, count = 1, notice = true, broadcast = true, hundred = 3289}, --白虎阵石 
						{itemid = 2637, prob = 9079, count = 1, notice = true, broadcast = true, hundred = 3279}, --朱雀阵石 
						{itemid = 2638, prob = 9069, count = 1, notice = true, broadcast = true, hundred = 3269}, --玄武阵石
	
						{itemid = 1940, prob = 988, count = 1, notice = true, hundred = 8888},	--五级羽毛
						{itemid = 1941, prob = 988, count = 1, notice = true, broadcast = true, hundred = 3289}, --六级羽毛 

						{itemid = 636 , prob = 2989, count = 1, notice = true, broadcast = true, hundred = 3289}, --马鞍 
						{itemid = 624 , prob = 2988, count = 1, notice = true, broadcast = true, hundred = 3289}, --蹄铁 
						{itemid = 628 , prob = 2987, count = 1, notice = true, broadcast = true, hundred = 3279}, --缰绳 
						{itemid = 632 , prob = 2986, count = 1, notice = true, broadcast = true, hundred = 3269}, --马镫

						{itemid = 640 , prob = 2889, count = 1, notice = true, broadcast = true, hundred = 3289}, --银光闪豹 
						{itemid = 641 , prob = 2879, count = 1, notice = true, broadcast = true, hundred = 3279}, --万圣战轮 
						{itemid = 642 , prob = 2869, count = 1, notice = true, broadcast = true, hundred = 3269}, --蒸朋怒鲨
						{itemid = 643 , prob = 2889, count = 1, notice = true, broadcast = true, hundred = 3289}, --百鸟朝凤 

						{itemid = 588 , prob = 3089, count = 1, notice = true, broadcast = true, hundred = 3289}, --关羽时装 
						{itemid = 592 , prob = 3079, count = 1, notice = true, broadcast = true, hundred = 3279}, --赵云时装 
						{itemid = 596 , prob = 3069, count = 1, notice = true, broadcast = true, hundred = 3269}, --吕布时装
						{itemid = 612 , prob = 3089, count = 1, notice = true, broadcast = true, hundred = 3289}, --大乔时装 
						{itemid = 616 , prob = 3079, count = 1, notice = true, broadcast = true, hundred = 3279}, --小乔时装 
						{itemid = 620 , prob = 3069, count = 1, notice = true, broadcast = true, hundred = 3269}, --貂蝉时装

						{itemid = 600 , prob = 2889, count = 1, notice = true, broadcast = true, hundred = 3289}, --青龙偃月刀 
						{itemid = 604 , prob = 2879, count = 1, notice = true, broadcast = true, hundred = 3279}, --百鸟朝凤枪 
						{itemid = 608 , prob = 2869, count = 1, notice = true, broadcast = true, hundred = 3269}, --方天画戟

						{itemid = 492 , prob = 3239, count = 1, notice = true, broadcast = true, hundred = 3839}, --返璞归真 
						{itemid = 493 , prob = 3229, count = 1, notice = true, broadcast = true, hundred = 3829}, --鸾凤和鸣 
						{itemid = 494 , prob = 3219, count = 1, notice = true, broadcast = true, hundred = 3819}, --双龙出海 
						{itemid = 495 , prob = 3209, count = 1, notice = true, broadcast = true, hundred = 3809}, --紫翼东升 

						{itemid = 341 , prob = 2839, count = 1, notice = true, broadcast = true, hundred = 3839}, --法老服饰(男) 
						{itemid = 342 , prob = 2829, count = 1, notice = true, broadcast = true, hundred = 3829}, --法老服饰(女) 
						{itemid = 350 , prob = 2819, count = 1, notice = true, broadcast = true, hundred = 3819}, --拳击战服(男) 
						{itemid = 351 , prob = 2809, count = 1, notice = true, broadcast = true, hundred = 3809}, --拳击战服(女) 
						{itemid = 2319, prob = 2805, count = 1, notice = true, broadcast = true, hundred = 3805}, --菊花一锦(男) 
						{itemid = 2320, prob = 2800, count = 1, notice = true, broadcast = true, hundred = 3800}, --菊花一锦(女) 
						{itemid = 2316, prob = 2788, count = 1, notice = true, broadcast = true, hundred = 3088}, --菊花
						{itemid = 338 , prob = 2787, count = 1, notice = true, broadcast = true, hundred = 3087}, --法老权杖 
						{itemid = 347 , prob = 2786, count = 1, notice = true, broadcast = true, hundred = 3086}, --拳击暴雷

						{itemid = 327, prob = 2588, count = 1, notice = true, broadcast = true, hundred = 2588}, --足迹
						{itemid = 328, prob = 2587, count = 1, notice = true, broadcast = true, hundred = 2587}, --足迹
						{itemid = 329, prob = 2586, count = 1, notice = true, broadcast = true, hundred = 2586}, --足迹
						{itemid = 330, prob = 2585, count = 1, notice = true, broadcast = true, hundred = 2585}, --足迹
						{itemid = 331, prob = 2584, count = 1, notice = true, broadcast = true, hundred = 2584}, --足迹
						{itemid = 332, prob = 2583, count = 1, notice = true, broadcast = true, hundred = 2583}, --足迹
						{itemid = 333, prob = 2582, count = 1, notice = true, broadcast = true, hundred = 2582}, --足迹
						{itemid = 334, prob = 2581, count = 1, notice = true, broadcast = true, hundred = 2581}, --足迹 
						{itemid = 335, prob = 2580, count = 1, notice = true, broadcast = true, hundred = 2580}, --足迹

						{itemid = 2156, prob = 2059, count = 1, notice = true, broadcast = true, hundred = 2359}, --新年达人(男) 
						{itemid = 2157, prob = 2049, count = 1, notice = true, broadcast = true, hundred = 2349}, --新年达人(女) 
						{itemid = 2308, prob = 2039, count = 1, notice = true, broadcast = true, hundred = 2339}, --情侣时装(男) 
						{itemid = 2309, prob = 2029, count = 1, notice = true, broadcast = true, hundred = 2329}, --情侣时装(女) 
						{itemid = 2296, prob = 2019, count = 1, notice = true, broadcast = true, hundred = 2319}, --返璞归真(男) 
						{itemid = 2299, prob = 2009, count = 1, notice = true, broadcast = true, hundred = 2309}, --返璞归真(女) 
						{itemid = 2325, prob = 2005, count = 1, notice = true, broadcast = true, hundred = 2305}, --新春时装(男) 
						{itemid = 2326, prob = 2000, count = 1, notice = true, broadcast = true, hundred = 2300}, --新春时装(女) 
						{itemid = 2155, prob = 1688, count = 1, notice = true, broadcast = true, hundred = 1888}, --棒棒糖
						{itemid = 2305, prob = 1687, count = 1, notice = true, broadcast = true, hundred = 1887}, --玫瑰花 
						{itemid = 2302, prob = 1686, count = 1, notice = true, broadcast = true, hundred = 1886}, --反璞归真
						{itemid = 2203, prob = 1388, count = 1, notice = true, broadcast = true, hundred = 1688},--神器碎片
						{itemid = 2204, prob = 1388, count = 1, notice = true, broadcast = true, hundred = 1688},--神甲碎片

						{itemid = 1157, prob = 1588, count = 1, notice = true, hundred = 1588}, --2转首饰 
						{itemid = 1215, prob = 1578, count = 1, notice = true, hundred = 1578}, --2转首饰 
						{itemid = 1273, prob = 1568, count = 1, notice = true, hundred = 1568}, --2转首饰 
						{itemid = 1331, prob = 1558, count = 1, notice = true, hundred = 1558}, --2转首饰 
						{itemid = 1389, prob = 1548, count = 1, notice = true, hundred = 1548}, --2转首饰 
						{itemid = 1447, prob = 1538, count = 1, notice = true, hundred = 1538}, --2转首饰 

						{itemid = 1234, prob = 1578, count = 1, notice = true, hundred = 1578}, --2转首饰 
						{itemid = 1292, prob = 1568, count = 1, notice = true, hundred = 1568}, --2转首饰 
						{itemid = 1350, prob = 1558, count = 1, notice = true, hundred = 1558}, --2转首饰 
						{itemid = 1408, prob = 1548, count = 1, notice = true, hundred = 1548}, --2转首饰 
						{itemid = 1466, prob = 1538, count = 1, notice = true, hundred = 1538}, --2转首饰 

						{itemid = 1195, prob = 1588, count = 1, notice = true, hundred = 1588}, --2转首饰 
						{itemid = 1253, prob = 1578, count = 1, notice = true, hundred = 1578}, --2转首饰 
						{itemid = 1311, prob = 1568, count = 1, notice = true, hundred = 1568}, --2转首饰 
						{itemid = 1369, prob = 1558, count = 1, notice = true, hundred = 1558}, --2转首饰 
						{itemid = 1427, prob = 1548, count = 1, notice = true, hundred = 1548}, --2转首饰 
						{itemid = 1485, prob = 1538, count = 1, notice = true, hundred = 1538}, --2转首饰 

						{itemid = 1157, prob = 1588, count = 1, notice = true, hundred = 1588}, --2转首饰 
						{itemid = 1215, prob = 1578, count = 1, notice = true, hundred = 1578}, --2转首饰 
						{itemid = 1273, prob = 1568, count = 1, notice = true, hundred = 1568}, --2转首饰 
						{itemid = 1331, prob = 1558, count = 1, notice = true, hundred = 1558}, --2转首饰 
						{itemid = 1389, prob = 1548, count = 1, notice = true, hundred = 1548}, --2转首饰 
						{itemid = 1447, prob = 1538, count = 1, notice = true, hundred = 1538}, --2转首饰 

						{itemid = 1234, prob = 1578, count = 1, notice = true, hundred = 1578}, --2转首饰 
						{itemid = 1292, prob = 1568, count = 1, notice = true, hundred = 1568}, --2转首饰 
						{itemid = 1350, prob = 1558, count = 1, notice = true, hundred = 1558}, --2转首饰 
						{itemid = 1408, prob = 1548, count = 1, notice = true, hundred = 1548}, --2转首饰 
						{itemid = 1466, prob = 1538, count = 1, notice = true, hundred = 1538}, --2转首饰 

						{itemid = 1195, prob = 1588, count = 1, notice = true, hundred = 1588}, --2转首饰 
						{itemid = 1253, prob = 1578, count = 1, notice = true, hundred = 1578}, --2转首饰 
						{itemid = 1311, prob = 1568, count = 1, notice = true, hundred = 1568}, --2转首饰 
						{itemid = 1369, prob = 1558, count = 1, notice = true, hundred = 1558}, --2转首饰 
						{itemid = 1427, prob = 1548, count = 1, notice = true, hundred = 1548}, --2转首饰 
						{itemid = 1485, prob = 1538, count = 1, notice = true, hundred = 1538}, --2转首饰 

						{itemid = 980 , prob = 988, count = 1, notice = true, hundred = 988}, --伏虎令剑    
						{itemid = 1047, prob = 990, count = 1, notice = true, hundred = 990}, --伏虎战甲(男)
						{itemid = 1048, prob = 980, count = 1, notice = true, hundred = 980}, --伏虎战甲(女)
						{itemid = 999 , prob = 988, count = 1, notice = true, hundred = 988}, --伏虎令剑    
						{itemid = 1085, prob = 990, count = 1, notice = true, hundred = 990}, --伏虎战甲(男)
						{itemid = 1086, prob = 980, count = 1, notice = true, hundred = 980}, --伏虎战甲(女)
						{itemid = 1018, prob = 988, count = 1, notice = true, hundred = 988}, --伏虎令剑    
						{itemid = 1123, prob = 990, count = 1, notice = true, hundred = 990}, --伏虎战甲(男)
						{itemid = 1124, prob = 980, count = 1, notice = true, hundred = 980}, --伏虎战甲(女)

						{itemid = 2210, prob = 898, count = 1, notice = true, hundred = 898}, --盾牌碎片(大)    
						{itemid = 2214, prob = 878, count = 1, notice = true, hundred = 878}, --宝石碎片(大)    
						{itemid = 2218, prob = 868, count = 1, notice = true, hundred = 868}, --魂珠碎片(大)    
						{itemid = 565 , prob = 888, count = 1, notice = true, hundred = 888}, --高级转生丹      
						{itemid = 145 , prob = 898, count = 1, notice = true, hundred = 898}, --高级成就令牌    
						{itemid = 161 , prob = 878, count = 1, notice = true, hundred = 878}, --高级灵力丹      
						{itemid = 674 , prob = 868, count = 1, notice = true, hundred = 868}, --99朵玫瑰花      
						{itemid = 849 , prob = 858, count = 1, notice = true, hundred = 858}, --五倍经验(2小时) 
						{itemid = 2111, prob = 818, count = 1, notice = true, hundred = 818}, --二级暴击宝石    
						{itemid = 160 , prob = 588, count = 1, notice = true, hundred = 588},  --灵力丹(大)      
						{itemid = 527 , prob = 886, count = 1, notice = true, hundred = 886},  --特戒碎片        
						{itemid = 2226, prob = 885, count = 1, notice = true, hundred = 885}, --护符碎片(大)  

						{itemid = 1156, prob = 588, count = 1, notice = true, hundred = 588}, --1转首饰 
						{itemid = 1214, prob = 578, count = 1, notice = true, hundred = 578}, --1转首饰 
						{itemid = 1272, prob = 568, count = 1, notice = true, hundred = 568}, --1转首饰 
						{itemid = 1330, prob = 558, count = 1, notice = true, hundred = 558}, --1转首饰 
						{itemid = 1388, prob = 548, count = 1, notice = true, hundred = 548}, --1转首饰 
						{itemid = 1446, prob = 538, count = 1, notice = true, hundred = 538}, --1转首饰 

						{itemid = 1175, prob = 586, count = 1, notice = true, hundred = 586}, --1转首饰 
						{itemid = 1233, prob = 576, count = 1, notice = true, hundred = 576}, --1转首饰 
						{itemid = 1291, prob = 566, count = 1, notice = true, hundred = 566}, --1转首饰 
						{itemid = 1349, prob = 556, count = 1, notice = true, hundred = 556}, --1转首饰 
						{itemid = 1407, prob = 546, count = 1, notice = true, hundred = 546}, --1转首饰 
						{itemid = 1465, prob = 536, count = 1, notice = true, hundred = 536}, --1转首饰

						{itemid = 1194, prob = 585, count = 1, notice = true, hundred = 585}, --1转首饰 
						{itemid = 1252, prob = 575, count = 1, notice = true, hundred = 575}, --1转首饰 
						{itemid = 1310, prob = 565, count = 1, notice = true, hundred = 565}, --1转首饰 
						{itemid = 1368, prob = 555, count = 1, notice = true, hundred = 555}, --1转首饰 
						{itemid = 1426, prob = 545, count = 1, notice = true, hundred = 545}, --1转首饰 
						{itemid = 1484, prob = 535, count = 1, notice = true, hundred = 535}, --1转首饰 

						{itemid = 1156, prob = 588, count = 1, notice = true, hundred = 588}, --1转首饰 
						{itemid = 1214, prob = 578, count = 1, notice = true, hundred = 578}, --1转首饰 
						{itemid = 1272, prob = 568, count = 1, notice = true, hundred = 568}, --1转首饰 
						{itemid = 1330, prob = 558, count = 1, notice = true, hundred = 558}, --1转首饰 
						{itemid = 1388, prob = 548, count = 1, notice = true, hundred = 548}, --1转首饰 
						{itemid = 1446, prob = 538, count = 1, notice = true, hundred = 538}, --1转首饰 

						{itemid = 1175, prob = 586, count = 1, notice = true, hundred = 586}, --1转首饰 
						{itemid = 1233, prob = 576, count = 1, notice = true, hundred = 576}, --1转首饰 
						{itemid = 1291, prob = 566, count = 1, notice = true, hundred = 566}, --1转首饰 
						{itemid = 1349, prob = 556, count = 1, notice = true, hundred = 556}, --1转首饰 
						{itemid = 1407, prob = 546, count = 1, notice = true, hundred = 546}, --1转首饰 
						{itemid = 1465, prob = 536, count = 1, notice = true, hundred = 536}, --1转首饰

						{itemid = 1194, prob = 585, count = 1, notice = true, hundred = 585}, --1转首饰 
						{itemid = 1252, prob = 575, count = 1, notice = true, hundred = 575}, --1转首饰 
						{itemid = 1310, prob = 565, count = 1, notice = true, hundred = 565}, --1转首饰 
						{itemid = 1368, prob = 555, count = 1, notice = true, hundred = 555}, --1转首饰 
						{itemid = 1426, prob = 545, count = 1, notice = true, hundred = 545}, --1转首饰 
						{itemid = 1484, prob = 535, count = 1, notice = true, hundred = 535}, --1转首饰 

						{itemid = 979 , prob = 168, count = 1, notice = false, hundred = 168}, --修罗之刃      
						{itemid = 1045, prob = 165, count = 1, notice = false, hundred = 165}, --修罗战甲(男)  
						{itemid = 1046, prob = 162, count = 1, notice = false, hundred = 162}, --修罗战甲(女)  
						{itemid = 998 , prob = 167, count = 1, notice = false, hundred = 167}, --修罗之刃      
						{itemid = 1083, prob = 164, count = 1, notice = false, hundred = 164}, --修罗战甲(男)  
						{itemid = 1084, prob = 161, count = 1, notice = false, hundred = 161}, --修罗战甲(女)  
						{itemid = 1017, prob = 166, count = 1, notice = false, hundred = 166}, --修罗之刃      
						{itemid = 1121, prob = 163, count = 1, notice = false, hundred = 163}, --修罗战甲(男)  
						{itemid = 1122, prob = 160, count = 1, notice = false, hundred = 160}, --修罗战甲(女)  

						{itemid = 2123, prob = 2638, count = 1, notice = false, hundred = 238}, --子鼠玉佩  
						{itemid = 2124, prob = 2638, count = 1, notice = false, hundred = 237}, --丑牛玉佩  
						{itemid = 2125, prob = 2638, count = 1, notice = false, hundred = 236}, --寅虎玉佩  
						{itemid = 2126, prob = 2638, count = 1, notice = false, hundred = 235}, --卯兔玉佩  
						{itemid = 2127, prob = 2638, count = 1, notice = false, hundred = 234}, --辰龙玉佩  
						{itemid = 2128, prob = 2638, count = 1, notice = false, hundred = 233}, --巳蛇玉佩 
						{itemid = 2129, prob = 2638, count = 1, notice = false, hundred = 238}, --午马玉佩  
						{itemid = 2130, prob = 2638, count = 1, notice = false, hundred = 237}, --未羊玉佩  
						{itemid = 2131, prob = 2638, count = 1, notice = false, hundred = 236}, --申猴玉佩  
						{itemid = 2132, prob = 2638, count = 1, notice = false, hundred = 235}, --酉鸡玉佩  
						{itemid = 2133, prob = 2638, count = 1, notice = false, hundred = 234}, --戌狗玉佩  
						{itemid = 2134, prob = 2638, count = 1, notice = false, hundred = 233}, --亥猪玉佩 

						{itemid = 1155, prob = 128, count = 1, notice = false, hundred = 128}, --90级首饰  
						{itemid = 1213, prob = 127, count = 1, notice = false, hundred = 127}, --90级首饰  
						{itemid = 1271, prob = 126, count = 1, notice = false, hundred = 126}, --90级首饰  
						{itemid = 1329, prob = 125, count = 1, notice = false, hundred = 125}, --90级首饰  
						{itemid = 1387, prob = 124, count = 1, notice = false, hundred = 124}, --90级首饰  
						{itemid = 1445, prob = 123, count = 1, notice = false, hundred = 123}, --90级首饰  

						{itemid = 1174, prob = 128, count = 1, notice = false, hundred = 128}, --90级首饰  
						{itemid = 1232, prob = 127, count = 1, notice = false, hundred = 127}, --90级首饰  
						{itemid = 1290, prob = 126, count = 1, notice = false, hundred = 126}, --90级首饰  
						{itemid = 1348, prob = 125, count = 1, notice = false, hundred = 125}, --90级首饰  
						{itemid = 1406, prob = 124, count = 1, notice = false, hundred = 124}, --90级首饰  
						{itemid = 1464, prob = 123, count = 1, notice = false, hundred = 123}, --90级首饰 

						{itemid = 1193, prob = 128, count = 1, notice = false, hundred = 128}, --90级首饰  
						{itemid = 1251, prob = 127, count = 1, notice = false, hundred = 127}, --90级首饰  
						{itemid = 1309, prob = 126, count = 1, notice = false, hundred = 126}, --90级首饰  
						{itemid = 1367, prob = 125, count = 1, notice = false, hundred = 125}, --90级首饰  
						{itemid = 1425, prob = 124, count = 1, notice = false, hundred = 124}, --90级首饰  
						{itemid = 1483, prob = 123, count = 1, notice = false, hundred = 123}, --90级首饰 

						{itemid = 2197, prob = 18, count = 1, notice = false, hundred = 18},    --典
						{itemid = 2196, prob = 17, count = 1, notice = false, hundred = 17},    --庆
						{itemid = 2195, prob = 16, count = 1, notice = false, hundred = 16},    --服
						{itemid = 2193, prob = 15, count = 1, notice = false, hundred = 15},    --千
						{itemid = 2886, prob = 16, count = 1, notice = false, hundred = 14}, --传世宝钻 
						{itemid = 841, prob = 30, count = 1, notice = false, hundred = 10}, --圣兽灵石 
						{itemid = 818 , prob = 4 , count = 1, notice = false, hundred = 1 }, --英雄经验丹  
						{itemid = 513 , prob = 1 , count = 1, notice = false, hundred = 1 }, --经验丹(大)   
					},
				},
			},
			--法师
			{
				{
					money = 3000,		--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 5,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1159, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1217, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1275, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1333, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1391, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1449, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1178, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1236, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1294, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1352, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1410, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1468, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1197, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1255, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1313, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1371, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1429, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1487, prob = 18, count = 1, notice = true, hundred = 18},
					},
				},

				{
					money = 10000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 8,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1159, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1217, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1275, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1333, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1391, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1449, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1178, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1236, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1294, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1352, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1410, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1468, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1197, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1255, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1313, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1371, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1429, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1487, prob = 18, count = 1, notice = true, hundred = 18},
					},
				},
				{
					money = 30000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 12,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1179, prob = 11, count = 1, notice = true, broadcast = true, hundred = 11}, --8转首饰
						{itemid = 1237, prob = 9 , count = 1, notice = true, broadcast = true, hundred = 9 }, --8转首饰
						{itemid = 1295, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1353, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1411, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1469, prob = 7 , count = 1, notice = true, broadcast = true, hundred = 7 }, --8转首饰
					},
				},
				{
					money = 60000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1159, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1217, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1275, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1333, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1391, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1449, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1178, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1236, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1294, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1352, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1410, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1468, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1197, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1255, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1313, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1371, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1429, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1487, prob = 18, count = 1, notice = true, hundred = 18},
					},
				},
				{
					money = 90000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 15,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1179, prob = 11, count = 1, notice = true, broadcast = true, hundred = 11}, --8转首饰
						{itemid = 1237, prob = 9 , count = 1, notice = true, broadcast = true, hundred = 9 }, --8转首饰
						{itemid = 1295, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1353, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1411, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1469, prob = 7 , count = 1, notice = true, broadcast = true, hundred = 7 }, --8转首饰
					},
				},
				{
					money = 120000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1159, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1217, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1275, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1333, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1391, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1449, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1178, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1236, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1294, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1352, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1410, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1468, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1197, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1255, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1313, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1371, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1429, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1487, prob = 18, count = 1, notice = true, hundred = 18},
					},
				},
				{
					money = 150000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 15,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1179, prob = 11, count = 1, notice = true, broadcast = true, hundred = 11}, --8转首饰
						{itemid = 1237, prob = 9 , count = 1, notice = true, broadcast = true, hundred = 9 }, --8转首饰
						{itemid = 1295, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1353, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1411, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1469, prob = 7 , count = 1, notice = true, broadcast = true, hundred = 7 }, --8转首饰
					},
				},
				{
					money = 180000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 12,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1180, prob = 11, count = 1, notice = true, broadcast = true, hundred = 11}, --10转首饰
						{itemid = 1238, prob = 9 , count = 1, notice = true, broadcast = true, hundred = 9 }, --10转首饰
						{itemid = 1296, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --10转首饰
						{itemid = 1354, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --10转首饰
						{itemid = 1412, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --10转首饰
						{itemid = 1470, prob = 7 , count = 1, notice = true, broadcast = true, hundred = 7 }, --10转首饰
					},
				},
				{
					count = 200,	--寻宝次数大于此值才会进入
					maxcount = 250,	--寻宝次数等于此值必定进入
					limit = 1,		--限制进入次数,-1为不限制
					prob = 5,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 2201, prob = 26, count = 1, notice = true, hundred = 26},  --欢
						{itemid = 2200, prob = 10, count = 1, notice = true, hundred = 10},  --狂
						{itemid = 2199, prob = 3 , count = 1, notice = true, hundred = 3},   --民
						{itemid = 2198, prob = 1 , count = 1, notice = true, hundred = 1},   --全
					},
				},
				{
					money = 0,	--寻宝花费数大于此值才会进入此表
					limit = -1,		--限制进入次数,-1为不限制
					prob = 1,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 2276, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 25888}, --铁血武器        
						{itemid = 2277, prob = 25668, count = 1, notice = true, broadcast = true, hundred = 25668}, --铁血衣服(男)
						{itemid = 2284, prob = 25588, count = 1, notice = true, broadcast = true, hundred = 25588}, --铁血衣服(女)

						{itemid = 2344, prob = 15288, count = 1, notice = true, hundred = 6888}, --傲视狂舞斩(英雄)    
						{itemid = 2354, prob = 15188, count = 1, notice = true, hundred = 6888}, --乾坤降魔杖(英雄)    
						{itemid = 2364, prob = 15088, count = 1, notice = true, hundred = 6888}, --紫金龙皇剑(英雄)    
						{itemid = 2380, prob = 15088, count = 1, notice = true, hundred = 6888}, --傲视狂舞甲(男)(英雄)
						{itemid = 2381, prob = 15088, count = 1, notice = true, hundred = 6888}, --傲视狂舞甲(女)(英雄)
						{itemid = 2400, prob = 15088, count = 1, notice = true, hundred = 6888}, --乾坤降魔衣(男)(英雄)
						{itemid = 2401, prob = 15088, count = 1, notice = true, hundred = 6888}, --乾坤降魔衣(女)(英雄)
						{itemid = 2420, prob = 15088, count = 1, notice = true, hundred = 6888}, --紫金龙皇甲(男)(英雄)
						{itemid = 2421, prob = 15088, count = 1, notice = true, hundred = 6888}, --紫金龙皇甲(女)(英雄)

						{itemid = 2345, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙战剑(英雄)      
						{itemid = 2355, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙魔杖(英雄)    
						{itemid = 2365, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙宝剑(英雄)    
						{itemid = 2382, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙战甲(男)(英雄)
						{itemid = 2383, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙战甲(女)(英雄)
						{itemid = 2402, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙魔衣(男)(英雄)
						{itemid = 2403, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙魔衣(女)(英雄)
						{itemid = 2422, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙道袍(男)(英雄)
						{itemid = 2423, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙道袍(女)(英雄)

						{itemid = 2346, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王战剑(英雄)     
						{itemid = 2356, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王魔杖(英雄)    
						{itemid = 2366, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王道剑(英雄)    
						{itemid = 2384, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王战甲(男)(英雄)
						{itemid = 2385, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王战甲(女)(英雄)
						{itemid = 2404, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王魔衣(男)(英雄)
						{itemid = 2405, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王魔衣(女)(英雄)
						{itemid = 2424, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王道袍(男)(英雄)
						{itemid = 2425, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王道袍(女)(英雄)

						{itemid = 1298, prob = 41588, count = 1, notice = true, broadcast = true, hundred = 32888}, --杀神法镯    
						{itemid = 1356, prob = 41888, count = 1, notice = true, broadcast = true, hundred = 32888}, --杀神法戒
						{itemid = 1182, prob = 42585, count = 1, notice = true, broadcast = true, hundred = 32585}, --杀神法盔
						{itemid = 1240, prob = 42688, count = 1, notice = true, broadcast = true, hundred = 32888}, --杀神法链    
						{itemid = 1414, prob = 42988, count = 1, notice = true, broadcast = true, hundred = 32888}, --杀神法带
						{itemid = 1472, prob = 42885, count = 1, notice = true, broadcast = true, hundred = 32585}, --杀神法靴

						{itemid = 765, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 59888}, --神之斩    
						{itemid = 766, prob = 35888, count = 1, notice = true, broadcast = true, hundred = 58888}, --神之甲
						{itemid = 767, prob = 28585, count = 1, notice = true, broadcast = true, hundred = 58585}, --神之盔
						{itemid = 768, prob = 28881, count = 1, notice = true, broadcast = true, hundred = 59888}, --神之链    
						{itemid = 769, prob = 28882, count = 1, notice = true, broadcast = true, hundred = 58888}, --神之镯
						{itemid = 770, prob = 28585, count = 1, notice = true, broadcast = true, hundred = 58585}, --神之戒
						{itemid = 771, prob = 28883, count = 1, notice = true, broadcast = true, hundred = 59888}, --神之带    
						{itemid = 772, prob = 28988, count = 1, notice = true, broadcast = true, hundred = 59888}, --神之靴

						{itemid = 1006, prob = 39888, count = 1, notice = true, broadcast = true, hundred = 59888}, --至尊杀神杖        
						{itemid = 1099, prob = 35888, count = 1, notice = true, broadcast = true, hundred = 58888}, --至尊杀神披风(男)
						{itemid = 1100, prob = 35585, count = 1, notice = true, broadcast = true, hundred = 58585}, --至尊杀神披风(女)

						{itemid = 1005, prob = 32888, count = 1, notice = true, broadcast = true, hundred = 59888}, --杀神之杖        
						{itemid = 1097, prob = 31888, count = 1, notice = true, broadcast = true, hundred = 58888}, --杀神披风(男)
						{itemid = 1098, prob = 31585, count = 1, notice = true, broadcast = true, hundred = 58585}, --杀神披风(女)

						{itemid = 1003, prob = 159888, count = 1, notice = true, broadcast = true, hundred = 59888}, --8转武器    
						{itemid = 1093, prob = 158888, count = 1, notice = true, broadcast = true, hundred = 58888}, --8转衣服(男)
						{itemid = 1094, prob = 158585, count = 1, notice = true, broadcast = true, hundred = 58585}, --8转衣服(女)

						{itemid = 1002, prob = 32886, count = 1, notice = true, broadcast = true, hundred = 32886}, --傲视狂舞斩    
						{itemid = 1091, prob = 32883, count = 1, notice = true, broadcast = true, hundred = 32883}, --傲视狂舞甲(男)
						{itemid = 1092, prob = 32586, count = 1, notice = true, broadcast = true, hundred = 32586}, --傲视狂舞甲(女)

						{itemid = 1297, prob = 21588, count = 1, notice = true, broadcast = true, hundred = 32888}, --杀神法镯    
						{itemid = 1355, prob = 21888, count = 1, notice = true, broadcast = true, hundred = 32888}, --杀神法戒
						{itemid = 1181, prob = 22585, count = 1, notice = true, broadcast = true, hundred = 32585}, --杀神法盔
						{itemid = 1239, prob = 22688, count = 1, notice = true, broadcast = true, hundred = 32888}, --杀神法链    
						{itemid = 1413, prob = 22988, count = 1, notice = true, broadcast = true, hundred = 32888}, --杀神法带
						{itemid = 1471, prob = 22885, count = 1, notice = true, broadcast = true, hundred = 32585}, --杀神法靴

						{itemid = 1180, prob = 42888, count = 1, notice = true, broadcast = true, hundred = 32888}, --10转首饰    
						{itemid = 1238, prob = 42888, count = 1, notice = true, broadcast = true, hundred = 32888}, --10转首饰
						{itemid = 1296, prob = 42585, count = 1, notice = true, broadcast = true, hundred = 32585}, --10转首饰
						{itemid = 1354, prob = 42888, count = 1, notice = true, broadcast = true, hundred = 32888}, --10转首饰    
						{itemid = 1412, prob = 42888, count = 1, notice = true, broadcast = true, hundred = 32888}, --10转首饰
						{itemid = 1470, prob = 42585, count = 1, notice = true, broadcast = true, hundred = 32585}, --10转首饰

						{itemid = 1179, prob = 22888, count = 1, notice = true, broadcast = true, hundred = 22888}, --8转首饰
						{itemid = 1237, prob = 22888, count = 1, notice = true, broadcast = true, hundred = 22888}, --8转首饰
						{itemid = 1295, prob = 22585, count = 1, notice = true, broadcast = true, hundred = 22585}, --8转首饰
						{itemid = 1353, prob = 22888, count = 1, notice = true, broadcast = true, hundred = 22888}, --8转首饰
						{itemid = 1411, prob = 22888, count = 1, notice = true, broadcast = true, hundred = 22888}, --8转首饰
						{itemid = 1469, prob = 22585, count = 1, notice = true, broadcast = true, hundred = 22585}, --8转首饰

						{itemid = 2291, prob = 26968, count = 1, notice = true, broadcast = true, hundred = 2359}, --圣·新年达人(男) 
						{itemid = 2292, prob = 26868, count = 1, notice = true, broadcast = true, hundred = 2349}, --圣·新年达人(女) 
						{itemid = 2310, prob = 26768, count = 1, notice = true, broadcast = true, hundred = 2339}, --圣·情侣时装(男) 
						{itemid = 2311, prob = 26668, count = 1, notice = true, broadcast = true, hundred = 2329}, --圣·情侣时装(女) 
						{itemid = 2297, prob = 26568, count = 1, notice = true, broadcast = true, hundred = 2319}, --圣·返璞归真(男) 
						{itemid = 2300, prob = 26468, count = 1, notice = true, broadcast = true, hundred = 2309}, --圣·返璞归真(女) 
						{itemid = 2327, prob = 26368, count = 1, notice = true, broadcast = true, hundred = 2305}, --圣·新春时装(男)
						{itemid = 2328, prob = 26268, count = 1, notice = true, broadcast = true, hundred = 2300}, --圣·新春时装(女) 
						{itemid = 2290, prob = 26168, count = 1, notice = true, broadcast = true, hundred = 1888}, --圣·棒棒糖
						{itemid = 2306, prob = 26068, count = 1, notice = true, broadcast = true, hundred = 1887}, --圣·玫瑰花 
						{itemid = 2303, prob = 26066, count = 1, notice = true, broadcast = true, hundred = 1886}, --圣·反璞归真

						{itemid = 2887, prob = 12888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世之刃  
						{itemid = 2888, prob = 11888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世之甲
						{itemid = 2889, prob = 5888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世头盔
						{itemid = 2890, prob = 5888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世项链
						{itemid = 2891, prob = 5888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世手镯
						{itemid = 2892, prob = 5888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世戒指
						{itemid = 2893, prob = 5888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世靴子
						{itemid = 2894, prob = 5888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世腰带

						{itemid = 1159, prob = 6568, count = 1, notice = true, hundred = 15568}, --6转首饰
						{itemid = 1217, prob = 6567, count = 1, notice = true, hundred = 15567}, --6转首饰
						{itemid = 1275, prob = 6566, count = 1, notice = true, hundred = 15566}, --6转首饰
						{itemid = 1333, prob = 6565, count = 1, notice = true, hundred = 15565}, --6转首饰
						{itemid = 1391, prob = 6564, count = 1, notice = true, hundred = 15564}, --6转首饰
						{itemid = 1449, prob = 6563, count = 1, notice = true, hundred = 15563}, --6转首饰
								        
						{itemid = 1178, prob = 6558, count = 1, notice = true, hundred = 15568}, --6转首饰
						{itemid = 1236, prob = 6557, count = 1, notice = true, hundred = 15567}, --6转首饰
						{itemid = 1294, prob = 6556, count = 1, notice = true, hundred = 15566}, --6转首饰
						{itemid = 1352, prob = 6555, count = 1, notice = true, hundred = 15565}, --6转首饰
						{itemid = 1410, prob = 6553, count = 1, notice = true, hundred = 15564}, --6转首饰
						{itemid = 1468, prob = 6552, count = 1, notice = true, hundred = 15563}, --6转首饰
								        
						{itemid = 1197, prob = 6538, count = 1, notice = true, hundred = 15568}, --6转首饰
						{itemid = 1255, prob = 6537, count = 1, notice = true, hundred = 15567}, --6转首饰
						{itemid = 1313, prob = 6536, count = 1, notice = true, hundred = 15566}, --6转首饰
						{itemid = 1371, prob = 6535, count = 1, notice = true, hundred = 15565}, --6转首饰
						{itemid = 1429, prob = 6533, count = 1, notice = true, hundred = 15564}, --6转首饰
						{itemid = 1487, prob = 6532, count = 1, notice = true, hundred = 15563}, --6转首饰

						{itemid = 982 , prob = 13588, count = 1, notice = true, hundred = 13588}, --天武神剑    
						{itemid = 1051, prob = 12888, count = 1, notice = true, hundred = 12888}, --天武神甲(男)
						{itemid = 1052, prob = 12878, count = 1, notice = true, hundred = 12878}, --天武神甲(女)
						{itemid = 1001, prob = 12588, count = 1, notice = true, hundred = 12588}, --天武神剑    
						{itemid = 1089, prob = 12888, count = 1, notice = true, hundred = 12888}, --天武神甲(男)
						{itemid = 1090, prob = 12878, count = 1, notice = true, hundred = 12878}, --天武神甲(女)
						{itemid = 1020, prob = 12588, count = 1, notice = true, hundred = 12588}, --天武神剑    
						{itemid = 1127, prob = 12888, count = 1, notice = true, hundred = 12888}, --天武神甲(男)
						{itemid = 1128, prob = 12878, count = 1, notice = true, hundred = 12878}, --天武神甲(女)

						{itemid = 2209, prob = 16888, count = 1, notice = true, hundred = 16888}, --盾牌碎片(特)
						{itemid = 2213, prob = 16887, count = 1, notice = true, hundred = 16887}, --宝石碎片(特)
						{itemid = 2217, prob = 16886, count = 1, notice = true, hundred = 16886}, --魂珠碎片(特)
						{itemid = 566 , prob = 16885, count = 1, notice = true, hundred = 16885}, --超级转生丹  
						{itemid = 163 , prob = 16884, count = 1, notice = true, hundred = 16884}, --超级成就令牌
						{itemid = 162 , prob = 16883, count = 1, notice = true, hundred = 16883}, --超级灵力丹  
						{itemid = 675 , prob = 16882, count = 1, notice = true, hundred = 16882}, --999朵玫瑰花 
						{itemid = 528 , prob = 16881, count = 1, notice = true, hundred = 16881}, --特戒碎片包  
						{itemid = 2225, prob = 16880, count = 1, notice = true, hundred = 16880}, --护符碎片(特)

						{itemid = 3007, prob = 3207, count = 1, notice = true, broadcast = true, hundred = 3839}, --龙行天下 
						{itemid = 3008, prob = 3208, count = 1, notice = true, broadcast = true, hundred = 3829}, --如影随形 
						{itemid = 3009, prob = 3209, count = 1, notice = true, broadcast = true, hundred = 3819}, --双龙出海 
						{itemid = 3010, prob = 3210, count = 1, notice = true, broadcast = true, hundred = 3809}, --丘比特   
						{itemid = 3011, prob = 3211, count = 1, notice = true, broadcast = true, hundred = 3805}, --神龙开道 
						{itemid = 3012, prob = 3212, count = 1, notice = true, broadcast = true, hundred = 3800}, --冰火之歌 
						{itemid = 3013, prob = 3213, count = 1, notice = true, broadcast = true, hundred = 3088}, --弥勒笑佛
						{itemid = 3014, prob = 3214, count = 1, notice = true, broadcast = true, hundred = 3087}, --熊二快跑

						{itemid = 1158, prob = 3288, count = 1, notice = true, hundred = 8888},  --4转首饰
						{itemid = 1216, prob = 3278, count = 1, notice = true, hundred = 8878},  --4转首饰
						{itemid = 1274, prob = 3268, count = 1, notice = true, hundred = 8868},  --4转首饰
						{itemid = 1332, prob = 3258, count = 1, notice = true, hundred = 8858},  --4转首饰
						{itemid = 1390, prob = 3248, count = 1, notice = true, hundred = 8848},  --4转首饰
						{itemid = 1448, prob = 3238, count = 1, notice = true, hundred = 8838},  --4转首饰
								        
						{itemid = 1177, prob = 3288, count = 1, notice = true, hundred = 8888}, --4转首饰
						{itemid = 1235, prob = 3278, count = 1, notice = true, hundred = 8878}, --4转首饰
						{itemid = 1293, prob = 3268, count = 1, notice = true, hundred = 8868}, --4转首饰
						{itemid = 1351, prob = 3258, count = 1, notice = true, hundred = 8858}, --4转首饰
						{itemid = 1409, prob = 3248, count = 1, notice = true, hundred = 8848}, --4转首饰
						{itemid = 1467, prob = 3238, count = 1, notice = true, hundred = 8838}, --4转首饰
								        
						{itemid = 1196, prob = 3288, count = 1, notice = true, hundred = 8888}, --4转首饰
						{itemid = 1254, prob = 3278, count = 1, notice = true, hundred = 8878}, --4转首饰
						{itemid = 1312, prob = 3268, count = 1, notice = true, hundred = 8868}, --4转首饰
						{itemid = 1370, prob = 3258, count = 1, notice = true, hundred = 8858}, --4转首饰
						{itemid = 1428, prob = 3248, count = 1, notice = true, hundred = 8848}, --4转首饰
						{itemid = 1486, prob = 3238, count = 1, notice = true, hundred = 8838}, --4转首饰
								        
						{itemid = 1158, prob = 3288, count = 1, notice = true, hundred = 8888},  --4转首饰
						{itemid = 1216, prob = 3278, count = 1, notice = true, hundred = 8878},  --4转首饰
						{itemid = 1274, prob = 3268, count = 1, notice = true, hundred = 8868},  --4转首饰
						{itemid = 1332, prob = 3258, count = 1, notice = true, hundred = 8858},  --4转首饰
						{itemid = 1390, prob = 3248, count = 1, notice = true, hundred = 8848},  --4转首饰
						{itemid = 1448, prob = 3238, count = 1, notice = true, hundred = 8838},  --4转首饰
								        
						{itemid = 1177, prob = 3288, count = 1, notice = true, hundred = 8888}, --4转首饰
						{itemid = 1235, prob = 3278, count = 1, notice = true, hundred = 8878}, --4转首饰
						{itemid = 1293, prob = 3268, count = 1, notice = true, hundred = 8868}, --4转首饰
						{itemid = 1351, prob = 3258, count = 1, notice = true, hundred = 8858}, --4转首饰
						{itemid = 1409, prob = 3248, count = 1, notice = true, hundred = 8848}, --4转首饰
						{itemid = 1467, prob = 3238, count = 1, notice = true, hundred = 8838}, --4转首饰
								        
						{itemid = 1196, prob = 3288, count = 1, notice = true, hundred = 8888}, --4转首饰
						{itemid = 1254, prob = 3278, count = 1, notice = true, hundred = 8878}, --4转首饰
						{itemid = 1312, prob = 3268, count = 1, notice = true, hundred = 8868}, --4转首饰
						{itemid = 1370, prob = 3258, count = 1, notice = true, hundred = 8858}, --4转首饰
						{itemid = 1428, prob = 3248, count = 1, notice = true, hundred = 8848}, --4转首饰
						{itemid = 1486, prob = 3238, count = 1, notice = true, hundred = 8838}, --4转首饰

						{itemid = 981 , prob = 3288, count = 1, notice = true, hundred = 3288}, --轩辕神剑    
						{itemid = 1049, prob = 3290, count = 1, notice = true, hundred = 3290}, --轩辕神甲(男)
						{itemid = 1050, prob = 3280, count = 1, notice = true, hundred = 3280}, --轩辕神甲(女)
						{itemid = 1000, prob = 3288, count = 1, notice = true, hundred = 3288}, --轩辕神剑    
						{itemid = 1087, prob = 3290, count = 1, notice = true, hundred = 3290}, --轩辕神甲(男)
						{itemid = 1088, prob = 3280, count = 1, notice = true, hundred = 3280}, --轩辕神甲(女)
						{itemid = 1019, prob = 3288, count = 1, notice = true, hundred = 3288}, --轩辕神剑    
						{itemid = 1125, prob = 3290, count = 1, notice = true, hundred = 3290}, --轩辕神甲(男)
						{itemid = 1126, prob = 3280, count = 1, notice = true, hundred = 3280}, --轩辕神甲(女)

						{itemid = 2635, prob = 9099, count = 1, notice = true, broadcast = true, hundred = 3289}, --青龙阵石 
						{itemid = 2636, prob = 9089, count = 1, notice = true, broadcast = true, hundred = 3289}, --白虎阵石 
						{itemid = 2637, prob = 9079, count = 1, notice = true, broadcast = true, hundred = 3279}, --朱雀阵石 
						{itemid = 2638, prob = 9069, count = 1, notice = true, broadcast = true, hundred = 3269}, --玄武阵石
	
						{itemid = 1940, prob = 988, count = 1, notice = true, hundred = 8888},	--五级羽毛
						{itemid = 1941, prob = 988, count = 1, notice = true, broadcast = true, hundred = 3289}, --六级羽毛 

						{itemid = 636 , prob = 2989, count = 1, notice = true, broadcast = true, hundred = 3289}, --马鞍 
						{itemid = 624 , prob = 2988, count = 1, notice = true, broadcast = true, hundred = 3289}, --蹄铁 
						{itemid = 628 , prob = 2987, count = 1, notice = true, broadcast = true, hundred = 3279}, --缰绳 
						{itemid = 632 , prob = 2986, count = 1, notice = true, broadcast = true, hundred = 3269}, --马镫

						{itemid = 640 , prob = 2889, count = 1, notice = true, broadcast = true, hundred = 3289}, --银光闪豹 
						{itemid = 641 , prob = 2879, count = 1, notice = true, broadcast = true, hundred = 3279}, --万圣战轮 
						{itemid = 642 , prob = 2869, count = 1, notice = true, broadcast = true, hundred = 3269}, --蒸朋怒鲨
						{itemid = 643 , prob = 2889, count = 1, notice = true, broadcast = true, hundred = 3289}, --百鸟朝凤 

						{itemid = 588 , prob = 3089, count = 1, notice = true, broadcast = true, hundred = 3289}, --关羽时装 
						{itemid = 592 , prob = 3079, count = 1, notice = true, broadcast = true, hundred = 3279}, --赵云时装 
						{itemid = 596 , prob = 3069, count = 1, notice = true, broadcast = true, hundred = 3269}, --吕布时装
						{itemid = 612 , prob = 3089, count = 1, notice = true, broadcast = true, hundred = 3289}, --大乔时装 
						{itemid = 616 , prob = 3079, count = 1, notice = true, broadcast = true, hundred = 3279}, --小乔时装 
						{itemid = 620 , prob = 3069, count = 1, notice = true, broadcast = true, hundred = 3269}, --貂蝉时装

						{itemid = 600 , prob = 2889, count = 1, notice = true, broadcast = true, hundred = 3289}, --青龙偃月刀 
						{itemid = 604 , prob = 2879, count = 1, notice = true, broadcast = true, hundred = 3279}, --百鸟朝凤枪 
						{itemid = 608 , prob = 2869, count = 1, notice = true, broadcast = true, hundred = 3269}, --方天画戟

						{itemid = 492 , prob = 3239, count = 1, notice = true, broadcast = true, hundred = 3839}, --返璞归真 
						{itemid = 493 , prob = 3229, count = 1, notice = true, broadcast = true, hundred = 3829}, --鸾凤和鸣 
						{itemid = 494 , prob = 3219, count = 1, notice = true, broadcast = true, hundred = 3819}, --双龙出海 
						{itemid = 495 , prob = 3209, count = 1, notice = true, broadcast = true, hundred = 3809}, --紫翼东升 

						{itemid = 341 , prob = 2839, count = 1, notice = true, broadcast = true, hundred = 3839}, --法老服饰(男) 
						{itemid = 342 , prob = 2829, count = 1, notice = true, broadcast = true, hundred = 3829}, --法老服饰(女) 
						{itemid = 350 , prob = 2819, count = 1, notice = true, broadcast = true, hundred = 3819}, --拳击战服(男) 
						{itemid = 351 , prob = 2809, count = 1, notice = true, broadcast = true, hundred = 3809}, --拳击战服(女) 
						{itemid = 2319, prob = 2805, count = 1, notice = true, broadcast = true, hundred = 3805}, --菊花一锦(男) 
						{itemid = 2320, prob = 2800, count = 1, notice = true, broadcast = true, hundred = 3800}, --菊花一锦(女) 
						{itemid = 2316, prob = 2788, count = 1, notice = true, broadcast = true, hundred = 3088}, --菊花
						{itemid = 338 , prob = 2787, count = 1, notice = true, broadcast = true, hundred = 3087}, --法老权杖 
						{itemid = 347 , prob = 2786, count = 1, notice = true, broadcast = true, hundred = 3086}, --拳击暴雷

						{itemid = 327, prob = 2588, count = 1, notice = true, broadcast = true, hundred = 2588}, --足迹
						{itemid = 328, prob = 2587, count = 1, notice = true, broadcast = true, hundred = 2587}, --足迹
						{itemid = 329, prob = 2586, count = 1, notice = true, broadcast = true, hundred = 2586}, --足迹
						{itemid = 330, prob = 2585, count = 1, notice = true, broadcast = true, hundred = 2585}, --足迹
						{itemid = 331, prob = 2584, count = 1, notice = true, broadcast = true, hundred = 2584}, --足迹
						{itemid = 332, prob = 2583, count = 1, notice = true, broadcast = true, hundred = 2583}, --足迹
						{itemid = 333, prob = 2582, count = 1, notice = true, broadcast = true, hundred = 2582}, --足迹
						{itemid = 334, prob = 2581, count = 1, notice = true, broadcast = true, hundred = 2581}, --足迹 
						{itemid = 335, prob = 2580, count = 1, notice = true, broadcast = true, hundred = 2580}, --足迹

						{itemid = 2156, prob = 2059, count = 1, notice = true, broadcast = true, hundred = 2359}, --新年达人(男) 
						{itemid = 2157, prob = 2049, count = 1, notice = true, broadcast = true, hundred = 2349}, --新年达人(女) 
						{itemid = 2308, prob = 2039, count = 1, notice = true, broadcast = true, hundred = 2339}, --情侣时装(男) 
						{itemid = 2309, prob = 2029, count = 1, notice = true, broadcast = true, hundred = 2329}, --情侣时装(女) 
						{itemid = 2296, prob = 2019, count = 1, notice = true, broadcast = true, hundred = 2319}, --返璞归真(男) 
						{itemid = 2299, prob = 2009, count = 1, notice = true, broadcast = true, hundred = 2309}, --返璞归真(女) 
						{itemid = 2325, prob = 2005, count = 1, notice = true, broadcast = true, hundred = 2305}, --新春时装(男) 
						{itemid = 2326, prob = 2000, count = 1, notice = true, broadcast = true, hundred = 2300}, --新春时装(女) 
						{itemid = 2155, prob = 1688, count = 1, notice = true, broadcast = true, hundred = 1888}, --棒棒糖
						{itemid = 2305, prob = 1687, count = 1, notice = true, broadcast = true, hundred = 1887}, --玫瑰花 
						{itemid = 2302, prob = 1686, count = 1, notice = true, broadcast = true, hundred = 1886}, --反璞归真
						{itemid = 2203, prob = 1388, count = 1, notice = true, broadcast = true, hundred = 1688},--神器碎片
						{itemid = 2204, prob = 1388, count = 1, notice = true, broadcast = true, hundred = 1688},--神甲碎片

						{itemid = 1157, prob = 1588, count = 1, notice = true, hundred = 1588}, --2转首饰 
						{itemid = 1215, prob = 1578, count = 1, notice = true, hundred = 1578}, --2转首饰 
						{itemid = 1273, prob = 1568, count = 1, notice = true, hundred = 1568}, --2转首饰 
						{itemid = 1331, prob = 1558, count = 1, notice = true, hundred = 1558}, --2转首饰 
						{itemid = 1389, prob = 1548, count = 1, notice = true, hundred = 1548}, --2转首饰 
						{itemid = 1447, prob = 1538, count = 1, notice = true, hundred = 1538}, --2转首饰 

						{itemid = 1234, prob = 1578, count = 1, notice = true, hundred = 1578}, --2转首饰 
						{itemid = 1292, prob = 1568, count = 1, notice = true, hundred = 1568}, --2转首饰 
						{itemid = 1350, prob = 1558, count = 1, notice = true, hundred = 1558}, --2转首饰 
						{itemid = 1408, prob = 1548, count = 1, notice = true, hundred = 1548}, --2转首饰 
						{itemid = 1466, prob = 1538, count = 1, notice = true, hundred = 1538}, --2转首饰 

						{itemid = 1195, prob = 1588, count = 1, notice = true, hundred = 1588}, --2转首饰 
						{itemid = 1253, prob = 1578, count = 1, notice = true, hundred = 1578}, --2转首饰 
						{itemid = 1311, prob = 1568, count = 1, notice = true, hundred = 1568}, --2转首饰 
						{itemid = 1369, prob = 1558, count = 1, notice = true, hundred = 1558}, --2转首饰 
						{itemid = 1427, prob = 1548, count = 1, notice = true, hundred = 1548}, --2转首饰 
						{itemid = 1485, prob = 1538, count = 1, notice = true, hundred = 1538}, --2转首饰 

						{itemid = 1157, prob = 1588, count = 1, notice = true, hundred = 1588}, --2转首饰 
						{itemid = 1215, prob = 1578, count = 1, notice = true, hundred = 1578}, --2转首饰 
						{itemid = 1273, prob = 1568, count = 1, notice = true, hundred = 1568}, --2转首饰 
						{itemid = 1331, prob = 1558, count = 1, notice = true, hundred = 1558}, --2转首饰 
						{itemid = 1389, prob = 1548, count = 1, notice = true, hundred = 1548}, --2转首饰 
						{itemid = 1447, prob = 1538, count = 1, notice = true, hundred = 1538}, --2转首饰 

						{itemid = 1234, prob = 1578, count = 1, notice = true, hundred = 1578}, --2转首饰 
						{itemid = 1292, prob = 1568, count = 1, notice = true, hundred = 1568}, --2转首饰 
						{itemid = 1350, prob = 1558, count = 1, notice = true, hundred = 1558}, --2转首饰 
						{itemid = 1408, prob = 1548, count = 1, notice = true, hundred = 1548}, --2转首饰 
						{itemid = 1466, prob = 1538, count = 1, notice = true, hundred = 1538}, --2转首饰 

						{itemid = 1195, prob = 1588, count = 1, notice = true, hundred = 1588}, --2转首饰 
						{itemid = 1253, prob = 1578, count = 1, notice = true, hundred = 1578}, --2转首饰 
						{itemid = 1311, prob = 1568, count = 1, notice = true, hundred = 1568}, --2转首饰 
						{itemid = 1369, prob = 1558, count = 1, notice = true, hundred = 1558}, --2转首饰 
						{itemid = 1427, prob = 1548, count = 1, notice = true, hundred = 1548}, --2转首饰 
						{itemid = 1485, prob = 1538, count = 1, notice = true, hundred = 1538}, --2转首饰 

						{itemid = 980 , prob = 988, count = 1, notice = true, hundred = 988}, --伏虎令剑    
						{itemid = 1047, prob = 990, count = 1, notice = true, hundred = 990}, --伏虎战甲(男)
						{itemid = 1048, prob = 980, count = 1, notice = true, hundred = 980}, --伏虎战甲(女)
						{itemid = 999 , prob = 988, count = 1, notice = true, hundred = 988}, --伏虎令剑    
						{itemid = 1085, prob = 990, count = 1, notice = true, hundred = 990}, --伏虎战甲(男)
						{itemid = 1086, prob = 980, count = 1, notice = true, hundred = 980}, --伏虎战甲(女)
						{itemid = 1018, prob = 988, count = 1, notice = true, hundred = 988}, --伏虎令剑    
						{itemid = 1123, prob = 990, count = 1, notice = true, hundred = 990}, --伏虎战甲(男)
						{itemid = 1124, prob = 980, count = 1, notice = true, hundred = 980}, --伏虎战甲(女)

						{itemid = 2210, prob = 898, count = 1, notice = true, hundred = 898}, --盾牌碎片(大)    
						{itemid = 2214, prob = 878, count = 1, notice = true, hundred = 878}, --宝石碎片(大)    
						{itemid = 2218, prob = 868, count = 1, notice = true, hundred = 868}, --魂珠碎片(大)    
						{itemid = 565 , prob = 888, count = 1, notice = true, hundred = 888}, --高级转生丹      
						{itemid = 145 , prob = 898, count = 1, notice = true, hundred = 898}, --高级成就令牌    
						{itemid = 161 , prob = 878, count = 1, notice = true, hundred = 878}, --高级灵力丹      
						{itemid = 674 , prob = 868, count = 1, notice = true, hundred = 868}, --99朵玫瑰花      
						{itemid = 849 , prob = 858, count = 1, notice = true, hundred = 858}, --五倍经验(2小时) 
						{itemid = 2111, prob = 818, count = 1, notice = true, hundred = 818}, --二级暴击宝石    
						{itemid = 160 , prob = 588, count = 1, notice = true, hundred = 588},  --灵力丹(大)      
						{itemid = 527 , prob = 886, count = 1, notice = true, hundred = 886},  --特戒碎片        
						{itemid = 2226, prob = 885, count = 1, notice = true, hundred = 885}, --护符碎片(大)  

						{itemid = 1156, prob = 588, count = 1, notice = true, hundred = 588}, --1转首饰 
						{itemid = 1214, prob = 578, count = 1, notice = true, hundred = 578}, --1转首饰 
						{itemid = 1272, prob = 568, count = 1, notice = true, hundred = 568}, --1转首饰 
						{itemid = 1330, prob = 558, count = 1, notice = true, hundred = 558}, --1转首饰 
						{itemid = 1388, prob = 548, count = 1, notice = true, hundred = 548}, --1转首饰 
						{itemid = 1446, prob = 538, count = 1, notice = true, hundred = 538}, --1转首饰 

						{itemid = 1175, prob = 586, count = 1, notice = true, hundred = 586}, --1转首饰 
						{itemid = 1233, prob = 576, count = 1, notice = true, hundred = 576}, --1转首饰 
						{itemid = 1291, prob = 566, count = 1, notice = true, hundred = 566}, --1转首饰 
						{itemid = 1349, prob = 556, count = 1, notice = true, hundred = 556}, --1转首饰 
						{itemid = 1407, prob = 546, count = 1, notice = true, hundred = 546}, --1转首饰 
						{itemid = 1465, prob = 536, count = 1, notice = true, hundred = 536}, --1转首饰

						{itemid = 1194, prob = 585, count = 1, notice = true, hundred = 585}, --1转首饰 
						{itemid = 1252, prob = 575, count = 1, notice = true, hundred = 575}, --1转首饰 
						{itemid = 1310, prob = 565, count = 1, notice = true, hundred = 565}, --1转首饰 
						{itemid = 1368, prob = 555, count = 1, notice = true, hundred = 555}, --1转首饰 
						{itemid = 1426, prob = 545, count = 1, notice = true, hundred = 545}, --1转首饰 
						{itemid = 1484, prob = 535, count = 1, notice = true, hundred = 535}, --1转首饰 

						{itemid = 1156, prob = 588, count = 1, notice = true, hundred = 588}, --1转首饰 
						{itemid = 1214, prob = 578, count = 1, notice = true, hundred = 578}, --1转首饰 
						{itemid = 1272, prob = 568, count = 1, notice = true, hundred = 568}, --1转首饰 
						{itemid = 1330, prob = 558, count = 1, notice = true, hundred = 558}, --1转首饰 
						{itemid = 1388, prob = 548, count = 1, notice = true, hundred = 548}, --1转首饰 
						{itemid = 1446, prob = 538, count = 1, notice = true, hundred = 538}, --1转首饰 

						{itemid = 1175, prob = 586, count = 1, notice = true, hundred = 586}, --1转首饰 
						{itemid = 1233, prob = 576, count = 1, notice = true, hundred = 576}, --1转首饰 
						{itemid = 1291, prob = 566, count = 1, notice = true, hundred = 566}, --1转首饰 
						{itemid = 1349, prob = 556, count = 1, notice = true, hundred = 556}, --1转首饰 
						{itemid = 1407, prob = 546, count = 1, notice = true, hundred = 546}, --1转首饰 
						{itemid = 1465, prob = 536, count = 1, notice = true, hundred = 536}, --1转首饰

						{itemid = 1194, prob = 585, count = 1, notice = true, hundred = 585}, --1转首饰 
						{itemid = 1252, prob = 575, count = 1, notice = true, hundred = 575}, --1转首饰 
						{itemid = 1310, prob = 565, count = 1, notice = true, hundred = 565}, --1转首饰 
						{itemid = 1368, prob = 555, count = 1, notice = true, hundred = 555}, --1转首饰 
						{itemid = 1426, prob = 545, count = 1, notice = true, hundred = 545}, --1转首饰 
						{itemid = 1484, prob = 535, count = 1, notice = true, hundred = 535}, --1转首饰 

						{itemid = 979 , prob = 168, count = 1, notice = false, hundred = 168}, --修罗之刃      
						{itemid = 1045, prob = 165, count = 1, notice = false, hundred = 165}, --修罗战甲(男)  
						{itemid = 1046, prob = 162, count = 1, notice = false, hundred = 162}, --修罗战甲(女)  
						{itemid = 998 , prob = 167, count = 1, notice = false, hundred = 167}, --修罗之刃      
						{itemid = 1083, prob = 164, count = 1, notice = false, hundred = 164}, --修罗战甲(男)  
						{itemid = 1084, prob = 161, count = 1, notice = false, hundred = 161}, --修罗战甲(女)  
						{itemid = 1017, prob = 166, count = 1, notice = false, hundred = 166}, --修罗之刃      
						{itemid = 1121, prob = 163, count = 1, notice = false, hundred = 163}, --修罗战甲(男)  
						{itemid = 1122, prob = 160, count = 1, notice = false, hundred = 160}, --修罗战甲(女)  

						{itemid = 2123, prob = 2638, count = 1, notice = false, hundred = 238}, --子鼠玉佩  
						{itemid = 2124, prob = 2638, count = 1, notice = false, hundred = 237}, --丑牛玉佩  
						{itemid = 2125, prob = 2638, count = 1, notice = false, hundred = 236}, --寅虎玉佩  
						{itemid = 2126, prob = 2638, count = 1, notice = false, hundred = 235}, --卯兔玉佩  
						{itemid = 2127, prob = 2638, count = 1, notice = false, hundred = 234}, --辰龙玉佩  
						{itemid = 2128, prob = 2638, count = 1, notice = false, hundred = 233}, --巳蛇玉佩 
						{itemid = 2129, prob = 2638, count = 1, notice = false, hundred = 238}, --午马玉佩  
						{itemid = 2130, prob = 2638, count = 1, notice = false, hundred = 237}, --未羊玉佩  
						{itemid = 2131, prob = 2638, count = 1, notice = false, hundred = 236}, --申猴玉佩  
						{itemid = 2132, prob = 2638, count = 1, notice = false, hundred = 235}, --酉鸡玉佩  
						{itemid = 2133, prob = 2638, count = 1, notice = false, hundred = 234}, --戌狗玉佩  
						{itemid = 2134, prob = 2638, count = 1, notice = false, hundred = 233}, --亥猪玉佩 

						{itemid = 1155, prob = 128, count = 1, notice = false, hundred = 128}, --90级首饰  
						{itemid = 1213, prob = 127, count = 1, notice = false, hundred = 127}, --90级首饰  
						{itemid = 1271, prob = 126, count = 1, notice = false, hundred = 126}, --90级首饰  
						{itemid = 1329, prob = 125, count = 1, notice = false, hundred = 125}, --90级首饰  
						{itemid = 1387, prob = 124, count = 1, notice = false, hundred = 124}, --90级首饰  
						{itemid = 1445, prob = 123, count = 1, notice = false, hundred = 123}, --90级首饰  

						{itemid = 1174, prob = 128, count = 1, notice = false, hundred = 128}, --90级首饰  
						{itemid = 1232, prob = 127, count = 1, notice = false, hundred = 127}, --90级首饰  
						{itemid = 1290, prob = 126, count = 1, notice = false, hundred = 126}, --90级首饰  
						{itemid = 1348, prob = 125, count = 1, notice = false, hundred = 125}, --90级首饰  
						{itemid = 1406, prob = 124, count = 1, notice = false, hundred = 124}, --90级首饰  
						{itemid = 1464, prob = 123, count = 1, notice = false, hundred = 123}, --90级首饰 

						{itemid = 1193, prob = 128, count = 1, notice = false, hundred = 128}, --90级首饰  
						{itemid = 1251, prob = 127, count = 1, notice = false, hundred = 127}, --90级首饰  
						{itemid = 1309, prob = 126, count = 1, notice = false, hundred = 126}, --90级首饰  
						{itemid = 1367, prob = 125, count = 1, notice = false, hundred = 125}, --90级首饰  
						{itemid = 1425, prob = 124, count = 1, notice = false, hundred = 124}, --90级首饰  
						{itemid = 1483, prob = 123, count = 1, notice = false, hundred = 123}, --90级首饰 

						{itemid = 2197, prob = 18, count = 1, notice = false, hundred = 18},    --典
						{itemid = 2196, prob = 17, count = 1, notice = false, hundred = 17},    --庆
						{itemid = 2195, prob = 16, count = 1, notice = false, hundred = 16},    --服
						{itemid = 2193, prob = 15, count = 1, notice = false, hundred = 15},    --千
						{itemid = 2886, prob = 16, count = 1, notice = false, hundred = 14}, --传世宝钻 
						{itemid = 841, prob = 30, count = 1, notice = false, hundred = 10}, --圣兽灵石 
						{itemid = 818 , prob = 4 , count = 1, notice = false, hundred = 1 }, --英雄经验丹  
						{itemid = 513 , prob = 1 , count = 1, notice = false, hundred = 1 }, --经验丹(大)     
					},
				},
			},
			--道士
			{
				{
					money = 3000,		--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 5,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1159, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1217, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1275, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1333, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1391, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1449, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1178, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1236, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1294, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1352, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1410, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1468, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1197, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1255, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1313, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1371, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1429, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1487, prob = 18, count = 1, notice = true, hundred = 18},
					},
				},

				{
					money = 10000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 8,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1159, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1217, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1275, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1333, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1391, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1449, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1178, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1236, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1294, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1352, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1410, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1468, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1197, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1255, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1313, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1371, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1429, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1487, prob = 18, count = 1, notice = true, hundred = 18},
					},
				},
				{
					money = 30000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 12,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1198, prob = 11, count = 1, notice = true, broadcast = true, hundred = 11}, --8转首饰
						{itemid = 1256, prob = 9 , count = 1, notice = true, broadcast = true, hundred = 9 }, --8转首饰
						{itemid = 1314, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1372, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1430, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1488, prob = 7 , count = 1, notice = true, broadcast = true, hundred = 7 }, --8转首饰
					},
				},
				{
					money = 60000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1159, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1217, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1275, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1333, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1391, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1449, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1178, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1236, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1294, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1352, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1410, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1468, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1197, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1255, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1313, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1371, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1429, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1487, prob = 18, count = 1, notice = true, hundred = 18},
					},
				},
				{
					money = 90000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 15,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1198, prob = 11, count = 1, notice = true, broadcast = true, hundred = 11}, --8转首饰
						{itemid = 1256, prob = 9 , count = 1, notice = true, broadcast = true, hundred = 9 }, --8转首饰
						{itemid = 1314, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1372, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1430, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1488, prob = 7 , count = 1, notice = true, broadcast = true, hundred = 7 }, --8转首饰
					},
				},
				{
					money = 120000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1159, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1217, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1275, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1333, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1391, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1449, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1178, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1236, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1294, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1352, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1410, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1468, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1197, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1255, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1313, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1371, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1429, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1487, prob = 18, count = 1, notice = true, hundred = 18},
					},
				},
				{
					money = 150000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 15,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1198, prob = 11, count = 1, notice = true, broadcast = true, hundred = 11}, --8转首饰
						{itemid = 1256, prob = 9 , count = 1, notice = true, broadcast = true, hundred = 9 }, --8转首饰
						{itemid = 1314, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1372, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1430, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1488, prob = 7 , count = 1, notice = true, broadcast = true, hundred = 7 }, --8转首饰
					},
				},
				{
					money = 180000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 12,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1199, prob = 11, count = 1, notice = true, broadcast = true, hundred = 11}, --8转首饰
						{itemid = 1257, prob = 9 , count = 1, notice = true, broadcast = true, hundred = 9 }, --8转首饰
						{itemid = 1315, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1373, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1431, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1489, prob = 7 , count = 1, notice = true, broadcast = true, hundred = 7 }, --8转首饰
					},
				},
				{
					count = 200,	--寻宝次数大于此值才会进入
					maxcount = 250,	--寻宝次数等于此值必定进入
					limit = 1,		--限制进入次数,-1为不限制
					prob = 5,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 2201, prob = 26, count = 1, notice = true, hundred = 26},  --欢
						{itemid = 2200, prob = 10, count = 1, notice = true, hundred = 10},  --狂
						{itemid = 2199, prob = 3 , count = 1, notice = true, hundred = 3},   --民
						{itemid = 2198, prob = 1 , count = 1, notice = true, hundred = 1},   --全
					},
				},
				{
					money = 0,	--寻宝花费数大于此值才会进入此表
					limit = -1,		--限制进入次数,-1为不限制
					prob = 1,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 2276, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 25888}, --铁血武器        
						{itemid = 2277, prob = 25668, count = 1, notice = true, broadcast = true, hundred = 25668}, --铁血衣服(男)
						{itemid = 2284, prob = 25588, count = 1, notice = true, broadcast = true, hundred = 25588}, --铁血衣服(女)

						{itemid = 2344, prob = 15288, count = 1, notice = true, hundred = 6888}, --傲视狂舞斩(英雄)    
						{itemid = 2354, prob = 15188, count = 1, notice = true, hundred = 6888}, --乾坤降魔杖(英雄)    
						{itemid = 2364, prob = 15088, count = 1, notice = true, hundred = 6888}, --紫金龙皇剑(英雄)    
						{itemid = 2380, prob = 15088, count = 1, notice = true, hundred = 6888}, --傲视狂舞甲(男)(英雄)
						{itemid = 2381, prob = 15088, count = 1, notice = true, hundred = 6888}, --傲视狂舞甲(女)(英雄)
						{itemid = 2400, prob = 15088, count = 1, notice = true, hundred = 6888}, --乾坤降魔衣(男)(英雄)
						{itemid = 2401, prob = 15088, count = 1, notice = true, hundred = 6888}, --乾坤降魔衣(女)(英雄)
						{itemid = 2420, prob = 15088, count = 1, notice = true, hundred = 6888}, --紫金龙皇甲(男)(英雄)
						{itemid = 2421, prob = 15088, count = 1, notice = true, hundred = 6888}, --紫金龙皇甲(女)(英雄)

						{itemid = 2345, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙战剑(英雄)      
						{itemid = 2355, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙魔杖(英雄)    
						{itemid = 2365, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙宝剑(英雄)    
						{itemid = 2382, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙战甲(男)(英雄)
						{itemid = 2383, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙战甲(女)(英雄)
						{itemid = 2402, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙魔衣(男)(英雄)
						{itemid = 2403, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙魔衣(女)(英雄)
						{itemid = 2422, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙道袍(男)(英雄)
						{itemid = 2423, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙道袍(女)(英雄)

						{itemid = 2346, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王战剑(英雄)     
						{itemid = 2356, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王魔杖(英雄)    
						{itemid = 2366, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王道剑(英雄)    
						{itemid = 2384, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王战甲(男)(英雄)
						{itemid = 2385, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王战甲(女)(英雄)
						{itemid = 2404, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王魔衣(男)(英雄)
						{itemid = 2405, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王魔衣(女)(英雄)
						{itemid = 2424, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王道袍(男)(英雄)
						{itemid = 2425, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王道袍(女)(英雄)

						{itemid = 1317, prob = 41588, count = 1, notice = true, broadcast = true, hundred = 32888}, --至尊诛仙道镯    
						{itemid = 1375, prob = 41888, count = 1, notice = true, broadcast = true, hundred = 32888}, --至尊诛仙道戒
						{itemid = 1201, prob = 42585, count = 1, notice = true, broadcast = true, hundred = 32585}, --至尊诛仙道盔
						{itemid = 1259, prob = 42688, count = 1, notice = true, broadcast = true, hundred = 32888}, --至尊诛仙道链    
						{itemid = 1433, prob = 42988, count = 1, notice = true, broadcast = true, hundred = 32888}, --至尊诛仙道带
						{itemid = 1491, prob = 42885, count = 1, notice = true, broadcast = true, hundred = 32585}, --至尊诛仙道靴

						{itemid = 765, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 59888}, --神之斩    
						{itemid = 766, prob = 35888, count = 1, notice = true, broadcast = true, hundred = 58888}, --神之甲
						{itemid = 767, prob = 28585, count = 1, notice = true, broadcast = true, hundred = 58585}, --神之盔
						{itemid = 768, prob = 28881, count = 1, notice = true, broadcast = true, hundred = 59888}, --神之链    
						{itemid = 769, prob = 28882, count = 1, notice = true, broadcast = true, hundred = 58888}, --神之镯
						{itemid = 770, prob = 28585, count = 1, notice = true, broadcast = true, hundred = 58585}, --神之戒
						{itemid = 771, prob = 28883, count = 1, notice = true, broadcast = true, hundred = 59888}, --神之带    
						{itemid = 772, prob = 28988, count = 1, notice = true, broadcast = true, hundred = 59888}, --神之靴

						{itemid = 1025, prob = 39888, count = 1, notice = true, broadcast = true, hundred = 59888}, --至尊诛仙扇        
						{itemid = 1137, prob = 35888, count = 1, notice = true, broadcast = true, hundred = 58888}, --至尊诛仙道袍(男)
						{itemid = 1138, prob = 35585, count = 1, notice = true, broadcast = true, hundred = 58585}, --至尊诛仙道袍(女)

						{itemid = 1024, prob = 32888, count = 1, notice = true, broadcast = true, hundred = 59888}, --诛仙之扇        
						{itemid = 1135, prob = 31888, count = 1, notice = true, broadcast = true, hundred = 58888}, --诛仙道袍(男)
						{itemid = 1136, prob = 31585, count = 1, notice = true, broadcast = true, hundred = 58585}, --诛仙道袍(女)

						{itemid = 1022, prob = 159888, count = 1, notice = true, broadcast = true, hundred = 59888}, --8转武器    
						{itemid = 1131, prob = 158888, count = 1, notice = true, broadcast = true, hundred = 58888}, --8转衣服(男)
						{itemid = 1132, prob = 158585, count = 1, notice = true, broadcast = true, hundred = 58585}, --8转衣服(女)

						{itemid = 1021, prob = 32886, count = 1, notice = true, broadcast = true, hundred = 32886}, --傲视狂舞斩    
						{itemid = 1129, prob = 32883, count = 1, notice = true, broadcast = true, hundred = 32883}, --傲视狂舞甲(男)
						{itemid = 1130, prob = 32586, count = 1, notice = true, broadcast = true, hundred = 32586}, --傲视狂舞甲(女)

						{itemid = 1316, prob = 21588, count = 1, notice = true, broadcast = true, hundred = 32888}, --诛仙道镯    
						{itemid = 1374, prob = 21888, count = 1, notice = true, broadcast = true, hundred = 32888}, --诛仙道戒
						{itemid = 1200, prob = 22585, count = 1, notice = true, broadcast = true, hundred = 32585}, --诛仙道盔
						{itemid = 1258, prob = 22688, count = 1, notice = true, broadcast = true, hundred = 32888}, --诛仙道链    
						{itemid = 1432, prob = 22988, count = 1, notice = true, broadcast = true, hundred = 32888}, --诛仙道带
						{itemid = 1490, prob = 22885, count = 1, notice = true, broadcast = true, hundred = 32585}, --诛仙道靴

						{itemid = 1199, prob = 42888, count = 1, notice = true, broadcast = true, hundred = 32888}, --10转首饰    
						{itemid = 1257, prob = 42888, count = 1, notice = true, broadcast = true, hundred = 32888}, --10转首饰
						{itemid = 1315, prob = 42585, count = 1, notice = true, broadcast = true, hundred = 32585}, --10转首饰
						{itemid = 1373, prob = 42888, count = 1, notice = true, broadcast = true, hundred = 32888}, --10转首饰    
						{itemid = 1431, prob = 42888, count = 1, notice = true, broadcast = true, hundred = 32888}, --10转首饰
						{itemid = 1489, prob = 42585, count = 1, notice = true, broadcast = true, hundred = 32585}, --10转首饰

						{itemid = 1198, prob = 22888, count = 1, notice = true, broadcast = true, hundred = 22888}, --8转首饰
						{itemid = 1256, prob = 22888, count = 1, notice = true, broadcast = true, hundred = 22888}, --8转首饰
						{itemid = 1314, prob = 22585, count = 1, notice = true, broadcast = true, hundred = 22585}, --8转首饰
						{itemid = 1372, prob = 22888, count = 1, notice = true, broadcast = true, hundred = 22888}, --8转首饰
						{itemid = 1430, prob = 22888, count = 1, notice = true, broadcast = true, hundred = 22888}, --8转首饰
						{itemid = 1488, prob = 22585, count = 1, notice = true, broadcast = true, hundred = 22585}, --8转首饰

						{itemid = 2291, prob = 26968, count = 1, notice = true, broadcast = true, hundred = 2359}, --圣·新年达人(男) 
						{itemid = 2292, prob = 26868, count = 1, notice = true, broadcast = true, hundred = 2349}, --圣·新年达人(女) 
						{itemid = 2310, prob = 26768, count = 1, notice = true, broadcast = true, hundred = 2339}, --圣·情侣时装(男) 
						{itemid = 2311, prob = 26668, count = 1, notice = true, broadcast = true, hundred = 2329}, --圣·情侣时装(女) 
						{itemid = 2297, prob = 26568, count = 1, notice = true, broadcast = true, hundred = 2319}, --圣·返璞归真(男) 
						{itemid = 2300, prob = 26468, count = 1, notice = true, broadcast = true, hundred = 2309}, --圣·返璞归真(女) 
						{itemid = 2327, prob = 26368, count = 1, notice = true, broadcast = true, hundred = 2305}, --圣·新春时装(男)
						{itemid = 2328, prob = 26268, count = 1, notice = true, broadcast = true, hundred = 2300}, --圣·新春时装(女) 
						{itemid = 2290, prob = 26168, count = 1, notice = true, broadcast = true, hundred = 1888}, --圣·棒棒糖
						{itemid = 2306, prob = 26068, count = 1, notice = true, broadcast = true, hundred = 1887}, --圣·玫瑰花 
						{itemid = 2303, prob = 26066, count = 1, notice = true, broadcast = true, hundred = 1886}, --圣·反璞归真

						{itemid = 3007, prob = 3207, count = 1, notice = true, broadcast = true, hundred = 3839}, --龙行天下 
						{itemid = 3008, prob = 3208, count = 1, notice = true, broadcast = true, hundred = 3829}, --如影随形 
						{itemid = 3009, prob = 3209, count = 1, notice = true, broadcast = true, hundred = 3819}, --双龙出海 
						{itemid = 3010, prob = 3210, count = 1, notice = true, broadcast = true, hundred = 3809}, --丘比特   
						{itemid = 3011, prob = 3211, count = 1, notice = true, broadcast = true, hundred = 3805}, --神龙开道 
						{itemid = 3012, prob = 3212, count = 1, notice = true, broadcast = true, hundred = 3800}, --冰火之歌 
						{itemid = 3013, prob = 3213, count = 1, notice = true, broadcast = true, hundred = 3088}, --弥勒笑佛
						{itemid = 3014, prob = 3214, count = 1, notice = true, broadcast = true, hundred = 3087}, --熊二快跑

						{itemid = 2887, prob = 12888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世之刃  
						{itemid = 2888, prob = 11888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世之甲
						{itemid = 2889, prob = 5888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世头盔
						{itemid = 2890, prob = 5888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世项链
						{itemid = 2891, prob = 5888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世手镯
						{itemid = 2892, prob = 5888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世戒指
						{itemid = 2893, prob = 5888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世靴子
						{itemid = 2894, prob = 5888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世腰带

						{itemid = 1159, prob = 6568, count = 1, notice = true, hundred = 15568}, --6转首饰
						{itemid = 1217, prob = 6567, count = 1, notice = true, hundred = 15567}, --6转首饰
						{itemid = 1275, prob = 6566, count = 1, notice = true, hundred = 15566}, --6转首饰
						{itemid = 1333, prob = 6565, count = 1, notice = true, hundred = 15565}, --6转首饰
						{itemid = 1391, prob = 6564, count = 1, notice = true, hundred = 15564}, --6转首饰
						{itemid = 1449, prob = 6563, count = 1, notice = true, hundred = 15563}, --6转首饰
								        
						{itemid = 1178, prob = 6558, count = 1, notice = true, hundred = 15558}, --6转首饰
						{itemid = 1236, prob = 6557, count = 1, notice = true, hundred = 15557}, --6转首饰
						{itemid = 1294, prob = 6556, count = 1, notice = true, hundred = 15556}, --6转首饰
						{itemid = 1352, prob = 6555, count = 1, notice = true, hundred = 15555}, --6转首饰
						{itemid = 1410, prob = 6553, count = 1, notice = true, hundred = 15553}, --6转首饰
						{itemid = 1468, prob = 6552, count = 1, notice = true, hundred = 15552}, --6转首饰
								        
						{itemid = 1197, prob = 6538, count = 1, notice = true, hundred = 15538}, --6转首饰
						{itemid = 1255, prob = 6537, count = 1, notice = true, hundred = 15537}, --6转首饰
						{itemid = 1313, prob = 6536, count = 1, notice = true, hundred = 15536}, --6转首饰
						{itemid = 1371, prob = 6535, count = 1, notice = true, hundred = 15535}, --6转首饰
						{itemid = 1429, prob = 6533, count = 1, notice = true, hundred = 15533}, --6转首饰
						{itemid = 1487, prob = 6532, count = 1, notice = true, hundred = 15532}, --6转首饰

						{itemid = 982 , prob = 13588, count = 1, notice = true, hundred = 13588}, --天武神剑    
						{itemid = 1051, prob = 12888, count = 1, notice = true, hundred = 12888}, --天武神甲(男)
						{itemid = 1052, prob = 12878, count = 1, notice = true, hundred = 12878}, --天武神甲(女)

						{itemid = 1001, prob = 12588, count = 1, notice = true, hundred = 12588}, --天武神剑    
						{itemid = 1089, prob = 12888, count = 1, notice = true, hundred = 12888}, --天武神甲(男)
						{itemid = 1090, prob = 12878, count = 1, notice = true, hundred = 12878}, --天武神甲(女)

						{itemid = 1020, prob = 12588, count = 1, notice = true, hundred = 12588}, --天武神剑    
						{itemid = 1127, prob = 12888, count = 1, notice = true, hundred = 12888}, --天武神甲(男)
						{itemid = 1128, prob = 12878, count = 1, notice = true, hundred = 12878}, --天武神甲(女)

						{itemid = 2209, prob = 16888, count = 1, notice = true, hundred = 16888}, --盾牌碎片(特)
						{itemid = 2213, prob = 16887, count = 1, notice = true, hundred = 16887}, --宝石碎片(特)
						{itemid = 2217, prob = 16886, count = 1, notice = true, hundred = 16886}, --魂珠碎片(特)
						{itemid = 566 , prob = 16885, count = 1, notice = true, hundred = 16885}, --超级转生丹  
						{itemid = 163 , prob = 16884, count = 1, notice = true, hundred = 16884}, --超级成就令牌
						{itemid = 162 , prob = 16883, count = 1, notice = true, hundred = 16883}, --超级灵力丹  
						{itemid = 675 , prob = 16882, count = 1, notice = true, hundred = 16882}, --999朵玫瑰花 
						{itemid = 528 , prob = 16881, count = 1, notice = true, hundred = 16881}, --特戒碎片包  
						{itemid = 2225, prob = 16880, count = 1, notice = true, hundred = 16880}, --护符碎片(特)

						{itemid = 1158, prob = 3288, count = 1, notice = true, hundred = 8888},  --4转首饰
						{itemid = 1216, prob = 3278, count = 1, notice = true, hundred = 8878},  --4转首饰
						{itemid = 1274, prob = 3268, count = 1, notice = true, hundred = 8868},  --4转首饰
						{itemid = 1332, prob = 3258, count = 1, notice = true, hundred = 8858},  --4转首饰
						{itemid = 1390, prob = 3248, count = 1, notice = true, hundred = 8848},  --4转首饰
						{itemid = 1448, prob = 3238, count = 1, notice = true, hundred = 8838},  --4转首饰
								        
						{itemid = 1177, prob = 3288, count = 1, notice = true, hundred = 8888}, --4转首饰
						{itemid = 1235, prob = 3278, count = 1, notice = true, hundred = 8878}, --4转首饰
						{itemid = 1293, prob = 3268, count = 1, notice = true, hundred = 8868}, --4转首饰
						{itemid = 1351, prob = 3258, count = 1, notice = true, hundred = 8858}, --4转首饰
						{itemid = 1409, prob = 3248, count = 1, notice = true, hundred = 8848}, --4转首饰
						{itemid = 1467, prob = 3238, count = 1, notice = true, hundred = 8838}, --4转首饰
								        
						{itemid = 1196, prob = 3288, count = 1, notice = true, hundred = 8888}, --4转首饰
						{itemid = 1254, prob = 3278, count = 1, notice = true, hundred = 8878}, --4转首饰
						{itemid = 1312, prob = 3268, count = 1, notice = true, hundred = 8868}, --4转首饰
						{itemid = 1370, prob = 3258, count = 1, notice = true, hundred = 8858}, --4转首饰
						{itemid = 1428, prob = 3248, count = 1, notice = true, hundred = 8848}, --4转首饰
						{itemid = 1486, prob = 3238, count = 1, notice = true, hundred = 8838}, --4转首饰
								        
						{itemid = 1158, prob = 3288, count = 1, notice = true, hundred = 8888},  --4转首饰
						{itemid = 1216, prob = 3278, count = 1, notice = true, hundred = 8878},  --4转首饰
						{itemid = 1274, prob = 3268, count = 1, notice = true, hundred = 8868},  --4转首饰
						{itemid = 1332, prob = 3258, count = 1, notice = true, hundred = 8858},  --4转首饰
						{itemid = 1390, prob = 3248, count = 1, notice = true, hundred = 8848},  --4转首饰
						{itemid = 1448, prob = 3238, count = 1, notice = true, hundred = 8838},  --4转首饰
								        
						{itemid = 1177, prob = 3288, count = 1, notice = true, hundred = 8888}, --4转首饰
						{itemid = 1235, prob = 3278, count = 1, notice = true, hundred = 8878}, --4转首饰
						{itemid = 1293, prob = 3268, count = 1, notice = true, hundred = 8868}, --4转首饰
						{itemid = 1351, prob = 3258, count = 1, notice = true, hundred = 8858}, --4转首饰
						{itemid = 1409, prob = 3248, count = 1, notice = true, hundred = 8848}, --4转首饰
						{itemid = 1467, prob = 3238, count = 1, notice = true, hundred = 8838}, --4转首饰
								        
						{itemid = 1196, prob = 3288, count = 1, notice = true, hundred = 8888}, --4转首饰
						{itemid = 1254, prob = 3278, count = 1, notice = true, hundred = 8878}, --4转首饰
						{itemid = 1312, prob = 3268, count = 1, notice = true, hundred = 8868}, --4转首饰
						{itemid = 1370, prob = 3258, count = 1, notice = true, hundred = 8858}, --4转首饰
						{itemid = 1428, prob = 3248, count = 1, notice = true, hundred = 8848}, --4转首饰
						{itemid = 1486, prob = 3238, count = 1, notice = true, hundred = 8838}, --4转首饰

						{itemid = 981 , prob = 3288, count = 1, notice = true, hundred = 3288}, --轩辕神剑    
						{itemid = 1049, prob = 3290, count = 1, notice = true, hundred = 3290}, --轩辕神甲(男)
						{itemid = 1050, prob = 3280, count = 1, notice = true, hundred = 3280}, --轩辕神甲(女)
						{itemid = 1000, prob = 3288, count = 1, notice = true, hundred = 3288}, --轩辕神剑    
						{itemid = 1087, prob = 3290, count = 1, notice = true, hundred = 3290}, --轩辕神甲(男)
						{itemid = 1088, prob = 3280, count = 1, notice = true, hundred = 3280}, --轩辕神甲(女)
						{itemid = 1019, prob = 3288, count = 1, notice = true, hundred = 3288}, --轩辕神剑    
						{itemid = 1125, prob = 3290, count = 1, notice = true, hundred = 3290}, --轩辕神甲(男)
						{itemid = 1126, prob = 3280, count = 1, notice = true, hundred = 3280}, --轩辕神甲(女)

						{itemid = 2635, prob = 9099, count = 1, notice = true, broadcast = true, hundred = 3289}, --青龙阵石 
						{itemid = 2636, prob = 9089, count = 1, notice = true, broadcast = true, hundred = 3289}, --白虎阵石 
						{itemid = 2637, prob = 9079, count = 1, notice = true, broadcast = true, hundred = 3279}, --朱雀阵石 
						{itemid = 2638, prob = 9069, count = 1, notice = true, broadcast = true, hundred = 3269}, --玄武阵石
	
						{itemid = 1940, prob = 988, count = 1, notice = true, hundred = 8888},	--五级羽毛
						{itemid = 1941, prob = 988, count = 1, notice = true, broadcast = true, hundred = 3289}, --六级羽毛 

						{itemid = 636 , prob = 2989, count = 1, notice = true, broadcast = true, hundred = 3289}, --马鞍 
						{itemid = 624 , prob = 2988, count = 1, notice = true, broadcast = true, hundred = 3289}, --蹄铁 
						{itemid = 628 , prob = 2987, count = 1, notice = true, broadcast = true, hundred = 3279}, --缰绳 
						{itemid = 632 , prob = 2986, count = 1, notice = true, broadcast = true, hundred = 3269}, --马镫

						{itemid = 640 , prob = 2889, count = 1, notice = true, broadcast = true, hundred = 3289}, --银光闪豹 
						{itemid = 641 , prob = 2879, count = 1, notice = true, broadcast = true, hundred = 3279}, --万圣战轮 
						{itemid = 642 , prob = 2869, count = 1, notice = true, broadcast = true, hundred = 3269}, --蒸朋怒鲨
						{itemid = 643 , prob = 2889, count = 1, notice = true, broadcast = true, hundred = 3289}, --百鸟朝凤 

						{itemid = 588 , prob = 3089, count = 1, notice = true, broadcast = true, hundred = 3289}, --关羽时装 
						{itemid = 592 , prob = 3079, count = 1, notice = true, broadcast = true, hundred = 3279}, --赵云时装 
						{itemid = 596 , prob = 3069, count = 1, notice = true, broadcast = true, hundred = 3269}, --吕布时装
						{itemid = 612 , prob = 3089, count = 1, notice = true, broadcast = true, hundred = 3289}, --大乔时装 
						{itemid = 616 , prob = 3079, count = 1, notice = true, broadcast = true, hundred = 3279}, --小乔时装 
						{itemid = 620 , prob = 3069, count = 1, notice = true, broadcast = true, hundred = 3269}, --貂蝉时装

						{itemid = 600 , prob = 2889, count = 1, notice = true, broadcast = true, hundred = 3289}, --青龙偃月刀 
						{itemid = 604 , prob = 2879, count = 1, notice = true, broadcast = true, hundred = 3279}, --百鸟朝凤枪 
						{itemid = 608 , prob = 2869, count = 1, notice = true, broadcast = true, hundred = 3269}, --方天画戟

						{itemid = 492 , prob = 3239, count = 1, notice = true, broadcast = true, hundred = 3839}, --返璞归真 
						{itemid = 493 , prob = 3229, count = 1, notice = true, broadcast = true, hundred = 3829}, --鸾凤和鸣 
						{itemid = 494 , prob = 3219, count = 1, notice = true, broadcast = true, hundred = 3819}, --双龙出海 
						{itemid = 495 , prob = 3209, count = 1, notice = true, broadcast = true, hundred = 3809}, --紫翼东升 

						{itemid = 341 , prob = 2839, count = 1, notice = true, broadcast = true, hundred = 3839}, --法老服饰(男) 
						{itemid = 342 , prob = 2829, count = 1, notice = true, broadcast = true, hundred = 3829}, --法老服饰(女) 
						{itemid = 350 , prob = 2819, count = 1, notice = true, broadcast = true, hundred = 3819}, --拳击战服(男) 
						{itemid = 351 , prob = 2809, count = 1, notice = true, broadcast = true, hundred = 3809}, --拳击战服(女) 
						{itemid = 2319, prob = 2805, count = 1, notice = true, broadcast = true, hundred = 3805}, --菊花一锦(男) 
						{itemid = 2320, prob = 2800, count = 1, notice = true, broadcast = true, hundred = 3800}, --菊花一锦(女) 
						{itemid = 2316, prob = 2788, count = 1, notice = true, broadcast = true, hundred = 3088}, --菊花
						{itemid = 338 , prob = 2787, count = 1, notice = true, broadcast = true, hundred = 3087}, --法老权杖 
						{itemid = 347 , prob = 2786, count = 1, notice = true, broadcast = true, hundred = 3086}, --拳击暴雷

						{itemid = 327, prob = 2588, count = 1, notice = true, broadcast = true, hundred = 2588}, --足迹
						{itemid = 328, prob = 2587, count = 1, notice = true, broadcast = true, hundred = 2587}, --足迹
						{itemid = 329, prob = 2586, count = 1, notice = true, broadcast = true, hundred = 2586}, --足迹
						{itemid = 330, prob = 2585, count = 1, notice = true, broadcast = true, hundred = 2585}, --足迹
						{itemid = 331, prob = 2584, count = 1, notice = true, broadcast = true, hundred = 2584}, --足迹
						{itemid = 332, prob = 2583, count = 1, notice = true, broadcast = true, hundred = 2583}, --足迹
						{itemid = 333, prob = 2582, count = 1, notice = true, broadcast = true, hundred = 2582}, --足迹
						{itemid = 334, prob = 2581, count = 1, notice = true, broadcast = true, hundred = 2581}, --足迹 
						{itemid = 335, prob = 2580, count = 1, notice = true, broadcast = true, hundred = 2580}, --足迹

						{itemid = 2156, prob = 2059, count = 1, notice = true, broadcast = true, hundred = 2359}, --新年达人(男) 
						{itemid = 2157, prob = 2049, count = 1, notice = true, broadcast = true, hundred = 2349}, --新年达人(女) 
						{itemid = 2308, prob = 2039, count = 1, notice = true, broadcast = true, hundred = 2339}, --情侣时装(男) 
						{itemid = 2309, prob = 2029, count = 1, notice = true, broadcast = true, hundred = 2329}, --情侣时装(女) 
						{itemid = 2296, prob = 2019, count = 1, notice = true, broadcast = true, hundred = 2319}, --返璞归真(男) 
						{itemid = 2299, prob = 2009, count = 1, notice = true, broadcast = true, hundred = 2309}, --返璞归真(女) 
						{itemid = 2325, prob = 2005, count = 1, notice = true, broadcast = true, hundred = 2305}, --新春时装(男) 
						{itemid = 2326, prob = 2000, count = 1, notice = true, broadcast = true, hundred = 2300}, --新春时装(女) 
						{itemid = 2155, prob = 1688, count = 1, notice = true, broadcast = true, hundred = 1888}, --棒棒糖
						{itemid = 2305, prob = 1687, count = 1, notice = true, broadcast = true, hundred = 1887}, --玫瑰花 
						{itemid = 2302, prob = 1686, count = 1, notice = true, broadcast = true, hundred = 1886}, --反璞归真
						{itemid = 2203, prob = 1388, count = 1, notice = true, broadcast = true, hundred = 1688},--神器碎片
						{itemid = 2204, prob = 1388, count = 1, notice = true, broadcast = true, hundred = 1688},--神甲碎片

						{itemid = 1157, prob = 1588, count = 1, notice = true, hundred = 1588}, --2转首饰 
						{itemid = 1215, prob = 1578, count = 1, notice = true, hundred = 1578}, --2转首饰 
						{itemid = 1273, prob = 1568, count = 1, notice = true, hundred = 1568}, --2转首饰 
						{itemid = 1331, prob = 1558, count = 1, notice = true, hundred = 1558}, --2转首饰 
						{itemid = 1389, prob = 1548, count = 1, notice = true, hundred = 1548}, --2转首饰 
						{itemid = 1447, prob = 1538, count = 1, notice = true, hundred = 1538}, --2转首饰 

						{itemid = 1234, prob = 1578, count = 1, notice = true, hundred = 1578}, --2转首饰 
						{itemid = 1292, prob = 1568, count = 1, notice = true, hundred = 1568}, --2转首饰 
						{itemid = 1350, prob = 1558, count = 1, notice = true, hundred = 1558}, --2转首饰 
						{itemid = 1408, prob = 1548, count = 1, notice = true, hundred = 1548}, --2转首饰 
						{itemid = 1466, prob = 1538, count = 1, notice = true, hundred = 1538}, --2转首饰 

						{itemid = 1195, prob = 1588, count = 1, notice = true, hundred = 1588}, --2转首饰 
						{itemid = 1253, prob = 1578, count = 1, notice = true, hundred = 1578}, --2转首饰 
						{itemid = 1311, prob = 1568, count = 1, notice = true, hundred = 1568}, --2转首饰 
						{itemid = 1369, prob = 1558, count = 1, notice = true, hundred = 1558}, --2转首饰 
						{itemid = 1427, prob = 1548, count = 1, notice = true, hundred = 1548}, --2转首饰 
						{itemid = 1485, prob = 1538, count = 1, notice = true, hundred = 1538}, --2转首饰 

						{itemid = 1157, prob = 1588, count = 1, notice = true, hundred = 1588}, --2转首饰 
						{itemid = 1215, prob = 1578, count = 1, notice = true, hundred = 1578}, --2转首饰 
						{itemid = 1273, prob = 1568, count = 1, notice = true, hundred = 1568}, --2转首饰 
						{itemid = 1331, prob = 1558, count = 1, notice = true, hundred = 1558}, --2转首饰 
						{itemid = 1389, prob = 1548, count = 1, notice = true, hundred = 1548}, --2转首饰 
						{itemid = 1447, prob = 1538, count = 1, notice = true, hundred = 1538}, --2转首饰 

						{itemid = 1234, prob = 1578, count = 1, notice = true, hundred = 1578}, --2转首饰 
						{itemid = 1292, prob = 1568, count = 1, notice = true, hundred = 1568}, --2转首饰 
						{itemid = 1350, prob = 1558, count = 1, notice = true, hundred = 1558}, --2转首饰 
						{itemid = 1408, prob = 1548, count = 1, notice = true, hundred = 1548}, --2转首饰 
						{itemid = 1466, prob = 1538, count = 1, notice = true, hundred = 1538}, --2转首饰 

						{itemid = 1195, prob = 1588, count = 1, notice = true, hundred = 1588}, --2转首饰 
						{itemid = 1253, prob = 1578, count = 1, notice = true, hundred = 1578}, --2转首饰 
						{itemid = 1311, prob = 1568, count = 1, notice = true, hundred = 1568}, --2转首饰 
						{itemid = 1369, prob = 1558, count = 1, notice = true, hundred = 1558}, --2转首饰 
						{itemid = 1427, prob = 1548, count = 1, notice = true, hundred = 1548}, --2转首饰 
						{itemid = 1485, prob = 1538, count = 1, notice = true, hundred = 1538}, --2转首饰 

						{itemid = 980 , prob = 988, count = 1, notice = true, hundred = 988}, --伏虎令剑    
						{itemid = 1047, prob = 990, count = 1, notice = true, hundred = 990}, --伏虎战甲(男)
						{itemid = 1048, prob = 980, count = 1, notice = true, hundred = 980}, --伏虎战甲(女)
						{itemid = 999 , prob = 988, count = 1, notice = true, hundred = 988}, --伏虎令剑    
						{itemid = 1085, prob = 990, count = 1, notice = true, hundred = 990}, --伏虎战甲(男)
						{itemid = 1086, prob = 980, count = 1, notice = true, hundred = 980}, --伏虎战甲(女)
						{itemid = 1018, prob = 988, count = 1, notice = true, hundred = 988}, --伏虎令剑    
						{itemid = 1123, prob = 990, count = 1, notice = true, hundred = 990}, --伏虎战甲(男)
						{itemid = 1124, prob = 980, count = 1, notice = true, hundred = 980}, --伏虎战甲(女)

						{itemid = 2210, prob = 898, count = 1, notice = true, hundred = 898}, --盾牌碎片(大)    
						{itemid = 2214, prob = 878, count = 1, notice = true, hundred = 878}, --宝石碎片(大)    
						{itemid = 2218, prob = 868, count = 1, notice = true, hundred = 868}, --魂珠碎片(大)    
						{itemid = 565 , prob = 888, count = 1, notice = true, hundred = 888}, --高级转生丹      
						{itemid = 145 , prob = 898, count = 1, notice = true, hundred = 898}, --高级成就令牌    
						{itemid = 161 , prob = 878, count = 1, notice = true, hundred = 878}, --高级灵力丹      
						{itemid = 674 , prob = 868, count = 1, notice = true, hundred = 868}, --99朵玫瑰花      
						{itemid = 849 , prob = 858, count = 1, notice = true, hundred = 858}, --五倍经验(2小时) 
						{itemid = 2111, prob = 818, count = 1, notice = true, hundred = 818}, --二级暴击宝石    
						{itemid = 160 , prob = 588, count = 1, notice = true, hundred = 588},  --灵力丹(大)      
						{itemid = 527 , prob = 886, count = 1, notice = true, hundred = 886},  --特戒碎片        
						{itemid = 2226, prob = 885, count = 1, notice = true, hundred = 885}, --护符碎片(大)  

						{itemid = 1156, prob = 588, count = 1, notice = true, hundred = 588}, --1转首饰 
						{itemid = 1214, prob = 578, count = 1, notice = true, hundred = 578}, --1转首饰 
						{itemid = 1272, prob = 568, count = 1, notice = true, hundred = 568}, --1转首饰 
						{itemid = 1330, prob = 558, count = 1, notice = true, hundred = 558}, --1转首饰 
						{itemid = 1388, prob = 548, count = 1, notice = true, hundred = 548}, --1转首饰 
						{itemid = 1446, prob = 538, count = 1, notice = true, hundred = 538}, --1转首饰 

						{itemid = 1175, prob = 586, count = 1, notice = true, hundred = 586}, --1转首饰 
						{itemid = 1233, prob = 576, count = 1, notice = true, hundred = 576}, --1转首饰 
						{itemid = 1291, prob = 566, count = 1, notice = true, hundred = 566}, --1转首饰 
						{itemid = 1349, prob = 556, count = 1, notice = true, hundred = 556}, --1转首饰 
						{itemid = 1407, prob = 546, count = 1, notice = true, hundred = 546}, --1转首饰 
						{itemid = 1465, prob = 536, count = 1, notice = true, hundred = 536}, --1转首饰

						{itemid = 1194, prob = 585, count = 1, notice = true, hundred = 585}, --1转首饰 
						{itemid = 1252, prob = 575, count = 1, notice = true, hundred = 575}, --1转首饰 
						{itemid = 1310, prob = 565, count = 1, notice = true, hundred = 565}, --1转首饰 
						{itemid = 1368, prob = 555, count = 1, notice = true, hundred = 555}, --1转首饰 
						{itemid = 1426, prob = 545, count = 1, notice = true, hundred = 545}, --1转首饰 
						{itemid = 1484, prob = 535, count = 1, notice = true, hundred = 535}, --1转首饰 

						{itemid = 1156, prob = 588, count = 1, notice = true, hundred = 588}, --1转首饰 
						{itemid = 1214, prob = 578, count = 1, notice = true, hundred = 578}, --1转首饰 
						{itemid = 1272, prob = 568, count = 1, notice = true, hundred = 568}, --1转首饰 
						{itemid = 1330, prob = 558, count = 1, notice = true, hundred = 558}, --1转首饰 
						{itemid = 1388, prob = 548, count = 1, notice = true, hundred = 548}, --1转首饰 
						{itemid = 1446, prob = 538, count = 1, notice = true, hundred = 538}, --1转首饰 

						{itemid = 1175, prob = 586, count = 1, notice = true, hundred = 586}, --1转首饰 
						{itemid = 1233, prob = 576, count = 1, notice = true, hundred = 576}, --1转首饰 
						{itemid = 1291, prob = 566, count = 1, notice = true, hundred = 566}, --1转首饰 
						{itemid = 1349, prob = 556, count = 1, notice = true, hundred = 556}, --1转首饰 
						{itemid = 1407, prob = 546, count = 1, notice = true, hundred = 546}, --1转首饰 
						{itemid = 1465, prob = 536, count = 1, notice = true, hundred = 536}, --1转首饰

						{itemid = 1194, prob = 585, count = 1, notice = true, hundred = 585}, --1转首饰 
						{itemid = 1252, prob = 575, count = 1, notice = true, hundred = 575}, --1转首饰 
						{itemid = 1310, prob = 565, count = 1, notice = true, hundred = 565}, --1转首饰 
						{itemid = 1368, prob = 555, count = 1, notice = true, hundred = 555}, --1转首饰 
						{itemid = 1426, prob = 545, count = 1, notice = true, hundred = 545}, --1转首饰 
						{itemid = 1484, prob = 535, count = 1, notice = true, hundred = 535}, --1转首饰 

						{itemid = 979 , prob = 168, count = 1, notice = false, hundred = 168}, --修罗之刃      
						{itemid = 1045, prob = 165, count = 1, notice = false, hundred = 165}, --修罗战甲(男)  
						{itemid = 1046, prob = 162, count = 1, notice = false, hundred = 162}, --修罗战甲(女)  
						{itemid = 998 , prob = 167, count = 1, notice = false, hundred = 167}, --修罗之刃      
						{itemid = 1083, prob = 164, count = 1, notice = false, hundred = 164}, --修罗战甲(男)  
						{itemid = 1084, prob = 161, count = 1, notice = false, hundred = 161}, --修罗战甲(女)  
						{itemid = 1017, prob = 166, count = 1, notice = false, hundred = 166}, --修罗之刃      
						{itemid = 1121, prob = 163, count = 1, notice = false, hundred = 163}, --修罗战甲(男)  
						{itemid = 1122, prob = 160, count = 1, notice = false, hundred = 160}, --修罗战甲(女)  

						{itemid = 2123, prob = 2638, count = 1, notice = false, hundred = 238}, --子鼠玉佩  
						{itemid = 2124, prob = 2638, count = 1, notice = false, hundred = 237}, --丑牛玉佩  
						{itemid = 2125, prob = 2638, count = 1, notice = false, hundred = 236}, --寅虎玉佩  
						{itemid = 2126, prob = 2638, count = 1, notice = false, hundred = 235}, --卯兔玉佩  
						{itemid = 2127, prob = 2638, count = 1, notice = false, hundred = 234}, --辰龙玉佩  
						{itemid = 2128, prob = 2638, count = 1, notice = false, hundred = 233}, --巳蛇玉佩 
						{itemid = 2129, prob = 2638, count = 1, notice = false, hundred = 238}, --午马玉佩  
						{itemid = 2130, prob = 2638, count = 1, notice = false, hundred = 237}, --未羊玉佩  
						{itemid = 2131, prob = 2638, count = 1, notice = false, hundred = 236}, --申猴玉佩  
						{itemid = 2132, prob = 2638, count = 1, notice = false, hundred = 235}, --酉鸡玉佩  
						{itemid = 2133, prob = 2638, count = 1, notice = false, hundred = 234}, --戌狗玉佩  
						{itemid = 2134, prob = 2638, count = 1, notice = false, hundred = 233}, --亥猪玉佩 

						{itemid = 1155, prob = 128, count = 1, notice = false, hundred = 128}, --90级首饰  
						{itemid = 1213, prob = 127, count = 1, notice = false, hundred = 127}, --90级首饰  
						{itemid = 1271, prob = 126, count = 1, notice = false, hundred = 126}, --90级首饰  
						{itemid = 1329, prob = 125, count = 1, notice = false, hundred = 125}, --90级首饰  
						{itemid = 1387, prob = 124, count = 1, notice = false, hundred = 124}, --90级首饰  
						{itemid = 1445, prob = 123, count = 1, notice = false, hundred = 123}, --90级首饰  

						{itemid = 1174, prob = 128, count = 1, notice = false, hundred = 128}, --90级首饰  
						{itemid = 1232, prob = 127, count = 1, notice = false, hundred = 127}, --90级首饰  
						{itemid = 1290, prob = 126, count = 1, notice = false, hundred = 126}, --90级首饰  
						{itemid = 1348, prob = 125, count = 1, notice = false, hundred = 125}, --90级首饰  
						{itemid = 1406, prob = 124, count = 1, notice = false, hundred = 124}, --90级首饰  
						{itemid = 1464, prob = 123, count = 1, notice = false, hundred = 123}, --90级首饰 

						{itemid = 1193, prob = 128, count = 1, notice = false, hundred = 128}, --90级首饰  
						{itemid = 1251, prob = 127, count = 1, notice = false, hundred = 127}, --90级首饰  
						{itemid = 1309, prob = 126, count = 1, notice = false, hundred = 126}, --90级首饰  
						{itemid = 1367, prob = 125, count = 1, notice = false, hundred = 125}, --90级首饰  
						{itemid = 1425, prob = 124, count = 1, notice = false, hundred = 124}, --90级首饰  
						{itemid = 1483, prob = 123, count = 1, notice = false, hundred = 123}, --90级首饰 

						{itemid = 2197, prob = 18, count = 1, notice = false, hundred = 18},    --典
						{itemid = 2196, prob = 17, count = 1, notice = false, hundred = 17},    --庆
						{itemid = 2195, prob = 16, count = 1, notice = false, hundred = 16},    --服
						{itemid = 2193, prob = 15, count = 1, notice = false, hundred = 15},    --千
						{itemid = 2886, prob = 16, count = 1, notice = false, hundred = 14}, --传世宝钻 
						{itemid = 841, prob = 30, count = 1, notice = false, hundred = 10}, --圣兽灵石 
						{itemid = 818 , prob = 4 , count = 1, notice = false, hundred = 1 }, --英雄经验丹  
						{itemid = 513 , prob = 1 , count = 1, notice = false, hundred = 1 }, --经验丹(大)   
					},
				},
			},
		},
	},
},
{
--这个是合服后的
	{
		openday = 9888,		--开服天数, 5天之内存在,进入这个表后就不再进入下一个表

		items = 
		{
			--战士
			{
				{
					money = 3000,		--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 5,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1159, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1217, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1275, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1333, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1391, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1449, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1178, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1236, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1294, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1352, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1410, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1468, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1197, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1255, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1313, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1371, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1429, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1487, prob = 18, count = 1, notice = true, hundred = 18},
					},
				},

				{
					money = 10000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 8,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1159, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1217, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1275, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1333, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1391, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1449, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1178, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1236, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1294, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1352, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1410, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1468, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1197, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1255, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1313, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1371, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1429, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1487, prob = 18, count = 1, notice = true, hundred = 18},
					},
				},
				{
					money = 30000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 12,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1160, prob = 11, count = 1, notice = true, broadcast = true, hundred = 11}, --8转首饰
						{itemid = 1218, prob = 9 , count = 1, notice = true, broadcast = true, hundred = 9 }, --8转首饰
						{itemid = 1276, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1334, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1392, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1450, prob = 7 , count = 1, notice = true, broadcast = true, hundred = 7 }, --8转首饰
					},
				},
				{
					money = 60000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1159, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1217, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1275, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1333, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1391, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1449, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1178, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1236, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1294, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1352, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1410, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1468, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1197, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1255, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1313, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1371, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1429, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1487, prob = 18, count = 1, notice = true, hundred = 18},
					},
				},
				{
					money = 90000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 15,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1160, prob = 11, count = 1, notice = true, broadcast = true, hundred = 11}, --8转首饰
						{itemid = 1218, prob = 9 , count = 1, notice = true, broadcast = true, hundred = 9 }, --8转首饰
						{itemid = 1276, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1334, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1392, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1450, prob = 7 , count = 1, notice = true, broadcast = true, hundred = 7 }, --8转首饰
					},
				},
				{
					money = 120000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1159, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1217, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1275, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1333, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1391, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1449, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1178, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1236, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1294, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1352, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1410, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1468, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1197, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1255, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1313, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1371, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1429, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1487, prob = 18, count = 1, notice = true, hundred = 18},
					},
				},
				{
					money = 150000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 15,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1160, prob = 11, count = 1, notice = true, broadcast = true, hundred = 11}, --8转首饰
						{itemid = 1218, prob = 9 , count = 1, notice = true, broadcast = true, hundred = 9 }, --8转首饰
						{itemid = 1276, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1334, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1392, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1450, prob = 7 , count = 1, notice = true, broadcast = true, hundred = 7 }, --8转首饰
					},
				},
				{
					money = 180000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 12,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1161, prob = 11, count = 1, notice = true, broadcast = true, hundred = 11}, --10转首饰
						{itemid = 1219, prob = 9 , count = 1, notice = true, broadcast = true, hundred = 9 }, --10转首饰
						{itemid = 1277, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --10转首饰
						{itemid = 1335, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --10转首饰
						{itemid = 1393, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --10转首饰
						{itemid = 1451, prob = 7 , count = 1, notice = true, broadcast = true, hundred = 7 }, --10转首饰
					},
				},
				{
					count = 200,	--寻宝次数大于此值才会进入
					maxcount = 250,	--寻宝次数等于此值必定进入
					limit = 1,		--限制进入次数,-1为不限制
					prob = 5,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 2201, prob = 26, count = 1, notice = true, hundred = 26},  --欢
						{itemid = 2200, prob = 10, count = 1, notice = true, hundred = 10},  --狂
						{itemid = 2199, prob = 3 , count = 1, notice = true, hundred = 3},   --民
						{itemid = 2198, prob = 1 , count = 1, notice = true, hundred = 1},   --全
					},
				},
				{
					money = 0,	--寻宝花费数大于此值才会进入此表
					limit = -1,		--限制进入次数,-1为不限制
					prob = 1,

					--道具列表
					items = 
					{
						--id,概率,数量,广播

						{itemid = 2276, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 25888}, --铁血武器        
						{itemid = 2277, prob = 25668, count = 1, notice = true, broadcast = true, hundred = 25668}, --铁血衣服(男)
						{itemid = 2284, prob = 25588, count = 1, notice = true, broadcast = true, hundred = 25588}, --铁血衣服(女)

						{itemid = 2344, prob = 15288, count = 1, notice = true, hundred = 6888}, --傲视狂舞斩(英雄)    
						{itemid = 2354, prob = 15188, count = 1, notice = true, hundred = 6888}, --乾坤降魔杖(英雄)    
						{itemid = 2364, prob = 15088, count = 1, notice = true, hundred = 6888}, --紫金龙皇剑(英雄)    
						{itemid = 2380, prob = 15088, count = 1, notice = true, hundred = 6888}, --傲视狂舞甲(男)(英雄)
						{itemid = 2381, prob = 15088, count = 1, notice = true, hundred = 6888}, --傲视狂舞甲(女)(英雄)
						{itemid = 2400, prob = 15088, count = 1, notice = true, hundred = 6888}, --乾坤降魔衣(男)(英雄)
						{itemid = 2401, prob = 15088, count = 1, notice = true, hundred = 6888}, --乾坤降魔衣(女)(英雄)
						{itemid = 2420, prob = 15088, count = 1, notice = true, hundred = 6888}, --紫金龙皇甲(男)(英雄)
						{itemid = 2421, prob = 15088, count = 1, notice = true, hundred = 6888}, --紫金龙皇甲(女)(英雄)

						{itemid = 2345, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙战剑(英雄)      
						{itemid = 2355, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙魔杖(英雄)    
						{itemid = 2365, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙宝剑(英雄)    
						{itemid = 2382, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙战甲(男)(英雄)
						{itemid = 2383, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙战甲(女)(英雄)
						{itemid = 2402, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙魔衣(男)(英雄)
						{itemid = 2403, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙魔衣(女)(英雄)
						{itemid = 2422, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙道袍(男)(英雄)
						{itemid = 2423, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙道袍(女)(英雄)

						{itemid = 2346, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王战剑(英雄)     
						{itemid = 2356, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王魔杖(英雄)    
						{itemid = 2366, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王道剑(英雄)    
						{itemid = 2384, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王战甲(男)(英雄)
						{itemid = 2385, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王战甲(女)(英雄)
						{itemid = 2404, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王魔衣(男)(英雄)
						{itemid = 2405, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王魔衣(女)(英雄)
						{itemid = 2424, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王道袍(男)(英雄)
						{itemid = 2425, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王道袍(女)(英雄)

						{itemid = 1279, prob = 41588, count = 1, notice = true, broadcast = true, hundred = 32888}, --至尊斗佛战镯    
						{itemid = 1337, prob = 41888, count = 1, notice = true, broadcast = true, hundred = 32888}, --至尊斗佛战戒
						{itemid = 1163, prob = 42585, count = 1, notice = true, broadcast = true, hundred = 32585}, --至尊斗佛战盔
						{itemid = 1221, prob = 42688, count = 1, notice = true, broadcast = true, hundred = 32888}, --至尊斗佛战链    
						{itemid = 1395, prob = 42988, count = 1, notice = true, broadcast = true, hundred = 32888}, --至尊斗佛战带
						{itemid = 1453, prob = 42885, count = 1, notice = true, broadcast = true, hundred = 32585}, --至尊斗佛战靴

						{itemid = 765, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 59888}, --神之斩    
						{itemid = 766, prob = 35888, count = 1, notice = true, broadcast = true, hundred = 58888}, --神之甲
						{itemid = 767, prob = 28585, count = 1, notice = true, broadcast = true, hundred = 58585}, --神之盔
						{itemid = 768, prob = 28881, count = 1, notice = true, broadcast = true, hundred = 59888}, --神之链    
						{itemid = 769, prob = 28882, count = 1, notice = true, broadcast = true, hundred = 58888}, --神之镯
						{itemid = 770, prob = 28585, count = 1, notice = true, broadcast = true, hundred = 58585}, --神之戒
						{itemid = 771, prob = 28883, count = 1, notice = true, broadcast = true, hundred = 59888}, --神之带    
						{itemid = 772, prob = 28988, count = 1, notice = true, broadcast = true, hundred = 59888}, --神之靴

						{itemid = 987 , prob = 39888, count = 1, notice = true, broadcast = true, hundred = 59888}, --至尊斗佛斩        
						{itemid = 1061, prob = 35888, count = 1, notice = true, broadcast = true, hundred = 58888}, --至尊斗佛战甲(男)
						{itemid = 1062, prob = 35585, count = 1, notice = true, broadcast = true, hundred = 58585}, --至尊斗佛战甲(女)

						{itemid = 986 , prob = 32888, count = 1, notice = true, broadcast = true, hundred = 59888}, --斗佛之斩        
						{itemid = 1059, prob = 31888, count = 1, notice = true, broadcast = true, hundred = 58888}, --斗佛战甲(男)
						{itemid = 1060, prob = 31585, count = 1, notice = true, broadcast = true, hundred = 58585}, --斗佛战甲(女)

						{itemid = 984 , prob = 89888, count = 1, notice = true, broadcast = true, hundred = 59888}, --8转武器        
						{itemid = 1055, prob = 88888, count = 1, notice = true, broadcast = true, hundred = 58888}, --8转衣服(男)
						{itemid = 1056, prob = 88585, count = 1, notice = true, broadcast = true, hundred = 58585}, --8转衣服(女)

						{itemid = 983 , prob = 32886, count = 1, notice = true, broadcast = true, hundred = 32886}, --傲视狂舞斩    
						{itemid = 1053, prob = 32883, count = 1, notice = true, broadcast = true, hundred = 32883}, --傲视狂舞甲(男)
						{itemid = 1054, prob = 32586, count = 1, notice = true, broadcast = true, hundred = 32586}, --傲视狂舞甲(女)

						{itemid = 1278, prob = 21588, count = 1, notice = true, broadcast = true, hundred = 32888}, --斗佛战镯    
						{itemid = 1336, prob = 21888, count = 1, notice = true, broadcast = true, hundred = 32888}, --斗佛战戒
						{itemid = 1162, prob = 22585, count = 1, notice = true, broadcast = true, hundred = 32585}, --斗佛战盔
						{itemid = 1220, prob = 22688, count = 1, notice = true, broadcast = true, hundred = 32888}, --斗佛战链    
						{itemid = 1394, prob = 22988, count = 1, notice = true, broadcast = true, hundred = 32888}, --斗佛战带
						{itemid = 1452, prob = 22885, count = 1, notice = true, broadcast = true, hundred = 32585}, --斗佛战靴

						{itemid = 1161, prob = 42888, count = 1, notice = true, broadcast = true, hundred = 32888}, --10转首饰    
						{itemid = 1219, prob = 42888, count = 1, notice = true, broadcast = true, hundred = 32888}, --10转首饰
						{itemid = 1277, prob = 42585, count = 1, notice = true, broadcast = true, hundred = 32585}, --10转首饰
						{itemid = 1335, prob = 42888, count = 1, notice = true, broadcast = true, hundred = 32888}, --10转首饰    
						{itemid = 1393, prob = 42888, count = 1, notice = true, broadcast = true, hundred = 32888}, --10转首饰
						{itemid = 1451, prob = 42585, count = 1, notice = true, broadcast = true, hundred = 32585}, --10转首饰

						{itemid = 1160, prob = 22888, count = 1, notice = true, broadcast = true, hundred = 22888}, --8转首饰    
						{itemid = 1218, prob = 22888, count = 1, notice = true, broadcast = true, hundred = 22888}, --8转首饰
						{itemid = 1276, prob = 22585, count = 1, notice = true, broadcast = true, hundred = 22585}, --8转首饰
						{itemid = 1334, prob = 22888, count = 1, notice = true, broadcast = true, hundred = 22888}, --8转首饰    
						{itemid = 1392, prob = 22888, count = 1, notice = true, broadcast = true, hundred = 22888}, --8转首饰
						{itemid = 1450, prob = 22585, count = 1, notice = true, broadcast = true, hundred = 22585}, --8转首饰

						{itemid = 2291, prob = 26968, count = 1, notice = true, broadcast = true, hundred = 2359}, --圣·新年达人(男) 
						{itemid = 2292, prob = 26868, count = 1, notice = true, broadcast = true, hundred = 2349}, --圣·新年达人(女) 
						{itemid = 2310, prob = 26768, count = 1, notice = true, broadcast = true, hundred = 2339}, --圣·情侣时装(男) 
						{itemid = 2311, prob = 26668, count = 1, notice = true, broadcast = true, hundred = 2329}, --圣·情侣时装(女) 
						{itemid = 2297, prob = 26568, count = 1, notice = true, broadcast = true, hundred = 2319}, --圣·返璞归真(男) 
						{itemid = 2300, prob = 26468, count = 1, notice = true, broadcast = true, hundred = 2309}, --圣·返璞归真(女) 
						{itemid = 2327, prob = 26368, count = 1, notice = true, broadcast = true, hundred = 2305}, --圣·新春时装(男)
						{itemid = 2328, prob = 26268, count = 1, notice = true, broadcast = true, hundred = 2300}, --圣·新春时装(女) 
						{itemid = 2290, prob = 26168, count = 1, notice = true, broadcast = true, hundred = 1888}, --圣·棒棒糖
						{itemid = 2306, prob = 26068, count = 1, notice = true, broadcast = true, hundred = 1887}, --圣·玫瑰花 
						{itemid = 2303, prob = 26066, count = 1, notice = true, broadcast = true, hundred = 1886}, --圣·反璞归真

						{itemid = 2887, prob = 12888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世之刃  
						{itemid = 2888, prob = 11888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世之甲
						{itemid = 2889, prob = 5888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世头盔
						{itemid = 2890, prob = 5888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世项链
						{itemid = 2891, prob = 5888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世手镯
						{itemid = 2892, prob = 5888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世戒指
						{itemid = 2893, prob = 5888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世靴子
						{itemid = 2894, prob = 5888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世腰带

						{itemid = 1159, prob = 6568, count = 1, notice = true, hundred = 15568}, --6转首饰
						{itemid = 1217, prob = 6567, count = 1, notice = true, hundred = 15567}, --6转首饰
						{itemid = 1275, prob = 6566, count = 1, notice = true, hundred = 15566}, --6转首饰
						{itemid = 1333, prob = 6565, count = 1, notice = true, hundred = 15565}, --6转首饰
						{itemid = 1391, prob = 6564, count = 1, notice = true, hundred = 15564}, --6转首饰
						{itemid = 1449, prob = 6563, count = 1, notice = true, hundred = 15563}, --6转首饰
								        
						{itemid = 1178, prob = 6558, count = 1, notice = true, hundred = 15558}, --6转首饰
						{itemid = 1236, prob = 6557, count = 1, notice = true, hundred = 15557}, --6转首饰
						{itemid = 1294, prob = 6556, count = 1, notice = true, hundred = 15556}, --6转首饰
						{itemid = 1352, prob = 6555, count = 1, notice = true, hundred = 15555}, --6转首饰
						{itemid = 1410, prob = 6553, count = 1, notice = true, hundred = 15553}, --6转首饰
						{itemid = 1468, prob = 6552, count = 1, notice = true, hundred = 15552}, --6转首饰
								        
						{itemid = 1197, prob = 6538, count = 1, notice = true, hundred = 15538}, --6转首饰
						{itemid = 1255, prob = 6537, count = 1, notice = true, hundred = 15537}, --6转首饰
						{itemid = 1313, prob = 6536, count = 1, notice = true, hundred = 15536}, --6转首饰
						{itemid = 1371, prob = 6535, count = 1, notice = true, hundred = 15535}, --6转首饰
						{itemid = 1429, prob = 6533, count = 1, notice = true, hundred = 15533}, --6转首饰
						{itemid = 1487, prob = 6532, count = 1, notice = true, hundred = 15532}, --6转首饰

						{itemid = 982 , prob = 13588, count = 1, notice = true, hundred = 13588}, --天武神剑    
						{itemid = 1051, prob = 12888, count = 1, notice = true, hundred = 12888}, --天武神甲(男)
						{itemid = 1052, prob = 12878, count = 1, notice = true, hundred = 12878}, --天武神甲(女)
						{itemid = 1001, prob = 12588, count = 1, notice = true, hundred = 12588}, --天武神剑    
						{itemid = 1089, prob = 12888, count = 1, notice = true, hundred = 12888}, --天武神甲(男)
						{itemid = 1090, prob = 12878, count = 1, notice = true, hundred = 12878}, --天武神甲(女)
						{itemid = 1020, prob = 12588, count = 1, notice = true, hundred = 12588}, --天武神剑    
						{itemid = 1127, prob = 12888, count = 1, notice = true, hundred = 12888}, --天武神甲(男)
						{itemid = 1128, prob = 12878, count = 1, notice = true, hundred = 12878}, --天武神甲(女)

						{itemid = 2209, prob = 16888, count = 1, notice = true, hundred = 16888}, --盾牌碎片(特)
						{itemid = 2213, prob = 16887, count = 1, notice = true, hundred = 16887}, --宝石碎片(特)
						{itemid = 2217, prob = 16886, count = 1, notice = true, hundred = 16886}, --魂珠碎片(特)
						{itemid = 566 , prob = 16885, count = 1, notice = true, hundred = 16885}, --超级转生丹  
						{itemid = 163 , prob = 16884, count = 1, notice = true, hundred = 16884}, --超级成就令牌
						{itemid = 162 , prob = 16883, count = 1, notice = true, hundred = 16883}, --超级灵力丹  
						{itemid = 675 , prob = 16882, count = 1, notice = true, hundred = 16882}, --999朵玫瑰花 
						{itemid = 528 , prob = 16881, count = 1, notice = true, hundred = 16881}, --特戒碎片包  
						{itemid = 2225, prob = 16880, count = 1, notice = true, hundred = 16880}, --护符碎片(特)

						{itemid = 3007, prob = 3207, count = 1, notice = true, broadcast = true, hundred = 3839}, --龙行天下 
						{itemid = 3008, prob = 3208, count = 1, notice = true, broadcast = true, hundred = 3829}, --如影随形 
						{itemid = 3009, prob = 3209, count = 1, notice = true, broadcast = true, hundred = 3819}, --双龙出海 
						{itemid = 3010, prob = 3210, count = 1, notice = true, broadcast = true, hundred = 3809}, --丘比特   
						{itemid = 3011, prob = 3211, count = 1, notice = true, broadcast = true, hundred = 3805}, --神龙开道 
						{itemid = 3012, prob = 3212, count = 1, notice = true, broadcast = true, hundred = 3800}, --冰火之歌 
						{itemid = 3013, prob = 3213, count = 1, notice = true, broadcast = true, hundred = 3088}, --弥勒笑佛
						{itemid = 3014, prob = 3214, count = 1, notice = true, broadcast = true, hundred = 3087}, --熊二快跑

						{itemid = 1158, prob = 3288, count = 1, notice = true, hundred = 8888},  --4转首饰
						{itemid = 1216, prob = 3278, count = 1, notice = true, hundred = 8878},  --4转首饰
						{itemid = 1274, prob = 3268, count = 1, notice = true, hundred = 8868},  --4转首饰
						{itemid = 1332, prob = 3258, count = 1, notice = true, hundred = 8858},  --4转首饰
						{itemid = 1390, prob = 3248, count = 1, notice = true, hundred = 8848},  --4转首饰
						{itemid = 1448, prob = 3238, count = 1, notice = true, hundred = 8838},  --4转首饰
								        
						{itemid = 1177, prob = 3288, count = 1, notice = true, hundred = 8888}, --4转首饰
						{itemid = 1235, prob = 3278, count = 1, notice = true, hundred = 8878}, --4转首饰
						{itemid = 1293, prob = 3268, count = 1, notice = true, hundred = 8868}, --4转首饰
						{itemid = 1351, prob = 3258, count = 1, notice = true, hundred = 8858}, --4转首饰
						{itemid = 1409, prob = 3248, count = 1, notice = true, hundred = 8848}, --4转首饰
						{itemid = 1467, prob = 3238, count = 1, notice = true, hundred = 8838}, --4转首饰
								        
						{itemid = 1196, prob = 3288, count = 1, notice = true, hundred = 8888}, --4转首饰
						{itemid = 1254, prob = 3278, count = 1, notice = true, hundred = 8878}, --4转首饰
						{itemid = 1312, prob = 3268, count = 1, notice = true, hundred = 8868}, --4转首饰
						{itemid = 1370, prob = 3258, count = 1, notice = true, hundred = 8858}, --4转首饰
						{itemid = 1428, prob = 3248, count = 1, notice = true, hundred = 8848}, --4转首饰
						{itemid = 1486, prob = 3238, count = 1, notice = true, hundred = 8838}, --4转首饰
								        
						{itemid = 1158, prob = 3288, count = 1, notice = true, hundred = 8888},  --4转首饰
						{itemid = 1216, prob = 3278, count = 1, notice = true, hundred = 8878},  --4转首饰
						{itemid = 1274, prob = 3268, count = 1, notice = true, hundred = 8868},  --4转首饰
						{itemid = 1332, prob = 3258, count = 1, notice = true, hundred = 8858},  --4转首饰
						{itemid = 1390, prob = 3248, count = 1, notice = true, hundred = 8848},  --4转首饰
						{itemid = 1448, prob = 3238, count = 1, notice = true, hundred = 8838},  --4转首饰
								        
						{itemid = 1177, prob = 3288, count = 1, notice = true, hundred = 8888}, --4转首饰
						{itemid = 1235, prob = 3278, count = 1, notice = true, hundred = 8878}, --4转首饰
						{itemid = 1293, prob = 3268, count = 1, notice = true, hundred = 8868}, --4转首饰
						{itemid = 1351, prob = 3258, count = 1, notice = true, hundred = 8858}, --4转首饰
						{itemid = 1409, prob = 3248, count = 1, notice = true, hundred = 8848}, --4转首饰
						{itemid = 1467, prob = 3238, count = 1, notice = true, hundred = 8838}, --4转首饰
								        
						{itemid = 1196, prob = 3288, count = 1, notice = true, hundred = 8888}, --4转首饰
						{itemid = 1254, prob = 3278, count = 1, notice = true, hundred = 8878}, --4转首饰
						{itemid = 1312, prob = 3268, count = 1, notice = true, hundred = 8868}, --4转首饰
						{itemid = 1370, prob = 3258, count = 1, notice = true, hundred = 8858}, --4转首饰
						{itemid = 1428, prob = 3248, count = 1, notice = true, hundred = 8848}, --4转首饰
						{itemid = 1486, prob = 3238, count = 1, notice = true, hundred = 8838}, --4转首饰

						{itemid = 981 , prob = 2888, count = 1, notice = true, hundred = 2888}, --轩辕神剑    
						{itemid = 1049, prob = 2885, count = 1, notice = true, hundred = 2885}, --轩辕神甲(男)
						{itemid = 1050, prob = 2880, count = 1, notice = true, hundred = 2880}, --轩辕神甲(女)
						{itemid = 1000, prob = 2888, count = 1, notice = true, hundred = 2888}, --轩辕神剑    
						{itemid = 1087, prob = 2885, count = 1, notice = true, hundred = 2885}, --轩辕神甲(男)
						{itemid = 1088, prob = 2880, count = 1, notice = true, hundred = 2880}, --轩辕神甲(女)
						{itemid = 1019, prob = 2888, count = 1, notice = true, hundred = 2888}, --轩辕神剑    
						{itemid = 1125, prob = 2885, count = 1, notice = true, hundred = 2885}, --轩辕神甲(男)
						{itemid = 1126, prob = 2880, count = 1, notice = true, hundred = 2880}, --轩辕神甲(女)

						{itemid = 2635, prob = 9099, count = 1, notice = true, broadcast = true, hundred = 3289}, --青龙阵石 
						{itemid = 2636, prob = 9089, count = 1, notice = true, broadcast = true, hundred = 3289}, --白虎阵石 
						{itemid = 2637, prob = 9079, count = 1, notice = true, broadcast = true, hundred = 3279}, --朱雀阵石 
						{itemid = 2638, prob = 9069, count = 1, notice = true, broadcast = true, hundred = 3269}, --玄武阵石
	
						{itemid = 1940, prob = 988, count = 1, notice = true, hundred = 8888},	--五级羽毛
						{itemid = 1941, prob = 988, count = 1, notice = true, broadcast = true, hundred = 3289}, --六级羽毛 

						{itemid = 636 , prob = 2989, count = 1, notice = true, broadcast = true, hundred = 3289}, --马鞍 
						{itemid = 624 , prob = 2988, count = 1, notice = true, broadcast = true, hundred = 3289}, --蹄铁 
						{itemid = 628 , prob = 2987, count = 1, notice = true, broadcast = true, hundred = 3279}, --缰绳 
						{itemid = 632 , prob = 2986, count = 1, notice = true, broadcast = true, hundred = 3269}, --马镫

						{itemid = 640 , prob = 2889, count = 1, notice = true, broadcast = true, hundred = 3289}, --银光闪豹 
						{itemid = 641 , prob = 2879, count = 1, notice = true, broadcast = true, hundred = 3279}, --万圣战轮 
						{itemid = 642 , prob = 2869, count = 1, notice = true, broadcast = true, hundred = 3269}, --蒸朋怒鲨
						{itemid = 643 , prob = 2889, count = 1, notice = true, broadcast = true, hundred = 3289}, --百鸟朝凤 

						{itemid = 588 , prob = 3089, count = 1, notice = true, broadcast = true, hundred = 3289}, --关羽时装 
						{itemid = 592 , prob = 3079, count = 1, notice = true, broadcast = true, hundred = 3279}, --赵云时装 
						{itemid = 596 , prob = 3069, count = 1, notice = true, broadcast = true, hundred = 3269}, --吕布时装
						{itemid = 612 , prob = 3089, count = 1, notice = true, broadcast = true, hundred = 3289}, --大乔时装 
						{itemid = 616 , prob = 3079, count = 1, notice = true, broadcast = true, hundred = 3279}, --小乔时装 
						{itemid = 620 , prob = 3069, count = 1, notice = true, broadcast = true, hundred = 3269}, --貂蝉时装

						{itemid = 600 , prob = 2889, count = 1, notice = true, broadcast = true, hundred = 3289}, --青龙偃月刀 
						{itemid = 604 , prob = 2879, count = 1, notice = true, broadcast = true, hundred = 3279}, --百鸟朝凤枪 
						{itemid = 608 , prob = 2869, count = 1, notice = true, broadcast = true, hundred = 3269}, --方天画戟

						{itemid = 492 , prob = 3239, count = 1, notice = true, broadcast = true, hundred = 3839}, --返璞归真 
						{itemid = 493 , prob = 3229, count = 1, notice = true, broadcast = true, hundred = 3829}, --鸾凤和鸣 
						{itemid = 494 , prob = 3219, count = 1, notice = true, broadcast = true, hundred = 3819}, --双龙出海 
						{itemid = 495 , prob = 3209, count = 1, notice = true, broadcast = true, hundred = 3809}, --紫翼东升 

						{itemid = 341 , prob = 2839, count = 1, notice = true, broadcast = true, hundred = 3839}, --法老服饰(男) 
						{itemid = 342 , prob = 2829, count = 1, notice = true, broadcast = true, hundred = 3829}, --法老服饰(女) 
						{itemid = 350 , prob = 2819, count = 1, notice = true, broadcast = true, hundred = 3819}, --拳击战服(男) 
						{itemid = 351 , prob = 2809, count = 1, notice = true, broadcast = true, hundred = 3809}, --拳击战服(女) 
						{itemid = 2319, prob = 2805, count = 1, notice = true, broadcast = true, hundred = 3805}, --菊花一锦(男) 
						{itemid = 2320, prob = 2800, count = 1, notice = true, broadcast = true, hundred = 3800}, --菊花一锦(女) 
						{itemid = 2316, prob = 2788, count = 1, notice = true, broadcast = true, hundred = 3088}, --菊花
						{itemid = 338 , prob = 2787, count = 1, notice = true, broadcast = true, hundred = 3087}, --法老权杖 
						{itemid = 347 , prob = 2786, count = 1, notice = true, broadcast = true, hundred = 3086}, --拳击暴雷

						{itemid = 327, prob = 2588, count = 1, notice = true, broadcast = true, hundred = 2588}, --足迹
						{itemid = 328, prob = 2587, count = 1, notice = true, broadcast = true, hundred = 2587}, --足迹
						{itemid = 329, prob = 2586, count = 1, notice = true, broadcast = true, hundred = 2586}, --足迹
						{itemid = 330, prob = 2585, count = 1, notice = true, broadcast = true, hundred = 2585}, --足迹
						{itemid = 331, prob = 2584, count = 1, notice = true, broadcast = true, hundred = 2584}, --足迹
						{itemid = 332, prob = 2583, count = 1, notice = true, broadcast = true, hundred = 2583}, --足迹
						{itemid = 333, prob = 2582, count = 1, notice = true, broadcast = true, hundred = 2582}, --足迹
						{itemid = 334, prob = 2581, count = 1, notice = true, broadcast = true, hundred = 2581}, --足迹 
						{itemid = 335, prob = 2580, count = 1, notice = true, broadcast = true, hundred = 2580}, --足迹

						{itemid = 2156, prob = 2059, count = 1, notice = true, broadcast = true, hundred = 2359}, --新年达人(男) 
						{itemid = 2157, prob = 2049, count = 1, notice = true, broadcast = true, hundred = 2349}, --新年达人(女) 
						{itemid = 2308, prob = 2039, count = 1, notice = true, broadcast = true, hundred = 2339}, --情侣时装(男) 
						{itemid = 2309, prob = 2029, count = 1, notice = true, broadcast = true, hundred = 2329}, --情侣时装(女) 
						{itemid = 2296, prob = 2019, count = 1, notice = true, broadcast = true, hundred = 2319}, --返璞归真(男) 
						{itemid = 2299, prob = 2009, count = 1, notice = true, broadcast = true, hundred = 2309}, --返璞归真(女) 
						{itemid = 2325, prob = 2005, count = 1, notice = true, broadcast = true, hundred = 2305}, --新春时装(男) 
						{itemid = 2326, prob = 2000, count = 1, notice = true, broadcast = true, hundred = 2300}, --新春时装(女) 
						{itemid = 2155, prob = 1688, count = 1, notice = true, broadcast = true, hundred = 1888}, --棒棒糖
						{itemid = 2305, prob = 1687, count = 1, notice = true, broadcast = true, hundred = 1887}, --玫瑰花 
						{itemid = 2302, prob = 1686, count = 1, notice = true, broadcast = true, hundred = 1886}, --反璞归真
						{itemid = 2203, prob = 1388, count = 1, notice = true, broadcast = true, hundred = 1688},--神器碎片
						{itemid = 2204, prob = 1388, count = 1, notice = true, broadcast = true, hundred = 1688},--神甲碎片

						{itemid = 2262, prob = 1075, count = 1, notice = true, hundred = 6375}, --铁血面甲
						{itemid = 2263, prob = 1076, count = 1, notice = true, hundred = 6376}, --铁血吊坠
						{itemid = 2261, prob = 1078, count = 1, notice = true, hundred = 6378}, --铁血护膝
						{itemid = 2260, prob = 1088, count = 1, notice = true, hundred = 6388}, --铁血护肩

						{itemid = 1157, prob = 1288, count = 1, notice = true, hundred = 1288}, --2转首饰 
						{itemid = 1215, prob = 1278, count = 1, notice = true, hundred = 1278}, --2转首饰 
						{itemid = 1273, prob = 1268, count = 1, notice = true, hundred = 1268}, --2转首饰 
						{itemid = 1331, prob = 1258, count = 1, notice = true, hundred = 1258}, --2转首饰 
						{itemid = 1389, prob = 1248, count = 1, notice = true, hundred = 1248}, --2转首饰 
						{itemid = 1447, prob = 1238, count = 1, notice = true, hundred = 1238}, --2转首饰 

						{itemid = 1234, prob = 1278, count = 1, notice = true, hundred = 1278}, --2转首饰 
						{itemid = 1292, prob = 1268, count = 1, notice = true, hundred = 1268}, --2转首饰 
						{itemid = 1350, prob = 1258, count = 1, notice = true, hundred = 1258}, --2转首饰 
						{itemid = 1408, prob = 1248, count = 1, notice = true, hundred = 1248}, --2转首饰 
						{itemid = 1466, prob = 1238, count = 1, notice = true, hundred = 1238}, --2转首饰 

						{itemid = 1195, prob = 1288, count = 1, notice = true, hundred = 1288}, --2转首饰 
						{itemid = 1253, prob = 1278, count = 1, notice = true, hundred = 1278}, --2转首饰 
						{itemid = 1311, prob = 1268, count = 1, notice = true, hundred = 1268}, --2转首饰 
						{itemid = 1369, prob = 1258, count = 1, notice = true, hundred = 1258}, --2转首饰 
						{itemid = 1427, prob = 1248, count = 1, notice = true, hundred = 1248}, --2转首饰 
						{itemid = 1485, prob = 1238, count = 1, notice = true, hundred = 1238}, --2转首饰 

						{itemid = 1157, prob = 1288, count = 1, notice = true, hundred = 1288}, --2转首饰 
						{itemid = 1215, prob = 1278, count = 1, notice = true, hundred = 1278}, --2转首饰 
						{itemid = 1273, prob = 1268, count = 1, notice = true, hundred = 1268}, --2转首饰 
						{itemid = 1331, prob = 1258, count = 1, notice = true, hundred = 1258}, --2转首饰 
						{itemid = 1389, prob = 1248, count = 1, notice = true, hundred = 1248}, --2转首饰 
						{itemid = 1447, prob = 1238, count = 1, notice = true, hundred = 1238}, --2转首饰 

						{itemid = 1234, prob = 1278, count = 1, notice = true, hundred = 1278}, --2转首饰 
						{itemid = 1292, prob = 1268, count = 1, notice = true, hundred = 1268}, --2转首饰 
						{itemid = 1350, prob = 1258, count = 1, notice = true, hundred = 1258}, --2转首饰 
						{itemid = 1408, prob = 1248, count = 1, notice = true, hundred = 1248}, --2转首饰 
						{itemid = 1466, prob = 1238, count = 1, notice = true, hundred = 1238}, --2转首饰 

						{itemid = 1195, prob = 1288, count = 1, notice = true, hundred = 1288}, --2转首饰 
						{itemid = 1253, prob = 1278, count = 1, notice = true, hundred = 1278}, --2转首饰 
						{itemid = 1311, prob = 1268, count = 1, notice = true, hundred = 1268}, --2转首饰 
						{itemid = 1369, prob = 1258, count = 1, notice = true, hundred = 1258}, --2转首饰 
						{itemid = 1427, prob = 1248, count = 1, notice = true, hundred = 1248}, --2转首饰 
						{itemid = 1485, prob = 1238, count = 1, notice = true, hundred = 1238}, --2转首饰 

						{itemid = 980 , prob = 988, count = 1, notice = true, hundred = 988}, --伏虎令剑    
						{itemid = 1047, prob = 990, count = 1, notice = true, hundred = 990}, --伏虎战甲(男)
						{itemid = 1048, prob = 980, count = 1, notice = true, hundred = 980}, --伏虎战甲(女)

						{itemid = 999 , prob = 988, count = 1, notice = true, hundred = 988}, --伏虎令剑    
						{itemid = 1085, prob = 990, count = 1, notice = true, hundred = 990}, --伏虎战甲(男)
						{itemid = 1086, prob = 980, count = 1, notice = true, hundred = 980}, --伏虎战甲(女)

						{itemid = 1018, prob = 988, count = 1, notice = true, hundred = 988}, --伏虎令剑    
						{itemid = 1123, prob = 990, count = 1, notice = true, hundred = 990}, --伏虎战甲(男)
						{itemid = 1124, prob = 980, count = 1, notice = true, hundred = 980}, --伏虎战甲(女)

						{itemid = 2210, prob = 898, count = 1, notice = true, hundred = 898}, --盾牌碎片(大)    
						{itemid = 2214, prob = 878, count = 1, notice = true, hundred = 878}, --宝石碎片(大)    
						{itemid = 2218, prob = 868, count = 1, notice = true, hundred = 868}, --魂珠碎片(大)    
						{itemid = 565 , prob = 888, count = 1, notice = true, hundred = 888}, --高级转生丹      
						{itemid = 145 , prob = 898, count = 1, notice = true, hundred = 898}, --高级成就令牌    
						{itemid = 161 , prob = 878, count = 1, notice = true, hundred = 878}, --高级灵力丹      
						{itemid = 674 , prob = 868, count = 1, notice = true, hundred = 868}, --99朵玫瑰花      
						{itemid = 849 , prob = 858, count = 1, notice = true, hundred = 858}, --五倍经验(2小时) 
						{itemid = 2111, prob = 818, count = 1, notice = true, hundred = 818}, --二级暴击宝石    
						{itemid = 160 , prob = 588, count = 1, notice = true, hundred = 588},  --灵力丹(大)      
						{itemid = 527 , prob = 886, count = 1, notice = true, hundred = 886},  --特戒碎片        
						{itemid = 2226, prob = 885, count = 1, notice = true, hundred = 885}, --护符碎片(大)  

						{itemid = 1156, prob = 588, count = 1, notice = true, hundred = 588}, --1转首饰 
						{itemid = 1214, prob = 578, count = 1, notice = true, hundred = 578}, --1转首饰 
						{itemid = 1272, prob = 568, count = 1, notice = true, hundred = 568}, --1转首饰 
						{itemid = 1330, prob = 558, count = 1, notice = true, hundred = 558}, --1转首饰 
						{itemid = 1388, prob = 548, count = 1, notice = true, hundred = 548}, --1转首饰 
						{itemid = 1446, prob = 538, count = 1, notice = true, hundred = 538}, --1转首饰 

						{itemid = 1175, prob = 586, count = 1, notice = true, hundred = 586}, --1转首饰 
						{itemid = 1233, prob = 576, count = 1, notice = true, hundred = 576}, --1转首饰 
						{itemid = 1291, prob = 566, count = 1, notice = true, hundred = 566}, --1转首饰 
						{itemid = 1349, prob = 556, count = 1, notice = true, hundred = 556}, --1转首饰 
						{itemid = 1407, prob = 546, count = 1, notice = true, hundred = 546}, --1转首饰 
						{itemid = 1465, prob = 536, count = 1, notice = true, hundred = 536}, --1转首饰

						{itemid = 1194, prob = 585, count = 1, notice = true, hundred = 585}, --1转首饰 
						{itemid = 1252, prob = 575, count = 1, notice = true, hundred = 575}, --1转首饰 
						{itemid = 1310, prob = 565, count = 1, notice = true, hundred = 565}, --1转首饰 
						{itemid = 1368, prob = 555, count = 1, notice = true, hundred = 555}, --1转首饰 
						{itemid = 1426, prob = 545, count = 1, notice = true, hundred = 545}, --1转首饰 
						{itemid = 1484, prob = 535, count = 1, notice = true, hundred = 535}, --1转首饰 

						{itemid = 1156, prob = 588, count = 1, notice = true, hundred = 588}, --1转首饰 
						{itemid = 1214, prob = 578, count = 1, notice = true, hundred = 578}, --1转首饰 
						{itemid = 1272, prob = 568, count = 1, notice = true, hundred = 568}, --1转首饰 
						{itemid = 1330, prob = 558, count = 1, notice = true, hundred = 558}, --1转首饰 
						{itemid = 1388, prob = 548, count = 1, notice = true, hundred = 548}, --1转首饰 
						{itemid = 1446, prob = 538, count = 1, notice = true, hundred = 538}, --1转首饰 

						{itemid = 1175, prob = 586, count = 1, notice = true, hundred = 586}, --1转首饰 
						{itemid = 1233, prob = 576, count = 1, notice = true, hundred = 576}, --1转首饰 
						{itemid = 1291, prob = 566, count = 1, notice = true, hundred = 566}, --1转首饰 
						{itemid = 1349, prob = 556, count = 1, notice = true, hundred = 556}, --1转首饰 
						{itemid = 1407, prob = 546, count = 1, notice = true, hundred = 546}, --1转首饰 
						{itemid = 1465, prob = 536, count = 1, notice = true, hundred = 536}, --1转首饰

						{itemid = 1194, prob = 585, count = 1, notice = true, hundred = 585}, --1转首饰 
						{itemid = 1252, prob = 575, count = 1, notice = true, hundred = 575}, --1转首饰 
						{itemid = 1310, prob = 565, count = 1, notice = true, hundred = 565}, --1转首饰 
						{itemid = 1368, prob = 555, count = 1, notice = true, hundred = 555}, --1转首饰 
						{itemid = 1426, prob = 545, count = 1, notice = true, hundred = 545}, --1转首饰 
						{itemid = 1484, prob = 535, count = 1, notice = true, hundred = 535}, --1转首饰 

						{itemid = 979 , prob = 168, count = 1, notice = false, hundred = 168}, --修罗之刃      
						{itemid = 1045, prob = 165, count = 1, notice = false, hundred = 165}, --修罗战甲(男)  
						{itemid = 1046, prob = 162, count = 1, notice = false, hundred = 162}, --修罗战甲(女)  

						{itemid = 998 , prob = 167, count = 1, notice = false, hundred = 168}, --修罗之刃      
						{itemid = 1083, prob = 164, count = 1, notice = false, hundred = 165}, --修罗战甲(男)  
						{itemid = 1084, prob = 161, count = 1, notice = false, hundred = 162}, --修罗战甲(女)  

						{itemid = 1017, prob = 166, count = 1, notice = false, hundred = 168}, --修罗之刃      
						{itemid = 1121, prob = 163, count = 1, notice = false, hundred = 165}, --修罗战甲(男)  
						{itemid = 1122, prob = 160, count = 1, notice = false, hundred = 162}, --修罗战甲(女)  

						{itemid = 2123, prob = 2638, count = 1, notice = false, hundred = 238}, --子鼠玉佩  
						{itemid = 2124, prob = 2638, count = 1, notice = false, hundred = 237}, --丑牛玉佩  
						{itemid = 2125, prob = 2638, count = 1, notice = false, hundred = 236}, --寅虎玉佩  
						{itemid = 2126, prob = 2638, count = 1, notice = false, hundred = 235}, --卯兔玉佩  
						{itemid = 2127, prob = 2638, count = 1, notice = false, hundred = 234}, --辰龙玉佩  
						{itemid = 2128, prob = 2638, count = 1, notice = false, hundred = 233}, --巳蛇玉佩 
						{itemid = 2129, prob = 2638, count = 1, notice = false, hundred = 238}, --午马玉佩  
						{itemid = 2130, prob = 2638, count = 1, notice = false, hundred = 237}, --未羊玉佩  
						{itemid = 2131, prob = 2638, count = 1, notice = false, hundred = 236}, --申猴玉佩  
						{itemid = 2132, prob = 2638, count = 1, notice = false, hundred = 235}, --酉鸡玉佩  
						{itemid = 2133, prob = 2638, count = 1, notice = false, hundred = 234}, --戌狗玉佩  
						{itemid = 2134, prob = 2638, count = 1, notice = false, hundred = 233}, --亥猪玉佩 

						{itemid = 1155, prob = 128, count = 1, notice = false, hundred = 128}, --90级首饰  
						{itemid = 1213, prob = 127, count = 1, notice = false, hundred = 127}, --90级首饰  
						{itemid = 1271, prob = 126, count = 1, notice = false, hundred = 126}, --90级首饰  
						{itemid = 1329, prob = 125, count = 1, notice = false, hundred = 125}, --90级首饰  
						{itemid = 1387, prob = 124, count = 1, notice = false, hundred = 124}, --90级首饰  
						{itemid = 1445, prob = 123, count = 1, notice = false, hundred = 123}, --90级首饰  

						{itemid = 1174, prob = 128, count = 1, notice = false, hundred = 128}, --90级首饰  
						{itemid = 1232, prob = 127, count = 1, notice = false, hundred = 127}, --90级首饰  
						{itemid = 1290, prob = 126, count = 1, notice = false, hundred = 126}, --90级首饰  
						{itemid = 1348, prob = 125, count = 1, notice = false, hundred = 125}, --90级首饰  
						{itemid = 1406, prob = 124, count = 1, notice = false, hundred = 124}, --90级首饰  
						{itemid = 1464, prob = 123, count = 1, notice = false, hundred = 123}, --90级首饰 

						{itemid = 1193, prob = 128, count = 1, notice = false, hundred = 128}, --90级首饰  
						{itemid = 1251, prob = 127, count = 1, notice = false, hundred = 127}, --90级首饰  
						{itemid = 1309, prob = 126, count = 1, notice = false, hundred = 126}, --90级首饰  
						{itemid = 1367, prob = 125, count = 1, notice = false, hundred = 125}, --90级首饰  
						{itemid = 1425, prob = 124, count = 1, notice = false, hundred = 124}, --90级首饰  
						{itemid = 1483, prob = 123, count = 1, notice = false, hundred = 123}, --90级首饰 

						{itemid = 2197, prob = 18, count = 1, notice = false, hundred = 18},    --典
						{itemid = 2196, prob = 17, count = 1, notice = false, hundred = 17},    --庆
						{itemid = 2195, prob = 16, count = 1, notice = false, hundred = 16},    --服
						{itemid = 2193, prob = 15, count = 1, notice = false, hundred = 15},    --千
						{itemid = 2886, prob = 16, count = 1, notice = false, hundred = 14}, --传世宝钻 
						{itemid = 841, prob = 30, count = 1, notice = false, hundred = 10}, --圣兽灵石 
						{itemid = 818 , prob = 4 , count = 1, notice = false, hundred = 1 }, --英雄经验丹  
						{itemid = 513 , prob = 1 , count = 1, notice = false, hundred = 1 }, --经验丹(大)   
					},
				},
			},
			--法师
			{
				{
					money = 3000,		--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 5,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1159, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1217, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1275, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1333, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1391, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1449, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1178, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1236, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1294, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1352, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1410, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1468, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1197, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1255, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1313, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1371, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1429, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1487, prob = 18, count = 1, notice = true, hundred = 18},
					},
				},

				{
					money = 10000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 8,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1159, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1217, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1275, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1333, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1391, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1449, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1178, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1236, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1294, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1352, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1410, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1468, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1197, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1255, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1313, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1371, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1429, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1487, prob = 18, count = 1, notice = true, hundred = 18},
					},
				},
				{
					money = 30000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 12,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1179, prob = 11, count = 1, notice = true, broadcast = true, hundred = 11}, --8转首饰
						{itemid = 1237, prob = 9 , count = 1, notice = true, broadcast = true, hundred = 9 }, --8转首饰
						{itemid = 1295, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1353, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1411, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1469, prob = 7 , count = 1, notice = true, broadcast = true, hundred = 7 }, --8转首饰
					},
				},
				{
					money = 60000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1159, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1217, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1275, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1333, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1391, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1449, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1178, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1236, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1294, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1352, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1410, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1468, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1197, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1255, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1313, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1371, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1429, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1487, prob = 18, count = 1, notice = true, hundred = 18},
					},
				},
				{
					money = 90000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 15,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1179, prob = 11, count = 1, notice = true, broadcast = true, hundred = 11}, --8转首饰
						{itemid = 1237, prob = 9 , count = 1, notice = true, broadcast = true, hundred = 9 }, --8转首饰
						{itemid = 1295, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1353, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1411, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1469, prob = 7 , count = 1, notice = true, broadcast = true, hundred = 7 }, --8转首饰
					},
				},
				{
					money = 120000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1159, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1217, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1275, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1333, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1391, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1449, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1178, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1236, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1294, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1352, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1410, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1468, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1197, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1255, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1313, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1371, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1429, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1487, prob = 18, count = 1, notice = true, hundred = 18},
					},
				},
				{
					money = 150000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 15,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1179, prob = 11, count = 1, notice = true, broadcast = true, hundred = 11}, --8转首饰
						{itemid = 1237, prob = 9 , count = 1, notice = true, broadcast = true, hundred = 9 }, --8转首饰
						{itemid = 1295, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1353, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1411, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1469, prob = 7 , count = 1, notice = true, broadcast = true, hundred = 7 }, --8转首饰
					},
				},
				{
					money = 180000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 12,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1180, prob = 11, count = 1, notice = true, broadcast = true, hundred = 11}, --10转首饰
						{itemid = 1238, prob = 9 , count = 1, notice = true, broadcast = true, hundred = 9 }, --10转首饰
						{itemid = 1296, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --10转首饰
						{itemid = 1354, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --10转首饰
						{itemid = 1412, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --10转首饰
						{itemid = 1470, prob = 7 , count = 1, notice = true, broadcast = true, hundred = 7 }, --10转首饰
					},
				},
				{
					count = 200,	--寻宝次数大于此值才会进入
					maxcount = 250,	--寻宝次数等于此值必定进入
					limit = 1,		--限制进入次数,-1为不限制
					prob = 5,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 2201, prob = 26, count = 1, notice = true, hundred = 26},  --欢
						{itemid = 2200, prob = 10, count = 1, notice = true, hundred = 10},  --狂
						{itemid = 2199, prob = 3 , count = 1, notice = true, hundred = 3},   --民
						{itemid = 2198, prob = 1 , count = 1, notice = true, hundred = 1},   --全
					},
				},
				{
					money = 0,	--寻宝花费数大于此值才会进入此表
					limit = -1,		--限制进入次数,-1为不限制
					prob = 1,

					--道具列表
					items = 
					{
						--id,概率,数量,广播

						{itemid = 2276, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 25888}, --铁血武器        
						{itemid = 2277, prob = 25668, count = 1, notice = true, broadcast = true, hundred = 25668}, --铁血衣服(男)
						{itemid = 2284, prob = 25588, count = 1, notice = true, broadcast = true, hundred = 25588}, --铁血衣服(女)

						{itemid = 2344, prob = 15288, count = 1, notice = true, hundred = 6888}, --傲视狂舞斩(英雄)    
						{itemid = 2354, prob = 15188, count = 1, notice = true, hundred = 6888}, --乾坤降魔杖(英雄)    
						{itemid = 2364, prob = 15088, count = 1, notice = true, hundred = 6888}, --紫金龙皇剑(英雄)    
						{itemid = 2380, prob = 15088, count = 1, notice = true, hundred = 6888}, --傲视狂舞甲(男)(英雄)
						{itemid = 2381, prob = 15088, count = 1, notice = true, hundred = 6888}, --傲视狂舞甲(女)(英雄)
						{itemid = 2400, prob = 15088, count = 1, notice = true, hundred = 6888}, --乾坤降魔衣(男)(英雄)
						{itemid = 2401, prob = 15088, count = 1, notice = true, hundred = 6888}, --乾坤降魔衣(女)(英雄)
						{itemid = 2420, prob = 15088, count = 1, notice = true, hundred = 6888}, --紫金龙皇甲(男)(英雄)
						{itemid = 2421, prob = 15088, count = 1, notice = true, hundred = 6888}, --紫金龙皇甲(女)(英雄)

						{itemid = 2345, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙战剑(英雄)      
						{itemid = 2355, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙魔杖(英雄)    
						{itemid = 2365, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙宝剑(英雄)    
						{itemid = 2382, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙战甲(男)(英雄)
						{itemid = 2383, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙战甲(女)(英雄)
						{itemid = 2402, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙魔衣(男)(英雄)
						{itemid = 2403, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙魔衣(女)(英雄)
						{itemid = 2422, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙道袍(男)(英雄)
						{itemid = 2423, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙道袍(女)(英雄)

						{itemid = 2346, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王战剑(英雄)     
						{itemid = 2356, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王魔杖(英雄)    
						{itemid = 2366, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王道剑(英雄)    
						{itemid = 2384, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王战甲(男)(英雄)
						{itemid = 2385, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王战甲(女)(英雄)
						{itemid = 2404, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王魔衣(男)(英雄)
						{itemid = 2405, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王魔衣(女)(英雄)
						{itemid = 2424, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王道袍(男)(英雄)
						{itemid = 2425, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王道袍(女)(英雄)

						{itemid = 1298, prob = 41588, count = 1, notice = true, broadcast = true, hundred = 32888}, --杀神法镯    
						{itemid = 1356, prob = 41888, count = 1, notice = true, broadcast = true, hundred = 32888}, --杀神法戒
						{itemid = 1182, prob = 42585, count = 1, notice = true, broadcast = true, hundred = 32585}, --杀神法盔
						{itemid = 1240, prob = 42688, count = 1, notice = true, broadcast = true, hundred = 32888}, --杀神法链    
						{itemid = 1414, prob = 42988, count = 1, notice = true, broadcast = true, hundred = 32888}, --杀神法带
						{itemid = 1472, prob = 42885, count = 1, notice = true, broadcast = true, hundred = 32585}, --杀神法靴

						{itemid = 765, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 59888}, --神之斩    
						{itemid = 766, prob = 35888, count = 1, notice = true, broadcast = true, hundred = 58888}, --神之甲
						{itemid = 767, prob = 28585, count = 1, notice = true, broadcast = true, hundred = 58585}, --神之盔
						{itemid = 768, prob = 28881, count = 1, notice = true, broadcast = true, hundred = 59888}, --神之链    
						{itemid = 769, prob = 28882, count = 1, notice = true, broadcast = true, hundred = 58888}, --神之镯
						{itemid = 770, prob = 28585, count = 1, notice = true, broadcast = true, hundred = 58585}, --神之戒
						{itemid = 771, prob = 28883, count = 1, notice = true, broadcast = true, hundred = 59888}, --神之带    
						{itemid = 772, prob = 28988, count = 1, notice = true, broadcast = true, hundred = 59888}, --神之靴

						{itemid = 1006, prob = 39888, count = 1, notice = true, broadcast = true, hundred = 59888}, --至尊杀神杖        
						{itemid = 1099, prob = 35888, count = 1, notice = true, broadcast = true, hundred = 58888}, --至尊杀神披风(男)
						{itemid = 1100, prob = 35585, count = 1, notice = true, broadcast = true, hundred = 58585}, --至尊杀神披风(女)

						{itemid = 1005, prob = 32888, count = 1, notice = true, broadcast = true, hundred = 59888}, --杀神之杖        
						{itemid = 1097, prob = 31888, count = 1, notice = true, broadcast = true, hundred = 58888}, --杀神披风(男)
						{itemid = 1098, prob = 31585, count = 1, notice = true, broadcast = true, hundred = 58585}, --杀神披风(女)

						{itemid = 1003, prob = 89888, count = 1, notice = true, broadcast = true, hundred = 59888}, --8转武器    
						{itemid = 1093, prob = 88888, count = 1, notice = true, broadcast = true, hundred = 58888}, --8转衣服(男)
						{itemid = 1094, prob = 88585, count = 1, notice = true, broadcast = true, hundred = 58585}, --8转衣服(女)

						{itemid = 1002, prob = 32886, count = 1, notice = true, broadcast = true, hundred = 32886}, --傲视狂舞斩    
						{itemid = 1091, prob = 32883, count = 1, notice = true, broadcast = true, hundred = 32883}, --傲视狂舞甲(男)
						{itemid = 1092, prob = 32586, count = 1, notice = true, broadcast = true, hundred = 32586}, --傲视狂舞甲(女)

						{itemid = 1297, prob = 21588, count = 1, notice = true, broadcast = true, hundred = 32888}, --杀神法镯    
						{itemid = 1355, prob = 21888, count = 1, notice = true, broadcast = true, hundred = 32888}, --杀神法戒
						{itemid = 1181, prob = 22585, count = 1, notice = true, broadcast = true, hundred = 32585}, --杀神法盔
						{itemid = 1239, prob = 22688, count = 1, notice = true, broadcast = true, hundred = 32888}, --杀神法链    
						{itemid = 1413, prob = 22988, count = 1, notice = true, broadcast = true, hundred = 32888}, --杀神法带
						{itemid = 1471, prob = 22885, count = 1, notice = true, broadcast = true, hundred = 32585}, --杀神法靴

						{itemid = 1180, prob = 42888, count = 1, notice = true, broadcast = true, hundred = 32888}, --10转首饰    
						{itemid = 1238, prob = 42888, count = 1, notice = true, broadcast = true, hundred = 32888}, --10转首饰
						{itemid = 1296, prob = 42585, count = 1, notice = true, broadcast = true, hundred = 32585}, --10转首饰
						{itemid = 1354, prob = 42888, count = 1, notice = true, broadcast = true, hundred = 32888}, --10转首饰    
						{itemid = 1412, prob = 42888, count = 1, notice = true, broadcast = true, hundred = 32888}, --10转首饰
						{itemid = 1470, prob = 42585, count = 1, notice = true, broadcast = true, hundred = 32585}, --10转首饰

						{itemid = 1179, prob = 22888, count = 1, notice = true, broadcast = true, hundred = 22888}, --8转首饰
						{itemid = 1237, prob = 22888, count = 1, notice = true, broadcast = true, hundred = 22888}, --8转首饰
						{itemid = 1295, prob = 22585, count = 1, notice = true, broadcast = true, hundred = 22585}, --8转首饰
						{itemid = 1353, prob = 22888, count = 1, notice = true, broadcast = true, hundred = 22888}, --8转首饰
						{itemid = 1411, prob = 22888, count = 1, notice = true, broadcast = true, hundred = 22888}, --8转首饰
						{itemid = 1469, prob = 22585, count = 1, notice = true, broadcast = true, hundred = 22585}, --8转首饰

						{itemid = 2291, prob = 26968, count = 1, notice = true, broadcast = true, hundred = 2359}, --圣·新年达人(男) 
						{itemid = 2292, prob = 26868, count = 1, notice = true, broadcast = true, hundred = 2349}, --圣·新年达人(女) 
						{itemid = 2310, prob = 26768, count = 1, notice = true, broadcast = true, hundred = 2339}, --圣·情侣时装(男) 
						{itemid = 2311, prob = 26668, count = 1, notice = true, broadcast = true, hundred = 2329}, --圣·情侣时装(女) 
						{itemid = 2297, prob = 26568, count = 1, notice = true, broadcast = true, hundred = 2319}, --圣·返璞归真(男) 
						{itemid = 2300, prob = 26468, count = 1, notice = true, broadcast = true, hundred = 2309}, --圣·返璞归真(女) 
						{itemid = 2327, prob = 26368, count = 1, notice = true, broadcast = true, hundred = 2305}, --圣·新春时装(男)
						{itemid = 2328, prob = 26268, count = 1, notice = true, broadcast = true, hundred = 2300}, --圣·新春时装(女) 
						{itemid = 2290, prob = 26168, count = 1, notice = true, broadcast = true, hundred = 1888}, --圣·棒棒糖
						{itemid = 2306, prob = 26068, count = 1, notice = true, broadcast = true, hundred = 1887}, --圣·玫瑰花 
						{itemid = 2303, prob = 26066, count = 1, notice = true, broadcast = true, hundred = 1886}, --圣·反璞归真

						{itemid = 2887, prob = 12888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世之刃  
						{itemid = 2888, prob = 11888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世之甲
						{itemid = 2889, prob = 5888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世头盔
						{itemid = 2890, prob = 5888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世项链
						{itemid = 2891, prob = 5888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世手镯
						{itemid = 2892, prob = 5888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世戒指
						{itemid = 2893, prob = 5888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世靴子
						{itemid = 2894, prob = 5888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世腰带

						{itemid = 1159, prob = 6568, count = 1, notice = true, hundred = 15568}, --6转首饰
						{itemid = 1217, prob = 6567, count = 1, notice = true, hundred = 15567}, --6转首饰
						{itemid = 1275, prob = 6566, count = 1, notice = true, hundred = 15566}, --6转首饰
						{itemid = 1333, prob = 6565, count = 1, notice = true, hundred = 15565}, --6转首饰
						{itemid = 1391, prob = 6564, count = 1, notice = true, hundred = 15564}, --6转首饰
						{itemid = 1449, prob = 6563, count = 1, notice = true, hundred = 15563}, --6转首饰
								        
						{itemid = 1178, prob = 6558, count = 1, notice = true, hundred = 15558}, --6转首饰
						{itemid = 1236, prob = 6557, count = 1, notice = true, hundred = 15557}, --6转首饰
						{itemid = 1294, prob = 6556, count = 1, notice = true, hundred = 15556}, --6转首饰
						{itemid = 1352, prob = 6555, count = 1, notice = true, hundred = 15555}, --6转首饰
						{itemid = 1410, prob = 6553, count = 1, notice = true, hundred = 15553}, --6转首饰
						{itemid = 1468, prob = 6552, count = 1, notice = true, hundred = 15552}, --6转首饰
								        
						{itemid = 1197, prob = 6538, count = 1, notice = true, hundred = 15538}, --6转首饰
						{itemid = 1255, prob = 6537, count = 1, notice = true, hundred = 15537}, --6转首饰
						{itemid = 1313, prob = 6536, count = 1, notice = true, hundred = 15536}, --6转首饰
						{itemid = 1371, prob = 6535, count = 1, notice = true, hundred = 15535}, --6转首饰
						{itemid = 1429, prob = 6533, count = 1, notice = true, hundred = 15533}, --6转首饰
						{itemid = 1487, prob = 6532, count = 1, notice = true, hundred = 15532}, --6转首饰

						{itemid = 982 , prob = 13588, count = 1, notice = true, hundred = 13588}, --天武神剑    
						{itemid = 1051, prob = 12888, count = 1, notice = true, hundred = 12888}, --天武神甲(男)
						{itemid = 1052, prob = 12878, count = 1, notice = true, hundred = 12878}, --天武神甲(女)
						{itemid = 1001, prob = 12588, count = 1, notice = true, hundred = 12588}, --天武神剑    
						{itemid = 1089, prob = 12888, count = 1, notice = true, hundred = 12888}, --天武神甲(男)
						{itemid = 1090, prob = 12878, count = 1, notice = true, hundred = 12878}, --天武神甲(女)
						{itemid = 1020, prob = 12588, count = 1, notice = true, hundred = 12588}, --天武神剑    
						{itemid = 1127, prob = 12888, count = 1, notice = true, hundred = 12888}, --天武神甲(男)
						{itemid = 1128, prob = 12878, count = 1, notice = true, hundred = 12878}, --天武神甲(女)

						{itemid = 2209, prob = 16888, count = 1, notice = true, hundred = 16888}, --盾牌碎片(特)
						{itemid = 2213, prob = 16887, count = 1, notice = true, hundred = 16887}, --宝石碎片(特)
						{itemid = 2217, prob = 16886, count = 1, notice = true, hundred = 16886}, --魂珠碎片(特)
						{itemid = 566 , prob = 16885, count = 1, notice = true, hundred = 16885}, --超级转生丹  
						{itemid = 163 , prob = 16884, count = 1, notice = true, hundred = 16884}, --超级成就令牌
						{itemid = 162 , prob = 16883, count = 1, notice = true, hundred = 16883}, --超级灵力丹  
						{itemid = 675 , prob = 16882, count = 1, notice = true, hundred = 16882}, --999朵玫瑰花 
						{itemid = 528 , prob = 16881, count = 1, notice = true, hundred = 16881}, --特戒碎片包  
						{itemid = 2225, prob = 16880, count = 1, notice = true, hundred = 16880}, --护符碎片(特)

						{itemid = 3007, prob = 3207, count = 1, notice = true, broadcast = true, hundred = 3839}, --龙行天下 
						{itemid = 3008, prob = 3208, count = 1, notice = true, broadcast = true, hundred = 3829}, --如影随形 
						{itemid = 3009, prob = 3209, count = 1, notice = true, broadcast = true, hundred = 3819}, --双龙出海 
						{itemid = 3010, prob = 3210, count = 1, notice = true, broadcast = true, hundred = 3809}, --丘比特   
						{itemid = 3011, prob = 3211, count = 1, notice = true, broadcast = true, hundred = 3805}, --神龙开道 
						{itemid = 3012, prob = 3212, count = 1, notice = true, broadcast = true, hundred = 3800}, --冰火之歌 
						{itemid = 3013, prob = 3213, count = 1, notice = true, broadcast = true, hundred = 3088}, --弥勒笑佛
						{itemid = 3014, prob = 3214, count = 1, notice = true, broadcast = true, hundred = 3087}, --熊二快跑

						{itemid = 1158, prob = 3288, count = 1, notice = true, hundred = 8888},  --4转首饰
						{itemid = 1216, prob = 3278, count = 1, notice = true, hundred = 8878},  --4转首饰
						{itemid = 1274, prob = 3268, count = 1, notice = true, hundred = 8868},  --4转首饰
						{itemid = 1332, prob = 3258, count = 1, notice = true, hundred = 8858},  --4转首饰
						{itemid = 1390, prob = 3248, count = 1, notice = true, hundred = 8848},  --4转首饰
						{itemid = 1448, prob = 3238, count = 1, notice = true, hundred = 8838},  --4转首饰
								        
						{itemid = 1177, prob = 3288, count = 1, notice = true, hundred = 8888}, --4转首饰
						{itemid = 1235, prob = 3278, count = 1, notice = true, hundred = 8878}, --4转首饰
						{itemid = 1293, prob = 3268, count = 1, notice = true, hundred = 8868}, --4转首饰
						{itemid = 1351, prob = 3258, count = 1, notice = true, hundred = 8858}, --4转首饰
						{itemid = 1409, prob = 3248, count = 1, notice = true, hundred = 8848}, --4转首饰
						{itemid = 1467, prob = 3238, count = 1, notice = true, hundred = 8838}, --4转首饰
								        
						{itemid = 1196, prob = 3288, count = 1, notice = true, hundred = 8888}, --4转首饰
						{itemid = 1254, prob = 3278, count = 1, notice = true, hundred = 8878}, --4转首饰
						{itemid = 1312, prob = 3268, count = 1, notice = true, hundred = 8868}, --4转首饰
						{itemid = 1370, prob = 3258, count = 1, notice = true, hundred = 8858}, --4转首饰
						{itemid = 1428, prob = 3248, count = 1, notice = true, hundred = 8848}, --4转首饰
						{itemid = 1486, prob = 3238, count = 1, notice = true, hundred = 8838}, --4转首饰
								        
						{itemid = 1158, prob = 3288, count = 1, notice = true, hundred = 8888},  --4转首饰
						{itemid = 1216, prob = 3278, count = 1, notice = true, hundred = 8878},  --4转首饰
						{itemid = 1274, prob = 3268, count = 1, notice = true, hundred = 8868},  --4转首饰
						{itemid = 1332, prob = 3258, count = 1, notice = true, hundred = 8858},  --4转首饰
						{itemid = 1390, prob = 3248, count = 1, notice = true, hundred = 8848},  --4转首饰
						{itemid = 1448, prob = 3238, count = 1, notice = true, hundred = 8838},  --4转首饰
								        
						{itemid = 1177, prob = 3288, count = 1, notice = true, hundred = 8888}, --4转首饰
						{itemid = 1235, prob = 3278, count = 1, notice = true, hundred = 8878}, --4转首饰
						{itemid = 1293, prob = 3268, count = 1, notice = true, hundred = 8868}, --4转首饰
						{itemid = 1351, prob = 3258, count = 1, notice = true, hundred = 8858}, --4转首饰
						{itemid = 1409, prob = 3248, count = 1, notice = true, hundred = 8848}, --4转首饰
						{itemid = 1467, prob = 3238, count = 1, notice = true, hundred = 8838}, --4转首饰
								        
						{itemid = 1196, prob = 3288, count = 1, notice = true, hundred = 8888}, --4转首饰
						{itemid = 1254, prob = 3278, count = 1, notice = true, hundred = 8878}, --4转首饰
						{itemid = 1312, prob = 3268, count = 1, notice = true, hundred = 8868}, --4转首饰
						{itemid = 1370, prob = 3258, count = 1, notice = true, hundred = 8858}, --4转首饰
						{itemid = 1428, prob = 3248, count = 1, notice = true, hundred = 8848}, --4转首饰
						{itemid = 1486, prob = 3238, count = 1, notice = true, hundred = 8838}, --4转首饰

						{itemid = 981 , prob = 2888, count = 1, notice = true, hundred = 2888}, --轩辕神剑    
						{itemid = 1049, prob = 2885, count = 1, notice = true, hundred = 2885}, --轩辕神甲(男)
						{itemid = 1050, prob = 2880, count = 1, notice = true, hundred = 2880}, --轩辕神甲(女)
						{itemid = 1000, prob = 2888, count = 1, notice = true, hundred = 2888}, --轩辕神剑    
						{itemid = 1087, prob = 2885, count = 1, notice = true, hundred = 2885}, --轩辕神甲(男)
						{itemid = 1088, prob = 2880, count = 1, notice = true, hundred = 2880}, --轩辕神甲(女)
						{itemid = 1019, prob = 2888, count = 1, notice = true, hundred = 2888}, --轩辕神剑    
						{itemid = 1125, prob = 2885, count = 1, notice = true, hundred = 2885}, --轩辕神甲(男)
						{itemid = 1126, prob = 2880, count = 1, notice = true, hundred = 2880}, --轩辕神甲(女)

						{itemid = 2635, prob = 9099, count = 1, notice = true, broadcast = true, hundred = 3289}, --青龙阵石 
						{itemid = 2636, prob = 9089, count = 1, notice = true, broadcast = true, hundred = 3289}, --白虎阵石 
						{itemid = 2637, prob = 9079, count = 1, notice = true, broadcast = true, hundred = 3279}, --朱雀阵石 
						{itemid = 2638, prob = 9069, count = 1, notice = true, broadcast = true, hundred = 3269}, --玄武阵石
	
						{itemid = 1940, prob = 988, count = 1, notice = true, hundred = 8888},	--五级羽毛
						{itemid = 1941, prob = 988, count = 1, notice = true, broadcast = true, hundred = 3289}, --六级羽毛 

						{itemid = 636 , prob = 2989, count = 1, notice = true, broadcast = true, hundred = 3289}, --马鞍 
						{itemid = 624 , prob = 2988, count = 1, notice = true, broadcast = true, hundred = 3289}, --蹄铁 
						{itemid = 628 , prob = 2987, count = 1, notice = true, broadcast = true, hundred = 3279}, --缰绳 
						{itemid = 632 , prob = 2986, count = 1, notice = true, broadcast = true, hundred = 3269}, --马镫

						{itemid = 640 , prob = 2889, count = 1, notice = true, broadcast = true, hundred = 3289}, --银光闪豹 
						{itemid = 641 , prob = 2879, count = 1, notice = true, broadcast = true, hundred = 3279}, --万圣战轮 
						{itemid = 642 , prob = 2869, count = 1, notice = true, broadcast = true, hundred = 3269}, --蒸朋怒鲨
						{itemid = 643 , prob = 2889, count = 1, notice = true, broadcast = true, hundred = 3289}, --百鸟朝凤 

						{itemid = 588 , prob = 3089, count = 1, notice = true, broadcast = true, hundred = 3289}, --关羽时装 
						{itemid = 592 , prob = 3079, count = 1, notice = true, broadcast = true, hundred = 3279}, --赵云时装 
						{itemid = 596 , prob = 3069, count = 1, notice = true, broadcast = true, hundred = 3269}, --吕布时装
						{itemid = 612 , prob = 3089, count = 1, notice = true, broadcast = true, hundred = 3289}, --大乔时装 
						{itemid = 616 , prob = 3079, count = 1, notice = true, broadcast = true, hundred = 3279}, --小乔时装 
						{itemid = 620 , prob = 3069, count = 1, notice = true, broadcast = true, hundred = 3269}, --貂蝉时装

						{itemid = 600 , prob = 2889, count = 1, notice = true, broadcast = true, hundred = 3289}, --青龙偃月刀 
						{itemid = 604 , prob = 2879, count = 1, notice = true, broadcast = true, hundred = 3279}, --百鸟朝凤枪 
						{itemid = 608 , prob = 2869, count = 1, notice = true, broadcast = true, hundred = 3269}, --方天画戟

						{itemid = 492 , prob = 3239, count = 1, notice = true, broadcast = true, hundred = 3839}, --返璞归真 
						{itemid = 493 , prob = 3229, count = 1, notice = true, broadcast = true, hundred = 3829}, --鸾凤和鸣 
						{itemid = 494 , prob = 3219, count = 1, notice = true, broadcast = true, hundred = 3819}, --双龙出海 
						{itemid = 495 , prob = 3209, count = 1, notice = true, broadcast = true, hundred = 3809}, --紫翼东升 

						{itemid = 341 , prob = 2839, count = 1, notice = true, broadcast = true, hundred = 3839}, --法老服饰(男) 
						{itemid = 342 , prob = 2829, count = 1, notice = true, broadcast = true, hundred = 3829}, --法老服饰(女) 
						{itemid = 350 , prob = 2819, count = 1, notice = true, broadcast = true, hundred = 3819}, --拳击战服(男) 
						{itemid = 351 , prob = 2809, count = 1, notice = true, broadcast = true, hundred = 3809}, --拳击战服(女) 
						{itemid = 2319, prob = 2805, count = 1, notice = true, broadcast = true, hundred = 3805}, --菊花一锦(男) 
						{itemid = 2320, prob = 2800, count = 1, notice = true, broadcast = true, hundred = 3800}, --菊花一锦(女) 
						{itemid = 2316, prob = 2788, count = 1, notice = true, broadcast = true, hundred = 3088}, --菊花
						{itemid = 338 , prob = 2787, count = 1, notice = true, broadcast = true, hundred = 3087}, --法老权杖 
						{itemid = 347 , prob = 2786, count = 1, notice = true, broadcast = true, hundred = 3086}, --拳击暴雷

						{itemid = 327, prob = 2588, count = 1, notice = true, broadcast = true, hundred = 2588}, --足迹
						{itemid = 328, prob = 2587, count = 1, notice = true, broadcast = true, hundred = 2587}, --足迹
						{itemid = 329, prob = 2586, count = 1, notice = true, broadcast = true, hundred = 2586}, --足迹
						{itemid = 330, prob = 2585, count = 1, notice = true, broadcast = true, hundred = 2585}, --足迹
						{itemid = 331, prob = 2584, count = 1, notice = true, broadcast = true, hundred = 2584}, --足迹
						{itemid = 332, prob = 2583, count = 1, notice = true, broadcast = true, hundred = 2583}, --足迹
						{itemid = 333, prob = 2582, count = 1, notice = true, broadcast = true, hundred = 2582}, --足迹
						{itemid = 334, prob = 2581, count = 1, notice = true, broadcast = true, hundred = 2581}, --足迹 
						{itemid = 335, prob = 2580, count = 1, notice = true, broadcast = true, hundred = 2580}, --足迹

						{itemid = 2156, prob = 2059, count = 1, notice = true, broadcast = true, hundred = 2359}, --新年达人(男) 
						{itemid = 2157, prob = 2049, count = 1, notice = true, broadcast = true, hundred = 2349}, --新年达人(女) 
						{itemid = 2308, prob = 2039, count = 1, notice = true, broadcast = true, hundred = 2339}, --情侣时装(男) 
						{itemid = 2309, prob = 2029, count = 1, notice = true, broadcast = true, hundred = 2329}, --情侣时装(女) 
						{itemid = 2296, prob = 2019, count = 1, notice = true, broadcast = true, hundred = 2319}, --返璞归真(男) 
						{itemid = 2299, prob = 2009, count = 1, notice = true, broadcast = true, hundred = 2309}, --返璞归真(女) 
						{itemid = 2325, prob = 2005, count = 1, notice = true, broadcast = true, hundred = 2305}, --新春时装(男) 
						{itemid = 2326, prob = 2000, count = 1, notice = true, broadcast = true, hundred = 2300}, --新春时装(女) 
						{itemid = 2155, prob = 1688, count = 1, notice = true, broadcast = true, hundred = 1888}, --棒棒糖
						{itemid = 2305, prob = 1687, count = 1, notice = true, broadcast = true, hundred = 1887}, --玫瑰花 
						{itemid = 2302, prob = 1686, count = 1, notice = true, broadcast = true, hundred = 1886}, --反璞归真
						{itemid = 2203, prob = 1388, count = 1, notice = true, broadcast = true, hundred = 1688},--神器碎片
						{itemid = 2204, prob = 1388, count = 1, notice = true, broadcast = true, hundred = 1688},--神甲碎片

						{itemid = 2262, prob = 1075, count = 1, notice = true, hundred = 6375}, --铁血面甲
						{itemid = 2263, prob = 1076, count = 1, notice = true, hundred = 6376}, --铁血吊坠
						{itemid = 2261, prob = 1078, count = 1, notice = true, hundred = 6378}, --铁血护膝
						{itemid = 2260, prob = 1088, count = 1, notice = true, hundred = 6388}, --铁血护肩

						{itemid = 1157, prob = 1288, count = 1, notice = true, hundred = 1288}, --2转首饰 
						{itemid = 1215, prob = 1278, count = 1, notice = true, hundred = 1278}, --2转首饰 
						{itemid = 1273, prob = 1268, count = 1, notice = true, hundred = 1268}, --2转首饰 
						{itemid = 1331, prob = 1258, count = 1, notice = true, hundred = 1258}, --2转首饰 
						{itemid = 1389, prob = 1248, count = 1, notice = true, hundred = 1248}, --2转首饰 
						{itemid = 1447, prob = 1238, count = 1, notice = true, hundred = 1238}, --2转首饰 

						{itemid = 1234, prob = 1278, count = 1, notice = true, hundred = 1278}, --2转首饰 
						{itemid = 1292, prob = 1268, count = 1, notice = true, hundred = 1268}, --2转首饰 
						{itemid = 1350, prob = 1258, count = 1, notice = true, hundred = 1258}, --2转首饰 
						{itemid = 1408, prob = 1248, count = 1, notice = true, hundred = 1248}, --2转首饰 
						{itemid = 1466, prob = 1238, count = 1, notice = true, hundred = 1238}, --2转首饰 

						{itemid = 1195, prob = 1288, count = 1, notice = true, hundred = 1288}, --2转首饰 
						{itemid = 1253, prob = 1278, count = 1, notice = true, hundred = 1278}, --2转首饰 
						{itemid = 1311, prob = 1268, count = 1, notice = true, hundred = 1268}, --2转首饰 
						{itemid = 1369, prob = 1258, count = 1, notice = true, hundred = 1258}, --2转首饰 
						{itemid = 1427, prob = 1248, count = 1, notice = true, hundred = 1248}, --2转首饰 
						{itemid = 1485, prob = 1238, count = 1, notice = true, hundred = 1238}, --2转首饰 

						{itemid = 1157, prob = 1288, count = 1, notice = true, hundred = 1288}, --2转首饰 
						{itemid = 1215, prob = 1278, count = 1, notice = true, hundred = 1278}, --2转首饰 
						{itemid = 1273, prob = 1268, count = 1, notice = true, hundred = 1268}, --2转首饰 
						{itemid = 1331, prob = 1258, count = 1, notice = true, hundred = 1258}, --2转首饰 
						{itemid = 1389, prob = 1248, count = 1, notice = true, hundred = 1248}, --2转首饰 
						{itemid = 1447, prob = 1238, count = 1, notice = true, hundred = 1238}, --2转首饰 

						{itemid = 1234, prob = 1278, count = 1, notice = true, hundred = 1278}, --2转首饰 
						{itemid = 1292, prob = 1268, count = 1, notice = true, hundred = 1268}, --2转首饰 
						{itemid = 1350, prob = 1258, count = 1, notice = true, hundred = 1258}, --2转首饰 
						{itemid = 1408, prob = 1248, count = 1, notice = true, hundred = 1248}, --2转首饰 
						{itemid = 1466, prob = 1238, count = 1, notice = true, hundred = 1238}, --2转首饰 

						{itemid = 1195, prob = 1288, count = 1, notice = true, hundred = 1288}, --2转首饰 
						{itemid = 1253, prob = 1278, count = 1, notice = true, hundred = 1278}, --2转首饰 
						{itemid = 1311, prob = 1268, count = 1, notice = true, hundred = 1268}, --2转首饰 
						{itemid = 1369, prob = 1258, count = 1, notice = true, hundred = 1258}, --2转首饰 
						{itemid = 1427, prob = 1248, count = 1, notice = true, hundred = 1248}, --2转首饰 
						{itemid = 1485, prob = 1238, count = 1, notice = true, hundred = 1238}, --2转首饰 

						{itemid = 980 , prob = 988, count = 1, notice = true, hundred = 988}, --伏虎令剑    
						{itemid = 1047, prob = 990, count = 1, notice = true, hundred = 990}, --伏虎战甲(男)
						{itemid = 1048, prob = 980, count = 1, notice = true, hundred = 980}, --伏虎战甲(女)
						{itemid = 999 , prob = 988, count = 1, notice = true, hundred = 988}, --伏虎令剑    
						{itemid = 1085, prob = 990, count = 1, notice = true, hundred = 990}, --伏虎战甲(男)
						{itemid = 1086, prob = 980, count = 1, notice = true, hundred = 980}, --伏虎战甲(女)
						{itemid = 1018, prob = 988, count = 1, notice = true, hundred = 988}, --伏虎令剑    
						{itemid = 1123, prob = 990, count = 1, notice = true, hundred = 990}, --伏虎战甲(男)
						{itemid = 1124, prob = 980, count = 1, notice = true, hundred = 980}, --伏虎战甲(女)

						{itemid = 2210, prob = 898, count = 1, notice = true, hundred = 898}, --盾牌碎片(大)    
						{itemid = 2214, prob = 878, count = 1, notice = true, hundred = 878}, --宝石碎片(大)    
						{itemid = 2218, prob = 868, count = 1, notice = true, hundred = 868}, --魂珠碎片(大)    
						{itemid = 565 , prob = 888, count = 1, notice = true, hundred = 888}, --高级转生丹      
						{itemid = 145 , prob = 898, count = 1, notice = true, hundred = 898}, --高级成就令牌    
						{itemid = 161 , prob = 878, count = 1, notice = true, hundred = 878}, --高级灵力丹      
						{itemid = 674 , prob = 868, count = 1, notice = true, hundred = 868}, --99朵玫瑰花      
						{itemid = 849 , prob = 858, count = 1, notice = true, hundred = 858}, --五倍经验(2小时) 
						{itemid = 2111, prob = 818, count = 1, notice = true, hundred = 818}, --二级暴击宝石    
						{itemid = 160 , prob = 588, count = 1, notice = true, hundred = 588},  --灵力丹(大)      
						{itemid = 527 , prob = 886, count = 1, notice = true, hundred = 886},  --特戒碎片        
						{itemid = 2226, prob = 885, count = 1, notice = true, hundred = 885}, --护符碎片(大)  

						{itemid = 1156, prob = 588, count = 1, notice = true, hundred = 588}, --1转首饰 
						{itemid = 1214, prob = 578, count = 1, notice = true, hundred = 578}, --1转首饰 
						{itemid = 1272, prob = 568, count = 1, notice = true, hundred = 568}, --1转首饰 
						{itemid = 1330, prob = 558, count = 1, notice = true, hundred = 558}, --1转首饰 
						{itemid = 1388, prob = 548, count = 1, notice = true, hundred = 548}, --1转首饰 
						{itemid = 1446, prob = 538, count = 1, notice = true, hundred = 538}, --1转首饰 

						{itemid = 1175, prob = 586, count = 1, notice = true, hundred = 586}, --1转首饰 
						{itemid = 1233, prob = 576, count = 1, notice = true, hundred = 576}, --1转首饰 
						{itemid = 1291, prob = 566, count = 1, notice = true, hundred = 566}, --1转首饰 
						{itemid = 1349, prob = 556, count = 1, notice = true, hundred = 556}, --1转首饰 
						{itemid = 1407, prob = 546, count = 1, notice = true, hundred = 546}, --1转首饰 
						{itemid = 1465, prob = 536, count = 1, notice = true, hundred = 536}, --1转首饰

						{itemid = 1194, prob = 585, count = 1, notice = true, hundred = 585}, --1转首饰 
						{itemid = 1252, prob = 575, count = 1, notice = true, hundred = 575}, --1转首饰 
						{itemid = 1310, prob = 565, count = 1, notice = true, hundred = 565}, --1转首饰 
						{itemid = 1368, prob = 555, count = 1, notice = true, hundred = 555}, --1转首饰 
						{itemid = 1426, prob = 545, count = 1, notice = true, hundred = 545}, --1转首饰 
						{itemid = 1484, prob = 535, count = 1, notice = true, hundred = 535}, --1转首饰 

						{itemid = 1156, prob = 588, count = 1, notice = true, hundred = 588}, --1转首饰 
						{itemid = 1214, prob = 578, count = 1, notice = true, hundred = 578}, --1转首饰 
						{itemid = 1272, prob = 568, count = 1, notice = true, hundred = 568}, --1转首饰 
						{itemid = 1330, prob = 558, count = 1, notice = true, hundred = 558}, --1转首饰 
						{itemid = 1388, prob = 548, count = 1, notice = true, hundred = 548}, --1转首饰 
						{itemid = 1446, prob = 538, count = 1, notice = true, hundred = 538}, --1转首饰 

						{itemid = 1175, prob = 586, count = 1, notice = true, hundred = 586}, --1转首饰 
						{itemid = 1233, prob = 576, count = 1, notice = true, hundred = 576}, --1转首饰 
						{itemid = 1291, prob = 566, count = 1, notice = true, hundred = 566}, --1转首饰 
						{itemid = 1349, prob = 556, count = 1, notice = true, hundred = 556}, --1转首饰 
						{itemid = 1407, prob = 546, count = 1, notice = true, hundred = 546}, --1转首饰 
						{itemid = 1465, prob = 536, count = 1, notice = true, hundred = 536}, --1转首饰

						{itemid = 1194, prob = 585, count = 1, notice = true, hundred = 585}, --1转首饰 
						{itemid = 1252, prob = 575, count = 1, notice = true, hundred = 575}, --1转首饰 
						{itemid = 1310, prob = 565, count = 1, notice = true, hundred = 565}, --1转首饰 
						{itemid = 1368, prob = 555, count = 1, notice = true, hundred = 555}, --1转首饰 
						{itemid = 1426, prob = 545, count = 1, notice = true, hundred = 545}, --1转首饰 
						{itemid = 1484, prob = 535, count = 1, notice = true, hundred = 535}, --1转首饰 

						{itemid = 979 , prob = 168, count = 1, notice = false, hundred = 168}, --修罗之刃      
						{itemid = 1045, prob = 165, count = 1, notice = false, hundred = 165}, --修罗战甲(男)  
						{itemid = 1046, prob = 162, count = 1, notice = false, hundred = 162}, --修罗战甲(女)  
						{itemid = 998 , prob = 167, count = 1, notice = false, hundred = 167}, --修罗之刃      
						{itemid = 1083, prob = 164, count = 1, notice = false, hundred = 164}, --修罗战甲(男)  
						{itemid = 1084, prob = 161, count = 1, notice = false, hundred = 161}, --修罗战甲(女)  
						{itemid = 1017, prob = 166, count = 1, notice = false, hundred = 166}, --修罗之刃      
						{itemid = 1121, prob = 163, count = 1, notice = false, hundred = 163}, --修罗战甲(男)  
						{itemid = 1122, prob = 160, count = 1, notice = false, hundred = 160}, --修罗战甲(女)  

						{itemid = 2123, prob = 2638, count = 1, notice = false, hundred = 238}, --子鼠玉佩  
						{itemid = 2124, prob = 2638, count = 1, notice = false, hundred = 237}, --丑牛玉佩  
						{itemid = 2125, prob = 2638, count = 1, notice = false, hundred = 236}, --寅虎玉佩  
						{itemid = 2126, prob = 2638, count = 1, notice = false, hundred = 235}, --卯兔玉佩  
						{itemid = 2127, prob = 2638, count = 1, notice = false, hundred = 234}, --辰龙玉佩  
						{itemid = 2128, prob = 2638, count = 1, notice = false, hundred = 233}, --巳蛇玉佩 
						{itemid = 2129, prob = 2638, count = 1, notice = false, hundred = 238}, --午马玉佩  
						{itemid = 2130, prob = 2638, count = 1, notice = false, hundred = 237}, --未羊玉佩  
						{itemid = 2131, prob = 2638, count = 1, notice = false, hundred = 236}, --申猴玉佩  
						{itemid = 2132, prob = 2638, count = 1, notice = false, hundred = 235}, --酉鸡玉佩  
						{itemid = 2133, prob = 2638, count = 1, notice = false, hundred = 234}, --戌狗玉佩  
						{itemid = 2134, prob = 2638, count = 1, notice = false, hundred = 233}, --亥猪玉佩 

						{itemid = 1155, prob = 128, count = 1, notice = false, hundred = 128}, --90级首饰  
						{itemid = 1213, prob = 127, count = 1, notice = false, hundred = 127}, --90级首饰  
						{itemid = 1271, prob = 126, count = 1, notice = false, hundred = 126}, --90级首饰  
						{itemid = 1329, prob = 125, count = 1, notice = false, hundred = 125}, --90级首饰  
						{itemid = 1387, prob = 124, count = 1, notice = false, hundred = 124}, --90级首饰  
						{itemid = 1445, prob = 123, count = 1, notice = false, hundred = 123}, --90级首饰  

						{itemid = 1174, prob = 128, count = 1, notice = false, hundred = 128}, --90级首饰  
						{itemid = 1232, prob = 127, count = 1, notice = false, hundred = 127}, --90级首饰  
						{itemid = 1290, prob = 126, count = 1, notice = false, hundred = 126}, --90级首饰  
						{itemid = 1348, prob = 125, count = 1, notice = false, hundred = 125}, --90级首饰  
						{itemid = 1406, prob = 124, count = 1, notice = false, hundred = 124}, --90级首饰  
						{itemid = 1464, prob = 123, count = 1, notice = false, hundred = 123}, --90级首饰 

						{itemid = 1193, prob = 128, count = 1, notice = false, hundred = 128}, --90级首饰  
						{itemid = 1251, prob = 127, count = 1, notice = false, hundred = 127}, --90级首饰  
						{itemid = 1309, prob = 126, count = 1, notice = false, hundred = 126}, --90级首饰  
						{itemid = 1367, prob = 125, count = 1, notice = false, hundred = 125}, --90级首饰  
						{itemid = 1425, prob = 124, count = 1, notice = false, hundred = 124}, --90级首饰  
						{itemid = 1483, prob = 123, count = 1, notice = false, hundred = 123}, --90级首饰 

						{itemid = 2197, prob = 18, count = 1, notice = false, hundred = 18},    --典
						{itemid = 2196, prob = 17, count = 1, notice = false, hundred = 17},    --庆
						{itemid = 2195, prob = 16, count = 1, notice = false, hundred = 16},    --服
						{itemid = 2193, prob = 15, count = 1, notice = false, hundred = 15},    --千
						{itemid = 2886, prob = 16, count = 1, notice = false, hundred = 14}, --传世宝钻 
						{itemid = 841, prob = 30, count = 1, notice = false, hundred = 10}, --圣兽灵石 
						{itemid = 818 , prob = 4 , count = 1, notice = false, hundred = 1 }, --英雄经验丹  
						{itemid = 513 , prob = 1 , count = 1, notice = false, hundred = 1 }, --经验丹(大)   
					},
				},
			},
			--道士
			{
				{
					money = 3000,		--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 5,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1159, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1217, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1275, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1333, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1391, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1449, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1178, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1236, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1294, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1352, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1410, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1468, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1197, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1255, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1313, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1371, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1429, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1487, prob = 18, count = 1, notice = true, hundred = 18},
					},
				},

				{
					money = 10000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 8,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1159, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1217, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1275, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1333, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1391, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1449, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1178, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1236, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1294, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1352, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1410, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1468, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1197, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1255, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1313, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1371, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1429, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1487, prob = 18, count = 1, notice = true, hundred = 18},
					},
				},
				{
					money = 30000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 12,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1198, prob = 11, count = 1, notice = true, broadcast = true, hundred = 11}, --8转首饰
						{itemid = 1256, prob = 9 , count = 1, notice = true, broadcast = true, hundred = 9 }, --8转首饰
						{itemid = 1314, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1372, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1430, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1488, prob = 7 , count = 1, notice = true, broadcast = true, hundred = 7 }, --8转首饰
					},
				},
				{
					money = 60000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1159, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1217, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1275, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1333, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1391, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1449, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1178, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1236, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1294, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1352, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1410, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1468, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1197, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1255, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1313, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1371, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1429, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1487, prob = 18, count = 1, notice = true, hundred = 18},
					},
				},
				{
					money = 90000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 15,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1198, prob = 11, count = 1, notice = true, broadcast = true, hundred = 11}, --8转首饰
						{itemid = 1256, prob = 9 , count = 1, notice = true, broadcast = true, hundred = 9 }, --8转首饰
						{itemid = 1314, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1372, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1430, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1488, prob = 7 , count = 1, notice = true, broadcast = true, hundred = 7 }, --8转首饰
					},
				},
				{
					money = 120000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1159, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1217, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1275, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1333, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1391, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1449, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1178, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1236, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1294, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1352, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1410, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1468, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1197, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1255, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1313, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1371, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1429, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1487, prob = 18, count = 1, notice = true, hundred = 18},
					},
				},
				{
					money = 150000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 15,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1198, prob = 11, count = 1, notice = true, broadcast = true, hundred = 11}, --8转首饰
						{itemid = 1256, prob = 9 , count = 1, notice = true, broadcast = true, hundred = 9 }, --8转首饰
						{itemid = 1314, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1372, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1430, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1488, prob = 7 , count = 1, notice = true, broadcast = true, hundred = 7 }, --8转首饰
					},
				},
				{
					money = 180000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 12,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1199, prob = 11, count = 1, notice = true, broadcast = true, hundred = 11}, --8转首饰
						{itemid = 1257, prob = 9 , count = 1, notice = true, broadcast = true, hundred = 9 }, --8转首饰
						{itemid = 1315, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1373, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1431, prob = 8 , count = 1, notice = true, broadcast = true, hundred = 8 }, --8转首饰
						{itemid = 1489, prob = 7 , count = 1, notice = true, broadcast = true, hundred = 7 }, --8转首饰
					},
				},
				{
					count = 200,	--寻宝次数大于此值才会进入
					maxcount = 250,	--寻宝次数等于此值必定进入
					limit = 1,		--限制进入次数,-1为不限制
					prob = 5,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 2201, prob = 26, count = 1, notice = true, hundred = 26},  --欢
						{itemid = 2200, prob = 10, count = 1, notice = true, hundred = 10},  --狂
						{itemid = 2199, prob = 3 , count = 1, notice = true, hundred = 3},   --民
						{itemid = 2198, prob = 1 , count = 1, notice = true, hundred = 1},   --全
					},
				},
				{
					money = 0,	--寻宝花费数大于此值才会进入此表
					limit = -1,		--限制进入次数,-1为不限制
					prob = 1,

					--道具列表
					items = 
					{
						--id,概率,数量,广播

						{itemid = 2276, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 25888}, --铁血武器        
						{itemid = 2277, prob = 25668, count = 1, notice = true, broadcast = true, hundred = 25668}, --铁血衣服(男)
						{itemid = 2284, prob = 25588, count = 1, notice = true, broadcast = true, hundred = 25588}, --铁血衣服(女)

						{itemid = 2344, prob = 15288, count = 1, notice = true, hundred = 6888}, --傲视狂舞斩(英雄)    
						{itemid = 2354, prob = 15188, count = 1, notice = true, hundred = 6888}, --乾坤降魔杖(英雄)    
						{itemid = 2364, prob = 15088, count = 1, notice = true, hundred = 6888}, --紫金龙皇剑(英雄)    
						{itemid = 2380, prob = 15088, count = 1, notice = true, hundred = 6888}, --傲视狂舞甲(男)(英雄)
						{itemid = 2381, prob = 15088, count = 1, notice = true, hundred = 6888}, --傲视狂舞甲(女)(英雄)
						{itemid = 2400, prob = 15088, count = 1, notice = true, hundred = 6888}, --乾坤降魔衣(男)(英雄)
						{itemid = 2401, prob = 15088, count = 1, notice = true, hundred = 6888}, --乾坤降魔衣(女)(英雄)
						{itemid = 2420, prob = 15088, count = 1, notice = true, hundred = 6888}, --紫金龙皇甲(男)(英雄)
						{itemid = 2421, prob = 15088, count = 1, notice = true, hundred = 6888}, --紫金龙皇甲(女)(英雄)

						{itemid = 2345, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙战剑(英雄)      
						{itemid = 2355, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙魔杖(英雄)    
						{itemid = 2365, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙宝剑(英雄)    
						{itemid = 2382, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙战甲(男)(英雄)
						{itemid = 2383, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙战甲(女)(英雄)
						{itemid = 2402, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙魔衣(男)(英雄)
						{itemid = 2403, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙魔衣(女)(英雄)
						{itemid = 2422, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙道袍(男)(英雄)
						{itemid = 2423, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 19888}, --神龙道袍(女)(英雄)

						{itemid = 2346, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王战剑(英雄)     
						{itemid = 2356, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王魔杖(英雄)    
						{itemid = 2366, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王道剑(英雄)    
						{itemid = 2384, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王战甲(男)(英雄)
						{itemid = 2385, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王战甲(女)(英雄)
						{itemid = 2404, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王魔衣(男)(英雄)
						{itemid = 2405, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王魔衣(女)(英雄)
						{itemid = 2424, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王道袍(男)(英雄)
						{itemid = 2425, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 19888}, --帝王道袍(女)(英雄)

						{itemid = 1317, prob = 41588, count = 1, notice = true, broadcast = true, hundred = 32888}, --至尊诛仙道镯    
						{itemid = 1375, prob = 41888, count = 1, notice = true, broadcast = true, hundred = 32888}, --至尊诛仙道戒
						{itemid = 1201, prob = 42585, count = 1, notice = true, broadcast = true, hundred = 32585}, --至尊诛仙道盔
						{itemid = 1259, prob = 42688, count = 1, notice = true, broadcast = true, hundred = 32888}, --至尊诛仙道链    
						{itemid = 1433, prob = 42988, count = 1, notice = true, broadcast = true, hundred = 32888}, --至尊诛仙道带
						{itemid = 1491, prob = 42885, count = 1, notice = true, broadcast = true, hundred = 32585}, --至尊诛仙道靴

						{itemid = 765, prob = 36888, count = 1, notice = true, broadcast = true, hundred = 59888}, --神之斩    
						{itemid = 766, prob = 35888, count = 1, notice = true, broadcast = true, hundred = 58888}, --神之甲
						{itemid = 767, prob = 28585, count = 1, notice = true, broadcast = true, hundred = 58585}, --神之盔
						{itemid = 768, prob = 28881, count = 1, notice = true, broadcast = true, hundred = 59888}, --神之链    
						{itemid = 769, prob = 28882, count = 1, notice = true, broadcast = true, hundred = 58888}, --神之镯
						{itemid = 770, prob = 28585, count = 1, notice = true, broadcast = true, hundred = 58585}, --神之戒
						{itemid = 771, prob = 28883, count = 1, notice = true, broadcast = true, hundred = 59888}, --神之带    
						{itemid = 772, prob = 28988, count = 1, notice = true, broadcast = true, hundred = 59888}, --神之靴

						{itemid = 1025, prob = 39888, count = 1, notice = true, broadcast = true, hundred = 59888}, --至尊诛仙扇        
						{itemid = 1137, prob = 35888, count = 1, notice = true, broadcast = true, hundred = 58888}, --至尊诛仙道袍(男)
						{itemid = 1138, prob = 35585, count = 1, notice = true, broadcast = true, hundred = 58585}, --至尊诛仙道袍(女)

						{itemid = 1024, prob = 32888, count = 1, notice = true, broadcast = true, hundred = 59888}, --诛仙之扇        
						{itemid = 1135, prob = 31888, count = 1, notice = true, broadcast = true, hundred = 58888}, --诛仙道袍(男)
						{itemid = 1136, prob = 31585, count = 1, notice = true, broadcast = true, hundred = 58585}, --诛仙道袍(女)

						{itemid = 1022, prob = 89888, count = 1, notice = true, broadcast = true, hundred = 59888}, --8转武器    
						{itemid = 1131, prob = 88888, count = 1, notice = true, broadcast = true, hundred = 58888}, --8转衣服(男)
						{itemid = 1132, prob = 88585, count = 1, notice = true, broadcast = true, hundred = 58585}, --8转衣服(女)

						{itemid = 1021, prob = 32886, count = 1, notice = true, broadcast = true, hundred = 32886}, --傲视狂舞斩    
						{itemid = 1129, prob = 32883, count = 1, notice = true, broadcast = true, hundred = 32883}, --傲视狂舞甲(男)
						{itemid = 1130, prob = 32586, count = 1, notice = true, broadcast = true, hundred = 32586}, --傲视狂舞甲(女)

						{itemid = 1316, prob = 21588, count = 1, notice = true, broadcast = true, hundred = 32888}, --诛仙道镯    
						{itemid = 1374, prob = 21888, count = 1, notice = true, broadcast = true, hundred = 32888}, --诛仙道戒
						{itemid = 1200, prob = 22585, count = 1, notice = true, broadcast = true, hundred = 32585}, --诛仙道盔
						{itemid = 1258, prob = 22688, count = 1, notice = true, broadcast = true, hundred = 32888}, --诛仙道链    
						{itemid = 1432, prob = 22988, count = 1, notice = true, broadcast = true, hundred = 32888}, --诛仙道带
						{itemid = 1490, prob = 22885, count = 1, notice = true, broadcast = true, hundred = 32585}, --诛仙道靴

						{itemid = 1199, prob = 42888, count = 1, notice = true, broadcast = true, hundred = 32888}, --10转首饰    
						{itemid = 1257, prob = 42888, count = 1, notice = true, broadcast = true, hundred = 32888}, --10转首饰
						{itemid = 1315, prob = 42585, count = 1, notice = true, broadcast = true, hundred = 32585}, --10转首饰
						{itemid = 1373, prob = 42888, count = 1, notice = true, broadcast = true, hundred = 32888}, --10转首饰    
						{itemid = 1431, prob = 42888, count = 1, notice = true, broadcast = true, hundred = 32888}, --10转首饰
						{itemid = 1489, prob = 42585, count = 1, notice = true, broadcast = true, hundred = 32585}, --10转首饰

						{itemid = 1198, prob = 22888, count = 1, notice = true, broadcast = true, hundred = 22888}, --8转首饰
						{itemid = 1256, prob = 22888, count = 1, notice = true, broadcast = true, hundred = 22888}, --8转首饰
						{itemid = 1314, prob = 22585, count = 1, notice = true, broadcast = true, hundred = 22585}, --8转首饰
						{itemid = 1372, prob = 22888, count = 1, notice = true, broadcast = true, hundred = 22888}, --8转首饰
						{itemid = 1430, prob = 22888, count = 1, notice = true, broadcast = true, hundred = 22888}, --8转首饰
						{itemid = 1488, prob = 22585, count = 1, notice = true, broadcast = true, hundred = 22585}, --8转首饰

						{itemid = 2291, prob = 26968, count = 1, notice = true, broadcast = true, hundred = 2359}, --圣·新年达人(男) 
						{itemid = 2292, prob = 26868, count = 1, notice = true, broadcast = true, hundred = 2349}, --圣·新年达人(女) 
						{itemid = 2310, prob = 26768, count = 1, notice = true, broadcast = true, hundred = 2339}, --圣·情侣时装(男) 
						{itemid = 2311, prob = 26668, count = 1, notice = true, broadcast = true, hundred = 2329}, --圣·情侣时装(女) 
						{itemid = 2297, prob = 26568, count = 1, notice = true, broadcast = true, hundred = 2319}, --圣·返璞归真(男) 
						{itemid = 2300, prob = 26468, count = 1, notice = true, broadcast = true, hundred = 2309}, --圣·返璞归真(女) 
						{itemid = 2327, prob = 26368, count = 1, notice = true, broadcast = true, hundred = 2305}, --圣·新春时装(男)
						{itemid = 2328, prob = 26268, count = 1, notice = true, broadcast = true, hundred = 2300}, --圣·新春时装(女) 
						{itemid = 2290, prob = 26168, count = 1, notice = true, broadcast = true, hundred = 1888}, --圣·棒棒糖
						{itemid = 2306, prob = 26068, count = 1, notice = true, broadcast = true, hundred = 1887}, --圣·玫瑰花 
						{itemid = 2303, prob = 26066, count = 1, notice = true, broadcast = true, hundred = 1886}, --圣·反璞归真

						{itemid = 2887, prob = 12888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世之刃  
						{itemid = 2888, prob = 11888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世之甲
						{itemid = 2889, prob = 5888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世头盔
						{itemid = 2890, prob = 5888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世项链
						{itemid = 2891, prob = 5888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世手镯
						{itemid = 2892, prob = 5888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世戒指
						{itemid = 2893, prob = 5888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世靴子
						{itemid = 2894, prob = 5888, count = 1, notice = true, broadcast = true, hundred = 19888}, --传世腰带

						{itemid = 1159, prob = 6568, count = 1, notice = true, hundred = 15568}, --6转首饰
						{itemid = 1217, prob = 6567, count = 1, notice = true, hundred = 15567}, --6转首饰
						{itemid = 1275, prob = 6566, count = 1, notice = true, hundred = 15566}, --6转首饰
						{itemid = 1333, prob = 6565, count = 1, notice = true, hundred = 15565}, --6转首饰
						{itemid = 1391, prob = 6564, count = 1, notice = true, hundred = 15564}, --6转首饰
						{itemid = 1449, prob = 6563, count = 1, notice = true, hundred = 15563}, --6转首饰
								        
						{itemid = 1178, prob = 6558, count = 1, notice = true, hundred = 15558}, --6转首饰
						{itemid = 1236, prob = 6557, count = 1, notice = true, hundred = 15557}, --6转首饰
						{itemid = 1294, prob = 6556, count = 1, notice = true, hundred = 15556}, --6转首饰
						{itemid = 1352, prob = 6555, count = 1, notice = true, hundred = 15555}, --6转首饰
						{itemid = 1410, prob = 6553, count = 1, notice = true, hundred = 15553}, --6转首饰
						{itemid = 1468, prob = 6552, count = 1, notice = true, hundred = 15552}, --6转首饰
								        
						{itemid = 1197, prob = 6538, count = 1, notice = true, hundred = 15538}, --6转首饰
						{itemid = 1255, prob = 6537, count = 1, notice = true, hundred = 15537}, --6转首饰
						{itemid = 1313, prob = 6536, count = 1, notice = true, hundred = 15536}, --6转首饰
						{itemid = 1371, prob = 6535, count = 1, notice = true, hundred = 15535}, --6转首饰
						{itemid = 1429, prob = 6533, count = 1, notice = true, hundred = 15533}, --6转首饰
						{itemid = 1487, prob = 6532, count = 1, notice = true, hundred = 15532}, --6转首饰

						{itemid = 982 , prob = 13588, count = 1, notice = true, hundred = 13588}, --天武神剑    
						{itemid = 1051, prob = 12888, count = 1, notice = true, hundred = 12888}, --天武神甲(男)
						{itemid = 1052, prob = 12878, count = 1, notice = true, hundred = 12878}, --天武神甲(女)
						{itemid = 1001, prob = 12588, count = 1, notice = true, hundred = 12588}, --天武神剑    
						{itemid = 1089, prob = 12888, count = 1, notice = true, hundred = 12888}, --天武神甲(男)
						{itemid = 1090, prob = 12878, count = 1, notice = true, hundred = 12878}, --天武神甲(女)
						{itemid = 1020, prob = 12588, count = 1, notice = true, hundred = 12588}, --天武神剑    
						{itemid = 1127, prob = 12888, count = 1, notice = true, hundred = 12888}, --天武神甲(男)
						{itemid = 1128, prob = 12878, count = 1, notice = true, hundred = 12878}, --天武神甲(女)

						{itemid = 2209, prob = 16888, count = 1, notice = true, hundred = 16888}, --盾牌碎片(特)
						{itemid = 2213, prob = 16887, count = 1, notice = true, hundred = 16887}, --宝石碎片(特)
						{itemid = 2217, prob = 16886, count = 1, notice = true, hundred = 16886}, --魂珠碎片(特)
						{itemid = 566 , prob = 16885, count = 1, notice = true, hundred = 16885}, --超级转生丹  
						{itemid = 163 , prob = 16884, count = 1, notice = true, hundred = 16884}, --超级成就令牌
						{itemid = 162 , prob = 16883, count = 1, notice = true, hundred = 16883}, --超级灵力丹  
						{itemid = 675 , prob = 16882, count = 1, notice = true, hundred = 16882}, --999朵玫瑰花 
						{itemid = 528 , prob = 16881, count = 1, notice = true, hundred = 16881}, --特戒碎片包  
						{itemid = 2225, prob = 16880, count = 1, notice = true, hundred = 16880}, --护符碎片(特)

						{itemid = 3007, prob = 3207, count = 1, notice = true, broadcast = true, hundred = 3839}, --龙行天下 
						{itemid = 3008, prob = 3208, count = 1, notice = true, broadcast = true, hundred = 3829}, --如影随形 
						{itemid = 3009, prob = 3209, count = 1, notice = true, broadcast = true, hundred = 3819}, --双龙出海 
						{itemid = 3010, prob = 3210, count = 1, notice = true, broadcast = true, hundred = 3809}, --丘比特   
						{itemid = 3011, prob = 3211, count = 1, notice = true, broadcast = true, hundred = 3805}, --神龙开道 
						{itemid = 3012, prob = 3212, count = 1, notice = true, broadcast = true, hundred = 3800}, --冰火之歌 
						{itemid = 3013, prob = 3213, count = 1, notice = true, broadcast = true, hundred = 3088}, --弥勒笑佛
						{itemid = 3014, prob = 3214, count = 1, notice = true, broadcast = true, hundred = 3087}, --熊二快跑

						{itemid = 1158, prob = 3288, count = 1, notice = true, hundred = 8888},  --4转首饰
						{itemid = 1216, prob = 3278, count = 1, notice = true, hundred = 8878},  --4转首饰
						{itemid = 1274, prob = 3268, count = 1, notice = true, hundred = 8868},  --4转首饰
						{itemid = 1332, prob = 3258, count = 1, notice = true, hundred = 8858},  --4转首饰
						{itemid = 1390, prob = 3248, count = 1, notice = true, hundred = 8848},  --4转首饰
						{itemid = 1448, prob = 3238, count = 1, notice = true, hundred = 8838},  --4转首饰
								        
						{itemid = 1177, prob = 3288, count = 1, notice = true, hundred = 8888}, --4转首饰
						{itemid = 1235, prob = 3278, count = 1, notice = true, hundred = 8878}, --4转首饰
						{itemid = 1293, prob = 3268, count = 1, notice = true, hundred = 8868}, --4转首饰
						{itemid = 1351, prob = 3258, count = 1, notice = true, hundred = 8858}, --4转首饰
						{itemid = 1409, prob = 3248, count = 1, notice = true, hundred = 8848}, --4转首饰
						{itemid = 1467, prob = 3238, count = 1, notice = true, hundred = 8838}, --4转首饰
								        
						{itemid = 1196, prob = 3288, count = 1, notice = true, hundred = 8888}, --4转首饰
						{itemid = 1254, prob = 3278, count = 1, notice = true, hundred = 8878}, --4转首饰
						{itemid = 1312, prob = 3268, count = 1, notice = true, hundred = 8868}, --4转首饰
						{itemid = 1370, prob = 3258, count = 1, notice = true, hundred = 8858}, --4转首饰
						{itemid = 1428, prob = 3248, count = 1, notice = true, hundred = 8848}, --4转首饰
						{itemid = 1486, prob = 3238, count = 1, notice = true, hundred = 8838}, --4转首饰
								        
						{itemid = 1158, prob = 3288, count = 1, notice = true, hundred = 8888},  --4转首饰
						{itemid = 1216, prob = 3278, count = 1, notice = true, hundred = 8878},  --4转首饰
						{itemid = 1274, prob = 3268, count = 1, notice = true, hundred = 8868},  --4转首饰
						{itemid = 1332, prob = 3258, count = 1, notice = true, hundred = 8858},  --4转首饰
						{itemid = 1390, prob = 3248, count = 1, notice = true, hundred = 8848},  --4转首饰
						{itemid = 1448, prob = 3238, count = 1, notice = true, hundred = 8838},  --4转首饰
								        
						{itemid = 1177, prob = 3288, count = 1, notice = true, hundred = 8888}, --4转首饰
						{itemid = 1235, prob = 3278, count = 1, notice = true, hundred = 8878}, --4转首饰
						{itemid = 1293, prob = 3268, count = 1, notice = true, hundred = 8868}, --4转首饰
						{itemid = 1351, prob = 3258, count = 1, notice = true, hundred = 8858}, --4转首饰
						{itemid = 1409, prob = 3248, count = 1, notice = true, hundred = 8848}, --4转首饰
						{itemid = 1467, prob = 3238, count = 1, notice = true, hundred = 8838}, --4转首饰
								        
						{itemid = 1196, prob = 3288, count = 1, notice = true, hundred = 8888}, --4转首饰
						{itemid = 1254, prob = 3278, count = 1, notice = true, hundred = 8878}, --4转首饰
						{itemid = 1312, prob = 3268, count = 1, notice = true, hundred = 8868}, --4转首饰
						{itemid = 1370, prob = 3258, count = 1, notice = true, hundred = 8858}, --4转首饰
						{itemid = 1428, prob = 3248, count = 1, notice = true, hundred = 8848}, --4转首饰
						{itemid = 1486, prob = 3238, count = 1, notice = true, hundred = 8838}, --4转首饰

						{itemid = 981 , prob = 2888, count = 1, notice = true, hundred = 2888}, --轩辕神剑    
						{itemid = 1049, prob = 2885, count = 1, notice = true, hundred = 2885}, --轩辕神甲(男)
						{itemid = 1050, prob = 2880, count = 1, notice = true, hundred = 2880}, --轩辕神甲(女)
						{itemid = 1000, prob = 2888, count = 1, notice = true, hundred = 2888}, --轩辕神剑    
						{itemid = 1087, prob = 2885, count = 1, notice = true, hundred = 2885}, --轩辕神甲(男)
						{itemid = 1088, prob = 2880, count = 1, notice = true, hundred = 2880}, --轩辕神甲(女)
						{itemid = 1019, prob = 2888, count = 1, notice = true, hundred = 2888}, --轩辕神剑    
						{itemid = 1125, prob = 2885, count = 1, notice = true, hundred = 2885}, --轩辕神甲(男)
						{itemid = 1126, prob = 2880, count = 1, notice = true, hundred = 2880}, --轩辕神甲(女)

						{itemid = 2635, prob = 9099, count = 1, notice = true, broadcast = true, hundred = 3289}, --青龙阵石 
						{itemid = 2636, prob = 9089, count = 1, notice = true, broadcast = true, hundred = 3289}, --白虎阵石 
						{itemid = 2637, prob = 9079, count = 1, notice = true, broadcast = true, hundred = 3279}, --朱雀阵石 
						{itemid = 2638, prob = 9069, count = 1, notice = true, broadcast = true, hundred = 3269}, --玄武阵石
	
						{itemid = 1940, prob = 988, count = 1, notice = true, hundred = 8888},	--五级羽毛
						{itemid = 1941, prob = 988, count = 1, notice = true, broadcast = true, hundred = 3289}, --六级羽毛 

						{itemid = 636 , prob = 2989, count = 1, notice = true, broadcast = true, hundred = 3289}, --马鞍 
						{itemid = 624 , prob = 2988, count = 1, notice = true, broadcast = true, hundred = 3289}, --蹄铁 
						{itemid = 628 , prob = 2987, count = 1, notice = true, broadcast = true, hundred = 3279}, --缰绳 
						{itemid = 632 , prob = 2986, count = 1, notice = true, broadcast = true, hundred = 3269}, --马镫

						{itemid = 640 , prob = 2889, count = 1, notice = true, broadcast = true, hundred = 3289}, --银光闪豹 
						{itemid = 641 , prob = 2879, count = 1, notice = true, broadcast = true, hundred = 3279}, --万圣战轮 
						{itemid = 642 , prob = 2869, count = 1, notice = true, broadcast = true, hundred = 3269}, --蒸朋怒鲨
						{itemid = 643 , prob = 2889, count = 1, notice = true, broadcast = true, hundred = 3289}, --百鸟朝凤 

						{itemid = 588 , prob = 3089, count = 1, notice = true, broadcast = true, hundred = 3289}, --关羽时装 
						{itemid = 592 , prob = 3079, count = 1, notice = true, broadcast = true, hundred = 3279}, --赵云时装 
						{itemid = 596 , prob = 3069, count = 1, notice = true, broadcast = true, hundred = 3269}, --吕布时装
						{itemid = 612 , prob = 3089, count = 1, notice = true, broadcast = true, hundred = 3289}, --大乔时装 
						{itemid = 616 , prob = 3079, count = 1, notice = true, broadcast = true, hundred = 3279}, --小乔时装 
						{itemid = 620 , prob = 3069, count = 1, notice = true, broadcast = true, hundred = 3269}, --貂蝉时装

						{itemid = 600 , prob = 2889, count = 1, notice = true, broadcast = true, hundred = 3289}, --青龙偃月刀 
						{itemid = 604 , prob = 2879, count = 1, notice = true, broadcast = true, hundred = 3279}, --百鸟朝凤枪 
						{itemid = 608 , prob = 2869, count = 1, notice = true, broadcast = true, hundred = 3269}, --方天画戟

						{itemid = 492 , prob = 3239, count = 1, notice = true, broadcast = true, hundred = 3839}, --返璞归真 
						{itemid = 493 , prob = 3229, count = 1, notice = true, broadcast = true, hundred = 3829}, --鸾凤和鸣 
						{itemid = 494 , prob = 3219, count = 1, notice = true, broadcast = true, hundred = 3819}, --双龙出海 
						{itemid = 495 , prob = 3209, count = 1, notice = true, broadcast = true, hundred = 3809}, --紫翼东升 

						{itemid = 341 , prob = 2839, count = 1, notice = true, broadcast = true, hundred = 3839}, --法老服饰(男) 
						{itemid = 342 , prob = 2829, count = 1, notice = true, broadcast = true, hundred = 3829}, --法老服饰(女) 
						{itemid = 350 , prob = 2819, count = 1, notice = true, broadcast = true, hundred = 3819}, --拳击战服(男) 
						{itemid = 351 , prob = 2809, count = 1, notice = true, broadcast = true, hundred = 3809}, --拳击战服(女) 
						{itemid = 2319, prob = 2805, count = 1, notice = true, broadcast = true, hundred = 3805}, --菊花一锦(男) 
						{itemid = 2320, prob = 2800, count = 1, notice = true, broadcast = true, hundred = 3800}, --菊花一锦(女) 
						{itemid = 2316, prob = 2788, count = 1, notice = true, broadcast = true, hundred = 3088}, --菊花
						{itemid = 338 , prob = 2787, count = 1, notice = true, broadcast = true, hundred = 3087}, --法老权杖 
						{itemid = 347 , prob = 2786, count = 1, notice = true, broadcast = true, hundred = 3086}, --拳击暴雷

						{itemid = 327, prob = 2588, count = 1, notice = true, broadcast = true, hundred = 2588}, --足迹
						{itemid = 328, prob = 2587, count = 1, notice = true, broadcast = true, hundred = 2587}, --足迹
						{itemid = 329, prob = 2586, count = 1, notice = true, broadcast = true, hundred = 2586}, --足迹
						{itemid = 330, prob = 2585, count = 1, notice = true, broadcast = true, hundred = 2585}, --足迹
						{itemid = 331, prob = 2584, count = 1, notice = true, broadcast = true, hundred = 2584}, --足迹
						{itemid = 332, prob = 2583, count = 1, notice = true, broadcast = true, hundred = 2583}, --足迹
						{itemid = 333, prob = 2582, count = 1, notice = true, broadcast = true, hundred = 2582}, --足迹
						{itemid = 334, prob = 2581, count = 1, notice = true, broadcast = true, hundred = 2581}, --足迹 
						{itemid = 335, prob = 2580, count = 1, notice = true, broadcast = true, hundred = 2580}, --足迹

						{itemid = 2156, prob = 2059, count = 1, notice = true, broadcast = true, hundred = 2359}, --新年达人(男) 
						{itemid = 2157, prob = 2049, count = 1, notice = true, broadcast = true, hundred = 2349}, --新年达人(女) 
						{itemid = 2308, prob = 2039, count = 1, notice = true, broadcast = true, hundred = 2339}, --情侣时装(男) 
						{itemid = 2309, prob = 2029, count = 1, notice = true, broadcast = true, hundred = 2329}, --情侣时装(女) 
						{itemid = 2296, prob = 2019, count = 1, notice = true, broadcast = true, hundred = 2319}, --返璞归真(男) 
						{itemid = 2299, prob = 2009, count = 1, notice = true, broadcast = true, hundred = 2309}, --返璞归真(女) 
						{itemid = 2325, prob = 2005, count = 1, notice = true, broadcast = true, hundred = 2305}, --新春时装(男) 
						{itemid = 2326, prob = 2000, count = 1, notice = true, broadcast = true, hundred = 2300}, --新春时装(女) 
						{itemid = 2155, prob = 1688, count = 1, notice = true, broadcast = true, hundred = 1888}, --棒棒糖
						{itemid = 2305, prob = 1687, count = 1, notice = true, broadcast = true, hundred = 1887}, --玫瑰花 
						{itemid = 2302, prob = 1686, count = 1, notice = true, broadcast = true, hundred = 1886}, --反璞归真
						{itemid = 2203, prob = 1388, count = 1, notice = true, broadcast = true, hundred = 1688},--神器碎片
						{itemid = 2204, prob = 1388, count = 1, notice = true, broadcast = true, hundred = 1688},--神甲碎片

						{itemid = 2262, prob = 1075, count = 1, notice = true, hundred = 6375}, --铁血面甲
						{itemid = 2263, prob = 1076, count = 1, notice = true, hundred = 6376}, --铁血吊坠
						{itemid = 2261, prob = 1078, count = 1, notice = true, hundred = 6378}, --铁血护膝
						{itemid = 2260, prob = 1088, count = 1, notice = true, hundred = 6388}, --铁血护肩

						{itemid = 1157, prob = 1288, count = 1, notice = true, hundred = 1288}, --2转首饰 
						{itemid = 1215, prob = 1278, count = 1, notice = true, hundred = 1278}, --2转首饰 
						{itemid = 1273, prob = 1268, count = 1, notice = true, hundred = 1268}, --2转首饰 
						{itemid = 1331, prob = 1258, count = 1, notice = true, hundred = 1258}, --2转首饰 
						{itemid = 1389, prob = 1248, count = 1, notice = true, hundred = 1248}, --2转首饰 
						{itemid = 1447, prob = 1238, count = 1, notice = true, hundred = 1238}, --2转首饰 

						{itemid = 1234, prob = 1278, count = 1, notice = true, hundred = 1278}, --2转首饰 
						{itemid = 1292, prob = 1268, count = 1, notice = true, hundred = 1268}, --2转首饰 
						{itemid = 1350, prob = 1258, count = 1, notice = true, hundred = 1258}, --2转首饰 
						{itemid = 1408, prob = 1248, count = 1, notice = true, hundred = 1248}, --2转首饰 
						{itemid = 1466, prob = 1238, count = 1, notice = true, hundred = 1238}, --2转首饰 

						{itemid = 1195, prob = 1288, count = 1, notice = true, hundred = 1288}, --2转首饰 
						{itemid = 1253, prob = 1278, count = 1, notice = true, hundred = 1278}, --2转首饰 
						{itemid = 1311, prob = 1268, count = 1, notice = true, hundred = 1268}, --2转首饰 
						{itemid = 1369, prob = 1258, count = 1, notice = true, hundred = 1258}, --2转首饰 
						{itemid = 1427, prob = 1248, count = 1, notice = true, hundred = 1248}, --2转首饰 
						{itemid = 1485, prob = 1238, count = 1, notice = true, hundred = 1238}, --2转首饰 

						{itemid = 1157, prob = 1288, count = 1, notice = true, hundred = 1288}, --2转首饰 
						{itemid = 1215, prob = 1278, count = 1, notice = true, hundred = 1278}, --2转首饰 
						{itemid = 1273, prob = 1268, count = 1, notice = true, hundred = 1268}, --2转首饰 
						{itemid = 1331, prob = 1258, count = 1, notice = true, hundred = 1258}, --2转首饰 
						{itemid = 1389, prob = 1248, count = 1, notice = true, hundred = 1248}, --2转首饰 
						{itemid = 1447, prob = 1238, count = 1, notice = true, hundred = 1238}, --2转首饰 

						{itemid = 1234, prob = 1278, count = 1, notice = true, hundred = 1278}, --2转首饰 
						{itemid = 1292, prob = 1268, count = 1, notice = true, hundred = 1268}, --2转首饰 
						{itemid = 1350, prob = 1258, count = 1, notice = true, hundred = 1258}, --2转首饰 
						{itemid = 1408, prob = 1248, count = 1, notice = true, hundred = 1248}, --2转首饰 
						{itemid = 1466, prob = 1238, count = 1, notice = true, hundred = 1238}, --2转首饰 

						{itemid = 1195, prob = 1288, count = 1, notice = true, hundred = 1288}, --2转首饰 
						{itemid = 1253, prob = 1278, count = 1, notice = true, hundred = 1278}, --2转首饰 
						{itemid = 1311, prob = 1268, count = 1, notice = true, hundred = 1268}, --2转首饰 
						{itemid = 1369, prob = 1258, count = 1, notice = true, hundred = 1258}, --2转首饰 
						{itemid = 1427, prob = 1248, count = 1, notice = true, hundred = 1248}, --2转首饰 
						{itemid = 1485, prob = 1238, count = 1, notice = true, hundred = 1238}, --2转首饰 

						{itemid = 980 , prob = 988, count = 1, notice = true, hundred = 988}, --伏虎令剑    
						{itemid = 1047, prob = 990, count = 1, notice = true, hundred = 990}, --伏虎战甲(男)
						{itemid = 1048, prob = 980, count = 1, notice = true, hundred = 980}, --伏虎战甲(女)
						{itemid = 999 , prob = 988, count = 1, notice = true, hundred = 988}, --伏虎令剑    
						{itemid = 1085, prob = 990, count = 1, notice = true, hundred = 990}, --伏虎战甲(男)
						{itemid = 1086, prob = 980, count = 1, notice = true, hundred = 980}, --伏虎战甲(女)
						{itemid = 1018, prob = 988, count = 1, notice = true, hundred = 988}, --伏虎令剑    
						{itemid = 1123, prob = 990, count = 1, notice = true, hundred = 990}, --伏虎战甲(男)
						{itemid = 1124, prob = 980, count = 1, notice = true, hundred = 980}, --伏虎战甲(女)

						{itemid = 2210, prob = 898, count = 1, notice = true, hundred = 898}, --盾牌碎片(大)    
						{itemid = 2214, prob = 878, count = 1, notice = true, hundred = 878}, --宝石碎片(大)    
						{itemid = 2218, prob = 868, count = 1, notice = true, hundred = 868}, --魂珠碎片(大)    
						{itemid = 565 , prob = 888, count = 1, notice = true, hundred = 888}, --高级转生丹      
						{itemid = 145 , prob = 898, count = 1, notice = true, hundred = 898}, --高级成就令牌    
						{itemid = 161 , prob = 878, count = 1, notice = true, hundred = 878}, --高级灵力丹      
						{itemid = 674 , prob = 868, count = 1, notice = true, hundred = 868}, --99朵玫瑰花      
						{itemid = 849 , prob = 858, count = 1, notice = true, hundred = 858}, --五倍经验(2小时) 
						{itemid = 2111, prob = 818, count = 1, notice = true, hundred = 818}, --二级暴击宝石    
						{itemid = 160 , prob = 588, count = 1, notice = true, hundred = 588},  --灵力丹(大)      
						{itemid = 527 , prob = 886, count = 1, notice = true, hundred = 886},  --特戒碎片        
						{itemid = 2226, prob = 885, count = 1, notice = true, hundred = 885}, --护符碎片(大)  

						{itemid = 1156, prob = 588, count = 1, notice = true, hundred = 588}, --1转首饰 
						{itemid = 1214, prob = 578, count = 1, notice = true, hundred = 578}, --1转首饰 
						{itemid = 1272, prob = 568, count = 1, notice = true, hundred = 568}, --1转首饰 
						{itemid = 1330, prob = 558, count = 1, notice = true, hundred = 558}, --1转首饰 
						{itemid = 1388, prob = 548, count = 1, notice = true, hundred = 548}, --1转首饰 
						{itemid = 1446, prob = 538, count = 1, notice = true, hundred = 538}, --1转首饰 

						{itemid = 1175, prob = 586, count = 1, notice = true, hundred = 586}, --1转首饰 
						{itemid = 1233, prob = 576, count = 1, notice = true, hundred = 576}, --1转首饰 
						{itemid = 1291, prob = 566, count = 1, notice = true, hundred = 566}, --1转首饰 
						{itemid = 1349, prob = 556, count = 1, notice = true, hundred = 556}, --1转首饰 
						{itemid = 1407, prob = 546, count = 1, notice = true, hundred = 546}, --1转首饰 
						{itemid = 1465, prob = 536, count = 1, notice = true, hundred = 536}, --1转首饰

						{itemid = 1194, prob = 585, count = 1, notice = true, hundred = 585}, --1转首饰 
						{itemid = 1252, prob = 575, count = 1, notice = true, hundred = 575}, --1转首饰 
						{itemid = 1310, prob = 565, count = 1, notice = true, hundred = 565}, --1转首饰 
						{itemid = 1368, prob = 555, count = 1, notice = true, hundred = 555}, --1转首饰 
						{itemid = 1426, prob = 545, count = 1, notice = true, hundred = 545}, --1转首饰 
						{itemid = 1484, prob = 535, count = 1, notice = true, hundred = 535}, --1转首饰 

						{itemid = 1156, prob = 588, count = 1, notice = true, hundred = 588}, --1转首饰 
						{itemid = 1214, prob = 578, count = 1, notice = true, hundred = 578}, --1转首饰 
						{itemid = 1272, prob = 568, count = 1, notice = true, hundred = 568}, --1转首饰 
						{itemid = 1330, prob = 558, count = 1, notice = true, hundred = 558}, --1转首饰 
						{itemid = 1388, prob = 548, count = 1, notice = true, hundred = 548}, --1转首饰 
						{itemid = 1446, prob = 538, count = 1, notice = true, hundred = 538}, --1转首饰 

						{itemid = 1175, prob = 586, count = 1, notice = true, hundred = 586}, --1转首饰 
						{itemid = 1233, prob = 576, count = 1, notice = true, hundred = 576}, --1转首饰 
						{itemid = 1291, prob = 566, count = 1, notice = true, hundred = 566}, --1转首饰 
						{itemid = 1349, prob = 556, count = 1, notice = true, hundred = 556}, --1转首饰 
						{itemid = 1407, prob = 546, count = 1, notice = true, hundred = 546}, --1转首饰 
						{itemid = 1465, prob = 536, count = 1, notice = true, hundred = 536}, --1转首饰

						{itemid = 1194, prob = 585, count = 1, notice = true, hundred = 585}, --1转首饰 
						{itemid = 1252, prob = 575, count = 1, notice = true, hundred = 575}, --1转首饰 
						{itemid = 1310, prob = 565, count = 1, notice = true, hundred = 565}, --1转首饰 
						{itemid = 1368, prob = 555, count = 1, notice = true, hundred = 555}, --1转首饰 
						{itemid = 1426, prob = 545, count = 1, notice = true, hundred = 545}, --1转首饰 
						{itemid = 1484, prob = 535, count = 1, notice = true, hundred = 535}, --1转首饰 

						{itemid = 979 , prob = 168, count = 1, notice = false, hundred = 168}, --修罗之刃      
						{itemid = 1045, prob = 165, count = 1, notice = false, hundred = 165}, --修罗战甲(男)  
						{itemid = 1046, prob = 162, count = 1, notice = false, hundred = 162}, --修罗战甲(女)  
						{itemid = 998 , prob = 167, count = 1, notice = false, hundred = 167}, --修罗之刃      
						{itemid = 1083, prob = 164, count = 1, notice = false, hundred = 164}, --修罗战甲(男)  
						{itemid = 1084, prob = 161, count = 1, notice = false, hundred = 161}, --修罗战甲(女)  
						{itemid = 1017, prob = 166, count = 1, notice = false, hundred = 166}, --修罗之刃      
						{itemid = 1121, prob = 163, count = 1, notice = false, hundred = 163}, --修罗战甲(男)  
						{itemid = 1122, prob = 160, count = 1, notice = false, hundred = 160}, --修罗战甲(女)  

						{itemid = 2123, prob = 2638, count = 1, notice = false, hundred = 238}, --子鼠玉佩  
						{itemid = 2124, prob = 2638, count = 1, notice = false, hundred = 237}, --丑牛玉佩  
						{itemid = 2125, prob = 2638, count = 1, notice = false, hundred = 236}, --寅虎玉佩  
						{itemid = 2126, prob = 2638, count = 1, notice = false, hundred = 235}, --卯兔玉佩  
						{itemid = 2127, prob = 2638, count = 1, notice = false, hundred = 234}, --辰龙玉佩  
						{itemid = 2128, prob = 2638, count = 1, notice = false, hundred = 233}, --巳蛇玉佩 
						{itemid = 2129, prob = 2638, count = 1, notice = false, hundred = 238}, --午马玉佩  
						{itemid = 2130, prob = 2638, count = 1, notice = false, hundred = 237}, --未羊玉佩  
						{itemid = 2131, prob = 2638, count = 1, notice = false, hundred = 236}, --申猴玉佩  
						{itemid = 2132, prob = 2638, count = 1, notice = false, hundred = 235}, --酉鸡玉佩  
						{itemid = 2133, prob = 2638, count = 1, notice = false, hundred = 234}, --戌狗玉佩  
						{itemid = 2134, prob = 2638, count = 1, notice = false, hundred = 233}, --亥猪玉佩 

						{itemid = 1155, prob = 128, count = 1, notice = false, hundred = 128}, --90级首饰  
						{itemid = 1213, prob = 127, count = 1, notice = false, hundred = 127}, --90级首饰  
						{itemid = 1271, prob = 126, count = 1, notice = false, hundred = 126}, --90级首饰  
						{itemid = 1329, prob = 125, count = 1, notice = false, hundred = 125}, --90级首饰  
						{itemid = 1387, prob = 124, count = 1, notice = false, hundred = 124}, --90级首饰  
						{itemid = 1445, prob = 123, count = 1, notice = false, hundred = 123}, --90级首饰  

						{itemid = 1174, prob = 128, count = 1, notice = false, hundred = 128}, --90级首饰  
						{itemid = 1232, prob = 127, count = 1, notice = false, hundred = 127}, --90级首饰  
						{itemid = 1290, prob = 126, count = 1, notice = false, hundred = 126}, --90级首饰  
						{itemid = 1348, prob = 125, count = 1, notice = false, hundred = 125}, --90级首饰  
						{itemid = 1406, prob = 124, count = 1, notice = false, hundred = 124}, --90级首饰  
						{itemid = 1464, prob = 123, count = 1, notice = false, hundred = 123}, --90级首饰 

						{itemid = 1193, prob = 128, count = 1, notice = false, hundred = 128}, --90级首饰  
						{itemid = 1251, prob = 127, count = 1, notice = false, hundred = 127}, --90级首饰  
						{itemid = 1309, prob = 126, count = 1, notice = false, hundred = 126}, --90级首饰  
						{itemid = 1367, prob = 125, count = 1, notice = false, hundred = 125}, --90级首饰  
						{itemid = 1425, prob = 124, count = 1, notice = false, hundred = 124}, --90级首饰  
						{itemid = 1483, prob = 123, count = 1, notice = false, hundred = 123}, --90级首饰 

						{itemid = 2197, prob = 18, count = 1, notice = false, hundred = 18},    --典
						{itemid = 2196, prob = 17, count = 1, notice = false, hundred = 17},    --庆
						{itemid = 2195, prob = 16, count = 1, notice = false, hundred = 16},    --服
						{itemid = 2193, prob = 15, count = 1, notice = false, hundred = 15},    --千
						{itemid = 2886, prob = 16, count = 1, notice = false, hundred = 14}, --传世宝钻 
						{itemid = 841, prob = 30, count = 1, notice = false, hundred = 10}, --圣兽灵石 
						{itemid = 818 , prob = 4 , count = 1, notice = false, hundred = 1 }, --英雄经验丹  
						{itemid = 513 , prob = 1 , count = 1, notice = false, hundred = 1 }, --经验丹(大)    
					},
				},
			},
		},
	},
},