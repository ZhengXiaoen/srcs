
-- 勇者闯关配置
challenge_fuben_cfg = {
	needLevel = 60, -- 需求等级
	fubenId = 27, -- 副本ID
	fubenSceneId = 163, -- 副本场景ID
	enterX = -46, -- 玩家进入位置
	enterY = -32,	
	monsterX1 = 32, -- 怪物位置
	monsterY1 = 28,
	monsterX2 = 39,
	monsterY2 = 33,
	time = 180, -- 时间,秒
	awardItemId = 459, -- 奖励的物品ID(1级强化石id=459)
	totalRound = 200, -- 共200关
	
	-- 领取通关宝箱奖励
	BoxAwards = 
	{
---------------------------------------
		-- needLevel=等级需求, id=物品ID, count=数量, bind=是否绑定
{needLevel=60,award={{type=0,id=459,count=40,bind=1},},},--5关
{needLevel=60,award={{type=0,id=459,count=64,bind=1},},},--10关
{needLevel=60,award={{type=0,id=459,count=96,bind=1},},},--15关
{needLevel=60,award={{type=0,id=459,count=136,bind=1},},},--20关
{needLevel=60,award={{type=0,id=459,count=184,bind=1},},},--25关
{needLevel=60,award={{type=0,id=459,count=240,bind=1},},},--30关
{needLevel=60,award={{type=0,id=459,count=304,bind=1},},},--35关
{needLevel=60,award={{type=0,id=459,count=376,bind=1},},},--40关
{needLevel=60,award={{type=0,id=459,count=456,bind=1},},},--45关
{needLevel=60,award={{type=0,id=459,count=544,bind=1},},},--50关
{needLevel=60,award={{type=0,id=459,count=640,bind=1},},},--55关
{needLevel=60,award={{type=0,id=459,count=744,bind=1},},},--60关
{needLevel=60,award={{type=0,id=459,count=856,bind=1},},},--65关
{needLevel=60,award={{type=0,id=459,count=976,bind=1},},},--70关
{needLevel=60,award={{type=0,id=459,count=1104,bind=1},},},--75关
{needLevel=60,award={{type=0,id=459,count=1240,bind=1},},},--80关
{needLevel=60,award={{type=0,id=459,count=1384,bind=1},},},--85关
{needLevel=60,award={{type=0,id=459,count=1536,bind=1},},},--90关
{needLevel=60,award={{type=0,id=459,count=1696,bind=1},},},--95关
{needLevel=60,award={{type=0,id=459,count=1864,bind=1},},},--100关
{needLevel=60,award={{type=0,id=459,count=2040,bind=1},},},--105关
{needLevel=60,award={{type=0,id=459,count=2224,bind=1},},},--110关
{needLevel=60,award={{type=0,id=459,count=2416,bind=1},},},--115关
{needLevel=60,award={{type=0,id=459,count=2616,bind=1},},},--120关
{needLevel=60,award={{type=0,id=459,count=2824,bind=1},},},--125关
{needLevel=60,award={{type=0,id=459,count=3040,bind=1},},},--130关
{needLevel=60,award={{type=0,id=459,count=3264,bind=1},},},--135关
{needLevel=60,award={{type=0,id=459,count=3496,bind=1},},},--140关
{needLevel=60,award={{type=0,id=459,count=3736,bind=1},},},--145关
{needLevel=60,award={{type=0,id=459,count=3984,bind=1},},},--150关
{needLevel=60,award={{type=0,id=459,count=4240,bind=1},},},--155关
{needLevel=60,award={{type=0,id=459,count=4504,bind=1},},},--160关
{needLevel=60,award={{type=0,id=459,count=4776,bind=1},},},--165关
{needLevel=60,award={{type=0,id=459,count=5056,bind=1},},},--170关
{needLevel=60,award={{type=0,id=459,count=5344,bind=1},},},--175关
{needLevel=60,award={{type=0,id=459,count=5640,bind=1},},},--180关
{needLevel=60,award={{type=0,id=459,count=5944,bind=1},},},--185关
{needLevel=60,award={{type=0,id=459,count=6256,bind=1},},},--190关
{needLevel=60,award={{type=0,id=459,count=6576,bind=1},},},--195关
{needLevel=60,award={{type=0,id=459,count=6904,bind=1},},},--200关

---------------------------------------
	},
	
	-- 关卡列表
	RoundList = 
	{
---------------------------------------
		-- monsterId = 怪物ID,monsterCount = 怪物数量, awardItemCount =通关奖励, saodangItemCount =扫荡奖励
{monsterId = 422, monsterCount = 20, awardItemCount = 5, saodangItemCount = 5,}, --1关
{monsterId = 423, monsterCount = 15, awardItemCount = 5, saodangItemCount = 10,}, --2关
{monsterId = 424, monsterCount = 10, awardItemCount = 5, saodangItemCount = 15,}, --3关
{monsterId = 425, monsterCount = 3, awardItemCount = 5, saodangItemCount = 20,}, --4关
{monsterId = 426, monsterCount = 1, awardItemCount = 20, saodangItemCount = 25,}, --5关
{monsterId = 427, monsterCount = 20, awardItemCount = 8, saodangItemCount = 30,}, --6关
{monsterId = 428, monsterCount = 15, awardItemCount = 8, saodangItemCount = 35,}, --7关
{monsterId = 429, monsterCount = 10, awardItemCount = 8, saodangItemCount = 40,}, --8关
{monsterId = 430, monsterCount = 3, awardItemCount = 8, saodangItemCount = 45,}, --9关
{monsterId = 431, monsterCount = 1, awardItemCount = 32, saodangItemCount = 50,}, --10关
{monsterId = 432, monsterCount = 20, awardItemCount = 12, saodangItemCount = 55,}, --11关
{monsterId = 433, monsterCount = 15, awardItemCount = 12, saodangItemCount = 60,}, --12关
{monsterId = 434, monsterCount = 10, awardItemCount = 12, saodangItemCount = 65,}, --13关
{monsterId = 435, monsterCount = 3, awardItemCount = 12, saodangItemCount = 70,}, --14关
{monsterId = 436, monsterCount = 1, awardItemCount = 48, saodangItemCount = 75,}, --15关
{monsterId = 437, monsterCount = 20, awardItemCount = 17, saodangItemCount = 80,}, --16关
{monsterId = 438, monsterCount = 15, awardItemCount = 17, saodangItemCount = 85,}, --17关
{monsterId = 439, monsterCount = 10, awardItemCount = 17, saodangItemCount = 90,}, --18关
{monsterId = 440, monsterCount = 3, awardItemCount = 17, saodangItemCount = 95,}, --19关
{monsterId = 441, monsterCount = 1, awardItemCount = 68, saodangItemCount = 100,}, --20关
{monsterId = 442, monsterCount = 20, awardItemCount = 23, saodangItemCount = 105,}, --21关
{monsterId = 443, monsterCount = 15, awardItemCount = 23, saodangItemCount = 110,}, --22关
{monsterId = 444, monsterCount = 10, awardItemCount = 23, saodangItemCount = 115,}, --23关
{monsterId = 445, monsterCount = 3, awardItemCount = 23, saodangItemCount = 120,}, --24关
{monsterId = 446, monsterCount = 1, awardItemCount = 92, saodangItemCount = 125,}, --25关
{monsterId = 447, monsterCount = 20, awardItemCount = 30, saodangItemCount = 130,}, --26关
{monsterId = 448, monsterCount = 15, awardItemCount = 30, saodangItemCount = 135,}, --27关
{monsterId = 449, monsterCount = 10, awardItemCount = 30, saodangItemCount = 140,}, --28关
{monsterId = 450, monsterCount = 3, awardItemCount = 30, saodangItemCount = 145,}, --29关
{monsterId = 451, monsterCount = 1, awardItemCount = 120, saodangItemCount = 150,}, --30关
{monsterId = 452, monsterCount = 20, awardItemCount = 38, saodangItemCount = 155,}, --31关
{monsterId = 453, monsterCount = 15, awardItemCount = 38, saodangItemCount = 160,}, --32关
{monsterId = 454, monsterCount = 10, awardItemCount = 38, saodangItemCount = 165,}, --33关
{monsterId = 455, monsterCount = 3, awardItemCount = 38, saodangItemCount = 170,}, --34关
{monsterId = 456, monsterCount = 1, awardItemCount = 152, saodangItemCount = 175,}, --35关
{monsterId = 457, monsterCount = 20, awardItemCount = 47, saodangItemCount = 180,}, --36关
{monsterId = 458, monsterCount = 15, awardItemCount = 47, saodangItemCount = 185,}, --37关
{monsterId = 459, monsterCount = 10, awardItemCount = 47, saodangItemCount = 190,}, --38关
{monsterId = 460, monsterCount = 3, awardItemCount = 47, saodangItemCount = 195,}, --39关
{monsterId = 461, monsterCount = 1, awardItemCount = 188, saodangItemCount = 200,}, --40关
{monsterId = 462, monsterCount = 15, awardItemCount = 57, saodangItemCount = 205,}, --41关
{monsterId = 463, monsterCount = 10, awardItemCount = 57, saodangItemCount = 210,}, --42关
{monsterId = 464, monsterCount = 3, awardItemCount = 57, saodangItemCount = 215,}, --43关
{monsterId = 465, monsterCount = 3, awardItemCount = 57, saodangItemCount = 220,}, --44关
{monsterId = 466, monsterCount = 1, awardItemCount = 228, saodangItemCount = 225,}, --45关
{monsterId = 467, monsterCount = 20, awardItemCount = 68, saodangItemCount = 230,}, --46关
{monsterId = 468, monsterCount = 15, awardItemCount = 68, saodangItemCount = 235,}, --47关
{monsterId = 469, monsterCount = 10, awardItemCount = 68, saodangItemCount = 240,}, --48关
{monsterId = 470, monsterCount = 3, awardItemCount = 68, saodangItemCount = 245,}, --49关
{monsterId = 471, monsterCount = 1, awardItemCount = 272, saodangItemCount = 250,}, --50关
{monsterId = 472, monsterCount = 20, awardItemCount = 80, saodangItemCount = 255,}, --51关
{monsterId = 473, monsterCount = 15, awardItemCount = 80, saodangItemCount = 260,}, --52关
{monsterId = 474, monsterCount = 10, awardItemCount = 80, saodangItemCount = 265,}, --53关
{monsterId = 475, monsterCount = 3, awardItemCount = 80, saodangItemCount = 270,}, --54关
{monsterId = 476, monsterCount = 1, awardItemCount = 320, saodangItemCount = 275,}, --55关
{monsterId = 477, monsterCount = 20, awardItemCount = 93, saodangItemCount = 280,}, --56关
{monsterId = 478, monsterCount = 15, awardItemCount = 93, saodangItemCount = 285,}, --57关
{monsterId = 479, monsterCount = 10, awardItemCount = 93, saodangItemCount = 290,}, --58关
{monsterId = 480, monsterCount = 3, awardItemCount = 93, saodangItemCount = 295,}, --59关
{monsterId = 481, monsterCount = 1, awardItemCount = 372, saodangItemCount = 300,}, --60关
{monsterId = 482, monsterCount = 15, awardItemCount = 107, saodangItemCount = 305,}, --61关
{monsterId = 483, monsterCount = 10, awardItemCount = 107, saodangItemCount = 310,}, --62关
{monsterId = 484, monsterCount = 3, awardItemCount = 107, saodangItemCount = 315,}, --63关
{monsterId = 485, monsterCount = 3, awardItemCount = 107, saodangItemCount = 320,}, --64关
{monsterId = 486, monsterCount = 1, awardItemCount = 428, saodangItemCount = 325,}, --65关
{monsterId = 487, monsterCount = 20, awardItemCount = 122, saodangItemCount = 330,}, --66关
{monsterId = 488, monsterCount = 15, awardItemCount = 122, saodangItemCount = 335,}, --67关
{monsterId = 489, monsterCount = 10, awardItemCount = 122, saodangItemCount = 340,}, --68关
{monsterId = 490, monsterCount = 3, awardItemCount = 122, saodangItemCount = 345,}, --69关
{monsterId = 491, monsterCount = 1, awardItemCount = 488, saodangItemCount = 350,}, --70关
{monsterId = 492, monsterCount = 20, awardItemCount = 138, saodangItemCount = 355,}, --71关
{monsterId = 493, monsterCount = 15, awardItemCount = 138, saodangItemCount = 360,}, --72关
{monsterId = 494, monsterCount = 10, awardItemCount = 138, saodangItemCount = 365,}, --73关
{monsterId = 495, monsterCount = 3, awardItemCount = 138, saodangItemCount = 370,}, --74关
{monsterId = 496, monsterCount = 1, awardItemCount = 552, saodangItemCount = 375,}, --75关
{monsterId = 497, monsterCount = 20, awardItemCount = 155, saodangItemCount = 380,}, --76关
{monsterId = 498, monsterCount = 15, awardItemCount = 155, saodangItemCount = 385,}, --77关
{monsterId = 499, monsterCount = 10, awardItemCount = 155, saodangItemCount = 390,}, --78关
{monsterId = 500, monsterCount = 3, awardItemCount = 155, saodangItemCount = 395,}, --79关
{monsterId = 501, monsterCount = 1, awardItemCount = 620, saodangItemCount = 400,}, --80关
{monsterId = 502, monsterCount = 20, awardItemCount = 173, saodangItemCount = 405,}, --81关
{monsterId = 503, monsterCount = 15, awardItemCount = 173, saodangItemCount = 410,}, --82关
{monsterId = 504, monsterCount = 10, awardItemCount = 173, saodangItemCount = 415,}, --83关
{monsterId = 505, monsterCount = 3, awardItemCount = 173, saodangItemCount = 420,}, --84关
{monsterId = 506, monsterCount = 1, awardItemCount = 692, saodangItemCount = 425,}, --85关
{monsterId = 507, monsterCount = 20, awardItemCount = 192, saodangItemCount = 430,}, --86关
{monsterId = 508, monsterCount = 15, awardItemCount = 192, saodangItemCount = 435,}, --87关
{monsterId = 509, monsterCount = 10, awardItemCount = 192, saodangItemCount = 440,}, --88关
{monsterId = 510, monsterCount = 3, awardItemCount = 192, saodangItemCount = 445,}, --89关
{monsterId = 511, monsterCount = 1, awardItemCount = 768, saodangItemCount = 450,}, --90关
{monsterId = 512, monsterCount = 20, awardItemCount = 212, saodangItemCount = 455,}, --91关
{monsterId = 513, monsterCount = 15, awardItemCount = 212, saodangItemCount = 460,}, --92关
{monsterId = 514, monsterCount = 10, awardItemCount = 212, saodangItemCount = 465,}, --93关
{monsterId = 515, monsterCount = 3, awardItemCount = 212, saodangItemCount = 470,}, --94关
{monsterId = 516, monsterCount = 1, awardItemCount = 848, saodangItemCount = 475,}, --95关
{monsterId = 517, monsterCount = 20, awardItemCount = 233, saodangItemCount = 480,}, --96关
{monsterId = 518, monsterCount = 15, awardItemCount = 233, saodangItemCount = 485,}, --97关
{monsterId = 519, monsterCount = 10, awardItemCount = 233, saodangItemCount = 490,}, --98关
{monsterId = 520, monsterCount = 3, awardItemCount = 233, saodangItemCount = 495,}, --99关
{monsterId = 521, monsterCount = 1, awardItemCount = 932, saodangItemCount = 500,}, --100关
{monsterId = 522, monsterCount = 15, awardItemCount = 255, saodangItemCount = 505,}, --101关
{monsterId = 523, monsterCount = 10, awardItemCount = 255, saodangItemCount = 510,}, --102关
{monsterId = 524, monsterCount = 3, awardItemCount = 255, saodangItemCount = 515,}, --103关
{monsterId = 525, monsterCount = 3, awardItemCount = 255, saodangItemCount = 520,}, --104关
{monsterId = 526, monsterCount = 1, awardItemCount = 1020, saodangItemCount = 525,}, --105关
{monsterId = 527, monsterCount = 20, awardItemCount = 278, saodangItemCount = 530,}, --106关
{monsterId = 528, monsterCount = 15, awardItemCount = 278, saodangItemCount = 535,}, --107关
{monsterId = 529, monsterCount = 10, awardItemCount = 278, saodangItemCount = 540,}, --108关
{monsterId = 530, monsterCount = 3, awardItemCount = 278, saodangItemCount = 545,}, --109关
{monsterId = 531, monsterCount = 1, awardItemCount = 1112, saodangItemCount = 550,}, --110关
{monsterId = 532, monsterCount = 20, awardItemCount = 302, saodangItemCount = 555,}, --111关
{monsterId = 533, monsterCount = 15, awardItemCount = 302, saodangItemCount = 560,}, --112关
{monsterId = 534, monsterCount = 10, awardItemCount = 302, saodangItemCount = 565,}, --113关
{monsterId = 535, monsterCount = 3, awardItemCount = 302, saodangItemCount = 570,}, --114关
{monsterId = 536, monsterCount = 1, awardItemCount = 1208, saodangItemCount = 575,}, --115关
{monsterId = 537, monsterCount = 15, awardItemCount = 327, saodangItemCount = 580,}, --116关
{monsterId = 538, monsterCount = 10, awardItemCount = 327, saodangItemCount = 585,}, --117关
{monsterId = 539, monsterCount = 3, awardItemCount = 327, saodangItemCount = 590,}, --118关
{monsterId = 540, monsterCount = 3, awardItemCount = 327, saodangItemCount = 595,}, --119关
{monsterId = 541, monsterCount = 1, awardItemCount = 1308, saodangItemCount = 600,}, --120关
{monsterId = 542, monsterCount = 15, awardItemCount = 353, saodangItemCount = 605,}, --121关
{monsterId = 543, monsterCount = 10, awardItemCount = 353, saodangItemCount = 610,}, --122关
{monsterId = 544, monsterCount = 3, awardItemCount = 353, saodangItemCount = 615,}, --123关
{monsterId = 545, monsterCount = 3, awardItemCount = 353, saodangItemCount = 620,}, --124关
{monsterId = 546, monsterCount = 1, awardItemCount = 1412, saodangItemCount = 625,}, --125关
{monsterId = 547, monsterCount = 20, awardItemCount = 380, saodangItemCount = 630,}, --126关
{monsterId = 548, monsterCount = 15, awardItemCount = 380, saodangItemCount = 635,}, --127关
{monsterId = 549, monsterCount = 10, awardItemCount = 380, saodangItemCount = 640,}, --128关
{monsterId = 550, monsterCount = 3, awardItemCount = 380, saodangItemCount = 645,}, --129关
{monsterId = 551, monsterCount = 1, awardItemCount = 1520, saodangItemCount = 650,}, --130关
{monsterId = 552, monsterCount = 15, awardItemCount = 408, saodangItemCount = 655,}, --131关
{monsterId = 553, monsterCount = 10, awardItemCount = 408, saodangItemCount = 660,}, --132关
{monsterId = 554, monsterCount = 3, awardItemCount = 408, saodangItemCount = 665,}, --133关
{monsterId = 555, monsterCount = 3, awardItemCount = 408, saodangItemCount = 670,}, --134关
{monsterId = 556, monsterCount = 1, awardItemCount = 1632, saodangItemCount = 675,}, --135关
{monsterId = 557, monsterCount = 15, awardItemCount = 437, saodangItemCount = 680,}, --136关
{monsterId = 558, monsterCount = 10, awardItemCount = 437, saodangItemCount = 685,}, --137关
{monsterId = 559, monsterCount = 3, awardItemCount = 437, saodangItemCount = 690,}, --138关
{monsterId = 560, monsterCount = 3, awardItemCount = 437, saodangItemCount = 695,}, --139关
{monsterId = 561, monsterCount = 1, awardItemCount = 1748, saodangItemCount = 700,}, --140关
{monsterId = 562, monsterCount = 20, awardItemCount = 467, saodangItemCount = 705,}, --141关
{monsterId = 563, monsterCount = 15, awardItemCount = 467, saodangItemCount = 710,}, --142关
{monsterId = 564, monsterCount = 10, awardItemCount = 467, saodangItemCount = 715,}, --143关
{monsterId = 565, monsterCount = 3, awardItemCount = 467, saodangItemCount = 720,}, --144关
{monsterId = 566, monsterCount = 1, awardItemCount = 1868, saodangItemCount = 725,}, --145关
{monsterId = 567, monsterCount = 20, awardItemCount = 498, saodangItemCount = 730,}, --146关
{monsterId = 568, monsterCount = 15, awardItemCount = 498, saodangItemCount = 735,}, --147关
{monsterId = 569, monsterCount = 10, awardItemCount = 498, saodangItemCount = 740,}, --148关
{monsterId = 570, monsterCount = 3, awardItemCount = 498, saodangItemCount = 745,}, --149关
{monsterId = 571, monsterCount = 1, awardItemCount = 1992, saodangItemCount = 750,}, --150关
{monsterId = 572, monsterCount = 10, awardItemCount = 530, saodangItemCount = 755,}, --151关
{monsterId = 573, monsterCount = 3, awardItemCount = 530, saodangItemCount = 760,}, --152关
{monsterId = 574, monsterCount = 3, awardItemCount = 530, saodangItemCount = 765,}, --153关
{monsterId = 575, monsterCount = 3, awardItemCount = 530, saodangItemCount = 770,}, --154关
{monsterId = 576, monsterCount = 1, awardItemCount = 2120, saodangItemCount = 775,}, --155关
{monsterId = 577, monsterCount = 10, awardItemCount = 563, saodangItemCount = 780,}, --156关
{monsterId = 578, monsterCount = 3, awardItemCount = 563, saodangItemCount = 785,}, --157关
{monsterId = 579, monsterCount = 3, awardItemCount = 563, saodangItemCount = 790,}, --158关
{monsterId = 580, monsterCount = 3, awardItemCount = 563, saodangItemCount = 795,}, --159关
{monsterId = 581, monsterCount = 1, awardItemCount = 2252, saodangItemCount = 800,}, --160关
{monsterId = 582, monsterCount = 15, awardItemCount = 597, saodangItemCount = 805,}, --161关
{monsterId = 583, monsterCount = 10, awardItemCount = 597, saodangItemCount = 810,}, --162关
{monsterId = 584, monsterCount = 3, awardItemCount = 597, saodangItemCount = 815,}, --163关
{monsterId = 585, monsterCount = 3, awardItemCount = 597, saodangItemCount = 820,}, --164关
{monsterId = 586, monsterCount = 1, awardItemCount = 2388, saodangItemCount = 825,}, --165关
{monsterId = 587, monsterCount = 10, awardItemCount = 632, saodangItemCount = 830,}, --166关
{monsterId = 588, monsterCount = 3, awardItemCount = 632, saodangItemCount = 835,}, --167关
{monsterId = 589, monsterCount = 3, awardItemCount = 632, saodangItemCount = 840,}, --168关
{monsterId = 590, monsterCount = 3, awardItemCount = 632, saodangItemCount = 845,}, --169关
{monsterId = 591, monsterCount = 1, awardItemCount = 2528, saodangItemCount = 850,}, --170关
{monsterId = 592, monsterCount = 15, awardItemCount = 668, saodangItemCount = 855,}, --171关
{monsterId = 593, monsterCount = 10, awardItemCount = 668, saodangItemCount = 860,}, --172关
{monsterId = 594, monsterCount = 3, awardItemCount = 668, saodangItemCount = 865,}, --173关
{monsterId = 595, monsterCount = 3, awardItemCount = 668, saodangItemCount = 870,}, --174关
{monsterId = 596, monsterCount = 1, awardItemCount = 2672, saodangItemCount = 875,}, --175关
{monsterId = 597, monsterCount = 10, awardItemCount = 705, saodangItemCount = 880,}, --176关
{monsterId = 598, monsterCount = 3, awardItemCount = 705, saodangItemCount = 885,}, --177关
{monsterId = 599, monsterCount = 3, awardItemCount = 705, saodangItemCount = 890,}, --178关
{monsterId = 600, monsterCount = 3, awardItemCount = 705, saodangItemCount = 895,}, --179关
{monsterId = 601, monsterCount = 1, awardItemCount = 2820, saodangItemCount = 900,}, --180关
{monsterId = 602, monsterCount = 15, awardItemCount = 743, saodangItemCount = 905,}, --181关
{monsterId = 603, monsterCount = 10, awardItemCount = 743, saodangItemCount = 910,}, --182关
{monsterId = 604, monsterCount = 3, awardItemCount = 743, saodangItemCount = 915,}, --183关
{monsterId = 605, monsterCount = 3, awardItemCount = 743, saodangItemCount = 920,}, --184关
{monsterId = 606, monsterCount = 1, awardItemCount = 2972, saodangItemCount = 925,}, --185关
{monsterId = 607, monsterCount = 10, awardItemCount = 782, saodangItemCount = 930,}, --186关
{monsterId = 608, monsterCount = 3, awardItemCount = 782, saodangItemCount = 935,}, --187关
{monsterId = 609, monsterCount = 3, awardItemCount = 782, saodangItemCount = 940,}, --188关
{monsterId = 610, monsterCount = 3, awardItemCount = 782, saodangItemCount = 945,}, --189关
{monsterId = 611, monsterCount = 1, awardItemCount = 3128, saodangItemCount = 950,}, --190关
{monsterId = 612, monsterCount = 10, awardItemCount = 822, saodangItemCount = 955,}, --191关
{monsterId = 613, monsterCount = 3, awardItemCount = 822, saodangItemCount = 960,}, --192关
{monsterId = 614, monsterCount = 3, awardItemCount = 822, saodangItemCount = 965,}, --193关
{monsterId = 615, monsterCount = 3, awardItemCount = 822, saodangItemCount = 970,}, --194关
{monsterId = 616, monsterCount = 1, awardItemCount = 3288, saodangItemCount = 975,}, --195关
{monsterId = 617, monsterCount = 1, awardItemCount = 863, saodangItemCount = 980,}, --196关
{monsterId = 618, monsterCount = 1, awardItemCount = 863, saodangItemCount = 985,}, --197关
{monsterId = 619, monsterCount = 1, awardItemCount = 863, saodangItemCount = 990,}, --198关
{monsterId = 620, monsterCount = 1, awardItemCount = 863, saodangItemCount = 995,}, --199关
{monsterId = 621, monsterCount = 1, awardItemCount = 3452, saodangItemCount = 1000,}, --200关

---------------------------------------
	},
}
