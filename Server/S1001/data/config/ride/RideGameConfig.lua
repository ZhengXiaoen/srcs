
--坐骑系统配置
RideGameConfig = 
{
	openLevel = 80,
	ridePillId = 6862, -- 坐骑丹
	ridePillPrice = 100, -- 坐骑丹价格（元宝）
	ridePillExp = 10, -- 每个坐骑丹经验
	
	-- 坐骑外观(每阶一个)
	rideAppearances = {35,37,39,41,43,45,47,49,51,53},
	
	-- 坐骑名称(每阶一个)
	rideNames = {"黑影的卢", "银灵战马", "紫金战虎", "幻灵仙狐", "炼狱蝎王", "烈炎龍王", "幻影虎王", "飞天狻猊", "神兽麒麟", "九天凤凰", },
	
	-- 坐骑装备(因为存的是索引，所以新加的放在最后)
	equips = {
		-- 马鞍(因为存的是索引，所以新加的放在最后)
		{6865,6869,6873,6877,6881},
		-- 挂件(因为存的是索引，所以新加的放在最后)
		{6866,6870,6874,6878,6882},
		-- 脚蹬(因为存的是索引，所以新加的放在最后)
		{6867,6871,6875,6879,6883},
		-- 缰绳(因为存的是索引，所以新加的放在最后)
		{6868,6872,6876,6880,6884},
	},
	
	-- 套装属性
	suitAttrs = {
		-- 1 阶套装属性
		{
            {type=11, job = 1, value=280},     --最大物理攻击
            {type=5, job = 0, value=10000},    --生命
            {type=169, job = 0, value=100},      --神圣一击率
            {type=170, job = 0, value=2080},   --神圣一击伤害
            {type=15, job = 2, value=280},     --最大魔法攻击
            {type=19, job = 3, value=280},     --最大道术攻击
    },
		-- 2 阶套装属性
		{
            {type=11, job = 1, value=520},     --最大物理攻击
            {type=5, job = 0, value=20000},    --生命
            {type=169, job = 0, value=200},      --神圣一击率
            {type=170, job = 0, value=4800},   --神圣一击伤害
            {type=15, job = 2, value=520},     --最大魔法攻击
            {type=19, job = 3, value=520},     --最大道术攻击
    },
		-- 3 阶套装属性
		{
            {type=11, job = 1, value=1280},     --最大物理攻击
            {type=5, job = 0, value=35000},    --生命
            {type=169, job = 0, value=300},      --神圣一击率
            {type=170, job = 0, value=9800},   --神圣一击伤害
            {type=15, job = 2, value=1280},     --最大魔法攻击
            {type=19, job = 3, value=1280},     --最大道术攻击
    },
		-- 4 阶套装属性
		{
            {type=11, job = 1, value=2280},     --最大物理攻击
            {type=5, job = 0, value=50000},    --生命
            {type=169, job = 0, value=400},      --神圣一击率
            {type=170, job = 0, value=15800},   --神圣一击伤害
            {type=15, job = 2, value=2280},     --最大魔法攻击
            {type=19, job = 3, value=2280},     --最大道术攻击
    },
		-- 5 阶套装属性
		{
            {type=11, job = 1, value=3580},     --最大物理攻击
            {type=5, job = 0, value=70000},    --生命
            {type=169, job = 0, value=500},      --神圣一击率
            {type=170, job = 0, value=22800},   --神圣一击伤害
            {type=15, job = 2, value=3580},     --最大魔法攻击
            {type=19, job = 3, value=3580},     --最大道术攻击
    },
	},
	
	-- 每11级1阶
	levels = {
	-- 1级
    {
         itemCount = 1, -- 每次扣坐骑丹的数量
         maxExp = 100, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=27},--最小物攻
                   {type=11, job = 1, value=68},--最大物攻
                   {type=5, job = 0, value=480},--生命
                   {type=21, job = 0, value=5},--最小物防
                   {type=23, job = 0, value=12},--最大物防
                   {type=25, job = 0, value=5},--最小魔防
                   {type=27, job = 0, value=12},--最大魔防
                   {type=128, job = 0, value=0},--暴击几率
                   {type=129, job = 0, value=0},--暴击伤害
                   {type=49, job = 0, value=0},--坐骑移动速度 初始移动速度为400
                   {type=13, job = 2, value=27},--最小魔攻
                   {type=15, job = 2, value=68},--最大魔攻
                   {type=17, job = 3, value=27},--最小道攻
                   {type=19, job = 3, value=68},--最大道攻
                 },
     },
-- 2级
    {
         itemCount = 1, -- 每次扣坐骑丹的数量
         maxExp = 100, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=64},--最小物攻
                   {type=11, job = 1, value=160},--最大物攻
                   {type=5, job = 0, value=950},--生命
                   {type=21, job = 0, value=8},--最小物防
                   {type=23, job = 0, value=19},--最大物防
                   {type=25, job = 0, value=8},--最小魔防
                   {type=27, job = 0, value=19},--最大魔防
                   {type=128, job = 0, value=10},--暴击几率
                   {type=129, job = 0, value=228},--暴击伤害
                   {type=49, job = 0, value=-1.2},--坐骑移动速度 初始移动速度为400
                   {type=13, job = 2, value=64},--最小魔攻
                   {type=15, job = 2, value=160},--最大魔攻
                   {type=17, job = 3, value=64},--最小道攻
                   {type=19, job = 3, value=160},--最大道攻
                 },
     },
-- 3级
    {
         itemCount = 1, -- 每次扣坐骑丹的数量
         maxExp = 100, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=111},--最小物攻
                   {type=11, job = 1, value=278},--最大物攻
                   {type=5, job = 0, value=1650},--生命
                   {type=21, job = 0, value=13},--最小物防
                   {type=23, job = 0, value=33},--最大物防
                   {type=25, job = 0, value=13},--最小魔防
                   {type=27, job = 0, value=33},--最大魔防
                   {type=128, job = 0, value=20},--暴击几率
                   {type=129, job = 0, value=396},--暴击伤害
                   {type=49, job = 0, value=-2.4},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=111},--最小魔攻
                   {type=15, job = 2, value=278},--最大魔攻
                   {type=17, job = 3, value=111},--最小道攻
                   {type=19, job = 3, value=278},--最大道攻
                 },
     },
-- 4级
    {
         itemCount = 1, -- 每次扣坐骑丹的数量
         maxExp = 100, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=158},--最小物攻
                   {type=11, job = 1, value=396},--最大物攻
                   {type=5, job = 0, value=2350},--生命
                   {type=21, job = 0, value=19},--最小物防
                   {type=23, job = 0, value=47},--最大物防
                   {type=25, job = 0, value=19},--最小魔防
                   {type=27, job = 0, value=47},--最大魔防
                   {type=128, job = 0, value=30},--暴击几率
                   {type=129, job = 0, value=564},--暴击伤害
                   {type=49, job = 0, value=-3.6},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=158},--最小魔攻
                   {type=15, job = 2, value=396},--最大魔攻
                   {type=17, job = 3, value=158},--最小道攻
                   {type=19, job = 3, value=396},--最大道攻
                 },
     },
-- 5级
    {
         itemCount = 2, -- 每次扣坐骑丹的数量
         maxExp = 200, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=205},--最小物攻
                   {type=11, job = 1, value=514},--最大物攻
                   {type=5, job = 0, value=3050},--生命
                   {type=21, job = 0, value=24},--最小物防
                   {type=23, job = 0, value=61},--最大物防
                   {type=25, job = 0, value=24},--最小魔防
                   {type=27, job = 0, value=61},--最大魔防
                   {type=128, job = 0, value=40},--暴击几率
                   {type=129, job = 0, value=732},--暴击伤害
                   {type=49, job = 0, value=-4.8},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=205},--最小魔攻
                   {type=15, job = 2, value=514},--最大魔攻
                   {type=17, job = 3, value=205},--最小道攻
                   {type=19, job = 3, value=514},--最大道攻
                 },
     },
-- 6级
    {
         itemCount = 2, -- 每次扣坐骑丹的数量
         maxExp = 200, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=252},--最小物攻
                   {type=11, job = 1, value=632},--最大物攻
                   {type=5, job = 0, value=3750},--生命
                   {type=21, job = 0, value=30},--最小物防
                   {type=23, job = 0, value=75},--最大物防
                   {type=25, job = 0, value=30},--最小魔防
                   {type=27, job = 0, value=75},--最大魔防
                   {type=128, job = 0, value=50},--暴击几率
                   {type=129, job = 0, value=900},--暴击伤害
                   {type=49, job = 0, value=-6},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=252},--最小魔攻
                   {type=15, job = 2, value=632},--最大魔攻
                   {type=17, job = 3, value=252},--最小道攻
                   {type=19, job = 3, value=632},--最大道攻
                 },
     },
-- 7级
    {
         itemCount = 2, -- 每次扣坐骑丹的数量
         maxExp = 200, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=299},--最小物攻
                   {type=11, job = 1, value=750},--最大物攻
                   {type=5, job = 0, value=4450},--生命
                   {type=21, job = 0, value=36},--最小物防
                   {type=23, job = 0, value=89},--最大物防
                   {type=25, job = 0, value=36},--最小魔防
                   {type=27, job = 0, value=89},--最大魔防
                   {type=128, job = 0, value=60},--暴击几率
                   {type=129, job = 0, value=1068},--暴击伤害
                   {type=49, job = 0, value=-7.2},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=299},--最小魔攻
                   {type=15, job = 2, value=750},--最大魔攻
                   {type=17, job = 3, value=299},--最小道攻
                   {type=19, job = 3, value=750},--最大道攻
                 },
     },
-- 8级
    {
         itemCount = 2, -- 每次扣坐骑丹的数量
         maxExp = 200, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=346},--最小物攻
                   {type=11, job = 1, value=868},--最大物攻
                   {type=5, job = 0, value=5150},--生命
                   {type=21, job = 0, value=41},--最小物防
                   {type=23, job = 0, value=103},--最大物防
                   {type=25, job = 0, value=41},--最小魔防
                   {type=27, job = 0, value=103},--最大魔防
                   {type=128, job = 0, value=70},--暴击几率
                   {type=129, job = 0, value=1236},--暴击伤害
                   {type=49, job = 0, value=-8.4},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=346},--最小魔攻
                   {type=15, job = 2, value=868},--最大魔攻
                   {type=17, job = 3, value=346},--最小道攻
                   {type=19, job = 3, value=868},--最大道攻
                 },
     },
-- 9级
    {
         itemCount = 2, -- 每次扣坐骑丹的数量
         maxExp = 200, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=393},--最小物攻
                   {type=11, job = 1, value=986},--最大物攻
                   {type=5, job = 0, value=5850},--生命
                   {type=21, job = 0, value=47},--最小物防
                   {type=23, job = 0, value=117},--最大物防
                   {type=25, job = 0, value=47},--最小魔防
                   {type=27, job = 0, value=117},--最大魔防
                   {type=128, job = 0, value=80},--暴击几率
                   {type=129, job = 0, value=1404},--暴击伤害
                   {type=49, job = 0, value=-9.6},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=393},--最小魔攻
                   {type=15, job = 2, value=986},--最大魔攻
                   {type=17, job = 3, value=393},--最小道攻
                   {type=19, job = 3, value=986},--最大道攻
                 },
     },
