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

						{itemid = 984 , prob = 159888, count = 1, notice = true, broadcast = true, hundred = 59888}, --8转武器        
						{itemid = 1055, prob = 158888, count = 1, notice = true, broadcast = true, hundred = 58888}, --8转衣服(男)
						{itemid = 1056, prob = 158585, count = 1, notice = true, broadcast = true, hundred = 58585}, --8转衣服(女)

						{itemid = 983 , prob = 39888, count = 1, notice = true, broadcast = true, hundred = 39888}, --傲视狂舞斩    
						{itemid = 1053, prob = 38888, count = 1, notice = true, broadcast = true, hundred = 38888}, --傲视狂舞甲(男)
						{itemid = 1054, prob = 38585, count = 1, notice = true, broadcast = true, hundred = 38585}, --傲视狂舞甲(女)

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


						{itemid = 1159, prob = 16568, count = 1, notice = true, hundred = 16568}, --6转首饰
						{itemid = 1217, prob = 16567, count = 1, notice = true, hundred = 16567}, --6转首饰
						{itemid = 1275, prob = 16566, count = 1, notice = true, hundred = 16566}, --6转首饰
						{itemid = 1333, prob = 16565, count = 1, notice = true, hundred = 16565}, --6转首饰
						{itemid = 1391, prob = 16564, count = 1, notice = true, hundred = 16564}, --6转首饰
						{itemid = 1449, prob = 16563, count = 1, notice = true, hundred = 16563}, --6转首饰

						{itemid = 1159, prob = 16568, count = 1, notice = true, hundred = 16568}, --6转首饰
						{itemid = 1217, prob = 16567, count = 1, notice = true, hundred = 16567}, --6转首饰
						{itemid = 1275, prob = 16566, count = 1, notice = true, hundred = 16566}, --6转首饰
						{itemid = 1333, prob = 16565, count = 1, notice = true, hundred = 16565}, --6转首饰
						{itemid = 1391, prob = 16564, count = 1, notice = true, hundred = 16564}, --6转首饰
						{itemid = 1449, prob = 16563, count = 1, notice = true, hundred = 16563}, --6转首饰

						{itemid = 1159, prob = 16568, count = 1, notice = true, hundred = 16568}, --6转首饰
						{itemid = 1217, prob = 16567, count = 1, notice = true, hundred = 16567}, --6转首饰
						{itemid = 1275, prob = 16566, count = 1, notice = true, hundred = 16566}, --6转首饰
						{itemid = 1333, prob = 16565, count = 1, notice = true, hundred = 16565}, --6转首饰
						{itemid = 1391, prob = 16564, count = 1, notice = true, hundred = 16564}, --6转首饰
						{itemid = 1449, prob = 16563, count = 1, notice = true, hundred = 16563}, --6转首饰

						{itemid = 1159, prob = 16568, count = 1, notice = true, hundred = 16568}, --6转首饰
						{itemid = 1217, prob = 16567, count = 1, notice = true, hundred = 16567}, --6转首饰
						{itemid = 1275, prob = 16566, count = 1, notice = true, hundred = 16566}, --6转首饰
						{itemid = 1333, prob = 16565, count = 1, notice = true, hundred = 16565}, --6转首饰
						{itemid = 1391, prob = 16564, count = 1, notice = true, hundred = 16564}, --6转首饰
						{itemid = 1449, prob = 16563, count = 1, notice = true, hundred = 16563}, --6转首饰

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

						{itemid = 1940, prob = 468, count = 1, notice = true, hundred = 8888},	--五级羽毛
						{itemid = 1941, prob = 2988, count = 1, notice = true, broadcast = true, hundred = 3289}, --六级羽毛 

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

						{itemid = 2123, prob = 298, count = 1, notice = false, hundred = 298}, --子鼠玉佩  
						{itemid = 2124, prob = 297, count = 1, notice = false, hundred = 297}, --丑牛玉佩  
						{itemid = 2125, prob = 296, count = 1, notice = false, hundred = 296}, --寅虎玉佩  
						{itemid = 2126, prob = 295, count = 1, notice = false, hundred = 295}, --卯兔玉佩  
						{itemid = 2127, prob = 294, count = 1, notice = false, hundred = 294}, --辰龙玉佩  
						{itemid = 2128, prob = 293, count = 1, notice = false, hundred = 293}, --巳蛇玉佩 
						{itemid = 2129, prob = 298, count = 1, notice = false, hundred = 298}, --午马玉佩  
						{itemid = 2130, prob = 297, count = 1, notice = false, hundred = 297}, --未羊玉佩  
						{itemid = 2131, prob = 296, count = 1, notice = false, hundred = 296}, --申猴玉佩  
						{itemid = 2132, prob = 295, count = 1, notice = false, hundred = 295}, --酉鸡玉佩  
						{itemid = 2133, prob = 294, count = 1, notice = false, hundred = 294}, --戌狗玉佩  
						{itemid = 2134, prob = 293, count = 1, notice = false, hundred = 293}, --亥猪玉佩 

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
						{itemid = 2110, prob = 14, count = 1, notice = false, hundred = 14}, --一级暴击宝石 
						{itemid = 841, prob = 10, count = 1, notice = false, hundred = 10}, --圣兽灵石 
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

						{itemid = 1003, prob = 159888, count = 1, notice = true, broadcast = true, hundred = 59888}, --8转武器    
						{itemid = 1093, prob = 158888, count = 1, notice = true, broadcast = true, hundred = 58888}, --8转衣服(男)
						{itemid = 1094, prob = 158585, count = 1, notice = true, broadcast = true, hundred = 58585}, --8转衣服(女)

						{itemid = 1002, prob = 39888, count = 1, notice = true, broadcast = true, hundred = 39888}, --傲视狂舞斩    
						{itemid = 1091, prob = 38888, count = 1, notice = true, broadcast = true, hundred = 38888}, --傲视狂舞甲(男)
						{itemid = 1092, prob = 38585, count = 1, notice = true, broadcast = true, hundred = 38585}, --傲视狂舞甲(女)

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


						{itemid = 1178, prob = 16568, count = 1, notice = true, hundred = 16568}, --6转首饰
						{itemid = 1236, prob = 16567, count = 1, notice = true, hundred = 16567}, --6转首饰
						{itemid = 1294, prob = 16566, count = 1, notice = true, hundred = 16566}, --6转首饰
						{itemid = 1352, prob = 16565, count = 1, notice = true, hundred = 16565}, --6转首饰
						{itemid = 1410, prob = 16564, count = 1, notice = true, hundred = 16564}, --6转首饰
						{itemid = 1468, prob = 16563, count = 1, notice = true, hundred = 16563}, --6转首饰

						{itemid = 1178, prob = 16568, count = 1, notice = true, hundred = 16568}, --6转首饰
						{itemid = 1236, prob = 16567, count = 1, notice = true, hundred = 16567}, --6转首饰
						{itemid = 1294, prob = 16566, count = 1, notice = true, hundred = 16566}, --6转首饰
						{itemid = 1352, prob = 16565, count = 1, notice = true, hundred = 16565}, --6转首饰
						{itemid = 1410, prob = 16564, count = 1, notice = true, hundred = 16564}, --6转首饰
						{itemid = 1468, prob = 16563, count = 1, notice = true, hundred = 16563}, --6转首饰

						{itemid = 1178, prob = 16568, count = 1, notice = true, hundred = 16568}, --6转首饰
						{itemid = 1236, prob = 16567, count = 1, notice = true, hundred = 16567}, --6转首饰
						{itemid = 1294, prob = 16566, count = 1, notice = true, hundred = 16566}, --6转首饰
						{itemid = 1352, prob = 16565, count = 1, notice = true, hundred = 16565}, --6转首饰
						{itemid = 1410, prob = 16564, count = 1, notice = true, hundred = 16564}, --6转首饰
						{itemid = 1468, prob = 16563, count = 1, notice = true, hundred = 16563}, --6转首饰

						{itemid = 1178, prob = 16568, count = 1, notice = true, hundred = 16568}, --6转首饰
						{itemid = 1236, prob = 16567, count = 1, notice = true, hundred = 16567}, --6转首饰
						{itemid = 1294, prob = 16566, count = 1, notice = true, hundred = 16566}, --6转首饰
						{itemid = 1352, prob = 16565, count = 1, notice = true, hundred = 16565}, --6转首饰
						{itemid = 1410, prob = 16564, count = 1, notice = true, hundred = 16564}, --6转首饰
						{itemid = 1468, prob = 16563, count = 1, notice = true, hundred = 16563}, --6转首饰

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
						{itemid = 1940, prob = 468, count = 1, notice = true, hundred = 8888},	--五级羽毛
						{itemid = 1941, prob = 2988, count = 1, notice = true, broadcast = true, hundred = 3289}, --六级羽毛 
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

						{itemid = 2123, prob = 298, count = 1, notice = false, hundred = 298}, --子鼠玉佩  
						{itemid = 2124, prob = 297, count = 1, notice = false, hundred = 297}, --丑牛玉佩  
						{itemid = 2125, prob = 296, count = 1, notice = false, hundred = 296}, --寅虎玉佩  
						{itemid = 2126, prob = 295, count = 1, notice = false, hundred = 295}, --卯兔玉佩  
						{itemid = 2127, prob = 294, count = 1, notice = false, hundred = 294}, --辰龙玉佩  
						{itemid = 2128, prob = 293, count = 1, notice = false, hundred = 293}, --巳蛇玉佩 
						{itemid = 2129, prob = 298, count = 1, notice = false, hundred = 298}, --午马玉佩  
						{itemid = 2130, prob = 297, count = 1, notice = false, hundred = 297}, --未羊玉佩  
						{itemid = 2131, prob = 296, count = 1, notice = false, hundred = 296}, --申猴玉佩  
						{itemid = 2132, prob = 295, count = 1, notice = false, hundred = 295}, --酉鸡玉佩  
						{itemid = 2133, prob = 294, count = 1, notice = false, hundred = 294}, --戌狗玉佩  
						{itemid = 2134, prob = 293, count = 1, notice = false, hundred = 293}, --亥猪玉佩 

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
						{itemid = 2110, prob = 14, count = 1, notice = false, hundred = 14}, --一级暴击宝石 
						{itemid = 841, prob = 10, count = 1, notice = false, hundred = 10}, --圣兽灵石 
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

						{itemid = 1022, prob = 159888, count = 1, notice = true, broadcast = true, hundred = 59888}, --8转武器    
						{itemid = 1131, prob = 158888, count = 1, notice = true, broadcast = true, hundred = 58888}, --8转衣服(男)
						{itemid = 1132, prob = 158585, count = 1, notice = true, broadcast = true, hundred = 58585}, --8转衣服(女)

						{itemid = 1021, prob = 39888, count = 1, notice = true, broadcast = true, hundred = 39888}, --傲视狂舞斩    
						{itemid = 1129, prob = 38888, count = 1, notice = true, broadcast = true, hundred = 38888}, --傲视狂舞甲(男)
						{itemid = 1130, prob = 38585, count = 1, notice = true, broadcast = true, hundred = 38585}, --傲视狂舞甲(女)

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

						{itemid = 1197, prob = 16568, count = 1, notice = true, hundred = 16568}, --6转首饰
						{itemid = 1255, prob = 16567, count = 1, notice = true, hundred = 16567}, --6转首饰
						{itemid = 1313, prob = 16566, count = 1, notice = true, hundred = 16566}, --6转首饰
						{itemid = 1371, prob = 16565, count = 1, notice = true, hundred = 16565}, --6转首饰
						{itemid = 1429, prob = 16564, count = 1, notice = true, hundred = 16564}, --6转首饰
						{itemid = 1487, prob = 16563, count = 1, notice = true, hundred = 16563}, --6转首饰

						{itemid = 1197, prob = 16568, count = 1, notice = true, hundred = 16568}, --6转首饰
						{itemid = 1255, prob = 16567, count = 1, notice = true, hundred = 16567}, --6转首饰
						{itemid = 1313, prob = 16566, count = 1, notice = true, hundred = 16566}, --6转首饰
						{itemid = 1371, prob = 16565, count = 1, notice = true, hundred = 16565}, --6转首饰
						{itemid = 1429, prob = 16564, count = 1, notice = true, hundred = 16564}, --6转首饰
						{itemid = 1487, prob = 16563, count = 1, notice = true, hundred = 16563}, --6转首饰

						{itemid = 1197, prob = 16568, count = 1, notice = true, hundred = 16568}, --6转首饰
						{itemid = 1255, prob = 16567, count = 1, notice = true, hundred = 16567}, --6转首饰
						{itemid = 1313, prob = 16566, count = 1, notice = true, hundred = 16566}, --6转首饰
						{itemid = 1371, prob = 16565, count = 1, notice = true, hundred = 16565}, --6转首饰
						{itemid = 1429, prob = 16564, count = 1, notice = true, hundred = 16564}, --6转首饰
						{itemid = 1487, prob = 16563, count = 1, notice = true, hundred = 16563}, --6转首饰

						{itemid = 1197, prob = 16568, count = 1, notice = true, hundred = 16568}, --6转首饰
						{itemid = 1255, prob = 16567, count = 1, notice = true, hundred = 16567}, --6转首饰
						{itemid = 1313, prob = 16566, count = 1, notice = true, hundred = 16566}, --6转首饰
						{itemid = 1371, prob = 16565, count = 1, notice = true, hundred = 16565}, --6转首饰
						{itemid = 1429, prob = 16564, count = 1, notice = true, hundred = 16564}, --6转首饰
						{itemid = 1487, prob = 16563, count = 1, notice = true, hundred = 16563}, --6转首饰

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
						{itemid = 1940, prob = 468, count = 1, notice = true, hundred = 8888},	--五级羽毛
						{itemid = 1941, prob = 2988, count = 1, notice = true, broadcast = true, hundred = 3289}, --六级羽毛 
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

						{itemid = 2123, prob = 298, count = 1, notice = false, hundred = 298}, --子鼠玉佩  
						{itemid = 2124, prob = 297, count = 1, notice = false, hundred = 297}, --丑牛玉佩  
						{itemid = 2125, prob = 296, count = 1, notice = false, hundred = 296}, --寅虎玉佩  
						{itemid = 2126, prob = 295, count = 1, notice = false, hundred = 295}, --卯兔玉佩  
						{itemid = 2127, prob = 294, count = 1, notice = false, hundred = 294}, --辰龙玉佩  
						{itemid = 2128, prob = 293, count = 1, notice = false, hundred = 293}, --巳蛇玉佩 
						{itemid = 2129, prob = 298, count = 1, notice = false, hundred = 298}, --午马玉佩  
						{itemid = 2130, prob = 297, count = 1, notice = false, hundred = 297}, --未羊玉佩  
						{itemid = 2131, prob = 296, count = 1, notice = false, hundred = 296}, --申猴玉佩  
						{itemid = 2132, prob = 295, count = 1, notice = false, hundred = 295}, --酉鸡玉佩  
						{itemid = 2133, prob = 294, count = 1, notice = false, hundred = 294}, --戌狗玉佩  
						{itemid = 2134, prob = 293, count = 1, notice = false, hundred = 293}, --亥猪玉佩 

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
						{itemid = 2110, prob = 14, count = 1, notice = false, hundred = 14}, --一级暴击宝石 
						{itemid = 841, prob = 10, count = 1, notice = false, hundred = 10}, --圣兽灵石 
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

						{itemid = 984 , prob = 159888, count = 1, notice = true, broadcast = true, hundred = 59888}, --8转武器        
						{itemid = 1055, prob = 158888, count = 1, notice = true, broadcast = true, hundred = 58888}, --8转衣服(男)
						{itemid = 1056, prob = 158585, count = 1, notice = true, broadcast = true, hundred = 58585}, --8转衣服(女)

						{itemid = 983 , prob = 32886, count = 1, notice = true, broadcast = true, hundred = 32886}, --傲视狂舞斩    
						{itemid = 1053, prob = 32883, count = 1, notice = true, broadcast = true, hundred = 32883}, --傲视狂舞甲(男)
						{itemid = 1054, prob = 32586, count = 1, notice = true, broadcast = true, hundred = 32586}, --傲视狂舞甲(女)

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

						{itemid = 1159, prob = 15568, count = 1, notice = true, hundred = 15568}, --6转首饰
						{itemid = 1217, prob = 15567, count = 1, notice = true, hundred = 15567}, --6转首饰
						{itemid = 1275, prob = 15566, count = 1, notice = true, hundred = 15566}, --6转首饰
						{itemid = 1333, prob = 15565, count = 1, notice = true, hundred = 15565}, --6转首饰
						{itemid = 1391, prob = 15564, count = 1, notice = true, hundred = 15564}, --6转首饰
						{itemid = 1449, prob = 15563, count = 1, notice = true, hundred = 15563}, --6转首饰

						{itemid = 1178, prob = 15558, count = 1, notice = true, hundred = 15558}, --6转首饰
						{itemid = 1236, prob = 15557, count = 1, notice = true, hundred = 15557}, --6转首饰
						{itemid = 1294, prob = 15556, count = 1, notice = true, hundred = 15556}, --6转首饰
						{itemid = 1352, prob = 15555, count = 1, notice = true, hundred = 15555}, --6转首饰
						{itemid = 1410, prob = 15553, count = 1, notice = true, hundred = 15553}, --6转首饰
						{itemid = 1468, prob = 15552, count = 1, notice = true, hundred = 15552}, --6转首饰

						{itemid = 1197, prob = 15538, count = 1, notice = true, hundred = 15538}, --6转首饰
						{itemid = 1255, prob = 15537, count = 1, notice = true, hundred = 15537}, --6转首饰
						{itemid = 1313, prob = 15536, count = 1, notice = true, hundred = 15536}, --6转首饰
						{itemid = 1371, prob = 15535, count = 1, notice = true, hundred = 15535}, --6转首饰
						{itemid = 1429, prob = 15533, count = 1, notice = true, hundred = 15533}, --6转首饰
						{itemid = 1487, prob = 15532, count = 1, notice = true, hundred = 15532}, --6转首饰

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
						{itemid = 1940, prob = 468, count = 1, notice = true, hundred = 8888},	--五级羽毛
						{itemid = 1941, prob = 2988, count = 1, notice = true, broadcast = true, hundred = 3289}, --六级羽毛 
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

						{itemid = 2123, prob = 298, count = 1, notice = false, hundred = 298}, --子鼠玉佩  
						{itemid = 2124, prob = 297, count = 1, notice = false, hundred = 297}, --丑牛玉佩  
						{itemid = 2125, prob = 296, count = 1, notice = false, hundred = 296}, --寅虎玉佩  
						{itemid = 2126, prob = 295, count = 1, notice = false, hundred = 295}, --卯兔玉佩  
						{itemid = 2127, prob = 294, count = 1, notice = false, hundred = 294}, --辰龙玉佩  
						{itemid = 2128, prob = 293, count = 1, notice = false, hundred = 293}, --巳蛇玉佩 
						{itemid = 2129, prob = 298, count = 1, notice = false, hundred = 298}, --午马玉佩  
						{itemid = 2130, prob = 297, count = 1, notice = false, hundred = 297}, --未羊玉佩  
						{itemid = 2131, prob = 296, count = 1, notice = false, hundred = 296}, --申猴玉佩  
						{itemid = 2132, prob = 295, count = 1, notice = false, hundred = 295}, --酉鸡玉佩  
						{itemid = 2133, prob = 294, count = 1, notice = false, hundred = 294}, --戌狗玉佩  
						{itemid = 2134, prob = 293, count = 1, notice = false, hundred = 293}, --亥猪玉佩 

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
						{itemid = 2110, prob = 14, count = 1, notice = false, hundred = 14}, --一级暴击宝石 
						{itemid = 841, prob = 10, count = 1, notice = false, hundred = 10}, --圣兽灵石 
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

						{itemid = 1003, prob = 159888, count = 1, notice = true, broadcast = true, hundred = 59888}, --8转武器    
						{itemid = 1093, prob = 158888, count = 1, notice = true, broadcast = true, hundred = 58888}, --8转衣服(男)
						{itemid = 1094, prob = 158585, count = 1, notice = true, broadcast = true, hundred = 58585}, --8转衣服(女)

						{itemid = 1002, prob = 32886, count = 1, notice = true, broadcast = true, hundred = 32886}, --傲视狂舞斩    
						{itemid = 1091, prob = 32883, count = 1, notice = true, broadcast = true, hundred = 32883}, --傲视狂舞甲(男)
						{itemid = 1092, prob = 32586, count = 1, notice = true, broadcast = true, hundred = 32586}, --傲视狂舞甲(女)

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


						{itemid = 1159, prob = 15568, count = 1, notice = true, hundred = 15568}, --6转首饰
						{itemid = 1217, prob = 15567, count = 1, notice = true, hundred = 15567}, --6转首饰
						{itemid = 1275, prob = 15566, count = 1, notice = true, hundred = 15566}, --6转首饰
						{itemid = 1333, prob = 15565, count = 1, notice = true, hundred = 15565}, --6转首饰
						{itemid = 1391, prob = 15564, count = 1, notice = true, hundred = 15564}, --6转首饰
						{itemid = 1449, prob = 15563, count = 1, notice = true, hundred = 15563}, --6转首饰

						{itemid = 1178, prob = 15558, count = 1, notice = true, hundred = 15568}, --6转首饰
						{itemid = 1236, prob = 15557, count = 1, notice = true, hundred = 15567}, --6转首饰
						{itemid = 1294, prob = 15556, count = 1, notice = true, hundred = 15566}, --6转首饰
						{itemid = 1352, prob = 15555, count = 1, notice = true, hundred = 15565}, --6转首饰
						{itemid = 1410, prob = 15553, count = 1, notice = true, hundred = 15564}, --6转首饰
						{itemid = 1468, prob = 15552, count = 1, notice = true, hundred = 15563}, --6转首饰

						{itemid = 1197, prob = 15538, count = 1, notice = true, hundred = 15568}, --6转首饰
						{itemid = 1255, prob = 15537, count = 1, notice = true, hundred = 15567}, --6转首饰
						{itemid = 1313, prob = 15536, count = 1, notice = true, hundred = 15566}, --6转首饰
						{itemid = 1371, prob = 15535, count = 1, notice = true, hundred = 15565}, --6转首饰
						{itemid = 1429, prob = 15533, count = 1, notice = true, hundred = 15564}, --6转首饰
						{itemid = 1487, prob = 15532, count = 1, notice = true, hundred = 15563}, --6转首饰

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
						{itemid = 1940, prob = 468, count = 1, notice = true, hundred = 8888},	--五级羽毛
						{itemid = 1941, prob = 2988, count = 1, notice = true, broadcast = true, hundred = 3289}, --六级羽毛 
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

						{itemid = 2123, prob = 298, count = 1, notice = false, hundred = 298}, --子鼠玉佩  
						{itemid = 2124, prob = 297, count = 1, notice = false, hundred = 297}, --丑牛玉佩  
						{itemid = 2125, prob = 296, count = 1, notice = false, hundred = 296}, --寅虎玉佩  
						{itemid = 2126, prob = 295, count = 1, notice = false, hundred = 295}, --卯兔玉佩  
						{itemid = 2127, prob = 294, count = 1, notice = false, hundred = 294}, --辰龙玉佩  
						{itemid = 2128, prob = 293, count = 1, notice = false, hundred = 293}, --巳蛇玉佩 
						{itemid = 2129, prob = 298, count = 1, notice = false, hundred = 298}, --午马玉佩  
						{itemid = 2130, prob = 297, count = 1, notice = false, hundred = 297}, --未羊玉佩  
						{itemid = 2131, prob = 296, count = 1, notice = false, hundred = 296}, --申猴玉佩  
						{itemid = 2132, prob = 295, count = 1, notice = false, hundred = 295}, --酉鸡玉佩  
						{itemid = 2133, prob = 294, count = 1, notice = false, hundred = 294}, --戌狗玉佩  
						{itemid = 2134, prob = 293, count = 1, notice = false, hundred = 293}, --亥猪玉佩 

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
						{itemid = 2110, prob = 14, count = 1, notice = false, hundred = 14}, --一级暴击宝石 
						{itemid = 841, prob = 10, count = 1, notice = false, hundred = 10}, --圣兽灵石 
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

						{itemid = 1022, prob = 159888, count = 1, notice = true, broadcast = true, hundred = 59888}, --8转武器    
						{itemid = 1131, prob = 158888, count = 1, notice = true, broadcast = true, hundred = 58888}, --8转衣服(男)
						{itemid = 1132, prob = 158585, count = 1, notice = true, broadcast = true, hundred = 58585}, --8转衣服(女)

						{itemid = 1021, prob = 32886, count = 1, notice = true, broadcast = true, hundred = 32886}, --傲视狂舞斩    
						{itemid = 1129, prob = 32883, count = 1, notice = true, broadcast = true, hundred = 32883}, --傲视狂舞甲(男)
						{itemid = 1130, prob = 32586, count = 1, notice = true, broadcast = true, hundred = 32586}, --傲视狂舞甲(女)

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


						{itemid = 1159, prob = 15568, count = 1, notice = true, hundred = 15568}, --6转首饰
						{itemid = 1217, prob = 15567, count = 1, notice = true, hundred = 15567}, --6转首饰
						{itemid = 1275, prob = 15566, count = 1, notice = true, hundred = 15566}, --6转首饰
						{itemid = 1333, prob = 15565, count = 1, notice = true, hundred = 15565}, --6转首饰
						{itemid = 1391, prob = 15564, count = 1, notice = true, hundred = 15564}, --6转首饰
						{itemid = 1449, prob = 15563, count = 1, notice = true, hundred = 15563}, --6转首饰

						{itemid = 1178, prob = 15558, count = 1, notice = true, hundred = 15558}, --6转首饰
						{itemid = 1236, prob = 15557, count = 1, notice = true, hundred = 15557}, --6转首饰
						{itemid = 1294, prob = 15556, count = 1, notice = true, hundred = 15556}, --6转首饰
						{itemid = 1352, prob = 15555, count = 1, notice = true, hundred = 15555}, --6转首饰
						{itemid = 1410, prob = 15553, count = 1, notice = true, hundred = 15553}, --6转首饰
						{itemid = 1468, prob = 15552, count = 1, notice = true, hundred = 15552}, --6转首饰

						{itemid = 1197, prob = 15538, count = 1, notice = true, hundred = 15538}, --6转首饰
						{itemid = 1255, prob = 15537, count = 1, notice = true, hundred = 15537}, --6转首饰
						{itemid = 1313, prob = 15536, count = 1, notice = true, hundred = 15536}, --6转首饰
						{itemid = 1371, prob = 15535, count = 1, notice = true, hundred = 15535}, --6转首饰
						{itemid = 1429, prob = 15533, count = 1, notice = true, hundred = 15533}, --6转首饰
						{itemid = 1487, prob = 15532, count = 1, notice = true, hundred = 15532}, --6转首饰

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
						{itemid = 1940, prob = 468, count = 1, notice = true, hundred = 8888},	--五级羽毛
						{itemid = 1941, prob = 2988, count = 1, notice = true, broadcast = true, hundred = 3289}, --六级羽毛 
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

						{itemid = 2123, prob = 298, count = 1, notice = false, hundred = 298}, --子鼠玉佩  
						{itemid = 2124, prob = 297, count = 1, notice = false, hundred = 297}, --丑牛玉佩  
						{itemid = 2125, prob = 296, count = 1, notice = false, hundred = 296}, --寅虎玉佩  
						{itemid = 2126, prob = 295, count = 1, notice = false, hundred = 295}, --卯兔玉佩  
						{itemid = 2127, prob = 294, count = 1, notice = false, hundred = 294}, --辰龙玉佩  
						{itemid = 2128, prob = 293, count = 1, notice = false, hundred = 293}, --巳蛇玉佩 
						{itemid = 2129, prob = 298, count = 1, notice = false, hundred = 298}, --午马玉佩  
						{itemid = 2130, prob = 297, count = 1, notice = false, hundred = 297}, --未羊玉佩  
						{itemid = 2131, prob = 296, count = 1, notice = false, hundred = 296}, --申猴玉佩  
						{itemid = 2132, prob = 295, count = 1, notice = false, hundred = 295}, --酉鸡玉佩  
						{itemid = 2133, prob = 294, count = 1, notice = false, hundred = 294}, --戌狗玉佩  
						{itemid = 2134, prob = 293, count = 1, notice = false, hundred = 293}, --亥猪玉佩 

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
						{itemid = 2110, prob = 14, count = 1, notice = false, hundred = 14}, --一级暴击宝石 
						{itemid = 841, prob = 10, count = 1, notice = false, hundred = 10}, --圣兽灵石 
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

						{itemid = 984 , prob = 89888, count = 1, notice = true, broadcast = true, hundred = 59888}, --8转武器        
						{itemid = 1055, prob = 88888, count = 1, notice = true, broadcast = true, hundred = 58888}, --8转衣服(男)
						{itemid = 1056, prob = 88585, count = 1, notice = true, broadcast = true, hundred = 58585}, --8转衣服(女)

						{itemid = 983 , prob = 32886, count = 1, notice = true, broadcast = true, hundred = 32886}, --傲视狂舞斩    
						{itemid = 1053, prob = 32883, count = 1, notice = true, broadcast = true, hundred = 32883}, --傲视狂舞甲(男)
						{itemid = 1054, prob = 32586, count = 1, notice = true, broadcast = true, hundred = 32586}, --傲视狂舞甲(女)

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


						{itemid = 1159, prob = 15568, count = 1, notice = true, hundred = 15568}, --6转首饰
						{itemid = 1217, prob = 15567, count = 1, notice = true, hundred = 15567}, --6转首饰
						{itemid = 1275, prob = 15566, count = 1, notice = true, hundred = 15566}, --6转首饰
						{itemid = 1333, prob = 15565, count = 1, notice = true, hundred = 15565}, --6转首饰
						{itemid = 1391, prob = 15564, count = 1, notice = true, hundred = 15564}, --6转首饰
						{itemid = 1449, prob = 15563, count = 1, notice = true, hundred = 15563}, --6转首饰

						{itemid = 1178, prob = 15558, count = 1, notice = true, hundred = 15558}, --6转首饰
						{itemid = 1236, prob = 15557, count = 1, notice = true, hundred = 15557}, --6转首饰
						{itemid = 1294, prob = 15556, count = 1, notice = true, hundred = 15556}, --6转首饰
						{itemid = 1352, prob = 15555, count = 1, notice = true, hundred = 15555}, --6转首饰
						{itemid = 1410, prob = 15553, count = 1, notice = true, hundred = 15553}, --6转首饰
						{itemid = 1468, prob = 15552, count = 1, notice = true, hundred = 15552}, --6转首饰

						{itemid = 1197, prob = 15538, count = 1, notice = true, hundred = 15538}, --6转首饰
						{itemid = 1255, prob = 15537, count = 1, notice = true, hundred = 15537}, --6转首饰
						{itemid = 1313, prob = 15536, count = 1, notice = true, hundred = 15536}, --6转首饰
						{itemid = 1371, prob = 15535, count = 1, notice = true, hundred = 15535}, --6转首饰
						{itemid = 1429, prob = 15533, count = 1, notice = true, hundred = 15533}, --6转首饰
						{itemid = 1487, prob = 15532, count = 1, notice = true, hundred = 15532}, --6转首饰

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

						{itemid = 981 , prob = 2888, count = 1, notice = true, hundred = 2888}, --轩辕神剑    
						{itemid = 1049, prob = 2885, count = 1, notice = true, hundred = 2885}, --轩辕神甲(男)
						{itemid = 1050, prob = 2880, count = 1, notice = true, hundred = 2880}, --轩辕神甲(女)
						{itemid = 1000, prob = 2888, count = 1, notice = true, hundred = 2888}, --轩辕神剑    
						{itemid = 1087, prob = 2885, count = 1, notice = true, hundred = 2885}, --轩辕神甲(男)
						{itemid = 1088, prob = 2880, count = 1, notice = true, hundred = 2880}, --轩辕神甲(女)
						{itemid = 1019, prob = 2888, count = 1, notice = true, hundred = 2888}, --轩辕神剑    
						{itemid = 1125, prob = 2885, count = 1, notice = true, hundred = 2885}, --轩辕神甲(男)
						{itemid = 1126, prob = 2880, count = 1, notice = true, hundred = 2880}, --轩辕神甲(女)
						{itemid = 1940, prob = 468, count = 1, notice = true, hundred = 8888},	--五级羽毛
						{itemid = 1941, prob = 2988, count = 1, notice = true, broadcast = true, hundred = 3289}, --六级羽毛 
						{itemid = 2203, prob = 1388, count = 1, notice = true, broadcast = true, hundred = 1688},--神器碎片
						{itemid = 2204, prob = 1388, count = 1, notice = true, broadcast = true, hundred = 1688},--神甲碎片

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

						{itemid = 2123, prob = 298, count = 1, notice = false, hundred = 298}, --子鼠玉佩  
						{itemid = 2124, prob = 297, count = 1, notice = false, hundred = 297}, --丑牛玉佩  
						{itemid = 2125, prob = 296, count = 1, notice = false, hundred = 296}, --寅虎玉佩  
						{itemid = 2126, prob = 295, count = 1, notice = false, hundred = 295}, --卯兔玉佩  
						{itemid = 2127, prob = 294, count = 1, notice = false, hundred = 294}, --辰龙玉佩  
						{itemid = 2128, prob = 293, count = 1, notice = false, hundred = 293}, --巳蛇玉佩 
						{itemid = 2129, prob = 298, count = 1, notice = false, hundred = 298}, --午马玉佩  
						{itemid = 2130, prob = 297, count = 1, notice = false, hundred = 297}, --未羊玉佩  
						{itemid = 2131, prob = 296, count = 1, notice = false, hundred = 296}, --申猴玉佩  
						{itemid = 2132, prob = 295, count = 1, notice = false, hundred = 295}, --酉鸡玉佩  
						{itemid = 2133, prob = 294, count = 1, notice = false, hundred = 294}, --戌狗玉佩  
						{itemid = 2134, prob = 293, count = 1, notice = false, hundred = 293}, --亥猪玉佩 

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
						{itemid = 2110, prob = 14, count = 1, notice = false, hundred = 14}, --一级暴击宝石 
						{itemid = 841, prob = 10, count = 1, notice = false, hundred = 10}, --圣兽灵石 
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

						{itemid = 1003, prob = 89888, count = 1, notice = true, broadcast = true, hundred = 59888}, --8转武器    
						{itemid = 1093, prob = 88888, count = 1, notice = true, broadcast = true, hundred = 58888}, --8转衣服(男)
						{itemid = 1094, prob = 88585, count = 1, notice = true, broadcast = true, hundred = 58585}, --8转衣服(女)

						{itemid = 1002, prob = 32886, count = 1, notice = true, broadcast = true, hundred = 32886}, --傲视狂舞斩    
						{itemid = 1091, prob = 32883, count = 1, notice = true, broadcast = true, hundred = 32883}, --傲视狂舞甲(男)
						{itemid = 1092, prob = 32586, count = 1, notice = true, broadcast = true, hundred = 32586}, --傲视狂舞甲(女)

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


						{itemid = 1159, prob = 15568, count = 1, notice = true, hundred = 15568}, --6转首饰
						{itemid = 1217, prob = 15567, count = 1, notice = true, hundred = 15567}, --6转首饰
						{itemid = 1275, prob = 15566, count = 1, notice = true, hundred = 15566}, --6转首饰
						{itemid = 1333, prob = 15565, count = 1, notice = true, hundred = 15565}, --6转首饰
						{itemid = 1391, prob = 15564, count = 1, notice = true, hundred = 15564}, --6转首饰
						{itemid = 1449, prob = 15563, count = 1, notice = true, hundred = 15563}, --6转首饰

						{itemid = 1178, prob = 15558, count = 1, notice = true, hundred = 15558}, --6转首饰
						{itemid = 1236, prob = 15557, count = 1, notice = true, hundred = 15557}, --6转首饰
						{itemid = 1294, prob = 15556, count = 1, notice = true, hundred = 15556}, --6转首饰
						{itemid = 1352, prob = 15555, count = 1, notice = true, hundred = 15555}, --6转首饰
						{itemid = 1410, prob = 15553, count = 1, notice = true, hundred = 15553}, --6转首饰
						{itemid = 1468, prob = 15552, count = 1, notice = true, hundred = 15552}, --6转首饰

						{itemid = 1197, prob = 15538, count = 1, notice = true, hundred = 15538}, --6转首饰
						{itemid = 1255, prob = 15537, count = 1, notice = true, hundred = 15537}, --6转首饰
						{itemid = 1313, prob = 15536, count = 1, notice = true, hundred = 15536}, --6转首饰
						{itemid = 1371, prob = 15535, count = 1, notice = true, hundred = 15535}, --6转首饰
						{itemid = 1429, prob = 15533, count = 1, notice = true, hundred = 15533}, --6转首饰
						{itemid = 1487, prob = 15532, count = 1, notice = true, hundred = 15532}, --6转首饰

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

						{itemid = 981 , prob = 2888, count = 1, notice = true, hundred = 2888}, --轩辕神剑    
						{itemid = 1049, prob = 2885, count = 1, notice = true, hundred = 2885}, --轩辕神甲(男)
						{itemid = 1050, prob = 2880, count = 1, notice = true, hundred = 2880}, --轩辕神甲(女)
						{itemid = 1000, prob = 2888, count = 1, notice = true, hundred = 2888}, --轩辕神剑    
						{itemid = 1087, prob = 2885, count = 1, notice = true, hundred = 2885}, --轩辕神甲(男)
						{itemid = 1088, prob = 2880, count = 1, notice = true, hundred = 2880}, --轩辕神甲(女)
						{itemid = 1019, prob = 2888, count = 1, notice = true, hundred = 2888}, --轩辕神剑    
						{itemid = 1125, prob = 2885, count = 1, notice = true, hundred = 2885}, --轩辕神甲(男)
						{itemid = 1126, prob = 2880, count = 1, notice = true, hundred = 2880}, --轩辕神甲(女)
						{itemid = 1940, prob = 468, count = 1, notice = true, hundred = 8888},	--五级羽毛
						{itemid = 1941, prob = 2988, count = 1, notice = true, broadcast = true, hundred = 3289}, --六级羽毛 
						{itemid = 2203, prob = 1388, count = 1, notice = true, broadcast = true, hundred = 1688},--神器碎片
						{itemid = 2204, prob = 1388, count = 1, notice = true, broadcast = true, hundred = 1688},--神甲碎片


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

						{itemid = 2123, prob = 298, count = 1, notice = false, hundred = 298}, --子鼠玉佩  
						{itemid = 2124, prob = 297, count = 1, notice = false, hundred = 297}, --丑牛玉佩  
						{itemid = 2125, prob = 296, count = 1, notice = false, hundred = 296}, --寅虎玉佩  
						{itemid = 2126, prob = 295, count = 1, notice = false, hundred = 295}, --卯兔玉佩  
						{itemid = 2127, prob = 294, count = 1, notice = false, hundred = 294}, --辰龙玉佩  
						{itemid = 2128, prob = 293, count = 1, notice = false, hundred = 293}, --巳蛇玉佩 
						{itemid = 2129, prob = 298, count = 1, notice = false, hundred = 298}, --午马玉佩  
						{itemid = 2130, prob = 297, count = 1, notice = false, hundred = 297}, --未羊玉佩  
						{itemid = 2131, prob = 296, count = 1, notice = false, hundred = 296}, --申猴玉佩  
						{itemid = 2132, prob = 295, count = 1, notice = false, hundred = 295}, --酉鸡玉佩  
						{itemid = 2133, prob = 294, count = 1, notice = false, hundred = 294}, --戌狗玉佩  
						{itemid = 2134, prob = 293, count = 1, notice = false, hundred = 293}, --亥猪玉佩 

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
						{itemid = 2110, prob = 14, count = 1, notice = false, hundred = 14}, --一级暴击宝石 
						{itemid = 841, prob = 10, count = 1, notice = false, hundred = 10}, --圣兽灵石 
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

						{itemid = 1022, prob = 89888, count = 1, notice = true, broadcast = true, hundred = 59888}, --8转武器    
						{itemid = 1131, prob = 88888, count = 1, notice = true, broadcast = true, hundred = 58888}, --8转衣服(男)
						{itemid = 1132, prob = 88585, count = 1, notice = true, broadcast = true, hundred = 58585}, --8转衣服(女)

						{itemid = 1021, prob = 32886, count = 1, notice = true, broadcast = true, hundred = 32886}, --傲视狂舞斩    
						{itemid = 1129, prob = 32883, count = 1, notice = true, broadcast = true, hundred = 32883}, --傲视狂舞甲(男)
						{itemid = 1130, prob = 32586, count = 1, notice = true, broadcast = true, hundred = 32586}, --傲视狂舞甲(女)

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


						{itemid = 1159, prob = 15568, count = 1, notice = true, hundred = 15568}, --6转首饰
						{itemid = 1217, prob = 15567, count = 1, notice = true, hundred = 15567}, --6转首饰
						{itemid = 1275, prob = 15566, count = 1, notice = true, hundred = 15566}, --6转首饰
						{itemid = 1333, prob = 15565, count = 1, notice = true, hundred = 15565}, --6转首饰
						{itemid = 1391, prob = 15564, count = 1, notice = true, hundred = 15564}, --6转首饰
						{itemid = 1449, prob = 15563, count = 1, notice = true, hundred = 15563}, --6转首饰

						{itemid = 1178, prob = 15558, count = 1, notice = true, hundred = 15558}, --6转首饰
						{itemid = 1236, prob = 15557, count = 1, notice = true, hundred = 15557}, --6转首饰
						{itemid = 1294, prob = 15556, count = 1, notice = true, hundred = 15556}, --6转首饰
						{itemid = 1352, prob = 15555, count = 1, notice = true, hundred = 15555}, --6转首饰
						{itemid = 1410, prob = 15553, count = 1, notice = true, hundred = 15553}, --6转首饰
						{itemid = 1468, prob = 15552, count = 1, notice = true, hundred = 15552}, --6转首饰

						{itemid = 1197, prob = 15538, count = 1, notice = true, hundred = 15538}, --6转首饰
						{itemid = 1255, prob = 15537, count = 1, notice = true, hundred = 15537}, --6转首饰
						{itemid = 1313, prob = 15536, count = 1, notice = true, hundred = 15536}, --6转首饰
						{itemid = 1371, prob = 15535, count = 1, notice = true, hundred = 15535}, --6转首饰
						{itemid = 1429, prob = 15533, count = 1, notice = true, hundred = 15533}, --6转首饰
						{itemid = 1487, prob = 15532, count = 1, notice = true, hundred = 15532}, --6转首饰

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

						{itemid = 981 , prob = 2888, count = 1, notice = true, hundred = 2888}, --轩辕神剑    
						{itemid = 1049, prob = 2885, count = 1, notice = true, hundred = 2885}, --轩辕神甲(男)
						{itemid = 1050, prob = 2880, count = 1, notice = true, hundred = 2880}, --轩辕神甲(女)
						{itemid = 1000, prob = 2888, count = 1, notice = true, hundred = 2888}, --轩辕神剑    
						{itemid = 1087, prob = 2885, count = 1, notice = true, hundred = 2885}, --轩辕神甲(男)
						{itemid = 1088, prob = 2880, count = 1, notice = true, hundred = 2880}, --轩辕神甲(女)
						{itemid = 1019, prob = 2888, count = 1, notice = true, hundred = 2888}, --轩辕神剑    
						{itemid = 1125, prob = 2885, count = 1, notice = true, hundred = 2885}, --轩辕神甲(男)
						{itemid = 1126, prob = 2880, count = 1, notice = true, hundred = 2880}, --轩辕神甲(女)
						{itemid = 1940, prob = 468, count = 1, notice = true, hundred = 8888},	--五级羽毛
						{itemid = 1941, prob = 2988, count = 1, notice = true, broadcast = true, hundred = 3289}, --六级羽毛 
						{itemid = 2203, prob = 1388, count = 1, notice = true, broadcast = true, hundred = 1688},--神器碎片
						{itemid = 2204, prob = 1388, count = 1, notice = true, broadcast = true, hundred = 1688},--神甲碎片

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

						{itemid = 2123, prob = 298, count = 1, notice = false, hundred = 298}, --子鼠玉佩  
						{itemid = 2124, prob = 297, count = 1, notice = false, hundred = 297}, --丑牛玉佩  
						{itemid = 2125, prob = 296, count = 1, notice = false, hundred = 296}, --寅虎玉佩  
						{itemid = 2126, prob = 295, count = 1, notice = false, hundred = 295}, --卯兔玉佩  
						{itemid = 2127, prob = 294, count = 1, notice = false, hundred = 294}, --辰龙玉佩  
						{itemid = 2128, prob = 293, count = 1, notice = false, hundred = 293}, --巳蛇玉佩 
						{itemid = 2129, prob = 298, count = 1, notice = false, hundred = 298}, --午马玉佩  
						{itemid = 2130, prob = 297, count = 1, notice = false, hundred = 297}, --未羊玉佩  
						{itemid = 2131, prob = 296, count = 1, notice = false, hundred = 296}, --申猴玉佩  
						{itemid = 2132, prob = 295, count = 1, notice = false, hundred = 295}, --酉鸡玉佩  
						{itemid = 2133, prob = 294, count = 1, notice = false, hundred = 294}, --戌狗玉佩  
						{itemid = 2134, prob = 293, count = 1, notice = false, hundred = 293}, --亥猪玉佩 

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
						{itemid = 2110, prob = 14, count = 1, notice = false, hundred = 14}, --一级暴击宝石 
						{itemid = 841, prob = 10, count = 1, notice = false, hundred = 10}, --圣兽灵石 
						{itemid = 818 , prob = 4 , count = 1, notice = false, hundred = 1 }, --英雄经验丹  
						{itemid = 513 , prob = 1 , count = 1, notice = false, hundred = 1 }, --经验丹(大)   
					},
				},
			},
		},
	},
},