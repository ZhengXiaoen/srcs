--激情大本营配置文件
ArdourCampCfg =
    {
        ardourcamppoint = 100, --行会资金点达到多少开启激情大本营活动
        mapid = 340, --激情大本营地图id
        initpoint = 50, --初始个人积分
        point = 10, --个人积分
        guildpoint = 10, --行会积分
        secaddexp = 1000, --每秒增加经验
        wudibuffid = 199, --无敌buff的id
        rankname = "ARDOURCAMPRANK", --激情大本营排行榜
        guildrankname = "GUILDARDOURCAMPRANK", --行会排行榜
        givetime = 600, --十分钟后保底奖励
        guildmoney = 100, --奖励的行会资金
        daymaxcount = 2, --每人每天最多捐献点数
        returncity =  --活动结束后传送图标
        {
            mapid = 9,
            x=  135,
            y =164,
        },
        attr =
        {
            --战士
            {
                
                {type = 5, value = 346400, }, --最大hp
                {type = 7, value = 36100, }, --最大mp
                {type = 9, value = 6928, }, --最小物理攻击
                {type = 11, value = 34640, }, --最大物理攻击
                {type = 29, value = 20, }, --准确
            },	

            --法师
            {
                {type = 5, value = 86100, }, --最大hp
                {type = 7, value = 485300, }, --最大mp
                {type = 13, value = 6928, }, --最小魔法攻击
                {type = 15, value = 34640, }, --最大魔法攻击
                {type = 29, value = 20, }, --准确
            },
            
            --道士
            {
                {type = 5, value = 193100, }, --最大hp
                {type = 7, value = 276300, }, --最大mp
                {type = 17, value = 6928, }, --最小道术攻击
                {type = 19, value = 34640, }, --最大道术攻击
                {type = 29, value = 20, }, --准确
            },
        },
        --等级属性
        level =
        {
            -- {   --// (a1) 以下属性都是倍率
            --     {type = 6, value = (a2), }, --HP
            --     {type = 8, value = (a2), }, --MP
            --     {type = 10, value = (a2), }, --最小物理攻击
            --     {type = 12, value = (a2), }, --最大物理攻击
            --     {type = 14, value = (a2), }, --最小魔法攻击
            --     {type = 16, value = (a2), }, --最大魔法攻击
            --     {type = 18, value = (a2), }, --最小道术攻击
            --     {type = 20, value = (a2), }, --最大道术攻击
            -- },
            {   --// 1 以下属性都是倍率
                {type = 6, value = 0.01, }, --HP
                {type = 8, value = 0.01, }, --MP
                {type = 10, value = 0.01, }, --最小物理攻击
                {type = 12, value = 0.01, }, --最大物理攻击
                {type = 14, value = 0.01, }, --最小魔法攻击
                {type = 16, value = 0.01, }, --最大魔法攻击
                {type = 18, value = 0.01, }, --最小道术攻击
                {type = 20, value = 0.01, }, --最大道术攻击
            },
            {   --// 2 以下属性都是倍率
                {type = 6, value = 0.02, }, --HP
                {type = 8, value = 0.02, }, --MP
                {type = 10, value = 0.02, }, --最小物理攻击
                {type = 12, value = 0.02, }, --最大物理攻击
                {type = 14, value = 0.02, }, --最小魔法攻击
                {type = 16, value = 0.02, }, --最大魔法攻击
                {type = 18, value = 0.02, }, --最小道术攻击
                {type = 20, value = 0.02, }, --最大道术攻击
            },
            {   --// 3 以下属性都是倍率
                {type = 6, value = 0.03, }, --HP
                {type = 8, value = 0.03, }, --MP
                {type = 10, value = 0.03, }, --最小物理攻击
                {type = 12, value = 0.03, }, --最大物理攻击
                {type = 14, value = 0.03, }, --最小魔法攻击
                {type = 16, value = 0.03, }, --最大魔法攻击
                {type = 18, value = 0.03, }, --最小道术攻击
                {type = 20, value = 0.03, }, --最大道术攻击
            },
            {   --// 4 以下属性都是倍率
                {type = 6, value = 0.04, }, --HP
                {type = 8, value = 0.04, }, --MP
                {type = 10, value = 0.04, }, --最小物理攻击
                {type = 12, value = 0.04, }, --最大物理攻击
                {type = 14, value = 0.04, }, --最小魔法攻击
                {type = 16, value = 0.04, }, --最大魔法攻击
                {type = 18, value = 0.04, }, --最小道术攻击
                {type = 20, value = 0.04, }, --最大道术攻击
            },
            {   --// 5 以下属性都是倍率
                {type = 6, value = 0.05, }, --HP
                {type = 8, value = 0.05, }, --MP
                {type = 10, value = 0.05, }, --最小物理攻击
                {type = 12, value = 0.05, }, --最大物理攻击
                {type = 14, value = 0.05, }, --最小魔法攻击
                {type = 16, value = 0.05, }, --最大魔法攻击
                {type = 18, value = 0.05, }, --最小道术攻击
                {type = 20, value = 0.05, }, --最大道术攻击
            },
            {   --// 6 以下属性都是倍率
                {type = 6, value = 0.06, }, --HP
                {type = 8, value = 0.06, }, --MP
                {type = 10, value = 0.06, }, --最小物理攻击
                {type = 12, value = 0.06, }, --最大物理攻击
                {type = 14, value = 0.06, }, --最小魔法攻击
                {type = 16, value = 0.06, }, --最大魔法攻击
                {type = 18, value = 0.06, }, --最小道术攻击
                {type = 20, value = 0.06, }, --最大道术攻击
            },
            {   --// 7 以下属性都是倍率
                {type = 6, value = 0.07, }, --HP
                {type = 8, value = 0.07, }, --MP
                {type = 10, value = 0.07, }, --最小物理攻击
                {type = 12, value = 0.07, }, --最大物理攻击
                {type = 14, value = 0.07, }, --最小魔法攻击
                {type = 16, value = 0.07, }, --最大魔法攻击
                {type = 18, value = 0.07, }, --最小道术攻击
                {type = 20, value = 0.07, }, --最大道术攻击
            },
            {   --// 8 以下属性都是倍率
                {type = 6, value = 0.08, }, --HP
                {type = 8, value = 0.08, }, --MP
                {type = 10, value = 0.08, }, --最小物理攻击
                {type = 12, value = 0.08, }, --最大物理攻击
                {type = 14, value = 0.08, }, --最小魔法攻击
                {type = 16, value = 0.08, }, --最大魔法攻击
                {type = 18, value = 0.08, }, --最小道术攻击
                {type = 20, value = 0.08, }, --最大道术攻击
            },
            {   --// 9 以下属性都是倍率
                {type = 6, value = 0.09, }, --HP
                {type = 8, value = 0.09, }, --MP
                {type = 10, value = 0.09, }, --最小物理攻击
                {type = 12, value = 0.09, }, --最大物理攻击
                {type = 14, value = 0.09, }, --最小魔法攻击
                {type = 16, value = 0.09, }, --最大魔法攻击
                {type = 18, value = 0.09, }, --最小道术攻击
                {type = 20, value = 0.09, }, --最大道术攻击
            },
            {   --// 10 以下属性都是倍率
                {type = 6, value = 0.1, }, --HP
                {type = 8, value = 0.1, }, --MP
                {type = 10, value = 0.1, }, --最小物理攻击
                {type = 12, value = 0.1, }, --最大物理攻击
                {type = 14, value = 0.1, }, --最小魔法攻击
                {type = 16, value = 0.1, }, --最大魔法攻击
                {type = 18, value = 0.1, }, --最小道术攻击
                {type = 20, value = 0.1, }, --最大道术攻击
            },
            {   --// 11 以下属性都是倍率
                {type = 6, value = 0.11, }, --HP
                {type = 8, value = 0.11, }, --MP
                {type = 10, value = 0.11, }, --最小物理攻击
                {type = 12, value = 0.11, }, --最大物理攻击
                {type = 14, value = 0.11, }, --最小魔法攻击
                {type = 16, value = 0.11, }, --最大魔法攻击
                {type = 18, value = 0.11, }, --最小道术攻击
                {type = 20, value = 0.11, }, --最大道术攻击
            },
            {   --// 12 以下属性都是倍率
                {type = 6, value = 0.12, }, --HP
                {type = 8, value = 0.12, }, --MP
                {type = 10, value = 0.12, }, --最小物理攻击
                {type = 12, value = 0.12, }, --最大物理攻击
                {type = 14, value = 0.12, }, --最小魔法攻击
                {type = 16, value = 0.12, }, --最大魔法攻击
                {type = 18, value = 0.12, }, --最小道术攻击
                {type = 20, value = 0.12, }, --最大道术攻击
            },
            {   --// 13 以下属性都是倍率
                {type = 6, value = 0.13, }, --HP
                {type = 8, value = 0.13, }, --MP
                {type = 10, value = 0.13, }, --最小物理攻击
                {type = 12, value = 0.13, }, --最大物理攻击
                {type = 14, value = 0.13, }, --最小魔法攻击
                {type = 16, value = 0.13, }, --最大魔法攻击
                {type = 18, value = 0.13, }, --最小道术攻击
                {type = 20, value = 0.13, }, --最大道术攻击
            },
            {   --// 14 以下属性都是倍率
                {type = 6, value = 0.14, }, --HP
                {type = 8, value = 0.14, }, --MP
                {type = 10, value = 0.14, }, --最小物理攻击
                {type = 12, value = 0.14, }, --最大物理攻击
                {type = 14, value = 0.14, }, --最小魔法攻击
                {type = 16, value = 0.14, }, --最大魔法攻击
                {type = 18, value = 0.14, }, --最小道术攻击
                {type = 20, value = 0.14, }, --最大道术攻击
            },
            {   --// 15 以下属性都是倍率
                {type = 6, value = 0.15, }, --HP
                {type = 8, value = 0.15, }, --MP
                {type = 10, value = 0.15, }, --最小物理攻击
                {type = 12, value = 0.15, }, --最大物理攻击
                {type = 14, value = 0.15, }, --最小魔法攻击
                {type = 16, value = 0.15, }, --最大魔法攻击
                {type = 18, value = 0.15, }, --最小道术攻击
                {type = 20, value = 0.15, }, --最大道术攻击
            },
            {   --// 16 以下属性都是倍率
                {type = 6, value = 0.16, }, --HP
                {type = 8, value = 0.16, }, --MP
                {type = 10, value = 0.16, }, --最小物理攻击
                {type = 12, value = 0.16, }, --最大物理攻击
                {type = 14, value = 0.16, }, --最小魔法攻击
                {type = 16, value = 0.16, }, --最大魔法攻击
                {type = 18, value = 0.16, }, --最小道术攻击
                {type = 20, value = 0.16, }, --最大道术攻击
            },
            {   --// 17 以下属性都是倍率
                {type = 6, value = 0.17, }, --HP
                {type = 8, value = 0.17, }, --MP
                {type = 10, value = 0.17, }, --最小物理攻击
                {type = 12, value = 0.17, }, --最大物理攻击
                {type = 14, value = 0.17, }, --最小魔法攻击
                {type = 16, value = 0.17, }, --最大魔法攻击
                {type = 18, value = 0.17, }, --最小道术攻击
                {type = 20, value = 0.17, }, --最大道术攻击
            },
            {   --// 18 以下属性都是倍率
                {type = 6, value = 0.18, }, --HP
                {type = 8, value = 0.18, }, --MP
                {type = 10, value = 0.18, }, --最小物理攻击
                {type = 12, value = 0.18, }, --最大物理攻击
                {type = 14, value = 0.18, }, --最小魔法攻击
                {type = 16, value = 0.18, }, --最大魔法攻击
                {type = 18, value = 0.18, }, --最小道术攻击
                {type = 20, value = 0.18, }, --最大道术攻击
            },
            {   --// 19 以下属性都是倍率
                {type = 6, value = 0.19, }, --HP
                {type = 8, value = 0.19, }, --MP
                {type = 10, value = 0.19, }, --最小物理攻击
                {type = 12, value = 0.19, }, --最大物理攻击
                {type = 14, value = 0.19, }, --最小魔法攻击
                {type = 16, value = 0.19, }, --最大魔法攻击
                {type = 18, value = 0.19, }, --最小道术攻击
                {type = 20, value = 0.19, }, --最大道术攻击
            },
            {   --// 20 以下属性都是倍率
                {type = 6, value = 0.2, }, --HP
                {type = 8, value = 0.2, }, --MP
                {type = 10, value = 0.2, }, --最小物理攻击
                {type = 12, value = 0.2, }, --最大物理攻击
                {type = 14, value = 0.2, }, --最小魔法攻击
                {type = 16, value = 0.2, }, --最大魔法攻击
                {type = 18, value = 0.2, }, --最小道术攻击
                {type = 20, value = 0.2, }, --最大道术攻击
            },
            {   --// 21 以下属性都是倍率
                {type = 6, value = 0.21, }, --HP
                {type = 8, value = 0.21, }, --MP
                {type = 10, value = 0.21, }, --最小物理攻击
                {type = 12, value = 0.21, }, --最大物理攻击
                {type = 14, value = 0.21, }, --最小魔法攻击
                {type = 16, value = 0.21, }, --最大魔法攻击
                {type = 18, value = 0.21, }, --最小道术攻击
                {type = 20, value = 0.21, }, --最大道术攻击
            },
            {   --// 22 以下属性都是倍率
                {type = 6, value = 0.22, }, --HP
                {type = 8, value = 0.22, }, --MP
                {type = 10, value = 0.22, }, --最小物理攻击
                {type = 12, value = 0.22, }, --最大物理攻击
                {type = 14, value = 0.22, }, --最小魔法攻击
                {type = 16, value = 0.22, }, --最大魔法攻击
                {type = 18, value = 0.22, }, --最小道术攻击
                {type = 20, value = 0.22, }, --最大道术攻击
            },
            {   --// 23 以下属性都是倍率
                {type = 6, value = 0.23, }, --HP
                {type = 8, value = 0.23, }, --MP
                {type = 10, value = 0.23, }, --最小物理攻击
                {type = 12, value = 0.23, }, --最大物理攻击
                {type = 14, value = 0.23, }, --最小魔法攻击
                {type = 16, value = 0.23, }, --最大魔法攻击
                {type = 18, value = 0.23, }, --最小道术攻击
                {type = 20, value = 0.23, }, --最大道术攻击
            },
            {   --// 24 以下属性都是倍率
                {type = 6, value = 0.24, }, --HP
                {type = 8, value = 0.24, }, --MP
                {type = 10, value = 0.24, }, --最小物理攻击
                {type = 12, value = 0.24, }, --最大物理攻击
                {type = 14, value = 0.24, }, --最小魔法攻击
                {type = 16, value = 0.24, }, --最大魔法攻击
                {type = 18, value = 0.24, }, --最小道术攻击
                {type = 20, value = 0.24, }, --最大道术攻击
            },
            {   --// 25 以下属性都是倍率
                {type = 6, value = 0.25, }, --HP
                {type = 8, value = 0.25, }, --MP
                {type = 10, value = 0.25, }, --最小物理攻击
                {type = 12, value = 0.25, }, --最大物理攻击
                {type = 14, value = 0.25, }, --最小魔法攻击
                {type = 16, value = 0.25, }, --最大魔法攻击
                {type = 18, value = 0.25, }, --最小道术攻击
                {type = 20, value = 0.25, }, --最大道术攻击
            },
            {   --// 26 以下属性都是倍率
                {type = 6, value = 0.26, }, --HP
                {type = 8, value = 0.26, }, --MP
                {type = 10, value = 0.26, }, --最小物理攻击
                {type = 12, value = 0.26, }, --最大物理攻击
                {type = 14, value = 0.26, }, --最小魔法攻击
                {type = 16, value = 0.26, }, --最大魔法攻击
                {type = 18, value = 0.26, }, --最小道术攻击
                {type = 20, value = 0.26, }, --最大道术攻击
            },
            {   --// 27 以下属性都是倍率
                {type = 6, value = 0.27, }, --HP
                {type = 8, value = 0.27, }, --MP
                {type = 10, value = 0.27, }, --最小物理攻击
                {type = 12, value = 0.27, }, --最大物理攻击
                {type = 14, value = 0.27, }, --最小魔法攻击
                {type = 16, value = 0.27, }, --最大魔法攻击
                {type = 18, value = 0.27, }, --最小道术攻击
                {type = 20, value = 0.27, }, --最大道术攻击
            },
            {   --// 28 以下属性都是倍率
                {type = 6, value = 0.28, }, --HP
                {type = 8, value = 0.28, }, --MP
                {type = 10, value = 0.28, }, --最小物理攻击
                {type = 12, value = 0.28, }, --最大物理攻击
                {type = 14, value = 0.28, }, --最小魔法攻击
                {type = 16, value = 0.28, }, --最大魔法攻击
                {type = 18, value = 0.28, }, --最小道术攻击
                {type = 20, value = 0.28, }, --最大道术攻击
            },
            {   --// 29 以下属性都是倍率
                {type = 6, value = 0.29, }, --HP
                {type = 8, value = 0.29, }, --MP
                {type = 10, value = 0.29, }, --最小物理攻击
                {type = 12, value = 0.29, }, --最大物理攻击
                {type = 14, value = 0.29, }, --最小魔法攻击
                {type = 16, value = 0.29, }, --最大魔法攻击
                {type = 18, value = 0.29, }, --最小道术攻击
                {type = 20, value = 0.29, }, --最大道术攻击
            },
            {   --// 30 以下属性都是倍率
                {type = 6, value = 0.3, }, --HP
                {type = 8, value = 0.3, }, --MP
                {type = 10, value = 0.3, }, --最小物理攻击
                {type = 12, value = 0.3, }, --最大物理攻击
                {type = 14, value = 0.3, }, --最小魔法攻击
                {type = 16, value = 0.3, }, --最大魔法攻击
                {type = 18, value = 0.3, }, --最小道术攻击
                {type = 20, value = 0.3, }, --最大道术攻击
            },
            {   --// 31 以下属性都是倍率
                {type = 6, value = 0.31, }, --HP
                {type = 8, value = 0.31, }, --MP
                {type = 10, value = 0.31, }, --最小物理攻击
                {type = 12, value = 0.31, }, --最大物理攻击
                {type = 14, value = 0.31, }, --最小魔法攻击
                {type = 16, value = 0.31, }, --最大魔法攻击
                {type = 18, value = 0.31, }, --最小道术攻击
                {type = 20, value = 0.31, }, --最大道术攻击
            },
            {   --// 32 以下属性都是倍率
                {type = 6, value = 0.32, }, --HP
                {type = 8, value = 0.32, }, --MP
                {type = 10, value = 0.32, }, --最小物理攻击
                {type = 12, value = 0.32, }, --最大物理攻击
                {type = 14, value = 0.32, }, --最小魔法攻击
                {type = 16, value = 0.32, }, --最大魔法攻击
                {type = 18, value = 0.32, }, --最小道术攻击
                {type = 20, value = 0.32, }, --最大道术攻击
            },
            {   --// 33 以下属性都是倍率
                {type = 6, value = 0.33, }, --HP
                {type = 8, value = 0.33, }, --MP
                {type = 10, value = 0.33, }, --最小物理攻击
                {type = 12, value = 0.33, }, --最大物理攻击
                {type = 14, value = 0.33, }, --最小魔法攻击
                {type = 16, value = 0.33, }, --最大魔法攻击
                {type = 18, value = 0.33, }, --最小道术攻击
                {type = 20, value = 0.33, }, --最大道术攻击
            },
            {   --// 34 以下属性都是倍率
                {type = 6, value = 0.34, }, --HP
                {type = 8, value = 0.34, }, --MP
                {type = 10, value = 0.34, }, --最小物理攻击
                {type = 12, value = 0.34, }, --最大物理攻击
                {type = 14, value = 0.34, }, --最小魔法攻击
                {type = 16, value = 0.34, }, --最大魔法攻击
                {type = 18, value = 0.34, }, --最小道术攻击
                {type = 20, value = 0.34, }, --最大道术攻击
            },
            {   --// 35 以下属性都是倍率
                {type = 6, value = 0.35, }, --HP
                {type = 8, value = 0.35, }, --MP
                {type = 10, value = 0.35, }, --最小物理攻击
                {type = 12, value = 0.35, }, --最大物理攻击
                {type = 14, value = 0.35, }, --最小魔法攻击
                {type = 16, value = 0.35, }, --最大魔法攻击
                {type = 18, value = 0.35, }, --最小道术攻击
                {type = 20, value = 0.35, }, --最大道术攻击
            },
            {   --// 36 以下属性都是倍率
                {type = 6, value = 0.36, }, --HP
                {type = 8, value = 0.36, }, --MP
                {type = 10, value = 0.36, }, --最小物理攻击
                {type = 12, value = 0.36, }, --最大物理攻击
                {type = 14, value = 0.36, }, --最小魔法攻击
                {type = 16, value = 0.36, }, --最大魔法攻击
                {type = 18, value = 0.36, }, --最小道术攻击
                {type = 20, value = 0.36, }, --最大道术攻击
            },
            {   --// 37 以下属性都是倍率
                {type = 6, value = 0.37, }, --HP
                {type = 8, value = 0.37, }, --MP
                {type = 10, value = 0.37, }, --最小物理攻击
                {type = 12, value = 0.37, }, --最大物理攻击
                {type = 14, value = 0.37, }, --最小魔法攻击
                {type = 16, value = 0.37, }, --最大魔法攻击
                {type = 18, value = 0.37, }, --最小道术攻击
                {type = 20, value = 0.37, }, --最大道术攻击
            },
            {   --// 38 以下属性都是倍率
                {type = 6, value = 0.38, }, --HP
                {type = 8, value = 0.38, }, --MP
                {type = 10, value = 0.38, }, --最小物理攻击
                {type = 12, value = 0.38, }, --最大物理攻击
                {type = 14, value = 0.38, }, --最小魔法攻击
                {type = 16, value = 0.38, }, --最大魔法攻击
                {type = 18, value = 0.38, }, --最小道术攻击
                {type = 20, value = 0.38, }, --最大道术攻击
            },
            {   --// 39 以下属性都是倍率
                {type = 6, value = 0.39, }, --HP
                {type = 8, value = 0.39, }, --MP
                {type = 10, value = 0.39, }, --最小物理攻击
                {type = 12, value = 0.39, }, --最大物理攻击
                {type = 14, value = 0.39, }, --最小魔法攻击
                {type = 16, value = 0.39, }, --最大魔法攻击
                {type = 18, value = 0.39, }, --最小道术攻击
                {type = 20, value = 0.39, }, --最大道术攻击
            },
            {   --// 40 以下属性都是倍率
                {type = 6, value = 0.4, }, --HP
                {type = 8, value = 0.4, }, --MP
                {type = 10, value = 0.4, }, --最小物理攻击
                {type = 12, value = 0.4, }, --最大物理攻击
                {type = 14, value = 0.4, }, --最小魔法攻击
                {type = 16, value = 0.4, }, --最大魔法攻击
                {type = 18, value = 0.4, }, --最小道术攻击
                {type = 20, value = 0.4, }, --最大道术攻击
            },
            {   --// 41 以下属性都是倍率
                {type = 6, value = 0.41, }, --HP
                {type = 8, value = 0.41, }, --MP
                {type = 10, value = 0.41, }, --最小物理攻击
                {type = 12, value = 0.41, }, --最大物理攻击
                {type = 14, value = 0.41, }, --最小魔法攻击
                {type = 16, value = 0.41, }, --最大魔法攻击
                {type = 18, value = 0.41, }, --最小道术攻击
                {type = 20, value = 0.41, }, --最大道术攻击
            },
            {   --// 42 以下属性都是倍率
                {type = 6, value = 0.42, }, --HP
                {type = 8, value = 0.42, }, --MP
                {type = 10, value = 0.42, }, --最小物理攻击
                {type = 12, value = 0.42, }, --最大物理攻击
                {type = 14, value = 0.42, }, --最小魔法攻击
                {type = 16, value = 0.42, }, --最大魔法攻击
                {type = 18, value = 0.42, }, --最小道术攻击
                {type = 20, value = 0.42, }, --最大道术攻击
            },
            {   --// 43 以下属性都是倍率
                {type = 6, value = 0.43, }, --HP
                {type = 8, value = 0.43, }, --MP
                {type = 10, value = 0.43, }, --最小物理攻击
                {type = 12, value = 0.43, }, --最大物理攻击
                {type = 14, value = 0.43, }, --最小魔法攻击
                {type = 16, value = 0.43, }, --最大魔法攻击
                {type = 18, value = 0.43, }, --最小道术攻击
                {type = 20, value = 0.43, }, --最大道术攻击
            },
            {   --// 44 以下属性都是倍率
                {type = 6, value = 0.44, }, --HP
                {type = 8, value = 0.44, }, --MP
                {type = 10, value = 0.44, }, --最小物理攻击
                {type = 12, value = 0.44, }, --最大物理攻击
                {type = 14, value = 0.44, }, --最小魔法攻击
                {type = 16, value = 0.44, }, --最大魔法攻击
                {type = 18, value = 0.44, }, --最小道术攻击
                {type = 20, value = 0.44, }, --最大道术攻击
            },
            {   --// 45 以下属性都是倍率
                {type = 6, value = 0.45, }, --HP
                {type = 8, value = 0.45, }, --MP
                {type = 10, value = 0.45, }, --最小物理攻击
                {type = 12, value = 0.45, }, --最大物理攻击
                {type = 14, value = 0.45, }, --最小魔法攻击
                {type = 16, value = 0.45, }, --最大魔法攻击
                {type = 18, value = 0.45, }, --最小道术攻击
                {type = 20, value = 0.45, }, --最大道术攻击
            },
            {   --// 46 以下属性都是倍率
                {type = 6, value = 0.46, }, --HP
                {type = 8, value = 0.46, }, --MP
                {type = 10, value = 0.46, }, --最小物理攻击
                {type = 12, value = 0.46, }, --最大物理攻击
                {type = 14, value = 0.46, }, --最小魔法攻击
                {type = 16, value = 0.46, }, --最大魔法攻击
                {type = 18, value = 0.46, }, --最小道术攻击
                {type = 20, value = 0.46, }, --最大道术攻击
            },
            {   --// 47 以下属性都是倍率
                {type = 6, value = 0.47, }, --HP
                {type = 8, value = 0.47, }, --MP
                {type = 10, value = 0.47, }, --最小物理攻击
                {type = 12, value = 0.47, }, --最大物理攻击
                {type = 14, value = 0.47, }, --最小魔法攻击
                {type = 16, value = 0.47, }, --最大魔法攻击
                {type = 18, value = 0.47, }, --最小道术攻击
                {type = 20, value = 0.47, }, --最大道术攻击
            },
            {   --// 48 以下属性都是倍率
                {type = 6, value = 0.48, }, --HP
                {type = 8, value = 0.48, }, --MP
                {type = 10, value = 0.48, }, --最小物理攻击
                {type = 12, value = 0.48, }, --最大物理攻击
                {type = 14, value = 0.48, }, --最小魔法攻击
                {type = 16, value = 0.48, }, --最大魔法攻击
                {type = 18, value = 0.48, }, --最小道术攻击
                {type = 20, value = 0.48, }, --最大道术攻击
            },
            {   --// 49 以下属性都是倍率
                {type = 6, value = 0.49, }, --HP
                {type = 8, value = 0.49, }, --MP
                {type = 10, value = 0.49, }, --最小物理攻击
                {type = 12, value = 0.49, }, --最大物理攻击
                {type = 14, value = 0.49, }, --最小魔法攻击
                {type = 16, value = 0.49, }, --最大魔法攻击
                {type = 18, value = 0.49, }, --最小道术攻击
                {type = 20, value = 0.49, }, --最大道术攻击
            },
            {   --// 50 以下属性都是倍率
                {type = 6, value = 0.5, }, --HP
                {type = 8, value = 0.5, }, --MP
                {type = 10, value = 0.5, }, --最小物理攻击
                {type = 12, value = 0.5, }, --最大物理攻击
                {type = 14, value = 0.5, }, --最小魔法攻击
                {type = 16, value = 0.5, }, --最大魔法攻击
                {type = 18, value = 0.5, }, --最小道术攻击
                {type = 20, value = 0.5, }, --最大道术攻击
            },
            {   --// 51 以下属性都是倍率
                {type = 6, value = 0.51, }, --HP
                {type = 8, value = 0.51, }, --MP
                {type = 10, value = 0.51, }, --最小物理攻击
                {type = 12, value = 0.51, }, --最大物理攻击
                {type = 14, value = 0.51, }, --最小魔法攻击
                {type = 16, value = 0.51, }, --最大魔法攻击
                {type = 18, value = 0.51, }, --最小道术攻击
                {type = 20, value = 0.51, }, --最大道术攻击
            },
            {   --// 52 以下属性都是倍率
                {type = 6, value = 0.52, }, --HP
                {type = 8, value = 0.52, }, --MP
                {type = 10, value = 0.52, }, --最小物理攻击
                {type = 12, value = 0.52, }, --最大物理攻击
                {type = 14, value = 0.52, }, --最小魔法攻击
                {type = 16, value = 0.52, }, --最大魔法攻击
                {type = 18, value = 0.52, }, --最小道术攻击
                {type = 20, value = 0.52, }, --最大道术攻击
            },
            {   --// 53 以下属性都是倍率
                {type = 6, value = 0.53, }, --HP
                {type = 8, value = 0.53, }, --MP
                {type = 10, value = 0.53, }, --最小物理攻击
                {type = 12, value = 0.53, }, --最大物理攻击
                {type = 14, value = 0.53, }, --最小魔法攻击
                {type = 16, value = 0.53, }, --最大魔法攻击
                {type = 18, value = 0.53, }, --最小道术攻击
                {type = 20, value = 0.53, }, --最大道术攻击
            },
            {   --// 54 以下属性都是倍率
                {type = 6, value = 0.54, }, --HP
                {type = 8, value = 0.54, }, --MP
                {type = 10, value = 0.54, }, --最小物理攻击
                {type = 12, value = 0.54, }, --最大物理攻击
                {type = 14, value = 0.54, }, --最小魔法攻击
                {type = 16, value = 0.54, }, --最大魔法攻击
                {type = 18, value = 0.54, }, --最小道术攻击
                {type = 20, value = 0.54, }, --最大道术攻击
            },
            {   --// 55 以下属性都是倍率
                {type = 6, value = 0.55, }, --HP
                {type = 8, value = 0.55, }, --MP
                {type = 10, value = 0.55, }, --最小物理攻击
                {type = 12, value = 0.55, }, --最大物理攻击
                {type = 14, value = 0.55, }, --最小魔法攻击
                {type = 16, value = 0.55, }, --最大魔法攻击
                {type = 18, value = 0.55, }, --最小道术攻击
                {type = 20, value = 0.55, }, --最大道术攻击
            },
            {   --// 56 以下属性都是倍率
                {type = 6, value = 0.56, }, --HP
                {type = 8, value = 0.56, }, --MP
                {type = 10, value = 0.56, }, --最小物理攻击
                {type = 12, value = 0.56, }, --最大物理攻击
                {type = 14, value = 0.56, }, --最小魔法攻击
                {type = 16, value = 0.56, }, --最大魔法攻击
                {type = 18, value = 0.56, }, --最小道术攻击
                {type = 20, value = 0.56, }, --最大道术攻击
            },
            {   --// 57 以下属性都是倍率
                {type = 6, value = 0.57, }, --HP
                {type = 8, value = 0.57, }, --MP
                {type = 10, value = 0.57, }, --最小物理攻击
                {type = 12, value = 0.57, }, --最大物理攻击
                {type = 14, value = 0.57, }, --最小魔法攻击
                {type = 16, value = 0.57, }, --最大魔法攻击
                {type = 18, value = 0.57, }, --最小道术攻击
                {type = 20, value = 0.57, }, --最大道术攻击
            },
            {   --// 58 以下属性都是倍率
                {type = 6, value = 0.58, }, --HP
                {type = 8, value = 0.58, }, --MP
                {type = 10, value = 0.58, }, --最小物理攻击
                {type = 12, value = 0.58, }, --最大物理攻击
                {type = 14, value = 0.58, }, --最小魔法攻击
                {type = 16, value = 0.58, }, --最大魔法攻击
                {type = 18, value = 0.58, }, --最小道术攻击
                {type = 20, value = 0.58, }, --最大道术攻击
            },
            {   --// 59 以下属性都是倍率
                {type = 6, value = 0.59, }, --HP
                {type = 8, value = 0.59, }, --MP
                {type = 10, value = 0.59, }, --最小物理攻击
                {type = 12, value = 0.59, }, --最大物理攻击
                {type = 14, value = 0.59, }, --最小魔法攻击
                {type = 16, value = 0.59, }, --最大魔法攻击
                {type = 18, value = 0.59, }, --最小道术攻击
                {type = 20, value = 0.59, }, --最大道术攻击
            },
            {   --// 60 以下属性都是倍率
                {type = 6, value = 0.6, }, --HP
                {type = 8, value = 0.6, }, --MP
                {type = 10, value = 0.6, }, --最小物理攻击
                {type = 12, value = 0.6, }, --最大物理攻击
                {type = 14, value = 0.6, }, --最小魔法攻击
                {type = 16, value = 0.6, }, --最大魔法攻击
                {type = 18, value = 0.6, }, --最小道术攻击
                {type = 20, value = 0.6, }, --最大道术攻击
            },
            {   --// 61 以下属性都是倍率
                {type = 6, value = 0.61, }, --HP
                {type = 8, value = 0.61, }, --MP
                {type = 10, value = 0.61, }, --最小物理攻击
                {type = 12, value = 0.61, }, --最大物理攻击
                {type = 14, value = 0.61, }, --最小魔法攻击
                {type = 16, value = 0.61, }, --最大魔法攻击
                {type = 18, value = 0.61, }, --最小道术攻击
                {type = 20, value = 0.61, }, --最大道术攻击
            },
            {   --// 62 以下属性都是倍率
                {type = 6, value = 0.62, }, --HP
                {type = 8, value = 0.62, }, --MP
                {type = 10, value = 0.62, }, --最小物理攻击
                {type = 12, value = 0.62, }, --最大物理攻击
                {type = 14, value = 0.62, }, --最小魔法攻击
                {type = 16, value = 0.62, }, --最大魔法攻击
                {type = 18, value = 0.62, }, --最小道术攻击
                {type = 20, value = 0.62, }, --最大道术攻击
            },
            {   --// 63 以下属性都是倍率
                {type = 6, value = 0.63, }, --HP
                {type = 8, value = 0.63, }, --MP
                {type = 10, value = 0.63, }, --最小物理攻击
                {type = 12, value = 0.63, }, --最大物理攻击
                {type = 14, value = 0.63, }, --最小魔法攻击
                {type = 16, value = 0.63, }, --最大魔法攻击
                {type = 18, value = 0.63, }, --最小道术攻击
                {type = 20, value = 0.63, }, --最大道术攻击
            },
            {   --// 64 以下属性都是倍率
                {type = 6, value = 0.64, }, --HP
                {type = 8, value = 0.64, }, --MP
                {type = 10, value = 0.64, }, --最小物理攻击
                {type = 12, value = 0.64, }, --最大物理攻击
                {type = 14, value = 0.64, }, --最小魔法攻击
                {type = 16, value = 0.64, }, --最大魔法攻击
                {type = 18, value = 0.64, }, --最小道术攻击
                {type = 20, value = 0.64, }, --最大道术攻击
            },
            {   --// 65 以下属性都是倍率
                {type = 6, value = 0.65, }, --HP
                {type = 8, value = 0.65, }, --MP
                {type = 10, value = 0.65, }, --最小物理攻击
                {type = 12, value = 0.65, }, --最大物理攻击
                {type = 14, value = 0.65, }, --最小魔法攻击
                {type = 16, value = 0.65, }, --最大魔法攻击
                {type = 18, value = 0.65, }, --最小道术攻击
                {type = 20, value = 0.65, }, --最大道术攻击
            },
            {   --// 66 以下属性都是倍率
                {type = 6, value = 0.66, }, --HP
                {type = 8, value = 0.66, }, --MP
                {type = 10, value = 0.66, }, --最小物理攻击
                {type = 12, value = 0.66, }, --最大物理攻击
                {type = 14, value = 0.66, }, --最小魔法攻击
                {type = 16, value = 0.66, }, --最大魔法攻击
                {type = 18, value = 0.66, }, --最小道术攻击
                {type = 20, value = 0.66, }, --最大道术攻击
            },
            {   --// 67 以下属性都是倍率
                {type = 6, value = 0.67, }, --HP
                {type = 8, value = 0.67, }, --MP
                {type = 10, value = 0.67, }, --最小物理攻击
                {type = 12, value = 0.67, }, --最大物理攻击
                {type = 14, value = 0.67, }, --最小魔法攻击
                {type = 16, value = 0.67, }, --最大魔法攻击
                {type = 18, value = 0.67, }, --最小道术攻击
                {type = 20, value = 0.67, }, --最大道术攻击
            },
            {   --// 68 以下属性都是倍率
                {type = 6, value = 0.68, }, --HP
                {type = 8, value = 0.68, }, --MP
                {type = 10, value = 0.68, }, --最小物理攻击
                {type = 12, value = 0.68, }, --最大物理攻击
                {type = 14, value = 0.68, }, --最小魔法攻击
                {type = 16, value = 0.68, }, --最大魔法攻击
                {type = 18, value = 0.68, }, --最小道术攻击
                {type = 20, value = 0.68, }, --最大道术攻击
            },
            {   --// 69 以下属性都是倍率
                {type = 6, value = 0.69, }, --HP
                {type = 8, value = 0.69, }, --MP
                {type = 10, value = 0.69, }, --最小物理攻击
                {type = 12, value = 0.69, }, --最大物理攻击
                {type = 14, value = 0.69, }, --最小魔法攻击
                {type = 16, value = 0.69, }, --最大魔法攻击
                {type = 18, value = 0.69, }, --最小道术攻击
                {type = 20, value = 0.69, }, --最大道术攻击
            },
            {   --// 70 以下属性都是倍率
                {type = 6, value = 0.7, }, --HP
                {type = 8, value = 0.7, }, --MP
                {type = 10, value = 0.7, }, --最小物理攻击
                {type = 12, value = 0.7, }, --最大物理攻击
                {type = 14, value = 0.7, }, --最小魔法攻击
                {type = 16, value = 0.7, }, --最大魔法攻击
                {type = 18, value = 0.7, }, --最小道术攻击
                {type = 20, value = 0.7, }, --最大道术攻击
            },
            {   --// 71 以下属性都是倍率
                {type = 6, value = 0.71, }, --HP
                {type = 8, value = 0.71, }, --MP
                {type = 10, value = 0.71, }, --最小物理攻击
                {type = 12, value = 0.71, }, --最大物理攻击
                {type = 14, value = 0.71, }, --最小魔法攻击
                {type = 16, value = 0.71, }, --最大魔法攻击
                {type = 18, value = 0.71, }, --最小道术攻击
                {type = 20, value = 0.71, }, --最大道术攻击
            },
            {   --// 72 以下属性都是倍率
                {type = 6, value = 0.72, }, --HP
                {type = 8, value = 0.72, }, --MP
                {type = 10, value = 0.72, }, --最小物理攻击
                {type = 12, value = 0.72, }, --最大物理攻击
                {type = 14, value = 0.72, }, --最小魔法攻击
                {type = 16, value = 0.72, }, --最大魔法攻击
                {type = 18, value = 0.72, }, --最小道术攻击
                {type = 20, value = 0.72, }, --最大道术攻击
            },
            {   --// 73 以下属性都是倍率
                {type = 6, value = 0.73, }, --HP
                {type = 8, value = 0.73, }, --MP
                {type = 10, value = 0.73, }, --最小物理攻击
                {type = 12, value = 0.73, }, --最大物理攻击
                {type = 14, value = 0.73, }, --最小魔法攻击
                {type = 16, value = 0.73, }, --最大魔法攻击
                {type = 18, value = 0.73, }, --最小道术攻击
                {type = 20, value = 0.73, }, --最大道术攻击
            },
            {   --// 74 以下属性都是倍率
                {type = 6, value = 0.74, }, --HP
                {type = 8, value = 0.74, }, --MP
                {type = 10, value = 0.74, }, --最小物理攻击
                {type = 12, value = 0.74, }, --最大物理攻击
                {type = 14, value = 0.74, }, --最小魔法攻击
                {type = 16, value = 0.74, }, --最大魔法攻击
                {type = 18, value = 0.74, }, --最小道术攻击
                {type = 20, value = 0.74, }, --最大道术攻击
            },
            {   --// 75 以下属性都是倍率
                {type = 6, value = 0.75, }, --HP
                {type = 8, value = 0.75, }, --MP
                {type = 10, value = 0.75, }, --最小物理攻击
                {type = 12, value = 0.75, }, --最大物理攻击
                {type = 14, value = 0.75, }, --最小魔法攻击
                {type = 16, value = 0.75, }, --最大魔法攻击
                {type = 18, value = 0.75, }, --最小道术攻击
                {type = 20, value = 0.75, }, --最大道术攻击
            },
            {   --// 76 以下属性都是倍率
                {type = 6, value = 0.76, }, --HP
                {type = 8, value = 0.76, }, --MP
                {type = 10, value = 0.76, }, --最小物理攻击
                {type = 12, value = 0.76, }, --最大物理攻击
                {type = 14, value = 0.76, }, --最小魔法攻击
                {type = 16, value = 0.76, }, --最大魔法攻击
                {type = 18, value = 0.76, }, --最小道术攻击
                {type = 20, value = 0.76, }, --最大道术攻击
            },
            {   --// 77 以下属性都是倍率
                {type = 6, value = 0.77, }, --HP
                {type = 8, value = 0.77, }, --MP
                {type = 10, value = 0.77, }, --最小物理攻击
                {type = 12, value = 0.77, }, --最大物理攻击
                {type = 14, value = 0.77, }, --最小魔法攻击
                {type = 16, value = 0.77, }, --最大魔法攻击
                {type = 18, value = 0.77, }, --最小道术攻击
                {type = 20, value = 0.77, }, --最大道术攻击
            },
            {   --// 78 以下属性都是倍率
                {type = 6, value = 0.78, }, --HP
                {type = 8, value = 0.78, }, --MP
                {type = 10, value = 0.78, }, --最小物理攻击
                {type = 12, value = 0.78, }, --最大物理攻击
                {type = 14, value = 0.78, }, --最小魔法攻击
                {type = 16, value = 0.78, }, --最大魔法攻击
                {type = 18, value = 0.78, }, --最小道术攻击
                {type = 20, value = 0.78, }, --最大道术攻击
            },
            {   --// 79 以下属性都是倍率
                {type = 6, value = 0.79, }, --HP
                {type = 8, value = 0.79, }, --MP
                {type = 10, value = 0.79, }, --最小物理攻击
                {type = 12, value = 0.79, }, --最大物理攻击
                {type = 14, value = 0.79, }, --最小魔法攻击
                {type = 16, value = 0.79, }, --最大魔法攻击
                {type = 18, value = 0.79, }, --最小道术攻击
                {type = 20, value = 0.79, }, --最大道术攻击
            },
            {   --// 80 以下属性都是倍率
                {type = 6, value = 0.8, }, --HP
                {type = 8, value = 0.8, }, --MP
                {type = 10, value = 0.8, }, --最小物理攻击
                {type = 12, value = 0.8, }, --最大物理攻击
                {type = 14, value = 0.8, }, --最小魔法攻击
                {type = 16, value = 0.8, }, --最大魔法攻击
                {type = 18, value = 0.8, }, --最小道术攻击
                {type = 20, value = 0.8, }, --最大道术攻击
            },
            {   --// 81 以下属性都是倍率
                {type = 6, value = 0.81, }, --HP
                {type = 8, value = 0.81, }, --MP
                {type = 10, value = 0.81, }, --最小物理攻击
                {type = 12, value = 0.81, }, --最大物理攻击
                {type = 14, value = 0.81, }, --最小魔法攻击
                {type = 16, value = 0.81, }, --最大魔法攻击
                {type = 18, value = 0.81, }, --最小道术攻击
                {type = 20, value = 0.81, }, --最大道术攻击
            },
            {   --// 82 以下属性都是倍率
                {type = 6, value = 0.82, }, --HP
                {type = 8, value = 0.82, }, --MP
                {type = 10, value = 0.82, }, --最小物理攻击
                {type = 12, value = 0.82, }, --最大物理攻击
                {type = 14, value = 0.82, }, --最小魔法攻击
                {type = 16, value = 0.82, }, --最大魔法攻击
                {type = 18, value = 0.82, }, --最小道术攻击
                {type = 20, value = 0.82, }, --最大道术攻击
            },
            {   --// 83 以下属性都是倍率
                {type = 6, value = 0.83, }, --HP
                {type = 8, value = 0.83, }, --MP
                {type = 10, value = 0.83, }, --最小物理攻击
                {type = 12, value = 0.83, }, --最大物理攻击
                {type = 14, value = 0.83, }, --最小魔法攻击
                {type = 16, value = 0.83, }, --最大魔法攻击
                {type = 18, value = 0.83, }, --最小道术攻击
                {type = 20, value = 0.83, }, --最大道术攻击
            },
            {   --// 84 以下属性都是倍率
                {type = 6, value = 0.84, }, --HP
                {type = 8, value = 0.84, }, --MP
                {type = 10, value = 0.84, }, --最小物理攻击
                {type = 12, value = 0.84, }, --最大物理攻击
                {type = 14, value = 0.84, }, --最小魔法攻击
                {type = 16, value = 0.84, }, --最大魔法攻击
                {type = 18, value = 0.84, }, --最小道术攻击
                {type = 20, value = 0.84, }, --最大道术攻击
            },
            {   --// 85 以下属性都是倍率
                {type = 6, value = 0.85, }, --HP
                {type = 8, value = 0.85, }, --MP
                {type = 10, value = 0.85, }, --最小物理攻击
                {type = 12, value = 0.85, }, --最大物理攻击
                {type = 14, value = 0.85, }, --最小魔法攻击
                {type = 16, value = 0.85, }, --最大魔法攻击
                {type = 18, value = 0.85, }, --最小道术攻击
                {type = 20, value = 0.85, }, --最大道术攻击
            },
            {   --// 86 以下属性都是倍率
                {type = 6, value = 0.86, }, --HP
                {type = 8, value = 0.86, }, --MP
                {type = 10, value = 0.86, }, --最小物理攻击
                {type = 12, value = 0.86, }, --最大物理攻击
                {type = 14, value = 0.86, }, --最小魔法攻击
                {type = 16, value = 0.86, }, --最大魔法攻击
                {type = 18, value = 0.86, }, --最小道术攻击
                {type = 20, value = 0.86, }, --最大道术攻击
            },
            {   --// 87 以下属性都是倍率
                {type = 6, value = 0.87, }, --HP
                {type = 8, value = 0.87, }, --MP
                {type = 10, value = 0.87, }, --最小物理攻击
                {type = 12, value = 0.87, }, --最大物理攻击
                {type = 14, value = 0.87, }, --最小魔法攻击
                {type = 16, value = 0.87, }, --最大魔法攻击
                {type = 18, value = 0.87, }, --最小道术攻击
                {type = 20, value = 0.87, }, --最大道术攻击
            },
            {   --// 88 以下属性都是倍率
                {type = 6, value = 0.88, }, --HP
                {type = 8, value = 0.88, }, --MP
                {type = 10, value = 0.88, }, --最小物理攻击
                {type = 12, value = 0.88, }, --最大物理攻击
                {type = 14, value = 0.88, }, --最小魔法攻击
                {type = 16, value = 0.88, }, --最大魔法攻击
                {type = 18, value = 0.88, }, --最小道术攻击
                {type = 20, value = 0.88, }, --最大道术攻击
            },
            {   --// 89 以下属性都是倍率
                {type = 6, value = 0.89, }, --HP
                {type = 8, value = 0.89, }, --MP
                {type = 10, value = 0.89, }, --最小物理攻击
                {type = 12, value = 0.89, }, --最大物理攻击
                {type = 14, value = 0.89, }, --最小魔法攻击
                {type = 16, value = 0.89, }, --最大魔法攻击
                {type = 18, value = 0.89, }, --最小道术攻击
                {type = 20, value = 0.89, }, --最大道术攻击
            },
            {   --// 90 以下属性都是倍率
                {type = 6, value = 0.9, }, --HP
                {type = 8, value = 0.9, }, --MP
                {type = 10, value = 0.9, }, --最小物理攻击
                {type = 12, value = 0.9, }, --最大物理攻击
                {type = 14, value = 0.9, }, --最小魔法攻击
                {type = 16, value = 0.9, }, --最大魔法攻击
                {type = 18, value = 0.9, }, --最小道术攻击
                {type = 20, value = 0.9, }, --最大道术攻击
            },
            {   --// 91 以下属性都是倍率
                {type = 6, value = 0.91, }, --HP
                {type = 8, value = 0.91, }, --MP
                {type = 10, value = 0.91, }, --最小物理攻击
                {type = 12, value = 0.91, }, --最大物理攻击
                {type = 14, value = 0.91, }, --最小魔法攻击
                {type = 16, value = 0.91, }, --最大魔法攻击
                {type = 18, value = 0.91, }, --最小道术攻击
                {type = 20, value = 0.91, }, --最大道术攻击
            },
            {   --// 92 以下属性都是倍率
                {type = 6, value = 0.92, }, --HP
                {type = 8, value = 0.92, }, --MP
                {type = 10, value = 0.92, }, --最小物理攻击
                {type = 12, value = 0.92, }, --最大物理攻击
                {type = 14, value = 0.92, }, --最小魔法攻击
                {type = 16, value = 0.92, }, --最大魔法攻击
                {type = 18, value = 0.92, }, --最小道术攻击
                {type = 20, value = 0.92, }, --最大道术攻击
            },
            {   --// 93 以下属性都是倍率
                {type = 6, value = 0.93, }, --HP
                {type = 8, value = 0.93, }, --MP
                {type = 10, value = 0.93, }, --最小物理攻击
                {type = 12, value = 0.93, }, --最大物理攻击
                {type = 14, value = 0.93, }, --最小魔法攻击
                {type = 16, value = 0.93, }, --最大魔法攻击
                {type = 18, value = 0.93, }, --最小道术攻击
                {type = 20, value = 0.93, }, --最大道术攻击
            },
            {   --// 94 以下属性都是倍率
                {type = 6, value = 0.94, }, --HP
                {type = 8, value = 0.94, }, --MP
                {type = 10, value = 0.94, }, --最小物理攻击
                {type = 12, value = 0.94, }, --最大物理攻击
                {type = 14, value = 0.94, }, --最小魔法攻击
                {type = 16, value = 0.94, }, --最大魔法攻击
                {type = 18, value = 0.94, }, --最小道术攻击
                {type = 20, value = 0.94, }, --最大道术攻击
            },
            {   --// 95 以下属性都是倍率
                {type = 6, value = 0.95, }, --HP
                {type = 8, value = 0.95, }, --MP
                {type = 10, value = 0.95, }, --最小物理攻击
                {type = 12, value = 0.95, }, --最大物理攻击
                {type = 14, value = 0.95, }, --最小魔法攻击
                {type = 16, value = 0.95, }, --最大魔法攻击
                {type = 18, value = 0.95, }, --最小道术攻击
                {type = 20, value = 0.95, }, --最大道术攻击
            },
            {   --// 96 以下属性都是倍率
                {type = 6, value = 0.96, }, --HP
                {type = 8, value = 0.96, }, --MP
                {type = 10, value = 0.96, }, --最小物理攻击
                {type = 12, value = 0.96, }, --最大物理攻击
                {type = 14, value = 0.96, }, --最小魔法攻击
                {type = 16, value = 0.96, }, --最大魔法攻击
                {type = 18, value = 0.96, }, --最小道术攻击
                {type = 20, value = 0.96, }, --最大道术攻击
            },
            {   --// 97 以下属性都是倍率
                {type = 6, value = 0.97, }, --HP
                {type = 8, value = 0.97, }, --MP
                {type = 10, value = 0.97, }, --最小物理攻击
                {type = 12, value = 0.97, }, --最大物理攻击
                {type = 14, value = 0.97, }, --最小魔法攻击
                {type = 16, value = 0.97, }, --最大魔法攻击
                {type = 18, value = 0.97, }, --最小道术攻击
                {type = 20, value = 0.97, }, --最大道术攻击
            },
            {   --// 98 以下属性都是倍率
                {type = 6, value = 0.98, }, --HP
                {type = 8, value = 0.98, }, --MP
                {type = 10, value = 0.98, }, --最小物理攻击
                {type = 12, value = 0.98, }, --最大物理攻击
                {type = 14, value = 0.98, }, --最小魔法攻击
                {type = 16, value = 0.98, }, --最大魔法攻击
                {type = 18, value = 0.98, }, --最小道术攻击
                {type = 20, value = 0.98, }, --最大道术攻击
            },
            {   --// 99 以下属性都是倍率
                {type = 6, value = 0.99, }, --HP
                {type = 8, value = 0.99, }, --MP
                {type = 10, value = 0.99, }, --最小物理攻击
                {type = 12, value = 0.99, }, --最大物理攻击
                {type = 14, value = 0.99, }, --最小魔法攻击
                {type = 16, value = 0.99, }, --最大魔法攻击
                {type = 18, value = 0.99, }, --最小道术攻击
                {type = 20, value = 0.99, }, --最大道术攻击
            },
            {   --// 100 以下属性都是倍率
                {type = 6, value = 1, }, --HP
                {type = 8, value = 1, }, --MP
                {type = 10, value = 1, }, --最小物理攻击
                {type = 12, value = 1, }, --最大物理攻击
                {type = 14, value = 1, }, --最小魔法攻击
                {type = 16, value = 1, }, --最大魔法攻击
                {type = 18, value = 1, }, --最小道术攻击
                {type = 20, value = 1, }, --最大道术攻击
            },

        },
        
        --个人排名奖励
        award =
        {
            rank =
            {
                
                --第一名
                {
                    {type = 3, ptr = 70, value = 20000, name = "内功经验", },
                },
                --第二名
                {
                    {type = 3, ptr = 70, value = 15000, name = "内功经验", },
                },
                --第三名
                {
                    {type = 3, ptr = 70, value = 12000, name = "内功经验", },
                },
                --第四名
                {
                    {type = 3, ptr = 70, value = 10000, name = "内功经验", },
                },
                --第五名
                {
                    {type = 3, ptr = 70, value = 8000, name = "内功经验", },
                },
            },
            endof = --保底奖励
            {
                {type = 3, ptr = 70, value = 5000, name = "内功经验", },
            }
        },
    
    }
