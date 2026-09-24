--经验福利奖励 配置
--[[
	玩家当前等级的单位经验×（玩家离线小时－最少离线小时｜不超过最大离线小时）。
--]]

LogOutExp = 
{
	outexp = 600000,	---每小时离线经验
	limitLevel = {50, 255},	--领取福利等级限制	
	minTime = 1,	--最少离线时间（小时），目前设置1小时
	maxTime = 72,	--最大离线时间（小时），目前设置72小时
	consumeYBCount = 6,  --每小时额外领取需消耗的元宝数 客户端需要	

	getExpConsume = 
	{
		{
			rate = 1,
			consume = {},			--每小时消耗
		},
		{
			rate = 2,
			consume = {type = 3, id = 0, count = 6, yb = 6},			--消耗 --yb:元宝单价替换数(去掉此值代表此项消耗不能使用元宝替代)
		},
		{
			rate = 3,
			consume = {type = 3, id = 0, count = 12, yb = 12},				--消耗
		},
		{
			rate = 5,
			consume = {type = 3, id = 0, count = 24, yb = 24},				--消耗
		},
	},
	
	expPerLevel = {type = 20, id = 3, count = 125, quality = 0},	--每等级对应经验
}