-- 10级
    {
         itemCount = 2, -- 每次扣坐骑丹的数量
         maxExp = 200, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=440},--最小物攻
                   {type=11, job = 1, value=1104},--最大物攻
                   {type=5, job = 0, value=6550},--生命
                   {type=21, job = 0, value=52},--最小物防
                   {type=23, job = 0, value=131},--最大物防
                   {type=25, job = 0, value=52},--最小魔防
                   {type=27, job = 0, value=131},--最大魔防
                   {type=128, job = 0, value=90},--暴击几率
                   {type=129, job = 0, value=1572},--暴击伤害
                   {type=49, job = 0, value=-10.8},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=440},--最小魔攻
                   {type=15, job = 2, value=1104},--最大魔攻
                   {type=17, job = 3, value=440},--最小道攻
                   {type=19, job = 3, value=1104},--最大道攻
                 },
     },
-- 11级
    {
         itemCount = 4, -- 每次扣坐骑丹的数量
         maxExp = 400, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=487},--最小物攻
                   {type=11, job = 1, value=1222},--最大物攻
                   {type=5, job = 0, value=7250},--生命
                   {type=21, job = 0, value=58},--最小物防
                   {type=23, job = 0, value=145},--最大物防
                   {type=25, job = 0, value=58},--最小魔防
                   {type=27, job = 0, value=145},--最大魔防
                   {type=128, job = 0, value=100},--暴击几率
                   {type=129, job = 0, value=1740},--暴击伤害
                   {type=49, job = 0, value=-12},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=487},--最小魔攻
                   {type=15, job = 2, value=1222},--最大魔攻
                   {type=17, job = 3, value=487},--最小道攻
                   {type=19, job = 3, value=1222},--最大道攻
                 },
     },
-- 12级
    {
         itemCount = 4, -- 每次扣坐骑丹的数量
         maxExp = 400, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=551},--最小物攻
                   {type=11, job = 1, value=1380},--最大物攻
                   {type=5, job = 0, value=8200},--生命
                   {type=21, job = 0, value=66},--最小物防
                   {type=23, job = 0, value=164},--最大物防
                   {type=25, job = 0, value=66},--最小魔防
                   {type=27, job = 0, value=164},--最大魔防
                   {type=128, job = 0, value=110},--暴击几率
                   {type=129, job = 0, value=1968},--暴击伤害
                   {type=49, job = 0, value=-13.2},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=551},--最小魔攻
                   {type=15, job = 2, value=1380},--最大魔攻
                   {type=17, job = 3, value=551},--最小道攻
                   {type=19, job = 3, value=1380},--最大道攻
                 },
     },
-- 13级
    {
         itemCount = 4, -- 每次扣坐骑丹的数量
         maxExp = 400, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=615},--最小物攻
                   {type=11, job = 1, value=1538},--最大物攻
                   {type=5, job = 0, value=9150},--生命
                   {type=21, job = 0, value=73},--最小物防
                   {type=23, job = 0, value=183},--最大物防
                   {type=25, job = 0, value=73},--最小魔防
                   {type=27, job = 0, value=183},--最大魔防
                   {type=128, job = 0, value=120},--暴击几率
                   {type=129, job = 0, value=2196},--暴击伤害
                   {type=49, job = 0, value=-14.4},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=615},--最小魔攻
                   {type=15, job = 2, value=1538},--最大魔攻
                   {type=17, job = 3, value=615},--最小道攻
                   {type=19, job = 3, value=1538},--最大道攻
                 },
     },
-- 14级
    {
         itemCount = 4, -- 每次扣坐骑丹的数量
         maxExp = 400, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=679},--最小物攻
                   {type=11, job = 1, value=1696},--最大物攻
                   {type=5, job = 0, value=10100},--生命
                   {type=21, job = 0, value=81},--最小物防
                   {type=23, job = 0, value=202},--最大物防
                   {type=25, job = 0, value=81},--最小魔防
                   {type=27, job = 0, value=202},--最大魔防
                   {type=128, job = 0, value=130},--暴击几率
                   {type=129, job = 0, value=2424},--暴击伤害
                   {type=49, job = 0, value=-15.6},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=679},--最小魔攻
                   {type=15, job = 2, value=1696},--最大魔攻
                   {type=17, job = 3, value=679},--最小道攻
                   {type=19, job = 3, value=1696},--最大道攻
                 },
     },
-- 15级
    {
         itemCount = 4, -- 每次扣坐骑丹的数量
         maxExp = 400, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=742},--最小物攻
                   {type=11, job = 1, value=1854},--最大物攻
                   {type=5, job = 0, value=11050},--生命
                   {type=21, job = 0, value=88},--最小物防
                   {type=23, job = 0, value=221},--最大物防
                   {type=25, job = 0, value=88},--最小魔防
                   {type=27, job = 0, value=221},--最大魔防
                   {type=128, job = 0, value=140},--暴击几率
                   {type=129, job = 0, value=2652},--暴击伤害
                   {type=49, job = 0, value=-16.8},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=742},--最小魔攻
                   {type=15, job = 2, value=1854},--最大魔攻
                   {type=17, job = 3, value=742},--最小道攻
                   {type=19, job = 3, value=1854},--最大道攻
                 },
     },
-- 16级
    {
         itemCount = 5, -- 每次扣坐骑丹的数量
         maxExp = 800, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=806},--最小物攻
                   {type=11, job = 1, value=2012},--最大物攻
                   {type=5, job = 0, value=12000},--生命
                   {type=21, job = 0, value=96},--最小物防
                   {type=23, job = 0, value=240},--最大物防
                   {type=25, job = 0, value=96},--最小魔防
                   {type=27, job = 0, value=240},--最大魔防
                   {type=128, job = 0, value=150},--暴击几率
                   {type=129, job = 0, value=2880},--暴击伤害
                   {type=49, job = 0, value=-18},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=806},--最小魔攻
                   {type=15, job = 2, value=2012},--最大魔攻
                   {type=17, job = 3, value=806},--最小道攻
                   {type=19, job = 3, value=2012},--最大道攻
                 },
     },
-- 17级
    {
         itemCount = 5, -- 每次扣坐骑丹的数量
         maxExp = 800, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=870},--最小物攻
                   {type=11, job = 1, value=2170},--最大物攻
                   {type=5, job = 0, value=12950},--生命
                   {type=21, job = 0, value=104},--最小物防
                   {type=23, job = 0, value=259},--最大物防
                   {type=25, job = 0, value=104},--最小魔防
                   {type=27, job = 0, value=259},--最大魔防
                   {type=128, job = 0, value=160},--暴击几率
                   {type=129, job = 0, value=3108},--暴击伤害
                   {type=49, job = 0, value=-19.2},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=870},--最小魔攻
                   {type=15, job = 2, value=2170},--最大魔攻
                   {type=17, job = 3, value=870},--最小道攻
                   {type=19, job = 3, value=2170},--最大道攻
                 },
     },
-- 18级
    {
         itemCount = 5, -- 每次扣坐骑丹的数量
         maxExp = 800, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=934},--最小物攻
                   {type=11, job = 1, value=2328},--最大物攻
                   {type=5, job = 0, value=13900},--生命
                   {type=21, job = 0, value=111},--最小物防
                   {type=23, job = 0, value=278},--最大物防
                   {type=25, job = 0, value=111},--最小魔防
                   {type=27, job = 0, value=278},--最大魔防
                   {type=128, job = 0, value=170},--暴击几率
                   {type=129, job = 0, value=3336},--暴击伤害
                   {type=49, job = 0, value=-20.4},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=934},--最小魔攻
                   {type=15, job = 2, value=2328},--最大魔攻
                   {type=17, job = 3, value=934},--最小道攻
                   {type=19, job = 3, value=2328},--最大道攻
                 },
     },
-- 19级
    {
         itemCount = 5, -- 每次扣坐骑丹的数量
         maxExp = 800, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=998},--最小物攻
                   {type=11, job = 1, value=2486},--最大物攻
                   {type=5, job = 0, value=14850},--生命
                   {type=21, job = 0, value=119},--最小物防
                   {type=23, job = 0, value=297},--最大物防
                   {type=25, job = 0, value=119},--最小魔防
                   {type=27, job = 0, value=297},--最大魔防
                   {type=128, job = 0, value=180},--暴击几率
                   {type=129, job = 0, value=3564},--暴击伤害
                   {type=49, job = 0, value=-21.6},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=998},--最小魔攻
                   {type=15, job = 2, value=2486},--最大魔攻
                   {type=17, job = 3, value=998},--最小道攻
                   {type=19, job = 3, value=2486},--最大道攻
                 },
     },
-- 20级
    {
         itemCount = 5, -- 每次扣坐骑丹的数量
         maxExp = 800, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=1062},--最小物攻
                   {type=11, job = 1, value=2644},--最大物攻
                   {type=5, job = 0, value=15800},--生命
                   {type=21, job = 0, value=126},--最小物防
                   {type=23, job = 0, value=316},--最大物防
                   {type=25, job = 0, value=126},--最小魔防
                   {type=27, job = 0, value=316},--最大魔防
                   {type=128, job = 0, value=190},--暴击几率
                   {type=129, job = 0, value=3792},--暴击伤害
                   {type=49, job = 0, value=-22.8},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=1062},--最小魔攻
                   {type=15, job = 2, value=2644},--最大魔攻
                   {type=17, job = 3, value=1062},--最小道攻
                   {type=19, job = 3, value=2644},--最大道攻
                 },
     },
-- 21级
    {
         itemCount = 14, -- 每次扣坐骑丹的数量
         maxExp = 1400, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=1126},--最小物攻
                   {type=11, job = 1, value=2802},--最大物攻
                   {type=5, job = 0, value=16750},--生命
                   {type=21, job = 0, value=134},--最小物防
                   {type=23, job = 0, value=335},--最大物防
                   {type=25, job = 0, value=134},--最小魔防
                   {type=27, job = 0, value=335},--最大魔防
                   {type=128, job = 0, value=200},--暴击几率
                   {type=129, job = 0, value=4020},--暴击伤害
                   {type=49, job = 0, value=-24},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=1126},--最小魔攻
                   {type=15, job = 2, value=2802},--最大魔攻
                   {type=17, job = 3, value=1126},--最小道攻
                   {type=19, job = 3, value=2802},--最大道攻
                 },
     },
-- 22级
    {
         itemCount = 14, -- 每次扣坐骑丹的数量
         maxExp = 1400, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=1206},--最小物攻
                   {type=11, job = 1, value=3010},--最大物攻
                   {type=5, job = 0, value=17950},--生命
                   {type=21, job = 0, value=144},--最小物防
                   {type=23, job = 0, value=359},--最大物防
                   {type=25, job = 0, value=144},--最小魔防
                   {type=27, job = 0, value=359},--最大魔防
                   {type=128, job = 0, value=210},--暴击几率
                   {type=129, job = 0, value=4308},--暴击伤害
                   {type=49, job = 0, value=-25.2},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=1206},--最小魔攻
                   {type=15, job = 2, value=3010},--最大魔攻
                   {type=17, job = 3, value=1206},--最小道攻
                   {type=19, job = 3, value=3010},--最大道攻
                 },
     },
