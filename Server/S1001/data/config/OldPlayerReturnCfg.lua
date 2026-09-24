--老兵回归配置文件  w w w .  c     n 1 2 1. c o m
--@author 后天
--@timer 2018.1.16
OldPlayerReturnCfg = 
{
    --回归玩家
    {
        --回归登录 1
        Login = 
        {
            {
                day =1,--每天登录礼包
                award = 
                {
                    {type = 0, id = 507, count = 9, quality = 0, strong = 0, bind = 1},--金条(绑定)*9
                    {type = 0, id = 547, count = 6, quality = 0, strong = 0, bind = 1},--江湖令*6
                    {type = 0, id = 561, count = 3, quality = 0, strong = 0, bind = 1},--天山雪莲120W*3
                    {type = 0, id = 80, count = 588, quality = 0, strong = 0, bind = 1},--疗伤药*588            
                    {type = 0, id = 463, count = 3, quality = 0, strong = 0, bind = 1},--战将附体令*3
                },
            },
            {
                day =3,--累计登录3天
                award = 
                {
                    { type = 0, id = 6371, count = 1, strong = 0, quality = 0, bind = 1 }, --幻羽礼盒
                    { type = 0, id = 459, count = 288, strong = 0, quality = 0, bind = 1 }, --星纹强化石*288
                    { type = 0, id = 464, count = 288, strong = 0, quality = 0, bind = 1 }, --1级羽毛*288
                    { type = 0, id = 536, count = 3, strong = 0, quality = 0, bind = 1 }, --护符碎片
                    { type = 0, id = 570, count = 3, strong = 0, quality = 0, bind = 1 }, --护盾碎片


                },
            },
            {
                day =5,--累计登录5天
                award = 
                {
                    { type = 0, id = 6657, count = 1, strong = 0, quality = 0, bind = 1 }, --时装礼盒
                    { type = 0, id = 459, count = 288, strong = 0, quality = 0, bind = 1 }, --星纹强化石*288
                    { type = 0, id = 464, count = 288, strong = 0, quality = 0, bind = 1 }, --1级羽毛*288
                    { type = 0, id = 536, count = 3, strong = 0, quality = 0, bind = 1 }, --护符碎片
                    { type = 0, id = 570, count = 3, strong = 0, quality = 0, bind = 1 }, --护盾碎片
                },
            },
            {
                day =7,--累计登录7天
                award = 
                {
                    { type = 0, id = 6658, count = 1, strong = 0, quality = 0, bind = 1 }, --灵器礼盒
                    { type = 0, id = 459, count = 288, strong = 0, quality = 0, bind = 1 }, --星纹强化石*288
                    { type = 0, id = 464, count = 288, strong = 0, quality = 0, bind = 1 }, --1级羽毛*288
                    { type = 0, id = 536, count = 3, strong = 0, quality = 0, bind = 1 }, --护符碎片
                    { type = 0, id = 570, count = 3, strong = 0, quality = 0, bind = 1 }, --护盾碎片
                },
            },
        },
        --回归首充 2
        FirstPay = 
        {
            award = 
            {
                   {type = 0, id = 542, count = 5, quality = 0, strong = 0, bind = 1},--转生修为丹小*5
                   {type = 0, id = 6369, count = 2, quality = 0, strong = 0, bind = 1},--绿色生肖袋*2
                   {type = 0, id = 6403, count = 10, quality = 0, strong = 0, bind = 1},--五行石*10   
                   {type = 0, id = 5468, count = 10, quality = 0, strong = 0, bind = 1},--神级经验玉*10
                   {type = 0, id = 5364, count = 6, quality = 0, strong = 0, bind = 1},--二阶宝石袋*6
                   {type = 0, id = 81, count = 588, quality = 0, strong = 0, bind = 1},--万年人参*588
            },
        },
        --充值回馈 3
        PayFeelBack = 
        {
            --累计冲值1000元宝
            {
                money = 1000,
                award = 
                {
                    { type = 0, id = 5171, count = 50, strong = 0, quality = 0, bind = 1 }, --神魂(1)*50
                    { type = 0, id = 5363, count = 1, strong = 0, quality = 0, bind = 1 }, --一阶宝石袋*1
                    { type = 0, id = 5453, count = 1, strong = 0, quality = 0, bind = 1 }, --军魂瓶*1
                    { type = 0, id = 5126, count = 1, strong = 0, quality = 0, bind = 1 }, --中级BOSS召唤令*1
                    { type = 0, id = 5468, count = 2, strong = 0, quality = 0, bind = 1 }, --神级经验玉*2
                },
            },
            --累计冲值2000元宝
            {
                money = 2000,
                award = 
                {
                    { type = 0, id = 5171, count = 60, strong = 0, quality = 0, bind = 1 }, --神魂(1)*60
                    { type = 0, id = 5363, count = 3, strong = 0, quality = 0, bind = 1 }, --一阶宝石袋*3
                    { type = 0, id = 5453, count = 2, strong = 0, quality = 0, bind = 1 }, --军魂瓶*2
                    { type = 0, id = 5126, count = 2, strong = 0, quality = 0, bind = 1 }, --中级BOSS召唤令*2
                    { type = 0, id = 5468, count = 4, strong = 0, quality = 0, bind = 1 }, --神级经验玉*4
                },
            },
            --累计冲值5000元宝
            {
                money = 5000,
                award = 
                {
                    { type = 0, id = 5171, count = 80, strong = 0, quality = 0, bind = 1 }, --神魂(1)*80
                    { type = 0, id = 5364, count = 2, strong = 0, quality = 0, bind = 1 }, --二阶宝石袋*2
                    { type = 0, id = 5453, count = 3, strong = 0, quality = 0, bind = 1 }, --军魂瓶*3
                    { type = 0, id = 5127, count = 1, strong = 0, quality = 0, bind = 1 }, --高级BOSS召唤令*1
                    { type = 0, id = 5468, count = 6, strong = 0, quality = 0, bind = 1 }, --神级经验玉*6
                },
            },
            --累计冲值10000元宝
            {
                money = 10000,
                award = 
                {
                    { type = 0, id = 5171, count = 100, strong = 0, quality = 0, bind = 1 }, --神魂(1)*100
                    { type = 0, id = 5364, count = 3, strong = 0, quality = 0, bind = 1 }, --二阶宝石袋*3
                    { type = 0, id = 5453, count = 5, strong = 0, quality = 0, bind = 1 }, --军魂瓶*5
                    { type = 0, id = 5127, count = 2, strong = 0, quality = 0, bind = 1 }, --高级BOSS召唤令*2
                    { type = 0, id = 5468, count = 8, strong = 0, quality = 0, bind = 1 }, --神级经验玉*8
                },
            },
        },
        --折扣礼包 4
        SaleGift  =
        {
           --第一个格子礼包
            {
               {
                    oldmoney = 3800, --原价
                    money = 388,    --现价
                    award = 
                    {
                        { type = 0, id = 464, count = 380, strong = 0, quality = 0, bind = 1 }, --1级羽毛*380
                    },
               },
               {
                    oldmoney = 18000, --原价
                    money = 1888,    --现价
                    award = 
                    {
                        { type = 0, id = 464, count = 1800, strong = 0, quality = 0, bind = 1 }, --1级羽毛*1800
                    },
               },
               {
                    oldmoney = 28000, --原价
                    money = 2888,    --现价
                    award = 
                    {
                        { type = 0, id = 464, count = 2800, strong = 0, quality = 0, bind = 1 }, --1级羽毛*2800
                    },
               },
               {
                    oldmoney = 4000, --原价
                    money = 1288,    --现价
                    award = 
                    {
                        { type = 0, id = 489, count = 4, strong = 0, quality = 0, bind = 1 }, --成就令牌(中)*4
                    },
               },
               {
                    oldmoney = 19600, --原价
                    money = 5888,    --现价
                    award = 
                    {
                        { type = 0, id = 490, count = 2, strong = 0, quality = 0, bind = 1 }, --成就令牌(大)*2
                    },
               },
               {
                    oldmoney = 29400, --原价
                    money = 8888,    --现价
                    award = 
                    {
                        { type = 0, id = 490, count = 3, strong = 0, quality = 0, bind = 1 }, --成就令牌(大)*3
                    },
               },
            },
             --第二个格子礼包
            {
                {
                    oldmoney = 3800, --原价
                    money = 388,    --现价
                    award = 
                    {
                        { type = 0, id = 537, count = 38, strong = 0, quality = 0, bind = 1 }, --宝石结晶(100)*38
                    },
                },
                {
                    oldmoney = 17600, --原价
                    money = 1888,    --现价
                    award = 
                    {
                        { type = 0, id = 537, count = 176, strong = 0, quality = 0, bind = 1 }, --宝石结晶(100)*176
                    },
                },
                {
                    oldmoney = 27500, --原价
                    money = 2888,    --现价
                    award = 
                    {
                        { type = 0, id = 537, count = 275, strong = 0, quality = 0, bind = 1 }, --宝石结晶(100)*275
                    },
                },
                {
                    oldmoney = 3000, --原价
                    money = 988,    --现价
                    award = 
                    {
                        { type = 0, id = 5646, count = 3, strong = 0, quality = 0, bind = 1 }, --斗笠精华(中)*3
                    },
                },
                {
                    oldmoney = 10000, --原价
                    money = 3288,    --现价
                    award = 
                    {
                        { type = 0, id = 5647, count = 1, strong = 0, quality = 0, bind = 1 }, --斗笠精华(大)*1
                    },
                },
                {
                    oldmoney = 30000, --原价
                    money = 9288,    --现价
                    award = 
                    {
                        { type = 0, id = 5647, count = 3, strong = 0, quality = 0, bind = 1 }, --斗笠精华(大)*3
                    },
                },
            },
             --第三个格子礼包
            {
                {
                    oldmoney = 3800, --原价
                    money = 388,    --现价
                    award = 
                    {
                        { type = 0, id = 572, count = 38, strong = 0, quality = 0, bind = 1 }, --圣珠结晶(100)*38
                    },
                },
                {
                    oldmoney = 17600, --原价
                    money = 1888,    --现价
                    award = 
                    {
                        { type = 0, id = 572, count = 176, strong = 0, quality = 0, bind = 1 }, --圣珠结晶(100)*176
                    },
                },
                {
                    oldmoney = 27500, --原价
                    money = 2888,    --现价
                    award = 
                    {
                        { type = 0, id = 572, count = 275, strong = 0, quality = 0, bind = 1 }, --圣珠结晶(100)*275
                    },
                },
                {
                    oldmoney = 3000, --原价
                    money = 988,    --现价
                    award = 
                    {
                        { type = 0, id = 6297, count = 3, strong = 0, quality = 0, bind = 1 }, --元神丹(小)*3
                    },
                },
                {
                    oldmoney = 10000, --原价
                    money = 3288,    --现价
                    award = 
                    {
                        { type = 0, id = 6298, count = 1, strong = 0, quality = 0, bind = 1 }, --元神丹(中)*1
                    },
                },
                {
                    oldmoney = 30000, --原价
                    money = 9288,    --现价
                    award = 
                    {
                        { type = 0, id = 6298, count = 3, strong = 0, quality = 0, bind = 1 }, --元神丹(中)*3
                    },
                },
            },
             --第四个格子礼包
            {
                {
                    oldmoney = 2580, --原价
                    money = 2580,    --现价
                    txt = "商城无出售",
                    award = 
                    {
                        { type = 0, id = 5171, count = 258, strong = 0, quality = 0, bind = 1 }, --神魂(1)*258
                    },
                },
                {
                    oldmoney = 8888, --原价
                    money = 8888,    --现价
                    txt = "商城无出售",
                    award = 
                    {
                        { type = 0, id = 5171, count = 1188, strong = 0, quality = 0, bind = 1 }, --神魂(1)*1188
                    },
                },
                {
                    oldmoney = 13888, --原价
                    money = 13888,    --现价
                    txt = "商城无出售",
                    award = 
                    {
                        { type = 0, id = 5171, count = 1888, strong = 0, quality = 0, bind = 1 }, --神魂(1)*1888
                    },
                },
                {
                    oldmoney = 1888, --原价
                    money = 1888,    --现价
                    txt = "商城无出售",
                    award = 
                    {
                        { type = 0, id = 5364, count = 7, strong = 0, quality = 0, bind = 1 }, --二阶宝石袋*7
                    },
                },
                {
                    oldmoney = 8888, --原价
                    money = 8888,    --现价
                    txt = "商城无出售",
                    award = 
                    {
                        { type = 0, id = 5364, count = 30, strong = 0, quality = 0, bind = 1 }, --二阶宝石袋*30
                    },
                },
                {
                    oldmoney = 13888, --原价
                    money = 13888,    --现价
                    txt = "商城无出售",
                    award = 
                    {
                        { type = 0, id = 5364, count = 48, strong = 0, quality = 0, bind = 1 }, --二阶宝石袋*48
                    },
                },
            },
        },
        --召唤战友 5
        CallPlayer = 
        {
            MaxCallCount = 5,   --最大召唤次数
            Award = 
            {
                --召回者奖励
                {
                    { type = 0, id = 5455, count = 1, strong = 0, quality = 0, bind = 1 }, --中级礼包*1
                },
                --被召回者奖励
                {
                    { type = 0, id = 6363, count = 1, strong = 0, quality = 0, bind = 1 }, --壕礼宝箱*1
                }
            },
        },
        --消费回馈 6
        ConsumeFellBack =
        {
            --累计消费1000元宝
            {
                money = 1000,
                award = 
                {
                    { type = 0, id = 860, count = 2, strong = 0, quality = 0, bind = 1 }, --宝藏钥匙*2
                    { type = 0, id = 6403, count = 2, strong = 0, quality = 0, bind = 1 }, --五行石*2
                    { type = 0, id = 548, count = 5, strong = 0, quality = 0, bind = 1 }, --转生地宫证明*5
                    { type = 0, id = 5475, count = 2, strong = 0, quality = 0, bind = 1 }, --玛雅神殿证明*3
                },
            },
            --累计消费2000元宝
            {
                money = 2000,
                award = 
                {
                    { type = 0, id = 860, count = 4, strong = 0, quality = 0, bind = 1 }, --宝藏钥匙*4
                    { type = 0, id = 6403, count = 4, strong = 0, quality = 0, bind = 1 }, --五行石*4
                    { type = 0, id = 548, count = 15, strong = 0, quality = 0, bind = 1 }, --转生地宫证明*15
                    { type = 0, id = 5475, count = 6, strong = 0, quality = 0, bind = 1 }, --玛雅神殿证明*6 
                },
            },
            --累计消费5000元宝
            {
                money = 5000,
                award = 
                {
                    { type = 0, id = 860, count = 6, strong = 0, quality = 0, bind = 1 }, --宝藏钥匙*6
                    { type = 0, id = 6403, count = 8, strong = 0, quality = 0, bind = 1 }, --五行石*8
                    { type = 0, id = 548, count = 20, strong = 0, quality = 0, bind = 1 }, --转生地宫证明*20
                    { type = 0, id = 5475, count = 9, strong = 0, quality = 0, bind = 1 }, --玛雅神殿证明*9
                },
            },
            --累计消费10000元宝
            {
                money = 10000,
                award = 
                {
                    { type = 0, id = 860, count = 8, strong = 0, quality = 0, bind = 1 }, --宝藏钥匙*8
                    { type = 0, id = 6403, count = 15, strong = 0, quality = 0, bind = 1 }, --五行石*15
                    { type = 0, id = 548, count = 25, strong = 0, quality = 0, bind = 1 }, --转生地宫证明*25
                    { type = 0, id = 5475, count = 15, strong = 0, quality = 0, bind = 1 }, --玛雅神殿证明*15
                },
            },
        },
        --专属BOSS 7
        BossInfo = 
        {
            
             --80活跃度
            {
                activevalue = 80,
                award = 
                {
                     { type = 0, id = 6656, count = 1, strong = 0, quality = 0, bind = 1 }, 
                },
            },
             --150活跃度
            {
                activevalue = 150,
                award = 
                {
                     { type = 0, id = 6656, count = 1, strong = 0, quality = 0, bind = 1 }, 
                },
            },
             --240活跃度
            {
                activevalue = 240,
                award = 
                {
                     { type = 0, id = 6656, count = 1, strong = 0, quality = 0, bind = 1 }, 
                },
            },
        },
        --日常奖励
        Daily =
        {
            rate = 2,   --倍数
        }
    },

    --普通玩家
    {
        --回归登录
        Login = 
        {
            {
                day =1,--每天登录礼包
                award = 
                {
                    {type = 0, id = 507, count = 3, quality = 0, strong = 0, bind = 1},--金条(绑定)*3
                    {type = 0, id = 547, count = 2, quality = 0, strong = 0, bind = 1},--江湖令*2
                    {type = 0, id = 561, count = 1, quality = 0, strong = 0, bind = 1},--天山雪莲120W*1
                    {type = 0, id = 80, count = 199, quality = 0, strong = 0, bind = 1},--疗伤药*199         
                    {type = 0, id = 463, count = 1, quality = 0, strong = 0, bind = 1},--战将附体令*1
                },
            },
            {
                day =3,--累计登录3天
                award = 
                {
                    {type = 0, id = 507, count = 5, quality = 0, strong = 0, bind = 1},--金条(绑定)*3
                    {type = 0, id = 547, count = 3, quality = 0, strong = 0, bind = 1},--江湖令*2
                    {type = 0, id = 561, count = 3, quality = 0, strong = 0, bind = 1},--天山雪莲120W*1
                    {type = 0, id = 80, count = 268, quality = 0, strong = 0, bind = 1},--疗伤药*199         
                    {type = 0, id = 463, count = 3, quality = 0, strong = 0, bind = 1},--战将附体令*1
                },
            },
            {
                day =5,--累计登录3天
                award = 
                {
                    {type = 0, id = 507, count = 7, quality = 0, strong = 0, bind = 1},--金条(绑定)*3
                    {type = 0, id = 547, count = 4, quality = 0, strong = 0, bind = 1},--江湖令*2
                    {type = 0, id = 561, count = 4, quality = 0, strong = 0, bind = 1},--天山雪莲120W*1
                    {type = 0, id = 80, count = 299, quality = 0, strong = 0, bind = 1},--疗伤药*199         
                    {type = 0, id = 463, count = 4, quality = 0, strong = 0, bind = 1},--战将附体令*1
                },
            },
            {
                day =7,--累计登录3天
                award = 
                {
                    {type = 0, id = 507, count = 9, quality = 0, strong = 0, bind = 1},--金条(绑定)*3
                    {type = 0, id = 547, count = 5, quality = 0, strong = 0, bind = 1},--江湖令*2
                    {type = 0, id = 561, count = 5, quality = 0, strong = 0, bind = 1},--天山雪莲120W*1
                    {type = 0, id = 80, count = 388, quality = 0, strong = 0, bind = 1},--疗伤药*199         
                    {type = 0, id = 463, count = 5, quality = 0, strong = 0, bind = 1},--战将附体令*1
                },
            },
        },
        --回归首充
        FirstPay = 
        {
            award = 
            {
                   {type = 0, id = 542, count = 2, quality = 0, strong = 0, bind = 1},--转生修为丹小*2
                   {type = 0, id = 6369, count = 1, quality = 0, strong = 0, bind = 1},--绿色生肖袋*1
                   {type = 0, id = 6403, count = 5, quality = 0, strong = 0, bind = 1},--五行石*5 
                   {type = 0, id = 5468, count = 5, quality = 0, strong = 0, bind = 1},--神级经验玉*5
                   {type = 0, id = 5364, count = 3, quality = 0, strong = 0, bind = 1},--二阶宝石袋*3
                   {type = 0, id = 81, count = 288, quality = 0, strong = 0, bind = 1},--万年人参*288
            },
        },
        --冲值反馈
        PayFeelBack = 
        {
            --累计冲值1000元宝
            {
                money = 1000,
                award = 
                {
                    { type = 0, id = 5171, count = 25, strong = 0, quality = 0, bind = 1 }, --神魂(1)*25
                    { type = 0, id = 5363, count = 1, strong = 0, quality = 0, bind = 1 }, --一阶宝石袋*1
                    { type = 0, id = 5453, count = 1, strong = 0, quality = 0, bind = 1 }, --军魂瓶*1
                    { type = 0, id = 678, count = 30, strong = 0, quality = 0, bind = 1 }, --副本传送卷
                    { type = 0, id = 5468, count = 1, strong = 0, quality = 0, bind = 1 }, --神级经验玉*1
                },
            },
            --累计冲值2000元宝
            {
                money = 2000,
                award = 
                {
                    { type = 0, id = 5171, count = 30, strong = 0, quality = 0, bind = 1 }, --神魂(1)*30
                    { type = 0, id = 5363, count = 2, strong = 0, quality = 0, bind = 1 }, --一阶宝石袋*2
                    { type = 0, id = 5453, count = 2, strong = 0, quality = 0, bind = 1 }, --军魂瓶*2
                    { type = 0, id = 548, count = 15, strong = 0, quality = 0, bind = 1 }, --转生地宫证明
                    { type = 0, id = 5468, count = 2, strong = 0, quality = 0, bind = 1 }, --神级经验玉*2
                },
            },
            --累计冲值5000元宝
            {
                money = 5000,
                award = 
                {
                    { type = 0, id = 5171, count = 40, strong = 0, quality = 0, bind = 1 }, --神魂(1)*40
                    { type = 0, id = 5363, count = 3, strong = 0, quality = 0, bind = 1 }, --一阶宝石袋*3
                    { type = 0, id = 5453, count = 3, strong = 0, quality = 0, bind = 1 }, --军魂瓶*3
                    { type = 0, id = 5126, count = 1, strong = 0, quality = 0, bind = 1 }, --中级BOSS召唤令*1
                    { type = 0, id = 5468, count = 3, strong = 0, quality = 0, bind = 1 }, --神级经验玉*3
                },
            },
            --累计冲值10000元宝
            {
                money = 10000,
                award = 
                {
                    { type = 0, id = 5171, count = 50, strong = 0, quality = 0, bind = 1 }, --神魂(1)*50
                    { type = 0, id = 5363, count = 5, strong = 0, quality = 0, bind = 1 }, --一阶宝石袋*5
                    { type = 0, id = 5453, count = 5, strong = 0, quality = 0, bind = 1 }, --军魂瓶*5
                    { type = 0, id = 5127, count = 1, strong = 0, quality = 0, bind = 1 }, --高级BOSS召唤令*2
                    { type = 0, id = 5468, count = 5, strong = 0, quality = 0, bind = 1 }, --神级经验玉*5
                },
            },
        },
        --折扣礼包
        SaleGift  =
        {
             --第一个格子礼包
            {
               {
                    oldmoney = 3800, --原价
                    money = 1580,    --现价
                    award = 
                    {
                        { type = 0, id = 464, count = 380, strong = 0, quality = 0, bind = 1 }, --1级羽毛*380
                    },
               },
               {
                    oldmoney = 18000, --原价
                    money = 7280,    --现价
                    award = 
                    {
                        { type = 0, id = 464, count = 1800, strong = 0, quality = 0, bind = 1 }, --1级羽毛*1800
                    },
               },
               {
                    oldmoney = 28000, --原价
                    money = 11280,    --现价
                    award = 
                    {
                        { type = 0, id = 464, count = 2800, strong = 0, quality = 0, bind = 1 }, --1级羽毛*2800
                    },
               },
               {
                    oldmoney = 4000, --原价
                    money = 2468,    --现价
                    award = 
                    {
                        { type = 0, id = 489, count = 4, strong = 0, quality = 0, bind = 1 }, --成就令牌(中)*4
                    },
               },
               {
                    oldmoney = 19600, --原价
                    money = 11888,    --现价
                    award = 
                    {
                        { type = 0, id = 490, count = 2, strong = 0, quality = 0, bind = 1 }, --成就令牌(大)*2
                    },
               },
               {
                    oldmoney = 29400, --原价
                    money = 18888,    --现价
                    award = 
                    {
                        { type = 0, id = 490, count = 3, strong = 0, quality = 0, bind = 1 }, --成就令牌(大)*3
                    },
               },
            },
             --第二个格子礼包
            {
                {
                    oldmoney = 3800, --原价
                    money = 1580,    --现价
                    award = 
                    {
                        { type = 0, id = 537, count = 38, strong = 0, quality = 0, bind = 1 }, --宝石结晶(100)*38
                    },
                },
                {
                    oldmoney = 17600, --原价
                    money = 7088,    --现价
                    award = 
                    {
                        { type = 0, id = 537, count = 176, strong = 0, quality = 0, bind = 1 }, --宝石结晶(100)*176
                    },
                },
                {
                    oldmoney = 27500, --原价
                    money = 11180,    --现价
                    award = 
                    {
                        { type = 0, id = 537, count = 275, strong = 0, quality = 0, bind = 1 }, --宝石结晶(100)*275
                    },
                },
                {
                    oldmoney = 3000, --原价
                    money = 1880,    --现价
                    award = 
                    {
                        { type = 0, id = 5646, count = 3, strong = 0, quality = 0, bind = 1 }, --斗笠精华(中)*3
                    },
                },
                {
                    oldmoney = 10000, --原价
                    money = 6288,    --现价
                    award = 
                    {
                        { type = 0, id = 5647, count = 1, strong = 0, quality = 0, bind = 1 }, --斗笠精华(大)*1
                    },
                },
                {
                    oldmoney = 30000, --原价
                    money = 18888,    --现价
                    award = 
                    {
                        { type = 0, id = 5647, count = 3, strong = 0, quality = 0, bind = 1 }, --斗笠精华(大)*3
                    },
                },
            },
             --第三个格子礼包
            {
                {
                    oldmoney = 3800, --原价
                    money = 1580,    --现价
                    award = 
                    {
                        { type = 0, id = 572, count = 38, strong = 0, quality = 0, bind = 1 }, --圣珠结晶(100)*38
                    },
                },
                {
                    oldmoney = 17600, --原价
                    money = 7088,    --现价
                    award = 
                    {
                        { type = 0, id = 572, count = 176, strong = 0, quality = 0, bind = 1 }, --圣珠结晶(100)*176
                    },
                },
                {
                    oldmoney = 27500, --原价
                    money = 11180,    --现价
                    award = 
                    {
                        { type = 0, id = 572, count = 275, strong = 0, quality = 0, bind = 1 }, --圣珠结晶(100)*275
                    },
                },
                {
                    oldmoney = 3000, --原价
                    money = 1880,    --现价
                    award = 
                    {
                        { type = 0, id = 6297, count = 3, strong = 0, quality = 0, bind = 1 }, --元神丹(小)*3
                    },
                },
                {
                    oldmoney = 10000, --原价
                    money = 6288,    --现价
                    award = 
                    {
                        { type = 0, id = 6298, count = 1, strong = 0, quality = 0, bind = 1 }, --元神丹(中)*1
                    },
                },
                {
                    oldmoney = 30000, --原价
                    money = 18888,    --现价
                    award = 
                    {
                        { type = 0, id = 6298, count = 3, strong = 0, quality = 0, bind = 1 }, --元神丹(中)*3
                    },
                },
            },
             --第四个格子礼包
            {
                {
                    oldmoney = 2580, --原价
                    money = 2580,    --现价
                    txt = "商城无出售",
                    award = 
                    {
                        { type = 0, id = 5171, count = 258, strong = 0, quality = 0, bind = 1 }, --神魂(1)*258
                    },
                },
                {
                    oldmoney = 8888, --原价
                    money = 8888,    --现价
                    txt = "商城无出售",
                    award = 
                    {
                        { type = 0, id = 5171, count = 1188, strong = 0, quality = 0, bind = 1 }, --神魂(1)*1188
                    },
                },
                {
                    oldmoney = 13888, --原价
                    money = 13888,    --现价
                    txt = "商城无出售",
                    award = 
                    {
                        { type = 0, id = 5171, count = 1888, strong = 0, quality = 0, bind = 1 }, --神魂(1)*1888
                    },
                },
                {
                    oldmoney = 1888, --原价
                    money = 1888,    --现价
                    txt = "商城无出售",
                    award = 
                    {
                        { type = 0, id = 5364, count = 7, strong = 0, quality = 0, bind = 1 }, --二阶宝石袋*7
                    },
                },
                {
                    oldmoney = 8888, --原价
                    money = 8888,    --现价
                    txt = "商城无出售",
                    award = 
                    {
                        { type = 0, id = 5364, count = 30, strong = 0, quality = 0, bind = 1 }, --二阶宝石袋*30
                    },
                },
                {
                    oldmoney = 13888, --原价
                    money = 13888,    --现价
                    txt = "商城无出售",
                    award = 
                    {
                        { type = 0, id = 5364, count = 48, strong = 0, quality = 0, bind = 1 }, --二阶宝石袋*48
                    },
                },
            },
        },
        --召唤战友
        CallPlayer = 
        {
            MaxCallCount = 5,   --最大召唤次数
            Award = 
            {
                --召回者奖励
                {
                    { type = 0, id = 5455, count = 1, strong = 0, quality = 0, bind = 1 }, --中级礼包*1
                },
                --被召回者奖励
                {
                    { type = 0, id = 6363, count = 1, strong = 0, quality = 0, bind = 1 }, --壕礼宝箱*1
                }
            },
        },
        --消费回馈
        ConsumeFellBack =
        {
            --累计消费1000元宝
            {
                money = 1000,
                award = 
                {
                    { type = 0, id = 860, count = 1, strong = 0, quality = 0, bind = 1 }, --宝藏钥匙*1
                    { type = 0, id = 6403, count = 2, strong = 0, quality = 0, bind = 1 }, --五行石*2
                    { type = 0, id = 548, count = 3, strong = 0, quality = 0, bind = 1 }, --转生地宫证明*3
                    { type = 0, id = 5475, count = 1, strong = 0, quality = 0, bind = 1 }, --玛雅神殿证明*1
                },
            },
            --累计消费2000元宝
            {
                money = 2000,
                award = 
                {
                    { type = 0, id = 860, count = 2, strong = 0, quality = 0, bind = 1 }, --宝藏钥匙*2
                    { type = 0, id = 6403, count = 4, strong = 0, quality = 0, bind = 1 }, --五行石*4
                    { type = 0, id = 548, count = 9, strong = 0, quality = 0, bind = 1 }, --转生地宫证明*9
                    { type = 0, id = 5475, count = 3, strong = 0, quality = 0, bind = 1 }, --玛雅神殿证明*3 
                },
            },
            --累计消费5000元宝
            {
                money = 5000,
                award = 
                {
                    { type = 0, id = 860, count = 3, strong = 0, quality = 0, bind = 1 }, --宝藏钥匙*3
                    { type = 0, id = 6403, count = 6, strong = 0, quality = 0, bind = 1 }, --五行石*6
                    { type = 0, id = 548, count = 15, strong = 0, quality = 0, bind = 1 }, --转生地宫证明*15
                    { type = 0, id = 5475, count = 6, strong = 0, quality = 0, bind = 1 }, --玛雅神殿证明*6
                },
            },
            --累计消费10000元宝
            {
                money = 10000,
                award = 
                {
                    { type = 0, id = 860, count = 5, strong = 0, quality = 0, bind = 1 }, --宝藏钥匙*5
                    { type = 0, id = 6403, count = 8, strong = 0, quality = 0, bind = 1 }, --五行石*8
                    { type = 0, id = 548, count = 20, strong = 0, quality = 0, bind = 1 }, --转生地宫证明*20
                    { type = 0, id = 5475, count = 10, strong = 0, quality = 0, bind = 1 }, --玛雅神殿证明*10
                },
            },
        },
        --专属BOSS
        BossInfo = 
        {
            
             --80活跃度
            {
                activevalue = 80,
                award = 
                {
                     { type = 0, id = 6656, count = 1, strong = 0, quality = 0, bind = 1 }, 
                },
            },
             --150活跃度
            {
                activevalue = 150,
                award = 
                {
                     { type = 0, id = 6656, count = 1, strong = 0, quality = 0, bind = 1 }, 
                },
            },
             --240活跃度
            {
                activevalue = 240,
                award = 
                {
                     { type = 0, id = 6656, count = 1, strong = 0, quality = 0, bind = 1 }, 
                },
            },
        },
        --日常奖励
        Daily =
        {
            rate = 1,   --倍数
        }
    },
    
}