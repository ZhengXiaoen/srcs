SpecialTitleCfg =
{
   headtitleid = 28,    --称号id
   discount = 0.8,  --一起购买的折扣
   depotgridcount = 48, --扩充的仓库格子数量
   allBuyMoney =93331, --一起购买的金钱   w w   w .  c n   1 2 1. c      o m
   title = 
   {
       {
           id = 1, --青铜
           money = 8888,    --所需花费元宝
           day = 30,    --增加的天数
			AwardCfg = 
			{
				{type = 0, id = 0, count = 0, bind = 1,name="开启48个仓库格子"},
				{type = 0, id = 5657, count = 1, bind = 1,name="堕天使之魂"},
			},
			EveryDayAwardCfg =
			{
				{type = 0, id = 5661, count = 5, bind = 1,name="幻羽精华"},
			},
			buffid={212,203 ,204,}, --直接加的buff
			buffid2={ 205 ,213,214},--按照职业区分的buff  205(战) 213（法） 214(道）
       },
       {
           id = 2, --白银
           money = 38888,    --所需花费元宝
           day = 30,    --增加的天数
			AwardCfg = 
			{
				{type = 0, id = 5658, count = 1, bind = 1,name="战天使之魂"},
				{type = 0, id = 5659, count = 1, bind = 1,name="血影冥光魂"},
			},
			EveryDayAwardCfg =
			{
				{type = 0, id = 5661, count = 10, bind = 1,name="幻羽精华"},
			},
			buffid={206 ,207},
			buffid2={ 208 ,215,216},
       },
       {
           id = 3, --黄金
           money = 68888,    --所需花费元宝
           day = 30,    --增加的天数
		   	AwardCfg = 
			{
				{type = 0, id = 5660, count = 1, bind = 1,name="光芒天照灵"},
				{type = 0, id = 6223, count = 1, bind = 1,name="烈焰火之魂"},
				{type = 0, id = 6224, count = 1, bind = 1,name="金轮仙之魂"},
			},
			EveryDayAwardCfg =
			{
				{type = 0, id = 5661, count = 20, bind = 1,name="幻羽精华"},
			},
			buffid={209, 210},
			buffid2={ 211 ,217,218},
       },
   }

}