-- 23级
    {
         itemCount = 14, -- 每次扣坐骑丹的数量
         maxExp = 1400, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=1287},--最小物攻
                   {type=11, job = 1, value=3218},--最大物攻
                   {type=5, job = 0, value=19150},--生命
                   {type=21, job = 0, value=153},--最小物防
                   {type=23, job = 0, value=383},--最大物防
                   {type=25, job = 0, value=153},--最小魔防
                   {type=27, job = 0, value=383},--最大魔防
                   {type=128, job = 0, value=220},--暴击几率
                   {type=129, job = 0, value=4596},--暴击伤害
                   {type=49, job = 0, value=-26.4},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=1287},--最小魔攻
                   {type=15, job = 2, value=3218},--最大魔攻
                   {type=17, job = 3, value=1287},--最小道攻
                   {type=19, job = 3, value=3218},--最大道攻
                 },
     },
-- 24级
    {
         itemCount = 14, -- 每次扣坐骑丹的数量
         maxExp = 1400, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=1368},--最小物攻
                   {type=11, job = 1, value=3426},--最大物攻
                   {type=5, job = 0, value=20350},--生命
                   {type=21, job = 0, value=163},--最小物防
                   {type=23, job = 0, value=407},--最大物防
                   {type=25, job = 0, value=163},--最小魔防
                   {type=27, job = 0, value=407},--最大魔防
                   {type=128, job = 0, value=230},--暴击几率
                   {type=129, job = 0, value=4884},--暴击伤害
                   {type=49, job = 0, value=-27.6},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=1368},--最小魔攻
                   {type=15, job = 2, value=3426},--最大魔攻
                   {type=17, job = 3, value=1368},--最小道攻
                   {type=19, job = 3, value=3426},--最大道攻
                 },
     },
-- 25级
    {
         itemCount = 14, -- 每次扣坐骑丹的数量
         maxExp = 1400, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=1448},--最小物攻
                   {type=11, job = 1, value=3634},--最大物攻
                   {type=5, job = 0, value=21550},--生命
                   {type=21, job = 0, value=172},--最小物防
                   {type=23, job = 0, value=431},--最大物防
                   {type=25, job = 0, value=172},--最小魔防
                   {type=27, job = 0, value=431},--最大魔防
                   {type=128, job = 0, value=240},--暴击几率
                   {type=129, job = 0, value=5172},--暴击伤害
                   {type=49, job = 0, value=-28.8},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=1448},--最小魔攻
                   {type=15, job = 2, value=3634},--最大魔攻
                   {type=17, job = 3, value=1448},--最小道攻
                   {type=19, job = 3, value=3634},--最大道攻
                 },
     },
-- 26级
    {
         itemCount = 14, -- 每次扣坐骑丹的数量
         maxExp = 1400, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=1529},--最小物攻
                   {type=11, job = 1, value=3842},--最大物攻
                   {type=5, job = 0, value=22750},--生命
                   {type=21, job = 0, value=182},--最小物防
                   {type=23, job = 0, value=455},--最大物防
                   {type=25, job = 0, value=182},--最小魔防
                   {type=27, job = 0, value=455},--最大魔防
                   {type=128, job = 0, value=250},--暴击几率
                   {type=129, job = 0, value=5460},--暴击伤害
                   {type=49, job = 0, value=-30},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=1529},--最小魔攻
                   {type=15, job = 2, value=3842},--最大魔攻
                   {type=17, job = 3, value=1529},--最小道攻
                   {type=19, job = 3, value=3842},--最大道攻
                 },
     },
-- 27级
    {
         itemCount = 14, -- 每次扣坐骑丹的数量
         maxExp = 1400, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=1610},--最小物攻
                   {type=11, job = 1, value=4050},--最大物攻
                   {type=5, job = 0, value=23950},--生命
                   {type=21, job = 0, value=192},--最小物防
                   {type=23, job = 0, value=479},--最大物防
                   {type=25, job = 0, value=192},--最小魔防
                   {type=27, job = 0, value=479},--最大魔防
                   {type=128, job = 0, value=260},--暴击几率
                   {type=129, job = 0, value=5748},--暴击伤害
                   {type=49, job = 0, value=-31.2},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=1610},--最小魔攻
                   {type=15, job = 2, value=4050},--最大魔攻
                   {type=17, job = 3, value=1610},--最小道攻
                   {type=19, job = 3, value=4050},--最大道攻
                 },
     },
-- 28级
    {
         itemCount = 14, -- 每次扣坐骑丹的数量
         maxExp = 1400, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=1690},--最小物攻
                   {type=11, job = 1, value=4258},--最大物攻
                   {type=5, job = 0, value=25150},--生命
                   {type=21, job = 0, value=201},--最小物防
                   {type=23, job = 0, value=503},--最大物防
                   {type=25, job = 0, value=201},--最小魔防
                   {type=27, job = 0, value=503},--最大魔防
                   {type=128, job = 0, value=270},--暴击几率
                   {type=129, job = 0, value=6036},--暴击伤害
                   {type=49, job = 0, value=-32.4},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=1690},--最小魔攻
                   {type=15, job = 2, value=4258},--最大魔攻
                   {type=17, job = 3, value=1690},--最小道攻
                   {type=19, job = 3, value=4258},--最大道攻
                 },
     },
-- 29级
    {
         itemCount = 14, -- 每次扣坐骑丹的数量
         maxExp = 1400, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=1771},--最小物攻
                   {type=11, job = 1, value=4466},--最大物攻
                   {type=5, job = 0, value=26350},--生命
                   {type=21, job = 0, value=211},--最小物防
                   {type=23, job = 0, value=527},--最大物防
                   {type=25, job = 0, value=211},--最小魔防
                   {type=27, job = 0, value=527},--最大魔防
                   {type=128, job = 0, value=280},--暴击几率
                   {type=129, job = 0, value=6324},--暴击伤害
                   {type=49, job = 0, value=-33.6},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=1771},--最小魔攻
                   {type=15, job = 2, value=4466},--最大魔攻
                   {type=17, job = 3, value=1771},--最小道攻
                   {type=19, job = 3, value=4466},--最大道攻
                 },
     },
-- 30级
    {
         itemCount = 14, -- 每次扣坐骑丹的数量
         maxExp = 1400, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=1851},--最小物攻
                   {type=11, job = 1, value=4674},--最大物攻
                   {type=5, job = 0, value=27550},--生命
                   {type=21, job = 0, value=220},--最小物防
                   {type=23, job = 0, value=551},--最大物防
                   {type=25, job = 0, value=220},--最小魔防
                   {type=27, job = 0, value=551},--最大魔防
                   {type=128, job = 0, value=290},--暴击几率
                   {type=129, job = 0, value=6612},--暴击伤害
                   {type=49, job = 0, value=-34.8},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=1851},--最小魔攻
                   {type=15, job = 2, value=4674},--最大魔攻
                   {type=17, job = 3, value=1851},--最小道攻
                   {type=19, job = 3, value=4674},--最大道攻
                 },
     },
-- 31级
    {
         itemCount = 25, -- 每次扣坐骑丹的数量
         maxExp = 2500, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=1932},--最小物攻
                   {type=11, job = 1, value=4882},--最大物攻
                   {type=5, job = 0, value=28750},--生命
                   {type=21, job = 0, value=230},--最小物防
                   {type=23, job = 0, value=575},--最大物防
                   {type=25, job = 0, value=230},--最小魔防
                   {type=27, job = 0, value=575},--最大魔防
                   {type=128, job = 0, value=300},--暴击几率
                   {type=129, job = 0, value=6900},--暴击伤害
                   {type=49, job = 0, value=-36},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=1932},--最小魔攻
                   {type=15, job = 2, value=4882},--最大魔攻
                   {type=17, job = 3, value=1932},--最小道攻
                   {type=19, job = 3, value=4882},--最大道攻
                 },
     },
-- 32级
    {
         itemCount = 25, -- 每次扣坐骑丹的数量
         maxExp = 2500, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=2063},--最小物攻
                   {type=11, job = 1, value=5210},--最大物攻
                   {type=5, job = 0, value=30700},--生命
                   {type=21, job = 0, value=246},--最小物防
                   {type=23, job = 0, value=614},--最大物防
                   {type=25, job = 0, value=246},--最小魔防
                   {type=27, job = 0, value=614},--最大魔防
                   {type=128, job = 0, value=310},--暴击几率
                   {type=129, job = 0, value=7368},--暴击伤害
                   {type=49, job = 0, value=-37.2},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=2063},--最小魔攻
                   {type=15, job = 2, value=5210},--最大魔攻
                   {type=17, job = 3, value=2063},--最小道攻
                   {type=19, job = 3, value=5210},--最大道攻
                 },
     },
-- 33级
    {
         itemCount = 25, -- 每次扣坐骑丹的数量
         maxExp = 2500, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=2194},--最小物攻
                   {type=11, job = 1, value=5538},--最大物攻
                   {type=5, job = 0, value=32650},--生命
                   {type=21, job = 0, value=261},--最小物防
                   {type=23, job = 0, value=653},--最大物防
                   {type=25, job = 0, value=261},--最小魔防
                   {type=27, job = 0, value=653},--最大魔防
                   {type=128, job = 0, value=320},--暴击几率
                   {type=129, job = 0, value=7836},--暴击伤害
                   {type=49, job = 0, value=-38.4},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=2194},--最小魔攻
                   {type=15, job = 2, value=5538},--最大魔攻
                   {type=17, job = 3, value=2194},--最小道攻
                   {type=19, job = 3, value=5538},--最大道攻
                 },
     },
-- 34级
    {
         itemCount = 25, -- 每次扣坐骑丹的数量
         maxExp = 2500, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=2325},--最小物攻
                   {type=11, job = 1, value=5866},--最大物攻
                   {type=5, job = 0, value=34600},--生命
                   {type=21, job = 0, value=277},--最小物防
                   {type=23, job = 0, value=692},--最大物防
                   {type=25, job = 0, value=277},--最小魔防
                   {type=27, job = 0, value=692},--最大魔防
                   {type=128, job = 0, value=330},--暴击几率
                   {type=129, job = 0, value=8304},--暴击伤害
                   {type=49, job = 0, value=-39.6},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=2325},--最小魔攻
                   {type=15, job = 2, value=5866},--最大魔攻
                   {type=17, job = 3, value=2325},--最小道攻
                   {type=19, job = 3, value=5866},--最大道攻
                 },
     },
-- 35级
    {
         itemCount = 25, -- 每次扣坐骑丹的数量
         maxExp = 2500, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=2456},--最小物攻
                   {type=11, job = 1, value=6194},--最大物攻
                   {type=5, job = 0, value=36550},--生命
                   {type=21, job = 0, value=292},--最小物防
                   {type=23, job = 0, value=731},--最大物防
                   {type=25, job = 0, value=292},--最小魔防
                   {type=27, job = 0, value=731},--最大魔防
                   {type=128, job = 0, value=340},--暴击几率
                   {type=129, job = 0, value=8772},--暴击伤害
                   {type=49, job = 0, value=-40.8},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=2456},--最小魔攻
                   {type=15, job = 2, value=6194},--最大魔攻
                   {type=17, job = 3, value=2456},--最小道攻
                   {type=19, job = 3, value=6194},--最大道攻
                 },
     },
-- 36级
    {
         itemCount = 25, -- 每次扣坐骑丹的数量
         maxExp = 2500, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=2587},--最小物攻
                   {type=11, job = 1, value=6522},--最大物攻
                   {type=5, job = 0, value=38500},--生命
                   {type=21, job = 0, value=308},--最小物防
                   {type=23, job = 0, value=770},--最大物防
                   {type=25, job = 0, value=308},--最小魔防
                   {type=27, job = 0, value=770},--最大魔防
                   {type=128, job = 0, value=350},--暴击几率
                   {type=129, job = 0, value=9240},--暴击伤害
                   {type=49, job = 0, value=-42},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=2587},--最小魔攻
                   {type=15, job = 2, value=6522},--最大魔攻
                   {type=17, job = 3, value=2587},--最小道攻
                   {type=19, job = 3, value=6522},--最大道攻
                 },
     },
