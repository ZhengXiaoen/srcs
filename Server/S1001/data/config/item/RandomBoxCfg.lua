--随机宝箱
--2017.6.28
RandomBoxCfg =
{
    {
        name = "天关宝箱",
        itemId = 5322,  --天关宝箱道具id
        broadcastCount = 2,--几个数量以上广播 包括
        number =
        {
            --第一次领取
            {
                needYuanBao = 0, --需要元宝- 0为免费领取
                --额外奖励
                award = 
                {
                        {type = 0, id = 5363, count = 1, quality = 0, strong = 0, bind = 1},---1级宝石袋*1
                },
            },
            --第二次领取
            {
                needYuanBao = 298, 
                --额外奖励
                award = 
                {

                },
            },
        },
        randomItem = 
        {
             {itemid = 5363,count=8,bind=1,rate=10,},
             {itemid = 5363,count=7,bind=1,rate=30,},
             {itemid = 5363,count=6,bind=1,rate=60,},
             {itemid = 5363,count=5,bind=1,rate=120,},
             {itemid = 5363,count=4,bind=1,rate=230,},
             {itemid = 5363,count=3,bind=1,rate=500,},
             {itemid = 5363,count=2,bind=1,rate=2000,},
             {itemid = 5363,count=1,bind=1,rate=7050,},
        },

    }
}
