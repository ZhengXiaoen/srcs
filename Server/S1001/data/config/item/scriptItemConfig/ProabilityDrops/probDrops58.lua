--[[
--按照概率和掉落的配置,id表示物品的id
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

{ id=569,count=10,strong =0,quality=0, propability=1, bind=1,group=0,strongMin =0,qualityMin=0},--护盾碎片(1000)*10
{ id=561,count=1,strong =0,quality=0, propability=1, bind=1,group=0,strongMin =0,qualityMin=0},--天山雪莲(120w)*1
{ id=508,count=1,strong =0,quality=0, propability=1, bind=1,group=0,strongMin =0,qualityMin=0},--金砖(绑金)*1
{ id=548,count=5,strong =0,quality=0, propability=1, bind=1,group=0,strongMin =0,qualityMin=0},--转生地宫证明*5
{ id=5475,count=5,strong =0,quality=0, propability=1, bind=1,group=0,strongMin =0,qualityMin=0},--玛雅神殿证明*5

 
}

