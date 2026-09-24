--翅膀配置
SwingEquipConfig = {
    activeLevel = 31,
    givingSwing = 40, -- 激活所需的级别
    --freeTimes = 3,	-- 免费提升次数
    --OneUpExp = 100,	-- 每次提升的经验
    -- 1级羽毛=20元宝, 下一级羽毛 = 上一级元宝数*3
    --	YBUp = {20, 60, 180, 540};
    --	injectLevel = 86, -- 注魂需求等级
    -- 翅膀魂石·白虎,翅膀魂石·青龙,翅膀魂石·朱雀,翅膀魂石·玄武
    stones = {493, 494, 495, 496},
    
    --翅膀列表
    SwingEquipTable =
    {-- maxStones = {最多可注入翅膀魂石(攻), 最多可注入翅膀魂石(BOSS暴击值), 最多可注入翅膀魂石(BOSS暴击率)}
        -- starLv = {{最大次数, 每次数量}, {最大次数, 每次数量},...}
        {id = 684, appearance = 1, starLv = {{1, 150}}, consume = {type = 0, id = 464, yb = 10, count = 1}, needRideLevel = 0, allOptionsNum = 5, maxStones = {20, 20, 20, 20}, needLv = 40, }, --1阶翅膀:青麟之影
        {id = 685, appearance = 2, starLv = {{1, 250}}, consume = {type = 0, id = 464, yb = 10, count = 1}, needRideLevel = 0, allOptionsNum = 5, maxStones = {60, 60, 60, 60}, needLv = 42, }, --2阶翅膀:蓝凌之翼
        {id = 686, appearance = 3, starLv = {{1, 500}}, consume = {type = 0, id = 464, yb = 10, count = 1}, needRideLevel = 0, allOptionsNum = 5, maxStones = {100, 100, 100, 100}, needLv = 44, }, --3阶翅膀:月影战翼
        {id = 687, appearance = 4, starLv = {{1, 800}}, consume = {type = 0, id = 464, yb = 10, count = 1}, needRideLevel = 0, allOptionsNum = 5, maxStones = {140, 140, 140, 140}, needLv = 46, }, --4阶翅膀:魅影羽翼
        {id = 688, appearance = 5, starLv = {{1, 1300}}, consume = {type = 0, id = 464, yb = 10, count = 1}, needRideLevel = 0, allOptionsNum = 5, maxStones = {180, 180, 180, 180}, needLv = 48, }, --5阶翅膀:冥凤神翼
        {id = 689, appearance = 6, starLv = {{1, 600}}, consume = {type = 0, id = 465, yb = 30, count = 1}, needRideLevel = 0, allOptionsNum = 5, maxStones = {220, 220, 220, 220}, needLv = 50, }, --6阶翅膀:丝光之翼
        {id = 690, appearance = 7, starLv = {{1, 833}}, consume = {type = 0, id = 465, yb = 30, count = 1}, needRideLevel = 0, allOptionsNum = 5, maxStones = {260, 260, 260, 260}, needLv = 52, }, --7阶翅膀:羽蝶神翼
        {id = 691, appearance = 8, starLv = {{1, 1067}}, consume = {type = 0, id = 465, yb = 30, count = 1}, needRideLevel = 0, allOptionsNum = 5, maxStones = {300, 300, 300, 300}, needLv = 54, }, --8阶翅膀:金幻之翼
        {id = 692, appearance = 9, starLv = {{1, 1267}}, consume = {type = 0, id = 465, yb = 30, count = 1}, needRideLevel = 0, allOptionsNum = 5, maxStones = {340, 340, 340, 340}, needLv = 56, }, --9阶翅膀:虹彩灵翼
        {id = 693, appearance = 10, starLv = {{1, 1400}}, consume = {type = 0, id = 465, yb = 30, count = 1}, needRideLevel = 0, allOptionsNum = 5, maxStones = {380, 380, 380, 380}, needLv = 58, }, --10阶翅膀:旋凌仙翼
        {id = 694, appearance = 11, starLv = {{1, 110}}, consume = {type = 0, id = 466, yb = 90, count = 1}, needRideLevel = 0, allOptionsNum = 5, maxStones = {440, 440, 440, 440}, needLv = 60, }, --11阶翅膀:旋凌仙翼

        {id = 695, appearance = 12, starLv = {{5, 22}, {5, 22}, {5, 22}, {5, 22}, {5, 22}, {5, 22}, {5, 22}, {5, 22}, {5, 22}, {5, 22}, }, consume = {type = 0, id = 466, yb = 90, count = 1}, needRideLevel = 0, allOptionsNum = 5, maxStones = {460, 460, 460, 460}, needLv = 62, }, --12阶翅膀:魔龙神翼
        {id = 696, appearance = 13, starLv = {{5, 29}, {5, 29}, {5, 29}, {5, 29}, {5, 29}, {5, 29}, {5, 29}, {5, 29}, {5, 29}, {5, 29}, }, consume = {type = 0, id = 466, yb = 90, count = 1}, needRideLevel = 0, allOptionsNum = 5, maxStones = {500, 500, 500, 500}, needLv = 64, }, --13阶翅膀:魅魔神翼
        {id = 697, appearance = 14, starLv = {{5, 38}, {5, 38}, {5, 38}, {5, 38}, {5, 38}, {5, 38}, {5, 38}, {5, 38}, {5, 38}, {5, 38}, }, consume = {type = 0, id = 466, yb = 90, count = 1}, needRideLevel = 0, allOptionsNum = 5, maxStones = {540, 540, 540, 540}, needLv = 66, }, --14阶翅膀:紫翔灵翼
        {id = 698, appearance = 15, starLv = {{5, 49}, {5, 49}, {5, 49}, {5, 49}, {5, 49}, {5, 49}, {5, 49}, {5, 49}, {5, 49}, {5, 49}, }, consume = {type = 0, id = 466, yb = 90, count = 1}, needRideLevel = 0, allOptionsNum = 5, maxStones = {580, 580, 580, 580}, needLv = 68, }, --15阶翅膀:赤霞灵翼
        {id = 699, appearance = 16, starLv = {{10, 11}, {10, 11}, {10, 11}, {10, 11}, {10, 11}, {10, 11}, {10, 11}, {10, 11}, {10, 11}, {10, 11}, }, consume = {type = 0, id = 467, yb = 270, count = 1}, needRideLevel = 0, allOptionsNum = 5, maxStones = {620, 620, 620, 620}, needLv = 70, }, --16阶翅膀:暗侠灵翼
        {id = 700, appearance = 17, starLv = {{10, 13}, {10, 13}, {10, 13}, {10, 13}, {10, 13}, {10, 13}, {10, 13}, {10, 13}, {10, 13}, {10, 13}, }, consume = {type = 0, id = 467, yb = 270, count = 1}, needRideLevel = 0, allOptionsNum = 5, maxStones = {660, 660, 660, 660}, needLv = 72, }, --17阶翅膀:幻神灵翼
        {id = 701, appearance = 18, starLv = {{10, 16}, {10, 16}, {10, 16}, {10, 16}, {10, 16}, {10, 16}, {10, 16}, {10, 16}, {10, 16}, {10, 16}, }, consume = {type = 0, id = 467, yb = 270, count = 1}, needRideLevel = 0, allOptionsNum = 5, maxStones = {700, 700, 700, 700}, needLv = 74, }, --18阶翅膀:修罗仙翼
        {id = 702, appearance = 19, starLv = {{10, 19}, {10, 19}, {10, 19}, {10, 19}, {10, 19}, {10, 19}, {10, 19}, {10, 19}, {10, 19}, {10, 19}, }, consume = {type = 0, id = 467, yb = 270, count = 1}, needRideLevel = 0, allOptionsNum = 5, maxStones = {740, 740, 740, 740}, needLv = 76, }, --19阶翅膀:垂天仙翼
        {id = 703, appearance = 20, starLv = {{10, 23}, {10, 23}, {10, 23}, {10, 23}, {10, 23}, {10, 23}, {10, 23}, {10, 23}, {10, 23}, {10, 23}, }, consume = {type = 0, id = 467, yb = 270, count = 1}, needRideLevel = 0, allOptionsNum = 5, maxStones = {780, 780, 780, 780}, needLv = 78, }, --20阶翅膀:诛神仙翼
        {id = 704, appearance = 21, starLv = {{10, 9}, {10, 9}, {10, 9}, {10, 9}, {10, 9}, {10, 9}, {10, 9}, {10, 9}, {10, 9}, {10, 9}, }, consume = {type = 0, id = 468, yb = 810, count = 1}, needRideLevel = 0, allOptionsNum = 5, maxStones = {820, 820, 820, 820}, needLv = 80, }, --21阶翅膀:玄天圣灵翼
        {id = 705, appearance = 22, starLv = {{10, 11}, {10, 11}, {10, 11}, {10, 11}, {10, 11}, {10, 11}, {10, 11}, {10, 11}, {10, 11}, {10, 11}, }, consume = {type = 0, id = 468, yb = 810, count = 1}, needRideLevel = 0, allOptionsNum = 5, maxStones = {860, 860, 860, 860}, needLv = 82, }, --22阶翅膀:凰雀朱炎翼
        {id = 706, appearance = 23, starLv = {{10, 12}, {10, 12}, {10, 12}, {10, 12}, {10, 12}, {10, 12}, {10, 12}, {10, 12}, {10, 12}, {10, 12}, }, consume = {type = 0, id = 468, yb = 810, count = 1}, needRideLevel = 0, allOptionsNum = 5, maxStones = {900, 900, 900, 900}, needLv = 84, }, --23阶翅膀:帝仙神武翼
        {id = 707, appearance = 24, starLv = {{10, 14}, {10, 14}, {10, 14}, {10, 14}, {10, 14}, {10, 14}, {10, 14}, {10, 14}, {10, 14}, {10, 14}, }, consume = {type = 0, id = 468, yb = 810, count = 1}, needRideLevel = 0, allOptionsNum = 5, maxStones = {940, 940, 940, 940}, needLv = 86, }, --24阶翅膀:圣武神威翼
        {id = 708, appearance = 25, starLv = {{10, 16}, {10, 16}, {10, 16}, {10, 16}, {10, 16}, {10, 16}, {10, 16}, {10, 16}, {10, 16}, {10, 16}, }, consume = {type = 0, id = 468, yb = 810, count = 1}, needRideLevel = 0, allOptionsNum = 5, maxStones = {2000, 2000, 2000, 2000}, needLv = 88, }, --25阶翅膀:至尊圣威翼
    
    },
	--翅膀刻印
	SwingEquip_KEYIN = 
	{
		--maxCanKeYin最大的刻印储量,cousume刻印消费,rate刻印所正价的万分比
		{swingLevel=10,maxCanKeYin=5,consume = {type = 0, id = 464, count = 50	,yb=10},rate ={20,40,60,80,100}},
		{swingLevel=11,maxCanKeYin=10,consume = {type = 0, id = 464, count = 80	,yb=10},rate ={140,180,220,260,300}},
		{swingLevel=12,maxCanKeYin=15,consume = {type = 0, id = 464, count = 128,yb=10},rate ={360,420,480,540,600}},
		{swingLevel=13,maxCanKeYin=20,consume = {type = 0, id = 465, count = 108,yb=30},rate ={680,760,840,920,1000}},
		{swingLevel=14,maxCanKeYin=25,consume = {type = 0, id = 465, count = 168,yb=30},rate ={1100,1200,1300,1400,1500}},
		{swingLevel=15,maxCanKeYin=30,consume = {type = 0, id = 465, count = 300,yb=30},rate ={1610,1720,1830,1940,2050}},
		{swingLevel=16,maxCanKeYin=35,consume = {type = 0, id = 466, count = 120,yb=90},rate ={2170,2290,2410,2530,2650}},
		{swingLevel=17,maxCanKeYin=40,consume = {type = 0, id = 466, count = 140,yb=90},rate ={2780,2910,3040,3170,3300}},
		{swingLevel=18,maxCanKeYin=45,consume = {type = 0, id = 466, count = 160,yb=90},rate ={3440,3580,3720,3860,4000}},
		{swingLevel=19,maxCanKeYin=50,consume = {type = 0, id = 466, count = 180,yb=90},rate ={4150,4300,4450,4600,4750}},
		{swingLevel=20,maxCanKeYin=55,consume = {type = 0, id = 466, count = 200,yb=90},rate ={4910,5070,5230,5390,5550}},
		{swingLevel=21,maxCanKeYin=60,consume = {type = 0, id = 466, count = 230,yb=90},rate ={5720,5890,6060,6230,6400}},
		{swingLevel=22,maxCanKeYin=65,consume = {type = 0, id = 466, count = 268,yb=90},rate ={6580,6760,6940,7120,7300}},
		{swingLevel=23,maxCanKeYin=70,consume = {type = 0, id = 466, count = 300,yb=90},rate ={7490,7680,7870,8060,8250}},
		{swingLevel=24,maxCanKeYin=75,consume = {type = 0, id = 466, count = 338,yb=90},rate ={8450,8650,8850,9050,9250}},
		{swingLevel=25,maxCanKeYin=80,consume = {type = 0, id = 466, count = 398,yb=90},rate ={9460,9670,9880,10090,10300}},
	},
	
	--翅膀装备
	SwingEquipment =
	{
		ItemAttr=
		{
			--羽骨
			{
				id={6983,6984,6985,6986,6987}, --物品id
			},
			--羽骨
			{
				id={6988,6989,6990,6991,6992}, --物品id
			},
			--羽骨
			{
				id={6993,6994,6995,6996,6997}, --物品id
			},
			--羽骨
			{
				id={6998,6999,7000,7001,7002}, --物品id
			},
		},
		
		--套装属性
		SuitAttr =
		{
			--全部1阶
			{
				{type = 9,value = 1180,job =1},
				{type = 11,value = 1180,job =1},
				{type = 13,value = 1180,job =2},
				{type = 15,value = 1180,job =2},
				{type = 17,value = 1180,job =3},
				{type = 19,value = 1180,job =3},
				{type = 21,value = 280,job =0},
				{type = 23,value = 280,job =0},
				{type = 25,value = 280,job =0},
				{type = 27,value = 280,job =0},
				{type = 161,value = 100,job =0},
				{type = 163,value = 100,job =0},
				{type = 165,value = 100,job =0},
				{type = 172,value = 100,job =0},
				{type = 173,value = 100,job =0},

			},
			--全部2阶
			{
				{type = 9,value = 2680,job =1},
				{type = 11,value = 2680,job =1},
				{type = 13,value = 2680,job =2},
				{type = 15,value = 2680,job =2},
				{type = 17,value = 2680,job =3},
				{type = 19,value = 2680,job =3},
				{type = 21,value = 580,job =0},
				{type = 23,value = 580,job =0},
				{type = 25,value = 580,job =0},
				{type = 27,value = 580,job =0},
				{type = 161,value = 200,job =0},
				{type = 163,value = 200,job =0},
				{type = 165,value = 200,job =0},
				{type = 172,value = 150,job =0},
				{type = 173,value = 150,job =0},
			},
			--全部3阶
			{
				{type = 9,value = 5680,job =1},
				{type = 11,value = 5680,job =1},
				{type = 13,value = 5680,job =2},
				{type = 15,value = 5680,job =2},
				{type = 17,value = 5680,job =3},
				{type = 19,value = 5680,job =3},
				{type = 21,value = 1080,job =0},
				{type = 23,value = 1080,job =0},
				{type = 25,value = 1080,job =0},
				{type = 27,value = 1080,job =0},
				{type = 161,value = 300,job =0},
				{type = 163,value = 300,job =0},
				{type = 165,value = 300,job =0},
				{type = 172,value = 200,job =0},
				{type = 173,value = 200,job =0},
			},
			--全部4阶
			{
				{type = 9,value = 11800,job =1},
				{type = 11,value = 11800,job =1},
				{type = 13,value = 11800,job =2},
				{type = 15,value = 11800,job =2},
				{type = 17,value = 11800,job =3},
				{type = 19,value = 11800,job =3},
				{type = 21,value = 2280,job =0},
				{type = 23,value = 2280,job =0},
				{type = 25,value = 2280,job =0},
				{type = 27,value = 2280,job =0},
				{type = 161,value = 400,job =0},
				{type = 163,value = 400,job =0},
				{type = 165,value = 400,job =0},
				{type = 172,value = 250,job =0},
				{type = 173,value = 250,job =0},
			},
			--全部5阶
			{
				{type = 9,value = 25800,job =1},
				{type = 11,value = 25800,job =1},
				{type = 13,value = 25800,job =2},
				{type = 15,value = 25800,job =2},
				{type = 17,value = 25800,job =3},
				{type = 19,value = 25800,job =3},
				{type = 21,value = 5080,job =0},
				{type = 23,value = 5080,job =0},
				{type = 25,value = 5080,job =0},
				{type = 27,value = 5080,job =0},
				{type = 161,value = 500,job =0},
				{type = 163,value = 500,job =0},
				{type = 165,value = 500,job =0},
				{type = 172,value = 300,job =0},
				{type = 173,value = 300,job =0},
			},
		
		
		}
		
	
	}
}
