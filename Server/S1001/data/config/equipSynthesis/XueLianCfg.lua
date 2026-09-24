--[[
	itWeaponPos = 0,				//武器位置0
	itDressPos,						//衣服 1 
	itHelmetPos,					//头盔 2

	itNecklacePos,					 //项链 3

	itLeftBraceletPos,				//左边的手镯 5
	itRightBraceletPos,				//右边的手镯 6

	itLeftRingPos,					//左边的戒指位置 7
	itRightRingPos,					//右边的戒指位置 8

	itGirdlePos,					//腰带 9
	itShoesPos,						//鞋子 10
	
	itEarringPos,					//吊坠 22
	itShoulderPadsPos,				//护肩 23
	itElbowPadsPos,					//面甲 24
	itKneecapPos,					//护膝 25
	
	
--]]

XueLianCfg=
{

	LevepUp =
	{
		{	
			position = 0,
			name = "武器",
			level=
			{
	
				-- --(a1)级 
				-- {
				-- 	needJingHua = (a2), 
				-- 	attr=
				-- 	{
				--         {type = (a3),value = (a4),job =1},
				--         {type = (a5),value = (a6),job =1},
				-- 		{type = (a7),value = (a8),job =1},

				--         {type = (a9),value = (a10),job =2},
				--         {type = (a11),value = (a12),job =2},
				-- 		{type = (a13),value = (a14),job =2},

				--         {type = (a15),value = (a16),job =3},
				--         {type = (a17),value = (a18),job =3},
				-- 		{type = (a19),value = (a20),job =3},

				--     },
				-- },


				-- --(a1)级 
				-- {
				-- 	needJingHua = (a2), 
				-- 	attr=
				-- 	{
				--         {type = (a3),value = (a4),job =1},
				--         {type = (a5),value = (a6),job =1},

				--         {type = (a7),value = (a8),job =2},
				--         {type = (a9),value = (a10),job =2},

				--         {type = (a11),value = (a12),job =3},
				--         {type = (a13),value = (a14),job =3},

				--     },
				-- },
	
				--1级 
				{
					needJingHua = 30, 
					attr=
					{
				        {type = 9,value = 5,job =1},
				        {type = 11,value = 18,job =1},
						{type = 5,value = 108,job =1},

				        {type = 13,value = 5,job =2},
				        {type = 15,value = 18,job =2},
						{type = 5,value = 108,job =2},

				        {type = 17,value = 5,job =3},
				        {type = 19,value = 18,job =3},
						{type = 5,value = 108,job =3},

				    },
				},
--2级 
				{
					needJingHua = 40, 
					attr=
					{
				        {type = 9,value = 12,job =1},
				        {type = 11,value = 41,job =1},
						{type = 5,value = 246,job =1},

				        {type = 13,value = 12,job =2},
				        {type = 15,value = 41,job =2},
						{type = 5,value = 246,job =2},

				        {type = 17,value = 12,job =3},
				        {type = 19,value = 41,job =3},
						{type = 5,value = 246,job =3},

				    },
				},
--3级 
				{
					needJingHua = 50, 
					attr=
					{
				        {type = 9,value = 21,job =1},
				        {type = 11,value = 69,job =1},
						{type = 5,value = 414,job =1},

				        {type = 13,value = 21,job =2},
				        {type = 15,value = 69,job =2},
						{type = 5,value = 414,job =2},

				        {type = 17,value = 21,job =3},
				        {type = 19,value = 69,job =3},
						{type = 5,value = 414,job =3},

				    },
				},
--4级 
				{
					needJingHua = 60, 
					attr=
					{
				        {type = 9,value = 30,job =1},
				        {type = 11,value = 101,job =1},
						{type = 5,value = 606,job =1},

				        {type = 13,value = 30,job =2},
				        {type = 15,value = 101,job =2},
						{type = 5,value = 606,job =2},

				        {type = 17,value = 30,job =3},
				        {type = 19,value = 101,job =3},
						{type = 5,value = 606,job =3},

				    },
				},
--5级 
				{
					needJingHua = 70, 
					attr=
					{
				        {type = 9,value = 41,job =1},
				        {type = 11,value = 137,job =1},
						{type = 5,value = 822,job =1},

				        {type = 13,value = 41,job =2},
				        {type = 15,value = 137,job =2},
						{type = 5,value = 822,job =2},

				        {type = 17,value = 41,job =3},
				        {type = 19,value = 137,job =3},
						{type = 5,value = 822,job =3},

				    },
				},
--6级 
				{
					needJingHua = 80, 
					attr=
					{
				        {type = 9,value = 53,job =1},
				        {type = 11,value = 177,job =1},
						{type = 5,value = 1062,job =1},

				        {type = 13,value = 53,job =2},
				        {type = 15,value = 177,job =2},
						{type = 5,value = 1062,job =2},

				        {type = 17,value = 53,job =3},
				        {type = 19,value = 177,job =3},
						{type = 5,value = 1062,job =3},

				    },
				},
--7级 
				{
					needJingHua = 100, 
					attr=
					{
				        {type = 9,value = 68,job =1},
				        {type = 11,value = 225,job =1},
						{type = 5,value = 1350,job =1},

				        {type = 13,value = 68,job =2},
				        {type = 15,value = 225,job =2},
						{type = 5,value = 1350,job =2},

				        {type = 17,value = 68,job =3},
				        {type = 19,value = 225,job =3},
						{type = 5,value = 1350,job =3},

				    },
				},
--8级 
				{
					needJingHua = 120, 
					attr=
					{
				        {type = 9,value = 84,job =1},
				        {type = 11,value = 280,job =1},
						{type = 5,value = 1680,job =1},

				        {type = 13,value = 84,job =2},
				        {type = 15,value = 280,job =2},
						{type = 5,value = 1680,job =2},

				        {type = 17,value = 84,job =3},
				        {type = 19,value = 280,job =3},
						{type = 5,value = 1680,job =3},

				    },
				},
--9级 
				{
					needJingHua = 150, 
					attr=
					{
				        {type = 9,value = 104,job =1},
				        {type = 11,value = 346,job =1},
						{type = 5,value = 2076,job =1},

				        {type = 13,value = 104,job =2},
				        {type = 15,value = 346,job =2},
						{type = 5,value = 2076,job =2},

				        {type = 17,value = 104,job =3},
				        {type = 19,value = 346,job =3},
						{type = 5,value = 2076,job =3},

				    },
				},
--10级 
				{
					needJingHua = 200, 
					attr=
					{
				        {type = 9,value = 129,job =1},
				        {type = 11,value = 430,job =1},
						{type = 5,value = 2580,job =1},

				        {type = 13,value = 129,job =2},
				        {type = 15,value = 430,job =2},
						{type = 5,value = 2580,job =2},

				        {type = 17,value = 129,job =3},
				        {type = 19,value = 430,job =3},
						{type = 5,value = 2580,job =3},

				    },
				},
--11级 
				{
					needJingHua = 300, 
					attr=
					{
				        {type = 9,value = 165,job =1},
				        {type = 11,value = 550,job =1},
						{type = 5,value = 3300,job =1},

				        {type = 13,value = 165,job =2},
				        {type = 15,value = 550,job =2},
						{type = 5,value = 3300,job =2},

				        {type = 17,value = 165,job =3},
				        {type = 19,value = 550,job =3},
						{type = 5,value = 3300,job =3},

				    },
				},
--12级 
				{
					needJingHua = 400, 
					attr=
					{
				        {type = 9,value = 211,job =1},
				        {type = 11,value = 702,job =1},
						{type = 5,value = 4212,job =1},

				        {type = 13,value = 211,job =2},
				        {type = 15,value = 702,job =2},
						{type = 5,value = 4212,job =2},

				        {type = 17,value = 211,job =3},
				        {type = 19,value = 702,job =3},
						{type = 5,value = 4212,job =3},

				    },
				},
--13级 
				{
					needJingHua = 500, 
					attr=
					{
				        {type = 9,value = 265,job =1},
				        {type = 11,value = 882,job =1},
						{type = 5,value = 5292,job =1},

				        {type = 13,value = 265,job =2},
				        {type = 15,value = 882,job =2},
						{type = 5,value = 5292,job =2},

				        {type = 17,value = 265,job =3},
				        {type = 19,value = 882,job =3},
						{type = 5,value = 5292,job =3},

				    },
				},
--14级 
				{
					needJingHua = 600, 
					attr=
					{
				        {type = 9,value = 326,job =1},
				        {type = 11,value = 1086,job =1},
						{type = 5,value = 6516,job =1},

				        {type = 13,value = 326,job =2},
				        {type = 15,value = 1086,job =2},
						{type = 5,value = 6516,job =2},

				        {type = 17,value = 326,job =3},
				        {type = 19,value = 1086,job =3},
						{type = 5,value = 6516,job =3},

				    },
				},
--15级 
				{
					needJingHua = 700, 
					attr=
					{
				        {type = 9,value = 393,job =1},
				        {type = 11,value = 1310,job =1},
						{type = 5,value = 7860,job =1},

				        {type = 13,value = 393,job =2},
				        {type = 15,value = 1310,job =2},
						{type = 5,value = 7860,job =2},

				        {type = 17,value = 393,job =3},
				        {type = 19,value = 1310,job =3},
						{type = 5,value = 7860,job =3},

				    },
				},
--16级 
				{
					needJingHua = 800, 
					attr=
					{
				        {type = 9,value = 465,job =1},
				        {type = 11,value = 1550,job =1},
						{type = 5,value = 9300,job =1},

				        {type = 13,value = 465,job =2},
				        {type = 15,value = 1550,job =2},
						{type = 5,value = 9300,job =2},

				        {type = 17,value = 465,job =3},
				        {type = 19,value = 1550,job =3},
						{type = 5,value = 9300,job =3},

				    },
				},
--17级 
				{
					needJingHua = 900, 
					attr=
					{
				        {type = 9,value = 541,job =1},
				        {type = 11,value = 1802,job =1},
						{type = 5,value = 10812,job =1},

				        {type = 13,value = 541,job =2},
				        {type = 15,value = 1802,job =2},
						{type = 5,value = 10812,job =2},

				        {type = 17,value = 541,job =3},
				        {type = 19,value = 1802,job =3},
						{type = 5,value = 10812,job =3},

				    },
				},
--18级 
				{
					needJingHua = 1000, 
					attr=
					{
				        {type = 9,value = 619,job =1},
				        {type = 11,value = 2062,job =1},
						{type = 5,value = 12372,job =1},

				        {type = 13,value = 619,job =2},
				        {type = 15,value = 2062,job =2},
						{type = 5,value = 12372,job =2},

				        {type = 17,value = 619,job =3},
				        {type = 19,value = 2062,job =3},
						{type = 5,value = 12372,job =3},

				    },
				},
--19级 
				{
					needJingHua = 1100, 
					attr=
					{
				        {type = 9,value = 698,job =1},
				        {type = 11,value = 2326,job =1},
						{type = 5,value = 13956,job =1},

				        {type = 13,value = 698,job =2},
				        {type = 15,value = 2326,job =2},
						{type = 5,value = 13956,job =2},

				        {type = 17,value = 698,job =3},
				        {type = 19,value = 2326,job =3},
						{type = 5,value = 13956,job =3},

				    },
				},
--20级 
				{
					needJingHua = 1200, 
					attr=
					{
				        {type = 9,value = 777,job =1},
				        {type = 11,value = 2590,job =1},
						{type = 5,value = 15540,job =1},

				        {type = 13,value = 777,job =2},
				        {type = 15,value = 2590,job =2},
						{type = 5,value = 15540,job =2},

				        {type = 17,value = 777,job =3},
				        {type = 19,value = 2590,job =3},
						{type = 5,value = 15540,job =3},

				    },
				},
--21级 
				{
					needJingHua = 1300, 
					attr=
					{
				        {type = 9,value = 855,job =1},
				        {type = 11,value = 2850,job =1},
						{type = 5,value = 17100,job =1},

				        {type = 13,value = 855,job =2},
				        {type = 15,value = 2850,job =2},
						{type = 5,value = 17100,job =2},

				        {type = 17,value = 855,job =3},
				        {type = 19,value = 2850,job =3},
						{type = 5,value = 17100,job =3},

				    },
				},
--22级 
				{
					needJingHua = 1400, 
					attr=
					{
				        {type = 9,value = 931,job =1},
				        {type = 11,value = 3102,job =1},
						{type = 5,value = 18612,job =1},

				        {type = 13,value = 931,job =2},
				        {type = 15,value = 3102,job =2},
						{type = 5,value = 18612,job =2},

				        {type = 17,value = 931,job =3},
				        {type = 19,value = 3102,job =3},
						{type = 5,value = 18612,job =3},

				    },
				},
--23级 
				{
					needJingHua = 1500, 
					attr=
					{
				        {type = 9,value = 1003,job =1},
				        {type = 11,value = 3342,job =1},
						{type = 5,value = 20052,job =1},

				        {type = 13,value = 1003,job =2},
				        {type = 15,value = 3342,job =2},
						{type = 5,value = 20052,job =2},

				        {type = 17,value = 1003,job =3},
				        {type = 19,value = 3342,job =3},
						{type = 5,value = 20052,job =3},

				    },
				},
--24级 
				{
					needJingHua = 1600, 
					attr=
					{
				        {type = 9,value = 1070,job =1},
				        {type = 11,value = 3566,job =1},
						{type = 5,value = 21396,job =1},

				        {type = 13,value = 1070,job =2},
				        {type = 15,value = 3566,job =2},
						{type = 5,value = 21396,job =2},

				        {type = 17,value = 1070,job =3},
				        {type = 19,value = 3566,job =3},
						{type = 5,value = 21396,job =3},

				    },
				},
--25级 
				{
					needJingHua = 1700, 
					attr=
					{
				        {type = 9,value = 1131,job =1},
				        {type = 11,value = 3770,job =1},
						{type = 5,value = 22620,job =1},

				        {type = 13,value = 1131,job =2},
				        {type = 15,value = 3770,job =2},
						{type = 5,value = 22620,job =2},

				        {type = 17,value = 1131,job =3},
				        {type = 19,value = 3770,job =3},
						{type = 5,value = 22620,job =3},

				    },
				},
--26级 
				{
					needJingHua = 1800, 
					attr=
					{
				        {type = 9,value = 1185,job =1},
				        {type = 11,value = 3950,job =1},
						{type = 5,value = 23700,job =1},

				        {type = 13,value = 1185,job =2},
				        {type = 15,value = 3950,job =2},
						{type = 5,value = 23700,job =2},

				        {type = 17,value = 1185,job =3},
				        {type = 19,value = 3950,job =3},
						{type = 5,value = 23700,job =3},

				    },
				},
--27级 
				{
					needJingHua = 1900, 
					attr=
					{
				        {type = 9,value = 1231,job =1},
				        {type = 11,value = 4102,job =1},
						{type = 5,value = 24612,job =1},

				        {type = 13,value = 1231,job =2},
				        {type = 15,value = 4102,job =2},
						{type = 5,value = 24612,job =2},

				        {type = 17,value = 1231,job =3},
				        {type = 19,value = 4102,job =3},
						{type = 5,value = 24612,job =3},

				    },
				},
--28级 
				{
					needJingHua = 2000, 
					attr=
					{
				        {type = 9,value = 1273,job =1},
				        {type = 11,value = 4242,job =1},
						{type = 5,value = 25452,job =1},

				        {type = 13,value = 1273,job =2},
				        {type = 15,value = 4242,job =2},
						{type = 5,value = 25452,job =2},

				        {type = 17,value = 1273,job =3},
				        {type = 19,value = 4242,job =3},
						{type = 5,value = 25452,job =3},

				    },
				},
--29级 
				{
					needJingHua = 2100, 
					attr=
					{
				        {type = 9,value = 1310,job =1},
				        {type = 11,value = 4368,job =1},
						{type = 5,value = 26208,job =1},

				        {type = 13,value = 1310,job =2},
				        {type = 15,value = 4368,job =2},
						{type = 5,value = 26208,job =2},

				        {type = 17,value = 1310,job =3},
				        {type = 19,value = 4368,job =3},
						{type = 5,value = 26208,job =3},

				    },
				},
--30级 
				{
					needJingHua = 2200, 
					attr=
					{
				        {type = 9,value = 1350,job =1},
				        {type = 11,value = 4500,job =1},
						{type = 5,value = 27000,job =1},

				        {type = 13,value = 1350,job =2},
				        {type = 15,value = 4500,job =2},
						{type = 5,value = 27000,job =2},

				        {type = 17,value = 1350,job =3},
				        {type = 19,value = 4500,job =3},
						{type = 5,value = 27000,job =3},

				    },
				},
--31级 
				{
					needJingHua = 2300, 
					attr=
					{
				        {type = 9,value = 1391,job =1},
				        {type = 11,value = 4638,job =1},
						{type = 5,value = 27828,job =1},

				        {type = 13,value = 1391,job =2},
				        {type = 15,value = 4638,job =2},
						{type = 5,value = 27828,job =2},

				        {type = 17,value = 1391,job =3},
				        {type = 19,value = 4638,job =3},
						{type = 5,value = 27828,job =3},

				    },
				},
--32级 
				{
					needJingHua = 2400, 
					attr=
					{
				        {type = 9,value = 1435,job =1},
				        {type = 11,value = 4782,job =1},
						{type = 5,value = 28692,job =1},

				        {type = 13,value = 1435,job =2},
				        {type = 15,value = 4782,job =2},
						{type = 5,value = 28692,job =2},

				        {type = 17,value = 1435,job =3},
				        {type = 19,value = 4782,job =3},
						{type = 5,value = 28692,job =3},

				    },
				},
--33级 
				{
					needJingHua = 2500, 
					attr=
					{
				        {type = 9,value = 1480,job =1},
				        {type = 11,value = 4932,job =1},
						{type = 5,value = 29592,job =1},

				        {type = 13,value = 1480,job =2},
				        {type = 15,value = 4932,job =2},
						{type = 5,value = 29592,job =2},

				        {type = 17,value = 1480,job =3},
				        {type = 19,value = 4932,job =3},
						{type = 5,value = 29592,job =3},

				    },
				},
--34级 
				{
					needJingHua = 2600, 
					attr=
					{
				        {type = 9,value = 1526,job =1},
				        {type = 11,value = 5088,job =1},
						{type = 5,value = 30528,job =1},

				        {type = 13,value = 1526,job =2},
				        {type = 15,value = 5088,job =2},
						{type = 5,value = 30528,job =2},

				        {type = 17,value = 1526,job =3},
				        {type = 19,value = 5088,job =3},
						{type = 5,value = 30528,job =3},

				    },
				},
--35级 
				{
					needJingHua = 2700, 
					attr=
					{
				        {type = 9,value = 1575,job =1},
				        {type = 11,value = 5250,job =1},
						{type = 5,value = 31500,job =1},

				        {type = 13,value = 1575,job =2},
				        {type = 15,value = 5250,job =2},
						{type = 5,value = 31500,job =2},

				        {type = 17,value = 1575,job =3},
				        {type = 19,value = 5250,job =3},
						{type = 5,value = 31500,job =3},

				    },
				},
--36级 
				{
					needJingHua = 2800, 
					attr=
					{
				        {type = 9,value = 1625,job =1},
				        {type = 11,value = 5418,job =1},
						{type = 5,value = 32508,job =1},

				        {type = 13,value = 1625,job =2},
				        {type = 15,value = 5418,job =2},
						{type = 5,value = 32508,job =2},

				        {type = 17,value = 1625,job =3},
				        {type = 19,value = 5418,job =3},
						{type = 5,value = 32508,job =3},

				    },
				},
--37级 
				{
					needJingHua = 2900, 
					attr=
					{
				        {type = 9,value = 1678,job =1},
				        {type = 11,value = 5592,job =1},
						{type = 5,value = 33552,job =1},

				        {type = 13,value = 1678,job =2},
				        {type = 15,value = 5592,job =2},
						{type = 5,value = 33552,job =2},

				        {type = 17,value = 1678,job =3},
				        {type = 19,value = 5592,job =3},
						{type = 5,value = 33552,job =3},

				    },
				},
--38级 
				{
					needJingHua = 3000, 
					attr=
					{
				        {type = 9,value = 1732,job =1},
				        {type = 11,value = 5772,job =1},
						{type = 5,value = 34632,job =1},

				        {type = 13,value = 1732,job =2},
				        {type = 15,value = 5772,job =2},
						{type = 5,value = 34632,job =2},

				        {type = 17,value = 1732,job =3},
				        {type = 19,value = 5772,job =3},
						{type = 5,value = 34632,job =3},

				    },
				},
--39级 
				{
					needJingHua = 3100, 
					attr=
					{
				        {type = 9,value = 1787,job =1},
				        {type = 11,value = 5958,job =1},
						{type = 5,value = 35748,job =1},

				        {type = 13,value = 1787,job =2},
				        {type = 15,value = 5958,job =2},
						{type = 5,value = 35748,job =2},

				        {type = 17,value = 1787,job =3},
				        {type = 19,value = 5958,job =3},
						{type = 5,value = 35748,job =3},

				    },
				},
--40级 
				{
					needJingHua = 3200, 
					attr=
					{
				        {type = 9,value = 1845,job =1},
				        {type = 11,value = 6150,job =1},
						{type = 5,value = 36900,job =1},

				        {type = 13,value = 1845,job =2},
				        {type = 15,value = 6150,job =2},
						{type = 5,value = 36900,job =2},

				        {type = 17,value = 1845,job =3},
				        {type = 19,value = 6150,job =3},
						{type = 5,value = 36900,job =3},

				    },
				},
--41级 
				{
					needJingHua = 3300, 
					attr=
					{
				        {type = 9,value = 1904,job =1},
				        {type = 11,value = 6348,job =1},
						{type = 5,value = 38088,job =1},

				        {type = 13,value = 1904,job =2},
				        {type = 15,value = 6348,job =2},
						{type = 5,value = 38088,job =2},

				        {type = 17,value = 1904,job =3},
				        {type = 19,value = 6348,job =3},
						{type = 5,value = 38088,job =3},

				    },
				},
--42级 
				{
					needJingHua = 3400, 
					attr=
					{
				        {type = 9,value = 1966,job =1},
				        {type = 11,value = 6552,job =1},
						{type = 5,value = 39312,job =1},

				        {type = 13,value = 1966,job =2},
				        {type = 15,value = 6552,job =2},
						{type = 5,value = 39312,job =2},

				        {type = 17,value = 1966,job =3},
				        {type = 19,value = 6552,job =3},
						{type = 5,value = 39312,job =3},

				    },
				},
--43级 
				{
					needJingHua = 3500, 
					attr=
					{
				        {type = 9,value = 2029,job =1},
				        {type = 11,value = 6762,job =1},
						{type = 5,value = 40572,job =1},

				        {type = 13,value = 2029,job =2},
				        {type = 15,value = 6762,job =2},
						{type = 5,value = 40572,job =2},

				        {type = 17,value = 2029,job =3},
				        {type = 19,value = 6762,job =3},
						{type = 5,value = 40572,job =3},

				    },
				},
--44级 
				{
					needJingHua = 3600, 
					attr=
					{
				        {type = 9,value = 2093,job =1},
				        {type = 11,value = 6978,job =1},
						{type = 5,value = 41868,job =1},

				        {type = 13,value = 2093,job =2},
				        {type = 15,value = 6978,job =2},
						{type = 5,value = 41868,job =2},

				        {type = 17,value = 2093,job =3},
				        {type = 19,value = 6978,job =3},
						{type = 5,value = 41868,job =3},

				    },
				},
--45级 
				{
					needJingHua = 3700, 
					attr=
					{
				        {type = 9,value = 2160,job =1},
				        {type = 11,value = 7200,job =1},
						{type = 5,value = 43200,job =1},

				        {type = 13,value = 2160,job =2},
				        {type = 15,value = 7200,job =2},
						{type = 5,value = 43200,job =2},

				        {type = 17,value = 2160,job =3},
				        {type = 19,value = 7200,job =3},
						{type = 5,value = 43200,job =3},

				    },
				},
--46级 
				{
					needJingHua = 3800, 
					attr=
					{
				        {type = 9,value = 2228,job =1},
				        {type = 11,value = 7428,job =1},
						{type = 5,value = 44568,job =1},

				        {type = 13,value = 2228,job =2},
				        {type = 15,value = 7428,job =2},
						{type = 5,value = 44568,job =2},

				        {type = 17,value = 2228,job =3},
				        {type = 19,value = 7428,job =3},
						{type = 5,value = 44568,job =3},

				    },
				},
--47级 
				{
					needJingHua = 3900, 
					attr=
					{
				        {type = 9,value = 2299,job =1},
				        {type = 11,value = 7662,job =1},
						{type = 5,value = 45972,job =1},

				        {type = 13,value = 2299,job =2},
				        {type = 15,value = 7662,job =2},
						{type = 5,value = 45972,job =2},

				        {type = 17,value = 2299,job =3},
				        {type = 19,value = 7662,job =3},
						{type = 5,value = 45972,job =3},

				    },
				},
--48级 
				{
					needJingHua = 4000, 
					attr=
					{
				        {type = 9,value = 2371,job =1},
				        {type = 11,value = 7902,job =1},
						{type = 5,value = 47412,job =1},

				        {type = 13,value = 2371,job =2},
				        {type = 15,value = 7902,job =2},
						{type = 5,value = 47412,job =2},

				        {type = 17,value = 2371,job =3},
				        {type = 19,value = 7902,job =3},
						{type = 5,value = 47412,job =3},

				    },
				},
--49级 
				{
					needJingHua = 4100, 
					attr=
					{
				        {type = 9,value = 2444,job =1},
				        {type = 11,value = 8148,job =1},
						{type = 5,value = 48888,job =1},

				        {type = 13,value = 2444,job =2},
				        {type = 15,value = 8148,job =2},
						{type = 5,value = 48888,job =2},

				        {type = 17,value = 2444,job =3},
				        {type = 19,value = 8148,job =3},
						{type = 5,value = 48888,job =3},

				    },
				},
--50级 
				{
					needJingHua = 4200, 
					attr=
					{
				        {type = 9,value = 2520,job =1},
				        {type = 11,value = 8400,job =1},
						{type = 5,value = 50400,job =1},

				        {type = 13,value = 2520,job =2},
				        {type = 15,value = 8400,job =2},
						{type = 5,value = 50400,job =2},

				        {type = 17,value = 2520,job =3},
				        {type = 19,value = 8400,job =3},
						{type = 5,value = 50400,job =3},

				    },
				},

	
	
			
			
			},
		},
	
	
	{	
			position = 1,
			name = "衣服",
			level=
			{
	--1级 
				{
					needJingHua = 30, 
					attr=
					{
				        {type = 126,value = 10,job =1},
				        {type = 127,value = 18,job =1},

				        {type = 126,value = 10,job =2},
				        {type = 127,value = 18,job =2},

				        {type = 126,value = 10,job =3},
				        {type = 127,value = 18,job =3},

				    },
				},
--2级 
				{
					needJingHua = 40, 
					attr=
					{
				        {type = 126,value = 20,job =1},
				        {type = 127,value = 41,job =1},

				        {type = 126,value = 20,job =2},
				        {type = 127,value = 41,job =2},

				        {type = 126,value = 20,job =3},
				        {type = 127,value = 41,job =3},

				    },
				},
--3级 
				{
					needJingHua = 50, 
					attr=
					{
				        {type = 126,value = 30,job =1},
				        {type = 127,value = 69,job =1},

				        {type = 126,value = 30,job =2},
				        {type = 127,value = 69,job =2},

				        {type = 126,value = 30,job =3},
				        {type = 127,value = 69,job =3},

				    },
				},
--4级 
				{
					needJingHua = 60, 
					attr=
					{
				        {type = 126,value = 40,job =1},
				        {type = 127,value = 101,job =1},

				        {type = 126,value = 40,job =2},
				        {type = 127,value = 101,job =2},

				        {type = 126,value = 40,job =3},
				        {type = 127,value = 101,job =3},

				    },
				},
--5级 
				{
					needJingHua = 70, 
					attr=
					{
				        {type = 126,value = 50,job =1},
				        {type = 127,value = 137,job =1},

				        {type = 126,value = 50,job =2},
				        {type = 127,value = 137,job =2},

				        {type = 126,value = 50,job =3},
				        {type = 127,value = 137,job =3},

				    },
				},
--6级 
				{
					needJingHua = 80, 
					attr=
					{
				        {type = 126,value = 60,job =1},
				        {type = 127,value = 177,job =1},

				        {type = 126,value = 60,job =2},
				        {type = 127,value = 177,job =2},

				        {type = 126,value = 60,job =3},
				        {type = 127,value = 177,job =3},

				    },
				},
--7级 
				{
					needJingHua = 100, 
					attr=
					{
				        {type = 126,value = 70,job =1},
				        {type = 127,value = 225,job =1},

				        {type = 126,value = 70,job =2},
				        {type = 127,value = 225,job =2},

				        {type = 126,value = 70,job =3},
				        {type = 127,value = 225,job =3},

				    },
				},
--8级 
				{
					needJingHua = 120, 
					attr=
					{
				        {type = 126,value = 80,job =1},
				        {type = 127,value = 280,job =1},

				        {type = 126,value = 80,job =2},
				        {type = 127,value = 280,job =2},

				        {type = 126,value = 80,job =3},
				        {type = 127,value = 280,job =3},

				    },
				},
--9级 
				{
					needJingHua = 150, 
					attr=
					{
				        {type = 126,value = 90,job =1},
				        {type = 127,value = 346,job =1},

				        {type = 126,value = 90,job =2},
				        {type = 127,value = 346,job =2},

				        {type = 126,value = 90,job =3},
				        {type = 127,value = 346,job =3},

				    },
				},
--10级 
				{
					needJingHua = 200, 
					attr=
					{
				        {type = 126,value = 100,job =1},
				        {type = 127,value = 430,job =1},

				        {type = 126,value = 100,job =2},
				        {type = 127,value = 430,job =2},

				        {type = 126,value = 100,job =3},
				        {type = 127,value = 430,job =3},

				    },
				},
--11级 
				{
					needJingHua = 300, 
					attr=
					{
				        {type = 126,value = 110,job =1},
				        {type = 127,value = 550,job =1},

				        {type = 126,value = 110,job =2},
				        {type = 127,value = 550,job =2},

				        {type = 126,value = 110,job =3},
				        {type = 127,value = 550,job =3},

				    },
				},
--12级 
				{
					needJingHua = 400, 
					attr=
					{
				        {type = 126,value = 120,job =1},
				        {type = 127,value = 702,job =1},

				        {type = 126,value = 120,job =2},
				        {type = 127,value = 702,job =2},

				        {type = 126,value = 120,job =3},
				        {type = 127,value = 702,job =3},

				    },
				},
--13级 
				{
					needJingHua = 500, 
					attr=
					{
				        {type = 126,value = 130,job =1},
				        {type = 127,value = 882,job =1},

				        {type = 126,value = 130,job =2},
				        {type = 127,value = 882,job =2},

				        {type = 126,value = 130,job =3},
				        {type = 127,value = 882,job =3},

				    },
				},
--14级 
				{
					needJingHua = 600, 
					attr=
					{
				        {type = 126,value = 140,job =1},
				        {type = 127,value = 1086,job =1},

				        {type = 126,value = 140,job =2},
				        {type = 127,value = 1086,job =2},

				        {type = 126,value = 140,job =3},
				        {type = 127,value = 1086,job =3},

				    },
				},
--15级 
				{
					needJingHua = 700, 
					attr=
					{
				        {type = 126,value = 150,job =1},
				        {type = 127,value = 1310,job =1},

				        {type = 126,value = 150,job =2},
				        {type = 127,value = 1310,job =2},

				        {type = 126,value = 150,job =3},
				        {type = 127,value = 1310,job =3},

				    },
				},
--16级 
				{
					needJingHua = 800, 
					attr=
					{
				        {type = 126,value = 160,job =1},
				        {type = 127,value = 1550,job =1},

				        {type = 126,value = 160,job =2},
				        {type = 127,value = 1550,job =2},

				        {type = 126,value = 160,job =3},
				        {type = 127,value = 1550,job =3},

				    },
				},
--17级 
				{
					needJingHua = 900, 
					attr=
					{
				        {type = 126,value = 170,job =1},
				        {type = 127,value = 1802,job =1},

				        {type = 126,value = 170,job =2},
				        {type = 127,value = 1802,job =2},

				        {type = 126,value = 170,job =3},
				        {type = 127,value = 1802,job =3},

				    },
				},
--18级 
				{
					needJingHua = 1000, 
					attr=
					{
				        {type = 126,value = 180,job =1},
				        {type = 127,value = 2062,job =1},

				        {type = 126,value = 180,job =2},
				        {type = 127,value = 2062,job =2},

				        {type = 126,value = 180,job =3},
				        {type = 127,value = 2062,job =3},

				    },
				},
--19级 
				{
					needJingHua = 1100, 
					attr=
					{
				        {type = 126,value = 190,job =1},
				        {type = 127,value = 2326,job =1},

				        {type = 126,value = 190,job =2},
				        {type = 127,value = 2326,job =2},

				        {type = 126,value = 190,job =3},
				        {type = 127,value = 2326,job =3},

				    },
				},
--20级 
				{
					needJingHua = 1200, 
					attr=
					{
				        {type = 126,value = 200,job =1},
				        {type = 127,value = 2590,job =1},

				        {type = 126,value = 200,job =2},
				        {type = 127,value = 2590,job =2},

				        {type = 126,value = 200,job =3},
				        {type = 127,value = 2590,job =3},

				    },
				},
--21级 
				{
					needJingHua = 1300, 
					attr=
					{
				        {type = 126,value = 210,job =1},
				        {type = 127,value = 2850,job =1},

				        {type = 126,value = 210,job =2},
				        {type = 127,value = 2850,job =2},

				        {type = 126,value = 210,job =3},
				        {type = 127,value = 2850,job =3},

				    },
				},
--22级 
				{
					needJingHua = 1400, 
					attr=
					{
				        {type = 126,value = 220,job =1},
				        {type = 127,value = 3102,job =1},

				        {type = 126,value = 220,job =2},
				        {type = 127,value = 3102,job =2},

				        {type = 126,value = 220,job =3},
				        {type = 127,value = 3102,job =3},

				    },
				},
--23级 
				{
					needJingHua = 1500, 
					attr=
					{
				        {type = 126,value = 230,job =1},
				        {type = 127,value = 3342,job =1},

				        {type = 126,value = 230,job =2},
				        {type = 127,value = 3342,job =2},

				        {type = 126,value = 230,job =3},
				        {type = 127,value = 3342,job =3},

				    },
				},
--24级 
				{
					needJingHua = 1600, 
					attr=
					{
				        {type = 126,value = 240,job =1},
				        {type = 127,value = 3566,job =1},

				        {type = 126,value = 240,job =2},
				        {type = 127,value = 3566,job =2},

				        {type = 126,value = 240,job =3},
				        {type = 127,value = 3566,job =3},

				    },
				},
--25级 
				{
					needJingHua = 1700, 
					attr=
					{
				        {type = 126,value = 250,job =1},
				        {type = 127,value = 3770,job =1},

				        {type = 126,value = 250,job =2},
				        {type = 127,value = 3770,job =2},

				        {type = 126,value = 250,job =3},
				        {type = 127,value = 3770,job =3},

				    },
				},
--26级 
				{
					needJingHua = 1800, 
					attr=
					{
				        {type = 126,value = 260,job =1},
				        {type = 127,value = 3950,job =1},

				        {type = 126,value = 260,job =2},
				        {type = 127,value = 3950,job =2},

				        {type = 126,value = 260,job =3},
				        {type = 127,value = 3950,job =3},

				    },
				},
--27级 
				{
					needJingHua = 1900, 
					attr=
					{
				        {type = 126,value = 270,job =1},
				        {type = 127,value = 4102,job =1},

				        {type = 126,value = 270,job =2},
				        {type = 127,value = 4102,job =2},

				        {type = 126,value = 270,job =3},
				        {type = 127,value = 4102,job =3},

				    },
				},
--28级 
				{
					needJingHua = 2000, 
					attr=
					{
				        {type = 126,value = 280,job =1},
				        {type = 127,value = 4242,job =1},

				        {type = 126,value = 280,job =2},
				        {type = 127,value = 4242,job =2},

				        {type = 126,value = 280,job =3},
				        {type = 127,value = 4242,job =3},

				    },
				},
--29级 
				{
					needJingHua = 2100, 
					attr=
					{
				        {type = 126,value = 290,job =1},
				        {type = 127,value = 4368,job =1},

				        {type = 126,value = 290,job =2},
				        {type = 127,value = 4368,job =2},

				        {type = 126,value = 290,job =3},
				        {type = 127,value = 4368,job =3},

				    },
				},
--30级 
				{
					needJingHua = 2200, 
					attr=
					{
				        {type = 126,value = 300,job =1},
				        {type = 127,value = 4500,job =1},

				        {type = 126,value = 300,job =2},
				        {type = 127,value = 4500,job =2},

				        {type = 126,value = 300,job =3},
				        {type = 127,value = 4500,job =3},

				    },
				},
--31级 
				{
					needJingHua = 2300, 
					attr=
					{
				        {type = 126,value = 310,job =1},
				        {type = 127,value = 4638,job =1},

				        {type = 126,value = 310,job =2},
				        {type = 127,value = 4638,job =2},

				        {type = 126,value = 310,job =3},
				        {type = 127,value = 4638,job =3},

				    },
				},
--32级 
				{
					needJingHua = 2400, 
					attr=
					{
				        {type = 126,value = 320,job =1},
				        {type = 127,value = 4782,job =1},

				        {type = 126,value = 320,job =2},
				        {type = 127,value = 4782,job =2},

				        {type = 126,value = 320,job =3},
				        {type = 127,value = 4782,job =3},

				    },
				},
--33级 
				{
					needJingHua = 2500, 
					attr=
					{
				        {type = 126,value = 330,job =1},
				        {type = 127,value = 4932,job =1},

				        {type = 126,value = 330,job =2},
				        {type = 127,value = 4932,job =2},

				        {type = 126,value = 330,job =3},
				        {type = 127,value = 4932,job =3},

				    },
				},
--34级 
				{
					needJingHua = 2600, 
					attr=
					{
				        {type = 126,value = 340,job =1},
				        {type = 127,value = 5088,job =1},

				        {type = 126,value = 340,job =2},
				        {type = 127,value = 5088,job =2},

				        {type = 126,value = 340,job =3},
				        {type = 127,value = 5088,job =3},

				    },
				},
--35级 
				{
					needJingHua = 2700, 
					attr=
					{
				        {type = 126,value = 350,job =1},
				        {type = 127,value = 5250,job =1},

				        {type = 126,value = 350,job =2},
				        {type = 127,value = 5250,job =2},

				        {type = 126,value = 350,job =3},
				        {type = 127,value = 5250,job =3},

				    },
				},
--36级 
				{
					needJingHua = 2800, 
					attr=
					{
				        {type = 126,value = 360,job =1},
				        {type = 127,value = 5418,job =1},

				        {type = 126,value = 360,job =2},
				        {type = 127,value = 5418,job =2},

				        {type = 126,value = 360,job =3},
				        {type = 127,value = 5418,job =3},

				    },
				},
--37级 
				{
					needJingHua = 2900, 
					attr=
					{
				        {type = 126,value = 370,job =1},
				        {type = 127,value = 5592,job =1},

				        {type = 126,value = 370,job =2},
				        {type = 127,value = 5592,job =2},

				        {type = 126,value = 370,job =3},
				        {type = 127,value = 5592,job =3},

				    },
				},
--38级 
				{
					needJingHua = 3000, 
					attr=
					{
				        {type = 126,value = 380,job =1},
				        {type = 127,value = 5772,job =1},

				        {type = 126,value = 380,job =2},
				        {type = 127,value = 5772,job =2},

				        {type = 126,value = 380,job =3},
				        {type = 127,value = 5772,job =3},

				    },
				},
--39级 
				{
					needJingHua = 3100, 
					attr=
					{
				        {type = 126,value = 390,job =1},
				        {type = 127,value = 5958,job =1},

				        {type = 126,value = 390,job =2},
				        {type = 127,value = 5958,job =2},

				        {type = 126,value = 390,job =3},
				        {type = 127,value = 5958,job =3},

				    },
				},
--40级 
				{
					needJingHua = 3200, 
					attr=
					{
				        {type = 126,value = 400,job =1},
				        {type = 127,value = 6150,job =1},

				        {type = 126,value = 400,job =2},
				        {type = 127,value = 6150,job =2},

				        {type = 126,value = 400,job =3},
				        {type = 127,value = 6150,job =3},

				    },
				},
--41级 
				{
					needJingHua = 3300, 
					attr=
					{
				        {type = 126,value = 410,job =1},
				        {type = 127,value = 6348,job =1},

				        {type = 126,value = 410,job =2},
				        {type = 127,value = 6348,job =2},

				        {type = 126,value = 410,job =3},
				        {type = 127,value = 6348,job =3},

				    },
				},
--42级 
				{
					needJingHua = 3400, 
					attr=
					{
				        {type = 126,value = 420,job =1},
				        {type = 127,value = 6552,job =1},

				        {type = 126,value = 420,job =2},
				        {type = 127,value = 6552,job =2},

				        {type = 126,value = 420,job =3},
				        {type = 127,value = 6552,job =3},

				    },
				},
--43级 
				{
					needJingHua = 3500, 
					attr=
					{
				        {type = 126,value = 430,job =1},
				        {type = 127,value = 6762,job =1},

				        {type = 126,value = 430,job =2},
				        {type = 127,value = 6762,job =2},

				        {type = 126,value = 430,job =3},
				        {type = 127,value = 6762,job =3},

				    },
				},
--44级 
				{
					needJingHua = 3600, 
					attr=
					{
				        {type = 126,value = 440,job =1},
				        {type = 127,value = 6978,job =1},

				        {type = 126,value = 440,job =2},
				        {type = 127,value = 6978,job =2},

				        {type = 126,value = 440,job =3},
				        {type = 127,value = 6978,job =3},

				    },
				},
--45级 
				{
					needJingHua = 3700, 
					attr=
					{
				        {type = 126,value = 450,job =1},
				        {type = 127,value = 7200,job =1},

				        {type = 126,value = 450,job =2},
				        {type = 127,value = 7200,job =2},

				        {type = 126,value = 450,job =3},
				        {type = 127,value = 7200,job =3},

				    },
				},
--46级 
				{
					needJingHua = 3800, 
					attr=
					{
				        {type = 126,value = 460,job =1},
				        {type = 127,value = 7428,job =1},

				        {type = 126,value = 460,job =2},
				        {type = 127,value = 7428,job =2},

				        {type = 126,value = 460,job =3},
				        {type = 127,value = 7428,job =3},

				    },
				},
--47级 
				{
					needJingHua = 3900, 
					attr=
					{
				        {type = 126,value = 470,job =1},
				        {type = 127,value = 7662,job =1},

				        {type = 126,value = 470,job =2},
				        {type = 127,value = 7662,job =2},

				        {type = 126,value = 470,job =3},
				        {type = 127,value = 7662,job =3},

				    },
				},
--48级 
				{
					needJingHua = 4000, 
					attr=
					{
				        {type = 126,value = 480,job =1},
				        {type = 127,value = 7902,job =1},

				        {type = 126,value = 480,job =2},
				        {type = 127,value = 7902,job =2},

				        {type = 126,value = 480,job =3},
				        {type = 127,value = 7902,job =3},

				    },
				},
--49级 
				{
					needJingHua = 4100, 
					attr=
					{
				        {type = 126,value = 490,job =1},
				        {type = 127,value = 8148,job =1},

				        {type = 126,value = 490,job =2},
				        {type = 127,value = 8148,job =2},

				        {type = 126,value = 490,job =3},
				        {type = 127,value = 8148,job =3},

				    },
				},
--50级 
				{
					needJingHua = 4200, 
					attr=
					{
				        {type = 126,value = 500,job =1},
				        {type = 127,value = 8400,job =1},

				        {type = 126,value = 500,job =2},
				        {type = 127,value = 8400,job =2},

				        {type = 126,value = 500,job =3},
				        {type = 127,value = 8400,job =3},

				    },
				},

	
			
			
			},
		},
	
		{	
			position = 2,
			name = "头盔",
			level=
			{
	--1级 
				{
					needJingHua = 30, 
					attr=
					{
				        {type = 126,value = 10,job =1},
				        {type = 127,value = 18,job =1},

				        {type = 126,value = 10,job =2},
				        {type = 127,value = 18,job =2},

				        {type = 126,value = 10,job =3},
				        {type = 127,value = 18,job =3},

				    },
				},
--2级 
				{
					needJingHua = 40, 
					attr=
					{
				        {type = 126,value = 20,job =1},
				        {type = 127,value = 41,job =1},

				        {type = 126,value = 20,job =2},
				        {type = 127,value = 41,job =2},

				        {type = 126,value = 20,job =3},
				        {type = 127,value = 41,job =3},

				    },
				},
--3级 
				{
					needJingHua = 50, 
					attr=
					{
				        {type = 126,value = 30,job =1},
				        {type = 127,value = 69,job =1},

				        {type = 126,value = 30,job =2},
				        {type = 127,value = 69,job =2},

				        {type = 126,value = 30,job =3},
				        {type = 127,value = 69,job =3},

				    },
				},
--4级 
				{
					needJingHua = 60, 
					attr=
					{
				        {type = 126,value = 40,job =1},
				        {type = 127,value = 101,job =1},

				        {type = 126,value = 40,job =2},
				        {type = 127,value = 101,job =2},

				        {type = 126,value = 40,job =3},
				        {type = 127,value = 101,job =3},

				    },
				},
--5级 
				{
					needJingHua = 70, 
					attr=
					{
				        {type = 126,value = 50,job =1},
				        {type = 127,value = 137,job =1},

				        {type = 126,value = 50,job =2},
				        {type = 127,value = 137,job =2},

				        {type = 126,value = 50,job =3},
				        {type = 127,value = 137,job =3},

				    },
				},
--6级 
				{
					needJingHua = 80, 
					attr=
					{
				        {type = 126,value = 60,job =1},
				        {type = 127,value = 177,job =1},

				        {type = 126,value = 60,job =2},
				        {type = 127,value = 177,job =2},

				        {type = 126,value = 60,job =3},
				        {type = 127,value = 177,job =3},

				    },
				},
--7级 
				{
					needJingHua = 100, 
					attr=
					{
				        {type = 126,value = 70,job =1},
				        {type = 127,value = 225,job =1},

				        {type = 126,value = 70,job =2},
				        {type = 127,value = 225,job =2},

				        {type = 126,value = 70,job =3},
				        {type = 127,value = 225,job =3},

				    },
				},
--8级 
				{
					needJingHua = 120, 
					attr=
					{
				        {type = 126,value = 80,job =1},
				        {type = 127,value = 280,job =1},

				        {type = 126,value = 80,job =2},
				        {type = 127,value = 280,job =2},

				        {type = 126,value = 80,job =3},
				        {type = 127,value = 280,job =3},

				    },
				},
--9级 
				{
					needJingHua = 150, 
					attr=
					{
				        {type = 126,value = 90,job =1},
				        {type = 127,value = 346,job =1},

				        {type = 126,value = 90,job =2},
				        {type = 127,value = 346,job =2},

				        {type = 126,value = 90,job =3},
				        {type = 127,value = 346,job =3},

				    },
				},
--10级 
				{
					needJingHua = 200, 
					attr=
					{
				        {type = 126,value = 100,job =1},
				        {type = 127,value = 430,job =1},

				        {type = 126,value = 100,job =2},
				        {type = 127,value = 430,job =2},

				        {type = 126,value = 100,job =3},
				        {type = 127,value = 430,job =3},

				    },
				},
--11级 
				{
					needJingHua = 300, 
					attr=
					{
				        {type = 126,value = 110,job =1},
				        {type = 127,value = 550,job =1},

				        {type = 126,value = 110,job =2},
				        {type = 127,value = 550,job =2},

				        {type = 126,value = 110,job =3},
				        {type = 127,value = 550,job =3},

				    },
				},
--12级 
				{
					needJingHua = 400, 
					attr=
					{
				        {type = 126,value = 120,job =1},
				        {type = 127,value = 702,job =1},

				        {type = 126,value = 120,job =2},
				        {type = 127,value = 702,job =2},

				        {type = 126,value = 120,job =3},
				        {type = 127,value = 702,job =3},

				    },
				},
--13级 
				{
					needJingHua = 500, 
					attr=
					{
				        {type = 126,value = 130,job =1},
				        {type = 127,value = 882,job =1},

				        {type = 126,value = 130,job =2},
				        {type = 127,value = 882,job =2},

				        {type = 126,value = 130,job =3},
				        {type = 127,value = 882,job =3},

				    },
				},
--14级 
				{
					needJingHua = 600, 
					attr=
					{
				        {type = 126,value = 140,job =1},
				        {type = 127,value = 1086,job =1},

				        {type = 126,value = 140,job =2},
				        {type = 127,value = 1086,job =2},

				        {type = 126,value = 140,job =3},
				        {type = 127,value = 1086,job =3},

				    },
				},
--15级 
				{
					needJingHua = 700, 
					attr=
					{
				        {type = 126,value = 150,job =1},
				        {type = 127,value = 1310,job =1},

				        {type = 126,value = 150,job =2},
				        {type = 127,value = 1310,job =2},

				        {type = 126,value = 150,job =3},
				        {type = 127,value = 1310,job =3},

				    },
				},
--16级 
				{
					needJingHua = 800, 
					attr=
					{
				        {type = 126,value = 160,job =1},
				        {type = 127,value = 1550,job =1},

				        {type = 126,value = 160,job =2},
				        {type = 127,value = 1550,job =2},

				        {type = 126,value = 160,job =3},
				        {type = 127,value = 1550,job =3},

				    },
				},
--17级 
				{
					needJingHua = 900, 
					attr=
					{
				        {type = 126,value = 170,job =1},
				        {type = 127,value = 1802,job =1},

				        {type = 126,value = 170,job =2},
				        {type = 127,value = 1802,job =2},

				        {type = 126,value = 170,job =3},
				        {type = 127,value = 1802,job =3},

				    },
				},
--18级 
				{
					needJingHua = 1000, 
					attr=
					{
				        {type = 126,value = 180,job =1},
				        {type = 127,value = 2062,job =1},

				        {type = 126,value = 180,job =2},
				        {type = 127,value = 2062,job =2},

				        {type = 126,value = 180,job =3},
				        {type = 127,value = 2062,job =3},

				    },
				},
--19级 
				{
					needJingHua = 1100, 
					attr=
					{
				        {type = 126,value = 190,job =1},
				        {type = 127,value = 2326,job =1},

				        {type = 126,value = 190,job =2},
				        {type = 127,value = 2326,job =2},

				        {type = 126,value = 190,job =3},
				        {type = 127,value = 2326,job =3},

				    },
				},
--20级 
				{
					needJingHua = 1200, 
					attr=
					{
				        {type = 126,value = 200,job =1},
				        {type = 127,value = 2590,job =1},

				        {type = 126,value = 200,job =2},
				        {type = 127,value = 2590,job =2},

				        {type = 126,value = 200,job =3},
				        {type = 127,value = 2590,job =3},

				    },
				},
--21级 
				{
					needJingHua = 1300, 
					attr=
					{
				        {type = 126,value = 210,job =1},
				        {type = 127,value = 2850,job =1},

				        {type = 126,value = 210,job =2},
				        {type = 127,value = 2850,job =2},

				        {type = 126,value = 210,job =3},
				        {type = 127,value = 2850,job =3},

				    },
				},
--22级 
				{
					needJingHua = 1400, 
					attr=
					{
				        {type = 126,value = 220,job =1},
				        {type = 127,value = 3102,job =1},

				        {type = 126,value = 220,job =2},
				        {type = 127,value = 3102,job =2},

				        {type = 126,value = 220,job =3},
				        {type = 127,value = 3102,job =3},

				    },
				},
--23级 
				{
					needJingHua = 1500, 
					attr=
					{
				        {type = 126,value = 230,job =1},
				        {type = 127,value = 3342,job =1},

				        {type = 126,value = 230,job =2},
				        {type = 127,value = 3342,job =2},

				        {type = 126,value = 230,job =3},
				        {type = 127,value = 3342,job =3},

				    },
				},
--24级 
				{
					needJingHua = 1600, 
					attr=
					{
				        {type = 126,value = 240,job =1},
				        {type = 127,value = 3566,job =1},

				        {type = 126,value = 240,job =2},
				        {type = 127,value = 3566,job =2},

				        {type = 126,value = 240,job =3},
				        {type = 127,value = 3566,job =3},

				    },
				},
--25级 
				{
					needJingHua = 1700, 
					attr=
					{
				        {type = 126,value = 250,job =1},
				        {type = 127,value = 3770,job =1},

				        {type = 126,value = 250,job =2},
				        {type = 127,value = 3770,job =2},

				        {type = 126,value = 250,job =3},
				        {type = 127,value = 3770,job =3},

				    },
				},
--26级 
				{
					needJingHua = 1800, 
					attr=
					{
				        {type = 126,value = 260,job =1},
				        {type = 127,value = 3950,job =1},

				        {type = 126,value = 260,job =2},
				        {type = 127,value = 3950,job =2},

				        {type = 126,value = 260,job =3},
				        {type = 127,value = 3950,job =3},

				    },
				},
--27级 
				{
					needJingHua = 1900, 
					attr=
					{
				        {type = 126,value = 270,job =1},
				        {type = 127,value = 4102,job =1},

				        {type = 126,value = 270,job =2},
				        {type = 127,value = 4102,job =2},

				        {type = 126,value = 270,job =3},
				        {type = 127,value = 4102,job =3},

				    },
				},
--28级 
				{
					needJingHua = 2000, 
					attr=
					{
				        {type = 126,value = 280,job =1},
				        {type = 127,value = 4242,job =1},

				        {type = 126,value = 280,job =2},
				        {type = 127,value = 4242,job =2},

				        {type = 126,value = 280,job =3},
				        {type = 127,value = 4242,job =3},

				    },
				},
--29级 
				{
					needJingHua = 2100, 
					attr=
					{
				        {type = 126,value = 290,job =1},
				        {type = 127,value = 4368,job =1},

				        {type = 126,value = 290,job =2},
				        {type = 127,value = 4368,job =2},

				        {type = 126,value = 290,job =3},
				        {type = 127,value = 4368,job =3},

				    },
				},
--30级 
				{
					needJingHua = 2200, 
					attr=
					{
				        {type = 126,value = 300,job =1},
				        {type = 127,value = 4500,job =1},

				        {type = 126,value = 300,job =2},
				        {type = 127,value = 4500,job =2},

				        {type = 126,value = 300,job =3},
				        {type = 127,value = 4500,job =3},

				    },
				},
--31级 
				{
					needJingHua = 2300, 
					attr=
					{
				        {type = 126,value = 310,job =1},
				        {type = 127,value = 4638,job =1},

				        {type = 126,value = 310,job =2},
				        {type = 127,value = 4638,job =2},

				        {type = 126,value = 310,job =3},
				        {type = 127,value = 4638,job =3},

				    },
				},
--32级 
				{
					needJingHua = 2400, 
					attr=
					{
				        {type = 126,value = 320,job =1},
				        {type = 127,value = 4782,job =1},

				        {type = 126,value = 320,job =2},
				        {type = 127,value = 4782,job =2},

				        {type = 126,value = 320,job =3},
				        {type = 127,value = 4782,job =3},

				    },
				},
--33级 
				{
					needJingHua = 2500, 
					attr=
					{
				        {type = 126,value = 330,job =1},
				        {type = 127,value = 4932,job =1},

				        {type = 126,value = 330,job =2},
				        {type = 127,value = 4932,job =2},

				        {type = 126,value = 330,job =3},
				        {type = 127,value = 4932,job =3},

				    },
				},
--34级 
				{
					needJingHua = 2600, 
					attr=
					{
				        {type = 126,value = 340,job =1},
				        {type = 127,value = 5088,job =1},

				        {type = 126,value = 340,job =2},
				        {type = 127,value = 5088,job =2},

				        {type = 126,value = 340,job =3},
				        {type = 127,value = 5088,job =3},

				    },
				},
--35级 
				{
					needJingHua = 2700, 
					attr=
					{
				        {type = 126,value = 350,job =1},
				        {type = 127,value = 5250,job =1},

				        {type = 126,value = 350,job =2},
				        {type = 127,value = 5250,job =2},

				        {type = 126,value = 350,job =3},
				        {type = 127,value = 5250,job =3},

				    },
				},
--36级 
				{
					needJingHua = 2800, 
					attr=
					{
				        {type = 126,value = 360,job =1},
				        {type = 127,value = 5418,job =1},

				        {type = 126,value = 360,job =2},
				        {type = 127,value = 5418,job =2},

				        {type = 126,value = 360,job =3},
				        {type = 127,value = 5418,job =3},

				    },
				},
--37级 
				{
					needJingHua = 2900, 
					attr=
					{
				        {type = 126,value = 370,job =1},
				        {type = 127,value = 5592,job =1},

				        {type = 126,value = 370,job =2},
				        {type = 127,value = 5592,job =2},

				        {type = 126,value = 370,job =3},
				        {type = 127,value = 5592,job =3},

				    },
				},
--38级 
				{
					needJingHua = 3000, 
					attr=
					{
				        {type = 126,value = 380,job =1},
				        {type = 127,value = 5772,job =1},

				        {type = 126,value = 380,job =2},
				        {type = 127,value = 5772,job =2},

				        {type = 126,value = 380,job =3},
				        {type = 127,value = 5772,job =3},

				    },
				},
--39级 
				{
					needJingHua = 3100, 
					attr=
					{
				        {type = 126,value = 390,job =1},
				        {type = 127,value = 5958,job =1},

				        {type = 126,value = 390,job =2},
				        {type = 127,value = 5958,job =2},

				        {type = 126,value = 390,job =3},
				        {type = 127,value = 5958,job =3},

				    },
				},
--40级 
				{
					needJingHua = 3200, 
					attr=
					{
				        {type = 126,value = 400,job =1},
				        {type = 127,value = 6150,job =1},

				        {type = 126,value = 400,job =2},
				        {type = 127,value = 6150,job =2},

				        {type = 126,value = 400,job =3},
				        {type = 127,value = 6150,job =3},

				    },
				},
--41级 
				{
					needJingHua = 3300, 
					attr=
					{
				        {type = 126,value = 410,job =1},
				        {type = 127,value = 6348,job =1},

				        {type = 126,value = 410,job =2},
				        {type = 127,value = 6348,job =2},

				        {type = 126,value = 410,job =3},
				        {type = 127,value = 6348,job =3},

				    },
				},
--42级 
				{
					needJingHua = 3400, 
					attr=
					{
				        {type = 126,value = 420,job =1},
				        {type = 127,value = 6552,job =1},

				        {type = 126,value = 420,job =2},
				        {type = 127,value = 6552,job =2},

				        {type = 126,value = 420,job =3},
				        {type = 127,value = 6552,job =3},

				    },
				},
--43级 
				{
					needJingHua = 3500, 
					attr=
					{
				        {type = 126,value = 430,job =1},
				        {type = 127,value = 6762,job =1},

				        {type = 126,value = 430,job =2},
				        {type = 127,value = 6762,job =2},

				        {type = 126,value = 430,job =3},
				        {type = 127,value = 6762,job =3},

				    },
				},
--44级 
				{
					needJingHua = 3600, 
					attr=
					{
				        {type = 126,value = 440,job =1},
				        {type = 127,value = 6978,job =1},

				        {type = 126,value = 440,job =2},
				        {type = 127,value = 6978,job =2},

				        {type = 126,value = 440,job =3},
				        {type = 127,value = 6978,job =3},

				    },
				},
--45级 
				{
					needJingHua = 3700, 
					attr=
					{
				        {type = 126,value = 450,job =1},
				        {type = 127,value = 7200,job =1},

				        {type = 126,value = 450,job =2},
				        {type = 127,value = 7200,job =2},

				        {type = 126,value = 450,job =3},
				        {type = 127,value = 7200,job =3},

				    },
				},
--46级 
				{
					needJingHua = 3800, 
					attr=
					{
				        {type = 126,value = 460,job =1},
				        {type = 127,value = 7428,job =1},

				        {type = 126,value = 460,job =2},
				        {type = 127,value = 7428,job =2},

				        {type = 126,value = 460,job =3},
				        {type = 127,value = 7428,job =3},

				    },
				},
--47级 
				{
					needJingHua = 3900, 
					attr=
					{
				        {type = 126,value = 470,job =1},
				        {type = 127,value = 7662,job =1},

				        {type = 126,value = 470,job =2},
				        {type = 127,value = 7662,job =2},

				        {type = 126,value = 470,job =3},
				        {type = 127,value = 7662,job =3},

				    },
				},
--48级 
				{
					needJingHua = 4000, 
					attr=
					{
				        {type = 126,value = 480,job =1},
				        {type = 127,value = 7902,job =1},

				        {type = 126,value = 480,job =2},
				        {type = 127,value = 7902,job =2},

				        {type = 126,value = 480,job =3},
				        {type = 127,value = 7902,job =3},

				    },
				},
--49级 
				{
					needJingHua = 4100, 
					attr=
					{
				        {type = 126,value = 490,job =1},
				        {type = 127,value = 8148,job =1},

				        {type = 126,value = 490,job =2},
				        {type = 127,value = 8148,job =2},

				        {type = 126,value = 490,job =3},
				        {type = 127,value = 8148,job =3},

				    },
				},
--50级 
				{
					needJingHua = 4200, 
					attr=
					{
				        {type = 126,value = 500,job =1},
				        {type = 127,value = 8400,job =1},

				        {type = 126,value = 500,job =2},
				        {type = 127,value = 8400,job =2},

				        {type = 126,value = 500,job =3},
				        {type = 127,value = 8400,job =3},

				    },
				},

	
			
			
			},
		},
	
		{	
			position = 3,
			name = "项链",
			level=
			{
	--1级 
				{
					needJingHua = 30, 
					attr=
					{
				        {type = 9,value = 5,job =1},
				        {type = 11,value = 18,job =1},
						{type = 5,value = 108,job =1},

				        {type = 13,value = 5,job =2},
				        {type = 15,value = 18,job =2},
						{type = 5,value = 108,job =2},

				        {type = 17,value = 5,job =3},
				        {type = 19,value = 18,job =3},
						{type = 5,value = 108,job =3},

				    },
				},
--2级 
				{
					needJingHua = 40, 
					attr=
					{
				        {type = 9,value = 12,job =1},
				        {type = 11,value = 41,job =1},
						{type = 5,value = 246,job =1},

				        {type = 13,value = 12,job =2},
				        {type = 15,value = 41,job =2},
						{type = 5,value = 246,job =2},

				        {type = 17,value = 12,job =3},
				        {type = 19,value = 41,job =3},
						{type = 5,value = 246,job =3},

				    },
				},
--3级 
				{
					needJingHua = 50, 
					attr=
					{
				        {type = 9,value = 21,job =1},
				        {type = 11,value = 69,job =1},
						{type = 5,value = 414,job =1},

				        {type = 13,value = 21,job =2},
				        {type = 15,value = 69,job =2},
						{type = 5,value = 414,job =2},

				        {type = 17,value = 21,job =3},
				        {type = 19,value = 69,job =3},
						{type = 5,value = 414,job =3},

				    },
				},
--4级 
				{
					needJingHua = 60, 
					attr=
					{
				        {type = 9,value = 30,job =1},
				        {type = 11,value = 101,job =1},
						{type = 5,value = 606,job =1},

				        {type = 13,value = 30,job =2},
				        {type = 15,value = 101,job =2},
						{type = 5,value = 606,job =2},

				        {type = 17,value = 30,job =3},
				        {type = 19,value = 101,job =3},
						{type = 5,value = 606,job =3},

				    },
				},
--5级 
				{
					needJingHua = 70, 
					attr=
					{
				        {type = 9,value = 41,job =1},
				        {type = 11,value = 137,job =1},
						{type = 5,value = 822,job =1},

				        {type = 13,value = 41,job =2},
				        {type = 15,value = 137,job =2},
						{type = 5,value = 822,job =2},

				        {type = 17,value = 41,job =3},
				        {type = 19,value = 137,job =3},
						{type = 5,value = 822,job =3},

				    },
				},
--6级 
				{
					needJingHua = 80, 
					attr=
					{
				        {type = 9,value = 53,job =1},
				        {type = 11,value = 177,job =1},
						{type = 5,value = 1062,job =1},

				        {type = 13,value = 53,job =2},
				        {type = 15,value = 177,job =2},
						{type = 5,value = 1062,job =2},

				        {type = 17,value = 53,job =3},
				        {type = 19,value = 177,job =3},
						{type = 5,value = 1062,job =3},

				    },
				},
--7级 
				{
					needJingHua = 100, 
					attr=
					{
				        {type = 9,value = 68,job =1},
				        {type = 11,value = 225,job =1},
						{type = 5,value = 1350,job =1},

				        {type = 13,value = 68,job =2},
				        {type = 15,value = 225,job =2},
						{type = 5,value = 1350,job =2},

				        {type = 17,value = 68,job =3},
				        {type = 19,value = 225,job =3},
						{type = 5,value = 1350,job =3},

				    },
				},
--8级 
				{
					needJingHua = 120, 
					attr=
					{
				        {type = 9,value = 84,job =1},
				        {type = 11,value = 280,job =1},
						{type = 5,value = 1680,job =1},

				        {type = 13,value = 84,job =2},
				        {type = 15,value = 280,job =2},
						{type = 5,value = 1680,job =2},

				        {type = 17,value = 84,job =3},
				        {type = 19,value = 280,job =3},
						{type = 5,value = 1680,job =3},

				    },
				},
--9级 
				{
					needJingHua = 150, 
					attr=
					{
				        {type = 9,value = 104,job =1},
				        {type = 11,value = 346,job =1},
						{type = 5,value = 2076,job =1},

				        {type = 13,value = 104,job =2},
				        {type = 15,value = 346,job =2},
						{type = 5,value = 2076,job =2},

				        {type = 17,value = 104,job =3},
				        {type = 19,value = 346,job =3},
						{type = 5,value = 2076,job =3},

				    },
				},
--10级 
				{
					needJingHua = 200, 
					attr=
					{
				        {type = 9,value = 129,job =1},
				        {type = 11,value = 430,job =1},
						{type = 5,value = 2580,job =1},

				        {type = 13,value = 129,job =2},
				        {type = 15,value = 430,job =2},
						{type = 5,value = 2580,job =2},

				        {type = 17,value = 129,job =3},
				        {type = 19,value = 430,job =3},
						{type = 5,value = 2580,job =3},

				    },
				},
--11级 
				{
					needJingHua = 300, 
					attr=
					{
				        {type = 9,value = 165,job =1},
				        {type = 11,value = 550,job =1},
						{type = 5,value = 3300,job =1},

				        {type = 13,value = 165,job =2},
				        {type = 15,value = 550,job =2},
						{type = 5,value = 3300,job =2},

				        {type = 17,value = 165,job =3},
				        {type = 19,value = 550,job =3},
						{type = 5,value = 3300,job =3},

				    },
				},
--12级 
				{
					needJingHua = 400, 
					attr=
					{
				        {type = 9,value = 211,job =1},
				        {type = 11,value = 702,job =1},
						{type = 5,value = 4212,job =1},

				        {type = 13,value = 211,job =2},
				        {type = 15,value = 702,job =2},
						{type = 5,value = 4212,job =2},

				        {type = 17,value = 211,job =3},
				        {type = 19,value = 702,job =3},
						{type = 5,value = 4212,job =3},

				    },
				},
--13级 
				{
					needJingHua = 500, 
					attr=
					{
				        {type = 9,value = 265,job =1},
				        {type = 11,value = 882,job =1},
						{type = 5,value = 5292,job =1},

				        {type = 13,value = 265,job =2},
				        {type = 15,value = 882,job =2},
						{type = 5,value = 5292,job =2},

				        {type = 17,value = 265,job =3},
				        {type = 19,value = 882,job =3},
						{type = 5,value = 5292,job =3},

				    },
				},
--14级 
				{
					needJingHua = 600, 
					attr=
					{
				        {type = 9,value = 326,job =1},
				        {type = 11,value = 1086,job =1},
						{type = 5,value = 6516,job =1},

				        {type = 13,value = 326,job =2},
				        {type = 15,value = 1086,job =2},
						{type = 5,value = 6516,job =2},

				        {type = 17,value = 326,job =3},
				        {type = 19,value = 1086,job =3},
						{type = 5,value = 6516,job =3},

				    },
				},
--15级 
				{
					needJingHua = 700, 
					attr=
					{
				        {type = 9,value = 393,job =1},
				        {type = 11,value = 1310,job =1},
						{type = 5,value = 7860,job =1},

				        {type = 13,value = 393,job =2},
				        {type = 15,value = 1310,job =2},
						{type = 5,value = 7860,job =2},

				        {type = 17,value = 393,job =3},
				        {type = 19,value = 1310,job =3},
						{type = 5,value = 7860,job =3},

				    },
				},
--16级 
				{
					needJingHua = 800, 
					attr=
					{
				        {type = 9,value = 465,job =1},
				        {type = 11,value = 1550,job =1},
						{type = 5,value = 9300,job =1},

				        {type = 13,value = 465,job =2},
				        {type = 15,value = 1550,job =2},
						{type = 5,value = 9300,job =2},

				        {type = 17,value = 465,job =3},
				        {type = 19,value = 1550,job =3},
						{type = 5,value = 9300,job =3},

				    },
				},
--17级 
				{
					needJingHua = 900, 
					attr=
					{
				        {type = 9,value = 541,job =1},
				        {type = 11,value = 1802,job =1},
						{type = 5,value = 10812,job =1},

				        {type = 13,value = 541,job =2},
				        {type = 15,value = 1802,job =2},
						{type = 5,value = 10812,job =2},

				        {type = 17,value = 541,job =3},
				        {type = 19,value = 1802,job =3},
						{type = 5,value = 10812,job =3},

				    },
				},
--18级 
				{
					needJingHua = 1000, 
					attr=
					{
				        {type = 9,value = 619,job =1},
				        {type = 11,value = 2062,job =1},
						{type = 5,value = 12372,job =1},

				        {type = 13,value = 619,job =2},
				        {type = 15,value = 2062,job =2},
						{type = 5,value = 12372,job =2},

				        {type = 17,value = 619,job =3},
				        {type = 19,value = 2062,job =3},
						{type = 5,value = 12372,job =3},

				    },
				},
--19级 
				{
					needJingHua = 1100, 
					attr=
					{
				        {type = 9,value = 698,job =1},
				        {type = 11,value = 2326,job =1},
						{type = 5,value = 13956,job =1},

				        {type = 13,value = 698,job =2},
				        {type = 15,value = 2326,job =2},
						{type = 5,value = 13956,job =2},

				        {type = 17,value = 698,job =3},
				        {type = 19,value = 2326,job =3},
						{type = 5,value = 13956,job =3},

				    },
				},
--20级 
				{
					needJingHua = 1200, 
					attr=
					{
				        {type = 9,value = 777,job =1},
				        {type = 11,value = 2590,job =1},
						{type = 5,value = 15540,job =1},

				        {type = 13,value = 777,job =2},
				        {type = 15,value = 2590,job =2},
						{type = 5,value = 15540,job =2},

				        {type = 17,value = 777,job =3},
				        {type = 19,value = 2590,job =3},
						{type = 5,value = 15540,job =3},

				    },
				},
--21级 
				{
					needJingHua = 1300, 
					attr=
					{
				        {type = 9,value = 855,job =1},
				        {type = 11,value = 2850,job =1},
						{type = 5,value = 17100,job =1},

				        {type = 13,value = 855,job =2},
				        {type = 15,value = 2850,job =2},
						{type = 5,value = 17100,job =2},

				        {type = 17,value = 855,job =3},
				        {type = 19,value = 2850,job =3},
						{type = 5,value = 17100,job =3},

				    },
				},
--22级 
				{
					needJingHua = 1400, 
					attr=
					{
				        {type = 9,value = 931,job =1},
				        {type = 11,value = 3102,job =1},
						{type = 5,value = 18612,job =1},

				        {type = 13,value = 931,job =2},
				        {type = 15,value = 3102,job =2},
						{type = 5,value = 18612,job =2},

				        {type = 17,value = 931,job =3},
				        {type = 19,value = 3102,job =3},
						{type = 5,value = 18612,job =3},

				    },
				},
--23级 
				{
					needJingHua = 1500, 
					attr=
					{
				        {type = 9,value = 1003,job =1},
				        {type = 11,value = 3342,job =1},
						{type = 5,value = 20052,job =1},

				        {type = 13,value = 1003,job =2},
				        {type = 15,value = 3342,job =2},
						{type = 5,value = 20052,job =2},

				        {type = 17,value = 1003,job =3},
				        {type = 19,value = 3342,job =3},
						{type = 5,value = 20052,job =3},

				    },
				},
--24级 
				{
					needJingHua = 1600, 
					attr=
					{
				        {type = 9,value = 1070,job =1},
				        {type = 11,value = 3566,job =1},
						{type = 5,value = 21396,job =1},

				        {type = 13,value = 1070,job =2},
				        {type = 15,value = 3566,job =2},
						{type = 5,value = 21396,job =2},

				        {type = 17,value = 1070,job =3},
				        {type = 19,value = 3566,job =3},
						{type = 5,value = 21396,job =3},

				    },
				},
--25级 
				{
					needJingHua = 1700, 
					attr=
					{
				        {type = 9,value = 1131,job =1},
				        {type = 11,value = 3770,job =1},
						{type = 5,value = 22620,job =1},

				        {type = 13,value = 1131,job =2},
				        {type = 15,value = 3770,job =2},
						{type = 5,value = 22620,job =2},

				        {type = 17,value = 1131,job =3},
				        {type = 19,value = 3770,job =3},
						{type = 5,value = 22620,job =3},

				    },
				},
--26级 
				{
					needJingHua = 1800, 
					attr=
					{
				        {type = 9,value = 1185,job =1},
				        {type = 11,value = 3950,job =1},
						{type = 5,value = 23700,job =1},

				        {type = 13,value = 1185,job =2},
				        {type = 15,value = 3950,job =2},
						{type = 5,value = 23700,job =2},

				        {type = 17,value = 1185,job =3},
				        {type = 19,value = 3950,job =3},
						{type = 5,value = 23700,job =3},

				    },
				},
--27级 
				{
					needJingHua = 1900, 
					attr=
					{
				        {type = 9,value = 1231,job =1},
				        {type = 11,value = 4102,job =1},
						{type = 5,value = 24612,job =1},

				        {type = 13,value = 1231,job =2},
				        {type = 15,value = 4102,job =2},
						{type = 5,value = 24612,job =2},

				        {type = 17,value = 1231,job =3},
				        {type = 19,value = 4102,job =3},
						{type = 5,value = 24612,job =3},

				    },
				},
--28级 
				{
					needJingHua = 2000, 
					attr=
					{
				        {type = 9,value = 1273,job =1},
				        {type = 11,value = 4242,job =1},
						{type = 5,value = 25452,job =1},

				        {type = 13,value = 1273,job =2},
				        {type = 15,value = 4242,job =2},
						{type = 5,value = 25452,job =2},

				        {type = 17,value = 1273,job =3},
				        {type = 19,value = 4242,job =3},
						{type = 5,value = 25452,job =3},

				    },
				},
--29级 
				{
					needJingHua = 2100, 
					attr=
					{
				        {type = 9,value = 1310,job =1},
				        {type = 11,value = 4368,job =1},
						{type = 5,value = 26208,job =1},

				        {type = 13,value = 1310,job =2},
				        {type = 15,value = 4368,job =2},
						{type = 5,value = 26208,job =2},

				        {type = 17,value = 1310,job =3},
				        {type = 19,value = 4368,job =3},
						{type = 5,value = 26208,job =3},

				    },
				},
--30级 
				{
					needJingHua = 2200, 
					attr=
					{
				        {type = 9,value = 1350,job =1},
				        {type = 11,value = 4500,job =1},
						{type = 5,value = 27000,job =1},

				        {type = 13,value = 1350,job =2},
				        {type = 15,value = 4500,job =2},
						{type = 5,value = 27000,job =2},

				        {type = 17,value = 1350,job =3},
				        {type = 19,value = 4500,job =3},
						{type = 5,value = 27000,job =3},

				    },
				},
--31级 
				{
					needJingHua = 2300, 
					attr=
					{
				        {type = 9,value = 1391,job =1},
				        {type = 11,value = 4638,job =1},
						{type = 5,value = 27828,job =1},

				        {type = 13,value = 1391,job =2},
				        {type = 15,value = 4638,job =2},
						{type = 5,value = 27828,job =2},

				        {type = 17,value = 1391,job =3},
				        {type = 19,value = 4638,job =3},
						{type = 5,value = 27828,job =3},

				    },
				},
--32级 
				{
					needJingHua = 2400, 
					attr=
					{
				        {type = 9,value = 1435,job =1},
				        {type = 11,value = 4782,job =1},
						{type = 5,value = 28692,job =1},

				        {type = 13,value = 1435,job =2},
				        {type = 15,value = 4782,job =2},
						{type = 5,value = 28692,job =2},

				        {type = 17,value = 1435,job =3},
				        {type = 19,value = 4782,job =3},
						{type = 5,value = 28692,job =3},

				    },
				},
--33级 
				{
					needJingHua = 2500, 
					attr=
					{
				        {type = 9,value = 1480,job =1},
				        {type = 11,value = 4932,job =1},
						{type = 5,value = 29592,job =1},

				        {type = 13,value = 1480,job =2},
				        {type = 15,value = 4932,job =2},
						{type = 5,value = 29592,job =2},

				        {type = 17,value = 1480,job =3},
				        {type = 19,value = 4932,job =3},
						{type = 5,value = 29592,job =3},

				    },
				},
--34级 
				{
					needJingHua = 2600, 
					attr=
					{
				        {type = 9,value = 1526,job =1},
				        {type = 11,value = 5088,job =1},
						{type = 5,value = 30528,job =1},

				        {type = 13,value = 1526,job =2},
				        {type = 15,value = 5088,job =2},
						{type = 5,value = 30528,job =2},

				        {type = 17,value = 1526,job =3},
				        {type = 19,value = 5088,job =3},
						{type = 5,value = 30528,job =3},

				    },
				},
--35级 
				{
					needJingHua = 2700, 
					attr=
					{
				        {type = 9,value = 1575,job =1},
				        {type = 11,value = 5250,job =1},
						{type = 5,value = 31500,job =1},

				        {type = 13,value = 1575,job =2},
				        {type = 15,value = 5250,job =2},
						{type = 5,value = 31500,job =2},

				        {type = 17,value = 1575,job =3},
				        {type = 19,value = 5250,job =3},
						{type = 5,value = 31500,job =3},

				    },
				},
--36级 
				{
					needJingHua = 2800, 
					attr=
					{
				        {type = 9,value = 1625,job =1},
				        {type = 11,value = 5418,job =1},
						{type = 5,value = 32508,job =1},

				        {type = 13,value = 1625,job =2},
				        {type = 15,value = 5418,job =2},
						{type = 5,value = 32508,job =2},

				        {type = 17,value = 1625,job =3},
				        {type = 19,value = 5418,job =3},
						{type = 5,value = 32508,job =3},

				    },
				},
--37级 
				{
					needJingHua = 2900, 
					attr=
					{
				        {type = 9,value = 1678,job =1},
				        {type = 11,value = 5592,job =1},
						{type = 5,value = 33552,job =1},

				        {type = 13,value = 1678,job =2},
				        {type = 15,value = 5592,job =2},
						{type = 5,value = 33552,job =2},

				        {type = 17,value = 1678,job =3},
				        {type = 19,value = 5592,job =3},
						{type = 5,value = 33552,job =3},

				    },
				},
--38级 
				{
					needJingHua = 3000, 
					attr=
					{
				        {type = 9,value = 1732,job =1},
				        {type = 11,value = 5772,job =1},
						{type = 5,value = 34632,job =1},

				        {type = 13,value = 1732,job =2},
				        {type = 15,value = 5772,job =2},
						{type = 5,value = 34632,job =2},

				        {type = 17,value = 1732,job =3},
				        {type = 19,value = 5772,job =3},
						{type = 5,value = 34632,job =3},

				    },
				},
--39级 
				{
					needJingHua = 3100, 
					attr=
					{
				        {type = 9,value = 1787,job =1},
				        {type = 11,value = 5958,job =1},
						{type = 5,value = 35748,job =1},

				        {type = 13,value = 1787,job =2},
				        {type = 15,value = 5958,job =2},
						{type = 5,value = 35748,job =2},

				        {type = 17,value = 1787,job =3},
				        {type = 19,value = 5958,job =3},
						{type = 5,value = 35748,job =3},

				    },
				},
--40级 
				{
					needJingHua = 3200, 
					attr=
					{
				        {type = 9,value = 1845,job =1},
				        {type = 11,value = 6150,job =1},
						{type = 5,value = 36900,job =1},

				        {type = 13,value = 1845,job =2},
				        {type = 15,value = 6150,job =2},
						{type = 5,value = 36900,job =2},

				        {type = 17,value = 1845,job =3},
				        {type = 19,value = 6150,job =3},
						{type = 5,value = 36900,job =3},

				    },
				},
--41级 
				{
					needJingHua = 3300, 
					attr=
					{
				        {type = 9,value = 1904,job =1},
				        {type = 11,value = 6348,job =1},
						{type = 5,value = 38088,job =1},

				        {type = 13,value = 1904,job =2},
				        {type = 15,value = 6348,job =2},
						{type = 5,value = 38088,job =2},

				        {type = 17,value = 1904,job =3},
				        {type = 19,value = 6348,job =3},
						{type = 5,value = 38088,job =3},

				    },
				},
--42级 
				{
					needJingHua = 3400, 
					attr=
					{
				        {type = 9,value = 1966,job =1},
				        {type = 11,value = 6552,job =1},
						{type = 5,value = 39312,job =1},

				        {type = 13,value = 1966,job =2},
				        {type = 15,value = 6552,job =2},
						{type = 5,value = 39312,job =2},

				        {type = 17,value = 1966,job =3},
				        {type = 19,value = 6552,job =3},
						{type = 5,value = 39312,job =3},

				    },
				},
--43级 
				{
					needJingHua = 3500, 
					attr=
					{
				        {type = 9,value = 2029,job =1},
				        {type = 11,value = 6762,job =1},
						{type = 5,value = 40572,job =1},

				        {type = 13,value = 2029,job =2},
				        {type = 15,value = 6762,job =2},
						{type = 5,value = 40572,job =2},

				        {type = 17,value = 2029,job =3},
				        {type = 19,value = 6762,job =3},
						{type = 5,value = 40572,job =3},

				    },
				},
--44级 
				{
					needJingHua = 3600, 
					attr=
					{
				        {type = 9,value = 2093,job =1},
				        {type = 11,value = 6978,job =1},
						{type = 5,value = 41868,job =1},

				        {type = 13,value = 2093,job =2},
				        {type = 15,value = 6978,job =2},
						{type = 5,value = 41868,job =2},

				        {type = 17,value = 2093,job =3},
				        {type = 19,value = 6978,job =3},
						{type = 5,value = 41868,job =3},

				    },
				},
--45级 
				{
					needJingHua = 3700, 
					attr=
					{
				        {type = 9,value = 2160,job =1},
				        {type = 11,value = 7200,job =1},
						{type = 5,value = 43200,job =1},

				        {type = 13,value = 2160,job =2},
				        {type = 15,value = 7200,job =2},
						{type = 5,value = 43200,job =2},

				        {type = 17,value = 2160,job =3},
				        {type = 19,value = 7200,job =3},
						{type = 5,value = 43200,job =3},

				    },
				},
--46级 
				{
					needJingHua = 3800, 
					attr=
					{
				        {type = 9,value = 2228,job =1},
				        {type = 11,value = 7428,job =1},
						{type = 5,value = 44568,job =1},

				        {type = 13,value = 2228,job =2},
				        {type = 15,value = 7428,job =2},
						{type = 5,value = 44568,job =2},

				        {type = 17,value = 2228,job =3},
				        {type = 19,value = 7428,job =3},
						{type = 5,value = 44568,job =3},

				    },
				},
--47级 
				{
					needJingHua = 3900, 
					attr=
					{
				        {type = 9,value = 2299,job =1},
				        {type = 11,value = 7662,job =1},
						{type = 5,value = 45972,job =1},

				        {type = 13,value = 2299,job =2},
				        {type = 15,value = 7662,job =2},
						{type = 5,value = 45972,job =2},

				        {type = 17,value = 2299,job =3},
				        {type = 19,value = 7662,job =3},
						{type = 5,value = 45972,job =3},

				    },
				},
--48级 
				{
					needJingHua = 4000, 
					attr=
					{
				        {type = 9,value = 2371,job =1},
				        {type = 11,value = 7902,job =1},
						{type = 5,value = 47412,job =1},

				        {type = 13,value = 2371,job =2},
				        {type = 15,value = 7902,job =2},
						{type = 5,value = 47412,job =2},

				        {type = 17,value = 2371,job =3},
				        {type = 19,value = 7902,job =3},
						{type = 5,value = 47412,job =3},

				    },
				},
--49级 
				{
					needJingHua = 4100, 
					attr=
					{
				        {type = 9,value = 2444,job =1},
				        {type = 11,value = 8148,job =1},
						{type = 5,value = 48888,job =1},

				        {type = 13,value = 2444,job =2},
				        {type = 15,value = 8148,job =2},
						{type = 5,value = 48888,job =2},

				        {type = 17,value = 2444,job =3},
				        {type = 19,value = 8148,job =3},
						{type = 5,value = 48888,job =3},

				    },
				},
--50级 
				{
					needJingHua = 4200, 
					attr=
					{
				        {type = 9,value = 2520,job =1},
				        {type = 11,value = 8400,job =1},
						{type = 5,value = 50400,job =1},

				        {type = 13,value = 2520,job =2},
				        {type = 15,value = 8400,job =2},
						{type = 5,value = 50400,job =2},

				        {type = 17,value = 2520,job =3},
				        {type = 19,value = 8400,job =3},
						{type = 5,value = 50400,job =3},

				    },
				},

	
			
			
			},
		},
	
		{	
			position = 5,
			name = "左手镯",
			level=
			{
	--1级 
				{
					needJingHua = 30, 
					attr=
					{
				        {type = 9,value = 5,job =1},
				        {type = 11,value = 18,job =1},
						{type = 5,value = 108,job =1},

				        {type = 13,value = 5,job =2},
				        {type = 15,value = 18,job =2},
						{type = 5,value = 108,job =2},

				        {type = 17,value = 5,job =3},
				        {type = 19,value = 18,job =3},
						{type = 5,value = 108,job =3},

				    },
				},
--2级 
				{
					needJingHua = 40, 
					attr=
					{
				        {type = 9,value = 12,job =1},
				        {type = 11,value = 41,job =1},
						{type = 5,value = 246,job =1},

				        {type = 13,value = 12,job =2},
				        {type = 15,value = 41,job =2},
						{type = 5,value = 246,job =2},

				        {type = 17,value = 12,job =3},
				        {type = 19,value = 41,job =3},
						{type = 5,value = 246,job =3},

				    },
				},
--3级 
				{
					needJingHua = 50, 
					attr=
					{
				        {type = 9,value = 21,job =1},
				        {type = 11,value = 69,job =1},
						{type = 5,value = 414,job =1},

				        {type = 13,value = 21,job =2},
				        {type = 15,value = 69,job =2},
						{type = 5,value = 414,job =2},

				        {type = 17,value = 21,job =3},
				        {type = 19,value = 69,job =3},
						{type = 5,value = 414,job =3},

				    },
				},
--4级 
				{
					needJingHua = 60, 
					attr=
					{
				        {type = 9,value = 30,job =1},
				        {type = 11,value = 101,job =1},
						{type = 5,value = 606,job =1},

				        {type = 13,value = 30,job =2},
				        {type = 15,value = 101,job =2},
						{type = 5,value = 606,job =2},

				        {type = 17,value = 30,job =3},
				        {type = 19,value = 101,job =3},
						{type = 5,value = 606,job =3},

				    },
				},
--5级 
				{
					needJingHua = 70, 
					attr=
					{
				        {type = 9,value = 41,job =1},
				        {type = 11,value = 137,job =1},
						{type = 5,value = 822,job =1},

				        {type = 13,value = 41,job =2},
				        {type = 15,value = 137,job =2},
						{type = 5,value = 822,job =2},

				        {type = 17,value = 41,job =3},
				        {type = 19,value = 137,job =3},
						{type = 5,value = 822,job =3},

				    },
				},
--6级 
				{
					needJingHua = 80, 
					attr=
					{
				        {type = 9,value = 53,job =1},
				        {type = 11,value = 177,job =1},
						{type = 5,value = 1062,job =1},

				        {type = 13,value = 53,job =2},
				        {type = 15,value = 177,job =2},
						{type = 5,value = 1062,job =2},

				        {type = 17,value = 53,job =3},
				        {type = 19,value = 177,job =3},
						{type = 5,value = 1062,job =3},

				    },
				},
--7级 
				{
					needJingHua = 100, 
					attr=
					{
				        {type = 9,value = 68,job =1},
				        {type = 11,value = 225,job =1},
						{type = 5,value = 1350,job =1},

				        {type = 13,value = 68,job =2},
				        {type = 15,value = 225,job =2},
						{type = 5,value = 1350,job =2},

				        {type = 17,value = 68,job =3},
				        {type = 19,value = 225,job =3},
						{type = 5,value = 1350,job =3},

				    },
				},
--8级 
				{
					needJingHua = 120, 
					attr=
					{
				        {type = 9,value = 84,job =1},
				        {type = 11,value = 280,job =1},
						{type = 5,value = 1680,job =1},

				        {type = 13,value = 84,job =2},
				        {type = 15,value = 280,job =2},
						{type = 5,value = 1680,job =2},

				        {type = 17,value = 84,job =3},
				        {type = 19,value = 280,job =3},
						{type = 5,value = 1680,job =3},

				    },
				},
--9级 
				{
					needJingHua = 150, 
					attr=
					{
				        {type = 9,value = 104,job =1},
				        {type = 11,value = 346,job =1},
						{type = 5,value = 2076,job =1},

				        {type = 13,value = 104,job =2},
				        {type = 15,value = 346,job =2},
						{type = 5,value = 2076,job =2},

				        {type = 17,value = 104,job =3},
				        {type = 19,value = 346,job =3},
						{type = 5,value = 2076,job =3},

				    },
				},
--10级 
				{
					needJingHua = 200, 
					attr=
					{
				        {type = 9,value = 129,job =1},
				        {type = 11,value = 430,job =1},
						{type = 5,value = 2580,job =1},

				        {type = 13,value = 129,job =2},
				        {type = 15,value = 430,job =2},
						{type = 5,value = 2580,job =2},

				        {type = 17,value = 129,job =3},
				        {type = 19,value = 430,job =3},
						{type = 5,value = 2580,job =3},

				    },
				},
--11级 
				{
					needJingHua = 300, 
					attr=
					{
				        {type = 9,value = 165,job =1},
				        {type = 11,value = 550,job =1},
						{type = 5,value = 3300,job =1},

				        {type = 13,value = 165,job =2},
				        {type = 15,value = 550,job =2},
						{type = 5,value = 3300,job =2},

				        {type = 17,value = 165,job =3},
				        {type = 19,value = 550,job =3},
						{type = 5,value = 3300,job =3},

				    },
				},
--12级 
				{
					needJingHua = 400, 
					attr=
					{
				        {type = 9,value = 211,job =1},
				        {type = 11,value = 702,job =1},
						{type = 5,value = 4212,job =1},

				        {type = 13,value = 211,job =2},
				        {type = 15,value = 702,job =2},
						{type = 5,value = 4212,job =2},

				        {type = 17,value = 211,job =3},
				        {type = 19,value = 702,job =3},
						{type = 5,value = 4212,job =3},

				    },
				},
--13级 
				{
					needJingHua = 500, 
					attr=
					{
				        {type = 9,value = 265,job =1},
				        {type = 11,value = 882,job =1},
						{type = 5,value = 5292,job =1},

				        {type = 13,value = 265,job =2},
				        {type = 15,value = 882,job =2},
						{type = 5,value = 5292,job =2},

				        {type = 17,value = 265,job =3},
				        {type = 19,value = 882,job =3},
						{type = 5,value = 5292,job =3},

				    },
				},
--14级 
				{
					needJingHua = 600, 
					attr=
					{
				        {type = 9,value = 326,job =1},
				        {type = 11,value = 1086,job =1},
						{type = 5,value = 6516,job =1},

				        {type = 13,value = 326,job =2},
				        {type = 15,value = 1086,job =2},
						{type = 5,value = 6516,job =2},

				        {type = 17,value = 326,job =3},
				        {type = 19,value = 1086,job =3},
						{type = 5,value = 6516,job =3},

				    },
				},
--15级 
				{
					needJingHua = 700, 
					attr=
					{
				        {type = 9,value = 393,job =1},
				        {type = 11,value = 1310,job =1},
						{type = 5,value = 7860,job =1},

				        {type = 13,value = 393,job =2},
				        {type = 15,value = 1310,job =2},
						{type = 5,value = 7860,job =2},

				        {type = 17,value = 393,job =3},
				        {type = 19,value = 1310,job =3},
						{type = 5,value = 7860,job =3},

				    },
				},
--16级 
				{
					needJingHua = 800, 
					attr=
					{
				        {type = 9,value = 465,job =1},
				        {type = 11,value = 1550,job =1},
						{type = 5,value = 9300,job =1},

				        {type = 13,value = 465,job =2},
				        {type = 15,value = 1550,job =2},
						{type = 5,value = 9300,job =2},

				        {type = 17,value = 465,job =3},
				        {type = 19,value = 1550,job =3},
						{type = 5,value = 9300,job =3},

				    },
				},
--17级 
				{
					needJingHua = 900, 
					attr=
					{
				        {type = 9,value = 541,job =1},
				        {type = 11,value = 1802,job =1},
						{type = 5,value = 10812,job =1},

				        {type = 13,value = 541,job =2},
				        {type = 15,value = 1802,job =2},
						{type = 5,value = 10812,job =2},

				        {type = 17,value = 541,job =3},
				        {type = 19,value = 1802,job =3},
						{type = 5,value = 10812,job =3},

				    },
				},
--18级 
				{
					needJingHua = 1000, 
					attr=
					{
				        {type = 9,value = 619,job =1},
				        {type = 11,value = 2062,job =1},
						{type = 5,value = 12372,job =1},

				        {type = 13,value = 619,job =2},
				        {type = 15,value = 2062,job =2},
						{type = 5,value = 12372,job =2},

				        {type = 17,value = 619,job =3},
				        {type = 19,value = 2062,job =3},
						{type = 5,value = 12372,job =3},

				    },
				},
--19级 
				{
					needJingHua = 1100, 
					attr=
					{
				        {type = 9,value = 698,job =1},
				        {type = 11,value = 2326,job =1},
						{type = 5,value = 13956,job =1},

				        {type = 13,value = 698,job =2},
				        {type = 15,value = 2326,job =2},
						{type = 5,value = 13956,job =2},

				        {type = 17,value = 698,job =3},
				        {type = 19,value = 2326,job =3},
						{type = 5,value = 13956,job =3},

				    },
				},
--20级 
				{
					needJingHua = 1200, 
					attr=
					{
				        {type = 9,value = 777,job =1},
				        {type = 11,value = 2590,job =1},
						{type = 5,value = 15540,job =1},

				        {type = 13,value = 777,job =2},
				        {type = 15,value = 2590,job =2},
						{type = 5,value = 15540,job =2},

				        {type = 17,value = 777,job =3},
				        {type = 19,value = 2590,job =3},
						{type = 5,value = 15540,job =3},

				    },
				},
--21级 
				{
					needJingHua = 1300, 
					attr=
					{
				        {type = 9,value = 855,job =1},
				        {type = 11,value = 2850,job =1},
						{type = 5,value = 17100,job =1},

				        {type = 13,value = 855,job =2},
				        {type = 15,value = 2850,job =2},
						{type = 5,value = 17100,job =2},

				        {type = 17,value = 855,job =3},
				        {type = 19,value = 2850,job =3},
						{type = 5,value = 17100,job =3},

				    },
				},
--22级 
				{
					needJingHua = 1400, 
					attr=
					{
				        {type = 9,value = 931,job =1},
				        {type = 11,value = 3102,job =1},
						{type = 5,value = 18612,job =1},

				        {type = 13,value = 931,job =2},
				        {type = 15,value = 3102,job =2},
						{type = 5,value = 18612,job =2},

				        {type = 17,value = 931,job =3},
				        {type = 19,value = 3102,job =3},
						{type = 5,value = 18612,job =3},

				    },
				},
--23级 
				{
					needJingHua = 1500, 
					attr=
					{
				        {type = 9,value = 1003,job =1},
				        {type = 11,value = 3342,job =1},
						{type = 5,value = 20052,job =1},

				        {type = 13,value = 1003,job =2},
				        {type = 15,value = 3342,job =2},
						{type = 5,value = 20052,job =2},

				        {type = 17,value = 1003,job =3},
				        {type = 19,value = 3342,job =3},
						{type = 5,value = 20052,job =3},

				    },
				},
--24级 
				{
					needJingHua = 1600, 
					attr=
					{
				        {type = 9,value = 1070,job =1},
				        {type = 11,value = 3566,job =1},
						{type = 5,value = 21396,job =1},

				        {type = 13,value = 1070,job =2},
				        {type = 15,value = 3566,job =2},
						{type = 5,value = 21396,job =2},

				        {type = 17,value = 1070,job =3},
				        {type = 19,value = 3566,job =3},
						{type = 5,value = 21396,job =3},

				    },
				},
--25级 
				{
					needJingHua = 1700, 
					attr=
					{
				        {type = 9,value = 1131,job =1},
				        {type = 11,value = 3770,job =1},
						{type = 5,value = 22620,job =1},

				        {type = 13,value = 1131,job =2},
				        {type = 15,value = 3770,job =2},
						{type = 5,value = 22620,job =2},

				        {type = 17,value = 1131,job =3},
				        {type = 19,value = 3770,job =3},
						{type = 5,value = 22620,job =3},

				    },
				},
--26级 
				{
					needJingHua = 1800, 
					attr=
					{
				        {type = 9,value = 1185,job =1},
				        {type = 11,value = 3950,job =1},
						{type = 5,value = 23700,job =1},

				        {type = 13,value = 1185,job =2},
				        {type = 15,value = 3950,job =2},
						{type = 5,value = 23700,job =2},

				        {type = 17,value = 1185,job =3},
				        {type = 19,value = 3950,job =3},
						{type = 5,value = 23700,job =3},

				    },
				},
--27级 
				{
					needJingHua = 1900, 
					attr=
					{
				        {type = 9,value = 1231,job =1},
				        {type = 11,value = 4102,job =1},
						{type = 5,value = 24612,job =1},

				        {type = 13,value = 1231,job =2},
				        {type = 15,value = 4102,job =2},
						{type = 5,value = 24612,job =2},

				        {type = 17,value = 1231,job =3},
				        {type = 19,value = 4102,job =3},
						{type = 5,value = 24612,job =3},

				    },
				},
--28级 
				{
					needJingHua = 2000, 
					attr=
					{
				        {type = 9,value = 1273,job =1},
				        {type = 11,value = 4242,job =1},
						{type = 5,value = 25452,job =1},

				        {type = 13,value = 1273,job =2},
				        {type = 15,value = 4242,job =2},
						{type = 5,value = 25452,job =2},

				        {type = 17,value = 1273,job =3},
				        {type = 19,value = 4242,job =3},
						{type = 5,value = 25452,job =3},

				    },
				},
--29级 
				{
					needJingHua = 2100, 
					attr=
					{
				        {type = 9,value = 1310,job =1},
				        {type = 11,value = 4368,job =1},
						{type = 5,value = 26208,job =1},

				        {type = 13,value = 1310,job =2},
				        {type = 15,value = 4368,job =2},
						{type = 5,value = 26208,job =2},

				        {type = 17,value = 1310,job =3},
				        {type = 19,value = 4368,job =3},
						{type = 5,value = 26208,job =3},

				    },
				},
--30级 
				{
					needJingHua = 2200, 
					attr=
					{
				        {type = 9,value = 1350,job =1},
				        {type = 11,value = 4500,job =1},
						{type = 5,value = 27000,job =1},

				        {type = 13,value = 1350,job =2},
				        {type = 15,value = 4500,job =2},
						{type = 5,value = 27000,job =2},

				        {type = 17,value = 1350,job =3},
				        {type = 19,value = 4500,job =3},
						{type = 5,value = 27000,job =3},

				    },
				},
--31级 
				{
					needJingHua = 2300, 
					attr=
					{
				        {type = 9,value = 1391,job =1},
				        {type = 11,value = 4638,job =1},
						{type = 5,value = 27828,job =1},

				        {type = 13,value = 1391,job =2},
				        {type = 15,value = 4638,job =2},
						{type = 5,value = 27828,job =2},

				        {type = 17,value = 1391,job =3},
				        {type = 19,value = 4638,job =3},
						{type = 5,value = 27828,job =3},

				    },
				},
--32级 
				{
					needJingHua = 2400, 
					attr=
					{
				        {type = 9,value = 1435,job =1},
				        {type = 11,value = 4782,job =1},
						{type = 5,value = 28692,job =1},

				        {type = 13,value = 1435,job =2},
				        {type = 15,value = 4782,job =2},
						{type = 5,value = 28692,job =2},

				        {type = 17,value = 1435,job =3},
				        {type = 19,value = 4782,job =3},
						{type = 5,value = 28692,job =3},

				    },
				},
--33级 
				{
					needJingHua = 2500, 
					attr=
					{
				        {type = 9,value = 1480,job =1},
				        {type = 11,value = 4932,job =1},
						{type = 5,value = 29592,job =1},

				        {type = 13,value = 1480,job =2},
				        {type = 15,value = 4932,job =2},
						{type = 5,value = 29592,job =2},

				        {type = 17,value = 1480,job =3},
				        {type = 19,value = 4932,job =3},
						{type = 5,value = 29592,job =3},

				    },
				},
--34级 
				{
					needJingHua = 2600, 
					attr=
					{
				        {type = 9,value = 1526,job =1},
				        {type = 11,value = 5088,job =1},
						{type = 5,value = 30528,job =1},

				        {type = 13,value = 1526,job =2},
				        {type = 15,value = 5088,job =2},
						{type = 5,value = 30528,job =2},

				        {type = 17,value = 1526,job =3},
				        {type = 19,value = 5088,job =3},
						{type = 5,value = 30528,job =3},

				    },
				},
--35级 
				{
					needJingHua = 2700, 
					attr=
					{
				        {type = 9,value = 1575,job =1},
				        {type = 11,value = 5250,job =1},
						{type = 5,value = 31500,job =1},

				        {type = 13,value = 1575,job =2},
				        {type = 15,value = 5250,job =2},
						{type = 5,value = 31500,job =2},

				        {type = 17,value = 1575,job =3},
				        {type = 19,value = 5250,job =3},
						{type = 5,value = 31500,job =3},

				    },
				},
--36级 
				{
					needJingHua = 2800, 
					attr=
					{
				        {type = 9,value = 1625,job =1},
				        {type = 11,value = 5418,job =1},
						{type = 5,value = 32508,job =1},

				        {type = 13,value = 1625,job =2},
				        {type = 15,value = 5418,job =2},
						{type = 5,value = 32508,job =2},

				        {type = 17,value = 1625,job =3},
				        {type = 19,value = 5418,job =3},
						{type = 5,value = 32508,job =3},

				    },
				},
--37级 
				{
					needJingHua = 2900, 
					attr=
					{
				        {type = 9,value = 1678,job =1},
				        {type = 11,value = 5592,job =1},
						{type = 5,value = 33552,job =1},

				        {type = 13,value = 1678,job =2},
				        {type = 15,value = 5592,job =2},
						{type = 5,value = 33552,job =2},

				        {type = 17,value = 1678,job =3},
				        {type = 19,value = 5592,job =3},
						{type = 5,value = 33552,job =3},

				    },
				},
--38级 
				{
					needJingHua = 3000, 
					attr=
					{
				        {type = 9,value = 1732,job =1},
				        {type = 11,value = 5772,job =1},
						{type = 5,value = 34632,job =1},

				        {type = 13,value = 1732,job =2},
				        {type = 15,value = 5772,job =2},
						{type = 5,value = 34632,job =2},

				        {type = 17,value = 1732,job =3},
				        {type = 19,value = 5772,job =3},
						{type = 5,value = 34632,job =3},

				    },
				},
--39级 
				{
					needJingHua = 3100, 
					attr=
					{
				        {type = 9,value = 1787,job =1},
				        {type = 11,value = 5958,job =1},
						{type = 5,value = 35748,job =1},

				        {type = 13,value = 1787,job =2},
				        {type = 15,value = 5958,job =2},
						{type = 5,value = 35748,job =2},

				        {type = 17,value = 1787,job =3},
				        {type = 19,value = 5958,job =3},
						{type = 5,value = 35748,job =3},

				    },
				},
--40级 
				{
					needJingHua = 3200, 
					attr=
					{
				        {type = 9,value = 1845,job =1},
				        {type = 11,value = 6150,job =1},
						{type = 5,value = 36900,job =1},

				        {type = 13,value = 1845,job =2},
				        {type = 15,value = 6150,job =2},
						{type = 5,value = 36900,job =2},

				        {type = 17,value = 1845,job =3},
				        {type = 19,value = 6150,job =3},
						{type = 5,value = 36900,job =3},

				    },
				},
--41级 
				{
					needJingHua = 3300, 
					attr=
					{
				        {type = 9,value = 1904,job =1},
				        {type = 11,value = 6348,job =1},
						{type = 5,value = 38088,job =1},

				        {type = 13,value = 1904,job =2},
				        {type = 15,value = 6348,job =2},
						{type = 5,value = 38088,job =2},

				        {type = 17,value = 1904,job =3},
				        {type = 19,value = 6348,job =3},
						{type = 5,value = 38088,job =3},

				    },
				},
--42级 
				{
					needJingHua = 3400, 
					attr=
					{
				        {type = 9,value = 1966,job =1},
				        {type = 11,value = 6552,job =1},
						{type = 5,value = 39312,job =1},

				        {type = 13,value = 1966,job =2},
				        {type = 15,value = 6552,job =2},
						{type = 5,value = 39312,job =2},

				        {type = 17,value = 1966,job =3},
				        {type = 19,value = 6552,job =3},
						{type = 5,value = 39312,job =3},

				    },
				},
--43级 
				{
					needJingHua = 3500, 
					attr=
					{
				        {type = 9,value = 2029,job =1},
				        {type = 11,value = 6762,job =1},
						{type = 5,value = 40572,job =1},

				        {type = 13,value = 2029,job =2},
				        {type = 15,value = 6762,job =2},
						{type = 5,value = 40572,job =2},

				        {type = 17,value = 2029,job =3},
				        {type = 19,value = 6762,job =3},
						{type = 5,value = 40572,job =3},

				    },
				},
--44级 
				{
					needJingHua = 3600, 
					attr=
					{
				        {type = 9,value = 2093,job =1},
				        {type = 11,value = 6978,job =1},
						{type = 5,value = 41868,job =1},

				        {type = 13,value = 2093,job =2},
				        {type = 15,value = 6978,job =2},
						{type = 5,value = 41868,job =2},

				        {type = 17,value = 2093,job =3},
				        {type = 19,value = 6978,job =3},
						{type = 5,value = 41868,job =3},

				    },
				},
--45级 
				{
					needJingHua = 3700, 
					attr=
					{
				        {type = 9,value = 2160,job =1},
				        {type = 11,value = 7200,job =1},
						{type = 5,value = 43200,job =1},

				        {type = 13,value = 2160,job =2},
				        {type = 15,value = 7200,job =2},
						{type = 5,value = 43200,job =2},

				        {type = 17,value = 2160,job =3},
				        {type = 19,value = 7200,job =3},
						{type = 5,value = 43200,job =3},

				    },
				},
--46级 
				{
					needJingHua = 3800, 
					attr=
					{
				        {type = 9,value = 2228,job =1},
				        {type = 11,value = 7428,job =1},
						{type = 5,value = 44568,job =1},

				        {type = 13,value = 2228,job =2},
				        {type = 15,value = 7428,job =2},
						{type = 5,value = 44568,job =2},

				        {type = 17,value = 2228,job =3},
				        {type = 19,value = 7428,job =3},
						{type = 5,value = 44568,job =3},

				    },
				},
--47级 
				{
					needJingHua = 3900, 
					attr=
					{
				        {type = 9,value = 2299,job =1},
				        {type = 11,value = 7662,job =1},
						{type = 5,value = 45972,job =1},

				        {type = 13,value = 2299,job =2},
				        {type = 15,value = 7662,job =2},
						{type = 5,value = 45972,job =2},

				        {type = 17,value = 2299,job =3},
				        {type = 19,value = 7662,job =3},
						{type = 5,value = 45972,job =3},

				    },
				},
--48级 
				{
					needJingHua = 4000, 
					attr=
					{
				        {type = 9,value = 2371,job =1},
				        {type = 11,value = 7902,job =1},
						{type = 5,value = 47412,job =1},

				        {type = 13,value = 2371,job =2},
				        {type = 15,value = 7902,job =2},
						{type = 5,value = 47412,job =2},

				        {type = 17,value = 2371,job =3},
				        {type = 19,value = 7902,job =3},
						{type = 5,value = 47412,job =3},

				    },
				},
--49级 
				{
					needJingHua = 4100, 
					attr=
					{
				        {type = 9,value = 2444,job =1},
				        {type = 11,value = 8148,job =1},
						{type = 5,value = 48888,job =1},

				        {type = 13,value = 2444,job =2},
				        {type = 15,value = 8148,job =2},
						{type = 5,value = 48888,job =2},

				        {type = 17,value = 2444,job =3},
				        {type = 19,value = 8148,job =3},
						{type = 5,value = 48888,job =3},

				    },
				},
--50级 
				{
					needJingHua = 4200, 
					attr=
					{
				        {type = 9,value = 2520,job =1},
				        {type = 11,value = 8400,job =1},
						{type = 5,value = 50400,job =1},

				        {type = 13,value = 2520,job =2},
				        {type = 15,value = 8400,job =2},
						{type = 5,value = 50400,job =2},

				        {type = 17,value = 2520,job =3},
				        {type = 19,value = 8400,job =3},
						{type = 5,value = 50400,job =3},

				    },
				},

	
			
			},
		},
	
	
		{	
			position = 6,
			name = "右手镯",
			level=
			{
	--1级 
				{
					needJingHua = 30, 
					attr=
					{
				        {type = 9,value = 5,job =1},
				        {type = 11,value = 18,job =1},
						{type = 5,value = 108,job =1},

				        {type = 13,value = 5,job =2},
				        {type = 15,value = 18,job =2},
						{type = 5,value = 108,job =2},

				        {type = 17,value = 5,job =3},
				        {type = 19,value = 18,job =3},
						{type = 5,value = 108,job =3},

				    },
				},
--2级 
				{
					needJingHua = 40, 
					attr=
					{
				        {type = 9,value = 12,job =1},
				        {type = 11,value = 41,job =1},
						{type = 5,value = 246,job =1},

				        {type = 13,value = 12,job =2},
				        {type = 15,value = 41,job =2},
						{type = 5,value = 246,job =2},

				        {type = 17,value = 12,job =3},
				        {type = 19,value = 41,job =3},
						{type = 5,value = 246,job =3},

				    },
				},
--3级 
				{
					needJingHua = 50, 
					attr=
					{
				        {type = 9,value = 21,job =1},
				        {type = 11,value = 69,job =1},
						{type = 5,value = 414,job =1},

				        {type = 13,value = 21,job =2},
				        {type = 15,value = 69,job =2},
						{type = 5,value = 414,job =2},

				        {type = 17,value = 21,job =3},
				        {type = 19,value = 69,job =3},
						{type = 5,value = 414,job =3},

				    },
				},
--4级 
				{
					needJingHua = 60, 
					attr=
					{
				        {type = 9,value = 30,job =1},
				        {type = 11,value = 101,job =1},
						{type = 5,value = 606,job =1},

				        {type = 13,value = 30,job =2},
				        {type = 15,value = 101,job =2},
						{type = 5,value = 606,job =2},

				        {type = 17,value = 30,job =3},
				        {type = 19,value = 101,job =3},
						{type = 5,value = 606,job =3},

				    },
				},
--5级 
				{
					needJingHua = 70, 
					attr=
					{
				        {type = 9,value = 41,job =1},
				        {type = 11,value = 137,job =1},
						{type = 5,value = 822,job =1},

				        {type = 13,value = 41,job =2},
				        {type = 15,value = 137,job =2},
						{type = 5,value = 822,job =2},

				        {type = 17,value = 41,job =3},
				        {type = 19,value = 137,job =3},
						{type = 5,value = 822,job =3},

				    },
				},
--6级 
				{
					needJingHua = 80, 
					attr=
					{
				        {type = 9,value = 53,job =1},
				        {type = 11,value = 177,job =1},
						{type = 5,value = 1062,job =1},

				        {type = 13,value = 53,job =2},
				        {type = 15,value = 177,job =2},
						{type = 5,value = 1062,job =2},

				        {type = 17,value = 53,job =3},
				        {type = 19,value = 177,job =3},
						{type = 5,value = 1062,job =3},

				    },
				},
--7级 
				{
					needJingHua = 100, 
					attr=
					{
				        {type = 9,value = 68,job =1},
				        {type = 11,value = 225,job =1},
						{type = 5,value = 1350,job =1},

				        {type = 13,value = 68,job =2},
				        {type = 15,value = 225,job =2},
						{type = 5,value = 1350,job =2},

				        {type = 17,value = 68,job =3},
				        {type = 19,value = 225,job =3},
						{type = 5,value = 1350,job =3},

				    },
				},
--8级 
				{
					needJingHua = 120, 
					attr=
					{
				        {type = 9,value = 84,job =1},
				        {type = 11,value = 280,job =1},
						{type = 5,value = 1680,job =1},

				        {type = 13,value = 84,job =2},
				        {type = 15,value = 280,job =2},
						{type = 5,value = 1680,job =2},

				        {type = 17,value = 84,job =3},
				        {type = 19,value = 280,job =3},
						{type = 5,value = 1680,job =3},

				    },
				},
--9级 
				{
					needJingHua = 150, 
					attr=
					{
				        {type = 9,value = 104,job =1},
				        {type = 11,value = 346,job =1},
						{type = 5,value = 2076,job =1},

				        {type = 13,value = 104,job =2},
				        {type = 15,value = 346,job =2},
						{type = 5,value = 2076,job =2},

				        {type = 17,value = 104,job =3},
				        {type = 19,value = 346,job =3},
						{type = 5,value = 2076,job =3},

				    },
				},
--10级 
				{
					needJingHua = 200, 
					attr=
					{
				        {type = 9,value = 129,job =1},
				        {type = 11,value = 430,job =1},
						{type = 5,value = 2580,job =1},

				        {type = 13,value = 129,job =2},
				        {type = 15,value = 430,job =2},
						{type = 5,value = 2580,job =2},

				        {type = 17,value = 129,job =3},
				        {type = 19,value = 430,job =3},
						{type = 5,value = 2580,job =3},

				    },
				},
--11级 
				{
					needJingHua = 300, 
					attr=
					{
				        {type = 9,value = 165,job =1},
				        {type = 11,value = 550,job =1},
						{type = 5,value = 3300,job =1},

				        {type = 13,value = 165,job =2},
				        {type = 15,value = 550,job =2},
						{type = 5,value = 3300,job =2},

				        {type = 17,value = 165,job =3},
				        {type = 19,value = 550,job =3},
						{type = 5,value = 3300,job =3},

				    },
				},
--12级 
				{
					needJingHua = 400, 
					attr=
					{
				        {type = 9,value = 211,job =1},
				        {type = 11,value = 702,job =1},
						{type = 5,value = 4212,job =1},

				        {type = 13,value = 211,job =2},
				        {type = 15,value = 702,job =2},
						{type = 5,value = 4212,job =2},

				        {type = 17,value = 211,job =3},
				        {type = 19,value = 702,job =3},
						{type = 5,value = 4212,job =3},

				    },
				},
--13级 
				{
					needJingHua = 500, 
					attr=
					{
				        {type = 9,value = 265,job =1},
				        {type = 11,value = 882,job =1},
						{type = 5,value = 5292,job =1},

				        {type = 13,value = 265,job =2},
				        {type = 15,value = 882,job =2},
						{type = 5,value = 5292,job =2},

				        {type = 17,value = 265,job =3},
				        {type = 19,value = 882,job =3},
						{type = 5,value = 5292,job =3},

				    },
				},
--14级 
				{
					needJingHua = 600, 
					attr=
					{
				        {type = 9,value = 326,job =1},
				        {type = 11,value = 1086,job =1},
						{type = 5,value = 6516,job =1},

				        {type = 13,value = 326,job =2},
				        {type = 15,value = 1086,job =2},
						{type = 5,value = 6516,job =2},

				        {type = 17,value = 326,job =3},
				        {type = 19,value = 1086,job =3},
						{type = 5,value = 6516,job =3},

				    },
				},
--15级 
				{
					needJingHua = 700, 
					attr=
					{
				        {type = 9,value = 393,job =1},
				        {type = 11,value = 1310,job =1},
						{type = 5,value = 7860,job =1},

				        {type = 13,value = 393,job =2},
				        {type = 15,value = 1310,job =2},
						{type = 5,value = 7860,job =2},

				        {type = 17,value = 393,job =3},
				        {type = 19,value = 1310,job =3},
						{type = 5,value = 7860,job =3},

				    },
				},
--16级 
				{
					needJingHua = 800, 
					attr=
					{
				        {type = 9,value = 465,job =1},
				        {type = 11,value = 1550,job =1},
						{type = 5,value = 9300,job =1},

				        {type = 13,value = 465,job =2},
				        {type = 15,value = 1550,job =2},
						{type = 5,value = 9300,job =2},

				        {type = 17,value = 465,job =3},
				        {type = 19,value = 1550,job =3},
						{type = 5,value = 9300,job =3},

				    },
				},
--17级 
				{
					needJingHua = 900, 
					attr=
					{
				        {type = 9,value = 541,job =1},
				        {type = 11,value = 1802,job =1},
						{type = 5,value = 10812,job =1},

				        {type = 13,value = 541,job =2},
				        {type = 15,value = 1802,job =2},
						{type = 5,value = 10812,job =2},

				        {type = 17,value = 541,job =3},
				        {type = 19,value = 1802,job =3},
						{type = 5,value = 10812,job =3},

				    },
				},
--18级 
				{
					needJingHua = 1000, 
					attr=
					{
				        {type = 9,value = 619,job =1},
				        {type = 11,value = 2062,job =1},
						{type = 5,value = 12372,job =1},

				        {type = 13,value = 619,job =2},
				        {type = 15,value = 2062,job =2},
						{type = 5,value = 12372,job =2},

				        {type = 17,value = 619,job =3},
				        {type = 19,value = 2062,job =3},
						{type = 5,value = 12372,job =3},

				    },
				},
--19级 
				{
					needJingHua = 1100, 
					attr=
					{
				        {type = 9,value = 698,job =1},
				        {type = 11,value = 2326,job =1},
						{type = 5,value = 13956,job =1},

				        {type = 13,value = 698,job =2},
				        {type = 15,value = 2326,job =2},
						{type = 5,value = 13956,job =2},

				        {type = 17,value = 698,job =3},
				        {type = 19,value = 2326,job =3},
						{type = 5,value = 13956,job =3},

				    },
				},
--20级 
				{
					needJingHua = 1200, 
					attr=
					{
				        {type = 9,value = 777,job =1},
				        {type = 11,value = 2590,job =1},
						{type = 5,value = 15540,job =1},

				        {type = 13,value = 777,job =2},
				        {type = 15,value = 2590,job =2},
						{type = 5,value = 15540,job =2},

				        {type = 17,value = 777,job =3},
				        {type = 19,value = 2590,job =3},
						{type = 5,value = 15540,job =3},

				    },
				},
--21级 
				{
					needJingHua = 1300, 
					attr=
					{
				        {type = 9,value = 855,job =1},
				        {type = 11,value = 2850,job =1},
						{type = 5,value = 17100,job =1},

				        {type = 13,value = 855,job =2},
				        {type = 15,value = 2850,job =2},
						{type = 5,value = 17100,job =2},

				        {type = 17,value = 855,job =3},
				        {type = 19,value = 2850,job =3},
						{type = 5,value = 17100,job =3},

				    },
				},
--22级 
				{
					needJingHua = 1400, 
					attr=
					{
				        {type = 9,value = 931,job =1},
				        {type = 11,value = 3102,job =1},
						{type = 5,value = 18612,job =1},

				        {type = 13,value = 931,job =2},
				        {type = 15,value = 3102,job =2},
						{type = 5,value = 18612,job =2},

				        {type = 17,value = 931,job =3},
				        {type = 19,value = 3102,job =3},
						{type = 5,value = 18612,job =3},

				    },
				},
--23级 
				{
					needJingHua = 1500, 
					attr=
					{
				        {type = 9,value = 1003,job =1},
				        {type = 11,value = 3342,job =1},
						{type = 5,value = 20052,job =1},

				        {type = 13,value = 1003,job =2},
				        {type = 15,value = 3342,job =2},
						{type = 5,value = 20052,job =2},

				        {type = 17,value = 1003,job =3},
				        {type = 19,value = 3342,job =3},
						{type = 5,value = 20052,job =3},

				    },
				},
--24级 
				{
					needJingHua = 1600, 
					attr=
					{
				        {type = 9,value = 1070,job =1},
				        {type = 11,value = 3566,job =1},
						{type = 5,value = 21396,job =1},

				        {type = 13,value = 1070,job =2},
				        {type = 15,value = 3566,job =2},
						{type = 5,value = 21396,job =2},

				        {type = 17,value = 1070,job =3},
				        {type = 19,value = 3566,job =3},
						{type = 5,value = 21396,job =3},

				    },
				},
--25级 
				{
					needJingHua = 1700, 
					attr=
					{
				        {type = 9,value = 1131,job =1},
				        {type = 11,value = 3770,job =1},
						{type = 5,value = 22620,job =1},

				        {type = 13,value = 1131,job =2},
				        {type = 15,value = 3770,job =2},
						{type = 5,value = 22620,job =2},

				        {type = 17,value = 1131,job =3},
				        {type = 19,value = 3770,job =3},
						{type = 5,value = 22620,job =3},

				    },
				},
--26级 
				{
					needJingHua = 1800, 
					attr=
					{
				        {type = 9,value = 1185,job =1},
				        {type = 11,value = 3950,job =1},
						{type = 5,value = 23700,job =1},

				        {type = 13,value = 1185,job =2},
				        {type = 15,value = 3950,job =2},
						{type = 5,value = 23700,job =2},

				        {type = 17,value = 1185,job =3},
				        {type = 19,value = 3950,job =3},
						{type = 5,value = 23700,job =3},

				    },
				},
--27级 
				{
					needJingHua = 1900, 
					attr=
					{
				        {type = 9,value = 1231,job =1},
				        {type = 11,value = 4102,job =1},
						{type = 5,value = 24612,job =1},

				        {type = 13,value = 1231,job =2},
				        {type = 15,value = 4102,job =2},
						{type = 5,value = 24612,job =2},

				        {type = 17,value = 1231,job =3},
				        {type = 19,value = 4102,job =3},
						{type = 5,value = 24612,job =3},

				    },
				},
--28级 
				{
					needJingHua = 2000, 
					attr=
					{
				        {type = 9,value = 1273,job =1},
				        {type = 11,value = 4242,job =1},
						{type = 5,value = 25452,job =1},

				        {type = 13,value = 1273,job =2},
				        {type = 15,value = 4242,job =2},
						{type = 5,value = 25452,job =2},

				        {type = 17,value = 1273,job =3},
				        {type = 19,value = 4242,job =3},
						{type = 5,value = 25452,job =3},

				    },
				},
--29级 
				{
					needJingHua = 2100, 
					attr=
					{
				        {type = 9,value = 1310,job =1},
				        {type = 11,value = 4368,job =1},
						{type = 5,value = 26208,job =1},

				        {type = 13,value = 1310,job =2},
				        {type = 15,value = 4368,job =2},
						{type = 5,value = 26208,job =2},

				        {type = 17,value = 1310,job =3},
				        {type = 19,value = 4368,job =3},
						{type = 5,value = 26208,job =3},

				    },
				},
--30级 
				{
					needJingHua = 2200, 
					attr=
					{
				        {type = 9,value = 1350,job =1},
				        {type = 11,value = 4500,job =1},
						{type = 5,value = 27000,job =1},

				        {type = 13,value = 1350,job =2},
				        {type = 15,value = 4500,job =2},
						{type = 5,value = 27000,job =2},

				        {type = 17,value = 1350,job =3},
				        {type = 19,value = 4500,job =3},
						{type = 5,value = 27000,job =3},

				    },
				},
--31级 
				{
					needJingHua = 2300, 
					attr=
					{
				        {type = 9,value = 1391,job =1},
				        {type = 11,value = 4638,job =1},
						{type = 5,value = 27828,job =1},

				        {type = 13,value = 1391,job =2},
				        {type = 15,value = 4638,job =2},
						{type = 5,value = 27828,job =2},

				        {type = 17,value = 1391,job =3},
				        {type = 19,value = 4638,job =3},
						{type = 5,value = 27828,job =3},

				    },
				},
--32级 
				{
					needJingHua = 2400, 
					attr=
					{
				        {type = 9,value = 1435,job =1},
				        {type = 11,value = 4782,job =1},
						{type = 5,value = 28692,job =1},

				        {type = 13,value = 1435,job =2},
				        {type = 15,value = 4782,job =2},
						{type = 5,value = 28692,job =2},

				        {type = 17,value = 1435,job =3},
				        {type = 19,value = 4782,job =3},
						{type = 5,value = 28692,job =3},

				    },
				},
--33级 
				{
					needJingHua = 2500, 
					attr=
					{
				        {type = 9,value = 1480,job =1},
				        {type = 11,value = 4932,job =1},
						{type = 5,value = 29592,job =1},

				        {type = 13,value = 1480,job =2},
				        {type = 15,value = 4932,job =2},
						{type = 5,value = 29592,job =2},

				        {type = 17,value = 1480,job =3},
				        {type = 19,value = 4932,job =3},
						{type = 5,value = 29592,job =3},

				    },
				},
--34级 
				{
					needJingHua = 2600, 
					attr=
					{
				        {type = 9,value = 1526,job =1},
				        {type = 11,value = 5088,job =1},
						{type = 5,value = 30528,job =1},

				        {type = 13,value = 1526,job =2},
				        {type = 15,value = 5088,job =2},
						{type = 5,value = 30528,job =2},

				        {type = 17,value = 1526,job =3},
				        {type = 19,value = 5088,job =3},
						{type = 5,value = 30528,job =3},

				    },
				},
--35级 
				{
					needJingHua = 2700, 
					attr=
					{
				        {type = 9,value = 1575,job =1},
				        {type = 11,value = 5250,job =1},
						{type = 5,value = 31500,job =1},

				        {type = 13,value = 1575,job =2},
				        {type = 15,value = 5250,job =2},
						{type = 5,value = 31500,job =2},

				        {type = 17,value = 1575,job =3},
				        {type = 19,value = 5250,job =3},
						{type = 5,value = 31500,job =3},

				    },
				},
--36级 
				{
					needJingHua = 2800, 
					attr=
					{
				        {type = 9,value = 1625,job =1},
				        {type = 11,value = 5418,job =1},
						{type = 5,value = 32508,job =1},

				        {type = 13,value = 1625,job =2},
				        {type = 15,value = 5418,job =2},
						{type = 5,value = 32508,job =2},

				        {type = 17,value = 1625,job =3},
				        {type = 19,value = 5418,job =3},
						{type = 5,value = 32508,job =3},

				    },
				},
--37级 
				{
					needJingHua = 2900, 
					attr=
					{
				        {type = 9,value = 1678,job =1},
				        {type = 11,value = 5592,job =1},
						{type = 5,value = 33552,job =1},

				        {type = 13,value = 1678,job =2},
				        {type = 15,value = 5592,job =2},
						{type = 5,value = 33552,job =2},

				        {type = 17,value = 1678,job =3},
				        {type = 19,value = 5592,job =3},
						{type = 5,value = 33552,job =3},

				    },
				},
--38级 
				{
					needJingHua = 3000, 
					attr=
					{
				        {type = 9,value = 1732,job =1},
				        {type = 11,value = 5772,job =1},
						{type = 5,value = 34632,job =1},

				        {type = 13,value = 1732,job =2},
				        {type = 15,value = 5772,job =2},
						{type = 5,value = 34632,job =2},

				        {type = 17,value = 1732,job =3},
				        {type = 19,value = 5772,job =3},
						{type = 5,value = 34632,job =3},

				    },
				},
--39级 
				{
					needJingHua = 3100, 
					attr=
					{
				        {type = 9,value = 1787,job =1},
				        {type = 11,value = 5958,job =1},
						{type = 5,value = 35748,job =1},

				        {type = 13,value = 1787,job =2},
				        {type = 15,value = 5958,job =2},
						{type = 5,value = 35748,job =2},

				        {type = 17,value = 1787,job =3},
				        {type = 19,value = 5958,job =3},
						{type = 5,value = 35748,job =3},

				    },
				},
--40级 
				{
					needJingHua = 3200, 
					attr=
					{
				        {type = 9,value = 1845,job =1},
				        {type = 11,value = 6150,job =1},
						{type = 5,value = 36900,job =1},

				        {type = 13,value = 1845,job =2},
				        {type = 15,value = 6150,job =2},
						{type = 5,value = 36900,job =2},

				        {type = 17,value = 1845,job =3},
				        {type = 19,value = 6150,job =3},
						{type = 5,value = 36900,job =3},

				    },
				},
--41级 
				{
					needJingHua = 3300, 
					attr=
					{
				        {type = 9,value = 1904,job =1},
				        {type = 11,value = 6348,job =1},
						{type = 5,value = 38088,job =1},

				        {type = 13,value = 1904,job =2},
				        {type = 15,value = 6348,job =2},
						{type = 5,value = 38088,job =2},

				        {type = 17,value = 1904,job =3},
				        {type = 19,value = 6348,job =3},
						{type = 5,value = 38088,job =3},

				    },
				},
--42级 
				{
					needJingHua = 3400, 
					attr=
					{
				        {type = 9,value = 1966,job =1},
				        {type = 11,value = 6552,job =1},
						{type = 5,value = 39312,job =1},

				        {type = 13,value = 1966,job =2},
				        {type = 15,value = 6552,job =2},
						{type = 5,value = 39312,job =2},

				        {type = 17,value = 1966,job =3},
				        {type = 19,value = 6552,job =3},
						{type = 5,value = 39312,job =3},

				    },
				},
--43级 
				{
					needJingHua = 3500, 
					attr=
					{
				        {type = 9,value = 2029,job =1},
				        {type = 11,value = 6762,job =1},
						{type = 5,value = 40572,job =1},

				        {type = 13,value = 2029,job =2},
				        {type = 15,value = 6762,job =2},
						{type = 5,value = 40572,job =2},

				        {type = 17,value = 2029,job =3},
				        {type = 19,value = 6762,job =3},
						{type = 5,value = 40572,job =3},

				    },
				},
--44级 
				{
					needJingHua = 3600, 
					attr=
					{
				        {type = 9,value = 2093,job =1},
				        {type = 11,value = 6978,job =1},
						{type = 5,value = 41868,job =1},

				        {type = 13,value = 2093,job =2},
				        {type = 15,value = 6978,job =2},
						{type = 5,value = 41868,job =2},

				        {type = 17,value = 2093,job =3},
				        {type = 19,value = 6978,job =3},
						{type = 5,value = 41868,job =3},

				    },
				},
--45级 
				{
					needJingHua = 3700, 
					attr=
					{
				        {type = 9,value = 2160,job =1},
				        {type = 11,value = 7200,job =1},
						{type = 5,value = 43200,job =1},

				        {type = 13,value = 2160,job =2},
				        {type = 15,value = 7200,job =2},
						{type = 5,value = 43200,job =2},

				        {type = 17,value = 2160,job =3},
				        {type = 19,value = 7200,job =3},
						{type = 5,value = 43200,job =3},

				    },
				},
--46级 
				{
					needJingHua = 3800, 
					attr=
					{
				        {type = 9,value = 2228,job =1},
				        {type = 11,value = 7428,job =1},
						{type = 5,value = 44568,job =1},

				        {type = 13,value = 2228,job =2},
				        {type = 15,value = 7428,job =2},
						{type = 5,value = 44568,job =2},

				        {type = 17,value = 2228,job =3},
				        {type = 19,value = 7428,job =3},
						{type = 5,value = 44568,job =3},

				    },
				},
--47级 
				{
					needJingHua = 3900, 
					attr=
					{
				        {type = 9,value = 2299,job =1},
				        {type = 11,value = 7662,job =1},
						{type = 5,value = 45972,job =1},

				        {type = 13,value = 2299,job =2},
				        {type = 15,value = 7662,job =2},
						{type = 5,value = 45972,job =2},

				        {type = 17,value = 2299,job =3},
				        {type = 19,value = 7662,job =3},
						{type = 5,value = 45972,job =3},

				    },
				},
--48级 
				{
					needJingHua = 4000, 
					attr=
					{
				        {type = 9,value = 2371,job =1},
				        {type = 11,value = 7902,job =1},
						{type = 5,value = 47412,job =1},

				        {type = 13,value = 2371,job =2},
				        {type = 15,value = 7902,job =2},
						{type = 5,value = 47412,job =2},

				        {type = 17,value = 2371,job =3},
				        {type = 19,value = 7902,job =3},
						{type = 5,value = 47412,job =3},

				    },
				},
--49级 
				{
					needJingHua = 4100, 
					attr=
					{
				        {type = 9,value = 2444,job =1},
				        {type = 11,value = 8148,job =1},
						{type = 5,value = 48888,job =1},

				        {type = 13,value = 2444,job =2},
				        {type = 15,value = 8148,job =2},
						{type = 5,value = 48888,job =2},

				        {type = 17,value = 2444,job =3},
				        {type = 19,value = 8148,job =3},
						{type = 5,value = 48888,job =3},

				    },
				},
--50级 
				{
					needJingHua = 4200, 
					attr=
					{
				        {type = 9,value = 2520,job =1},
				        {type = 11,value = 8400,job =1},
						{type = 5,value = 50400,job =1},

				        {type = 13,value = 2520,job =2},
				        {type = 15,value = 8400,job =2},
						{type = 5,value = 50400,job =2},

				        {type = 17,value = 2520,job =3},
				        {type = 19,value = 8400,job =3},
						{type = 5,value = 50400,job =3},

				    },
				},

	
			
			},
		},
	
	
		{	
			position = 7,
			name = "左戒指",
			level=
			{
	--1级 
				{
					needJingHua = 30, 
					attr=
					{
				        {type = 9,value = 5,job =1},
				        {type = 11,value = 18,job =1},
						{type = 5,value = 108,job =1},

				        {type = 13,value = 5,job =2},
				        {type = 15,value = 18,job =2},
						{type = 5,value = 108,job =2},

				        {type = 17,value = 5,job =3},
				        {type = 19,value = 18,job =3},
						{type = 5,value = 108,job =3},

				    },
				},
--2级 
				{
					needJingHua = 40, 
					attr=
					{
				        {type = 9,value = 12,job =1},
				        {type = 11,value = 41,job =1},
						{type = 5,value = 246,job =1},

				        {type = 13,value = 12,job =2},
				        {type = 15,value = 41,job =2},
						{type = 5,value = 246,job =2},

				        {type = 17,value = 12,job =3},
				        {type = 19,value = 41,job =3},
						{type = 5,value = 246,job =3},

				    },
				},
--3级 
				{
					needJingHua = 50, 
					attr=
					{
				        {type = 9,value = 21,job =1},
				        {type = 11,value = 69,job =1},
						{type = 5,value = 414,job =1},

				        {type = 13,value = 21,job =2},
				        {type = 15,value = 69,job =2},
						{type = 5,value = 414,job =2},

				        {type = 17,value = 21,job =3},
				        {type = 19,value = 69,job =3},
						{type = 5,value = 414,job =3},

				    },
				},
--4级 
				{
					needJingHua = 60, 
					attr=
					{
				        {type = 9,value = 30,job =1},
				        {type = 11,value = 101,job =1},
						{type = 5,value = 606,job =1},

				        {type = 13,value = 30,job =2},
				        {type = 15,value = 101,job =2},
						{type = 5,value = 606,job =2},

				        {type = 17,value = 30,job =3},
				        {type = 19,value = 101,job =3},
						{type = 5,value = 606,job =3},

				    },
				},
--5级 
				{
					needJingHua = 70, 
					attr=
					{
				        {type = 9,value = 41,job =1},
				        {type = 11,value = 137,job =1},
						{type = 5,value = 822,job =1},

				        {type = 13,value = 41,job =2},
				        {type = 15,value = 137,job =2},
						{type = 5,value = 822,job =2},

				        {type = 17,value = 41,job =3},
				        {type = 19,value = 137,job =3},
						{type = 5,value = 822,job =3},

				    },
				},
--6级 
				{
					needJingHua = 80, 
					attr=
					{
				        {type = 9,value = 53,job =1},
				        {type = 11,value = 177,job =1},
						{type = 5,value = 1062,job =1},

				        {type = 13,value = 53,job =2},
				        {type = 15,value = 177,job =2},
						{type = 5,value = 1062,job =2},

				        {type = 17,value = 53,job =3},
				        {type = 19,value = 177,job =3},
						{type = 5,value = 1062,job =3},

				    },
				},
--7级 
				{
					needJingHua = 100, 
					attr=
					{
				        {type = 9,value = 68,job =1},
				        {type = 11,value = 225,job =1},
						{type = 5,value = 1350,job =1},

				        {type = 13,value = 68,job =2},
				        {type = 15,value = 225,job =2},
						{type = 5,value = 1350,job =2},

				        {type = 17,value = 68,job =3},
				        {type = 19,value = 225,job =3},
						{type = 5,value = 1350,job =3},

				    },
				},
--8级 
				{
					needJingHua = 120, 
					attr=
					{
				        {type = 9,value = 84,job =1},
				        {type = 11,value = 280,job =1},
						{type = 5,value = 1680,job =1},

				        {type = 13,value = 84,job =2},
				        {type = 15,value = 280,job =2},
						{type = 5,value = 1680,job =2},

				        {type = 17,value = 84,job =3},
				        {type = 19,value = 280,job =3},
						{type = 5,value = 1680,job =3},

				    },
				},
--9级 
				{
					needJingHua = 150, 
					attr=
					{
				        {type = 9,value = 104,job =1},
				        {type = 11,value = 346,job =1},
						{type = 5,value = 2076,job =1},

				        {type = 13,value = 104,job =2},
				        {type = 15,value = 346,job =2},
						{type = 5,value = 2076,job =2},

				        {type = 17,value = 104,job =3},
				        {type = 19,value = 346,job =3},
						{type = 5,value = 2076,job =3},

				    },
				},
--10级 
				{
					needJingHua = 200, 
					attr=
					{
				        {type = 9,value = 129,job =1},
				        {type = 11,value = 430,job =1},
						{type = 5,value = 2580,job =1},

				        {type = 13,value = 129,job =2},
				        {type = 15,value = 430,job =2},
						{type = 5,value = 2580,job =2},

				        {type = 17,value = 129,job =3},
				        {type = 19,value = 430,job =3},
						{type = 5,value = 2580,job =3},

				    },
				},
--11级 
				{
					needJingHua = 300, 
					attr=
					{
				        {type = 9,value = 165,job =1},
				        {type = 11,value = 550,job =1},
						{type = 5,value = 3300,job =1},

				        {type = 13,value = 165,job =2},
				        {type = 15,value = 550,job =2},
						{type = 5,value = 3300,job =2},

				        {type = 17,value = 165,job =3},
				        {type = 19,value = 550,job =3},
						{type = 5,value = 3300,job =3},

				    },
				},
--12级 
				{
					needJingHua = 400, 
					attr=
					{
				        {type = 9,value = 211,job =1},
				        {type = 11,value = 702,job =1},
						{type = 5,value = 4212,job =1},

				        {type = 13,value = 211,job =2},
				        {type = 15,value = 702,job =2},
						{type = 5,value = 4212,job =2},

				        {type = 17,value = 211,job =3},
				        {type = 19,value = 702,job =3},
						{type = 5,value = 4212,job =3},

				    },
				},
--13级 
				{
					needJingHua = 500, 
					attr=
					{
				        {type = 9,value = 265,job =1},
				        {type = 11,value = 882,job =1},
						{type = 5,value = 5292,job =1},

				        {type = 13,value = 265,job =2},
				        {type = 15,value = 882,job =2},
						{type = 5,value = 5292,job =2},

				        {type = 17,value = 265,job =3},
				        {type = 19,value = 882,job =3},
						{type = 5,value = 5292,job =3},

				    },
				},
--14级 
				{
					needJingHua = 600, 
					attr=
					{
				        {type = 9,value = 326,job =1},
				        {type = 11,value = 1086,job =1},
						{type = 5,value = 6516,job =1},

				        {type = 13,value = 326,job =2},
				        {type = 15,value = 1086,job =2},
						{type = 5,value = 6516,job =2},

				        {type = 17,value = 326,job =3},
				        {type = 19,value = 1086,job =3},
						{type = 5,value = 6516,job =3},

				    },
				},
--15级 
				{
					needJingHua = 700, 
					attr=
					{
				        {type = 9,value = 393,job =1},
				        {type = 11,value = 1310,job =1},
						{type = 5,value = 7860,job =1},

				        {type = 13,value = 393,job =2},
				        {type = 15,value = 1310,job =2},
						{type = 5,value = 7860,job =2},

				        {type = 17,value = 393,job =3},
				        {type = 19,value = 1310,job =3},
						{type = 5,value = 7860,job =3},

				    },
				},
--16级 
				{
					needJingHua = 800, 
					attr=
					{
				        {type = 9,value = 465,job =1},
				        {type = 11,value = 1550,job =1},
						{type = 5,value = 9300,job =1},

				        {type = 13,value = 465,job =2},
				        {type = 15,value = 1550,job =2},
						{type = 5,value = 9300,job =2},

				        {type = 17,value = 465,job =3},
				        {type = 19,value = 1550,job =3},
						{type = 5,value = 9300,job =3},

				    },
				},
--17级 
				{
					needJingHua = 900, 
					attr=
					{
				        {type = 9,value = 541,job =1},
				        {type = 11,value = 1802,job =1},
						{type = 5,value = 10812,job =1},

				        {type = 13,value = 541,job =2},
				        {type = 15,value = 1802,job =2},
						{type = 5,value = 10812,job =2},

				        {type = 17,value = 541,job =3},
				        {type = 19,value = 1802,job =3},
						{type = 5,value = 10812,job =3},

				    },
				},
--18级 
				{
					needJingHua = 1000, 
					attr=
					{
				        {type = 9,value = 619,job =1},
				        {type = 11,value = 2062,job =1},
						{type = 5,value = 12372,job =1},

				        {type = 13,value = 619,job =2},
				        {type = 15,value = 2062,job =2},
						{type = 5,value = 12372,job =2},

				        {type = 17,value = 619,job =3},
				        {type = 19,value = 2062,job =3},
						{type = 5,value = 12372,job =3},

				    },
				},
--19级 
				{
					needJingHua = 1100, 
					attr=
					{
				        {type = 9,value = 698,job =1},
				        {type = 11,value = 2326,job =1},
						{type = 5,value = 13956,job =1},

				        {type = 13,value = 698,job =2},
				        {type = 15,value = 2326,job =2},
						{type = 5,value = 13956,job =2},

				        {type = 17,value = 698,job =3},
				        {type = 19,value = 2326,job =3},
						{type = 5,value = 13956,job =3},

				    },
				},
--20级 
				{
					needJingHua = 1200, 
					attr=
					{
				        {type = 9,value = 777,job =1},
				        {type = 11,value = 2590,job =1},
						{type = 5,value = 15540,job =1},

				        {type = 13,value = 777,job =2},
				        {type = 15,value = 2590,job =2},
						{type = 5,value = 15540,job =2},

				        {type = 17,value = 777,job =3},
				        {type = 19,value = 2590,job =3},
						{type = 5,value = 15540,job =3},

				    },
				},
--21级 
				{
					needJingHua = 1300, 
					attr=
					{
				        {type = 9,value = 855,job =1},
				        {type = 11,value = 2850,job =1},
						{type = 5,value = 17100,job =1},

				        {type = 13,value = 855,job =2},
				        {type = 15,value = 2850,job =2},
						{type = 5,value = 17100,job =2},

				        {type = 17,value = 855,job =3},
				        {type = 19,value = 2850,job =3},
						{type = 5,value = 17100,job =3},

				    },
				},
--22级 
				{
					needJingHua = 1400, 
					attr=
					{
				        {type = 9,value = 931,job =1},
				        {type = 11,value = 3102,job =1},
						{type = 5,value = 18612,job =1},

				        {type = 13,value = 931,job =2},
				        {type = 15,value = 3102,job =2},
						{type = 5,value = 18612,job =2},

				        {type = 17,value = 931,job =3},
				        {type = 19,value = 3102,job =3},
						{type = 5,value = 18612,job =3},

				    },
				},
--23级 
				{
					needJingHua = 1500, 
					attr=
					{
				        {type = 9,value = 1003,job =1},
				        {type = 11,value = 3342,job =1},
						{type = 5,value = 20052,job =1},

				        {type = 13,value = 1003,job =2},
				        {type = 15,value = 3342,job =2},
						{type = 5,value = 20052,job =2},

				        {type = 17,value = 1003,job =3},
				        {type = 19,value = 3342,job =3},
						{type = 5,value = 20052,job =3},

				    },
				},
--24级 
				{
					needJingHua = 1600, 
					attr=
					{
				        {type = 9,value = 1070,job =1},
				        {type = 11,value = 3566,job =1},
						{type = 5,value = 21396,job =1},

				        {type = 13,value = 1070,job =2},
				        {type = 15,value = 3566,job =2},
						{type = 5,value = 21396,job =2},

				        {type = 17,value = 1070,job =3},
				        {type = 19,value = 3566,job =3},
						{type = 5,value = 21396,job =3},

				    },
				},
--25级 
				{
					needJingHua = 1700, 
					attr=
					{
				        {type = 9,value = 1131,job =1},
				        {type = 11,value = 3770,job =1},
						{type = 5,value = 22620,job =1},

				        {type = 13,value = 1131,job =2},
				        {type = 15,value = 3770,job =2},
						{type = 5,value = 22620,job =2},

				        {type = 17,value = 1131,job =3},
				        {type = 19,value = 3770,job =3},
						{type = 5,value = 22620,job =3},

				    },
				},
--26级 
				{
					needJingHua = 1800, 
					attr=
					{
				        {type = 9,value = 1185,job =1},
				        {type = 11,value = 3950,job =1},
						{type = 5,value = 23700,job =1},

				        {type = 13,value = 1185,job =2},
				        {type = 15,value = 3950,job =2},
						{type = 5,value = 23700,job =2},

				        {type = 17,value = 1185,job =3},
				        {type = 19,value = 3950,job =3},
						{type = 5,value = 23700,job =3},

				    },
				},
--27级 
				{
					needJingHua = 1900, 
					attr=
					{
				        {type = 9,value = 1231,job =1},
				        {type = 11,value = 4102,job =1},
						{type = 5,value = 24612,job =1},

				        {type = 13,value = 1231,job =2},
				        {type = 15,value = 4102,job =2},
						{type = 5,value = 24612,job =2},

				        {type = 17,value = 1231,job =3},
				        {type = 19,value = 4102,job =3},
						{type = 5,value = 24612,job =3},

				    },
				},
--28级 
				{
					needJingHua = 2000, 
					attr=
					{
				        {type = 9,value = 1273,job =1},
				        {type = 11,value = 4242,job =1},
						{type = 5,value = 25452,job =1},

				        {type = 13,value = 1273,job =2},
				        {type = 15,value = 4242,job =2},
						{type = 5,value = 25452,job =2},

				        {type = 17,value = 1273,job =3},
				        {type = 19,value = 4242,job =3},
						{type = 5,value = 25452,job =3},

				    },
				},
--29级 
				{
					needJingHua = 2100, 
					attr=
					{
				        {type = 9,value = 1310,job =1},
				        {type = 11,value = 4368,job =1},
						{type = 5,value = 26208,job =1},

				        {type = 13,value = 1310,job =2},
				        {type = 15,value = 4368,job =2},
						{type = 5,value = 26208,job =2},

				        {type = 17,value = 1310,job =3},
				        {type = 19,value = 4368,job =3},
						{type = 5,value = 26208,job =3},

				    },
				},
--30级 
				{
					needJingHua = 2200, 
					attr=
					{
				        {type = 9,value = 1350,job =1},
				        {type = 11,value = 4500,job =1},
						{type = 5,value = 27000,job =1},

				        {type = 13,value = 1350,job =2},
				        {type = 15,value = 4500,job =2},
						{type = 5,value = 27000,job =2},

				        {type = 17,value = 1350,job =3},
				        {type = 19,value = 4500,job =3},
						{type = 5,value = 27000,job =3},

				    },
				},
--31级 
				{
					needJingHua = 2300, 
					attr=
					{
				        {type = 9,value = 1391,job =1},
				        {type = 11,value = 4638,job =1},
						{type = 5,value = 27828,job =1},

				        {type = 13,value = 1391,job =2},
				        {type = 15,value = 4638,job =2},
						{type = 5,value = 27828,job =2},

				        {type = 17,value = 1391,job =3},
				        {type = 19,value = 4638,job =3},
						{type = 5,value = 27828,job =3},

				    },
				},
--32级 
				{
					needJingHua = 2400, 
					attr=
					{
				        {type = 9,value = 1435,job =1},
				        {type = 11,value = 4782,job =1},
						{type = 5,value = 28692,job =1},

				        {type = 13,value = 1435,job =2},
				        {type = 15,value = 4782,job =2},
						{type = 5,value = 28692,job =2},

				        {type = 17,value = 1435,job =3},
				        {type = 19,value = 4782,job =3},
						{type = 5,value = 28692,job =3},

				    },
				},
--33级 
				{
					needJingHua = 2500, 
					attr=
					{
				        {type = 9,value = 1480,job =1},
				        {type = 11,value = 4932,job =1},
						{type = 5,value = 29592,job =1},

				        {type = 13,value = 1480,job =2},
				        {type = 15,value = 4932,job =2},
						{type = 5,value = 29592,job =2},

				        {type = 17,value = 1480,job =3},
				        {type = 19,value = 4932,job =3},
						{type = 5,value = 29592,job =3},

				    },
				},
--34级 
				{
					needJingHua = 2600, 
					attr=
					{
				        {type = 9,value = 1526,job =1},
				        {type = 11,value = 5088,job =1},
						{type = 5,value = 30528,job =1},

				        {type = 13,value = 1526,job =2},
				        {type = 15,value = 5088,job =2},
						{type = 5,value = 30528,job =2},

				        {type = 17,value = 1526,job =3},
				        {type = 19,value = 5088,job =3},
						{type = 5,value = 30528,job =3},

				    },
				},
--35级 
				{
					needJingHua = 2700, 
					attr=
					{
				        {type = 9,value = 1575,job =1},
				        {type = 11,value = 5250,job =1},
						{type = 5,value = 31500,job =1},

				        {type = 13,value = 1575,job =2},
				        {type = 15,value = 5250,job =2},
						{type = 5,value = 31500,job =2},

				        {type = 17,value = 1575,job =3},
				        {type = 19,value = 5250,job =3},
						{type = 5,value = 31500,job =3},

				    },
				},
--36级 
				{
					needJingHua = 2800, 
					attr=
					{
				        {type = 9,value = 1625,job =1},
				        {type = 11,value = 5418,job =1},
						{type = 5,value = 32508,job =1},

				        {type = 13,value = 1625,job =2},
				        {type = 15,value = 5418,job =2},
						{type = 5,value = 32508,job =2},

				        {type = 17,value = 1625,job =3},
				        {type = 19,value = 5418,job =3},
						{type = 5,value = 32508,job =3},

				    },
				},
--37级 
				{
					needJingHua = 2900, 
					attr=
					{
				        {type = 9,value = 1678,job =1},
				        {type = 11,value = 5592,job =1},
						{type = 5,value = 33552,job =1},

				        {type = 13,value = 1678,job =2},
				        {type = 15,value = 5592,job =2},
						{type = 5,value = 33552,job =2},

				        {type = 17,value = 1678,job =3},
				        {type = 19,value = 5592,job =3},
						{type = 5,value = 33552,job =3},

				    },
				},
--38级 
				{
					needJingHua = 3000, 
					attr=
					{
				        {type = 9,value = 1732,job =1},
				        {type = 11,value = 5772,job =1},
						{type = 5,value = 34632,job =1},

				        {type = 13,value = 1732,job =2},
				        {type = 15,value = 5772,job =2},
						{type = 5,value = 34632,job =2},

				        {type = 17,value = 1732,job =3},
				        {type = 19,value = 5772,job =3},
						{type = 5,value = 34632,job =3},

				    },
				},
--39级 
				{
					needJingHua = 3100, 
					attr=
					{
				        {type = 9,value = 1787,job =1},
				        {type = 11,value = 5958,job =1},
						{type = 5,value = 35748,job =1},

				        {type = 13,value = 1787,job =2},
				        {type = 15,value = 5958,job =2},
						{type = 5,value = 35748,job =2},

				        {type = 17,value = 1787,job =3},
				        {type = 19,value = 5958,job =3},
						{type = 5,value = 35748,job =3},

				    },
				},
--40级 
				{
					needJingHua = 3200, 
					attr=
					{
				        {type = 9,value = 1845,job =1},
				        {type = 11,value = 6150,job =1},
						{type = 5,value = 36900,job =1},

				        {type = 13,value = 1845,job =2},
				        {type = 15,value = 6150,job =2},
						{type = 5,value = 36900,job =2},

				        {type = 17,value = 1845,job =3},
				        {type = 19,value = 6150,job =3},
						{type = 5,value = 36900,job =3},

				    },
				},
--41级 
				{
					needJingHua = 3300, 
					attr=
					{
				        {type = 9,value = 1904,job =1},
				        {type = 11,value = 6348,job =1},
						{type = 5,value = 38088,job =1},

				        {type = 13,value = 1904,job =2},
				        {type = 15,value = 6348,job =2},
						{type = 5,value = 38088,job =2},

				        {type = 17,value = 1904,job =3},
				        {type = 19,value = 6348,job =3},
						{type = 5,value = 38088,job =3},

				    },
				},
--42级 
				{
					needJingHua = 3400, 
					attr=
					{
				        {type = 9,value = 1966,job =1},
				        {type = 11,value = 6552,job =1},
						{type = 5,value = 39312,job =1},

				        {type = 13,value = 1966,job =2},
				        {type = 15,value = 6552,job =2},
						{type = 5,value = 39312,job =2},

				        {type = 17,value = 1966,job =3},
				        {type = 19,value = 6552,job =3},
						{type = 5,value = 39312,job =3},

				    },
				},
--43级 
				{
					needJingHua = 3500, 
					attr=
					{
				        {type = 9,value = 2029,job =1},
				        {type = 11,value = 6762,job =1},
						{type = 5,value = 40572,job =1},

				        {type = 13,value = 2029,job =2},
				        {type = 15,value = 6762,job =2},
						{type = 5,value = 40572,job =2},

				        {type = 17,value = 2029,job =3},
				        {type = 19,value = 6762,job =3},
						{type = 5,value = 40572,job =3},

				    },
				},
--44级 
				{
					needJingHua = 3600, 
					attr=
					{
				        {type = 9,value = 2093,job =1},
				        {type = 11,value = 6978,job =1},
						{type = 5,value = 41868,job =1},

				        {type = 13,value = 2093,job =2},
				        {type = 15,value = 6978,job =2},
						{type = 5,value = 41868,job =2},

				        {type = 17,value = 2093,job =3},
				        {type = 19,value = 6978,job =3},
						{type = 5,value = 41868,job =3},

				    },
				},
--45级 
				{
					needJingHua = 3700, 
					attr=
					{
				        {type = 9,value = 2160,job =1},
				        {type = 11,value = 7200,job =1},
						{type = 5,value = 43200,job =1},

				        {type = 13,value = 2160,job =2},
				        {type = 15,value = 7200,job =2},
						{type = 5,value = 43200,job =2},

				        {type = 17,value = 2160,job =3},
				        {type = 19,value = 7200,job =3},
						{type = 5,value = 43200,job =3},

				    },
				},
--46级 
				{
					needJingHua = 3800, 
					attr=
					{
				        {type = 9,value = 2228,job =1},
				        {type = 11,value = 7428,job =1},
						{type = 5,value = 44568,job =1},

				        {type = 13,value = 2228,job =2},
				        {type = 15,value = 7428,job =2},
						{type = 5,value = 44568,job =2},

				        {type = 17,value = 2228,job =3},
				        {type = 19,value = 7428,job =3},
						{type = 5,value = 44568,job =3},

				    },
				},
--47级 
				{
					needJingHua = 3900, 
					attr=
					{
				        {type = 9,value = 2299,job =1},
				        {type = 11,value = 7662,job =1},
						{type = 5,value = 45972,job =1},

				        {type = 13,value = 2299,job =2},
				        {type = 15,value = 7662,job =2},
						{type = 5,value = 45972,job =2},

				        {type = 17,value = 2299,job =3},
				        {type = 19,value = 7662,job =3},
						{type = 5,value = 45972,job =3},

				    },
				},
--48级 
				{
					needJingHua = 4000, 
					attr=
					{
				        {type = 9,value = 2371,job =1},
				        {type = 11,value = 7902,job =1},
						{type = 5,value = 47412,job =1},

				        {type = 13,value = 2371,job =2},
				        {type = 15,value = 7902,job =2},
						{type = 5,value = 47412,job =2},

				        {type = 17,value = 2371,job =3},
				        {type = 19,value = 7902,job =3},
						{type = 5,value = 47412,job =3},

				    },
				},
--49级 
				{
					needJingHua = 4100, 
					attr=
					{
				        {type = 9,value = 2444,job =1},
				        {type = 11,value = 8148,job =1},
						{type = 5,value = 48888,job =1},

				        {type = 13,value = 2444,job =2},
				        {type = 15,value = 8148,job =2},
						{type = 5,value = 48888,job =2},

				        {type = 17,value = 2444,job =3},
				        {type = 19,value = 8148,job =3},
						{type = 5,value = 48888,job =3},

				    },
				},
--50级 
				{
					needJingHua = 4200, 
					attr=
					{
				        {type = 9,value = 2520,job =1},
				        {type = 11,value = 8400,job =1},
						{type = 5,value = 50400,job =1},

				        {type = 13,value = 2520,job =2},
				        {type = 15,value = 8400,job =2},
						{type = 5,value = 50400,job =2},

				        {type = 17,value = 2520,job =3},
				        {type = 19,value = 8400,job =3},
						{type = 5,value = 50400,job =3},

				    },
				},

	
			
			
			},
		},
	
		{	
			position = 8,
			name = "右戒指",
			level=
			{
	--1级 
				{
					needJingHua = 30, 
					attr=
					{
				        {type = 9,value = 5,job =1},
				        {type = 11,value = 18,job =1},
						{type = 5,value = 108,job =1},

				        {type = 13,value = 5,job =2},
				        {type = 15,value = 18,job =2},
						{type = 5,value = 108,job =2},

				        {type = 17,value = 5,job =3},
				        {type = 19,value = 18,job =3},
						{type = 5,value = 108,job =3},

				    },
				},
--2级 
				{
					needJingHua = 40, 
					attr=
					{
				        {type = 9,value = 12,job =1},
				        {type = 11,value = 41,job =1},
						{type = 5,value = 246,job =1},

				        {type = 13,value = 12,job =2},
				        {type = 15,value = 41,job =2},
						{type = 5,value = 246,job =2},

				        {type = 17,value = 12,job =3},
				        {type = 19,value = 41,job =3},
						{type = 5,value = 246,job =3},

				    },
				},
--3级 
				{
					needJingHua = 50, 
					attr=
					{
				        {type = 9,value = 21,job =1},
				        {type = 11,value = 69,job =1},
						{type = 5,value = 414,job =1},

				        {type = 13,value = 21,job =2},
				        {type = 15,value = 69,job =2},
						{type = 5,value = 414,job =2},

				        {type = 17,value = 21,job =3},
				        {type = 19,value = 69,job =3},
						{type = 5,value = 414,job =3},

				    },
				},
--4级 
				{
					needJingHua = 60, 
					attr=
					{
				        {type = 9,value = 30,job =1},
				        {type = 11,value = 101,job =1},
						{type = 5,value = 606,job =1},

				        {type = 13,value = 30,job =2},
				        {type = 15,value = 101,job =2},
						{type = 5,value = 606,job =2},

				        {type = 17,value = 30,job =3},
				        {type = 19,value = 101,job =3},
						{type = 5,value = 606,job =3},

				    },
				},
--5级 
				{
					needJingHua = 70, 
					attr=
					{
				        {type = 9,value = 41,job =1},
				        {type = 11,value = 137,job =1},
						{type = 5,value = 822,job =1},

				        {type = 13,value = 41,job =2},
				        {type = 15,value = 137,job =2},
						{type = 5,value = 822,job =2},

				        {type = 17,value = 41,job =3},
				        {type = 19,value = 137,job =3},
						{type = 5,value = 822,job =3},

				    },
				},
--6级 
				{
					needJingHua = 80, 
					attr=
					{
				        {type = 9,value = 53,job =1},
				        {type = 11,value = 177,job =1},
						{type = 5,value = 1062,job =1},

				        {type = 13,value = 53,job =2},
				        {type = 15,value = 177,job =2},
						{type = 5,value = 1062,job =2},

				        {type = 17,value = 53,job =3},
				        {type = 19,value = 177,job =3},
						{type = 5,value = 1062,job =3},

				    },
				},
--7级 
				{
					needJingHua = 100, 
					attr=
					{
				        {type = 9,value = 68,job =1},
				        {type = 11,value = 225,job =1},
						{type = 5,value = 1350,job =1},

				        {type = 13,value = 68,job =2},
				        {type = 15,value = 225,job =2},
						{type = 5,value = 1350,job =2},

				        {type = 17,value = 68,job =3},
				        {type = 19,value = 225,job =3},
						{type = 5,value = 1350,job =3},

				    },
				},
--8级 
				{
					needJingHua = 120, 
					attr=
					{
				        {type = 9,value = 84,job =1},
				        {type = 11,value = 280,job =1},
						{type = 5,value = 1680,job =1},

				        {type = 13,value = 84,job =2},
				        {type = 15,value = 280,job =2},
						{type = 5,value = 1680,job =2},

				        {type = 17,value = 84,job =3},
				        {type = 19,value = 280,job =3},
						{type = 5,value = 1680,job =3},

				    },
				},
--9级 
				{
					needJingHua = 150, 
					attr=
					{
				        {type = 9,value = 104,job =1},
				        {type = 11,value = 346,job =1},
						{type = 5,value = 2076,job =1},

				        {type = 13,value = 104,job =2},
				        {type = 15,value = 346,job =2},
						{type = 5,value = 2076,job =2},

				        {type = 17,value = 104,job =3},
				        {type = 19,value = 346,job =3},
						{type = 5,value = 2076,job =3},

				    },
				},
--10级 
				{
					needJingHua = 200, 
					attr=
					{
				        {type = 9,value = 129,job =1},
				        {type = 11,value = 430,job =1},
						{type = 5,value = 2580,job =1},

				        {type = 13,value = 129,job =2},
				        {type = 15,value = 430,job =2},
						{type = 5,value = 2580,job =2},

				        {type = 17,value = 129,job =3},
				        {type = 19,value = 430,job =3},
						{type = 5,value = 2580,job =3},

				    },
				},
--11级 
				{
					needJingHua = 300, 
					attr=
					{
				        {type = 9,value = 165,job =1},
				        {type = 11,value = 550,job =1},
						{type = 5,value = 3300,job =1},

				        {type = 13,value = 165,job =2},
				        {type = 15,value = 550,job =2},
						{type = 5,value = 3300,job =2},

				        {type = 17,value = 165,job =3},
				        {type = 19,value = 550,job =3},
						{type = 5,value = 3300,job =3},

				    },
				},
--12级 
				{
					needJingHua = 400, 
					attr=
					{
				        {type = 9,value = 211,job =1},
				        {type = 11,value = 702,job =1},
						{type = 5,value = 4212,job =1},

				        {type = 13,value = 211,job =2},
				        {type = 15,value = 702,job =2},
						{type = 5,value = 4212,job =2},

				        {type = 17,value = 211,job =3},
				        {type = 19,value = 702,job =3},
						{type = 5,value = 4212,job =3},

				    },
				},
--13级 
				{
					needJingHua = 500, 
					attr=
					{
				        {type = 9,value = 265,job =1},
				        {type = 11,value = 882,job =1},
						{type = 5,value = 5292,job =1},

				        {type = 13,value = 265,job =2},
				        {type = 15,value = 882,job =2},
						{type = 5,value = 5292,job =2},

				        {type = 17,value = 265,job =3},
				        {type = 19,value = 882,job =3},
						{type = 5,value = 5292,job =3},

				    },
				},
--14级 
				{
					needJingHua = 600, 
					attr=
					{
				        {type = 9,value = 326,job =1},
				        {type = 11,value = 1086,job =1},
						{type = 5,value = 6516,job =1},

				        {type = 13,value = 326,job =2},
				        {type = 15,value = 1086,job =2},
						{type = 5,value = 6516,job =2},

				        {type = 17,value = 326,job =3},
				        {type = 19,value = 1086,job =3},
						{type = 5,value = 6516,job =3},

				    },
				},
--15级 
				{
					needJingHua = 700, 
					attr=
					{
				        {type = 9,value = 393,job =1},
				        {type = 11,value = 1310,job =1},
						{type = 5,value = 7860,job =1},

				        {type = 13,value = 393,job =2},
				        {type = 15,value = 1310,job =2},
						{type = 5,value = 7860,job =2},

				        {type = 17,value = 393,job =3},
				        {type = 19,value = 1310,job =3},
						{type = 5,value = 7860,job =3},

				    },
				},
--16级 
				{
					needJingHua = 800, 
					attr=
					{
				        {type = 9,value = 465,job =1},
				        {type = 11,value = 1550,job =1},
						{type = 5,value = 9300,job =1},

				        {type = 13,value = 465,job =2},
				        {type = 15,value = 1550,job =2},
						{type = 5,value = 9300,job =2},

				        {type = 17,value = 465,job =3},
				        {type = 19,value = 1550,job =3},
						{type = 5,value = 9300,job =3},

				    },
				},
--17级 
				{
					needJingHua = 900, 
					attr=
					{
				        {type = 9,value = 541,job =1},
				        {type = 11,value = 1802,job =1},
						{type = 5,value = 10812,job =1},

				        {type = 13,value = 541,job =2},
				        {type = 15,value = 1802,job =2},
						{type = 5,value = 10812,job =2},

				        {type = 17,value = 541,job =3},
				        {type = 19,value = 1802,job =3},
						{type = 5,value = 10812,job =3},

				    },
				},
--18级 
				{
					needJingHua = 1000, 
					attr=
					{
				        {type = 9,value = 619,job =1},
				        {type = 11,value = 2062,job =1},
						{type = 5,value = 12372,job =1},

				        {type = 13,value = 619,job =2},
				        {type = 15,value = 2062,job =2},
						{type = 5,value = 12372,job =2},

				        {type = 17,value = 619,job =3},
				        {type = 19,value = 2062,job =3},
						{type = 5,value = 12372,job =3},

				    },
				},
--19级 
				{
					needJingHua = 1100, 
					attr=
					{
				        {type = 9,value = 698,job =1},
				        {type = 11,value = 2326,job =1},
						{type = 5,value = 13956,job =1},

				        {type = 13,value = 698,job =2},
				        {type = 15,value = 2326,job =2},
						{type = 5,value = 13956,job =2},

				        {type = 17,value = 698,job =3},
				        {type = 19,value = 2326,job =3},
						{type = 5,value = 13956,job =3},

				    },
				},
--20级 
				{
					needJingHua = 1200, 
					attr=
					{
				        {type = 9,value = 777,job =1},
				        {type = 11,value = 2590,job =1},
						{type = 5,value = 15540,job =1},

				        {type = 13,value = 777,job =2},
				        {type = 15,value = 2590,job =2},
						{type = 5,value = 15540,job =2},

				        {type = 17,value = 777,job =3},
				        {type = 19,value = 2590,job =3},
						{type = 5,value = 15540,job =3},

				    },
				},
--21级 
				{
					needJingHua = 1300, 
					attr=
					{
				        {type = 9,value = 855,job =1},
				        {type = 11,value = 2850,job =1},
						{type = 5,value = 17100,job =1},

				        {type = 13,value = 855,job =2},
				        {type = 15,value = 2850,job =2},
						{type = 5,value = 17100,job =2},

				        {type = 17,value = 855,job =3},
				        {type = 19,value = 2850,job =3},
						{type = 5,value = 17100,job =3},

				    },
				},
--22级 
				{
					needJingHua = 1400, 
					attr=
					{
				        {type = 9,value = 931,job =1},
				        {type = 11,value = 3102,job =1},
						{type = 5,value = 18612,job =1},

				        {type = 13,value = 931,job =2},
				        {type = 15,value = 3102,job =2},
						{type = 5,value = 18612,job =2},

				        {type = 17,value = 931,job =3},
				        {type = 19,value = 3102,job =3},
						{type = 5,value = 18612,job =3},

				    },
				},
--23级 
				{
					needJingHua = 1500, 
					attr=
					{
				        {type = 9,value = 1003,job =1},
				        {type = 11,value = 3342,job =1},
						{type = 5,value = 20052,job =1},

				        {type = 13,value = 1003,job =2},
				        {type = 15,value = 3342,job =2},
						{type = 5,value = 20052,job =2},

				        {type = 17,value = 1003,job =3},
				        {type = 19,value = 3342,job =3},
						{type = 5,value = 20052,job =3},

				    },
				},
--24级 
				{
					needJingHua = 1600, 
					attr=
					{
				        {type = 9,value = 1070,job =1},
				        {type = 11,value = 3566,job =1},
						{type = 5,value = 21396,job =1},

				        {type = 13,value = 1070,job =2},
				        {type = 15,value = 3566,job =2},
						{type = 5,value = 21396,job =2},

				        {type = 17,value = 1070,job =3},
				        {type = 19,value = 3566,job =3},
						{type = 5,value = 21396,job =3},

				    },
				},
--25级 
				{
					needJingHua = 1700, 
					attr=
					{
				        {type = 9,value = 1131,job =1},
				        {type = 11,value = 3770,job =1},
						{type = 5,value = 22620,job =1},

				        {type = 13,value = 1131,job =2},
				        {type = 15,value = 3770,job =2},
						{type = 5,value = 22620,job =2},

				        {type = 17,value = 1131,job =3},
				        {type = 19,value = 3770,job =3},
						{type = 5,value = 22620,job =3},

				    },
				},
--26级 
				{
					needJingHua = 1800, 
					attr=
					{
				        {type = 9,value = 1185,job =1},
				        {type = 11,value = 3950,job =1},
						{type = 5,value = 23700,job =1},

				        {type = 13,value = 1185,job =2},
				        {type = 15,value = 3950,job =2},
						{type = 5,value = 23700,job =2},

				        {type = 17,value = 1185,job =3},
				        {type = 19,value = 3950,job =3},
						{type = 5,value = 23700,job =3},

				    },
				},
--27级 
				{
					needJingHua = 1900, 
					attr=
					{
				        {type = 9,value = 1231,job =1},
				        {type = 11,value = 4102,job =1},
						{type = 5,value = 24612,job =1},

				        {type = 13,value = 1231,job =2},
				        {type = 15,value = 4102,job =2},
						{type = 5,value = 24612,job =2},

				        {type = 17,value = 1231,job =3},
				        {type = 19,value = 4102,job =3},
						{type = 5,value = 24612,job =3},

				    },
				},
--28级 
				{
					needJingHua = 2000, 
					attr=
					{
				        {type = 9,value = 1273,job =1},
				        {type = 11,value = 4242,job =1},
						{type = 5,value = 25452,job =1},

				        {type = 13,value = 1273,job =2},
				        {type = 15,value = 4242,job =2},
						{type = 5,value = 25452,job =2},

				        {type = 17,value = 1273,job =3},
				        {type = 19,value = 4242,job =3},
						{type = 5,value = 25452,job =3},

				    },
				},
--29级 
				{
					needJingHua = 2100, 
					attr=
					{
				        {type = 9,value = 1310,job =1},
				        {type = 11,value = 4368,job =1},
						{type = 5,value = 26208,job =1},

				        {type = 13,value = 1310,job =2},
				        {type = 15,value = 4368,job =2},
						{type = 5,value = 26208,job =2},

				        {type = 17,value = 1310,job =3},
				        {type = 19,value = 4368,job =3},
						{type = 5,value = 26208,job =3},

				    },
				},
--30级 
				{
					needJingHua = 2200, 
					attr=
					{
				        {type = 9,value = 1350,job =1},
				        {type = 11,value = 4500,job =1},
						{type = 5,value = 27000,job =1},

				        {type = 13,value = 1350,job =2},
				        {type = 15,value = 4500,job =2},
						{type = 5,value = 27000,job =2},

				        {type = 17,value = 1350,job =3},
				        {type = 19,value = 4500,job =3},
						{type = 5,value = 27000,job =3},

				    },
				},
--31级 
				{
					needJingHua = 2300, 
					attr=
					{
				        {type = 9,value = 1391,job =1},
				        {type = 11,value = 4638,job =1},
						{type = 5,value = 27828,job =1},

				        {type = 13,value = 1391,job =2},
				        {type = 15,value = 4638,job =2},
						{type = 5,value = 27828,job =2},

				        {type = 17,value = 1391,job =3},
				        {type = 19,value = 4638,job =3},
						{type = 5,value = 27828,job =3},

				    },
				},
--32级 
				{
					needJingHua = 2400, 
					attr=
					{
				        {type = 9,value = 1435,job =1},
				        {type = 11,value = 4782,job =1},
						{type = 5,value = 28692,job =1},

				        {type = 13,value = 1435,job =2},
				        {type = 15,value = 4782,job =2},
						{type = 5,value = 28692,job =2},

				        {type = 17,value = 1435,job =3},
				        {type = 19,value = 4782,job =3},
						{type = 5,value = 28692,job =3},

				    },
				},
--33级 
				{
					needJingHua = 2500, 
					attr=
					{
				        {type = 9,value = 1480,job =1},
				        {type = 11,value = 4932,job =1},
						{type = 5,value = 29592,job =1},

				        {type = 13,value = 1480,job =2},
				        {type = 15,value = 4932,job =2},
						{type = 5,value = 29592,job =2},

				        {type = 17,value = 1480,job =3},
				        {type = 19,value = 4932,job =3},
						{type = 5,value = 29592,job =3},

				    },
				},
--34级 
				{
					needJingHua = 2600, 
					attr=
					{
				        {type = 9,value = 1526,job =1},
				        {type = 11,value = 5088,job =1},
						{type = 5,value = 30528,job =1},

				        {type = 13,value = 1526,job =2},
				        {type = 15,value = 5088,job =2},
						{type = 5,value = 30528,job =2},

				        {type = 17,value = 1526,job =3},
				        {type = 19,value = 5088,job =3},
						{type = 5,value = 30528,job =3},

				    },
				},
--35级 
				{
					needJingHua = 2700, 
					attr=
					{
				        {type = 9,value = 1575,job =1},
				        {type = 11,value = 5250,job =1},
						{type = 5,value = 31500,job =1},

				        {type = 13,value = 1575,job =2},
				        {type = 15,value = 5250,job =2},
						{type = 5,value = 31500,job =2},

				        {type = 17,value = 1575,job =3},
				        {type = 19,value = 5250,job =3},
						{type = 5,value = 31500,job =3},

				    },
				},
--36级 
				{
					needJingHua = 2800, 
					attr=
					{
				        {type = 9,value = 1625,job =1},
				        {type = 11,value = 5418,job =1},
						{type = 5,value = 32508,job =1},

				        {type = 13,value = 1625,job =2},
				        {type = 15,value = 5418,job =2},
						{type = 5,value = 32508,job =2},

				        {type = 17,value = 1625,job =3},
				        {type = 19,value = 5418,job =3},
						{type = 5,value = 32508,job =3},

				    },
				},
--37级 
				{
					needJingHua = 2900, 
					attr=
					{
				        {type = 9,value = 1678,job =1},
				        {type = 11,value = 5592,job =1},
						{type = 5,value = 33552,job =1},

				        {type = 13,value = 1678,job =2},
				        {type = 15,value = 5592,job =2},
						{type = 5,value = 33552,job =2},

				        {type = 17,value = 1678,job =3},
				        {type = 19,value = 5592,job =3},
						{type = 5,value = 33552,job =3},

				    },
				},
--38级 
				{
					needJingHua = 3000, 
					attr=
					{
				        {type = 9,value = 1732,job =1},
				        {type = 11,value = 5772,job =1},
						{type = 5,value = 34632,job =1},

				        {type = 13,value = 1732,job =2},
				        {type = 15,value = 5772,job =2},
						{type = 5,value = 34632,job =2},

				        {type = 17,value = 1732,job =3},
				        {type = 19,value = 5772,job =3},
						{type = 5,value = 34632,job =3},

				    },
				},
--39级 
				{
					needJingHua = 3100, 
					attr=
					{
				        {type = 9,value = 1787,job =1},
				        {type = 11,value = 5958,job =1},
						{type = 5,value = 35748,job =1},

				        {type = 13,value = 1787,job =2},
				        {type = 15,value = 5958,job =2},
						{type = 5,value = 35748,job =2},

				        {type = 17,value = 1787,job =3},
				        {type = 19,value = 5958,job =3},
						{type = 5,value = 35748,job =3},

				    },
				},
--40级 
				{
					needJingHua = 3200, 
					attr=
					{
				        {type = 9,value = 1845,job =1},
				        {type = 11,value = 6150,job =1},
						{type = 5,value = 36900,job =1},

				        {type = 13,value = 1845,job =2},
				        {type = 15,value = 6150,job =2},
						{type = 5,value = 36900,job =2},

				        {type = 17,value = 1845,job =3},
				        {type = 19,value = 6150,job =3},
						{type = 5,value = 36900,job =3},

				    },
				},
--41级 
				{
					needJingHua = 3300, 
					attr=
					{
				        {type = 9,value = 1904,job =1},
				        {type = 11,value = 6348,job =1},
						{type = 5,value = 38088,job =1},

				        {type = 13,value = 1904,job =2},
				        {type = 15,value = 6348,job =2},
						{type = 5,value = 38088,job =2},

				        {type = 17,value = 1904,job =3},
				        {type = 19,value = 6348,job =3},
						{type = 5,value = 38088,job =3},

				    },
				},
--42级 
				{
					needJingHua = 3400, 
					attr=
					{
				        {type = 9,value = 1966,job =1},
				        {type = 11,value = 6552,job =1},
						{type = 5,value = 39312,job =1},

				        {type = 13,value = 1966,job =2},
				        {type = 15,value = 6552,job =2},
						{type = 5,value = 39312,job =2},

				        {type = 17,value = 1966,job =3},
				        {type = 19,value = 6552,job =3},
						{type = 5,value = 39312,job =3},

				    },
				},
--43级 
				{
					needJingHua = 3500, 
					attr=
					{
				        {type = 9,value = 2029,job =1},
				        {type = 11,value = 6762,job =1},
						{type = 5,value = 40572,job =1},

				        {type = 13,value = 2029,job =2},
				        {type = 15,value = 6762,job =2},
						{type = 5,value = 40572,job =2},

				        {type = 17,value = 2029,job =3},
				        {type = 19,value = 6762,job =3},
						{type = 5,value = 40572,job =3},

				    },
				},
--44级 
				{
					needJingHua = 3600, 
					attr=
					{
				        {type = 9,value = 2093,job =1},
				        {type = 11,value = 6978,job =1},
						{type = 5,value = 41868,job =1},

				        {type = 13,value = 2093,job =2},
				        {type = 15,value = 6978,job =2},
						{type = 5,value = 41868,job =2},

				        {type = 17,value = 2093,job =3},
				        {type = 19,value = 6978,job =3},
						{type = 5,value = 41868,job =3},

				    },
				},
--45级 
				{
					needJingHua = 3700, 
					attr=
					{
				        {type = 9,value = 2160,job =1},
				        {type = 11,value = 7200,job =1},
						{type = 5,value = 43200,job =1},

				        {type = 13,value = 2160,job =2},
				        {type = 15,value = 7200,job =2},
						{type = 5,value = 43200,job =2},

				        {type = 17,value = 2160,job =3},
				        {type = 19,value = 7200,job =3},
						{type = 5,value = 43200,job =3},

				    },
				},
--46级 
				{
					needJingHua = 3800, 
					attr=
					{
				        {type = 9,value = 2228,job =1},
				        {type = 11,value = 7428,job =1},
						{type = 5,value = 44568,job =1},

				        {type = 13,value = 2228,job =2},
				        {type = 15,value = 7428,job =2},
						{type = 5,value = 44568,job =2},

				        {type = 17,value = 2228,job =3},
				        {type = 19,value = 7428,job =3},
						{type = 5,value = 44568,job =3},

				    },
				},
--47级 
				{
					needJingHua = 3900, 
					attr=
					{
				        {type = 9,value = 2299,job =1},
				        {type = 11,value = 7662,job =1},
						{type = 5,value = 45972,job =1},

				        {type = 13,value = 2299,job =2},
				        {type = 15,value = 7662,job =2},
						{type = 5,value = 45972,job =2},

				        {type = 17,value = 2299,job =3},
				        {type = 19,value = 7662,job =3},
						{type = 5,value = 45972,job =3},

				    },
				},
--48级 
				{
					needJingHua = 4000, 
					attr=
					{
				        {type = 9,value = 2371,job =1},
				        {type = 11,value = 7902,job =1},
						{type = 5,value = 47412,job =1},

				        {type = 13,value = 2371,job =2},
				        {type = 15,value = 7902,job =2},
						{type = 5,value = 47412,job =2},

				        {type = 17,value = 2371,job =3},
				        {type = 19,value = 7902,job =3},
						{type = 5,value = 47412,job =3},

				    },
				},
--49级 
				{
					needJingHua = 4100, 
					attr=
					{
				        {type = 9,value = 2444,job =1},
				        {type = 11,value = 8148,job =1},
						{type = 5,value = 48888,job =1},

				        {type = 13,value = 2444,job =2},
				        {type = 15,value = 8148,job =2},
						{type = 5,value = 48888,job =2},

				        {type = 17,value = 2444,job =3},
				        {type = 19,value = 8148,job =3},
						{type = 5,value = 48888,job =3},

				    },
				},
--50级 
				{
					needJingHua = 4200, 
					attr=
					{
				        {type = 9,value = 2520,job =1},
				        {type = 11,value = 8400,job =1},
						{type = 5,value = 50400,job =1},

				        {type = 13,value = 2520,job =2},
				        {type = 15,value = 8400,job =2},
						{type = 5,value = 50400,job =2},

				        {type = 17,value = 2520,job =3},
				        {type = 19,value = 8400,job =3},
						{type = 5,value = 50400,job =3},

				    },
				},

	
			
			
			},
		},
	
	
		{	
			position = 9,
			name = "腰带",
			level=
			{
	--1级 
				{
					needJingHua = 30, 
					attr=
					{
				        {type = 126,value = 10,job =1},
				        {type = 127,value = 18,job =1},

				        {type = 126,value = 10,job =2},
				        {type = 127,value = 18,job =2},

				        {type = 126,value = 10,job =3},
				        {type = 127,value = 18,job =3},

				    },
				},
--2级 
				{
					needJingHua = 40, 
					attr=
					{
				        {type = 126,value = 20,job =1},
				        {type = 127,value = 41,job =1},

				        {type = 126,value = 20,job =2},
				        {type = 127,value = 41,job =2},

				        {type = 126,value = 20,job =3},
				        {type = 127,value = 41,job =3},

				    },
				},
--3级 
				{
					needJingHua = 50, 
					attr=
					{
				        {type = 126,value = 30,job =1},
				        {type = 127,value = 69,job =1},

				        {type = 126,value = 30,job =2},
				        {type = 127,value = 69,job =2},

				        {type = 126,value = 30,job =3},
				        {type = 127,value = 69,job =3},

				    },
				},
--4级 
				{
					needJingHua = 60, 
					attr=
					{
				        {type = 126,value = 40,job =1},
				        {type = 127,value = 101,job =1},

				        {type = 126,value = 40,job =2},
				        {type = 127,value = 101,job =2},

				        {type = 126,value = 40,job =3},
				        {type = 127,value = 101,job =3},

				    },
				},
--5级 
				{
					needJingHua = 70, 
					attr=
					{
				        {type = 126,value = 50,job =1},
				        {type = 127,value = 137,job =1},

				        {type = 126,value = 50,job =2},
				        {type = 127,value = 137,job =2},

				        {type = 126,value = 50,job =3},
				        {type = 127,value = 137,job =3},

				    },
				},
--6级 
				{
					needJingHua = 80, 
					attr=
					{
				        {type = 126,value = 60,job =1},
				        {type = 127,value = 177,job =1},

				        {type = 126,value = 60,job =2},
				        {type = 127,value = 177,job =2},

				        {type = 126,value = 60,job =3},
				        {type = 127,value = 177,job =3},

				    },
				},
--7级 
				{
					needJingHua = 100, 
					attr=
					{
				        {type = 126,value = 70,job =1},
				        {type = 127,value = 225,job =1},

				        {type = 126,value = 70,job =2},
				        {type = 127,value = 225,job =2},

				        {type = 126,value = 70,job =3},
				        {type = 127,value = 225,job =3},

				    },
				},
--8级 
				{
					needJingHua = 120, 
					attr=
					{
				        {type = 126,value = 80,job =1},
				        {type = 127,value = 280,job =1},

				        {type = 126,value = 80,job =2},
				        {type = 127,value = 280,job =2},

				        {type = 126,value = 80,job =3},
				        {type = 127,value = 280,job =3},

				    },
				},
--9级 
				{
					needJingHua = 150, 
					attr=
					{
				        {type = 126,value = 90,job =1},
				        {type = 127,value = 346,job =1},

				        {type = 126,value = 90,job =2},
				        {type = 127,value = 346,job =2},

				        {type = 126,value = 90,job =3},
				        {type = 127,value = 346,job =3},

				    },
				},
--10级 
				{
					needJingHua = 200, 
					attr=
					{
				        {type = 126,value = 100,job =1},
				        {type = 127,value = 430,job =1},

				        {type = 126,value = 100,job =2},
				        {type = 127,value = 430,job =2},

				        {type = 126,value = 100,job =3},
				        {type = 127,value = 430,job =3},

				    },
				},
--11级 
				{
					needJingHua = 300, 
					attr=
					{
				        {type = 126,value = 110,job =1},
				        {type = 127,value = 550,job =1},

				        {type = 126,value = 110,job =2},
				        {type = 127,value = 550,job =2},

				        {type = 126,value = 110,job =3},
				        {type = 127,value = 550,job =3},

				    },
				},
--12级 
				{
					needJingHua = 400, 
					attr=
					{
				        {type = 126,value = 120,job =1},
				        {type = 127,value = 702,job =1},

				        {type = 126,value = 120,job =2},
				        {type = 127,value = 702,job =2},

				        {type = 126,value = 120,job =3},
				        {type = 127,value = 702,job =3},

				    },
				},
--13级 
				{
					needJingHua = 500, 
					attr=
					{
				        {type = 126,value = 130,job =1},
				        {type = 127,value = 882,job =1},

				        {type = 126,value = 130,job =2},
				        {type = 127,value = 882,job =2},

				        {type = 126,value = 130,job =3},
				        {type = 127,value = 882,job =3},

				    },
				},
--14级 
				{
					needJingHua = 600, 
					attr=
					{
				        {type = 126,value = 140,job =1},
				        {type = 127,value = 1086,job =1},

				        {type = 126,value = 140,job =2},
				        {type = 127,value = 1086,job =2},

				        {type = 126,value = 140,job =3},
				        {type = 127,value = 1086,job =3},

				    },
				},
--15级 
				{
					needJingHua = 700, 
					attr=
					{
				        {type = 126,value = 150,job =1},
				        {type = 127,value = 1310,job =1},

				        {type = 126,value = 150,job =2},
				        {type = 127,value = 1310,job =2},

				        {type = 126,value = 150,job =3},
				        {type = 127,value = 1310,job =3},

				    },
				},
--16级 
				{
					needJingHua = 800, 
					attr=
					{
				        {type = 126,value = 160,job =1},
				        {type = 127,value = 1550,job =1},

				        {type = 126,value = 160,job =2},
				        {type = 127,value = 1550,job =2},

				        {type = 126,value = 160,job =3},
				        {type = 127,value = 1550,job =3},

				    },
				},
--17级 
				{
					needJingHua = 900, 
					attr=
					{
				        {type = 126,value = 170,job =1},
				        {type = 127,value = 1802,job =1},

				        {type = 126,value = 170,job =2},
				        {type = 127,value = 1802,job =2},

				        {type = 126,value = 170,job =3},
				        {type = 127,value = 1802,job =3},

				    },
				},
--18级 
				{
					needJingHua = 1000, 
					attr=
					{
				        {type = 126,value = 180,job =1},
				        {type = 127,value = 2062,job =1},

				        {type = 126,value = 180,job =2},
				        {type = 127,value = 2062,job =2},

				        {type = 126,value = 180,job =3},
				        {type = 127,value = 2062,job =3},

				    },
				},
--19级 
				{
					needJingHua = 1100, 
					attr=
					{
				        {type = 126,value = 190,job =1},
				        {type = 127,value = 2326,job =1},

				        {type = 126,value = 190,job =2},
				        {type = 127,value = 2326,job =2},

				        {type = 126,value = 190,job =3},
				        {type = 127,value = 2326,job =3},

				    },
				},
--20级 
				{
					needJingHua = 1200, 
					attr=
					{
				        {type = 126,value = 200,job =1},
				        {type = 127,value = 2590,job =1},

				        {type = 126,value = 200,job =2},
				        {type = 127,value = 2590,job =2},

				        {type = 126,value = 200,job =3},
				        {type = 127,value = 2590,job =3},

				    },
				},
--21级 
				{
					needJingHua = 1300, 
					attr=
					{
				        {type = 126,value = 210,job =1},
				        {type = 127,value = 2850,job =1},

				        {type = 126,value = 210,job =2},
				        {type = 127,value = 2850,job =2},

				        {type = 126,value = 210,job =3},
				        {type = 127,value = 2850,job =3},

				    },
				},
--22级 
				{
					needJingHua = 1400, 
					attr=
					{
				        {type = 126,value = 220,job =1},
				        {type = 127,value = 3102,job =1},

				        {type = 126,value = 220,job =2},
				        {type = 127,value = 3102,job =2},

				        {type = 126,value = 220,job =3},
				        {type = 127,value = 3102,job =3},

				    },
				},
--23级 
				{
					needJingHua = 1500, 
					attr=
					{
				        {type = 126,value = 230,job =1},
				        {type = 127,value = 3342,job =1},

				        {type = 126,value = 230,job =2},
				        {type = 127,value = 3342,job =2},

				        {type = 126,value = 230,job =3},
				        {type = 127,value = 3342,job =3},

				    },
				},
--24级 
				{
					needJingHua = 1600, 
					attr=
					{
				        {type = 126,value = 240,job =1},
				        {type = 127,value = 3566,job =1},

				        {type = 126,value = 240,job =2},
				        {type = 127,value = 3566,job =2},

				        {type = 126,value = 240,job =3},
				        {type = 127,value = 3566,job =3},

				    },
				},
--25级 
				{
					needJingHua = 1700, 
					attr=
					{
				        {type = 126,value = 250,job =1},
				        {type = 127,value = 3770,job =1},

				        {type = 126,value = 250,job =2},
				        {type = 127,value = 3770,job =2},

				        {type = 126,value = 250,job =3},
				        {type = 127,value = 3770,job =3},

				    },
				},
--26级 
				{
					needJingHua = 1800, 
					attr=
					{
				        {type = 126,value = 260,job =1},
				        {type = 127,value = 3950,job =1},

				        {type = 126,value = 260,job =2},
				        {type = 127,value = 3950,job =2},

				        {type = 126,value = 260,job =3},
				        {type = 127,value = 3950,job =3},

				    },
				},
--27级 
				{
					needJingHua = 1900, 
					attr=
					{
				        {type = 126,value = 270,job =1},
				        {type = 127,value = 4102,job =1},

				        {type = 126,value = 270,job =2},
				        {type = 127,value = 4102,job =2},

				        {type = 126,value = 270,job =3},
				        {type = 127,value = 4102,job =3},

				    },
				},
--28级 
				{
					needJingHua = 2000, 
					attr=
					{
				        {type = 126,value = 280,job =1},
				        {type = 127,value = 4242,job =1},

				        {type = 126,value = 280,job =2},
				        {type = 127,value = 4242,job =2},

				        {type = 126,value = 280,job =3},
				        {type = 127,value = 4242,job =3},

				    },
				},
--29级 
				{
					needJingHua = 2100, 
					attr=
					{
				        {type = 126,value = 290,job =1},
				        {type = 127,value = 4368,job =1},

				        {type = 126,value = 290,job =2},
				        {type = 127,value = 4368,job =2},

				        {type = 126,value = 290,job =3},
				        {type = 127,value = 4368,job =3},

				    },
				},
--30级 
				{
					needJingHua = 2200, 
					attr=
					{
				        {type = 126,value = 300,job =1},
				        {type = 127,value = 4500,job =1},

				        {type = 126,value = 300,job =2},
				        {type = 127,value = 4500,job =2},

				        {type = 126,value = 300,job =3},
				        {type = 127,value = 4500,job =3},

				    },
				},
--31级 
				{
					needJingHua = 2300, 
					attr=
					{
				        {type = 126,value = 310,job =1},
				        {type = 127,value = 4638,job =1},

				        {type = 126,value = 310,job =2},
				        {type = 127,value = 4638,job =2},

				        {type = 126,value = 310,job =3},
				        {type = 127,value = 4638,job =3},

				    },
				},
--32级 
				{
					needJingHua = 2400, 
					attr=
					{
				        {type = 126,value = 320,job =1},
				        {type = 127,value = 4782,job =1},

				        {type = 126,value = 320,job =2},
				        {type = 127,value = 4782,job =2},

				        {type = 126,value = 320,job =3},
				        {type = 127,value = 4782,job =3},

				    },
				},
--33级 
				{
					needJingHua = 2500, 
					attr=
					{
				        {type = 126,value = 330,job =1},
				        {type = 127,value = 4932,job =1},

				        {type = 126,value = 330,job =2},
				        {type = 127,value = 4932,job =2},

				        {type = 126,value = 330,job =3},
				        {type = 127,value = 4932,job =3},

				    },
				},
--34级 
				{
					needJingHua = 2600, 
					attr=
					{
				        {type = 126,value = 340,job =1},
				        {type = 127,value = 5088,job =1},

				        {type = 126,value = 340,job =2},
				        {type = 127,value = 5088,job =2},

				        {type = 126,value = 340,job =3},
				        {type = 127,value = 5088,job =3},

				    },
				},
--35级 
				{
					needJingHua = 2700, 
					attr=
					{
				        {type = 126,value = 350,job =1},
				        {type = 127,value = 5250,job =1},

				        {type = 126,value = 350,job =2},
				        {type = 127,value = 5250,job =2},

				        {type = 126,value = 350,job =3},
				        {type = 127,value = 5250,job =3},

				    },
				},
--36级 
				{
					needJingHua = 2800, 
					attr=
					{
				        {type = 126,value = 360,job =1},
				        {type = 127,value = 5418,job =1},

				        {type = 126,value = 360,job =2},
				        {type = 127,value = 5418,job =2},

				        {type = 126,value = 360,job =3},
				        {type = 127,value = 5418,job =3},

				    },
				},
--37级 
				{
					needJingHua = 2900, 
					attr=
					{
				        {type = 126,value = 370,job =1},
				        {type = 127,value = 5592,job =1},

				        {type = 126,value = 370,job =2},
				        {type = 127,value = 5592,job =2},

				        {type = 126,value = 370,job =3},
				        {type = 127,value = 5592,job =3},

				    },
				},
--38级 
				{
					needJingHua = 3000, 
					attr=
					{
				        {type = 126,value = 380,job =1},
				        {type = 127,value = 5772,job =1},

				        {type = 126,value = 380,job =2},
				        {type = 127,value = 5772,job =2},

				        {type = 126,value = 380,job =3},
				        {type = 127,value = 5772,job =3},

				    },
				},
--39级 
				{
					needJingHua = 3100, 
					attr=
					{
				        {type = 126,value = 390,job =1},
				        {type = 127,value = 5958,job =1},

				        {type = 126,value = 390,job =2},
				        {type = 127,value = 5958,job =2},

				        {type = 126,value = 390,job =3},
				        {type = 127,value = 5958,job =3},

				    },
				},
--40级 
				{
					needJingHua = 3200, 
					attr=
					{
				        {type = 126,value = 400,job =1},
				        {type = 127,value = 6150,job =1},

				        {type = 126,value = 400,job =2},
				        {type = 127,value = 6150,job =2},

				        {type = 126,value = 400,job =3},
				        {type = 127,value = 6150,job =3},

				    },
				},
--41级 
				{
					needJingHua = 3300, 
					attr=
					{
				        {type = 126,value = 410,job =1},
				        {type = 127,value = 6348,job =1},

				        {type = 126,value = 410,job =2},
				        {type = 127,value = 6348,job =2},

				        {type = 126,value = 410,job =3},
				        {type = 127,value = 6348,job =3},

				    },
				},
--42级 
				{
					needJingHua = 3400, 
					attr=
					{
				        {type = 126,value = 420,job =1},
				        {type = 127,value = 6552,job =1},

				        {type = 126,value = 420,job =2},
				        {type = 127,value = 6552,job =2},

				        {type = 126,value = 420,job =3},
				        {type = 127,value = 6552,job =3},

				    },
				},
--43级 
				{
					needJingHua = 3500, 
					attr=
					{
				        {type = 126,value = 430,job =1},
				        {type = 127,value = 6762,job =1},

				        {type = 126,value = 430,job =2},
				        {type = 127,value = 6762,job =2},

				        {type = 126,value = 430,job =3},
				        {type = 127,value = 6762,job =3},

				    },
				},
--44级 
				{
					needJingHua = 3600, 
					attr=
					{
				        {type = 126,value = 440,job =1},
				        {type = 127,value = 6978,job =1},

				        {type = 126,value = 440,job =2},
				        {type = 127,value = 6978,job =2},

				        {type = 126,value = 440,job =3},
				        {type = 127,value = 6978,job =3},

				    },
				},
--45级 
				{
					needJingHua = 3700, 
					attr=
					{
				        {type = 126,value = 450,job =1},
				        {type = 127,value = 7200,job =1},

				        {type = 126,value = 450,job =2},
				        {type = 127,value = 7200,job =2},

				        {type = 126,value = 450,job =3},
				        {type = 127,value = 7200,job =3},

				    },
				},
--46级 
				{
					needJingHua = 3800, 
					attr=
					{
				        {type = 126,value = 460,job =1},
				        {type = 127,value = 7428,job =1},

				        {type = 126,value = 460,job =2},
				        {type = 127,value = 7428,job =2},

				        {type = 126,value = 460,job =3},
				        {type = 127,value = 7428,job =3},

				    },
				},
--47级 
				{
					needJingHua = 3900, 
					attr=
					{
				        {type = 126,value = 470,job =1},
				        {type = 127,value = 7662,job =1},

				        {type = 126,value = 470,job =2},
				        {type = 127,value = 7662,job =2},

				        {type = 126,value = 470,job =3},
				        {type = 127,value = 7662,job =3},

				    },
				},
--48级 
				{
					needJingHua = 4000, 
					attr=
					{
				        {type = 126,value = 480,job =1},
				        {type = 127,value = 7902,job =1},

				        {type = 126,value = 480,job =2},
				        {type = 127,value = 7902,job =2},

				        {type = 126,value = 480,job =3},
				        {type = 127,value = 7902,job =3},

				    },
				},
--49级 
				{
					needJingHua = 4100, 
					attr=
					{
				        {type = 126,value = 490,job =1},
				        {type = 127,value = 8148,job =1},

				        {type = 126,value = 490,job =2},
				        {type = 127,value = 8148,job =2},

				        {type = 126,value = 490,job =3},
				        {type = 127,value = 8148,job =3},

				    },
				},
--50级 
				{
					needJingHua = 4200, 
					attr=
					{
				        {type = 126,value = 500,job =1},
				        {type = 127,value = 8400,job =1},

				        {type = 126,value = 500,job =2},
				        {type = 127,value = 8400,job =2},

				        {type = 126,value = 500,job =3},
				        {type = 127,value = 8400,job =3},

				    },
				},

	
			
			
			},
		},
	
		{	
			position = 10,
			name = "靴子",
			level=
			{
	--1级 
				{
					needJingHua = 30, 
					attr=
					{
				        {type = 126,value = 10,job =1},
				        {type = 127,value = 18,job =1},

				        {type = 126,value = 10,job =2},
				        {type = 127,value = 18,job =2},

				        {type = 126,value = 10,job =3},
				        {type = 127,value = 18,job =3},

				    },
				},
--2级 
				{
					needJingHua = 40, 
					attr=
					{
				        {type = 126,value = 20,job =1},
				        {type = 127,value = 41,job =1},

				        {type = 126,value = 20,job =2},
				        {type = 127,value = 41,job =2},

				        {type = 126,value = 20,job =3},
				        {type = 127,value = 41,job =3},

				    },
				},
--3级 
				{
					needJingHua = 50, 
					attr=
					{
				        {type = 126,value = 30,job =1},
				        {type = 127,value = 69,job =1},

				        {type = 126,value = 30,job =2},
				        {type = 127,value = 69,job =2},

				        {type = 126,value = 30,job =3},
				        {type = 127,value = 69,job =3},

				    },
				},
--4级 
				{
					needJingHua = 60, 
					attr=
					{
				        {type = 126,value = 40,job =1},
				        {type = 127,value = 101,job =1},

				        {type = 126,value = 40,job =2},
				        {type = 127,value = 101,job =2},

				        {type = 126,value = 40,job =3},
				        {type = 127,value = 101,job =3},

				    },
				},
--5级 
				{
					needJingHua = 70, 
					attr=
					{
				        {type = 126,value = 50,job =1},
				        {type = 127,value = 137,job =1},

				        {type = 126,value = 50,job =2},
				        {type = 127,value = 137,job =2},

				        {type = 126,value = 50,job =3},
				        {type = 127,value = 137,job =3},

				    },
				},
--6级 
				{
					needJingHua = 80, 
					attr=
					{
				        {type = 126,value = 60,job =1},
				        {type = 127,value = 177,job =1},

				        {type = 126,value = 60,job =2},
				        {type = 127,value = 177,job =2},

				        {type = 126,value = 60,job =3},
				        {type = 127,value = 177,job =3},

				    },
				},
--7级 
				{
					needJingHua = 100, 
					attr=
					{
				        {type = 126,value = 70,job =1},
				        {type = 127,value = 225,job =1},

				        {type = 126,value = 70,job =2},
				        {type = 127,value = 225,job =2},

				        {type = 126,value = 70,job =3},
				        {type = 127,value = 225,job =3},

				    },
				},
--8级 
				{
					needJingHua = 120, 
					attr=
					{
				        {type = 126,value = 80,job =1},
				        {type = 127,value = 280,job =1},

				        {type = 126,value = 80,job =2},
				        {type = 127,value = 280,job =2},

				        {type = 126,value = 80,job =3},
				        {type = 127,value = 280,job =3},

				    },
				},
--9级 
				{
					needJingHua = 150, 
					attr=
					{
				        {type = 126,value = 90,job =1},
				        {type = 127,value = 346,job =1},

				        {type = 126,value = 90,job =2},
				        {type = 127,value = 346,job =2},

				        {type = 126,value = 90,job =3},
				        {type = 127,value = 346,job =3},

				    },
				},
--10级 
				{
					needJingHua = 200, 
					attr=
					{
				        {type = 126,value = 100,job =1},
				        {type = 127,value = 430,job =1},

				        {type = 126,value = 100,job =2},
				        {type = 127,value = 430,job =2},

				        {type = 126,value = 100,job =3},
				        {type = 127,value = 430,job =3},

				    },
				},
--11级 
				{
					needJingHua = 300, 
					attr=
					{
				        {type = 126,value = 110,job =1},
				        {type = 127,value = 550,job =1},

				        {type = 126,value = 110,job =2},
				        {type = 127,value = 550,job =2},

				        {type = 126,value = 110,job =3},
				        {type = 127,value = 550,job =3},

				    },
				},
--12级 
				{
					needJingHua = 400, 
					attr=
					{
				        {type = 126,value = 120,job =1},
				        {type = 127,value = 702,job =1},

				        {type = 126,value = 120,job =2},
				        {type = 127,value = 702,job =2},

				        {type = 126,value = 120,job =3},
				        {type = 127,value = 702,job =3},

				    },
				},
--13级 
				{
					needJingHua = 500, 
					attr=
					{
				        {type = 126,value = 130,job =1},
				        {type = 127,value = 882,job =1},

				        {type = 126,value = 130,job =2},
				        {type = 127,value = 882,job =2},

				        {type = 126,value = 130,job =3},
				        {type = 127,value = 882,job =3},

				    },
				},
--14级 
				{
					needJingHua = 600, 
					attr=
					{
				        {type = 126,value = 140,job =1},
				        {type = 127,value = 1086,job =1},

				        {type = 126,value = 140,job =2},
				        {type = 127,value = 1086,job =2},

				        {type = 126,value = 140,job =3},
				        {type = 127,value = 1086,job =3},

				    },
				},
--15级 
				{
					needJingHua = 700, 
					attr=
					{
				        {type = 126,value = 150,job =1},
				        {type = 127,value = 1310,job =1},

				        {type = 126,value = 150,job =2},
				        {type = 127,value = 1310,job =2},

				        {type = 126,value = 150,job =3},
				        {type = 127,value = 1310,job =3},

				    },
				},
--16级 
				{
					needJingHua = 800, 
					attr=
					{
				        {type = 126,value = 160,job =1},
				        {type = 127,value = 1550,job =1},

				        {type = 126,value = 160,job =2},
				        {type = 127,value = 1550,job =2},

				        {type = 126,value = 160,job =3},
				        {type = 127,value = 1550,job =3},

				    },
				},
--17级 
				{
					needJingHua = 900, 
					attr=
					{
				        {type = 126,value = 170,job =1},
				        {type = 127,value = 1802,job =1},

				        {type = 126,value = 170,job =2},
				        {type = 127,value = 1802,job =2},

				        {type = 126,value = 170,job =3},
				        {type = 127,value = 1802,job =3},

				    },
				},
--18级 
				{
					needJingHua = 1000, 
					attr=
					{
				        {type = 126,value = 180,job =1},
				        {type = 127,value = 2062,job =1},

				        {type = 126,value = 180,job =2},
				        {type = 127,value = 2062,job =2},

				        {type = 126,value = 180,job =3},
				        {type = 127,value = 2062,job =3},

				    },
				},
--19级 
				{
					needJingHua = 1100, 
					attr=
					{
				        {type = 126,value = 190,job =1},
				        {type = 127,value = 2326,job =1},

				        {type = 126,value = 190,job =2},
				        {type = 127,value = 2326,job =2},

				        {type = 126,value = 190,job =3},
				        {type = 127,value = 2326,job =3},

				    },
				},
--20级 
				{
					needJingHua = 1200, 
					attr=
					{
				        {type = 126,value = 200,job =1},
				        {type = 127,value = 2590,job =1},

				        {type = 126,value = 200,job =2},
				        {type = 127,value = 2590,job =2},

				        {type = 126,value = 200,job =3},
				        {type = 127,value = 2590,job =3},

				    },
				},
--21级 
				{
					needJingHua = 1300, 
					attr=
					{
				        {type = 126,value = 210,job =1},
				        {type = 127,value = 2850,job =1},

				        {type = 126,value = 210,job =2},
				        {type = 127,value = 2850,job =2},

				        {type = 126,value = 210,job =3},
				        {type = 127,value = 2850,job =3},

				    },
				},
--22级 
				{
					needJingHua = 1400, 
					attr=
					{
				        {type = 126,value = 220,job =1},
				        {type = 127,value = 3102,job =1},

				        {type = 126,value = 220,job =2},
				        {type = 127,value = 3102,job =2},

				        {type = 126,value = 220,job =3},
				        {type = 127,value = 3102,job =3},

				    },
				},
--23级 
				{
					needJingHua = 1500, 
					attr=
					{
				        {type = 126,value = 230,job =1},
				        {type = 127,value = 3342,job =1},

				        {type = 126,value = 230,job =2},
				        {type = 127,value = 3342,job =2},

				        {type = 126,value = 230,job =3},
				        {type = 127,value = 3342,job =3},

				    },
				},
--24级 
				{
					needJingHua = 1600, 
					attr=
					{
				        {type = 126,value = 240,job =1},
				        {type = 127,value = 3566,job =1},

				        {type = 126,value = 240,job =2},
				        {type = 127,value = 3566,job =2},

				        {type = 126,value = 240,job =3},
				        {type = 127,value = 3566,job =3},

				    },
				},
--25级 
				{
					needJingHua = 1700, 
					attr=
					{
				        {type = 126,value = 250,job =1},
				        {type = 127,value = 3770,job =1},

				        {type = 126,value = 250,job =2},
				        {type = 127,value = 3770,job =2},

				        {type = 126,value = 250,job =3},
				        {type = 127,value = 3770,job =3},

				    },
				},
--26级 
				{
					needJingHua = 1800, 
					attr=
					{
				        {type = 126,value = 260,job =1},
				        {type = 127,value = 3950,job =1},

				        {type = 126,value = 260,job =2},
				        {type = 127,value = 3950,job =2},

				        {type = 126,value = 260,job =3},
				        {type = 127,value = 3950,job =3},

				    },
				},
--27级 
				{
					needJingHua = 1900, 
					attr=
					{
				        {type = 126,value = 270,job =1},
				        {type = 127,value = 4102,job =1},

				        {type = 126,value = 270,job =2},
				        {type = 127,value = 4102,job =2},

				        {type = 126,value = 270,job =3},
				        {type = 127,value = 4102,job =3},

				    },
				},
--28级 
				{
					needJingHua = 2000, 
					attr=
					{
				        {type = 126,value = 280,job =1},
				        {type = 127,value = 4242,job =1},

				        {type = 126,value = 280,job =2},
				        {type = 127,value = 4242,job =2},

				        {type = 126,value = 280,job =3},
				        {type = 127,value = 4242,job =3},

				    },
				},
--29级 
				{
					needJingHua = 2100, 
					attr=
					{
				        {type = 126,value = 290,job =1},
				        {type = 127,value = 4368,job =1},

				        {type = 126,value = 290,job =2},
				        {type = 127,value = 4368,job =2},

				        {type = 126,value = 290,job =3},
				        {type = 127,value = 4368,job =3},

				    },
				},
--30级 
				{
					needJingHua = 2200, 
					attr=
					{
				        {type = 126,value = 300,job =1},
				        {type = 127,value = 4500,job =1},

				        {type = 126,value = 300,job =2},
				        {type = 127,value = 4500,job =2},

				        {type = 126,value = 300,job =3},
				        {type = 127,value = 4500,job =3},

				    },
				},
--31级 
				{
					needJingHua = 2300, 
					attr=
					{
				        {type = 126,value = 310,job =1},
				        {type = 127,value = 4638,job =1},

				        {type = 126,value = 310,job =2},
				        {type = 127,value = 4638,job =2},

				        {type = 126,value = 310,job =3},
				        {type = 127,value = 4638,job =3},

				    },
				},
--32级 
				{
					needJingHua = 2400, 
					attr=
					{
				        {type = 126,value = 320,job =1},
				        {type = 127,value = 4782,job =1},

				        {type = 126,value = 320,job =2},
				        {type = 127,value = 4782,job =2},

				        {type = 126,value = 320,job =3},
				        {type = 127,value = 4782,job =3},

				    },
				},
--33级 
				{
					needJingHua = 2500, 
					attr=
					{
				        {type = 126,value = 330,job =1},
				        {type = 127,value = 4932,job =1},

				        {type = 126,value = 330,job =2},
				        {type = 127,value = 4932,job =2},

				        {type = 126,value = 330,job =3},
				        {type = 127,value = 4932,job =3},

				    },
				},
--34级 
				{
					needJingHua = 2600, 
					attr=
					{
				        {type = 126,value = 340,job =1},
				        {type = 127,value = 5088,job =1},

				        {type = 126,value = 340,job =2},
				        {type = 127,value = 5088,job =2},

				        {type = 126,value = 340,job =3},
				        {type = 127,value = 5088,job =3},

				    },
				},
--35级 
				{
					needJingHua = 2700, 
					attr=
					{
				        {type = 126,value = 350,job =1},
				        {type = 127,value = 5250,job =1},

				        {type = 126,value = 350,job =2},
				        {type = 127,value = 5250,job =2},

				        {type = 126,value = 350,job =3},
				        {type = 127,value = 5250,job =3},

				    },
				},
--36级 
				{
					needJingHua = 2800, 
					attr=
					{
				        {type = 126,value = 360,job =1},
				        {type = 127,value = 5418,job =1},

				        {type = 126,value = 360,job =2},
				        {type = 127,value = 5418,job =2},

				        {type = 126,value = 360,job =3},
				        {type = 127,value = 5418,job =3},

				    },
				},
--37级 
				{
					needJingHua = 2900, 
					attr=
					{
				        {type = 126,value = 370,job =1},
				        {type = 127,value = 5592,job =1},

				        {type = 126,value = 370,job =2},
				        {type = 127,value = 5592,job =2},

				        {type = 126,value = 370,job =3},
				        {type = 127,value = 5592,job =3},

				    },
				},
--38级 
				{
					needJingHua = 3000, 
					attr=
					{
				        {type = 126,value = 380,job =1},
				        {type = 127,value = 5772,job =1},

				        {type = 126,value = 380,job =2},
				        {type = 127,value = 5772,job =2},

				        {type = 126,value = 380,job =3},
				        {type = 127,value = 5772,job =3},

				    },
				},
--39级 
				{
					needJingHua = 3100, 
					attr=
					{
				        {type = 126,value = 390,job =1},
				        {type = 127,value = 5958,job =1},

				        {type = 126,value = 390,job =2},
				        {type = 127,value = 5958,job =2},

				        {type = 126,value = 390,job =3},
				        {type = 127,value = 5958,job =3},

				    },
				},
--40级 
				{
					needJingHua = 3200, 
					attr=
					{
				        {type = 126,value = 400,job =1},
				        {type = 127,value = 6150,job =1},

				        {type = 126,value = 400,job =2},
				        {type = 127,value = 6150,job =2},

				        {type = 126,value = 400,job =3},
				        {type = 127,value = 6150,job =3},

				    },
				},
--41级 
				{
					needJingHua = 3300, 
					attr=
					{
				        {type = 126,value = 410,job =1},
				        {type = 127,value = 6348,job =1},

				        {type = 126,value = 410,job =2},
				        {type = 127,value = 6348,job =2},

				        {type = 126,value = 410,job =3},
				        {type = 127,value = 6348,job =3},

				    },
				},
--42级 
				{
					needJingHua = 3400, 
					attr=
					{
				        {type = 126,value = 420,job =1},
				        {type = 127,value = 6552,job =1},

				        {type = 126,value = 420,job =2},
				        {type = 127,value = 6552,job =2},

				        {type = 126,value = 420,job =3},
				        {type = 127,value = 6552,job =3},

				    },
				},
--43级 
				{
					needJingHua = 3500, 
					attr=
					{
				        {type = 126,value = 430,job =1},
				        {type = 127,value = 6762,job =1},

				        {type = 126,value = 430,job =2},
				        {type = 127,value = 6762,job =2},

				        {type = 126,value = 430,job =3},
				        {type = 127,value = 6762,job =3},

				    },
				},
--44级 
				{
					needJingHua = 3600, 
					attr=
					{
				        {type = 126,value = 440,job =1},
				        {type = 127,value = 6978,job =1},

				        {type = 126,value = 440,job =2},
				        {type = 127,value = 6978,job =2},

				        {type = 126,value = 440,job =3},
				        {type = 127,value = 6978,job =3},

				    },
				},
--45级 
				{
					needJingHua = 3700, 
					attr=
					{
				        {type = 126,value = 450,job =1},
				        {type = 127,value = 7200,job =1},

				        {type = 126,value = 450,job =2},
				        {type = 127,value = 7200,job =2},

				        {type = 126,value = 450,job =3},
				        {type = 127,value = 7200,job =3},

				    },
				},
--46级 
				{
					needJingHua = 3800, 
					attr=
					{
				        {type = 126,value = 460,job =1},
				        {type = 127,value = 7428,job =1},

				        {type = 126,value = 460,job =2},
				        {type = 127,value = 7428,job =2},

				        {type = 126,value = 460,job =3},
				        {type = 127,value = 7428,job =3},

				    },
				},
--47级 
				{
					needJingHua = 3900, 
					attr=
					{
				        {type = 126,value = 470,job =1},
				        {type = 127,value = 7662,job =1},

				        {type = 126,value = 470,job =2},
				        {type = 127,value = 7662,job =2},

				        {type = 126,value = 470,job =3},
				        {type = 127,value = 7662,job =3},

				    },
				},
--48级 
				{
					needJingHua = 4000, 
					attr=
					{
				        {type = 126,value = 480,job =1},
				        {type = 127,value = 7902,job =1},

				        {type = 126,value = 480,job =2},
				        {type = 127,value = 7902,job =2},

				        {type = 126,value = 480,job =3},
				        {type = 127,value = 7902,job =3},

				    },
				},
--49级 
				{
					needJingHua = 4100, 
					attr=
					{
				        {type = 126,value = 490,job =1},
				        {type = 127,value = 8148,job =1},

				        {type = 126,value = 490,job =2},
				        {type = 127,value = 8148,job =2},

				        {type = 126,value = 490,job =3},
				        {type = 127,value = 8148,job =3},

				    },
				},
--50级 
				{
					needJingHua = 4200, 
					attr=
					{
				        {type = 126,value = 500,job =1},
				        {type = 127,value = 8400,job =1},

				        {type = 126,value = 500,job =2},
				        {type = 127,value = 8400,job =2},

				        {type = 126,value = 500,job =3},
				        {type = 127,value = 8400,job =3},

				    },
				},

	
			
			
			},
		},
	
	
			{	
			position = 22,
			name = "吊坠",
			level=
			{
	--1级 
				{
					needJingHua = 30, 
					attr=
					{
				        {type = 154,value = 20,job =1},
				        {type = 153,value = 97,job =1},

				        {type = 154,value = 20,job =2},
				        {type = 153,value = 97,job =2},

				        {type = 154,value = 20,job =3},
				        {type = 153,value = 97,job =3},

				    },
				},
--2级 
				{
					needJingHua = 40, 
					attr=
					{
				        {type = 154,value = 40,job =1},
				        {type = 153,value = 221,job =1},

				        {type = 154,value = 40,job =2},
				        {type = 153,value = 221,job =2},

				        {type = 154,value = 40,job =3},
				        {type = 153,value = 221,job =3},

				    },
				},
--3级 
				{
					needJingHua = 50, 
					attr=
					{
				        {type = 154,value = 60,job =1},
				        {type = 153,value = 373,job =1},

				        {type = 154,value = 60,job =2},
				        {type = 153,value = 373,job =2},

				        {type = 154,value = 60,job =3},
				        {type = 153,value = 373,job =3},

				    },
				},
--4级 
				{
					needJingHua = 60, 
					attr=
					{
				        {type = 154,value = 80,job =1},
				        {type = 153,value = 545,job =1},

				        {type = 154,value = 80,job =2},
				        {type = 153,value = 545,job =2},

				        {type = 154,value = 80,job =3},
				        {type = 153,value = 545,job =3},

				    },
				},
--5级 
				{
					needJingHua = 70, 
					attr=
					{
				        {type = 154,value = 100,job =1},
				        {type = 153,value = 740,job =1},

				        {type = 154,value = 100,job =2},
				        {type = 153,value = 740,job =2},

				        {type = 154,value = 100,job =3},
				        {type = 153,value = 740,job =3},

				    },
				},
--6级 
				{
					needJingHua = 80, 
					attr=
					{
				        {type = 154,value = 120,job =1},
				        {type = 153,value = 956,job =1},

				        {type = 154,value = 120,job =2},
				        {type = 153,value = 956,job =2},

				        {type = 154,value = 120,job =3},
				        {type = 153,value = 956,job =3},

				    },
				},
--7级 
				{
					needJingHua = 100, 
					attr=
					{
				        {type = 154,value = 140,job =1},
				        {type = 153,value = 1215,job =1},

				        {type = 154,value = 140,job =2},
				        {type = 153,value = 1215,job =2},

				        {type = 154,value = 140,job =3},
				        {type = 153,value = 1215,job =3},

				    },
				},
--8级 
				{
					needJingHua = 120, 
					attr=
					{
				        {type = 154,value = 160,job =1},
				        {type = 153,value = 1512,job =1},

				        {type = 154,value = 160,job =2},
				        {type = 153,value = 1512,job =2},

				        {type = 154,value = 160,job =3},
				        {type = 153,value = 1512,job =3},

				    },
				},
--9级 
				{
					needJingHua = 150, 
					attr=
					{
				        {type = 154,value = 180,job =1},
				        {type = 153,value = 1868,job =1},

				        {type = 154,value = 180,job =2},
				        {type = 153,value = 1868,job =2},

				        {type = 154,value = 180,job =3},
				        {type = 153,value = 1868,job =3},

				    },
				},
--10级 
				{
					needJingHua = 200, 
					attr=
					{
				        {type = 154,value = 200,job =1},
				        {type = 153,value = 2322,job =1},

				        {type = 154,value = 200,job =2},
				        {type = 153,value = 2322,job =2},

				        {type = 154,value = 200,job =3},
				        {type = 153,value = 2322,job =3},

				    },
				},
--11级 
				{
					needJingHua = 300, 
					attr=
					{
				        {type = 154,value = 220,job =1},
				        {type = 153,value = 2970,job =1},

				        {type = 154,value = 220,job =2},
				        {type = 153,value = 2970,job =2},

				        {type = 154,value = 220,job =3},
				        {type = 153,value = 2970,job =3},

				    },
				},
--12级 
				{
					needJingHua = 400, 
					attr=
					{
				        {type = 154,value = 240,job =1},
				        {type = 153,value = 3791,job =1},

				        {type = 154,value = 240,job =2},
				        {type = 153,value = 3791,job =2},

				        {type = 154,value = 240,job =3},
				        {type = 153,value = 3791,job =3},

				    },
				},
--13级 
				{
					needJingHua = 500, 
					attr=
					{
				        {type = 154,value = 260,job =1},
				        {type = 153,value = 4763,job =1},

				        {type = 154,value = 260,job =2},
				        {type = 153,value = 4763,job =2},

				        {type = 154,value = 260,job =3},
				        {type = 153,value = 4763,job =3},

				    },
				},
--14级 
				{
					needJingHua = 600, 
					attr=
					{
				        {type = 154,value = 280,job =1},
				        {type = 153,value = 5864,job =1},

				        {type = 154,value = 280,job =2},
				        {type = 153,value = 5864,job =2},

				        {type = 154,value = 280,job =3},
				        {type = 153,value = 5864,job =3},

				    },
				},
--15级 
				{
					needJingHua = 700, 
					attr=
					{
				        {type = 154,value = 300,job =1},
				        {type = 153,value = 7074,job =1},

				        {type = 154,value = 300,job =2},
				        {type = 153,value = 7074,job =2},

				        {type = 154,value = 300,job =3},
				        {type = 153,value = 7074,job =3},

				    },
				},
--16级 
				{
					needJingHua = 800, 
					attr=
					{
				        {type = 154,value = 320,job =1},
				        {type = 153,value = 8370,job =1},

				        {type = 154,value = 320,job =2},
				        {type = 153,value = 8370,job =2},

				        {type = 154,value = 320,job =3},
				        {type = 153,value = 8370,job =3},

				    },
				},
--17级 
				{
					needJingHua = 900, 
					attr=
					{
				        {type = 154,value = 340,job =1},
				        {type = 153,value = 9731,job =1},

				        {type = 154,value = 340,job =2},
				        {type = 153,value = 9731,job =2},

				        {type = 154,value = 340,job =3},
				        {type = 153,value = 9731,job =3},

				    },
				},
--18级 
				{
					needJingHua = 1000, 
					attr=
					{
				        {type = 154,value = 360,job =1},
				        {type = 153,value = 11135,job =1},

				        {type = 154,value = 360,job =2},
				        {type = 153,value = 11135,job =2},

				        {type = 154,value = 360,job =3},
				        {type = 153,value = 11135,job =3},

				    },
				},
--19级 
				{
					needJingHua = 1100, 
					attr=
					{
				        {type = 154,value = 380,job =1},
				        {type = 153,value = 12560,job =1},

				        {type = 154,value = 380,job =2},
				        {type = 153,value = 12560,job =2},

				        {type = 154,value = 380,job =3},
				        {type = 153,value = 12560,job =3},

				    },
				},
--20级 
				{
					needJingHua = 1200, 
					attr=
					{
				        {type = 154,value = 400,job =1},
				        {type = 153,value = 13986,job =1},

				        {type = 154,value = 400,job =2},
				        {type = 153,value = 13986,job =2},

				        {type = 154,value = 400,job =3},
				        {type = 153,value = 13986,job =3},

				    },
				},
--21级 
				{
					needJingHua = 1300, 
					attr=
					{
				        {type = 154,value = 420,job =1},
				        {type = 153,value = 15390,job =1},

				        {type = 154,value = 420,job =2},
				        {type = 153,value = 15390,job =2},

				        {type = 154,value = 420,job =3},
				        {type = 153,value = 15390,job =3},

				    },
				},
--22级 
				{
					needJingHua = 1400, 
					attr=
					{
				        {type = 154,value = 440,job =1},
				        {type = 153,value = 16751,job =1},

				        {type = 154,value = 440,job =2},
				        {type = 153,value = 16751,job =2},

				        {type = 154,value = 440,job =3},
				        {type = 153,value = 16751,job =3},

				    },
				},
--23级 
				{
					needJingHua = 1500, 
					attr=
					{
				        {type = 154,value = 460,job =1},
				        {type = 153,value = 18047,job =1},

				        {type = 154,value = 460,job =2},
				        {type = 153,value = 18047,job =2},

				        {type = 154,value = 460,job =3},
				        {type = 153,value = 18047,job =3},

				    },
				},
--24级 
				{
					needJingHua = 1600, 
					attr=
					{
				        {type = 154,value = 480,job =1},
				        {type = 153,value = 19256,job =1},

				        {type = 154,value = 480,job =2},
				        {type = 153,value = 19256,job =2},

				        {type = 154,value = 480,job =3},
				        {type = 153,value = 19256,job =3},

				    },
				},
--25级 
				{
					needJingHua = 1700, 
					attr=
					{
				        {type = 154,value = 500,job =1},
				        {type = 153,value = 20358,job =1},

				        {type = 154,value = 500,job =2},
				        {type = 153,value = 20358,job =2},

				        {type = 154,value = 500,job =3},
				        {type = 153,value = 20358,job =3},

				    },
				},
--26级 
				{
					needJingHua = 1800, 
					attr=
					{
				        {type = 154,value = 520,job =1},
				        {type = 153,value = 21330,job =1},

				        {type = 154,value = 520,job =2},
				        {type = 153,value = 21330,job =2},

				        {type = 154,value = 520,job =3},
				        {type = 153,value = 21330,job =3},

				    },
				},
--27级 
				{
					needJingHua = 1900, 
					attr=
					{
				        {type = 154,value = 540,job =1},
				        {type = 153,value = 22151,job =1},

				        {type = 154,value = 540,job =2},
				        {type = 153,value = 22151,job =2},

				        {type = 154,value = 540,job =3},
				        {type = 153,value = 22151,job =3},

				    },
				},
--28级 
				{
					needJingHua = 2000, 
					attr=
					{
				        {type = 154,value = 560,job =1},
				        {type = 153,value = 22907,job =1},

				        {type = 154,value = 560,job =2},
				        {type = 153,value = 22907,job =2},

				        {type = 154,value = 560,job =3},
				        {type = 153,value = 22907,job =3},

				    },
				},
--29级 
				{
					needJingHua = 2100, 
					attr=
					{
				        {type = 154,value = 580,job =1},
				        {type = 153,value = 23587,job =1},

				        {type = 154,value = 580,job =2},
				        {type = 153,value = 23587,job =2},

				        {type = 154,value = 580,job =3},
				        {type = 153,value = 23587,job =3},

				    },
				},
--30级 
				{
					needJingHua = 2200, 
					attr=
					{
				        {type = 154,value = 600,job =1},
				        {type = 153,value = 24300,job =1},

				        {type = 154,value = 600,job =2},
				        {type = 153,value = 24300,job =2},

				        {type = 154,value = 600,job =3},
				        {type = 153,value = 24300,job =3},

				    },
				},
--31级 
				{
					needJingHua = 2300, 
					attr=
					{
				        {type = 154,value = 620,job =1},
				        {type = 153,value = 25045,job =1},

				        {type = 154,value = 620,job =2},
				        {type = 153,value = 25045,job =2},

				        {type = 154,value = 620,job =3},
				        {type = 153,value = 25045,job =3},

				    },
				},
--32级 
				{
					needJingHua = 2400, 
					attr=
					{
				        {type = 154,value = 640,job =1},
				        {type = 153,value = 25823,job =1},

				        {type = 154,value = 640,job =2},
				        {type = 153,value = 25823,job =2},

				        {type = 154,value = 640,job =3},
				        {type = 153,value = 25823,job =3},

				    },
				},
--33级 
				{
					needJingHua = 2500, 
					attr=
					{
				        {type = 154,value = 660,job =1},
				        {type = 153,value = 26633,job =1},

				        {type = 154,value = 660,job =2},
				        {type = 153,value = 26633,job =2},

				        {type = 154,value = 660,job =3},
				        {type = 153,value = 26633,job =3},

				    },
				},
--34级 
				{
					needJingHua = 2600, 
					attr=
					{
				        {type = 154,value = 680,job =1},
				        {type = 153,value = 27475,job =1},

				        {type = 154,value = 680,job =2},
				        {type = 153,value = 27475,job =2},

				        {type = 154,value = 680,job =3},
				        {type = 153,value = 27475,job =3},

				    },
				},
--35级 
				{
					needJingHua = 2700, 
					attr=
					{
				        {type = 154,value = 700,job =1},
				        {type = 153,value = 28350,job =1},

				        {type = 154,value = 700,job =2},
				        {type = 153,value = 28350,job =2},

				        {type = 154,value = 700,job =3},
				        {type = 153,value = 28350,job =3},

				    },
				},
--36级 
				{
					needJingHua = 2800, 
					attr=
					{
				        {type = 154,value = 720,job =1},
				        {type = 153,value = 29257,job =1},

				        {type = 154,value = 720,job =2},
				        {type = 153,value = 29257,job =2},

				        {type = 154,value = 720,job =3},
				        {type = 153,value = 29257,job =3},

				    },
				},
--37级 
				{
					needJingHua = 2900, 
					attr=
					{
				        {type = 154,value = 740,job =1},
				        {type = 153,value = 30197,job =1},

				        {type = 154,value = 740,job =2},
				        {type = 153,value = 30197,job =2},

				        {type = 154,value = 740,job =3},
				        {type = 153,value = 30197,job =3},

				    },
				},
--38级 
				{
					needJingHua = 3000, 
					attr=
					{
				        {type = 154,value = 760,job =1},
				        {type = 153,value = 31169,job =1},

				        {type = 154,value = 760,job =2},
				        {type = 153,value = 31169,job =2},

				        {type = 154,value = 760,job =3},
				        {type = 153,value = 31169,job =3},

				    },
				},
--39级 
				{
					needJingHua = 3100, 
					attr=
					{
				        {type = 154,value = 780,job =1},
				        {type = 153,value = 32173,job =1},

				        {type = 154,value = 780,job =2},
				        {type = 153,value = 32173,job =2},

				        {type = 154,value = 780,job =3},
				        {type = 153,value = 32173,job =3},

				    },
				},
--40级 
				{
					needJingHua = 3200, 
					attr=
					{
				        {type = 154,value = 800,job =1},
				        {type = 153,value = 33210,job =1},

				        {type = 154,value = 800,job =2},
				        {type = 153,value = 33210,job =2},

				        {type = 154,value = 800,job =3},
				        {type = 153,value = 33210,job =3},

				    },
				},
--41级 
				{
					needJingHua = 3300, 
					attr=
					{
				        {type = 154,value = 820,job =1},
				        {type = 153,value = 34279,job =1},

				        {type = 154,value = 820,job =2},
				        {type = 153,value = 34279,job =2},

				        {type = 154,value = 820,job =3},
				        {type = 153,value = 34279,job =3},

				    },
				},
--42级 
				{
					needJingHua = 3400, 
					attr=
					{
				        {type = 154,value = 840,job =1},
				        {type = 153,value = 35381,job =1},

				        {type = 154,value = 840,job =2},
				        {type = 153,value = 35381,job =2},

				        {type = 154,value = 840,job =3},
				        {type = 153,value = 35381,job =3},

				    },
				},
--43级 
				{
					needJingHua = 3500, 
					attr=
					{
				        {type = 154,value = 860,job =1},
				        {type = 153,value = 36515,job =1},

				        {type = 154,value = 860,job =2},
				        {type = 153,value = 36515,job =2},

				        {type = 154,value = 860,job =3},
				        {type = 153,value = 36515,job =3},

				    },
				},
--44级 
				{
					needJingHua = 3600, 
					attr=
					{
				        {type = 154,value = 880,job =1},
				        {type = 153,value = 37681,job =1},

				        {type = 154,value = 880,job =2},
				        {type = 153,value = 37681,job =2},

				        {type = 154,value = 880,job =3},
				        {type = 153,value = 37681,job =3},

				    },
				},
--45级 
				{
					needJingHua = 3700, 
					attr=
					{
				        {type = 154,value = 900,job =1},
				        {type = 153,value = 38880,job =1},

				        {type = 154,value = 900,job =2},
				        {type = 153,value = 38880,job =2},

				        {type = 154,value = 900,job =3},
				        {type = 153,value = 38880,job =3},

				    },
				},
--46级 
				{
					needJingHua = 3800, 
					attr=
					{
				        {type = 154,value = 920,job =1},
				        {type = 153,value = 40111,job =1},

				        {type = 154,value = 920,job =2},
				        {type = 153,value = 40111,job =2},

				        {type = 154,value = 920,job =3},
				        {type = 153,value = 40111,job =3},

				    },
				},
--47级 
				{
					needJingHua = 3900, 
					attr=
					{
				        {type = 154,value = 940,job =1},
				        {type = 153,value = 41375,job =1},

				        {type = 154,value = 940,job =2},
				        {type = 153,value = 41375,job =2},

				        {type = 154,value = 940,job =3},
				        {type = 153,value = 41375,job =3},

				    },
				},
--48级 
				{
					needJingHua = 4000, 
					attr=
					{
				        {type = 154,value = 960,job =1},
				        {type = 153,value = 42671,job =1},

				        {type = 154,value = 960,job =2},
				        {type = 153,value = 42671,job =2},

				        {type = 154,value = 960,job =3},
				        {type = 153,value = 42671,job =3},

				    },
				},
--49级 
				{
					needJingHua = 4100, 
					attr=
					{
				        {type = 154,value = 980,job =1},
				        {type = 153,value = 43999,job =1},

				        {type = 154,value = 980,job =2},
				        {type = 153,value = 43999,job =2},

				        {type = 154,value = 980,job =3},
				        {type = 153,value = 43999,job =3},

				    },
				},
--50级 
				{
					needJingHua = 4200, 
					attr=
					{
				        {type = 154,value = 1000,job =1},
				        {type = 153,value = 45360,job =1},

				        {type = 154,value = 1000,job =2},
				        {type = 153,value = 45360,job =2},

				        {type = 154,value = 1000,job =3},
				        {type = 153,value = 45360,job =3},

				    },
				},

	
			
			
			},
		},
	
		{	
			position = 23,
			name = "护肩",
			level=
			{
	--1级 
				{
					needJingHua = 30, 
					attr=
					{
				        {type = 154,value = 20,job =1},
				        {type = 153,value = 97,job =1},

				        {type = 154,value = 20,job =2},
				        {type = 153,value = 97,job =2},

				        {type = 154,value = 20,job =3},
				        {type = 153,value = 97,job =3},

				    },
				},
--2级 
				{
					needJingHua = 40, 
					attr=
					{
				        {type = 154,value = 40,job =1},
				        {type = 153,value = 221,job =1},

				        {type = 154,value = 40,job =2},
				        {type = 153,value = 221,job =2},

				        {type = 154,value = 40,job =3},
				        {type = 153,value = 221,job =3},

				    },
				},
--3级 
				{
					needJingHua = 50, 
					attr=
					{
				        {type = 154,value = 60,job =1},
				        {type = 153,value = 373,job =1},

				        {type = 154,value = 60,job =2},
				        {type = 153,value = 373,job =2},

				        {type = 154,value = 60,job =3},
				        {type = 153,value = 373,job =3},

				    },
				},
--4级 
				{
					needJingHua = 60, 
					attr=
					{
				        {type = 154,value = 80,job =1},
				        {type = 153,value = 545,job =1},

				        {type = 154,value = 80,job =2},
				        {type = 153,value = 545,job =2},

				        {type = 154,value = 80,job =3},
				        {type = 153,value = 545,job =3},

				    },
				},
--5级 
				{
					needJingHua = 70, 
					attr=
					{
				        {type = 154,value = 100,job =1},
				        {type = 153,value = 740,job =1},

				        {type = 154,value = 100,job =2},
				        {type = 153,value = 740,job =2},

				        {type = 154,value = 100,job =3},
				        {type = 153,value = 740,job =3},

				    },
				},
--6级 
				{
					needJingHua = 80, 
					attr=
					{
				        {type = 154,value = 120,job =1},
				        {type = 153,value = 956,job =1},

				        {type = 154,value = 120,job =2},
				        {type = 153,value = 956,job =2},

				        {type = 154,value = 120,job =3},
				        {type = 153,value = 956,job =3},

				    },
				},
--7级 
				{
					needJingHua = 100, 
					attr=
					{
				        {type = 154,value = 140,job =1},
				        {type = 153,value = 1215,job =1},

				        {type = 154,value = 140,job =2},
				        {type = 153,value = 1215,job =2},

				        {type = 154,value = 140,job =3},
				        {type = 153,value = 1215,job =3},

				    },
				},
--8级 
				{
					needJingHua = 120, 
					attr=
					{
				        {type = 154,value = 160,job =1},
				        {type = 153,value = 1512,job =1},

				        {type = 154,value = 160,job =2},
				        {type = 153,value = 1512,job =2},

				        {type = 154,value = 160,job =3},
				        {type = 153,value = 1512,job =3},

				    },
				},
--9级 
				{
					needJingHua = 150, 
					attr=
					{
				        {type = 154,value = 180,job =1},
				        {type = 153,value = 1868,job =1},

				        {type = 154,value = 180,job =2},
				        {type = 153,value = 1868,job =2},

				        {type = 154,value = 180,job =3},
				        {type = 153,value = 1868,job =3},

				    },
				},
--10级 
				{
					needJingHua = 200, 
					attr=
					{
				        {type = 154,value = 200,job =1},
				        {type = 153,value = 2322,job =1},

				        {type = 154,value = 200,job =2},
				        {type = 153,value = 2322,job =2},

				        {type = 154,value = 200,job =3},
				        {type = 153,value = 2322,job =3},

				    },
				},
--11级 
				{
					needJingHua = 300, 
					attr=
					{
				        {type = 154,value = 220,job =1},
				        {type = 153,value = 2970,job =1},

				        {type = 154,value = 220,job =2},
				        {type = 153,value = 2970,job =2},

				        {type = 154,value = 220,job =3},
				        {type = 153,value = 2970,job =3},

				    },
				},
--12级 
				{
					needJingHua = 400, 
					attr=
					{
				        {type = 154,value = 240,job =1},
				        {type = 153,value = 3791,job =1},

				        {type = 154,value = 240,job =2},
				        {type = 153,value = 3791,job =2},

				        {type = 154,value = 240,job =3},
				        {type = 153,value = 3791,job =3},

				    },
				},
--13级 
				{
					needJingHua = 500, 
					attr=
					{
				        {type = 154,value = 260,job =1},
				        {type = 153,value = 4763,job =1},

				        {type = 154,value = 260,job =2},
				        {type = 153,value = 4763,job =2},

				        {type = 154,value = 260,job =3},
				        {type = 153,value = 4763,job =3},

				    },
				},
--14级 
				{
					needJingHua = 600, 
					attr=
					{
				        {type = 154,value = 280,job =1},
				        {type = 153,value = 5864,job =1},

				        {type = 154,value = 280,job =2},
				        {type = 153,value = 5864,job =2},

				        {type = 154,value = 280,job =3},
				        {type = 153,value = 5864,job =3},

				    },
				},
--15级 
				{
					needJingHua = 700, 
					attr=
					{
				        {type = 154,value = 300,job =1},
				        {type = 153,value = 7074,job =1},

				        {type = 154,value = 300,job =2},
				        {type = 153,value = 7074,job =2},

				        {type = 154,value = 300,job =3},
				        {type = 153,value = 7074,job =3},

				    },
				},
--16级 
				{
					needJingHua = 800, 
					attr=
					{
				        {type = 154,value = 320,job =1},
				        {type = 153,value = 8370,job =1},

				        {type = 154,value = 320,job =2},
				        {type = 153,value = 8370,job =2},

				        {type = 154,value = 320,job =3},
				        {type = 153,value = 8370,job =3},

				    },
				},
--17级 
				{
					needJingHua = 900, 
					attr=
					{
				        {type = 154,value = 340,job =1},
				        {type = 153,value = 9731,job =1},

				        {type = 154,value = 340,job =2},
				        {type = 153,value = 9731,job =2},

				        {type = 154,value = 340,job =3},
				        {type = 153,value = 9731,job =3},

				    },
				},
--18级 
				{
					needJingHua = 1000, 
					attr=
					{
				        {type = 154,value = 360,job =1},
				        {type = 153,value = 11135,job =1},

				        {type = 154,value = 360,job =2},
				        {type = 153,value = 11135,job =2},

				        {type = 154,value = 360,job =3},
				        {type = 153,value = 11135,job =3},

				    },
				},
--19级 
				{
					needJingHua = 1100, 
					attr=
					{
				        {type = 154,value = 380,job =1},
				        {type = 153,value = 12560,job =1},

				        {type = 154,value = 380,job =2},
				        {type = 153,value = 12560,job =2},

				        {type = 154,value = 380,job =3},
				        {type = 153,value = 12560,job =3},

				    },
				},
--20级 
				{
					needJingHua = 1200, 
					attr=
					{
				        {type = 154,value = 400,job =1},
				        {type = 153,value = 13986,job =1},

				        {type = 154,value = 400,job =2},
				        {type = 153,value = 13986,job =2},

				        {type = 154,value = 400,job =3},
				        {type = 153,value = 13986,job =3},

				    },
				},
--21级 
				{
					needJingHua = 1300, 
					attr=
					{
				        {type = 154,value = 420,job =1},
				        {type = 153,value = 15390,job =1},

				        {type = 154,value = 420,job =2},
				        {type = 153,value = 15390,job =2},

				        {type = 154,value = 420,job =3},
				        {type = 153,value = 15390,job =3},

				    },
				},
--22级 
				{
					needJingHua = 1400, 
					attr=
					{
				        {type = 154,value = 440,job =1},
				        {type = 153,value = 16751,job =1},

				        {type = 154,value = 440,job =2},
				        {type = 153,value = 16751,job =2},

				        {type = 154,value = 440,job =3},
				        {type = 153,value = 16751,job =3},

				    },
				},
--23级 
				{
					needJingHua = 1500, 
					attr=
					{
				        {type = 154,value = 460,job =1},
				        {type = 153,value = 18047,job =1},

				        {type = 154,value = 460,job =2},
				        {type = 153,value = 18047,job =2},

				        {type = 154,value = 460,job =3},
				        {type = 153,value = 18047,job =3},

				    },
				},
--24级 
				{
					needJingHua = 1600, 
					attr=
					{
				        {type = 154,value = 480,job =1},
				        {type = 153,value = 19256,job =1},

				        {type = 154,value = 480,job =2},
				        {type = 153,value = 19256,job =2},

				        {type = 154,value = 480,job =3},
				        {type = 153,value = 19256,job =3},

				    },
				},
--25级 
				{
					needJingHua = 1700, 
					attr=
					{
				        {type = 154,value = 500,job =1},
				        {type = 153,value = 20358,job =1},

				        {type = 154,value = 500,job =2},
				        {type = 153,value = 20358,job =2},

				        {type = 154,value = 500,job =3},
				        {type = 153,value = 20358,job =3},

				    },
				},
--26级 
				{
					needJingHua = 1800, 
					attr=
					{
				        {type = 154,value = 520,job =1},
				        {type = 153,value = 21330,job =1},

				        {type = 154,value = 520,job =2},
				        {type = 153,value = 21330,job =2},

				        {type = 154,value = 520,job =3},
				        {type = 153,value = 21330,job =3},

				    },
				},
--27级 
				{
					needJingHua = 1900, 
					attr=
					{
				        {type = 154,value = 540,job =1},
				        {type = 153,value = 22151,job =1},

				        {type = 154,value = 540,job =2},
				        {type = 153,value = 22151,job =2},

				        {type = 154,value = 540,job =3},
				        {type = 153,value = 22151,job =3},

				    },
				},
--28级 
				{
					needJingHua = 2000, 
					attr=
					{
				        {type = 154,value = 560,job =1},
				        {type = 153,value = 22907,job =1},

				        {type = 154,value = 560,job =2},
				        {type = 153,value = 22907,job =2},

				        {type = 154,value = 560,job =3},
				        {type = 153,value = 22907,job =3},

				    },
				},
--29级 
				{
					needJingHua = 2100, 
					attr=
					{
				        {type = 154,value = 580,job =1},
				        {type = 153,value = 23587,job =1},

				        {type = 154,value = 580,job =2},
				        {type = 153,value = 23587,job =2},

				        {type = 154,value = 580,job =3},
				        {type = 153,value = 23587,job =3},

				    },
				},
--30级 
				{
					needJingHua = 2200, 
					attr=
					{
				        {type = 154,value = 600,job =1},
				        {type = 153,value = 24300,job =1},

				        {type = 154,value = 600,job =2},
				        {type = 153,value = 24300,job =2},

				        {type = 154,value = 600,job =3},
				        {type = 153,value = 24300,job =3},

				    },
				},
--31级 
				{
					needJingHua = 2300, 
					attr=
					{
				        {type = 154,value = 620,job =1},
				        {type = 153,value = 25045,job =1},

				        {type = 154,value = 620,job =2},
				        {type = 153,value = 25045,job =2},

				        {type = 154,value = 620,job =3},
				        {type = 153,value = 25045,job =3},

				    },
				},
--32级 
				{
					needJingHua = 2400, 
					attr=
					{
				        {type = 154,value = 640,job =1},
				        {type = 153,value = 25823,job =1},

				        {type = 154,value = 640,job =2},
				        {type = 153,value = 25823,job =2},

				        {type = 154,value = 640,job =3},
				        {type = 153,value = 25823,job =3},

				    },
				},
--33级 
				{
					needJingHua = 2500, 
					attr=
					{
				        {type = 154,value = 660,job =1},
				        {type = 153,value = 26633,job =1},

				        {type = 154,value = 660,job =2},
				        {type = 153,value = 26633,job =2},

				        {type = 154,value = 660,job =3},
				        {type = 153,value = 26633,job =3},

				    },
				},
--34级 
				{
					needJingHua = 2600, 
					attr=
					{
				        {type = 154,value = 680,job =1},
				        {type = 153,value = 27475,job =1},

				        {type = 154,value = 680,job =2},
				        {type = 153,value = 27475,job =2},

				        {type = 154,value = 680,job =3},
				        {type = 153,value = 27475,job =3},

				    },
				},
--35级 
				{
					needJingHua = 2700, 
					attr=
					{
				        {type = 154,value = 700,job =1},
				        {type = 153,value = 28350,job =1},

				        {type = 154,value = 700,job =2},
				        {type = 153,value = 28350,job =2},

				        {type = 154,value = 700,job =3},
				        {type = 153,value = 28350,job =3},

				    },
				},
--36级 
				{
					needJingHua = 2800, 
					attr=
					{
				        {type = 154,value = 720,job =1},
				        {type = 153,value = 29257,job =1},

				        {type = 154,value = 720,job =2},
				        {type = 153,value = 29257,job =2},

				        {type = 154,value = 720,job =3},
				        {type = 153,value = 29257,job =3},

				    },
				},
--37级 
				{
					needJingHua = 2900, 
					attr=
					{
				        {type = 154,value = 740,job =1},
				        {type = 153,value = 30197,job =1},

				        {type = 154,value = 740,job =2},
				        {type = 153,value = 30197,job =2},

				        {type = 154,value = 740,job =3},
				        {type = 153,value = 30197,job =3},

				    },
				},
--38级 
				{
					needJingHua = 3000, 
					attr=
					{
				        {type = 154,value = 760,job =1},
				        {type = 153,value = 31169,job =1},

				        {type = 154,value = 760,job =2},
				        {type = 153,value = 31169,job =2},

				        {type = 154,value = 760,job =3},
				        {type = 153,value = 31169,job =3},

				    },
				},
--39级 
				{
					needJingHua = 3100, 
					attr=
					{
				        {type = 154,value = 780,job =1},
				        {type = 153,value = 32173,job =1},

				        {type = 154,value = 780,job =2},
				        {type = 153,value = 32173,job =2},

				        {type = 154,value = 780,job =3},
				        {type = 153,value = 32173,job =3},

				    },
				},
--40级 
				{
					needJingHua = 3200, 
					attr=
					{
				        {type = 154,value = 800,job =1},
				        {type = 153,value = 33210,job =1},

				        {type = 154,value = 800,job =2},
				        {type = 153,value = 33210,job =2},

				        {type = 154,value = 800,job =3},
				        {type = 153,value = 33210,job =3},

				    },
				},
--41级 
				{
					needJingHua = 3300, 
					attr=
					{
				        {type = 154,value = 820,job =1},
				        {type = 153,value = 34279,job =1},

				        {type = 154,value = 820,job =2},
				        {type = 153,value = 34279,job =2},

				        {type = 154,value = 820,job =3},
				        {type = 153,value = 34279,job =3},

				    },
				},
--42级 
				{
					needJingHua = 3400, 
					attr=
					{
				        {type = 154,value = 840,job =1},
				        {type = 153,value = 35381,job =1},

				        {type = 154,value = 840,job =2},
				        {type = 153,value = 35381,job =2},

				        {type = 154,value = 840,job =3},
				        {type = 153,value = 35381,job =3},

				    },
				},
--43级 
				{
					needJingHua = 3500, 
					attr=
					{
				        {type = 154,value = 860,job =1},
				        {type = 153,value = 36515,job =1},

				        {type = 154,value = 860,job =2},
				        {type = 153,value = 36515,job =2},

				        {type = 154,value = 860,job =3},
				        {type = 153,value = 36515,job =3},

				    },
				},
--44级 
				{
					needJingHua = 3600, 
					attr=
					{
				        {type = 154,value = 880,job =1},
				        {type = 153,value = 37681,job =1},

				        {type = 154,value = 880,job =2},
				        {type = 153,value = 37681,job =2},

				        {type = 154,value = 880,job =3},
				        {type = 153,value = 37681,job =3},

				    },
				},
--45级 
				{
					needJingHua = 3700, 
					attr=
					{
				        {type = 154,value = 900,job =1},
				        {type = 153,value = 38880,job =1},

				        {type = 154,value = 900,job =2},
				        {type = 153,value = 38880,job =2},

				        {type = 154,value = 900,job =3},
				        {type = 153,value = 38880,job =3},

				    },
				},
--46级 
				{
					needJingHua = 3800, 
					attr=
					{
				        {type = 154,value = 920,job =1},
				        {type = 153,value = 40111,job =1},

				        {type = 154,value = 920,job =2},
				        {type = 153,value = 40111,job =2},

				        {type = 154,value = 920,job =3},
				        {type = 153,value = 40111,job =3},

				    },
				},
--47级 
				{
					needJingHua = 3900, 
					attr=
					{
				        {type = 154,value = 940,job =1},
				        {type = 153,value = 41375,job =1},

				        {type = 154,value = 940,job =2},
				        {type = 153,value = 41375,job =2},

				        {type = 154,value = 940,job =3},
				        {type = 153,value = 41375,job =3},

				    },
				},
--48级 
				{
					needJingHua = 4000, 
					attr=
					{
				        {type = 154,value = 960,job =1},
				        {type = 153,value = 42671,job =1},

				        {type = 154,value = 960,job =2},
				        {type = 153,value = 42671,job =2},

				        {type = 154,value = 960,job =3},
				        {type = 153,value = 42671,job =3},

				    },
				},
--49级 
				{
					needJingHua = 4100, 
					attr=
					{
				        {type = 154,value = 980,job =1},
				        {type = 153,value = 43999,job =1},

				        {type = 154,value = 980,job =2},
				        {type = 153,value = 43999,job =2},

				        {type = 154,value = 980,job =3},
				        {type = 153,value = 43999,job =3},

				    },
				},
--50级 
				{
					needJingHua = 4200, 
					attr=
					{
				        {type = 154,value = 1000,job =1},
				        {type = 153,value = 45360,job =1},

				        {type = 154,value = 1000,job =2},
				        {type = 153,value = 45360,job =2},

				        {type = 154,value = 1000,job =3},
				        {type = 153,value = 45360,job =3},

				    },
				},

	
			
			
			},
		},
	
		{	
			position = 24,
			name = "面甲",
			level=
			{
	--1级 
				{
					needJingHua = 30, 
					attr=
					{
				        {type = 154,value = 20,job =1},
				        {type = 153,value = 97,job =1},

				        {type = 154,value = 20,job =2},
				        {type = 153,value = 97,job =2},

				        {type = 154,value = 20,job =3},
				        {type = 153,value = 97,job =3},

				    },
				},
--2级 
				{
					needJingHua = 40, 
					attr=
					{
				        {type = 154,value = 40,job =1},
				        {type = 153,value = 221,job =1},

				        {type = 154,value = 40,job =2},
				        {type = 153,value = 221,job =2},

				        {type = 154,value = 40,job =3},
				        {type = 153,value = 221,job =3},

				    },
				},
--3级 
				{
					needJingHua = 50, 
					attr=
					{
				        {type = 154,value = 60,job =1},
				        {type = 153,value = 373,job =1},

				        {type = 154,value = 60,job =2},
				        {type = 153,value = 373,job =2},

				        {type = 154,value = 60,job =3},
				        {type = 153,value = 373,job =3},

				    },
				},
--4级 
				{
					needJingHua = 60, 
					attr=
					{
				        {type = 154,value = 80,job =1},
				        {type = 153,value = 545,job =1},

				        {type = 154,value = 80,job =2},
				        {type = 153,value = 545,job =2},

				        {type = 154,value = 80,job =3},
				        {type = 153,value = 545,job =3},

				    },
				},
--5级 
				{
					needJingHua = 70, 
					attr=
					{
				        {type = 154,value = 100,job =1},
				        {type = 153,value = 740,job =1},

				        {type = 154,value = 100,job =2},
				        {type = 153,value = 740,job =2},

				        {type = 154,value = 100,job =3},
				        {type = 153,value = 740,job =3},

				    },
				},
--6级 
				{
					needJingHua = 80, 
					attr=
					{
				        {type = 154,value = 120,job =1},
				        {type = 153,value = 956,job =1},

				        {type = 154,value = 120,job =2},
				        {type = 153,value = 956,job =2},

				        {type = 154,value = 120,job =3},
				        {type = 153,value = 956,job =3},

				    },
				},
--7级 
				{
					needJingHua = 100, 
					attr=
					{
				        {type = 154,value = 140,job =1},
				        {type = 153,value = 1215,job =1},

				        {type = 154,value = 140,job =2},
				        {type = 153,value = 1215,job =2},

				        {type = 154,value = 140,job =3},
				        {type = 153,value = 1215,job =3},

				    },
				},
--8级 
				{
					needJingHua = 120, 
					attr=
					{
				        {type = 154,value = 160,job =1},
				        {type = 153,value = 1512,job =1},

				        {type = 154,value = 160,job =2},
				        {type = 153,value = 1512,job =2},

				        {type = 154,value = 160,job =3},
				        {type = 153,value = 1512,job =3},

				    },
				},
--9级 
				{
					needJingHua = 150, 
					attr=
					{
				        {type = 154,value = 180,job =1},
				        {type = 153,value = 1868,job =1},

				        {type = 154,value = 180,job =2},
				        {type = 153,value = 1868,job =2},

				        {type = 154,value = 180,job =3},
				        {type = 153,value = 1868,job =3},

				    },
				},
--10级 
				{
					needJingHua = 200, 
					attr=
					{
				        {type = 154,value = 200,job =1},
				        {type = 153,value = 2322,job =1},

				        {type = 154,value = 200,job =2},
				        {type = 153,value = 2322,job =2},

				        {type = 154,value = 200,job =3},
				        {type = 153,value = 2322,job =3},

				    },
				},
--11级 
				{
					needJingHua = 300, 
					attr=
					{
				        {type = 154,value = 220,job =1},
				        {type = 153,value = 2970,job =1},

				        {type = 154,value = 220,job =2},
				        {type = 153,value = 2970,job =2},

				        {type = 154,value = 220,job =3},
				        {type = 153,value = 2970,job =3},

				    },
				},
--12级 
				{
					needJingHua = 400, 
					attr=
					{
				        {type = 154,value = 240,job =1},
				        {type = 153,value = 3791,job =1},

				        {type = 154,value = 240,job =2},
				        {type = 153,value = 3791,job =2},

				        {type = 154,value = 240,job =3},
				        {type = 153,value = 3791,job =3},

				    },
				},
--13级 
				{
					needJingHua = 500, 
					attr=
					{
				        {type = 154,value = 260,job =1},
				        {type = 153,value = 4763,job =1},

				        {type = 154,value = 260,job =2},
				        {type = 153,value = 4763,job =2},

				        {type = 154,value = 260,job =3},
				        {type = 153,value = 4763,job =3},

				    },
				},
--14级 
				{
					needJingHua = 600, 
					attr=
					{
				        {type = 154,value = 280,job =1},
				        {type = 153,value = 5864,job =1},

				        {type = 154,value = 280,job =2},
				        {type = 153,value = 5864,job =2},

				        {type = 154,value = 280,job =3},
				        {type = 153,value = 5864,job =3},

				    },
				},
--15级 
				{
					needJingHua = 700, 
					attr=
					{
				        {type = 154,value = 300,job =1},
				        {type = 153,value = 7074,job =1},

				        {type = 154,value = 300,job =2},
				        {type = 153,value = 7074,job =2},

				        {type = 154,value = 300,job =3},
				        {type = 153,value = 7074,job =3},

				    },
				},
--16级 
				{
					needJingHua = 800, 
					attr=
					{
				        {type = 154,value = 320,job =1},
				        {type = 153,value = 8370,job =1},

				        {type = 154,value = 320,job =2},
				        {type = 153,value = 8370,job =2},

				        {type = 154,value = 320,job =3},
				        {type = 153,value = 8370,job =3},

				    },
				},
--17级 
				{
					needJingHua = 900, 
					attr=
					{
				        {type = 154,value = 340,job =1},
				        {type = 153,value = 9731,job =1},

				        {type = 154,value = 340,job =2},
				        {type = 153,value = 9731,job =2},

				        {type = 154,value = 340,job =3},
				        {type = 153,value = 9731,job =3},

				    },
				},
--18级 
				{
					needJingHua = 1000, 
					attr=
					{
				        {type = 154,value = 360,job =1},
				        {type = 153,value = 11135,job =1},

				        {type = 154,value = 360,job =2},
				        {type = 153,value = 11135,job =2},

				        {type = 154,value = 360,job =3},
				        {type = 153,value = 11135,job =3},

				    },
				},
--19级 
				{
					needJingHua = 1100, 
					attr=
					{
				        {type = 154,value = 380,job =1},
				        {type = 153,value = 12560,job =1},

				        {type = 154,value = 380,job =2},
				        {type = 153,value = 12560,job =2},

				        {type = 154,value = 380,job =3},
				        {type = 153,value = 12560,job =3},

				    },
				},
--20级 
				{
					needJingHua = 1200, 
					attr=
					{
				        {type = 154,value = 400,job =1},
				        {type = 153,value = 13986,job =1},

				        {type = 154,value = 400,job =2},
				        {type = 153,value = 13986,job =2},

				        {type = 154,value = 400,job =3},
				        {type = 153,value = 13986,job =3},

				    },
				},
--21级 
				{
					needJingHua = 1300, 
					attr=
					{
				        {type = 154,value = 420,job =1},
				        {type = 153,value = 15390,job =1},

				        {type = 154,value = 420,job =2},
				        {type = 153,value = 15390,job =2},

				        {type = 154,value = 420,job =3},
				        {type = 153,value = 15390,job =3},

				    },
				},
--22级 
				{
					needJingHua = 1400, 
					attr=
					{
				        {type = 154,value = 440,job =1},
				        {type = 153,value = 16751,job =1},

				        {type = 154,value = 440,job =2},
				        {type = 153,value = 16751,job =2},

				        {type = 154,value = 440,job =3},
				        {type = 153,value = 16751,job =3},

				    },
				},
--23级 
				{
					needJingHua = 1500, 
					attr=
					{
				        {type = 154,value = 460,job =1},
				        {type = 153,value = 18047,job =1},

				        {type = 154,value = 460,job =2},
				        {type = 153,value = 18047,job =2},

				        {type = 154,value = 460,job =3},
				        {type = 153,value = 18047,job =3},

				    },
				},
--24级 
				{
					needJingHua = 1600, 
					attr=
					{
				        {type = 154,value = 480,job =1},
				        {type = 153,value = 19256,job =1},

				        {type = 154,value = 480,job =2},
				        {type = 153,value = 19256,job =2},

				        {type = 154,value = 480,job =3},
				        {type = 153,value = 19256,job =3},

				    },
				},
--25级 
				{
					needJingHua = 1700, 
					attr=
					{
				        {type = 154,value = 500,job =1},
				        {type = 153,value = 20358,job =1},

				        {type = 154,value = 500,job =2},
				        {type = 153,value = 20358,job =2},

				        {type = 154,value = 500,job =3},
				        {type = 153,value = 20358,job =3},

				    },
				},
--26级 
				{
					needJingHua = 1800, 
					attr=
					{
				        {type = 154,value = 520,job =1},
				        {type = 153,value = 21330,job =1},

				        {type = 154,value = 520,job =2},
				        {type = 153,value = 21330,job =2},

				        {type = 154,value = 520,job =3},
				        {type = 153,value = 21330,job =3},

				    },
				},
--27级 
				{
					needJingHua = 1900, 
					attr=
					{
				        {type = 154,value = 540,job =1},
				        {type = 153,value = 22151,job =1},

				        {type = 154,value = 540,job =2},
				        {type = 153,value = 22151,job =2},

				        {type = 154,value = 540,job =3},
				        {type = 153,value = 22151,job =3},

				    },
				},
--28级 
				{
					needJingHua = 2000, 
					attr=
					{
				        {type = 154,value = 560,job =1},
				        {type = 153,value = 22907,job =1},

				        {type = 154,value = 560,job =2},
				        {type = 153,value = 22907,job =2},

				        {type = 154,value = 560,job =3},
				        {type = 153,value = 22907,job =3},

				    },
				},
--29级 
				{
					needJingHua = 2100, 
					attr=
					{
				        {type = 154,value = 580,job =1},
				        {type = 153,value = 23587,job =1},

				        {type = 154,value = 580,job =2},
				        {type = 153,value = 23587,job =2},

				        {type = 154,value = 580,job =3},
				        {type = 153,value = 23587,job =3},

				    },
				},
--30级 
				{
					needJingHua = 2200, 
					attr=
					{
				        {type = 154,value = 600,job =1},
				        {type = 153,value = 24300,job =1},

				        {type = 154,value = 600,job =2},
				        {type = 153,value = 24300,job =2},

				        {type = 154,value = 600,job =3},
				        {type = 153,value = 24300,job =3},

				    },
				},
--31级 
				{
					needJingHua = 2300, 
					attr=
					{
				        {type = 154,value = 620,job =1},
				        {type = 153,value = 25045,job =1},

				        {type = 154,value = 620,job =2},
				        {type = 153,value = 25045,job =2},

				        {type = 154,value = 620,job =3},
				        {type = 153,value = 25045,job =3},

				    },
				},
--32级 
				{
					needJingHua = 2400, 
					attr=
					{
				        {type = 154,value = 640,job =1},
				        {type = 153,value = 25823,job =1},

				        {type = 154,value = 640,job =2},
				        {type = 153,value = 25823,job =2},

				        {type = 154,value = 640,job =3},
				        {type = 153,value = 25823,job =3},

				    },
				},
--33级 
				{
					needJingHua = 2500, 
					attr=
					{
				        {type = 154,value = 660,job =1},
				        {type = 153,value = 26633,job =1},

				        {type = 154,value = 660,job =2},
				        {type = 153,value = 26633,job =2},

				        {type = 154,value = 660,job =3},
				        {type = 153,value = 26633,job =3},

				    },
				},
--34级 
				{
					needJingHua = 2600, 
					attr=
					{
				        {type = 154,value = 680,job =1},
				        {type = 153,value = 27475,job =1},

				        {type = 154,value = 680,job =2},
				        {type = 153,value = 27475,job =2},

				        {type = 154,value = 680,job =3},
				        {type = 153,value = 27475,job =3},

				    },
				},
--35级 
				{
					needJingHua = 2700, 
					attr=
					{
				        {type = 154,value = 700,job =1},
				        {type = 153,value = 28350,job =1},

				        {type = 154,value = 700,job =2},
				        {type = 153,value = 28350,job =2},

				        {type = 154,value = 700,job =3},
				        {type = 153,value = 28350,job =3},

				    },
				},
--36级 
				{
					needJingHua = 2800, 
					attr=
					{
				        {type = 154,value = 720,job =1},
				        {type = 153,value = 29257,job =1},

				        {type = 154,value = 720,job =2},
				        {type = 153,value = 29257,job =2},

				        {type = 154,value = 720,job =3},
				        {type = 153,value = 29257,job =3},

				    },
				},
--37级 
				{
					needJingHua = 2900, 
					attr=
					{
				        {type = 154,value = 740,job =1},
				        {type = 153,value = 30197,job =1},

				        {type = 154,value = 740,job =2},
				        {type = 153,value = 30197,job =2},

				        {type = 154,value = 740,job =3},
				        {type = 153,value = 30197,job =3},

				    },
				},
--38级 
				{
					needJingHua = 3000, 
					attr=
					{
				        {type = 154,value = 760,job =1},
				        {type = 153,value = 31169,job =1},

				        {type = 154,value = 760,job =2},
				        {type = 153,value = 31169,job =2},

				        {type = 154,value = 760,job =3},
				        {type = 153,value = 31169,job =3},

				    },
				},
--39级 
				{
					needJingHua = 3100, 
					attr=
					{
				        {type = 154,value = 780,job =1},
				        {type = 153,value = 32173,job =1},

				        {type = 154,value = 780,job =2},
				        {type = 153,value = 32173,job =2},

				        {type = 154,value = 780,job =3},
				        {type = 153,value = 32173,job =3},

				    },
				},
--40级 
				{
					needJingHua = 3200, 
					attr=
					{
				        {type = 154,value = 800,job =1},
				        {type = 153,value = 33210,job =1},

				        {type = 154,value = 800,job =2},
				        {type = 153,value = 33210,job =2},

				        {type = 154,value = 800,job =3},
				        {type = 153,value = 33210,job =3},

				    },
				},
--41级 
				{
					needJingHua = 3300, 
					attr=
					{
				        {type = 154,value = 820,job =1},
				        {type = 153,value = 34279,job =1},

				        {type = 154,value = 820,job =2},
				        {type = 153,value = 34279,job =2},

				        {type = 154,value = 820,job =3},
				        {type = 153,value = 34279,job =3},

				    },
				},
--42级 
				{
					needJingHua = 3400, 
					attr=
					{
				        {type = 154,value = 840,job =1},
				        {type = 153,value = 35381,job =1},

				        {type = 154,value = 840,job =2},
				        {type = 153,value = 35381,job =2},

				        {type = 154,value = 840,job =3},
				        {type = 153,value = 35381,job =3},

				    },
				},
--43级 
				{
					needJingHua = 3500, 
					attr=
					{
				        {type = 154,value = 860,job =1},
				        {type = 153,value = 36515,job =1},

				        {type = 154,value = 860,job =2},
				        {type = 153,value = 36515,job =2},

				        {type = 154,value = 860,job =3},
				        {type = 153,value = 36515,job =3},

				    },
				},
--44级 
				{
					needJingHua = 3600, 
					attr=
					{
				        {type = 154,value = 880,job =1},
				        {type = 153,value = 37681,job =1},

				        {type = 154,value = 880,job =2},
				        {type = 153,value = 37681,job =2},

				        {type = 154,value = 880,job =3},
				        {type = 153,value = 37681,job =3},

				    },
				},
--45级 
				{
					needJingHua = 3700, 
					attr=
					{
				        {type = 154,value = 900,job =1},
				        {type = 153,value = 38880,job =1},

				        {type = 154,value = 900,job =2},
				        {type = 153,value = 38880,job =2},

				        {type = 154,value = 900,job =3},
				        {type = 153,value = 38880,job =3},

				    },
				},
--46级 
				{
					needJingHua = 3800, 
					attr=
					{
				        {type = 154,value = 920,job =1},
				        {type = 153,value = 40111,job =1},

				        {type = 154,value = 920,job =2},
				        {type = 153,value = 40111,job =2},

				        {type = 154,value = 920,job =3},
				        {type = 153,value = 40111,job =3},

				    },
				},
--47级 
				{
					needJingHua = 3900, 
					attr=
					{
				        {type = 154,value = 940,job =1},
				        {type = 153,value = 41375,job =1},

				        {type = 154,value = 940,job =2},
				        {type = 153,value = 41375,job =2},

				        {type = 154,value = 940,job =3},
				        {type = 153,value = 41375,job =3},

				    },
				},
--48级 
				{
					needJingHua = 4000, 
					attr=
					{
				        {type = 154,value = 960,job =1},
				        {type = 153,value = 42671,job =1},

				        {type = 154,value = 960,job =2},
				        {type = 153,value = 42671,job =2},

				        {type = 154,value = 960,job =3},
				        {type = 153,value = 42671,job =3},

				    },
				},
--49级 
				{
					needJingHua = 4100, 
					attr=
					{
				        {type = 154,value = 980,job =1},
				        {type = 153,value = 43999,job =1},

				        {type = 154,value = 980,job =2},
				        {type = 153,value = 43999,job =2},

				        {type = 154,value = 980,job =3},
				        {type = 153,value = 43999,job =3},

				    },
				},
--50级 
				{
					needJingHua = 4200, 
					attr=
					{
				        {type = 154,value = 1000,job =1},
				        {type = 153,value = 45360,job =1},

				        {type = 154,value = 1000,job =2},
				        {type = 153,value = 45360,job =2},

				        {type = 154,value = 1000,job =3},
				        {type = 153,value = 45360,job =3},

				    },
				},

	
			
			
			},
		},
	
	
		{	
			position = 25,
			name = "护膝",
			level=
			{
	--1级 
				{
					needJingHua = 30, 
					attr=
					{
				        {type = 154,value = 20,job =1},
				        {type = 153,value = 97,job =1},

				        {type = 154,value = 20,job =2},
				        {type = 153,value = 97,job =2},

				        {type = 154,value = 20,job =3},
				        {type = 153,value = 97,job =3},

				    },
				},
--2级 
				{
					needJingHua = 40, 
					attr=
					{
				        {type = 154,value = 40,job =1},
				        {type = 153,value = 221,job =1},

				        {type = 154,value = 40,job =2},
				        {type = 153,value = 221,job =2},

				        {type = 154,value = 40,job =3},
				        {type = 153,value = 221,job =3},

				    },
				},
--3级 
				{
					needJingHua = 50, 
					attr=
					{
				        {type = 154,value = 60,job =1},
				        {type = 153,value = 373,job =1},

				        {type = 154,value = 60,job =2},
				        {type = 153,value = 373,job =2},

				        {type = 154,value = 60,job =3},
				        {type = 153,value = 373,job =3},

				    },
				},
--4级 
				{
					needJingHua = 60, 
					attr=
					{
				        {type = 154,value = 80,job =1},
				        {type = 153,value = 545,job =1},

				        {type = 154,value = 80,job =2},
				        {type = 153,value = 545,job =2},

				        {type = 154,value = 80,job =3},
				        {type = 153,value = 545,job =3},

				    },
				},
--5级 
				{
					needJingHua = 70, 
					attr=
					{
				        {type = 154,value = 100,job =1},
				        {type = 153,value = 740,job =1},

				        {type = 154,value = 100,job =2},
				        {type = 153,value = 740,job =2},

				        {type = 154,value = 100,job =3},
				        {type = 153,value = 740,job =3},

				    },
				},
--6级 
				{
					needJingHua = 80, 
					attr=
					{
				        {type = 154,value = 120,job =1},
				        {type = 153,value = 956,job =1},

				        {type = 154,value = 120,job =2},
				        {type = 153,value = 956,job =2},

				        {type = 154,value = 120,job =3},
				        {type = 153,value = 956,job =3},

				    },
				},
--7级 
				{
					needJingHua = 100, 
					attr=
					{
				        {type = 154,value = 140,job =1},
				        {type = 153,value = 1215,job =1},

				        {type = 154,value = 140,job =2},
				        {type = 153,value = 1215,job =2},

				        {type = 154,value = 140,job =3},
				        {type = 153,value = 1215,job =3},

				    },
				},
--8级 
				{
					needJingHua = 120, 
					attr=
					{
				        {type = 154,value = 160,job =1},
				        {type = 153,value = 1512,job =1},

				        {type = 154,value = 160,job =2},
				        {type = 153,value = 1512,job =2},

				        {type = 154,value = 160,job =3},
				        {type = 153,value = 1512,job =3},

				    },
				},
--9级 
				{
					needJingHua = 150, 
					attr=
					{
				        {type = 154,value = 180,job =1},
				        {type = 153,value = 1868,job =1},

				        {type = 154,value = 180,job =2},
				        {type = 153,value = 1868,job =2},

				        {type = 154,value = 180,job =3},
				        {type = 153,value = 1868,job =3},

				    },
				},
--10级 
				{
					needJingHua = 200, 
					attr=
					{
				        {type = 154,value = 200,job =1},
				        {type = 153,value = 2322,job =1},

				        {type = 154,value = 200,job =2},
				        {type = 153,value = 2322,job =2},

				        {type = 154,value = 200,job =3},
				        {type = 153,value = 2322,job =3},

				    },
				},
--11级 
				{
					needJingHua = 300, 
					attr=
					{
				        {type = 154,value = 220,job =1},
				        {type = 153,value = 2970,job =1},

				        {type = 154,value = 220,job =2},
				        {type = 153,value = 2970,job =2},

				        {type = 154,value = 220,job =3},
				        {type = 153,value = 2970,job =3},

				    },
				},
--12级 
				{
					needJingHua = 400, 
					attr=
					{
				        {type = 154,value = 240,job =1},
				        {type = 153,value = 3791,job =1},

				        {type = 154,value = 240,job =2},
				        {type = 153,value = 3791,job =2},

				        {type = 154,value = 240,job =3},
				        {type = 153,value = 3791,job =3},

				    },
				},
--13级 
				{
					needJingHua = 500, 
					attr=
					{
				        {type = 154,value = 260,job =1},
				        {type = 153,value = 4763,job =1},

				        {type = 154,value = 260,job =2},
				        {type = 153,value = 4763,job =2},

				        {type = 154,value = 260,job =3},
				        {type = 153,value = 4763,job =3},

				    },
				},
--14级 
				{
					needJingHua = 600, 
					attr=
					{
				        {type = 154,value = 280,job =1},
				        {type = 153,value = 5864,job =1},

				        {type = 154,value = 280,job =2},
				        {type = 153,value = 5864,job =2},

				        {type = 154,value = 280,job =3},
				        {type = 153,value = 5864,job =3},

				    },
				},
--15级 
				{
					needJingHua = 700, 
					attr=
					{
				        {type = 154,value = 300,job =1},
				        {type = 153,value = 7074,job =1},

				        {type = 154,value = 300,job =2},
				        {type = 153,value = 7074,job =2},

				        {type = 154,value = 300,job =3},
				        {type = 153,value = 7074,job =3},

				    },
				},
--16级 
				{
					needJingHua = 800, 
					attr=
					{
				        {type = 154,value = 320,job =1},
				        {type = 153,value = 8370,job =1},

				        {type = 154,value = 320,job =2},
				        {type = 153,value = 8370,job =2},

				        {type = 154,value = 320,job =3},
				        {type = 153,value = 8370,job =3},

				    },
				},
--17级 
				{
					needJingHua = 900, 
					attr=
					{
				        {type = 154,value = 340,job =1},
				        {type = 153,value = 9731,job =1},

				        {type = 154,value = 340,job =2},
				        {type = 153,value = 9731,job =2},

				        {type = 154,value = 340,job =3},
				        {type = 153,value = 9731,job =3},

				    },
				},
--18级 
				{
					needJingHua = 1000, 
					attr=
					{
				        {type = 154,value = 360,job =1},
				        {type = 153,value = 11135,job =1},

				        {type = 154,value = 360,job =2},
				        {type = 153,value = 11135,job =2},

				        {type = 154,value = 360,job =3},
				        {type = 153,value = 11135,job =3},

				    },
				},
--19级 
				{
					needJingHua = 1100, 
					attr=
					{
				        {type = 154,value = 380,job =1},
				        {type = 153,value = 12560,job =1},

				        {type = 154,value = 380,job =2},
				        {type = 153,value = 12560,job =2},

				        {type = 154,value = 380,job =3},
				        {type = 153,value = 12560,job =3},

				    },
				},
--20级 
				{
					needJingHua = 1200, 
					attr=
					{
				        {type = 154,value = 400,job =1},
				        {type = 153,value = 13986,job =1},

				        {type = 154,value = 400,job =2},
				        {type = 153,value = 13986,job =2},

				        {type = 154,value = 400,job =3},
				        {type = 153,value = 13986,job =3},

				    },
				},
--21级 
				{
					needJingHua = 1300, 
					attr=
					{
				        {type = 154,value = 420,job =1},
				        {type = 153,value = 15390,job =1},

				        {type = 154,value = 420,job =2},
				        {type = 153,value = 15390,job =2},

				        {type = 154,value = 420,job =3},
				        {type = 153,value = 15390,job =3},

				    },
				},
--22级 
				{
					needJingHua = 1400, 
					attr=
					{
				        {type = 154,value = 440,job =1},
				        {type = 153,value = 16751,job =1},

				        {type = 154,value = 440,job =2},
				        {type = 153,value = 16751,job =2},

				        {type = 154,value = 440,job =3},
				        {type = 153,value = 16751,job =3},

				    },
				},
--23级 
				{
					needJingHua = 1500, 
					attr=
					{
				        {type = 154,value = 460,job =1},
				        {type = 153,value = 18047,job =1},

				        {type = 154,value = 460,job =2},
				        {type = 153,value = 18047,job =2},

				        {type = 154,value = 460,job =3},
				        {type = 153,value = 18047,job =3},

				    },
				},
--24级 
				{
					needJingHua = 1600, 
					attr=
					{
				        {type = 154,value = 480,job =1},
				        {type = 153,value = 19256,job =1},

				        {type = 154,value = 480,job =2},
				        {type = 153,value = 19256,job =2},

				        {type = 154,value = 480,job =3},
				        {type = 153,value = 19256,job =3},

				    },
				},
--25级 
				{
					needJingHua = 1700, 
					attr=
					{
				        {type = 154,value = 500,job =1},
				        {type = 153,value = 20358,job =1},

				        {type = 154,value = 500,job =2},
				        {type = 153,value = 20358,job =2},

				        {type = 154,value = 500,job =3},
				        {type = 153,value = 20358,job =3},

				    },
				},
--26级 
				{
					needJingHua = 1800, 
					attr=
					{
				        {type = 154,value = 520,job =1},
				        {type = 153,value = 21330,job =1},

				        {type = 154,value = 520,job =2},
				        {type = 153,value = 21330,job =2},

				        {type = 154,value = 520,job =3},
				        {type = 153,value = 21330,job =3},

				    },
				},
--27级 
				{
					needJingHua = 1900, 
					attr=
					{
				        {type = 154,value = 540,job =1},
				        {type = 153,value = 22151,job =1},

				        {type = 154,value = 540,job =2},
				        {type = 153,value = 22151,job =2},

				        {type = 154,value = 540,job =3},
				        {type = 153,value = 22151,job =3},

				    },
				},
--28级 
				{
					needJingHua = 2000, 
					attr=
					{
				        {type = 154,value = 560,job =1},
				        {type = 153,value = 22907,job =1},

				        {type = 154,value = 560,job =2},
				        {type = 153,value = 22907,job =2},

				        {type = 154,value = 560,job =3},
				        {type = 153,value = 22907,job =3},

				    },
				},
--29级 
				{
					needJingHua = 2100, 
					attr=
					{
				        {type = 154,value = 580,job =1},
				        {type = 153,value = 23587,job =1},

				        {type = 154,value = 580,job =2},
				        {type = 153,value = 23587,job =2},

				        {type = 154,value = 580,job =3},
				        {type = 153,value = 23587,job =3},

				    },
				},
--30级 
				{
					needJingHua = 2200, 
					attr=
					{
				        {type = 154,value = 600,job =1},
				        {type = 153,value = 24300,job =1},

				        {type = 154,value = 600,job =2},
				        {type = 153,value = 24300,job =2},

				        {type = 154,value = 600,job =3},
				        {type = 153,value = 24300,job =3},

				    },
				},
--31级 
				{
					needJingHua = 2300, 
					attr=
					{
				        {type = 154,value = 620,job =1},
				        {type = 153,value = 25045,job =1},

				        {type = 154,value = 620,job =2},
				        {type = 153,value = 25045,job =2},

				        {type = 154,value = 620,job =3},
				        {type = 153,value = 25045,job =3},

				    },
				},
--32级 
				{
					needJingHua = 2400, 
					attr=
					{
				        {type = 154,value = 640,job =1},
				        {type = 153,value = 25823,job =1},

				        {type = 154,value = 640,job =2},
				        {type = 153,value = 25823,job =2},

				        {type = 154,value = 640,job =3},
				        {type = 153,value = 25823,job =3},

				    },
				},
--33级 
				{
					needJingHua = 2500, 
					attr=
					{
				        {type = 154,value = 660,job =1},
				        {type = 153,value = 26633,job =1},

				        {type = 154,value = 660,job =2},
				        {type = 153,value = 26633,job =2},

				        {type = 154,value = 660,job =3},
				        {type = 153,value = 26633,job =3},

				    },
				},
--34级 
				{
					needJingHua = 2600, 
					attr=
					{
				        {type = 154,value = 680,job =1},
				        {type = 153,value = 27475,job =1},

				        {type = 154,value = 680,job =2},
				        {type = 153,value = 27475,job =2},

				        {type = 154,value = 680,job =3},
				        {type = 153,value = 27475,job =3},

				    },
				},
--35级 
				{
					needJingHua = 2700, 
					attr=
					{
				        {type = 154,value = 700,job =1},
				        {type = 153,value = 28350,job =1},

				        {type = 154,value = 700,job =2},
				        {type = 153,value = 28350,job =2},

				        {type = 154,value = 700,job =3},
				        {type = 153,value = 28350,job =3},

				    },
				},
--36级 
				{
					needJingHua = 2800, 
					attr=
					{
				        {type = 154,value = 720,job =1},
				        {type = 153,value = 29257,job =1},

				        {type = 154,value = 720,job =2},
				        {type = 153,value = 29257,job =2},

				        {type = 154,value = 720,job =3},
				        {type = 153,value = 29257,job =3},

				    },
				},
--37级 
				{
					needJingHua = 2900, 
					attr=
					{
				        {type = 154,value = 740,job =1},
				        {type = 153,value = 30197,job =1},

				        {type = 154,value = 740,job =2},
				        {type = 153,value = 30197,job =2},

				        {type = 154,value = 740,job =3},
				        {type = 153,value = 30197,job =3},

				    },
				},
--38级 
				{
					needJingHua = 3000, 
					attr=
					{
				        {type = 154,value = 760,job =1},
				        {type = 153,value = 31169,job =1},

				        {type = 154,value = 760,job =2},
				        {type = 153,value = 31169,job =2},

				        {type = 154,value = 760,job =3},
				        {type = 153,value = 31169,job =3},

				    },
				},
--39级 
				{
					needJingHua = 3100, 
					attr=
					{
				        {type = 154,value = 780,job =1},
				        {type = 153,value = 32173,job =1},

				        {type = 154,value = 780,job =2},
				        {type = 153,value = 32173,job =2},

				        {type = 154,value = 780,job =3},
				        {type = 153,value = 32173,job =3},

				    },
				},
--40级 
				{
					needJingHua = 3200, 
					attr=
					{
				        {type = 154,value = 800,job =1},
				        {type = 153,value = 33210,job =1},

				        {type = 154,value = 800,job =2},
				        {type = 153,value = 33210,job =2},

				        {type = 154,value = 800,job =3},
				        {type = 153,value = 33210,job =3},

				    },
				},
--41级 
				{
					needJingHua = 3300, 
					attr=
					{
				        {type = 154,value = 820,job =1},
				        {type = 153,value = 34279,job =1},

				        {type = 154,value = 820,job =2},
				        {type = 153,value = 34279,job =2},

				        {type = 154,value = 820,job =3},
				        {type = 153,value = 34279,job =3},

				    },
				},
--42级 
				{
					needJingHua = 3400, 
					attr=
					{
				        {type = 154,value = 840,job =1},
				        {type = 153,value = 35381,job =1},

				        {type = 154,value = 840,job =2},
				        {type = 153,value = 35381,job =2},

				        {type = 154,value = 840,job =3},
				        {type = 153,value = 35381,job =3},

				    },
				},
--43级 
				{
					needJingHua = 3500, 
					attr=
					{
				        {type = 154,value = 860,job =1},
				        {type = 153,value = 36515,job =1},

				        {type = 154,value = 860,job =2},
				        {type = 153,value = 36515,job =2},

				        {type = 154,value = 860,job =3},
				        {type = 153,value = 36515,job =3},

				    },
				},
--44级 
				{
					needJingHua = 3600, 
					attr=
					{
				        {type = 154,value = 880,job =1},
				        {type = 153,value = 37681,job =1},

				        {type = 154,value = 880,job =2},
				        {type = 153,value = 37681,job =2},

				        {type = 154,value = 880,job =3},
				        {type = 153,value = 37681,job =3},

				    },
				},
--45级 
				{
					needJingHua = 3700, 
					attr=
					{
				        {type = 154,value = 900,job =1},
				        {type = 153,value = 38880,job =1},

				        {type = 154,value = 900,job =2},
				        {type = 153,value = 38880,job =2},

				        {type = 154,value = 900,job =3},
				        {type = 153,value = 38880,job =3},

				    },
				},
--46级 
				{
					needJingHua = 3800, 
					attr=
					{
				        {type = 154,value = 920,job =1},
				        {type = 153,value = 40111,job =1},

				        {type = 154,value = 920,job =2},
				        {type = 153,value = 40111,job =2},

				        {type = 154,value = 920,job =3},
				        {type = 153,value = 40111,job =3},

				    },
				},
--47级 
				{
					needJingHua = 3900, 
					attr=
					{
				        {type = 154,value = 940,job =1},
				        {type = 153,value = 41375,job =1},

				        {type = 154,value = 940,job =2},
				        {type = 153,value = 41375,job =2},

				        {type = 154,value = 940,job =3},
				        {type = 153,value = 41375,job =3},

				    },
				},
--48级 
				{
					needJingHua = 4000, 
					attr=
					{
				        {type = 154,value = 960,job =1},
				        {type = 153,value = 42671,job =1},

				        {type = 154,value = 960,job =2},
				        {type = 153,value = 42671,job =2},

				        {type = 154,value = 960,job =3},
				        {type = 153,value = 42671,job =3},

				    },
				},
--49级 
				{
					needJingHua = 4100, 
					attr=
					{
				        {type = 154,value = 980,job =1},
				        {type = 153,value = 43999,job =1},

				        {type = 154,value = 980,job =2},
				        {type = 153,value = 43999,job =2},

				        {type = 154,value = 980,job =3},
				        {type = 153,value = 43999,job =3},

				    },
				},
--50级 
				{
					needJingHua = 4200, 
					attr=
					{
				        {type = 154,value = 1000,job =1},
				        {type = 153,value = 45360,job =1},

				        {type = 154,value = 1000,job =2},
				        {type = 153,value = 45360,job =2},

				        {type = 154,value = 1000,job =3},
				        {type = 153,value = 45360,job =3},

				    },
				},

	
			
			
			},
		},
		
	},


	SuitAttr =
	{
		-- {--全部(a1)级
		-- 	allNeedLevel = (a2), 
		-- 	attr=
		-- 	{
		-- 		{type = (a3),value = (a4),job =1},
		-- 		{type = (a5),value = (a6),job =1},
		-- 		{type = (a7),value = (a8),job =1},
		-- 		{type = (a9),value = (a10),job =1},
		-- 		{type = (a11),value = (a12),job =1},

		-- 		{type = (a13),value = (a14),job =2},
		-- 		{type = (a15),value = (a16),job =2},
		-- 		{type = (a17),value = (a18),job =2},
		-- 		{type = (a19),value = (a20),job =2},
		-- 		{type = (a21),value = (a22),job =2},

		-- 		{type = (a23),value = (a24),job =3},
		-- 		{type = (a25),value = (a26),job =3},
		-- 		{type = (a27),value = (a28),job =3},
		-- 		{type = (a29),value = (a30),job =3},
		-- 		{type = (a31),value = (a32),job =3},

		-- 	},
		-- },
		
		{--全部5级
			allNeedLevel = 5, 
			attr=
			{
				{type = 9,value = 134,job =1},
				{type = 11,value = 268,job =1},
				{type = 5,value = 7368,job =1},
				{type = 169,value = 50,job =1},
				{type = 170,value = 3168,job =1},

				{type = 13,value = 134,job =2},
				{type = 15,value = 268,job =2},
				{type = 5,value = 7368,job =2},
				{type = 169,value = 50,job =2},
				{type = 170,value = 3168,job =2},

				{type = 17,value = 134,job =3},
				{type = 19,value = 268,job =3},
				{type = 5,value = 7368,job =3},
				{type = 169,value = 50,job =3},
				{type = 170,value = 3168,job =3},

			},
		},
{--全部10级
			allNeedLevel = 10, 
			attr=
			{
				{type = 9,value = 234,job =1},
				{type = 11,value = 468,job =1},
				{type = 5,value = 12768,job =1},
				{type = 169,value = 100,job =1},
				{type = 170,value = 5768,job =1},

				{type = 13,value = 234,job =2},
				{type = 15,value = 468,job =2},
				{type = 5,value = 12768,job =2},
				{type = 169,value = 100,job =2},
				{type = 170,value = 5768,job =2},

				{type = 17,value = 234,job =3},
				{type = 19,value = 468,job =3},
				{type = 5,value = 12768,job =3},
				{type = 169,value = 100,job =3},
				{type = 170,value = 5768,job =3},

			},
		},
{--全部15级
			allNeedLevel = 15, 
			attr=
			{
				{type = 9,value = 434,job =1},
				{type = 11,value = 868,job =1},
				{type = 5,value = 23568,job =1},
				{type = 169,value = 150,job =1},
				{type = 170,value = 9968,job =1},

				{type = 13,value = 434,job =2},
				{type = 15,value = 868,job =2},
				{type = 5,value = 23568,job =2},
				{type = 169,value = 150,job =2},
				{type = 170,value = 9968,job =2},

				{type = 17,value = 434,job =3},
				{type = 19,value = 868,job =3},
				{type = 5,value = 23568,job =3},
				{type = 169,value = 150,job =3},
				{type = 170,value = 9968,job =3},

			},
		},
{--全部20级
			allNeedLevel = 20, 
			attr=
			{
				{type = 9,value = 734,job =1},
				{type = 11,value = 1468,job =1},
				{type = 5,value = 34368,job =1},
				{type = 169,value = 200,job =1},
				{type = 170,value = 15768,job =1},

				{type = 13,value = 734,job =2},
				{type = 15,value = 1468,job =2},
				{type = 5,value = 34368,job =2},
				{type = 169,value = 200,job =2},
				{type = 170,value = 15768,job =2},

				{type = 17,value = 734,job =3},
				{type = 19,value = 1468,job =3},
				{type = 5,value = 34368,job =3},
				{type = 169,value = 200,job =3},
				{type = 170,value = 15768,job =3},

			},
		},
{--全部25级
			allNeedLevel = 25, 
			attr=
			{
				{type = 9,value = 1134,job =1},
				{type = 11,value = 2268,job =1},
				{type = 5,value = 47868,job =1},
				{type = 169,value = 250,job =1},
				{type = 170,value = 23168,job =1},

				{type = 13,value = 1134,job =2},
				{type = 15,value = 2268,job =2},
				{type = 5,value = 47868,job =2},
				{type = 169,value = 250,job =2},
				{type = 170,value = 23168,job =2},

				{type = 17,value = 1134,job =3},
				{type = 19,value = 2268,job =3},
				{type = 5,value = 47868,job =3},
				{type = 169,value = 250,job =3},
				{type = 170,value = 23168,job =3},

			},
		},
{--全部30级
			allNeedLevel = 30, 
			attr=
			{
				{type = 9,value = 1634,job =1},
				{type = 11,value = 3268,job =1},
				{type = 5,value = 64068,job =1},
				{type = 169,value = 300,job =1},
				{type = 170,value = 32168,job =1},

				{type = 13,value = 1634,job =2},
				{type = 15,value = 3268,job =2},
				{type = 5,value = 64068,job =2},
				{type = 169,value = 300,job =2},
				{type = 170,value = 32168,job =2},

				{type = 17,value = 1634,job =3},
				{type = 19,value = 3268,job =3},
				{type = 5,value = 64068,job =3},
				{type = 169,value = 300,job =3},
				{type = 170,value = 32168,job =3},

			},
		},
{--全部35级
			allNeedLevel = 35, 
			attr=
			{
				{type = 9,value = 2234,job =1},
				{type = 11,value = 4468,job =1},
				{type = 5,value = 82968,job =1},
				{type = 169,value = 350,job =1},
				{type = 170,value = 42768,job =1},

				{type = 13,value = 2234,job =2},
				{type = 15,value = 4468,job =2},
				{type = 5,value = 82968,job =2},
				{type = 169,value = 350,job =2},
				{type = 170,value = 42768,job =2},

				{type = 17,value = 2234,job =3},
				{type = 19,value = 4468,job =3},
				{type = 5,value = 82968,job =3},
				{type = 169,value = 350,job =3},
				{type = 170,value = 42768,job =3},

			},
		},
{--全部40级
			allNeedLevel = 40, 
			attr=
			{
				{type = 9,value = 2934,job =1},
				{type = 11,value = 5868,job =1},
				{type = 5,value = 104568,job =1},
				{type = 169,value = 400,job =1},
				{type = 170,value = 54968,job =1},

				{type = 13,value = 2934,job =2},
				{type = 15,value = 5868,job =2},
				{type = 5,value = 104568,job =2},
				{type = 169,value = 400,job =2},
				{type = 170,value = 54968,job =2},

				{type = 17,value = 2934,job =3},
				{type = 19,value = 5868,job =3},
				{type = 5,value = 104568,job =3},
				{type = 169,value = 400,job =3},
				{type = 170,value = 54968,job =3},

			},
		},
{--全部45级
			allNeedLevel = 45, 
			attr=
			{
				{type = 9,value = 3734,job =1},
				{type = 11,value = 7468,job =1},
				{type = 5,value = 128888,job =1},
				{type = 169,value = 450,job =1},
				{type = 170,value = 68768,job =1},

				{type = 13,value = 3734,job =2},
				{type = 15,value = 7468,job =2},
				{type = 5,value = 128888,job =2},
				{type = 169,value = 450,job =2},
				{type = 170,value = 68768,job =2},

				{type = 17,value = 3734,job =3},
				{type = 19,value = 7468,job =3},
				{type = 5,value = 128888,job =3},
				{type = 169,value = 450,job =3},
				{type = 170,value = 68768,job =3},

			},
		},
{--全部50级
			allNeedLevel = 50, 
			attr=
			{
				{type = 9,value = 4634,job =1},
				{type = 11,value = 9268,job =1},
				{type = 5,value = 155888,job =1},
				{type = 169,value = 500,job =1},
				{type = 170,value = 84168,job =1},

				{type = 13,value = 4634,job =2},
				{type = 15,value = 9268,job =2},
				{type = 5,value = 155888,job =2},
				{type = 169,value = 500,job =2},
				{type = 170,value = 84168,job =2},

				{type = 17,value = 4634,job =3},
				{type = 19,value = 9268,job =3},
				{type = 5,value = 155888,job =3},
				{type = 169,value = 500,job =3},
				{type = 170,value = 84168,job =3},

			},
		},


		

	},







}