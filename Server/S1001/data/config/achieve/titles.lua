--#include"..\..\language\LangCode.txt"

--称号增加groupId表示这个称号是哪个组的，默认是0，否则填写buff的id,从1开始，一个buff组里的buff只能存在一个
--同时增加了time表示有效时间，默认是0可以不配置，否则表示这个称号的有效时间，单位秒
--增加了showOnlyGet标记，默认是false，可以不配置，否则只在玩家有这个称号的时候才显示，如果配置了true，那么只有玩家在有这个称号才会显示
--isDelete表示称号是删除的，默认是false，如果是true表示该称号被删除了，客户端不用显示出来
--headTitleId设置称号对应的头衔id不配置默认0
--isFamous是否是名人堂的称号，这种称号需要特殊处理，拥有以后有一些特权isFamous=true表示是，默认不用配置  w w w .   c n 1   2 1. c o m

Titles=
{

	{
		name="",
		desc="",
		buff={
							{type=0,group=2,value=0},
		},
		groupId=0,
		showOnlyGet=false,
		time=0,
		isDelete=false,
		headTitleId=0,
		calcAttr = {}
	},
	
	--一阶战将
	{
		name='一阶战将',
		desc='战士历练称号',
		calcAttr={
				{type=9 ,value=18},
				{type=11,value=120},
				{type=21,value=9},
				{type=23,value=60},
				{type=25,value=6},
				{type=27,value=40},
			},
		groupId=0,
		showOnlyGet=false,
		time=0,
		isDelete=false,
		profession=1,
		needAchieve=5000,
		buff = {},
		job = 1
	},
	--二阶战狂
	{
		name='二阶战狂',
		desc='战士历练称号',
		calcAttr={
				{type=9 ,value=22},
				{type=11,value=150},
				{type=21,value=11},
				{type=23,value=75},
				{type=25,value=8},
				{type=27,value=50},
		},
		groupId=0,
		showOnlyGet=false,
		time=0,
		isDelete=false,
		profession=1,
		needAchieve=200000,
		job = 1,
		buff = {}
	},
	--三阶武狂
	{
		name='三阶武狂',
		desc='战士历练称号',
		calcAttr={
				{type=9 ,value=28},
				{type=11,value=188},
				{type=21,value=14},
				{type=23,value=94},
				{type=25,value=10},
				{type=27,value=63},
		},
		groupId=0,
		showOnlyGet=false,
		time=0,
		isDelete=false,
		profession=1,
		needAchieve=580000,
		job = 1,
		buff = {}
	},
	--四阶武宗
	{
		name='四阶武宗',
		desc='战士历练称号',
		calcAttr={
				{type=9 ,value=35},
				{type=11,value=235},
				{type=21,value=18},
				{type=23,value=118},
				{type=25,value=13},
				{type=27,value=79},
		},
		groupId=0,
		showOnlyGet=false,
		time=0,
		isDelete=false,
		profession=1,
		needAchieve=1320000,
		job = 1,
		buff = {}
	},
	--五阶武尊
	{
		name='五阶武尊',
		desc='战士历练称号',
		calcAttr={
				{type=9 ,value=44},
				{type=11,value=294},
				{type=21,value=23},
				{type=23,value=148},
				{type=25,value=16},
				{type=27,value=99},
		},
		groupId=0,
		showOnlyGet=false,
		time=0,
		isDelete=false,
		profession=1,
		needAchieve=2680000,
		job = 1,
		buff = {}
	},
	--六阶神武战将
	{
		name='六阶神武战将',
		desc='战士历练称号',
		calcAttr={
				{type=9 ,value=54},
				{type=11,value=368},
				{type=21,value=29},
				{type=23,value=185},
				{type=25,value=20},
				{type=27,value=124},
		},
		groupId=0,
		showOnlyGet=false,
		time=0,
		isDelete=false,
		profession=1,
		needAchieve=4840000,
		job = 1,
		buff = {}
	},
	--七阶神武战狂
	{
		name='七阶神武战狂',
		desc='战士历练称号',
		calcAttr={
				{type=9 ,value=68},
				{type=11,value=460},
				{type=21,value=36},
				{type=23,value=231},
				{type=25,value=25},
				{type=27,value=155},
		},
		groupId=0,
		showOnlyGet=false,
		time=0,
		isDelete=false,
		profession=1,
		needAchieve=8080000,
		job = 1,
		buff = {}
	},
	--八阶神武武狂
	{
		name='八阶神武武狂',
		desc='战士历练称号',
		calcAttr={
				{type=9 ,value=85},
				{type=11,value=575},
				{type=21,value=45},
				{type=23,value=289},
				{type=25,value=31},
				{type=27,value=194},
		},
		groupId=0,
		showOnlyGet=false,
		time=0,
		isDelete=false,
		profession=1,
		needAchieve=12800000,
		job = 1,
		buff = {}
	},
	--九阶神武武宗
	{
		name='九阶神武武宗',
		desc='战士历练称号',
		calcAttr={
				{type=9 ,value=106},
				{type=11,value=719},
				{type=21,value=56},
				{type=23,value=361},
				{type=25,value=39},
				{type=27,value=243},
		},
		groupId=0,
		showOnlyGet=false,
		time=0,
		isDelete=false,
		profession=1,
		needAchieve=19350000,
		job = 1,
		buff = {}
	},
	--十阶神武武尊
	{
		name='十阶神武武尊',
		desc='战士历练称号',
		calcAttr={
				{type=9 ,value=133},
				{type=11,value=899},
				{type=21,value=70},
				{type=23,value=451},
				{type=25,value=49},
				{type=27,value=304},
		},
		groupId=0,
		showOnlyGet=false,
		time=0,
		isDelete=false,
		profession=1,
		needAchieve=28400000,
		job = 1,
		buff = {}
	},
	--至尊狂霸战神
	{
		name='至尊狂霸战神',
		desc='战士历练称号',
		calcAttr={
				{type=9 ,value=166},
				{type=11,value=1124},
				{type=21,value=88},
				{type=23,value=564},
				{type=25,value=61},
				{type=27,value=380},
		},
		groupId=0,
		showOnlyGet=false,
		time=0,
		isDelete=false,
		profession=1,
		needAchieve=40800000,
		job = 1,
		buff = {}
	},
	--一阶法魂
	{
		name='一阶法魂',
		desc='法师历练称号',
		calcAttr={
				{type=13,value=18},
				{type=15,value=120},
				{type=21,value=9},
				{type=23,value=60},
				{type=25,value=6},
				{type=27,value=40},
			},
		groupId=0,
		showOnlyGet=false,
		time=0,
		isDelete=false,
		profession=2,
		needAchieve=5000,
		job = 2,
		buff = {}
	},
	--二阶法魄
	{
		name='二阶法魄',
		desc='法师历练称号',
		calcAttr={
				{type=13,value=22},
				{type=15,value=150},
				{type=21,value=11},
				{type=23,value=75},
				{type=25,value=8},
				{type=27,value=50},
		},
		groupId=0,
		showOnlyGet=false,
		time=0,
		isDelete=false,
		profession=2,
		needAchieve=200000,
		job = 2,
		buff = {}
	},
	--三阶法灵
	{
		name='三阶法灵',
		desc='法师历练称号',
		calcAttr={
				{type=13,value=28},
				{type=15,value=188},
				{type=21,value=14},
				{type=23,value=94},
				{type=25,value=10},
				{type=27,value=63},
		},
		groupId=0,
		showOnlyGet=false,
		time=0,
		isDelete=false,
		profession=2,
		needAchieve=580000,
		job = 2,
		buff = {}
	},
	--四阶法王
	{
		name='四阶法王',
		desc='法师历练称号',
		calcAttr={
				{type=13,value=35},
				{type=15,value=235},
				{type=21,value=18},
				{type=23,value=118},
				{type=25,value=13},
				{type=27,value=79},
		},
		groupId=0,
		showOnlyGet=false,
		time=0,
		isDelete=false,
		profession=2,
		needAchieve=1320000,
		job = 2,
		buff = {}
	},
	--五阶法神
	{
		name='五阶法神',
		desc='法师历练称号',
		calcAttr={
				{type=13,value=44},
				{type=15,value=294},
				{type=21,value=23},
				{type=23,value=148},
				{type=25,value=16},
				{type=27,value=99},
		},
		groupId=0,
		showOnlyGet=false,
		time=0,
		isDelete=false,
		profession=2,
		needAchieve=2680000,
		job = 2,
		buff = {}
	},
	--六阶幻魔法魂
	{
		name='六阶幻魔法魂',
		desc='法师历练称号',
		calcAttr={
				{type=13,value=54},
				{type=15,value=368},
				{type=21,value=29},
				{type=23,value=185},
				{type=25,value=20},
				{type=27,value=124},
		},
		groupId=0,
		showOnlyGet=false,
		time=0,
		isDelete=false,
		profession=2,
		needAchieve=4840000,
		job = 2,
		buff = {}
	},
	--七阶幻魔法魄
	{
		name='七阶幻魔法魄',
		desc='法师历练称号',
		calcAttr={
				{type=13,value=68},
				{type=15,value=460},
				{type=21,value=36},
				{type=23,value=231},
				{type=25,value=25},
				{type=27,value=155},
		},
		groupId=0,
		showOnlyGet=false,
		time=0,
		isDelete=false,
		profession=2,
		needAchieve=8080000,
		job = 2,
		buff = {}
	},
	--八阶幻魔法灵
	{
		name='八阶幻魔法灵',
		desc='法师历练称号',
		calcAttr={
				{type=13,value=85},
				{type=15,value=575},
				{type=21,value=45},
				{type=23,value=289},
				{type=25,value=31},
				{type=27,value=194},
		},
		groupId=0,
		showOnlyGet=false,
		time=0,
		isDelete=false,
		profession=2,
		needAchieve=12800000,
		job = 2,
		buff = {}
	},
	--九阶幻魔法王
	{
		name='九阶幻魔法王',
		desc='法师历练称号',
		calcAttr={
				{type=13,value=103},
				{type=15,value=719},
				{type=21,value=56},
				{type=23,value=361},
				{type=25,value=39},
				{type=27,value=243},
		},
		groupId=0,
		showOnlyGet=false,
		time=0,
		isDelete=false,
		profession=2,
		needAchieve=19350000,
		job = 2,
		buff = {}
	},
	--十阶幻魔法神
	{
		name='十阶幻魔法神',
		desc='法师历练称号',
		calcAttr={
				{type=13,value=133},
				{type=15,value=899},
				{type=21,value=70},
				{type=23,value=451},
				{type=25,value=49},
				{type=27,value=304},
		},
		groupId=0,
		showOnlyGet=false,
		time=0,
		isDelete=false,
		profession=2,
		needAchieve=28400000,
		job = 2,
		buff = {}
	},
	--天魁玄灵魔神
	{
		name='天魁玄灵魔神',
		desc='法师历练称号',
		calcAttr={
				{type=13,value=166},
				{type=15,value=1124},
				{type=21,value=88},
				{type=23,value=564},
				{type=25,value=61},
				{type=27,value=380},
		},
		groupId=0,
		showOnlyGet=false,
		time=0,
		isDelete=false,
		profession=2,
		needAchieve=40800000,
		job = 2,
		buff = {}
	},
	--一阶散人
	{
		name='一阶散人',
		desc='道士历练称号',
		calcAttr={
				{type=17,value=18},
				{type=19,value=120},
				{type=21,value=9},
				{type=23,value=60},
				{type=25,value=6},
				{type=27,value=40},
			},
		groupId=0,
		showOnlyGet=false,
		time=0,
		isDelete=false,
		profession=3,
		needAchieve=5000,
		job = 3,
		buff = {}
	},
	--二阶真人
	{
		name='二阶真人',
		desc='道士历练称号',
		calcAttr={
				{type=17,value=22},
				{type=19,value=150},
				{type=21,value=11},
				{type=23,value=75},
				{type=25,value=8},
				{type=27,value=50},
		},
		groupId=0,
		showOnlyGet=false,time=0,
		isDelete=false,
		profession=3,
		needAchieve=200000,
		job = 3,
		buff = {}
	},
	--三阶道玄
	{
		name='三阶道玄',
		desc='道士历练称号',
		calcAttr={
				{type=17,value=28},
				{type=19,value=188},
				{type=21,value=14},
				{type=23,value=94},
				{type=25,value=10},
				{type=27,value=63},
		},
		groupId=0,
		showOnlyGet=false,
		time=0,
		isDelete=false,
		profession=3,
		needAchieve=580000,
		job = 3,
		buff = {}
	},
	--四阶道宗
	{
		name='四阶道宗',
		desc='道士历练称号',
		calcAttr={
				{type=17,value=35},
				{type=19,value=235},
				{type=21,value=18},
				{type=23,value=118},
				{type=25,value=13},
				{type=27,value=79},
		},
		groupId=0,
		showOnlyGet=false,
		time=0,
		isDelete=false,
		profession=3,
		needAchieve=1320000,
		job = 3,
		buff = {}
	},
	--五阶道尊
	{
		name='五阶道尊',
		desc='道士历练称号',
		calcAttr={
				{type=17,value=44},
				{type=19,value=294},
				{type=21,value=23},
				{type=23,value=148},
				{type=25,value=16},
				{type=27,value=99},
		},
		groupId=0,
		showOnlyGet=false,
		time=0,
		isDelete=false,
		profession=3,
		needAchieve=2680000,
		job = 3,
		buff = {}
	},
	--六阶罗天散人
	{
		name='六阶罗天散人',
		desc='道士历练称号',
		calcAttr={
				{type=17,value=54},
				{type=19,value=368},
				{type=21,value=29},
				{type=23,value=185},
				{type=25,value=20},
				{type=27,value=124},
		},
		groupId=0,
		showOnlyGet=false,
		time=0,
		isDelete=false,
		profession=3,
		needAchieve=4840000,
		job = 3,
		buff = {}
	},
	--七阶罗天真人
	{
		name='七阶罗天真人',
		desc='道士历练称号',
		calcAttr={
				{type=17,value=68},
				{type=19,value=460},
				{type=21,value=36},
				{type=23,value=231},
				{type=25,value=25},
				{type=27,value=155},
		},
		groupId=0,
		showOnlyGet=false,
		time=0,
		isDelete=false,
		profession=3,
		needAchieve=8080000,
		job = 3,
		buff = {}
	},
	--八阶罗天道玄
	{
		name='八阶罗天道玄',
		desc='道士历练称号',
		calcAttr={
				{type=17,value=85},
				{type=19,value=575},
				{type=21,value=45},
				{type=23,value=289},
				{type=25,value=31},
				{type=27,value=194},
		},
		groupId=0,
		showOnlyGet=false,
		time=0,
		isDelete=false,
		profession=3,
		needAchieve=12800000,
		job = 3,
		buff = {}
	},
	--九阶罗天道宗
	{
		name='九阶罗天道宗',
		desc='道士历练称号',
		calcAttr={
				{type=17,value=106},
				{type=19,value=719},
				{type=21,value=56},
				{type=23,value=361},
				{type=25,value=39},
				{type=27,value=243},
		},
		groupId=0,
		showOnlyGet=false,
		time=0,
		isDelete=false,
		profession=3,
		needAchieve=19350000,
		job = 3,
		buff = {}
	},
	--十阶罗天道尊
	{
		name='十阶罗天道尊',
		desc='道士历练称号',
		calcAttr={
				{type=17,value=133},
				{type=19,value=899},
				{type=21,value=70},
				{type=23,value=451},
				{type=25,value=49},
				{type=27,value=304},
		},
		groupId=0,
		showOnlyGet=false,
		time=0,
		isDelete=false,
		profession=3,
		needAchieve=28400000,
		job = 3,
		buff = {}
	},
	--傲天无极道神
	{
		name='傲天无极道神',
		desc='道士历练称号',
		calcAttr={
				{type=17,value=166},
				{type=19,value=1124},
				{type=21,value=88},
				{type=23,value=564},
				{type=25,value=61},
				{type=27,value=380},
		},
		groupId=0,
		showOnlyGet=false,
		time=0,
		isDelete=false,
		profession=3,
		needAchieve=40800000,
		job = 3,
		buff = {}
	},
}

