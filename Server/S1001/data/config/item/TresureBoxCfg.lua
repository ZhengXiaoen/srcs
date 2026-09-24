--珍宝箱配置
TresureBoxCfg =
    {
        shake = {500, 500, 500, 500, }, --抽取消耗元宝
        gridcount = 8, --除去免费的格子数量
        itemid = 4740, --珍宝箱
        free = --免费道具
        {
            --type=1,道具 id=道具id bind= 是否绑定 rate几率 =万分比
            {type = 0, id = 65535, count = 200000, bind = 0, rate = 1000}, --绑定金币
            {type = 1, id = 569, count = 1, bind = 0, rate = 3000}, --护盾碎片 1000
            {type = 1, id = 535, count = 1, bind = 1, rate = 3000}, --护符碎片 1000
            {type = 0, id = 65535, count = 100000, bind = 0, rate = 3000}, --绑定金币
        },
        low = --低品质
        {
            {type = 1, id = 82, count = 10, bind = 0, rate = 27, job = 0, sex = 0, }, --//金条
            {type = 1, id = 83, count = 2, bind = 0, rate = 2, job = 0, sex = 0, }, --//金砖
            {type = 1, id = 84, count = 1, bind = 0, rate = 2, job = 0, sex = 0, }, --//大金砖
            {type = 1, id = 537, count = 2, bind = 0, rate = 2, job = 0, sex = 0, }, --//宝石结晶(100)
            {type = 1, id = 572, count = 2, bind = 0, rate = 2, job = 0, sex = 0, }, --//圣珠结晶(100)
            {type = 1, id = 80, count = 200, bind = 0, rate = 2, job = 0, sex = 0, }, --//疗伤药
            {type = 1, id = 85, count = 5, bind = 0, rate = 2, job = 0, sex = 0, }, --//祝福油
            {type = 1, id = 305, count = 1, bind = 0, rate = 27, job = 0, sex = 0, }, --//积分BOSS卷(尸王)
            {type = 1, id = 552, count = 1, bind = 0, rate = 27, job = 0, sex = 0, }, --//战将灵力丹(中)
            {type = 1, id = 489, count = 1, bind = 0, rate = 27, job = 0, sex = 0, }, --//成就令牌(中)
            {type = 1, id = 538, count = 1, bind = 0, rate = 27, job = 0, sex = 0, }, --//宝石结晶(1000)
            {type = 1, id = 573, count = 1, bind = 0, rate = 27, job = 0, sex = 0, }, --//圣珠结晶(1000)
            {type = 1, id = 542, count = 1, bind = 0, rate = 27, job = 0, sex = 0, }, --//转生修为丹(小)
        
        
        },
        high = --高品质
        {
            {type = 1, id = 85, count = 100, bind = 0, rate = 580, job = 0, sex = 0, }, --//祝福油
            {type = 1, id = 307, count = 1, bind = 0, rate = 600, job = 0, sex = 0, }, --//积分BOSS卷(祖玛教主)
            {type = 1, id = 553, count = 1, bind = 0, rate = 580, job = 0, sex = 0, }, --//战将灵力丹(大)
            {type = 1, id = 490, count = 1, bind = 0, rate = 600, job = 0, sex = 0, }, --//成就令牌(大)
            {type = 1, id = 539, count = 1, bind = 0, rate = 600, job = 0, sex = 0, }, --//宝石结晶(10000)
            {type = 1, id = 574, count = 1, bind = 0, rate = 600, job = 0, sex = 0, }, --//圣珠结晶(10000)
            {type = 1, id = 544, count = 1, bind = 0, rate = 620, job = 0, sex = 0, }, --//转生修为丹(大)
            {type = 1, id = 4706, count = 10, bind = 0, rate = 620, job = 0, sex = 0, }, --//钻石矿
            {type = 1, id = 527, count = 10, bind = 0, rate = 620, job = 0, sex = 0, }, --//特戒结晶(1)
            
            
            {type = 1, id = 4645, count = 1, bind = 0, rate = 2250, job = 1, sex = 0, }, --//起源战刃
            {type = 1, id = 4646, count = 1, bind = 0, rate = 2250, job = 1, sex = 1, }, --//起源战甲(男)
            {type = 1, id = 4647, count = 1, bind = 0, rate = 2250, job = 1, sex = 2, }, --//起源战甲(女)
            {type = 1, id = 4654, count = 1, bind = 0, rate = 2250, job = 2, sex = 0, }, --//起源法剑
            {type = 1, id = 4655, count = 1, bind = 0, rate = 2250, job = 2, sex = 1, }, --//起源魔袍(男)
            {type = 1, id = 4656, count = 1, bind = 0, rate = 2250, job = 2, sex = 2, }, --//起源魔袍(女)
            {type = 1, id = 4663, count = 1, bind = 0, rate = 2250, job = 3, sex = 0, }, --//起源道剑
            {type = 1, id = 4664, count = 1, bind = 0, rate = 2250, job = 3, sex = 1, }, --//起源道衣(男)
            {type = 1, id = 4665, count = 1, bind = 0, rate = 2250, job = 3, sex = 2, }, --//起源道衣(女)
            {type = 1, id = 4672, count = 1, bind = 0, rate = 3375, job = 1, sex = 0, }, --//誓言星王
            {type = 1, id = 4673, count = 1, bind = 0, rate = 3375, job = 1, sex = 1, }, --//誓言战甲(男)
            {type = 1, id = 4674, count = 1, bind = 0, rate = 3375, job = 1, sex = 2, }, --//誓言战甲(女)
            {type = 1, id = 4681, count = 1, bind = 0, rate = 3375, job = 2, sex = 0, }, --//誓言血饮
            {type = 1, id = 4682, count = 1, bind = 0, rate = 3375, job = 2, sex = 1, }, --//誓言魔袍(男)
            {type = 1, id = 4683, count = 1, bind = 0, rate = 3375, job = 2, sex = 2, }, --//誓言魔袍(女)
            {type = 1, id = 4690, count = 1, bind = 0, rate = 3375, job = 3, sex = 0, }, --//誓言天玑
            {type = 1, id = 4691, count = 1, bind = 0, rate = 3375, job = 3, sex = 1, }, --//誓言道衣(男)
            {type = 1, id = 4692, count = 1, bind = 0, rate = 3375, job = 3, sex = 2, }, --//誓言道衣(女)
        
        
        
        
        
        },
    
    }
