--lua script
--#include "..\..\..\language\LangCode.txt"
--跨服boss配置

CrossBossConfig =
{
	nLevel = 0,								--进入的最低等级：原50
	nBattle = 3500,								--进入的最低战力
	CrossDes = Lang.Activity.ku0011,			--跨服boss说明

	BattleTimes = 3600,							--在跨服BOSS场景中多久

	NumOneTime = Lang.Activity.ku0012,			--跨服天下第一活动时间
	NumOneCanEnter = Lang.Activity.ku0013,		--跨服天下第一进入比赛区条件
	NumOneEnterLook = Lang.Activity.ku0014,		--跨服天下第一进入观战区条件
	NumOneDes = Lang.Activity.ku0015,			--天下第一活动说明
	GuildSbkDes = Lang.Activity.ku0016,			--跨服沙城战规则
	GuildSbkTime = Lang.Activity.ku0042,			--跨服沙城战开启时间	

	BossConfig =
	{
		--第一个boss
		{
			iconId = 653,				--怪物头像id
			monsterid = 653,		--boss的id
			sceneid =150,			--刷怪的场景

			pos_x = 106,			--刷怪的场景坐标x
			pos_y = 40,			--刷怪的场景坐标y

			x = 330,					--模型在面板上显示的坐标x
			y = 70,					--模型在面板上显示的坐标y

			liveTime = 3600,						--存活时间
			mobTime = Lang.Activity.ku0009,			--出现时间
			canEnter = Lang.Activity.ku0010,		--进入条件

			--杀了怪物掉落的东西
			awards=
			{

{type=0,id=982,count=1,strong=0,quality=0},--黄金麻痹戒指
{type=0,id=983,count=1,strong=0,quality=0},--红玉护体戒指
{type=0,id=984,count=1,strong=0,quality=0},--蓝灵复活戒指
{type=0,id=549,count=1,strong=0,quality=0},--麻痹戒指
{type=0,id=550,count=1,strong=0,quality=0},--护体戒指
{type=0,id=551,count=1,strong=0,quality=0},--复活戒指

{type=0,id=1402,count=1,strong=0,quality=0},--五级灵珠
{type=0,id=283,count=1,strong=0,quality=0},--四级灵珠
{type=0,id=282,count=1,strong=0,quality=0},--三级灵珠

{type=0,id=1199,count=1,strong=0,quality=0},--炼狱护腕
{type=0,id=1203,count=1,strong=0,quality=0},--炼狱戒指
{type=0,id=1210,count=1,strong=0,quality=0},--辉煌手镯
{type=0,id=1214,count=1,strong=0,quality=0},--辉煌戒指
{type=0,id=1221,count=1,strong=0,quality=0},--碧海手镯
{type=0,id=1225,count=1,strong=0,quality=0},--碧海戒指

{type=0,id=231,count=1,strong=0,quality=1},--千钧手镯
{type=0,id=235,count=1,strong=0,quality=1},--千钧戒指
{type=0,id=242,count=1,strong=0,quality=1},--烈焰手镯
{type=0,id=246,count=1,strong=0,quality=1},--烈焰戒指
{type=0,id=253,count=1,strong=0,quality=1},--冥魅手镯
{type=0,id=257,count=1,strong=0,quality=1},--冥魅戒指


{type=0,id=747,count=1,strong=0,quality=0},--3级物攻魂石
{type=0,id=757,count=1,strong=0,quality=0},--3级魔攻魂石
{type=0,id=767,count=1,strong=0,quality=0},--3级道攻魂石
{type=0,id=777,count=1,strong=0,quality=0},--3级物防魂石
{type=0,id=787,count=1,strong=0,quality=0},--3级魔防魂石
{type=0,id=797,count=1,strong=0,quality=0},--3级生命魂石
{type=0,id=807,count=1,strong=0,quality=0},--3级魔法魂石

{type=0,id=618,count=1,strong=0,quality=0},--金条

{type=0,id=1409,count=1,strong=0,quality=0},--超级英雄经验丹
{type=0,id=704,count=1,strong=0,quality=0},--高级怒气丹
{type=0,id=731,count=1,strong=0,quality=0},--快马鞭
{type=0,id=628,count=1,strong=0,quality=0},--5倍经验神符
{type=0,id=1036,count=1,strong=0,quality=0},--千万经验灵符

			},

		},

		--第二个
		{
			iconId = 650,				--怪物头像id
			monsterid = 650,
			sceneid =150,

			pos_x = 107,
			pos_y = 41,

			x = 330,
			y = 60,

			liveTime = 3600,
			mobTime = Lang.Activity.ku0009,
			canEnter = Lang.Activity.ku0010,

			--杀了怪物掉落的东西
			awards=
			{
{type=0,id=982,count=1,strong=0,quality=0},--黄金麻痹戒指
{type=0,id=983,count=1,strong=0,quality=0},--红玉护体戒指
{type=0,id=984,count=1,strong=0,quality=0},--蓝灵复活戒指
{type=0,id=549,count=1,strong=0,quality=0},--麻痹戒指
{type=0,id=550,count=1,strong=0,quality=0},--护体戒指
{type=0,id=551,count=1,strong=0,quality=0},--复活戒指

{type=0,id=1402,count=1,strong=0,quality=0},--五级灵珠
{type=0,id=283,count=1,strong=0,quality=0},--四级灵珠
{type=0,id=282,count=1,strong=0,quality=0},--三级灵珠

{type=0,id=1198,count=1,strong=0,quality=0},--炼狱项链
{type=0,id=1200,count=1,strong=0,quality=0},--炼狱腰带
{type=0,id=1209,count=1,strong=0,quality=0},--辉煌项链
{type=0,id=1211,count=1,strong=0,quality=0},--辉煌腰带
{type=0,id=1220,count=1,strong=0,quality=0},--碧海项链
{type=0,id=1222,count=1,strong=0,quality=0},--碧海腰带


{type=0,id=230,count=1,strong=0,quality=1},--千钧项链
{type=0,id=232,count=1,strong=0,quality=1},--千钧腰带
{type=0,id=241,count=1,strong=0,quality=1},--烈焰项链
{type=0,id=243,count=1,strong=0,quality=1},--烈焰腰带
{type=0,id=252,count=1,strong=0,quality=1},--冥魅项链
{type=0,id=254,count=1,strong=0,quality=1},--冥魅腰带


{type=0,id=747,count=1,strong=0,quality=0},--3级物攻魂石
{type=0,id=757,count=1,strong=0,quality=0},--3级魔攻魂石
{type=0,id=767,count=1,strong=0,quality=0},--3级道攻魂石
{type=0,id=777,count=1,strong=0,quality=0},--3级物防魂石
{type=0,id=787,count=1,strong=0,quality=0},--3级魔防魂石
{type=0,id=797,count=1,strong=0,quality=0},--3级生命魂石
{type=0,id=807,count=1,strong=0,quality=0},--3级魔法魂石

{type=0,id=618,count=1,strong=0,quality=0},--金条

{type=0,id=1409,count=1,strong=0,quality=0},--超级英雄经验丹
{type=0,id=704,count=1,strong=0,quality=0},--高级怒气丹
{type=0,id=731,count=1,strong=0,quality=0},--快马鞭
{type=0,id=628,count=1,strong=0,quality=0},--5倍经验神符
{type=0,id=1036,count=1,strong=0,quality=0},--千万经验灵符
			},
		},
--第三个
		{
			iconId = 651,				--怪物头像id
			monsterid = 651,
			sceneid =150,

			pos_x = 108,
			pos_y = 42,

			x = 330,
			y = 70,

			liveTime = 3600,
			mobTime = Lang.Activity.ku0009,
			canEnter = Lang.Activity.ku0010,

			--杀了怪物掉落的东西
			awards=
			{
{type=0,id=982,count=1,strong=0,quality=0},--黄金麻痹戒指
{type=0,id=983,count=1,strong=0,quality=0},--红玉护体戒指
{type=0,id=984,count=1,strong=0,quality=0},--蓝灵复活戒指
{type=0,id=549,count=1,strong=0,quality=0},--麻痹戒指
{type=0,id=550,count=1,strong=0,quality=0},--护体戒指
{type=0,id=551,count=1,strong=0,quality=0},--复活戒指

{type=0,id=1402,count=1,strong=0,quality=0},--五级灵珠
{type=0,id=283,count=1,strong=0,quality=0},--四级灵珠
{type=0,id=282,count=1,strong=0,quality=0},--三级灵珠

{type=0,id=1201,count=1,strong=0,quality=0},--炼狱战靴
{type=0,id=1202,count=1,strong=0,quality=0},--炼狱宝石
{type=0,id=1212,count=1,strong=0,quality=0},--辉煌法履
{type=0,id=1213,count=1,strong=0,quality=0},--辉煌宝石
{type=0,id=1223,count=1,strong=0,quality=0},--碧海道鞋
{type=0,id=1224,count=1,strong=0,quality=0},--碧海宝石


{type=0,id=233,count=1,strong=0,quality=1},--千钧战靴
{type=0,id=234,count=1,strong=0,quality=1},--千钧宝石
{type=0,id=244,count=1,strong=0,quality=1},--烈焰法履
{type=0,id=245,count=1,strong=0,quality=1},--烈焰宝石
{type=0,id=255,count=1,strong=0,quality=1},--冥魅道鞋
{type=0,id=256,count=1,strong=0,quality=1},--冥魅宝石



{type=0,id=748,count=1,strong=0,quality=0},--4级物攻魂石
{type=0,id=758,count=1,strong=0,quality=0},--4级魔攻魂石
{type=0,id=768,count=1,strong=0,quality=0},--4级道攻魂石
{type=0,id=778,count=1,strong=0,quality=0},--4级物防魂石
{type=0,id=788,count=1,strong=0,quality=0},--4级魔防魂石
{type=0,id=798,count=1,strong=0,quality=0},--4级生命魂石
{type=0,id=808,count=1,strong=0,quality=0},--4级魔法魂石


{type=0,id=618,count=1,strong=0,quality=0},--金条

{type=0,id=1409,count=1,strong=0,quality=0},--超级英雄经验丹
{type=0,id=704,count=1,strong=0,quality=0},--高级怒气丹
{type=0,id=731,count=1,strong=0,quality=0},--快马鞭
{type=0,id=628,count=1,strong=0,quality=0},--5倍经验神符
{type=0,id=1036,count=1,strong=0,quality=0},--千万经验灵符
			},
		},
--第四个
		{
			iconId = 652,				--怪物头像id
			monsterid = 652,
			sceneid =150,

			pos_x = 105,
			pos_y = 39,

			x = 330,
			y = 70,

			liveTime = 3600,
			mobTime = Lang.Activity.ku0009,
			canEnter = Lang.Activity.ku0010,

			--杀了怪物掉落的东西
			awards=
			{
{type=0,id=982,count=1,strong=0,quality=0},--黄金麻痹戒指
{type=0,id=983,count=1,strong=0,quality=0},--红玉护体戒指
{type=0,id=984,count=1,strong=0,quality=0},--蓝灵复活戒指
{type=0,id=549,count=1,strong=0,quality=0},--麻痹戒指
{type=0,id=550,count=1,strong=0,quality=0},--护体戒指
{type=0,id=551,count=1,strong=0,quality=0},--复活戒指

{type=0,id=1402,count=1,strong=0,quality=0},--五级灵珠
{type=0,id=283,count=1,strong=0,quality=0},--四级灵珠
{type=0,id=282,count=1,strong=0,quality=0},--三级灵珠

{type=0,id=1195,count=1,strong=0,quality=0},--炼狱战甲(男)
{type=0,id=1196,count=1,strong=0,quality=0},--炼狱战甲(女)
{type=0,id=1206,count=1,strong=0,quality=0},--辉煌魔袍(男)
{type=0,id=1207,count=1,strong=0,quality=0},--辉煌魔袍(女)
{type=0,id=1217,count=1,strong=0,quality=0},--碧海道衣(男)
{type=0,id=1218,count=1,strong=0,quality=0},--碧海道衣(女)


{type=0,id=227,count=1,strong=0,quality=2},--千钧战甲(男)
{type=0,id=228,count=1,strong=0,quality=2},--千钧战甲(女)
{type=0,id=238,count=1,strong=0,quality=2},--烈焰魔袍(男)
{type=0,id=239,count=1,strong=0,quality=2},--烈焰魔袍(女)
{type=0,id=249,count=1,strong=0,quality=2},--冥魅道衣(男)
{type=0,id=250,count=1,strong=0,quality=2},--冥魅道衣(女)



{type=0,id=749,count=1,strong=0,quality=0},--5级物攻魂石
{type=0,id=759,count=1,strong=0,quality=0},--5级魔攻魂石
{type=0,id=769,count=1,strong=0,quality=0},--5级道攻魂石
{type=0,id=779,count=1,strong=0,quality=0},--5级物防魂石
{type=0,id=789,count=1,strong=0,quality=0},--5级魔防魂石
{type=0,id=799,count=1,strong=0,quality=0},--5级生命魂石
{type=0,id=809,count=1,strong=0,quality=0},--5级魔法魂石


{type=0,id=618,count=1,strong=0,quality=0},--金条

{type=0,id=1409,count=1,strong=0,quality=0},--超级英雄经验丹
{type=0,id=704,count=1,strong=0,quality=0},--高级怒气丹
{type=0,id=731,count=1,strong=0,quality=0},--快马鞭
{type=0,id=628,count=1,strong=0,quality=0},--5倍经验神符
{type=0,id=1036,count=1,strong=0,quality=0},--千万经验灵符


			},
		},
	},
}

