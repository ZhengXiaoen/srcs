--神装配置
--2017.04.08 00:34 zer 更新 添加第3套神装, 表格已经优化并更新 【散人传说】物品数据库.xls -- 神装兑换和升级
GodEquipConfig =
    {
        --神装升级 和分解
        UpLev =
        {
            
            --战士
            --type=道具类型, srcId=合成前id,destId=合成后id,decValue=升级消耗圣魂数量,addValue=分解获得圣魂数量
            {
                
                {type = 14, destId = 4748, srcId = 4747, decValue = 30, addValue = 6}, -- \\给予：神装★屠龙圣器Lv2，分解：神装★屠龙圣器Lv1
                {type = 14, destId = 4749, srcId = 4748, decValue = 45, addValue = 30}, -- \\给予：神装★屠龙圣器Lv3，分解：神装★屠龙圣器Lv2
                {type = 14, destId = 4750, srcId = 4749, decValue = 60, addValue = 45}, -- \\给予：神装★屠龙圣器Lv4，分解：神装★屠龙圣器Lv3
                {type = 14, destId = 4751, srcId = 4750, decValue = 75, addValue = 60}, -- \\给予：神装★屠龙圣器Lv5，分解：神装★屠龙圣器Lv4
                {type = 14, destId = 4752, srcId = 4751, decValue = 90, addValue = 75}, -- \\给予：神装★屠龙圣器Lv6，分解：神装★屠龙圣器Lv5
                {type = 14, destId = 4753, srcId = 4752, decValue = 105, addValue = 90}, -- \\给予：神装★屠龙圣器LvMax，分解：神装★屠龙圣器Lv6
                
                
                {type = 14, destId = 4768, srcId = 4753, decValue = 120, addValue = 105}, -- \\给予：神装★祖龙圣器Lv1，分解：神装★屠龙圣器LvMax
                {type = 14, destId = 4769, srcId = 4768, decValue = 135, addValue = 120}, -- \\给予：神装★祖龙圣器Lv2，分解：神装★祖龙圣器Lv1
                {type = 14, destId = 4770, srcId = 4769, decValue = 150, addValue = 135}, -- \\给予：神装★祖龙圣器Lv3，分解：神装★祖龙圣器Lv2
                {type = 14, destId = 4771, srcId = 4770, decValue = 165, addValue = 150}, -- \\给予：神装★祖龙圣器Lv4，分解：神装★祖龙圣器Lv3
                {type = 14, destId = 4772, srcId = 4771, decValue = 180, addValue = 165}, -- \\给予：神装★祖龙圣器Lv5，分解：神装★祖龙圣器Lv4
                {type = 14, destId = 4773, srcId = 4772, decValue = 195, addValue = 180}, -- \\给予：神装★祖龙圣器Lv6，分解：神装★祖龙圣器Lv5
                {type = 14, destId = 4774, srcId = 4773, decValue = 210, addValue = 195}, -- \\给予：神装★祖龙圣器LvMax，分解：神装★祖龙圣器Lv6
                
                
                {type = 14, destId = 4789, srcId = 4774, decValue = 230, addValue = 210}, -- \\给予：神装★秦皇圣器Lv1，分解：神装★祖龙圣器LvMax
                {type = 14, destId = 4790, srcId = 4789, decValue = 250, addValue = 230}, -- \\给予：神装★秦皇圣器Lv2，分解：神装★秦皇圣器Lv1
                {type = 14, destId = 4791, srcId = 4790, decValue = 270, addValue = 250}, -- \\给予：神装★秦皇圣器Lv3，分解：神装★秦皇圣器Lv2
                {type = 14, destId = 4792, srcId = 4791, decValue = 290, addValue = 270}, -- \\给予：神装★秦皇圣器Lv4，分解：神装★秦皇圣器Lv3
                {type = 14, destId = 4793, srcId = 4792, decValue = 310, addValue = 290}, -- \\给予：神装★秦皇圣器Lv5，分解：神装★秦皇圣器Lv4
                {type = 14, destId = 4794, srcId = 4793, decValue = 330, addValue = 310}, -- \\给予：神装★秦皇圣器Lv6，分解：神装★秦皇圣器Lv5
                {type = 14, destId = 4795, srcId = 4794, decValue = 350, addValue = 330}, -- \\给予：神装★秦皇圣器LvMax，分解：神装★秦皇圣器Lv6
                {type = 14, destId = 0, srcId = 4795, decValue = 0, addValue = 350}, -- \\给予：0，分解：神装★秦皇圣器LvMax
                
                
                {type = 12, destId = 4874, srcId = 4873, decValue = 30, addValue = 6}, -- \\给予：神装★屠龙战甲Lv2，分解：神装★屠龙战甲Lv1
                {type = 12, destId = 4875, srcId = 4874, decValue = 45, addValue = 30}, -- \\给予：神装★屠龙战甲Lv3，分解：神装★屠龙战甲Lv2
                {type = 12, destId = 4876, srcId = 4875, decValue = 60, addValue = 45}, -- \\给予：神装★屠龙战甲Lv4，分解：神装★屠龙战甲Lv3
                {type = 12, destId = 4877, srcId = 4876, decValue = 75, addValue = 60}, -- \\给予：神装★屠龙战甲Lv5，分解：神装★屠龙战甲Lv4
                {type = 12, destId = 4878, srcId = 4877, decValue = 90, addValue = 75}, -- \\给予：神装★屠龙战甲Lv6，分解：神装★屠龙战甲Lv5
                {type = 12, destId = 4879, srcId = 4878, decValue = 105, addValue = 90}, -- \\给予：神装★屠龙战甲LvMax，分解：神装★屠龙战甲Lv6
                {type = 12, destId = 4881, srcId = 4880, decValue = 30, addValue = 6}, -- \\给予：神装★屠龙战衣Lv2，分解：神装★屠龙战衣Lv1
                {type = 12, destId = 4882, srcId = 4881, decValue = 45, addValue = 30}, -- \\给予：神装★屠龙战衣Lv3，分解：神装★屠龙战衣Lv2
                {type = 12, destId = 4883, srcId = 4882, decValue = 60, addValue = 45}, -- \\给予：神装★屠龙战衣Lv4，分解：神装★屠龙战衣Lv3
                {type = 12, destId = 4884, srcId = 4883, decValue = 75, addValue = 60}, -- \\给予：神装★屠龙战衣Lv5，分解：神装★屠龙战衣Lv4
                {type = 12, destId = 4885, srcId = 4884, decValue = 90, addValue = 75}, -- \\给予：神装★屠龙战衣Lv6，分解：神装★屠龙战衣Lv5
                {type = 12, destId = 4886, srcId = 4885, decValue = 105, addValue = 90}, -- \\给予：神装★屠龙战衣LvMax，分解：神装★屠龙战衣Lv6
                
                {type = 12, destId = 4915, srcId = 4879, decValue = 120, addValue = 105}, -- \\给予：神装★祖龙战甲Lv1，分解：神装★屠龙战甲LvMax
                {type = 12, destId = 4916, srcId = 4915, decValue = 135, addValue = 120}, -- \\给予：神装★祖龙战甲Lv2，分解：神装★祖龙战甲Lv1
                {type = 12, destId = 4917, srcId = 4916, decValue = 150, addValue = 135}, -- \\给予：神装★祖龙战甲Lv3，分解：神装★祖龙战甲Lv2
                {type = 12, destId = 4918, srcId = 4917, decValue = 165, addValue = 150}, -- \\给予：神装★祖龙战甲Lv4，分解：神装★祖龙战甲Lv3
                {type = 12, destId = 4919, srcId = 4918, decValue = 180, addValue = 165}, -- \\给予：神装★祖龙战甲Lv5，分解：神装★祖龙战甲Lv4
                {type = 12, destId = 4920, srcId = 4919, decValue = 195, addValue = 180}, -- \\给予：神装★祖龙战甲Lv6，分解：神装★祖龙战甲Lv5
                {type = 12, destId = 4921, srcId = 4920, decValue = 210, addValue = 195}, -- \\给予：神装★祖龙战甲LvMax，分解：神装★祖龙战甲Lv6
                {type = 12, destId = 4922, srcId = 4886, decValue = 120, addValue = 105}, -- \\给予：神装★祖龙战衣Lv1，分解：神装★屠龙战衣LvMax
                {type = 12, destId = 4923, srcId = 4922, decValue = 135, addValue = 120}, -- \\给予：神装★祖龙战衣Lv2，分解：神装★祖龙战衣Lv1
                {type = 12, destId = 4924, srcId = 4923, decValue = 150, addValue = 135}, -- \\给予：神装★祖龙战衣Lv3，分解：神装★祖龙战衣Lv2
                {type = 12, destId = 4925, srcId = 4924, decValue = 165, addValue = 150}, -- \\给予：神装★祖龙战衣Lv4，分解：神装★祖龙战衣Lv3
                {type = 12, destId = 4926, srcId = 4925, decValue = 180, addValue = 165}, -- \\给予：神装★祖龙战衣Lv5，分解：神装★祖龙战衣Lv4
                {type = 12, destId = 4927, srcId = 4926, decValue = 195, addValue = 180}, -- \\给予：神装★祖龙战衣Lv6，分解：神装★祖龙战衣Lv5
                {type = 12, destId = 4928, srcId = 4927, decValue = 210, addValue = 195}, -- \\给予：神装★祖龙战衣LvMax，分解：神装★祖龙战衣Lv6
                
                {type = 12, destId = 4957, srcId = 4921, decValue = 230, addValue = 210}, -- \\给予：神装★秦皇战甲Lv1，分解：神装★祖龙战甲LvMax
                {type = 12, destId = 4958, srcId = 4957, decValue = 250, addValue = 230}, -- \\给予：神装★秦皇战甲Lv2，分解：神装★秦皇战甲Lv1
                {type = 12, destId = 4959, srcId = 4958, decValue = 270, addValue = 250}, -- \\给予：神装★秦皇战甲Lv3，分解：神装★秦皇战甲Lv2
                {type = 12, destId = 4960, srcId = 4959, decValue = 290, addValue = 270}, -- \\给予：神装★秦皇战甲Lv4，分解：神装★秦皇战甲Lv3
                {type = 12, destId = 4961, srcId = 4960, decValue = 310, addValue = 290}, -- \\给予：神装★秦皇战甲Lv5，分解：神装★秦皇战甲Lv4
                {type = 12, destId = 4962, srcId = 4961, decValue = 330, addValue = 310}, -- \\给予：神装★秦皇战甲Lv6，分解：神装★秦皇战甲Lv5
                {type = 12, destId = 4963, srcId = 4962, decValue = 350, addValue = 330}, -- \\给予：神装★秦皇战甲LvMax，分解：神装★秦皇战甲Lv6
                {type = 12, destId = 0, srcId = 4963, decValue = 0, addValue = 350}, -- \\给予：0，分解：神装★秦皇战甲LvMax
                {type = 12, destId = 4964, srcId = 4928, decValue = 230, addValue = 210}, -- \\给予：神装★秦皇战衣Lv1，分解：神装★祖龙战衣LvMax
                {type = 12, destId = 4965, srcId = 4964, decValue = 250, addValue = 230}, -- \\给予：神装★秦皇战衣Lv2，分解：神装★秦皇战衣Lv1
                {type = 12, destId = 4966, srcId = 4965, decValue = 270, addValue = 250}, -- \\给予：神装★秦皇战衣Lv3，分解：神装★秦皇战衣Lv2
                {type = 12, destId = 4967, srcId = 4966, decValue = 290, addValue = 270}, -- \\给予：神装★秦皇战衣Lv4，分解：神装★秦皇战衣Lv3
                {type = 12, destId = 4968, srcId = 4967, decValue = 310, addValue = 290}, -- \\给予：神装★秦皇战衣Lv5，分解：神装★秦皇战衣Lv4
                {type = 12, destId = 4969, srcId = 4968, decValue = 330, addValue = 310}, -- \\给予：神装★秦皇战衣Lv6，分解：神装★秦皇战衣Lv5
                {type = 12, destId = 4970, srcId = 4969, decValue = 350, addValue = 330}, -- \\给予：神装★秦皇战衣LvMax，分解：神装★秦皇战衣Lv6
                {type = 12, destId = 0, srcId = 4970, decValue = 0, addValue = 350}, -- \\给予：0，分解：神装★秦皇战衣LvMax
                
                
                {type = 40, destId = 2126, srcId = 2120, decValue = 6, addValue = 3}, -- \\给予：神装★屠龙战盔Lv2，分解：神装★屠龙战盔Lv1
                {type = 41, destId = 2127, srcId = 2121, decValue = 6, addValue = 3}, -- \\给予：神装★屠龙战链Lv2，分解：神装★屠龙战链Lv1
                {type = 42, destId = 2128, srcId = 2122, decValue = 6, addValue = 3}, -- \\给予：神装★屠龙战镯Lv2，分解：神装★屠龙战镯Lv1
                {type = 44, destId = 2129, srcId = 2123, decValue = 6, addValue = 3}, -- \\给予：神装★屠龙战戒Lv2，分解：神装★屠龙战戒Lv1
                {type = 46, destId = 2130, srcId = 2124, decValue = 6, addValue = 3}, -- \\给予：神装★屠龙战带Lv2，分解：神装★屠龙战带Lv1
                {type = 47, destId = 2131, srcId = 2125, decValue = 6, addValue = 3}, -- \\给予：神装★屠龙战靴Lv2，分解：神装★屠龙战靴Lv1
                {type = 40, destId = 2132, srcId = 2126, decValue = 9, addValue = 6}, -- \\给予：神装★屠龙战盔Lv3，分解：神装★屠龙战盔Lv2
                {type = 41, destId = 2133, srcId = 2127, decValue = 9, addValue = 6}, -- \\给予：神装★屠龙战链Lv3，分解：神装★屠龙战链Lv2
                {type = 42, destId = 2134, srcId = 2128, decValue = 9, addValue = 6}, -- \\给予：神装★屠龙战镯Lv3，分解：神装★屠龙战镯Lv2
                {type = 44, destId = 2135, srcId = 2129, decValue = 9, addValue = 6}, -- \\给予：神装★屠龙战戒Lv3，分解：神装★屠龙战戒Lv2
                {type = 46, destId = 2136, srcId = 2130, decValue = 9, addValue = 6}, -- \\给予：神装★屠龙战带Lv3，分解：神装★屠龙战带Lv2
                {type = 47, destId = 2137, srcId = 2131, decValue = 9, addValue = 6}, -- \\给予：神装★屠龙战靴Lv3，分解：神装★屠龙战靴Lv2
                {type = 40, destId = 2138, srcId = 2132, decValue = 12, addValue = 9}, -- \\给予：神装★屠龙战盔Lv4，分解：神装★屠龙战盔Lv3
                {type = 41, destId = 2139, srcId = 2133, decValue = 12, addValue = 9}, -- \\给予：神装★屠龙战链Lv4，分解：神装★屠龙战链Lv3
                {type = 42, destId = 2140, srcId = 2134, decValue = 12, addValue = 9}, -- \\给予：神装★屠龙战镯Lv4，分解：神装★屠龙战镯Lv3
                {type = 44, destId = 2141, srcId = 2135, decValue = 12, addValue = 9}, -- \\给予：神装★屠龙战戒Lv4，分解：神装★屠龙战戒Lv3
                {type = 46, destId = 2142, srcId = 2136, decValue = 12, addValue = 9}, -- \\给予：神装★屠龙战带Lv4，分解：神装★屠龙战带Lv3
                {type = 47, destId = 2143, srcId = 2137, decValue = 12, addValue = 9}, -- \\给予：神装★屠龙战靴Lv4，分解：神装★屠龙战靴Lv3
                {type = 40, destId = 2144, srcId = 2138, decValue = 15, addValue = 12}, -- \\给予：神装★屠龙战盔Lv5，分解：神装★屠龙战盔Lv4
                {type = 41, destId = 2145, srcId = 2139, decValue = 15, addValue = 12}, -- \\给予：神装★屠龙战链Lv5，分解：神装★屠龙战链Lv4
                {type = 42, destId = 2146, srcId = 2140, decValue = 15, addValue = 12}, -- \\给予：神装★屠龙战镯Lv5，分解：神装★屠龙战镯Lv4
                {type = 44, destId = 2147, srcId = 2141, decValue = 15, addValue = 12}, -- \\给予：神装★屠龙战戒Lv5，分解：神装★屠龙战戒Lv4
                {type = 46, destId = 2148, srcId = 2142, decValue = 15, addValue = 12}, -- \\给予：神装★屠龙战带Lv5，分解：神装★屠龙战带Lv4
                {type = 47, destId = 2149, srcId = 2143, decValue = 15, addValue = 12}, -- \\给予：神装★屠龙战靴Lv5，分解：神装★屠龙战靴Lv4
                {type = 40, destId = 2150, srcId = 2144, decValue = 18, addValue = 15}, -- \\给予：神装★屠龙战盔Lv6，分解：神装★屠龙战盔Lv5
                {type = 41, destId = 2151, srcId = 2145, decValue = 18, addValue = 15}, -- \\给予：神装★屠龙战链Lv6，分解：神装★屠龙战链Lv5
                {type = 42, destId = 2152, srcId = 2146, decValue = 18, addValue = 15}, -- \\给予：神装★屠龙战镯Lv6，分解：神装★屠龙战镯Lv5
                {type = 44, destId = 2153, srcId = 2147, decValue = 18, addValue = 15}, -- \\给予：神装★屠龙战戒Lv6，分解：神装★屠龙战戒Lv5
                {type = 46, destId = 2154, srcId = 2148, decValue = 18, addValue = 15}, -- \\给予：神装★屠龙战带Lv6，分解：神装★屠龙战带Lv5
                {type = 47, destId = 2155, srcId = 2149, decValue = 18, addValue = 15}, -- \\给予：神装★屠龙战靴Lv6，分解：神装★屠龙战靴Lv5
                {type = 40, destId = 2156, srcId = 2150, decValue = 21, addValue = 18}, -- \\给予：神装★屠龙战盔LvMax，分解：神装★屠龙战盔Lv6
                {type = 41, destId = 2157, srcId = 2151, decValue = 21, addValue = 18}, -- \\给予：神装★屠龙战链LvMax，分解：神装★屠龙战链Lv6
                {type = 42, destId = 2158, srcId = 2152, decValue = 21, addValue = 18}, -- \\给予：神装★屠龙战镯LvMax，分解：神装★屠龙战镯Lv6
                {type = 44, destId = 2159, srcId = 2153, decValue = 21, addValue = 18}, -- \\给予：神装★屠龙战戒LvMax，分解：神装★屠龙战戒Lv6
                {type = 46, destId = 2160, srcId = 2154, decValue = 21, addValue = 18}, -- \\给予：神装★屠龙战带LvMax，分解：神装★屠龙战带Lv6
                {type = 47, destId = 2161, srcId = 2155, decValue = 21, addValue = 18}, -- \\给予：神装★屠龙战靴LvMax，分解：神装★屠龙战靴Lv6
                {type = 40, destId = 2246, srcId = 2156, decValue = 25, addValue = 21}, -- \\给予：神装★祖龙战盔Lv1，分解：神装★屠龙战盔LvMax
                {type = 41, destId = 2247, srcId = 2157, decValue = 25, addValue = 21}, -- \\给予：神装★祖龙战链Lv1，分解：神装★屠龙战链LvMax
                {type = 42, destId = 2248, srcId = 2158, decValue = 25, addValue = 21}, -- \\给予：神装★祖龙战镯Lv1，分解：神装★屠龙战镯LvMax
                {type = 44, destId = 2249, srcId = 2159, decValue = 25, addValue = 21}, -- \\给予：神装★祖龙战戒Lv1，分解：神装★屠龙战戒LvMax
                {type = 46, destId = 2250, srcId = 2160, decValue = 25, addValue = 21}, -- \\给予：神装★祖龙战带Lv1，分解：神装★屠龙战带LvMax
                {type = 47, destId = 2251, srcId = 2161, decValue = 25, addValue = 21}, -- \\给予：神装★祖龙战靴Lv1，分解：神装★屠龙战靴LvMax
                {type = 40, destId = 2252, srcId = 2246, decValue = 30, addValue = 25}, -- \\给予：神装★祖龙战盔Lv2，分解：神装★祖龙战盔Lv1
                {type = 41, destId = 2253, srcId = 2247, decValue = 30, addValue = 25}, -- \\给予：神装★祖龙战链Lv2，分解：神装★祖龙战链Lv1
                {type = 42, destId = 2254, srcId = 2248, decValue = 30, addValue = 25}, -- \\给予：神装★祖龙战镯Lv2，分解：神装★祖龙战镯Lv1
                {type = 44, destId = 2255, srcId = 2249, decValue = 30, addValue = 25}, -- \\给予：神装★祖龙战戒Lv2，分解：神装★祖龙战戒Lv1
                {type = 46, destId = 2256, srcId = 2250, decValue = 30, addValue = 25}, -- \\给予：神装★祖龙战带Lv2，分解：神装★祖龙战带Lv1
                {type = 47, destId = 2257, srcId = 2251, decValue = 30, addValue = 25}, -- \\给予：神装★祖龙战靴Lv2，分解：神装★祖龙战靴Lv1
                {type = 40, destId = 2258, srcId = 2252, decValue = 35, addValue = 30}, -- \\给予：神装★祖龙战盔Lv3，分解：神装★祖龙战盔Lv2
                {type = 41, destId = 2259, srcId = 2253, decValue = 35, addValue = 30}, -- \\给予：神装★祖龙战链Lv3，分解：神装★祖龙战链Lv2
                {type = 42, destId = 2260, srcId = 2254, decValue = 35, addValue = 30}, -- \\给予：神装★祖龙战镯Lv3，分解：神装★祖龙战镯Lv2
                {type = 44, destId = 2261, srcId = 2255, decValue = 35, addValue = 30}, -- \\给予：神装★祖龙战戒Lv3，分解：神装★祖龙战戒Lv2
                {type = 46, destId = 2262, srcId = 2256, decValue = 35, addValue = 30}, -- \\给予：神装★祖龙战带Lv3，分解：神装★祖龙战带Lv2
                {type = 47, destId = 2263, srcId = 2257, decValue = 35, addValue = 30}, -- \\给予：神装★祖龙战靴Lv3，分解：神装★祖龙战靴Lv2
                {type = 40, destId = 2264, srcId = 2258, decValue = 40, addValue = 35}, -- \\给予：神装★祖龙战盔Lv4，分解：神装★祖龙战盔Lv3
                {type = 41, destId = 2265, srcId = 2259, decValue = 40, addValue = 35}, -- \\给予：神装★祖龙战链Lv4，分解：神装★祖龙战链Lv3
                {type = 42, destId = 2266, srcId = 2260, decValue = 40, addValue = 35}, -- \\给予：神装★祖龙战镯Lv4，分解：神装★祖龙战镯Lv3
                {type = 44, destId = 2267, srcId = 2261, decValue = 40, addValue = 35}, -- \\给予：神装★祖龙战戒Lv4，分解：神装★祖龙战戒Lv3
                {type = 46, destId = 2268, srcId = 2262, decValue = 40, addValue = 35}, -- \\给予：神装★祖龙战带Lv4，分解：神装★祖龙战带Lv3
                {type = 47, destId = 2269, srcId = 2263, decValue = 40, addValue = 35}, -- \\给予：神装★祖龙战靴Lv4，分解：神装★祖龙战靴Lv3
                {type = 40, destId = 2270, srcId = 2264, decValue = 45, addValue = 40}, -- \\给予：神装★祖龙战盔Lv5，分解：神装★祖龙战盔Lv4
                {type = 41, destId = 2271, srcId = 2265, decValue = 45, addValue = 40}, -- \\给予：神装★祖龙战链Lv5，分解：神装★祖龙战链Lv4
                {type = 42, destId = 2272, srcId = 2266, decValue = 45, addValue = 40}, -- \\给予：神装★祖龙战镯Lv5，分解：神装★祖龙战镯Lv4
                {type = 44, destId = 2273, srcId = 2267, decValue = 45, addValue = 40}, -- \\给予：神装★祖龙战戒Lv5，分解：神装★祖龙战戒Lv4
                {type = 46, destId = 2274, srcId = 2268, decValue = 45, addValue = 40}, -- \\给予：神装★祖龙战带Lv5，分解：神装★祖龙战带Lv4
                {type = 47, destId = 2275, srcId = 2269, decValue = 45, addValue = 40}, -- \\给予：神装★祖龙战靴Lv5，分解：神装★祖龙战靴Lv4
                {type = 40, destId = 2276, srcId = 2270, decValue = 50, addValue = 45}, -- \\给予：神装★祖龙战盔Lv6，分解：神装★祖龙战盔Lv5
                {type = 41, destId = 2277, srcId = 2271, decValue = 50, addValue = 45}, -- \\给予：神装★祖龙战链Lv6，分解：神装★祖龙战链Lv5
                {type = 42, destId = 2278, srcId = 2272, decValue = 50, addValue = 45}, -- \\给予：神装★祖龙战镯Lv6，分解：神装★祖龙战镯Lv5
                {type = 44, destId = 2279, srcId = 2273, decValue = 50, addValue = 45}, -- \\给予：神装★祖龙战戒Lv6，分解：神装★祖龙战戒Lv5
                {type = 46, destId = 2280, srcId = 2274, decValue = 50, addValue = 45}, -- \\给予：神装★祖龙战带Lv6，分解：神装★祖龙战带Lv5
                {type = 47, destId = 2281, srcId = 2275, decValue = 50, addValue = 45}, -- \\给予：神装★祖龙战靴Lv6，分解：神装★祖龙战靴Lv5
                {type = 40, destId = 2282, srcId = 2276, decValue = 55, addValue = 50}, -- \\给予：神装★祖龙战盔LvMax，分解：神装★祖龙战盔Lv6
                {type = 41, destId = 2283, srcId = 2277, decValue = 55, addValue = 50}, -- \\给予：神装★祖龙战链LvMax，分解：神装★祖龙战链Lv6
                {type = 42, destId = 2284, srcId = 2278, decValue = 55, addValue = 50}, -- \\给予：神装★祖龙战镯LvMax，分解：神装★祖龙战镯Lv6
                {type = 44, destId = 2285, srcId = 2279, decValue = 55, addValue = 50}, -- \\给予：神装★祖龙战戒LvMax，分解：神装★祖龙战戒Lv6
                {type = 46, destId = 2286, srcId = 2280, decValue = 55, addValue = 50}, -- \\给予：神装★祖龙战带LvMax，分解：神装★祖龙战带Lv6
                {type = 47, destId = 2287, srcId = 2281, decValue = 55, addValue = 50}, -- \\给予：神装★祖龙战靴LvMax，分解：神装★祖龙战靴Lv6
                {type = 40, destId = 2372, srcId = 2282, decValue = 70, addValue = 55}, -- \\给予：神装★秦皇战盔Lv1，分解：神装★祖龙战盔LvMax
                {type = 41, destId = 2373, srcId = 2283, decValue = 70, addValue = 55}, -- \\给予：神装★秦皇战链Lv1，分解：神装★祖龙战链LvMax
                {type = 42, destId = 2374, srcId = 2284, decValue = 70, addValue = 55}, -- \\给予：神装★秦皇战镯Lv1，分解：神装★祖龙战镯LvMax
                {type = 44, destId = 2375, srcId = 2285, decValue = 70, addValue = 55}, -- \\给予：神装★秦皇战戒Lv1，分解：神装★祖龙战戒LvMax
                {type = 46, destId = 2376, srcId = 2286, decValue = 70, addValue = 55}, -- \\给予：神装★秦皇战带Lv1，分解：神装★祖龙战带LvMax
                {type = 47, destId = 2377, srcId = 2287, decValue = 70, addValue = 55}, -- \\给予：神装★秦皇战靴Lv1，分解：神装★祖龙战靴LvMax
                {type = 40, destId = 2378, srcId = 2372, decValue = 85, addValue = 70}, -- \\给予：神装★秦皇战盔Lv2，分解：神装★秦皇战盔Lv1
                {type = 41, destId = 2379, srcId = 2373, decValue = 85, addValue = 70}, -- \\给予：神装★秦皇战链Lv2，分解：神装★秦皇战链Lv1
                {type = 42, destId = 2380, srcId = 2374, decValue = 85, addValue = 70}, -- \\给予：神装★秦皇战镯Lv2，分解：神装★秦皇战镯Lv1
                {type = 44, destId = 2381, srcId = 2375, decValue = 85, addValue = 70}, -- \\给予：神装★秦皇战戒Lv2，分解：神装★秦皇战戒Lv1
                {type = 46, destId = 2382, srcId = 2376, decValue = 85, addValue = 70}, -- \\给予：神装★秦皇战带Lv2，分解：神装★秦皇战带Lv1
                {type = 47, destId = 2383, srcId = 2377, decValue = 85, addValue = 70}, -- \\给予：神装★秦皇战靴Lv2，分解：神装★秦皇战靴Lv1
                {type = 40, destId = 2384, srcId = 2378, decValue = 100, addValue = 85}, -- \\给予：神装★秦皇战盔Lv3，分解：神装★秦皇战盔Lv2
                {type = 41, destId = 2385, srcId = 2379, decValue = 100, addValue = 85}, -- \\给予：神装★秦皇战链Lv3，分解：神装★秦皇战链Lv2
                {type = 42, destId = 2386, srcId = 2380, decValue = 100, addValue = 85}, -- \\给予：神装★秦皇战镯Lv3，分解：神装★秦皇战镯Lv2
                {type = 44, destId = 2387, srcId = 2381, decValue = 100, addValue = 85}, -- \\给予：神装★秦皇战戒Lv3，分解：神装★秦皇战戒Lv2
                {type = 46, destId = 2388, srcId = 2382, decValue = 100, addValue = 85}, -- \\给予：神装★秦皇战带Lv3，分解：神装★秦皇战带Lv2
                {type = 47, destId = 2389, srcId = 2383, decValue = 100, addValue = 85}, -- \\给予：神装★秦皇战靴Lv3，分解：神装★秦皇战靴Lv2
                {type = 40, destId = 2390, srcId = 2384, decValue = 115, addValue = 100}, -- \\给予：神装★秦皇战盔Lv4，分解：神装★秦皇战盔Lv3
                {type = 41, destId = 2391, srcId = 2385, decValue = 115, addValue = 100}, -- \\给予：神装★秦皇战链Lv4，分解：神装★秦皇战链Lv3
                {type = 42, destId = 2392, srcId = 2386, decValue = 115, addValue = 100}, -- \\给予：神装★秦皇战镯Lv4，分解：神装★秦皇战镯Lv3
                {type = 44, destId = 2393, srcId = 2387, decValue = 115, addValue = 100}, -- \\给予：神装★秦皇战戒Lv4，分解：神装★秦皇战戒Lv3
                {type = 46, destId = 2394, srcId = 2388, decValue = 115, addValue = 100}, -- \\给予：神装★秦皇战带Lv4，分解：神装★秦皇战带Lv3
                {type = 47, destId = 2395, srcId = 2389, decValue = 115, addValue = 100}, -- \\给予：神装★秦皇战靴Lv4，分解：神装★秦皇战靴Lv3
                {type = 40, destId = 2396, srcId = 2390, decValue = 130, addValue = 115}, -- \\给予：神装★秦皇战盔Lv5，分解：神装★秦皇战盔Lv4
                {type = 41, destId = 2397, srcId = 2391, decValue = 130, addValue = 115}, -- \\给予：神装★秦皇战链Lv5，分解：神装★秦皇战链Lv4
                {type = 42, destId = 2398, srcId = 2392, decValue = 130, addValue = 115}, -- \\给予：神装★秦皇战镯Lv5，分解：神装★秦皇战镯Lv4
                {type = 44, destId = 2399, srcId = 2393, decValue = 130, addValue = 115}, -- \\给予：神装★秦皇战戒Lv5，分解：神装★秦皇战戒Lv4
                {type = 46, destId = 2400, srcId = 2394, decValue = 130, addValue = 115}, -- \\给予：神装★秦皇战带Lv5，分解：神装★秦皇战带Lv4
                {type = 47, destId = 2401, srcId = 2395, decValue = 130, addValue = 115}, -- \\给予：神装★秦皇战靴Lv5，分解：神装★秦皇战靴Lv4
                {type = 40, destId = 2402, srcId = 2396, decValue = 145, addValue = 130}, -- \\给予：神装★秦皇战盔Lv6，分解：神装★秦皇战盔Lv5
                {type = 41, destId = 2403, srcId = 2397, decValue = 145, addValue = 130}, -- \\给予：神装★秦皇战链Lv6，分解：神装★秦皇战链Lv5
                {type = 42, destId = 2404, srcId = 2398, decValue = 145, addValue = 130}, -- \\给予：神装★秦皇战镯Lv6，分解：神装★秦皇战镯Lv5
                {type = 44, destId = 2405, srcId = 2399, decValue = 145, addValue = 130}, -- \\给予：神装★秦皇战戒Lv6，分解：神装★秦皇战戒Lv5
                {type = 46, destId = 2406, srcId = 2400, decValue = 145, addValue = 130}, -- \\给予：神装★秦皇战带Lv6，分解：神装★秦皇战带Lv5
                {type = 47, destId = 2407, srcId = 2401, decValue = 145, addValue = 130}, -- \\给予：神装★秦皇战靴Lv6，分解：神装★秦皇战靴Lv5
                {type = 40, destId = 2408, srcId = 2402, decValue = 160, addValue = 145}, -- \\给予：神装★秦皇战盔LvMax，分解：神装★秦皇战盔Lv6
                {type = 41, destId = 2409, srcId = 2403, decValue = 160, addValue = 145}, -- \\给予：神装★秦皇战链LvMax，分解：神装★秦皇战链Lv6
                {type = 42, destId = 2410, srcId = 2404, decValue = 160, addValue = 145}, -- \\给予：神装★秦皇战镯LvMax，分解：神装★秦皇战镯Lv6
                {type = 44, destId = 2411, srcId = 2405, decValue = 160, addValue = 145}, -- \\给予：神装★秦皇战戒LvMax，分解：神装★秦皇战戒Lv6
                {type = 46, destId = 2412, srcId = 2406, decValue = 160, addValue = 145}, -- \\给予：神装★秦皇战带LvMax，分解：神装★秦皇战带Lv6
                {type = 47, destId = 2413, srcId = 2407, decValue = 160, addValue = 145}, -- \\给予：神装★秦皇战靴LvMax，分解：神装★秦皇战靴Lv6
                {type = 40, destId = 0, srcId = 2408, decValue = 0, addValue = 160}, -- \\给予：0，分解：神装★秦皇战盔LvMax
                {type = 41, destId = 0, srcId = 2409, decValue = 0, addValue = 160}, -- \\给予：0，分解：神装★秦皇战链LvMax
                {type = 42, destId = 0, srcId = 2410, decValue = 0, addValue = 160}, -- \\给予：0，分解：神装★秦皇战镯LvMax
                {type = 44, destId = 0, srcId = 2411, decValue = 0, addValue = 160}, -- \\给予：0，分解：神装★秦皇战戒LvMax
                {type = 46, destId = 0, srcId = 2412, decValue = 0, addValue = 160}, -- \\给予：0，分解：神装★秦皇战带LvMax
                {type = 47, destId = 0, srcId = 2413, decValue = 0, addValue = 160}, -- \\给予：0，分解：神装★秦皇战靴LvMax
            
            
            },
            
            --法师
            {
                
                {type = 14, destId = 4755, srcId = 4754, decValue = 30, addValue = 6}, -- \\给予：神装★屠龙魔器Lv2，分解：神装★屠龙魔器Lv1
                {type = 14, destId = 4756, srcId = 4755, decValue = 45, addValue = 30}, -- \\给予：神装★屠龙魔器Lv3，分解：神装★屠龙魔器Lv2
                {type = 14, destId = 4757, srcId = 4756, decValue = 60, addValue = 45}, -- \\给予：神装★屠龙魔器Lv4，分解：神装★屠龙魔器Lv3
                {type = 14, destId = 4758, srcId = 4757, decValue = 75, addValue = 60}, -- \\给予：神装★屠龙魔器Lv5，分解：神装★屠龙魔器Lv4
                {type = 14, destId = 4759, srcId = 4758, decValue = 90, addValue = 75}, -- \\给予：神装★屠龙魔器Lv6，分解：神装★屠龙魔器Lv5
                {type = 14, destId = 4760, srcId = 4759, decValue = 105, addValue = 90}, -- \\给予：神装★屠龙魔器LvMax，分解：神装★屠龙魔器Lv6
                
                {type = 14, destId = 4775, srcId = 4760, decValue = 120, addValue = 105}, -- \\给予：神装★祖龙魔器Lv1，分解：神装★屠龙魔器LvMax
                {type = 14, destId = 4776, srcId = 4775, decValue = 135, addValue = 120}, -- \\给予：神装★祖龙魔器Lv2，分解：神装★祖龙魔器Lv1
                {type = 14, destId = 4777, srcId = 4776, decValue = 150, addValue = 135}, -- \\给予：神装★祖龙魔器Lv3，分解：神装★祖龙魔器Lv2
                {type = 14, destId = 4778, srcId = 4777, decValue = 165, addValue = 150}, -- \\给予：神装★祖龙魔器Lv4，分解：神装★祖龙魔器Lv3
                {type = 14, destId = 4779, srcId = 4778, decValue = 180, addValue = 165}, -- \\给予：神装★祖龙魔器Lv5，分解：神装★祖龙魔器Lv4
                {type = 14, destId = 4780, srcId = 4779, decValue = 195, addValue = 180}, -- \\给予：神装★祖龙魔器Lv6，分解：神装★祖龙魔器Lv5
                {type = 14, destId = 4781, srcId = 4780, decValue = 210, addValue = 195}, -- \\给予：神装★祖龙魔器LvMax，分解：神装★祖龙魔器Lv6
                
                {type = 14, destId = 4796, srcId = 4781, decValue = 230, addValue = 210}, -- \\给予：神装★秦皇魔器Lv1，分解：神装★祖龙魔器LvMax
                {type = 14, destId = 4797, srcId = 4796, decValue = 250, addValue = 230}, -- \\给予：神装★秦皇魔器Lv2，分解：神装★秦皇魔器Lv1
                {type = 14, destId = 4798, srcId = 4797, decValue = 270, addValue = 250}, -- \\给予：神装★秦皇魔器Lv3，分解：神装★秦皇魔器Lv2
                {type = 14, destId = 4799, srcId = 4798, decValue = 290, addValue = 270}, -- \\给予：神装★秦皇魔器Lv4，分解：神装★秦皇魔器Lv3
                {type = 14, destId = 4800, srcId = 4799, decValue = 310, addValue = 290}, -- \\给予：神装★秦皇魔器Lv5，分解：神装★秦皇魔器Lv4
                {type = 14, destId = 4801, srcId = 4800, decValue = 330, addValue = 310}, -- \\给予：神装★秦皇魔器Lv6，分解：神装★秦皇魔器Lv5
                {type = 14, destId = 4802, srcId = 4801, decValue = 350, addValue = 330}, -- \\给予：神装★秦皇魔器LvMax，分解：神装★秦皇魔器Lv6
                {type = 14, destId = 0, srcId = 4802, decValue = 0, addValue = 350}, -- \\给予：0，分解：神装★秦皇魔器LvMax
                
                {type = 12, destId = 4888, srcId = 4887, decValue = 30, addValue = 6}, -- \\给予：神装★屠龙法甲Lv2，分解：神装★屠龙法甲Lv1
                {type = 12, destId = 4889, srcId = 4888, decValue = 45, addValue = 30}, -- \\给予：神装★屠龙法甲Lv3，分解：神装★屠龙法甲Lv2
                {type = 12, destId = 4890, srcId = 4889, decValue = 60, addValue = 45}, -- \\给予：神装★屠龙法甲Lv4，分解：神装★屠龙法甲Lv3
                {type = 12, destId = 4891, srcId = 4890, decValue = 75, addValue = 60}, -- \\给予：神装★屠龙法甲Lv5，分解：神装★屠龙法甲Lv4
                {type = 12, destId = 4892, srcId = 4891, decValue = 90, addValue = 75}, -- \\给予：神装★屠龙法甲Lv6，分解：神装★屠龙法甲Lv5
                {type = 12, destId = 4893, srcId = 4892, decValue = 105, addValue = 90}, -- \\给予：神装★屠龙法甲LvMax，分解：神装★屠龙法甲Lv6
                {type = 12, destId = 4895, srcId = 4894, decValue = 30, addValue = 6}, -- \\给予：神装★屠龙法衣Lv2，分解：神装★屠龙法衣Lv1
                {type = 12, destId = 4896, srcId = 4895, decValue = 45, addValue = 30}, -- \\给予：神装★屠龙法衣Lv3，分解：神装★屠龙法衣Lv2
                {type = 12, destId = 4897, srcId = 4896, decValue = 60, addValue = 45}, -- \\给予：神装★屠龙法衣Lv4，分解：神装★屠龙法衣Lv3
                {type = 12, destId = 4898, srcId = 4897, decValue = 75, addValue = 60}, -- \\给予：神装★屠龙法衣Lv5，分解：神装★屠龙法衣Lv4
                {type = 12, destId = 4899, srcId = 4898, decValue = 90, addValue = 75}, -- \\给予：神装★屠龙法衣Lv6，分解：神装★屠龙法衣Lv5
                {type = 12, destId = 4900, srcId = 4899, decValue = 105, addValue = 90}, -- \\给予：神装★屠龙法衣LvMax，分解：神装★屠龙法衣Lv6
                
                {type = 12, destId = 4929, srcId = 4893, decValue = 120, addValue = 105}, -- \\给予：神装★祖龙法甲Lv1，分解：神装★屠龙法甲LvMax
                {type = 12, destId = 4930, srcId = 4929, decValue = 135, addValue = 120}, -- \\给予：神装★祖龙法甲Lv2，分解：神装★祖龙法甲Lv1
                {type = 12, destId = 4931, srcId = 4930, decValue = 150, addValue = 135}, -- \\给予：神装★祖龙法甲Lv3，分解：神装★祖龙法甲Lv2
                {type = 12, destId = 4932, srcId = 4931, decValue = 165, addValue = 150}, -- \\给予：神装★祖龙法甲Lv4，分解：神装★祖龙法甲Lv3
                {type = 12, destId = 4933, srcId = 4932, decValue = 180, addValue = 165}, -- \\给予：神装★祖龙法甲Lv5，分解：神装★祖龙法甲Lv4
                {type = 12, destId = 4934, srcId = 4933, decValue = 195, addValue = 180}, -- \\给予：神装★祖龙法甲Lv6，分解：神装★祖龙法甲Lv5
                {type = 12, destId = 4935, srcId = 4934, decValue = 210, addValue = 195}, -- \\给予：神装★祖龙法甲LvMax，分解：神装★祖龙法甲Lv6
                {type = 12, destId = 4936, srcId = 4900, decValue = 120, addValue = 105}, -- \\给予：神装★祖龙法衣Lv1，分解：神装★屠龙法衣LvMax
                {type = 12, destId = 4937, srcId = 4936, decValue = 135, addValue = 120}, -- \\给予：神装★祖龙法衣Lv2，分解：神装★祖龙法衣Lv1
                {type = 12, destId = 4938, srcId = 4937, decValue = 150, addValue = 135}, -- \\给予：神装★祖龙法衣Lv3，分解：神装★祖龙法衣Lv2
                {type = 12, destId = 4939, srcId = 4938, decValue = 165, addValue = 150}, -- \\给予：神装★祖龙法衣Lv4，分解：神装★祖龙法衣Lv3
                {type = 12, destId = 4940, srcId = 4939, decValue = 180, addValue = 165}, -- \\给予：神装★祖龙法衣Lv5，分解：神装★祖龙法衣Lv4
                {type = 12, destId = 4941, srcId = 4940, decValue = 195, addValue = 180}, -- \\给予：神装★祖龙法衣Lv6，分解：神装★祖龙法衣Lv5
                {type = 12, destId = 4942, srcId = 4941, decValue = 210, addValue = 195}, -- \\给予：神装★祖龙法衣LvMax，分解：神装★祖龙法衣Lv6
                
                {type = 12, destId = 4971, srcId = 4935, decValue = 230, addValue = 210}, -- \\给予：神装★秦皇法甲Lv1，分解：神装★祖龙法甲LvMax
                {type = 12, destId = 4972, srcId = 4971, decValue = 250, addValue = 230}, -- \\给予：神装★秦皇法甲Lv2，分解：神装★秦皇法甲Lv1
                {type = 12, destId = 4973, srcId = 4972, decValue = 270, addValue = 250}, -- \\给予：神装★秦皇法甲Lv3，分解：神装★秦皇法甲Lv2
                {type = 12, destId = 4974, srcId = 4973, decValue = 290, addValue = 270}, -- \\给予：神装★秦皇法甲Lv4，分解：神装★秦皇法甲Lv3
                {type = 12, destId = 4975, srcId = 4974, decValue = 310, addValue = 290}, -- \\给予：神装★秦皇法甲Lv5，分解：神装★秦皇法甲Lv4
                {type = 12, destId = 4976, srcId = 4975, decValue = 330, addValue = 310}, -- \\给予：神装★秦皇法甲Lv6，分解：神装★秦皇法甲Lv5
                {type = 12, destId = 4977, srcId = 4976, decValue = 350, addValue = 330}, -- \\给予：神装★秦皇法甲LvMax，分解：神装★秦皇法甲Lv6
                {type = 12, destId = 0, srcId = 4977, decValue = 0, addValue = 350}, -- \\给予：0，分解：神装★秦皇法甲LvMax
                {type = 12, destId = 4978, srcId = 4942, decValue = 230, addValue = 210}, -- \\给予：神装★秦皇法衣Lv1，分解：神装★祖龙法衣LvMax
                {type = 12, destId = 4979, srcId = 4978, decValue = 250, addValue = 230}, -- \\给予：神装★秦皇法衣Lv2，分解：神装★秦皇法衣Lv1
                {type = 12, destId = 4980, srcId = 4979, decValue = 270, addValue = 250}, -- \\给予：神装★秦皇法衣Lv3，分解：神装★秦皇法衣Lv2
                {type = 12, destId = 4981, srcId = 4980, decValue = 290, addValue = 270}, -- \\给予：神装★秦皇法衣Lv4，分解：神装★秦皇法衣Lv3
                {type = 12, destId = 4982, srcId = 4981, decValue = 310, addValue = 290}, -- \\给予：神装★秦皇法衣Lv5，分解：神装★秦皇法衣Lv4
                {type = 12, destId = 4983, srcId = 4982, decValue = 330, addValue = 310}, -- \\给予：神装★秦皇法衣Lv6，分解：神装★秦皇法衣Lv5
                {type = 12, destId = 4984, srcId = 4983, decValue = 350, addValue = 330}, -- \\给予：神装★秦皇法衣LvMax，分解：神装★秦皇法衣Lv6
                {type = 12, destId = 0, srcId = 4984, decValue = 0, addValue = 350}, -- \\给予：0，分解：神装★秦皇法衣LvMax
                
                
                {type = 40, destId = 2168, srcId = 2162, decValue = 6, addValue = 3}, -- \\给予：神装★屠龙法盔Lv2，分解：神装★屠龙法盔Lv1
                {type = 41, destId = 2169, srcId = 2163, decValue = 6, addValue = 3}, -- \\给予：神装★屠龙法链Lv2，分解：神装★屠龙法链Lv1
                {type = 42, destId = 2170, srcId = 2164, decValue = 6, addValue = 3}, -- \\给予：神装★屠龙法镯Lv2，分解：神装★屠龙法镯Lv1
                {type = 44, destId = 2171, srcId = 2165, decValue = 6, addValue = 3}, -- \\给予：神装★屠龙法戒Lv2，分解：神装★屠龙法戒Lv1
                {type = 46, destId = 2172, srcId = 2166, decValue = 6, addValue = 3}, -- \\给予：神装★屠龙法带Lv2，分解：神装★屠龙法带Lv1
                {type = 47, destId = 2173, srcId = 2167, decValue = 6, addValue = 3}, -- \\给予：神装★屠龙法靴Lv2，分解：神装★屠龙法靴Lv1
                {type = 40, destId = 2174, srcId = 2168, decValue = 9, addValue = 6}, -- \\给予：神装★屠龙法盔Lv3，分解：神装★屠龙法盔Lv2
                {type = 41, destId = 2175, srcId = 2169, decValue = 9, addValue = 6}, -- \\给予：神装★屠龙法链Lv3，分解：神装★屠龙法链Lv2
                {type = 42, destId = 2176, srcId = 2170, decValue = 9, addValue = 6}, -- \\给予：神装★屠龙法镯Lv3，分解：神装★屠龙法镯Lv2
                {type = 44, destId = 2177, srcId = 2171, decValue = 9, addValue = 6}, -- \\给予：神装★屠龙法戒Lv3，分解：神装★屠龙法戒Lv2
                {type = 46, destId = 2178, srcId = 2172, decValue = 9, addValue = 6}, -- \\给予：神装★屠龙法带Lv3，分解：神装★屠龙法带Lv2
                {type = 47, destId = 2179, srcId = 2173, decValue = 9, addValue = 6}, -- \\给予：神装★屠龙法靴Lv3，分解：神装★屠龙法靴Lv2
                {type = 40, destId = 2180, srcId = 2174, decValue = 12, addValue = 9}, -- \\给予：神装★屠龙法盔Lv4，分解：神装★屠龙法盔Lv3
                {type = 41, destId = 2181, srcId = 2175, decValue = 12, addValue = 9}, -- \\给予：神装★屠龙法链Lv4，分解：神装★屠龙法链Lv3
                {type = 42, destId = 2182, srcId = 2176, decValue = 12, addValue = 9}, -- \\给予：神装★屠龙法镯Lv4，分解：神装★屠龙法镯Lv3
                {type = 44, destId = 2183, srcId = 2177, decValue = 12, addValue = 9}, -- \\给予：神装★屠龙法戒Lv4，分解：神装★屠龙法戒Lv3
                {type = 46, destId = 2184, srcId = 2178, decValue = 12, addValue = 9}, -- \\给予：神装★屠龙法带Lv4，分解：神装★屠龙法带Lv3
                {type = 47, destId = 2185, srcId = 2179, decValue = 12, addValue = 9}, -- \\给予：神装★屠龙法靴Lv4，分解：神装★屠龙法靴Lv3
                {type = 40, destId = 2186, srcId = 2180, decValue = 15, addValue = 12}, -- \\给予：神装★屠龙法盔Lv5，分解：神装★屠龙法盔Lv4
                {type = 41, destId = 2187, srcId = 2181, decValue = 15, addValue = 12}, -- \\给予：神装★屠龙法链Lv5，分解：神装★屠龙法链Lv4
                {type = 42, destId = 2188, srcId = 2182, decValue = 15, addValue = 12}, -- \\给予：神装★屠龙法镯Lv5，分解：神装★屠龙法镯Lv4
                {type = 44, destId = 2189, srcId = 2183, decValue = 15, addValue = 12}, -- \\给予：神装★屠龙法戒Lv5，分解：神装★屠龙法戒Lv4
                {type = 46, destId = 2190, srcId = 2184, decValue = 15, addValue = 12}, -- \\给予：神装★屠龙法带Lv5，分解：神装★屠龙法带Lv4
                {type = 47, destId = 2191, srcId = 2185, decValue = 15, addValue = 12}, -- \\给予：神装★屠龙法靴Lv5，分解：神装★屠龙法靴Lv4
                {type = 40, destId = 2192, srcId = 2186, decValue = 18, addValue = 15}, -- \\给予：神装★屠龙法盔Lv6，分解：神装★屠龙法盔Lv5
                {type = 41, destId = 2193, srcId = 2187, decValue = 18, addValue = 15}, -- \\给予：神装★屠龙法链Lv6，分解：神装★屠龙法链Lv5
                {type = 42, destId = 2194, srcId = 2188, decValue = 18, addValue = 15}, -- \\给予：神装★屠龙法镯Lv6，分解：神装★屠龙法镯Lv5
                {type = 44, destId = 2195, srcId = 2189, decValue = 18, addValue = 15}, -- \\给予：神装★屠龙法戒Lv6，分解：神装★屠龙法戒Lv5
                {type = 46, destId = 2196, srcId = 2190, decValue = 18, addValue = 15}, -- \\给予：神装★屠龙法带Lv6，分解：神装★屠龙法带Lv5
                {type = 47, destId = 2197, srcId = 2191, decValue = 18, addValue = 15}, -- \\给予：神装★屠龙法靴Lv6，分解：神装★屠龙法靴Lv5
                {type = 40, destId = 2198, srcId = 2192, decValue = 21, addValue = 18}, -- \\给予：神装★屠龙法盔LvMax，分解：神装★屠龙法盔Lv6
                {type = 41, destId = 2199, srcId = 2193, decValue = 21, addValue = 18}, -- \\给予：神装★屠龙法链LvMax，分解：神装★屠龙法链Lv6
                {type = 42, destId = 2200, srcId = 2194, decValue = 21, addValue = 18}, -- \\给予：神装★屠龙法镯LvMax，分解：神装★屠龙法镯Lv6
                {type = 44, destId = 2201, srcId = 2195, decValue = 21, addValue = 18}, -- \\给予：神装★屠龙法戒LvMax，分解：神装★屠龙法戒Lv6
                {type = 46, destId = 2202, srcId = 2196, decValue = 21, addValue = 18}, -- \\给予：神装★屠龙法带LvMax，分解：神装★屠龙法带Lv6
                {type = 47, destId = 2203, srcId = 2197, decValue = 21, addValue = 18}, -- \\给予：神装★屠龙法靴LvMax，分解：神装★屠龙法靴Lv6
                {type = 40, destId = 2288, srcId = 2198, decValue = 25, addValue = 21}, -- \\给予：神装★祖龙法盔Lv1，分解：神装★屠龙法盔LvMax
                {type = 41, destId = 2289, srcId = 2199, decValue = 25, addValue = 21}, -- \\给予：神装★祖龙法链Lv1，分解：神装★屠龙法链LvMax
                {type = 42, destId = 2290, srcId = 2200, decValue = 25, addValue = 21}, -- \\给予：神装★祖龙法镯Lv1，分解：神装★屠龙法镯LvMax
                {type = 44, destId = 2291, srcId = 2201, decValue = 25, addValue = 21}, -- \\给予：神装★祖龙法戒Lv1，分解：神装★屠龙法戒LvMax
                {type = 46, destId = 2292, srcId = 2202, decValue = 25, addValue = 21}, -- \\给予：神装★祖龙法带Lv1，分解：神装★屠龙法带LvMax
                {type = 47, destId = 2293, srcId = 2203, decValue = 25, addValue = 21}, -- \\给予：神装★祖龙法靴Lv1，分解：神装★屠龙法靴LvMax
                {type = 40, destId = 2294, srcId = 2288, decValue = 30, addValue = 25}, -- \\给予：神装★祖龙法盔Lv2，分解：神装★祖龙法盔Lv1
                {type = 41, destId = 2295, srcId = 2289, decValue = 30, addValue = 25}, -- \\给予：神装★祖龙法链Lv2，分解：神装★祖龙法链Lv1
                {type = 42, destId = 2296, srcId = 2290, decValue = 30, addValue = 25}, -- \\给予：神装★祖龙法镯Lv2，分解：神装★祖龙法镯Lv1
                {type = 44, destId = 2297, srcId = 2291, decValue = 30, addValue = 25}, -- \\给予：神装★祖龙法戒Lv2，分解：神装★祖龙法戒Lv1
                {type = 46, destId = 2298, srcId = 2292, decValue = 30, addValue = 25}, -- \\给予：神装★祖龙法带Lv2，分解：神装★祖龙法带Lv1
                {type = 47, destId = 2299, srcId = 2293, decValue = 30, addValue = 25}, -- \\给予：神装★祖龙法靴Lv2，分解：神装★祖龙法靴Lv1
                {type = 40, destId = 2300, srcId = 2294, decValue = 35, addValue = 30}, -- \\给予：神装★祖龙法盔Lv3，分解：神装★祖龙法盔Lv2
                {type = 41, destId = 2301, srcId = 2295, decValue = 35, addValue = 30}, -- \\给予：神装★祖龙法链Lv3，分解：神装★祖龙法链Lv2
                {type = 42, destId = 2302, srcId = 2296, decValue = 35, addValue = 30}, -- \\给予：神装★祖龙法镯Lv3，分解：神装★祖龙法镯Lv2
                {type = 44, destId = 2303, srcId = 2297, decValue = 35, addValue = 30}, -- \\给予：神装★祖龙法戒Lv3，分解：神装★祖龙法戒Lv2
                {type = 46, destId = 2304, srcId = 2298, decValue = 35, addValue = 30}, -- \\给予：神装★祖龙法带Lv3，分解：神装★祖龙法带Lv2
                {type = 47, destId = 2305, srcId = 2299, decValue = 35, addValue = 30}, -- \\给予：神装★祖龙法靴Lv3，分解：神装★祖龙法靴Lv2
                {type = 40, destId = 2306, srcId = 2300, decValue = 40, addValue = 35}, -- \\给予：神装★祖龙法盔Lv4，分解：神装★祖龙法盔Lv3
                {type = 41, destId = 2307, srcId = 2301, decValue = 40, addValue = 35}, -- \\给予：神装★祖龙法链Lv4，分解：神装★祖龙法链Lv3
                {type = 42, destId = 2308, srcId = 2302, decValue = 40, addValue = 35}, -- \\给予：神装★祖龙法镯Lv4，分解：神装★祖龙法镯Lv3
                {type = 44, destId = 2309, srcId = 2303, decValue = 40, addValue = 35}, -- \\给予：神装★祖龙法戒Lv4，分解：神装★祖龙法戒Lv3
                {type = 46, destId = 2310, srcId = 2304, decValue = 40, addValue = 35}, -- \\给予：神装★祖龙法带Lv4，分解：神装★祖龙法带Lv3
                {type = 47, destId = 2311, srcId = 2305, decValue = 40, addValue = 35}, -- \\给予：神装★祖龙法靴Lv4，分解：神装★祖龙法靴Lv3
                {type = 40, destId = 2312, srcId = 2306, decValue = 45, addValue = 40}, -- \\给予：神装★祖龙法盔Lv5，分解：神装★祖龙法盔Lv4
                {type = 41, destId = 2313, srcId = 2307, decValue = 45, addValue = 40}, -- \\给予：神装★祖龙法链Lv5，分解：神装★祖龙法链Lv4
                {type = 42, destId = 2314, srcId = 2308, decValue = 45, addValue = 40}, -- \\给予：神装★祖龙法镯Lv5，分解：神装★祖龙法镯Lv4
                {type = 44, destId = 2315, srcId = 2309, decValue = 45, addValue = 40}, -- \\给予：神装★祖龙法戒Lv5，分解：神装★祖龙法戒Lv4
                {type = 46, destId = 2316, srcId = 2310, decValue = 45, addValue = 40}, -- \\给予：神装★祖龙法带Lv5，分解：神装★祖龙法带Lv4
                {type = 47, destId = 2317, srcId = 2311, decValue = 45, addValue = 40}, -- \\给予：神装★祖龙法靴Lv5，分解：神装★祖龙法靴Lv4
                {type = 40, destId = 2318, srcId = 2312, decValue = 50, addValue = 45}, -- \\给予：神装★祖龙法盔Lv6，分解：神装★祖龙法盔Lv5
                {type = 41, destId = 2319, srcId = 2313, decValue = 50, addValue = 45}, -- \\给予：神装★祖龙法链Lv6，分解：神装★祖龙法链Lv5
                {type = 42, destId = 2320, srcId = 2314, decValue = 50, addValue = 45}, -- \\给予：神装★祖龙法镯Lv6，分解：神装★祖龙法镯Lv5
                {type = 44, destId = 2321, srcId = 2315, decValue = 50, addValue = 45}, -- \\给予：神装★祖龙法戒Lv6，分解：神装★祖龙法戒Lv5
                {type = 46, destId = 2322, srcId = 2316, decValue = 50, addValue = 45}, -- \\给予：神装★祖龙法带Lv6，分解：神装★祖龙法带Lv5
                {type = 47, destId = 2323, srcId = 2317, decValue = 50, addValue = 45}, -- \\给予：神装★祖龙法靴Lv6，分解：神装★祖龙法靴Lv5
                {type = 40, destId = 2324, srcId = 2318, decValue = 55, addValue = 50}, -- \\给予：神装★祖龙法盔LvMax，分解：神装★祖龙法盔Lv6
                {type = 41, destId = 2325, srcId = 2319, decValue = 55, addValue = 50}, -- \\给予：神装★祖龙法链LvMax，分解：神装★祖龙法链Lv6
                {type = 42, destId = 2326, srcId = 2320, decValue = 55, addValue = 50}, -- \\给予：神装★祖龙法镯LvMax，分解：神装★祖龙法镯Lv6
                {type = 44, destId = 2327, srcId = 2321, decValue = 55, addValue = 50}, -- \\给予：神装★祖龙法戒LvMax，分解：神装★祖龙法戒Lv6
                {type = 46, destId = 2328, srcId = 2322, decValue = 55, addValue = 50}, -- \\给予：神装★祖龙法带LvMax，分解：神装★祖龙法带Lv6
                {type = 47, destId = 2329, srcId = 2323, decValue = 55, addValue = 50}, -- \\给予：神装★祖龙法靴LvMax，分解：神装★祖龙法靴Lv6
                {type = 40, destId = 2414, srcId = 2324, decValue = 70, addValue = 55}, -- \\给予：神装★秦皇法盔Lv1，分解：神装★祖龙法盔LvMax
                {type = 41, destId = 2415, srcId = 2325, decValue = 70, addValue = 55}, -- \\给予：神装★秦皇法链Lv1，分解：神装★祖龙法链LvMax
                {type = 42, destId = 2416, srcId = 2326, decValue = 70, addValue = 55}, -- \\给予：神装★秦皇法镯Lv1，分解：神装★祖龙法镯LvMax
                {type = 44, destId = 2417, srcId = 2327, decValue = 70, addValue = 55}, -- \\给予：神装★秦皇法戒Lv1，分解：神装★祖龙法戒LvMax
                {type = 46, destId = 2418, srcId = 2328, decValue = 70, addValue = 55}, -- \\给予：神装★秦皇法带Lv1，分解：神装★祖龙法带LvMax
                {type = 47, destId = 2419, srcId = 2329, decValue = 70, addValue = 55}, -- \\给予：神装★秦皇法靴Lv1，分解：神装★祖龙法靴LvMax
                {type = 40, destId = 2420, srcId = 2414, decValue = 85, addValue = 70}, -- \\给予：神装★秦皇法盔Lv2，分解：神装★秦皇法盔Lv1
                {type = 41, destId = 2421, srcId = 2415, decValue = 85, addValue = 70}, -- \\给予：神装★秦皇法链Lv2，分解：神装★秦皇法链Lv1
                {type = 42, destId = 2422, srcId = 2416, decValue = 85, addValue = 70}, -- \\给予：神装★秦皇法镯Lv2，分解：神装★秦皇法镯Lv1
                {type = 44, destId = 2423, srcId = 2417, decValue = 85, addValue = 70}, -- \\给予：神装★秦皇法戒Lv2，分解：神装★秦皇法戒Lv1
                {type = 46, destId = 2424, srcId = 2418, decValue = 85, addValue = 70}, -- \\给予：神装★秦皇法带Lv2，分解：神装★秦皇法带Lv1
                {type = 47, destId = 2425, srcId = 2419, decValue = 85, addValue = 70}, -- \\给予：神装★秦皇法靴Lv2，分解：神装★秦皇法靴Lv1
                {type = 40, destId = 2426, srcId = 2420, decValue = 100, addValue = 85}, -- \\给予：神装★秦皇法盔Lv3，分解：神装★秦皇法盔Lv2
                {type = 41, destId = 2427, srcId = 2421, decValue = 100, addValue = 85}, -- \\给予：神装★秦皇法链Lv3，分解：神装★秦皇法链Lv2
                {type = 42, destId = 2428, srcId = 2422, decValue = 100, addValue = 85}, -- \\给予：神装★秦皇法镯Lv3，分解：神装★秦皇法镯Lv2
                {type = 44, destId = 2429, srcId = 2423, decValue = 100, addValue = 85}, -- \\给予：神装★秦皇法戒Lv3，分解：神装★秦皇法戒Lv2
                {type = 46, destId = 2430, srcId = 2424, decValue = 100, addValue = 85}, -- \\给予：神装★秦皇法带Lv3，分解：神装★秦皇法带Lv2
                {type = 47, destId = 2431, srcId = 2425, decValue = 100, addValue = 85}, -- \\给予：神装★秦皇法靴Lv3，分解：神装★秦皇法靴Lv2
                {type = 40, destId = 2432, srcId = 2426, decValue = 115, addValue = 100}, -- \\给予：神装★秦皇法盔Lv4，分解：神装★秦皇法盔Lv3
                {type = 41, destId = 2433, srcId = 2427, decValue = 115, addValue = 100}, -- \\给予：神装★秦皇法链Lv4，分解：神装★秦皇法链Lv3
                {type = 42, destId = 2434, srcId = 2428, decValue = 115, addValue = 100}, -- \\给予：神装★秦皇法镯Lv4，分解：神装★秦皇法镯Lv3
                {type = 44, destId = 2435, srcId = 2429, decValue = 115, addValue = 100}, -- \\给予：神装★秦皇法戒Lv4，分解：神装★秦皇法戒Lv3
                {type = 46, destId = 2436, srcId = 2430, decValue = 115, addValue = 100}, -- \\给予：神装★秦皇法带Lv4，分解：神装★秦皇法带Lv3
                {type = 47, destId = 2437, srcId = 2431, decValue = 115, addValue = 100}, -- \\给予：神装★秦皇法靴Lv4，分解：神装★秦皇法靴Lv3
                {type = 40, destId = 2438, srcId = 2432, decValue = 130, addValue = 115}, -- \\给予：神装★秦皇法盔Lv5，分解：神装★秦皇法盔Lv4
                {type = 41, destId = 2439, srcId = 2433, decValue = 130, addValue = 115}, -- \\给予：神装★秦皇法链Lv5，分解：神装★秦皇法链Lv4
                {type = 42, destId = 2440, srcId = 2434, decValue = 130, addValue = 115}, -- \\给予：神装★秦皇法镯Lv5，分解：神装★秦皇法镯Lv4
                {type = 44, destId = 2441, srcId = 2435, decValue = 130, addValue = 115}, -- \\给予：神装★秦皇法戒Lv5，分解：神装★秦皇法戒Lv4
                {type = 46, destId = 2442, srcId = 2436, decValue = 130, addValue = 115}, -- \\给予：神装★秦皇法带Lv5，分解：神装★秦皇法带Lv4
                {type = 47, destId = 2443, srcId = 2437, decValue = 130, addValue = 115}, -- \\给予：神装★秦皇法靴Lv5，分解：神装★秦皇法靴Lv4
                {type = 40, destId = 2444, srcId = 2438, decValue = 145, addValue = 130}, -- \\给予：神装★秦皇法盔Lv6，分解：神装★秦皇法盔Lv5
                {type = 41, destId = 2445, srcId = 2439, decValue = 145, addValue = 130}, -- \\给予：神装★秦皇法链Lv6，分解：神装★秦皇法链Lv5
                {type = 42, destId = 2446, srcId = 2440, decValue = 145, addValue = 130}, -- \\给予：神装★秦皇法镯Lv6，分解：神装★秦皇法镯Lv5
                {type = 44, destId = 2447, srcId = 2441, decValue = 145, addValue = 130}, -- \\给予：神装★秦皇法戒Lv6，分解：神装★秦皇法戒Lv5
                {type = 46, destId = 2448, srcId = 2442, decValue = 145, addValue = 130}, -- \\给予：神装★秦皇法带Lv6，分解：神装★秦皇法带Lv5
                {type = 47, destId = 2449, srcId = 2443, decValue = 145, addValue = 130}, -- \\给予：神装★秦皇法靴Lv6，分解：神装★秦皇法靴Lv5
                {type = 40, destId = 2450, srcId = 2444, decValue = 160, addValue = 145}, -- \\给予：神装★秦皇法盔LvMax，分解：神装★秦皇法盔Lv6
                {type = 41, destId = 2451, srcId = 2445, decValue = 160, addValue = 145}, -- \\给予：神装★秦皇法链LvMax，分解：神装★秦皇法链Lv6
                {type = 42, destId = 2452, srcId = 2446, decValue = 160, addValue = 145}, -- \\给予：神装★秦皇法镯LvMax，分解：神装★秦皇法镯Lv6
                {type = 44, destId = 2453, srcId = 2447, decValue = 160, addValue = 145}, -- \\给予：神装★秦皇法戒LvMax，分解：神装★秦皇法戒Lv6
                {type = 46, destId = 2454, srcId = 2448, decValue = 160, addValue = 145}, -- \\给予：神装★秦皇法带LvMax，分解：神装★秦皇法带Lv6
                {type = 47, destId = 2455, srcId = 2449, decValue = 160, addValue = 145}, -- \\给予：神装★秦皇法靴LvMax，分解：神装★秦皇法靴Lv6
                {type = 40, destId = 0, srcId = 2450, decValue = 0, addValue = 160}, -- \\给予：0，分解：神装★秦皇法盔LvMax
                {type = 41, destId = 0, srcId = 2451, decValue = 0, addValue = 160}, -- \\给予：0，分解：神装★秦皇法链LvMax
                {type = 42, destId = 0, srcId = 2452, decValue = 0, addValue = 160}, -- \\给予：0，分解：神装★秦皇法镯LvMax
                {type = 44, destId = 0, srcId = 2453, decValue = 0, addValue = 160}, -- \\给予：0，分解：神装★秦皇法戒LvMax
                {type = 46, destId = 0, srcId = 2454, decValue = 0, addValue = 160}, -- \\给予：0，分解：神装★秦皇法带LvMax
                {type = 47, destId = 0, srcId = 2455, decValue = 0, addValue = 160}, -- \\给予：0，分解：神装★秦皇法靴LvMax
            
            
            
            },
            --道士
            {
                {type = 14, destId = 4762, srcId = 4761, decValue = 30, addValue = 6}, -- \\给予：神装★屠龙道器Lv2，分解：神装★屠龙道器Lv1
                {type = 14, destId = 4763, srcId = 4762, decValue = 45, addValue = 30}, -- \\给予：神装★屠龙道器Lv3，分解：神装★屠龙道器Lv2
                {type = 14, destId = 4764, srcId = 4763, decValue = 60, addValue = 45}, -- \\给予：神装★屠龙道器Lv4，分解：神装★屠龙道器Lv3
                {type = 14, destId = 4765, srcId = 4764, decValue = 75, addValue = 60}, -- \\给予：神装★屠龙道器Lv5，分解：神装★屠龙道器Lv4
                {type = 14, destId = 4766, srcId = 4765, decValue = 90, addValue = 75}, -- \\给予：神装★屠龙道器Lv6，分解：神装★屠龙道器Lv5
                {type = 14, destId = 4767, srcId = 4766, decValue = 105, addValue = 90}, -- \\给予：神装★屠龙道器LvMax，分解：神装★屠龙道器Lv6
                
                {type = 14, destId = 4782, srcId = 4767, decValue = 120, addValue = 105}, -- \\给予：神装★祖龙道器Lv1，分解：神装★屠龙道器LvMax
                {type = 14, destId = 4783, srcId = 4782, decValue = 135, addValue = 120}, -- \\给予：神装★祖龙道器Lv2，分解：神装★祖龙道器Lv1
                {type = 14, destId = 4784, srcId = 4783, decValue = 150, addValue = 135}, -- \\给予：神装★祖龙道器Lv3，分解：神装★祖龙道器Lv2
                {type = 14, destId = 4785, srcId = 4784, decValue = 165, addValue = 150}, -- \\给予：神装★祖龙道器Lv4，分解：神装★祖龙道器Lv3
                {type = 14, destId = 4786, srcId = 4785, decValue = 180, addValue = 165}, -- \\给予：神装★祖龙道器Lv5，分解：神装★祖龙道器Lv4
                {type = 14, destId = 4787, srcId = 4786, decValue = 195, addValue = 180}, -- \\给予：神装★祖龙道器Lv6，分解：神装★祖龙道器Lv5
                {type = 14, destId = 4788, srcId = 4787, decValue = 210, addValue = 195}, -- \\给予：神装★祖龙道器LvMax，分解：神装★祖龙道器Lv6
                
                {type = 14, destId = 4803, srcId = 4788, decValue = 230, addValue = 210}, -- \\给予：神装★秦皇道器Lv1，分解：神装★祖龙道器LvMax
                {type = 14, destId = 4804, srcId = 4803, decValue = 250, addValue = 230}, -- \\给予：神装★秦皇道器Lv2，分解：神装★秦皇道器Lv1
                {type = 14, destId = 4805, srcId = 4804, decValue = 270, addValue = 250}, -- \\给予：神装★秦皇道器Lv3，分解：神装★秦皇道器Lv2
                {type = 14, destId = 4806, srcId = 4805, decValue = 290, addValue = 270}, -- \\给予：神装★秦皇道器Lv4，分解：神装★秦皇道器Lv3
                {type = 14, destId = 4807, srcId = 4806, decValue = 310, addValue = 290}, -- \\给予：神装★秦皇道器Lv5，分解：神装★秦皇道器Lv4
                {type = 14, destId = 4808, srcId = 4807, decValue = 330, addValue = 310}, -- \\给予：神装★秦皇道器Lv6，分解：神装★秦皇道器Lv5
                {type = 14, destId = 4809, srcId = 4808, decValue = 350, addValue = 330}, -- \\给予：神装★秦皇道器LvMax，分解：神装★秦皇道器Lv6
                {type = 14, destId = 0, srcId = 4809, decValue = 0, addValue = 350}, -- \\给予：0，分解：神装★秦皇道器LvMax
                
                {type = 12, destId = 4902, srcId = 4901, decValue = 30, addValue = 6}, -- \\给予：神装★屠龙道甲Lv2，分解：神装★屠龙道甲Lv1
                {type = 12, destId = 4903, srcId = 4902, decValue = 45, addValue = 30}, -- \\给予：神装★屠龙道甲Lv3，分解：神装★屠龙道甲Lv2
                {type = 12, destId = 4904, srcId = 4903, decValue = 60, addValue = 45}, -- \\给予：神装★屠龙道甲Lv4，分解：神装★屠龙道甲Lv3
                {type = 12, destId = 4905, srcId = 4904, decValue = 75, addValue = 60}, -- \\给予：神装★屠龙道甲Lv5，分解：神装★屠龙道甲Lv4
                {type = 12, destId = 4906, srcId = 4905, decValue = 90, addValue = 75}, -- \\给予：神装★屠龙道甲Lv6，分解：神装★屠龙道甲Lv5
                {type = 12, destId = 4907, srcId = 4906, decValue = 105, addValue = 90}, -- \\给予：神装★屠龙道甲LvMax，分解：神装★屠龙道甲Lv6
                {type = 12, destId = 4909, srcId = 4908, decValue = 30, addValue = 6}, -- \\给予：神装★屠龙道衣Lv2，分解：神装★屠龙道衣Lv1
                {type = 12, destId = 4910, srcId = 4909, decValue = 45, addValue = 30}, -- \\给予：神装★屠龙道衣Lv3，分解：神装★屠龙道衣Lv2
                {type = 12, destId = 4911, srcId = 4910, decValue = 60, addValue = 45}, -- \\给予：神装★屠龙道衣Lv4，分解：神装★屠龙道衣Lv3
                {type = 12, destId = 4912, srcId = 4911, decValue = 75, addValue = 60}, -- \\给予：神装★屠龙道衣Lv5，分解：神装★屠龙道衣Lv4
                {type = 12, destId = 4913, srcId = 4912, decValue = 90, addValue = 75}, -- \\给予：神装★屠龙道衣Lv6，分解：神装★屠龙道衣Lv5
                {type = 12, destId = 4914, srcId = 4913, decValue = 105, addValue = 90}, -- \\给予：神装★屠龙道衣LvMax，分解：神装★屠龙道衣Lv6
                
                {type = 12, destId = 4943, srcId = 4907, decValue = 120, addValue = 105}, -- \\给予：神装★祖龙道甲Lv1，分解：神装★屠龙道甲LvMax
                {type = 12, destId = 4944, srcId = 4943, decValue = 135, addValue = 120}, -- \\给予：神装★祖龙道甲Lv2，分解：神装★祖龙道甲Lv1
                {type = 12, destId = 4945, srcId = 4944, decValue = 150, addValue = 135}, -- \\给予：神装★祖龙道甲Lv3，分解：神装★祖龙道甲Lv2
                {type = 12, destId = 4946, srcId = 4945, decValue = 165, addValue = 150}, -- \\给予：神装★祖龙道甲Lv4，分解：神装★祖龙道甲Lv3
                {type = 12, destId = 4947, srcId = 4946, decValue = 180, addValue = 165}, -- \\给予：神装★祖龙道甲Lv5，分解：神装★祖龙道甲Lv4
                {type = 12, destId = 4948, srcId = 4947, decValue = 195, addValue = 180}, -- \\给予：神装★祖龙道甲Lv6，分解：神装★祖龙道甲Lv5
                {type = 12, destId = 4949, srcId = 4948, decValue = 210, addValue = 195}, -- \\给予：神装★祖龙道甲LvMax，分解：神装★祖龙道甲Lv6
                {type = 12, destId = 4950, srcId = 4914, decValue = 120, addValue = 105}, -- \\给予：神装★祖龙道衣Lv1，分解：神装★屠龙道衣LvMax
                {type = 12, destId = 4951, srcId = 4950, decValue = 135, addValue = 120}, -- \\给予：神装★祖龙道衣Lv2，分解：神装★祖龙道衣Lv1
                {type = 12, destId = 4952, srcId = 4951, decValue = 150, addValue = 135}, -- \\给予：神装★祖龙道衣Lv3，分解：神装★祖龙道衣Lv2
                {type = 12, destId = 4953, srcId = 4952, decValue = 165, addValue = 150}, -- \\给予：神装★祖龙道衣Lv4，分解：神装★祖龙道衣Lv3
                {type = 12, destId = 4954, srcId = 4953, decValue = 180, addValue = 165}, -- \\给予：神装★祖龙道衣Lv5，分解：神装★祖龙道衣Lv4
                {type = 12, destId = 4955, srcId = 4954, decValue = 195, addValue = 180}, -- \\给予：神装★祖龙道衣Lv6，分解：神装★祖龙道衣Lv5
                {type = 12, destId = 4956, srcId = 4955, decValue = 210, addValue = 195}, -- \\给予：神装★祖龙道衣LvMax，分解：神装★祖龙道衣Lv6
                
                {type = 12, destId = 4985, srcId = 4949, decValue = 230, addValue = 210}, -- \\给予：神装★秦皇道甲Lv1，分解：神装★祖龙道甲LvMax
                {type = 12, destId = 4986, srcId = 4985, decValue = 250, addValue = 230}, -- \\给予：神装★秦皇道甲Lv2，分解：神装★秦皇道甲Lv1
                {type = 12, destId = 4987, srcId = 4986, decValue = 270, addValue = 250}, -- \\给予：神装★秦皇道甲Lv3，分解：神装★秦皇道甲Lv2
                {type = 12, destId = 4988, srcId = 4987, decValue = 290, addValue = 270}, -- \\给予：神装★秦皇道甲Lv4，分解：神装★秦皇道甲Lv3
                {type = 12, destId = 4989, srcId = 4988, decValue = 310, addValue = 290}, -- \\给予：神装★秦皇道甲Lv5，分解：神装★秦皇道甲Lv4
                {type = 12, destId = 4990, srcId = 4989, decValue = 330, addValue = 310}, -- \\给予：神装★秦皇道甲Lv6，分解：神装★秦皇道甲Lv5
                {type = 12, destId = 4991, srcId = 4990, decValue = 350, addValue = 330}, -- \\给予：神装★秦皇道甲LvMax，分解：神装★秦皇道甲Lv6
                {type = 12, destId = 0, srcId = 4991, decValue = 0, addValue = 350}, -- \\给予：0，分解：神装★秦皇道甲LvMax
                {type = 12, destId = 4992, srcId = 4956, decValue = 230, addValue = 210}, -- \\给予：神装★秦皇道衣Lv1，分解：神装★祖龙道衣LvMax
                {type = 12, destId = 4993, srcId = 4992, decValue = 250, addValue = 230}, -- \\给予：神装★秦皇道衣Lv2，分解：神装★秦皇道衣Lv1
                {type = 12, destId = 4994, srcId = 4993, decValue = 270, addValue = 250}, -- \\给予：神装★秦皇道衣Lv3，分解：神装★秦皇道衣Lv2
                {type = 12, destId = 4995, srcId = 4994, decValue = 290, addValue = 270}, -- \\给予：神装★秦皇道衣Lv4，分解：神装★秦皇道衣Lv3
                {type = 12, destId = 4996, srcId = 4995, decValue = 310, addValue = 290}, -- \\给予：神装★秦皇道衣Lv5，分解：神装★秦皇道衣Lv4
                {type = 12, destId = 4997, srcId = 4996, decValue = 330, addValue = 310}, -- \\给予：神装★秦皇道衣Lv6，分解：神装★秦皇道衣Lv5
                {type = 12, destId = 4998, srcId = 4997, decValue = 350, addValue = 330}, -- \\给予：神装★秦皇道衣LvMax，分解：神装★秦皇道衣Lv6
                {type = 12, destId = 0, srcId = 4998, decValue = 0, addValue = 350}, -- \\给予：0，分解：神装★秦皇道衣LvMax
                
                
                
                {type = 40, destId = 2210, srcId = 2204, decValue = 6, addValue = 3}, -- \\给予：神装★屠龙道盔Lv2，分解：神装★屠龙道盔Lv1
                {type = 41, destId = 2211, srcId = 2205, decValue = 6, addValue = 3}, -- \\给予：神装★屠龙道链Lv2，分解：神装★屠龙道链Lv1
                {type = 42, destId = 2212, srcId = 2206, decValue = 6, addValue = 3}, -- \\给予：神装★屠龙道镯Lv2，分解：神装★屠龙道镯Lv1
                {type = 44, destId = 2213, srcId = 2207, decValue = 6, addValue = 3}, -- \\给予：神装★屠龙道戒Lv2，分解：神装★屠龙道戒Lv1
                {type = 46, destId = 2214, srcId = 2208, decValue = 6, addValue = 3}, -- \\给予：神装★屠龙道带Lv2，分解：神装★屠龙道带Lv1
                {type = 47, destId = 2215, srcId = 2209, decValue = 6, addValue = 3}, -- \\给予：神装★屠龙道靴Lv2，分解：神装★屠龙道靴Lv1
                {type = 40, destId = 2216, srcId = 2210, decValue = 9, addValue = 6}, -- \\给予：神装★屠龙道盔Lv3，分解：神装★屠龙道盔Lv2
                {type = 41, destId = 2217, srcId = 2211, decValue = 9, addValue = 6}, -- \\给予：神装★屠龙道链Lv3，分解：神装★屠龙道链Lv2
                {type = 42, destId = 2218, srcId = 2212, decValue = 9, addValue = 6}, -- \\给予：神装★屠龙道镯Lv3，分解：神装★屠龙道镯Lv2
                {type = 44, destId = 2219, srcId = 2213, decValue = 9, addValue = 6}, -- \\给予：神装★屠龙道戒Lv3，分解：神装★屠龙道戒Lv2
                {type = 46, destId = 2220, srcId = 2214, decValue = 9, addValue = 6}, -- \\给予：神装★屠龙道带Lv3，分解：神装★屠龙道带Lv2
                {type = 47, destId = 2221, srcId = 2215, decValue = 9, addValue = 6}, -- \\给予：神装★屠龙道靴Lv3，分解：神装★屠龙道靴Lv2
                {type = 40, destId = 2222, srcId = 2216, decValue = 12, addValue = 9}, -- \\给予：神装★屠龙道盔Lv4，分解：神装★屠龙道盔Lv3
                {type = 41, destId = 2223, srcId = 2217, decValue = 12, addValue = 9}, -- \\给予：神装★屠龙道链Lv4，分解：神装★屠龙道链Lv3
                {type = 42, destId = 2224, srcId = 2218, decValue = 12, addValue = 9}, -- \\给予：神装★屠龙道镯Lv4，分解：神装★屠龙道镯Lv3
                {type = 44, destId = 2225, srcId = 2219, decValue = 12, addValue = 9}, -- \\给予：神装★屠龙道戒Lv4，分解：神装★屠龙道戒Lv3
                {type = 46, destId = 2226, srcId = 2220, decValue = 12, addValue = 9}, -- \\给予：神装★屠龙道带Lv4，分解：神装★屠龙道带Lv3
                {type = 47, destId = 2227, srcId = 2221, decValue = 12, addValue = 9}, -- \\给予：神装★屠龙道靴Lv4，分解：神装★屠龙道靴Lv3
                {type = 40, destId = 2228, srcId = 2222, decValue = 15, addValue = 12}, -- \\给予：神装★屠龙道盔Lv5，分解：神装★屠龙道盔Lv4
                {type = 41, destId = 2229, srcId = 2223, decValue = 15, addValue = 12}, -- \\给予：神装★屠龙道链Lv5，分解：神装★屠龙道链Lv4
                {type = 42, destId = 2230, srcId = 2224, decValue = 15, addValue = 12}, -- \\给予：神装★屠龙道镯Lv5，分解：神装★屠龙道镯Lv4
                {type = 44, destId = 2231, srcId = 2225, decValue = 15, addValue = 12}, -- \\给予：神装★屠龙道戒Lv5，分解：神装★屠龙道戒Lv4
                {type = 46, destId = 2232, srcId = 2226, decValue = 15, addValue = 12}, -- \\给予：神装★屠龙道带Lv5，分解：神装★屠龙道带Lv4
                {type = 47, destId = 2233, srcId = 2227, decValue = 15, addValue = 12}, -- \\给予：神装★屠龙道靴Lv5，分解：神装★屠龙道靴Lv4
                {type = 40, destId = 2234, srcId = 2228, decValue = 18, addValue = 15}, -- \\给予：神装★屠龙道盔Lv6，分解：神装★屠龙道盔Lv5
                {type = 41, destId = 2235, srcId = 2229, decValue = 18, addValue = 15}, -- \\给予：神装★屠龙道链Lv6，分解：神装★屠龙道链Lv5
                {type = 42, destId = 2236, srcId = 2230, decValue = 18, addValue = 15}, -- \\给予：神装★屠龙道镯Lv6，分解：神装★屠龙道镯Lv5
                {type = 44, destId = 2237, srcId = 2231, decValue = 18, addValue = 15}, -- \\给予：神装★屠龙道戒Lv6，分解：神装★屠龙道戒Lv5
                {type = 46, destId = 2238, srcId = 2232, decValue = 18, addValue = 15}, -- \\给予：神装★屠龙道带Lv6，分解：神装★屠龙道带Lv5
                {type = 47, destId = 2239, srcId = 2233, decValue = 18, addValue = 15}, -- \\给予：神装★屠龙道靴Lv6，分解：神装★屠龙道靴Lv5
                {type = 40, destId = 2240, srcId = 2234, decValue = 21, addValue = 18}, -- \\给予：神装★屠龙道盔LvMax，分解：神装★屠龙道盔Lv6
                {type = 41, destId = 2241, srcId = 2235, decValue = 21, addValue = 18}, -- \\给予：神装★屠龙道链LvMax，分解：神装★屠龙道链Lv6
                {type = 42, destId = 2242, srcId = 2236, decValue = 21, addValue = 18}, -- \\给予：神装★屠龙道镯LvMax，分解：神装★屠龙道镯Lv6
                {type = 44, destId = 2243, srcId = 2237, decValue = 21, addValue = 18}, -- \\给予：神装★屠龙道戒LvMax，分解：神装★屠龙道戒Lv6
                {type = 46, destId = 2244, srcId = 2238, decValue = 21, addValue = 18}, -- \\给予：神装★屠龙道带LvMax，分解：神装★屠龙道带Lv6
                {type = 47, destId = 2245, srcId = 2239, decValue = 21, addValue = 18}, -- \\给予：神装★屠龙道靴LvMax，分解：神装★屠龙道靴Lv6
                {type = 40, destId = 2330, srcId = 2240, decValue = 25, addValue = 21}, -- \\给予：神装★祖龙道盔Lv1，分解：神装★屠龙道盔LvMax
                {type = 41, destId = 2331, srcId = 2241, decValue = 25, addValue = 21}, -- \\给予：神装★祖龙道链Lv1，分解：神装★屠龙道链LvMax
                {type = 42, destId = 2332, srcId = 2242, decValue = 25, addValue = 21}, -- \\给予：神装★祖龙道镯Lv1，分解：神装★屠龙道镯LvMax
                {type = 44, destId = 2333, srcId = 2243, decValue = 25, addValue = 21}, -- \\给予：神装★祖龙道戒Lv1，分解：神装★屠龙道戒LvMax
                {type = 46, destId = 2334, srcId = 2244, decValue = 25, addValue = 21}, -- \\给予：神装★祖龙道带Lv1，分解：神装★屠龙道带LvMax
                {type = 47, destId = 2335, srcId = 2245, decValue = 25, addValue = 21}, -- \\给予：神装★祖龙道靴Lv1，分解：神装★屠龙道靴LvMax
                {type = 40, destId = 2336, srcId = 2330, decValue = 30, addValue = 25}, -- \\给予：神装★祖龙道盔Lv2，分解：神装★祖龙道盔Lv1
                {type = 41, destId = 2337, srcId = 2331, decValue = 30, addValue = 25}, -- \\给予：神装★祖龙道链Lv2，分解：神装★祖龙道链Lv1
                {type = 42, destId = 2338, srcId = 2332, decValue = 30, addValue = 25}, -- \\给予：神装★祖龙道镯Lv2，分解：神装★祖龙道镯Lv1
                {type = 44, destId = 2339, srcId = 2333, decValue = 30, addValue = 25}, -- \\给予：神装★祖龙道戒Lv2，分解：神装★祖龙道戒Lv1
                {type = 46, destId = 2340, srcId = 2334, decValue = 30, addValue = 25}, -- \\给予：神装★祖龙道带Lv2，分解：神装★祖龙道带Lv1
                {type = 47, destId = 2341, srcId = 2335, decValue = 30, addValue = 25}, -- \\给予：神装★祖龙道靴Lv2，分解：神装★祖龙道靴Lv1
                {type = 40, destId = 2342, srcId = 2336, decValue = 35, addValue = 30}, -- \\给予：神装★祖龙道盔Lv3，分解：神装★祖龙道盔Lv2
                {type = 41, destId = 2343, srcId = 2337, decValue = 35, addValue = 30}, -- \\给予：神装★祖龙道链Lv3，分解：神装★祖龙道链Lv2
                {type = 42, destId = 2344, srcId = 2338, decValue = 35, addValue = 30}, -- \\给予：神装★祖龙道镯Lv3，分解：神装★祖龙道镯Lv2
                {type = 44, destId = 2345, srcId = 2339, decValue = 35, addValue = 30}, -- \\给予：神装★祖龙道戒Lv3，分解：神装★祖龙道戒Lv2
                {type = 46, destId = 2346, srcId = 2340, decValue = 35, addValue = 30}, -- \\给予：神装★祖龙道带Lv3，分解：神装★祖龙道带Lv2
                {type = 47, destId = 2347, srcId = 2341, decValue = 35, addValue = 30}, -- \\给予：神装★祖龙道靴Lv3，分解：神装★祖龙道靴Lv2
                {type = 40, destId = 2348, srcId = 2342, decValue = 40, addValue = 35}, -- \\给予：神装★祖龙道盔Lv4，分解：神装★祖龙道盔Lv3
                {type = 41, destId = 2349, srcId = 2343, decValue = 40, addValue = 35}, -- \\给予：神装★祖龙道链Lv4，分解：神装★祖龙道链Lv3
                {type = 42, destId = 2350, srcId = 2344, decValue = 40, addValue = 35}, -- \\给予：神装★祖龙道镯Lv4，分解：神装★祖龙道镯Lv3
                {type = 44, destId = 2351, srcId = 2345, decValue = 40, addValue = 35}, -- \\给予：神装★祖龙道戒Lv4，分解：神装★祖龙道戒Lv3
                {type = 46, destId = 2352, srcId = 2346, decValue = 40, addValue = 35}, -- \\给予：神装★祖龙道带Lv4，分解：神装★祖龙道带Lv3
                {type = 47, destId = 2353, srcId = 2347, decValue = 40, addValue = 35}, -- \\给予：神装★祖龙道靴Lv4，分解：神装★祖龙道靴Lv3
                {type = 40, destId = 2354, srcId = 2348, decValue = 45, addValue = 40}, -- \\给予：神装★祖龙道盔Lv5，分解：神装★祖龙道盔Lv4
                {type = 41, destId = 2355, srcId = 2349, decValue = 45, addValue = 40}, -- \\给予：神装★祖龙道链Lv5，分解：神装★祖龙道链Lv4
                {type = 42, destId = 2356, srcId = 2350, decValue = 45, addValue = 40}, -- \\给予：神装★祖龙道镯Lv5，分解：神装★祖龙道镯Lv4
                {type = 44, destId = 2357, srcId = 2351, decValue = 45, addValue = 40}, -- \\给予：神装★祖龙道戒Lv5，分解：神装★祖龙道戒Lv4
                {type = 46, destId = 2358, srcId = 2352, decValue = 45, addValue = 40}, -- \\给予：神装★祖龙道带Lv5，分解：神装★祖龙道带Lv4
                {type = 47, destId = 2359, srcId = 2353, decValue = 45, addValue = 40}, -- \\给予：神装★祖龙道靴Lv5，分解：神装★祖龙道靴Lv4
                {type = 40, destId = 2360, srcId = 2354, decValue = 50, addValue = 45}, -- \\给予：神装★祖龙道盔Lv6，分解：神装★祖龙道盔Lv5
                {type = 41, destId = 2361, srcId = 2355, decValue = 50, addValue = 45}, -- \\给予：神装★祖龙道链Lv6，分解：神装★祖龙道链Lv5
                {type = 42, destId = 2362, srcId = 2356, decValue = 50, addValue = 45}, -- \\给予：神装★祖龙道镯Lv6，分解：神装★祖龙道镯Lv5
                {type = 44, destId = 2363, srcId = 2357, decValue = 50, addValue = 45}, -- \\给予：神装★祖龙道戒Lv6，分解：神装★祖龙道戒Lv5
                {type = 46, destId = 2364, srcId = 2358, decValue = 50, addValue = 45}, -- \\给予：神装★祖龙道带Lv6，分解：神装★祖龙道带Lv5
                {type = 47, destId = 2365, srcId = 2359, decValue = 50, addValue = 45}, -- \\给予：神装★祖龙道靴Lv6，分解：神装★祖龙道靴Lv5
                {type = 40, destId = 2366, srcId = 2360, decValue = 55, addValue = 50}, -- \\给予：神装★祖龙道盔LvMax，分解：神装★祖龙道盔Lv6
                {type = 41, destId = 2367, srcId = 2361, decValue = 55, addValue = 50}, -- \\给予：神装★祖龙道链LvMax，分解：神装★祖龙道链Lv6
                {type = 42, destId = 2368, srcId = 2362, decValue = 55, addValue = 50}, -- \\给予：神装★祖龙道镯LvMax，分解：神装★祖龙道镯Lv6
                {type = 44, destId = 2369, srcId = 2363, decValue = 55, addValue = 50}, -- \\给予：神装★祖龙道戒LvMax，分解：神装★祖龙道戒Lv6
                {type = 46, destId = 2370, srcId = 2364, decValue = 55, addValue = 50}, -- \\给予：神装★祖龙道带LvMax，分解：神装★祖龙道带Lv6
                {type = 47, destId = 2371, srcId = 2365, decValue = 55, addValue = 50}, -- \\给予：神装★祖龙道靴LvMax，分解：神装★祖龙道靴Lv6
                {type = 40, destId = 2456, srcId = 2366, decValue = 70, addValue = 55}, -- \\给予：神装★秦皇道盔Lv1，分解：神装★祖龙道盔LvMax
                {type = 41, destId = 2457, srcId = 2367, decValue = 70, addValue = 55}, -- \\给予：神装★秦皇道链Lv1，分解：神装★祖龙道链LvMax
                {type = 42, destId = 2458, srcId = 2368, decValue = 70, addValue = 55}, -- \\给予：神装★秦皇道镯Lv1，分解：神装★祖龙道镯LvMax
                {type = 44, destId = 2459, srcId = 2369, decValue = 70, addValue = 55}, -- \\给予：神装★秦皇道戒Lv1，分解：神装★祖龙道戒LvMax
                {type = 46, destId = 2460, srcId = 2370, decValue = 70, addValue = 55}, -- \\给予：神装★秦皇道带Lv1，分解：神装★祖龙道带LvMax
                {type = 47, destId = 2461, srcId = 2371, decValue = 70, addValue = 55}, -- \\给予：神装★秦皇道靴Lv1，分解：神装★祖龙道靴LvMax
                {type = 40, destId = 2462, srcId = 2456, decValue = 85, addValue = 70}, -- \\给予：神装★秦皇道盔Lv2，分解：神装★秦皇道盔Lv1
                {type = 41, destId = 2463, srcId = 2457, decValue = 85, addValue = 70}, -- \\给予：神装★秦皇道链Lv2，分解：神装★秦皇道链Lv1
                {type = 42, destId = 2464, srcId = 2458, decValue = 85, addValue = 70}, -- \\给予：神装★秦皇道镯Lv2，分解：神装★秦皇道镯Lv1
                {type = 44, destId = 2465, srcId = 2459, decValue = 85, addValue = 70}, -- \\给予：神装★秦皇道戒Lv2，分解：神装★秦皇道戒Lv1
                {type = 46, destId = 2466, srcId = 2460, decValue = 85, addValue = 70}, -- \\给予：神装★秦皇道带Lv2，分解：神装★秦皇道带Lv1
                {type = 47, destId = 2467, srcId = 2461, decValue = 85, addValue = 70}, -- \\给予：神装★秦皇道靴Lv2，分解：神装★秦皇道靴Lv1
                {type = 40, destId = 2468, srcId = 2462, decValue = 100, addValue = 85}, -- \\给予：神装★秦皇道盔Lv3，分解：神装★秦皇道盔Lv2
                {type = 41, destId = 2469, srcId = 2463, decValue = 100, addValue = 85}, -- \\给予：神装★秦皇道链Lv3，分解：神装★秦皇道链Lv2
                {type = 42, destId = 2470, srcId = 2464, decValue = 100, addValue = 85}, -- \\给予：神装★秦皇道镯Lv3，分解：神装★秦皇道镯Lv2
                {type = 44, destId = 2471, srcId = 2465, decValue = 100, addValue = 85}, -- \\给予：神装★秦皇道戒Lv3，分解：神装★秦皇道戒Lv2
                {type = 46, destId = 2472, srcId = 2466, decValue = 100, addValue = 85}, -- \\给予：神装★秦皇道带Lv3，分解：神装★秦皇道带Lv2
                {type = 47, destId = 2473, srcId = 2467, decValue = 100, addValue = 85}, -- \\给予：神装★秦皇道靴Lv3，分解：神装★秦皇道靴Lv2
                {type = 40, destId = 2474, srcId = 2468, decValue = 115, addValue = 100}, -- \\给予：神装★秦皇道盔Lv4，分解：神装★秦皇道盔Lv3
                {type = 41, destId = 2475, srcId = 2469, decValue = 115, addValue = 100}, -- \\给予：神装★秦皇道链Lv4，分解：神装★秦皇道链Lv3
                {type = 42, destId = 2476, srcId = 2470, decValue = 115, addValue = 100}, -- \\给予：神装★秦皇道镯Lv4，分解：神装★秦皇道镯Lv3
                {type = 44, destId = 2477, srcId = 2471, decValue = 115, addValue = 100}, -- \\给予：神装★秦皇道戒Lv4，分解：神装★秦皇道戒Lv3
                {type = 46, destId = 2478, srcId = 2472, decValue = 115, addValue = 100}, -- \\给予：神装★秦皇道带Lv4，分解：神装★秦皇道带Lv3
                {type = 47, destId = 2479, srcId = 2473, decValue = 115, addValue = 100}, -- \\给予：神装★秦皇道靴Lv4，分解：神装★秦皇道靴Lv3
                {type = 40, destId = 2480, srcId = 2474, decValue = 130, addValue = 115}, -- \\给予：神装★秦皇道盔Lv5，分解：神装★秦皇道盔Lv4
                {type = 41, destId = 2481, srcId = 2475, decValue = 130, addValue = 115}, -- \\给予：神装★秦皇道链Lv5，分解：神装★秦皇道链Lv4
                {type = 42, destId = 2482, srcId = 2476, decValue = 130, addValue = 115}, -- \\给予：神装★秦皇道镯Lv5，分解：神装★秦皇道镯Lv4
                {type = 44, destId = 2483, srcId = 2477, decValue = 130, addValue = 115}, -- \\给予：神装★秦皇道戒Lv5，分解：神装★秦皇道戒Lv4
                {type = 46, destId = 2484, srcId = 2478, decValue = 130, addValue = 115}, -- \\给予：神装★秦皇道带Lv5，分解：神装★秦皇道带Lv4
                {type = 47, destId = 2485, srcId = 2479, decValue = 130, addValue = 115}, -- \\给予：神装★秦皇道靴Lv5，分解：神装★秦皇道靴Lv4
                {type = 40, destId = 2486, srcId = 2480, decValue = 145, addValue = 130}, -- \\给予：神装★秦皇道盔Lv6，分解：神装★秦皇道盔Lv5
                {type = 41, destId = 2487, srcId = 2481, decValue = 145, addValue = 130}, -- \\给予：神装★秦皇道链Lv6，分解：神装★秦皇道链Lv5
                {type = 42, destId = 2488, srcId = 2482, decValue = 145, addValue = 130}, -- \\给予：神装★秦皇道镯Lv6，分解：神装★秦皇道镯Lv5
                {type = 44, destId = 2489, srcId = 2483, decValue = 145, addValue = 130}, -- \\给予：神装★秦皇道戒Lv6，分解：神装★秦皇道戒Lv5
                {type = 46, destId = 2490, srcId = 2484, decValue = 145, addValue = 130}, -- \\给予：神装★秦皇道带Lv6，分解：神装★秦皇道带Lv5
                {type = 47, destId = 2491, srcId = 2485, decValue = 145, addValue = 130}, -- \\给予：神装★秦皇道靴Lv6，分解：神装★秦皇道靴Lv5
                {type = 40, destId = 2492, srcId = 2486, decValue = 160, addValue = 145}, -- \\给予：神装★秦皇道盔LvMax，分解：神装★秦皇道盔Lv6
                {type = 41, destId = 2493, srcId = 2487, decValue = 160, addValue = 145}, -- \\给予：神装★秦皇道链LvMax，分解：神装★秦皇道链Lv6
                {type = 42, destId = 2494, srcId = 2488, decValue = 160, addValue = 145}, -- \\给予：神装★秦皇道镯LvMax，分解：神装★秦皇道镯Lv6
                {type = 44, destId = 2495, srcId = 2489, decValue = 160, addValue = 145}, -- \\给予：神装★秦皇道戒LvMax，分解：神装★秦皇道戒Lv6
                {type = 46, destId = 2496, srcId = 2490, decValue = 160, addValue = 145}, -- \\给予：神装★秦皇道带LvMax，分解：神装★秦皇道带Lv6
                {type = 47, destId = 2497, srcId = 2491, decValue = 160, addValue = 145}, -- \\给予：神装★秦皇道靴LvMax，分解：神装★秦皇道靴Lv6
                {type = 40, destId = 0, srcId = 2492, decValue = 0, addValue = 160}, -- \\给予：0，分解：神装★秦皇道盔LvMax
                {type = 41, destId = 0, srcId = 2493, decValue = 0, addValue = 160}, -- \\给予：0，分解：神装★秦皇道链LvMax
                {type = 42, destId = 0, srcId = 2494, decValue = 0, addValue = 160}, -- \\给予：0，分解：神装★秦皇道镯LvMax
                {type = 44, destId = 0, srcId = 2495, decValue = 0, addValue = 160}, -- \\给予：0，分解：神装★秦皇道戒LvMax
                {type = 46, destId = 0, srcId = 2496, decValue = 0, addValue = 160}, -- \\给予：0，分解：神装★秦皇道带LvMax
                {type = 47, destId = 0, srcId = 2497, decValue = 0, addValue = 160}, -- \\给予：0，分解：神装★秦皇道靴LvMax
            
            
            
            },
        },
        
        
        
        
        
        
        --神装兑换
        ExChange =
        {
            --战士 type=装备位置 destId=兑换道具id delValue=消耗圣魂值
            {
                
                -- {type = 14, destId = 4747, decValue = 12}, -- \\给予：神装★屠龙圣器Lv1
                -- {type = 12, destId = 4873, decValue = 12, sex = 0}, -- \\给予：神装★屠龙战甲Lv1
                -- {type = 12, destId = 4880, decValue = 12, sex = 1}, -- \\给予：神装★屠龙战衣Lv1
                {type = 40, destId = 2120, decValue = 6}, -- \\给予：神装★屠龙战盔Lv1
                {type = 41, destId = 2121, decValue = 6}, -- \\给予：神装★屠龙战链Lv1
                {type = 42, destId = 2122, decValue = 6}, -- \\给予：神装★屠龙战镯Lv1
                {type = 44, destId = 2123, decValue = 6}, -- \\给予：神装★屠龙战戒Lv1
                {type = 46, destId = 2124, decValue = 6}, -- \\给予：神装★屠龙战带Lv1
                {type = 47, destId = 2125, decValue = 6}, -- \\给予：神装★屠龙战靴Lv1
            
            
            },
            
            --法师
            {
                
                -- {type = 14, destId = 4754, decValue = 12}, -- \\给予：神装★屠龙魔器Lv1
                -- {type = 12, destId = 4887, decValue = 12, sex = 0}, -- \\给予：神装★屠龙法甲Lv1
                -- {type = 12, destId = 4894, decValue = 12, sex = 1}, -- \\给予：神装★屠龙法衣Lv1
                {type = 40, destId = 2162, decValue = 6}, -- \\给予：神装★屠龙法盔Lv1
                {type = 41, destId = 2163, decValue = 6}, -- \\给予：神装★屠龙法链Lv1
                {type = 42, destId = 2164, decValue = 6}, -- \\给予：神装★屠龙法镯Lv1
                {type = 44, destId = 2165, decValue = 6}, -- \\给予：神装★屠龙法戒Lv1
                {type = 46, destId = 2166, decValue = 6}, -- \\给予：神装★屠龙法带Lv1
                {type = 47, destId = 2167, decValue = 6}, -- \\给予：神装★屠龙法靴Lv1
            
            },
            --道士
            {
                
                -- {type = 14, destId = 4761, decValue = 12}, -- \\给予：神装★屠龙道器Lv1
                -- {type = 12, destId = 4901, decValue = 12, sex = 0}, -- \\给予：神装★屠龙道甲Lv1
                -- {type = 12, destId = 4908, decValue = 12, sex = 1}, -- \\给予：神装★屠龙道衣Lv1
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
