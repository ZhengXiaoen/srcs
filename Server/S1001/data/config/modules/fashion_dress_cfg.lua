-- 时装
-- 时装等级表示： 
-- [0:1阶0星] [1:1阶1星] [2:1阶2星] [3:1阶3星] [4:1阶4星] [5:1阶5星] [6:1阶6星] [7:1阶7星] [8:1阶8星] [9:1阶9星] [10:1阶10星]
-- [11:2阶0星] [12:1阶1星] [13:1阶2星] [14:1阶3星] [15:1阶4星] [16:1阶5星] [17:1阶6星] [18:1阶7星] [19:1阶8星] [20:1阶9星] [21:1阶10星]
-- [22:3阶0星]

fashion_dress_cfg = {
	
	maxCountThreeKingdoms = 18, -- 三国时装最多能穿戴几件
	maxCountFootPrint = 12, -- 足迹最多能穿戴几件
	
	-- 时装列表
	dress_list = {
		
		-----------------------------时装 1  孙悟空
		{
			-- 战
			{
				itemId = 5947, --升阶所需道具
				
				inShowIds = {171,172,173,174,294,295,296,297,298}, -- 每阶一个内观
				outShowIds = {171,172,173,174,294,295,296,297,298}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 				
				upgradeItemId = 5951, -- 升星消耗的物品ID (0为限时时装，不可升级)
				
				-- 升级消耗的物品数量(限时时装可以不配)
				upgradeItemCounts = {1,8,8,8,8,8,8,8,8,8,8,4,20,20,20,20,20,20,20,20,20,20,8,40,40,40,40,40,40,40,40,40,40,16,80,80,80,80,80,80,80,80,80,80,
				28,120,120,120,120,120,120,120,120,120,120,42,160,160,160,160,160,160,160,160,160,160,58,200,200,200,200,200,200,200,200,200,200,76,240,240
				,240,240,240,240,240,240,240,240,96,280,280,280,280,280,280,280,280,280,280,},
				
					-- 模块
					-- -- (a1) 级
					-- {
					-- 	{type=(a2),value=(a3)},
			    	-- 	{type=(a4),value=(a5)},
					-- 	{type=(a6),value=(a7)},
					-- 	{type=(a8),value=(a9)},
					-- 	{type=(a10),value=(a11)},
					-- 	{type=(a12),value=(a13)},
					-- 	{type=(a14),value=(a15)},
					-- 	{type=(a16),value=(a17)},
					-- },

				
				-- 限时时装只配0级
				attrs = {
									-- 0 级
					{
						{type=5,value=4500},
			    		{type=7,value=455},
						{type=9,value=150},
						{type=11,value=315},
						{type=21,value=76},
						{type=23,value=126},
						{type=25,value=76},
						{type=27,value=126},
					},
					-- 1 级
					{
						{type=5,value=4725},
			    		{type=7,value=477},
						{type=9,value=155},
						{type=11,value=331},
						{type=21,value=80},
						{type=23,value=132},
						{type=25,value=80},
						{type=27,value=132},
					},
					-- 2 级
					{
						{type=5,value=4950},
			    		{type=7,value=499},
						{type=9,value=160},
						{type=11,value=347},
						{type=21,value=84},
						{type=23,value=138},
						{type=25,value=84},
						{type=27,value=138},
					},
					-- 3 级
					{
						{type=5,value=5175},
			    		{type=7,value=521},
						{type=9,value=165},
						{type=11,value=363},
						{type=21,value=88},
						{type=23,value=144},
						{type=25,value=88},
						{type=27,value=144},
					},
					-- 4 级
					{
						{type=5,value=5400},
			    		{type=7,value=543},
						{type=9,value=170},
						{type=11,value=379},
						{type=21,value=92},
						{type=23,value=150},
						{type=25,value=92},
						{type=27,value=150},
					},
					-- 5 级
					{
						{type=5,value=5625},
			    		{type=7,value=565},
						{type=9,value=175},
						{type=11,value=395},
						{type=21,value=96},
						{type=23,value=156},
						{type=25,value=96},
						{type=27,value=156},
					},
					-- 6 级
					{
						{type=5,value=5850},
			    		{type=7,value=587},
						{type=9,value=180},
						{type=11,value=411},
						{type=21,value=100},
						{type=23,value=162},
						{type=25,value=100},
						{type=27,value=162},
					},
					-- 7 级
					{
						{type=5,value=6075},
			    		{type=7,value=609},
						{type=9,value=185},
						{type=11,value=427},
						{type=21,value=104},
						{type=23,value=168},
						{type=25,value=104},
						{type=27,value=168},
					},
					-- 8 级
					{
						{type=5,value=6300},
			    		{type=7,value=631},
						{type=9,value=190},
						{type=11,value=443},
						{type=21,value=108},
						{type=23,value=174},
						{type=25,value=108},
						{type=27,value=174},
					},
					-- 9 级
					{
						{type=5,value=6525},
			    		{type=7,value=653},
						{type=9,value=195},
						{type=11,value=459},
						{type=21,value=112},
						{type=23,value=180},
						{type=25,value=112},
						{type=27,value=180},
					},
					-- 10 级
					{
						{type=5,value=6750},
			    		{type=7,value=675},
						{type=9,value=200},
						{type=11,value=475},
						{type=21,value=116},
						{type=23,value=186},
						{type=25,value=116},
						{type=27,value=186},
					},
					-- 11 级
					{
						{type=5,value=14750},
			    		{type=7,value=1483},
						{type=9,value=590},
						{type=11,value=1293},
						{type=21,value=312},
						{type=23,value=514},
						{type=25,value=312},
						{type=27,value=514},
					},
					-- 12 级
					{
						{type=5,value=15200},
			    		{type=7,value=1527},
						{type=9,value=600},
						{type=11,value=1318},
						{type=21,value=320},
						{type=23,value=526},
						{type=25,value=320},
						{type=27,value=526},
					},
					-- 13 级
					{
						{type=5,value=15650},
			    		{type=7,value=1571},
						{type=9,value=610},
						{type=11,value=1343},
						{type=21,value=328},
						{type=23,value=538},
						{type=25,value=328},
						{type=27,value=538},
					},
					-- 14 级
					{
						{type=5,value=16100},
			    		{type=7,value=1615},
						{type=9,value=620},
						{type=11,value=1368},
						{type=21,value=336},
						{type=23,value=550},
						{type=25,value=336},
						{type=27,value=550},
					},
					-- 15 级
					{
						{type=5,value=16550},
			    		{type=7,value=1659},
						{type=9,value=630},
						{type=11,value=1393},
						{type=21,value=344},
						{type=23,value=562},
						{type=25,value=344},
						{type=27,value=562},
					},
					-- 16 级
					{
						{type=5,value=17000},
			    		{type=7,value=1703},
						{type=9,value=640},
						{type=11,value=1418},
						{type=21,value=352},
						{type=23,value=574},
						{type=25,value=352},
						{type=27,value=574},
					},
					-- 17 级
					{
						{type=5,value=17450},
			    		{type=7,value=1747},
						{type=9,value=650},
						{type=11,value=1443},
						{type=21,value=360},
						{type=23,value=586},
						{type=25,value=360},
						{type=27,value=586},
					},
					-- 18 级
					{
						{type=5,value=17900},
			    		{type=7,value=1791},
						{type=9,value=660},
						{type=11,value=1468},
						{type=21,value=368},
						{type=23,value=598},
						{type=25,value=368},
						{type=27,value=598},
					},
					-- 19 级
					{
						{type=5,value=18350},
			    		{type=7,value=1835},
						{type=9,value=670},
						{type=11,value=1493},
						{type=21,value=376},
						{type=23,value=610},
						{type=25,value=376},
						{type=27,value=610},
					},
					-- 20 级
					{
						{type=5,value=18800},
			    		{type=7,value=1879},
						{type=9,value=680},
						{type=11,value=1518},
						{type=21,value=384},
						{type=23,value=622},
						{type=25,value=384},
						{type=27,value=622},
					},
					-- 21 级
					{
						{type=5,value=19250},
			    		{type=7,value=1923},
						{type=9,value=690},
						{type=11,value=1543},
						{type=21,value=392},
						{type=23,value=634},
						{type=25,value=392},
						{type=27,value=634},
					},
					-- 22 级
					{
						{type=5,value=32050},
			    		{type=7,value=3216},
						{type=9,value=1426},
						{type=11,value=3088},
						{type=21,value=762},
						{type=23,value=1252},
						{type=25,value=762},
						{type=27,value=1252},
					},
					-- 23 级
					{
						{type=5,value=32725},
			    		{type=7,value=3282},
						{type=9,value=1441},
						{type=11,value=3126},
						{type=21,value=774},
						{type=23,value=1270},
						{type=25,value=774},
						{type=27,value=1270},
					},
					-- 24 级
					{
						{type=5,value=33400},
			    		{type=7,value=3348},
						{type=9,value=1456},
						{type=11,value=3164},
						{type=21,value=786},
						{type=23,value=1288},
						{type=25,value=786},
						{type=27,value=1288},
					},
					-- 25 级
					{
						{type=5,value=34075},
			    		{type=7,value=3414},
						{type=9,value=1471},
						{type=11,value=3202},
						{type=21,value=798},
						{type=23,value=1306},
						{type=25,value=798},
						{type=27,value=1306},
					},
					-- 26 级
					{
						{type=5,value=34750},
			    		{type=7,value=3480},
						{type=9,value=1486},
						{type=11,value=3240},
						{type=21,value=810},
						{type=23,value=1324},
						{type=25,value=810},
						{type=27,value=1324},
					},
					-- 27 级
					{
						{type=5,value=35425},
			    		{type=7,value=3546},
						{type=9,value=1501},
						{type=11,value=3278},
						{type=21,value=822},
						{type=23,value=1342},
						{type=25,value=822},
						{type=27,value=1342},
					},
					-- 28 级
					{
						{type=5,value=36100},
			    		{type=7,value=3612},
						{type=9,value=1516},
						{type=11,value=3316},
						{type=21,value=834},
						{type=23,value=1360},
						{type=25,value=834},
						{type=27,value=1360},
					},
					-- 29 级
					{
						{type=5,value=36775},
			    		{type=7,value=3678},
						{type=9,value=1531},
						{type=11,value=3354},
						{type=21,value=846},
						{type=23,value=1378},
						{type=25,value=846},
						{type=27,value=1378},
					},
					-- 30 级
					{
						{type=5,value=37450},
			    		{type=7,value=3744},
						{type=9,value=1546},
						{type=11,value=3392},
						{type=21,value=858},
						{type=23,value=1396},
						{type=25,value=858},
						{type=27,value=1396},
					},
					-- 31 级
					{
						{type=5,value=38125},
			    		{type=7,value=3810},
						{type=9,value=1561},
						{type=11,value=3430},
						{type=21,value=870},
						{type=23,value=1414},
						{type=25,value=870},
						{type=27,value=1414},
					},
					-- 32 级
					{
						{type=5,value=38800},
			    		{type=7,value=3876},
						{type=9,value=1576},
						{type=11,value=3468},
						{type=21,value=882},
						{type=23,value=1432},
						{type=25,value=882},
						{type=27,value=1432},
					},
					-- 33 级
					{
						{type=5,value=58800},
			    		{type=7,value=5896},
						{type=9,value=2872},
						{type=11,value=6186},
						{type=21,value=1532},
						{type=23,value=2520},
						{type=25,value=1532},
						{type=27,value=2520},
					},
					-- 34 级
					{
						{type=5,value=59700},
			    		{type=7,value=5984},
						{type=9,value=2897},
						{type=11,value=6244},
						{type=21,value=1548},
						{type=23,value=2544},
						{type=25,value=1548},
						{type=27,value=2544},
					},
					-- 35 级
					{
						{type=5,value=60600},
			    		{type=7,value=6072},
						{type=9,value=2922},
						{type=11,value=6302},
						{type=21,value=1564},
						{type=23,value=2568},
						{type=25,value=1564},
						{type=27,value=2568},
					},
					-- 36 级
					{
						{type=5,value=61500},
			    		{type=7,value=6160},
						{type=9,value=2947},
						{type=11,value=6360},
						{type=21,value=1580},
						{type=23,value=2592},
						{type=25,value=1580},
						{type=27,value=2592},
					},
					-- 37 级
					{
						{type=5,value=62400},
			    		{type=7,value=6248},
						{type=9,value=2972},
						{type=11,value=6418},
						{type=21,value=1596},
						{type=23,value=2616},
						{type=25,value=1596},
						{type=27,value=2616},
					},
					-- 38 级
					{
						{type=5,value=63300},
			    		{type=7,value=6336},
						{type=9,value=2997},
						{type=11,value=6476},
						{type=21,value=1612},
						{type=23,value=2640},
						{type=25,value=1612},
						{type=27,value=2640},
					},
					-- 39 级
					{
						{type=5,value=64200},
			    		{type=7,value=6424},
						{type=9,value=3022},
						{type=11,value=6534},
						{type=21,value=1628},
						{type=23,value=2664},
						{type=25,value=1628},
						{type=27,value=2664},
					},
					-- 40 级
					{
						{type=5,value=65100},
			    		{type=7,value=6512},
						{type=9,value=3047},
						{type=11,value=6592},
						{type=21,value=1644},
						{type=23,value=2688},
						{type=25,value=1644},
						{type=27,value=2688},
					},
					-- 41 级
					{
						{type=5,value=66000},
			    		{type=7,value=6600},
						{type=9,value=3072},
						{type=11,value=6650},
						{type=21,value=1660},
						{type=23,value=2712},
						{type=25,value=1660},
						{type=27,value=2712},
					},
					-- 42 级
					{
						{type=5,value=66900},
			    		{type=7,value=6688},
						{type=9,value=3097},
						{type=11,value=6708},
						{type=21,value=1676},
						{type=23,value=2736},
						{type=25,value=1676},
						{type=27,value=2736},
					},
					-- 43 级
					{
						{type=5,value=67800},
			    		{type=7,value=6776},
						{type=9,value=3122},
						{type=11,value=6766},
						{type=21,value=1692},
						{type=23,value=2760},
						{type=25,value=1692},
						{type=27,value=2760},
					},


					
									-- 44 级
					{
						{type=5,value=97800},
			    		{type=7,value=9806},
						{type=9,value=5234},
						{type=11,value=11154},
						{type=21,value=2742},
						{type=23,value=4538},
						{type=25,value=2742},
						{type=27,value=4538},
					},
					-- 45 级
					{
						{type=5,value=98925},
			    		{type=7,value=9916},
						{type=9,value=5270},
						{type=11,value=11234},
						{type=21,value=2762},
						{type=23,value=4568},
						{type=25,value=2762},
						{type=27,value=4568},
					},
					-- 46 级
					{
						{type=5,value=100050},
			    		{type=7,value=10026},
						{type=9,value=5306},
						{type=11,value=11314},
						{type=21,value=2782},
						{type=23,value=4598},
						{type=25,value=2782},
						{type=27,value=4598},
					},
					-- 47 级
					{
						{type=5,value=101175},
			    		{type=7,value=10136},
						{type=9,value=5342},
						{type=11,value=11394},
						{type=21,value=2802},
						{type=23,value=4628},
						{type=25,value=2802},
						{type=27,value=4628},
					},
					-- 48 级
					{
						{type=5,value=102300},
			    		{type=7,value=10246},
						{type=9,value=5378},
						{type=11,value=11474},
						{type=21,value=2822},
						{type=23,value=4658},
						{type=25,value=2822},
						{type=27,value=4658},
					},
					-- 49 级
					{
						{type=5,value=103425},
			    		{type=7,value=10356},
						{type=9,value=5414},
						{type=11,value=11554},
						{type=21,value=2842},
						{type=23,value=4688},
						{type=25,value=2842},
						{type=27,value=4688},
					},
					-- 50 级
					{
						{type=5,value=104550},
			    		{type=7,value=10466},
						{type=9,value=5450},
						{type=11,value=11634},
						{type=21,value=2862},
						{type=23,value=4718},
						{type=25,value=2862},
						{type=27,value=4718},
					},
					-- 51 级
					{
						{type=5,value=105675},
			    		{type=7,value=10576},
						{type=9,value=5486},
						{type=11,value=11714},
						{type=21,value=2882},
						{type=23,value=4748},
						{type=25,value=2882},
						{type=27,value=4748},
					},
					-- 52 级
					{
						{type=5,value=106800},
			    		{type=7,value=10686},
						{type=9,value=5522},
						{type=11,value=11794},
						{type=21,value=2902},
						{type=23,value=4778},
						{type=25,value=2902},
						{type=27,value=4778},
					},
					-- 53 级
					{
						{type=5,value=107925},
			    		{type=7,value=10796},
						{type=9,value=5558},
						{type=11,value=11874},
						{type=21,value=2922},
						{type=23,value=4808},
						{type=25,value=2922},
						{type=27,value=4808},
					},
					-- 54 级
					{
						{type=5,value=109050},
			    		{type=7,value=10906},
						{type=9,value=5594},
						{type=11,value=11954},
						{type=21,value=2942},
						{type=23,value=4838},
						{type=25,value=2942},
						{type=27,value=4838},
					},
					-- 55 级
					{
						{type=5,value=152050},
			    		{type=7,value=15249},
						{type=9,value=8353},
						{type=11,value=18852},
						{type=21,value=4495},
						{type=23,value=7426},
						{type=25,value=4495},
						{type=27,value=7426},
					},
					-- 56 级
					{
						{type=5,value=153400},
			    		{type=7,value=15384},
						{type=9,value=8392},
						{type=11,value=18950},
						{type=21,value=4519},
						{type=23,value=7462},
						{type=25,value=4519},
						{type=27,value=7462},
					},
					-- 57 级
					{
						{type=5,value=154750},
			    		{type=7,value=15519},
						{type=9,value=8431},
						{type=11,value=19048},
						{type=21,value=4543},
						{type=23,value=7498},
						{type=25,value=4543},
						{type=27,value=7498},
					},
					-- 58 级
					{
						{type=5,value=156100},
			    		{type=7,value=15654},
						{type=9,value=8470},
						{type=11,value=19146},
						{type=21,value=4567},
						{type=23,value=7534},
						{type=25,value=4567},
						{type=27,value=7534},
					},
					-- 59 级
					{
						{type=5,value=157450},
			    		{type=7,value=15789},
						{type=9,value=8509},
						{type=11,value=19244},
						{type=21,value=4591},
						{type=23,value=7570},
						{type=25,value=4591},
						{type=27,value=7570},
					},
					-- 60 级
					{
						{type=5,value=158800},
			    		{type=7,value=15924},
						{type=9,value=8548},
						{type=11,value=19342},
						{type=21,value=4615},
						{type=23,value=7606},
						{type=25,value=4615},
						{type=27,value=7606},
					},
					-- 61 级
					{
						{type=5,value=160150},
			    		{type=7,value=16059},
						{type=9,value=8587},
						{type=11,value=19440},
						{type=21,value=4639},
						{type=23,value=7642},
						{type=25,value=4639},
						{type=27,value=7642},
					},
					-- 62 级
					{
						{type=5,value=161500},
			    		{type=7,value=16194},
						{type=9,value=8626},
						{type=11,value=19538},
						{type=21,value=4663},
						{type=23,value=7678},
						{type=25,value=4663},
						{type=27,value=7678},
					},
					-- 63 级
					{
						{type=5,value=162850},
			    		{type=7,value=16329},
						{type=9,value=8665},
						{type=11,value=19636},
						{type=21,value=4687},
						{type=23,value=7714},
						{type=25,value=4687},
						{type=27,value=7714},
					},
					-- 64 级
					{
						{type=5,value=164200},
			    		{type=7,value=16464},
						{type=9,value=8704},
						{type=11,value=19734},
						{type=21,value=4711},
						{type=23,value=7750},
						{type=25,value=4711},
						{type=27,value=7750},
					},
					-- 65 级
					{
						{type=5,value=165550},
			    		{type=7,value=16599},
						{type=9,value=8743},
						{type=11,value=19832},
						{type=21,value=4735},
						{type=23,value=7786},
						{type=25,value=4735},
						{type=27,value=7786},
					},
					-- 66 级
					{
						{type=5,value=223550},
			    		{type=7,value=22458},
						{type=9,value=12658},
						{type=11,value=29620},
						{type=21,value=6888},
						{type=23,value=11374},
						{type=25,value=6888},
						{type=27,value=11374},
					},
					-- 67 级
					{
						{type=5,value=225125},
			    		{type=7,value=22616},
						{type=9,value=12704},
						{type=11,value=29734},
						{type=21,value=6916},
						{type=23,value=11416},
						{type=25,value=6916},
						{type=27,value=11416},
					},
					-- 68 级
					{
						{type=5,value=226700},
			    		{type=7,value=22774},
						{type=9,value=12750},
						{type=11,value=29848},
						{type=21,value=6944},
						{type=23,value=11458},
						{type=25,value=6944},
						{type=27,value=11458},
					},
					-- 69 级
					{
						{type=5,value=228275},
			    		{type=7,value=22932},
						{type=9,value=12796},
						{type=11,value=29962},
						{type=21,value=6972},
						{type=23,value=11500},
						{type=25,value=6972},
						{type=27,value=11500},
					},
					-- 70 级
					{
						{type=5,value=229850},
			    		{type=7,value=23090},
						{type=9,value=12842},
						{type=11,value=30076},
						{type=21,value=7000},
						{type=23,value=11542},
						{type=25,value=7000},
						{type=27,value=11542},
					},
					-- 71 级
					{
						{type=5,value=231425},
			    		{type=7,value=23248},
						{type=9,value=12888},
						{type=11,value=30190},
						{type=21,value=7028},
						{type=23,value=11584},
						{type=25,value=7028},
						{type=27,value=11584},
					},
					-- 72 级
					{
						{type=5,value=233000},
			    		{type=7,value=23406},
						{type=9,value=12934},
						{type=11,value=30304},
						{type=21,value=7056},
						{type=23,value=11626},
						{type=25,value=7056},
						{type=27,value=11626},
					},
					-- 73 级
					{
						{type=5,value=234575},
			    		{type=7,value=23564},
						{type=9,value=12980},
						{type=11,value=30418},
						{type=21,value=7084},
						{type=23,value=11668},
						{type=25,value=7084},
						{type=27,value=11668},
					},
					-- 74 级
					{
						{type=5,value=236150},
			    		{type=7,value=23722},
						{type=9,value=13026},
						{type=11,value=30532},
						{type=21,value=7112},
						{type=23,value=11710},
						{type=25,value=7112},
						{type=27,value=11710},
					},
					-- 75 级
					{
						{type=5,value=237725},
			    		{type=7,value=23880},
						{type=9,value=13072},
						{type=11,value=30646},
						{type=21,value=7140},
						{type=23,value=11752},
						{type=25,value=7140},
						{type=27,value=11752},
					},
					-- 76 级
					{
						{type=5,value=239300},
			    		{type=7,value=24038},
						{type=9,value=13118},
						{type=11,value=30760},
						{type=21,value=7168},
						{type=23,value=11794},
						{type=25,value=7168},
						{type=27,value=11794},
					},
					-- 77 级
					{
						{type=5,value=314300},
			    		{type=7,value=31614},
						{type=9,value=18353},
						{type=11,value=43848},
						{type=21,value=10101},
						{type=23,value=16682},
						{type=25,value=10101},
						{type=27,value=16682},
					},
					-- 78 级
					{
						{type=5,value=316100},
			    		{type=7,value=31794},
						{type=9,value=18404},
						{type=11,value=43976},
						{type=21,value=10133},
						{type=23,value=16730},
						{type=25,value=10133},
						{type=27,value=16730},
					},
					-- 79 级
					{
						{type=5,value=317900},
			    		{type=7,value=31974},
						{type=9,value=18455},
						{type=11,value=44104},
						{type=21,value=10165},
						{type=23,value=16778},
						{type=25,value=10165},
						{type=27,value=16778},
					},
					-- 80 级
					{
						{type=5,value=319700},
			    		{type=7,value=32154},
						{type=9,value=18506},
						{type=11,value=44232},
						{type=21,value=10197},
						{type=23,value=16826},
						{type=25,value=10197},
						{type=27,value=16826},
					},
					-- 81 级
					{
						{type=5,value=321500},
			    		{type=7,value=32334},
						{type=9,value=18557},
						{type=11,value=44360},
						{type=21,value=10229},
						{type=23,value=16874},
						{type=25,value=10229},
						{type=27,value=16874},
					},
					-- 82 级
					{
						{type=5,value=323300},
			    		{type=7,value=32514},
						{type=9,value=18608},
						{type=11,value=44488},
						{type=21,value=10261},
						{type=23,value=16922},
						{type=25,value=10261},
						{type=27,value=16922},
					},
					-- 83 级
					{
						{type=5,value=325100},
			    		{type=7,value=32694},
						{type=9,value=18659},
						{type=11,value=44616},
						{type=21,value=10293},
						{type=23,value=16970},
						{type=25,value=10293},
						{type=27,value=16970},
					},
					-- 84 级
					{
						{type=5,value=326900},
			    		{type=7,value=32874},
						{type=9,value=18710},
						{type=11,value=44744},
						{type=21,value=10325},
						{type=23,value=17018},
						{type=25,value=10325},
						{type=27,value=17018},
					},
					-- 85 级
					{
						{type=5,value=328700},
			    		{type=7,value=33054},
						{type=9,value=18761},
						{type=11,value=44872},
						{type=21,value=10357},
						{type=23,value=17066},
						{type=25,value=10357},
						{type=27,value=17066},
					},
					-- 86 级
					{
						{type=5,value=330500},
			    		{type=7,value=33234},
						{type=9,value=18812},
						{type=11,value=45000},
						{type=21,value=10389},
						{type=23,value=17114},
						{type=25,value=10389},
						{type=27,value=17114},
					},
					-- 87 级
					{
						{type=5,value=332300},
			    		{type=7,value=33414},
						{type=9,value=18863},
						{type=11,value=45128},
						{type=21,value=10421},
						{type=23,value=17162},
						{type=25,value=10421},
						{type=27,value=17162},
					},
					-- 88 级
					{
						{type=5,value=427300},
			    		{type=7,value=43010},
						{type=9,value=25538},
						{type=11,value=61816},
						{type=21,value=14374},
						{type=23,value=23750},
						{type=25,value=14374},
						{type=27,value=23750},
					},
					-- 89 级
					{
						{type=5,value=429325},
			    		{type=7,value=43213},
						{type=9,value=25594},
						{type=11,value=61956},
						{type=21,value=14410},
						{type=23,value=23804},
						{type=25,value=14410},
						{type=27,value=23804},
					},
					-- 90 级
					{
						{type=5,value=431350},
			    		{type=7,value=43416},
						{type=9,value=25650},
						{type=11,value=62096},
						{type=21,value=14446},
						{type=23,value=23858},
						{type=25,value=14446},
						{type=27,value=23858},
					},
					-- 91 级
					{
						{type=5,value=433375},
			    		{type=7,value=43619},
						{type=9,value=25706},
						{type=11,value=62236},
						{type=21,value=14482},
						{type=23,value=23912},
						{type=25,value=14482},
						{type=27,value=23912},
					},
					-- 92 级
					{
						{type=5,value=435400},
			    		{type=7,value=43822},
						{type=9,value=25762},
						{type=11,value=62376},
						{type=21,value=14518},
						{type=23,value=23966},
						{type=25,value=14518},
						{type=27,value=23966},
					},
					-- 93 级
					{
						{type=5,value=437425},
			    		{type=7,value=44025},
						{type=9,value=25818},
						{type=11,value=62516},
						{type=21,value=14554},
						{type=23,value=24020},
						{type=25,value=14554},
						{type=27,value=24020},
					},
					-- 94 级
					{
						{type=5,value=439450},
			    		{type=7,value=44228},
						{type=9,value=25874},
						{type=11,value=62656},
						{type=21,value=14590},
						{type=23,value=24074},
						{type=25,value=14590},
						{type=27,value=24074},
					},
					-- 95 级
					{
						{type=5,value=441475},
			    		{type=7,value=44431},
						{type=9,value=25930},
						{type=11,value=62796},
						{type=21,value=14626},
						{type=23,value=24128},
						{type=25,value=14626},
						{type=27,value=24128},
					},
					-- 96 级
					{
						{type=5,value=443500},
			    		{type=7,value=44634},
						{type=9,value=25986},
						{type=11,value=62936},
						{type=21,value=14662},
						{type=23,value=24182},
						{type=25,value=14662},
						{type=27,value=24182},
					},
					-- 97 级
					{
						{type=5,value=445525},
			    		{type=7,value=44837},
						{type=9,value=26042},
						{type=11,value=63076},
						{type=21,value=14698},
						{type=23,value=24236},
						{type=25,value=14698},
						{type=27,value=24236},
					},
					-- 98 级
					{
						{type=5,value=447550},
			    		{type=7,value=45040},
						{type=9,value=26098},
						{type=11,value=63216},
						{type=21,value=14734},
						{type=23,value=24290},
						{type=25,value=14734},
						{type=27,value=24290},
					},





					
				},
			},
			-- 法
			{
				itemId = 5947,
				
				inShowIds = {171,172,173,174,294,295,296,297,298}, -- 每阶一个内观
				outShowIds = {171,172,173,174,294,295,296,297,298}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 5951, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,8,8,8,8,8,8,8,8,8,8,4,20,20,20,20,20,20,20,20,20,20,8,40,40,40,40,40,40,40,40,40,40,16,80,80,80,80,80,80,80,80,80,80,
				28,120,120,120,120,120,120,120,120,120,120,42,160,160,160,160,160,160,160,160,160,160,58,200,200,200,200,200,200,200,200,200,200,76,240,240
				,240,240,240,240,240,240,240,240,96,280,280,280,280,280,280,280,280,280,280,},
				
				
				attrs = {
										-- 0 级
					{
						{type=5,value=1157},
			    		{type=7,value=4628},
						{type=13,value=150},
						{type=15,value=315},
						{type=21,value=76},
						{type=23,value=126},
						{type=25,value=76},
						{type=27,value=126},
					},
					-- 1 级
					{
						{type=5,value=1215},
			    		{type=7,value=4858},
						{type=13,value=155},
						{type=15,value=331},
						{type=21,value=80},
						{type=23,value=132},
						{type=25,value=80},
						{type=27,value=132},
					},
					-- 2 级
					{
						{type=5,value=1273},
			    		{type=7,value=5088},
						{type=13,value=160},
						{type=15,value=347},
						{type=21,value=84},
						{type=23,value=138},
						{type=25,value=84},
						{type=27,value=138},
					},
					-- 3 级
					{
						{type=5,value=1331},
			    		{type=7,value=5318},
						{type=13,value=165},
						{type=15,value=363},
						{type=21,value=88},
						{type=23,value=144},
						{type=25,value=88},
						{type=27,value=144},
					},
					-- 4 级
					{
						{type=5,value=1389},
			    		{type=7,value=5548},
						{type=13,value=170},
						{type=15,value=379},
						{type=21,value=92},
						{type=23,value=150},
						{type=25,value=92},
						{type=27,value=150},
					},
					-- 5 级
					{
						{type=5,value=1447},
			    		{type=7,value=5778},
						{type=13,value=175},
						{type=15,value=395},
						{type=21,value=96},
						{type=23,value=156},
						{type=25,value=96},
						{type=27,value=156},
					},
					-- 6 级
					{
						{type=5,value=1505},
			    		{type=7,value=6008},
						{type=13,value=180},
						{type=15,value=411},
						{type=21,value=100},
						{type=23,value=162},
						{type=25,value=100},
						{type=27,value=162},
					},
					-- 7 级
					{
						{type=5,value=1563},
			    		{type=7,value=6238},
						{type=13,value=185},
						{type=15,value=427},
						{type=21,value=104},
						{type=23,value=168},
						{type=25,value=104},
						{type=27,value=168},
					},
					-- 8 级
					{
						{type=5,value=1621},
			    		{type=7,value=6468},
						{type=13,value=190},
						{type=15,value=443},
						{type=21,value=108},
						{type=23,value=174},
						{type=25,value=108},
						{type=27,value=174},
					},
					-- 9 级
					{
						{type=5,value=1679},
			    		{type=7,value=6698},
						{type=13,value=195},
						{type=15,value=459},
						{type=21,value=112},
						{type=23,value=180},
						{type=25,value=112},
						{type=27,value=180},
					},
					-- 10 级
					{
						{type=5,value=1737},
			    		{type=7,value=6928},
						{type=13,value=200},
						{type=15,value=475},
						{type=21,value=116},
						{type=23,value=186},
						{type=25,value=116},
						{type=27,value=186},
					},
					-- 11 级
					{
						{type=5,value=3794},
			    		{type=7,value=15156},
						{type=13,value=590},
						{type=15,value=1293},
						{type=21,value=312},
						{type=23,value=514},
						{type=25,value=312},
						{type=27,value=514},
					},
					-- 12 级
					{
						{type=5,value=3910},
			    		{type=7,value=15616},
						{type=13,value=600},
						{type=15,value=1318},
						{type=21,value=320},
						{type=23,value=526},
						{type=25,value=320},
						{type=27,value=526},
					},
					-- 13 级
					{
						{type=5,value=4026},
			    		{type=7,value=16076},
						{type=13,value=610},
						{type=15,value=1343},
						{type=21,value=328},
						{type=23,value=538},
						{type=25,value=328},
						{type=27,value=538},
					},
					-- 14 级
					{
						{type=5,value=4142},
			    		{type=7,value=16536},
						{type=13,value=620},
						{type=15,value=1368},
						{type=21,value=336},
						{type=23,value=550},
						{type=25,value=336},
						{type=27,value=550},
					},
					-- 15 级
					{
						{type=5,value=4258},
			    		{type=7,value=16996},
						{type=13,value=630},
						{type=15,value=1393},
						{type=21,value=344},
						{type=23,value=562},
						{type=25,value=344},
						{type=27,value=562},
					},
					-- 16 级
					{
						{type=5,value=4374},
			    		{type=7,value=17456},
						{type=13,value=640},
						{type=15,value=1418},
						{type=21,value=352},
						{type=23,value=574},
						{type=25,value=352},
						{type=27,value=574},
					},
					-- 17 级
					{
						{type=5,value=4490},
			    		{type=7,value=17916},
						{type=13,value=650},
						{type=15,value=1443},
						{type=21,value=360},
						{type=23,value=586},
						{type=25,value=360},
						{type=27,value=586},
					},
					-- 18 级
					{
						{type=5,value=4606},
			    		{type=7,value=18376},
						{type=13,value=660},
						{type=15,value=1468},
						{type=21,value=368},
						{type=23,value=598},
						{type=25,value=368},
						{type=27,value=598},
					},
					-- 19 级
					{
						{type=5,value=4722},
			    		{type=7,value=18836},
						{type=13,value=670},
						{type=15,value=1493},
						{type=21,value=376},
						{type=23,value=610},
						{type=25,value=376},
						{type=27,value=610},
					},
					-- 20 级
					{
						{type=5,value=4838},
			    		{type=7,value=19296},
						{type=13,value=680},
						{type=15,value=1518},
						{type=21,value=384},
						{type=23,value=622},
						{type=25,value=384},
						{type=27,value=622},
					},
					-- 21 级
					{
						{type=5,value=4954},
			    		{type=7,value=19756},
						{type=13,value=690},
						{type=15,value=1543},
						{type=21,value=392},
						{type=23,value=634},
						{type=25,value=392},
						{type=27,value=634},
					},
					-- 22 级
					{
						{type=5,value=8245},
			    		{type=7,value=32920},
						{type=13,value=1426},
						{type=15,value=3088},
						{type=21,value=762},
						{type=23,value=1252},
						{type=25,value=762},
						{type=27,value=1252},
					},
					-- 23 级
					{
						{type=5,value=8419},
			    		{type=7,value=33610},
						{type=13,value=1441},
						{type=15,value=3126},
						{type=21,value=774},
						{type=23,value=1270},
						{type=25,value=774},
						{type=27,value=1270},
					},
					-- 24 级
					{
						{type=5,value=8593},
			    		{type=7,value=34300},
						{type=13,value=1456},
						{type=15,value=3164},
						{type=21,value=786},
						{type=23,value=1288},
						{type=25,value=786},
						{type=27,value=1288},
					},
					-- 25 级
					{
						{type=5,value=8767},
			    		{type=7,value=34990},
						{type=13,value=1471},
						{type=15,value=3202},
						{type=21,value=798},
						{type=23,value=1306},
						{type=25,value=798},
						{type=27,value=1306},
					},
					-- 26 级
					{
						{type=5,value=8941},
			    		{type=7,value=35680},
						{type=13,value=1486},
						{type=15,value=3240},
						{type=21,value=810},
						{type=23,value=1324},
						{type=25,value=810},
						{type=27,value=1324},
					},
					-- 27 级
					{
						{type=5,value=9115},
			    		{type=7,value=36370},
						{type=13,value=1501},
						{type=15,value=3278},
						{type=21,value=822},
						{type=23,value=1342},
						{type=25,value=822},
						{type=27,value=1342},
					},
					-- 28 级
					{
						{type=5,value=9289},
			    		{type=7,value=37060},
						{type=13,value=1516},
						{type=15,value=3316},
						{type=21,value=834},
						{type=23,value=1360},
						{type=25,value=834},
						{type=27,value=1360},
					},
					-- 29 级
					{
						{type=5,value=9463},
			    		{type=7,value=37750},
						{type=13,value=1531},
						{type=15,value=3354},
						{type=21,value=846},
						{type=23,value=1378},
						{type=25,value=846},
						{type=27,value=1378},
					},
					-- 30 级
					{
						{type=5,value=9637},
			    		{type=7,value=38440},
						{type=13,value=1546},
						{type=15,value=3392},
						{type=21,value=858},
						{type=23,value=1396},
						{type=25,value=858},
						{type=27,value=1396},
					},
					-- 31 级
					{
						{type=5,value=9811},
			    		{type=7,value=39130},
						{type=13,value=1561},
						{type=15,value=3430},
						{type=21,value=870},
						{type=23,value=1414},
						{type=25,value=870},
						{type=27,value=1414},
					},
					-- 32 级
					{
						{type=5,value=9985},
			    		{type=7,value=39820},
						{type=13,value=1576},
						{type=15,value=3468},
						{type=21,value=882},
						{type=23,value=1432},
						{type=25,value=882},
						{type=27,value=1432},
					},
					-- 33 级
					{
						{type=5,value=15127},
			    		{type=7,value=60388},
						{type=13,value=2872},
						{type=15,value=6186},
						{type=21,value=1532},
						{type=23,value=2520},
						{type=25,value=1532},
						{type=27,value=2520},
					},
					-- 34 级
					{
						{type=5,value=15359},
			    		{type=7,value=61308},
						{type=13,value=2897},
						{type=15,value=6244},
						{type=21,value=1548},
						{type=23,value=2544},
						{type=25,value=1548},
						{type=27,value=2544},
					},
					-- 35 级
					{
						{type=5,value=15591},
			    		{type=7,value=62228},
						{type=13,value=2922},
						{type=15,value=6302},
						{type=21,value=1564},
						{type=23,value=2568},
						{type=25,value=1564},
						{type=27,value=2568},
					},
					-- 36 级
					{
						{type=5,value=15823},
			    		{type=7,value=63148},
						{type=13,value=2947},
						{type=15,value=6360},
						{type=21,value=1580},
						{type=23,value=2592},
						{type=25,value=1580},
						{type=27,value=2592},
					},
					-- 37 级
					{
						{type=5,value=16055},
			    		{type=7,value=64068},
						{type=13,value=2972},
						{type=15,value=6418},
						{type=21,value=1596},
						{type=23,value=2616},
						{type=25,value=1596},
						{type=27,value=2616},
					},
					-- 38 级
					{
						{type=5,value=16287},
			    		{type=7,value=64988},
						{type=13,value=2997},
						{type=15,value=6476},
						{type=21,value=1612},
						{type=23,value=2640},
						{type=25,value=1612},
						{type=27,value=2640},
					},
					-- 39 级
					{
						{type=5,value=16519},
			    		{type=7,value=65908},
						{type=13,value=3022},
						{type=15,value=6534},
						{type=21,value=1628},
						{type=23,value=2664},
						{type=25,value=1628},
						{type=27,value=2664},
					},
					-- 40 级
					{
						{type=5,value=16751},
			    		{type=7,value=66828},
						{type=13,value=3047},
						{type=15,value=6592},
						{type=21,value=1644},
						{type=23,value=2688},
						{type=25,value=1644},
						{type=27,value=2688},
					},
					-- 41 级
					{
						{type=5,value=16983},
			    		{type=7,value=67748},
						{type=13,value=3072},
						{type=15,value=6650},
						{type=21,value=1660},
						{type=23,value=2712},
						{type=25,value=1660},
						{type=27,value=2712},
					},
					-- 42 级
					{
						{type=5,value=17215},
			    		{type=7,value=68668},
						{type=13,value=3097},
						{type=15,value=6708},
						{type=21,value=1676},
						{type=23,value=2736},
						{type=25,value=1676},
						{type=27,value=2736},
					},
					-- 43 级
					{
						{type=5,value=17447},
			    		{type=7,value=69588},
						{type=13,value=3122},
						{type=15,value=6766},
						{type=21,value=1692},
						{type=23,value=2760},
						{type=25,value=1692},
						{type=27,value=2760},
					},

					

					
					-- 44 级
					{
						{type=5,value=25160},
			    		{type=7,value=100440},
						{type=13,value=5234},
						{type=15,value=11154},
						{type=21,value=2742},
						{type=23,value=4538},
						{type=25,value=2742},
						{type=27,value=4538},
					},

					-- 45 级
					{
						{type=5,value=25450},
			    		{type=7,value=101590},
						{type=13,value=5270},
						{type=15,value=11234},
						{type=21,value=2762},
						{type=23,value=4568},
						{type=25,value=2762},
						{type=27,value=4568},
					},

					-- 46 级
					{
						{type=5,value=25740},
			    		{type=7,value=102740},
						{type=13,value=5306},
						{type=15,value=11314},
						{type=21,value=2782},
						{type=23,value=4598},
						{type=25,value=2782},
						{type=27,value=4598},
					},

					-- 47 级
					{
						{type=5,value=26030},
			    		{type=7,value=103890},
						{type=13,value=5342},
						{type=15,value=11394},
						{type=21,value=2802},
						{type=23,value=4628},
						{type=25,value=2802},
						{type=27,value=4628},
					},

					-- 48 级
					{
						{type=5,value=26320},
			    		{type=7,value=105040},
						{type=13,value=5378},
						{type=15,value=11474},
						{type=21,value=2822},
						{type=23,value=4658},
						{type=25,value=2822},
						{type=27,value=4658},
					},

					-- 49 级
					{
						{type=5,value=26610},
			    		{type=7,value=106190},
						{type=13,value=5414},
						{type=15,value=11554},
						{type=21,value=2842},
						{type=23,value=4688},
						{type=25,value=2842},
						{type=27,value=4688},
					},

					-- 50 级
					{
						{type=5,value=26900},
			    		{type=7,value=107340},
						{type=13,value=5450},
						{type=15,value=11634},
						{type=21,value=2862},
						{type=23,value=4718},
						{type=25,value=2862},
						{type=27,value=4718},
					},

					-- 51 级
					{
						{type=5,value=27190},
			    		{type=7,value=108490},
						{type=13,value=5486},
						{type=15,value=11714},
						{type=21,value=2882},
						{type=23,value=4748},
						{type=25,value=2882},
						{type=27,value=4748},
					},

					-- 52 级
					{
						{type=5,value=27480},
			    		{type=7,value=109640},
						{type=13,value=5522},
						{type=15,value=11794},
						{type=21,value=2902},
						{type=23,value=4778},
						{type=25,value=2902},
						{type=27,value=4778},
					},

					-- 53 级
					{
						{type=5,value=27770},
			    		{type=7,value=110790},
						{type=13,value=5558},
						{type=15,value=11874},
						{type=21,value=2922},
						{type=23,value=4808},
						{type=25,value=2922},
						{type=27,value=4808},
					},

					-- 54 级
					{
						{type=5,value=28060},
			    		{type=7,value=111940},
						{type=13,value=5594},
						{type=15,value=11954},
						{type=21,value=2942},
						{type=23,value=4838},
						{type=25,value=2942},
						{type=27,value=4838},
					},

					-- 55 级
					{
						{type=5,value=39114},
			    		{type=7,value=156156},
						{type=13,value=8353},
						{type=15,value=18852},
						{type=21,value=4495},
						{type=23,value=7426},
						{type=25,value=4495},
						{type=27,value=7426},
					},

					-- 56 级
					{
						{type=5,value=39462},
			    		{type=7,value=157536},
						{type=13,value=8392},
						{type=15,value=18950},
						{type=21,value=4519},
						{type=23,value=7462},
						{type=25,value=4519},
						{type=27,value=7462},
					},

					-- 57 级
					{
						{type=5,value=39810},
			    		{type=7,value=158916},
						{type=13,value=8431},
						{type=15,value=19048},
						{type=21,value=4543},
						{type=23,value=7498},
						{type=25,value=4543},
						{type=27,value=7498},
					},

					-- 58 级
					{
						{type=5,value=40158},
			    		{type=7,value=160296},
						{type=13,value=8470},
						{type=15,value=19146},
						{type=21,value=4567},
						{type=23,value=7534},
						{type=25,value=4567},
						{type=27,value=7534},
					},

					-- 59 级
					{
						{type=5,value=40506},
			    		{type=7,value=161676},
						{type=13,value=8509},
						{type=15,value=19244},
						{type=21,value=4591},
						{type=23,value=7570},
						{type=25,value=4591},
						{type=27,value=7570},
					},

					-- 60 级
					{
						{type=5,value=40854},
			    		{type=7,value=163056},
						{type=13,value=8548},
						{type=15,value=19342},
						{type=21,value=4615},
						{type=23,value=7606},
						{type=25,value=4615},
						{type=27,value=7606},
					},

					-- 61 级
					{
						{type=5,value=41202},
			    		{type=7,value=164436},
						{type=13,value=8587},
						{type=15,value=19440},
						{type=21,value=4639},
						{type=23,value=7642},
						{type=25,value=4639},
						{type=27,value=7642},
					},

					-- 62 级
					{
						{type=5,value=41550},
			    		{type=7,value=165816},
						{type=13,value=8626},
						{type=15,value=19538},
						{type=21,value=4663},
						{type=23,value=7678},
						{type=25,value=4663},
						{type=27,value=7678},
					},

					-- 63 级
					{
						{type=5,value=41898},
			    		{type=7,value=167196},
						{type=13,value=8665},
						{type=15,value=19636},
						{type=21,value=4687},
						{type=23,value=7714},
						{type=25,value=4687},
						{type=27,value=7714},
					},

					-- 64 级
					{
						{type=5,value=42246},
			    		{type=7,value=168576},
						{type=13,value=8704},
						{type=15,value=19734},
						{type=21,value=4711},
						{type=23,value=7750},
						{type=25,value=4711},
						{type=27,value=7750},
					},

					-- 65 级
					{
						{type=5,value=42594},
			    		{type=7,value=169956},
						{type=13,value=8743},
						{type=15,value=19832},
						{type=21,value=4735},
						{type=23,value=7786},
						{type=25,value=4735},
						{type=27,value=7786},
					},

					-- 66 级
					{
						{type=5,value=57505},
			    		{type=7,value=229600},
						{type=13,value=12658},
						{type=15,value=29620},
						{type=21,value=6888},
						{type=23,value=11374},
						{type=25,value=6888},
						{type=27,value=11374},
					},

					-- 67 级
					{
						{type=5,value=57911},
			    		{type=7,value=231210},
						{type=13,value=12704},
						{type=15,value=29734},
						{type=21,value=6916},
						{type=23,value=11416},
						{type=25,value=6916},
						{type=27,value=11416},
					},

					-- 68 级
					{
						{type=5,value=58317},
			    		{type=7,value=232820},
						{type=13,value=12750},
						{type=15,value=29848},
						{type=21,value=6944},
						{type=23,value=11458},
						{type=25,value=6944},
						{type=27,value=11458},
					},

					-- 69 级
					{
						{type=5,value=58723},
			    		{type=7,value=234430},
						{type=13,value=12796},
						{type=15,value=29962},
						{type=21,value=6972},
						{type=23,value=11500},
						{type=25,value=6972},
						{type=27,value=11500},
					},

					-- 70 级
					{
						{type=5,value=59129},
			    		{type=7,value=236040},
						{type=13,value=12842},
						{type=15,value=30076},
						{type=21,value=7000},
						{type=23,value=11542},
						{type=25,value=7000},
						{type=27,value=11542},
					},

					-- 71 级
					{
						{type=5,value=59535},
			    		{type=7,value=237650},
						{type=13,value=12888},
						{type=15,value=30190},
						{type=21,value=7028},
						{type=23,value=11584},
						{type=25,value=7028},
						{type=27,value=11584},
					},

					-- 72 级
					{
						{type=5,value=59941},
			    		{type=7,value=239260},
						{type=13,value=12934},
						{type=15,value=30304},
						{type=21,value=7056},
						{type=23,value=11626},
						{type=25,value=7056},
						{type=27,value=11626},
					},

					-- 73 级
					{
						{type=5,value=60347},
			    		{type=7,value=240870},
						{type=13,value=12980},
						{type=15,value=30418},
						{type=21,value=7084},
						{type=23,value=11668},
						{type=25,value=7084},
						{type=27,value=11668},
					},

					-- 74 级
					{
						{type=5,value=60753},
			    		{type=7,value=242480},
						{type=13,value=13026},
						{type=15,value=30532},
						{type=21,value=7112},
						{type=23,value=11710},
						{type=25,value=7112},
						{type=27,value=11710},
					},

					-- 75 级
					{
						{type=5,value=61159},
			    		{type=7,value=244090},
						{type=13,value=13072},
						{type=15,value=30646},
						{type=21,value=7140},
						{type=23,value=11752},
						{type=25,value=7140},
						{type=27,value=11752},
					},

					-- 76 级
					{
						{type=5,value=61565},
			    		{type=7,value=245700},
						{type=13,value=13118},
						{type=15,value=30760},
						{type=21,value=7168},
						{type=23,value=11794},
						{type=25,value=7168},
						{type=27,value=11794},
					},

					-- 77 级
					{
						{type=5,value=80846},
			    		{type=7,value=322824},
						{type=13,value=18353},
						{type=15,value=43848},
						{type=21,value=10101},
						{type=23,value=16682},
						{type=25,value=10101},
						{type=27,value=16682},
					},

					-- 78 级
					{
						{type=5,value=81310},
			    		{type=7,value=324664},
						{type=13,value=18404},
						{type=15,value=43976},
						{type=21,value=10133},
						{type=23,value=16730},
						{type=25,value=10133},
						{type=27,value=16730},
					},

					-- 79 级
					{
						{type=5,value=81774},
			    		{type=7,value=326504},
						{type=13,value=18455},
						{type=15,value=44104},
						{type=21,value=10165},
						{type=23,value=16778},
						{type=25,value=10165},
						{type=27,value=16778},
					},

					-- 80 级
					{
						{type=5,value=82238},
			    		{type=7,value=328344},
						{type=13,value=18506},
						{type=15,value=44232},
						{type=21,value=10197},
						{type=23,value=16826},
						{type=25,value=10197},
						{type=27,value=16826},
					},

					-- 81 级
					{
						{type=5,value=82702},
			    		{type=7,value=330184},
						{type=13,value=18557},
						{type=15,value=44360},
						{type=21,value=10229},
						{type=23,value=16874},
						{type=25,value=10229},
						{type=27,value=16874},
					},

					-- 82 级
					{
						{type=5,value=83166},
			    		{type=7,value=332024},
						{type=13,value=18608},
						{type=15,value=44488},
						{type=21,value=10261},
						{type=23,value=16922},
						{type=25,value=10261},
						{type=27,value=16922},
					},

					-- 83 级
					{
						{type=5,value=83630},
			    		{type=7,value=333864},
						{type=13,value=18659},
						{type=15,value=44616},
						{type=21,value=10293},
						{type=23,value=16970},
						{type=25,value=10293},
						{type=27,value=16970},
					},

					-- 84 级
					{
						{type=5,value=84094},
			    		{type=7,value=335704},
						{type=13,value=18710},
						{type=15,value=44744},
						{type=21,value=10325},
						{type=23,value=17018},
						{type=25,value=10325},
						{type=27,value=17018},
					},

					-- 85 级
					{
						{type=5,value=84558},
			    		{type=7,value=337544},
						{type=13,value=18761},
						{type=15,value=44872},
						{type=21,value=10357},
						{type=23,value=17066},
						{type=25,value=10357},
						{type=27,value=17066},
					},

					-- 86 级
					{
						{type=5,value=85022},
			    		{type=7,value=339384},
						{type=13,value=18812},
						{type=15,value=45000},
						{type=21,value=10389},
						{type=23,value=17114},
						{type=25,value=10389},
						{type=27,value=17114},
					},

					-- 87 级
					{
						{type=5,value=85486},
			    		{type=7,value=341224},
						{type=13,value=18863},
						{type=15,value=45128},
						{type=21,value=10421},
						{type=23,value=17162},
						{type=25,value=10421},
						{type=27,value=17162},
					},

					-- 88 级
					{
						{type=5,value=109908},
			    		{type=7,value=438912},
						{type=13,value=25538},
						{type=15,value=61816},
						{type=21,value=14374},
						{type=23,value=23750},
						{type=25,value=14374},
						{type=27,value=23750},
					},

					-- 89 级
					{
						{type=5,value=110430},
			    		{type=7,value=440982},
						{type=13,value=25594},
						{type=15,value=61956},
						{type=21,value=14410},
						{type=23,value=23804},
						{type=25,value=14410},
						{type=27,value=23804},
					},

					-- 90 级
					{
						{type=5,value=110952},
			    		{type=7,value=443052},
						{type=13,value=25650},
						{type=15,value=62096},
						{type=21,value=14446},
						{type=23,value=23858},
						{type=25,value=14446},
						{type=27,value=23858},
					},

					-- 91 级
					{
						{type=5,value=111474},
			    		{type=7,value=445122},
						{type=13,value=25706},
						{type=15,value=62236},
						{type=21,value=14482},
						{type=23,value=23912},
						{type=25,value=14482},
						{type=27,value=23912},
					},

					-- 92 级
					{
						{type=5,value=111996},
			    		{type=7,value=447192},
						{type=13,value=25762},
						{type=15,value=62376},
						{type=21,value=14518},
						{type=23,value=23966},
						{type=25,value=14518},
						{type=27,value=23966},
					},

					-- 93 级
					{
						{type=5,value=112518},
			    		{type=7,value=449262},
						{type=13,value=25818},
						{type=15,value=62516},
						{type=21,value=14554},
						{type=23,value=24020},
						{type=25,value=14554},
						{type=27,value=24020},
					},

					-- 94 级
					{
						{type=5,value=113040},
			    		{type=7,value=451332},
						{type=13,value=25874},
						{type=15,value=62656},
						{type=21,value=14590},
						{type=23,value=24074},
						{type=25,value=14590},
						{type=27,value=24074},
					},

					-- 95 级
					{
						{type=5,value=113562},
			    		{type=7,value=453402},
						{type=13,value=25930},
						{type=15,value=62796},
						{type=21,value=14626},
						{type=23,value=24128},
						{type=25,value=14626},
						{type=27,value=24128},
					},

					-- 96 级
					{
						{type=5,value=114084},
			    		{type=7,value=455472},
						{type=13,value=25986},
						{type=15,value=62936},
						{type=21,value=14662},
						{type=23,value=24182},
						{type=25,value=14662},
						{type=27,value=24182},
					},

					-- 97 级
					{
						{type=5,value=114606},
			    		{type=7,value=457542},
						{type=13,value=26042},
						{type=15,value=63076},
						{type=21,value=14698},
						{type=23,value=24236},
						{type=25,value=14698},
						{type=27,value=24236},
					},

					-- 98 级
					{
						{type=5,value=115128},
			    		{type=7,value=459612},
						{type=13,value=26098},
						{type=15,value=63216},
						{type=21,value=14734},
						{type=23,value=24290},
						{type=25,value=14734},
						{type=27,value=24290},
					},



					
				},
			},
			-- 道
			{
				itemId = 5947,
				
				inShowIds = {171,172,173,174,294,295,296,297,298}, -- 每阶一个内观
				outShowIds = {171,172,173,174,294,295,296,297,298}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 5951, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,8,8,8,8,8,8,8,8,8,8,4,20,20,20,20,20,20,20,20,20,20,8,40,40,40,40,40,40,40,40,40,40,16,80,80,80,80,80,80,80,80,80,80,
				28,120,120,120,120,120,120,120,120,120,120,42,160,160,160,160,160,160,160,160,160,160,58,200,200,200,200,200,200,200,200,200,200,76,240,240
				,240,240,240,240,240,240,240,240,96,280,280,280,280,280,280,280,280,280,280,},
				
				attrs = {
										-- 0 级
					{
						{type=5,value=2514},
			    		{type=7,value=2514},
						{type=17,value=150},
						{type=19,value=315},
						{type=21,value=76},
						{type=23,value=126},
						{type=25,value=76},
						{type=27,value=126},
					},
					-- 1 级
					{
						{type=5,value=2640},
			    		{type=7,value=2640},
						{type=17,value=155},
						{type=19,value=331},
						{type=21,value=80},
						{type=23,value=132},
						{type=25,value=80},
						{type=27,value=132},
					},
					-- 2 级
					{
						{type=5,value=2766},
			    		{type=7,value=2766},
						{type=17,value=160},
						{type=19,value=347},
						{type=21,value=84},
						{type=23,value=138},
						{type=25,value=84},
						{type=27,value=138},
					},
					-- 3 级
					{
						{type=5,value=2892},
			    		{type=7,value=2892},
						{type=17,value=165},
						{type=19,value=363},
						{type=21,value=88},
						{type=23,value=144},
						{type=25,value=88},
						{type=27,value=144},
					},
					-- 4 级
					{
						{type=5,value=3018},
			    		{type=7,value=3018},
						{type=17,value=170},
						{type=19,value=379},
						{type=21,value=92},
						{type=23,value=150},
						{type=25,value=92},
						{type=27,value=150},
					},
					-- 5 级
					{
						{type=5,value=3144},
			    		{type=7,value=3144},
						{type=17,value=175},
						{type=19,value=395},
						{type=21,value=96},
						{type=23,value=156},
						{type=25,value=96},
						{type=27,value=156},
					},
					-- 6 级
					{
						{type=5,value=3270},
			    		{type=7,value=3270},
						{type=17,value=180},
						{type=19,value=411},
						{type=21,value=100},
						{type=23,value=162},
						{type=25,value=100},
						{type=27,value=162},
					},
					-- 7 级
					{
						{type=5,value=3396},
			    		{type=7,value=3396},
						{type=17,value=185},
						{type=19,value=427},
						{type=21,value=104},
						{type=23,value=168},
						{type=25,value=104},
						{type=27,value=168},
					},
					-- 8 级
					{
						{type=5,value=3522},
			    		{type=7,value=3522},
						{type=17,value=190},
						{type=19,value=443},
						{type=21,value=108},
						{type=23,value=174},
						{type=25,value=108},
						{type=27,value=174},
					},
					-- 9 级
					{
						{type=5,value=3648},
			    		{type=7,value=3648},
						{type=17,value=195},
						{type=19,value=459},
						{type=21,value=112},
						{type=23,value=180},
						{type=25,value=112},
						{type=27,value=180},
					},
					-- 10 级
					{
						{type=5,value=3774},
			    		{type=7,value=3774},
						{type=17,value=200},
						{type=19,value=475},
						{type=21,value=116},
						{type=23,value=186},
						{type=25,value=116},
						{type=27,value=186},
					},
					-- 11 级
					{
						{type=5,value=8244},
			    		{type=7,value=8244},
						{type=17,value=590},
						{type=19,value=1293},
						{type=21,value=312},
						{type=23,value=514},
						{type=25,value=312},
						{type=27,value=514},
					},
					-- 12 级
					{
						{type=5,value=8496},
			    		{type=7,value=8496},
						{type=17,value=600},
						{type=19,value=1318},
						{type=21,value=320},
						{type=23,value=526},
						{type=25,value=320},
						{type=27,value=526},
					},
					-- 13 级
					{
						{type=5,value=8748},
			    		{type=7,value=8748},
						{type=17,value=610},
						{type=19,value=1343},
						{type=21,value=328},
						{type=23,value=538},
						{type=25,value=328},
						{type=27,value=538},
					},
					-- 14 级
					{
						{type=5,value=9000},
			    		{type=7,value=9000},
						{type=17,value=620},
						{type=19,value=1368},
						{type=21,value=336},
						{type=23,value=550},
						{type=25,value=336},
						{type=27,value=550},
					},
					-- 15 级
					{
						{type=5,value=9252},
			    		{type=7,value=9252},
						{type=17,value=630},
						{type=19,value=1393},
						{type=21,value=344},
						{type=23,value=562},
						{type=25,value=344},
						{type=27,value=562},
					},
					-- 16 级
					{
						{type=5,value=9504},
			    		{type=7,value=9504},
						{type=17,value=640},
						{type=19,value=1418},
						{type=21,value=352},
						{type=23,value=574},
						{type=25,value=352},
						{type=27,value=574},
					},
					-- 17 级
					{
						{type=5,value=9756},
			    		{type=7,value=9756},
						{type=17,value=650},
						{type=19,value=1443},
						{type=21,value=360},
						{type=23,value=586},
						{type=25,value=360},
						{type=27,value=586},
					},
					-- 18 级
					{
						{type=5,value=10008},
			    		{type=7,value=10008},
						{type=17,value=660},
						{type=19,value=1468},
						{type=21,value=368},
						{type=23,value=598},
						{type=25,value=368},
						{type=27,value=598},
					},
					-- 19 级
					{
						{type=5,value=10260},
			    		{type=7,value=10260},
						{type=17,value=670},
						{type=19,value=1493},
						{type=21,value=376},
						{type=23,value=610},
						{type=25,value=376},
						{type=27,value=610},
					},
					-- 20 级
					{
						{type=5,value=10512},
			    		{type=7,value=10512},
						{type=17,value=680},
						{type=19,value=1518},
						{type=21,value=384},
						{type=23,value=622},
						{type=25,value=384},
						{type=27,value=622},
					},
					-- 21 级
					{
						{type=5,value=10764},
			    		{type=7,value=10764},
						{type=17,value=690},
						{type=19,value=1543},
						{type=21,value=392},
						{type=23,value=634},
						{type=25,value=392},
						{type=27,value=634},
					},
					-- 22 级
					{
						{type=5,value=17915},
			    		{type=7,value=17915},
						{type=17,value=1426},
						{type=19,value=3088},
						{type=21,value=762},
						{type=23,value=1252},
						{type=25,value=762},
						{type=27,value=1252},
					},
					-- 23 级
					{
						{type=5,value=18293},
			    		{type=7,value=18293},
						{type=17,value=1441},
						{type=19,value=3126},
						{type=21,value=774},
						{type=23,value=1270},
						{type=25,value=774},
						{type=27,value=1270},
					},
					-- 24 级
					{
						{type=5,value=18671},
			    		{type=7,value=18671},
						{type=17,value=1456},
						{type=19,value=3164},
						{type=21,value=786},
						{type=23,value=1288},
						{type=25,value=786},
						{type=27,value=1288},
					},
					-- 25 级
					{
						{type=5,value=19049},
			    		{type=7,value=19049},
						{type=17,value=1471},
						{type=19,value=3202},
						{type=21,value=798},
						{type=23,value=1306},
						{type=25,value=798},
						{type=27,value=1306},
					},
					-- 26 级
					{
						{type=5,value=19427},
			    		{type=7,value=19427},
						{type=17,value=1486},
						{type=19,value=3240},
						{type=21,value=810},
						{type=23,value=1324},
						{type=25,value=810},
						{type=27,value=1324},
					},
					-- 27 级
					{
						{type=5,value=19805},
			    		{type=7,value=19805},
						{type=17,value=1501},
						{type=19,value=3278},
						{type=21,value=822},
						{type=23,value=1342},
						{type=25,value=822},
						{type=27,value=1342},
					},
					-- 28 级
					{
						{type=5,value=20183},
			    		{type=7,value=20183},
						{type=17,value=1516},
						{type=19,value=3316},
						{type=21,value=834},
						{type=23,value=1360},
						{type=25,value=834},
						{type=27,value=1360},
					},
					-- 29 级
					{
						{type=5,value=20561},
			    		{type=7,value=20561},
						{type=17,value=1531},
						{type=19,value=3354},
						{type=21,value=846},
						{type=23,value=1378},
						{type=25,value=846},
						{type=27,value=1378},
					},
					-- 30 级
					{
						{type=5,value=20939},
			    		{type=7,value=20939},
						{type=17,value=1546},
						{type=19,value=3392},
						{type=21,value=858},
						{type=23,value=1396},
						{type=25,value=858},
						{type=27,value=1396},
					},
					-- 31 级
					{
						{type=5,value=21317},
			    		{type=7,value=21317},
						{type=17,value=1561},
						{type=19,value=3430},
						{type=21,value=870},
						{type=23,value=1414},
						{type=25,value=870},
						{type=27,value=1414},
					},
					-- 32 级
					{
						{type=5,value=21695},
			    		{type=7,value=21695},
						{type=17,value=1576},
						{type=19,value=3468},
						{type=21,value=882},
						{type=23,value=1432},
						{type=25,value=882},
						{type=27,value=1432},
					},
					-- 33 级
					{
						{type=5,value=32869},
			    		{type=7,value=32869},
						{type=17,value=2872},
						{type=19,value=6186},
						{type=21,value=1532},
						{type=23,value=2520},
						{type=25,value=1532},
						{type=27,value=2520},
					},
					-- 34 级
					{
						{type=5,value=33373},
			    		{type=7,value=33373},
						{type=17,value=2897},
						{type=19,value=6244},
						{type=21,value=1548},
						{type=23,value=2544},
						{type=25,value=1548},
						{type=27,value=2544},
					},
					-- 35 级
					{
						{type=5,value=33877},
			    		{type=7,value=33877},
						{type=17,value=2922},
						{type=19,value=6302},
						{type=21,value=1564},
						{type=23,value=2568},
						{type=25,value=1564},
						{type=27,value=2568},
					},
					-- 36 级
					{
						{type=5,value=34381},
			    		{type=7,value=34381},
						{type=17,value=2947},
						{type=19,value=6360},
						{type=21,value=1580},
						{type=23,value=2592},
						{type=25,value=1580},
						{type=27,value=2592},
					},
					-- 37 级
					{
						{type=5,value=34885},
			    		{type=7,value=34885},
						{type=17,value=2972},
						{type=19,value=6418},
						{type=21,value=1596},
						{type=23,value=2616},
						{type=25,value=1596},
						{type=27,value=2616},
					},
					-- 38 级
					{
						{type=5,value=35389},
			    		{type=7,value=35389},
						{type=17,value=2997},
						{type=19,value=6476},
						{type=21,value=1612},
						{type=23,value=2640},
						{type=25,value=1612},
						{type=27,value=2640},
					},
					-- 39 级
					{
						{type=5,value=35893},
			    		{type=7,value=35893},
						{type=17,value=3022},
						{type=19,value=6534},
						{type=21,value=1628},
						{type=23,value=2664},
						{type=25,value=1628},
						{type=27,value=2664},
					},
					-- 40 级
					{
						{type=5,value=36397},
			    		{type=7,value=36397},
						{type=17,value=3047},
						{type=19,value=6592},
						{type=21,value=1644},
						{type=23,value=2688},
						{type=25,value=1644},
						{type=27,value=2688},
					},
					-- 41 级
					{
						{type=5,value=36901},
			    		{type=7,value=36901},
						{type=17,value=3072},
						{type=19,value=6650},
						{type=21,value=1660},
						{type=23,value=2712},
						{type=25,value=1660},
						{type=27,value=2712},
					},
					-- 42 级
					{
						{type=5,value=37405},
			    		{type=7,value=37405},
						{type=17,value=3097},
						{type=19,value=6708},
						{type=21,value=1676},
						{type=23,value=2736},
						{type=25,value=1676},
						{type=27,value=2736},
					},
					-- 43 级
					{
						{type=5,value=37909},
			    		{type=7,value=37909},
						{type=17,value=3122},
						{type=19,value=6766},
						{type=21,value=1692},
						{type=23,value=2760},
						{type=25,value=1692},
						{type=27,value=2760},
					},

					
					-- 44 级
					{
						{type=5,value=54669},
			    		{type=7,value=54669},
						{type=17,value=5234},
						{type=19,value=11154},
						{type=21,value=2742},
						{type=23,value=4538},
						{type=25,value=2742},
						{type=27,value=4538},
					},

					-- 45 级
					{
						{type=5,value=55299},
			    		{type=7,value=55299},
						{type=17,value=5270},
						{type=19,value=11234},
						{type=21,value=2762},
						{type=23,value=4568},
						{type=25,value=2762},
						{type=27,value=4568},
					},

					-- 46 级
					{
						{type=5,value=55929},
			    		{type=7,value=55929},
						{type=17,value=5306},
						{type=19,value=11314},
						{type=21,value=2782},
						{type=23,value=4598},
						{type=25,value=2782},
						{type=27,value=4598},
					},

					-- 47 级
					{
						{type=5,value=56559},
			    		{type=7,value=56559},
						{type=17,value=5342},
						{type=19,value=11394},
						{type=21,value=2802},
						{type=23,value=4628},
						{type=25,value=2802},
						{type=27,value=4628},
					},

					-- 48 级
					{
						{type=5,value=57189},
			    		{type=7,value=57189},
						{type=17,value=5378},
						{type=19,value=11474},
						{type=21,value=2822},
						{type=23,value=4658},
						{type=25,value=2822},
						{type=27,value=4658},
					},

					-- 49 级
					{
						{type=5,value=57819},
			    		{type=7,value=57819},
						{type=17,value=5414},
						{type=19,value=11554},
						{type=21,value=2842},
						{type=23,value=4688},
						{type=25,value=2842},
						{type=27,value=4688},
					},

					-- 50 级
					{
						{type=5,value=58449},
			    		{type=7,value=58449},
						{type=17,value=5450},
						{type=19,value=11634},
						{type=21,value=2862},
						{type=23,value=4718},
						{type=25,value=2862},
						{type=27,value=4718},
					},

					-- 51 级
					{
						{type=5,value=59079},
			    		{type=7,value=59079},
						{type=17,value=5486},
						{type=19,value=11714},
						{type=21,value=2882},
						{type=23,value=4748},
						{type=25,value=2882},
						{type=27,value=4748},
					},

					-- 52 级
					{
						{type=5,value=59709},
			    		{type=7,value=59709},
						{type=17,value=5522},
						{type=19,value=11794},
						{type=21,value=2902},
						{type=23,value=4778},
						{type=25,value=2902},
						{type=27,value=4778},
					},

					-- 53 级
					{
						{type=5,value=60339},
			    		{type=7,value=60339},
						{type=17,value=5558},
						{type=19,value=11874},
						{type=21,value=2922},
						{type=23,value=4808},
						{type=25,value=2922},
						{type=27,value=4808},
					},

					-- 54 级
					{
						{type=5,value=60969},
			    		{type=7,value=60969},
						{type=17,value=5594},
						{type=19,value=11954},
						{type=21,value=2942},
						{type=23,value=4838},
						{type=25,value=2942},
						{type=27,value=4838},
					},

					-- 55 级
					{
						{type=5,value=84992},
			    		{type=7,value=84992},
						{type=17,value=8353},
						{type=19,value=18852},
						{type=21,value=4495},
						{type=23,value=7426},
						{type=25,value=4495},
						{type=27,value=7426},
					},

					-- 56 级
					{
						{type=5,value=85748},
			    		{type=7,value=85748},
						{type=17,value=8392},
						{type=19,value=18950},
						{type=21,value=4519},
						{type=23,value=7462},
						{type=25,value=4519},
						{type=27,value=7462},
					},

					-- 57 级
					{
						{type=5,value=86504},
			    		{type=7,value=86504},
						{type=17,value=8431},
						{type=19,value=19048},
						{type=21,value=4543},
						{type=23,value=7498},
						{type=25,value=4543},
						{type=27,value=7498},
					},

					-- 58 级
					{
						{type=5,value=87260},
			    		{type=7,value=87260},
						{type=17,value=8470},
						{type=19,value=19146},
						{type=21,value=4567},
						{type=23,value=7534},
						{type=25,value=4567},
						{type=27,value=7534},
					},

					-- 59 级
					{
						{type=5,value=88016},
			    		{type=7,value=88016},
						{type=17,value=8509},
						{type=19,value=19244},
						{type=21,value=4591},
						{type=23,value=7570},
						{type=25,value=4591},
						{type=27,value=7570},
					},

					-- 60 级
					{
						{type=5,value=88772},
			    		{type=7,value=88772},
						{type=17,value=8548},
						{type=19,value=19342},
						{type=21,value=4615},
						{type=23,value=7606},
						{type=25,value=4615},
						{type=27,value=7606},
					},

					-- 61 级
					{
						{type=5,value=89528},
			    		{type=7,value=89528},
						{type=17,value=8587},
						{type=19,value=19440},
						{type=21,value=4639},
						{type=23,value=7642},
						{type=25,value=4639},
						{type=27,value=7642},
					},

					-- 62 级
					{
						{type=5,value=90284},
			    		{type=7,value=90284},
						{type=17,value=8626},
						{type=19,value=19538},
						{type=21,value=4663},
						{type=23,value=7678},
						{type=25,value=4663},
						{type=27,value=7678},
					},

					-- 63 级
					{
						{type=5,value=91040},
			    		{type=7,value=91040},
						{type=17,value=8665},
						{type=19,value=19636},
						{type=21,value=4687},
						{type=23,value=7714},
						{type=25,value=4687},
						{type=27,value=7714},
					},

					-- 64 级
					{
						{type=5,value=91796},
			    		{type=7,value=91796},
						{type=17,value=8704},
						{type=19,value=19734},
						{type=21,value=4711},
						{type=23,value=7750},
						{type=25,value=4711},
						{type=27,value=7750},
					},

					-- 65 级
					{
						{type=5,value=92552},
			    		{type=7,value=92552},
						{type=17,value=8743},
						{type=19,value=19832},
						{type=21,value=4735},
						{type=23,value=7786},
						{type=25,value=4735},
						{type=27,value=7786},
					},

					-- 66 级
					{
						{type=5,value=124955},
			    		{type=7,value=124955},
						{type=17,value=12658},
						{type=19,value=29620},
						{type=21,value=6888},
						{type=23,value=11374},
						{type=25,value=6888},
						{type=27,value=11374},
					},

					-- 67 级
					{
						{type=5,value=125837},
			    		{type=7,value=125837},
						{type=17,value=12704},
						{type=19,value=29734},
						{type=21,value=6916},
						{type=23,value=11416},
						{type=25,value=6916},
						{type=27,value=11416},
					},

					-- 68 级
					{
						{type=5,value=126719},
			    		{type=7,value=126719},
						{type=17,value=12750},
						{type=19,value=29848},
						{type=21,value=6944},
						{type=23,value=11458},
						{type=25,value=6944},
						{type=27,value=11458},
					},

					-- 69 级
					{
						{type=5,value=127601},
			    		{type=7,value=127601},
						{type=17,value=12796},
						{type=19,value=29962},
						{type=21,value=6972},
						{type=23,value=11500},
						{type=25,value=6972},
						{type=27,value=11500},
					},

					-- 70 级
					{
						{type=5,value=128483},
			    		{type=7,value=128483},
						{type=17,value=12842},
						{type=19,value=30076},
						{type=21,value=7000},
						{type=23,value=11542},
						{type=25,value=7000},
						{type=27,value=11542},
					},

					-- 71 级
					{
						{type=5,value=129365},
			    		{type=7,value=129365},
						{type=17,value=12888},
						{type=19,value=30190},
						{type=21,value=7028},
						{type=23,value=11584},
						{type=25,value=7028},
						{type=27,value=11584},
					},

					-- 72 级
					{
						{type=5,value=130247},
			    		{type=7,value=130247},
						{type=17,value=12934},
						{type=19,value=30304},
						{type=21,value=7056},
						{type=23,value=11626},
						{type=25,value=7056},
						{type=27,value=11626},
					},

					-- 73 级
					{
						{type=5,value=131129},
			    		{type=7,value=131129},
						{type=17,value=12980},
						{type=19,value=30418},
						{type=21,value=7084},
						{type=23,value=11668},
						{type=25,value=7084},
						{type=27,value=11668},
					},

					-- 74 级
					{
						{type=5,value=132011},
			    		{type=7,value=132011},
						{type=17,value=13026},
						{type=19,value=30532},
						{type=21,value=7112},
						{type=23,value=11710},
						{type=25,value=7112},
						{type=27,value=11710},
					},

					-- 75 级
					{
						{type=5,value=132893},
			    		{type=7,value=132893},
						{type=17,value=13072},
						{type=19,value=30646},
						{type=21,value=7140},
						{type=23,value=11752},
						{type=25,value=7140},
						{type=27,value=11752},
					},

					-- 76 级
					{
						{type=5,value=133775},
			    		{type=7,value=133775},
						{type=17,value=13118},
						{type=19,value=30760},
						{type=21,value=7168},
						{type=23,value=11794},
						{type=25,value=7168},
						{type=27,value=11794},
					},

					-- 77 级
					{
						{type=5,value=150535},
			    		{type=7,value=150535},
						{type=17,value=18353},
						{type=19,value=43848},
						{type=21,value=10101},
						{type=23,value=16682},
						{type=25,value=10101},
						{type=27,value=16682},
					},

					-- 78 级
					{
						{type=5,value=151543},
			    		{type=7,value=151543},
						{type=17,value=18404},
						{type=19,value=43976},
						{type=21,value=10133},
						{type=23,value=16730},
						{type=25,value=10133},
						{type=27,value=16730},
					},

					-- 79 级
					{
						{type=5,value=152551},
			    		{type=7,value=152551},
						{type=17,value=18455},
						{type=19,value=44104},
						{type=21,value=10165},
						{type=23,value=16778},
						{type=25,value=10165},
						{type=27,value=16778},
					},

					-- 80 级
					{
						{type=5,value=153559},
			    		{type=7,value=153559},
						{type=17,value=18506},
						{type=19,value=44232},
						{type=21,value=10197},
						{type=23,value=16826},
						{type=25,value=10197},
						{type=27,value=16826},
					},

					-- 81 级
					{
						{type=5,value=154567},
			    		{type=7,value=154567},
						{type=17,value=18557},
						{type=19,value=44360},
						{type=21,value=10229},
						{type=23,value=16874},
						{type=25,value=10229},
						{type=27,value=16874},
					},

					-- 82 级
					{
						{type=5,value=155575},
			    		{type=7,value=155575},
						{type=17,value=18608},
						{type=19,value=44488},
						{type=21,value=10261},
						{type=23,value=16922},
						{type=25,value=10261},
						{type=27,value=16922},
					},

					-- 83 级
					{
						{type=5,value=156583},
			    		{type=7,value=156583},
						{type=17,value=18659},
						{type=19,value=44616},
						{type=21,value=10293},
						{type=23,value=16970},
						{type=25,value=10293},
						{type=27,value=16970},
					},

					-- 84 级
					{
						{type=5,value=157591},
			    		{type=7,value=157591},
						{type=17,value=18710},
						{type=19,value=44744},
						{type=21,value=10325},
						{type=23,value=17018},
						{type=25,value=10325},
						{type=27,value=17018},
					},

					-- 85 级
					{
						{type=5,value=158599},
			    		{type=7,value=158599},
						{type=17,value=18761},
						{type=19,value=44872},
						{type=21,value=10357},
						{type=23,value=17066},
						{type=25,value=10357},
						{type=27,value=17066},
					},

					-- 86 级
					{
						{type=5,value=159607},
			    		{type=7,value=159607},
						{type=17,value=18812},
						{type=19,value=45000},
						{type=21,value=10389},
						{type=23,value=17114},
						{type=25,value=10389},
						{type=27,value=17114},
					},

					-- 87 级
					{
						{type=5,value=160615},
			    		{type=7,value=160615},
						{type=17,value=18863},
						{type=19,value=45128},
						{type=21,value=10421},
						{type=23,value=17162},
						{type=25,value=10421},
						{type=27,value=17162},
					},

					-- 88 级
					{
						{type=5,value=177375},
			    		{type=7,value=177375},
						{type=17,value=25538},
						{type=19,value=61816},
						{type=21,value=14374},
						{type=23,value=23750},
						{type=25,value=14374},
						{type=27,value=23750},
					},

					-- 89 级
					{
						{type=5,value=178509},
			    		{type=7,value=178509},
						{type=17,value=25594},
						{type=19,value=61956},
						{type=21,value=14410},
						{type=23,value=23804},
						{type=25,value=14410},
						{type=27,value=23804},
					},

					-- 90 级
					{
						{type=5,value=179643},
			    		{type=7,value=179643},
						{type=17,value=25650},
						{type=19,value=62096},
						{type=21,value=14446},
						{type=23,value=23858},
						{type=25,value=14446},
						{type=27,value=23858},
					},

					-- 91 级
					{
						{type=5,value=180777},
			    		{type=7,value=180777},
						{type=17,value=25706},
						{type=19,value=62236},
						{type=21,value=14482},
						{type=23,value=23912},
						{type=25,value=14482},
						{type=27,value=23912},
					},

					-- 92 级
					{
						{type=5,value=181911},
			    		{type=7,value=181911},
						{type=17,value=25762},
						{type=19,value=62376},
						{type=21,value=14518},
						{type=23,value=23966},
						{type=25,value=14518},
						{type=27,value=23966},
					},

					-- 93 级
					{
						{type=5,value=183045},
			    		{type=7,value=183045},
						{type=17,value=25818},
						{type=19,value=62516},
						{type=21,value=14554},
						{type=23,value=24020},
						{type=25,value=14554},
						{type=27,value=24020},
					},

					-- 94 级
					{
						{type=5,value=184179},
			    		{type=7,value=184179},
						{type=17,value=25874},
						{type=19,value=62656},
						{type=21,value=14590},
						{type=23,value=24074},
						{type=25,value=14590},
						{type=27,value=24074},
					},

					-- 95 级
					{
						{type=5,value=185313},
			    		{type=7,value=185313},
						{type=17,value=25930},
						{type=19,value=62796},
						{type=21,value=14626},
						{type=23,value=24128},
						{type=25,value=14626},
						{type=27,value=24128},
					},

					-- 96 级
					{
						{type=5,value=186447},
			    		{type=7,value=186447},
						{type=17,value=25986},
						{type=19,value=62936},
						{type=21,value=14662},
						{type=23,value=24182},
						{type=25,value=14662},
						{type=27,value=24182},
					},

					-- 97 级
					{
						{type=5,value=187581},
			    		{type=7,value=187581},
						{type=17,value=26042},
						{type=19,value=63076},
						{type=21,value=14698},
						{type=23,value=24236},
						{type=25,value=14698},
						{type=27,value=24236},
					},

					-- 98 级
					{
						{type=5,value=188715},
			    		{type=7,value=188715},
						{type=17,value=26098},
						{type=19,value=63216},
						{type=21,value=14734},
						{type=23,value=24290},
						{type=25,value=14734},
						{type=27,value=24290},
					},



					
				},
			},
		},
		----------------------------- 时装 2  猪八戒时装
		{
			-- 战
			{
				itemId = 5948, --升阶所需道具
				
				inShowIds = {175,176,177,178,299,300,301,302,303}, -- 每阶一个内观
				outShowIds = {175,176,177,178,299,300,301,302,303}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 5951, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,8,8,8,8,8,8,8,8,8,8,4,20,20,20,20,20,20,20,20,20,20,8,40,40,40,40,40,40,40,40,40,40,16,80,80,80,80,80,80,80,80,80,80,
				28,120,120,120,120,120,120,120,120,120,120,42,160,160,160,160,160,160,160,160,160,160,58,200,200,200,200,200,200,200,200,200,200,76,240,240
				,240,240,240,240,240,240,240,240,96,280,280,280,280,280,280,280,280,280,280,},
				
					-- --模块
					-- -- (a1) 级
					-- {
					-- 	{type=(a2),value=(a3)},
			    	-- 	{type=(a4),value=(a5)},
					-- 	{type=(a6),value=(a7)},
					-- 	{type=(a8),value=(a9)},
					-- 	{type=(a10),value=(a11)},
					-- 	{type=(a12),value=(a13)},
					-- 	{type=(a14),value=(a15)},
					-- 	{type=(a16),value=(a17)},
					-- },


				attrs = {
									-- 0 级
					{
						{type=5,value=4500},
			    		{type=7,value=455},
						{type=9,value=150},
						{type=11,value=315},
						{type=21,value=76},
						{type=23,value=126},
						{type=25,value=76},
						{type=27,value=126},
					},
					-- 1 级
					{
						{type=5,value=4725},
			    		{type=7,value=477},
						{type=9,value=155},
						{type=11,value=331},
						{type=21,value=80},
						{type=23,value=132},
						{type=25,value=80},
						{type=27,value=132},
					},
					-- 2 级
					{
						{type=5,value=4950},
			    		{type=7,value=499},
						{type=9,value=160},
						{type=11,value=347},
						{type=21,value=84},
						{type=23,value=138},
						{type=25,value=84},
						{type=27,value=138},
					},
					-- 3 级
					{
						{type=5,value=5175},
			    		{type=7,value=521},
						{type=9,value=165},
						{type=11,value=363},
						{type=21,value=88},
						{type=23,value=144},
						{type=25,value=88},
						{type=27,value=144},
					},
					-- 4 级
					{
						{type=5,value=5400},
			    		{type=7,value=543},
						{type=9,value=170},
						{type=11,value=379},
						{type=21,value=92},
						{type=23,value=150},
						{type=25,value=92},
						{type=27,value=150},
					},
					-- 5 级
					{
						{type=5,value=5625},
			    		{type=7,value=565},
						{type=9,value=175},
						{type=11,value=395},
						{type=21,value=96},
						{type=23,value=156},
						{type=25,value=96},
						{type=27,value=156},
					},
					-- 6 级
					{
						{type=5,value=5850},
			    		{type=7,value=587},
						{type=9,value=180},
						{type=11,value=411},
						{type=21,value=100},
						{type=23,value=162},
						{type=25,value=100},
						{type=27,value=162},
					},
					-- 7 级
					{
						{type=5,value=6075},
			    		{type=7,value=609},
						{type=9,value=185},
						{type=11,value=427},
						{type=21,value=104},
						{type=23,value=168},
						{type=25,value=104},
						{type=27,value=168},
					},
					-- 8 级
					{
						{type=5,value=6300},
			    		{type=7,value=631},
						{type=9,value=190},
						{type=11,value=443},
						{type=21,value=108},
						{type=23,value=174},
						{type=25,value=108},
						{type=27,value=174},
					},
					-- 9 级
					{
						{type=5,value=6525},
			    		{type=7,value=653},
						{type=9,value=195},
						{type=11,value=459},
						{type=21,value=112},
						{type=23,value=180},
						{type=25,value=112},
						{type=27,value=180},
					},
					-- 10 级
					{
						{type=5,value=6750},
			    		{type=7,value=675},
						{type=9,value=200},
						{type=11,value=475},
						{type=21,value=116},
						{type=23,value=186},
						{type=25,value=116},
						{type=27,value=186},
					},
					-- 11 级
					{
						{type=5,value=14750},
			    		{type=7,value=1483},
						{type=9,value=590},
						{type=11,value=1293},
						{type=21,value=312},
						{type=23,value=514},
						{type=25,value=312},
						{type=27,value=514},
					},
					-- 12 级
					{
						{type=5,value=15200},
			    		{type=7,value=1527},
						{type=9,value=600},
						{type=11,value=1318},
						{type=21,value=320},
						{type=23,value=526},
						{type=25,value=320},
						{type=27,value=526},
					},
					-- 13 级
					{
						{type=5,value=15650},
			    		{type=7,value=1571},
						{type=9,value=610},
						{type=11,value=1343},
						{type=21,value=328},
						{type=23,value=538},
						{type=25,value=328},
						{type=27,value=538},
					},
					-- 14 级
					{
						{type=5,value=16100},
			    		{type=7,value=1615},
						{type=9,value=620},
						{type=11,value=1368},
						{type=21,value=336},
						{type=23,value=550},
						{type=25,value=336},
						{type=27,value=550},
					},
					-- 15 级
					{
						{type=5,value=16550},
			    		{type=7,value=1659},
						{type=9,value=630},
						{type=11,value=1393},
						{type=21,value=344},
						{type=23,value=562},
						{type=25,value=344},
						{type=27,value=562},
					},
					-- 16 级
					{
						{type=5,value=17000},
			    		{type=7,value=1703},
						{type=9,value=640},
						{type=11,value=1418},
						{type=21,value=352},
						{type=23,value=574},
						{type=25,value=352},
						{type=27,value=574},
					},
					-- 17 级
					{
						{type=5,value=17450},
			    		{type=7,value=1747},
						{type=9,value=650},
						{type=11,value=1443},
						{type=21,value=360},
						{type=23,value=586},
						{type=25,value=360},
						{type=27,value=586},
					},
					-- 18 级
					{
						{type=5,value=17900},
			    		{type=7,value=1791},
						{type=9,value=660},
						{type=11,value=1468},
						{type=21,value=368},
						{type=23,value=598},
						{type=25,value=368},
						{type=27,value=598},
					},
					-- 19 级
					{
						{type=5,value=18350},
			    		{type=7,value=1835},
						{type=9,value=670},
						{type=11,value=1493},
						{type=21,value=376},
						{type=23,value=610},
						{type=25,value=376},
						{type=27,value=610},
					},
					-- 20 级
					{
						{type=5,value=18800},
			    		{type=7,value=1879},
						{type=9,value=680},
						{type=11,value=1518},
						{type=21,value=384},
						{type=23,value=622},
						{type=25,value=384},
						{type=27,value=622},
					},
					-- 21 级
					{
						{type=5,value=19250},
			    		{type=7,value=1923},
						{type=9,value=690},
						{type=11,value=1543},
						{type=21,value=392},
						{type=23,value=634},
						{type=25,value=392},
						{type=27,value=634},
					},
					-- 22 级
					{
						{type=5,value=32050},
			    		{type=7,value=3216},
						{type=9,value=1426},
						{type=11,value=3088},
						{type=21,value=762},
						{type=23,value=1252},
						{type=25,value=762},
						{type=27,value=1252},
					},
					-- 23 级
					{
						{type=5,value=32725},
			    		{type=7,value=3282},
						{type=9,value=1441},
						{type=11,value=3126},
						{type=21,value=774},
						{type=23,value=1270},
						{type=25,value=774},
						{type=27,value=1270},
					},
					-- 24 级
					{
						{type=5,value=33400},
			    		{type=7,value=3348},
						{type=9,value=1456},
						{type=11,value=3164},
						{type=21,value=786},
						{type=23,value=1288},
						{type=25,value=786},
						{type=27,value=1288},
					},
					-- 25 级
					{
						{type=5,value=34075},
			    		{type=7,value=3414},
						{type=9,value=1471},
						{type=11,value=3202},
						{type=21,value=798},
						{type=23,value=1306},
						{type=25,value=798},
						{type=27,value=1306},
					},
					-- 26 级
					{
						{type=5,value=34750},
			    		{type=7,value=3480},
						{type=9,value=1486},
						{type=11,value=3240},
						{type=21,value=810},
						{type=23,value=1324},
						{type=25,value=810},
						{type=27,value=1324},
					},
					-- 27 级
					{
						{type=5,value=35425},
			    		{type=7,value=3546},
						{type=9,value=1501},
						{type=11,value=3278},
						{type=21,value=822},
						{type=23,value=1342},
						{type=25,value=822},
						{type=27,value=1342},
					},
					-- 28 级
					{
						{type=5,value=36100},
			    		{type=7,value=3612},
						{type=9,value=1516},
						{type=11,value=3316},
						{type=21,value=834},
						{type=23,value=1360},
						{type=25,value=834},
						{type=27,value=1360},
					},
					-- 29 级
					{
						{type=5,value=36775},
			    		{type=7,value=3678},
						{type=9,value=1531},
						{type=11,value=3354},
						{type=21,value=846},
						{type=23,value=1378},
						{type=25,value=846},
						{type=27,value=1378},
					},
					-- 30 级
					{
						{type=5,value=37450},
			    		{type=7,value=3744},
						{type=9,value=1546},
						{type=11,value=3392},
						{type=21,value=858},
						{type=23,value=1396},
						{type=25,value=858},
						{type=27,value=1396},
					},
					-- 31 级
					{
						{type=5,value=38125},
			    		{type=7,value=3810},
						{type=9,value=1561},
						{type=11,value=3430},
						{type=21,value=870},
						{type=23,value=1414},
						{type=25,value=870},
						{type=27,value=1414},
					},
					-- 32 级
					{
						{type=5,value=38800},
			    		{type=7,value=3876},
						{type=9,value=1576},
						{type=11,value=3468},
						{type=21,value=882},
						{type=23,value=1432},
						{type=25,value=882},
						{type=27,value=1432},
					},
					-- 33 级
					{
						{type=5,value=58800},
			    		{type=7,value=5896},
						{type=9,value=2872},
						{type=11,value=6186},
						{type=21,value=1532},
						{type=23,value=2520},
						{type=25,value=1532},
						{type=27,value=2520},
					},
					-- 34 级
					{
						{type=5,value=59700},
			    		{type=7,value=5984},
						{type=9,value=2897},
						{type=11,value=6244},
						{type=21,value=1548},
						{type=23,value=2544},
						{type=25,value=1548},
						{type=27,value=2544},
					},
					-- 35 级
					{
						{type=5,value=60600},
			    		{type=7,value=6072},
						{type=9,value=2922},
						{type=11,value=6302},
						{type=21,value=1564},
						{type=23,value=2568},
						{type=25,value=1564},
						{type=27,value=2568},
					},
					-- 36 级
					{
						{type=5,value=61500},
			    		{type=7,value=6160},
						{type=9,value=2947},
						{type=11,value=6360},
						{type=21,value=1580},
						{type=23,value=2592},
						{type=25,value=1580},
						{type=27,value=2592},
					},
					-- 37 级
					{
						{type=5,value=62400},
			    		{type=7,value=6248},
						{type=9,value=2972},
						{type=11,value=6418},
						{type=21,value=1596},
						{type=23,value=2616},
						{type=25,value=1596},
						{type=27,value=2616},
					},
					-- 38 级
					{
						{type=5,value=63300},
			    		{type=7,value=6336},
						{type=9,value=2997},
						{type=11,value=6476},
						{type=21,value=1612},
						{type=23,value=2640},
						{type=25,value=1612},
						{type=27,value=2640},
					},
					-- 39 级
					{
						{type=5,value=64200},
			    		{type=7,value=6424},
						{type=9,value=3022},
						{type=11,value=6534},
						{type=21,value=1628},
						{type=23,value=2664},
						{type=25,value=1628},
						{type=27,value=2664},
					},
					-- 40 级
					{
						{type=5,value=65100},
			    		{type=7,value=6512},
						{type=9,value=3047},
						{type=11,value=6592},
						{type=21,value=1644},
						{type=23,value=2688},
						{type=25,value=1644},
						{type=27,value=2688},
					},
					-- 41 级
					{
						{type=5,value=66000},
			    		{type=7,value=6600},
						{type=9,value=3072},
						{type=11,value=6650},
						{type=21,value=1660},
						{type=23,value=2712},
						{type=25,value=1660},
						{type=27,value=2712},
					},
					-- 42 级
					{
						{type=5,value=66900},
			    		{type=7,value=6688},
						{type=9,value=3097},
						{type=11,value=6708},
						{type=21,value=1676},
						{type=23,value=2736},
						{type=25,value=1676},
						{type=27,value=2736},
					},
					-- 43 级
					{
						{type=5,value=67800},
			    		{type=7,value=6776},
						{type=9,value=3122},
						{type=11,value=6766},
						{type=21,value=1692},
						{type=23,value=2760},
						{type=25,value=1692},
						{type=27,value=2760},
					},


					
									-- 44 级
					{
						{type=5,value=97800},
			    		{type=7,value=9806},
						{type=9,value=5234},
						{type=11,value=11154},
						{type=21,value=2742},
						{type=23,value=4538},
						{type=25,value=2742},
						{type=27,value=4538},
					},
					-- 45 级
					{
						{type=5,value=98925},
			    		{type=7,value=9916},
						{type=9,value=5270},
						{type=11,value=11234},
						{type=21,value=2762},
						{type=23,value=4568},
						{type=25,value=2762},
						{type=27,value=4568},
					},
					-- 46 级
					{
						{type=5,value=100050},
			    		{type=7,value=10026},
						{type=9,value=5306},
						{type=11,value=11314},
						{type=21,value=2782},
						{type=23,value=4598},
						{type=25,value=2782},
						{type=27,value=4598},
					},
					-- 47 级
					{
						{type=5,value=101175},
			    		{type=7,value=10136},
						{type=9,value=5342},
						{type=11,value=11394},
						{type=21,value=2802},
						{type=23,value=4628},
						{type=25,value=2802},
						{type=27,value=4628},
					},
					-- 48 级
					{
						{type=5,value=102300},
			    		{type=7,value=10246},
						{type=9,value=5378},
						{type=11,value=11474},
						{type=21,value=2822},
						{type=23,value=4658},
						{type=25,value=2822},
						{type=27,value=4658},
					},
					-- 49 级
					{
						{type=5,value=103425},
			    		{type=7,value=10356},
						{type=9,value=5414},
						{type=11,value=11554},
						{type=21,value=2842},
						{type=23,value=4688},
						{type=25,value=2842},
						{type=27,value=4688},
					},
					-- 50 级
					{
						{type=5,value=104550},
			    		{type=7,value=10466},
						{type=9,value=5450},
						{type=11,value=11634},
						{type=21,value=2862},
						{type=23,value=4718},
						{type=25,value=2862},
						{type=27,value=4718},
					},
					-- 51 级
					{
						{type=5,value=105675},
			    		{type=7,value=10576},
						{type=9,value=5486},
						{type=11,value=11714},
						{type=21,value=2882},
						{type=23,value=4748},
						{type=25,value=2882},
						{type=27,value=4748},
					},
					-- 52 级
					{
						{type=5,value=106800},
			    		{type=7,value=10686},
						{type=9,value=5522},
						{type=11,value=11794},
						{type=21,value=2902},
						{type=23,value=4778},
						{type=25,value=2902},
						{type=27,value=4778},
					},
					-- 53 级
					{
						{type=5,value=107925},
			    		{type=7,value=10796},
						{type=9,value=5558},
						{type=11,value=11874},
						{type=21,value=2922},
						{type=23,value=4808},
						{type=25,value=2922},
						{type=27,value=4808},
					},
					-- 54 级
					{
						{type=5,value=109050},
			    		{type=7,value=10906},
						{type=9,value=5594},
						{type=11,value=11954},
						{type=21,value=2942},
						{type=23,value=4838},
						{type=25,value=2942},
						{type=27,value=4838},
					},
					-- 55 级
					{
						{type=5,value=152050},
			    		{type=7,value=15249},
						{type=9,value=8353},
						{type=11,value=18852},
						{type=21,value=4495},
						{type=23,value=7426},
						{type=25,value=4495},
						{type=27,value=7426},
					},
					-- 56 级
					{
						{type=5,value=153400},
			    		{type=7,value=15384},
						{type=9,value=8392},
						{type=11,value=18950},
						{type=21,value=4519},
						{type=23,value=7462},
						{type=25,value=4519},
						{type=27,value=7462},
					},
					-- 57 级
					{
						{type=5,value=154750},
			    		{type=7,value=15519},
						{type=9,value=8431},
						{type=11,value=19048},
						{type=21,value=4543},
						{type=23,value=7498},
						{type=25,value=4543},
						{type=27,value=7498},
					},
					-- 58 级
					{
						{type=5,value=156100},
			    		{type=7,value=15654},
						{type=9,value=8470},
						{type=11,value=19146},
						{type=21,value=4567},
						{type=23,value=7534},
						{type=25,value=4567},
						{type=27,value=7534},
					},
					-- 59 级
					{
						{type=5,value=157450},
			    		{type=7,value=15789},
						{type=9,value=8509},
						{type=11,value=19244},
						{type=21,value=4591},
						{type=23,value=7570},
						{type=25,value=4591},
						{type=27,value=7570},
					},
					-- 60 级
					{
						{type=5,value=158800},
			    		{type=7,value=15924},
						{type=9,value=8548},
						{type=11,value=19342},
						{type=21,value=4615},
						{type=23,value=7606},
						{type=25,value=4615},
						{type=27,value=7606},
					},
					-- 61 级
					{
						{type=5,value=160150},
			    		{type=7,value=16059},
						{type=9,value=8587},
						{type=11,value=19440},
						{type=21,value=4639},
						{type=23,value=7642},
						{type=25,value=4639},
						{type=27,value=7642},
					},
					-- 62 级
					{
						{type=5,value=161500},
			    		{type=7,value=16194},
						{type=9,value=8626},
						{type=11,value=19538},
						{type=21,value=4663},
						{type=23,value=7678},
						{type=25,value=4663},
						{type=27,value=7678},
					},
					-- 63 级
					{
						{type=5,value=162850},
			    		{type=7,value=16329},
						{type=9,value=8665},
						{type=11,value=19636},
						{type=21,value=4687},
						{type=23,value=7714},
						{type=25,value=4687},
						{type=27,value=7714},
					},
					-- 64 级
					{
						{type=5,value=164200},
			    		{type=7,value=16464},
						{type=9,value=8704},
						{type=11,value=19734},
						{type=21,value=4711},
						{type=23,value=7750},
						{type=25,value=4711},
						{type=27,value=7750},
					},
					-- 65 级
					{
						{type=5,value=165550},
			    		{type=7,value=16599},
						{type=9,value=8743},
						{type=11,value=19832},
						{type=21,value=4735},
						{type=23,value=7786},
						{type=25,value=4735},
						{type=27,value=7786},
					},
					-- 66 级
					{
						{type=5,value=223550},
			    		{type=7,value=22458},
						{type=9,value=12658},
						{type=11,value=29620},
						{type=21,value=6888},
						{type=23,value=11374},
						{type=25,value=6888},
						{type=27,value=11374},
					},
					-- 67 级
					{
						{type=5,value=225125},
			    		{type=7,value=22616},
						{type=9,value=12704},
						{type=11,value=29734},
						{type=21,value=6916},
						{type=23,value=11416},
						{type=25,value=6916},
						{type=27,value=11416},
					},
					-- 68 级
					{
						{type=5,value=226700},
			    		{type=7,value=22774},
						{type=9,value=12750},
						{type=11,value=29848},
						{type=21,value=6944},
						{type=23,value=11458},
						{type=25,value=6944},
						{type=27,value=11458},
					},
					-- 69 级
					{
						{type=5,value=228275},
			    		{type=7,value=22932},
						{type=9,value=12796},
						{type=11,value=29962},
						{type=21,value=6972},
						{type=23,value=11500},
						{type=25,value=6972},
						{type=27,value=11500},
					},
					-- 70 级
					{
						{type=5,value=229850},
			    		{type=7,value=23090},
						{type=9,value=12842},
						{type=11,value=30076},
						{type=21,value=7000},
						{type=23,value=11542},
						{type=25,value=7000},
						{type=27,value=11542},
					},
					-- 71 级
					{
						{type=5,value=231425},
			    		{type=7,value=23248},
						{type=9,value=12888},
						{type=11,value=30190},
						{type=21,value=7028},
						{type=23,value=11584},
						{type=25,value=7028},
						{type=27,value=11584},
					},
					-- 72 级
					{
						{type=5,value=233000},
			    		{type=7,value=23406},
						{type=9,value=12934},
						{type=11,value=30304},
						{type=21,value=7056},
						{type=23,value=11626},
						{type=25,value=7056},
						{type=27,value=11626},
					},
					-- 73 级
					{
						{type=5,value=234575},
			    		{type=7,value=23564},
						{type=9,value=12980},
						{type=11,value=30418},
						{type=21,value=7084},
						{type=23,value=11668},
						{type=25,value=7084},
						{type=27,value=11668},
					},
					-- 74 级
					{
						{type=5,value=236150},
			    		{type=7,value=23722},
						{type=9,value=13026},
						{type=11,value=30532},
						{type=21,value=7112},
						{type=23,value=11710},
						{type=25,value=7112},
						{type=27,value=11710},
					},
					-- 75 级
					{
						{type=5,value=237725},
			    		{type=7,value=23880},
						{type=9,value=13072},
						{type=11,value=30646},
						{type=21,value=7140},
						{type=23,value=11752},
						{type=25,value=7140},
						{type=27,value=11752},
					},
					-- 76 级
					{
						{type=5,value=239300},
			    		{type=7,value=24038},
						{type=9,value=13118},
						{type=11,value=30760},
						{type=21,value=7168},
						{type=23,value=11794},
						{type=25,value=7168},
						{type=27,value=11794},
					},
					-- 77 级
					{
						{type=5,value=314300},
			    		{type=7,value=31614},
						{type=9,value=18353},
						{type=11,value=43848},
						{type=21,value=10101},
						{type=23,value=16682},
						{type=25,value=10101},
						{type=27,value=16682},
					},
					-- 78 级
					{
						{type=5,value=316100},
			    		{type=7,value=31794},
						{type=9,value=18404},
						{type=11,value=43976},
						{type=21,value=10133},
						{type=23,value=16730},
						{type=25,value=10133},
						{type=27,value=16730},
					},
					-- 79 级
					{
						{type=5,value=317900},
			    		{type=7,value=31974},
						{type=9,value=18455},
						{type=11,value=44104},
						{type=21,value=10165},
						{type=23,value=16778},
						{type=25,value=10165},
						{type=27,value=16778},
					},
					-- 80 级
					{
						{type=5,value=319700},
			    		{type=7,value=32154},
						{type=9,value=18506},
						{type=11,value=44232},
						{type=21,value=10197},
						{type=23,value=16826},
						{type=25,value=10197},
						{type=27,value=16826},
					},
					-- 81 级
					{
						{type=5,value=321500},
			    		{type=7,value=32334},
						{type=9,value=18557},
						{type=11,value=44360},
						{type=21,value=10229},
						{type=23,value=16874},
						{type=25,value=10229},
						{type=27,value=16874},
					},
					-- 82 级
					{
						{type=5,value=323300},
			    		{type=7,value=32514},
						{type=9,value=18608},
						{type=11,value=44488},
						{type=21,value=10261},
						{type=23,value=16922},
						{type=25,value=10261},
						{type=27,value=16922},
					},
					-- 83 级
					{
						{type=5,value=325100},
			    		{type=7,value=32694},
						{type=9,value=18659},
						{type=11,value=44616},
						{type=21,value=10293},
						{type=23,value=16970},
						{type=25,value=10293},
						{type=27,value=16970},
					},
					-- 84 级
					{
						{type=5,value=326900},
			    		{type=7,value=32874},
						{type=9,value=18710},
						{type=11,value=44744},
						{type=21,value=10325},
						{type=23,value=17018},
						{type=25,value=10325},
						{type=27,value=17018},
					},
					-- 85 级
					{
						{type=5,value=328700},
			    		{type=7,value=33054},
						{type=9,value=18761},
						{type=11,value=44872},
						{type=21,value=10357},
						{type=23,value=17066},
						{type=25,value=10357},
						{type=27,value=17066},
					},
					-- 86 级
					{
						{type=5,value=330500},
			    		{type=7,value=33234},
						{type=9,value=18812},
						{type=11,value=45000},
						{type=21,value=10389},
						{type=23,value=17114},
						{type=25,value=10389},
						{type=27,value=17114},
					},
					-- 87 级
					{
						{type=5,value=332300},
			    		{type=7,value=33414},
						{type=9,value=18863},
						{type=11,value=45128},
						{type=21,value=10421},
						{type=23,value=17162},
						{type=25,value=10421},
						{type=27,value=17162},
					},
					-- 88 级
					{
						{type=5,value=427300},
			    		{type=7,value=43010},
						{type=9,value=25538},
						{type=11,value=61816},
						{type=21,value=14374},
						{type=23,value=23750},
						{type=25,value=14374},
						{type=27,value=23750},
					},
					-- 89 级
					{
						{type=5,value=429325},
			    		{type=7,value=43213},
						{type=9,value=25594},
						{type=11,value=61956},
						{type=21,value=14410},
						{type=23,value=23804},
						{type=25,value=14410},
						{type=27,value=23804},
					},
					-- 90 级
					{
						{type=5,value=431350},
			    		{type=7,value=43416},
						{type=9,value=25650},
						{type=11,value=62096},
						{type=21,value=14446},
						{type=23,value=23858},
						{type=25,value=14446},
						{type=27,value=23858},
					},
					-- 91 级
					{
						{type=5,value=433375},
			    		{type=7,value=43619},
						{type=9,value=25706},
						{type=11,value=62236},
						{type=21,value=14482},
						{type=23,value=23912},
						{type=25,value=14482},
						{type=27,value=23912},
					},
					-- 92 级
					{
						{type=5,value=435400},
			    		{type=7,value=43822},
						{type=9,value=25762},
						{type=11,value=62376},
						{type=21,value=14518},
						{type=23,value=23966},
						{type=25,value=14518},
						{type=27,value=23966},
					},
					-- 93 级
					{
						{type=5,value=437425},
			    		{type=7,value=44025},
						{type=9,value=25818},
						{type=11,value=62516},
						{type=21,value=14554},
						{type=23,value=24020},
						{type=25,value=14554},
						{type=27,value=24020},
					},
					-- 94 级
					{
						{type=5,value=439450},
			    		{type=7,value=44228},
						{type=9,value=25874},
						{type=11,value=62656},
						{type=21,value=14590},
						{type=23,value=24074},
						{type=25,value=14590},
						{type=27,value=24074},
					},
					-- 95 级
					{
						{type=5,value=441475},
			    		{type=7,value=44431},
						{type=9,value=25930},
						{type=11,value=62796},
						{type=21,value=14626},
						{type=23,value=24128},
						{type=25,value=14626},
						{type=27,value=24128},
					},
					-- 96 级
					{
						{type=5,value=443500},
			    		{type=7,value=44634},
						{type=9,value=25986},
						{type=11,value=62936},
						{type=21,value=14662},
						{type=23,value=24182},
						{type=25,value=14662},
						{type=27,value=24182},
					},
					-- 97 级
					{
						{type=5,value=445525},
			    		{type=7,value=44837},
						{type=9,value=26042},
						{type=11,value=63076},
						{type=21,value=14698},
						{type=23,value=24236},
						{type=25,value=14698},
						{type=27,value=24236},
					},
					-- 98 级
					{
						{type=5,value=447550},
			    		{type=7,value=45040},
						{type=9,value=26098},
						{type=11,value=63216},
						{type=21,value=14734},
						{type=23,value=24290},
						{type=25,value=14734},
						{type=27,value=24290},
					},



					
				},
			},
			-- 法
			{
				itemId = 5948,
				
				inShowIds = {175,176,177,178,299,300,301,302,303}, -- 每阶一个内观
				outShowIds = {175,176,177,178,299,300,301,302,303}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 5951, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,8,8,8,8,8,8,8,8,8,8,4,20,20,20,20,20,20,20,20,20,20,8,40,40,40,40,40,40,40,40,40,40,16,80,80,80,80,80,80,80,80,80,80,
				28,120,120,120,120,120,120,120,120,120,120,42,160,160,160,160,160,160,160,160,160,160,58,200,200,200,200,200,200,200,200,200,200,76,240,240
				,240,240,240,240,240,240,240,240,96,280,280,280,280,280,280,280,280,280,280,},
				
				attrs = {
											-- 0 级
					{
						{type=5,value=1157},
			    		{type=7,value=4628},
						{type=13,value=150},
						{type=15,value=315},
						{type=21,value=76},
						{type=23,value=126},
						{type=25,value=76},
						{type=27,value=126},
					},
					-- 1 级
					{
						{type=5,value=1215},
			    		{type=7,value=4858},
						{type=13,value=155},
						{type=15,value=331},
						{type=21,value=80},
						{type=23,value=132},
						{type=25,value=80},
						{type=27,value=132},
					},
					-- 2 级
					{
						{type=5,value=1273},
			    		{type=7,value=5088},
						{type=13,value=160},
						{type=15,value=347},
						{type=21,value=84},
						{type=23,value=138},
						{type=25,value=84},
						{type=27,value=138},
					},
					-- 3 级
					{
						{type=5,value=1331},
			    		{type=7,value=5318},
						{type=13,value=165},
						{type=15,value=363},
						{type=21,value=88},
						{type=23,value=144},
						{type=25,value=88},
						{type=27,value=144},
					},
					-- 4 级
					{
						{type=5,value=1389},
			    		{type=7,value=5548},
						{type=13,value=170},
						{type=15,value=379},
						{type=21,value=92},
						{type=23,value=150},
						{type=25,value=92},
						{type=27,value=150},
					},
					-- 5 级
					{
						{type=5,value=1447},
			    		{type=7,value=5778},
						{type=13,value=175},
						{type=15,value=395},
						{type=21,value=96},
						{type=23,value=156},
						{type=25,value=96},
						{type=27,value=156},
					},
					-- 6 级
					{
						{type=5,value=1505},
			    		{type=7,value=6008},
						{type=13,value=180},
						{type=15,value=411},
						{type=21,value=100},
						{type=23,value=162},
						{type=25,value=100},
						{type=27,value=162},
					},
					-- 7 级
					{
						{type=5,value=1563},
			    		{type=7,value=6238},
						{type=13,value=185},
						{type=15,value=427},
						{type=21,value=104},
						{type=23,value=168},
						{type=25,value=104},
						{type=27,value=168},
					},
					-- 8 级
					{
						{type=5,value=1621},
			    		{type=7,value=6468},
						{type=13,value=190},
						{type=15,value=443},
						{type=21,value=108},
						{type=23,value=174},
						{type=25,value=108},
						{type=27,value=174},
					},
					-- 9 级
					{
						{type=5,value=1679},
			    		{type=7,value=6698},
						{type=13,value=195},
						{type=15,value=459},
						{type=21,value=112},
						{type=23,value=180},
						{type=25,value=112},
						{type=27,value=180},
					},
					-- 10 级
					{
						{type=5,value=1737},
			    		{type=7,value=6928},
						{type=13,value=200},
						{type=15,value=475},
						{type=21,value=116},
						{type=23,value=186},
						{type=25,value=116},
						{type=27,value=186},
					},
					-- 11 级
					{
						{type=5,value=3794},
			    		{type=7,value=15156},
						{type=13,value=590},
						{type=15,value=1293},
						{type=21,value=312},
						{type=23,value=514},
						{type=25,value=312},
						{type=27,value=514},
					},
					-- 12 级
					{
						{type=5,value=3910},
			    		{type=7,value=15616},
						{type=13,value=600},
						{type=15,value=1318},
						{type=21,value=320},
						{type=23,value=526},
						{type=25,value=320},
						{type=27,value=526},
					},
					-- 13 级
					{
						{type=5,value=4026},
			    		{type=7,value=16076},
						{type=13,value=610},
						{type=15,value=1343},
						{type=21,value=328},
						{type=23,value=538},
						{type=25,value=328},
						{type=27,value=538},
					},
					-- 14 级
					{
						{type=5,value=4142},
			    		{type=7,value=16536},
						{type=13,value=620},
						{type=15,value=1368},
						{type=21,value=336},
						{type=23,value=550},
						{type=25,value=336},
						{type=27,value=550},
					},
					-- 15 级
					{
						{type=5,value=4258},
			    		{type=7,value=16996},
						{type=13,value=630},
						{type=15,value=1393},
						{type=21,value=344},
						{type=23,value=562},
						{type=25,value=344},
						{type=27,value=562},
					},
					-- 16 级
					{
						{type=5,value=4374},
			    		{type=7,value=17456},
						{type=13,value=640},
						{type=15,value=1418},
						{type=21,value=352},
						{type=23,value=574},
						{type=25,value=352},
						{type=27,value=574},
					},
					-- 17 级
					{
						{type=5,value=4490},
			    		{type=7,value=17916},
						{type=13,value=650},
						{type=15,value=1443},
						{type=21,value=360},
						{type=23,value=586},
						{type=25,value=360},
						{type=27,value=586},
					},
					-- 18 级
					{
						{type=5,value=4606},
			    		{type=7,value=18376},
						{type=13,value=660},
						{type=15,value=1468},
						{type=21,value=368},
						{type=23,value=598},
						{type=25,value=368},
						{type=27,value=598},
					},
					-- 19 级
					{
						{type=5,value=4722},
			    		{type=7,value=18836},
						{type=13,value=670},
						{type=15,value=1493},
						{type=21,value=376},
						{type=23,value=610},
						{type=25,value=376},
						{type=27,value=610},
					},
					-- 20 级
					{
						{type=5,value=4838},
			    		{type=7,value=19296},
						{type=13,value=680},
						{type=15,value=1518},
						{type=21,value=384},
						{type=23,value=622},
						{type=25,value=384},
						{type=27,value=622},
					},
					-- 21 级
					{
						{type=5,value=4954},
			    		{type=7,value=19756},
						{type=13,value=690},
						{type=15,value=1543},
						{type=21,value=392},
						{type=23,value=634},
						{type=25,value=392},
						{type=27,value=634},
					},
					-- 22 级
					{
						{type=5,value=8245},
			    		{type=7,value=32920},
						{type=13,value=1426},
						{type=15,value=3088},
						{type=21,value=762},
						{type=23,value=1252},
						{type=25,value=762},
						{type=27,value=1252},
					},
					-- 23 级
					{
						{type=5,value=8419},
			    		{type=7,value=33610},
						{type=13,value=1441},
						{type=15,value=3126},
						{type=21,value=774},
						{type=23,value=1270},
						{type=25,value=774},
						{type=27,value=1270},
					},
					-- 24 级
					{
						{type=5,value=8593},
			    		{type=7,value=34300},
						{type=13,value=1456},
						{type=15,value=3164},
						{type=21,value=786},
						{type=23,value=1288},
						{type=25,value=786},
						{type=27,value=1288},
					},
					-- 25 级
					{
						{type=5,value=8767},
			    		{type=7,value=34990},
						{type=13,value=1471},
						{type=15,value=3202},
						{type=21,value=798},
						{type=23,value=1306},
						{type=25,value=798},
						{type=27,value=1306},
					},
					-- 26 级
					{
						{type=5,value=8941},
			    		{type=7,value=35680},
						{type=13,value=1486},
						{type=15,value=3240},
						{type=21,value=810},
						{type=23,value=1324},
						{type=25,value=810},
						{type=27,value=1324},
					},
					-- 27 级
					{
						{type=5,value=9115},
			    		{type=7,value=36370},
						{type=13,value=1501},
						{type=15,value=3278},
						{type=21,value=822},
						{type=23,value=1342},
						{type=25,value=822},
						{type=27,value=1342},
					},
					-- 28 级
					{
						{type=5,value=9289},
			    		{type=7,value=37060},
						{type=13,value=1516},
						{type=15,value=3316},
						{type=21,value=834},
						{type=23,value=1360},
						{type=25,value=834},
						{type=27,value=1360},
					},
					-- 29 级
					{
						{type=5,value=9463},
			    		{type=7,value=37750},
						{type=13,value=1531},
						{type=15,value=3354},
						{type=21,value=846},
						{type=23,value=1378},
						{type=25,value=846},
						{type=27,value=1378},
					},
					-- 30 级
					{
						{type=5,value=9637},
			    		{type=7,value=38440},
						{type=13,value=1546},
						{type=15,value=3392},
						{type=21,value=858},
						{type=23,value=1396},
						{type=25,value=858},
						{type=27,value=1396},
					},
					-- 31 级
					{
						{type=5,value=9811},
			    		{type=7,value=39130},
						{type=13,value=1561},
						{type=15,value=3430},
						{type=21,value=870},
						{type=23,value=1414},
						{type=25,value=870},
						{type=27,value=1414},
					},
					-- 32 级
					{
						{type=5,value=9985},
			    		{type=7,value=39820},
						{type=13,value=1576},
						{type=15,value=3468},
						{type=21,value=882},
						{type=23,value=1432},
						{type=25,value=882},
						{type=27,value=1432},
					},
					-- 33 级
					{
						{type=5,value=15127},
			    		{type=7,value=60388},
						{type=13,value=2872},
						{type=15,value=6186},
						{type=21,value=1532},
						{type=23,value=2520},
						{type=25,value=1532},
						{type=27,value=2520},
					},
					-- 34 级
					{
						{type=5,value=15359},
			    		{type=7,value=61308},
						{type=13,value=2897},
						{type=15,value=6244},
						{type=21,value=1548},
						{type=23,value=2544},
						{type=25,value=1548},
						{type=27,value=2544},
					},
					-- 35 级
					{
						{type=5,value=15591},
			    		{type=7,value=62228},
						{type=13,value=2922},
						{type=15,value=6302},
						{type=21,value=1564},
						{type=23,value=2568},
						{type=25,value=1564},
						{type=27,value=2568},
					},
					-- 36 级
					{
						{type=5,value=15823},
			    		{type=7,value=63148},
						{type=13,value=2947},
						{type=15,value=6360},
						{type=21,value=1580},
						{type=23,value=2592},
						{type=25,value=1580},
						{type=27,value=2592},
					},
					-- 37 级
					{
						{type=5,value=16055},
			    		{type=7,value=64068},
						{type=13,value=2972},
						{type=15,value=6418},
						{type=21,value=1596},
						{type=23,value=2616},
						{type=25,value=1596},
						{type=27,value=2616},
					},
					-- 38 级
					{
						{type=5,value=16287},
			    		{type=7,value=64988},
						{type=13,value=2997},
						{type=15,value=6476},
						{type=21,value=1612},
						{type=23,value=2640},
						{type=25,value=1612},
						{type=27,value=2640},
					},
					-- 39 级
					{
						{type=5,value=16519},
			    		{type=7,value=65908},
						{type=13,value=3022},
						{type=15,value=6534},
						{type=21,value=1628},
						{type=23,value=2664},
						{type=25,value=1628},
						{type=27,value=2664},
					},
					-- 40 级
					{
						{type=5,value=16751},
			    		{type=7,value=66828},
						{type=13,value=3047},
						{type=15,value=6592},
						{type=21,value=1644},
						{type=23,value=2688},
						{type=25,value=1644},
						{type=27,value=2688},
					},
					-- 41 级
					{
						{type=5,value=16983},
			    		{type=7,value=67748},
						{type=13,value=3072},
						{type=15,value=6650},
						{type=21,value=1660},
						{type=23,value=2712},
						{type=25,value=1660},
						{type=27,value=2712},
					},
					-- 42 级
					{
						{type=5,value=17215},
			    		{type=7,value=68668},
						{type=13,value=3097},
						{type=15,value=6708},
						{type=21,value=1676},
						{type=23,value=2736},
						{type=25,value=1676},
						{type=27,value=2736},
					},
					-- 43 级
					{
						{type=5,value=17447},
			    		{type=7,value=69588},
						{type=13,value=3122},
						{type=15,value=6766},
						{type=21,value=1692},
						{type=23,value=2760},
						{type=25,value=1692},
						{type=27,value=2760},
					},

					

					
					-- 44 级
					{
						{type=5,value=25160},
			    		{type=7,value=100440},
						{type=13,value=5234},
						{type=15,value=11154},
						{type=21,value=2742},
						{type=23,value=4538},
						{type=25,value=2742},
						{type=27,value=4538},
					},

					-- 45 级
					{
						{type=5,value=25450},
			    		{type=7,value=101590},
						{type=13,value=5270},
						{type=15,value=11234},
						{type=21,value=2762},
						{type=23,value=4568},
						{type=25,value=2762},
						{type=27,value=4568},
					},

					-- 46 级
					{
						{type=5,value=25740},
			    		{type=7,value=102740},
						{type=13,value=5306},
						{type=15,value=11314},
						{type=21,value=2782},
						{type=23,value=4598},
						{type=25,value=2782},
						{type=27,value=4598},
					},

					-- 47 级
					{
						{type=5,value=26030},
			    		{type=7,value=103890},
						{type=13,value=5342},
						{type=15,value=11394},
						{type=21,value=2802},
						{type=23,value=4628},
						{type=25,value=2802},
						{type=27,value=4628},
					},

					-- 48 级
					{
						{type=5,value=26320},
			    		{type=7,value=105040},
						{type=13,value=5378},
						{type=15,value=11474},
						{type=21,value=2822},
						{type=23,value=4658},
						{type=25,value=2822},
						{type=27,value=4658},
					},

					-- 49 级
					{
						{type=5,value=26610},
			    		{type=7,value=106190},
						{type=13,value=5414},
						{type=15,value=11554},
						{type=21,value=2842},
						{type=23,value=4688},
						{type=25,value=2842},
						{type=27,value=4688},
					},

					-- 50 级
					{
						{type=5,value=26900},
			    		{type=7,value=107340},
						{type=13,value=5450},
						{type=15,value=11634},
						{type=21,value=2862},
						{type=23,value=4718},
						{type=25,value=2862},
						{type=27,value=4718},
					},

					-- 51 级
					{
						{type=5,value=27190},
			    		{type=7,value=108490},
						{type=13,value=5486},
						{type=15,value=11714},
						{type=21,value=2882},
						{type=23,value=4748},
						{type=25,value=2882},
						{type=27,value=4748},
					},

					-- 52 级
					{
						{type=5,value=27480},
			    		{type=7,value=109640},
						{type=13,value=5522},
						{type=15,value=11794},
						{type=21,value=2902},
						{type=23,value=4778},
						{type=25,value=2902},
						{type=27,value=4778},
					},

					-- 53 级
					{
						{type=5,value=27770},
			    		{type=7,value=110790},
						{type=13,value=5558},
						{type=15,value=11874},
						{type=21,value=2922},
						{type=23,value=4808},
						{type=25,value=2922},
						{type=27,value=4808},
					},

					-- 54 级
					{
						{type=5,value=28060},
			    		{type=7,value=111940},
						{type=13,value=5594},
						{type=15,value=11954},
						{type=21,value=2942},
						{type=23,value=4838},
						{type=25,value=2942},
						{type=27,value=4838},
					},

					-- 55 级
					{
						{type=5,value=39114},
			    		{type=7,value=156156},
						{type=13,value=8353},
						{type=15,value=18852},
						{type=21,value=4495},
						{type=23,value=7426},
						{type=25,value=4495},
						{type=27,value=7426},
					},

					-- 56 级
					{
						{type=5,value=39462},
			    		{type=7,value=157536},
						{type=13,value=8392},
						{type=15,value=18950},
						{type=21,value=4519},
						{type=23,value=7462},
						{type=25,value=4519},
						{type=27,value=7462},
					},

					-- 57 级
					{
						{type=5,value=39810},
			    		{type=7,value=158916},
						{type=13,value=8431},
						{type=15,value=19048},
						{type=21,value=4543},
						{type=23,value=7498},
						{type=25,value=4543},
						{type=27,value=7498},
					},

					-- 58 级
					{
						{type=5,value=40158},
			    		{type=7,value=160296},
						{type=13,value=8470},
						{type=15,value=19146},
						{type=21,value=4567},
						{type=23,value=7534},
						{type=25,value=4567},
						{type=27,value=7534},
					},

					-- 59 级
					{
						{type=5,value=40506},
			    		{type=7,value=161676},
						{type=13,value=8509},
						{type=15,value=19244},
						{type=21,value=4591},
						{type=23,value=7570},
						{type=25,value=4591},
						{type=27,value=7570},
					},

					-- 60 级
					{
						{type=5,value=40854},
			    		{type=7,value=163056},
						{type=13,value=8548},
						{type=15,value=19342},
						{type=21,value=4615},
						{type=23,value=7606},
						{type=25,value=4615},
						{type=27,value=7606},
					},

					-- 61 级
					{
						{type=5,value=41202},
			    		{type=7,value=164436},
						{type=13,value=8587},
						{type=15,value=19440},
						{type=21,value=4639},
						{type=23,value=7642},
						{type=25,value=4639},
						{type=27,value=7642},
					},

					-- 62 级
					{
						{type=5,value=41550},
			    		{type=7,value=165816},
						{type=13,value=8626},
						{type=15,value=19538},
						{type=21,value=4663},
						{type=23,value=7678},
						{type=25,value=4663},
						{type=27,value=7678},
					},

					-- 63 级
					{
						{type=5,value=41898},
			    		{type=7,value=167196},
						{type=13,value=8665},
						{type=15,value=19636},
						{type=21,value=4687},
						{type=23,value=7714},
						{type=25,value=4687},
						{type=27,value=7714},
					},

					-- 64 级
					{
						{type=5,value=42246},
			    		{type=7,value=168576},
						{type=13,value=8704},
						{type=15,value=19734},
						{type=21,value=4711},
						{type=23,value=7750},
						{type=25,value=4711},
						{type=27,value=7750},
					},

					-- 65 级
					{
						{type=5,value=42594},
			    		{type=7,value=169956},
						{type=13,value=8743},
						{type=15,value=19832},
						{type=21,value=4735},
						{type=23,value=7786},
						{type=25,value=4735},
						{type=27,value=7786},
					},

					-- 66 级
					{
						{type=5,value=57505},
			    		{type=7,value=229600},
						{type=13,value=12658},
						{type=15,value=29620},
						{type=21,value=6888},
						{type=23,value=11374},
						{type=25,value=6888},
						{type=27,value=11374},
					},

					-- 67 级
					{
						{type=5,value=57911},
			    		{type=7,value=231210},
						{type=13,value=12704},
						{type=15,value=29734},
						{type=21,value=6916},
						{type=23,value=11416},
						{type=25,value=6916},
						{type=27,value=11416},
					},

					-- 68 级
					{
						{type=5,value=58317},
			    		{type=7,value=232820},
						{type=13,value=12750},
						{type=15,value=29848},
						{type=21,value=6944},
						{type=23,value=11458},
						{type=25,value=6944},
						{type=27,value=11458},
					},

					-- 69 级
					{
						{type=5,value=58723},
			    		{type=7,value=234430},
						{type=13,value=12796},
						{type=15,value=29962},
						{type=21,value=6972},
						{type=23,value=11500},
						{type=25,value=6972},
						{type=27,value=11500},
					},

					-- 70 级
					{
						{type=5,value=59129},
			    		{type=7,value=236040},
						{type=13,value=12842},
						{type=15,value=30076},
						{type=21,value=7000},
						{type=23,value=11542},
						{type=25,value=7000},
						{type=27,value=11542},
					},

					-- 71 级
					{
						{type=5,value=59535},
			    		{type=7,value=237650},
						{type=13,value=12888},
						{type=15,value=30190},
						{type=21,value=7028},
						{type=23,value=11584},
						{type=25,value=7028},
						{type=27,value=11584},
					},

					-- 72 级
					{
						{type=5,value=59941},
			    		{type=7,value=239260},
						{type=13,value=12934},
						{type=15,value=30304},
						{type=21,value=7056},
						{type=23,value=11626},
						{type=25,value=7056},
						{type=27,value=11626},
					},

					-- 73 级
					{
						{type=5,value=60347},
			    		{type=7,value=240870},
						{type=13,value=12980},
						{type=15,value=30418},
						{type=21,value=7084},
						{type=23,value=11668},
						{type=25,value=7084},
						{type=27,value=11668},
					},

					-- 74 级
					{
						{type=5,value=60753},
			    		{type=7,value=242480},
						{type=13,value=13026},
						{type=15,value=30532},
						{type=21,value=7112},
						{type=23,value=11710},
						{type=25,value=7112},
						{type=27,value=11710},
					},

					-- 75 级
					{
						{type=5,value=61159},
			    		{type=7,value=244090},
						{type=13,value=13072},
						{type=15,value=30646},
						{type=21,value=7140},
						{type=23,value=11752},
						{type=25,value=7140},
						{type=27,value=11752},
					},

					-- 76 级
					{
						{type=5,value=61565},
			    		{type=7,value=245700},
						{type=13,value=13118},
						{type=15,value=30760},
						{type=21,value=7168},
						{type=23,value=11794},
						{type=25,value=7168},
						{type=27,value=11794},
					},

					-- 77 级
					{
						{type=5,value=80846},
			    		{type=7,value=322824},
						{type=13,value=18353},
						{type=15,value=43848},
						{type=21,value=10101},
						{type=23,value=16682},
						{type=25,value=10101},
						{type=27,value=16682},
					},

					-- 78 级
					{
						{type=5,value=81310},
			    		{type=7,value=324664},
						{type=13,value=18404},
						{type=15,value=43976},
						{type=21,value=10133},
						{type=23,value=16730},
						{type=25,value=10133},
						{type=27,value=16730},
					},

					-- 79 级
					{
						{type=5,value=81774},
			    		{type=7,value=326504},
						{type=13,value=18455},
						{type=15,value=44104},
						{type=21,value=10165},
						{type=23,value=16778},
						{type=25,value=10165},
						{type=27,value=16778},
					},

					-- 80 级
					{
						{type=5,value=82238},
			    		{type=7,value=328344},
						{type=13,value=18506},
						{type=15,value=44232},
						{type=21,value=10197},
						{type=23,value=16826},
						{type=25,value=10197},
						{type=27,value=16826},
					},

					-- 81 级
					{
						{type=5,value=82702},
			    		{type=7,value=330184},
						{type=13,value=18557},
						{type=15,value=44360},
						{type=21,value=10229},
						{type=23,value=16874},
						{type=25,value=10229},
						{type=27,value=16874},
					},

					-- 82 级
					{
						{type=5,value=83166},
			    		{type=7,value=332024},
						{type=13,value=18608},
						{type=15,value=44488},
						{type=21,value=10261},
						{type=23,value=16922},
						{type=25,value=10261},
						{type=27,value=16922},
					},

					-- 83 级
					{
						{type=5,value=83630},
			    		{type=7,value=333864},
						{type=13,value=18659},
						{type=15,value=44616},
						{type=21,value=10293},
						{type=23,value=16970},
						{type=25,value=10293},
						{type=27,value=16970},
					},

					-- 84 级
					{
						{type=5,value=84094},
			    		{type=7,value=335704},
						{type=13,value=18710},
						{type=15,value=44744},
						{type=21,value=10325},
						{type=23,value=17018},
						{type=25,value=10325},
						{type=27,value=17018},
					},

					-- 85 级
					{
						{type=5,value=84558},
			    		{type=7,value=337544},
						{type=13,value=18761},
						{type=15,value=44872},
						{type=21,value=10357},
						{type=23,value=17066},
						{type=25,value=10357},
						{type=27,value=17066},
					},

					-- 86 级
					{
						{type=5,value=85022},
			    		{type=7,value=339384},
						{type=13,value=18812},
						{type=15,value=45000},
						{type=21,value=10389},
						{type=23,value=17114},
						{type=25,value=10389},
						{type=27,value=17114},
					},

					-- 87 级
					{
						{type=5,value=85486},
			    		{type=7,value=341224},
						{type=13,value=18863},
						{type=15,value=45128},
						{type=21,value=10421},
						{type=23,value=17162},
						{type=25,value=10421},
						{type=27,value=17162},
					},

					-- 88 级
					{
						{type=5,value=109908},
			    		{type=7,value=438912},
						{type=13,value=25538},
						{type=15,value=61816},
						{type=21,value=14374},
						{type=23,value=23750},
						{type=25,value=14374},
						{type=27,value=23750},
					},

					-- 89 级
					{
						{type=5,value=110430},
			    		{type=7,value=440982},
						{type=13,value=25594},
						{type=15,value=61956},
						{type=21,value=14410},
						{type=23,value=23804},
						{type=25,value=14410},
						{type=27,value=23804},
					},

					-- 90 级
					{
						{type=5,value=110952},
			    		{type=7,value=443052},
						{type=13,value=25650},
						{type=15,value=62096},
						{type=21,value=14446},
						{type=23,value=23858},
						{type=25,value=14446},
						{type=27,value=23858},
					},

					-- 91 级
					{
						{type=5,value=111474},
			    		{type=7,value=445122},
						{type=13,value=25706},
						{type=15,value=62236},
						{type=21,value=14482},
						{type=23,value=23912},
						{type=25,value=14482},
						{type=27,value=23912},
					},

					-- 92 级
					{
						{type=5,value=111996},
			    		{type=7,value=447192},
						{type=13,value=25762},
						{type=15,value=62376},
						{type=21,value=14518},
						{type=23,value=23966},
						{type=25,value=14518},
						{type=27,value=23966},
					},

					-- 93 级
					{
						{type=5,value=112518},
			    		{type=7,value=449262},
						{type=13,value=25818},
						{type=15,value=62516},
						{type=21,value=14554},
						{type=23,value=24020},
						{type=25,value=14554},
						{type=27,value=24020},
					},

					-- 94 级
					{
						{type=5,value=113040},
			    		{type=7,value=451332},
						{type=13,value=25874},
						{type=15,value=62656},
						{type=21,value=14590},
						{type=23,value=24074},
						{type=25,value=14590},
						{type=27,value=24074},
					},

					-- 95 级
					{
						{type=5,value=113562},
			    		{type=7,value=453402},
						{type=13,value=25930},
						{type=15,value=62796},
						{type=21,value=14626},
						{type=23,value=24128},
						{type=25,value=14626},
						{type=27,value=24128},
					},

					-- 96 级
					{
						{type=5,value=114084},
			    		{type=7,value=455472},
						{type=13,value=25986},
						{type=15,value=62936},
						{type=21,value=14662},
						{type=23,value=24182},
						{type=25,value=14662},
						{type=27,value=24182},
					},

					-- 97 级
					{
						{type=5,value=114606},
			    		{type=7,value=457542},
						{type=13,value=26042},
						{type=15,value=63076},
						{type=21,value=14698},
						{type=23,value=24236},
						{type=25,value=14698},
						{type=27,value=24236},
					},

					-- 98 级
					{
						{type=5,value=115128},
			    		{type=7,value=459612},
						{type=13,value=26098},
						{type=15,value=63216},
						{type=21,value=14734},
						{type=23,value=24290},
						{type=25,value=14734},
						{type=27,value=24290},
					},

					
				},
			},
			-- 道
			{
				itemId = 5948,
				
				inShowIds = {175,176,177,178,299,300,301,302,303}, -- 每阶一个内观
				outShowIds = {175,176,177,178,299,300,301,302,303}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 5951, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,8,8,8,8,8,8,8,8,8,8,4,20,20,20,20,20,20,20,20,20,20,8,40,40,40,40,40,40,40,40,40,40,16,80,80,80,80,80,80,80,80,80,80,
				28,120,120,120,120,120,120,120,120,120,120,42,160,160,160,160,160,160,160,160,160,160,58,200,200,200,200,200,200,200,200,200,200,76,240,240
				,240,240,240,240,240,240,240,240,96,280,280,280,280,280,280,280,280,280,280,},
				
				attrs = {
										-- 0 级
					{
						{type=5,value=2514},
			    		{type=7,value=2514},
						{type=17,value=150},
						{type=19,value=315},
						{type=21,value=76},
						{type=23,value=126},
						{type=25,value=76},
						{type=27,value=126},
					},
					-- 1 级
					{
						{type=5,value=2640},
			    		{type=7,value=2640},
						{type=17,value=155},
						{type=19,value=331},
						{type=21,value=80},
						{type=23,value=132},
						{type=25,value=80},
						{type=27,value=132},
					},
					-- 2 级
					{
						{type=5,value=2766},
			    		{type=7,value=2766},
						{type=17,value=160},
						{type=19,value=347},
						{type=21,value=84},
						{type=23,value=138},
						{type=25,value=84},
						{type=27,value=138},
					},
					-- 3 级
					{
						{type=5,value=2892},
			    		{type=7,value=2892},
						{type=17,value=165},
						{type=19,value=363},
						{type=21,value=88},
						{type=23,value=144},
						{type=25,value=88},
						{type=27,value=144},
					},
					-- 4 级
					{
						{type=5,value=3018},
			    		{type=7,value=3018},
						{type=17,value=170},
						{type=19,value=379},
						{type=21,value=92},
						{type=23,value=150},
						{type=25,value=92},
						{type=27,value=150},
					},
					-- 5 级
					{
						{type=5,value=3144},
			    		{type=7,value=3144},
						{type=17,value=175},
						{type=19,value=395},
						{type=21,value=96},
						{type=23,value=156},
						{type=25,value=96},
						{type=27,value=156},
					},
					-- 6 级
					{
						{type=5,value=3270},
			    		{type=7,value=3270},
						{type=17,value=180},
						{type=19,value=411},
						{type=21,value=100},
						{type=23,value=162},
						{type=25,value=100},
						{type=27,value=162},
					},
					-- 7 级
					{
						{type=5,value=3396},
			    		{type=7,value=3396},
						{type=17,value=185},
						{type=19,value=427},
						{type=21,value=104},
						{type=23,value=168},
						{type=25,value=104},
						{type=27,value=168},
					},
					-- 8 级
					{
						{type=5,value=3522},
			    		{type=7,value=3522},
						{type=17,value=190},
						{type=19,value=443},
						{type=21,value=108},
						{type=23,value=174},
						{type=25,value=108},
						{type=27,value=174},
					},
					-- 9 级
					{
						{type=5,value=3648},
			    		{type=7,value=3648},
						{type=17,value=195},
						{type=19,value=459},
						{type=21,value=112},
						{type=23,value=180},
						{type=25,value=112},
						{type=27,value=180},
					},
					-- 10 级
					{
						{type=5,value=3774},
			    		{type=7,value=3774},
						{type=17,value=200},
						{type=19,value=475},
						{type=21,value=116},
						{type=23,value=186},
						{type=25,value=116},
						{type=27,value=186},
					},
					-- 11 级
					{
						{type=5,value=8244},
			    		{type=7,value=8244},
						{type=17,value=590},
						{type=19,value=1293},
						{type=21,value=312},
						{type=23,value=514},
						{type=25,value=312},
						{type=27,value=514},
					},
					-- 12 级
					{
						{type=5,value=8496},
			    		{type=7,value=8496},
						{type=17,value=600},
						{type=19,value=1318},
						{type=21,value=320},
						{type=23,value=526},
						{type=25,value=320},
						{type=27,value=526},
					},
					-- 13 级
					{
						{type=5,value=8748},
			    		{type=7,value=8748},
						{type=17,value=610},
						{type=19,value=1343},
						{type=21,value=328},
						{type=23,value=538},
						{type=25,value=328},
						{type=27,value=538},
					},
					-- 14 级
					{
						{type=5,value=9000},
			    		{type=7,value=9000},
						{type=17,value=620},
						{type=19,value=1368},
						{type=21,value=336},
						{type=23,value=550},
						{type=25,value=336},
						{type=27,value=550},
					},
					-- 15 级
					{
						{type=5,value=9252},
			    		{type=7,value=9252},
						{type=17,value=630},
						{type=19,value=1393},
						{type=21,value=344},
						{type=23,value=562},
						{type=25,value=344},
						{type=27,value=562},
					},
					-- 16 级
					{
						{type=5,value=9504},
			    		{type=7,value=9504},
						{type=17,value=640},
						{type=19,value=1418},
						{type=21,value=352},
						{type=23,value=574},
						{type=25,value=352},
						{type=27,value=574},
					},
					-- 17 级
					{
						{type=5,value=9756},
			    		{type=7,value=9756},
						{type=17,value=650},
						{type=19,value=1443},
						{type=21,value=360},
						{type=23,value=586},
						{type=25,value=360},
						{type=27,value=586},
					},
					-- 18 级
					{
						{type=5,value=10008},
			    		{type=7,value=10008},
						{type=17,value=660},
						{type=19,value=1468},
						{type=21,value=368},
						{type=23,value=598},
						{type=25,value=368},
						{type=27,value=598},
					},
					-- 19 级
					{
						{type=5,value=10260},
			    		{type=7,value=10260},
						{type=17,value=670},
						{type=19,value=1493},
						{type=21,value=376},
						{type=23,value=610},
						{type=25,value=376},
						{type=27,value=610},
					},
					-- 20 级
					{
						{type=5,value=10512},
			    		{type=7,value=10512},
						{type=17,value=680},
						{type=19,value=1518},
						{type=21,value=384},
						{type=23,value=622},
						{type=25,value=384},
						{type=27,value=622},
					},
					-- 21 级
					{
						{type=5,value=10764},
			    		{type=7,value=10764},
						{type=17,value=690},
						{type=19,value=1543},
						{type=21,value=392},
						{type=23,value=634},
						{type=25,value=392},
						{type=27,value=634},
					},
					-- 22 级
					{
						{type=5,value=17915},
			    		{type=7,value=17915},
						{type=17,value=1426},
						{type=19,value=3088},
						{type=21,value=762},
						{type=23,value=1252},
						{type=25,value=762},
						{type=27,value=1252},
					},
					-- 23 级
					{
						{type=5,value=18293},
			    		{type=7,value=18293},
						{type=17,value=1441},
						{type=19,value=3126},
						{type=21,value=774},
						{type=23,value=1270},
						{type=25,value=774},
						{type=27,value=1270},
					},
					-- 24 级
					{
						{type=5,value=18671},
			    		{type=7,value=18671},
						{type=17,value=1456},
						{type=19,value=3164},
						{type=21,value=786},
						{type=23,value=1288},
						{type=25,value=786},
						{type=27,value=1288},
					},
					-- 25 级
					{
						{type=5,value=19049},
			    		{type=7,value=19049},
						{type=17,value=1471},
						{type=19,value=3202},
						{type=21,value=798},
						{type=23,value=1306},
						{type=25,value=798},
						{type=27,value=1306},
					},
					-- 26 级
					{
						{type=5,value=19427},
			    		{type=7,value=19427},
						{type=17,value=1486},
						{type=19,value=3240},
						{type=21,value=810},
						{type=23,value=1324},
						{type=25,value=810},
						{type=27,value=1324},
					},
					-- 27 级
					{
						{type=5,value=19805},
			    		{type=7,value=19805},
						{type=17,value=1501},
						{type=19,value=3278},
						{type=21,value=822},
						{type=23,value=1342},
						{type=25,value=822},
						{type=27,value=1342},
					},
					-- 28 级
					{
						{type=5,value=20183},
			    		{type=7,value=20183},
						{type=17,value=1516},
						{type=19,value=3316},
						{type=21,value=834},
						{type=23,value=1360},
						{type=25,value=834},
						{type=27,value=1360},
					},
					-- 29 级
					{
						{type=5,value=20561},
			    		{type=7,value=20561},
						{type=17,value=1531},
						{type=19,value=3354},
						{type=21,value=846},
						{type=23,value=1378},
						{type=25,value=846},
						{type=27,value=1378},
					},
					-- 30 级
					{
						{type=5,value=20939},
			    		{type=7,value=20939},
						{type=17,value=1546},
						{type=19,value=3392},
						{type=21,value=858},
						{type=23,value=1396},
						{type=25,value=858},
						{type=27,value=1396},
					},
					-- 31 级
					{
						{type=5,value=21317},
			    		{type=7,value=21317},
						{type=17,value=1561},
						{type=19,value=3430},
						{type=21,value=870},
						{type=23,value=1414},
						{type=25,value=870},
						{type=27,value=1414},
					},
					-- 32 级
					{
						{type=5,value=21695},
			    		{type=7,value=21695},
						{type=17,value=1576},
						{type=19,value=3468},
						{type=21,value=882},
						{type=23,value=1432},
						{type=25,value=882},
						{type=27,value=1432},
					},
					-- 33 级
					{
						{type=5,value=32869},
			    		{type=7,value=32869},
						{type=17,value=2872},
						{type=19,value=6186},
						{type=21,value=1532},
						{type=23,value=2520},
						{type=25,value=1532},
						{type=27,value=2520},
					},
					-- 34 级
					{
						{type=5,value=33373},
			    		{type=7,value=33373},
						{type=17,value=2897},
						{type=19,value=6244},
						{type=21,value=1548},
						{type=23,value=2544},
						{type=25,value=1548},
						{type=27,value=2544},
					},
					-- 35 级
					{
						{type=5,value=33877},
			    		{type=7,value=33877},
						{type=17,value=2922},
						{type=19,value=6302},
						{type=21,value=1564},
						{type=23,value=2568},
						{type=25,value=1564},
						{type=27,value=2568},
					},
					-- 36 级
					{
						{type=5,value=34381},
			    		{type=7,value=34381},
						{type=17,value=2947},
						{type=19,value=6360},
						{type=21,value=1580},
						{type=23,value=2592},
						{type=25,value=1580},
						{type=27,value=2592},
					},
					-- 37 级
					{
						{type=5,value=34885},
			    		{type=7,value=34885},
						{type=17,value=2972},
						{type=19,value=6418},
						{type=21,value=1596},
						{type=23,value=2616},
						{type=25,value=1596},
						{type=27,value=2616},
					},
					-- 38 级
					{
						{type=5,value=35389},
			    		{type=7,value=35389},
						{type=17,value=2997},
						{type=19,value=6476},
						{type=21,value=1612},
						{type=23,value=2640},
						{type=25,value=1612},
						{type=27,value=2640},
					},
					-- 39 级
					{
						{type=5,value=35893},
			    		{type=7,value=35893},
						{type=17,value=3022},
						{type=19,value=6534},
						{type=21,value=1628},
						{type=23,value=2664},
						{type=25,value=1628},
						{type=27,value=2664},
					},
					-- 40 级
					{
						{type=5,value=36397},
			    		{type=7,value=36397},
						{type=17,value=3047},
						{type=19,value=6592},
						{type=21,value=1644},
						{type=23,value=2688},
						{type=25,value=1644},
						{type=27,value=2688},
					},
					-- 41 级
					{
						{type=5,value=36901},
			    		{type=7,value=36901},
						{type=17,value=3072},
						{type=19,value=6650},
						{type=21,value=1660},
						{type=23,value=2712},
						{type=25,value=1660},
						{type=27,value=2712},
					},
					-- 42 级
					{
						{type=5,value=37405},
			    		{type=7,value=37405},
						{type=17,value=3097},
						{type=19,value=6708},
						{type=21,value=1676},
						{type=23,value=2736},
						{type=25,value=1676},
						{type=27,value=2736},
					},
					-- 43 级
					{
						{type=5,value=37909},
			    		{type=7,value=37909},
						{type=17,value=3122},
						{type=19,value=6766},
						{type=21,value=1692},
						{type=23,value=2760},
						{type=25,value=1692},
						{type=27,value=2760},
					},

					
					-- 44 级
					{
						{type=5,value=54669},
			    		{type=7,value=54669},
						{type=17,value=5234},
						{type=19,value=11154},
						{type=21,value=2742},
						{type=23,value=4538},
						{type=25,value=2742},
						{type=27,value=4538},
					},

					-- 45 级
					{
						{type=5,value=55299},
			    		{type=7,value=55299},
						{type=17,value=5270},
						{type=19,value=11234},
						{type=21,value=2762},
						{type=23,value=4568},
						{type=25,value=2762},
						{type=27,value=4568},
					},

					-- 46 级
					{
						{type=5,value=55929},
			    		{type=7,value=55929},
						{type=17,value=5306},
						{type=19,value=11314},
						{type=21,value=2782},
						{type=23,value=4598},
						{type=25,value=2782},
						{type=27,value=4598},
					},

					-- 47 级
					{
						{type=5,value=56559},
			    		{type=7,value=56559},
						{type=17,value=5342},
						{type=19,value=11394},
						{type=21,value=2802},
						{type=23,value=4628},
						{type=25,value=2802},
						{type=27,value=4628},
					},

					-- 48 级
					{
						{type=5,value=57189},
			    		{type=7,value=57189},
						{type=17,value=5378},
						{type=19,value=11474},
						{type=21,value=2822},
						{type=23,value=4658},
						{type=25,value=2822},
						{type=27,value=4658},
					},

					-- 49 级
					{
						{type=5,value=57819},
			    		{type=7,value=57819},
						{type=17,value=5414},
						{type=19,value=11554},
						{type=21,value=2842},
						{type=23,value=4688},
						{type=25,value=2842},
						{type=27,value=4688},
					},

					-- 50 级
					{
						{type=5,value=58449},
			    		{type=7,value=58449},
						{type=17,value=5450},
						{type=19,value=11634},
						{type=21,value=2862},
						{type=23,value=4718},
						{type=25,value=2862},
						{type=27,value=4718},
					},

					-- 51 级
					{
						{type=5,value=59079},
			    		{type=7,value=59079},
						{type=17,value=5486},
						{type=19,value=11714},
						{type=21,value=2882},
						{type=23,value=4748},
						{type=25,value=2882},
						{type=27,value=4748},
					},

					-- 52 级
					{
						{type=5,value=59709},
			    		{type=7,value=59709},
						{type=17,value=5522},
						{type=19,value=11794},
						{type=21,value=2902},
						{type=23,value=4778},
						{type=25,value=2902},
						{type=27,value=4778},
					},

					-- 53 级
					{
						{type=5,value=60339},
			    		{type=7,value=60339},
						{type=17,value=5558},
						{type=19,value=11874},
						{type=21,value=2922},
						{type=23,value=4808},
						{type=25,value=2922},
						{type=27,value=4808},
					},

					-- 54 级
					{
						{type=5,value=60969},
			    		{type=7,value=60969},
						{type=17,value=5594},
						{type=19,value=11954},
						{type=21,value=2942},
						{type=23,value=4838},
						{type=25,value=2942},
						{type=27,value=4838},
					},

					-- 55 级
					{
						{type=5,value=84992},
			    		{type=7,value=84992},
						{type=17,value=8353},
						{type=19,value=18852},
						{type=21,value=4495},
						{type=23,value=7426},
						{type=25,value=4495},
						{type=27,value=7426},
					},

					-- 56 级
					{
						{type=5,value=85748},
			    		{type=7,value=85748},
						{type=17,value=8392},
						{type=19,value=18950},
						{type=21,value=4519},
						{type=23,value=7462},
						{type=25,value=4519},
						{type=27,value=7462},
					},

					-- 57 级
					{
						{type=5,value=86504},
			    		{type=7,value=86504},
						{type=17,value=8431},
						{type=19,value=19048},
						{type=21,value=4543},
						{type=23,value=7498},
						{type=25,value=4543},
						{type=27,value=7498},
					},

					-- 58 级
					{
						{type=5,value=87260},
			    		{type=7,value=87260},
						{type=17,value=8470},
						{type=19,value=19146},
						{type=21,value=4567},
						{type=23,value=7534},
						{type=25,value=4567},
						{type=27,value=7534},
					},

					-- 59 级
					{
						{type=5,value=88016},
			    		{type=7,value=88016},
						{type=17,value=8509},
						{type=19,value=19244},
						{type=21,value=4591},
						{type=23,value=7570},
						{type=25,value=4591},
						{type=27,value=7570},
					},

					-- 60 级
					{
						{type=5,value=88772},
			    		{type=7,value=88772},
						{type=17,value=8548},
						{type=19,value=19342},
						{type=21,value=4615},
						{type=23,value=7606},
						{type=25,value=4615},
						{type=27,value=7606},
					},

					-- 61 级
					{
						{type=5,value=89528},
			    		{type=7,value=89528},
						{type=17,value=8587},
						{type=19,value=19440},
						{type=21,value=4639},
						{type=23,value=7642},
						{type=25,value=4639},
						{type=27,value=7642},
					},

					-- 62 级
					{
						{type=5,value=90284},
			    		{type=7,value=90284},
						{type=17,value=8626},
						{type=19,value=19538},
						{type=21,value=4663},
						{type=23,value=7678},
						{type=25,value=4663},
						{type=27,value=7678},
					},

					-- 63 级
					{
						{type=5,value=91040},
			    		{type=7,value=91040},
						{type=17,value=8665},
						{type=19,value=19636},
						{type=21,value=4687},
						{type=23,value=7714},
						{type=25,value=4687},
						{type=27,value=7714},
					},

					-- 64 级
					{
						{type=5,value=91796},
			    		{type=7,value=91796},
						{type=17,value=8704},
						{type=19,value=19734},
						{type=21,value=4711},
						{type=23,value=7750},
						{type=25,value=4711},
						{type=27,value=7750},
					},

					-- 65 级
					{
						{type=5,value=92552},
			    		{type=7,value=92552},
						{type=17,value=8743},
						{type=19,value=19832},
						{type=21,value=4735},
						{type=23,value=7786},
						{type=25,value=4735},
						{type=27,value=7786},
					},

					-- 66 级
					{
						{type=5,value=124955},
			    		{type=7,value=124955},
						{type=17,value=12658},
						{type=19,value=29620},
						{type=21,value=6888},
						{type=23,value=11374},
						{type=25,value=6888},
						{type=27,value=11374},
					},

					-- 67 级
					{
						{type=5,value=125837},
			    		{type=7,value=125837},
						{type=17,value=12704},
						{type=19,value=29734},
						{type=21,value=6916},
						{type=23,value=11416},
						{type=25,value=6916},
						{type=27,value=11416},
					},

					-- 68 级
					{
						{type=5,value=126719},
			    		{type=7,value=126719},
						{type=17,value=12750},
						{type=19,value=29848},
						{type=21,value=6944},
						{type=23,value=11458},
						{type=25,value=6944},
						{type=27,value=11458},
					},

					-- 69 级
					{
						{type=5,value=127601},
			    		{type=7,value=127601},
						{type=17,value=12796},
						{type=19,value=29962},
						{type=21,value=6972},
						{type=23,value=11500},
						{type=25,value=6972},
						{type=27,value=11500},
					},

					-- 70 级
					{
						{type=5,value=128483},
			    		{type=7,value=128483},
						{type=17,value=12842},
						{type=19,value=30076},
						{type=21,value=7000},
						{type=23,value=11542},
						{type=25,value=7000},
						{type=27,value=11542},
					},

					-- 71 级
					{
						{type=5,value=129365},
			    		{type=7,value=129365},
						{type=17,value=12888},
						{type=19,value=30190},
						{type=21,value=7028},
						{type=23,value=11584},
						{type=25,value=7028},
						{type=27,value=11584},
					},

					-- 72 级
					{
						{type=5,value=130247},
			    		{type=7,value=130247},
						{type=17,value=12934},
						{type=19,value=30304},
						{type=21,value=7056},
						{type=23,value=11626},
						{type=25,value=7056},
						{type=27,value=11626},
					},

					-- 73 级
					{
						{type=5,value=131129},
			    		{type=7,value=131129},
						{type=17,value=12980},
						{type=19,value=30418},
						{type=21,value=7084},
						{type=23,value=11668},
						{type=25,value=7084},
						{type=27,value=11668},
					},

					-- 74 级
					{
						{type=5,value=132011},
			    		{type=7,value=132011},
						{type=17,value=13026},
						{type=19,value=30532},
						{type=21,value=7112},
						{type=23,value=11710},
						{type=25,value=7112},
						{type=27,value=11710},
					},

					-- 75 级
					{
						{type=5,value=132893},
			    		{type=7,value=132893},
						{type=17,value=13072},
						{type=19,value=30646},
						{type=21,value=7140},
						{type=23,value=11752},
						{type=25,value=7140},
						{type=27,value=11752},
					},

					-- 76 级
					{
						{type=5,value=133775},
			    		{type=7,value=133775},
						{type=17,value=13118},
						{type=19,value=30760},
						{type=21,value=7168},
						{type=23,value=11794},
						{type=25,value=7168},
						{type=27,value=11794},
					},

					-- 77 级
					{
						{type=5,value=150535},
			    		{type=7,value=150535},
						{type=17,value=18353},
						{type=19,value=43848},
						{type=21,value=10101},
						{type=23,value=16682},
						{type=25,value=10101},
						{type=27,value=16682},
					},

					-- 78 级
					{
						{type=5,value=151543},
			    		{type=7,value=151543},
						{type=17,value=18404},
						{type=19,value=43976},
						{type=21,value=10133},
						{type=23,value=16730},
						{type=25,value=10133},
						{type=27,value=16730},
					},

					-- 79 级
					{
						{type=5,value=152551},
			    		{type=7,value=152551},
						{type=17,value=18455},
						{type=19,value=44104},
						{type=21,value=10165},
						{type=23,value=16778},
						{type=25,value=10165},
						{type=27,value=16778},
					},

					-- 80 级
					{
						{type=5,value=153559},
			    		{type=7,value=153559},
						{type=17,value=18506},
						{type=19,value=44232},
						{type=21,value=10197},
						{type=23,value=16826},
						{type=25,value=10197},
						{type=27,value=16826},
					},

					-- 81 级
					{
						{type=5,value=154567},
			    		{type=7,value=154567},
						{type=17,value=18557},
						{type=19,value=44360},
						{type=21,value=10229},
						{type=23,value=16874},
						{type=25,value=10229},
						{type=27,value=16874},
					},

					-- 82 级
					{
						{type=5,value=155575},
			    		{type=7,value=155575},
						{type=17,value=18608},
						{type=19,value=44488},
						{type=21,value=10261},
						{type=23,value=16922},
						{type=25,value=10261},
						{type=27,value=16922},
					},

					-- 83 级
					{
						{type=5,value=156583},
			    		{type=7,value=156583},
						{type=17,value=18659},
						{type=19,value=44616},
						{type=21,value=10293},
						{type=23,value=16970},
						{type=25,value=10293},
						{type=27,value=16970},
					},

					-- 84 级
					{
						{type=5,value=157591},
			    		{type=7,value=157591},
						{type=17,value=18710},
						{type=19,value=44744},
						{type=21,value=10325},
						{type=23,value=17018},
						{type=25,value=10325},
						{type=27,value=17018},
					},

					-- 85 级
					{
						{type=5,value=158599},
			    		{type=7,value=158599},
						{type=17,value=18761},
						{type=19,value=44872},
						{type=21,value=10357},
						{type=23,value=17066},
						{type=25,value=10357},
						{type=27,value=17066},
					},

					-- 86 级
					{
						{type=5,value=159607},
			    		{type=7,value=159607},
						{type=17,value=18812},
						{type=19,value=45000},
						{type=21,value=10389},
						{type=23,value=17114},
						{type=25,value=10389},
						{type=27,value=17114},
					},

					-- 87 级
					{
						{type=5,value=160615},
			    		{type=7,value=160615},
						{type=17,value=18863},
						{type=19,value=45128},
						{type=21,value=10421},
						{type=23,value=17162},
						{type=25,value=10421},
						{type=27,value=17162},
					},

					-- 88 级
					{
						{type=5,value=177375},
			    		{type=7,value=177375},
						{type=17,value=25538},
						{type=19,value=61816},
						{type=21,value=14374},
						{type=23,value=23750},
						{type=25,value=14374},
						{type=27,value=23750},
					},

					-- 89 级
					{
						{type=5,value=178509},
			    		{type=7,value=178509},
						{type=17,value=25594},
						{type=19,value=61956},
						{type=21,value=14410},
						{type=23,value=23804},
						{type=25,value=14410},
						{type=27,value=23804},
					},

					-- 90 级
					{
						{type=5,value=179643},
			    		{type=7,value=179643},
						{type=17,value=25650},
						{type=19,value=62096},
						{type=21,value=14446},
						{type=23,value=23858},
						{type=25,value=14446},
						{type=27,value=23858},
					},

					-- 91 级
					{
						{type=5,value=180777},
			    		{type=7,value=180777},
						{type=17,value=25706},
						{type=19,value=62236},
						{type=21,value=14482},
						{type=23,value=23912},
						{type=25,value=14482},
						{type=27,value=23912},
					},

					-- 92 级
					{
						{type=5,value=181911},
			    		{type=7,value=181911},
						{type=17,value=25762},
						{type=19,value=62376},
						{type=21,value=14518},
						{type=23,value=23966},
						{type=25,value=14518},
						{type=27,value=23966},
					},

					-- 93 级
					{
						{type=5,value=183045},
			    		{type=7,value=183045},
						{type=17,value=25818},
						{type=19,value=62516},
						{type=21,value=14554},
						{type=23,value=24020},
						{type=25,value=14554},
						{type=27,value=24020},
					},

					-- 94 级
					{
						{type=5,value=184179},
			    		{type=7,value=184179},
						{type=17,value=25874},
						{type=19,value=62656},
						{type=21,value=14590},
						{type=23,value=24074},
						{type=25,value=14590},
						{type=27,value=24074},
					},

					-- 95 级
					{
						{type=5,value=185313},
			    		{type=7,value=185313},
						{type=17,value=25930},
						{type=19,value=62796},
						{type=21,value=14626},
						{type=23,value=24128},
						{type=25,value=14626},
						{type=27,value=24128},
					},

					-- 96 级
					{
						{type=5,value=186447},
			    		{type=7,value=186447},
						{type=17,value=25986},
						{type=19,value=62936},
						{type=21,value=14662},
						{type=23,value=24182},
						{type=25,value=14662},
						{type=27,value=24182},
					},

					-- 97 级
					{
						{type=5,value=187581},
			    		{type=7,value=187581},
						{type=17,value=26042},
						{type=19,value=63076},
						{type=21,value=14698},
						{type=23,value=24236},
						{type=25,value=14698},
						{type=27,value=24236},
					},

					-- 98 级
					{
						{type=5,value=188715},
			    		{type=7,value=188715},
						{type=17,value=26098},
						{type=19,value=63216},
						{type=21,value=14734},
						{type=23,value=24290},
						{type=25,value=14734},
						{type=27,value=24290},
					},
				},
			},
		},
		----------------------------- 时装 3 沙僧
				{
			-- 战
			{
				itemId = 5949, --升阶所需道具
				
				inShowIds = {179,180,181,182,304,305,306,307,308}, -- 每阶一个内观
				outShowIds = {179,180,181,182,304,305,306,307,308}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 5951, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,8,8,8,8,8,8,8,8,8,8,4,20,20,20,20,20,20,20,20,20,20,8,40,40,40,40,40,40,40,40,40,40,16,80,80,80,80,80,80,80,80,80,80,
				28,120,120,120,120,120,120,120,120,120,120,42,160,160,160,160,160,160,160,160,160,160,58,200,200,200,200,200,200,200,200,200,200,76,240,240
				,240,240,240,240,240,240,240,240,96,280,280,280,280,280,280,280,280,280,280,},
				
					-- --模块
					-- -- (a1) 级
					-- {
					-- 	{type=(a2),value=(a3)},
			    	-- 	{type=(a4),value=(a5)},
					-- 	{type=(a6),value=(a7)},
					-- 	{type=(a8),value=(a9)},
					-- 	{type=(a10),value=(a11)},
					-- 	{type=(a12),value=(a13)},
					-- 	{type=(a14),value=(a15)},
					-- 	{type=(a16),value=(a17)},
					-- },


				attrs = {
										-- 0 级
					{
						{type=5,value=4500},
			    		{type=7,value=455},
						{type=9,value=150},
						{type=11,value=315},
						{type=21,value=76},
						{type=23,value=126},
						{type=25,value=76},
						{type=27,value=126},
					},
					-- 1 级
					{
						{type=5,value=4725},
			    		{type=7,value=477},
						{type=9,value=155},
						{type=11,value=331},
						{type=21,value=80},
						{type=23,value=132},
						{type=25,value=80},
						{type=27,value=132},
					},
					-- 2 级
					{
						{type=5,value=4950},
			    		{type=7,value=499},
						{type=9,value=160},
						{type=11,value=347},
						{type=21,value=84},
						{type=23,value=138},
						{type=25,value=84},
						{type=27,value=138},
					},
					-- 3 级
					{
						{type=5,value=5175},
			    		{type=7,value=521},
						{type=9,value=165},
						{type=11,value=363},
						{type=21,value=88},
						{type=23,value=144},
						{type=25,value=88},
						{type=27,value=144},
					},
					-- 4 级
					{
						{type=5,value=5400},
			    		{type=7,value=543},
						{type=9,value=170},
						{type=11,value=379},
						{type=21,value=92},
						{type=23,value=150},
						{type=25,value=92},
						{type=27,value=150},
					},
					-- 5 级
					{
						{type=5,value=5625},
			    		{type=7,value=565},
						{type=9,value=175},
						{type=11,value=395},
						{type=21,value=96},
						{type=23,value=156},
						{type=25,value=96},
						{type=27,value=156},
					},
					-- 6 级
					{
						{type=5,value=5850},
			    		{type=7,value=587},
						{type=9,value=180},
						{type=11,value=411},
						{type=21,value=100},
						{type=23,value=162},
						{type=25,value=100},
						{type=27,value=162},
					},
					-- 7 级
					{
						{type=5,value=6075},
			    		{type=7,value=609},
						{type=9,value=185},
						{type=11,value=427},
						{type=21,value=104},
						{type=23,value=168},
						{type=25,value=104},
						{type=27,value=168},
					},
					-- 8 级
					{
						{type=5,value=6300},
			    		{type=7,value=631},
						{type=9,value=190},
						{type=11,value=443},
						{type=21,value=108},
						{type=23,value=174},
						{type=25,value=108},
						{type=27,value=174},
					},
					-- 9 级
					{
						{type=5,value=6525},
			    		{type=7,value=653},
						{type=9,value=195},
						{type=11,value=459},
						{type=21,value=112},
						{type=23,value=180},
						{type=25,value=112},
						{type=27,value=180},
					},
					-- 10 级
					{
						{type=5,value=6750},
			    		{type=7,value=675},
						{type=9,value=200},
						{type=11,value=475},
						{type=21,value=116},
						{type=23,value=186},
						{type=25,value=116},
						{type=27,value=186},
					},
					-- 11 级
					{
						{type=5,value=14750},
			    		{type=7,value=1483},
						{type=9,value=590},
						{type=11,value=1293},
						{type=21,value=312},
						{type=23,value=514},
						{type=25,value=312},
						{type=27,value=514},
					},
					-- 12 级
					{
						{type=5,value=15200},
			    		{type=7,value=1527},
						{type=9,value=600},
						{type=11,value=1318},
						{type=21,value=320},
						{type=23,value=526},
						{type=25,value=320},
						{type=27,value=526},
					},
					-- 13 级
					{
						{type=5,value=15650},
			    		{type=7,value=1571},
						{type=9,value=610},
						{type=11,value=1343},
						{type=21,value=328},
						{type=23,value=538},
						{type=25,value=328},
						{type=27,value=538},
					},
					-- 14 级
					{
						{type=5,value=16100},
			    		{type=7,value=1615},
						{type=9,value=620},
						{type=11,value=1368},
						{type=21,value=336},
						{type=23,value=550},
						{type=25,value=336},
						{type=27,value=550},
					},
					-- 15 级
					{
						{type=5,value=16550},
			    		{type=7,value=1659},
						{type=9,value=630},
						{type=11,value=1393},
						{type=21,value=344},
						{type=23,value=562},
						{type=25,value=344},
						{type=27,value=562},
					},
					-- 16 级
					{
						{type=5,value=17000},
			    		{type=7,value=1703},
						{type=9,value=640},
						{type=11,value=1418},
						{type=21,value=352},
						{type=23,value=574},
						{type=25,value=352},
						{type=27,value=574},
					},
					-- 17 级
					{
						{type=5,value=17450},
			    		{type=7,value=1747},
						{type=9,value=650},
						{type=11,value=1443},
						{type=21,value=360},
						{type=23,value=586},
						{type=25,value=360},
						{type=27,value=586},
					},
					-- 18 级
					{
						{type=5,value=17900},
			    		{type=7,value=1791},
						{type=9,value=660},
						{type=11,value=1468},
						{type=21,value=368},
						{type=23,value=598},
						{type=25,value=368},
						{type=27,value=598},
					},
					-- 19 级
					{
						{type=5,value=18350},
			    		{type=7,value=1835},
						{type=9,value=670},
						{type=11,value=1493},
						{type=21,value=376},
						{type=23,value=610},
						{type=25,value=376},
						{type=27,value=610},
					},
					-- 20 级
					{
						{type=5,value=18800},
			    		{type=7,value=1879},
						{type=9,value=680},
						{type=11,value=1518},
						{type=21,value=384},
						{type=23,value=622},
						{type=25,value=384},
						{type=27,value=622},
					},
					-- 21 级
					{
						{type=5,value=19250},
			    		{type=7,value=1923},
						{type=9,value=690},
						{type=11,value=1543},
						{type=21,value=392},
						{type=23,value=634},
						{type=25,value=392},
						{type=27,value=634},
					},
					-- 22 级
					{
						{type=5,value=32050},
			    		{type=7,value=3216},
						{type=9,value=1426},
						{type=11,value=3088},
						{type=21,value=762},
						{type=23,value=1252},
						{type=25,value=762},
						{type=27,value=1252},
					},
					-- 23 级
					{
						{type=5,value=32725},
			    		{type=7,value=3282},
						{type=9,value=1441},
						{type=11,value=3126},
						{type=21,value=774},
						{type=23,value=1270},
						{type=25,value=774},
						{type=27,value=1270},
					},
					-- 24 级
					{
						{type=5,value=33400},
			    		{type=7,value=3348},
						{type=9,value=1456},
						{type=11,value=3164},
						{type=21,value=786},
						{type=23,value=1288},
						{type=25,value=786},
						{type=27,value=1288},
					},
					-- 25 级
					{
						{type=5,value=34075},
			    		{type=7,value=3414},
						{type=9,value=1471},
						{type=11,value=3202},
						{type=21,value=798},
						{type=23,value=1306},
						{type=25,value=798},
						{type=27,value=1306},
					},
					-- 26 级
					{
						{type=5,value=34750},
			    		{type=7,value=3480},
						{type=9,value=1486},
						{type=11,value=3240},
						{type=21,value=810},
						{type=23,value=1324},
						{type=25,value=810},
						{type=27,value=1324},
					},
					-- 27 级
					{
						{type=5,value=35425},
			    		{type=7,value=3546},
						{type=9,value=1501},
						{type=11,value=3278},
						{type=21,value=822},
						{type=23,value=1342},
						{type=25,value=822},
						{type=27,value=1342},
					},
					-- 28 级
					{
						{type=5,value=36100},
			    		{type=7,value=3612},
						{type=9,value=1516},
						{type=11,value=3316},
						{type=21,value=834},
						{type=23,value=1360},
						{type=25,value=834},
						{type=27,value=1360},
					},
					-- 29 级
					{
						{type=5,value=36775},
			    		{type=7,value=3678},
						{type=9,value=1531},
						{type=11,value=3354},
						{type=21,value=846},
						{type=23,value=1378},
						{type=25,value=846},
						{type=27,value=1378},
					},
					-- 30 级
					{
						{type=5,value=37450},
			    		{type=7,value=3744},
						{type=9,value=1546},
						{type=11,value=3392},
						{type=21,value=858},
						{type=23,value=1396},
						{type=25,value=858},
						{type=27,value=1396},
					},
					-- 31 级
					{
						{type=5,value=38125},
			    		{type=7,value=3810},
						{type=9,value=1561},
						{type=11,value=3430},
						{type=21,value=870},
						{type=23,value=1414},
						{type=25,value=870},
						{type=27,value=1414},
					},
					-- 32 级
					{
						{type=5,value=38800},
			    		{type=7,value=3876},
						{type=9,value=1576},
						{type=11,value=3468},
						{type=21,value=882},
						{type=23,value=1432},
						{type=25,value=882},
						{type=27,value=1432},
					},
					-- 33 级
					{
						{type=5,value=58800},
			    		{type=7,value=5896},
						{type=9,value=2872},
						{type=11,value=6186},
						{type=21,value=1532},
						{type=23,value=2520},
						{type=25,value=1532},
						{type=27,value=2520},
					},
					-- 34 级
					{
						{type=5,value=59700},
			    		{type=7,value=5984},
						{type=9,value=2897},
						{type=11,value=6244},
						{type=21,value=1548},
						{type=23,value=2544},
						{type=25,value=1548},
						{type=27,value=2544},
					},
					-- 35 级
					{
						{type=5,value=60600},
			    		{type=7,value=6072},
						{type=9,value=2922},
						{type=11,value=6302},
						{type=21,value=1564},
						{type=23,value=2568},
						{type=25,value=1564},
						{type=27,value=2568},
					},
					-- 36 级
					{
						{type=5,value=61500},
			    		{type=7,value=6160},
						{type=9,value=2947},
						{type=11,value=6360},
						{type=21,value=1580},
						{type=23,value=2592},
						{type=25,value=1580},
						{type=27,value=2592},
					},
					-- 37 级
					{
						{type=5,value=62400},
			    		{type=7,value=6248},
						{type=9,value=2972},
						{type=11,value=6418},
						{type=21,value=1596},
						{type=23,value=2616},
						{type=25,value=1596},
						{type=27,value=2616},
					},
					-- 38 级
					{
						{type=5,value=63300},
			    		{type=7,value=6336},
						{type=9,value=2997},
						{type=11,value=6476},
						{type=21,value=1612},
						{type=23,value=2640},
						{type=25,value=1612},
						{type=27,value=2640},
					},
					-- 39 级
					{
						{type=5,value=64200},
			    		{type=7,value=6424},
						{type=9,value=3022},
						{type=11,value=6534},
						{type=21,value=1628},
						{type=23,value=2664},
						{type=25,value=1628},
						{type=27,value=2664},
					},
					-- 40 级
					{
						{type=5,value=65100},
			    		{type=7,value=6512},
						{type=9,value=3047},
						{type=11,value=6592},
						{type=21,value=1644},
						{type=23,value=2688},
						{type=25,value=1644},
						{type=27,value=2688},
					},
					-- 41 级
					{
						{type=5,value=66000},
			    		{type=7,value=6600},
						{type=9,value=3072},
						{type=11,value=6650},
						{type=21,value=1660},
						{type=23,value=2712},
						{type=25,value=1660},
						{type=27,value=2712},
					},
					-- 42 级
					{
						{type=5,value=66900},
			    		{type=7,value=6688},
						{type=9,value=3097},
						{type=11,value=6708},
						{type=21,value=1676},
						{type=23,value=2736},
						{type=25,value=1676},
						{type=27,value=2736},
					},
					-- 43 级
					{
						{type=5,value=67800},
			    		{type=7,value=6776},
						{type=9,value=3122},
						{type=11,value=6766},
						{type=21,value=1692},
						{type=23,value=2760},
						{type=25,value=1692},
						{type=27,value=2760},
					},


					
										-- 44 级
					{
						{type=5,value=97800},
			    		{type=7,value=9806},
						{type=9,value=5234},
						{type=11,value=11154},
						{type=21,value=2742},
						{type=23,value=4538},
						{type=25,value=2742},
						{type=27,value=4538},
					},
					-- 45 级
					{
						{type=5,value=98925},
			    		{type=7,value=9916},
						{type=9,value=5270},
						{type=11,value=11234},
						{type=21,value=2762},
						{type=23,value=4568},
						{type=25,value=2762},
						{type=27,value=4568},
					},
					-- 46 级
					{
						{type=5,value=100050},
			    		{type=7,value=10026},
						{type=9,value=5306},
						{type=11,value=11314},
						{type=21,value=2782},
						{type=23,value=4598},
						{type=25,value=2782},
						{type=27,value=4598},
					},
					-- 47 级
					{
						{type=5,value=101175},
			    		{type=7,value=10136},
						{type=9,value=5342},
						{type=11,value=11394},
						{type=21,value=2802},
						{type=23,value=4628},
						{type=25,value=2802},
						{type=27,value=4628},
					},
					-- 48 级
					{
						{type=5,value=102300},
			    		{type=7,value=10246},
						{type=9,value=5378},
						{type=11,value=11474},
						{type=21,value=2822},
						{type=23,value=4658},
						{type=25,value=2822},
						{type=27,value=4658},
					},
					-- 49 级
					{
						{type=5,value=103425},
			    		{type=7,value=10356},
						{type=9,value=5414},
						{type=11,value=11554},
						{type=21,value=2842},
						{type=23,value=4688},
						{type=25,value=2842},
						{type=27,value=4688},
					},
					-- 50 级
					{
						{type=5,value=104550},
			    		{type=7,value=10466},
						{type=9,value=5450},
						{type=11,value=11634},
						{type=21,value=2862},
						{type=23,value=4718},
						{type=25,value=2862},
						{type=27,value=4718},
					},
					-- 51 级
					{
						{type=5,value=105675},
			    		{type=7,value=10576},
						{type=9,value=5486},
						{type=11,value=11714},
						{type=21,value=2882},
						{type=23,value=4748},
						{type=25,value=2882},
						{type=27,value=4748},
					},
					-- 52 级
					{
						{type=5,value=106800},
			    		{type=7,value=10686},
						{type=9,value=5522},
						{type=11,value=11794},
						{type=21,value=2902},
						{type=23,value=4778},
						{type=25,value=2902},
						{type=27,value=4778},
					},
					-- 53 级
					{
						{type=5,value=107925},
			    		{type=7,value=10796},
						{type=9,value=5558},
						{type=11,value=11874},
						{type=21,value=2922},
						{type=23,value=4808},
						{type=25,value=2922},
						{type=27,value=4808},
					},
					-- 54 级
					{
						{type=5,value=109050},
			    		{type=7,value=10906},
						{type=9,value=5594},
						{type=11,value=11954},
						{type=21,value=2942},
						{type=23,value=4838},
						{type=25,value=2942},
						{type=27,value=4838},
					},
					-- 55 级
					{
						{type=5,value=152050},
			    		{type=7,value=15249},
						{type=9,value=8353},
						{type=11,value=18852},
						{type=21,value=4495},
						{type=23,value=7426},
						{type=25,value=4495},
						{type=27,value=7426},
					},
					-- 56 级
					{
						{type=5,value=153400},
			    		{type=7,value=15384},
						{type=9,value=8392},
						{type=11,value=18950},
						{type=21,value=4519},
						{type=23,value=7462},
						{type=25,value=4519},
						{type=27,value=7462},
					},
					-- 57 级
					{
						{type=5,value=154750},
			    		{type=7,value=15519},
						{type=9,value=8431},
						{type=11,value=19048},
						{type=21,value=4543},
						{type=23,value=7498},
						{type=25,value=4543},
						{type=27,value=7498},
					},
					-- 58 级
					{
						{type=5,value=156100},
			    		{type=7,value=15654},
						{type=9,value=8470},
						{type=11,value=19146},
						{type=21,value=4567},
						{type=23,value=7534},
						{type=25,value=4567},
						{type=27,value=7534},
					},
					-- 59 级
					{
						{type=5,value=157450},
			    		{type=7,value=15789},
						{type=9,value=8509},
						{type=11,value=19244},
						{type=21,value=4591},
						{type=23,value=7570},
						{type=25,value=4591},
						{type=27,value=7570},
					},
					-- 60 级
					{
						{type=5,value=158800},
			    		{type=7,value=15924},
						{type=9,value=8548},
						{type=11,value=19342},
						{type=21,value=4615},
						{type=23,value=7606},
						{type=25,value=4615},
						{type=27,value=7606},
					},
					-- 61 级
					{
						{type=5,value=160150},
			    		{type=7,value=16059},
						{type=9,value=8587},
						{type=11,value=19440},
						{type=21,value=4639},
						{type=23,value=7642},
						{type=25,value=4639},
						{type=27,value=7642},
					},
					-- 62 级
					{
						{type=5,value=161500},
			    		{type=7,value=16194},
						{type=9,value=8626},
						{type=11,value=19538},
						{type=21,value=4663},
						{type=23,value=7678},
						{type=25,value=4663},
						{type=27,value=7678},
					},
					-- 63 级
					{
						{type=5,value=162850},
			    		{type=7,value=16329},
						{type=9,value=8665},
						{type=11,value=19636},
						{type=21,value=4687},
						{type=23,value=7714},
						{type=25,value=4687},
						{type=27,value=7714},
					},
					-- 64 级
					{
						{type=5,value=164200},
			    		{type=7,value=16464},
						{type=9,value=8704},
						{type=11,value=19734},
						{type=21,value=4711},
						{type=23,value=7750},
						{type=25,value=4711},
						{type=27,value=7750},
					},
					-- 65 级
					{
						{type=5,value=165550},
			    		{type=7,value=16599},
						{type=9,value=8743},
						{type=11,value=19832},
						{type=21,value=4735},
						{type=23,value=7786},
						{type=25,value=4735},
						{type=27,value=7786},
					},
					-- 66 级
					{
						{type=5,value=223550},
			    		{type=7,value=22458},
						{type=9,value=12658},
						{type=11,value=29620},
						{type=21,value=6888},
						{type=23,value=11374},
						{type=25,value=6888},
						{type=27,value=11374},
					},
					-- 67 级
					{
						{type=5,value=225125},
			    		{type=7,value=22616},
						{type=9,value=12704},
						{type=11,value=29734},
						{type=21,value=6916},
						{type=23,value=11416},
						{type=25,value=6916},
						{type=27,value=11416},
					},
					-- 68 级
					{
						{type=5,value=226700},
			    		{type=7,value=22774},
						{type=9,value=12750},
						{type=11,value=29848},
						{type=21,value=6944},
						{type=23,value=11458},
						{type=25,value=6944},
						{type=27,value=11458},
					},
					-- 69 级
					{
						{type=5,value=228275},
			    		{type=7,value=22932},
						{type=9,value=12796},
						{type=11,value=29962},
						{type=21,value=6972},
						{type=23,value=11500},
						{type=25,value=6972},
						{type=27,value=11500},
					},
					-- 70 级
					{
						{type=5,value=229850},
			    		{type=7,value=23090},
						{type=9,value=12842},
						{type=11,value=30076},
						{type=21,value=7000},
						{type=23,value=11542},
						{type=25,value=7000},
						{type=27,value=11542},
					},
					-- 71 级
					{
						{type=5,value=231425},
			    		{type=7,value=23248},
						{type=9,value=12888},
						{type=11,value=30190},
						{type=21,value=7028},
						{type=23,value=11584},
						{type=25,value=7028},
						{type=27,value=11584},
					},
					-- 72 级
					{
						{type=5,value=233000},
			    		{type=7,value=23406},
						{type=9,value=12934},
						{type=11,value=30304},
						{type=21,value=7056},
						{type=23,value=11626},
						{type=25,value=7056},
						{type=27,value=11626},
					},
					-- 73 级
					{
						{type=5,value=234575},
			    		{type=7,value=23564},
						{type=9,value=12980},
						{type=11,value=30418},
						{type=21,value=7084},
						{type=23,value=11668},
						{type=25,value=7084},
						{type=27,value=11668},
					},
					-- 74 级
					{
						{type=5,value=236150},
			    		{type=7,value=23722},
						{type=9,value=13026},
						{type=11,value=30532},
						{type=21,value=7112},
						{type=23,value=11710},
						{type=25,value=7112},
						{type=27,value=11710},
					},
					-- 75 级
					{
						{type=5,value=237725},
			    		{type=7,value=23880},
						{type=9,value=13072},
						{type=11,value=30646},
						{type=21,value=7140},
						{type=23,value=11752},
						{type=25,value=7140},
						{type=27,value=11752},
					},
					-- 76 级
					{
						{type=5,value=239300},
			    		{type=7,value=24038},
						{type=9,value=13118},
						{type=11,value=30760},
						{type=21,value=7168},
						{type=23,value=11794},
						{type=25,value=7168},
						{type=27,value=11794},
					},
					-- 77 级
					{
						{type=5,value=314300},
			    		{type=7,value=31614},
						{type=9,value=18353},
						{type=11,value=43848},
						{type=21,value=10101},
						{type=23,value=16682},
						{type=25,value=10101},
						{type=27,value=16682},
					},
					-- 78 级
					{
						{type=5,value=316100},
			    		{type=7,value=31794},
						{type=9,value=18404},
						{type=11,value=43976},
						{type=21,value=10133},
						{type=23,value=16730},
						{type=25,value=10133},
						{type=27,value=16730},
					},
					-- 79 级
					{
						{type=5,value=317900},
			    		{type=7,value=31974},
						{type=9,value=18455},
						{type=11,value=44104},
						{type=21,value=10165},
						{type=23,value=16778},
						{type=25,value=10165},
						{type=27,value=16778},
					},
					-- 80 级
					{
						{type=5,value=319700},
			    		{type=7,value=32154},
						{type=9,value=18506},
						{type=11,value=44232},
						{type=21,value=10197},
						{type=23,value=16826},
						{type=25,value=10197},
						{type=27,value=16826},
					},
					-- 81 级
					{
						{type=5,value=321500},
			    		{type=7,value=32334},
						{type=9,value=18557},
						{type=11,value=44360},
						{type=21,value=10229},
						{type=23,value=16874},
						{type=25,value=10229},
						{type=27,value=16874},
					},
					-- 82 级
					{
						{type=5,value=323300},
			    		{type=7,value=32514},
						{type=9,value=18608},
						{type=11,value=44488},
						{type=21,value=10261},
						{type=23,value=16922},
						{type=25,value=10261},
						{type=27,value=16922},
					},
					-- 83 级
					{
						{type=5,value=325100},
			    		{type=7,value=32694},
						{type=9,value=18659},
						{type=11,value=44616},
						{type=21,value=10293},
						{type=23,value=16970},
						{type=25,value=10293},
						{type=27,value=16970},
					},
					-- 84 级
					{
						{type=5,value=326900},
			    		{type=7,value=32874},
						{type=9,value=18710},
						{type=11,value=44744},
						{type=21,value=10325},
						{type=23,value=17018},
						{type=25,value=10325},
						{type=27,value=17018},
					},
					-- 85 级
					{
						{type=5,value=328700},
			    		{type=7,value=33054},
						{type=9,value=18761},
						{type=11,value=44872},
						{type=21,value=10357},
						{type=23,value=17066},
						{type=25,value=10357},
						{type=27,value=17066},
					},
					-- 86 级
					{
						{type=5,value=330500},
			    		{type=7,value=33234},
						{type=9,value=18812},
						{type=11,value=45000},
						{type=21,value=10389},
						{type=23,value=17114},
						{type=25,value=10389},
						{type=27,value=17114},
					},
					-- 87 级
					{
						{type=5,value=332300},
			    		{type=7,value=33414},
						{type=9,value=18863},
						{type=11,value=45128},
						{type=21,value=10421},
						{type=23,value=17162},
						{type=25,value=10421},
						{type=27,value=17162},
					},
					-- 88 级
					{
						{type=5,value=427300},
			    		{type=7,value=43010},
						{type=9,value=25538},
						{type=11,value=61816},
						{type=21,value=14374},
						{type=23,value=23750},
						{type=25,value=14374},
						{type=27,value=23750},
					},
					-- 89 级
					{
						{type=5,value=429325},
			    		{type=7,value=43213},
						{type=9,value=25594},
						{type=11,value=61956},
						{type=21,value=14410},
						{type=23,value=23804},
						{type=25,value=14410},
						{type=27,value=23804},
					},
					-- 90 级
					{
						{type=5,value=431350},
			    		{type=7,value=43416},
						{type=9,value=25650},
						{type=11,value=62096},
						{type=21,value=14446},
						{type=23,value=23858},
						{type=25,value=14446},
						{type=27,value=23858},
					},
					-- 91 级
					{
						{type=5,value=433375},
			    		{type=7,value=43619},
						{type=9,value=25706},
						{type=11,value=62236},
						{type=21,value=14482},
						{type=23,value=23912},
						{type=25,value=14482},
						{type=27,value=23912},
					},
					-- 92 级
					{
						{type=5,value=435400},
			    		{type=7,value=43822},
						{type=9,value=25762},
						{type=11,value=62376},
						{type=21,value=14518},
						{type=23,value=23966},
						{type=25,value=14518},
						{type=27,value=23966},
					},
					-- 93 级
					{
						{type=5,value=437425},
			    		{type=7,value=44025},
						{type=9,value=25818},
						{type=11,value=62516},
						{type=21,value=14554},
						{type=23,value=24020},
						{type=25,value=14554},
						{type=27,value=24020},
					},
					-- 94 级
					{
						{type=5,value=439450},
			    		{type=7,value=44228},
						{type=9,value=25874},
						{type=11,value=62656},
						{type=21,value=14590},
						{type=23,value=24074},
						{type=25,value=14590},
						{type=27,value=24074},
					},
					-- 95 级
					{
						{type=5,value=441475},
			    		{type=7,value=44431},
						{type=9,value=25930},
						{type=11,value=62796},
						{type=21,value=14626},
						{type=23,value=24128},
						{type=25,value=14626},
						{type=27,value=24128},
					},
					-- 96 级
					{
						{type=5,value=443500},
			    		{type=7,value=44634},
						{type=9,value=25986},
						{type=11,value=62936},
						{type=21,value=14662},
						{type=23,value=24182},
						{type=25,value=14662},
						{type=27,value=24182},
					},
					-- 97 级
					{
						{type=5,value=445525},
			    		{type=7,value=44837},
						{type=9,value=26042},
						{type=11,value=63076},
						{type=21,value=14698},
						{type=23,value=24236},
						{type=25,value=14698},
						{type=27,value=24236},
					},
					-- 98 级
					{
						{type=5,value=447550},
			    		{type=7,value=45040},
						{type=9,value=26098},
						{type=11,value=63216},
						{type=21,value=14734},
						{type=23,value=24290},
						{type=25,value=14734},
						{type=27,value=24290},
					},




					
				},
			},
			-- 法
			{
				itemId = 5949,
				
				inShowIds = {179,180,181,182,304,305,306,307,308}, -- 每阶一个内观
				outShowIds = {179,180,181,182,304,305,306,307,308}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 5951, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,8,8,8,8,8,8,8,8,8,8,4,20,20,20,20,20,20,20,20,20,20,8,40,40,40,40,40,40,40,40,40,40,16,80,80,80,80,80,80,80,80,80,80,
				28,120,120,120,120,120,120,120,120,120,120,42,160,160,160,160,160,160,160,160,160,160,58,200,200,200,200,200,200,200,200,200,200,76,240,240
				,240,240,240,240,240,240,240,240,96,280,280,280,280,280,280,280,280,280,280,},
				
				attrs = {
											-- 0 级
					{
						{type=5,value=1157},
			    		{type=7,value=4628},
						{type=13,value=150},
						{type=15,value=315},
						{type=21,value=76},
						{type=23,value=126},
						{type=25,value=76},
						{type=27,value=126},
					},
					-- 1 级
					{
						{type=5,value=1215},
			    		{type=7,value=4858},
						{type=13,value=155},
						{type=15,value=331},
						{type=21,value=80},
						{type=23,value=132},
						{type=25,value=80},
						{type=27,value=132},
					},
					-- 2 级
					{
						{type=5,value=1273},
			    		{type=7,value=5088},
						{type=13,value=160},
						{type=15,value=347},
						{type=21,value=84},
						{type=23,value=138},
						{type=25,value=84},
						{type=27,value=138},
					},
					-- 3 级
					{
						{type=5,value=1331},
			    		{type=7,value=5318},
						{type=13,value=165},
						{type=15,value=363},
						{type=21,value=88},
						{type=23,value=144},
						{type=25,value=88},
						{type=27,value=144},
					},
					-- 4 级
					{
						{type=5,value=1389},
			    		{type=7,value=5548},
						{type=13,value=170},
						{type=15,value=379},
						{type=21,value=92},
						{type=23,value=150},
						{type=25,value=92},
						{type=27,value=150},
					},
					-- 5 级
					{
						{type=5,value=1447},
			    		{type=7,value=5778},
						{type=13,value=175},
						{type=15,value=395},
						{type=21,value=96},
						{type=23,value=156},
						{type=25,value=96},
						{type=27,value=156},
					},
					-- 6 级
					{
						{type=5,value=1505},
			    		{type=7,value=6008},
						{type=13,value=180},
						{type=15,value=411},
						{type=21,value=100},
						{type=23,value=162},
						{type=25,value=100},
						{type=27,value=162},
					},
					-- 7 级
					{
						{type=5,value=1563},
			    		{type=7,value=6238},
						{type=13,value=185},
						{type=15,value=427},
						{type=21,value=104},
						{type=23,value=168},
						{type=25,value=104},
						{type=27,value=168},
					},
					-- 8 级
					{
						{type=5,value=1621},
			    		{type=7,value=6468},
						{type=13,value=190},
						{type=15,value=443},
						{type=21,value=108},
						{type=23,value=174},
						{type=25,value=108},
						{type=27,value=174},
					},
					-- 9 级
					{
						{type=5,value=1679},
			    		{type=7,value=6698},
						{type=13,value=195},
						{type=15,value=459},
						{type=21,value=112},
						{type=23,value=180},
						{type=25,value=112},
						{type=27,value=180},
					},
					-- 10 级
					{
						{type=5,value=1737},
			    		{type=7,value=6928},
						{type=13,value=200},
						{type=15,value=475},
						{type=21,value=116},
						{type=23,value=186},
						{type=25,value=116},
						{type=27,value=186},
					},
					-- 11 级
					{
						{type=5,value=3794},
			    		{type=7,value=15156},
						{type=13,value=590},
						{type=15,value=1293},
						{type=21,value=312},
						{type=23,value=514},
						{type=25,value=312},
						{type=27,value=514},
					},
					-- 12 级
					{
						{type=5,value=3910},
			    		{type=7,value=15616},
						{type=13,value=600},
						{type=15,value=1318},
						{type=21,value=320},
						{type=23,value=526},
						{type=25,value=320},
						{type=27,value=526},
					},
					-- 13 级
					{
						{type=5,value=4026},
			    		{type=7,value=16076},
						{type=13,value=610},
						{type=15,value=1343},
						{type=21,value=328},
						{type=23,value=538},
						{type=25,value=328},
						{type=27,value=538},
					},
					-- 14 级
					{
						{type=5,value=4142},
			    		{type=7,value=16536},
						{type=13,value=620},
						{type=15,value=1368},
						{type=21,value=336},
						{type=23,value=550},
						{type=25,value=336},
						{type=27,value=550},
					},
					-- 15 级
					{
						{type=5,value=4258},
			    		{type=7,value=16996},
						{type=13,value=630},
						{type=15,value=1393},
						{type=21,value=344},
						{type=23,value=562},
						{type=25,value=344},
						{type=27,value=562},
					},
					-- 16 级
					{
						{type=5,value=4374},
			    		{type=7,value=17456},
						{type=13,value=640},
						{type=15,value=1418},
						{type=21,value=352},
						{type=23,value=574},
						{type=25,value=352},
						{type=27,value=574},
					},
					-- 17 级
					{
						{type=5,value=4490},
			    		{type=7,value=17916},
						{type=13,value=650},
						{type=15,value=1443},
						{type=21,value=360},
						{type=23,value=586},
						{type=25,value=360},
						{type=27,value=586},
					},
					-- 18 级
					{
						{type=5,value=4606},
			    		{type=7,value=18376},
						{type=13,value=660},
						{type=15,value=1468},
						{type=21,value=368},
						{type=23,value=598},
						{type=25,value=368},
						{type=27,value=598},
					},
					-- 19 级
					{
						{type=5,value=4722},
			    		{type=7,value=18836},
						{type=13,value=670},
						{type=15,value=1493},
						{type=21,value=376},
						{type=23,value=610},
						{type=25,value=376},
						{type=27,value=610},
					},
					-- 20 级
					{
						{type=5,value=4838},
			    		{type=7,value=19296},
						{type=13,value=680},
						{type=15,value=1518},
						{type=21,value=384},
						{type=23,value=622},
						{type=25,value=384},
						{type=27,value=622},
					},
					-- 21 级
					{
						{type=5,value=4954},
			    		{type=7,value=19756},
						{type=13,value=690},
						{type=15,value=1543},
						{type=21,value=392},
						{type=23,value=634},
						{type=25,value=392},
						{type=27,value=634},
					},
					-- 22 级
					{
						{type=5,value=8245},
			    		{type=7,value=32920},
						{type=13,value=1426},
						{type=15,value=3088},
						{type=21,value=762},
						{type=23,value=1252},
						{type=25,value=762},
						{type=27,value=1252},
					},
					-- 23 级
					{
						{type=5,value=8419},
			    		{type=7,value=33610},
						{type=13,value=1441},
						{type=15,value=3126},
						{type=21,value=774},
						{type=23,value=1270},
						{type=25,value=774},
						{type=27,value=1270},
					},
					-- 24 级
					{
						{type=5,value=8593},
			    		{type=7,value=34300},
						{type=13,value=1456},
						{type=15,value=3164},
						{type=21,value=786},
						{type=23,value=1288},
						{type=25,value=786},
						{type=27,value=1288},
					},
					-- 25 级
					{
						{type=5,value=8767},
			    		{type=7,value=34990},
						{type=13,value=1471},
						{type=15,value=3202},
						{type=21,value=798},
						{type=23,value=1306},
						{type=25,value=798},
						{type=27,value=1306},
					},
					-- 26 级
					{
						{type=5,value=8941},
			    		{type=7,value=35680},
						{type=13,value=1486},
						{type=15,value=3240},
						{type=21,value=810},
						{type=23,value=1324},
						{type=25,value=810},
						{type=27,value=1324},
					},
					-- 27 级
					{
						{type=5,value=9115},
			    		{type=7,value=36370},
						{type=13,value=1501},
						{type=15,value=3278},
						{type=21,value=822},
						{type=23,value=1342},
						{type=25,value=822},
						{type=27,value=1342},
					},
					-- 28 级
					{
						{type=5,value=9289},
			    		{type=7,value=37060},
						{type=13,value=1516},
						{type=15,value=3316},
						{type=21,value=834},
						{type=23,value=1360},
						{type=25,value=834},
						{type=27,value=1360},
					},
					-- 29 级
					{
						{type=5,value=9463},
			    		{type=7,value=37750},
						{type=13,value=1531},
						{type=15,value=3354},
						{type=21,value=846},
						{type=23,value=1378},
						{type=25,value=846},
						{type=27,value=1378},
					},
					-- 30 级
					{
						{type=5,value=9637},
			    		{type=7,value=38440},
						{type=13,value=1546},
						{type=15,value=3392},
						{type=21,value=858},
						{type=23,value=1396},
						{type=25,value=858},
						{type=27,value=1396},
					},
					-- 31 级
					{
						{type=5,value=9811},
			    		{type=7,value=39130},
						{type=13,value=1561},
						{type=15,value=3430},
						{type=21,value=870},
						{type=23,value=1414},
						{type=25,value=870},
						{type=27,value=1414},
					},
					-- 32 级
					{
						{type=5,value=9985},
			    		{type=7,value=39820},
						{type=13,value=1576},
						{type=15,value=3468},
						{type=21,value=882},
						{type=23,value=1432},
						{type=25,value=882},
						{type=27,value=1432},
					},
					-- 33 级
					{
						{type=5,value=15127},
			    		{type=7,value=60388},
						{type=13,value=2872},
						{type=15,value=6186},
						{type=21,value=1532},
						{type=23,value=2520},
						{type=25,value=1532},
						{type=27,value=2520},
					},
					-- 34 级
					{
						{type=5,value=15359},
			    		{type=7,value=61308},
						{type=13,value=2897},
						{type=15,value=6244},
						{type=21,value=1548},
						{type=23,value=2544},
						{type=25,value=1548},
						{type=27,value=2544},
					},
					-- 35 级
					{
						{type=5,value=15591},
			    		{type=7,value=62228},
						{type=13,value=2922},
						{type=15,value=6302},
						{type=21,value=1564},
						{type=23,value=2568},
						{type=25,value=1564},
						{type=27,value=2568},
					},
					-- 36 级
					{
						{type=5,value=15823},
			    		{type=7,value=63148},
						{type=13,value=2947},
						{type=15,value=6360},
						{type=21,value=1580},
						{type=23,value=2592},
						{type=25,value=1580},
						{type=27,value=2592},
					},
					-- 37 级
					{
						{type=5,value=16055},
			    		{type=7,value=64068},
						{type=13,value=2972},
						{type=15,value=6418},
						{type=21,value=1596},
						{type=23,value=2616},
						{type=25,value=1596},
						{type=27,value=2616},
					},
					-- 38 级
					{
						{type=5,value=16287},
			    		{type=7,value=64988},
						{type=13,value=2997},
						{type=15,value=6476},
						{type=21,value=1612},
						{type=23,value=2640},
						{type=25,value=1612},
						{type=27,value=2640},
					},
					-- 39 级
					{
						{type=5,value=16519},
			    		{type=7,value=65908},
						{type=13,value=3022},
						{type=15,value=6534},
						{type=21,value=1628},
						{type=23,value=2664},
						{type=25,value=1628},
						{type=27,value=2664},
					},
					-- 40 级
					{
						{type=5,value=16751},
			    		{type=7,value=66828},
						{type=13,value=3047},
						{type=15,value=6592},
						{type=21,value=1644},
						{type=23,value=2688},
						{type=25,value=1644},
						{type=27,value=2688},
					},
					-- 41 级
					{
						{type=5,value=16983},
			    		{type=7,value=67748},
						{type=13,value=3072},
						{type=15,value=6650},
						{type=21,value=1660},
						{type=23,value=2712},
						{type=25,value=1660},
						{type=27,value=2712},
					},
					-- 42 级
					{
						{type=5,value=17215},
			    		{type=7,value=68668},
						{type=13,value=3097},
						{type=15,value=6708},
						{type=21,value=1676},
						{type=23,value=2736},
						{type=25,value=1676},
						{type=27,value=2736},
					},
					-- 43 级
					{
						{type=5,value=17447},
			    		{type=7,value=69588},
						{type=13,value=3122},
						{type=15,value=6766},
						{type=21,value=1692},
						{type=23,value=2760},
						{type=25,value=1692},
						{type=27,value=2760},
					},

					

					
					-- 44 级
					{
						{type=5,value=25160},
			    		{type=7,value=100440},
						{type=13,value=5234},
						{type=15,value=11154},
						{type=21,value=2742},
						{type=23,value=4538},
						{type=25,value=2742},
						{type=27,value=4538},
					},

					-- 45 级
					{
						{type=5,value=25450},
			    		{type=7,value=101590},
						{type=13,value=5270},
						{type=15,value=11234},
						{type=21,value=2762},
						{type=23,value=4568},
						{type=25,value=2762},
						{type=27,value=4568},
					},

					-- 46 级
					{
						{type=5,value=25740},
			    		{type=7,value=102740},
						{type=13,value=5306},
						{type=15,value=11314},
						{type=21,value=2782},
						{type=23,value=4598},
						{type=25,value=2782},
						{type=27,value=4598},
					},

					-- 47 级
					{
						{type=5,value=26030},
			    		{type=7,value=103890},
						{type=13,value=5342},
						{type=15,value=11394},
						{type=21,value=2802},
						{type=23,value=4628},
						{type=25,value=2802},
						{type=27,value=4628},
					},

					-- 48 级
					{
						{type=5,value=26320},
			    		{type=7,value=105040},
						{type=13,value=5378},
						{type=15,value=11474},
						{type=21,value=2822},
						{type=23,value=4658},
						{type=25,value=2822},
						{type=27,value=4658},
					},

					-- 49 级
					{
						{type=5,value=26610},
			    		{type=7,value=106190},
						{type=13,value=5414},
						{type=15,value=11554},
						{type=21,value=2842},
						{type=23,value=4688},
						{type=25,value=2842},
						{type=27,value=4688},
					},

					-- 50 级
					{
						{type=5,value=26900},
			    		{type=7,value=107340},
						{type=13,value=5450},
						{type=15,value=11634},
						{type=21,value=2862},
						{type=23,value=4718},
						{type=25,value=2862},
						{type=27,value=4718},
					},

					-- 51 级
					{
						{type=5,value=27190},
			    		{type=7,value=108490},
						{type=13,value=5486},
						{type=15,value=11714},
						{type=21,value=2882},
						{type=23,value=4748},
						{type=25,value=2882},
						{type=27,value=4748},
					},

					-- 52 级
					{
						{type=5,value=27480},
			    		{type=7,value=109640},
						{type=13,value=5522},
						{type=15,value=11794},
						{type=21,value=2902},
						{type=23,value=4778},
						{type=25,value=2902},
						{type=27,value=4778},
					},

					-- 53 级
					{
						{type=5,value=27770},
			    		{type=7,value=110790},
						{type=13,value=5558},
						{type=15,value=11874},
						{type=21,value=2922},
						{type=23,value=4808},
						{type=25,value=2922},
						{type=27,value=4808},
					},

					-- 54 级
					{
						{type=5,value=28060},
			    		{type=7,value=111940},
						{type=13,value=5594},
						{type=15,value=11954},
						{type=21,value=2942},
						{type=23,value=4838},
						{type=25,value=2942},
						{type=27,value=4838},
					},

					-- 55 级
					{
						{type=5,value=39114},
			    		{type=7,value=156156},
						{type=13,value=8353},
						{type=15,value=18852},
						{type=21,value=4495},
						{type=23,value=7426},
						{type=25,value=4495},
						{type=27,value=7426},
					},

					-- 56 级
					{
						{type=5,value=39462},
			    		{type=7,value=157536},
						{type=13,value=8392},
						{type=15,value=18950},
						{type=21,value=4519},
						{type=23,value=7462},
						{type=25,value=4519},
						{type=27,value=7462},
					},

					-- 57 级
					{
						{type=5,value=39810},
			    		{type=7,value=158916},
						{type=13,value=8431},
						{type=15,value=19048},
						{type=21,value=4543},
						{type=23,value=7498},
						{type=25,value=4543},
						{type=27,value=7498},
					},

					-- 58 级
					{
						{type=5,value=40158},
			    		{type=7,value=160296},
						{type=13,value=8470},
						{type=15,value=19146},
						{type=21,value=4567},
						{type=23,value=7534},
						{type=25,value=4567},
						{type=27,value=7534},
					},

					-- 59 级
					{
						{type=5,value=40506},
			    		{type=7,value=161676},
						{type=13,value=8509},
						{type=15,value=19244},
						{type=21,value=4591},
						{type=23,value=7570},
						{type=25,value=4591},
						{type=27,value=7570},
					},

					-- 60 级
					{
						{type=5,value=40854},
			    		{type=7,value=163056},
						{type=13,value=8548},
						{type=15,value=19342},
						{type=21,value=4615},
						{type=23,value=7606},
						{type=25,value=4615},
						{type=27,value=7606},
					},

					-- 61 级
					{
						{type=5,value=41202},
			    		{type=7,value=164436},
						{type=13,value=8587},
						{type=15,value=19440},
						{type=21,value=4639},
						{type=23,value=7642},
						{type=25,value=4639},
						{type=27,value=7642},
					},

					-- 62 级
					{
						{type=5,value=41550},
			    		{type=7,value=165816},
						{type=13,value=8626},
						{type=15,value=19538},
						{type=21,value=4663},
						{type=23,value=7678},
						{type=25,value=4663},
						{type=27,value=7678},
					},

					-- 63 级
					{
						{type=5,value=41898},
			    		{type=7,value=167196},
						{type=13,value=8665},
						{type=15,value=19636},
						{type=21,value=4687},
						{type=23,value=7714},
						{type=25,value=4687},
						{type=27,value=7714},
					},

					-- 64 级
					{
						{type=5,value=42246},
			    		{type=7,value=168576},
						{type=13,value=8704},
						{type=15,value=19734},
						{type=21,value=4711},
						{type=23,value=7750},
						{type=25,value=4711},
						{type=27,value=7750},
					},

					-- 65 级
					{
						{type=5,value=42594},
			    		{type=7,value=169956},
						{type=13,value=8743},
						{type=15,value=19832},
						{type=21,value=4735},
						{type=23,value=7786},
						{type=25,value=4735},
						{type=27,value=7786},
					},

					-- 66 级
					{
						{type=5,value=57505},
			    		{type=7,value=229600},
						{type=13,value=12658},
						{type=15,value=29620},
						{type=21,value=6888},
						{type=23,value=11374},
						{type=25,value=6888},
						{type=27,value=11374},
					},

					-- 67 级
					{
						{type=5,value=57911},
			    		{type=7,value=231210},
						{type=13,value=12704},
						{type=15,value=29734},
						{type=21,value=6916},
						{type=23,value=11416},
						{type=25,value=6916},
						{type=27,value=11416},
					},

					-- 68 级
					{
						{type=5,value=58317},
			    		{type=7,value=232820},
						{type=13,value=12750},
						{type=15,value=29848},
						{type=21,value=6944},
						{type=23,value=11458},
						{type=25,value=6944},
						{type=27,value=11458},
					},

					-- 69 级
					{
						{type=5,value=58723},
			    		{type=7,value=234430},
						{type=13,value=12796},
						{type=15,value=29962},
						{type=21,value=6972},
						{type=23,value=11500},
						{type=25,value=6972},
						{type=27,value=11500},
					},

					-- 70 级
					{
						{type=5,value=59129},
			    		{type=7,value=236040},
						{type=13,value=12842},
						{type=15,value=30076},
						{type=21,value=7000},
						{type=23,value=11542},
						{type=25,value=7000},
						{type=27,value=11542},
					},

					-- 71 级
					{
						{type=5,value=59535},
			    		{type=7,value=237650},
						{type=13,value=12888},
						{type=15,value=30190},
						{type=21,value=7028},
						{type=23,value=11584},
						{type=25,value=7028},
						{type=27,value=11584},
					},

					-- 72 级
					{
						{type=5,value=59941},
			    		{type=7,value=239260},
						{type=13,value=12934},
						{type=15,value=30304},
						{type=21,value=7056},
						{type=23,value=11626},
						{type=25,value=7056},
						{type=27,value=11626},
					},

					-- 73 级
					{
						{type=5,value=60347},
			    		{type=7,value=240870},
						{type=13,value=12980},
						{type=15,value=30418},
						{type=21,value=7084},
						{type=23,value=11668},
						{type=25,value=7084},
						{type=27,value=11668},
					},

					-- 74 级
					{
						{type=5,value=60753},
			    		{type=7,value=242480},
						{type=13,value=13026},
						{type=15,value=30532},
						{type=21,value=7112},
						{type=23,value=11710},
						{type=25,value=7112},
						{type=27,value=11710},
					},

					-- 75 级
					{
						{type=5,value=61159},
			    		{type=7,value=244090},
						{type=13,value=13072},
						{type=15,value=30646},
						{type=21,value=7140},
						{type=23,value=11752},
						{type=25,value=7140},
						{type=27,value=11752},
					},

					-- 76 级
					{
						{type=5,value=61565},
			    		{type=7,value=245700},
						{type=13,value=13118},
						{type=15,value=30760},
						{type=21,value=7168},
						{type=23,value=11794},
						{type=25,value=7168},
						{type=27,value=11794},
					},

					-- 77 级
					{
						{type=5,value=80846},
			    		{type=7,value=322824},
						{type=13,value=18353},
						{type=15,value=43848},
						{type=21,value=10101},
						{type=23,value=16682},
						{type=25,value=10101},
						{type=27,value=16682},
					},

					-- 78 级
					{
						{type=5,value=81310},
			    		{type=7,value=324664},
						{type=13,value=18404},
						{type=15,value=43976},
						{type=21,value=10133},
						{type=23,value=16730},
						{type=25,value=10133},
						{type=27,value=16730},
					},

					-- 79 级
					{
						{type=5,value=81774},
			    		{type=7,value=326504},
						{type=13,value=18455},
						{type=15,value=44104},
						{type=21,value=10165},
						{type=23,value=16778},
						{type=25,value=10165},
						{type=27,value=16778},
					},

					-- 80 级
					{
						{type=5,value=82238},
			    		{type=7,value=328344},
						{type=13,value=18506},
						{type=15,value=44232},
						{type=21,value=10197},
						{type=23,value=16826},
						{type=25,value=10197},
						{type=27,value=16826},
					},

					-- 81 级
					{
						{type=5,value=82702},
			    		{type=7,value=330184},
						{type=13,value=18557},
						{type=15,value=44360},
						{type=21,value=10229},
						{type=23,value=16874},
						{type=25,value=10229},
						{type=27,value=16874},
					},

					-- 82 级
					{
						{type=5,value=83166},
			    		{type=7,value=332024},
						{type=13,value=18608},
						{type=15,value=44488},
						{type=21,value=10261},
						{type=23,value=16922},
						{type=25,value=10261},
						{type=27,value=16922},
					},

					-- 83 级
					{
						{type=5,value=83630},
			    		{type=7,value=333864},
						{type=13,value=18659},
						{type=15,value=44616},
						{type=21,value=10293},
						{type=23,value=16970},
						{type=25,value=10293},
						{type=27,value=16970},
					},

					-- 84 级
					{
						{type=5,value=84094},
			    		{type=7,value=335704},
						{type=13,value=18710},
						{type=15,value=44744},
						{type=21,value=10325},
						{type=23,value=17018},
						{type=25,value=10325},
						{type=27,value=17018},
					},

					-- 85 级
					{
						{type=5,value=84558},
			    		{type=7,value=337544},
						{type=13,value=18761},
						{type=15,value=44872},
						{type=21,value=10357},
						{type=23,value=17066},
						{type=25,value=10357},
						{type=27,value=17066},
					},

					-- 86 级
					{
						{type=5,value=85022},
			    		{type=7,value=339384},
						{type=13,value=18812},
						{type=15,value=45000},
						{type=21,value=10389},
						{type=23,value=17114},
						{type=25,value=10389},
						{type=27,value=17114},
					},

					-- 87 级
					{
						{type=5,value=85486},
			    		{type=7,value=341224},
						{type=13,value=18863},
						{type=15,value=45128},
						{type=21,value=10421},
						{type=23,value=17162},
						{type=25,value=10421},
						{type=27,value=17162},
					},

					-- 88 级
					{
						{type=5,value=109908},
			    		{type=7,value=438912},
						{type=13,value=25538},
						{type=15,value=61816},
						{type=21,value=14374},
						{type=23,value=23750},
						{type=25,value=14374},
						{type=27,value=23750},
					},

					-- 89 级
					{
						{type=5,value=110430},
			    		{type=7,value=440982},
						{type=13,value=25594},
						{type=15,value=61956},
						{type=21,value=14410},
						{type=23,value=23804},
						{type=25,value=14410},
						{type=27,value=23804},
					},

					-- 90 级
					{
						{type=5,value=110952},
			    		{type=7,value=443052},
						{type=13,value=25650},
						{type=15,value=62096},
						{type=21,value=14446},
						{type=23,value=23858},
						{type=25,value=14446},
						{type=27,value=23858},
					},

					-- 91 级
					{
						{type=5,value=111474},
			    		{type=7,value=445122},
						{type=13,value=25706},
						{type=15,value=62236},
						{type=21,value=14482},
						{type=23,value=23912},
						{type=25,value=14482},
						{type=27,value=23912},
					},

					-- 92 级
					{
						{type=5,value=111996},
			    		{type=7,value=447192},
						{type=13,value=25762},
						{type=15,value=62376},
						{type=21,value=14518},
						{type=23,value=23966},
						{type=25,value=14518},
						{type=27,value=23966},
					},

					-- 93 级
					{
						{type=5,value=112518},
			    		{type=7,value=449262},
						{type=13,value=25818},
						{type=15,value=62516},
						{type=21,value=14554},
						{type=23,value=24020},
						{type=25,value=14554},
						{type=27,value=24020},
					},

					-- 94 级
					{
						{type=5,value=113040},
			    		{type=7,value=451332},
						{type=13,value=25874},
						{type=15,value=62656},
						{type=21,value=14590},
						{type=23,value=24074},
						{type=25,value=14590},
						{type=27,value=24074},
					},

					-- 95 级
					{
						{type=5,value=113562},
			    		{type=7,value=453402},
						{type=13,value=25930},
						{type=15,value=62796},
						{type=21,value=14626},
						{type=23,value=24128},
						{type=25,value=14626},
						{type=27,value=24128},
					},

					-- 96 级
					{
						{type=5,value=114084},
			    		{type=7,value=455472},
						{type=13,value=25986},
						{type=15,value=62936},
						{type=21,value=14662},
						{type=23,value=24182},
						{type=25,value=14662},
						{type=27,value=24182},
					},

					-- 97 级
					{
						{type=5,value=114606},
			    		{type=7,value=457542},
						{type=13,value=26042},
						{type=15,value=63076},
						{type=21,value=14698},
						{type=23,value=24236},
						{type=25,value=14698},
						{type=27,value=24236},
					},

					-- 98 级
					{
						{type=5,value=115128},
			    		{type=7,value=459612},
						{type=13,value=26098},
						{type=15,value=63216},
						{type=21,value=14734},
						{type=23,value=24290},
						{type=25,value=14734},
						{type=27,value=24290},
					},


					
				},
			},
			-- 道
			{
				itemId = 5949,
				
				inShowIds = {179,180,181,182,304,305,306,307,308}, -- 每阶一个内观
				outShowIds = {179,180,181,182,304,305,306,307,308}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 5951, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,8,8,8,8,8,8,8,8,8,8,4,20,20,20,20,20,20,20,20,20,20,8,40,40,40,40,40,40,40,40,40,40,16,80,80,80,80,80,80,80,80,80,80,
				28,120,120,120,120,120,120,120,120,120,120,42,160,160,160,160,160,160,160,160,160,160,58,200,200,200,200,200,200,200,200,200,200,76,240,240
				,240,240,240,240,240,240,240,240,96,280,280,280,280,280,280,280,280,280,280,},
				
				attrs = {
										-- 0 级
					{
						{type=5,value=2514},
			    		{type=7,value=2514},
						{type=17,value=150},
						{type=19,value=315},
						{type=21,value=76},
						{type=23,value=126},
						{type=25,value=76},
						{type=27,value=126},
					},
					-- 1 级
					{
						{type=5,value=2640},
			    		{type=7,value=2640},
						{type=17,value=155},
						{type=19,value=331},
						{type=21,value=80},
						{type=23,value=132},
						{type=25,value=80},
						{type=27,value=132},
					},
					-- 2 级
					{
						{type=5,value=2766},
			    		{type=7,value=2766},
						{type=17,value=160},
						{type=19,value=347},
						{type=21,value=84},
						{type=23,value=138},
						{type=25,value=84},
						{type=27,value=138},
					},
					-- 3 级
					{
						{type=5,value=2892},
			    		{type=7,value=2892},
						{type=17,value=165},
						{type=19,value=363},
						{type=21,value=88},
						{type=23,value=144},
						{type=25,value=88},
						{type=27,value=144},
					},
					-- 4 级
					{
						{type=5,value=3018},
			    		{type=7,value=3018},
						{type=17,value=170},
						{type=19,value=379},
						{type=21,value=92},
						{type=23,value=150},
						{type=25,value=92},
						{type=27,value=150},
					},
					-- 5 级
					{
						{type=5,value=3144},
			    		{type=7,value=3144},
						{type=17,value=175},
						{type=19,value=395},
						{type=21,value=96},
						{type=23,value=156},
						{type=25,value=96},
						{type=27,value=156},
					},
					-- 6 级
					{
						{type=5,value=3270},
			    		{type=7,value=3270},
						{type=17,value=180},
						{type=19,value=411},
						{type=21,value=100},
						{type=23,value=162},
						{type=25,value=100},
						{type=27,value=162},
					},
					-- 7 级
					{
						{type=5,value=3396},
			    		{type=7,value=3396},
						{type=17,value=185},
						{type=19,value=427},
						{type=21,value=104},
						{type=23,value=168},
						{type=25,value=104},
						{type=27,value=168},
					},
					-- 8 级
					{
						{type=5,value=3522},
			    		{type=7,value=3522},
						{type=17,value=190},
						{type=19,value=443},
						{type=21,value=108},
						{type=23,value=174},
						{type=25,value=108},
						{type=27,value=174},
					},
					-- 9 级
					{
						{type=5,value=3648},
			    		{type=7,value=3648},
						{type=17,value=195},
						{type=19,value=459},
						{type=21,value=112},
						{type=23,value=180},
						{type=25,value=112},
						{type=27,value=180},
					},
					-- 10 级
					{
						{type=5,value=3774},
			    		{type=7,value=3774},
						{type=17,value=200},
						{type=19,value=475},
						{type=21,value=116},
						{type=23,value=186},
						{type=25,value=116},
						{type=27,value=186},
					},
					-- 11 级
					{
						{type=5,value=8244},
			    		{type=7,value=8244},
						{type=17,value=590},
						{type=19,value=1293},
						{type=21,value=312},
						{type=23,value=514},
						{type=25,value=312},
						{type=27,value=514},
					},
					-- 12 级
					{
						{type=5,value=8496},
			    		{type=7,value=8496},
						{type=17,value=600},
						{type=19,value=1318},
						{type=21,value=320},
						{type=23,value=526},
						{type=25,value=320},
						{type=27,value=526},
					},
					-- 13 级
					{
						{type=5,value=8748},
			    		{type=7,value=8748},
						{type=17,value=610},
						{type=19,value=1343},
						{type=21,value=328},
						{type=23,value=538},
						{type=25,value=328},
						{type=27,value=538},
					},
					-- 14 级
					{
						{type=5,value=9000},
			    		{type=7,value=9000},
						{type=17,value=620},
						{type=19,value=1368},
						{type=21,value=336},
						{type=23,value=550},
						{type=25,value=336},
						{type=27,value=550},
					},
					-- 15 级
					{
						{type=5,value=9252},
			    		{type=7,value=9252},
						{type=17,value=630},
						{type=19,value=1393},
						{type=21,value=344},
						{type=23,value=562},
						{type=25,value=344},
						{type=27,value=562},
					},
					-- 16 级
					{
						{type=5,value=9504},
			    		{type=7,value=9504},
						{type=17,value=640},
						{type=19,value=1418},
						{type=21,value=352},
						{type=23,value=574},
						{type=25,value=352},
						{type=27,value=574},
					},
					-- 17 级
					{
						{type=5,value=9756},
			    		{type=7,value=9756},
						{type=17,value=650},
						{type=19,value=1443},
						{type=21,value=360},
						{type=23,value=586},
						{type=25,value=360},
						{type=27,value=586},
					},
					-- 18 级
					{
						{type=5,value=10008},
			    		{type=7,value=10008},
						{type=17,value=660},
						{type=19,value=1468},
						{type=21,value=368},
						{type=23,value=598},
						{type=25,value=368},
						{type=27,value=598},
					},
					-- 19 级
					{
						{type=5,value=10260},
			    		{type=7,value=10260},
						{type=17,value=670},
						{type=19,value=1493},
						{type=21,value=376},
						{type=23,value=610},
						{type=25,value=376},
						{type=27,value=610},
					},
					-- 20 级
					{
						{type=5,value=10512},
			    		{type=7,value=10512},
						{type=17,value=680},
						{type=19,value=1518},
						{type=21,value=384},
						{type=23,value=622},
						{type=25,value=384},
						{type=27,value=622},
					},
					-- 21 级
					{
						{type=5,value=10764},
			    		{type=7,value=10764},
						{type=17,value=690},
						{type=19,value=1543},
						{type=21,value=392},
						{type=23,value=634},
						{type=25,value=392},
						{type=27,value=634},
					},
					-- 22 级
					{
						{type=5,value=17915},
			    		{type=7,value=17915},
						{type=17,value=1426},
						{type=19,value=3088},
						{type=21,value=762},
						{type=23,value=1252},
						{type=25,value=762},
						{type=27,value=1252},
					},
					-- 23 级
					{
						{type=5,value=18293},
			    		{type=7,value=18293},
						{type=17,value=1441},
						{type=19,value=3126},
						{type=21,value=774},
						{type=23,value=1270},
						{type=25,value=774},
						{type=27,value=1270},
					},
					-- 24 级
					{
						{type=5,value=18671},
			    		{type=7,value=18671},
						{type=17,value=1456},
						{type=19,value=3164},
						{type=21,value=786},
						{type=23,value=1288},
						{type=25,value=786},
						{type=27,value=1288},
					},
					-- 25 级
					{
						{type=5,value=19049},
			    		{type=7,value=19049},
						{type=17,value=1471},
						{type=19,value=3202},
						{type=21,value=798},
						{type=23,value=1306},
						{type=25,value=798},
						{type=27,value=1306},
					},
					-- 26 级
					{
						{type=5,value=19427},
			    		{type=7,value=19427},
						{type=17,value=1486},
						{type=19,value=3240},
						{type=21,value=810},
						{type=23,value=1324},
						{type=25,value=810},
						{type=27,value=1324},
					},
					-- 27 级
					{
						{type=5,value=19805},
			    		{type=7,value=19805},
						{type=17,value=1501},
						{type=19,value=3278},
						{type=21,value=822},
						{type=23,value=1342},
						{type=25,value=822},
						{type=27,value=1342},
					},
					-- 28 级
					{
						{type=5,value=20183},
			    		{type=7,value=20183},
						{type=17,value=1516},
						{type=19,value=3316},
						{type=21,value=834},
						{type=23,value=1360},
						{type=25,value=834},
						{type=27,value=1360},
					},
					-- 29 级
					{
						{type=5,value=20561},
			    		{type=7,value=20561},
						{type=17,value=1531},
						{type=19,value=3354},
						{type=21,value=846},
						{type=23,value=1378},
						{type=25,value=846},
						{type=27,value=1378},
					},
					-- 30 级
					{
						{type=5,value=20939},
			    		{type=7,value=20939},
						{type=17,value=1546},
						{type=19,value=3392},
						{type=21,value=858},
						{type=23,value=1396},
						{type=25,value=858},
						{type=27,value=1396},
					},
					-- 31 级
					{
						{type=5,value=21317},
			    		{type=7,value=21317},
						{type=17,value=1561},
						{type=19,value=3430},
						{type=21,value=870},
						{type=23,value=1414},
						{type=25,value=870},
						{type=27,value=1414},
					},
					-- 32 级
					{
						{type=5,value=21695},
			    		{type=7,value=21695},
						{type=17,value=1576},
						{type=19,value=3468},
						{type=21,value=882},
						{type=23,value=1432},
						{type=25,value=882},
						{type=27,value=1432},
					},
					-- 33 级
					{
						{type=5,value=32869},
			    		{type=7,value=32869},
						{type=17,value=2872},
						{type=19,value=6186},
						{type=21,value=1532},
						{type=23,value=2520},
						{type=25,value=1532},
						{type=27,value=2520},
					},
					-- 34 级
					{
						{type=5,value=33373},
			    		{type=7,value=33373},
						{type=17,value=2897},
						{type=19,value=6244},
						{type=21,value=1548},
						{type=23,value=2544},
						{type=25,value=1548},
						{type=27,value=2544},
					},
					-- 35 级
					{
						{type=5,value=33877},
			    		{type=7,value=33877},
						{type=17,value=2922},
						{type=19,value=6302},
						{type=21,value=1564},
						{type=23,value=2568},
						{type=25,value=1564},
						{type=27,value=2568},
					},
					-- 36 级
					{
						{type=5,value=34381},
			    		{type=7,value=34381},
						{type=17,value=2947},
						{type=19,value=6360},
						{type=21,value=1580},
						{type=23,value=2592},
						{type=25,value=1580},
						{type=27,value=2592},
					},
					-- 37 级
					{
						{type=5,value=34885},
			    		{type=7,value=34885},
						{type=17,value=2972},
						{type=19,value=6418},
						{type=21,value=1596},
						{type=23,value=2616},
						{type=25,value=1596},
						{type=27,value=2616},
					},
					-- 38 级
					{
						{type=5,value=35389},
			    		{type=7,value=35389},
						{type=17,value=2997},
						{type=19,value=6476},
						{type=21,value=1612},
						{type=23,value=2640},
						{type=25,value=1612},
						{type=27,value=2640},
					},
					-- 39 级
					{
						{type=5,value=35893},
			    		{type=7,value=35893},
						{type=17,value=3022},
						{type=19,value=6534},
						{type=21,value=1628},
						{type=23,value=2664},
						{type=25,value=1628},
						{type=27,value=2664},
					},
					-- 40 级
					{
						{type=5,value=36397},
			    		{type=7,value=36397},
						{type=17,value=3047},
						{type=19,value=6592},
						{type=21,value=1644},
						{type=23,value=2688},
						{type=25,value=1644},
						{type=27,value=2688},
					},
					-- 41 级
					{
						{type=5,value=36901},
			    		{type=7,value=36901},
						{type=17,value=3072},
						{type=19,value=6650},
						{type=21,value=1660},
						{type=23,value=2712},
						{type=25,value=1660},
						{type=27,value=2712},
					},
					-- 42 级
					{
						{type=5,value=37405},
			    		{type=7,value=37405},
						{type=17,value=3097},
						{type=19,value=6708},
						{type=21,value=1676},
						{type=23,value=2736},
						{type=25,value=1676},
						{type=27,value=2736},
					},
					-- 43 级
					{
						{type=5,value=37909},
			    		{type=7,value=37909},
						{type=17,value=3122},
						{type=19,value=6766},
						{type=21,value=1692},
						{type=23,value=2760},
						{type=25,value=1692},
						{type=27,value=2760},
					},

					
					-- 44 级
					{
						{type=5,value=54669},
			    		{type=7,value=54669},
						{type=17,value=5234},
						{type=19,value=11154},
						{type=21,value=2742},
						{type=23,value=4538},
						{type=25,value=2742},
						{type=27,value=4538},
					},

					-- 45 级
					{
						{type=5,value=55299},
			    		{type=7,value=55299},
						{type=17,value=5270},
						{type=19,value=11234},
						{type=21,value=2762},
						{type=23,value=4568},
						{type=25,value=2762},
						{type=27,value=4568},
					},

					-- 46 级
					{
						{type=5,value=55929},
			    		{type=7,value=55929},
						{type=17,value=5306},
						{type=19,value=11314},
						{type=21,value=2782},
						{type=23,value=4598},
						{type=25,value=2782},
						{type=27,value=4598},
					},

					-- 47 级
					{
						{type=5,value=56559},
			    		{type=7,value=56559},
						{type=17,value=5342},
						{type=19,value=11394},
						{type=21,value=2802},
						{type=23,value=4628},
						{type=25,value=2802},
						{type=27,value=4628},
					},

					-- 48 级
					{
						{type=5,value=57189},
			    		{type=7,value=57189},
						{type=17,value=5378},
						{type=19,value=11474},
						{type=21,value=2822},
						{type=23,value=4658},
						{type=25,value=2822},
						{type=27,value=4658},
					},

					-- 49 级
					{
						{type=5,value=57819},
			    		{type=7,value=57819},
						{type=17,value=5414},
						{type=19,value=11554},
						{type=21,value=2842},
						{type=23,value=4688},
						{type=25,value=2842},
						{type=27,value=4688},
					},

					-- 50 级
					{
						{type=5,value=58449},
			    		{type=7,value=58449},
						{type=17,value=5450},
						{type=19,value=11634},
						{type=21,value=2862},
						{type=23,value=4718},
						{type=25,value=2862},
						{type=27,value=4718},
					},

					-- 51 级
					{
						{type=5,value=59079},
			    		{type=7,value=59079},
						{type=17,value=5486},
						{type=19,value=11714},
						{type=21,value=2882},
						{type=23,value=4748},
						{type=25,value=2882},
						{type=27,value=4748},
					},

					-- 52 级
					{
						{type=5,value=59709},
			    		{type=7,value=59709},
						{type=17,value=5522},
						{type=19,value=11794},
						{type=21,value=2902},
						{type=23,value=4778},
						{type=25,value=2902},
						{type=27,value=4778},
					},

					-- 53 级
					{
						{type=5,value=60339},
			    		{type=7,value=60339},
						{type=17,value=5558},
						{type=19,value=11874},
						{type=21,value=2922},
						{type=23,value=4808},
						{type=25,value=2922},
						{type=27,value=4808},
					},

					-- 54 级
					{
						{type=5,value=60969},
			    		{type=7,value=60969},
						{type=17,value=5594},
						{type=19,value=11954},
						{type=21,value=2942},
						{type=23,value=4838},
						{type=25,value=2942},
						{type=27,value=4838},
					},

					-- 55 级
					{
						{type=5,value=84992},
			    		{type=7,value=84992},
						{type=17,value=8353},
						{type=19,value=18852},
						{type=21,value=4495},
						{type=23,value=7426},
						{type=25,value=4495},
						{type=27,value=7426},
					},

					-- 56 级
					{
						{type=5,value=85748},
			    		{type=7,value=85748},
						{type=17,value=8392},
						{type=19,value=18950},
						{type=21,value=4519},
						{type=23,value=7462},
						{type=25,value=4519},
						{type=27,value=7462},
					},

					-- 57 级
					{
						{type=5,value=86504},
			    		{type=7,value=86504},
						{type=17,value=8431},
						{type=19,value=19048},
						{type=21,value=4543},
						{type=23,value=7498},
						{type=25,value=4543},
						{type=27,value=7498},
					},

					-- 58 级
					{
						{type=5,value=87260},
			    		{type=7,value=87260},
						{type=17,value=8470},
						{type=19,value=19146},
						{type=21,value=4567},
						{type=23,value=7534},
						{type=25,value=4567},
						{type=27,value=7534},
					},

					-- 59 级
					{
						{type=5,value=88016},
			    		{type=7,value=88016},
						{type=17,value=8509},
						{type=19,value=19244},
						{type=21,value=4591},
						{type=23,value=7570},
						{type=25,value=4591},
						{type=27,value=7570},
					},

					-- 60 级
					{
						{type=5,value=88772},
			    		{type=7,value=88772},
						{type=17,value=8548},
						{type=19,value=19342},
						{type=21,value=4615},
						{type=23,value=7606},
						{type=25,value=4615},
						{type=27,value=7606},
					},

					-- 61 级
					{
						{type=5,value=89528},
			    		{type=7,value=89528},
						{type=17,value=8587},
						{type=19,value=19440},
						{type=21,value=4639},
						{type=23,value=7642},
						{type=25,value=4639},
						{type=27,value=7642},
					},

					-- 62 级
					{
						{type=5,value=90284},
			    		{type=7,value=90284},
						{type=17,value=8626},
						{type=19,value=19538},
						{type=21,value=4663},
						{type=23,value=7678},
						{type=25,value=4663},
						{type=27,value=7678},
					},

					-- 63 级
					{
						{type=5,value=91040},
			    		{type=7,value=91040},
						{type=17,value=8665},
						{type=19,value=19636},
						{type=21,value=4687},
						{type=23,value=7714},
						{type=25,value=4687},
						{type=27,value=7714},
					},

					-- 64 级
					{
						{type=5,value=91796},
			    		{type=7,value=91796},
						{type=17,value=8704},
						{type=19,value=19734},
						{type=21,value=4711},
						{type=23,value=7750},
						{type=25,value=4711},
						{type=27,value=7750},
					},

					-- 65 级
					{
						{type=5,value=92552},
			    		{type=7,value=92552},
						{type=17,value=8743},
						{type=19,value=19832},
						{type=21,value=4735},
						{type=23,value=7786},
						{type=25,value=4735},
						{type=27,value=7786},
					},

					-- 66 级
					{
						{type=5,value=124955},
			    		{type=7,value=124955},
						{type=17,value=12658},
						{type=19,value=29620},
						{type=21,value=6888},
						{type=23,value=11374},
						{type=25,value=6888},
						{type=27,value=11374},
					},

					-- 67 级
					{
						{type=5,value=125837},
			    		{type=7,value=125837},
						{type=17,value=12704},
						{type=19,value=29734},
						{type=21,value=6916},
						{type=23,value=11416},
						{type=25,value=6916},
						{type=27,value=11416},
					},

					-- 68 级
					{
						{type=5,value=126719},
			    		{type=7,value=126719},
						{type=17,value=12750},
						{type=19,value=29848},
						{type=21,value=6944},
						{type=23,value=11458},
						{type=25,value=6944},
						{type=27,value=11458},
					},

					-- 69 级
					{
						{type=5,value=127601},
			    		{type=7,value=127601},
						{type=17,value=12796},
						{type=19,value=29962},
						{type=21,value=6972},
						{type=23,value=11500},
						{type=25,value=6972},
						{type=27,value=11500},
					},

					-- 70 级
					{
						{type=5,value=128483},
			    		{type=7,value=128483},
						{type=17,value=12842},
						{type=19,value=30076},
						{type=21,value=7000},
						{type=23,value=11542},
						{type=25,value=7000},
						{type=27,value=11542},
					},

					-- 71 级
					{
						{type=5,value=129365},
			    		{type=7,value=129365},
						{type=17,value=12888},
						{type=19,value=30190},
						{type=21,value=7028},
						{type=23,value=11584},
						{type=25,value=7028},
						{type=27,value=11584},
					},

					-- 72 级
					{
						{type=5,value=130247},
			    		{type=7,value=130247},
						{type=17,value=12934},
						{type=19,value=30304},
						{type=21,value=7056},
						{type=23,value=11626},
						{type=25,value=7056},
						{type=27,value=11626},
					},

					-- 73 级
					{
						{type=5,value=131129},
			    		{type=7,value=131129},
						{type=17,value=12980},
						{type=19,value=30418},
						{type=21,value=7084},
						{type=23,value=11668},
						{type=25,value=7084},
						{type=27,value=11668},
					},

					-- 74 级
					{
						{type=5,value=132011},
			    		{type=7,value=132011},
						{type=17,value=13026},
						{type=19,value=30532},
						{type=21,value=7112},
						{type=23,value=11710},
						{type=25,value=7112},
						{type=27,value=11710},
					},

					-- 75 级
					{
						{type=5,value=132893},
			    		{type=7,value=132893},
						{type=17,value=13072},
						{type=19,value=30646},
						{type=21,value=7140},
						{type=23,value=11752},
						{type=25,value=7140},
						{type=27,value=11752},
					},

					-- 76 级
					{
						{type=5,value=133775},
			    		{type=7,value=133775},
						{type=17,value=13118},
						{type=19,value=30760},
						{type=21,value=7168},
						{type=23,value=11794},
						{type=25,value=7168},
						{type=27,value=11794},
					},

					-- 77 级
					{
						{type=5,value=150535},
			    		{type=7,value=150535},
						{type=17,value=18353},
						{type=19,value=43848},
						{type=21,value=10101},
						{type=23,value=16682},
						{type=25,value=10101},
						{type=27,value=16682},
					},

					-- 78 级
					{
						{type=5,value=151543},
			    		{type=7,value=151543},
						{type=17,value=18404},
						{type=19,value=43976},
						{type=21,value=10133},
						{type=23,value=16730},
						{type=25,value=10133},
						{type=27,value=16730},
					},

					-- 79 级
					{
						{type=5,value=152551},
			    		{type=7,value=152551},
						{type=17,value=18455},
						{type=19,value=44104},
						{type=21,value=10165},
						{type=23,value=16778},
						{type=25,value=10165},
						{type=27,value=16778},
					},

					-- 80 级
					{
						{type=5,value=153559},
			    		{type=7,value=153559},
						{type=17,value=18506},
						{type=19,value=44232},
						{type=21,value=10197},
						{type=23,value=16826},
						{type=25,value=10197},
						{type=27,value=16826},
					},

					-- 81 级
					{
						{type=5,value=154567},
			    		{type=7,value=154567},
						{type=17,value=18557},
						{type=19,value=44360},
						{type=21,value=10229},
						{type=23,value=16874},
						{type=25,value=10229},
						{type=27,value=16874},
					},

					-- 82 级
					{
						{type=5,value=155575},
			    		{type=7,value=155575},
						{type=17,value=18608},
						{type=19,value=44488},
						{type=21,value=10261},
						{type=23,value=16922},
						{type=25,value=10261},
						{type=27,value=16922},
					},

					-- 83 级
					{
						{type=5,value=156583},
			    		{type=7,value=156583},
						{type=17,value=18659},
						{type=19,value=44616},
						{type=21,value=10293},
						{type=23,value=16970},
						{type=25,value=10293},
						{type=27,value=16970},
					},

					-- 84 级
					{
						{type=5,value=157591},
			    		{type=7,value=157591},
						{type=17,value=18710},
						{type=19,value=44744},
						{type=21,value=10325},
						{type=23,value=17018},
						{type=25,value=10325},
						{type=27,value=17018},
					},

					-- 85 级
					{
						{type=5,value=158599},
			    		{type=7,value=158599},
						{type=17,value=18761},
						{type=19,value=44872},
						{type=21,value=10357},
						{type=23,value=17066},
						{type=25,value=10357},
						{type=27,value=17066},
					},

					-- 86 级
					{
						{type=5,value=159607},
			    		{type=7,value=159607},
						{type=17,value=18812},
						{type=19,value=45000},
						{type=21,value=10389},
						{type=23,value=17114},
						{type=25,value=10389},
						{type=27,value=17114},
					},

					-- 87 级
					{
						{type=5,value=160615},
			    		{type=7,value=160615},
						{type=17,value=18863},
						{type=19,value=45128},
						{type=21,value=10421},
						{type=23,value=17162},
						{type=25,value=10421},
						{type=27,value=17162},
					},

					-- 88 级
					{
						{type=5,value=177375},
			    		{type=7,value=177375},
						{type=17,value=25538},
						{type=19,value=61816},
						{type=21,value=14374},
						{type=23,value=23750},
						{type=25,value=14374},
						{type=27,value=23750},
					},

					-- 89 级
					{
						{type=5,value=178509},
			    		{type=7,value=178509},
						{type=17,value=25594},
						{type=19,value=61956},
						{type=21,value=14410},
						{type=23,value=23804},
						{type=25,value=14410},
						{type=27,value=23804},
					},

					-- 90 级
					{
						{type=5,value=179643},
			    		{type=7,value=179643},
						{type=17,value=25650},
						{type=19,value=62096},
						{type=21,value=14446},
						{type=23,value=23858},
						{type=25,value=14446},
						{type=27,value=23858},
					},

					-- 91 级
					{
						{type=5,value=180777},
			    		{type=7,value=180777},
						{type=17,value=25706},
						{type=19,value=62236},
						{type=21,value=14482},
						{type=23,value=23912},
						{type=25,value=14482},
						{type=27,value=23912},
					},

					-- 92 级
					{
						{type=5,value=181911},
			    		{type=7,value=181911},
						{type=17,value=25762},
						{type=19,value=62376},
						{type=21,value=14518},
						{type=23,value=23966},
						{type=25,value=14518},
						{type=27,value=23966},
					},

					-- 93 级
					{
						{type=5,value=183045},
			    		{type=7,value=183045},
						{type=17,value=25818},
						{type=19,value=62516},
						{type=21,value=14554},
						{type=23,value=24020},
						{type=25,value=14554},
						{type=27,value=24020},
					},

					-- 94 级
					{
						{type=5,value=184179},
			    		{type=7,value=184179},
						{type=17,value=25874},
						{type=19,value=62656},
						{type=21,value=14590},
						{type=23,value=24074},
						{type=25,value=14590},
						{type=27,value=24074},
					},

					-- 95 级
					{
						{type=5,value=185313},
			    		{type=7,value=185313},
						{type=17,value=25930},
						{type=19,value=62796},
						{type=21,value=14626},
						{type=23,value=24128},
						{type=25,value=14626},
						{type=27,value=24128},
					},

					-- 96 级
					{
						{type=5,value=186447},
			    		{type=7,value=186447},
						{type=17,value=25986},
						{type=19,value=62936},
						{type=21,value=14662},
						{type=23,value=24182},
						{type=25,value=14662},
						{type=27,value=24182},
					},

					-- 97 级
					{
						{type=5,value=187581},
			    		{type=7,value=187581},
						{type=17,value=26042},
						{type=19,value=63076},
						{type=21,value=14698},
						{type=23,value=24236},
						{type=25,value=14698},
						{type=27,value=24236},
					},

					-- 98 级
					{
						{type=5,value=188715},
			    		{type=7,value=188715},
						{type=17,value=26098},
						{type=19,value=63216},
						{type=21,value=14734},
						{type=23,value=24290},
						{type=25,value=14734},
						{type=27,value=24290},
					},

					
				},
			},
		},
		----------------------------- 时装 4 小龙女
				{
			-- 战
			{
				itemId = 5950, --升阶所需道具
				
				inShowIds = {183,184,185,186,309,310,311,312,313}, -- 每阶一个内观
				outShowIds = {183,184,185,186,309,310,311,312,313}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 5951, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,8,8,8,8,8,8,8,8,8,8,4,20,20,20,20,20,20,20,20,20,20,8,40,40,40,40,40,40,40,40,40,40,16,80,80,80,80,80,80,80,80,80,80,
				28,120,120,120,120,120,120,120,120,120,120,42,160,160,160,160,160,160,160,160,160,160,58,200,200,200,200,200,200,200,200,200,200,76,240,240
				,240,240,240,240,240,240,240,240,96,280,280,280,280,280,280,280,280,280,280,},
				
					-- --模块
					-- -- (a1) 级
					-- {
					-- 	{type=(a2),value=(a3)},
			    	-- 	{type=(a4),value=(a5)},
					-- 	{type=(a6),value=(a7)},
					-- 	{type=(a8),value=(a9)},
					-- 	{type=(a10),value=(a11)},
					-- 	{type=(a12),value=(a13)},
					-- 	{type=(a14),value=(a15)},
					-- 	{type=(a16),value=(a17)},
					-- },


				attrs = {
									-- 0 级
					{
						{type=5,value=4500},
			    		{type=7,value=455},
						{type=9,value=150},
						{type=11,value=315},
						{type=21,value=76},
						{type=23,value=126},
						{type=25,value=76},
						{type=27,value=126},
					},
					-- 1 级
					{
						{type=5,value=4725},
			    		{type=7,value=477},
						{type=9,value=155},
						{type=11,value=331},
						{type=21,value=80},
						{type=23,value=132},
						{type=25,value=80},
						{type=27,value=132},
					},
					-- 2 级
					{
						{type=5,value=4950},
			    		{type=7,value=499},
						{type=9,value=160},
						{type=11,value=347},
						{type=21,value=84},
						{type=23,value=138},
						{type=25,value=84},
						{type=27,value=138},
					},
					-- 3 级
					{
						{type=5,value=5175},
			    		{type=7,value=521},
						{type=9,value=165},
						{type=11,value=363},
						{type=21,value=88},
						{type=23,value=144},
						{type=25,value=88},
						{type=27,value=144},
					},
					-- 4 级
					{
						{type=5,value=5400},
			    		{type=7,value=543},
						{type=9,value=170},
						{type=11,value=379},
						{type=21,value=92},
						{type=23,value=150},
						{type=25,value=92},
						{type=27,value=150},
					},
					-- 5 级
					{
						{type=5,value=5625},
			    		{type=7,value=565},
						{type=9,value=175},
						{type=11,value=395},
						{type=21,value=96},
						{type=23,value=156},
						{type=25,value=96},
						{type=27,value=156},
					},
					-- 6 级
					{
						{type=5,value=5850},
			    		{type=7,value=587},
						{type=9,value=180},
						{type=11,value=411},
						{type=21,value=100},
						{type=23,value=162},
						{type=25,value=100},
						{type=27,value=162},
					},
					-- 7 级
					{
						{type=5,value=6075},
			    		{type=7,value=609},
						{type=9,value=185},
						{type=11,value=427},
						{type=21,value=104},
						{type=23,value=168},
						{type=25,value=104},
						{type=27,value=168},
					},
					-- 8 级
					{
						{type=5,value=6300},
			    		{type=7,value=631},
						{type=9,value=190},
						{type=11,value=443},
						{type=21,value=108},
						{type=23,value=174},
						{type=25,value=108},
						{type=27,value=174},
					},
					-- 9 级
					{
						{type=5,value=6525},
			    		{type=7,value=653},
						{type=9,value=195},
						{type=11,value=459},
						{type=21,value=112},
						{type=23,value=180},
						{type=25,value=112},
						{type=27,value=180},
					},
					-- 10 级
					{
						{type=5,value=6750},
			    		{type=7,value=675},
						{type=9,value=200},
						{type=11,value=475},
						{type=21,value=116},
						{type=23,value=186},
						{type=25,value=116},
						{type=27,value=186},
					},
					-- 11 级
					{
						{type=5,value=14750},
			    		{type=7,value=1483},
						{type=9,value=590},
						{type=11,value=1293},
						{type=21,value=312},
						{type=23,value=514},
						{type=25,value=312},
						{type=27,value=514},
					},
					-- 12 级
					{
						{type=5,value=15200},
			    		{type=7,value=1527},
						{type=9,value=600},
						{type=11,value=1318},
						{type=21,value=320},
						{type=23,value=526},
						{type=25,value=320},
						{type=27,value=526},
					},
					-- 13 级
					{
						{type=5,value=15650},
			    		{type=7,value=1571},
						{type=9,value=610},
						{type=11,value=1343},
						{type=21,value=328},
						{type=23,value=538},
						{type=25,value=328},
						{type=27,value=538},
					},
					-- 14 级
					{
						{type=5,value=16100},
			    		{type=7,value=1615},
						{type=9,value=620},
						{type=11,value=1368},
						{type=21,value=336},
						{type=23,value=550},
						{type=25,value=336},
						{type=27,value=550},
					},
					-- 15 级
					{
						{type=5,value=16550},
			    		{type=7,value=1659},
						{type=9,value=630},
						{type=11,value=1393},
						{type=21,value=344},
						{type=23,value=562},
						{type=25,value=344},
						{type=27,value=562},
					},
					-- 16 级
					{
						{type=5,value=17000},
			    		{type=7,value=1703},
						{type=9,value=640},
						{type=11,value=1418},
						{type=21,value=352},
						{type=23,value=574},
						{type=25,value=352},
						{type=27,value=574},
					},
					-- 17 级
					{
						{type=5,value=17450},
			    		{type=7,value=1747},
						{type=9,value=650},
						{type=11,value=1443},
						{type=21,value=360},
						{type=23,value=586},
						{type=25,value=360},
						{type=27,value=586},
					},
					-- 18 级
					{
						{type=5,value=17900},
			    		{type=7,value=1791},
						{type=9,value=660},
						{type=11,value=1468},
						{type=21,value=368},
						{type=23,value=598},
						{type=25,value=368},
						{type=27,value=598},
					},
					-- 19 级
					{
						{type=5,value=18350},
			    		{type=7,value=1835},
						{type=9,value=670},
						{type=11,value=1493},
						{type=21,value=376},
						{type=23,value=610},
						{type=25,value=376},
						{type=27,value=610},
					},
					-- 20 级
					{
						{type=5,value=18800},
			    		{type=7,value=1879},
						{type=9,value=680},
						{type=11,value=1518},
						{type=21,value=384},
						{type=23,value=622},
						{type=25,value=384},
						{type=27,value=622},
					},
					-- 21 级
					{
						{type=5,value=19250},
			    		{type=7,value=1923},
						{type=9,value=690},
						{type=11,value=1543},
						{type=21,value=392},
						{type=23,value=634},
						{type=25,value=392},
						{type=27,value=634},
					},
					-- 22 级
					{
						{type=5,value=32050},
			    		{type=7,value=3216},
						{type=9,value=1426},
						{type=11,value=3088},
						{type=21,value=762},
						{type=23,value=1252},
						{type=25,value=762},
						{type=27,value=1252},
					},
					-- 23 级
					{
						{type=5,value=32725},
			    		{type=7,value=3282},
						{type=9,value=1441},
						{type=11,value=3126},
						{type=21,value=774},
						{type=23,value=1270},
						{type=25,value=774},
						{type=27,value=1270},
					},
					-- 24 级
					{
						{type=5,value=33400},
			    		{type=7,value=3348},
						{type=9,value=1456},
						{type=11,value=3164},
						{type=21,value=786},
						{type=23,value=1288},
						{type=25,value=786},
						{type=27,value=1288},
					},
					-- 25 级
					{
						{type=5,value=34075},
			    		{type=7,value=3414},
						{type=9,value=1471},
						{type=11,value=3202},
						{type=21,value=798},
						{type=23,value=1306},
						{type=25,value=798},
						{type=27,value=1306},
					},
					-- 26 级
					{
						{type=5,value=34750},
			    		{type=7,value=3480},
						{type=9,value=1486},
						{type=11,value=3240},
						{type=21,value=810},
						{type=23,value=1324},
						{type=25,value=810},
						{type=27,value=1324},
					},
					-- 27 级
					{
						{type=5,value=35425},
			    		{type=7,value=3546},
						{type=9,value=1501},
						{type=11,value=3278},
						{type=21,value=822},
						{type=23,value=1342},
						{type=25,value=822},
						{type=27,value=1342},
					},
					-- 28 级
					{
						{type=5,value=36100},
			    		{type=7,value=3612},
						{type=9,value=1516},
						{type=11,value=3316},
						{type=21,value=834},
						{type=23,value=1360},
						{type=25,value=834},
						{type=27,value=1360},
					},
					-- 29 级
					{
						{type=5,value=36775},
			    		{type=7,value=3678},
						{type=9,value=1531},
						{type=11,value=3354},
						{type=21,value=846},
						{type=23,value=1378},
						{type=25,value=846},
						{type=27,value=1378},
					},
					-- 30 级
					{
						{type=5,value=37450},
			    		{type=7,value=3744},
						{type=9,value=1546},
						{type=11,value=3392},
						{type=21,value=858},
						{type=23,value=1396},
						{type=25,value=858},
						{type=27,value=1396},
					},
					-- 31 级
					{
						{type=5,value=38125},
			    		{type=7,value=3810},
						{type=9,value=1561},
						{type=11,value=3430},
						{type=21,value=870},
						{type=23,value=1414},
						{type=25,value=870},
						{type=27,value=1414},
					},
					-- 32 级
					{
						{type=5,value=38800},
			    		{type=7,value=3876},
						{type=9,value=1576},
						{type=11,value=3468},
						{type=21,value=882},
						{type=23,value=1432},
						{type=25,value=882},
						{type=27,value=1432},
					},
					-- 33 级
					{
						{type=5,value=58800},
			    		{type=7,value=5896},
						{type=9,value=2872},
						{type=11,value=6186},
						{type=21,value=1532},
						{type=23,value=2520},
						{type=25,value=1532},
						{type=27,value=2520},
					},
					-- 34 级
					{
						{type=5,value=59700},
			    		{type=7,value=5984},
						{type=9,value=2897},
						{type=11,value=6244},
						{type=21,value=1548},
						{type=23,value=2544},
						{type=25,value=1548},
						{type=27,value=2544},
					},
					-- 35 级
					{
						{type=5,value=60600},
			    		{type=7,value=6072},
						{type=9,value=2922},
						{type=11,value=6302},
						{type=21,value=1564},
						{type=23,value=2568},
						{type=25,value=1564},
						{type=27,value=2568},
					},
					-- 36 级
					{
						{type=5,value=61500},
			    		{type=7,value=6160},
						{type=9,value=2947},
						{type=11,value=6360},
						{type=21,value=1580},
						{type=23,value=2592},
						{type=25,value=1580},
						{type=27,value=2592},
					},
					-- 37 级
					{
						{type=5,value=62400},
			    		{type=7,value=6248},
						{type=9,value=2972},
						{type=11,value=6418},
						{type=21,value=1596},
						{type=23,value=2616},
						{type=25,value=1596},
						{type=27,value=2616},
					},
					-- 38 级
					{
						{type=5,value=63300},
			    		{type=7,value=6336},
						{type=9,value=2997},
						{type=11,value=6476},
						{type=21,value=1612},
						{type=23,value=2640},
						{type=25,value=1612},
						{type=27,value=2640},
					},
					-- 39 级
					{
						{type=5,value=64200},
			    		{type=7,value=6424},
						{type=9,value=3022},
						{type=11,value=6534},
						{type=21,value=1628},
						{type=23,value=2664},
						{type=25,value=1628},
						{type=27,value=2664},
					},
					-- 40 级
					{
						{type=5,value=65100},
			    		{type=7,value=6512},
						{type=9,value=3047},
						{type=11,value=6592},
						{type=21,value=1644},
						{type=23,value=2688},
						{type=25,value=1644},
						{type=27,value=2688},
					},
					-- 41 级
					{
						{type=5,value=66000},
			    		{type=7,value=6600},
						{type=9,value=3072},
						{type=11,value=6650},
						{type=21,value=1660},
						{type=23,value=2712},
						{type=25,value=1660},
						{type=27,value=2712},
					},
					-- 42 级
					{
						{type=5,value=66900},
			    		{type=7,value=6688},
						{type=9,value=3097},
						{type=11,value=6708},
						{type=21,value=1676},
						{type=23,value=2736},
						{type=25,value=1676},
						{type=27,value=2736},
					},
					-- 43 级
					{
						{type=5,value=67800},
			    		{type=7,value=6776},
						{type=9,value=3122},
						{type=11,value=6766},
						{type=21,value=1692},
						{type=23,value=2760},
						{type=25,value=1692},
						{type=27,value=2760},
					},


					
										-- 44 级
					{
						{type=5,value=97800},
			    		{type=7,value=9806},
						{type=9,value=5234},
						{type=11,value=11154},
						{type=21,value=2742},
						{type=23,value=4538},
						{type=25,value=2742},
						{type=27,value=4538},
					},
					-- 45 级
					{
						{type=5,value=98925},
			    		{type=7,value=9916},
						{type=9,value=5270},
						{type=11,value=11234},
						{type=21,value=2762},
						{type=23,value=4568},
						{type=25,value=2762},
						{type=27,value=4568},
					},
					-- 46 级
					{
						{type=5,value=100050},
			    		{type=7,value=10026},
						{type=9,value=5306},
						{type=11,value=11314},
						{type=21,value=2782},
						{type=23,value=4598},
						{type=25,value=2782},
						{type=27,value=4598},
					},
					-- 47 级
					{
						{type=5,value=101175},
			    		{type=7,value=10136},
						{type=9,value=5342},
						{type=11,value=11394},
						{type=21,value=2802},
						{type=23,value=4628},
						{type=25,value=2802},
						{type=27,value=4628},
					},
					-- 48 级
					{
						{type=5,value=102300},
			    		{type=7,value=10246},
						{type=9,value=5378},
						{type=11,value=11474},
						{type=21,value=2822},
						{type=23,value=4658},
						{type=25,value=2822},
						{type=27,value=4658},
					},
					-- 49 级
					{
						{type=5,value=103425},
			    		{type=7,value=10356},
						{type=9,value=5414},
						{type=11,value=11554},
						{type=21,value=2842},
						{type=23,value=4688},
						{type=25,value=2842},
						{type=27,value=4688},
					},
					-- 50 级
					{
						{type=5,value=104550},
			    		{type=7,value=10466},
						{type=9,value=5450},
						{type=11,value=11634},
						{type=21,value=2862},
						{type=23,value=4718},
						{type=25,value=2862},
						{type=27,value=4718},
					},
					-- 51 级
					{
						{type=5,value=105675},
			    		{type=7,value=10576},
						{type=9,value=5486},
						{type=11,value=11714},
						{type=21,value=2882},
						{type=23,value=4748},
						{type=25,value=2882},
						{type=27,value=4748},
					},
					-- 52 级
					{
						{type=5,value=106800},
			    		{type=7,value=10686},
						{type=9,value=5522},
						{type=11,value=11794},
						{type=21,value=2902},
						{type=23,value=4778},
						{type=25,value=2902},
						{type=27,value=4778},
					},
					-- 53 级
					{
						{type=5,value=107925},
			    		{type=7,value=10796},
						{type=9,value=5558},
						{type=11,value=11874},
						{type=21,value=2922},
						{type=23,value=4808},
						{type=25,value=2922},
						{type=27,value=4808},
					},
					-- 54 级
					{
						{type=5,value=109050},
			    		{type=7,value=10906},
						{type=9,value=5594},
						{type=11,value=11954},
						{type=21,value=2942},
						{type=23,value=4838},
						{type=25,value=2942},
						{type=27,value=4838},
					},
					-- 55 级
					{
						{type=5,value=152050},
			    		{type=7,value=15249},
						{type=9,value=8353},
						{type=11,value=18852},
						{type=21,value=4495},
						{type=23,value=7426},
						{type=25,value=4495},
						{type=27,value=7426},
					},
					-- 56 级
					{
						{type=5,value=153400},
			    		{type=7,value=15384},
						{type=9,value=8392},
						{type=11,value=18950},
						{type=21,value=4519},
						{type=23,value=7462},
						{type=25,value=4519},
						{type=27,value=7462},
					},
					-- 57 级
					{
						{type=5,value=154750},
			    		{type=7,value=15519},
						{type=9,value=8431},
						{type=11,value=19048},
						{type=21,value=4543},
						{type=23,value=7498},
						{type=25,value=4543},
						{type=27,value=7498},
					},
					-- 58 级
					{
						{type=5,value=156100},
			    		{type=7,value=15654},
						{type=9,value=8470},
						{type=11,value=19146},
						{type=21,value=4567},
						{type=23,value=7534},
						{type=25,value=4567},
						{type=27,value=7534},
					},
					-- 59 级
					{
						{type=5,value=157450},
			    		{type=7,value=15789},
						{type=9,value=8509},
						{type=11,value=19244},
						{type=21,value=4591},
						{type=23,value=7570},
						{type=25,value=4591},
						{type=27,value=7570},
					},
					-- 60 级
					{
						{type=5,value=158800},
			    		{type=7,value=15924},
						{type=9,value=8548},
						{type=11,value=19342},
						{type=21,value=4615},
						{type=23,value=7606},
						{type=25,value=4615},
						{type=27,value=7606},
					},
					-- 61 级
					{
						{type=5,value=160150},
			    		{type=7,value=16059},
						{type=9,value=8587},
						{type=11,value=19440},
						{type=21,value=4639},
						{type=23,value=7642},
						{type=25,value=4639},
						{type=27,value=7642},
					},
					-- 62 级
					{
						{type=5,value=161500},
			    		{type=7,value=16194},
						{type=9,value=8626},
						{type=11,value=19538},
						{type=21,value=4663},
						{type=23,value=7678},
						{type=25,value=4663},
						{type=27,value=7678},
					},
					-- 63 级
					{
						{type=5,value=162850},
			    		{type=7,value=16329},
						{type=9,value=8665},
						{type=11,value=19636},
						{type=21,value=4687},
						{type=23,value=7714},
						{type=25,value=4687},
						{type=27,value=7714},
					},
					-- 64 级
					{
						{type=5,value=164200},
			    		{type=7,value=16464},
						{type=9,value=8704},
						{type=11,value=19734},
						{type=21,value=4711},
						{type=23,value=7750},
						{type=25,value=4711},
						{type=27,value=7750},
					},
					-- 65 级
					{
						{type=5,value=165550},
			    		{type=7,value=16599},
						{type=9,value=8743},
						{type=11,value=19832},
						{type=21,value=4735},
						{type=23,value=7786},
						{type=25,value=4735},
						{type=27,value=7786},
					},
					-- 66 级
					{
						{type=5,value=223550},
			    		{type=7,value=22458},
						{type=9,value=12658},
						{type=11,value=29620},
						{type=21,value=6888},
						{type=23,value=11374},
						{type=25,value=6888},
						{type=27,value=11374},
					},
					-- 67 级
					{
						{type=5,value=225125},
			    		{type=7,value=22616},
						{type=9,value=12704},
						{type=11,value=29734},
						{type=21,value=6916},
						{type=23,value=11416},
						{type=25,value=6916},
						{type=27,value=11416},
					},
					-- 68 级
					{
						{type=5,value=226700},
			    		{type=7,value=22774},
						{type=9,value=12750},
						{type=11,value=29848},
						{type=21,value=6944},
						{type=23,value=11458},
						{type=25,value=6944},
						{type=27,value=11458},
					},
					-- 69 级
					{
						{type=5,value=228275},
			    		{type=7,value=22932},
						{type=9,value=12796},
						{type=11,value=29962},
						{type=21,value=6972},
						{type=23,value=11500},
						{type=25,value=6972},
						{type=27,value=11500},
					},
					-- 70 级
					{
						{type=5,value=229850},
			    		{type=7,value=23090},
						{type=9,value=12842},
						{type=11,value=30076},
						{type=21,value=7000},
						{type=23,value=11542},
						{type=25,value=7000},
						{type=27,value=11542},
					},
					-- 71 级
					{
						{type=5,value=231425},
			    		{type=7,value=23248},
						{type=9,value=12888},
						{type=11,value=30190},
						{type=21,value=7028},
						{type=23,value=11584},
						{type=25,value=7028},
						{type=27,value=11584},
					},
					-- 72 级
					{
						{type=5,value=233000},
			    		{type=7,value=23406},
						{type=9,value=12934},
						{type=11,value=30304},
						{type=21,value=7056},
						{type=23,value=11626},
						{type=25,value=7056},
						{type=27,value=11626},
					},
					-- 73 级
					{
						{type=5,value=234575},
			    		{type=7,value=23564},
						{type=9,value=12980},
						{type=11,value=30418},
						{type=21,value=7084},
						{type=23,value=11668},
						{type=25,value=7084},
						{type=27,value=11668},
					},
					-- 74 级
					{
						{type=5,value=236150},
			    		{type=7,value=23722},
						{type=9,value=13026},
						{type=11,value=30532},
						{type=21,value=7112},
						{type=23,value=11710},
						{type=25,value=7112},
						{type=27,value=11710},
					},
					-- 75 级
					{
						{type=5,value=237725},
			    		{type=7,value=23880},
						{type=9,value=13072},
						{type=11,value=30646},
						{type=21,value=7140},
						{type=23,value=11752},
						{type=25,value=7140},
						{type=27,value=11752},
					},
					-- 76 级
					{
						{type=5,value=239300},
			    		{type=7,value=24038},
						{type=9,value=13118},
						{type=11,value=30760},
						{type=21,value=7168},
						{type=23,value=11794},
						{type=25,value=7168},
						{type=27,value=11794},
					},
					-- 77 级
					{
						{type=5,value=314300},
			    		{type=7,value=31614},
						{type=9,value=18353},
						{type=11,value=43848},
						{type=21,value=10101},
						{type=23,value=16682},
						{type=25,value=10101},
						{type=27,value=16682},
					},
					-- 78 级
					{
						{type=5,value=316100},
			    		{type=7,value=31794},
						{type=9,value=18404},
						{type=11,value=43976},
						{type=21,value=10133},
						{type=23,value=16730},
						{type=25,value=10133},
						{type=27,value=16730},
					},
					-- 79 级
					{
						{type=5,value=317900},
			    		{type=7,value=31974},
						{type=9,value=18455},
						{type=11,value=44104},
						{type=21,value=10165},
						{type=23,value=16778},
						{type=25,value=10165},
						{type=27,value=16778},
					},
					-- 80 级
					{
						{type=5,value=319700},
			    		{type=7,value=32154},
						{type=9,value=18506},
						{type=11,value=44232},
						{type=21,value=10197},
						{type=23,value=16826},
						{type=25,value=10197},
						{type=27,value=16826},
					},
					-- 81 级
					{
						{type=5,value=321500},
			    		{type=7,value=32334},
						{type=9,value=18557},
						{type=11,value=44360},
						{type=21,value=10229},
						{type=23,value=16874},
						{type=25,value=10229},
						{type=27,value=16874},
					},
					-- 82 级
					{
						{type=5,value=323300},
			    		{type=7,value=32514},
						{type=9,value=18608},
						{type=11,value=44488},
						{type=21,value=10261},
						{type=23,value=16922},
						{type=25,value=10261},
						{type=27,value=16922},
					},
					-- 83 级
					{
						{type=5,value=325100},
			    		{type=7,value=32694},
						{type=9,value=18659},
						{type=11,value=44616},
						{type=21,value=10293},
						{type=23,value=16970},
						{type=25,value=10293},
						{type=27,value=16970},
					},
					-- 84 级
					{
						{type=5,value=326900},
			    		{type=7,value=32874},
						{type=9,value=18710},
						{type=11,value=44744},
						{type=21,value=10325},
						{type=23,value=17018},
						{type=25,value=10325},
						{type=27,value=17018},
					},
					-- 85 级
					{
						{type=5,value=328700},
			    		{type=7,value=33054},
						{type=9,value=18761},
						{type=11,value=44872},
						{type=21,value=10357},
						{type=23,value=17066},
						{type=25,value=10357},
						{type=27,value=17066},
					},
					-- 86 级
					{
						{type=5,value=330500},
			    		{type=7,value=33234},
						{type=9,value=18812},
						{type=11,value=45000},
						{type=21,value=10389},
						{type=23,value=17114},
						{type=25,value=10389},
						{type=27,value=17114},
					},
					-- 87 级
					{
						{type=5,value=332300},
			    		{type=7,value=33414},
						{type=9,value=18863},
						{type=11,value=45128},
						{type=21,value=10421},
						{type=23,value=17162},
						{type=25,value=10421},
						{type=27,value=17162},
					},
					-- 88 级
					{
						{type=5,value=427300},
			    		{type=7,value=43010},
						{type=9,value=25538},
						{type=11,value=61816},
						{type=21,value=14374},
						{type=23,value=23750},
						{type=25,value=14374},
						{type=27,value=23750},
					},
					-- 89 级
					{
						{type=5,value=429325},
			    		{type=7,value=43213},
						{type=9,value=25594},
						{type=11,value=61956},
						{type=21,value=14410},
						{type=23,value=23804},
						{type=25,value=14410},
						{type=27,value=23804},
					},
					-- 90 级
					{
						{type=5,value=431350},
			    		{type=7,value=43416},
						{type=9,value=25650},
						{type=11,value=62096},
						{type=21,value=14446},
						{type=23,value=23858},
						{type=25,value=14446},
						{type=27,value=23858},
					},
					-- 91 级
					{
						{type=5,value=433375},
			    		{type=7,value=43619},
						{type=9,value=25706},
						{type=11,value=62236},
						{type=21,value=14482},
						{type=23,value=23912},
						{type=25,value=14482},
						{type=27,value=23912},
					},
					-- 92 级
					{
						{type=5,value=435400},
			    		{type=7,value=43822},
						{type=9,value=25762},
						{type=11,value=62376},
						{type=21,value=14518},
						{type=23,value=23966},
						{type=25,value=14518},
						{type=27,value=23966},
					},
					-- 93 级
					{
						{type=5,value=437425},
			    		{type=7,value=44025},
						{type=9,value=25818},
						{type=11,value=62516},
						{type=21,value=14554},
						{type=23,value=24020},
						{type=25,value=14554},
						{type=27,value=24020},
					},
					-- 94 级
					{
						{type=5,value=439450},
			    		{type=7,value=44228},
						{type=9,value=25874},
						{type=11,value=62656},
						{type=21,value=14590},
						{type=23,value=24074},
						{type=25,value=14590},
						{type=27,value=24074},
					},
					-- 95 级
					{
						{type=5,value=441475},
			    		{type=7,value=44431},
						{type=9,value=25930},
						{type=11,value=62796},
						{type=21,value=14626},
						{type=23,value=24128},
						{type=25,value=14626},
						{type=27,value=24128},
					},
					-- 96 级
					{
						{type=5,value=443500},
			    		{type=7,value=44634},
						{type=9,value=25986},
						{type=11,value=62936},
						{type=21,value=14662},
						{type=23,value=24182},
						{type=25,value=14662},
						{type=27,value=24182},
					},
					-- 97 级
					{
						{type=5,value=445525},
			    		{type=7,value=44837},
						{type=9,value=26042},
						{type=11,value=63076},
						{type=21,value=14698},
						{type=23,value=24236},
						{type=25,value=14698},
						{type=27,value=24236},
					},
					-- 98 级
					{
						{type=5,value=447550},
			    		{type=7,value=45040},
						{type=9,value=26098},
						{type=11,value=63216},
						{type=21,value=14734},
						{type=23,value=24290},
						{type=25,value=14734},
						{type=27,value=24290},
					},



					
				},
			},
			-- 法
			{
				itemId = 5950,
				
				inShowIds = {183,184,185,186,309,310,311,312,313}, -- 每阶一个内观
				outShowIds = {183,184,185,186,309,310,311,312,313}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 5951, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,8,8,8,8,8,8,8,8,8,8,4,20,20,20,20,20,20,20,20,20,20,8,40,40,40,40,40,40,40,40,40,40,16,80,80,80,80,80,80,80,80,80,80,
				28,120,120,120,120,120,120,120,120,120,120,42,160,160,160,160,160,160,160,160,160,160,58,200,200,200,200,200,200,200,200,200,200,76,240,240
				,240,240,240,240,240,240,240,240,96,280,280,280,280,280,280,280,280,280,280,},
				
				attrs = {
											-- 0 级
					{
						{type=5,value=1157},
			    		{type=7,value=4628},
						{type=13,value=150},
						{type=15,value=315},
						{type=21,value=76},
						{type=23,value=126},
						{type=25,value=76},
						{type=27,value=126},
					},
					-- 1 级
					{
						{type=5,value=1215},
			    		{type=7,value=4858},
						{type=13,value=155},
						{type=15,value=331},
						{type=21,value=80},
						{type=23,value=132},
						{type=25,value=80},
						{type=27,value=132},
					},
					-- 2 级
					{
						{type=5,value=1273},
			    		{type=7,value=5088},
						{type=13,value=160},
						{type=15,value=347},
						{type=21,value=84},
						{type=23,value=138},
						{type=25,value=84},
						{type=27,value=138},
					},
					-- 3 级
					{
						{type=5,value=1331},
			    		{type=7,value=5318},
						{type=13,value=165},
						{type=15,value=363},
						{type=21,value=88},
						{type=23,value=144},
						{type=25,value=88},
						{type=27,value=144},
					},
					-- 4 级
					{
						{type=5,value=1389},
			    		{type=7,value=5548},
						{type=13,value=170},
						{type=15,value=379},
						{type=21,value=92},
						{type=23,value=150},
						{type=25,value=92},
						{type=27,value=150},
					},
					-- 5 级
					{
						{type=5,value=1447},
			    		{type=7,value=5778},
						{type=13,value=175},
						{type=15,value=395},
						{type=21,value=96},
						{type=23,value=156},
						{type=25,value=96},
						{type=27,value=156},
					},
					-- 6 级
					{
						{type=5,value=1505},
			    		{type=7,value=6008},
						{type=13,value=180},
						{type=15,value=411},
						{type=21,value=100},
						{type=23,value=162},
						{type=25,value=100},
						{type=27,value=162},
					},
					-- 7 级
					{
						{type=5,value=1563},
			    		{type=7,value=6238},
						{type=13,value=185},
						{type=15,value=427},
						{type=21,value=104},
						{type=23,value=168},
						{type=25,value=104},
						{type=27,value=168},
					},
					-- 8 级
					{
						{type=5,value=1621},
			    		{type=7,value=6468},
						{type=13,value=190},
						{type=15,value=443},
						{type=21,value=108},
						{type=23,value=174},
						{type=25,value=108},
						{type=27,value=174},
					},
					-- 9 级
					{
						{type=5,value=1679},
			    		{type=7,value=6698},
						{type=13,value=195},
						{type=15,value=459},
						{type=21,value=112},
						{type=23,value=180},
						{type=25,value=112},
						{type=27,value=180},
					},
					-- 10 级
					{
						{type=5,value=1737},
			    		{type=7,value=6928},
						{type=13,value=200},
						{type=15,value=475},
						{type=21,value=116},
						{type=23,value=186},
						{type=25,value=116},
						{type=27,value=186},
					},
					-- 11 级
					{
						{type=5,value=3794},
			    		{type=7,value=15156},
						{type=13,value=590},
						{type=15,value=1293},
						{type=21,value=312},
						{type=23,value=514},
						{type=25,value=312},
						{type=27,value=514},
					},
					-- 12 级
					{
						{type=5,value=3910},
			    		{type=7,value=15616},
						{type=13,value=600},
						{type=15,value=1318},
						{type=21,value=320},
						{type=23,value=526},
						{type=25,value=320},
						{type=27,value=526},
					},
					-- 13 级
					{
						{type=5,value=4026},
			    		{type=7,value=16076},
						{type=13,value=610},
						{type=15,value=1343},
						{type=21,value=328},
						{type=23,value=538},
						{type=25,value=328},
						{type=27,value=538},
					},
					-- 14 级
					{
						{type=5,value=4142},
			    		{type=7,value=16536},
						{type=13,value=620},
						{type=15,value=1368},
						{type=21,value=336},
						{type=23,value=550},
						{type=25,value=336},
						{type=27,value=550},
					},
					-- 15 级
					{
						{type=5,value=4258},
			    		{type=7,value=16996},
						{type=13,value=630},
						{type=15,value=1393},
						{type=21,value=344},
						{type=23,value=562},
						{type=25,value=344},
						{type=27,value=562},
					},
					-- 16 级
					{
						{type=5,value=4374},
			    		{type=7,value=17456},
						{type=13,value=640},
						{type=15,value=1418},
						{type=21,value=352},
						{type=23,value=574},
						{type=25,value=352},
						{type=27,value=574},
					},
					-- 17 级
					{
						{type=5,value=4490},
			    		{type=7,value=17916},
						{type=13,value=650},
						{type=15,value=1443},
						{type=21,value=360},
						{type=23,value=586},
						{type=25,value=360},
						{type=27,value=586},
					},
					-- 18 级
					{
						{type=5,value=4606},
			    		{type=7,value=18376},
						{type=13,value=660},
						{type=15,value=1468},
						{type=21,value=368},
						{type=23,value=598},
						{type=25,value=368},
						{type=27,value=598},
					},
					-- 19 级
					{
						{type=5,value=4722},
			    		{type=7,value=18836},
						{type=13,value=670},
						{type=15,value=1493},
						{type=21,value=376},
						{type=23,value=610},
						{type=25,value=376},
						{type=27,value=610},
					},
					-- 20 级
					{
						{type=5,value=4838},
			    		{type=7,value=19296},
						{type=13,value=680},
						{type=15,value=1518},
						{type=21,value=384},
						{type=23,value=622},
						{type=25,value=384},
						{type=27,value=622},
					},
					-- 21 级
					{
						{type=5,value=4954},
			    		{type=7,value=19756},
						{type=13,value=690},
						{type=15,value=1543},
						{type=21,value=392},
						{type=23,value=634},
						{type=25,value=392},
						{type=27,value=634},
					},
					-- 22 级
					{
						{type=5,value=8245},
			    		{type=7,value=32920},
						{type=13,value=1426},
						{type=15,value=3088},
						{type=21,value=762},
						{type=23,value=1252},
						{type=25,value=762},
						{type=27,value=1252},
					},
					-- 23 级
					{
						{type=5,value=8419},
			    		{type=7,value=33610},
						{type=13,value=1441},
						{type=15,value=3126},
						{type=21,value=774},
						{type=23,value=1270},
						{type=25,value=774},
						{type=27,value=1270},
					},
					-- 24 级
					{
						{type=5,value=8593},
			    		{type=7,value=34300},
						{type=13,value=1456},
						{type=15,value=3164},
						{type=21,value=786},
						{type=23,value=1288},
						{type=25,value=786},
						{type=27,value=1288},
					},
					-- 25 级
					{
						{type=5,value=8767},
			    		{type=7,value=34990},
						{type=13,value=1471},
						{type=15,value=3202},
						{type=21,value=798},
						{type=23,value=1306},
						{type=25,value=798},
						{type=27,value=1306},
					},
					-- 26 级
					{
						{type=5,value=8941},
			    		{type=7,value=35680},
						{type=13,value=1486},
						{type=15,value=3240},
						{type=21,value=810},
						{type=23,value=1324},
						{type=25,value=810},
						{type=27,value=1324},
					},
					-- 27 级
					{
						{type=5,value=9115},
			    		{type=7,value=36370},
						{type=13,value=1501},
						{type=15,value=3278},
						{type=21,value=822},
						{type=23,value=1342},
						{type=25,value=822},
						{type=27,value=1342},
					},
					-- 28 级
					{
						{type=5,value=9289},
			    		{type=7,value=37060},
						{type=13,value=1516},
						{type=15,value=3316},
						{type=21,value=834},
						{type=23,value=1360},
						{type=25,value=834},
						{type=27,value=1360},
					},
					-- 29 级
					{
						{type=5,value=9463},
			    		{type=7,value=37750},
						{type=13,value=1531},
						{type=15,value=3354},
						{type=21,value=846},
						{type=23,value=1378},
						{type=25,value=846},
						{type=27,value=1378},
					},
					-- 30 级
					{
						{type=5,value=9637},
			    		{type=7,value=38440},
						{type=13,value=1546},
						{type=15,value=3392},
						{type=21,value=858},
						{type=23,value=1396},
						{type=25,value=858},
						{type=27,value=1396},
					},
					-- 31 级
					{
						{type=5,value=9811},
			    		{type=7,value=39130},
						{type=13,value=1561},
						{type=15,value=3430},
						{type=21,value=870},
						{type=23,value=1414},
						{type=25,value=870},
						{type=27,value=1414},
					},
					-- 32 级
					{
						{type=5,value=9985},
			    		{type=7,value=39820},
						{type=13,value=1576},
						{type=15,value=3468},
						{type=21,value=882},
						{type=23,value=1432},
						{type=25,value=882},
						{type=27,value=1432},
					},
					-- 33 级
					{
						{type=5,value=15127},
			    		{type=7,value=60388},
						{type=13,value=2872},
						{type=15,value=6186},
						{type=21,value=1532},
						{type=23,value=2520},
						{type=25,value=1532},
						{type=27,value=2520},
					},
					-- 34 级
					{
						{type=5,value=15359},
			    		{type=7,value=61308},
						{type=13,value=2897},
						{type=15,value=6244},
						{type=21,value=1548},
						{type=23,value=2544},
						{type=25,value=1548},
						{type=27,value=2544},
					},
					-- 35 级
					{
						{type=5,value=15591},
			    		{type=7,value=62228},
						{type=13,value=2922},
						{type=15,value=6302},
						{type=21,value=1564},
						{type=23,value=2568},
						{type=25,value=1564},
						{type=27,value=2568},
					},
					-- 36 级
					{
						{type=5,value=15823},
			    		{type=7,value=63148},
						{type=13,value=2947},
						{type=15,value=6360},
						{type=21,value=1580},
						{type=23,value=2592},
						{type=25,value=1580},
						{type=27,value=2592},
					},
					-- 37 级
					{
						{type=5,value=16055},
			    		{type=7,value=64068},
						{type=13,value=2972},
						{type=15,value=6418},
						{type=21,value=1596},
						{type=23,value=2616},
						{type=25,value=1596},
						{type=27,value=2616},
					},
					-- 38 级
					{
						{type=5,value=16287},
			    		{type=7,value=64988},
						{type=13,value=2997},
						{type=15,value=6476},
						{type=21,value=1612},
						{type=23,value=2640},
						{type=25,value=1612},
						{type=27,value=2640},
					},
					-- 39 级
					{
						{type=5,value=16519},
			    		{type=7,value=65908},
						{type=13,value=3022},
						{type=15,value=6534},
						{type=21,value=1628},
						{type=23,value=2664},
						{type=25,value=1628},
						{type=27,value=2664},
					},
					-- 40 级
					{
						{type=5,value=16751},
			    		{type=7,value=66828},
						{type=13,value=3047},
						{type=15,value=6592},
						{type=21,value=1644},
						{type=23,value=2688},
						{type=25,value=1644},
						{type=27,value=2688},
					},
					-- 41 级
					{
						{type=5,value=16983},
			    		{type=7,value=67748},
						{type=13,value=3072},
						{type=15,value=6650},
						{type=21,value=1660},
						{type=23,value=2712},
						{type=25,value=1660},
						{type=27,value=2712},
					},
					-- 42 级
					{
						{type=5,value=17215},
			    		{type=7,value=68668},
						{type=13,value=3097},
						{type=15,value=6708},
						{type=21,value=1676},
						{type=23,value=2736},
						{type=25,value=1676},
						{type=27,value=2736},
					},
					-- 43 级
					{
						{type=5,value=17447},
			    		{type=7,value=69588},
						{type=13,value=3122},
						{type=15,value=6766},
						{type=21,value=1692},
						{type=23,value=2760},
						{type=25,value=1692},
						{type=27,value=2760},
					},

					

					
					-- 44 级
					{
						{type=5,value=25160},
			    		{type=7,value=100440},
						{type=13,value=5234},
						{type=15,value=11154},
						{type=21,value=2742},
						{type=23,value=4538},
						{type=25,value=2742},
						{type=27,value=4538},
					},

					-- 45 级
					{
						{type=5,value=25450},
			    		{type=7,value=101590},
						{type=13,value=5270},
						{type=15,value=11234},
						{type=21,value=2762},
						{type=23,value=4568},
						{type=25,value=2762},
						{type=27,value=4568},
					},

					-- 46 级
					{
						{type=5,value=25740},
			    		{type=7,value=102740},
						{type=13,value=5306},
						{type=15,value=11314},
						{type=21,value=2782},
						{type=23,value=4598},
						{type=25,value=2782},
						{type=27,value=4598},
					},

					-- 47 级
					{
						{type=5,value=26030},
			    		{type=7,value=103890},
						{type=13,value=5342},
						{type=15,value=11394},
						{type=21,value=2802},
						{type=23,value=4628},
						{type=25,value=2802},
						{type=27,value=4628},
					},

					-- 48 级
					{
						{type=5,value=26320},
			    		{type=7,value=105040},
						{type=13,value=5378},
						{type=15,value=11474},
						{type=21,value=2822},
						{type=23,value=4658},
						{type=25,value=2822},
						{type=27,value=4658},
					},

					-- 49 级
					{
						{type=5,value=26610},
			    		{type=7,value=106190},
						{type=13,value=5414},
						{type=15,value=11554},
						{type=21,value=2842},
						{type=23,value=4688},
						{type=25,value=2842},
						{type=27,value=4688},
					},

					-- 50 级
					{
						{type=5,value=26900},
			    		{type=7,value=107340},
						{type=13,value=5450},
						{type=15,value=11634},
						{type=21,value=2862},
						{type=23,value=4718},
						{type=25,value=2862},
						{type=27,value=4718},
					},

					-- 51 级
					{
						{type=5,value=27190},
			    		{type=7,value=108490},
						{type=13,value=5486},
						{type=15,value=11714},
						{type=21,value=2882},
						{type=23,value=4748},
						{type=25,value=2882},
						{type=27,value=4748},
					},

					-- 52 级
					{
						{type=5,value=27480},
			    		{type=7,value=109640},
						{type=13,value=5522},
						{type=15,value=11794},
						{type=21,value=2902},
						{type=23,value=4778},
						{type=25,value=2902},
						{type=27,value=4778},
					},

					-- 53 级
					{
						{type=5,value=27770},
			    		{type=7,value=110790},
						{type=13,value=5558},
						{type=15,value=11874},
						{type=21,value=2922},
						{type=23,value=4808},
						{type=25,value=2922},
						{type=27,value=4808},
					},

					-- 54 级
					{
						{type=5,value=28060},
			    		{type=7,value=111940},
						{type=13,value=5594},
						{type=15,value=11954},
						{type=21,value=2942},
						{type=23,value=4838},
						{type=25,value=2942},
						{type=27,value=4838},
					},

					-- 55 级
					{
						{type=5,value=39114},
			    		{type=7,value=156156},
						{type=13,value=8353},
						{type=15,value=18852},
						{type=21,value=4495},
						{type=23,value=7426},
						{type=25,value=4495},
						{type=27,value=7426},
					},

					-- 56 级
					{
						{type=5,value=39462},
			    		{type=7,value=157536},
						{type=13,value=8392},
						{type=15,value=18950},
						{type=21,value=4519},
						{type=23,value=7462},
						{type=25,value=4519},
						{type=27,value=7462},
					},

					-- 57 级
					{
						{type=5,value=39810},
			    		{type=7,value=158916},
						{type=13,value=8431},
						{type=15,value=19048},
						{type=21,value=4543},
						{type=23,value=7498},
						{type=25,value=4543},
						{type=27,value=7498},
					},

					-- 58 级
					{
						{type=5,value=40158},
			    		{type=7,value=160296},
						{type=13,value=8470},
						{type=15,value=19146},
						{type=21,value=4567},
						{type=23,value=7534},
						{type=25,value=4567},
						{type=27,value=7534},
					},

					-- 59 级
					{
						{type=5,value=40506},
			    		{type=7,value=161676},
						{type=13,value=8509},
						{type=15,value=19244},
						{type=21,value=4591},
						{type=23,value=7570},
						{type=25,value=4591},
						{type=27,value=7570},
					},

					-- 60 级
					{
						{type=5,value=40854},
			    		{type=7,value=163056},
						{type=13,value=8548},
						{type=15,value=19342},
						{type=21,value=4615},
						{type=23,value=7606},
						{type=25,value=4615},
						{type=27,value=7606},
					},

					-- 61 级
					{
						{type=5,value=41202},
			    		{type=7,value=164436},
						{type=13,value=8587},
						{type=15,value=19440},
						{type=21,value=4639},
						{type=23,value=7642},
						{type=25,value=4639},
						{type=27,value=7642},
					},

					-- 62 级
					{
						{type=5,value=41550},
			    		{type=7,value=165816},
						{type=13,value=8626},
						{type=15,value=19538},
						{type=21,value=4663},
						{type=23,value=7678},
						{type=25,value=4663},
						{type=27,value=7678},
					},

					-- 63 级
					{
						{type=5,value=41898},
			    		{type=7,value=167196},
						{type=13,value=8665},
						{type=15,value=19636},
						{type=21,value=4687},
						{type=23,value=7714},
						{type=25,value=4687},
						{type=27,value=7714},
					},

					-- 64 级
					{
						{type=5,value=42246},
			    		{type=7,value=168576},
						{type=13,value=8704},
						{type=15,value=19734},
						{type=21,value=4711},
						{type=23,value=7750},
						{type=25,value=4711},
						{type=27,value=7750},
					},

					-- 65 级
					{
						{type=5,value=42594},
			    		{type=7,value=169956},
						{type=13,value=8743},
						{type=15,value=19832},
						{type=21,value=4735},
						{type=23,value=7786},
						{type=25,value=4735},
						{type=27,value=7786},
					},

					-- 66 级
					{
						{type=5,value=57505},
			    		{type=7,value=229600},
						{type=13,value=12658},
						{type=15,value=29620},
						{type=21,value=6888},
						{type=23,value=11374},
						{type=25,value=6888},
						{type=27,value=11374},
					},

					-- 67 级
					{
						{type=5,value=57911},
			    		{type=7,value=231210},
						{type=13,value=12704},
						{type=15,value=29734},
						{type=21,value=6916},
						{type=23,value=11416},
						{type=25,value=6916},
						{type=27,value=11416},
					},

					-- 68 级
					{
						{type=5,value=58317},
			    		{type=7,value=232820},
						{type=13,value=12750},
						{type=15,value=29848},
						{type=21,value=6944},
						{type=23,value=11458},
						{type=25,value=6944},
						{type=27,value=11458},
					},

					-- 69 级
					{
						{type=5,value=58723},
			    		{type=7,value=234430},
						{type=13,value=12796},
						{type=15,value=29962},
						{type=21,value=6972},
						{type=23,value=11500},
						{type=25,value=6972},
						{type=27,value=11500},
					},

					-- 70 级
					{
						{type=5,value=59129},
			    		{type=7,value=236040},
						{type=13,value=12842},
						{type=15,value=30076},
						{type=21,value=7000},
						{type=23,value=11542},
						{type=25,value=7000},
						{type=27,value=11542},
					},

					-- 71 级
					{
						{type=5,value=59535},
			    		{type=7,value=237650},
						{type=13,value=12888},
						{type=15,value=30190},
						{type=21,value=7028},
						{type=23,value=11584},
						{type=25,value=7028},
						{type=27,value=11584},
					},

					-- 72 级
					{
						{type=5,value=59941},
			    		{type=7,value=239260},
						{type=13,value=12934},
						{type=15,value=30304},
						{type=21,value=7056},
						{type=23,value=11626},
						{type=25,value=7056},
						{type=27,value=11626},
					},

					-- 73 级
					{
						{type=5,value=60347},
			    		{type=7,value=240870},
						{type=13,value=12980},
						{type=15,value=30418},
						{type=21,value=7084},
						{type=23,value=11668},
						{type=25,value=7084},
						{type=27,value=11668},
					},

					-- 74 级
					{
						{type=5,value=60753},
			    		{type=7,value=242480},
						{type=13,value=13026},
						{type=15,value=30532},
						{type=21,value=7112},
						{type=23,value=11710},
						{type=25,value=7112},
						{type=27,value=11710},
					},

					-- 75 级
					{
						{type=5,value=61159},
			    		{type=7,value=244090},
						{type=13,value=13072},
						{type=15,value=30646},
						{type=21,value=7140},
						{type=23,value=11752},
						{type=25,value=7140},
						{type=27,value=11752},
					},

					-- 76 级
					{
						{type=5,value=61565},
			    		{type=7,value=245700},
						{type=13,value=13118},
						{type=15,value=30760},
						{type=21,value=7168},
						{type=23,value=11794},
						{type=25,value=7168},
						{type=27,value=11794},
					},

					-- 77 级
					{
						{type=5,value=80846},
			    		{type=7,value=322824},
						{type=13,value=18353},
						{type=15,value=43848},
						{type=21,value=10101},
						{type=23,value=16682},
						{type=25,value=10101},
						{type=27,value=16682},
					},

					-- 78 级
					{
						{type=5,value=81310},
			    		{type=7,value=324664},
						{type=13,value=18404},
						{type=15,value=43976},
						{type=21,value=10133},
						{type=23,value=16730},
						{type=25,value=10133},
						{type=27,value=16730},
					},

					-- 79 级
					{
						{type=5,value=81774},
			    		{type=7,value=326504},
						{type=13,value=18455},
						{type=15,value=44104},
						{type=21,value=10165},
						{type=23,value=16778},
						{type=25,value=10165},
						{type=27,value=16778},
					},

					-- 80 级
					{
						{type=5,value=82238},
			    		{type=7,value=328344},
						{type=13,value=18506},
						{type=15,value=44232},
						{type=21,value=10197},
						{type=23,value=16826},
						{type=25,value=10197},
						{type=27,value=16826},
					},

					-- 81 级
					{
						{type=5,value=82702},
			    		{type=7,value=330184},
						{type=13,value=18557},
						{type=15,value=44360},
						{type=21,value=10229},
						{type=23,value=16874},
						{type=25,value=10229},
						{type=27,value=16874},
					},

					-- 82 级
					{
						{type=5,value=83166},
			    		{type=7,value=332024},
						{type=13,value=18608},
						{type=15,value=44488},
						{type=21,value=10261},
						{type=23,value=16922},
						{type=25,value=10261},
						{type=27,value=16922},
					},

					-- 83 级
					{
						{type=5,value=83630},
			    		{type=7,value=333864},
						{type=13,value=18659},
						{type=15,value=44616},
						{type=21,value=10293},
						{type=23,value=16970},
						{type=25,value=10293},
						{type=27,value=16970},
					},

					-- 84 级
					{
						{type=5,value=84094},
			    		{type=7,value=335704},
						{type=13,value=18710},
						{type=15,value=44744},
						{type=21,value=10325},
						{type=23,value=17018},
						{type=25,value=10325},
						{type=27,value=17018},
					},

					-- 85 级
					{
						{type=5,value=84558},
			    		{type=7,value=337544},
						{type=13,value=18761},
						{type=15,value=44872},
						{type=21,value=10357},
						{type=23,value=17066},
						{type=25,value=10357},
						{type=27,value=17066},
					},

					-- 86 级
					{
						{type=5,value=85022},
			    		{type=7,value=339384},
						{type=13,value=18812},
						{type=15,value=45000},
						{type=21,value=10389},
						{type=23,value=17114},
						{type=25,value=10389},
						{type=27,value=17114},
					},

					-- 87 级
					{
						{type=5,value=85486},
			    		{type=7,value=341224},
						{type=13,value=18863},
						{type=15,value=45128},
						{type=21,value=10421},
						{type=23,value=17162},
						{type=25,value=10421},
						{type=27,value=17162},
					},

					-- 88 级
					{
						{type=5,value=109908},
			    		{type=7,value=438912},
						{type=13,value=25538},
						{type=15,value=61816},
						{type=21,value=14374},
						{type=23,value=23750},
						{type=25,value=14374},
						{type=27,value=23750},
					},

					-- 89 级
					{
						{type=5,value=110430},
			    		{type=7,value=440982},
						{type=13,value=25594},
						{type=15,value=61956},
						{type=21,value=14410},
						{type=23,value=23804},
						{type=25,value=14410},
						{type=27,value=23804},
					},

					-- 90 级
					{
						{type=5,value=110952},
			    		{type=7,value=443052},
						{type=13,value=25650},
						{type=15,value=62096},
						{type=21,value=14446},
						{type=23,value=23858},
						{type=25,value=14446},
						{type=27,value=23858},
					},

					-- 91 级
					{
						{type=5,value=111474},
			    		{type=7,value=445122},
						{type=13,value=25706},
						{type=15,value=62236},
						{type=21,value=14482},
						{type=23,value=23912},
						{type=25,value=14482},
						{type=27,value=23912},
					},

					-- 92 级
					{
						{type=5,value=111996},
			    		{type=7,value=447192},
						{type=13,value=25762},
						{type=15,value=62376},
						{type=21,value=14518},
						{type=23,value=23966},
						{type=25,value=14518},
						{type=27,value=23966},
					},

					-- 93 级
					{
						{type=5,value=112518},
			    		{type=7,value=449262},
						{type=13,value=25818},
						{type=15,value=62516},
						{type=21,value=14554},
						{type=23,value=24020},
						{type=25,value=14554},
						{type=27,value=24020},
					},

					-- 94 级
					{
						{type=5,value=113040},
			    		{type=7,value=451332},
						{type=13,value=25874},
						{type=15,value=62656},
						{type=21,value=14590},
						{type=23,value=24074},
						{type=25,value=14590},
						{type=27,value=24074},
					},

					-- 95 级
					{
						{type=5,value=113562},
			    		{type=7,value=453402},
						{type=13,value=25930},
						{type=15,value=62796},
						{type=21,value=14626},
						{type=23,value=24128},
						{type=25,value=14626},
						{type=27,value=24128},
					},

					-- 96 级
					{
						{type=5,value=114084},
			    		{type=7,value=455472},
						{type=13,value=25986},
						{type=15,value=62936},
						{type=21,value=14662},
						{type=23,value=24182},
						{type=25,value=14662},
						{type=27,value=24182},
					},

					-- 97 级
					{
						{type=5,value=114606},
			    		{type=7,value=457542},
						{type=13,value=26042},
						{type=15,value=63076},
						{type=21,value=14698},
						{type=23,value=24236},
						{type=25,value=14698},
						{type=27,value=24236},
					},

					-- 98 级
					{
						{type=5,value=115128},
			    		{type=7,value=459612},
						{type=13,value=26098},
						{type=15,value=63216},
						{type=21,value=14734},
						{type=23,value=24290},
						{type=25,value=14734},
						{type=27,value=24290},
					},

					
				},
			},
			-- 道
			{
				itemId = 5950,
				
				inShowIds = {183,184,185,186,309,310,311,312,313}, -- 每阶一个内观
				outShowIds = {183,184,185,186,309,310,311,312,313}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 5951, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,8,8,8,8,8,8,8,8,8,8,4,20,20,20,20,20,20,20,20,20,20,8,40,40,40,40,40,40,40,40,40,40,16,80,80,80,80,80,80,80,80,80,80,
				28,120,120,120,120,120,120,120,120,120,120,42,160,160,160,160,160,160,160,160,160,160,58,200,200,200,200,200,200,200,200,200,200,76,240,240
				,240,240,240,240,240,240,240,240,96,280,280,280,280,280,280,280,280,280,280,},
				
				attrs = {
										-- 0 级
					{
						{type=5,value=2514},
			    		{type=7,value=2514},
						{type=17,value=150},
						{type=19,value=315},
						{type=21,value=76},
						{type=23,value=126},
						{type=25,value=76},
						{type=27,value=126},
					},
					-- 1 级
					{
						{type=5,value=2640},
			    		{type=7,value=2640},
						{type=17,value=155},
						{type=19,value=331},
						{type=21,value=80},
						{type=23,value=132},
						{type=25,value=80},
						{type=27,value=132},
					},
					-- 2 级
					{
						{type=5,value=2766},
			    		{type=7,value=2766},
						{type=17,value=160},
						{type=19,value=347},
						{type=21,value=84},
						{type=23,value=138},
						{type=25,value=84},
						{type=27,value=138},
					},
					-- 3 级
					{
						{type=5,value=2892},
			    		{type=7,value=2892},
						{type=17,value=165},
						{type=19,value=363},
						{type=21,value=88},
						{type=23,value=144},
						{type=25,value=88},
						{type=27,value=144},
					},
					-- 4 级
					{
						{type=5,value=3018},
			    		{type=7,value=3018},
						{type=17,value=170},
						{type=19,value=379},
						{type=21,value=92},
						{type=23,value=150},
						{type=25,value=92},
						{type=27,value=150},
					},
					-- 5 级
					{
						{type=5,value=3144},
			    		{type=7,value=3144},
						{type=17,value=175},
						{type=19,value=395},
						{type=21,value=96},
						{type=23,value=156},
						{type=25,value=96},
						{type=27,value=156},
					},
					-- 6 级
					{
						{type=5,value=3270},
			    		{type=7,value=3270},
						{type=17,value=180},
						{type=19,value=411},
						{type=21,value=100},
						{type=23,value=162},
						{type=25,value=100},
						{type=27,value=162},
					},
					-- 7 级
					{
						{type=5,value=3396},
			    		{type=7,value=3396},
						{type=17,value=185},
						{type=19,value=427},
						{type=21,value=104},
						{type=23,value=168},
						{type=25,value=104},
						{type=27,value=168},
					},
					-- 8 级
					{
						{type=5,value=3522},
			    		{type=7,value=3522},
						{type=17,value=190},
						{type=19,value=443},
						{type=21,value=108},
						{type=23,value=174},
						{type=25,value=108},
						{type=27,value=174},
					},
					-- 9 级
					{
						{type=5,value=3648},
			    		{type=7,value=3648},
						{type=17,value=195},
						{type=19,value=459},
						{type=21,value=112},
						{type=23,value=180},
						{type=25,value=112},
						{type=27,value=180},
					},
					-- 10 级
					{
						{type=5,value=3774},
			    		{type=7,value=3774},
						{type=17,value=200},
						{type=19,value=475},
						{type=21,value=116},
						{type=23,value=186},
						{type=25,value=116},
						{type=27,value=186},
					},
					-- 11 级
					{
						{type=5,value=8244},
			    		{type=7,value=8244},
						{type=17,value=590},
						{type=19,value=1293},
						{type=21,value=312},
						{type=23,value=514},
						{type=25,value=312},
						{type=27,value=514},
					},
					-- 12 级
					{
						{type=5,value=8496},
			    		{type=7,value=8496},
						{type=17,value=600},
						{type=19,value=1318},
						{type=21,value=320},
						{type=23,value=526},
						{type=25,value=320},
						{type=27,value=526},
					},
					-- 13 级
					{
						{type=5,value=8748},
			    		{type=7,value=8748},
						{type=17,value=610},
						{type=19,value=1343},
						{type=21,value=328},
						{type=23,value=538},
						{type=25,value=328},
						{type=27,value=538},
					},
					-- 14 级
					{
						{type=5,value=9000},
			    		{type=7,value=9000},
						{type=17,value=620},
						{type=19,value=1368},
						{type=21,value=336},
						{type=23,value=550},
						{type=25,value=336},
						{type=27,value=550},
					},
					-- 15 级
					{
						{type=5,value=9252},
			    		{type=7,value=9252},
						{type=17,value=630},
						{type=19,value=1393},
						{type=21,value=344},
						{type=23,value=562},
						{type=25,value=344},
						{type=27,value=562},
					},
					-- 16 级
					{
						{type=5,value=9504},
			    		{type=7,value=9504},
						{type=17,value=640},
						{type=19,value=1418},
						{type=21,value=352},
						{type=23,value=574},
						{type=25,value=352},
						{type=27,value=574},
					},
					-- 17 级
					{
						{type=5,value=9756},
			    		{type=7,value=9756},
						{type=17,value=650},
						{type=19,value=1443},
						{type=21,value=360},
						{type=23,value=586},
						{type=25,value=360},
						{type=27,value=586},
					},
					-- 18 级
					{
						{type=5,value=10008},
			    		{type=7,value=10008},
						{type=17,value=660},
						{type=19,value=1468},
						{type=21,value=368},
						{type=23,value=598},
						{type=25,value=368},
						{type=27,value=598},
					},
					-- 19 级
					{
						{type=5,value=10260},
			    		{type=7,value=10260},
						{type=17,value=670},
						{type=19,value=1493},
						{type=21,value=376},
						{type=23,value=610},
						{type=25,value=376},
						{type=27,value=610},
					},
					-- 20 级
					{
						{type=5,value=10512},
			    		{type=7,value=10512},
						{type=17,value=680},
						{type=19,value=1518},
						{type=21,value=384},
						{type=23,value=622},
						{type=25,value=384},
						{type=27,value=622},
					},
					-- 21 级
					{
						{type=5,value=10764},
			    		{type=7,value=10764},
						{type=17,value=690},
						{type=19,value=1543},
						{type=21,value=392},
						{type=23,value=634},
						{type=25,value=392},
						{type=27,value=634},
					},
					-- 22 级
					{
						{type=5,value=17915},
			    		{type=7,value=17915},
						{type=17,value=1426},
						{type=19,value=3088},
						{type=21,value=762},
						{type=23,value=1252},
						{type=25,value=762},
						{type=27,value=1252},
					},
					-- 23 级
					{
						{type=5,value=18293},
			    		{type=7,value=18293},
						{type=17,value=1441},
						{type=19,value=3126},
						{type=21,value=774},
						{type=23,value=1270},
						{type=25,value=774},
						{type=27,value=1270},
					},
					-- 24 级
					{
						{type=5,value=18671},
			    		{type=7,value=18671},
						{type=17,value=1456},
						{type=19,value=3164},
						{type=21,value=786},
						{type=23,value=1288},
						{type=25,value=786},
						{type=27,value=1288},
					},
					-- 25 级
					{
						{type=5,value=19049},
			    		{type=7,value=19049},
						{type=17,value=1471},
						{type=19,value=3202},
						{type=21,value=798},
						{type=23,value=1306},
						{type=25,value=798},
						{type=27,value=1306},
					},
					-- 26 级
					{
						{type=5,value=19427},
			    		{type=7,value=19427},
						{type=17,value=1486},
						{type=19,value=3240},
						{type=21,value=810},
						{type=23,value=1324},
						{type=25,value=810},
						{type=27,value=1324},
					},
					-- 27 级
					{
						{type=5,value=19805},
			    		{type=7,value=19805},
						{type=17,value=1501},
						{type=19,value=3278},
						{type=21,value=822},
						{type=23,value=1342},
						{type=25,value=822},
						{type=27,value=1342},
					},
					-- 28 级
					{
						{type=5,value=20183},
			    		{type=7,value=20183},
						{type=17,value=1516},
						{type=19,value=3316},
						{type=21,value=834},
						{type=23,value=1360},
						{type=25,value=834},
						{type=27,value=1360},
					},
					-- 29 级
					{
						{type=5,value=20561},
			    		{type=7,value=20561},
						{type=17,value=1531},
						{type=19,value=3354},
						{type=21,value=846},
						{type=23,value=1378},
						{type=25,value=846},
						{type=27,value=1378},
					},
					-- 30 级
					{
						{type=5,value=20939},
			    		{type=7,value=20939},
						{type=17,value=1546},
						{type=19,value=3392},
						{type=21,value=858},
						{type=23,value=1396},
						{type=25,value=858},
						{type=27,value=1396},
					},
					-- 31 级
					{
						{type=5,value=21317},
			    		{type=7,value=21317},
						{type=17,value=1561},
						{type=19,value=3430},
						{type=21,value=870},
						{type=23,value=1414},
						{type=25,value=870},
						{type=27,value=1414},
					},
					-- 32 级
					{
						{type=5,value=21695},
			    		{type=7,value=21695},
						{type=17,value=1576},
						{type=19,value=3468},
						{type=21,value=882},
						{type=23,value=1432},
						{type=25,value=882},
						{type=27,value=1432},
					},
					-- 33 级
					{
						{type=5,value=32869},
			    		{type=7,value=32869},
						{type=17,value=2872},
						{type=19,value=6186},
						{type=21,value=1532},
						{type=23,value=2520},
						{type=25,value=1532},
						{type=27,value=2520},
					},
					-- 34 级
					{
						{type=5,value=33373},
			    		{type=7,value=33373},
						{type=17,value=2897},
						{type=19,value=6244},
						{type=21,value=1548},
						{type=23,value=2544},
						{type=25,value=1548},
						{type=27,value=2544},
					},
					-- 35 级
					{
						{type=5,value=33877},
			    		{type=7,value=33877},
						{type=17,value=2922},
						{type=19,value=6302},
						{type=21,value=1564},
						{type=23,value=2568},
						{type=25,value=1564},
						{type=27,value=2568},
					},
					-- 36 级
					{
						{type=5,value=34381},
			    		{type=7,value=34381},
						{type=17,value=2947},
						{type=19,value=6360},
						{type=21,value=1580},
						{type=23,value=2592},
						{type=25,value=1580},
						{type=27,value=2592},
					},
					-- 37 级
					{
						{type=5,value=34885},
			    		{type=7,value=34885},
						{type=17,value=2972},
						{type=19,value=6418},
						{type=21,value=1596},
						{type=23,value=2616},
						{type=25,value=1596},
						{type=27,value=2616},
					},
					-- 38 级
					{
						{type=5,value=35389},
			    		{type=7,value=35389},
						{type=17,value=2997},
						{type=19,value=6476},
						{type=21,value=1612},
						{type=23,value=2640},
						{type=25,value=1612},
						{type=27,value=2640},
					},
					-- 39 级
					{
						{type=5,value=35893},
			    		{type=7,value=35893},
						{type=17,value=3022},
						{type=19,value=6534},
						{type=21,value=1628},
						{type=23,value=2664},
						{type=25,value=1628},
						{type=27,value=2664},
					},
					-- 40 级
					{
						{type=5,value=36397},
			    		{type=7,value=36397},
						{type=17,value=3047},
						{type=19,value=6592},
						{type=21,value=1644},
						{type=23,value=2688},
						{type=25,value=1644},
						{type=27,value=2688},
					},
					-- 41 级
					{
						{type=5,value=36901},
			    		{type=7,value=36901},
						{type=17,value=3072},
						{type=19,value=6650},
						{type=21,value=1660},
						{type=23,value=2712},
						{type=25,value=1660},
						{type=27,value=2712},
					},
					-- 42 级
					{
						{type=5,value=37405},
			    		{type=7,value=37405},
						{type=17,value=3097},
						{type=19,value=6708},
						{type=21,value=1676},
						{type=23,value=2736},
						{type=25,value=1676},
						{type=27,value=2736},
					},
					-- 43 级
					{
						{type=5,value=37909},
			    		{type=7,value=37909},
						{type=17,value=3122},
						{type=19,value=6766},
						{type=21,value=1692},
						{type=23,value=2760},
						{type=25,value=1692},
						{type=27,value=2760},
					},

					
					-- 44 级
					{
						{type=5,value=54669},
			    		{type=7,value=54669},
						{type=17,value=5234},
						{type=19,value=11154},
						{type=21,value=2742},
						{type=23,value=4538},
						{type=25,value=2742},
						{type=27,value=4538},
					},

					-- 45 级
					{
						{type=5,value=55299},
			    		{type=7,value=55299},
						{type=17,value=5270},
						{type=19,value=11234},
						{type=21,value=2762},
						{type=23,value=4568},
						{type=25,value=2762},
						{type=27,value=4568},
					},

					-- 46 级
					{
						{type=5,value=55929},
			    		{type=7,value=55929},
						{type=17,value=5306},
						{type=19,value=11314},
						{type=21,value=2782},
						{type=23,value=4598},
						{type=25,value=2782},
						{type=27,value=4598},
					},

					-- 47 级
					{
						{type=5,value=56559},
			    		{type=7,value=56559},
						{type=17,value=5342},
						{type=19,value=11394},
						{type=21,value=2802},
						{type=23,value=4628},
						{type=25,value=2802},
						{type=27,value=4628},
					},

					-- 48 级
					{
						{type=5,value=57189},
			    		{type=7,value=57189},
						{type=17,value=5378},
						{type=19,value=11474},
						{type=21,value=2822},
						{type=23,value=4658},
						{type=25,value=2822},
						{type=27,value=4658},
					},

					-- 49 级
					{
						{type=5,value=57819},
			    		{type=7,value=57819},
						{type=17,value=5414},
						{type=19,value=11554},
						{type=21,value=2842},
						{type=23,value=4688},
						{type=25,value=2842},
						{type=27,value=4688},
					},

					-- 50 级
					{
						{type=5,value=58449},
			    		{type=7,value=58449},
						{type=17,value=5450},
						{type=19,value=11634},
						{type=21,value=2862},
						{type=23,value=4718},
						{type=25,value=2862},
						{type=27,value=4718},
					},

					-- 51 级
					{
						{type=5,value=59079},
			    		{type=7,value=59079},
						{type=17,value=5486},
						{type=19,value=11714},
						{type=21,value=2882},
						{type=23,value=4748},
						{type=25,value=2882},
						{type=27,value=4748},
					},

					-- 52 级
					{
						{type=5,value=59709},
			    		{type=7,value=59709},
						{type=17,value=5522},
						{type=19,value=11794},
						{type=21,value=2902},
						{type=23,value=4778},
						{type=25,value=2902},
						{type=27,value=4778},
					},

					-- 53 级
					{
						{type=5,value=60339},
			    		{type=7,value=60339},
						{type=17,value=5558},
						{type=19,value=11874},
						{type=21,value=2922},
						{type=23,value=4808},
						{type=25,value=2922},
						{type=27,value=4808},
					},

					-- 54 级
					{
						{type=5,value=60969},
			    		{type=7,value=60969},
						{type=17,value=5594},
						{type=19,value=11954},
						{type=21,value=2942},
						{type=23,value=4838},
						{type=25,value=2942},
						{type=27,value=4838},
					},

					-- 55 级
					{
						{type=5,value=84992},
			    		{type=7,value=84992},
						{type=17,value=8353},
						{type=19,value=18852},
						{type=21,value=4495},
						{type=23,value=7426},
						{type=25,value=4495},
						{type=27,value=7426},
					},

					-- 56 级
					{
						{type=5,value=85748},
			    		{type=7,value=85748},
						{type=17,value=8392},
						{type=19,value=18950},
						{type=21,value=4519},
						{type=23,value=7462},
						{type=25,value=4519},
						{type=27,value=7462},
					},

					-- 57 级
					{
						{type=5,value=86504},
			    		{type=7,value=86504},
						{type=17,value=8431},
						{type=19,value=19048},
						{type=21,value=4543},
						{type=23,value=7498},
						{type=25,value=4543},
						{type=27,value=7498},
					},

					-- 58 级
					{
						{type=5,value=87260},
			    		{type=7,value=87260},
						{type=17,value=8470},
						{type=19,value=19146},
						{type=21,value=4567},
						{type=23,value=7534},
						{type=25,value=4567},
						{type=27,value=7534},
					},

					-- 59 级
					{
						{type=5,value=88016},
			    		{type=7,value=88016},
						{type=17,value=8509},
						{type=19,value=19244},
						{type=21,value=4591},
						{type=23,value=7570},
						{type=25,value=4591},
						{type=27,value=7570},
					},

					-- 60 级
					{
						{type=5,value=88772},
			    		{type=7,value=88772},
						{type=17,value=8548},
						{type=19,value=19342},
						{type=21,value=4615},
						{type=23,value=7606},
						{type=25,value=4615},
						{type=27,value=7606},
					},

					-- 61 级
					{
						{type=5,value=89528},
			    		{type=7,value=89528},
						{type=17,value=8587},
						{type=19,value=19440},
						{type=21,value=4639},
						{type=23,value=7642},
						{type=25,value=4639},
						{type=27,value=7642},
					},

					-- 62 级
					{
						{type=5,value=90284},
			    		{type=7,value=90284},
						{type=17,value=8626},
						{type=19,value=19538},
						{type=21,value=4663},
						{type=23,value=7678},
						{type=25,value=4663},
						{type=27,value=7678},
					},

					-- 63 级
					{
						{type=5,value=91040},
			    		{type=7,value=91040},
						{type=17,value=8665},
						{type=19,value=19636},
						{type=21,value=4687},
						{type=23,value=7714},
						{type=25,value=4687},
						{type=27,value=7714},
					},

					-- 64 级
					{
						{type=5,value=91796},
			    		{type=7,value=91796},
						{type=17,value=8704},
						{type=19,value=19734},
						{type=21,value=4711},
						{type=23,value=7750},
						{type=25,value=4711},
						{type=27,value=7750},
					},

					-- 65 级
					{
						{type=5,value=92552},
			    		{type=7,value=92552},
						{type=17,value=8743},
						{type=19,value=19832},
						{type=21,value=4735},
						{type=23,value=7786},
						{type=25,value=4735},
						{type=27,value=7786},
					},

					-- 66 级
					{
						{type=5,value=124955},
			    		{type=7,value=124955},
						{type=17,value=12658},
						{type=19,value=29620},
						{type=21,value=6888},
						{type=23,value=11374},
						{type=25,value=6888},
						{type=27,value=11374},
					},

					-- 67 级
					{
						{type=5,value=125837},
			    		{type=7,value=125837},
						{type=17,value=12704},
						{type=19,value=29734},
						{type=21,value=6916},
						{type=23,value=11416},
						{type=25,value=6916},
						{type=27,value=11416},
					},

					-- 68 级
					{
						{type=5,value=126719},
			    		{type=7,value=126719},
						{type=17,value=12750},
						{type=19,value=29848},
						{type=21,value=6944},
						{type=23,value=11458},
						{type=25,value=6944},
						{type=27,value=11458},
					},

					-- 69 级
					{
						{type=5,value=127601},
			    		{type=7,value=127601},
						{type=17,value=12796},
						{type=19,value=29962},
						{type=21,value=6972},
						{type=23,value=11500},
						{type=25,value=6972},
						{type=27,value=11500},
					},

					-- 70 级
					{
						{type=5,value=128483},
			    		{type=7,value=128483},
						{type=17,value=12842},
						{type=19,value=30076},
						{type=21,value=7000},
						{type=23,value=11542},
						{type=25,value=7000},
						{type=27,value=11542},
					},

					-- 71 级
					{
						{type=5,value=129365},
			    		{type=7,value=129365},
						{type=17,value=12888},
						{type=19,value=30190},
						{type=21,value=7028},
						{type=23,value=11584},
						{type=25,value=7028},
						{type=27,value=11584},
					},

					-- 72 级
					{
						{type=5,value=130247},
			    		{type=7,value=130247},
						{type=17,value=12934},
						{type=19,value=30304},
						{type=21,value=7056},
						{type=23,value=11626},
						{type=25,value=7056},
						{type=27,value=11626},
					},

					-- 73 级
					{
						{type=5,value=131129},
			    		{type=7,value=131129},
						{type=17,value=12980},
						{type=19,value=30418},
						{type=21,value=7084},
						{type=23,value=11668},
						{type=25,value=7084},
						{type=27,value=11668},
					},

					-- 74 级
					{
						{type=5,value=132011},
			    		{type=7,value=132011},
						{type=17,value=13026},
						{type=19,value=30532},
						{type=21,value=7112},
						{type=23,value=11710},
						{type=25,value=7112},
						{type=27,value=11710},
					},

					-- 75 级
					{
						{type=5,value=132893},
			    		{type=7,value=132893},
						{type=17,value=13072},
						{type=19,value=30646},
						{type=21,value=7140},
						{type=23,value=11752},
						{type=25,value=7140},
						{type=27,value=11752},
					},

					-- 76 级
					{
						{type=5,value=133775},
			    		{type=7,value=133775},
						{type=17,value=13118},
						{type=19,value=30760},
						{type=21,value=7168},
						{type=23,value=11794},
						{type=25,value=7168},
						{type=27,value=11794},
					},

					-- 77 级
					{
						{type=5,value=150535},
			    		{type=7,value=150535},
						{type=17,value=18353},
						{type=19,value=43848},
						{type=21,value=10101},
						{type=23,value=16682},
						{type=25,value=10101},
						{type=27,value=16682},
					},

					-- 78 级
					{
						{type=5,value=151543},
			    		{type=7,value=151543},
						{type=17,value=18404},
						{type=19,value=43976},
						{type=21,value=10133},
						{type=23,value=16730},
						{type=25,value=10133},
						{type=27,value=16730},
					},

					-- 79 级
					{
						{type=5,value=152551},
			    		{type=7,value=152551},
						{type=17,value=18455},
						{type=19,value=44104},
						{type=21,value=10165},
						{type=23,value=16778},
						{type=25,value=10165},
						{type=27,value=16778},
					},

					-- 80 级
					{
						{type=5,value=153559},
			    		{type=7,value=153559},
						{type=17,value=18506},
						{type=19,value=44232},
						{type=21,value=10197},
						{type=23,value=16826},
						{type=25,value=10197},
						{type=27,value=16826},
					},

					-- 81 级
					{
						{type=5,value=154567},
			    		{type=7,value=154567},
						{type=17,value=18557},
						{type=19,value=44360},
						{type=21,value=10229},
						{type=23,value=16874},
						{type=25,value=10229},
						{type=27,value=16874},
					},

					-- 82 级
					{
						{type=5,value=155575},
			    		{type=7,value=155575},
						{type=17,value=18608},
						{type=19,value=44488},
						{type=21,value=10261},
						{type=23,value=16922},
						{type=25,value=10261},
						{type=27,value=16922},
					},

					-- 83 级
					{
						{type=5,value=156583},
			    		{type=7,value=156583},
						{type=17,value=18659},
						{type=19,value=44616},
						{type=21,value=10293},
						{type=23,value=16970},
						{type=25,value=10293},
						{type=27,value=16970},
					},

					-- 84 级
					{
						{type=5,value=157591},
			    		{type=7,value=157591},
						{type=17,value=18710},
						{type=19,value=44744},
						{type=21,value=10325},
						{type=23,value=17018},
						{type=25,value=10325},
						{type=27,value=17018},
					},

					-- 85 级
					{
						{type=5,value=158599},
			    		{type=7,value=158599},
						{type=17,value=18761},
						{type=19,value=44872},
						{type=21,value=10357},
						{type=23,value=17066},
						{type=25,value=10357},
						{type=27,value=17066},
					},

					-- 86 级
					{
						{type=5,value=159607},
			    		{type=7,value=159607},
						{type=17,value=18812},
						{type=19,value=45000},
						{type=21,value=10389},
						{type=23,value=17114},
						{type=25,value=10389},
						{type=27,value=17114},
					},

					-- 87 级
					{
						{type=5,value=160615},
			    		{type=7,value=160615},
						{type=17,value=18863},
						{type=19,value=45128},
						{type=21,value=10421},
						{type=23,value=17162},
						{type=25,value=10421},
						{type=27,value=17162},
					},

					-- 88 级
					{
						{type=5,value=177375},
			    		{type=7,value=177375},
						{type=17,value=25538},
						{type=19,value=61816},
						{type=21,value=14374},
						{type=23,value=23750},
						{type=25,value=14374},
						{type=27,value=23750},
					},

					-- 89 级
					{
						{type=5,value=178509},
			    		{type=7,value=178509},
						{type=17,value=25594},
						{type=19,value=61956},
						{type=21,value=14410},
						{type=23,value=23804},
						{type=25,value=14410},
						{type=27,value=23804},
					},

					-- 90 级
					{
						{type=5,value=179643},
			    		{type=7,value=179643},
						{type=17,value=25650},
						{type=19,value=62096},
						{type=21,value=14446},
						{type=23,value=23858},
						{type=25,value=14446},
						{type=27,value=23858},
					},

					-- 91 级
					{
						{type=5,value=180777},
			    		{type=7,value=180777},
						{type=17,value=25706},
						{type=19,value=62236},
						{type=21,value=14482},
						{type=23,value=23912},
						{type=25,value=14482},
						{type=27,value=23912},
					},

					-- 92 级
					{
						{type=5,value=181911},
			    		{type=7,value=181911},
						{type=17,value=25762},
						{type=19,value=62376},
						{type=21,value=14518},
						{type=23,value=23966},
						{type=25,value=14518},
						{type=27,value=23966},
					},

					-- 93 级
					{
						{type=5,value=183045},
			    		{type=7,value=183045},
						{type=17,value=25818},
						{type=19,value=62516},
						{type=21,value=14554},
						{type=23,value=24020},
						{type=25,value=14554},
						{type=27,value=24020},
					},

					-- 94 级
					{
						{type=5,value=184179},
			    		{type=7,value=184179},
						{type=17,value=25874},
						{type=19,value=62656},
						{type=21,value=14590},
						{type=23,value=24074},
						{type=25,value=14590},
						{type=27,value=24074},
					},

					-- 95 级
					{
						{type=5,value=185313},
			    		{type=7,value=185313},
						{type=17,value=25930},
						{type=19,value=62796},
						{type=21,value=14626},
						{type=23,value=24128},
						{type=25,value=14626},
						{type=27,value=24128},
					},

					-- 96 级
					{
						{type=5,value=186447},
			    		{type=7,value=186447},
						{type=17,value=25986},
						{type=19,value=62936},
						{type=21,value=14662},
						{type=23,value=24182},
						{type=25,value=14662},
						{type=27,value=24182},
					},

					-- 97 级
					{
						{type=5,value=187581},
			    		{type=7,value=187581},
						{type=17,value=26042},
						{type=19,value=63076},
						{type=21,value=14698},
						{type=23,value=24236},
						{type=25,value=14698},
						{type=27,value=24236},
					},

					-- 98 级
					{
						{type=5,value=188715},
			    		{type=7,value=188715},
						{type=17,value=26098},
						{type=19,value=63216},
						{type=21,value=14734},
						{type=23,value=24290},
						{type=25,value=14734},
						{type=27,value=24290},
					},
					
				},
			},
		},	




----------------------------- 时装 5 鸿运时装  男
		{
			-- 战
			{
				itemId = 6014, --升阶所需道具
				
				inShowIds = {189}, -- 每阶一个内观
				outShowIds = {189}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=9,value=500},
						{type=11,value=998},
						{type=6,value=0.3},
						{type=21,value=200},
						{type=23,value=388},
						{type=25,value=200},
						{type=27,value=388},
					},

					
				},
			},
			-- 法
			{
				itemId = 6014,
				
				inShowIds = {189}, -- 每阶一个内观
				outShowIds = {189}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=13,value=500},
						{type=15,value=998},
						{type=6,value=0.3},
						{type=21,value=200},
						{type=23,value=388},
						{type=25,value=200},
						{type=27,value=388},
					},

					
				},
			},
			-- 道
			{
				itemId = 6014,
				
				inShowIds = {189}, -- 每阶一个内观
				outShowIds = {189}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=17,value=500},
						{type=19,value=998},
						{type=6,value=0.3},
						{type=21,value=200},
						{type=23,value=388},
						{type=25,value=200},
						{type=27,value=388},
					},
					
				},
			},
		},


----------------------------- 时装 6 鸿运时装  女
		{
			-- 战
			{
				itemId = 6015, --升阶所需道具
				
				inShowIds = {190}, -- 每阶一个内观
				outShowIds = {190}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=9,value=500},
						{type=11,value=998},
						{type=6,value=0.3},
						{type=21,value=200},
						{type=23,value=388},
						{type=25,value=200},
						{type=27,value=388},
					},

					
				},
			},
			-- 法
			{
				itemId = 6015,
				
				inShowIds = {190}, -- 每阶一个内观
				outShowIds = {190}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=13,value=500},
						{type=15,value=998},
						{type=6,value=0.3},
						{type=21,value=200},
						{type=23,value=388},
						{type=25,value=200},
						{type=27,value=388},
					},

					
				},
			},
			-- 道
			{
				itemId = 6015,
				
				inShowIds = {190}, -- 每阶一个内观
				outShowIds = {190}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=17,value=500},
						{type=19,value=998},
						{type=6,value=0.3},
						{type=21,value=200},
						{type=23,value=388},
						{type=25,value=200},
						{type=27,value=388},
					},
					
				},
			},
		},


----------------------------- 时装 6 鸿运时装  武器
		{
			-- 战
			{
				itemId = 6013, --升阶所需道具
				inShowIds = {95}, -- 每阶一个内观
				outShowIds = {95}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 1,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=9,value=500},
						{type=11,value=998},
						{type=12,value=0.1},
						{type=16,value=0.1},
						{type=20,value=0.1},
					},

					
				},
			},
			-- 法
			{
				itemId = 6013,
				
				inShowIds = {95}, -- 每阶一个内观
				outShowIds = {95}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 1,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=13,value=500},
						{type=15,value=998},
						{type=12,value=0.1},
						{type=16,value=0.1},
						{type=20,value=0.1},
					},

					
				},
			},
			-- 道
			{
				itemId = 6013,
				
				inShowIds = {95}, -- 每阶一个内观
				outShowIds = {95}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 1,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=17,value=500},
						{type=19,value=998},
						{type=12,value=0.1},
						{type=16,value=0.1},
						{type=20,value=0.1},
					},
					
				},
			},
		},


---三国时装，吕布
	 {
			-- 战
			{
				itemId = 6272, --升阶所需道具
				
				inShowIds = {207,208,209,210}, -- 每阶一个内观
				outShowIds = {207,208,209,210}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 5951, -- 升星消耗的物品ID (0为限时时装，不可升级)
				
				-- 升级消耗的物品数量(限时时装可以不配)
				upgradeItemCounts = {1,8,8,8,8,8,8,8,8,8,8,4,20,20,20,20,20,20,20,20,20,20,8,40,40,40,40,40,40,40,40,40,40,16,80,80,80,80,80,80,80,80,80,80,},
				
					--模块
					-- -- (a1) 级
					-- {
					-- 	{type=(a2),value=(a3)},
			    	-- 	{type=(a4),value=(a5)},
					-- 	{type=(a6),value=(a7)},
					-- 	{type=(a8),value=(a9)},
					-- 	{type=(a10),value=(a11)},
					-- 	{type=(a12),value=(a13)},
					-- 	{type=(a14),value=(a15)},
					-- 	{type=(a16),value=(a17)},
					-- },

				
				-- 限时时装只配0级
				attrs = {
									-- 0 级
					{
						{type=5,value=4500},
			    		{type=7,value=455},
						{type=9,value=150},
						{type=11,value=315},
						{type=21,value=76},
						{type=23,value=126},
						{type=25,value=76},
						{type=27,value=126},
					},
					-- 1 级
					{
						{type=5,value=4725},
			    		{type=7,value=477},
						{type=9,value=155},
						{type=11,value=331},
						{type=21,value=80},
						{type=23,value=132},
						{type=25,value=80},
						{type=27,value=132},
					},
					-- 2 级
					{
						{type=5,value=4950},
			    		{type=7,value=499},
						{type=9,value=160},
						{type=11,value=347},
						{type=21,value=84},
						{type=23,value=138},
						{type=25,value=84},
						{type=27,value=138},
					},
					-- 3 级
					{
						{type=5,value=5175},
			    		{type=7,value=521},
						{type=9,value=165},
						{type=11,value=363},
						{type=21,value=88},
						{type=23,value=144},
						{type=25,value=88},
						{type=27,value=144},
					},
					-- 4 级
					{
						{type=5,value=5400},
			    		{type=7,value=543},
						{type=9,value=170},
						{type=11,value=379},
						{type=21,value=92},
						{type=23,value=150},
						{type=25,value=92},
						{type=27,value=150},
					},
					-- 5 级
					{
						{type=5,value=5625},
			    		{type=7,value=565},
						{type=9,value=175},
						{type=11,value=395},
						{type=21,value=96},
						{type=23,value=156},
						{type=25,value=96},
						{type=27,value=156},
					},
					-- 6 级
					{
						{type=5,value=5850},
			    		{type=7,value=587},
						{type=9,value=180},
						{type=11,value=411},
						{type=21,value=100},
						{type=23,value=162},
						{type=25,value=100},
						{type=27,value=162},
					},
					-- 7 级
					{
						{type=5,value=6075},
			    		{type=7,value=609},
						{type=9,value=185},
						{type=11,value=427},
						{type=21,value=104},
						{type=23,value=168},
						{type=25,value=104},
						{type=27,value=168},
					},
					-- 8 级
					{
						{type=5,value=6300},
			    		{type=7,value=631},
						{type=9,value=190},
						{type=11,value=443},
						{type=21,value=108},
						{type=23,value=174},
						{type=25,value=108},
						{type=27,value=174},
					},
					-- 9 级
					{
						{type=5,value=6525},
			    		{type=7,value=653},
						{type=9,value=195},
						{type=11,value=459},
						{type=21,value=112},
						{type=23,value=180},
						{type=25,value=112},
						{type=27,value=180},
					},
					-- 10 级
					{
						{type=5,value=6750},
			    		{type=7,value=675},
						{type=9,value=200},
						{type=11,value=475},
						{type=21,value=116},
						{type=23,value=186},
						{type=25,value=116},
						{type=27,value=186},
					},
					-- 11 级
					{
						{type=5,value=14750},
			    		{type=7,value=1483},
						{type=9,value=590},
						{type=11,value=1293},
						{type=21,value=312},
						{type=23,value=514},
						{type=25,value=312},
						{type=27,value=514},
					},
					-- 12 级
					{
						{type=5,value=15200},
			    		{type=7,value=1527},
						{type=9,value=600},
						{type=11,value=1318},
						{type=21,value=320},
						{type=23,value=526},
						{type=25,value=320},
						{type=27,value=526},
					},
					-- 13 级
					{
						{type=5,value=15650},
			    		{type=7,value=1571},
						{type=9,value=610},
						{type=11,value=1343},
						{type=21,value=328},
						{type=23,value=538},
						{type=25,value=328},
						{type=27,value=538},
					},
					-- 14 级
					{
						{type=5,value=16100},
			    		{type=7,value=1615},
						{type=9,value=620},
						{type=11,value=1368},
						{type=21,value=336},
						{type=23,value=550},
						{type=25,value=336},
						{type=27,value=550},
					},
					-- 15 级
					{
						{type=5,value=16550},
			    		{type=7,value=1659},
						{type=9,value=630},
						{type=11,value=1393},
						{type=21,value=344},
						{type=23,value=562},
						{type=25,value=344},
						{type=27,value=562},
					},
					-- 16 级
					{
						{type=5,value=17000},
			    		{type=7,value=1703},
						{type=9,value=640},
						{type=11,value=1418},
						{type=21,value=352},
						{type=23,value=574},
						{type=25,value=352},
						{type=27,value=574},
					},
					-- 17 级
					{
						{type=5,value=17450},
			    		{type=7,value=1747},
						{type=9,value=650},
						{type=11,value=1443},
						{type=21,value=360},
						{type=23,value=586},
						{type=25,value=360},
						{type=27,value=586},
					},
					-- 18 级
					{
						{type=5,value=17900},
			    		{type=7,value=1791},
						{type=9,value=660},
						{type=11,value=1468},
						{type=21,value=368},
						{type=23,value=598},
						{type=25,value=368},
						{type=27,value=598},
					},
					-- 19 级
					{
						{type=5,value=18350},
			    		{type=7,value=1835},
						{type=9,value=670},
						{type=11,value=1493},
						{type=21,value=376},
						{type=23,value=610},
						{type=25,value=376},
						{type=27,value=610},
					},
					-- 20 级
					{
						{type=5,value=18800},
			    		{type=7,value=1879},
						{type=9,value=680},
						{type=11,value=1518},
						{type=21,value=384},
						{type=23,value=622},
						{type=25,value=384},
						{type=27,value=622},
					},
					-- 21 级
					{
						{type=5,value=19250},
			    		{type=7,value=1923},
						{type=9,value=690},
						{type=11,value=1543},
						{type=21,value=392},
						{type=23,value=634},
						{type=25,value=392},
						{type=27,value=634},
					},
					-- 22 级
					{
						{type=5,value=32050},
			    		{type=7,value=3216},
						{type=9,value=1426},
						{type=11,value=3088},
						{type=21,value=762},
						{type=23,value=1252},
						{type=25,value=762},
						{type=27,value=1252},
					},
					-- 23 级
					{
						{type=5,value=32725},
			    		{type=7,value=3282},
						{type=9,value=1441},
						{type=11,value=3126},
						{type=21,value=774},
						{type=23,value=1270},
						{type=25,value=774},
						{type=27,value=1270},
					},
					-- 24 级
					{
						{type=5,value=33400},
			    		{type=7,value=3348},
						{type=9,value=1456},
						{type=11,value=3164},
						{type=21,value=786},
						{type=23,value=1288},
						{type=25,value=786},
						{type=27,value=1288},
					},
					-- 25 级
					{
						{type=5,value=34075},
			    		{type=7,value=3414},
						{type=9,value=1471},
						{type=11,value=3202},
						{type=21,value=798},
						{type=23,value=1306},
						{type=25,value=798},
						{type=27,value=1306},
					},
					-- 26 级
					{
						{type=5,value=34750},
			    		{type=7,value=3480},
						{type=9,value=1486},
						{type=11,value=3240},
						{type=21,value=810},
						{type=23,value=1324},
						{type=25,value=810},
						{type=27,value=1324},
					},
					-- 27 级
					{
						{type=5,value=35425},
			    		{type=7,value=3546},
						{type=9,value=1501},
						{type=11,value=3278},
						{type=21,value=822},
						{type=23,value=1342},
						{type=25,value=822},
						{type=27,value=1342},
					},
					-- 28 级
					{
						{type=5,value=36100},
			    		{type=7,value=3612},
						{type=9,value=1516},
						{type=11,value=3316},
						{type=21,value=834},
						{type=23,value=1360},
						{type=25,value=834},
						{type=27,value=1360},
					},
					-- 29 级
					{
						{type=5,value=36775},
			    		{type=7,value=3678},
						{type=9,value=1531},
						{type=11,value=3354},
						{type=21,value=846},
						{type=23,value=1378},
						{type=25,value=846},
						{type=27,value=1378},
					},
					-- 30 级
					{
						{type=5,value=37450},
			    		{type=7,value=3744},
						{type=9,value=1546},
						{type=11,value=3392},
						{type=21,value=858},
						{type=23,value=1396},
						{type=25,value=858},
						{type=27,value=1396},
					},
					-- 31 级
					{
						{type=5,value=38125},
			    		{type=7,value=3810},
						{type=9,value=1561},
						{type=11,value=3430},
						{type=21,value=870},
						{type=23,value=1414},
						{type=25,value=870},
						{type=27,value=1414},
					},
					-- 32 级
					{
						{type=5,value=38800},
			    		{type=7,value=3876},
						{type=9,value=1576},
						{type=11,value=3468},
						{type=21,value=882},
						{type=23,value=1432},
						{type=25,value=882},
						{type=27,value=1432},
					},
					-- 33 级
					{
						{type=5,value=58800},
			    		{type=7,value=5896},
						{type=9,value=2872},
						{type=11,value=6186},
						{type=21,value=1532},
						{type=23,value=2520},
						{type=25,value=1532},
						{type=27,value=2520},
					},
					-- 34 级
					{
						{type=5,value=59700},
			    		{type=7,value=5984},
						{type=9,value=2897},
						{type=11,value=6244},
						{type=21,value=1548},
						{type=23,value=2544},
						{type=25,value=1548},
						{type=27,value=2544},
					},
					-- 35 级
					{
						{type=5,value=60600},
			    		{type=7,value=6072},
						{type=9,value=2922},
						{type=11,value=6302},
						{type=21,value=1564},
						{type=23,value=2568},
						{type=25,value=1564},
						{type=27,value=2568},
					},
					-- 36 级
					{
						{type=5,value=61500},
			    		{type=7,value=6160},
						{type=9,value=2947},
						{type=11,value=6360},
						{type=21,value=1580},
						{type=23,value=2592},
						{type=25,value=1580},
						{type=27,value=2592},
					},
					-- 37 级
					{
						{type=5,value=62400},
			    		{type=7,value=6248},
						{type=9,value=2972},
						{type=11,value=6418},
						{type=21,value=1596},
						{type=23,value=2616},
						{type=25,value=1596},
						{type=27,value=2616},
					},
					-- 38 级
					{
						{type=5,value=63300},
			    		{type=7,value=6336},
						{type=9,value=2997},
						{type=11,value=6476},
						{type=21,value=1612},
						{type=23,value=2640},
						{type=25,value=1612},
						{type=27,value=2640},
					},
					-- 39 级
					{
						{type=5,value=64200},
			    		{type=7,value=6424},
						{type=9,value=3022},
						{type=11,value=6534},
						{type=21,value=1628},
						{type=23,value=2664},
						{type=25,value=1628},
						{type=27,value=2664},
					},
					-- 40 级
					{
						{type=5,value=65100},
			    		{type=7,value=6512},
						{type=9,value=3047},
						{type=11,value=6592},
						{type=21,value=1644},
						{type=23,value=2688},
						{type=25,value=1644},
						{type=27,value=2688},
					},
					-- 41 级
					{
						{type=5,value=66000},
			    		{type=7,value=6600},
						{type=9,value=3072},
						{type=11,value=6650},
						{type=21,value=1660},
						{type=23,value=2712},
						{type=25,value=1660},
						{type=27,value=2712},
					},
					-- 42 级
					{
						{type=5,value=66900},
			    		{type=7,value=6688},
						{type=9,value=3097},
						{type=11,value=6708},
						{type=21,value=1676},
						{type=23,value=2736},
						{type=25,value=1676},
						{type=27,value=2736},
					},
					-- 43 级
					{
						{type=5,value=67800},
			    		{type=7,value=6776},
						{type=9,value=3122},
						{type=11,value=6766},
						{type=21,value=1692},
						{type=23,value=2760},
						{type=25,value=1692},
						{type=27,value=2760},
					},


					
				},
			},
			-- 法
			{
				itemId = 6272,
				
				inShowIds = {207,208,209,210}, -- 每阶一个内观
				outShowIds = {207,208,209,210}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 5951, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,8,8,8,8,8,8,8,8,8,8,4,20,20,20,20,20,20,20,20,20,20,8,40,40,40,40,40,40,40,40,40,40,16,80,80,80,80,80,80,80,80,80,80,
				28,120,120,120,120,120,120,120,120,120,120,42,160,160,160,160,160,160,160,160,160,160,58,200,200,200,200,200,200,200,200,200,200,76,240,240
				,240,240,240,240,240,240,240,240,96,280,280,280,280,280,280,280,280,280,280,},
				
				attrs = {
										-- 0 级
					{
						{type=5,value=1157},
			    		{type=7,value=4628},
						{type=13,value=150},
						{type=15,value=315},
						{type=21,value=76},
						{type=23,value=126},
						{type=25,value=76},
						{type=27,value=126},
					},
					-- 1 级
					{
						{type=5,value=1215},
			    		{type=7,value=4858},
						{type=13,value=155},
						{type=15,value=331},
						{type=21,value=80},
						{type=23,value=132},
						{type=25,value=80},
						{type=27,value=132},
					},
					-- 2 级
					{
						{type=5,value=1273},
			    		{type=7,value=5088},
						{type=13,value=160},
						{type=15,value=347},
						{type=21,value=84},
						{type=23,value=138},
						{type=25,value=84},
						{type=27,value=138},
					},
					-- 3 级
					{
						{type=5,value=1331},
			    		{type=7,value=5318},
						{type=13,value=165},
						{type=15,value=363},
						{type=21,value=88},
						{type=23,value=144},
						{type=25,value=88},
						{type=27,value=144},
					},
					-- 4 级
					{
						{type=5,value=1389},
			    		{type=7,value=5548},
						{type=13,value=170},
						{type=15,value=379},
						{type=21,value=92},
						{type=23,value=150},
						{type=25,value=92},
						{type=27,value=150},
					},
					-- 5 级
					{
						{type=5,value=1447},
			    		{type=7,value=5778},
						{type=13,value=175},
						{type=15,value=395},
						{type=21,value=96},
						{type=23,value=156},
						{type=25,value=96},
						{type=27,value=156},
					},
					-- 6 级
					{
						{type=5,value=1505},
			    		{type=7,value=6008},
						{type=13,value=180},
						{type=15,value=411},
						{type=21,value=100},
						{type=23,value=162},
						{type=25,value=100},
						{type=27,value=162},
					},
					-- 7 级
					{
						{type=5,value=1563},
			    		{type=7,value=6238},
						{type=13,value=185},
						{type=15,value=427},
						{type=21,value=104},
						{type=23,value=168},
						{type=25,value=104},
						{type=27,value=168},
					},
					-- 8 级
					{
						{type=5,value=1621},
			    		{type=7,value=6468},
						{type=13,value=190},
						{type=15,value=443},
						{type=21,value=108},
						{type=23,value=174},
						{type=25,value=108},
						{type=27,value=174},
					},
					-- 9 级
					{
						{type=5,value=1679},
			    		{type=7,value=6698},
						{type=13,value=195},
						{type=15,value=459},
						{type=21,value=112},
						{type=23,value=180},
						{type=25,value=112},
						{type=27,value=180},
					},
					-- 10 级
					{
						{type=5,value=1737},
			    		{type=7,value=6928},
						{type=13,value=200},
						{type=15,value=475},
						{type=21,value=116},
						{type=23,value=186},
						{type=25,value=116},
						{type=27,value=186},
					},
					-- 11 级
					{
						{type=5,value=3794},
			    		{type=7,value=15156},
						{type=13,value=590},
						{type=15,value=1293},
						{type=21,value=312},
						{type=23,value=514},
						{type=25,value=312},
						{type=27,value=514},
					},
					-- 12 级
					{
						{type=5,value=3910},
			    		{type=7,value=15616},
						{type=13,value=600},
						{type=15,value=1318},
						{type=21,value=320},
						{type=23,value=526},
						{type=25,value=320},
						{type=27,value=526},
					},
					-- 13 级
					{
						{type=5,value=4026},
			    		{type=7,value=16076},
						{type=13,value=610},
						{type=15,value=1343},
						{type=21,value=328},
						{type=23,value=538},
						{type=25,value=328},
						{type=27,value=538},
					},
					-- 14 级
					{
						{type=5,value=4142},
			    		{type=7,value=16536},
						{type=13,value=620},
						{type=15,value=1368},
						{type=21,value=336},
						{type=23,value=550},
						{type=25,value=336},
						{type=27,value=550},
					},
					-- 15 级
					{
						{type=5,value=4258},
			    		{type=7,value=16996},
						{type=13,value=630},
						{type=15,value=1393},
						{type=21,value=344},
						{type=23,value=562},
						{type=25,value=344},
						{type=27,value=562},
					},
					-- 16 级
					{
						{type=5,value=4374},
			    		{type=7,value=17456},
						{type=13,value=640},
						{type=15,value=1418},
						{type=21,value=352},
						{type=23,value=574},
						{type=25,value=352},
						{type=27,value=574},
					},
					-- 17 级
					{
						{type=5,value=4490},
			    		{type=7,value=17916},
						{type=13,value=650},
						{type=15,value=1443},
						{type=21,value=360},
						{type=23,value=586},
						{type=25,value=360},
						{type=27,value=586},
					},
					-- 18 级
					{
						{type=5,value=4606},
			    		{type=7,value=18376},
						{type=13,value=660},
						{type=15,value=1468},
						{type=21,value=368},
						{type=23,value=598},
						{type=25,value=368},
						{type=27,value=598},
					},
					-- 19 级
					{
						{type=5,value=4722},
			    		{type=7,value=18836},
						{type=13,value=670},
						{type=15,value=1493},
						{type=21,value=376},
						{type=23,value=610},
						{type=25,value=376},
						{type=27,value=610},
					},
					-- 20 级
					{
						{type=5,value=4838},
			    		{type=7,value=19296},
						{type=13,value=680},
						{type=15,value=1518},
						{type=21,value=384},
						{type=23,value=622},
						{type=25,value=384},
						{type=27,value=622},
					},
					-- 21 级
					{
						{type=5,value=4954},
			    		{type=7,value=19756},
						{type=13,value=690},
						{type=15,value=1543},
						{type=21,value=392},
						{type=23,value=634},
						{type=25,value=392},
						{type=27,value=634},
					},
					-- 22 级
					{
						{type=5,value=8245},
			    		{type=7,value=32920},
						{type=13,value=1426},
						{type=15,value=3088},
						{type=21,value=762},
						{type=23,value=1252},
						{type=25,value=762},
						{type=27,value=1252},
					},
					-- 23 级
					{
						{type=5,value=8419},
			    		{type=7,value=33610},
						{type=13,value=1441},
						{type=15,value=3126},
						{type=21,value=774},
						{type=23,value=1270},
						{type=25,value=774},
						{type=27,value=1270},
					},
					-- 24 级
					{
						{type=5,value=8593},
			    		{type=7,value=34300},
						{type=13,value=1456},
						{type=15,value=3164},
						{type=21,value=786},
						{type=23,value=1288},
						{type=25,value=786},
						{type=27,value=1288},
					},
					-- 25 级
					{
						{type=5,value=8767},
			    		{type=7,value=34990},
						{type=13,value=1471},
						{type=15,value=3202},
						{type=21,value=798},
						{type=23,value=1306},
						{type=25,value=798},
						{type=27,value=1306},
					},
					-- 26 级
					{
						{type=5,value=8941},
			    		{type=7,value=35680},
						{type=13,value=1486},
						{type=15,value=3240},
						{type=21,value=810},
						{type=23,value=1324},
						{type=25,value=810},
						{type=27,value=1324},
					},
					-- 27 级
					{
						{type=5,value=9115},
			    		{type=7,value=36370},
						{type=13,value=1501},
						{type=15,value=3278},
						{type=21,value=822},
						{type=23,value=1342},
						{type=25,value=822},
						{type=27,value=1342},
					},
					-- 28 级
					{
						{type=5,value=9289},
			    		{type=7,value=37060},
						{type=13,value=1516},
						{type=15,value=3316},
						{type=21,value=834},
						{type=23,value=1360},
						{type=25,value=834},
						{type=27,value=1360},
					},
					-- 29 级
					{
						{type=5,value=9463},
			    		{type=7,value=37750},
						{type=13,value=1531},
						{type=15,value=3354},
						{type=21,value=846},
						{type=23,value=1378},
						{type=25,value=846},
						{type=27,value=1378},
					},
					-- 30 级
					{
						{type=5,value=9637},
			    		{type=7,value=38440},
						{type=13,value=1546},
						{type=15,value=3392},
						{type=21,value=858},
						{type=23,value=1396},
						{type=25,value=858},
						{type=27,value=1396},
					},
					-- 31 级
					{
						{type=5,value=9811},
			    		{type=7,value=39130},
						{type=13,value=1561},
						{type=15,value=3430},
						{type=21,value=870},
						{type=23,value=1414},
						{type=25,value=870},
						{type=27,value=1414},
					},
					-- 32 级
					{
						{type=5,value=9985},
			    		{type=7,value=39820},
						{type=13,value=1576},
						{type=15,value=3468},
						{type=21,value=882},
						{type=23,value=1432},
						{type=25,value=882},
						{type=27,value=1432},
					},
					-- 33 级
					{
						{type=5,value=15127},
			    		{type=7,value=60388},
						{type=13,value=2872},
						{type=15,value=6186},
						{type=21,value=1532},
						{type=23,value=2520},
						{type=25,value=1532},
						{type=27,value=2520},
					},
					-- 34 级
					{
						{type=5,value=15359},
			    		{type=7,value=61308},
						{type=13,value=2897},
						{type=15,value=6244},
						{type=21,value=1548},
						{type=23,value=2544},
						{type=25,value=1548},
						{type=27,value=2544},
					},
					-- 35 级
					{
						{type=5,value=15591},
			    		{type=7,value=62228},
						{type=13,value=2922},
						{type=15,value=6302},
						{type=21,value=1564},
						{type=23,value=2568},
						{type=25,value=1564},
						{type=27,value=2568},
					},
					-- 36 级
					{
						{type=5,value=15823},
			    		{type=7,value=63148},
						{type=13,value=2947},
						{type=15,value=6360},
						{type=21,value=1580},
						{type=23,value=2592},
						{type=25,value=1580},
						{type=27,value=2592},
					},
					-- 37 级
					{
						{type=5,value=16055},
			    		{type=7,value=64068},
						{type=13,value=2972},
						{type=15,value=6418},
						{type=21,value=1596},
						{type=23,value=2616},
						{type=25,value=1596},
						{type=27,value=2616},
					},
					-- 38 级
					{
						{type=5,value=16287},
			    		{type=7,value=64988},
						{type=13,value=2997},
						{type=15,value=6476},
						{type=21,value=1612},
						{type=23,value=2640},
						{type=25,value=1612},
						{type=27,value=2640},
					},
					-- 39 级
					{
						{type=5,value=16519},
			    		{type=7,value=65908},
						{type=13,value=3022},
						{type=15,value=6534},
						{type=21,value=1628},
						{type=23,value=2664},
						{type=25,value=1628},
						{type=27,value=2664},
					},
					-- 40 级
					{
						{type=5,value=16751},
			    		{type=7,value=66828},
						{type=13,value=3047},
						{type=15,value=6592},
						{type=21,value=1644},
						{type=23,value=2688},
						{type=25,value=1644},
						{type=27,value=2688},
					},
					-- 41 级
					{
						{type=5,value=16983},
			    		{type=7,value=67748},
						{type=13,value=3072},
						{type=15,value=6650},
						{type=21,value=1660},
						{type=23,value=2712},
						{type=25,value=1660},
						{type=27,value=2712},
					},
					-- 42 级
					{
						{type=5,value=17215},
			    		{type=7,value=68668},
						{type=13,value=3097},
						{type=15,value=6708},
						{type=21,value=1676},
						{type=23,value=2736},
						{type=25,value=1676},
						{type=27,value=2736},
					},
					-- 43 级
					{
						{type=5,value=17447},
			    		{type=7,value=69588},
						{type=13,value=3122},
						{type=15,value=6766},
						{type=21,value=1692},
						{type=23,value=2760},
						{type=25,value=1692},
						{type=27,value=2760},
					},


					
				},
			},
			-- 道
			{
				itemId = 6272,
				
				inShowIds = {207,208,209,210}, -- 每阶一个内观
				outShowIds = {207,208,209,210}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 5951, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,8,8,8,8,8,8,8,8,8,8,4,20,20,20,20,20,20,20,20,20,20,8,40,40,40,40,40,40,40,40,40,40,16,80,80,80,80,80,80,80,80,80,80,
				28,120,120,120,120,120,120,120,120,120,120,42,160,160,160,160,160,160,160,160,160,160,58,200,200,200,200,200,200,200,200,200,200,76,240,240
				,240,240,240,240,240,240,240,240,96,280,280,280,280,280,280,280,280,280,280,},
				
				attrs = {
										-- 0 级
					{
						{type=5,value=2514},
			    		{type=7,value=2514},
						{type=17,value=150},
						{type=19,value=315},
						{type=21,value=76},
						{type=23,value=126},
						{type=25,value=76},
						{type=27,value=126},
					},
					-- 1 级
					{
						{type=5,value=2640},
			    		{type=7,value=2640},
						{type=17,value=155},
						{type=19,value=331},
						{type=21,value=80},
						{type=23,value=132},
						{type=25,value=80},
						{type=27,value=132},
					},
					-- 2 级
					{
						{type=5,value=2766},
			    		{type=7,value=2766},
						{type=17,value=160},
						{type=19,value=347},
						{type=21,value=84},
						{type=23,value=138},
						{type=25,value=84},
						{type=27,value=138},
					},
					-- 3 级
					{
						{type=5,value=2892},
			    		{type=7,value=2892},
						{type=17,value=165},
						{type=19,value=363},
						{type=21,value=88},
						{type=23,value=144},
						{type=25,value=88},
						{type=27,value=144},
					},
					-- 4 级
					{
						{type=5,value=3018},
			    		{type=7,value=3018},
						{type=17,value=170},
						{type=19,value=379},
						{type=21,value=92},
						{type=23,value=150},
						{type=25,value=92},
						{type=27,value=150},
					},
					-- 5 级
					{
						{type=5,value=3144},
			    		{type=7,value=3144},
						{type=17,value=175},
						{type=19,value=395},
						{type=21,value=96},
						{type=23,value=156},
						{type=25,value=96},
						{type=27,value=156},
					},
					-- 6 级
					{
						{type=5,value=3270},
			    		{type=7,value=3270},
						{type=17,value=180},
						{type=19,value=411},
						{type=21,value=100},
						{type=23,value=162},
						{type=25,value=100},
						{type=27,value=162},
					},
					-- 7 级
					{
						{type=5,value=3396},
			    		{type=7,value=3396},
						{type=17,value=185},
						{type=19,value=427},
						{type=21,value=104},
						{type=23,value=168},
						{type=25,value=104},
						{type=27,value=168},
					},
					-- 8 级
					{
						{type=5,value=3522},
			    		{type=7,value=3522},
						{type=17,value=190},
						{type=19,value=443},
						{type=21,value=108},
						{type=23,value=174},
						{type=25,value=108},
						{type=27,value=174},
					},
					-- 9 级
					{
						{type=5,value=3648},
			    		{type=7,value=3648},
						{type=17,value=195},
						{type=19,value=459},
						{type=21,value=112},
						{type=23,value=180},
						{type=25,value=112},
						{type=27,value=180},
					},
					-- 10 级
					{
						{type=5,value=3774},
			    		{type=7,value=3774},
						{type=17,value=200},
						{type=19,value=475},
						{type=21,value=116},
						{type=23,value=186},
						{type=25,value=116},
						{type=27,value=186},
					},
					-- 11 级
					{
						{type=5,value=8244},
			    		{type=7,value=8244},
						{type=17,value=590},
						{type=19,value=1293},
						{type=21,value=312},
						{type=23,value=514},
						{type=25,value=312},
						{type=27,value=514},
					},
					-- 12 级
					{
						{type=5,value=8496},
			    		{type=7,value=8496},
						{type=17,value=600},
						{type=19,value=1318},
						{type=21,value=320},
						{type=23,value=526},
						{type=25,value=320},
						{type=27,value=526},
					},
					-- 13 级
					{
						{type=5,value=8748},
			    		{type=7,value=8748},
						{type=17,value=610},
						{type=19,value=1343},
						{type=21,value=328},
						{type=23,value=538},
						{type=25,value=328},
						{type=27,value=538},
					},
					-- 14 级
					{
						{type=5,value=9000},
			    		{type=7,value=9000},
						{type=17,value=620},
						{type=19,value=1368},
						{type=21,value=336},
						{type=23,value=550},
						{type=25,value=336},
						{type=27,value=550},
					},
					-- 15 级
					{
						{type=5,value=9252},
			    		{type=7,value=9252},
						{type=17,value=630},
						{type=19,value=1393},
						{type=21,value=344},
						{type=23,value=562},
						{type=25,value=344},
						{type=27,value=562},
					},
					-- 16 级
					{
						{type=5,value=9504},
			    		{type=7,value=9504},
						{type=17,value=640},
						{type=19,value=1418},
						{type=21,value=352},
						{type=23,value=574},
						{type=25,value=352},
						{type=27,value=574},
					},
					-- 17 级
					{
						{type=5,value=9756},
			    		{type=7,value=9756},
						{type=17,value=650},
						{type=19,value=1443},
						{type=21,value=360},
						{type=23,value=586},
						{type=25,value=360},
						{type=27,value=586},
					},
					-- 18 级
					{
						{type=5,value=10008},
			    		{type=7,value=10008},
						{type=17,value=660},
						{type=19,value=1468},
						{type=21,value=368},
						{type=23,value=598},
						{type=25,value=368},
						{type=27,value=598},
					},
					-- 19 级
					{
						{type=5,value=10260},
			    		{type=7,value=10260},
						{type=17,value=670},
						{type=19,value=1493},
						{type=21,value=376},
						{type=23,value=610},
						{type=25,value=376},
						{type=27,value=610},
					},
					-- 20 级
					{
						{type=5,value=10512},
			    		{type=7,value=10512},
						{type=17,value=680},
						{type=19,value=1518},
						{type=21,value=384},
						{type=23,value=622},
						{type=25,value=384},
						{type=27,value=622},
					},
					-- 21 级
					{
						{type=5,value=10764},
			    		{type=7,value=10764},
						{type=17,value=690},
						{type=19,value=1543},
						{type=21,value=392},
						{type=23,value=634},
						{type=25,value=392},
						{type=27,value=634},
					},
					-- 22 级
					{
						{type=5,value=17915},
			    		{type=7,value=17915},
						{type=17,value=1426},
						{type=19,value=3088},
						{type=21,value=762},
						{type=23,value=1252},
						{type=25,value=762},
						{type=27,value=1252},
					},
					-- 23 级
					{
						{type=5,value=18293},
			    		{type=7,value=18293},
						{type=17,value=1441},
						{type=19,value=3126},
						{type=21,value=774},
						{type=23,value=1270},
						{type=25,value=774},
						{type=27,value=1270},
					},
					-- 24 级
					{
						{type=5,value=18671},
			    		{type=7,value=18671},
						{type=17,value=1456},
						{type=19,value=3164},
						{type=21,value=786},
						{type=23,value=1288},
						{type=25,value=786},
						{type=27,value=1288},
					},
					-- 25 级
					{
						{type=5,value=19049},
			    		{type=7,value=19049},
						{type=17,value=1471},
						{type=19,value=3202},
						{type=21,value=798},
						{type=23,value=1306},
						{type=25,value=798},
						{type=27,value=1306},
					},
					-- 26 级
					{
						{type=5,value=19427},
			    		{type=7,value=19427},
						{type=17,value=1486},
						{type=19,value=3240},
						{type=21,value=810},
						{type=23,value=1324},
						{type=25,value=810},
						{type=27,value=1324},
					},
					-- 27 级
					{
						{type=5,value=19805},
			    		{type=7,value=19805},
						{type=17,value=1501},
						{type=19,value=3278},
						{type=21,value=822},
						{type=23,value=1342},
						{type=25,value=822},
						{type=27,value=1342},
					},
					-- 28 级
					{
						{type=5,value=20183},
			    		{type=7,value=20183},
						{type=17,value=1516},
						{type=19,value=3316},
						{type=21,value=834},
						{type=23,value=1360},
						{type=25,value=834},
						{type=27,value=1360},
					},
					-- 29 级
					{
						{type=5,value=20561},
			    		{type=7,value=20561},
						{type=17,value=1531},
						{type=19,value=3354},
						{type=21,value=846},
						{type=23,value=1378},
						{type=25,value=846},
						{type=27,value=1378},
					},
					-- 30 级
					{
						{type=5,value=20939},
			    		{type=7,value=20939},
						{type=17,value=1546},
						{type=19,value=3392},
						{type=21,value=858},
						{type=23,value=1396},
						{type=25,value=858},
						{type=27,value=1396},
					},
					-- 31 级
					{
						{type=5,value=21317},
			    		{type=7,value=21317},
						{type=17,value=1561},
						{type=19,value=3430},
						{type=21,value=870},
						{type=23,value=1414},
						{type=25,value=870},
						{type=27,value=1414},
					},
					-- 32 级
					{
						{type=5,value=21695},
			    		{type=7,value=21695},
						{type=17,value=1576},
						{type=19,value=3468},
						{type=21,value=882},
						{type=23,value=1432},
						{type=25,value=882},
						{type=27,value=1432},
					},
					-- 33 级
					{
						{type=5,value=32869},
			    		{type=7,value=32869},
						{type=17,value=2872},
						{type=19,value=6186},
						{type=21,value=1532},
						{type=23,value=2520},
						{type=25,value=1532},
						{type=27,value=2520},
					},
					-- 34 级
					{
						{type=5,value=33373},
			    		{type=7,value=33373},
						{type=17,value=2897},
						{type=19,value=6244},
						{type=21,value=1548},
						{type=23,value=2544},
						{type=25,value=1548},
						{type=27,value=2544},
					},
					-- 35 级
					{
						{type=5,value=33877},
			    		{type=7,value=33877},
						{type=17,value=2922},
						{type=19,value=6302},
						{type=21,value=1564},
						{type=23,value=2568},
						{type=25,value=1564},
						{type=27,value=2568},
					},
					-- 36 级
					{
						{type=5,value=34381},
			    		{type=7,value=34381},
						{type=17,value=2947},
						{type=19,value=6360},
						{type=21,value=1580},
						{type=23,value=2592},
						{type=25,value=1580},
						{type=27,value=2592},
					},
					-- 37 级
					{
						{type=5,value=34885},
			    		{type=7,value=34885},
						{type=17,value=2972},
						{type=19,value=6418},
						{type=21,value=1596},
						{type=23,value=2616},
						{type=25,value=1596},
						{type=27,value=2616},
					},
					-- 38 级
					{
						{type=5,value=35389},
			    		{type=7,value=35389},
						{type=17,value=2997},
						{type=19,value=6476},
						{type=21,value=1612},
						{type=23,value=2640},
						{type=25,value=1612},
						{type=27,value=2640},
					},
					-- 39 级
					{
						{type=5,value=35893},
			    		{type=7,value=35893},
						{type=17,value=3022},
						{type=19,value=6534},
						{type=21,value=1628},
						{type=23,value=2664},
						{type=25,value=1628},
						{type=27,value=2664},
					},
					-- 40 级
					{
						{type=5,value=36397},
			    		{type=7,value=36397},
						{type=17,value=3047},
						{type=19,value=6592},
						{type=21,value=1644},
						{type=23,value=2688},
						{type=25,value=1644},
						{type=27,value=2688},
					},
					-- 41 级
					{
						{type=5,value=36901},
			    		{type=7,value=36901},
						{type=17,value=3072},
						{type=19,value=6650},
						{type=21,value=1660},
						{type=23,value=2712},
						{type=25,value=1660},
						{type=27,value=2712},
					},
					-- 42 级
					{
						{type=5,value=37405},
			    		{type=7,value=37405},
						{type=17,value=3097},
						{type=19,value=6708},
						{type=21,value=1676},
						{type=23,value=2736},
						{type=25,value=1676},
						{type=27,value=2736},
					},
					-- 43 级
					{
						{type=5,value=37909},
			    		{type=7,value=37909},
						{type=17,value=3122},
						{type=19,value=6766},
						{type=21,value=1692},
						{type=23,value=2760},
						{type=25,value=1692},
						{type=27,value=2760},
					},


					
				},
			},
		},


		----------------------------- 三国时装 关羽
				{
			-- 战
			{
				itemId = 6273, --升阶所需道具
				
				inShowIds = {203,204,205,206}, -- 每阶一个内观
				outShowIds = {203,204,205,206}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 5951, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,8,8,8,8,8,8,8,8,8,8,4,20,20,20,20,20,20,20,20,20,20,8,40,40,40,40,40,40,40,40,40,40,16,80,80,80,80,80,80,80,80,80,80,},
				
					-- --模块
					-- -- (a1) 级
					-- {
					-- 	{type=(a2),value=(a3)},
			    	-- 	{type=(a4),value=(a5)},
					-- 	{type=(a6),value=(a7)},
					-- 	{type=(a8),value=(a9)},
					-- 	{type=(a10),value=(a11)},
					-- 	{type=(a12),value=(a13)},
					-- 	{type=(a14),value=(a15)},
					-- 	{type=(a16),value=(a17)},
					-- },


				attrs = {
									-- 0 级
					{
						{type=5,value=4500},
			    		{type=7,value=455},
						{type=9,value=150},
						{type=11,value=315},
						{type=21,value=76},
						{type=23,value=126},
						{type=25,value=76},
						{type=27,value=126},
					},
					-- 1 级
					{
						{type=5,value=4725},
			    		{type=7,value=477},
						{type=9,value=155},
						{type=11,value=331},
						{type=21,value=80},
						{type=23,value=132},
						{type=25,value=80},
						{type=27,value=132},
					},
					-- 2 级
					{
						{type=5,value=4950},
			    		{type=7,value=499},
						{type=9,value=160},
						{type=11,value=347},
						{type=21,value=84},
						{type=23,value=138},
						{type=25,value=84},
						{type=27,value=138},
					},
					-- 3 级
					{
						{type=5,value=5175},
			    		{type=7,value=521},
						{type=9,value=165},
						{type=11,value=363},
						{type=21,value=88},
						{type=23,value=144},
						{type=25,value=88},
						{type=27,value=144},
					},
					-- 4 级
					{
						{type=5,value=5400},
			    		{type=7,value=543},
						{type=9,value=170},
						{type=11,value=379},
						{type=21,value=92},
						{type=23,value=150},
						{type=25,value=92},
						{type=27,value=150},
					},
					-- 5 级
					{
						{type=5,value=5625},
			    		{type=7,value=565},
						{type=9,value=175},
						{type=11,value=395},
						{type=21,value=96},
						{type=23,value=156},
						{type=25,value=96},
						{type=27,value=156},
					},
					-- 6 级
					{
						{type=5,value=5850},
			    		{type=7,value=587},
						{type=9,value=180},
						{type=11,value=411},
						{type=21,value=100},
						{type=23,value=162},
						{type=25,value=100},
						{type=27,value=162},
					},
					-- 7 级
					{
						{type=5,value=6075},
			    		{type=7,value=609},
						{type=9,value=185},
						{type=11,value=427},
						{type=21,value=104},
						{type=23,value=168},
						{type=25,value=104},
						{type=27,value=168},
					},
					-- 8 级
					{
						{type=5,value=6300},
			    		{type=7,value=631},
						{type=9,value=190},
						{type=11,value=443},
						{type=21,value=108},
						{type=23,value=174},
						{type=25,value=108},
						{type=27,value=174},
					},
					-- 9 级
					{
						{type=5,value=6525},
			    		{type=7,value=653},
						{type=9,value=195},
						{type=11,value=459},
						{type=21,value=112},
						{type=23,value=180},
						{type=25,value=112},
						{type=27,value=180},
					},
					-- 10 级
					{
						{type=5,value=6750},
			    		{type=7,value=675},
						{type=9,value=200},
						{type=11,value=475},
						{type=21,value=116},
						{type=23,value=186},
						{type=25,value=116},
						{type=27,value=186},
					},
					-- 11 级
					{
						{type=5,value=14750},
			    		{type=7,value=1483},
						{type=9,value=590},
						{type=11,value=1293},
						{type=21,value=312},
						{type=23,value=514},
						{type=25,value=312},
						{type=27,value=514},
					},
					-- 12 级
					{
						{type=5,value=15200},
			    		{type=7,value=1527},
						{type=9,value=600},
						{type=11,value=1318},
						{type=21,value=320},
						{type=23,value=526},
						{type=25,value=320},
						{type=27,value=526},
					},
					-- 13 级
					{
						{type=5,value=15650},
			    		{type=7,value=1571},
						{type=9,value=610},
						{type=11,value=1343},
						{type=21,value=328},
						{type=23,value=538},
						{type=25,value=328},
						{type=27,value=538},
					},
					-- 14 级
					{
						{type=5,value=16100},
			    		{type=7,value=1615},
						{type=9,value=620},
						{type=11,value=1368},
						{type=21,value=336},
						{type=23,value=550},
						{type=25,value=336},
						{type=27,value=550},
					},
					-- 15 级
					{
						{type=5,value=16550},
			    		{type=7,value=1659},
						{type=9,value=630},
						{type=11,value=1393},
						{type=21,value=344},
						{type=23,value=562},
						{type=25,value=344},
						{type=27,value=562},
					},
					-- 16 级
					{
						{type=5,value=17000},
			    		{type=7,value=1703},
						{type=9,value=640},
						{type=11,value=1418},
						{type=21,value=352},
						{type=23,value=574},
						{type=25,value=352},
						{type=27,value=574},
					},
					-- 17 级
					{
						{type=5,value=17450},
			    		{type=7,value=1747},
						{type=9,value=650},
						{type=11,value=1443},
						{type=21,value=360},
						{type=23,value=586},
						{type=25,value=360},
						{type=27,value=586},
					},
					-- 18 级
					{
						{type=5,value=17900},
			    		{type=7,value=1791},
						{type=9,value=660},
						{type=11,value=1468},
						{type=21,value=368},
						{type=23,value=598},
						{type=25,value=368},
						{type=27,value=598},
					},
					-- 19 级
					{
						{type=5,value=18350},
			    		{type=7,value=1835},
						{type=9,value=670},
						{type=11,value=1493},
						{type=21,value=376},
						{type=23,value=610},
						{type=25,value=376},
						{type=27,value=610},
					},
					-- 20 级
					{
						{type=5,value=18800},
			    		{type=7,value=1879},
						{type=9,value=680},
						{type=11,value=1518},
						{type=21,value=384},
						{type=23,value=622},
						{type=25,value=384},
						{type=27,value=622},
					},
					-- 21 级
					{
						{type=5,value=19250},
			    		{type=7,value=1923},
						{type=9,value=690},
						{type=11,value=1543},
						{type=21,value=392},
						{type=23,value=634},
						{type=25,value=392},
						{type=27,value=634},
					},
					-- 22 级
					{
						{type=5,value=32050},
			    		{type=7,value=3216},
						{type=9,value=1426},
						{type=11,value=3088},
						{type=21,value=762},
						{type=23,value=1252},
						{type=25,value=762},
						{type=27,value=1252},
					},
					-- 23 级
					{
						{type=5,value=32725},
			    		{type=7,value=3282},
						{type=9,value=1441},
						{type=11,value=3126},
						{type=21,value=774},
						{type=23,value=1270},
						{type=25,value=774},
						{type=27,value=1270},
					},
					-- 24 级
					{
						{type=5,value=33400},
			    		{type=7,value=3348},
						{type=9,value=1456},
						{type=11,value=3164},
						{type=21,value=786},
						{type=23,value=1288},
						{type=25,value=786},
						{type=27,value=1288},
					},
					-- 25 级
					{
						{type=5,value=34075},
			    		{type=7,value=3414},
						{type=9,value=1471},
						{type=11,value=3202},
						{type=21,value=798},
						{type=23,value=1306},
						{type=25,value=798},
						{type=27,value=1306},
					},
					-- 26 级
					{
						{type=5,value=34750},
			    		{type=7,value=3480},
						{type=9,value=1486},
						{type=11,value=3240},
						{type=21,value=810},
						{type=23,value=1324},
						{type=25,value=810},
						{type=27,value=1324},
					},
					-- 27 级
					{
						{type=5,value=35425},
			    		{type=7,value=3546},
						{type=9,value=1501},
						{type=11,value=3278},
						{type=21,value=822},
						{type=23,value=1342},
						{type=25,value=822},
						{type=27,value=1342},
					},
					-- 28 级
					{
						{type=5,value=36100},
			    		{type=7,value=3612},
						{type=9,value=1516},
						{type=11,value=3316},
						{type=21,value=834},
						{type=23,value=1360},
						{type=25,value=834},
						{type=27,value=1360},
					},
					-- 29 级
					{
						{type=5,value=36775},
			    		{type=7,value=3678},
						{type=9,value=1531},
						{type=11,value=3354},
						{type=21,value=846},
						{type=23,value=1378},
						{type=25,value=846},
						{type=27,value=1378},
					},
					-- 30 级
					{
						{type=5,value=37450},
			    		{type=7,value=3744},
						{type=9,value=1546},
						{type=11,value=3392},
						{type=21,value=858},
						{type=23,value=1396},
						{type=25,value=858},
						{type=27,value=1396},
					},
					-- 31 级
					{
						{type=5,value=38125},
			    		{type=7,value=3810},
						{type=9,value=1561},
						{type=11,value=3430},
						{type=21,value=870},
						{type=23,value=1414},
						{type=25,value=870},
						{type=27,value=1414},
					},
					-- 32 级
					{
						{type=5,value=38800},
			    		{type=7,value=3876},
						{type=9,value=1576},
						{type=11,value=3468},
						{type=21,value=882},
						{type=23,value=1432},
						{type=25,value=882},
						{type=27,value=1432},
					},
					-- 33 级
					{
						{type=5,value=58800},
			    		{type=7,value=5896},
						{type=9,value=2872},
						{type=11,value=6186},
						{type=21,value=1532},
						{type=23,value=2520},
						{type=25,value=1532},
						{type=27,value=2520},
					},
					-- 34 级
					{
						{type=5,value=59700},
			    		{type=7,value=5984},
						{type=9,value=2897},
						{type=11,value=6244},
						{type=21,value=1548},
						{type=23,value=2544},
						{type=25,value=1548},
						{type=27,value=2544},
					},
					-- 35 级
					{
						{type=5,value=60600},
			    		{type=7,value=6072},
						{type=9,value=2922},
						{type=11,value=6302},
						{type=21,value=1564},
						{type=23,value=2568},
						{type=25,value=1564},
						{type=27,value=2568},
					},
					-- 36 级
					{
						{type=5,value=61500},
			    		{type=7,value=6160},
						{type=9,value=2947},
						{type=11,value=6360},
						{type=21,value=1580},
						{type=23,value=2592},
						{type=25,value=1580},
						{type=27,value=2592},
					},
					-- 37 级
					{
						{type=5,value=62400},
			    		{type=7,value=6248},
						{type=9,value=2972},
						{type=11,value=6418},
						{type=21,value=1596},
						{type=23,value=2616},
						{type=25,value=1596},
						{type=27,value=2616},
					},
					-- 38 级
					{
						{type=5,value=63300},
			    		{type=7,value=6336},
						{type=9,value=2997},
						{type=11,value=6476},
						{type=21,value=1612},
						{type=23,value=2640},
						{type=25,value=1612},
						{type=27,value=2640},
					},
					-- 39 级
					{
						{type=5,value=64200},
			    		{type=7,value=6424},
						{type=9,value=3022},
						{type=11,value=6534},
						{type=21,value=1628},
						{type=23,value=2664},
						{type=25,value=1628},
						{type=27,value=2664},
					},
					-- 40 级
					{
						{type=5,value=65100},
			    		{type=7,value=6512},
						{type=9,value=3047},
						{type=11,value=6592},
						{type=21,value=1644},
						{type=23,value=2688},
						{type=25,value=1644},
						{type=27,value=2688},
					},
					-- 41 级
					{
						{type=5,value=66000},
			    		{type=7,value=6600},
						{type=9,value=3072},
						{type=11,value=6650},
						{type=21,value=1660},
						{type=23,value=2712},
						{type=25,value=1660},
						{type=27,value=2712},
					},
					-- 42 级
					{
						{type=5,value=66900},
			    		{type=7,value=6688},
						{type=9,value=3097},
						{type=11,value=6708},
						{type=21,value=1676},
						{type=23,value=2736},
						{type=25,value=1676},
						{type=27,value=2736},
					},
					-- 43 级
					{
						{type=5,value=67800},
			    		{type=7,value=6776},
						{type=9,value=3122},
						{type=11,value=6766},
						{type=21,value=1692},
						{type=23,value=2760},
						{type=25,value=1692},
						{type=27,value=2760},
					},


					
				},
			},
			-- 法
			{
				itemId = 6273,
				
				inShowIds = {203,204,205,206}, -- 每阶一个内观
				outShowIds = {203,204,205,206}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 5951, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,8,8,8,8,8,8,8,8,8,8,4,20,20,20,20,20,20,20,20,20,20,8,40,40,40,40,40,40,40,40,40,40,16,80,80,80,80,80,80,80,80,80,80,
				28,120,120,120,120,120,120,120,120,120,120,42,160,160,160,160,160,160,160,160,160,160,58,200,200,200,200,200,200,200,200,200,200,76,240,240
				,240,240,240,240,240,240,240,240,96,280,280,280,280,280,280,280,280,280,280,},
				
				attrs = {
											-- 0 级
					{
						{type=5,value=1157},
			    		{type=7,value=4628},
						{type=13,value=150},
						{type=15,value=315},
						{type=21,value=76},
						{type=23,value=126},
						{type=25,value=76},
						{type=27,value=126},
					},
					-- 1 级
					{
						{type=5,value=1215},
			    		{type=7,value=4858},
						{type=13,value=155},
						{type=15,value=331},
						{type=21,value=80},
						{type=23,value=132},
						{type=25,value=80},
						{type=27,value=132},
					},
					-- 2 级
					{
						{type=5,value=1273},
			    		{type=7,value=5088},
						{type=13,value=160},
						{type=15,value=347},
						{type=21,value=84},
						{type=23,value=138},
						{type=25,value=84},
						{type=27,value=138},
					},
					-- 3 级
					{
						{type=5,value=1331},
			    		{type=7,value=5318},
						{type=13,value=165},
						{type=15,value=363},
						{type=21,value=88},
						{type=23,value=144},
						{type=25,value=88},
						{type=27,value=144},
					},
					-- 4 级
					{
						{type=5,value=1389},
			    		{type=7,value=5548},
						{type=13,value=170},
						{type=15,value=379},
						{type=21,value=92},
						{type=23,value=150},
						{type=25,value=92},
						{type=27,value=150},
					},
					-- 5 级
					{
						{type=5,value=1447},
			    		{type=7,value=5778},
						{type=13,value=175},
						{type=15,value=395},
						{type=21,value=96},
						{type=23,value=156},
						{type=25,value=96},
						{type=27,value=156},
					},
					-- 6 级
					{
						{type=5,value=1505},
			    		{type=7,value=6008},
						{type=13,value=180},
						{type=15,value=411},
						{type=21,value=100},
						{type=23,value=162},
						{type=25,value=100},
						{type=27,value=162},
					},
					-- 7 级
					{
						{type=5,value=1563},
			    		{type=7,value=6238},
						{type=13,value=185},
						{type=15,value=427},
						{type=21,value=104},
						{type=23,value=168},
						{type=25,value=104},
						{type=27,value=168},
					},
					-- 8 级
					{
						{type=5,value=1621},
			    		{type=7,value=6468},
						{type=13,value=190},
						{type=15,value=443},
						{type=21,value=108},
						{type=23,value=174},
						{type=25,value=108},
						{type=27,value=174},
					},
					-- 9 级
					{
						{type=5,value=1679},
			    		{type=7,value=6698},
						{type=13,value=195},
						{type=15,value=459},
						{type=21,value=112},
						{type=23,value=180},
						{type=25,value=112},
						{type=27,value=180},
					},
					-- 10 级
					{
						{type=5,value=1737},
			    		{type=7,value=6928},
						{type=13,value=200},
						{type=15,value=475},
						{type=21,value=116},
						{type=23,value=186},
						{type=25,value=116},
						{type=27,value=186},
					},
					-- 11 级
					{
						{type=5,value=3794},
			    		{type=7,value=15156},
						{type=13,value=590},
						{type=15,value=1293},
						{type=21,value=312},
						{type=23,value=514},
						{type=25,value=312},
						{type=27,value=514},
					},
					-- 12 级
					{
						{type=5,value=3910},
			    		{type=7,value=15616},
						{type=13,value=600},
						{type=15,value=1318},
						{type=21,value=320},
						{type=23,value=526},
						{type=25,value=320},
						{type=27,value=526},
					},
					-- 13 级
					{
						{type=5,value=4026},
			    		{type=7,value=16076},
						{type=13,value=610},
						{type=15,value=1343},
						{type=21,value=328},
						{type=23,value=538},
						{type=25,value=328},
						{type=27,value=538},
					},
					-- 14 级
					{
						{type=5,value=4142},
			    		{type=7,value=16536},
						{type=13,value=620},
						{type=15,value=1368},
						{type=21,value=336},
						{type=23,value=550},
						{type=25,value=336},
						{type=27,value=550},
					},
					-- 15 级
					{
						{type=5,value=4258},
			    		{type=7,value=16996},
						{type=13,value=630},
						{type=15,value=1393},
						{type=21,value=344},
						{type=23,value=562},
						{type=25,value=344},
						{type=27,value=562},
					},
					-- 16 级
					{
						{type=5,value=4374},
			    		{type=7,value=17456},
						{type=13,value=640},
						{type=15,value=1418},
						{type=21,value=352},
						{type=23,value=574},
						{type=25,value=352},
						{type=27,value=574},
					},
					-- 17 级
					{
						{type=5,value=4490},
			    		{type=7,value=17916},
						{type=13,value=650},
						{type=15,value=1443},
						{type=21,value=360},
						{type=23,value=586},
						{type=25,value=360},
						{type=27,value=586},
					},
					-- 18 级
					{
						{type=5,value=4606},
			    		{type=7,value=18376},
						{type=13,value=660},
						{type=15,value=1468},
						{type=21,value=368},
						{type=23,value=598},
						{type=25,value=368},
						{type=27,value=598},
					},
					-- 19 级
					{
						{type=5,value=4722},
			    		{type=7,value=18836},
						{type=13,value=670},
						{type=15,value=1493},
						{type=21,value=376},
						{type=23,value=610},
						{type=25,value=376},
						{type=27,value=610},
					},
					-- 20 级
					{
						{type=5,value=4838},
			    		{type=7,value=19296},
						{type=13,value=680},
						{type=15,value=1518},
						{type=21,value=384},
						{type=23,value=622},
						{type=25,value=384},
						{type=27,value=622},
					},
					-- 21 级
					{
						{type=5,value=4954},
			    		{type=7,value=19756},
						{type=13,value=690},
						{type=15,value=1543},
						{type=21,value=392},
						{type=23,value=634},
						{type=25,value=392},
						{type=27,value=634},
					},
					-- 22 级
					{
						{type=5,value=8245},
			    		{type=7,value=32920},
						{type=13,value=1426},
						{type=15,value=3088},
						{type=21,value=762},
						{type=23,value=1252},
						{type=25,value=762},
						{type=27,value=1252},
					},
					-- 23 级
					{
						{type=5,value=8419},
			    		{type=7,value=33610},
						{type=13,value=1441},
						{type=15,value=3126},
						{type=21,value=774},
						{type=23,value=1270},
						{type=25,value=774},
						{type=27,value=1270},
					},
					-- 24 级
					{
						{type=5,value=8593},
			    		{type=7,value=34300},
						{type=13,value=1456},
						{type=15,value=3164},
						{type=21,value=786},
						{type=23,value=1288},
						{type=25,value=786},
						{type=27,value=1288},
					},
					-- 25 级
					{
						{type=5,value=8767},
			    		{type=7,value=34990},
						{type=13,value=1471},
						{type=15,value=3202},
						{type=21,value=798},
						{type=23,value=1306},
						{type=25,value=798},
						{type=27,value=1306},
					},
					-- 26 级
					{
						{type=5,value=8941},
			    		{type=7,value=35680},
						{type=13,value=1486},
						{type=15,value=3240},
						{type=21,value=810},
						{type=23,value=1324},
						{type=25,value=810},
						{type=27,value=1324},
					},
					-- 27 级
					{
						{type=5,value=9115},
			    		{type=7,value=36370},
						{type=13,value=1501},
						{type=15,value=3278},
						{type=21,value=822},
						{type=23,value=1342},
						{type=25,value=822},
						{type=27,value=1342},
					},
					-- 28 级
					{
						{type=5,value=9289},
			    		{type=7,value=37060},
						{type=13,value=1516},
						{type=15,value=3316},
						{type=21,value=834},
						{type=23,value=1360},
						{type=25,value=834},
						{type=27,value=1360},
					},
					-- 29 级
					{
						{type=5,value=9463},
			    		{type=7,value=37750},
						{type=13,value=1531},
						{type=15,value=3354},
						{type=21,value=846},
						{type=23,value=1378},
						{type=25,value=846},
						{type=27,value=1378},
					},
					-- 30 级
					{
						{type=5,value=9637},
			    		{type=7,value=38440},
						{type=13,value=1546},
						{type=15,value=3392},
						{type=21,value=858},
						{type=23,value=1396},
						{type=25,value=858},
						{type=27,value=1396},
					},
					-- 31 级
					{
						{type=5,value=9811},
			    		{type=7,value=39130},
						{type=13,value=1561},
						{type=15,value=3430},
						{type=21,value=870},
						{type=23,value=1414},
						{type=25,value=870},
						{type=27,value=1414},
					},
					-- 32 级
					{
						{type=5,value=9985},
			    		{type=7,value=39820},
						{type=13,value=1576},
						{type=15,value=3468},
						{type=21,value=882},
						{type=23,value=1432},
						{type=25,value=882},
						{type=27,value=1432},
					},
					-- 33 级
					{
						{type=5,value=15127},
			    		{type=7,value=60388},
						{type=13,value=2872},
						{type=15,value=6186},
						{type=21,value=1532},
						{type=23,value=2520},
						{type=25,value=1532},
						{type=27,value=2520},
					},
					-- 34 级
					{
						{type=5,value=15359},
			    		{type=7,value=61308},
						{type=13,value=2897},
						{type=15,value=6244},
						{type=21,value=1548},
						{type=23,value=2544},
						{type=25,value=1548},
						{type=27,value=2544},
					},
					-- 35 级
					{
						{type=5,value=15591},
			    		{type=7,value=62228},
						{type=13,value=2922},
						{type=15,value=6302},
						{type=21,value=1564},
						{type=23,value=2568},
						{type=25,value=1564},
						{type=27,value=2568},
					},
					-- 36 级
					{
						{type=5,value=15823},
			    		{type=7,value=63148},
						{type=13,value=2947},
						{type=15,value=6360},
						{type=21,value=1580},
						{type=23,value=2592},
						{type=25,value=1580},
						{type=27,value=2592},
					},
					-- 37 级
					{
						{type=5,value=16055},
			    		{type=7,value=64068},
						{type=13,value=2972},
						{type=15,value=6418},
						{type=21,value=1596},
						{type=23,value=2616},
						{type=25,value=1596},
						{type=27,value=2616},
					},
					-- 38 级
					{
						{type=5,value=16287},
			    		{type=7,value=64988},
						{type=13,value=2997},
						{type=15,value=6476},
						{type=21,value=1612},
						{type=23,value=2640},
						{type=25,value=1612},
						{type=27,value=2640},
					},
					-- 39 级
					{
						{type=5,value=16519},
			    		{type=7,value=65908},
						{type=13,value=3022},
						{type=15,value=6534},
						{type=21,value=1628},
						{type=23,value=2664},
						{type=25,value=1628},
						{type=27,value=2664},
					},
					-- 40 级
					{
						{type=5,value=16751},
			    		{type=7,value=66828},
						{type=13,value=3047},
						{type=15,value=6592},
						{type=21,value=1644},
						{type=23,value=2688},
						{type=25,value=1644},
						{type=27,value=2688},
					},
					-- 41 级
					{
						{type=5,value=16983},
			    		{type=7,value=67748},
						{type=13,value=3072},
						{type=15,value=6650},
						{type=21,value=1660},
						{type=23,value=2712},
						{type=25,value=1660},
						{type=27,value=2712},
					},
					-- 42 级
					{
						{type=5,value=17215},
			    		{type=7,value=68668},
						{type=13,value=3097},
						{type=15,value=6708},
						{type=21,value=1676},
						{type=23,value=2736},
						{type=25,value=1676},
						{type=27,value=2736},
					},
					-- 43 级
					{
						{type=5,value=17447},
			    		{type=7,value=69588},
						{type=13,value=3122},
						{type=15,value=6766},
						{type=21,value=1692},
						{type=23,value=2760},
						{type=25,value=1692},
						{type=27,value=2760},
					},

					
				},
			},
			-- 道
			{
				itemId = 6273,
				
				inShowIds = {203,204,205,206}, -- 每阶一个内观
				outShowIds = {203,204,205,206}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 5951, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,8,8,8,8,8,8,8,8,8,8,4,20,20,20,20,20,20,20,20,20,20,8,40,40,40,40,40,40,40,40,40,40,16,80,80,80,80,80,80,80,80,80,80,},
				
				attrs = {
										-- 0 级
					{
						{type=5,value=2514},
			    		{type=7,value=2514},
						{type=17,value=150},
						{type=19,value=315},
						{type=21,value=76},
						{type=23,value=126},
						{type=25,value=76},
						{type=27,value=126},
					},
					-- 1 级
					{
						{type=5,value=2640},
			    		{type=7,value=2640},
						{type=17,value=155},
						{type=19,value=331},
						{type=21,value=80},
						{type=23,value=132},
						{type=25,value=80},
						{type=27,value=132},
					},
					-- 2 级
					{
						{type=5,value=2766},
			    		{type=7,value=2766},
						{type=17,value=160},
						{type=19,value=347},
						{type=21,value=84},
						{type=23,value=138},
						{type=25,value=84},
						{type=27,value=138},
					},
					-- 3 级
					{
						{type=5,value=2892},
			    		{type=7,value=2892},
						{type=17,value=165},
						{type=19,value=363},
						{type=21,value=88},
						{type=23,value=144},
						{type=25,value=88},
						{type=27,value=144},
					},
					-- 4 级
					{
						{type=5,value=3018},
			    		{type=7,value=3018},
						{type=17,value=170},
						{type=19,value=379},
						{type=21,value=92},
						{type=23,value=150},
						{type=25,value=92},
						{type=27,value=150},
					},
					-- 5 级
					{
						{type=5,value=3144},
			    		{type=7,value=3144},
						{type=17,value=175},
						{type=19,value=395},
						{type=21,value=96},
						{type=23,value=156},
						{type=25,value=96},
						{type=27,value=156},
					},
					-- 6 级
					{
						{type=5,value=3270},
			    		{type=7,value=3270},
						{type=17,value=180},
						{type=19,value=411},
						{type=21,value=100},
						{type=23,value=162},
						{type=25,value=100},
						{type=27,value=162},
					},
					-- 7 级
					{
						{type=5,value=3396},
			    		{type=7,value=3396},
						{type=17,value=185},
						{type=19,value=427},
						{type=21,value=104},
						{type=23,value=168},
						{type=25,value=104},
						{type=27,value=168},
					},
					-- 8 级
					{
						{type=5,value=3522},
			    		{type=7,value=3522},
						{type=17,value=190},
						{type=19,value=443},
						{type=21,value=108},
						{type=23,value=174},
						{type=25,value=108},
						{type=27,value=174},
					},
					-- 9 级
					{
						{type=5,value=3648},
			    		{type=7,value=3648},
						{type=17,value=195},
						{type=19,value=459},
						{type=21,value=112},
						{type=23,value=180},
						{type=25,value=112},
						{type=27,value=180},
					},
					-- 10 级
					{
						{type=5,value=3774},
			    		{type=7,value=3774},
						{type=17,value=200},
						{type=19,value=475},
						{type=21,value=116},
						{type=23,value=186},
						{type=25,value=116},
						{type=27,value=186},
					},
					-- 11 级
					{
						{type=5,value=8244},
			    		{type=7,value=8244},
						{type=17,value=590},
						{type=19,value=1293},
						{type=21,value=312},
						{type=23,value=514},
						{type=25,value=312},
						{type=27,value=514},
					},
					-- 12 级
					{
						{type=5,value=8496},
			    		{type=7,value=8496},
						{type=17,value=600},
						{type=19,value=1318},
						{type=21,value=320},
						{type=23,value=526},
						{type=25,value=320},
						{type=27,value=526},
					},
					-- 13 级
					{
						{type=5,value=8748},
			    		{type=7,value=8748},
						{type=17,value=610},
						{type=19,value=1343},
						{type=21,value=328},
						{type=23,value=538},
						{type=25,value=328},
						{type=27,value=538},
					},
					-- 14 级
					{
						{type=5,value=9000},
			    		{type=7,value=9000},
						{type=17,value=620},
						{type=19,value=1368},
						{type=21,value=336},
						{type=23,value=550},
						{type=25,value=336},
						{type=27,value=550},
					},
					-- 15 级
					{
						{type=5,value=9252},
			    		{type=7,value=9252},
						{type=17,value=630},
						{type=19,value=1393},
						{type=21,value=344},
						{type=23,value=562},
						{type=25,value=344},
						{type=27,value=562},
					},
					-- 16 级
					{
						{type=5,value=9504},
			    		{type=7,value=9504},
						{type=17,value=640},
						{type=19,value=1418},
						{type=21,value=352},
						{type=23,value=574},
						{type=25,value=352},
						{type=27,value=574},
					},
					-- 17 级
					{
						{type=5,value=9756},
			    		{type=7,value=9756},
						{type=17,value=650},
						{type=19,value=1443},
						{type=21,value=360},
						{type=23,value=586},
						{type=25,value=360},
						{type=27,value=586},
					},
					-- 18 级
					{
						{type=5,value=10008},
			    		{type=7,value=10008},
						{type=17,value=660},
						{type=19,value=1468},
						{type=21,value=368},
						{type=23,value=598},
						{type=25,value=368},
						{type=27,value=598},
					},
					-- 19 级
					{
						{type=5,value=10260},
			    		{type=7,value=10260},
						{type=17,value=670},
						{type=19,value=1493},
						{type=21,value=376},
						{type=23,value=610},
						{type=25,value=376},
						{type=27,value=610},
					},
					-- 20 级
					{
						{type=5,value=10512},
			    		{type=7,value=10512},
						{type=17,value=680},
						{type=19,value=1518},
						{type=21,value=384},
						{type=23,value=622},
						{type=25,value=384},
						{type=27,value=622},
					},
					-- 21 级
					{
						{type=5,value=10764},
			    		{type=7,value=10764},
						{type=17,value=690},
						{type=19,value=1543},
						{type=21,value=392},
						{type=23,value=634},
						{type=25,value=392},
						{type=27,value=634},
					},
					-- 22 级
					{
						{type=5,value=17915},
			    		{type=7,value=17915},
						{type=17,value=1426},
						{type=19,value=3088},
						{type=21,value=762},
						{type=23,value=1252},
						{type=25,value=762},
						{type=27,value=1252},
					},
					-- 23 级
					{
						{type=5,value=18293},
			    		{type=7,value=18293},
						{type=17,value=1441},
						{type=19,value=3126},
						{type=21,value=774},
						{type=23,value=1270},
						{type=25,value=774},
						{type=27,value=1270},
					},
					-- 24 级
					{
						{type=5,value=18671},
			    		{type=7,value=18671},
						{type=17,value=1456},
						{type=19,value=3164},
						{type=21,value=786},
						{type=23,value=1288},
						{type=25,value=786},
						{type=27,value=1288},
					},
					-- 25 级
					{
						{type=5,value=19049},
			    		{type=7,value=19049},
						{type=17,value=1471},
						{type=19,value=3202},
						{type=21,value=798},
						{type=23,value=1306},
						{type=25,value=798},
						{type=27,value=1306},
					},
					-- 26 级
					{
						{type=5,value=19427},
			    		{type=7,value=19427},
						{type=17,value=1486},
						{type=19,value=3240},
						{type=21,value=810},
						{type=23,value=1324},
						{type=25,value=810},
						{type=27,value=1324},
					},
					-- 27 级
					{
						{type=5,value=19805},
			    		{type=7,value=19805},
						{type=17,value=1501},
						{type=19,value=3278},
						{type=21,value=822},
						{type=23,value=1342},
						{type=25,value=822},
						{type=27,value=1342},
					},
					-- 28 级
					{
						{type=5,value=20183},
			    		{type=7,value=20183},
						{type=17,value=1516},
						{type=19,value=3316},
						{type=21,value=834},
						{type=23,value=1360},
						{type=25,value=834},
						{type=27,value=1360},
					},
					-- 29 级
					{
						{type=5,value=20561},
			    		{type=7,value=20561},
						{type=17,value=1531},
						{type=19,value=3354},
						{type=21,value=846},
						{type=23,value=1378},
						{type=25,value=846},
						{type=27,value=1378},
					},
					-- 30 级
					{
						{type=5,value=20939},
			    		{type=7,value=20939},
						{type=17,value=1546},
						{type=19,value=3392},
						{type=21,value=858},
						{type=23,value=1396},
						{type=25,value=858},
						{type=27,value=1396},
					},
					-- 31 级
					{
						{type=5,value=21317},
			    		{type=7,value=21317},
						{type=17,value=1561},
						{type=19,value=3430},
						{type=21,value=870},
						{type=23,value=1414},
						{type=25,value=870},
						{type=27,value=1414},
					},
					-- 32 级
					{
						{type=5,value=21695},
			    		{type=7,value=21695},
						{type=17,value=1576},
						{type=19,value=3468},
						{type=21,value=882},
						{type=23,value=1432},
						{type=25,value=882},
						{type=27,value=1432},
					},
					-- 33 级
					{
						{type=5,value=32869},
			    		{type=7,value=32869},
						{type=17,value=2872},
						{type=19,value=6186},
						{type=21,value=1532},
						{type=23,value=2520},
						{type=25,value=1532},
						{type=27,value=2520},
					},
					-- 34 级
					{
						{type=5,value=33373},
			    		{type=7,value=33373},
						{type=17,value=2897},
						{type=19,value=6244},
						{type=21,value=1548},
						{type=23,value=2544},
						{type=25,value=1548},
						{type=27,value=2544},
					},
					-- 35 级
					{
						{type=5,value=33877},
			    		{type=7,value=33877},
						{type=17,value=2922},
						{type=19,value=6302},
						{type=21,value=1564},
						{type=23,value=2568},
						{type=25,value=1564},
						{type=27,value=2568},
					},
					-- 36 级
					{
						{type=5,value=34381},
			    		{type=7,value=34381},
						{type=17,value=2947},
						{type=19,value=6360},
						{type=21,value=1580},
						{type=23,value=2592},
						{type=25,value=1580},
						{type=27,value=2592},
					},
					-- 37 级
					{
						{type=5,value=34885},
			    		{type=7,value=34885},
						{type=17,value=2972},
						{type=19,value=6418},
						{type=21,value=1596},
						{type=23,value=2616},
						{type=25,value=1596},
						{type=27,value=2616},
					},
					-- 38 级
					{
						{type=5,value=35389},
			    		{type=7,value=35389},
						{type=17,value=2997},
						{type=19,value=6476},
						{type=21,value=1612},
						{type=23,value=2640},
						{type=25,value=1612},
						{type=27,value=2640},
					},
					-- 39 级
					{
						{type=5,value=35893},
			    		{type=7,value=35893},
						{type=17,value=3022},
						{type=19,value=6534},
						{type=21,value=1628},
						{type=23,value=2664},
						{type=25,value=1628},
						{type=27,value=2664},
					},
					-- 40 级
					{
						{type=5,value=36397},
			    		{type=7,value=36397},
						{type=17,value=3047},
						{type=19,value=6592},
						{type=21,value=1644},
						{type=23,value=2688},
						{type=25,value=1644},
						{type=27,value=2688},
					},
					-- 41 级
					{
						{type=5,value=36901},
			    		{type=7,value=36901},
						{type=17,value=3072},
						{type=19,value=6650},
						{type=21,value=1660},
						{type=23,value=2712},
						{type=25,value=1660},
						{type=27,value=2712},
					},
					-- 42 级
					{
						{type=5,value=37405},
			    		{type=7,value=37405},
						{type=17,value=3097},
						{type=19,value=6708},
						{type=21,value=1676},
						{type=23,value=2736},
						{type=25,value=1676},
						{type=27,value=2736},
					},
					-- 43 级
					{
						{type=5,value=37909},
			    		{type=7,value=37909},
						{type=17,value=3122},
						{type=19,value=6766},
						{type=21,value=1692},
						{type=23,value=2760},
						{type=25,value=1692},
						{type=27,value=2760},
					},


					
				},
			},
		},
		-----------------------------三国时装  貂蝉
				{
			-- 战
			{
				itemId = 6274, --升阶所需道具
				
				inShowIds = {211,212,213,214}, -- 每阶一个内观
				outShowIds = {211,212,213,214}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 5951, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,8,8,8,8,8,8,8,8,8,8,4,20,20,20,20,20,20,20,20,20,20,8,40,40,40,40,40,40,40,40,40,40,16,80,80,80,80,80,80,80,80,80,80,},
				
					-- --模块
					-- -- (a1) 级
					-- {
					-- 	{type=(a2),value=(a3)},
			    	-- 	{type=(a4),value=(a5)},
					-- 	{type=(a6),value=(a7)},
					-- 	{type=(a8),value=(a9)},
					-- 	{type=(a10),value=(a11)},
					-- 	{type=(a12),value=(a13)},
					-- 	{type=(a14),value=(a15)},
					-- 	{type=(a16),value=(a17)},
					-- },


				attrs = {
										-- 0 级
					{
						{type=5,value=4500},
			    		{type=7,value=455},
						{type=9,value=150},
						{type=11,value=315},
						{type=21,value=76},
						{type=23,value=126},
						{type=25,value=76},
						{type=27,value=126},
					},
					-- 1 级
					{
						{type=5,value=4725},
			    		{type=7,value=477},
						{type=9,value=155},
						{type=11,value=331},
						{type=21,value=80},
						{type=23,value=132},
						{type=25,value=80},
						{type=27,value=132},
					},
					-- 2 级
					{
						{type=5,value=4950},
			    		{type=7,value=499},
						{type=9,value=160},
						{type=11,value=347},
						{type=21,value=84},
						{type=23,value=138},
						{type=25,value=84},
						{type=27,value=138},
					},
					-- 3 级
					{
						{type=5,value=5175},
			    		{type=7,value=521},
						{type=9,value=165},
						{type=11,value=363},
						{type=21,value=88},
						{type=23,value=144},
						{type=25,value=88},
						{type=27,value=144},
					},
					-- 4 级
					{
						{type=5,value=5400},
			    		{type=7,value=543},
						{type=9,value=170},
						{type=11,value=379},
						{type=21,value=92},
						{type=23,value=150},
						{type=25,value=92},
						{type=27,value=150},
					},
					-- 5 级
					{
						{type=5,value=5625},
			    		{type=7,value=565},
						{type=9,value=175},
						{type=11,value=395},
						{type=21,value=96},
						{type=23,value=156},
						{type=25,value=96},
						{type=27,value=156},
					},
					-- 6 级
					{
						{type=5,value=5850},
			    		{type=7,value=587},
						{type=9,value=180},
						{type=11,value=411},
						{type=21,value=100},
						{type=23,value=162},
						{type=25,value=100},
						{type=27,value=162},
					},
					-- 7 级
					{
						{type=5,value=6075},
			    		{type=7,value=609},
						{type=9,value=185},
						{type=11,value=427},
						{type=21,value=104},
						{type=23,value=168},
						{type=25,value=104},
						{type=27,value=168},
					},
					-- 8 级
					{
						{type=5,value=6300},
			    		{type=7,value=631},
						{type=9,value=190},
						{type=11,value=443},
						{type=21,value=108},
						{type=23,value=174},
						{type=25,value=108},
						{type=27,value=174},
					},
					-- 9 级
					{
						{type=5,value=6525},
			    		{type=7,value=653},
						{type=9,value=195},
						{type=11,value=459},
						{type=21,value=112},
						{type=23,value=180},
						{type=25,value=112},
						{type=27,value=180},
					},
					-- 10 级
					{
						{type=5,value=6750},
			    		{type=7,value=675},
						{type=9,value=200},
						{type=11,value=475},
						{type=21,value=116},
						{type=23,value=186},
						{type=25,value=116},
						{type=27,value=186},
					},
					-- 11 级
					{
						{type=5,value=14750},
			    		{type=7,value=1483},
						{type=9,value=590},
						{type=11,value=1293},
						{type=21,value=312},
						{type=23,value=514},
						{type=25,value=312},
						{type=27,value=514},
					},
					-- 12 级
					{
						{type=5,value=15200},
			    		{type=7,value=1527},
						{type=9,value=600},
						{type=11,value=1318},
						{type=21,value=320},
						{type=23,value=526},
						{type=25,value=320},
						{type=27,value=526},
					},
					-- 13 级
					{
						{type=5,value=15650},
			    		{type=7,value=1571},
						{type=9,value=610},
						{type=11,value=1343},
						{type=21,value=328},
						{type=23,value=538},
						{type=25,value=328},
						{type=27,value=538},
					},
					-- 14 级
					{
						{type=5,value=16100},
			    		{type=7,value=1615},
						{type=9,value=620},
						{type=11,value=1368},
						{type=21,value=336},
						{type=23,value=550},
						{type=25,value=336},
						{type=27,value=550},
					},
					-- 15 级
					{
						{type=5,value=16550},
			    		{type=7,value=1659},
						{type=9,value=630},
						{type=11,value=1393},
						{type=21,value=344},
						{type=23,value=562},
						{type=25,value=344},
						{type=27,value=562},
					},
					-- 16 级
					{
						{type=5,value=17000},
			    		{type=7,value=1703},
						{type=9,value=640},
						{type=11,value=1418},
						{type=21,value=352},
						{type=23,value=574},
						{type=25,value=352},
						{type=27,value=574},
					},
					-- 17 级
					{
						{type=5,value=17450},
			    		{type=7,value=1747},
						{type=9,value=650},
						{type=11,value=1443},
						{type=21,value=360},
						{type=23,value=586},
						{type=25,value=360},
						{type=27,value=586},
					},
					-- 18 级
					{
						{type=5,value=17900},
			    		{type=7,value=1791},
						{type=9,value=660},
						{type=11,value=1468},
						{type=21,value=368},
						{type=23,value=598},
						{type=25,value=368},
						{type=27,value=598},
					},
					-- 19 级
					{
						{type=5,value=18350},
			    		{type=7,value=1835},
						{type=9,value=670},
						{type=11,value=1493},
						{type=21,value=376},
						{type=23,value=610},
						{type=25,value=376},
						{type=27,value=610},
					},
					-- 20 级
					{
						{type=5,value=18800},
			    		{type=7,value=1879},
						{type=9,value=680},
						{type=11,value=1518},
						{type=21,value=384},
						{type=23,value=622},
						{type=25,value=384},
						{type=27,value=622},
					},
					-- 21 级
					{
						{type=5,value=19250},
			    		{type=7,value=1923},
						{type=9,value=690},
						{type=11,value=1543},
						{type=21,value=392},
						{type=23,value=634},
						{type=25,value=392},
						{type=27,value=634},
					},
					-- 22 级
					{
						{type=5,value=32050},
			    		{type=7,value=3216},
						{type=9,value=1426},
						{type=11,value=3088},
						{type=21,value=762},
						{type=23,value=1252},
						{type=25,value=762},
						{type=27,value=1252},
					},
					-- 23 级
					{
						{type=5,value=32725},
			    		{type=7,value=3282},
						{type=9,value=1441},
						{type=11,value=3126},
						{type=21,value=774},
						{type=23,value=1270},
						{type=25,value=774},
						{type=27,value=1270},
					},
					-- 24 级
					{
						{type=5,value=33400},
			    		{type=7,value=3348},
						{type=9,value=1456},
						{type=11,value=3164},
						{type=21,value=786},
						{type=23,value=1288},
						{type=25,value=786},
						{type=27,value=1288},
					},
					-- 25 级
					{
						{type=5,value=34075},
			    		{type=7,value=3414},
						{type=9,value=1471},
						{type=11,value=3202},
						{type=21,value=798},
						{type=23,value=1306},
						{type=25,value=798},
						{type=27,value=1306},
					},
					-- 26 级
					{
						{type=5,value=34750},
			    		{type=7,value=3480},
						{type=9,value=1486},
						{type=11,value=3240},
						{type=21,value=810},
						{type=23,value=1324},
						{type=25,value=810},
						{type=27,value=1324},
					},
					-- 27 级
					{
						{type=5,value=35425},
			    		{type=7,value=3546},
						{type=9,value=1501},
						{type=11,value=3278},
						{type=21,value=822},
						{type=23,value=1342},
						{type=25,value=822},
						{type=27,value=1342},
					},
					-- 28 级
					{
						{type=5,value=36100},
			    		{type=7,value=3612},
						{type=9,value=1516},
						{type=11,value=3316},
						{type=21,value=834},
						{type=23,value=1360},
						{type=25,value=834},
						{type=27,value=1360},
					},
					-- 29 级
					{
						{type=5,value=36775},
			    		{type=7,value=3678},
						{type=9,value=1531},
						{type=11,value=3354},
						{type=21,value=846},
						{type=23,value=1378},
						{type=25,value=846},
						{type=27,value=1378},
					},
					-- 30 级
					{
						{type=5,value=37450},
			    		{type=7,value=3744},
						{type=9,value=1546},
						{type=11,value=3392},
						{type=21,value=858},
						{type=23,value=1396},
						{type=25,value=858},
						{type=27,value=1396},
					},
					-- 31 级
					{
						{type=5,value=38125},
			    		{type=7,value=3810},
						{type=9,value=1561},
						{type=11,value=3430},
						{type=21,value=870},
						{type=23,value=1414},
						{type=25,value=870},
						{type=27,value=1414},
					},
					-- 32 级
					{
						{type=5,value=38800},
			    		{type=7,value=3876},
						{type=9,value=1576},
						{type=11,value=3468},
						{type=21,value=882},
						{type=23,value=1432},
						{type=25,value=882},
						{type=27,value=1432},
					},
					-- 33 级
					{
						{type=5,value=58800},
			    		{type=7,value=5896},
						{type=9,value=2872},
						{type=11,value=6186},
						{type=21,value=1532},
						{type=23,value=2520},
						{type=25,value=1532},
						{type=27,value=2520},
					},
					-- 34 级
					{
						{type=5,value=59700},
			    		{type=7,value=5984},
						{type=9,value=2897},
						{type=11,value=6244},
						{type=21,value=1548},
						{type=23,value=2544},
						{type=25,value=1548},
						{type=27,value=2544},
					},
					-- 35 级
					{
						{type=5,value=60600},
			    		{type=7,value=6072},
						{type=9,value=2922},
						{type=11,value=6302},
						{type=21,value=1564},
						{type=23,value=2568},
						{type=25,value=1564},
						{type=27,value=2568},
					},
					-- 36 级
					{
						{type=5,value=61500},
			    		{type=7,value=6160},
						{type=9,value=2947},
						{type=11,value=6360},
						{type=21,value=1580},
						{type=23,value=2592},
						{type=25,value=1580},
						{type=27,value=2592},
					},
					-- 37 级
					{
						{type=5,value=62400},
			    		{type=7,value=6248},
						{type=9,value=2972},
						{type=11,value=6418},
						{type=21,value=1596},
						{type=23,value=2616},
						{type=25,value=1596},
						{type=27,value=2616},
					},
					-- 38 级
					{
						{type=5,value=63300},
			    		{type=7,value=6336},
						{type=9,value=2997},
						{type=11,value=6476},
						{type=21,value=1612},
						{type=23,value=2640},
						{type=25,value=1612},
						{type=27,value=2640},
					},
					-- 39 级
					{
						{type=5,value=64200},
			    		{type=7,value=6424},
						{type=9,value=3022},
						{type=11,value=6534},
						{type=21,value=1628},
						{type=23,value=2664},
						{type=25,value=1628},
						{type=27,value=2664},
					},
					-- 40 级
					{
						{type=5,value=65100},
			    		{type=7,value=6512},
						{type=9,value=3047},
						{type=11,value=6592},
						{type=21,value=1644},
						{type=23,value=2688},
						{type=25,value=1644},
						{type=27,value=2688},
					},
					-- 41 级
					{
						{type=5,value=66000},
			    		{type=7,value=6600},
						{type=9,value=3072},
						{type=11,value=6650},
						{type=21,value=1660},
						{type=23,value=2712},
						{type=25,value=1660},
						{type=27,value=2712},
					},
					-- 42 级
					{
						{type=5,value=66900},
			    		{type=7,value=6688},
						{type=9,value=3097},
						{type=11,value=6708},
						{type=21,value=1676},
						{type=23,value=2736},
						{type=25,value=1676},
						{type=27,value=2736},
					},
					-- 43 级
					{
						{type=5,value=67800},
			    		{type=7,value=6776},
						{type=9,value=3122},
						{type=11,value=6766},
						{type=21,value=1692},
						{type=23,value=2760},
						{type=25,value=1692},
						{type=27,value=2760},
					},


					
				},
			},
			-- 法
			{
				itemId = 6274,
				
				inShowIds = {211,212,213,214}, -- 每阶一个内观
				outShowIds = {211,212,213,214}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 5951, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,8,8,8,8,8,8,8,8,8,8,4,20,20,20,20,20,20,20,20,20,20,8,40,40,40,40,40,40,40,40,40,40,16,80,80,80,80,80,80,80,80,80,80,},
				
				attrs = {
											-- 0 级
					{
						{type=5,value=1157},
			    		{type=7,value=4628},
						{type=13,value=150},
						{type=15,value=315},
						{type=21,value=76},
						{type=23,value=126},
						{type=25,value=76},
						{type=27,value=126},
					},
					-- 1 级
					{
						{type=5,value=1215},
			    		{type=7,value=4858},
						{type=13,value=155},
						{type=15,value=331},
						{type=21,value=80},
						{type=23,value=132},
						{type=25,value=80},
						{type=27,value=132},
					},
					-- 2 级
					{
						{type=5,value=1273},
			    		{type=7,value=5088},
						{type=13,value=160},
						{type=15,value=347},
						{type=21,value=84},
						{type=23,value=138},
						{type=25,value=84},
						{type=27,value=138},
					},
					-- 3 级
					{
						{type=5,value=1331},
			    		{type=7,value=5318},
						{type=13,value=165},
						{type=15,value=363},
						{type=21,value=88},
						{type=23,value=144},
						{type=25,value=88},
						{type=27,value=144},
					},
					-- 4 级
					{
						{type=5,value=1389},
			    		{type=7,value=5548},
						{type=13,value=170},
						{type=15,value=379},
						{type=21,value=92},
						{type=23,value=150},
						{type=25,value=92},
						{type=27,value=150},
					},
					-- 5 级
					{
						{type=5,value=1447},
			    		{type=7,value=5778},
						{type=13,value=175},
						{type=15,value=395},
						{type=21,value=96},
						{type=23,value=156},
						{type=25,value=96},
						{type=27,value=156},
					},
					-- 6 级
					{
						{type=5,value=1505},
			    		{type=7,value=6008},
						{type=13,value=180},
						{type=15,value=411},
						{type=21,value=100},
						{type=23,value=162},
						{type=25,value=100},
						{type=27,value=162},
					},
					-- 7 级
					{
						{type=5,value=1563},
			    		{type=7,value=6238},
						{type=13,value=185},
						{type=15,value=427},
						{type=21,value=104},
						{type=23,value=168},
						{type=25,value=104},
						{type=27,value=168},
					},
					-- 8 级
					{
						{type=5,value=1621},
			    		{type=7,value=6468},
						{type=13,value=190},
						{type=15,value=443},
						{type=21,value=108},
						{type=23,value=174},
						{type=25,value=108},
						{type=27,value=174},
					},
					-- 9 级
					{
						{type=5,value=1679},
			    		{type=7,value=6698},
						{type=13,value=195},
						{type=15,value=459},
						{type=21,value=112},
						{type=23,value=180},
						{type=25,value=112},
						{type=27,value=180},
					},
					-- 10 级
					{
						{type=5,value=1737},
			    		{type=7,value=6928},
						{type=13,value=200},
						{type=15,value=475},
						{type=21,value=116},
						{type=23,value=186},
						{type=25,value=116},
						{type=27,value=186},
					},
					-- 11 级
					{
						{type=5,value=3794},
			    		{type=7,value=15156},
						{type=13,value=590},
						{type=15,value=1293},
						{type=21,value=312},
						{type=23,value=514},
						{type=25,value=312},
						{type=27,value=514},
					},
					-- 12 级
					{
						{type=5,value=3910},
			    		{type=7,value=15616},
						{type=13,value=600},
						{type=15,value=1318},
						{type=21,value=320},
						{type=23,value=526},
						{type=25,value=320},
						{type=27,value=526},
					},
					-- 13 级
					{
						{type=5,value=4026},
			    		{type=7,value=16076},
						{type=13,value=610},
						{type=15,value=1343},
						{type=21,value=328},
						{type=23,value=538},
						{type=25,value=328},
						{type=27,value=538},
					},
					-- 14 级
					{
						{type=5,value=4142},
			    		{type=7,value=16536},
						{type=13,value=620},
						{type=15,value=1368},
						{type=21,value=336},
						{type=23,value=550},
						{type=25,value=336},
						{type=27,value=550},
					},
					-- 15 级
					{
						{type=5,value=4258},
			    		{type=7,value=16996},
						{type=13,value=630},
						{type=15,value=1393},
						{type=21,value=344},
						{type=23,value=562},
						{type=25,value=344},
						{type=27,value=562},
					},
					-- 16 级
					{
						{type=5,value=4374},
			    		{type=7,value=17456},
						{type=13,value=640},
						{type=15,value=1418},
						{type=21,value=352},
						{type=23,value=574},
						{type=25,value=352},
						{type=27,value=574},
					},
					-- 17 级
					{
						{type=5,value=4490},
			    		{type=7,value=17916},
						{type=13,value=650},
						{type=15,value=1443},
						{type=21,value=360},
						{type=23,value=586},
						{type=25,value=360},
						{type=27,value=586},
					},
					-- 18 级
					{
						{type=5,value=4606},
			    		{type=7,value=18376},
						{type=13,value=660},
						{type=15,value=1468},
						{type=21,value=368},
						{type=23,value=598},
						{type=25,value=368},
						{type=27,value=598},
					},
					-- 19 级
					{
						{type=5,value=4722},
			    		{type=7,value=18836},
						{type=13,value=670},
						{type=15,value=1493},
						{type=21,value=376},
						{type=23,value=610},
						{type=25,value=376},
						{type=27,value=610},
					},
					-- 20 级
					{
						{type=5,value=4838},
			    		{type=7,value=19296},
						{type=13,value=680},
						{type=15,value=1518},
						{type=21,value=384},
						{type=23,value=622},
						{type=25,value=384},
						{type=27,value=622},
					},
					-- 21 级
					{
						{type=5,value=4954},
			    		{type=7,value=19756},
						{type=13,value=690},
						{type=15,value=1543},
						{type=21,value=392},
						{type=23,value=634},
						{type=25,value=392},
						{type=27,value=634},
					},
					-- 22 级
					{
						{type=5,value=8245},
			    		{type=7,value=32920},
						{type=13,value=1426},
						{type=15,value=3088},
						{type=21,value=762},
						{type=23,value=1252},
						{type=25,value=762},
						{type=27,value=1252},
					},
					-- 23 级
					{
						{type=5,value=8419},
			    		{type=7,value=33610},
						{type=13,value=1441},
						{type=15,value=3126},
						{type=21,value=774},
						{type=23,value=1270},
						{type=25,value=774},
						{type=27,value=1270},
					},
					-- 24 级
					{
						{type=5,value=8593},
			    		{type=7,value=34300},
						{type=13,value=1456},
						{type=15,value=3164},
						{type=21,value=786},
						{type=23,value=1288},
						{type=25,value=786},
						{type=27,value=1288},
					},
					-- 25 级
					{
						{type=5,value=8767},
			    		{type=7,value=34990},
						{type=13,value=1471},
						{type=15,value=3202},
						{type=21,value=798},
						{type=23,value=1306},
						{type=25,value=798},
						{type=27,value=1306},
					},
					-- 26 级
					{
						{type=5,value=8941},
			    		{type=7,value=35680},
						{type=13,value=1486},
						{type=15,value=3240},
						{type=21,value=810},
						{type=23,value=1324},
						{type=25,value=810},
						{type=27,value=1324},
					},
					-- 27 级
					{
						{type=5,value=9115},
			    		{type=7,value=36370},
						{type=13,value=1501},
						{type=15,value=3278},
						{type=21,value=822},
						{type=23,value=1342},
						{type=25,value=822},
						{type=27,value=1342},
					},
					-- 28 级
					{
						{type=5,value=9289},
			    		{type=7,value=37060},
						{type=13,value=1516},
						{type=15,value=3316},
						{type=21,value=834},
						{type=23,value=1360},
						{type=25,value=834},
						{type=27,value=1360},
					},
					-- 29 级
					{
						{type=5,value=9463},
			    		{type=7,value=37750},
						{type=13,value=1531},
						{type=15,value=3354},
						{type=21,value=846},
						{type=23,value=1378},
						{type=25,value=846},
						{type=27,value=1378},
					},
					-- 30 级
					{
						{type=5,value=9637},
			    		{type=7,value=38440},
						{type=13,value=1546},
						{type=15,value=3392},
						{type=21,value=858},
						{type=23,value=1396},
						{type=25,value=858},
						{type=27,value=1396},
					},
					-- 31 级
					{
						{type=5,value=9811},
			    		{type=7,value=39130},
						{type=13,value=1561},
						{type=15,value=3430},
						{type=21,value=870},
						{type=23,value=1414},
						{type=25,value=870},
						{type=27,value=1414},
					},
					-- 32 级
					{
						{type=5,value=9985},
			    		{type=7,value=39820},
						{type=13,value=1576},
						{type=15,value=3468},
						{type=21,value=882},
						{type=23,value=1432},
						{type=25,value=882},
						{type=27,value=1432},
					},
					-- 33 级
					{
						{type=5,value=15127},
			    		{type=7,value=60388},
						{type=13,value=2872},
						{type=15,value=6186},
						{type=21,value=1532},
						{type=23,value=2520},
						{type=25,value=1532},
						{type=27,value=2520},
					},
					-- 34 级
					{
						{type=5,value=15359},
			    		{type=7,value=61308},
						{type=13,value=2897},
						{type=15,value=6244},
						{type=21,value=1548},
						{type=23,value=2544},
						{type=25,value=1548},
						{type=27,value=2544},
					},
					-- 35 级
					{
						{type=5,value=15591},
			    		{type=7,value=62228},
						{type=13,value=2922},
						{type=15,value=6302},
						{type=21,value=1564},
						{type=23,value=2568},
						{type=25,value=1564},
						{type=27,value=2568},
					},
					-- 36 级
					{
						{type=5,value=15823},
			    		{type=7,value=63148},
						{type=13,value=2947},
						{type=15,value=6360},
						{type=21,value=1580},
						{type=23,value=2592},
						{type=25,value=1580},
						{type=27,value=2592},
					},
					-- 37 级
					{
						{type=5,value=16055},
			    		{type=7,value=64068},
						{type=13,value=2972},
						{type=15,value=6418},
						{type=21,value=1596},
						{type=23,value=2616},
						{type=25,value=1596},
						{type=27,value=2616},
					},
					-- 38 级
					{
						{type=5,value=16287},
			    		{type=7,value=64988},
						{type=13,value=2997},
						{type=15,value=6476},
						{type=21,value=1612},
						{type=23,value=2640},
						{type=25,value=1612},
						{type=27,value=2640},
					},
					-- 39 级
					{
						{type=5,value=16519},
			    		{type=7,value=65908},
						{type=13,value=3022},
						{type=15,value=6534},
						{type=21,value=1628},
						{type=23,value=2664},
						{type=25,value=1628},
						{type=27,value=2664},
					},
					-- 40 级
					{
						{type=5,value=16751},
			    		{type=7,value=66828},
						{type=13,value=3047},
						{type=15,value=6592},
						{type=21,value=1644},
						{type=23,value=2688},
						{type=25,value=1644},
						{type=27,value=2688},
					},
					-- 41 级
					{
						{type=5,value=16983},
			    		{type=7,value=67748},
						{type=13,value=3072},
						{type=15,value=6650},
						{type=21,value=1660},
						{type=23,value=2712},
						{type=25,value=1660},
						{type=27,value=2712},
					},
					-- 42 级
					{
						{type=5,value=17215},
			    		{type=7,value=68668},
						{type=13,value=3097},
						{type=15,value=6708},
						{type=21,value=1676},
						{type=23,value=2736},
						{type=25,value=1676},
						{type=27,value=2736},
					},
					-- 43 级
					{
						{type=5,value=17447},
			    		{type=7,value=69588},
						{type=13,value=3122},
						{type=15,value=6766},
						{type=21,value=1692},
						{type=23,value=2760},
						{type=25,value=1692},
						{type=27,value=2760},
					},


					
				},
			},
			-- 道
			{
				itemId = 6274,
				
				inShowIds = {211,212,213,214}, -- 每阶一个内观
				outShowIds = {211,212,213,214}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 5951, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,8,8,8,8,8,8,8,8,8,8,4,20,20,20,20,20,20,20,20,20,20,8,40,40,40,40,40,40,40,40,40,40,16,80,80,80,80,80,80,80,80,80,80,},
				
				attrs = {
										-- 0 级
					{
						{type=5,value=2514},
			    		{type=7,value=2514},
						{type=17,value=150},
						{type=19,value=315},
						{type=21,value=76},
						{type=23,value=126},
						{type=25,value=76},
						{type=27,value=126},
					},
					-- 1 级
					{
						{type=5,value=2640},
			    		{type=7,value=2640},
						{type=17,value=155},
						{type=19,value=331},
						{type=21,value=80},
						{type=23,value=132},
						{type=25,value=80},
						{type=27,value=132},
					},
					-- 2 级
					{
						{type=5,value=2766},
			    		{type=7,value=2766},
						{type=17,value=160},
						{type=19,value=347},
						{type=21,value=84},
						{type=23,value=138},
						{type=25,value=84},
						{type=27,value=138},
					},
					-- 3 级
					{
						{type=5,value=2892},
			    		{type=7,value=2892},
						{type=17,value=165},
						{type=19,value=363},
						{type=21,value=88},
						{type=23,value=144},
						{type=25,value=88},
						{type=27,value=144},
					},
					-- 4 级
					{
						{type=5,value=3018},
			    		{type=7,value=3018},
						{type=17,value=170},
						{type=19,value=379},
						{type=21,value=92},
						{type=23,value=150},
						{type=25,value=92},
						{type=27,value=150},
					},
					-- 5 级
					{
						{type=5,value=3144},
			    		{type=7,value=3144},
						{type=17,value=175},
						{type=19,value=395},
						{type=21,value=96},
						{type=23,value=156},
						{type=25,value=96},
						{type=27,value=156},
					},
					-- 6 级
					{
						{type=5,value=3270},
			    		{type=7,value=3270},
						{type=17,value=180},
						{type=19,value=411},
						{type=21,value=100},
						{type=23,value=162},
						{type=25,value=100},
						{type=27,value=162},
					},
					-- 7 级
					{
						{type=5,value=3396},
			    		{type=7,value=3396},
						{type=17,value=185},
						{type=19,value=427},
						{type=21,value=104},
						{type=23,value=168},
						{type=25,value=104},
						{type=27,value=168},
					},
					-- 8 级
					{
						{type=5,value=3522},
			    		{type=7,value=3522},
						{type=17,value=190},
						{type=19,value=443},
						{type=21,value=108},
						{type=23,value=174},
						{type=25,value=108},
						{type=27,value=174},
					},
					-- 9 级
					{
						{type=5,value=3648},
			    		{type=7,value=3648},
						{type=17,value=195},
						{type=19,value=459},
						{type=21,value=112},
						{type=23,value=180},
						{type=25,value=112},
						{type=27,value=180},
					},
					-- 10 级
					{
						{type=5,value=3774},
			    		{type=7,value=3774},
						{type=17,value=200},
						{type=19,value=475},
						{type=21,value=116},
						{type=23,value=186},
						{type=25,value=116},
						{type=27,value=186},
					},
					-- 11 级
					{
						{type=5,value=8244},
			    		{type=7,value=8244},
						{type=17,value=590},
						{type=19,value=1293},
						{type=21,value=312},
						{type=23,value=514},
						{type=25,value=312},
						{type=27,value=514},
					},
					-- 12 级
					{
						{type=5,value=8496},
			    		{type=7,value=8496},
						{type=17,value=600},
						{type=19,value=1318},
						{type=21,value=320},
						{type=23,value=526},
						{type=25,value=320},
						{type=27,value=526},
					},
					-- 13 级
					{
						{type=5,value=8748},
			    		{type=7,value=8748},
						{type=17,value=610},
						{type=19,value=1343},
						{type=21,value=328},
						{type=23,value=538},
						{type=25,value=328},
						{type=27,value=538},
					},
					-- 14 级
					{
						{type=5,value=9000},
			    		{type=7,value=9000},
						{type=17,value=620},
						{type=19,value=1368},
						{type=21,value=336},
						{type=23,value=550},
						{type=25,value=336},
						{type=27,value=550},
					},
					-- 15 级
					{
						{type=5,value=9252},
			    		{type=7,value=9252},
						{type=17,value=630},
						{type=19,value=1393},
						{type=21,value=344},
						{type=23,value=562},
						{type=25,value=344},
						{type=27,value=562},
					},
					-- 16 级
					{
						{type=5,value=9504},
			    		{type=7,value=9504},
						{type=17,value=640},
						{type=19,value=1418},
						{type=21,value=352},
						{type=23,value=574},
						{type=25,value=352},
						{type=27,value=574},
					},
					-- 17 级
					{
						{type=5,value=9756},
			    		{type=7,value=9756},
						{type=17,value=650},
						{type=19,value=1443},
						{type=21,value=360},
						{type=23,value=586},
						{type=25,value=360},
						{type=27,value=586},
					},
					-- 18 级
					{
						{type=5,value=10008},
			    		{type=7,value=10008},
						{type=17,value=660},
						{type=19,value=1468},
						{type=21,value=368},
						{type=23,value=598},
						{type=25,value=368},
						{type=27,value=598},
					},
					-- 19 级
					{
						{type=5,value=10260},
			    		{type=7,value=10260},
						{type=17,value=670},
						{type=19,value=1493},
						{type=21,value=376},
						{type=23,value=610},
						{type=25,value=376},
						{type=27,value=610},
					},
					-- 20 级
					{
						{type=5,value=10512},
			    		{type=7,value=10512},
						{type=17,value=680},
						{type=19,value=1518},
						{type=21,value=384},
						{type=23,value=622},
						{type=25,value=384},
						{type=27,value=622},
					},
					-- 21 级
					{
						{type=5,value=10764},
			    		{type=7,value=10764},
						{type=17,value=690},
						{type=19,value=1543},
						{type=21,value=392},
						{type=23,value=634},
						{type=25,value=392},
						{type=27,value=634},
					},
					-- 22 级
					{
						{type=5,value=17915},
			    		{type=7,value=17915},
						{type=17,value=1426},
						{type=19,value=3088},
						{type=21,value=762},
						{type=23,value=1252},
						{type=25,value=762},
						{type=27,value=1252},
					},
					-- 23 级
					{
						{type=5,value=18293},
			    		{type=7,value=18293},
						{type=17,value=1441},
						{type=19,value=3126},
						{type=21,value=774},
						{type=23,value=1270},
						{type=25,value=774},
						{type=27,value=1270},
					},
					-- 24 级
					{
						{type=5,value=18671},
			    		{type=7,value=18671},
						{type=17,value=1456},
						{type=19,value=3164},
						{type=21,value=786},
						{type=23,value=1288},
						{type=25,value=786},
						{type=27,value=1288},
					},
					-- 25 级
					{
						{type=5,value=19049},
			    		{type=7,value=19049},
						{type=17,value=1471},
						{type=19,value=3202},
						{type=21,value=798},
						{type=23,value=1306},
						{type=25,value=798},
						{type=27,value=1306},
					},
					-- 26 级
					{
						{type=5,value=19427},
			    		{type=7,value=19427},
						{type=17,value=1486},
						{type=19,value=3240},
						{type=21,value=810},
						{type=23,value=1324},
						{type=25,value=810},
						{type=27,value=1324},
					},
					-- 27 级
					{
						{type=5,value=19805},
			    		{type=7,value=19805},
						{type=17,value=1501},
						{type=19,value=3278},
						{type=21,value=822},
						{type=23,value=1342},
						{type=25,value=822},
						{type=27,value=1342},
					},
					-- 28 级
					{
						{type=5,value=20183},
			    		{type=7,value=20183},
						{type=17,value=1516},
						{type=19,value=3316},
						{type=21,value=834},
						{type=23,value=1360},
						{type=25,value=834},
						{type=27,value=1360},
					},
					-- 29 级
					{
						{type=5,value=20561},
			    		{type=7,value=20561},
						{type=17,value=1531},
						{type=19,value=3354},
						{type=21,value=846},
						{type=23,value=1378},
						{type=25,value=846},
						{type=27,value=1378},
					},
					-- 30 级
					{
						{type=5,value=20939},
			    		{type=7,value=20939},
						{type=17,value=1546},
						{type=19,value=3392},
						{type=21,value=858},
						{type=23,value=1396},
						{type=25,value=858},
						{type=27,value=1396},
					},
					-- 31 级
					{
						{type=5,value=21317},
			    		{type=7,value=21317},
						{type=17,value=1561},
						{type=19,value=3430},
						{type=21,value=870},
						{type=23,value=1414},
						{type=25,value=870},
						{type=27,value=1414},
					},
					-- 32 级
					{
						{type=5,value=21695},
			    		{type=7,value=21695},
						{type=17,value=1576},
						{type=19,value=3468},
						{type=21,value=882},
						{type=23,value=1432},
						{type=25,value=882},
						{type=27,value=1432},
					},
					-- 33 级
					{
						{type=5,value=32869},
			    		{type=7,value=32869},
						{type=17,value=2872},
						{type=19,value=6186},
						{type=21,value=1532},
						{type=23,value=2520},
						{type=25,value=1532},
						{type=27,value=2520},
					},
					-- 34 级
					{
						{type=5,value=33373},
			    		{type=7,value=33373},
						{type=17,value=2897},
						{type=19,value=6244},
						{type=21,value=1548},
						{type=23,value=2544},
						{type=25,value=1548},
						{type=27,value=2544},
					},
					-- 35 级
					{
						{type=5,value=33877},
			    		{type=7,value=33877},
						{type=17,value=2922},
						{type=19,value=6302},
						{type=21,value=1564},
						{type=23,value=2568},
						{type=25,value=1564},
						{type=27,value=2568},
					},
					-- 36 级
					{
						{type=5,value=34381},
			    		{type=7,value=34381},
						{type=17,value=2947},
						{type=19,value=6360},
						{type=21,value=1580},
						{type=23,value=2592},
						{type=25,value=1580},
						{type=27,value=2592},
					},
					-- 37 级
					{
						{type=5,value=34885},
			    		{type=7,value=34885},
						{type=17,value=2972},
						{type=19,value=6418},
						{type=21,value=1596},
						{type=23,value=2616},
						{type=25,value=1596},
						{type=27,value=2616},
					},
					-- 38 级
					{
						{type=5,value=35389},
			    		{type=7,value=35389},
						{type=17,value=2997},
						{type=19,value=6476},
						{type=21,value=1612},
						{type=23,value=2640},
						{type=25,value=1612},
						{type=27,value=2640},
					},
					-- 39 级
					{
						{type=5,value=35893},
			    		{type=7,value=35893},
						{type=17,value=3022},
						{type=19,value=6534},
						{type=21,value=1628},
						{type=23,value=2664},
						{type=25,value=1628},
						{type=27,value=2664},
					},
					-- 40 级
					{
						{type=5,value=36397},
			    		{type=7,value=36397},
						{type=17,value=3047},
						{type=19,value=6592},
						{type=21,value=1644},
						{type=23,value=2688},
						{type=25,value=1644},
						{type=27,value=2688},
					},
					-- 41 级
					{
						{type=5,value=36901},
			    		{type=7,value=36901},
						{type=17,value=3072},
						{type=19,value=6650},
						{type=21,value=1660},
						{type=23,value=2712},
						{type=25,value=1660},
						{type=27,value=2712},
					},
					-- 42 级
					{
						{type=5,value=37405},
			    		{type=7,value=37405},
						{type=17,value=3097},
						{type=19,value=6708},
						{type=21,value=1676},
						{type=23,value=2736},
						{type=25,value=1676},
						{type=27,value=2736},
					},
					-- 43 级
					{
						{type=5,value=37909},
			    		{type=7,value=37909},
						{type=17,value=3122},
						{type=19,value=6766},
						{type=21,value=1692},
						{type=23,value=2760},
						{type=25,value=1692},
						{type=27,value=2760},
					},

					
				},
			},
		},
		----------------------------- 三国时装  孙尚香
				{
			-- 战
			{
				itemId = 6275, --升阶所需道具
				
				inShowIds = {215,216,217,218}, -- 每阶一个内观
				outShowIds = {215,216,217,218}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 5951, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,8,8,8,8,8,8,8,8,8,8,4,20,20,20,20,20,20,20,20,20,20,8,40,40,40,40,40,40,40,40,40,40,16,80,80,80,80,80,80,80,80,80,80,},
				
					-- --模块
					-- -- (a1) 级
					-- {
					-- 	{type=(a2),value=(a3)},
			    	-- 	{type=(a4),value=(a5)},
					-- 	{type=(a6),value=(a7)},
					-- 	{type=(a8),value=(a9)},
					-- 	{type=(a10),value=(a11)},
					-- 	{type=(a12),value=(a13)},
					-- 	{type=(a14),value=(a15)},
					-- 	{type=(a16),value=(a17)},
					-- },


				attrs = {
									-- 0 级
					{
						{type=5,value=4500},
			    		{type=7,value=455},
						{type=9,value=150},
						{type=11,value=315},
						{type=21,value=76},
						{type=23,value=126},
						{type=25,value=76},
						{type=27,value=126},
					},
					-- 1 级
					{
						{type=5,value=4725},
			    		{type=7,value=477},
						{type=9,value=155},
						{type=11,value=331},
						{type=21,value=80},
						{type=23,value=132},
						{type=25,value=80},
						{type=27,value=132},
					},
					-- 2 级
					{
						{type=5,value=4950},
			    		{type=7,value=499},
						{type=9,value=160},
						{type=11,value=347},
						{type=21,value=84},
						{type=23,value=138},
						{type=25,value=84},
						{type=27,value=138},
					},
					-- 3 级
					{
						{type=5,value=5175},
			    		{type=7,value=521},
						{type=9,value=165},
						{type=11,value=363},
						{type=21,value=88},
						{type=23,value=144},
						{type=25,value=88},
						{type=27,value=144},
					},
					-- 4 级
					{
						{type=5,value=5400},
			    		{type=7,value=543},
						{type=9,value=170},
						{type=11,value=379},
						{type=21,value=92},
						{type=23,value=150},
						{type=25,value=92},
						{type=27,value=150},
					},
					-- 5 级
					{
						{type=5,value=5625},
			    		{type=7,value=565},
						{type=9,value=175},
						{type=11,value=395},
						{type=21,value=96},
						{type=23,value=156},
						{type=25,value=96},
						{type=27,value=156},
					},
					-- 6 级
					{
						{type=5,value=5850},
			    		{type=7,value=587},
						{type=9,value=180},
						{type=11,value=411},
						{type=21,value=100},
						{type=23,value=162},
						{type=25,value=100},
						{type=27,value=162},
					},
					-- 7 级
					{
						{type=5,value=6075},
			    		{type=7,value=609},
						{type=9,value=185},
						{type=11,value=427},
						{type=21,value=104},
						{type=23,value=168},
						{type=25,value=104},
						{type=27,value=168},
					},
					-- 8 级
					{
						{type=5,value=6300},
			    		{type=7,value=631},
						{type=9,value=190},
						{type=11,value=443},
						{type=21,value=108},
						{type=23,value=174},
						{type=25,value=108},
						{type=27,value=174},
					},
					-- 9 级
					{
						{type=5,value=6525},
			    		{type=7,value=653},
						{type=9,value=195},
						{type=11,value=459},
						{type=21,value=112},
						{type=23,value=180},
						{type=25,value=112},
						{type=27,value=180},
					},
					-- 10 级
					{
						{type=5,value=6750},
			    		{type=7,value=675},
						{type=9,value=200},
						{type=11,value=475},
						{type=21,value=116},
						{type=23,value=186},
						{type=25,value=116},
						{type=27,value=186},
					},
					-- 11 级
					{
						{type=5,value=14750},
			    		{type=7,value=1483},
						{type=9,value=590},
						{type=11,value=1293},
						{type=21,value=312},
						{type=23,value=514},
						{type=25,value=312},
						{type=27,value=514},
					},
					-- 12 级
					{
						{type=5,value=15200},
			    		{type=7,value=1527},
						{type=9,value=600},
						{type=11,value=1318},
						{type=21,value=320},
						{type=23,value=526},
						{type=25,value=320},
						{type=27,value=526},
					},
					-- 13 级
					{
						{type=5,value=15650},
			    		{type=7,value=1571},
						{type=9,value=610},
						{type=11,value=1343},
						{type=21,value=328},
						{type=23,value=538},
						{type=25,value=328},
						{type=27,value=538},
					},
					-- 14 级
					{
						{type=5,value=16100},
			    		{type=7,value=1615},
						{type=9,value=620},
						{type=11,value=1368},
						{type=21,value=336},
						{type=23,value=550},
						{type=25,value=336},
						{type=27,value=550},
					},
					-- 15 级
					{
						{type=5,value=16550},
			    		{type=7,value=1659},
						{type=9,value=630},
						{type=11,value=1393},
						{type=21,value=344},
						{type=23,value=562},
						{type=25,value=344},
						{type=27,value=562},
					},
					-- 16 级
					{
						{type=5,value=17000},
			    		{type=7,value=1703},
						{type=9,value=640},
						{type=11,value=1418},
						{type=21,value=352},
						{type=23,value=574},
						{type=25,value=352},
						{type=27,value=574},
					},
					-- 17 级
					{
						{type=5,value=17450},
			    		{type=7,value=1747},
						{type=9,value=650},
						{type=11,value=1443},
						{type=21,value=360},
						{type=23,value=586},
						{type=25,value=360},
						{type=27,value=586},
					},
					-- 18 级
					{
						{type=5,value=17900},
			    		{type=7,value=1791},
						{type=9,value=660},
						{type=11,value=1468},
						{type=21,value=368},
						{type=23,value=598},
						{type=25,value=368},
						{type=27,value=598},
					},
					-- 19 级
					{
						{type=5,value=18350},
			    		{type=7,value=1835},
						{type=9,value=670},
						{type=11,value=1493},
						{type=21,value=376},
						{type=23,value=610},
						{type=25,value=376},
						{type=27,value=610},
					},
					-- 20 级
					{
						{type=5,value=18800},
			    		{type=7,value=1879},
						{type=9,value=680},
						{type=11,value=1518},
						{type=21,value=384},
						{type=23,value=622},
						{type=25,value=384},
						{type=27,value=622},
					},
					-- 21 级
					{
						{type=5,value=19250},
			    		{type=7,value=1923},
						{type=9,value=690},
						{type=11,value=1543},
						{type=21,value=392},
						{type=23,value=634},
						{type=25,value=392},
						{type=27,value=634},
					},
					-- 22 级
					{
						{type=5,value=32050},
			    		{type=7,value=3216},
						{type=9,value=1426},
						{type=11,value=3088},
						{type=21,value=762},
						{type=23,value=1252},
						{type=25,value=762},
						{type=27,value=1252},
					},
					-- 23 级
					{
						{type=5,value=32725},
			    		{type=7,value=3282},
						{type=9,value=1441},
						{type=11,value=3126},
						{type=21,value=774},
						{type=23,value=1270},
						{type=25,value=774},
						{type=27,value=1270},
					},
					-- 24 级
					{
						{type=5,value=33400},
			    		{type=7,value=3348},
						{type=9,value=1456},
						{type=11,value=3164},
						{type=21,value=786},
						{type=23,value=1288},
						{type=25,value=786},
						{type=27,value=1288},
					},
					-- 25 级
					{
						{type=5,value=34075},
			    		{type=7,value=3414},
						{type=9,value=1471},
						{type=11,value=3202},
						{type=21,value=798},
						{type=23,value=1306},
						{type=25,value=798},
						{type=27,value=1306},
					},
					-- 26 级
					{
						{type=5,value=34750},
			    		{type=7,value=3480},
						{type=9,value=1486},
						{type=11,value=3240},
						{type=21,value=810},
						{type=23,value=1324},
						{type=25,value=810},
						{type=27,value=1324},
					},
					-- 27 级
					{
						{type=5,value=35425},
			    		{type=7,value=3546},
						{type=9,value=1501},
						{type=11,value=3278},
						{type=21,value=822},
						{type=23,value=1342},
						{type=25,value=822},
						{type=27,value=1342},
					},
					-- 28 级
					{
						{type=5,value=36100},
			    		{type=7,value=3612},
						{type=9,value=1516},
						{type=11,value=3316},
						{type=21,value=834},
						{type=23,value=1360},
						{type=25,value=834},
						{type=27,value=1360},
					},
					-- 29 级
					{
						{type=5,value=36775},
			    		{type=7,value=3678},
						{type=9,value=1531},
						{type=11,value=3354},
						{type=21,value=846},
						{type=23,value=1378},
						{type=25,value=846},
						{type=27,value=1378},
					},
					-- 30 级
					{
						{type=5,value=37450},
			    		{type=7,value=3744},
						{type=9,value=1546},
						{type=11,value=3392},
						{type=21,value=858},
						{type=23,value=1396},
						{type=25,value=858},
						{type=27,value=1396},
					},
					-- 31 级
					{
						{type=5,value=38125},
			    		{type=7,value=3810},
						{type=9,value=1561},
						{type=11,value=3430},
						{type=21,value=870},
						{type=23,value=1414},
						{type=25,value=870},
						{type=27,value=1414},
					},
					-- 32 级
					{
						{type=5,value=38800},
			    		{type=7,value=3876},
						{type=9,value=1576},
						{type=11,value=3468},
						{type=21,value=882},
						{type=23,value=1432},
						{type=25,value=882},
						{type=27,value=1432},
					},
					-- 33 级
					{
						{type=5,value=58800},
			    		{type=7,value=5896},
						{type=9,value=2872},
						{type=11,value=6186},
						{type=21,value=1532},
						{type=23,value=2520},
						{type=25,value=1532},
						{type=27,value=2520},
					},
					-- 34 级
					{
						{type=5,value=59700},
			    		{type=7,value=5984},
						{type=9,value=2897},
						{type=11,value=6244},
						{type=21,value=1548},
						{type=23,value=2544},
						{type=25,value=1548},
						{type=27,value=2544},
					},
					-- 35 级
					{
						{type=5,value=60600},
			    		{type=7,value=6072},
						{type=9,value=2922},
						{type=11,value=6302},
						{type=21,value=1564},
						{type=23,value=2568},
						{type=25,value=1564},
						{type=27,value=2568},
					},
					-- 36 级
					{
						{type=5,value=61500},
			    		{type=7,value=6160},
						{type=9,value=2947},
						{type=11,value=6360},
						{type=21,value=1580},
						{type=23,value=2592},
						{type=25,value=1580},
						{type=27,value=2592},
					},
					-- 37 级
					{
						{type=5,value=62400},
			    		{type=7,value=6248},
						{type=9,value=2972},
						{type=11,value=6418},
						{type=21,value=1596},
						{type=23,value=2616},
						{type=25,value=1596},
						{type=27,value=2616},
					},
					-- 38 级
					{
						{type=5,value=63300},
			    		{type=7,value=6336},
						{type=9,value=2997},
						{type=11,value=6476},
						{type=21,value=1612},
						{type=23,value=2640},
						{type=25,value=1612},
						{type=27,value=2640},
					},
					-- 39 级
					{
						{type=5,value=64200},
			    		{type=7,value=6424},
						{type=9,value=3022},
						{type=11,value=6534},
						{type=21,value=1628},
						{type=23,value=2664},
						{type=25,value=1628},
						{type=27,value=2664},
					},
					-- 40 级
					{
						{type=5,value=65100},
			    		{type=7,value=6512},
						{type=9,value=3047},
						{type=11,value=6592},
						{type=21,value=1644},
						{type=23,value=2688},
						{type=25,value=1644},
						{type=27,value=2688},
					},
					-- 41 级
					{
						{type=5,value=66000},
			    		{type=7,value=6600},
						{type=9,value=3072},
						{type=11,value=6650},
						{type=21,value=1660},
						{type=23,value=2712},
						{type=25,value=1660},
						{type=27,value=2712},
					},
					-- 42 级
					{
						{type=5,value=66900},
			    		{type=7,value=6688},
						{type=9,value=3097},
						{type=11,value=6708},
						{type=21,value=1676},
						{type=23,value=2736},
						{type=25,value=1676},
						{type=27,value=2736},
					},
					-- 43 级
					{
						{type=5,value=67800},
			    		{type=7,value=6776},
						{type=9,value=3122},
						{type=11,value=6766},
						{type=21,value=1692},
						{type=23,value=2760},
						{type=25,value=1692},
						{type=27,value=2760},
					},

					
				},
			},
			-- 法
			{
				itemId = 6275,
				
				inShowIds = {215,216,217,218}, -- 每阶一个内观
				outShowIds = {215,216,217,218}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 5951, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,8,8,8,8,8,8,8,8,8,8,4,20,20,20,20,20,20,20,20,20,20,8,40,40,40,40,40,40,40,40,40,40,16,80,80,80,80,80,80,80,80,80,80,},
				
				attrs = {
											-- 0 级
					{
						{type=5,value=1157},
			    		{type=7,value=4628},
						{type=13,value=150},
						{type=15,value=315},
						{type=21,value=76},
						{type=23,value=126},
						{type=25,value=76},
						{type=27,value=126},
					},
					-- 1 级
					{
						{type=5,value=1215},
			    		{type=7,value=4858},
						{type=13,value=155},
						{type=15,value=331},
						{type=21,value=80},
						{type=23,value=132},
						{type=25,value=80},
						{type=27,value=132},
					},
					-- 2 级
					{
						{type=5,value=1273},
			    		{type=7,value=5088},
						{type=13,value=160},
						{type=15,value=347},
						{type=21,value=84},
						{type=23,value=138},
						{type=25,value=84},
						{type=27,value=138},
					},
					-- 3 级
					{
						{type=5,value=1331},
			    		{type=7,value=5318},
						{type=13,value=165},
						{type=15,value=363},
						{type=21,value=88},
						{type=23,value=144},
						{type=25,value=88},
						{type=27,value=144},
					},
					-- 4 级
					{
						{type=5,value=1389},
			    		{type=7,value=5548},
						{type=13,value=170},
						{type=15,value=379},
						{type=21,value=92},
						{type=23,value=150},
						{type=25,value=92},
						{type=27,value=150},
					},
					-- 5 级
					{
						{type=5,value=1447},
			    		{type=7,value=5778},
						{type=13,value=175},
						{type=15,value=395},
						{type=21,value=96},
						{type=23,value=156},
						{type=25,value=96},
						{type=27,value=156},
					},
					-- 6 级
					{
						{type=5,value=1505},
			    		{type=7,value=6008},
						{type=13,value=180},
						{type=15,value=411},
						{type=21,value=100},
						{type=23,value=162},
						{type=25,value=100},
						{type=27,value=162},
					},
					-- 7 级
					{
						{type=5,value=1563},
			    		{type=7,value=6238},
						{type=13,value=185},
						{type=15,value=427},
						{type=21,value=104},
						{type=23,value=168},
						{type=25,value=104},
						{type=27,value=168},
					},
					-- 8 级
					{
						{type=5,value=1621},
			    		{type=7,value=6468},
						{type=13,value=190},
						{type=15,value=443},
						{type=21,value=108},
						{type=23,value=174},
						{type=25,value=108},
						{type=27,value=174},
					},
					-- 9 级
					{
						{type=5,value=1679},
			    		{type=7,value=6698},
						{type=13,value=195},
						{type=15,value=459},
						{type=21,value=112},
						{type=23,value=180},
						{type=25,value=112},
						{type=27,value=180},
					},
					-- 10 级
					{
						{type=5,value=1737},
			    		{type=7,value=6928},
						{type=13,value=200},
						{type=15,value=475},
						{type=21,value=116},
						{type=23,value=186},
						{type=25,value=116},
						{type=27,value=186},
					},
					-- 11 级
					{
						{type=5,value=3794},
			    		{type=7,value=15156},
						{type=13,value=590},
						{type=15,value=1293},
						{type=21,value=312},
						{type=23,value=514},
						{type=25,value=312},
						{type=27,value=514},
					},
					-- 12 级
					{
						{type=5,value=3910},
			    		{type=7,value=15616},
						{type=13,value=600},
						{type=15,value=1318},
						{type=21,value=320},
						{type=23,value=526},
						{type=25,value=320},
						{type=27,value=526},
					},
					-- 13 级
					{
						{type=5,value=4026},
			    		{type=7,value=16076},
						{type=13,value=610},
						{type=15,value=1343},
						{type=21,value=328},
						{type=23,value=538},
						{type=25,value=328},
						{type=27,value=538},
					},
					-- 14 级
					{
						{type=5,value=4142},
			    		{type=7,value=16536},
						{type=13,value=620},
						{type=15,value=1368},
						{type=21,value=336},
						{type=23,value=550},
						{type=25,value=336},
						{type=27,value=550},
					},
					-- 15 级
					{
						{type=5,value=4258},
			    		{type=7,value=16996},
						{type=13,value=630},
						{type=15,value=1393},
						{type=21,value=344},
						{type=23,value=562},
						{type=25,value=344},
						{type=27,value=562},
					},
					-- 16 级
					{
						{type=5,value=4374},
			    		{type=7,value=17456},
						{type=13,value=640},
						{type=15,value=1418},
						{type=21,value=352},
						{type=23,value=574},
						{type=25,value=352},
						{type=27,value=574},
					},
					-- 17 级
					{
						{type=5,value=4490},
			    		{type=7,value=17916},
						{type=13,value=650},
						{type=15,value=1443},
						{type=21,value=360},
						{type=23,value=586},
						{type=25,value=360},
						{type=27,value=586},
					},
					-- 18 级
					{
						{type=5,value=4606},
			    		{type=7,value=18376},
						{type=13,value=660},
						{type=15,value=1468},
						{type=21,value=368},
						{type=23,value=598},
						{type=25,value=368},
						{type=27,value=598},
					},
					-- 19 级
					{
						{type=5,value=4722},
			    		{type=7,value=18836},
						{type=13,value=670},
						{type=15,value=1493},
						{type=21,value=376},
						{type=23,value=610},
						{type=25,value=376},
						{type=27,value=610},
					},
					-- 20 级
					{
						{type=5,value=4838},
			    		{type=7,value=19296},
						{type=13,value=680},
						{type=15,value=1518},
						{type=21,value=384},
						{type=23,value=622},
						{type=25,value=384},
						{type=27,value=622},
					},
					-- 21 级
					{
						{type=5,value=4954},
			    		{type=7,value=19756},
						{type=13,value=690},
						{type=15,value=1543},
						{type=21,value=392},
						{type=23,value=634},
						{type=25,value=392},
						{type=27,value=634},
					},
					-- 22 级
					{
						{type=5,value=8245},
			    		{type=7,value=32920},
						{type=13,value=1426},
						{type=15,value=3088},
						{type=21,value=762},
						{type=23,value=1252},
						{type=25,value=762},
						{type=27,value=1252},
					},
					-- 23 级
					{
						{type=5,value=8419},
			    		{type=7,value=33610},
						{type=13,value=1441},
						{type=15,value=3126},
						{type=21,value=774},
						{type=23,value=1270},
						{type=25,value=774},
						{type=27,value=1270},
					},
					-- 24 级
					{
						{type=5,value=8593},
			    		{type=7,value=34300},
						{type=13,value=1456},
						{type=15,value=3164},
						{type=21,value=786},
						{type=23,value=1288},
						{type=25,value=786},
						{type=27,value=1288},
					},
					-- 25 级
					{
						{type=5,value=8767},
			    		{type=7,value=34990},
						{type=13,value=1471},
						{type=15,value=3202},
						{type=21,value=798},
						{type=23,value=1306},
						{type=25,value=798},
						{type=27,value=1306},
					},
					-- 26 级
					{
						{type=5,value=8941},
			    		{type=7,value=35680},
						{type=13,value=1486},
						{type=15,value=3240},
						{type=21,value=810},
						{type=23,value=1324},
						{type=25,value=810},
						{type=27,value=1324},
					},
					-- 27 级
					{
						{type=5,value=9115},
			    		{type=7,value=36370},
						{type=13,value=1501},
						{type=15,value=3278},
						{type=21,value=822},
						{type=23,value=1342},
						{type=25,value=822},
						{type=27,value=1342},
					},
					-- 28 级
					{
						{type=5,value=9289},
			    		{type=7,value=37060},
						{type=13,value=1516},
						{type=15,value=3316},
						{type=21,value=834},
						{type=23,value=1360},
						{type=25,value=834},
						{type=27,value=1360},
					},
					-- 29 级
					{
						{type=5,value=9463},
			    		{type=7,value=37750},
						{type=13,value=1531},
						{type=15,value=3354},
						{type=21,value=846},
						{type=23,value=1378},
						{type=25,value=846},
						{type=27,value=1378},
					},
					-- 30 级
					{
						{type=5,value=9637},
			    		{type=7,value=38440},
						{type=13,value=1546},
						{type=15,value=3392},
						{type=21,value=858},
						{type=23,value=1396},
						{type=25,value=858},
						{type=27,value=1396},
					},
					-- 31 级
					{
						{type=5,value=9811},
			    		{type=7,value=39130},
						{type=13,value=1561},
						{type=15,value=3430},
						{type=21,value=870},
						{type=23,value=1414},
						{type=25,value=870},
						{type=27,value=1414},
					},
					-- 32 级
					{
						{type=5,value=9985},
			    		{type=7,value=39820},
						{type=13,value=1576},
						{type=15,value=3468},
						{type=21,value=882},
						{type=23,value=1432},
						{type=25,value=882},
						{type=27,value=1432},
					},
					-- 33 级
					{
						{type=5,value=15127},
			    		{type=7,value=60388},
						{type=13,value=2872},
						{type=15,value=6186},
						{type=21,value=1532},
						{type=23,value=2520},
						{type=25,value=1532},
						{type=27,value=2520},
					},
					-- 34 级
					{
						{type=5,value=15359},
			    		{type=7,value=61308},
						{type=13,value=2897},
						{type=15,value=6244},
						{type=21,value=1548},
						{type=23,value=2544},
						{type=25,value=1548},
						{type=27,value=2544},
					},
					-- 35 级
					{
						{type=5,value=15591},
			    		{type=7,value=62228},
						{type=13,value=2922},
						{type=15,value=6302},
						{type=21,value=1564},
						{type=23,value=2568},
						{type=25,value=1564},
						{type=27,value=2568},
					},
					-- 36 级
					{
						{type=5,value=15823},
			    		{type=7,value=63148},
						{type=13,value=2947},
						{type=15,value=6360},
						{type=21,value=1580},
						{type=23,value=2592},
						{type=25,value=1580},
						{type=27,value=2592},
					},
					-- 37 级
					{
						{type=5,value=16055},
			    		{type=7,value=64068},
						{type=13,value=2972},
						{type=15,value=6418},
						{type=21,value=1596},
						{type=23,value=2616},
						{type=25,value=1596},
						{type=27,value=2616},
					},
					-- 38 级
					{
						{type=5,value=16287},
			    		{type=7,value=64988},
						{type=13,value=2997},
						{type=15,value=6476},
						{type=21,value=1612},
						{type=23,value=2640},
						{type=25,value=1612},
						{type=27,value=2640},
					},
					-- 39 级
					{
						{type=5,value=16519},
			    		{type=7,value=65908},
						{type=13,value=3022},
						{type=15,value=6534},
						{type=21,value=1628},
						{type=23,value=2664},
						{type=25,value=1628},
						{type=27,value=2664},
					},
					-- 40 级
					{
						{type=5,value=16751},
			    		{type=7,value=66828},
						{type=13,value=3047},
						{type=15,value=6592},
						{type=21,value=1644},
						{type=23,value=2688},
						{type=25,value=1644},
						{type=27,value=2688},
					},
					-- 41 级
					{
						{type=5,value=16983},
			    		{type=7,value=67748},
						{type=13,value=3072},
						{type=15,value=6650},
						{type=21,value=1660},
						{type=23,value=2712},
						{type=25,value=1660},
						{type=27,value=2712},
					},
					-- 42 级
					{
						{type=5,value=17215},
			    		{type=7,value=68668},
						{type=13,value=3097},
						{type=15,value=6708},
						{type=21,value=1676},
						{type=23,value=2736},
						{type=25,value=1676},
						{type=27,value=2736},
					},
					-- 43 级
					{
						{type=5,value=17447},
			    		{type=7,value=69588},
						{type=13,value=3122},
						{type=15,value=6766},
						{type=21,value=1692},
						{type=23,value=2760},
						{type=25,value=1692},
						{type=27,value=2760},
					},

					
				},
			},
			-- 道
			{
				itemId = 6275,
				
				inShowIds = {215,216,217,218}, -- 每阶一个内观
				outShowIds = {215,216,217,218}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 5951, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,8,8,8,8,8,8,8,8,8,8,4,20,20,20,20,20,20,20,20,20,20,8,40,40,40,40,40,40,40,40,40,40,16,80,80,80,80,80,80,80,80,80,80,},
				
				attrs = {
										-- 0 级
					{
						{type=5,value=2514},
			    		{type=7,value=2514},
						{type=17,value=150},
						{type=19,value=315},
						{type=21,value=76},
						{type=23,value=126},
						{type=25,value=76},
						{type=27,value=126},
					},
					-- 1 级
					{
						{type=5,value=2640},
			    		{type=7,value=2640},
						{type=17,value=155},
						{type=19,value=331},
						{type=21,value=80},
						{type=23,value=132},
						{type=25,value=80},
						{type=27,value=132},
					},
					-- 2 级
					{
						{type=5,value=2766},
			    		{type=7,value=2766},
						{type=17,value=160},
						{type=19,value=347},
						{type=21,value=84},
						{type=23,value=138},
						{type=25,value=84},
						{type=27,value=138},
					},
					-- 3 级
					{
						{type=5,value=2892},
			    		{type=7,value=2892},
						{type=17,value=165},
						{type=19,value=363},
						{type=21,value=88},
						{type=23,value=144},
						{type=25,value=88},
						{type=27,value=144},
					},
					-- 4 级
					{
						{type=5,value=3018},
			    		{type=7,value=3018},
						{type=17,value=170},
						{type=19,value=379},
						{type=21,value=92},
						{type=23,value=150},
						{type=25,value=92},
						{type=27,value=150},
					},
					-- 5 级
					{
						{type=5,value=3144},
			    		{type=7,value=3144},
						{type=17,value=175},
						{type=19,value=395},
						{type=21,value=96},
						{type=23,value=156},
						{type=25,value=96},
						{type=27,value=156},
					},
					-- 6 级
					{
						{type=5,value=3270},
			    		{type=7,value=3270},
						{type=17,value=180},
						{type=19,value=411},
						{type=21,value=100},
						{type=23,value=162},
						{type=25,value=100},
						{type=27,value=162},
					},
					-- 7 级
					{
						{type=5,value=3396},
			    		{type=7,value=3396},
						{type=17,value=185},
						{type=19,value=427},
						{type=21,value=104},
						{type=23,value=168},
						{type=25,value=104},
						{type=27,value=168},
					},
					-- 8 级
					{
						{type=5,value=3522},
			    		{type=7,value=3522},
						{type=17,value=190},
						{type=19,value=443},
						{type=21,value=108},
						{type=23,value=174},
						{type=25,value=108},
						{type=27,value=174},
					},
					-- 9 级
					{
						{type=5,value=3648},
			    		{type=7,value=3648},
						{type=17,value=195},
						{type=19,value=459},
						{type=21,value=112},
						{type=23,value=180},
						{type=25,value=112},
						{type=27,value=180},
					},
					-- 10 级
					{
						{type=5,value=3774},
			    		{type=7,value=3774},
						{type=17,value=200},
						{type=19,value=475},
						{type=21,value=116},
						{type=23,value=186},
						{type=25,value=116},
						{type=27,value=186},
					},
					-- 11 级
					{
						{type=5,value=8244},
			    		{type=7,value=8244},
						{type=17,value=590},
						{type=19,value=1293},
						{type=21,value=312},
						{type=23,value=514},
						{type=25,value=312},
						{type=27,value=514},
					},
					-- 12 级
					{
						{type=5,value=8496},
			    		{type=7,value=8496},
						{type=17,value=600},
						{type=19,value=1318},
						{type=21,value=320},
						{type=23,value=526},
						{type=25,value=320},
						{type=27,value=526},
					},
					-- 13 级
					{
						{type=5,value=8748},
			    		{type=7,value=8748},
						{type=17,value=610},
						{type=19,value=1343},
						{type=21,value=328},
						{type=23,value=538},
						{type=25,value=328},
						{type=27,value=538},
					},
					-- 14 级
					{
						{type=5,value=9000},
			    		{type=7,value=9000},
						{type=17,value=620},
						{type=19,value=1368},
						{type=21,value=336},
						{type=23,value=550},
						{type=25,value=336},
						{type=27,value=550},
					},
					-- 15 级
					{
						{type=5,value=9252},
			    		{type=7,value=9252},
						{type=17,value=630},
						{type=19,value=1393},
						{type=21,value=344},
						{type=23,value=562},
						{type=25,value=344},
						{type=27,value=562},
					},
					-- 16 级
					{
						{type=5,value=9504},
			    		{type=7,value=9504},
						{type=17,value=640},
						{type=19,value=1418},
						{type=21,value=352},
						{type=23,value=574},
						{type=25,value=352},
						{type=27,value=574},
					},
					-- 17 级
					{
						{type=5,value=9756},
			    		{type=7,value=9756},
						{type=17,value=650},
						{type=19,value=1443},
						{type=21,value=360},
						{type=23,value=586},
						{type=25,value=360},
						{type=27,value=586},
					},
					-- 18 级
					{
						{type=5,value=10008},
			    		{type=7,value=10008},
						{type=17,value=660},
						{type=19,value=1468},
						{type=21,value=368},
						{type=23,value=598},
						{type=25,value=368},
						{type=27,value=598},
					},
					-- 19 级
					{
						{type=5,value=10260},
			    		{type=7,value=10260},
						{type=17,value=670},
						{type=19,value=1493},
						{type=21,value=376},
						{type=23,value=610},
						{type=25,value=376},
						{type=27,value=610},
					},
					-- 20 级
					{
						{type=5,value=10512},
			    		{type=7,value=10512},
						{type=17,value=680},
						{type=19,value=1518},
						{type=21,value=384},
						{type=23,value=622},
						{type=25,value=384},
						{type=27,value=622},
					},
					-- 21 级
					{
						{type=5,value=10764},
			    		{type=7,value=10764},
						{type=17,value=690},
						{type=19,value=1543},
						{type=21,value=392},
						{type=23,value=634},
						{type=25,value=392},
						{type=27,value=634},
					},
					-- 22 级
					{
						{type=5,value=17915},
			    		{type=7,value=17915},
						{type=17,value=1426},
						{type=19,value=3088},
						{type=21,value=762},
						{type=23,value=1252},
						{type=25,value=762},
						{type=27,value=1252},
					},
					-- 23 级
					{
						{type=5,value=18293},
			    		{type=7,value=18293},
						{type=17,value=1441},
						{type=19,value=3126},
						{type=21,value=774},
						{type=23,value=1270},
						{type=25,value=774},
						{type=27,value=1270},
					},
					-- 24 级
					{
						{type=5,value=18671},
			    		{type=7,value=18671},
						{type=17,value=1456},
						{type=19,value=3164},
						{type=21,value=786},
						{type=23,value=1288},
						{type=25,value=786},
						{type=27,value=1288},
					},
					-- 25 级
					{
						{type=5,value=19049},
			    		{type=7,value=19049},
						{type=17,value=1471},
						{type=19,value=3202},
						{type=21,value=798},
						{type=23,value=1306},
						{type=25,value=798},
						{type=27,value=1306},
					},
					-- 26 级
					{
						{type=5,value=19427},
			    		{type=7,value=19427},
						{type=17,value=1486},
						{type=19,value=3240},
						{type=21,value=810},
						{type=23,value=1324},
						{type=25,value=810},
						{type=27,value=1324},
					},
					-- 27 级
					{
						{type=5,value=19805},
			    		{type=7,value=19805},
						{type=17,value=1501},
						{type=19,value=3278},
						{type=21,value=822},
						{type=23,value=1342},
						{type=25,value=822},
						{type=27,value=1342},
					},
					-- 28 级
					{
						{type=5,value=20183},
			    		{type=7,value=20183},
						{type=17,value=1516},
						{type=19,value=3316},
						{type=21,value=834},
						{type=23,value=1360},
						{type=25,value=834},
						{type=27,value=1360},
					},
					-- 29 级
					{
						{type=5,value=20561},
			    		{type=7,value=20561},
						{type=17,value=1531},
						{type=19,value=3354},
						{type=21,value=846},
						{type=23,value=1378},
						{type=25,value=846},
						{type=27,value=1378},
					},
					-- 30 级
					{
						{type=5,value=20939},
			    		{type=7,value=20939},
						{type=17,value=1546},
						{type=19,value=3392},
						{type=21,value=858},
						{type=23,value=1396},
						{type=25,value=858},
						{type=27,value=1396},
					},
					-- 31 级
					{
						{type=5,value=21317},
			    		{type=7,value=21317},
						{type=17,value=1561},
						{type=19,value=3430},
						{type=21,value=870},
						{type=23,value=1414},
						{type=25,value=870},
						{type=27,value=1414},
					},
					-- 32 级
					{
						{type=5,value=21695},
			    		{type=7,value=21695},
						{type=17,value=1576},
						{type=19,value=3468},
						{type=21,value=882},
						{type=23,value=1432},
						{type=25,value=882},
						{type=27,value=1432},
					},
					-- 33 级
					{
						{type=5,value=32869},
			    		{type=7,value=32869},
						{type=17,value=2872},
						{type=19,value=6186},
						{type=21,value=1532},
						{type=23,value=2520},
						{type=25,value=1532},
						{type=27,value=2520},
					},
					-- 34 级
					{
						{type=5,value=33373},
			    		{type=7,value=33373},
						{type=17,value=2897},
						{type=19,value=6244},
						{type=21,value=1548},
						{type=23,value=2544},
						{type=25,value=1548},
						{type=27,value=2544},
					},
					-- 35 级
					{
						{type=5,value=33877},
			    		{type=7,value=33877},
						{type=17,value=2922},
						{type=19,value=6302},
						{type=21,value=1564},
						{type=23,value=2568},
						{type=25,value=1564},
						{type=27,value=2568},
					},
					-- 36 级
					{
						{type=5,value=34381},
			    		{type=7,value=34381},
						{type=17,value=2947},
						{type=19,value=6360},
						{type=21,value=1580},
						{type=23,value=2592},
						{type=25,value=1580},
						{type=27,value=2592},
					},
					-- 37 级
					{
						{type=5,value=34885},
			    		{type=7,value=34885},
						{type=17,value=2972},
						{type=19,value=6418},
						{type=21,value=1596},
						{type=23,value=2616},
						{type=25,value=1596},
						{type=27,value=2616},
					},
					-- 38 级
					{
						{type=5,value=35389},
			    		{type=7,value=35389},
						{type=17,value=2997},
						{type=19,value=6476},
						{type=21,value=1612},
						{type=23,value=2640},
						{type=25,value=1612},
						{type=27,value=2640},
					},
					-- 39 级
					{
						{type=5,value=35893},
			    		{type=7,value=35893},
						{type=17,value=3022},
						{type=19,value=6534},
						{type=21,value=1628},
						{type=23,value=2664},
						{type=25,value=1628},
						{type=27,value=2664},
					},
					-- 40 级
					{
						{type=5,value=36397},
			    		{type=7,value=36397},
						{type=17,value=3047},
						{type=19,value=6592},
						{type=21,value=1644},
						{type=23,value=2688},
						{type=25,value=1644},
						{type=27,value=2688},
					},
					-- 41 级
					{
						{type=5,value=36901},
			    		{type=7,value=36901},
						{type=17,value=3072},
						{type=19,value=6650},
						{type=21,value=1660},
						{type=23,value=2712},
						{type=25,value=1660},
						{type=27,value=2712},
					},
					-- 42 级
					{
						{type=5,value=37405},
			    		{type=7,value=37405},
						{type=17,value=3097},
						{type=19,value=6708},
						{type=21,value=1676},
						{type=23,value=2736},
						{type=25,value=1676},
						{type=27,value=2736},
					},
					-- 43 级
					{
						{type=5,value=37909},
			    		{type=7,value=37909},
						{type=17,value=3122},
						{type=19,value=6766},
						{type=21,value=1692},
						{type=23,value=2760},
						{type=25,value=1692},
						{type=27,value=2760},
					},
					
				},
			},
		},
----------------------------- 时装 8 新春时装  男
		{
			-- 战
			{
				itemId = 6651, --升阶所需道具
				
				inShowIds = {221}, -- 每阶一个内观
				outShowIds = {221}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=9,value=388},
						{type=11,value=788},
						{type=21,value=288},
						{type=23,value=388},
						{type=25,value=288},
						{type=27,value=388},
					},

					
				},
			},
			-- 法
			{
				itemId = 6651,
				
				inShowIds = {221}, -- 每阶一个内观
				outShowIds = {221}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=13,value=388},
						{type=15,value=788},
						{type=21,value=288},
						{type=23,value=388},
						{type=25,value=288},
						{type=27,value=388},
					},

					
				},
			},
			-- 道
			{
				itemId = 6651,
				
				inShowIds = {221}, -- 每阶一个内观
				outShowIds = {221}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=17,value=388},
						{type=19,value=788},
						{type=21,value=288},
						{type=23,value=388},
						{type=25,value=288},
						{type=27,value=388},
					},
					
				},
			},
		},


----------------------------- 时装 9 春节  女
		{
			-- 战
			{
				itemId = 6652, --升阶所需道具
				
				inShowIds = {222}, -- 每阶一个内观
				outShowIds = {222}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=9,value=388},
						{type=11,value=788},
						{type=21,value=288},
						{type=23,value=388},
						{type=25,value=288},
						{type=27,value=388},

					},

					
				},
			},
			-- 法
			{
				itemId = 6652,
				
				inShowIds = {222}, -- 每阶一个内观
				outShowIds = {222}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=13,value=388},
						{type=15,value=788},
						{type=21,value=288},
						{type=23,value=388},
						{type=25,value=288},
						{type=27,value=388},
					},

					
				},
			},
			-- 道
			{
				itemId = 6652,
				
				inShowIds = {222}, -- 每阶一个内观
				outShowIds = {222}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=17,value=388},
						{type=19,value=788},
						{type=21,value=288},
						{type=23,value=388},
						{type=25,value=288},
						{type=27,value=388},
					},
					
				},
			},
		},


----------------------------- 时装 10 春节  武器
		{
			-- 战
			{
				itemId = 6650, --升阶所需道具
				inShowIds = {105}, -- 每阶一个内观
				outShowIds = {105}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 1,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=9,value=588},
						{type=11,value=1188},
						{type=29,value=38},
						{type=128,value=100},
					},

					
				},
			},
			-- 法
			{
				itemId = 6650,
				
				inShowIds = {105}, -- 每阶一个内观
				outShowIds = {105}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 1,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=13,value=588},
						{type=15,value=1188},
						{type=29,value=38},
						{type=128,value=100},
					},

					
				},
			},
			-- 道
			{
				itemId = 6650,
				
				inShowIds = {105}, -- 每阶一个内观
				outShowIds = {105}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 1,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=17,value=588},
						{type=19,value=1188},
						{type=29,value=38},
						{type=128,value=100},
					},
					
				},
			},
		},

----------------------------- 关羽
		{
			-- 战
			{
				itemId = 6715, --升阶所需道具
				inShowIds = {203}, -- 每阶一个内观
				outShowIds = {203}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=5,value=12000},
						{type=9,value=180},
						{type=11,value=380},
						{type=21,value=60},
						{type=23,value=120},
						{type=25,value=60},
						{type=27,value=120},
					},

					
				},
			},
			-- 法
			{
				itemId = 6715, --升阶所需道具
				inShowIds = {203}, -- 每阶一个内观
				outShowIds = {203}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=5,value=6000},
						{type=13,value=180},
						{type=15,value=380},
						{type=21,value=60},
						{type=23,value=120},
						{type=25,value=60},
						{type=27,value=120},
					},

					
				},
			},
			-- 道
			{
				itemId = 6715, --升阶所需道具
				inShowIds = {203}, -- 每阶一个内观
				outShowIds = {203}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=5,value=9000},
						{type=17,value=180},
						{type=19,value=380},
						{type=21,value=60},
						{type=23,value=120},
						{type=25,value=60},
						{type=27,value=120},
					},
					
				},
			},
		},

----------------------------- 仙•关羽时装
		{
			-- 战
			{
				itemId = 6716, --升阶所需道具
				inShowIds = {204}, -- 每阶一个内观
				outShowIds = {204}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=5,value=26500},
						{type=9,value=395},
						{type=11,value=835},
						{type=21,value=130},
						{type=23,value=265},
						{type=25,value=130},
						{type=27,value=265},
					},

					
				},
			},
			-- 法
			{
				itemId = 6716, --升阶所需道具
				inShowIds = {204}, -- 每阶一个内观
				outShowIds = {204}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=5,value=13250},
						{type=13,value=395},
						{type=15,value=835},
						{type=21,value=130},
						{type=23,value=265},
						{type=25,value=130},
						{type=27,value=265},
					},


					
				},
			},
			-- 道
			{
				itemId = 6716, --升阶所需道具
				inShowIds = {204}, -- 每阶一个内观
				outShowIds = {204}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=5,value=19875},
						{type=17,value=395},
						{type=19,value=835},
						{type=21,value=130},
						{type=23,value=265},
						{type=25,value=130},
						{type=27,value=265},
					},
					
				},
			},
		},

----------------------------- 圣•关羽时装
		{
			-- 战
			{
				itemId = 6717, --升阶所需道具
				inShowIds = {205}, -- 每阶一个内观
				outShowIds = {205}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=5,value=58300},
						{type=9,value=860},
						{type=11,value=1838},
						{type=21,value=290},
						{type=23,value=580},
						{type=25,value=290},
						{type=27,value=580},
					},


					
				},
			},
			-- 法
			{
				itemId = 6717, --升阶所需道具
				inShowIds = {205}, -- 每阶一个内观
				outShowIds = {205}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=5,value=29150},
						{type=13,value=860},
						{type=15,value=1838},
						{type=21,value=290},
						{type=23,value=580},
						{type=25,value=290},
						{type=27,value=580},
					},

					
				},
			},
			-- 道
			{
				itemId = 6717, --升阶所需道具
				inShowIds = {205}, -- 每阶一个内观
				outShowIds = {205}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=5,value=43725},
						{type=17,value=860},
						{type=19,value=1838},
						{type=21,value=290},
						{type=23,value=580},
						{type=25,value=290},
						{type=27,value=580},
					},
					
				},
			},
		},

----------------------------- 神•关羽时装
		{
			-- 战
			{
				itemId = 6718, --升阶所需道具
				inShowIds = {206}, -- 每阶一个内观
				outShowIds = {206}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=5,value=128500},
						{type=9,value=1900},
						{type=11,value=4050},
						{type=21,value=360},
						{type=23,value=1280},
						{type=25,value=360},
						{type=27,value=1280},
					},

					
				},
			},
			-- 法
			{
				itemId = 6718, --升阶所需道具
				inShowIds = {206}, -- 每阶一个内观
				outShowIds = {206}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=5,value=64250},
						{type=13,value=1900},
						{type=15,value=4050},
						{type=21,value=360},
						{type=23,value=1280},
						{type=25,value=360},
						{type=27,value=1280},
					},

					
				},
			},
			-- 道
			{
				itemId = 6718, --升阶所需道具
				inShowIds = {206}, -- 每阶一个内观
				outShowIds = {206}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=5,value=96375},
						{type=17,value=1900},
						{type=19,value=4050},
						{type=21,value=360},
						{type=23,value=1280},
						{type=25,value=360},
						{type=27,value=1280},
					},
					
				},
			},
		},

----------------------------- 吕布
	{		-- 战
			{
				itemId = 6719, --升阶所需道具
				inShowIds = {207}, -- 每阶一个内观
				outShowIds = {207}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=5,value=12000},
						{type=9,value=180},
						{type=11,value=380},
						{type=21,value=60},
						{type=23,value=120},
						{type=25,value=60},
						{type=27,value=120},
					},

					
				},
			},
			-- 法
			{
				itemId = 6719, --升阶所需道具
				inShowIds = {207}, -- 每阶一个内观
				outShowIds = {207}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=5,value=6000},
						{type=13,value=180},
						{type=15,value=380},
						{type=21,value=60},
						{type=23,value=120},
						{type=25,value=60},
						{type=27,value=120},
					},

					
				},
			},
			-- 道
			{
				itemId = 6719, --升阶所需道具
				inShowIds = {207}, -- 每阶一个内观
				outShowIds = {207}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=5,value=9000},
						{type=17,value=180},
						{type=19,value=380},
						{type=21,value=60},
						{type=23,value=120},
						{type=25,value=60},
						{type=27,value=120},
					},
					
				},
			},
		},

----------------------------- 仙•吕布时装
		{
			-- 战
			{
				itemId = 6720, --升阶所需道具
				inShowIds = {208}, -- 每阶一个内观
				outShowIds = {208}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=5,value=26500},
						{type=9,value=395},
						{type=11,value=835},
						{type=21,value=130},
						{type=23,value=265},
						{type=25,value=130},
						{type=27,value=265},
					},

					
				},
			},
			-- 法
			{
				itemId = 6720, --升阶所需道具
				inShowIds = {208}, -- 每阶一个内观
				outShowIds = {208}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=5,value=13250},
						{type=13,value=395},
						{type=15,value=835},
						{type=21,value=130},
						{type=23,value=265},
						{type=25,value=130},
						{type=27,value=265},
					},

					
				},
			},
			-- 道
			{
				itemId = 6720, --升阶所需道具
				inShowIds = {208}, -- 每阶一个内观
				outShowIds = {208}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=5,value=19875},
						{type=17,value=395},
						{type=19,value=835},
						{type=21,value=130},
						{type=23,value=265},
						{type=25,value=130},
						{type=27,value=265},
					},
					
				},
			},
		},

----------------------------- 圣•吕布时装
		{
			-- 战
			{
				itemId = 6721, --升阶所需道具
				inShowIds = {209}, -- 每阶一个内观
				outShowIds = {209}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=5,value=58300},
						{type=9,value=860},
						{type=11,value=1838},
						{type=21,value=290},
						{type=23,value=580},
						{type=25,value=290},
						{type=27,value=580},
					},

					
				},
			},
			-- 法
			{
				itemId = 6721, --升阶所需道具
				inShowIds = {209}, -- 每阶一个内观
				outShowIds = {209}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=5,value=29150},
						{type=13,value=860},
						{type=15,value=1838},
						{type=21,value=290},
						{type=23,value=580},
						{type=25,value=290},
						{type=27,value=580},
					},

					
				},
			},
			-- 道
			{
				itemId = 6721, --升阶所需道具
				inShowIds = {209}, -- 每阶一个内观
				outShowIds = {209}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=5,value=43725},
						{type=17,value=860},
						{type=19,value=1838},
						{type=21,value=290},
						{type=23,value=580},
						{type=25,value=290},
						{type=27,value=580},
					},
					
				},
			},
		},

----------------------------- 神•吕布时装
		{
			-- 战
			{
				itemId = 6722, --升阶所需道具
				inShowIds = {210}, -- 每阶一个内观
				outShowIds = {210}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=5,value=128500},
						{type=9,value=1900},
						{type=11,value=4050},
						{type=21,value=360},
						{type=23,value=1280},
						{type=25,value=360},
						{type=27,value=1280},
					},

					
				},
			},
			-- 法
			{
				itemId = 6722, --升阶所需道具
				inShowIds = {210}, -- 每阶一个内观
				outShowIds = {210}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=5,value=64250},
						{type=13,value=1900},
						{type=15,value=4050},
						{type=21,value=360},
						{type=23,value=1280},
						{type=25,value=360},
						{type=27,value=1280},
					},

					
				},
			},
			-- 道
			{
				itemId = 6722, --升阶所需道具
				inShowIds = {210}, -- 每阶一个内观
				outShowIds = {210}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=5,value=96375},
						{type=17,value=1900},
						{type=19,value=4050},
						{type=21,value=360},
						{type=23,value=1280},
						{type=25,value=360},
						{type=27,value=1280},
					},
					
				},
			},
		},

----------------------------- 孙尚香
		{	-- 战
			{
				itemId = 6723, --升阶所需道具
				inShowIds = {215}, -- 每阶一个内观
				outShowIds = {215}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=5,value=12000},
						{type=9,value=180},
						{type=11,value=380},
						{type=21,value=60},
						{type=23,value=120},
						{type=25,value=60},
						{type=27,value=120},
					},

					
				},
			},
			-- 法
			{
				itemId = 6723, --升阶所需道具
				inShowIds = {215}, -- 每阶一个内观
				outShowIds = {215}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=5,value=6000},
						{type=13,value=180},
						{type=15,value=380},
						{type=21,value=60},
						{type=23,value=120},
						{type=25,value=60},
						{type=27,value=120},
					},

					
				},
			},
			-- 道
			{
				itemId = 6723, --升阶所需道具
				inShowIds = {215}, -- 每阶一个内观
				outShowIds = {215}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=5,value=9000},
						{type=17,value=180},
						{type=19,value=380},
						{type=21,value=60},
						{type=23,value=120},
						{type=25,value=60},
						{type=27,value=120},
					},
					
				},
			},
		},

----------------------------- 仙•孙尚香时装
		{
			-- 战
			{
				itemId = 6724, --升阶所需道具
				inShowIds = {216}, -- 每阶一个内观
				outShowIds = {216}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=5,value=26500},
						{type=9,value=395},
						{type=11,value=835},
						{type=21,value=130},
						{type=23,value=265},
						{type=25,value=130},
						{type=27,value=265},
					},

					
				},
			},
			-- 法
			{
				itemId = 6724, --升阶所需道具
				inShowIds = {216}, -- 每阶一个内观
				outShowIds = {216}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=5,value=13250},
						{type=13,value=395},
						{type=15,value=835},
						{type=21,value=130},
						{type=23,value=265},
						{type=25,value=130},
						{type=27,value=265},
					},

					
				},
			},
			-- 道
			{
				itemId = 6724, --升阶所需道具
				inShowIds = {216}, -- 每阶一个内观
				outShowIds = {216}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=5,value=19875},
						{type=17,value=395},
						{type=19,value=835},
						{type=21,value=130},
						{type=23,value=265},
						{type=25,value=130},
						{type=27,value=265},
					},
					
				},
			},
		},

----------------------------- 圣•孙尚香时装
		{
			-- 战
			{
				itemId = 6725, --升阶所需道具
				inShowIds = {217}, -- 每阶一个内观
				outShowIds = {217}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=5,value=58300},
						{type=9,value=860},
						{type=11,value=1838},
						{type=21,value=290},
						{type=23,value=580},
						{type=25,value=290},
						{type=27,value=580},
					},

					
				},
			},
			-- 法
			{
				itemId = 6725, --升阶所需道具
				inShowIds = {217}, -- 每阶一个内观
				outShowIds = {217}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=5,value=29150},
						{type=13,value=860},
						{type=15,value=1838},
						{type=21,value=290},
						{type=23,value=580},
						{type=25,value=290},
						{type=27,value=580},
					},

					
				},
			},
			-- 道
			{
				itemId = 6725, --升阶所需道具
				inShowIds = {217}, -- 每阶一个内观
				outShowIds = {217}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=5,value=43725},
						{type=17,value=860},
						{type=19,value=1838},
						{type=21,value=290},
						{type=23,value=580},
						{type=25,value=290},
						{type=27,value=580},
					},
					
				},
			},
		},

----------------------------- 神•孙尚香时装
		{
			-- 战
			{
				itemId = 6726, --升阶所需道具
				inShowIds = {218}, -- 每阶一个内观
				outShowIds = {218}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=5,value=128500},
						{type=9,value=1900},
						{type=11,value=4050},
						{type=21,value=360},
						{type=23,value=1280},
						{type=25,value=360},
						{type=27,value=1280},
					},

					
				},
			},
			-- 法
			{
				itemId = 6726, --升阶所需道具
				inShowIds = {218}, -- 每阶一个内观
				outShowIds = {218}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=5,value=64250},
						{type=13,value=1900},
						{type=15,value=4050},
						{type=21,value=360},
						{type=23,value=1280},
						{type=25,value=360},
						{type=27,value=1280},
					},

					
				},
			},
			-- 道
			{
				itemId = 6726, --升阶所需道具
				inShowIds = {218}, -- 每阶一个内观
				outShowIds = {218}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=5,value=96375},
						{type=17,value=1900},
						{type=19,value=4050},
						{type=21,value=360},
						{type=23,value=1280},
						{type=25,value=360},
						{type=27,value=1280},
					},
					
				},
			},
		},

----------------------------- 貂蝉
	{		-- 战
			{
				itemId = 6727, --升阶所需道具
				inShowIds = {211}, -- 每阶一个内观
				outShowIds = {211}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=5,value=12000},
						{type=9,value=180},
						{type=11,value=380},
						{type=21,value=60},
						{type=23,value=120},
						{type=25,value=60},
						{type=27,value=120},
					},

					
				},
			},
			-- 法
			{
				itemId = 6727, --升阶所需道具
				inShowIds = {211}, -- 每阶一个内观
				outShowIds = {211}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=5,value=6000},
						{type=13,value=180},
						{type=15,value=380},
						{type=21,value=60},
						{type=23,value=120},
						{type=25,value=60},
						{type=27,value=120},
					},

					
				},
			},
			-- 道
			{
				itemId = 6727, --升阶所需道具
				inShowIds = {211}, -- 每阶一个内观
				outShowIds = {211}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=5,value=9000},
						{type=17,value=180},
						{type=19,value=380},
						{type=21,value=60},
						{type=23,value=120},
						{type=25,value=60},
						{type=27,value=120},
					},
					
				},
			},
		},

----------------------------- 仙•貂蝉时装
		{
			-- 战
			{
				itemId = 6728, --升阶所需道具
				inShowIds = {212}, -- 每阶一个内观
				outShowIds = {212}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=5,value=26500},
						{type=9,value=395},
						{type=11,value=835},
						{type=21,value=130},
						{type=23,value=265},
						{type=25,value=130},
						{type=27,value=265},
					},

					
				},
			},
			-- 法
			{
				itemId = 6728, --升阶所需道具
				inShowIds = {212}, -- 每阶一个内观
				outShowIds = {212}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=5,value=13250},
						{type=13,value=395},
						{type=15,value=835},
						{type=21,value=130},
						{type=23,value=265},
						{type=25,value=130},
						{type=27,value=265},
					},

					
				},
			},
			-- 道
			{
				itemId = 6728, --升阶所需道具
				inShowIds = {212}, -- 每阶一个内观
				outShowIds = {212}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=5,value=19875},
						{type=17,value=395},
						{type=19,value=835},
						{type=21,value=130},
						{type=23,value=265},
						{type=25,value=130},
						{type=27,value=265},
					},
					
				},
			},
		},

----------------------------- 圣•貂蝉时装
		{
			-- 战
			{
				itemId = 6729, --升阶所需道具
				inShowIds = {213}, -- 每阶一个内观
				outShowIds = {213}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=5,value=58300},
						{type=9,value=860},
						{type=11,value=1838},
						{type=21,value=290},
						{type=23,value=580},
						{type=25,value=290},
						{type=27,value=580},
					},

					
				},
			},
			-- 法
			{
				itemId = 6729, --升阶所需道具
				inShowIds = {213}, -- 每阶一个内观
				outShowIds = {213}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=5,value=29150},
						{type=13,value=860},
						{type=15,value=1838},
						{type=21,value=290},
						{type=23,value=580},
						{type=25,value=290},
						{type=27,value=580},
					},

					
				},
			},
			-- 道
			{
				itemId = 6729, --升阶所需道具
				inShowIds = {213}, -- 每阶一个内观
				outShowIds = {213}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=5,value=43725},
						{type=17,value=860},
						{type=19,value=1838},
						{type=21,value=290},
						{type=23,value=580},
						{type=25,value=290},
						{type=27,value=580},
					},
					
				},
			},
		},

----------------------------- 神•貂蝉时装
		{
			-- 战
			{
				itemId = 6730, --升阶所需道具
				inShowIds = {214}, -- 每阶一个内观
				outShowIds = {214}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=5,value=128500},
						{type=9,value=1900},
						{type=11,value=4050},
						{type=21,value=360},
						{type=23,value=1280},
						{type=25,value=360},
						{type=27,value=1280},
					},

					
				},
			},
			-- 法
			{
				itemId = 6730, --升阶所需道具
				inShowIds = {214}, -- 每阶一个内观
				outShowIds = {214}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=5,value=64250},
						{type=13,value=1900},
						{type=15,value=4050},
						{type=21,value=360},
						{type=23,value=1280},
						{type=25,value=360},
						{type=27,value=1280},
					},

					
				},
			},
			-- 道
			{
				itemId = 6730, --升阶所需道具
				inShowIds = {214}, -- 每阶一个内观
				outShowIds = {214}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=5,value=96375},
						{type=17,value=1900},
						{type=19,value=4050},
						{type=21,value=360},
						{type=23,value=1280},
						{type=25,value=360},
						{type=27,value=1280},
					},
					
				},
			},
		},




----------------------------- 夏威夷 男
		{
			-- 战
			{
				itemId = 6938, --升阶所需道具
				
				inShowIds = {238}, -- 每阶一个内观
				outShowIds = {238}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=9,value=388},
						{type=11,value=788},
						{type=21,value=288},
						{type=23,value=388},
						{type=25,value=288},
						{type=27,value=388},
					},

					
				},
			},
			-- 法
			{
				itemId = 6938,
				
				inShowIds = {238}, -- 每阶一个内观
				outShowIds = {238}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=13,value=388},
						{type=15,value=788},
						{type=21,value=288},
						{type=23,value=388},
						{type=25,value=288},
						{type=27,value=388},
					},

					
				},
			},
			-- 道
			{
				itemId = 6938,
				
				inShowIds = {238}, -- 每阶一个内观
				outShowIds = {238}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=17,value=388},
						{type=19,value=788},
						{type=21,value=288},
						{type=23,value=388},
						{type=25,value=288},
						{type=27,value=388},
					},
					
				},
			},
		},


----------------------------- 夏威夷  女
		{
			-- 战
			{
				itemId = 6939, --升阶所需道具
				
				inShowIds = {239}, -- 每阶一个内观
				outShowIds = {239}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=9,value=388},
						{type=11,value=788},
						{type=21,value=288},
						{type=23,value=388},
						{type=25,value=288},
						{type=27,value=388},

					},

					
				},
			},
			-- 法
			{
				itemId = 6939,
				
				inShowIds = {239}, -- 每阶一个内观
				outShowIds = {239}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=13,value=388},
						{type=15,value=788},
						{type=21,value=288},
						{type=23,value=388},
						{type=25,value=288},
						{type=27,value=388},
					},

					
				},
			},
			-- 道
			{
				itemId = 6939,
				
				inShowIds = {239}, -- 每阶一个内观
				outShowIds = {239}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=17,value=388},
						{type=19,value=788},
						{type=21,value=288},
						{type=23,value=388},
						{type=25,value=288},
						{type=27,value=388},
					},
					
				},
			},
		},


----------------------------- 夏威夷  武器
		{
			-- 战
			{
				itemId = 6940, --升阶所需道具
				inShowIds = {110}, -- 每阶一个内观
				outShowIds = {110}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 1,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=9,value=588},
						{type=11,value=1188},
						{type=31,value=38},
						{type=154,value=100},
					},

					
				},
			},
			-- 法
			{
				itemId = 6940,
				
				inShowIds = {110}, -- 每阶一个内观
				outShowIds = {110}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 1,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=13,value=588},
						{type=15,value=1188},
						{type=31,value=38},
						{type=154,value=100},
					},

					
				},
			},
			-- 道
			{
				itemId = 6940,
				
				inShowIds = {110}, -- 每阶一个内观
				outShowIds = {110}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 1,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=17,value=588},
						{type=19,value=1188},
						{type=31,value=38},
						{type=154,value=100},
					},
					
				},
			},
		},





----------------------------- 足迹1
		{
			-- 战
			{
				itemId = 6967, --升阶所需道具
				inShowIds = {8}, -- 每阶一个内观
				outShowIds = {8}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装  3=足迹
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=5,value=10888},
						{type=9,value=188},
						{type=11,value=398},
						{type=21,value=60},
						{type=23,value=120},
						{type=25,value=60},
						{type=27,value=120},
					},

					
				},
			},
			-- 法
			{
				itemId = 6967, --升阶所需道具
				inShowIds = {8}, -- 每阶一个内观
				outShowIds = {8}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=5,value=10888},
						{type=13,value=188},
						{type=15,value=398},
						{type=21,value=60},
						{type=23,value=120},
						{type=25,value=60},
						{type=27,value=120},
					},

					
				},
			},
			-- 道
			{
				itemId = 6967, --升阶所需道具
				inShowIds = {8}, -- 每阶一个内观
				outShowIds = {8}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=5,value=10888},
						{type=17,value=188},
						{type=19,value=398},
						{type=21,value=60},
						{type=23,value=120},
						{type=25,value=60},
						{type=27,value=120},
					},
					
				},
			},
		},

----------------------------- 王 足迹1
		{
			-- 战
			{
				itemId = 6968, --升阶所需道具
				inShowIds = {8}, -- 每阶一个内观
				outShowIds = {8}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装  3=足迹
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=5,value=22888},
						{type=9,value=418},
						{type=11,value=888},
						{type=21,value=132},
						{type=23,value=264},
						{type=25,value=132},
						{type=27,value=264},
					},

					
				},
			},
			-- 法
			{
				itemId = 6968, --升阶所需道具
				inShowIds = {8}, -- 每阶一个内观
				outShowIds = {8}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=5,value=22888},
						{type=13,value=418},
						{type=15,value=888},
						{type=21,value=132},
						{type=23,value=264},
						{type=25,value=132},
						{type=27,value=264},
					},

					
				},
			},
			-- 道
			{
				itemId = 6968, --升阶所需道具
				inShowIds = {8}, -- 每阶一个内观
				outShowIds = {8}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=5,value=22888},
						{type=17,value=418},
						{type=19,value=888},
						{type=21,value=132},
						{type=23,value=264},
						{type=25,value=132},
						{type=27,value=264},
					},
					
				},
			},
		},

----------------------------- 帝 足迹1 
		{
			-- 战
			{
				itemId = 6969, --升阶所需道具
				inShowIds = {8}, -- 每阶一个内观
				outShowIds = {8}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装  3=足迹
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=5,value=48888},
						{type=9,value=918},
						{type=11,value=1968},
						{type=21,value=290},
						{type=23,value=580},
						{type=25,value=290},
						{type=27,value=580},
					},

					
				},
			},
			-- 法
			{
				itemId = 6969, --升阶所需道具
				inShowIds = {8}, -- 每阶一个内观
				outShowIds = {8}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=5,value=48888},
						{type=13,value=918},
						{type=15,value=1968},
						{type=21,value=290},
						{type=23,value=580},
						{type=25,value=290},
						{type=27,value=580},
					},

					
				},
			},
			-- 道
			{
				itemId = 6969, --升阶所需道具
				inShowIds = {8}, -- 每阶一个内观
				outShowIds = {8}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=5,value=48888},
						{type=17,value=918},
						{type=19,value=1968},
						{type=21,value=290},
						{type=23,value=580},
						{type=25,value=290},
						{type=27,value=580},
					},
					
				},
			},
		},

----------------------------- 神 足迹1
		{
			-- 战
			{
				itemId = 6970, --升阶所需道具
				inShowIds = {8}, -- 每阶一个内观
				outShowIds = {8}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装  3=足迹
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=5,value=108888},
						{type=9,value=2018},
						{type=11,value=4268},
						{type=21,value=640},
						{type=23,value=1280},
						{type=25,value=640},
						{type=27,value=1280},
					},

					
				},
			},
			-- 法
			{
				itemId = 6970, --升阶所需道具
				inShowIds = {8}, -- 每阶一个内观
				outShowIds = {8}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=5,value=108888},
						{type=13,value=2018},
						{type=15,value=4268},
						{type=21,value=640},
						{type=23,value=1280},
						{type=25,value=640},
						{type=27,value=1280},
					},

					
				},
			},
			-- 道
			{
				itemId = 6970, --升阶所需道具
				inShowIds = {8}, -- 每阶一个内观
				outShowIds = {8}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=5,value=108888},
						{type=17,value=2018},
						{type=19,value=4268},
						{type=21,value=640},
						{type=23,value=1280},
						{type=25,value=640},
						{type=27,value=1280},
					},
					
				},
			},
		},

----------------------------- 足迹2
		{
			-- 战
			{
				itemId = 6971, --升阶所需道具
				inShowIds = {9}, -- 每阶一个内观
				outShowIds = {9}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装  3=足迹
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=5,value=10888},
						{type=9,value=188},
						{type=11,value=398},
						{type=21,value=60},
						{type=23,value=120},
						{type=25,value=60},
						{type=27,value=120},
					},

					
				},
			},
			-- 法
			{
				itemId = 6971, --升阶所需道具
				inShowIds = {9}, -- 每阶一个内观
				outShowIds = {9}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=5,value=10888},
						{type=13,value=188},
						{type=15,value=398},
						{type=21,value=60},
						{type=23,value=120},
						{type=25,value=60},
						{type=27,value=120},
					},

					
				},
			},
			-- 道
			{
				itemId = 6971, --升阶所需道具
				inShowIds = {9}, -- 每阶一个内观
				outShowIds = {9}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=5,value=10888},
						{type=17,value=188},
						{type=19,value=398},
						{type=21,value=60},
						{type=23,value=120},
						{type=25,value=60},
						{type=27,value=120},
					},
					
				},
			},
		},


----------------------------- 王 足迹2
		{
			-- 战
			{
				itemId = 6972, --升阶所需道具
				inShowIds = {9}, -- 每阶一个内观
				outShowIds = {9}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装  3=足迹
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=5,value=22888},
						{type=9,value=418},
						{type=11,value=888},
						{type=21,value=132},
						{type=23,value=264},
						{type=25,value=132},
						{type=27,value=264},
					},

					
				},
			},
			-- 法
			{
				itemId = 6972, --升阶所需道具
				inShowIds = {9}, -- 每阶一个内观
				outShowIds = {9}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=5,value=22888},
						{type=13,value=418},
						{type=15,value=888},
						{type=21,value=132},
						{type=23,value=264},
						{type=25,value=132},
						{type=27,value=264},
					},

					
				},
			},
			-- 道
			{
				itemId = 6972, --升阶所需道具
				inShowIds = {9}, -- 每阶一个内观
				outShowIds = {9}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=5,value=22888},
						{type=17,value=418},
						{type=19,value=888},
						{type=21,value=132},
						{type=23,value=264},
						{type=25,value=132},
						{type=27,value=264},
					},
					
				},
			},
		},

----------------------------- 帝 足迹1 
		{
			-- 战
			{
				itemId = 6973, --升阶所需道具
				inShowIds = {9}, -- 每阶一个内观
				outShowIds = {9}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装  3=足迹
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=5,value=48888},
						{type=9,value=918},
						{type=11,value=1968},
						{type=21,value=290},
						{type=23,value=580},
						{type=25,value=290},
						{type=27,value=580},
					},

					
				},
			},
			-- 法
			{
				itemId = 6973, --升阶所需道具
				inShowIds = {9}, -- 每阶一个内观
				outShowIds = {9}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=5,value=48888},
						{type=13,value=918},
						{type=15,value=1968},
						{type=21,value=290},
						{type=23,value=580},
						{type=25,value=290},
						{type=27,value=580},
					},

					
				},
			},
			-- 道
			{
				itemId = 6973, --升阶所需道具
				inShowIds = {9}, -- 每阶一个内观
				outShowIds = {9}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=5,value=48888},
						{type=17,value=918},
						{type=19,value=1968},
						{type=21,value=290},
						{type=23,value=580},
						{type=25,value=290},
						{type=27,value=580},
					},
					
				},
			},
		},

----------------------------- 神 足迹1
		{
			-- 战
			{
				itemId = 6974, --升阶所需道具
				inShowIds = {9}, -- 每阶一个内观
				outShowIds = {9}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装  3=足迹
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=5,value=108888},
						{type=9,value=2018},
						{type=11,value=4268},
						{type=21,value=640},
						{type=23,value=1280},
						{type=25,value=640},
						{type=27,value=1280},
					},

					
				},
			},
			-- 法
			{
				itemId = 6974, --升阶所需道具
				inShowIds = {9}, -- 每阶一个内观
				outShowIds = {9}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=5,value=108888},
						{type=13,value=2018},
						{type=15,value=4268},
						{type=21,value=640},
						{type=23,value=1280},
						{type=25,value=640},
						{type=27,value=1280},
					},

					
				},
			},
			-- 道
			{
				itemId = 6974, --升阶所需道具
				inShowIds = {9}, -- 每阶一个内观
				outShowIds = {9}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=5,value=108888},
						{type=17,value=2018},
						{type=19,value=4268},
						{type=21,value=640},
						{type=23,value=1280},
						{type=25,value=640},
						{type=27,value=1280},
					},
					
				},
			},
		},


----------------------------- 足迹3
		{
			-- 战
			{
				itemId = 6975, --升阶所需道具
				inShowIds = {10}, -- 每阶一个内观
				outShowIds = {10}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装  3=足迹
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=5,value=10888},
						{type=9,value=188},
						{type=11,value=398},
						{type=21,value=60},
						{type=23,value=120},
						{type=25,value=60},
						{type=27,value=120},
					},

					
				},
			},
			-- 法
			{
				itemId = 6975, --升阶所需道具
				inShowIds = {10}, -- 每阶一个内观
				outShowIds = {10}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=5,value=10888},
						{type=13,value=188},
						{type=15,value=398},
						{type=21,value=60},
						{type=23,value=120},
						{type=25,value=60},
						{type=27,value=120},
					},

					
				},
			},
			-- 道
			{
				itemId = 6975, --升阶所需道具
				inShowIds = {10}, -- 每阶一个内观
				outShowIds = {10}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=5,value=10888},
						{type=17,value=188},
						{type=19,value=398},
						{type=21,value=60},
						{type=23,value=120},
						{type=25,value=60},
						{type=27,value=120},
					},
					
				},
			},
		},


----------------------------- 王 足迹3
		{
			-- 战
			{
				itemId = 6976, --升阶所需道具
				inShowIds = {10}, -- 每阶一个内观
				outShowIds = {10}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装  3=足迹
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=5,value=22888},
						{type=9,value=418},
						{type=11,value=888},
						{type=21,value=132},
						{type=23,value=264},
						{type=25,value=132},
						{type=27,value=264},
					},

					
				},
			},
			-- 法
			{
				itemId = 6976, --升阶所需道具
				inShowIds = {10}, -- 每阶一个内观
				outShowIds = {10}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=5,value=22888},
						{type=13,value=418},
						{type=15,value=888},
						{type=21,value=132},
						{type=23,value=264},
						{type=25,value=132},
						{type=27,value=264},
					},

					
				},
			},
			-- 道
			{
				itemId = 6976, --升阶所需道具
				inShowIds = {10}, -- 每阶一个内观
				outShowIds = {10}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=5,value=22888},
						{type=17,value=418},
						{type=19,value=888},
						{type=21,value=132},
						{type=23,value=264},
						{type=25,value=132},
						{type=27,value=264},
					},
					
				},
			},
		},

----------------------------- 帝 足迹3
		{
			-- 战
			{
				itemId = 6977, --升阶所需道具
				inShowIds = {10}, -- 每阶一个内观
				outShowIds = {10}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装  3=足迹
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=5,value=48888},
						{type=9,value=918},
						{type=11,value=1968},
						{type=21,value=290},
						{type=23,value=580},
						{type=25,value=290},
						{type=27,value=580},
					},

					
				},
			},
			-- 法
			{
				itemId = 6977, --升阶所需道具
				inShowIds = {10}, -- 每阶一个内观
				outShowIds = {10}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=5,value=48888},
						{type=13,value=918},
						{type=15,value=1968},
						{type=21,value=290},
						{type=23,value=580},
						{type=25,value=290},
						{type=27,value=580},
					},

					
				},
			},
			-- 道
			{
				itemId = 6977, --升阶所需道具
				inShowIds = {10}, -- 每阶一个内观
				outShowIds = {10}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=5,value=48888},
						{type=17,value=918},
						{type=19,value=1968},
						{type=21,value=290},
						{type=23,value=580},
						{type=25,value=290},
						{type=27,value=580},
					},
					
				},
			},
		},

----------------------------- 神 足迹3
		{
			-- 战
			{
				itemId = 6978, --升阶所需道具
				inShowIds = {10}, -- 每阶一个内观
				outShowIds = {10}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装  3=足迹
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=5,value=108888},
						{type=9,value=2018},
						{type=11,value=4268},
						{type=21,value=640},
						{type=23,value=1280},
						{type=25,value=640},
						{type=27,value=1280},
					},

					
				},
			},
			-- 法
			{
				itemId = 6978, --升阶所需道具
				inShowIds = {10}, -- 每阶一个内观
				outShowIds = {10}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=5,value=108888},
						{type=13,value=2018},
						{type=15,value=4268},
						{type=21,value=640},
						{type=23,value=1280},
						{type=25,value=640},
						{type=27,value=1280},
					},

					
				},
			},
			-- 道
			{
				itemId = 6978, --升阶所需道具
				inShowIds = {10}, -- 每阶一个内观
				outShowIds = {10}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=5,value=108888},
						{type=17,value=2018},
						{type=19,value=4268},
						{type=21,value=640},
						{type=23,value=1280},
						{type=25,value=640},
						{type=27,value=1280},
					},
					
				},
			},
		},


----------------------------- 足迹4
		{
			-- 战
			{
				itemId = 6979, --升阶所需道具
				inShowIds = {11}, -- 每阶一个内观
				outShowIds = {11}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装  3=足迹
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=5,value=10888},
						{type=9,value=188},
						{type=11,value=398},
						{type=21,value=60},
						{type=23,value=120},
						{type=25,value=60},
						{type=27,value=120},
					},

					
				},
			},
			-- 法
			{
				itemId = 6979, --升阶所需道具
				inShowIds = {11}, -- 每阶一个内观
				outShowIds = {11}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=5,value=10888},
						{type=13,value=188},
						{type=15,value=398},
						{type=21,value=60},
						{type=23,value=120},
						{type=25,value=60},
						{type=27,value=120},
					},

					
				},
			},
			-- 道
			{
				itemId = 6979, --升阶所需道具
				inShowIds = {11}, -- 每阶一个内观
				outShowIds = {11}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=5,value=10888},
						{type=17,value=188},
						{type=19,value=398},
						{type=21,value=60},
						{type=23,value=120},
						{type=25,value=60},
						{type=27,value=120},
					},
					
				},
			},
		},


----------------------------- 王 足迹3
		{
			-- 战
			{
				itemId = 6980, --升阶所需道具
				inShowIds = {11}, -- 每阶一个内观
				outShowIds = {11}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装  3=足迹
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=5,value=22888},
						{type=9,value=418},
						{type=11,value=888},
						{type=21,value=132},
						{type=23,value=264},
						{type=25,value=132},
						{type=27,value=264},
					},

					
				},
			},
			-- 法
			{
				itemId = 6980, --升阶所需道具
				inShowIds = {11}, -- 每阶一个内观
				outShowIds = {11}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=5,value=22888},
						{type=13,value=418},
						{type=15,value=888},
						{type=21,value=132},
						{type=23,value=264},
						{type=25,value=132},
						{type=27,value=264},
					},

					
				},
			},
			-- 道
			{
				itemId = 6980, --升阶所需道具
				inShowIds = {11}, -- 每阶一个内观
				outShowIds = {11}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=5,value=22888},
						{type=17,value=418},
						{type=19,value=888},
						{type=21,value=132},
						{type=23,value=264},
						{type=25,value=132},
						{type=27,value=264},
					},
					
				},
			},
		},

----------------------------- 帝 足迹3
		{
			-- 战
			{
				itemId = 6981, --升阶所需道具
				inShowIds = {11}, -- 每阶一个内观
				outShowIds = {11}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装  3=足迹
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=5,value=48888},
						{type=9,value=918},
						{type=11,value=1968},
						{type=21,value=290},
						{type=23,value=580},
						{type=25,value=290},
						{type=27,value=580},
					},

					
				},
			},
			-- 法
			{
				itemId = 6981, --升阶所需道具
				inShowIds = {11}, -- 每阶一个内观
				outShowIds = {11}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=5,value=48888},
						{type=13,value=918},
						{type=15,value=1968},
						{type=21,value=290},
						{type=23,value=580},
						{type=25,value=290},
						{type=27,value=580},
					},

					
				},
			},
			-- 道
			{
				itemId = 6981, --升阶所需道具
				inShowIds = {11}, -- 每阶一个内观
				outShowIds = {11}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=5,value=48888},
						{type=17,value=918},
						{type=19,value=1968},
						{type=21,value=290},
						{type=23,value=580},
						{type=25,value=290},
						{type=27,value=580},
					},
					
				},
			},
		},

----------------------------- 神 足迹3
		{
			-- 战
			{
				itemId = 6982, --升阶所需道具
				inShowIds = {11}, -- 每阶一个内观
				outShowIds = {11}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装  3=足迹
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=5,value=108888},
						{type=9,value=2018},
						{type=11,value=4268},
						{type=21,value=640},
						{type=23,value=1280},
						{type=25,value=640},
						{type=27,value=1280},
					},

					
				},
			},
			-- 法
			{
				itemId = 6982, --升阶所需道具
				inShowIds = {11}, -- 每阶一个内观
				outShowIds = {11}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=5,value=108888},
						{type=13,value=2018},
						{type=15,value=4268},
						{type=21,value=640},
						{type=23,value=1280},
						{type=25,value=640},
						{type=27,value=1280},
					},

					
				},
			},
			-- 道
			{
				itemId = 6982, --升阶所需道具
				inShowIds = {11}, -- 每阶一个内观
				outShowIds = {11}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=5,value=108888},
						{type=17,value=2018},
						{type=19,value=4268},
						{type=21,value=640},
						{type=23,value=1280},
						{type=25,value=640},
						{type=27,value=1280},
					},
					
				},
			},
		},



---名人堂幻武 龙光
		{
			-- 战
			{
				itemId = 7077, --升阶所需道具
				inShowIds = {115}, -- 每阶一个内观
				outShowIds = {115}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 1,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=9,value=588},
						{type=11,value=1188},
						{type=161,value=500},
						{type=163,value=500},
						{type=165,value=500},
						{type=181,value=100},
					},

					
				},
			},
			-- 法
			{
				itemId = 7077,
				
				inShowIds = {115}, -- 每阶一个内观
				outShowIds = {115}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 1,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=13,value=588},
						{type=15,value=1188},
						{type=161,value=500},
						{type=163,value=500},
						{type=165,value=500},
						{type=181,value=100},
					},

					
				},
			},
			-- 道
			{
				itemId = 7077,
				
				inShowIds = {115}, -- 每阶一个内观
				outShowIds = {115}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 1,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=17,value=588},
						{type=19,value=1188},
						{type=161,value=500},
						{type=163,value=500},
						{type=165,value=500},
						{type=181,value=500},
					},
					
				},
			},
		},


	

	----------------------------- 至高之拳 男
		{
			-- 战
			{
				itemId = 7199, --升阶所需道具
				
				inShowIds = {258}, -- 每阶一个内观
				outShowIds = {258}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=9,value=388},
						{type=11,value=788},
						{type=21,value=288},
						{type=23,value=388},
						{type=25,value=288},
						{type=27,value=388},
					},

					
				},
			},
			-- 法
			{
				itemId = 7199,
				
				inShowIds = {258}, -- 每阶一个内观
				outShowIds = {258}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=13,value=388},
						{type=15,value=788},
						{type=21,value=288},
						{type=23,value=388},
						{type=25,value=288},
						{type=27,value=388},
					},

					
				},
			},
			-- 道
			{
				itemId = 7199,
				
				inShowIds = {258}, -- 每阶一个内观
				outShowIds = {258}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=17,value=388},
						{type=19,value=788},
						{type=21,value=288},
						{type=23,value=388},
						{type=25,value=288},
						{type=27,value=388},
					},
					
				},
			},
		},


----------------------------- 至高之拳 女
		{
			-- 战
			{
				itemId = 7200, --升阶所需道具
				
				inShowIds = {259}, -- 每阶一个内观
				outShowIds = {259}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=9,value=388},
						{type=11,value=788},
						{type=21,value=288},
						{type=23,value=388},
						{type=25,value=288},
						{type=27,value=388},

					},

					
				},
			},
			-- 法
			{
				itemId = 7200,
				
				inShowIds = {259}, -- 每阶一个内观
				outShowIds = {259}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=13,value=388},
						{type=15,value=788},
						{type=21,value=288},
						{type=23,value=388},
						{type=25,value=288},
						{type=27,value=388},
					},

					
				},
			},
			-- 道
			{
				itemId = 7200,
				
				inShowIds = {259}, -- 每阶一个内观
				outShowIds = {259}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=17,value=388},
						{type=19,value=788},
						{type=21,value=288},
						{type=23,value=388},
						{type=25,value=288},
						{type=27,value=388},
					},
					
				},
			},
		},



---名人堂时装
	---军装男
	{
			-- 战
			{
				itemId = 7655, --升阶所需道具
				
				inShowIds = {282}, -- 每阶一个内观
				outShowIds = {282}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=9,value=888},
						{type=11,value=1888},
						{type=5,value=128888},
						{type=119,value=800},
						{type=121,value=800},
						{type=123,value=800},
					},

					
				},
			},
			-- 法
			{
				itemId = 7655,
				
				inShowIds = {282}, -- 每阶一个内观
				outShowIds = {282}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=13,value=888},
						{type=15,value=1888},
						{type=5,value=128888},
						{type=119,value=800},
						{type=121,value=800},
						{type=123,value=800},
					},

					
				},
			},
			-- 道
			{
				itemId = 7655,
				
				inShowIds = {282}, -- 每阶一个内观
				outShowIds = {282}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=17,value=888},
						{type=19,value=1888},
						{type=5,value=128888},
						{type=119,value=800},
						{type=121,value=800},
						{type=123,value=800},
					},
					
				},
			},
		},


----------------------------- 军装 女
		{
			-- 战
			{
				itemId = 7656, --升阶所需道具
				
				inShowIds = {283}, -- 每阶一个内观
				outShowIds = {283}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=9,value=888},
						{type=11,value=1888},
						{type=5,value=128888},
						{type=119,value=800},
						{type=121,value=800},
						{type=123,value=800},

					},

					
				},
			},
			-- 法
			{
				itemId = 7656,
				
				inShowIds = {283}, -- 每阶一个内观
				outShowIds = {283}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=13,value=888},
						{type=15,value=1888},
						{type=5,value=128888},
						{type=119,value=800},
						{type=121,value=800},
						{type=123,value=800},
					},

					
				},
			},
			-- 道
			{
				itemId = 7656,
				
				inShowIds = {283}, -- 每阶一个内观
				outShowIds = {283}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=17,value=888},
						{type=19,value=1888},
						{type=5,value=128888},
						{type=119,value=800},
						{type=121,value=800},
						{type=123,value=800},
					},
					
				},
			},
		},



---绝版幻武 秦皇圣剑
		{
			-- 战
			{
				itemId = 7653, --升阶所需道具
				inShowIds = {41}, -- 每阶一个内观
				outShowIds = {41}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 1,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=9,value=580},
						{type=11,value=1280},
						{type=5,value=58888},
						{type=12,value=0.02},
						{type=169,value=100},
					},

					
				},
			},
			-- 法
			{
				itemId = 7653,
				
				inShowIds = {41}, -- 每阶一个内观
				outShowIds = {41}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 1,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=13,value=580},
						{type=15,value=1280},
						{type=5,value=58888},
						{type=16,value=0.02},
						{type=169,value=100},
					},

					
				},
			},
			-- 道
			{
				itemId = 7653,
				
				inShowIds = {41}, -- 每阶一个内观
				outShowIds = {41}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 1,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=17,value=580},
						{type=19,value=1280},
						{type=5,value=58888},
						{type=20,value=0.02},
						{type=169,value=100},
					},
					
				},
			},
		},


---绝版网球时装男女
----------------------------- 网球男
		{
			-- 战
			{
				itemId = 7701, --升阶所需道具
				
				inShowIds = {286}, -- 每阶一个内观
				outShowIds = {286}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=9,value=388},
						{type=11,value=788},
						{type=21,value=288},
						{type=23,value=388},
						{type=25,value=288},
						{type=27,value=388},
					},

					
				},
			},
			-- 法
			{
				itemId = 7701,
				
				inShowIds = {286}, -- 每阶一个内观
				outShowIds = {286}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=13,value=388},
						{type=15,value=788},
						{type=21,value=288},
						{type=23,value=388},
						{type=25,value=288},
						{type=27,value=388},
					},

					
				},
			},
			-- 道
			{
				itemId = 7701,
				
				inShowIds = {286}, -- 每阶一个内观
				outShowIds = {286}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=17,value=388},
						{type=19,value=788},
						{type=21,value=288},
						{type=23,value=388},
						{type=25,value=288},
						{type=27,value=388},
					},
					
				},
			},
		},


----------------------------- 网球女
		{
			-- 战
			{
				itemId = 7702, --升阶所需道具
				
				inShowIds = {287}, -- 每阶一个内观
				outShowIds = {287}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=9,value=388},
						{type=11,value=788},
						{type=21,value=288},
						{type=23,value=388},
						{type=25,value=288},
						{type=27,value=388},

					},

					
				},
			},
			-- 法
			{
				itemId = 7702,
				
				inShowIds = {287}, -- 每阶一个内观
				outShowIds = {287}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=13,value=388},
						{type=15,value=788},
						{type=21,value=288},
						{type=23,value=388},
						{type=25,value=288},
						{type=27,value=388},
					},

					
				},
			},
			-- 道
			{
				itemId = 7702,
				
				inShowIds = {287}, -- 每阶一个内观
				outShowIds = {287}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=17,value=388},
						{type=19,value=788},
						{type=21,value=288},
						{type=23,value=388},
						{type=25,value=288},
						{type=27,value=388},
					},
					
				},
			},
		},



----------------------------- 赵云
		{
			-- 战
			{
				itemId = 7703, --升阶所需道具
				inShowIds = {285}, -- 每阶一个内观
				outShowIds = {285}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=5,value=12000},
						{type=9,value=180},
						{type=11,value=380},
						{type=21,value=60},
						{type=23,value=120},
						{type=25,value=60},
						{type=27,value=120},
					},

					
				},
			},
			-- 法
			{
				itemId = 7703, --升阶所需道具
				inShowIds = {285}, -- 每阶一个内观
				outShowIds = {285}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=5,value=6000},
						{type=13,value=180},
						{type=15,value=380},
						{type=21,value=60},
						{type=23,value=120},
						{type=25,value=60},
						{type=27,value=120},
					},

					
				},
			},
			-- 道
			{
				itemId = 7703, --升阶所需道具
				inShowIds = {285}, -- 每阶一个内观
				outShowIds = {285}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=5,value=9000},
						{type=17,value=180},
						{type=19,value=380},
						{type=21,value=60},
						{type=23,value=120},
						{type=25,value=60},
						{type=27,value=120},
					},
					
				},
			},
		},

----------------------------- 王•赵云时装
		{
			-- 战
			{
				itemId = 7704, --升阶所需道具
				inShowIds = {285}, -- 每阶一个内观
				outShowIds = {285}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=5,value=26500},
						{type=9,value=395},
						{type=11,value=835},
						{type=21,value=130},
						{type=23,value=265},
						{type=25,value=130},
						{type=27,value=265},
					},

					
				},
			},
			-- 法
			{
				itemId = 7704, --升阶所需道具
				inShowIds = {285}, -- 每阶一个内观
				outShowIds = {285}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=5,value=13250},
						{type=13,value=395},
						{type=15,value=835},
						{type=21,value=130},
						{type=23,value=265},
						{type=25,value=130},
						{type=27,value=265},
					},


					
				},
			},
			-- 道
			{
				itemId = 7704, --升阶所需道具
				inShowIds = {285}, -- 每阶一个内观
				outShowIds = {285}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=5,value=19875},
						{type=17,value=395},
						{type=19,value=835},
						{type=21,value=130},
						{type=23,value=265},
						{type=25,value=130},
						{type=27,value=265},
					},
					
				},
			},
		},

----------------------------- 帝•赵云时装
		{
			-- 战
			{
				itemId = 7705, --升阶所需道具
				inShowIds = {285}, -- 每阶一个内观
				outShowIds = {285}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=5,value=58300},
						{type=9,value=860},
						{type=11,value=1838},
						{type=21,value=290},
						{type=23,value=580},
						{type=25,value=290},
						{type=27,value=580},
					},


					
				},
			},
			-- 法
			{
				itemId = 7705, --升阶所需道具
				inShowIds = {285}, -- 每阶一个内观
				outShowIds = {285}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=5,value=29150},
						{type=13,value=860},
						{type=15,value=1838},
						{type=21,value=290},
						{type=23,value=580},
						{type=25,value=290},
						{type=27,value=580},
					},

					
				},
			},
			-- 道
			{
				itemId = 7705, --升阶所需道具
				inShowIds = {285}, -- 每阶一个内观
				outShowIds = {285}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=5,value=43725},
						{type=17,value=860},
						{type=19,value=1838},
						{type=21,value=290},
						{type=23,value=580},
						{type=25,value=290},
						{type=27,value=580},
					},
					
				},
			},
		},

----------------------------- 神•赵云时装
		{
			-- 战
			{
				itemId = 7706, --升阶所需道具
				inShowIds = {285}, -- 每阶一个内观
				outShowIds = {285}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=5,value=128500},
						{type=9,value=1900},
						{type=11,value=4050},
						{type=21,value=360},
						{type=23,value=1280},
						{type=25,value=360},
						{type=27,value=1280},
					},

					
				},
			},
			-- 法
			{
				itemId = 7706, --升阶所需道具
				inShowIds = {285}, -- 每阶一个内观
				outShowIds = {285}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=5,value=64250},
						{type=13,value=1900},
						{type=15,value=4050},
						{type=21,value=360},
						{type=23,value=1280},
						{type=25,value=360},
						{type=27,value=1280},
					},

					
				},
			},
			-- 道
			{
				itemId = 7706, --升阶所需道具
				inShowIds = {285}, -- 每阶一个内观
				outShowIds = {285}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=5,value=96375},
						{type=17,value=1900},
						{type=19,value=4050},
						{type=21,value=360},
						{type=23,value=1280},
						{type=25,value=360},
						{type=27,value=1280},
					},
					
				},
			},
		},



---专属幻武 --不朽冰冷
		{
			-- 战
			{
				itemId = 7696, --升阶所需道具
				inShowIds = {127}, -- 每阶一个内观
				outShowIds = {127}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 1,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=9,value=580},
						{type=11,value=1280},
						{type=5,value=88888},
						{type=12,value=0.02},
						{type=169,value=100},
					},

					
				},
			},
			-- 法
			{
				itemId = 7696,
				
				inShowIds = {127}, -- 每阶一个内观
				outShowIds = {127}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 1,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=13,value=580},
						{type=15,value=1280},
						{type=5,value=88888},
						{type=16,value=0.02},
						{type=169,value=100},
					},

					
				},
			},
			-- 道
			{
				itemId = 7696,
				
				inShowIds = {127}, -- 每阶一个内观
				outShowIds = {127}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 1,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=17,value=580},
						{type=19,value=1280},
						{type=5,value=88888},
						{type=20,value=0.02},
						{type=169,value=100},
					},
					
				},
			},
		},



---绝版网球时装男女
----------------------------- 红衣主教男
		{
			-- 战
			{
				itemId = 7711, --升阶所需道具
				
				inShowIds = {290}, -- 每阶一个内观
				outShowIds = {290}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=9,value=999},
						{type=11,value=1999},
						{type=5,value=188888},
						{type=161,value=800},
						{type=163,value=800},
						{type=165,value=800},
					},

					
				},
			},
			-- 法
			{
				itemId = 7711,
				
				inShowIds = {290}, -- 每阶一个内观
				outShowIds = {290}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=13,value=999},
						{type=15,value=1999},
						{type=5,value=188888},
						{type=161,value=800},
						{type=163,value=800},
						{type=165,value=800},
					},

					
				},
			},
			-- 道
			{
				itemId = 7711,
				
				inShowIds = {290}, -- 每阶一个内观
				outShowIds = {290}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=17,value=999},
						{type=19,value=1999},
						{type=5,value=188888},
						{type=161,value=800},
						{type=163,value=800},
						{type=165,value=800},
					},
					
				},
			},
		},


----------------------------- 主教女
		{
			-- 战
			{
				itemId = 7712, --升阶所需道具
				
				inShowIds = {291}, -- 每阶一个内观
				outShowIds = {291}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=9,value=999},
						{type=11,value=1999},
						{type=5,value=188888},
						{type=161,value=800},
						{type=163,value=800},
						{type=165,value=800},

					},

					
				},
			},
			-- 法
			{
				itemId = 7712,
				
				inShowIds = {291}, -- 每阶一个内观
				outShowIds = {291}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=13,value=999},
						{type=15,value=1999},
						{type=5,value=188888},
						{type=161,value=800},
						{type=163,value=800},
						{type=165,value=800},
					},

					
				},
			},
			-- 道
			{
				itemId = 7712,
				
				inShowIds = {291}, -- 每阶一个内观
				outShowIds = {291}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=17,value=999},
						{type=19,value=1999},
						{type=5,value=188888},
						{type=161,value=800},
						{type=163,value=800},
						{type=165,value=800},
					},
					
				},
			},
		},




---足迹5
	{
			-- 战
			{
				itemId = 7786, --升阶所需道具
				inShowIds = {12}, -- 每阶一个内观
				outShowIds = {12}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装  3=足迹
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=5,value=10888},
						{type=9,value=188},
						{type=11,value=398},
						{type=21,value=60},
						{type=23,value=120},
						{type=25,value=60},
						{type=27,value=120},
					},

					
				},
			},
			-- 法
			{
				itemId = 7786, --升阶所需道具
				inShowIds = {12}, -- 每阶一个内观
				outShowIds = {12}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=5,value=10888},
						{type=13,value=188},
						{type=15,value=398},
						{type=21,value=60},
						{type=23,value=120},
						{type=25,value=60},
						{type=27,value=120},
					},

					
				},
			},
			-- 道
			{
				itemId = 7786, --升阶所需道具
				inShowIds = {12}, -- 每阶一个内观
				outShowIds = {12}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=5,value=10888},
						{type=17,value=188},
						{type=19,value=398},
						{type=21,value=60},
						{type=23,value=120},
						{type=25,value=60},
						{type=27,value=120},
					},
					
				},
			},
		},

----------------------------- 王 足迹1
		{
			-- 战
			{
				itemId = 7787, --升阶所需道具
				inShowIds = {12}, -- 每阶一个内观
				outShowIds = {12}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装  3=足迹
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=5,value=22888},
						{type=9,value=418},
						{type=11,value=888},
						{type=21,value=132},
						{type=23,value=264},
						{type=25,value=132},
						{type=27,value=264},
					},

					
				},
			},
			-- 法
			{
				itemId = 7787, --升阶所需道具
				inShowIds = {12}, -- 每阶一个内观
				outShowIds = {12}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=5,value=22888},
						{type=13,value=418},
						{type=15,value=888},
						{type=21,value=132},
						{type=23,value=264},
						{type=25,value=132},
						{type=27,value=264},
					},

					
				},
			},
			-- 道
			{
				itemId = 7787, --升阶所需道具
				inShowIds = {12}, -- 每阶一个内观
				outShowIds = {12}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=5,value=22888},
						{type=17,value=418},
						{type=19,value=888},
						{type=21,value=132},
						{type=23,value=264},
						{type=25,value=132},
						{type=27,value=264},
					},
					
				},
			},
		},

----------------------------- 帝 足迹1 
		{
			-- 战
			{
				itemId = 7788, --升阶所需道具
				inShowIds = {12}, -- 每阶一个内观
				outShowIds = {12}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装  3=足迹
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=5,value=48888},
						{type=9,value=918},
						{type=11,value=1968},
						{type=21,value=290},
						{type=23,value=580},
						{type=25,value=290},
						{type=27,value=580},
					},

					
				},
			},
			-- 法
			{
				itemId = 7788, --升阶所需道具
				inShowIds = {12}, -- 每阶一个内观
				outShowIds = {12}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=5,value=48888},
						{type=13,value=918},
						{type=15,value=1968},
						{type=21,value=290},
						{type=23,value=580},
						{type=25,value=290},
						{type=27,value=580},
					},

					
				},
			},
			-- 道
			{
				itemId = 7788, --升阶所需道具
				inShowIds = {12}, -- 每阶一个内观
				outShowIds = {12}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=5,value=48888},
						{type=17,value=918},
						{type=19,value=1968},
						{type=21,value=290},
						{type=23,value=580},
						{type=25,value=290},
						{type=27,value=580},
					},
					
				},
			},
		},

----------------------------- 神 足迹1
		{
			-- 战
			{
				itemId = 7789, --升阶所需道具
				inShowIds = {12}, -- 每阶一个内观
				outShowIds = {12}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装  3=足迹
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=5,value=108888},
						{type=9,value=2018},
						{type=11,value=4268},
						{type=21,value=640},
						{type=23,value=1280},
						{type=25,value=640},
						{type=27,value=1280},
					},

					
				},
			},
			-- 法
			{
				itemId = 7789, --升阶所需道具
				inShowIds = {12}, -- 每阶一个内观
				outShowIds = {12}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=5,value=108888},
						{type=13,value=2018},
						{type=15,value=4268},
						{type=21,value=640},
						{type=23,value=1280},
						{type=25,value=640},
						{type=27,value=1280},
					},

					
				},
			},
			-- 道
			{
				itemId = 7789, --升阶所需道具
				inShowIds = {12}, -- 每阶一个内观
				outShowIds = {12}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=5,value=108888},
						{type=17,value=2018},
						{type=19,value=4268},
						{type=21,value=640},
						{type=23,value=1280},
						{type=25,value=640},
						{type=27,value=1280},
					},
					
				},
			},
		},


---足迹6
	{
			-- 战
			{
				itemId = 7790, --升阶所需道具
				inShowIds = {13}, -- 每阶一个内观
				outShowIds = {13}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装  3=足迹
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=5,value=10888},
						{type=9,value=188},
						{type=11,value=398},
						{type=21,value=60},
						{type=23,value=120},
						{type=25,value=60},
						{type=27,value=120},
					},

					
				},
			},
			-- 法
			{
				itemId = 7790, --升阶所需道具
				inShowIds = {13}, -- 每阶一个内观
				outShowIds = {13}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=5,value=10888},
						{type=13,value=188},
						{type=15,value=398},
						{type=21,value=60},
						{type=23,value=120},
						{type=25,value=60},
						{type=27,value=120},
					},

					
				},
			},
			-- 道
			{
				itemId = 7790, --升阶所需道具
				inShowIds = {13}, -- 每阶一个内观
				outShowIds = {13}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=5,value=10888},
						{type=17,value=188},
						{type=19,value=398},
						{type=21,value=60},
						{type=23,value=120},
						{type=25,value=60},
						{type=27,value=120},
					},
					
				},
			},
		},

----------------------------- 王 足迹1
		{
			-- 战
			{
				itemId = 7791, --升阶所需道具
				inShowIds = {13}, -- 每阶一个内观
				outShowIds = {13}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装  3=足迹
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=5,value=22888},
						{type=9,value=418},
						{type=11,value=888},
						{type=21,value=132},
						{type=23,value=264},
						{type=25,value=132},
						{type=27,value=264},
					},

					
				},
			},
			-- 法
			{
				itemId = 7791, --升阶所需道具
				inShowIds = {13}, -- 每阶一个内观
				outShowIds = {13}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=5,value=22888},
						{type=13,value=418},
						{type=15,value=888},
						{type=21,value=132},
						{type=23,value=264},
						{type=25,value=132},
						{type=27,value=264},
					},

					
				},
			},
			-- 道
			{
				itemId = 7791, --升阶所需道具
				inShowIds = {13}, -- 每阶一个内观
				outShowIds = {13}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=5,value=22888},
						{type=17,value=418},
						{type=19,value=888},
						{type=21,value=132},
						{type=23,value=264},
						{type=25,value=132},
						{type=27,value=264},
					},
					
				},
			},
		},

----------------------------- 帝 足迹1 
		{
			-- 战
			{
				itemId = 7792, --升阶所需道具
				inShowIds = {13}, -- 每阶一个内观
				outShowIds = {13}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装  3=足迹
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=5,value=48888},
						{type=9,value=918},
						{type=11,value=1968},
						{type=21,value=290},
						{type=23,value=580},
						{type=25,value=290},
						{type=27,value=580},
					},

					
				},
			},
			-- 法
			{
				itemId = 7792, --升阶所需道具
				inShowIds = {13}, -- 每阶一个内观
				outShowIds = {13}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=5,value=48888},
						{type=13,value=918},
						{type=15,value=1968},
						{type=21,value=290},
						{type=23,value=580},
						{type=25,value=290},
						{type=27,value=580},
					},

					
				},
			},
			-- 道
			{
				itemId = 7792, --升阶所需道具
				inShowIds = {13}, -- 每阶一个内观
				outShowIds = {13}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=5,value=48888},
						{type=17,value=918},
						{type=19,value=1968},
						{type=21,value=290},
						{type=23,value=580},
						{type=25,value=290},
						{type=27,value=580},
					},
					
				},
			},
		},

----------------------------- 神 足迹1
		{
			-- 战
			{
				itemId = 7793, --升阶所需道具
				inShowIds = {13}, -- 每阶一个内观
				outShowIds = {13}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装  3=足迹
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=5,value=108888},
						{type=9,value=2018},
						{type=11,value=4268},
						{type=21,value=640},
						{type=23,value=1280},
						{type=25,value=640},
						{type=27,value=1280},
					},

					
				},
			},
			-- 法
			{
				itemId = 7793, --升阶所需道具
				inShowIds = {13}, -- 每阶一个内观
				outShowIds = {13}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=5,value=108888},
						{type=13,value=2018},
						{type=15,value=4268},
						{type=21,value=640},
						{type=23,value=1280},
						{type=25,value=640},
						{type=27,value=1280},
					},

					
				},
			},
			-- 道
			{
				itemId = 7793, --升阶所需道具
				inShowIds = {13}, -- 每阶一个内观
				outShowIds = {13}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=5,value=108888},
						{type=17,value=2018},
						{type=19,value=4268},
						{type=21,value=640},
						{type=23,value=1280},
						{type=25,value=640},
						{type=27,value=1280},
					},
					
				},
			},
		},

---足迹7

{
			-- 战
			{
				itemId = 7794, --升阶所需道具
				inShowIds = {14}, -- 每阶一个内观
				outShowIds = {14}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装  3=足迹
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=5,value=10888},
						{type=9,value=188},
						{type=11,value=398},
						{type=21,value=60},
						{type=23,value=120},
						{type=25,value=60},
						{type=27,value=120},
					},

					
				},
			},
			-- 法
			{
				itemId = 7794, --升阶所需道具
				inShowIds = {14}, -- 每阶一个内观
				outShowIds = {14}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=5,value=10888},
						{type=13,value=188},
						{type=15,value=398},
						{type=21,value=60},
						{type=23,value=120},
						{type=25,value=60},
						{type=27,value=120},
					},

					
				},
			},
			-- 道
			{
				itemId = 7794, --升阶所需道具
				inShowIds = {14}, -- 每阶一个内观
				outShowIds = {14}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=5,value=10888},
						{type=17,value=188},
						{type=19,value=398},
						{type=21,value=60},
						{type=23,value=120},
						{type=25,value=60},
						{type=27,value=120},
					},
					
				},
			},
		},

----------------------------- 王 足迹1
		{
			-- 战
			{
				itemId = 7795, --升阶所需道具
				inShowIds = {14}, -- 每阶一个内观
				outShowIds = {14}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装  3=足迹
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=5,value=22888},
						{type=9,value=418},
						{type=11,value=888},
						{type=21,value=132},
						{type=23,value=264},
						{type=25,value=132},
						{type=27,value=264},
					},

					
				},
			},
			-- 法
			{
				itemId = 7795, --升阶所需道具
				inShowIds = {14}, -- 每阶一个内观
				outShowIds = {14}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=5,value=22888},
						{type=13,value=418},
						{type=15,value=888},
						{type=21,value=132},
						{type=23,value=264},
						{type=25,value=132},
						{type=27,value=264},
					},

					
				},
			},
			-- 道
			{
				itemId = 7795, --升阶所需道具
				inShowIds = {14}, -- 每阶一个内观
				outShowIds = {14}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=5,value=22888},
						{type=17,value=418},
						{type=19,value=888},
						{type=21,value=132},
						{type=23,value=264},
						{type=25,value=132},
						{type=27,value=264},
					},
					
				},
			},
		},

----------------------------- 帝 足迹1 
		{
			-- 战
			{
				itemId = 7796, --升阶所需道具
				inShowIds = {14}, -- 每阶一个内观
				outShowIds = {14}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装  3=足迹
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=5,value=48888},
						{type=9,value=918},
						{type=11,value=1968},
						{type=21,value=290},
						{type=23,value=580},
						{type=25,value=290},
						{type=27,value=580},
					},

					
				},
			},
			-- 法
			{
				itemId = 7796, --升阶所需道具
				inShowIds = {14}, -- 每阶一个内观
				outShowIds = {14}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=5,value=48888},
						{type=13,value=918},
						{type=15,value=1968},
						{type=21,value=290},
						{type=23,value=580},
						{type=25,value=290},
						{type=27,value=580},
					},

					
				},
			},
			-- 道
			{
				itemId = 7796, --升阶所需道具
				inShowIds = {14}, -- 每阶一个内观
				outShowIds = {14}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=5,value=48888},
						{type=17,value=918},
						{type=19,value=1968},
						{type=21,value=290},
						{type=23,value=580},
						{type=25,value=290},
						{type=27,value=580},
					},
					
				},
			},
		},

----------------------------- 神 足迹1
		{
			-- 战
			{
				itemId = 7797, --升阶所需道具
				inShowIds = {14}, -- 每阶一个内观
				outShowIds = {14}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装  3=足迹
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=5,value=108888},
						{type=9,value=2018},
						{type=11,value=4268},
						{type=21,value=640},
						{type=23,value=1280},
						{type=25,value=640},
						{type=27,value=1280},
					},

					
				},
			},
			-- 法
			{
				itemId = 7797, --升阶所需道具
				inShowIds = {14}, -- 每阶一个内观
				outShowIds = {14}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=5,value=108888},
						{type=13,value=2018},
						{type=15,value=4268},
						{type=21,value=640},
						{type=23,value=1280},
						{type=25,value=640},
						{type=27,value=1280},
					},

					
				},
			},
			-- 道
			{
				itemId = 7797, --升阶所需道具
				inShowIds = {14}, -- 每阶一个内观
				outShowIds = {14}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=5,value=108888},
						{type=17,value=2018},
						{type=19,value=4268},
						{type=21,value=640},
						{type=23,value=1280},
						{type=25,value=640},
						{type=27,value=1280},
					},
					
				},
			},
		},

---足迹8
	{
			-- 战
			{
				itemId = 7798, --升阶所需道具
				inShowIds = {15}, -- 每阶一个内观
				outShowIds = {15}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装  3=足迹
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=5,value=10888},
						{type=9,value=188},
						{type=11,value=398},
						{type=21,value=60},
						{type=23,value=120},
						{type=25,value=60},
						{type=27,value=120},
					},

					
				},
			},
			-- 法
			{
				itemId = 7798, --升阶所需道具
				inShowIds = {15}, -- 每阶一个内观
				outShowIds = {15}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=5,value=10888},
						{type=13,value=188},
						{type=15,value=398},
						{type=21,value=60},
						{type=23,value=120},
						{type=25,value=60},
						{type=27,value=120},
					},

					
				},
			},
			-- 道
			{
				itemId = 7798, --升阶所需道具
				inShowIds = {15}, -- 每阶一个内观
				outShowIds = {15}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=5,value=10888},
						{type=17,value=188},
						{type=19,value=398},
						{type=21,value=60},
						{type=23,value=120},
						{type=25,value=60},
						{type=27,value=120},
					},
					
				},
			},
		},

----------------------------- 王 足迹1
		{
			-- 战
			{
				itemId = 7799, --升阶所需道具
				inShowIds = {15}, -- 每阶一个内观
				outShowIds = {15}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装  3=足迹
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=5,value=22888},
						{type=9,value=418},
						{type=11,value=888},
						{type=21,value=132},
						{type=23,value=264},
						{type=25,value=132},
						{type=27,value=264},
					},

					
				},
			},
			-- 法
			{
				itemId = 7799, --升阶所需道具
				inShowIds = {15}, -- 每阶一个内观
				outShowIds = {15}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=5,value=22888},
						{type=13,value=418},
						{type=15,value=888},
						{type=21,value=132},
						{type=23,value=264},
						{type=25,value=132},
						{type=27,value=264},
					},

					
				},
			},
			-- 道
			{
				itemId = 7799, --升阶所需道具
				inShowIds = {15}, -- 每阶一个内观
				outShowIds = {15}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=5,value=22888},
						{type=17,value=418},
						{type=19,value=888},
						{type=21,value=132},
						{type=23,value=264},
						{type=25,value=132},
						{type=27,value=264},
					},
					
				},
			},
		},

----------------------------- 帝 足迹1 
		{
			-- 战
			{
				itemId = 7800, --升阶所需道具
				inShowIds = {15}, -- 每阶一个内观
				outShowIds = {15}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装  3=足迹
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=5,value=48888},
						{type=9,value=918},
						{type=11,value=1968},
						{type=21,value=290},
						{type=23,value=580},
						{type=25,value=290},
						{type=27,value=580},
					},

					
				},
			},
			-- 法
			{
				itemId = 7800, --升阶所需道具
				inShowIds = {15}, -- 每阶一个内观
				outShowIds = {15}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=5,value=48888},
						{type=13,value=918},
						{type=15,value=1968},
						{type=21,value=290},
						{type=23,value=580},
						{type=25,value=290},
						{type=27,value=580},
					},

					
				},
			},
			-- 道
			{
				itemId = 7800, --升阶所需道具
				inShowIds = {15}, -- 每阶一个内观
				outShowIds = {15}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=5,value=48888},
						{type=17,value=918},
						{type=19,value=1968},
						{type=21,value=290},
						{type=23,value=580},
						{type=25,value=290},
						{type=27,value=580},
					},
					
				},
			},
		},

----------------------------- 神 足迹1
		{
			-- 战
			{
				itemId = 7801, --升阶所需道具
				inShowIds = {15}, -- 每阶一个内观
				outShowIds = {15}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装  3=足迹
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=5,value=108888},
						{type=9,value=2018},
						{type=11,value=4268},
						{type=21,value=640},
						{type=23,value=1280},
						{type=25,value=640},
						{type=27,value=1280},
					},

					
				},
			},
			-- 法
			{
				itemId = 7801, --升阶所需道具
				inShowIds = {15}, -- 每阶一个内观
				outShowIds = {15}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=5,value=108888},
						{type=13,value=2018},
						{type=15,value=4268},
						{type=21,value=640},
						{type=23,value=1280},
						{type=25,value=640},
						{type=27,value=1280},
					},

					
				},
			},
			-- 道
			{
				itemId = 7801, --升阶所需道具
				inShowIds = {15}, -- 每阶一个内观
				outShowIds = {15}, -- 每阶一个外观
				doubleShow = true, -- 双外观(武器和衣服)
				itemtype = 3,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=5,value=108888},
						{type=17,value=2018},
						{type=19,value=4268},
						{type=21,value=640},
						{type=23,value=1280},
						{type=25,value=640},
						{type=27,value=1280},
					},
					
				},
			},
		},


---圣诞礼服男女
	{
			-- 战
			{
				itemId = 7802, --升阶所需道具
				
				inShowIds = {292}, -- 每阶一个内观
				outShowIds = {292}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=9,value=388},
						{type=11,value=788},
						{type=21,value=288},
						{type=23,value=388},
						{type=25,value=288},
						{type=27,value=388},
					},

					
				},
			},
			-- 法
			{
				itemId = 7802,
				
				inShowIds = {292}, -- 每阶一个内观
				outShowIds = {292}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=13,value=388},
						{type=15,value=788},
						{type=21,value=288},
						{type=23,value=388},
						{type=25,value=288},
						{type=27,value=388},
					},

					
				},
			},
			-- 道
			{
				itemId = 7802,
				
				inShowIds = {292}, -- 每阶一个内观
				outShowIds = {292}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=17,value=388},
						{type=19,value=788},
						{type=21,value=288},
						{type=23,value=388},
						{type=25,value=288},
						{type=27,value=388},
					},
					
				},
			},
		},


----------------------------- 圣诞礼服 女
		{
			-- 战
			{
				itemId = 7803, --升阶所需道具
				
				inShowIds = {293}, -- 每阶一个内观
				outShowIds = {293}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=9,value=388},
						{type=11,value=788},
						{type=21,value=288},
						{type=23,value=388},
						{type=25,value=288},
						{type=27,value=388},

					},

					
				},
			},
			-- 法
			{
				itemId = 7803,
				
				inShowIds = {293}, -- 每阶一个内观
				outShowIds = {293}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=13,value=388},
						{type=15,value=788},
						{type=21,value=288},
						{type=23,value=388},
						{type=25,value=288},
						{type=27,value=388},
					},

					
				},
			},
			-- 道
			{
				itemId = 7803,
				
				inShowIds = {293}, -- 每阶一个内观
				outShowIds = {293}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=17,value=388},
						{type=19,value=788},
						{type=21,value=288},
						{type=23,value=388},
						{type=25,value=288},
						{type=27,value=388},
					},
					
				},
			},
		},


--圣诞武器
	{
			-- 战
			{
				itemId = 7804, --升阶所需道具
				inShowIds = {130}, -- 每阶一个内观
				outShowIds = {130}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 1,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=9,value=580},
						{type=11,value=1280},
						{type=5,value=58888},
						{type=12,value=0.02},
						{type=169,value=100},
					},

					
				},
			},
			-- 法
			{
				itemId = 7804,
				
				inShowIds = {130}, -- 每阶一个内观
				outShowIds = {130}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 1,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=13,value=580},
						{type=15,value=1280},
						{type=5,value=58888},
						{type=16,value=0.02},
						{type=169,value=100},
					},

					
				},
			},
			-- 道
			{
				itemId = 7804,
				
				inShowIds = {130}, -- 每阶一个内观
				outShowIds = {130}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 1,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=17,value=580},
						{type=19,value=1280},
						{type=5,value=58888},
						{type=20,value=0.02},
						{type=169,value=100},
					},
					
				},
			},
		},



--主教圣剑
	{
			-- 战
			{
				itemId = 7719, --升阶所需道具
				inShowIds = {129}, -- 每阶一个内观
				outShowIds = {129}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 1,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=9,value=580},
						{type=11,value=1280},
						{type=5,value=58888},
						{type=12,value=0.02},
						{type=169,value=100},
					},

					
				},
			},
			-- 法
			{
				itemId = 7719,
				
				inShowIds = {129}, -- 每阶一个内观
				outShowIds = {129}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 1,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=13,value=580},
						{type=15,value=1280},
						{type=5,value=58888},
						{type=16,value=0.02},
						{type=169,value=100},
					},

					
				},
			},
			-- 道
			{
				itemId = 7719,
				
				inShowIds = {129}, -- 每阶一个内观
				outShowIds = {129}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 1,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=17,value=580},
						{type=19,value=1280},
						{type=5,value=58888},
						{type=20,value=0.02},
						{type=169,value=100},
					},
					
				},
			},
		},


----------------------------- 武器 猪年春节  武器
		{
			-- 战
			{
				itemId = 7822, --升阶所需道具
				inShowIds = {132}, -- 每阶一个内观
				outShowIds = {132}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 1,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=9,value=588},
						{type=11,value=1188},
						{type=29,value=38},
						{type=128,value=100},
					},

					
				},
			},
			-- 法
			{
				itemId = 7822,
				
				inShowIds = {132}, -- 每阶一个内观
				outShowIds = {132}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 1,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=13,value=588},
						{type=15,value=1188},
						{type=29,value=38},
						{type=128,value=100},
					},

					
				},
			},
			-- 道
			{
				itemId = 7822,
				
				inShowIds = {132}, -- 每阶一个内观
				outShowIds = {132}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 1,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=17,value=588},
						{type=19,value=1188},
						{type=29,value=38},
						{type=128,value=100},
					},
					
				},
			},
		},


----------------------------- 时装 8 猪年新春时装  男
		{
			-- 战
			{
				itemId = 7823, --升阶所需道具
				
				inShowIds = {314}, -- 每阶一个内观
				outShowIds = {314}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=9,value=388},
						{type=11,value=788},
						{type=21,value=288},
						{type=23,value=388},
						{type=25,value=288},
						{type=27,value=388},
					},

					
				},
			},
			-- 法
			{
				itemId = 7823,
				
				inShowIds = {314}, -- 每阶一个内观
				outShowIds = {314}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=13,value=388},
						{type=15,value=788},
						{type=21,value=288},
						{type=23,value=388},
						{type=25,value=288},
						{type=27,value=388},
					},

					
				},
			},
			-- 道
			{
				itemId = 7823,
				
				inShowIds = {314}, -- 每阶一个内观
				outShowIds = {314}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=17,value=388},
						{type=19,value=788},
						{type=21,value=288},
						{type=23,value=388},
						{type=25,value=288},
						{type=27,value=388},
					},
					
				},
			},
		},


----------------------------- 时装 9 猪年春节  女
		{
			-- 战
			{
				itemId = 7824, --升阶所需道具
				
				inShowIds = {315}, -- 每阶一个内观
				outShowIds = {315}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
									-- 0 级
					{
						{type=9,value=388},
						{type=11,value=788},
						{type=21,value=288},
						{type=23,value=388},
						{type=25,value=288},
						{type=27,value=388},

					},

					
				},
			},
			-- 法
			{
				itemId = 7824,
				
				inShowIds = {315}, -- 每阶一个内观
				outShowIds = {315}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
								
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
											-- 0 级
					{
						{type=13,value=388},
						{type=15,value=788},
						{type=21,value=288},
						{type=23,value=388},
						{type=25,value=288},
						{type=27,value=388},
					},

					
				},
			},
			-- 道
			{
				itemId = 7824,
				
				inShowIds = {315}, -- 每阶一个内观
				outShowIds = {315}, -- 每阶一个外观
				doubleShow = false, -- 双外观(武器和衣服)
				itemtype = 2,  --1=幻武  2 =时装 
				upgradeItemId = 0, -- 升星消耗的物品ID
				
				-- 升级消耗的物品数量
				upgradeItemCounts = {1,},
				
				attrs = {
										-- 0 级
					{
						{type=17,value=388},
						{type=19,value=788},
						{type=21,value=288},
						{type=23,value=388},
						{type=25,value=288},
						{type=27,value=388},
					},
					
				},
			},
		},





	}, -- end dress_list




	
}