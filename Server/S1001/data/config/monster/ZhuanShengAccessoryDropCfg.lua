-- 转生神殿天、地、暗 BOSS 独立判定主宰饰品碎片掉落。
-- rate 为掉出任意一种碎片的百分比；成功后四种等概率选一种。
ZhuanShengAccessoryDropCfg = {
    items = {5152, 5153, 5154, 5155},
    finishedItems = {5140, 5141, 5142, 5143},
    tiers = {
        [287] = {monsters = {647, 705, 696}, rate = 10, mincount = 1, maxcount = 1}, -- 1转
        [288] = {monsters = {648, 706, 697}, rate = 20, mincount = 1, maxcount = 1}, -- 2转
        [289] = {monsters = {649, 707, 698}, rate = 30, mincount = 1, maxcount = 1}, -- 3转
        [290] = {monsters = {650, 708, 699}, rate = 40, mincount = 1, maxcount = 2}, -- 4转
        [291] = {monsters = {651, 709, 700}, rate = 50, mincount = 1, maxcount = 2}, -- 5转
        [292] = {monsters = {652, 710, 701}, rate = 60, mincount = 1, maxcount = 2}, -- 6转
        [293] = {monsters = {653, 711, 702}, rate = 70, mincount = 2, maxcount = 2, finishedRate = 5}, -- 7–8转
        [294] = {monsters = {654, 712, 703}, rate = 80, mincount = 2, maxcount = 2, finishedRate = 7}, -- 9–10转
        [295] = {monsters = {655, 713, 704}, rate = 90, mincount = 2, maxcount = 3, finishedRate = 11}, -- 11–12转
        [296] = {monsters = {1343, 1344, 1345}, rate = 100, mincount = 2, maxcount = 3, finishedRate = 15}, -- 13–15转
    },
}
