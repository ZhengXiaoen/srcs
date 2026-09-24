--[[
--按照概率和掉落的配置,id表示物品的id
--type表示通用奖励的类型
--count表示物品的数量,
--strong 强化等级,如果是小于0的表示0-n随机
-- quality 品质如果是小于0的表示0-n随机 ,比如-3表示0到3之间随机
-- strongMin 表示最小的强化等级, 如果配置了，那么随出了一个物品的强化低于这个值将设置为这个值，这个不配置就是0
-- qualityMin:表示最小的品质等级
--propability概率，概率的数字越大的话掉的物品的概率越高
--bind绑定的标记
--group是分组的id，类似怪物的爆率的配置
--sex表示玩家的性别，男的是0，女的是1，如果男女通用就是-1
--job表示玩家的职业,2华山 4水月 7御神 8忍者 0表示没有职业限制
--]]

drops=
{
	{ type = 6, id = 0, count = 10000, propability = 12050, group = 1 }, --正常金币
	{ type = 6, id = 0, count = 70000, propability = 4000, group = 1 }, --高倍金币
	{ type = 20, id = 3, count = 200, propability = 10000, group = 1 }, --正常经验
	{ type = 20, id = 3, count = 250, propability = 2000, group = 1 }, --高倍经验
	{ type = 0, id = 276, count = 1, propability = 33, group = 1,broadcast =true }, --强化保护符
	{ type = 0, id = 277, count = 1, propability = 990, group = 1 }, --鉴定图鉴
	{ type = 0, id = 278, count = 1, propability = 66, group = 1,broadcast =true }, --清洗砂
	{ type = 0, id = 279, count = 1, propability = 33, group = 1,broadcast =true }, --鉴定锁
	{ type = 0, id = 531, count = 1, propability = 990, group = 1 }, --斑斓石
	{ type = 0, id = 665, count = 1, propability = 10, group = 1,broadcast =true }, --寻宝图
	{ type = 0, id = 281, count = 1, propability = 99, group = 1,broadcast =true }, --2级灵珠
	{ type = 0, id = 282, count = 1, propability = 33, group = 1,broadcast =true }, --3级灵珠

	--下一档次装备
	--{ type = 0, id=193,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	--{ type = 0, id=194,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	--{ type = 0, id=195,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=196,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=197,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=198,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=199,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=200,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=201,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=202,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=203,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	--{ type = 0, id=204,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	--{ type = 0, id=205,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	--{ type = 0, id=206,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=207,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=208,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=209,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=210,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=211,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=212,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=213,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=214,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	--{ type = 0, id=215,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	--{ type = 0, id=216,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	--{ type = 0, id=217,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=218,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=219,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=220,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=221,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=222,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=223,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=224,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=225,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},

}