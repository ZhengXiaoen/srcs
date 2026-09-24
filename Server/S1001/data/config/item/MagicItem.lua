
--#include "..\..\language\LangCode.txt"
MagicItems =
{
 
	
	
	beadMaxLevel = {20, 20, 20, 20, 20, 20},	--魔珠等级上限 {白色0、绿色1、蓝色2、紫色3、黄色4}
	beadExpParam = {1, 8, 25, 45, 90, 180},			--魔珠升级经验系数{白色、绿色、蓝色、紫色、黄色}
	beadExpTbl = --与品质相关 魔珠升级经验 每级升级经验={0-1级, 1-2级, 2-3级,...}*品质*系数
	{
		1,2,	6,	14,	26,	42,	62,	86,	114,	146,	182,	222,	266,	314,	366,	422,	482,	546,	614,	686,	762,
	},
	
	beadName =	--魔珠对于各个品质的名字
	{
		--各个品质对应的魔珠名字 {白色使用原名字、绿色、蓝色、紫色、黄色}其中白色的使用物品配置的名字
		--竖行使用stdItem的shape ，例如shape=1使用第一组配置...
{	Lang.Item.bead1L1,	Lang.Item.bead1L2,	Lang.Item.bead1L3,	Lang.Item.bead1L4,	},
{	Lang.Item.bead2L1,	Lang.Item.bead2L2,	Lang.Item.bead2L3,	Lang.Item.bead2L4,	},
{	Lang.Item.bead3L1,	Lang.Item.bead3L2,	Lang.Item.bead3L3,	Lang.Item.bead3L4,	},
{	Lang.Item.bead4L1,	Lang.Item.bead4L2,	Lang.Item.bead4L3,	Lang.Item.bead4L4,	},
{	Lang.Item.bead5L1,	Lang.Item.bead5L2,	Lang.Item.bead5L3,	Lang.Item.bead5L4,	},
{	Lang.Item.bead6L1,	Lang.Item.bead6L2,	Lang.Item.bead6L3,	Lang.Item.bead6L4,	},
{	Lang.Item.bead7L1,	Lang.Item.bead7L2,	Lang.Item.bead7L3,	Lang.Item.bead7L4,	},
{	Lang.Item.bead8L1,	Lang.Item.bead8L2,	Lang.Item.bead8L3,	Lang.Item.bead8L4,	},
{	Lang.Item.bead9L1,	Lang.Item.bead9L2,	Lang.Item.bead9L3,	Lang.Item.bead9L4,	},
{	Lang.Item.bead10L1,	Lang.Item.bead10L2,	Lang.Item.bead10L3,	Lang.Item.bead10L4,	},
{	Lang.Item.bead11L1,	Lang.Item.bead11L2,	Lang.Item.bead11L3,	Lang.Item.bead11L4,	},
{	Lang.Item.bead12L1,	Lang.Item.bead12L2,	Lang.Item.bead12L3,	Lang.Item.bead12L4,	},
{	Lang.Item.bead13L1,	Lang.Item.bead13L2,	Lang.Item.bead13L3,	Lang.Item.bead13L4,	},
{	Lang.Item.bead14L1,	Lang.Item.bead14L2,	Lang.Item.bead14L3,	Lang.Item.bead14L4,	},
			
	},
	
	beadActive = {20, 30, 40, 50, 60}, 	--魔珠激活的法宝等级 {金, 木, 水, 火, 土}
	
	magicUpgrade = 100,	--法宝灵力注入每次消耗
	
	magicComposite =	--法宝合成
	{
		{
			itemId = 1713,	--生成的法宝
			quality = --随机星级范围 总概率为10000
			{
				{value = 1, prop = 1000},	--10000
				{value = 2, prop = 2000},	--10000
			},
			consumes = 	--消耗要求物品
			{
				--usetype:消耗类型(0普通消耗 1保护消耗)  yb:元宝替换数(去掉此值代表此项消耗不能使用元宝替代)
				{type = 0, id = 559, count = 10, quality = 0, strong = 0, yb = 30},

				{type = 6, id = 0, count = 100000}
			},
		},
		{
			itemId = 1714,	--生成的法宝
			quality = --随机星级范围
			{
				{value = 1, prop = 1000},	--10000
				{value = 2, prop = 2000},	--10000
			},
			consumes = 	--消耗要求物品
			{
				--usetype:消耗类型(0普通消耗 1保护消耗)  yb:元宝替换数(去掉此值代表此项消耗不能使用元宝替代)
				{type = 0, id = 559, count = 10, quality = 0, strong = 0, yb = 30},

				{type = 6, id = 0, count = 100000}
			},
		},
		{
			itemId = 1715,	--生成的法宝
			quality = --随机星级范围
			{
				{value = 1, prop = 1000},	--10000
				{value = 2, prop = 2000},	--10000
			},
			consumes = 	--消耗要求物品
			{
				--usetype:消耗类型(0普通消耗 1保护消耗)  yb:元宝替换数(去掉此值代表此项消耗不能使用元宝替代)
				{type = 0, id = 559, count = 10, quality = 0, strong = 0, yb = 30},

				{type = 6, id = 0, count = 100000}
			},
		},
	},
	
	huntingTips = Lang.ScriptTips.magic009,
	huntingBead =
	{
		--猎魔人 点击猎魔人时有机会刷新下个等级的猎魔人和从魔珠库里抽出魔珠
		{
			id = 1,			--猎魔人id
			hunter = Lang.ScriptTips.magic010,	--猎魔人名字描述
			level = Lang.ScriptTips.magic011,	--等级描述
			consume = 20,	--消耗灵力
			probs = 	--刷新下一个几率 1/10000
			{
				{id = 2, prob = 3000},	--{id=猎魔人id, prop=刷新几率}
			},		
			dropName = "data/config/item/scriptItemConfig/MagicBeadDrops/probDrops1.lua",	--奖励库
		},
		{
			id = 2,			--猎魔人id
			hunter = Lang.ScriptTips.magic012,	--猎魔人名字描述
			level = Lang.ScriptTips.magic013,	--等级描述
			consume = 40,	--消耗灵力
			probs = 	--刷新下一个几率 1/10000
			{
				{id = 3, prob = 2000},	--{id=猎魔人id, prop=刷新几率}
			},		
			dropName = "data/config/item/scriptItemConfig/MagicBeadDrops/probDrops2.lua",	--奖励库
		},
		{
			id = 3,			--猎魔人id
			hunter = Lang.ScriptTips.magic014,	--猎魔人名字描述
			level = Lang.ScriptTips.magic015,	--等级描述
			consume = 200,	--消耗灵力
			probs = 	--刷新下一个几率 1/10000
			{
				{id = 4, prob = 2000},	--{id=猎魔人id, prop=刷新几率}
			},		
			dropName = "data/config/item/scriptItemConfig/MagicBeadDrops/probDrops3.lua",	--奖励库
		},
		{
			id = 4,			--猎魔人id
			hunter = Lang.ScriptTips.magic016,	--猎魔人名字描述
			level = Lang.ScriptTips.magic017,	--等级描述
			consume = 400,	--消耗灵力
			probs = 	--刷新下一个几率 1/10000
			{
				{id = 5, prob = 1000},	--{id=猎魔人id, prop=刷新几率}
			},		
			dropName = "data/config/item/scriptItemConfig/MagicBeadDrops/probDrops4.lua",	--奖励库
		},
		{
			id = 5,			--猎魔人id
			hunter = Lang.ScriptTips.magic018,	--猎魔人名字描述
			level = Lang.ScriptTips.magic019,	--等级描述
			consume = 800,	--消耗灵力
			probs = 	--刷新下一个几率 1/10000
			{
				
			},		
			dropName = "data/config/item/scriptItemConfig/MagicBeadDrops/probDrops5.lua",	--奖励库
		},
	},
	
	magicPowerInterval = 1800,	--定时加灵力间隔(秒) 必须>=1分钟
	magicPowerLevel = 50,		--在线加灵力等级限制
	magicPowerAddValue = 10,	--在线灵力加成值

	breakDownExp = {10, 20, 30, 40, 50, 60, 70, 80, 90, 100},	--法宝分解{1星, 2星...} 分解的经验 = breakDownExp[quality] + magicExpTbl[strong] * (breakRate/10000)
	breakRate = 1000,		--分解率 1/10000 
	
	magicMaxLevel = {
60,--星级1
70,--星级2
80,--星级3
90,--星级4
100,--星级5
110,--星级6
120,--星级7
130,--星级8
140,--星级9


},	--法宝等级上限 {1星, 2星...}
	magicExpTbl = --法宝升级经验 {0-1级, 1-2级, 2-3级,...}
	{
30,--升级到1级
40,--升级到2级
40,--升级到3级
60,--升级到4级
60,--升级到5级
80,--升级到6级
110,--升级到7级
150,--升级到8级
190,--升级到9级
250,--升级到10级
310,--升级到11级
390,--升级到12级
480,--升级到13级
590,--升级到14级
710,--升级到15级
850,--升级到16级
1010,--升级到17级
1190,--升级到18级
1380,--升级到19级
1600,--升级到20级
1850,--升级到21级
2100,--升级到22级
2400,--升级到23级
2710,--升级到24级
3060,--升级到25级
3420,--升级到26级
3820,--升级到27级
4250,--升级到28级
4710,--升级到29级
5200,--升级到30级
5720,--升级到31级
6290,--升级到32级
6880,--升级到33级
7510,--升级到34级
8180,--升级到35级
8890,--升级到36级
9630,--升级到37级
10430,--升级到38级
11260,--升级到39级
12130,--升级到40级
13050,--升级到41级
14010,--升级到42级
15020,--升级到43级
16090,--升级到44级
17180,--升级到45级
18350,--升级到46级
19550,--升级到47级
20810,--升级到48级
22120,--升级到49级
23490,--升级到50级
24900,--升级到51级
26390,--升级到52级
27920,--升级到53级
29510,--升级到54级
31170,--升级到55级
32880,--升级到56级
34650,--升级到57级
36500,--升级到58级
38390,--升级到59级
40360,--升级到60级
42400,--升级到61级
44490,--升级到62级
46670,--升级到63级
48900,--升级到64级
51210,--升级到65级
53590,--升级到66级
56040,--升级到67级
58570,--升级到68级
61170,--升级到69级
63840,--升级到70级
66610,--升级到71级
69430,--升级到72级
72340,--升级到73级
75340,--升级到74级
78410,--升级到75级
81570,--升级到76级
84800,--升级到77级
88130,--升级到78级
91540,--升级到79级
95040,--升级到80级
98620,--升级到81级
102300,--升级到82级
106060,--升级到83级
109910,--升级到84级
113860,--升级到85级
117900,--升级到86级
122040,--升级到87级
126270,--升级到88级
130600,--升级到89级
135020,--升级到90级
139540,--升级到91级
144180,--升级到92级
148890,--升级到93级
153730,--升级到94级
158650,--升级到95级
163690,--升级到96级
168830,--升级到97级
174080,--升级到98级
179440,--升级到99级
184890,--升级到100级
190470,--升级到101级
196160,--升级到102级
201950,--升级到103级
207860,--升级到104级
213880,--升级到105级
220030,--升级到106级
226280,--升级到107级
232650,--升级到108级
239140,--升级到109级
245750,--升级到110级
252490,--升级到111级
259340,--升级到112级
266320,--升级到113级
273410,--升级到114级
280640,--升级到115级
288000,--升级到116级
295470,--升级到117级
303080,--升级到118级
310820,--升级到119级
318690,--升级到120级
326680,--升级到121级
334820,--升级到122级
343080,--升级到123级
351480,--升级到124级
360020,--升级到125级
368700,--升级到126级
377510,--升级到127级
386460,--升级到128级
395550,--升级到129级
404780,--升级到130级
414160,--升级到131级
423680,--升级到132级
433350,--升级到133级
443150,--升级到134级
453120,--升级到135级
463210,--升级到136级
473480,--升级到137级
483880,--升级到138级
494430,--升级到139级
505140,--升级到140级
516010,--升级到141级


	},
 

	
		
}