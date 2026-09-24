--第二层表,为合服控制的表,第一个表是未合服的
{
	{
		openday = 6,		--开服天数, 5天之内存在,进入这个表后就不再进入下一个表

		items = 
		{
			--战士
			{
				{
					money = 1000,		--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 5,

					--道具列表
					items = 
					{
						--id,概率,数量,广播  prob为0则不出产, hundred为百服期间的出产率
						{itemid = 1156, prob = 12, count = 1, notice = true, hundred = 12},
						{itemid = 1214, prob = 12, count = 1, notice = true, hundred = 12},
						{itemid = 1272, prob = 11, count = 1, notice = true, hundred = 11},
						{itemid = 1330, prob = 11, count = 1, notice = true, hundred = 11},
						{itemid = 1388, prob = 10, count = 1, notice = true, hundred = 10},
						{itemid = 1446, prob = 10, count = 1, notice = true, hundred = 10},
					},
				},
				{
					money = 4000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 8,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1157, prob = 12, count = 1, notice = true, hundred = 12},
						{itemid = 1215, prob = 12, count = 1, notice = true, hundred = 12},
						{itemid = 1273, prob = 11, count = 1, notice = true, hundred = 11},
						{itemid = 1331, prob = 11, count = 1, notice = true, hundred = 11},
						{itemid = 1389, prob = 10, count = 1, notice = true, hundred = 10},
						{itemid = 1447, prob = 10, count = 1, notice = true, hundred = 10},
					},
				},
				{
					money = 8000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 12,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1158, prob = 12, count = 1, notice = true, hundred = 12},
						{itemid = 1216, prob = 12, count = 1, notice = true, hundred = 12},
						{itemid = 1274, prob = 11, count = 1, notice = true, hundred = 11},
						{itemid = 1332, prob = 11, count = 1, notice = true, hundred = 11},
						{itemid = 1390, prob = 10, count = 1, notice = true, hundred = 10},
						{itemid = 1448, prob = 10, count = 1, notice = true, hundred = 10},
					},
				},
				{
					money = 30000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 15,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1159, prob = 12, count = 1, notice = true, hundred = 12},
						{itemid = 1217, prob = 12, count = 1, notice = true, hundred = 12},
						{itemid = 1275, prob = 11, count = 1, notice = true, hundred = 11},
						{itemid = 1333, prob = 11, count = 1, notice = true, hundred = 11},
						{itemid = 1391, prob = 10, count = 1, notice = true, hundred = 10},
						{itemid = 1449, prob = 10, count = 1, notice = true, hundred = 10},
					},
				},
				{
					money = 45000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1158, prob = 12, count = 1, notice = true, hundred = 12},
						{itemid = 1216, prob = 12, count = 1, notice = true, hundred = 12},
						{itemid = 1274, prob = 11, count = 1, notice = true, hundred = 11},
						{itemid = 1332, prob = 11, count = 1, notice = true, hundred = 11},
						{itemid = 1390, prob = 10, count = 1, notice = true, hundred = 10},
						{itemid = 1448, prob = 10, count = 1, notice = true, hundred = 10},
					},
				},
				{
					money = 65000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 15,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1159, prob = 12, count = 1, notice = true, hundred = 12},
						{itemid = 1217, prob = 12, count = 1, notice = true, hundred = 12},
						{itemid = 1275, prob = 11, count = 1, notice = true, hundred = 11},
						{itemid = 1333, prob = 11, count = 1, notice = true, hundred = 11},
						{itemid = 1391, prob = 10, count = 1, notice = true, hundred = 10},
						{itemid = 1449, prob = 10, count = 1, notice = true, hundred = 10},
					},
				},
				{
					money = 80000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1158, prob = 12, count = 1, notice = true, hundred = 12},
						{itemid = 1216, prob = 12, count = 1, notice = true, hundred = 12},
						{itemid = 1274, prob = 11, count = 1, notice = true, hundred = 11},
						{itemid = 1332, prob = 11, count = 1, notice = true, hundred = 11},
						{itemid = 1390, prob = 10, count = 1, notice = true, hundred = 10},
						{itemid = 1448, prob = 10, count = 1, notice = true, hundred = 10},
					},
				},
				{
					money = 98000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 15,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1160, prob = 9, count = 1, notice = true, hundred = 9}, --8转首饰
						{itemid = 1218, prob = 9, count = 1, notice = true, hundred = 9}, --8转首饰
						{itemid = 1276, prob = 8, count = 1, notice = true, hundred = 8}, --8转首饰
						{itemid = 1334, prob = 8, count = 1, notice = true, hundred = 8}, --8转首饰
						{itemid = 1392, prob = 8, count = 1, notice = true, hundred = 8}, --8转首饰
						{itemid = 1450, prob = 7, count = 1, notice = true, hundred = 7}, --8转首饰
					},
				},
				{
					money = 188000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 12,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1160, prob = 9, count = 1, notice = true, hundred = 9}, --8转首饰
						{itemid = 1218, prob = 9, count = 1, notice = true, hundred = 9}, --8转首饰
						{itemid = 1276, prob = 8, count = 1, notice = true, hundred = 8}, --8转首饰
						{itemid = 1334, prob = 8, count = 1, notice = true, hundred = 8}, --8转首饰
						{itemid = 1392, prob = 8, count = 1, notice = true, hundred = 8}, --8转首饰
						{itemid = 1450, prob = 7, count = 1, notice = true, hundred = 7}, --8转首饰
					},
				},
				{
					count = 200,	--寻宝次数大于此值才会进入
					maxcount = 250,	--寻宝次数等于此值必定进入
					limit = 1,		--限制进入次数,-1为不限制
					prob = 18,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 2201, prob = 26, count = 1, notice = true, hundred = 26},  --欢
						{itemid = 2200, prob = 10, count = 1, notice = true, hundred = 10},  --狂
						{itemid = 2199, prob = 3, count = 1, notice = true, hundred = 3},   --民
						{itemid = 2198, prob = 1, count = 1, notice = true, hundred = 1},   --全
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

						{itemid = 980 , prob = 1388, count = 1, notice = true, hundred = 1388},	 --伏虎令剑
						{itemid = 978 , prob = 388 , count = 1, notice = true, hundred = 388 },	 --血饮狂刀
						{itemid = 979 , prob = 688 , count = 1, notice = true, hundred = 688 },	 --修罗之刃
						{itemid = 978 , prob = 386 , count = 1, notice = true, hundred = 386 },	 --血饮狂刀
						{itemid = 979 , prob = 686 , count = 1, notice = true, hundred = 686 },	 --修罗之刃

						{itemid = 2276, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 25888}, --铁血武器        
						{itemid = 2277, prob = 25668, count = 1, notice = true, broadcast = true, hundred = 25668}, --铁血衣服(男)
						{itemid = 2284, prob = 25588, count = 1, notice = true, broadcast = true, hundred = 25588}, --铁血衣服(女)

						{itemid = 984 , prob = 59888, count = 1, notice = true, broadcast = true, hundred = 59888}, --8转武器        
						{itemid = 1055, prob = 58888, count = 1, notice = true, broadcast = true, hundred = 58888}, --8转衣服(男)
						{itemid = 1056, prob = 58585, count = 1, notice = true, broadcast = true, hundred = 58585}, --8转衣服(女)

						{itemid = 983 , prob = 19888, count = 1, notice = true, broadcast = true, hundred = 19888}, --傲视狂舞斩    
						{itemid = 1053, prob = 18888, count = 1, notice = true, broadcast = true, hundred = 18888}, --傲视狂舞甲(男)
						{itemid = 1054, prob = 18585, count = 1, notice = true, broadcast = true, hundred = 18585}, --傲视狂舞甲(女)

						{itemid = 1160, prob = 22888, count = 1, notice = true, hundred = 22888}, --8转首饰    
						{itemid = 1218, prob = 22887, count = 1, notice = true, hundred = 22888}, --8转首饰
						{itemid = 1276, prob = 22886, count = 1, notice = true, hundred = 22585}, --8转首饰
						{itemid = 1334, prob = 22885, count = 1, notice = true, hundred = 22888}, --8转首饰    
						{itemid = 1392, prob = 22884, count = 1, notice = true, hundred = 22888}, --8转首饰
						{itemid = 1450, prob = 22883, count = 1, notice = true, hundred = 22585}, --8转首饰

						{itemid = 1159, prob = 16568, count = 1, notice = true, hundred = 16568}, --6转首饰
						{itemid = 1217, prob = 16567, count = 1, notice = true, hundred = 16567}, --6转首饰
						{itemid = 1275, prob = 16566, count = 1, notice = true, hundred = 16566}, --6转首饰
						{itemid = 1333, prob = 16565, count = 1, notice = true, hundred = 16565}, --6转首饰
						{itemid = 1391, prob = 16564, count = 1, notice = true, hundred = 16564}, --6转首饰
						{itemid = 1449, prob = 16563, count = 1, notice = true, hundred = 16563}, --6转首饰

						{itemid = 982 , prob = 12588, count = 1, notice = true, hundred = 12588}, --天武神剑    
						{itemid = 1051, prob = 12888, count = 1, notice = true, hundred = 12888}, --天武神甲(男)
						{itemid = 1052, prob = 12878, count = 1, notice = true, hundred = 12878}, --天武神甲(女)

						{itemid = 2209, prob = 16888, count = 1, notice = true, hundred = 15888}, --盾牌碎片(特)
						{itemid = 2213, prob = 16887, count = 1, notice = true, hundred = 15887}, --宝石碎片(特)
						{itemid = 2217, prob = 16886, count = 1, notice = true, hundred = 15886}, --魂珠碎片(特)
						{itemid = 566 , prob = 16885, count = 1, notice = true, hundred = 15885}, --超级转生丹  
						{itemid = 163 , prob = 16884, count = 1, notice = true, hundred = 15884}, --超级成就令牌
						{itemid = 162 , prob = 16883, count = 1, notice = true, hundred = 15883}, --超级灵力丹  
						{itemid = 675 , prob = 16882, count = 1, notice = true, hundred = 15882}, --999朵玫瑰花 
						{itemid = 528 , prob = 16881, count = 1, notice = true, hundred = 15881}, --特戒碎片包  
						{itemid = 2225, prob = 16880, count = 1, notice = true, hundred = 15880}, --护符碎片(特)

						{itemid = 1158, prob = 7888, count = 1, notice = true, hundred = 8888},	--4转首饰
						{itemid = 1216, prob = 7878, count = 1, notice = true, hundred = 8878},	--4转首饰
						{itemid = 1274, prob = 7868, count = 1, notice = true, hundred = 8868},	--4转首饰
						{itemid = 1332, prob = 7858, count = 1, notice = true, hundred = 8858},	--4转首饰
						{itemid = 1390, prob = 7848, count = 1, notice = true, hundred = 8848},	--4转首饰
						{itemid = 1448, prob = 7838, count = 1, notice = true, hundred = 8838},	--4转首饰

						{itemid = 2203, prob = 3188, count = 1, notice = true, hundred = 3188},--神器碎片
						{itemid = 2204, prob = 3088, count = 1, notice = true, hundred = 3088},--神甲碎片

						{itemid = 1157, prob = 1988, count = 1, notice = true, hundred = 1988}, --2转首饰 
						{itemid = 1215, prob = 1978, count = 1, notice = true, hundred = 1978}, --2转首饰 
						{itemid = 1273, prob = 1968, count = 1, notice = true, hundred = 1968}, --2转首饰 
						{itemid = 1331, prob = 1958, count = 1, notice = true, hundred = 1958}, --2转首饰 
						{itemid = 1389, prob = 1948, count = 1, notice = true, hundred = 1948}, --2转首饰 
						{itemid = 1447, prob = 1938, count = 1, notice = true, hundred = 1938}, --2转首饰 

						{itemid = 1157, prob = 1688, count = 1, notice = true, hundred = 1688}, --2转首饰 
						{itemid = 1215, prob = 1678, count = 1, notice = true, hundred = 1678}, --2转首饰 
						{itemid = 1273, prob = 1668, count = 1, notice = true, hundred = 1668}, --2转首饰 
						{itemid = 1331, prob = 1658, count = 1, notice = true, hundred = 1658}, --2转首饰 
						{itemid = 1389, prob = 1648, count = 1, notice = true, hundred = 1648}, --2转首饰 
						{itemid = 1447, prob = 1638, count = 1, notice = true, hundred = 1638}, --2转首饰 

						{itemid = 981 , prob = 2088, count = 1, notice = true, hundred = 2088}, --轩辕神剑    
						{itemid = 1049, prob = 2090, count = 1, notice = true, hundred = 2090}, --轩辕神甲(男)
						{itemid = 1050, prob = 2080, count = 1, notice = true, hundred = 2080}, --轩辕神甲(女)

						{itemid = 1156, prob = 888, count = 1, notice = true, hundred = 888}, --1转首饰 
						{itemid = 1214, prob = 878, count = 1, notice = true, hundred = 878}, --1转首饰 
						{itemid = 1272, prob = 868, count = 1, notice = true, hundred = 868}, --1转首饰 
						{itemid = 1330, prob = 858, count = 1, notice = true, hundred = 858}, --1转首饰 
						{itemid = 1388, prob = 848, count = 1, notice = true, hundred = 848}, --1转首饰 
						{itemid = 1446, prob = 838, count = 1, notice = true, hundred = 838}, --1转首饰 

						{itemid = 1156, prob = 888, count = 1, notice = true, hundred = 888}, --1转首饰 
						{itemid = 1214, prob = 878, count = 1, notice = true, hundred = 878}, --1转首饰 
						{itemid = 1272, prob = 868, count = 1, notice = true, hundred = 868}, --1转首饰 
						{itemid = 1330, prob = 858, count = 1, notice = true, hundred = 858}, --1转首饰 
						{itemid = 1388, prob = 848, count = 1, notice = true, hundred = 848}, --1转首饰 
						{itemid = 1446, prob = 838, count = 1, notice = true, hundred = 838}, --1转首饰

						{itemid = 980 , prob = 1088, count = 1, notice = true, hundred = 1088}, --伏虎令剑    
						{itemid = 1047, prob = 1290, count = 1, notice = true, hundred = 1290}, --伏虎战甲(男)
						{itemid = 1048, prob = 1280, count = 1, notice = true, hundred = 1280}, --伏虎战甲(女)

						{itemid = 980 , prob = 1088, count = 1, notice = true, hundred = 1088}, --伏虎令剑    
						{itemid = 1047, prob = 1290, count = 1, notice = true, hundred = 1290}, --伏虎战甲(男)
						{itemid = 1048, prob = 1280, count = 1, notice = true, hundred = 1280}, --伏虎战甲(女)

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

						{itemid = 979 , prob = 128, count = 1, notice = true,  hundred = 128}, --修罗之刃      
						{itemid = 1045, prob = 128, count = 1, notice = true,  hundred = 128}, --修罗战甲(男)  
						{itemid = 1046, prob = 128, count = 1, notice = true,  hundred = 128}, --修罗战甲(女)  
						{itemid = 1043, prob = 88 , count = 1, notice = false, hundred = 88 }, --血饮狂甲(男)  
						{itemid = 1044, prob = 87 , count = 1, notice = false, hundred = 87 }, --血饮狂甲(女)  
						{itemid = 978 , prob = 86 , count = 1, notice = false, hundred = 86 }, --血饮狂刀    
						
						{itemid = 1155, prob = 88, count = 1, notice = false, hundred = 88}, --90级首饰  
						{itemid = 1213, prob = 87, count = 1, notice = false, hundred = 87}, --90级首饰  
						{itemid = 1271, prob = 86, count = 1, notice = false, hundred = 86}, --90级首饰  
						{itemid = 1329, prob = 85, count = 1, notice = false, hundred = 85}, --90级首饰  
						{itemid = 1387, prob = 84, count = 1, notice = false, hundred = 84}, --90级首饰  
						{itemid = 1445, prob = 83, count = 1, notice = false, hundred = 83}, --90级首饰 

						{itemid = 1155, prob = 78, count = 1, notice = false, hundred = 78}, --90级首饰  
						{itemid = 1213, prob = 77, count = 1, notice = false, hundred = 77}, --90级首饰  
						{itemid = 1271, prob = 76, count = 1, notice = false, hundred = 76}, --90级首饰  
						{itemid = 1329, prob = 75, count = 1, notice = false, hundred = 75}, --90级首饰  
						{itemid = 1387, prob = 74, count = 1, notice = false, hundred = 74}, --90级首饰  
						{itemid = 1445, prob = 73, count = 1, notice = false, hundred = 73}, --90级首饰  

						{itemid = 1154, prob = 48, count = 1, notice = false, hundred = 48}, --80级首饰  
						{itemid = 1212, prob = 47, count = 1, notice = false, hundred = 47}, --80级首饰  
						{itemid = 1270, prob = 46, count = 1, notice = false, hundred = 46}, --80级首饰  
						{itemid = 1328, prob = 45, count = 1, notice = false, hundred = 45}, --80级首饰  
						{itemid = 1386, prob = 44, count = 1, notice = false, hundred = 44}, --80级首饰  
						{itemid = 1444, prob = 43, count = 1, notice = false, hundred = 43}, --80级首饰

						{itemid = 1154, prob = 38, count = 1, notice = false, hundred = 38}, --80级首饰  
						{itemid = 1212, prob = 37, count = 1, notice = false, hundred = 37}, --80级首饰  
						{itemid = 1270, prob = 36, count = 1, notice = false, hundred = 36}, --80级首饰  
						{itemid = 1328, prob = 35, count = 1, notice = false, hundred = 35}, --80级首饰  
						{itemid = 1386, prob = 34, count = 1, notice = false, hundred = 34}, --80级首饰  
						{itemid = 1444, prob = 33, count = 1, notice = false, hundred = 33}, --80级首饰  

						{itemid = 2197, prob = 20, count = 1, notice = false, hundred = 20},    --典
						{itemid = 2196, prob = 19, count = 1, notice = false, hundred = 19},    --庆
						{itemid = 2172, prob = 17, count = 1, notice = false, hundred = 17},    --年
						{itemid = 2171, prob = 15, count = 1, notice = false, hundred = 15},    --周
						{itemid = 2110, prob = 15, count = 1, notice = false, hundred = 15}, --一级暴击宝石
						{itemid = 2110, prob = 8, count = 1, notice = false, hundred = 15}, --一级暴击宝石 
						{itemid = 513 , prob = 1 , count = 1, notice = false, hundred = 1 }, --经验丹(大)   
					},
				},
			},
			--法师
			{
				{
					money = 1000,		--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 5,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1175, prob = 12, count = 1, notice = true, hundred = 12},
						{itemid = 1233, prob = 12, count = 1, notice = true, hundred = 12},
						{itemid = 1291, prob = 11, count = 1, notice = true, hundred = 11},
						{itemid = 1349, prob = 11, count = 1, notice = true, hundred = 11},
						{itemid = 1407, prob = 10, count = 1, notice = true, hundred = 10},
						{itemid = 1465, prob = 10, count = 1, notice = true, hundred = 10},
					},
				},
				{
					money = 4000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 8,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1176, prob = 12, count = 1, notice = true, hundred = 12},
						{itemid = 1234, prob = 12, count = 1, notice = true, hundred = 12},
						{itemid = 1292, prob = 11, count = 1, notice = true, hundred = 11},
						{itemid = 1350, prob = 11, count = 1, notice = true, hundred = 11},
						{itemid = 1408, prob = 10, count = 1, notice = true, hundred = 10},
						{itemid = 1466, prob = 10, count = 1, notice = true, hundred = 10},
					},
				},
				{
					money = 8000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 12,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1177, prob = 12, count = 1, notice = true, hundred = 12},
						{itemid = 1235, prob = 12, count = 1, notice = true, hundred = 12},
						{itemid = 1293, prob = 11, count = 1, notice = true, hundred = 11},
						{itemid = 1351, prob = 11, count = 1, notice = true, hundred = 11},
						{itemid = 1409, prob = 10, count = 1, notice = true, hundred = 10},
						{itemid = 1467, prob = 10, count = 1, notice = true, hundred = 10},
					},
				},
				{
					money = 30000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 15,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1178, prob = 12, count = 1, notice = true, hundred = 12},
						{itemid = 1236, prob = 12, count = 1, notice = true, hundred = 12},
						{itemid = 1294, prob = 11, count = 1, notice = true, hundred = 11},
						{itemid = 1352, prob = 11, count = 1, notice = true, hundred = 11},
						{itemid = 1410, prob = 10, count = 1, notice = true, hundred = 10},
						{itemid = 1468, prob = 10, count = 1, notice = true, hundred = 10},
					},
				},
				{
					money = 45000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1177, prob = 12, count = 1, notice = true, hundred = 12},
						{itemid = 1235, prob = 12, count = 1, notice = true, hundred = 12},
						{itemid = 1293, prob = 11, count = 1, notice = true, hundred = 11},
						{itemid = 1351, prob = 11, count = 1, notice = true, hundred = 11},
						{itemid = 1409, prob = 10, count = 1, notice = true, hundred = 10},
						{itemid = 1467, prob = 10, count = 1, notice = true, hundred = 10},
					},
				},
				{
					money = 65000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 15,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1178, prob = 12, count = 1, notice = true, hundred = 12},
						{itemid = 1236, prob = 12, count = 1, notice = true, hundred = 12},
						{itemid = 1294, prob = 11, count = 1, notice = true, hundred = 11},
						{itemid = 1352, prob = 11, count = 1, notice = true, hundred = 11},
						{itemid = 1410, prob = 10, count = 1, notice = true, hundred = 10},
						{itemid = 1468, prob = 10, count = 1, notice = true, hundred = 10},
					},
				},
				{
					money = 80000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1177, prob = 12, count = 1, notice = true, hundred = 12},
						{itemid = 1235, prob = 12, count = 1, notice = true, hundred = 12},
						{itemid = 1293, prob = 11, count = 1, notice = true, hundred = 11},
						{itemid = 1351, prob = 11, count = 1, notice = true, hundred = 11},
						{itemid = 1409, prob = 10, count = 1, notice = true, hundred = 10},
						{itemid = 1467, prob = 10, count = 1, notice = true, hundred = 10},
					},
				},
				{
					money = 98000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 15,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1179, prob = 9, count = 1, notice = true, hundred = 9}, --8转首饰
						{itemid = 1237, prob = 9, count = 1, notice = true, hundred = 9}, --8转首饰
						{itemid = 1295, prob = 8, count = 1, notice = true, hundred = 8}, --8转首饰
						{itemid = 1353, prob = 8, count = 1, notice = true, hundred = 8}, --8转首饰
						{itemid = 1411, prob = 8, count = 1, notice = true, hundred = 8}, --8转首饰
						{itemid = 1469, prob = 7, count = 1, notice = true, hundred = 7}, --8转首饰
					},
				},
				{
					money = 188000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 12,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1179, prob = 9, count = 1, notice = true, hundred = 9}, --8转首饰
						{itemid = 1237, prob = 9, count = 1, notice = true, hundred = 9}, --8转首饰
						{itemid = 1295, prob = 8, count = 1, notice = true, hundred = 8}, --8转首饰
						{itemid = 1353, prob = 8, count = 1, notice = true, hundred = 8}, --8转首饰
						{itemid = 1411, prob = 8, count = 1, notice = true, hundred = 8}, --8转首饰
						{itemid = 1469, prob = 7, count = 1, notice = true, hundred = 7}, --8转首饰
					},
				},
				{
					count = 200,	--寻宝次数大于此值才会进入
					maxcount = 250,	--寻宝次数等于此值必定进入
					limit = 1,		--限制进入次数,-1为不限制
					prob = 18,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 2201, prob = 26, count = 1, notice = true, hundred = 26},  --欢
						{itemid = 2200, prob = 10, count = 1, notice = true, hundred = 10},  --狂
						{itemid = 2199, prob = 3, count = 1, notice = true, hundred = 3},   --民
						{itemid = 2198, prob = 1, count = 1, notice = true, hundred = 1},   --全
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
						{itemid = 999 , prob = 1388, count = 1, notice = true, hundred = 1388},	 --伏虎令剑
						{itemid = 997 , prob = 388 , count = 1, notice = true, hundred = 388 },	 --血饮狂刀
						{itemid = 998 , prob = 688 , count = 1, notice = true, hundred = 688 },	 --修罗之刃
						{itemid = 997 , prob = 386 , count = 1, notice = true, hundred = 386 },	 --血饮狂刀
						{itemid = 998 , prob = 686 , count = 1, notice = true, hundred = 686 },	 --修罗之刃

						{itemid = 2276, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 25888}, --铁血武器        
						{itemid = 2277, prob = 25668, count = 1, notice = true, broadcast = true, hundred = 25668}, --铁血衣服(男)
						{itemid = 2284, prob = 25588, count = 1, notice = true, broadcast = true, hundred = 25588}, --铁血衣服(女)

						{itemid = 1003, prob = 59888, count = 1, notice = true, broadcast = true, hundred = 59888}, --8转武器    
						{itemid = 1093, prob = 58888, count = 1, notice = true, broadcast = true, hundred = 58888}, --8转衣服(男)
						{itemid = 1094, prob = 58585, count = 1, notice = true, broadcast = true, hundred = 58585}, --8转衣服(女)

						{itemid = 1002, prob = 19888, count = 1, notice = true, broadcast = true, hundred = 19888}, --傲视狂舞斩    
						{itemid = 1091, prob = 18888, count = 1, notice = true, broadcast = true, hundred = 18888}, --傲视狂舞甲(男)
						{itemid = 1092, prob = 18585, count = 1, notice = true, broadcast = true, hundred = 18585}, --傲视狂舞甲(女)

						{itemid = 1179, prob = 22888, count = 1, notice = true, hundred = 22888}, --8转首饰
						{itemid = 1237, prob = 22888, count = 1, notice = true, hundred = 22888}, --8转首饰
						{itemid = 1295, prob = 22585, count = 1, notice = true, hundred = 22585}, --8转首饰
						{itemid = 1353, prob = 22888, count = 1, notice = true, hundred = 22888}, --8转首饰
						{itemid = 1411, prob = 22888, count = 1, notice = true, hundred = 22888}, --8转首饰
						{itemid = 1469, prob = 22585, count = 1, notice = true, hundred = 22585}, --8转首饰

						{itemid = 1178, prob = 16568, count = 1, notice = true, hundred = 16568}, --6转首饰
						{itemid = 1236, prob = 16567, count = 1, notice = true, hundred = 16567}, --6转首饰
						{itemid = 1294, prob = 16566, count = 1, notice = true, hundred = 16566}, --6转首饰
						{itemid = 1352, prob = 16565, count = 1, notice = true, hundred = 16565}, --6转首饰
						{itemid = 1410, prob = 16564, count = 1, notice = true, hundred = 16564}, --6转首饰
						{itemid = 1468, prob = 16563, count = 1, notice = true, hundred = 16563}, --6转首饰

						{itemid = 1001, prob = 12588, count = 1, notice = true, hundred = 12588}, --天武神剑    
						{itemid = 1089, prob = 12888, count = 1, notice = true, hundred = 12888}, --天武神甲(男)
						{itemid = 1090, prob = 12878, count = 1, notice = true, hundred = 12878}, --天武神甲(女)

						{itemid = 2209, prob = 16888, count = 1, notice = true, hundred = 15888}, --盾牌碎片(特)
						{itemid = 2213, prob = 16887, count = 1, notice = true, hundred = 15887}, --宝石碎片(特)
						{itemid = 2217, prob = 16886, count = 1, notice = true, hundred = 15886}, --魂珠碎片(特)
						{itemid = 566 , prob = 16885, count = 1, notice = true, hundred = 15885}, --超级转生丹  
						{itemid = 163 , prob = 16884, count = 1, notice = true, hundred = 15884}, --超级成就令牌
						{itemid = 162 , prob = 16883, count = 1, notice = true, hundred = 15883}, --超级灵力丹  
						{itemid = 675 , prob = 16882, count = 1, notice = true, hundred = 15882}, --999朵玫瑰花 
						{itemid = 528 , prob = 16881, count = 1, notice = true, hundred = 15881}, --特戒碎片包  
						{itemid = 2225, prob = 16880, count = 1, notice = true, hundred = 15880}, --护符碎片(特)

						{itemid = 1177, prob = 7888, count = 1, notice = true, hundred = 8888}, --4转首饰
						{itemid = 1235, prob = 7878, count = 1, notice = true, hundred = 8878}, --4转首饰
						{itemid = 1293, prob = 7868, count = 1, notice = true, hundred = 8868}, --4转首饰
						{itemid = 1351, prob = 7858, count = 1, notice = true, hundred = 8858}, --4转首饰
						{itemid = 1409, prob = 7848, count = 1, notice = true, hundred = 8848}, --4转首饰
						{itemid = 1467, prob = 7838, count = 1, notice = true, hundred = 8838}, --4转首饰

						{itemid = 1176, prob = 1988, count = 1, notice = true, hundred = 1988}, --2转首饰 
						{itemid = 1234, prob = 1978, count = 1, notice = true, hundred = 1978}, --2转首饰 
						{itemid = 1292, prob = 1968, count = 1, notice = true, hundred = 1968}, --2转首饰 
						{itemid = 1350, prob = 1958, count = 1, notice = true, hundred = 1958}, --2转首饰 
						{itemid = 1408, prob = 1948, count = 1, notice = true, hundred = 1948}, --2转首饰 
						{itemid = 1466, prob = 1938, count = 1, notice = true, hundred = 1938}, --2转首饰 

						{itemid = 1176, prob = 1688, count = 1, notice = true, hundred = 1688}, --2转首饰 
						{itemid = 1234, prob = 1678, count = 1, notice = true, hundred = 1678}, --2转首饰 
						{itemid = 1292, prob = 1668, count = 1, notice = true, hundred = 1668}, --2转首饰 
						{itemid = 1350, prob = 1658, count = 1, notice = true, hundred = 1658}, --2转首饰 
						{itemid = 1408, prob = 1648, count = 1, notice = true, hundred = 1648}, --2转首饰 
						{itemid = 1466, prob = 1638, count = 1, notice = true, hundred = 1638}, --2转首饰 

						{itemid = 2203, prob = 3188, count = 1, notice = true, hundred = 3188},--神器碎片
						{itemid = 2204, prob = 3088, count = 1, notice = true, hundred = 3088},--神甲碎片

						{itemid = 1000, prob = 2088, count = 1, notice = true, hundred = 2088}, --轩辕神剑    
						{itemid = 1087, prob = 2090, count = 1, notice = true, hundred = 2090}, --轩辕神甲(男)
						{itemid = 1088, prob = 2080, count = 1, notice = true, hundred = 2080}, --轩辕神甲(女)

						{itemid = 1175, prob = 888, count = 1, notice = true, hundred = 888}, --1转首饰 
						{itemid = 1233, prob = 878, count = 1, notice = true, hundred = 878}, --1转首饰 
						{itemid = 1291, prob = 868, count = 1, notice = true, hundred = 868}, --1转首饰 
						{itemid = 1349, prob = 858, count = 1, notice = true, hundred = 858}, --1转首饰 
						{itemid = 1407, prob = 848, count = 1, notice = true, hundred = 848}, --1转首饰 
						{itemid = 1465, prob = 838, count = 1, notice = true, hundred = 838}, --1转首饰 

						{itemid = 1175, prob = 888, count = 1, notice = true, hundred = 888}, --1转首饰 
						{itemid = 1233, prob = 878, count = 1, notice = true, hundred = 878}, --1转首饰 
						{itemid = 1291, prob = 868, count = 1, notice = true, hundred = 868}, --1转首饰 
						{itemid = 1349, prob = 858, count = 1, notice = true, hundred = 858}, --1转首饰 
						{itemid = 1407, prob = 848, count = 1, notice = true, hundred = 848}, --1转首饰 
						{itemid = 1465, prob = 838, count = 1, notice = true, hundred = 838}, --1转首饰

						{itemid = 999 , prob = 1088, count = 1, notice = true, hundred = 1088}, --伏虎令剑    
						{itemid = 1085, prob = 1290, count = 1, notice = true, hundred = 1290}, --伏虎战甲(男)
						{itemid = 1086, prob = 1280, count = 1, notice = true, hundred = 1280}, --伏虎战甲(女)

						{itemid = 999 , prob = 1088, count = 1, notice = true, hundred = 1088}, --伏虎令剑    
						{itemid = 1085, prob = 1290, count = 1, notice = true, hundred = 1290}, --伏虎战甲(男)
						{itemid = 1086, prob = 1280, count = 1, notice = true, hundred = 1280}, --伏虎战甲(女)

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

						{itemid = 998 , prob = 128, count = 1, notice = true,  hundred = 128}, --修罗之刃      
						{itemid = 1083, prob = 128, count = 1, notice = true,  hundred = 128}, --修罗战甲(男)  
						{itemid = 1084, prob = 128, count = 1, notice = true,  hundred = 128}, --修罗战甲(女)  
						{itemid = 997 , prob = 88 , count = 1, notice = false, hundred = 88 }, --血饮狂甲(男)  
						{itemid = 1081, prob = 87 , count = 1, notice = false, hundred = 87 }, --血饮狂甲(女)  
						{itemid = 1082, prob = 86 , count = 1, notice = false, hundred = 86 }, --血饮狂刀    
						
						{itemid = 1174, prob = 88, count = 1, notice = false, hundred = 88}, --90级首饰  
						{itemid = 1232, prob = 87, count = 1, notice = false, hundred = 87}, --90级首饰  
						{itemid = 1290, prob = 86, count = 1, notice = false, hundred = 86}, --90级首饰  
						{itemid = 1348, prob = 85, count = 1, notice = false, hundred = 85}, --90级首饰  
						{itemid = 1406, prob = 84, count = 1, notice = false, hundred = 84}, --90级首饰  
						{itemid = 1464, prob = 83, count = 1, notice = false, hundred = 83}, --90级首饰 

						{itemid = 1174, prob = 78, count = 1, notice = false, hundred = 78}, --90级首饰  
						{itemid = 1232, prob = 77, count = 1, notice = false, hundred = 77}, --90级首饰  
						{itemid = 1290, prob = 76, count = 1, notice = false, hundred = 76}, --90级首饰  
						{itemid = 1348, prob = 75, count = 1, notice = false, hundred = 75}, --90级首饰  
						{itemid = 1406, prob = 74, count = 1, notice = false, hundred = 74}, --90级首饰  
						{itemid = 1464, prob = 73, count = 1, notice = false, hundred = 73}, --90级首饰  

						{itemid = 1173, prob = 48, count = 1, notice = false, hundred = 48}, --80级首饰  
						{itemid = 1231, prob = 47, count = 1, notice = false, hundred = 47}, --80级首饰  
						{itemid = 1289, prob = 46, count = 1, notice = false, hundred = 46}, --80级首饰  
						{itemid = 1347, prob = 45, count = 1, notice = false, hundred = 45}, --80级首饰  
						{itemid = 1405, prob = 44, count = 1, notice = false, hundred = 44}, --80级首饰  
						{itemid = 1463, prob = 43, count = 1, notice = false, hundred = 43}, --80级首饰

						{itemid = 1173, prob = 38, count = 1, notice = false, hundred = 38}, --80级首饰  
						{itemid = 1231, prob = 37, count = 1, notice = false, hundred = 37}, --80级首饰  
						{itemid = 1289, prob = 36, count = 1, notice = false, hundred = 36}, --80级首饰  
						{itemid = 1347, prob = 35, count = 1, notice = false, hundred = 35}, --80级首饰  
						{itemid = 1405, prob = 34, count = 1, notice = false, hundred = 34}, --80级首饰  
						{itemid = 1463, prob = 33, count = 1, notice = false, hundred = 33}, --80级首饰  

						{itemid = 2197, prob = 20, count = 1, notice = false, hundred = 20},    --典
						{itemid = 2196, prob = 19, count = 1, notice = false, hundred = 19},    --庆
						{itemid = 2172, prob = 17, count = 1, notice = false, hundred = 17},    --年
						{itemid = 2171, prob = 15, count = 1, notice = false, hundred = 15},    --周
						{itemid = 2110, prob = 15, count = 1, notice = false, hundred = 15}, --一级暴击宝石 
						{itemid = 2110, prob = 8, count = 1, notice = false, hundred = 15}, --一级暴击宝石 
						{itemid = 513 , prob = 1 , count = 1, notice = false, hundred = 1 }, --经验丹(大)   

					},
				},
			},
			--道士
			{
				{
					money = 1000,		--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 5,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1194, prob = 12, count = 1, notice = true, hundred = 12},
						{itemid = 1252, prob = 12, count = 1, notice = true, hundred = 12},
						{itemid = 1310, prob = 11, count = 1, notice = true, hundred = 11},
						{itemid = 1368, prob = 11, count = 1, notice = true, hundred = 11},
						{itemid = 1426, prob = 10, count = 1, notice = true, hundred = 10},
						{itemid = 1484, prob = 10, count = 1, notice = true, hundred = 10},
					},
				},
				{
					money = 4000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 8,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1195, prob = 12, count = 1, notice = true, hundred = 12},
						{itemid = 1253, prob = 12, count = 1, notice = true, hundred = 12},
						{itemid = 1311, prob = 11, count = 1, notice = true, hundred = 11},
						{itemid = 1369, prob = 11, count = 1, notice = true, hundred = 11},
						{itemid = 1427, prob = 10, count = 1, notice = true, hundred = 10},
						{itemid = 1485, prob = 10, count = 1, notice = true, hundred = 10},
					},
				},
				{
					money = 8000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 12,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1196, prob = 12, count = 1, notice = true, hundred = 12},
						{itemid = 1254, prob = 12, count = 1, notice = true, hundred = 12},
						{itemid = 1312, prob = 11, count = 1, notice = true, hundred = 11},
						{itemid = 1370, prob = 11, count = 1, notice = true, hundred = 11},
						{itemid = 1428, prob = 10, count = 1, notice = true, hundred = 10},
						{itemid = 1486, prob = 10, count = 1, notice = true, hundred = 10},
					},
				},
				{
					money = 30000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 15,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1197, prob = 12, count = 1, notice = true, hundred = 12},
						{itemid = 1255, prob = 12, count = 1, notice = true, hundred = 12},
						{itemid = 1313, prob = 11, count = 1, notice = true, hundred = 11},
						{itemid = 1371, prob = 11, count = 1, notice = true, hundred = 11},
						{itemid = 1429, prob = 10, count = 1, notice = true, hundred = 10},
						{itemid = 1487, prob = 10, count = 1, notice = true, hundred = 10},
					},
				},
				{
					money = 45000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1196, prob = 12, count = 1, notice = true, hundred = 12},
						{itemid = 1254, prob = 12, count = 1, notice = true, hundred = 12},
						{itemid = 1312, prob = 11, count = 1, notice = true, hundred = 11},
						{itemid = 1370, prob = 11, count = 1, notice = true, hundred = 11},
						{itemid = 1428, prob = 10, count = 1, notice = true, hundred = 10},
						{itemid = 1486, prob = 10, count = 1, notice = true, hundred = 10},
					},
				},
				{
					money = 65000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 15,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1197, prob = 12, count = 1, notice = true, hundred = 12},
						{itemid = 1255, prob = 12, count = 1, notice = true, hundred = 12},
						{itemid = 1313, prob = 11, count = 1, notice = true, hundred = 11},
						{itemid = 1371, prob = 11, count = 1, notice = true, hundred = 11},
						{itemid = 1429, prob = 10, count = 1, notice = true, hundred = 10},
						{itemid = 1487, prob = 10, count = 1, notice = true, hundred = 10},
					},
				},
				{
					money = 80000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1196, prob = 12, count = 1, notice = true, hundred = 12},
						{itemid = 1254, prob = 12, count = 1, notice = true, hundred = 12},
						{itemid = 1312, prob = 11, count = 1, notice = true, hundred = 11},
						{itemid = 1370, prob = 11, count = 1, notice = true, hundred = 11},
						{itemid = 1428, prob = 10, count = 1, notice = true, hundred = 10},
						{itemid = 1486, prob = 10, count = 1, notice = true, hundred = 10},
					},
				},
				{
					money = 98000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 12,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1198, prob = 9, count = 1, notice = true, hundred = 9}, --8转首饰
						{itemid = 1256, prob = 9, count = 1, notice = true, hundred = 9}, --8转首饰
						{itemid = 1314, prob = 8, count = 1, notice = true, hundred = 8}, --8转首饰
						{itemid = 1372, prob = 8, count = 1, notice = true, hundred = 8}, --8转首饰
						{itemid = 1430, prob = 8, count = 1, notice = true, hundred = 8}, --8转首饰
						{itemid = 1488, prob = 7, count = 1, notice = true, hundred = 7}, --8转首饰
					},
				},
				{
					money = 188000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 12,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1198, prob = 9, count = 1, notice = true, hundred = 9}, --8转首饰
						{itemid = 1256, prob = 9, count = 1, notice = true, hundred = 9}, --8转首饰
						{itemid = 1314, prob = 8, count = 1, notice = true, hundred = 8}, --8转首饰
						{itemid = 1372, prob = 8, count = 1, notice = true, hundred = 8}, --8转首饰
						{itemid = 1430, prob = 8, count = 1, notice = true, hundred = 8}, --8转首饰
						{itemid = 1488, prob = 7, count = 1, notice = true, hundred = 7}, --8转首饰
					},
				},
				{
					count = 200,	--寻宝次数大于此值才会进入
					maxcount = 250,	--寻宝次数等于此值必定进入
					limit = 1,		--限制进入次数,-1为不限制
					prob = 18,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 2201, prob = 26, count = 1, notice = true, hundred = 26},  --欢
						{itemid = 2200, prob = 10, count = 1, notice = true, hundred = 10},  --狂
						{itemid = 2199, prob = 3, count = 1, notice = true, hundred = 3},   --民
						{itemid = 2198, prob = 1, count = 1, notice = true, hundred = 1},   --全
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

						{itemid = 1018 , prob = 1388, count = 1, notice = true, hundred = 1388}, --伏虎令剑
						{itemid = 1016 , prob = 388 , count = 1, notice = true, hundred = 388 }, --血饮狂刀
						{itemid = 1017 , prob = 688 , count = 1, notice = true, hundred = 688 }, --修罗之刃
						{itemid = 1016 , prob = 386 , count = 1, notice = true, hundred = 386 }, --血饮狂刀
						{itemid = 1017 , prob = 686 , count = 1, notice = true, hundred = 686 }, --修罗之刃

						{itemid = 2276, prob = 25888, count = 1, notice = true, broadcast = true, hundred = 25888}, --铁血武器        
						{itemid = 2277, prob = 25668, count = 1, notice = true, broadcast = true, hundred = 25668}, --铁血衣服(男)
						{itemid = 2284, prob = 25588, count = 1, notice = true, broadcast = true, hundred = 25588}, --铁血衣服(女)

						{itemid = 1022, prob = 59888, count = 1, notice = true, broadcast = true, hundred = 59888}, --8转武器    
						{itemid = 1131, prob = 58888, count = 1, notice = true, broadcast = true, hundred = 58888}, --8转衣服(男)
						{itemid = 1132, prob = 58585, count = 1, notice = true, broadcast = true, hundred = 58585}, --8转衣服(女)

						{itemid = 1021, prob = 19888, count = 1, notice = true, broadcast = true, hundred = 19888}, --傲视狂舞斩    
						{itemid = 1129, prob = 18888, count = 1, notice = true, broadcast = true, hundred = 18888}, --傲视狂舞甲(男)
						{itemid = 1130, prob = 18585, count = 1, notice = true, broadcast = true, hundred = 18585}, --傲视狂舞甲(女)

						{itemid = 1198, prob = 22888, count = 1, notice = true, hundred = 22888}, --8转首饰
						{itemid = 1256, prob = 22888, count = 1, notice = true, hundred = 22888}, --8转首饰
						{itemid = 1314, prob = 22585, count = 1, notice = true, hundred = 22585}, --8转首饰
						{itemid = 1372, prob = 22888, count = 1, notice = true, hundred = 22888}, --8转首饰
						{itemid = 1430, prob = 22888, count = 1, notice = true, hundred = 22888}, --8转首饰
						{itemid = 1488, prob = 22585, count = 1, notice = true, hundred = 22585}, --8转首饰

						{itemid = 1197, prob = 16568, count = 1, notice = true, hundred = 16568}, --6转首饰
						{itemid = 1255, prob = 16567, count = 1, notice = true, hundred = 16567}, --6转首饰
						{itemid = 1313, prob = 16566, count = 1, notice = true, hundred = 16566}, --6转首饰
						{itemid = 1371, prob = 16565, count = 1, notice = true, hundred = 16565}, --6转首饰
						{itemid = 1429, prob = 16564, count = 1, notice = true, hundred = 16564}, --6转首饰
						{itemid = 1487, prob = 16563, count = 1, notice = true, hundred = 16563}, --6转首饰

						{itemid = 1020, prob = 12588, count = 1, notice = true, hundred = 12588}, --天武神剑    
						{itemid = 1127, prob = 12888, count = 1, notice = true, hundred = 12888}, --天武神甲(男)
						{itemid = 1128, prob = 12878, count = 1, notice = true, hundred = 12878}, --天武神甲(女)

						{itemid = 2209, prob = 16888, count = 1, notice = true, hundred = 15888}, --盾牌碎片(特)
						{itemid = 2213, prob = 16887, count = 1, notice = true, hundred = 15887}, --宝石碎片(特)
						{itemid = 2217, prob = 16886, count = 1, notice = true, hundred = 15886}, --魂珠碎片(特)
						{itemid = 566 , prob = 16885, count = 1, notice = true, hundred = 15885}, --超级转生丹  
						{itemid = 163 , prob = 16884, count = 1, notice = true, hundred = 15884}, --超级成就令牌
						{itemid = 162 , prob = 16883, count = 1, notice = true, hundred = 15883}, --超级灵力丹  
						{itemid = 675 , prob = 16882, count = 1, notice = true, hundred = 15882}, --999朵玫瑰花 
						{itemid = 528 , prob = 16881, count = 1, notice = true, hundred = 15881}, --特戒碎片包  
						{itemid = 2225, prob = 16880, count = 1, notice = true, hundred = 15880}, --护符碎片(特)

						{itemid = 1196, prob = 7888, count = 1, notice = true, hundred = 8888}, --4转首饰
						{itemid = 1254, prob = 7878, count = 1, notice = true, hundred = 8878}, --4转首饰
						{itemid = 1312, prob = 7868, count = 1, notice = true, hundred = 8868}, --4转首饰
						{itemid = 1370, prob = 7858, count = 1, notice = true, hundred = 8858}, --4转首饰
						{itemid = 1428, prob = 7848, count = 1, notice = true, hundred = 8848}, --4转首饰
						{itemid = 1486, prob = 7838, count = 1, notice = true, hundred = 8838}, --4转首饰

						{itemid = 2203, prob = 3188, count = 1, notice = true, hundred = 3188},--神器碎片
						{itemid = 2204, prob = 3088, count = 1, notice = true, hundred = 3088},--神甲碎片

						{itemid = 1195, prob = 1988, count = 1, notice = true, hundred = 1988}, --2转首饰 
						{itemid = 1253, prob = 1978, count = 1, notice = true, hundred = 1978}, --2转首饰 
						{itemid = 1311, prob = 1968, count = 1, notice = true, hundred = 1968}, --2转首饰 
						{itemid = 1369, prob = 1958, count = 1, notice = true, hundred = 1958}, --2转首饰 
						{itemid = 1427, prob = 1948, count = 1, notice = true, hundred = 1948}, --2转首饰 
						{itemid = 1485, prob = 1938, count = 1, notice = true, hundred = 1938}, --2转首饰 

						{itemid = 1195, prob = 1688, count = 1, notice = true, hundred = 1688}, --2转首饰 
						{itemid = 1253, prob = 1678, count = 1, notice = true, hundred = 1678}, --2转首饰 
						{itemid = 1311, prob = 1668, count = 1, notice = true, hundred = 1668}, --2转首饰 
						{itemid = 1369, prob = 1658, count = 1, notice = true, hundred = 1658}, --2转首饰 
						{itemid = 1427, prob = 1648, count = 1, notice = true, hundred = 1648}, --2转首饰 
						{itemid = 1485, prob = 1638, count = 1, notice = true, hundred = 1638}, --2转首饰 

						{itemid = 1019, prob = 2088, count = 1, notice = true, hundred = 2088}, --轩辕神剑    
						{itemid = 1125, prob = 2090, count = 1, notice = true, hundred = 2090}, --轩辕神甲(男)
						{itemid = 1126, prob = 2080, count = 1, notice = true, hundred = 2080}, --轩辕神甲(女)

						{itemid = 1194, prob = 888, count = 1, notice = true, hundred = 888}, --1转首饰 
						{itemid = 1252, prob = 878, count = 1, notice = true, hundred = 878}, --1转首饰 
						{itemid = 1310, prob = 868, count = 1, notice = true, hundred = 868}, --1转首饰 
						{itemid = 1368, prob = 858, count = 1, notice = true, hundred = 858}, --1转首饰 
						{itemid = 1426, prob = 848, count = 1, notice = true, hundred = 848}, --1转首饰 
						{itemid = 1484, prob = 838, count = 1, notice = true, hundred = 838}, --1转首饰 

						{itemid = 1194, prob = 888, count = 1, notice = true, hundred = 888}, --1转首饰 
						{itemid = 1252, prob = 878, count = 1, notice = true, hundred = 878}, --1转首饰 
						{itemid = 1310, prob = 868, count = 1, notice = true, hundred = 868}, --1转首饰 
						{itemid = 1368, prob = 858, count = 1, notice = true, hundred = 858}, --1转首饰 
						{itemid = 1426, prob = 848, count = 1, notice = true, hundred = 848}, --1转首饰 
						{itemid = 1484, prob = 838, count = 1, notice = true, hundred = 838}, --1转首饰

						{itemid = 1018, prob = 1088, count = 1, notice = true, hundred = 1088}, --伏虎令剑    
						{itemid = 1123, prob = 1290, count = 1, notice = true, hundred = 1290}, --伏虎战甲(男)
						{itemid = 1124, prob = 1280, count = 1, notice = true, hundred = 1280}, --伏虎战甲(女)

						{itemid = 1018, prob = 1088, count = 1, notice = true, hundred = 1088}, --伏虎令剑    
						{itemid = 1123, prob = 1290, count = 1, notice = true, hundred = 1290}, --伏虎战甲(男)
						{itemid = 1124, prob = 1280, count = 1, notice = true, hundred = 1280}, --伏虎战甲(女)

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

						{itemid = 1017, prob = 128, count = 1, notice = true,  hundred = 128}, --修罗之刃      
						{itemid = 1121, prob = 128, count = 1, notice = true,  hundred = 128}, --修罗战甲(男)  
						{itemid = 1122, prob = 128, count = 1, notice = true,  hundred = 128}, --修罗战甲(女)  
						{itemid = 1016, prob = 88 , count = 1, notice = false, hundred = 88 }, --血饮狂甲(男)  
						{itemid = 1119, prob = 87 , count = 1, notice = false, hundred = 87 }, --血饮狂甲(女)  
						{itemid = 1120, prob = 86 , count = 1, notice = false, hundred = 86 }, --血饮狂刀    
						
						{itemid = 1193, prob = 88, count = 1, notice = false, hundred = 88}, --90级首饰  
						{itemid = 1251, prob = 87, count = 1, notice = false, hundred = 87}, --90级首饰  
						{itemid = 1309, prob = 86, count = 1, notice = false, hundred = 86}, --90级首饰  
						{itemid = 1367, prob = 85, count = 1, notice = false, hundred = 85}, --90级首饰  
						{itemid = 1425, prob = 84, count = 1, notice = false, hundred = 84}, --90级首饰  
						{itemid = 1483, prob = 83, count = 1, notice = false, hundred = 83}, --90级首饰 

						{itemid = 1193, prob = 78, count = 1, notice = false, hundred = 78}, --90级首饰  
						{itemid = 1251, prob = 77, count = 1, notice = false, hundred = 77}, --90级首饰  
						{itemid = 1309, prob = 76, count = 1, notice = false, hundred = 76}, --90级首饰  
						{itemid = 1367, prob = 75, count = 1, notice = false, hundred = 75}, --90级首饰  
						{itemid = 1425, prob = 74, count = 1, notice = false, hundred = 74}, --90级首饰  
						{itemid = 1483, prob = 73, count = 1, notice = false, hundred = 73}, --90级首饰  

						{itemid = 1192, prob = 48, count = 1, notice = false, hundred = 48}, --80级首饰  
						{itemid = 1250, prob = 47, count = 1, notice = false, hundred = 47}, --80级首饰  
						{itemid = 1308, prob = 46, count = 1, notice = false, hundred = 46}, --80级首饰  
						{itemid = 1366, prob = 45, count = 1, notice = false, hundred = 45}, --80级首饰  
						{itemid = 1424, prob = 44, count = 1, notice = false, hundred = 44}, --80级首饰  
						{itemid = 1482, prob = 43, count = 1, notice = false, hundred = 43}, --80级首饰

						{itemid = 1192, prob = 38, count = 1, notice = false, hundred = 38}, --80级首饰  
						{itemid = 1250, prob = 37, count = 1, notice = false, hundred = 37}, --80级首饰  
						{itemid = 1308, prob = 36, count = 1, notice = false, hundred = 36}, --80级首饰  
						{itemid = 1366, prob = 35, count = 1, notice = false, hundred = 35}, --80级首饰  
						{itemid = 1424, prob = 34, count = 1, notice = false, hundred = 34}, --80级首饰  
						{itemid = 1482, prob = 33, count = 1, notice = false, hundred = 33}, --80级首饰  

						{itemid = 2197, prob = 20, count = 1, notice = false, hundred = 20},    --典
						{itemid = 2196, prob = 19, count = 1, notice = false, hundred = 19},    --庆
						{itemid = 2172, prob = 17, count = 1, notice = false, hundred = 17},    --年
						{itemid = 2171, prob = 15, count = 1, notice = false, hundred = 15},    --周
						{itemid = 2110, prob = 15, count = 1, notice = false, hundred = 15}, --一级暴击宝石 
						{itemid = 2110, prob = 8, count = 1, notice = false, hundred = 15}, --一级暴击宝石 
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
					money = 2400,		--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 5,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1157, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1215, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1273, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1331, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1389, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1447, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1176, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1234, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1292, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1350, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1408, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1466, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1195, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1253, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1311, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1369, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1427, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1485, prob = 18, count = 1, notice = true, hundred = 18},
					},
				},

				{
					money = 8000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 8,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1158, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1216, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1274, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1332, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1390, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1448, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1177, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1235, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1293, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1351, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1409, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1467, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1196, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1254, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1312, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1370, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1428, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1486, prob = 23, count = 1, notice = true, hundred = 23},
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
						{itemid = 1159, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1217, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1275, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1333, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1391, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1449, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1178, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1236, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1294, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1352, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1410, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1468, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1197, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1255, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1313, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1371, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1429, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1487, prob = 28, count = 1, notice = true, hundred = 28},
					},
				},
				{
					money = 45000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1158, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1216, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1274, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1332, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1390, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1448, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1177, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1235, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1293, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1351, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1409, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1467, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1196, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1254, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1312, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1370, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1428, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1486, prob = 23, count = 1, notice = true, hundred = 23},
					},
				},
				{
					money = 65000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 15,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1159, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1217, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1275, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1333, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1391, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1449, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1178, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1236, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1294, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1352, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1410, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1468, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1197, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1255, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1313, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1371, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1429, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1487, prob = 28, count = 1, notice = true, hundred = 28},
					},
				},
				{
					money = 80000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1158, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1216, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1274, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1332, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1390, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1448, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1177, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1235, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1293, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1351, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1409, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1467, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1196, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1254, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1312, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1370, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1428, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1486, prob = 23, count = 1, notice = true, hundred = 23},
					},
				},
				{
					money = 98000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 15,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1160, prob = 9, count = 1, notice = true, hundred = 9}, --8转首饰
						{itemid = 1218, prob = 9, count = 1, notice = true, hundred = 9}, --8转首饰
						{itemid = 1276, prob = 8, count = 1, notice = true, hundred = 8}, --8转首饰
						{itemid = 1334, prob = 8, count = 1, notice = true, hundred = 8}, --8转首饰
						{itemid = 1392, prob = 8, count = 1, notice = true, hundred = 8}, --8转首饰
						{itemid = 1450, prob = 7, count = 1, notice = true, hundred = 7}, --8转首饰
					},
				},
				{
					money = 188000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 12,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1160, prob = 9, count = 1, notice = true, hundred = 9}, --8转首饰
						{itemid = 1218, prob = 9, count = 1, notice = true, hundred = 9}, --8转首饰
						{itemid = 1276, prob = 8, count = 1, notice = true, hundred = 8}, --8转首饰
						{itemid = 1334, prob = 8, count = 1, notice = true, hundred = 8}, --8转首饰
						{itemid = 1392, prob = 8, count = 1, notice = true, hundred = 8}, --8转首饰
						{itemid = 1450, prob = 7, count = 1, notice = true, hundred = 7}, --8转首饰
					},
				},
				{
					count = 200,	--寻宝次数大于此值才会进入
					maxcount = 250,	--寻宝次数等于此值必定进入
					limit = 1,		--限制进入次数,-1为不限制
					prob = 16,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 2201, prob = 26, count = 1, notice = true, hundred = 26},  --欢
						{itemid = 2200, prob = 10, count = 1, notice = true, hundred = 10},  --狂
						{itemid = 2199, prob = 3, count = 1, notice = true, hundred = 3},   --民
						{itemid = 2198, prob = 1, count = 1, notice = true, hundred = 1},   --全
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

						{itemid = 2276, prob = 28888, count = 1, notice = true, broadcast = true, hundred = 25888}, --铁血武器        
						{itemid = 2277, prob = 28668, count = 1, notice = true, broadcast = true, hundred = 25668}, --铁血衣服(男)
						{itemid = 2284, prob = 28588, count = 1, notice = true, broadcast = true, hundred = 25588}, --铁血衣服(女)

						{itemid = 984 , prob = 59888, count = 1, notice = true, broadcast = true, hundred = 59888}, --8转武器        
						{itemid = 1055, prob = 58888, count = 1, notice = true, broadcast = true, hundred = 58888}, --8转衣服(男)
						{itemid = 1056, prob = 58585, count = 1, notice = true, broadcast = true, hundred = 58585}, --8转衣服(女)

						{itemid = 983 , prob = 23888, count = 1, notice = true, broadcast = true, hundred = 23888}, --傲视狂舞斩    
						{itemid = 1053, prob = 22888, count = 1, notice = true, broadcast = true, hundred = 22888}, --傲视狂舞甲(男)
						{itemid = 1054, prob = 22588, count = 1, notice = true, broadcast = true, hundred = 22588}, --傲视狂舞甲(女)

						{itemid = 1160, prob = 19888, count = 1, notice = true, hundred = 19888}, --8转首饰    
						{itemid = 1218, prob = 18888, count = 1, notice = true, hundred = 18888}, --8转首饰
						{itemid = 1276, prob = 18585, count = 1, notice = true, hundred = 18585}, --8转首饰
						{itemid = 1334, prob = 19888, count = 1, notice = true, hundred = 19888}, --8转首饰    
						{itemid = 1392, prob = 18888, count = 1, notice = true, hundred = 18888}, --8转首饰
						{itemid = 1450, prob = 18585, count = 1, notice = true, hundred = 18585}, --8转首饰

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

						{itemid = 2209, prob = 16888, count = 1, notice = true, hundred = 15888}, --盾牌碎片(特)
						{itemid = 2213, prob = 16887, count = 1, notice = true, hundred = 15887}, --宝石碎片(特)
						{itemid = 2217, prob = 16886, count = 1, notice = true, hundred = 15886}, --魂珠碎片(特)
						{itemid = 566 , prob = 16885, count = 1, notice = true, hundred = 15885}, --超级转生丹  
						{itemid = 163 , prob = 16884, count = 1, notice = true, hundred = 15884}, --超级成就令牌
						{itemid = 162 , prob = 16883, count = 1, notice = true, hundred = 15883}, --超级灵力丹  
						{itemid = 675 , prob = 16882, count = 1, notice = true, hundred = 15882}, --999朵玫瑰花 
						{itemid = 528 , prob = 16881, count = 1, notice = true, hundred = 15881}, --特戒碎片包  
						{itemid = 2225, prob = 16880, count = 1, notice = true, hundred = 15880}, --护符碎片(特)

						{itemid = 1158, prob = 8888, count = 1, notice = true, hundred = 8888},  --4转首饰
						{itemid = 1216, prob = 8878, count = 1, notice = true, hundred = 8878},  --4转首饰
						{itemid = 1274, prob = 8868, count = 1, notice = true, hundred = 8868},  --4转首饰
						{itemid = 1332, prob = 8858, count = 1, notice = true, hundred = 8858},  --4转首饰
						{itemid = 1390, prob = 8848, count = 1, notice = true, hundred = 8848},  --4转首饰
						{itemid = 1448, prob = 8838, count = 1, notice = true, hundred = 8838},  --4转首饰

						{itemid = 1177, prob = 8888, count = 1, notice = true, hundred = 8888}, --4转首饰
						{itemid = 1235, prob = 8878, count = 1, notice = true, hundred = 8878}, --4转首饰
						{itemid = 1293, prob = 8868, count = 1, notice = true, hundred = 8868}, --4转首饰
						{itemid = 1351, prob = 8858, count = 1, notice = true, hundred = 8858}, --4转首饰
						{itemid = 1409, prob = 8848, count = 1, notice = true, hundred = 8848}, --4转首饰
						{itemid = 1467, prob = 8838, count = 1, notice = true, hundred = 8838}, --4转首饰

						{itemid = 1196, prob = 8888, count = 1, notice = true, hundred = 8888}, --4转首饰
						{itemid = 1254, prob = 8878, count = 1, notice = true, hundred = 8878}, --4转首饰
						{itemid = 1312, prob = 8868, count = 1, notice = true, hundred = 8868}, --4转首饰
						{itemid = 1370, prob = 8858, count = 1, notice = true, hundred = 8858}, --4转首饰
						{itemid = 1428, prob = 8848, count = 1, notice = true, hundred = 8848}, --4转首饰
						{itemid = 1486, prob = 8838, count = 1, notice = true, hundred = 8838}, --4转首饰

						{itemid = 981 , prob = 3288, count = 1, notice = true, hundred = 3288}, --轩辕神剑    
						{itemid = 1049, prob = 3290, count = 1, notice = true, hundred = 3290}, --轩辕神甲(男)
						{itemid = 1050, prob = 3280, count = 1, notice = true, hundred = 3280}, --轩辕神甲(女)
						{itemid = 1000, prob = 3288, count = 1, notice = true, hundred = 3288}, --轩辕神剑    
						{itemid = 1087, prob = 3290, count = 1, notice = true, hundred = 3290}, --轩辕神甲(男)
						{itemid = 1088, prob = 3280, count = 1, notice = true, hundred = 3280}, --轩辕神甲(女)
						{itemid = 1019, prob = 3288, count = 1, notice = true, hundred = 3288}, --轩辕神剑    
						{itemid = 1125, prob = 3290, count = 1, notice = true, hundred = 3290}, --轩辕神甲(男)
						{itemid = 1126, prob = 3280, count = 1, notice = true, hundred = 3280}, --轩辕神甲(女)

						{itemid = 2203, prob = 3188, count = 1, notice = true, hundred = 3188},--神器碎片
						{itemid = 2204, prob = 3088, count = 1, notice = true, hundred = 3088},--神甲碎片

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

						{itemid = 979 , prob = 168, count = 1, notice = false, hundred = 168}, --修罗之刃      
						{itemid = 1045, prob = 165, count = 1, notice = false, hundred = 165}, --修罗战甲(男)  
						{itemid = 1046, prob = 162, count = 1, notice = false, hundred = 162}, --修罗战甲(女)  
						{itemid = 998 , prob = 167, count = 1, notice = false, hundred = 167}, --修罗之刃      
						{itemid = 1083, prob = 164, count = 1, notice = false, hundred = 164}, --修罗战甲(男)  
						{itemid = 1084, prob = 161, count = 1, notice = false, hundred = 161}, --修罗战甲(女)  
						{itemid = 1017, prob = 166, count = 1, notice = false, hundred = 166}, --修罗之刃      
						{itemid = 1121, prob = 163, count = 1, notice = false, hundred = 163}, --修罗战甲(男)  
						{itemid = 1122, prob = 160, count = 1, notice = false, hundred = 160}, --修罗战甲(女)  

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

						{itemid = 2197, prob = 20, count = 1, notice = false, hundred = 20},    --典
						{itemid = 2196, prob = 19, count = 1, notice = false, hundred = 19},    --庆
						{itemid = 2172, prob = 17, count = 1, notice = false, hundred = 17},    --年
						{itemid = 2171, prob = 15, count = 1, notice = false, hundred = 15},    --周
						{itemid = 2110, prob = 15, count = 1, notice = false, hundred = 15}, --一级暴击宝石 
						{itemid = 2110, prob = 8, count = 1, notice = false, hundred = 15}, --一级暴击宝石 
						{itemid = 513 , prob = 1 , count = 1, notice = false, hundred = 1 }, --经验丹(大)    
					},
				},
			},
			--法师
			{
				{
					money = 2400,		--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 5,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1157, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1215, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1273, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1331, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1389, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1447, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1176, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1234, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1292, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1350, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1408, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1466, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1195, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1253, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1311, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1369, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1427, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1485, prob = 18, count = 1, notice = true, hundred = 18},
					},
				},

				{
					money = 8000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 8,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1158, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1216, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1274, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1332, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1390, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1448, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1177, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1235, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1293, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1351, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1409, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1467, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1196, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1254, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1312, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1370, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1428, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1486, prob = 23, count = 1, notice = true, hundred = 23},
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
						{itemid = 1159, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1217, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1275, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1333, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1391, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1449, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1178, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1236, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1294, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1352, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1410, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1468, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1197, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1255, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1313, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1371, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1429, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1487, prob = 28, count = 1, notice = true, hundred = 28},
					},
				},
				{
					money = 45000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1158, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1216, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1274, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1332, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1390, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1448, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1177, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1235, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1293, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1351, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1409, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1467, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1196, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1254, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1312, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1370, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1428, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1486, prob = 23, count = 1, notice = true, hundred = 23},
					},
				},
				{
					money = 65000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 15,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1159, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1217, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1275, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1333, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1391, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1449, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1178, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1236, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1294, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1352, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1410, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1468, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1197, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1255, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1313, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1371, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1429, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1487, prob = 23, count = 1, notice = true, hundred = 23},
					},
				},
				{
					money = 80000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1158, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1216, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1274, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1332, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1390, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1448, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1177, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1235, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1293, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1351, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1409, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1467, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1196, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1254, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1312, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1370, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1428, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1486, prob = 23, count = 1, notice = true, hundred = 23},
					},
				},
				{
					money = 98000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 15,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1179, prob = 9, count = 1, notice = true, hundred = 9}, --8转首饰
						{itemid = 1237, prob = 9, count = 1, notice = true, hundred = 9}, --8转首饰
						{itemid = 1295, prob = 8, count = 1, notice = true, hundred = 8}, --8转首饰
						{itemid = 1353, prob = 8, count = 1, notice = true, hundred = 8}, --8转首饰
						{itemid = 1411, prob = 8, count = 1, notice = true, hundred = 8}, --8转首饰
						{itemid = 1469, prob = 7, count = 1, notice = true, hundred = 7}, --8转首饰
					},
				},
				{
					money = 188000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 12,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1179, prob = 9, count = 1, notice = true, hundred = 9}, --8转首饰
						{itemid = 1237, prob = 9, count = 1, notice = true, hundred = 9}, --8转首饰
						{itemid = 1295, prob = 8, count = 1, notice = true, hundred = 8}, --8转首饰
						{itemid = 1353, prob = 8, count = 1, notice = true, hundred = 8}, --8转首饰
						{itemid = 1411, prob = 8, count = 1, notice = true, hundred = 8}, --8转首饰
						{itemid = 1469, prob = 7, count = 1, notice = true, hundred = 7}, --8转首饰
					},
				},
				{
					count = 200,	--寻宝次数大于此值才会进入
					maxcount = 250,	--寻宝次数等于此值必定进入
					limit = 1,		--限制进入次数,-1为不限制
					prob = 16,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 2201, prob = 26, count = 1, notice = true, hundred = 26},  --欢
						{itemid = 2200, prob = 10, count = 1, notice = true, hundred = 10},  --狂
						{itemid = 2199, prob = 3, count = 1, notice = true, hundred = 3},   --民
						{itemid = 2198, prob = 1, count = 1, notice = true, hundred = 1},   --全
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
						{itemid = 2276, prob = 28888, count = 1, notice = true, broadcast = true, hundred = 25888}, --铁血武器        
						{itemid = 2277, prob = 28668, count = 1, notice = true, broadcast = true, hundred = 25668}, --铁血衣服(男)
						{itemid = 2284, prob = 28588, count = 1, notice = true, broadcast = true, hundred = 25588}, --铁血衣服(女)

						{itemid = 1003, prob = 59888, count = 1, notice = true, broadcast = true, hundred = 59888}, --8转武器    
						{itemid = 1093, prob = 58888, count = 1, notice = true, broadcast = true, hundred = 58888}, --8转衣服(男)
						{itemid = 1094, prob = 58585, count = 1, notice = true, broadcast = true, hundred = 58585}, --8转衣服(女)

						{itemid = 1002, prob = 22886, count = 1, notice = true, broadcast = true, hundred = 22886}, --傲视狂舞斩    
						{itemid = 1091, prob = 22883, count = 1, notice = true, broadcast = true, hundred = 22883}, --傲视狂舞甲(男)
						{itemid = 1092, prob = 22586, count = 1, notice = true, broadcast = true, hundred = 22586}, --傲视狂舞甲(女)

						{itemid = 1179, prob = 19888, count = 1, notice = true, hundred = 19888}, --8转首饰
						{itemid = 1237, prob = 18888, count = 1, notice = true, hundred = 18888}, --8转首饰
						{itemid = 1295, prob = 18585, count = 1, notice = true, hundred = 18585}, --8转首饰
						{itemid = 1353, prob = 19888, count = 1, notice = true, hundred = 19888}, --8转首饰
						{itemid = 1411, prob = 18888, count = 1, notice = true, hundred = 18888}, --8转首饰
						{itemid = 1469, prob = 18585, count = 1, notice = true, hundred = 18585}, --8转首饰

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

						{itemid = 2209, prob = 16888, count = 1, notice = true, hundred = 15888}, --盾牌碎片(特)
						{itemid = 2213, prob = 16887, count = 1, notice = true, hundred = 15887}, --宝石碎片(特)
						{itemid = 2217, prob = 16886, count = 1, notice = true, hundred = 15886}, --魂珠碎片(特)
						{itemid = 566 , prob = 16885, count = 1, notice = true, hundred = 15885}, --超级转生丹  
						{itemid = 163 , prob = 16884, count = 1, notice = true, hundred = 15884}, --超级成就令牌
						{itemid = 162 , prob = 16883, count = 1, notice = true, hundred = 15883}, --超级灵力丹  
						{itemid = 675 , prob = 16882, count = 1, notice = true, hundred = 15882}, --999朵玫瑰花 
						{itemid = 528 , prob = 16881, count = 1, notice = true, hundred = 15881}, --特戒碎片包  
						{itemid = 2225, prob = 16880, count = 1, notice = true, hundred = 15880}, --护符碎片(特)

						{itemid = 1158, prob = 8888, count = 1, notice = true, hundred = 8888},  --4转首饰
						{itemid = 1216, prob = 8878, count = 1, notice = true, hundred = 8878},  --4转首饰
						{itemid = 1274, prob = 8868, count = 1, notice = true, hundred = 8868},  --4转首饰
						{itemid = 1332, prob = 8858, count = 1, notice = true, hundred = 8858},  --4转首饰
						{itemid = 1390, prob = 8848, count = 1, notice = true, hundred = 8848},  --4转首饰
						{itemid = 1448, prob = 8838, count = 1, notice = true, hundred = 8838},  --4转首饰

						{itemid = 1177, prob = 8888, count = 1, notice = true, hundred = 8888}, --4转首饰
						{itemid = 1235, prob = 8878, count = 1, notice = true, hundred = 8878}, --4转首饰
						{itemid = 1293, prob = 8868, count = 1, notice = true, hundred = 8868}, --4转首饰
						{itemid = 1351, prob = 8858, count = 1, notice = true, hundred = 8858}, --4转首饰
						{itemid = 1409, prob = 8848, count = 1, notice = true, hundred = 8848}, --4转首饰
						{itemid = 1467, prob = 8838, count = 1, notice = true, hundred = 8838}, --4转首饰

						{itemid = 1196, prob = 8888, count = 1, notice = true, hundred = 8888}, --4转首饰
						{itemid = 1254, prob = 8878, count = 1, notice = true, hundred = 8878}, --4转首饰
						{itemid = 1312, prob = 8868, count = 1, notice = true, hundred = 8868}, --4转首饰
						{itemid = 1370, prob = 8858, count = 1, notice = true, hundred = 8858}, --4转首饰
						{itemid = 1428, prob = 8848, count = 1, notice = true, hundred = 8848}, --4转首饰
						{itemid = 1486, prob = 8838, count = 1, notice = true, hundred = 8838}, --4转首饰

						{itemid = 981 , prob = 3288, count = 1, notice = true, hundred = 3288}, --轩辕神剑    
						{itemid = 1049, prob = 3290, count = 1, notice = true, hundred = 3290}, --轩辕神甲(男)
						{itemid = 1050, prob = 3280, count = 1, notice = true, hundred = 3280}, --轩辕神甲(女)
						{itemid = 1000, prob = 3288, count = 1, notice = true, hundred = 3288}, --轩辕神剑    
						{itemid = 1087, prob = 3290, count = 1, notice = true, hundred = 3290}, --轩辕神甲(男)
						{itemid = 1088, prob = 3280, count = 1, notice = true, hundred = 3280}, --轩辕神甲(女)
						{itemid = 1019, prob = 3288, count = 1, notice = true, hundred = 3288}, --轩辕神剑    
						{itemid = 1125, prob = 3290, count = 1, notice = true, hundred = 3290}, --轩辕神甲(男)
						{itemid = 1126, prob = 3280, count = 1, notice = true, hundred = 3280}, --轩辕神甲(女)

						{itemid = 2203, prob = 3188, count = 1, notice = true, hundred = 3188},--神器碎片
						{itemid = 2204, prob = 3088, count = 1, notice = true, hundred = 3088},--神甲碎片

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

						{itemid = 979 , prob = 168, count = 1, notice = false, hundred = 168}, --修罗之刃      
						{itemid = 1045, prob = 165, count = 1, notice = false, hundred = 165}, --修罗战甲(男)  
						{itemid = 1046, prob = 162, count = 1, notice = false, hundred = 162}, --修罗战甲(女)  
						{itemid = 998 , prob = 167, count = 1, notice = false, hundred = 167}, --修罗之刃      
						{itemid = 1083, prob = 164, count = 1, notice = false, hundred = 164}, --修罗战甲(男)  
						{itemid = 1084, prob = 161, count = 1, notice = false, hundred = 161}, --修罗战甲(女)  
						{itemid = 1017, prob = 166, count = 1, notice = false, hundred = 166}, --修罗之刃      
						{itemid = 1121, prob = 163, count = 1, notice = false, hundred = 163}, --修罗战甲(男)  
						{itemid = 1122, prob = 160, count = 1, notice = false, hundred = 160}, --修罗战甲(女)  

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

						{itemid = 2197, prob = 20, count = 1, notice = false, hundred = 20},    --典
						{itemid = 2196, prob = 19, count = 1, notice = false, hundred = 19},    --庆
						{itemid = 2172, prob = 17, count = 1, notice = false, hundred = 17},    --年
						{itemid = 2171, prob = 15, count = 1, notice = false, hundred = 15},    --周
						{itemid = 2110, prob = 15, count = 1, notice = false, hundred = 15}, --一级暴击宝石 
						{itemid = 2110, prob = 8, count = 1, notice = false, hundred = 15}, --一级暴击宝石 
						{itemid = 513 , prob = 1 , count = 1, notice = false, hundred = 1 }, --经验丹(大)    
					},
				},
			},
			--道士
			{
				{
					money = 2400,		--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 5,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1157, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1215, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1273, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1331, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1389, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1447, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1176, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1234, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1292, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1350, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1408, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1466, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1195, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1253, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1311, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1369, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1427, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1485, prob = 18, count = 1, notice = true, hundred = 18},
					},
				},

				{
					money = 8000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 8,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1158, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1216, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1274, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1332, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1390, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1448, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1177, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1235, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1293, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1351, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1409, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1467, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1196, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1254, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1312, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1370, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1428, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1486, prob = 23, count = 1, notice = true, hundred = 23},
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
						{itemid = 1159, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1217, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1275, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1333, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1391, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1449, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1178, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1236, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1294, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1352, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1410, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1468, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1197, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1255, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1313, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1371, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1429, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1487, prob = 28, count = 1, notice = true, hundred = 28},
					},
				},
				{
					money = 45000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1158, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1216, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1274, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1332, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1390, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1448, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1177, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1235, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1293, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1351, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1409, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1467, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1196, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1254, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1312, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1370, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1428, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1486, prob = 23, count = 1, notice = true, hundred = 23},
					},
				},
				{
					money = 65000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 15,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1159, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1217, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1275, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1333, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1391, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1449, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1178, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1236, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1294, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1352, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1410, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1468, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1197, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1255, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1313, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1371, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1429, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1487, prob = 28, count = 1, notice = true, hundred = 28},
					},
				},
				{
					money = 80000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1158, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1216, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1274, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1332, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1390, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1448, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1177, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1235, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1293, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1351, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1409, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1467, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1196, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1254, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1312, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1370, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1428, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1486, prob = 23, count = 1, notice = true, hundred = 23},
					},
				},
				{
					money = 98000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 15,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1198, prob = 9, count = 1, notice = true, hundred = 9}, --8转首饰
						{itemid = 1256, prob = 9, count = 1, notice = true, hundred = 9}, --8转首饰
						{itemid = 1314, prob = 8, count = 1, notice = true, hundred = 8}, --8转首饰
						{itemid = 1372, prob = 8, count = 1, notice = true, hundred = 8}, --8转首饰
						{itemid = 1430, prob = 8, count = 1, notice = true, hundred = 8}, --8转首饰
						{itemid = 1488, prob = 7, count = 1, notice = true, hundred = 7}, --8转首饰
					},
				},
				{
					money = 188000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 12,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1198, prob = 9, count = 1, notice = true, hundred = 9}, --8转首饰
						{itemid = 1256, prob = 9, count = 1, notice = true, hundred = 9}, --8转首饰
						{itemid = 1314, prob = 8, count = 1, notice = true, hundred = 8}, --8转首饰
						{itemid = 1372, prob = 8, count = 1, notice = true, hundred = 8}, --8转首饰
						{itemid = 1430, prob = 8, count = 1, notice = true, hundred = 8}, --8转首饰
						{itemid = 1488, prob = 7, count = 1, notice = true, hundred = 7}, --8转首饰
					},
				},
				{
					count = 200,	--寻宝次数大于此值才会进入
					maxcount = 250,	--寻宝次数等于此值必定进入
					limit = 1,		--限制进入次数,-1为不限制
					prob = 16,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 2201, prob = 26, count = 1, notice = true, hundred = 26},  --欢
						{itemid = 2200, prob = 10, count = 1, notice = true, hundred = 10},  --狂
						{itemid = 2199, prob = 3, count = 1, notice = true, hundred = 3},   --民
						{itemid = 2198, prob = 1, count = 1, notice = true, hundred = 1},   --全
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
						{itemid = 2276, prob = 28888, count = 1, notice = true, broadcast = true, hundred = 25888}, --铁血武器        
						{itemid = 2277, prob = 28668, count = 1, notice = true, broadcast = true, hundred = 25668}, --铁血衣服(男)
						{itemid = 2284, prob = 28588, count = 1, notice = true, broadcast = true, hundred = 25588}, --铁血衣服(女)

						{itemid = 1022, prob = 59888, count = 1, notice = true, broadcast = true, hundred = 59888}, --8转武器    
						{itemid = 1131, prob = 58888, count = 1, notice = true, broadcast = true, hundred = 58888}, --8转衣服(男)
						{itemid = 1132, prob = 58585, count = 1, notice = true, broadcast = true, hundred = 58585}, --8转衣服(女)

						{itemid = 1021, prob = 22885, count = 1, notice = true, broadcast = true, hundred = 22885}, --傲视狂舞斩    
						{itemid = 1129, prob = 22882, count = 1, notice = true, broadcast = true, hundred = 22882}, --傲视狂舞甲(男)
						{itemid = 1130, prob = 22585, count = 1, notice = true, broadcast = true, hundred = 22585}, --傲视狂舞甲(女)

						{itemid = 1198, prob = 19888, count = 1, notice = true, hundred = 19888}, --8转首饰
						{itemid = 1256, prob = 18888, count = 1, notice = true, hundred = 18888}, --8转首饰
						{itemid = 1314, prob = 18585, count = 1, notice = true, hundred = 18585}, --8转首饰
						{itemid = 1372, prob = 19888, count = 1, notice = true, hundred = 19888}, --8转首饰
						{itemid = 1430, prob = 18888, count = 1, notice = true, hundred = 18888}, --8转首饰
						{itemid = 1488, prob = 18585, count = 1, notice = true, hundred = 18585}, --8转首饰

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

						{itemid = 2209, prob = 16888, count = 1, notice = true, hundred = 15888}, --盾牌碎片(特)
						{itemid = 2213, prob = 16887, count = 1, notice = true, hundred = 15887}, --宝石碎片(特)
						{itemid = 2217, prob = 16886, count = 1, notice = true, hundred = 15886}, --魂珠碎片(特)
						{itemid = 566 , prob = 16885, count = 1, notice = true, hundred = 15885}, --超级转生丹  
						{itemid = 163 , prob = 16884, count = 1, notice = true, hundred = 15884}, --超级成就令牌
						{itemid = 162 , prob = 16883, count = 1, notice = true, hundred = 15883}, --超级灵力丹  
						{itemid = 675 , prob = 16882, count = 1, notice = true, hundred = 15882}, --999朵玫瑰花 
						{itemid = 528 , prob = 16881, count = 1, notice = true, hundred = 15881}, --特戒碎片包  
						{itemid = 2225, prob = 16880, count = 1, notice = true, hundred = 15880}, --护符碎片(特)

						{itemid = 1158, prob = 8888, count = 1, notice = true, hundred = 8888},  --4转首饰
						{itemid = 1216, prob = 8878, count = 1, notice = true, hundred = 8878},  --4转首饰
						{itemid = 1274, prob = 8868, count = 1, notice = true, hundred = 8868},  --4转首饰
						{itemid = 1332, prob = 8858, count = 1, notice = true, hundred = 8858},  --4转首饰
						{itemid = 1390, prob = 8848, count = 1, notice = true, hundred = 8848},  --4转首饰
						{itemid = 1448, prob = 8838, count = 1, notice = true, hundred = 8838},  --4转首饰

						{itemid = 1177, prob = 8888, count = 1, notice = true, hundred = 8888}, --4转首饰
						{itemid = 1235, prob = 8878, count = 1, notice = true, hundred = 8878}, --4转首饰
						{itemid = 1293, prob = 8868, count = 1, notice = true, hundred = 8868}, --4转首饰
						{itemid = 1351, prob = 8858, count = 1, notice = true, hundred = 8858}, --4转首饰
						{itemid = 1409, prob = 8848, count = 1, notice = true, hundred = 8848}, --4转首饰
						{itemid = 1467, prob = 8838, count = 1, notice = true, hundred = 8838}, --4转首饰

						{itemid = 1196, prob = 8888, count = 1, notice = true, hundred = 8888}, --4转首饰
						{itemid = 1254, prob = 8878, count = 1, notice = true, hundred = 8878}, --4转首饰
						{itemid = 1312, prob = 8868, count = 1, notice = true, hundred = 8868}, --4转首饰
						{itemid = 1370, prob = 8858, count = 1, notice = true, hundred = 8858}, --4转首饰
						{itemid = 1428, prob = 8848, count = 1, notice = true, hundred = 8848}, --4转首饰
						{itemid = 1486, prob = 8838, count = 1, notice = true, hundred = 8838}, --4转首饰

						{itemid = 2203, prob = 3188, count = 1, notice = true, hundred = 3188},--神器碎片
						{itemid = 2204, prob = 3088, count = 1, notice = true, hundred = 3088},--神甲碎片

						{itemid = 981 , prob = 3288, count = 1, notice = true, hundred = 3288}, --轩辕神剑    
						{itemid = 1049, prob = 3290, count = 1, notice = true, hundred = 3290}, --轩辕神甲(男)
						{itemid = 1050, prob = 3280, count = 1, notice = true, hundred = 3280}, --轩辕神甲(女)
						{itemid = 1000, prob = 3288, count = 1, notice = true, hundred = 3288}, --轩辕神剑    
						{itemid = 1087, prob = 3290, count = 1, notice = true, hundred = 3290}, --轩辕神甲(男)
						{itemid = 1088, prob = 3280, count = 1, notice = true, hundred = 3280}, --轩辕神甲(女)
						{itemid = 1019, prob = 3288, count = 1, notice = true, hundred = 3288}, --轩辕神剑    
						{itemid = 1125, prob = 3290, count = 1, notice = true, hundred = 3290}, --轩辕神甲(男)
						{itemid = 1126, prob = 3280, count = 1, notice = true, hundred = 3280}, --轩辕神甲(女)

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

						{itemid = 979 , prob = 168, count = 1, notice = false, hundred = 168}, --修罗之刃      
						{itemid = 1045, prob = 165, count = 1, notice = false, hundred = 165}, --修罗战甲(男)  
						{itemid = 1046, prob = 162, count = 1, notice = false, hundred = 162}, --修罗战甲(女)  
						{itemid = 998 , prob = 167, count = 1, notice = false, hundred = 167}, --修罗之刃      
						{itemid = 1083, prob = 164, count = 1, notice = false, hundred = 164}, --修罗战甲(男)  
						{itemid = 1084, prob = 161, count = 1, notice = false, hundred = 161}, --修罗战甲(女)  
						{itemid = 1017, prob = 166, count = 1, notice = false, hundred = 166}, --修罗之刃      
						{itemid = 1121, prob = 163, count = 1, notice = false, hundred = 163}, --修罗战甲(男)  
						{itemid = 1122, prob = 160, count = 1, notice = false, hundred = 160}, --修罗战甲(女)  

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

						{itemid = 2197, prob = 20, count = 1, notice = false, hundred = 20},    --典
						{itemid = 2196, prob = 19, count = 1, notice = false, hundred = 19},    --庆
						{itemid = 2172, prob = 17, count = 1, notice = false, hundred = 17},    --年
						{itemid = 2171, prob = 15, count = 1, notice = false, hundred = 15},    --周
						{itemid = 2110, prob = 15, count = 1, notice = false, hundred = 15}, --一级暴击宝石 
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
					money = 2400,		--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 5,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1157, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1215, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1273, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1331, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1389, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1447, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1176, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1234, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1292, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1350, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1408, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1466, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1195, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1253, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1311, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1369, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1427, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1485, prob = 18, count = 1, notice = true, hundred = 18},
					},
				},

				{
					money = 8000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 8,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1158, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1216, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1274, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1332, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1390, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1448, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1177, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1235, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1293, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1351, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1409, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1467, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1196, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1254, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1312, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1370, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1428, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1486, prob = 23, count = 1, notice = true, hundred = 23},
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
						{itemid = 1159, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1217, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1275, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1333, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1391, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1449, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1178, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1236, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1294, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1352, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1410, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1468, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1197, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1255, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1313, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1371, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1429, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1487, prob = 28, count = 1, notice = true, hundred = 28},
					},
				},
				{
					money = 45000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 8,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1158, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1216, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1274, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1332, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1390, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1448, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1177, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1235, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1293, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1351, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1409, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1467, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1196, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1254, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1312, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1370, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1428, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1486, prob = 23, count = 1, notice = true, hundred = 23},
					},
				},
				{
					money = 65000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 15,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1159, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1217, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1275, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1333, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1391, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1449, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1178, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1236, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1294, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1352, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1410, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1468, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1197, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1255, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1313, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1371, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1429, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1487, prob = 28, count = 1, notice = true, hundred = 28},
					},
				},
				{
					money = 80000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1158, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1216, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1274, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1332, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1390, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1448, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1177, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1235, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1293, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1351, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1409, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1467, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1196, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1254, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1312, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1370, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1428, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1486, prob = 23, count = 1, notice = true, hundred = 23},
					},
				},
				{
					money = 98000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 8,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1160, prob = 9, count = 1, notice = true, hundred = 9}, --8转首饰
						{itemid = 1218, prob = 9, count = 1, notice = true, hundred = 9}, --8转首饰
						{itemid = 1276, prob = 8, count = 1, notice = true, hundred = 8}, --8转首饰
						{itemid = 1334, prob = 8, count = 1, notice = true, hundred = 8}, --8转首饰
						{itemid = 1392, prob = 8, count = 1, notice = true, hundred = 8}, --8转首饰
						{itemid = 1450, prob = 7, count = 1, notice = true, hundred = 7}, --8转首饰
					},
				},
				{
					money = 188000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 12,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1160, prob = 9, count = 1, notice = true, hundred = 9}, --8转首饰
						{itemid = 1218, prob = 9, count = 1, notice = true, hundred = 9}, --8转首饰
						{itemid = 1276, prob = 8, count = 1, notice = true, hundred = 8}, --8转首饰
						{itemid = 1334, prob = 8, count = 1, notice = true, hundred = 8}, --8转首饰
						{itemid = 1392, prob = 8, count = 1, notice = true, hundred = 8}, --8转首饰
						{itemid = 1450, prob = 7, count = 1, notice = true, hundred = 7}, --8转首饰
					},
				},
				{
					count = 200,	--寻宝次数大于此值才会进入
					maxcount = 250,	--寻宝次数等于此值必定进入
					limit = 1,		--限制进入次数,-1为不限制
					prob = 16,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 2201, prob = 26, count = 1, notice = true, hundred = 26},  --欢
						{itemid = 2200, prob = 10, count = 1, notice = true, hundred = 10},  --狂
						{itemid = 2199, prob = 3, count = 1, notice = true, hundred = 3},   --民
						{itemid = 2198, prob = 1, count = 1, notice = true, hundred = 1},   --全
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

						{itemid = 2276, prob = 28888, count = 1, notice = true, broadcast = true, hundred = 25888}, --铁血武器        
						{itemid = 2277, prob = 28668, count = 1, notice = true, broadcast = true, hundred = 25668}, --铁血衣服(男)
						{itemid = 2284, prob = 28588, count = 1, notice = true, broadcast = true, hundred = 25588}, --铁血衣服(女)

						{itemid = 984 , prob = 59888, count = 1, notice = true, broadcast = true, hundred = 59888}, --8转武器        
						{itemid = 1055, prob = 58888, count = 1, notice = true, broadcast = true, hundred = 58888}, --8转衣服(男)
						{itemid = 1056, prob = 58585, count = 1, notice = true, broadcast = true, hundred = 58585}, --8转衣服(女)

						{itemid = 983 , prob = 23888, count = 1, notice = true, broadcast = true, hundred = 23888}, --傲视狂舞斩    
						{itemid = 1053, prob = 22888, count = 1, notice = true, broadcast = true, hundred = 22888}, --傲视狂舞甲(男)
						{itemid = 1054, prob = 22588, count = 1, notice = true, broadcast = true, hundred = 22588}, --傲视狂舞甲(女)

						{itemid = 1160, prob = 19888, count = 1, notice = true, hundred = 19888}, --8转首饰    
						{itemid = 1218, prob = 18888, count = 1, notice = true, hundred = 18888}, --8转首饰
						{itemid = 1276, prob = 18585, count = 1, notice = true, hundred = 18585}, --8转首饰
						{itemid = 1334, prob = 19888, count = 1, notice = true, hundred = 19888}, --8转首饰    
						{itemid = 1392, prob = 18888, count = 1, notice = true, hundred = 18888}, --8转首饰
						{itemid = 1450, prob = 18585, count = 1, notice = true, hundred = 18585}, --8转首饰

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

						{itemid = 2209, prob = 16888, count = 1, notice = true, hundred = 15888}, --盾牌碎片(特)
						{itemid = 2213, prob = 16887, count = 1, notice = true, hundred = 15887}, --宝石碎片(特)
						{itemid = 2217, prob = 16886, count = 1, notice = true, hundred = 15886}, --魂珠碎片(特)
						{itemid = 566 , prob = 16885, count = 1, notice = true, hundred = 15885}, --超级转生丹  
						{itemid = 163 , prob = 16884, count = 1, notice = true, hundred = 15884}, --超级成就令牌
						{itemid = 162 , prob = 16883, count = 1, notice = true, hundred = 15883}, --超级灵力丹  
						{itemid = 675 , prob = 16882, count = 1, notice = true, hundred = 15882}, --999朵玫瑰花 
						{itemid = 528 , prob = 16881, count = 1, notice = true, hundred = 15881}, --特戒碎片包  
						{itemid = 2225, prob = 16880, count = 1, notice = true, hundred = 15880}, --护符碎片(特)

						{itemid = 1158, prob = 8888, count = 1, notice = true, hundred = 8888},  --4转首饰
						{itemid = 1216, prob = 8878, count = 1, notice = true, hundred = 8878},  --4转首饰
						{itemid = 1274, prob = 8868, count = 1, notice = true, hundred = 8868},  --4转首饰
						{itemid = 1332, prob = 8858, count = 1, notice = true, hundred = 8858},  --4转首饰
						{itemid = 1390, prob = 8848, count = 1, notice = true, hundred = 8848},  --4转首饰
						{itemid = 1448, prob = 8838, count = 1, notice = true, hundred = 8838},  --4转首饰

						{itemid = 1177, prob = 8888, count = 1, notice = true, hundred = 8888}, --4转首饰
						{itemid = 1235, prob = 8878, count = 1, notice = true, hundred = 8878}, --4转首饰
						{itemid = 1293, prob = 8868, count = 1, notice = true, hundred = 8868}, --4转首饰
						{itemid = 1351, prob = 8858, count = 1, notice = true, hundred = 8858}, --4转首饰
						{itemid = 1409, prob = 8848, count = 1, notice = true, hundred = 8848}, --4转首饰
						{itemid = 1467, prob = 8838, count = 1, notice = true, hundred = 8838}, --4转首饰

						{itemid = 1196, prob = 8888, count = 1, notice = true, hundred = 8888}, --4转首饰
						{itemid = 1254, prob = 8878, count = 1, notice = true, hundred = 8878}, --4转首饰
						{itemid = 1312, prob = 8868, count = 1, notice = true, hundred = 8868}, --4转首饰
						{itemid = 1370, prob = 8858, count = 1, notice = true, hundred = 8858}, --4转首饰
						{itemid = 1428, prob = 8848, count = 1, notice = true, hundred = 8848}, --4转首饰
						{itemid = 1486, prob = 8838, count = 1, notice = true, hundred = 8838}, --4转首饰

						{itemid = 2203, prob = 3188, count = 1, notice = true, hundred = 3188},--神器碎片
						{itemid = 2204, prob = 3088, count = 1, notice = true, hundred = 3088},--神甲碎片

						{itemid = 981 , prob = 2888, count = 1, notice = true, hundred = 2888}, --轩辕神剑    
						{itemid = 1049, prob = 2885, count = 1, notice = true, hundred = 2885}, --轩辕神甲(男)
						{itemid = 1050, prob = 2880, count = 1, notice = true, hundred = 2880}, --轩辕神甲(女)
						{itemid = 1000, prob = 2888, count = 1, notice = true, hundred = 2888}, --轩辕神剑    
						{itemid = 1087, prob = 2885, count = 1, notice = true, hundred = 2885}, --轩辕神甲(男)
						{itemid = 1088, prob = 2880, count = 1, notice = true, hundred = 2880}, --轩辕神甲(女)
						{itemid = 1019, prob = 2888, count = 1, notice = true, hundred = 2888}, --轩辕神剑    
						{itemid = 1125, prob = 2885, count = 1, notice = true, hundred = 2885}, --轩辕神甲(男)
						{itemid = 1126, prob = 2880, count = 1, notice = true, hundred = 2880}, --轩辕神甲(女)

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

						{itemid = 979 , prob = 168, count = 1, notice = false, hundred = 168}, --修罗之刃      
						{itemid = 1045, prob = 165, count = 1, notice = false, hundred = 165}, --修罗战甲(男)  
						{itemid = 1046, prob = 162, count = 1, notice = false, hundred = 162}, --修罗战甲(女)  

						{itemid = 998 , prob = 167, count = 1, notice = false, hundred = 168}, --修罗之刃      
						{itemid = 1083, prob = 164, count = 1, notice = false, hundred = 165}, --修罗战甲(男)  
						{itemid = 1084, prob = 161, count = 1, notice = false, hundred = 162}, --修罗战甲(女)  

						{itemid = 1017, prob = 166, count = 1, notice = false, hundred = 168}, --修罗之刃      
						{itemid = 1121, prob = 163, count = 1, notice = false, hundred = 165}, --修罗战甲(男)  
						{itemid = 1122, prob = 160, count = 1, notice = false, hundred = 162}, --修罗战甲(女)  

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

						{itemid = 2197, prob = 20, count = 1, notice = false, hundred = 20},    --典
						{itemid = 2196, prob = 19, count = 1, notice = false, hundred = 19},    --庆
						{itemid = 2172, prob = 17, count = 1, notice = false, hundred = 17},    --年
						{itemid = 2171, prob = 15, count = 1, notice = false, hundred = 15},    --周
						{itemid = 2110, prob = 15, count = 1, notice = false, hundred = 15}, --一级暴击宝石 
						{itemid = 513 , prob = 1 , count = 1, notice = false, hundred = 1 }, --经验丹(大)   
					},
				},
			},
			--法师
			{
				{
					money = 2400,		--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 5,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1157, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1215, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1273, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1331, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1389, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1447, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1176, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1234, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1292, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1350, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1408, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1466, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1195, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1253, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1311, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1369, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1427, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1485, prob = 18, count = 1, notice = true, hundred = 18},
					},
				},

				{
					money = 8000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 8,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1158, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1216, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1274, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1332, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1390, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1448, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1177, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1235, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1293, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1351, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1409, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1467, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1196, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1254, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1312, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1370, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1428, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1486, prob = 23, count = 1, notice = true, hundred = 23},
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
						{itemid = 1159, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1217, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1275, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1333, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1391, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1449, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1178, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1236, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1294, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1352, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1410, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1468, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1197, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1255, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1313, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1371, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1429, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1487, prob = 28, count = 1, notice = true, hundred = 28},
					},
				},
				{
					money = 45000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 8,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1158, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1216, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1274, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1332, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1390, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1448, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1177, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1235, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1293, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1351, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1409, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1467, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1196, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1254, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1312, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1370, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1428, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1486, prob = 23, count = 1, notice = true, hundred = 23},
					},
				},
				{
					money = 65000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 15,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1159, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1217, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1275, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1333, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1391, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1449, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1178, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1236, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1294, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1352, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1410, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1468, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1197, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1255, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1313, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1371, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1429, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1487, prob = 28, count = 1, notice = true, hundred = 28},
					},
				},
				{
					money = 80000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1158, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1216, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1274, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1332, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1390, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1448, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1177, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1235, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1293, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1351, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1409, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1467, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1196, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1254, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1312, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1370, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1428, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1486, prob = 23, count = 1, notice = true, hundred = 23},
					},
				},
				{
					money = 98000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 8,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1179, prob = 9, count = 1, notice = true, hundred = 9}, --8转首饰
						{itemid = 1237, prob = 9, count = 1, notice = true, hundred = 9}, --8转首饰
						{itemid = 1295, prob = 8, count = 1, notice = true, hundred = 8}, --8转首饰
						{itemid = 1353, prob = 8, count = 1, notice = true, hundred = 8}, --8转首饰
						{itemid = 1411, prob = 8, count = 1, notice = true, hundred = 8}, --8转首饰
						{itemid = 1469, prob = 7, count = 1, notice = true, hundred = 7}, --8转首饰
					},
				},
				{
					money = 188000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 12,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1179, prob = 9, count = 1, notice = true, hundred = 9}, --8转首饰
						{itemid = 1237, prob = 9, count = 1, notice = true, hundred = 9}, --8转首饰
						{itemid = 1295, prob = 8, count = 1, notice = true, hundred = 8}, --8转首饰
						{itemid = 1353, prob = 8, count = 1, notice = true, hundred = 8}, --8转首饰
						{itemid = 1411, prob = 8, count = 1, notice = true, hundred = 8}, --8转首饰
						{itemid = 1469, prob = 7, count = 1, notice = true, hundred = 7}, --8转首饰
					},
				},
				{
					count = 200,	--寻宝次数大于此值才会进入
					maxcount = 250,	--寻宝次数等于此值必定进入
					limit = 1,		--限制进入次数,-1为不限制
					prob = 16,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 2201, prob = 26, count = 1, notice = true, hundred = 26},  --欢
						{itemid = 2200, prob = 10, count = 1, notice = true, hundred = 10},  --狂
						{itemid = 2199, prob = 3, count = 1, notice = true, hundred = 3},   --民
						{itemid = 2198, prob = 1, count = 1, notice = true, hundred = 1},   --全
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

						{itemid = 2276, prob = 28888, count = 1, notice = true, broadcast = true, hundred = 25888}, --铁血武器        
						{itemid = 2277, prob = 28668, count = 1, notice = true, broadcast = true, hundred = 25668}, --铁血衣服(男)
						{itemid = 2284, prob = 28588, count = 1, notice = true, broadcast = true, hundred = 25588}, --铁血衣服(女)

						{itemid = 1003, prob = 59888, count = 1, notice = true, broadcast = true, hundred = 59888}, --8转武器    
						{itemid = 1093, prob = 58888, count = 1, notice = true, broadcast = true, hundred = 58888}, --8转衣服(男)
						{itemid = 1094, prob = 58585, count = 1, notice = true, broadcast = true, hundred = 58585}, --8转衣服(女)

						{itemid = 1002, prob = 22886, count = 1, notice = true, broadcast = true, hundred = 22886}, --傲视狂舞斩    
						{itemid = 1091, prob = 22883, count = 1, notice = true, broadcast = true, hundred = 22883}, --傲视狂舞甲(男)
						{itemid = 1092, prob = 22586, count = 1, notice = true, broadcast = true, hundred = 22586}, --傲视狂舞甲(女)

						{itemid = 1179, prob = 19888, count = 1, notice = true, hundred = 19888}, --8转首饰
						{itemid = 1237, prob = 18888, count = 1, notice = true, hundred = 18888}, --8转首饰
						{itemid = 1295, prob = 18585, count = 1, notice = true, hundred = 18585}, --8转首饰
						{itemid = 1353, prob = 19888, count = 1, notice = true, hundred = 19888}, --8转首饰
						{itemid = 1411, prob = 18888, count = 1, notice = true, hundred = 18888}, --8转首饰
						{itemid = 1469, prob = 18585, count = 1, notice = true, hundred = 18585}, --8转首饰

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

						{itemid = 2209, prob = 16888, count = 1, notice = true, hundred = 15888}, --盾牌碎片(特)
						{itemid = 2213, prob = 16887, count = 1, notice = true, hundred = 15887}, --宝石碎片(特)
						{itemid = 2217, prob = 16886, count = 1, notice = true, hundred = 15886}, --魂珠碎片(特)
						{itemid = 566 , prob = 16885, count = 1, notice = true, hundred = 15885}, --超级转生丹  
						{itemid = 163 , prob = 16884, count = 1, notice = true, hundred = 15884}, --超级成就令牌
						{itemid = 162 , prob = 16883, count = 1, notice = true, hundred = 15883}, --超级灵力丹  
						{itemid = 675 , prob = 16882, count = 1, notice = true, hundred = 15882}, --999朵玫瑰花 
						{itemid = 528 , prob = 16881, count = 1, notice = true, hundred = 15881}, --特戒碎片包  
						{itemid = 2225, prob = 16880, count = 1, notice = true, hundred = 15880}, --护符碎片(特)

						{itemid = 1158, prob = 8888, count = 1, notice = true, hundred = 8888},  --4转首饰
						{itemid = 1216, prob = 8878, count = 1, notice = true, hundred = 8878},  --4转首饰
						{itemid = 1274, prob = 8868, count = 1, notice = true, hundred = 8868},  --4转首饰
						{itemid = 1332, prob = 8858, count = 1, notice = true, hundred = 8858},  --4转首饰
						{itemid = 1390, prob = 8848, count = 1, notice = true, hundred = 8848},  --4转首饰
						{itemid = 1448, prob = 8838, count = 1, notice = true, hundred = 8838},  --4转首饰

						{itemid = 1177, prob = 8888, count = 1, notice = true, hundred = 8888}, --4转首饰
						{itemid = 1235, prob = 8878, count = 1, notice = true, hundred = 8878}, --4转首饰
						{itemid = 1293, prob = 8868, count = 1, notice = true, hundred = 8868}, --4转首饰
						{itemid = 1351, prob = 8858, count = 1, notice = true, hundred = 8858}, --4转首饰
						{itemid = 1409, prob = 8848, count = 1, notice = true, hundred = 8848}, --4转首饰
						{itemid = 1467, prob = 8838, count = 1, notice = true, hundred = 8838}, --4转首饰

						{itemid = 1196, prob = 8888, count = 1, notice = true, hundred = 8888}, --4转首饰
						{itemid = 1254, prob = 8878, count = 1, notice = true, hundred = 8878}, --4转首饰
						{itemid = 1312, prob = 8868, count = 1, notice = true, hundred = 8868}, --4转首饰
						{itemid = 1370, prob = 8858, count = 1, notice = true, hundred = 8858}, --4转首饰
						{itemid = 1428, prob = 8848, count = 1, notice = true, hundred = 8848}, --4转首饰
						{itemid = 1486, prob = 8838, count = 1, notice = true, hundred = 8838}, --4转首饰

						{itemid = 2203, prob = 3188, count = 1, notice = true, hundred = 3188},--神器碎片
						{itemid = 2204, prob = 3088, count = 1, notice = true, hundred = 3088},--神甲碎片

						{itemid = 981 , prob = 2888, count = 1, notice = true, hundred = 2888}, --轩辕神剑    
						{itemid = 1049, prob = 2885, count = 1, notice = true, hundred = 2885}, --轩辕神甲(男)
						{itemid = 1050, prob = 2880, count = 1, notice = true, hundred = 2880}, --轩辕神甲(女)

						{itemid = 1000, prob = 2888, count = 1, notice = true, hundred = 2888}, --轩辕神剑    
						{itemid = 1087, prob = 2885, count = 1, notice = true, hundred = 2885}, --轩辕神甲(男)
						{itemid = 1088, prob = 2880, count = 1, notice = true, hundred = 2880}, --轩辕神甲(女)
					
						{itemid = 1019, prob = 2888, count = 1, notice = true, hundred = 2888}, --轩辕神剑    
						{itemid = 1125, prob = 2885, count = 1, notice = true, hundred = 2885}, --轩辕神甲(男)
						{itemid = 1126, prob = 2880, count = 1, notice = true, hundred = 2880}, --轩辕神甲(女)

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

						{itemid = 979 , prob = 168, count = 1, notice = false, hundred = 168}, --修罗之刃      
						{itemid = 1045, prob = 165, count = 1, notice = false, hundred = 165}, --修罗战甲(男)  
						{itemid = 1046, prob = 162, count = 1, notice = false, hundred = 162}, --修罗战甲(女)  
						{itemid = 998 , prob = 167, count = 1, notice = false, hundred = 167}, --修罗之刃      
						{itemid = 1083, prob = 164, count = 1, notice = false, hundred = 164}, --修罗战甲(男)  
						{itemid = 1084, prob = 161, count = 1, notice = false, hundred = 161}, --修罗战甲(女)  
						{itemid = 1017, prob = 166, count = 1, notice = false, hundred = 166}, --修罗之刃      
						{itemid = 1121, prob = 163, count = 1, notice = false, hundred = 163}, --修罗战甲(男)  
						{itemid = 1122, prob = 160, count = 1, notice = false, hundred = 160}, --修罗战甲(女)  

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

						{itemid = 2197, prob = 20, count = 1, notice = false, hundred = 20},    --典
						{itemid = 2196, prob = 19, count = 1, notice = false, hundred = 19},    --庆
						{itemid = 2172, prob = 17, count = 1, notice = false, hundred = 17},    --年
						{itemid = 2171, prob = 15, count = 1, notice = false, hundred = 15},    --周
						{itemid = 2110, prob = 15, count = 1, notice = false, hundred = 15}, --一级暴击宝石 
						{itemid = 513 , prob = 1 , count = 1, notice = false, hundred = 1 }, --经验丹(大)   
					},
				},
			},
			--道士
			{
				{
					money = 2400,		--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 5,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1157, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1215, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1273, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1331, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1389, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1447, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1176, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1234, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1292, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1350, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1408, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1466, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1195, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1253, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1311, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1369, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1427, prob = 18, count = 1, notice = true, hundred = 18},
						{itemid = 1485, prob = 18, count = 1, notice = true, hundred = 18},
					},
				},

				{
					money = 8000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 8,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1158, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1216, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1274, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1332, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1390, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1448, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1177, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1235, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1293, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1351, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1409, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1467, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1196, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1254, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1312, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1370, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1428, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1486, prob = 23, count = 1, notice = true, hundred = 23},
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
						{itemid = 1159, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1217, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1275, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1333, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1391, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1449, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1178, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1236, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1294, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1352, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1410, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1468, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1197, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1255, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1313, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1371, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1429, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1487, prob = 28, count = 1, notice = true, hundred = 28},
					},
				},
				{
					money = 45000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 8,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1158, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1216, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1274, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1332, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1390, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1448, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1177, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1235, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1293, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1351, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1409, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1467, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1196, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1254, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1312, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1370, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1428, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1486, prob = 23, count = 1, notice = true, hundred = 23},
					},
				},
				{
					money = 65000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 15,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1159, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1217, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1275, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1333, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1391, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1449, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1178, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1236, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1294, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1352, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1410, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1468, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1197, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1255, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1313, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1371, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1429, prob = 28, count = 1, notice = true, hundred = 28},
						{itemid = 1487, prob = 28, count = 1, notice = true, hundred = 28},
					},
				},
				{
					money = 80000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1158, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1216, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1274, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1332, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1390, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1448, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1177, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1235, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1293, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1351, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1409, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1467, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1196, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1254, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1312, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1370, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1428, prob = 23, count = 1, notice = true, hundred = 23},
						{itemid = 1486, prob = 23, count = 1, notice = true, hundred = 23},
					},
				},
				{
					money = 98000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 8,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1198, prob = 9, count = 1, notice = true, hundred = 9}, --8转首饰
						{itemid = 1256, prob = 9, count = 1, notice = true, hundred = 9}, --8转首饰
						{itemid = 1314, prob = 8, count = 1, notice = true, hundred = 8}, --8转首饰
						{itemid = 1372, prob = 8, count = 1, notice = true, hundred = 8}, --8转首饰
						{itemid = 1430, prob = 8, count = 1, notice = true, hundred = 8}, --8转首饰
						{itemid = 1488, prob = 7, count = 1, notice = true, hundred = 7}, --8转首饰
					},
				},
				{
					money = 188000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 12,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 1198, prob = 9, count = 1, notice = true, hundred = 9}, --8转首饰
						{itemid = 1256, prob = 9, count = 1, notice = true, hundred = 9}, --8转首饰
						{itemid = 1314, prob = 8, count = 1, notice = true, hundred = 8}, --8转首饰
						{itemid = 1372, prob = 8, count = 1, notice = true, hundred = 8}, --8转首饰
						{itemid = 1430, prob = 8, count = 1, notice = true, hundred = 8}, --8转首饰
						{itemid = 1488, prob = 7, count = 1, notice = true, hundred = 7}, --8转首饰
					},
				},
				{
					count = 200,	--寻宝次数大于此值才会进入
					maxcount = 250,	--寻宝次数等于此值必定进入
					limit = 1,		--限制进入次数,-1为不限制
					prob = 16,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 2201, prob = 0, count = 1, notice = true, hundred = 26},  --欢
						{itemid = 2200, prob = 0, count = 1, notice = true, hundred = 10},  --狂
						{itemid = 2199, prob = 0, count = 1, notice = true, hundred = 3},   --民
						{itemid = 2198, prob = 0, count = 1, notice = true, hundred = 1},   --全
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

						{itemid = 2276, prob = 28888, count = 1, notice = true, broadcast = true, hundred = 25888}, --铁血武器        
						{itemid = 2277, prob = 28668, count = 1, notice = true, broadcast = true, hundred = 25668}, --铁血衣服(男)
						{itemid = 2284, prob = 28588, count = 1, notice = true, broadcast = true, hundred = 25588}, --铁血衣服(女)

						{itemid = 1022, prob = 59888, count = 1, notice = true, broadcast = true, hundred = 59888}, --8转武器    
						{itemid = 1131, prob = 58888, count = 1, notice = true, broadcast = true, hundred = 58888}, --8转衣服(男)
						{itemid = 1132, prob = 58585, count = 1, notice = true, broadcast = true, hundred = 58585}, --8转衣服(女)

						{itemid = 1021, prob = 22885, count = 1, notice = true, broadcast = true, hundred = 22885}, --傲视狂舞斩    
						{itemid = 1129, prob = 22882, count = 1, notice = true, broadcast = true, hundred = 22882}, --傲视狂舞甲(男)
						{itemid = 1130, prob = 22585, count = 1, notice = true, broadcast = true, hundred = 22585}, --傲视狂舞甲(女)

						{itemid = 1198, prob = 19888, count = 1, notice = true, hundred = 19888}, --8转首饰
						{itemid = 1256, prob = 18888, count = 1, notice = true, hundred = 18888}, --8转首饰
						{itemid = 1314, prob = 18585, count = 1, notice = true, hundred = 18585}, --8转首饰
						{itemid = 1372, prob = 19888, count = 1, notice = true, hundred = 19888}, --8转首饰
						{itemid = 1430, prob = 18888, count = 1, notice = true, hundred = 18888}, --8转首饰
						{itemid = 1488, prob = 18585, count = 1, notice = true, hundred = 18585}, --8转首饰

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

						{itemid = 2209, prob = 16888, count = 1, notice = true, hundred = 15888}, --盾牌碎片(特)
						{itemid = 2213, prob = 16887, count = 1, notice = true, hundred = 15887}, --宝石碎片(特)
						{itemid = 2217, prob = 16886, count = 1, notice = true, hundred = 15886}, --魂珠碎片(特)
						{itemid = 566 , prob = 16885, count = 1, notice = true, hundred = 15885}, --超级转生丹  
						{itemid = 163 , prob = 16884, count = 1, notice = true, hundred = 15884}, --超级成就令牌
						{itemid = 162 , prob = 16883, count = 1, notice = true, hundred = 15883}, --超级灵力丹  
						{itemid = 675 , prob = 16882, count = 1, notice = true, hundred = 15882}, --999朵玫瑰花 
						{itemid = 528 , prob = 16881, count = 1, notice = true, hundred = 15881}, --特戒碎片包  
						{itemid = 2225, prob = 16880, count = 1, notice = true, hundred = 15880}, --护符碎片(特)

						{itemid = 1158, prob = 8888, count = 1, notice = true, hundred = 8888},  --4转首饰
						{itemid = 1216, prob = 8878, count = 1, notice = true, hundred = 8878},  --4转首饰
						{itemid = 1274, prob = 8868, count = 1, notice = true, hundred = 8868},  --4转首饰
						{itemid = 1332, prob = 8858, count = 1, notice = true, hundred = 8858},  --4转首饰
						{itemid = 1390, prob = 8848, count = 1, notice = true, hundred = 8848},  --4转首饰
						{itemid = 1448, prob = 8838, count = 1, notice = true, hundred = 8838},  --4转首饰

						{itemid = 1177, prob = 8888, count = 1, notice = true, hundred = 8888}, --4转首饰
						{itemid = 1235, prob = 8878, count = 1, notice = true, hundred = 8878}, --4转首饰
						{itemid = 1293, prob = 8868, count = 1, notice = true, hundred = 8868}, --4转首饰
						{itemid = 1351, prob = 8858, count = 1, notice = true, hundred = 8858}, --4转首饰
						{itemid = 1409, prob = 8848, count = 1, notice = true, hundred = 8848}, --4转首饰
						{itemid = 1467, prob = 8838, count = 1, notice = true, hundred = 8838}, --4转首饰

						{itemid = 1196, prob = 8888, count = 1, notice = true, hundred = 8888}, --4转首饰
						{itemid = 1254, prob = 8878, count = 1, notice = true, hundred = 8878}, --4转首饰
						{itemid = 1312, prob = 8868, count = 1, notice = true, hundred = 8868}, --4转首饰
						{itemid = 1370, prob = 8858, count = 1, notice = true, hundred = 8858}, --4转首饰
						{itemid = 1428, prob = 8848, count = 1, notice = true, hundred = 8848}, --4转首饰
						{itemid = 1486, prob = 8838, count = 1, notice = true, hundred = 8838}, --4转首饰

						{itemid = 2203, prob = 3188, count = 1, notice = true, hundred = 3188},--神器碎片
						{itemid = 2204, prob = 3088, count = 1, notice = true, hundred = 3088},--神甲碎片
					
						{itemid = 981 , prob = 2888, count = 1, notice = true, hundred = 2888}, --轩辕神剑    
						{itemid = 1049, prob = 2885, count = 1, notice = true, hundred = 2885}, --轩辕神甲(男)
						{itemid = 1050, prob = 2880, count = 1, notice = true, hundred = 2880}, --轩辕神甲(女)
						{itemid = 1000, prob = 2888, count = 1, notice = true, hundred = 2888}, --轩辕神剑    
						{itemid = 1087, prob = 2885, count = 1, notice = true, hundred = 2885}, --轩辕神甲(男)
						{itemid = 1088, prob = 2880, count = 1, notice = true, hundred = 2880}, --轩辕神甲(女)
						{itemid = 1019, prob = 2888, count = 1, notice = true, hundred = 2888}, --轩辕神剑    
						{itemid = 1125, prob = 2885, count = 1, notice = true, hundred = 2885}, --轩辕神甲(男)
						{itemid = 1126, prob = 2880, count = 1, notice = true, hundred = 2880}, --轩辕神甲(女)

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

						{itemid = 979 , prob = 168, count = 1, notice = false, hundred = 168}, --修罗之刃      
						{itemid = 1045, prob = 165, count = 1, notice = false, hundred = 165}, --修罗战甲(男)  
						{itemid = 1046, prob = 162, count = 1, notice = false, hundred = 162}, --修罗战甲(女)  
						{itemid = 998 , prob = 167, count = 1, notice = false, hundred = 167}, --修罗之刃      
						{itemid = 1083, prob = 164, count = 1, notice = false, hundred = 164}, --修罗战甲(男)  
						{itemid = 1084, prob = 161, count = 1, notice = false, hundred = 161}, --修罗战甲(女)  
						{itemid = 1017, prob = 166, count = 1, notice = false, hundred = 166}, --修罗之刃      
						{itemid = 1121, prob = 163, count = 1, notice = false, hundred = 163}, --修罗战甲(男)  
						{itemid = 1122, prob = 160, count = 1, notice = false, hundred = 160}, --修罗战甲(女)  

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

						{itemid = 2197, prob = 20, count = 1, notice = false, hundred = 20},    --典
						{itemid = 2196, prob = 19, count = 1, notice = false, hundred = 19},    --庆
						{itemid = 2172, prob = 17, count = 1, notice = false, hundred = 17},    --年
						{itemid = 2171, prob = 15, count = 1, notice = false, hundred = 15},    --周
						{itemid = 2110, prob = 15, count = 1, notice = false, hundred = 15}, --一级暴击宝石 
						{itemid = 513 , prob = 1 , count = 1, notice = false, hundred = 1 }, --经验丹(大)     
					},
				},
			},
		},
	},
},