-- 37级
    {
         itemCount = 25, -- 每次扣坐骑丹的数量
         maxExp = 2500, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=2718},--最小物攻
                   {type=11, job = 1, value=6850},--最大物攻
                   {type=5, job = 0, value=40450},--生命
                   {type=21, job = 0, value=324},--最小物防
                   {type=23, job = 0, value=809},--最大物防
                   {type=25, job = 0, value=324},--最小魔防
                   {type=27, job = 0, value=809},--最大魔防
                   {type=128, job = 0, value=360},--暴击几率
                   {type=129, job = 0, value=9708},--暴击伤害
                   {type=49, job = 0, value=-43.2},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=2718},--最小魔攻
                   {type=15, job = 2, value=6850},--最大魔攻
                   {type=17, job = 3, value=2718},--最小道攻
                   {type=19, job = 3, value=6850},--最大道攻
                 },
     },
-- 38级
    {
         itemCount = 25, -- 每次扣坐骑丹的数量
         maxExp = 2500, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=2849},--最小物攻
                   {type=11, job = 1, value=7178},--最大物攻
                   {type=5, job = 0, value=42400},--生命
                   {type=21, job = 0, value=339},--最小物防
                   {type=23, job = 0, value=848},--最大物防
                   {type=25, job = 0, value=339},--最小魔防
                   {type=27, job = 0, value=848},--最大魔防
                   {type=128, job = 0, value=370},--暴击几率
                   {type=129, job = 0, value=10176},--暴击伤害
                   {type=49, job = 0, value=-44.4},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=2849},--最小魔攻
                   {type=15, job = 2, value=7178},--最大魔攻
                   {type=17, job = 3, value=2849},--最小道攻
                   {type=19, job = 3, value=7178},--最大道攻
                 },
     },
-- 39级
    {
         itemCount = 25, -- 每次扣坐骑丹的数量
         maxExp = 2500, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=2980},--最小物攻
                   {type=11, job = 1, value=7506},--最大物攻
                   {type=5, job = 0, value=44350},--生命
                   {type=21, job = 0, value=355},--最小物防
                   {type=23, job = 0, value=887},--最大物防
                   {type=25, job = 0, value=355},--最小魔防
                   {type=27, job = 0, value=887},--最大魔防
                   {type=128, job = 0, value=380},--暴击几率
                   {type=129, job = 0, value=10644},--暴击伤害
                   {type=49, job = 0, value=-45.6},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=2980},--最小魔攻
                   {type=15, job = 2, value=7506},--最大魔攻
                   {type=17, job = 3, value=2980},--最小道攻
                   {type=19, job = 3, value=7506},--最大道攻
                 },
     },
-- 40级
    {
         itemCount = 25, -- 每次扣坐骑丹的数量
         maxExp = 2500, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=3111},--最小物攻
                   {type=11, job = 1, value=7834},--最大物攻
                   {type=5, job = 0, value=46300},--生命
                   {type=21, job = 0, value=370},--最小物防
                   {type=23, job = 0, value=926},--最大物防
                   {type=25, job = 0, value=370},--最小魔防
                   {type=27, job = 0, value=926},--最大魔防
                   {type=128, job = 0, value=390},--暴击几率
                   {type=129, job = 0, value=11112},--暴击伤害
                   {type=49, job = 0, value=-46.8},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=3111},--最小魔攻
                   {type=15, job = 2, value=7834},--最大魔攻
                   {type=17, job = 3, value=3111},--最小道攻
                   {type=19, job = 3, value=7834},--最大道攻
                 },
     },
-- 41级
    {
         itemCount = 42, -- 每次扣坐骑丹的数量
         maxExp = 4200, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=3242},--最小物攻
                   {type=11, job = 1, value=8162},--最大物攻
                   {type=5, job = 0, value=48250},--生命
                   {type=21, job = 0, value=386},--最小物防
                   {type=23, job = 0, value=965},--最大物防
                   {type=25, job = 0, value=386},--最小魔防
                   {type=27, job = 0, value=965},--最大魔防
                   {type=128, job = 0, value=400},--暴击几率
                   {type=129, job = 0, value=11580},--暴击伤害
                   {type=49, job = 0, value=-48},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=3242},--最小魔攻
                   {type=15, job = 2, value=8162},--最大魔攻
                   {type=17, job = 3, value=3242},--最小道攻
                   {type=19, job = 3, value=8162},--最大道攻
                 },
     },
-- 42级
    {
         itemCount = 42, -- 每次扣坐骑丹的数量
         maxExp = 4200, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=3424},--最小物攻
                   {type=11, job = 1, value=8630},--最大物攻
                   {type=5, job = 0, value=50950},--生命
                   {type=21, job = 0, value=408},--最小物防
                   {type=23, job = 0, value=1019},--最大物防
                   {type=25, job = 0, value=408},--最小魔防
                   {type=27, job = 0, value=1019},--最大魔防
                   {type=128, job = 0, value=410},--暴击几率
                   {type=129, job = 0, value=12228},--暴击伤害
                   {type=49, job = 0, value=-49.2},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=3424},--最小魔攻
                   {type=15, job = 2, value=8630},--最大魔攻
                   {type=17, job = 3, value=3424},--最小道攻
                   {type=19, job = 3, value=8630},--最大道攻
                 },
     },
-- 43级
    {
         itemCount = 42, -- 每次扣坐骑丹的数量
         maxExp = 4200, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=3605},--最小物攻
                   {type=11, job = 1, value=9098},--最大物攻
                   {type=5, job = 0, value=53650},--生命
                   {type=21, job = 0, value=429},--最小物防
                   {type=23, job = 0, value=1073},--最大物防
                   {type=25, job = 0, value=429},--最小魔防
                   {type=27, job = 0, value=1073},--最大魔防
                   {type=128, job = 0, value=420},--暴击几率
                   {type=129, job = 0, value=12876},--暴击伤害
                   {type=49, job = 0, value=-50.4},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=3605},--最小魔攻
                   {type=15, job = 2, value=9098},--最大魔攻
                   {type=17, job = 3, value=3605},--最小道攻
                   {type=19, job = 3, value=9098},--最大道攻
                 },
     },
-- 44级
    {
         itemCount = 42, -- 每次扣坐骑丹的数量
         maxExp = 4200, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=3787},--最小物攻
                   {type=11, job = 1, value=9566},--最大物攻
                   {type=5, job = 0, value=56350},--生命
                   {type=21, job = 0, value=451},--最小物防
                   {type=23, job = 0, value=1127},--最大物防
                   {type=25, job = 0, value=451},--最小魔防
                   {type=27, job = 0, value=1127},--最大魔防
                   {type=128, job = 0, value=430},--暴击几率
                   {type=129, job = 0, value=13524},--暴击伤害
                   {type=49, job = 0, value=-51.6},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=3787},--最小魔攻
                   {type=15, job = 2, value=9566},--最大魔攻
                   {type=17, job = 3, value=3787},--最小道攻
                   {type=19, job = 3, value=9566},--最大道攻
                 },
     },
-- 45级
    {
         itemCount = 42, -- 每次扣坐骑丹的数量
         maxExp = 4200, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=3968},--最小物攻
                   {type=11, job = 1, value=10034},--最大物攻
                   {type=5, job = 0, value=59050},--生命
                   {type=21, job = 0, value=472},--最小物防
                   {type=23, job = 0, value=1181},--最大物防
                   {type=25, job = 0, value=472},--最小魔防
                   {type=27, job = 0, value=1181},--最大魔防
                   {type=128, job = 0, value=440},--暴击几率
                   {type=129, job = 0, value=14172},--暴击伤害
                   {type=49, job = 0, value=-52.8},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=3968},--最小魔攻
                   {type=15, job = 2, value=10034},--最大魔攻
                   {type=17, job = 3, value=3968},--最小道攻
                   {type=19, job = 3, value=10034},--最大道攻
                 },
     },
-- 46级
    {
         itemCount = 42, -- 每次扣坐骑丹的数量
         maxExp = 4200, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=4150},--最小物攻
                   {type=11, job = 1, value=10502},--最大物攻
                   {type=5, job = 0, value=61750},--生命
                   {type=21, job = 0, value=494},--最小物防
                   {type=23, job = 0, value=1235},--最大物防
                   {type=25, job = 0, value=494},--最小魔防
                   {type=27, job = 0, value=1235},--最大魔防
                   {type=128, job = 0, value=450},--暴击几率
                   {type=129, job = 0, value=14820},--暴击伤害
                   {type=49, job = 0, value=-54},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=4150},--最小魔攻
                   {type=15, job = 2, value=10502},--最大魔攻
                   {type=17, job = 3, value=4150},--最小道攻
                   {type=19, job = 3, value=10502},--最大道攻
                 },
     },
-- 47级
    {
         itemCount = 42, -- 每次扣坐骑丹的数量
         maxExp = 4200, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=4331},--最小物攻
                   {type=11, job = 1, value=10970},--最大物攻
                   {type=5, job = 0, value=64450},--生命
                   {type=21, job = 0, value=516},--最小物防
                   {type=23, job = 0, value=1289},--最大物防
                   {type=25, job = 0, value=516},--最小魔防
                   {type=27, job = 0, value=1289},--最大魔防
                   {type=128, job = 0, value=460},--暴击几率
                   {type=129, job = 0, value=15468},--暴击伤害
                   {type=49, job = 0, value=-55.2},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=4331},--最小魔攻
                   {type=15, job = 2, value=10970},--最大魔攻
                   {type=17, job = 3, value=4331},--最小道攻
                   {type=19, job = 3, value=10970},--最大道攻
                 },
     },
-- 48级
    {
         itemCount = 42, -- 每次扣坐骑丹的数量
         maxExp = 4200, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=4512},--最小物攻
                   {type=11, job = 1, value=11438},--最大物攻
                   {type=5, job = 0, value=67150},--生命
                   {type=21, job = 0, value=537},--最小物防
                   {type=23, job = 0, value=1343},--最大物防
                   {type=25, job = 0, value=537},--最小魔防
                   {type=27, job = 0, value=1343},--最大魔防
                   {type=128, job = 0, value=470},--暴击几率
                   {type=129, job = 0, value=16116},--暴击伤害
                   {type=49, job = 0, value=-56.4},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=4512},--最小魔攻
                   {type=15, job = 2, value=11438},--最大魔攻
                   {type=17, job = 3, value=4512},--最小道攻
                   {type=19, job = 3, value=11438},--最大道攻
                 },
     },
-- 49级
    {
         itemCount = 42, -- 每次扣坐骑丹的数量
         maxExp = 4200, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=4694},--最小物攻
                   {type=11, job = 1, value=11906},--最大物攻
                   {type=5, job = 0, value=69850},--生命
                   {type=21, job = 0, value=559},--最小物防
                   {type=23, job = 0, value=1397},--最大物防
                   {type=25, job = 0, value=559},--最小魔防
                   {type=27, job = 0, value=1397},--最大魔防
                   {type=128, job = 0, value=480},--暴击几率
                   {type=129, job = 0, value=16764},--暴击伤害
                   {type=49, job = 0, value=-57.6},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=4694},--最小魔攻
                   {type=15, job = 2, value=11906},--最大魔攻
                   {type=17, job = 3, value=4694},--最小道攻
                   {type=19, job = 3, value=11906},--最大道攻
                 },
     },
