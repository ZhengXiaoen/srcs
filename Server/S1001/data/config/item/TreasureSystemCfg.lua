TreasureSystemCfg= --法宝配置
{
	levelUpNeedItem = 6271,
	
	--需要4转才显示
	needCircle = 0,
	needLevel=80,
	
	-- 每一阶的最高等级
	classMaxLevels = { 5, 10, 15, 20, 25, 30, 35, 40, 45, 50 },
	
	treasuerInfo = 
	{
		{
			breakLevelNeedItem = 6247,--突破所需物品
			--法宝id   阴阳镜
			treasureIds = {6251,6252,6253,6254,6255,7828,7829,7830,7831,7832},
			effectId = {401,402,403,404,405,405,405,405,405,405},

			skillId1 = {222,223,224,225,226,226,226,226,226,226},--战士
			skillId2 = {227,228,229,230,231,231,231,231,231,231},--法师
			skillId3 = {232,233,234,235,236,236,236,236,236,236},--道士

			-- 每阶突破所需物品的数量
			
			classConsumeCounts = { 1,4,8,16,32,64,128,256,512,800},
			
			-- 升级所需物品的数量
			levelConsumeCounts = {2,4,6,8,10,12,14,16,18,20,23,27,31,35,40,45,50,56,62,68,74,81,88,96,103,110,117,124,131,138,145,152,159,166,173,180,187,194,201,208,215,222,229,236,243,250,257,264,271,278},
			
			--触发法宝攻击的万分比
			--treasuerAttack = {10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,},
			treasuerAttack = {500,550,600,650,700,750,800,850,900,950,1000,1050,1100,1150,1200,1300,1400,1500,1600,1700,1800,1900,2000,2100,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,},
			
			-- 阶级属性
			classAttrs = {
				-- 战

					-- -- (a1) --
					-- {
					-- 	{type=(a2),value=(a3)},
			    	-- 	{type=(a4),value=(a5)},
					-- 	{type=(a6),value=(a7)},
					-- 	{type=(a8),value=(a9)},

		    		-- },

				{
										-- 1阶 --
					{
						{type=9,value=125},
			    		{type=11,value=262},
						{type=5,value=3120},
						{type=7,value=315},

		    		},
					-- 升阶1 --
					{
						{type=9,value=325},
			    		{type=11,value=682},
						{type=5,value=8320},
						{type=7,value=840},

		    		},
					-- 升阶2 --
					{
						{type=9,value=614},
			    		{type=11,value=1288},
						{type=5,value=16640},
						{type=7,value=1681},

		    		},
					-- 升阶3 --
					{
						{type=9,value=1080},
			    		{type=11,value=2266},
						{type=5,value=31200},
						{type=7,value=3152},

		    		},
					-- 升阶4 --
					{
						{type=9,value=1760},
			    		{type=11,value=3696},
						{type=5,value=57200},
						{type=7,value=5778},

		    		},

					-- 升阶6 --
					{
						{type=9,value=2440},
						{type=11,value=5126},
						{type=5,value=83200},
						{type=7,value=8004},

		    		},

					-- 升阶7 --
					{
						{type=9,value=3120},
						{type=11,value=6556},
						{type=5,value=109200},
						{type=7,value=10430},
		    		},

					-- 升阶8 --
					{
						{type=9,value=3800},
						{type=11,value=7986},
						{type=5,value=135200},
						{type=7,value=12856},
		    		},

					-- 升阶9 --
					{
						{type=9,value=4480},
						{type=11,value=9416},
						{type=5,value=161200},
						{type=7,value=15282},
		    		},

					-- 升阶10 --
					{
						{type=9,value=5160},
						{type=11,value=10846},
						{type=5,value=187200},
						{type=7,value=17708},
		    		},
		    	},
		    	
		    	-- 法
				{
										-- 1阶 --
					{
						{type=13,value=125},
			    		{type=15,value=262},
						{type=5,value=803},
						{type=7,value=3212},

		    		},
					-- 升阶1 --
					{
						{type=13,value=325},
			    		{type=15,value=682},
						{type=5,value=2139},
						{type=7,value=8556},

		    		},
					-- 升阶2 --
					{
						{type=13,value=614},
			    		{type=15,value=1288},
						{type=5,value=4278},
						{type=7,value=17112},

		    		},
					-- 升阶3 --
					{
						{type=13,value=1080},
			    		{type=15,value=2266},
						{type=5,value=8021},
						{type=7,value=32084},

		    		},
					-- 升阶4 --
					{
						{type=13,value=1760},
			    		{type=15,value=3696},
						{type=5,value=14705},
						{type=7,value=58820},

		    		},
					-- 升阶6 --
					{
						{type=13,value=2440},
						{type=15,value=5126},
						{type=5,value=21389},
						{type=7,value=85556},

		    		},
					-- 升阶7 --
					{
						{type=13,value=3120},
						{type=15,value=6556},
						{type=5,value=28073},
						{type=7,value=112292},
		    		},
					-- 升阶8 --
					{
						{type=13,value=3800},
						{type=15,value=7986},
						{type=5,value=34757},
						{type=7,value=139028},
		    		},
					-- 升阶9 --
					{
						{type=13,value=4480},
						{type=15,value=9416},
						{type=5,value=41441},
						{type=7,value=165764},
		    		},
					-- 升阶10 --
					{
						{type=13,value=5160},
						{type=15,value=10846},
						{type=5,value=48125},
						{type=7,value=192500},
		    		},

		    		
		    	},
		    	
		    	-- 道
				{
										-- 1阶 --
					{
						{type=17,value=125},
			    		{type=19,value=262},
						{type=5,value=1744},
						{type=7,value=1744},

		    		},
					-- 升阶1 --
					{
						{type=17,value=325},
			    		{type=19,value=682},
						{type=5,value=4649},
						{type=7,value=4649},

		    		},
					-- 升阶2 --
					{
						{type=17,value=614},
			    		{type=19,value=1288},
						{type=5,value=9297},
						{type=7,value=9297},

		    		},
					-- 升阶3 --
					{
						{type=17,value=1080},
			    		{type=19,value=2266},
						{type=5,value=17431},
						{type=7,value=17431},

		    		},
					-- 升阶4 --
					{
						{type=17,value=1760},
			    		{type=19,value=3696},
						{type=5,value=31956},
						{type=7,value=31956},

		    		},
					-- 升阶6 --
					{
						{type=17,value=2440},
						{type=19,value=5126},
						{type=5,value=46481},
						{type=7,value=46481},

		    		},
					-- 升阶7 --
					{
						{type=17,value=3120},
						{type=19,value=6556},
						{type=5,value=61006},
						{type=7,value=61006},

		    		},
					-- 升阶8 --
					{
						{type=17,value=3800},
						{type=19,value=7986},
						{type=5,value=75531},
						{type=7,value=75531},

		    		},
					-- 升阶9 --
					{
						{type=17,value=4480},
						{type=19,value=9416},
						{type=5,value=90056},
						{type=7,value=90056},
		    		},
					-- 升阶10 --
					{
						{type=17,value=5160},
						{type=19,value=10846},
						{type=5,value=104581},
						{type=7,value=104581},
		    		},

		    		
		    	},	
		    	
			},
			
			-- 等级属性
			levelAttrs = {
				-- 战
					-- -- 	--模块
					-- 			-- (a1) 级 --
					-- {
					-- 	{type=(a2),value=(a3)},
			    	-- 	{type=(a4),value=(a5)},
					-- 	{type=(a6),value=(a7)},
					-- 	{type=(a8),value=(a9)},

		    		-- },



				{
													-- 飞升1 级 --
					{
						{type=9,value=38},
			    		{type=11,value=78},
						{type=5,value=1300},
						{type=7,value=131},

		    		},
								-- 飞升2 级 --
					{
						{type=9,value=75},
			    		{type=11,value=157},
						{type=5,value=2600},
						{type=7,value=263},

		    		},
								-- 飞升3 级 --
					{
						{type=9,value=112},
			    		{type=11,value=235},
						{type=5,value=3900},
						{type=7,value=394},

		    		},
								-- 飞升4 级 --
					{
						{type=9,value=150},
			    		{type=11,value=314},
						{type=5,value=5200},
						{type=7,value=525},

		    		},
								-- 飞升5 级 --
					{
						{type=9,value=188},
			    		{type=11,value=393},
						{type=5,value=6240},
						{type=7,value=630},

		    		},
								-- 飞升6 级 --
					{
						{type=9,value=248},
			    		{type=11,value=519},
						{type=5,value=8320},
						{type=7,value=840},

		    		},
								-- 飞升7 级 --
					{
						{type=9,value=308},
			    		{type=11,value=645},
						{type=5,value=10400},
						{type=7,value=1051},

		    		},
								-- 飞升8 级 --
					{
						{type=9,value=368},
			    		{type=11,value=771},
						{type=5,value=12480},
						{type=7,value=1261},

		    		},
								-- 飞升9 级 --
					{
						{type=9,value=428},
			    		{type=11,value=897},
						{type=5,value=14560},
						{type=7,value=1471},

		    		},
								-- 飞升10 级 --
					{
						{type=9,value=488},
			    		{type=11,value=1023},
						{type=5,value=16640},
						{type=7,value=1681},

		    		},
								-- 飞升11 级 --
					{
						{type=9,value=573},
			    		{type=11,value=1202},
						{type=5,value=20020},
						{type=7,value=2022},

		    		},
								-- 飞升12 级 --
					{
						{type=9,value=660},
			    		{type=11,value=1384},
						{type=5,value=23400},
						{type=7,value=2364},

		    		},
								-- 飞升13 级 --
					{
						{type=9,value=746},
			    		{type=11,value=1566},
						{type=5,value=26780},
						{type=7,value=2705},

		    		},
								-- 飞升14 级 --
					{
						{type=9,value=833},
			    		{type=11,value=1748},
						{type=5,value=30160},
						{type=7,value=3046},

		    		},
								-- 飞升15 级 --
					{
						{type=9,value=920},
			    		{type=11,value=1932},
						{type=5,value=33280},
						{type=7,value=3362},

		    		},
								-- 飞升16 级 --
					{
						{type=9,value=1060},
			    		{type=11,value=2225},
						{type=5,value=39260},
						{type=7,value=3966},

		    		},
								-- 飞升17 级 --
					{
						{type=9,value=1200},
			    		{type=11,value=2518},
						{type=5,value=45240},
						{type=7,value=4570},

		    		},
								-- 飞升18 级 --
					{
						{type=9,value=1339},
			    		{type=11,value=2811},
						{type=5,value=51220},
						{type=7,value=5174},

		    		},
								-- 飞升19 级 --
					{
						{type=9,value=1479},
			    		{type=11,value=3104},
						{type=5,value=57200},
						{type=7,value=5778},

		    		},
								-- 飞升20 级 --
					{
						{type=9,value=1619},
			    		{type=11,value=3399},
						{type=5,value=62400},
						{type=7,value=6303},

		    		},
								-- 飞升21 级 --
					{
						{type=9,value=1823},
			    		{type=11,value=3828},
						{type=5,value=72800},
						{type=7,value=7354},

		    		},
								-- 飞升22 级 --
					{
						{type=9,value=2028},
			    		{type=11,value=4257},
						{type=5,value=83200},
						{type=7,value=8404},

		    		},
								-- 飞升23 级 --
					{
						{type=9,value=2232},
			    		{type=11,value=4686},
						{type=5,value=93600},
						{type=7,value=9455},

		    		},
								-- 飞升24 级 --
					{
						{type=9,value=2436},
			    		{type=11,value=5115},
						{type=5,value=104000},
						{type=7,value=10505},

		    		},
								-- 飞升25 级 --
					{
						{type=9,value=2640},
			    		{type=11,value=5544},
						{type=5,value=114400},
						{type=7,value=11556},

		    		},

						--飞升26级
					{	
						{type=9,value=2817},
						{type=11,value=5973},
						{type=5,value=124800},
						{type=7,value=12607},
					},
						--飞升27级
					{	
						{type=9,value=2994},
						{type=11,value=6402},
						{type=5,value=135200},
						{type=7,value=13658},
					},
						--飞升28级
					{	
						{type=9,value=3171},
						{type=11,value=6831},
						{type=5,value=145600},
						{type=7,value=14709},
					},
						--飞升29级
					{	
						{type=9,value=3348},
						{type=11,value=7260},
						{type=5,value=156000},
						{type=7,value=15760},
					},
						--飞升30级
					{	
						{type=9,value=3525},
						{type=11,value=7689},
						{type=5,value=166400},
						{type=7,value=16811},
					},
						--飞升31级
					{	
						{type=9,value=3702},
						{type=11,value=8118},
						{type=5,value=176800},
						{type=7,value=17862},
					},
						--飞升32级
					{	
						{type=9,value=3879},
						{type=11,value=8547},
						{type=5,value=187200},
						{type=7,value=18913},
					},
						--飞升33级
					{	
						{type=9,value=4056},
						{type=11,value=8976},
						{type=5,value=197600},
						{type=7,value=19964},
					},
						--飞升34级
					{	
						{type=9,value=4233},
						{type=11,value=9405},
						{type=5,value=208000},
						{type=7,value=21015},
					},
						--飞升35级
					{	
						{type=9,value=4410},
						{type=11,value=9834},
						{type=5,value=218400},
						{type=7,value=22066},
					},
						--飞升36级
					{	
						{type=9,value=4587},
						{type=11,value=10263},
						{type=5,value=228800},
						{type=7,value=23117},
					},
						--飞升37级
					{	
						{type=9,value=4764},
						{type=11,value=10692},
						{type=5,value=239200},
						{type=7,value=24168},
					},
						--飞升38级
					{	
						{type=9,value=4941},
						{type=11,value=11121},
						{type=5,value=249600},
						{type=7,value=25219},
					},
						--飞升39级
					{	
						{type=9,value=5118},
						{type=11,value=11550},
						{type=5,value=260000},
						{type=7,value=26270},
					},
						--飞升40级
					{	
						{type=9,value=5295},
						{type=11,value=11979},
						{type=5,value=270400},
						{type=7,value=27321},
					},
						--飞升41级
					{	
						{type=9,value=5472},
						{type=11,value=12408},
						{type=5,value=280800},
						{type=7,value=28372},
					},
						--飞升42级
					{	
						{type=9,value=5649},
						{type=11,value=12837},
						{type=5,value=291200},
						{type=7,value=29423},
					},
						--飞升43级
					{	
						{type=9,value=5826},
						{type=11,value=13266},
						{type=5,value=301600},
						{type=7,value=30474},
					},
						--飞升44级
					{	
						{type=9,value=6003},
						{type=11,value=13695},
						{type=5,value=312000},
						{type=7,value=31525},
					},
						--飞升45级
					{	
						{type=9,value=6180},
						{type=11,value=14124},
						{type=5,value=322400},
						{type=7,value=32576},
					},
						--飞升46级
					{	
						{type=9,value=6357},
						{type=11,value=14553},
						{type=5,value=332800},
						{type=7,value=33627},
					},
						--飞升47级
					{	
						{type=9,value=6534},
						{type=11,value=14982},
						{type=5,value=343200},
						{type=7,value=34678},
					},
						--飞升48级
					{	
						{type=9,value=6711},
						{type=11,value=15411},
						{type=5,value=353600},
						{type=7,value=35729},
					},
						--飞升49级
					{	
						{type=9,value=6888},
						{type=11,value=15840},
						{type=5,value=364000},
						{type=7,value=36780},
					},
						--飞升50级
					{	
						{type=9,value=7065},
						{type=11,value=16269},
						{type=5,value=374400},
						{type=7,value=37831},
					},
		    		
		    	},
		    	
		    	-- 法
				{
													-- 飞升1 级 --
					{
						{type=13,value=38},
			    		{type=15,value=78},
						{type=5,value=335},
						{type=7,value=1340},

		    		},
								-- 飞升2 级 --
					{
						{type=13,value=75},
			    		{type=15,value=157},
						{type=5,value=669},
						{type=7,value=2676},

		    		},
								-- 飞升3 级 --
					{
						{type=13,value=112},
			    		{type=15,value=235},
						{type=5,value=1003},
						{type=7,value=4012},

		    		},
								-- 飞升4 级 --
					{
						{type=13,value=150},
			    		{type=15,value=314},
						{type=5,value=1337},
						{type=7,value=5348},

		    		},
								-- 飞升5 级 --
					{
						{type=13,value=188},
			    		{type=15,value=393},
						{type=5,value=1605},
						{type=7,value=6420},

		    		},
								-- 飞升6 级 --
					{
						{type=13,value=248},
			    		{type=15,value=519},
						{type=5,value=2139},
						{type=7,value=8556},

		    		},
								-- 飞升7 级 --
					{
						{type=13,value=308},
			    		{type=15,value=645},
						{type=5,value=2674},
						{type=7,value=10696},

		    		},
								-- 飞升8 级 --
					{
						{type=13,value=368},
			    		{type=15,value=771},
						{type=5,value=3209},
						{type=7,value=12836},

		    		},
								-- 飞升9 级 --
					{
						{type=13,value=428},
			    		{type=15,value=897},
						{type=5,value=3743},
						{type=7,value=14972},

		    		},
								-- 飞升10 级 --
					{
						{type=13,value=488},
			    		{type=15,value=1023},
						{type=5,value=4278},
						{type=7,value=17112},

		    		},
								-- 飞升11 级 --
					{
						{type=13,value=573},
			    		{type=15,value=1202},
						{type=5,value=5147},
						{type=7,value=20588},

		    		},
								-- 飞升12 级 --
					{
						{type=13,value=660},
			    		{type=15,value=1384},
						{type=5,value=6016},
						{type=7,value=24064},

		    		},
								-- 飞升13 级 --
					{
						{type=13,value=746},
			    		{type=15,value=1566},
						{type=5,value=6885},
						{type=7,value=27540},

		    		},
								-- 飞升14 级 --
					{
						{type=13,value=833},
			    		{type=15,value=1748},
						{type=5,value=7754},
						{type=7,value=31016},

		    		},
								-- 飞升15 级 --
					{
						{type=13,value=920},
			    		{type=15,value=1932},
						{type=5,value=8556},
						{type=7,value=34224},

		    		},
								-- 飞升16 级 --
					{
						{type=13,value=1060},
			    		{type=15,value=2225},
						{type=5,value=10093},
						{type=7,value=40372},

		    		},
								-- 飞升17 级 --
					{
						{type=13,value=1200},
			    		{type=15,value=2518},
						{type=5,value=11630},
						{type=7,value=46520},

		    		},
								-- 飞升18 级 --
					{
						{type=13,value=1339},
			    		{type=15,value=2811},
						{type=5,value=13168},
						{type=7,value=52672},

		    		},
								-- 飞升19 级 --
					{
						{type=13,value=1479},
			    		{type=15,value=3104},
						{type=5,value=14705},
						{type=7,value=58820},

		    		},
								-- 飞升20 级 --
					{
						{type=13,value=1619},
			    		{type=15,value=3399},
						{type=5,value=16042},
						{type=7,value=64168},

		    		},
								-- 飞升21 级 --
					{
						{type=13,value=1823},
			    		{type=15,value=3828},
						{type=5,value=18715},
						{type=7,value=74860},

		    		},
								-- 飞升22 级 --
					{
						{type=13,value=2028},
			    		{type=15,value=4257},
						{type=5,value=21389},
						{type=7,value=85556},

		    		},
								-- 飞升23 级 --
					{
						{type=13,value=2232},
			    		{type=15,value=4686},
						{type=5,value=24062},
						{type=7,value=96248},

		    		},
								-- 飞升24 级 --
					{
						{type=13,value=2436},
			    		{type=15,value=5115},
						{type=5,value=26736},
						{type=7,value=106944},

		    		},
								-- 飞升25 级 --
					{
						{type=13,value=2640},
			    		{type=15,value=5544},
						{type=5,value=29409},
						{type=7,value=117636},

		    		},
						--飞升26级	
					{		
						{type=13,value=2817},
						{type=15,value=5973},
						{type=5,value=32082},
						{type=7,value=128328},
					},
						--飞升27级	
					{		
						{type=13,value=2994},
						{type=15,value=6402},
						{type=5,value=34755},
						{type=7,value=139020},
					},
						--飞升28级	
					{		
						{type=13,value=3171},
						{type=15,value=6831},
						{type=5,value=37428},
						{type=7,value=149712},
					},	
						--飞升29级	
					{		
						{type=13,value=3348},
						{type=15,value=7260},
						{type=5,value=40101},
						{type=7,value=160404},
					},	
						--飞升30级	
					{		
						{type=13,value=3525},
						{type=15,value=7689},
						{type=5,value=42774},
						{type=7,value=171096},
					},	
						--飞升31级	
					{		
						{type=13,value=3702},
						{type=15,value=8118},
						{type=5,value=45447},
						{type=7,value=181788},
					},	
						--飞升32级	
					{		
						{type=13,value=3879},
						{type=15,value=8547},
						{type=5,value=48120},
						{type=7,value=192480},
					},	
						--飞升33级	
					{		
						{type=13,value=4056},
						{type=15,value=8976},
						{type=5,value=50793},
						{type=7,value=203172},
					},	
						--飞升34级	
					{		
						{type=13,value=4233},
						{type=15,value=9405},
						{type=5,value=53466},
						{type=7,value=213864},
					},	
						--飞升35级	
					{		
						{type=13,value=4410},
						{type=15,value=9834},
						{type=5,value=56139},
						{type=7,value=224556},
					},	
						--飞升36级	
					{		
						{type=13,value=4587},
						{type=15,value=10263},
						{type=5,value=58812},
						{type=7,value=235248},
					},	
						--飞升37级	
					{		
						{type=13,value=4764},
						{type=15,value=10692},
						{type=5,value=61485},
						{type=7,value=245940},
					},	
						--飞升38级	
					{		
						{type=13,value=4941},
						{type=15,value=11121},
						{type=5,value=64158},
						{type=7,value=256632},
					},	
						--飞升39级	
					{		
						{type=13,value=5118},
						{type=15,value=11550},
						{type=5,value=66831},
						{type=7,value=267324},
					},	
						--飞升40级	
					{		
						{type=13,value=5295},
						{type=15,value=11979},
						{type=5,value=69504},
						{type=7,value=278016},
					},	
						--飞升41级	
					{		
						{type=13,value=5472},
						{type=15,value=12408},
						{type=5,value=72177},
						{type=7,value=288708},
					},	
						--飞升42级	
					{		
						{type=13,value=5649},
						{type=15,value=12837},
						{type=5,value=74850},
						{type=7,value=299400},
					},	
						--飞升43级	
					{		
						{type=13,value=5826},
						{type=15,value=13266},
						{type=5,value=77523},
						{type=7,value=310092},
					},	
						--飞升44级	
					{		
						{type=13,value=6003},
						{type=15,value=13695},
						{type=5,value=80196},
						{type=7,value=320784},
					},	
						--飞升45级	
					{		
						{type=13,value=6180},
						{type=15,value=14124},
						{type=5,value=82869},
						{type=7,value=331476},
					},	
						--飞升46级	
					{		
						{type=13,value=6357},
						{type=15,value=14553},
						{type=5,value=85542},
						{type=7,value=342168},
					},	
						--飞升47级	
					{		
						{type=13,value=6534},
						{type=15,value=14982},
						{type=5,value=88215},
						{type=7,value=352860},
					},	
						--飞升48级	
					{		
						{type=13,value=6711},
						{type=15,value=15411},
						{type=5,value=90888},
						{type=7,value=363552},
					},	
						--飞升49级	
					{		
						{type=13,value=6888},
						{type=15,value=15840},
						{type=5,value=93561},
						{type=7,value=374244},
					},	
						--飞升50级	
					{		
						{type=13,value=7065},
						{type=15,value=16269},
						{type=5,value=96234},
						{type=7,value=384936},
					},	

		    	},
		    	
		    	-- 道
				{
													-- 飞升1 级 --
					{
						{type=17,value=38},
			    		{type=19,value=78},
						{type=5,value=727},
						{type=7,value=727},

		    		},
								-- 飞升2 级 --
					{
						{type=17,value=75},
			    		{type=19,value=157},
						{type=5,value=1453},
						{type=7,value=1453},

		    		},
								-- 飞升3 级 --
					{
						{type=17,value=112},
			    		{type=19,value=235},
						{type=5,value=2179},
						{type=7,value=2179},

		    		},
								-- 飞升4 级 --
					{
						{type=17,value=150},
			    		{type=19,value=314},
						{type=5,value=2906},
						{type=7,value=2906},

		    		},
								-- 飞升5 级 --
					{
						{type=17,value=188},
			    		{type=19,value=393},
						{type=5,value=3487},
						{type=7,value=3487},

		    		},
								-- 飞升6 级 --
					{
						{type=17,value=248},
			    		{type=19,value=519},
						{type=5,value=4649},
						{type=7,value=4649},

		    		},
								-- 飞升7 级 --
					{
						{type=17,value=308},
			    		{type=19,value=645},
						{type=5,value=5811},
						{type=7,value=5811},

		    		},
								-- 飞升8 级 --
					{
						{type=17,value=368},
			    		{type=19,value=771},
						{type=5,value=6973},
						{type=7,value=6973},

		    		},
								-- 飞升9 级 --
					{
						{type=17,value=428},
			    		{type=19,value=897},
						{type=5,value=8135},
						{type=7,value=8135},

		    		},
								-- 飞升10 级 --
					{
						{type=17,value=488},
			    		{type=19,value=1023},
						{type=5,value=9297},
						{type=7,value=9297},

		    		},
								-- 飞升11 级 --
					{
						{type=17,value=573},
			    		{type=19,value=1202},
						{type=5,value=11185},
						{type=7,value=11185},

		    		},
								-- 飞升12 级 --
					{
						{type=17,value=660},
			    		{type=19,value=1384},
						{type=5,value=13073},
						{type=7,value=13073},

		    		},
								-- 飞升13 级 --
					{
						{type=17,value=746},
			    		{type=19,value=1566},
						{type=5,value=14961},
						{type=7,value=14961},

		    		},
								-- 飞升14 级 --
					{
						{type=17,value=833},
			    		{type=19,value=1748},
						{type=5,value=16850},
						{type=7,value=16850},

		    		},
								-- 飞升15 级 --
					{
						{type=17,value=920},
			    		{type=19,value=1932},
						{type=5,value=18593},
						{type=7,value=18593},

		    		},
								-- 飞升16 级 --
					{
						{type=17,value=1060},
			    		{type=19,value=2225},
						{type=5,value=21933},
						{type=7,value=21933},

		    		},
								-- 飞升17 级 --
					{
						{type=17,value=1200},
			    		{type=19,value=2518},
						{type=5,value=25274},
						{type=7,value=25274},

		    		},
								-- 飞升18 级 --
					{
						{type=17,value=1339},
			    		{type=19,value=2811},
						{type=5,value=28615},
						{type=7,value=28615},

		    		},
								-- 飞升19 级 --
					{
						{type=17,value=1479},
			    		{type=19,value=3104},
						{type=5,value=31956},
						{type=7,value=31956},

		    		},
								-- 飞升20 级 --
					{
						{type=17,value=1619},
			    		{type=19,value=3399},
						{type=5,value=34861},
						{type=7,value=34861},

		    		},
								-- 飞升21 级 --
					{
						{type=17,value=1823},
			    		{type=19,value=3828},
						{type=5,value=40671},
						{type=7,value=40671},

		    		},
								-- 飞升22 级 --
					{
						{type=17,value=2028},
			    		{type=19,value=4257},
						{type=5,value=46481},
						{type=7,value=46481},

		    		},
								-- 飞升23 级 --
					{
						{type=17,value=2232},
			    		{type=19,value=4686},
						{type=5,value=52291},
						{type=7,value=52291},

		    		},
								-- 飞升24 级 --
					{
						{type=17,value=2436},
			    		{type=19,value=5115},
						{type=5,value=58101},
						{type=7,value=58101},

		    		},
								-- 飞升25 级 --
					{
						{type=17,value=2640},
			    		{type=19,value=5544},
						{type=5,value=63911},
						{type=7,value=63911},

		    		},
						--飞升26级		
					{			
						{type=17,value=2817},	
						{type=19,value=5973},	
						{type=5,value=69721},	
						{type=7,value=69721},	
					},		
						--飞升27级		
					{			
						{type=17,value=2994},	
						{type=19,value=6402},	
						{type=5,value=75531},	
						{type=7,value=75531},	
					},		
						--飞升28级		
					{			
						{type=17,value=3171},	
						{type=19,value=6831},	
						{type=5,value=81341},	
						{type=7,value=81341},	
					},		
						--飞升29级		
					{			
						{type=17,value=3348},	
						{type=19,value=7260},	
						{type=5,value=87151},	
						{type=7,value=87151},	
					},		
						--飞升30级		
					{			
						{type=17,value=3525},	
						{type=19,value=7689},	
						{type=5,value=92961},	
						{type=7,value=92961},	
					},		
						--飞升31级		
					{			
						{type=17,value=3702},	
						{type=19,value=8118},	
						{type=5,value=98771},	
						{type=7,value=98771},	
					},		
						--飞升32级		
					{			
						{type=17,value=3879},	
						{type=19,value=8547},	
						{type=5,value=104581},	
						{type=7,value=104581},	
					},		
						--飞升33级		
					{			
						{type=17,value=4056},	
						{type=19,value=8976},	
						{type=5,value=110391},	
						{type=7,value=110391},	
					},		
						--飞升34级		
					{			
						{type=17,value=4233},	
						{type=19,value=9405},	
						{type=5,value=116201},	
						{type=7,value=116201},	
					},		
						--飞升35级		
					{			
						{type=17,value=4410},	
						{type=19,value=9834},	
						{type=5,value=122011},	
						{type=7,value=122011},	
					},		
						--飞升36级		
					{			
						{type=17,value=4587},	
						{type=19,value=10263},	
						{type=5,value=127821},	
						{type=7,value=127821},	
					},		
						--飞升37级		
					{			
						{type=17,value=4764},	
						{type=19,value=10692},	
						{type=5,value=133631},	
						{type=7,value=133631},	
					},		
						--飞升38级		
					{			
						{type=17,value=4941},	
						{type=19,value=11121},	
						{type=5,value=139441},	
						{type=7,value=139441},	
					},		
						--飞升39级		
					{			
						{type=17,value=5118},	
						{type=19,value=11550},	
						{type=5,value=145251},	
						{type=7,value=145251},	
					},		
						--飞升40级		
					{			
						{type=17,value=5295},	
						{type=19,value=11979},	
						{type=5,value=151061},	
						{type=7,value=151061},	
					},		
						--飞升41级		
					{			
						{type=17,value=5472},	
						{type=19,value=12408},	
						{type=5,value=156871},	
						{type=7,value=156871},	
					},		
						--飞升42级		
					{			
						{type=17,value=5649},	
						{type=19,value=12837},	
						{type=5,value=162681},	
						{type=7,value=162681},	
					},		
						--飞升43级		
					{			
						{type=17,value=5826},	
						{type=19,value=13266},	
						{type=5,value=168491},	
						{type=7,value=168491},	
					},		
						--飞升44级		
					{			
						{type=17,value=6003},	
						{type=19,value=13695},	
						{type=5,value=174301},	
						{type=7,value=174301},	
					},		
						--飞升45级		
					{			
						{type=17,value=6180},	
						{type=19,value=14124},	
						{type=5,value=180111},	
						{type=7,value=180111},	
					},		
						--飞升46级		
					{			
						{type=17,value=6357},	
						{type=19,value=14553},	
						{type=5,value=185921},	
						{type=7,value=185921},	
					},		
						--飞升47级		
					{			
						{type=17,value=6534},	
						{type=19,value=14982},	
						{type=5,value=191731},	
						{type=7,value=191731},	
					},		
						--飞升48级		
					{			
						{type=17,value=6711},	
						{type=19,value=15411},	
						{type=5,value=197541},	
						{type=7,value=197541},	
					},		
						--飞升49级		
					{			
						{type=17,value=6888},	
						{type=19,value=15840},	
						{type=5,value=203351},	
						{type=7,value=203351},	
					},		
						--飞升50级		
					{			
						{type=17,value=7065},	
						{type=19,value=16269},	
						{type=5,value=209161},	
						{type=7,value=209161},	
					},				    		
		    	},
			}			
		},
		{
			breakLevelNeedItem = 6248,--突破所需物品
			--法宝id --祝融剑
			treasureIds = {6256,6257,6258,6259,6260,7833,7834,7835,7836,7837},
			effectId = {501,502,503,504,505,505,505,505,505,505},

			skillId1 = {237,238,239,240,241,241,241,241,241,241},--战士
			skillId2 = {242,243,244,245,246,246,246,246,246,246},--法师
			skillId3 = {247,248,249,250,251,251,251,251,251,251},--道士

			-- 每阶突破所需物品的数量
			
			classConsumeCounts = { 1,4,8,16,32,64,128,256,512,800},
			
			-- 升级所需物品的数量
			levelConsumeCounts = {2,4,6,8,10,12,14,16,18,20,23,27,31,35,40,45,50,56,62,68,74,81,88,96,103,110,117,124,131,138,145,152,159,166,173,180,187,194,201,208,215,222,229,236,243,250,257,264,271,278},
			
			--触发法宝攻击的万分比
			--treasuerAttack = {10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,},
			treasuerAttack = {500,550,600,650,700,750,800,850,900,950,1000,1050,1100,1150,1200,1300,1400,1500,1600,1700,1800,1900,2000,2100,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,},
			-- 阶级属性
			classAttrs = {
				-- 战

					-- -- (a1) --
					-- {
					-- 	{type=(a2),value=(a3)},
			    	-- 	{type=(a4),value=(a5)},
					-- 	{type=(a6),value=(a7)},
					-- 	{type=(a8),value=(a9)},

		    		-- },

				{

									-- 1阶 --
					{
						{type=9,value=125},
			    		{type=11,value=262},
						{type=29,value=12},

		    		},
					-- 2阶 --
					{
						{type=9,value=325},
			    		{type=11,value=682},
						{type=29,value=32},

		    		},
					-- 3阶 --
					{
						{type=9,value=614},
			    		{type=11,value=1288},
						{type=29,value=64},

		    		},
					-- 4阶 --
					{
						{type=9,value=1080},
			    		{type=11,value=2266},
						{type=29,value=120},

		    		},
					-- 5阶 --
					{
						{type=9,value=1760},
			    		{type=11,value=3696},
						{type=29,value=220},

		    		},

					-- 6阶 --
					{
						{type=9,value=2440},
						{type=11,value=5126},
						{type=29,value=320},

		    		},

					-- 7阶 --
					{
						{type=9,value=3120},
						{type=11,value=6556},
						{type=29,value=420},

		    		},

					-- 8阶 --
					{
						{type=9,value=3800},
						{type=11,value=7986},
						{type=29,value=520},
		    		},

					-- 9阶 --
					{
						{type=9,value=4480},
						{type=11,value=9416},
						{type=29,value=620},
		    		},

					-- 10阶 --
					{
						{type=9,value=5160},
						{type=11,value=10846},
						{type=29,value=720},
		    		},

			},

		    	
		    	-- 法
				{
					
									-- 1阶 --
					{
						{type=13,value=125},
			    		{type=15,value=262},
						{type=29,value=12},

		    		},
					-- 2阶 --
					{
						{type=13,value=325},
			    		{type=15,value=682},
						{type=29,value=32},

		    		},
					-- 3阶 --
					{
						{type=13,value=614},
			    		{type=15,value=1288},
						{type=29,value=64},

		    		},
					-- 4阶 --
					{
						{type=13,value=1080},
			    		{type=15,value=2266},
						{type=29,value=120},

		    		},
					-- 5阶 --
					{
						{type=13,value=1760},
			    		{type=15,value=3696},
						{type=29,value=220},

		    		},
					-- 6阶 --
					{
						{type=13,value=2440},
						{type=15,value=5126},
						{type=29,value=320},

		    		},

					-- 7阶 --
					{
						{type=13,value=3120},
						{type=15,value=6556},
						{type=29,value=420},

		    		},

					-- 8阶 --
					{
						{type=13,value=3800},
						{type=15,value=7986},
						{type=29,value=520},
		    		},

					-- 9阶 --
					{
						{type=13,value=4480},
						{type=15,value=9416},
						{type=29,value=620},
		    		},

					-- 10阶 --
					{
						{type=13,value=5160},
						{type=15,value=10846},
						{type=29,value=720},
		    		},

		    		
		    	},
		    	
		    	-- 道
				{
		
										-- 1阶 --
					{
						{type=17,value=125},
			    		{type=19,value=262},
						{type=29,value=12},

		    		},
					-- 2阶 --
					{
						{type=17,value=325},
			    		{type=19,value=682},
						{type=29,value=32},

		    		},
					-- 3阶 --
					{
						{type=17,value=614},
			    		{type=19,value=1288},
						{type=29,value=64},

		    		},
					-- 4阶 --
					{
						{type=17,value=1080},
			    		{type=19,value=2266},
						{type=29,value=120},

		    		},
					-- 5阶 --
					{
						{type=17,value=1760},
			    		{type=19,value=3696},
						{type=29,value=220},

		    		},
					-- 6阶 --
					{
						{type=17,value=2440},
						{type=19,value=5126},
						{type=29,value=320},

		    		},

					-- 7阶 --
					{
						{type=17,value=3120},
						{type=19,value=6556},
						{type=29,value=420},

		    		},

					-- 8阶 --
					{
						{type=17,value=3800},
						{type=19,value=7986},
						{type=29,value=520},
		    		},

					-- 9阶 --
					{
						{type=17,value=4480},
						{type=19,value=9416},
						{type=29,value=620},
		    		},

					-- 10阶 --
					{
						{type=17,value=5160},
						{type=19,value=10846},
						{type=29,value=720},
		    		},
		    		
		    	},
		    	
			},
			
			-- 等级属性
			levelAttrs = {
				-- 战
					-- -- 	--模块
					-- 			-- (a1) 级 --
					-- {
					-- 	{type=(a2),value=(a3)},
			    	-- 	{type=(a4),value=(a5)},
					-- 	{type=(a6),value=(a7)},
					-- 	{type=(a8),value=(a9)},

		    		-- },



				{
													-- 飞升1 级 --
					{
						{type=9,value=38},
			    		{type=11,value=78},
						{type=29,value=5},

		    		},
								-- 飞升2 级 --
					{
						{type=9,value=75},
			    		{type=11,value=157},
						{type=29,value=10},

		    		},
								-- 飞升3 级 --
					{
						{type=9,value=112},
			    		{type=11,value=235},
						{type=29,value=15},

		    		},
								-- 飞升4 级 --
					{
						{type=9,value=150},
			    		{type=11,value=314},
						{type=29,value=20},

		    		},
								-- 飞升5 级 --
					{
						{type=9,value=188},
			    		{type=11,value=393},
						{type=29,value=24},

		    		},
								-- 飞升6 级 --
					{
						{type=9,value=248},
			    		{type=11,value=519},
						{type=29,value=32},

		    		},
								-- 飞升7 级 --
					{
						{type=9,value=308},
			    		{type=11,value=645},
						{type=29,value=40},

		    		},
								-- 飞升8 级 --
					{
						{type=9,value=368},
			    		{type=11,value=771},
						{type=29,value=48},

		    		},
								-- 飞升9 级 --
					{
						{type=9,value=428},
			    		{type=11,value=897},
						{type=29,value=56},

		    		},
								-- 飞升10 级 --
					{
						{type=9,value=488},
			    		{type=11,value=1023},
						{type=29,value=64},

		    		},
								-- 飞升11 级 --
					{
						{type=9,value=573},
			    		{type=11,value=1202},
						{type=29,value=77},

		    		},
								-- 飞升12 级 --
					{
						{type=9,value=660},
			    		{type=11,value=1384},
						{type=29,value=90},

		    		},
								-- 飞升13 级 --
					{
						{type=9,value=746},
			    		{type=11,value=1566},
						{type=29,value=103},

		    		},
								-- 飞升14 级 --
					{
						{type=9,value=833},
			    		{type=11,value=1748},
						{type=29,value=116},

		    		},
								-- 飞升15 级 --
					{
						{type=9,value=920},
			    		{type=11,value=1932},
						{type=29,value=128},

		    		},
								-- 飞升16 级 --
					{
						{type=9,value=1060},
			    		{type=11,value=2225},
						{type=29,value=151},

		    		},
								-- 飞升17 级 --
					{
						{type=9,value=1200},
			    		{type=11,value=2518},
						{type=29,value=174},

		    		},
								-- 飞升18 级 --
					{
						{type=9,value=1339},
			    		{type=11,value=2811},
						{type=29,value=197},

		    		},
								-- 飞升19 级 --
					{
						{type=9,value=1479},
			    		{type=11,value=3104},
						{type=29,value=220},

		    		},
								-- 飞升20 级 --
					{
						{type=9,value=1619},
			    		{type=11,value=3399},
						{type=29,value=240},

		    		},
								-- 飞升21 级 --
					{
						{type=9,value=1823},
			    		{type=11,value=3828},
						{type=29,value=280},

		    		},
								-- 飞升22 级 --
					{
						{type=9,value=2028},
			    		{type=11,value=4257},
						{type=29,value=320},

		    		},
								-- 飞升23 级 --
					{
						{type=9,value=2232},
			    		{type=11,value=4686},
						{type=29,value=360},

		    		},
								-- 飞升24 级 --
					{
						{type=9,value=2436},
			    		{type=11,value=5115},
						{type=29,value=400},

		    		},
								-- 飞升25 级 --
					{
						{type=9,value=2640},
			    		{type=11,value=5544},
						{type=29,value=440},

		    		},
							--飞升26级	
						{		
							{type=9,value=2844},
							{type=11,value=5973},
							{type=29,value=480},	
						},	
							--飞升27级	
						{		
							{type=9,value=3048},
							{type=11,value=6402},
							{type=29,value=520},	
						},	
							--飞升28级	
						{		
							{type=9,value=3252},
							{type=11,value=6831},
							{type=29,value=560},	
						},	
							--飞升29级	
						{		
							{type=9,value=3456},
							{type=11,value=7260},
							{type=29,value=600},	
						},	
							--飞升30级	
						{		
							{type=9,value=3660},
							{type=11,value=7689},
							{type=29,value=640},	
						},	
							--飞升31级	
						{		
							{type=9,value=3864},
							{type=11,value=8118},
							{type=29,value=680},	
						},	
							--飞升32级	
						{		
							{type=9,value=4068},
							{type=11,value=8547},
							{type=29,value=720},	
						},	
							--飞升33级	
						{		
							{type=9,value=4272},
							{type=11,value=8976},
							{type=29,value=760},	
						},	
							--飞升34级	
						{		
							{type=9,value=4476},
							{type=11,value=9405},
							{type=29,value=800},	
						},	
							--飞升35级	
						{		
							{type=9,value=4680},
							{type=11,value=9834},
							{type=29,value=840},	
						},	
							--飞升36级	
						{		
							{type=9,value=4884},
							{type=11,value=10263},
							{type=29,value=880},	
						},	
							--飞升37级	
						{		
							{type=9,value=5088},
							{type=11,value=10692},
							{type=29,value=920},	
						},	
							--飞升38级	
						{		
							{type=9,value=5292},
							{type=11,value=11121},
							{type=29,value=960},	
						},	
							--飞升39级	
						{		
							{type=9,value=5496},
							{type=11,value=11550},
							{type=29,value=1000},	
						},	
							--飞升40级	
						{		
							{type=9,value=5700},
							{type=11,value=11979},
							{type=29,value=1040},	
						},	
							--飞升41级	
						{		
							{type=9,value=5904},
							{type=11,value=12408},
							{type=29,value=1080},	
						},	
							--飞升42级	
						{		
							{type=9,value=6108},
							{type=11,value=12837},
							{type=29,value=1120},	
						},	
							--飞升43级	
						{		
							{type=9,value=6312},
							{type=11,value=13266},
							{type=29,value=1160},	
						},	
							--飞升44级	
						{		
							{type=9,value=6516},
							{type=11,value=13695},
							{type=29,value=1200},	
						},	
							--飞升45级	
						{		
							{type=9,value=6720},
							{type=11,value=14124},
							{type=29,value=1240},	
						},	
							--飞升46级	
						{		
							{type=9,value=6924},
							{type=11,value=14553},
							{type=29,value=1280},	
						},	
							--飞升47级	
						{		
							{type=9,value=7128},
							{type=11,value=14982},
							{type=29,value=1320},	
						},	
							--飞升48级	
						{		
							{type=9,value=7332},
							{type=11,value=15411},
							{type=29,value=1360},	
						},	
							--飞升49级	
						{		
							{type=9,value=7536},
							{type=11,value=15840},
							{type=29,value=1400},	
						},	
							--飞升50级	
						{		
							{type=9,value=7740},
							{type=11,value=16269},
							{type=29,value=1440},	
						},
		    		
		    	},
		    	
		    	-- 法
				{
												-- 飞升1 级 --
					{
						{type=13,value=38},
			    		{type=15,value=78},
						{type=29,value=5},

		    		},
								-- 飞升2 级 --
					{
						{type=13,value=75},
			    		{type=15,value=157},
						{type=29,value=10},

		    		},
								-- 飞升3 级 --
					{
						{type=13,value=112},
			    		{type=15,value=235},
						{type=29,value=15},

		    		},
								-- 飞升4 级 --
					{
						{type=13,value=150},
			    		{type=15,value=314},
						{type=29,value=20},

		    		},
								-- 飞升5 级 --
					{
						{type=13,value=188},
			    		{type=15,value=393},
						{type=29,value=24},

		    		},
								-- 飞升6 级 --
					{
						{type=13,value=248},
			    		{type=15,value=519},
						{type=29,value=32},

		    		},
								-- 飞升7 级 --
					{
						{type=13,value=308},
			    		{type=15,value=645},
						{type=29,value=40},

		    		},
								-- 飞升8 级 --
					{
						{type=13,value=368},
			    		{type=15,value=771},
						{type=29,value=48},

		    		},
								-- 飞升9 级 --
					{
						{type=13,value=428},
			    		{type=15,value=897},
						{type=29,value=56},

		    		},
								-- 飞升10 级 --
					{
						{type=13,value=488},
			    		{type=15,value=1023},
						{type=29,value=64},

		    		},
								-- 飞升11 级 --
					{
						{type=13,value=573},
			    		{type=15,value=1202},
						{type=29,value=77},

		    		},
								-- 飞升12 级 --
					{
						{type=13,value=660},
			    		{type=15,value=1384},
						{type=29,value=90},

		    		},
								-- 飞升13 级 --
					{
						{type=13,value=746},
			    		{type=15,value=1566},
						{type=29,value=103},

		    		},
								-- 飞升14 级 --
					{
						{type=13,value=833},
			    		{type=15,value=1748},
						{type=29,value=116},

		    		},
								-- 飞升15 级 --
					{
						{type=13,value=920},
			    		{type=15,value=1932},
						{type=29,value=128},

		    		},
								-- 飞升16 级 --
					{
						{type=13,value=1060},
			    		{type=15,value=2225},
						{type=29,value=151},

		    		},
								-- 飞升17 级 --
					{
						{type=13,value=1200},
			    		{type=15,value=2518},
						{type=29,value=174},

		    		},
								-- 飞升18 级 --
					{
						{type=13,value=1339},
			    		{type=15,value=2811},
						{type=29,value=197},

		    		},
								-- 飞升19 级 --
					{
						{type=13,value=1479},
			    		{type=15,value=3104},
						{type=29,value=220},

		    		},
								-- 飞升20 级 --
					{
						{type=13,value=1619},
			    		{type=15,value=3399},
						{type=29,value=240},

		    		},
								-- 飞升21 级 --
					{
						{type=13,value=1823},
			    		{type=15,value=3828},
						{type=29,value=280},

		    		},
								-- 飞升22 级 --
					{
						{type=13,value=2028},
			    		{type=15,value=4257},
						{type=29,value=320},

		    		},
								-- 飞升23 级 --
					{
						{type=13,value=2232},
			    		{type=15,value=4686},
						{type=29,value=360},

		    		},
								-- 飞升24 级 --
					{
						{type=13,value=2436},
			    		{type=15,value=5115},
						{type=29,value=400},

		    		},
								-- 飞升25 级 --
					{
						{type=13,value=2640},
			    		{type=15,value=5544},
						{type=29,value=440},

		    		},
	                            --飞升26级	
						{		
							{type=13,value=2844},
							{type=15,value=5973},
							{type=29,value=480},	
						},	
							--飞升27级	
						{		
							{type=13,value=3048},
							{type=15,value=6402},
							{type=29,value=520},	
						},	
							--飞升28级	
						{		
							{type=13,value=3252},
							{type=15,value=6831},
							{type=29,value=560},	
						},	
							--飞升29级	
						{		
							{type=13,value=3456},
							{type=15,value=7260},
							{type=29,value=600},	
						},	
							--飞升30级	
						{		
							{type=13,value=3660},
							{type=15,value=7689},
							{type=29,value=640},	
						},	
							--飞升31级	
						{		
							{type=13,value=3864},
							{type=15,value=8118},
							{type=29,value=680},	
						},	
							--飞升32级	
						{		
							{type=13,value=4068},
							{type=15,value=8547},
							{type=29,value=720},	
						},	
							--飞升33级	
						{		
							{type=13,value=4272},
							{type=15,value=8976},
							{type=29,value=760},	
						},	
							--飞升34级	
						{		
							{type=13,value=4476},
							{type=15,value=9405},
							{type=29,value=800},	
						},	
							--飞升35级	
						{		
							{type=13,value=4680},
							{type=15,value=9834},
							{type=29,value=840},	
						},	
							--飞升36级	
						{		
							{type=13,value=4884},
							{type=15,value=10263},
							{type=29,value=880},	
						},	
							--飞升37级	
						{		
							{type=13,value=5088},
							{type=15,value=10692},
							{type=29,value=920},	
						},	
							--飞升38级	
						{		
							{type=13,value=5292},
							{type=15,value=11121},
							{type=29,value=960},	
						},	
							--飞升39级	
						{		
							{type=13,value=5496},
							{type=15,value=11550},
							{type=29,value=1000},	
						},	
							--飞升40级	
						{		
							{type=13,value=5700},
							{type=15,value=11979},
							{type=29,value=1040},	
						},	
							--飞升41级	
						{		
							{type=13,value=5904},
							{type=15,value=12408},
							{type=29,value=1080},	
						},	
							--飞升42级	
						{		
							{type=13,value=6108},
							{type=15,value=12837},
							{type=29,value=1120},	
						},	
							--飞升43级	
						{		
							{type=13,value=6312},
							{type=15,value=13266},
							{type=29,value=1160},	
						},	
							--飞升44级	
						{		
							{type=13,value=6516},
							{type=15,value=13695},
							{type=29,value=1200},	
						},	
							--飞升45级	
						{		
							{type=13,value=6720},
							{type=15,value=14124},
							{type=29,value=1240},	
						},	
							--飞升46级	
						{		
							{type=13,value=6924},
							{type=15,value=14553},
							{type=29,value=1280},	
						},	
							--飞升47级	
						{		
							{type=13,value=7128},
							{type=15,value=14982},
							{type=29,value=1320},	
						},	
							--飞升48级	
						{		
							{type=13,value=7332},
							{type=15,value=15411},
							{type=29,value=1360},	
						},	
							--飞升49级	
						{		
							{type=13,value=7536},
							{type=15,value=15840},
							{type=29,value=1400},	
						},	
							--飞升50级	
						{		
							{type=13,value=7740},
							{type=15,value=16269},
							{type=29,value=1440},	
						},	


		    		
		    	},
		    	
		    	-- 道
				{
													-- 飞升1 级 --
					{
						{type=17,value=38},
			    		{type=19,value=78},
						{type=29,value=5},

		    		},
								-- 飞升2 级 --
					{
						{type=17,value=75},
			    		{type=19,value=157},
						{type=29,value=10},

		    		},
								-- 飞升3 级 --
					{
						{type=17,value=112},
			    		{type=19,value=235},
						{type=29,value=15},

		    		},
								-- 飞升4 级 --
					{
						{type=17,value=150},
			    		{type=19,value=314},
						{type=29,value=20},

		    		},
								-- 飞升5 级 --
					{
						{type=17,value=188},
			    		{type=19,value=393},
						{type=29,value=24},

		    		},
								-- 飞升6 级 --
					{
						{type=17,value=248},
			    		{type=19,value=519},
						{type=29,value=32},

		    		},
								-- 飞升7 级 --
					{
						{type=17,value=308},
			    		{type=19,value=645},
						{type=29,value=40},

		    		},
								-- 飞升8 级 --
					{
						{type=17,value=368},
			    		{type=19,value=771},
						{type=29,value=48},

		    		},
								-- 飞升9 级 --
					{
						{type=17,value=428},
			    		{type=19,value=897},
						{type=29,value=56},

		    		},
								-- 飞升10 级 --
					{
						{type=17,value=488},
			    		{type=19,value=1023},
						{type=29,value=64},

		    		},
								-- 飞升11 级 --
					{
						{type=17,value=573},
			    		{type=19,value=1202},
						{type=29,value=77},

		    		},
								-- 飞升12 级 --
					{
						{type=17,value=660},
			    		{type=19,value=1384},
						{type=29,value=90},

		    		},
								-- 飞升13 级 --
					{
						{type=17,value=746},
			    		{type=19,value=1566},
						{type=29,value=103},

		    		},
								-- 飞升14 级 --
					{
						{type=17,value=833},
			    		{type=19,value=1748},
						{type=29,value=116},

		    		},
								-- 飞升15 级 --
					{
						{type=17,value=920},
			    		{type=19,value=1932},
						{type=29,value=128},

		    		},
								-- 飞升16 级 --
					{
						{type=17,value=1060},
			    		{type=19,value=2225},
						{type=29,value=151},

		    		},
								-- 飞升17 级 --
					{
						{type=17,value=1200},
			    		{type=19,value=2518},
						{type=29,value=174},

		    		},
								-- 飞升18 级 --
					{
						{type=17,value=1339},
			    		{type=19,value=2811},
						{type=29,value=197},

		    		},
								-- 飞升19 级 --
					{
						{type=17,value=1479},
			    		{type=19,value=3104},
						{type=29,value=220},

		    		},
								-- 飞升20 级 --
					{
						{type=17,value=1619},
			    		{type=19,value=3399},
						{type=29,value=240},

		    		},
								-- 飞升21 级 --
					{
						{type=17,value=1823},
			    		{type=19,value=3828},
						{type=29,value=280},

		    		},
								-- 飞升22 级 --
					{
						{type=17,value=2028},
			    		{type=19,value=4257},
						{type=29,value=320},

		    		},
								-- 飞升23 级 --
					{
						{type=17,value=2232},
			    		{type=19,value=4686},
						{type=29,value=360},

		    		},
								-- 飞升24 级 --
					{
						{type=17,value=2436},
			    		{type=19,value=5115},
						{type=29,value=400},

		    		},
								-- 飞升25 级 --
					{
						{type=17,value=2640},
			    		{type=19,value=5544},
						{type=29,value=440},

		    		},
	                                                                                                       --飞升26级	
						{		
							{type=17,value=2844},
							{type=19,value=5973},
							{type=29,value=480},	
						},	
							--飞升27级	
						{		
							{type=17,value=3048},
							{type=19,value=6402},
							{type=29,value=520},	
						},	
							--飞升28级	
						{		
							{type=17,value=3252},
							{type=19,value=6831},
							{type=29,value=560},	
						},	
							--飞升29级	
						{		
							{type=17,value=3456},
							{type=19,value=7260},
							{type=29,value=600},	
						},	
							--飞升30级	
						{		
							{type=17,value=3660},
							{type=19,value=7689},
							{type=29,value=640},	
						},	
							--飞升31级	
						{		
							{type=17,value=3864},
							{type=19,value=8118},
							{type=29,value=680},	
						},	
							--飞升32级	
						{		
							{type=17,value=4068},
							{type=19,value=8547},
							{type=29,value=720},	
						},	
							--飞升33级	
						{		
							{type=17,value=4272},
							{type=19,value=8976},
							{type=29,value=760},	
						},	
							--飞升34级	
						{		
							{type=17,value=4476},
							{type=19,value=9405},
							{type=29,value=800},	
						},	
							--飞升35级	
						{		
							{type=17,value=4680},
							{type=19,value=9834},
							{type=29,value=840},	
						},	
							--飞升36级	
						{		
							{type=17,value=4884},
							{type=19,value=10263},
							{type=29,value=880},	
						},	
							--飞升37级	
						{		
							{type=17,value=5088},
							{type=19,value=10692},
							{type=29,value=920},	
						},	
							--飞升38级	
						{		
							{type=17,value=5292},
							{type=19,value=11121},
							{type=29,value=960},	
						},	
							--飞升39级	
						{		
							{type=17,value=5496},
							{type=19,value=11550},
							{type=29,value=1000},	
						},	
							--飞升40级	
						{		
							{type=17,value=5700},
							{type=19,value=11979},
							{type=29,value=1040},	
						},	
							--飞升41级	
						{		
							{type=17,value=5904},
							{type=19,value=12408},
							{type=29,value=1080},	
						},	
							--飞升42级	
						{		
							{type=17,value=6108},
							{type=19,value=12837},
							{type=29,value=1120},	
						},	
							--飞升43级	
						{		
							{type=17,value=6312},
							{type=19,value=13266},
							{type=29,value=1160},	
						},	
							--飞升44级	
						{		
							{type=17,value=6516},
							{type=19,value=13695},
							{type=29,value=1200},	
						},	
							--飞升45级	
						{		
							{type=17,value=6720},
							{type=19,value=14124},
							{type=29,value=1240},	
						},	
							--飞升46级	
						{		
							{type=17,value=6924},
							{type=19,value=14553},
							{type=29,value=1280},	
						},	
							--飞升47级	
						{		
							{type=17,value=7128},
							{type=19,value=14982},
							{type=29,value=1320},	
						},	
							--飞升48级	
						{		
							{type=17,value=7332},
							{type=19,value=15411},
							{type=29,value=1360},	
						},	
							--飞升49级	
						{		
							{type=17,value=7536},
							{type=19,value=15840},
							{type=29,value=1400},	
						},	
							--飞升50级	
						{		
							{type=17,value=7740},
							{type=19,value=16269},
							{type=29,value=1440},	
						},			    		
		    	},
			}	
			
		
		},
				{
			breakLevelNeedItem = 6249,--突破所需物品
			--法宝id  --火凤幡
			treasureIds = {6261,6262,6263,6264,6265,7838,7839,7840,7841,7842},
			effectId = {601,602,603,604,605,605,605,605,605,605},

			skillId1 = {252,253,254,255,256,256,256,256,256,256},--战士
			skillId2 = {257,258,259,260,261,261,261,261,261,261},--法师
			skillId3 = {262,263,264,265,266,266,266,266,266,266},--道士

-- 每阶突破所需物品的数量
			
			classConsumeCounts = { 1,4,8,16,32,64,128,256,512,800},
			
			-- 升级所需物品的数量
			levelConsumeCounts = {2,4,6,8,10,12,14,16,18,20,23,27,31,35,40,45,50,56,62,68,74,81,88,96,103,110,117,124,131,138,145,152,159,166,173,180,187,194,201,208,215,222,229,236,243,250,257,264,271,278},
			
			--触发法宝攻击的万分比
			--treasuerAttack = {10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,},
			treasuerAttack = {500,550,600,650,700,750,800,850,900,950,1000,1050,1100,1150,1200,1300,1400,1500,1600,1700,1800,1900,2000,2100,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,},
			-- 阶级属性
			classAttrs = {
				-- 战

					-- -- (a1) --
					-- {
					-- 	{type=(a2),value=(a3)},
			    	-- 	{type=(a4),value=(a5)},
					-- 	{type=(a6),value=(a7)},
					-- 	{type=(a8),value=(a9)},

		    		-- },

				{
										-- 1阶 --
					{
						{type=9,value=125},
			    		{type=11,value=262},
						{type=31,value=12},

		    		},
					-- 2阶 --
					{
						{type=9,value=325},
			    		{type=11,value=682},
						{type=31,value=32},

		    		},
					-- 3阶 --
					{
						{type=9,value=614},
			    		{type=11,value=1288},
						{type=31,value=64},

		    		},
					-- 4阶 --
					{
						{type=9,value=1080},
			    		{type=11,value=2266},
						{type=31,value=120},

		    		},
					-- 5阶 --
					{
						{type=9,value=1760},
			    		{type=11,value=3696},
						{type=31,value=220},

		    		},
					-- 6阶 --
					{
						{type=9,value=2440},
						{type=11,value=5126},
						{type=31,value=320},

		    		},

					-- 7阶 --
					{
						{type=9,value=3120},
						{type=11,value=6556},
						{type=31,value=420},

		    		},

					-- 8阶 --
					{
						{type=9,value=3800},
						{type=11,value=7986},
						{type=31,value=520},
		    		},

					-- 9阶 --
					{
						{type=9,value=4480},
						{type=11,value=9416},
						{type=31,value=620},
		    		},

					-- 10阶 --
					{
						{type=9,value=5160},
						{type=11,value=10846},
						{type=31,value=720},
		    		},
		    		
		    	},
		    	
		    	-- 法
				{
										-- 1阶 --
					{
						{type=13,value=125},
			    		{type=15,value=262},
						{type=31,value=12},

		    		},
					-- 2阶 --
					{
						{type=13,value=325},
			    		{type=15,value=682},
						{type=31,value=32},

		    		},
					-- 3阶 --
					{
						{type=13,value=614},
			    		{type=15,value=1288},
						{type=31,value=64},

		    		},
					-- 4阶 --
					{
						{type=13,value=1080},
			    		{type=15,value=2266},
						{type=31,value=120},

		    		},
					-- 5阶 --
					{
						{type=13,value=1760},
			    		{type=15,value=3696},
						{type=31,value=220},

		    		},
					-- 6阶 --
					{
						{type=13,value=2440},
						{type=15,value=5126},
						{type=31,value=320},

		    		},

					-- 7阶 --
					{
						{type=13,value=3120},
						{type=15,value=6556},
						{type=31,value=420},

		    		},

					-- 8阶 --
					{
						{type=13,value=3800},
						{type=15,value=7986},
						{type=31,value=520},
		    		},

					-- 9阶 --
					{
						{type=13,value=4480},
						{type=15,value=9416},
						{type=31,value=620},
		    		},

					-- 10阶 --
					{
						{type=13,value=5160},
						{type=15,value=10846},
						{type=31,value=720},
		    		},

		    		
		    	},
		    	
		    	-- 道
				{
										-- 1阶 --
					{
						{type=17,value=125},
			    		{type=19,value=262},
						{type=31,value=12},

		    		},
					-- 2阶 --
					{
						{type=17,value=325},
			    		{type=19,value=682},
						{type=31,value=32},

		    		},
					-- 3阶 --
					{
						{type=17,value=614},
			    		{type=19,value=1288},
						{type=31,value=64},

		    		},
					-- 4阶 --
					{
						{type=17,value=1080},
			    		{type=19,value=2266},
						{type=31,value=120},

		    		},
					-- 5阶 --
					{
						{type=17,value=1760},
			    		{type=19,value=3696},
						{type=31,value=220},

		    		},

					-- 6阶 --
					{
						{type=17,value=2440},
						{type=19,value=5126},
						{type=31,value=320},

		    		},

					-- 7阶 --
					{
						{type=17,value=3120},
						{type=19,value=6556},
						{type=31,value=420},

		    		},

					-- 8阶 --
					{
						{type=17,value=3800},
						{type=19,value=7986},
						{type=31,value=520},
		    		},

					-- 9阶 --
					{
						{type=17,value=4480},
						{type=19,value=9416},
						{type=31,value=620},
		    		},

					-- 10阶 --
					{
						{type=17,value=5160},
						{type=19,value=10846},
						{type=31,value=720},
		    		},	    		
		    	},	
		    	
			},
			
			-- 等级属性
			levelAttrs = {
				-- 战
					-- -- 	--模块
					-- 			-- (a1) 级 --
					-- {
					-- 	{type=(a2),value=(a3)},
			    	-- 	{type=(a4),value=(a5)},
					-- 	{type=(a6),value=(a7)},
					-- 	{type=(a8),value=(a9)},

		    		-- },



				{
									-- 飞升1 --
					{
						{type=9,value=38},
			    		{type=11,value=78},
						{type=31,value=5},

		    		},
					-- 飞升2 --
					{
						{type=9,value=75},
			    		{type=11,value=157},
						{type=31,value=10},

		    		},
					-- 飞升3 --
					{
						{type=9,value=112},
			    		{type=11,value=235},
						{type=31,value=15},

		    		},
					-- 飞升4 --
					{
						{type=9,value=150},
			    		{type=11,value=314},
						{type=31,value=20},

		    		},
					-- 飞升5 --
					{
						{type=9,value=188},
			    		{type=11,value=393},
						{type=31,value=24},

		    		},
					-- 飞升6 --
					{
						{type=9,value=248},
			    		{type=11,value=519},
						{type=31,value=32},

		    		},
					-- 飞升7 --
					{
						{type=9,value=308},
			    		{type=11,value=645},
						{type=31,value=40},

		    		},
					-- 飞升8 --
					{
						{type=9,value=368},
			    		{type=11,value=771},
						{type=31,value=48},

		    		},
					-- 飞升9 --
					{
						{type=9,value=428},
			    		{type=11,value=897},
						{type=31,value=56},

		    		},
					-- 飞升10 --
					{
						{type=9,value=488},
			    		{type=11,value=1023},
						{type=31,value=64},

		    		},
					-- 飞升11 --
					{
						{type=9,value=573},
			    		{type=11,value=1202},
						{type=31,value=77},

		    		},
					-- 飞升12 --
					{
						{type=9,value=660},
			    		{type=11,value=1384},
						{type=31,value=90},

		    		},
					-- 飞升13 --
					{
						{type=9,value=746},
			    		{type=11,value=1566},
						{type=31,value=103},

		    		},
					-- 飞升14 --
					{
						{type=9,value=833},
			    		{type=11,value=1748},
						{type=31,value=116},

		    		},
					-- 飞升15 --
					{
						{type=9,value=920},
			    		{type=11,value=1932},
						{type=31,value=128},

		    		},
					-- 飞升16 --
					{
						{type=9,value=1060},
			    		{type=11,value=2225},
						{type=31,value=151},

		    		},
					-- 飞升17 --
					{
						{type=9,value=1200},
			    		{type=11,value=2518},
						{type=31,value=174},

		    		},
					-- 飞升18 --
					{
						{type=9,value=1339},
			    		{type=11,value=2811},
						{type=31,value=197},

		    		},
					-- 飞升19 --
					{
						{type=9,value=1479},
			    		{type=11,value=3104},
						{type=31,value=220},

		    		},
					-- 飞升20 --
					{
						{type=9,value=1619},
			    		{type=11,value=3399},
						{type=31,value=240},

		    		},
					-- 飞升21 --
					{
						{type=9,value=1823},
			    		{type=11,value=3828},
						{type=31,value=280},

		    		},
					-- 飞升22 --
					{
						{type=9,value=2028},
			    		{type=11,value=4257},
						{type=31,value=320},

		    		},
					-- 飞升23 --
					{
						{type=9,value=2232},
			    		{type=11,value=4686},
						{type=31,value=360},

		    		},
					-- 飞升24 --
					{
						{type=9,value=2436},
			    		{type=11,value=5115},
						{type=31,value=400},

		    		},
					-- 飞升25 --
					{
						{type=9,value=2640},
			    		{type=11,value=5544},
						{type=31,value=440},

		    		},

						--飞升26级	
					{		
						{type=9,value=2844},
						{type=11,value=5973},
						{type=31,value=480},	
					},	
						--飞升27级	
					{		
						{type=9,value=3048},
						{type=11,value=6402},
						{type=31,value=520},	
					},	
						--飞升28级	
					{		
						{type=9,value=3252},
						{type=11,value=6831},
						{type=31,value=560},	
					},	
						--飞升29级	
					{		
						{type=9,value=3456},
						{type=11,value=7260},
						{type=31,value=600},	
					},	
						--飞升30级	
					{		
						{type=9,value=3660},
						{type=11,value=7689},
						{type=31,value=640},	
					},	
						--飞升31级	
					{		
						{type=9,value=3864},
						{type=11,value=8118},
						{type=31,value=680},	
					},	
						--飞升32级	
					{		
						{type=9,value=4068},
						{type=11,value=8547},
						{type=31,value=720},	
					},	
						--飞升33级	
					{		
						{type=9,value=4272},
						{type=11,value=8976},
						{type=31,value=760},	
					},	
						--飞升34级	
					{		
						{type=9,value=4476},
						{type=11,value=9405},
						{type=31,value=800},	
					},	
						--飞升35级	
					{		
						{type=9,value=4680},
						{type=11,value=9834},
						{type=31,value=840},	
					},	
						--飞升36级	
					{		
						{type=9,value=4884},
						{type=11,value=10263},
						{type=31,value=880},	
					},	
						--飞升37级	
					{		
						{type=9,value=5088},
						{type=11,value=10692},
						{type=31,value=920},	
					},	
						--飞升38级	
					{		
						{type=9,value=5292},
						{type=11,value=11121},
						{type=31,value=960},	
					},	
						--飞升39级	
					{		
						{type=9,value=5496},
						{type=11,value=11550},
						{type=31,value=1000},	
					},	
						--飞升40级	
					{		
						{type=9,value=5700},
						{type=11,value=11979},
						{type=31,value=1040},	
					},	
						--飞升41级	
					{		
						{type=9,value=5904},
						{type=11,value=12408},
						{type=31,value=1080},	
					},	
						--飞升42级	
					{		
						{type=9,value=6108},
						{type=11,value=12837},
						{type=31,value=1120},	
					},	
						--飞升43级	
					{		
						{type=9,value=6312},
						{type=11,value=13266},
						{type=31,value=1160},	
					},	
						--飞升44级	
					{		
						{type=9,value=6516},
						{type=11,value=13695},
						{type=31,value=1200},	
					},	
						--飞升45级	
					{		
						{type=9,value=6720},
						{type=11,value=14124},
						{type=31,value=1240},	
					},	
						--飞升46级	
					{		
						{type=9,value=6924},
						{type=11,value=14553},
						{type=31,value=1280},	
					},	
						--飞升47级	
					{		
						{type=9,value=7128},
						{type=11,value=14982},
						{type=31,value=1320},	
					},	
						--飞升48级	
					{		
						{type=9,value=7332},
						{type=11,value=15411},
						{type=31,value=1360},	
					},	
						--飞升49级	
					{		
						{type=9,value=7536},
						{type=11,value=15840},
						{type=31,value=1400},	
					},	
						--飞升50级	
					{		
						{type=9,value=7740},
						{type=11,value=16269},
						{type=31,value=1440},	
					},
		    		
		    	},
		    	
		    	-- 法
				{
									-- 飞升1 --
					{
						{type=13,value=38},
			    		{type=15,value=78},
						{type=31,value=5},

		    		},
					-- 飞升2 --
					{
						{type=13,value=75},
			    		{type=15,value=157},
						{type=31,value=10},

		    		},
					-- 飞升3 --
					{
						{type=13,value=112},
			    		{type=15,value=235},
						{type=31,value=15},

		    		},
					-- 飞升4 --
					{
						{type=13,value=150},
			    		{type=15,value=314},
						{type=31,value=20},

		    		},
					-- 飞升5 --
					{
						{type=13,value=188},
			    		{type=15,value=393},
						{type=31,value=24},

		    		},
					-- 飞升6 --
					{
						{type=13,value=248},
			    		{type=15,value=519},
						{type=31,value=32},

		    		},
					-- 飞升7 --
					{
						{type=13,value=308},
			    		{type=15,value=645},
						{type=31,value=40},

		    		},
					-- 飞升8 --
					{
						{type=13,value=368},
			    		{type=15,value=771},
						{type=31,value=48},

		    		},
					-- 飞升9 --
					{
						{type=13,value=428},
			    		{type=15,value=897},
						{type=31,value=56},

		    		},
					-- 飞升10 --
					{
						{type=13,value=488},
			    		{type=15,value=1023},
						{type=31,value=64},

		    		},
					-- 飞升11 --
					{
						{type=13,value=573},
			    		{type=15,value=1202},
						{type=31,value=77},

		    		},
					-- 飞升12 --
					{
						{type=13,value=660},
			    		{type=15,value=1384},
						{type=31,value=90},

		    		},
					-- 飞升13 --
					{
						{type=13,value=746},
			    		{type=15,value=1566},
						{type=31,value=103},

		    		},
					-- 飞升14 --
					{
						{type=13,value=833},
			    		{type=15,value=1748},
						{type=31,value=116},

		    		},
					-- 飞升15 --
					{
						{type=13,value=920},
			    		{type=15,value=1932},
						{type=31,value=128},

		    		},
					-- 飞升16 --
					{
						{type=13,value=1060},
			    		{type=15,value=2225},
						{type=31,value=151},

		    		},
					-- 飞升17 --
					{
						{type=13,value=1200},
			    		{type=15,value=2518},
						{type=31,value=174},

		    		},
					-- 飞升18 --
					{
						{type=13,value=1339},
			    		{type=15,value=2811},
						{type=31,value=197},

		    		},
					-- 飞升19 --
					{
						{type=13,value=1479},
			    		{type=15,value=3104},
						{type=31,value=220},

		    		},
					-- 飞升20 --
					{
						{type=13,value=1619},
			    		{type=15,value=3399},
						{type=31,value=240},

		    		},
					-- 飞升21 --
					{
						{type=13,value=1823},
			    		{type=15,value=3828},
						{type=31,value=280},

		    		},
					-- 飞升22 --
					{
						{type=13,value=2028},
			    		{type=15,value=4257},
						{type=31,value=320},

		    		},
					-- 飞升23 --
					{
						{type=13,value=2232},
			    		{type=15,value=4686},
						{type=31,value=360},

		    		},
					-- 飞升24 --
					{
						{type=13,value=2436},
			    		{type=15,value=5115},
						{type=31,value=400},

		    		},
					-- 飞升25 --
					{
						{type=13,value=2640},
			    		{type=15,value=5544},
						{type=31,value=440},

		    		},
						--飞升26级	
					{		
						{type=13,value=2844},
						{type=15,value=5973},
						{type=31,value=480},	
					},	
						--飞升27级	
					{		
						{type=13,value=3048},
						{type=15,value=6402},
						{type=31,value=520},	
					},	
						--飞升28级	
					{		
						{type=13,value=3252},
						{type=15,value=6831},
						{type=31,value=560},	
					},	
						--飞升29级	
					{		
						{type=13,value=3456},
						{type=15,value=7260},
						{type=31,value=600},	
					},	
						--飞升30级	
					{		
						{type=13,value=3660},
						{type=15,value=7689},
						{type=31,value=640},	
					},	
						--飞升31级	
					{		
						{type=13,value=3864},
						{type=15,value=8118},
						{type=31,value=680},	
					},	
						--飞升32级	
					{		
						{type=13,value=4068},
						{type=15,value=8547},
						{type=31,value=720},	
					},	
						--飞升33级	
					{		
						{type=13,value=4272},
						{type=15,value=8976},
						{type=31,value=760},	
					},	
						--飞升34级	
					{		
						{type=13,value=4476},
						{type=15,value=9405},
						{type=31,value=800},	
					},	
						--飞升35级	
					{		
						{type=13,value=4680},
						{type=15,value=9834},
						{type=31,value=840},	
					},	
						--飞升36级	
					{		
						{type=13,value=4884},
						{type=15,value=10263},
						{type=31,value=880},	
					},	
						--飞升37级	
					{		
						{type=13,value=5088},
						{type=15,value=10692},
						{type=31,value=920},	
					},	
						--飞升38级	
					{		
						{type=13,value=5292},
						{type=15,value=11121},
						{type=31,value=960},	
					},	
						--飞升39级	
					{		
						{type=13,value=5496},
						{type=15,value=11550},
						{type=31,value=1000},	
					},	
						--飞升40级	
					{		
						{type=13,value=5700},
						{type=15,value=11979},
						{type=31,value=1040},	
					},	
						--飞升41级	
					{		
						{type=13,value=5904},
						{type=15,value=12408},
						{type=31,value=1080},	
					},	
						--飞升42级	
					{		
						{type=13,value=6108},
						{type=15,value=12837},
						{type=31,value=1120},	
					},	
						--飞升43级	
					{		
						{type=13,value=6312},
						{type=15,value=13266},
						{type=31,value=1160},	
					},	
						--飞升44级	
					{		
						{type=13,value=6516},
						{type=15,value=13695},
						{type=31,value=1200},	
					},	
						--飞升45级	
					{		
						{type=13,value=6720},
						{type=15,value=14124},
						{type=31,value=1240},	
					},	
						--飞升46级	
					{		
						{type=13,value=6924},
						{type=15,value=14553},
						{type=31,value=1280},	
					},	
						--飞升47级	
					{		
						{type=13,value=7128},
						{type=15,value=14982},
						{type=31,value=1320},	
					},	
						--飞升48级	
					{		
						{type=13,value=7332},
						{type=15,value=15411},
						{type=31,value=1360},	
					},	
						--飞升49级	
					{		
						{type=13,value=7536},
						{type=15,value=15840},
						{type=31,value=1400},	
					},	
						--飞升50级	
					{		
						{type=13,value=7740},
						{type=15,value=16269},
						{type=31,value=1440},	
					},
		    		
		    	},
		    	
		    	-- 道
				{
										-- 飞升1 --
					{
						{type=17,value=38},
			    		{type=19,value=78},
						{type=31,value=5},

		    		},
					-- 飞升2 --
					{
						{type=17,value=75},
			    		{type=19,value=157},
						{type=31,value=10},

		    		},
					-- 飞升3 --
					{
						{type=17,value=112},
			    		{type=19,value=235},
						{type=31,value=15},

		    		},
					-- 飞升4 --
					{
						{type=17,value=150},
			    		{type=19,value=314},
						{type=31,value=20},

		    		},
					-- 飞升5 --
					{
						{type=17,value=188},
			    		{type=19,value=393},
						{type=31,value=24},

		    		},
					-- 飞升6 --
					{
						{type=17,value=248},
			    		{type=19,value=519},
						{type=31,value=32},

		    		},
					-- 飞升7 --
					{
						{type=17,value=308},
			    		{type=19,value=645},
						{type=31,value=40},

		    		},
					-- 飞升8 --
					{
						{type=17,value=368},
			    		{type=19,value=771},
						{type=31,value=48},

		    		},
					-- 飞升9 --
					{
						{type=17,value=428},
			    		{type=19,value=897},
						{type=31,value=56},

		    		},
					-- 飞升10 --
					{
						{type=17,value=488},
			    		{type=19,value=1023},
						{type=31,value=64},

		    		},
					-- 飞升11 --
					{
						{type=17,value=573},
			    		{type=19,value=1202},
						{type=31,value=77},

		    		},
					-- 飞升12 --
					{
						{type=17,value=660},
			    		{type=19,value=1384},
						{type=31,value=90},

		    		},
					-- 飞升13 --
					{
						{type=17,value=746},
			    		{type=19,value=1566},
						{type=31,value=103},

		    		},
					-- 飞升14 --
					{
						{type=17,value=833},
			    		{type=19,value=1748},
						{type=31,value=116},

		    		},
					-- 飞升15 --
					{
						{type=17,value=920},
			    		{type=19,value=1932},
						{type=31,value=128},

		    		},
					-- 飞升16 --
					{
						{type=17,value=1060},
			    		{type=19,value=2225},
						{type=31,value=151},

		    		},
					-- 飞升17 --
					{
						{type=17,value=1200},
			    		{type=19,value=2518},
						{type=31,value=174},

		    		},
					-- 飞升18 --
					{
						{type=17,value=1339},
			    		{type=19,value=2811},
						{type=31,value=197},

		    		},
					-- 飞升19 --
					{
						{type=17,value=1479},
			    		{type=19,value=3104},
						{type=31,value=220},

		    		},
					-- 飞升20 --
					{
						{type=17,value=1619},
			    		{type=19,value=3399},
						{type=31,value=240},

		    		},
					-- 飞升21 --
					{
						{type=17,value=1823},
			    		{type=19,value=3828},
						{type=31,value=280},

		    		},
					-- 飞升22 --
					{
						{type=17,value=2028},
			    		{type=19,value=4257},
						{type=31,value=320},

		    		},
					-- 飞升23 --
					{
						{type=17,value=2232},
			    		{type=19,value=4686},
						{type=31,value=360},

		    		},
					-- 飞升24 --
					{
						{type=17,value=2436},
			    		{type=19,value=5115},
						{type=31,value=400},

		    		},
					-- 飞升25 --
					{
						{type=17,value=2640},
			    		{type=19,value=5544},
						{type=31,value=440},

		    		},
						--飞升26级	
					{		
						{type=17,value=2844},
						{type=19,value=5973},
						{type=31,value=480},	
					},	
						--飞升27级	
					{		
						{type=17,value=3048},
						{type=19,value=6402},
						{type=31,value=520},	
					},	
						--飞升28级	
					{		
						{type=17,value=3252},
						{type=19,value=6831},
						{type=31,value=560},	
					},	
						--飞升29级	
					{		
						{type=17,value=3456},
						{type=19,value=7260},
						{type=31,value=600},	
					},	
						--飞升30级	
					{		
						{type=17,value=3660},
						{type=19,value=7689},
						{type=31,value=640},	
					},	
						--飞升31级	
					{		
						{type=17,value=3864},
						{type=19,value=8118},
						{type=31,value=680},	
					},	
						--飞升32级	
					{		
						{type=17,value=4068},
						{type=19,value=8547},
						{type=31,value=720},	
					},	
						--飞升33级	
					{		
						{type=17,value=4272},
						{type=19,value=8976},
						{type=31,value=760},	
					},	
						--飞升34级	
					{		
						{type=17,value=4476},
						{type=19,value=9405},
						{type=31,value=800},	
					},	
						--飞升35级	
					{		
						{type=17,value=4680},
						{type=19,value=9834},
						{type=31,value=840},	
					},	
						--飞升36级	
					{		
						{type=17,value=4884},
						{type=19,value=10263},
						{type=31,value=880},	
					},	
						--飞升37级	
					{		
						{type=17,value=5088},
						{type=19,value=10692},
						{type=31,value=920},	
					},	
						--飞升38级	
					{		
						{type=17,value=5292},
						{type=19,value=11121},
						{type=31,value=960},	
					},	
						--飞升39级	
					{		
						{type=17,value=5496},
						{type=19,value=11550},
						{type=31,value=1000},	
					},	
						--飞升40级	
					{		
						{type=17,value=5700},
						{type=19,value=11979},
						{type=31,value=1040},	
					},	
						--飞升41级	
					{		
						{type=17,value=5904},
						{type=19,value=12408},
						{type=31,value=1080},	
					},	
						--飞升42级	
					{		
						{type=17,value=6108},
						{type=19,value=12837},
						{type=31,value=1120},	
					},	
						--飞升43级	
					{		
						{type=17,value=6312},
						{type=19,value=13266},
						{type=31,value=1160},	
					},	
						--飞升44级	
					{		
						{type=17,value=6516},
						{type=19,value=13695},
						{type=31,value=1200},	
					},	
						--飞升45级	
					{		
						{type=17,value=6720},
						{type=19,value=14124},
						{type=31,value=1240},	
					},	
						--飞升46级	
					{		
						{type=17,value=6924},
						{type=19,value=14553},
						{type=31,value=1280},	
					},	
						--飞升47级	
					{		
						{type=17,value=7128},
						{type=19,value=14982},
						{type=31,value=1320},	
					},	
						--飞升48级	
					{		
						{type=17,value=7332},
						{type=19,value=15411},
						{type=31,value=1360},	
					},	
						--飞升49级	
					{		
						{type=17,value=7536},
						{type=19,value=15840},
						{type=31,value=1400},	
					},	
						--飞升50级	
					{		
						{type=17,value=7740},
						{type=19,value=16269},
						{type=31,value=1440},	
					},
		    		
		    	},
			}	
			
		
		},
				{
			breakLevelNeedItem = 6250,--突破所需物品
			--法宝id 龍夕火
			treasureIds = {6266,6267,6268,6269,6270,7843,7844,7845,7846,7847},
			effectId = {701,702,703,704,705,705,705,705,705,705},

			skillId1 = {267,268,269,270,271,271,271,271,271,271},--战士
			skillId2 = {272,273,274,275,276,276,276,276,276,276},--法师
			skillId3 = {277,278,279,280,281,281,281,281,281,281},--道士

-- 每阶突破所需物品的数量
			
			classConsumeCounts = { 1,4,8,16,32,64,128,256,512,800},
			
			-- 升级所需物品的数量
			levelConsumeCounts = {2,4,6,8,10,12,14,16,18,20,23,27,31,35,40,45,50,56,62,68,74,81,88,96,103,110,117,124,131,138,145,152,159,166,173,180,187,194,201,208,215,222,229,236,243,250,257,264,271,278},
			
			--触发法宝攻击的万分比
			--treasuerAttack = {10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,},
			treasuerAttack = {500,550,600,650,700,750,800,850,900,950,1000,1050,1100,1150,1200,1300,1400,1500,1600,1700,1800,1900,2000,2100,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,},
			-- 阶级属性
			classAttrs = {
				-- 战

					-- -- (a1) --
					-- {
					-- 	{type=(a2),value=(a3)},
			    	-- 	{type=(a4),value=(a5)},
					-- 	{type=(a6),value=(a7)},
					-- 	{type=(a8),value=(a9)},

		    		-- },

				{
								-- 1阶 
					{
						{type=9,value=125},
			    		{type=11,value=262},
						{type=128,value=40},
						{type=129,value=624},

		    		},
				-- 2阶 
					{
						{type=9,value=325},
			    		{type=11,value=682},
						{type=128,value=80},
						{type=129,value=1664},

		    		},
				-- 3阶 
					{
						{type=9,value=614},
			    		{type=11,value=1288},
						{type=128,value=120},
						{type=129,value=3328},

		    		},
				-- 4阶 
					{
						{type=9,value=1080},
			    		{type=11,value=2266},
						{type=128,value=160},
						{type=129,value=6240},

		    		},
				-- 5阶 
					{
						{type=9,value=1760},
			    		{type=11,value=3696},
						{type=128,value=200},
						{type=129,value=11440},

		    		},
				-- 6阶 
					{
						{type=9,value=2440},
						{type=11,value=5126},
						{type=128,value=240},
						{type=129,value=16640},

		    		},
				-- 7阶 
					{
						{type=9,value=3120},
						{type=11,value=6556},
						{type=128,value=280},
						{type=129,value=21840},

		    		},
				-- 8阶 
					{
						{type=9,value=3800},
						{type=11,value=7986},
						{type=128,value=320},
						{type=129,value=27040},

		    		},
				-- 9阶 
					{
						{type=9,value=4480},
						{type=11,value=9416},
						{type=128,value=360},
						{type=129,value=32240},

		    		},
				-- 10阶 
					{
						{type=9,value=5160},
						{type=11,value=10846},
						{type=128,value=400},
						{type=129,value=37440},
		    		},	    		
		    	},
		    	
		    	-- 法
				{
									-- 1阶 
					{
						{type=13,value=125},
			    		{type=15,value=262},
						{type=128,value=40},
						{type=129,value=624},

		    		},
				-- 2阶 
					{
						{type=13,value=325},
			    		{type=15,value=682},
						{type=128,value=80},
						{type=129,value=1664},

		    		},
				-- 3阶 
					{
						{type=13,value=614},
			    		{type=15,value=1288},
						{type=128,value=120},
						{type=129,value=3328},

		    		},
				-- 4阶 
					{
						{type=13,value=1080},
			    		{type=15,value=2266},
						{type=128,value=160},
						{type=129,value=6240},

		    		},
				-- 5阶 
					{
						{type=13,value=1760},
			    		{type=15,value=3696},
						{type=128,value=200},
						{type=129,value=11440},

		    		},
				-- 6阶 
					{
						{type=13,value=2440},
						{type=15,value=5126},
						{type=128,value=240},
						{type=129,value=16640},

		    		},
				-- 7阶 
					{
						{type=13,value=3120},
						{type=15,value=6556},
						{type=128,value=280},
						{type=129,value=21840},

		    		},
				-- 8阶 
					{
						{type=13,value=3800},
						{type=15,value=7986},
						{type=128,value=320},
						{type=129,value=27040},

		    		},
				-- 9阶 
					{
						{type=13,value=4480},
						{type=15,value=9416},
						{type=128,value=360},
						{type=129,value=32240},

		    		},
				-- 10阶 
					{
						{type=13,value=5160},
						{type=15,value=10846},
						{type=128,value=400},
						{type=129,value=37440},
		    		},
		    		
		    	},
		    	
		    	-- 道
				{
									-- 1阶 
					{
						{type=17,value=125},
			    		{type=19,value=262},
						{type=128,value=40},
						{type=129,value=624},

		    		},
				-- 2阶 
					{
						{type=17,value=325},
			    		{type=19,value=682},
						{type=128,value=80},
						{type=129,value=1664},

		    		},
				-- 3阶 
					{
						{type=17,value=614},
			    		{type=19,value=1288},
						{type=128,value=120},
						{type=129,value=3328},

		    		},
				-- 4阶 
					{
						{type=17,value=1080},
			    		{type=19,value=2266},
						{type=128,value=160},
						{type=129,value=6240},

		    		},
				-- 5阶 
					{
						{type=17,value=1760},
			    		{type=19,value=3696},
						{type=128,value=200},
						{type=129,value=11440},

		    		},
				-- 6阶 
					{
						{type=17,value=2440},
						{type=19,value=5126},
						{type=128,value=240},
						{type=129,value=16640},

		    		},
				-- 7阶 
					{
						{type=17,value=3120},
						{type=19,value=6556},
						{type=128,value=280},
						{type=129,value=21840},

		    		},
				-- 8阶 
					{
						{type=17,value=3800},
						{type=19,value=7986},
						{type=128,value=320},
						{type=129,value=27040},

		    		},
				-- 9阶 
					{
						{type=17,value=4480},
						{type=19,value=9416},
						{type=128,value=360},
						{type=129,value=32240},

		    		},
				-- 10阶 
					{
						{type=17,value=5160},
						{type=19,value=10846},
						{type=128,value=400},
						{type=129,value=37440},
		    		},
		    		
		    	},
		    	
			},
			
			-- 等级属性
			levelAttrs = {
				-- 战
					-- -- 	--模块
					-- 			-- (a1) 级 --
					-- {
					-- 	{type=(a2),value=(a3)},
			    	-- 	{type=(a4),value=(a5)},
					-- 	{type=(a6),value=(a7)},
					-- 	{type=(a8),value=(a9)},

		    		-- },



				{
					
					-- 飞升1 级 --
					{
						{type=9,value=38},
			    		{type=11,value=78},
						{type=128,value=10},
						{type=129,value=140},

		    		},

					-- 飞升2 级 --
					{
						{type=9,value=75},
			    		{type=11,value=157},
						{type=128,value=20},
						{type=129,value=280},

		    		},

					-- 飞升3 级 --
					{
						{type=9,value=112},
			    		{type=11,value=235},
						{type=128,value=30},
						{type=129,value=420},

		    		},

					-- 飞升4 级 --
					{
						{type=9,value=150},
			    		{type=11,value=314},
						{type=128,value=40},
						{type=129,value=560},

		    		},

					-- 飞升5 级 --
					{
						{type=9,value=188},
			    		{type=11,value=393},
						{type=128,value=50},
						{type=129,value=648},

		    		},

					-- 飞升6 级 --
					{
						{type=9,value=248},
			    		{type=11,value=519},
						{type=128,value=60},
						{type=129,value=944},

		    		},

					-- 飞升7 级 --
					{
						{type=9,value=308},
			    		{type=11,value=645},
						{type=128,value=70},
						{type=129,value=1240},

		    		},

					-- 飞升8 级 --
					{
						{type=9,value=368},
			    		{type=11,value=771},
						{type=128,value=80},
						{type=129,value=1536},

		    		},

					-- 飞升9 级 --
					{
						{type=9,value=428},
			    		{type=11,value=897},
						{type=128,value=90},
						{type=129,value=1832},

		    		},

					-- 飞升10 级 --
					{
						{type=9,value=488},
			    		{type=11,value=1023},
						{type=128,value=100},
						{type=129,value=2128},

		    		},

					-- 飞升11 级 --
					{
						{type=9,value=573},
			    		{type=11,value=1202},
						{type=128,value=110},
						{type=129,value=2684},

		    		},

					-- 飞升12 级 --
					{
						{type=9,value=660},
			    		{type=11,value=1384},
						{type=128,value=120},
						{type=129,value=3240},

		    		},

					-- 飞升13 级 --
					{
						{type=9,value=746},
			    		{type=11,value=1566},
						{type=128,value=130},
						{type=129,value=3796},

		    		},

					-- 飞升14 级 --
					{
						{type=9,value=833},
			    		{type=11,value=1748},
						{type=128,value=140},
						{type=129,value=4352},

		    		},

					-- 飞升15 级 --
					{
						{type=9,value=920},
			    		{type=11,value=1932},
						{type=128,value=150},
						{type=129,value=4856},

		    		},

					-- 飞升16 级 --
					{
						{type=9,value=1060},
			    		{type=11,value=2225},
						{type=128,value=160},
						{type=129,value=5932},

		    		},

					-- 飞升17 级 --
					{
						{type=9,value=1200},
			    		{type=11,value=2518},
						{type=128,value=170},
						{type=129,value=7008},

		    		},

					-- 飞升18 级 --
					{
						{type=9,value=1339},
			    		{type=11,value=2811},
						{type=128,value=180},
						{type=129,value=8084},

		    		},

					-- 飞升19 级 --
					{
						{type=9,value=1479},
			    		{type=11,value=3104},
						{type=128,value=190},
						{type=129,value=9160},

		    		},

					-- 飞升20 级 --
					{
						{type=9,value=1619},
			    		{type=11,value=3399},
						{type=128,value=200},
						{type=129,value=10080},

		    		},

					-- 飞升21 级 --
					{
						{type=9,value=1823},
			    		{type=11,value=3828},
						{type=128,value=210},
						{type=129,value=12040},

		    		},

					-- 飞升22 级 --
					{
						{type=9,value=2028},
			    		{type=11,value=4257},
						{type=128,value=220},
						{type=129,value=14000},

		    		},

					-- 飞升23 级 --
					{
						{type=9,value=2232},
			    		{type=11,value=4686},
						{type=128,value=230},
						{type=129,value=15960},

		    		},

					-- 飞升24 级 --
					{
						{type=9,value=2436},
			    		{type=11,value=5115},
						{type=128,value=240},
						{type=129,value=17920},

		    		},

					-- 飞升25 级 --
					{
						{type=9,value=2640},
			    		{type=11,value=5544},
						{type=128,value=250},
						{type=129,value=19880},

		    		},
						--飞升26级			
					{				
						{type=9,value=2844},		
						{type=11,value=5973},		
						{type=128,value=260},		
						{type=129,value=21840},		
					},			
						--飞升27级			
					{				
						{type=9,value=3048},		
						{type=11,value=6402},		
						{type=128,value=270},		
						{type=129,value=23800},		
					},			
						--飞升28级			
					{				
						{type=9,value=3252},		
						{type=11,value=6831},		
						{type=128,value=280},		
						{type=129,value=25760},		
					},			
						--飞升29级			
					{				
						{type=9,value=3456},		
						{type=11,value=7260},		
						{type=128,value=290},		
						{type=129,value=27720},		
					},			
						--飞升30级			
					{				
						{type=9,value=3660},		
						{type=11,value=7689},		
						{type=128,value=300},		
						{type=129,value=29680},		
					},			
						--飞升31级			
					{				
						{type=9,value=3864},		
						{type=11,value=8118},		
						{type=128,value=310},		
						{type=129,value=31640},		
					},			
						--飞升32级			
					{				
						{type=9,value=4068},		
						{type=11,value=8547},		
						{type=128,value=320},		
						{type=129,value=33600},		
					},			
						--飞升33级			
					{				
						{type=9,value=4272},		
						{type=11,value=8976},		
						{type=128,value=330},		
						{type=129,value=35560},		
					},			
						--飞升34级			
					{				
						{type=9,value=4476},		
						{type=11,value=9405},		
						{type=128,value=340},		
						{type=129,value=37520},		
					},			
						--飞升35级			
					{				
						{type=9,value=4680},		
						{type=11,value=9834},		
						{type=128,value=350},		
						{type=129,value=39480},		
					},			
						--飞升36级			
					{				
						{type=9,value=4884},		
						{type=11,value=10263},		
						{type=128,value=360},		
						{type=129,value=41440},		
					},			
						--飞升37级			
					{				
						{type=9,value=5088},		
						{type=11,value=10692},		
						{type=128,value=370},		
						{type=129,value=43400},		
					},			
						--飞升38级			
					{				
						{type=9,value=5292},		
						{type=11,value=11121},		
						{type=128,value=380},		
						{type=129,value=45360},		
					},			
						--飞升39级			
					{				
						{type=9,value=5496},		
						{type=11,value=11550},		
						{type=128,value=390},		
						{type=129,value=47320},		
					},			
						--飞升40级			
					{				
						{type=9,value=5700},		
						{type=11,value=11979},		
						{type=128,value=400},		
						{type=129,value=49280},		
					},			
						--飞升41级			
					{				
						{type=9,value=5904},		
						{type=11,value=12408},		
						{type=128,value=410},		
						{type=129,value=51240},		
					},			
						--飞升42级			
					{				
						{type=9,value=6108},		
						{type=11,value=12837},		
						{type=128,value=420},		
						{type=129,value=53200},		
					},			
						--飞升43级			
					{				
						{type=9,value=6312},		
						{type=11,value=13266},		
						{type=128,value=430},		
						{type=129,value=55160},		
					},			
						--飞升44级			
					{				
						{type=9,value=6516},		
						{type=11,value=13695},		
						{type=128,value=440},		
						{type=129,value=57120},		
					},			
						--飞升45级			
					{				
						{type=9,value=6720},		
						{type=11,value=14124},		
						{type=128,value=450},		
						{type=129,value=59080},		
					},			
						--飞升46级			
					{				
						{type=9,value=6924},		
						{type=11,value=14553},		
						{type=128,value=460},		
						{type=129,value=61040},		
					},			
						--飞升47级			
					{				
						{type=9,value=7128},		
						{type=11,value=14982},		
						{type=128,value=470},		
						{type=129,value=63000},		
					},			
						--飞升48级			
					{				
						{type=9,value=7332},		
						{type=11,value=15411},		
						{type=128,value=480},		
						{type=129,value=64960},		
					},			
						--飞升49级			
					{				
						{type=9,value=7536},		
						{type=11,value=15840},		
						{type=128,value=490},		
						{type=129,value=66920},		
					},			
						--飞升50级			
					{				
						{type=9,value=7740},		
						{type=11,value=16269},		
						{type=128,value=500},		
						{type=129,value=68880},		
					},			

		    		
		    	},
		    	
		    	-- 法
				{
					
					-- 飞升1 级 --
					{
						{type=13,value=38},
			    		{type=15,value=78},
						{type=128,value=10},
						{type=129,value=140},

		    		},

					-- 飞升2 级 --
					{
						{type=13,value=75},
			    		{type=15,value=157},
						{type=128,value=20},
						{type=129,value=280},

		    		},

					-- 飞升3 级 --
					{
						{type=13,value=112},
			    		{type=15,value=235},
						{type=128,value=30},
						{type=129,value=420},

		    		},

					-- 飞升4 级 --
					{
						{type=13,value=150},
			    		{type=15,value=314},
						{type=128,value=40},
						{type=129,value=560},

		    		},

					-- 飞升5 级 --
					{
						{type=13,value=188},
			    		{type=15,value=393},
						{type=128,value=50},
						{type=129,value=648},

		    		},

					-- 飞升6 级 --
					{
						{type=13,value=248},
			    		{type=15,value=519},
						{type=128,value=60},
						{type=129,value=944},

		    		},

					-- 飞升7 级 --
					{
						{type=13,value=308},
			    		{type=15,value=645},
						{type=128,value=70},
						{type=129,value=1240},

		    		},

					-- 飞升8 级 --
					{
						{type=13,value=368},
			    		{type=15,value=771},
						{type=128,value=80},
						{type=129,value=1536},

		    		},

					-- 飞升9 级 --
					{
						{type=13,value=428},
			    		{type=15,value=897},
						{type=128,value=90},
						{type=129,value=1832},

		    		},

					-- 飞升10 级 --
					{
						{type=13,value=488},
			    		{type=15,value=1023},
						{type=128,value=100},
						{type=129,value=2128},

		    		},

					-- 飞升11 级 --
					{
						{type=13,value=573},
			    		{type=15,value=1202},
						{type=128,value=110},
						{type=129,value=2684},

		    		},

					-- 飞升12 级 --
					{
						{type=13,value=660},
			    		{type=15,value=1384},
						{type=128,value=120},
						{type=129,value=3240},

		    		},

					-- 飞升13 级 --
					{
						{type=13,value=746},
			    		{type=15,value=1566},
						{type=128,value=130},
						{type=129,value=3796},

		    		},

					-- 飞升14 级 --
					{
						{type=13,value=833},
			    		{type=15,value=1748},
						{type=128,value=140},
						{type=129,value=4352},

		    		},

					-- 飞升15 级 --
					{
						{type=13,value=920},
			    		{type=15,value=1932},
						{type=128,value=150},
						{type=129,value=4856},

		    		},

					-- 飞升16 级 --
					{
						{type=13,value=1060},
			    		{type=15,value=2225},
						{type=128,value=160},
						{type=129,value=5932},

		    		},

					-- 飞升17 级 --
					{
						{type=13,value=1200},
			    		{type=15,value=2518},
						{type=128,value=170},
						{type=129,value=7008},

		    		},

					-- 飞升18 级 --
					{
						{type=13,value=1339},
			    		{type=15,value=2811},
						{type=128,value=180},
						{type=129,value=8084},

		    		},

					-- 飞升19 级 --
					{
						{type=13,value=1479},
			    		{type=15,value=3104},
						{type=128,value=190},
						{type=129,value=9160},

		    		},

					-- 飞升20 级 --
					{
						{type=13,value=1619},
			    		{type=15,value=3399},
						{type=128,value=200},
						{type=129,value=10080},

		    		},

					-- 飞升21 级 --
					{
						{type=13,value=1823},
			    		{type=15,value=3828},
						{type=128,value=210},
						{type=129,value=12040},

		    		},

					-- 飞升22 级 --
					{
						{type=13,value=2028},
			    		{type=15,value=4257},
						{type=128,value=220},
						{type=129,value=14000},

		    		},

					-- 飞升23 级 --
					{
						{type=13,value=2232},
			    		{type=15,value=4686},
						{type=128,value=230},
						{type=129,value=15960},

		    		},

					-- 飞升24 级 --
					{
						{type=13,value=2436},
			    		{type=15,value=5115},
						{type=128,value=240},
						{type=129,value=17920},

		    		},

					-- 飞升25 级 --
					{
						{type=13,value=2640},
			    		{type=15,value=5544},
						{type=128,value=250},
						{type=129,value=19880},

		    		},
	                 --飞升26级			
					{				
						{type=13,value=2844},		
						{type=15,value=5973},		
						{type=128,value=260},		
						{type=129,value=21840},		
					},			
						--飞升27级			
					{				
						{type=13,value=3048},		
						{type=15,value=6402},		
						{type=128,value=270},		
						{type=129,value=23800},		
					},			
						--飞升28级			
					{				
						{type=13,value=3252},		
						{type=15,value=6831},		
						{type=128,value=280},		
						{type=129,value=25760},		
					},			
						--飞升29级			
					{				
						{type=13,value=3456},		
						{type=15,value=7260},		
						{type=128,value=290},		
						{type=129,value=27720},		
					},			
						--飞升30级			
					{				
						{type=13,value=3660},		
						{type=15,value=7689},		
						{type=128,value=300},		
						{type=129,value=29680},		
					},			
						--飞升31级			
					{				
						{type=13,value=3864},		
						{type=15,value=8118},		
						{type=128,value=310},		
						{type=129,value=31640},		
					},			
						--飞升32级			
					{				
						{type=13,value=4068},		
						{type=15,value=8547},		
						{type=128,value=320},		
						{type=129,value=33600},		
					},			
						--飞升33级			
					{				
						{type=13,value=4272},		
						{type=15,value=8976},		
						{type=128,value=330},		
						{type=129,value=35560},		
					},			
						--飞升34级			
					{				
						{type=13,value=4476},		
						{type=15,value=9405},		
						{type=128,value=340},		
						{type=129,value=37520},		
					},			
						--飞升35级			
					{				
						{type=13,value=4680},		
						{type=15,value=9834},		
						{type=128,value=350},		
						{type=129,value=39480},		
					},			
						--飞升36级			
					{				
						{type=13,value=4884},		
						{type=15,value=10263},		
						{type=128,value=360},		
						{type=129,value=41440},		
					},			
						--飞升37级			
					{				
						{type=13,value=5088},		
						{type=15,value=10692},		
						{type=128,value=370},		
						{type=129,value=43400},		
					},			
						--飞升38级			
					{				
						{type=13,value=5292},		
						{type=15,value=11121},		
						{type=128,value=380},		
						{type=129,value=45360},		
					},			
						--飞升39级			
					{				
						{type=13,value=5496},		
						{type=15,value=11550},		
						{type=128,value=390},		
						{type=129,value=47320},		
					},			
						--飞升40级			
					{				
						{type=13,value=5700},		
						{type=15,value=11979},		
						{type=128,value=400},		
						{type=129,value=49280},		
					},			
						--飞升41级			
					{				
						{type=13,value=5904},		
						{type=15,value=12408},		
						{type=128,value=410},		
						{type=129,value=51240},		
					},			
						--飞升42级			
					{				
						{type=13,value=6108},		
						{type=15,value=12837},		
						{type=128,value=420},		
						{type=129,value=53200},		
					},			
						--飞升43级			
					{				
						{type=13,value=6312},		
						{type=15,value=13266},		
						{type=128,value=430},		
						{type=129,value=55160},		
					},			
						--飞升44级			
					{				
						{type=13,value=6516},		
						{type=15,value=13695},		
						{type=128,value=440},		
						{type=129,value=57120},		
					},			
						--飞升45级			
					{				
						{type=13,value=6720},		
						{type=15,value=14124},		
						{type=128,value=450},		
						{type=129,value=59080},		
					},			
						--飞升46级			
					{				
						{type=13,value=6924},		
						{type=15,value=14553},		
						{type=128,value=460},		
						{type=129,value=61040},		
					},			
						--飞升47级			
					{				
						{type=13,value=7128},		
						{type=15,value=14982},		
						{type=128,value=470},		
						{type=129,value=63000},		
					},			
						--飞升48级			
					{				
						{type=13,value=7332},		
						{type=15,value=15411},		
						{type=128,value=480},		
						{type=129,value=64960},		
					},			
						--飞升49级			
					{				
						{type=13,value=7536},		
						{type=15,value=15840},		
						{type=128,value=490},		
						{type=129,value=66920},		
					},			
						--飞升50级			
					{				
						{type=13,value=7740},		
						{type=15,value=16269},		
						{type=128,value=500},		
						{type=129,value=68880},		
					},

		    		
		    	},
		    	
		    	-- 道
				{
				
					-- 飞升1 级 --
					{
						{type=17,value=38},
			    		{type=19,value=78},
						{type=128,value=10},
						{type=129,value=140},

		    		},

					-- 飞升2 级 --
					{
						{type=17,value=75},
			    		{type=19,value=157},
						{type=128,value=20},
						{type=129,value=280},

		    		},

					-- 飞升3 级 --
					{
						{type=17,value=112},
			    		{type=19,value=235},
						{type=128,value=30},
						{type=129,value=420},

		    		},

					-- 飞升4 级 --
					{
						{type=17,value=150},
			    		{type=19,value=314},
						{type=128,value=40},
						{type=129,value=560},

		    		},

					-- 飞升5 级 --
					{
						{type=17,value=188},
			    		{type=19,value=393},
						{type=128,value=50},
						{type=129,value=648},

		    		},

					-- 飞升6 级 --
					{
						{type=17,value=248},
			    		{type=19,value=519},
						{type=128,value=60},
						{type=129,value=944},

		    		},

					-- 飞升7 级 --
					{
						{type=17,value=308},
			    		{type=19,value=645},
						{type=128,value=70},
						{type=129,value=1240},

		    		},

					-- 飞升8 级 --
					{
						{type=17,value=368},
			    		{type=19,value=771},
						{type=128,value=80},
						{type=129,value=1536},

		    		},

					-- 飞升9 级 --
					{
						{type=17,value=428},
			    		{type=19,value=897},
						{type=128,value=90},
						{type=129,value=1832},

		    		},

					-- 飞升10 级 --
					{
						{type=17,value=488},
			    		{type=19,value=1023},
						{type=128,value=100},
						{type=129,value=2128},

		    		},

					-- 飞升11 级 --
					{
						{type=17,value=573},
			    		{type=19,value=1202},
						{type=128,value=110},
						{type=129,value=2684},

		    		},

					-- 飞升12 级 --
					{
						{type=17,value=660},
			    		{type=19,value=1384},
						{type=128,value=120},
						{type=129,value=3240},

		    		},

					-- 飞升13 级 --
					{
						{type=17,value=746},
			    		{type=19,value=1566},
						{type=128,value=130},
						{type=129,value=3796},

		    		},

					-- 飞升14 级 --
					{
						{type=17,value=833},
			    		{type=19,value=1748},
						{type=128,value=140},
						{type=129,value=4352},

		    		},

					-- 飞升15 级 --
					{
						{type=17,value=920},
			    		{type=19,value=1932},
						{type=128,value=150},
						{type=129,value=4856},

		    		},

					-- 飞升16 级 --
					{
						{type=17,value=1060},
			    		{type=19,value=2225},
						{type=128,value=160},
						{type=129,value=5932},

		    		},

					-- 飞升17 级 --
					{
						{type=17,value=1200},
			    		{type=19,value=2518},
						{type=128,value=170},
						{type=129,value=7008},

		    		},

					-- 飞升18 级 --
					{
						{type=17,value=1339},
			    		{type=19,value=2811},
						{type=128,value=180},
						{type=129,value=8084},

		    		},

					-- 飞升19 级 --
					{
						{type=17,value=1479},
			    		{type=19,value=3104},
						{type=128,value=190},
						{type=129,value=9160},

		    		},

					-- 飞升20 级 --
					{
						{type=17,value=1619},
			    		{type=19,value=3399},
						{type=128,value=200},
						{type=129,value=10080},

		    		},

					-- 飞升21 级 --
					{
						{type=17,value=1823},
			    		{type=19,value=3828},
						{type=128,value=210},
						{type=129,value=12040},

		    		},

					-- 飞升22 级 --
					{
						{type=17,value=2028},
			    		{type=19,value=4257},
						{type=128,value=220},
						{type=129,value=14000},

		    		},

					-- 飞升23 级 --
					{
						{type=17,value=2232},
			    		{type=19,value=4686},
						{type=128,value=230},
						{type=129,value=15960},

		    		},

					-- 飞升24 级 --
					{
						{type=17,value=2436},
			    		{type=19,value=5115},
						{type=128,value=240},
						{type=129,value=17920},

		    		},

					-- 飞升25 级 --
					{
						{type=17,value=2640},
			    		{type=19,value=5544},
						{type=128,value=250},
						{type=129,value=19880},

		    		},
	                --飞升26级			
					{				
						{type=17,value=2844},		
						{type=19,value=5973},		
						{type=128,value=260},		
						{type=129,value=21840},		
					},			
						--飞升27级			
					{				
						{type=17,value=3048},		
						{type=19,value=6402},		
						{type=128,value=270},		
						{type=129,value=23800},		
					},			
						--飞升28级			
					{				
						{type=17,value=3252},		
						{type=19,value=6831},		
						{type=128,value=280},		
						{type=129,value=25760},		
					},			
						--飞升29级			
					{				
						{type=17,value=3456},		
						{type=19,value=7260},		
						{type=128,value=290},		
						{type=129,value=27720},		
					},			
						--飞升30级			
					{				
						{type=17,value=3660},		
						{type=19,value=7689},		
						{type=128,value=300},		
						{type=129,value=29680},		
					},			
						--飞升31级			
					{				
						{type=17,value=3864},		
						{type=19,value=8118},		
						{type=128,value=310},		
						{type=129,value=31640},		
					},			
						--飞升32级			
					{				
						{type=17,value=4068},		
						{type=19,value=8547},		
						{type=128,value=320},		
						{type=129,value=33600},		
					},			
						--飞升33级			
					{				
						{type=17,value=4272},		
						{type=19,value=8976},		
						{type=128,value=330},		
						{type=129,value=35560},		
					},			
						--飞升34级			
					{				
						{type=17,value=4476},		
						{type=19,value=9405},		
						{type=128,value=340},		
						{type=129,value=37520},		
					},			
						--飞升35级			
					{				
						{type=17,value=4680},		
						{type=19,value=9834},		
						{type=128,value=350},		
						{type=129,value=39480},		
					},			
						--飞升36级			
					{				
						{type=17,value=4884},		
						{type=19,value=10263},		
						{type=128,value=360},		
						{type=129,value=41440},		
					},			
						--飞升37级			
					{				
						{type=17,value=5088},		
						{type=19,value=10692},		
						{type=128,value=370},		
						{type=129,value=43400},		
					},			
						--飞升38级			
					{				
						{type=17,value=5292},		
						{type=19,value=11121},		
						{type=128,value=380},		
						{type=129,value=45360},		
					},			
						--飞升39级			
					{				
						{type=17,value=5496},		
						{type=19,value=11550},		
						{type=128,value=390},		
						{type=129,value=47320},		
					},			
						--飞升40级			
					{				
						{type=17,value=5700},		
						{type=19,value=11979},		
						{type=128,value=400},		
						{type=129,value=49280},		
					},			
						--飞升41级			
					{				
						{type=17,value=5904},		
						{type=19,value=12408},		
						{type=128,value=410},		
						{type=129,value=51240},		
					},			
						--飞升42级			
					{				
						{type=17,value=6108},		
						{type=19,value=12837},		
						{type=128,value=420},		
						{type=129,value=53200},		
					},			
						--飞升43级			
					{				
						{type=17,value=6312},		
						{type=19,value=13266},		
						{type=128,value=430},		
						{type=129,value=55160},		
					},			
						--飞升44级			
					{				
						{type=17,value=6516},		
						{type=19,value=13695},		
						{type=128,value=440},		
						{type=129,value=57120},		
					},			
						--飞升45级			
					{				
						{type=17,value=6720},		
						{type=19,value=14124},		
						{type=128,value=450},		
						{type=129,value=59080},		
					},			
						--飞升46级			
					{				
						{type=17,value=6924},		
						{type=19,value=14553},		
						{type=128,value=460},		
						{type=129,value=61040},		
					},			
						--飞升47级			
					{				
						{type=17,value=7128},		
						{type=19,value=14982},		
						{type=128,value=470},		
						{type=129,value=63000},		
					},			
						--飞升48级			
					{				
						{type=17,value=7332},		
						{type=19,value=15411},		
						{type=128,value=480},		
						{type=129,value=64960},		
					},			
						--飞升49级			
					{				
						{type=17,value=7536},		
						{type=19,value=15840},		
						{type=128,value=490},		
						{type=129,value=66920},		
					},			
						--飞升50级			
					{				
						{type=17,value=7740},		
						{type=19,value=16269},		
						{type=128,value=500},		
						{type=129,value=68880},		
					},
		    		
		    	},
			}	
			
		
		},


		--雷神之锤
		{
			breakLevelNeedItem = 7533,--突破所需物品
			--法宝id --雷神之锤
			treasureIds = {7537,7538,7539,7540,7541,7848,7849,7850,7851,7852},
			effectId = {1101,1102,1103,1104,1105,1105,1105,1105,1105,1105},

			skillId1 = {237,238,239,240,241,241,241,241,241,241},--战士
			skillId2 = {242,243,244,245,246,246,246,246,246,246},--法师
			skillId3 = {247,248,249,250,251,251,251,251,251,251},--道士

-- 每阶突破所需物品的数量
			
			classConsumeCounts = { 1,4,8,16,32,64,128,256,512,800},
			
			-- 升级所需物品的数量
			levelConsumeCounts = {2,4,6,8,10,12,14,16,18,20,23,27,31,35,40,45,50,56,62,68,74,81,88,96,103,110,117,124,131,138,145,152,159,166,173,180,187,194,201,208,215,222,229,236,243,250,257,264,271,278},
			
			--触发法宝攻击的万分比
			--treasuerAttack = {10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,},
			treasuerAttack = {500,550,600,650,700,750,800,850,900,950,1000,1050,1100,1150,1200,1300,1400,1500,1600,1700,1800,1900,2000,2100,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,},
			-- 阶级属性
			classAttrs = {
				{
										-- 1阶 --
					{
						{type=9,value=125},
			    		{type=11,value=262},
						{type=5,value=3120},
						{type=7,value=315},

		    		},
					-- 升阶1 --
					{
						{type=9,value=325},
			    		{type=11,value=682},
						{type=5,value=8320},
						{type=7,value=840},

		    		},
					-- 升阶2 --
					{
						{type=9,value=614},
			    		{type=11,value=1288},
						{type=5,value=16640},
						{type=7,value=1681},

		    		},
					-- 升阶3 --
					{
						{type=9,value=1080},
			    		{type=11,value=2266},
						{type=5,value=31200},
						{type=7,value=3152},

		    		},
					-- 升阶4 --
					{
						{type=9,value=1760},
			    		{type=11,value=3696},
						{type=5,value=57200},
						{type=7,value=5778},

		    		},
					-- 升阶6 --
					{
						{type=9,value=2440},
						{type=11,value=5126},
						{type=5,value=83200},
						{type=7,value=8004},

		    		},

					-- 升阶7 --
					{
						{type=9,value=3120},
						{type=11,value=6556},
						{type=5,value=109200},
						{type=7,value=10430},
		    		},

					-- 升阶8 --
					{
						{type=9,value=3800},
						{type=11,value=7986},
						{type=5,value=135200},
						{type=7,value=12856},
		    		},

					-- 升阶9 --
					{
						{type=9,value=4480},
						{type=11,value=9416},
						{type=5,value=161200},
						{type=7,value=15282},
		    		},

					-- 升阶10 --
					{
						{type=9,value=5160},
						{type=11,value=10846},
						{type=5,value=187200},
						{type=7,value=17708},
		    		},	
		    		
		    	},
		    	
		    	-- 法
				{
										-- 1阶 --
					{
						{type=13,value=125},
			    		{type=15,value=262},
						{type=5,value=803},
						{type=7,value=3212},

		    		},
					-- 升阶1 --
					{
						{type=13,value=325},
			    		{type=15,value=682},
						{type=5,value=2139},
						{type=7,value=8556},

		    		},
					-- 升阶2 --
					{
						{type=13,value=614},
			    		{type=15,value=1288},
						{type=5,value=4278},
						{type=7,value=17112},

		    		},
					-- 升阶3 --
					{
						{type=13,value=1080},
			    		{type=15,value=2266},
						{type=5,value=8021},
						{type=7,value=32084},

		    		},
					-- 升阶4 --
					{
						{type=13,value=1760},
			    		{type=15,value=3696},
						{type=5,value=14705},
						{type=7,value=58820},

		    		},

					-- 升阶6 --
					{
						{type=13,value=2440},
						{type=15,value=5126},
						{type=5,value=21389},
						{type=7,value=85556},

		    		},
					-- 升阶7 --
					{
						{type=13,value=3120},
						{type=15,value=6556},
						{type=5,value=28073},
						{type=7,value=112292},
		    		},
					-- 升阶8 --
					{
						{type=13,value=3800},
						{type=15,value=7986},
						{type=5,value=34757},
						{type=7,value=139028},
		    		},
					-- 升阶9 --
					{
						{type=13,value=4480},
						{type=15,value=9416},
						{type=5,value=41441},
						{type=7,value=165764},
		    		},
					-- 升阶10 --
					{
						{type=13,value=5160},
						{type=15,value=10846},
						{type=5,value=48125},
						{type=7,value=192500},
		    		},	
		    	},
		    	
		    	-- 道
				{
										-- 1阶 --
					{
						{type=17,value=125},
			    		{type=19,value=262},
						{type=5,value=1744},
						{type=7,value=1744},

		    		},
					-- 升阶1 --
					{
						{type=17,value=325},
			    		{type=19,value=682},
						{type=5,value=4649},
						{type=7,value=4649},

		    		},
					-- 升阶2 --
					{
						{type=17,value=614},
			    		{type=19,value=1288},
						{type=5,value=9297},
						{type=7,value=9297},

		    		},
					-- 升阶3 --
					{
						{type=17,value=1080},
			    		{type=19,value=2266},
						{type=5,value=17431},
						{type=7,value=17431},

		    		},
					-- 升阶4 --
					{
						{type=17,value=1760},
			    		{type=19,value=3696},
						{type=5,value=31956},
						{type=7,value=31956},

		    		},
					-- 升阶6 --
					{
						{type=17,value=2440},
						{type=19,value=5126},
						{type=5,value=46481},
						{type=7,value=46481},

		    		},
					-- 升阶7 --
					{
						{type=17,value=3120},
						{type=19,value=6556},
						{type=5,value=61006},
						{type=7,value=61006},

		    		},
					-- 升阶8 --
					{
						{type=17,value=3800},
						{type=19,value=7986},
						{type=5,value=75531},
						{type=7,value=75531},

		    		},
					-- 升阶9 --
					{
						{type=17,value=4480},
						{type=19,value=9416},
						{type=5,value=90056},
						{type=7,value=90056},
		    		},
					-- 升阶10 --
					{
						{type=17,value=5160},
						{type=19,value=10846},
						{type=5,value=104581},
						{type=7,value=104581},
		    		},
		    		
		    	},
		    	
			},
			-- 等级属性
			levelAttrs = {
				-- 战
					-- -- 	--模块
					-- 			-- (a1) 级 --
					-- {
					-- 	{type=(a2),value=(a3)},
			    	-- 	{type=(a4),value=(a5)},
					-- 	{type=(a6),value=(a7)},
					-- 	{type=(a8),value=(a9)},

		    		-- },



				{
													-- 飞升1 级 --
					{
						{type=9,value=38},
			    		{type=11,value=78},
						{type=5,value=1300},
						{type=7,value=131},

		    		},
								-- 飞升2 级 --
					{
						{type=9,value=75},
			    		{type=11,value=157},
						{type=5,value=2600},
						{type=7,value=263},

		    		},
								-- 飞升3 级 --
					{
						{type=9,value=112},
			    		{type=11,value=235},
						{type=5,value=3900},
						{type=7,value=394},

		    		},
								-- 飞升4 级 --
					{
						{type=9,value=150},
			    		{type=11,value=314},
						{type=5,value=5200},
						{type=7,value=525},

		    		},
								-- 飞升5 级 --
					{
						{type=9,value=188},
			    		{type=11,value=393},
						{type=5,value=6240},
						{type=7,value=630},

		    		},
								-- 飞升6 级 --
					{
						{type=9,value=248},
			    		{type=11,value=519},
						{type=5,value=8320},
						{type=7,value=840},

		    		},
								-- 飞升7 级 --
					{
						{type=9,value=308},
			    		{type=11,value=645},
						{type=5,value=10400},
						{type=7,value=1051},

		    		},
								-- 飞升8 级 --
					{
						{type=9,value=368},
			    		{type=11,value=771},
						{type=5,value=12480},
						{type=7,value=1261},

		    		},
								-- 飞升9 级 --
					{
						{type=9,value=428},
			    		{type=11,value=897},
						{type=5,value=14560},
						{type=7,value=1471},

		    		},
								-- 飞升10 级 --
					{
						{type=9,value=488},
			    		{type=11,value=1023},
						{type=5,value=16640},
						{type=7,value=1681},

		    		},
								-- 飞升11 级 --
					{
						{type=9,value=573},
			    		{type=11,value=1202},
						{type=5,value=20020},
						{type=7,value=2022},

		    		},
								-- 飞升12 级 --
					{
						{type=9,value=660},
			    		{type=11,value=1384},
						{type=5,value=23400},
						{type=7,value=2364},

		    		},
								-- 飞升13 级 --
					{
						{type=9,value=746},
			    		{type=11,value=1566},
						{type=5,value=26780},
						{type=7,value=2705},

		    		},
								-- 飞升14 级 --
					{
						{type=9,value=833},
			    		{type=11,value=1748},
						{type=5,value=30160},
						{type=7,value=3046},

		    		},
								-- 飞升15 级 --
					{
						{type=9,value=920},
			    		{type=11,value=1932},
						{type=5,value=33280},
						{type=7,value=3362},

		    		},
								-- 飞升16 级 --
					{
						{type=9,value=1060},
			    		{type=11,value=2225},
						{type=5,value=39260},
						{type=7,value=3966},

		    		},
								-- 飞升17 级 --
					{
						{type=9,value=1200},
			    		{type=11,value=2518},
						{type=5,value=45240},
						{type=7,value=4570},

		    		},
								-- 飞升18 级 --
					{
						{type=9,value=1339},
			    		{type=11,value=2811},
						{type=5,value=51220},
						{type=7,value=5174},

		    		},
								-- 飞升19 级 --
					{
						{type=9,value=1479},
			    		{type=11,value=3104},
						{type=5,value=57200},
						{type=7,value=5778},

		    		},
								-- 飞升20 级 --
					{
						{type=9,value=1619},
			    		{type=11,value=3399},
						{type=5,value=62400},
						{type=7,value=6303},

		    		},
								-- 飞升21 级 --
					{
						{type=9,value=1823},
			    		{type=11,value=3828},
						{type=5,value=72800},
						{type=7,value=7354},

		    		},
								-- 飞升22 级 --
					{
						{type=9,value=2028},
			    		{type=11,value=4257},
						{type=5,value=83200},
						{type=7,value=8404},

		    		},
								-- 飞升23 级 --
					{
						{type=9,value=2232},
			    		{type=11,value=4686},
						{type=5,value=93600},
						{type=7,value=9455},

		    		},
								-- 飞升24 级 --
					{
						{type=9,value=2436},
			    		{type=11,value=5115},
						{type=5,value=104000},
						{type=7,value=10505},

		    		},
								-- 飞升25 级 --
					{
						{type=9,value=2640},
			    		{type=11,value=5544},
						{type=5,value=114400},
						{type=7,value=11556},

		    		},

						--飞升26级
					{	
						{type=9,value=2817},
						{type=11,value=5973},
						{type=5,value=124800},
						{type=7,value=12607},
					},
						--飞升27级
					{	
						{type=9,value=2994},
						{type=11,value=6402},
						{type=5,value=135200},
						{type=7,value=13658},
					},
						--飞升28级
					{	
						{type=9,value=3171},
						{type=11,value=6831},
						{type=5,value=145600},
						{type=7,value=14709},
					},
						--飞升29级
					{	
						{type=9,value=3348},
						{type=11,value=7260},
						{type=5,value=156000},
						{type=7,value=15760},
					},
						--飞升30级
					{	
						{type=9,value=3525},
						{type=11,value=7689},
						{type=5,value=166400},
						{type=7,value=16811},
					},
						--飞升31级
					{	
						{type=9,value=3702},
						{type=11,value=8118},
						{type=5,value=176800},
						{type=7,value=17862},
					},
						--飞升32级
					{	
						{type=9,value=3879},
						{type=11,value=8547},
						{type=5,value=187200},
						{type=7,value=18913},
					},
						--飞升33级
					{	
						{type=9,value=4056},
						{type=11,value=8976},
						{type=5,value=197600},
						{type=7,value=19964},
					},
						--飞升34级
					{	
						{type=9,value=4233},
						{type=11,value=9405},
						{type=5,value=208000},
						{type=7,value=21015},
					},
						--飞升35级
					{	
						{type=9,value=4410},
						{type=11,value=9834},
						{type=5,value=218400},
						{type=7,value=22066},
					},
						--飞升36级
					{	
						{type=9,value=4587},
						{type=11,value=10263},
						{type=5,value=228800},
						{type=7,value=23117},
					},
						--飞升37级
					{	
						{type=9,value=4764},
						{type=11,value=10692},
						{type=5,value=239200},
						{type=7,value=24168},
					},
						--飞升38级
					{	
						{type=9,value=4941},
						{type=11,value=11121},
						{type=5,value=249600},
						{type=7,value=25219},
					},
						--飞升39级
					{	
						{type=9,value=5118},
						{type=11,value=11550},
						{type=5,value=260000},
						{type=7,value=26270},
					},
						--飞升40级
					{	
						{type=9,value=5295},
						{type=11,value=11979},
						{type=5,value=270400},
						{type=7,value=27321},
					},
						--飞升41级
					{	
						{type=9,value=5472},
						{type=11,value=12408},
						{type=5,value=280800},
						{type=7,value=28372},
					},
						--飞升42级
					{	
						{type=9,value=5649},
						{type=11,value=12837},
						{type=5,value=291200},
						{type=7,value=29423},
					},
						--飞升43级
					{	
						{type=9,value=5826},
						{type=11,value=13266},
						{type=5,value=301600},
						{type=7,value=30474},
					},
						--飞升44级
					{	
						{type=9,value=6003},
						{type=11,value=13695},
						{type=5,value=312000},
						{type=7,value=31525},
					},
						--飞升45级
					{	
						{type=9,value=6180},
						{type=11,value=14124},
						{type=5,value=322400},
						{type=7,value=32576},
					},
						--飞升46级
					{	
						{type=9,value=6357},
						{type=11,value=14553},
						{type=5,value=332800},
						{type=7,value=33627},
					},
						--飞升47级
					{	
						{type=9,value=6534},
						{type=11,value=14982},
						{type=5,value=343200},
						{type=7,value=34678},
					},
						--飞升48级
					{	
						{type=9,value=6711},
						{type=11,value=15411},
						{type=5,value=353600},
						{type=7,value=35729},
					},
						--飞升49级
					{	
						{type=9,value=6888},
						{type=11,value=15840},
						{type=5,value=364000},
						{type=7,value=36780},
					},
						--飞升50级
					{	
						{type=9,value=7065},
						{type=11,value=16269},
						{type=5,value=374400},
						{type=7,value=37831},
					},
		    		
		    	},
		    	
		    	-- 法
				{
													-- 飞升1 级 --
					{
						{type=13,value=38},
			    		{type=15,value=78},
						{type=5,value=335},
						{type=7,value=1340},

		    		},
								-- 飞升2 级 --
					{
						{type=13,value=75},
			    		{type=15,value=157},
						{type=5,value=669},
						{type=7,value=2676},

		    		},
								-- 飞升3 级 --
					{
						{type=13,value=112},
			    		{type=15,value=235},
						{type=5,value=1003},
						{type=7,value=4012},

		    		},
								-- 飞升4 级 --
					{
						{type=13,value=150},
			    		{type=15,value=314},
						{type=5,value=1337},
						{type=7,value=5348},

		    		},
								-- 飞升5 级 --
					{
						{type=13,value=188},
			    		{type=15,value=393},
						{type=5,value=1605},
						{type=7,value=6420},

		    		},
								-- 飞升6 级 --
					{
						{type=13,value=248},
			    		{type=15,value=519},
						{type=5,value=2139},
						{type=7,value=8556},

		    		},
								-- 飞升7 级 --
					{
						{type=13,value=308},
			    		{type=15,value=645},
						{type=5,value=2674},
						{type=7,value=10696},

		    		},
								-- 飞升8 级 --
					{
						{type=13,value=368},
			    		{type=15,value=771},
						{type=5,value=3209},
						{type=7,value=12836},

		    		},
								-- 飞升9 级 --
					{
						{type=13,value=428},
			    		{type=15,value=897},
						{type=5,value=3743},
						{type=7,value=14972},

		    		},
								-- 飞升10 级 --
					{
						{type=13,value=488},
			    		{type=15,value=1023},
						{type=5,value=4278},
						{type=7,value=17112},

		    		},
								-- 飞升11 级 --
					{
						{type=13,value=573},
			    		{type=15,value=1202},
						{type=5,value=5147},
						{type=7,value=20588},

		    		},
								-- 飞升12 级 --
					{
						{type=13,value=660},
			    		{type=15,value=1384},
						{type=5,value=6016},
						{type=7,value=24064},

		    		},
								-- 飞升13 级 --
					{
						{type=13,value=746},
			    		{type=15,value=1566},
						{type=5,value=6885},
						{type=7,value=27540},

		    		},
								-- 飞升14 级 --
					{
						{type=13,value=833},
			    		{type=15,value=1748},
						{type=5,value=7754},
						{type=7,value=31016},

		    		},
								-- 飞升15 级 --
					{
						{type=13,value=920},
			    		{type=15,value=1932},
						{type=5,value=8556},
						{type=7,value=34224},

		    		},
								-- 飞升16 级 --
					{
						{type=13,value=1060},
			    		{type=15,value=2225},
						{type=5,value=10093},
						{type=7,value=40372},

		    		},
								-- 飞升17 级 --
					{
						{type=13,value=1200},
			    		{type=15,value=2518},
						{type=5,value=11630},
						{type=7,value=46520},

		    		},
								-- 飞升18 级 --
					{
						{type=13,value=1339},
			    		{type=15,value=2811},
						{type=5,value=13168},
						{type=7,value=52672},

		    		},
								-- 飞升19 级 --
					{
						{type=13,value=1479},
			    		{type=15,value=3104},
						{type=5,value=14705},
						{type=7,value=58820},

		    		},
								-- 飞升20 级 --
					{
						{type=13,value=1619},
			    		{type=15,value=3399},
						{type=5,value=16042},
						{type=7,value=64168},

		    		},
								-- 飞升21 级 --
					{
						{type=13,value=1823},
			    		{type=15,value=3828},
						{type=5,value=18715},
						{type=7,value=74860},

		    		},
								-- 飞升22 级 --
					{
						{type=13,value=2028},
			    		{type=15,value=4257},
						{type=5,value=21389},
						{type=7,value=85556},

		    		},
								-- 飞升23 级 --
					{
						{type=13,value=2232},
			    		{type=15,value=4686},
						{type=5,value=24062},
						{type=7,value=96248},

		    		},
								-- 飞升24 级 --
					{
						{type=13,value=2436},
			    		{type=15,value=5115},
						{type=5,value=26736},
						{type=7,value=106944},

		    		},
								-- 飞升25 级 --
					{
						{type=13,value=2640},
			    		{type=15,value=5544},
						{type=5,value=29409},
						{type=7,value=117636},

		    		},
						--飞升26级	
					{		
						{type=13,value=2817},
						{type=15,value=5973},
						{type=5,value=32082},
						{type=7,value=128328},
					},	
						--飞升27级	
					{		
						{type=13,value=2994},
						{type=15,value=6402},
						{type=5,value=34755},
						{type=7,value=139020},
					},	
						--飞升28级	
					{		
						{type=13,value=3171},
						{type=15,value=6831},
						{type=5,value=37428},
						{type=7,value=149712},
					},	
						--飞升29级	
					{		
						{type=13,value=3348},
						{type=15,value=7260},
						{type=5,value=40101},
						{type=7,value=160404},
					},	
						--飞升30级	
					{		
						{type=13,value=3525},
						{type=15,value=7689},
						{type=5,value=42774},
						{type=7,value=171096},
					},	
						--飞升31级	
					{		
						{type=13,value=3702},
						{type=15,value=8118},
						{type=5,value=45447},
						{type=7,value=181788},
					},	
						--飞升32级	
					{		
						{type=13,value=3879},
						{type=15,value=8547},
						{type=5,value=48120},
						{type=7,value=192480},
					},	
						--飞升33级	
					{		
						{type=13,value=4056},
						{type=15,value=8976},
						{type=5,value=50793},
						{type=7,value=203172},
					},	
						--飞升34级	
					{		
						{type=13,value=4233},
						{type=15,value=9405},
						{type=5,value=53466},
						{type=7,value=213864},
					},	
						--飞升35级	
					{		
						{type=13,value=4410},
						{type=15,value=9834},
						{type=5,value=56139},
						{type=7,value=224556},
					},	
						--飞升36级	
					{		
						{type=13,value=4587},
						{type=15,value=10263},
						{type=5,value=58812},
						{type=7,value=235248},
					},	
						--飞升37级	
					{		
						{type=13,value=4764},
						{type=15,value=10692},
						{type=5,value=61485},
						{type=7,value=245940},
					},	
						--飞升38级	
					{		
						{type=13,value=4941},
						{type=15,value=11121},
						{type=5,value=64158},
						{type=7,value=256632},
					},	
						--飞升39级	
					{		
						{type=13,value=5118},
						{type=15,value=11550},
						{type=5,value=66831},
						{type=7,value=267324},
					},	
						--飞升40级	
					{		
						{type=13,value=5295},
						{type=15,value=11979},
						{type=5,value=69504},
						{type=7,value=278016},
					},	
						--飞升41级	
					{		
						{type=13,value=5472},
						{type=15,value=12408},
						{type=5,value=72177},
						{type=7,value=288708},
					},	
						--飞升42级	
					{		
						{type=13,value=5649},
						{type=15,value=12837},
						{type=5,value=74850},
						{type=7,value=299400},
					},	
						--飞升43级	
					{		
						{type=13,value=5826},
						{type=15,value=13266},
						{type=5,value=77523},
						{type=7,value=310092},
					},	
						--飞升44级	
					{		
						{type=13,value=6003},
						{type=15,value=13695},
						{type=5,value=80196},
						{type=7,value=320784},
					},	
						--飞升45级	
					{		
						{type=13,value=6180},
						{type=15,value=14124},
						{type=5,value=82869},
						{type=7,value=331476},
					},	
						--飞升46级	
					{		
						{type=13,value=6357},
						{type=15,value=14553},
						{type=5,value=85542},
						{type=7,value=342168},
					},	
						--飞升47级	
					{		
						{type=13,value=6534},
						{type=15,value=14982},
						{type=5,value=88215},
						{type=7,value=352860},
					},	
						--飞升48级	
					{		
						{type=13,value=6711},
						{type=15,value=15411},
						{type=5,value=90888},
						{type=7,value=363552},
					},	
						--飞升49级	
					{		
						{type=13,value=6888},
						{type=15,value=15840},
						{type=5,value=93561},
						{type=7,value=374244},
					},	
						--飞升50级	
					{		
						{type=13,value=7065},
						{type=15,value=16269},
						{type=5,value=96234},
						{type=7,value=384936},
					},	

		    	},
		    	
		    	-- 道
				{
													-- 飞升1 级 --
					{
						{type=17,value=38},
			    		{type=19,value=78},
						{type=5,value=727},
						{type=7,value=727},

		    		},
								-- 飞升2 级 --
					{
						{type=17,value=75},
			    		{type=19,value=157},
						{type=5,value=1453},
						{type=7,value=1453},

		    		},
								-- 飞升3 级 --
					{
						{type=17,value=112},
			    		{type=19,value=235},
						{type=5,value=2179},
						{type=7,value=2179},

		    		},
								-- 飞升4 级 --
					{
						{type=17,value=150},
			    		{type=19,value=314},
						{type=5,value=2906},
						{type=7,value=2906},

		    		},
								-- 飞升5 级 --
					{
						{type=17,value=188},
			    		{type=19,value=393},
						{type=5,value=3487},
						{type=7,value=3487},

		    		},
								-- 飞升6 级 --
					{
						{type=17,value=248},
			    		{type=19,value=519},
						{type=5,value=4649},
						{type=7,value=4649},

		    		},
								-- 飞升7 级 --
					{
						{type=17,value=308},
			    		{type=19,value=645},
						{type=5,value=5811},
						{type=7,value=5811},

		    		},
								-- 飞升8 级 --
					{
						{type=17,value=368},
			    		{type=19,value=771},
						{type=5,value=6973},
						{type=7,value=6973},

		    		},
								-- 飞升9 级 --
					{
						{type=17,value=428},
			    		{type=19,value=897},
						{type=5,value=8135},
						{type=7,value=8135},

		    		},
								-- 飞升10 级 --
					{
						{type=17,value=488},
			    		{type=19,value=1023},
						{type=5,value=9297},
						{type=7,value=9297},

		    		},
								-- 飞升11 级 --
					{
						{type=17,value=573},
			    		{type=19,value=1202},
						{type=5,value=11185},
						{type=7,value=11185},

		    		},
								-- 飞升12 级 --
					{
						{type=17,value=660},
			    		{type=19,value=1384},
						{type=5,value=13073},
						{type=7,value=13073},

		    		},
								-- 飞升13 级 --
					{
						{type=17,value=746},
			    		{type=19,value=1566},
						{type=5,value=14961},
						{type=7,value=14961},

		    		},
								-- 飞升14 级 --
					{
						{type=17,value=833},
			    		{type=19,value=1748},
						{type=5,value=16850},
						{type=7,value=16850},

		    		},
								-- 飞升15 级 --
					{
						{type=17,value=920},
			    		{type=19,value=1932},
						{type=5,value=18593},
						{type=7,value=18593},

		    		},
								-- 飞升16 级 --
					{
						{type=17,value=1060},
			    		{type=19,value=2225},
						{type=5,value=21933},
						{type=7,value=21933},

		    		},
								-- 飞升17 级 --
					{
						{type=17,value=1200},
			    		{type=19,value=2518},
						{type=5,value=25274},
						{type=7,value=25274},

		    		},
								-- 飞升18 级 --
					{
						{type=17,value=1339},
			    		{type=19,value=2811},
						{type=5,value=28615},
						{type=7,value=28615},

		    		},
								-- 飞升19 级 --
					{
						{type=17,value=1479},
			    		{type=19,value=3104},
						{type=5,value=31956},
						{type=7,value=31956},

		    		},
								-- 飞升20 级 --
					{
						{type=17,value=1619},
			    		{type=19,value=3399},
						{type=5,value=34861},
						{type=7,value=34861},

		    		},
								-- 飞升21 级 --
					{
						{type=17,value=1823},
			    		{type=19,value=3828},
						{type=5,value=40671},
						{type=7,value=40671},

		    		},
								-- 飞升22 级 --
					{
						{type=17,value=2028},
			    		{type=19,value=4257},
						{type=5,value=46481},
						{type=7,value=46481},

		    		},
								-- 飞升23 级 --
					{
						{type=17,value=2232},
			    		{type=19,value=4686},
						{type=5,value=52291},
						{type=7,value=52291},

		    		},
								-- 飞升24 级 --
					{
						{type=17,value=2436},
			    		{type=19,value=5115},
						{type=5,value=58101},
						{type=7,value=58101},

		    		},
								-- 飞升25 级 --
					{
						{type=17,value=2640},
			    		{type=19,value=5544},
						{type=5,value=63911},
						{type=7,value=63911},

		    		},
						--飞升26级		
					{			
						{type=17,value=2817},	
						{type=19,value=5973},	
						{type=5,value=69721},	
						{type=7,value=69721},	
					},		
						--飞升27级		
					{			
						{type=17,value=2994},	
						{type=19,value=6402},	
						{type=5,value=75531},	
						{type=7,value=75531},	
					},		
						--飞升28级		
					{			
						{type=17,value=3171},	
						{type=19,value=6831},	
						{type=5,value=81341},	
						{type=7,value=81341},	
					},		
						--飞升29级		
					{			
						{type=17,value=3348},	
						{type=19,value=7260},	
						{type=5,value=87151},	
						{type=7,value=87151},	
					},		
						--飞升30级		
					{			
						{type=17,value=3525},	
						{type=19,value=7689},	
						{type=5,value=92961},	
						{type=7,value=92961},	
					},		
						--飞升31级		
					{			
						{type=17,value=3702},	
						{type=19,value=8118},	
						{type=5,value=98771},	
						{type=7,value=98771},	
					},		
						--飞升32级		
					{			
						{type=17,value=3879},	
						{type=19,value=8547},	
						{type=5,value=104581},	
						{type=7,value=104581},	
					},		
						--飞升33级		
					{			
						{type=17,value=4056},	
						{type=19,value=8976},	
						{type=5,value=110391},	
						{type=7,value=110391},	
					},		
						--飞升34级		
					{			
						{type=17,value=4233},	
						{type=19,value=9405},	
						{type=5,value=116201},	
						{type=7,value=116201},	
					},		
						--飞升35级		
					{			
						{type=17,value=4410},	
						{type=19,value=9834},	
						{type=5,value=122011},	
						{type=7,value=122011},	
					},		
						--飞升36级		
					{			
						{type=17,value=4587},	
						{type=19,value=10263},	
						{type=5,value=127821},	
						{type=7,value=127821},	
					},		
						--飞升37级		
					{			
						{type=17,value=4764},	
						{type=19,value=10692},	
						{type=5,value=133631},	
						{type=7,value=133631},	
					},		
						--飞升38级		
					{			
						{type=17,value=4941},	
						{type=19,value=11121},	
						{type=5,value=139441},	
						{type=7,value=139441},	
					},		
						--飞升39级		
					{			
						{type=17,value=5118},	
						{type=19,value=11550},	
						{type=5,value=145251},	
						{type=7,value=145251},	
					},		
						--飞升40级		
					{			
						{type=17,value=5295},	
						{type=19,value=11979},	
						{type=5,value=151061},	
						{type=7,value=151061},	
					},		
						--飞升41级		
					{			
						{type=17,value=5472},	
						{type=19,value=12408},	
						{type=5,value=156871},	
						{type=7,value=156871},	
					},		
						--飞升42级		
					{			
						{type=17,value=5649},	
						{type=19,value=12837},	
						{type=5,value=162681},	
						{type=7,value=162681},	
					},		
						--飞升43级		
					{			
						{type=17,value=5826},	
						{type=19,value=13266},	
						{type=5,value=168491},	
						{type=7,value=168491},	
					},		
						--飞升44级		
					{			
						{type=17,value=6003},	
						{type=19,value=13695},	
						{type=5,value=174301},	
						{type=7,value=174301},	
					},		
						--飞升45级		
					{			
						{type=17,value=6180},	
						{type=19,value=14124},	
						{type=5,value=180111},	
						{type=7,value=180111},	
					},		
						--飞升46级		
					{			
						{type=17,value=6357},	
						{type=19,value=14553},	
						{type=5,value=185921},	
						{type=7,value=185921},	
					},		
						--飞升47级		
					{			
						{type=17,value=6534},	
						{type=19,value=14982},	
						{type=5,value=191731},	
						{type=7,value=191731},	
					},		
						--飞升48级		
					{			
						{type=17,value=6711},	
						{type=19,value=15411},	
						{type=5,value=197541},	
						{type=7,value=197541},	
					},		
						--飞升49级		
					{			
						{type=17,value=6888},	
						{type=19,value=15840},	
						{type=5,value=203351},	
						{type=7,value=203351},	
					},		
						--飞升50级		
					{			
						{type=17,value=7065},	
						{type=19,value=16269},	
						{type=5,value=209161},	
						{type=7,value=209161},	
					},				    		
		    	},
			}			
		},

		--灭世手套
		{
			breakLevelNeedItem = 7534,--突破所需物品
			--法宝id --灭世手套
			treasureIds = {7542,7543,7544,7545,7546,7853,7854,7855,7856,7857},
			effectId = {801,802,803,804,805,805,805,805,805,805},

			skillId1 = {237,238,239,240,241,241,241,241,241,241},--战士
			skillId2 = {242,243,244,245,246,246,246,246,246,246},--法师
			skillId3 = {247,248,249,250,251,251,251,251,251,251},--道士

-- 每阶突破所需物品的数量
			
			classConsumeCounts = { 1,4,8,16,32,64,128,256,512,800},
			
			-- 升级所需物品的数量
			levelConsumeCounts = {2,4,6,8,10,12,14,16,18,20,23,27,31,35,40,45,50,56,62,68,74,81,88,96,103,110,117,124,131,138,145,152,159,166,173,180,187,194,201,208,215,222,229,236,243,250,257,264,271,278},
			
			--触发法宝攻击的万分比
			--treasuerAttack = {10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,},
			treasuerAttack = {500,550,600,650,700,750,800,850,900,950,1000,1050,1100,1150,1200,1300,1400,1500,1600,1700,1800,1900,2000,2100,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,},
			-- 阶级属性
			classAttrs = {
				-- 战

					-- -- (a1) --
					-- {
					-- 	{type=(a2),value=(a3)},
			    	-- 	{type=(a4),value=(a5)},
					-- 	{type=(a6),value=(a7)},
					-- 	{type=(a8),value=(a9)},

		    		-- },

				{

									-- 1阶 --
					{
						{type=9,value=125},
			    		{type=11,value=262},
						{type=29,value=12},

		    		},
					-- 2阶 --
					{
						{type=9,value=325},
			    		{type=11,value=682},
						{type=29,value=32},

		    		},
					-- 3阶 --
					{
						{type=9,value=614},
			    		{type=11,value=1288},
						{type=29,value=64},

		    		},
					-- 4阶 --
					{
						{type=9,value=1080},
			    		{type=11,value=2266},
						{type=29,value=120},

		    		},
					-- 5阶 --
					{
						{type=9,value=1760},
			    		{type=11,value=3696},
						{type=29,value=220},

		    		},

					-- 6阶 --
					{
						{type=9,value=2440},
						{type=11,value=5126},
						{type=29,value=320},

		    		},

					-- 7阶 --
					{
						{type=9,value=3120},
						{type=11,value=6556},
						{type=29,value=420},

		    		},

					-- 8阶 --
					{
						{type=9,value=3800},
						{type=11,value=7986},
						{type=29,value=520},
		    		},

					-- 9阶 --
					{
						{type=9,value=4480},
						{type=11,value=9416},
						{type=29,value=620},
		    		},

					-- 10阶 --
					{
						{type=9,value=5160},
						{type=11,value=10846},
						{type=29,value=720},
		    		},

			},

		    	
		    	-- 法
				{
					
									-- 1阶 --
					{
						{type=13,value=125},
			    		{type=15,value=262},
						{type=29,value=12},

		    		},
					-- 2阶 --
					{
						{type=13,value=325},
			    		{type=15,value=682},
						{type=29,value=32},

		    		},
					-- 3阶 --
					{
						{type=13,value=614},
			    		{type=15,value=1288},
						{type=29,value=64},

		    		},
					-- 4阶 --
					{
						{type=13,value=1080},
			    		{type=15,value=2266},
						{type=29,value=120},

		    		},
					-- 5阶 --
					{
						{type=13,value=1760},
			    		{type=15,value=3696},
						{type=29,value=220},

		    		},
					-- 6阶 --
					{
						{type=13,value=2440},
						{type=15,value=5126},
						{type=29,value=320},

		    		},

					-- 7阶 --
					{
						{type=13,value=3120},
						{type=15,value=6556},
						{type=29,value=420},

		    		},

					-- 8阶 --
					{
						{type=13,value=3800},
						{type=15,value=7986},
						{type=29,value=520},
		    		},

					-- 9阶 --
					{
						{type=13,value=4480},
						{type=15,value=9416},
						{type=29,value=620},
		    		},

					-- 10阶 --
					{
						{type=13,value=5160},
						{type=15,value=10846},
						{type=29,value=720},
		    		},

		    		
		    	},
		    	
		    	-- 道
				{
		
										-- 1阶 --
					{
						{type=17,value=125},
			    		{type=19,value=262},
						{type=29,value=12},

		    		},
					-- 2阶 --
					{
						{type=17,value=325},
			    		{type=19,value=682},
						{type=29,value=32},

		    		},
					-- 3阶 --
					{
						{type=17,value=614},
			    		{type=19,value=1288},
						{type=29,value=64},

		    		},
					-- 4阶 --
					{
						{type=17,value=1080},
			    		{type=19,value=2266},
						{type=29,value=120},

		    		},
					-- 5阶 --
					{
						{type=17,value=1760},
			    		{type=19,value=3696},
						{type=29,value=220},

		    		},
					-- 6阶 --
					{
						{type=17,value=2440},
						{type=19,value=5126},
						{type=29,value=320},

		    		},

					-- 7阶 --
					{
						{type=17,value=3120},
						{type=19,value=6556},
						{type=29,value=420},

		    		},

					-- 8阶 --
					{
						{type=17,value=3800},
						{type=19,value=7986},
						{type=29,value=520},
		    		},

					-- 9阶 --
					{
						{type=17,value=4480},
						{type=19,value=9416},
						{type=29,value=620},
		    		},

					-- 10阶 --
					{
						{type=17,value=5160},
						{type=19,value=10846},
						{type=29,value=720},
		    		},
		    		
		    	},
		    	
			},
			
			-- 等级属性
			levelAttrs = {
				-- 战
					-- -- 	--模块
					-- 			-- (a1) 级 --
					-- {
					-- 	{type=(a2),value=(a3)},
			    	-- 	{type=(a4),value=(a5)},
					-- 	{type=(a6),value=(a7)},
					-- 	{type=(a8),value=(a9)},

		    		-- },



				{
													-- 飞升1 级 --
					{
						{type=9,value=38},
			    		{type=11,value=78},
						{type=29,value=5},

		    		},
								-- 飞升2 级 --
					{
						{type=9,value=75},
			    		{type=11,value=157},
						{type=29,value=10},

		    		},
								-- 飞升3 级 --
					{
						{type=9,value=112},
			    		{type=11,value=235},
						{type=29,value=15},

		    		},
								-- 飞升4 级 --
					{
						{type=9,value=150},
			    		{type=11,value=314},
						{type=29,value=20},

		    		},
								-- 飞升5 级 --
					{
						{type=9,value=188},
			    		{type=11,value=393},
						{type=29,value=24},

		    		},
								-- 飞升6 级 --
					{
						{type=9,value=248},
			    		{type=11,value=519},
						{type=29,value=32},

		    		},
								-- 飞升7 级 --
					{
						{type=9,value=308},
			    		{type=11,value=645},
						{type=29,value=40},

		    		},
								-- 飞升8 级 --
					{
						{type=9,value=368},
			    		{type=11,value=771},
						{type=29,value=48},

		    		},
								-- 飞升9 级 --
					{
						{type=9,value=428},
			    		{type=11,value=897},
						{type=29,value=56},

		    		},
								-- 飞升10 级 --
					{
						{type=9,value=488},
			    		{type=11,value=1023},
						{type=29,value=64},

		    		},
								-- 飞升11 级 --
					{
						{type=9,value=573},
			    		{type=11,value=1202},
						{type=29,value=77},

		    		},
								-- 飞升12 级 --
					{
						{type=9,value=660},
			    		{type=11,value=1384},
						{type=29,value=90},

		    		},
								-- 飞升13 级 --
					{
						{type=9,value=746},
			    		{type=11,value=1566},
						{type=29,value=103},

		    		},
								-- 飞升14 级 --
					{
						{type=9,value=833},
			    		{type=11,value=1748},
						{type=29,value=116},

		    		},
								-- 飞升15 级 --
					{
						{type=9,value=920},
			    		{type=11,value=1932},
						{type=29,value=128},

		    		},
								-- 飞升16 级 --
					{
						{type=9,value=1060},
			    		{type=11,value=2225},
						{type=29,value=151},

		    		},
								-- 飞升17 级 --
					{
						{type=9,value=1200},
			    		{type=11,value=2518},
						{type=29,value=174},

		    		},
								-- 飞升18 级 --
					{
						{type=9,value=1339},
			    		{type=11,value=2811},
						{type=29,value=197},

		    		},
								-- 飞升19 级 --
					{
						{type=9,value=1479},
			    		{type=11,value=3104},
						{type=29,value=220},

		    		},
								-- 飞升20 级 --
					{
						{type=9,value=1619},
			    		{type=11,value=3399},
						{type=29,value=240},

		    		},
								-- 飞升21 级 --
					{
						{type=9,value=1823},
			    		{type=11,value=3828},
						{type=29,value=280},

		    		},
								-- 飞升22 级 --
					{
						{type=9,value=2028},
			    		{type=11,value=4257},
						{type=29,value=320},

		    		},
								-- 飞升23 级 --
					{
						{type=9,value=2232},
			    		{type=11,value=4686},
						{type=29,value=360},

		    		},
								-- 飞升24 级 --
					{
						{type=9,value=2436},
			    		{type=11,value=5115},
						{type=29,value=400},

		    		},
								-- 飞升25 级 --
					{
						{type=9,value=2640},
			    		{type=11,value=5544},
						{type=29,value=440},

		    		},
							--飞升26级	
						{		
							{type=9,value=2844},
							{type=11,value=5973},
							{type=29,value=480},	
						},	
							--飞升27级	
						{		
							{type=9,value=3048},
							{type=11,value=6402},
							{type=29,value=520},	
						},	
							--飞升28级	
						{		
							{type=9,value=3252},
							{type=11,value=6831},
							{type=29,value=560},	
						},	
							--飞升29级	
						{		
							{type=9,value=3456},
							{type=11,value=7260},
							{type=29,value=600},	
						},	
							--飞升30级	
						{		
							{type=9,value=3660},
							{type=11,value=7689},
							{type=29,value=640},	
						},	
							--飞升31级	
						{		
							{type=9,value=3864},
							{type=11,value=8118},
							{type=29,value=680},	
						},	
							--飞升32级	
						{		
							{type=9,value=4068},
							{type=11,value=8547},
							{type=29,value=720},	
						},	
							--飞升33级	
						{		
							{type=9,value=4272},
							{type=11,value=8976},
							{type=29,value=760},	
						},	
							--飞升34级	
						{		
							{type=9,value=4476},
							{type=11,value=9405},
							{type=29,value=800},	
						},	
							--飞升35级	
						{		
							{type=9,value=4680},
							{type=11,value=9834},
							{type=29,value=840},	
						},	
							--飞升36级	
						{		
							{type=9,value=4884},
							{type=11,value=10263},
							{type=29,value=880},	
						},	
							--飞升37级	
						{		
							{type=9,value=5088},
							{type=11,value=10692},
							{type=29,value=920},	
						},	
							--飞升38级	
						{		
							{type=9,value=5292},
							{type=11,value=11121},
							{type=29,value=960},	
						},	
							--飞升39级	
						{		
							{type=9,value=5496},
							{type=11,value=11550},
							{type=29,value=1000},	
						},	
							--飞升40级	
						{		
							{type=9,value=5700},
							{type=11,value=11979},
							{type=29,value=1040},	
						},	
							--飞升41级	
						{		
							{type=9,value=5904},
							{type=11,value=12408},
							{type=29,value=1080},	
						},	
							--飞升42级	
						{		
							{type=9,value=6108},
							{type=11,value=12837},
							{type=29,value=1120},	
						},	
							--飞升43级	
						{		
							{type=9,value=6312},
							{type=11,value=13266},
							{type=29,value=1160},	
						},	
							--飞升44级	
						{		
							{type=9,value=6516},
							{type=11,value=13695},
							{type=29,value=1200},	
						},	
							--飞升45级	
						{		
							{type=9,value=6720},
							{type=11,value=14124},
							{type=29,value=1240},	
						},	
							--飞升46级	
						{		
							{type=9,value=6924},
							{type=11,value=14553},
							{type=29,value=1280},	
						},	
							--飞升47级	
						{		
							{type=9,value=7128},
							{type=11,value=14982},
							{type=29,value=1320},	
						},	
							--飞升48级	
						{		
							{type=9,value=7332},
							{type=11,value=15411},
							{type=29,value=1360},	
						},	
							--飞升49级	
						{		
							{type=9,value=7536},
							{type=11,value=15840},
							{type=29,value=1400},	
						},	
							--飞升50级	
						{		
							{type=9,value=7740},
							{type=11,value=16269},
							{type=29,value=1440},	
						},
		    		
		    	},
		    	
		    	-- 法
				{
												-- 飞升1 级 --
					{
						{type=13,value=38},
			    		{type=15,value=78},
						{type=29,value=5},

		    		},
								-- 飞升2 级 --
					{
						{type=13,value=75},
			    		{type=15,value=157},
						{type=29,value=10},

		    		},
								-- 飞升3 级 --
					{
						{type=13,value=112},
			    		{type=15,value=235},
						{type=29,value=15},

		    		},
								-- 飞升4 级 --
					{
						{type=13,value=150},
			    		{type=15,value=314},
						{type=29,value=20},

		    		},
								-- 飞升5 级 --
					{
						{type=13,value=188},
			    		{type=15,value=393},
						{type=29,value=24},

		    		},
								-- 飞升6 级 --
					{
						{type=13,value=248},
			    		{type=15,value=519},
						{type=29,value=32},

		    		},
								-- 飞升7 级 --
					{
						{type=13,value=308},
			    		{type=15,value=645},
						{type=29,value=40},

		    		},
								-- 飞升8 级 --
					{
						{type=13,value=368},
			    		{type=15,value=771},
						{type=29,value=48},

		    		},
								-- 飞升9 级 --
					{
						{type=13,value=428},
			    		{type=15,value=897},
						{type=29,value=56},

		    		},
								-- 飞升10 级 --
					{
						{type=13,value=488},
			    		{type=15,value=1023},
						{type=29,value=64},

		    		},
								-- 飞升11 级 --
					{
						{type=13,value=573},
			    		{type=15,value=1202},
						{type=29,value=77},

		    		},
								-- 飞升12 级 --
					{
						{type=13,value=660},
			    		{type=15,value=1384},
						{type=29,value=90},

		    		},
								-- 飞升13 级 --
					{
						{type=13,value=746},
			    		{type=15,value=1566},
						{type=29,value=103},

		    		},
								-- 飞升14 级 --
					{
						{type=13,value=833},
			    		{type=15,value=1748},
						{type=29,value=116},

		    		},
								-- 飞升15 级 --
					{
						{type=13,value=920},
			    		{type=15,value=1932},
						{type=29,value=128},

		    		},
								-- 飞升16 级 --
					{
						{type=13,value=1060},
			    		{type=15,value=2225},
						{type=29,value=151},

		    		},
								-- 飞升17 级 --
					{
						{type=13,value=1200},
			    		{type=15,value=2518},
						{type=29,value=174},

		    		},
								-- 飞升18 级 --
					{
						{type=13,value=1339},
			    		{type=15,value=2811},
						{type=29,value=197},

		    		},
								-- 飞升19 级 --
					{
						{type=13,value=1479},
			    		{type=15,value=3104},
						{type=29,value=220},

		    		},
								-- 飞升20 级 --
					{
						{type=13,value=1619},
			    		{type=15,value=3399},
						{type=29,value=240},

		    		},
								-- 飞升21 级 --
					{
						{type=13,value=1823},
			    		{type=15,value=3828},
						{type=29,value=280},

		    		},
								-- 飞升22 级 --
					{
						{type=13,value=2028},
			    		{type=15,value=4257},
						{type=29,value=320},

		    		},
								-- 飞升23 级 --
					{
						{type=13,value=2232},
			    		{type=15,value=4686},
						{type=29,value=360},

		    		},
								-- 飞升24 级 --
					{
						{type=13,value=2436},
			    		{type=15,value=5115},
						{type=29,value=400},

		    		},
								-- 飞升25 级 --
					{
						{type=13,value=2640},
			    		{type=15,value=5544},
						{type=29,value=440},

		    		},
	                                                                                                       --飞升26级	
						{		
							{type=13,value=2844},
							{type=15,value=5973},
							{type=29,value=480},	
						},	
							--飞升27级	
						{		
							{type=13,value=3048},
							{type=15,value=6402},
							{type=29,value=520},	
						},	
							--飞升28级	
						{		
							{type=13,value=3252},
							{type=15,value=6831},
							{type=29,value=560},	
						},	
							--飞升29级	
						{		
							{type=13,value=3456},
							{type=15,value=7260},
							{type=29,value=600},	
						},	
							--飞升30级	
						{		
							{type=13,value=3660},
							{type=15,value=7689},
							{type=29,value=640},	
						},	
							--飞升31级	
						{		
							{type=13,value=3864},
							{type=15,value=8118},
							{type=29,value=680},	
						},	
							--飞升32级	
						{		
							{type=13,value=4068},
							{type=15,value=8547},
							{type=29,value=720},	
						},	
							--飞升33级	
						{		
							{type=13,value=4272},
							{type=15,value=8976},
							{type=29,value=760},	
						},	
							--飞升34级	
						{		
							{type=13,value=4476},
							{type=15,value=9405},
							{type=29,value=800},	
						},	
							--飞升35级	
						{		
							{type=13,value=4680},
							{type=15,value=9834},
							{type=29,value=840},	
						},	
							--飞升36级	
						{		
							{type=13,value=4884},
							{type=15,value=10263},
							{type=29,value=880},	
						},	
							--飞升37级	
						{		
							{type=13,value=5088},
							{type=15,value=10692},
							{type=29,value=920},	
						},	
							--飞升38级	
						{		
							{type=13,value=5292},
							{type=15,value=11121},
							{type=29,value=960},	
						},	
							--飞升39级	
						{		
							{type=13,value=5496},
							{type=15,value=11550},
							{type=29,value=1000},	
						},	
							--飞升40级	
						{		
							{type=13,value=5700},
							{type=15,value=11979},
							{type=29,value=1040},	
						},	
							--飞升41级	
						{		
							{type=13,value=5904},
							{type=15,value=12408},
							{type=29,value=1080},	
						},	
							--飞升42级	
						{		
							{type=13,value=6108},
							{type=15,value=12837},
							{type=29,value=1120},	
						},	
							--飞升43级	
						{		
							{type=13,value=6312},
							{type=15,value=13266},
							{type=29,value=1160},	
						},	
							--飞升44级	
						{		
							{type=13,value=6516},
							{type=15,value=13695},
							{type=29,value=1200},	
						},	
							--飞升45级	
						{		
							{type=13,value=6720},
							{type=15,value=14124},
							{type=29,value=1240},	
						},	
							--飞升46级	
						{		
							{type=13,value=6924},
							{type=15,value=14553},
							{type=29,value=1280},	
						},	
							--飞升47级	
						{		
							{type=13,value=7128},
							{type=15,value=14982},
							{type=29,value=1320},	
						},	
							--飞升48级	
						{		
							{type=13,value=7332},
							{type=15,value=15411},
							{type=29,value=1360},	
						},	
							--飞升49级	
						{		
							{type=13,value=7536},
							{type=15,value=15840},
							{type=29,value=1400},	
						},	
							--飞升50级	
						{		
							{type=13,value=7740},
							{type=15,value=16269},
							{type=29,value=1440},	
						},	


		    		
		    	},
		    	
		    	-- 道
				{
													-- 飞升1 级 --
					{
						{type=17,value=38},
			    		{type=19,value=78},
						{type=29,value=5},

		    		},
								-- 飞升2 级 --
					{
						{type=17,value=75},
			    		{type=19,value=157},
						{type=29,value=10},

		    		},
								-- 飞升3 级 --
					{
						{type=17,value=112},
			    		{type=19,value=235},
						{type=29,value=15},

		    		},
								-- 飞升4 级 --
					{
						{type=17,value=150},
			    		{type=19,value=314},
						{type=29,value=20},

		    		},
								-- 飞升5 级 --
					{
						{type=17,value=188},
			    		{type=19,value=393},
						{type=29,value=24},

		    		},
								-- 飞升6 级 --
					{
						{type=17,value=248},
			    		{type=19,value=519},
						{type=29,value=32},

		    		},
								-- 飞升7 级 --
					{
						{type=17,value=308},
			    		{type=19,value=645},
						{type=29,value=40},

		    		},
								-- 飞升8 级 --
					{
						{type=17,value=368},
			    		{type=19,value=771},
						{type=29,value=48},

		    		},
								-- 飞升9 级 --
					{
						{type=17,value=428},
			    		{type=19,value=897},
						{type=29,value=56},

		    		},
								-- 飞升10 级 --
					{
						{type=17,value=488},
			    		{type=19,value=1023},
						{type=29,value=64},

		    		},
								-- 飞升11 级 --
					{
						{type=17,value=573},
			    		{type=19,value=1202},
						{type=29,value=77},

		    		},
								-- 飞升12 级 --
					{
						{type=17,value=660},
			    		{type=19,value=1384},
						{type=29,value=90},

		    		},
								-- 飞升13 级 --
					{
						{type=17,value=746},
			    		{type=19,value=1566},
						{type=29,value=103},

		    		},
								-- 飞升14 级 --
					{
						{type=17,value=833},
			    		{type=19,value=1748},
						{type=29,value=116},

		    		},
								-- 飞升15 级 --
					{
						{type=17,value=920},
			    		{type=19,value=1932},
						{type=29,value=128},

		    		},
								-- 飞升16 级 --
					{
						{type=17,value=1060},
			    		{type=19,value=2225},
						{type=29,value=151},

		    		},
								-- 飞升17 级 --
					{
						{type=17,value=1200},
			    		{type=19,value=2518},
						{type=29,value=174},

		    		},
								-- 飞升18 级 --
					{
						{type=17,value=1339},
			    		{type=19,value=2811},
						{type=29,value=197},

		    		},
								-- 飞升19 级 --
					{
						{type=17,value=1479},
			    		{type=19,value=3104},
						{type=29,value=220},

		    		},
								-- 飞升20 级 --
					{
						{type=17,value=1619},
			    		{type=19,value=3399},
						{type=29,value=240},

		    		},
								-- 飞升21 级 --
					{
						{type=17,value=1823},
			    		{type=19,value=3828},
						{type=29,value=280},

		    		},
								-- 飞升22 级 --
					{
						{type=17,value=2028},
			    		{type=19,value=4257},
						{type=29,value=320},

		    		},
								-- 飞升23 级 --
					{
						{type=17,value=2232},
			    		{type=19,value=4686},
						{type=29,value=360},

		    		},
								-- 飞升24 级 --
					{
						{type=17,value=2436},
			    		{type=19,value=5115},
						{type=29,value=400},

		    		},
								-- 飞升25 级 --
					{
						{type=17,value=2640},
			    		{type=19,value=5544},
						{type=29,value=440},

		    		},
	                                                                                                       --飞升26级	
						{		
							{type=17,value=2844},
							{type=19,value=5973},
							{type=29,value=480},	
						},	
							--飞升27级	
						{		
							{type=17,value=3048},
							{type=19,value=6402},
							{type=29,value=520},	
						},	
							--飞升28级	
						{		
							{type=17,value=3252},
							{type=19,value=6831},
							{type=29,value=560},	
						},	
							--飞升29级	
						{		
							{type=17,value=3456},
							{type=19,value=7260},
							{type=29,value=600},	
						},	
							--飞升30级	
						{		
							{type=17,value=3660},
							{type=19,value=7689},
							{type=29,value=640},	
						},	
							--飞升31级	
						{		
							{type=17,value=3864},
							{type=19,value=8118},
							{type=29,value=680},	
						},	
							--飞升32级	
						{		
							{type=17,value=4068},
							{type=19,value=8547},
							{type=29,value=720},	
						},	
							--飞升33级	
						{		
							{type=17,value=4272},
							{type=19,value=8976},
							{type=29,value=760},	
						},	
							--飞升34级	
						{		
							{type=17,value=4476},
							{type=19,value=9405},
							{type=29,value=800},	
						},	
							--飞升35级	
						{		
							{type=17,value=4680},
							{type=19,value=9834},
							{type=29,value=840},	
						},	
							--飞升36级	
						{		
							{type=17,value=4884},
							{type=19,value=10263},
							{type=29,value=880},	
						},	
							--飞升37级	
						{		
							{type=17,value=5088},
							{type=19,value=10692},
							{type=29,value=920},	
						},	
							--飞升38级	
						{		
							{type=17,value=5292},
							{type=19,value=11121},
							{type=29,value=960},	
						},	
							--飞升39级	
						{		
							{type=17,value=5496},
							{type=19,value=11550},
							{type=29,value=1000},	
						},	
							--飞升40级	
						{		
							{type=17,value=5700},
							{type=19,value=11979},
							{type=29,value=1040},	
						},	
							--飞升41级	
						{		
							{type=17,value=5904},
							{type=19,value=12408},
							{type=29,value=1080},	
						},	
							--飞升42级	
						{		
							{type=17,value=6108},
							{type=19,value=12837},
							{type=29,value=1120},	
						},	
							--飞升43级	
						{		
							{type=17,value=6312},
							{type=19,value=13266},
							{type=29,value=1160},	
						},	
							--飞升44级	
						{		
							{type=17,value=6516},
							{type=19,value=13695},
							{type=29,value=1200},	
						},	
							--飞升45级	
						{		
							{type=17,value=6720},
							{type=19,value=14124},
							{type=29,value=1240},	
						},	
							--飞升46级	
						{		
							{type=17,value=6924},
							{type=19,value=14553},
							{type=29,value=1280},	
						},	
							--飞升47级	
						{		
							{type=17,value=7128},
							{type=19,value=14982},
							{type=29,value=1320},	
						},	
							--飞升48级	
						{		
							{type=17,value=7332},
							{type=19,value=15411},
							{type=29,value=1360},	
						},	
							--飞升49级	
						{		
							{type=17,value=7536},
							{type=19,value=15840},
							{type=29,value=1400},	
						},	
							--飞升50级	
						{		
							{type=17,value=7740},
							{type=19,value=16269},
							{type=29,value=1440},	
						},			    		
		    	},
			}	
			
		
		},


		--九天葫芦

		{
			breakLevelNeedItem = 7535,--突破所需物品
			--法宝id --九天葫芦
			treasureIds = {7547,7548,7549,7550,7551,7858,7859,7860,7861,7862},
			effectId = {901,902,903,904,905,905,905,905,905,905},

			skillId1 = {237,238,239,240,241,241,241,241,241,241},--战士
			skillId2 = {242,243,244,245,246,246,246,246,246,246},--法师
			skillId3 = {247,248,249,250,251,251,251,251,251,251},--道士

-- 每阶突破所需物品的数量
			
			classConsumeCounts = { 1,4,8,16,32,64,128,256,512,800},
			
			-- 升级所需物品的数量
			levelConsumeCounts = {2,4,6,8,10,12,14,16,18,20,23,27,31,35,40,45,50,56,62,68,74,81,88,96,103,110,117,124,131,138,145,152,159,166,173,180,187,194,201,208,215,222,229,236,243,250,257,264,271,278},
			
			--触发法宝攻击的万分比
			--treasuerAttack = {10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,},
			treasuerAttack = {500,550,600,650,700,750,800,850,900,950,1000,1050,1100,1150,1200,1300,1400,1500,1600,1700,1800,1900,2000,2100,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,},
			-- 阶级属性
			classAttrs = {
				-- 战

					-- -- (a1) --
					-- {
					-- 	{type=(a2),value=(a3)},
			    	-- 	{type=(a4),value=(a5)},
					-- 	{type=(a6),value=(a7)},
					-- 	{type=(a8),value=(a9)},

		    		-- },

				{
										-- 1阶 --
					{
						{type=9,value=125},
			    		{type=11,value=262},
						{type=31,value=12},

		    		},
					-- 2阶 --
					{
						{type=9,value=325},
			    		{type=11,value=682},
						{type=31,value=32},

		    		},
					-- 3阶 --
					{
						{type=9,value=614},
			    		{type=11,value=1288},
						{type=31,value=64},

		    		},
					-- 4阶 --
					{
						{type=9,value=1080},
			    		{type=11,value=2266},
						{type=31,value=120},

		    		},
					-- 5阶 --
					{
						{type=9,value=1760},
			    		{type=11,value=3696},
						{type=31,value=220},

		    		},
					-- 6阶 --
					{
						{type=9,value=2440},
						{type=11,value=5126},
						{type=31,value=320},

		    		},

					-- 7阶 --
					{
						{type=9,value=3120},
						{type=11,value=6556},
						{type=31,value=420},

		    		},

					-- 8阶 --
					{
						{type=9,value=3800},
						{type=11,value=7986},
						{type=31,value=520},
		    		},

					-- 9阶 --
					{
						{type=9,value=4480},
						{type=11,value=9416},
						{type=31,value=620},
		    		},

					-- 10阶 --
					{
						{type=9,value=5160},
						{type=11,value=10846},
						{type=31,value=720},
		    		},
		    		
		    	},
		    	
		    	-- 法
				{
										-- 1阶 --
					{
						{type=13,value=125},
			    		{type=15,value=262},
						{type=31,value=12},

		    		},
					-- 2阶 --
					{
						{type=13,value=325},
			    		{type=15,value=682},
						{type=31,value=32},

		    		},
					-- 3阶 --
					{
						{type=13,value=614},
			    		{type=15,value=1288},
						{type=31,value=64},

		    		},
					-- 4阶 --
					{
						{type=13,value=1080},
			    		{type=15,value=2266},
						{type=31,value=120},

		    		},
					-- 5阶 --
					{
						{type=13,value=1760},
			    		{type=15,value=3696},
						{type=31,value=220},

		    		},
					-- 6阶 --
					{
						{type=13,value=2440},
						{type=15,value=5126},
						{type=31,value=320},

		    		},

					-- 7阶 --
					{
						{type=13,value=3120},
						{type=15,value=6556},
						{type=31,value=420},

		    		},

					-- 8阶 --
					{
						{type=13,value=3800},
						{type=15,value=7986},
						{type=31,value=520},
		    		},

					-- 9阶 --
					{
						{type=13,value=4480},
						{type=15,value=9416},
						{type=31,value=620},
		    		},

					-- 10阶 --
					{
						{type=13,value=5160},
						{type=15,value=10846},
						{type=31,value=720},
		    		},

		    		
		    	},
		    	
		    	-- 道
				{
										-- 1阶 --
					{
						{type=17,value=125},
			    		{type=19,value=262},
						{type=31,value=12},

		    		},
					-- 2阶 --
					{
						{type=17,value=325},
			    		{type=19,value=682},
						{type=31,value=32},

		    		},
					-- 3阶 --
					{
						{type=17,value=614},
			    		{type=19,value=1288},
						{type=31,value=64},

		    		},
					-- 4阶 --
					{
						{type=17,value=1080},
			    		{type=19,value=2266},
						{type=31,value=120},

		    		},
					-- 5阶 --
					{
						{type=17,value=1760},
			    		{type=19,value=3696},
						{type=31,value=220},

		    		},

					-- 6阶 --
					{
						{type=17,value=2440},
						{type=19,value=5126},
						{type=31,value=320},

		    		},

					-- 7阶 --
					{
						{type=17,value=3120},
						{type=19,value=6556},
						{type=31,value=420},

		    		},

					-- 8阶 --
					{
						{type=17,value=3800},
						{type=19,value=7986},
						{type=31,value=520},
		    		},

					-- 9阶 --
					{
						{type=17,value=4480},
						{type=19,value=9416},
						{type=31,value=620},
		    		},

					-- 10阶 --
					{
						{type=17,value=5160},
						{type=19,value=10846},
						{type=31,value=720},
		    		},	    		
		    	},
		    	
			},
			
			-- 等级属性
			levelAttrs = {
				-- 战
					-- -- 	--模块
					-- 			-- (a1) 级 --
					-- {
					-- 	{type=(a2),value=(a3)},
			    	-- 	{type=(a4),value=(a5)},
					-- 	{type=(a6),value=(a7)},
					-- 	{type=(a8),value=(a9)},

		    		-- },



				{
									-- 飞升1 --
					{
						{type=9,value=38},
			    		{type=11,value=78},
						{type=31,value=5},

		    		},
					-- 飞升2 --
					{
						{type=9,value=75},
			    		{type=11,value=157},
						{type=31,value=10},

		    		},
					-- 飞升3 --
					{
						{type=9,value=112},
			    		{type=11,value=235},
						{type=31,value=15},

		    		},
					-- 飞升4 --
					{
						{type=9,value=150},
			    		{type=11,value=314},
						{type=31,value=20},

		    		},
					-- 飞升5 --
					{
						{type=9,value=188},
			    		{type=11,value=393},
						{type=31,value=24},

		    		},
					-- 飞升6 --
					{
						{type=9,value=248},
			    		{type=11,value=519},
						{type=31,value=32},

		    		},
					-- 飞升7 --
					{
						{type=9,value=308},
			    		{type=11,value=645},
						{type=31,value=40},

		    		},
					-- 飞升8 --
					{
						{type=9,value=368},
			    		{type=11,value=771},
						{type=31,value=48},

		    		},
					-- 飞升9 --
					{
						{type=9,value=428},
			    		{type=11,value=897},
						{type=31,value=56},

		    		},
					-- 飞升10 --
					{
						{type=9,value=488},
			    		{type=11,value=1023},
						{type=31,value=64},

		    		},
					-- 飞升11 --
					{
						{type=9,value=573},
			    		{type=11,value=1202},
						{type=31,value=77},

		    		},
					-- 飞升12 --
					{
						{type=9,value=660},
			    		{type=11,value=1384},
						{type=31,value=90},

		    		},
					-- 飞升13 --
					{
						{type=9,value=746},
			    		{type=11,value=1566},
						{type=31,value=103},

		    		},
					-- 飞升14 --
					{
						{type=9,value=833},
			    		{type=11,value=1748},
						{type=31,value=116},

		    		},
					-- 飞升15 --
					{
						{type=9,value=920},
			    		{type=11,value=1932},
						{type=31,value=128},

		    		},
					-- 飞升16 --
					{
						{type=9,value=1060},
			    		{type=11,value=2225},
						{type=31,value=151},

		    		},
					-- 飞升17 --
					{
						{type=9,value=1200},
			    		{type=11,value=2518},
						{type=31,value=174},

		    		},
					-- 飞升18 --
					{
						{type=9,value=1339},
			    		{type=11,value=2811},
						{type=31,value=197},

		    		},
					-- 飞升19 --
					{
						{type=9,value=1479},
			    		{type=11,value=3104},
						{type=31,value=220},

		    		},
					-- 飞升20 --
					{
						{type=9,value=1619},
			    		{type=11,value=3399},
						{type=31,value=240},

		    		},
					-- 飞升21 --
					{
						{type=9,value=1823},
			    		{type=11,value=3828},
						{type=31,value=280},

		    		},
					-- 飞升22 --
					{
						{type=9,value=2028},
			    		{type=11,value=4257},
						{type=31,value=320},

		    		},
					-- 飞升23 --
					{
						{type=9,value=2232},
			    		{type=11,value=4686},
						{type=31,value=360},

		    		},
					-- 飞升24 --
					{
						{type=9,value=2436},
			    		{type=11,value=5115},
						{type=31,value=400},

		    		},
					-- 飞升25 --
					{
						{type=9,value=2640},
			    		{type=11,value=5544},
						{type=31,value=440},

		    		},

						--飞升26级	
					{		
						{type=9,value=2844},
						{type=11,value=5973},
						{type=31,value=480},	
					},	
						--飞升27级	
					{		
						{type=9,value=3048},
						{type=11,value=6402},
						{type=31,value=520},	
					},	
						--飞升28级	
					{		
						{type=9,value=3252},
						{type=11,value=6831},
						{type=31,value=560},	
					},	
						--飞升29级	
					{		
						{type=9,value=3456},
						{type=11,value=7260},
						{type=31,value=600},	
					},	
						--飞升30级	
					{		
						{type=9,value=3660},
						{type=11,value=7689},
						{type=31,value=640},	
					},	
						--飞升31级	
					{		
						{type=9,value=3864},
						{type=11,value=8118},
						{type=31,value=680},	
					},	
						--飞升32级	
					{		
						{type=9,value=4068},
						{type=11,value=8547},
						{type=31,value=720},	
					},	
						--飞升33级	
					{		
						{type=9,value=4272},
						{type=11,value=8976},
						{type=31,value=760},	
					},	
						--飞升34级	
					{		
						{type=9,value=4476},
						{type=11,value=9405},
						{type=31,value=800},	
					},	
						--飞升35级	
					{		
						{type=9,value=4680},
						{type=11,value=9834},
						{type=31,value=840},	
					},	
						--飞升36级	
					{		
						{type=9,value=4884},
						{type=11,value=10263},
						{type=31,value=880},	
					},	
						--飞升37级	
					{		
						{type=9,value=5088},
						{type=11,value=10692},
						{type=31,value=920},	
					},	
						--飞升38级	
					{		
						{type=9,value=5292},
						{type=11,value=11121},
						{type=31,value=960},	
					},	
						--飞升39级	
					{		
						{type=9,value=5496},
						{type=11,value=11550},
						{type=31,value=1000},	
					},	
						--飞升40级	
					{		
						{type=9,value=5700},
						{type=11,value=11979},
						{type=31,value=1040},	
					},	
						--飞升41级	
					{		
						{type=9,value=5904},
						{type=11,value=12408},
						{type=31,value=1080},	
					},	
						--飞升42级	
					{		
						{type=9,value=6108},
						{type=11,value=12837},
						{type=31,value=1120},	
					},	
						--飞升43级	
					{		
						{type=9,value=6312},
						{type=11,value=13266},
						{type=31,value=1160},	
					},	
						--飞升44级	
					{		
						{type=9,value=6516},
						{type=11,value=13695},
						{type=31,value=1200},	
					},	
						--飞升45级	
					{		
						{type=9,value=6720},
						{type=11,value=14124},
						{type=31,value=1240},	
					},	
						--飞升46级	
					{		
						{type=9,value=6924},
						{type=11,value=14553},
						{type=31,value=1280},	
					},	
						--飞升47级	
					{		
						{type=9,value=7128},
						{type=11,value=14982},
						{type=31,value=1320},	
					},	
						--飞升48级	
					{		
						{type=9,value=7332},
						{type=11,value=15411},
						{type=31,value=1360},	
					},	
						--飞升49级	
					{		
						{type=9,value=7536},
						{type=11,value=15840},
						{type=31,value=1400},	
					},	
						--飞升50级	
					{		
						{type=9,value=7740},
						{type=11,value=16269},
						{type=31,value=1440},	
					},
		    		
		    	},
		    	
		    	-- 法
				{
									-- 飞升1 --
					{
						{type=13,value=38},
			    		{type=15,value=78},
						{type=31,value=5},

		    		},
					-- 飞升2 --
					{
						{type=13,value=75},
			    		{type=15,value=157},
						{type=31,value=10},

		    		},
					-- 飞升3 --
					{
						{type=13,value=112},
			    		{type=15,value=235},
						{type=31,value=15},

		    		},
					-- 飞升4 --
					{
						{type=13,value=150},
			    		{type=15,value=314},
						{type=31,value=20},

		    		},
					-- 飞升5 --
					{
						{type=13,value=188},
			    		{type=15,value=393},
						{type=31,value=24},

		    		},
					-- 飞升6 --
					{
						{type=13,value=248},
			    		{type=15,value=519},
						{type=31,value=32},

		    		},
					-- 飞升7 --
					{
						{type=13,value=308},
			    		{type=15,value=645},
						{type=31,value=40},

		    		},
					-- 飞升8 --
					{
						{type=13,value=368},
			    		{type=15,value=771},
						{type=31,value=48},

		    		},
					-- 飞升9 --
					{
						{type=13,value=428},
			    		{type=15,value=897},
						{type=31,value=56},

		    		},
					-- 飞升10 --
					{
						{type=13,value=488},
			    		{type=15,value=1023},
						{type=31,value=64},

		    		},
					-- 飞升11 --
					{
						{type=13,value=573},
			    		{type=15,value=1202},
						{type=31,value=77},

		    		},
					-- 飞升12 --
					{
						{type=13,value=660},
			    		{type=15,value=1384},
						{type=31,value=90},

		    		},
					-- 飞升13 --
					{
						{type=13,value=746},
			    		{type=15,value=1566},
						{type=31,value=103},

		    		},
					-- 飞升14 --
					{
						{type=13,value=833},
			    		{type=15,value=1748},
						{type=31,value=116},

		    		},
					-- 飞升15 --
					{
						{type=13,value=920},
			    		{type=15,value=1932},
						{type=31,value=128},

		    		},
					-- 飞升16 --
					{
						{type=13,value=1060},
			    		{type=15,value=2225},
						{type=31,value=151},

		    		},
					-- 飞升17 --
					{
						{type=13,value=1200},
			    		{type=15,value=2518},
						{type=31,value=174},

		    		},
					-- 飞升18 --
					{
						{type=13,value=1339},
			    		{type=15,value=2811},
						{type=31,value=197},

		    		},
					-- 飞升19 --
					{
						{type=13,value=1479},
			    		{type=15,value=3104},
						{type=31,value=220},

		    		},
					-- 飞升20 --
					{
						{type=13,value=1619},
			    		{type=15,value=3399},
						{type=31,value=240},

		    		},
					-- 飞升21 --
					{
						{type=13,value=1823},
			    		{type=15,value=3828},
						{type=31,value=280},

		    		},
					-- 飞升22 --
					{
						{type=13,value=2028},
			    		{type=15,value=4257},
						{type=31,value=320},

		    		},
					-- 飞升23 --
					{
						{type=13,value=2232},
			    		{type=15,value=4686},
						{type=31,value=360},

		    		},
					-- 飞升24 --
					{
						{type=13,value=2436},
			    		{type=15,value=5115},
						{type=31,value=400},

		    		},
					-- 飞升25 --
					{
						{type=13,value=2640},
			    		{type=15,value=5544},
						{type=31,value=440},

		    		},
						--飞升26级	
					{		
						{type=13,value=2844},
						{type=15,value=5973},
						{type=31,value=480},	
					},	
						--飞升27级	
					{		
						{type=13,value=3048},
						{type=15,value=6402},
						{type=31,value=520},	
					},	
						--飞升28级	
					{		
						{type=13,value=3252},
						{type=15,value=6831},
						{type=31,value=560},	
					},	
						--飞升29级	
					{		
						{type=13,value=3456},
						{type=15,value=7260},
						{type=31,value=600},	
					},	
						--飞升30级	
					{		
						{type=13,value=3660},
						{type=15,value=7689},
						{type=31,value=640},	
					},	
						--飞升31级	
					{		
						{type=13,value=3864},
						{type=15,value=8118},
						{type=31,value=680},	
					},	
						--飞升32级	
					{		
						{type=13,value=4068},
						{type=15,value=8547},
						{type=31,value=720},	
					},	
						--飞升33级	
					{		
						{type=13,value=4272},
						{type=15,value=8976},
						{type=31,value=760},	
					},	
						--飞升34级	
					{		
						{type=13,value=4476},
						{type=15,value=9405},
						{type=31,value=800},	
					},	
						--飞升35级	
					{		
						{type=13,value=4680},
						{type=15,value=9834},
						{type=31,value=840},	
					},	
						--飞升36级	
					{		
						{type=13,value=4884},
						{type=15,value=10263},
						{type=31,value=880},	
					},	
						--飞升37级	
					{		
						{type=13,value=5088},
						{type=15,value=10692},
						{type=31,value=920},	
					},	
						--飞升38级	
					{		
						{type=13,value=5292},
						{type=15,value=11121},
						{type=31,value=960},	
					},	
						--飞升39级	
					{		
						{type=13,value=5496},
						{type=15,value=11550},
						{type=31,value=1000},	
					},	
						--飞升40级	
					{		
						{type=13,value=5700},
						{type=15,value=11979},
						{type=31,value=1040},	
					},	
						--飞升41级	
					{		
						{type=13,value=5904},
						{type=15,value=12408},
						{type=31,value=1080},	
					},	
						--飞升42级	
					{		
						{type=13,value=6108},
						{type=15,value=12837},
						{type=31,value=1120},	
					},	
						--飞升43级	
					{		
						{type=13,value=6312},
						{type=15,value=13266},
						{type=31,value=1160},	
					},	
						--飞升44级	
					{		
						{type=13,value=6516},
						{type=15,value=13695},
						{type=31,value=1200},	
					},	
						--飞升45级	
					{		
						{type=13,value=6720},
						{type=15,value=14124},
						{type=31,value=1240},	
					},	
						--飞升46级	
					{		
						{type=13,value=6924},
						{type=15,value=14553},
						{type=31,value=1280},	
					},	
						--飞升47级	
					{		
						{type=13,value=7128},
						{type=15,value=14982},
						{type=31,value=1320},	
					},	
						--飞升48级	
					{		
						{type=13,value=7332},
						{type=15,value=15411},
						{type=31,value=1360},	
					},	
						--飞升49级	
					{		
						{type=13,value=7536},
						{type=15,value=15840},
						{type=31,value=1400},	
					},	
						--飞升50级	
					{		
						{type=13,value=7740},
						{type=15,value=16269},
						{type=31,value=1440},	
					},
		    		
		    	},
		    	
		    	-- 道
				{
										-- 飞升1 --
					{
						{type=17,value=38},
			    		{type=19,value=78},
						{type=31,value=5},

		    		},
					-- 飞升2 --
					{
						{type=17,value=75},
			    		{type=19,value=157},
						{type=31,value=10},

		    		},
					-- 飞升3 --
					{
						{type=17,value=112},
			    		{type=19,value=235},
						{type=31,value=15},

		    		},
					-- 飞升4 --
					{
						{type=17,value=150},
			    		{type=19,value=314},
						{type=31,value=20},

		    		},
					-- 飞升5 --
					{
						{type=17,value=188},
			    		{type=19,value=393},
						{type=31,value=24},

		    		},
					-- 飞升6 --
					{
						{type=17,value=248},
			    		{type=19,value=519},
						{type=31,value=32},

		    		},
					-- 飞升7 --
					{
						{type=17,value=308},
			    		{type=19,value=645},
						{type=31,value=40},

		    		},
					-- 飞升8 --
					{
						{type=17,value=368},
			    		{type=19,value=771},
						{type=31,value=48},

		    		},
					-- 飞升9 --
					{
						{type=17,value=428},
			    		{type=19,value=897},
						{type=31,value=56},

		    		},
					-- 飞升10 --
					{
						{type=17,value=488},
			    		{type=19,value=1023},
						{type=31,value=64},

		    		},
					-- 飞升11 --
					{
						{type=17,value=573},
			    		{type=19,value=1202},
						{type=31,value=77},

		    		},
					-- 飞升12 --
					{
						{type=17,value=660},
			    		{type=19,value=1384},
						{type=31,value=90},

		    		},
					-- 飞升13 --
					{
						{type=17,value=746},
			    		{type=19,value=1566},
						{type=31,value=103},

		    		},
					-- 飞升14 --
					{
						{type=17,value=833},
			    		{type=19,value=1748},
						{type=31,value=116},

		    		},
					-- 飞升15 --
					{
						{type=17,value=920},
			    		{type=19,value=1932},
						{type=31,value=128},

		    		},
					-- 飞升16 --
					{
						{type=17,value=1060},
			    		{type=19,value=2225},
						{type=31,value=151},

		    		},
					-- 飞升17 --
					{
						{type=17,value=1200},
			    		{type=19,value=2518},
						{type=31,value=174},

		    		},
					-- 飞升18 --
					{
						{type=17,value=1339},
			    		{type=19,value=2811},
						{type=31,value=197},

		    		},
					-- 飞升19 --
					{
						{type=17,value=1479},
			    		{type=19,value=3104},
						{type=31,value=220},

		    		},
					-- 飞升20 --
					{
						{type=17,value=1619},
			    		{type=19,value=3399},
						{type=31,value=240},

		    		},
					-- 飞升21 --
					{
						{type=17,value=1823},
			    		{type=19,value=3828},
						{type=31,value=280},

		    		},
					-- 飞升22 --
					{
						{type=17,value=2028},
			    		{type=19,value=4257},
						{type=31,value=320},

		    		},
					-- 飞升23 --
					{
						{type=17,value=2232},
			    		{type=19,value=4686},
						{type=31,value=360},

		    		},
					-- 飞升24 --
					{
						{type=17,value=2436},
			    		{type=19,value=5115},
						{type=31,value=400},

		    		},
					-- 飞升25 --
					{
						{type=17,value=2640},
			    		{type=19,value=5544},
						{type=31,value=440},

		    		},
						--飞升26级	
					{		
						{type=17,value=2844},
						{type=19,value=5973},
						{type=31,value=480},	
					},	
						--飞升27级	
					{		
						{type=17,value=3048},
						{type=19,value=6402},
						{type=31,value=520},	
					},	
						--飞升28级	
					{		
						{type=17,value=3252},
						{type=19,value=6831},
						{type=31,value=560},	
					},	
						--飞升29级	
					{		
						{type=17,value=3456},
						{type=19,value=7260},
						{type=31,value=600},	
					},	
						--飞升30级	
					{		
						{type=17,value=3660},
						{type=19,value=7689},
						{type=31,value=640},	
					},	
						--飞升31级	
					{		
						{type=17,value=3864},
						{type=19,value=8118},
						{type=31,value=680},	
					},	
						--飞升32级	
					{		
						{type=17,value=4068},
						{type=19,value=8547},
						{type=31,value=720},	
					},	
						--飞升33级	
					{		
						{type=17,value=4272},
						{type=19,value=8976},
						{type=31,value=760},	
					},	
						--飞升34级	
					{		
						{type=17,value=4476},
						{type=19,value=9405},
						{type=31,value=800},	
					},	
						--飞升35级	
					{		
						{type=17,value=4680},
						{type=19,value=9834},
						{type=31,value=840},	
					},	
						--飞升36级	
					{		
						{type=17,value=4884},
						{type=19,value=10263},
						{type=31,value=880},	
					},	
						--飞升37级	
					{		
						{type=17,value=5088},
						{type=19,value=10692},
						{type=31,value=920},	
					},	
						--飞升38级	
					{		
						{type=17,value=5292},
						{type=19,value=11121},
						{type=31,value=960},	
					},	
						--飞升39级	
					{		
						{type=17,value=5496},
						{type=19,value=11550},
						{type=31,value=1000},	
					},	
						--飞升40级	
					{		
						{type=17,value=5700},
						{type=19,value=11979},
						{type=31,value=1040},	
					},	
						--飞升41级	
					{		
						{type=17,value=5904},
						{type=19,value=12408},
						{type=31,value=1080},	
					},	
						--飞升42级	
					{		
						{type=17,value=6108},
						{type=19,value=12837},
						{type=31,value=1120},	
					},	
						--飞升43级	
					{		
						{type=17,value=6312},
						{type=19,value=13266},
						{type=31,value=1160},	
					},	
						--飞升44级	
					{		
						{type=17,value=6516},
						{type=19,value=13695},
						{type=31,value=1200},	
					},	
						--飞升45级	
					{		
						{type=17,value=6720},
						{type=19,value=14124},
						{type=31,value=1240},	
					},	
						--飞升46级	
					{		
						{type=17,value=6924},
						{type=19,value=14553},
						{type=31,value=1280},	
					},	
						--飞升47级	
					{		
						{type=17,value=7128},
						{type=19,value=14982},
						{type=31,value=1320},	
					},	
						--飞升48级	
					{		
						{type=17,value=7332},
						{type=19,value=15411},
						{type=31,value=1360},	
					},	
						--飞升49级	
					{		
						{type=17,value=7536},
						{type=19,value=15840},
						{type=31,value=1400},	
					},	
						--飞升50级	
					{		
						{type=17,value=7740},
						{type=19,value=16269},
						{type=31,value=1440},	
					},
		    		
		    	},
			}	
			
		
		},

		--圣火之令

		{
			breakLevelNeedItem = 7536,--突破所需物品
			--法宝id --圣火之令
			treasureIds = {7552,7553,7554,7555,7556,7863,7864,7865,7866,7867},
			effectId = {1001,1002,1003,1004,1005,1005,1005,1005,1005,1005},

			skillId1 = {237,238,239,240,241,241,241,241,241,241},--战士
			skillId2 = {242,243,244,245,246,246,246,246,246,246},--法师
			skillId3 = {247,248,249,250,251,251,251,251,251,251},--道士

-- 每阶突破所需物品的数量
			
			classConsumeCounts = { 1,4,8,16,32,64,128,256,512,800},
			
			-- 升级所需物品的数量
			levelConsumeCounts = {2,4,6,8,10,12,14,16,18,20,23,27,31,35,40,45,50,56,62,68,74,81,88,96,103,110,117,124,131,138,145,152,159,166,173,180,187,194,201,208,215,222,229,236,243,250,257,264,271,278},
			
			--触发法宝攻击的万分比
			--treasuerAttack = {10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,10000,},
			treasuerAttack = {500,550,600,650,700,750,800,850,900,950,1000,1050,1100,1150,1200,1300,1400,1500,1600,1700,1800,1900,2000,2100,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,2200,},
			-- 阶级属性
			classAttrs = {
				-- 战

					-- -- (a1) --
					-- {
					-- 	{type=(a2),value=(a3)},
			    	-- 	{type=(a4),value=(a5)},
					-- 	{type=(a6),value=(a7)},
					-- 	{type=(a8),value=(a9)},

		    		-- },

				{
								-- 1阶 
					{
						{type=9,value=125},
			    		{type=11,value=262},
						{type=128,value=40},
						{type=129,value=624},

		    		},
				-- 2阶 
					{
						{type=9,value=325},
			    		{type=11,value=682},
						{type=128,value=80},
						{type=129,value=1664},

		    		},
				-- 3阶 
					{
						{type=9,value=614},
			    		{type=11,value=1288},
						{type=128,value=120},
						{type=129,value=3328},

		    		},
				-- 4阶 
					{
						{type=9,value=1080},
			    		{type=11,value=2266},
						{type=128,value=160},
						{type=129,value=6240},

		    		},
				-- 5阶 
					{
						{type=9,value=1760},
			    		{type=11,value=3696},
						{type=128,value=200},
						{type=129,value=11440},

		    		},
				-- 6阶 
					{
						{type=9,value=2440},
						{type=11,value=5126},
						{type=128,value=240},
						{type=129,value=16640},

		    		},
				-- 7阶 
					{
						{type=9,value=3120},
						{type=11,value=6556},
						{type=128,value=280},
						{type=129,value=21840},

		    		},
				-- 8阶 
					{
						{type=9,value=3800},
						{type=11,value=7986},
						{type=128,value=320},
						{type=129,value=27040},

		    		},
				-- 9阶 
					{
						{type=9,value=4480},
						{type=11,value=9416},
						{type=128,value=360},
						{type=129,value=32240},

		    		},
				-- 10阶 
					{
						{type=9,value=5160},
						{type=11,value=10846},
						{type=128,value=400},
						{type=129,value=37440},
		    		},	    		
		    	},
		    	
		    	-- 法
				{
									-- 1阶 
					{
						{type=13,value=125},
			    		{type=15,value=262},
						{type=128,value=40},
						{type=129,value=624},

		    		},
				-- 2阶 
					{
						{type=13,value=325},
			    		{type=15,value=682},
						{type=128,value=80},
						{type=129,value=1664},

		    		},
				-- 3阶 
					{
						{type=13,value=614},
			    		{type=15,value=1288},
						{type=128,value=120},
						{type=129,value=3328},

		    		},
				-- 4阶 
					{
						{type=13,value=1080},
			    		{type=15,value=2266},
						{type=128,value=160},
						{type=129,value=6240},

		    		},
				-- 5阶 
					{
						{type=13,value=1760},
			    		{type=15,value=3696},
						{type=128,value=200},
						{type=129,value=11440},

		    		},
				-- 6阶 
					{
						{type=13,value=2440},
						{type=15,value=5126},
						{type=128,value=240},
						{type=129,value=16640},

		    		},
				-- 7阶 
					{
						{type=13,value=3120},
						{type=15,value=6556},
						{type=128,value=280},
						{type=129,value=21840},

		    		},
				-- 8阶 
					{
						{type=13,value=3800},
						{type=15,value=7986},
						{type=128,value=320},
						{type=129,value=27040},

		    		},
				-- 9阶 
					{
						{type=13,value=4480},
						{type=15,value=9416},
						{type=128,value=360},
						{type=129,value=32240},

		    		},
				-- 10阶 
					{
						{type=13,value=5160},
						{type=15,value=10846},
						{type=128,value=400},
						{type=129,value=37440},
		    		},
		    		
		    	},
		    	
		    	-- 道
				{
									-- 1阶 
					{
						{type=17,value=125},
			    		{type=19,value=262},
						{type=128,value=40},
						{type=129,value=624},

		    		},
				-- 2阶 
					{
						{type=17,value=325},
			    		{type=19,value=682},
						{type=128,value=80},
						{type=129,value=1664},

		    		},
				-- 3阶 
					{
						{type=17,value=614},
			    		{type=19,value=1288},
						{type=128,value=120},
						{type=129,value=3328},

		    		},
				-- 4阶 
					{
						{type=17,value=1080},
			    		{type=19,value=2266},
						{type=128,value=160},
						{type=129,value=6240},

		    		},
				-- 5阶 
					{
						{type=17,value=1760},
			    		{type=19,value=3696},
						{type=128,value=200},
						{type=129,value=11440},

		    		},
				-- 6阶 
					{
						{type=17,value=2440},
						{type=19,value=5126},
						{type=128,value=240},
						{type=129,value=16640},

		    		},
				-- 7阶 
					{
						{type=17,value=3120},
						{type=19,value=6556},
						{type=128,value=280},
						{type=129,value=21840},

		    		},
				-- 8阶 
					{
						{type=17,value=3800},
						{type=19,value=7986},
						{type=128,value=320},
						{type=129,value=27040},

		    		},
				-- 9阶 
					{
						{type=17,value=4480},
						{type=19,value=9416},
						{type=128,value=360},
						{type=129,value=32240},

		    		},
				-- 10阶 
					{
						{type=17,value=5160},
						{type=19,value=10846},
						{type=128,value=400},
						{type=129,value=37440},
		    		},
		    		
		    	},	
		    	
			},
			
			-- 等级属性
			levelAttrs = {
				-- 战
					-- -- 	--模块
					-- 			-- (a1) 级 --
					-- {
					-- 	{type=(a2),value=(a3)},
			    	-- 	{type=(a4),value=(a5)},
					-- 	{type=(a6),value=(a7)},
					-- 	{type=(a8),value=(a9)},

		    		-- },



				{
					
					-- 飞升1 级 --
					{
						{type=9,value=38},
			    		{type=11,value=78},
						{type=128,value=10},
						{type=129,value=140},

		    		},

					-- 飞升2 级 --
					{
						{type=9,value=75},
			    		{type=11,value=157},
						{type=128,value=20},
						{type=129,value=280},

		    		},

					-- 飞升3 级 --
					{
						{type=9,value=112},
			    		{type=11,value=235},
						{type=128,value=30},
						{type=129,value=420},

		    		},

					-- 飞升4 级 --
					{
						{type=9,value=150},
			    		{type=11,value=314},
						{type=128,value=40},
						{type=129,value=560},

		    		},

					-- 飞升5 级 --
					{
						{type=9,value=188},
			    		{type=11,value=393},
						{type=128,value=50},
						{type=129,value=648},

		    		},

					-- 飞升6 级 --
					{
						{type=9,value=248},
			    		{type=11,value=519},
						{type=128,value=60},
						{type=129,value=944},

		    		},

					-- 飞升7 级 --
					{
						{type=9,value=308},
			    		{type=11,value=645},
						{type=128,value=70},
						{type=129,value=1240},

		    		},

					-- 飞升8 级 --
					{
						{type=9,value=368},
			    		{type=11,value=771},
						{type=128,value=80},
						{type=129,value=1536},

		    		},

					-- 飞升9 级 --
					{
						{type=9,value=428},
			    		{type=11,value=897},
						{type=128,value=90},
						{type=129,value=1832},

		    		},

					-- 飞升10 级 --
					{
						{type=9,value=488},
			    		{type=11,value=1023},
						{type=128,value=100},
						{type=129,value=2128},

		    		},

					-- 飞升11 级 --
					{
						{type=9,value=573},
			    		{type=11,value=1202},
						{type=128,value=110},
						{type=129,value=2684},

		    		},

					-- 飞升12 级 --
					{
						{type=9,value=660},
			    		{type=11,value=1384},
						{type=128,value=120},
						{type=129,value=3240},

		    		},

					-- 飞升13 级 --
					{
						{type=9,value=746},
			    		{type=11,value=1566},
						{type=128,value=130},
						{type=129,value=3796},

		    		},

					-- 飞升14 级 --
					{
						{type=9,value=833},
			    		{type=11,value=1748},
						{type=128,value=140},
						{type=129,value=4352},

		    		},

					-- 飞升15 级 --
					{
						{type=9,value=920},
			    		{type=11,value=1932},
						{type=128,value=150},
						{type=129,value=4856},

		    		},

					-- 飞升16 级 --
					{
						{type=9,value=1060},
			    		{type=11,value=2225},
						{type=128,value=160},
						{type=129,value=5932},

		    		},

					-- 飞升17 级 --
					{
						{type=9,value=1200},
			    		{type=11,value=2518},
						{type=128,value=170},
						{type=129,value=7008},

		    		},

					-- 飞升18 级 --
					{
						{type=9,value=1339},
			    		{type=11,value=2811},
						{type=128,value=180},
						{type=129,value=8084},

		    		},

					-- 飞升19 级 --
					{
						{type=9,value=1479},
			    		{type=11,value=3104},
						{type=128,value=190},
						{type=129,value=9160},

		    		},

					-- 飞升20 级 --
					{
						{type=9,value=1619},
			    		{type=11,value=3399},
						{type=128,value=200},
						{type=129,value=10080},

		    		},

					-- 飞升21 级 --
					{
						{type=9,value=1823},
			    		{type=11,value=3828},
						{type=128,value=210},
						{type=129,value=12040},

		    		},

					-- 飞升22 级 --
					{
						{type=9,value=2028},
			    		{type=11,value=4257},
						{type=128,value=220},
						{type=129,value=14000},

		    		},

					-- 飞升23 级 --
					{
						{type=9,value=2232},
			    		{type=11,value=4686},
						{type=128,value=230},
						{type=129,value=15960},

		    		},

					-- 飞升24 级 --
					{
						{type=9,value=2436},
			    		{type=11,value=5115},
						{type=128,value=240},
						{type=129,value=17920},

		    		},

					-- 飞升25 级 --
					{
						{type=9,value=2640},
			    		{type=11,value=5544},
						{type=128,value=250},
						{type=129,value=19880},

		    		},
						--飞升26级			
					{				
						{type=9,value=2844},		
						{type=11,value=5973},		
						{type=128,value=260},		
						{type=129,value=21840},		
					},			
						--飞升27级			
					{				
						{type=9,value=3048},		
						{type=11,value=6402},		
						{type=128,value=270},		
						{type=129,value=23800},		
					},			
						--飞升28级			
					{				
						{type=9,value=3252},		
						{type=11,value=6831},		
						{type=128,value=280},		
						{type=129,value=25760},		
					},			
						--飞升29级			
					{				
						{type=9,value=3456},		
						{type=11,value=7260},		
						{type=128,value=290},		
						{type=129,value=27720},		
					},			
						--飞升30级			
					{				
						{type=9,value=3660},		
						{type=11,value=7689},		
						{type=128,value=300},		
						{type=129,value=29680},		
					},			
						--飞升31级			
					{				
						{type=9,value=3864},		
						{type=11,value=8118},		
						{type=128,value=310},		
						{type=129,value=31640},		
					},			
						--飞升32级			
					{				
						{type=9,value=4068},		
						{type=11,value=8547},		
						{type=128,value=320},		
						{type=129,value=33600},		
					},			
						--飞升33级			
					{				
						{type=9,value=4272},		
						{type=11,value=8976},		
						{type=128,value=330},		
						{type=129,value=35560},		
					},			
						--飞升34级			
					{				
						{type=9,value=4476},		
						{type=11,value=9405},		
						{type=128,value=340},		
						{type=129,value=37520},		
					},			
						--飞升35级			
					{				
						{type=9,value=4680},		
						{type=11,value=9834},		
						{type=128,value=350},		
						{type=129,value=39480},		
					},			
						--飞升36级			
					{				
						{type=9,value=4884},		
						{type=11,value=10263},		
						{type=128,value=360},		
						{type=129,value=41440},		
					},			
						--飞升37级			
					{				
						{type=9,value=5088},		
						{type=11,value=10692},		
						{type=128,value=370},		
						{type=129,value=43400},		
					},			
						--飞升38级			
					{				
						{type=9,value=5292},		
						{type=11,value=11121},		
						{type=128,value=380},		
						{type=129,value=45360},		
					},			
						--飞升39级			
					{				
						{type=9,value=5496},		
						{type=11,value=11550},		
						{type=128,value=390},		
						{type=129,value=47320},		
					},			
						--飞升40级			
					{				
						{type=9,value=5700},		
						{type=11,value=11979},		
						{type=128,value=400},		
						{type=129,value=49280},		
					},			
						--飞升41级			
					{				
						{type=9,value=5904},		
						{type=11,value=12408},		
						{type=128,value=410},		
						{type=129,value=51240},		
					},			
						--飞升42级			
					{				
						{type=9,value=6108},		
						{type=11,value=12837},		
						{type=128,value=420},		
						{type=129,value=53200},		
					},			
						--飞升43级			
					{				
						{type=9,value=6312},		
						{type=11,value=13266},		
						{type=128,value=430},		
						{type=129,value=55160},		
					},			
						--飞升44级			
					{				
						{type=9,value=6516},		
						{type=11,value=13695},		
						{type=128,value=440},		
						{type=129,value=57120},		
					},			
						--飞升45级			
					{				
						{type=9,value=6720},		
						{type=11,value=14124},		
						{type=128,value=450},		
						{type=129,value=59080},		
					},			
						--飞升46级			
					{				
						{type=9,value=6924},		
						{type=11,value=14553},		
						{type=128,value=460},		
						{type=129,value=61040},		
					},			
						--飞升47级			
					{				
						{type=9,value=7128},		
						{type=11,value=14982},		
						{type=128,value=470},		
						{type=129,value=63000},		
					},			
						--飞升48级			
					{				
						{type=9,value=7332},		
						{type=11,value=15411},		
						{type=128,value=480},		
						{type=129,value=64960},		
					},			
						--飞升49级			
					{				
						{type=9,value=7536},		
						{type=11,value=15840},		
						{type=128,value=490},		
						{type=129,value=66920},		
					},			
						--飞升50级			
					{				
						{type=9,value=7740},		
						{type=11,value=16269},		
						{type=128,value=500},		
						{type=129,value=68880},		
					},			

		    		
		    	},
		    	
		    	-- 法
				{
					
					-- 飞升1 级 --
					{
						{type=13,value=38},
			    		{type=15,value=78},
						{type=128,value=10},
						{type=129,value=140},

		    		},

					-- 飞升2 级 --
					{
						{type=13,value=75},
			    		{type=15,value=157},
						{type=128,value=20},
						{type=129,value=280},

		    		},

					-- 飞升3 级 --
					{
						{type=13,value=112},
			    		{type=15,value=235},
						{type=128,value=30},
						{type=129,value=420},

		    		},

					-- 飞升4 级 --
					{
						{type=13,value=150},
			    		{type=15,value=314},
						{type=128,value=40},
						{type=129,value=560},

		    		},

					-- 飞升5 级 --
					{
						{type=13,value=188},
			    		{type=15,value=393},
						{type=128,value=50},
						{type=129,value=648},

		    		},

					-- 飞升6 级 --
					{
						{type=13,value=248},
			    		{type=15,value=519},
						{type=128,value=60},
						{type=129,value=944},

		    		},

					-- 飞升7 级 --
					{
						{type=13,value=308},
			    		{type=15,value=645},
						{type=128,value=70},
						{type=129,value=1240},

		    		},

					-- 飞升8 级 --
					{
						{type=13,value=368},
			    		{type=15,value=771},
						{type=128,value=80},
						{type=129,value=1536},

		    		},

					-- 飞升9 级 --
					{
						{type=13,value=428},
			    		{type=15,value=897},
						{type=128,value=90},
						{type=129,value=1832},

		    		},

					-- 飞升10 级 --
					{
						{type=13,value=488},
			    		{type=15,value=1023},
						{type=128,value=100},
						{type=129,value=2128},

		    		},

					-- 飞升11 级 --
					{
						{type=13,value=573},
			    		{type=15,value=1202},
						{type=128,value=110},
						{type=129,value=2684},

		    		},

					-- 飞升12 级 --
					{
						{type=13,value=660},
			    		{type=15,value=1384},
						{type=128,value=120},
						{type=129,value=3240},

		    		},

					-- 飞升13 级 --
					{
						{type=13,value=746},
			    		{type=15,value=1566},
						{type=128,value=130},
						{type=129,value=3796},

		    		},

					-- 飞升14 级 --
					{
						{type=13,value=833},
			    		{type=15,value=1748},
						{type=128,value=140},
						{type=129,value=4352},

		    		},

					-- 飞升15 级 --
					{
						{type=13,value=920},
			    		{type=15,value=1932},
						{type=128,value=150},
						{type=129,value=4856},

		    		},

					-- 飞升16 级 --
					{
						{type=13,value=1060},
			    		{type=15,value=2225},
						{type=128,value=160},
						{type=129,value=5932},

		    		},

					-- 飞升17 级 --
					{
						{type=13,value=1200},
			    		{type=15,value=2518},
						{type=128,value=170},
						{type=129,value=7008},

		    		},

					-- 飞升18 级 --
					{
						{type=13,value=1339},
			    		{type=15,value=2811},
						{type=128,value=180},
						{type=129,value=8084},

		    		},

					-- 飞升19 级 --
					{
						{type=13,value=1479},
			    		{type=15,value=3104},
						{type=128,value=190},
						{type=129,value=9160},

		    		},

					-- 飞升20 级 --
					{
						{type=13,value=1619},
			    		{type=15,value=3399},
						{type=128,value=200},
						{type=129,value=10080},

		    		},

					-- 飞升21 级 --
					{
						{type=13,value=1823},
			    		{type=15,value=3828},
						{type=128,value=210},
						{type=129,value=12040},

		    		},

					-- 飞升22 级 --
					{
						{type=13,value=2028},
			    		{type=15,value=4257},
						{type=128,value=220},
						{type=129,value=14000},

		    		},

					-- 飞升23 级 --
					{
						{type=13,value=2232},
			    		{type=15,value=4686},
						{type=128,value=230},
						{type=129,value=15960},

		    		},

					-- 飞升24 级 --
					{
						{type=13,value=2436},
			    		{type=15,value=5115},
						{type=128,value=240},
						{type=129,value=17920},

		    		},

					-- 飞升25 级 --
					{
						{type=13,value=2640},
			    		{type=15,value=5544},
						{type=128,value=250},
						{type=129,value=19880},

		    		},
	                 --飞升26级			
					{				
						{type=13,value=2844},		
						{type=15,value=5973},		
						{type=128,value=260},		
						{type=129,value=21840},		
					},			
						--飞升27级			
					{				
						{type=13,value=3048},		
						{type=15,value=6402},		
						{type=128,value=270},		
						{type=129,value=23800},		
					},			
						--飞升28级			
					{				
						{type=13,value=3252},		
						{type=15,value=6831},		
						{type=128,value=280},		
						{type=129,value=25760},		
					},			
						--飞升29级			
					{				
						{type=13,value=3456},		
						{type=15,value=7260},		
						{type=128,value=290},		
						{type=129,value=27720},		
					},			
						--飞升30级			
					{				
						{type=13,value=3660},		
						{type=15,value=7689},		
						{type=128,value=300},		
						{type=129,value=29680},		
					},			
						--飞升31级			
					{				
						{type=13,value=3864},		
						{type=15,value=8118},		
						{type=128,value=310},		
						{type=129,value=31640},		
					},			
						--飞升32级			
					{				
						{type=13,value=4068},		
						{type=15,value=8547},		
						{type=128,value=320},		
						{type=129,value=33600},		
					},			
						--飞升33级			
					{				
						{type=13,value=4272},		
						{type=15,value=8976},		
						{type=128,value=330},		
						{type=129,value=35560},		
					},			
						--飞升34级			
					{				
						{type=13,value=4476},		
						{type=15,value=9405},		
						{type=128,value=340},		
						{type=129,value=37520},		
					},			
						--飞升35级			
					{				
						{type=13,value=4680},		
						{type=15,value=9834},		
						{type=128,value=350},		
						{type=129,value=39480},		
					},			
						--飞升36级			
					{				
						{type=13,value=4884},		
						{type=15,value=10263},		
						{type=128,value=360},		
						{type=129,value=41440},		
					},			
						--飞升37级			
					{				
						{type=13,value=5088},		
						{type=15,value=10692},		
						{type=128,value=370},		
						{type=129,value=43400},		
					},			
						--飞升38级			
					{				
						{type=13,value=5292},		
						{type=15,value=11121},		
						{type=128,value=380},		
						{type=129,value=45360},		
					},			
						--飞升39级			
					{				
						{type=13,value=5496},		
						{type=15,value=11550},		
						{type=128,value=390},		
						{type=129,value=47320},		
					},			
						--飞升40级			
					{				
						{type=13,value=5700},		
						{type=15,value=11979},		
						{type=128,value=400},		
						{type=129,value=49280},		
					},			
						--飞升41级			
					{				
						{type=13,value=5904},		
						{type=15,value=12408},		
						{type=128,value=410},		
						{type=129,value=51240},		
					},			
						--飞升42级			
					{				
						{type=13,value=6108},		
						{type=15,value=12837},		
						{type=128,value=420},		
						{type=129,value=53200},		
					},			
						--飞升43级			
					{				
						{type=13,value=6312},		
						{type=15,value=13266},		
						{type=128,value=430},		
						{type=129,value=55160},		
					},			
						--飞升44级			
					{				
						{type=13,value=6516},		
						{type=15,value=13695},		
						{type=128,value=440},		
						{type=129,value=57120},		
					},			
						--飞升45级			
					{				
						{type=13,value=6720},		
						{type=15,value=14124},		
						{type=128,value=450},		
						{type=129,value=59080},		
					},			
						--飞升46级			
					{				
						{type=13,value=6924},		
						{type=15,value=14553},		
						{type=128,value=460},		
						{type=129,value=61040},		
					},			
						--飞升47级			
					{				
						{type=13,value=7128},		
						{type=15,value=14982},		
						{type=128,value=470},		
						{type=129,value=63000},		
					},			
						--飞升48级			
					{				
						{type=13,value=7332},		
						{type=15,value=15411},		
						{type=128,value=480},		
						{type=129,value=64960},		
					},			
						--飞升49级			
					{				
						{type=13,value=7536},		
						{type=15,value=15840},		
						{type=128,value=490},		
						{type=129,value=66920},		
					},			
						--飞升50级			
					{				
						{type=13,value=7740},		
						{type=15,value=16269},		
						{type=128,value=500},		
						{type=129,value=68880},		
					},

		    		
		    	},
		    	
		    	-- 道
				{
				
					-- 飞升1 级 --
					{
						{type=17,value=38},
			    		{type=19,value=78},
						{type=128,value=10},
						{type=129,value=140},

		    		},

					-- 飞升2 级 --
					{
						{type=17,value=75},
			    		{type=19,value=157},
						{type=128,value=20},
						{type=129,value=280},

		    		},

					-- 飞升3 级 --
					{
						{type=17,value=112},
			    		{type=19,value=235},
						{type=128,value=30},
						{type=129,value=420},

		    		},

					-- 飞升4 级 --
					{
						{type=17,value=150},
			    		{type=19,value=314},
						{type=128,value=40},
						{type=129,value=560},

		    		},

					-- 飞升5 级 --
					{
						{type=17,value=188},
			    		{type=19,value=393},
						{type=128,value=50},
						{type=129,value=648},

		    		},

					-- 飞升6 级 --
					{
						{type=17,value=248},
			    		{type=19,value=519},
						{type=128,value=60},
						{type=129,value=944},

		    		},

					-- 飞升7 级 --
					{
						{type=17,value=308},
			    		{type=19,value=645},
						{type=128,value=70},
						{type=129,value=1240},

		    		},

					-- 飞升8 级 --
					{
						{type=17,value=368},
			    		{type=19,value=771},
						{type=128,value=80},
						{type=129,value=1536},

		    		},

					-- 飞升9 级 --
					{
						{type=17,value=428},
			    		{type=19,value=897},
						{type=128,value=90},
						{type=129,value=1832},

		    		},

					-- 飞升10 级 --
					{
						{type=17,value=488},
			    		{type=19,value=1023},
						{type=128,value=100},
						{type=129,value=2128},

		    		},

					-- 飞升11 级 --
					{
						{type=17,value=573},
			    		{type=19,value=1202},
						{type=128,value=110},
						{type=129,value=2684},

		    		},

					-- 飞升12 级 --
					{
						{type=17,value=660},
			    		{type=19,value=1384},
						{type=128,value=120},
						{type=129,value=3240},

		    		},

					-- 飞升13 级 --
					{
						{type=17,value=746},
			    		{type=19,value=1566},
						{type=128,value=130},
						{type=129,value=3796},

		    		},

					-- 飞升14 级 --
					{
						{type=17,value=833},
			    		{type=19,value=1748},
						{type=128,value=140},
						{type=129,value=4352},

		    		},

					-- 飞升15 级 --
					{
						{type=17,value=920},
			    		{type=19,value=1932},
						{type=128,value=150},
						{type=129,value=4856},

		    		},

					-- 飞升16 级 --
					{
						{type=17,value=1060},
			    		{type=19,value=2225},
						{type=128,value=160},
						{type=129,value=5932},

		    		},

					-- 飞升17 级 --
					{
						{type=17,value=1200},
			    		{type=19,value=2518},
						{type=128,value=170},
						{type=129,value=7008},

		    		},

					-- 飞升18 级 --
					{
						{type=17,value=1339},
			    		{type=19,value=2811},
						{type=128,value=180},
						{type=129,value=8084},

		    		},

					-- 飞升19 级 --
					{
						{type=17,value=1479},
			    		{type=19,value=3104},
						{type=128,value=190},
						{type=129,value=9160},

		    		},

					-- 飞升20 级 --
					{
						{type=17,value=1619},
			    		{type=19,value=3399},
						{type=128,value=200},
						{type=129,value=10080},

		    		},

					-- 飞升21 级 --
					{
						{type=17,value=1823},
			    		{type=19,value=3828},
						{type=128,value=210},
						{type=129,value=12040},

		    		},

					-- 飞升22 级 --
					{
						{type=17,value=2028},
			    		{type=19,value=4257},
						{type=128,value=220},
						{type=129,value=14000},

		    		},

					-- 飞升23 级 --
					{
						{type=17,value=2232},
			    		{type=19,value=4686},
						{type=128,value=230},
						{type=129,value=15960},

		    		},

					-- 飞升24 级 --
					{
						{type=17,value=2436},
			    		{type=19,value=5115},
						{type=128,value=240},
						{type=129,value=17920},

		    		},

					-- 飞升25 级 --
					{
						{type=17,value=2640},
			    		{type=19,value=5544},
						{type=128,value=250},
						{type=129,value=19880},

		    		},
	                                                                                        --飞升26级			
					{				
						{type=17,value=2844},		
						{type=19,value=5973},		
						{type=128,value=260},		
						{type=129,value=21840},		
					},			
						--飞升27级			
					{				
						{type=17,value=3048},		
						{type=19,value=6402},		
						{type=128,value=270},		
						{type=129,value=23800},		
					},			
						--飞升28级			
					{				
						{type=17,value=3252},		
						{type=19,value=6831},		
						{type=128,value=280},		
						{type=129,value=25760},		
					},			
						--飞升29级			
					{				
						{type=17,value=3456},		
						{type=19,value=7260},		
						{type=128,value=290},		
						{type=129,value=27720},		
					},			
						--飞升30级			
					{				
						{type=17,value=3660},		
						{type=19,value=7689},		
						{type=128,value=300},		
						{type=129,value=29680},		
					},			
						--飞升31级			
					{				
						{type=17,value=3864},		
						{type=19,value=8118},		
						{type=128,value=310},		
						{type=129,value=31640},		
					},			
						--飞升32级			
					{				
						{type=17,value=4068},		
						{type=19,value=8547},		
						{type=128,value=320},		
						{type=129,value=33600},		
					},			
						--飞升33级			
					{				
						{type=17,value=4272},		
						{type=19,value=8976},		
						{type=128,value=330},		
						{type=129,value=35560},		
					},			
						--飞升34级			
					{				
						{type=17,value=4476},		
						{type=19,value=9405},		
						{type=128,value=340},		
						{type=129,value=37520},		
					},			
						--飞升35级			
					{				
						{type=17,value=4680},		
						{type=19,value=9834},		
						{type=128,value=350},		
						{type=129,value=39480},		
					},			
						--飞升36级			
					{				
						{type=17,value=4884},		
						{type=19,value=10263},		
						{type=128,value=360},		
						{type=129,value=41440},		
					},			
						--飞升37级			
					{				
						{type=17,value=5088},		
						{type=19,value=10692},		
						{type=128,value=370},		
						{type=129,value=43400},		
					},			
						--飞升38级			
					{				
						{type=17,value=5292},		
						{type=19,value=11121},		
						{type=128,value=380},		
						{type=129,value=45360},		
					},			
						--飞升39级			
					{				
						{type=17,value=5496},		
						{type=19,value=11550},		
						{type=128,value=390},		
						{type=129,value=47320},		
					},			
						--飞升40级			
					{				
						{type=17,value=5700},		
						{type=19,value=11979},		
						{type=128,value=400},		
						{type=129,value=49280},		
					},			
						--飞升41级			
					{				
						{type=17,value=5904},		
						{type=19,value=12408},		
						{type=128,value=410},		
						{type=129,value=51240},		
					},			
						--飞升42级			
					{				
						{type=17,value=6108},		
						{type=19,value=12837},		
						{type=128,value=420},		
						{type=129,value=53200},		
					},			
						--飞升43级			
					{				
						{type=17,value=6312},		
						{type=19,value=13266},		
						{type=128,value=430},		
						{type=129,value=55160},		
					},			
						--飞升44级			
					{				
						{type=17,value=6516},		
						{type=19,value=13695},		
						{type=128,value=440},		
						{type=129,value=57120},		
					},			
						--飞升45级			
					{				
						{type=17,value=6720},		
						{type=19,value=14124},		
						{type=128,value=450},		
						{type=129,value=59080},		
					},			
						--飞升46级			
					{				
						{type=17,value=6924},		
						{type=19,value=14553},		
						{type=128,value=460},		
						{type=129,value=61040},		
					},			
						--飞升47级			
					{				
						{type=17,value=7128},		
						{type=19,value=14982},		
						{type=128,value=470},		
						{type=129,value=63000},		
					},			
						--飞升48级			
					{				
						{type=17,value=7332},		
						{type=19,value=15411},		
						{type=128,value=480},		
						{type=129,value=64960},		
					},			
						--飞升49级			
					{				
						{type=17,value=7536},		
						{type=19,value=15840},		
						{type=128,value=490},		
						{type=129,value=66920},		
					},			
						--飞升50级			
					{				
						{type=17,value=7740},		
						{type=19,value=16269},		
						{type=128,value=500},		
						{type=129,value=68880},		
					},
		    		
		    	},
			}	
			
		
		},
	
	
	
	}













}