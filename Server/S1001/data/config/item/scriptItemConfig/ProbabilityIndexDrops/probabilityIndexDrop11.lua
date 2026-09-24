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
	{ type = 6, id = 0, count = 50000, propability = 13220, group = 1 }, --正常金币
	{ type = 6, id = 0, count = 150000, propability = 6000, group = 1 }, --高倍金币
	{ type = 20, id = 3, count = 300, propability = 8000, group = 1 }, --正常经验
	{ type = 20, id = 3, count = 400, propability = 500, group = 1 }, --高倍经验
	{ type = 0, id = 276, count = 1, propability = 33, group = 1,broadcast =true }, --强化保护符
	{ type = 0, id = 277, count = 1, propability = 990, group = 1 }, --鉴定图鉴
	{ type = 0, id = 278, count = 1, propability = 66, group = 1,broadcast =true }, --清洗砂
	{ type = 0, id = 279, count = 1, propability = 33, group = 1,broadcast =true }, --鉴定锁
	{ type = 0, id = 531, count = 1, propability = 990, group = 1 }, --斑斓石
	{ type = 0, id = 665, count = 1, propability = 10, group = 1,broadcast =true }, --寻宝图
	{ type = 0, id = 283, count = 1, propability = 165, group = 1,broadcast =true }, --4级灵珠

	--下一档次装备
	--{ type = 0, id=226,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	--{ type = 0, id=227,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	--{ type = 0, id=228,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=229,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=230,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=231,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=232,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=233,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=234,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=235,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=236,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	--{ type = 0, id=237,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	--{ type = 0, id=238,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	--{ type = 0, id=239,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=240,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=241,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=242,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=243,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=244,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=245,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=246,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=247,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	--{ type = 0, id=248,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	--{ type = 0, id=249,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	--{ type = 0, id=250,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=251,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=252,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=253,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=254,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=255,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=256,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=257,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=258,count=1,strong =0,quality=0, propability=1, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},

}