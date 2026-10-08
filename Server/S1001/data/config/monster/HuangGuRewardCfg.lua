-- 万事通兑换与真荒古战将之神共用核心奖励配置。
LocalDT.HuangGuReward = {
    scrollId = 491,
    scrollCount = 10, -- 单张卷轴进入真荒古的概率为 1/10。
    bossId = 635,
    sceneId = 286,
    spiritDrops = {
        {id = 552, mincount = 3, maxcount = 5, rate = 100, bind = 0},
        {id = 553, mincount = 1, maxcount = 2, rate = 30, bind = 0},
    },
    -- 保留原组内普通装备，抽中后仅发战将装备，避免改变战将装备概率。
    equipmentDrops = {
--#include "drops\drops2130.lua"
    },
}
