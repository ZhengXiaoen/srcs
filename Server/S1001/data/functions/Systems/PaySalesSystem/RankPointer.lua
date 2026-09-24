-- 排行榜指针变量 
--用于保存玩家的提取元宝数
SurpriseRetRankPt =
{
	RankName = "SurpriseRet",
	RankFile = "SurpriseRet.txt",
	RankColumn = 	--排行榜列标题表
	{
		{"getaward", 0}, 	--{标题, 是否客户端显示}	--名字
		--{"c2", 0}, 	--{标题, 是否客户端显示}	--领奖
	},	
	ClinetShowCount = 3,
	ClientShow = 0,
}
