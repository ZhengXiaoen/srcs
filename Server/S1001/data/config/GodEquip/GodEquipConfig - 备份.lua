--神装
--2017.3.10
GodEquipConfig =
{
    --神装升级 和分解
    UpLev = 
    {
        
        --战士
        --type=道具类型, srcId=合成前id,destId=合成后id,decValue=升级消耗圣魂数量,addValue=分解获得圣魂数量
        {
            {type = 14, destId = 58, srcId = 303, decValue = 30, addValue = 6}, -- \\给予：神装★屠龙霸刀Lv2，消耗：神装★屠龙霸刀Lv1
            {type = 14, destId = 59, srcId = 58, decValue = 45, addValue = 30}, -- \\给予：神装★屠龙霸刀Lv3，消耗：神装★屠龙霸刀Lv2
            {type = 14, destId = 60, srcId = 59, decValue = 60, addValue = 45}, -- \\给予：神装★屠龙霸刀Lv4，消耗：神装★屠龙霸刀Lv3
            {type = 14, destId = 61, srcId = 60, decValue = 75, addValue = 60}, -- \\给予：神装★屠龙霸刀Lv5，消耗：神装★屠龙霸刀Lv4
            {type = 14, destId = 62, srcId = 61, decValue = 90, addValue = 75}, -- \\给予：神装★屠龙霸刀Lv6，消耗：神装★屠龙霸刀Lv5
            {type = 14, destId = 63, srcId = 62, decValue = 105, addValue = 90}, -- \\给予：神装★屠龙霸刀LvMax，消耗：神装★屠龙霸刀Lv6
            {type = 14, destId = 1484, srcId = 63, decValue = 120, addValue = 105}, -- \\给予：神装★祖龙之身Lv1，消耗：神装★屠龙霸刀LvMax
            {type = 14, destId = 1485, srcId = 1484, decValue = 135, addValue = 120}, -- \\给予：神装★祖龙之身Lv2，消耗：神装★祖龙之身Lv1
            {type = 14, destId = 1486, srcId = 1485, decValue = 150, addValue = 135}, -- \\给予：神装★祖龙之身Lv3，消耗：神装★祖龙之身Lv2
            {type = 14, destId = 1487, srcId = 1486, decValue = 165, addValue = 150}, -- \\给予：神装★祖龙之身Lv4，消耗：神装★祖龙之身Lv3
            {type = 14, destId = 1488, srcId = 1487, decValue = 180, addValue = 165}, -- \\给予：神装★祖龙之身Lv5，消耗：神装★祖龙之身Lv4
            {type = 14, destId = 1489, srcId = 1488, decValue = 195, addValue = 180}, -- \\给予：神装★祖龙之身Lv6，消耗：神装★祖龙之身Lv5
            {type = 14, destId = 1490, srcId = 1489, decValue = 210, addValue = 195}, -- \\给予：神装★祖龙之身LvMax，消耗：神装★祖龙之身Lv6
            {type = 14, destId = 0, srcId = 1490, decValue = 0, addValue = 210}, -- \\分解神装★祖龙之身LvMax
            {type = 12, destId = 1520, srcId = 1519, decValue = 30, addValue = 6}, -- \\给予：神装★屠龙甲Lv2，消耗：神装★屠龙甲Lv1
            {type = 12, destId = 1521, srcId = 1520, decValue = 45, addValue = 30}, -- \\给予：神装★屠龙甲Lv3，消耗：神装★屠龙甲Lv2
            {type = 12, destId = 1522, srcId = 1521, decValue = 60, addValue = 45}, -- \\给予：神装★屠龙甲Lv4，消耗：神装★屠龙甲Lv3
            {type = 12, destId = 1523, srcId = 1522, decValue = 75, addValue = 60}, -- \\给予：神装★屠龙甲Lv5，消耗：神装★屠龙甲Lv4
            {type = 12, destId = 1524, srcId = 1523, decValue = 90, addValue = 75}, -- \\给予：神装★屠龙甲Lv6，消耗：神装★屠龙甲Lv5
            {type = 12, destId = 1525, srcId = 1524, decValue = 105, addValue = 90}, -- \\给予：神装★屠龙甲LvMax，消耗：神装★屠龙甲Lv6
            {type = 12, destId = 1527, srcId = 1526, decValue = 30, addValue = 6}, -- \\给予：神装★屠龙衣Lv2，消耗：神装★屠龙衣Lv1
            {type = 12, destId = 1528, srcId = 1527, decValue = 45, addValue = 30}, -- \\给予：神装★屠龙衣Lv3，消耗：神装★屠龙衣Lv2
            {type = 12, destId = 1529, srcId = 1528, decValue = 60, addValue = 45}, -- \\给予：神装★屠龙衣Lv4，消耗：神装★屠龙衣Lv3
            {type = 12, destId = 1530, srcId = 1529, decValue = 75, addValue = 60}, -- \\给予：神装★屠龙衣Lv5，消耗：神装★屠龙衣Lv4
            {type = 12, destId = 1531, srcId = 1530, decValue = 90, addValue = 75}, -- \\给予：神装★屠龙衣Lv6，消耗：神装★屠龙衣Lv5
            {type = 12, destId = 1532, srcId = 1531, decValue = 105, addValue = 90}, -- \\给予：神装★屠龙衣LvMax，消耗：神装★屠龙衣Lv6
            {type = 12, destId = 1533, srcId = 1525, decValue = 120, addValue = 105}, -- \\给予：神装★祖龙甲Lv1，消耗：神装★屠龙甲LvMax
            {type = 12, destId = 1534, srcId = 1533, decValue = 135, addValue = 120}, -- \\给予：神装★祖龙甲Lv2，消耗：神装★祖龙甲Lv1
            {type = 12, destId = 1535, srcId = 1534, decValue = 150, addValue = 135}, -- \\给予：神装★祖龙甲Lv3，消耗：神装★祖龙甲Lv2
            {type = 12, destId = 1536, srcId = 1535, decValue = 165, addValue = 150}, -- \\给予：神装★祖龙甲Lv4，消耗：神装★祖龙甲Lv3
            {type = 12, destId = 1537, srcId = 1536, decValue = 180, addValue = 165}, -- \\给予：神装★祖龙甲Lv5，消耗：神装★祖龙甲Lv4
            {type = 12, destId = 1538, srcId = 1537, decValue = 195, addValue = 180}, -- \\给予：神装★祖龙甲Lv6，消耗：神装★祖龙甲Lv5
            {type = 12, destId = 1539, srcId = 1538, decValue = 210, addValue = 195}, -- \\给予：神装★祖龙甲LvMax，消耗：神装★祖龙甲Lv6
            {type = 12, destId = 0, srcId = 1539, decValue = 0, addValue = 210}, -- \\分解神装★祖龙甲LvMax
            {type = 12, destId = 1540, srcId = 1532, decValue = 120, addValue = 105}, -- \\给予：神装★祖龙衣Lv1，消耗：神装★屠龙衣LvMax
            {type = 12, destId = 1541, srcId = 1540, decValue = 135, addValue = 120}, -- \\给予：神装★祖龙衣Lv2，消耗：神装★祖龙衣Lv1
            {type = 12, destId = 1542, srcId = 1541, decValue = 150, addValue = 135}, -- \\给予：神装★祖龙衣Lv3，消耗：神装★祖龙衣Lv2
            {type = 12, destId = 1543, srcId = 1542, decValue = 165, addValue = 150}, -- \\给予：神装★祖龙衣Lv4，消耗：神装★祖龙衣Lv3
            {type = 12, destId = 1544, srcId = 1543, decValue = 180, addValue = 165}, -- \\给予：神装★祖龙衣Lv5，消耗：神装★祖龙衣Lv4
            {type = 12, destId = 1545, srcId = 1544, decValue = 195, addValue = 180}, -- \\给予：神装★祖龙衣Lv6，消耗：神装★祖龙衣Lv5
            {type = 12, destId = 1546, srcId = 1545, decValue = 210, addValue = 195}, -- \\给予：神装★祖龙衣LvMax，消耗：神装★祖龙衣Lv6
            {type = 12, destId = 0, srcId = 1546, decValue = 0, addValue = 210}, -- \\分解神装★祖龙衣LvMax

            {type = 40, destId = 2126, srcId = 2120, decValue = 6, addValue = 3}, -- \\给予：神装★屠龙战盔Lv2，消耗：神装★屠龙战盔Lv1
            {type = 41, destId = 2127, srcId = 2121, decValue = 6, addValue = 3}, -- \\给予：神装★屠龙战链Lv2，消耗：神装★屠龙战链Lv1
            {type = 42, destId = 2128, srcId = 2122, decValue = 6, addValue = 3}, -- \\给予：神装★屠龙战镯Lv2，消耗：神装★屠龙战镯Lv1
            {type = 44, destId = 2129, srcId = 2123, decValue = 6, addValue = 3}, -- \\给予：神装★屠龙战戒Lv2，消耗：神装★屠龙战戒Lv1
            {type = 46, destId = 2130, srcId = 2124, decValue = 6, addValue = 3}, -- \\给予：神装★屠龙战带Lv2，消耗：神装★屠龙战带Lv1
            {type = 47, destId = 2131, srcId = 2125, decValue = 6, addValue = 3}, -- \\给予：神装★屠龙战靴Lv2，消耗：神装★屠龙战靴Lv1
            {type = 40, destId = 2132, srcId = 2126, decValue = 9, addValue = 6}, -- \\给予：神装★屠龙战盔Lv3，消耗：神装★屠龙战盔Lv2
            {type = 41, destId = 2133, srcId = 2127, decValue = 9, addValue = 6}, -- \\给予：神装★屠龙战链Lv3，消耗：神装★屠龙战链Lv2
            {type = 42, destId = 2134, srcId = 2128, decValue = 9, addValue = 6}, -- \\给予：神装★屠龙战镯Lv3，消耗：神装★屠龙战镯Lv2
            {type = 44, destId = 2135, srcId = 2129, decValue = 9, addValue = 6}, -- \\给予：神装★屠龙战戒Lv3，消耗：神装★屠龙战戒Lv2
            {type = 46, destId = 2136, srcId = 2130, decValue = 9, addValue = 6}, -- \\给予：神装★屠龙战带Lv3，消耗：神装★屠龙战带Lv2
            {type = 47, destId = 2137, srcId = 2131, decValue = 9, addValue = 6}, -- \\给予：神装★屠龙战靴Lv3，消耗：神装★屠龙战靴Lv2
            {type = 40, destId = 2138, srcId = 2132, decValue = 12, addValue = 9}, -- \\给予：神装★屠龙战盔Lv4，消耗：神装★屠龙战盔Lv3
            {type = 41, destId = 2139, srcId = 2133, decValue = 12, addValue = 9}, -- \\给予：神装★屠龙战链Lv4，消耗：神装★屠龙战链Lv3
            {type = 42, destId = 2140, srcId = 2134, decValue = 12, addValue = 9}, -- \\给予：神装★屠龙战镯Lv4，消耗：神装★屠龙战镯Lv3
            {type = 44, destId = 2141, srcId = 2135, decValue = 12, addValue = 9}, -- \\给予：神装★屠龙战戒Lv4，消耗：神装★屠龙战戒Lv3
            {type = 46, destId = 2142, srcId = 2136, decValue = 12, addValue = 9}, -- \\给予：神装★屠龙战带Lv4，消耗：神装★屠龙战带Lv3
            {type = 47, destId = 2143, srcId = 2137, decValue = 12, addValue = 9}, -- \\给予：神装★屠龙战靴Lv4，消耗：神装★屠龙战靴Lv3
            {type = 40, destId = 2144, srcId = 2138, decValue = 15, addValue = 12}, -- \\给予：神装★屠龙战盔Lv5，消耗：神装★屠龙战盔Lv4
            {type = 41, destId = 2145, srcId = 2139, decValue = 15, addValue = 12}, -- \\给予：神装★屠龙战链Lv5，消耗：神装★屠龙战链Lv4
            {type = 42, destId = 2146, srcId = 2140, decValue = 15, addValue = 12}, -- \\给予：神装★屠龙战镯Lv5，消耗：神装★屠龙战镯Lv4
            {type = 44, destId = 2147, srcId = 2141, decValue = 15, addValue = 12}, -- \\给予：神装★屠龙战戒Lv5，消耗：神装★屠龙战戒Lv4
            {type = 46, destId = 2148, srcId = 2142, decValue = 15, addValue = 12}, -- \\给予：神装★屠龙战带Lv5，消耗：神装★屠龙战带Lv4
            {type = 47, destId = 2149, srcId = 2143, decValue = 15, addValue = 12}, -- \\给予：神装★屠龙战靴Lv5，消耗：神装★屠龙战靴Lv4
            {type = 40, destId = 2150, srcId = 2144, decValue = 18, addValue = 15}, -- \\给予：神装★屠龙战盔Lv6，消耗：神装★屠龙战盔Lv5
            {type = 41, destId = 2151, srcId = 2145, decValue = 18, addValue = 15}, -- \\给予：神装★屠龙战链Lv6，消耗：神装★屠龙战链Lv5
            {type = 42, destId = 2152, srcId = 2146, decValue = 18, addValue = 15}, -- \\给予：神装★屠龙战镯Lv6，消耗：神装★屠龙战镯Lv5
            {type = 44, destId = 2153, srcId = 2147, decValue = 18, addValue = 15}, -- \\给予：神装★屠龙战戒Lv6，消耗：神装★屠龙战戒Lv5
            {type = 46, destId = 2154, srcId = 2148, decValue = 18, addValue = 15}, -- \\给予：神装★屠龙战带Lv6，消耗：神装★屠龙战带Lv5
            {type = 47, destId = 2155, srcId = 2149, decValue = 18, addValue = 15}, -- \\给予：神装★屠龙战靴Lv6，消耗：神装★屠龙战靴Lv5
            {type = 40, destId = 2156, srcId = 2150, decValue = 21, addValue = 18}, -- \\给予：神装★屠龙战盔LvMax，消耗：神装★屠龙战盔Lv6
            {type = 41, destId = 2157, srcId = 2151, decValue = 21, addValue = 18}, -- \\给予：神装★屠龙战链LvMax，消耗：神装★屠龙战链Lv6
            {type = 42, destId = 2158, srcId = 2152, decValue = 21, addValue = 18}, -- \\给予：神装★屠龙战镯LvMax，消耗：神装★屠龙战镯Lv6
            {type = 44, destId = 2159, srcId = 2153, decValue = 21, addValue = 18}, -- \\给予：神装★屠龙战戒LvMax，消耗：神装★屠龙战戒Lv6
            {type = 46, destId = 2160, srcId = 2154, decValue = 21, addValue = 18}, -- \\给予：神装★屠龙战带LvMax，消耗：神装★屠龙战带Lv6
            {type = 47, destId = 2161, srcId = 2155, decValue = 21, addValue = 18}, -- \\给予：神装★屠龙战靴LvMax，消耗：神装★屠龙战靴Lv6

            {type = 40, destId = 2246, srcId = 2156, decValue = 25, addValue = 21}, -- \\给予：神装★祖龙战盔Lv1，消耗：神装★屠龙战盔LvMax
            {type = 41, destId = 2247, srcId = 2157, decValue = 25, addValue = 21}, -- \\给予：神装★祖龙战链Lv1，消耗：神装★屠龙战链LvMax
            {type = 42, destId = 2248, srcId = 2158, decValue = 25, addValue = 21}, -- \\给予：神装★祖龙战镯Lv1，消耗：神装★屠龙战镯LvMax
            {type = 44, destId = 2249, srcId = 2159, decValue = 25, addValue = 21}, -- \\给予：神装★祖龙战戒Lv1，消耗：神装★屠龙战戒LvMax
            {type = 46, destId = 2250, srcId = 2160, decValue = 25, addValue = 21}, -- \\给予：神装★祖龙战带Lv1，消耗：神装★屠龙战带LvMax
            {type = 47, destId = 2251, srcId = 2161, decValue = 25, addValue = 21}, -- \\给予：神装★祖龙战靴Lv1，消耗：神装★屠龙战靴LvMax
            {type = 40, destId = 2252, srcId = 2246, decValue = 30, addValue = 25}, -- \\给予：神装★祖龙战盔Lv2，消耗：神装★祖龙战盔Lv1
            {type = 41, destId = 2253, srcId = 2247, decValue = 30, addValue = 25}, -- \\给予：神装★祖龙战链Lv2，消耗：神装★祖龙战链Lv1
            {type = 42, destId = 2254, srcId = 2248, decValue = 30, addValue = 25}, -- \\给予：神装★祖龙战镯Lv2，消耗：神装★祖龙战镯Lv1
            {type = 44, destId = 2255, srcId = 2249, decValue = 30, addValue = 25}, -- \\给予：神装★祖龙战戒Lv2，消耗：神装★祖龙战戒Lv1
            {type = 46, destId = 2256, srcId = 2250, decValue = 30, addValue = 25}, -- \\给予：神装★祖龙战带Lv2，消耗：神装★祖龙战带Lv1
            {type = 47, destId = 2257, srcId = 2251, decValue = 30, addValue = 25}, -- \\给予：神装★祖龙战靴Lv2，消耗：神装★祖龙战靴Lv1
            {type = 40, destId = 2258, srcId = 2252, decValue = 35, addValue = 30}, -- \\给予：神装★祖龙战盔Lv3，消耗：神装★祖龙战盔Lv2
            {type = 41, destId = 2259, srcId = 2253, decValue = 35, addValue = 30}, -- \\给予：神装★祖龙战链Lv3，消耗：神装★祖龙战链Lv2
            {type = 42, destId = 2260, srcId = 2254, decValue = 35, addValue = 30}, -- \\给予：神装★祖龙战镯Lv3，消耗：神装★祖龙战镯Lv2
            {type = 44, destId = 2261, srcId = 2255, decValue = 35, addValue = 30}, -- \\给予：神装★祖龙战戒Lv3，消耗：神装★祖龙战戒Lv2
            {type = 46, destId = 2262, srcId = 2256, decValue = 35, addValue = 30}, -- \\给予：神装★祖龙战带Lv3，消耗：神装★祖龙战带Lv2
            {type = 47, destId = 2263, srcId = 2257, decValue = 35, addValue = 30}, -- \\给予：神装★祖龙战靴Lv3，消耗：神装★祖龙战靴Lv2
            {type = 40, destId = 2264, srcId = 2258, decValue = 40, addValue = 35}, -- \\给予：神装★祖龙战盔Lv4，消耗：神装★祖龙战盔Lv3
            {type = 41, destId = 2265, srcId = 2259, decValue = 40, addValue = 35}, -- \\给予：神装★祖龙战链Lv4，消耗：神装★祖龙战链Lv3
            {type = 42, destId = 2266, srcId = 2260, decValue = 40, addValue = 35}, -- \\给予：神装★祖龙战镯Lv4，消耗：神装★祖龙战镯Lv3
            {type = 44, destId = 2267, srcId = 2261, decValue = 40, addValue = 35}, -- \\给予：神装★祖龙战戒Lv4，消耗：神装★祖龙战戒Lv3
            {type = 46, destId = 2268, srcId = 2262, decValue = 40, addValue = 35}, -- \\给予：神装★祖龙战带Lv4，消耗：神装★祖龙战带Lv3
            {type = 47, destId = 2269, srcId = 2263, decValue = 40, addValue = 35}, -- \\给予：神装★祖龙战靴Lv4，消耗：神装★祖龙战靴Lv3
            {type = 40, destId = 2270, srcId = 2264, decValue = 45, addValue = 40}, -- \\给予：神装★祖龙战盔Lv5，消耗：神装★祖龙战盔Lv4
            {type = 41, destId = 2271, srcId = 2265, decValue = 45, addValue = 40}, -- \\给予：神装★祖龙战链Lv5，消耗：神装★祖龙战链Lv4
            {type = 42, destId = 2272, srcId = 2266, decValue = 45, addValue = 40}, -- \\给予：神装★祖龙战镯Lv5，消耗：神装★祖龙战镯Lv4
            {type = 44, destId = 2273, srcId = 2267, decValue = 45, addValue = 40}, -- \\给予：神装★祖龙战戒Lv5，消耗：神装★祖龙战戒Lv4
            {type = 46, destId = 2274, srcId = 2268, decValue = 45, addValue = 40}, -- \\给予：神装★祖龙战带Lv5，消耗：神装★祖龙战带Lv4
            {type = 47, destId = 2275, srcId = 2269, decValue = 45, addValue = 40}, -- \\给予：神装★祖龙战靴Lv5，消耗：神装★祖龙战靴Lv4
            {type = 40, destId = 2276, srcId = 2270, decValue = 50, addValue = 45}, -- \\给予：神装★祖龙战盔Lv6，消耗：神装★祖龙战盔Lv5
            {type = 41, destId = 2277, srcId = 2271, decValue = 50, addValue = 45}, -- \\给予：神装★祖龙战链Lv6，消耗：神装★祖龙战链Lv5
            {type = 42, destId = 2278, srcId = 2272, decValue = 50, addValue = 45}, -- \\给予：神装★祖龙战镯Lv6，消耗：神装★祖龙战镯Lv5
            {type = 44, destId = 2279, srcId = 2273, decValue = 50, addValue = 45}, -- \\给予：神装★祖龙战戒Lv6，消耗：神装★祖龙战戒Lv5
            {type = 46, destId = 2280, srcId = 2274, decValue = 50, addValue = 45}, -- \\给予：神装★祖龙战带Lv6，消耗：神装★祖龙战带Lv5
            {type = 47, destId = 2281, srcId = 2275, decValue = 50, addValue = 45}, -- \\给予：神装★祖龙战靴Lv6，消耗：神装★祖龙战靴Lv5
            {type = 40, destId = 2282, srcId = 2276, decValue = 55, addValue = 50}, -- \\给予：神装★祖龙战盔LvMax，消耗：神装★祖龙战盔Lv6
            {type = 41, destId = 2283, srcId = 2277, decValue = 55, addValue = 50}, -- \\给予：神装★祖龙战链LvMax，消耗：神装★祖龙战链Lv6
            {type = 42, destId = 2284, srcId = 2278, decValue = 55, addValue = 50}, -- \\给予：神装★祖龙战镯LvMax，消耗：神装★祖龙战镯Lv6
            {type = 44, destId = 2285, srcId = 2279, decValue = 55, addValue = 50}, -- \\给予：神装★祖龙战戒LvMax，消耗：神装★祖龙战戒Lv6
            {type = 46, destId = 2286, srcId = 2280, decValue = 55, addValue = 50}, -- \\给予：神装★祖龙战带LvMax，消耗：神装★祖龙战带Lv6
            {type = 47, destId = 2287, srcId = 2281, decValue = 55, addValue = 50}, -- \\给予：神装★祖龙战靴LvMax，消耗：神装★祖龙战靴Lv6

            {type = 40, destId = 0, srcId = 2282, decValue = 0, addValue = 55}, -- \\分解神装★祖龙战盔LvMax
            {type = 41, destId = 0, srcId = 2283, decValue = 0, addValue = 55}, -- \\分解神装★祖龙战链LvMax
            {type = 42, destId = 0, srcId = 2284, decValue = 0, addValue = 55}, -- \\分解神装★祖龙战镯LvMax
            {type = 44, destId = 0, srcId = 2285, decValue = 0, addValue = 55}, -- \\分解神装★祖龙战戒LvMax
            {type = 46, destId = 0, srcId = 2286, decValue = 0, addValue = 55}, -- \\分解神装★祖龙战带LvMax
            {type = 47, destId = 0, srcId = 2287, decValue = 0, addValue = 55}, -- \\分解神装★祖龙战靴LvMax


        },

        --法师
        {
            {type = 14, destId = 58, srcId = 303, decValue = 30, addValue = 6}, -- \\给予：神装★屠龙霸刀Lv2，消耗：神装★屠龙霸刀Lv1
            {type = 14, destId = 59, srcId = 58, decValue = 45, addValue = 30}, -- \\给予：神装★屠龙霸刀Lv3，消耗：神装★屠龙霸刀Lv2
            {type = 14, destId = 60, srcId = 59, decValue = 60, addValue = 45}, -- \\给予：神装★屠龙霸刀Lv4，消耗：神装★屠龙霸刀Lv3
            {type = 14, destId = 61, srcId = 60, decValue = 75, addValue = 60}, -- \\给予：神装★屠龙霸刀Lv5，消耗：神装★屠龙霸刀Lv4
            {type = 14, destId = 62, srcId = 61, decValue = 90, addValue = 75}, -- \\给予：神装★屠龙霸刀Lv6，消耗：神装★屠龙霸刀Lv5
            {type = 14, destId = 63, srcId = 62, decValue = 105, addValue = 90}, -- \\给予：神装★屠龙霸刀LvMax，消耗：神装★屠龙霸刀Lv6
            {type = 14, destId = 1484, srcId = 63, decValue = 120, addValue = 105}, -- \\给予：神装★祖龙之身Lv1，消耗：神装★屠龙霸刀LvMax
            {type = 14, destId = 1485, srcId = 1484, decValue = 135, addValue = 120}, -- \\给予：神装★祖龙之身Lv2，消耗：神装★祖龙之身Lv1
            {type = 14, destId = 1486, srcId = 1485, decValue = 150, addValue = 135}, -- \\给予：神装★祖龙之身Lv3，消耗：神装★祖龙之身Lv2
            {type = 14, destId = 1487, srcId = 1486, decValue = 165, addValue = 150}, -- \\给予：神装★祖龙之身Lv4，消耗：神装★祖龙之身Lv3
            {type = 14, destId = 1488, srcId = 1487, decValue = 180, addValue = 165}, -- \\给予：神装★祖龙之身Lv5，消耗：神装★祖龙之身Lv4
            {type = 14, destId = 1489, srcId = 1488, decValue = 195, addValue = 180}, -- \\给予：神装★祖龙之身Lv6，消耗：神装★祖龙之身Lv5
            {type = 14, destId = 1490, srcId = 1489, decValue = 210, addValue = 195}, -- \\给予：神装★祖龙之身LvMax，消耗：神装★祖龙之身Lv6
            {type = 14, destId = 0, srcId = 1490, decValue = 0, addValue = 210}, -- \\分解神装★祖龙之身LvMax
            {type = 12, destId = 1520, srcId = 1519, decValue = 30, addValue = 6}, -- \\给予：神装★屠龙甲Lv2，消耗：神装★屠龙甲Lv1
            {type = 12, destId = 1521, srcId = 1520, decValue = 45, addValue = 30}, -- \\给予：神装★屠龙甲Lv3，消耗：神装★屠龙甲Lv2
            {type = 12, destId = 1522, srcId = 1521, decValue = 60, addValue = 45}, -- \\给予：神装★屠龙甲Lv4，消耗：神装★屠龙甲Lv3
            {type = 12, destId = 1523, srcId = 1522, decValue = 75, addValue = 60}, -- \\给予：神装★屠龙甲Lv5，消耗：神装★屠龙甲Lv4
            {type = 12, destId = 1524, srcId = 1523, decValue = 90, addValue = 75}, -- \\给予：神装★屠龙甲Lv6，消耗：神装★屠龙甲Lv5
            {type = 12, destId = 1525, srcId = 1524, decValue = 105, addValue = 90}, -- \\给予：神装★屠龙甲LvMax，消耗：神装★屠龙甲Lv6
            {type = 12, destId = 1527, srcId = 1526, decValue = 30, addValue = 6}, -- \\给予：神装★屠龙衣Lv2，消耗：神装★屠龙衣Lv1
            {type = 12, destId = 1528, srcId = 1527, decValue = 45, addValue = 30}, -- \\给予：神装★屠龙衣Lv3，消耗：神装★屠龙衣Lv2
            {type = 12, destId = 1529, srcId = 1528, decValue = 60, addValue = 45}, -- \\给予：神装★屠龙衣Lv4，消耗：神装★屠龙衣Lv3
            {type = 12, destId = 1530, srcId = 1529, decValue = 75, addValue = 60}, -- \\给予：神装★屠龙衣Lv5，消耗：神装★屠龙衣Lv4
            {type = 12, destId = 1531, srcId = 1530, decValue = 90, addValue = 75}, -- \\给予：神装★屠龙衣Lv6，消耗：神装★屠龙衣Lv5
            {type = 12, destId = 1532, srcId = 1531, decValue = 105, addValue = 90}, -- \\给予：神装★屠龙衣LvMax，消耗：神装★屠龙衣Lv6
            {type = 12, destId = 1533, srcId = 1525, decValue = 120, addValue = 105}, -- \\给予：神装★祖龙甲Lv1，消耗：神装★屠龙甲LvMax
            {type = 12, destId = 1534, srcId = 1533, decValue = 135, addValue = 120}, -- \\给予：神装★祖龙甲Lv2，消耗：神装★祖龙甲Lv1
            {type = 12, destId = 1535, srcId = 1534, decValue = 150, addValue = 135}, -- \\给予：神装★祖龙甲Lv3，消耗：神装★祖龙甲Lv2
            {type = 12, destId = 1536, srcId = 1535, decValue = 165, addValue = 150}, -- \\给予：神装★祖龙甲Lv4，消耗：神装★祖龙甲Lv3
            {type = 12, destId = 1537, srcId = 1536, decValue = 180, addValue = 165}, -- \\给予：神装★祖龙甲Lv5，消耗：神装★祖龙甲Lv4
            {type = 12, destId = 1538, srcId = 1537, decValue = 195, addValue = 180}, -- \\给予：神装★祖龙甲Lv6，消耗：神装★祖龙甲Lv5
            {type = 12, destId = 1539, srcId = 1538, decValue = 210, addValue = 195}, -- \\给予：神装★祖龙甲LvMax，消耗：神装★祖龙甲Lv6
            {type = 12, destId = 0, srcId = 1539, decValue = 0, addValue = 210}, -- \\分解神装★祖龙甲LvMax
            {type = 12, destId = 1540, srcId = 1532, decValue = 120, addValue = 105}, -- \\给予：神装★祖龙衣Lv1，消耗：神装★屠龙衣LvMax
            {type = 12, destId = 1541, srcId = 1540, decValue = 135, addValue = 120}, -- \\给予：神装★祖龙衣Lv2，消耗：神装★祖龙衣Lv1
            {type = 12, destId = 1542, srcId = 1541, decValue = 150, addValue = 135}, -- \\给予：神装★祖龙衣Lv3，消耗：神装★祖龙衣Lv2
            {type = 12, destId = 1543, srcId = 1542, decValue = 165, addValue = 150}, -- \\给予：神装★祖龙衣Lv4，消耗：神装★祖龙衣Lv3
            {type = 12, destId = 1544, srcId = 1543, decValue = 180, addValue = 165}, -- \\给予：神装★祖龙衣Lv5，消耗：神装★祖龙衣Lv4
            {type = 12, destId = 1545, srcId = 1544, decValue = 195, addValue = 180}, -- \\给予：神装★祖龙衣Lv6，消耗：神装★祖龙衣Lv5
            {type = 12, destId = 1546, srcId = 1545, decValue = 210, addValue = 195}, -- \\给予：神装★祖龙衣LvMax，消耗：神装★祖龙衣Lv6
            {type = 12, destId = 0, srcId = 1546, decValue = 0, addValue = 210}, -- \\分解神装★祖龙衣LvMax

            {type = 40, destId = 2168, srcId = 2162, decValue = 6, addValue = 3}, -- \\给予：神装★屠龙法盔Lv2，消耗：神装★屠龙法盔Lv1
            {type = 41, destId = 2169, srcId = 2163, decValue = 6, addValue = 3}, -- \\给予：神装★屠龙法链Lv2，消耗：神装★屠龙法链Lv1
            {type = 42, destId = 2170, srcId = 2164, decValue = 6, addValue = 3}, -- \\给予：神装★屠龙法镯Lv2，消耗：神装★屠龙法镯Lv1
            {type = 44, destId = 2171, srcId = 2165, decValue = 6, addValue = 3}, -- \\给予：神装★屠龙法戒Lv2，消耗：神装★屠龙法戒Lv1
            {type = 46, destId = 2172, srcId = 2166, decValue = 6, addValue = 3}, -- \\给予：神装★屠龙法带Lv2，消耗：神装★屠龙法带Lv1
            {type = 47, destId = 2173, srcId = 2167, decValue = 6, addValue = 3}, -- \\给予：神装★屠龙法靴Lv2，消耗：神装★屠龙法靴Lv1
            {type = 40, destId = 2174, srcId = 2168, decValue = 9, addValue = 6}, -- \\给予：神装★屠龙法盔Lv3，消耗：神装★屠龙法盔Lv2
            {type = 41, destId = 2175, srcId = 2169, decValue = 9, addValue = 6}, -- \\给予：神装★屠龙法链Lv3，消耗：神装★屠龙法链Lv2
            {type = 42, destId = 2176, srcId = 2170, decValue = 9, addValue = 6}, -- \\给予：神装★屠龙法镯Lv3，消耗：神装★屠龙法镯Lv2
            {type = 44, destId = 2177, srcId = 2171, decValue = 9, addValue = 6}, -- \\给予：神装★屠龙法戒Lv3，消耗：神装★屠龙法戒Lv2
            {type = 46, destId = 2178, srcId = 2172, decValue = 9, addValue = 6}, -- \\给予：神装★屠龙法带Lv3，消耗：神装★屠龙法带Lv2
            {type = 47, destId = 2179, srcId = 2173, decValue = 9, addValue = 6}, -- \\给予：神装★屠龙法靴Lv3，消耗：神装★屠龙法靴Lv2
            {type = 40, destId = 2180, srcId = 2174, decValue = 12, addValue = 9}, -- \\给予：神装★屠龙法盔Lv4，消耗：神装★屠龙法盔Lv3
            {type = 41, destId = 2181, srcId = 2175, decValue = 12, addValue = 9}, -- \\给予：神装★屠龙法链Lv4，消耗：神装★屠龙法链Lv3
            {type = 42, destId = 2182, srcId = 2176, decValue = 12, addValue = 9}, -- \\给予：神装★屠龙法镯Lv4，消耗：神装★屠龙法镯Lv3
            {type = 44, destId = 2183, srcId = 2177, decValue = 12, addValue = 9}, -- \\给予：神装★屠龙法戒Lv4，消耗：神装★屠龙法戒Lv3
            {type = 46, destId = 2184, srcId = 2178, decValue = 12, addValue = 9}, -- \\给予：神装★屠龙法带Lv4，消耗：神装★屠龙法带Lv3
            {type = 47, destId = 2185, srcId = 2179, decValue = 12, addValue = 9}, -- \\给予：神装★屠龙法靴Lv4，消耗：神装★屠龙法靴Lv3
            {type = 40, destId = 2186, srcId = 2180, decValue = 15, addValue = 12}, -- \\给予：神装★屠龙法盔Lv5，消耗：神装★屠龙法盔Lv4
            {type = 41, destId = 2187, srcId = 2181, decValue = 15, addValue = 12}, -- \\给予：神装★屠龙法链Lv5，消耗：神装★屠龙法链Lv4
            {type = 42, destId = 2188, srcId = 2182, decValue = 15, addValue = 12}, -- \\给予：神装★屠龙法镯Lv5，消耗：神装★屠龙法镯Lv4
            {type = 44, destId = 2189, srcId = 2183, decValue = 15, addValue = 12}, -- \\给予：神装★屠龙法戒Lv5，消耗：神装★屠龙法戒Lv4
            {type = 46, destId = 2190, srcId = 2184, decValue = 15, addValue = 12}, -- \\给予：神装★屠龙法带Lv5，消耗：神装★屠龙法带Lv4
            {type = 47, destId = 2191, srcId = 2185, decValue = 15, addValue = 12}, -- \\给予：神装★屠龙法靴Lv5，消耗：神装★屠龙法靴Lv4
            {type = 40, destId = 2192, srcId = 2186, decValue = 18, addValue = 15}, -- \\给予：神装★屠龙法盔Lv6，消耗：神装★屠龙法盔Lv5
            {type = 41, destId = 2193, srcId = 2187, decValue = 18, addValue = 15}, -- \\给予：神装★屠龙法链Lv6，消耗：神装★屠龙法链Lv5
            {type = 42, destId = 2194, srcId = 2188, decValue = 18, addValue = 15}, -- \\给予：神装★屠龙法镯Lv6，消耗：神装★屠龙法镯Lv5
            {type = 44, destId = 2195, srcId = 2189, decValue = 18, addValue = 15}, -- \\给予：神装★屠龙法戒Lv6，消耗：神装★屠龙法戒Lv5
            {type = 46, destId = 2196, srcId = 2190, decValue = 18, addValue = 15}, -- \\给予：神装★屠龙法带Lv6，消耗：神装★屠龙法带Lv5
            {type = 47, destId = 2197, srcId = 2191, decValue = 18, addValue = 15}, -- \\给予：神装★屠龙法靴Lv6，消耗：神装★屠龙法靴Lv5
            {type = 40, destId = 2198, srcId = 2192, decValue = 21, addValue = 18}, -- \\给予：神装★屠龙法盔LvMax，消耗：神装★屠龙法盔Lv6
            {type = 41, destId = 2199, srcId = 2193, decValue = 21, addValue = 18}, -- \\给予：神装★屠龙法链LvMax，消耗：神装★屠龙法链Lv6
            {type = 42, destId = 2200, srcId = 2194, decValue = 21, addValue = 18}, -- \\给予：神装★屠龙法镯LvMax，消耗：神装★屠龙法镯Lv6
            {type = 44, destId = 2201, srcId = 2195, decValue = 21, addValue = 18}, -- \\给予：神装★屠龙法戒LvMax，消耗：神装★屠龙法戒Lv6
            {type = 46, destId = 2202, srcId = 2196, decValue = 21, addValue = 18}, -- \\给予：神装★屠龙法带LvMax，消耗：神装★屠龙法带Lv6
            {type = 47, destId = 2203, srcId = 2197, decValue = 21, addValue = 18}, -- \\给予：神装★屠龙法靴LvMax，消耗：神装★屠龙法靴Lv6

            {type = 40, destId = 2288, srcId = 2198, decValue = 25, addValue = 21}, -- \\给予：神装★祖龙法盔Lv1，消耗：神装★屠龙法盔LvMax
            {type = 41, destId = 2289, srcId = 2199, decValue = 25, addValue = 21}, -- \\给予：神装★祖龙法链Lv1，消耗：神装★屠龙法链LvMax
            {type = 42, destId = 2290, srcId = 2200, decValue = 25, addValue = 21}, -- \\给予：神装★祖龙法镯Lv1，消耗：神装★屠龙法镯LvMax
            {type = 44, destId = 2291, srcId = 2201, decValue = 25, addValue = 21}, -- \\给予：神装★祖龙法戒Lv1，消耗：神装★屠龙法戒LvMax
            {type = 46, destId = 2292, srcId = 2202, decValue = 25, addValue = 21}, -- \\给予：神装★祖龙法带Lv1，消耗：神装★屠龙法带LvMax
            {type = 47, destId = 2293, srcId = 2203, decValue = 25, addValue = 21}, -- \\给予：神装★祖龙法靴Lv1，消耗：神装★屠龙法靴LvMax
            {type = 40, destId = 2294, srcId = 2288, decValue = 30, addValue = 25}, -- \\给予：神装★祖龙法盔Lv2，消耗：神装★祖龙法盔Lv1
            {type = 41, destId = 2295, srcId = 2289, decValue = 30, addValue = 25}, -- \\给予：神装★祖龙法链Lv2，消耗：神装★祖龙法链Lv1
            {type = 42, destId = 2296, srcId = 2290, decValue = 30, addValue = 25}, -- \\给予：神装★祖龙法镯Lv2，消耗：神装★祖龙法镯Lv1
            {type = 44, destId = 2297, srcId = 2291, decValue = 30, addValue = 25}, -- \\给予：神装★祖龙法戒Lv2，消耗：神装★祖龙法戒Lv1
            {type = 46, destId = 2298, srcId = 2292, decValue = 30, addValue = 25}, -- \\给予：神装★祖龙法带Lv2，消耗：神装★祖龙法带Lv1
            {type = 47, destId = 2299, srcId = 2293, decValue = 30, addValue = 25}, -- \\给予：神装★祖龙法靴Lv2，消耗：神装★祖龙法靴Lv1
            {type = 40, destId = 2300, srcId = 2294, decValue = 35, addValue = 30}, -- \\给予：神装★祖龙法盔Lv3，消耗：神装★祖龙法盔Lv2
            {type = 41, destId = 2301, srcId = 2295, decValue = 35, addValue = 30}, -- \\给予：神装★祖龙法链Lv3，消耗：神装★祖龙法链Lv2
            {type = 42, destId = 2302, srcId = 2296, decValue = 35, addValue = 30}, -- \\给予：神装★祖龙法镯Lv3，消耗：神装★祖龙法镯Lv2
            {type = 44, destId = 2303, srcId = 2297, decValue = 35, addValue = 30}, -- \\给予：神装★祖龙法戒Lv3，消耗：神装★祖龙法戒Lv2
            {type = 46, destId = 2304, srcId = 2298, decValue = 35, addValue = 30}, -- \\给予：神装★祖龙法带Lv3，消耗：神装★祖龙法带Lv2
            {type = 47, destId = 2305, srcId = 2299, decValue = 35, addValue = 30}, -- \\给予：神装★祖龙法靴Lv3，消耗：神装★祖龙法靴Lv2
            {type = 40, destId = 2306, srcId = 2300, decValue = 40, addValue = 35}, -- \\给予：神装★祖龙法盔Lv4，消耗：神装★祖龙法盔Lv3
            {type = 41, destId = 2307, srcId = 2301, decValue = 40, addValue = 35}, -- \\给予：神装★祖龙法链Lv4，消耗：神装★祖龙法链Lv3
            {type = 42, destId = 2308, srcId = 2302, decValue = 40, addValue = 35}, -- \\给予：神装★祖龙法镯Lv4，消耗：神装★祖龙法镯Lv3
            {type = 44, destId = 2309, srcId = 2303, decValue = 40, addValue = 35}, -- \\给予：神装★祖龙法戒Lv4，消耗：神装★祖龙法戒Lv3
            {type = 46, destId = 2310, srcId = 2304, decValue = 40, addValue = 35}, -- \\给予：神装★祖龙法带Lv4，消耗：神装★祖龙法带Lv3
            {type = 47, destId = 2311, srcId = 2305, decValue = 40, addValue = 35}, -- \\给予：神装★祖龙法靴Lv4，消耗：神装★祖龙法靴Lv3
            {type = 40, destId = 2312, srcId = 2306, decValue = 45, addValue = 40}, -- \\给予：神装★祖龙法盔Lv5，消耗：神装★祖龙法盔Lv4
            {type = 41, destId = 2313, srcId = 2307, decValue = 45, addValue = 40}, -- \\给予：神装★祖龙法链Lv5，消耗：神装★祖龙法链Lv4
            {type = 42, destId = 2314, srcId = 2308, decValue = 45, addValue = 40}, -- \\给予：神装★祖龙法镯Lv5，消耗：神装★祖龙法镯Lv4
            {type = 44, destId = 2315, srcId = 2309, decValue = 45, addValue = 40}, -- \\给予：神装★祖龙法戒Lv5，消耗：神装★祖龙法戒Lv4
            {type = 46, destId = 2316, srcId = 2310, decValue = 45, addValue = 40}, -- \\给予：神装★祖龙法带Lv5，消耗：神装★祖龙法带Lv4
            {type = 47, destId = 2317, srcId = 2311, decValue = 45, addValue = 40}, -- \\给予：神装★祖龙法靴Lv5，消耗：神装★祖龙法靴Lv4
            {type = 40, destId = 2318, srcId = 2312, decValue = 50, addValue = 45}, -- \\给予：神装★祖龙法盔Lv6，消耗：神装★祖龙法盔Lv5
            {type = 41, destId = 2319, srcId = 2313, decValue = 50, addValue = 45}, -- \\给予：神装★祖龙法链Lv6，消耗：神装★祖龙法链Lv5
            {type = 42, destId = 2320, srcId = 2314, decValue = 50, addValue = 45}, -- \\给予：神装★祖龙法镯Lv6，消耗：神装★祖龙法镯Lv5
            {type = 44, destId = 2321, srcId = 2315, decValue = 50, addValue = 45}, -- \\给予：神装★祖龙法戒Lv6，消耗：神装★祖龙法戒Lv5
            {type = 46, destId = 2322, srcId = 2316, decValue = 50, addValue = 45}, -- \\给予：神装★祖龙法带Lv6，消耗：神装★祖龙法带Lv5
            {type = 47, destId = 2323, srcId = 2317, decValue = 50, addValue = 45}, -- \\给予：神装★祖龙法靴Lv6，消耗：神装★祖龙法靴Lv5
            {type = 40, destId = 2324, srcId = 2318, decValue = 55, addValue = 50}, -- \\给予：神装★祖龙法盔LvMax，消耗：神装★祖龙法盔Lv6
            {type = 41, destId = 2325, srcId = 2319, decValue = 55, addValue = 50}, -- \\给予：神装★祖龙法链LvMax，消耗：神装★祖龙法链Lv6
            {type = 42, destId = 2326, srcId = 2320, decValue = 55, addValue = 50}, -- \\给予：神装★祖龙法镯LvMax，消耗：神装★祖龙法镯Lv6
            {type = 44, destId = 2327, srcId = 2321, decValue = 55, addValue = 50}, -- \\给予：神装★祖龙法戒LvMax，消耗：神装★祖龙法戒Lv6
            {type = 46, destId = 2328, srcId = 2322, decValue = 55, addValue = 50}, -- \\给予：神装★祖龙法带LvMax，消耗：神装★祖龙法带Lv6
            {type = 47, destId = 2329, srcId = 2323, decValue = 55, addValue = 50}, -- \\给予：神装★祖龙法靴LvMax，消耗：神装★祖龙法靴Lv6
            {type = 40, destId = 0, srcId = 2324, decValue = 0, addValue = 55}, -- \\分解神装★祖龙法盔LvMax，消耗：神装★祖龙法盔Lv6
            {type = 41, destId = 0, srcId = 2325, decValue = 0, addValue = 55}, -- \\分解神装★祖龙法链LvMax，消耗：神装★祖龙法链Lv6
            {type = 42, destId = 0, srcId = 2326, decValue = 0, addValue = 55}, -- \\分解神装★祖龙法镯LvMax，消耗：神装★祖龙法镯Lv6
            {type = 44, destId = 0, srcId = 2327, decValue = 0, addValue = 55}, -- \\分解神装★祖龙法戒LvMax，消耗：神装★祖龙法戒Lv6
            {type = 46, destId = 0, srcId = 2328, decValue = 0, addValue = 55}, -- \\分解神装★祖龙法带LvMax，消耗：神装★祖龙法带Lv6
            {type = 47, destId = 0, srcId = 2329, decValue = 0, addValue = 55}, -- \\分解神装★祖龙法靴LvMax，消耗：神装★祖龙法靴Lv6

        },
        --道士
        {
            {type = 14, destId = 58, srcId = 303, decValue = 30, addValue = 6}, -- \\给予：神装★屠龙霸刀Lv2，消耗：神装★屠龙霸刀Lv1
            {type = 14, destId = 59, srcId = 58, decValue = 45, addValue = 30}, -- \\给予：神装★屠龙霸刀Lv3，消耗：神装★屠龙霸刀Lv2
            {type = 14, destId = 60, srcId = 59, decValue = 60, addValue = 45}, -- \\给予：神装★屠龙霸刀Lv4，消耗：神装★屠龙霸刀Lv3
            {type = 14, destId = 61, srcId = 60, decValue = 75, addValue = 60}, -- \\给予：神装★屠龙霸刀Lv5，消耗：神装★屠龙霸刀Lv4
            {type = 14, destId = 62, srcId = 61, decValue = 90, addValue = 75}, -- \\给予：神装★屠龙霸刀Lv6，消耗：神装★屠龙霸刀Lv5
            {type = 14, destId = 63, srcId = 62, decValue = 105, addValue = 90}, -- \\给予：神装★屠龙霸刀LvMax，消耗：神装★屠龙霸刀Lv6
            {type = 14, destId = 1484, srcId = 63, decValue = 120, addValue = 105}, -- \\给予：神装★祖龙之身Lv1，消耗：神装★屠龙霸刀LvMax
            {type = 14, destId = 1485, srcId = 1484, decValue = 135, addValue = 120}, -- \\给予：神装★祖龙之身Lv2，消耗：神装★祖龙之身Lv1
            {type = 14, destId = 1486, srcId = 1485, decValue = 150, addValue = 135}, -- \\给予：神装★祖龙之身Lv3，消耗：神装★祖龙之身Lv2
            {type = 14, destId = 1487, srcId = 1486, decValue = 165, addValue = 150}, -- \\给予：神装★祖龙之身Lv4，消耗：神装★祖龙之身Lv3
            {type = 14, destId = 1488, srcId = 1487, decValue = 180, addValue = 165}, -- \\给予：神装★祖龙之身Lv5，消耗：神装★祖龙之身Lv4
            {type = 14, destId = 1489, srcId = 1488, decValue = 195, addValue = 180}, -- \\给予：神装★祖龙之身Lv6，消耗：神装★祖龙之身Lv5
            {type = 14, destId = 1490, srcId = 1489, decValue = 210, addValue = 195}, -- \\给予：神装★祖龙之身LvMax，消耗：神装★祖龙之身Lv6
            {type = 14, destId = 0, srcId = 1490, decValue = 0, addValue = 210}, -- \\分解神装★祖龙之身LvMax
            {type = 12, destId = 1520, srcId = 1519, decValue = 30, addValue = 6}, -- \\给予：神装★屠龙甲Lv2，消耗：神装★屠龙甲Lv1
            {type = 12, destId = 1521, srcId = 1520, decValue = 45, addValue = 30}, -- \\给予：神装★屠龙甲Lv3，消耗：神装★屠龙甲Lv2
            {type = 12, destId = 1522, srcId = 1521, decValue = 60, addValue = 45}, -- \\给予：神装★屠龙甲Lv4，消耗：神装★屠龙甲Lv3
            {type = 12, destId = 1523, srcId = 1522, decValue = 75, addValue = 60}, -- \\给予：神装★屠龙甲Lv5，消耗：神装★屠龙甲Lv4
            {type = 12, destId = 1524, srcId = 1523, decValue = 90, addValue = 75}, -- \\给予：神装★屠龙甲Lv6，消耗：神装★屠龙甲Lv5
            {type = 12, destId = 1525, srcId = 1524, decValue = 105, addValue = 90}, -- \\给予：神装★屠龙甲LvMax，消耗：神装★屠龙甲Lv6
            {type = 12, destId = 1527, srcId = 1526, decValue = 30, addValue = 6}, -- \\给予：神装★屠龙衣Lv2，消耗：神装★屠龙衣Lv1
            {type = 12, destId = 1528, srcId = 1527, decValue = 45, addValue = 30}, -- \\给予：神装★屠龙衣Lv3，消耗：神装★屠龙衣Lv2
            {type = 12, destId = 1529, srcId = 1528, decValue = 60, addValue = 45}, -- \\给予：神装★屠龙衣Lv4，消耗：神装★屠龙衣Lv3
            {type = 12, destId = 1530, srcId = 1529, decValue = 75, addValue = 60}, -- \\给予：神装★屠龙衣Lv5，消耗：神装★屠龙衣Lv4
            {type = 12, destId = 1531, srcId = 1530, decValue = 90, addValue = 75}, -- \\给予：神装★屠龙衣Lv6，消耗：神装★屠龙衣Lv5
            {type = 12, destId = 1532, srcId = 1531, decValue = 105, addValue = 90}, -- \\给予：神装★屠龙衣LvMax，消耗：神装★屠龙衣Lv6
            {type = 12, destId = 1533, srcId = 1525, decValue = 120, addValue = 105}, -- \\给予：神装★祖龙甲Lv1，消耗：神装★屠龙甲LvMax
            {type = 12, destId = 1534, srcId = 1533, decValue = 135, addValue = 120}, -- \\给予：神装★祖龙甲Lv2，消耗：神装★祖龙甲Lv1
            {type = 12, destId = 1535, srcId = 1534, decValue = 150, addValue = 135}, -- \\给予：神装★祖龙甲Lv3，消耗：神装★祖龙甲Lv2
            {type = 12, destId = 1536, srcId = 1535, decValue = 165, addValue = 150}, -- \\给予：神装★祖龙甲Lv4，消耗：神装★祖龙甲Lv3
            {type = 12, destId = 1537, srcId = 1536, decValue = 180, addValue = 165}, -- \\给予：神装★祖龙甲Lv5，消耗：神装★祖龙甲Lv4
            {type = 12, destId = 1538, srcId = 1537, decValue = 195, addValue = 180}, -- \\给予：神装★祖龙甲Lv6，消耗：神装★祖龙甲Lv5
            {type = 12, destId = 1539, srcId = 1538, decValue = 210, addValue = 195}, -- \\给予：神装★祖龙甲LvMax，消耗：神装★祖龙甲Lv6
            {type = 12, destId = 0, srcId = 1539, decValue = 0, addValue = 210}, -- \\分解神装★祖龙甲LvMax
            {type = 12, destId = 1540, srcId = 1532, decValue = 120, addValue = 105}, -- \\给予：神装★祖龙衣Lv1，消耗：神装★屠龙衣LvMax
            {type = 12, destId = 1541, srcId = 1540, decValue = 135, addValue = 120}, -- \\给予：神装★祖龙衣Lv2，消耗：神装★祖龙衣Lv1
            {type = 12, destId = 1542, srcId = 1541, decValue = 150, addValue = 135}, -- \\给予：神装★祖龙衣Lv3，消耗：神装★祖龙衣Lv2
            {type = 12, destId = 1543, srcId = 1542, decValue = 165, addValue = 150}, -- \\给予：神装★祖龙衣Lv4，消耗：神装★祖龙衣Lv3
            {type = 12, destId = 1544, srcId = 1543, decValue = 180, addValue = 165}, -- \\给予：神装★祖龙衣Lv5，消耗：神装★祖龙衣Lv4
            {type = 12, destId = 1545, srcId = 1544, decValue = 195, addValue = 180}, -- \\给予：神装★祖龙衣Lv6，消耗：神装★祖龙衣Lv5
            {type = 12, destId = 1546, srcId = 1545, decValue = 210, addValue = 195}, -- \\给予：神装★祖龙衣LvMax，消耗：神装★祖龙衣Lv6
            {type = 12, destId = 0, srcId = 1546, decValue = 0, addValue = 210}, -- \\分解神装★祖龙衣LvMax

            {type = 40, destId = 2210, srcId = 2204, decValue = 6, addValue = 3}, -- \\给予：神装★屠龙道盔Lv2，消耗：神装★屠龙道盔Lv1
            {type = 41, destId = 2211, srcId = 2205, decValue = 6, addValue = 3}, -- \\给予：神装★屠龙道链Lv2，消耗：神装★屠龙道链Lv1
            {type = 42, destId = 2212, srcId = 2206, decValue = 6, addValue = 3}, -- \\给予：神装★屠龙道镯Lv2，消耗：神装★屠龙道镯Lv1
            {type = 44, destId = 2213, srcId = 2207, decValue = 6, addValue = 3}, -- \\给予：神装★屠龙道戒Lv2，消耗：神装★屠龙道戒Lv1
            {type = 46, destId = 2214, srcId = 2208, decValue = 6, addValue = 3}, -- \\给予：神装★屠龙道带Lv2，消耗：神装★屠龙道带Lv1
            {type = 47, destId = 2215, srcId = 2209, decValue = 6, addValue = 3}, -- \\给予：神装★屠龙道靴Lv2，消耗：神装★屠龙道靴Lv1
            {type = 40, destId = 2216, srcId = 2210, decValue = 9, addValue = 6}, -- \\给予：神装★屠龙道盔Lv3，消耗：神装★屠龙道盔Lv2
            {type = 41, destId = 2217, srcId = 2211, decValue = 9, addValue = 6}, -- \\给予：神装★屠龙道链Lv3，消耗：神装★屠龙道链Lv2
            {type = 42, destId = 2218, srcId = 2212, decValue = 9, addValue = 6}, -- \\给予：神装★屠龙道镯Lv3，消耗：神装★屠龙道镯Lv2
            {type = 44, destId = 2219, srcId = 2213, decValue = 9, addValue = 6}, -- \\给予：神装★屠龙道戒Lv3，消耗：神装★屠龙道戒Lv2
            {type = 46, destId = 2220, srcId = 2214, decValue = 9, addValue = 6}, -- \\给予：神装★屠龙道带Lv3，消耗：神装★屠龙道带Lv2
            {type = 47, destId = 2221, srcId = 2215, decValue = 9, addValue = 6}, -- \\给予：神装★屠龙道靴Lv3，消耗：神装★屠龙道靴Lv2
            {type = 40, destId = 2222, srcId = 2216, decValue = 12, addValue = 9}, -- \\给予：神装★屠龙道盔Lv4，消耗：神装★屠龙道盔Lv3
            {type = 41, destId = 2223, srcId = 2217, decValue = 12, addValue = 9}, -- \\给予：神装★屠龙道链Lv4，消耗：神装★屠龙道链Lv3
            {type = 42, destId = 2224, srcId = 2218, decValue = 12, addValue = 9}, -- \\给予：神装★屠龙道镯Lv4，消耗：神装★屠龙道镯Lv3
            {type = 44, destId = 2225, srcId = 2219, decValue = 12, addValue = 9}, -- \\给予：神装★屠龙道戒Lv4，消耗：神装★屠龙道戒Lv3
            {type = 46, destId = 2226, srcId = 2220, decValue = 12, addValue = 9}, -- \\给予：神装★屠龙道带Lv4，消耗：神装★屠龙道带Lv3
            {type = 47, destId = 2227, srcId = 2221, decValue = 12, addValue = 9}, -- \\给予：神装★屠龙道靴Lv4，消耗：神装★屠龙道靴Lv3
            {type = 40, destId = 2228, srcId = 2222, decValue = 15, addValue = 12}, -- \\给予：神装★屠龙道盔Lv5，消耗：神装★屠龙道盔Lv4
            {type = 41, destId = 2229, srcId = 2223, decValue = 15, addValue = 12}, -- \\给予：神装★屠龙道链Lv5，消耗：神装★屠龙道链Lv4
            {type = 42, destId = 2230, srcId = 2224, decValue = 15, addValue = 12}, -- \\给予：神装★屠龙道镯Lv5，消耗：神装★屠龙道镯Lv4
            {type = 44, destId = 2231, srcId = 2225, decValue = 15, addValue = 12}, -- \\给予：神装★屠龙道戒Lv5，消耗：神装★屠龙道戒Lv4
            {type = 46, destId = 2232, srcId = 2226, decValue = 15, addValue = 12}, -- \\给予：神装★屠龙道带Lv5，消耗：神装★屠龙道带Lv4
            {type = 47, destId = 2233, srcId = 2227, decValue = 15, addValue = 12}, -- \\给予：神装★屠龙道靴Lv5，消耗：神装★屠龙道靴Lv4
            {type = 40, destId = 2234, srcId = 2228, decValue = 18, addValue = 15}, -- \\给予：神装★屠龙道盔Lv6，消耗：神装★屠龙道盔Lv5
            {type = 41, destId = 2235, srcId = 2229, decValue = 18, addValue = 15}, -- \\给予：神装★屠龙道链Lv6，消耗：神装★屠龙道链Lv5
            {type = 42, destId = 2236, srcId = 2230, decValue = 18, addValue = 15}, -- \\给予：神装★屠龙道镯Lv6，消耗：神装★屠龙道镯Lv5
            {type = 44, destId = 2237, srcId = 2231, decValue = 18, addValue = 15}, -- \\给予：神装★屠龙道戒Lv6，消耗：神装★屠龙道戒Lv5
            {type = 46, destId = 2238, srcId = 2232, decValue = 18, addValue = 15}, -- \\给予：神装★屠龙道带Lv6，消耗：神装★屠龙道带Lv5
            {type = 47, destId = 2239, srcId = 2233, decValue = 18, addValue = 15}, -- \\给予：神装★屠龙道靴Lv6，消耗：神装★屠龙道靴Lv5
            {type = 40, destId = 2240, srcId = 2234, decValue = 21, addValue = 18}, -- \\给予：神装★屠龙道盔LvMax，消耗：神装★屠龙道盔Lv6
            {type = 41, destId = 2241, srcId = 2235, decValue = 21, addValue = 18}, -- \\给予：神装★屠龙道链LvMax，消耗：神装★屠龙道链Lv6
            {type = 42, destId = 2242, srcId = 2236, decValue = 21, addValue = 18}, -- \\给予：神装★屠龙道镯LvMax，消耗：神装★屠龙道镯Lv6
            {type = 44, destId = 2243, srcId = 2237, decValue = 21, addValue = 18}, -- \\给予：神装★屠龙道戒LvMax，消耗：神装★屠龙道戒Lv6
            {type = 46, destId = 2244, srcId = 2238, decValue = 21, addValue = 18}, -- \\给予：神装★屠龙道带LvMax，消耗：神装★屠龙道带Lv6
            {type = 47, destId = 2245, srcId = 2239, decValue = 21, addValue = 18}, -- \\给予：神装★屠龙道靴LvMax，消耗：神装★屠龙道靴Lv6

            {type = 40, destId = 2330, srcId = 2240, decValue = 25, addValue = 21}, -- \\给予：神装★祖龙道盔Lv1，消耗：神装★屠龙道盔LvMax
            {type = 41, destId = 2331, srcId = 2241, decValue = 25, addValue = 21}, -- \\给予：神装★祖龙道链Lv1，消耗：神装★屠龙道链LvMax
            {type = 42, destId = 2332, srcId = 2242, decValue = 25, addValue = 21}, -- \\给予：神装★祖龙道镯Lv1，消耗：神装★屠龙道镯LvMax
            {type = 44, destId = 2333, srcId = 2243, decValue = 25, addValue = 21}, -- \\给予：神装★祖龙道戒Lv1，消耗：神装★屠龙道戒LvMax
            {type = 46, destId = 2334, srcId = 2244, decValue = 25, addValue = 21}, -- \\给予：神装★祖龙道带Lv1，消耗：神装★屠龙道带LvMax
            {type = 47, destId = 2335, srcId = 2245, decValue = 25, addValue = 21}, -- \\给予：神装★祖龙道靴Lv1，消耗：神装★屠龙道靴LvMax
            {type = 40, destId = 2336, srcId = 2330, decValue = 30, addValue = 25}, -- \\给予：神装★祖龙道盔Lv2，消耗：神装★祖龙道盔Lv1
            {type = 41, destId = 2337, srcId = 2331, decValue = 30, addValue = 25}, -- \\给予：神装★祖龙道链Lv2，消耗：神装★祖龙道链Lv1
            {type = 42, destId = 2338, srcId = 2332, decValue = 30, addValue = 25}, -- \\给予：神装★祖龙道镯Lv2，消耗：神装★祖龙道镯Lv1
            {type = 44, destId = 2339, srcId = 2333, decValue = 30, addValue = 25}, -- \\给予：神装★祖龙道戒Lv2，消耗：神装★祖龙道戒Lv1
            {type = 46, destId = 2340, srcId = 2334, decValue = 30, addValue = 25}, -- \\给予：神装★祖龙道带Lv2，消耗：神装★祖龙道带Lv1
            {type = 47, destId = 2341, srcId = 2335, decValue = 30, addValue = 25}, -- \\给予：神装★祖龙道靴Lv2，消耗：神装★祖龙道靴Lv1
            {type = 40, destId = 2342, srcId = 2336, decValue = 35, addValue = 30}, -- \\给予：神装★祖龙道盔Lv3，消耗：神装★祖龙道盔Lv2
            {type = 41, destId = 2343, srcId = 2337, decValue = 35, addValue = 30}, -- \\给予：神装★祖龙道链Lv3，消耗：神装★祖龙道链Lv2
            {type = 42, destId = 2344, srcId = 2338, decValue = 35, addValue = 30}, -- \\给予：神装★祖龙道镯Lv3，消耗：神装★祖龙道镯Lv2
            {type = 44, destId = 2345, srcId = 2339, decValue = 35, addValue = 30}, -- \\给予：神装★祖龙道戒Lv3，消耗：神装★祖龙道戒Lv2
            {type = 46, destId = 2346, srcId = 2340, decValue = 35, addValue = 30}, -- \\给予：神装★祖龙道带Lv3，消耗：神装★祖龙道带Lv2
            {type = 47, destId = 2347, srcId = 2341, decValue = 35, addValue = 30}, -- \\给予：神装★祖龙道靴Lv3，消耗：神装★祖龙道靴Lv2
            {type = 40, destId = 2348, srcId = 2342, decValue = 40, addValue = 35}, -- \\给予：神装★祖龙道盔Lv4，消耗：神装★祖龙道盔Lv3
            {type = 41, destId = 2349, srcId = 2343, decValue = 40, addValue = 35}, -- \\给予：神装★祖龙道链Lv4，消耗：神装★祖龙道链Lv3
            {type = 42, destId = 2350, srcId = 2344, decValue = 40, addValue = 35}, -- \\给予：神装★祖龙道镯Lv4，消耗：神装★祖龙道镯Lv3
            {type = 44, destId = 2351, srcId = 2345, decValue = 40, addValue = 35}, -- \\给予：神装★祖龙道戒Lv4，消耗：神装★祖龙道戒Lv3
            {type = 46, destId = 2352, srcId = 2346, decValue = 40, addValue = 35}, -- \\给予：神装★祖龙道带Lv4，消耗：神装★祖龙道带Lv3
            {type = 47, destId = 2353, srcId = 2347, decValue = 40, addValue = 35}, -- \\给予：神装★祖龙道靴Lv4，消耗：神装★祖龙道靴Lv3
            {type = 40, destId = 2354, srcId = 2348, decValue = 45, addValue = 40}, -- \\给予：神装★祖龙道盔Lv5，消耗：神装★祖龙道盔Lv4
            {type = 41, destId = 2355, srcId = 2349, decValue = 45, addValue = 40}, -- \\给予：神装★祖龙道链Lv5，消耗：神装★祖龙道链Lv4
            {type = 42, destId = 2356, srcId = 2350, decValue = 45, addValue = 40}, -- \\给予：神装★祖龙道镯Lv5，消耗：神装★祖龙道镯Lv4
            {type = 44, destId = 2357, srcId = 2351, decValue = 45, addValue = 40}, -- \\给予：神装★祖龙道戒Lv5，消耗：神装★祖龙道戒Lv4
            {type = 46, destId = 2358, srcId = 2352, decValue = 45, addValue = 40}, -- \\给予：神装★祖龙道带Lv5，消耗：神装★祖龙道带Lv4
            {type = 47, destId = 2359, srcId = 2353, decValue = 45, addValue = 40}, -- \\给予：神装★祖龙道靴Lv5，消耗：神装★祖龙道靴Lv4
            {type = 40, destId = 2360, srcId = 2354, decValue = 50, addValue = 45}, -- \\给予：神装★祖龙道盔Lv6，消耗：神装★祖龙道盔Lv5
            {type = 41, destId = 2361, srcId = 2355, decValue = 50, addValue = 45}, -- \\给予：神装★祖龙道链Lv6，消耗：神装★祖龙道链Lv5
            {type = 42, destId = 2362, srcId = 2356, decValue = 50, addValue = 45}, -- \\给予：神装★祖龙道镯Lv6，消耗：神装★祖龙道镯Lv5
            {type = 44, destId = 2363, srcId = 2357, decValue = 50, addValue = 45}, -- \\给予：神装★祖龙道戒Lv6，消耗：神装★祖龙道戒Lv5
            {type = 46, destId = 2364, srcId = 2358, decValue = 50, addValue = 45}, -- \\给予：神装★祖龙道带Lv6，消耗：神装★祖龙道带Lv5
            {type = 47, destId = 2365, srcId = 2359, decValue = 50, addValue = 45}, -- \\给予：神装★祖龙道靴Lv6，消耗：神装★祖龙道靴Lv5
            {type = 40, destId = 2366, srcId = 2360, decValue = 55, addValue = 50}, -- \\给予：神装★祖龙道盔LvMax，消耗：神装★祖龙道盔Lv6
            {type = 41, destId = 2367, srcId = 2361, decValue = 55, addValue = 50}, -- \\给予：神装★祖龙道链LvMax，消耗：神装★祖龙道链Lv6
            {type = 42, destId = 2368, srcId = 2362, decValue = 55, addValue = 50}, -- \\给予：神装★祖龙道镯LvMax，消耗：神装★祖龙道镯Lv6
            {type = 44, destId = 2369, srcId = 2363, decValue = 55, addValue = 50}, -- \\给予：神装★祖龙道戒LvMax，消耗：神装★祖龙道戒Lv6
            {type = 46, destId = 2370, srcId = 2364, decValue = 55, addValue = 50}, -- \\给予：神装★祖龙道带LvMax，消耗：神装★祖龙道带Lv6
            {type = 47, destId = 2371, srcId = 2365, decValue = 55, addValue = 50}, -- \\给予：神装★祖龙道靴LvMax，消耗：神装★祖龙道靴Lv6
            {type = 40, destId = 0, srcId = 2366, decValue = 0, addValue = 55}, -- \\分解神装★祖龙道盔LvMax
            {type = 41, destId = 0, srcId = 2367, decValue = 0, addValue = 55}, -- \\分解神装★祖龙道链LvMax
            {type = 42, destId = 0, srcId = 2368, decValue = 0, addValue = 55}, -- \\分解神装★祖龙道镯LvMax
            {type = 44, destId = 0, srcId = 2369, decValue = 0, addValue = 55}, -- \\分解神装★祖龙道戒LvMax
            {type = 46, destId = 0, srcId = 2370, decValue = 0, addValue = 55}, -- \\分解神装★祖龙道带LvMax
            {type = 47, destId = 0, srcId = 2371, decValue = 0, addValue = 55}, -- \\分解神装★祖龙道靴LvMax

        },
    },
   --神装兑换
   ExChange = 
   {
        --战士 type=装备位置 destId=兑换道具id delValue=消耗圣魂值
        {

            {type = 14, destId = 303, decValue = 12}, -- \\给予：神装★屠龙霸刀Lv1
            {type = 12, destId = 1519, decValue = 12, sex = 0}, -- \\给予：神装★屠龙甲Lv1
            {type = 12, destId = 1526, decValue = 12, sex = 1}, -- \\给予：神装★屠龙衣Lv1
            {type = 40, destId = 2120, decValue = 6}, -- \\给予：神装★屠龙战盔Lv1
            {type = 41, destId = 2121, decValue = 6}, -- \\给予：神装★屠龙战链Lv1
            {type = 42, destId = 2122, decValue = 6}, -- \\给予：神装★屠龙战镯Lv1
            {type = 44, destId = 2123, decValue = 6}, -- \\给予：神装★屠龙战戒Lv1
            {type = 46, destId = 2124, decValue = 6}, -- \\给予：神装★屠龙战带Lv1
            {type = 47, destId = 2125, decValue = 6}, -- \\给予：神装★屠龙战靴Lv1


        },
        
       
        --法师
        {

            {type = 14, destId = 303, decValue = 12}, -- \\给予：神装★屠龙霸刀Lv1
            {type = 12, destId = 1519, decValue = 12, sex = 0}, -- \\给予：神装★屠龙甲Lv1
            {type = 12, destId = 1526, decValue = 12, sex = 1}, -- \\给予：神装★屠龙衣Lv1
            {type = 40, destId = 2162, decValue = 6}, -- \\给予：神装★屠龙法盔Lv1
            {type = 41, destId = 2163, decValue = 6}, -- \\给予：神装★屠龙法链Lv1
            {type = 42, destId = 2164, decValue = 6}, -- \\给予：神装★屠龙法镯Lv1
            {type = 44, destId = 2165, decValue = 6}, -- \\给予：神装★屠龙法戒Lv1
            {type = 46, destId = 2166, decValue = 6}, -- \\给予：神装★屠龙法带Lv1
            {type = 47, destId = 2167, decValue = 6}, -- \\给予：神装★屠龙法靴Lv1

        },
         --道士
        {

            {type = 14, destId = 303, decValue = 12}, -- \\给予：神装★屠龙霸刀Lv1
            {type = 12, destId = 1519, decValue = 12, sex = 0}, -- \\给予：神装★屠龙甲Lv1
            {type = 12, destId = 1526, decValue = 12, sex = 1}, -- \\给予：神装★屠龙衣Lv1
            {type = 40, destId = 2204, decValue = 6}, -- \\给予：神装★屠龙道盔Lv1
            {type = 41, destId = 2205, decValue = 6}, -- \\给予：神装★屠龙道链Lv1
            {type = 42, destId = 2206, decValue = 6}, -- \\给予：神装★屠龙道镯Lv1
            {type = 44, destId = 2207, decValue = 6}, -- \\给予：神装★屠龙道戒Lv1
            {type = 46, destId = 2208, decValue = 6}, -- \\给予：神装★屠龙道带Lv1
            {type = 47, destId = 2209, decValue = 6}, -- \\给予：神装★屠龙道靴Lv1

        },
            
   },
   
  
    ShengHunId = 457,
}