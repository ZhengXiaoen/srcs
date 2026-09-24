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

{ id=5171,count=280,strong=0,quality=0,propability=1,bind=1,group=0,strongMin=0,qualityMin=0},--//神魂
{ id=459,count=99,strong=0,quality=0,propability=1,bind=1,group=0,strongMin=0,qualityMin=0},--//星纹强化石
{ id=551,count=3,strong=0,quality=0,propability=1,bind=1,group=0,strongMin=0,qualityMin=0},--//战将灵力丹(小)
{ id=507,count=3,strong=0,quality=0,propability=1,bind=1,group=0,strongMin=0,qualityMin=0},--//金条(绑金)
{ id=678,count=10,strong=0,quality=0,propability=1,bind=1,group=0,strongMin=0,qualityMin=0},--//副本传送卷
{ id=548,count=5,strong=0,quality=0,propability=1,bind=1,group=0,strongMin=0,qualityMin=0},--//转生地宫证明



 
}