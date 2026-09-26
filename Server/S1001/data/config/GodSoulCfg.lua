--道具兑换神魂值   w   w w .  c n       1 2 1. c o m
GodSoulCfg =
{
    --老区购买神器和神甲
    OldBuy =
    {

        NeedYuanBao = 5888, --所需元宝
        --奖励
        Reawrd = 
        {
            {type = 0, id = 5172, count = 1, quality = 0, strong = 0, bind = 1},---神器
            {type = 0, id = 5170, count = 5, quality = 0, strong = 0, bind = 1},---神甲碎片
        },
    },
    --神甲激活
    Activate =
    {
        ItemId = 5170, --神器碎片道具id
        Count= 5, --神器碎片数量
        --DestItemId = 100,--兑换后的神甲道具id
        DestItem =
        {
           
            {job=1,sex=0,id=5222,}, --男战士 
            {job=1,sex=1,id=5272,}, --女战士
            {job=2,sex=0,id=5222,}, --男法师 
            {job=2,sex=1,id=5272,}, --女法师
            {job=3,sex=0,id=5222,}, --男道士 
            {job=3,sex=1,id=5272,}, --女道士
        },
    },
    --升级
    UpLev = 
    {
        --首充神器升级
       GodWeapon = 
       {

            --2级
            {
                effectIds = {3},SrcItem =  
                {
                    5172,
                },
                --升级后的神器id
                DestItem = 
                { 
                    {job=1,sex=0,id=5173,}, --男战士 
                    {job=1,sex=1,id=5173,}, --女战士
                    {job=2,sex=0,id=5173,}, --男法师 
                    {job=2,sex=1,id=5173,}, --女法师
                    {job=3,sex=0,id=5173,}, --男道士 
                    {job=3,sex=1,id=5173,}, --女道士
                },
                NeedSoulValue = 280, --所需神魂值
            },
            --3级
            {
                 effectIds = {3},SrcItem =  
                {
                    5173,
                },
                --升级后的神器id
                DestItem = 
                { 
                    {job=1,sex=0,id=5174,}, --男战士 
                    {job=1,sex=1,id=5174,}, --女战士
                    {job=2,sex=0,id=5174,}, --男法师 
                    {job=2,sex=1,id=5174,}, --女法师
                    {job=3,sex=0,id=5174,}, --男道士 
                    {job=3,sex=1,id=5174,}, --女道士
                },
                NeedSoulValue = 380, --所需神魂值
            },
            --4级
            {
                 effectIds = {3},SrcItem =  
                {
                    5174,
                },
                --升级后的神器id
                DestItem = 
                { 
                    {job=1,sex=0,id=5175,}, --男战士 
                    {job=1,sex=1,id=5175,}, --女战士
                    {job=2,sex=0,id=5175,}, --男法师 
                    {job=2,sex=1,id=5175,}, --女法师
                    {job=3,sex=0,id=5175,}, --男道士 
                    {job=3,sex=1,id=5175,}, --女道士
                },
                NeedSoulValue = 500, --所需神魂值
            },
            --5级
            {
                 effectIds = {3},SrcItem =  
                {
                    5175,
                },
                --升级后的神器id
                DestItem = 
                { 
                    {job=1,sex=0,id=5176,}, --男战士 
                    {job=1,sex=1,id=5176,}, --女战士
                    {job=2,sex=0,id=5176,}, --男法师 
                    {job=2,sex=1,id=5176,}, --女法师
                    {job=3,sex=0,id=5176,}, --男道士 
                    {job=3,sex=1,id=5176,}, --女道士
                },
                NeedSoulValue = 650, --所需神魂值
            },
            --6级
            {
                 effectIds = {3},SrcItem =  
                {
                    5176,
                },
                --升级后的神器id
                DestItem = 
                { 
                    {job=1,sex=0,id=5177,}, --男战士 
                    {job=1,sex=1,id=5177,}, --女战士
                    {job=2,sex=0,id=5177,}, --男法师 
                    {job=2,sex=1,id=5177,}, --女法师
                    {job=3,sex=0,id=5177,}, --男道士 
                    {job=3,sex=1,id=5177,}, --女道士
                },
                NeedSoulValue = 830, --所需神魂值
            },
            --7级
            {
                 effectIds = {3},SrcItem =  
                {
                    5177,
                },
                --升级后的神器id
                DestItem = 
                { 
                    {job=1,sex=0,id=5178,}, --男战士 
                    {job=1,sex=1,id=5178,}, --女战士
                    {job=2,sex=0,id=5178,}, --男法师 
                    {job=2,sex=1,id=5178,}, --女法师
                    {job=3,sex=0,id=5178,}, --男道士 
                    {job=3,sex=1,id=5178,}, --女道士
                },
                NeedSoulValue = 1030, --所需神魂值
            },
            --8级
            {
                 effectIds = {3},SrcItem =  
                {
                    5178,
                },
                --升级后的神器id
                DestItem = 
                { 
                    {job=1,sex=0,id=5179,}, --男战士 
                    {job=1,sex=1,id=5179,}, --女战士
                    {job=2,sex=0,id=5179,}, --男法师 
                    {job=2,sex=1,id=5179,}, --女法师
                    {job=3,sex=0,id=5179,}, --男道士 
                    {job=3,sex=1,id=5179,}, --女道士
                },
                NeedSoulValue = 1250, --所需神魂值
            },
            --9级
            {
                 effectIds = {3},SrcItem =  
                {
                    5179,
                },
                --升级后的神器id
                DestItem = 
                { 
                    {job=1,sex=0,id=5180,}, --男战士 
                    {job=1,sex=1,id=5180,}, --女战士
                    {job=2,sex=0,id=5180,}, --男法师 
                    {job=2,sex=1,id=5180,}, --女法师
                    {job=3,sex=0,id=5180,}, --男道士 
                    {job=3,sex=1,id=5180,}, --女道士
                },
                NeedSoulValue = 1490, --所需神魂值
            },
            --10级
            {
                 effectIds = {3},SrcItem =  
                {
                    5180,
                },
                --升级后的神器id
                DestItem = 
                { 
                    {job=1,sex=0,id=5181,}, --男战士 
                    {job=1,sex=1,id=5181,}, --女战士
                    {job=2,sex=0,id=5181,}, --男法师 
                    {job=2,sex=1,id=5181,}, --女法师
                    {job=3,sex=0,id=5181,}, --男道士 
                    {job=3,sex=1,id=5181,}, --女道士
                },
                NeedSoulValue = 1750, --所需神魂值
            },
            --11级
            {
                 effectIds = {4},SrcItem =  
                {
                    5181,
                },
                --升级后的神器id
                DestItem = 
                { 
                    {job=1,sex=0,id=5182,}, --男战士 
                    {job=1,sex=1,id=5182,}, --女战士
                    {job=2,sex=0,id=5182,}, --男法师 
                    {job=2,sex=1,id=5182,}, --女法师
                    {job=3,sex=0,id=5182,}, --男道士 
                    {job=3,sex=1,id=5182,}, --女道士
                },
                NeedSoulValue = 2030, --所需神魂值
            },
            --12级
            {
                 effectIds = {4},SrcItem =  
                {
                    5182,
                },
                --升级后的神器id
                DestItem = 
                { 
                    {job=1,sex=0,id=5183,}, --男战士 
                    {job=1,sex=1,id=5183,}, --女战士
                    {job=2,sex=0,id=5183,}, --男法师 
                    {job=2,sex=1,id=5183,}, --女法师
                    {job=3,sex=0,id=5183,}, --男道士 
                    {job=3,sex=1,id=5183,}, --女道士
                },
                NeedSoulValue = 2330, --所需神魂值
            },
            --13级
            {
                 effectIds = {4},SrcItem =  
                {
                    5183,
                },
                --升级后的神器id
                DestItem = 
                { 
                    {job=1,sex=0,id=5184,}, --男战士 
                    {job=1,sex=1,id=5184,}, --女战士
                    {job=2,sex=0,id=5184,}, --男法师 
                    {job=2,sex=1,id=5184,}, --女法师
                    {job=3,sex=0,id=5184,}, --男道士 
                    {job=3,sex=1,id=5184,}, --女道士
                },
                NeedSoulValue = 2650, --所需神魂值
            },
            --14级
            {
                 effectIds = {4},SrcItem =  
                {
                    5184,
                },
                --升级后的神器id
                DestItem = 
                { 
                    {job=1,sex=0,id=5185,}, --男战士 
                    {job=1,sex=1,id=5185,}, --女战士
                    {job=2,sex=0,id=5185,}, --男法师 
                    {job=2,sex=1,id=5185,}, --女法师
                    {job=3,sex=0,id=5185,}, --男道士 
                    {job=3,sex=1,id=5185,}, --女道士
                },
                NeedSoulValue = 2990, --所需神魂值
            },
            --15级
            {
                 effectIds = {4},SrcItem =  
                {
                    5185,
                },
                --升级后的神器id
                DestItem = 
                { 
                    {job=1,sex=0,id=5186,}, --男战士 
                    {job=1,sex=1,id=5186,}, --女战士
                    {job=2,sex=0,id=5186,}, --男法师 
                    {job=2,sex=1,id=5186,}, --女法师
                    {job=3,sex=0,id=5186,}, --男道士 
                    {job=3,sex=1,id=5186,}, --女道士
                },
                NeedSoulValue = 3350, --所需神魂值
            },
            --16级
            {
                 effectIds = {4},SrcItem =  
                {
                    5186,
                },
                --升级后的神器id
                DestItem = 
                { 
                    {job=1,sex=0,id=5187,}, --男战士 
                    {job=1,sex=1,id=5187,}, --女战士
                    {job=2,sex=0,id=5187,}, --男法师 
                    {job=2,sex=1,id=5187,}, --女法师
                    {job=3,sex=0,id=5187,}, --男道士 
                    {job=3,sex=1,id=5187,}, --女道士
                },
                NeedSoulValue = 3730, --所需神魂值
            },
            --17级
            {
                 effectIds = {4},SrcItem =  
                {
                    5187,
                },
                --升级后的神器id
                DestItem = 
                { 
                    {job=1,sex=0,id=5188,}, --男战士 
                    {job=1,sex=1,id=5188,}, --女战士
                    {job=2,sex=0,id=5188,}, --男法师 
                    {job=2,sex=1,id=5188,}, --女法师
                    {job=3,sex=0,id=5188,}, --男道士 
                    {job=3,sex=1,id=5188,}, --女道士
                },
                NeedSoulValue = 4130, --所需神魂值
            },
            --18级
            {
                 effectIds = {4},SrcItem =  
                {
                    5188,
                },
                --升级后的神器id
                DestItem = 
                { 
                    {job=1,sex=0,id=5189,}, --男战士 
                    {job=1,sex=1,id=5189,}, --女战士
                    {job=2,sex=0,id=5189,}, --男法师 
                    {job=2,sex=1,id=5189,}, --女法师
                    {job=3,sex=0,id=5189,}, --男道士 
                    {job=3,sex=1,id=5189,}, --女道士
                },
                NeedSoulValue = 4550, --所需神魂值
            },
            --19级
            {
                 effectIds = {4},SrcItem =  
                {
                    5189,
                },
                --升级后的神器id
                DestItem = 
                { 
                    {job=1,sex=0,id=5190,}, --男战士 
                    {job=1,sex=1,id=5190,}, --女战士
                    {job=2,sex=0,id=5190,}, --男法师 
                    {job=2,sex=1,id=5190,}, --女法师
                    {job=3,sex=0,id=5190,}, --男道士 
                    {job=3,sex=1,id=5190,}, --女道士
                },
                NeedSoulValue = 4990, --所需神魂值
            },
            --20级
            {
                 effectIds = {4},SrcItem =  
                {
                    5190,
                },
                --升级后的神器id
                DestItem = 
                { 
                    {job=1,sex=0,id=5191,}, --男战士 
                    {job=1,sex=1,id=5191,}, --女战士
                    {job=2,sex=0,id=5191,}, --男法师 
                    {job=2,sex=1,id=5191,}, --女法师
                    {job=3,sex=0,id=5191,}, --男道士 
                    {job=3,sex=1,id=5191,}, --女道士
                },
                NeedSoulValue = 5450, --所需神魂值
            },
            --21级
            {
                 effectIds = {5},SrcItem =  
                {
                    5191,
                },
                --升级后的神器id
                DestItem = 
                { 
                    {job=1,sex=0,id=5192,}, --男战士 
                    {job=1,sex=1,id=5192,}, --女战士
                    {job=2,sex=0,id=5192,}, --男法师 
                    {job=2,sex=1,id=5192,}, --女法师
                    {job=3,sex=0,id=5192,}, --男道士 
                    {job=3,sex=1,id=5192,}, --女道士
                },
                NeedSoulValue = 5930, --所需神魂值
            },
            --22级
            {
                 effectIds = {5},SrcItem =  
                {
                    5192,
                },
                --升级后的神器id
                DestItem = 
                { 
                    {job=1,sex=0,id=5193,}, --男战士 
                    {job=1,sex=1,id=5193,}, --女战士
                    {job=2,sex=0,id=5193,}, --男法师 
                    {job=2,sex=1,id=5193,}, --女法师
                    {job=3,sex=0,id=5193,}, --男道士 
                    {job=3,sex=1,id=5193,}, --女道士
                },
                NeedSoulValue = 6430, --所需神魂值
            },
            --23级
            {
                 effectIds = {5},SrcItem =  
                {
                    5193,
                },
                --升级后的神器id
                DestItem = 
                { 
                    {job=1,sex=0,id=5194,}, --男战士 
                    {job=1,sex=1,id=5194,}, --女战士
                    {job=2,sex=0,id=5194,}, --男法师 
                    {job=2,sex=1,id=5194,}, --女法师
                    {job=3,sex=0,id=5194,}, --男道士 
                    {job=3,sex=1,id=5194,}, --女道士
                },
                NeedSoulValue = 6950, --所需神魂值
            },
            --24级
            {
                 effectIds = {5},SrcItem =  
                {
                    5194,
                },
                --升级后的神器id
                DestItem = 
                { 
                    {job=1,sex=0,id=5195,}, --男战士 
                    {job=1,sex=1,id=5195,}, --女战士
                    {job=2,sex=0,id=5195,}, --男法师 
                    {job=2,sex=1,id=5195,}, --女法师
                    {job=3,sex=0,id=5195,}, --男道士 
                    {job=3,sex=1,id=5195,}, --女道士
                },
                NeedSoulValue = 7490, --所需神魂值
            },
            --25级
            {
                 effectIds = {5},SrcItem =  
                {
                    5195,
                },
                --升级后的神器id
                DestItem = 
                { 
                    {job=1,sex=0,id=5196,}, --男战士 
                    {job=1,sex=1,id=5196,}, --女战士
                    {job=2,sex=0,id=5196,}, --男法师 
                    {job=2,sex=1,id=5196,}, --女法师
                    {job=3,sex=0,id=5196,}, --男道士 
                    {job=3,sex=1,id=5196,}, --女道士
                },
                NeedSoulValue = 8050, --所需神魂值
            },
            --26级
            {
                 effectIds = {5},SrcItem =  
                {
                    5196,
                },
                --升级后的神器id
                DestItem = 
                { 
                    {job=1,sex=0,id=5197,}, --男战士 
                    {job=1,sex=1,id=5197,}, --女战士
                    {job=2,sex=0,id=5197,}, --男法师 
                    {job=2,sex=1,id=5197,}, --女法师
                    {job=3,sex=0,id=5197,}, --男道士 
                    {job=3,sex=1,id=5197,}, --女道士
                },
                NeedSoulValue = 8630, --所需神魂值
            },
            --27级
            {
                 effectIds = {5},SrcItem =  
                {
                    5197,
                },
                --升级后的神器id
                DestItem = 
                { 
                    {job=1,sex=0,id=5198,}, --男战士 
                    {job=1,sex=1,id=5198,}, --女战士
                    {job=2,sex=0,id=5198,}, --男法师 
                    {job=2,sex=1,id=5198,}, --女法师
                    {job=3,sex=0,id=5198,}, --男道士 
                    {job=3,sex=1,id=5198,}, --女道士
                },
                NeedSoulValue = 9230, --所需神魂值
            },
            --28级
            {
                 effectIds = {5},SrcItem =  
                {
                    5198,
                },
                --升级后的神器id
                DestItem = 
                { 
                    {job=1,sex=0,id=5199,}, --男战士 
                    {job=1,sex=1,id=5199,}, --女战士
                    {job=2,sex=0,id=5199,}, --男法师 
                    {job=2,sex=1,id=5199,}, --女法师
                    {job=3,sex=0,id=5199,}, --男道士 
                    {job=3,sex=1,id=5199,}, --女道士
                },
                NeedSoulValue = 9850, --所需神魂值
            },
            --29级
            {
                 effectIds = {5},SrcItem =  
                {
                    5199,                
                },
                --升级后的神器id
                DestItem = 
                { 
                    {job=1,sex=0,id=5200,}, --男战士 
                    {job=1,sex=1,id=5200,}, --女战士
                    {job=2,sex=0,id=5200,}, --男法师 
                    {job=2,sex=1,id=5200,}, --女法师
                    {job=3,sex=0,id=5200,}, --男道士 
                    {job=3,sex=1,id=5200,}, --女道士
                },
                NeedSoulValue = 10490, --所需神魂值
            },
            --30级
            {
                 effectIds = {5},SrcItem =  
                {
                    5200,
                },
                --升级后的神器id
                DestItem = 
                { 
                    {job=1,sex=0,id=5201,}, --男战士 
                    {job=1,sex=1,id=5201,}, --女战士
                    {job=2,sex=0,id=5201,}, --男法师 
                    {job=2,sex=1,id=5201,}, --女法师
                    {job=3,sex=0,id=5201,}, --男道士 
                    {job=3,sex=1,id=5201,}, --女道士
                },
                NeedSoulValue = 11150, --所需神魂值
            },
            --31级
            {
                 effectIds = {8},SrcItem =  
                {
                    5201,
                },
                --升级后的神器id
                DestItem = 
                { 
                    {job=1,sex=0,id=5202,}, --男战士 
                    {job=1,sex=1,id=5202,}, --女战士
                    {job=2,sex=0,id=5202,}, --男法师 
                    {job=2,sex=1,id=5202,}, --女法师
                    {job=3,sex=0,id=5202,}, --男道士 
                    {job=3,sex=1,id=5202,}, --女道士
                },
                NeedSoulValue = 11830, --所需神魂值
            },
            --32级
            {
                 effectIds = {8},SrcItem =  
                {
                    5202,
                },
                --升级后的神器id
                DestItem = 
                { 
                    {job=1,sex=0,id=5203,}, --男战士 
                    {job=1,sex=1,id=5203,}, --女战士
                    {job=2,sex=0,id=5203,}, --男法师 
                    {job=2,sex=1,id=5203,}, --女法师
                    {job=3,sex=0,id=5203,}, --男道士 
                    {job=3,sex=1,id=5203,}, --女道士
                },
                NeedSoulValue = 12530, --所需神魂值
            },
            --33级
            {
                 effectIds = {8},SrcItem =  
                {
                    5203,
                },
                --升级后的神器id
                DestItem = 
                { 
                    {job=1,sex=0,id=5204,}, --男战士 
                    {job=1,sex=1,id=5204,}, --女战士
                    {job=2,sex=0,id=5204,}, --男法师 
                    {job=2,sex=1,id=5204,}, --女法师
                    {job=3,sex=0,id=5204,}, --男道士 
                    {job=3,sex=1,id=5204,}, --女道士
                },
                NeedSoulValue = 13250, --所需神魂值
            },
            --34级
            {
                 effectIds = {8},SrcItem =  
                {
                    5204,
                },
                --升级后的神器id
                DestItem = 
                { 
                    {job=1,sex=0,id=5205,}, --男战士 
                    {job=1,sex=1,id=5205,}, --女战士
                    {job=2,sex=0,id=5205,}, --男法师 
                    {job=2,sex=1,id=5205,}, --女法师
                    {job=3,sex=0,id=5205,}, --男道士 
                    {job=3,sex=1,id=5205,}, --女道士
                },
                NeedSoulValue = 13990, --所需神魂值
            },
            --35级
            {
                 effectIds = {8},SrcItem =  
                {
                    5205,
                },
                --升级后的神器id
                DestItem = 
                { 
                    {job=1,sex=0,id=5206,}, --男战士 
                    {job=1,sex=1,id=5206,}, --女战士
                    {job=2,sex=0,id=5206,}, --男法师 
                    {job=2,sex=1,id=5206,}, --女法师
                    {job=3,sex=0,id=5206,}, --男道士 
                    {job=3,sex=1,id=5206,}, --女道士
                },
                NeedSoulValue = 14750, --所需神魂值
            },
            --36级
            {
                 effectIds = {8},SrcItem =  
                {
                    5206,
                },
                --升级后的神器id
                DestItem = 
                { 
                    {job=1,sex=0,id=5207,}, --男战士 
                    {job=1,sex=1,id=5207,}, --女战士
                    {job=2,sex=0,id=5207,}, --男法师 
                    {job=2,sex=1,id=5207,}, --女法师
                    {job=3,sex=0,id=5207,}, --男道士 
                    {job=3,sex=1,id=5207,}, --女道士
                },
                NeedSoulValue = 15530, --所需神魂值
            },
            --37级
            {
                 effectIds = {8},SrcItem =  
                {
                    5207,
                },
                --升级后的神器id
                DestItem = 
                { 
                    {job=1,sex=0,id=5208,}, --男战士 
                    {job=1,sex=1,id=5208,}, --女战士
                    {job=2,sex=0,id=5208,}, --男法师 
                    {job=2,sex=1,id=5208,}, --女法师
                    {job=3,sex=0,id=5208,}, --男道士 
                    {job=3,sex=1,id=5208,}, --女道士
                },
                NeedSoulValue = 16330, --所需神魂值
            },
            --38级
            {
                 effectIds = {8},SrcItem =  
                {
                    5208,
                },
                --升级后的神器id
                DestItem = 
                { 
                    {job=1,sex=0,id=5209,}, --男战士 
                    {job=1,sex=1,id=5209,}, --女战士
                    {job=2,sex=0,id=5209,}, --男法师 
                    {job=2,sex=1,id=5209,}, --女法师
                    {job=3,sex=0,id=5209,}, --男道士 
                    {job=3,sex=1,id=5209,}, --女道士
                },
                NeedSoulValue = 17150, --所需神魂值
            },
            --39级
            {
                 effectIds = {8},SrcItem =  
                {
                    5209,
                },
                --升级后的神器id
                DestItem = 
                { 
                    {job=1,sex=0,id=5210,}, --男战士 
                    {job=1,sex=1,id=5210,}, --女战士
                    {job=2,sex=0,id=5210,}, --男法师 
                    {job=2,sex=1,id=5210,}, --女法师
                    {job=3,sex=0,id=5210,}, --男道士 
                    {job=3,sex=1,id=5210,}, --女道士
                },
                NeedSoulValue = 17990, --所需神魂值
            },
            --40级
            {
                 effectIds = {8},SrcItem =  
                {
                    5210,
                },
                --升级后的神器id
                DestItem = 
                { 
                    {job=1,sex=0,id=5211,}, --男战士 
                    {job=1,sex=1,id=5211,}, --女战士
                    {job=2,sex=0,id=5211,}, --男法师 
                    {job=2,sex=1,id=5211,}, --女法师
                    {job=3,sex=0,id=5211,}, --男道士 
                    {job=3,sex=1,id=5211,}, --女道士
                },
                NeedSoulValue = 18850, --所需神魂值
            },
            --41级
            {
                 effectIds = {9},SrcItem =  
                {
                    5211,
                },
                --升级后的神器id
                DestItem = 
                { 
                    {job=1,sex=0,id=5212,}, --男战士 
                    {job=1,sex=1,id=5212,}, --女战士
                    {job=2,sex=0,id=5212,}, --男法师 
                    {job=2,sex=1,id=5212,}, --女法师
                    {job=3,sex=0,id=5212,}, --男道士 
                    {job=3,sex=1,id=5212,}, --女道士
                },
                NeedSoulValue = 19730, --所需神魂值
            },
            --42级
            {
                 effectIds = {9},SrcItem =  
                {
                    5212,
                },

                --升级后的神器id
                DestItem = 
                { 
                    {job=1,sex=0,id=5213,}, --男战士 
                    {job=1,sex=1,id=5213,}, --女战士
                    {job=2,sex=0,id=5213,}, --男法师 
                    {job=2,sex=1,id=5213,}, --女法师
                    {job=3,sex=0,id=5213,}, --男道士 
                    {job=3,sex=1,id=5213,}, --女道士
                },
                NeedSoulValue = 20630, --所需神魂值
            },
            --43级
            {
                 effectIds = {9},SrcItem =  
                {
                    5213,
                },
                --升级后的神器id
                DestItem = 
                { 
                    {job=1,sex=0,id=5214,}, --男战士 
                    {job=1,sex=1,id=5214,}, --女战士
                    {job=2,sex=0,id=5214,}, --男法师 
                    {job=2,sex=1,id=5214,}, --女法师
                    {job=3,sex=0,id=5214,}, --男道士 
                    {job=3,sex=1,id=5214,}, --女道士
                },
                NeedSoulValue = 21550, --所需神魂值
            },
            --44级
            {
                 effectIds = {9},SrcItem =  
                {
                    5214,
                },
                --升级后的神器id
                DestItem = 
                { 
                    {job=1,sex=0,id=5215,}, --男战士 
                    {job=1,sex=1,id=5215,}, --女战士
                    {job=2,sex=0,id=5215,}, --男法师 
                    {job=2,sex=1,id=5215,}, --女法师
                    {job=3,sex=0,id=5215,}, --男道士 
                    {job=3,sex=1,id=5215,}, --女道士
                },
                NeedSoulValue = 22490, --所需神魂值
            },
            --45级
            {
                 effectIds = {9},SrcItem =  
                {
                    5215,
                },
                --升级后的神器id
                DestItem = 
                { 
                    {job=1,sex=0,id=5216,}, --男战士 
                    {job=1,sex=1,id=5216,}, --女战士
                    {job=2,sex=0,id=5216,}, --男法师 
                    {job=2,sex=1,id=5216,}, --女法师
                    {job=3,sex=0,id=5216,}, --男道士 
                    {job=3,sex=1,id=5216,}, --女道士
                },
                NeedSoulValue = 23450, --所需神魂值
            },
            --46级
            {
                 effectIds = {9},SrcItem =  
                {
                    5216,
                },
                --升级后的神器id
                DestItem = 
                { 
                    {job=1,sex=0,id=5217,}, --男战士 
                    {job=1,sex=1,id=5217,}, --女战士
                    {job=2,sex=0,id=5217,}, --男法师 
                    {job=2,sex=1,id=5217,}, --女法师
                    {job=3,sex=0,id=5217,}, --男道士 
                    {job=3,sex=1,id=5217,}, --女道士
                },
                NeedSoulValue = 24430, --所需神魂值
            },
            --47级
            {
                 effectIds = {9},SrcItem =  
                {
                    5217,
                },
                --升级后的神器id
                DestItem = 
                { 
                    {job=1,sex=0,id=5218,}, --男战士 
                    {job=1,sex=1,id=5218,}, --女战士
                    {job=2,sex=0,id=5218,}, --男法师 
                    {job=2,sex=1,id=5218,}, --女法师
                    {job=3,sex=0,id=5218,}, --男道士 
                    {job=3,sex=1,id=5218,}, --女道士
                },
                NeedSoulValue = 25430, --所需神魂值
            },
            --48级
            {
                 effectIds = {9},SrcItem =  
                {
                    5218,
                },
                --升级后的神器id
                DestItem = 
                { 
                    {job=1,sex=0,id=5219,}, --男战士 
                    {job=1,sex=1,id=5219,}, --女战士
                    {job=2,sex=0,id=5219,}, --男法师 
                    {job=2,sex=1,id=5219,}, --女法师
                    {job=3,sex=0,id=5219,}, --男道士 
                    {job=3,sex=1,id=5219,}, --女道士
                },
                NeedSoulValue = 26450, --所需神魂值
            },
            --49级
            {
                 effectIds = {9},SrcItem =  
                {
                    5219,
                },
                --升级后的神器id
                DestItem = 
                { 
                    {job=1,sex=0,id=5220,}, --男战士 
                    {job=1,sex=1,id=5220,}, --女战士
                    {job=2,sex=0,id=5220,}, --男法师 
                    {job=2,sex=1,id=5220,}, --女法师
                    {job=3,sex=0,id=5220,}, --男道士 
                    {job=3,sex=1,id=5220,}, --女道士
                },
                NeedSoulValue = 27490, --所需神魂值
            },
            --50级
            {
                 effectIds = {9},SrcItem =  
                {
                    5220,
                },
                --升级后的神器id
                DestItem = 
                { 
                    {job=1,sex=0,id=5221,}, --男战士 
                    {job=1,sex=1,id=5221,}, --女战士
                    {job=2,sex=0,id=5221,}, --男法师 
                    {job=2,sex=1,id=5221,}, --女法师
                    {job=3,sex=0,id=5221,}, --男道士 
                    {job=3,sex=1,id=5221,}, --女道士
                },
                NeedSoulValue = 28550, --所需神魂值
            },

            --50级
            {
                 effectIds = {9},SrcItem =  
                {
                    5221,
                },
                --升级后的神器id
                DestItem = 
                { 
                    
                },
                NeedSoulValue = 0, --所需神魂值
            },
       },
        --首充神甲升级
       GodDress =
       {
            --2级
            {
                 effectIds = {2,2},SrcItem =  
                {
                    5222,5272,
                },
                --升级后的神甲id
                DestItem = 
                { 
                    {job=1,sex=0,id=5223,}, --男战士 
                    {job=1,sex=1,id=5273,}, --女战士
                    {job=2,sex=0,id=5223,}, --男法师 
                    {job=2,sex=1,id=5273,}, --女法师
                    {job=3,sex=0,id=5223,}, --男道士 
                    {job=3,sex=1,id=5273,}, --女道士
                },
                NeedSoulValue = 280, --所需神魂值
            },
           --3级
            {
                 effectIds = {2,2},SrcItem =  
                {
                    5223,5273,
                },
                --升级后的神甲id
                DestItem = 
                { 
                    {job=1,sex=0,id=5224,}, --男战士 
                    {job=1,sex=1,id=5274,}, --女战士
                    {job=2,sex=0,id=5224,}, --男法师 
                    {job=2,sex=1,id=5274,}, --女法师
                    {job=3,sex=0,id=5224,}, --男道士 
                    {job=3,sex=1,id=5274,}, --女道士
                },
                NeedSoulValue = 380, --所需神魂值
            },
           --4级
            {
                 effectIds = {2,2},SrcItem =  
                {
                    5224,5274,
                },
                --升级后的神甲id
                DestItem = 
                { 
                    {job=1,sex=0,id=5225,}, --男战士 
                    {job=1,sex=1,id=5275,}, --女战士
                    {job=2,sex=0,id=5225,}, --男法师 
                    {job=2,sex=1,id=5275,}, --女法师
                    {job=3,sex=0,id=5225,}, --男道士 
                    {job=3,sex=1,id=5275,}, --女道士
                },
                NeedSoulValue = 500, --所需神魂值
            },
           --5级
            {
                 effectIds = {2,2},SrcItem =  
                {
                    5225,5275,
                },
                --升级后的神甲id
                DestItem = 
                { 
                    {job=1,sex=0,id=5226,}, --男战士 
                    {job=1,sex=1,id=5276,}, --女战士
                    {job=2,sex=0,id=5226,}, --男法师 
                    {job=2,sex=1,id=5276,}, --女法师
                    {job=3,sex=0,id=5226,}, --男道士 
                    {job=3,sex=1,id=5276,}, --女道士
                },
                NeedSoulValue = 650, --所需神魂值
            },
           --6级
            {
                 effectIds = {2,2},SrcItem =  
                {
                    5226,5276,
                },
                --升级后的神甲id
                DestItem = 
                { 
                    {job=1,sex=0,id=5227,}, --男战士 
                    {job=1,sex=1,id=5277,}, --女战士
                    {job=2,sex=0,id=5227,}, --男法师 
                    {job=2,sex=1,id=5277,}, --女法师
                    {job=3,sex=0,id=5227,}, --男道士 
                    {job=3,sex=1,id=5277,}, --女道士
                },
                NeedSoulValue = 830, --所需神魂值
            },
           --7级
            {
                 effectIds = {2,2},SrcItem =  
                {
                    5227,5277,
                },
                --升级后的神甲id
                DestItem = 
                { 
                    {job=1,sex=0,id=5228,}, --男战士 
                    {job=1,sex=1,id=5278,}, --女战士
                    {job=2,sex=0,id=5228,}, --男法师 
                    {job=2,sex=1,id=5278,}, --女法师
                    {job=3,sex=0,id=5228,}, --男道士 
                    {job=3,sex=1,id=5278,}, --女道士
                },
                NeedSoulValue = 1030, --所需神魂值
            },
           --8级
            {
                 effectIds = {2,2},SrcItem =  
                {
                    5228,5278,
                },
                --升级后的神甲id
                DestItem = 
                { 
                    {job=1,sex=0,id=5229,}, --男战士 
                    {job=1,sex=1,id=5279,}, --女战士
                    {job=2,sex=0,id=5229,}, --男法师 
                    {job=2,sex=1,id=5279,}, --女法师
                    {job=3,sex=0,id=5229,}, --男道士 
                    {job=3,sex=1,id=5279,}, --女道士
                },
                NeedSoulValue = 1250, --所需神魂值
            },
           --9级
            {
                 effectIds = {2,2},SrcItem =  
                {
                    5229,5279,
                },
                --升级后的神甲id
                DestItem = 
                { 
                    {job=1,sex=0,id=5230,}, --男战士 
                    {job=1,sex=1,id=5280,}, --女战士
                    {job=2,sex=0,id=5230,}, --男法师 
                    {job=2,sex=1,id=5280,}, --女法师
                    {job=3,sex=0,id=5230,}, --男道士 
                    {job=3,sex=1,id=5280,}, --女道士
                },
                NeedSoulValue = 1490, --所需神魂值
            },
           --10级
            {
                 effectIds = {2,2},SrcItem =  
                {
                    5230,5280,
                },
                --升级后的神甲id
                DestItem = 
                { 
                    {job=1,sex=0,id=5231,}, --男战士 
                    {job=1,sex=1,id=5281,}, --女战士
                    {job=2,sex=0,id=5231,}, --男法师 
                    {job=2,sex=1,id=5281,}, --女法师
                    {job=3,sex=0,id=5231,}, --男道士 
                    {job=3,sex=1,id=5281,}, --女道士
                },
                NeedSoulValue = 1750, --所需神魂值
            },
           --11级
            {
                 effectIds = {7,7},SrcItem =  
                {
                    5231,5281,
                },
                --升级后的神甲id
                DestItem = 
                { 
                    {job=1,sex=0,id=5232,}, --男战士 
                    {job=1,sex=1,id=5282,}, --女战士
                    {job=2,sex=0,id=5232,}, --男法师 
                    {job=2,sex=1,id=5282,}, --女法师
                    {job=3,sex=0,id=5232,}, --男道士 
                    {job=3,sex=1,id=5282,}, --女道士
                },
                NeedSoulValue = 2030, --所需神魂值
            },
           --12级
            {
                 effectIds = {7,7},SrcItem =  
                {
                    5232,5282,
                },
                --升级后的神甲id
                DestItem = 
                { 
                    {job=1,sex=0,id=5233,}, --男战士 
                    {job=1,sex=1,id=5283,}, --女战士
                    {job=2,sex=0,id=5233,}, --男法师 
                    {job=2,sex=1,id=5283,}, --女法师
                    {job=3,sex=0,id=5233,}, --男道士 
                    {job=3,sex=1,id=5283,}, --女道士
                },
                NeedSoulValue = 2330, --所需神魂值
            },
           --13级
            {
                 effectIds = {7,7},SrcItem =  
                {
                    5233,5283,
                },
                --升级后的神甲id
                DestItem = 
                { 
                    {job=1,sex=0,id=5234,}, --男战士 
                    {job=1,sex=1,id=5284,}, --女战士
                    {job=2,sex=0,id=5234,}, --男法师 
                    {job=2,sex=1,id=5284,}, --女法师
                    {job=3,sex=0,id=5234,}, --男道士 
                    {job=3,sex=1,id=5284,}, --女道士
                },
                NeedSoulValue = 2650, --所需神魂值
            },
           --14级
            {
                 effectIds = {7,7},SrcItem =  
                {
                    5234,5284,
                },
                --升级后的神甲id
                DestItem = 
                { 
                    {job=1,sex=0,id=5235,}, --男战士 
                    {job=1,sex=1,id=5285,}, --女战士
                    {job=2,sex=0,id=5235,}, --男法师 
                    {job=2,sex=1,id=5285,}, --女法师
                    {job=3,sex=0,id=5235,}, --男道士 
                    {job=3,sex=1,id=5285,}, --女道士
                },
                NeedSoulValue = 2990, --所需神魂值
            },
           --15级
            {
                 effectIds = {7,7},SrcItem =  
                {
                    5235,5285,
                },
                --升级后的神甲id
                DestItem = 
                { 
                    {job=1,sex=0,id=5236,}, --男战士 
                    {job=1,sex=1,id=5286,}, --女战士
                    {job=2,sex=0,id=5236,}, --男法师 
                    {job=2,sex=1,id=5286,}, --女法师
                    {job=3,sex=0,id=5236,}, --男道士 
                    {job=3,sex=1,id=5286,}, --女道士
                },
                NeedSoulValue = 3350, --所需神魂值
            },
           --16级
            {
                 effectIds = {7,7},SrcItem =  
                {
                    5236,5286,
                },
                --升级后的神甲id
                DestItem = 
                { 
                    {job=1,sex=0,id=5237,}, --男战士 
                    {job=1,sex=1,id=5287,}, --女战士
                    {job=2,sex=0,id=5237,}, --男法师 
                    {job=2,sex=1,id=5287,}, --女法师
                    {job=3,sex=0,id=5237,}, --男道士 
                    {job=3,sex=1,id=5287,}, --女道士
                },
                NeedSoulValue = 3730, --所需神魂值
            },
           --17级
            {
                 effectIds = {7,7},SrcItem =  
                {
                    5237,5287,
                },
                --升级后的神甲id
                DestItem = 
                { 
                    {job=1,sex=0,id=5238,}, --男战士 
                    {job=1,sex=1,id=5288,}, --女战士
                    {job=2,sex=0,id=5238,}, --男法师 
                    {job=2,sex=1,id=5288,}, --女法师
                    {job=3,sex=0,id=5238,}, --男道士 
                    {job=3,sex=1,id=5288,}, --女道士
                },
                NeedSoulValue = 4130, --所需神魂值
            },
           --18级
            {
                 effectIds = {7,7},SrcItem =  
                {
                    5238,5288,
                },
                --升级后的神甲id
                DestItem = 
                { 
                    {job=1,sex=0,id=5239,}, --男战士 
                    {job=1,sex=1,id=5289,}, --女战士
                    {job=2,sex=0,id=5239,}, --男法师 
                    {job=2,sex=1,id=5289,}, --女法师
                    {job=3,sex=0,id=5239,}, --男道士 
                    {job=3,sex=1,id=5289,}, --女道士
                },
                NeedSoulValue = 4550, --所需神魂值
            },
           --19级
            {
                 effectIds = {7,7},SrcItem =  
                {
                    5239,5289,
                },
                --升级后的神甲id
                DestItem = 
                { 
                    {job=1,sex=0,id=5240,}, --男战士 
                    {job=1,sex=1,id=5290,}, --女战士
                    {job=2,sex=0,id=5240,}, --男法师 
                    {job=2,sex=1,id=5290,}, --女法师
                    {job=3,sex=0,id=5240,}, --男道士 
                    {job=3,sex=1,id=5290,}, --女道士
                },
                NeedSoulValue = 4990, --所需神魂值
            },
           --20级
            {
                 effectIds = {7,7},SrcItem =  
                {
                    5240,5290,
                },
                --升级后的神甲id
                DestItem = 
                { 
                    {job=1,sex=0,id=5241,}, --男战士 
                    {job=1,sex=1,id=5291,}, --女战士
                    {job=2,sex=0,id=5241,}, --男法师 
                    {job=2,sex=1,id=5291,}, --女法师
                    {job=3,sex=0,id=5241,}, --男道士 
                    {job=3,sex=1,id=5291,}, --女道士
                },
                NeedSoulValue = 5450, --所需神魂值
            },
           --21级
            {
                 effectIds = {6,6},SrcItem =  
                {
                    5241,5291,
                },
                --升级后的神甲id
                DestItem = 
                { 
                    {job=1,sex=0,id=5242,}, --男战士 
                    {job=1,sex=1,id=5292,}, --女战士
                    {job=2,sex=0,id=5242,}, --男法师 
                    {job=2,sex=1,id=5292,}, --女法师
                    {job=3,sex=0,id=5242,}, --男道士 
                    {job=3,sex=1,id=5292,}, --女道士
                },
                NeedSoulValue = 5930, --所需神魂值
            },
           --22级
            {
                 effectIds = {6,6},SrcItem = 
                {
                    5242,5292,
                },
                --升级后的神甲id
                DestItem = 
                { 
                    {job=1,sex=0,id=5243,}, --男战士 
                    {job=1,sex=1,id=5293,}, --女战士
                    {job=2,sex=0,id=5243,}, --男法师 
                    {job=2,sex=1,id=5293,}, --女法师
                    {job=3,sex=0,id=5243,}, --男道士 
                    {job=3,sex=1,id=5293,}, --女道士
                },
                NeedSoulValue = 6430, --所需神魂值
            },
           --23级
            {
                effectIds = {6,6},SrcItem =  
                {
                    5243,5293,
                },
                --升级后的神甲id
                DestItem = 
                { 
                    {job=1,sex=0,id=5244,}, --男战士 
                    {job=1,sex=1,id=5294,}, --女战士
                    {job=2,sex=0,id=5244,}, --男法师 
                    {job=2,sex=1,id=5294,}, --女法师
                    {job=3,sex=0,id=5244,}, --男道士 
                    {job=3,sex=1,id=5294,}, --女道士
                },
                NeedSoulValue = 6950, --所需神魂值
            },
           --24级
            {
                 effectIds = {6,6},SrcItem =  
                {
                    5244,5294,
                },
                --升级后的神甲id
                DestItem = 
                { 
                    {job=1,sex=0,id=5245,}, --男战士 
                    {job=1,sex=1,id=5295,}, --女战士
                    {job=2,sex=0,id=5245,}, --男法师 
                    {job=2,sex=1,id=5295,}, --女法师
                    {job=3,sex=0,id=5245,}, --男道士 
                    {job=3,sex=1,id=5295,}, --女道士
                },
                NeedSoulValue = 7490, --所需神魂值
            },
           --25级
            {
                 effectIds = {6,6},SrcItem = 
                {
                    5245,5295,
                },
                --升级后的神甲id
                DestItem = 
                { 
                    {job=1,sex=0,id=5246,}, --男战士 
                    {job=1,sex=1,id=5296,}, --女战士
                    {job=2,sex=0,id=5246,}, --男法师 
                    {job=2,sex=1,id=5296,}, --女法师
                    {job=3,sex=0,id=5246,}, --男道士 
                    {job=3,sex=1,id=5296,}, --女道士
                },
                NeedSoulValue = 8050, --所需神魂值
            },
           --26级
            {
                 effectIds = {6,6},SrcItem =  
                {
                    5246,5296,
                },
                --升级后的神甲id
                DestItem = 
                { 
                    {job=1,sex=0,id=5247,}, --男战士 
                    {job=1,sex=1,id=5297,}, --女战士
                    {job=2,sex=0,id=5247,}, --男法师 
                    {job=2,sex=1,id=5297,}, --女法师
                    {job=3,sex=0,id=5247,}, --男道士 
                    {job=3,sex=1,id=5297,}, --女道士
                },
                NeedSoulValue = 8630, --所需神魂值
            },
           --27级
            {
                 effectIds = {6,6},SrcItem =  
                {
                    5247,5297,
                },
                --升级后的神甲id
                DestItem = 
                { 
                    {job=1,sex=0,id=5248,}, --男战士 
                    {job=1,sex=1,id=5298,}, --女战士
                    {job=2,sex=0,id=5248,}, --男法师 
                    {job=2,sex=1,id=5298,}, --女法师
                    {job=3,sex=0,id=5248,}, --男道士 
                    {job=3,sex=1,id=5298,}, --女道士
                },
                NeedSoulValue = 9230, --所需神魂值
            },
           --28级
            {
                effectIds = {6,6},SrcItem =  
                {
                    5248,5298,
                },
                --升级后的神甲id
                DestItem = 
                { 
                    {job=1,sex=0,id=5249,}, --男战士 
                    {job=1,sex=1,id=5299,}, --女战士
                    {job=2,sex=0,id=5249,}, --男法师 
                    {job=2,sex=1,id=5299,}, --女法师
                    {job=3,sex=0,id=5249,}, --男道士 
                    {job=3,sex=1,id=5299,}, --女道士
                },
                NeedSoulValue = 9850, --所需神魂值
            },
           --29级
            {
                 effectIds = {6,6},SrcItem =  
                {
                    5249,5299,
                },
                --升级后的神甲id
                DestItem = 
                { 
                    {job=1,sex=0,id=5250,}, --男战士 
                    {job=1,sex=1,id=5300,}, --女战士
                    {job=2,sex=0,id=5250,}, --男法师 
                    {job=2,sex=1,id=5300,}, --女法师
                    {job=3,sex=0,id=5250,}, --男道士 
                    {job=3,sex=1,id=5300,}, --女道士
                },
                NeedSoulValue = 10490, --所需神魂值
            },
           --30级
            {
                 effectIds = {6,6},SrcItem =   
                {
                    5250,5300,
                },
                --升级后的神甲id
                DestItem = 
                { 
                    {job=1,sex=0,id=5251,}, --男战士 
                    {job=1,sex=1,id=5301,}, --女战士
                    {job=2,sex=0,id=5251,}, --男法师 
                    {job=2,sex=1,id=5301,}, --女法师
                    {job=3,sex=0,id=5251,}, --男道士 
                    {job=3,sex=1,id=5301,}, --女道士
                },
                NeedSoulValue = 11150, --所需神魂值
            },
           --31级
            {
                 effectIds = {10,10},SrcItem =   
                {
                    5251,5301,
                },
                --升级后的神甲id
                DestItem = 
                { 
                    {job=1,sex=0,id=5252,}, --男战士 
                    {job=1,sex=1,id=5302,}, --女战士
                    {job=2,sex=0,id=5252,}, --男法师 
                    {job=2,sex=1,id=5302,}, --女法师
                    {job=3,sex=0,id=5252,}, --男道士 
                    {job=3,sex=1,id=5302,}, --女道士
                },
                NeedSoulValue = 11830, --所需神魂值
            },
           --32级
            {
                effectIds = {10,10},SrcItem =  
                {
                    5252,5302,
                },
                --升级后的神甲id
                DestItem = 
                { 
                    {job=1,sex=0,id=5253,}, --男战士 
                    {job=1,sex=1,id=5303,}, --女战士
                    {job=2,sex=0,id=5253,}, --男法师 
                    {job=2,sex=1,id=5303,}, --女法师
                    {job=3,sex=0,id=5253,}, --男道士 
                    {job=3,sex=1,id=5303,}, --女道士
                },
                NeedSoulValue = 12530, --所需神魂值
            },
           --33级
            {
                 effectIds = {10,10},SrcItem =   
                {
                    5253,5303,
                },
                --升级后的神甲id
                DestItem = 
                { 
                    {job=1,sex=0,id=5254,}, --男战士 
                    {job=1,sex=1,id=5304,}, --女战士
                    {job=2,sex=0,id=5254,}, --男法师 
                    {job=2,sex=1,id=5304,}, --女法师
                    {job=3,sex=0,id=5254,}, --男道士 
                    {job=3,sex=1,id=5304,}, --女道士
                },
                NeedSoulValue = 13250, --所需神魂值
            },
           --34级
            {
                effectIds = {10,10},SrcItem =  
                {
                    5254,5304,
                },
                --升级后的神甲id
                DestItem = 
                { 
                    {job=1,sex=0,id=5255,}, --男战士 
                    {job=1,sex=1,id=5305,}, --女战士
                    {job=2,sex=0,id=5255,}, --男法师 
                    {job=2,sex=1,id=5305,}, --女法师
                    {job=3,sex=0,id=5255,}, --男道士 
                    {job=3,sex=1,id=5305,}, --女道士
                },
                NeedSoulValue = 13990, --所需神魂值
            },
           --35级
            {
                 effectIds = {10,10},SrcItem =  
                {
                    5255,5305,
                },
                --升级后的神甲id
                DestItem = 
                { 
                    {job=1,sex=0,id=5256,}, --男战士 
                    {job=1,sex=1,id=5306,}, --女战士
                    {job=2,sex=0,id=5256,}, --男法师 
                    {job=2,sex=1,id=5306,}, --女法师
                    {job=3,sex=0,id=5256,}, --男道士 
                    {job=3,sex=1,id=5306,}, --女道士
                },
                NeedSoulValue = 14750, --所需神魂值
            },
           --36级
            {
                 effectIds = {10,10},SrcItem =  
                {
                    5256,5306,
                },
                --升级后的神甲id
                DestItem = 
                { 
                    {job=1,sex=0,id=5257,}, --男战士 
                    {job=1,sex=1,id=5307,}, --女战士
                    {job=2,sex=0,id=5257,}, --男法师 
                    {job=2,sex=1,id=5307,}, --女法师
                    {job=3,sex=0,id=5257,}, --男道士 
                    {job=3,sex=1,id=5307,}, --女道士
                },
                NeedSoulValue = 15530, --所需神魂值
            },
           --37级
            {
                 effectIds = {10,10},SrcItem =  
                {
                    5257,5307,
                },
                --升级后的神甲id
                DestItem = 
                { 
                    {job=1,sex=0,id=5258,}, --男战士 
                    {job=1,sex=1,id=5308,}, --女战士
                    {job=2,sex=0,id=5258,}, --男法师 
                    {job=2,sex=1,id=5308,}, --女法师
                    {job=3,sex=0,id=5258,}, --男道士 
                    {job=3,sex=1,id=5308,}, --女道士
                },
                NeedSoulValue = 16330, --所需神魂值
            },
           --38级
            {
                 effectIds = {10,10},SrcItem =   
                {
                    5258,5308,
                },
                --升级后的神甲id
                DestItem = 
                { 
                    {job=1,sex=0,id=5259,}, --男战士 
                    {job=1,sex=1,id=5309,}, --女战士
                    {job=2,sex=0,id=5259,}, --男法师 
                    {job=2,sex=1,id=5309,}, --女法师
                    {job=3,sex=0,id=5259,}, --男道士 
                    {job=3,sex=1,id=5309,}, --女道士
                },
                NeedSoulValue = 17150, --所需神魂值
            },
           --39级
            {
                effectIds = {10,10},SrcItem =   
                {
                    5259,5309,
                },
                --升级后的神甲id
                DestItem = 
                { 
                    {job=1,sex=0,id=5260,}, --男战士 
                    {job=1,sex=1,id=5310,}, --女战士
                    {job=2,sex=0,id=5260,}, --男法师 
                    {job=2,sex=1,id=5310,}, --女法师
                    {job=3,sex=0,id=5260,}, --男道士 
                    {job=3,sex=1,id=5310,}, --女道士
                },
                NeedSoulValue = 17990, --所需神魂值
            },
           --40级
            {
                effectIds = {10,10},SrcItem =  
                {
                    5260,5310,
                },
                --升级后的神甲id
                DestItem = 
                { 
                    {job=1,sex=0,id=5261,}, --男战士 
                    {job=1,sex=1,id=5311,}, --女战士
                    {job=2,sex=0,id=5261,}, --男法师 
                    {job=2,sex=1,id=5311,}, --女法师
                    {job=3,sex=0,id=5261,}, --男道士 
                    {job=3,sex=1,id=5311,}, --女道士
                },
                NeedSoulValue = 18850, --所需神魂值
            },
           --41级
            {
                 effectIds = {11,11},SrcItem =  
                {
                    5261,5311,
                },
                --升级后的神甲id
                DestItem = 
                { 
                    {job=1,sex=0,id=5262,}, --男战士 
                    {job=1,sex=1,id=5312,}, --女战士
                    {job=2,sex=0,id=5262,}, --男法师 
                    {job=2,sex=1,id=5312,}, --女法师
                    {job=3,sex=0,id=5262,}, --男道士 
                    {job=3,sex=1,id=5312,}, --女道士
                },
                NeedSoulValue = 19730, --所需神魂值
            },
           --42级
            {
                 effectIds = {11,11},SrcItem =  
                {
                    5262,5312,
                },
                --升级后的神甲id
                DestItem = 
                { 
                    {job=1,sex=0,id=5263,}, --男战士 
                    {job=1,sex=1,id=5313,}, --女战士
                    {job=2,sex=0,id=5263,}, --男法师 
                    {job=2,sex=1,id=5313,}, --女法师
                    {job=3,sex=0,id=5263,}, --男道士 
                    {job=3,sex=1,id=5313,}, --女道士
                },
                NeedSoulValue = 20630, --所需神魂值
            },
           --43级
            {
                 effectIds = {11,11},SrcItem =  
                {
                    5263,5313,
                },
                --升级后的神甲id
                DestItem = 
                { 
                    {job=1,sex=0,id=5264,}, --男战士 
                    {job=1,sex=1,id=5314,}, --女战士
                    {job=2,sex=0,id=5264,}, --男法师 
                    {job=2,sex=1,id=5314,}, --女法师
                    {job=3,sex=0,id=5264,}, --男道士 
                    {job=3,sex=1,id=5314,}, --女道士
                },
                NeedSoulValue = 21550, --所需神魂值
            },
           --44级
            {
                 effectIds = {11,11},SrcItem =  
                {
                    5264,5314,
                },
                --升级后的神甲id
                DestItem = 
                { 
                    {job=1,sex=0,id=5265,}, --男战士 
                    {job=1,sex=1,id=5315,}, --女战士
                    {job=2,sex=0,id=5265,}, --男法师 
                    {job=2,sex=1,id=5315,}, --女法师
                    {job=3,sex=0,id=5265,}, --男道士 
                    {job=3,sex=1,id=5315,}, --女道士
                },
                NeedSoulValue = 22490, --所需神魂值
            },
           --45级
            {
                effectIds = {11,11},SrcItem =   
                {
                    5265,5315,
                },
                --升级后的神甲id
                DestItem = 
                { 
                    {job=1,sex=0,id=5266,}, --男战士 
                    {job=1,sex=1,id=5316,}, --女战士
                    {job=2,sex=0,id=5266,}, --男法师 
                    {job=2,sex=1,id=5316,}, --女法师
                    {job=3,sex=0,id=5266,}, --男道士 
                    {job=3,sex=1,id=5316,}, --女道士
                },
                NeedSoulValue = 23450, --所需神魂值
            },
           --46级
            {
                 effectIds = {11,11},SrcItem =   
                {
                    5266,5316,
                },
                --升级后的神甲id
                DestItem = 
                { 
                    {job=1,sex=0,id=5267,}, --男战士 
                    {job=1,sex=1,id=5317,}, --女战士
                    {job=2,sex=0,id=5267,}, --男法师 
                    {job=2,sex=1,id=5317,}, --女法师
                    {job=3,sex=0,id=5267,}, --男道士 
                    {job=3,sex=1,id=5317,}, --女道士
                },
                NeedSoulValue = 24430, --所需神魂值
            },
           --47级
            {
                 effectIds = {11,11},SrcItem =   
                {
                    5267,5317,
                },
                --升级后的神甲id
                DestItem = 
                { 
                    {job=1,sex=0,id=5268,}, --男战士 
                    {job=1,sex=1,id=5318,}, --女战士
                    {job=2,sex=0,id=5268,}, --男法师 
                    {job=2,sex=1,id=5318,}, --女法师
                    {job=3,sex=0,id=5268,}, --男道士 
                    {job=3,sex=1,id=5318,}, --女道士
                },
                NeedSoulValue = 25430, --所需神魂值
            },
           --48级
            {
                effectIds = {11,11},SrcItem =  
                {
                    5268,5318,
                },
                --升级后的神甲id
                DestItem = 
                { 
                    {job=1,sex=0,id=5269,}, --男战士 
                    {job=1,sex=1,id=5319,}, --女战士
                    {job=2,sex=0,id=5269,}, --男法师 
                    {job=2,sex=1,id=5319,}, --女法师
                    {job=3,sex=0,id=5269,}, --男道士 
                    {job=3,sex=1,id=5319,}, --女道士
                },
                NeedSoulValue = 26450, --所需神魂值
            },
           --49级
            {
                 effectIds = {11,11},SrcItem =  
                {
                    5269,5319,
                },
                --升级后的神甲id
                DestItem = 
                { 
                    {job=1,sex=0,id=5270,}, --男战士 
                    {job=1,sex=1,id=5320,}, --女战士
                    {job=2,sex=0,id=5270,}, --男法师 
                    {job=2,sex=1,id=5320,}, --女法师
                    {job=3,sex=0,id=5270,}, --男道士 
                    {job=3,sex=1,id=5320,}, --女道士
                },
                NeedSoulValue = 27490, --所需神魂值
            },
           --50级
            {
                 effectIds = {11,11},SrcItem =  
                {
                    5270,5320,
                },
                --升级后的神甲id
                DestItem = 
                { 
                    {job=1,sex=0,id=5271,}, --男战士 
                    {job=1,sex=1,id=5321,}, --女战士
                    {job=2,sex=0,id=5271,}, --男法师 
                    {job=2,sex=1,id=5321,}, --女法师
                    {job=3,sex=0,id=5271,}, --男道士 
                    {job=3,sex=1,id=5321,}, --女道士
                },
                NeedSoulValue = 28550, --所需神魂值
            },
            --50级
            {
                 effectIds = {11,11},SrcItem =  
                {
                    5271,5321,
                },
                --升级后的神甲id
                DestItem = 
                { 
                  
                },
                NeedSoulValue = 0, --所需神魂值
            },
       },
    },

    --兑换
    ExChange =
    {
        {
            Name= "<(c0xFFeed49c)收集1转符文任意3个>",  --兑换名称
            SrcItemId = {3551,3552,3553,3554,3555,3556,3557,3558},         --兑换的道具id
            Count = 3,                --数量
            Value = 100,               --获得的神器值
        },
        -- 
        {
            Name= "<(c0xFFeed49c)收集2转符文任意2个>",
            SrcItemId = {3559,3560,3561,3562,3563,3564,3565,3566},
            Count = 2,
            Value = 120,
        },
        
        {
            Name= "<(c0xFFeed49c)收集3转符文任意2个>",
            SrcItemId = {3567,3568,3569,3570,3571,3572,3573,3574},
            Count = 2,
            Value = 150,
        },        

        {
            Name= "<(c0xFFeed49c)收集4转符文任意1个>",
            SrcItemId = {3575,3576,3577,3578,3579,3580,3581,3582},
            Count = 1,
            Value = 200,
        },
        
        {
            Name= "<(c0xFFeed49c)收集5转符文任意1个>",
            SrcItemId = {3583,3584,3585,3586,3587,3588,3589,3590},
            Count = 1,
            Value = 260,
        },
        
        {
            Name= "<(c0xFFeed49c)收集6转符文任意1个>",
            SrcItemId = {3591,3592,3593,3594,3595,3596,3597,3598},
            Count = 1,
            Value = 380,
        },

        {
            Name= "<(c0xFFeed49c)收集八荒装备任意3件>",
            SrcItemId = {403,404,405,406,407,408,409,410,411},
            Count = 3,
            Value = 30,
        },
        {
            Name= "<(c0xFFeed49c)收集九宫装备任意3件>",
            SrcItemId = {412,413,414,415,416,417,418,419,420},
            Count = 3,
            Value = 60,
        },
        {
            Name= "<(c0xFFeed49c)收集十方装备任意3件>",
            SrcItemId = {421,422,423,424,425,426,427,428,429},
            Count = 3,
            Value = 100,
        },
        {
            Name= "<(c0xFFeed49c)收集1转首饰任意3件>",
            SrcItemId = {433,434,435,436,437,438},
            Count = 3,
            Value = 150,
        },
        {
            Name= "<(c0xFFeed49c)收集2转首饰任意2件>",
            SrcItemId = {442,443,444,445,446,447},
            Count = 2,
            Value = 200,
        },
        {
            Name= "<(c0xFFeed49c)收集3转首饰任意1件>",
            SrcItemId = {451,452,453,454,455,456},
            Count = 1,
            Value = 250,
        },
        
        {
            Name= "<(c0xFFeed49c)收集霸主血刃1件>",
            SrcItemId = {430},
            Count = 1,
            Value = 500,
        },
        {
            Name= "<(c0xFFeed49c)收集霸主血甲(男女)任意1件>",
            SrcItemId = {431,432},
            Count = 1,
            Value = 400,
        },
       
       
        {
            Name= "<(c0xFFeed49c)收集通天神剑1件>",
            SrcItemId = {439},
            Count = 1,
            Value = 1000,
        },
        {
            Name= "<(c0xFFeed49c)收集通天神甲(男女)任意1件>",
            SrcItemId = {440,441},
            Count = 1,
            Value = 800,
        },
      
        {
            Name= "<(c0xFFeed49c)收集毁灭灵斩1件>",
            SrcItemId = {448},
            Count = 1,
            Value = 2000,
        },
        {
            Name= "<(c0xFFeed49c)收集毁灭灵甲(男女)任意1件>",
            SrcItemId = {449,450},
            Count = 1,
            Value = 1500,
        },
       
       
        {
            Name= "<(c0xFFeed49c)收集神甲碎片>",
            SrcItemId = {5170},
            Count = 1,
            Value = 1080,
        },

        {
            Name= "<(c0xFFeed49c)收集书页5张>",
            SrcItemId = {469},
            Count = 5,
            Value = 50,
        },

        {
            Name= "<(c0xFFeed49c)收集九花玉露丸>",
            SrcItemId = {4741},
            Count = 1,
            Value = 200,
        },
    },
}