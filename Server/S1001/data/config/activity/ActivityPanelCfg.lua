ActivityPanel = 
{
	--泉水阵地
	[63] = 
	{
		Id = 1,
		DescriptionStr = "<(c0xFFFF0000)活动步骤:>\\   ①.领取泉水罐\\   ②.把泉水罐装备在符处\\   ③.抢位置装泉水(10秒/次)\\   ④.满罐泉水兑换珍宝\\   (土城NPC-泉水结阵)",  --内容描述
		LeftTime = 900,	--双倍效果时间 
		Consume = {type = 3,count = 1200},  --消耗价格   0：绑金 1：金币  2：绑定元宝  3：元宝
		MaxFreeBottle = 6, --每次免费领取最大瓶子次数
		ButtonParam = {974,2}, --根据按钮的顺序   如第一个按钮领取泉水罐，填ID，第二按钮倍数填对应倍数
		ButtonInfo =	 --按钮   增加按钮
		{
			"<点击领取泉水罐/@@activityAward,1>(完全免费)",

			"<点击双倍接泉水/@@activityAward,2>(需要1200元宝)",
		},
		
	},  
	--佛光普照
	[64] = 
	{
		Id = 2,
		DescriptionStr = "<(c0xFFFF0000)活动步骤:>\\    ①.抢占位置\\    ②.获得经验和绑金",
		LeftTime = 900,
		Consume = {type = 3,count = 500},
		ButtonParam = {2}, --暂时只有2倍
		ButtonInfo = 
		{
			"<点击双倍奖励/@@activityAward,1> (需要500元宝)",
		},
	},
}