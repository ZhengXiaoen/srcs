-- 饰品锤炼

OrnamentCfg = 
{
	-- useType 0:无; 1:主宰; 2:皓月; 3:热血
	
	-- 最大等级
	MaxLevels = { 10, 20, 30 }, -- { 主宰, 皓月, 热血 }
	consumeItemId = 5648, -- 锤炼石5648
	
	Slots = {
		-- 吊坠  

-- 			--模块
-- 				--(a27)  
-- 				{
-- 					consumes = {(a1), (a2)}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
-- 					attrs = {
-- {{type=(a3),value=(a4)},{type=(a5),value=(a6)},{type=(a7),value=(a8)},{type=(a9),value=(a10)},},
-- {{type=(a11),value=(a12)},{type=(a13),value=(a14)},{type=(a15),value=(a16)},{type=(a17),value=(a18)},},
-- {{type=(a19),value=(a20)},{type=(a21),value=(a22)},{type=(a23),value=(a24)},{type=(a25),value=(a26)},},



-- 					},		    	
-- 			    },


		
		{				
			Levels = {

				
							--0级  
				{
					consumes = {3, 250000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=0},{type=11,value=0},{type=128,value=0},{type=129,value=0},},
{{type=13,value=0},{type=15,value=0},{type=128,value=0},{type=129,value=0},},
{{type=17,value=0},{type=19,value=0},{type=128,value=0},{type=129,value=0},},



					},		    	
			    },
				--1级  
				{
					consumes = {6, 500000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=25},{type=11,value=55},{type=128,value=10},{type=129,value=90},},
{{type=13,value=25},{type=15,value=55},{type=128,value=10},{type=129,value=90},},
{{type=17,value=25},{type=19,value=55},{type=128,value=10},{type=129,value=90},},



					},		    	
			    },
				--2级  
				{
					consumes = {9, 750000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=55},{type=11,value=120},{type=128,value=20},{type=129,value=197},},
{{type=13,value=55},{type=15,value=120},{type=128,value=20},{type=129,value=197},},
{{type=17,value=55},{type=19,value=120},{type=128,value=20},{type=129,value=197},},



					},		    	
			    },
				--3级  
				{
					consumes = {12, 1000000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=88},{type=11,value=194},{type=128,value=30},{type=129,value=317},},
{{type=13,value=88},{type=15,value=194},{type=128,value=30},{type=129,value=317},},
{{type=17,value=88},{type=19,value=194},{type=128,value=30},{type=129,value=317},},



					},		    	
			    },
				--4级  
				{
					consumes = {15, 1250000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=126},{type=11,value=277},{type=128,value=40},{type=129,value=454},},
{{type=13,value=126},{type=15,value=277},{type=128,value=40},{type=129,value=454},},
{{type=17,value=126},{type=19,value=277},{type=128,value=40},{type=129,value=454},},



					},		    	
			    },
				--5级  
				{
					consumes = {18, 1500000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=168},{type=11,value=370},{type=128,value=50},{type=129,value=605},},
{{type=13,value=168},{type=15,value=370},{type=128,value=50},{type=129,value=605},},
{{type=17,value=168},{type=19,value=370},{type=128,value=50},{type=129,value=605},},



					},		    	
			    },
				--6级  
				{
					consumes = {21, 1750000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=214},{type=11,value=471},{type=128,value=60},{type=129,value=770},},
{{type=13,value=214},{type=15,value=471},{type=128,value=60},{type=129,value=770},},
{{type=17,value=214},{type=19,value=471},{type=128,value=60},{type=129,value=770},},



					},		    	
			    },
				--7级  
				{
					consumes = {24, 2000000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=265},{type=11,value=582},{type=128,value=70},{type=129,value=953},},
{{type=13,value=265},{type=15,value=582},{type=128,value=70},{type=129,value=953},},
{{type=17,value=265},{type=19,value=582},{type=128,value=70},{type=129,value=953},},



					},		    	
			    },
				--8级  
				{
					consumes = {27, 2250000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=319},{type=11,value=702},{type=128,value=80},{type=129,value=1148},},
{{type=13,value=319},{type=15,value=702},{type=128,value=80},{type=129,value=1148},},
{{type=17,value=319},{type=19,value=702},{type=128,value=80},{type=129,value=1148},},



					},		    	
			    },
				--9级  
				{
					consumes = {30, 2500000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=378},{type=11,value=832},{type=128,value=90},{type=129,value=1361},},
{{type=13,value=378},{type=15,value=832},{type=128,value=90},{type=129,value=1361},},
{{type=17,value=378},{type=19,value=832},{type=128,value=90},{type=129,value=1361},},



					},		    	
			    },
				--10级  
				{
					consumes = {33, 2750000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=441},{type=11,value=970},{type=128,value=100},{type=129,value=1588},},
{{type=13,value=441},{type=15,value=970},{type=128,value=100},{type=129,value=1588},},
{{type=17,value=441},{type=19,value=970},{type=128,value=100},{type=129,value=1588},},



					},		    	
			    },
				--11级  
				{
					consumes = {36, 3000000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=508},{type=11,value=1118},{type=128,value=110},{type=129,value=1829},},
{{type=13,value=508},{type=15,value=1118},{type=128,value=110},{type=129,value=1829},},
{{type=17,value=508},{type=19,value=1118},{type=128,value=110},{type=129,value=1829},},



					},		    	
			    },
				--12级  
				{
					consumes = {39, 3250000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=580},{type=11,value=1275},{type=128,value=120},{type=129,value=2087},},
{{type=13,value=580},{type=15,value=1275},{type=128,value=120},{type=129,value=2087},},
{{type=17,value=580},{type=19,value=1275},{type=128,value=120},{type=129,value=2087},},



					},		    	
			    },
				--13级  
				{
					consumes = {42, 3500000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=655},{type=11,value=1441},{type=128,value=130},{type=129,value=2358},},
{{type=13,value=655},{type=15,value=1441},{type=128,value=130},{type=129,value=2358},},
{{type=17,value=655},{type=19,value=1441},{type=128,value=130},{type=129,value=2358},},



					},		    	
			    },
				--14级  
				{
					consumes = {45, 3750000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=735},{type=11,value=1617},{type=128,value=140},{type=129,value=2646},},
{{type=13,value=735},{type=15,value=1617},{type=128,value=140},{type=129,value=2646},},
{{type=17,value=735},{type=19,value=1617},{type=128,value=140},{type=129,value=2646},},



					},		    	
			    },
				--15级  
				{
					consumes = {48, 4000000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=819},{type=11,value=1802},{type=128,value=150},{type=129,value=2948},},
{{type=13,value=819},{type=15,value=1802},{type=128,value=150},{type=129,value=2948},},
{{type=17,value=819},{type=19,value=1802},{type=128,value=150},{type=129,value=2948},},



					},		    	
			    },
				--16级  
				{
					consumes = {51, 4250000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=908},{type=11,value=1997},{type=128,value=160},{type=129,value=3267},},
{{type=13,value=908},{type=15,value=1997},{type=128,value=160},{type=129,value=3267},},
{{type=17,value=908},{type=19,value=1997},{type=128,value=160},{type=129,value=3267},},



					},		    	
			    },
				--17级  
				{
					consumes = {54, 4500000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=1000},{type=11,value=2199},{type=128,value=170},{type=129,value=3600},},
{{type=13,value=1000},{type=15,value=2199},{type=128,value=170},{type=129,value=3600},},
{{type=17,value=1000},{type=19,value=2199},{type=128,value=170},{type=129,value=3600},},



					},		    	
			    },
				--18级  
				{
					consumes = {57, 4750000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=1096},{type=11,value=2411},{type=128,value=180},{type=129,value=3946},},
{{type=13,value=1096},{type=15,value=2411},{type=128,value=180},{type=129,value=3946},},
{{type=17,value=1096},{type=19,value=2411},{type=128,value=180},{type=129,value=3946},},



					},		    	
			    },
				--19级  
				{
					consumes = {60, 5000000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=1198},{type=11,value=2635},{type=128,value=190},{type=129,value=4311},},
{{type=13,value=1198},{type=15,value=2635},{type=128,value=190},{type=129,value=4311},},
{{type=17,value=1198},{type=19,value=2635},{type=128,value=190},{type=129,value=4311},},



					},		    	
			    },
				--20级  
				{
					consumes = {63, 5250000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=1303},{type=11,value=2866},{type=128,value=200},{type=129,value=4689},},
{{type=13,value=1303},{type=15,value=2866},{type=128,value=200},{type=129,value=4689},},
{{type=17,value=1303},{type=19,value=2866},{type=128,value=200},{type=129,value=4689},},



					},		    	
			    },
				--21级  
				{
					consumes = {66, 5500000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=1409},{type=11,value=3099},{type=128,value=210},{type=129,value=5071},},
{{type=13,value=1409},{type=15,value=3099},{type=128,value=210},{type=129,value=5071},},
{{type=17,value=1409},{type=19,value=3099},{type=128,value=210},{type=129,value=5071},},



					},		    	
			    },
				--22级  
				{
					consumes = {69, 5750000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=1516},{type=11,value=3335},{type=128,value=220},{type=129,value=5458},},
{{type=13,value=1516},{type=15,value=3335},{type=128,value=220},{type=129,value=5458},},
{{type=17,value=1516},{type=19,value=3335},{type=128,value=220},{type=129,value=5458},},



					},		    	
			    },
				--23级  
				{
					consumes = {72, 6000000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=1626},{type=11,value=3576},{type=128,value=230},{type=129,value=5852},},
{{type=13,value=1626},{type=15,value=3576},{type=128,value=230},{type=129,value=5852},},
{{type=17,value=1626},{type=19,value=3576},{type=128,value=230},{type=129,value=5852},},



					},		    	
			    },
				--24级  
				{
					consumes = {75, 6250000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=1736},{type=11,value=3819},{type=128,value=240},{type=129,value=6250},},
{{type=13,value=1736},{type=15,value=3819},{type=128,value=240},{type=129,value=6250},},
{{type=17,value=1736},{type=19,value=3819},{type=128,value=240},{type=129,value=6250},},



					},		    	
			    },
				--25级  
				{
					consumes = {78, 6500000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=1848},{type=11,value=4066},{type=128,value=250},{type=129,value=6653},},
{{type=13,value=1848},{type=15,value=4066},{type=128,value=250},{type=129,value=6653},},
{{type=17,value=1848},{type=19,value=4066},{type=128,value=250},{type=129,value=6653},},



					},		    	
			    },
				--26级  
				{
					consumes = {81, 6750000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=1962},{type=11,value=4315},{type=128,value=260},{type=129,value=7061},},
{{type=13,value=1962},{type=15,value=4315},{type=128,value=260},{type=129,value=7061},},
{{type=17,value=1962},{type=19,value=4315},{type=128,value=260},{type=129,value=7061},},



					},		    	
			    },
				--27级  
				{
					consumes = {84, 7000000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=2076},{type=11,value=4567},{type=128,value=270},{type=129,value=7474},},
{{type=13,value=2076},{type=15,value=4567},{type=128,value=270},{type=129,value=7474},},
{{type=17,value=2076},{type=19,value=4567},{type=128,value=270},{type=129,value=7474},},



					},		    	
			    },
				--28级  
				{
					consumes = {87, 7250000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=2193},{type=11,value=4824},{type=128,value=280},{type=129,value=7893},},
{{type=13,value=2193},{type=15,value=4824},{type=128,value=280},{type=129,value=7893},},
{{type=17,value=2193},{type=19,value=4824},{type=128,value=280},{type=129,value=7893},},



					},		    	
			    },
				--29级  
				{
					consumes = {90, 7500000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=2310},{type=11,value=5082},{type=128,value=290},{type=129,value=8316},},
{{type=13,value=2310},{type=15,value=5082},{type=128,value=290},{type=129,value=8316},},
{{type=17,value=2310},{type=19,value=5082},{type=128,value=290},{type=129,value=8316},},



					},		    	
			    },
				--30级  
				{
					consumes = {0, 0}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=2429},{type=11,value=5280},{type=128,value=300},{type=129,value=8750},},
{{type=13,value=2429},{type=15,value=5280},{type=128,value=300},{type=129,value=8750},},
{{type=17,value=2429},{type=19,value=5280},{type=128,value=300},{type=129,value=8750},},



					},		    	
			    },




		    },
		},
		
		-- 护肩
		{				
			Levels = {
								--0级  
				{
					consumes = {3, 250000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=0},{type=11,value=0},{type=128,value=0},{type=129,value=0},},
{{type=13,value=0},{type=15,value=0},{type=128,value=0},{type=129,value=0},},
{{type=17,value=0},{type=19,value=0},{type=128,value=0},{type=129,value=0},},



					},		    	
			    },
				--1级  
				{
					consumes = {6, 500000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=25},{type=11,value=55},{type=128,value=10},{type=129,value=90},},
{{type=13,value=25},{type=15,value=55},{type=128,value=10},{type=129,value=90},},
{{type=17,value=25},{type=19,value=55},{type=128,value=10},{type=129,value=90},},



					},		    	
			    },
				--2级  
				{
					consumes = {9, 750000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=55},{type=11,value=120},{type=128,value=20},{type=129,value=197},},
{{type=13,value=55},{type=15,value=120},{type=128,value=20},{type=129,value=197},},
{{type=17,value=55},{type=19,value=120},{type=128,value=20},{type=129,value=197},},



					},		    	
			    },
				--3级  
				{
					consumes = {12, 1000000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=88},{type=11,value=194},{type=128,value=30},{type=129,value=317},},
{{type=13,value=88},{type=15,value=194},{type=128,value=30},{type=129,value=317},},
{{type=17,value=88},{type=19,value=194},{type=128,value=30},{type=129,value=317},},



					},		    	
			    },
				--4级  
				{
					consumes = {15, 1250000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=126},{type=11,value=277},{type=128,value=40},{type=129,value=454},},
{{type=13,value=126},{type=15,value=277},{type=128,value=40},{type=129,value=454},},
{{type=17,value=126},{type=19,value=277},{type=128,value=40},{type=129,value=454},},



					},		    	
			    },
				--5级  
				{
					consumes = {18, 1500000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=168},{type=11,value=370},{type=128,value=50},{type=129,value=605},},
{{type=13,value=168},{type=15,value=370},{type=128,value=50},{type=129,value=605},},
{{type=17,value=168},{type=19,value=370},{type=128,value=50},{type=129,value=605},},



					},		    	
			    },
				--6级  
				{
					consumes = {21, 1750000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=214},{type=11,value=471},{type=128,value=60},{type=129,value=770},},
{{type=13,value=214},{type=15,value=471},{type=128,value=60},{type=129,value=770},},
{{type=17,value=214},{type=19,value=471},{type=128,value=60},{type=129,value=770},},



					},		    	
			    },
				--7级  
				{
					consumes = {24, 2000000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=265},{type=11,value=582},{type=128,value=70},{type=129,value=953},},
{{type=13,value=265},{type=15,value=582},{type=128,value=70},{type=129,value=953},},
{{type=17,value=265},{type=19,value=582},{type=128,value=70},{type=129,value=953},},



					},		    	
			    },
				--8级  
				{
					consumes = {27, 2250000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=319},{type=11,value=702},{type=128,value=80},{type=129,value=1148},},
{{type=13,value=319},{type=15,value=702},{type=128,value=80},{type=129,value=1148},},
{{type=17,value=319},{type=19,value=702},{type=128,value=80},{type=129,value=1148},},



					},		    	
			    },
				--9级  
				{
					consumes = {30, 2500000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=378},{type=11,value=832},{type=128,value=90},{type=129,value=1361},},
{{type=13,value=378},{type=15,value=832},{type=128,value=90},{type=129,value=1361},},
{{type=17,value=378},{type=19,value=832},{type=128,value=90},{type=129,value=1361},},



					},		    	
			    },
				--10级  
				{
					consumes = {33, 2750000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=441},{type=11,value=970},{type=128,value=100},{type=129,value=1588},},
{{type=13,value=441},{type=15,value=970},{type=128,value=100},{type=129,value=1588},},
{{type=17,value=441},{type=19,value=970},{type=128,value=100},{type=129,value=1588},},



					},		    	
			    },
				--11级  
				{
					consumes = {36, 3000000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=508},{type=11,value=1118},{type=128,value=110},{type=129,value=1829},},
{{type=13,value=508},{type=15,value=1118},{type=128,value=110},{type=129,value=1829},},
{{type=17,value=508},{type=19,value=1118},{type=128,value=110},{type=129,value=1829},},



					},		    	
			    },
				--12级  
				{
					consumes = {39, 3250000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=580},{type=11,value=1275},{type=128,value=120},{type=129,value=2087},},
{{type=13,value=580},{type=15,value=1275},{type=128,value=120},{type=129,value=2087},},
{{type=17,value=580},{type=19,value=1275},{type=128,value=120},{type=129,value=2087},},



					},		    	
			    },
				--13级  
				{
					consumes = {42, 3500000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=655},{type=11,value=1441},{type=128,value=130},{type=129,value=2358},},
{{type=13,value=655},{type=15,value=1441},{type=128,value=130},{type=129,value=2358},},
{{type=17,value=655},{type=19,value=1441},{type=128,value=130},{type=129,value=2358},},



					},		    	
			    },
				--14级  
				{
					consumes = {45, 3750000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=735},{type=11,value=1617},{type=128,value=140},{type=129,value=2646},},
{{type=13,value=735},{type=15,value=1617},{type=128,value=140},{type=129,value=2646},},
{{type=17,value=735},{type=19,value=1617},{type=128,value=140},{type=129,value=2646},},



					},		    	
			    },
				--15级  
				{
					consumes = {48, 4000000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=819},{type=11,value=1802},{type=128,value=150},{type=129,value=2948},},
{{type=13,value=819},{type=15,value=1802},{type=128,value=150},{type=129,value=2948},},
{{type=17,value=819},{type=19,value=1802},{type=128,value=150},{type=129,value=2948},},



					},		    	
			    },
				--16级  
				{
					consumes = {51, 4250000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=908},{type=11,value=1997},{type=128,value=160},{type=129,value=3267},},
{{type=13,value=908},{type=15,value=1997},{type=128,value=160},{type=129,value=3267},},
{{type=17,value=908},{type=19,value=1997},{type=128,value=160},{type=129,value=3267},},



					},		    	
			    },
				--17级  
				{
					consumes = {54, 4500000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=1000},{type=11,value=2199},{type=128,value=170},{type=129,value=3600},},
{{type=13,value=1000},{type=15,value=2199},{type=128,value=170},{type=129,value=3600},},
{{type=17,value=1000},{type=19,value=2199},{type=128,value=170},{type=129,value=3600},},



					},		    	
			    },
				--18级  
				{
					consumes = {57, 4750000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=1096},{type=11,value=2411},{type=128,value=180},{type=129,value=3946},},
{{type=13,value=1096},{type=15,value=2411},{type=128,value=180},{type=129,value=3946},},
{{type=17,value=1096},{type=19,value=2411},{type=128,value=180},{type=129,value=3946},},



					},		    	
			    },
				--19级  
				{
					consumes = {60, 5000000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=1198},{type=11,value=2635},{type=128,value=190},{type=129,value=4311},},
{{type=13,value=1198},{type=15,value=2635},{type=128,value=190},{type=129,value=4311},},
{{type=17,value=1198},{type=19,value=2635},{type=128,value=190},{type=129,value=4311},},



					},		    	
			    },
				--20级  
				{
					consumes = {63, 5250000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=1303},{type=11,value=2866},{type=128,value=200},{type=129,value=4689},},
{{type=13,value=1303},{type=15,value=2866},{type=128,value=200},{type=129,value=4689},},
{{type=17,value=1303},{type=19,value=2866},{type=128,value=200},{type=129,value=4689},},



					},		    	
			    },
				--21级  
				{
					consumes = {66, 5500000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=1409},{type=11,value=3099},{type=128,value=210},{type=129,value=5071},},
{{type=13,value=1409},{type=15,value=3099},{type=128,value=210},{type=129,value=5071},},
{{type=17,value=1409},{type=19,value=3099},{type=128,value=210},{type=129,value=5071},},



					},		    	
			    },
				--22级  
				{
					consumes = {69, 5750000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=1516},{type=11,value=3335},{type=128,value=220},{type=129,value=5458},},
{{type=13,value=1516},{type=15,value=3335},{type=128,value=220},{type=129,value=5458},},
{{type=17,value=1516},{type=19,value=3335},{type=128,value=220},{type=129,value=5458},},



					},		    	
			    },
				--23级  
				{
					consumes = {72, 6000000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=1626},{type=11,value=3576},{type=128,value=230},{type=129,value=5852},},
{{type=13,value=1626},{type=15,value=3576},{type=128,value=230},{type=129,value=5852},},
{{type=17,value=1626},{type=19,value=3576},{type=128,value=230},{type=129,value=5852},},



					},		    	
			    },
				--24级  
				{
					consumes = {75, 6250000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=1736},{type=11,value=3819},{type=128,value=240},{type=129,value=6250},},
{{type=13,value=1736},{type=15,value=3819},{type=128,value=240},{type=129,value=6250},},
{{type=17,value=1736},{type=19,value=3819},{type=128,value=240},{type=129,value=6250},},



					},		    	
			    },
				--25级  
				{
					consumes = {78, 6500000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=1848},{type=11,value=4066},{type=128,value=250},{type=129,value=6653},},
{{type=13,value=1848},{type=15,value=4066},{type=128,value=250},{type=129,value=6653},},
{{type=17,value=1848},{type=19,value=4066},{type=128,value=250},{type=129,value=6653},},



					},		    	
			    },
				--26级  
				{
					consumes = {81, 6750000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=1962},{type=11,value=4315},{type=128,value=260},{type=129,value=7061},},
{{type=13,value=1962},{type=15,value=4315},{type=128,value=260},{type=129,value=7061},},
{{type=17,value=1962},{type=19,value=4315},{type=128,value=260},{type=129,value=7061},},



					},		    	
			    },
				--27级  
				{
					consumes = {84, 7000000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=2076},{type=11,value=4567},{type=128,value=270},{type=129,value=7474},},
{{type=13,value=2076},{type=15,value=4567},{type=128,value=270},{type=129,value=7474},},
{{type=17,value=2076},{type=19,value=4567},{type=128,value=270},{type=129,value=7474},},



					},		    	
			    },
				--28级  
				{
					consumes = {87, 7250000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=2193},{type=11,value=4824},{type=128,value=280},{type=129,value=7893},},
{{type=13,value=2193},{type=15,value=4824},{type=128,value=280},{type=129,value=7893},},
{{type=17,value=2193},{type=19,value=4824},{type=128,value=280},{type=129,value=7893},},



					},		    	
			    },
				--29级  
				{
					consumes = {90, 7500000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=2310},{type=11,value=5082},{type=128,value=290},{type=129,value=8316},},
{{type=13,value=2310},{type=15,value=5082},{type=128,value=290},{type=129,value=8316},},
{{type=17,value=2310},{type=19,value=5082},{type=128,value=290},{type=129,value=8316},},



					},		    	
			    },
				--30级  
				{
					consumes = {0, 0}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=2429},{type=11,value=5280},{type=128,value=300},{type=129,value=8750},},
{{type=13,value=2429},{type=15,value=5280},{type=128,value=300},{type=129,value=8750},},
{{type=17,value=2429},{type=19,value=5280},{type=128,value=300},{type=129,value=8750},},



					},		    	
			    },



		    },
		},
		
		-- 面甲
		{					
			Levels = {
								--0级  
				{
					consumes = {3, 250000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=0},{type=11,value=0},{type=128,value=0},{type=129,value=0},},
{{type=13,value=0},{type=15,value=0},{type=128,value=0},{type=129,value=0},},
{{type=17,value=0},{type=19,value=0},{type=128,value=0},{type=129,value=0},},



					},		    	
			    },
				--1级  
				{
					consumes = {6, 500000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=25},{type=11,value=55},{type=128,value=10},{type=129,value=90},},
{{type=13,value=25},{type=15,value=55},{type=128,value=10},{type=129,value=90},},
{{type=17,value=25},{type=19,value=55},{type=128,value=10},{type=129,value=90},},



					},		    	
			    },
				--2级  
				{
					consumes = {9, 750000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=55},{type=11,value=120},{type=128,value=20},{type=129,value=197},},
{{type=13,value=55},{type=15,value=120},{type=128,value=20},{type=129,value=197},},
{{type=17,value=55},{type=19,value=120},{type=128,value=20},{type=129,value=197},},



					},		    	
			    },
				--3级  
				{
					consumes = {12, 1000000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=88},{type=11,value=194},{type=128,value=30},{type=129,value=317},},
{{type=13,value=88},{type=15,value=194},{type=128,value=30},{type=129,value=317},},
{{type=17,value=88},{type=19,value=194},{type=128,value=30},{type=129,value=317},},



					},		    	
			    },
				--4级  
				{
					consumes = {15, 1250000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=126},{type=11,value=277},{type=128,value=40},{type=129,value=454},},
{{type=13,value=126},{type=15,value=277},{type=128,value=40},{type=129,value=454},},
{{type=17,value=126},{type=19,value=277},{type=128,value=40},{type=129,value=454},},



					},		    	
			    },
				--5级  
				{
					consumes = {18, 1500000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=168},{type=11,value=370},{type=128,value=50},{type=129,value=605},},
{{type=13,value=168},{type=15,value=370},{type=128,value=50},{type=129,value=605},},
{{type=17,value=168},{type=19,value=370},{type=128,value=50},{type=129,value=605},},



					},		    	
			    },
				--6级  
				{
					consumes = {21, 1750000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=214},{type=11,value=471},{type=128,value=60},{type=129,value=770},},
{{type=13,value=214},{type=15,value=471},{type=128,value=60},{type=129,value=770},},
{{type=17,value=214},{type=19,value=471},{type=128,value=60},{type=129,value=770},},



					},		    	
			    },
				--7级  
				{
					consumes = {24, 2000000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=265},{type=11,value=582},{type=128,value=70},{type=129,value=953},},
{{type=13,value=265},{type=15,value=582},{type=128,value=70},{type=129,value=953},},
{{type=17,value=265},{type=19,value=582},{type=128,value=70},{type=129,value=953},},



					},		    	
			    },
				--8级  
				{
					consumes = {27, 2250000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=319},{type=11,value=702},{type=128,value=80},{type=129,value=1148},},
{{type=13,value=319},{type=15,value=702},{type=128,value=80},{type=129,value=1148},},
{{type=17,value=319},{type=19,value=702},{type=128,value=80},{type=129,value=1148},},



					},		    	
			    },
				--9级  
				{
					consumes = {30, 2500000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=378},{type=11,value=832},{type=128,value=90},{type=129,value=1361},},
{{type=13,value=378},{type=15,value=832},{type=128,value=90},{type=129,value=1361},},
{{type=17,value=378},{type=19,value=832},{type=128,value=90},{type=129,value=1361},},



					},		    	
			    },
				--10级  
				{
					consumes = {33, 2750000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=441},{type=11,value=970},{type=128,value=100},{type=129,value=1588},},
{{type=13,value=441},{type=15,value=970},{type=128,value=100},{type=129,value=1588},},
{{type=17,value=441},{type=19,value=970},{type=128,value=100},{type=129,value=1588},},



					},		    	
			    },
				--11级  
				{
					consumes = {36, 3000000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=508},{type=11,value=1118},{type=128,value=110},{type=129,value=1829},},
{{type=13,value=508},{type=15,value=1118},{type=128,value=110},{type=129,value=1829},},
{{type=17,value=508},{type=19,value=1118},{type=128,value=110},{type=129,value=1829},},



					},		    	
			    },
				--12级  
				{
					consumes = {39, 3250000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=580},{type=11,value=1275},{type=128,value=120},{type=129,value=2087},},
{{type=13,value=580},{type=15,value=1275},{type=128,value=120},{type=129,value=2087},},
{{type=17,value=580},{type=19,value=1275},{type=128,value=120},{type=129,value=2087},},



					},		    	
			    },
				--13级  
				{
					consumes = {42, 3500000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=655},{type=11,value=1441},{type=128,value=130},{type=129,value=2358},},
{{type=13,value=655},{type=15,value=1441},{type=128,value=130},{type=129,value=2358},},
{{type=17,value=655},{type=19,value=1441},{type=128,value=130},{type=129,value=2358},},



					},		    	
			    },
				--14级  
				{
					consumes = {45, 3750000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=735},{type=11,value=1617},{type=128,value=140},{type=129,value=2646},},
{{type=13,value=735},{type=15,value=1617},{type=128,value=140},{type=129,value=2646},},
{{type=17,value=735},{type=19,value=1617},{type=128,value=140},{type=129,value=2646},},



					},		    	
			    },
				--15级  
				{
					consumes = {48, 4000000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=819},{type=11,value=1802},{type=128,value=150},{type=129,value=2948},},
{{type=13,value=819},{type=15,value=1802},{type=128,value=150},{type=129,value=2948},},
{{type=17,value=819},{type=19,value=1802},{type=128,value=150},{type=129,value=2948},},



					},		    	
			    },
				--16级  
				{
					consumes = {51, 4250000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=908},{type=11,value=1997},{type=128,value=160},{type=129,value=3267},},
{{type=13,value=908},{type=15,value=1997},{type=128,value=160},{type=129,value=3267},},
{{type=17,value=908},{type=19,value=1997},{type=128,value=160},{type=129,value=3267},},



					},		    	
			    },
				--17级  
				{
					consumes = {54, 4500000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=1000},{type=11,value=2199},{type=128,value=170},{type=129,value=3600},},
{{type=13,value=1000},{type=15,value=2199},{type=128,value=170},{type=129,value=3600},},
{{type=17,value=1000},{type=19,value=2199},{type=128,value=170},{type=129,value=3600},},



					},		    	
			    },
				--18级  
				{
					consumes = {57, 4750000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=1096},{type=11,value=2411},{type=128,value=180},{type=129,value=3946},},
{{type=13,value=1096},{type=15,value=2411},{type=128,value=180},{type=129,value=3946},},
{{type=17,value=1096},{type=19,value=2411},{type=128,value=180},{type=129,value=3946},},



					},		    	
			    },
				--19级  
				{
					consumes = {60, 5000000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=1198},{type=11,value=2635},{type=128,value=190},{type=129,value=4311},},
{{type=13,value=1198},{type=15,value=2635},{type=128,value=190},{type=129,value=4311},},
{{type=17,value=1198},{type=19,value=2635},{type=128,value=190},{type=129,value=4311},},



					},		    	
			    },
				--20级  
				{
					consumes = {63, 5250000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=1303},{type=11,value=2866},{type=128,value=200},{type=129,value=4689},},
{{type=13,value=1303},{type=15,value=2866},{type=128,value=200},{type=129,value=4689},},
{{type=17,value=1303},{type=19,value=2866},{type=128,value=200},{type=129,value=4689},},



					},		    	
			    },
				--21级  
				{
					consumes = {66, 5500000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=1409},{type=11,value=3099},{type=128,value=210},{type=129,value=5071},},
{{type=13,value=1409},{type=15,value=3099},{type=128,value=210},{type=129,value=5071},},
{{type=17,value=1409},{type=19,value=3099},{type=128,value=210},{type=129,value=5071},},



					},		    	
			    },
				--22级  
				{
					consumes = {69, 5750000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=1516},{type=11,value=3335},{type=128,value=220},{type=129,value=5458},},
{{type=13,value=1516},{type=15,value=3335},{type=128,value=220},{type=129,value=5458},},
{{type=17,value=1516},{type=19,value=3335},{type=128,value=220},{type=129,value=5458},},



					},		    	
			    },
				--23级  
				{
					consumes = {72, 6000000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=1626},{type=11,value=3576},{type=128,value=230},{type=129,value=5852},},
{{type=13,value=1626},{type=15,value=3576},{type=128,value=230},{type=129,value=5852},},
{{type=17,value=1626},{type=19,value=3576},{type=128,value=230},{type=129,value=5852},},



					},		    	
			    },
				--24级  
				{
					consumes = {75, 6250000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=1736},{type=11,value=3819},{type=128,value=240},{type=129,value=6250},},
{{type=13,value=1736},{type=15,value=3819},{type=128,value=240},{type=129,value=6250},},
{{type=17,value=1736},{type=19,value=3819},{type=128,value=240},{type=129,value=6250},},



					},		    	
			    },
				--25级  
				{
					consumes = {78, 6500000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=1848},{type=11,value=4066},{type=128,value=250},{type=129,value=6653},},
{{type=13,value=1848},{type=15,value=4066},{type=128,value=250},{type=129,value=6653},},
{{type=17,value=1848},{type=19,value=4066},{type=128,value=250},{type=129,value=6653},},



					},		    	
			    },
				--26级  
				{
					consumes = {81, 6750000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=1962},{type=11,value=4315},{type=128,value=260},{type=129,value=7061},},
{{type=13,value=1962},{type=15,value=4315},{type=128,value=260},{type=129,value=7061},},
{{type=17,value=1962},{type=19,value=4315},{type=128,value=260},{type=129,value=7061},},



					},		    	
			    },
				--27级  
				{
					consumes = {84, 7000000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=2076},{type=11,value=4567},{type=128,value=270},{type=129,value=7474},},
{{type=13,value=2076},{type=15,value=4567},{type=128,value=270},{type=129,value=7474},},
{{type=17,value=2076},{type=19,value=4567},{type=128,value=270},{type=129,value=7474},},



					},		    	
			    },
				--28级  
				{
					consumes = {87, 7250000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=2193},{type=11,value=4824},{type=128,value=280},{type=129,value=7893},},
{{type=13,value=2193},{type=15,value=4824},{type=128,value=280},{type=129,value=7893},},
{{type=17,value=2193},{type=19,value=4824},{type=128,value=280},{type=129,value=7893},},



					},		    	
			    },
				--29级  
				{
					consumes = {90, 7500000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=2310},{type=11,value=5082},{type=128,value=290},{type=129,value=8316},},
{{type=13,value=2310},{type=15,value=5082},{type=128,value=290},{type=129,value=8316},},
{{type=17,value=2310},{type=19,value=5082},{type=128,value=290},{type=129,value=8316},},



					},		    	
			    },
				--30级  
				{
					consumes = {0, 0}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=2429},{type=11,value=5280},{type=128,value=300},{type=129,value=8750},},
{{type=13,value=2429},{type=15,value=5280},{type=128,value=300},{type=129,value=8750},},
{{type=17,value=2429},{type=19,value=5280},{type=128,value=300},{type=129,value=8750},},



					},		    	
			    },



		    },
		},
		
		-- 护膝
		{			
			Levels = {
								--0级  
				{
					consumes = {3, 250000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=0},{type=11,value=0},{type=128,value=0},{type=129,value=0},},
{{type=13,value=0},{type=15,value=0},{type=128,value=0},{type=129,value=0},},
{{type=17,value=0},{type=19,value=0},{type=128,value=0},{type=129,value=0},},



					},		    	
			    },
				--1级  
				{
					consumes = {6, 500000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=25},{type=11,value=55},{type=128,value=10},{type=129,value=90},},
{{type=13,value=25},{type=15,value=55},{type=128,value=10},{type=129,value=90},},
{{type=17,value=25},{type=19,value=55},{type=128,value=10},{type=129,value=90},},



					},		    	
			    },
				--2级  
				{
					consumes = {9, 750000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=55},{type=11,value=120},{type=128,value=20},{type=129,value=197},},
{{type=13,value=55},{type=15,value=120},{type=128,value=20},{type=129,value=197},},
{{type=17,value=55},{type=19,value=120},{type=128,value=20},{type=129,value=197},},



					},		    	
			    },
				--3级  
				{
					consumes = {12, 1000000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=88},{type=11,value=194},{type=128,value=30},{type=129,value=317},},
{{type=13,value=88},{type=15,value=194},{type=128,value=30},{type=129,value=317},},
{{type=17,value=88},{type=19,value=194},{type=128,value=30},{type=129,value=317},},



					},		    	
			    },
				--4级  
				{
					consumes = {15, 1250000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=126},{type=11,value=277},{type=128,value=40},{type=129,value=454},},
{{type=13,value=126},{type=15,value=277},{type=128,value=40},{type=129,value=454},},
{{type=17,value=126},{type=19,value=277},{type=128,value=40},{type=129,value=454},},



					},		    	
			    },
				--5级  
				{
					consumes = {18, 1500000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=168},{type=11,value=370},{type=128,value=50},{type=129,value=605},},
{{type=13,value=168},{type=15,value=370},{type=128,value=50},{type=129,value=605},},
{{type=17,value=168},{type=19,value=370},{type=128,value=50},{type=129,value=605},},



					},		    	
			    },
				--6级  
				{
					consumes = {21, 1750000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=214},{type=11,value=471},{type=128,value=60},{type=129,value=770},},
{{type=13,value=214},{type=15,value=471},{type=128,value=60},{type=129,value=770},},
{{type=17,value=214},{type=19,value=471},{type=128,value=60},{type=129,value=770},},



					},		    	
			    },
				--7级  
				{
					consumes = {24, 2000000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=265},{type=11,value=582},{type=128,value=70},{type=129,value=953},},
{{type=13,value=265},{type=15,value=582},{type=128,value=70},{type=129,value=953},},
{{type=17,value=265},{type=19,value=582},{type=128,value=70},{type=129,value=953},},



					},		    	
			    },
				--8级  
				{
					consumes = {27, 2250000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=319},{type=11,value=702},{type=128,value=80},{type=129,value=1148},},
{{type=13,value=319},{type=15,value=702},{type=128,value=80},{type=129,value=1148},},
{{type=17,value=319},{type=19,value=702},{type=128,value=80},{type=129,value=1148},},



					},		    	
			    },
				--9级  
				{
					consumes = {30, 2500000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=378},{type=11,value=832},{type=128,value=90},{type=129,value=1361},},
{{type=13,value=378},{type=15,value=832},{type=128,value=90},{type=129,value=1361},},
{{type=17,value=378},{type=19,value=832},{type=128,value=90},{type=129,value=1361},},



					},		    	
			    },
				--10级  
				{
					consumes = {33, 2750000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=441},{type=11,value=970},{type=128,value=100},{type=129,value=1588},},
{{type=13,value=441},{type=15,value=970},{type=128,value=100},{type=129,value=1588},},
{{type=17,value=441},{type=19,value=970},{type=128,value=100},{type=129,value=1588},},



					},		    	
			    },
				--11级  
				{
					consumes = {36, 3000000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=508},{type=11,value=1118},{type=128,value=110},{type=129,value=1829},},
{{type=13,value=508},{type=15,value=1118},{type=128,value=110},{type=129,value=1829},},
{{type=17,value=508},{type=19,value=1118},{type=128,value=110},{type=129,value=1829},},



					},		    	
			    },
				--12级  
				{
					consumes = {39, 3250000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=580},{type=11,value=1275},{type=128,value=120},{type=129,value=2087},},
{{type=13,value=580},{type=15,value=1275},{type=128,value=120},{type=129,value=2087},},
{{type=17,value=580},{type=19,value=1275},{type=128,value=120},{type=129,value=2087},},



					},		    	
			    },
				--13级  
				{
					consumes = {42, 3500000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=655},{type=11,value=1441},{type=128,value=130},{type=129,value=2358},},
{{type=13,value=655},{type=15,value=1441},{type=128,value=130},{type=129,value=2358},},
{{type=17,value=655},{type=19,value=1441},{type=128,value=130},{type=129,value=2358},},



					},		    	
			    },
				--14级  
				{
					consumes = {45, 3750000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=735},{type=11,value=1617},{type=128,value=140},{type=129,value=2646},},
{{type=13,value=735},{type=15,value=1617},{type=128,value=140},{type=129,value=2646},},
{{type=17,value=735},{type=19,value=1617},{type=128,value=140},{type=129,value=2646},},



					},		    	
			    },
				--15级  
				{
					consumes = {48, 4000000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=819},{type=11,value=1802},{type=128,value=150},{type=129,value=2948},},
{{type=13,value=819},{type=15,value=1802},{type=128,value=150},{type=129,value=2948},},
{{type=17,value=819},{type=19,value=1802},{type=128,value=150},{type=129,value=2948},},



					},		    	
			    },
				--16级  
				{
					consumes = {51, 4250000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=908},{type=11,value=1997},{type=128,value=160},{type=129,value=3267},},
{{type=13,value=908},{type=15,value=1997},{type=128,value=160},{type=129,value=3267},},
{{type=17,value=908},{type=19,value=1997},{type=128,value=160},{type=129,value=3267},},



					},		    	
			    },
				--17级  
				{
					consumes = {54, 4500000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=1000},{type=11,value=2199},{type=128,value=170},{type=129,value=3600},},
{{type=13,value=1000},{type=15,value=2199},{type=128,value=170},{type=129,value=3600},},
{{type=17,value=1000},{type=19,value=2199},{type=128,value=170},{type=129,value=3600},},



					},		    	
			    },
				--18级  
				{
					consumes = {57, 4750000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=1096},{type=11,value=2411},{type=128,value=180},{type=129,value=3946},},
{{type=13,value=1096},{type=15,value=2411},{type=128,value=180},{type=129,value=3946},},
{{type=17,value=1096},{type=19,value=2411},{type=128,value=180},{type=129,value=3946},},



					},		    	
			    },
				--19级  
				{
					consumes = {60, 5000000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=1198},{type=11,value=2635},{type=128,value=190},{type=129,value=4311},},
{{type=13,value=1198},{type=15,value=2635},{type=128,value=190},{type=129,value=4311},},
{{type=17,value=1198},{type=19,value=2635},{type=128,value=190},{type=129,value=4311},},



					},		    	
			    },
				--20级  
				{
					consumes = {63, 5250000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=1303},{type=11,value=2866},{type=128,value=200},{type=129,value=4689},},
{{type=13,value=1303},{type=15,value=2866},{type=128,value=200},{type=129,value=4689},},
{{type=17,value=1303},{type=19,value=2866},{type=128,value=200},{type=129,value=4689},},



					},		    	
			    },
				--21级  
				{
					consumes = {66, 5500000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=1409},{type=11,value=3099},{type=128,value=210},{type=129,value=5071},},
{{type=13,value=1409},{type=15,value=3099},{type=128,value=210},{type=129,value=5071},},
{{type=17,value=1409},{type=19,value=3099},{type=128,value=210},{type=129,value=5071},},



					},		    	
			    },
				--22级  
				{
					consumes = {69, 5750000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=1516},{type=11,value=3335},{type=128,value=220},{type=129,value=5458},},
{{type=13,value=1516},{type=15,value=3335},{type=128,value=220},{type=129,value=5458},},
{{type=17,value=1516},{type=19,value=3335},{type=128,value=220},{type=129,value=5458},},



					},		    	
			    },
				--23级  
				{
					consumes = {72, 6000000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=1626},{type=11,value=3576},{type=128,value=230},{type=129,value=5852},},
{{type=13,value=1626},{type=15,value=3576},{type=128,value=230},{type=129,value=5852},},
{{type=17,value=1626},{type=19,value=3576},{type=128,value=230},{type=129,value=5852},},



					},		    	
			    },
				--24级  
				{
					consumes = {75, 6250000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=1736},{type=11,value=3819},{type=128,value=240},{type=129,value=6250},},
{{type=13,value=1736},{type=15,value=3819},{type=128,value=240},{type=129,value=6250},},
{{type=17,value=1736},{type=19,value=3819},{type=128,value=240},{type=129,value=6250},},



					},		    	
			    },
				--25级  
				{
					consumes = {78, 6500000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=1848},{type=11,value=4066},{type=128,value=250},{type=129,value=6653},},
{{type=13,value=1848},{type=15,value=4066},{type=128,value=250},{type=129,value=6653},},
{{type=17,value=1848},{type=19,value=4066},{type=128,value=250},{type=129,value=6653},},



					},		    	
			    },
				--26级  
				{
					consumes = {81, 6750000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=1962},{type=11,value=4315},{type=128,value=260},{type=129,value=7061},},
{{type=13,value=1962},{type=15,value=4315},{type=128,value=260},{type=129,value=7061},},
{{type=17,value=1962},{type=19,value=4315},{type=128,value=260},{type=129,value=7061},},



					},		    	
			    },
				--27级  
				{
					consumes = {84, 7000000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=2076},{type=11,value=4567},{type=128,value=270},{type=129,value=7474},},
{{type=13,value=2076},{type=15,value=4567},{type=128,value=270},{type=129,value=7474},},
{{type=17,value=2076},{type=19,value=4567},{type=128,value=270},{type=129,value=7474},},



					},		    	
			    },
				--28级  
				{
					consumes = {87, 7250000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=2193},{type=11,value=4824},{type=128,value=280},{type=129,value=7893},},
{{type=13,value=2193},{type=15,value=4824},{type=128,value=280},{type=129,value=7893},},
{{type=17,value=2193},{type=19,value=4824},{type=128,value=280},{type=129,value=7893},},



					},		    	
			    },
				--29级  
				{
					consumes = {90, 7500000}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=2310},{type=11,value=5082},{type=128,value=290},{type=129,value=8316},},
{{type=13,value=2310},{type=15,value=5082},{type=128,value=290},{type=129,value=8316},},
{{type=17,value=2310},{type=19,value=5082},{type=128,value=290},{type=129,value=8316},},



					},		    	
			    },
				--30级  
				{
					consumes = {0, 0}, -- 升到1级消耗 {锤炼石5648, 金币（优先扣除绑定金币）}								    	
					attrs = {
{{type=9,value=2429},{type=11,value=5280},{type=128,value=300},{type=129,value=8750},},
{{type=13,value=2429},{type=15,value=5280},{type=128,value=300},{type=129,value=8750},},
{{type=17,value=2429},{type=19,value=5280},{type=128,value=300},{type=129,value=8750},},



					},		    	
			    },


		    },
		},
		
	},
}