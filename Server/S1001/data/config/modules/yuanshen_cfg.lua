-- 元神系统配置

yuanshen_cfg = {
	
	-- 升级消耗元神灵力，第1个为从0级升到1级所扣的元神灵力，后面的以此类推
	upgradeConsume = { 60000,80000,100000,120000,140000,160000,190000,220000,250000,280000,310000,340000,390000,440000,490000,540000,590000,640000,700000,760000,820000,880000,940000,1000000,1070000,1140000,1210000,1280000,1350000,1420000,1510000,1600000,1690000,1780000,1870000,1960000,2060000,2160000,2260000,2360000,2460000,2560000,2660000,2760000,2860000,2960000,3060000,3160000,3260000,3360000,3460000,3560000,3660000,3760000,3860000,3960000,4060000,4160000,4260000,4360000
},
	
	-- 等级兑换元神灵力(从120级开始)
	exchangeYuanshenExp = {93600,96500,99880,99880,99880,99880,99880,99880,99880,99880,99880,99880,99880,99880,99880,99880,99880,99880,99880,99880,99880,99880,99880,99880,99880,99880,99880,99880,99880,99880,99880
},
	
	-- 等级属性
	levels = {
		-------------------------- 战
		{

			-- -- (a1) 级
			-- {
			-- 	{ type = (a2) , value = (a3) },--(a4) 
			-- 	{ type = (a5) , value = (a6) },--(a7) 
			-- 	{ type = (a8) , value = (a9) },--(a10) 
			-- 	{ type = (a11) , value = (a12) },--(a13) 
			-- 	{ type = (a14) , value = (a15) },--(a16) 
			-- 	{ type = (a17) , value = (a18) },--(a19) 
			-- 	{ type = (a20) , value = (a21) },--(a22) 
			-- 	{ type = (a23) , value = (a24) },--(a25) 
			-- },


			-- 1 级
			{
				{ type = 9 , value = 71 },--物理攻击小 
				{ type = 11 , value = 150 },--物理攻击大 
				{ type = 21 , value = 36 },--物理防御小 
				{ type = 23 , value = 60 },--物理防御大 
				{ type = 25 , value = 18 },--魔法防御小 
				{ type = 27 , value = 30 },--魔法防御大 
				{ type = 5 , value = 900 },--战士生命值 
				{ type = 7 , value = 90 },--战士魔法值 
			},
-- 2 级
			{
				{ type = 9 , value = 148 },--物理攻击小 
				{ type = 11 , value = 310 },--物理攻击大 
				{ type = 21 , value = 74 },--物理防御小 
				{ type = 23 , value = 124 },--物理防御大 
				{ type = 25 , value = 37 },--魔法防御小 
				{ type = 27 , value = 62 },--魔法防御大 
				{ type = 5 , value = 1860 },--战士生命值 
				{ type = 7 , value = 186 },--战士魔法值 
			},
-- 3 级
			{
				{ type = 9 , value = 227 },--物理攻击小 
				{ type = 11 , value = 477 },--物理攻击大 
				{ type = 21 , value = 115 },--物理防御小 
				{ type = 23 , value = 191 },--物理防御大 
				{ type = 25 , value = 57 },--魔法防御小 
				{ type = 27 , value = 95 },--魔法防御大 
				{ type = 5 , value = 2862 },--战士生命值 
				{ type = 7 , value = 286 },--战士魔法值 
			},
-- 4 级
			{
				{ type = 9 , value = 309 },--物理攻击小 
				{ type = 11 , value = 648 },--物理攻击大 
				{ type = 21 , value = 155 },--物理防御小 
				{ type = 23 , value = 259 },--物理防御大 
				{ type = 25 , value = 77 },--魔法防御小 
				{ type = 27 , value = 129 },--魔法防御大 
				{ type = 5 , value = 3888 },--战士生命值 
				{ type = 7 , value = 389 },--战士魔法值 
			},
-- 5 级
			{
				{ type = 9 , value = 392 },--物理攻击小 
				{ type = 11 , value = 823 },--物理攻击大 
				{ type = 21 , value = 197 },--物理防御小 
				{ type = 23 , value = 329 },--物理防御大 
				{ type = 25 , value = 98 },--魔法防御小 
				{ type = 27 , value = 164 },--魔法防御大 
				{ type = 5 , value = 4938 },--战士生命值 
				{ type = 7 , value = 494 },--战士魔法值 
			},
-- 6 级
			{
				{ type = 9 , value = 477 },--物理攻击小 
				{ type = 11 , value = 1001 },--物理攻击大 
				{ type = 21 , value = 240 },--物理防御小 
				{ type = 23 , value = 400 },--物理防御大 
				{ type = 25 , value = 120 },--魔法防御小 
				{ type = 27 , value = 200 },--魔法防御大 
				{ type = 5 , value = 6006 },--战士生命值 
				{ type = 7 , value = 601 },--战士魔法值 
			},
-- 7 级
			{
				{ type = 9 , value = 567 },--物理攻击小 
				{ type = 11 , value = 1191 },--物理攻击大 
				{ type = 21 , value = 286 },--物理防御小 
				{ type = 23 , value = 476 },--物理防御大 
				{ type = 25 , value = 140 },--魔法防御小 
				{ type = 27 , value = 233 },--魔法防御大 
				{ type = 5 , value = 7146 },--战士生命值 
				{ type = 7 , value = 715 },--战士魔法值 
			},
-- 8 级
			{
				{ type = 9 , value = 662 },--物理攻击小 
				{ type = 11 , value = 1391 },--物理攻击大 
				{ type = 21 , value = 334 },--物理防御小 
				{ type = 23 , value = 556 },--物理防御大 
				{ type = 25 , value = 158 },--魔法防御小 
				{ type = 27 , value = 264 },--魔法防御大 
				{ type = 5 , value = 8346 },--战士生命值 
				{ type = 7 , value = 835 },--战士魔法值 
			},
-- 9 级
			{
				{ type = 9 , value = 761 },--物理攻击小 
				{ type = 11 , value = 1599 },--物理攻击大 
				{ type = 21 , value = 384 },--物理防御小 
				{ type = 23 , value = 640 },--物理防御大 
				{ type = 25 , value = 176 },--魔法防御小 
				{ type = 27 , value = 293 },--魔法防御大 
				{ type = 5 , value = 9594 },--战士生命值 
				{ type = 7 , value = 959 },--战士魔法值 
			},
-- 10 级
			{
				{ type = 9 , value = 864 },--物理攻击小 
				{ type = 11 , value = 1814 },--物理攻击大 
				{ type = 21 , value = 436 },--物理防御小 
				{ type = 23 , value = 726 },--物理防御大 
				{ type = 25 , value = 193 },--魔法防御小 
				{ type = 27 , value = 321 },--魔法防御大 
				{ type = 5 , value = 10884 },--战士生命值 
				{ type = 7 , value = 1088 },--战士魔法值 
			},
-- 11 级
			{
				{ type = 9 , value = 969 },--物理攻击小 
				{ type = 11 , value = 2035 },--物理攻击大 
				{ type = 21 , value = 488 },--物理防御小 
				{ type = 23 , value = 814 },--物理防御大 
				{ type = 25 , value = 208 },--魔法防御小 
				{ type = 27 , value = 347 },--魔法防御大 
				{ type = 5 , value = 12210 },--战士生命值 
				{ type = 7 , value = 1221 },--战士魔法值 
			},
-- 12 级
			{
				{ type = 9 , value = 1077 },--物理攻击小 
				{ type = 11 , value = 2262 },--物理攻击大 
				{ type = 21 , value = 543 },--物理防御小 
				{ type = 23 , value = 905 },--物理防御大 
				{ type = 25 , value = 223 },--魔法防御小 
				{ type = 27 , value = 372 },--魔法防御大 
				{ type = 5 , value = 13572 },--战士生命值 
				{ type = 7 , value = 1357 },--战士魔法值 
			},
-- 13 级
			{
				{ type = 9 , value = 1193 },--物理攻击小 
				{ type = 11 , value = 2506 },--物理攻击大 
				{ type = 21 , value = 601 },--物理防御小 
				{ type = 23 , value = 1002 },--物理防御大 
				{ type = 25 , value = 241 },--魔法防御小 
				{ type = 27 , value = 401 },--魔法防御大 
				{ type = 5 , value = 15036 },--战士生命值 
				{ type = 7 , value = 1504 },--战士魔法值 
			},
-- 14 级
			{
				{ type = 9 , value = 1317 },--物理攻击小 
				{ type = 11 , value = 2765 },--物理攻击大 
				{ type = 21 , value = 664 },--物理防御小 
				{ type = 23 , value = 1106 },--物理防御大 
				{ type = 25 , value = 260 },--魔法防御小 
				{ type = 27 , value = 434 },--魔法防御大 
				{ type = 5 , value = 16590 },--战士生命值 
				{ type = 7 , value = 1659 },--战士魔法值 
			},
-- 15 级
			{
				{ type = 9 , value = 1446 },--物理攻击小 
				{ type = 11 , value = 3037 },--物理攻击大 
				{ type = 21 , value = 729 },--物理防御小 
				{ type = 23 , value = 1215 },--物理防御大 
				{ type = 25 , value = 282 },--魔法防御小 
				{ type = 27 , value = 470 },--魔法防御大 
				{ type = 5 , value = 18222 },--战士生命值 
				{ type = 7 , value = 1822 },--战士魔法值 
			},
-- 16 级
			{
				{ type = 9 , value = 1581 },--物理攻击小 
				{ type = 11 , value = 3321 },--物理攻击大 
				{ type = 21 , value = 797 },--物理防御小 
				{ type = 23 , value = 1328 },--物理防御大 
				{ type = 25 , value = 305 },--魔法防御小 
				{ type = 27 , value = 509 },--魔法防御大 
				{ type = 5 , value = 19926 },--战士生命值 
				{ type = 7 , value = 1993 },--战士魔法值 
			},
-- 17 级
			{
				{ type = 9 , value = 1722 },--物理攻击小 
				{ type = 11 , value = 3616 },--物理攻击大 
				{ type = 21 , value = 868 },--物理防御小 
				{ type = 23 , value = 1446 },--物理防御大 
				{ type = 25 , value = 331 },--魔法防御小 
				{ type = 27 , value = 551 },--魔法防御大 
				{ type = 5 , value = 21696 },--战士生命值 
				{ type = 7 , value = 2170 },--战士魔法值 
			},
-- 18 级
			{
				{ type = 9 , value = 1867 },--物理攻击小 
				{ type = 11 , value = 3921 },--物理攻击大 
				{ type = 21 , value = 941 },--物理防御小 
				{ type = 23 , value = 1568 },--物理防御大 
				{ type = 25 , value = 357 },--魔法防御小 
				{ type = 27 , value = 595 },--魔法防御大 
				{ type = 5 , value = 23526 },--战士生命值 
				{ type = 7 , value = 2353 },--战士魔法值 
			},
-- 19 级
			{
				{ type = 9 , value = 2019 },--物理攻击小 
				{ type = 11 , value = 4239 },--物理攻击大 
				{ type = 21 , value = 1018 },--物理防御小 
				{ type = 23 , value = 1696 },--物理防御大 
				{ type = 25 , value = 384 },--魔法防御小 
				{ type = 27 , value = 640 },--魔法防御大 
				{ type = 5 , value = 25434 },--战士生命值 
				{ type = 7 , value = 2543 },--战士魔法值 
			},
-- 20 级
			{
				{ type = 9 , value = 2176 },--物理攻击小 
				{ type = 11 , value = 4569 },--物理攻击大 
				{ type = 21 , value = 1097 },--物理防御小 
				{ type = 23 , value = 1828 },--物理防御大 
				{ type = 25 , value = 412 },--魔法防御小 
				{ type = 27 , value = 687 },--魔法防御大 
				{ type = 5 , value = 27414 },--战士生命值 
				{ type = 7 , value = 2741 },--战士魔法值 
			},
-- 21 级
			{
				{ type = 9 , value = 2339 },--物理攻击小 
				{ type = 11 , value = 4911 },--物理攻击大 
				{ type = 21 , value = 1178 },--物理防御小 
				{ type = 23 , value = 1964 },--物理防御大 
				{ type = 25 , value = 441 },--魔法防御小 
				{ type = 27 , value = 735 },--魔法防御大 
				{ type = 5 , value = 29466 },--战士生命值 
				{ type = 7 , value = 2947 },--战士魔法值 
			},
-- 22 级
			{
				{ type = 9 , value = 2506 },--物理攻击小 
				{ type = 11 , value = 5263 },--物理攻击大 
				{ type = 21 , value = 1263 },--物理防御小 
				{ type = 23 , value = 2105 },--物理防御大 
				{ type = 25 , value = 471 },--魔法防御小 
				{ type = 27 , value = 785 },--魔法防御大 
				{ type = 5 , value = 31578 },--战士生命值 
				{ type = 7 , value = 3158 },--战士魔法值 
			},
-- 23 级
			{
				{ type = 9 , value = 2679 },--物理攻击小 
				{ type = 11 , value = 5625 },--物理攻击大 
				{ type = 21 , value = 1350 },--物理防御小 
				{ type = 23 , value = 2250 },--物理防御大 
				{ type = 25 , value = 502 },--魔法防御小 
				{ type = 27 , value = 836 },--魔法防御大 
				{ type = 5 , value = 33750 },--战士生命值 
				{ type = 7 , value = 3375 },--战士魔法值 
			},
-- 24 级
			{
				{ type = 9 , value = 2855 },--物理攻击小 
				{ type = 11 , value = 5995 },--物理攻击大 
				{ type = 21 , value = 1439 },--物理防御小 
				{ type = 23 , value = 2398 },--物理防御大 
				{ type = 25 , value = 533 },--魔法防御小 
				{ type = 27 , value = 888 },--魔法防御大 
				{ type = 5 , value = 35970 },--战士生命值 
				{ type = 7 , value = 3597 },--战士魔法值 
			},
-- 25 级
			{
				{ type = 9 , value = 3037 },--物理攻击小 
				{ type = 11 , value = 6377 },--物理攻击大 
				{ type = 21 , value = 1531 },--物理防御小 
				{ type = 23 , value = 2551 },--物理防御大 
				{ type = 25 , value = 565 },--魔法防御小 
				{ type = 27 , value = 941 },--魔法防御大 
				{ type = 5 , value = 38262 },--战士生命值 
				{ type = 7 , value = 3826 },--战士魔法值 
			},
-- 26 级
			{
				{ type = 9 , value = 3224 },--物理攻击小 
				{ type = 11 , value = 6770 },--物理攻击大 
				{ type = 21 , value = 1625 },--物理防御小 
				{ type = 23 , value = 2708 },--物理防御大 
				{ type = 25 , value = 597 },--魔法防御小 
				{ type = 27 , value = 995 },--魔法防御大 
				{ type = 5 , value = 40620 },--战士生命值 
				{ type = 7 , value = 4062 },--战士魔法值 
			},
-- 27 级
			{
				{ type = 9 , value = 3416 },--物理攻击小 
				{ type = 11 , value = 7173 },--物理攻击大 
				{ type = 21 , value = 1721 },--物理防御小 
				{ type = 23 , value = 2869 },--物理防御大 
				{ type = 25 , value = 630 },--魔法防御小 
				{ type = 27 , value = 1050 },--魔法防御大 
				{ type = 5 , value = 43038 },--战士生命值 
				{ type = 7 , value = 4304 },--战士魔法值 
			},
-- 28 级
			{
				{ type = 9 , value = 3612 },--物理攻击小 
				{ type = 11 , value = 7586 },--物理攻击大 
				{ type = 21 , value = 1820 },--物理防御小 
				{ type = 23 , value = 3034 },--物理防御大 
				{ type = 25 , value = 663 },--魔法防御小 
				{ type = 27 , value = 1105 },--魔法防御大 
				{ type = 5 , value = 45516 },--战士生命值 
				{ type = 7 , value = 4552 },--战士魔法值 
			},
-- 29 级
			{
				{ type = 9 , value = 3813 },--物理攻击小 
				{ type = 11 , value = 8008 },--物理攻击大 
				{ type = 21 , value = 1922 },--物理防御小 
				{ type = 23 , value = 3203 },--物理防御大 
				{ type = 25 , value = 697 },--魔法防御小 
				{ type = 27 , value = 1161 },--魔法防御大 
				{ type = 5 , value = 48048 },--战士生命值 
				{ type = 7 , value = 4805 },--战士魔法值 
			},
-- 30 级
			{
				{ type = 9 , value = 4018 },--物理攻击小 
				{ type = 11 , value = 8438 },--物理攻击大 
				{ type = 21 , value = 2025 },--物理防御小 
				{ type = 23 , value = 3375 },--物理防御大 
				{ type = 25 , value = 731 },--魔法防御小 
				{ type = 27 , value = 1218 },--魔法防御大 
				{ type = 5 , value = 50628 },--战士生命值 
				{ type = 7 , value = 5063 },--战士魔法值 
			},
-- 31 级
			{
				{ type = 9 , value = 4230 },--物理攻击小 
				{ type = 11 , value = 8882 },--物理攻击大 
				{ type = 21 , value = 2132 },--物理防御小 
				{ type = 23 , value = 3553 },--物理防御大 
				{ type = 25 , value = 766 },--魔法防御小 
				{ type = 27 , value = 1276 },--魔法防御大 
				{ type = 5 , value = 53292 },--战士生命值 
				{ type = 7 , value = 5329 },--战士魔法值 
			},
-- 32 级
			{
				{ type = 9 , value = 4447 },--物理攻击小 
				{ type = 11 , value = 9339 },--物理攻击大 
				{ type = 21 , value = 2242 },--物理防御小 
				{ type = 23 , value = 3736 },--物理防御大 
				{ type = 25 , value = 801 },--魔法防御小 
				{ type = 27 , value = 1335 },--魔法防御大 
				{ type = 5 , value = 56034 },--战士生命值 
				{ type = 7 , value = 5603 },--战士魔法值 
			},
-- 33 级
			{
				{ type = 9 , value = 4670 },--物理攻击小 
				{ type = 11 , value = 9808 },--物理攻击大 
				{ type = 21 , value = 2354 },--物理防御小 
				{ type = 23 , value = 3923 },--物理防御大 
				{ type = 25 , value = 837 },--魔法防御小 
				{ type = 27 , value = 1395 },--魔法防御大 
				{ type = 5 , value = 58848 },--战士生命值 
				{ type = 7 , value = 5885 },--战士魔法值 
			},
-- 34 级
			{
				{ type = 9 , value = 4900 },--物理攻击小 
				{ type = 11 , value = 10289 },--物理攻击大 
				{ type = 21 , value = 2470 },--物理防御小 
				{ type = 23 , value = 4116 },--物理防御大 
				{ type = 25 , value = 874 },--魔法防御小 
				{ type = 27 , value = 1456 },--魔法防御大 
				{ type = 5 , value = 61734 },--战士生命值 
				{ type = 7 , value = 6173 },--战士魔法值 
			},
-- 35 级
			{
				{ type = 9 , value = 5134 },--物理攻击小 
				{ type = 11 , value = 10781 },--物理攻击大 
				{ type = 21 , value = 2587 },--物理防御小 
				{ type = 23 , value = 4312 },--物理防御大 
				{ type = 25 , value = 910 },--魔法防御小 
				{ type = 27 , value = 1517 },--魔法防御大 
				{ type = 5 , value = 64686 },--战士生命值 
				{ type = 7 , value = 6469 },--战士魔法值 
			},
-- 36 级
			{
				{ type = 9 , value = 5373 },--物理攻击小 
				{ type = 11 , value = 11284 },--物理攻击大 
				{ type = 21 , value = 2708 },--物理防御小 
				{ type = 23 , value = 4514 },--物理防御大 
				{ type = 25 , value = 947 },--魔法防御小 
				{ type = 27 , value = 1579 },--魔法防御大 
				{ type = 5 , value = 67704 },--战士生命值 
				{ type = 7 , value = 6770 },--战士魔法值 
			},
-- 37 级
			{
				{ type = 9 , value = 5619 },--物理攻击小 
				{ type = 11 , value = 11799 },--物理攻击大 
				{ type = 21 , value = 2832 },--物理防御小 
				{ type = 23 , value = 4720 },--物理防御大 
				{ type = 25 , value = 985 },--魔法防御小 
				{ type = 27 , value = 1642 },--魔法防御大 
				{ type = 5 , value = 70794 },--战士生命值 
				{ type = 7 , value = 7079 },--战士魔法值 
			},
-- 38 级
			{
				{ type = 9 , value = 5870 },--物理攻击小 
				{ type = 11 , value = 12326 },--物理攻击大 
				{ type = 21 , value = 2958 },--物理防御小 
				{ type = 23 , value = 4930 },--物理防御大 
				{ type = 25 , value = 1023 },--魔法防御小 
				{ type = 27 , value = 1705 },--魔法防御大 
				{ type = 5 , value = 73956 },--战士生命值 
				{ type = 7 , value = 7396 },--战士魔法值 
			},
-- 39 级
			{
				{ type = 9 , value = 6126 },--物理攻击小 
				{ type = 11 , value = 12864 },--物理攻击大 
				{ type = 21 , value = 3088 },--物理防御小 
				{ type = 23 , value = 5146 },--物理防御大 
				{ type = 25 , value = 1061 },--魔法防御小 
				{ type = 27 , value = 1769 },--魔法防御大 
				{ type = 5 , value = 77184 },--战士生命值 
				{ type = 7 , value = 7718 },--战士魔法值 
			},
-- 40 级
			{
				{ type = 9 , value = 6387 },--物理攻击小 
				{ type = 11 , value = 13413 },--物理攻击大 
				{ type = 21 , value = 3219 },--物理防御小 
				{ type = 23 , value = 5365 },--物理防御大 
				{ type = 25 , value = 1100 },--魔法防御小 
				{ type = 27 , value = 1834 },--魔法防御大 
				{ type = 5 , value = 80478 },--战士生命值 
				{ type = 7 , value = 8048 },--战士魔法值 
			},
-- 41 级
			{
				{ type = 9 , value = 6653 },--物理攻击小 
				{ type = 11 , value = 13972 },--物理攻击大 
				{ type = 21 , value = 3353 },--物理防御小 
				{ type = 23 , value = 5589 },--物理防御大 
				{ type = 25 , value = 1139 },--魔法防御小 
				{ type = 27 , value = 1899 },--魔法防御大 
				{ type = 5 , value = 83832 },--战士生命值 
				{ type = 7 , value = 8383 },--战士魔法值 
			},
-- 42 级
			{
				{ type = 9 , value = 6924 },--物理攻击小 
				{ type = 11 , value = 14541 },--物理攻击大 
				{ type = 21 , value = 3490 },--物理防御小 
				{ type = 23 , value = 5816 },--物理防御大 
				{ type = 25 , value = 1179 },--魔法防御小 
				{ type = 27 , value = 1965 },--魔法防御大 
				{ type = 5 , value = 87246 },--战士生命值 
				{ type = 7 , value = 8725 },--战士魔法值 
			},
-- 43 级
			{
				{ type = 9 , value = 7200 },--物理攻击小 
				{ type = 11 , value = 15119 },--物理攻击大 
				{ type = 21 , value = 3629 },--物理防御小 
				{ type = 23 , value = 6048 },--物理防御大 
				{ type = 25 , value = 1219 },--魔法防御小 
				{ type = 27 , value = 2032 },--魔法防御大 
				{ type = 5 , value = 90714 },--战士生命值 
				{ type = 7 , value = 9071 },--战士魔法值 
			},
-- 44 级
			{
				{ type = 9 , value = 7479 },--物理攻击小 
				{ type = 11 , value = 15706 },--物理攻击大 
				{ type = 21 , value = 3769 },--物理防御小 
				{ type = 23 , value = 6282 },--物理防御大 
				{ type = 25 , value = 1260 },--魔法防御小 
				{ type = 27 , value = 2100 },--魔法防御大 
				{ type = 5 , value = 94236 },--战士生命值 
				{ type = 7 , value = 9424 },--战士魔法值 
			},
-- 45 级
			{
				{ type = 9 , value = 7763 },--物理攻击小 
				{ type = 11 , value = 16302 },--物理攻击大 
				{ type = 21 , value = 3913 },--物理防御小 
				{ type = 23 , value = 6521 },--物理防御大 
				{ type = 25 , value = 1301 },--魔法防御小 
				{ type = 27 , value = 2169 },--魔法防御大 
				{ type = 5 , value = 97812 },--战士生命值 
				{ type = 7 , value = 9781 },--战士魔法值 
			},
-- 46 级
			{
				{ type = 9 , value = 8050 },--物理攻击小 
				{ type = 11 , value = 16906 },--物理攻击大 
				{ type = 21 , value = 4057 },--物理防御小 
				{ type = 23 , value = 6762 },--物理防御大 
				{ type = 25 , value = 1343 },--魔法防御小 
				{ type = 27 , value = 2239 },--魔法防御大 
				{ type = 5 , value = 101436 },--战士生命值 
				{ type = 7 , value = 10144 },--战士魔法值 
			},
-- 47 级
			{
				{ type = 9 , value = 8342 },--物理攻击小 
				{ type = 11 , value = 17518 },--物理攻击大 
				{ type = 21 , value = 4204 },--物理防御小 
				{ type = 23 , value = 7007 },--物理防御大 
				{ type = 25 , value = 1386 },--魔法防御小 
				{ type = 27 , value = 2310 },--魔法防御大 
				{ type = 5 , value = 105108 },--战士生命值 
				{ type = 7 , value = 10511 },--战士魔法值 
			},
-- 48 级
			{
				{ type = 9 , value = 8637 },--物理攻击小 
				{ type = 11 , value = 18138 },--物理攻击大 
				{ type = 21 , value = 4353 },--物理防御小 
				{ type = 23 , value = 7255 },--物理防御大 
				{ type = 25 , value = 1429 },--魔法防御小 
				{ type = 27 , value = 2382 },--魔法防御大 
				{ type = 5 , value = 108828 },--战士生命值 
				{ type = 7 , value = 10883 },--战士魔法值 
			},
-- 49 级
			{
				{ type = 9 , value = 8936 },--物理攻击小 
				{ type = 11 , value = 18765 },--物理攻击大 
				{ type = 21 , value = 4504 },--物理防御小 
				{ type = 23 , value = 7506 },--物理防御大 
				{ type = 25 , value = 1473 },--魔法防御小 
				{ type = 27 , value = 2455 },--魔法防御大 
				{ type = 5 , value = 112590 },--战士生命值 
				{ type = 7 , value = 11259 },--战士魔法值 
			},
-- 50 级
			{
				{ type = 9 , value = 9238 },--物理攻击小 
				{ type = 11 , value = 19399 },--物理攻击大 
				{ type = 21 , value = 4656 },--物理防御小 
				{ type = 23 , value = 7760 },--物理防御大 
				{ type = 25 , value = 1518 },--魔法防御小 
				{ type = 27 , value = 2530 },--魔法防御大 
				{ type = 5 , value = 116394 },--战士生命值 
				{ type = 7 , value = 11639 },--战士魔法值 
			},
-- 51 级
			{
				{ type = 9 , value = 9543 },--物理攻击小 
				{ type = 11 , value = 20040 },--物理攻击大 
				{ type = 21 , value = 4810 },--物理防御小 
				{ type = 23 , value = 8016 },--物理防御大 
				{ type = 25 , value = 1564 },--魔法防御小 
				{ type = 27 , value = 2606 },--魔法防御大 
				{ type = 5 , value = 120240 },--战士生命值 
				{ type = 7 , value = 12024 },--战士魔法值 
			},
-- 52 级
			{
				{ type = 9 , value = 9851 },--物理攻击小 
				{ type = 11 , value = 20687 },--物理攻击大 
				{ type = 21 , value = 4965 },--物理防御小 
				{ type = 23 , value = 8275 },--物理防御大 
				{ type = 25 , value = 1610 },--魔法防御小 
				{ type = 27 , value = 2683 },--魔法防御大 
				{ type = 5 , value = 124122 },--战士生命值 
				{ type = 7 , value = 12412 },--战士魔法值 
			},
-- 53 级
			{
				{ type = 9 , value = 10162 },--物理攻击小 
				{ type = 11 , value = 21341 },--物理攻击大 
				{ type = 21 , value = 5122 },--物理防御小 
				{ type = 23 , value = 8536 },--物理防御大 
				{ type = 25 , value = 1657 },--魔法防御小 
				{ type = 27 , value = 2761 },--魔法防御大 
				{ type = 5 , value = 128046 },--战士生命值 
				{ type = 7 , value = 12805 },--战士魔法值 
			},
-- 54 级
			{
				{ type = 9 , value = 10477 },--物理攻击小 
				{ type = 11 , value = 22001 },--物理攻击大 
				{ type = 21 , value = 5280 },--物理防御小 
				{ type = 23 , value = 8800 },--物理防御大 
				{ type = 25 , value = 1704 },--魔法防御小 
				{ type = 27 , value = 2840 },--魔法防御大 
				{ type = 5 , value = 132006 },--战士生命值 
				{ type = 7 , value = 13201 },--战士魔法值 
			},
-- 55 级
			{
				{ type = 9 , value = 10794 },--物理攻击小 
				{ type = 11 , value = 22667 },--物理攻击大 
				{ type = 21 , value = 5440 },--物理防御小 
				{ type = 23 , value = 9067 },--物理防御大 
				{ type = 25 , value = 1753 },--魔法防御小 
				{ type = 27 , value = 2921 },--魔法防御大 
				{ type = 5 , value = 136002 },--战士生命值 
				{ type = 7 , value = 13600 },--战士魔法值 
			},
-- 56 级
			{
				{ type = 9 , value = 11113 },--物理攻击小 
				{ type = 11 , value = 23338 },--物理攻击大 
				{ type = 21 , value = 5601 },--物理防御小 
				{ type = 23 , value = 9335 },--物理防御大 
				{ type = 25 , value = 1802 },--魔法防御小 
				{ type = 27 , value = 3003 },--魔法防御大 
				{ type = 5 , value = 140028 },--战士生命值 
				{ type = 7 , value = 14003 },--战士魔法值 
			},
-- 57 级
			{
				{ type = 9 , value = 11436 },--物理攻击小 
				{ type = 11 , value = 24015 },--物理攻击大 
				{ type = 21 , value = 5764 },--物理防御小 
				{ type = 23 , value = 9606 },--物理防御大 
				{ type = 25 , value = 1852 },--魔法防御小 
				{ type = 27 , value = 3086 },--魔法防御大 
				{ type = 5 , value = 144090 },--战士生命值 
				{ type = 7 , value = 14409 },--战士魔法值 
			},
-- 58 级
			{
				{ type = 9 , value = 11760 },--物理攻击小 
				{ type = 11 , value = 24697 },--物理攻击大 
				{ type = 21 , value = 5927 },--物理防御小 
				{ type = 23 , value = 9879 },--物理防御大 
				{ type = 25 , value = 1903 },--魔法防御小 
				{ type = 27 , value = 3171 },--魔法防御大 
				{ type = 5 , value = 148182 },--战士生命值 
				{ type = 7 , value = 14818 },--战士魔法值 
			},
-- 59 级
			{
				{ type = 9 , value = 12088 },--物理攻击小 
				{ type = 11 , value = 25384 },--物理攻击大 
				{ type = 21 , value = 6092 },--物理防御小 
				{ type = 23 , value = 10154 },--物理防御大 
				{ type = 25 , value = 1954 },--魔法防御小 
				{ type = 27 , value = 3257 },--魔法防御大 
				{ type = 5 , value = 152304 },--战士生命值 
				{ type = 7 , value = 15230 },--战士魔法值 
			},
-- 60 级
			{
				{ type = 9 , value = 12417 },--物理攻击小 
				{ type = 11 , value = 26076 },--物理攻击大 
				{ type = 21 , value = 6258 },--物理防御小 
				{ type = 23 , value = 10430 },--物理防御大 
				{ type = 25 , value = 2006 },--魔法防御小 
				{ type = 27 , value = 3344 },--魔法防御大 
				{ type = 5 , value = 156456 },--战士生命值 
				{ type = 7 , value = 15646 },--战士魔法值 
			},

			
		},
		
		-------------------------- 法
		{
			-- 1 级
			{
				{ type = 13 , value = 71 },--魔法攻击小 
				{ type = 15 , value = 150 },--魔法攻击大 
				{ type = 21 , value = 36 },--物理防御小 
				{ type = 23 , value = 60 },--物理防御大 
				{ type = 25 , value = 18 },--魔法防御小 
				{ type = 27 , value = 30 },--魔法防御大 
				{ type = 5 , value = 900 },--战士生命值 
				{ type = 7 , value = 90 },--战士魔法值 
			},
-- 2 级
			{
				{ type = 13 , value = 148 },--魔法攻击小 
				{ type = 15 , value = 310 },--魔法攻击大 
				{ type = 21 , value = 74 },--物理防御小 
				{ type = 23 , value = 124 },--物理防御大 
				{ type = 25 , value = 37 },--魔法防御小 
				{ type = 27 , value = 62 },--魔法防御大 
				{ type = 5 , value = 1860 },--战士生命值 
				{ type = 7 , value = 186 },--战士魔法值 
			},
-- 3 级
			{
				{ type = 13 , value = 227 },--魔法攻击小 
				{ type = 15 , value = 477 },--魔法攻击大 
				{ type = 21 , value = 115 },--物理防御小 
				{ type = 23 , value = 191 },--物理防御大 
				{ type = 25 , value = 57 },--魔法防御小 
				{ type = 27 , value = 95 },--魔法防御大 
				{ type = 5 , value = 2862 },--战士生命值 
				{ type = 7 , value = 286 },--战士魔法值 
			},
-- 4 级
			{
				{ type = 13 , value = 309 },--魔法攻击小 
				{ type = 15 , value = 648 },--魔法攻击大 
				{ type = 21 , value = 155 },--物理防御小 
				{ type = 23 , value = 259 },--物理防御大 
				{ type = 25 , value = 77 },--魔法防御小 
				{ type = 27 , value = 129 },--魔法防御大 
				{ type = 5 , value = 3888 },--战士生命值 
				{ type = 7 , value = 389 },--战士魔法值 
			},
-- 5 级
			{
				{ type = 13 , value = 392 },--魔法攻击小 
				{ type = 15 , value = 823 },--魔法攻击大 
				{ type = 21 , value = 197 },--物理防御小 
				{ type = 23 , value = 329 },--物理防御大 
				{ type = 25 , value = 98 },--魔法防御小 
				{ type = 27 , value = 164 },--魔法防御大 
				{ type = 5 , value = 4938 },--战士生命值 
				{ type = 7 , value = 494 },--战士魔法值 
			},
-- 6 级
			{
				{ type = 13 , value = 477 },--魔法攻击小 
				{ type = 15 , value = 1001 },--魔法攻击大 
				{ type = 21 , value = 240 },--物理防御小 
				{ type = 23 , value = 400 },--物理防御大 
				{ type = 25 , value = 120 },--魔法防御小 
				{ type = 27 , value = 200 },--魔法防御大 
				{ type = 5 , value = 6006 },--战士生命值 
				{ type = 7 , value = 601 },--战士魔法值 
			},
-- 7 级
			{
				{ type = 13 , value = 555 },--魔法攻击小 
				{ type = 15 , value = 1166 },--魔法攻击大 
				{ type = 21 , value = 286 },--物理防御小 
				{ type = 23 , value = 476 },--物理防御大 
				{ type = 25 , value = 140 },--魔法防御小 
				{ type = 27 , value = 233 },--魔法防御大 
				{ type = 5 , value = 7146 },--战士生命值 
				{ type = 7 , value = 715 },--战士魔法值 
			},
-- 8 级
			{
				{ type = 13 , value = 629 },--魔法攻击小 
				{ type = 15 , value = 1321 },--魔法攻击大 
				{ type = 21 , value = 334 },--物理防御小 
				{ type = 23 , value = 556 },--物理防御大 
				{ type = 25 , value = 158 },--魔法防御小 
				{ type = 27 , value = 264 },--魔法防御大 
				{ type = 5 , value = 8346 },--战士生命值 
				{ type = 7 , value = 835 },--战士魔法值 
			},
-- 9 级
			{
				{ type = 13 , value = 699 },--魔法攻击小 
				{ type = 15 , value = 1467 },--魔法攻击大 
				{ type = 21 , value = 384 },--物理防御小 
				{ type = 23 , value = 640 },--物理防御大 
				{ type = 25 , value = 176 },--魔法防御小 
				{ type = 27 , value = 293 },--魔法防御大 
				{ type = 5 , value = 9594 },--战士生命值 
				{ type = 7 , value = 959 },--战士魔法值 
			},
-- 10 级
			{
				{ type = 13 , value = 764 },--魔法攻击小 
				{ type = 15 , value = 1605 },--魔法攻击大 
				{ type = 21 , value = 436 },--物理防御小 
				{ type = 23 , value = 726 },--物理防御大 
				{ type = 25 , value = 193 },--魔法防御小 
				{ type = 27 , value = 321 },--魔法防御大 
				{ type = 5 , value = 10884 },--战士生命值 
				{ type = 7 , value = 1088 },--战士魔法值 
			},
-- 11 级
			{
				{ type = 13 , value = 827 },--魔法攻击小 
				{ type = 15 , value = 1737 },--魔法攻击大 
				{ type = 21 , value = 488 },--物理防御小 
				{ type = 23 , value = 814 },--物理防御大 
				{ type = 25 , value = 208 },--魔法防御小 
				{ type = 27 , value = 347 },--魔法防御大 
				{ type = 5 , value = 12210 },--战士生命值 
				{ type = 7 , value = 1221 },--战士魔法值 
			},
-- 12 级
			{
				{ type = 13 , value = 888 },--魔法攻击小 
				{ type = 15 , value = 1864 },--魔法攻击大 
				{ type = 21 , value = 543 },--物理防御小 
				{ type = 23 , value = 905 },--物理防御大 
				{ type = 25 , value = 223 },--魔法防御小 
				{ type = 27 , value = 372 },--魔法防御大 
				{ type = 5 , value = 13572 },--战士生命值 
				{ type = 7 , value = 1357 },--战士魔法值 
			},
-- 13 级
			{
				{ type = 13 , value = 958 },--魔法攻击小 
				{ type = 15 , value = 2011 },--魔法攻击大 
				{ type = 21 , value = 601 },--物理防御小 
				{ type = 23 , value = 1002 },--物理防御大 
				{ type = 25 , value = 241 },--魔法防御小 
				{ type = 27 , value = 401 },--魔法防御大 
				{ type = 5 , value = 15036 },--战士生命值 
				{ type = 7 , value = 1504 },--战士魔法值 
			},
-- 14 级
			{
				{ type = 13 , value = 1036 },--魔法攻击小 
				{ type = 15 , value = 2176 },--魔法攻击大 
				{ type = 21 , value = 664 },--物理防御小 
				{ type = 23 , value = 1106 },--物理防御大 
				{ type = 25 , value = 260 },--魔法防御小 
				{ type = 27 , value = 434 },--魔法防御大 
				{ type = 5 , value = 16590 },--战士生命值 
				{ type = 7 , value = 1659 },--战士魔法值 
			},
-- 15 级
			{
				{ type = 13 , value = 1122 },--魔法攻击小 
				{ type = 15 , value = 2357 },--魔法攻击大 
				{ type = 21 , value = 729 },--物理防御小 
				{ type = 23 , value = 1215 },--物理防御大 
				{ type = 25 , value = 282 },--魔法防御小 
				{ type = 27 , value = 470 },--魔法防御大 
				{ type = 5 , value = 18222 },--战士生命值 
				{ type = 7 , value = 1822 },--战士魔法值 
			},
-- 16 级
			{
				{ type = 13 , value = 1215 },--魔法攻击小 
				{ type = 15 , value = 2552 },--魔法攻击大 
				{ type = 21 , value = 797 },--物理防御小 
				{ type = 23 , value = 1328 },--物理防御大 
				{ type = 25 , value = 305 },--魔法防御小 
				{ type = 27 , value = 509 },--魔法防御大 
				{ type = 5 , value = 19926 },--战士生命值 
				{ type = 7 , value = 1993 },--战士魔法值 
			},
-- 17 级
			{
				{ type = 13 , value = 1314 },--魔法攻击小 
				{ type = 15 , value = 2760 },--魔法攻击大 
				{ type = 21 , value = 868 },--物理防御小 
				{ type = 23 , value = 1446 },--物理防御大 
				{ type = 25 , value = 331 },--魔法防御小 
				{ type = 27 , value = 551 },--魔法防御大 
				{ type = 5 , value = 21696 },--战士生命值 
				{ type = 7 , value = 2170 },--战士魔法值 
			},
-- 18 级
			{
				{ type = 13 , value = 1419 },--魔法攻击小 
				{ type = 15 , value = 2979 },--魔法攻击大 
				{ type = 21 , value = 941 },--物理防御小 
				{ type = 23 , value = 1568 },--物理防御大 
				{ type = 25 , value = 357 },--魔法防御小 
				{ type = 27 , value = 595 },--魔法防御大 
				{ type = 5 , value = 23526 },--战士生命值 
				{ type = 7 , value = 2353 },--战士魔法值 
			},
-- 19 级
			{
				{ type = 13 , value = 1527 },--魔法攻击小 
				{ type = 15 , value = 3206 },--魔法攻击大 
				{ type = 21 , value = 1018 },--物理防御小 
				{ type = 23 , value = 1696 },--物理防御大 
				{ type = 25 , value = 384 },--魔法防御小 
				{ type = 27 , value = 640 },--魔法防御大 
				{ type = 5 , value = 25434 },--战士生命值 
				{ type = 7 , value = 2543 },--战士魔法值 
			},
-- 20 级
			{
				{ type = 13 , value = 1639 },--魔法攻击小 
				{ type = 15 , value = 3441 },--魔法攻击大 
				{ type = 21 , value = 1097 },--物理防御小 
				{ type = 23 , value = 1828 },--物理防御大 
				{ type = 25 , value = 412 },--魔法防御小 
				{ type = 27 , value = 687 },--魔法防御大 
				{ type = 5 , value = 27414 },--战士生命值 
				{ type = 7 , value = 2741 },--战士魔法值 
			},
-- 21 级
			{
				{ type = 13 , value = 1754 },--魔法攻击小 
				{ type = 15 , value = 3683 },--魔法攻击大 
				{ type = 21 , value = 1178 },--物理防御小 
				{ type = 23 , value = 1964 },--物理防御大 
				{ type = 25 , value = 441 },--魔法防御小 
				{ type = 27 , value = 735 },--魔法防御大 
				{ type = 5 , value = 29466 },--战士生命值 
				{ type = 7 , value = 2947 },--战士魔法值 
			},
-- 22 级
			{
				{ type = 13 , value = 1872 },--魔法攻击小 
				{ type = 15 , value = 3931 },--魔法攻击大 
				{ type = 21 , value = 1263 },--物理防御小 
				{ type = 23 , value = 2105 },--物理防御大 
				{ type = 25 , value = 471 },--魔法防御小 
				{ type = 27 , value = 785 },--魔法防御大 
				{ type = 5 , value = 31578 },--战士生命值 
				{ type = 7 , value = 3158 },--战士魔法值 
			},
-- 23 级
			{
				{ type = 13 , value = 1993 },--魔法攻击小 
				{ type = 15 , value = 4185 },--魔法攻击大 
				{ type = 21 , value = 1350 },--物理防御小 
				{ type = 23 , value = 2250 },--物理防御大 
				{ type = 25 , value = 502 },--魔法防御小 
				{ type = 27 , value = 836 },--魔法防御大 
				{ type = 5 , value = 33750 },--战士生命值 
				{ type = 7 , value = 3375 },--战士魔法值 
			},
-- 24 级
			{
				{ type = 13 , value = 2116 },--魔法攻击小 
				{ type = 15 , value = 4444 },--魔法攻击大 
				{ type = 21 , value = 1439 },--物理防御小 
				{ type = 23 , value = 2398 },--物理防御大 
				{ type = 25 , value = 533 },--魔法防御小 
				{ type = 27 , value = 888 },--魔法防御大 
				{ type = 5 , value = 35970 },--战士生命值 
				{ type = 7 , value = 3597 },--战士魔法值 
			},
-- 25 级
			{
				{ type = 13 , value = 2242 },--魔法攻击小 
				{ type = 15 , value = 4708 },--魔法攻击大 
				{ type = 21 , value = 1531 },--物理防御小 
				{ type = 23 , value = 2551 },--物理防御大 
				{ type = 25 , value = 565 },--魔法防御小 
				{ type = 27 , value = 941 },--魔法防御大 
				{ type = 5 , value = 38262 },--战士生命值 
				{ type = 7 , value = 3826 },--战士魔法值 
			},
-- 26 级
			{
				{ type = 13 , value = 2370 },--魔法攻击小 
				{ type = 15 , value = 4977 },--魔法攻击大 
				{ type = 21 , value = 1625 },--物理防御小 
				{ type = 23 , value = 2708 },--物理防御大 
				{ type = 25 , value = 597 },--魔法防御小 
				{ type = 27 , value = 995 },--魔法防御大 
				{ type = 5 , value = 40620 },--战士生命值 
				{ type = 7 , value = 4062 },--战士魔法值 
			},
-- 27 级
			{
				{ type = 13 , value = 2500 },--魔法攻击小 
				{ type = 15 , value = 5250 },--魔法攻击大 
				{ type = 21 , value = 1721 },--物理防御小 
				{ type = 23 , value = 2869 },--物理防御大 
				{ type = 25 , value = 630 },--魔法防御小 
				{ type = 27 , value = 1050 },--魔法防御大 
				{ type = 5 , value = 43038 },--战士生命值 
				{ type = 7 , value = 4304 },--战士魔法值 
			},
-- 28 级
			{
				{ type = 13 , value = 2632 },--魔法攻击小 
				{ type = 15 , value = 5527 },--魔法攻击大 
				{ type = 21 , value = 1820 },--物理防御小 
				{ type = 23 , value = 3034 },--物理防御大 
				{ type = 25 , value = 663 },--魔法防御小 
				{ type = 27 , value = 1105 },--魔法防御大 
				{ type = 5 , value = 45516 },--战士生命值 
				{ type = 7 , value = 4552 },--战士魔法值 
			},
-- 29 级
			{
				{ type = 13 , value = 2766 },--魔法攻击小 
				{ type = 15 , value = 5808 },--魔法攻击大 
				{ type = 21 , value = 1922 },--物理防御小 
				{ type = 23 , value = 3203 },--物理防御大 
				{ type = 25 , value = 697 },--魔法防御小 
				{ type = 27 , value = 1161 },--魔法防御大 
				{ type = 5 , value = 48048 },--战士生命值 
				{ type = 7 , value = 4805 },--战士魔法值 
			},
-- 30 级
			{
				{ type = 13 , value = 2901 },--魔法攻击小 
				{ type = 15 , value = 6093 },--魔法攻击大 
				{ type = 21 , value = 2025 },--物理防御小 
				{ type = 23 , value = 3375 },--物理防御大 
				{ type = 25 , value = 731 },--魔法防御小 
				{ type = 27 , value = 1218 },--魔法防御大 
				{ type = 5 , value = 50628 },--战士生命值 
				{ type = 7 , value = 5063 },--战士魔法值 
			},
-- 31 级
			{
				{ type = 13 , value = 3040 },--魔法攻击小 
				{ type = 15 , value = 6383 },--魔法攻击大 
				{ type = 21 , value = 2132 },--物理防御小 
				{ type = 23 , value = 3553 },--物理防御大 
				{ type = 25 , value = 766 },--魔法防御小 
				{ type = 27 , value = 1276 },--魔法防御大 
				{ type = 5 , value = 53292 },--战士生命值 
				{ type = 7 , value = 5329 },--战士魔法值 
			},
-- 32 级
			{
				{ type = 13 , value = 3180 },--魔法攻击小 
				{ type = 15 , value = 6677 },--魔法攻击大 
				{ type = 21 , value = 2242 },--物理防御小 
				{ type = 23 , value = 3736 },--物理防御大 
				{ type = 25 , value = 801 },--魔法防御小 
				{ type = 27 , value = 1335 },--魔法防御大 
				{ type = 5 , value = 56034 },--战士生命值 
				{ type = 7 , value = 5603 },--战士魔法值 
			},
-- 33 级
			{
				{ type = 13 , value = 3322 },--魔法攻击小 
				{ type = 15 , value = 6976 },--魔法攻击大 
				{ type = 21 , value = 2354 },--物理防御小 
				{ type = 23 , value = 3923 },--物理防御大 
				{ type = 25 , value = 837 },--魔法防御小 
				{ type = 27 , value = 1395 },--魔法防御大 
				{ type = 5 , value = 58848 },--战士生命值 
				{ type = 7 , value = 5885 },--战士魔法值 
			},
-- 34 级
			{
				{ type = 13 , value = 3466 },--魔法攻击小 
				{ type = 15 , value = 7279 },--魔法攻击大 
				{ type = 21 , value = 2470 },--物理防御小 
				{ type = 23 , value = 4116 },--物理防御大 
				{ type = 25 , value = 874 },--魔法防御小 
				{ type = 27 , value = 1456 },--魔法防御大 
				{ type = 5 , value = 61734 },--战士生命值 
				{ type = 7 , value = 6173 },--战士魔法值 
			},
-- 35 级
			{
				{ type = 13 , value = 3612 },--魔法攻击小 
				{ type = 15 , value = 7586 },--魔法攻击大 
				{ type = 21 , value = 2587 },--物理防御小 
				{ type = 23 , value = 4312 },--物理防御大 
				{ type = 25 , value = 910 },--魔法防御小 
				{ type = 27 , value = 1517 },--魔法防御大 
				{ type = 5 , value = 64686 },--战士生命值 
				{ type = 7 , value = 6469 },--战士魔法值 
			},
-- 36 级
			{
				{ type = 13 , value = 3760 },--魔法攻击小 
				{ type = 15 , value = 7896 },--魔法攻击大 
				{ type = 21 , value = 2708 },--物理防御小 
				{ type = 23 , value = 4514 },--物理防御大 
				{ type = 25 , value = 947 },--魔法防御小 
				{ type = 27 , value = 1579 },--魔法防御大 
				{ type = 5 , value = 67704 },--战士生命值 
				{ type = 7 , value = 6770 },--战士魔法值 
			},
-- 37 级
			{
				{ type = 13 , value = 3910 },--魔法攻击小 
				{ type = 15 , value = 8210 },--魔法攻击大 
				{ type = 21 , value = 2832 },--物理防御小 
				{ type = 23 , value = 4720 },--物理防御大 
				{ type = 25 , value = 985 },--魔法防御小 
				{ type = 27 , value = 1642 },--魔法防御大 
				{ type = 5 , value = 70794 },--战士生命值 
				{ type = 7 , value = 7079 },--战士魔法值 
			},
-- 38 级
			{
				{ type = 13 , value = 4060 },--魔法攻击小 
				{ type = 15 , value = 8527 },--魔法攻击大 
				{ type = 21 , value = 2958 },--物理防御小 
				{ type = 23 , value = 4930 },--物理防御大 
				{ type = 25 , value = 1023 },--魔法防御小 
				{ type = 27 , value = 1705 },--魔法防御大 
				{ type = 5 , value = 73956 },--战士生命值 
				{ type = 7 , value = 7396 },--战士魔法值 
			},
-- 39 级
			{
				{ type = 13 , value = 4213 },--魔法攻击小 
				{ type = 15 , value = 8847 },--魔法攻击大 
				{ type = 21 , value = 3088 },--物理防御小 
				{ type = 23 , value = 5146 },--物理防御大 
				{ type = 25 , value = 1061 },--魔法防御小 
				{ type = 27 , value = 1769 },--魔法防御大 
				{ type = 5 , value = 77184 },--战士生命值 
				{ type = 7 , value = 7718 },--战士魔法值 
			},
-- 40 级
			{
				{ type = 13 , value = 4367 },--魔法攻击小 
				{ type = 15 , value = 9170 },--魔法攻击大 
				{ type = 21 , value = 3219 },--物理防御小 
				{ type = 23 , value = 5365 },--物理防御大 
				{ type = 25 , value = 1100 },--魔法防御小 
				{ type = 27 , value = 1834 },--魔法防御大 
				{ type = 5 , value = 80478 },--战士生命值 
				{ type = 7 , value = 8048 },--战士魔法值 
			},
-- 41 级
			{
				{ type = 13 , value = 4522 },--魔法攻击小 
				{ type = 15 , value = 9496 },--魔法攻击大 
				{ type = 21 , value = 3353 },--物理防御小 
				{ type = 23 , value = 5589 },--物理防御大 
				{ type = 25 , value = 1139 },--魔法防御小 
				{ type = 27 , value = 1899 },--魔法防御大 
				{ type = 5 , value = 83832 },--战士生命值 
				{ type = 7 , value = 8383 },--战士魔法值 
			},
-- 42 级
			{
				{ type = 13 , value = 4679 },--魔法攻击小 
				{ type = 15 , value = 9825 },--魔法攻击大 
				{ type = 21 , value = 3490 },--物理防御小 
				{ type = 23 , value = 5816 },--物理防御大 
				{ type = 25 , value = 1179 },--魔法防御小 
				{ type = 27 , value = 1965 },--魔法防御大 
				{ type = 5 , value = 87246 },--战士生命值 
				{ type = 7 , value = 8725 },--战士魔法值 
			},
-- 43 级
			{
				{ type = 13 , value = 4838 },--魔法攻击小 
				{ type = 15 , value = 10160 },--魔法攻击大 
				{ type = 21 , value = 3629 },--物理防御小 
				{ type = 23 , value = 6048 },--物理防御大 
				{ type = 25 , value = 1219 },--魔法防御小 
				{ type = 27 , value = 2032 },--魔法防御大 
				{ type = 5 , value = 90714 },--战士生命值 
				{ type = 7 , value = 9071 },--战士魔法值 
			},
-- 44 级
			{
				{ type = 13 , value = 5000 },--魔法攻击小 
				{ type = 15 , value = 10500 },--魔法攻击大 
				{ type = 21 , value = 3769 },--物理防御小 
				{ type = 23 , value = 6282 },--物理防御大 
				{ type = 25 , value = 1260 },--魔法防御小 
				{ type = 27 , value = 2100 },--魔法防御大 
				{ type = 5 , value = 94236 },--战士生命值 
				{ type = 7 , value = 9424 },--战士魔法值 
			},
-- 45 级
			{
				{ type = 13 , value = 5165 },--魔法攻击小 
				{ type = 15 , value = 10846 },--魔法攻击大 
				{ type = 21 , value = 3913 },--物理防御小 
				{ type = 23 , value = 6521 },--物理防御大 
				{ type = 25 , value = 1301 },--魔法防御小 
				{ type = 27 , value = 2169 },--魔法防御大 
				{ type = 5 , value = 97812 },--战士生命值 
				{ type = 7 , value = 9781 },--战士魔法值 
			},
-- 46 级
			{
				{ type = 13 , value = 5332 },--魔法攻击小 
				{ type = 15 , value = 11197 },--魔法攻击大 
				{ type = 21 , value = 4057 },--物理防御小 
				{ type = 23 , value = 6762 },--物理防御大 
				{ type = 25 , value = 1343 },--魔法防御小 
				{ type = 27 , value = 2239 },--魔法防御大 
				{ type = 5 , value = 101436 },--战士生命值 
				{ type = 7 , value = 10144 },--战士魔法值 
			},
-- 47 级
			{
				{ type = 13 , value = 5501 },--魔法攻击小 
				{ type = 15 , value = 11553 },--魔法攻击大 
				{ type = 21 , value = 4204 },--物理防御小 
				{ type = 23 , value = 7007 },--物理防御大 
				{ type = 25 , value = 1386 },--魔法防御小 
				{ type = 27 , value = 2310 },--魔法防御大 
				{ type = 5 , value = 105108 },--战士生命值 
				{ type = 7 , value = 10511 },--战士魔法值 
			},
-- 48 级
			{
				{ type = 13 , value = 5673 },--魔法攻击小 
				{ type = 15 , value = 11914 },--魔法攻击大 
				{ type = 21 , value = 4353 },--物理防御小 
				{ type = 23 , value = 7255 },--物理防御大 
				{ type = 25 , value = 1429 },--魔法防御小 
				{ type = 27 , value = 2382 },--魔法防御大 
				{ type = 5 , value = 108828 },--战士生命值 
				{ type = 7 , value = 10883 },--战士魔法值 
			},
-- 49 级
			{
				{ type = 13 , value = 5848 },--魔法攻击小 
				{ type = 15 , value = 12281 },--魔法攻击大 
				{ type = 21 , value = 4504 },--物理防御小 
				{ type = 23 , value = 7506 },--物理防御大 
				{ type = 25 , value = 1473 },--魔法防御小 
				{ type = 27 , value = 2455 },--魔法防御大 
				{ type = 5 , value = 112590 },--战士生命值 
				{ type = 7 , value = 11259 },--战士魔法值 
			},
-- 50 级
			{
				{ type = 13 , value = 6026 },--魔法攻击小 
				{ type = 15 , value = 12655 },--魔法攻击大 
				{ type = 21 , value = 4656 },--物理防御小 
				{ type = 23 , value = 7760 },--物理防御大 
				{ type = 25 , value = 1518 },--魔法防御小 
				{ type = 27 , value = 2530 },--魔法防御大 
				{ type = 5 , value = 116394 },--战士生命值 
				{ type = 7 , value = 11639 },--战士魔法值 
			},
-- 51 级
			{
				{ type = 13 , value = 6207 },--魔法攻击小 
				{ type = 15 , value = 13035 },--魔法攻击大 
				{ type = 21 , value = 4810 },--物理防御小 
				{ type = 23 , value = 8016 },--物理防御大 
				{ type = 25 , value = 1564 },--魔法防御小 
				{ type = 27 , value = 2606 },--魔法防御大 
				{ type = 5 , value = 120240 },--战士生命值 
				{ type = 7 , value = 12024 },--战士魔法值 
			},
-- 52 级
			{
				{ type = 13 , value = 6390 },--魔法攻击小 
				{ type = 15 , value = 13420 },--魔法攻击大 
				{ type = 21 , value = 4965 },--物理防御小 
				{ type = 23 , value = 8275 },--物理防御大 
				{ type = 25 , value = 1610 },--魔法防御小 
				{ type = 27 , value = 2683 },--魔法防御大 
				{ type = 5 , value = 124122 },--战士生命值 
				{ type = 7 , value = 12412 },--战士魔法值 
			},
-- 53 级
			{
				{ type = 13 , value = 6577 },--魔法攻击小 
				{ type = 15 , value = 13811 },--魔法攻击大 
				{ type = 21 , value = 5122 },--物理防御小 
				{ type = 23 , value = 8536 },--物理防御大 
				{ type = 25 , value = 1657 },--魔法防御小 
				{ type = 27 , value = 2761 },--魔法防御大 
				{ type = 5 , value = 128046 },--战士生命值 
				{ type = 7 , value = 12805 },--战士魔法值 
			},
-- 54 级
			{
				{ type = 13 , value = 6765 },--魔法攻击小 
				{ type = 15 , value = 14207 },--魔法攻击大 
				{ type = 21 , value = 5280 },--物理防御小 
				{ type = 23 , value = 8800 },--物理防御大 
				{ type = 25 , value = 1704 },--魔法防御小 
				{ type = 27 , value = 2840 },--魔法防御大 
				{ type = 5 , value = 132006 },--战士生命值 
				{ type = 7 , value = 13201 },--战士魔法值 
			},
-- 55 级
			{
				{ type = 13 , value = 6957 },--魔法攻击小 
				{ type = 15 , value = 14610 },--魔法攻击大 
				{ type = 21 , value = 5440 },--物理防御小 
				{ type = 23 , value = 9067 },--物理防御大 
				{ type = 25 , value = 1753 },--魔法防御小 
				{ type = 27 , value = 2921 },--魔法防御大 
				{ type = 5 , value = 136002 },--战士生命值 
				{ type = 7 , value = 13600 },--战士魔法值 
			},
-- 56 级
			{
				{ type = 13 , value = 7152 },--魔法攻击小 
				{ type = 15 , value = 15020 },--魔法攻击大 
				{ type = 21 , value = 5601 },--物理防御小 
				{ type = 23 , value = 9335 },--物理防御大 
				{ type = 25 , value = 1802 },--魔法防御小 
				{ type = 27 , value = 3003 },--魔法防御大 
				{ type = 5 , value = 140028 },--战士生命值 
				{ type = 7 , value = 14003 },--战士魔法值 
			},
-- 57 级
			{
				{ type = 13 , value = 7351 },--魔法攻击小 
				{ type = 15 , value = 15437 },--魔法攻击大 
				{ type = 21 , value = 5764 },--物理防御小 
				{ type = 23 , value = 9606 },--物理防御大 
				{ type = 25 , value = 1852 },--魔法防御小 
				{ type = 27 , value = 3086 },--魔法防御大 
				{ type = 5 , value = 144090 },--战士生命值 
				{ type = 7 , value = 14409 },--战士魔法值 
			},
-- 58 级
			{
				{ type = 13 , value = 7552 },--魔法攻击小 
				{ type = 15 , value = 15860 },--魔法攻击大 
				{ type = 21 , value = 5927 },--物理防御小 
				{ type = 23 , value = 9879 },--物理防御大 
				{ type = 25 , value = 1903 },--魔法防御小 
				{ type = 27 , value = 3171 },--魔法防御大 
				{ type = 5 , value = 148182 },--战士生命值 
				{ type = 7 , value = 14818 },--战士魔法值 
			},
-- 59 级
			{
				{ type = 13 , value = 7757 },--魔法攻击小 
				{ type = 15 , value = 16289 },--魔法攻击大 
				{ type = 21 , value = 6092 },--物理防御小 
				{ type = 23 , value = 10154 },--物理防御大 
				{ type = 25 , value = 1954 },--魔法防御小 
				{ type = 27 , value = 3257 },--魔法防御大 
				{ type = 5 , value = 152304 },--战士生命值 
				{ type = 7 , value = 15230 },--战士魔法值 
			},
-- 60 级
			{
				{ type = 13 , value = 7964 },--魔法攻击小 
				{ type = 15 , value = 16724 },--魔法攻击大 
				{ type = 21 , value = 6258 },--物理防御小 
				{ type = 23 , value = 10430 },--物理防御大 
				{ type = 25 , value = 2006 },--魔法防御小 
				{ type = 27 , value = 3344 },--魔法防御大 
				{ type = 5 , value = 156456 },--战士生命值 
				{ type = 7 , value = 15646 },--战士魔法值 
			},

		},
		
		-------------------------- 道
		{
			-- 1 级
			{
				{ type = 17 , value = 71 },--道术攻击小 
				{ type = 19 , value = 150 },--道术攻击大 
				{ type = 21 , value = 36 },--物理防御小 
				{ type = 23 , value = 60 },--物理防御大 
				{ type = 25 , value = 18 },--魔法防御小 
				{ type = 27 , value = 30 },--魔法防御大 
				{ type = 5 , value = 900 },--战士生命值 
				{ type = 7 , value = 90 },--战士魔法值 
			},
-- 2 级
			{
				{ type = 17 , value = 148 },--道术攻击小 
				{ type = 19 , value = 310 },--道术攻击大 
				{ type = 21 , value = 74 },--物理防御小 
				{ type = 23 , value = 124 },--物理防御大 
				{ type = 25 , value = 37 },--魔法防御小 
				{ type = 27 , value = 62 },--魔法防御大 
				{ type = 5 , value = 1860 },--战士生命值 
				{ type = 7 , value = 186 },--战士魔法值 
			},
-- 3 级
			{
				{ type = 17 , value = 227 },--道术攻击小 
				{ type = 19 , value = 477 },--道术攻击大 
				{ type = 21 , value = 115 },--物理防御小 
				{ type = 23 , value = 191 },--物理防御大 
				{ type = 25 , value = 57 },--魔法防御小 
				{ type = 27 , value = 95 },--魔法防御大 
				{ type = 5 , value = 2862 },--战士生命值 
				{ type = 7 , value = 286 },--战士魔法值 
			},
-- 4 级
			{
				{ type = 17 , value = 309 },--道术攻击小 
				{ type = 19 , value = 648 },--道术攻击大 
				{ type = 21 , value = 155 },--物理防御小 
				{ type = 23 , value = 259 },--物理防御大 
				{ type = 25 , value = 77 },--魔法防御小 
				{ type = 27 , value = 129 },--魔法防御大 
				{ type = 5 , value = 3888 },--战士生命值 
				{ type = 7 , value = 389 },--战士魔法值 
			},
-- 5 级
			{
				{ type = 17 , value = 392 },--道术攻击小 
				{ type = 19 , value = 823 },--道术攻击大 
				{ type = 21 , value = 197 },--物理防御小 
				{ type = 23 , value = 329 },--物理防御大 
				{ type = 25 , value = 98 },--魔法防御小 
				{ type = 27 , value = 164 },--魔法防御大 
				{ type = 5 , value = 4938 },--战士生命值 
				{ type = 7 , value = 494 },--战士魔法值 
			},
-- 6 级
			{
				{ type = 17 , value = 477 },--道术攻击小 
				{ type = 19 , value = 1001 },--道术攻击大 
				{ type = 21 , value = 240 },--物理防御小 
				{ type = 23 , value = 400 },--物理防御大 
				{ type = 25 , value = 120 },--魔法防御小 
				{ type = 27 , value = 200 },--魔法防御大 
				{ type = 5 , value = 6006 },--战士生命值 
				{ type = 7 , value = 601 },--战士魔法值 
			},
-- 7 级
			{
				{ type = 17 , value = 555 },--道术攻击小 
				{ type = 19 , value = 1166 },--道术攻击大 
				{ type = 21 , value = 286 },--物理防御小 
				{ type = 23 , value = 476 },--物理防御大 
				{ type = 25 , value = 140 },--魔法防御小 
				{ type = 27 , value = 233 },--魔法防御大 
				{ type = 5 , value = 7146 },--战士生命值 
				{ type = 7 , value = 715 },--战士魔法值 
			},
-- 8 级
			{
				{ type = 17 , value = 629 },--道术攻击小 
				{ type = 19 , value = 1321 },--道术攻击大 
				{ type = 21 , value = 334 },--物理防御小 
				{ type = 23 , value = 556 },--物理防御大 
				{ type = 25 , value = 158 },--魔法防御小 
				{ type = 27 , value = 264 },--魔法防御大 
				{ type = 5 , value = 8346 },--战士生命值 
				{ type = 7 , value = 835 },--战士魔法值 
			},
-- 9 级
			{
				{ type = 17 , value = 699 },--道术攻击小 
				{ type = 19 , value = 1467 },--道术攻击大 
				{ type = 21 , value = 384 },--物理防御小 
				{ type = 23 , value = 640 },--物理防御大 
				{ type = 25 , value = 176 },--魔法防御小 
				{ type = 27 , value = 293 },--魔法防御大 
				{ type = 5 , value = 9594 },--战士生命值 
				{ type = 7 , value = 959 },--战士魔法值 
			},
-- 10 级
			{
				{ type = 17 , value = 764 },--道术攻击小 
				{ type = 19 , value = 1605 },--道术攻击大 
				{ type = 21 , value = 436 },--物理防御小 
				{ type = 23 , value = 726 },--物理防御大 
				{ type = 25 , value = 193 },--魔法防御小 
				{ type = 27 , value = 321 },--魔法防御大 
				{ type = 5 , value = 10884 },--战士生命值 
				{ type = 7 , value = 1088 },--战士魔法值 
			},
-- 11 级
			{
				{ type = 17 , value = 827 },--道术攻击小 
				{ type = 19 , value = 1737 },--道术攻击大 
				{ type = 21 , value = 488 },--物理防御小 
				{ type = 23 , value = 814 },--物理防御大 
				{ type = 25 , value = 208 },--魔法防御小 
				{ type = 27 , value = 347 },--魔法防御大 
				{ type = 5 , value = 12210 },--战士生命值 
				{ type = 7 , value = 1221 },--战士魔法值 
			},
-- 12 级
			{
				{ type = 17 , value = 888 },--道术攻击小 
				{ type = 19 , value = 1864 },--道术攻击大 
				{ type = 21 , value = 543 },--物理防御小 
				{ type = 23 , value = 905 },--物理防御大 
				{ type = 25 , value = 223 },--魔法防御小 
				{ type = 27 , value = 372 },--魔法防御大 
				{ type = 5 , value = 13572 },--战士生命值 
				{ type = 7 , value = 1357 },--战士魔法值 
			},
-- 13 级
			{
				{ type = 17 , value = 958 },--道术攻击小 
				{ type = 19 , value = 2011 },--道术攻击大 
				{ type = 21 , value = 601 },--物理防御小 
				{ type = 23 , value = 1002 },--物理防御大 
				{ type = 25 , value = 241 },--魔法防御小 
				{ type = 27 , value = 401 },--魔法防御大 
				{ type = 5 , value = 15036 },--战士生命值 
				{ type = 7 , value = 1504 },--战士魔法值 
			},
-- 14 级
			{
				{ type = 17 , value = 1036 },--道术攻击小 
				{ type = 19 , value = 2176 },--道术攻击大 
				{ type = 21 , value = 664 },--物理防御小 
				{ type = 23 , value = 1106 },--物理防御大 
				{ type = 25 , value = 260 },--魔法防御小 
				{ type = 27 , value = 434 },--魔法防御大 
				{ type = 5 , value = 16590 },--战士生命值 
				{ type = 7 , value = 1659 },--战士魔法值 
			},
-- 15 级
			{
				{ type = 17 , value = 1122 },--道术攻击小 
				{ type = 19 , value = 2357 },--道术攻击大 
				{ type = 21 , value = 729 },--物理防御小 
				{ type = 23 , value = 1215 },--物理防御大 
				{ type = 25 , value = 282 },--魔法防御小 
				{ type = 27 , value = 470 },--魔法防御大 
				{ type = 5 , value = 18222 },--战士生命值 
				{ type = 7 , value = 1822 },--战士魔法值 
			},
-- 16 级
			{
				{ type = 17 , value = 1215 },--道术攻击小 
				{ type = 19 , value = 2552 },--道术攻击大 
				{ type = 21 , value = 797 },--物理防御小 
				{ type = 23 , value = 1328 },--物理防御大 
				{ type = 25 , value = 305 },--魔法防御小 
				{ type = 27 , value = 509 },--魔法防御大 
				{ type = 5 , value = 19926 },--战士生命值 
				{ type = 7 , value = 1993 },--战士魔法值 
			},
-- 17 级
			{
				{ type = 17 , value = 1314 },--道术攻击小 
				{ type = 19 , value = 2760 },--道术攻击大 
				{ type = 21 , value = 868 },--物理防御小 
				{ type = 23 , value = 1446 },--物理防御大 
				{ type = 25 , value = 331 },--魔法防御小 
				{ type = 27 , value = 551 },--魔法防御大 
				{ type = 5 , value = 21696 },--战士生命值 
				{ type = 7 , value = 2170 },--战士魔法值 
			},
-- 18 级
			{
				{ type = 17 , value = 1419 },--道术攻击小 
				{ type = 19 , value = 2979 },--道术攻击大 
				{ type = 21 , value = 941 },--物理防御小 
				{ type = 23 , value = 1568 },--物理防御大 
				{ type = 25 , value = 357 },--魔法防御小 
				{ type = 27 , value = 595 },--魔法防御大 
				{ type = 5 , value = 23526 },--战士生命值 
				{ type = 7 , value = 2353 },--战士魔法值 
			},
-- 19 级
			{
				{ type = 17 , value = 1527 },--道术攻击小 
				{ type = 19 , value = 3206 },--道术攻击大 
				{ type = 21 , value = 1018 },--物理防御小 
				{ type = 23 , value = 1696 },--物理防御大 
				{ type = 25 , value = 384 },--魔法防御小 
				{ type = 27 , value = 640 },--魔法防御大 
				{ type = 5 , value = 25434 },--战士生命值 
				{ type = 7 , value = 2543 },--战士魔法值 
			},
-- 20 级
			{
				{ type = 17 , value = 1639 },--道术攻击小 
				{ type = 19 , value = 3441 },--道术攻击大 
				{ type = 21 , value = 1097 },--物理防御小 
				{ type = 23 , value = 1828 },--物理防御大 
				{ type = 25 , value = 412 },--魔法防御小 
				{ type = 27 , value = 687 },--魔法防御大 
				{ type = 5 , value = 27414 },--战士生命值 
				{ type = 7 , value = 2741 },--战士魔法值 
			},
-- 21 级
			{
				{ type = 17 , value = 1754 },--道术攻击小 
				{ type = 19 , value = 3683 },--道术攻击大 
				{ type = 21 , value = 1178 },--物理防御小 
				{ type = 23 , value = 1964 },--物理防御大 
				{ type = 25 , value = 441 },--魔法防御小 
				{ type = 27 , value = 735 },--魔法防御大 
				{ type = 5 , value = 29466 },--战士生命值 
				{ type = 7 , value = 2947 },--战士魔法值 
			},
-- 22 级
			{
				{ type = 17 , value = 1872 },--道术攻击小 
				{ type = 19 , value = 3931 },--道术攻击大 
				{ type = 21 , value = 1263 },--物理防御小 
				{ type = 23 , value = 2105 },--物理防御大 
				{ type = 25 , value = 471 },--魔法防御小 
				{ type = 27 , value = 785 },--魔法防御大 
				{ type = 5 , value = 31578 },--战士生命值 
				{ type = 7 , value = 3158 },--战士魔法值 
			},
-- 23 级
			{
				{ type = 17 , value = 1993 },--道术攻击小 
				{ type = 19 , value = 4185 },--道术攻击大 
				{ type = 21 , value = 1350 },--物理防御小 
				{ type = 23 , value = 2250 },--物理防御大 
				{ type = 25 , value = 502 },--魔法防御小 
				{ type = 27 , value = 836 },--魔法防御大 
				{ type = 5 , value = 33750 },--战士生命值 
				{ type = 7 , value = 3375 },--战士魔法值 
			},
-- 24 级
			{
				{ type = 17 , value = 2116 },--道术攻击小 
				{ type = 19 , value = 4444 },--道术攻击大 
				{ type = 21 , value = 1439 },--物理防御小 
				{ type = 23 , value = 2398 },--物理防御大 
				{ type = 25 , value = 533 },--魔法防御小 
				{ type = 27 , value = 888 },--魔法防御大 
				{ type = 5 , value = 35970 },--战士生命值 
				{ type = 7 , value = 3597 },--战士魔法值 
			},
-- 25 级
			{
				{ type = 17 , value = 2242 },--道术攻击小 
				{ type = 19 , value = 4708 },--道术攻击大 
				{ type = 21 , value = 1531 },--物理防御小 
				{ type = 23 , value = 2551 },--物理防御大 
				{ type = 25 , value = 565 },--魔法防御小 
				{ type = 27 , value = 941 },--魔法防御大 
				{ type = 5 , value = 38262 },--战士生命值 
				{ type = 7 , value = 3826 },--战士魔法值 
			},
-- 26 级
			{
				{ type = 17 , value = 2370 },--道术攻击小 
				{ type = 19 , value = 4977 },--道术攻击大 
				{ type = 21 , value = 1625 },--物理防御小 
				{ type = 23 , value = 2708 },--物理防御大 
				{ type = 25 , value = 597 },--魔法防御小 
				{ type = 27 , value = 995 },--魔法防御大 
				{ type = 5 , value = 40620 },--战士生命值 
				{ type = 7 , value = 4062 },--战士魔法值 
			},
-- 27 级
			{
				{ type = 17 , value = 2500 },--道术攻击小 
				{ type = 19 , value = 5250 },--道术攻击大 
				{ type = 21 , value = 1721 },--物理防御小 
				{ type = 23 , value = 2869 },--物理防御大 
				{ type = 25 , value = 630 },--魔法防御小 
				{ type = 27 , value = 1050 },--魔法防御大 
				{ type = 5 , value = 43038 },--战士生命值 
				{ type = 7 , value = 4304 },--战士魔法值 
			},
-- 28 级
			{
				{ type = 17 , value = 2632 },--道术攻击小 
				{ type = 19 , value = 5527 },--道术攻击大 
				{ type = 21 , value = 1820 },--物理防御小 
				{ type = 23 , value = 3034 },--物理防御大 
				{ type = 25 , value = 663 },--魔法防御小 
				{ type = 27 , value = 1105 },--魔法防御大 
				{ type = 5 , value = 45516 },--战士生命值 
				{ type = 7 , value = 4552 },--战士魔法值 
			},
-- 29 级
			{
				{ type = 17 , value = 2766 },--道术攻击小 
				{ type = 19 , value = 5808 },--道术攻击大 
				{ type = 21 , value = 1922 },--物理防御小 
				{ type = 23 , value = 3203 },--物理防御大 
				{ type = 25 , value = 697 },--魔法防御小 
				{ type = 27 , value = 1161 },--魔法防御大 
				{ type = 5 , value = 48048 },--战士生命值 
				{ type = 7 , value = 4805 },--战士魔法值 
			},
-- 30 级
			{
				{ type = 17 , value = 2901 },--道术攻击小 
				{ type = 19 , value = 6093 },--道术攻击大 
				{ type = 21 , value = 2025 },--物理防御小 
				{ type = 23 , value = 3375 },--物理防御大 
				{ type = 25 , value = 731 },--魔法防御小 
				{ type = 27 , value = 1218 },--魔法防御大 
				{ type = 5 , value = 50628 },--战士生命值 
				{ type = 7 , value = 5063 },--战士魔法值 
			},
-- 31 级
			{
				{ type = 17 , value = 3040 },--道术攻击小 
				{ type = 19 , value = 6383 },--道术攻击大 
				{ type = 21 , value = 2132 },--物理防御小 
				{ type = 23 , value = 3553 },--物理防御大 
				{ type = 25 , value = 766 },--魔法防御小 
				{ type = 27 , value = 1276 },--魔法防御大 
				{ type = 5 , value = 53292 },--战士生命值 
				{ type = 7 , value = 5329 },--战士魔法值 
			},
-- 32 级
			{
				{ type = 17 , value = 3180 },--道术攻击小 
				{ type = 19 , value = 6677 },--道术攻击大 
				{ type = 21 , value = 2242 },--物理防御小 
				{ type = 23 , value = 3736 },--物理防御大 
				{ type = 25 , value = 801 },--魔法防御小 
				{ type = 27 , value = 1335 },--魔法防御大 
				{ type = 5 , value = 56034 },--战士生命值 
				{ type = 7 , value = 5603 },--战士魔法值 
			},
-- 33 级
			{
				{ type = 17 , value = 3322 },--道术攻击小 
				{ type = 19 , value = 6976 },--道术攻击大 
				{ type = 21 , value = 2354 },--物理防御小 
				{ type = 23 , value = 3923 },--物理防御大 
				{ type = 25 , value = 837 },--魔法防御小 
				{ type = 27 , value = 1395 },--魔法防御大 
				{ type = 5 , value = 58848 },--战士生命值 
				{ type = 7 , value = 5885 },--战士魔法值 
			},
-- 34 级
			{
				{ type = 17 , value = 3466 },--道术攻击小 
				{ type = 19 , value = 7279 },--道术攻击大 
				{ type = 21 , value = 2470 },--物理防御小 
				{ type = 23 , value = 4116 },--物理防御大 
				{ type = 25 , value = 874 },--魔法防御小 
				{ type = 27 , value = 1456 },--魔法防御大 
				{ type = 5 , value = 61734 },--战士生命值 
				{ type = 7 , value = 6173 },--战士魔法值 
			},
-- 35 级
			{
				{ type = 17 , value = 3612 },--道术攻击小 
				{ type = 19 , value = 7586 },--道术攻击大 
				{ type = 21 , value = 2587 },--物理防御小 
				{ type = 23 , value = 4312 },--物理防御大 
				{ type = 25 , value = 910 },--魔法防御小 
				{ type = 27 , value = 1517 },--魔法防御大 
				{ type = 5 , value = 64686 },--战士生命值 
				{ type = 7 , value = 6469 },--战士魔法值 
			},
-- 36 级
			{
				{ type = 17 , value = 3760 },--道术攻击小 
				{ type = 19 , value = 7896 },--道术攻击大 
				{ type = 21 , value = 2708 },--物理防御小 
				{ type = 23 , value = 4514 },--物理防御大 
				{ type = 25 , value = 947 },--魔法防御小 
				{ type = 27 , value = 1579 },--魔法防御大 
				{ type = 5 , value = 67704 },--战士生命值 
				{ type = 7 , value = 6770 },--战士魔法值 
			},
-- 37 级
			{
				{ type = 17 , value = 3910 },--道术攻击小 
				{ type = 19 , value = 8210 },--道术攻击大 
				{ type = 21 , value = 2832 },--物理防御小 
				{ type = 23 , value = 4720 },--物理防御大 
				{ type = 25 , value = 985 },--魔法防御小 
				{ type = 27 , value = 1642 },--魔法防御大 
				{ type = 5 , value = 70794 },--战士生命值 
				{ type = 7 , value = 7079 },--战士魔法值 
			},
-- 38 级
			{
				{ type = 17 , value = 4060 },--道术攻击小 
				{ type = 19 , value = 8527 },--道术攻击大 
				{ type = 21 , value = 2958 },--物理防御小 
				{ type = 23 , value = 4930 },--物理防御大 
				{ type = 25 , value = 1023 },--魔法防御小 
				{ type = 27 , value = 1705 },--魔法防御大 
				{ type = 5 , value = 73956 },--战士生命值 
				{ type = 7 , value = 7396 },--战士魔法值 
			},
-- 39 级
			{
				{ type = 17 , value = 4213 },--道术攻击小 
				{ type = 19 , value = 8847 },--道术攻击大 
				{ type = 21 , value = 3088 },--物理防御小 
				{ type = 23 , value = 5146 },--物理防御大 
				{ type = 25 , value = 1061 },--魔法防御小 
				{ type = 27 , value = 1769 },--魔法防御大 
				{ type = 5 , value = 77184 },--战士生命值 
				{ type = 7 , value = 7718 },--战士魔法值 
			},
-- 40 级
			{
				{ type = 17 , value = 4367 },--道术攻击小 
				{ type = 19 , value = 9170 },--道术攻击大 
				{ type = 21 , value = 3219 },--物理防御小 
				{ type = 23 , value = 5365 },--物理防御大 
				{ type = 25 , value = 1100 },--魔法防御小 
				{ type = 27 , value = 1834 },--魔法防御大 
				{ type = 5 , value = 80478 },--战士生命值 
				{ type = 7 , value = 8048 },--战士魔法值 
			},
-- 41 级
			{
				{ type = 17 , value = 4522 },--道术攻击小 
				{ type = 19 , value = 9496 },--道术攻击大 
				{ type = 21 , value = 3353 },--物理防御小 
				{ type = 23 , value = 5589 },--物理防御大 
				{ type = 25 , value = 1139 },--魔法防御小 
				{ type = 27 , value = 1899 },--魔法防御大 
				{ type = 5 , value = 83832 },--战士生命值 
				{ type = 7 , value = 8383 },--战士魔法值 
			},
-- 42 级
			{
				{ type = 17 , value = 4679 },--道术攻击小 
				{ type = 19 , value = 9825 },--道术攻击大 
				{ type = 21 , value = 3490 },--物理防御小 
				{ type = 23 , value = 5816 },--物理防御大 
				{ type = 25 , value = 1179 },--魔法防御小 
				{ type = 27 , value = 1965 },--魔法防御大 
				{ type = 5 , value = 87246 },--战士生命值 
				{ type = 7 , value = 8725 },--战士魔法值 
			},
-- 43 级
			{
				{ type = 17 , value = 4838 },--道术攻击小 
				{ type = 19 , value = 10160 },--道术攻击大 
				{ type = 21 , value = 3629 },--物理防御小 
				{ type = 23 , value = 6048 },--物理防御大 
				{ type = 25 , value = 1219 },--魔法防御小 
				{ type = 27 , value = 2032 },--魔法防御大 
				{ type = 5 , value = 90714 },--战士生命值 
				{ type = 7 , value = 9071 },--战士魔法值 
			},
-- 44 级
			{
				{ type = 17 , value = 5000 },--道术攻击小 
				{ type = 19 , value = 10500 },--道术攻击大 
				{ type = 21 , value = 3769 },--物理防御小 
				{ type = 23 , value = 6282 },--物理防御大 
				{ type = 25 , value = 1260 },--魔法防御小 
				{ type = 27 , value = 2100 },--魔法防御大 
				{ type = 5 , value = 94236 },--战士生命值 
				{ type = 7 , value = 9424 },--战士魔法值 
			},
-- 45 级
			{
				{ type = 17 , value = 5165 },--道术攻击小 
				{ type = 19 , value = 10846 },--道术攻击大 
				{ type = 21 , value = 3913 },--物理防御小 
				{ type = 23 , value = 6521 },--物理防御大 
				{ type = 25 , value = 1301 },--魔法防御小 
				{ type = 27 , value = 2169 },--魔法防御大 
				{ type = 5 , value = 97812 },--战士生命值 
				{ type = 7 , value = 9781 },--战士魔法值 
			},
-- 46 级
			{
				{ type = 17 , value = 5332 },--道术攻击小 
				{ type = 19 , value = 11197 },--道术攻击大 
				{ type = 21 , value = 4057 },--物理防御小 
				{ type = 23 , value = 6762 },--物理防御大 
				{ type = 25 , value = 1343 },--魔法防御小 
				{ type = 27 , value = 2239 },--魔法防御大 
				{ type = 5 , value = 101436 },--战士生命值 
				{ type = 7 , value = 10144 },--战士魔法值 
			},
-- 47 级
			{
				{ type = 17 , value = 5501 },--道术攻击小 
				{ type = 19 , value = 11553 },--道术攻击大 
				{ type = 21 , value = 4204 },--物理防御小 
				{ type = 23 , value = 7007 },--物理防御大 
				{ type = 25 , value = 1386 },--魔法防御小 
				{ type = 27 , value = 2310 },--魔法防御大 
				{ type = 5 , value = 105108 },--战士生命值 
				{ type = 7 , value = 10511 },--战士魔法值 
			},
-- 48 级
			{
				{ type = 17 , value = 5673 },--道术攻击小 
				{ type = 19 , value = 11914 },--道术攻击大 
				{ type = 21 , value = 4353 },--物理防御小 
				{ type = 23 , value = 7255 },--物理防御大 
				{ type = 25 , value = 1429 },--魔法防御小 
				{ type = 27 , value = 2382 },--魔法防御大 
				{ type = 5 , value = 108828 },--战士生命值 
				{ type = 7 , value = 10883 },--战士魔法值 
			},
-- 49 级
			{
				{ type = 17 , value = 5848 },--道术攻击小 
				{ type = 19 , value = 12281 },--道术攻击大 
				{ type = 21 , value = 4504 },--物理防御小 
				{ type = 23 , value = 7506 },--物理防御大 
				{ type = 25 , value = 1473 },--魔法防御小 
				{ type = 27 , value = 2455 },--魔法防御大 
				{ type = 5 , value = 112590 },--战士生命值 
				{ type = 7 , value = 11259 },--战士魔法值 
			},
-- 50 级
			{
				{ type = 17 , value = 6026 },--道术攻击小 
				{ type = 19 , value = 12655 },--道术攻击大 
				{ type = 21 , value = 4656 },--物理防御小 
				{ type = 23 , value = 7760 },--物理防御大 
				{ type = 25 , value = 1518 },--魔法防御小 
				{ type = 27 , value = 2530 },--魔法防御大 
				{ type = 5 , value = 116394 },--战士生命值 
				{ type = 7 , value = 11639 },--战士魔法值 
			},
-- 51 级
			{
				{ type = 17 , value = 6207 },--道术攻击小 
				{ type = 19 , value = 13035 },--道术攻击大 
				{ type = 21 , value = 4810 },--物理防御小 
				{ type = 23 , value = 8016 },--物理防御大 
				{ type = 25 , value = 1564 },--魔法防御小 
				{ type = 27 , value = 2606 },--魔法防御大 
				{ type = 5 , value = 120240 },--战士生命值 
				{ type = 7 , value = 12024 },--战士魔法值 
			},
-- 52 级
			{
				{ type = 17 , value = 6390 },--道术攻击小 
				{ type = 19 , value = 13420 },--道术攻击大 
				{ type = 21 , value = 4965 },--物理防御小 
				{ type = 23 , value = 8275 },--物理防御大 
				{ type = 25 , value = 1610 },--魔法防御小 
				{ type = 27 , value = 2683 },--魔法防御大 
				{ type = 5 , value = 124122 },--战士生命值 
				{ type = 7 , value = 12412 },--战士魔法值 
			},
-- 53 级
			{
				{ type = 17 , value = 6577 },--道术攻击小 
				{ type = 19 , value = 13811 },--道术攻击大 
				{ type = 21 , value = 5122 },--物理防御小 
				{ type = 23 , value = 8536 },--物理防御大 
				{ type = 25 , value = 1657 },--魔法防御小 
				{ type = 27 , value = 2761 },--魔法防御大 
				{ type = 5 , value = 128046 },--战士生命值 
				{ type = 7 , value = 12805 },--战士魔法值 
			},
-- 54 级
			{
				{ type = 17 , value = 6765 },--道术攻击小 
				{ type = 19 , value = 14207 },--道术攻击大 
				{ type = 21 , value = 5280 },--物理防御小 
				{ type = 23 , value = 8800 },--物理防御大 
				{ type = 25 , value = 1704 },--魔法防御小 
				{ type = 27 , value = 2840 },--魔法防御大 
				{ type = 5 , value = 132006 },--战士生命值 
				{ type = 7 , value = 13201 },--战士魔法值 
			},
-- 55 级
			{
				{ type = 17 , value = 6957 },--道术攻击小 
				{ type = 19 , value = 14610 },--道术攻击大 
				{ type = 21 , value = 5440 },--物理防御小 
				{ type = 23 , value = 9067 },--物理防御大 
				{ type = 25 , value = 1753 },--魔法防御小 
				{ type = 27 , value = 2921 },--魔法防御大 
				{ type = 5 , value = 136002 },--战士生命值 
				{ type = 7 , value = 13600 },--战士魔法值 
			},
-- 56 级
			{
				{ type = 17 , value = 7152 },--道术攻击小 
				{ type = 19 , value = 15020 },--道术攻击大 
				{ type = 21 , value = 5601 },--物理防御小 
				{ type = 23 , value = 9335 },--物理防御大 
				{ type = 25 , value = 1802 },--魔法防御小 
				{ type = 27 , value = 3003 },--魔法防御大 
				{ type = 5 , value = 140028 },--战士生命值 
				{ type = 7 , value = 14003 },--战士魔法值 
			},
-- 57 级
			{
				{ type = 17 , value = 7351 },--道术攻击小 
				{ type = 19 , value = 15437 },--道术攻击大 
				{ type = 21 , value = 5764 },--物理防御小 
				{ type = 23 , value = 9606 },--物理防御大 
				{ type = 25 , value = 1852 },--魔法防御小 
				{ type = 27 , value = 3086 },--魔法防御大 
				{ type = 5 , value = 144090 },--战士生命值 
				{ type = 7 , value = 14409 },--战士魔法值 
			},
-- 58 级
			{
				{ type = 17 , value = 7552 },--道术攻击小 
				{ type = 19 , value = 15860 },--道术攻击大 
				{ type = 21 , value = 5927 },--物理防御小 
				{ type = 23 , value = 9879 },--物理防御大 
				{ type = 25 , value = 1903 },--魔法防御小 
				{ type = 27 , value = 3171 },--魔法防御大 
				{ type = 5 , value = 148182 },--战士生命值 
				{ type = 7 , value = 14818 },--战士魔法值 
			},
-- 59 级
			{
				{ type = 17 , value = 7757 },--道术攻击小 
				{ type = 19 , value = 16289 },--道术攻击大 
				{ type = 21 , value = 6092 },--物理防御小 
				{ type = 23 , value = 10154 },--物理防御大 
				{ type = 25 , value = 1954 },--魔法防御小 
				{ type = 27 , value = 3257 },--魔法防御大 
				{ type = 5 , value = 152304 },--战士生命值 
				{ type = 7 , value = 15230 },--战士魔法值 
			},
-- 60 级
			{
				{ type = 17 , value = 7964 },--道术攻击小 
				{ type = 19 , value = 16724 },--道术攻击大 
				{ type = 21 , value = 6258 },--物理防御小 
				{ type = 23 , value = 10430 },--物理防御大 
				{ type = 25 , value = 2006 },--魔法防御小 
				{ type = 27 , value = 3344 },--魔法防御大 
				{ type = 5 , value = 156456 },--战士生命值 
				{ type = 7 , value = 15646 },--战士魔法值 
			},

		},		
	},
	
}