-- 50级
    {
         itemCount = 42, -- 每次扣坐骑丹的数量
         maxExp = 4200, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=4875},--最小物攻
                   {type=11, job = 1, value=12374},--最大物攻
                   {type=5, job = 0, value=72550},--生命
                   {type=21, job = 0, value=580},--最小物防
                   {type=23, job = 0, value=1451},--最大物防
                   {type=25, job = 0, value=580},--最小魔防
                   {type=27, job = 0, value=1451},--最大魔防
                   {type=128, job = 0, value=490},--暴击几率
                   {type=129, job = 0, value=17412},--暴击伤害
                   {type=49, job = 0, value=-58.8},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=4875},--最小魔攻
                   {type=15, job = 2, value=12374},--最大魔攻
                   {type=17, job = 3, value=4875},--最小道攻
                   {type=19, job = 3, value=12374},--最大道攻
                 },
     },
-- 51级
    {
         itemCount = 66, -- 每次扣坐骑丹的数量
         maxExp = 6600, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=5057},--最小物攻
                   {type=11, job = 1, value=12842},--最大物攻
                   {type=5, job = 0, value=75250},--生命
                   {type=21, job = 0, value=602},--最小物防
                   {type=23, job = 0, value=1505},--最大物防
                   {type=25, job = 0, value=602},--最小魔防
                   {type=27, job = 0, value=1505},--最大魔防
                   {type=128, job = 0, value=500},--暴击几率
                   {type=129, job = 0, value=18060},--暴击伤害
                   {type=49, job = 0, value=-60},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=5057},--最小魔攻
                   {type=15, job = 2, value=12842},--最大魔攻
                   {type=17, job = 3, value=5057},--最小道攻
                   {type=19, job = 3, value=12842},--最大道攻
                 },
     },
-- 52级
    {
         itemCount = 66, -- 每次扣坐骑丹的数量
         maxExp = 6600, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=5289},--最小物攻
                   {type=11, job = 1, value=13310},--最大物攻
                   {type=5, job = 0, value=78700},--生命
                   {type=21, job = 0, value=630},--最小物防
                   {type=23, job = 0, value=1574},--最大物防
                   {type=25, job = 0, value=630},--最小魔防
                   {type=27, job = 0, value=1574},--最大魔防
                   {type=128, job = 0, value=510},--暴击几率
                   {type=129, job = 0, value=18888},--暴击伤害
                   {type=49, job = 0, value=-61.2},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=5289},--最小魔攻
                   {type=15, job = 2, value=13310},--最大魔攻
                   {type=17, job = 3, value=5289},--最小道攻
                   {type=19, job = 3, value=13310},--最大道攻
                 },
     },
-- 53级
    {
         itemCount = 66, -- 每次扣坐骑丹的数量
         maxExp = 6600, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=5520},--最小物攻
                   {type=11, job = 1, value=13890},--最大物攻
                   {type=5, job = 0, value=82150},--生命
                   {type=21, job = 0, value=657},--最小物防
                   {type=23, job = 0, value=1643},--最大物防
                   {type=25, job = 0, value=657},--最小魔防
                   {type=27, job = 0, value=1643},--最大魔防
                   {type=128, job = 0, value=520},--暴击几率
                   {type=129, job = 0, value=19716},--暴击伤害
                   {type=49, job = 0, value=-62.4},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=5520},--最小魔攻
                   {type=15, job = 2, value=13890},--最大魔攻
                   {type=17, job = 3, value=5520},--最小道攻
                   {type=19, job = 3, value=13890},--最大道攻
                 },
     },
-- 54级
    {
         itemCount = 66, -- 每次扣坐骑丹的数量
         maxExp = 6600, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=5752},--最小物攻
                   {type=11, job = 1, value=14470},--最大物攻
                   {type=5, job = 0, value=85600},--生命
                   {type=21, job = 0, value=685},--最小物防
                   {type=23, job = 0, value=1712},--最大物防
                   {type=25, job = 0, value=685},--最小魔防
                   {type=27, job = 0, value=1712},--最大魔防
                   {type=128, job = 0, value=530},--暴击几率
                   {type=129, job = 0, value=20544},--暴击伤害
                   {type=49, job = 0, value=-63.6},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=5752},--最小魔攻
                   {type=15, job = 2, value=14470},--最大魔攻
                   {type=17, job = 3, value=5752},--最小道攻
                   {type=19, job = 3, value=14470},--最大道攻
                 },
     },
-- 55级
    {
         itemCount = 66, -- 每次扣坐骑丹的数量
         maxExp = 6600, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=5984},--最小物攻
                   {type=11, job = 1, value=15050},--最大物攻
                   {type=5, job = 0, value=89050},--生命
                   {type=21, job = 0, value=712},--最小物防
                   {type=23, job = 0, value=1781},--最大物防
                   {type=25, job = 0, value=712},--最小魔防
                   {type=27, job = 0, value=1781},--最大魔防
                   {type=128, job = 0, value=540},--暴击几率
                   {type=129, job = 0, value=21372},--暴击伤害
                   {type=49, job = 0, value=-64.8},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=5984},--最小魔攻
                   {type=15, job = 2, value=15050},--最大魔攻
                   {type=17, job = 3, value=5984},--最小道攻
                   {type=19, job = 3, value=15050},--最大道攻
                 },
     },
-- 56级
    {
         itemCount = 66, -- 每次扣坐骑丹的数量
         maxExp = 6600, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=6216},--最小物攻
                   {type=11, job = 1, value=15630},--最大物攻
                   {type=5, job = 0, value=92500},--生命
                   {type=21, job = 0, value=740},--最小物防
                   {type=23, job = 0, value=1850},--最大物防
                   {type=25, job = 0, value=740},--最小魔防
                   {type=27, job = 0, value=1850},--最大魔防
                   {type=128, job = 0, value=550},--暴击几率
                   {type=129, job = 0, value=22200},--暴击伤害
                   {type=49, job = 0, value=-66},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=6216},--最小魔攻
                   {type=15, job = 2, value=15630},--最大魔攻
                   {type=17, job = 3, value=6216},--最小道攻
                   {type=19, job = 3, value=15630},--最大道攻
                 },
     },
-- 57级
    {
         itemCount = 66, -- 每次扣坐骑丹的数量
         maxExp = 6600, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=6448},--最小物攻
                   {type=11, job = 1, value=16210},--最大物攻
                   {type=5, job = 0, value=95950},--生命
                   {type=21, job = 0, value=768},--最小物防
                   {type=23, job = 0, value=1919},--最大物防
                   {type=25, job = 0, value=768},--最小魔防
                   {type=27, job = 0, value=1919},--最大魔防
                   {type=128, job = 0, value=560},--暴击几率
                   {type=129, job = 0, value=23028},--暴击伤害
                   {type=49, job = 0, value=-67.2},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=6448},--最小魔攻
                   {type=15, job = 2, value=16210},--最大魔攻
                   {type=17, job = 3, value=6448},--最小道攻
                   {type=19, job = 3, value=16210},--最大道攻
                 },
     },
-- 58级
    {
         itemCount = 66, -- 每次扣坐骑丹的数量
         maxExp = 6600, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=6680},--最小物攻
                   {type=11, job = 1, value=16790},--最大物攻
                   {type=5, job = 0, value=99400},--生命
                   {type=21, job = 0, value=795},--最小物防
                   {type=23, job = 0, value=1988},--最大物防
                   {type=25, job = 0, value=795},--最小魔防
                   {type=27, job = 0, value=1988},--最大魔防
                   {type=128, job = 0, value=570},--暴击几率
                   {type=129, job = 0, value=23856},--暴击伤害
                   {type=49, job = 0, value=-68.4},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=6680},--最小魔攻
                   {type=15, job = 2, value=16790},--最大魔攻
                   {type=17, job = 3, value=6680},--最小道攻
                   {type=19, job = 3, value=16790},--最大道攻
                 },
     },
-- 59级
    {
         itemCount = 66, -- 每次扣坐骑丹的数量
         maxExp = 6600, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=6912},--最小物攻
                   {type=11, job = 1, value=17370},--最大物攻
                   {type=5, job = 0, value=102850},--生命
                   {type=21, job = 0, value=823},--最小物防
                   {type=23, job = 0, value=2057},--最大物防
                   {type=25, job = 0, value=823},--最小魔防
                   {type=27, job = 0, value=2057},--最大魔防
                   {type=128, job = 0, value=580},--暴击几率
                   {type=129, job = 0, value=24684},--暴击伤害
                   {type=49, job = 0, value=-69.6},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=6912},--最小魔攻
                   {type=15, job = 2, value=17370},--最大魔攻
                   {type=17, job = 3, value=6912},--最小道攻
                   {type=19, job = 3, value=17370},--最大道攻
                 },
     },
-- 60级
    {
         itemCount = 66, -- 每次扣坐骑丹的数量
         maxExp = 6600, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=7143},--最小物攻
                   {type=11, job = 1, value=17950},--最大物攻
                   {type=5, job = 0, value=106300},--生命
                   {type=21, job = 0, value=850},--最小物防
                   {type=23, job = 0, value=2126},--最大物防
                   {type=25, job = 0, value=850},--最小魔防
                   {type=27, job = 0, value=2126},--最大魔防
                   {type=128, job = 0, value=590},--暴击几率
                   {type=129, job = 0, value=25512},--暴击伤害
                   {type=49, job = 0, value=-70.8},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=7143},--最小魔攻
                   {type=15, job = 2, value=17950},--最大魔攻
                   {type=17, job = 3, value=7143},--最小道攻
                   {type=19, job = 3, value=17950},--最大道攻
                 },
     },
-- 61级
    {
         itemCount = 98, -- 每次扣坐骑丹的数量
         maxExp = 9800, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=7375},--最小物攻
                   {type=11, job = 1, value=18530},--最大物攻
                   {type=5, job = 0, value=109750},--生命
                   {type=21, job = 0, value=878},--最小物防
                   {type=23, job = 0, value=2195},--最大物防
                   {type=25, job = 0, value=878},--最小魔防
                   {type=27, job = 0, value=2195},--最大魔防
                   {type=128, job = 0, value=600},--暴击几率
                   {type=129, job = 0, value=26340},--暴击伤害
                   {type=49, job = 0, value=-72},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=7375},--最小魔攻
                   {type=15, job = 2, value=18530},--最大魔攻
                   {type=17, job = 3, value=7375},--最小道攻
                   {type=19, job = 3, value=18530},--最大道攻
                 },
     },
-- 62级
    {
         itemCount = 98, -- 每次扣坐骑丹的数量
         maxExp = 9800, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=7658},--最小物攻
                   {type=11, job = 1, value=19238},--最大物攻
                   {type=5, job = 0, value=113950},--生命
                   {type=21, job = 0, value=912},--最小物防
                   {type=23, job = 0, value=2279},--最大物防
                   {type=25, job = 0, value=912},--最小魔防
                   {type=27, job = 0, value=2279},--最大魔防
                   {type=128, job = 0, value=610},--暴击几率
                   {type=129, job = 0, value=27348},--暴击伤害
                   {type=49, job = 0, value=-73.2},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=7658},--最小魔攻
                   {type=15, job = 2, value=19238},--最大魔攻
                   {type=17, job = 3, value=7658},--最小道攻
                   {type=19, job = 3, value=19238},--最大道攻
                 },
     },
