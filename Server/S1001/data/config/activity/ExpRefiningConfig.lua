--经验炼制配置,散人传说 2017/05/17 zer 更新
ExpRefiningConfig =
    {
        neelLevel = 60,
        ReturnDay={4,5,6}, --元宝返还天数，对应第一天 第二天 第三条
        ExpRefining =
        {
            -- 第一天：1:600W
            -- 一档： 666  元宝   炼制 38888888  经验
            -- 二档： 1288 元宝   炼制 76888888  经验
            -- 三挡： 1888 元宝   炼制 113888888 经验
            -- 第二天：1:700W
            -- 一档： 888  元宝   炼制 56888888  经验
            -- 二档： 1888 元宝   炼制 132888888 经验
            -- 三挡： 2888 元宝   炼制 202888888 经验
            -- 第三天：1:800W
            -- 一档： 1288 元宝   炼制 102888888  经验
            -- 二档： 2188 元宝   炼制 178888888  经验
            -- 三挡： 3888 元宝   炼制 318888888  经验
						----------------
            ----第一天
            {
                {
                    level = 61,
                    addExp = 38888888,
                    consume = {type = 15, id = 0, count = 666}, 
                },
                {
                    level = 64,
                    addExp = 76888888,
                    consume = {type = 15, id = 0, count = 1288}, 
                },
                {
                    level = 68,
                    addExp = 113888888,
                    consume = {type = 15, id = 0, count = 1888}, 
                },
            },
            -----第二天
            {
                {
                    level = 61,
                    addExp = 56888888,
                    consume = {type = 15, id = 0, count = 888}, 
                },
                {
                    level = 64,
                    addExp = 132888888,
                    consume = {type = 15, id = 0, count = 1888}, 
                },
                {
                    level = 68,
                    addExp = 202888888,
                    consume = {type = 15, id = 0, count = 2888}, 
                },
            },
            -----第三天
            {
                {
                    level = 61,
                    addExp = 102888888,
                    consume = {type = 15, id = 0, count = 1288}, 
                },
                {
                    level = 64,
                    addExp = 178888888,
                    consume = {type = 15, id = 0, count = 2188}, 
                },
                {
                    level = 68,
                    addExp = 318888888,
                    consume = {type = 15, id = 0, count = 3888}, 
                },
            },
        }
    }
