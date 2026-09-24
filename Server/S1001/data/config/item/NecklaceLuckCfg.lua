--项链幸运 强化 和 转移
NecklaceLuckCfg = 
{
	MaxLuck = 3, --最高幸运
	NeckLaceItemCircle = 1,  --可以进行幸运转移装备的转数
	consume = 
	{
		{
			itemConsume = {{type=0,id=936,count=10}},
			rate=40,
		},
		{
			itemConsume = {{type=0,id=936,count=15}},
			rate=30,
		},
		{
			itemConsume = {{type=0,id=936,count=20}},
			rate=20,
		},
	},
}
--幸运转移
NecklaceLuckTransCfg = 
{
	MaxLuck = 3, --最高幸运
	NeckLaceItemCircle = 1,  --可以进行幸运转移装备的转数
	consume =
	{
		{type=15,id=0,count=500},
		{type=15,id=0,count=1000},
		{type=15,id=0,count=2000},
	},
}