-- 63级
    {
         itemCount = 98, -- 每次扣坐骑丹的数量
         maxExp = 9800, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=7940},--最小物攻
                   {type=11, job = 1, value=19946},--最大物攻
                   {type=5, job = 0, value=118150},--生命
                   {type=21, job = 0, value=945},--最小物防
                   {type=23, job = 0, value=2363},--最大物防
                   {type=25, job = 0, value=945},--最小魔防
                   {type=27, job = 0, value=2363},--最大魔防
                   {type=128, job = 0, value=620},--暴击几率
                   {type=129, job = 0, value=28356},--暴击伤害
                   {type=49, job = 0, value=-74.4},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=7940},--最小魔攻
                   {type=15, job = 2, value=19946},--最大魔攻
                   {type=17, job = 3, value=7940},--最小道攻
                   {type=19, job = 3, value=19946},--最大道攻
                 },
     },
-- 64级
    {
         itemCount = 98, -- 每次扣坐骑丹的数量
         maxExp = 9800, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=8222},--最小物攻
                   {type=11, job = 1, value=20654},--最大物攻
                   {type=5, job = 0, value=122350},--生命
                   {type=21, job = 0, value=979},--最小物防
                   {type=23, job = 0, value=2447},--最大物防
                   {type=25, job = 0, value=979},--最小魔防
                   {type=27, job = 0, value=2447},--最大魔防
                   {type=128, job = 0, value=630},--暴击几率
                   {type=129, job = 0, value=29364},--暴击伤害
                   {type=49, job = 0, value=-75.6},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=8222},--最小魔攻
                   {type=15, job = 2, value=20654},--最大魔攻
                   {type=17, job = 3, value=8222},--最小道攻
                   {type=19, job = 3, value=20654},--最大道攻
                 },
     },
-- 65级
    {
         itemCount = 98, -- 每次扣坐骑丹的数量
         maxExp = 9800, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=8504},--最小物攻
                   {type=11, job = 1, value=21362},--最大物攻
                   {type=5, job = 0, value=126550},--生命
                   {type=21, job = 0, value=1012},--最小物防
                   {type=23, job = 0, value=2531},--最大物防
                   {type=25, job = 0, value=1012},--最小魔防
                   {type=27, job = 0, value=2531},--最大魔防
                   {type=128, job = 0, value=640},--暴击几率
                   {type=129, job = 0, value=30372},--暴击伤害
                   {type=49, job = 0, value=-76.8},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=8504},--最小魔攻
                   {type=15, job = 2, value=21362},--最大魔攻
                   {type=17, job = 3, value=8504},--最小道攻
                   {type=19, job = 3, value=21362},--最大道攻
                 },
     },
-- 66级
    {
         itemCount = 98, -- 每次扣坐骑丹的数量
         maxExp = 9800, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=8786},--最小物攻
                   {type=11, job = 1, value=22070},--最大物攻
                   {type=5, job = 0, value=130750},--生命
                   {type=21, job = 0, value=1046},--最小物防
                   {type=23, job = 0, value=2615},--最大物防
                   {type=25, job = 0, value=1046},--最小魔防
                   {type=27, job = 0, value=2615},--最大魔防
                   {type=128, job = 0, value=650},--暴击几率
                   {type=129, job = 0, value=31380},--暴击伤害
                   {type=49, job = 0, value=-78},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=8786},--最小魔攻
                   {type=15, job = 2, value=22070},--最大魔攻
                   {type=17, job = 3, value=8786},--最小道攻
                   {type=19, job = 3, value=22070},--最大道攻
                 },
     },
-- 67级
    {
         itemCount = 98, -- 每次扣坐骑丹的数量
         maxExp = 9800, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=9069},--最小物攻
                   {type=11, job = 1, value=22778},--最大物攻
                   {type=5, job = 0, value=134950},--生命
                   {type=21, job = 0, value=1080},--最小物防
                   {type=23, job = 0, value=2699},--最大物防
                   {type=25, job = 0, value=1080},--最小魔防
                   {type=27, job = 0, value=2699},--最大魔防
                   {type=128, job = 0, value=660},--暴击几率
                   {type=129, job = 0, value=32388},--暴击伤害
                   {type=49, job = 0, value=-79.2},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=9069},--最小魔攻
                   {type=15, job = 2, value=22778},--最大魔攻
                   {type=17, job = 3, value=9069},--最小道攻
                   {type=19, job = 3, value=22778},--最大道攻
                 },
     },
-- 68级
    {
         itemCount = 98, -- 每次扣坐骑丹的数量
         maxExp = 9800, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=9351},--最小物攻
                   {type=11, job = 1, value=23486},--最大物攻
                   {type=5, job = 0, value=139150},--生命
                   {type=21, job = 0, value=1113},--最小物防
                   {type=23, job = 0, value=2783},--最大物防
                   {type=25, job = 0, value=1113},--最小魔防
                   {type=27, job = 0, value=2783},--最大魔防
                   {type=128, job = 0, value=670},--暴击几率
                   {type=129, job = 0, value=33396},--暴击伤害
                   {type=49, job = 0, value=-80.4},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=9351},--最小魔攻
                   {type=15, job = 2, value=23486},--最大魔攻
                   {type=17, job = 3, value=9351},--最小道攻
                   {type=19, job = 3, value=23486},--最大道攻
                 },
     },
-- 69级
    {
         itemCount = 98, -- 每次扣坐骑丹的数量
         maxExp = 9800, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=9633},--最小物攻
                   {type=11, job = 1, value=24194},--最大物攻
                   {type=5, job = 0, value=143350},--生命
                   {type=21, job = 0, value=1147},--最小物防
                   {type=23, job = 0, value=2867},--最大物防
                   {type=25, job = 0, value=1147},--最小魔防
                   {type=27, job = 0, value=2867},--最大魔防
                   {type=128, job = 0, value=680},--暴击几率
                   {type=129, job = 0, value=34404},--暴击伤害
                   {type=49, job = 0, value=-81.6},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=9633},--最小魔攻
                   {type=15, job = 2, value=24194},--最大魔攻
                   {type=17, job = 3, value=9633},--最小道攻
                   {type=19, job = 3, value=24194},--最大道攻
                 },
     },
-- 70级
    {
         itemCount = 98, -- 每次扣坐骑丹的数量
         maxExp = 9800, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=9915},--最小物攻
                   {type=11, job = 1, value=24902},--最大物攻
                   {type=5, job = 0, value=147550},--生命
                   {type=21, job = 0, value=1180},--最小物防
                   {type=23, job = 0, value=2951},--最大物防
                   {type=25, job = 0, value=1180},--最小魔防
                   {type=27, job = 0, value=2951},--最大魔防
                   {type=128, job = 0, value=690},--暴击几率
                   {type=129, job = 0, value=35412},--暴击伤害
                   {type=49, job = 0, value=-82.8},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=9915},--最小魔攻
                   {type=15, job = 2, value=24902},--最大魔攻
                   {type=17, job = 3, value=9915},--最小道攻
                   {type=19, job = 3, value=24902},--最大道攻
                 },
     },
-- 71级
    {
         itemCount = 138, -- 每次扣坐骑丹的数量
         maxExp = 13800, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=10198},--最小物攻
                   {type=11, job = 1, value=25610},--最大物攻
                   {type=5, job = 0, value=151750},--生命
                   {type=21, job = 0, value=1214},--最小物防
                   {type=23, job = 0, value=3035},--最大物防
                   {type=25, job = 0, value=1214},--最小魔防
                   {type=27, job = 0, value=3035},--最大魔防
                   {type=128, job = 0, value=700},--暴击几率
                   {type=129, job = 0, value=36420},--暴击伤害
                   {type=49, job = 0, value=-84},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=10198},--最小魔攻
                   {type=15, job = 2, value=25610},--最大魔攻
                   {type=17, job = 3, value=10198},--最小道攻
                   {type=19, job = 3, value=25610},--最大道攻
                 },
     },
-- 72级
    {
         itemCount = 138, -- 每次扣坐骑丹的数量
         maxExp = 13800, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=10547},--最小物攻
                   {type=11, job = 1, value=26498},--最大物攻
                   {type=5, job = 0, value=156950},--生命
                   {type=21, job = 0, value=1256},--最小物防
                   {type=23, job = 0, value=3139},--最大物防
                   {type=25, job = 0, value=1256},--最小魔防
                   {type=27, job = 0, value=3139},--最大魔防
                   {type=128, job = 0, value=710},--暴击几率
                   {type=129, job = 0, value=37668},--暴击伤害
                   {type=49, job = 0, value=-85.2},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=10547},--最小魔攻
                   {type=15, job = 2, value=26498},--最大魔攻
                   {type=17, job = 3, value=10547},--最小道攻
                   {type=19, job = 3, value=26498},--最大道攻
                 },
     },
-- 73级
    {
         itemCount = 138, -- 每次扣坐骑丹的数量
         maxExp = 13800, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=10896},--最小物攻
                   {type=11, job = 1, value=27386},--最大物攻
                   {type=5, job = 0, value=162150},--生命
                   {type=21, job = 0, value=1297},--最小物防
                   {type=23, job = 0, value=3243},--最大物防
                   {type=25, job = 0, value=1297},--最小魔防
                   {type=27, job = 0, value=3243},--最大魔防
                   {type=128, job = 0, value=720},--暴击几率
                   {type=129, job = 0, value=38916},--暴击伤害
                   {type=49, job = 0, value=-86.4},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=10896},--最小魔攻
                   {type=15, job = 2, value=27386},--最大魔攻
                   {type=17, job = 3, value=10896},--最小道攻
                   {type=19, job = 3, value=27386},--最大道攻
                 },
     },
-- 74级
    {
         itemCount = 138, -- 每次扣坐骑丹的数量
         maxExp = 13800, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=11246},--最小物攻
                   {type=11, job = 1, value=28274},--最大物攻
                   {type=5, job = 0, value=167350},--生命
                   {type=21, job = 0, value=1339},--最小物防
                   {type=23, job = 0, value=3347},--最大物防
                   {type=25, job = 0, value=1339},--最小魔防
                   {type=27, job = 0, value=3347},--最大魔防
                   {type=128, job = 0, value=730},--暴击几率
                   {type=129, job = 0, value=40164},--暴击伤害
                   {type=49, job = 0, value=-87.6},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=11246},--最小魔攻
                   {type=15, job = 2, value=28274},--最大魔攻
                   {type=17, job = 3, value=11246},--最小道攻
                   {type=19, job = 3, value=28274},--最大道攻
                 },
     },
-- 75级
    {
         itemCount = 138, -- 每次扣坐骑丹的数量
         maxExp = 13800, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=11595},--最小物攻
                   {type=11, job = 1, value=29162},--最大物攻
                   {type=5, job = 0, value=172550},--生命
                   {type=21, job = 0, value=1380},--最小物防
                   {type=23, job = 0, value=3451},--最大物防
                   {type=25, job = 0, value=1380},--最小魔防
                   {type=27, job = 0, value=3451},--最大魔防
                   {type=128, job = 0, value=740},--暴击几率
                   {type=129, job = 0, value=41412},--暴击伤害
                   {type=49, job = 0, value=-88.8},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=11595},--最小魔攻
                   {type=15, job = 2, value=29162},--最大魔攻
                   {type=17, job = 3, value=11595},--最小道攻
                   {type=19, job = 3, value=29162},--最大道攻
                 },
     },
