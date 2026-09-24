--真气系统配置(已改为潜能)

AvoidinjuryCfg = 
{
	openLevel = 83,--开放等级
	
	--各个潜能的最高等级
	topLayer = {300, 300},
	
	addLingli = 500, -- 每分钟增加灵力
	
	energyList = {	
		-- 攻势 ---------------------------------------------------
		{
			-- 1 - 10 级(每1级分为10阶)
			{
				needLevels = {83,83,83,83,83,83,83,83,83,83},
				linglis = {15000,20000,25000,30000,35000,40000,45000,50000,55000,60000}, -- 消耗灵力					
				baseAttrs = {
					{type=9,value=0},
					{type=11,value=5},
					{type=13,value=0},
					{type=15,value=5},
					{type=17,value=0},
					{type=19,value=5},
				},
				addAttrs = {					
					{type=9,value=0,},
					{type=11,value=5,},
					{type=13,value=0,},
					{type=15,value=5,},
					{type=17,value=0,},
					{type=19,value=5,},
				},
			},
			-- 11 - 20 级
			{
				needLevels = {84,84,84,84,84,84,84,84,84,84},
				linglis = {65000,70000,75000,80000,85000,90000,95000,100000,105000,110000}, -- 消耗灵力					
				baseAttrs = {
					{type=9,value=0},
					{type=11,value=55},
					{type=13,value=0},
					{type=15,value=55},
					{type=17,value=0},
					{type=19,value=55},
				},
				addAttrs = {					
					{type=9,value=0,},
					{type=11,value=5,},
					{type=13,value=0,},
					{type=15,value=5,},
					{type=17,value=0,},
					{type=19,value=5,},
				},
			},
			-- 21 - 30 级
			{
				needLevels = {85,85,85,85,85,85,85,85,85,85},
				linglis = {115000,120000,125000,130000,135000,140000,145000,150000,155000,160000}, -- 消耗灵力					
				baseAttrs = {
					{type=9,value=0},
					{type=11,value=105},
					{type=13,value=0},
					{type=15,value=105},
					{type=17,value=0},
					{type=19,value=105},
				},
				addAttrs = {					
					{type=9,value=0,},
					{type=11,value=5,},
					{type=13,value=0,},
					{type=15,value=5,},
					{type=17,value=0,},
					{type=19,value=5,},

				},
			},
			---------------------------
			-- 31 - 40 级
			{
				needLevels = {86,86,86,86,86,86,86,86,86,86},
				linglis = {165000,170000,175000,180000,185000,190000,195000,200000,205000,210000}, -- 消耗灵力					
				baseAttrs = {
					{type=9,value=0},
					{type=11,value=158},
					{type=13,value=0},
					{type=15,value=158},
					{type=17,value=0},
					{type=19,value=158},
				},
				addAttrs = {					
					{type=9,value=0,},
					{type=11,value=8,},
					{type=13,value=0,},
					{type=15,value=8,},
					{type=17,value=0,},
					{type=19,value=8,},
				},
			},
			-- 41 - 50 级
			{
				needLevels = {87,87,87,87,87,87,87,87,87,87},
				linglis = {215000,220000,225000,230000,235000,240000,245000,250000,255000,260000}, -- 消耗灵力					
				baseAttrs = {
					{type=9,value=0},
					{type=11,value=238},
					{type=13,value=0},
					{type=15,value=238},
					{type=17,value=0},
					{type=19,value=238},
				},
				addAttrs = {					
					{type=9,value=0,},
					{type=11,value=8,},
					{type=13,value=0,},
					{type=15,value=8,},
					{type=17,value=0,},
					{type=19,value=8,},
				},
			},
			-- 51 - 60 级
			{
				needLevels = {88,88,88,88,88,88,88,88,88,88},
				linglis = {265000,270000,275000,280000,285000,290000,295000,300000,305000,310000}, -- 消耗灵力					
				baseAttrs = {
					{type=9,value=0},
					{type=11,value=318},
					{type=13,value=0},
					{type=15,value=318},
					{type=17,value=0},
					{type=19,value=318},
				},
				addAttrs = {					
					{type=9,value=0,},
					{type=11,value=8,},
					{type=13,value=0,},
					{type=15,value=8,},
					{type=17,value=0,},
					{type=19,value=8,},
				},
			},
			--------------------------
			-- 61 - 70 级
			{
				needLevels = {89,89,89,89,89,89,89,89,89,89},
				linglis = {315000,320000,325000,330000,335000,340000,345000,350000,355000,360000}, -- 消耗灵力					
				baseAttrs = {
					{type=9,value=0},
					{type=11,value=401},
					{type=13,value=0},
					{type=15,value=401},
					{type=17,value=0},
					{type=19,value=401},
				},
				addAttrs = {					
					{type=9,value=0,},
					{type=11,value=11,},
					{type=13,value=0,},
					{type=15,value=11,},
					{type=17,value=0,},
					{type=19,value=11,},
				},
			},
			-- 71 - 80 级
			{
				needLevels = {90,90,90,90,90,90,90,90,90,90},
				linglis = {365000,370000,375000,380000,385000,390000,395000,400000,405000,410000}, -- 消耗灵力					
				baseAttrs = {
					{type=9,value=0},
					{type=11,value=511},
					{type=13,value=0},
					{type=15,value=511},
					{type=17,value=0},
					{type=19,value=511},
				},
				addAttrs = {					
					{type=9,value=0,},
					{type=11,value=11,},
					{type=13,value=0,},
					{type=15,value=11,},
					{type=17,value=0,},
					{type=19,value=11,},
				},
			},
			-- 81 - 90 级
			{
				needLevels = {91,91,91,91,91,91,91,91,91,91},
				linglis = {415000,420000,425000,430000,435000,440000,445000,450000,455000,460000}, -- 消耗灵力					
				baseAttrs = {
					{type=9,value=0},
					{type=11,value=621},
					{type=13,value=0},
					{type=15,value=621},
					{type=17,value=0},
					{type=19,value=621},
				},
				addAttrs = {					
					{type=9,value=0,},
					{type=11,value=11,},
					{type=13,value=0,},
					{type=15,value=11,},
					{type=17,value=0,},
					{type=19,value=11,},
				},
			},
			-----------------------------
			-- 91 - 100 级
			{
				needLevels = {92,92,92,92,92,92,92,92,92,92},
				linglis = {465000,470000,475000,480000,485000,490000,495000,500000,505000,510000}, -- 消耗灵力					
				baseAttrs = {
					{type=9,value=0},
					{type=11,value=734},
					{type=13,value=0},
					{type=15,value=734},
					{type=17,value=0},
					{type=19,value=734},
				},
				addAttrs = {					
					{type=9,value=0,},
					{type=11,value=14,},
					{type=13,value=0,},
					{type=15,value=14,},
					{type=17,value=0,},
					{type=19,value=14,},
				},
			},
			-- 101 - 110 级
			{
				needLevels = {93,93,93,93,93,93,93,93,93,93},
				linglis = {515000,520000,525000,530000,535000,540000,545000,550000,555000,560000}, -- 消耗灵力					
				baseAttrs = {
					{type=9,value=0},
					{type=11,value=874},
					{type=13,value=0},
					{type=15,value=874},
					{type=17,value=0},
					{type=19,value=874},
				},
				addAttrs = {					
					{type=9,value=0,},
					{type=11,value=14,},
					{type=13,value=0,},
					{type=15,value=14,},
					{type=17,value=0,},
					{type=19,value=14,},
				},
			},
			-- 111 - 120 级
			{
				needLevels = {94,94,94,94,94,94,94,94,94,94},
				linglis = {565000,570000,575000,580000,585000,590000,595000,600000,605000,610000}, -- 消耗灵力					
				baseAttrs = {
					{type=9,value=0},
					{type=11,value=1014},
					{type=13,value=0},
					{type=15,value=1014},
					{type=17,value=0},
					{type=19,value=1014},
				},
				addAttrs = {					
					{type=9,value=0,},
					{type=11,value=14,},
					{type=13,value=0,},
					{type=15,value=14,},
					{type=17,value=0,},
					{type=19,value=14,},
				},
			},
			------------------------------
			-- 121 - 130 级
			{
				needLevels = {95,95,95,95,95,95,95,95,95,95},
				linglis = {615000,620000,625000,630000,635000,640000,645000,650000,655000,660000}, -- 消耗灵力					
				baseAttrs = {
					{type=9,value=0},
					{type=11,value=1157},
					{type=13,value=0},
					{type=15,value=1157},
					{type=17,value=0},
					{type=19,value=1157},
				},
				addAttrs = {					
					{type=9,value=0,},
					{type=11,value=17,},
					{type=13,value=0,},
					{type=15,value=17,},
					{type=17,value=0,},
					{type=19,value=17,},
				},
			},
			-- 131 - 140 级
			{
				needLevels = {96,96,96,96,96,96,96,96,96,96},
				linglis = {665000,670000,675000,680000,685000,690000,695000,700000,705000,710000}, -- 消耗灵力					
				baseAttrs = {
					{type=9,value=0},
					{type=11,value=1327},
					{type=13,value=0},
					{type=15,value=1327},
					{type=17,value=0},
					{type=19,value=1327},
				},
				addAttrs = {					
					{type=9,value=0,},
					{type=11,value=17,},
					{type=13,value=0,},
					{type=15,value=17,},
					{type=17,value=0,},
					{type=19,value=17,},
				},
			},
			-- 141 - 150 级
			{
				needLevels = {97,97,97,97,97,97,97,97,97,97},
				linglis = {715000,720000,725000,730000,735000,740000,745000,750000,755000,760000}, -- 消耗灵力					
				baseAttrs = {
					{type=9,value=0},
					{type=11,value=1497},
					{type=13,value=0},
					{type=15,value=1497},
					{type=17,value=0},
					{type=19,value=1497},
				},
				addAttrs = {					
					{type=9,value=0,},
					{type=11,value=17,},
					{type=13,value=0,},
					{type=15,value=17,},
					{type=17,value=0,},
					{type=19,value=17,},
				},
			},
			---------------------------
			-- 151 - 160 级
			{
				needLevels = {98,98,98,98,98,98,98,98,98,98},
				linglis = {765000,770000,775000,780000,785000,790000,795000,800000,805000,810000}, -- 消耗灵力					
				baseAttrs = {
					{type=9,value=0},
					{type=11,value=1670},
					{type=13,value=0},
					{type=15,value=1670},
					{type=17,value=0},
					{type=19,value=1670},
				},
				addAttrs = {					
					{type=9,value=0,},
					{type=11,value=20,},
					{type=13,value=0,},
					{type=15,value=20,},
					{type=17,value=0,},
					{type=19,value=20,},
				},
			},
			-- 161 - 170 级
			{
				needLevels = {99,99,99,99,99,99,99,99,99,99},
				linglis = {815000,820000,825000,830000,835000,840000,845000,850000,855000,860000}, -- 消耗灵力					
				baseAttrs = {
					{type=9,value=0},
					{type=11,value=1870},
					{type=13,value=0},
					{type=15,value=1870},
					{type=17,value=0},
					{type=19,value=1870},
				},
				addAttrs = {					
					{type=9,value=0,},
					{type=11,value=20,},
					{type=13,value=0,},
					{type=15,value=20,},
					{type=17,value=0,},
					{type=19,value=20,},
				},
			},
			-- 171 - 180 级
			{
				needLevels = {100,100,100,100,100,100,100,100,100,100},
				linglis = {865000,870000,875000,880000,885000,890000,895000,900000,905000,910000}, -- 消耗灵力					
				baseAttrs = {
					{type=9,value=0},
					{type=11,value=2070},
					{type=13,value=0},
					{type=15,value=2070},
					{type=17,value=0},
					{type=19,value=2070},
				},
				addAttrs = {					
					{type=9,value=0,},
					{type=11,value=20,},
					{type=13,value=0,},
					{type=15,value=20,},
					{type=17,value=0,},
					{type=19,value=20,},
				},
			},
			---------------------------
			-- 181 - 190 级
			{
				needLevels = {101,101,101,101,101,101,101,101,101,101},
				linglis = {915000,920000,925000,930000,935000,940000,945000,950000,955000,960000}, -- 消耗灵力					
				baseAttrs = {
					{type=9,value=0},
					{type=11,value=2273},
					{type=13,value=0},
					{type=15,value=2273},
					{type=17,value=0},
					{type=19,value=2273},
				},
				addAttrs = {					
					{type=9,value=0,},
					{type=11,value=23,},
					{type=13,value=0,},
					{type=15,value=23,},
					{type=17,value=0,},
					{type=19,value=23,},
				},
			},
			-- 191 - 200 级
			{
				needLevels = {102,102,102,102,102,102,102,102,102,102},
				linglis = {965000,970000,975000,980000,985000,990000,995000,1000000,1005000,1010000}, -- 消耗灵力					
				baseAttrs = {
					{type=9,value=0},
					{type=11,value=2503},
					{type=13,value=0},
					{type=15,value=2503},
					{type=17,value=0},
					{type=19,value=2503},
				},
				addAttrs = {					
					{type=9,value=0,},
					{type=11,value=23,},
					{type=13,value=0,},
					{type=15,value=23,},
					{type=17,value=0,},
					{type=19,value=23,},
				},
			},
			-- 201 - 210 级
			{
				needLevels = {103,103,103,103,103,103,103,103,103,103},
				linglis = {1015000,1020000,1025000,1030000,1035000,1040000,1045000,1050000,1055000,1060000}, -- 消耗灵力					
				baseAttrs = {
					{type=9,value=0},
					{type=11,value=2733},
					{type=13,value=0},
					{type=15,value=2733},
					{type=17,value=0},
					{type=19,value=2733},
				},
				addAttrs = {					
					{type=9,value=0,},
					{type=11,value=23,},
					{type=13,value=0,},
					{type=15,value=23,},
					{type=17,value=0,},
					{type=19,value=23,},
				},
			},
			-------------------------------
			-- 211 - 220 级
			{
				needLevels = {104,104,104,104,104,104,104,104,104,104},
				linglis = {1065000,1070000,1075000,1080000,1085000,1090000,1095000,1100000,1105000,1110000}, -- 消耗灵力					
				baseAttrs = {
					{type=9,value=0},
					{type=11,value=2966},
					{type=13,value=0},
					{type=15,value=2966},
					{type=17,value=0},
					{type=19,value=2966},
				},
				addAttrs = {					
					{type=9,value=0,},
					{type=11,value=26,},
					{type=13,value=0,},
					{type=15,value=26,},
					{type=17,value=0,},
					{type=19,value=26,},
				},
			},
			-- 221 - 230 级
			{
				needLevels = {105,105,105,105,105,105,105,105,105,105},
				linglis = {1115000,1120000,1125000,1130000,1135000,1140000,1145000,1150000,1155000,1160000}, -- 消耗灵力					
				baseAttrs = {
					{type=9,value=0},
					{type=11,value=3226},
					{type=13,value=0},
					{type=15,value=3226},
					{type=17,value=0},
					{type=19,value=3226},
				},
				addAttrs = {					
					{type=9,value=0,},
					{type=11,value=26,},
					{type=13,value=0,},
					{type=15,value=26,},
					{type=17,value=0,},
					{type=19,value=26,},
				},
			},
			-- 231 - 240 级
			{
				needLevels = {106,106,106,106,106,106,106,106,106,106},
				linglis = {1165000,1170000,1175000,1180000,1185000,1190000,1195000,1200000,1205000,1210000}, -- 消耗灵力					
				baseAttrs = {
					{type=9,value=0},
					{type=11,value=3486},
					{type=13,value=0},
					{type=15,value=3486},
					{type=17,value=0},
					{type=19,value=3486},
				},
				addAttrs = {					
					{type=9,value=0,},
					{type=11,value=26,},
					{type=13,value=0,},
					{type=15,value=26,},
					{type=17,value=0,},
					{type=19,value=26,},
				},
			},
			---------------------------------
			-- 241 - 250 级
			{
				needLevels = {107,107,107,107,107,107,107,107,107,107},
				linglis = {1215000,1220000,1225000,1230000,1235000,1240000,1245000,1250000,1255000,1260000}, -- 消耗灵力					
				baseAttrs = {
					{type=9,value=0},
					{type=11,value=3749},
					{type=13,value=0},
					{type=15,value=3749},
					{type=17,value=0},
					{type=19,value=3749},
				},
				addAttrs = {					
					{type=9,value=0,},
					{type=11,value=29,},
					{type=13,value=0,},
					{type=15,value=29,},
					{type=17,value=0,},
					{type=19,value=29,},
				},
			},
			-- 251 - 260 级
			{
				needLevels = {108,108,108,108,108,108,108,108,108,108},
				linglis = {1265000,1270000,1275000,1280000,1285000,1290000,1295000,1300000,1305000,1310000}, -- 消耗灵力					
				baseAttrs = {
					{type=9,value=0},
					{type=11,value=4039},
					{type=13,value=0},
					{type=15,value=4039},
					{type=17,value=0},
					{type=19,value=4039},
				},
				addAttrs = {					
					{type=9,value=0,},
					{type=11,value=29,},
					{type=13,value=0,},
					{type=15,value=29,},
					{type=17,value=0,},
					{type=19,value=29,},
				},
			},
			-- 261 - 270 级
			{
				needLevels = {109,109,109,109,109,109,109,109,109,109},
				linglis = {1315000,1320000,1325000,1330000,1335000,1340000,1345000,1350000,1355000,1360000}, -- 消耗灵力					
				baseAttrs = {
					{type=9,value=0},
					{type=11,value=4329},
					{type=13,value=0},
					{type=15,value=4329},
					{type=17,value=0},
					{type=19,value=4329},
				},
				addAttrs = {					
					{type=9,value=0,},
					{type=11,value=29,},
					{type=13,value=0,},
					{type=15,value=29,},
					{type=17,value=0,},
					{type=19,value=29,},
				},
			},
			---------------------------------
			-- 271 - 280 级
			{
				needLevels = {110,110,110,110,110,110,110,110,110,110},
				linglis = {1365000,1370000,1375000,1380000,1385000,1390000,1395000,1400000,1405000,1410000}, -- 消耗灵力					
				baseAttrs = {
					{type=9,value=0},
					{type=11,value=4622},
					{type=13,value=0},
					{type=15,value=4622},
					{type=17,value=0},
					{type=19,value=4622},
				},
				addAttrs = {					
					{type=9,value=0,},
					{type=11,value=32,},
					{type=13,value=0,},
					{type=15,value=32,},
					{type=17,value=0,},
					{type=19,value=32,},
				},
			},
			-- 281 - 290 级
			{
				needLevels = {111,111,111,111,111,111,111,111,111,111},
				linglis = {1415000,1420000,1425000,1430000,1435000,1440000,1445000,1450000,1455000,1460000}, -- 消耗灵力					
				baseAttrs = {
					{type=9,value=0},
					{type=11,value=4942},
					{type=13,value=0},
					{type=15,value=4942},
					{type=17,value=0},
					{type=19,value=4942},
				},
				addAttrs = {					
					{type=9,value=0,},
					{type=11,value=32,},
					{type=13,value=0,},
					{type=15,value=32,},
					{type=17,value=0,},
					{type=19,value=32,},
				},
			},
			-- 291 - 300 级
			{
				needLevels = {112,112,112,112,112,112,112,112,112,112},
				linglis = {1465000,1470000,1475000,1480000,1485000,1490000,1495000,1500000,1505000,1510000}, -- 消耗灵力					
				baseAttrs = {
					{type=9,value=0},
					{type=11,value=5262},
					{type=13,value=0},
					{type=15,value=5262},
					{type=17,value=0},
					{type=19,value=5262},
				},
				addAttrs = {					
					{type=9,value=0,},
					{type=11,value=32,},
					{type=13,value=0,},
					{type=15,value=32,},
					{type=17,value=0,},
					{type=19,value=32,},
				},
			},
			
		},		
		--------------------------------------------------
		-- 健体 
		---------------------------------------------------
		{
			-- 1 - 10 级
			{
				needLevels = {83,83,83,83,83,83,83,83,83,83},
				linglis = {15000,20000,25000,30000,35000,40000,45000,50000,55000,60000}, -- 消耗灵力					
				baseAttrs = {
					{type=5,value=100},
				},
				addAttrs = {					
					{type=5,value=30,},
				},
			},
			-- 11 - 20 级
			{
				needLevels = {84,84,84,84,84,84,84,84,84,84},
				linglis = {65000,70000,75000,80000,85000,90000,95000,100000,105000,110000}, -- 消耗灵力					
				baseAttrs = {
					{type=5,value=400},
				},
				addAttrs = {					
					{type=5,value=30,},
				},
			},
			-- 21 - 30 级
			{
				needLevels = {85,85,85,85,85,85,85,85,85,85},
				linglis = {115000,120000,125000,130000,135000,140000,145000,150000,155000,160000}, -- 消耗灵力					
				baseAttrs = {
					{type=5,value=700},
				},
				addAttrs = {					
					{type=5,value=30,},
				},
			},
			------------------------
			-- 31 - 40 级
			{
				needLevels = {86,86,86,86,86,86,86,86,86,86},
				linglis = {165000,170000,175000,180000,185000,190000,195000,200000,205000,210000}, -- 消耗灵力					
				baseAttrs = {
					{type=5,value=1020},
				},
				addAttrs = {					
					{type=5,value=50,},
				},
			},
			-- 41 - 50 级
			{
				needLevels = {87,87,87,87,87,87,87,87,87,87},
				linglis = {215000,220000,225000,230000,235000,240000,245000,250000,255000,260000}, -- 消耗灵力					
				baseAttrs = {
					{type=5,value=1520},
				},
				addAttrs = {					
					{type=5,value=50,},
				},
			},
			-- 51 - 60 级
			{
				needLevels = {88,88,88,88,88,88,88,88,88,88},
				linglis = {265000,270000,275000,280000,285000,290000,295000,300000,305000,310000}, -- 消耗灵力					
				baseAttrs = {
					{type=5,value=2020},
				},
				addAttrs = {					
					{type=5,value=50,},
				},
			},
			-----------------------
			-- 61 - 70 级
			{
				needLevels = {89,89,89,89,89,89,89,89,89,89},
				linglis = {315000,320000,325000,330000,335000,340000,345000,350000,355000,360000}, -- 消耗灵力					
				baseAttrs = {
					{type=5,value=2540},
				},
				addAttrs = {					
					{type=5,value=70,},
				},
			},
			-- 71 - 80 级
			{
				needLevels = {90,90,90,90,90,90,90,90,90,90},
				linglis = {365000,370000,375000,380000,385000,390000,395000,400000,405000,410000}, -- 消耗灵力					
				baseAttrs = {
					{type=5,value=3240},
				},
				addAttrs = {					
					{type=5,value=70,},
				},
			},
			-- 81 - 90 级
			{
				needLevels = {91,91,91,91,91,91,91,91,91,91},
				linglis = {415000,420000,425000,430000,435000,440000,445000,450000,455000,460000}, -- 消耗灵力					
				baseAttrs = {
					{type=5,value=3940},
				},
				addAttrs = {					
					{type=5,value=70,},
				},
			},
			----------------------
			-- 91 - 100 级
			{
				needLevels = {92,92,92,92,92,92,92,92,92,92},
				linglis = {465000,470000,475000,480000,485000,490000,495000,500000,505000,510000}, -- 消耗灵力					
				baseAttrs = {
					{type=5,value=4660},
				},
				addAttrs = {					
					{type=5,value=90,},
				},
			},
			-- 101 - 110 级
			{
				needLevels = {93,93,93,93,93,93,93,93,93,93},
				linglis = {515000,520000,525000,530000,535000,540000,545000,550000,555000,560000}, -- 消耗灵力					
				baseAttrs = {
					{type=5,value=5560},
				},
				addAttrs = {					
					{type=5,value=90,},
				},
			},
			-- 111 - 120 级
			{
				needLevels = {94,94,94,94,94,94,94,94,94,94},
				linglis = {565000,570000,575000,580000,585000,590000,595000,600000,605000,610000}, -- 消耗灵力					
				baseAttrs = {
					{type=5,value=6460},
				},
				addAttrs = {					
					{type=5,value=90,},
				},
			},
			-----------------------
			-- 121 - 130 级
			{
				needLevels = {95,95,95,95,95,95,95,95,95,95},
				linglis = {615000,620000,625000,630000,635000,640000,645000,650000,655000,660000}, -- 消耗灵力					
				baseAttrs = {
					{type=5,value=7380},
				},
				addAttrs = {					
					{type=5,value=110,},
				},
			},
			-- 131 - 140 级
			{
				needLevels = {96,96,96,96,96,96,96,96,96,96},
				linglis = {665000,670000,675000,680000,685000,690000,695000,700000,705000,710000}, -- 消耗灵力					
				baseAttrs = {
					{type=5,value=8480},
				},
				addAttrs = {					
					{type=5,value=110,},
				},
			},
			-- 141 - 150 级
			{
				needLevels = {97,97,97,97,97,97,97,97,97,97},
				linglis = {715000,720000,725000,730000,735000,740000,745000,750000,755000,760000}, -- 消耗灵力					
				baseAttrs = {
					{type=5,value=9580},
				},
				addAttrs = {					
					{type=5,value=110,},
				},
			},
			---------------------
			-- 151 - 160 级
			{
				needLevels = {98,98,98,98,98,98,98,98,98,98},
				linglis = {765000,770000,775000,780000,785000,790000,795000,800000,805000,810000}, -- 消耗灵力					
				baseAttrs = {
					{type=5,value=10700},
				},
				addAttrs = {					
					{type=5,value=130,},
				},
			},
			-- 161 - 170 级
			{
				needLevels = {99,99,99,99,99,99,99,99,99,99},
				linglis = {815000,820000,825000,830000,835000,840000,845000,850000,855000,860000}, -- 消耗灵力					
				baseAttrs = {
					{type=5,value=12000},
				},
				addAttrs = {					
					{type=5,value=130,},
				},
			},
			-- 171 - 180 级
			{
				needLevels = {100,100,100,100,100,100,100,100,100,100},
				linglis = {865000,870000,875000,880000,885000,890000,895000,900000,905000,910000}, -- 消耗灵力					
				baseAttrs = {
					{type=5,value=13300},
				},
				addAttrs = {					
					{type=5,value=130,},
				},
			},
			--------------------
			-- 181 - 190 级
			{
				needLevels = {101,101,101,101,101,101,101,101,101,101},
				linglis = {915000,920000,925000,930000,935000,940000,945000,950000,955000,960000}, -- 消耗灵力					
				baseAttrs = {
					{type=5,value=14620},
				},
				addAttrs = {					
					{type=5,value=150,},
				},
			},
			-- 191 - 200 级
			{
				needLevels = {102,102,102,102,102,102,102,102,102,102},
				linglis = {965000,970000,975000,980000,985000,990000,995000,1000000,1005000,1010000}, -- 消耗灵力					
				baseAttrs = {
					{type=5,value=16120},
				},
				addAttrs = {					
					{type=5,value=150,},
				},
			},
			-- 201 - 210 级
			{
				needLevels = {103,103,103,103,103,103,103,103,103,103},
				linglis = {1015000,1020000,1025000,1030000,1035000,1040000,1045000,1050000,1055000,1060000}, -- 消耗灵力					
				baseAttrs = {
					{type=5,value=17620},
				},
				addAttrs = {					
					{type=5,value=150,},
				},
			},
			--------------------
			-- 211 - 220 级
			{
				needLevels = {104,104,104,104,104,104,104,104,104,104},
				linglis = {1065000,1070000,1075000,1080000,1085000,1090000,1095000,1100000,1105000,1110000}, -- 消耗灵力					
				baseAttrs = {
					{type=5,value=19140},
				},
				addAttrs = {					
					{type=5,value=170,},
				},
			},
			-- 221 - 230 级
			{
				needLevels = {105,105,105,105,105,105,105,105,105,105},
				linglis = {1115000,1120000,1125000,1130000,1135000,1140000,1145000,1150000,1155000,1160000}, -- 消耗灵力					
				baseAttrs = {
					{type=5,value=20840},
				},
				addAttrs = {					
					{type=5,value=170,},
				},
			},
			-- 231 - 240 级
			{
				needLevels = {106,106,106,106,106,106,106,106,106,106},
				linglis = {1165000,1170000,1175000,1180000,1185000,1190000,1195000,1200000,1205000,1210000}, -- 消耗灵力					
				baseAttrs = {
					{type=5,value=22540},
				},
				addAttrs = {					
					{type=5,value=170,},
				},
			},
			-------------------
			-- 241 - 250 级
			{
				needLevels = {107,107,107,107,107,107,107,107,107,107},
				linglis = {1215000,1220000,1225000,1230000,1235000,1240000,1245000,1250000,1255000,1260000}, -- 消耗灵力					
				baseAttrs = {
					{type=5,value=24260},
				},
				addAttrs = {					
					{type=5,value=190,},
				},
			},
			-- 251 - 260 级
			{
				needLevels = {108,108,108,108,108,108,108,108,108,108},
				linglis = {1265000,1270000,1275000,1280000,1285000,1290000,1295000,1300000,1305000,1310000}, -- 消耗灵力					
				baseAttrs = {
					{type=5,value=26160},
				},
				addAttrs = {					
					{type=5,value=190,},
				},
			},
			-- 261 - 270 级
			{
				needLevels = {109,109,109,109,109,109,109,109,109,109},
				linglis = {1315000,1320000,1325000,1330000,1335000,1340000,1345000,1350000,1355000,1360000}, -- 消耗灵力					
				baseAttrs = {
					{type=5,value=28060},
				},
				addAttrs = {					
					{type=5,value=190,},
				},
			},
			------------------------
			-- 271 - 280 级
			{
				needLevels = {110,110,110,110,110,110,110,110,110,110},
				linglis = {1365000,1370000,1375000,1380000,1385000,1390000,1395000,1400000,1405000,1410000}, -- 消耗灵力					
				baseAttrs = {
					{type=5,value=29980},
				},
				addAttrs = {					
					{type=5,value=210,},
				},
			},
			-- 281 - 290 级
			{
				needLevels = {111,111,111,111,111,111,111,111,111,111},
				linglis = {1415000,1420000,1425000,1430000,1435000,1440000,1445000,1450000,1455000,1460000}, -- 消耗灵力					
				baseAttrs = {
					{type=5,value=32080},
				},
				addAttrs = {					
					{type=5,value=210,},
				},
			},
			-- 291 - 300 级
			{
				needLevels = {112,112,112,112,112,112,112,112,112,112},
				linglis = {1465000,1470000,1475000,1480000,1485000,1490000,1495000,1500000,1505000,1510000}, -- 消耗灵力					
				baseAttrs = {
					{type=5,value=34180},
				},
				addAttrs = {					
					{type=5,value=210,},
				},
			},
		}, 
	},
	
	-----------------------------------------------------
	addEnergyList = {	
		-- 攻势 ---------------------------------------------------
		{
			-- 50 级加成
			{
				{type=12,value=0.03,},
				{type=16,value=0.03,},
				{type=20,value=0.03,},
			},
			-- 100 级加成
			{
				{type=12,value=0.06,},
				{type=16,value=0.06,},
				{type=20,value=0.06,},
			},
			-- 150 级加成
			{
				{type=12,value=0.1,},
				{type=16,value=0.1,},
				{type=20,value=0.1,},
			},
			-- 200 级加成
			{
				{type=12,value=0.15,},
				{type=16,value=0.15,},
				{type=20,value=0.15,},
			},
			-- 250 级加成
			{				
				{type=12,value=0.21,},
				{type=16,value=0.21,},
				{type=20,value=0.21,},
			},
			-- 300 级加成
			{								
				{type=12,value=0.28,},
				{type=16,value=0.28,},
				{type=20,value=0.28,},
			},
		},		
				
		-- 健体 ---------------------------------------------------
		{
			-- 50 级加成
			{
				{type=126,value=200,},--免伤几率
				{type=127,value=1500,},--免伤值
			},
			-- 100 级加成
			{
				{type=126,value=400,},--免伤几率
				{type=127,value=2500,},--免伤值
			},
			-- 150 级加成
			{
				{type=126,value=650,},--免伤几率
				{type=127,value=4000,},--免伤值
			},
			-- 200 级加成
			{
				{type=126,value=950,},--免伤几率
				{type=127,value=6000,},--免伤值
			},
			-- 250 级加成
			{				
				{type=126,value=1300,},--免伤几率
				{type=127,value=9000,},--免伤值
			},
			-- 300 级加成
			{								
				{type=126,value=1700,},--免伤几率
				{type=127,value=13000,},--免伤值
			},
		}, 
	},
}