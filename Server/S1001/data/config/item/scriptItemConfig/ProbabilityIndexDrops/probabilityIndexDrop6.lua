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
	{ type = 6, id = 0, count = 4000, propability = 8760, group = 1 }, --正常金币
	{ type = 6, id = 0, count = 40000, propability = 4000, group = 1 }, --高倍金币
	{ type = 20, id = 3, count = 150, propability = 9000, group = 1 }, --正常经验
	{ type = 20, id = 3, count = 200, propability = 2000, group = 1 }, --高倍经验
	{ type = 0, id = 276, count = 1, propability = 66, group = 1,broadcast =true }, --强化保护符
	{ type = 0, id = 277, count = 1, propability = 1320, group = 1 }, --鉴定图鉴
	{ type = 0, id = 278, count = 1, propability = 99, group = 1,broadcast =true }, --清洗砂
	{ type = 0, id = 279, count = 1, propability = 99, group = 1,broadcast =true }, --鉴定锁
	{ type = 0, id = 531, count = 1, propability = 1320, group = 1 }, --斑斓石
	{ type = 0, id = 665, count = 1, propability = 20, group = 1,broadcast =true }, --寻宝图
	{ type = 0, id = 280, count = 1, propability = 198, group = 1,broadcast =true }, --1级灵珠
	{ type = 0, id = 281, count = 1, propability = 99, group = 1,broadcast =true }, --2级灵珠
	{ type = 0, id = 282, count = 1, propability = 33, group = 1,broadcast =true }, --3级灵珠

	--下一档次装备
	--{ type = 0, id=160,count=1,strong =0,quality=0, propability=2, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	--{ type = 0, id=161,count=1,strong =0,quality=0, propability=2, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	--{ type = 0, id=162,count=1,strong =0,quality=0, propability=2, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=163,count=1,strong =0,quality=0, propability=2, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=164,count=1,strong =0,quality=0, propability=2, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=165,count=1,strong =0,quality=0, propability=2, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=166,count=1,strong =0,quality=0, propability=2, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=167,count=1,strong =0,quality=0, propability=2, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=168,count=1,strong =0,quality=0, propability=2, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=169,count=1,strong =0,quality=0, propability=2, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=170,count=1,strong =0,quality=0, propability=2, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	--{ type = 0, id=171,count=1,strong =0,quality=0, propability=2, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	--{ type = 0, id=172,count=1,strong =0,quality=0, propability=2, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	--{ type = 0, id=173,count=1,strong =0,quality=0, propability=2, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=174,count=1,strong =0,quality=0, propability=2, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=175,count=1,strong =0,quality=0, propability=2, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=176,count=1,strong =0,quality=0, propability=2, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=177,count=1,strong =0,quality=0, propability=2, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=178,count=1,strong =0,quality=0, propability=2, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=179,count=1,strong =0,quality=0, propability=2, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=180,count=1,strong =0,quality=0, propability=2, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=181,count=1,strong =0,quality=0, propability=2, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	--{ type = 0, id=182,count=1,strong =0,quality=0, propability=2, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	--{ type = 0, id=183,count=1,strong =0,quality=0, propability=2, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	--{ type = 0, id=184,count=1,strong =0,quality=0, propability=2, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=185,count=1,strong =0,quality=0, propability=2, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=186,count=1,strong =0,quality=0, propability=2, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=187,count=1,strong =0,quality=0, propability=2, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=188,count=1,strong =0,quality=0, propability=2, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=189,count=1,strong =0,quality=0, propability=2, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=190,count=1,strong =0,quality=0, propability=2, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=191,count=1,strong =0,quality=0, propability=2, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=192,count=1,strong =0,quality=0, propability=2, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=594,count=1,strong =0,quality=0, propability=2, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=595,count=1,strong =0,quality=0, propability=2, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=596,count=1,strong =0,quality=0, propability=2, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=597,count=1,strong =0,quality=0, propability=2, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=598,count=1,strong =0,quality=0, propability=2, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=599,count=1,strong =0,quality=0, propability=2, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=600,count=1,strong =0,quality=0, propability=2, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=601,count=1,strong =0,quality=0, propability=2, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},
	{ type = 0, id=602,count=1,strong =0,quality=0, propability=2, bind=0,group=1,strongMin =0,qualityMin=0,broadcast =true},

}