-- 76级
    {
         itemCount = 138, -- 每次扣坐骑丹的数量
         maxExp = 13800, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=11945},--最小物攻
                   {type=11, job = 1, value=30050},--最大物攻
                   {type=5, job = 0, value=177750},--生命
                   {type=21, job = 0, value=1422},--最小物防
                   {type=23, job = 0, value=3555},--最大物防
                   {type=25, job = 0, value=1422},--最小魔防
                   {type=27, job = 0, value=3555},--最大魔防
                   {type=128, job = 0, value=750},--暴击几率
                   {type=129, job = 0, value=42660},--暴击伤害
                   {type=49, job = 0, value=-90},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=11945},--最小魔攻
                   {type=15, job = 2, value=30050},--最大魔攻
                   {type=17, job = 3, value=11945},--最小道攻
                   {type=19, job = 3, value=30050},--最大道攻
                 },
     },
-- 77级
    {
         itemCount = 138, -- 每次扣坐骑丹的数量
         maxExp = 13800, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=12294},--最小物攻
                   {type=11, job = 1, value=30938},--最大物攻
                   {type=5, job = 0, value=182950},--生命
                   {type=21, job = 0, value=1464},--最小物防
                   {type=23, job = 0, value=3659},--最大物防
                   {type=25, job = 0, value=1464},--最小魔防
                   {type=27, job = 0, value=3659},--最大魔防
                   {type=128, job = 0, value=760},--暴击几率
                   {type=129, job = 0, value=43908},--暴击伤害
                   {type=49, job = 0, value=-91.2},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=12294},--最小魔攻
                   {type=15, job = 2, value=30938},--最大魔攻
                   {type=17, job = 3, value=12294},--最小道攻
                   {type=19, job = 3, value=30938},--最大道攻
                 },
     },
-- 78级
    {
         itemCount = 138, -- 每次扣坐骑丹的数量
         maxExp = 13800, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=12644},--最小物攻
                   {type=11, job = 1, value=31826},--最大物攻
                   {type=5, job = 0, value=188150},--生命
                   {type=21, job = 0, value=1505},--最小物防
                   {type=23, job = 0, value=3763},--最大物防
                   {type=25, job = 0, value=1505},--最小魔防
                   {type=27, job = 0, value=3763},--最大魔防
                   {type=128, job = 0, value=770},--暴击几率
                   {type=129, job = 0, value=45156},--暴击伤害
                   {type=49, job = 0, value=-92.4},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=12644},--最小魔攻
                   {type=15, job = 2, value=31826},--最大魔攻
                   {type=17, job = 3, value=12644},--最小道攻
                   {type=19, job = 3, value=31826},--最大道攻
                 },
     },
-- 79级
    {
         itemCount = 138, -- 每次扣坐骑丹的数量
         maxExp = 13800, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=12993},--最小物攻
                   {type=11, job = 1, value=32714},--最大物攻
                   {type=5, job = 0, value=193350},--生命
                   {type=21, job = 0, value=1547},--最小物防
                   {type=23, job = 0, value=3867},--最大物防
                   {type=25, job = 0, value=1547},--最小魔防
                   {type=27, job = 0, value=3867},--最大魔防
                   {type=128, job = 0, value=780},--暴击几率
                   {type=129, job = 0, value=46404},--暴击伤害
                   {type=49, job = 0, value=-93.6},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=12993},--最小魔攻
                   {type=15, job = 2, value=32714},--最大魔攻
                   {type=17, job = 3, value=12993},--最小道攻
                   {type=19, job = 3, value=32714},--最大道攻
                 },
     },
-- 80级
    {
         itemCount = 138, -- 每次扣坐骑丹的数量
         maxExp = 13800, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=13342},--最小物攻
                   {type=11, job = 1, value=33602},--最大物攻
                   {type=5, job = 0, value=198550},--生命
                   {type=21, job = 0, value=1588},--最小物防
                   {type=23, job = 0, value=3971},--最大物防
                   {type=25, job = 0, value=1588},--最小魔防
                   {type=27, job = 0, value=3971},--最大魔防
                   {type=128, job = 0, value=790},--暴击几率
                   {type=129, job = 0, value=47652},--暴击伤害
                   {type=49, job = 0, value=-94.8},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=13342},--最小魔攻
                   {type=15, job = 2, value=33602},--最大魔攻
                   {type=17, job = 3, value=13342},--最小道攻
                   {type=19, job = 3, value=33602},--最大道攻
                 },
     },
-- 81级
    {
         itemCount = 188, -- 每次扣坐骑丹的数量
         maxExp = 18800, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=13692},--最小物攻
                   {type=11, job = 1, value=34490},--最大物攻
                   {type=5, job = 0, value=203750},--生命
                   {type=21, job = 0, value=1630},--最小物防
                   {type=23, job = 0, value=4075},--最大物防
                   {type=25, job = 0, value=1630},--最小魔防
                   {type=27, job = 0, value=4075},--最大魔防
                   {type=128, job = 0, value=800},--暴击几率
                   {type=129, job = 0, value=48900},--暴击伤害
                   {type=49, job = 0, value=-96},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=13692},--最小魔攻
                   {type=15, job = 2, value=34490},--最大魔攻
                   {type=17, job = 3, value=13692},--最小道攻
                   {type=19, job = 3, value=34490},--最大道攻
                 },
     },
-- 82级
    {
         itemCount = 188, -- 每次扣坐骑丹的数量
         maxExp = 18800, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=14142},--最小物攻
                   {type=11, job = 1, value=35378},--最大物攻
                   {type=5, job = 0, value=210450},--生命
                   {type=21, job = 0, value=1684},--最小物防
                   {type=23, job = 0, value=4209},--最大物防
                   {type=25, job = 0, value=1684},--最小魔防
                   {type=27, job = 0, value=4209},--最大魔防
                   {type=128, job = 0, value=810},--暴击几率
                   {type=129, job = 0, value=50508},--暴击伤害
                   {type=49, job = 0, value=-97.2},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=14142},--最小魔攻
                   {type=15, job = 2, value=35378},--最大魔攻
                   {type=17, job = 3, value=14142},--最小道攻
                   {type=19, job = 3, value=35378},--最大道攻
                 },
     },
-- 83级
    {
         itemCount = 188, -- 每次扣坐骑丹的数量
         maxExp = 18800, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=14592},--最小物攻
                   {type=11, job = 1, value=36558},--最大物攻
                   {type=5, job = 0, value=217150},--生命
                   {type=21, job = 0, value=1737},--最小物防
                   {type=23, job = 0, value=4343},--最大物防
                   {type=25, job = 0, value=1737},--最小魔防
                   {type=27, job = 0, value=4343},--最大魔防
                   {type=128, job = 0, value=820},--暴击几率
                   {type=129, job = 0, value=52116},--暴击伤害
                   {type=49, job = 0, value=-98.4},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=14592},--最小魔攻
                   {type=15, job = 2, value=36558},--最大魔攻
                   {type=17, job = 3, value=14592},--最小道攻
                   {type=19, job = 3, value=36558},--最大道攻
                 },
     },
-- 84级
    {
         itemCount = 188, -- 每次扣坐骑丹的数量
         maxExp = 18800, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=15043},--最小物攻
                   {type=11, job = 1, value=37738},--最大物攻
                   {type=5, job = 0, value=223850},--生命
                   {type=21, job = 0, value=1791},--最小物防
                   {type=23, job = 0, value=4477},--最大物防
                   {type=25, job = 0, value=1791},--最小魔防
                   {type=27, job = 0, value=4477},--最大魔防
                   {type=128, job = 0, value=830},--暴击几率
                   {type=129, job = 0, value=53724},--暴击伤害
                   {type=49, job = 0, value=-99.6},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=15043},--最小魔攻
                   {type=15, job = 2, value=37738},--最大魔攻
                   {type=17, job = 3, value=15043},--最小道攻
                   {type=19, job = 3, value=37738},--最大道攻
                 },
     },
-- 85级
    {
         itemCount = 188, -- 每次扣坐骑丹的数量
         maxExp = 18800, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=15493},--最小物攻
                   {type=11, job = 1, value=38918},--最大物攻
                   {type=5, job = 0, value=230550},--生命
                   {type=21, job = 0, value=1844},--最小物防
                   {type=23, job = 0, value=4611},--最大物防
                   {type=25, job = 0, value=1844},--最小魔防
                   {type=27, job = 0, value=4611},--最大魔防
                   {type=128, job = 0, value=840},--暴击几率
                   {type=129, job = 0, value=55332},--暴击伤害
                   {type=49, job = 0, value=-100.8},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=15493},--最小魔攻
                   {type=15, job = 2, value=38918},--最大魔攻
                   {type=17, job = 3, value=15493},--最小道攻
                   {type=19, job = 3, value=38918},--最大道攻
                 },
     },
-- 86级
    {
         itemCount = 188, -- 每次扣坐骑丹的数量
         maxExp = 18800, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=15943},--最小物攻
                   {type=11, job = 1, value=40098},--最大物攻
                   {type=5, job = 0, value=237250},--生命
                   {type=21, job = 0, value=1898},--最小物防
                   {type=23, job = 0, value=4745},--最大物防
                   {type=25, job = 0, value=1898},--最小魔防
                   {type=27, job = 0, value=4745},--最大魔防
                   {type=128, job = 0, value=850},--暴击几率
                   {type=129, job = 0, value=56940},--暴击伤害
                   {type=49, job = 0, value=-102},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=15943},--最小魔攻
                   {type=15, job = 2, value=40098},--最大魔攻
                   {type=17, job = 3, value=15943},--最小道攻
                   {type=19, job = 3, value=40098},--最大道攻
                 },
     },
-- 87级
    {
         itemCount = 188, -- 每次扣坐骑丹的数量
         maxExp = 18800, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=16394},--最小物攻
                   {type=11, job = 1, value=41278},--最大物攻
                   {type=5, job = 0, value=243950},--生命
                   {type=21, job = 0, value=1952},--最小物防
                   {type=23, job = 0, value=4879},--最大物防
                   {type=25, job = 0, value=1952},--最小魔防
                   {type=27, job = 0, value=4879},--最大魔防
                   {type=128, job = 0, value=860},--暴击几率
                   {type=129, job = 0, value=58548},--暴击伤害
                   {type=49, job = 0, value=-103.2},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=16394},--最小魔攻
                   {type=15, job = 2, value=41278},--最大魔攻
                   {type=17, job = 3, value=16394},--最小道攻
                   {type=19, job = 3, value=41278},--最大道攻
                 },
     },
-- 88级
    {
         itemCount = 188, -- 每次扣坐骑丹的数量
         maxExp = 18800, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=16844},--最小物攻
                   {type=11, job = 1, value=42458},--最大物攻
                   {type=5, job = 0, value=250650},--生命
                   {type=21, job = 0, value=2005},--最小物防
                   {type=23, job = 0, value=5013},--最大物防
                   {type=25, job = 0, value=2005},--最小魔防
                   {type=27, job = 0, value=5013},--最大魔防
                   {type=128, job = 0, value=870},--暴击几率
                   {type=129, job = 0, value=60156},--暴击伤害
                   {type=49, job = 0, value=-104.4},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=16844},--最小魔攻
                   {type=15, job = 2, value=42458},--最大魔攻
                   {type=17, job = 3, value=16844},--最小道攻
                   {type=19, job = 3, value=42458},--最大道攻
                 },
     },
