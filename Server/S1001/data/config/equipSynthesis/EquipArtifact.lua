--天兵神器
EquipArtifact = 
{
	EquipWeapon =   --神器
	{
		{
			level=1,
			needDiamond=5,--金刚石数量
			appearancId = 119,  -- 内观特效ID
			consume={
			         {type = 0,id = 898,count = 1}},--需要魅影之刃
			award={
			         {type=0,id=735,count=1,bind=1}},--获得地之魅影之刃（2阶）
			desc="<(c0xFF64af3a)魅影之刃1把\n金刚石5颗>",
		},
		{
			level=2,
			needDiamond=10,--金刚石数量
			appearancId = 119,  -- 内观特效ID
			consume={
			         {type = 0,id = 735,count = 1}},--需要地之魅影之刃
			award={
			         {type=0,id=736,count=1,bind=1}},--获得天之魅影之刃（3阶）
			desc="<(c0xFF64af3a)地之魅影之刃1把\n金刚石10颗>",
		},
		{
			level=3,
			needDiamond=20,--金刚石数量
			appearancId = 119,  -- 内观特效ID
			consume={
			         {type = 0,id = 736,count = 1}},--需要天之魅影之刃
			award={
			         {type=0,id=737,count=1,bind=1}},--获得火之魅影之刃（4阶）
			desc="<(c0xFF64af3a)天之魅影之刃1把\n金刚石20颗>",
		},
		{
			level=4,
			needDiamond=35,--金刚石数量
			appearancId = 119,  -- 内观特效ID
			consume={
			         {type = 0,id = 737,count = 1}},--需要火之魅影之刃
			award={
			         {type=0,id=738,count=1,bind=1}},--获得龙之魅影之刃（5阶）
			desc="<(c0xFF64af3a)火之魅影之刃1把\n金刚石35颗>",
		},
		{
			level=5,
			needDiamond=55,--金刚石数量
			appearancId = 119,  -- 内观特效ID
			consume={
			         {type = 0,id = 738,count = 1}},--需要龙之魅影之刃
			award={
			         {type=0,id=739,count=1,bind=1}},--获得神之魅影之刃（6阶）
			desc="<(c0xFF64af3a)龙之魅影之刃1把\n金刚石55颗>",
		},
		------
		{
			level=6,
			needDiamond=80,--金刚石数量
			appearancId = 120,  -- 内观特效ID			
			consume={{type = 0,id = 739,count = 1},--需要神之魅影之刃
			         {type = 0,id = 900,count = 2},        --需要霸者结晶
			         },
			award={{type=0,id=880,count=1,bind=1}},--获得霸者之刃
			desc="<(c0xFF64af3a)神之魅影之刃1把\n金刚石80颗>",
		},
		{
			level=7,
			needDiamond=110,--金刚石数量
			appearancId = 120,  -- 内观特效ID			
			consume={{type = 0,id = 880,count = 1},--需要霸者之刃
			         --{type = 0,id = 900,count = 2},        --需要霸者结晶
			         },
			award={{type=0,id=740,count=1,bind=1}},--获得地之霸者之刃
			desc="<(c0xFF64af3a)霸者之刃1把\n金刚石110颗>",
		},
		{
			level=8,
			needDiamond=145,--金刚石数量
			appearancId = 120,  -- 内观特效ID			
			consume={{type = 0,id = 740,count = 1},--需要地之霸者之刃
			         --{type = 0,id = 900,count = 2},        --需要霸者结晶
			         },
			award={{type=0,id=741,count=1,bind=1}},--获得天之霸者之刃
			desc="<(c0xFF64af3a)地之霸者之刃1把\n金刚石145颗>",
		},
		{
			level=9,
			needDiamond=185,--金刚石数量
			appearancId = 120,  -- 内观特效ID			
			consume={{type = 0,id = 741,count = 1},--需要天之霸者之刃
			         --{type = 0,id = 900,count = 2},        --需要霸者结晶
			         },
			award={{type=0,id=742,count=1,bind=1}},--获得火之霸者之刃
			desc="<(c0xFF64af3a)天之霸者之刃1把\n金刚石185颗>",
		},
		{
			level=10,
			needDiamond=230,--金刚石数量
			appearancId = 120,  -- 内观特效ID			
			consume={{type = 0,id = 742,count = 1},--需要火之霸者之刃
			         --{type = 0,id = 900,count = 2},        --需要霸者结晶
			         },
			award={{type=0,id=743,count=1,bind=1}},--获得龙之霸者之刃
			desc="<(c0xFF64af3a)火之霸者之刃1把\n金刚石230颗>",
		},
		{
			level=11,
			needDiamond=280,--金刚石数量
			appearancId = 120,  -- 内观特效ID			
			consume={{type = 0,id = 743,count = 1},--需要龙之霸者之刃
			         --{type = 0,id = 900,count = 2},        --需要霸者结晶
			         },
			award={{type=0,id=744,count=1,bind=1}},--获得神之霸者之刃
			desc="<(c0xFF64af3a)龙之霸者之刃1把\n金刚石280颗>",
		},
		{
			level=12,
			needDiamond=335,--金刚石数量
			appearancId = 129,  -- 内观特效ID			
			consume={{type = 0,id = 744,count = 1},--需要神之霸者之刃
			         {type = 0,id = 900,count = 5},        --需要霸者结晶
			         },
			award={{type=0,id=881,count=1,bind=1}},--获得霸者之刃·王
			desc="<(c0xFF64af3a)神之霸者之刃1把\n金刚石335颗>",
		},
		-------
		{
			level=13,
			needDiamond=395,--金刚石数量
			appearancId = 129,  -- 内观特效ID			
			consume={{type = 0,id = 881,count = 1},--需要霸者之刃·王
			        -- {type = 0,id = 900,count = 5},        --需要霸者结晶
			         },
			award={{type=0,id=745,count=1,bind=1}},--获得地之霸者之刃·王
			desc="<(c0xFF64af3a)霸者之刃·王1把\n金刚石395颗>",
		},
		{
			level=14,
			needDiamond=460,--金刚石数量
			appearancId = 129,  -- 内观特效ID			
			consume={{type = 0,id = 745,count = 1},--需要地之霸者之刃·王
			        -- {type = 0,id = 900,count = 5},        --需要霸者结晶
			         },
			award={{type=0,id=746,count=1,bind=1}},--获得天之霸者之刃·王
			desc="<(c0xFF64af3a)地之霸者之刃·王1把\n金刚石460颗>",
		},
		{
			level=15,
			needDiamond=530,--金刚石数量
			appearancId = 129,  -- 内观特效ID			
			consume={{type = 0,id = 746,count = 1},--需要天之霸者之刃·王
			        -- {type = 0,id = 900,count = 5},        --需要霸者结晶
			         },
			award={{type=0,id=747,count=1,bind=1}},--获得火之霸者之刃·王
			desc="<(c0xFF64af3a)天之霸者之刃·王1把\n金刚石530颗>",
		},
		{
			level=16,
			needDiamond=605,--金刚石数量
			appearancId = 129,  -- 内观特效ID			
			consume={{type = 0,id = 747,count = 1},--需要火之霸者之刃·王
			        -- {type = 0,id = 900,count = 5},        --需要霸者结晶
			         },
			award={{type=0,id=748,count=1,bind=1}},--获得龙之霸者之刃·王
			desc="<(c0xFF64af3a)火之霸者之刃·王1把\n金刚石605颗>",
		},
		{
			level=17,
			needDiamond=685,--金刚石数量
			appearancId = 129,  -- 内观特效ID			
			consume={{type = 0,id = 748,count = 1},--需要龙之霸者之刃·王
			        -- {type = 0,id = 900,count = 5},        --需要霸者结晶
			         },
			award={{type=0,id=749,count=1,bind=1}},--获得神之霸者之刃·王
			desc="<(c0xFF64af3a)龙之霸者之刃·王1把\n金刚石685颗>",
		},
	},
	-----------------------------------------------------------------------------------------------
	EquipMent =     --神甲
	{
		{
			level=1,
			needDiamond=5,--金刚石数量
			appearancId = 142,  -- 内观特效ID
			consume={
			         {type = 0,id = 913,count = 1,sex=0},
				 {type = 0,id = 914,count = 1,sex=1}},--需要骑士圣甲
			award={{type=0,id = 760,count = 1,sex=0,bind=1},
			       {type=0,id = 761,count = 1,sex=1,bind=1}},--获得地之骑士圣甲
			desc="<(c0xFF64af3a)对应性别的骑士圣甲1件\n金刚石5颗>",
		},
		{
			level=2,
			needDiamond=10,--金刚石数量
			appearancId = 142,  -- 内观特效ID
			consume={
			         {type = 0,id = 760,count = 1,sex=0},
				 {type = 0,id = 761,count = 1,sex=1}},--需要地之骑士圣甲
			award={{type=0,id = 762,count = 1,sex=0,bind=1},
			       {type=0,id = 763,count = 1,sex=1,bind=1}},--获得天之骑士圣甲
			desc="<(c0xFF64af3a)对应性别的地之骑士圣甲1件\n金刚石10颗>",
		},
		{
			level=3,
			needDiamond=15,--金刚石数量
			appearancId = 142,  -- 内观特效ID
			consume={
			         {type = 0,id = 762,count = 1,sex=0},
				 {type = 0,id = 763,count = 1,sex=1}},--需要天之骑士圣甲
			award={{type=0,id = 764,count = 1,sex=0,bind=1},
			       {type=0,id = 765,count = 1,sex=1,bind=1}},--获得火之骑士圣甲
			desc="<(c0xFF64af3a)对应性别的天之骑士圣甲1件\n金刚石15颗>",
		},
		{
			level=4,
			needDiamond=25,--金刚石数量
			appearancId = 142,  -- 内观特效ID
			consume={
			         {type = 0,id = 764,count = 1,sex=0},
				 {type = 0,id = 765,count = 1,sex=1}},--需要火之骑士圣甲
			award={{type=0,id = 766,count = 1,sex=0,bind=1},
			       {type=0,id = 767,count = 1,sex=1,bind=1}},--获得龙之骑士圣甲
			desc="<(c0xFF64af3a)对应性别的火之骑士圣甲1件\n金刚石25颗>",
		},
		{
			level=5,
			needDiamond=35,--金刚石数量
			appearancId = 142,  -- 内观特效ID
			consume={
			         {type = 0,id = 766,count = 1,sex=0},
				 {type = 0,id = 767,count = 1,sex=1}},--需要龙之骑士圣甲
			award={{type=0,id = 768,count = 1,sex=0,bind=1},
			       {type=0,id = 769,count = 1,sex=1,bind=1}},--获得神之骑士圣甲
			desc="<(c0xFF64af3a)对应性别的龙之骑士圣甲1件\n金刚石35颗>",
		},
		{
			level=6,
			needDiamond=50,--金刚石数量
			appearancId = 121,  -- 内观特效ID
			consume={
			         {type = 0,id = 768,count = 1,sex=0},
				 {type = 0,id = 769,count = 1,sex=1},--需要神之骑士圣甲
				 {type = 0,id = 900,count = 2}},       --需要霸者结晶
			award={{type=0,id = 886,count = 1,sex=0,bind=1},
			       {type=0,id = 887,count = 1,sex=1,bind=1}},--获得霸者神甲
			desc="<(c0xFF64af3a)对应性别的神之骑士圣甲1件\n金刚石50颗>",
		},
		{
			level=7,
			needDiamond=70,--金刚石数量
			appearancId = 121,  -- 内观特效ID
			consume={--需要霸者结晶
			         {type = 0,id = 886,count = 1,sex=0},
				 {type = 0,id = 887,count = 1,sex=1}},--需要霸者神甲
				 --{type = 0,id = 900,count = 2},},--需要霸者结晶
			award={{type=0,id = 770,count = 1,sex=0,bind=1},
			       {type=0,id = 771,count = 1,sex=1,bind=1}},--获得地之霸者神甲
			desc="<(c0xFF64af3a)对应性别的霸者神甲1件\n金刚石70颗>",
		},
		{
			level=8,
			needDiamond=95,--金刚石数量
			appearancId = 121,  -- 内观特效ID
			consume={--需要霸者结晶
			         {type = 0,id = 770,count = 1,sex=0},
				 {type = 0,id = 771,count = 1,sex=1}},--需要地之霸者神甲
				 --{type = 0,id = 900,count = 2},},--需要霸者结晶
			award={{type=0,id = 772,count = 1,sex=0,bind=1},
			       {type=0,id = 773,count = 1,sex=1,bind=1}},--获得天之霸者神甲
			desc="<(c0xFF64af3a)对应性别的地之霸者神甲1件\n金刚石95颗>",
		},
		{
			level=9,
			needDiamond=125,--金刚石数量
			appearancId = 121,  -- 内观特效ID
			consume={--需要霸者结晶
			         {type = 0,id = 772,count = 1,sex=0},
				 {type = 0,id = 773,count = 1,sex=1}},--需要天之霸者神甲
				 --{type = 0,id = 900,count = 2},},--需要霸者结晶
			award={{type=0,id = 774,count = 1,sex=0,bind=1},
			       {type=0,id = 775,count = 1,sex=1,bind=1}},--获得火之霸者神甲
			desc="<(c0xFF64af3a)对应性别的天之霸者神甲1件\n金刚石125颗>",
		},
		{
			level=10,
			needDiamond=160,--金刚石数量
			appearancId = 121,  -- 内观特效ID
			consume={--需要霸者结晶
			         {type = 0,id = 774,count = 1,sex=0},
				 {type = 0,id = 775,count = 1,sex=1}},--需要火之霸者神甲
				 --{type = 0,id = 900,count = 2},},--需要霸者结晶
			award={{type=0,id = 776,count = 1,sex=0,bind=1},
			       {type=0,id = 777,count = 1,sex=1,bind=1}},--获得龙之霸者神甲
			desc="<(c0xFF64af3a)对应性别的火之霸者神甲1件\n金刚石160颗>",
		},
		{
			level=11,
			needDiamond=200,--金刚石数量
			appearancId = 121,  -- 内观特效ID
			consume={--需要霸者结晶
			         {type = 0,id = 776,count = 1,sex=0},
				 {type = 0,id = 777,count = 1,sex=1}},--需要龙之霸者神甲
				 --{type = 0,id = 900,count = 2},},--需要霸者结晶
			award={{type=0,id = 778,count = 1,sex=0,bind=1},
			       {type=0,id = 779,count = 1,sex=1,bind=1}},--获得神之霸者神甲
			desc="<(c0xFF64af3a)对应性别的龙之霸者神甲1件\n金刚石200颗>",
		},
		{
			level=12,
			needDiamond=245,--金刚石数量
			appearancId = 130,  -- 内观特效ID
			consume={--需要霸者结晶
			         {type = 0,id = 778,count = 1,sex=0},
				 {type = 0,id = 779,count = 1,sex=1},--需要神之霸者神甲
				 {type = 0,id = 900,count = 5}},--需要霸者结晶
			award={{type=0,id = 888,count = 1,sex=0,bind=1},
			       {type=0,id = 889,count = 1,sex=1,bind=1}},--获得霸者神甲·王
			desc="<(c0xFF64af3a)对应性别的神之霸者神甲1件\n金刚石245颗>",
		},
		{
			level=13,
			needDiamond=295,--金刚石数量
			appearancId = 130,  -- 内观特效ID
			consume={--需要霸者结晶
			         {type = 0,id = 888,count = 1,sex=0},
				 {type = 0,id = 889,count = 1,sex=1}},--需要霸者神甲·王
				 --{type = 0,id = 900,count = 5},},--需要霸者结晶
			award={{type=0,id = 780,count = 1,sex=0,bind=1},
			       {type=0,id = 781,count = 1,sex=1,bind=1}},--获得地之霸者神甲·王
			desc="<(c0xFF64af3a)对应性别的霸者神甲·王1件\n金刚石295颗>",
		},
		{
			level=14,
			needDiamond=350,--金刚石数量
			appearancId = 130,  -- 内观特效ID
			consume={--需要霸者结晶
			         {type = 0,id = 780,count = 1,sex=0},
				 {type = 0,id = 781,count = 1,sex=1}},--需要地之霸者神甲·王
				 --{type = 0,id = 900,count = 5},},--需要霸者结晶
			award={{type=0,id = 782,count = 1,sex=0,bind=1},
			       {type=0,id = 783,count = 1,sex=1,bind=1}},--获得天之霸者神甲·王
			desc="<(c0xFF64af3a)对应性别的地之霸者神甲·王1件\n金刚石350颗>",
		},
		{
			level=15,
			needDiamond=410,--金刚石数量
			appearancId = 130,  -- 内观特效ID
			consume={--需要霸者结晶
			         {type = 0,id = 782,count = 1,sex=0},
				 {type = 0,id = 783,count = 1,sex=1}},--需要天之霸者神甲·王
				 --{type = 0,id = 900,count = 5},},--需要霸者结晶
			award={{type=0,id = 784,count = 1,sex=0,bind=1},
			       {type=0,id = 785,count = 1,sex=1,bind=1}},--获得火之霸者神甲·王
			desc="<(c0xFF64af3a)对应性别的天之霸者神甲·王1件\n金刚石410颗>",
		},
		{
			level=16,
			needDiamond=475,--金刚石数量
			appearancId = 130,  -- 内观特效ID
			consume={--需要霸者结晶
			         {type = 0,id = 784,count = 1,sex=0},
				 {type = 0,id = 785,count = 1,sex=1}},--需要火之霸者神甲·王
				 --{type = 0,id = 900,count = 5},},--需要霸者结晶
			award={{type=0,id = 786,count = 1,sex=0,bind=1},
			       {type=0,id = 787,count = 1,sex=1,bind=1}},--获得龙之霸者神甲·王
			desc="<(c0xFF64af3a)对应性别的火之霸者神甲·王1件\n金刚石475颗>",
		},
		{
			level=17,
			needDiamond=545,--金刚石数量
			appearancId = 130,  -- 内观特效ID
			consume={--需要霸者结晶
			         {type = 0,id = 786,count = 1,sex=0},
				 {type = 0,id = 787,count = 1,sex=1}},--需要龙之霸者神甲·王
				 --{type = 0,id = 900,count = 5},},--需要霸者结晶
			award={{type=0,id = 788,count = 1,sex=0,bind=1},
			       {type=0,id = 789,count = 1,sex=1,bind=1}},--获得神之霸者神甲·王
			desc="<(c0xFF64af3a)对应性别的龙之霸者神甲·王1件\n金刚石545颗>",
		},
	},
	------------------------------------------------------------------------------------------------
	MagicEquip =  --法宝
	{
		{
			level=1,
			needDiamond=200,--金刚石数量
			appearancId = 1,  -- 内观特效ID
			consume={
			         {type = 0,id = 900,count = 1},--需要霸者结晶
			         --{type = 0,id = 913,count = 1,job=1},
				 --{type = 0,id = 914,count = 1,job=1}
				},--需要法宝

			award={{type=0,id = 705,count = 1,job=1,bind=1},
			       {type=0,id = 706,count = 1,job=2,bind=1},
			       {type=0,id = 707,count = 1,job=3,bind=1}},
			desc="<(c0xFF64af3a)n金刚石200颗>",
		},
		{
			level=2,
			needDiamond=350,--金刚石数量
			appearancId = 2,  -- 内观特效ID
			consume={
					{type = 0,id = 705,count = 1,job=1},
					{type = 0,id = 706,count = 1,job=2},
					{type = 0,id = 707,count = 1,job=3},
					{type = 0,id = 900,count = 2},--需要霸者结晶
				},--需要法宝

			award={{type=0,id = 708,count = 1,job=1,bind=1},
			       {type=0,id = 709,count = 1,job=2,bind=1},
			       {type=0,id = 710,count = 1,job=3,bind=1}},
			desc="<(c0xFF64af3a)n金刚石350颗>",
		},
		{
			level=3,
			needDiamond=550,--金刚石数量
			appearancId = 3,  -- 内观特效ID
			consume={
					{type = 0,id = 708,count = 1,job=1},
					{type = 0,id = 709,count = 1,job=2},
					{type = 0,id = 710,count = 1,job=3},
					{type = 0,id = 900,count = 3},--需要霸者结晶
				},--需要法宝

			award={{type=0,id = 711,count = 1,job=1,bind=1},
			       {type=0,id = 712,count = 1,job=2,bind=1},
			       {type=0,id = 713,count = 1,job=3,bind=1}},
			desc="<(c0xFF64af3a)n金刚石550颗>",
		},
		{
			level=4,
			needDiamond=800,--金刚石数量
			appearancId = 4,  -- 内观特效ID
			consume={
			         {type = 0,id = 711,count = 1,job=1},
					 {type = 0,id = 712,count = 1,job=2},
					 {type = 0,id = 713,count = 1,job=3},
					 {type = 0,id = 900,count = 5},--需要霸者结晶
				},--需要法宝

			award={{type=0,id = 714,count = 1,job=1,bind=1},
			       {type=0,id = 715,count = 1,job=2,bind=1},
			       {type=0,id = 716,count = 1,job=3,bind=1}},
			desc="<(c0xFF64af3a)n金刚石800颗>",
		},
		{
			level=5,
			needDiamond=1100,--金刚石数量
			appearancId = 5,  -- 内观特效ID
			consume={
			         {type = 0,id = 714,count = 1,job=1},
					 {type = 0,id = 715,count = 1,job=2},
					 {type = 0,id = 716,count = 1,job=3},
					 {type = 0,id = 900,count = 7},--需要霸者结晶
				},--需要法宝

			award={{type=0,id = 717,count = 1,job=1,bind=1},
			       {type=0,id = 718,count = 1,job=2,bind=1},
			       {type=0,id = 719,count = 1,job=3,bind=1}},
			desc="<(c0xFF64af3a)n金刚石1100颗>",
		},
		{
			level=6,
			needDiamond=1500,--金刚石数量
			appearancId = 6,  -- 内观特效ID
			consume={
			     {type = 0,id = 717,count = 1,job=1},
				 {type = 0,id = 718,count = 1,job=2},
				 {type = 0,id = 719,count = 1,job=3},
				 {type = 0,id = 900,count = 9},--需要霸者结晶
				},--需要法宝

			award={{type=0,id = 720,count = 1,job=1,bind=1},
			       {type=0,id = 721,count = 1,job=2,bind=1},
			       {type=0,id = 722,count = 1,job=3,bind=1}},
			desc="<(c0xFF64af3a)n金刚石1500颗>",
		},
		--下面如果配置的话 consume消耗材料一定放在最后面 记住
		{
			level=7,
			needDiamond=2000,--金刚石数量
			appearancId = 8,  -- 内观特效ID
			consume={
			         {type = 0,id = 720,count = 1,job=1},
					 {type = 0,id = 721,count = 1,job=2},
					 {type = 0,id = 722,count = 1,job=3},
					  {type = 0,id = 900,count = 12},--需要霸者结晶
				},--需要法宝

			award={{type=0,id = 723,count = 1,job=1,bind=1},
			       {type=0,id = 724,count = 1,job=2,bind=1},
			       {type=0,id = 725,count = 1,job=3,bind=1}},
			desc="<(c0xFF64af3a)n金刚石2000颗>",
		},
		{
			level=8,
			needDiamond=2600,--金刚石数量
			appearancId = 7,  -- 内观特效ID
			consume={
			      {type = 0,id = 723,count = 1,job=1},
				 {type = 0,id = 724,count = 1,job=2},
				 {type = 0,id = 725,count = 1,job=3},
				  {type = 0,id = 900,count = 16},--需要霸者结晶
				},--需要法宝

			award={{type=0,id = 726,count = 1,job=1,bind=1},
			       {type=0,id = 727,count = 1,job=2,bind=1},
			       {type=0,id = 728,count = 1,job=3,bind=1}},
			desc="<(c0xFF64af3a)n金刚石2600颗>",
		},
		{
			level=9,
			needDiamond=3300,--金刚石数量
			appearancId = 9,  -- 内观特效ID
			consume={        
			     {type = 0,id = 726,count = 1,job=1},
				 {type = 0,id = 727,count = 1,job=2},
				 {type = 0,id = 728,count = 1,job=3},
				  {type = 0,id = 900,count = 21},--需要霸者结晶
				},--需要法宝

			award={{type=0,id = 729,count = 1,job=1,bind=1},
			       {type=0,id = 730,count = 1,job=2,bind=1},
			       {type=0,id = 731,count = 1,job=3,bind=1}},
			desc="<(c0xFF64af3a)n金刚石3300颗>",
		},
		{
			level=10,
			needDiamond=4100,--金刚石数量
			appearancId = 10,  -- 内观特效ID
			consume={   
			      {type = 0,id = 729,count = 1,job=1},
				 {type = 0,id = 730,count = 1,job=2},
				 {type = 0,id = 731,count = 1,job=3},
				  {type = 0,id = 900,count = 27},--需要霸者结晶
				},--需要法宝

			award={{type=0,id = 732,count = 1,job=1,bind=1},
			       {type=0,id = 733,count = 1,job=2,bind=1},
			       {type=0,id = 734,count = 1,job=3,bind=1}},
			desc="<(c0xFF64af3a)n金刚石4100颗>",
		},
		
	},
	EquipNecklace =  --幸运项链
	{
		--2转
		{
			index=1,
			rate=60,
			consume={{type = 0,id = 936,count = 100}},
			items={{type=0,id=311,count=1,job=1},{type=0,id=317,count=1,job=2},{type=0,id=323,count=1,job=3}},
		},
		--4转
		{
			index=2,
			rate=60,
			consume={{type = 0,id = 936,count = 100}},
			items={{type=0,id=329,count=1,job=1},{type=0,id=335,count=1,job=2},{type=0,id=341,count=1,job=3}},
		},
		--6转
		{
			index=3,
			rate=60,
			consume={{type = 0,id = 936,count = 100}},
			items={{type=0,id=347,count=1,job=1},{type=0,id=353,count=1,job=2},{type=0,id=359,count=1,job=3}},
		},
		--8转
		{
			index=4,
			rate=60,
			consume={{type = 0,id = 936,count = 100}},
			items={{type=0,id=365,count=1,job=1},{type=0,id=371,count=1,job=2},{type=0,id=377,count=1,job=3}},
		},
	},
	
	--材料兑换金刚石
	ExChangeMaterial = 
	{
		{
			consume={{type = 0,id = 529,count = 1}},
			award = {{type = 0,id = 936,count = 5}},
		},
		{
			consume={{type = 0,id = 528,count = 1}},
			award = {{type = 0,id = 936,count = 10}},
		},
		{
			consume={{type = 0,id = 688,count = 1}},
			award = {{type = 0,id = 936,count = 20}},
		},
		{
			consume={{type = 0,id = 689,count = 1}},
			award = {{type = 0,id = 936,count = 30}},
		},						
	}
}