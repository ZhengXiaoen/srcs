TreasureIntegral =
    {--宝藏积分兑换 寻宝积分兑换
        {
            
            type = 1,
            name = "积分兑换材料", --以下配置物品价格为商铺价格的2倍来配置
            ExChangeData =
            {
                
                
{id = 1,needScore = 1,consume = {},award = {{type = 0,id = 80,count = 20,bind = 0}},},--疗伤药
{id = 2,needScore = 2,consume = {},award = {{type = 0,id = 82,count = 1,bind = 0}},},--金条
{id = 3,needScore = 6,consume = {},award = {{type = 0,id = 83,count = 1,bind = 0}},},--金砖
{id = 4,needScore = 10,consume = {},award = {{type = 0,id = 84,count = 1,bind = 0}},},--大金砖
{id = 5,needScore = 1,consume = {},award = {{type = 0,id = 85,count = 1,bind = 0}},},--祝福油
{id = 6,needScore = 2,consume = {},award = {{type = 0,id = 459,count = 10,bind = 0}},},--星纹强化石
{id = 7,needScore = 150,consume = {},award = {{type = 0,id = 490,count = 1,bind = 0}},},--成就令牌(大)
{id = 8,needScore = 15,consume = {},award = {{type = 0,id = 538,count = 1,bind = 0}},},--宝石结晶(1000)
{id = 9,needScore = 15,consume = {},award = {{type = 0,id = 552,count = 1,bind = 0}},},--战将灵力丹(中)
{id = 10,needScore = 15,consume = {},award = {{type = 0,id = 573,count = 1,bind = 0}},},--圣珠结晶(1000)
{id = 11,needScore = 150,consume = {},award = {{type = 0,id = 539,count = 1,bind = 0}},},--宝石结晶(10000)
{id = 12,needScore = 150,consume = {},award = {{type = 0,id = 574,count = 1,bind = 0}},},--圣珠结晶(10000)

            
            
            
            }
        },
        {
            type = 2,
            name = "男女衣服互换",
            ExChangeData =
            {
                
                {id = 1, needScore = 1, consume = {{type = 0, id = 432, count = 1, bind = 0}}, award = {{type = 0, id = 431, count = 1, bind = 0}}, }, --霸主血甲(男)
                {id = 2, needScore = 1, consume = {{type = 0, id = 431, count = 1, bind = 0}}, award = {{type = 0, id = 432, count = 1, bind = 0}}, }, --霸主血甲(女)
                {id = 3, needScore = 2, consume = {{type = 0, id = 441, count = 1, bind = 0}}, award = {{type = 0, id = 440, count = 1, bind = 0}}, }, --通天神甲(男)
                {id = 4, needScore = 2, consume = {{type = 0, id = 440, count = 1, bind = 0}}, award = {{type = 0, id = 441, count = 1, bind = 0}}, }, --通天神甲(女)
                {id = 5, needScore = 5, consume = {{type = 0, id = 450, count = 1, bind = 0}}, award = {{type = 0, id = 449, count = 1, bind = 0}}, }, --毁灭灵甲(男)
                {id = 6, needScore = 5, consume = {{type = 0, id = 449, count = 1, bind = 0}}, award = {{type = 0, id = 450, count = 1, bind = 0}}, }, --毁灭灵甲(女)
                {id = 7, needScore = 10, job = 1, consume = {{type = 0, id = 4620, count = 1, bind = 0}}, award = {{type = 0, id = 4619, count = 1, bind = 0}}, }, --上古重甲(男)
                {id = 8, needScore = 10, job = 1, consume = {{type = 0, id = 4619, count = 1, bind = 0}}, award = {{type = 0, id = 4620, count = 1, bind = 0}}, }, --上古重甲(女)
                {id = 9, needScore = 10, job = 2, consume = {{type = 0, id = 4629, count = 1, bind = 0}}, award = {{type = 0, id = 4628, count = 1, bind = 0}}, }, --上古魔袍(男)
                {id = 10, needScore = 10, job = 2, consume = {{type = 0, id = 4628, count = 1, bind = 0}}, award = {{type = 0, id = 4629, count = 1, bind = 0}}, }, --上古魔袍(女)
                {id = 11, needScore = 10, job = 3, consume = {{type = 0, id = 4638, count = 1, bind = 0}}, award = {{type = 0, id = 4637, count = 1, bind = 0}}, }, --上古道衣(男)
                {id = 12, needScore = 10, job = 3, consume = {{type = 0, id = 4637, count = 1, bind = 0}}, award = {{type = 0, id = 4638, count = 1, bind = 0}}, }, --上古道衣(女)
                {id = 13, needScore = 20, job = 1, consume = {{type = 0, id = 4647, count = 1, bind = 0}}, award = {{type = 0, id = 4646, count = 1, bind = 0}}, }, --起源战甲(男)
                {id = 14, needScore = 20, job = 1, consume = {{type = 0, id = 4646, count = 1, bind = 0}}, award = {{type = 0, id = 4647, count = 1, bind = 0}}, }, --起源战甲(女)
                {id = 15, needScore = 20, job = 2, consume = {{type = 0, id = 4656, count = 1, bind = 0}}, award = {{type = 0, id = 4655, count = 1, bind = 0}}, }, --起源魔袍(男)
                {id = 16, needScore = 20, job = 2, consume = {{type = 0, id = 4655, count = 1, bind = 0}}, award = {{type = 0, id = 4656, count = 1, bind = 0}}, }, --起源魔袍(女)
                {id = 17, needScore = 20, job = 3, consume = {{type = 0, id = 4665, count = 1, bind = 0}}, award = {{type = 0, id = 4664, count = 1, bind = 0}}, }, --起源道衣(男)
                {id = 18, needScore = 20, job = 3, consume = {{type = 0, id = 4664, count = 1, bind = 0}}, award = {{type = 0, id = 4665, count = 1, bind = 0}}, }, --起源道衣(女)
                {id = 19, needScore = 40, job = 1, consume = {{type = 0, id = 4674, count = 1, bind = 0}}, award = {{type = 0, id = 4673, count = 1, bind = 0}}, }, --誓言战甲(男)
                {id = 20, needScore = 40, job = 1, consume = {{type = 0, id = 4673, count = 1, bind = 0}}, award = {{type = 0, id = 4674, count = 1, bind = 0}}, }, --誓言战甲(女)
                {id = 21, needScore = 40, job = 2, consume = {{type = 0, id = 4683, count = 1, bind = 0}}, award = {{type = 0, id = 4682, count = 1, bind = 0}}, }, --誓言魔袍(男)
                {id = 22, needScore = 40, job = 2, consume = {{type = 0, id = 4682, count = 1, bind = 0}}, award = {{type = 0, id = 4683, count = 1, bind = 0}}, }, --誓言魔袍(女)
                {id = 23, needScore = 40, job = 3, consume = {{type = 0, id = 4692, count = 1, bind = 0}}, award = {{type = 0, id = 4691, count = 1, bind = 0}}, }, --誓言道衣(男)
                {id = 24, needScore = 40, job = 3, consume = {{type = 0, id = 4691, count = 1, bind = 0}}, award = {{type = 0, id = 4692, count = 1, bind = 0}}, }, --誓言道衣(女)
                {id = 25, needScore = 60, job = 1, consume = {{type = 0, id = 89, count = 1, bind = 0}}, award = {{type = 0, id = 88, count = 1, bind = 0}}, }, --冲天战甲(男)
                {id = 26, needScore = 60, job = 1, consume = {{type = 0, id = 88, count = 1, bind = 0}}, award = {{type = 0, id = 89, count = 1, bind = 0}}, }, --冲天战甲(女)
                {id = 27, needScore = 60, job = 2, consume = {{type = 0, id = 98, count = 1, bind = 0}}, award = {{type = 0, id = 97, count = 1, bind = 0}}, }, --冲天魔袍(男)
                {id = 28, needScore = 60, job = 2, consume = {{type = 0, id = 97, count = 1, bind = 0}}, award = {{type = 0, id = 98, count = 1, bind = 0}}, }, --冲天魔袍(女)
                {id = 29, needScore = 60, job = 3, consume = {{type = 0, id = 107, count = 1, bind = 0}}, award = {{type = 0, id = 106, count = 1, bind = 0}}, }, --冲天道衣(男)
                {id = 30, needScore = 60, job = 3, consume = {{type = 0, id = 106, count = 1, bind = 0}}, award = {{type = 0, id = 107, count = 1, bind = 0}}, }, --冲天道衣(女)
                {id = 31, needScore = 80, job = 1, consume = {{type = 0, id = 116, count = 1, bind = 0}}, award = {{type = 0, id = 115, count = 1, bind = 0}}, }, --菩提战狂甲(男)
                {id = 32, needScore = 80, job = 1, consume = {{type = 0, id = 115, count = 1, bind = 0}}, award = {{type = 0, id = 116, count = 1, bind = 0}}, }, --菩提战狂甲(女)
                {id = 33, needScore = 80, job = 2, consume = {{type = 0, id = 125, count = 1, bind = 0}}, award = {{type = 0, id = 124, count = 1, bind = 0}}, }, --菩提法痴袍(男)
                {id = 34, needScore = 80, job = 2, consume = {{type = 0, id = 124, count = 1, bind = 0}}, award = {{type = 0, id = 125, count = 1, bind = 0}}, }, --菩提法痴袍(女)
                {id = 35, needScore = 80, job = 3, consume = {{type = 0, id = 134, count = 1, bind = 0}}, award = {{type = 0, id = 133, count = 1, bind = 0}}, }, --菩提道仙衣(男)
                {id = 36, needScore = 80, job = 3, consume = {{type = 0, id = 133, count = 1, bind = 0}}, award = {{type = 0, id = 134, count = 1, bind = 0}}, }, --菩提道仙衣(女)
                
                {id = 37, needScore = 100, job = 1, consume = {{type = 0, id = 143, count = 1, bind = 0}}, award = {{type = 0, id = 142, count = 1, bind = 0}}, }, --无尘战(男)
                {id = 38, needScore = 100, job = 1, consume = {{type = 0, id = 142, count = 1, bind = 0}}, award = {{type = 0, id = 143, count = 1, bind = 0}}, }, --无尘战(女)
                {id = 39, needScore = 100, job = 2, consume = {{type = 0, id = 152, count = 1, bind = 0}}, award = {{type = 0, id = 151, count = 1, bind = 0}}, }, --无尘法(男)
                {id = 40, needScore = 100, job = 2, consume = {{type = 0, id = 151, count = 1, bind = 0}}, award = {{type = 0, id = 152, count = 1, bind = 0}}, }, --无尘法(女)
                {id = 41, needScore = 100, job = 3, consume = {{type = 0, id = 161, count = 1, bind = 0}}, award = {{type = 0, id = 160, count = 1, bind = 0}}, }, --无尘道(男)
                {id = 42, needScore = 100, job = 3, consume = {{type = 0, id = 160, count = 1, bind = 0}}, award = {{type = 0, id = 161, count = 1, bind = 0}}, }, --无尘道(女)

                {id = 43, needScore = 150, job = 1, consume = {{type = 0, id = 5961, count = 1, bind = 0}}, award = {{type = 0, id = 5962, count = 1, bind = 0}}, }, --龍之甲(男)Ⅰ
                {id = 44, needScore = 150, job = 1, consume = {{type = 0, id = 5962, count = 1, bind = 0}}, award = {{type = 0, id = 5961, count = 1, bind = 0}}, }, --龍之甲(女)Ⅰ
                {id = 45, needScore = 150, job = 2, consume = {{type = 0, id = 5961, count = 1, bind = 0}}, award = {{type = 0, id = 5962, count = 1, bind = 0}}, }, --龍之甲(男)Ⅰ
                {id = 46, needScore = 150, job = 2, consume = {{type = 0, id = 5962, count = 1, bind = 0}}, award = {{type = 0, id = 5961, count = 1, bind = 0}}, }, --龍之甲(女)Ⅰ
                {id = 47, needScore = 150, job = 3, consume = {{type = 0, id = 5961, count = 1, bind = 0}}, award = {{type = 0, id = 5962, count = 1, bind = 0}}, }, --龍之甲(男)Ⅰ
                {id = 48, needScore = 150, job = 3, consume = {{type = 0, id = 5962, count = 1, bind = 0}}, award = {{type = 0, id = 5961, count = 1, bind = 0}}, }, --龍之甲(女)Ⅰ

                 {id = 49, needScore = 200, job = 1, consume = {{type = 0, id = 170, count = 1, bind = 0}}, award = {{type = 0, id = 169, count = 1, bind = 0}}, }, --芙蓉战(男)
                {id = 50, needScore = 200, job = 1, consume = {{type = 0, id = 169, count = 1, bind = 0}}, award = {{type = 0, id = 170, count = 1, bind = 0}}, }, --芙蓉战(女)
                {id = 51, needScore = 200, job = 2, consume = {{type = 0, id = 179, count = 1, bind = 0}}, award = {{type = 0, id = 178, count = 1, bind = 0}}, }, --芙蓉法(男)
                {id = 52, needScore = 200, job = 2, consume = {{type = 0, id = 178, count = 1, bind = 0}}, award = {{type = 0, id = 179, count = 1, bind = 0}}, }, --芙蓉法(女)
                {id = 53, needScore = 200, job = 3, consume = {{type = 0, id = 188, count = 1, bind = 0}}, award = {{type = 0, id = 187, count = 1, bind = 0}}, }, --芙蓉道(男)
                {id = 54, needScore = 200, job = 3, consume = {{type = 0, id = 187, count = 1, bind = 0}}, award = {{type = 0, id = 188, count = 1, bind = 0}}, }, --芙蓉道(女)
            
            }
        },
        
        {
            type = 3,
            name = "积分兑换武器",
            ExChangeData =
            {
                
{id = 1,needScore = 20,consume = {},award = {{type = 0,id = 430,count = 1,bind = 0}},},--霸主血刃
{id = 2,needScore = 20,consume = {{type = 0,id = 430,count = 1,bind = 0}},award = {{type = 0,id = 439,count = 1,bind = 0}},},--通天神剑
{id = 3,needScore = 30,consume = {{type = 0,id = 439,count = 1,bind = 0}},award = {{type = 0,id = 448,count = 1,bind = 0}},},--毁灭灵斩
{id = 4,needScore = 90,job = 1,consume = {{type = 0,id = 448,count = 1,bind = 0}},award = {{type = 0,id = 4618,count = 1,bind = 0}},},--上古开山
{id = 5,needScore = 90,job = 2,consume = {{type = 0,id = 448,count = 1,bind = 0}},award = {{type = 0,id = 4627,count = 1,bind = 0}},},--上古拂尘
{id = 6,needScore = 90,job = 3,consume = {{type = 0,id = 448,count = 1,bind = 0}},award = {{type = 0,id = 4636,count = 1,bind = 0}},},--上古霹雷
{id = 7,needScore = 180,job = 1,consume = {{type = 0,id = 4618,count = 1,bind = 0}},award = {{type = 0,id = 4645,count = 1,bind = 0}},},--起源战刃
{id = 8,needScore = 180,job = 2,consume = {{type = 0,id = 4627,count = 1,bind = 0}},award = {{type = 0,id = 4654,count = 1,bind = 0}},},--起源法剑
{id = 9,needScore = 180,job = 3,consume = {{type = 0,id = 4636,count = 1,bind = 0}},award = {{type = 0,id = 4663,count = 1,bind = 0}},},--起源道剑
{id = 10,needScore = 360,job = 1,consume = {{type = 0,id = 4645,count = 1,bind = 0}},award = {{type = 0,id = 4672,count = 1,bind = 0}},},--誓言星王
{id = 11,needScore = 360,job = 2,consume = {{type = 0,id = 4654,count = 1,bind = 0}},award = {{type = 0,id = 4681,count = 1,bind = 0}},},--誓言血饮
{id = 12,needScore = 360,job = 3,consume = {{type = 0,id = 4663,count = 1,bind = 0}},award = {{type = 0,id = 4690,count = 1,bind = 0}},},--誓言天玑
{id = 13,needScore = 1500,job = 1,consume = {{type = 0,id = 4672,count = 1,bind = 0}},award = {{type = 0,id = 87,count = 1,bind = 0}},},--冲天战刀
{id = 14,needScore = 1500,job = 2,consume = {{type = 0,id = 4681,count = 1,bind = 0}},award = {{type = 0,id = 96,count = 1,bind = 0}},},--冲天魔杖
{id = 15,needScore = 1500,job = 3,consume = {{type = 0,id = 4690,count = 1,bind = 0}},award = {{type = 0,id = 105,count = 1,bind = 0}},},--冲天道剑


                
            
            
            
            
            },
        },
        {
            type = 4,
            name = "积分兑换衣服",
            ExChangeData =
            {
                
                {id = 1,needScore = 15,consume = {},award = {{type = 0,id = 431,count = 1,bind = 0}},},--霸主血甲(男)
                {id = 2,needScore = 15,consume = {},award = {{type = 0,id = 432,count = 1,bind = 0}},},--霸主血甲(女)
                {id = 3,needScore = 15,consume = {{type = 0,id = 431,count = 1,bind = 0}},award = {{type = 0,id = 440,count = 1,bind = 0}},},--通天神甲(男)
                {id = 4,needScore = 15,consume = {{type = 0,id = 432,count = 1,bind = 0}},award = {{type = 0,id = 441,count = 1,bind = 0}},},--通天神甲(女)
                {id = 5,needScore = 20,consume = {{type = 0,id = 440,count = 1,bind = 0}},award = {{type = 0,id = 449,count = 1,bind = 0}},},--毁灭灵甲(男)
                {id = 6,needScore = 20,consume = {{type = 0,id = 441,count = 1,bind = 0}},award = {{type = 0,id = 450,count = 1,bind = 0}},},--毁灭灵甲(女)
                {id = 7, needScore = 60, job = 1, consume = {{type = 0, id = 449, count = 1, bind = 0}}, award = {{type = 0, id = 4619, count = 1, bind = 0}}, }, --上古重甲(男)
                {id = 8, needScore = 60, job = 1, consume = {{type = 0, id = 450, count = 1, bind = 0}}, award = {{type = 0, id = 4620, count = 1, bind = 0}}, }, --上古重甲(女)
                {id = 9, needScore = 60, job = 2, consume = {{type = 0, id = 449, count = 1, bind = 0}}, award = {{type = 0, id = 4628, count = 1, bind = 0}}, }, --上古魔袍(男)
                {id = 10, needScore = 60, job = 2, consume = {{type = 0, id = 450, count = 1, bind = 0}}, award = {{type = 0, id = 4629, count = 1, bind = 0}}, }, --上古魔袍(女)
                {id = 11, needScore = 60, job = 3, consume = {{type = 0, id = 449, count = 1, bind = 0}}, award = {{type = 0, id = 4637, count = 1, bind = 0}}, }, --上古道衣(男)
                {id = 12, needScore = 60, job = 3, consume = {{type = 0, id = 450, count = 1, bind = 0}}, award = {{type = 0, id = 4638, count = 1, bind = 0}}, }, --上古道衣(女)
{id = 13,needScore = 150,job = 1,consume = {{type = 0,id = 4619,count = 1,bind = 0}},award = {{type = 0,id = 4646,count = 1,bind = 0}},},--起源战甲(男)
{id = 14,needScore = 150,job = 1,consume = {{type = 0,id = 4620,count = 1,bind = 0}},award = {{type = 0,id = 4647,count = 1,bind = 0}},},--起源战甲(女)
{id = 15,needScore = 150,job = 2,consume = {{type = 0,id = 4628,count = 1,bind = 0}},award = {{type = 0,id = 4655,count = 1,bind = 0}},},--起源魔袍(男)
{id = 16,needScore = 150,job = 2,consume = {{type = 0,id = 4629,count = 1,bind = 0}},award = {{type = 0,id = 4656,count = 1,bind = 0}},},--起源魔袍(女)
{id = 17,needScore = 150,job = 3,consume = {{type = 0,id = 4637,count = 1,bind = 0}},award = {{type = 0,id = 4664,count = 1,bind = 0}},},--起源道衣(男)
{id = 18,needScore = 150,job = 3,consume = {{type = 0,id = 4638,count = 1,bind = 0}},award = {{type = 0,id = 4665,count = 1,bind = 0}},},--起源道衣(女)
{id = 19,needScore = 300,job = 1,consume = {{type = 0,id = 4646,count = 1,bind = 0}},award = {{type = 0,id = 4673,count = 1,bind = 0}},},--誓言战甲(男)
{id = 20,needScore = 300,job = 1,consume = {{type = 0,id = 4647,count = 1,bind = 0}},award = {{type = 0,id = 4674,count = 1,bind = 0}},},--誓言战甲(女)
{id = 21,needScore = 300,job = 2,consume = {{type = 0,id = 4655,count = 1,bind = 0}},award = {{type = 0,id = 4682,count = 1,bind = 0}},},--誓言魔袍(男)
{id = 22,needScore = 300,job = 2,consume = {{type = 0,id = 4656,count = 1,bind = 0}},award = {{type = 0,id = 4683,count = 1,bind = 0}},},--誓言魔袍(女)
{id = 23,needScore = 300,job = 3,consume = {{type = 0,id = 4664,count = 1,bind = 0}},award = {{type = 0,id = 4691,count = 1,bind = 0}},},--誓言道衣(男)
{id = 24,needScore = 300,job = 3,consume = {{type = 0,id = 4665,count = 1,bind = 0}},award = {{type = 0,id = 4692,count = 1,bind = 0}},},--誓言道衣(女)
{id = 25,needScore = 1250,job = 1,consume = {{type = 0,id = 4673,count = 1,bind = 0}},award = {{type = 0,id = 88,count = 1,bind = 0}},},--冲天战甲(男)
{id = 26,needScore = 1250,job = 1,consume = {{type = 0,id = 4674,count = 1,bind = 0}},award = {{type = 0,id = 89,count = 1,bind = 0}},},--冲天战甲(女)
{id = 27,needScore = 1250,job = 2,consume = {{type = 0,id = 4682,count = 1,bind = 0}},award = {{type = 0,id = 97,count = 1,bind = 0}},},--冲天魔袍(男)
{id = 28,needScore = 1250,job = 2,consume = {{type = 0,id = 4683,count = 1,bind = 0}},award = {{type = 0,id = 98,count = 1,bind = 0}},},--冲天魔袍(女)
{id = 29,needScore = 1250,job = 3,consume = {{type = 0,id = 4691,count = 1,bind = 0}},award = {{type = 0,id = 106,count = 1,bind = 0}},},--冲天道衣(男)
{id = 30,needScore = 1250,job = 3,consume = {{type = 0,id = 4692,count = 1,bind = 0}},award = {{type = 0,id = 107,count = 1,bind = 0}},},--冲天道衣(女)



            
            
            
            },
        },


     {
            type = 5,
            name = "积分兑换首饰",
            ExChangeData =
            {
                
{id = 1,needScore = 50,job = 1,consume = {{type = 0,id = 451,count = 1,bind = 0}},award = {{type = 0,id = 4621,count = 1,bind = 0}},},--上古战盔
{id = 2,needScore = 50,job = 1,consume = {{type = 0,id = 452,count = 1,bind = 0}},award = {{type = 0,id = 4622,count = 1,bind = 0}},},--上古战链
{id = 3,needScore = 50,job = 1,consume = {{type = 0,id = 453,count = 1,bind = 0}},award = {{type = 0,id = 4623,count = 1,bind = 0}},},--上古战镯
{id = 4,needScore = 50,job = 1,consume = {{type = 0,id = 454,count = 1,bind = 0}},award = {{type = 0,id = 4624,count = 1,bind = 0}},},--上古战戒
{id = 5,needScore = 50,job = 1,consume = {{type = 0,id = 455,count = 1,bind = 0}},award = {{type = 0,id = 4625,count = 1,bind = 0}},},--上古战带
{id = 6,needScore = 50,job = 1,consume = {{type = 0,id = 456,count = 1,bind = 0}},award = {{type = 0,id = 4626,count = 1,bind = 0}},},--上古战靴
{id = 7,needScore = 50,job = 2,consume = {{type = 0,id = 451,count = 1,bind = 0}},award = {{type = 0,id = 4630,count = 1,bind = 0}},},--上古法盔
{id = 8,needScore = 50,job = 2,consume = {{type = 0,id = 452,count = 1,bind = 0}},award = {{type = 0,id = 4631,count = 1,bind = 0}},},--上古法链
{id = 9,needScore = 50,job = 2,consume = {{type = 0,id = 453,count = 1,bind = 0}},award = {{type = 0,id = 4632,count = 1,bind = 0}},},--上古法镯
{id = 10,needScore = 50,job = 2,consume = {{type = 0,id = 454,count = 1,bind = 0}},award = {{type = 0,id = 4633,count = 1,bind = 0}},},--上古法戒
{id = 11,needScore = 50,job = 2,consume = {{type = 0,id = 455,count = 1,bind = 0}},award = {{type = 0,id = 4634,count = 1,bind = 0}},},--上古法带
{id = 12,needScore = 50,job = 2,consume = {{type = 0,id = 456,count = 1,bind = 0}},award = {{type = 0,id = 4635,count = 1,bind = 0}},},--上古法靴
{id = 13,needScore = 50,job = 3,consume = {{type = 0,id = 451,count = 1,bind = 0}},award = {{type = 0,id = 4639,count = 1,bind = 0}},},--上古道盔
{id = 14,needScore = 50,job = 3,consume = {{type = 0,id = 452,count = 1,bind = 0}},award = {{type = 0,id = 4640,count = 1,bind = 0}},},--上古道链
{id = 15,needScore = 50,job = 3,consume = {{type = 0,id = 453,count = 1,bind = 0}},award = {{type = 0,id = 4641,count = 1,bind = 0}},},--上古道镯
{id = 16,needScore = 50,job = 3,consume = {{type = 0,id = 454,count = 1,bind = 0}},award = {{type = 0,id = 4642,count = 1,bind = 0}},},--上古道戒
{id = 17,needScore = 50,job = 3,consume = {{type = 0,id = 455,count = 1,bind = 0}},award = {{type = 0,id = 4643,count = 1,bind = 0}},},--上古道带
{id = 18,needScore = 50,job = 3,consume = {{type = 0,id = 456,count = 1,bind = 0}},award = {{type = 0,id = 4644,count = 1,bind = 0}},},--上古道靴
{id = 19,needScore = 100,job = 1,consume = {{type = 0,id = 4621,count = 1,bind = 0}},award = {{type = 0,id = 4648,count = 1,bind = 0}},},--起源战盔
{id = 20,needScore = 100,job = 1,consume = {{type = 0,id = 4622,count = 1,bind = 0}},award = {{type = 0,id = 4649,count = 1,bind = 0}},},--起源战链
{id = 21,needScore = 100,job = 1,consume = {{type = 0,id = 4623,count = 1,bind = 0}},award = {{type = 0,id = 4650,count = 1,bind = 0}},},--起源战镯
{id = 22,needScore = 100,job = 1,consume = {{type = 0,id = 4624,count = 1,bind = 0}},award = {{type = 0,id = 4651,count = 1,bind = 0}},},--起源战戒
{id = 23,needScore = 100,job = 1,consume = {{type = 0,id = 4625,count = 1,bind = 0}},award = {{type = 0,id = 4652,count = 1,bind = 0}},},--起源战带
{id = 24,needScore = 100,job = 1,consume = {{type = 0,id = 4626,count = 1,bind = 0}},award = {{type = 0,id = 4653,count = 1,bind = 0}},},--起源战靴
{id = 25,needScore = 100,job = 2,consume = {{type = 0,id = 4630,count = 1,bind = 0}},award = {{type = 0,id = 4657,count = 1,bind = 0}},},--起源法盔
{id = 26,needScore = 100,job = 2,consume = {{type = 0,id = 4631,count = 1,bind = 0}},award = {{type = 0,id = 4658,count = 1,bind = 0}},},--起源法链
{id = 27,needScore = 100,job = 2,consume = {{type = 0,id = 4632,count = 1,bind = 0}},award = {{type = 0,id = 4659,count = 1,bind = 0}},},--起源法镯
{id = 28,needScore = 100,job = 2,consume = {{type = 0,id = 4633,count = 1,bind = 0}},award = {{type = 0,id = 4660,count = 1,bind = 0}},},--起源法戒
{id = 29,needScore = 100,job = 2,consume = {{type = 0,id = 4634,count = 1,bind = 0}},award = {{type = 0,id = 4661,count = 1,bind = 0}},},--起源法带
{id = 30,needScore = 100,job = 2,consume = {{type = 0,id = 4635,count = 1,bind = 0}},award = {{type = 0,id = 4662,count = 1,bind = 0}},},--起源法靴
{id = 31,needScore = 100,job = 3,consume = {{type = 0,id = 4639,count = 1,bind = 0}},award = {{type = 0,id = 4666,count = 1,bind = 0}},},--起源道盔
{id = 32,needScore = 100,job = 3,consume = {{type = 0,id = 4640,count = 1,bind = 0}},award = {{type = 0,id = 4667,count = 1,bind = 0}},},--起源道链
{id = 33,needScore = 100,job = 3,consume = {{type = 0,id = 4641,count = 1,bind = 0}},award = {{type = 0,id = 4668,count = 1,bind = 0}},},--起源道镯
{id = 34,needScore = 100,job = 3,consume = {{type = 0,id = 4642,count = 1,bind = 0}},award = {{type = 0,id = 4669,count = 1,bind = 0}},},--起源道戒
{id = 35,needScore = 100,job = 3,consume = {{type = 0,id = 4643,count = 1,bind = 0}},award = {{type = 0,id = 4670,count = 1,bind = 0}},},--起源道带
{id = 36,needScore = 100,job = 3,consume = {{type = 0,id = 4644,count = 1,bind = 0}},award = {{type = 0,id = 4671,count = 1,bind = 0}},},--起源道靴
{id = 37,needScore = 200,job = 1,consume = {{type = 0,id = 4648,count = 1,bind = 0}},award = {{type = 0,id = 4675,count = 1,bind = 0}},},--誓言战盔
{id = 38,needScore = 200,job = 1,consume = {{type = 0,id = 4649,count = 1,bind = 0}},award = {{type = 0,id = 4676,count = 1,bind = 0}},},--誓言战链
{id = 39,needScore = 200,job = 1,consume = {{type = 0,id = 4650,count = 1,bind = 0}},award = {{type = 0,id = 4677,count = 1,bind = 0}},},--誓言战镯
{id = 40,needScore = 200,job = 1,consume = {{type = 0,id = 4651,count = 1,bind = 0}},award = {{type = 0,id = 4678,count = 1,bind = 0}},},--誓言战戒
{id = 41,needScore = 200,job = 1,consume = {{type = 0,id = 4652,count = 1,bind = 0}},award = {{type = 0,id = 4679,count = 1,bind = 0}},},--誓言战带
{id = 42,needScore = 200,job = 1,consume = {{type = 0,id = 4653,count = 1,bind = 0}},award = {{type = 0,id = 4680,count = 1,bind = 0}},},--誓言战靴
{id = 43,needScore = 200,job = 2,consume = {{type = 0,id = 4657,count = 1,bind = 0}},award = {{type = 0,id = 4684,count = 1,bind = 0}},},--誓言法盔
{id = 44,needScore = 200,job = 2,consume = {{type = 0,id = 4658,count = 1,bind = 0}},award = {{type = 0,id = 4685,count = 1,bind = 0}},},--誓言法链
{id = 45,needScore = 200,job = 2,consume = {{type = 0,id = 4659,count = 1,bind = 0}},award = {{type = 0,id = 4686,count = 1,bind = 0}},},--誓言法镯
{id = 46,needScore = 200,job = 2,consume = {{type = 0,id = 4660,count = 1,bind = 0}},award = {{type = 0,id = 4687,count = 1,bind = 0}},},--誓言法戒
{id = 47,needScore = 200,job = 2,consume = {{type = 0,id = 4661,count = 1,bind = 0}},award = {{type = 0,id = 4688,count = 1,bind = 0}},},--誓言法带
{id = 48,needScore = 200,job = 2,consume = {{type = 0,id = 4662,count = 1,bind = 0}},award = {{type = 0,id = 4689,count = 1,bind = 0}},},--誓言法靴
{id = 49,needScore = 200,job = 3,consume = {{type = 0,id = 4666,count = 1,bind = 0}},award = {{type = 0,id = 4693,count = 1,bind = 0}},},--誓言道盔
{id = 50,needScore = 200,job = 3,consume = {{type = 0,id = 4667,count = 1,bind = 0}},award = {{type = 0,id = 4694,count = 1,bind = 0}},},--誓言道链
{id = 51,needScore = 200,job = 3,consume = {{type = 0,id = 4668,count = 1,bind = 0}},award = {{type = 0,id = 4695,count = 1,bind = 0}},},--誓言道镯
{id = 52,needScore = 200,job = 3,consume = {{type = 0,id = 4669,count = 1,bind = 0}},award = {{type = 0,id = 4696,count = 1,bind = 0}},},--誓言道戒
{id = 53,needScore = 200,job = 3,consume = {{type = 0,id = 4670,count = 1,bind = 0}},award = {{type = 0,id = 4697,count = 1,bind = 0}},},--誓言道带
{id = 54,needScore = 200,job = 3,consume = {{type = 0,id = 4671,count = 1,bind = 0}},award = {{type = 0,id = 4698,count = 1,bind = 0}},},--誓言道靴



            
            
            
            },
        },
    --------------------------------------------------------------------------------
    }