-- 89级
    {
         itemCount = 188, -- 每次扣坐骑丹的数量
         maxExp = 18800, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=17294},--最小物攻
                   {type=11, job = 1, value=43638},--最大物攻
                   {type=5, job = 0, value=257350},--生命
                   {type=21, job = 0, value=2059},--最小物防
                   {type=23, job = 0, value=5147},--最大物防
                   {type=25, job = 0, value=2059},--最小魔防
                   {type=27, job = 0, value=5147},--最大魔防
                   {type=128, job = 0, value=880},--暴击几率
                   {type=129, job = 0, value=61764},--暴击伤害
                   {type=49, job = 0, value=-105.6},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=17294},--最小魔攻
                   {type=15, job = 2, value=43638},--最大魔攻
                   {type=17, job = 3, value=17294},--最小道攻
                   {type=19, job = 3, value=43638},--最大道攻
                 },
     },
-- 90级
    {
         itemCount = 188, -- 每次扣坐骑丹的数量
         maxExp = 18800, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=17744},--最小物攻
                   {type=11, job = 1, value=44818},--最大物攻
                   {type=5, job = 0, value=264050},--生命
                   {type=21, job = 0, value=2112},--最小物防
                   {type=23, job = 0, value=5281},--最大物防
                   {type=25, job = 0, value=2112},--最小魔防
                   {type=27, job = 0, value=5281},--最大魔防
                   {type=128, job = 0, value=890},--暴击几率
                   {type=129, job = 0, value=63372},--暴击伤害
                   {type=49, job = 0, value=-106.8},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=17744},--最小魔攻
                   {type=15, job = 2, value=44818},--最大魔攻
                   {type=17, job = 3, value=17744},--最小道攻
                   {type=19, job = 3, value=44818},--最大道攻
                 },
     },
-- 91级
    {
         itemCount = 258, -- 每次扣坐骑丹的数量
         maxExp = 25800, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=18194},--最小物攻
                   {type=11, job = 1, value=45998},--最大物攻
                   {type=5, job = 0, value=270750},--生命
                   {type=21, job = 0, value=2166},--最小物防
                   {type=23, job = 0, value=5415},--最大物防
                   {type=25, job = 0, value=2166},--最小魔防
                   {type=27, job = 0, value=5415},--最大魔防
                   {type=128, job = 0, value=900},--暴击几率
                   {type=129, job = 0, value=64980},--暴击伤害
                   {type=49, job = 0, value=-108},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=18194},--最小魔攻
                   {type=15, job = 2, value=45998},--最大魔攻
                   {type=17, job = 3, value=18194},--最小道攻
                   {type=19, job = 3, value=45998},--最大道攻
                 },
     },
-- 92级
    {
         itemCount = 258, -- 每次扣坐骑丹的数量
         maxExp = 25800, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=18796},--最小物攻
                   {type=11, job = 1, value=47578},--最大物攻
                   {type=5, job = 0, value=279700},--生命
                   {type=21, job = 0, value=2238},--最小物防
                   {type=23, job = 0, value=5594},--最大物防
                   {type=25, job = 0, value=2238},--最小魔防
                   {type=27, job = 0, value=5594},--最大魔防
                   {type=128, job = 0, value=910},--暴击几率
                   {type=129, job = 0, value=67128},--暴击伤害
                   {type=49, job = 0, value=-109.2},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=18796},--最小魔攻
                   {type=15, job = 2, value=47578},--最大魔攻
                   {type=17, job = 3, value=18796},--最小道攻
                   {type=19, job = 3, value=47578},--最大道攻
                 },
     },
-- 93级
    {
         itemCount = 258, -- 每次扣坐骑丹的数量
         maxExp = 25800, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=19397},--最小物攻
                   {type=11, job = 1, value=49158},--最大物攻
                   {type=5, job = 0, value=288650},--生命
                   {type=21, job = 0, value=2309},--最小物防
                   {type=23, job = 0, value=5773},--最大物防
                   {type=25, job = 0, value=2309},--最小魔防
                   {type=27, job = 0, value=5773},--最大魔防
                   {type=128, job = 0, value=920},--暴击几率
                   {type=129, job = 0, value=69276},--暴击伤害
                   {type=49, job = 0, value=-110.4},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=19397},--最小魔攻
                   {type=15, job = 2, value=49158},--最大魔攻
                   {type=17, job = 3, value=19397},--最小道攻
                   {type=19, job = 3, value=49158},--最大道攻
                 },
     },
-- 94级
    {
         itemCount = 258, -- 每次扣坐骑丹的数量
         maxExp = 25800, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=19999},--最小物攻
                   {type=11, job = 1, value=50738},--最大物攻
                   {type=5, job = 0, value=297600},--生命
                   {type=21, job = 0, value=2381},--最小物防
                   {type=23, job = 0, value=5952},--最大物防
                   {type=25, job = 0, value=2381},--最小魔防
                   {type=27, job = 0, value=5952},--最大魔防
                   {type=128, job = 0, value=930},--暴击几率
                   {type=129, job = 0, value=71424},--暴击伤害
                   {type=49, job = 0, value=-111.6},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=19999},--最小魔攻
                   {type=15, job = 2, value=50738},--最大魔攻
                   {type=17, job = 3, value=19999},--最小道攻
                   {type=19, job = 3, value=50738},--最大道攻
                 },
     },
-- 95级
    {
         itemCount = 258, -- 每次扣坐骑丹的数量
         maxExp = 25800, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=20600},--最小物攻
                   {type=11, job = 1, value=52318},--最大物攻
                   {type=5, job = 0, value=306550},--生命
                   {type=21, job = 0, value=2452},--最小物防
                   {type=23, job = 0, value=6131},--最大物防
                   {type=25, job = 0, value=2452},--最小魔防
                   {type=27, job = 0, value=6131},--最大魔防
                   {type=128, job = 0, value=940},--暴击几率
                   {type=129, job = 0, value=73572},--暴击伤害
                   {type=49, job = 0, value=-112.8},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=20600},--最小魔攻
                   {type=15, job = 2, value=52318},--最大魔攻
                   {type=17, job = 3, value=20600},--最小道攻
                   {type=19, job = 3, value=52318},--最大道攻
                 },
     },
-- 96级
    {
         itemCount = 258, -- 每次扣坐骑丹的数量
         maxExp = 25800, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=21202},--最小物攻
                   {type=11, job = 1, value=53898},--最大物攻
                   {type=5, job = 0, value=315500},--生命
                   {type=21, job = 0, value=2524},--最小物防
                   {type=23, job = 0, value=6310},--最大物防
                   {type=25, job = 0, value=2524},--最小魔防
                   {type=27, job = 0, value=6310},--最大魔防
                   {type=128, job = 0, value=950},--暴击几率
                   {type=129, job = 0, value=75720},--暴击伤害
                   {type=49, job = 0, value=-114},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=21202},--最小魔攻
                   {type=15, job = 2, value=53898},--最大魔攻
                   {type=17, job = 3, value=21202},--最小道攻
                   {type=19, job = 3, value=53898},--最大道攻
                 },
     },
-- 97级
    {
         itemCount = 258, -- 每次扣坐骑丹的数量
         maxExp = 25800, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=21803},--最小物攻
                   {type=11, job = 1, value=55478},--最大物攻
                   {type=5, job = 0, value=324450},--生命
                   {type=21, job = 0, value=2596},--最小物防
                   {type=23, job = 0, value=6489},--最大物防
                   {type=25, job = 0, value=2596},--最小魔防
                   {type=27, job = 0, value=6489},--最大魔防
                   {type=128, job = 0, value=960},--暴击几率
                   {type=129, job = 0, value=77868},--暴击伤害
                   {type=49, job = 0, value=-115.2},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=21803},--最小魔攻
                   {type=15, job = 2, value=55478},--最大魔攻
                   {type=17, job = 3, value=21803},--最小道攻
                   {type=19, job = 3, value=55478},--最大道攻
                 },
     },
-- 98级
    {
         itemCount = 258, -- 每次扣坐骑丹的数量
         maxExp = 25800, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=22404},--最小物攻
                   {type=11, job = 1, value=57058},--最大物攻
                   {type=5, job = 0, value=333400},--生命
                   {type=21, job = 0, value=2667},--最小物防
                   {type=23, job = 0, value=6668},--最大物防
                   {type=25, job = 0, value=2667},--最小魔防
                   {type=27, job = 0, value=6668},--最大魔防
                   {type=128, job = 0, value=970},--暴击几率
                   {type=129, job = 0, value=80016},--暴击伤害
                   {type=49, job = 0, value=-116.4},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=22404},--最小魔攻
                   {type=15, job = 2, value=57058},--最大魔攻
                   {type=17, job = 3, value=22404},--最小道攻
                   {type=19, job = 3, value=57058},--最大道攻
                 },
     },
-- 99级
    {
         itemCount = 258, -- 每次扣坐骑丹的数量
         maxExp = 25800, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=23006},--最小物攻
                   {type=11, job = 1, value=58638},--最大物攻
                   {type=5, job = 0, value=342350},--生命
                   {type=21, job = 0, value=2739},--最小物防
                   {type=23, job = 0, value=6847},--最大物防
                   {type=25, job = 0, value=2739},--最小魔防
                   {type=27, job = 0, value=6847},--最大魔防
                   {type=128, job = 0, value=980},--暴击几率
                   {type=129, job = 0, value=82164},--暴击伤害
                   {type=49, job = 0, value=-117.6},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=23006},--最小魔攻
                   {type=15, job = 2, value=58638},--最大魔攻
                   {type=17, job = 3, value=23006},--最小道攻
                   {type=19, job = 3, value=58638},--最大道攻
                 },
     },
-- 100级
    {
         itemCount = 258, -- 每次扣坐骑丹的数量
         maxExp = 25800, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=23607},--最小物攻
                   {type=11, job = 1, value=60218},--最大物攻
                   {type=5, job = 0, value=351300},--生命
                   {type=21, job = 0, value=2810},--最小物防
                   {type=23, job = 0, value=7026},--最大物防
                   {type=25, job = 0, value=2810},--最小魔防
                   {type=27, job = 0, value=7026},--最大魔防
                   {type=128, job = 0, value=990},--暴击几率
                   {type=129, job = 0, value=84312},--暴击伤害
                   {type=49, job = 0, value=-118.8},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=23607},--最小魔攻
                   {type=15, job = 2, value=60218},--最大魔攻
                   {type=17, job = 3, value=23607},--最小道攻
                   {type=19, job = 3, value=60218},--最大道攻
                 },
     },
-- 101级
    {
         itemCount = 999, -- 每次扣坐骑丹的数量
         maxExp = 99900, -- 可升级经验
         attrs = {
                   {type=9, job = 1, value=24209},--最小物攻
                   {type=11, job = 1, value=61798},--最大物攻
                   {type=5, job = 0, value=360250},--生命
                   {type=21, job = 0, value=2882},--最小物防
                   {type=23, job = 0, value=7205},--最大物防
                   {type=25, job = 0, value=2882},--最小魔防
                   {type=27, job = 0, value=7205},--最大魔防
                   {type=128, job = 0, value=1000},--暴击几率
                   {type=129, job = 0, value=86460},--暴击伤害
                   {type=49, job = 0, value=-120},--坐骑移动速度 初始为400
                   {type=13, job = 2, value=24209},--最小魔攻
                   {type=15, job = 2, value=61798},--最大魔攻
                   {type=17, job = 3, value=24209},--最小道攻
                   {type=19, job = 3, value=61798},--最大道攻
                 },
     },



	},
	
}