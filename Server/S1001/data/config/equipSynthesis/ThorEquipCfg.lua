--雷神套装
--[[

1(1阶1星)    2(1阶2星)    3    4     5    6    7    8    9    10   (1阶10星) 
11(2阶1星)                                                                 20(2阶10星)
21   (3阶1星)                                                                30(3阶10星)
31   (4阶1星)                                                                40(4阶10星)
41   (5阶1星)                                                                50(5阶10星)

--]]
ThorEquipCfg = 
{
  effId = {100, 101, 102, 103, 104},
	ForLevelUp = 
	{
		--武器
		{
			brokenNeedItem = 7078,
			ShowItem = {7094,7102,7110,7118,7126},
			brokenNeedItemCount = {1,2,5,7,10}, --激活所需，达到2阶所需，到3阶所需，到4阶多需，到5阶所需
			levelUpInfo = 
			{

                --1级
                {                            
                  needXianShui = 0,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 228,job =1},
                          {type = 11,value = 760,job =1},
                          {type = 13,value =  228,job =2},
                          {type = 15,value =  760,job =2},
                          {type = 17,value =  228,job =3},
                          {type = 19,value =  760,job =3},
                          {type = 5,value =  2128,job =0},
                          {type = 145,value =  646,job =0},
                      }, 
                },
                --2级
                {                            
                  needXianShui = 80,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 276,job =1},
                          {type = 11,value = 920,job =1},
                          {type = 13,value =  276,job =2},
                          {type = 15,value =  920,job =2},
                          {type = 17,value =  276,job =3},
                          {type = 19,value =  920,job =3},
                          {type = 5,value =  2576,job =0},
                          {type = 145,value =  782,job =0},
                      }, 
                },
                --3级
                {                            
                  needXianShui = 90,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 317,job =1},
                          {type = 11,value = 1055,job =1},
                          {type = 13,value =  317,job =2},
                          {type = 15,value =  1055,job =2},
                          {type = 17,value =  317,job =3},
                          {type = 19,value =  1055,job =3},
                          {type = 5,value =  2954,job =0},
                          {type = 145,value =  897,job =0},
                      }, 
                },
                --4级
                {                            
                  needXianShui = 100,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 362,job =1},
                          {type = 11,value = 1205,job =1},
                          {type = 13,value =  362,job =2},
                          {type = 15,value =  1205,job =2},
                          {type = 17,value =  362,job =3},
                          {type = 19,value =  1205,job =3},
                          {type = 5,value =  3374,job =0},
                          {type = 145,value =  1024,job =0},
                      }, 
                },
                --5级
                {                            
                  needXianShui = 110,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 411,job =1},
                          {type = 11,value = 1370,job =1},
                          {type = 13,value =  411,job =2},
                          {type = 15,value =  1370,job =2},
                          {type = 17,value =  411,job =3},
                          {type = 19,value =  1370,job =3},
                          {type = 5,value =  3836,job =0},
                          {type = 145,value =  1165,job =0},
                      }, 
                },
                --6级
                {                            
                  needXianShui = 120,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 465,job =1},
                          {type = 11,value = 1550,job =1},
                          {type = 13,value =  465,job =2},
                          {type = 15,value =  1550,job =2},
                          {type = 17,value =  465,job =3},
                          {type = 19,value =  1550,job =3},
                          {type = 5,value =  4340,job =0},
                          {type = 145,value =  1318,job =0},
                      }, 
                },
                --7级
                {                            
                  needXianShui = 130,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 524,job =1},
                          {type = 11,value = 1745,job =1},
                          {type = 13,value =  524,job =2},
                          {type = 15,value =  1745,job =2},
                          {type = 17,value =  524,job =3},
                          {type = 19,value =  1745,job =3},
                          {type = 5,value =  4886,job =0},
                          {type = 145,value =  1483,job =0},
                      }, 
                },
                --8级
                {                            
                  needXianShui = 140,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 587,job =1},
                          {type = 11,value = 1955,job =1},
                          {type = 13,value =  587,job =2},
                          {type = 15,value =  1955,job =2},
                          {type = 17,value =  587,job =3},
                          {type = 19,value =  1955,job =3},
                          {type = 5,value =  5474,job =0},
                          {type = 145,value =  1662,job =0},
                      }, 
                },
                --9级
                {                            
                  needXianShui = 150,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 654,job =1},
                          {type = 11,value = 2180,job =1},
                          {type = 13,value =  654,job =2},
                          {type = 15,value =  2180,job =2},
                          {type = 17,value =  654,job =3},
                          {type = 19,value =  2180,job =3},
                          {type = 5,value =  6104,job =0},
                          {type = 145,value =  1853,job =0},
                      }, 
                },
                --10级
                {                            
                  needXianShui = 160,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 726,job =1},
                          {type = 11,value = 2420,job =1},
                          {type = 13,value =  726,job =2},
                          {type = 15,value =  2420,job =2},
                          {type = 17,value =  726,job =3},
                          {type = 19,value =  2420,job =3},
                          {type = 5,value =  6776,job =0},
                          {type = 145,value =  2057,job =0},
                      }, 
                },
                --11级
                {                            
                  needXianShui = 0,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1086,job =1},
                          {type = 11,value = 3620,job =1},
                          {type = 13,value =  1086,job =2},
                          {type = 15,value =  3620,job =2},
                          {type = 17,value =  1086,job =3},
                          {type = 19,value =  3620,job =3},
                          {type = 5,value =  10136,job =0},
                          {type = 145,value =  3077,job =0},
                      }, 
                },
                --12级
                {                            
                  needXianShui = 175,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1149,job =1},
                          {type = 11,value = 3830,job =1},
                          {type = 13,value =  1149,job =2},
                          {type = 15,value =  3830,job =2},
                          {type = 17,value =  1149,job =3},
                          {type = 19,value =  3830,job =3},
                          {type = 5,value =  10724,job =0},
                          {type = 145,value =  3256,job =0},
                      }, 
                },
                --13级
                {                            
                  needXianShui = 190,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1217,job =1},
                          {type = 11,value = 4058,job =1},
                          {type = 13,value =  1217,job =2},
                          {type = 15,value =  4058,job =2},
                          {type = 17,value =  1217,job =3},
                          {type = 19,value =  4058,job =3},
                          {type = 5,value =  11362,job =0},
                          {type = 145,value =  3449,job =0},
                      }, 
                },
                --14级
                {                            
                  needXianShui = 205,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1291,job =1},
                          {type = 11,value = 4304,job =1},
                          {type = 13,value =  1291,job =2},
                          {type = 15,value =  4304,job =2},
                          {type = 17,value =  1291,job =3},
                          {type = 19,value =  4304,job =3},
                          {type = 5,value =  12051,job =0},
                          {type = 145,value =  3658,job =0},
                      }, 
                },
                --15级
                {                            
                  needXianShui = 220,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1370,job =1},
                          {type = 11,value = 4568,job =1},
                          {type = 13,value =  1370,job =2},
                          {type = 15,value =  4568,job =2},
                          {type = 17,value =  1370,job =3},
                          {type = 19,value =  4568,job =3},
                          {type = 5,value =  12790,job =0},
                          {type = 145,value =  3883,job =0},
                      }, 
                },
                --16级
                {                            
                  needXianShui = 235,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1455,job =1},
                          {type = 11,value = 4850,job =1},
                          {type = 13,value =  1455,job =2},
                          {type = 15,value =  4850,job =2},
                          {type = 17,value =  1455,job =3},
                          {type = 19,value =  4850,job =3},
                          {type = 5,value =  13580,job =0},
                          {type = 145,value =  4123,job =0},
                      }, 
                },
                --17级
                {                            
                  needXianShui = 250,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1545,job =1},
                          {type = 11,value = 5150,job =1},
                          {type = 13,value =  1545,job =2},
                          {type = 15,value =  5150,job =2},
                          {type = 17,value =  1545,job =3},
                          {type = 19,value =  5150,job =3},
                          {type = 5,value =  14420,job =0},
                          {type = 145,value =  4378,job =0},
                      }, 
                },
                --18级
                {                            
                  needXianShui = 265,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1640,job =1},
                          {type = 11,value = 5468,job =1},
                          {type = 13,value =  1640,job =2},
                          {type = 15,value =  5468,job =2},
                          {type = 17,value =  1640,job =3},
                          {type = 19,value =  5468,job =3},
                          {type = 5,value =  15310,job =0},
                          {type = 145,value =  4648,job =0},
                      }, 
                },
                --19级
                {                            
                  needXianShui = 280,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1741,job =1},
                          {type = 11,value = 5804,job =1},
                          {type = 13,value =  1741,job =2},
                          {type = 15,value =  5804,job =2},
                          {type = 17,value =  1741,job =3},
                          {type = 19,value =  5804,job =3},
                          {type = 5,value =  16251,job =0},
                          {type = 145,value =  4933,job =0},
                      }, 
                },
                --20级
                {                            
                  needXianShui = 295,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1847,job =1},
                          {type = 11,value = 6158,job =1},
                          {type = 13,value =  1847,job =2},
                          {type = 15,value =  6158,job =2},
                          {type = 17,value =  1847,job =3},
                          {type = 19,value =  6158,job =3},
                          {type = 5,value =  17242,job =0},
                          {type = 145,value =  5234,job =0},
                      }, 
                },
                --21级
                {                            
                  needXianShui = 0,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2387,job =1},
                          {type = 11,value = 7958,job =1},
                          {type = 13,value =  2387,job =2},
                          {type = 15,value =  7958,job =2},
                          {type = 17,value =  2387,job =3},
                          {type = 19,value =  7958,job =3},
                          {type = 5,value =  22282,job =0},
                          {type = 145,value =  6764,job =0},
                      }, 
                },
                --22级
                {                            
                  needXianShui = 315,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2473,job =1},
                          {type = 11,value = 8242,job =1},
                          {type = 13,value =  2473,job =2},
                          {type = 15,value =  8242,job =2},
                          {type = 17,value =  2473,job =3},
                          {type = 19,value =  8242,job =3},
                          {type = 5,value =  23078,job =0},
                          {type = 145,value =  7006,job =0},
                      }, 
                },
                --23级
                {                            
                  needXianShui = 335,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2563,job =1},
                          {type = 11,value = 8544,job =1},
                          {type = 13,value =  2563,job =2},
                          {type = 15,value =  8544,job =2},
                          {type = 17,value =  2563,job =3},
                          {type = 19,value =  8544,job =3},
                          {type = 5,value =  23923,job =0},
                          {type = 145,value =  7262,job =0},
                      }, 
                },
                --24级
                {                            
                  needXianShui = 355,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2659,job =1},
                          {type = 11,value = 8864,job =1},
                          {type = 13,value =  2659,job =2},
                          {type = 15,value =  8864,job =2},
                          {type = 17,value =  2659,job =3},
                          {type = 19,value =  8864,job =3},
                          {type = 5,value =  24819,job =0},
                          {type = 145,value =  7534,job =0},
                      }, 
                },
                --25级
                {                            
                  needXianShui = 375,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2761,job =1},
                          {type = 11,value = 9202,job =1},
                          {type = 13,value =  2761,job =2},
                          {type = 15,value =  9202,job =2},
                          {type = 17,value =  2761,job =3},
                          {type = 19,value =  9202,job =3},
                          {type = 5,value =  25766,job =0},
                          {type = 145,value =  7822,job =0},
                      }, 
                },
                --26级
                {                            
                  needXianShui = 395,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2867,job =1},
                          {type = 11,value = 9558,job =1},
                          {type = 13,value =  2867,job =2},
                          {type = 15,value =  9558,job =2},
                          {type = 17,value =  2867,job =3},
                          {type = 19,value =  9558,job =3},
                          {type = 5,value =  26762,job =0},
                          {type = 145,value =  8124,job =0},
                      }, 
                },
                --27级
                {                            
                  needXianShui = 415,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2980,job =1},
                          {type = 11,value = 9932,job =1},
                          {type = 13,value =  2980,job =2},
                          {type = 15,value =  9932,job =2},
                          {type = 17,value =  2980,job =3},
                          {type = 19,value =  9932,job =3},
                          {type = 5,value =  27810,job =0},
                          {type = 145,value =  8442,job =0},
                      }, 
                },
                --28级
                {                            
                  needXianShui = 435,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 3097,job =1},
                          {type = 11,value = 10324,job =1},
                          {type = 13,value =  3097,job =2},
                          {type = 15,value =  10324,job =2},
                          {type = 17,value =  3097,job =3},
                          {type = 19,value =  10324,job =3},
                          {type = 5,value =  28907,job =0},
                          {type = 145,value =  8775,job =0},
                      }, 
                },
                --29级
                {                            
                  needXianShui = 455,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 3220,job =1},
                          {type = 11,value = 10734,job =1},
                          {type = 13,value =  3220,job =2},
                          {type = 15,value =  10734,job =2},
                          {type = 17,value =  3220,job =3},
                          {type = 19,value =  10734,job =3},
                          {type = 5,value =  30055,job =0},
                          {type = 145,value =  9124,job =0},
                      }, 
                },
                --30级
                {                            
                  needXianShui = 475,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 3349,job =1},
                          {type = 11,value = 11162,job =1},
                          {type = 13,value =  3349,job =2},
                          {type = 15,value =  11162,job =2},
                          {type = 17,value =  3349,job =3},
                          {type = 19,value =  11162,job =3},
                          {type = 5,value =  31254,job =0},
                          {type = 145,value =  9488,job =0},
                      }, 
                },
                --31级
                {                            
                  needXianShui = 0,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 4213,job =1},
                          {type = 11,value = 14042,job =1},
                          {type = 13,value =  4213,job =2},
                          {type = 15,value =  14042,job =2},
                          {type = 17,value =  4213,job =3},
                          {type = 19,value =  14042,job =3},
                          {type = 5,value =  39318,job =0},
                          {type = 145,value =  11936,job =0},
                      }, 
                },
                --32级
                {                            
                  needXianShui = 500,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 4303,job =1},
                          {type = 11,value = 14342,job =1},
                          {type = 13,value =  4303,job =2},
                          {type = 15,value =  14342,job =2},
                          {type = 17,value =  4303,job =3},
                          {type = 19,value =  14342,job =3},
                          {type = 5,value =  40158,job =0},
                          {type = 145,value =  12191,job =0},
                      }, 
                },
                --33级
                {                            
                  needXianShui = 525,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 4397,job =1},
                          {type = 11,value = 14657,job =1},
                          {type = 13,value =  4397,job =2},
                          {type = 15,value =  14657,job =2},
                          {type = 17,value =  4397,job =3},
                          {type = 19,value =  14657,job =3},
                          {type = 5,value =  41040,job =0},
                          {type = 145,value =  12458,job =0},
                      }, 
                },
                --34级
                {                            
                  needXianShui = 550,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 4496,job =1},
                          {type = 11,value = 14987,job =1},
                          {type = 13,value =  4496,job =2},
                          {type = 15,value =  14987,job =2},
                          {type = 17,value =  4496,job =3},
                          {type = 19,value =  14987,job =3},
                          {type = 5,value =  41964,job =0},
                          {type = 145,value =  12739,job =0},
                      }, 
                },
                --35级
                {                            
                  needXianShui = 575,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 4600,job =1},
                          {type = 11,value = 15332,job =1},
                          {type = 13,value =  4600,job =2},
                          {type = 15,value =  15332,job =2},
                          {type = 17,value =  4600,job =3},
                          {type = 19,value =  15332,job =3},
                          {type = 5,value =  42930,job =0},
                          {type = 145,value =  13032,job =0},
                      }, 
                },
                --36级
                {                            
                  needXianShui = 600,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 4708,job =1},
                          {type = 11,value = 15692,job =1},
                          {type = 13,value =  4708,job =2},
                          {type = 15,value =  15692,job =2},
                          {type = 17,value =  4708,job =3},
                          {type = 19,value =  15692,job =3},
                          {type = 5,value =  43938,job =0},
                          {type = 145,value =  13338,job =0},
                      }, 
                },
                --37级
                {                            
                  needXianShui = 625,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 4820,job =1},
                          {type = 11,value = 16067,job =1},
                          {type = 13,value =  4820,job =2},
                          {type = 15,value =  16067,job =2},
                          {type = 17,value =  4820,job =3},
                          {type = 19,value =  16067,job =3},
                          {type = 5,value =  44988,job =0},
                          {type = 145,value =  13657,job =0},
                      }, 
                },
                --38级
                {                            
                  needXianShui = 650,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 4937,job =1},
                          {type = 11,value = 16457,job =1},
                          {type = 13,value =  4937,job =2},
                          {type = 15,value =  16457,job =2},
                          {type = 17,value =  4937,job =3},
                          {type = 19,value =  16457,job =3},
                          {type = 5,value =  46080,job =0},
                          {type = 145,value =  13988,job =0},
                      }, 
                },
                --39级
                {                            
                  needXianShui = 675,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 5059,job =1},
                          {type = 11,value = 16862,job =1},
                          {type = 13,value =  5059,job =2},
                          {type = 15,value =  16862,job =2},
                          {type = 17,value =  5059,job =3},
                          {type = 19,value =  16862,job =3},
                          {type = 5,value =  47214,job =0},
                          {type = 145,value =  14333,job =0},
                      }, 
                },
                --40级
                {                            
                  needXianShui = 700,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 5185,job =1},
                          {type = 11,value = 17282,job =1},
                          {type = 13,value =  5185,job =2},
                          {type = 15,value =  17282,job =2},
                          {type = 17,value =  5185,job =3},
                          {type = 19,value =  17282,job =3},
                          {type = 5,value =  48390,job =0},
                          {type = 145,value =  14690,job =0},
                      }, 
                },
                --41级
                {                            
                  needXianShui = 0,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 6265,job =1},
                          {type = 11,value = 20882,job =1},
                          {type = 13,value =  6265,job =2},
                          {type = 15,value =  20882,job =2},
                          {type = 17,value =  6265,job =3},
                          {type = 19,value =  20882,job =3},
                          {type = 5,value =  58470,job =0},
                          {type = 145,value =  17750,job =0},
                      }, 
                },
                --42级
                {                            
                  needXianShui = 730,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 6330,job =1},
                          {type = 11,value = 21101,job =1},
                          {type = 13,value =  6330,job =2},
                          {type = 15,value =  21101,job =2},
                          {type = 17,value =  6330,job =3},
                          {type = 19,value =  21101,job =3},
                          {type = 5,value =  59083,job =0},
                          {type = 145,value =  17936,job =0},
                      }, 
                },
                --43级
                {                            
                  needXianShui = 760,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 6399,job =1},
                          {type = 11,value = 21329,job =1},
                          {type = 13,value =  6399,job =2},
                          {type = 15,value =  21329,job =2},
                          {type = 17,value =  6399,job =3},
                          {type = 19,value =  21329,job =3},
                          {type = 5,value =  59721,job =0},
                          {type = 145,value =  18130,job =0},
                      }, 
                },
                --44级
                {                            
                  needXianShui = 790,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 6470,job =1},
                          {type = 11,value = 21566,job =1},
                          {type = 13,value =  6470,job =2},
                          {type = 15,value =  21566,job =2},
                          {type = 17,value =  6470,job =3},
                          {type = 19,value =  21566,job =3},
                          {type = 5,value =  60385,job =0},
                          {type = 145,value =  18331,job =0},
                      }, 
                },
                --45级
                {                            
                  needXianShui = 820,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 6544,job =1},
                          {type = 11,value = 21812,job =1},
                          {type = 13,value =  6544,job =2},
                          {type = 15,value =  21812,job =2},
                          {type = 17,value =  6544,job =3},
                          {type = 19,value =  21812,job =3},
                          {type = 5,value =  61074,job =0},
                          {type = 145,value =  18540,job =0},
                      }, 
                },
                --46级
                {                            
                  needXianShui = 850,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 6620,job =1},
                          {type = 11,value = 22067,job =1},
                          {type = 13,value =  6620,job =2},
                          {type = 15,value =  22067,job =2},
                          {type = 17,value =  6620,job =3},
                          {type = 19,value =  22067,job =3},
                          {type = 5,value =  61788,job =0},
                          {type = 145,value =  18757,job =0},
                      }, 
                },
                --47级
                {                            
                  needXianShui = 880,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 6699,job =1},
                          {type = 11,value = 22331,job =1},
                          {type = 13,value =  6699,job =2},
                          {type = 15,value =  22331,job =2},
                          {type = 17,value =  6699,job =3},
                          {type = 19,value =  22331,job =3},
                          {type = 5,value =  62527,job =0},
                          {type = 145,value =  18981,job =0},
                      }, 
                },
                --48级
                {                            
                  needXianShui = 910,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 6781,job =1},
                          {type = 11,value = 22604,job =1},
                          {type = 13,value =  6781,job =2},
                          {type = 15,value =  22604,job =2},
                          {type = 17,value =  6781,job =3},
                          {type = 19,value =  22604,job =3},
                          {type = 5,value =  63291,job =0},
                          {type = 145,value =  19213,job =0},
                      }, 
                },
                --49级
                {                            
                  needXianShui = 940,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 6866,job =1},
                          {type = 11,value = 22886,job =1},
                          {type = 13,value =  6866,job =2},
                          {type = 15,value =  22886,job =2},
                          {type = 17,value =  6866,job =3},
                          {type = 19,value =  22886,job =3},
                          {type = 5,value =  64081,job =0},
                          {type = 145,value =  19453,job =0},
                      }, 
                },
                --50级
                {                            
                  needXianShui = 970,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 6953,job =1},
                          {type = 11,value = 23177,job =1},
                          {type = 13,value =  6953,job =2},
                          {type = 15,value =  23177,job =2},
                          {type = 17,value =  6953,job =3},
                          {type = 19,value =  23177,job =3},
                          {type = 5,value =  64896,job =0},
                          {type = 145,value =  19700,job =0},
                      }, 
                },

			},
			
		},

        --衣服
		{
			brokenNeedItem = 7079,
			ShowItem = {7095,7103,7111,7119,7127},
			brokenNeedItemCount = {1,2,5,7,10}, --激活所需，达到2阶所需，到3阶所需，到4阶多需，到5阶所需
			levelUpInfo = 
			{

                --1级
                {                            
                  needXianShui = 0,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 171,job =1},
                          {type = 11,value = 570,job =1},
                          {type = 13,value =  171,job =2},
                          {type = 15,value =  570,job =2},
                          {type = 17,value =  171,job =3},
                          {type = 19,value =  570,job =3},
                          {type = 5,value =  1767,job =0},
                          {type = 145,value =  520,job =0},
                          {type = 21,value =  184,job =0},
                          {type = 23,value =  184,job =0},
                          {type = 25,value =  184,job =0},
                          {type = 27,value =  184,job =0},
                      }, 
                },
                --2级
                {                            
                  needXianShui = 80,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 219,job =1},
                          {type = 11,value = 730,job =1},
                          {type = 13,value =  219,job =2},
                          {type = 15,value =  730,job =2},
                          {type = 17,value =  219,job =3},
                          {type = 19,value =  730,job =3},
                          {type = 5,value =  2263,job =0},
                          {type = 145,value =  630,job =0},
                          {type = 21,value =  235,job =0},
                          {type = 23,value =  235,job =0},
                          {type = 25,value =  235,job =0},
                          {type = 27,value =  235,job =0},
                      }, 
                },
                --3级
                {                            
                  needXianShui = 90,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 260,job =1},
                          {type = 11,value = 865,job =1},
                          {type = 13,value =  260,job =2},
                          {type = 15,value =  865,job =2},
                          {type = 17,value =  260,job =3},
                          {type = 19,value =  865,job =3},
                          {type = 5,value =  2682,job =0},
                          {type = 145,value =  722,job =0},
                          {type = 21,value =  279,job =0},
                          {type = 23,value =  279,job =0},
                          {type = 25,value =  279,job =0},
                          {type = 27,value =  279,job =0},
                      }, 
                },
                --4级
                {                            
                  needXianShui = 100,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 305,job =1},
                          {type = 11,value = 1015,job =1},
                          {type = 13,value =  305,job =2},
                          {type = 15,value =  1015,job =2},
                          {type = 17,value =  305,job =3},
                          {type = 19,value =  1015,job =3},
                          {type = 5,value =  3147,job =0},
                          {type = 145,value =  824,job =0},
                          {type = 21,value =  327,job =0},
                          {type = 23,value =  327,job =0},
                          {type = 25,value =  327,job =0},
                          {type = 27,value =  327,job =0},
                      }, 
                },
                --5级
                {                            
                  needXianShui = 110,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 354,job =1},
                          {type = 11,value = 1180,job =1},
                          {type = 13,value =  354,job =2},
                          {type = 15,value =  1180,job =2},
                          {type = 17,value =  354,job =3},
                          {type = 19,value =  1180,job =3},
                          {type = 5,value =  3658,job =0},
                          {type = 145,value =  938,job =0},
                          {type = 21,value =  381,job =0},
                          {type = 23,value =  381,job =0},
                          {type = 25,value =  381,job =0},
                          {type = 27,value =  381,job =0},
                      }, 
                },
                --6级
                {                            
                  needXianShui = 120,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 408,job =1},
                          {type = 11,value = 1360,job =1},
                          {type = 13,value =  408,job =2},
                          {type = 15,value =  1360,job =2},
                          {type = 17,value =  408,job =3},
                          {type = 19,value =  1360,job =3},
                          {type = 5,value =  4216,job =0},
                          {type = 145,value =  1061,job =0},
                          {type = 21,value =  439,job =0},
                          {type = 23,value =  439,job =0},
                          {type = 25,value =  439,job =0},
                          {type = 27,value =  439,job =0},
                      }, 
                },
                --7级
                {                            
                  needXianShui = 130,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 467,job =1},
                          {type = 11,value = 1555,job =1},
                          {type = 13,value =  467,job =2},
                          {type = 15,value =  1555,job =2},
                          {type = 17,value =  467,job =3},
                          {type = 19,value =  1555,job =3},
                          {type = 5,value =  4821,job =0},
                          {type = 145,value =  1194,job =0},
                          {type = 21,value =  502,job =0},
                          {type = 23,value =  502,job =0},
                          {type = 25,value =  502,job =0},
                          {type = 27,value =  502,job =0},
                      }, 
                },
                --8级
                {                            
                  needXianShui = 140,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 530,job =1},
                          {type = 11,value = 1765,job =1},
                          {type = 13,value =  530,job =2},
                          {type = 15,value =  1765,job =2},
                          {type = 17,value =  530,job =3},
                          {type = 19,value =  1765,job =3},
                          {type = 5,value =  5472,job =0},
                          {type = 145,value =  1338,job =0},
                          {type = 21,value =  569,job =0},
                          {type = 23,value =  569,job =0},
                          {type = 25,value =  569,job =0},
                          {type = 27,value =  569,job =0},
                      }, 
                },
                --9级
                {                            
                  needXianShui = 150,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 597,job =1},
                          {type = 11,value = 1990,job =1},
                          {type = 13,value =  597,job =2},
                          {type = 15,value =  1990,job =2},
                          {type = 17,value =  597,job =3},
                          {type = 19,value =  1990,job =3},
                          {type = 5,value =  6169,job =0},
                          {type = 145,value =  1492,job =0},
                          {type = 21,value =  642,job =0},
                          {type = 23,value =  642,job =0},
                          {type = 25,value =  642,job =0},
                          {type = 27,value =  642,job =0},
                      }, 
                },
                --10级
                {                            
                  needXianShui = 160,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 669,job =1},
                          {type = 11,value = 2230,job =1},
                          {type = 13,value =  669,job =2},
                          {type = 15,value =  2230,job =2},
                          {type = 17,value =  669,job =3},
                          {type = 19,value =  2230,job =3},
                          {type = 5,value =  6913,job =0},
                          {type = 145,value =  1656,job =0},
                          {type = 21,value =  719,job =0},
                          {type = 23,value =  719,job =0},
                          {type = 25,value =  719,job =0},
                          {type = 27,value =  719,job =0},
                      }, 
                },
                --11级
                {                            
                  needXianShui = 0,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 939,job =1},
                          {type = 11,value = 3130,job =1},
                          {type = 13,value =  939,job =2},
                          {type = 15,value =  3130,job =2},
                          {type = 17,value =  939,job =3},
                          {type = 19,value =  3130,job =3},
                          {type = 5,value =  9703,job =0},
                          {type = 145,value =  2477,job =0},
                          {type = 21,value =  1010,job =0},
                          {type = 23,value =  1010,job =0},
                          {type = 25,value =  1010,job =0},
                          {type = 27,value =  1010,job =0},
                      }, 
                },
                --12级
                {                            
                  needXianShui = 175,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1002,job =1},
                          {type = 11,value = 3340,job =1},
                          {type = 13,value =  1002,job =2},
                          {type = 15,value =  3340,job =2},
                          {type = 17,value =  1002,job =3},
                          {type = 19,value =  3340,job =3},
                          {type = 5,value =  10354,job =0},
                          {type = 145,value =  2621,job =0},
                          {type = 21,value =  1077,job =0},
                          {type = 23,value =  1077,job =0},
                          {type = 25,value =  1077,job =0},
                          {type = 27,value =  1077,job =0},
                      }, 
                },
                --13级
                {                            
                  needXianShui = 190,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1070,job =1},
                          {type = 11,value = 3568,job =1},
                          {type = 13,value =  1070,job =2},
                          {type = 15,value =  3568,job =2},
                          {type = 17,value =  1070,job =3},
                          {type = 19,value =  3568,job =3},
                          {type = 5,value =  11061,job =0},
                          {type = 145,value =  2776,job =0},
                          {type = 21,value =  1151,job =0},
                          {type = 23,value =  1151,job =0},
                          {type = 25,value =  1151,job =0},
                          {type = 27,value =  1151,job =0},
                      }, 
                },
                --14级
                {                            
                  needXianShui = 205,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1144,job =1},
                          {type = 11,value = 3814,job =1},
                          {type = 13,value =  1144,job =2},
                          {type = 15,value =  3814,job =2},
                          {type = 17,value =  1144,job =3},
                          {type = 19,value =  3814,job =3},
                          {type = 5,value =  11823,job =0},
                          {type = 145,value =  2945,job =0},
                          {type = 21,value =  1230,job =0},
                          {type = 23,value =  1230,job =0},
                          {type = 25,value =  1230,job =0},
                          {type = 27,value =  1230,job =0},
                      }, 
                },
                --15级
                {                            
                  needXianShui = 220,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1223,job =1},
                          {type = 11,value = 4078,job =1},
                          {type = 13,value =  1223,job =2},
                          {type = 15,value =  4078,job =2},
                          {type = 17,value =  1223,job =3},
                          {type = 19,value =  4078,job =3},
                          {type = 5,value =  12642,job =0},
                          {type = 145,value =  3126,job =0},
                          {type = 21,value =  1315,job =0},
                          {type = 23,value =  1315,job =0},
                          {type = 25,value =  1315,job =0},
                          {type = 27,value =  1315,job =0},
                      }, 
                },
                --16级
                {                            
                  needXianShui = 235,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1308,job =1},
                          {type = 11,value = 4360,job =1},
                          {type = 13,value =  1308,job =2},
                          {type = 15,value =  4360,job =2},
                          {type = 17,value =  1308,job =3},
                          {type = 19,value =  4360,job =3},
                          {type = 5,value =  13516,job =0},
                          {type = 145,value =  3319,job =0},
                          {type = 21,value =  1406,job =0},
                          {type = 23,value =  1406,job =0},
                          {type = 25,value =  1406,job =0},
                          {type = 27,value =  1406,job =0},
                      }, 
                },
                --17级
                {                            
                  needXianShui = 250,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1398,job =1},
                          {type = 11,value = 4660,job =1},
                          {type = 13,value =  1398,job =2},
                          {type = 15,value =  4660,job =2},
                          {type = 17,value =  1398,job =3},
                          {type = 19,value =  4660,job =3},
                          {type = 5,value =  14446,job =0},
                          {type = 145,value =  3524,job =0},
                          {type = 21,value =  1503,job =0},
                          {type = 23,value =  1503,job =0},
                          {type = 25,value =  1503,job =0},
                          {type = 27,value =  1503,job =0},
                      }, 
                },
                --18级
                {                            
                  needXianShui = 265,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1493,job =1},
                          {type = 11,value = 4978,job =1},
                          {type = 13,value =  1493,job =2},
                          {type = 15,value =  4978,job =2},
                          {type = 17,value =  1493,job =3},
                          {type = 19,value =  4978,job =3},
                          {type = 5,value =  15432,job =0},
                          {type = 145,value =  3742,job =0},
                          {type = 21,value =  1606,job =0},
                          {type = 23,value =  1606,job =0},
                          {type = 25,value =  1606,job =0},
                          {type = 27,value =  1606,job =0},
                      }, 
                },
                --19级
                {                            
                  needXianShui = 280,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1594,job =1},
                          {type = 11,value = 5314,job =1},
                          {type = 13,value =  1594,job =2},
                          {type = 15,value =  5314,job =2},
                          {type = 17,value =  1594,job =3},
                          {type = 19,value =  5314,job =3},
                          {type = 5,value =  16473,job =0},
                          {type = 145,value =  3971,job =0},
                          {type = 21,value =  1714,job =0},
                          {type = 23,value =  1714,job =0},
                          {type = 25,value =  1714,job =0},
                          {type = 27,value =  1714,job =0},
                      }, 
                },
                --20级
                {                            
                  needXianShui = 295,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1700,job =1},
                          {type = 11,value = 5668,job =1},
                          {type = 13,value =  1700,job =2},
                          {type = 15,value =  5668,job =2},
                          {type = 17,value =  1700,job =3},
                          {type = 19,value =  5668,job =3},
                          {type = 5,value =  17571,job =0},
                          {type = 145,value =  4213,job =0},
                          {type = 21,value =  1828,job =0},
                          {type = 23,value =  1828,job =0},
                          {type = 25,value =  1828,job =0},
                          {type = 27,value =  1828,job =0},
                      }, 
                },
                --21级
                {                            
                  needXianShui = 0,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2105,job =1},
                          {type = 11,value = 7018,job =1},
                          {type = 13,value =  2105,job =2},
                          {type = 15,value =  7018,job =2},
                          {type = 17,value =  2105,job =3},
                          {type = 19,value =  7018,job =3},
                          {type = 5,value =  21756,job =0},
                          {type = 145,value =  5445,job =0},
                          {type = 21,value =  2264,job =0},
                          {type = 23,value =  2264,job =0},
                          {type = 25,value =  2264,job =0},
                          {type = 27,value =  2264,job =0},
                      }, 
                },
                --22级
                {                            
                  needXianShui = 315,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2191,job =1},
                          {type = 11,value = 7302,job =1},
                          {type = 13,value =  2191,job =2},
                          {type = 15,value =  7302,job =2},
                          {type = 17,value =  2191,job =3},
                          {type = 19,value =  7302,job =3},
                          {type = 5,value =  22636,job =0},
                          {type = 145,value =  5640,job =0},
                          {type = 21,value =  2355,job =0},
                          {type = 23,value =  2355,job =0},
                          {type = 25,value =  2355,job =0},
                          {type = 27,value =  2355,job =0},
                      }, 
                },
                --23级
                {                            
                  needXianShui = 335,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2281,job =1},
                          {type = 11,value = 7604,job =1},
                          {type = 13,value =  2281,job =2},
                          {type = 15,value =  7604,job =2},
                          {type = 17,value =  2281,job =3},
                          {type = 19,value =  7604,job =3},
                          {type = 5,value =  23572,job =0},
                          {type = 145,value =  5846,job =0},
                          {type = 21,value =  2453,job =0},
                          {type = 23,value =  2453,job =0},
                          {type = 25,value =  2453,job =0},
                          {type = 27,value =  2453,job =0},
                      }, 
                },
                --24级
                {                            
                  needXianShui = 355,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2377,job =1},
                          {type = 11,value = 7924,job =1},
                          {type = 13,value =  2377,job =2},
                          {type = 15,value =  7924,job =2},
                          {type = 17,value =  2377,job =3},
                          {type = 19,value =  7924,job =3},
                          {type = 5,value =  24564,job =0},
                          {type = 145,value =  6065,job =0},
                          {type = 21,value =  2556,job =0},
                          {type = 23,value =  2556,job =0},
                          {type = 25,value =  2556,job =0},
                          {type = 27,value =  2556,job =0},
                      }, 
                },
                --25级
                {                            
                  needXianShui = 375,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2479,job =1},
                          {type = 11,value = 8262,job =1},
                          {type = 13,value =  2479,job =2},
                          {type = 15,value =  8262,job =2},
                          {type = 17,value =  2479,job =3},
                          {type = 19,value =  8262,job =3},
                          {type = 5,value =  25612,job =0},
                          {type = 145,value =  6297,job =0},
                          {type = 21,value =  2665,job =0},
                          {type = 23,value =  2665,job =0},
                          {type = 25,value =  2665,job =0},
                          {type = 27,value =  2665,job =0},
                      }, 
                },
                --26级
                {                            
                  needXianShui = 395,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2585,job =1},
                          {type = 11,value = 8618,job =1},
                          {type = 13,value =  2585,job =2},
                          {type = 15,value =  8618,job =2},
                          {type = 17,value =  2585,job =3},
                          {type = 19,value =  8618,job =3},
                          {type = 5,value =  26716,job =0},
                          {type = 145,value =  6540,job =0},
                          {type = 21,value =  2780,job =0},
                          {type = 23,value =  2780,job =0},
                          {type = 25,value =  2780,job =0},
                          {type = 27,value =  2780,job =0},
                      }, 
                },
                --27级
                {                            
                  needXianShui = 415,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2698,job =1},
                          {type = 11,value = 8992,job =1},
                          {type = 13,value =  2698,job =2},
                          {type = 15,value =  8992,job =2},
                          {type = 17,value =  2698,job =3},
                          {type = 19,value =  8992,job =3},
                          {type = 5,value =  27875,job =0},
                          {type = 145,value =  6796,job =0},
                          {type = 21,value =  2901,job =0},
                          {type = 23,value =  2901,job =0},
                          {type = 25,value =  2901,job =0},
                          {type = 27,value =  2901,job =0},
                      }, 
                },
                --28级
                {                            
                  needXianShui = 435,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2815,job =1},
                          {type = 11,value = 9384,job =1},
                          {type = 13,value =  2815,job =2},
                          {type = 15,value =  9384,job =2},
                          {type = 17,value =  2815,job =3},
                          {type = 19,value =  9384,job =3},
                          {type = 5,value =  29090,job =0},
                          {type = 145,value =  7064,job =0},
                          {type = 21,value =  3027,job =0},
                          {type = 23,value =  3027,job =0},
                          {type = 25,value =  3027,job =0},
                          {type = 27,value =  3027,job =0},
                      }, 
                },
                --29级
                {                            
                  needXianShui = 455,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2938,job =1},
                          {type = 11,value = 9794,job =1},
                          {type = 13,value =  2938,job =2},
                          {type = 15,value =  9794,job =2},
                          {type = 17,value =  2938,job =3},
                          {type = 19,value =  9794,job =3},
                          {type = 5,value =  30361,job =0},
                          {type = 145,value =  7345,job =0},
                          {type = 21,value =  3159,job =0},
                          {type = 23,value =  3159,job =0},
                          {type = 25,value =  3159,job =0},
                          {type = 27,value =  3159,job =0},
                      }, 
                },
                --30级
                {                            
                  needXianShui = 475,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 3067,job =1},
                          {type = 11,value = 10222,job =1},
                          {type = 13,value =  3067,job =2},
                          {type = 15,value =  10222,job =2},
                          {type = 17,value =  3067,job =3},
                          {type = 19,value =  10222,job =3},
                          {type = 5,value =  31688,job =0},
                          {type = 145,value =  7638,job =0},
                          {type = 21,value =  3297,job =0},
                          {type = 23,value =  3297,job =0},
                          {type = 25,value =  3297,job =0},
                          {type = 27,value =  3297,job =0},
                      }, 
                },
                --31级
                {                            
                  needXianShui = 0,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 3715,job =1},
                          {type = 11,value = 12382,job =1},
                          {type = 13,value =  3715,job =2},
                          {type = 15,value =  12382,job =2},
                          {type = 17,value =  3715,job =3},
                          {type = 19,value =  12382,job =3},
                          {type = 5,value =  38384,job =0},
                          {type = 145,value =  9608,job =0},
                          {type = 21,value =  3994,job =0},
                          {type = 23,value =  3994,job =0},
                          {type = 25,value =  3994,job =0},
                          {type = 27,value =  3994,job =0},
                      }, 
                },
                --32级
                {                            
                  needXianShui = 500,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 3805,job =1},
                          {type = 11,value = 12682,job =1},
                          {type = 13,value =  3805,job =2},
                          {type = 15,value =  12682,job =2},
                          {type = 17,value =  3805,job =3},
                          {type = 19,value =  12682,job =3},
                          {type = 5,value =  39314,job =0},
                          {type = 145,value =  9814,job =0},
                          {type = 21,value =  4091,job =0},
                          {type = 23,value =  4091,job =0},
                          {type = 25,value =  4091,job =0},
                          {type = 27,value =  4091,job =0},
                      }, 
                },
                --33级
                {                            
                  needXianShui = 525,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 3899,job =1},
                          {type = 11,value = 12997,job =1},
                          {type = 13,value =  3899,job =2},
                          {type = 15,value =  12997,job =2},
                          {type = 17,value =  3899,job =3},
                          {type = 19,value =  12997,job =3},
                          {type = 5,value =  40291,job =0},
                          {type = 145,value =  10029,job =0},
                          {type = 21,value =  4193,job =0},
                          {type = 23,value =  4193,job =0},
                          {type = 25,value =  4193,job =0},
                          {type = 27,value =  4193,job =0},
                      }, 
                },
                --34级
                {                            
                  needXianShui = 550,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 3998,job =1},
                          {type = 11,value = 13327,job =1},
                          {type = 13,value =  3998,job =2},
                          {type = 15,value =  13327,job =2},
                          {type = 17,value =  3998,job =3},
                          {type = 19,value =  13327,job =3},
                          {type = 5,value =  41314,job =0},
                          {type = 145,value =  10255,job =0},
                          {type = 21,value =  4299,job =0},
                          {type = 23,value =  4299,job =0},
                          {type = 25,value =  4299,job =0},
                          {type = 27,value =  4299,job =0},
                      }, 
                },
                --35级
                {                            
                  needXianShui = 575,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 4102,job =1},
                          {type = 11,value = 13672,job =1},
                          {type = 13,value =  4102,job =2},
                          {type = 15,value =  13672,job =2},
                          {type = 17,value =  4102,job =3},
                          {type = 19,value =  13672,job =3},
                          {type = 5,value =  42383,job =0},
                          {type = 145,value =  10491,job =0},
                          {type = 21,value =  4410,job =0},
                          {type = 23,value =  4410,job =0},
                          {type = 25,value =  4410,job =0},
                          {type = 27,value =  4410,job =0},
                      }, 
                },
                --36级
                {                            
                  needXianShui = 600,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 4210,job =1},
                          {type = 11,value = 14032,job =1},
                          {type = 13,value =  4210,job =2},
                          {type = 15,value =  14032,job =2},
                          {type = 17,value =  4210,job =3},
                          {type = 19,value =  14032,job =3},
                          {type = 5,value =  43499,job =0},
                          {type = 145,value =  10737,job =0},
                          {type = 21,value =  4526,job =0},
                          {type = 23,value =  4526,job =0},
                          {type = 25,value =  4526,job =0},
                          {type = 27,value =  4526,job =0},
                      }, 
                },
                --37级
                {                            
                  needXianShui = 625,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 4322,job =1},
                          {type = 11,value = 14407,job =1},
                          {type = 13,value =  4322,job =2},
                          {type = 15,value =  14407,job =2},
                          {type = 17,value =  4322,job =3},
                          {type = 19,value =  14407,job =3},
                          {type = 5,value =  44662,job =0},
                          {type = 145,value =  10994,job =0},
                          {type = 21,value =  4647,job =0},
                          {type = 23,value =  4647,job =0},
                          {type = 25,value =  4647,job =0},
                          {type = 27,value =  4647,job =0},
                      }, 
                },
                --38级
                {                            
                  needXianShui = 650,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 4439,job =1},
                          {type = 11,value = 14797,job =1},
                          {type = 13,value =  4439,job =2},
                          {type = 15,value =  14797,job =2},
                          {type = 17,value =  4439,job =3},
                          {type = 19,value =  14797,job =3},
                          {type = 5,value =  45871,job =0},
                          {type = 145,value =  11260,job =0},
                          {type = 21,value =  4773,job =0},
                          {type = 23,value =  4773,job =0},
                          {type = 25,value =  4773,job =0},
                          {type = 27,value =  4773,job =0},
                      }, 
                },
                --39级
                {                            
                  needXianShui = 675,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 4561,job =1},
                          {type = 11,value = 15202,job =1},
                          {type = 13,value =  4561,job =2},
                          {type = 15,value =  15202,job =2},
                          {type = 17,value =  4561,job =3},
                          {type = 19,value =  15202,job =3},
                          {type = 5,value =  47126,job =0},
                          {type = 145,value =  11538,job =0},
                          {type = 21,value =  4904,job =0},
                          {type = 23,value =  4904,job =0},
                          {type = 25,value =  4904,job =0},
                          {type = 27,value =  4904,job =0},
                      }, 
                },
                --40级
                {                            
                  needXianShui = 700,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 4687,job =1},
                          {type = 11,value = 15622,job =1},
                          {type = 13,value =  4687,job =2},
                          {type = 15,value =  15622,job =2},
                          {type = 17,value =  4687,job =3},
                          {type = 19,value =  15622,job =3},
                          {type = 5,value =  48428,job =0},
                          {type = 145,value =  11825,job =0},
                          {type = 21,value =  5039,job =0},
                          {type = 23,value =  5039,job =0},
                          {type = 25,value =  5039,job =0},
                          {type = 27,value =  5039,job =0},
                      }, 
                },
                --41级
                {                            
                  needXianShui = 0,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 5497,job =1},
                          {type = 11,value = 18322,job =1},
                          {type = 13,value =  5497,job =2},
                          {type = 15,value =  18322,job =2},
                          {type = 17,value =  5497,job =3},
                          {type = 19,value =  18322,job =3},
                          {type = 5,value =  56798,job =0},
                          {type = 145,value =  14289,job =0},
                          {type = 21,value =  5910,job =0},
                          {type = 23,value =  5910,job =0},
                          {type = 25,value =  5910,job =0},
                          {type = 27,value =  5910,job =0},
                      }, 
                },
                --42级
                {                            
                  needXianShui = 730,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 5562,job =1},
                          {type = 11,value = 18541,job =1},
                          {type = 13,value =  5562,job =2},
                          {type = 15,value =  18541,job =2},
                          {type = 17,value =  5562,job =3},
                          {type = 19,value =  18541,job =3},
                          {type = 5,value =  57477,job =0},
                          {type = 145,value =  14438,job =0},
                          {type = 21,value =  5981,job =0},
                          {type = 23,value =  5981,job =0},
                          {type = 25,value =  5981,job =0},
                          {type = 27,value =  5981,job =0},
                      }, 
                },
                --43级
                {                            
                  needXianShui = 760,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 5631,job =1},
                          {type = 11,value = 18769,job =1},
                          {type = 13,value =  5631,job =2},
                          {type = 15,value =  18769,job =2},
                          {type = 17,value =  5631,job =3},
                          {type = 19,value =  18769,job =3},
                          {type = 5,value =  58184,job =0},
                          {type = 145,value =  14595,job =0},
                          {type = 21,value =  6055,job =0},
                          {type = 23,value =  6055,job =0},
                          {type = 25,value =  6055,job =0},
                          {type = 27,value =  6055,job =0},
                      }, 
                },
                --44级
                {                            
                  needXianShui = 790,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 5702,job =1},
                          {type = 11,value = 19006,job =1},
                          {type = 13,value =  5702,job =2},
                          {type = 15,value =  19006,job =2},
                          {type = 17,value =  5702,job =3},
                          {type = 19,value =  19006,job =3},
                          {type = 5,value =  58919,job =0},
                          {type = 145,value =  14756,job =0},
                          {type = 21,value =  6131,job =0},
                          {type = 23,value =  6131,job =0},
                          {type = 25,value =  6131,job =0},
                          {type = 27,value =  6131,job =0},
                      }, 
                },
                --45级
                {                            
                  needXianShui = 820,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 5776,job =1},
                          {type = 11,value = 19252,job =1},
                          {type = 13,value =  5776,job =2},
                          {type = 15,value =  19252,job =2},
                          {type = 17,value =  5776,job =3},
                          {type = 19,value =  19252,job =3},
                          {type = 5,value =  59681,job =0},
                          {type = 145,value =  14925,job =0},
                          {type = 21,value =  6210,job =0},
                          {type = 23,value =  6210,job =0},
                          {type = 25,value =  6210,job =0},
                          {type = 27,value =  6210,job =0},
                      }, 
                },
                --46级
                {                            
                  needXianShui = 850,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 5852,job =1},
                          {type = 11,value = 19507,job =1},
                          {type = 13,value =  5852,job =2},
                          {type = 15,value =  19507,job =2},
                          {type = 17,value =  5852,job =3},
                          {type = 19,value =  19507,job =3},
                          {type = 5,value =  60472,job =0},
                          {type = 145,value =  15099,job =0},
                          {type = 21,value =  6293,job =0},
                          {type = 23,value =  6293,job =0},
                          {type = 25,value =  6293,job =0},
                          {type = 27,value =  6293,job =0},
                      }, 
                },
                --47级
                {                            
                  needXianShui = 880,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 5931,job =1},
                          {type = 11,value = 19771,job =1},
                          {type = 13,value =  5931,job =2},
                          {type = 15,value =  19771,job =2},
                          {type = 17,value =  5931,job =3},
                          {type = 19,value =  19771,job =3},
                          {type = 5,value =  61290,job =0},
                          {type = 145,value =  15280,job =0},
                          {type = 21,value =  6378,job =0},
                          {type = 23,value =  6378,job =0},
                          {type = 25,value =  6378,job =0},
                          {type = 27,value =  6378,job =0},
                      }, 
                },
                --48级
                {                            
                  needXianShui = 910,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 6013,job =1},
                          {type = 11,value = 20044,job =1},
                          {type = 13,value =  6013,job =2},
                          {type = 15,value =  20044,job =2},
                          {type = 17,value =  6013,job =3},
                          {type = 19,value =  20044,job =3},
                          {type = 5,value =  62136,job =0},
                          {type = 145,value =  15466,job =0},
                          {type = 21,value =  6466,job =0},
                          {type = 23,value =  6466,job =0},
                          {type = 25,value =  6466,job =0},
                          {type = 27,value =  6466,job =0},
                      }, 
                },
                --49级
                {                            
                  needXianShui = 940,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 6098,job =1},
                          {type = 11,value = 20326,job =1},
                          {type = 13,value =  6098,job =2},
                          {type = 15,value =  20326,job =2},
                          {type = 17,value =  6098,job =3},
                          {type = 19,value =  20326,job =3},
                          {type = 5,value =  63011,job =0},
                          {type = 145,value =  15660,job =0},
                          {type = 21,value =  6557,job =0},
                          {type = 23,value =  6557,job =0},
                          {type = 25,value =  6557,job =0},
                          {type = 27,value =  6557,job =0},
                      }, 
                },
                --50级
                {                            
                  needXianShui = 970,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 6185,job =1},
                          {type = 11,value = 20617,job =1},
                          {type = 13,value =  6185,job =2},
                          {type = 15,value =  20617,job =2},
                          {type = 17,value =  6185,job =3},
                          {type = 19,value =  20617,job =3},
                          {type = 5,value =  63913,job =0},
                          {type = 145,value =  15859,job =0},
                          {type = 21,value =  6651,job =0},
                          {type = 23,value =  6651,job =0},
                          {type = 25,value =  6651,job =0},
                          {type = 27,value =  6651,job =0},
                      }, 
                },

			},
			
		},

        --头盔		
		{
			brokenNeedItem = 7080,
			ShowItem = {7096,7104,7112,7120,7128},
			brokenNeedItemCount = {1,2,5,7,10}, --激活所需，达到2阶所需，到3阶所需，到4阶多需，到5阶所需
			levelUpInfo = 
			{

                --1级
                {                            
                  needXianShui = 0,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 114,job =1},
                          {type = 11,value = 380,job =1},
                          {type = 13,value =  114,job =2},
                          {type = 15,value =  380,job =2},
                          {type = 17,value =  114,job =3},
                          {type = 19,value =  380,job =3},
                          {type = 5,value =  1064,job =0},
                          {type = 145,value =  465,job =0},
                          {type = 21,value =  123,job =0},
                          {type = 23,value =  123,job =0},
                          {type = 25,value =  123,job =0},
                          {type = 27,value =  123,job =0},
                      }, 
                },
                --2级
                {                            
                  needXianShui = 80,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 162,job =1},
                          {type = 11,value = 540,job =1},
                          {type = 13,value =  162,job =2},
                          {type = 15,value =  540,job =2},
                          {type = 17,value =  162,job =3},
                          {type = 19,value =  540,job =3},
                          {type = 5,value =  1512,job =0},
                          {type = 145,value =  563,job =0},
                          {type = 21,value =  174,job =0},
                          {type = 23,value =  174,job =0},
                          {type = 25,value =  174,job =0},
                          {type = 27,value =  174,job =0},
                      }, 
                },
                --3级
                {                            
                  needXianShui = 90,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 203,job =1},
                          {type = 11,value = 675,job =1},
                          {type = 13,value =  203,job =2},
                          {type = 15,value =  675,job =2},
                          {type = 17,value =  203,job =3},
                          {type = 19,value =  675,job =3},
                          {type = 5,value =  1890,job =0},
                          {type = 145,value =  646,job =0},
                          {type = 21,value =  218,job =0},
                          {type = 23,value =  218,job =0},
                          {type = 25,value =  218,job =0},
                          {type = 27,value =  218,job =0},
                      }, 
                },
                --4级
                {                            
                  needXianShui = 100,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 248,job =1},
                          {type = 11,value = 825,job =1},
                          {type = 13,value =  248,job =2},
                          {type = 15,value =  825,job =2},
                          {type = 17,value =  248,job =3},
                          {type = 19,value =  825,job =3},
                          {type = 5,value =  2310,job =0},
                          {type = 145,value =  737,job =0},
                          {type = 21,value =  266,job =0},
                          {type = 23,value =  266,job =0},
                          {type = 25,value =  266,job =0},
                          {type = 27,value =  266,job =0},
                      }, 
                },
                --5级
                {                            
                  needXianShui = 110,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 297,job =1},
                          {type = 11,value = 990,job =1},
                          {type = 13,value =  297,job =2},
                          {type = 15,value =  990,job =2},
                          {type = 17,value =  297,job =3},
                          {type = 19,value =  990,job =3},
                          {type = 5,value =  2772,job =0},
                          {type = 145,value =  839,job =0},
                          {type = 21,value =  319,job =0},
                          {type = 23,value =  319,job =0},
                          {type = 25,value =  319,job =0},
                          {type = 27,value =  319,job =0},
                      }, 
                },
                --6级
                {                            
                  needXianShui = 120,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 351,job =1},
                          {type = 11,value = 1170,job =1},
                          {type = 13,value =  351,job =2},
                          {type = 15,value =  1170,job =2},
                          {type = 17,value =  351,job =3},
                          {type = 19,value =  1170,job =3},
                          {type = 5,value =  3276,job =0},
                          {type = 145,value =  949,job =0},
                          {type = 21,value =  377,job =0},
                          {type = 23,value =  377,job =0},
                          {type = 25,value =  377,job =0},
                          {type = 27,value =  377,job =0},
                      }, 
                },
                --7级
                {                            
                  needXianShui = 130,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 410,job =1},
                          {type = 11,value = 1365,job =1},
                          {type = 13,value =  410,job =2},
                          {type = 15,value =  1365,job =2},
                          {type = 17,value =  410,job =3},
                          {type = 19,value =  1365,job =3},
                          {type = 5,value =  3822,job =0},
                          {type = 145,value =  1068,job =0},
                          {type = 21,value =  440,job =0},
                          {type = 23,value =  440,job =0},
                          {type = 25,value =  440,job =0},
                          {type = 27,value =  440,job =0},
                      }, 
                },
                --8级
                {                            
                  needXianShui = 140,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 473,job =1},
                          {type = 11,value = 1575,job =1},
                          {type = 13,value =  473,job =2},
                          {type = 15,value =  1575,job =2},
                          {type = 17,value =  473,job =3},
                          {type = 19,value =  1575,job =3},
                          {type = 5,value =  4410,job =0},
                          {type = 145,value =  1197,job =0},
                          {type = 21,value =  508,job =0},
                          {type = 23,value =  508,job =0},
                          {type = 25,value =  508,job =0},
                          {type = 27,value =  508,job =0},
                      }, 
                },
                --9级
                {                            
                  needXianShui = 150,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 540,job =1},
                          {type = 11,value = 1800,job =1},
                          {type = 13,value =  540,job =2},
                          {type = 15,value =  1800,job =2},
                          {type = 17,value =  540,job =3},
                          {type = 19,value =  1800,job =3},
                          {type = 5,value =  5040,job =0},
                          {type = 145,value =  1334,job =0},
                          {type = 21,value =  581,job =0},
                          {type = 23,value =  581,job =0},
                          {type = 25,value =  581,job =0},
                          {type = 27,value =  581,job =0},
                      }, 
                },
                --10级
                {                            
                  needXianShui = 160,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 612,job =1},
                          {type = 11,value = 2040,job =1},
                          {type = 13,value =  612,job =2},
                          {type = 15,value =  2040,job =2},
                          {type = 17,value =  612,job =3},
                          {type = 19,value =  2040,job =3},
                          {type = 5,value =  5712,job =0},
                          {type = 145,value =  1481,job =0},
                          {type = 21,value =  658,job =0},
                          {type = 23,value =  658,job =0},
                          {type = 25,value =  658,job =0},
                          {type = 27,value =  658,job =0},
                      }, 
                },
                --11级
                {                            
                  needXianShui = 0,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 792,job =1},
                          {type = 11,value = 2640,job =1},
                          {type = 13,value =  792,job =2},
                          {type = 15,value =  2640,job =2},
                          {type = 17,value =  792,job =3},
                          {type = 19,value =  2640,job =3},
                          {type = 5,value =  7392,job =0},
                          {type = 145,value =  2215,job =0},
                          {type = 21,value =  852,job =0},
                          {type = 23,value =  852,job =0},
                          {type = 25,value =  852,job =0},
                          {type = 27,value =  852,job =0},
                      }, 
                },
                --12级
                {                            
                  needXianShui = 175,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 855,job =1},
                          {type = 11,value = 2850,job =1},
                          {type = 13,value =  855,job =2},
                          {type = 15,value =  2850,job =2},
                          {type = 17,value =  855,job =3},
                          {type = 19,value =  2850,job =3},
                          {type = 5,value =  7980,job =0},
                          {type = 145,value =  2344,job =0},
                          {type = 21,value =  919,job =0},
                          {type = 23,value =  919,job =0},
                          {type = 25,value =  919,job =0},
                          {type = 27,value =  919,job =0},
                      }, 
                },
                --13级
                {                            
                  needXianShui = 190,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 923,job =1},
                          {type = 11,value = 3078,job =1},
                          {type = 13,value =  923,job =2},
                          {type = 15,value =  3078,job =2},
                          {type = 17,value =  923,job =3},
                          {type = 19,value =  3078,job =3},
                          {type = 5,value =  8618,job =0},
                          {type = 145,value =  2483,job =0},
                          {type = 21,value =  993,job =0},
                          {type = 23,value =  993,job =0},
                          {type = 25,value =  993,job =0},
                          {type = 27,value =  993,job =0},
                      }, 
                },
                --14级
                {                            
                  needXianShui = 205,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 997,job =1},
                          {type = 11,value = 3324,job =1},
                          {type = 13,value =  997,job =2},
                          {type = 15,value =  3324,job =2},
                          {type = 17,value =  997,job =3},
                          {type = 19,value =  3324,job =3},
                          {type = 5,value =  9307,job =0},
                          {type = 145,value =  2634,job =0},
                          {type = 21,value =  1072,job =0},
                          {type = 23,value =  1072,job =0},
                          {type = 25,value =  1072,job =0},
                          {type = 27,value =  1072,job =0},
                      }, 
                },
                --15级
                {                            
                  needXianShui = 220,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1076,job =1},
                          {type = 11,value = 3588,job =1},
                          {type = 13,value =  1076,job =2},
                          {type = 15,value =  3588,job =2},
                          {type = 17,value =  1076,job =3},
                          {type = 19,value =  3588,job =3},
                          {type = 5,value =  10046,job =0},
                          {type = 145,value =  2796,job =0},
                          {type = 21,value =  1157,job =0},
                          {type = 23,value =  1157,job =0},
                          {type = 25,value =  1157,job =0},
                          {type = 27,value =  1157,job =0},
                      }, 
                },
                --16级
                {                            
                  needXianShui = 235,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1161,job =1},
                          {type = 11,value = 3870,job =1},
                          {type = 13,value =  1161,job =2},
                          {type = 15,value =  3870,job =2},
                          {type = 17,value =  1161,job =3},
                          {type = 19,value =  3870,job =3},
                          {type = 5,value =  10836,job =0},
                          {type = 145,value =  2969,job =0},
                          {type = 21,value =  1248,job =0},
                          {type = 23,value =  1248,job =0},
                          {type = 25,value =  1248,job =0},
                          {type = 27,value =  1248,job =0},
                      }, 
                },
                --17级
                {                            
                  needXianShui = 250,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1251,job =1},
                          {type = 11,value = 4170,job =1},
                          {type = 13,value =  1251,job =2},
                          {type = 15,value =  4170,job =2},
                          {type = 17,value =  1251,job =3},
                          {type = 19,value =  4170,job =3},
                          {type = 5,value =  11676,job =0},
                          {type = 145,value =  3152,job =0},
                          {type = 21,value =  1345,job =0},
                          {type = 23,value =  1345,job =0},
                          {type = 25,value =  1345,job =0},
                          {type = 27,value =  1345,job =0},
                      }, 
                },
                --18级
                {                            
                  needXianShui = 265,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1346,job =1},
                          {type = 11,value = 4488,job =1},
                          {type = 13,value =  1346,job =2},
                          {type = 15,value =  4488,job =2},
                          {type = 17,value =  1346,job =3},
                          {type = 19,value =  4488,job =3},
                          {type = 5,value =  12566,job =0},
                          {type = 145,value =  3347,job =0},
                          {type = 21,value =  1448,job =0},
                          {type = 23,value =  1448,job =0},
                          {type = 25,value =  1448,job =0},
                          {type = 27,value =  1448,job =0},
                      }, 
                },
                --19级
                {                            
                  needXianShui = 280,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1447,job =1},
                          {type = 11,value = 4824,job =1},
                          {type = 13,value =  1447,job =2},
                          {type = 15,value =  4824,job =2},
                          {type = 17,value =  1447,job =3},
                          {type = 19,value =  4824,job =3},
                          {type = 5,value =  13507,job =0},
                          {type = 145,value =  3552,job =0},
                          {type = 21,value =  1556,job =0},
                          {type = 23,value =  1556,job =0},
                          {type = 25,value =  1556,job =0},
                          {type = 27,value =  1556,job =0},
                      }, 
                },
                --20级
                {                            
                  needXianShui = 295,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1553,job =1},
                          {type = 11,value = 5178,job =1},
                          {type = 13,value =  1553,job =2},
                          {type = 15,value =  5178,job =2},
                          {type = 17,value =  1553,job =3},
                          {type = 19,value =  5178,job =3},
                          {type = 5,value =  14498,job =0},
                          {type = 145,value =  3768,job =0},
                          {type = 21,value =  1670,job =0},
                          {type = 23,value =  1670,job =0},
                          {type = 25,value =  1670,job =0},
                          {type = 27,value =  1670,job =0},
                      }, 
                },
                --21级
                {                            
                  needXianShui = 0,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1823,job =1},
                          {type = 11,value = 6078,job =1},
                          {type = 13,value =  1823,job =2},
                          {type = 15,value =  6078,job =2},
                          {type = 17,value =  1823,job =3},
                          {type = 19,value =  6078,job =3},
                          {type = 5,value =  17018,job =0},
                          {type = 145,value =  4870,job =0},
                          {type = 21,value =  1961,job =0},
                          {type = 23,value =  1961,job =0},
                          {type = 25,value =  1961,job =0},
                          {type = 27,value =  1961,job =0},
                      }, 
                },
                --22级
                {                            
                  needXianShui = 315,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1909,job =1},
                          {type = 11,value = 6362,job =1},
                          {type = 13,value =  1909,job =2},
                          {type = 15,value =  6362,job =2},
                          {type = 17,value =  1909,job =3},
                          {type = 19,value =  6362,job =3},
                          {type = 5,value =  17814,job =0},
                          {type = 145,value =  5044,job =0},
                          {type = 21,value =  2052,job =0},
                          {type = 23,value =  2052,job =0},
                          {type = 25,value =  2052,job =0},
                          {type = 27,value =  2052,job =0},
                      }, 
                },
                --23级
                {                            
                  needXianShui = 335,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1999,job =1},
                          {type = 11,value = 6664,job =1},
                          {type = 13,value =  1999,job =2},
                          {type = 15,value =  6664,job =2},
                          {type = 17,value =  1999,job =3},
                          {type = 19,value =  6664,job =3},
                          {type = 5,value =  18659,job =0},
                          {type = 145,value =  5229,job =0},
                          {type = 21,value =  2150,job =0},
                          {type = 23,value =  2150,job =0},
                          {type = 25,value =  2150,job =0},
                          {type = 27,value =  2150,job =0},
                      }, 
                },
                --24级
                {                            
                  needXianShui = 355,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2095,job =1},
                          {type = 11,value = 6984,job =1},
                          {type = 13,value =  2095,job =2},
                          {type = 15,value =  6984,job =2},
                          {type = 17,value =  2095,job =3},
                          {type = 19,value =  6984,job =3},
                          {type = 5,value =  19555,job =0},
                          {type = 145,value =  5424,job =0},
                          {type = 21,value =  2253,job =0},
                          {type = 23,value =  2253,job =0},
                          {type = 25,value =  2253,job =0},
                          {type = 27,value =  2253,job =0},
                      }, 
                },
                --25级
                {                            
                  needXianShui = 375,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2197,job =1},
                          {type = 11,value = 7322,job =1},
                          {type = 13,value =  2197,job =2},
                          {type = 15,value =  7322,job =2},
                          {type = 17,value =  2197,job =3},
                          {type = 19,value =  7322,job =3},
                          {type = 5,value =  20502,job =0},
                          {type = 145,value =  5632,job =0},
                          {type = 21,value =  2362,job =0},
                          {type = 23,value =  2362,job =0},
                          {type = 25,value =  2362,job =0},
                          {type = 27,value =  2362,job =0},
                      }, 
                },
                --26级
                {                            
                  needXianShui = 395,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2303,job =1},
                          {type = 11,value = 7678,job =1},
                          {type = 13,value =  2303,job =2},
                          {type = 15,value =  7678,job =2},
                          {type = 17,value =  2303,job =3},
                          {type = 19,value =  7678,job =3},
                          {type = 5,value =  21498,job =0},
                          {type = 145,value =  5849,job =0},
                          {type = 21,value =  2477,job =0},
                          {type = 23,value =  2477,job =0},
                          {type = 25,value =  2477,job =0},
                          {type = 27,value =  2477,job =0},
                      }, 
                },
                --27级
                {                            
                  needXianShui = 415,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2416,job =1},
                          {type = 11,value = 8052,job =1},
                          {type = 13,value =  2416,job =2},
                          {type = 15,value =  8052,job =2},
                          {type = 17,value =  2416,job =3},
                          {type = 19,value =  8052,job =3},
                          {type = 5,value =  22546,job =0},
                          {type = 145,value =  6078,job =0},
                          {type = 21,value =  2597,job =0},
                          {type = 23,value =  2597,job =0},
                          {type = 25,value =  2597,job =0},
                          {type = 27,value =  2597,job =0},
                      }, 
                },
                --28级
                {                            
                  needXianShui = 435,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2533,job =1},
                          {type = 11,value = 8444,job =1},
                          {type = 13,value =  2533,job =2},
                          {type = 15,value =  8444,job =2},
                          {type = 17,value =  2533,job =3},
                          {type = 19,value =  8444,job =3},
                          {type = 5,value =  23643,job =0},
                          {type = 145,value =  6318,job =0},
                          {type = 21,value =  2724,job =0},
                          {type = 23,value =  2724,job =0},
                          {type = 25,value =  2724,job =0},
                          {type = 27,value =  2724,job =0},
                      }, 
                },
                --29级
                {                            
                  needXianShui = 455,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2656,job =1},
                          {type = 11,value = 8854,job =1},
                          {type = 13,value =  2656,job =2},
                          {type = 15,value =  8854,job =2},
                          {type = 17,value =  2656,job =3},
                          {type = 19,value =  8854,job =3},
                          {type = 5,value =  24791,job =0},
                          {type = 145,value =  6569,job =0},
                          {type = 21,value =  2856,job =0},
                          {type = 23,value =  2856,job =0},
                          {type = 25,value =  2856,job =0},
                          {type = 27,value =  2856,job =0},
                      }, 
                },
                --30级
                {                            
                  needXianShui = 475,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2785,job =1},
                          {type = 11,value = 9282,job =1},
                          {type = 13,value =  2785,job =2},
                          {type = 15,value =  9282,job =2},
                          {type = 17,value =  2785,job =3},
                          {type = 19,value =  9282,job =3},
                          {type = 5,value =  25990,job =0},
                          {type = 145,value =  6831,job =0},
                          {type = 21,value =  2994,job =0},
                          {type = 23,value =  2994,job =0},
                          {type = 25,value =  2994,job =0},
                          {type = 27,value =  2994,job =0},
                      }, 
                },
                --31级
                {                            
                  needXianShui = 0,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 3217,job =1},
                          {type = 11,value = 10722,job =1},
                          {type = 13,value =  3217,job =2},
                          {type = 15,value =  10722,job =2},
                          {type = 17,value =  3217,job =3},
                          {type = 19,value =  10722,job =3},
                          {type = 5,value =  30022,job =0},
                          {type = 145,value =  8594,job =0},
                          {type = 21,value =  3459,job =0},
                          {type = 23,value =  3459,job =0},
                          {type = 25,value =  3459,job =0},
                          {type = 27,value =  3459,job =0},
                      }, 
                },
                --32级
                {                            
                  needXianShui = 500,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 3307,job =1},
                          {type = 11,value = 11022,job =1},
                          {type = 13,value =  3307,job =2},
                          {type = 15,value =  11022,job =2},
                          {type = 17,value =  3307,job =3},
                          {type = 19,value =  11022,job =3},
                          {type = 5,value =  30862,job =0},
                          {type = 145,value =  8778,job =0},
                          {type = 21,value =  3555,job =0},
                          {type = 23,value =  3555,job =0},
                          {type = 25,value =  3555,job =0},
                          {type = 27,value =  3555,job =0},
                      }, 
                },
                --33级
                {                            
                  needXianShui = 525,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 3401,job =1},
                          {type = 11,value = 11337,job =1},
                          {type = 13,value =  3401,job =2},
                          {type = 15,value =  11337,job =2},
                          {type = 17,value =  3401,job =3},
                          {type = 19,value =  11337,job =3},
                          {type = 5,value =  31744,job =0},
                          {type = 145,value =  8970,job =0},
                          {type = 21,value =  3657,job =0},
                          {type = 23,value =  3657,job =0},
                          {type = 25,value =  3657,job =0},
                          {type = 27,value =  3657,job =0},
                      }, 
                },
                --34级
                {                            
                  needXianShui = 550,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 3500,job =1},
                          {type = 11,value = 11667,job =1},
                          {type = 13,value =  3500,job =2},
                          {type = 15,value =  11667,job =2},
                          {type = 17,value =  3500,job =3},
                          {type = 19,value =  11667,job =3},
                          {type = 5,value =  32668,job =0},
                          {type = 145,value =  9172,job =0},
                          {type = 21,value =  3764,job =0},
                          {type = 23,value =  3764,job =0},
                          {type = 25,value =  3764,job =0},
                          {type = 27,value =  3764,job =0},
                      }, 
                },
                --35级
                {                            
                  needXianShui = 575,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 3604,job =1},
                          {type = 11,value = 12012,job =1},
                          {type = 13,value =  3604,job =2},
                          {type = 15,value =  12012,job =2},
                          {type = 17,value =  3604,job =3},
                          {type = 19,value =  12012,job =3},
                          {type = 5,value =  33634,job =0},
                          {type = 145,value =  9383,job =0},
                          {type = 21,value =  3875,job =0},
                          {type = 23,value =  3875,job =0},
                          {type = 25,value =  3875,job =0},
                          {type = 27,value =  3875,job =0},
                      }, 
                },
                --36级
                {                            
                  needXianShui = 600,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 3712,job =1},
                          {type = 11,value = 12372,job =1},
                          {type = 13,value =  3712,job =2},
                          {type = 15,value =  12372,job =2},
                          {type = 17,value =  3712,job =3},
                          {type = 19,value =  12372,job =3},
                          {type = 5,value =  34642,job =0},
                          {type = 145,value =  9603,job =0},
                          {type = 21,value =  3991,job =0},
                          {type = 23,value =  3991,job =0},
                          {type = 25,value =  3991,job =0},
                          {type = 27,value =  3991,job =0},
                      }, 
                },
                --37级
                {                            
                  needXianShui = 625,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 3824,job =1},
                          {type = 11,value = 12747,job =1},
                          {type = 13,value =  3824,job =2},
                          {type = 15,value =  12747,job =2},
                          {type = 17,value =  3824,job =3},
                          {type = 19,value =  12747,job =3},
                          {type = 5,value =  35692,job =0},
                          {type = 145,value =  9833,job =0},
                          {type = 21,value =  4112,job =0},
                          {type = 23,value =  4112,job =0},
                          {type = 25,value =  4112,job =0},
                          {type = 27,value =  4112,job =0},
                      }, 
                },
                --38级
                {                            
                  needXianShui = 650,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 3941,job =1},
                          {type = 11,value = 13137,job =1},
                          {type = 13,value =  3941,job =2},
                          {type = 15,value =  13137,job =2},
                          {type = 17,value =  3941,job =3},
                          {type = 19,value =  13137,job =3},
                          {type = 5,value =  36784,job =0},
                          {type = 145,value =  10071,job =0},
                          {type = 21,value =  4238,job =0},
                          {type = 23,value =  4238,job =0},
                          {type = 25,value =  4238,job =0},
                          {type = 27,value =  4238,job =0},
                      }, 
                },
                --39级
                {                            
                  needXianShui = 675,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 4063,job =1},
                          {type = 11,value = 13542,job =1},
                          {type = 13,value =  4063,job =2},
                          {type = 15,value =  13542,job =2},
                          {type = 17,value =  4063,job =3},
                          {type = 19,value =  13542,job =3},
                          {type = 5,value =  37918,job =0},
                          {type = 145,value =  10320,job =0},
                          {type = 21,value =  4368,job =0},
                          {type = 23,value =  4368,job =0},
                          {type = 25,value =  4368,job =0},
                          {type = 27,value =  4368,job =0},
                      }, 
                },
                --40级
                {                            
                  needXianShui = 700,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 4189,job =1},
                          {type = 11,value = 13962,job =1},
                          {type = 13,value =  4189,job =2},
                          {type = 15,value =  13962,job =2},
                          {type = 17,value =  4189,job =3},
                          {type = 19,value =  13962,job =3},
                          {type = 5,value =  39094,job =0},
                          {type = 145,value =  10577,job =0},
                          {type = 21,value =  4504,job =0},
                          {type = 23,value =  4504,job =0},
                          {type = 25,value =  4504,job =0},
                          {type = 27,value =  4504,job =0},
                      }, 
                },
                --41级
                {                            
                  needXianShui = 0,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 4729,job =1},
                          {type = 11,value = 15762,job =1},
                          {type = 13,value =  4729,job =2},
                          {type = 15,value =  15762,job =2},
                          {type = 17,value =  4729,job =3},
                          {type = 19,value =  15762,job =3},
                          {type = 5,value =  44134,job =0},
                          {type = 145,value =  12780,job =0},
                          {type = 21,value =  5085,job =0},
                          {type = 23,value =  5085,job =0},
                          {type = 25,value =  5085,job =0},
                          {type = 27,value =  5085,job =0},
                      }, 
                },
                --42级
                {                            
                  needXianShui = 730,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 4794,job =1},
                          {type = 11,value = 15981,job =1},
                          {type = 13,value =  4794,job =2},
                          {type = 15,value =  15981,job =2},
                          {type = 17,value =  4794,job =3},
                          {type = 19,value =  15981,job =3},
                          {type = 5,value =  44747,job =0},
                          {type = 145,value =  12914,job =0},
                          {type = 21,value =  5155,job =0},
                          {type = 23,value =  5155,job =0},
                          {type = 25,value =  5155,job =0},
                          {type = 27,value =  5155,job =0},
                      }, 
                },
                --43级
                {                            
                  needXianShui = 760,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 4863,job =1},
                          {type = 11,value = 16209,job =1},
                          {type = 13,value =  4863,job =2},
                          {type = 15,value =  16209,job =2},
                          {type = 17,value =  4863,job =3},
                          {type = 19,value =  16209,job =3},
                          {type = 5,value =  45385,job =0},
                          {type = 145,value =  13054,job =0},
                          {type = 21,value =  5229,job =0},
                          {type = 23,value =  5229,job =0},
                          {type = 25,value =  5229,job =0},
                          {type = 27,value =  5229,job =0},
                      }, 
                },
                --44级
                {                            
                  needXianShui = 790,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 4934,job =1},
                          {type = 11,value = 16446,job =1},
                          {type = 13,value =  4934,job =2},
                          {type = 15,value =  16446,job =2},
                          {type = 17,value =  4934,job =3},
                          {type = 19,value =  16446,job =3},
                          {type = 5,value =  46049,job =0},
                          {type = 145,value =  13198,job =0},
                          {type = 21,value =  5305,job =0},
                          {type = 23,value =  5305,job =0},
                          {type = 25,value =  5305,job =0},
                          {type = 27,value =  5305,job =0},
                      }, 
                },
                --45级
                {                            
                  needXianShui = 820,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 5008,job =1},
                          {type = 11,value = 16692,job =1},
                          {type = 13,value =  5008,job =2},
                          {type = 15,value =  16692,job =2},
                          {type = 17,value =  5008,job =3},
                          {type = 19,value =  16692,job =3},
                          {type = 5,value =  46738,job =0},
                          {type = 145,value =  13349,job =0},
                          {type = 21,value =  5385,job =0},
                          {type = 23,value =  5385,job =0},
                          {type = 25,value =  5385,job =0},
                          {type = 27,value =  5385,job =0},
                      }, 
                },
                --46级
                {                            
                  needXianShui = 850,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 5084,job =1},
                          {type = 11,value = 16947,job =1},
                          {type = 13,value =  5084,job =2},
                          {type = 15,value =  16947,job =2},
                          {type = 17,value =  5084,job =3},
                          {type = 19,value =  16947,job =3},
                          {type = 5,value =  47452,job =0},
                          {type = 145,value =  13505,job =0},
                          {type = 21,value =  5467,job =0},
                          {type = 23,value =  5467,job =0},
                          {type = 25,value =  5467,job =0},
                          {type = 27,value =  5467,job =0},
                      }, 
                },
                --47级
                {                            
                  needXianShui = 880,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 5163,job =1},
                          {type = 11,value = 17211,job =1},
                          {type = 13,value =  5163,job =2},
                          {type = 15,value =  17211,job =2},
                          {type = 17,value =  5163,job =3},
                          {type = 19,value =  17211,job =3},
                          {type = 5,value =  48191,job =0},
                          {type = 145,value =  13666,job =0},
                          {type = 21,value =  5552,job =0},
                          {type = 23,value =  5552,job =0},
                          {type = 25,value =  5552,job =0},
                          {type = 27,value =  5552,job =0},
                      }, 
                },
                --48级
                {                            
                  needXianShui = 910,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 5245,job =1},
                          {type = 11,value = 17484,job =1},
                          {type = 13,value =  5245,job =2},
                          {type = 15,value =  17484,job =2},
                          {type = 17,value =  5245,job =3},
                          {type = 19,value =  17484,job =3},
                          {type = 5,value =  48955,job =0},
                          {type = 145,value =  13833,job =0},
                          {type = 21,value =  5640,job =0},
                          {type = 23,value =  5640,job =0},
                          {type = 25,value =  5640,job =0},
                          {type = 27,value =  5640,job =0},
                      }, 
                },
                --49级
                {                            
                  needXianShui = 940,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 5330,job =1},
                          {type = 11,value = 17766,job =1},
                          {type = 13,value =  5330,job =2},
                          {type = 15,value =  17766,job =2},
                          {type = 17,value =  5330,job =3},
                          {type = 19,value =  17766,job =3},
                          {type = 5,value =  49745,job =0},
                          {type = 145,value =  14006,job =0},
                          {type = 21,value =  5731,job =0},
                          {type = 23,value =  5731,job =0},
                          {type = 25,value =  5731,job =0},
                          {type = 27,value =  5731,job =0},
                      }, 
                },
                --50级
                {                            
                  needXianShui = 970,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 5417,job =1},
                          {type = 11,value = 18057,job =1},
                          {type = 13,value =  5417,job =2},
                          {type = 15,value =  18057,job =2},
                          {type = 17,value =  5417,job =3},
                          {type = 19,value =  18057,job =3},
                          {type = 5,value =  50560,job =0},
                          {type = 145,value =  14184,job =0},
                          {type = 21,value =  5825,job =0},
                          {type = 23,value =  5825,job =0},
                          {type = 25,value =  5825,job =0},
                          {type = 27,value =  5825,job =0},
                      }, 
                },

			},
			
		},

        --项链
		{
			brokenNeedItem = 7081,
			ShowItem = {7097,7105,7113,7121,7129},
			brokenNeedItemCount = {1,2,5,7,10}, --激活所需，达到2阶所需，到3阶所需，到4阶多需，到5阶所需
			levelUpInfo = 
			{

                --1级
                {                            
                  needXianShui = 0,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 171,job =1},
                          {type = 11,value = 570,job =1},
                          {type = 13,value =  171,job =2},
                          {type = 15,value =  570,job =2},
                          {type = 17,value =  171,job =3},
                          {type = 19,value =  570,job =3},
                          {type = 5,value =  1596,job =0},
                          {type = 145,value =  465,job =0},
                      }, 
                },
                --2级
                {                            
                  needXianShui = 80,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 219,job =1},
                          {type = 11,value = 730,job =1},
                          {type = 13,value =  219,job =2},
                          {type = 15,value =  730,job =2},
                          {type = 17,value =  219,job =3},
                          {type = 19,value =  730,job =3},
                          {type = 5,value =  2044,job =0},
                          {type = 145,value =  563,job =0},
                      }, 
                },
                --3级
                {                            
                  needXianShui = 90,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 260,job =1},
                          {type = 11,value = 865,job =1},
                          {type = 13,value =  260,job =2},
                          {type = 15,value =  865,job =2},
                          {type = 17,value =  260,job =3},
                          {type = 19,value =  865,job =3},
                          {type = 5,value =  2422,job =0},
                          {type = 145,value =  646,job =0},
                      }, 
                },
                --4级
                {                            
                  needXianShui = 100,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 305,job =1},
                          {type = 11,value = 1015,job =1},
                          {type = 13,value =  305,job =2},
                          {type = 15,value =  1015,job =2},
                          {type = 17,value =  305,job =3},
                          {type = 19,value =  1015,job =3},
                          {type = 5,value =  2842,job =0},
                          {type = 145,value =  737,job =0},
                      }, 
                },
                --5级
                {                            
                  needXianShui = 110,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 354,job =1},
                          {type = 11,value = 1180,job =1},
                          {type = 13,value =  354,job =2},
                          {type = 15,value =  1180,job =2},
                          {type = 17,value =  354,job =3},
                          {type = 19,value =  1180,job =3},
                          {type = 5,value =  3304,job =0},
                          {type = 145,value =  839,job =0},
                      }, 
                },
                --6级
                {                            
                  needXianShui = 120,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 408,job =1},
                          {type = 11,value = 1360,job =1},
                          {type = 13,value =  408,job =2},
                          {type = 15,value =  1360,job =2},
                          {type = 17,value =  408,job =3},
                          {type = 19,value =  1360,job =3},
                          {type = 5,value =  3808,job =0},
                          {type = 145,value =  949,job =0},
                      }, 
                },
                --7级
                {                            
                  needXianShui = 130,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 467,job =1},
                          {type = 11,value = 1555,job =1},
                          {type = 13,value =  467,job =2},
                          {type = 15,value =  1555,job =2},
                          {type = 17,value =  467,job =3},
                          {type = 19,value =  1555,job =3},
                          {type = 5,value =  4354,job =0},
                          {type = 145,value =  1068,job =0},
                      }, 
                },
                --8级
                {                            
                  needXianShui = 140,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 530,job =1},
                          {type = 11,value = 1765,job =1},
                          {type = 13,value =  530,job =2},
                          {type = 15,value =  1765,job =2},
                          {type = 17,value =  530,job =3},
                          {type = 19,value =  1765,job =3},
                          {type = 5,value =  4942,job =0},
                          {type = 145,value =  1197,job =0},
                      }, 
                },
                --9级
                {                            
                  needXianShui = 150,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 597,job =1},
                          {type = 11,value = 1990,job =1},
                          {type = 13,value =  597,job =2},
                          {type = 15,value =  1990,job =2},
                          {type = 17,value =  597,job =3},
                          {type = 19,value =  1990,job =3},
                          {type = 5,value =  5572,job =0},
                          {type = 145,value =  1334,job =0},
                      }, 
                },
                --10级
                {                            
                  needXianShui = 160,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 669,job =1},
                          {type = 11,value = 2230,job =1},
                          {type = 13,value =  669,job =2},
                          {type = 15,value =  2230,job =2},
                          {type = 17,value =  669,job =3},
                          {type = 19,value =  2230,job =3},
                          {type = 5,value =  6244,job =0},
                          {type = 145,value =  1481,job =0},
                      }, 
                },
                --11级
                {                            
                  needXianShui = 0,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 939,job =1},
                          {type = 11,value = 3130,job =1},
                          {type = 13,value =  939,job =2},
                          {type = 15,value =  3130,job =2},
                          {type = 17,value =  939,job =3},
                          {type = 19,value =  3130,job =3},
                          {type = 5,value =  8764,job =0},
                          {type = 145,value =  2215,job =0},
                      }, 
                },
                --12级
                {                            
                  needXianShui = 175,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1002,job =1},
                          {type = 11,value = 3340,job =1},
                          {type = 13,value =  1002,job =2},
                          {type = 15,value =  3340,job =2},
                          {type = 17,value =  1002,job =3},
                          {type = 19,value =  3340,job =3},
                          {type = 5,value =  9352,job =0},
                          {type = 145,value =  2344,job =0},
                      }, 
                },
                --13级
                {                            
                  needXianShui = 190,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1070,job =1},
                          {type = 11,value = 3568,job =1},
                          {type = 13,value =  1070,job =2},
                          {type = 15,value =  3568,job =2},
                          {type = 17,value =  1070,job =3},
                          {type = 19,value =  3568,job =3},
                          {type = 5,value =  9990,job =0},
                          {type = 145,value =  2483,job =0},
                      }, 
                },
                --14级
                {                            
                  needXianShui = 205,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1144,job =1},
                          {type = 11,value = 3814,job =1},
                          {type = 13,value =  1144,job =2},
                          {type = 15,value =  3814,job =2},
                          {type = 17,value =  1144,job =3},
                          {type = 19,value =  3814,job =3},
                          {type = 5,value =  10679,job =0},
                          {type = 145,value =  2634,job =0},
                      }, 
                },
                --15级
                {                            
                  needXianShui = 220,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1223,job =1},
                          {type = 11,value = 4078,job =1},
                          {type = 13,value =  1223,job =2},
                          {type = 15,value =  4078,job =2},
                          {type = 17,value =  1223,job =3},
                          {type = 19,value =  4078,job =3},
                          {type = 5,value =  11418,job =0},
                          {type = 145,value =  2796,job =0},
                      }, 
                },
                --16级
                {                            
                  needXianShui = 235,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1308,job =1},
                          {type = 11,value = 4360,job =1},
                          {type = 13,value =  1308,job =2},
                          {type = 15,value =  4360,job =2},
                          {type = 17,value =  1308,job =3},
                          {type = 19,value =  4360,job =3},
                          {type = 5,value =  12208,job =0},
                          {type = 145,value =  2969,job =0},
                      }, 
                },
                --17级
                {                            
                  needXianShui = 250,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1398,job =1},
                          {type = 11,value = 4660,job =1},
                          {type = 13,value =  1398,job =2},
                          {type = 15,value =  4660,job =2},
                          {type = 17,value =  1398,job =3},
                          {type = 19,value =  4660,job =3},
                          {type = 5,value =  13048,job =0},
                          {type = 145,value =  3152,job =0},
                      }, 
                },
                --18级
                {                            
                  needXianShui = 265,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1493,job =1},
                          {type = 11,value = 4978,job =1},
                          {type = 13,value =  1493,job =2},
                          {type = 15,value =  4978,job =2},
                          {type = 17,value =  1493,job =3},
                          {type = 19,value =  4978,job =3},
                          {type = 5,value =  13938,job =0},
                          {type = 145,value =  3347,job =0},
                      }, 
                },
                --19级
                {                            
                  needXianShui = 280,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1594,job =1},
                          {type = 11,value = 5314,job =1},
                          {type = 13,value =  1594,job =2},
                          {type = 15,value =  5314,job =2},
                          {type = 17,value =  1594,job =3},
                          {type = 19,value =  5314,job =3},
                          {type = 5,value =  14879,job =0},
                          {type = 145,value =  3552,job =0},
                      }, 
                },
                --20级
                {                            
                  needXianShui = 295,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1700,job =1},
                          {type = 11,value = 5668,job =1},
                          {type = 13,value =  1700,job =2},
                          {type = 15,value =  5668,job =2},
                          {type = 17,value =  1700,job =3},
                          {type = 19,value =  5668,job =3},
                          {type = 5,value =  15870,job =0},
                          {type = 145,value =  3768,job =0},
                      }, 
                },
                --21级
                {                            
                  needXianShui = 0,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2105,job =1},
                          {type = 11,value = 7018,job =1},
                          {type = 13,value =  2105,job =2},
                          {type = 15,value =  7018,job =2},
                          {type = 17,value =  2105,job =3},
                          {type = 19,value =  7018,job =3},
                          {type = 5,value =  19650,job =0},
                          {type = 145,value =  4870,job =0},
                      }, 
                },
                --22级
                {                            
                  needXianShui = 315,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2191,job =1},
                          {type = 11,value = 7302,job =1},
                          {type = 13,value =  2191,job =2},
                          {type = 15,value =  7302,job =2},
                          {type = 17,value =  2191,job =3},
                          {type = 19,value =  7302,job =3},
                          {type = 5,value =  20446,job =0},
                          {type = 145,value =  5044,job =0},
                      }, 
                },
                --23级
                {                            
                  needXianShui = 335,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2281,job =1},
                          {type = 11,value = 7604,job =1},
                          {type = 13,value =  2281,job =2},
                          {type = 15,value =  7604,job =2},
                          {type = 17,value =  2281,job =3},
                          {type = 19,value =  7604,job =3},
                          {type = 5,value =  21291,job =0},
                          {type = 145,value =  5229,job =0},
                      }, 
                },
                --24级
                {                            
                  needXianShui = 355,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2377,job =1},
                          {type = 11,value = 7924,job =1},
                          {type = 13,value =  2377,job =2},
                          {type = 15,value =  7924,job =2},
                          {type = 17,value =  2377,job =3},
                          {type = 19,value =  7924,job =3},
                          {type = 5,value =  22187,job =0},
                          {type = 145,value =  5424,job =0},
                      }, 
                },
                --25级
                {                            
                  needXianShui = 375,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2479,job =1},
                          {type = 11,value = 8262,job =1},
                          {type = 13,value =  2479,job =2},
                          {type = 15,value =  8262,job =2},
                          {type = 17,value =  2479,job =3},
                          {type = 19,value =  8262,job =3},
                          {type = 5,value =  23134,job =0},
                          {type = 145,value =  5632,job =0},
                      }, 
                },
                --26级
                {                            
                  needXianShui = 395,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2585,job =1},
                          {type = 11,value = 8618,job =1},
                          {type = 13,value =  2585,job =2},
                          {type = 15,value =  8618,job =2},
                          {type = 17,value =  2585,job =3},
                          {type = 19,value =  8618,job =3},
                          {type = 5,value =  24130,job =0},
                          {type = 145,value =  5849,job =0},
                      }, 
                },
                --27级
                {                            
                  needXianShui = 415,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2698,job =1},
                          {type = 11,value = 8992,job =1},
                          {type = 13,value =  2698,job =2},
                          {type = 15,value =  8992,job =2},
                          {type = 17,value =  2698,job =3},
                          {type = 19,value =  8992,job =3},
                          {type = 5,value =  25178,job =0},
                          {type = 145,value =  6078,job =0},
                      }, 
                },
                --28级
                {                            
                  needXianShui = 435,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2815,job =1},
                          {type = 11,value = 9384,job =1},
                          {type = 13,value =  2815,job =2},
                          {type = 15,value =  9384,job =2},
                          {type = 17,value =  2815,job =3},
                          {type = 19,value =  9384,job =3},
                          {type = 5,value =  26275,job =0},
                          {type = 145,value =  6318,job =0},
                      }, 
                },
                --29级
                {                            
                  needXianShui = 455,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2938,job =1},
                          {type = 11,value = 9794,job =1},
                          {type = 13,value =  2938,job =2},
                          {type = 15,value =  9794,job =2},
                          {type = 17,value =  2938,job =3},
                          {type = 19,value =  9794,job =3},
                          {type = 5,value =  27423,job =0},
                          {type = 145,value =  6569,job =0},
                      }, 
                },
                --30级
                {                            
                  needXianShui = 475,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 3067,job =1},
                          {type = 11,value = 10222,job =1},
                          {type = 13,value =  3067,job =2},
                          {type = 15,value =  10222,job =2},
                          {type = 17,value =  3067,job =3},
                          {type = 19,value =  10222,job =3},
                          {type = 5,value =  28622,job =0},
                          {type = 145,value =  6831,job =0},
                      }, 
                },
                --31级
                {                            
                  needXianShui = 0,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 3715,job =1},
                          {type = 11,value = 12382,job =1},
                          {type = 13,value =  3715,job =2},
                          {type = 15,value =  12382,job =2},
                          {type = 17,value =  3715,job =3},
                          {type = 19,value =  12382,job =3},
                          {type = 5,value =  34670,job =0},
                          {type = 145,value =  8594,job =0},
                      }, 
                },
                --32级
                {                            
                  needXianShui = 500,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 3805,job =1},
                          {type = 11,value = 12682,job =1},
                          {type = 13,value =  3805,job =2},
                          {type = 15,value =  12682,job =2},
                          {type = 17,value =  3805,job =3},
                          {type = 19,value =  12682,job =3},
                          {type = 5,value =  35510,job =0},
                          {type = 145,value =  8778,job =0},
                      }, 
                },
                --33级
                {                            
                  needXianShui = 525,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 3899,job =1},
                          {type = 11,value = 12997,job =1},
                          {type = 13,value =  3899,job =2},
                          {type = 15,value =  12997,job =2},
                          {type = 17,value =  3899,job =3},
                          {type = 19,value =  12997,job =3},
                          {type = 5,value =  36392,job =0},
                          {type = 145,value =  8970,job =0},
                      }, 
                },
                --34级
                {                            
                  needXianShui = 550,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 3998,job =1},
                          {type = 11,value = 13327,job =1},
                          {type = 13,value =  3998,job =2},
                          {type = 15,value =  13327,job =2},
                          {type = 17,value =  3998,job =3},
                          {type = 19,value =  13327,job =3},
                          {type = 5,value =  37316,job =0},
                          {type = 145,value =  9172,job =0},
                      }, 
                },
                --35级
                {                            
                  needXianShui = 575,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 4102,job =1},
                          {type = 11,value = 13672,job =1},
                          {type = 13,value =  4102,job =2},
                          {type = 15,value =  13672,job =2},
                          {type = 17,value =  4102,job =3},
                          {type = 19,value =  13672,job =3},
                          {type = 5,value =  38282,job =0},
                          {type = 145,value =  9383,job =0},
                      }, 
                },
                --36级
                {                            
                  needXianShui = 600,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 4210,job =1},
                          {type = 11,value = 14032,job =1},
                          {type = 13,value =  4210,job =2},
                          {type = 15,value =  14032,job =2},
                          {type = 17,value =  4210,job =3},
                          {type = 19,value =  14032,job =3},
                          {type = 5,value =  39290,job =0},
                          {type = 145,value =  9603,job =0},
                      }, 
                },
                --37级
                {                            
                  needXianShui = 625,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 4322,job =1},
                          {type = 11,value = 14407,job =1},
                          {type = 13,value =  4322,job =2},
                          {type = 15,value =  14407,job =2},
                          {type = 17,value =  4322,job =3},
                          {type = 19,value =  14407,job =3},
                          {type = 5,value =  40340,job =0},
                          {type = 145,value =  9833,job =0},
                      }, 
                },
                --38级
                {                            
                  needXianShui = 650,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 4439,job =1},
                          {type = 11,value = 14797,job =1},
                          {type = 13,value =  4439,job =2},
                          {type = 15,value =  14797,job =2},
                          {type = 17,value =  4439,job =3},
                          {type = 19,value =  14797,job =3},
                          {type = 5,value =  41432,job =0},
                          {type = 145,value =  10071,job =0},
                      }, 
                },
                --39级
                {                            
                  needXianShui = 675,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 4561,job =1},
                          {type = 11,value = 15202,job =1},
                          {type = 13,value =  4561,job =2},
                          {type = 15,value =  15202,job =2},
                          {type = 17,value =  4561,job =3},
                          {type = 19,value =  15202,job =3},
                          {type = 5,value =  42566,job =0},
                          {type = 145,value =  10320,job =0},
                      }, 
                },
                --40级
                {                            
                  needXianShui = 700,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 4687,job =1},
                          {type = 11,value = 15622,job =1},
                          {type = 13,value =  4687,job =2},
                          {type = 15,value =  15622,job =2},
                          {type = 17,value =  4687,job =3},
                          {type = 19,value =  15622,job =3},
                          {type = 5,value =  43742,job =0},
                          {type = 145,value =  10577,job =0},
                      }, 
                },
                --41级
                {                            
                  needXianShui = 0,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 5497,job =1},
                          {type = 11,value = 18322,job =1},
                          {type = 13,value =  5497,job =2},
                          {type = 15,value =  18322,job =2},
                          {type = 17,value =  5497,job =3},
                          {type = 19,value =  18322,job =3},
                          {type = 5,value =  51302,job =0},
                          {type = 145,value =  12780,job =0},
                      }, 
                },
                --42级
                {                            
                  needXianShui = 730,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 5562,job =1},
                          {type = 11,value = 18541,job =1},
                          {type = 13,value =  5562,job =2},
                          {type = 15,value =  18541,job =2},
                          {type = 17,value =  5562,job =3},
                          {type = 19,value =  18541,job =3},
                          {type = 5,value =  51915,job =0},
                          {type = 145,value =  12914,job =0},
                      }, 
                },
                --43级
                {                            
                  needXianShui = 760,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 5631,job =1},
                          {type = 11,value = 18769,job =1},
                          {type = 13,value =  5631,job =2},
                          {type = 15,value =  18769,job =2},
                          {type = 17,value =  5631,job =3},
                          {type = 19,value =  18769,job =3},
                          {type = 5,value =  52553,job =0},
                          {type = 145,value =  13054,job =0},
                      }, 
                },
                --44级
                {                            
                  needXianShui = 790,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 5702,job =1},
                          {type = 11,value = 19006,job =1},
                          {type = 13,value =  5702,job =2},
                          {type = 15,value =  19006,job =2},
                          {type = 17,value =  5702,job =3},
                          {type = 19,value =  19006,job =3},
                          {type = 5,value =  53217,job =0},
                          {type = 145,value =  13198,job =0},
                      }, 
                },
                --45级
                {                            
                  needXianShui = 820,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 5776,job =1},
                          {type = 11,value = 19252,job =1},
                          {type = 13,value =  5776,job =2},
                          {type = 15,value =  19252,job =2},
                          {type = 17,value =  5776,job =3},
                          {type = 19,value =  19252,job =3},
                          {type = 5,value =  53906,job =0},
                          {type = 145,value =  13349,job =0},
                      }, 
                },
                --46级
                {                            
                  needXianShui = 850,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 5852,job =1},
                          {type = 11,value = 19507,job =1},
                          {type = 13,value =  5852,job =2},
                          {type = 15,value =  19507,job =2},
                          {type = 17,value =  5852,job =3},
                          {type = 19,value =  19507,job =3},
                          {type = 5,value =  54620,job =0},
                          {type = 145,value =  13505,job =0},
                      }, 
                },
                --47级
                {                            
                  needXianShui = 880,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 5931,job =1},
                          {type = 11,value = 19771,job =1},
                          {type = 13,value =  5931,job =2},
                          {type = 15,value =  19771,job =2},
                          {type = 17,value =  5931,job =3},
                          {type = 19,value =  19771,job =3},
                          {type = 5,value =  55359,job =0},
                          {type = 145,value =  13666,job =0},
                      }, 
                },
                --48级
                {                            
                  needXianShui = 910,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 6013,job =1},
                          {type = 11,value = 20044,job =1},
                          {type = 13,value =  6013,job =2},
                          {type = 15,value =  20044,job =2},
                          {type = 17,value =  6013,job =3},
                          {type = 19,value =  20044,job =3},
                          {type = 5,value =  56123,job =0},
                          {type = 145,value =  13833,job =0},
                      }, 
                },
                --49级
                {                            
                  needXianShui = 940,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 6098,job =1},
                          {type = 11,value = 20326,job =1},
                          {type = 13,value =  6098,job =2},
                          {type = 15,value =  20326,job =2},
                          {type = 17,value =  6098,job =3},
                          {type = 19,value =  20326,job =3},
                          {type = 5,value =  56913,job =0},
                          {type = 145,value =  14006,job =0},
                      }, 
                },
                --50级
                {                            
                  needXianShui = 970,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 6185,job =1},
                          {type = 11,value = 20617,job =1},
                          {type = 13,value =  6185,job =2},
                          {type = 15,value =  20617,job =2},
                          {type = 17,value =  6185,job =3},
                          {type = 19,value =  20617,job =3},
                          {type = 5,value =  57728,job =0},
                          {type = 145,value =  14184,job =0},
                      }, 
                },

			},
			
		},

        --左手镯
		{
			brokenNeedItem = 7082,
			ShowItem = {7098,7106,7114,7122,7130},
			brokenNeedItemCount = {1,2,5,7,10}, --激活所需，达到2阶所需，到3阶所需，到4阶多需，到5阶所需
			levelUpInfo = 
			{

                --1级
                {                            
                  needXianShui = 0,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 171,job =1},
                          {type = 11,value = 570,job =1},
                          {type = 13,value =  171,job =2},
                          {type = 15,value =  570,job =2},
                          {type = 17,value =  171,job =3},
                          {type = 19,value =  570,job =3},
                          {type = 5,value =  1596,job =0},
                          {type = 145,value =  465,job =0},
                      }, 
                },
                --2级
                {                            
                  needXianShui = 80,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 219,job =1},
                          {type = 11,value = 730,job =1},
                          {type = 13,value =  219,job =2},
                          {type = 15,value =  730,job =2},
                          {type = 17,value =  219,job =3},
                          {type = 19,value =  730,job =3},
                          {type = 5,value =  2044,job =0},
                          {type = 145,value =  563,job =0},
                      }, 
                },
                --3级
                {                            
                  needXianShui = 90,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 260,job =1},
                          {type = 11,value = 865,job =1},
                          {type = 13,value =  260,job =2},
                          {type = 15,value =  865,job =2},
                          {type = 17,value =  260,job =3},
                          {type = 19,value =  865,job =3},
                          {type = 5,value =  2422,job =0},
                          {type = 145,value =  646,job =0},
                      }, 
                },
                --4级
                {                            
                  needXianShui = 100,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 305,job =1},
                          {type = 11,value = 1015,job =1},
                          {type = 13,value =  305,job =2},
                          {type = 15,value =  1015,job =2},
                          {type = 17,value =  305,job =3},
                          {type = 19,value =  1015,job =3},
                          {type = 5,value =  2842,job =0},
                          {type = 145,value =  737,job =0},
                      }, 
                },
                --5级
                {                            
                  needXianShui = 110,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 354,job =1},
                          {type = 11,value = 1180,job =1},
                          {type = 13,value =  354,job =2},
                          {type = 15,value =  1180,job =2},
                          {type = 17,value =  354,job =3},
                          {type = 19,value =  1180,job =3},
                          {type = 5,value =  3304,job =0},
                          {type = 145,value =  839,job =0},
                      }, 
                },
                --6级
                {                            
                  needXianShui = 120,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 408,job =1},
                          {type = 11,value = 1360,job =1},
                          {type = 13,value =  408,job =2},
                          {type = 15,value =  1360,job =2},
                          {type = 17,value =  408,job =3},
                          {type = 19,value =  1360,job =3},
                          {type = 5,value =  3808,job =0},
                          {type = 145,value =  949,job =0},
                      }, 
                },
                --7级
                {                            
                  needXianShui = 130,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 467,job =1},
                          {type = 11,value = 1555,job =1},
                          {type = 13,value =  467,job =2},
                          {type = 15,value =  1555,job =2},
                          {type = 17,value =  467,job =3},
                          {type = 19,value =  1555,job =3},
                          {type = 5,value =  4354,job =0},
                          {type = 145,value =  1068,job =0},
                      }, 
                },
                --8级
                {                            
                  needXianShui = 140,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 530,job =1},
                          {type = 11,value = 1765,job =1},
                          {type = 13,value =  530,job =2},
                          {type = 15,value =  1765,job =2},
                          {type = 17,value =  530,job =3},
                          {type = 19,value =  1765,job =3},
                          {type = 5,value =  4942,job =0},
                          {type = 145,value =  1197,job =0},
                      }, 
                },
                --9级
                {                            
                  needXianShui = 150,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 597,job =1},
                          {type = 11,value = 1990,job =1},
                          {type = 13,value =  597,job =2},
                          {type = 15,value =  1990,job =2},
                          {type = 17,value =  597,job =3},
                          {type = 19,value =  1990,job =3},
                          {type = 5,value =  5572,job =0},
                          {type = 145,value =  1334,job =0},
                      }, 
                },
                --10级
                {                            
                  needXianShui = 160,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 669,job =1},
                          {type = 11,value = 2230,job =1},
                          {type = 13,value =  669,job =2},
                          {type = 15,value =  2230,job =2},
                          {type = 17,value =  669,job =3},
                          {type = 19,value =  2230,job =3},
                          {type = 5,value =  6244,job =0},
                          {type = 145,value =  1481,job =0},
                      }, 
                },
                --11级
                {                            
                  needXianShui = 0,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 939,job =1},
                          {type = 11,value = 3130,job =1},
                          {type = 13,value =  939,job =2},
                          {type = 15,value =  3130,job =2},
                          {type = 17,value =  939,job =3},
                          {type = 19,value =  3130,job =3},
                          {type = 5,value =  8764,job =0},
                          {type = 145,value =  2215,job =0},
                      }, 
                },
                --12级
                {                            
                  needXianShui = 175,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1002,job =1},
                          {type = 11,value = 3340,job =1},
                          {type = 13,value =  1002,job =2},
                          {type = 15,value =  3340,job =2},
                          {type = 17,value =  1002,job =3},
                          {type = 19,value =  3340,job =3},
                          {type = 5,value =  9352,job =0},
                          {type = 145,value =  2344,job =0},
                      }, 
                },
                --13级
                {                            
                  needXianShui = 190,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1070,job =1},
                          {type = 11,value = 3568,job =1},
                          {type = 13,value =  1070,job =2},
                          {type = 15,value =  3568,job =2},
                          {type = 17,value =  1070,job =3},
                          {type = 19,value =  3568,job =3},
                          {type = 5,value =  9990,job =0},
                          {type = 145,value =  2483,job =0},
                      }, 
                },
                --14级
                {                            
                  needXianShui = 205,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1144,job =1},
                          {type = 11,value = 3814,job =1},
                          {type = 13,value =  1144,job =2},
                          {type = 15,value =  3814,job =2},
                          {type = 17,value =  1144,job =3},
                          {type = 19,value =  3814,job =3},
                          {type = 5,value =  10679,job =0},
                          {type = 145,value =  2634,job =0},
                      }, 
                },
                --15级
                {                            
                  needXianShui = 220,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1223,job =1},
                          {type = 11,value = 4078,job =1},
                          {type = 13,value =  1223,job =2},
                          {type = 15,value =  4078,job =2},
                          {type = 17,value =  1223,job =3},
                          {type = 19,value =  4078,job =3},
                          {type = 5,value =  11418,job =0},
                          {type = 145,value =  2796,job =0},
                      }, 
                },
                --16级
                {                            
                  needXianShui = 235,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1308,job =1},
                          {type = 11,value = 4360,job =1},
                          {type = 13,value =  1308,job =2},
                          {type = 15,value =  4360,job =2},
                          {type = 17,value =  1308,job =3},
                          {type = 19,value =  4360,job =3},
                          {type = 5,value =  12208,job =0},
                          {type = 145,value =  2969,job =0},
                      }, 
                },
                --17级
                {                            
                  needXianShui = 250,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1398,job =1},
                          {type = 11,value = 4660,job =1},
                          {type = 13,value =  1398,job =2},
                          {type = 15,value =  4660,job =2},
                          {type = 17,value =  1398,job =3},
                          {type = 19,value =  4660,job =3},
                          {type = 5,value =  13048,job =0},
                          {type = 145,value =  3152,job =0},
                      }, 
                },
                --18级
                {                            
                  needXianShui = 265,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1493,job =1},
                          {type = 11,value = 4978,job =1},
                          {type = 13,value =  1493,job =2},
                          {type = 15,value =  4978,job =2},
                          {type = 17,value =  1493,job =3},
                          {type = 19,value =  4978,job =3},
                          {type = 5,value =  13938,job =0},
                          {type = 145,value =  3347,job =0},
                      }, 
                },
                --19级
                {                            
                  needXianShui = 280,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1594,job =1},
                          {type = 11,value = 5314,job =1},
                          {type = 13,value =  1594,job =2},
                          {type = 15,value =  5314,job =2},
                          {type = 17,value =  1594,job =3},
                          {type = 19,value =  5314,job =3},
                          {type = 5,value =  14879,job =0},
                          {type = 145,value =  3552,job =0},
                      }, 
                },
                --20级
                {                            
                  needXianShui = 295,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1700,job =1},
                          {type = 11,value = 5668,job =1},
                          {type = 13,value =  1700,job =2},
                          {type = 15,value =  5668,job =2},
                          {type = 17,value =  1700,job =3},
                          {type = 19,value =  5668,job =3},
                          {type = 5,value =  15870,job =0},
                          {type = 145,value =  3768,job =0},
                      }, 
                },
                --21级
                {                            
                  needXianShui = 0,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2105,job =1},
                          {type = 11,value = 7018,job =1},
                          {type = 13,value =  2105,job =2},
                          {type = 15,value =  7018,job =2},
                          {type = 17,value =  2105,job =3},
                          {type = 19,value =  7018,job =3},
                          {type = 5,value =  19650,job =0},
                          {type = 145,value =  4870,job =0},
                      }, 
                },
                --22级
                {                            
                  needXianShui = 315,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2191,job =1},
                          {type = 11,value = 7302,job =1},
                          {type = 13,value =  2191,job =2},
                          {type = 15,value =  7302,job =2},
                          {type = 17,value =  2191,job =3},
                          {type = 19,value =  7302,job =3},
                          {type = 5,value =  20446,job =0},
                          {type = 145,value =  5044,job =0},
                      }, 
                },
                --23级
                {                            
                  needXianShui = 335,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2281,job =1},
                          {type = 11,value = 7604,job =1},
                          {type = 13,value =  2281,job =2},
                          {type = 15,value =  7604,job =2},
                          {type = 17,value =  2281,job =3},
                          {type = 19,value =  7604,job =3},
                          {type = 5,value =  21291,job =0},
                          {type = 145,value =  5229,job =0},
                      }, 
                },
                --24级
                {                            
                  needXianShui = 355,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2377,job =1},
                          {type = 11,value = 7924,job =1},
                          {type = 13,value =  2377,job =2},
                          {type = 15,value =  7924,job =2},
                          {type = 17,value =  2377,job =3},
                          {type = 19,value =  7924,job =3},
                          {type = 5,value =  22187,job =0},
                          {type = 145,value =  5424,job =0},
                      }, 
                },
                --25级
                {                            
                  needXianShui = 375,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2479,job =1},
                          {type = 11,value = 8262,job =1},
                          {type = 13,value =  2479,job =2},
                          {type = 15,value =  8262,job =2},
                          {type = 17,value =  2479,job =3},
                          {type = 19,value =  8262,job =3},
                          {type = 5,value =  23134,job =0},
                          {type = 145,value =  5632,job =0},
                      }, 
                },
                --26级
                {                            
                  needXianShui = 395,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2585,job =1},
                          {type = 11,value = 8618,job =1},
                          {type = 13,value =  2585,job =2},
                          {type = 15,value =  8618,job =2},
                          {type = 17,value =  2585,job =3},
                          {type = 19,value =  8618,job =3},
                          {type = 5,value =  24130,job =0},
                          {type = 145,value =  5849,job =0},
                      }, 
                },
                --27级
                {                            
                  needXianShui = 415,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2698,job =1},
                          {type = 11,value = 8992,job =1},
                          {type = 13,value =  2698,job =2},
                          {type = 15,value =  8992,job =2},
                          {type = 17,value =  2698,job =3},
                          {type = 19,value =  8992,job =3},
                          {type = 5,value =  25178,job =0},
                          {type = 145,value =  6078,job =0},
                      }, 
                },
                --28级
                {                            
                  needXianShui = 435,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2815,job =1},
                          {type = 11,value = 9384,job =1},
                          {type = 13,value =  2815,job =2},
                          {type = 15,value =  9384,job =2},
                          {type = 17,value =  2815,job =3},
                          {type = 19,value =  9384,job =3},
                          {type = 5,value =  26275,job =0},
                          {type = 145,value =  6318,job =0},
                      }, 
                },
                --29级
                {                            
                  needXianShui = 455,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2938,job =1},
                          {type = 11,value = 9794,job =1},
                          {type = 13,value =  2938,job =2},
                          {type = 15,value =  9794,job =2},
                          {type = 17,value =  2938,job =3},
                          {type = 19,value =  9794,job =3},
                          {type = 5,value =  27423,job =0},
                          {type = 145,value =  6569,job =0},
                      }, 
                },
                --30级
                {                            
                  needXianShui = 475,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 3067,job =1},
                          {type = 11,value = 10222,job =1},
                          {type = 13,value =  3067,job =2},
                          {type = 15,value =  10222,job =2},
                          {type = 17,value =  3067,job =3},
                          {type = 19,value =  10222,job =3},
                          {type = 5,value =  28622,job =0},
                          {type = 145,value =  6831,job =0},
                      }, 
                },
                --31级
                {                            
                  needXianShui = 0,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 3715,job =1},
                          {type = 11,value = 12382,job =1},
                          {type = 13,value =  3715,job =2},
                          {type = 15,value =  12382,job =2},
                          {type = 17,value =  3715,job =3},
                          {type = 19,value =  12382,job =3},
                          {type = 5,value =  34670,job =0},
                          {type = 145,value =  8594,job =0},
                      }, 
                },
                --32级
                {                            
                  needXianShui = 500,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 3805,job =1},
                          {type = 11,value = 12682,job =1},
                          {type = 13,value =  3805,job =2},
                          {type = 15,value =  12682,job =2},
                          {type = 17,value =  3805,job =3},
                          {type = 19,value =  12682,job =3},
                          {type = 5,value =  35510,job =0},
                          {type = 145,value =  8778,job =0},
                      }, 
                },
                --33级
                {                            
                  needXianShui = 525,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 3899,job =1},
                          {type = 11,value = 12997,job =1},
                          {type = 13,value =  3899,job =2},
                          {type = 15,value =  12997,job =2},
                          {type = 17,value =  3899,job =3},
                          {type = 19,value =  12997,job =3},
                          {type = 5,value =  36392,job =0},
                          {type = 145,value =  8970,job =0},
                      }, 
                },
                --34级
                {                            
                  needXianShui = 550,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 3998,job =1},
                          {type = 11,value = 13327,job =1},
                          {type = 13,value =  3998,job =2},
                          {type = 15,value =  13327,job =2},
                          {type = 17,value =  3998,job =3},
                          {type = 19,value =  13327,job =3},
                          {type = 5,value =  37316,job =0},
                          {type = 145,value =  9172,job =0},
                      }, 
                },
                --35级
                {                            
                  needXianShui = 575,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 4102,job =1},
                          {type = 11,value = 13672,job =1},
                          {type = 13,value =  4102,job =2},
                          {type = 15,value =  13672,job =2},
                          {type = 17,value =  4102,job =3},
                          {type = 19,value =  13672,job =3},
                          {type = 5,value =  38282,job =0},
                          {type = 145,value =  9383,job =0},
                      }, 
                },
                --36级
                {                            
                  needXianShui = 600,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 4210,job =1},
                          {type = 11,value = 14032,job =1},
                          {type = 13,value =  4210,job =2},
                          {type = 15,value =  14032,job =2},
                          {type = 17,value =  4210,job =3},
                          {type = 19,value =  14032,job =3},
                          {type = 5,value =  39290,job =0},
                          {type = 145,value =  9603,job =0},
                      }, 
                },
                --37级
                {                            
                  needXianShui = 625,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 4322,job =1},
                          {type = 11,value = 14407,job =1},
                          {type = 13,value =  4322,job =2},
                          {type = 15,value =  14407,job =2},
                          {type = 17,value =  4322,job =3},
                          {type = 19,value =  14407,job =3},
                          {type = 5,value =  40340,job =0},
                          {type = 145,value =  9833,job =0},
                      }, 
                },
                --38级
                {                            
                  needXianShui = 650,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 4439,job =1},
                          {type = 11,value = 14797,job =1},
                          {type = 13,value =  4439,job =2},
                          {type = 15,value =  14797,job =2},
                          {type = 17,value =  4439,job =3},
                          {type = 19,value =  14797,job =3},
                          {type = 5,value =  41432,job =0},
                          {type = 145,value =  10071,job =0},
                      }, 
                },
                --39级
                {                            
                  needXianShui = 675,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 4561,job =1},
                          {type = 11,value = 15202,job =1},
                          {type = 13,value =  4561,job =2},
                          {type = 15,value =  15202,job =2},
                          {type = 17,value =  4561,job =3},
                          {type = 19,value =  15202,job =3},
                          {type = 5,value =  42566,job =0},
                          {type = 145,value =  10320,job =0},
                      }, 
                },
                --40级
                {                            
                  needXianShui = 700,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 4687,job =1},
                          {type = 11,value = 15622,job =1},
                          {type = 13,value =  4687,job =2},
                          {type = 15,value =  15622,job =2},
                          {type = 17,value =  4687,job =3},
                          {type = 19,value =  15622,job =3},
                          {type = 5,value =  43742,job =0},
                          {type = 145,value =  10577,job =0},
                      }, 
                },
                --41级
                {                            
                  needXianShui = 0,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 5497,job =1},
                          {type = 11,value = 18322,job =1},
                          {type = 13,value =  5497,job =2},
                          {type = 15,value =  18322,job =2},
                          {type = 17,value =  5497,job =3},
                          {type = 19,value =  18322,job =3},
                          {type = 5,value =  51302,job =0},
                          {type = 145,value =  12780,job =0},
                      }, 
                },
                --42级
                {                            
                  needXianShui = 730,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 5562,job =1},
                          {type = 11,value = 18541,job =1},
                          {type = 13,value =  5562,job =2},
                          {type = 15,value =  18541,job =2},
                          {type = 17,value =  5562,job =3},
                          {type = 19,value =  18541,job =3},
                          {type = 5,value =  51915,job =0},
                          {type = 145,value =  12914,job =0},
                      }, 
                },
                --43级
                {                            
                  needXianShui = 760,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 5631,job =1},
                          {type = 11,value = 18769,job =1},
                          {type = 13,value =  5631,job =2},
                          {type = 15,value =  18769,job =2},
                          {type = 17,value =  5631,job =3},
                          {type = 19,value =  18769,job =3},
                          {type = 5,value =  52553,job =0},
                          {type = 145,value =  13054,job =0},
                      }, 
                },
                --44级
                {                            
                  needXianShui = 790,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 5702,job =1},
                          {type = 11,value = 19006,job =1},
                          {type = 13,value =  5702,job =2},
                          {type = 15,value =  19006,job =2},
                          {type = 17,value =  5702,job =3},
                          {type = 19,value =  19006,job =3},
                          {type = 5,value =  53217,job =0},
                          {type = 145,value =  13198,job =0},
                      }, 
                },
                --45级
                {                            
                  needXianShui = 820,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 5776,job =1},
                          {type = 11,value = 19252,job =1},
                          {type = 13,value =  5776,job =2},
                          {type = 15,value =  19252,job =2},
                          {type = 17,value =  5776,job =3},
                          {type = 19,value =  19252,job =3},
                          {type = 5,value =  53906,job =0},
                          {type = 145,value =  13349,job =0},
                      }, 
                },
                --46级
                {                            
                  needXianShui = 850,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 5852,job =1},
                          {type = 11,value = 19507,job =1},
                          {type = 13,value =  5852,job =2},
                          {type = 15,value =  19507,job =2},
                          {type = 17,value =  5852,job =3},
                          {type = 19,value =  19507,job =3},
                          {type = 5,value =  54620,job =0},
                          {type = 145,value =  13505,job =0},
                      }, 
                },
                --47级
                {                            
                  needXianShui = 880,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 5931,job =1},
                          {type = 11,value = 19771,job =1},
                          {type = 13,value =  5931,job =2},
                          {type = 15,value =  19771,job =2},
                          {type = 17,value =  5931,job =3},
                          {type = 19,value =  19771,job =3},
                          {type = 5,value =  55359,job =0},
                          {type = 145,value =  13666,job =0},
                      }, 
                },
                --48级
                {                            
                  needXianShui = 910,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 6013,job =1},
                          {type = 11,value = 20044,job =1},
                          {type = 13,value =  6013,job =2},
                          {type = 15,value =  20044,job =2},
                          {type = 17,value =  6013,job =3},
                          {type = 19,value =  20044,job =3},
                          {type = 5,value =  56123,job =0},
                          {type = 145,value =  13833,job =0},
                      }, 
                },
                --49级
                {                            
                  needXianShui = 940,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 6098,job =1},
                          {type = 11,value = 20326,job =1},
                          {type = 13,value =  6098,job =2},
                          {type = 15,value =  20326,job =2},
                          {type = 17,value =  6098,job =3},
                          {type = 19,value =  20326,job =3},
                          {type = 5,value =  56913,job =0},
                          {type = 145,value =  14006,job =0},
                      }, 
                },
                --50级
                {                            
                  needXianShui = 970,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 6185,job =1},
                          {type = 11,value = 20617,job =1},
                          {type = 13,value =  6185,job =2},
                          {type = 15,value =  20617,job =2},
                          {type = 17,value =  6185,job =3},
                          {type = 19,value =  20617,job =3},
                          {type = 5,value =  57728,job =0},
                          {type = 145,value =  14184,job =0},
                      }, 
                },

			},
			
		},

        --右手镯
		{
			brokenNeedItem = 7082,
			ShowItem = {7098,7106,7114,7122,7130},
			brokenNeedItemCount = {1,2,5,7,10}, --激活所需，达到2阶所需，到3阶所需，到4阶多需，到5阶所需
			levelUpInfo = 
			{

                --1级
                {                            
                  needXianShui = 0,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 171,job =1},
                          {type = 11,value = 570,job =1},
                          {type = 13,value =  171,job =2},
                          {type = 15,value =  570,job =2},
                          {type = 17,value =  171,job =3},
                          {type = 19,value =  570,job =3},
                          {type = 5,value =  1596,job =0},
                          {type = 145,value =  465,job =0},
                      }, 
                },
                --2级
                {                            
                  needXianShui = 80,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 219,job =1},
                          {type = 11,value = 730,job =1},
                          {type = 13,value =  219,job =2},
                          {type = 15,value =  730,job =2},
                          {type = 17,value =  219,job =3},
                          {type = 19,value =  730,job =3},
                          {type = 5,value =  2044,job =0},
                          {type = 145,value =  563,job =0},
                      }, 
                },
                --3级
                {                            
                  needXianShui = 90,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 260,job =1},
                          {type = 11,value = 865,job =1},
                          {type = 13,value =  260,job =2},
                          {type = 15,value =  865,job =2},
                          {type = 17,value =  260,job =3},
                          {type = 19,value =  865,job =3},
                          {type = 5,value =  2422,job =0},
                          {type = 145,value =  646,job =0},
                      }, 
                },
                --4级
                {                            
                  needXianShui = 100,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 305,job =1},
                          {type = 11,value = 1015,job =1},
                          {type = 13,value =  305,job =2},
                          {type = 15,value =  1015,job =2},
                          {type = 17,value =  305,job =3},
                          {type = 19,value =  1015,job =3},
                          {type = 5,value =  2842,job =0},
                          {type = 145,value =  737,job =0},
                      }, 
                },
                --5级
                {                            
                  needXianShui = 110,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 354,job =1},
                          {type = 11,value = 1180,job =1},
                          {type = 13,value =  354,job =2},
                          {type = 15,value =  1180,job =2},
                          {type = 17,value =  354,job =3},
                          {type = 19,value =  1180,job =3},
                          {type = 5,value =  3304,job =0},
                          {type = 145,value =  839,job =0},
                      }, 
                },
                --6级
                {                            
                  needXianShui = 120,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 408,job =1},
                          {type = 11,value = 1360,job =1},
                          {type = 13,value =  408,job =2},
                          {type = 15,value =  1360,job =2},
                          {type = 17,value =  408,job =3},
                          {type = 19,value =  1360,job =3},
                          {type = 5,value =  3808,job =0},
                          {type = 145,value =  949,job =0},
                      }, 
                },
                --7级
                {                            
                  needXianShui = 130,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 467,job =1},
                          {type = 11,value = 1555,job =1},
                          {type = 13,value =  467,job =2},
                          {type = 15,value =  1555,job =2},
                          {type = 17,value =  467,job =3},
                          {type = 19,value =  1555,job =3},
                          {type = 5,value =  4354,job =0},
                          {type = 145,value =  1068,job =0},
                      }, 
                },
                --8级
                {                            
                  needXianShui = 140,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 530,job =1},
                          {type = 11,value = 1765,job =1},
                          {type = 13,value =  530,job =2},
                          {type = 15,value =  1765,job =2},
                          {type = 17,value =  530,job =3},
                          {type = 19,value =  1765,job =3},
                          {type = 5,value =  4942,job =0},
                          {type = 145,value =  1197,job =0},
                      }, 
                },
                --9级
                {                            
                  needXianShui = 150,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 597,job =1},
                          {type = 11,value = 1990,job =1},
                          {type = 13,value =  597,job =2},
                          {type = 15,value =  1990,job =2},
                          {type = 17,value =  597,job =3},
                          {type = 19,value =  1990,job =3},
                          {type = 5,value =  5572,job =0},
                          {type = 145,value =  1334,job =0},
                      }, 
                },
                --10级
                {                            
                  needXianShui = 160,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 669,job =1},
                          {type = 11,value = 2230,job =1},
                          {type = 13,value =  669,job =2},
                          {type = 15,value =  2230,job =2},
                          {type = 17,value =  669,job =3},
                          {type = 19,value =  2230,job =3},
                          {type = 5,value =  6244,job =0},
                          {type = 145,value =  1481,job =0},
                      }, 
                },
                --11级
                {                            
                  needXianShui = 0,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 939,job =1},
                          {type = 11,value = 3130,job =1},
                          {type = 13,value =  939,job =2},
                          {type = 15,value =  3130,job =2},
                          {type = 17,value =  939,job =3},
                          {type = 19,value =  3130,job =3},
                          {type = 5,value =  8764,job =0},
                          {type = 145,value =  2215,job =0},
                      }, 
                },
                --12级
                {                            
                  needXianShui = 175,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1002,job =1},
                          {type = 11,value = 3340,job =1},
                          {type = 13,value =  1002,job =2},
                          {type = 15,value =  3340,job =2},
                          {type = 17,value =  1002,job =3},
                          {type = 19,value =  3340,job =3},
                          {type = 5,value =  9352,job =0},
                          {type = 145,value =  2344,job =0},
                      }, 
                },
                --13级
                {                            
                  needXianShui = 190,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1070,job =1},
                          {type = 11,value = 3568,job =1},
                          {type = 13,value =  1070,job =2},
                          {type = 15,value =  3568,job =2},
                          {type = 17,value =  1070,job =3},
                          {type = 19,value =  3568,job =3},
                          {type = 5,value =  9990,job =0},
                          {type = 145,value =  2483,job =0},
                      }, 
                },
                --14级
                {                            
                  needXianShui = 205,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1144,job =1},
                          {type = 11,value = 3814,job =1},
                          {type = 13,value =  1144,job =2},
                          {type = 15,value =  3814,job =2},
                          {type = 17,value =  1144,job =3},
                          {type = 19,value =  3814,job =3},
                          {type = 5,value =  10679,job =0},
                          {type = 145,value =  2634,job =0},
                      }, 
                },
                --15级
                {                            
                  needXianShui = 220,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1223,job =1},
                          {type = 11,value = 4078,job =1},
                          {type = 13,value =  1223,job =2},
                          {type = 15,value =  4078,job =2},
                          {type = 17,value =  1223,job =3},
                          {type = 19,value =  4078,job =3},
                          {type = 5,value =  11418,job =0},
                          {type = 145,value =  2796,job =0},
                      }, 
                },
                --16级
                {                            
                  needXianShui = 235,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1308,job =1},
                          {type = 11,value = 4360,job =1},
                          {type = 13,value =  1308,job =2},
                          {type = 15,value =  4360,job =2},
                          {type = 17,value =  1308,job =3},
                          {type = 19,value =  4360,job =3},
                          {type = 5,value =  12208,job =0},
                          {type = 145,value =  2969,job =0},
                      }, 
                },
                --17级
                {                            
                  needXianShui = 250,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1398,job =1},
                          {type = 11,value = 4660,job =1},
                          {type = 13,value =  1398,job =2},
                          {type = 15,value =  4660,job =2},
                          {type = 17,value =  1398,job =3},
                          {type = 19,value =  4660,job =3},
                          {type = 5,value =  13048,job =0},
                          {type = 145,value =  3152,job =0},
                      }, 
                },
                --18级
                {                            
                  needXianShui = 265,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1493,job =1},
                          {type = 11,value = 4978,job =1},
                          {type = 13,value =  1493,job =2},
                          {type = 15,value =  4978,job =2},
                          {type = 17,value =  1493,job =3},
                          {type = 19,value =  4978,job =3},
                          {type = 5,value =  13938,job =0},
                          {type = 145,value =  3347,job =0},
                      }, 
                },
                --19级
                {                            
                  needXianShui = 280,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1594,job =1},
                          {type = 11,value = 5314,job =1},
                          {type = 13,value =  1594,job =2},
                          {type = 15,value =  5314,job =2},
                          {type = 17,value =  1594,job =3},
                          {type = 19,value =  5314,job =3},
                          {type = 5,value =  14879,job =0},
                          {type = 145,value =  3552,job =0},
                      }, 
                },
                --20级
                {                            
                  needXianShui = 295,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1700,job =1},
                          {type = 11,value = 5668,job =1},
                          {type = 13,value =  1700,job =2},
                          {type = 15,value =  5668,job =2},
                          {type = 17,value =  1700,job =3},
                          {type = 19,value =  5668,job =3},
                          {type = 5,value =  15870,job =0},
                          {type = 145,value =  3768,job =0},
                      }, 
                },
                --21级
                {                            
                  needXianShui = 0,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2105,job =1},
                          {type = 11,value = 7018,job =1},
                          {type = 13,value =  2105,job =2},
                          {type = 15,value =  7018,job =2},
                          {type = 17,value =  2105,job =3},
                          {type = 19,value =  7018,job =3},
                          {type = 5,value =  19650,job =0},
                          {type = 145,value =  4870,job =0},
                      }, 
                },
                --22级
                {                            
                  needXianShui = 315,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2191,job =1},
                          {type = 11,value = 7302,job =1},
                          {type = 13,value =  2191,job =2},
                          {type = 15,value =  7302,job =2},
                          {type = 17,value =  2191,job =3},
                          {type = 19,value =  7302,job =3},
                          {type = 5,value =  20446,job =0},
                          {type = 145,value =  5044,job =0},
                      }, 
                },
                --23级
                {                            
                  needXianShui = 335,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2281,job =1},
                          {type = 11,value = 7604,job =1},
                          {type = 13,value =  2281,job =2},
                          {type = 15,value =  7604,job =2},
                          {type = 17,value =  2281,job =3},
                          {type = 19,value =  7604,job =3},
                          {type = 5,value =  21291,job =0},
                          {type = 145,value =  5229,job =0},
                      }, 
                },
                --24级
                {                            
                  needXianShui = 355,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2377,job =1},
                          {type = 11,value = 7924,job =1},
                          {type = 13,value =  2377,job =2},
                          {type = 15,value =  7924,job =2},
                          {type = 17,value =  2377,job =3},
                          {type = 19,value =  7924,job =3},
                          {type = 5,value =  22187,job =0},
                          {type = 145,value =  5424,job =0},
                      }, 
                },
                --25级
                {                            
                  needXianShui = 375,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2479,job =1},
                          {type = 11,value = 8262,job =1},
                          {type = 13,value =  2479,job =2},
                          {type = 15,value =  8262,job =2},
                          {type = 17,value =  2479,job =3},
                          {type = 19,value =  8262,job =3},
                          {type = 5,value =  23134,job =0},
                          {type = 145,value =  5632,job =0},
                      }, 
                },
                --26级
                {                            
                  needXianShui = 395,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2585,job =1},
                          {type = 11,value = 8618,job =1},
                          {type = 13,value =  2585,job =2},
                          {type = 15,value =  8618,job =2},
                          {type = 17,value =  2585,job =3},
                          {type = 19,value =  8618,job =3},
                          {type = 5,value =  24130,job =0},
                          {type = 145,value =  5849,job =0},
                      }, 
                },
                --27级
                {                            
                  needXianShui = 415,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2698,job =1},
                          {type = 11,value = 8992,job =1},
                          {type = 13,value =  2698,job =2},
                          {type = 15,value =  8992,job =2},
                          {type = 17,value =  2698,job =3},
                          {type = 19,value =  8992,job =3},
                          {type = 5,value =  25178,job =0},
                          {type = 145,value =  6078,job =0},
                      }, 
                },
                --28级
                {                            
                  needXianShui = 435,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2815,job =1},
                          {type = 11,value = 9384,job =1},
                          {type = 13,value =  2815,job =2},
                          {type = 15,value =  9384,job =2},
                          {type = 17,value =  2815,job =3},
                          {type = 19,value =  9384,job =3},
                          {type = 5,value =  26275,job =0},
                          {type = 145,value =  6318,job =0},
                      }, 
                },
                --29级
                {                            
                  needXianShui = 455,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2938,job =1},
                          {type = 11,value = 9794,job =1},
                          {type = 13,value =  2938,job =2},
                          {type = 15,value =  9794,job =2},
                          {type = 17,value =  2938,job =3},
                          {type = 19,value =  9794,job =3},
                          {type = 5,value =  27423,job =0},
                          {type = 145,value =  6569,job =0},
                      }, 
                },
                --30级
                {                            
                  needXianShui = 475,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 3067,job =1},
                          {type = 11,value = 10222,job =1},
                          {type = 13,value =  3067,job =2},
                          {type = 15,value =  10222,job =2},
                          {type = 17,value =  3067,job =3},
                          {type = 19,value =  10222,job =3},
                          {type = 5,value =  28622,job =0},
                          {type = 145,value =  6831,job =0},
                      }, 
                },
                --31级
                {                            
                  needXianShui = 0,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 3715,job =1},
                          {type = 11,value = 12382,job =1},
                          {type = 13,value =  3715,job =2},
                          {type = 15,value =  12382,job =2},
                          {type = 17,value =  3715,job =3},
                          {type = 19,value =  12382,job =3},
                          {type = 5,value =  34670,job =0},
                          {type = 145,value =  8594,job =0},
                      }, 
                },
                --32级
                {                            
                  needXianShui = 500,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 3805,job =1},
                          {type = 11,value = 12682,job =1},
                          {type = 13,value =  3805,job =2},
                          {type = 15,value =  12682,job =2},
                          {type = 17,value =  3805,job =3},
                          {type = 19,value =  12682,job =3},
                          {type = 5,value =  35510,job =0},
                          {type = 145,value =  8778,job =0},
                      }, 
                },
                --33级
                {                            
                  needXianShui = 525,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 3899,job =1},
                          {type = 11,value = 12997,job =1},
                          {type = 13,value =  3899,job =2},
                          {type = 15,value =  12997,job =2},
                          {type = 17,value =  3899,job =3},
                          {type = 19,value =  12997,job =3},
                          {type = 5,value =  36392,job =0},
                          {type = 145,value =  8970,job =0},
                      }, 
                },
                --34级
                {                            
                  needXianShui = 550,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 3998,job =1},
                          {type = 11,value = 13327,job =1},
                          {type = 13,value =  3998,job =2},
                          {type = 15,value =  13327,job =2},
                          {type = 17,value =  3998,job =3},
                          {type = 19,value =  13327,job =3},
                          {type = 5,value =  37316,job =0},
                          {type = 145,value =  9172,job =0},
                      }, 
                },
                --35级
                {                            
                  needXianShui = 575,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 4102,job =1},
                          {type = 11,value = 13672,job =1},
                          {type = 13,value =  4102,job =2},
                          {type = 15,value =  13672,job =2},
                          {type = 17,value =  4102,job =3},
                          {type = 19,value =  13672,job =3},
                          {type = 5,value =  38282,job =0},
                          {type = 145,value =  9383,job =0},
                      }, 
                },
                --36级
                {                            
                  needXianShui = 600,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 4210,job =1},
                          {type = 11,value = 14032,job =1},
                          {type = 13,value =  4210,job =2},
                          {type = 15,value =  14032,job =2},
                          {type = 17,value =  4210,job =3},
                          {type = 19,value =  14032,job =3},
                          {type = 5,value =  39290,job =0},
                          {type = 145,value =  9603,job =0},
                      }, 
                },
                --37级
                {                            
                  needXianShui = 625,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 4322,job =1},
                          {type = 11,value = 14407,job =1},
                          {type = 13,value =  4322,job =2},
                          {type = 15,value =  14407,job =2},
                          {type = 17,value =  4322,job =3},
                          {type = 19,value =  14407,job =3},
                          {type = 5,value =  40340,job =0},
                          {type = 145,value =  9833,job =0},
                      }, 
                },
                --38级
                {                            
                  needXianShui = 650,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 4439,job =1},
                          {type = 11,value = 14797,job =1},
                          {type = 13,value =  4439,job =2},
                          {type = 15,value =  14797,job =2},
                          {type = 17,value =  4439,job =3},
                          {type = 19,value =  14797,job =3},
                          {type = 5,value =  41432,job =0},
                          {type = 145,value =  10071,job =0},
                      }, 
                },
                --39级
                {                            
                  needXianShui = 675,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 4561,job =1},
                          {type = 11,value = 15202,job =1},
                          {type = 13,value =  4561,job =2},
                          {type = 15,value =  15202,job =2},
                          {type = 17,value =  4561,job =3},
                          {type = 19,value =  15202,job =3},
                          {type = 5,value =  42566,job =0},
                          {type = 145,value =  10320,job =0},
                      }, 
                },
                --40级
                {                            
                  needXianShui = 700,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 4687,job =1},
                          {type = 11,value = 15622,job =1},
                          {type = 13,value =  4687,job =2},
                          {type = 15,value =  15622,job =2},
                          {type = 17,value =  4687,job =3},
                          {type = 19,value =  15622,job =3},
                          {type = 5,value =  43742,job =0},
                          {type = 145,value =  10577,job =0},
                      }, 
                },
                --41级
                {                            
                  needXianShui = 0,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 5497,job =1},
                          {type = 11,value = 18322,job =1},
                          {type = 13,value =  5497,job =2},
                          {type = 15,value =  18322,job =2},
                          {type = 17,value =  5497,job =3},
                          {type = 19,value =  18322,job =3},
                          {type = 5,value =  51302,job =0},
                          {type = 145,value =  12780,job =0},
                      }, 
                },
                --42级
                {                            
                  needXianShui = 730,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 5562,job =1},
                          {type = 11,value = 18541,job =1},
                          {type = 13,value =  5562,job =2},
                          {type = 15,value =  18541,job =2},
                          {type = 17,value =  5562,job =3},
                          {type = 19,value =  18541,job =3},
                          {type = 5,value =  51915,job =0},
                          {type = 145,value =  12914,job =0},
                      }, 
                },
                --43级
                {                            
                  needXianShui = 760,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 5631,job =1},
                          {type = 11,value = 18769,job =1},
                          {type = 13,value =  5631,job =2},
                          {type = 15,value =  18769,job =2},
                          {type = 17,value =  5631,job =3},
                          {type = 19,value =  18769,job =3},
                          {type = 5,value =  52553,job =0},
                          {type = 145,value =  13054,job =0},
                      }, 
                },
                --44级
                {                            
                  needXianShui = 790,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 5702,job =1},
                          {type = 11,value = 19006,job =1},
                          {type = 13,value =  5702,job =2},
                          {type = 15,value =  19006,job =2},
                          {type = 17,value =  5702,job =3},
                          {type = 19,value =  19006,job =3},
                          {type = 5,value =  53217,job =0},
                          {type = 145,value =  13198,job =0},
                      }, 
                },
                --45级
                {                            
                  needXianShui = 820,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 5776,job =1},
                          {type = 11,value = 19252,job =1},
                          {type = 13,value =  5776,job =2},
                          {type = 15,value =  19252,job =2},
                          {type = 17,value =  5776,job =3},
                          {type = 19,value =  19252,job =3},
                          {type = 5,value =  53906,job =0},
                          {type = 145,value =  13349,job =0},
                      }, 
                },
                --46级
                {                            
                  needXianShui = 850,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 5852,job =1},
                          {type = 11,value = 19507,job =1},
                          {type = 13,value =  5852,job =2},
                          {type = 15,value =  19507,job =2},
                          {type = 17,value =  5852,job =3},
                          {type = 19,value =  19507,job =3},
                          {type = 5,value =  54620,job =0},
                          {type = 145,value =  13505,job =0},
                      }, 
                },
                --47级
                {                            
                  needXianShui = 880,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 5931,job =1},
                          {type = 11,value = 19771,job =1},
                          {type = 13,value =  5931,job =2},
                          {type = 15,value =  19771,job =2},
                          {type = 17,value =  5931,job =3},
                          {type = 19,value =  19771,job =3},
                          {type = 5,value =  55359,job =0},
                          {type = 145,value =  13666,job =0},
                      }, 
                },
                --48级
                {                            
                  needXianShui = 910,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 6013,job =1},
                          {type = 11,value = 20044,job =1},
                          {type = 13,value =  6013,job =2},
                          {type = 15,value =  20044,job =2},
                          {type = 17,value =  6013,job =3},
                          {type = 19,value =  20044,job =3},
                          {type = 5,value =  56123,job =0},
                          {type = 145,value =  13833,job =0},
                      }, 
                },
                --49级
                {                            
                  needXianShui = 940,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 6098,job =1},
                          {type = 11,value = 20326,job =1},
                          {type = 13,value =  6098,job =2},
                          {type = 15,value =  20326,job =2},
                          {type = 17,value =  6098,job =3},
                          {type = 19,value =  20326,job =3},
                          {type = 5,value =  56913,job =0},
                          {type = 145,value =  14006,job =0},
                      }, 
                },
                --50级
                {                            
                  needXianShui = 970,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 6185,job =1},
                          {type = 11,value = 20617,job =1},
                          {type = 13,value =  6185,job =2},
                          {type = 15,value =  20617,job =2},
                          {type = 17,value =  6185,job =3},
                          {type = 19,value =  20617,job =3},
                          {type = 5,value =  57728,job =0},
                          {type = 145,value =  14184,job =0},
                      }, 
                },

			},
			
		},

        --左戒指
		{
			brokenNeedItem = 7083,
			ShowItem = {7099,7107,7115,7123,7131},
			brokenNeedItemCount = {1,2,5,7,10}, --激活所需，达到2阶所需，到3阶所需，到4阶多需，到5阶所需
			levelUpInfo = 
			{

                --1级
                {                            
                  needXianShui = 0,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 171,job =1},
                          {type = 11,value = 570,job =1},
                          {type = 13,value =  171,job =2},
                          {type = 15,value =  570,job =2},
                          {type = 17,value =  171,job =3},
                          {type = 19,value =  570,job =3},
                          {type = 5,value =  1596,job =0},
                          {type = 145,value =  465,job =0},
                      }, 
                },
                --2级
                {                            
                  needXianShui = 80,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 219,job =1},
                          {type = 11,value = 730,job =1},
                          {type = 13,value =  219,job =2},
                          {type = 15,value =  730,job =2},
                          {type = 17,value =  219,job =3},
                          {type = 19,value =  730,job =3},
                          {type = 5,value =  2044,job =0},
                          {type = 145,value =  563,job =0},
                      }, 
                },
                --3级
                {                            
                  needXianShui = 90,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 260,job =1},
                          {type = 11,value = 865,job =1},
                          {type = 13,value =  260,job =2},
                          {type = 15,value =  865,job =2},
                          {type = 17,value =  260,job =3},
                          {type = 19,value =  865,job =3},
                          {type = 5,value =  2422,job =0},
                          {type = 145,value =  646,job =0},
                      }, 
                },
                --4级
                {                            
                  needXianShui = 100,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 305,job =1},
                          {type = 11,value = 1015,job =1},
                          {type = 13,value =  305,job =2},
                          {type = 15,value =  1015,job =2},
                          {type = 17,value =  305,job =3},
                          {type = 19,value =  1015,job =3},
                          {type = 5,value =  2842,job =0},
                          {type = 145,value =  737,job =0},
                      }, 
                },
                --5级
                {                            
                  needXianShui = 110,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 354,job =1},
                          {type = 11,value = 1180,job =1},
                          {type = 13,value =  354,job =2},
                          {type = 15,value =  1180,job =2},
                          {type = 17,value =  354,job =3},
                          {type = 19,value =  1180,job =3},
                          {type = 5,value =  3304,job =0},
                          {type = 145,value =  839,job =0},
                      }, 
                },
                --6级
                {                            
                  needXianShui = 120,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 408,job =1},
                          {type = 11,value = 1360,job =1},
                          {type = 13,value =  408,job =2},
                          {type = 15,value =  1360,job =2},
                          {type = 17,value =  408,job =3},
                          {type = 19,value =  1360,job =3},
                          {type = 5,value =  3808,job =0},
                          {type = 145,value =  949,job =0},
                      }, 
                },
                --7级
                {                            
                  needXianShui = 130,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 467,job =1},
                          {type = 11,value = 1555,job =1},
                          {type = 13,value =  467,job =2},
                          {type = 15,value =  1555,job =2},
                          {type = 17,value =  467,job =3},
                          {type = 19,value =  1555,job =3},
                          {type = 5,value =  4354,job =0},
                          {type = 145,value =  1068,job =0},
                      }, 
                },
                --8级
                {                            
                  needXianShui = 140,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 530,job =1},
                          {type = 11,value = 1765,job =1},
                          {type = 13,value =  530,job =2},
                          {type = 15,value =  1765,job =2},
                          {type = 17,value =  530,job =3},
                          {type = 19,value =  1765,job =3},
                          {type = 5,value =  4942,job =0},
                          {type = 145,value =  1197,job =0},
                      }, 
                },
                --9级
                {                            
                  needXianShui = 150,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 597,job =1},
                          {type = 11,value = 1990,job =1},
                          {type = 13,value =  597,job =2},
                          {type = 15,value =  1990,job =2},
                          {type = 17,value =  597,job =3},
                          {type = 19,value =  1990,job =3},
                          {type = 5,value =  5572,job =0},
                          {type = 145,value =  1334,job =0},
                      }, 
                },
                --10级
                {                            
                  needXianShui = 160,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 669,job =1},
                          {type = 11,value = 2230,job =1},
                          {type = 13,value =  669,job =2},
                          {type = 15,value =  2230,job =2},
                          {type = 17,value =  669,job =3},
                          {type = 19,value =  2230,job =3},
                          {type = 5,value =  6244,job =0},
                          {type = 145,value =  1481,job =0},
                      }, 
                },
                --11级
                {                            
                  needXianShui = 0,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 939,job =1},
                          {type = 11,value = 3130,job =1},
                          {type = 13,value =  939,job =2},
                          {type = 15,value =  3130,job =2},
                          {type = 17,value =  939,job =3},
                          {type = 19,value =  3130,job =3},
                          {type = 5,value =  8764,job =0},
                          {type = 145,value =  2215,job =0},
                      }, 
                },
                --12级
                {                            
                  needXianShui = 175,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1002,job =1},
                          {type = 11,value = 3340,job =1},
                          {type = 13,value =  1002,job =2},
                          {type = 15,value =  3340,job =2},
                          {type = 17,value =  1002,job =3},
                          {type = 19,value =  3340,job =3},
                          {type = 5,value =  9352,job =0},
                          {type = 145,value =  2344,job =0},
                      }, 
                },
                --13级
                {                            
                  needXianShui = 190,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1070,job =1},
                          {type = 11,value = 3568,job =1},
                          {type = 13,value =  1070,job =2},
                          {type = 15,value =  3568,job =2},
                          {type = 17,value =  1070,job =3},
                          {type = 19,value =  3568,job =3},
                          {type = 5,value =  9990,job =0},
                          {type = 145,value =  2483,job =0},
                      }, 
                },
                --14级
                {                            
                  needXianShui = 205,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1144,job =1},
                          {type = 11,value = 3814,job =1},
                          {type = 13,value =  1144,job =2},
                          {type = 15,value =  3814,job =2},
                          {type = 17,value =  1144,job =3},
                          {type = 19,value =  3814,job =3},
                          {type = 5,value =  10679,job =0},
                          {type = 145,value =  2634,job =0},
                      }, 
                },
                --15级
                {                            
                  needXianShui = 220,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1223,job =1},
                          {type = 11,value = 4078,job =1},
                          {type = 13,value =  1223,job =2},
                          {type = 15,value =  4078,job =2},
                          {type = 17,value =  1223,job =3},
                          {type = 19,value =  4078,job =3},
                          {type = 5,value =  11418,job =0},
                          {type = 145,value =  2796,job =0},
                      }, 
                },
                --16级
                {                            
                  needXianShui = 235,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1308,job =1},
                          {type = 11,value = 4360,job =1},
                          {type = 13,value =  1308,job =2},
                          {type = 15,value =  4360,job =2},
                          {type = 17,value =  1308,job =3},
                          {type = 19,value =  4360,job =3},
                          {type = 5,value =  12208,job =0},
                          {type = 145,value =  2969,job =0},
                      }, 
                },
                --17级
                {                            
                  needXianShui = 250,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1398,job =1},
                          {type = 11,value = 4660,job =1},
                          {type = 13,value =  1398,job =2},
                          {type = 15,value =  4660,job =2},
                          {type = 17,value =  1398,job =3},
                          {type = 19,value =  4660,job =3},
                          {type = 5,value =  13048,job =0},
                          {type = 145,value =  3152,job =0},
                      }, 
                },
                --18级
                {                            
                  needXianShui = 265,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1493,job =1},
                          {type = 11,value = 4978,job =1},
                          {type = 13,value =  1493,job =2},
                          {type = 15,value =  4978,job =2},
                          {type = 17,value =  1493,job =3},
                          {type = 19,value =  4978,job =3},
                          {type = 5,value =  13938,job =0},
                          {type = 145,value =  3347,job =0},
                      }, 
                },
                --19级
                {                            
                  needXianShui = 280,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1594,job =1},
                          {type = 11,value = 5314,job =1},
                          {type = 13,value =  1594,job =2},
                          {type = 15,value =  5314,job =2},
                          {type = 17,value =  1594,job =3},
                          {type = 19,value =  5314,job =3},
                          {type = 5,value =  14879,job =0},
                          {type = 145,value =  3552,job =0},
                      }, 
                },
                --20级
                {                            
                  needXianShui = 295,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1700,job =1},
                          {type = 11,value = 5668,job =1},
                          {type = 13,value =  1700,job =2},
                          {type = 15,value =  5668,job =2},
                          {type = 17,value =  1700,job =3},
                          {type = 19,value =  5668,job =3},
                          {type = 5,value =  15870,job =0},
                          {type = 145,value =  3768,job =0},
                      }, 
                },
                --21级
                {                            
                  needXianShui = 0,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2105,job =1},
                          {type = 11,value = 7018,job =1},
                          {type = 13,value =  2105,job =2},
                          {type = 15,value =  7018,job =2},
                          {type = 17,value =  2105,job =3},
                          {type = 19,value =  7018,job =3},
                          {type = 5,value =  19650,job =0},
                          {type = 145,value =  4870,job =0},
                      }, 
                },
                --22级
                {                            
                  needXianShui = 315,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2191,job =1},
                          {type = 11,value = 7302,job =1},
                          {type = 13,value =  2191,job =2},
                          {type = 15,value =  7302,job =2},
                          {type = 17,value =  2191,job =3},
                          {type = 19,value =  7302,job =3},
                          {type = 5,value =  20446,job =0},
                          {type = 145,value =  5044,job =0},
                      }, 
                },
                --23级
                {                            
                  needXianShui = 335,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2281,job =1},
                          {type = 11,value = 7604,job =1},
                          {type = 13,value =  2281,job =2},
                          {type = 15,value =  7604,job =2},
                          {type = 17,value =  2281,job =3},
                          {type = 19,value =  7604,job =3},
                          {type = 5,value =  21291,job =0},
                          {type = 145,value =  5229,job =0},
                      }, 
                },
                --24级
                {                            
                  needXianShui = 355,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2377,job =1},
                          {type = 11,value = 7924,job =1},
                          {type = 13,value =  2377,job =2},
                          {type = 15,value =  7924,job =2},
                          {type = 17,value =  2377,job =3},
                          {type = 19,value =  7924,job =3},
                          {type = 5,value =  22187,job =0},
                          {type = 145,value =  5424,job =0},
                      }, 
                },
                --25级
                {                            
                  needXianShui = 375,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2479,job =1},
                          {type = 11,value = 8262,job =1},
                          {type = 13,value =  2479,job =2},
                          {type = 15,value =  8262,job =2},
                          {type = 17,value =  2479,job =3},
                          {type = 19,value =  8262,job =3},
                          {type = 5,value =  23134,job =0},
                          {type = 145,value =  5632,job =0},
                      }, 
                },
                --26级
                {                            
                  needXianShui = 395,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2585,job =1},
                          {type = 11,value = 8618,job =1},
                          {type = 13,value =  2585,job =2},
                          {type = 15,value =  8618,job =2},
                          {type = 17,value =  2585,job =3},
                          {type = 19,value =  8618,job =3},
                          {type = 5,value =  24130,job =0},
                          {type = 145,value =  5849,job =0},
                      }, 
                },
                --27级
                {                            
                  needXianShui = 415,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2698,job =1},
                          {type = 11,value = 8992,job =1},
                          {type = 13,value =  2698,job =2},
                          {type = 15,value =  8992,job =2},
                          {type = 17,value =  2698,job =3},
                          {type = 19,value =  8992,job =3},
                          {type = 5,value =  25178,job =0},
                          {type = 145,value =  6078,job =0},
                      }, 
                },
                --28级
                {                            
                  needXianShui = 435,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2815,job =1},
                          {type = 11,value = 9384,job =1},
                          {type = 13,value =  2815,job =2},
                          {type = 15,value =  9384,job =2},
                          {type = 17,value =  2815,job =3},
                          {type = 19,value =  9384,job =3},
                          {type = 5,value =  26275,job =0},
                          {type = 145,value =  6318,job =0},
                      }, 
                },
                --29级
                {                            
                  needXianShui = 455,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2938,job =1},
                          {type = 11,value = 9794,job =1},
                          {type = 13,value =  2938,job =2},
                          {type = 15,value =  9794,job =2},
                          {type = 17,value =  2938,job =3},
                          {type = 19,value =  9794,job =3},
                          {type = 5,value =  27423,job =0},
                          {type = 145,value =  6569,job =0},
                      }, 
                },
                --30级
                {                            
                  needXianShui = 475,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 3067,job =1},
                          {type = 11,value = 10222,job =1},
                          {type = 13,value =  3067,job =2},
                          {type = 15,value =  10222,job =2},
                          {type = 17,value =  3067,job =3},
                          {type = 19,value =  10222,job =3},
                          {type = 5,value =  28622,job =0},
                          {type = 145,value =  6831,job =0},
                      }, 
                },
                --31级
                {                            
                  needXianShui = 0,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 3715,job =1},
                          {type = 11,value = 12382,job =1},
                          {type = 13,value =  3715,job =2},
                          {type = 15,value =  12382,job =2},
                          {type = 17,value =  3715,job =3},
                          {type = 19,value =  12382,job =3},
                          {type = 5,value =  34670,job =0},
                          {type = 145,value =  8594,job =0},
                      }, 
                },
                --32级
                {                            
                  needXianShui = 500,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 3805,job =1},
                          {type = 11,value = 12682,job =1},
                          {type = 13,value =  3805,job =2},
                          {type = 15,value =  12682,job =2},
                          {type = 17,value =  3805,job =3},
                          {type = 19,value =  12682,job =3},
                          {type = 5,value =  35510,job =0},
                          {type = 145,value =  8778,job =0},
                      }, 
                },
                --33级
                {                            
                  needXianShui = 525,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 3899,job =1},
                          {type = 11,value = 12997,job =1},
                          {type = 13,value =  3899,job =2},
                          {type = 15,value =  12997,job =2},
                          {type = 17,value =  3899,job =3},
                          {type = 19,value =  12997,job =3},
                          {type = 5,value =  36392,job =0},
                          {type = 145,value =  8970,job =0},
                      }, 
                },
                --34级
                {                            
                  needXianShui = 550,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 3998,job =1},
                          {type = 11,value = 13327,job =1},
                          {type = 13,value =  3998,job =2},
                          {type = 15,value =  13327,job =2},
                          {type = 17,value =  3998,job =3},
                          {type = 19,value =  13327,job =3},
                          {type = 5,value =  37316,job =0},
                          {type = 145,value =  9172,job =0},
                      }, 
                },
                --35级
                {                            
                  needXianShui = 575,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 4102,job =1},
                          {type = 11,value = 13672,job =1},
                          {type = 13,value =  4102,job =2},
                          {type = 15,value =  13672,job =2},
                          {type = 17,value =  4102,job =3},
                          {type = 19,value =  13672,job =3},
                          {type = 5,value =  38282,job =0},
                          {type = 145,value =  9383,job =0},
                      }, 
                },
                --36级
                {                            
                  needXianShui = 600,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 4210,job =1},
                          {type = 11,value = 14032,job =1},
                          {type = 13,value =  4210,job =2},
                          {type = 15,value =  14032,job =2},
                          {type = 17,value =  4210,job =3},
                          {type = 19,value =  14032,job =3},
                          {type = 5,value =  39290,job =0},
                          {type = 145,value =  9603,job =0},
                      }, 
                },
                --37级
                {                            
                  needXianShui = 625,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 4322,job =1},
                          {type = 11,value = 14407,job =1},
                          {type = 13,value =  4322,job =2},
                          {type = 15,value =  14407,job =2},
                          {type = 17,value =  4322,job =3},
                          {type = 19,value =  14407,job =3},
                          {type = 5,value =  40340,job =0},
                          {type = 145,value =  9833,job =0},
                      }, 
                },
                --38级
                {                            
                  needXianShui = 650,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 4439,job =1},
                          {type = 11,value = 14797,job =1},
                          {type = 13,value =  4439,job =2},
                          {type = 15,value =  14797,job =2},
                          {type = 17,value =  4439,job =3},
                          {type = 19,value =  14797,job =3},
                          {type = 5,value =  41432,job =0},
                          {type = 145,value =  10071,job =0},
                      }, 
                },
                --39级
                {                            
                  needXianShui = 675,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 4561,job =1},
                          {type = 11,value = 15202,job =1},
                          {type = 13,value =  4561,job =2},
                          {type = 15,value =  15202,job =2},
                          {type = 17,value =  4561,job =3},
                          {type = 19,value =  15202,job =3},
                          {type = 5,value =  42566,job =0},
                          {type = 145,value =  10320,job =0},
                      }, 
                },
                --40级
                {                            
                  needXianShui = 700,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 4687,job =1},
                          {type = 11,value = 15622,job =1},
                          {type = 13,value =  4687,job =2},
                          {type = 15,value =  15622,job =2},
                          {type = 17,value =  4687,job =3},
                          {type = 19,value =  15622,job =3},
                          {type = 5,value =  43742,job =0},
                          {type = 145,value =  10577,job =0},
                      }, 
                },
                --41级
                {                            
                  needXianShui = 0,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 5497,job =1},
                          {type = 11,value = 18322,job =1},
                          {type = 13,value =  5497,job =2},
                          {type = 15,value =  18322,job =2},
                          {type = 17,value =  5497,job =3},
                          {type = 19,value =  18322,job =3},
                          {type = 5,value =  51302,job =0},
                          {type = 145,value =  12780,job =0},
                      }, 
                },
                --42级
                {                            
                  needXianShui = 730,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 5562,job =1},
                          {type = 11,value = 18541,job =1},
                          {type = 13,value =  5562,job =2},
                          {type = 15,value =  18541,job =2},
                          {type = 17,value =  5562,job =3},
                          {type = 19,value =  18541,job =3},
                          {type = 5,value =  51915,job =0},
                          {type = 145,value =  12914,job =0},
                      }, 
                },
                --43级
                {                            
                  needXianShui = 760,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 5631,job =1},
                          {type = 11,value = 18769,job =1},
                          {type = 13,value =  5631,job =2},
                          {type = 15,value =  18769,job =2},
                          {type = 17,value =  5631,job =3},
                          {type = 19,value =  18769,job =3},
                          {type = 5,value =  52553,job =0},
                          {type = 145,value =  13054,job =0},
                      }, 
                },
                --44级
                {                            
                  needXianShui = 790,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 5702,job =1},
                          {type = 11,value = 19006,job =1},
                          {type = 13,value =  5702,job =2},
                          {type = 15,value =  19006,job =2},
                          {type = 17,value =  5702,job =3},
                          {type = 19,value =  19006,job =3},
                          {type = 5,value =  53217,job =0},
                          {type = 145,value =  13198,job =0},
                      }, 
                },
                --45级
                {                            
                  needXianShui = 820,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 5776,job =1},
                          {type = 11,value = 19252,job =1},
                          {type = 13,value =  5776,job =2},
                          {type = 15,value =  19252,job =2},
                          {type = 17,value =  5776,job =3},
                          {type = 19,value =  19252,job =3},
                          {type = 5,value =  53906,job =0},
                          {type = 145,value =  13349,job =0},
                      }, 
                },
                --46级
                {                            
                  needXianShui = 850,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 5852,job =1},
                          {type = 11,value = 19507,job =1},
                          {type = 13,value =  5852,job =2},
                          {type = 15,value =  19507,job =2},
                          {type = 17,value =  5852,job =3},
                          {type = 19,value =  19507,job =3},
                          {type = 5,value =  54620,job =0},
                          {type = 145,value =  13505,job =0},
                      }, 
                },
                --47级
                {                            
                  needXianShui = 880,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 5931,job =1},
                          {type = 11,value = 19771,job =1},
                          {type = 13,value =  5931,job =2},
                          {type = 15,value =  19771,job =2},
                          {type = 17,value =  5931,job =3},
                          {type = 19,value =  19771,job =3},
                          {type = 5,value =  55359,job =0},
                          {type = 145,value =  13666,job =0},
                      }, 
                },
                --48级
                {                            
                  needXianShui = 910,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 6013,job =1},
                          {type = 11,value = 20044,job =1},
                          {type = 13,value =  6013,job =2},
                          {type = 15,value =  20044,job =2},
                          {type = 17,value =  6013,job =3},
                          {type = 19,value =  20044,job =3},
                          {type = 5,value =  56123,job =0},
                          {type = 145,value =  13833,job =0},
                      }, 
                },
                --49级
                {                            
                  needXianShui = 940,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 6098,job =1},
                          {type = 11,value = 20326,job =1},
                          {type = 13,value =  6098,job =2},
                          {type = 15,value =  20326,job =2},
                          {type = 17,value =  6098,job =3},
                          {type = 19,value =  20326,job =3},
                          {type = 5,value =  56913,job =0},
                          {type = 145,value =  14006,job =0},
                      }, 
                },
                --50级
                {                            
                  needXianShui = 970,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 6185,job =1},
                          {type = 11,value = 20617,job =1},
                          {type = 13,value =  6185,job =2},
                          {type = 15,value =  20617,job =2},
                          {type = 17,value =  6185,job =3},
                          {type = 19,value =  20617,job =3},
                          {type = 5,value =  57728,job =0},
                          {type = 145,value =  14184,job =0},
                      }, 
                },

			},
			
		},

        --右戒指
		{
			brokenNeedItem = 7083,
			ShowItem = {7099,7107,7115,7123,7131},
			brokenNeedItemCount = {1,2,5,7,10}, --激活所需，达到2阶所需，到3阶所需，到4阶多需，到5阶所需
			levelUpInfo = 
			{

                --1级
                {                            
                  needXianShui = 0,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 171,job =1},
                          {type = 11,value = 570,job =1},
                          {type = 13,value =  171,job =2},
                          {type = 15,value =  570,job =2},
                          {type = 17,value =  171,job =3},
                          {type = 19,value =  570,job =3},
                          {type = 5,value =  1596,job =0},
                          {type = 145,value =  465,job =0},
                      }, 
                },
                --2级
                {                            
                  needXianShui = 80,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 219,job =1},
                          {type = 11,value = 730,job =1},
                          {type = 13,value =  219,job =2},
                          {type = 15,value =  730,job =2},
                          {type = 17,value =  219,job =3},
                          {type = 19,value =  730,job =3},
                          {type = 5,value =  2044,job =0},
                          {type = 145,value =  563,job =0},
                      }, 
                },
                --3级
                {                            
                  needXianShui = 90,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 260,job =1},
                          {type = 11,value = 865,job =1},
                          {type = 13,value =  260,job =2},
                          {type = 15,value =  865,job =2},
                          {type = 17,value =  260,job =3},
                          {type = 19,value =  865,job =3},
                          {type = 5,value =  2422,job =0},
                          {type = 145,value =  646,job =0},
                      }, 
                },
                --4级
                {                            
                  needXianShui = 100,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 305,job =1},
                          {type = 11,value = 1015,job =1},
                          {type = 13,value =  305,job =2},
                          {type = 15,value =  1015,job =2},
                          {type = 17,value =  305,job =3},
                          {type = 19,value =  1015,job =3},
                          {type = 5,value =  2842,job =0},
                          {type = 145,value =  737,job =0},
                      }, 
                },
                --5级
                {                            
                  needXianShui = 110,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 354,job =1},
                          {type = 11,value = 1180,job =1},
                          {type = 13,value =  354,job =2},
                          {type = 15,value =  1180,job =2},
                          {type = 17,value =  354,job =3},
                          {type = 19,value =  1180,job =3},
                          {type = 5,value =  3304,job =0},
                          {type = 145,value =  839,job =0},
                      }, 
                },
                --6级
                {                            
                  needXianShui = 120,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 408,job =1},
                          {type = 11,value = 1360,job =1},
                          {type = 13,value =  408,job =2},
                          {type = 15,value =  1360,job =2},
                          {type = 17,value =  408,job =3},
                          {type = 19,value =  1360,job =3},
                          {type = 5,value =  3808,job =0},
                          {type = 145,value =  949,job =0},
                      }, 
                },
                --7级
                {                            
                  needXianShui = 130,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 467,job =1},
                          {type = 11,value = 1555,job =1},
                          {type = 13,value =  467,job =2},
                          {type = 15,value =  1555,job =2},
                          {type = 17,value =  467,job =3},
                          {type = 19,value =  1555,job =3},
                          {type = 5,value =  4354,job =0},
                          {type = 145,value =  1068,job =0},
                      }, 
                },
                --8级
                {                            
                  needXianShui = 140,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 530,job =1},
                          {type = 11,value = 1765,job =1},
                          {type = 13,value =  530,job =2},
                          {type = 15,value =  1765,job =2},
                          {type = 17,value =  530,job =3},
                          {type = 19,value =  1765,job =3},
                          {type = 5,value =  4942,job =0},
                          {type = 145,value =  1197,job =0},
                      }, 
                },
                --9级
                {                            
                  needXianShui = 150,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 597,job =1},
                          {type = 11,value = 1990,job =1},
                          {type = 13,value =  597,job =2},
                          {type = 15,value =  1990,job =2},
                          {type = 17,value =  597,job =3},
                          {type = 19,value =  1990,job =3},
                          {type = 5,value =  5572,job =0},
                          {type = 145,value =  1334,job =0},
                      }, 
                },
                --10级
                {                            
                  needXianShui = 160,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 669,job =1},
                          {type = 11,value = 2230,job =1},
                          {type = 13,value =  669,job =2},
                          {type = 15,value =  2230,job =2},
                          {type = 17,value =  669,job =3},
                          {type = 19,value =  2230,job =3},
                          {type = 5,value =  6244,job =0},
                          {type = 145,value =  1481,job =0},
                      }, 
                },
                --11级
                {                            
                  needXianShui = 0,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 939,job =1},
                          {type = 11,value = 3130,job =1},
                          {type = 13,value =  939,job =2},
                          {type = 15,value =  3130,job =2},
                          {type = 17,value =  939,job =3},
                          {type = 19,value =  3130,job =3},
                          {type = 5,value =  8764,job =0},
                          {type = 145,value =  2215,job =0},
                      }, 
                },
                --12级
                {                            
                  needXianShui = 175,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1002,job =1},
                          {type = 11,value = 3340,job =1},
                          {type = 13,value =  1002,job =2},
                          {type = 15,value =  3340,job =2},
                          {type = 17,value =  1002,job =3},
                          {type = 19,value =  3340,job =3},
                          {type = 5,value =  9352,job =0},
                          {type = 145,value =  2344,job =0},
                      }, 
                },
                --13级
                {                            
                  needXianShui = 190,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1070,job =1},
                          {type = 11,value = 3568,job =1},
                          {type = 13,value =  1070,job =2},
                          {type = 15,value =  3568,job =2},
                          {type = 17,value =  1070,job =3},
                          {type = 19,value =  3568,job =3},
                          {type = 5,value =  9990,job =0},
                          {type = 145,value =  2483,job =0},
                      }, 
                },
                --14级
                {                            
                  needXianShui = 205,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1144,job =1},
                          {type = 11,value = 3814,job =1},
                          {type = 13,value =  1144,job =2},
                          {type = 15,value =  3814,job =2},
                          {type = 17,value =  1144,job =3},
                          {type = 19,value =  3814,job =3},
                          {type = 5,value =  10679,job =0},
                          {type = 145,value =  2634,job =0},
                      }, 
                },
                --15级
                {                            
                  needXianShui = 220,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1223,job =1},
                          {type = 11,value = 4078,job =1},
                          {type = 13,value =  1223,job =2},
                          {type = 15,value =  4078,job =2},
                          {type = 17,value =  1223,job =3},
                          {type = 19,value =  4078,job =3},
                          {type = 5,value =  11418,job =0},
                          {type = 145,value =  2796,job =0},
                      }, 
                },
                --16级
                {                            
                  needXianShui = 235,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1308,job =1},
                          {type = 11,value = 4360,job =1},
                          {type = 13,value =  1308,job =2},
                          {type = 15,value =  4360,job =2},
                          {type = 17,value =  1308,job =3},
                          {type = 19,value =  4360,job =3},
                          {type = 5,value =  12208,job =0},
                          {type = 145,value =  2969,job =0},
                      }, 
                },
                --17级
                {                            
                  needXianShui = 250,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1398,job =1},
                          {type = 11,value = 4660,job =1},
                          {type = 13,value =  1398,job =2},
                          {type = 15,value =  4660,job =2},
                          {type = 17,value =  1398,job =3},
                          {type = 19,value =  4660,job =3},
                          {type = 5,value =  13048,job =0},
                          {type = 145,value =  3152,job =0},
                      }, 
                },
                --18级
                {                            
                  needXianShui = 265,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1493,job =1},
                          {type = 11,value = 4978,job =1},
                          {type = 13,value =  1493,job =2},
                          {type = 15,value =  4978,job =2},
                          {type = 17,value =  1493,job =3},
                          {type = 19,value =  4978,job =3},
                          {type = 5,value =  13938,job =0},
                          {type = 145,value =  3347,job =0},
                      }, 
                },
                --19级
                {                            
                  needXianShui = 280,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1594,job =1},
                          {type = 11,value = 5314,job =1},
                          {type = 13,value =  1594,job =2},
                          {type = 15,value =  5314,job =2},
                          {type = 17,value =  1594,job =3},
                          {type = 19,value =  5314,job =3},
                          {type = 5,value =  14879,job =0},
                          {type = 145,value =  3552,job =0},
                      }, 
                },
                --20级
                {                            
                  needXianShui = 295,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1700,job =1},
                          {type = 11,value = 5668,job =1},
                          {type = 13,value =  1700,job =2},
                          {type = 15,value =  5668,job =2},
                          {type = 17,value =  1700,job =3},
                          {type = 19,value =  5668,job =3},
                          {type = 5,value =  15870,job =0},
                          {type = 145,value =  3768,job =0},
                      }, 
                },
                --21级
                {                            
                  needXianShui = 0,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2105,job =1},
                          {type = 11,value = 7018,job =1},
                          {type = 13,value =  2105,job =2},
                          {type = 15,value =  7018,job =2},
                          {type = 17,value =  2105,job =3},
                          {type = 19,value =  7018,job =3},
                          {type = 5,value =  19650,job =0},
                          {type = 145,value =  4870,job =0},
                      }, 
                },
                --22级
                {                            
                  needXianShui = 315,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2191,job =1},
                          {type = 11,value = 7302,job =1},
                          {type = 13,value =  2191,job =2},
                          {type = 15,value =  7302,job =2},
                          {type = 17,value =  2191,job =3},
                          {type = 19,value =  7302,job =3},
                          {type = 5,value =  20446,job =0},
                          {type = 145,value =  5044,job =0},
                      }, 
                },
                --23级
                {                            
                  needXianShui = 335,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2281,job =1},
                          {type = 11,value = 7604,job =1},
                          {type = 13,value =  2281,job =2},
                          {type = 15,value =  7604,job =2},
                          {type = 17,value =  2281,job =3},
                          {type = 19,value =  7604,job =3},
                          {type = 5,value =  21291,job =0},
                          {type = 145,value =  5229,job =0},
                      }, 
                },
                --24级
                {                            
                  needXianShui = 355,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2377,job =1},
                          {type = 11,value = 7924,job =1},
                          {type = 13,value =  2377,job =2},
                          {type = 15,value =  7924,job =2},
                          {type = 17,value =  2377,job =3},
                          {type = 19,value =  7924,job =3},
                          {type = 5,value =  22187,job =0},
                          {type = 145,value =  5424,job =0},
                      }, 
                },
                --25级
                {                            
                  needXianShui = 375,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2479,job =1},
                          {type = 11,value = 8262,job =1},
                          {type = 13,value =  2479,job =2},
                          {type = 15,value =  8262,job =2},
                          {type = 17,value =  2479,job =3},
                          {type = 19,value =  8262,job =3},
                          {type = 5,value =  23134,job =0},
                          {type = 145,value =  5632,job =0},
                      }, 
                },
                --26级
                {                            
                  needXianShui = 395,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2585,job =1},
                          {type = 11,value = 8618,job =1},
                          {type = 13,value =  2585,job =2},
                          {type = 15,value =  8618,job =2},
                          {type = 17,value =  2585,job =3},
                          {type = 19,value =  8618,job =3},
                          {type = 5,value =  24130,job =0},
                          {type = 145,value =  5849,job =0},
                      }, 
                },
                --27级
                {                            
                  needXianShui = 415,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2698,job =1},
                          {type = 11,value = 8992,job =1},
                          {type = 13,value =  2698,job =2},
                          {type = 15,value =  8992,job =2},
                          {type = 17,value =  2698,job =3},
                          {type = 19,value =  8992,job =3},
                          {type = 5,value =  25178,job =0},
                          {type = 145,value =  6078,job =0},
                      }, 
                },
                --28级
                {                            
                  needXianShui = 435,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2815,job =1},
                          {type = 11,value = 9384,job =1},
                          {type = 13,value =  2815,job =2},
                          {type = 15,value =  9384,job =2},
                          {type = 17,value =  2815,job =3},
                          {type = 19,value =  9384,job =3},
                          {type = 5,value =  26275,job =0},
                          {type = 145,value =  6318,job =0},
                      }, 
                },
                --29级
                {                            
                  needXianShui = 455,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2938,job =1},
                          {type = 11,value = 9794,job =1},
                          {type = 13,value =  2938,job =2},
                          {type = 15,value =  9794,job =2},
                          {type = 17,value =  2938,job =3},
                          {type = 19,value =  9794,job =3},
                          {type = 5,value =  27423,job =0},
                          {type = 145,value =  6569,job =0},
                      }, 
                },
                --30级
                {                            
                  needXianShui = 475,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 3067,job =1},
                          {type = 11,value = 10222,job =1},
                          {type = 13,value =  3067,job =2},
                          {type = 15,value =  10222,job =2},
                          {type = 17,value =  3067,job =3},
                          {type = 19,value =  10222,job =3},
                          {type = 5,value =  28622,job =0},
                          {type = 145,value =  6831,job =0},
                      }, 
                },
                --31级
                {                            
                  needXianShui = 0,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 3715,job =1},
                          {type = 11,value = 12382,job =1},
                          {type = 13,value =  3715,job =2},
                          {type = 15,value =  12382,job =2},
                          {type = 17,value =  3715,job =3},
                          {type = 19,value =  12382,job =3},
                          {type = 5,value =  34670,job =0},
                          {type = 145,value =  8594,job =0},
                      }, 
                },
                --32级
                {                            
                  needXianShui = 500,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 3805,job =1},
                          {type = 11,value = 12682,job =1},
                          {type = 13,value =  3805,job =2},
                          {type = 15,value =  12682,job =2},
                          {type = 17,value =  3805,job =3},
                          {type = 19,value =  12682,job =3},
                          {type = 5,value =  35510,job =0},
                          {type = 145,value =  8778,job =0},
                      }, 
                },
                --33级
                {                            
                  needXianShui = 525,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 3899,job =1},
                          {type = 11,value = 12997,job =1},
                          {type = 13,value =  3899,job =2},
                          {type = 15,value =  12997,job =2},
                          {type = 17,value =  3899,job =3},
                          {type = 19,value =  12997,job =3},
                          {type = 5,value =  36392,job =0},
                          {type = 145,value =  8970,job =0},
                      }, 
                },
                --34级
                {                            
                  needXianShui = 550,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 3998,job =1},
                          {type = 11,value = 13327,job =1},
                          {type = 13,value =  3998,job =2},
                          {type = 15,value =  13327,job =2},
                          {type = 17,value =  3998,job =3},
                          {type = 19,value =  13327,job =3},
                          {type = 5,value =  37316,job =0},
                          {type = 145,value =  9172,job =0},
                      }, 
                },
                --35级
                {                            
                  needXianShui = 575,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 4102,job =1},
                          {type = 11,value = 13672,job =1},
                          {type = 13,value =  4102,job =2},
                          {type = 15,value =  13672,job =2},
                          {type = 17,value =  4102,job =3},
                          {type = 19,value =  13672,job =3},
                          {type = 5,value =  38282,job =0},
                          {type = 145,value =  9383,job =0},
                      }, 
                },
                --36级
                {                            
                  needXianShui = 600,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 4210,job =1},
                          {type = 11,value = 14032,job =1},
                          {type = 13,value =  4210,job =2},
                          {type = 15,value =  14032,job =2},
                          {type = 17,value =  4210,job =3},
                          {type = 19,value =  14032,job =3},
                          {type = 5,value =  39290,job =0},
                          {type = 145,value =  9603,job =0},
                      }, 
                },
                --37级
                {                            
                  needXianShui = 625,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 4322,job =1},
                          {type = 11,value = 14407,job =1},
                          {type = 13,value =  4322,job =2},
                          {type = 15,value =  14407,job =2},
                          {type = 17,value =  4322,job =3},
                          {type = 19,value =  14407,job =3},
                          {type = 5,value =  40340,job =0},
                          {type = 145,value =  9833,job =0},
                      }, 
                },
                --38级
                {                            
                  needXianShui = 650,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 4439,job =1},
                          {type = 11,value = 14797,job =1},
                          {type = 13,value =  4439,job =2},
                          {type = 15,value =  14797,job =2},
                          {type = 17,value =  4439,job =3},
                          {type = 19,value =  14797,job =3},
                          {type = 5,value =  41432,job =0},
                          {type = 145,value =  10071,job =0},
                      }, 
                },
                --39级
                {                            
                  needXianShui = 675,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 4561,job =1},
                          {type = 11,value = 15202,job =1},
                          {type = 13,value =  4561,job =2},
                          {type = 15,value =  15202,job =2},
                          {type = 17,value =  4561,job =3},
                          {type = 19,value =  15202,job =3},
                          {type = 5,value =  42566,job =0},
                          {type = 145,value =  10320,job =0},
                      }, 
                },
                --40级
                {                            
                  needXianShui = 700,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 4687,job =1},
                          {type = 11,value = 15622,job =1},
                          {type = 13,value =  4687,job =2},
                          {type = 15,value =  15622,job =2},
                          {type = 17,value =  4687,job =3},
                          {type = 19,value =  15622,job =3},
                          {type = 5,value =  43742,job =0},
                          {type = 145,value =  10577,job =0},
                      }, 
                },
                --41级
                {                            
                  needXianShui = 0,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 5497,job =1},
                          {type = 11,value = 18322,job =1},
                          {type = 13,value =  5497,job =2},
                          {type = 15,value =  18322,job =2},
                          {type = 17,value =  5497,job =3},
                          {type = 19,value =  18322,job =3},
                          {type = 5,value =  51302,job =0},
                          {type = 145,value =  12780,job =0},
                      }, 
                },
                --42级
                {                            
                  needXianShui = 730,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 5562,job =1},
                          {type = 11,value = 18541,job =1},
                          {type = 13,value =  5562,job =2},
                          {type = 15,value =  18541,job =2},
                          {type = 17,value =  5562,job =3},
                          {type = 19,value =  18541,job =3},
                          {type = 5,value =  51915,job =0},
                          {type = 145,value =  12914,job =0},
                      }, 
                },
                --43级
                {                            
                  needXianShui = 760,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 5631,job =1},
                          {type = 11,value = 18769,job =1},
                          {type = 13,value =  5631,job =2},
                          {type = 15,value =  18769,job =2},
                          {type = 17,value =  5631,job =3},
                          {type = 19,value =  18769,job =3},
                          {type = 5,value =  52553,job =0},
                          {type = 145,value =  13054,job =0},
                      }, 
                },
                --44级
                {                            
                  needXianShui = 790,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 5702,job =1},
                          {type = 11,value = 19006,job =1},
                          {type = 13,value =  5702,job =2},
                          {type = 15,value =  19006,job =2},
                          {type = 17,value =  5702,job =3},
                          {type = 19,value =  19006,job =3},
                          {type = 5,value =  53217,job =0},
                          {type = 145,value =  13198,job =0},
                      }, 
                },
                --45级
                {                            
                  needXianShui = 820,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 5776,job =1},
                          {type = 11,value = 19252,job =1},
                          {type = 13,value =  5776,job =2},
                          {type = 15,value =  19252,job =2},
                          {type = 17,value =  5776,job =3},
                          {type = 19,value =  19252,job =3},
                          {type = 5,value =  53906,job =0},
                          {type = 145,value =  13349,job =0},
                      }, 
                },
                --46级
                {                            
                  needXianShui = 850,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 5852,job =1},
                          {type = 11,value = 19507,job =1},
                          {type = 13,value =  5852,job =2},
                          {type = 15,value =  19507,job =2},
                          {type = 17,value =  5852,job =3},
                          {type = 19,value =  19507,job =3},
                          {type = 5,value =  54620,job =0},
                          {type = 145,value =  13505,job =0},
                      }, 
                },
                --47级
                {                            
                  needXianShui = 880,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 5931,job =1},
                          {type = 11,value = 19771,job =1},
                          {type = 13,value =  5931,job =2},
                          {type = 15,value =  19771,job =2},
                          {type = 17,value =  5931,job =3},
                          {type = 19,value =  19771,job =3},
                          {type = 5,value =  55359,job =0},
                          {type = 145,value =  13666,job =0},
                      }, 
                },
                --48级
                {                            
                  needXianShui = 910,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 6013,job =1},
                          {type = 11,value = 20044,job =1},
                          {type = 13,value =  6013,job =2},
                          {type = 15,value =  20044,job =2},
                          {type = 17,value =  6013,job =3},
                          {type = 19,value =  20044,job =3},
                          {type = 5,value =  56123,job =0},
                          {type = 145,value =  13833,job =0},
                      }, 
                },
                --49级
                {                            
                  needXianShui = 940,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 6098,job =1},
                          {type = 11,value = 20326,job =1},
                          {type = 13,value =  6098,job =2},
                          {type = 15,value =  20326,job =2},
                          {type = 17,value =  6098,job =3},
                          {type = 19,value =  20326,job =3},
                          {type = 5,value =  56913,job =0},
                          {type = 145,value =  14006,job =0},
                      }, 
                },
                --50级
                {                            
                  needXianShui = 970,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 6185,job =1},
                          {type = 11,value = 20617,job =1},
                          {type = 13,value =  6185,job =2},
                          {type = 15,value =  20617,job =2},
                          {type = 17,value =  6185,job =3},
                          {type = 19,value =  20617,job =3},
                          {type = 5,value =  57728,job =0},
                          {type = 145,value =  14184,job =0},
                      }, 
                },

			},
			
		},

        

        --腰带
		{
			brokenNeedItem = 7084,
			ShowItem = {7100,7108,7116,7124,7132},
			brokenNeedItemCount = {1,2,5,7,10}, --激活所需，达到2阶所需，到3阶所需，到4阶多需，到5阶所需
			levelUpInfo = 
			{

                --1级
                {                            
                  needXianShui = 0,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 114,job =1},
                          {type = 11,value = 380,job =1},
                          {type = 13,value =  114,job =2},
                          {type = 15,value =  380,job =2},
                          {type = 17,value =  114,job =3},
                          {type = 19,value =  380,job =3},
                          {type = 5,value =  1064,job =0},
                          {type = 145,value =  465,job =0},
                          {type = 21,value =  123,job =0},
                          {type = 23,value =  123,job =0},
                          {type = 25,value =  123,job =0},
                          {type = 27,value =  123,job =0},
                      }, 
                },
                --2级
                {                            
                  needXianShui = 80,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 162,job =1},
                          {type = 11,value = 540,job =1},
                          {type = 13,value =  162,job =2},
                          {type = 15,value =  540,job =2},
                          {type = 17,value =  162,job =3},
                          {type = 19,value =  540,job =3},
                          {type = 5,value =  1512,job =0},
                          {type = 145,value =  563,job =0},
                          {type = 21,value =  174,job =0},
                          {type = 23,value =  174,job =0},
                          {type = 25,value =  174,job =0},
                          {type = 27,value =  174,job =0},
                      }, 
                },
                --3级
                {                            
                  needXianShui = 90,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 203,job =1},
                          {type = 11,value = 675,job =1},
                          {type = 13,value =  203,job =2},
                          {type = 15,value =  675,job =2},
                          {type = 17,value =  203,job =3},
                          {type = 19,value =  675,job =3},
                          {type = 5,value =  1890,job =0},
                          {type = 145,value =  646,job =0},
                          {type = 21,value =  218,job =0},
                          {type = 23,value =  218,job =0},
                          {type = 25,value =  218,job =0},
                          {type = 27,value =  218,job =0},
                      }, 
                },
                --4级
                {                            
                  needXianShui = 100,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 248,job =1},
                          {type = 11,value = 825,job =1},
                          {type = 13,value =  248,job =2},
                          {type = 15,value =  825,job =2},
                          {type = 17,value =  248,job =3},
                          {type = 19,value =  825,job =3},
                          {type = 5,value =  2310,job =0},
                          {type = 145,value =  737,job =0},
                          {type = 21,value =  266,job =0},
                          {type = 23,value =  266,job =0},
                          {type = 25,value =  266,job =0},
                          {type = 27,value =  266,job =0},
                      }, 
                },
                --5级
                {                            
                  needXianShui = 110,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 297,job =1},
                          {type = 11,value = 990,job =1},
                          {type = 13,value =  297,job =2},
                          {type = 15,value =  990,job =2},
                          {type = 17,value =  297,job =3},
                          {type = 19,value =  990,job =3},
                          {type = 5,value =  2772,job =0},
                          {type = 145,value =  839,job =0},
                          {type = 21,value =  319,job =0},
                          {type = 23,value =  319,job =0},
                          {type = 25,value =  319,job =0},
                          {type = 27,value =  319,job =0},
                      }, 
                },
                --6级
                {                            
                  needXianShui = 120,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 351,job =1},
                          {type = 11,value = 1170,job =1},
                          {type = 13,value =  351,job =2},
                          {type = 15,value =  1170,job =2},
                          {type = 17,value =  351,job =3},
                          {type = 19,value =  1170,job =3},
                          {type = 5,value =  3276,job =0},
                          {type = 145,value =  949,job =0},
                          {type = 21,value =  377,job =0},
                          {type = 23,value =  377,job =0},
                          {type = 25,value =  377,job =0},
                          {type = 27,value =  377,job =0},
                      }, 
                },
                --7级
                {                            
                  needXianShui = 130,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 410,job =1},
                          {type = 11,value = 1365,job =1},
                          {type = 13,value =  410,job =2},
                          {type = 15,value =  1365,job =2},
                          {type = 17,value =  410,job =3},
                          {type = 19,value =  1365,job =3},
                          {type = 5,value =  3822,job =0},
                          {type = 145,value =  1068,job =0},
                          {type = 21,value =  440,job =0},
                          {type = 23,value =  440,job =0},
                          {type = 25,value =  440,job =0},
                          {type = 27,value =  440,job =0},
                      }, 
                },
                --8级
                {                            
                  needXianShui = 140,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 473,job =1},
                          {type = 11,value = 1575,job =1},
                          {type = 13,value =  473,job =2},
                          {type = 15,value =  1575,job =2},
                          {type = 17,value =  473,job =3},
                          {type = 19,value =  1575,job =3},
                          {type = 5,value =  4410,job =0},
                          {type = 145,value =  1197,job =0},
                          {type = 21,value =  508,job =0},
                          {type = 23,value =  508,job =0},
                          {type = 25,value =  508,job =0},
                          {type = 27,value =  508,job =0},
                      }, 
                },
                --9级
                {                            
                  needXianShui = 150,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 540,job =1},
                          {type = 11,value = 1800,job =1},
                          {type = 13,value =  540,job =2},
                          {type = 15,value =  1800,job =2},
                          {type = 17,value =  540,job =3},
                          {type = 19,value =  1800,job =3},
                          {type = 5,value =  5040,job =0},
                          {type = 145,value =  1334,job =0},
                          {type = 21,value =  581,job =0},
                          {type = 23,value =  581,job =0},
                          {type = 25,value =  581,job =0},
                          {type = 27,value =  581,job =0},
                      }, 
                },
                --10级
                {                            
                  needXianShui = 160,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 612,job =1},
                          {type = 11,value = 2040,job =1},
                          {type = 13,value =  612,job =2},
                          {type = 15,value =  2040,job =2},
                          {type = 17,value =  612,job =3},
                          {type = 19,value =  2040,job =3},
                          {type = 5,value =  5712,job =0},
                          {type = 145,value =  1481,job =0},
                          {type = 21,value =  658,job =0},
                          {type = 23,value =  658,job =0},
                          {type = 25,value =  658,job =0},
                          {type = 27,value =  658,job =0},
                      }, 
                },
                --11级
                {                            
                  needXianShui = 0,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 792,job =1},
                          {type = 11,value = 2640,job =1},
                          {type = 13,value =  792,job =2},
                          {type = 15,value =  2640,job =2},
                          {type = 17,value =  792,job =3},
                          {type = 19,value =  2640,job =3},
                          {type = 5,value =  7392,job =0},
                          {type = 145,value =  2215,job =0},
                          {type = 21,value =  852,job =0},
                          {type = 23,value =  852,job =0},
                          {type = 25,value =  852,job =0},
                          {type = 27,value =  852,job =0},
                      }, 
                },
                --12级
                {                            
                  needXianShui = 175,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 855,job =1},
                          {type = 11,value = 2850,job =1},
                          {type = 13,value =  855,job =2},
                          {type = 15,value =  2850,job =2},
                          {type = 17,value =  855,job =3},
                          {type = 19,value =  2850,job =3},
                          {type = 5,value =  7980,job =0},
                          {type = 145,value =  2344,job =0},
                          {type = 21,value =  919,job =0},
                          {type = 23,value =  919,job =0},
                          {type = 25,value =  919,job =0},
                          {type = 27,value =  919,job =0},
                      }, 
                },
                --13级
                {                            
                  needXianShui = 190,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 923,job =1},
                          {type = 11,value = 3078,job =1},
                          {type = 13,value =  923,job =2},
                          {type = 15,value =  3078,job =2},
                          {type = 17,value =  923,job =3},
                          {type = 19,value =  3078,job =3},
                          {type = 5,value =  8618,job =0},
                          {type = 145,value =  2483,job =0},
                          {type = 21,value =  993,job =0},
                          {type = 23,value =  993,job =0},
                          {type = 25,value =  993,job =0},
                          {type = 27,value =  993,job =0},
                      }, 
                },
                --14级
                {                            
                  needXianShui = 205,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 997,job =1},
                          {type = 11,value = 3324,job =1},
                          {type = 13,value =  997,job =2},
                          {type = 15,value =  3324,job =2},
                          {type = 17,value =  997,job =3},
                          {type = 19,value =  3324,job =3},
                          {type = 5,value =  9307,job =0},
                          {type = 145,value =  2634,job =0},
                          {type = 21,value =  1072,job =0},
                          {type = 23,value =  1072,job =0},
                          {type = 25,value =  1072,job =0},
                          {type = 27,value =  1072,job =0},
                      }, 
                },
                --15级
                {                            
                  needXianShui = 220,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1076,job =1},
                          {type = 11,value = 3588,job =1},
                          {type = 13,value =  1076,job =2},
                          {type = 15,value =  3588,job =2},
                          {type = 17,value =  1076,job =3},
                          {type = 19,value =  3588,job =3},
                          {type = 5,value =  10046,job =0},
                          {type = 145,value =  2796,job =0},
                          {type = 21,value =  1157,job =0},
                          {type = 23,value =  1157,job =0},
                          {type = 25,value =  1157,job =0},
                          {type = 27,value =  1157,job =0},
                      }, 
                },
                --16级
                {                            
                  needXianShui = 235,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1161,job =1},
                          {type = 11,value = 3870,job =1},
                          {type = 13,value =  1161,job =2},
                          {type = 15,value =  3870,job =2},
                          {type = 17,value =  1161,job =3},
                          {type = 19,value =  3870,job =3},
                          {type = 5,value =  10836,job =0},
                          {type = 145,value =  2969,job =0},
                          {type = 21,value =  1248,job =0},
                          {type = 23,value =  1248,job =0},
                          {type = 25,value =  1248,job =0},
                          {type = 27,value =  1248,job =0},
                      }, 
                },
                --17级
                {                            
                  needXianShui = 250,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1251,job =1},
                          {type = 11,value = 4170,job =1},
                          {type = 13,value =  1251,job =2},
                          {type = 15,value =  4170,job =2},
                          {type = 17,value =  1251,job =3},
                          {type = 19,value =  4170,job =3},
                          {type = 5,value =  11676,job =0},
                          {type = 145,value =  3152,job =0},
                          {type = 21,value =  1345,job =0},
                          {type = 23,value =  1345,job =0},
                          {type = 25,value =  1345,job =0},
                          {type = 27,value =  1345,job =0},
                      }, 
                },
                --18级
                {                            
                  needXianShui = 265,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1346,job =1},
                          {type = 11,value = 4488,job =1},
                          {type = 13,value =  1346,job =2},
                          {type = 15,value =  4488,job =2},
                          {type = 17,value =  1346,job =3},
                          {type = 19,value =  4488,job =3},
                          {type = 5,value =  12566,job =0},
                          {type = 145,value =  3347,job =0},
                          {type = 21,value =  1448,job =0},
                          {type = 23,value =  1448,job =0},
                          {type = 25,value =  1448,job =0},
                          {type = 27,value =  1448,job =0},
                      }, 
                },
                --19级
                {                            
                  needXianShui = 280,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1447,job =1},
                          {type = 11,value = 4824,job =1},
                          {type = 13,value =  1447,job =2},
                          {type = 15,value =  4824,job =2},
                          {type = 17,value =  1447,job =3},
                          {type = 19,value =  4824,job =3},
                          {type = 5,value =  13507,job =0},
                          {type = 145,value =  3552,job =0},
                          {type = 21,value =  1556,job =0},
                          {type = 23,value =  1556,job =0},
                          {type = 25,value =  1556,job =0},
                          {type = 27,value =  1556,job =0},
                      }, 
                },
                --20级
                {                            
                  needXianShui = 295,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1553,job =1},
                          {type = 11,value = 5178,job =1},
                          {type = 13,value =  1553,job =2},
                          {type = 15,value =  5178,job =2},
                          {type = 17,value =  1553,job =3},
                          {type = 19,value =  5178,job =3},
                          {type = 5,value =  14498,job =0},
                          {type = 145,value =  3768,job =0},
                          {type = 21,value =  1670,job =0},
                          {type = 23,value =  1670,job =0},
                          {type = 25,value =  1670,job =0},
                          {type = 27,value =  1670,job =0},
                      }, 
                },
                --21级
                {                            
                  needXianShui = 0,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1823,job =1},
                          {type = 11,value = 6078,job =1},
                          {type = 13,value =  1823,job =2},
                          {type = 15,value =  6078,job =2},
                          {type = 17,value =  1823,job =3},
                          {type = 19,value =  6078,job =3},
                          {type = 5,value =  17018,job =0},
                          {type = 145,value =  4870,job =0},
                          {type = 21,value =  1961,job =0},
                          {type = 23,value =  1961,job =0},
                          {type = 25,value =  1961,job =0},
                          {type = 27,value =  1961,job =0},
                      }, 
                },
                --22级
                {                            
                  needXianShui = 315,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1909,job =1},
                          {type = 11,value = 6362,job =1},
                          {type = 13,value =  1909,job =2},
                          {type = 15,value =  6362,job =2},
                          {type = 17,value =  1909,job =3},
                          {type = 19,value =  6362,job =3},
                          {type = 5,value =  17814,job =0},
                          {type = 145,value =  5044,job =0},
                          {type = 21,value =  2052,job =0},
                          {type = 23,value =  2052,job =0},
                          {type = 25,value =  2052,job =0},
                          {type = 27,value =  2052,job =0},
                      }, 
                },
                --23级
                {                            
                  needXianShui = 335,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1999,job =1},
                          {type = 11,value = 6664,job =1},
                          {type = 13,value =  1999,job =2},
                          {type = 15,value =  6664,job =2},
                          {type = 17,value =  1999,job =3},
                          {type = 19,value =  6664,job =3},
                          {type = 5,value =  18659,job =0},
                          {type = 145,value =  5229,job =0},
                          {type = 21,value =  2150,job =0},
                          {type = 23,value =  2150,job =0},
                          {type = 25,value =  2150,job =0},
                          {type = 27,value =  2150,job =0},
                      }, 
                },
                --24级
                {                            
                  needXianShui = 355,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2095,job =1},
                          {type = 11,value = 6984,job =1},
                          {type = 13,value =  2095,job =2},
                          {type = 15,value =  6984,job =2},
                          {type = 17,value =  2095,job =3},
                          {type = 19,value =  6984,job =3},
                          {type = 5,value =  19555,job =0},
                          {type = 145,value =  5424,job =0},
                          {type = 21,value =  2253,job =0},
                          {type = 23,value =  2253,job =0},
                          {type = 25,value =  2253,job =0},
                          {type = 27,value =  2253,job =0},
                      }, 
                },
                --25级
                {                            
                  needXianShui = 375,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2197,job =1},
                          {type = 11,value = 7322,job =1},
                          {type = 13,value =  2197,job =2},
                          {type = 15,value =  7322,job =2},
                          {type = 17,value =  2197,job =3},
                          {type = 19,value =  7322,job =3},
                          {type = 5,value =  20502,job =0},
                          {type = 145,value =  5632,job =0},
                          {type = 21,value =  2362,job =0},
                          {type = 23,value =  2362,job =0},
                          {type = 25,value =  2362,job =0},
                          {type = 27,value =  2362,job =0},
                      }, 
                },
                --26级
                {                            
                  needXianShui = 395,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2303,job =1},
                          {type = 11,value = 7678,job =1},
                          {type = 13,value =  2303,job =2},
                          {type = 15,value =  7678,job =2},
                          {type = 17,value =  2303,job =3},
                          {type = 19,value =  7678,job =3},
                          {type = 5,value =  21498,job =0},
                          {type = 145,value =  5849,job =0},
                          {type = 21,value =  2477,job =0},
                          {type = 23,value =  2477,job =0},
                          {type = 25,value =  2477,job =0},
                          {type = 27,value =  2477,job =0},
                      }, 
                },
                --27级
                {                            
                  needXianShui = 415,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2416,job =1},
                          {type = 11,value = 8052,job =1},
                          {type = 13,value =  2416,job =2},
                          {type = 15,value =  8052,job =2},
                          {type = 17,value =  2416,job =3},
                          {type = 19,value =  8052,job =3},
                          {type = 5,value =  22546,job =0},
                          {type = 145,value =  6078,job =0},
                          {type = 21,value =  2597,job =0},
                          {type = 23,value =  2597,job =0},
                          {type = 25,value =  2597,job =0},
                          {type = 27,value =  2597,job =0},
                      }, 
                },
                --28级
                {                            
                  needXianShui = 435,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2533,job =1},
                          {type = 11,value = 8444,job =1},
                          {type = 13,value =  2533,job =2},
                          {type = 15,value =  8444,job =2},
                          {type = 17,value =  2533,job =3},
                          {type = 19,value =  8444,job =3},
                          {type = 5,value =  23643,job =0},
                          {type = 145,value =  6318,job =0},
                          {type = 21,value =  2724,job =0},
                          {type = 23,value =  2724,job =0},
                          {type = 25,value =  2724,job =0},
                          {type = 27,value =  2724,job =0},
                      }, 
                },
                --29级
                {                            
                  needXianShui = 455,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2656,job =1},
                          {type = 11,value = 8854,job =1},
                          {type = 13,value =  2656,job =2},
                          {type = 15,value =  8854,job =2},
                          {type = 17,value =  2656,job =3},
                          {type = 19,value =  8854,job =3},
                          {type = 5,value =  24791,job =0},
                          {type = 145,value =  6569,job =0},
                          {type = 21,value =  2856,job =0},
                          {type = 23,value =  2856,job =0},
                          {type = 25,value =  2856,job =0},
                          {type = 27,value =  2856,job =0},
                      }, 
                },
                --30级
                {                            
                  needXianShui = 475,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2785,job =1},
                          {type = 11,value = 9282,job =1},
                          {type = 13,value =  2785,job =2},
                          {type = 15,value =  9282,job =2},
                          {type = 17,value =  2785,job =3},
                          {type = 19,value =  9282,job =3},
                          {type = 5,value =  25990,job =0},
                          {type = 145,value =  6831,job =0},
                          {type = 21,value =  2994,job =0},
                          {type = 23,value =  2994,job =0},
                          {type = 25,value =  2994,job =0},
                          {type = 27,value =  2994,job =0},
                      }, 
                },
                --31级
                {                            
                  needXianShui = 0,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 3217,job =1},
                          {type = 11,value = 10722,job =1},
                          {type = 13,value =  3217,job =2},
                          {type = 15,value =  10722,job =2},
                          {type = 17,value =  3217,job =3},
                          {type = 19,value =  10722,job =3},
                          {type = 5,value =  30022,job =0},
                          {type = 145,value =  8594,job =0},
                          {type = 21,value =  3459,job =0},
                          {type = 23,value =  3459,job =0},
                          {type = 25,value =  3459,job =0},
                          {type = 27,value =  3459,job =0},
                      }, 
                },
                --32级
                {                            
                  needXianShui = 500,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 3307,job =1},
                          {type = 11,value = 11022,job =1},
                          {type = 13,value =  3307,job =2},
                          {type = 15,value =  11022,job =2},
                          {type = 17,value =  3307,job =3},
                          {type = 19,value =  11022,job =3},
                          {type = 5,value =  30862,job =0},
                          {type = 145,value =  8778,job =0},
                          {type = 21,value =  3555,job =0},
                          {type = 23,value =  3555,job =0},
                          {type = 25,value =  3555,job =0},
                          {type = 27,value =  3555,job =0},
                      }, 
                },
                --33级
                {                            
                  needXianShui = 525,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 3401,job =1},
                          {type = 11,value = 11337,job =1},
                          {type = 13,value =  3401,job =2},
                          {type = 15,value =  11337,job =2},
                          {type = 17,value =  3401,job =3},
                          {type = 19,value =  11337,job =3},
                          {type = 5,value =  31744,job =0},
                          {type = 145,value =  8970,job =0},
                          {type = 21,value =  3657,job =0},
                          {type = 23,value =  3657,job =0},
                          {type = 25,value =  3657,job =0},
                          {type = 27,value =  3657,job =0},
                      }, 
                },
                --34级
                {                            
                  needXianShui = 550,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 3500,job =1},
                          {type = 11,value = 11667,job =1},
                          {type = 13,value =  3500,job =2},
                          {type = 15,value =  11667,job =2},
                          {type = 17,value =  3500,job =3},
                          {type = 19,value =  11667,job =3},
                          {type = 5,value =  32668,job =0},
                          {type = 145,value =  9172,job =0},
                          {type = 21,value =  3764,job =0},
                          {type = 23,value =  3764,job =0},
                          {type = 25,value =  3764,job =0},
                          {type = 27,value =  3764,job =0},
                      }, 
                },
                --35级
                {                            
                  needXianShui = 575,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 3604,job =1},
                          {type = 11,value = 12012,job =1},
                          {type = 13,value =  3604,job =2},
                          {type = 15,value =  12012,job =2},
                          {type = 17,value =  3604,job =3},
                          {type = 19,value =  12012,job =3},
                          {type = 5,value =  33634,job =0},
                          {type = 145,value =  9383,job =0},
                          {type = 21,value =  3875,job =0},
                          {type = 23,value =  3875,job =0},
                          {type = 25,value =  3875,job =0},
                          {type = 27,value =  3875,job =0},
                      }, 
                },
                --36级
                {                            
                  needXianShui = 600,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 3712,job =1},
                          {type = 11,value = 12372,job =1},
                          {type = 13,value =  3712,job =2},
                          {type = 15,value =  12372,job =2},
                          {type = 17,value =  3712,job =3},
                          {type = 19,value =  12372,job =3},
                          {type = 5,value =  34642,job =0},
                          {type = 145,value =  9603,job =0},
                          {type = 21,value =  3991,job =0},
                          {type = 23,value =  3991,job =0},
                          {type = 25,value =  3991,job =0},
                          {type = 27,value =  3991,job =0},
                      }, 
                },
                --37级
                {                            
                  needXianShui = 625,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 3824,job =1},
                          {type = 11,value = 12747,job =1},
                          {type = 13,value =  3824,job =2},
                          {type = 15,value =  12747,job =2},
                          {type = 17,value =  3824,job =3},
                          {type = 19,value =  12747,job =3},
                          {type = 5,value =  35692,job =0},
                          {type = 145,value =  9833,job =0},
                          {type = 21,value =  4112,job =0},
                          {type = 23,value =  4112,job =0},
                          {type = 25,value =  4112,job =0},
                          {type = 27,value =  4112,job =0},
                      }, 
                },
                --38级
                {                            
                  needXianShui = 650,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 3941,job =1},
                          {type = 11,value = 13137,job =1},
                          {type = 13,value =  3941,job =2},
                          {type = 15,value =  13137,job =2},
                          {type = 17,value =  3941,job =3},
                          {type = 19,value =  13137,job =3},
                          {type = 5,value =  36784,job =0},
                          {type = 145,value =  10071,job =0},
                          {type = 21,value =  4238,job =0},
                          {type = 23,value =  4238,job =0},
                          {type = 25,value =  4238,job =0},
                          {type = 27,value =  4238,job =0},
                      }, 
                },
                --39级
                {                            
                  needXianShui = 675,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 4063,job =1},
                          {type = 11,value = 13542,job =1},
                          {type = 13,value =  4063,job =2},
                          {type = 15,value =  13542,job =2},
                          {type = 17,value =  4063,job =3},
                          {type = 19,value =  13542,job =3},
                          {type = 5,value =  37918,job =0},
                          {type = 145,value =  10320,job =0},
                          {type = 21,value =  4368,job =0},
                          {type = 23,value =  4368,job =0},
                          {type = 25,value =  4368,job =0},
                          {type = 27,value =  4368,job =0},
                      }, 
                },
                --40级
                {                            
                  needXianShui = 700,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 4189,job =1},
                          {type = 11,value = 13962,job =1},
                          {type = 13,value =  4189,job =2},
                          {type = 15,value =  13962,job =2},
                          {type = 17,value =  4189,job =3},
                          {type = 19,value =  13962,job =3},
                          {type = 5,value =  39094,job =0},
                          {type = 145,value =  10577,job =0},
                          {type = 21,value =  4504,job =0},
                          {type = 23,value =  4504,job =0},
                          {type = 25,value =  4504,job =0},
                          {type = 27,value =  4504,job =0},
                      }, 
                },
                --41级
                {                            
                  needXianShui = 0,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 4729,job =1},
                          {type = 11,value = 15762,job =1},
                          {type = 13,value =  4729,job =2},
                          {type = 15,value =  15762,job =2},
                          {type = 17,value =  4729,job =3},
                          {type = 19,value =  15762,job =3},
                          {type = 5,value =  44134,job =0},
                          {type = 145,value =  12780,job =0},
                          {type = 21,value =  5085,job =0},
                          {type = 23,value =  5085,job =0},
                          {type = 25,value =  5085,job =0},
                          {type = 27,value =  5085,job =0},
                      }, 
                },
                --42级
                {                            
                  needXianShui = 730,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 4794,job =1},
                          {type = 11,value = 15981,job =1},
                          {type = 13,value =  4794,job =2},
                          {type = 15,value =  15981,job =2},
                          {type = 17,value =  4794,job =3},
                          {type = 19,value =  15981,job =3},
                          {type = 5,value =  44747,job =0},
                          {type = 145,value =  12914,job =0},
                          {type = 21,value =  5155,job =0},
                          {type = 23,value =  5155,job =0},
                          {type = 25,value =  5155,job =0},
                          {type = 27,value =  5155,job =0},
                      }, 
                },
                --43级
                {                            
                  needXianShui = 760,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 4863,job =1},
                          {type = 11,value = 16209,job =1},
                          {type = 13,value =  4863,job =2},
                          {type = 15,value =  16209,job =2},
                          {type = 17,value =  4863,job =3},
                          {type = 19,value =  16209,job =3},
                          {type = 5,value =  45385,job =0},
                          {type = 145,value =  13054,job =0},
                          {type = 21,value =  5229,job =0},
                          {type = 23,value =  5229,job =0},
                          {type = 25,value =  5229,job =0},
                          {type = 27,value =  5229,job =0},
                      }, 
                },
                --44级
                {                            
                  needXianShui = 790,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 4934,job =1},
                          {type = 11,value = 16446,job =1},
                          {type = 13,value =  4934,job =2},
                          {type = 15,value =  16446,job =2},
                          {type = 17,value =  4934,job =3},
                          {type = 19,value =  16446,job =3},
                          {type = 5,value =  46049,job =0},
                          {type = 145,value =  13198,job =0},
                          {type = 21,value =  5305,job =0},
                          {type = 23,value =  5305,job =0},
                          {type = 25,value =  5305,job =0},
                          {type = 27,value =  5305,job =0},
                      }, 
                },
                --45级
                {                            
                  needXianShui = 820,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 5008,job =1},
                          {type = 11,value = 16692,job =1},
                          {type = 13,value =  5008,job =2},
                          {type = 15,value =  16692,job =2},
                          {type = 17,value =  5008,job =3},
                          {type = 19,value =  16692,job =3},
                          {type = 5,value =  46738,job =0},
                          {type = 145,value =  13349,job =0},
                          {type = 21,value =  5385,job =0},
                          {type = 23,value =  5385,job =0},
                          {type = 25,value =  5385,job =0},
                          {type = 27,value =  5385,job =0},
                      }, 
                },
                --46级
                {                            
                  needXianShui = 850,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 5084,job =1},
                          {type = 11,value = 16947,job =1},
                          {type = 13,value =  5084,job =2},
                          {type = 15,value =  16947,job =2},
                          {type = 17,value =  5084,job =3},
                          {type = 19,value =  16947,job =3},
                          {type = 5,value =  47452,job =0},
                          {type = 145,value =  13505,job =0},
                          {type = 21,value =  5467,job =0},
                          {type = 23,value =  5467,job =0},
                          {type = 25,value =  5467,job =0},
                          {type = 27,value =  5467,job =0},
                      }, 
                },
                --47级
                {                            
                  needXianShui = 880,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 5163,job =1},
                          {type = 11,value = 17211,job =1},
                          {type = 13,value =  5163,job =2},
                          {type = 15,value =  17211,job =2},
                          {type = 17,value =  5163,job =3},
                          {type = 19,value =  17211,job =3},
                          {type = 5,value =  48191,job =0},
                          {type = 145,value =  13666,job =0},
                          {type = 21,value =  5552,job =0},
                          {type = 23,value =  5552,job =0},
                          {type = 25,value =  5552,job =0},
                          {type = 27,value =  5552,job =0},
                      }, 
                },
                --48级
                {                            
                  needXianShui = 910,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 5245,job =1},
                          {type = 11,value = 17484,job =1},
                          {type = 13,value =  5245,job =2},
                          {type = 15,value =  17484,job =2},
                          {type = 17,value =  5245,job =3},
                          {type = 19,value =  17484,job =3},
                          {type = 5,value =  48955,job =0},
                          {type = 145,value =  13833,job =0},
                          {type = 21,value =  5640,job =0},
                          {type = 23,value =  5640,job =0},
                          {type = 25,value =  5640,job =0},
                          {type = 27,value =  5640,job =0},
                      }, 
                },
                --49级
                {                            
                  needXianShui = 940,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 5330,job =1},
                          {type = 11,value = 17766,job =1},
                          {type = 13,value =  5330,job =2},
                          {type = 15,value =  17766,job =2},
                          {type = 17,value =  5330,job =3},
                          {type = 19,value =  17766,job =3},
                          {type = 5,value =  49745,job =0},
                          {type = 145,value =  14006,job =0},
                          {type = 21,value =  5731,job =0},
                          {type = 23,value =  5731,job =0},
                          {type = 25,value =  5731,job =0},
                          {type = 27,value =  5731,job =0},
                      }, 
                },
                --50级
                {                            
                  needXianShui = 970,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 5417,job =1},
                          {type = 11,value = 18057,job =1},
                          {type = 13,value =  5417,job =2},
                          {type = 15,value =  18057,job =2},
                          {type = 17,value =  5417,job =3},
                          {type = 19,value =  18057,job =3},
                          {type = 5,value =  50560,job =0},
                          {type = 145,value =  14184,job =0},
                          {type = 21,value =  5825,job =0},
                          {type = 23,value =  5825,job =0},
                          {type = 25,value =  5825,job =0},
                          {type = 27,value =  5825,job =0},
                      }, 
                },

			},
			
		},

        --靴子
		{
			brokenNeedItem = 7085,
			ShowItem = {7101,7109,7117,7125,7133},
			brokenNeedItemCount = {1,2,5,7,10}, --激活所需，达到2阶所需，到3阶所需，到4阶多需，到5阶所需
			levelUpInfo = 
			{

                --1级
                {                            
                  needXianShui = 0,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 114,job =1},
                          {type = 11,value = 380,job =1},
                          {type = 13,value =  114,job =2},
                          {type = 15,value =  380,job =2},
                          {type = 17,value =  114,job =3},
                          {type = 19,value =  380,job =3},
                          {type = 5,value =  1064,job =0},
                          {type = 145,value =  465,job =0},
                          {type = 21,value =  123,job =0},
                          {type = 23,value =  123,job =0},
                          {type = 25,value =  123,job =0},
                          {type = 27,value =  123,job =0},
                      }, 
                },
                --2级
                {                            
                  needXianShui = 80,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 162,job =1},
                          {type = 11,value = 540,job =1},
                          {type = 13,value =  162,job =2},
                          {type = 15,value =  540,job =2},
                          {type = 17,value =  162,job =3},
                          {type = 19,value =  540,job =3},
                          {type = 5,value =  1512,job =0},
                          {type = 145,value =  563,job =0},
                          {type = 21,value =  174,job =0},
                          {type = 23,value =  174,job =0},
                          {type = 25,value =  174,job =0},
                          {type = 27,value =  174,job =0},
                      }, 
                },
                --3级
                {                            
                  needXianShui = 90,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 203,job =1},
                          {type = 11,value = 675,job =1},
                          {type = 13,value =  203,job =2},
                          {type = 15,value =  675,job =2},
                          {type = 17,value =  203,job =3},
                          {type = 19,value =  675,job =3},
                          {type = 5,value =  1890,job =0},
                          {type = 145,value =  646,job =0},
                          {type = 21,value =  218,job =0},
                          {type = 23,value =  218,job =0},
                          {type = 25,value =  218,job =0},
                          {type = 27,value =  218,job =0},
                      }, 
                },
                --4级
                {                            
                  needXianShui = 100,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 248,job =1},
                          {type = 11,value = 825,job =1},
                          {type = 13,value =  248,job =2},
                          {type = 15,value =  825,job =2},
                          {type = 17,value =  248,job =3},
                          {type = 19,value =  825,job =3},
                          {type = 5,value =  2310,job =0},
                          {type = 145,value =  737,job =0},
                          {type = 21,value =  266,job =0},
                          {type = 23,value =  266,job =0},
                          {type = 25,value =  266,job =0},
                          {type = 27,value =  266,job =0},
                      }, 
                },
                --5级
                {                            
                  needXianShui = 110,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 297,job =1},
                          {type = 11,value = 990,job =1},
                          {type = 13,value =  297,job =2},
                          {type = 15,value =  990,job =2},
                          {type = 17,value =  297,job =3},
                          {type = 19,value =  990,job =3},
                          {type = 5,value =  2772,job =0},
                          {type = 145,value =  839,job =0},
                          {type = 21,value =  319,job =0},
                          {type = 23,value =  319,job =0},
                          {type = 25,value =  319,job =0},
                          {type = 27,value =  319,job =0},
                      }, 
                },
                --6级
                {                            
                  needXianShui = 120,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 351,job =1},
                          {type = 11,value = 1170,job =1},
                          {type = 13,value =  351,job =2},
                          {type = 15,value =  1170,job =2},
                          {type = 17,value =  351,job =3},
                          {type = 19,value =  1170,job =3},
                          {type = 5,value =  3276,job =0},
                          {type = 145,value =  949,job =0},
                          {type = 21,value =  377,job =0},
                          {type = 23,value =  377,job =0},
                          {type = 25,value =  377,job =0},
                          {type = 27,value =  377,job =0},
                      }, 
                },
                --7级
                {                            
                  needXianShui = 130,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 410,job =1},
                          {type = 11,value = 1365,job =1},
                          {type = 13,value =  410,job =2},
                          {type = 15,value =  1365,job =2},
                          {type = 17,value =  410,job =3},
                          {type = 19,value =  1365,job =3},
                          {type = 5,value =  3822,job =0},
                          {type = 145,value =  1068,job =0},
                          {type = 21,value =  440,job =0},
                          {type = 23,value =  440,job =0},
                          {type = 25,value =  440,job =0},
                          {type = 27,value =  440,job =0},
                      }, 
                },
                --8级
                {                            
                  needXianShui = 140,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 473,job =1},
                          {type = 11,value = 1575,job =1},
                          {type = 13,value =  473,job =2},
                          {type = 15,value =  1575,job =2},
                          {type = 17,value =  473,job =3},
                          {type = 19,value =  1575,job =3},
                          {type = 5,value =  4410,job =0},
                          {type = 145,value =  1197,job =0},
                          {type = 21,value =  508,job =0},
                          {type = 23,value =  508,job =0},
                          {type = 25,value =  508,job =0},
                          {type = 27,value =  508,job =0},
                      }, 
                },
                --9级
                {                            
                  needXianShui = 150,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 540,job =1},
                          {type = 11,value = 1800,job =1},
                          {type = 13,value =  540,job =2},
                          {type = 15,value =  1800,job =2},
                          {type = 17,value =  540,job =3},
                          {type = 19,value =  1800,job =3},
                          {type = 5,value =  5040,job =0},
                          {type = 145,value =  1334,job =0},
                          {type = 21,value =  581,job =0},
                          {type = 23,value =  581,job =0},
                          {type = 25,value =  581,job =0},
                          {type = 27,value =  581,job =0},
                      }, 
                },
                --10级
                {                            
                  needXianShui = 160,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 612,job =1},
                          {type = 11,value = 2040,job =1},
                          {type = 13,value =  612,job =2},
                          {type = 15,value =  2040,job =2},
                          {type = 17,value =  612,job =3},
                          {type = 19,value =  2040,job =3},
                          {type = 5,value =  5712,job =0},
                          {type = 145,value =  1481,job =0},
                          {type = 21,value =  658,job =0},
                          {type = 23,value =  658,job =0},
                          {type = 25,value =  658,job =0},
                          {type = 27,value =  658,job =0},
                      }, 
                },
                --11级
                {                            
                  needXianShui = 0,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 792,job =1},
                          {type = 11,value = 2640,job =1},
                          {type = 13,value =  792,job =2},
                          {type = 15,value =  2640,job =2},
                          {type = 17,value =  792,job =3},
                          {type = 19,value =  2640,job =3},
                          {type = 5,value =  7392,job =0},
                          {type = 145,value =  2215,job =0},
                          {type = 21,value =  852,job =0},
                          {type = 23,value =  852,job =0},
                          {type = 25,value =  852,job =0},
                          {type = 27,value =  852,job =0},
                      }, 
                },
                --12级
                {                            
                  needXianShui = 175,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 855,job =1},
                          {type = 11,value = 2850,job =1},
                          {type = 13,value =  855,job =2},
                          {type = 15,value =  2850,job =2},
                          {type = 17,value =  855,job =3},
                          {type = 19,value =  2850,job =3},
                          {type = 5,value =  7980,job =0},
                          {type = 145,value =  2344,job =0},
                          {type = 21,value =  919,job =0},
                          {type = 23,value =  919,job =0},
                          {type = 25,value =  919,job =0},
                          {type = 27,value =  919,job =0},
                      }, 
                },
                --13级
                {                            
                  needXianShui = 190,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 923,job =1},
                          {type = 11,value = 3078,job =1},
                          {type = 13,value =  923,job =2},
                          {type = 15,value =  3078,job =2},
                          {type = 17,value =  923,job =3},
                          {type = 19,value =  3078,job =3},
                          {type = 5,value =  8618,job =0},
                          {type = 145,value =  2483,job =0},
                          {type = 21,value =  993,job =0},
                          {type = 23,value =  993,job =0},
                          {type = 25,value =  993,job =0},
                          {type = 27,value =  993,job =0},
                      }, 
                },
                --14级
                {                            
                  needXianShui = 205,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 997,job =1},
                          {type = 11,value = 3324,job =1},
                          {type = 13,value =  997,job =2},
                          {type = 15,value =  3324,job =2},
                          {type = 17,value =  997,job =3},
                          {type = 19,value =  3324,job =3},
                          {type = 5,value =  9307,job =0},
                          {type = 145,value =  2634,job =0},
                          {type = 21,value =  1072,job =0},
                          {type = 23,value =  1072,job =0},
                          {type = 25,value =  1072,job =0},
                          {type = 27,value =  1072,job =0},
                      }, 
                },
                --15级
                {                            
                  needXianShui = 220,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1076,job =1},
                          {type = 11,value = 3588,job =1},
                          {type = 13,value =  1076,job =2},
                          {type = 15,value =  3588,job =2},
                          {type = 17,value =  1076,job =3},
                          {type = 19,value =  3588,job =3},
                          {type = 5,value =  10046,job =0},
                          {type = 145,value =  2796,job =0},
                          {type = 21,value =  1157,job =0},
                          {type = 23,value =  1157,job =0},
                          {type = 25,value =  1157,job =0},
                          {type = 27,value =  1157,job =0},
                      }, 
                },
                --16级
                {                            
                  needXianShui = 235,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1161,job =1},
                          {type = 11,value = 3870,job =1},
                          {type = 13,value =  1161,job =2},
                          {type = 15,value =  3870,job =2},
                          {type = 17,value =  1161,job =3},
                          {type = 19,value =  3870,job =3},
                          {type = 5,value =  10836,job =0},
                          {type = 145,value =  2969,job =0},
                          {type = 21,value =  1248,job =0},
                          {type = 23,value =  1248,job =0},
                          {type = 25,value =  1248,job =0},
                          {type = 27,value =  1248,job =0},
                      }, 
                },
                --17级
                {                            
                  needXianShui = 250,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1251,job =1},
                          {type = 11,value = 4170,job =1},
                          {type = 13,value =  1251,job =2},
                          {type = 15,value =  4170,job =2},
                          {type = 17,value =  1251,job =3},
                          {type = 19,value =  4170,job =3},
                          {type = 5,value =  11676,job =0},
                          {type = 145,value =  3152,job =0},
                          {type = 21,value =  1345,job =0},
                          {type = 23,value =  1345,job =0},
                          {type = 25,value =  1345,job =0},
                          {type = 27,value =  1345,job =0},
                      }, 
                },
                --18级
                {                            
                  needXianShui = 265,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1346,job =1},
                          {type = 11,value = 4488,job =1},
                          {type = 13,value =  1346,job =2},
                          {type = 15,value =  4488,job =2},
                          {type = 17,value =  1346,job =3},
                          {type = 19,value =  4488,job =3},
                          {type = 5,value =  12566,job =0},
                          {type = 145,value =  3347,job =0},
                          {type = 21,value =  1448,job =0},
                          {type = 23,value =  1448,job =0},
                          {type = 25,value =  1448,job =0},
                          {type = 27,value =  1448,job =0},
                      }, 
                },
                --19级
                {                            
                  needXianShui = 280,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1447,job =1},
                          {type = 11,value = 4824,job =1},
                          {type = 13,value =  1447,job =2},
                          {type = 15,value =  4824,job =2},
                          {type = 17,value =  1447,job =3},
                          {type = 19,value =  4824,job =3},
                          {type = 5,value =  13507,job =0},
                          {type = 145,value =  3552,job =0},
                          {type = 21,value =  1556,job =0},
                          {type = 23,value =  1556,job =0},
                          {type = 25,value =  1556,job =0},
                          {type = 27,value =  1556,job =0},
                      }, 
                },
                --20级
                {                            
                  needXianShui = 295,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1553,job =1},
                          {type = 11,value = 5178,job =1},
                          {type = 13,value =  1553,job =2},
                          {type = 15,value =  5178,job =2},
                          {type = 17,value =  1553,job =3},
                          {type = 19,value =  5178,job =3},
                          {type = 5,value =  14498,job =0},
                          {type = 145,value =  3768,job =0},
                          {type = 21,value =  1670,job =0},
                          {type = 23,value =  1670,job =0},
                          {type = 25,value =  1670,job =0},
                          {type = 27,value =  1670,job =0},
                      }, 
                },
                --21级
                {                            
                  needXianShui = 0,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1823,job =1},
                          {type = 11,value = 6078,job =1},
                          {type = 13,value =  1823,job =2},
                          {type = 15,value =  6078,job =2},
                          {type = 17,value =  1823,job =3},
                          {type = 19,value =  6078,job =3},
                          {type = 5,value =  17018,job =0},
                          {type = 145,value =  4870,job =0},
                          {type = 21,value =  1961,job =0},
                          {type = 23,value =  1961,job =0},
                          {type = 25,value =  1961,job =0},
                          {type = 27,value =  1961,job =0},
                      }, 
                },
                --22级
                {                            
                  needXianShui = 315,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1909,job =1},
                          {type = 11,value = 6362,job =1},
                          {type = 13,value =  1909,job =2},
                          {type = 15,value =  6362,job =2},
                          {type = 17,value =  1909,job =3},
                          {type = 19,value =  6362,job =3},
                          {type = 5,value =  17814,job =0},
                          {type = 145,value =  5044,job =0},
                          {type = 21,value =  2052,job =0},
                          {type = 23,value =  2052,job =0},
                          {type = 25,value =  2052,job =0},
                          {type = 27,value =  2052,job =0},
                      }, 
                },
                --23级
                {                            
                  needXianShui = 335,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 1999,job =1},
                          {type = 11,value = 6664,job =1},
                          {type = 13,value =  1999,job =2},
                          {type = 15,value =  6664,job =2},
                          {type = 17,value =  1999,job =3},
                          {type = 19,value =  6664,job =3},
                          {type = 5,value =  18659,job =0},
                          {type = 145,value =  5229,job =0},
                          {type = 21,value =  2150,job =0},
                          {type = 23,value =  2150,job =0},
                          {type = 25,value =  2150,job =0},
                          {type = 27,value =  2150,job =0},
                      }, 
                },
                --24级
                {                            
                  needXianShui = 355,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2095,job =1},
                          {type = 11,value = 6984,job =1},
                          {type = 13,value =  2095,job =2},
                          {type = 15,value =  6984,job =2},
                          {type = 17,value =  2095,job =3},
                          {type = 19,value =  6984,job =3},
                          {type = 5,value =  19555,job =0},
                          {type = 145,value =  5424,job =0},
                          {type = 21,value =  2253,job =0},
                          {type = 23,value =  2253,job =0},
                          {type = 25,value =  2253,job =0},
                          {type = 27,value =  2253,job =0},
                      }, 
                },
                --25级
                {                            
                  needXianShui = 375,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2197,job =1},
                          {type = 11,value = 7322,job =1},
                          {type = 13,value =  2197,job =2},
                          {type = 15,value =  7322,job =2},
                          {type = 17,value =  2197,job =3},
                          {type = 19,value =  7322,job =3},
                          {type = 5,value =  20502,job =0},
                          {type = 145,value =  5632,job =0},
                          {type = 21,value =  2362,job =0},
                          {type = 23,value =  2362,job =0},
                          {type = 25,value =  2362,job =0},
                          {type = 27,value =  2362,job =0},
                      }, 
                },
                --26级
                {                            
                  needXianShui = 395,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2303,job =1},
                          {type = 11,value = 7678,job =1},
                          {type = 13,value =  2303,job =2},
                          {type = 15,value =  7678,job =2},
                          {type = 17,value =  2303,job =3},
                          {type = 19,value =  7678,job =3},
                          {type = 5,value =  21498,job =0},
                          {type = 145,value =  5849,job =0},
                          {type = 21,value =  2477,job =0},
                          {type = 23,value =  2477,job =0},
                          {type = 25,value =  2477,job =0},
                          {type = 27,value =  2477,job =0},
                      }, 
                },
                --27级
                {                            
                  needXianShui = 415,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2416,job =1},
                          {type = 11,value = 8052,job =1},
                          {type = 13,value =  2416,job =2},
                          {type = 15,value =  8052,job =2},
                          {type = 17,value =  2416,job =3},
                          {type = 19,value =  8052,job =3},
                          {type = 5,value =  22546,job =0},
                          {type = 145,value =  6078,job =0},
                          {type = 21,value =  2597,job =0},
                          {type = 23,value =  2597,job =0},
                          {type = 25,value =  2597,job =0},
                          {type = 27,value =  2597,job =0},
                      }, 
                },
                --28级
                {                            
                  needXianShui = 435,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2533,job =1},
                          {type = 11,value = 8444,job =1},
                          {type = 13,value =  2533,job =2},
                          {type = 15,value =  8444,job =2},
                          {type = 17,value =  2533,job =3},
                          {type = 19,value =  8444,job =3},
                          {type = 5,value =  23643,job =0},
                          {type = 145,value =  6318,job =0},
                          {type = 21,value =  2724,job =0},
                          {type = 23,value =  2724,job =0},
                          {type = 25,value =  2724,job =0},
                          {type = 27,value =  2724,job =0},
                      }, 
                },
                --29级
                {                            
                  needXianShui = 455,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2656,job =1},
                          {type = 11,value = 8854,job =1},
                          {type = 13,value =  2656,job =2},
                          {type = 15,value =  8854,job =2},
                          {type = 17,value =  2656,job =3},
                          {type = 19,value =  8854,job =3},
                          {type = 5,value =  24791,job =0},
                          {type = 145,value =  6569,job =0},
                          {type = 21,value =  2856,job =0},
                          {type = 23,value =  2856,job =0},
                          {type = 25,value =  2856,job =0},
                          {type = 27,value =  2856,job =0},
                      }, 
                },
                --30级
                {                            
                  needXianShui = 475,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 2785,job =1},
                          {type = 11,value = 9282,job =1},
                          {type = 13,value =  2785,job =2},
                          {type = 15,value =  9282,job =2},
                          {type = 17,value =  2785,job =3},
                          {type = 19,value =  9282,job =3},
                          {type = 5,value =  25990,job =0},
                          {type = 145,value =  6831,job =0},
                          {type = 21,value =  2994,job =0},
                          {type = 23,value =  2994,job =0},
                          {type = 25,value =  2994,job =0},
                          {type = 27,value =  2994,job =0},
                      }, 
                },
                --31级
                {                            
                  needXianShui = 0,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 3217,job =1},
                          {type = 11,value = 10722,job =1},
                          {type = 13,value =  3217,job =2},
                          {type = 15,value =  10722,job =2},
                          {type = 17,value =  3217,job =3},
                          {type = 19,value =  10722,job =3},
                          {type = 5,value =  30022,job =0},
                          {type = 145,value =  8594,job =0},
                          {type = 21,value =  3459,job =0},
                          {type = 23,value =  3459,job =0},
                          {type = 25,value =  3459,job =0},
                          {type = 27,value =  3459,job =0},
                      }, 
                },
                --32级
                {                            
                  needXianShui = 500,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 3307,job =1},
                          {type = 11,value = 11022,job =1},
                          {type = 13,value =  3307,job =2},
                          {type = 15,value =  11022,job =2},
                          {type = 17,value =  3307,job =3},
                          {type = 19,value =  11022,job =3},
                          {type = 5,value =  30862,job =0},
                          {type = 145,value =  8778,job =0},
                          {type = 21,value =  3555,job =0},
                          {type = 23,value =  3555,job =0},
                          {type = 25,value =  3555,job =0},
                          {type = 27,value =  3555,job =0},
                      }, 
                },
                --33级
                {                            
                  needXianShui = 525,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 3401,job =1},
                          {type = 11,value = 11337,job =1},
                          {type = 13,value =  3401,job =2},
                          {type = 15,value =  11337,job =2},
                          {type = 17,value =  3401,job =3},
                          {type = 19,value =  11337,job =3},
                          {type = 5,value =  31744,job =0},
                          {type = 145,value =  8970,job =0},
                          {type = 21,value =  3657,job =0},
                          {type = 23,value =  3657,job =0},
                          {type = 25,value =  3657,job =0},
                          {type = 27,value =  3657,job =0},
                      }, 
                },
                --34级
                {                            
                  needXianShui = 550,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 3500,job =1},
                          {type = 11,value = 11667,job =1},
                          {type = 13,value =  3500,job =2},
                          {type = 15,value =  11667,job =2},
                          {type = 17,value =  3500,job =3},
                          {type = 19,value =  11667,job =3},
                          {type = 5,value =  32668,job =0},
                          {type = 145,value =  9172,job =0},
                          {type = 21,value =  3764,job =0},
                          {type = 23,value =  3764,job =0},
                          {type = 25,value =  3764,job =0},
                          {type = 27,value =  3764,job =0},
                      }, 
                },
                --35级
                {                            
                  needXianShui = 575,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 3604,job =1},
                          {type = 11,value = 12012,job =1},
                          {type = 13,value =  3604,job =2},
                          {type = 15,value =  12012,job =2},
                          {type = 17,value =  3604,job =3},
                          {type = 19,value =  12012,job =3},
                          {type = 5,value =  33634,job =0},
                          {type = 145,value =  9383,job =0},
                          {type = 21,value =  3875,job =0},
                          {type = 23,value =  3875,job =0},
                          {type = 25,value =  3875,job =0},
                          {type = 27,value =  3875,job =0},
                      }, 
                },
                --36级
                {                            
                  needXianShui = 600,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 3712,job =1},
                          {type = 11,value = 12372,job =1},
                          {type = 13,value =  3712,job =2},
                          {type = 15,value =  12372,job =2},
                          {type = 17,value =  3712,job =3},
                          {type = 19,value =  12372,job =3},
                          {type = 5,value =  34642,job =0},
                          {type = 145,value =  9603,job =0},
                          {type = 21,value =  3991,job =0},
                          {type = 23,value =  3991,job =0},
                          {type = 25,value =  3991,job =0},
                          {type = 27,value =  3991,job =0},
                      }, 
                },
                --37级
                {                            
                  needXianShui = 625,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 3824,job =1},
                          {type = 11,value = 12747,job =1},
                          {type = 13,value =  3824,job =2},
                          {type = 15,value =  12747,job =2},
                          {type = 17,value =  3824,job =3},
                          {type = 19,value =  12747,job =3},
                          {type = 5,value =  35692,job =0},
                          {type = 145,value =  9833,job =0},
                          {type = 21,value =  4112,job =0},
                          {type = 23,value =  4112,job =0},
                          {type = 25,value =  4112,job =0},
                          {type = 27,value =  4112,job =0},
                      }, 
                },
                --38级
                {                            
                  needXianShui = 650,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 3941,job =1},
                          {type = 11,value = 13137,job =1},
                          {type = 13,value =  3941,job =2},
                          {type = 15,value =  13137,job =2},
                          {type = 17,value =  3941,job =3},
                          {type = 19,value =  13137,job =3},
                          {type = 5,value =  36784,job =0},
                          {type = 145,value =  10071,job =0},
                          {type = 21,value =  4238,job =0},
                          {type = 23,value =  4238,job =0},
                          {type = 25,value =  4238,job =0},
                          {type = 27,value =  4238,job =0},
                      }, 
                },
                --39级
                {                            
                  needXianShui = 675,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 4063,job =1},
                          {type = 11,value = 13542,job =1},
                          {type = 13,value =  4063,job =2},
                          {type = 15,value =  13542,job =2},
                          {type = 17,value =  4063,job =3},
                          {type = 19,value =  13542,job =3},
                          {type = 5,value =  37918,job =0},
                          {type = 145,value =  10320,job =0},
                          {type = 21,value =  4368,job =0},
                          {type = 23,value =  4368,job =0},
                          {type = 25,value =  4368,job =0},
                          {type = 27,value =  4368,job =0},
                      }, 
                },
                --40级
                {                            
                  needXianShui = 700,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 4189,job =1},
                          {type = 11,value = 13962,job =1},
                          {type = 13,value =  4189,job =2},
                          {type = 15,value =  13962,job =2},
                          {type = 17,value =  4189,job =3},
                          {type = 19,value =  13962,job =3},
                          {type = 5,value =  39094,job =0},
                          {type = 145,value =  10577,job =0},
                          {type = 21,value =  4504,job =0},
                          {type = 23,value =  4504,job =0},
                          {type = 25,value =  4504,job =0},
                          {type = 27,value =  4504,job =0},
                      }, 
                },
                --41级
                {                            
                  needXianShui = 0,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 4729,job =1},
                          {type = 11,value = 15762,job =1},
                          {type = 13,value =  4729,job =2},
                          {type = 15,value =  15762,job =2},
                          {type = 17,value =  4729,job =3},
                          {type = 19,value =  15762,job =3},
                          {type = 5,value =  44134,job =0},
                          {type = 145,value =  12780,job =0},
                          {type = 21,value =  5085,job =0},
                          {type = 23,value =  5085,job =0},
                          {type = 25,value =  5085,job =0},
                          {type = 27,value =  5085,job =0},
                      }, 
                },
                --42级
                {                            
                  needXianShui = 730,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 4794,job =1},
                          {type = 11,value = 15981,job =1},
                          {type = 13,value =  4794,job =2},
                          {type = 15,value =  15981,job =2},
                          {type = 17,value =  4794,job =3},
                          {type = 19,value =  15981,job =3},
                          {type = 5,value =  44747,job =0},
                          {type = 145,value =  12914,job =0},
                          {type = 21,value =  5155,job =0},
                          {type = 23,value =  5155,job =0},
                          {type = 25,value =  5155,job =0},
                          {type = 27,value =  5155,job =0},
                      }, 
                },
                --43级
                {                            
                  needXianShui = 760,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 4863,job =1},
                          {type = 11,value = 16209,job =1},
                          {type = 13,value =  4863,job =2},
                          {type = 15,value =  16209,job =2},
                          {type = 17,value =  4863,job =3},
                          {type = 19,value =  16209,job =3},
                          {type = 5,value =  45385,job =0},
                          {type = 145,value =  13054,job =0},
                          {type = 21,value =  5229,job =0},
                          {type = 23,value =  5229,job =0},
                          {type = 25,value =  5229,job =0},
                          {type = 27,value =  5229,job =0},
                      }, 
                },
                --44级
                {                            
                  needXianShui = 790,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 4934,job =1},
                          {type = 11,value = 16446,job =1},
                          {type = 13,value =  4934,job =2},
                          {type = 15,value =  16446,job =2},
                          {type = 17,value =  4934,job =3},
                          {type = 19,value =  16446,job =3},
                          {type = 5,value =  46049,job =0},
                          {type = 145,value =  13198,job =0},
                          {type = 21,value =  5305,job =0},
                          {type = 23,value =  5305,job =0},
                          {type = 25,value =  5305,job =0},
                          {type = 27,value =  5305,job =0},
                      }, 
                },
                --45级
                {                            
                  needXianShui = 820,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 5008,job =1},
                          {type = 11,value = 16692,job =1},
                          {type = 13,value =  5008,job =2},
                          {type = 15,value =  16692,job =2},
                          {type = 17,value =  5008,job =3},
                          {type = 19,value =  16692,job =3},
                          {type = 5,value =  46738,job =0},
                          {type = 145,value =  13349,job =0},
                          {type = 21,value =  5385,job =0},
                          {type = 23,value =  5385,job =0},
                          {type = 25,value =  5385,job =0},
                          {type = 27,value =  5385,job =0},
                      }, 
                },
                --46级
                {                            
                  needXianShui = 850,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 5084,job =1},
                          {type = 11,value = 16947,job =1},
                          {type = 13,value =  5084,job =2},
                          {type = 15,value =  16947,job =2},
                          {type = 17,value =  5084,job =3},
                          {type = 19,value =  16947,job =3},
                          {type = 5,value =  47452,job =0},
                          {type = 145,value =  13505,job =0},
                          {type = 21,value =  5467,job =0},
                          {type = 23,value =  5467,job =0},
                          {type = 25,value =  5467,job =0},
                          {type = 27,value =  5467,job =0},
                      }, 
                },
                --47级
                {                            
                  needXianShui = 880,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 5163,job =1},
                          {type = 11,value = 17211,job =1},
                          {type = 13,value =  5163,job =2},
                          {type = 15,value =  17211,job =2},
                          {type = 17,value =  5163,job =3},
                          {type = 19,value =  17211,job =3},
                          {type = 5,value =  48191,job =0},
                          {type = 145,value =  13666,job =0},
                          {type = 21,value =  5552,job =0},
                          {type = 23,value =  5552,job =0},
                          {type = 25,value =  5552,job =0},
                          {type = 27,value =  5552,job =0},
                      }, 
                },
                --48级
                {                            
                  needXianShui = 910,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 5245,job =1},
                          {type = 11,value = 17484,job =1},
                          {type = 13,value =  5245,job =2},
                          {type = 15,value =  17484,job =2},
                          {type = 17,value =  5245,job =3},
                          {type = 19,value =  17484,job =3},
                          {type = 5,value =  48955,job =0},
                          {type = 145,value =  13833,job =0},
                          {type = 21,value =  5640,job =0},
                          {type = 23,value =  5640,job =0},
                          {type = 25,value =  5640,job =0},
                          {type = 27,value =  5640,job =0},
                      }, 
                },
                --49级
                {                            
                  needXianShui = 940,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 5330,job =1},
                          {type = 11,value = 17766,job =1},
                          {type = 13,value =  5330,job =2},
                          {type = 15,value =  17766,job =2},
                          {type = 17,value =  5330,job =3},
                          {type = 19,value =  17766,job =3},
                          {type = 5,value =  49745,job =0},
                          {type = 145,value =  14006,job =0},
                          {type = 21,value =  5731,job =0},
                          {type = 23,value =  5731,job =0},
                          {type = 25,value =  5731,job =0},
                          {type = 27,value =  5731,job =0},
                      }, 
                },
                --50级
                {                            
                  needXianShui = 970,  --如果是0，说明需要突破，扣突破物品，不扣仙水
                  attr=
                      {
                          {type = 9,value = 5417,job =1},
                          {type = 11,value = 18057,job =1},
                          {type = 13,value =  5417,job =2},
                          {type = 15,value =  18057,job =2},
                          {type = 17,value =  5417,job =3},
                          {type = 19,value =  18057,job =3},
                          {type = 5,value =  50560,job =0},
                          {type = 145,value =  14184,job =0},
                          {type = 21,value =  5825,job =0},
                          {type = 23,value =  5825,job =0},
                          {type = 25,value =  5825,job =0},
                          {type = 27,value =  5825,job =0},
                      }, 
                },

		},
	
	},
	

	},
	
	
	--整套装备套装属性
	SuitAttr1 =
	{
		
	  --每个位置都要到的级别
        {
            totalNeedLevel = 5, 
            attr=
                  {
                       {type = 9,value = 866,job =1},
                       {type = 11,value = 2888,job =1},
                       {type = 13,value = 866,job =2},
                       {type = 15,value = 2888,job =2},
                       {type = 17,value = 866,job =3},
                       {type = 19,value = 2888,job =3},
                       {type = 127,value = 12800,job =0},
                       {type = 171,value = 50,job =0},
                  },
        },
    --每个位置都要到的级别
        {
            totalNeedLevel = 10, 
            attr=
                  {
                       {type = 9,value = 1316,job =1},
                       {type = 11,value = 4388,job =1},
                       {type = 13,value = 1316,job =2},
                       {type = 15,value = 4388,job =2},
                       {type = 17,value = 1316,job =3},
                       {type = 19,value = 4388,job =3},
                       {type = 127,value = 28880,job =0},
                       {type = 171,value = 100,job =0},
                  },
        },
    --每个位置都要到的级别
        {
            totalNeedLevel = 15, 
            attr=
                  {
                       {type = 9,value = 2216,job =1},
                       {type = 11,value = 7388,job =1},
                       {type = 13,value = 2216,job =2},
                       {type = 15,value = 7388,job =2},
                       {type = 17,value = 2216,job =3},
                       {type = 19,value = 7388,job =3},
                       {type = 127,value = 43880,job =0},
                       {type = 171,value = 150,job =0},
                  },
        },
    --每个位置都要到的级别
        {
            totalNeedLevel = 20, 
            attr=
                  {
                       {type = 9,value = 2846,job =1},
                       {type = 11,value = 9488,job =1},
                       {type = 13,value = 2846,job =2},
                       {type = 15,value = 9488,job =2},
                       {type = 17,value = 2846,job =3},
                       {type = 19,value = 9488,job =3},
                       {type = 127,value = 73880,job =0},
                       {type = 171,value = 200,job =0},
                  },
        },
    --每个位置都要到的级别
        {
            totalNeedLevel = 25, 
            attr=
                  {
                       {type = 9,value = 4166,job =1},
                       {type = 11,value = 13888,job =1},
                       {type = 13,value = 4166,job =2},
                       {type = 15,value = 13888,job =2},
                       {type = 17,value = 4166,job =3},
                       {type = 19,value = 13888,job =3},
                       {type = 127,value = 94880,job =0},
                       {type = 171,value = 250,job =0},
                  },
        },
    --每个位置都要到的级别
        {
            totalNeedLevel = 30, 
            attr=
                  {
                       {type = 9,value = 5366,job =1},
                       {type = 11,value = 17888,job =1},
                       {type = 13,value = 5366,job =2},
                       {type = 15,value = 17888,job =2},
                       {type = 17,value = 5366,job =3},
                       {type = 19,value = 17888,job =3},
                       {type = 127,value = 138880,job =0},
                       {type = 171,value = 300,job =0},
                  },
        },
    --每个位置都要到的级别
        {
            totalNeedLevel = 35, 
            attr=
                  {
                       {type = 9,value = 7166,job =1},
                       {type = 11,value = 23888,job =1},
                       {type = 13,value = 7166,job =2},
                       {type = 15,value = 23888,job =2},
                       {type = 17,value = 7166,job =3},
                       {type = 19,value = 23888,job =3},
                       {type = 127,value = 178880,job =0},
                       {type = 171,value = 350,job =0},
                  },
        },
    --每个位置都要到的级别
        {
            totalNeedLevel = 40, 
            attr=
                  {
                       {type = 9,value = 8066,job =1},
                       {type = 11,value = 26888,job =1},
                       {type = 13,value = 8066,job =2},
                       {type = 15,value = 26888,job =2},
                       {type = 17,value = 8066,job =3},
                       {type = 19,value = 26888,job =3},
                       {type = 127,value = 238880,job =0},
                       {type = 171,value = 400,job =0},
                  },
        },
    --每个位置都要到的级别
        {
            totalNeedLevel = 45, 
            attr=
                  {
                       {type = 9,value = 9866,job =1},
                       {type = 11,value = 32888,job =1},
                       {type = 13,value = 9866,job =2},
                       {type = 15,value = 32888,job =2},
                       {type = 17,value = 9866,job =3},
                       {type = 19,value = 32888,job =3},
                       {type = 127,value = 268880,job =0},
                       {type = 171,value = 450,job =0},
                  },
        },
    --每个位置都要到的级别
        {
            totalNeedLevel = 50, 
            attr=
                  {
                       {type = 9,value = 10766,job =1},
                       {type = 11,value = 35888,job =1},
                       {type = 13,value = 10766,job =2},
                       {type = 15,value = 35888,job =2},
                       {type = 17,value = 10766,job =3},
                       {type = 19,value = 35888,job =3},
                       {type = 127,value = 328880,job =0},
                       {type = 171,value = 500,job =0},
                  },
        },
	},
	
	--武器衣服套装属性
	SuitAttr2 =
	{
		
		--武器衣服，均达到1级
        {
            totalNeedLevel = 1, 
            attr=
                  {
                       {type = 9,value = 206,job =1},
                       {type = 11,value = 688,job =1},
                       {type = 13,value = 206,job =2},
                       {type = 15,value = 688,job =2},
                       {type = 17,value = 206,job =3},
                       {type = 19,value = 688,job =3},
                       {type = 153,value = 2800,job =0},
                       {type = 181,value = 100,job =0},
                  },
        },
    --武器衣服，均达到2级
        {
            totalNeedLevel = 2, 
            attr=
                  {
                       {type = 9,value = 866,job =1},
                       {type = 11,value = 2888,job =1},
                       {type = 13,value = 866,job =2},
                       {type = 15,value = 2888,job =2},
                       {type = 17,value = 866,job =3},
                       {type = 19,value = 2888,job =3},
                       {type = 153,value = 12800,job =0},
                       {type = 181,value = 200,job =0},
                  },
        },
    --武器衣服，均达到3级
        {
            totalNeedLevel = 3, 
            attr=
                  {
                       {type = 9,value = 1766,job =1},
                       {type = 11,value = 5888,job =1},
                       {type = 13,value = 1766,job =2},
                       {type = 15,value = 5888,job =2},
                       {type = 17,value = 1766,job =3},
                       {type = 19,value = 5888,job =3},
                       {type = 153,value = 28800,job =0},
                       {type = 181,value = 300,job =0},
                  },
        },
    --武器衣服，均达到4级
        {
            totalNeedLevel = 4, 
            attr=
                  {
                       {type = 9,value = 2666,job =1},
                       {type = 11,value = 8888,job =1},
                       {type = 13,value = 2666,job =2},
                       {type = 15,value = 8888,job =2},
                       {type = 17,value = 2666,job =3},
                       {type = 19,value = 8888,job =3},
                       {type = 153,value = 48800,job =0},
                       {type = 181,value = 400,job =0},
                  },
        },
    --武器衣服，均达到5级
        {
            totalNeedLevel = 5, 
            attr=
                  {
                       {type = 9,value = 3866,job =1},
                       {type = 11,value = 12888,job =1},
                       {type = 13,value = 3866,job =2},
                       {type = 15,value = 12888,job =2},
                       {type = 17,value = 3866,job =3},
                       {type = 19,value = 12888,job =3},
                       {type = 153,value = 68800,job =0},
                       {type = 181,value = 500,job =0},
                  },
        },

	},

	
	--首饰套装属性
	SuitAttr3 =
	{
		
    --首饰，均达到1级
        {
            totalNeedLevel = 1, 
            attr=
                  {
                       {type = 9,value = 206,job =1},
                       {type = 11,value = 688,job =1},
                       {type = 13,value = 206,job =2},
                       {type = 15,value = 688,job =2},
                       {type = 17,value = 206,job =3},
                       {type = 19,value = 688,job =3},
                       {type = 170,value = 2800,job =0},
                       {type = 182,value = 100,job =0},
                  },
        },
    --首饰，均达到2级
        {
            totalNeedLevel = 2, 
            attr=
                  {
                       {type = 9,value = 866,job =1},
                       {type = 11,value = 2888,job =1},
                       {type = 13,value = 866,job =2},
                       {type = 15,value = 2888,job =2},
                       {type = 17,value = 866,job =3},
                       {type = 19,value = 2888,job =3},
                       {type = 170,value = 12800,job =0},
                       {type = 182,value = 200,job =0},
                  },
        },
    --首饰，均达到3级
        {
            totalNeedLevel = 3, 
            attr=
                  {
                       {type = 9,value = 1766,job =1},
                       {type = 11,value = 5888,job =1},
                       {type = 13,value = 1766,job =2},
                       {type = 15,value = 5888,job =2},
                       {type = 17,value = 1766,job =3},
                       {type = 19,value = 5888,job =3},
                       {type = 170,value = 28800,job =0},
                       {type = 182,value = 300,job =0},
                  },
        },
    --首饰，均达到4级
        {
            totalNeedLevel = 4, 
            attr=
                  {
                       {type = 9,value = 2666,job =1},
                       {type = 11,value = 8888,job =1},
                       {type = 13,value = 2666,job =2},
                       {type = 15,value = 8888,job =2},
                       {type = 17,value = 2666,job =3},
                       {type = 19,value = 8888,job =3},
                       {type = 170,value = 48800,job =0},
                       {type = 182,value = 400,job =0},
                  },
        },
    --首饰，均达到5级
        {
            totalNeedLevel = 5, 
            attr=
                  {
                       {type = 9,value = 3866,job =1},
                       {type = 11,value = 12888,job =1},
                       {type = 13,value = 3866,job =2},
                       {type = 15,value = 12888,job =2},
                       {type = 17,value = 3866,job =3},
                       {type = 19,value = 12888,job =3},
                       {type = 170,value = 68800,job =0},
                       {type = 182,value = 500,job =0},
                  },
        },
	},












}