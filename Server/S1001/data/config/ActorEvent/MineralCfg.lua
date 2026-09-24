--采矿系统配置
MineralCfg=
{
    MineralTime = 5,    --单次挖矿时间间隔
    
	mapId= 342,
    StrongItemId = 459,    --强化石id
    GiveStrongItemTick = 6,--星纹强化石几率
    ClearTime = 3600,--一小时清除
	Stone={
		{id = 4699,name = "铜矿",sellPrice =200,rate =2,change = 0,maxcount=300,bind=1},
		{id = 4700,name = "铁矿",sellPrice =700,rate =2,change = 0,maxcount=200,bind=1},
		{id = 4701,name = "银矿",sellPrice =1100,rate =3,change = 0,maxcount=100,bind=1},
		{id = 4702,name = "金矿",sellPrice =1500,rate =3,change = 0,maxcount=80,bind=1},
		
	},
    server=
    {
        {id = 4703,name = "黑铁矿",sellPrice =0,rate =144,change = 0,maxcount=11000,bind=0},
        {id = 4704,name = "青金石矿",sellPrice =0,rate =1440,change = 0,maxcount=500,bind=0},
        {id = 4705,name = "绿宝石矿",sellPrice =0,rate =7200,change = 0,maxcount=10,bind=0},
        {id = 4706,name = "钻石矿",sellPrice =0,rate =17280,change = 0,maxcount=1,bind=0},

    }
}