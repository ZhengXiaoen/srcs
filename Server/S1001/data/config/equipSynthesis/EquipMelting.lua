--装备熔炼
  
--奖励类型：2 = 经验, 5 = 绑金, 6 = 金币， 49 = 炼金值, 46 = 符魄值, 55 = 天宫神锤

EquipMelting = 
{
	EquipReclaim = 
	{						  
		ReclaimExpLimit = -1, -- 每天回收经验限制（-1则没有限制）
		
		--------------------------------------------------------
		--转生系列装备
		--------------------------------------------------------
		--CircleEquip = 			
		-- {
			-- {
				-- circle = 2,		--2转
				-- equipPos = 3,	        --首饰类型
				-- award = {{type = 2,id = 0,count = 24000000}} --经验值
			-- },
			-- {
				-- circle = 4,		--4转
				-- equipPos = 3,	        --首饰类型
				-- award = {{type = 2,id = 0,count = 48000000}} --经验值
			-- },

			-- ------------------------
			-- {
				-- circle = 1,            --1转
				-- equipPos = 1,	       --武器类型
				-- award = {{type = 2,id = 0,count = 48000000},--经验值
					 -- {type = 46,id = 0,count = 1600}}--符魄值
			-- },
			-- ------------------------
			-- {
				-- circle = 3,            --3转
				-- equipPos = 1,	       --武器类型
				-- award = {{type = 2,id = 0,count = 96000000},--经验值
					 -- {type = 46,id = 0,count = 3200}}--符魄值
			-- },
			-- ------------------------
			-- {
				-- circle = 1,            --1转
				-- equipPos = 2,	       --衣服类型
				-- award = {{type = 2,id = 0,count = 32000000},--经验值
					 -- {type = 46,id = 0,count = 1600}}--符魄值
			-- },
			-- {
				-- circle = 3,            --3转
				-- equipPos = 2,	       --衣服类型
				-- award = {{type = 2,id = 0,count = 64000000},--经验值
					 -- {type = 46,id = 0,count = 3200}}--符魄值
			-- },
			
		--}, 
		--回收显示回收
		ShowRecyle = {
			--显示回收名称
			RecyleName = {
							{"天下套装","冲天战套","菩提战套","无尘战套","芙蓉战套","玄冥战套","巫月战套","圣灵战套","圣龙战套"}, --战士
						    {"圣皇套装","冲天法套","菩提法套","无尘法套","芙蓉法套","玄冥法套","巫月法套","圣灵法套","圣龙法套"}, --法师
						    {"财富套装","冲天道套","菩提道套","无尘道套","芙蓉道套","玄冥道套","巫月道套","圣灵道套","圣龙道套"}, --道士
						 },
			--回收条件 {0,10,20,0}  参数1为职业 1 战士 2法师 3道士  参数2 装备的最小等级 参数3 装备最大等级 参数4 转数			 	
			-- RecycleConditions = {
			-- 						{1,0,50,0},{1,20,30,0},{1,30,40,0},{1,40,50,0},{1,50,60,0},{1,60,70,0}, --战士 
			-- 						{2,51,60,0},{2,20,30,0},{2,30,40,0},{2,40,50,0},{2,50,60,0},{2,60,70,0}, --法师
			-- 						{3,61,65,0},{3,20,30,0},{3,30,40,0},{3,40,50,0},{3,50,60,0},{3,60,70,0}, --道士
			-- 					},
			--回收范围ID
			RecycleConditions = {
									{40,48},{87,95},{114,122},{141,149},{168,176},{195,203},{222,230},{249,257},{276,284},
									{49,57},{96,104},{123,131},{150,158},{177,185},{204,212},{231,239},{258,266},{285,293},
									{303,311},{105,113},{132,140},{159,167},{186,194},{213,221},{240,248},{267,275},{294,302},
								},
		},
		----------------------------------------------------------
		--非转生系列装备 最小ID,最大ID,奖励
		----------------------------------------------------------
		NormalEquip = {
			{minid=40,maxid=48,award={{type=5,id=0,count=250},{type=6,id=0,count=250},}},--天下套装
			{minid=49,maxid=57,award={{type=5,id=0,count=1250},{type=6,id=0,count=1250},}},--圣皇套装
			{minid=303,maxid=311,award={{type=5,id=0,count=20000},{type=6,id=0,count=0},}},--财富套装
			{minid=87,maxid=95,award={{type=5,id=0,count=5000},{type=6,id=0,count=5000},}},--冲天战套
			{minid=96,maxid=104,award={{type=5,id=0,count=5000},{type=6,id=0,count=5000},}},--冲天法套
			{minid=105,maxid=113,award={{type=5,id=0,count=5000},{type=6,id=0,count=5000},}},--冲天道套
			{minid=114,maxid=122,award={{type=5,id=0,count=15000},{type=6,id=0,count=15000},}},--菩提战套
			{minid=123,maxid=131,award={{type=5,id=0,count=15000},{type=6,id=0,count=15000},}},--菩提法套
			{minid=132,maxid=140,award={{type=5,id=0,count=15000},{type=6,id=0,count=15000},}},--菩提道套
			{minid=141,maxid=149,award={{type=5,id=0,count=45000},{type=6,id=0,count=45000},}},--无尘战套
			{minid=150,maxid=158,award={{type=5,id=0,count=45000},{type=6,id=0,count=45000},}},--无尘法套
			{minid=159,maxid=167,award={{type=5,id=0,count=45000},{type=6,id=0,count=45000},}},--无尘道套
			{minid=168,maxid=176,award={{type=5,id=0,count=135000},{type=6,id=0,count=135000},}},--芙蓉战套
			{minid=177,maxid=185,award={{type=5,id=0,count=135000},{type=6,id=0,count=135000},}},--芙蓉法套
			{minid=186,maxid=194,award={{type=5,id=0,count=135000},{type=6,id=0,count=135000},}},--芙蓉道套
			{minid=195,maxid=203,award={{type=5,id=0,count=405000},{type=6,id=0,count=405000},}},--玄冥战套
			{minid=204,maxid=212,award={{type=5,id=0,count=405000},{type=6,id=0,count=405000},}},--玄冥法套
			{minid=213,maxid=221,award={{type=5,id=0,count=405000},{type=6,id=0,count=405000},}},--玄冥道套
			{minid=222,maxid=230,award={{type=5,id=0,count=1215000},{type=6,id=0,count=1215000},}},--巫月战套
			{minid=231,maxid=239,award={{type=5,id=0,count=1215000},{type=6,id=0,count=1215000},}},--巫月法套
			{minid=240,maxid=248,award={{type=5,id=0,count=1215000},{type=6,id=0,count=1215000},}},--巫月道套
			{minid=249,maxid=257,award={{type=5,id=0,count=3645000},{type=6,id=0,count=3645000},}},--圣灵战套
			{minid=258,maxid=266,award={{type=5,id=0,count=3645000},{type=6,id=0,count=3645000},}},--圣灵法套
			{minid=267,maxid=275,award={{type=5,id=0,count=3645000},{type=6,id=0,count=3645000},}},--圣灵道套
			{minid=276,maxid=284,award={{type=5,id=0,count=10935000},{type=6,id=0,count=10935000},}},--圣龙战套
			{minid=285,maxid=293,award={{type=5,id=0,count=10935000},{type=6,id=0,count=10935000},}},--圣龙法套
			{minid=294,maxid=302,award={{type=5,id=0,count=10935000},{type=6,id=0,count=10935000},}},--圣龙道套






			-- {equipPos=1,minLevel=10,maxLevel=10,award={{type=5,id=0,count=3},{type=6,id=0,count=3},}},--雄霸之刃
			-- {equipPos=2,minLevel=10,maxLevel=10,award={{type=5,id=0,count=2},{type=6,id=0,count=2},}},--雄霸战甲(男)
			-- {equipPos=2,minLevel=10,maxLevel=10,award={{type=5,id=0,count=2},{type=6,id=0,count=2},}},--雄霸战甲(女)
			-- {equipPos=3,minLevel=10,maxLevel=10,award={{type=5,id=0,count=1},{type=6,id=0,count=1},}},--雄霸头指
			-- {equipPos=8,minLevel=10,maxLevel=10,award={{type=5,id=0,count=1},{type=6,id=0,count=1},}},--雄霸腰带盔
			-- {equipPos=4,minLevel=10,maxLevel=10,award={{type=5,id=0,count=1},{type=6,id=0,count=1},}},--雄霸项链
			-- {equipPos=6,minLevel=10,maxLevel=10,award={{type=5,id=0,count=1},{type=6,id=0,count=1},}},--雄霸护腕
			-- {equipPos=7,minLevel=10,maxLevel=10,award={{type=5,id=0,count=1},{type=6,id=0,count=1},}},--雄霸戒
			-- {equipPos=9,minLevel=10,maxLevel=10,award={{type=5,id=0,count=1},{type=6,id=0,count=1},}},--雄霸靴子
			-- {equipPos=1,minLevel=20,maxLevel=20,award={{type=5,id=0,count=6},{type=6,id=0,count=6},}},--天羽之刃
			-- {equipPos=2,minLevel=20,maxLevel=20,award={{type=5,id=0,count=4},{type=6,id=0,count=4},}},--天羽战甲(男)
			-- {equipPos=2,minLevel=20,maxLevel=20,award={{type=5,id=0,count=4},{type=6,id=0,count=4},}},--天羽战甲(女)
			-- {equipPos=3,minLevel=20,maxLevel=20,award={{type=5,id=0,count=2},{type=6,id=0,count=2},}},--天羽头盔
			-- {equipPos=4,minLevel=20,maxLevel=20,award={{type=5,id=0,count=2},{type=6,id=0,count=2},}},--天羽项链
			-- {equipPos=6,minLevel=20,maxLevel=20,award={{type=5,id=0,count=2},{type=6,id=0,count=2},}},--天羽护腕
			-- {equipPos=7,minLevel=20,maxLevel=20,award={{type=5,id=0,count=2},{type=6,id=0,count=2},}},--天羽戒指
			-- {equipPos=8,minLevel=20,maxLevel=20,award={{type=5,id=0,count=2},{type=6,id=0,count=2},}},--天羽腰带
			-- {equipPos=9,minLevel=20,maxLevel=20,award={{type=5,id=0,count=2},{type=6,id=0,count=2},}},--天羽靴子
			-- {equipPos=1,minLevel=30,maxLevel=30,award={{type=5,id=0,count=30},{type=6,id=0,count=30},}},--征服者之刃
			-- {equipPos=2,minLevel=30,maxLevel=30,award={{type=5,id=0,count=20},{type=6,id=0,count=20},}},--征服者战甲(男)
			-- {equipPos=2,minLevel=30,maxLevel=30,award={{type=5,id=0,count=20},{type=6,id=0,count=20},}},--征服者战甲(女)
			-- {equipPos=3,minLevel=30,maxLevel=30,award={{type=5,id=0,count=10},{type=6,id=0,count=10},}},--征服者头盔
			-- {equipPos=4,minLevel=30,maxLevel=30,award={{type=5,id=0,count=10},{type=6,id=0,count=10},}},--征服者项链
			-- {equipPos=6,minLevel=30,maxLevel=30,award={{type=5,id=0,count=10},{type=6,id=0,count=10},}},--征服者护腕
			-- {equipPos=7,minLevel=30,maxLevel=30,award={{type=5,id=0,count=10},{type=6,id=0,count=10},}},--征服者戒指
			-- {equipPos=8,minLevel=30,maxLevel=30,award={{type=5,id=0,count=10},{type=6,id=0,count=10},}},--征服者腰带
			-- {equipPos=9,minLevel=30,maxLevel=30,award={{type=5,id=0,count=10},{type=6,id=0,count=10},}},--征服者靴子
			-- {equipPos=1,minLevel=40,maxLevel=40,award={{type=5,id=0,count=150},{type=6,id=0,count=150},}},--日月无极
			-- {equipPos=2,minLevel=40,maxLevel=40,award={{type=5,id=0,count=100},{type=6,id=0,count=100},}},--日月战甲(男)
			-- {equipPos=2,minLevel=40,maxLevel=40,award={{type=5,id=0,count=100},{type=6,id=0,count=100},}},--日月战甲(女)
			-- {equipPos=3,minLevel=40,maxLevel=40,award={{type=5,id=0,count=50},{type=6,id=0,count=50},}},--日月头盔
			-- {equipPos=4,minLevel=40,maxLevel=40,award={{type=5,id=0,count=50},{type=6,id=0,count=50},}},--日月项链
			-- {equipPos=6,minLevel=40,maxLevel=40,award={{type=5,id=0,count=50},{type=6,id=0,count=50},}},--日月护腕
			-- {equipPos=7,minLevel=40,maxLevel=40,award={{type=5,id=0,count=50},{type=6,id=0,count=50},}},--日月戒指
			-- {equipPos=8,minLevel=40,maxLevel=40,award={{type=5,id=0,count=50},{type=6,id=0,count=50},}},--日月腰带
			-- {equipPos=9,minLevel=40,maxLevel=40,award={{type=5,id=0,count=50},{type=6,id=0,count=50},}},--日月靴子
			-- {equipPos=1,minLevel=50,maxLevel=50,award={{type=5,id=0,count=750},{type=6,id=0,count=750},}},--天下第一神兵
			-- {equipPos=2,minLevel=50,maxLevel=50,award={{type=5,id=0,count=500},{type=6,id=0,count=500},}},--天下第一神甲(男)
			-- {equipPos=2,minLevel=50,maxLevel=50,award={{type=5,id=0,count=500},{type=6,id=0,count=500},}},--天下第一神甲(女)
			-- {equipPos=3,minLevel=50,maxLevel=50,award={{type=5,id=0,count=250},{type=6,id=0,count=250},}},--天下第一神盔
			-- {equipPos=4,minLevel=50,maxLevel=50,award={{type=5,id=0,count=250},{type=6,id=0,count=250},}},--天下第一神链
			-- {equipPos=6,minLevel=50,maxLevel=50,award={{type=5,id=0,count=250},{type=6,id=0,count=250},}},--天下第一神腕
			-- {equipPos=7,minLevel=50,maxLevel=50,award={{type=5,id=0,count=250},{type=6,id=0,count=250},}},--天下第一神戒
			-- {equipPos=8,minLevel=50,maxLevel=50,award={{type=5,id=0,count=250},{type=6,id=0,count=250},}},--天下第一神带
			-- {equipPos=9,minLevel=50,maxLevel=50,award={{type=5,id=0,count=250},{type=6,id=0,count=250},}},--天下第一神靴
			-- {equipPos=1,minLevel=60,maxLevel=60,award={{type=5,id=0,count=3750},{type=6,id=0,count=3750},}},--圣皇血剑
			-- {equipPos=2,minLevel=60,maxLevel=60,award={{type=5,id=0,count=2500},{type=6,id=0,count=2500},}},--圣皇血甲(男)
			-- {equipPos=2,minLevel=60,maxLevel=60,award={{type=5,id=0,count=2500},{type=6,id=0,count=2500},}},--圣皇血甲(女)
			-- {equipPos=3,minLevel=60,maxLevel=60,award={{type=5,id=0,count=1250},{type=6,id=0,count=1250},}},--圣皇血盔
			-- {equipPos=4,minLevel=60,maxLevel=60,award={{type=5,id=0,count=1250},{type=6,id=0,count=1250},}},--圣皇血链
			-- {equipPos=6,minLevel=60,maxLevel=60,award={{type=5,id=0,count=1250},{type=6,id=0,count=1250},}},--圣皇血腕
			-- {equipPos=7,minLevel=60,maxLevel=60,award={{type=5,id=0,count=1250},{type=6,id=0,count=1250},}},--圣皇血戒
			-- {equipPos=8,minLevel=60,maxLevel=60,award={{type=5,id=0,count=1250},{type=6,id=0,count=1250},}},--圣皇血带
			-- {equipPos=9,minLevel=60,maxLevel=60,award={{type=5,id=0,count=1250},{type=6,id=0,count=1250},}},--圣皇血靴

		        -- --1-9级的首饰（新手）
		        -- {
				-- equipPos = 9,
				-- minLevel = 1,
				-- maxLevel = 10,
				-- award = {
				         -- {type = 2,id = 0,count = 500} }---获得经验
				-- },

	                -- --10-29级的首饰（沃玛装备）
		        -- {
				-- equipPos = 3,
				-- minLevel = 10,
				-- maxLevel = 29,
				-- award = {
				         -- {type = 2,id = 0,count = 2000} }---获得经验
			-- },
			-- --30-39级的首饰（祖玛装备）
		        -- {
				-- equipPos = 3,
				-- minLevel = 30,
				-- maxLevel = 39,
				-- award = {
				         -- {type = 2,id = 0,count = 5000} }--经验
			-- },
		       -- --40-49级的首饰（赤月装备）
			-- {
				-- equipPos = 3,
				-- minLevel = 40,
				-- maxLevel = 49,
				-- award = {
				          -- {type = 2,id = 0,count = 50000} }--经验
			-- },
			-- ---50-59的首饰(魔龙装备)
			-- {
				-- equipPos = 3,
				-- minLevel = 50,
				-- maxLevel = 59,
				-- award = {
				         -- {type = 2,id = 0,count = 500000} }--经验
			-- },
			-- --60-69的首饰（战神装备）
			-- {
				-- equipPos = 3,
				-- minLevel = 60,
				-- maxLevel = 69,
				-- award = {
				         -- {type = 2,id = 0,count = 1000000} }--经验
			-- },
			-- --70-74的首饰（王者装备）
			-- {
				-- equipPos = 3,
				-- minLevel = 70,
				-- maxLevel = 74,
				-- award = {
				         -- {type = 2,id = 0,count = 3000000} }--经验
			-- },
			-- --75-79的首饰（虎威装备）
			-- {
				-- equipPos = 3,
				-- minLevel = 75,
				-- maxLevel = 79,
				-- award = {
				        -- {type = 2,id = 0,count = 6000000} }--经验
			-- },
			-- --80-84的首饰（主宰装备）
			-- {
				-- equipPos = 3,
				-- minLevel = 80,
				-- maxLevel = 84,
				-- award = {
				         -- {type = 2,id = 0,count = 12000000} }--经验
			-- },
			
			-- ------------------------------------
			-- ------------------------------------
			-- --1-9级武器（乌木剑）
			-- {
				-- equipPos = 1,
				-- minLevel = 1,
				-- maxLevel = 9,
				-- award = {
				         -- {type = 2,id = 0,count = 30000} }--经验
			-- },
			-- --10-19级武器（斩马刀）
			-- {
				-- equipPos = 1,
				-- minLevel = 10,
				-- maxLevel = 19,
				-- award = {
				         -- {type = 2,id = 0,count = 60000} }--经验
			-- },
			-- --20-39级武器（井中月）
			-- {
				-- equipPos = 1,
				-- minLevel = 20,
				-- maxLevel = 39,
				-- award = {
				         -- {type = 2,id = 0,count = 300000} }--经验
			-- },
			-- --40-49级武器（裁决之杖）
			-- {
				-- equipPos = 1,
				-- minLevel = 40,
				-- maxLevel = 49,
				-- award = {
				         -- {type = 2,id = 0,count = 600000} }--经验
			-- },
			-- --50-59级武器（怒斩）
			-- {
				-- equipPos = 1,
				-- minLevel = 50,
				-- maxLevel = 59,
				-- award = {
				         -- {type = 2,id = 0,count = 3000000}, --经验
					 -- {type = 46,id = 0,count = 100} }--符魄值
			-- },
			-- --60-69级武器（王者战刃）
			-- {
				-- equipPos = 1,
				-- minLevel = 60,
				-- maxLevel = 69,
				-- award = {
				         -- {type = 2,id = 0,count = 6000000}, --经验
					 -- {type = 46,id = 0,count = 200} }--符魄值
			-- },
			-- --70-79级武器（虎威战刃）
			-- {
				-- equipPos = 1,
				-- minLevel = 70,
				-- maxLevel = 79,
				-- award = {
				         -- {type = 2,id = 0,count = 12000000},--经验
					 -- {type = 46,id = 0,count = 400} }--符魄值
			-- },
			-- --80-89级武器（主宰神斩）
			-- {
				-- equipPos = 1,
				-- minLevel = 80,
				-- maxLevel = 89,
				-- award = {
				         -- {type = 2,id = 0,count = 24000000},--经验
					 -- {type = 46,id = 0,count = 800} }--符魄值
			-- },
			-- ------------------------------------
			-- ------------------------------------
			-- --1-9级衣服（布衣）
			-- {
				-- equipPos = 2,
				-- minLevel = 1,
				-- maxLevel = 9,
				-- award = {
				         -- {type = 2,id = 0,count = 20000} }--经验
			-- },
			-- --10-19级衣服（轻型盔甲）
			-- {
				-- equipPos = 2,
				-- minLevel = 10,
				-- maxLevel = 19,
				-- award = {
				         -- {type = 2,id = 0,count = 40000} }
			-- },
			-- --20-39级衣服（重盔甲）
			-- {
				-- equipPos = 2,
				-- minLevel = 20,
				-- maxLevel = 39,
				-- award = {
				         -- {type = 2,id = 0,count = 200000} }
			-- },
			-- --40-49级衣服（天魔神甲）
			-- {
				-- equipPos = 2,
				-- minLevel = 40,
				-- maxLevel = 49,
				-- award = {
				         -- {type = 2,id = 0,count = 400000} }
			-- },
			-- --50-59级衣服（雷霆战甲）
			-- {
				-- equipPos = 2,
				-- minLevel = 50,
				-- maxLevel = 59,
				-- award = {
				         -- {type = 2,id = 0,count = 2000000},---经验
					 -- {type = 46,id = 0,count = 100}}--符魄值
			-- },
			-- --60-69级衣服（王者战甲）
			-- {
				-- equipPos = 2,
				-- minLevel = 60,
				-- maxLevel = 69,
				-- award = {
				         -- {type = 2,id = 0,count = 4000000},---经验
					 -- {type = 46,id = 0,count = 200}}--符魄值
			-- },
			-- --70-79级衣服（虎威战甲）
			-- {
				-- equipPos = 2,
				-- minLevel = 70,
				-- maxLevel = 79,
				-- award = {
				         -- {type = 2,id = 0,count = 8000000},---经验
					 -- {type = 46,id = 0,count = 400}}--符魄值
			-- },
			-- --80-89级衣服（主宰战甲）
			-- {
				-- equipPos = 2,
				-- minLevel = 80,
				-- maxLevel = 89,
				-- award = {
				         -- {type = 2,id = 0,count = 16000000},---经验
					 -- {type = 46,id = 0,count = 800}}--符魄值
			-- },
			
				
                        -------------------------------------
		},

		--神装回收
		--GodEquip = 
		-- {
			-- {       --1转
				-- {
					-- equipPos = 1,  --武器
					-- circle = 1,    --1转
					-- award = {{type = 0,id = 718,count = 3,bind = 0},--龙纹碎片*3
					         -- {type = 0,id = 716,count = 0,bind = 0},
						 -- {type = 5,id = 0,count = 300000,bind = 0}},--绑金30万
				-- },
				-- {
					-- equipPos = 2,  --衣服
					-- circle = 1,    --1转
					-- award = {{type = 0,id = 718,count = 2,bind = 0},--龙纹碎片*2
					         -- {type = 0,id = 716,count = 0,bind = 0},
						 -- {type = 5,id = 0,count = 200000,bind = 0}},--绑金20万
				-- },
				
			-- },
			-- {       --2转
				-- {
					-- equipPos = 3,  --头盔
					-- circle = 2,    --2转
					-- award = {{type = 0,id = 718,count = 0,bind = 0},
					         -- {type = 5,id = 0,count = 100000,bind = 0},--绑金10万
					         -- {type = 0,id = 716,count = 2,bind = 0}},---神装碎片*2
				-- },
				-- {
					-- equipPos = 4,  --项链
					-- circle = 2,	--2转
					-- award = {{type = 0,id = 718,count = 0,bind = 0},
					         -- {type = 5,id = 0,count = 100000,bind = 0},--绑金10万
					         -- {type = 0,id = 716,count = 2,bind = 0}},---神装碎片*2
				-- },
				-- {
					-- equipPos = 6,  --手镯
					-- circle = 2,    --2转
					-- award = {{type = 0,id = 718,count = 0,bind = 0},
					         -- {type = 5,id = 0,count = 100000,bind = 0},--绑金10万
						 -- {type = 0,id = 716,count = 2,bind = 0}},---神装碎片*2
				-- },
				-- {
					-- equipPos = 7,  --戒指
					-- circle = 2,    --2转
					-- award = {{type = 0,id = 718,count = 0,bind = 0},
					         -- {type = 5,id = 0,count = 100000,bind = 0},--绑金10万
						 -- {type = 0,id = 716,count = 2,bind = 0}},---神装碎片*2
				-- },
				-- {
					-- equipPos = 8,  --腰带
					-- circle = 2,    --2转
					-- award = {{type = 0,id = 718,count = 2,bind = 0},----龙纹碎片*2
					         -- {type = 5,id = 0,count = 100000,bind = 0},--绑金10万
						 -- {type = 0,id = 716,count = 0,bind = 0}},
				-- },
				-- {
					-- equipPos = 9,  --鞋子
					-- circle = 2,    --2转
					-- award = {{type = 0,id = 718,count = 2,bind = 0},----龙纹碎片*2
					         -- {type = 5,id = 0,count = 100000,bind = 0},--绑金10万
						 -- {type = 0,id = 716,count = 0,bind = 0}},
				-- },
			-- },
			-- {       --3转
				-- {
					-- equipPos = 1,  --武器
					-- circle = 3,    --3转
					-- award = {{type = 0,id = 718,count = 9,bind = 0},---龙纹碎片*9
					         -- {type = 5,id = 0,count = 900000,bind = 0},--绑金90万
					         -- {type = 0,id = 716,count = 0,bind = 0}},
				-- },
				-- {
					-- equipPos = 2,  --衣服
					-- circle = 3,    --3转
					-- award = {{type = 0,id = 718,count = 6,bind = 0},--龙纹碎片*6
					         -- {type = 5,id = 0,count = 600000,bind = 0},--绑金60万
						 -- {type = 0,id = 716,count = 0,bind = 0}},
				-- },
				
			-- },
			-- {       --4转
				-- {
					-- equipPos = 3,  --头盔
					-- circle = 4,    --4转
					-- award = {{type = 0,id = 718,count = 0,bind = 0},
					         -- {type = 5,id = 0,count = 300000,bind = 0},--绑金30万
						 -- {type = 0,id = 716,count = 5,bind = 0}},---神装碎片*5
				-- },
				-- {
					-- equipPos = 4,  --项链
					-- circle = 4,	--4转
					-- award = {{type = 0,id = 718,count = 0,bind = 0},
					         -- {type = 5,id = 0,count = 300000,bind = 0},--绑金30万
						 -- {type = 0,id = 716,count = 5,bind = 0}},---神装碎片*5
				-- },
				-- {
					-- equipPos = 6,  --手镯
					-- circle = 4,    --4转
					-- award = {{type = 0,id = 718,count = 0,bind = 0},
					         -- {type = 5,id = 0,count = 300000,bind = 0},--绑金30万
						 -- {type = 0,id = 716,count = 5,bind = 0}},---神装碎片*5
				-- },
				-- {
					-- equipPos = 7,  --戒指
					-- circle = 4,    --4转
					-- award = {{type = 0,id = 718,count = 0,bind = 0},
					         -- {type = 5,id = 0,count = 300000,bind = 0},--绑金30万
						 -- {type = 0,id = 716,count = 5,bind = 0}},---神装碎片*5
				-- },
				-- {
					-- equipPos = 8,  --腰带
					-- circle = 4,    --4转
					-- award = {{type = 0,id = 718,count = 5,bind = 0},----龙纹碎片*5
					         -- {type = 5,id = 0,count = 300000,bind = 0},--绑金30万
						 -- {type = 0,id = 716,count = 0,bind = 0}},
				-- },
				-- {
					-- equipPos = 9,  --鞋子
					-- circle = 4,    --4转
					-- award = {{type = 0,id = 718,count = 5,bind = 0},----龙纹碎片*5
					         -- {type = 5,id = 0,count = 300000,bind = 0},--绑金30万
						 -- {type = 0,id = 716,count = 0,bind = 0}},
				-- },
			-- },
			-- {       --5转
				-- {
					-- equipPos = 1,  --武器
					-- circle = 5,    --5转
					-- award = {{type = 0,id = 718,count = 27,bind = 0},---龙纹碎片*27
					         -- {type = 5,id = 0,count = 2700000,bind = 0},--绑金270万
						 -- {type = 0,id = 716,count = 0,bind = 0}},
				-- },
				-- {
					-- equipPos = 2,  --衣服
					-- circle = 5,    --5转
					-- award = {{type = 0,id = 718,count = 18,bind = 0},--龙纹碎片*18
					         -- {type = 5,id = 0,count = 1800000,bind = 0},--绑金180万
						 -- {type = 0,id = 716,count = 0,bind = 0}},
				-- },
				
			-- },
			-- {       --6转
				-- {
					-- equipPos = 3,  --头盔
					-- circle = 6,    --6转
					-- award = {{type = 0,id = 718,count = 0,bind = 0},
					         -- {type = 5,id = 0,count = 900000,bind = 0},--绑金90万
						 -- {type = 0,id = 716,count = 15,bind = 0}},---神装碎片*15
				-- },
				-- {
					-- equipPos = 4,  --项链
					-- circle = 6,	--6转
					-- award = {{type = 0,id = 718,count = 0,bind = 0},
					         -- {type = 5,id = 0,count = 900000,bind = 0},--绑金90万
						 -- {type = 0,id = 716,count = 15,bind = 0}},---神装碎片*15
				-- },
				-- {
					-- equipPos = 6,  --手镯
					-- circle = 6,    --6转
					-- award = {{type = 0,id = 718,count = 0,bind = 0},
					         -- {type = 5,id = 0,count = 900000,bind = 0},--绑金90万
						 -- {type = 0,id = 716,count = 15,bind = 0}},---神装碎片*15
				-- },
				-- {
					-- equipPos = 7,  --戒指
					-- circle = 6,    --6转
					-- award = {{type = 0,id = 718,count = 0,bind = 0},
					         -- {type = 5,id = 0,count = 900000,bind = 0},--绑金90万
						 -- {type = 0,id = 716,count = 15,bind = 0}},---神装碎片*15
				-- },
				-- {
					-- equipPos = 8,  --腰带
					-- circle = 6,    --6转
					-- award = {{type = 0,id = 718,count = 15,bind = 0},----龙纹碎片*15
					         -- {type = 5,id = 0,count = 900000,bind = 0},--绑金90万
						 -- {type = 0,id = 716,count = 0,bind = 0}},
				-- },
				-- {
					-- equipPos = 9,  --鞋子
					-- circle = 6,    --6转
					-- award = {{type = 0,id = 718,count = 15,bind = 0},----龙纹碎片*15
					         -- {type = 5,id = 0,count = 900000,bind = 0},--绑金90万
						 -- {type = 0,id = 716,count = 0,bind = 0}},
				-- },
			-- },
			-- {       --7转
				-- {
					-- equipPos = 1,  --武器
					-- circle = 7,    --7转
					-- award = {{type = 0,id = 718,count = 81,bind = 0},---龙纹碎片*81
					         -- {type = 5,id = 0,count = 8100000,bind = 0},--绑金810万
						 -- {type = 0,id = 716,count = 0,bind = 0}},
				-- },
				-- {
					-- equipPos = 2,  --衣服
					-- circle = 7,    --7转
					-- award = {{type = 0,id = 718,count = 54,bind = 0},--龙纹碎片*54
					         -- {type = 5,id = 0,count = 5400000,bind = 0},--绑金540万
						 -- {type = 0,id = 716,count = 0,bind = 0}},
				-- },
				
			-- },
			-- {       --8转
				-- {
					-- equipPos = 3,  --头盔
					-- circle = 8,    --8转
					-- award = {{type = 0,id = 718,count = 0,bind = 0},
					         -- {type = 5,id = 0,count = 2700000,bind = 0},--绑金270万
						 -- {type = 0,id = 716,count = 45,bind = 0}},---神装碎片*45
				-- },
				-- {
					-- equipPos = 4,  --项链
					-- circle = 8,	--8转
					-- award = {{type = 0,id = 718,count = 0,bind = 0},
					         -- {type = 5,id = 0,count = 2700000,bind = 0},--绑金270万
						 -- {type = 0,id = 716,count = 45,bind = 0}},---神装碎片*45
				-- },
				-- {
					-- equipPos = 6,  --手镯
					-- circle = 8,    --8转
					-- award = {{type = 0,id = 718,count = 0,bind = 0},
					         -- {type = 5,id = 0,count = 2700000,bind = 0},--绑金270万
						 -- {type = 0,id = 716,count = 45,bind = 0}},---神装碎片*45
				-- },
				-- {
					-- equipPos = 7,  --戒指
					-- circle = 8,    --8转
					-- award = {{type = 0,id = 718,count = 0,bind = 0},
					         -- {type = 5,id = 0,count = 2700000,bind = 0},--绑金270万
						 -- {type = 0,id = 716,count = 45,bind = 0}},---神装碎片*45
				-- },
				-- {
					-- equipPos = 8,  --腰带
					-- circle = 8,    --8转
					-- award = {{type = 0,id = 718,count = 45,bind = 0},----龙纹碎片*45
					         -- {type = 5,id = 0,count = 2700000,bind = 0},--绑金270万
						 -- {type = 0,id = 716,count = 0,bind = 0}},
				-- },
				-- {
					-- equipPos = 9,  --鞋子
					-- circle = 8,    --8转
					-- award = {{type = 0,id = 718,count = 45,bind = 0},----龙纹碎片*45
					         -- {type = 5,id = 0,count = 2700000,bind = 0},--绑金270万
						 -- {type = 0,id = 716,count = 0,bind = 0}},
				-- },
			-- },
			-- {       --9转
				-- {
					-- equipPos = 1,  --武器
					-- circle = 9,    --9转
					-- award = {{type = 0,id = 718,count = 243,bind = 0},---龙纹碎片*243
					         -- {type = 5,id = 0,count = 24300000,bind = 0},--绑金2430万
						 -- {type = 0,id = 716,count = 0,bind = 0}},
				-- },
				-- {
					-- equipPos = 2,  --衣服
					-- circle = 9,    --9转
					-- award = {{type = 0,id = 718,count = 162,bind = 0},--龙纹碎片*162
					         -- {type = 5,id = 0,count = 16200000,bind = 0},--绑金1620万
						 -- {type = 0,id = 716,count = 0,bind = 0}},
				-- },
				
			-- },	
			-- {       --10转
				-- {
					-- equipPos = 3,  --头盔
					-- circle = 10,    --10转
					-- award = {{type = 0,id = 718,count = 0,bind = 0},
					         -- {type = 5,id = 0,count = 8100000,bind = 0},--绑金810万
						 -- {type = 0,id = 716,count = 135,bind = 0}},---神装碎片*135
				-- },
				-- {
					-- equipPos = 4,  --项链
					-- circle = 10,	--10转
					-- award = {{type = 0,id = 718,count = 0,bind = 0},
					         -- {type = 5,id = 0,count = 8100000,bind = 0},--绑金810万
						 -- {type = 0,id = 716,count = 135,bind = 0}},---神装碎片*135
				-- },
				-- {
					-- equipPos = 6,  --手镯
					-- circle = 10,    --10转
					-- award = {{type = 0,id = 718,count = 0,bind = 0},
					         -- {type = 5,id = 0,count = 8100000,bind = 0},--绑金810万
						 -- {type = 0,id = 716,count = 135,bind = 0}},---神装碎片*135
				-- },
				-- {
					-- equipPos = 7,  --戒指
					-- circle = 10,    --10转
					-- award = {{type = 0,id = 718,count = 0,bind = 0},
					         -- {type = 5,id = 0,count = 8100000,bind = 0},--绑金810万
						 -- {type = 0,id = 716,count = 135,bind = 0}},---神装碎片*135
				-- },
				-- {
					-- equipPos = 8,  --腰带
					-- circle = 10,    --10转
					-- award = {{type = 0,id = 718,count = 135,bind = 0},----龙纹碎片*135
					         -- {type = 5,id = 0,count = 8100000,bind = 0},--绑金810万
						 -- {type = 0,id = 716,count = 0,bind = 0}},
				-- },
				-- {
					-- equipPos = 9,  --鞋子
					-- circle = 10,    --10转
					-- award = {{type = 0,id = 718,count = 135,bind = 0},----龙纹碎片*135
					         -- {type = 5,id = 0,count = 8100000,bind = 0},--绑金810万
						 -- {type = 0,id = 716,count = 0,bind = 0}},
				-- },
			-- },
		-- },

		-----------------------------------------------------
		--神装材料兑换
		-----------------------------------------------------
		--GodEquipMaterialCfg = 
		-- {
			-- {
				-- consume = {{type=0,count=20,id=716}},
				-- award = {{type=0,count=1,id=717,bind=0}},
			-- },
			-- {
				-- consume = {{type=0,count=20,id=718}},
				-- award = {{type=0,count=1,id=719,bind=0}},
			-- },
		-- },

		--LightEquipMaterialCfg = 
		-- {
			-- {
				-- consume = {{type=0,count=20,id=721}},
				-- award = {{type=0,count=1,id=722,bind=0}},
			-- },
			-- {
				-- consume = {{type=0,count=20,id=723}},
				-- award = {{type=0,count=1,id=724,bind=0}},
			-- },
		-- }


	},

	EquipAlchemy = 
	{
		needAchemy = 100,		--需要多少点炼金值
		coolingTime = 3600,	--每次炼金需要多久冷却时间(秒)
		randomNum = {1,10},		--物品随机1~10个间
		awardId = {type = 0,id = 936},			--奖励的物品ID
		bossAwardDesc = "    <(c0xFFF07800)消灭><(c0xFF00FF00)山谷教主><(c0xFFF07800)可奖励:><(c0xFFFF0000)炼金值+2>\\    <(c0xFFF07800)消灭><(c0xFF00FF00)狮王教主><(c0xFFF07800)可奖励:><(c0xFFFF0000)炼金值+2>\\    <(c0xFFF07800)消灭><(c0xFF00FF00)地狱教主><(c0xFFF07800)可奖励:><(c0xFFFF0000)炼金值+2>\\    <(c0xFFF07800)消灭><(c0xFF00FF00)堕落教主><(c0xFFF07800)可奖励:><(c0xFFFF0000)炼金值+2>\\    <(c0xFFF07800)消灭><(c0xFF00FF00)混天教主><(c0xFFF07800)可奖励:><(c0xFFFF0000)炼金值+3>\\    <(c0xFFF07800)消灭><(c0xFF00FF00)祭坛教主><(c0xFFF07800)可奖励:><(c0xFFFF0000)炼金值+3>\\    <(c0xFFF07800)消灭><(c0xFF00FF00)红魔教主><(c0xFFF07800)可奖励:><(c0xFFFF0000)炼金值+3>\\    <(c0xFFF07800)消灭><(c0xFF00FF00)通天教主><(c0xFFF07800)可奖励:><(c0xFFFF0000)炼金值+3>\\    <(c0xFFF07800)消灭><(c0xFF00FF00)天幽教主><(c0xFFF07800)可奖励:><(c0xFFFF0000)炼金值+4>\\    <(c0xFFF07800)消灭><(c0xFF00FF00)玄晶教主><(c0xFFF07800)可奖励:><(c0xFFFF0000)炼金值+4>\\    <(c0xFFF07800)消灭><(c0xFF00FF00)忘魂教主><(c0xFFF07800)可奖励:><(c0xFFFF0000)炼金值+4>\\    <(c0xFFF07800)消灭><(c0xFF00FF00)巨蝠教主><(c0xFFF07800)可奖励:><(c0xFFFF0000)炼金值+4>\\    <(c0xFFF07800)消灭><(c0xFF00FF00)圣境教主><(c0xFFF07800)可奖励:><(c0xFFFF0000)炼金值+5>\\    <(c0xFFF07800)消灭><(c0xFF00FF00)拜月教主><(c0xFFF07800)可奖励:><(c0xFFFF0000)炼金值+5>\\    <(c0xFFF07800)消灭><(c0xFF00FF00)南疆教主><(c0xFFF07800)可奖励:><(c0xFFFF0000)炼金值+6>\\    <(c0xFFF07800)消灭><(c0xFF00FF00)金蝉教主><(c0xFFF07800)可奖励:><(c0xFFFF0000)炼金值+7>\\    <(c0xFFF07800)消灭><(c0xFF00FF00)邪剑教主><(c0xFFF07800)可奖励:><(c0xFFFF0000)炼金值+8>\\    <(c0xFFF07800)消灭><(c0xFF00FF00)天镜魔王><(c0xFFF07800)可奖励:><(c0xFFFF0000)炼金值+5>\\    <(c0xFFF07800)消灭><(c0xFF00FF00)烈天魔王><(c0xFFF07800)可奖励:><(c0xFFFF0000)炼金值+5>\\    <(c0xFFF07800)消灭><(c0xFF00FF00)九黎魔王><(c0xFFF07800)可奖励:><(c0xFFFF0000)炼金值+5>\\    <(c0xFFF07800)消灭><(c0xFF00FF00)迷失魔王><(c0xFFF07800)可奖励:><(c0xFFFF0000)炼金值+6>\\    <(c0xFFF07800)消灭><(c0xFF00FF00)重装使者><(c0xFFF07800)可奖励:><(c0xFFFF0000)炼金值+6>\\    <(c0xFFF07800)消灭><(c0xFF00FF00)冰翼魔王><(c0xFFF07800)可奖励:><(c0xFFFF0000)炼金值+7>\\    <(c0xFFF07800)消灭><(c0xFF00FF00)毒龙魔王><(c0xFFF07800)可奖励:><(c0xFFFF0000)炼金值+8>\\    <(c0xFFF07800)消灭><(c0xFF00FF00)圣境魔王><(c0xFFF07800)可奖励:><(c0xFFFF0000)炼金值+8>\\    <(c0xFFF07800)消灭><(c0xFF00FF00)灭神魔王><(c0xFFF07800)可奖励:><(c0xFFFF0000)炼金值+8>\\    <(c0xFFF07800)消灭><(c0xFF00FF00)梵天魔王><(c0xFFF07800)可奖励:><(c0xFFFF0000)炼金值+9>\\    <(c0xFFF07800)消灭><(c0xFF00FF00)阿修罗魔王><(c0xFFF07800)可奖励:><(c0xFFFF0000)炼金值+10>\\    <(c0xFFF07800)消灭><(c0xFF00FF00)帝释天魔王><(c0xFFF07800)可奖励:><(c0xFFFF0000)炼金值+11>\\",        --boss奖励描述
		equipAwardDesc = "    <(c0xFFF07800)回收><(c0xFF00FF00)1转武器><(c0xFFF07800)可奖励:><(c0xFFFF0000)炼金值+15>\\    <(c0xFFF07800)回收><(c0xFF00FF00)3转武器><(c0xFFF07800)可奖励:><(c0xFFFF0000)炼金值+30>\\    <(c0xFFF07800)回收><(c0xFF00FF00)5转武器><(c0xFFF07800)可奖励:><(c0xFFFF0000)炼金值+60>\\    <(c0xFFF07800)回收><(c0xFF00FF00)7转武器><(c0xFFF07800)可奖励:><(c0xFFFF0000)炼金值+120>\\\\<(idecoLine#200)>\\\\    <(c0xFFF07800)回收><(c0xFF00FF00)1转衣服><(c0xFFF07800)可奖励:><(c0xFFFF0000)炼金值+10>\\    <(c0xFFF07800)回收><(c0xFF00FF00)3转衣服><(c0xFFF07800)可奖励:><(c0xFFFF0000)炼金值+20>\\    <(c0xFFF07800)回收><(c0xFF00FF00)5转衣服><(c0xFFF07800)可奖励:><(c0xFFFF0000)炼金值+40>\\    <(c0xFFF07800)回收><(c0xFF00FF00)7转衣服><(c0xFFF07800)可奖励:><(c0xFFFF0000)炼金值+80>\\\\<(idecoLine#200)>\\\\    <(c0xFFF07800)回收><(c0xFF00FF00)2转首饰><(c0xFFF07800)可奖励:><(c0xFFFF0000)炼金值+5>\\    <(c0xFFF07800)回收><(c0xFF00FF00)4转首饰><(c0xFFF07800)可奖励:><(c0xFFFF0000)炼金值+10>\\    <(c0xFFF07800)回收><(c0xFF00FF00)6转首饰><(c0xFFF07800)可奖励:><(c0xFFFF0000)炼金值+20>\\    <(c0xFFF07800)回收><(c0xFF00FF00)8转首饰><(c0xFFF07800)可奖励:><(c0xFFFF0000)炼金值+40>\\",        --装备兑换描述
	},
}