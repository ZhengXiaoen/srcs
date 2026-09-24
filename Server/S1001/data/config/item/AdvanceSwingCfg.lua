-- ³á°ò»ÃÓð

AdvanceSwingCfg = {
	-- ³á°ò½á¾§ÎïÆ·ID
	swingCrystalItemId = 5661,
	
	-- Ã¿Ò»½×µÄ×î¸ßµÈ¼¶
	classMaxLevels = { 5, 10, 15, 20, 25, 30, 35, 40, 45, 50 },
	
	-- ²»ÄÜ¼õÉÙ³á°ò£¬Ö»ÄÜÔÚºóÃæÔö¼Ó
	swingList = {
		-- ³á°ò 1
		{
			itemId = 5657, --
			
			-- ³á°òÀàÐÍ£º1 Îª»ÃÓð³á°ò, 2 Îª¾ø°æ³á°ò
			swingType = 1,
			
			-- Ã¿½×µÄ³á°òÍâ¹Û
			swingShowIds = {26,27,28,29,30,30,30,30,30,30}, 
			
			-- Í¼±ê
			iconIds = {30268,30269,30270,30271,30272,30272,30272,30272,30272,30272}, 
			
			--³á°òid(C++ÒªÓÃ)
			swingIds = {5662,5663,5664,5665,5666,7868,7869,7870,7871,7872},
			
			-- Éý½×ÏûºÄ³á°òÊýÁ¿(µÚ1¸ö´ú±í0µ½1½×)
			classConsumeCounts = { 1,4,8,16,32,64,128,256,512,800},
			
			-- Éý¼¶ÏûºÄ³á°ò½á¾§ÊýÁ¿(µÚ1¸ö´ú±í0µ½1¼¶)
			levelConsumeCounts = {2,4,6,8,10,12,14,16,18,20,23,27,31,35,40,45,50,56,62,68,74,81,88,96,103,110,117,124,131,138,145,152,159,166,173,180,187,194,201,208,215,222,229,236,243,250,257,264,271,278},
			
			-- ½×¼¶ÊôÐÔ
			classAttrs = {
				-- Õ½

					-- -- (a1) --
					-- {
					-- 	{type=(a2),value=(a3)},
			    	-- 	{type=(a4),value=(a5)},
					-- 	{type=(a6),value=(a7)},
					-- 	{type=(a8),value=(a9)},

		    		-- },

				{
										-- 1½× --
					{
						{type=9,value=125},
			    		{type=11,value=262},
						{type=5,value=3120},
						{type=7,value=315},

		    		},
					-- Éý½×1 --
					{
						{type=9,value=325},
			    		{type=11,value=682},
						{type=5,value=8320},
						{type=7,value=840},

		    		},
					-- Éý½×2 --
					{
						{type=9,value=614},
			    		{type=11,value=1288},
						{type=5,value=16640},
						{type=7,value=1681},

		    		},
					-- Éý½×3 --
					{
						{type=9,value=1080},
			    		{type=11,value=2266},
						{type=5,value=31200},
						{type=7,value=3152},

		    		},
					-- Éý½×4 --
					{
						{type=9,value=1760},
			    		{type=11,value=3696},
						{type=5,value=57200},
						{type=7,value=5778},

		    		},
		-- Éý½×6 --
					{
						{type=9,value=2440},
						{type=11,value=5126},
						{type=5,value=83200},
						{type=7,value=8004},

		    		},	

					-- Éý½×7 --
					{
						{type=9,value=3120},
						{type=11,value=6556},
						{type=5,value=109200},
						{type=7,value=10430},
		    		},	

					-- Éý½×8 --
					{
						{type=9,value=3800},
						{type=11,value=7986},
						{type=5,value=135200},
						{type=7,value=12856},
		    		},

					-- Éý½×9 --
					{
						{type=9,value=4480},
						{type=11,value=9416},
						{type=5,value=161200},
						{type=7,value=15282},
		    		},	

					-- Éý½×10 --
					{
						{type=9,value=5160},
						{type=11,value=10846},
						{type=5,value=187200},
						{type=7,value=17708},
		    		},	    		
		    	},	 		    		 
		    	
		    	-- ·¨
				{
										-- 1½× --
					{
						{type=13,value=125},
			    		{type=15,value=262},
						{type=5,value=803},
						{type=7,value=3212},

		    		},
					-- Éý½×1 --
					{
						{type=13,value=325},
			    		{type=15,value=682},
						{type=5,value=2139},
						{type=7,value=8556},

		    		},
					-- Éý½×2 --
					{
						{type=13,value=614},
			    		{type=15,value=1288},
						{type=5,value=4278},
						{type=7,value=17112},

		    		},
					-- Éý½×3 --
					{
						{type=13,value=1080},
			    		{type=15,value=2266},
						{type=5,value=8021},
						{type=7,value=32084},

		    		},
					-- Éý½×4 --
					{
						{type=13,value=1760},
			    		{type=15,value=3696},
						{type=5,value=14705},
						{type=7,value=58820},

		    		},
					-- Éý½×6 --
					{
						{type=13,value=2440},
						{type=15,value=5126},
						{type=5,value=21389},
						{type=7,value=85556},

		    		},
					-- Éý½×7 --
					{
						{type=13,value=3120},
						{type=15,value=6556},
						{type=5,value=28073},
						{type=7,value=112292},
		    		},
					-- Éý½×8 --
					{
						{type=13,value=3800},
						{type=15,value=7986},
						{type=5,value=34757},
						{type=7,value=139028},
		    		},
					-- Éý½×9 --
					{
						{type=13,value=4480},
						{type=15,value=9416},
						{type=5,value=41441},
						{type=7,value=165764},
		    		},
					-- Éý½×10 --
					{
						{type=13,value=5160},
						{type=15,value=10846},
						{type=5,value=48125},
						{type=7,value=192500},
		    		},
		    		
		    	},	 
		    	
		    	-- µÀ
				{
										-- 1½× --
					{
						{type=17,value=125},
			    		{type=19,value=262},
						{type=5,value=1744},
						{type=7,value=1744},

		    		},
					-- Éý½×1 --
					{
						{type=17,value=325},
			    		{type=19,value=682},
						{type=5,value=4649},
						{type=7,value=4649},

		    		},
					-- Éý½×2 --
					{
						{type=17,value=614},
			    		{type=19,value=1288},
						{type=5,value=9297},
						{type=7,value=9297},

		    		},
					-- Éý½×3 --
					{
						{type=17,value=1080},
			    		{type=19,value=2266},
						{type=5,value=17431},
						{type=7,value=17431},

		    		},
					-- Éý½×4 --
					{
						{type=17,value=1760},
			    		{type=19,value=3696},
						{type=5,value=31956},
						{type=7,value=31956},

		    		},
					-- Éý½×6 --
					{
						{type=17,value=2440},
						{type=19,value=5126},
						{type=5,value=46481},
						{type=7,value=46481},

		    		},
					-- Éý½×7 --
					{
						{type=17,value=3120},
						{type=19,value=6556},
						{type=5,value=61006},
						{type=7,value=61006},

		    		},
					-- Éý½×8 --
					{
						{type=17,value=3800},
						{type=19,value=7986},
						{type=5,value=75531},
						{type=7,value=75531},

		    		},
					-- Éý½×9 --
					{
						{type=17,value=4480},
						{type=19,value=9416},
						{type=5,value=90056},
						{type=7,value=90056},
		    		},
					-- Éý½×10 --
					{
						{type=17,value=5160},
						{type=19,value=10846},
						{type=5,value=104581},
						{type=7,value=104581},
		    		},
		    		
		    	},	    	
		    	
			},
			
			-- µÈ¼¶ÊôÐÔ
			levelAttrs = {
				-- Õ½
					-- -- 	--Ä£¿é
					-- 			-- (a1) ¼¶ --
					-- {
					-- 	{type=(a2),value=(a3)},
			    	-- 	{type=(a4),value=(a5)},
					-- 	{type=(a6),value=(a7)},
					-- 	{type=(a8),value=(a9)},

		    		-- },



				{
													-- ·ÉÉý1 ¼¶ --
					{
						{type=9,value=38},
			    		{type=11,value=78},
						{type=5,value=1300},
						{type=7,value=131},

		    		},
								-- ·ÉÉý2 ¼¶ --
					{
						{type=9,value=75},
			    		{type=11,value=157},
						{type=5,value=2600},
						{type=7,value=263},

		    		},
								-- ·ÉÉý3 ¼¶ --
					{
						{type=9,value=112},
			    		{type=11,value=235},
						{type=5,value=3900},
						{type=7,value=394},

		    		},
								-- ·ÉÉý4 ¼¶ --
					{
						{type=9,value=150},
			    		{type=11,value=314},
						{type=5,value=5200},
						{type=7,value=525},

		    		},
								-- ·ÉÉý5 ¼¶ --
					{
						{type=9,value=188},
			    		{type=11,value=393},
						{type=5,value=6240},
						{type=7,value=630},

		    		},
								-- ·ÉÉý6 ¼¶ --
					{
						{type=9,value=248},
			    		{type=11,value=519},
						{type=5,value=8320},
						{type=7,value=840},

		    		},
								-- ·ÉÉý7 ¼¶ --
					{
						{type=9,value=308},
			    		{type=11,value=645},
						{type=5,value=10400},
						{type=7,value=1051},

		    		},
								-- ·ÉÉý8 ¼¶ --
					{
						{type=9,value=368},
			    		{type=11,value=771},
						{type=5,value=12480},
						{type=7,value=1261},

		    		},
								-- ·ÉÉý9 ¼¶ --
					{
						{type=9,value=428},
			    		{type=11,value=897},
						{type=5,value=14560},
						{type=7,value=1471},

		    		},
								-- ·ÉÉý10 ¼¶ --
					{
						{type=9,value=488},
			    		{type=11,value=1023},
						{type=5,value=16640},
						{type=7,value=1681},

		    		},
								-- ·ÉÉý11 ¼¶ --
					{
						{type=9,value=573},
			    		{type=11,value=1202},
						{type=5,value=20020},
						{type=7,value=2022},

		    		},
								-- ·ÉÉý12 ¼¶ --
					{
						{type=9,value=660},
			    		{type=11,value=1384},
						{type=5,value=23400},
						{type=7,value=2364},

		    		},
								-- ·ÉÉý13 ¼¶ --
					{
						{type=9,value=746},
			    		{type=11,value=1566},
						{type=5,value=26780},
						{type=7,value=2705},

		    		},
								-- ·ÉÉý14 ¼¶ --
					{
						{type=9,value=833},
			    		{type=11,value=1748},
						{type=5,value=30160},
						{type=7,value=3046},

		    		},
								-- ·ÉÉý15 ¼¶ --
					{
						{type=9,value=920},
			    		{type=11,value=1932},
						{type=5,value=33280},
						{type=7,value=3362},

		    		},
								-- ·ÉÉý16 ¼¶ --
					{
						{type=9,value=1060},
			    		{type=11,value=2225},
						{type=5,value=39260},
						{type=7,value=3966},

		    		},
								-- ·ÉÉý17 ¼¶ --
					{
						{type=9,value=1200},
			    		{type=11,value=2518},
						{type=5,value=45240},
						{type=7,value=4570},

		    		},
								-- ·ÉÉý18 ¼¶ --
					{
						{type=9,value=1339},
			    		{type=11,value=2811},
						{type=5,value=51220},
						{type=7,value=5174},

		    		},
								-- ·ÉÉý19 ¼¶ --
					{
						{type=9,value=1479},
			    		{type=11,value=3104},
						{type=5,value=57200},
						{type=7,value=5778},

		    		},
								-- ·ÉÉý20 ¼¶ --
					{
						{type=9,value=1619},
			    		{type=11,value=3399},
						{type=5,value=62400},
						{type=7,value=6303},

		    		},
								-- ·ÉÉý21 ¼¶ --
					{
						{type=9,value=1823},
			    		{type=11,value=3828},
						{type=5,value=72800},
						{type=7,value=7354},

		    		},
								-- ·ÉÉý22 ¼¶ --
					{
						{type=9,value=2028},
			    		{type=11,value=4257},
						{type=5,value=83200},
						{type=7,value=8404},

		    		},
								-- ·ÉÉý23 ¼¶ --
					{
						{type=9,value=2232},
			    		{type=11,value=4686},
						{type=5,value=93600},
						{type=7,value=9455},

		    		},
								-- ·ÉÉý24 ¼¶ --
					{
						{type=9,value=2436},
			    		{type=11,value=5115},
						{type=5,value=104000},
						{type=7,value=10505},

		    		},
								-- ·ÉÉý25 ¼¶ --
					{
						{type=9,value=2640},
			    		{type=11,value=5544},
						{type=5,value=114400},
						{type=7,value=11556},

		    		},
						--·ÉÉý26¼¶
					{	
						{type=9,value=2817},
						{type=11,value=5973},
						{type=5,value=124800},
						{type=7,value=12607},
					},	
						--·ÉÉý27¼¶
					{	
						{type=9,value=2994},
						{type=11,value=6402},
						{type=5,value=135200},
						{type=7,value=13658},
					},	
						--·ÉÉý28¼¶
					{	
						{type=9,value=3171},
						{type=11,value=6831},
						{type=5,value=145600},
						{type=7,value=14709},
					},	
						--·ÉÉý29¼¶
					{	
						{type=9,value=3348},
						{type=11,value=7260},
						{type=5,value=156000},
						{type=7,value=15760},
					},	
						--·ÉÉý30¼¶
					{	
						{type=9,value=3525},
						{type=11,value=7689},
						{type=5,value=166400},
						{type=7,value=16811},
					},	
						--·ÉÉý31¼¶
					{	
						{type=9,value=3702},
						{type=11,value=8118},
						{type=5,value=176800},
						{type=7,value=17862},
					},	
						--·ÉÉý32¼¶
					{	
						{type=9,value=3879},
						{type=11,value=8547},
						{type=5,value=187200},
						{type=7,value=18913},
					},	
						--·ÉÉý33¼¶
					{	
						{type=9,value=4056},
						{type=11,value=8976},
						{type=5,value=197600},
						{type=7,value=19964},
					},	
						--·ÉÉý34¼¶
					{	
						{type=9,value=4233},
						{type=11,value=9405},
						{type=5,value=208000},
						{type=7,value=21015},
					},	
						--·ÉÉý35¼¶
					{	
						{type=9,value=4410},
						{type=11,value=9834},
						{type=5,value=218400},
						{type=7,value=22066},
					},	
						--·ÉÉý36¼¶
					{	
						{type=9,value=4587},
						{type=11,value=10263},
						{type=5,value=228800},
						{type=7,value=23117},
					},	
						--·ÉÉý37¼¶
					{	
						{type=9,value=4764},
						{type=11,value=10692},
						{type=5,value=239200},
						{type=7,value=24168},
					},	
						--·ÉÉý38¼¶
					{	
						{type=9,value=4941},
						{type=11,value=11121},
						{type=5,value=249600},
						{type=7,value=25219},
					},	
						--·ÉÉý39¼¶
					{	
						{type=9,value=5118},
						{type=11,value=11550},
						{type=5,value=260000},
						{type=7,value=26270},
					},	
						--·ÉÉý40¼¶
					{	
						{type=9,value=5295},
						{type=11,value=11979},
						{type=5,value=270400},
						{type=7,value=27321},
					},	
						--·ÉÉý41¼¶
					{	
						{type=9,value=5472},
						{type=11,value=12408},
						{type=5,value=280800},
						{type=7,value=28372},
					},	
						--·ÉÉý42¼¶
					{	
						{type=9,value=5649},
						{type=11,value=12837},
						{type=5,value=291200},
						{type=7,value=29423},
					},	
						--·ÉÉý43¼¶
					{	
						{type=9,value=5826},
						{type=11,value=13266},
						{type=5,value=301600},
						{type=7,value=30474},
					},	
						--·ÉÉý44¼¶
					{	
						{type=9,value=6003},
						{type=11,value=13695},
						{type=5,value=312000},
						{type=7,value=31525},
					},	
						--·ÉÉý45¼¶
					{	
						{type=9,value=6180},
						{type=11,value=14124},
						{type=5,value=322400},
						{type=7,value=32576},
					},	
						--·ÉÉý46¼¶
					{	
						{type=9,value=6357},
						{type=11,value=14553},
						{type=5,value=332800},
						{type=7,value=33627},
					},	
						--·ÉÉý47¼¶
					{	
						{type=9,value=6534},
						{type=11,value=14982},
						{type=5,value=343200},
						{type=7,value=34678},
					},	
						--·ÉÉý48¼¶
					{	
						{type=9,value=6711},
						{type=11,value=15411},
						{type=5,value=353600},
						{type=7,value=35729},
					},	
						--·ÉÉý49¼¶
					{	
						{type=9,value=6888},
						{type=11,value=15840},
						{type=5,value=364000},
						{type=7,value=36780},
					},	
						--·ÉÉý50¼¶
					{	
						{type=9,value=7065},
						{type=11,value=16269},
						{type=5,value=374400},
						{type=7,value=37831},
					},			    		
		    	},	 
		    	
		    	-- ·¨
				{
													-- ·ÉÉý1 ¼¶ --
					{
						{type=13,value=38},
			    		{type=15,value=78},
						{type=5,value=335},
						{type=7,value=1340},

		    		},
								-- ·ÉÉý2 ¼¶ --
					{
						{type=13,value=75},
			    		{type=15,value=157},
						{type=5,value=669},
						{type=7,value=2676},

		    		},
								-- ·ÉÉý3 ¼¶ --
					{
						{type=13,value=112},
			    		{type=15,value=235},
						{type=5,value=1003},
						{type=7,value=4012},

		    		},
								-- ·ÉÉý4 ¼¶ --
					{
						{type=13,value=150},
			    		{type=15,value=314},
						{type=5,value=1337},
						{type=7,value=5348},

		    		},
								-- ·ÉÉý5 ¼¶ --
					{
						{type=13,value=188},
			    		{type=15,value=393},
						{type=5,value=1605},
						{type=7,value=6420},

		    		},
								-- ·ÉÉý6 ¼¶ --
					{
						{type=13,value=248},
			    		{type=15,value=519},
						{type=5,value=2139},
						{type=7,value=8556},

		    		},
								-- ·ÉÉý7 ¼¶ --
					{
						{type=13,value=308},
			    		{type=15,value=645},
						{type=5,value=2674},
						{type=7,value=10696},

		    		},
								-- ·ÉÉý8 ¼¶ --
					{
						{type=13,value=368},
			    		{type=15,value=771},
						{type=5,value=3209},
						{type=7,value=12836},

		    		},
								-- ·ÉÉý9 ¼¶ --
					{
						{type=13,value=428},
			    		{type=15,value=897},
						{type=5,value=3743},
						{type=7,value=14972},

		    		},
								-- ·ÉÉý10 ¼¶ --
					{
						{type=13,value=488},
			    		{type=15,value=1023},
						{type=5,value=4278},
						{type=7,value=17112},

		    		},
								-- ·ÉÉý11 ¼¶ --
					{
						{type=13,value=573},
			    		{type=15,value=1202},
						{type=5,value=5147},
						{type=7,value=20588},

		    		},
								-- ·ÉÉý12 ¼¶ --
					{
						{type=13,value=660},
			    		{type=15,value=1384},
						{type=5,value=6016},
						{type=7,value=24064},

		    		},
								-- ·ÉÉý13 ¼¶ --
					{
						{type=13,value=746},
			    		{type=15,value=1566},
						{type=5,value=6885},
						{type=7,value=27540},

		    		},
								-- ·ÉÉý14 ¼¶ --
					{
						{type=13,value=833},
			    		{type=15,value=1748},
						{type=5,value=7754},
						{type=7,value=31016},

		    		},
								-- ·ÉÉý15 ¼¶ --
					{
						{type=13,value=920},
			    		{type=15,value=1932},
						{type=5,value=8556},
						{type=7,value=34224},

		    		},
								-- ·ÉÉý16 ¼¶ --
					{
						{type=13,value=1060},
			    		{type=15,value=2225},
						{type=5,value=10093},
						{type=7,value=40372},

		    		},
								-- ·ÉÉý17 ¼¶ --
					{
						{type=13,value=1200},
			    		{type=15,value=2518},
						{type=5,value=11630},
						{type=7,value=46520},

		    		},
								-- ·ÉÉý18 ¼¶ --
					{
						{type=13,value=1339},
			    		{type=15,value=2811},
						{type=5,value=13168},
						{type=7,value=52672},

		    		},
								-- ·ÉÉý19 ¼¶ --
					{
						{type=13,value=1479},
			    		{type=15,value=3104},
						{type=5,value=14705},
						{type=7,value=58820},

		    		},
								-- ·ÉÉý20 ¼¶ --
					{
						{type=13,value=1619},
			    		{type=15,value=3399},
						{type=5,value=16042},
						{type=7,value=64168},

		    		},
								-- ·ÉÉý21 ¼¶ --
					{
						{type=13,value=1823},
			    		{type=15,value=3828},
						{type=5,value=18715},
						{type=7,value=74860},

		    		},
								-- ·ÉÉý22 ¼¶ --
					{
						{type=13,value=2028},
			    		{type=15,value=4257},
						{type=5,value=21389},
						{type=7,value=85556},

		    		},
								-- ·ÉÉý23 ¼¶ --
					{
						{type=13,value=2232},
			    		{type=15,value=4686},
						{type=5,value=24062},
						{type=7,value=96248},

		    		},
								-- ·ÉÉý24 ¼¶ --
					{
						{type=13,value=2436},
			    		{type=15,value=5115},
						{type=5,value=26736},
						{type=7,value=106944},

		    		},
								-- ·ÉÉý25 ¼¶ --
					{
						{type=13,value=2640},
			    		{type=15,value=5544},
						{type=5,value=29409},
						{type=7,value=117636},

		    		},
						--·ÉÉý26¼¶	
					{		
						{type=13,value=2817},	
						{type=15,value=5973},	
						{type=5,value=32082},	
						{type=7,value=128328},	
					},		
						--·ÉÉý27¼¶	
					{		
						{type=13,value=2994},	
						{type=15,value=6402},	
						{type=5,value=34755},	
						{type=7,value=139020},	
					},		
						--·ÉÉý28¼¶	
					{		
						{type=13,value=3171},	
						{type=15,value=6831},	
						{type=5,value=37428},	
						{type=7,value=149712},	
					},		
						--·ÉÉý29¼¶	
					{		
						{type=13,value=3348},	
						{type=15,value=7260},	
						{type=5,value=40101},	
						{type=7,value=160404},	
					},		
						--·ÉÉý30¼¶	
					{		
						{type=13,value=3525},	
						{type=15,value=7689},	
						{type=5,value=42774},	
						{type=7,value=171096},	
					},		
						--·ÉÉý31¼¶	
					{		
						{type=13,value=3702},	
						{type=15,value=8118},	
						{type=5,value=45447},	
						{type=7,value=181788},	
					},		
						--·ÉÉý32¼¶	
					{		
						{type=13,value=3879},	
						{type=15,value=8547},	
						{type=5,value=48120},	
						{type=7,value=192480},	
					},		
						--·ÉÉý33¼¶	
					{		
						{type=13,value=4056},	
						{type=15,value=8976},	
						{type=5,value=50793},	
						{type=7,value=203172},	
					},		
						--·ÉÉý34¼¶	
					{		
						{type=13,value=4233},	
						{type=15,value=9405},	
						{type=5,value=53466},	
						{type=7,value=213864},	
					},		
						--·ÉÉý35¼¶	
					{		
						{type=13,value=4410},	
						{type=15,value=9834},	
						{type=5,value=56139},	
						{type=7,value=224556},	
					},		
						--·ÉÉý36¼¶	
					{		
						{type=13,value=4587},	
						{type=15,value=10263},	
						{type=5,value=58812},	
						{type=7,value=235248},	
					},		
						--·ÉÉý37¼¶	
					{		
						{type=13,value=4764},	
						{type=15,value=10692},	
						{type=5,value=61485},	
						{type=7,value=245940},	
					},		
						--·ÉÉý38¼¶	
					{		
						{type=13,value=4941},	
						{type=15,value=11121},	
						{type=5,value=64158},	
						{type=7,value=256632},	
					},		
						--·ÉÉý39¼¶	
					{		
						{type=13,value=5118},	
						{type=15,value=11550},	
						{type=5,value=66831},	
						{type=7,value=267324},	
					},		
						--·ÉÉý40¼¶	
					{		
						{type=13,value=5295},	
						{type=15,value=11979},	
						{type=5,value=69504},	
						{type=7,value=278016},	
					},		
						--·ÉÉý41¼¶	
					{		
						{type=13,value=5472},	
						{type=15,value=12408},	
						{type=5,value=72177},	
						{type=7,value=288708},	
					},		
						--·ÉÉý42¼¶	
					{		
						{type=13,value=5649},	
						{type=15,value=12837},	
						{type=5,value=74850},	
						{type=7,value=299400},	
					},		
						--·ÉÉý43¼¶	
					{		
						{type=13,value=5826},	
						{type=15,value=13266},	
						{type=5,value=77523},	
						{type=7,value=310092},	
					},		
						--·ÉÉý44¼¶	
					{		
						{type=13,value=6003},	
						{type=15,value=13695},	
						{type=5,value=80196},	
						{type=7,value=320784},	
					},		
						--·ÉÉý45¼¶	
					{		
						{type=13,value=6180},	
						{type=15,value=14124},	
						{type=5,value=82869},	
						{type=7,value=331476},	
					},		
						--·ÉÉý46¼¶	
					{		
						{type=13,value=6357},	
						{type=15,value=14553},	
						{type=5,value=85542},	
						{type=7,value=342168},	
					},		
						--·ÉÉý47¼¶	
					{		
						{type=13,value=6534},	
						{type=15,value=14982},	
						{type=5,value=88215},	
						{type=7,value=352860},	
					},		
						--·ÉÉý48¼¶	
					{		
						{type=13,value=6711},	
						{type=15,value=15411},	
						{type=5,value=90888},	
						{type=7,value=363552},	
					},		
						--·ÉÉý49¼¶	
					{		
						{type=13,value=6888},	
						{type=15,value=15840},	
						{type=5,value=93561},	
						{type=7,value=374244},	
					},		
						--·ÉÉý50¼¶	
					{		
						{type=13,value=7065},	
						{type=15,value=16269},	
						{type=5,value=96234},	
						{type=7,value=384936},	
					},				    		
		    	},	 
		    	
		    	-- µÀ
				{
													-- ·ÉÉý1 ¼¶ --
					{
						{type=17,value=38},
			    		{type=19,value=78},
						{type=5,value=727},
						{type=7,value=727},

		    		},
								-- ·ÉÉý2 ¼¶ --
					{
						{type=17,value=75},
			    		{type=19,value=157},
						{type=5,value=1453},
						{type=7,value=1453},

		    		},
								-- ·ÉÉý3 ¼¶ --
					{
						{type=17,value=112},
			    		{type=19,value=235},
						{type=5,value=2179},
						{type=7,value=2179},

		    		},
								-- ·ÉÉý4 ¼¶ --
					{
						{type=17,value=150},
			    		{type=19,value=314},
						{type=5,value=2906},
						{type=7,value=2906},

		    		},
								-- ·ÉÉý5 ¼¶ --
					{
						{type=17,value=188},
			    		{type=19,value=393},
						{type=5,value=3487},
						{type=7,value=3487},

		    		},
								-- ·ÉÉý6 ¼¶ --
					{
						{type=17,value=248},
			    		{type=19,value=519},
						{type=5,value=4649},
						{type=7,value=4649},

		    		},
								-- ·ÉÉý7 ¼¶ --
					{
						{type=17,value=308},
			    		{type=19,value=645},
						{type=5,value=5811},
						{type=7,value=5811},

		    		},
								-- ·ÉÉý8 ¼¶ --
					{
						{type=17,value=368},
			    		{type=19,value=771},
						{type=5,value=6973},
						{type=7,value=6973},

		    		},
								-- ·ÉÉý9 ¼¶ --
					{
						{type=17,value=428},
			    		{type=19,value=897},
						{type=5,value=8135},
						{type=7,value=8135},

		    		},
								-- ·ÉÉý10 ¼¶ --
					{
						{type=17,value=488},
			    		{type=19,value=1023},
						{type=5,value=9297},
						{type=7,value=9297},

		    		},
								-- ·ÉÉý11 ¼¶ --
					{
						{type=17,value=573},
			    		{type=19,value=1202},
						{type=5,value=11185},
						{type=7,value=11185},

		    		},
								-- ·ÉÉý12 ¼¶ --
					{
						{type=17,value=660},
			    		{type=19,value=1384},
						{type=5,value=13073},
						{type=7,value=13073},

		    		},
								-- ·ÉÉý13 ¼¶ --
					{
						{type=17,value=746},
			    		{type=19,value=1566},
						{type=5,value=14961},
						{type=7,value=14961},

		    		},
								-- ·ÉÉý14 ¼¶ --
					{
						{type=17,value=833},
			    		{type=19,value=1748},
						{type=5,value=16850},
						{type=7,value=16850},

		    		},
								-- ·ÉÉý15 ¼¶ --
					{
						{type=17,value=920},
			    		{type=19,value=1932},
						{type=5,value=18593},
						{type=7,value=18593},

		    		},
								-- ·ÉÉý16 ¼¶ --
					{
						{type=17,value=1060},
			    		{type=19,value=2225},
						{type=5,value=21933},
						{type=7,value=21933},

		    		},
								-- ·ÉÉý17 ¼¶ --
					{
						{type=17,value=1200},
			    		{type=19,value=2518},
						{type=5,value=25274},
						{type=7,value=25274},

		    		},
								-- ·ÉÉý18 ¼¶ --
					{
						{type=17,value=1339},
			    		{type=19,value=2811},
						{type=5,value=28615},
						{type=7,value=28615},

		    		},
								-- ·ÉÉý19 ¼¶ --
					{
						{type=17,value=1479},
			    		{type=19,value=3104},
						{type=5,value=31956},
						{type=7,value=31956},

		    		},
								-- ·ÉÉý20 ¼¶ --
					{
						{type=17,value=1619},
			    		{type=19,value=3399},
						{type=5,value=34861},
						{type=7,value=34861},

		    		},
								-- ·ÉÉý21 ¼¶ --
					{
						{type=17,value=1823},
			    		{type=19,value=3828},
						{type=5,value=40671},
						{type=7,value=40671},

		    		},
								-- ·ÉÉý22 ¼¶ --
					{
						{type=17,value=2028},
			    		{type=19,value=4257},
						{type=5,value=46481},
						{type=7,value=46481},

		    		},
								-- ·ÉÉý23 ¼¶ --
					{
						{type=17,value=2232},
			    		{type=19,value=4686},
						{type=5,value=52291},
						{type=7,value=52291},

		    		},
								-- ·ÉÉý24 ¼¶ --
					{
						{type=17,value=2436},
			    		{type=19,value=5115},
						{type=5,value=58101},
						{type=7,value=58101},

		    		},
								-- ·ÉÉý25 ¼¶ --
					{
						{type=17,value=2640},
			    		{type=19,value=5544},
						{type=5,value=63911},
						{type=7,value=63911},

		    		},
						--·ÉÉý26¼¶		
					{			
						{type=17,value=2817},		
						{type=19,value=5973},		
						{type=5,value=69721},		
						{type=7,value=69721},		
					},			
						--·ÉÉý27¼¶		
					{			
						{type=17,value=2994},		
						{type=19,value=6402},		
						{type=5,value=75531},		
						{type=7,value=75531},		
					},			
						--·ÉÉý28¼¶		
					{			
						{type=17,value=3171},		
						{type=19,value=6831},		
						{type=5,value=81341},		
						{type=7,value=81341},		
					},			
						--·ÉÉý29¼¶		
					{			
						{type=17,value=3348},		
						{type=19,value=7260},		
						{type=5,value=87151},		
						{type=7,value=87151},		
					},			
						--·ÉÉý30¼¶		
					{			
						{type=17,value=3525},		
						{type=19,value=7689},		
						{type=5,value=92961},		
						{type=7,value=92961},		
					},			
						--·ÉÉý31¼¶		
					{			
						{type=17,value=3702},		
						{type=19,value=8118},		
						{type=5,value=98771},		
						{type=7,value=98771},		
					},			
						--·ÉÉý32¼¶		
					{			
						{type=17,value=3879},		
						{type=19,value=8547},		
						{type=5,value=104581},		
						{type=7,value=104581},		
					},			
						--·ÉÉý33¼¶		
					{			
						{type=17,value=4056},		
						{type=19,value=8976},		
						{type=5,value=110391},		
						{type=7,value=110391},		
					},			
						--·ÉÉý34¼¶		
					{			
						{type=17,value=4233},		
						{type=19,value=9405},		
						{type=5,value=116201},		
						{type=7,value=116201},		
					},			
						--·ÉÉý35¼¶		
					{			
						{type=17,value=4410},		
						{type=19,value=9834},		
						{type=5,value=122011},		
						{type=7,value=122011},		
					},			
						--·ÉÉý36¼¶		
					{			
						{type=17,value=4587},		
						{type=19,value=10263},		
						{type=5,value=127821},		
						{type=7,value=127821},		
					},			
						--·ÉÉý37¼¶		
					{			
						{type=17,value=4764},		
						{type=19,value=10692},		
						{type=5,value=133631},		
						{type=7,value=133631},		
					},			
						--·ÉÉý38¼¶		
					{			
						{type=17,value=4941},		
						{type=19,value=11121},		
						{type=5,value=139441},		
						{type=7,value=139441},		
					},			
						--·ÉÉý39¼¶		
					{			
						{type=17,value=5118},		
						{type=19,value=11550},		
						{type=5,value=145251},		
						{type=7,value=145251},		
					},			
						--·ÉÉý40¼¶		
					{			
						{type=17,value=5295},		
						{type=19,value=11979},		
						{type=5,value=151061},		
						{type=7,value=151061},		
					},			
						--·ÉÉý41¼¶		
					{			
						{type=17,value=5472},		
						{type=19,value=12408},		
						{type=5,value=156871},		
						{type=7,value=156871},		
					},			
						--·ÉÉý42¼¶		
					{			
						{type=17,value=5649},		
						{type=19,value=12837},		
						{type=5,value=162681},		
						{type=7,value=162681},		
					},			
						--·ÉÉý43¼¶		
					{			
						{type=17,value=5826},		
						{type=19,value=13266},		
						{type=5,value=168491},		
						{type=7,value=168491},		
					},			
						--·ÉÉý44¼¶		
					{			
						{type=17,value=6003},		
						{type=19,value=13695},		
						{type=5,value=174301},		
						{type=7,value=174301},		
					},			
						--·ÉÉý45¼¶		
					{			
						{type=17,value=6180},		
						{type=19,value=14124},		
						{type=5,value=180111},		
						{type=7,value=180111},		
					},			
						--·ÉÉý46¼¶		
					{			
						{type=17,value=6357},		
						{type=19,value=14553},		
						{type=5,value=185921},		
						{type=7,value=185921},		
					},			
						--·ÉÉý47¼¶		
					{			
						{type=17,value=6534},		
						{type=19,value=14982},		
						{type=5,value=191731},		
						{type=7,value=191731},		
					},			
						--·ÉÉý48¼¶		
					{			
						{type=17,value=6711},		
						{type=19,value=15411},		
						{type=5,value=197541},		
						{type=7,value=197541},		
					},			
						--·ÉÉý49¼¶		
					{			
						{type=17,value=6888},		
						{type=19,value=15840},		
						{type=5,value=203351},		
						{type=7,value=203351},		
					},			
						--·ÉÉý50¼¶		
					{			
						{type=17,value=7065},		
						{type=19,value=16269},		
						{type=5,value=209161},		
						{type=7,value=209161},		
					},					    		
		    		
		    	},	 
			}, 
		},
		
		-- ³á°ò 2
		{
			itemId = 5658,
			
			-- ³á°òÀàÐÍ£º1 Îª»ÃÓð³á°ò, 2 Îª¾ø°æ³á°ò
			swingType = 1,
			
			-- Ã¿½×µÄ³á°òÍâ¹Û
			swingShowIds = {31,32,33,34,35,35,35,35,35,35}, 
			-- ÄÚ¹ÛÌØÐ§
			iconIds = {30273,30274,30275,30276,30277,30277,30277,30277,30277,30277}, 
			--³á°òid
			swingIds = {5667,5668,5669,5670,5671,7873,7874,7875,7876,7877},
			-- Éý½×ÏûºÄ³á°òÊýÁ¿(µÚ1¸ö´ú±í1½×)
			classConsumeCounts = { 1,4,8,16,32,64,128,256,512,800},
			
			-- Éý¼¶ÏûºÄ³á°ò½á¾§ÊýÁ¿
			levelConsumeCounts = {2,4,6,8,10,12,14,16,18,20,23,27,31,35,40,45,50,56,62,68,74,81,88,96,103,110,117,124,131,138,145,152,159,166,173,180,187,194,201,208,215,222,229,236,243,250,257,264,271,278},
						
			-- ½×¼¶ÊôÐÔ
			classAttrs = {
				-- Õ½
					-- -- (a1) --
					-- {
					-- 	{type=(a2),value=(a3)},
			    	-- 	{type=(a4),value=(a5)},
					-- 	{type=(a6),value=(a7)},

		    		-- },

				{

									-- 1½× --
					{
						{type=9,value=125},
			    		{type=11,value=262},
						{type=29,value=12},

		    		},
					-- 2½× --
					{
						{type=9,value=325},
			    		{type=11,value=682},
						{type=29,value=32},

		    		},
					-- 3½× --
					{
						{type=9,value=614},
			    		{type=11,value=1288},
						{type=29,value=64},

		    		},
					-- 4½× --
					{
						{type=9,value=1080},
			    		{type=11,value=2266},
						{type=29,value=120},

		    		},
					-- 5½× --
					{
						{type=9,value=1760},
			    		{type=11,value=3696},
						{type=29,value=220},

		    		},
					-- 6½× --
					{
						{type=9,value=2440},
						{type=11,value=5126},
						{type=29,value=320},

		    		},

					-- 7½× --
					{
						{type=9,value=3120},
						{type=11,value=6556},
						{type=29,value=420},

		    		},

					-- 8½× --
					{
						{type=9,value=3800},
						{type=11,value=7986},
						{type=29,value=520},
		    		},

					-- 9½× --
					{
						{type=9,value=4480},
						{type=11,value=9416},
						{type=29,value=620},
		    		},

					-- 10½× --
					{
						{type=9,value=5160},
						{type=11,value=10846},
						{type=29,value=720},
		    		},

			},

		    	
		    	-- ·¨
				{
					
									-- 1½× --
					{
						{type=13,value=125},
			    		{type=15,value=262},
						{type=29,value=12},

		    		},
					-- 2½× --
					{
						{type=13,value=325},
			    		{type=15,value=682},
						{type=29,value=32},

		    		},
					-- 3½× --
					{
						{type=13,value=614},
			    		{type=15,value=1288},
						{type=29,value=64},

		    		},
					-- 4½× --
					{
						{type=13,value=1080},
			    		{type=15,value=2266},
						{type=29,value=120},

		    		},
					-- 5½× --
					{
						{type=13,value=1760},
			    		{type=15,value=3696},
						{type=29,value=220},

		    		},

					-- 6½× --
					{
						{type=13,value=2440},
						{type=15,value=5126},
						{type=29,value=320},

		    		},

					-- 7½× --
					{
						{type=13,value=3120},
						{type=15,value=6556},
						{type=29,value=420},

		    		},

					-- 8½× --
					{
						{type=13,value=3800},
						{type=15,value=7986},
						{type=29,value=520},
		    		},

					-- 9½× --
					{
						{type=13,value=4480},
						{type=15,value=9416},
						{type=29,value=620},
		    		},

					-- 10½× --
					{
						{type=13,value=5160},
						{type=15,value=10846},
						{type=29,value=720},
		    		},
		    		
		    	},	 
		    	
		    	-- µÀ
				{
		
										-- 1½× --
					{
						{type=17,value=125},
			    		{type=19,value=262},
						{type=29,value=12},

		    		},
					-- 2½× --
					{
						{type=17,value=325},
			    		{type=19,value=682},
						{type=29,value=32},

		    		},
					-- 3½× --
					{
						{type=17,value=614},
			    		{type=19,value=1288},
						{type=29,value=64},

		    		},
					-- 4½× --
					{
						{type=17,value=1080},
			    		{type=19,value=2266},
						{type=29,value=120},

		    		},
					-- 5½× --
					{
						{type=17,value=1760},
			    		{type=19,value=3696},
						{type=29,value=220},

		    		},
					-- 6½× --
					{
						{type=17,value=2440},
						{type=19,value=5126},
						{type=29,value=320},

		    		},

					-- 7½× --
					{
						{type=17,value=3120},
						{type=19,value=6556},
						{type=29,value=420},

		    		},

					-- 8½× --
					{
						{type=17,value=3800},
						{type=19,value=7986},
						{type=29,value=520},
		    		},

					-- 9½× --
					{
						{type=17,value=4480},
						{type=19,value=9416},
						{type=29,value=620},
		    		},

					-- 10½× --
					{
						{type=17,value=5160},
						{type=19,value=10846},
						{type=29,value=720},
		    		},
		    		
		    	},	    	
		    	
			},
			
			-- µÈ¼¶ÊôÐÔ
			levelAttrs = {
				-- Õ½

									-- -- 	--Ä£¿é
								-- (a1) ¼¶ --
					-- {
					-- 	{type=(a2),value=(a3)},
			    	-- 	{type=(a4),value=(a5)},
					-- 	{type=(a6),value=(a7)},

		    		-- },
				{
													-- ·ÉÉý1 ¼¶ --
					{
						{type=9,value=38},
			    		{type=11,value=78},
						{type=29,value=5},

		    		},
								-- ·ÉÉý2 ¼¶ --
					{
						{type=9,value=75},
			    		{type=11,value=157},
						{type=29,value=10},

		    		},
								-- ·ÉÉý3 ¼¶ --
					{
						{type=9,value=112},
			    		{type=11,value=235},
						{type=29,value=15},

		    		},
								-- ·ÉÉý4 ¼¶ --
					{
						{type=9,value=150},
			    		{type=11,value=314},
						{type=29,value=20},

		    		},
								-- ·ÉÉý5 ¼¶ --
					{
						{type=9,value=188},
			    		{type=11,value=393},
						{type=29,value=24},

		    		},
								-- ·ÉÉý6 ¼¶ --
					{
						{type=9,value=248},
			    		{type=11,value=519},
						{type=29,value=32},

		    		},
								-- ·ÉÉý7 ¼¶ --
					{
						{type=9,value=308},
			    		{type=11,value=645},
						{type=29,value=40},

		    		},
								-- ·ÉÉý8 ¼¶ --
					{
						{type=9,value=368},
			    		{type=11,value=771},
						{type=29,value=48},

		    		},
								-- ·ÉÉý9 ¼¶ --
					{
						{type=9,value=428},
			    		{type=11,value=897},
						{type=29,value=56},

		    		},
								-- ·ÉÉý10 ¼¶ --
					{
						{type=9,value=488},
			    		{type=11,value=1023},
						{type=29,value=64},

		    		},
								-- ·ÉÉý11 ¼¶ --
					{
						{type=9,value=573},
			    		{type=11,value=1202},
						{type=29,value=77},

		    		},
								-- ·ÉÉý12 ¼¶ --
					{
						{type=9,value=660},
			    		{type=11,value=1384},
						{type=29,value=90},

		    		},
								-- ·ÉÉý13 ¼¶ --
					{
						{type=9,value=746},
			    		{type=11,value=1566},
						{type=29,value=103},

		    		},
								-- ·ÉÉý14 ¼¶ --
					{
						{type=9,value=833},
			    		{type=11,value=1748},
						{type=29,value=116},

		    		},
								-- ·ÉÉý15 ¼¶ --
					{
						{type=9,value=920},
			    		{type=11,value=1932},
						{type=29,value=128},

		    		},
								-- ·ÉÉý16 ¼¶ --
					{
						{type=9,value=1060},
			    		{type=11,value=2225},
						{type=29,value=151},

		    		},
								-- ·ÉÉý17 ¼¶ --
					{
						{type=9,value=1200},
			    		{type=11,value=2518},
						{type=29,value=174},

		    		},
								-- ·ÉÉý18 ¼¶ --
					{
						{type=9,value=1339},
			    		{type=11,value=2811},
						{type=29,value=197},

		    		},
								-- ·ÉÉý19 ¼¶ --
					{
						{type=9,value=1479},
			    		{type=11,value=3104},
						{type=29,value=220},

		    		},
								-- ·ÉÉý20 ¼¶ --
					{
						{type=9,value=1619},
			    		{type=11,value=3399},
						{type=29,value=240},

		    		},
								-- ·ÉÉý21 ¼¶ --
					{
						{type=9,value=1823},
			    		{type=11,value=3828},
						{type=29,value=280},

		    		},
								-- ·ÉÉý22 ¼¶ --
					{
						{type=9,value=2028},
			    		{type=11,value=4257},
						{type=29,value=320},

		    		},
								-- ·ÉÉý23 ¼¶ --
					{
						{type=9,value=2232},
			    		{type=11,value=4686},
						{type=29,value=360},

		    		},
								-- ·ÉÉý24 ¼¶ --
					{
						{type=9,value=2436},
			    		{type=11,value=5115},
						{type=29,value=400},

		    		},
								-- ·ÉÉý25 ¼¶ --
					{
						{type=9,value=2640},
			    		{type=11,value=5544},
						{type=29,value=440},

		    		},
						--·ÉÉý26¼¶	
					{		
						{type=9,value=2844},	
						{type=11,value=5973},	
						{type=29,value=480},		
					},		
						--·ÉÉý27¼¶	
					{		
						{type=9,value=3048},	
						{type=11,value=6402},	
						{type=29,value=520},		
					},		
						--·ÉÉý28¼¶	
					{		
						{type=9,value=3252},	
						{type=11,value=6831},	
						{type=29,value=560},		
					},		
						--·ÉÉý29¼¶	
					{		
						{type=9,value=3456},	
						{type=11,value=7260},	
						{type=29,value=600},		
					},		
						--·ÉÉý30¼¶	
					{		
						{type=9,value=3660},	
						{type=11,value=7689},	
						{type=29,value=640},		
					},		
						--·ÉÉý31¼¶	
					{		
						{type=9,value=3864},	
						{type=11,value=8118},	
						{type=29,value=680},		
					},		
						--·ÉÉý32¼¶	
					{		
						{type=9,value=4068},	
						{type=11,value=8547},	
						{type=29,value=720},		
					},		
						--·ÉÉý33¼¶	
					{		
						{type=9,value=4272},	
						{type=11,value=8976},	
						{type=29,value=760},		
					},		
						--·ÉÉý34¼¶	
					{		
						{type=9,value=4476},	
						{type=11,value=9405},	
						{type=29,value=800},		
					},		
						--·ÉÉý35¼¶	
					{		
						{type=9,value=4680},	
						{type=11,value=9834},	
						{type=29,value=840},		
					},		
						--·ÉÉý36¼¶	
					{		
						{type=9,value=4884},	
						{type=11,value=10263},	
						{type=29,value=880},		
					},		
						--·ÉÉý37¼¶	
					{		
						{type=9,value=5088},	
						{type=11,value=10692},	
						{type=29,value=920},		
					},		
						--·ÉÉý38¼¶	
					{		
						{type=9,value=5292},	
						{type=11,value=11121},	
						{type=29,value=960},		
					},		
						--·ÉÉý39¼¶	
					{		
						{type=9,value=5496},	
						{type=11,value=11550},	
						{type=29,value=1000},		
					},		
						--·ÉÉý40¼¶	
					{		
						{type=9,value=5700},	
						{type=11,value=11979},	
						{type=29,value=1040},		
					},		
						--·ÉÉý41¼¶	
					{		
						{type=9,value=5904},	
						{type=11,value=12408},	
						{type=29,value=1080},		
					},		
						--·ÉÉý42¼¶	
					{		
						{type=9,value=6108},	
						{type=11,value=12837},	
						{type=29,value=1120},		
					},		
						--·ÉÉý43¼¶	
					{		
						{type=9,value=6312},	
						{type=11,value=13266},	
						{type=29,value=1160},		
					},		
						--·ÉÉý44¼¶	
					{		
						{type=9,value=6516},	
						{type=11,value=13695},	
						{type=29,value=1200},		
					},		
						--·ÉÉý45¼¶	
					{		
						{type=9,value=6720},	
						{type=11,value=14124},	
						{type=29,value=1240},		
					},		
						--·ÉÉý46¼¶	
					{		
						{type=9,value=6924},	
						{type=11,value=14553},	
						{type=29,value=1280},		
					},		
						--·ÉÉý47¼¶	
					{		
						{type=9,value=7128},	
						{type=11,value=14982},	
						{type=29,value=1320},		
					},		
						--·ÉÉý48¼¶	
					{		
						{type=9,value=7332},	
						{type=11,value=15411},	
						{type=29,value=1360},		
					},		
						--·ÉÉý49¼¶	
					{		
						{type=9,value=7536},	
						{type=11,value=15840},	
						{type=29,value=1400},		
					},		
						--·ÉÉý50¼¶	
					{		
						{type=9,value=7740},	
						{type=11,value=16269},	
						{type=29,value=1440},		
					},		    		
		    	},	 
		    	
		    	-- ·¨
				{
												-- ·ÉÉý1 ¼¶ --
					{
						{type=13,value=38},
			    		{type=15,value=78},
						{type=29,value=5},

		    		},
								-- ·ÉÉý2 ¼¶ --
					{
						{type=13,value=75},
			    		{type=15,value=157},
						{type=29,value=10},

		    		},
								-- ·ÉÉý3 ¼¶ --
					{
						{type=13,value=112},
			    		{type=15,value=235},
						{type=29,value=15},

		    		},
								-- ·ÉÉý4 ¼¶ --
					{
						{type=13,value=150},
			    		{type=15,value=314},
						{type=29,value=20},

		    		},
								-- ·ÉÉý5 ¼¶ --
					{
						{type=13,value=188},
			    		{type=15,value=393},
						{type=29,value=24},

		    		},
								-- ·ÉÉý6 ¼¶ --
					{
						{type=13,value=248},
			    		{type=15,value=519},
						{type=29,value=32},

		    		},
								-- ·ÉÉý7 ¼¶ --
					{
						{type=13,value=308},
			    		{type=15,value=645},
						{type=29,value=40},

		    		},
								-- ·ÉÉý8 ¼¶ --
					{
						{type=13,value=368},
			    		{type=15,value=771},
						{type=29,value=48},

		    		},
								-- ·ÉÉý9 ¼¶ --
					{
						{type=13,value=428},
			    		{type=15,value=897},
						{type=29,value=56},

		    		},
								-- ·ÉÉý10 ¼¶ --
					{
						{type=13,value=488},
			    		{type=15,value=1023},
						{type=29,value=64},

		    		},
								-- ·ÉÉý11 ¼¶ --
					{
						{type=13,value=573},
			    		{type=15,value=1202},
						{type=29,value=77},

		    		},
								-- ·ÉÉý12 ¼¶ --
					{
						{type=13,value=660},
			    		{type=15,value=1384},
						{type=29,value=90},

		    		},
								-- ·ÉÉý13 ¼¶ --
					{
						{type=13,value=746},
			    		{type=15,value=1566},
						{type=29,value=103},

		    		},
								-- ·ÉÉý14 ¼¶ --
					{
						{type=13,value=833},
			    		{type=15,value=1748},
						{type=29,value=116},

		    		},
								-- ·ÉÉý15 ¼¶ --
					{
						{type=13,value=920},
			    		{type=15,value=1932},
						{type=29,value=128},

		    		},
								-- ·ÉÉý16 ¼¶ --
					{
						{type=13,value=1060},
			    		{type=15,value=2225},
						{type=29,value=151},

		    		},
								-- ·ÉÉý17 ¼¶ --
					{
						{type=13,value=1200},
			    		{type=15,value=2518},
						{type=29,value=174},

		    		},
								-- ·ÉÉý18 ¼¶ --
					{
						{type=13,value=1339},
			    		{type=15,value=2811},
						{type=29,value=197},

		    		},
								-- ·ÉÉý19 ¼¶ --
					{
						{type=13,value=1479},
			    		{type=15,value=3104},
						{type=29,value=220},

		    		},
								-- ·ÉÉý20 ¼¶ --
					{
						{type=13,value=1619},
			    		{type=15,value=3399},
						{type=29,value=240},

		    		},
								-- ·ÉÉý21 ¼¶ --
					{
						{type=13,value=1823},
			    		{type=15,value=3828},
						{type=29,value=280},

		    		},
								-- ·ÉÉý22 ¼¶ --
					{
						{type=13,value=2028},
			    		{type=15,value=4257},
						{type=29,value=320},

		    		},
								-- ·ÉÉý23 ¼¶ --
					{
						{type=13,value=2232},
			    		{type=15,value=4686},
						{type=29,value=360},

		    		},
								-- ·ÉÉý24 ¼¶ --
					{
						{type=13,value=2436},
			    		{type=15,value=5115},
						{type=29,value=400},

		    		},
								-- ·ÉÉý25 ¼¶ --
					{
						{type=13,value=2640},
			    		{type=15,value=5544},
						{type=29,value=440},

		    		},
	                            --·ÉÉý26¼¶	
						{		
							{type=13,value=2844},	
							{type=15,value=5973},	
							{type=29,value=480},		
						},		
							--·ÉÉý27¼¶	
						{		
							{type=13,value=3048},	
							{type=15,value=6402},	
							{type=29,value=520},		
						},		
							--·ÉÉý28¼¶	
						{		
							{type=13,value=3252},	
							{type=15,value=6831},	
							{type=29,value=560},		
						},		
							--·ÉÉý29¼¶	
						{		
							{type=13,value=3456},	
							{type=15,value=7260},	
							{type=29,value=600},		
						},		
							--·ÉÉý30¼¶	
						{		
							{type=13,value=3660},	
							{type=15,value=7689},	
							{type=29,value=640},		
						},		
							--·ÉÉý31¼¶	
						{		
							{type=13,value=3864},	
							{type=15,value=8118},	
							{type=29,value=680},		
						},		
							--·ÉÉý32¼¶	
						{		
							{type=13,value=4068},	
							{type=15,value=8547},	
							{type=29,value=720},		
						},		
							--·ÉÉý33¼¶	
						{		
							{type=13,value=4272},	
							{type=15,value=8976},	
							{type=29,value=760},		
						},		
							--·ÉÉý34¼¶	
						{		
							{type=13,value=4476},	
							{type=15,value=9405},	
							{type=29,value=800},		
						},		
							--·ÉÉý35¼¶	
						{		
							{type=13,value=4680},	
							{type=15,value=9834},	
							{type=29,value=840},		
						},		
							--·ÉÉý36¼¶	
						{		
							{type=13,value=4884},	
							{type=15,value=10263},	
							{type=29,value=880},		
						},		
							--·ÉÉý37¼¶	
						{		
							{type=13,value=5088},	
							{type=15,value=10692},	
							{type=29,value=920},		
						},		
							--·ÉÉý38¼¶	
						{		
							{type=13,value=5292},	
							{type=15,value=11121},	
							{type=29,value=960},		
						},		
							--·ÉÉý39¼¶	
						{		
							{type=13,value=5496},	
							{type=15,value=11550},	
							{type=29,value=1000},		
						},		
							--·ÉÉý40¼¶	
						{		
							{type=13,value=5700},	
							{type=15,value=11979},	
							{type=29,value=1040},		
						},		
							--·ÉÉý41¼¶	
						{		
							{type=13,value=5904},	
							{type=15,value=12408},	
							{type=29,value=1080},		
						},		
							--·ÉÉý42¼¶	
						{		
							{type=13,value=6108},	
							{type=15,value=12837},	
							{type=29,value=1120},		
						},		
							--·ÉÉý43¼¶	
						{		
							{type=13,value=6312},	
							{type=15,value=13266},	
							{type=29,value=1160},		
						},		
							--·ÉÉý44¼¶	
						{		
							{type=13,value=6516},	
							{type=15,value=13695},	
							{type=29,value=1200},		
						},		
							--·ÉÉý45¼¶	
						{		
							{type=13,value=6720},	
							{type=15,value=14124},	
							{type=29,value=1240},		
						},		
							--·ÉÉý46¼¶	
						{		
							{type=13,value=6924},	
							{type=15,value=14553},	
							{type=29,value=1280},		
						},		
							--·ÉÉý47¼¶	
						{		
							{type=13,value=7128},	
							{type=15,value=14982},	
							{type=29,value=1320},		
						},		
							--·ÉÉý48¼¶	
						{		
							{type=13,value=7332},	
							{type=15,value=15411},	
							{type=29,value=1360},		
						},		
							--·ÉÉý49¼¶	
						{		
							{type=13,value=7536},	
							{type=15,value=15840},	
							{type=29,value=1400},		
						},		
							--·ÉÉý50¼¶	
						{		
							{type=13,value=7740},	
							{type=15,value=16269},	
							{type=29,value=1440},		
						},		
		    		
		    	},	 
		    	
		    	-- µÀ
				{
													-- ·ÉÉý1 ¼¶ --
					{
						{type=17,value=38},
			    		{type=19,value=78},
						{type=29,value=5},

		    		},
								-- ·ÉÉý2 ¼¶ --
					{
						{type=17,value=75},
			    		{type=19,value=157},
						{type=29,value=10},

		    		},
								-- ·ÉÉý3 ¼¶ --
					{
						{type=17,value=112},
			    		{type=19,value=235},
						{type=29,value=15},

		    		},
								-- ·ÉÉý4 ¼¶ --
					{
						{type=17,value=150},
			    		{type=19,value=314},
						{type=29,value=20},

		    		},
								-- ·ÉÉý5 ¼¶ --
					{
						{type=17,value=188},
			    		{type=19,value=393},
						{type=29,value=24},

		    		},
								-- ·ÉÉý6 ¼¶ --
					{
						{type=17,value=248},
			    		{type=19,value=519},
						{type=29,value=32},

		    		},
								-- ·ÉÉý7 ¼¶ --
					{
						{type=17,value=308},
			    		{type=19,value=645},
						{type=29,value=40},

		    		},
								-- ·ÉÉý8 ¼¶ --
					{
						{type=17,value=368},
			    		{type=19,value=771},
						{type=29,value=48},

		    		},
								-- ·ÉÉý9 ¼¶ --
					{
						{type=17,value=428},
			    		{type=19,value=897},
						{type=29,value=56},

		    		},
								-- ·ÉÉý10 ¼¶ --
					{
						{type=17,value=488},
			    		{type=19,value=1023},
						{type=29,value=64},

		    		},
								-- ·ÉÉý11 ¼¶ --
					{
						{type=17,value=573},
			    		{type=19,value=1202},
						{type=29,value=77},

		    		},
								-- ·ÉÉý12 ¼¶ --
					{
						{type=17,value=660},
			    		{type=19,value=1384},
						{type=29,value=90},

		    		},
								-- ·ÉÉý13 ¼¶ --
					{
						{type=17,value=746},
			    		{type=19,value=1566},
						{type=29,value=103},

		    		},
								-- ·ÉÉý14 ¼¶ --
					{
						{type=17,value=833},
			    		{type=19,value=1748},
						{type=29,value=116},

		    		},
								-- ·ÉÉý15 ¼¶ --
					{
						{type=17,value=920},
			    		{type=19,value=1932},
						{type=29,value=128},

		    		},
								-- ·ÉÉý16 ¼¶ --
					{
						{type=17,value=1060},
			    		{type=19,value=2225},
						{type=29,value=151},

		    		},
								-- ·ÉÉý17 ¼¶ --
					{
						{type=17,value=1200},
			    		{type=19,value=2518},
						{type=29,value=174},

		    		},
								-- ·ÉÉý18 ¼¶ --
					{
						{type=17,value=1339},
			    		{type=19,value=2811},
						{type=29,value=197},

		    		},
								-- ·ÉÉý19 ¼¶ --
					{
						{type=17,value=1479},
			    		{type=19,value=3104},
						{type=29,value=220},

		    		},
								-- ·ÉÉý20 ¼¶ --
					{
						{type=17,value=1619},
			    		{type=19,value=3399},
						{type=29,value=240},

		    		},
								-- ·ÉÉý21 ¼¶ --
					{
						{type=17,value=1823},
			    		{type=19,value=3828},
						{type=29,value=280},

		    		},
								-- ·ÉÉý22 ¼¶ --
					{
						{type=17,value=2028},
			    		{type=19,value=4257},
						{type=29,value=320},

		    		},
								-- ·ÉÉý23 ¼¶ --
					{
						{type=17,value=2232},
			    		{type=19,value=4686},
						{type=29,value=360},

		    		},
								-- ·ÉÉý24 ¼¶ --
					{
						{type=17,value=2436},
			    		{type=19,value=5115},
						{type=29,value=400},

		    		},
								-- ·ÉÉý25 ¼¶ --
					{
						{type=17,value=2640},
			    		{type=19,value=5544},
						{type=29,value=440},

		    		},

	                                                                                                       --·ÉÉý26¼¶	
						{		
							{type=17,value=2844},	
							{type=19,value=5973},	
							{type=29,value=480},		
						},		
							--·ÉÉý27¼¶	
						{		
							{type=17,value=3048},	
							{type=19,value=6402},	
							{type=29,value=520},		
						},		
							--·ÉÉý28¼¶	
						{		
							{type=17,value=3252},	
							{type=19,value=6831},	
							{type=29,value=560},		
						},		
							--·ÉÉý29¼¶	
						{		
							{type=17,value=3456},	
							{type=19,value=7260},	
							{type=29,value=600},		
						},		
							--·ÉÉý30¼¶	
						{		
							{type=17,value=3660},	
							{type=19,value=7689},	
							{type=29,value=640},		
						},		
							--·ÉÉý31¼¶	
						{		
							{type=17,value=3864},	
							{type=19,value=8118},	
							{type=29,value=680},		
						},		
							--·ÉÉý32¼¶	
						{		
							{type=17,value=4068},	
							{type=19,value=8547},	
							{type=29,value=720},		
						},		
							--·ÉÉý33¼¶	
						{		
							{type=17,value=4272},	
							{type=19,value=8976},	
							{type=29,value=760},		
						},		
							--·ÉÉý34¼¶	
						{		
							{type=17,value=4476},	
							{type=19,value=9405},	
							{type=29,value=800},		
						},		
							--·ÉÉý35¼¶	
						{		
							{type=17,value=4680},	
							{type=19,value=9834},	
							{type=29,value=840},		
						},		
							--·ÉÉý36¼¶	
						{		
							{type=17,value=4884},	
							{type=19,value=10263},	
							{type=29,value=880},		
						},		
							--·ÉÉý37¼¶	
						{		
							{type=17,value=5088},	
							{type=19,value=10692},	
							{type=29,value=920},		
						},		
							--·ÉÉý38¼¶	
						{		
							{type=17,value=5292},	
							{type=19,value=11121},	
							{type=29,value=960},		
						},		
							--·ÉÉý39¼¶	
						{		
							{type=17,value=5496},	
							{type=19,value=11550},	
							{type=29,value=1000},		
						},		
							--·ÉÉý40¼¶	
						{		
							{type=17,value=5700},	
							{type=19,value=11979},	
							{type=29,value=1040},		
						},		
							--·ÉÉý41¼¶	
						{		
							{type=17,value=5904},	
							{type=19,value=12408},	
							{type=29,value=1080},		
						},		
							--·ÉÉý42¼¶	
						{		
							{type=17,value=6108},	
							{type=19,value=12837},	
							{type=29,value=1120},		
						},		
							--·ÉÉý43¼¶	
						{		
							{type=17,value=6312},	
							{type=19,value=13266},	
							{type=29,value=1160},		
						},		
							--·ÉÉý44¼¶	
						{		
							{type=17,value=6516},	
							{type=19,value=13695},	
							{type=29,value=1200},		
						},		
							--·ÉÉý45¼¶	
						{		
							{type=17,value=6720},	
							{type=19,value=14124},	
							{type=29,value=1240},		
						},		
							--·ÉÉý46¼¶	
						{		
							{type=17,value=6924},	
							{type=19,value=14553},	
							{type=29,value=1280},		
						},		
							--·ÉÉý47¼¶	
						{		
							{type=17,value=7128},	
							{type=19,value=14982},	
							{type=29,value=1320},		
						},		
							--·ÉÉý48¼¶	
						{		
							{type=17,value=7332},	
							{type=19,value=15411},	
							{type=29,value=1360},		
						},		
							--·ÉÉý49¼¶	
						{		
							{type=17,value=7536},	
							{type=19,value=15840},	
							{type=29,value=1400},		
						},		
							--·ÉÉý50¼¶	
						{		
							{type=17,value=7740},	
							{type=19,value=16269},	
							{type=29,value=1440},		
						},				    		
		    		
		    	},	 
			}, 
		},
		
		-- ³á°ò 3
		{
			itemId = 5659,
			
			-- ³á°òÀàÐÍ£º1 Îª»ÃÓð³á°ò, 2 Îª¾ø°æ³á°ò
			swingType = 1,
			
			-- Ã¿½×µÄ³á°òÍâ¹Û
			swingShowIds = {36,37,38,39,40,40,40,40,40,40}, 
			-- ÄÚ¹ÛÌØÐ§
			iconIds = {30278,30279,30280,30281,30282,30282,30282,30282,30282,30282}, 
			--³á°òid
			swingIds = {5672,5673,5674,5675,5676,7878,7879,7880,7881,7882},
			-- Éý½×ÏûºÄ³á°òÊýÁ¿(µÚ1¸ö´ú±í1½×)
			classConsumeCounts = { 1,4,8,16,32,64,128,256,512,800},
			
			-- Éý¼¶ÏûºÄ³á°ò½á¾§ÊýÁ¿
			levelConsumeCounts = {2,4,6,8,10,12,14,16,18,20,23,27,31,35,40,45,50,56,62,68,74,81,88,96,103,110,117,124,131,138,145,152,159,166,173,180,187,194,201,208,215,222,229,236,243,250,257,264,271,278},
			
			-- ½×¼¶ÊôÐÔ
			classAttrs = {

					-- -- (a1) --
					-- {
					-- 	{type=(a2),value=(a3)},
			    	-- 	{type=(a4),value=(a5)},
					-- 	{type=(a6),value=(a7)},

		    		-- },

				-- Õ½
				{
										-- 1½× --
					{
						{type=9,value=125},
			    		{type=11,value=262},
						{type=31,value=12},

		    		},
					-- 2½× --
					{
						{type=9,value=325},
			    		{type=11,value=682},
						{type=31,value=32},

		    		},
					-- 3½× --
					{
						{type=9,value=614},
			    		{type=11,value=1288},
						{type=31,value=64},

		    		},
					-- 4½× --
					{
						{type=9,value=1080},
			    		{type=11,value=2266},
						{type=31,value=120},

		    		},
					-- 5½× --
					{
						{type=9,value=1760},
			    		{type=11,value=3696},
						{type=31,value=220},

		    		},
					-- 6½× --
					{
						{type=9,value=2440},
						{type=11,value=5126},
						{type=31,value=320},

		    		},

					-- 7½× --
					{
						{type=9,value=3120},
						{type=11,value=6556},
						{type=31,value=420},

		    		},

					-- 8½× --
					{
						{type=9,value=3800},
						{type=11,value=7986},
						{type=31,value=520},
		    		},

					-- 9½× --
					{
						{type=9,value=4480},
						{type=11,value=9416},
						{type=31,value=620},
		    		},

					-- 10½× --
					{
						{type=9,value=5160},
						{type=11,value=10846},
						{type=31,value=720},
		    		},

		    		
		    	},	 
		    	
		    	-- ·¨
				{
										-- 1½× --
					{
						{type=13,value=125},
			    		{type=15,value=262},
						{type=31,value=12},

		    		},
					-- 2½× --
					{
						{type=13,value=325},
			    		{type=15,value=682},
						{type=31,value=32},

		    		},
					-- 3½× --
					{
						{type=13,value=614},
			    		{type=15,value=1288},
						{type=31,value=64},

		    		},
					-- 4½× --
					{
						{type=13,value=1080},
			    		{type=15,value=2266},
						{type=31,value=120},

		    		},
					-- 5½× --
					{
						{type=13,value=1760},
			    		{type=15,value=3696},
						{type=31,value=220},

		    		},

					-- 6½× --
					{
						{type=13,value=2440},
						{type=15,value=5126},
						{type=31,value=320},

		    		},

					-- 7½× --
					{
						{type=13,value=3120},
						{type=15,value=6556},
						{type=31,value=420},

		    		},

					-- 8½× --
					{
						{type=13,value=3800},
						{type=15,value=7986},
						{type=31,value=520},
		    		},

					-- 9½× --
					{
						{type=13,value=4480},
						{type=15,value=9416},
						{type=31,value=620},
		    		},

					-- 10½× --
					{
						{type=13,value=5160},
						{type=15,value=10846},
						{type=31,value=720},
		    		},

		    		
		    	},	 
		    	
		    	-- µÀ
				{
										-- 1½× --
					{
						{type=17,value=125},
			    		{type=19,value=262},
						{type=31,value=12},

		    		},
					-- 2½× --
					{
						{type=17,value=325},
			    		{type=19,value=682},
						{type=31,value=32},

		    		},
					-- 3½× --
					{
						{type=17,value=614},
			    		{type=19,value=1288},
						{type=31,value=64},

		    		},
					-- 4½× --
					{
						{type=17,value=1080},
			    		{type=19,value=2266},
						{type=31,value=120},

		    		},
					-- 5½× --
					{
						{type=17,value=1760},
			    		{type=19,value=3696},
						{type=31,value=220},

		    		},
					-- 6½× --
					{
						{type=17,value=2440},
						{type=19,value=5126},
						{type=31,value=320},

		    		},

					-- 7½× --
					{
						{type=17,value=3120},
						{type=19,value=6556},
						{type=31,value=420},

		    		},

					-- 8½× --
					{
						{type=17,value=3800},
						{type=19,value=7986},
						{type=31,value=520},
		    		},

					-- 9½× --
					{
						{type=17,value=4480},
						{type=19,value=9416},
						{type=31,value=620},
		    		},

					-- 10½× --
					{
						{type=17,value=5160},
						{type=19,value=10846},
						{type=31,value=720},
		    		},		    		
		    		
		    	},	    	
		    	
			},
			
			-- µÈ¼¶ÊôÐÔ
			levelAttrs = {
				-- Õ½

					-- -- (a1) ¼¶ --
					-- {
					-- 	{type=(a2),value=(a3)},
			    	-- 	{type=(a4),value=(a5)},
					-- 	{type=(a6),value=(a7)},
					-- 	{type=(a8),value=(a9)},
					-- 	{type=(a10),value=(a11)},
					-- 	{type=(a12),value=(a13)},

		    		-- },

				{
									-- ·ÉÉý1 --
					{
						{type=9,value=38},
			    		{type=11,value=78},
						{type=31,value=5},

		    		},
					-- ·ÉÉý2 --
					{
						{type=9,value=75},
			    		{type=11,value=157},
						{type=31,value=10},

		    		},
					-- ·ÉÉý3 --
					{
						{type=9,value=112},
			    		{type=11,value=235},
						{type=31,value=15},

		    		},
					-- ·ÉÉý4 --
					{
						{type=9,value=150},
			    		{type=11,value=314},
						{type=31,value=20},

		    		},
					-- ·ÉÉý5 --
					{
						{type=9,value=188},
			    		{type=11,value=393},
						{type=31,value=24},

		    		},
					-- ·ÉÉý6 --
					{
						{type=9,value=248},
			    		{type=11,value=519},
						{type=31,value=32},

		    		},
					-- ·ÉÉý7 --
					{
						{type=9,value=308},
			    		{type=11,value=645},
						{type=31,value=40},

		    		},
					-- ·ÉÉý8 --
					{
						{type=9,value=368},
			    		{type=11,value=771},
						{type=31,value=48},

		    		},
					-- ·ÉÉý9 --
					{
						{type=9,value=428},
			    		{type=11,value=897},
						{type=31,value=56},

		    		},
					-- ·ÉÉý10 --
					{
						{type=9,value=488},
			    		{type=11,value=1023},
						{type=31,value=64},

		    		},
					-- ·ÉÉý11 --
					{
						{type=9,value=573},
			    		{type=11,value=1202},
						{type=31,value=77},

		    		},
					-- ·ÉÉý12 --
					{
						{type=9,value=660},
			    		{type=11,value=1384},
						{type=31,value=90},

		    		},
					-- ·ÉÉý13 --
					{
						{type=9,value=746},
			    		{type=11,value=1566},
						{type=31,value=103},

		    		},
					-- ·ÉÉý14 --
					{
						{type=9,value=833},
			    		{type=11,value=1748},
						{type=31,value=116},

		    		},
					-- ·ÉÉý15 --
					{
						{type=9,value=920},
			    		{type=11,value=1932},
						{type=31,value=128},

		    		},
					-- ·ÉÉý16 --
					{
						{type=9,value=1060},
			    		{type=11,value=2225},
						{type=31,value=151},

		    		},
					-- ·ÉÉý17 --
					{
						{type=9,value=1200},
			    		{type=11,value=2518},
						{type=31,value=174},

		    		},
					-- ·ÉÉý18 --
					{
						{type=9,value=1339},
			    		{type=11,value=2811},
						{type=31,value=197},

		    		},
					-- ·ÉÉý19 --
					{
						{type=9,value=1479},
			    		{type=11,value=3104},
						{type=31,value=220},

		    		},
					-- ·ÉÉý20 --
					{
						{type=9,value=1619},
			    		{type=11,value=3399},
						{type=31,value=240},

		    		},
					-- ·ÉÉý21 --
					{
						{type=9,value=1823},
			    		{type=11,value=3828},
						{type=31,value=280},

		    		},
					-- ·ÉÉý22 --
					{
						{type=9,value=2028},
			    		{type=11,value=4257},
						{type=31,value=320},

		    		},
					-- ·ÉÉý23 --
					{
						{type=9,value=2232},
			    		{type=11,value=4686},
						{type=31,value=360},

		    		},
					-- ·ÉÉý24 --
					{
						{type=9,value=2436},
			    		{type=11,value=5115},
						{type=31,value=400},

		    		},
					-- ·ÉÉý25 --
					{
						{type=9,value=2640},
			    		{type=11,value=5544},
						{type=31,value=440},

		    		},

						--·ÉÉý26¼¶	
					{		
						{type=9,value=2844},	
						{type=11,value=5973},	
						{type=31,value=480},		
					},		
						--·ÉÉý27¼¶	
					{		
						{type=9,value=3048},	
						{type=11,value=6402},	
						{type=31,value=520},		
					},		
						--·ÉÉý28¼¶	
					{		
						{type=9,value=3252},	
						{type=11,value=6831},	
						{type=31,value=560},		
					},		
						--·ÉÉý29¼¶	
					{		
						{type=9,value=3456},	
						{type=11,value=7260},	
						{type=31,value=600},		
					},		
						--·ÉÉý30¼¶	
					{		
						{type=9,value=3660},	
						{type=11,value=7689},	
						{type=31,value=640},		
					},		
						--·ÉÉý31¼¶	
					{		
						{type=9,value=3864},	
						{type=11,value=8118},	
						{type=31,value=680},		
					},		
						--·ÉÉý32¼¶	
					{		
						{type=9,value=4068},	
						{type=11,value=8547},	
						{type=31,value=720},		
					},		
						--·ÉÉý33¼¶	
					{		
						{type=9,value=4272},	
						{type=11,value=8976},	
						{type=31,value=760},		
					},		
						--·ÉÉý34¼¶	
					{		
						{type=9,value=4476},	
						{type=11,value=9405},	
						{type=31,value=800},		
					},		
						--·ÉÉý35¼¶	
					{		
						{type=9,value=4680},	
						{type=11,value=9834},	
						{type=31,value=840},		
					},		
						--·ÉÉý36¼¶	
					{		
						{type=9,value=4884},	
						{type=11,value=10263},	
						{type=31,value=880},		
					},		
						--·ÉÉý37¼¶	
					{		
						{type=9,value=5088},	
						{type=11,value=10692},	
						{type=31,value=920},		
					},		
						--·ÉÉý38¼¶	
					{		
						{type=9,value=5292},	
						{type=11,value=11121},	
						{type=31,value=960},		
					},		
						--·ÉÉý39¼¶	
					{		
						{type=9,value=5496},	
						{type=11,value=11550},	
						{type=31,value=1000},		
					},		
						--·ÉÉý40¼¶	
					{		
						{type=9,value=5700},	
						{type=11,value=11979},	
						{type=31,value=1040},		
					},		
						--·ÉÉý41¼¶	
					{		
						{type=9,value=5904},	
						{type=11,value=12408},	
						{type=31,value=1080},		
					},		
						--·ÉÉý42¼¶	
					{		
						{type=9,value=6108},	
						{type=11,value=12837},	
						{type=31,value=1120},		
					},		
						--·ÉÉý43¼¶	
					{		
						{type=9,value=6312},	
						{type=11,value=13266},	
						{type=31,value=1160},		
					},		
						--·ÉÉý44¼¶	
					{		
						{type=9,value=6516},	
						{type=11,value=13695},	
						{type=31,value=1200},		
					},		
						--·ÉÉý45¼¶	
					{		
						{type=9,value=6720},	
						{type=11,value=14124},	
						{type=31,value=1240},		
					},		
						--·ÉÉý46¼¶	
					{		
						{type=9,value=6924},	
						{type=11,value=14553},	
						{type=31,value=1280},		
					},		
						--·ÉÉý47¼¶	
					{		
						{type=9,value=7128},	
						{type=11,value=14982},	
						{type=31,value=1320},		
					},		
						--·ÉÉý48¼¶	
					{		
						{type=9,value=7332},	
						{type=11,value=15411},	
						{type=31,value=1360},		
					},		
						--·ÉÉý49¼¶	
					{		
						{type=9,value=7536},	
						{type=11,value=15840},	
						{type=31,value=1400},		
					},		
						--·ÉÉý50¼¶	
					{		
						{type=9,value=7740},	
						{type=11,value=16269},	
						{type=31,value=1440},		
					},
		    		
		    	},	 
		    	
		    	-- ·¨
				{
									-- ·ÉÉý1 --
					{
						{type=13,value=38},
			    		{type=15,value=78},
						{type=31,value=5},

		    		},
					-- ·ÉÉý2 --
					{
						{type=13,value=75},
			    		{type=15,value=157},
						{type=31,value=10},

		    		},
					-- ·ÉÉý3 --
					{
						{type=13,value=112},
			    		{type=15,value=235},
						{type=31,value=15},

		    		},
					-- ·ÉÉý4 --
					{
						{type=13,value=150},
			    		{type=15,value=314},
						{type=31,value=20},

		    		},
					-- ·ÉÉý5 --
					{
						{type=13,value=188},
			    		{type=15,value=393},
						{type=31,value=24},

		    		},
					-- ·ÉÉý6 --
					{
						{type=13,value=248},
			    		{type=15,value=519},
						{type=31,value=32},

		    		},
					-- ·ÉÉý7 --
					{
						{type=13,value=308},
			    		{type=15,value=645},
						{type=31,value=40},

		    		},
					-- ·ÉÉý8 --
					{
						{type=13,value=368},
			    		{type=15,value=771},
						{type=31,value=48},

		    		},
					-- ·ÉÉý9 --
					{
						{type=13,value=428},
			    		{type=15,value=897},
						{type=31,value=56},

		    		},
					-- ·ÉÉý10 --
					{
						{type=13,value=488},
			    		{type=15,value=1023},
						{type=31,value=64},

		    		},
					-- ·ÉÉý11 --
					{
						{type=13,value=573},
			    		{type=15,value=1202},
						{type=31,value=77},

		    		},
					-- ·ÉÉý12 --
					{
						{type=13,value=660},
			    		{type=15,value=1384},
						{type=31,value=90},

		    		},
					-- ·ÉÉý13 --
					{
						{type=13,value=746},
			    		{type=15,value=1566},
						{type=31,value=103},

		    		},
					-- ·ÉÉý14 --
					{
						{type=13,value=833},
			    		{type=15,value=1748},
						{type=31,value=116},

		    		},
					-- ·ÉÉý15 --
					{
						{type=13,value=920},
			    		{type=15,value=1932},
						{type=31,value=128},

		    		},
					-- ·ÉÉý16 --
					{
						{type=13,value=1060},
			    		{type=15,value=2225},
						{type=31,value=151},

		    		},
					-- ·ÉÉý17 --
					{
						{type=13,value=1200},
			    		{type=15,value=2518},
						{type=31,value=174},

		    		},
					-- ·ÉÉý18 --
					{
						{type=13,value=1339},
			    		{type=15,value=2811},
						{type=31,value=197},

		    		},
					-- ·ÉÉý19 --
					{
						{type=13,value=1479},
			    		{type=15,value=3104},
						{type=31,value=220},

		    		},
					-- ·ÉÉý20 --
					{
						{type=13,value=1619},
			    		{type=15,value=3399},
						{type=31,value=240},

		    		},
					-- ·ÉÉý21 --
					{
						{type=13,value=1823},
			    		{type=15,value=3828},
						{type=31,value=280},

		    		},
					-- ·ÉÉý22 --
					{
						{type=13,value=2028},
			    		{type=15,value=4257},
						{type=31,value=320},

		    		},
					-- ·ÉÉý23 --
					{
						{type=13,value=2232},
			    		{type=15,value=4686},
						{type=31,value=360},

		    		},
					-- ·ÉÉý24 --
					{
						{type=13,value=2436},
			    		{type=15,value=5115},
						{type=31,value=400},

		    		},
					-- ·ÉÉý25 --
					{
						{type=13,value=2640},
			    		{type=15,value=5544},
						{type=31,value=440},

		    		},
						--·ÉÉý26¼¶	
					{		
						{type=13,value=2844},	
						{type=15,value=5973},	
						{type=31,value=480},		
					},		
						--·ÉÉý27¼¶	
					{		
						{type=13,value=3048},	
						{type=15,value=6402},	
						{type=31,value=520},		
					},		
						--·ÉÉý28¼¶	
					{		
						{type=13,value=3252},	
						{type=15,value=6831},	
						{type=31,value=560},		
					},		
						--·ÉÉý29¼¶	
					{		
						{type=13,value=3456},	
						{type=15,value=7260},	
						{type=31,value=600},		
					},		
						--·ÉÉý30¼¶	
					{		
						{type=13,value=3660},	
						{type=15,value=7689},	
						{type=31,value=640},		
					},		
						--·ÉÉý31¼¶	
					{		
						{type=13,value=3864},	
						{type=15,value=8118},	
						{type=31,value=680},		
					},		
						--·ÉÉý32¼¶	
					{		
						{type=13,value=4068},	
						{type=15,value=8547},	
						{type=31,value=720},		
					},		
						--·ÉÉý33¼¶	
					{		
						{type=13,value=4272},	
						{type=15,value=8976},	
						{type=31,value=760},		
					},		
						--·ÉÉý34¼¶	
					{		
						{type=13,value=4476},	
						{type=15,value=9405},	
						{type=31,value=800},		
					},		
						--·ÉÉý35¼¶	
					{		
						{type=13,value=4680},	
						{type=15,value=9834},	
						{type=31,value=840},		
					},		
						--·ÉÉý36¼¶	
					{		
						{type=13,value=4884},	
						{type=15,value=10263},	
						{type=31,value=880},		
					},		
						--·ÉÉý37¼¶	
					{		
						{type=13,value=5088},	
						{type=15,value=10692},	
						{type=31,value=920},		
					},		
						--·ÉÉý38¼¶	
					{		
						{type=13,value=5292},	
						{type=15,value=11121},	
						{type=31,value=960},		
					},		
						--·ÉÉý39¼¶	
					{		
						{type=13,value=5496},	
						{type=15,value=11550},	
						{type=31,value=1000},		
					},		
						--·ÉÉý40¼¶	
					{		
						{type=13,value=5700},	
						{type=15,value=11979},	
						{type=31,value=1040},		
					},		
						--·ÉÉý41¼¶	
					{		
						{type=13,value=5904},	
						{type=15,value=12408},	
						{type=31,value=1080},		
					},		
						--·ÉÉý42¼¶	
					{		
						{type=13,value=6108},	
						{type=15,value=12837},	
						{type=31,value=1120},		
					},		
						--·ÉÉý43¼¶	
					{		
						{type=13,value=6312},	
						{type=15,value=13266},	
						{type=31,value=1160},		
					},		
						--·ÉÉý44¼¶	
					{		
						{type=13,value=6516},	
						{type=15,value=13695},	
						{type=31,value=1200},		
					},		
						--·ÉÉý45¼¶	
					{		
						{type=13,value=6720},	
						{type=15,value=14124},	
						{type=31,value=1240},		
					},		
						--·ÉÉý46¼¶	
					{		
						{type=13,value=6924},	
						{type=15,value=14553},	
						{type=31,value=1280},		
					},		
						--·ÉÉý47¼¶	
					{		
						{type=13,value=7128},	
						{type=15,value=14982},	
						{type=31,value=1320},		
					},		
						--·ÉÉý48¼¶	
					{		
						{type=13,value=7332},	
						{type=15,value=15411},	
						{type=31,value=1360},		
					},		
						--·ÉÉý49¼¶	
					{		
						{type=13,value=7536},	
						{type=15,value=15840},	
						{type=31,value=1400},		
					},		
						--·ÉÉý50¼¶	
					{		
						{type=13,value=7740},	
						{type=15,value=16269},	
						{type=31,value=1440},		
					},
		    		
		    	},	 
		    	
		    	-- µÀ
				{
										-- ·ÉÉý1 --
					{
						{type=17,value=38},
			    		{type=19,value=78},
						{type=31,value=5},

		    		},
					-- ·ÉÉý2 --
					{
						{type=17,value=75},
			    		{type=19,value=157},
						{type=31,value=10},

		    		},
					-- ·ÉÉý3 --
					{
						{type=17,value=112},
			    		{type=19,value=235},
						{type=31,value=15},

		    		},
					-- ·ÉÉý4 --
					{
						{type=17,value=150},
			    		{type=19,value=314},
						{type=31,value=20},

		    		},
					-- ·ÉÉý5 --
					{
						{type=17,value=188},
			    		{type=19,value=393},
						{type=31,value=24},

		    		},
					-- ·ÉÉý6 --
					{
						{type=17,value=248},
			    		{type=19,value=519},
						{type=31,value=32},

		    		},
					-- ·ÉÉý7 --
					{
						{type=17,value=308},
			    		{type=19,value=645},
						{type=31,value=40},

		    		},
					-- ·ÉÉý8 --
					{
						{type=17,value=368},
			    		{type=19,value=771},
						{type=31,value=48},

		    		},
					-- ·ÉÉý9 --
					{
						{type=17,value=428},
			    		{type=19,value=897},
						{type=31,value=56},

		    		},
					-- ·ÉÉý10 --
					{
						{type=17,value=488},
			    		{type=19,value=1023},
						{type=31,value=64},

		    		},
					-- ·ÉÉý11 --
					{
						{type=17,value=573},
			    		{type=19,value=1202},
						{type=31,value=77},

		    		},
					-- ·ÉÉý12 --
					{
						{type=17,value=660},
			    		{type=19,value=1384},
						{type=31,value=90},

		    		},
					-- ·ÉÉý13 --
					{
						{type=17,value=746},
			    		{type=19,value=1566},
						{type=31,value=103},

		    		},
					-- ·ÉÉý14 --
					{
						{type=17,value=833},
			    		{type=19,value=1748},
						{type=31,value=116},

		    		},
					-- ·ÉÉý15 --
					{
						{type=17,value=920},
			    		{type=19,value=1932},
						{type=31,value=128},

		    		},
					-- ·ÉÉý16 --
					{
						{type=17,value=1060},
			    		{type=19,value=2225},
						{type=31,value=151},

		    		},
					-- ·ÉÉý17 --
					{
						{type=17,value=1200},
			    		{type=19,value=2518},
						{type=31,value=174},

		    		},
					-- ·ÉÉý18 --
					{
						{type=17,value=1339},
			    		{type=19,value=2811},
						{type=31,value=197},

		    		},
					-- ·ÉÉý19 --
					{
						{type=17,value=1479},
			    		{type=19,value=3104},
						{type=31,value=220},

		    		},
					-- ·ÉÉý20 --
					{
						{type=17,value=1619},
			    		{type=19,value=3399},
						{type=31,value=240},

		    		},
					-- ·ÉÉý21 --
					{
						{type=17,value=1823},
			    		{type=19,value=3828},
						{type=31,value=280},

		    		},
					-- ·ÉÉý22 --
					{
						{type=17,value=2028},
			    		{type=19,value=4257},
						{type=31,value=320},

		    		},
					-- ·ÉÉý23 --
					{
						{type=17,value=2232},
			    		{type=19,value=4686},
						{type=31,value=360},

		    		},
					-- ·ÉÉý24 --
					{
						{type=17,value=2436},
			    		{type=19,value=5115},
						{type=31,value=400},

		    		},
					-- ·ÉÉý25 --
					{
						{type=17,value=2640},
			    		{type=19,value=5544},
						{type=31,value=440},

		    		},
						--·ÉÉý26¼¶	
					{		
						{type=17,value=2844},	
						{type=19,value=5973},	
						{type=31,value=480},		
					},		
						--·ÉÉý27¼¶	
					{		
						{type=17,value=3048},	
						{type=19,value=6402},	
						{type=31,value=520},		
					},		
						--·ÉÉý28¼¶	
					{		
						{type=17,value=3252},	
						{type=19,value=6831},	
						{type=31,value=560},		
					},		
						--·ÉÉý29¼¶	
					{		
						{type=17,value=3456},	
						{type=19,value=7260},	
						{type=31,value=600},		
					},		
						--·ÉÉý30¼¶	
					{		
						{type=17,value=3660},	
						{type=19,value=7689},	
						{type=31,value=640},		
					},		
						--·ÉÉý31¼¶	
					{		
						{type=17,value=3864},	
						{type=19,value=8118},	
						{type=31,value=680},		
					},		
						--·ÉÉý32¼¶	
					{		
						{type=17,value=4068},	
						{type=19,value=8547},	
						{type=31,value=720},		
					},		
						--·ÉÉý33¼¶	
					{		
						{type=17,value=4272},	
						{type=19,value=8976},	
						{type=31,value=760},		
					},		
						--·ÉÉý34¼¶	
					{		
						{type=17,value=4476},	
						{type=19,value=9405},	
						{type=31,value=800},		
					},		
						--·ÉÉý35¼¶	
					{		
						{type=17,value=4680},	
						{type=19,value=9834},	
						{type=31,value=840},		
					},		
						--·ÉÉý36¼¶	
					{		
						{type=17,value=4884},	
						{type=19,value=10263},	
						{type=31,value=880},		
					},		
						--·ÉÉý37¼¶	
					{		
						{type=17,value=5088},	
						{type=19,value=10692},	
						{type=31,value=920},		
					},		
						--·ÉÉý38¼¶	
					{		
						{type=17,value=5292},	
						{type=19,value=11121},	
						{type=31,value=960},		
					},		
						--·ÉÉý39¼¶	
					{		
						{type=17,value=5496},	
						{type=19,value=11550},	
						{type=31,value=1000},		
					},		
						--·ÉÉý40¼¶	
					{		
						{type=17,value=5700},	
						{type=19,value=11979},	
						{type=31,value=1040},		
					},		
						--·ÉÉý41¼¶	
					{		
						{type=17,value=5904},	
						{type=19,value=12408},	
						{type=31,value=1080},		
					},		
						--·ÉÉý42¼¶	
					{		
						{type=17,value=6108},	
						{type=19,value=12837},	
						{type=31,value=1120},		
					},		
						--·ÉÉý43¼¶	
					{		
						{type=17,value=6312},	
						{type=19,value=13266},	
						{type=31,value=1160},		
					},		
						--·ÉÉý44¼¶	
					{		
						{type=17,value=6516},	
						{type=19,value=13695},	
						{type=31,value=1200},		
					},		
						--·ÉÉý45¼¶	
					{		
						{type=17,value=6720},	
						{type=19,value=14124},	
						{type=31,value=1240},		
					},		
						--·ÉÉý46¼¶	
					{		
						{type=17,value=6924},	
						{type=19,value=14553},	
						{type=31,value=1280},		
					},		
						--·ÉÉý47¼¶	
					{		
						{type=17,value=7128},	
						{type=19,value=14982},	
						{type=31,value=1320},		
					},		
						--·ÉÉý48¼¶	
					{		
						{type=17,value=7332},	
						{type=19,value=15411},	
						{type=31,value=1360},		
					},		
						--·ÉÉý49¼¶	
					{		
						{type=17,value=7536},	
						{type=19,value=15840},	
						{type=31,value=1400},		
					},		
						--·ÉÉý50¼¶	
					{		
						{type=17,value=7740},	
						{type=19,value=16269},	
						{type=31,value=1440},		
					},
		    		
		    	},	 
			}, 
		},
		
		-- ³á°ò 4
		{
			itemId = 5660,
			
			-- ³á°òÀàÐÍ£º1 Îª»ÃÓð³á°ò, 2 Îª¾ø°æ³á°ò
			swingType = 1,
			
			-- Ã¿½×µÄ³á°òÍâ¹Û
			swingShowIds = {41,42,43,44,45,45,45,45,45,45}, 
			-- ÄÚ¹ÛÌØÐ§
			iconIds = {30283,30284,30285,30286,30287,30287,30287,30287,30287,30287}, 
			--³á°òid
			swingIds = {5677,5678,5679,5680,5681,7883,7884,7885,7886,7887},
			-- Éý½×ÏûºÄ³á°òÊýÁ¿(µÚ1¸ö´ú±í1½×)
			classConsumeCounts = { 1,4,8,16,32,64,128,256,512,800},
			
			-- Éý¼¶ÏûºÄ³á°ò½á¾§ÊýÁ¿
			levelConsumeCounts = {2,4,6,8,10,12,14,16,18,20,23,27,31,35,40,45,50,56,62,68,74,81,88,96,103,110,117,124,131,138,145,152,159,166,173,180,187,194,201,208,215,222,229,236,243,250,257,264,271,278},
			
			-- ½×¼¶ÊôÐÔ
			classAttrs = {
				-- Õ½

				-- -- (a1) 
				-- 	{
				-- 		{type=(a2),value=(a3)},
			    -- 		{type=(a4),value=(a5)},
				-- 		{type=(a6),value=(a7)},
				-- 		{type=(a8),value=(a9)},

		    	-- 	},

				{
								-- 1½× 
					{
						{type=9,value=125},
			    		{type=11,value=262},
						{type=128,value=40},
						{type=129,value=624},

		    		},
				-- 2½× 
					{
						{type=9,value=325},
			    		{type=11,value=682},
						{type=128,value=80},
						{type=129,value=1664},

		    		},
				-- 3½× 
					{
						{type=9,value=614},
			    		{type=11,value=1288},
						{type=128,value=120},
						{type=129,value=3328},

		    		},
				-- 4½× 
					{
						{type=9,value=1080},
			    		{type=11,value=2266},
						{type=128,value=160},
						{type=129,value=6240},

		    		},
				-- 5½× 
					{
						{type=9,value=1760},
			    		{type=11,value=3696},
						{type=128,value=200},
						{type=129,value=11440},

		    		},
				-- 6½× 
					{
						{type=9,value=2440},
						{type=11,value=5126},
						{type=128,value=240},
						{type=129,value=16640},

		    		},
				-- 7½× 
					{
						{type=9,value=3120},
						{type=11,value=6556},
						{type=128,value=280},
						{type=129,value=21840},

		    		},
				-- 8½× 
					{
						{type=9,value=3800},
						{type=11,value=7986},
						{type=128,value=320},
						{type=129,value=27040},

		    		},
				-- 9½× 
					{
						{type=9,value=4480},
						{type=11,value=9416},
						{type=128,value=360},
						{type=129,value=32240},

		    		},
				-- 10½× 
					{
						{type=9,value=5160},
						{type=11,value=10846},
						{type=128,value=400},
						{type=129,value=37440},
		    		},		    		
		    		
		    	},	 
		    	
		    	-- ·¨
				{
									-- 1½× 
					{
						{type=13,value=125},
			    		{type=15,value=262},
						{type=128,value=40},
						{type=129,value=624},

		    		},
				-- 2½× 
					{
						{type=13,value=325},
			    		{type=15,value=682},
						{type=128,value=80},
						{type=129,value=1664},

		    		},
				-- 3½× 
					{
						{type=13,value=614},
			    		{type=15,value=1288},
						{type=128,value=120},
						{type=129,value=3328},

		    		},
				-- 4½× 
					{
						{type=13,value=1080},
			    		{type=15,value=2266},
						{type=128,value=160},
						{type=129,value=6240},

		    		},
				-- 5½× 
					{
						{type=13,value=1760},
			    		{type=15,value=3696},
						{type=128,value=200},
						{type=129,value=11440},

		    		},

				-- 6½× 
					{
						{type=13,value=2440},
						{type=15,value=5126},
						{type=128,value=240},
						{type=129,value=16640},

		    		},
				-- 7½× 
					{
						{type=13,value=3120},
						{type=15,value=6556},
						{type=128,value=280},
						{type=129,value=21840},

		    		},
				-- 8½× 
					{
						{type=13,value=3800},
						{type=15,value=7986},
						{type=128,value=320},
						{type=129,value=27040},

		    		},
				-- 9½× 
					{
						{type=13,value=4480},
						{type=15,value=9416},
						{type=128,value=360},
						{type=129,value=32240},

		    		},
				-- 10½× 
					{
						{type=13,value=5160},
						{type=15,value=10846},
						{type=128,value=400},
						{type=129,value=37440},
		    		},
		    		
		    	},	 
		    	
		    	-- µÀ
				{
									-- 1½× 
					{
						{type=17,value=125},
			    		{type=19,value=262},
						{type=128,value=40},
						{type=129,value=624},

		    		},
				-- 2½× 
					{
						{type=17,value=325},
			    		{type=19,value=682},
						{type=128,value=80},
						{type=129,value=1664},

		    		},
				-- 3½× 
					{
						{type=17,value=614},
			    		{type=19,value=1288},
						{type=128,value=120},
						{type=129,value=3328},

		    		},
				-- 4½× 
					{
						{type=17,value=1080},
			    		{type=19,value=2266},
						{type=128,value=160},
						{type=129,value=6240},

		    		},
				-- 5½× 
					{
						{type=17,value=1760},
			    		{type=19,value=3696},
						{type=128,value=200},
						{type=129,value=11440},

		    		},
				-- 6½× 
					{
						{type=17,value=2440},
						{type=19,value=5126},
						{type=128,value=240},
						{type=129,value=16640},

		    		},
				-- 7½× 
					{
						{type=17,value=3120},
						{type=19,value=6556},
						{type=128,value=280},
						{type=129,value=21840},

		    		},
				-- 8½× 
					{
						{type=17,value=3800},
						{type=19,value=7986},
						{type=128,value=320},
						{type=129,value=27040},

		    		},
				-- 9½× 
					{
						{type=17,value=4480},
						{type=19,value=9416},
						{type=128,value=360},
						{type=129,value=32240},

		    		},
				-- 10½× 
					{
						{type=17,value=5160},
						{type=19,value=10846},
						{type=128,value=400},
						{type=129,value=37440},
		    		},

		    		
		    	},	    	
		    	
			},
			
			-- µÈ¼¶ÊôÐÔ
			levelAttrs = {
				-- Õ½

					-- -- (a1) ¼¶ --
					-- {
					-- 	{type=(a2),value=(a3)},
			    	-- 	{type=(a4),value=(a5)},
					-- 	{type=(a6),value=(a7)},
					-- 	{type=(a8),value=(a9)},

		    		-- },

				{
					
					-- ·ÉÉý1 ¼¶ --
					{
						{type=9,value=38},
			    		{type=11,value=78},
						{type=128,value=10},
						{type=129,value=140},

		    		},

					-- ·ÉÉý2 ¼¶ --
					{
						{type=9,value=75},
			    		{type=11,value=157},
						{type=128,value=20},
						{type=129,value=280},

		    		},

					-- ·ÉÉý3 ¼¶ --
					{
						{type=9,value=112},
			    		{type=11,value=235},
						{type=128,value=30},
						{type=129,value=420},

		    		},

					-- ·ÉÉý4 ¼¶ --
					{
						{type=9,value=150},
			    		{type=11,value=314},
						{type=128,value=40},
						{type=129,value=560},

		    		},

					-- ·ÉÉý5 ¼¶ --
					{
						{type=9,value=188},
			    		{type=11,value=393},
						{type=128,value=50},
						{type=129,value=648},

		    		},

					-- ·ÉÉý6 ¼¶ --
					{
						{type=9,value=248},
			    		{type=11,value=519},
						{type=128,value=60},
						{type=129,value=944},

		    		},

					-- ·ÉÉý7 ¼¶ --
					{
						{type=9,value=308},
			    		{type=11,value=645},
						{type=128,value=70},
						{type=129,value=1240},

		    		},

					-- ·ÉÉý8 ¼¶ --
					{
						{type=9,value=368},
			    		{type=11,value=771},
						{type=128,value=80},
						{type=129,value=1536},

		    		},

					-- ·ÉÉý9 ¼¶ --
					{
						{type=9,value=428},
			    		{type=11,value=897},
						{type=128,value=90},
						{type=129,value=1832},

		    		},

					-- ·ÉÉý10 ¼¶ --
					{
						{type=9,value=488},
			    		{type=11,value=1023},
						{type=128,value=100},
						{type=129,value=2128},

		    		},

					-- ·ÉÉý11 ¼¶ --
					{
						{type=9,value=573},
			    		{type=11,value=1202},
						{type=128,value=110},
						{type=129,value=2684},

		    		},

					-- ·ÉÉý12 ¼¶ --
					{
						{type=9,value=660},
			    		{type=11,value=1384},
						{type=128,value=120},
						{type=129,value=3240},

		    		},

					-- ·ÉÉý13 ¼¶ --
					{
						{type=9,value=746},
			    		{type=11,value=1566},
						{type=128,value=130},
						{type=129,value=3796},

		    		},

					-- ·ÉÉý14 ¼¶ --
					{
						{type=9,value=833},
			    		{type=11,value=1748},
						{type=128,value=140},
						{type=129,value=4352},

		    		},

					-- ·ÉÉý15 ¼¶ --
					{
						{type=9,value=920},
			    		{type=11,value=1932},
						{type=128,value=150},
						{type=129,value=4856},

		    		},

					-- ·ÉÉý16 ¼¶ --
					{
						{type=9,value=1060},
			    		{type=11,value=2225},
						{type=128,value=160},
						{type=129,value=5932},

		    		},

					-- ·ÉÉý17 ¼¶ --
					{
						{type=9,value=1200},
			    		{type=11,value=2518},
						{type=128,value=170},
						{type=129,value=7008},

		    		},

					-- ·ÉÉý18 ¼¶ --
					{
						{type=9,value=1339},
			    		{type=11,value=2811},
						{type=128,value=180},
						{type=129,value=8084},

		    		},

					-- ·ÉÉý19 ¼¶ --
					{
						{type=9,value=1479},
			    		{type=11,value=3104},
						{type=128,value=190},
						{type=129,value=9160},

		    		},

					-- ·ÉÉý20 ¼¶ --
					{
						{type=9,value=1619},
			    		{type=11,value=3399},
						{type=128,value=200},
						{type=129,value=10080},

		    		},

					-- ·ÉÉý21 ¼¶ --
					{
						{type=9,value=1823},
			    		{type=11,value=3828},
						{type=128,value=210},
						{type=129,value=12040},

		    		},

					-- ·ÉÉý22 ¼¶ --
					{
						{type=9,value=2028},
			    		{type=11,value=4257},
						{type=128,value=220},
						{type=129,value=14000},

		    		},

					-- ·ÉÉý23 ¼¶ --
					{
						{type=9,value=2232},
			    		{type=11,value=4686},
						{type=128,value=230},
						{type=129,value=15960},

		    		},

					-- ·ÉÉý24 ¼¶ --
					{
						{type=9,value=2436},
			    		{type=11,value=5115},
						{type=128,value=240},
						{type=129,value=17920},

		    		},

					-- ·ÉÉý25 ¼¶ --
					{
						{type=9,value=2640},
			    		{type=11,value=5544},
						{type=128,value=250},
						{type=129,value=19880},

		    		},
						--·ÉÉý26¼¶			
					{				
						{type=9,value=2844},			
						{type=11,value=5973},			
						{type=128,value=260},			
						{type=129,value=21840},			
					},				
						--·ÉÉý27¼¶			
					{				
						{type=9,value=3048},			
						{type=11,value=6402},			
						{type=128,value=270},			
						{type=129,value=23800},			
					},				
						--·ÉÉý28¼¶			
					{				
						{type=9,value=3252},			
						{type=11,value=6831},			
						{type=128,value=280},			
						{type=129,value=25760},			
					},				
						--·ÉÉý29¼¶			
					{				
						{type=9,value=3456},			
						{type=11,value=7260},			
						{type=128,value=290},			
						{type=129,value=27720},			
					},				
						--·ÉÉý30¼¶			
					{				
						{type=9,value=3660},			
						{type=11,value=7689},			
						{type=128,value=300},			
						{type=129,value=29680},			
					},				
						--·ÉÉý31¼¶			
					{				
						{type=9,value=3864},			
						{type=11,value=8118},			
						{type=128,value=310},			
						{type=129,value=31640},			
					},				
						--·ÉÉý32¼¶			
					{				
						{type=9,value=4068},			
						{type=11,value=8547},			
						{type=128,value=320},			
						{type=129,value=33600},			
					},				
						--·ÉÉý33¼¶			
					{				
						{type=9,value=4272},			
						{type=11,value=8976},			
						{type=128,value=330},			
						{type=129,value=35560},			
					},				
						--·ÉÉý34¼¶			
					{				
						{type=9,value=4476},			
						{type=11,value=9405},			
						{type=128,value=340},			
						{type=129,value=37520},			
					},				
						--·ÉÉý35¼¶			
					{				
						{type=9,value=4680},			
						{type=11,value=9834},			
						{type=128,value=350},			
						{type=129,value=39480},			
					},				
						--·ÉÉý36¼¶			
					{				
						{type=9,value=4884},			
						{type=11,value=10263},			
						{type=128,value=360},			
						{type=129,value=41440},			
					},				
						--·ÉÉý37¼¶			
					{				
						{type=9,value=5088},			
						{type=11,value=10692},			
						{type=128,value=370},			
						{type=129,value=43400},			
					},				
						--·ÉÉý38¼¶			
					{				
						{type=9,value=5292},			
						{type=11,value=11121},			
						{type=128,value=380},			
						{type=129,value=45360},			
					},				
						--·ÉÉý39¼¶			
					{				
						{type=9,value=5496},			
						{type=11,value=11550},			
						{type=128,value=390},			
						{type=129,value=47320},			
					},				
						--·ÉÉý40¼¶			
					{				
						{type=9,value=5700},			
						{type=11,value=11979},			
						{type=128,value=400},			
						{type=129,value=49280},			
					},				
						--·ÉÉý41¼¶			
					{				
						{type=9,value=5904},			
						{type=11,value=12408},			
						{type=128,value=410},			
						{type=129,value=51240},			
					},				
						--·ÉÉý42¼¶			
					{				
						{type=9,value=6108},			
						{type=11,value=12837},			
						{type=128,value=420},			
						{type=129,value=53200},			
					},				
						--·ÉÉý43¼¶			
					{				
						{type=9,value=6312},			
						{type=11,value=13266},			
						{type=128,value=430},			
						{type=129,value=55160},			
					},				
						--·ÉÉý44¼¶			
					{				
						{type=9,value=6516},			
						{type=11,value=13695},			
						{type=128,value=440},			
						{type=129,value=57120},			
					},				
						--·ÉÉý45¼¶			
					{				
						{type=9,value=6720},			
						{type=11,value=14124},			
						{type=128,value=450},			
						{type=129,value=59080},			
					},				
						--·ÉÉý46¼¶			
					{				
						{type=9,value=6924},			
						{type=11,value=14553},			
						{type=128,value=460},			
						{type=129,value=61040},			
					},				
						--·ÉÉý47¼¶			
					{				
						{type=9,value=7128},			
						{type=11,value=14982},			
						{type=128,value=470},			
						{type=129,value=63000},			
					},				
						--·ÉÉý48¼¶			
					{				
						{type=9,value=7332},			
						{type=11,value=15411},			
						{type=128,value=480},			
						{type=129,value=64960},			
					},				
						--·ÉÉý49¼¶			
					{				
						{type=9,value=7536},			
						{type=11,value=15840},			
						{type=128,value=490},			
						{type=129,value=66920},			
					},				
						--·ÉÉý50¼¶			
					{				
						{type=9,value=7740},			
						{type=11,value=16269},			
						{type=128,value=500},			
						{type=129,value=68880},			
					},				
		    		
		    	},	 
		    	
		    	-- ·¨
				{
					
					-- ·ÉÉý1 ¼¶ --
					{
						{type=13,value=38},
			    		{type=15,value=78},
						{type=128,value=10},
						{type=129,value=140},

		    		},

					-- ·ÉÉý2 ¼¶ --
					{
						{type=13,value=75},
			    		{type=15,value=157},
						{type=128,value=20},
						{type=129,value=280},

		    		},

					-- ·ÉÉý3 ¼¶ --
					{
						{type=13,value=112},
			    		{type=15,value=235},
						{type=128,value=30},
						{type=129,value=420},

		    		},

					-- ·ÉÉý4 ¼¶ --
					{
						{type=13,value=150},
			    		{type=15,value=314},
						{type=128,value=40},
						{type=129,value=560},

		    		},

					-- ·ÉÉý5 ¼¶ --
					{
						{type=13,value=188},
			    		{type=15,value=393},
						{type=128,value=50},
						{type=129,value=648},

		    		},

					-- ·ÉÉý6 ¼¶ --
					{
						{type=13,value=248},
			    		{type=15,value=519},
						{type=128,value=60},
						{type=129,value=944},

		    		},

					-- ·ÉÉý7 ¼¶ --
					{
						{type=13,value=308},
			    		{type=15,value=645},
						{type=128,value=70},
						{type=129,value=1240},

		    		},

					-- ·ÉÉý8 ¼¶ --
					{
						{type=13,value=368},
			    		{type=15,value=771},
						{type=128,value=80},
						{type=129,value=1536},

		    		},

					-- ·ÉÉý9 ¼¶ --
					{
						{type=13,value=428},
			    		{type=15,value=897},
						{type=128,value=90},
						{type=129,value=1832},

		    		},

					-- ·ÉÉý10 ¼¶ --
					{
						{type=13,value=488},
			    		{type=15,value=1023},
						{type=128,value=100},
						{type=129,value=2128},

		    		},

					-- ·ÉÉý11 ¼¶ --
					{
						{type=13,value=573},
			    		{type=15,value=1202},
						{type=128,value=110},
						{type=129,value=2684},

		    		},

					-- ·ÉÉý12 ¼¶ --
					{
						{type=13,value=660},
			    		{type=15,value=1384},
						{type=128,value=120},
						{type=129,value=3240},

		    		},

					-- ·ÉÉý13 ¼¶ --
					{
						{type=13,value=746},
			    		{type=15,value=1566},
						{type=128,value=130},
						{type=129,value=3796},

		    		},

					-- ·ÉÉý14 ¼¶ --
					{
						{type=13,value=833},
			    		{type=15,value=1748},
						{type=128,value=140},
						{type=129,value=4352},

		    		},

					-- ·ÉÉý15 ¼¶ --
					{
						{type=13,value=920},
			    		{type=15,value=1932},
						{type=128,value=150},
						{type=129,value=4856},

		    		},

					-- ·ÉÉý16 ¼¶ --
					{
						{type=13,value=1060},
			    		{type=15,value=2225},
						{type=128,value=160},
						{type=129,value=5932},

		    		},

					-- ·ÉÉý17 ¼¶ --
					{
						{type=13,value=1200},
			    		{type=15,value=2518},
						{type=128,value=170},
						{type=129,value=7008},

		    		},

					-- ·ÉÉý18 ¼¶ --
					{
						{type=13,value=1339},
			    		{type=15,value=2811},
						{type=128,value=180},
						{type=129,value=8084},

		    		},

					-- ·ÉÉý19 ¼¶ --
					{
						{type=13,value=1479},
			    		{type=15,value=3104},
						{type=128,value=190},
						{type=129,value=9160},

		    		},

					-- ·ÉÉý20 ¼¶ --
					{
						{type=13,value=1619},
			    		{type=15,value=3399},
						{type=128,value=200},
						{type=129,value=10080},

		    		},

					-- ·ÉÉý21 ¼¶ --
					{
						{type=13,value=1823},
			    		{type=15,value=3828},
						{type=128,value=210},
						{type=129,value=12040},

		    		},

					-- ·ÉÉý22 ¼¶ --
					{
						{type=13,value=2028},
			    		{type=15,value=4257},
						{type=128,value=220},
						{type=129,value=14000},

		    		},

					-- ·ÉÉý23 ¼¶ --
					{
						{type=13,value=2232},
			    		{type=15,value=4686},
						{type=128,value=230},
						{type=129,value=15960},

		    		},

					-- ·ÉÉý24 ¼¶ --
					{
						{type=13,value=2436},
			    		{type=15,value=5115},
						{type=128,value=240},
						{type=129,value=17920},

		    		},

					-- ·ÉÉý25 ¼¶ --
					{
						{type=13,value=2640},
			    		{type=15,value=5544},
						{type=128,value=250},
						{type=129,value=19880},

		    		},

	                 --·ÉÉý26¼¶			
					{				
						{type=13,value=2844},			
						{type=15,value=5973},			
						{type=128,value=260},			
						{type=129,value=21840},			
					},				
						--·ÉÉý27¼¶			
					{				
						{type=13,value=3048},			
						{type=15,value=6402},			
						{type=128,value=270},			
						{type=129,value=23800},			
					},				
						--·ÉÉý28¼¶			
					{				
						{type=13,value=3252},			
						{type=15,value=6831},			
						{type=128,value=280},			
						{type=129,value=25760},			
					},				
						--·ÉÉý29¼¶			
					{				
						{type=13,value=3456},			
						{type=15,value=7260},			
						{type=128,value=290},			
						{type=129,value=27720},			
					},				
						--·ÉÉý30¼¶			
					{				
						{type=13,value=3660},			
						{type=15,value=7689},			
						{type=128,value=300},			
						{type=129,value=29680},			
					},				
						--·ÉÉý31¼¶			
					{				
						{type=13,value=3864},			
						{type=15,value=8118},			
						{type=128,value=310},			
						{type=129,value=31640},			
					},				
						--·ÉÉý32¼¶			
					{				
						{type=13,value=4068},			
						{type=15,value=8547},			
						{type=128,value=320},			
						{type=129,value=33600},			
					},				
						--·ÉÉý33¼¶			
					{				
						{type=13,value=4272},			
						{type=15,value=8976},			
						{type=128,value=330},			
						{type=129,value=35560},			
					},				
						--·ÉÉý34¼¶			
					{				
						{type=13,value=4476},			
						{type=15,value=9405},			
						{type=128,value=340},			
						{type=129,value=37520},			
					},				
						--·ÉÉý35¼¶			
					{				
						{type=13,value=4680},			
						{type=15,value=9834},			
						{type=128,value=350},			
						{type=129,value=39480},			
					},				
						--·ÉÉý36¼¶			
					{				
						{type=13,value=4884},			
						{type=15,value=10263},			
						{type=128,value=360},			
						{type=129,value=41440},			
					},				
						--·ÉÉý37¼¶			
					{				
						{type=13,value=5088},			
						{type=15,value=10692},			
						{type=128,value=370},			
						{type=129,value=43400},			
					},				
						--·ÉÉý38¼¶			
					{				
						{type=13,value=5292},			
						{type=15,value=11121},			
						{type=128,value=380},			
						{type=129,value=45360},			
					},				
						--·ÉÉý39¼¶			
					{				
						{type=13,value=5496},			
						{type=15,value=11550},			
						{type=128,value=390},			
						{type=129,value=47320},			
					},				
						--·ÉÉý40¼¶			
					{				
						{type=13,value=5700},			
						{type=15,value=11979},			
						{type=128,value=400},			
						{type=129,value=49280},			
					},				
						--·ÉÉý41¼¶			
					{				
						{type=13,value=5904},			
						{type=15,value=12408},			
						{type=128,value=410},			
						{type=129,value=51240},			
					},				
						--·ÉÉý42¼¶			
					{				
						{type=13,value=6108},			
						{type=15,value=12837},			
						{type=128,value=420},			
						{type=129,value=53200},			
					},				
						--·ÉÉý43¼¶			
					{				
						{type=13,value=6312},			
						{type=15,value=13266},			
						{type=128,value=430},			
						{type=129,value=55160},			
					},				
						--·ÉÉý44¼¶			
					{				
						{type=13,value=6516},			
						{type=15,value=13695},			
						{type=128,value=440},			
						{type=129,value=57120},			
					},				
						--·ÉÉý45¼¶			
					{				
						{type=13,value=6720},			
						{type=15,value=14124},			
						{type=128,value=450},			
						{type=129,value=59080},			
					},				
						--·ÉÉý46¼¶			
					{				
						{type=13,value=6924},			
						{type=15,value=14553},			
						{type=128,value=460},			
						{type=129,value=61040},			
					},				
						--·ÉÉý47¼¶			
					{				
						{type=13,value=7128},			
						{type=15,value=14982},			
						{type=128,value=470},			
						{type=129,value=63000},			
					},				
						--·ÉÉý48¼¶			
					{				
						{type=13,value=7332},			
						{type=15,value=15411},			
						{type=128,value=480},			
						{type=129,value=64960},			
					},				
						--·ÉÉý49¼¶			
					{				
						{type=13,value=7536},			
						{type=15,value=15840},			
						{type=128,value=490},			
						{type=129,value=66920},			
					},				
						--·ÉÉý50¼¶			
					{				
						{type=13,value=7740},			
						{type=15,value=16269},			
						{type=128,value=500},			
						{type=129,value=68880},			
					},	
		    		
		    	},	 
		    	
		    	-- µÀ
				{
				
					-- ·ÉÉý1 ¼¶ --
					{
						{type=17,value=38},
			    		{type=19,value=78},
						{type=128,value=10},
						{type=129,value=140},

		    		},

					-- ·ÉÉý2 ¼¶ --
					{
						{type=17,value=75},
			    		{type=19,value=157},
						{type=128,value=20},
						{type=129,value=280},

		    		},

					-- ·ÉÉý3 ¼¶ --
					{
						{type=17,value=112},
			    		{type=19,value=235},
						{type=128,value=30},
						{type=129,value=420},

		    		},

					-- ·ÉÉý4 ¼¶ --
					{
						{type=17,value=150},
			    		{type=19,value=314},
						{type=128,value=40},
						{type=129,value=560},

		    		},

					-- ·ÉÉý5 ¼¶ --
					{
						{type=17,value=188},
			    		{type=19,value=393},
						{type=128,value=50},
						{type=129,value=648},

		    		},

					-- ·ÉÉý6 ¼¶ --
					{
						{type=17,value=248},
			    		{type=19,value=519},
						{type=128,value=60},
						{type=129,value=944},

		    		},

					-- ·ÉÉý7 ¼¶ --
					{
						{type=17,value=308},
			    		{type=19,value=645},
						{type=128,value=70},
						{type=129,value=1240},

		    		},

					-- ·ÉÉý8 ¼¶ --
					{
						{type=17,value=368},
			    		{type=19,value=771},
						{type=128,value=80},
						{type=129,value=1536},

		    		},

					-- ·ÉÉý9 ¼¶ --
					{
						{type=17,value=428},
			    		{type=19,value=897},
						{type=128,value=90},
						{type=129,value=1832},

		    		},

					-- ·ÉÉý10 ¼¶ --
					{
						{type=17,value=488},
			    		{type=19,value=1023},
						{type=128,value=100},
						{type=129,value=2128},

		    		},

					-- ·ÉÉý11 ¼¶ --
					{
						{type=17,value=573},
			    		{type=19,value=1202},
						{type=128,value=110},
						{type=129,value=2684},

		    		},

					-- ·ÉÉý12 ¼¶ --
					{
						{type=17,value=660},
			    		{type=19,value=1384},
						{type=128,value=120},
						{type=129,value=3240},

		    		},

					-- ·ÉÉý13 ¼¶ --
					{
						{type=17,value=746},
			    		{type=19,value=1566},
						{type=128,value=130},
						{type=129,value=3796},

		    		},

					-- ·ÉÉý14 ¼¶ --
					{
						{type=17,value=833},
			    		{type=19,value=1748},
						{type=128,value=140},
						{type=129,value=4352},

		    		},

					-- ·ÉÉý15 ¼¶ --
					{
						{type=17,value=920},
			    		{type=19,value=1932},
						{type=128,value=150},
						{type=129,value=4856},

		    		},

					-- ·ÉÉý16 ¼¶ --
					{
						{type=17,value=1060},
			    		{type=19,value=2225},
						{type=128,value=160},
						{type=129,value=5932},

		    		},

					-- ·ÉÉý17 ¼¶ --
					{
						{type=17,value=1200},
			    		{type=19,value=2518},
						{type=128,value=170},
						{type=129,value=7008},

		    		},

					-- ·ÉÉý18 ¼¶ --
					{
						{type=17,value=1339},
			    		{type=19,value=2811},
						{type=128,value=180},
						{type=129,value=8084},

		    		},

					-- ·ÉÉý19 ¼¶ --
					{
						{type=17,value=1479},
			    		{type=19,value=3104},
						{type=128,value=190},
						{type=129,value=9160},

		    		},

					-- ·ÉÉý20 ¼¶ --
					{
						{type=17,value=1619},
			    		{type=19,value=3399},
						{type=128,value=200},
						{type=129,value=10080},

		    		},

					-- ·ÉÉý21 ¼¶ --
					{
						{type=17,value=1823},
			    		{type=19,value=3828},
						{type=128,value=210},
						{type=129,value=12040},

		    		},

					-- ·ÉÉý22 ¼¶ --
					{
						{type=17,value=2028},
			    		{type=19,value=4257},
						{type=128,value=220},
						{type=129,value=14000},

		    		},

					-- ·ÉÉý23 ¼¶ --
					{
						{type=17,value=2232},
			    		{type=19,value=4686},
						{type=128,value=230},
						{type=129,value=15960},

		    		},

					-- ·ÉÉý24 ¼¶ --
					{
						{type=17,value=2436},
			    		{type=19,value=5115},
						{type=128,value=240},
						{type=129,value=17920},

		    		},

					-- ·ÉÉý25 ¼¶ --
					{
						{type=17,value=2640},
			    		{type=19,value=5544},
						{type=128,value=250},
						{type=129,value=19880},

		    		},
	                 --·ÉÉý26¼¶			
					{				
						{type=17,value=2844},			
						{type=19,value=5973},			
						{type=128,value=260},			
						{type=129,value=21840},			
					},				
						--·ÉÉý27¼¶			
					{				
						{type=17,value=3048},			
						{type=19,value=6402},			
						{type=128,value=270},			
						{type=129,value=23800},			
					},				
						--·ÉÉý28¼¶			
					{				
						{type=17,value=3252},			
						{type=19,value=6831},			
						{type=128,value=280},			
						{type=129,value=25760},			
					},				
						--·ÉÉý29¼¶			
					{				
						{type=17,value=3456},			
						{type=19,value=7260},			
						{type=128,value=290},			
						{type=129,value=27720},			
					},				
						--·ÉÉý30¼¶			
					{				
						{type=17,value=3660},			
						{type=19,value=7689},			
						{type=128,value=300},			
						{type=129,value=29680},			
					},				
						--·ÉÉý31¼¶			
					{				
						{type=17,value=3864},			
						{type=19,value=8118},			
						{type=128,value=310},			
						{type=129,value=31640},			
					},				
						--·ÉÉý32¼¶			
					{				
						{type=17,value=4068},			
						{type=19,value=8547},			
						{type=128,value=320},			
						{type=129,value=33600},			
					},				
						--·ÉÉý33¼¶			
					{				
						{type=17,value=4272},			
						{type=19,value=8976},			
						{type=128,value=330},			
						{type=129,value=35560},			
					},				
						--·ÉÉý34¼¶			
					{				
						{type=17,value=4476},			
						{type=19,value=9405},			
						{type=128,value=340},			
						{type=129,value=37520},			
					},				
						--·ÉÉý35¼¶			
					{				
						{type=17,value=4680},			
						{type=19,value=9834},			
						{type=128,value=350},			
						{type=129,value=39480},			
					},				
						--·ÉÉý36¼¶			
					{				
						{type=17,value=4884},			
						{type=19,value=10263},			
						{type=128,value=360},			
						{type=129,value=41440},			
					},				
						--·ÉÉý37¼¶			
					{				
						{type=17,value=5088},			
						{type=19,value=10692},			
						{type=128,value=370},			
						{type=129,value=43400},			
					},				
						--·ÉÉý38¼¶			
					{				
						{type=17,value=5292},			
						{type=19,value=11121},			
						{type=128,value=380},			
						{type=129,value=45360},			
					},				
						--·ÉÉý39¼¶			
					{				
						{type=17,value=5496},			
						{type=19,value=11550},			
						{type=128,value=390},			
						{type=129,value=47320},			
					},				
						--·ÉÉý40¼¶			
					{				
						{type=17,value=5700},			
						{type=19,value=11979},			
						{type=128,value=400},			
						{type=129,value=49280},			
					},				
						--·ÉÉý41¼¶			
					{				
						{type=17,value=5904},			
						{type=19,value=12408},			
						{type=128,value=410},			
						{type=129,value=51240},			
					},				
						--·ÉÉý42¼¶			
					{				
						{type=17,value=6108},			
						{type=19,value=12837},			
						{type=128,value=420},			
						{type=129,value=53200},			
					},				
						--·ÉÉý43¼¶			
					{				
						{type=17,value=6312},			
						{type=19,value=13266},			
						{type=128,value=430},			
						{type=129,value=55160},			
					},				
						--·ÉÉý44¼¶			
					{				
						{type=17,value=6516},			
						{type=19,value=13695},			
						{type=128,value=440},			
						{type=129,value=57120},			
					},				
						--·ÉÉý45¼¶			
					{				
						{type=17,value=6720},			
						{type=19,value=14124},			
						{type=128,value=450},			
						{type=129,value=59080},			
					},				
						--·ÉÉý46¼¶			
					{				
						{type=17,value=6924},			
						{type=19,value=14553},			
						{type=128,value=460},			
						{type=129,value=61040},			
					},				
						--·ÉÉý47¼¶			
					{				
						{type=17,value=7128},			
						{type=19,value=14982},			
						{type=128,value=470},			
						{type=129,value=63000},			
					},				
						--·ÉÉý48¼¶			
					{				
						{type=17,value=7332},			
						{type=19,value=15411},			
						{type=128,value=480},			
						{type=129,value=64960},			
					},				
						--·ÉÉý49¼¶			
					{				
						{type=17,value=7536},			
						{type=19,value=15840},			
						{type=128,value=490},			
						{type=129,value=66920},			
					},				
						--·ÉÉý50¼¶			
					{				
						{type=17,value=7740},			
						{type=19,value=16269},			
						{type=128,value=500},			
						{type=129,value=68880},			
					},	

		    		
		    	},	 
			}, 
		},






-------------------------



		-- ³á°ò 5
		{
			itemId = 6223,--
			
			-- ³á°òÀàÐÍ£º1 Îª»ÃÓð³á°ò, 2 Îª¾ø°æ³á°ò
			swingType = 1,
			
			-- Ã¿½×µÄ³á°òÍâ¹Û
			--swingShowIds = {26,27,28,29,30}, 
			swingShowIds = {46,47,48,49,50,50,50,50,50,50}, 
			
			-- Í¼±ê
			iconIds = {30547,30548,30549,30550,30551,30551,30551,30551,30551,30551}, 
			
			--³á°òid(C++ÒªÓÃ)
			swingIds = {6227,6228,6229,6230,6231,7888,7889,7890,7891,7892},
			
			-- Éý½×ÏûºÄ³á°òÊýÁ¿(µÚ1¸ö´ú±í0µ½1½×)
			classConsumeCounts = { 1,4,8,16,32,64,128,256,512,800},
			
			-- Éý¼¶ÏûºÄ³á°ò½á¾§ÊýÁ¿(µÚ1¸ö´ú±í0µ½1¼¶)
			levelConsumeCounts = {2,4,6,8,10,12,14,16,18,20,23,27,31,35,40,45,50,56,62,68,74,81,88,96,103,110,117,124,131,138,145,152,159,166,173,180,187,194,201,208,215,222,229,236,243,250,257,264,271,278},
			
			-- ½×¼¶ÊôÐÔ
			classAttrs = {
				-- Õ½

					-- -- (a1) --
					-- {
					-- 	{type=(a2),value=(a3)},
			    	-- 	{type=(a4),value=(a5)},
					-- 	{type=(a6),value=(a7)},
					-- 	{type=(a8),value=(a9)},

		    		-- },

				{
										-- 1½× --
					{
						{type=9,value=125},
			    		{type=11,value=262},
						{type=5,value=3120},
						{type=7,value=315},

		    		},
					-- Éý½×1 --
					{
						{type=9,value=325},
			    		{type=11,value=682},
						{type=5,value=8320},
						{type=7,value=840},

		    		},
					-- Éý½×2 --
					{
						{type=9,value=614},
			    		{type=11,value=1288},
						{type=5,value=16640},
						{type=7,value=1681},

		    		},
					-- Éý½×3 --
					{
						{type=9,value=1080},
			    		{type=11,value=2266},
						{type=5,value=31200},
						{type=7,value=3152},

		    		},
					-- Éý½×4 --
					{
						{type=9,value=1760},
			    		{type=11,value=3696},
						{type=5,value=57200},
						{type=7,value=5778},

		    		},
					-- Éý½×6 --
					{
						{type=9,value=2440},
						{type=11,value=5126},
						{type=5,value=83200},
						{type=7,value=8004},

		    		},	

					-- Éý½×7 --
					{
						{type=9,value=3120},
						{type=11,value=6556},
						{type=5,value=109200},
						{type=7,value=10430},
		    		},	

					-- Éý½×8 --
					{
						{type=9,value=3800},
						{type=11,value=7986},
						{type=5,value=135200},
						{type=7,value=12856},
		    		},

					-- Éý½×9 --
					{
						{type=9,value=4480},
						{type=11,value=9416},
						{type=5,value=161200},
						{type=7,value=15282},
		    		},	

					-- Éý½×10 --
					{
						{type=9,value=5160},
						{type=11,value=10846},
						{type=5,value=187200},
						{type=7,value=17708},
		    		},	    				    		
		    	},	 
		    	
		    	-- ·¨
				{
										-- 1½× --
					{
						{type=13,value=125},
			    		{type=15,value=262},
						{type=5,value=803},
						{type=7,value=3212},

		    		},
					-- Éý½×1 --
					{
						{type=13,value=325},
			    		{type=15,value=682},
						{type=5,value=2139},
						{type=7,value=8556},

		    		},
					-- Éý½×2 --
					{
						{type=13,value=614},
			    		{type=15,value=1288},
						{type=5,value=4278},
						{type=7,value=17112},

		    		},
					-- Éý½×3 --
					{
						{type=13,value=1080},
			    		{type=15,value=2266},
						{type=5,value=8021},
						{type=7,value=32084},

		    		},
					-- Éý½×4 --
					{
						{type=13,value=1760},
			    		{type=15,value=3696},
						{type=5,value=14705},
						{type=7,value=58820},

		    		},
					-- Éý½×6 --
					{
						{type=13,value=2440},
						{type=15,value=5126},
						{type=5,value=21389},
						{type=7,value=85556},

		    		},
					-- Éý½×7 --
					{
						{type=13,value=3120},
						{type=15,value=6556},
						{type=5,value=28073},
						{type=7,value=112292},
		    		},
					-- Éý½×8 --
					{
						{type=13,value=3800},
						{type=15,value=7986},
						{type=5,value=34757},
						{type=7,value=139028},
		    		},
					-- Éý½×9 --
					{
						{type=13,value=4480},
						{type=15,value=9416},
						{type=5,value=41441},
						{type=7,value=165764},
		    		},
					-- Éý½×10 --
					{
						{type=13,value=5160},
						{type=15,value=10846},
						{type=5,value=48125},
						{type=7,value=192500},
		    		},    				    
		    		
		    	},	 
		    	
		    	-- µÀ
				{
										-- 1½× --
					{
						{type=17,value=125},
			    		{type=19,value=262},
						{type=5,value=1744},
						{type=7,value=1744},

		    		},
					-- Éý½×1 --
					{
						{type=17,value=325},
			    		{type=19,value=682},
						{type=5,value=4649},
						{type=7,value=4649},

		    		},
					-- Éý½×2 --
					{
						{type=17,value=614},
			    		{type=19,value=1288},
						{type=5,value=9297},
						{type=7,value=9297},

		    		},
					-- Éý½×3 --
					{
						{type=17,value=1080},
			    		{type=19,value=2266},
						{type=5,value=17431},
						{type=7,value=17431},

		    		},
					-- Éý½×4 --
					{
						{type=17,value=1760},
			    		{type=19,value=3696},
						{type=5,value=31956},
						{type=7,value=31956},

		    		},
					-- Éý½×6 --
					{
						{type=17,value=2440},
						{type=19,value=5126},
						{type=5,value=46481},
						{type=7,value=46481},

		    		},
					-- Éý½×7 --
					{
						{type=17,value=3120},
						{type=19,value=6556},
						{type=5,value=61006},
						{type=7,value=61006},

		    		},
					-- Éý½×8 --
					{
						{type=17,value=3800},
						{type=19,value=7986},
						{type=5,value=75531},
						{type=7,value=75531},

		    		},
					-- Éý½×9 --
					{
						{type=17,value=4480},
						{type=19,value=9416},
						{type=5,value=90056},
						{type=7,value=90056},
		    		},
					-- Éý½×10 --
					{
						{type=17,value=5160},
						{type=19,value=10846},
						{type=5,value=104581},
						{type=7,value=104581},
		    		},
		    		
		    	},	    	
		    	
			},
			
			-- µÈ¼¶ÊôÐÔ
			levelAttrs = {
				-- Õ½
					-- -- 	--Ä£¿é
					-- 			-- (a1) ¼¶ --
					-- {
					-- 	{type=(a2),value=(a3)},
			    	-- 	{type=(a4),value=(a5)},
					-- 	{type=(a6),value=(a7)},
					-- 	{type=(a8),value=(a9)},

		    		-- },



				{
													-- ·ÉÉý1 ¼¶ --
					{
						{type=9,value=38},
			    		{type=11,value=78},
						{type=5,value=1300},
						{type=7,value=131},

		    		},
								-- ·ÉÉý2 ¼¶ --
					{
						{type=9,value=75},
			    		{type=11,value=157},
						{type=5,value=2600},
						{type=7,value=263},

		    		},
								-- ·ÉÉý3 ¼¶ --
					{
						{type=9,value=112},
			    		{type=11,value=235},
						{type=5,value=3900},
						{type=7,value=394},

		    		},
								-- ·ÉÉý4 ¼¶ --
					{
						{type=9,value=150},
			    		{type=11,value=314},
						{type=5,value=5200},
						{type=7,value=525},

		    		},
								-- ·ÉÉý5 ¼¶ --
					{
						{type=9,value=188},
			    		{type=11,value=393},
						{type=5,value=6240},
						{type=7,value=630},

		    		},
								-- ·ÉÉý6 ¼¶ --
					{
						{type=9,value=248},
			    		{type=11,value=519},
						{type=5,value=8320},
						{type=7,value=840},

		    		},
								-- ·ÉÉý7 ¼¶ --
					{
						{type=9,value=308},
			    		{type=11,value=645},
						{type=5,value=10400},
						{type=7,value=1051},

		    		},
								-- ·ÉÉý8 ¼¶ --
					{
						{type=9,value=368},
			    		{type=11,value=771},
						{type=5,value=12480},
						{type=7,value=1261},

		    		},
								-- ·ÉÉý9 ¼¶ --
					{
						{type=9,value=428},
			    		{type=11,value=897},
						{type=5,value=14560},
						{type=7,value=1471},

		    		},
								-- ·ÉÉý10 ¼¶ --
					{
						{type=9,value=488},
			    		{type=11,value=1023},
						{type=5,value=16640},
						{type=7,value=1681},

		    		},
								-- ·ÉÉý11 ¼¶ --
					{
						{type=9,value=573},
			    		{type=11,value=1202},
						{type=5,value=20020},
						{type=7,value=2022},

		    		},
								-- ·ÉÉý12 ¼¶ --
					{
						{type=9,value=660},
			    		{type=11,value=1384},
						{type=5,value=23400},
						{type=7,value=2364},

		    		},
								-- ·ÉÉý13 ¼¶ --
					{
						{type=9,value=746},
			    		{type=11,value=1566},
						{type=5,value=26780},
						{type=7,value=2705},

		    		},
								-- ·ÉÉý14 ¼¶ --
					{
						{type=9,value=833},
			    		{type=11,value=1748},
						{type=5,value=30160},
						{type=7,value=3046},

		    		},
								-- ·ÉÉý15 ¼¶ --
					{
						{type=9,value=920},
			    		{type=11,value=1932},
						{type=5,value=33280},
						{type=7,value=3362},

		    		},
								-- ·ÉÉý16 ¼¶ --
					{
						{type=9,value=1060},
			    		{type=11,value=2225},
						{type=5,value=39260},
						{type=7,value=3966},

		    		},
								-- ·ÉÉý17 ¼¶ --
					{
						{type=9,value=1200},
			    		{type=11,value=2518},
						{type=5,value=45240},
						{type=7,value=4570},

		    		},
								-- ·ÉÉý18 ¼¶ --
					{
						{type=9,value=1339},
			    		{type=11,value=2811},
						{type=5,value=51220},
						{type=7,value=5174},

		    		},
								-- ·ÉÉý19 ¼¶ --
					{
						{type=9,value=1479},
			    		{type=11,value=3104},
						{type=5,value=57200},
						{type=7,value=5778},

		    		},
								-- ·ÉÉý20 ¼¶ --
					{
						{type=9,value=1619},
			    		{type=11,value=3399},
						{type=5,value=62400},
						{type=7,value=6303},

		    		},
								-- ·ÉÉý21 ¼¶ --
					{
						{type=9,value=1823},
			    		{type=11,value=3828},
						{type=5,value=72800},
						{type=7,value=7354},

		    		},
								-- ·ÉÉý22 ¼¶ --
					{
						{type=9,value=2028},
			    		{type=11,value=4257},
						{type=5,value=83200},
						{type=7,value=8404},

		    		},
								-- ·ÉÉý23 ¼¶ --
					{
						{type=9,value=2232},
			    		{type=11,value=4686},
						{type=5,value=93600},
						{type=7,value=9455},

		    		},
								-- ·ÉÉý24 ¼¶ --
					{
						{type=9,value=2436},
			    		{type=11,value=5115},
						{type=5,value=104000},
						{type=7,value=10505},

		    		},
								-- ·ÉÉý25 ¼¶ --
					{
						{type=9,value=2640},
			    		{type=11,value=5544},
						{type=5,value=114400},
						{type=7,value=11556},

		    		},
						--·ÉÉý26¼¶
					{	
						{type=9,value=2817},
						{type=11,value=5973},
						{type=5,value=124800},
						{type=7,value=12607},
					},	
						--·ÉÉý27¼¶
					{	
						{type=9,value=2994},
						{type=11,value=6402},
						{type=5,value=135200},
						{type=7,value=13658},
					},	
						--·ÉÉý28¼¶
					{	
						{type=9,value=3171},
						{type=11,value=6831},
						{type=5,value=145600},
						{type=7,value=14709},
					},	
						--·ÉÉý29¼¶
					{	
						{type=9,value=3348},
						{type=11,value=7260},
						{type=5,value=156000},
						{type=7,value=15760},
					},	
						--·ÉÉý30¼¶
					{	
						{type=9,value=3525},
						{type=11,value=7689},
						{type=5,value=166400},
						{type=7,value=16811},
					},	
						--·ÉÉý31¼¶
					{	
						{type=9,value=3702},
						{type=11,value=8118},
						{type=5,value=176800},
						{type=7,value=17862},
					},	
						--·ÉÉý32¼¶
					{	
						{type=9,value=3879},
						{type=11,value=8547},
						{type=5,value=187200},
						{type=7,value=18913},
					},	
						--·ÉÉý33¼¶
					{	
						{type=9,value=4056},
						{type=11,value=8976},
						{type=5,value=197600},
						{type=7,value=19964},
					},	
						--·ÉÉý34¼¶
					{	
						{type=9,value=4233},
						{type=11,value=9405},
						{type=5,value=208000},
						{type=7,value=21015},
					},	
						--·ÉÉý35¼¶
					{	
						{type=9,value=4410},
						{type=11,value=9834},
						{type=5,value=218400},
						{type=7,value=22066},
					},	
						--·ÉÉý36¼¶
					{	
						{type=9,value=4587},
						{type=11,value=10263},
						{type=5,value=228800},
						{type=7,value=23117},
					},	
						--·ÉÉý37¼¶
					{	
						{type=9,value=4764},
						{type=11,value=10692},
						{type=5,value=239200},
						{type=7,value=24168},
					},	
						--·ÉÉý38¼¶
					{	
						{type=9,value=4941},
						{type=11,value=11121},
						{type=5,value=249600},
						{type=7,value=25219},
					},	
						--·ÉÉý39¼¶
					{	
						{type=9,value=5118},
						{type=11,value=11550},
						{type=5,value=260000},
						{type=7,value=26270},
					},	
						--·ÉÉý40¼¶
					{	
						{type=9,value=5295},
						{type=11,value=11979},
						{type=5,value=270400},
						{type=7,value=27321},
					},	
						--·ÉÉý41¼¶
					{	
						{type=9,value=5472},
						{type=11,value=12408},
						{type=5,value=280800},
						{type=7,value=28372},
					},	
						--·ÉÉý42¼¶
					{	
						{type=9,value=5649},
						{type=11,value=12837},
						{type=5,value=291200},
						{type=7,value=29423},
					},	
						--·ÉÉý43¼¶
					{	
						{type=9,value=5826},
						{type=11,value=13266},
						{type=5,value=301600},
						{type=7,value=30474},
					},	
						--·ÉÉý44¼¶
					{	
						{type=9,value=6003},
						{type=11,value=13695},
						{type=5,value=312000},
						{type=7,value=31525},
					},	
						--·ÉÉý45¼¶
					{	
						{type=9,value=6180},
						{type=11,value=14124},
						{type=5,value=322400},
						{type=7,value=32576},
					},	
						--·ÉÉý46¼¶
					{	
						{type=9,value=6357},
						{type=11,value=14553},
						{type=5,value=332800},
						{type=7,value=33627},
					},	
						--·ÉÉý47¼¶
					{	
						{type=9,value=6534},
						{type=11,value=14982},
						{type=5,value=343200},
						{type=7,value=34678},
					},	
						--·ÉÉý48¼¶
					{	
						{type=9,value=6711},
						{type=11,value=15411},
						{type=5,value=353600},
						{type=7,value=35729},
					},	
						--·ÉÉý49¼¶
					{	
						{type=9,value=6888},
						{type=11,value=15840},
						{type=5,value=364000},
						{type=7,value=36780},
					},	
						--·ÉÉý50¼¶
					{	
						{type=9,value=7065},
						{type=11,value=16269},
						{type=5,value=374400},
						{type=7,value=37831},
					},			    		
		    	},	 
		    	
		    	-- ·¨
				{
													-- ·ÉÉý1 ¼¶ --
					{
						{type=13,value=38},
			    		{type=15,value=78},
						{type=5,value=335},
						{type=7,value=1340},

		    		},
								-- ·ÉÉý2 ¼¶ --
					{
						{type=13,value=75},
			    		{type=15,value=157},
						{type=5,value=669},
						{type=7,value=2676},

		    		},
								-- ·ÉÉý3 ¼¶ --
					{
						{type=13,value=112},
			    		{type=15,value=235},
						{type=5,value=1003},
						{type=7,value=4012},

		    		},
								-- ·ÉÉý4 ¼¶ --
					{
						{type=13,value=150},
			    		{type=15,value=314},
						{type=5,value=1337},
						{type=7,value=5348},

		    		},
								-- ·ÉÉý5 ¼¶ --
					{
						{type=13,value=188},
			    		{type=15,value=393},
						{type=5,value=1605},
						{type=7,value=6420},

		    		},
								-- ·ÉÉý6 ¼¶ --
					{
						{type=13,value=248},
			    		{type=15,value=519},
						{type=5,value=2139},
						{type=7,value=8556},

		    		},
								-- ·ÉÉý7 ¼¶ --
					{
						{type=13,value=308},
			    		{type=15,value=645},
						{type=5,value=2674},
						{type=7,value=10696},

		    		},
								-- ·ÉÉý8 ¼¶ --
					{
						{type=13,value=368},
			    		{type=15,value=771},
						{type=5,value=3209},
						{type=7,value=12836},

		    		},
								-- ·ÉÉý9 ¼¶ --
					{
						{type=13,value=428},
			    		{type=15,value=897},
						{type=5,value=3743},
						{type=7,value=14972},

		    		},
								-- ·ÉÉý10 ¼¶ --
					{
						{type=13,value=488},
			    		{type=15,value=1023},
						{type=5,value=4278},
						{type=7,value=17112},

		    		},
								-- ·ÉÉý11 ¼¶ --
					{
						{type=13,value=573},
			    		{type=15,value=1202},
						{type=5,value=5147},
						{type=7,value=20588},

		    		},
								-- ·ÉÉý12 ¼¶ --
					{
						{type=13,value=660},
			    		{type=15,value=1384},
						{type=5,value=6016},
						{type=7,value=24064},

		    		},
								-- ·ÉÉý13 ¼¶ --
					{
						{type=13,value=746},
			    		{type=15,value=1566},
						{type=5,value=6885},
						{type=7,value=27540},

		    		},
								-- ·ÉÉý14 ¼¶ --
					{
						{type=13,value=833},
			    		{type=15,value=1748},
						{type=5,value=7754},
						{type=7,value=31016},

		    		},
								-- ·ÉÉý15 ¼¶ --
					{
						{type=13,value=920},
			    		{type=15,value=1932},
						{type=5,value=8556},
						{type=7,value=34224},

		    		},
								-- ·ÉÉý16 ¼¶ --
					{
						{type=13,value=1060},
			    		{type=15,value=2225},
						{type=5,value=10093},
						{type=7,value=40372},

		    		},
								-- ·ÉÉý17 ¼¶ --
					{
						{type=13,value=1200},
			    		{type=15,value=2518},
						{type=5,value=11630},
						{type=7,value=46520},

		    		},
								-- ·ÉÉý18 ¼¶ --
					{
						{type=13,value=1339},
			    		{type=15,value=2811},
						{type=5,value=13168},
						{type=7,value=52672},

		    		},
								-- ·ÉÉý19 ¼¶ --
					{
						{type=13,value=1479},
			    		{type=15,value=3104},
						{type=5,value=14705},
						{type=7,value=58820},

		    		},
								-- ·ÉÉý20 ¼¶ --
					{
						{type=13,value=1619},
			    		{type=15,value=3399},
						{type=5,value=16042},
						{type=7,value=64168},

		    		},
								-- ·ÉÉý21 ¼¶ --
					{
						{type=13,value=1823},
			    		{type=15,value=3828},
						{type=5,value=18715},
						{type=7,value=74860},

		    		},
								-- ·ÉÉý22 ¼¶ --
					{
						{type=13,value=2028},
			    		{type=15,value=4257},
						{type=5,value=21389},
						{type=7,value=85556},

		    		},
								-- ·ÉÉý23 ¼¶ --
					{
						{type=13,value=2232},
			    		{type=15,value=4686},
						{type=5,value=24062},
						{type=7,value=96248},

		    		},
								-- ·ÉÉý24 ¼¶ --
					{
						{type=13,value=2436},
			    		{type=15,value=5115},
						{type=5,value=26736},
						{type=7,value=106944},

		    		},
								-- ·ÉÉý25 ¼¶ --
					{
						{type=13,value=2640},
			    		{type=15,value=5544},
						{type=5,value=29409},
						{type=7,value=117636},

		    		},
						--·ÉÉý26¼¶	
					{		
						{type=13,value=2817},	
						{type=15,value=5973},	
						{type=5,value=32082},	
						{type=7,value=128328},	
					},		
						--·ÉÉý27¼¶	
					{		
						{type=13,value=2994},	
						{type=15,value=6402},	
						{type=5,value=34755},	
						{type=7,value=139020},	
					},		
						--·ÉÉý28¼¶	
					{		
						{type=13,value=3171},	
						{type=15,value=6831},	
						{type=5,value=37428},	
						{type=7,value=149712},	
					},		
						--·ÉÉý29¼¶	
					{		
						{type=13,value=3348},	
						{type=15,value=7260},	
						{type=5,value=40101},	
						{type=7,value=160404},	
					},		
						--·ÉÉý30¼¶	
					{		
						{type=13,value=3525},	
						{type=15,value=7689},	
						{type=5,value=42774},	
						{type=7,value=171096},	
					},		
						--·ÉÉý31¼¶	
					{		
						{type=13,value=3702},	
						{type=15,value=8118},	
						{type=5,value=45447},	
						{type=7,value=181788},	
					},		
						--·ÉÉý32¼¶	
					{		
						{type=13,value=3879},	
						{type=15,value=8547},	
						{type=5,value=48120},	
						{type=7,value=192480},	
					},		
						--·ÉÉý33¼¶	
					{		
						{type=13,value=4056},	
						{type=15,value=8976},	
						{type=5,value=50793},	
						{type=7,value=203172},	
					},		
						--·ÉÉý34¼¶	
					{		
						{type=13,value=4233},	
						{type=15,value=9405},	
						{type=5,value=53466},	
						{type=7,value=213864},	
					},		
						--·ÉÉý35¼¶	
					{		
						{type=13,value=4410},	
						{type=15,value=9834},	
						{type=5,value=56139},	
						{type=7,value=224556},	
					},		
						--·ÉÉý36¼¶	
					{		
						{type=13,value=4587},	
						{type=15,value=10263},	
						{type=5,value=58812},	
						{type=7,value=235248},	
					},		
						--·ÉÉý37¼¶	
					{		
						{type=13,value=4764},	
						{type=15,value=10692},	
						{type=5,value=61485},	
						{type=7,value=245940},	
					},		
						--·ÉÉý38¼¶	
					{		
						{type=13,value=4941},	
						{type=15,value=11121},	
						{type=5,value=64158},	
						{type=7,value=256632},	
					},		
						--·ÉÉý39¼¶	
					{		
						{type=13,value=5118},	
						{type=15,value=11550},	
						{type=5,value=66831},	
						{type=7,value=267324},	
					},		
						--·ÉÉý40¼¶	
					{		
						{type=13,value=5295},	
						{type=15,value=11979},	
						{type=5,value=69504},	
						{type=7,value=278016},	
					},		
						--·ÉÉý41¼¶	
					{		
						{type=13,value=5472},	
						{type=15,value=12408},	
						{type=5,value=72177},	
						{type=7,value=288708},	
					},		
						--·ÉÉý42¼¶	
					{		
						{type=13,value=5649},	
						{type=15,value=12837},	
						{type=5,value=74850},	
						{type=7,value=299400},	
					},		
						--·ÉÉý43¼¶	
					{		
						{type=13,value=5826},	
						{type=15,value=13266},	
						{type=5,value=77523},	
						{type=7,value=310092},	
					},		
						--·ÉÉý44¼¶	
					{		
						{type=13,value=6003},	
						{type=15,value=13695},	
						{type=5,value=80196},	
						{type=7,value=320784},	
					},		
						--·ÉÉý45¼¶	
					{		
						{type=13,value=6180},	
						{type=15,value=14124},	
						{type=5,value=82869},	
						{type=7,value=331476},	
					},		
						--·ÉÉý46¼¶	
					{		
						{type=13,value=6357},	
						{type=15,value=14553},	
						{type=5,value=85542},	
						{type=7,value=342168},	
					},		
						--·ÉÉý47¼¶	
					{		
						{type=13,value=6534},	
						{type=15,value=14982},	
						{type=5,value=88215},	
						{type=7,value=352860},	
					},		
						--·ÉÉý48¼¶	
					{		
						{type=13,value=6711},	
						{type=15,value=15411},	
						{type=5,value=90888},	
						{type=7,value=363552},	
					},		
						--·ÉÉý49¼¶	
					{		
						{type=13,value=6888},	
						{type=15,value=15840},	
						{type=5,value=93561},	
						{type=7,value=374244},	
					},		
						--·ÉÉý50¼¶	
					{		
						{type=13,value=7065},	
						{type=15,value=16269},	
						{type=5,value=96234},	
						{type=7,value=384936},	
					},				    		
		    	},	 
		    	
		    	-- µÀ
				{
													-- ·ÉÉý1 ¼¶ --
					{
						{type=17,value=38},
			    		{type=19,value=78},
						{type=5,value=727},
						{type=7,value=727},

		    		},
								-- ·ÉÉý2 ¼¶ --
					{
						{type=17,value=75},
			    		{type=19,value=157},
						{type=5,value=1453},
						{type=7,value=1453},

		    		},
								-- ·ÉÉý3 ¼¶ --
					{
						{type=17,value=112},
			    		{type=19,value=235},
						{type=5,value=2179},
						{type=7,value=2179},

		    		},
								-- ·ÉÉý4 ¼¶ --
					{
						{type=17,value=150},
			    		{type=19,value=314},
						{type=5,value=2906},
						{type=7,value=2906},

		    		},
								-- ·ÉÉý5 ¼¶ --
					{
						{type=17,value=188},
			    		{type=19,value=393},
						{type=5,value=3487},
						{type=7,value=3487},

		    		},
								-- ·ÉÉý6 ¼¶ --
					{
						{type=17,value=248},
			    		{type=19,value=519},
						{type=5,value=4649},
						{type=7,value=4649},

		    		},
								-- ·ÉÉý7 ¼¶ --
					{
						{type=17,value=308},
			    		{type=19,value=645},
						{type=5,value=5811},
						{type=7,value=5811},

		    		},
								-- ·ÉÉý8 ¼¶ --
					{
						{type=17,value=368},
			    		{type=19,value=771},
						{type=5,value=6973},
						{type=7,value=6973},

		    		},
								-- ·ÉÉý9 ¼¶ --
					{
						{type=17,value=428},
			    		{type=19,value=897},
						{type=5,value=8135},
						{type=7,value=8135},

		    		},
								-- ·ÉÉý10 ¼¶ --
					{
						{type=17,value=488},
			    		{type=19,value=1023},
						{type=5,value=9297},
						{type=7,value=9297},

		    		},
								-- ·ÉÉý11 ¼¶ --
					{
						{type=17,value=573},
			    		{type=19,value=1202},
						{type=5,value=11185},
						{type=7,value=11185},

		    		},
								-- ·ÉÉý12 ¼¶ --
					{
						{type=17,value=660},
			    		{type=19,value=1384},
						{type=5,value=13073},
						{type=7,value=13073},

		    		},
								-- ·ÉÉý13 ¼¶ --
					{
						{type=17,value=746},
			    		{type=19,value=1566},
						{type=5,value=14961},
						{type=7,value=14961},

		    		},
								-- ·ÉÉý14 ¼¶ --
					{
						{type=17,value=833},
			    		{type=19,value=1748},
						{type=5,value=16850},
						{type=7,value=16850},

		    		},
								-- ·ÉÉý15 ¼¶ --
					{
						{type=17,value=920},
			    		{type=19,value=1932},
						{type=5,value=18593},
						{type=7,value=18593},

		    		},
								-- ·ÉÉý16 ¼¶ --
					{
						{type=17,value=1060},
			    		{type=19,value=2225},
						{type=5,value=21933},
						{type=7,value=21933},

		    		},
								-- ·ÉÉý17 ¼¶ --
					{
						{type=17,value=1200},
			    		{type=19,value=2518},
						{type=5,value=25274},
						{type=7,value=25274},

		    		},
								-- ·ÉÉý18 ¼¶ --
					{
						{type=17,value=1339},
			    		{type=19,value=2811},
						{type=5,value=28615},
						{type=7,value=28615},

		    		},
								-- ·ÉÉý19 ¼¶ --
					{
						{type=17,value=1479},
			    		{type=19,value=3104},
						{type=5,value=31956},
						{type=7,value=31956},

		    		},
								-- ·ÉÉý20 ¼¶ --
					{
						{type=17,value=1619},
			    		{type=19,value=3399},
						{type=5,value=34861},
						{type=7,value=34861},

		    		},
								-- ·ÉÉý21 ¼¶ --
					{
						{type=17,value=1823},
			    		{type=19,value=3828},
						{type=5,value=40671},
						{type=7,value=40671},

		    		},
								-- ·ÉÉý22 ¼¶ --
					{
						{type=17,value=2028},
			    		{type=19,value=4257},
						{type=5,value=46481},
						{type=7,value=46481},

		    		},
								-- ·ÉÉý23 ¼¶ --
					{
						{type=17,value=2232},
			    		{type=19,value=4686},
						{type=5,value=52291},
						{type=7,value=52291},

		    		},
								-- ·ÉÉý24 ¼¶ --
					{
						{type=17,value=2436},
			    		{type=19,value=5115},
						{type=5,value=58101},
						{type=7,value=58101},

		    		},
								-- ·ÉÉý25 ¼¶ --
					{
						{type=17,value=2640},
			    		{type=19,value=5544},
						{type=5,value=63911},
						{type=7,value=63911},

		    		},
						--·ÉÉý26¼¶		
					{			
						{type=17,value=2817},		
						{type=19,value=5973},		
						{type=5,value=69721},		
						{type=7,value=69721},		
					},			
						--·ÉÉý27¼¶		
					{			
						{type=17,value=2994},		
						{type=19,value=6402},		
						{type=5,value=75531},		
						{type=7,value=75531},		
					},			
						--·ÉÉý28¼¶		
					{			
						{type=17,value=3171},		
						{type=19,value=6831},		
						{type=5,value=81341},		
						{type=7,value=81341},		
					},			
						--·ÉÉý29¼¶		
					{			
						{type=17,value=3348},		
						{type=19,value=7260},		
						{type=5,value=87151},		
						{type=7,value=87151},		
					},			
						--·ÉÉý30¼¶		
					{			
						{type=17,value=3525},		
						{type=19,value=7689},		
						{type=5,value=92961},		
						{type=7,value=92961},		
					},			
						--·ÉÉý31¼¶		
					{			
						{type=17,value=3702},		
						{type=19,value=8118},		
						{type=5,value=98771},		
						{type=7,value=98771},		
					},			
						--·ÉÉý32¼¶		
					{			
						{type=17,value=3879},		
						{type=19,value=8547},		
						{type=5,value=104581},		
						{type=7,value=104581},		
					},			
						--·ÉÉý33¼¶		
					{			
						{type=17,value=4056},		
						{type=19,value=8976},		
						{type=5,value=110391},		
						{type=7,value=110391},		
					},			
						--·ÉÉý34¼¶		
					{			
						{type=17,value=4233},		
						{type=19,value=9405},		
						{type=5,value=116201},		
						{type=7,value=116201},		
					},			
						--·ÉÉý35¼¶		
					{			
						{type=17,value=4410},		
						{type=19,value=9834},		
						{type=5,value=122011},		
						{type=7,value=122011},		
					},			
						--·ÉÉý36¼¶		
					{			
						{type=17,value=4587},		
						{type=19,value=10263},		
						{type=5,value=127821},		
						{type=7,value=127821},		
					},			
						--·ÉÉý37¼¶		
					{			
						{type=17,value=4764},		
						{type=19,value=10692},		
						{type=5,value=133631},		
						{type=7,value=133631},		
					},			
						--·ÉÉý38¼¶		
					{			
						{type=17,value=4941},		
						{type=19,value=11121},		
						{type=5,value=139441},		
						{type=7,value=139441},		
					},			
						--·ÉÉý39¼¶		
					{			
						{type=17,value=5118},		
						{type=19,value=11550},		
						{type=5,value=145251},		
						{type=7,value=145251},		
					},			
						--·ÉÉý40¼¶		
					{			
						{type=17,value=5295},		
						{type=19,value=11979},		
						{type=5,value=151061},		
						{type=7,value=151061},		
					},			
						--·ÉÉý41¼¶		
					{			
						{type=17,value=5472},		
						{type=19,value=12408},		
						{type=5,value=156871},		
						{type=7,value=156871},		
					},			
						--·ÉÉý42¼¶		
					{			
						{type=17,value=5649},		
						{type=19,value=12837},		
						{type=5,value=162681},		
						{type=7,value=162681},		
					},			
						--·ÉÉý43¼¶		
					{			
						{type=17,value=5826},		
						{type=19,value=13266},		
						{type=5,value=168491},		
						{type=7,value=168491},		
					},			
						--·ÉÉý44¼¶		
					{			
						{type=17,value=6003},		
						{type=19,value=13695},		
						{type=5,value=174301},		
						{type=7,value=174301},		
					},			
						--·ÉÉý45¼¶		
					{			
						{type=17,value=6180},		
						{type=19,value=14124},		
						{type=5,value=180111},		
						{type=7,value=180111},		
					},			
						--·ÉÉý46¼¶		
					{			
						{type=17,value=6357},		
						{type=19,value=14553},		
						{type=5,value=185921},		
						{type=7,value=185921},		
					},			
						--·ÉÉý47¼¶		
					{			
						{type=17,value=6534},		
						{type=19,value=14982},		
						{type=5,value=191731},		
						{type=7,value=191731},		
					},			
						--·ÉÉý48¼¶		
					{			
						{type=17,value=6711},		
						{type=19,value=15411},		
						{type=5,value=197541},		
						{type=7,value=197541},		
					},			
						--·ÉÉý49¼¶		
					{			
						{type=17,value=6888},		
						{type=19,value=15840},		
						{type=5,value=203351},		
						{type=7,value=203351},		
					},			
						--·ÉÉý50¼¶		
					{			
						{type=17,value=7065},		
						{type=19,value=16269},		
						{type=5,value=209161},		
						{type=7,value=209161},		
					},					    	
		    		
		    	},	 
			}, 
		},
		
		-- ³á°ò 6
		{
			itemId = 6224,
			
			-- ³á°òÀàÐÍ£º1 Îª»ÃÓð³á°ò, 2 Îª¾ø°æ³á°ò
			swingType = 1,
			
			-- Ã¿½×µÄ³á°òÍâ¹Û
			--swingShowIds = {31,32,33,34,35}, 
			swingShowIds = {51,52,53,54,55,55,55,55,55,55}, 
			-- ÄÚ¹ÛÌØÐ§
			iconIds = {30552,30553,30554,30555,30556,30556,30556,30556,30556,30556}, 
			--³á°òid
			swingIds = {6232,6233,6234,6235,6236,7893,7894,7895,7896,7897},
			-- Éý½×ÏûºÄ³á°òÊýÁ¿(µÚ1¸ö´ú±í1½×)
			classConsumeCounts = { 1,4,8,16,32,64,128,256,512,800},
			
			-- Éý¼¶ÏûºÄ³á°ò½á¾§ÊýÁ¿
			levelConsumeCounts = {2,4,6,8,10,12,14,16,18,20,23,27,31,35,40,45,50,56,62,68,74,81,88,96,103,110,117,124,131,138,145,152,159,166,173,180,187,194,201,208,215,222,229,236,243,250,257,264,271,278},
						
			-- ½×¼¶ÊôÐÔ
			classAttrs = {
				-- Õ½
					-- -- (a1) --
					-- {
					-- 	{type=(a2),value=(a3)},
			    	-- 	{type=(a4),value=(a5)},
					-- 	{type=(a6),value=(a7)},

		    		-- },

				{

									-- 1½× --
					{
						{type=9,value=125},
			    		{type=11,value=262},
						{type=29,value=12},

		    		},
					-- 2½× --
					{
						{type=9,value=325},
			    		{type=11,value=682},
						{type=29,value=32},

		    		},
					-- 3½× --
					{
						{type=9,value=614},
			    		{type=11,value=1288},
						{type=29,value=64},

		    		},
					-- 4½× --
					{
						{type=9,value=1080},
			    		{type=11,value=2266},
						{type=29,value=120},

		    		},
					-- 5½× --
					{
						{type=9,value=1760},
			    		{type=11,value=3696},
						{type=29,value=220},

		    		},
					-- 6½× --
					{
						{type=9,value=2440},
						{type=11,value=5126},
						{type=29,value=320},

		    		},

					-- 7½× --
					{
						{type=9,value=3120},
						{type=11,value=6556},
						{type=29,value=420},

		    		},

					-- 8½× --
					{
						{type=9,value=3800},
						{type=11,value=7986},
						{type=29,value=520},
		    		},

					-- 9½× --
					{
						{type=9,value=4480},
						{type=11,value=9416},
						{type=29,value=620},
		    		},

					-- 10½× --
					{
						{type=9,value=5160},
						{type=11,value=10846},
						{type=29,value=720},
		    		},
			},

		    	
		    	-- ·¨
				{
					
									-- 1½× --
					{
						{type=13,value=125},
			    		{type=15,value=262},
						{type=29,value=12},

		    		},
					-- 2½× --
					{
						{type=13,value=325},
			    		{type=15,value=682},
						{type=29,value=32},

		    		},
					-- 3½× --
					{
						{type=13,value=614},
			    		{type=15,value=1288},
						{type=29,value=64},

		    		},
					-- 4½× --
					{
						{type=13,value=1080},
			    		{type=15,value=2266},
						{type=29,value=120},

		    		},
					-- 5½× --
					{
						{type=13,value=1760},
			    		{type=15,value=3696},
						{type=29,value=220},

		    		},

					-- 6½× --
					{
						{type=13,value=2440},
						{type=15,value=5126},
						{type=29,value=320},

		    		},

					-- 7½× --
					{
						{type=13,value=3120},
						{type=15,value=6556},
						{type=29,value=420},

		    		},

					-- 8½× --
					{
						{type=13,value=3800},
						{type=15,value=7986},
						{type=29,value=520},
		    		},

					-- 9½× --
					{
						{type=13,value=4480},
						{type=15,value=9416},
						{type=29,value=620},
		    		},

					-- 10½× --
					{
						{type=13,value=5160},
						{type=15,value=10846},
						{type=29,value=720},
		    		},
		    		
		    	},	 
		    	
		    	-- µÀ
				{
		
										-- 1½× --
					{
						{type=17,value=125},
			    		{type=19,value=262},
						{type=29,value=12},

		    		},
					-- 2½× --
					{
						{type=17,value=325},
			    		{type=19,value=682},
						{type=29,value=32},

		    		},
					-- 3½× --
					{
						{type=17,value=614},
			    		{type=19,value=1288},
						{type=29,value=64},

		    		},
					-- 4½× --
					{
						{type=17,value=1080},
			    		{type=19,value=2266},
						{type=29,value=120},

		    		},
					-- 5½× --
					{
						{type=17,value=1760},
			    		{type=19,value=3696},
						{type=29,value=220},

		    		},
					-- 6½× --
					{
						{type=17,value=2440},
						{type=19,value=5126},
						{type=29,value=320},

		    		},

					-- 7½× --
					{
						{type=17,value=3120},
						{type=19,value=6556},
						{type=29,value=420},

		    		},

					-- 8½× --
					{
						{type=17,value=3800},
						{type=19,value=7986},
						{type=29,value=520},
		    		},

					-- 9½× --
					{
						{type=17,value=4480},
						{type=19,value=9416},
						{type=29,value=620},
		    		},

					-- 10½× --
					{
						{type=17,value=5160},
						{type=19,value=10846},
						{type=29,value=720},
		    		},

		    		
		    	},	    	
		    	
			},
			
			-- µÈ¼¶ÊôÐÔ
			levelAttrs = {
				-- Õ½

									-- -- 	--Ä£¿é
								-- (a1) ¼¶ --
					-- {
					-- 	{type=(a2),value=(a3)},
			    	-- 	{type=(a4),value=(a5)},
					-- 	{type=(a6),value=(a7)},

		    		-- },
				{
													-- ·ÉÉý1 ¼¶ --
					{
						{type=9,value=38},
			    		{type=11,value=78},
						{type=29,value=5},

		    		},
								-- ·ÉÉý2 ¼¶ --
					{
						{type=9,value=75},
			    		{type=11,value=157},
						{type=29,value=10},

		    		},
								-- ·ÉÉý3 ¼¶ --
					{
						{type=9,value=112},
			    		{type=11,value=235},
						{type=29,value=15},

		    		},
								-- ·ÉÉý4 ¼¶ --
					{
						{type=9,value=150},
			    		{type=11,value=314},
						{type=29,value=20},

		    		},
								-- ·ÉÉý5 ¼¶ --
					{
						{type=9,value=188},
			    		{type=11,value=393},
						{type=29,value=24},

		    		},
								-- ·ÉÉý6 ¼¶ --
					{
						{type=9,value=248},
			    		{type=11,value=519},
						{type=29,value=32},

		    		},
								-- ·ÉÉý7 ¼¶ --
					{
						{type=9,value=308},
			    		{type=11,value=645},
						{type=29,value=40},

		    		},
								-- ·ÉÉý8 ¼¶ --
					{
						{type=9,value=368},
			    		{type=11,value=771},
						{type=29,value=48},

		    		},
								-- ·ÉÉý9 ¼¶ --
					{
						{type=9,value=428},
			    		{type=11,value=897},
						{type=29,value=56},

		    		},
								-- ·ÉÉý10 ¼¶ --
					{
						{type=9,value=488},
			    		{type=11,value=1023},
						{type=29,value=64},

		    		},
								-- ·ÉÉý11 ¼¶ --
					{
						{type=9,value=573},
			    		{type=11,value=1202},
						{type=29,value=77},

		    		},
								-- ·ÉÉý12 ¼¶ --
					{
						{type=9,value=660},
			    		{type=11,value=1384},
						{type=29,value=90},

		    		},
								-- ·ÉÉý13 ¼¶ --
					{
						{type=9,value=746},
			    		{type=11,value=1566},
						{type=29,value=103},

		    		},
								-- ·ÉÉý14 ¼¶ --
					{
						{type=9,value=833},
			    		{type=11,value=1748},
						{type=29,value=116},

		    		},
								-- ·ÉÉý15 ¼¶ --
					{
						{type=9,value=920},
			    		{type=11,value=1932},
						{type=29,value=128},

		    		},
								-- ·ÉÉý16 ¼¶ --
					{
						{type=9,value=1060},
			    		{type=11,value=2225},
						{type=29,value=151},

		    		},
								-- ·ÉÉý17 ¼¶ --
					{
						{type=9,value=1200},
			    		{type=11,value=2518},
						{type=29,value=174},

		    		},
								-- ·ÉÉý18 ¼¶ --
					{
						{type=9,value=1339},
			    		{type=11,value=2811},
						{type=29,value=197},

		    		},
								-- ·ÉÉý19 ¼¶ --
					{
						{type=9,value=1479},
			    		{type=11,value=3104},
						{type=29,value=220},

		    		},
								-- ·ÉÉý20 ¼¶ --
					{
						{type=9,value=1619},
			    		{type=11,value=3399},
						{type=29,value=240},

		    		},
								-- ·ÉÉý21 ¼¶ --
					{
						{type=9,value=1823},
			    		{type=11,value=3828},
						{type=29,value=280},

		    		},
								-- ·ÉÉý22 ¼¶ --
					{
						{type=9,value=2028},
			    		{type=11,value=4257},
						{type=29,value=320},

		    		},
								-- ·ÉÉý23 ¼¶ --
					{
						{type=9,value=2232},
			    		{type=11,value=4686},
						{type=29,value=360},

		    		},
								-- ·ÉÉý24 ¼¶ --
					{
						{type=9,value=2436},
			    		{type=11,value=5115},
						{type=29,value=400},

		    		},
								-- ·ÉÉý25 ¼¶ --
					{
						{type=9,value=2640},
			    		{type=11,value=5544},
						{type=29,value=440},

		    		},
							--·ÉÉý26¼¶	
						{		
							{type=9,value=2844},	
							{type=11,value=5973},	
							{type=29,value=480},		
						},		
							--·ÉÉý27¼¶	
						{		
							{type=9,value=3048},	
							{type=11,value=6402},	
							{type=29,value=520},		
						},		
							--·ÉÉý28¼¶	
						{		
							{type=9,value=3252},	
							{type=11,value=6831},	
							{type=29,value=560},		
						},		
							--·ÉÉý29¼¶	
						{		
							{type=9,value=3456},	
							{type=11,value=7260},	
							{type=29,value=600},		
						},		
							--·ÉÉý30¼¶	
						{		
							{type=9,value=3660},	
							{type=11,value=7689},	
							{type=29,value=640},		
						},		
							--·ÉÉý31¼¶	
						{		
							{type=9,value=3864},	
							{type=11,value=8118},	
							{type=29,value=680},		
						},		
							--·ÉÉý32¼¶	
						{		
							{type=9,value=4068},	
							{type=11,value=8547},	
							{type=29,value=720},		
						},		
							--·ÉÉý33¼¶	
						{		
							{type=9,value=4272},	
							{type=11,value=8976},	
							{type=29,value=760},		
						},		
							--·ÉÉý34¼¶	
						{		
							{type=9,value=4476},	
							{type=11,value=9405},	
							{type=29,value=800},		
						},		
							--·ÉÉý35¼¶	
						{		
							{type=9,value=4680},	
							{type=11,value=9834},	
							{type=29,value=840},		
						},		
							--·ÉÉý36¼¶	
						{		
							{type=9,value=4884},	
							{type=11,value=10263},	
							{type=29,value=880},		
						},		
							--·ÉÉý37¼¶	
						{		
							{type=9,value=5088},	
							{type=11,value=10692},	
							{type=29,value=920},		
						},		
							--·ÉÉý38¼¶	
						{		
							{type=9,value=5292},	
							{type=11,value=11121},	
							{type=29,value=960},		
						},		
							--·ÉÉý39¼¶	
						{		
							{type=9,value=5496},	
							{type=11,value=11550},	
							{type=29,value=1000},		
						},		
							--·ÉÉý40¼¶	
						{		
							{type=9,value=5700},	
							{type=11,value=11979},	
							{type=29,value=1040},		
						},		
							--·ÉÉý41¼¶	
						{		
							{type=9,value=5904},	
							{type=11,value=12408},	
							{type=29,value=1080},		
						},		
							--·ÉÉý42¼¶	
						{		
							{type=9,value=6108},	
							{type=11,value=12837},	
							{type=29,value=1120},		
						},		
							--·ÉÉý43¼¶	
						{		
							{type=9,value=6312},	
							{type=11,value=13266},	
							{type=29,value=1160},		
						},		
							--·ÉÉý44¼¶	
						{		
							{type=9,value=6516},	
							{type=11,value=13695},	
							{type=29,value=1200},		
						},		
							--·ÉÉý45¼¶	
						{		
							{type=9,value=6720},	
							{type=11,value=14124},	
							{type=29,value=1240},		
						},		
							--·ÉÉý46¼¶	
						{		
							{type=9,value=6924},	
							{type=11,value=14553},	
							{type=29,value=1280},		
						},		
							--·ÉÉý47¼¶	
						{		
							{type=9,value=7128},	
							{type=11,value=14982},	
							{type=29,value=1320},		
						},		
							--·ÉÉý48¼¶	
						{		
							{type=9,value=7332},	
							{type=11,value=15411},	
							{type=29,value=1360},		
						},		
							--·ÉÉý49¼¶	
						{		
							{type=9,value=7536},	
							{type=11,value=15840},	
							{type=29,value=1400},		
						},		
							--·ÉÉý50¼¶	
						{		
							{type=9,value=7740},	
							{type=11,value=16269},	
							{type=29,value=1440},		
						},
		    		
		    	},	 
		    	
		    	-- ·¨
				{
												-- ·ÉÉý1 ¼¶ --
					{
						{type=13,value=38},
			    		{type=15,value=78},
						{type=29,value=5},

		    		},
								-- ·ÉÉý2 ¼¶ --
					{
						{type=13,value=75},
			    		{type=15,value=157},
						{type=29,value=10},

		    		},
								-- ·ÉÉý3 ¼¶ --
					{
						{type=13,value=112},
			    		{type=15,value=235},
						{type=29,value=15},

		    		},
								-- ·ÉÉý4 ¼¶ --
					{
						{type=13,value=150},
			    		{type=15,value=314},
						{type=29,value=20},

		    		},
								-- ·ÉÉý5 ¼¶ --
					{
						{type=13,value=188},
			    		{type=15,value=393},
						{type=29,value=24},

		    		},
								-- ·ÉÉý6 ¼¶ --
					{
						{type=13,value=248},
			    		{type=15,value=519},
						{type=29,value=32},

		    		},
								-- ·ÉÉý7 ¼¶ --
					{
						{type=13,value=308},
			    		{type=15,value=645},
						{type=29,value=40},

		    		},
								-- ·ÉÉý8 ¼¶ --
					{
						{type=13,value=368},
			    		{type=15,value=771},
						{type=29,value=48},

		    		},
								-- ·ÉÉý9 ¼¶ --
					{
						{type=13,value=428},
			    		{type=15,value=897},
						{type=29,value=56},

		    		},
								-- ·ÉÉý10 ¼¶ --
					{
						{type=13,value=488},
			    		{type=15,value=1023},
						{type=29,value=64},

		    		},
								-- ·ÉÉý11 ¼¶ --
					{
						{type=13,value=573},
			    		{type=15,value=1202},
						{type=29,value=77},

		    		},
								-- ·ÉÉý12 ¼¶ --
					{
						{type=13,value=660},
			    		{type=15,value=1384},
						{type=29,value=90},

		    		},
								-- ·ÉÉý13 ¼¶ --
					{
						{type=13,value=746},
			    		{type=15,value=1566},
						{type=29,value=103},

		    		},
								-- ·ÉÉý14 ¼¶ --
					{
						{type=13,value=833},
			    		{type=15,value=1748},
						{type=29,value=116},

		    		},
								-- ·ÉÉý15 ¼¶ --
					{
						{type=13,value=920},
			    		{type=15,value=1932},
						{type=29,value=128},

		    		},
								-- ·ÉÉý16 ¼¶ --
					{
						{type=13,value=1060},
			    		{type=15,value=2225},
						{type=29,value=151},

		    		},
								-- ·ÉÉý17 ¼¶ --
					{
						{type=13,value=1200},
			    		{type=15,value=2518},
						{type=29,value=174},

		    		},
								-- ·ÉÉý18 ¼¶ --
					{
						{type=13,value=1339},
			    		{type=15,value=2811},
						{type=29,value=197},

		    		},
								-- ·ÉÉý19 ¼¶ --
					{
						{type=13,value=1479},
			    		{type=15,value=3104},
						{type=29,value=220},

		    		},
								-- ·ÉÉý20 ¼¶ --
					{
						{type=13,value=1619},
			    		{type=15,value=3399},
						{type=29,value=240},

		    		},
								-- ·ÉÉý21 ¼¶ --
					{
						{type=13,value=1823},
			    		{type=15,value=3828},
						{type=29,value=280},

		    		},
								-- ·ÉÉý22 ¼¶ --
					{
						{type=13,value=2028},
			    		{type=15,value=4257},
						{type=29,value=320},

		    		},
								-- ·ÉÉý23 ¼¶ --
					{
						{type=13,value=2232},
			    		{type=15,value=4686},
						{type=29,value=360},

		    		},
								-- ·ÉÉý24 ¼¶ --
					{
						{type=13,value=2436},
			    		{type=15,value=5115},
						{type=29,value=400},

		    		},
								-- ·ÉÉý25 ¼¶ --
					{
						{type=13,value=2640},
			    		{type=15,value=5544},
						{type=29,value=440},

		    		},

	                                                                                                       --·ÉÉý26¼¶	
						{		
							{type=13,value=2844},	
							{type=15,value=5973},	
							{type=29,value=480},		
						},		
							--·ÉÉý27¼¶	
						{		
							{type=13,value=3048},	
							{type=15,value=6402},	
							{type=29,value=520},		
						},		
							--·ÉÉý28¼¶	
						{		
							{type=13,value=3252},	
							{type=15,value=6831},	
							{type=29,value=560},		
						},		
							--·ÉÉý29¼¶	
						{		
							{type=13,value=3456},	
							{type=15,value=7260},	
							{type=29,value=600},		
						},		
							--·ÉÉý30¼¶	
						{		
							{type=13,value=3660},	
							{type=15,value=7689},	
							{type=29,value=640},		
						},		
							--·ÉÉý31¼¶	
						{		
							{type=13,value=3864},	
							{type=15,value=8118},	
							{type=29,value=680},		
						},		
							--·ÉÉý32¼¶	
						{		
							{type=13,value=4068},	
							{type=15,value=8547},	
							{type=29,value=720},		
						},		
							--·ÉÉý33¼¶	
						{		
							{type=13,value=4272},	
							{type=15,value=8976},	
							{type=29,value=760},		
						},		
							--·ÉÉý34¼¶	
						{		
							{type=13,value=4476},	
							{type=15,value=9405},	
							{type=29,value=800},		
						},		
							--·ÉÉý35¼¶	
						{		
							{type=13,value=4680},	
							{type=15,value=9834},	
							{type=29,value=840},		
						},		
							--·ÉÉý36¼¶	
						{		
							{type=13,value=4884},	
							{type=15,value=10263},	
							{type=29,value=880},		
						},		
							--·ÉÉý37¼¶	
						{		
							{type=13,value=5088},	
							{type=15,value=10692},	
							{type=29,value=920},		
						},		
							--·ÉÉý38¼¶	
						{		
							{type=13,value=5292},	
							{type=15,value=11121},	
							{type=29,value=960},		
						},		
							--·ÉÉý39¼¶	
						{		
							{type=13,value=5496},	
							{type=15,value=11550},	
							{type=29,value=1000},		
						},		
							--·ÉÉý40¼¶	
						{		
							{type=13,value=5700},	
							{type=15,value=11979},	
							{type=29,value=1040},		
						},		
							--·ÉÉý41¼¶	
						{		
							{type=13,value=5904},	
							{type=15,value=12408},	
							{type=29,value=1080},		
						},		
							--·ÉÉý42¼¶	
						{		
							{type=13,value=6108},	
							{type=15,value=12837},	
							{type=29,value=1120},		
						},		
							--·ÉÉý43¼¶	
						{		
							{type=13,value=6312},	
							{type=15,value=13266},	
							{type=29,value=1160},		
						},		
							--·ÉÉý44¼¶	
						{		
							{type=13,value=6516},	
							{type=15,value=13695},	
							{type=29,value=1200},		
						},		
							--·ÉÉý45¼¶	
						{		
							{type=13,value=6720},	
							{type=15,value=14124},	
							{type=29,value=1240},		
						},		
							--·ÉÉý46¼¶	
						{		
							{type=13,value=6924},	
							{type=15,value=14553},	
							{type=29,value=1280},		
						},		
							--·ÉÉý47¼¶	
						{		
							{type=13,value=7128},	
							{type=15,value=14982},	
							{type=29,value=1320},		
						},		
							--·ÉÉý48¼¶	
						{		
							{type=13,value=7332},	
							{type=15,value=15411},	
							{type=29,value=1360},		
						},		
							--·ÉÉý49¼¶	
						{		
							{type=13,value=7536},	
							{type=15,value=15840},	
							{type=29,value=1400},		
						},		
							--·ÉÉý50¼¶	
						{		
							{type=13,value=7740},	
							{type=15,value=16269},	
							{type=29,value=1440},		
						},		
		    		
		    	},	 
		    	
		    	-- µÀ
				{
													-- ·ÉÉý1 ¼¶ --
					{
						{type=17,value=38},
			    		{type=19,value=78},
						{type=29,value=5},

		    		},
								-- ·ÉÉý2 ¼¶ --
					{
						{type=17,value=75},
			    		{type=19,value=157},
						{type=29,value=10},

		    		},
								-- ·ÉÉý3 ¼¶ --
					{
						{type=17,value=112},
			    		{type=19,value=235},
						{type=29,value=15},

		    		},
								-- ·ÉÉý4 ¼¶ --
					{
						{type=17,value=150},
			    		{type=19,value=314},
						{type=29,value=20},

		    		},
								-- ·ÉÉý5 ¼¶ --
					{
						{type=17,value=188},
			    		{type=19,value=393},
						{type=29,value=24},

		    		},
								-- ·ÉÉý6 ¼¶ --
					{
						{type=17,value=248},
			    		{type=19,value=519},
						{type=29,value=32},

		    		},
								-- ·ÉÉý7 ¼¶ --
					{
						{type=17,value=308},
			    		{type=19,value=645},
						{type=29,value=40},

		    		},
								-- ·ÉÉý8 ¼¶ --
					{
						{type=17,value=368},
			    		{type=19,value=771},
						{type=29,value=48},

		    		},
								-- ·ÉÉý9 ¼¶ --
					{
						{type=17,value=428},
			    		{type=19,value=897},
						{type=29,value=56},

		    		},
								-- ·ÉÉý10 ¼¶ --
					{
						{type=17,value=488},
			    		{type=19,value=1023},
						{type=29,value=64},

		    		},
								-- ·ÉÉý11 ¼¶ --
					{
						{type=17,value=573},
			    		{type=19,value=1202},
						{type=29,value=77},

		    		},
								-- ·ÉÉý12 ¼¶ --
					{
						{type=17,value=660},
			    		{type=19,value=1384},
						{type=29,value=90},

		    		},
								-- ·ÉÉý13 ¼¶ --
					{
						{type=17,value=746},
			    		{type=19,value=1566},
						{type=29,value=103},

		    		},
								-- ·ÉÉý14 ¼¶ --
					{
						{type=17,value=833},
			    		{type=19,value=1748},
						{type=29,value=116},

		    		},
								-- ·ÉÉý15 ¼¶ --
					{
						{type=17,value=920},
			    		{type=19,value=1932},
						{type=29,value=128},

		    		},
								-- ·ÉÉý16 ¼¶ --
					{
						{type=17,value=1060},
			    		{type=19,value=2225},
						{type=29,value=151},

		    		},
								-- ·ÉÉý17 ¼¶ --
					{
						{type=17,value=1200},
			    		{type=19,value=2518},
						{type=29,value=174},

		    		},
								-- ·ÉÉý18 ¼¶ --
					{
						{type=17,value=1339},
			    		{type=19,value=2811},
						{type=29,value=197},

		    		},
								-- ·ÉÉý19 ¼¶ --
					{
						{type=17,value=1479},
			    		{type=19,value=3104},
						{type=29,value=220},

		    		},
								-- ·ÉÉý20 ¼¶ --
					{
						{type=17,value=1619},
			    		{type=19,value=3399},
						{type=29,value=240},

		    		},
								-- ·ÉÉý21 ¼¶ --
					{
						{type=17,value=1823},
			    		{type=19,value=3828},
						{type=29,value=280},

		    		},
								-- ·ÉÉý22 ¼¶ --
					{
						{type=17,value=2028},
			    		{type=19,value=4257},
						{type=29,value=320},

		    		},
								-- ·ÉÉý23 ¼¶ --
					{
						{type=17,value=2232},
			    		{type=19,value=4686},
						{type=29,value=360},

		    		},
								-- ·ÉÉý24 ¼¶ --
					{
						{type=17,value=2436},
			    		{type=19,value=5115},
						{type=29,value=400},

		    		},
								-- ·ÉÉý25 ¼¶ --
					{
						{type=17,value=2640},
			    		{type=19,value=5544},
						{type=29,value=440},

		    		},
	                                                                                                       --·ÉÉý26¼¶	
						{		
							{type=17,value=2844},	
							{type=19,value=5973},	
							{type=29,value=480},		
						},		
							--·ÉÉý27¼¶	
						{		
							{type=17,value=3048},	
							{type=19,value=6402},	
							{type=29,value=520},		
						},		
							--·ÉÉý28¼¶	
						{		
							{type=17,value=3252},	
							{type=19,value=6831},	
							{type=29,value=560},		
						},		
							--·ÉÉý29¼¶	
						{		
							{type=17,value=3456},	
							{type=19,value=7260},	
							{type=29,value=600},		
						},		
							--·ÉÉý30¼¶	
						{		
							{type=17,value=3660},	
							{type=19,value=7689},	
							{type=29,value=640},		
						},		
							--·ÉÉý31¼¶	
						{		
							{type=17,value=3864},	
							{type=19,value=8118},	
							{type=29,value=680},		
						},		
							--·ÉÉý32¼¶	
						{		
							{type=17,value=4068},	
							{type=19,value=8547},	
							{type=29,value=720},		
						},		
							--·ÉÉý33¼¶	
						{		
							{type=17,value=4272},	
							{type=19,value=8976},	
							{type=29,value=760},		
						},		
							--·ÉÉý34¼¶	
						{		
							{type=17,value=4476},	
							{type=19,value=9405},	
							{type=29,value=800},		
						},		
							--·ÉÉý35¼¶	
						{		
							{type=17,value=4680},	
							{type=19,value=9834},	
							{type=29,value=840},		
						},		
							--·ÉÉý36¼¶	
						{		
							{type=17,value=4884},	
							{type=19,value=10263},	
							{type=29,value=880},		
						},		
							--·ÉÉý37¼¶	
						{		
							{type=17,value=5088},	
							{type=19,value=10692},	
							{type=29,value=920},		
						},		
							--·ÉÉý38¼¶	
						{		
							{type=17,value=5292},	
							{type=19,value=11121},	
							{type=29,value=960},		
						},		
							--·ÉÉý39¼¶	
						{		
							{type=17,value=5496},	
							{type=19,value=11550},	
							{type=29,value=1000},		
						},		
							--·ÉÉý40¼¶	
						{		
							{type=17,value=5700},	
							{type=19,value=11979},	
							{type=29,value=1040},		
						},		
							--·ÉÉý41¼¶	
						{		
							{type=17,value=5904},	
							{type=19,value=12408},	
							{type=29,value=1080},		
						},		
							--·ÉÉý42¼¶	
						{		
							{type=17,value=6108},	
							{type=19,value=12837},	
							{type=29,value=1120},		
						},		
							--·ÉÉý43¼¶	
						{		
							{type=17,value=6312},	
							{type=19,value=13266},	
							{type=29,value=1160},		
						},		
							--·ÉÉý44¼¶	
						{		
							{type=17,value=6516},	
							{type=19,value=13695},	
							{type=29,value=1200},		
						},		
							--·ÉÉý45¼¶	
						{		
							{type=17,value=6720},	
							{type=19,value=14124},	
							{type=29,value=1240},		
						},		
							--·ÉÉý46¼¶	
						{		
							{type=17,value=6924},	
							{type=19,value=14553},	
							{type=29,value=1280},		
						},		
							--·ÉÉý47¼¶	
						{		
							{type=17,value=7128},	
							{type=19,value=14982},	
							{type=29,value=1320},		
						},		
							--·ÉÉý48¼¶	
						{		
							{type=17,value=7332},	
							{type=19,value=15411},	
							{type=29,value=1360},		
						},		
							--·ÉÉý49¼¶	
						{		
							{type=17,value=7536},	
							{type=19,value=15840},	
							{type=29,value=1400},		
						},		
							--·ÉÉý50¼¶	
						{		
							{type=17,value=7740},	
							{type=19,value=16269},	
							{type=29,value=1440},		
						},				    		

		    		
		    	},	 
			}, 
		},
		
		-- ³á°ò 7
		{
			itemId = 6225,
			
			-- ³á°òÀàÐÍ£º1 Îª»ÃÓð³á°ò, 2 Îª¾ø°æ³á°ò
			swingType = 1,
			
			-- Ã¿½×µÄ³á°òÍâ¹Û
			--swingShowIds = {36,37,38,39,40},
			swingShowIds = {56,57,58,59,60,60,60,60,60,60}, 
			-- ÄÚ¹ÛÌØÐ§
			iconIds = {30557,30558,30559,30560,30561,30561,30561,30561,30561,30561}, 
			--³á°òid
			swingIds = {6237,6238,6239,6240,6241,7898,7899,7900,7901,7902},
			-- Éý½×ÏûºÄ³á°òÊýÁ¿(µÚ1¸ö´ú±í1½×)
			classConsumeCounts = { 1,4,8,16,32,64,128,256,512,800},
			
			-- Éý¼¶ÏûºÄ³á°ò½á¾§ÊýÁ¿
			levelConsumeCounts = {2,4,6,8,10,12,14,16,18,20,23,27,31,35,40,45,50,56,62,68,74,81,88,96,103,110,117,124,131,138,145,152,159,166,173,180,187,194,201,208,215,222,229,236,243,250,257,264,271,278},
			
			-- ½×¼¶ÊôÐÔ
			classAttrs = {

					-- -- (a1) --
					-- {
					-- 	{type=(a2),value=(a3)},
			    	-- 	{type=(a4),value=(a5)},
					-- 	{type=(a6),value=(a7)},

		    		-- },

				-- Õ½
				{
										-- 1½× --
					{
						{type=9,value=125},
			    		{type=11,value=262},
						{type=31,value=12},

		    		},
					-- 2½× --
					{
						{type=9,value=325},
			    		{type=11,value=682},
						{type=31,value=32},

		    		},
					-- 3½× --
					{
						{type=9,value=614},
			    		{type=11,value=1288},
						{type=31,value=64},

		    		},
					-- 4½× --
					{
						{type=9,value=1080},
			    		{type=11,value=2266},
						{type=31,value=120},

		    		},
					-- 5½× --
					{
						{type=9,value=1760},
			    		{type=11,value=3696},
						{type=31,value=220},

		    		},

					-- 6½× --
					{
						{type=9,value=2440},
						{type=11,value=5126},
						{type=31,value=320},

		    		},

					-- 7½× --
					{
						{type=9,value=3120},
						{type=11,value=6556},
						{type=31,value=420},

		    		},

					-- 8½× --
					{
						{type=9,value=3800},
						{type=11,value=7986},
						{type=31,value=520},
		    		},

					-- 9½× --
					{
						{type=9,value=4480},
						{type=11,value=9416},
						{type=31,value=620},
		    		},

					-- 10½× --
					{
						{type=9,value=5160},
						{type=11,value=10846},
						{type=31,value=720},
		    		},
		    		
		    	},	 
		    	
		    	-- ·¨
				{
										-- 1½× --
					{
						{type=13,value=125},
			    		{type=15,value=262},
						{type=31,value=12},

		    		},
					-- 2½× --
					{
						{type=13,value=325},
			    		{type=15,value=682},
						{type=31,value=32},

		    		},
					-- 3½× --
					{
						{type=13,value=614},
			    		{type=15,value=1288},
						{type=31,value=64},

		    		},
					-- 4½× --
					{
						{type=13,value=1080},
			    		{type=15,value=2266},
						{type=31,value=120},

		    		},
					-- 5½× --
					{
						{type=13,value=1760},
			    		{type=15,value=3696},
						{type=31,value=220},

		    		},

					-- 6½× --
					{
						{type=13,value=2440},
						{type=15,value=5126},
						{type=31,value=320},

		    		},

					-- 7½× --
					{
						{type=13,value=3120},
						{type=15,value=6556},
						{type=31,value=420},

		    		},

					-- 8½× --
					{
						{type=13,value=3800},
						{type=15,value=7986},
						{type=31,value=520},
		    		},

					-- 9½× --
					{
						{type=13,value=4480},
						{type=15,value=9416},
						{type=31,value=620},
		    		},

					-- 10½× --
					{
						{type=13,value=5160},
						{type=15,value=10846},
						{type=31,value=720},
		    		},
		    		
		    	},	 
		    	
		    	-- µÀ
				{
										-- 1½× --
					{
						{type=17,value=125},
			    		{type=19,value=262},
						{type=31,value=12},

		    		},
					-- 2½× --
					{
						{type=17,value=325},
			    		{type=19,value=682},
						{type=31,value=32},

		    		},
					-- 3½× --
					{
						{type=17,value=614},
			    		{type=19,value=1288},
						{type=31,value=64},

		    		},
					-- 4½× --
					{
						{type=17,value=1080},
			    		{type=19,value=2266},
						{type=31,value=120},

		    		},
					-- 5½× --
					{
						{type=17,value=1760},
			    		{type=19,value=3696},
						{type=31,value=220},

		    		},
					-- 6½× --
					{
						{type=17,value=2440},
						{type=19,value=5126},
						{type=31,value=320},

		    		},

					-- 7½× --
					{
						{type=17,value=3120},
						{type=19,value=6556},
						{type=31,value=420},

		    		},

					-- 8½× --
					{
						{type=17,value=3800},
						{type=19,value=7986},
						{type=31,value=520},
		    		},

					-- 9½× --
					{
						{type=17,value=4480},
						{type=19,value=9416},
						{type=31,value=620},
		    		},

					-- 10½× --
					{
						{type=17,value=5160},
						{type=19,value=10846},
						{type=31,value=720},
		    		},		    		
		    		
		    	},	    	
		    	
			},
			
			-- µÈ¼¶ÊôÐÔ
			levelAttrs = {
				-- Õ½

					-- -- (a1) ¼¶ --
					-- {
					-- 	{type=(a2),value=(a3)},
			    	-- 	{type=(a4),value=(a5)},
					-- 	{type=(a6),value=(a7)},
					-- 	{type=(a8),value=(a9)},
					-- 	{type=(a10),value=(a11)},
					-- 	{type=(a12),value=(a13)},

		    		-- },

				{
									-- ·ÉÉý1 --
					{
						{type=9,value=38},
			    		{type=11,value=78},
						{type=31,value=5},

		    		},
					-- ·ÉÉý2 --
					{
						{type=9,value=75},
			    		{type=11,value=157},
						{type=31,value=10},

		    		},
					-- ·ÉÉý3 --
					{
						{type=9,value=112},
			    		{type=11,value=235},
						{type=31,value=15},

		    		},
					-- ·ÉÉý4 --
					{
						{type=9,value=150},
			    		{type=11,value=314},
						{type=31,value=20},

		    		},
					-- ·ÉÉý5 --
					{
						{type=9,value=188},
			    		{type=11,value=393},
						{type=31,value=24},

		    		},
					-- ·ÉÉý6 --
					{
						{type=9,value=248},
			    		{type=11,value=519},
						{type=31,value=32},

		    		},
					-- ·ÉÉý7 --
					{
						{type=9,value=308},
			    		{type=11,value=645},
						{type=31,value=40},

		    		},
					-- ·ÉÉý8 --
					{
						{type=9,value=368},
			    		{type=11,value=771},
						{type=31,value=48},

		    		},
					-- ·ÉÉý9 --
					{
						{type=9,value=428},
			    		{type=11,value=897},
						{type=31,value=56},

		    		},
					-- ·ÉÉý10 --
					{
						{type=9,value=488},
			    		{type=11,value=1023},
						{type=31,value=64},

		    		},
					-- ·ÉÉý11 --
					{
						{type=9,value=573},
			    		{type=11,value=1202},
						{type=31,value=77},

		    		},
					-- ·ÉÉý12 --
					{
						{type=9,value=660},
			    		{type=11,value=1384},
						{type=31,value=90},

		    		},
					-- ·ÉÉý13 --
					{
						{type=9,value=746},
			    		{type=11,value=1566},
						{type=31,value=103},

		    		},
					-- ·ÉÉý14 --
					{
						{type=9,value=833},
			    		{type=11,value=1748},
						{type=31,value=116},

		    		},
					-- ·ÉÉý15 --
					{
						{type=9,value=920},
			    		{type=11,value=1932},
						{type=31,value=128},

		    		},
					-- ·ÉÉý16 --
					{
						{type=9,value=1060},
			    		{type=11,value=2225},
						{type=31,value=151},

		    		},
					-- ·ÉÉý17 --
					{
						{type=9,value=1200},
			    		{type=11,value=2518},
						{type=31,value=174},

		    		},
					-- ·ÉÉý18 --
					{
						{type=9,value=1339},
			    		{type=11,value=2811},
						{type=31,value=197},

		    		},
					-- ·ÉÉý19 --
					{
						{type=9,value=1479},
			    		{type=11,value=3104},
						{type=31,value=220},

		    		},
					-- ·ÉÉý20 --
					{
						{type=9,value=1619},
			    		{type=11,value=3399},
						{type=31,value=240},

		    		},
					-- ·ÉÉý21 --
					{
						{type=9,value=1823},
			    		{type=11,value=3828},
						{type=31,value=280},

		    		},
					-- ·ÉÉý22 --
					{
						{type=9,value=2028},
			    		{type=11,value=4257},
						{type=31,value=320},

		    		},
					-- ·ÉÉý23 --
					{
						{type=9,value=2232},
			    		{type=11,value=4686},
						{type=31,value=360},

		    		},
					-- ·ÉÉý24 --
					{
						{type=9,value=2436},
			    		{type=11,value=5115},
						{type=31,value=400},

		    		},
					-- ·ÉÉý25 --
					{
						{type=9,value=2640},
			    		{type=11,value=5544},
						{type=31,value=440},

		    		},

						--·ÉÉý26¼¶	
					{		
						{type=9,value=2844},	
						{type=11,value=5973},	
						{type=31,value=480},		
					},		
						--·ÉÉý27¼¶	
					{		
						{type=9,value=3048},	
						{type=11,value=6402},	
						{type=31,value=520},		
					},		
						--·ÉÉý28¼¶	
					{		
						{type=9,value=3252},	
						{type=11,value=6831},	
						{type=31,value=560},		
					},		
						--·ÉÉý29¼¶	
					{		
						{type=9,value=3456},	
						{type=11,value=7260},	
						{type=31,value=600},		
					},		
						--·ÉÉý30¼¶	
					{		
						{type=9,value=3660},	
						{type=11,value=7689},	
						{type=31,value=640},		
					},		
						--·ÉÉý31¼¶	
					{		
						{type=9,value=3864},	
						{type=11,value=8118},	
						{type=31,value=680},		
					},		
						--·ÉÉý32¼¶	
					{		
						{type=9,value=4068},	
						{type=11,value=8547},	
						{type=31,value=720},		
					},		
						--·ÉÉý33¼¶	
					{		
						{type=9,value=4272},	
						{type=11,value=8976},	
						{type=31,value=760},		
					},		
						--·ÉÉý34¼¶	
					{		
						{type=9,value=4476},	
						{type=11,value=9405},	
						{type=31,value=800},		
					},		
						--·ÉÉý35¼¶	
					{		
						{type=9,value=4680},	
						{type=11,value=9834},	
						{type=31,value=840},		
					},		
						--·ÉÉý36¼¶	
					{		
						{type=9,value=4884},	
						{type=11,value=10263},	
						{type=31,value=880},		
					},		
						--·ÉÉý37¼¶	
					{		
						{type=9,value=5088},	
						{type=11,value=10692},	
						{type=31,value=920},		
					},		
						--·ÉÉý38¼¶	
					{		
						{type=9,value=5292},	
						{type=11,value=11121},	
						{type=31,value=960},		
					},		
						--·ÉÉý39¼¶	
					{		
						{type=9,value=5496},	
						{type=11,value=11550},	
						{type=31,value=1000},		
					},		
						--·ÉÉý40¼¶	
					{		
						{type=9,value=5700},	
						{type=11,value=11979},	
						{type=31,value=1040},		
					},		
						--·ÉÉý41¼¶	
					{		
						{type=9,value=5904},	
						{type=11,value=12408},	
						{type=31,value=1080},		
					},		
						--·ÉÉý42¼¶	
					{		
						{type=9,value=6108},	
						{type=11,value=12837},	
						{type=31,value=1120},		
					},		
						--·ÉÉý43¼¶	
					{		
						{type=9,value=6312},	
						{type=11,value=13266},	
						{type=31,value=1160},		
					},		
						--·ÉÉý44¼¶	
					{		
						{type=9,value=6516},	
						{type=11,value=13695},	
						{type=31,value=1200},		
					},		
						--·ÉÉý45¼¶	
					{		
						{type=9,value=6720},	
						{type=11,value=14124},	
						{type=31,value=1240},		
					},		
						--·ÉÉý46¼¶	
					{		
						{type=9,value=6924},	
						{type=11,value=14553},	
						{type=31,value=1280},		
					},		
						--·ÉÉý47¼¶	
					{		
						{type=9,value=7128},	
						{type=11,value=14982},	
						{type=31,value=1320},		
					},		
						--·ÉÉý48¼¶	
					{		
						{type=9,value=7332},	
						{type=11,value=15411},	
						{type=31,value=1360},		
					},		
						--·ÉÉý49¼¶	
					{		
						{type=9,value=7536},	
						{type=11,value=15840},	
						{type=31,value=1400},		
					},		
						--·ÉÉý50¼¶	
					{		
						{type=9,value=7740},	
						{type=11,value=16269},	
						{type=31,value=1440},		
					},
		    		
		    	},	 
		    	
		    	-- ·¨
				{
									-- ·ÉÉý1 --
					{
						{type=13,value=38},
			    		{type=15,value=78},
						{type=31,value=5},

		    		},
					-- ·ÉÉý2 --
					{
						{type=13,value=75},
			    		{type=15,value=157},
						{type=31,value=10},

		    		},
					-- ·ÉÉý3 --
					{
						{type=13,value=112},
			    		{type=15,value=235},
						{type=31,value=15},

		    		},
					-- ·ÉÉý4 --
					{
						{type=13,value=150},
			    		{type=15,value=314},
						{type=31,value=20},

		    		},
					-- ·ÉÉý5 --
					{
						{type=13,value=188},
			    		{type=15,value=393},
						{type=31,value=24},

		    		},
					-- ·ÉÉý6 --
					{
						{type=13,value=248},
			    		{type=15,value=519},
						{type=31,value=32},

		    		},
					-- ·ÉÉý7 --
					{
						{type=13,value=308},
			    		{type=15,value=645},
						{type=31,value=40},

		    		},
					-- ·ÉÉý8 --
					{
						{type=13,value=368},
			    		{type=15,value=771},
						{type=31,value=48},

		    		},
					-- ·ÉÉý9 --
					{
						{type=13,value=428},
			    		{type=15,value=897},
						{type=31,value=56},

		    		},
					-- ·ÉÉý10 --
					{
						{type=13,value=488},
			    		{type=15,value=1023},
						{type=31,value=64},

		    		},
					-- ·ÉÉý11 --
					{
						{type=13,value=573},
			    		{type=15,value=1202},
						{type=31,value=77},

		    		},
					-- ·ÉÉý12 --
					{
						{type=13,value=660},
			    		{type=15,value=1384},
						{type=31,value=90},

		    		},
					-- ·ÉÉý13 --
					{
						{type=13,value=746},
			    		{type=15,value=1566},
						{type=31,value=103},

		    		},
					-- ·ÉÉý14 --
					{
						{type=13,value=833},
			    		{type=15,value=1748},
						{type=31,value=116},

		    		},
					-- ·ÉÉý15 --
					{
						{type=13,value=920},
			    		{type=15,value=1932},
						{type=31,value=128},

		    		},
					-- ·ÉÉý16 --
					{
						{type=13,value=1060},
			    		{type=15,value=2225},
						{type=31,value=151},

		    		},
					-- ·ÉÉý17 --
					{
						{type=13,value=1200},
			    		{type=15,value=2518},
						{type=31,value=174},

		    		},
					-- ·ÉÉý18 --
					{
						{type=13,value=1339},
			    		{type=15,value=2811},
						{type=31,value=197},

		    		},
					-- ·ÉÉý19 --
					{
						{type=13,value=1479},
			    		{type=15,value=3104},
						{type=31,value=220},

		    		},
					-- ·ÉÉý20 --
					{
						{type=13,value=1619},
			    		{type=15,value=3399},
						{type=31,value=240},

		    		},
					-- ·ÉÉý21 --
					{
						{type=13,value=1823},
			    		{type=15,value=3828},
						{type=31,value=280},

		    		},
					-- ·ÉÉý22 --
					{
						{type=13,value=2028},
			    		{type=15,value=4257},
						{type=31,value=320},

		    		},
					-- ·ÉÉý23 --
					{
						{type=13,value=2232},
			    		{type=15,value=4686},
						{type=31,value=360},

		    		},
					-- ·ÉÉý24 --
					{
						{type=13,value=2436},
			    		{type=15,value=5115},
						{type=31,value=400},

		    		},
					-- ·ÉÉý25 --
					{
						{type=13,value=2640},
			    		{type=15,value=5544},
						{type=31,value=440},

		    		},

						--·ÉÉý26¼¶	
					{		
						{type=13,value=2844},	
						{type=15,value=5973},	
						{type=31,value=480},		
					},		
						--·ÉÉý27¼¶	
					{		
						{type=13,value=3048},	
						{type=15,value=6402},	
						{type=31,value=520},		
					},		
						--·ÉÉý28¼¶	
					{		
						{type=13,value=3252},	
						{type=15,value=6831},	
						{type=31,value=560},		
					},		
						--·ÉÉý29¼¶	
					{		
						{type=13,value=3456},	
						{type=15,value=7260},	
						{type=31,value=600},		
					},		
						--·ÉÉý30¼¶	
					{		
						{type=13,value=3660},	
						{type=15,value=7689},	
						{type=31,value=640},		
					},		
						--·ÉÉý31¼¶	
					{		
						{type=13,value=3864},	
						{type=15,value=8118},	
						{type=31,value=680},		
					},		
						--·ÉÉý32¼¶	
					{		
						{type=13,value=4068},	
						{type=15,value=8547},	
						{type=31,value=720},		
					},		
						--·ÉÉý33¼¶	
					{		
						{type=13,value=4272},	
						{type=15,value=8976},	
						{type=31,value=760},		
					},		
						--·ÉÉý34¼¶	
					{		
						{type=13,value=4476},	
						{type=15,value=9405},	
						{type=31,value=800},		
					},		
						--·ÉÉý35¼¶	
					{		
						{type=13,value=4680},	
						{type=15,value=9834},	
						{type=31,value=840},		
					},		
						--·ÉÉý36¼¶	
					{		
						{type=13,value=4884},	
						{type=15,value=10263},	
						{type=31,value=880},		
					},		
						--·ÉÉý37¼¶	
					{		
						{type=13,value=5088},	
						{type=15,value=10692},	
						{type=31,value=920},		
					},		
						--·ÉÉý38¼¶	
					{		
						{type=13,value=5292},	
						{type=15,value=11121},	
						{type=31,value=960},		
					},		
						--·ÉÉý39¼¶	
					{		
						{type=13,value=5496},	
						{type=15,value=11550},	
						{type=31,value=1000},		
					},		
						--·ÉÉý40¼¶	
					{		
						{type=13,value=5700},	
						{type=15,value=11979},	
						{type=31,value=1040},		
					},		
						--·ÉÉý41¼¶	
					{		
						{type=13,value=5904},	
						{type=15,value=12408},	
						{type=31,value=1080},		
					},		
						--·ÉÉý42¼¶	
					{		
						{type=13,value=6108},	
						{type=15,value=12837},	
						{type=31,value=1120},		
					},		
						--·ÉÉý43¼¶	
					{		
						{type=13,value=6312},	
						{type=15,value=13266},	
						{type=31,value=1160},		
					},		
						--·ÉÉý44¼¶	
					{		
						{type=13,value=6516},	
						{type=15,value=13695},	
						{type=31,value=1200},		
					},		
						--·ÉÉý45¼¶	
					{		
						{type=13,value=6720},	
						{type=15,value=14124},	
						{type=31,value=1240},		
					},		
						--·ÉÉý46¼¶	
					{		
						{type=13,value=6924},	
						{type=15,value=14553},	
						{type=31,value=1280},		
					},		
						--·ÉÉý47¼¶	
					{		
						{type=13,value=7128},	
						{type=15,value=14982},	
						{type=31,value=1320},		
					},		
						--·ÉÉý48¼¶	
					{		
						{type=13,value=7332},	
						{type=15,value=15411},	
						{type=31,value=1360},		
					},		
						--·ÉÉý49¼¶	
					{		
						{type=13,value=7536},	
						{type=15,value=15840},	
						{type=31,value=1400},		
					},		
						--·ÉÉý50¼¶	
					{		
						{type=13,value=7740},	
						{type=15,value=16269},	
						{type=31,value=1440},		
					},		    		
		    	},	 
		    	
		    	-- µÀ
				{
										-- ·ÉÉý1 --
					{
						{type=17,value=38},
			    		{type=19,value=78},
						{type=31,value=5},

		    		},
					-- ·ÉÉý2 --
					{
						{type=17,value=75},
			    		{type=19,value=157},
						{type=31,value=10},

		    		},
					-- ·ÉÉý3 --
					{
						{type=17,value=112},
			    		{type=19,value=235},
						{type=31,value=15},

		    		},
					-- ·ÉÉý4 --
					{
						{type=17,value=150},
			    		{type=19,value=314},
						{type=31,value=20},

		    		},
					-- ·ÉÉý5 --
					{
						{type=17,value=188},
			    		{type=19,value=393},
						{type=31,value=24},

		    		},
					-- ·ÉÉý6 --
					{
						{type=17,value=248},
			    		{type=19,value=519},
						{type=31,value=32},

		    		},
					-- ·ÉÉý7 --
					{
						{type=17,value=308},
			    		{type=19,value=645},
						{type=31,value=40},

		    		},
					-- ·ÉÉý8 --
					{
						{type=17,value=368},
			    		{type=19,value=771},
						{type=31,value=48},

		    		},
					-- ·ÉÉý9 --
					{
						{type=17,value=428},
			    		{type=19,value=897},
						{type=31,value=56},

		    		},
					-- ·ÉÉý10 --
					{
						{type=17,value=488},
			    		{type=19,value=1023},
						{type=31,value=64},

		    		},
					-- ·ÉÉý11 --
					{
						{type=17,value=573},
			    		{type=19,value=1202},
						{type=31,value=77},

		    		},
					-- ·ÉÉý12 --
					{
						{type=17,value=660},
			    		{type=19,value=1384},
						{type=31,value=90},

		    		},
					-- ·ÉÉý13 --
					{
						{type=17,value=746},
			    		{type=19,value=1566},
						{type=31,value=103},

		    		},
					-- ·ÉÉý14 --
					{
						{type=17,value=833},
			    		{type=19,value=1748},
						{type=31,value=116},

		    		},
					-- ·ÉÉý15 --
					{
						{type=17,value=920},
			    		{type=19,value=1932},
						{type=31,value=128},

		    		},
					-- ·ÉÉý16 --
					{
						{type=17,value=1060},
			    		{type=19,value=2225},
						{type=31,value=151},

		    		},
					-- ·ÉÉý17 --
					{
						{type=17,value=1200},
			    		{type=19,value=2518},
						{type=31,value=174},

		    		},
					-- ·ÉÉý18 --
					{
						{type=17,value=1339},
			    		{type=19,value=2811},
						{type=31,value=197},

		    		},
					-- ·ÉÉý19 --
					{
						{type=17,value=1479},
			    		{type=19,value=3104},
						{type=31,value=220},

		    		},
					-- ·ÉÉý20 --
					{
						{type=17,value=1619},
			    		{type=19,value=3399},
						{type=31,value=240},

		    		},
					-- ·ÉÉý21 --
					{
						{type=17,value=1823},
			    		{type=19,value=3828},
						{type=31,value=280},

		    		},
					-- ·ÉÉý22 --
					{
						{type=17,value=2028},
			    		{type=19,value=4257},
						{type=31,value=320},

		    		},
					-- ·ÉÉý23 --
					{
						{type=17,value=2232},
			    		{type=19,value=4686},
						{type=31,value=360},

		    		},
					-- ·ÉÉý24 --
					{
						{type=17,value=2436},
			    		{type=19,value=5115},
						{type=31,value=400},

		    		},
					-- ·ÉÉý25 --
					{
						{type=17,value=2640},
			    		{type=19,value=5544},
						{type=31,value=440},

		    		},
						--·ÉÉý26¼¶	
					{		
						{type=17,value=2844},	
						{type=19,value=5973},	
						{type=31,value=480},		
					},		
						--·ÉÉý27¼¶	
					{		
						{type=17,value=3048},	
						{type=19,value=6402},	
						{type=31,value=520},		
					},		
						--·ÉÉý28¼¶	
					{		
						{type=17,value=3252},	
						{type=19,value=6831},	
						{type=31,value=560},		
					},		
						--·ÉÉý29¼¶	
					{		
						{type=17,value=3456},	
						{type=19,value=7260},	
						{type=31,value=600},		
					},		
						--·ÉÉý30¼¶	
					{		
						{type=17,value=3660},	
						{type=19,value=7689},	
						{type=31,value=640},		
					},		
						--·ÉÉý31¼¶	
					{		
						{type=17,value=3864},	
						{type=19,value=8118},	
						{type=31,value=680},		
					},		
						--·ÉÉý32¼¶	
					{		
						{type=17,value=4068},	
						{type=19,value=8547},	
						{type=31,value=720},		
					},		
						--·ÉÉý33¼¶	
					{		
						{type=17,value=4272},	
						{type=19,value=8976},	
						{type=31,value=760},		
					},		
						--·ÉÉý34¼¶	
					{		
						{type=17,value=4476},	
						{type=19,value=9405},	
						{type=31,value=800},		
					},		
						--·ÉÉý35¼¶	
					{		
						{type=17,value=4680},	
						{type=19,value=9834},	
						{type=31,value=840},		
					},		
						--·ÉÉý36¼¶	
					{		
						{type=17,value=4884},	
						{type=19,value=10263},	
						{type=31,value=880},		
					},		
						--·ÉÉý37¼¶	
					{		
						{type=17,value=5088},	
						{type=19,value=10692},	
						{type=31,value=920},		
					},		
						--·ÉÉý38¼¶	
					{		
						{type=17,value=5292},	
						{type=19,value=11121},	
						{type=31,value=960},		
					},		
						--·ÉÉý39¼¶	
					{		
						{type=17,value=5496},	
						{type=19,value=11550},	
						{type=31,value=1000},		
					},		
						--·ÉÉý40¼¶	
					{		
						{type=17,value=5700},	
						{type=19,value=11979},	
						{type=31,value=1040},		
					},		
						--·ÉÉý41¼¶	
					{		
						{type=17,value=5904},	
						{type=19,value=12408},	
						{type=31,value=1080},		
					},		
						--·ÉÉý42¼¶	
					{		
						{type=17,value=6108},	
						{type=19,value=12837},	
						{type=31,value=1120},		
					},		
						--·ÉÉý43¼¶	
					{		
						{type=17,value=6312},	
						{type=19,value=13266},	
						{type=31,value=1160},		
					},		
						--·ÉÉý44¼¶	
					{		
						{type=17,value=6516},	
						{type=19,value=13695},	
						{type=31,value=1200},		
					},		
						--·ÉÉý45¼¶	
					{		
						{type=17,value=6720},	
						{type=19,value=14124},	
						{type=31,value=1240},		
					},		
						--·ÉÉý46¼¶	
					{		
						{type=17,value=6924},	
						{type=19,value=14553},	
						{type=31,value=1280},		
					},		
						--·ÉÉý47¼¶	
					{		
						{type=17,value=7128},	
						{type=19,value=14982},	
						{type=31,value=1320},		
					},		
						--·ÉÉý48¼¶	
					{		
						{type=17,value=7332},	
						{type=19,value=15411},	
						{type=31,value=1360},		
					},		
						--·ÉÉý49¼¶	
					{		
						{type=17,value=7536},	
						{type=19,value=15840},	
						{type=31,value=1400},		
					},		
						--·ÉÉý50¼¶	
					{		
						{type=17,value=7740},	
						{type=19,value=16269},	
						{type=31,value=1440},		
					},
		    		
		    	},	 
			}, 
		},
		
		-- ³á°ò 8
		{
			itemId = 6226,
			
			-- ³á°òÀàÐÍ£º1 Îª»ÃÓð³á°ò, 2 Îª¾ø°æ³á°ò
			swingType = 1,
			
			-- Ã¿½×µÄ³á°òÍâ¹Û
			--swingShowIds = {41,42,43,44,45},
			swingShowIds = {61,62,63,64,65,65,65,65,65,65}, 
			-- ÄÚ¹ÛÌØÐ§
			iconIds = {30562,30563,30564,30565,30566,30566,30566,30566,30566,30566}, 
			--³á°òid
			swingIds = {6242,6243,6244,6245,6246,7903,7904,7905,7906,7907},
			-- Éý½×ÏûºÄ³á°òÊýÁ¿(µÚ1¸ö´ú±í1½×)
			classConsumeCounts = { 1,4,8,16,32,64,128,256,512,800},
			
			-- Éý¼¶ÏûºÄ³á°ò½á¾§ÊýÁ¿
			levelConsumeCounts = {2,4,6,8,10,12,14,16,18,20,23,27,31,35,40,45,50,56,62,68,74,81,88,96,103,110,117,124,131,138,145,152,159,166,173,180,187,194,201,208,215,222,229,236,243,250,257,264,271,278},
			
			-- ½×¼¶ÊôÐÔ
			classAttrs = {
				-- Õ½

				-- -- (a1) 
				-- 	{
				-- 		{type=(a2),value=(a3)},
			    -- 		{type=(a4),value=(a5)},
				-- 		{type=(a6),value=(a7)},
				-- 		{type=(a8),value=(a9)},

		    	-- 	},

				{
								-- 1½× 
					{
						{type=9,value=125},
			    		{type=11,value=262},
						{type=128,value=40},
						{type=129,value=624},

		    		},
				-- 2½× 
					{
						{type=9,value=325},
			    		{type=11,value=682},
						{type=128,value=80},
						{type=129,value=1664},

		    		},
				-- 3½× 
					{
						{type=9,value=614},
			    		{type=11,value=1288},
						{type=128,value=120},
						{type=129,value=3328},

		    		},
				-- 4½× 
					{
						{type=9,value=1080},
			    		{type=11,value=2266},
						{type=128,value=160},
						{type=129,value=6240},

		    		},
				-- 5½× 
					{
						{type=9,value=1760},
			    		{type=11,value=3696},
						{type=128,value=200},
						{type=129,value=11440},

		    		},
				-- 6½× 
					{
						{type=9,value=2440},
						{type=11,value=5126},
						{type=128,value=240},
						{type=129,value=16640},

		    		},
				-- 7½× 
					{
						{type=9,value=3120},
						{type=11,value=6556},
						{type=128,value=280},
						{type=129,value=21840},

		    		},
				-- 8½× 
					{
						{type=9,value=3800},
						{type=11,value=7986},
						{type=128,value=320},
						{type=129,value=27040},

		    		},
				-- 9½× 
					{
						{type=9,value=4480},
						{type=11,value=9416},
						{type=128,value=360},
						{type=129,value=32240},

		    		},
				-- 10½× 
					{
						{type=9,value=5160},
						{type=11,value=10846},
						{type=128,value=400},
						{type=129,value=37440},
		    		},		    		
		    		
		    	},	 
		    	
		    	-- ·¨
				{
									-- 1½× 
					{
						{type=13,value=125},
			    		{type=15,value=262},
						{type=128,value=40},
						{type=129,value=624},

		    		},
				-- 2½× 
					{
						{type=13,value=325},
			    		{type=15,value=682},
						{type=128,value=80},
						{type=129,value=1664},

		    		},
				-- 3½× 
					{
						{type=13,value=614},
			    		{type=15,value=1288},
						{type=128,value=120},
						{type=129,value=3328},

		    		},
				-- 4½× 
					{
						{type=13,value=1080},
			    		{type=15,value=2266},
						{type=128,value=160},
						{type=129,value=6240},

		    		},
				-- 5½× 
					{
						{type=13,value=1760},
			    		{type=15,value=3696},
						{type=128,value=200},
						{type=129,value=11440},

		    		},
				-- 6½× 
					{
						{type=13,value=2440},
						{type=15,value=5126},
						{type=128,value=240},
						{type=129,value=16640},

		    		},
				-- 7½× 
					{
						{type=13,value=3120},
						{type=15,value=6556},
						{type=128,value=280},
						{type=129,value=21840},

		    		},
				-- 8½× 
					{
						{type=13,value=3800},
						{type=15,value=7986},
						{type=128,value=320},
						{type=129,value=27040},

		    		},
				-- 9½× 
					{
						{type=13,value=4480},
						{type=15,value=9416},
						{type=128,value=360},
						{type=129,value=32240},

		    		},
				-- 10½× 
					{
						{type=13,value=5160},
						{type=15,value=10846},
						{type=128,value=400},
						{type=129,value=37440},
		    		},

		    		
		    	},	 
		    	
		    	-- µÀ
				{
									-- 1½× 
					{
						{type=17,value=125},
			    		{type=19,value=262},
						{type=128,value=40},
						{type=129,value=624},

		    		},
				-- 2½× 
					{
						{type=17,value=325},
			    		{type=19,value=682},
						{type=128,value=80},
						{type=129,value=1664},

		    		},
				-- 3½× 
					{
						{type=17,value=614},
			    		{type=19,value=1288},
						{type=128,value=120},
						{type=129,value=3328},

		    		},
				-- 4½× 
					{
						{type=17,value=1080},
			    		{type=19,value=2266},
						{type=128,value=160},
						{type=129,value=6240},

		    		},
				-- 5½× 
					{
						{type=17,value=1760},
			    		{type=19,value=3696},
						{type=128,value=200},
						{type=129,value=11440},

		    		},
				-- 6½× 
					{
						{type=17,value=2440},
						{type=19,value=5126},
						{type=128,value=240},
						{type=129,value=16640},

		    		},
				-- 7½× 
					{
						{type=17,value=3120},
						{type=19,value=6556},
						{type=128,value=280},
						{type=129,value=21840},

		    		},
				-- 8½× 
					{
						{type=17,value=3800},
						{type=19,value=7986},
						{type=128,value=320},
						{type=129,value=27040},

		    		},
				-- 9½× 
					{
						{type=17,value=4480},
						{type=19,value=9416},
						{type=128,value=360},
						{type=129,value=32240},

		    		},
				-- 10½× 
					{
						{type=17,value=5160},
						{type=19,value=10846},
						{type=128,value=400},
						{type=129,value=37440},
		    		},

		    		
		    	},	    	
		    	
			},
			
			-- µÈ¼¶ÊôÐÔ
			levelAttrs = {
				-- Õ½

					-- -- (a1) ¼¶ --
					-- {
					-- 	{type=(a2),value=(a3)},
			    	-- 	{type=(a4),value=(a5)},
					-- 	{type=(a6),value=(a7)},
					-- 	{type=(a8),value=(a9)},

		    		-- },

				{
					
					-- ·ÉÉý1 ¼¶ --
					{
						{type=9,value=38},
			    		{type=11,value=78},
						{type=128,value=10},
						{type=129,value=140},

		    		},

					-- ·ÉÉý2 ¼¶ --
					{
						{type=9,value=75},
			    		{type=11,value=157},
						{type=128,value=20},
						{type=129,value=280},

		    		},

					-- ·ÉÉý3 ¼¶ --
					{
						{type=9,value=112},
			    		{type=11,value=235},
						{type=128,value=30},
						{type=129,value=420},

		    		},

					-- ·ÉÉý4 ¼¶ --
					{
						{type=9,value=150},
			    		{type=11,value=314},
						{type=128,value=40},
						{type=129,value=560},

		    		},

					-- ·ÉÉý5 ¼¶ --
					{
						{type=9,value=188},
			    		{type=11,value=393},
						{type=128,value=50},
						{type=129,value=648},

		    		},

					-- ·ÉÉý6 ¼¶ --
					{
						{type=9,value=248},
			    		{type=11,value=519},
						{type=128,value=60},
						{type=129,value=944},

		    		},

					-- ·ÉÉý7 ¼¶ --
					{
						{type=9,value=308},
			    		{type=11,value=645},
						{type=128,value=70},
						{type=129,value=1240},

		    		},

					-- ·ÉÉý8 ¼¶ --
					{
						{type=9,value=368},
			    		{type=11,value=771},
						{type=128,value=80},
						{type=129,value=1536},

		    		},

					-- ·ÉÉý9 ¼¶ --
					{
						{type=9,value=428},
			    		{type=11,value=897},
						{type=128,value=90},
						{type=129,value=1832},

		    		},

					-- ·ÉÉý10 ¼¶ --
					{
						{type=9,value=488},
			    		{type=11,value=1023},
						{type=128,value=100},
						{type=129,value=2128},

		    		},

					-- ·ÉÉý11 ¼¶ --
					{
						{type=9,value=573},
			    		{type=11,value=1202},
						{type=128,value=110},
						{type=129,value=2684},

		    		},

					-- ·ÉÉý12 ¼¶ --
					{
						{type=9,value=660},
			    		{type=11,value=1384},
						{type=128,value=120},
						{type=129,value=3240},

		    		},

					-- ·ÉÉý13 ¼¶ --
					{
						{type=9,value=746},
			    		{type=11,value=1566},
						{type=128,value=130},
						{type=129,value=3796},

		    		},

					-- ·ÉÉý14 ¼¶ --
					{
						{type=9,value=833},
			    		{type=11,value=1748},
						{type=128,value=140},
						{type=129,value=4352},

		    		},

					-- ·ÉÉý15 ¼¶ --
					{
						{type=9,value=920},
			    		{type=11,value=1932},
						{type=128,value=150},
						{type=129,value=4856},

		    		},

					-- ·ÉÉý16 ¼¶ --
					{
						{type=9,value=1060},
			    		{type=11,value=2225},
						{type=128,value=160},
						{type=129,value=5932},

		    		},

					-- ·ÉÉý17 ¼¶ --
					{
						{type=9,value=1200},
			    		{type=11,value=2518},
						{type=128,value=170},
						{type=129,value=7008},

		    		},

					-- ·ÉÉý18 ¼¶ --
					{
						{type=9,value=1339},
			    		{type=11,value=2811},
						{type=128,value=180},
						{type=129,value=8084},

		    		},

					-- ·ÉÉý19 ¼¶ --
					{
						{type=9,value=1479},
			    		{type=11,value=3104},
						{type=128,value=190},
						{type=129,value=9160},

		    		},

					-- ·ÉÉý20 ¼¶ --
					{
						{type=9,value=1619},
			    		{type=11,value=3399},
						{type=128,value=200},
						{type=129,value=10080},

		    		},

					-- ·ÉÉý21 ¼¶ --
					{
						{type=9,value=1823},
			    		{type=11,value=3828},
						{type=128,value=210},
						{type=129,value=12040},

		    		},

					-- ·ÉÉý22 ¼¶ --
					{
						{type=9,value=2028},
			    		{type=11,value=4257},
						{type=128,value=220},
						{type=129,value=14000},

		    		},

					-- ·ÉÉý23 ¼¶ --
					{
						{type=9,value=2232},
			    		{type=11,value=4686},
						{type=128,value=230},
						{type=129,value=15960},

		    		},

					-- ·ÉÉý24 ¼¶ --
					{
						{type=9,value=2436},
			    		{type=11,value=5115},
						{type=128,value=240},
						{type=129,value=17920},

		    		},

					-- ·ÉÉý25 ¼¶ --
					{
						{type=9,value=2640},
			    		{type=11,value=5544},
						{type=128,value=250},
						{type=129,value=19880},

		    		},
						--·ÉÉý26¼¶			
					{				
						{type=9,value=2844},			
						{type=11,value=5973},			
						{type=128,value=260},			
						{type=129,value=21840},			
					},				
						--·ÉÉý27¼¶			
					{				
						{type=9,value=3048},			
						{type=11,value=6402},			
						{type=128,value=270},			
						{type=129,value=23800},			
					},				
						--·ÉÉý28¼¶			
					{				
						{type=9,value=3252},			
						{type=11,value=6831},			
						{type=128,value=280},			
						{type=129,value=25760},			
					},				
						--·ÉÉý29¼¶			
					{				
						{type=9,value=3456},			
						{type=11,value=7260},			
						{type=128,value=290},			
						{type=129,value=27720},			
					},				
						--·ÉÉý30¼¶			
					{				
						{type=9,value=3660},			
						{type=11,value=7689},			
						{type=128,value=300},			
						{type=129,value=29680},			
					},				
						--·ÉÉý31¼¶			
					{				
						{type=9,value=3864},			
						{type=11,value=8118},			
						{type=128,value=310},			
						{type=129,value=31640},			
					},				
						--·ÉÉý32¼¶			
					{				
						{type=9,value=4068},			
						{type=11,value=8547},			
						{type=128,value=320},			
						{type=129,value=33600},			
					},				
						--·ÉÉý33¼¶			
					{				
						{type=9,value=4272},			
						{type=11,value=8976},			
						{type=128,value=330},			
						{type=129,value=35560},			
					},				
						--·ÉÉý34¼¶			
					{				
						{type=9,value=4476},			
						{type=11,value=9405},			
						{type=128,value=340},			
						{type=129,value=37520},			
					},				
						--·ÉÉý35¼¶			
					{				
						{type=9,value=4680},			
						{type=11,value=9834},			
						{type=128,value=350},			
						{type=129,value=39480},			
					},				
						--·ÉÉý36¼¶			
					{				
						{type=9,value=4884},			
						{type=11,value=10263},			
						{type=128,value=360},			
						{type=129,value=41440},			
					},				
						--·ÉÉý37¼¶			
					{				
						{type=9,value=5088},			
						{type=11,value=10692},			
						{type=128,value=370},			
						{type=129,value=43400},			
					},				
						--·ÉÉý38¼¶			
					{				
						{type=9,value=5292},			
						{type=11,value=11121},			
						{type=128,value=380},			
						{type=129,value=45360},			
					},				
						--·ÉÉý39¼¶			
					{				
						{type=9,value=5496},			
						{type=11,value=11550},			
						{type=128,value=390},			
						{type=129,value=47320},			
					},				
						--·ÉÉý40¼¶			
					{				
						{type=9,value=5700},			
						{type=11,value=11979},			
						{type=128,value=400},			
						{type=129,value=49280},			
					},				
						--·ÉÉý41¼¶			
					{				
						{type=9,value=5904},			
						{type=11,value=12408},			
						{type=128,value=410},			
						{type=129,value=51240},			
					},				
						--·ÉÉý42¼¶			
					{				
						{type=9,value=6108},			
						{type=11,value=12837},			
						{type=128,value=420},			
						{type=129,value=53200},			
					},				
						--·ÉÉý43¼¶			
					{				
						{type=9,value=6312},			
						{type=11,value=13266},			
						{type=128,value=430},			
						{type=129,value=55160},			
					},				
						--·ÉÉý44¼¶			
					{				
						{type=9,value=6516},			
						{type=11,value=13695},			
						{type=128,value=440},			
						{type=129,value=57120},			
					},				
						--·ÉÉý45¼¶			
					{				
						{type=9,value=6720},			
						{type=11,value=14124},			
						{type=128,value=450},			
						{type=129,value=59080},			
					},				
						--·ÉÉý46¼¶			
					{				
						{type=9,value=6924},			
						{type=11,value=14553},			
						{type=128,value=460},			
						{type=129,value=61040},			
					},				
						--·ÉÉý47¼¶			
					{				
						{type=9,value=7128},			
						{type=11,value=14982},			
						{type=128,value=470},			
						{type=129,value=63000},			
					},				
						--·ÉÉý48¼¶			
					{				
						{type=9,value=7332},			
						{type=11,value=15411},			
						{type=128,value=480},			
						{type=129,value=64960},			
					},				
						--·ÉÉý49¼¶			
					{				
						{type=9,value=7536},			
						{type=11,value=15840},			
						{type=128,value=490},			
						{type=129,value=66920},			
					},				
						--·ÉÉý50¼¶			
					{				
						{type=9,value=7740},			
						{type=11,value=16269},			
						{type=128,value=500},			
						{type=129,value=68880},			
					},				

		    		
		    	},	 
		    	
		    	-- ·¨
				{
					
					-- ·ÉÉý1 ¼¶ --
					{
						{type=13,value=38},
			    		{type=15,value=78},
						{type=128,value=10},
						{type=129,value=140},

		    		},

					-- ·ÉÉý2 ¼¶ --
					{
						{type=13,value=75},
			    		{type=15,value=157},
						{type=128,value=20},
						{type=129,value=280},

		    		},

					-- ·ÉÉý3 ¼¶ --
					{
						{type=13,value=112},
			    		{type=15,value=235},
						{type=128,value=30},
						{type=129,value=420},

		    		},

					-- ·ÉÉý4 ¼¶ --
					{
						{type=13,value=150},
			    		{type=15,value=314},
						{type=128,value=40},
						{type=129,value=560},

		    		},

					-- ·ÉÉý5 ¼¶ --
					{
						{type=13,value=188},
			    		{type=15,value=393},
						{type=128,value=50},
						{type=129,value=648},

		    		},

					-- ·ÉÉý6 ¼¶ --
					{
						{type=13,value=248},
			    		{type=15,value=519},
						{type=128,value=60},
						{type=129,value=944},

		    		},

					-- ·ÉÉý7 ¼¶ --
					{
						{type=13,value=308},
			    		{type=15,value=645},
						{type=128,value=70},
						{type=129,value=1240},

		    		},

					-- ·ÉÉý8 ¼¶ --
					{
						{type=13,value=368},
			    		{type=15,value=771},
						{type=128,value=80},
						{type=129,value=1536},

		    		},

					-- ·ÉÉý9 ¼¶ --
					{
						{type=13,value=428},
			    		{type=15,value=897},
						{type=128,value=90},
						{type=129,value=1832},

		    		},

					-- ·ÉÉý10 ¼¶ --
					{
						{type=13,value=488},
			    		{type=15,value=1023},
						{type=128,value=100},
						{type=129,value=2128},

		    		},

					-- ·ÉÉý11 ¼¶ --
					{
						{type=13,value=573},
			    		{type=15,value=1202},
						{type=128,value=110},
						{type=129,value=2684},

		    		},

					-- ·ÉÉý12 ¼¶ --
					{
						{type=13,value=660},
			    		{type=15,value=1384},
						{type=128,value=120},
						{type=129,value=3240},

		    		},

					-- ·ÉÉý13 ¼¶ --
					{
						{type=13,value=746},
			    		{type=15,value=1566},
						{type=128,value=130},
						{type=129,value=3796},

		    		},

					-- ·ÉÉý14 ¼¶ --
					{
						{type=13,value=833},
			    		{type=15,value=1748},
						{type=128,value=140},
						{type=129,value=4352},

		    		},

					-- ·ÉÉý15 ¼¶ --
					{
						{type=13,value=920},
			    		{type=15,value=1932},
						{type=128,value=150},
						{type=129,value=4856},

		    		},

					-- ·ÉÉý16 ¼¶ --
					{
						{type=13,value=1060},
			    		{type=15,value=2225},
						{type=128,value=160},
						{type=129,value=5932},

		    		},

					-- ·ÉÉý17 ¼¶ --
					{
						{type=13,value=1200},
			    		{type=15,value=2518},
						{type=128,value=170},
						{type=129,value=7008},

		    		},

					-- ·ÉÉý18 ¼¶ --
					{
						{type=13,value=1339},
			    		{type=15,value=2811},
						{type=128,value=180},
						{type=129,value=8084},

		    		},

					-- ·ÉÉý19 ¼¶ --
					{
						{type=13,value=1479},
			    		{type=15,value=3104},
						{type=128,value=190},
						{type=129,value=9160},

		    		},

					-- ·ÉÉý20 ¼¶ --
					{
						{type=13,value=1619},
			    		{type=15,value=3399},
						{type=128,value=200},
						{type=129,value=10080},

		    		},

					-- ·ÉÉý21 ¼¶ --
					{
						{type=13,value=1823},
			    		{type=15,value=3828},
						{type=128,value=210},
						{type=129,value=12040},

		    		},

					-- ·ÉÉý22 ¼¶ --
					{
						{type=13,value=2028},
			    		{type=15,value=4257},
						{type=128,value=220},
						{type=129,value=14000},

		    		},

					-- ·ÉÉý23 ¼¶ --
					{
						{type=13,value=2232},
			    		{type=15,value=4686},
						{type=128,value=230},
						{type=129,value=15960},

		    		},

					-- ·ÉÉý24 ¼¶ --
					{
						{type=13,value=2436},
			    		{type=15,value=5115},
						{type=128,value=240},
						{type=129,value=17920},

		    		},

					-- ·ÉÉý25 ¼¶ --
					{
						{type=13,value=2640},
			    		{type=15,value=5544},
						{type=128,value=250},
						{type=129,value=19880},

		    		},
	                 --·ÉÉý26¼¶			
					{				
						{type=13,value=2844},			
						{type=15,value=5973},			
						{type=128,value=260},			
						{type=129,value=21840},			
					},				
						--·ÉÉý27¼¶			
					{				
						{type=13,value=3048},			
						{type=15,value=6402},			
						{type=128,value=270},			
						{type=129,value=23800},			
					},				
						--·ÉÉý28¼¶			
					{				
						{type=13,value=3252},			
						{type=15,value=6831},			
						{type=128,value=280},			
						{type=129,value=25760},			
					},				
						--·ÉÉý29¼¶			
					{				
						{type=13,value=3456},			
						{type=15,value=7260},			
						{type=128,value=290},			
						{type=129,value=27720},			
					},				
						--·ÉÉý30¼¶			
					{				
						{type=13,value=3660},			
						{type=15,value=7689},			
						{type=128,value=300},			
						{type=129,value=29680},			
					},				
						--·ÉÉý31¼¶			
					{				
						{type=13,value=3864},			
						{type=15,value=8118},			
						{type=128,value=310},			
						{type=129,value=31640},			
					},				
						--·ÉÉý32¼¶			
					{				
						{type=13,value=4068},			
						{type=15,value=8547},			
						{type=128,value=320},			
						{type=129,value=33600},			
					},				
						--·ÉÉý33¼¶			
					{				
						{type=13,value=4272},			
						{type=15,value=8976},			
						{type=128,value=330},			
						{type=129,value=35560},			
					},				
						--·ÉÉý34¼¶			
					{				
						{type=13,value=4476},			
						{type=15,value=9405},			
						{type=128,value=340},			
						{type=129,value=37520},			
					},				
						--·ÉÉý35¼¶			
					{				
						{type=13,value=4680},			
						{type=15,value=9834},			
						{type=128,value=350},			
						{type=129,value=39480},			
					},				
						--·ÉÉý36¼¶			
					{				
						{type=13,value=4884},			
						{type=15,value=10263},			
						{type=128,value=360},			
						{type=129,value=41440},			
					},				
						--·ÉÉý37¼¶			
					{				
						{type=13,value=5088},			
						{type=15,value=10692},			
						{type=128,value=370},			
						{type=129,value=43400},			
					},				
						--·ÉÉý38¼¶			
					{				
						{type=13,value=5292},			
						{type=15,value=11121},			
						{type=128,value=380},			
						{type=129,value=45360},			
					},				
						--·ÉÉý39¼¶			
					{				
						{type=13,value=5496},			
						{type=15,value=11550},			
						{type=128,value=390},			
						{type=129,value=47320},			
					},				
						--·ÉÉý40¼¶			
					{				
						{type=13,value=5700},			
						{type=15,value=11979},			
						{type=128,value=400},			
						{type=129,value=49280},			
					},				
						--·ÉÉý41¼¶			
					{				
						{type=13,value=5904},			
						{type=15,value=12408},			
						{type=128,value=410},			
						{type=129,value=51240},			
					},				
						--·ÉÉý42¼¶			
					{				
						{type=13,value=6108},			
						{type=15,value=12837},			
						{type=128,value=420},			
						{type=129,value=53200},			
					},				
						--·ÉÉý43¼¶			
					{				
						{type=13,value=6312},			
						{type=15,value=13266},			
						{type=128,value=430},			
						{type=129,value=55160},			
					},				
						--·ÉÉý44¼¶			
					{				
						{type=13,value=6516},			
						{type=15,value=13695},			
						{type=128,value=440},			
						{type=129,value=57120},			
					},				
						--·ÉÉý45¼¶			
					{				
						{type=13,value=6720},			
						{type=15,value=14124},			
						{type=128,value=450},			
						{type=129,value=59080},			
					},				
						--·ÉÉý46¼¶			
					{				
						{type=13,value=6924},			
						{type=15,value=14553},			
						{type=128,value=460},			
						{type=129,value=61040},			
					},				
						--·ÉÉý47¼¶			
					{				
						{type=13,value=7128},			
						{type=15,value=14982},			
						{type=128,value=470},			
						{type=129,value=63000},			
					},				
						--·ÉÉý48¼¶			
					{				
						{type=13,value=7332},			
						{type=15,value=15411},			
						{type=128,value=480},			
						{type=129,value=64960},			
					},				
						--·ÉÉý49¼¶			
					{				
						{type=13,value=7536},			
						{type=15,value=15840},			
						{type=128,value=490},			
						{type=129,value=66920},			
					},				
						--·ÉÉý50¼¶			
					{				
						{type=13,value=7740},			
						{type=15,value=16269},			
						{type=128,value=500},			
						{type=129,value=68880},			
					},	

		    		
		    	},	 
		    	
		    	-- µÀ
				{
				
					-- ·ÉÉý1 ¼¶ --
					{
						{type=17,value=38},
			    		{type=19,value=78},
						{type=128,value=10},
						{type=129,value=140},

		    		},

					-- ·ÉÉý2 ¼¶ --
					{
						{type=17,value=75},
			    		{type=19,value=157},
						{type=128,value=20},
						{type=129,value=280},

		    		},

					-- ·ÉÉý3 ¼¶ --
					{
						{type=17,value=112},
			    		{type=19,value=235},
						{type=128,value=30},
						{type=129,value=420},

		    		},

					-- ·ÉÉý4 ¼¶ --
					{
						{type=17,value=150},
			    		{type=19,value=314},
						{type=128,value=40},
						{type=129,value=560},

		    		},

					-- ·ÉÉý5 ¼¶ --
					{
						{type=17,value=188},
			    		{type=19,value=393},
						{type=128,value=50},
						{type=129,value=648},

		    		},

					-- ·ÉÉý6 ¼¶ --
					{
						{type=17,value=248},
			    		{type=19,value=519},
						{type=128,value=60},
						{type=129,value=944},

		    		},

					-- ·ÉÉý7 ¼¶ --
					{
						{type=17,value=308},
			    		{type=19,value=645},
						{type=128,value=70},
						{type=129,value=1240},

		    		},

					-- ·ÉÉý8 ¼¶ --
					{
						{type=17,value=368},
			    		{type=19,value=771},
						{type=128,value=80},
						{type=129,value=1536},

		    		},

					-- ·ÉÉý9 ¼¶ --
					{
						{type=17,value=428},
			    		{type=19,value=897},
						{type=128,value=90},
						{type=129,value=1832},

		    		},

					-- ·ÉÉý10 ¼¶ --
					{
						{type=17,value=488},
			    		{type=19,value=1023},
						{type=128,value=100},
						{type=129,value=2128},

		    		},

					-- ·ÉÉý11 ¼¶ --
					{
						{type=17,value=573},
			    		{type=19,value=1202},
						{type=128,value=110},
						{type=129,value=2684},

		    		},

					-- ·ÉÉý12 ¼¶ --
					{
						{type=17,value=660},
			    		{type=19,value=1384},
						{type=128,value=120},
						{type=129,value=3240},

		    		},

					-- ·ÉÉý13 ¼¶ --
					{
						{type=17,value=746},
			    		{type=19,value=1566},
						{type=128,value=130},
						{type=129,value=3796},

		    		},

					-- ·ÉÉý14 ¼¶ --
					{
						{type=17,value=833},
			    		{type=19,value=1748},
						{type=128,value=140},
						{type=129,value=4352},

		    		},

					-- ·ÉÉý15 ¼¶ --
					{
						{type=17,value=920},
			    		{type=19,value=1932},
						{type=128,value=150},
						{type=129,value=4856},

		    		},

					-- ·ÉÉý16 ¼¶ --
					{
						{type=17,value=1060},
			    		{type=19,value=2225},
						{type=128,value=160},
						{type=129,value=5932},

		    		},

					-- ·ÉÉý17 ¼¶ --
					{
						{type=17,value=1200},
			    		{type=19,value=2518},
						{type=128,value=170},
						{type=129,value=7008},

		    		},

					-- ·ÉÉý18 ¼¶ --
					{
						{type=17,value=1339},
			    		{type=19,value=2811},
						{type=128,value=180},
						{type=129,value=8084},

		    		},

					-- ·ÉÉý19 ¼¶ --
					{
						{type=17,value=1479},
			    		{type=19,value=3104},
						{type=128,value=190},
						{type=129,value=9160},

		    		},

					-- ·ÉÉý20 ¼¶ --
					{
						{type=17,value=1619},
			    		{type=19,value=3399},
						{type=128,value=200},
						{type=129,value=10080},

		    		},

					-- ·ÉÉý21 ¼¶ --
					{
						{type=17,value=1823},
			    		{type=19,value=3828},
						{type=128,value=210},
						{type=129,value=12040},

		    		},

					-- ·ÉÉý22 ¼¶ --
					{
						{type=17,value=2028},
			    		{type=19,value=4257},
						{type=128,value=220},
						{type=129,value=14000},

		    		},

					-- ·ÉÉý23 ¼¶ --
					{
						{type=17,value=2232},
			    		{type=19,value=4686},
						{type=128,value=230},
						{type=129,value=15960},

		    		},

					-- ·ÉÉý24 ¼¶ --
					{
						{type=17,value=2436},
			    		{type=19,value=5115},
						{type=128,value=240},
						{type=129,value=17920},

		    		},

					-- ·ÉÉý25 ¼¶ --
					{
						{type=17,value=2640},
			    		{type=19,value=5544},
						{type=128,value=250},
						{type=129,value=19880},

		    		},
	                                                                                        --·ÉÉý26¼¶			
					{				
						{type=17,value=2844},			
						{type=19,value=5973},			
						{type=128,value=260},			
						{type=129,value=21840},			
					},				
						--·ÉÉý27¼¶			
					{				
						{type=17,value=3048},			
						{type=19,value=6402},			
						{type=128,value=270},			
						{type=129,value=23800},			
					},				
						--·ÉÉý28¼¶			
					{				
						{type=17,value=3252},			
						{type=19,value=6831},			
						{type=128,value=280},			
						{type=129,value=25760},			
					},				
						--·ÉÉý29¼¶			
					{				
						{type=17,value=3456},			
						{type=19,value=7260},			
						{type=128,value=290},			
						{type=129,value=27720},			
					},				
						--·ÉÉý30¼¶			
					{				
						{type=17,value=3660},			
						{type=19,value=7689},			
						{type=128,value=300},			
						{type=129,value=29680},			
					},				
						--·ÉÉý31¼¶			
					{				
						{type=17,value=3864},			
						{type=19,value=8118},			
						{type=128,value=310},			
						{type=129,value=31640},			
					},				
						--·ÉÉý32¼¶			
					{				
						{type=17,value=4068},			
						{type=19,value=8547},			
						{type=128,value=320},			
						{type=129,value=33600},			
					},				
						--·ÉÉý33¼¶			
					{				
						{type=17,value=4272},			
						{type=19,value=8976},			
						{type=128,value=330},			
						{type=129,value=35560},			
					},				
						--·ÉÉý34¼¶			
					{				
						{type=17,value=4476},			
						{type=19,value=9405},			
						{type=128,value=340},			
						{type=129,value=37520},			
					},				
						--·ÉÉý35¼¶			
					{				
						{type=17,value=4680},			
						{type=19,value=9834},			
						{type=128,value=350},			
						{type=129,value=39480},			
					},				
						--·ÉÉý36¼¶			
					{				
						{type=17,value=4884},			
						{type=19,value=10263},			
						{type=128,value=360},			
						{type=129,value=41440},			
					},				
						--·ÉÉý37¼¶			
					{				
						{type=17,value=5088},			
						{type=19,value=10692},			
						{type=128,value=370},			
						{type=129,value=43400},			
					},				
						--·ÉÉý38¼¶			
					{				
						{type=17,value=5292},			
						{type=19,value=11121},			
						{type=128,value=380},			
						{type=129,value=45360},			
					},				
						--·ÉÉý39¼¶			
					{				
						{type=17,value=5496},			
						{type=19,value=11550},			
						{type=128,value=390},			
						{type=129,value=47320},			
					},				
						--·ÉÉý40¼¶			
					{				
						{type=17,value=5700},			
						{type=19,value=11979},			
						{type=128,value=400},			
						{type=129,value=49280},			
					},				
						--·ÉÉý41¼¶			
					{				
						{type=17,value=5904},			
						{type=19,value=12408},			
						{type=128,value=410},			
						{type=129,value=51240},			
					},				
						--·ÉÉý42¼¶			
					{				
						{type=17,value=6108},			
						{type=19,value=12837},			
						{type=128,value=420},			
						{type=129,value=53200},			
					},				
						--·ÉÉý43¼¶			
					{				
						{type=17,value=6312},			
						{type=19,value=13266},			
						{type=128,value=430},			
						{type=129,value=55160},			
					},				
						--·ÉÉý44¼¶			
					{				
						{type=17,value=6516},			
						{type=19,value=13695},			
						{type=128,value=440},			
						{type=129,value=57120},			
					},				
						--·ÉÉý45¼¶			
					{				
						{type=17,value=6720},			
						{type=19,value=14124},			
						{type=128,value=450},			
						{type=129,value=59080},			
					},				
						--·ÉÉý46¼¶			
					{				
						{type=17,value=6924},			
						{type=19,value=14553},			
						{type=128,value=460},			
						{type=129,value=61040},			
					},				
						--·ÉÉý47¼¶			
					{				
						{type=17,value=7128},			
						{type=19,value=14982},			
						{type=128,value=470},			
						{type=129,value=63000},			
					},				
						--·ÉÉý48¼¶			
					{				
						{type=17,value=7332},			
						{type=19,value=15411},			
						{type=128,value=480},			
						{type=129,value=64960},			
					},				
						--·ÉÉý49¼¶			
					{				
						{type=17,value=7536},			
						{type=19,value=15840},			
						{type=128,value=490},			
						{type=129,value=66920},			
					},				
						--·ÉÉý50¼¶			
					{				
						{type=17,value=7740},			
						{type=19,value=16269},			
						{type=128,value=500},			
						{type=129,value=68880},			
					},	
	
		    	},	 
			}, 
		},

		--³á°ò9  
		{
			itemId = 7157,
			
			-- ³á°òÀàÐÍ£º1 Îª»ÃÓð³á°ò, 2 Îª¾ø°æ³á°ò
			swingType = 1,
			
			-- Ã¿½×µÄ³á°òÍâ¹Û
			--swingShowIds = {41,42,43,44,45},
			swingShowIds = {66,67,68,69,70,70,70,70,70,70}, 
			-- ÄÚ¹ÛÌØÐ§
			iconIds = {31138,31139,31140,31141,31142,31142,31142,31142,31142,31142}, 
			--³á°òid
			swingIds = {7161,7162,7163,7164,7165,7908,7909,7910,7911,7912},
			-- Éý½×ÏûºÄ³á°òÊýÁ¿(µÚ1¸ö´ú±í1½×)
			classConsumeCounts = { 1,4,8,16,32,64,128,256,512,800},
			
			-- Éý¼¶ÏûºÄ³á°ò½á¾§ÊýÁ¿
			levelConsumeCounts = {2,4,6,8,10,12,14,16,18,20,23,27,31,35,40,45,50,56,62,68,74,81,88,96,103,110,117,124,131,138,145,152,159,166,173,180,187,194,201,208,215,222,229,236,243,250,257,264,271,278},
			
			-- ½×¼¶ÊôÐÔ
			classAttrs = {
				-- Õ½

					-- -- (a1) --
					-- {
					-- 	{type=(a2),value=(a3)},
			    	-- 	{type=(a4),value=(a5)},
					-- 	{type=(a6),value=(a7)},
					-- 	{type=(a8),value=(a9)},

		    		-- },

				{
										-- 1½× --
					{
						{type=9,value=125},
			    		{type=11,value=262},
						{type=5,value=3120},
						{type=7,value=315},

		    		},
					-- Éý½×1 --
					{
						{type=9,value=325},
			    		{type=11,value=682},
						{type=5,value=8320},
						{type=7,value=840},

		    		},
					-- Éý½×2 --
					{
						{type=9,value=614},
			    		{type=11,value=1288},
						{type=5,value=16640},
						{type=7,value=1681},

		    		},
					-- Éý½×3 --
					{
						{type=9,value=1080},
			    		{type=11,value=2266},
						{type=5,value=31200},
						{type=7,value=3152},

		    		},
					-- Éý½×4 --
					{
						{type=9,value=1760},
			    		{type=11,value=3696},
						{type=5,value=57200},
						{type=7,value=5778},

		    		},
					-- Éý½×6 --
					{
						{type=9,value=2440},
						{type=11,value=5126},
						{type=5,value=83200},
						{type=7,value=8004},

		    		},	

					-- Éý½×7 --
					{
						{type=9,value=3120},
						{type=11,value=6556},
						{type=5,value=109200},
						{type=7,value=10430},
		    		},	

					-- Éý½×8 --
					{
						{type=9,value=3800},
						{type=11,value=7986},
						{type=5,value=135200},
						{type=7,value=12856},
		    		},

					-- Éý½×9 --
					{
						{type=9,value=4480},
						{type=11,value=9416},
						{type=5,value=161200},
						{type=7,value=15282},
		    		},	

					-- Éý½×10 --
					{
						{type=9,value=5160},
						{type=11,value=10846},
						{type=5,value=187200},
						{type=7,value=17708},
		    		},	    				  

		    	},	 
		    	
		    	-- ·¨
				{
										-- 1½× --
					{
						{type=13,value=125},
			    		{type=15,value=262},
						{type=5,value=803},
						{type=7,value=3212},

		    		},
					-- Éý½×1 --
					{
						{type=13,value=325},
			    		{type=15,value=682},
						{type=5,value=2139},
						{type=7,value=8556},

		    		},
					-- Éý½×2 --
					{
						{type=13,value=614},
			    		{type=15,value=1288},
						{type=5,value=4278},
						{type=7,value=17112},

		    		},
					-- Éý½×3 --
					{
						{type=13,value=1080},
			    		{type=15,value=2266},
						{type=5,value=8021},
						{type=7,value=32084},

		    		},
					-- Éý½×4 --
					{
						{type=13,value=1760},
			    		{type=15,value=3696},
						{type=5,value=14705},
						{type=7,value=58820},

		    		},
					-- Éý½×6 --
					{
						{type=13,value=2440},
						{type=15,value=5126},
						{type=5,value=21389},
						{type=7,value=85556},

		    		},
					-- Éý½×7 --
					{
						{type=13,value=3120},
						{type=15,value=6556},
						{type=5,value=28073},
						{type=7,value=112292},
		    		},
					-- Éý½×8 --
					{
						{type=13,value=3800},
						{type=15,value=7986},
						{type=5,value=34757},
						{type=7,value=139028},
		    		},
					-- Éý½×9 --
					{
						{type=13,value=4480},
						{type=15,value=9416},
						{type=5,value=41441},
						{type=7,value=165764},
		    		},
					-- Éý½×10 --
					{
						{type=13,value=5160},
						{type=15,value=10846},
						{type=5,value=48125},
						{type=7,value=192500},
		    		},
		    		
		    	},	 
		    	
		    	-- µÀ
				{
										-- 1½× --
					{
						{type=17,value=125},
			    		{type=19,value=262},
						{type=5,value=1744},
						{type=7,value=1744},

		    		},
					-- Éý½×1 --
					{
						{type=17,value=325},
			    		{type=19,value=682},
						{type=5,value=4649},
						{type=7,value=4649},

		    		},
					-- Éý½×2 --
					{
						{type=17,value=614},
			    		{type=19,value=1288},
						{type=5,value=9297},
						{type=7,value=9297},

		    		},
					-- Éý½×3 --
					{
						{type=17,value=1080},
			    		{type=19,value=2266},
						{type=5,value=17431},
						{type=7,value=17431},

		    		},
					-- Éý½×4 --
					{
						{type=17,value=1760},
			    		{type=19,value=3696},
						{type=5,value=31956},
						{type=7,value=31956},

		    		},
					-- Éý½×6 --
					{
						{type=17,value=2440},
						{type=19,value=5126},
						{type=5,value=46481},
						{type=7,value=46481},

		    		},
					-- Éý½×7 --
					{
						{type=17,value=3120},
						{type=19,value=6556},
						{type=5,value=61006},
						{type=7,value=61006},

		    		},
					-- Éý½×8 --
					{
						{type=17,value=3800},
						{type=19,value=7986},
						{type=5,value=75531},
						{type=7,value=75531},

		    		},
					-- Éý½×9 --
					{
						{type=17,value=4480},
						{type=19,value=9416},
						{type=5,value=90056},
						{type=7,value=90056},
		    		},
					-- Éý½×10 --
					{
						{type=17,value=5160},
						{type=19,value=10846},
						{type=5,value=104581},
						{type=7,value=104581},
		    		},
		    		
		    	},	    	
		    	
			},
			
			-- µÈ¼¶ÊôÐÔ
			levelAttrs = {
				-- Õ½
					-- -- 	--Ä£¿é
					-- 			-- (a1) ¼¶ --
					-- {
					-- 	{type=(a2),value=(a3)},
			    	-- 	{type=(a4),value=(a5)},
					-- 	{type=(a6),value=(a7)},
					-- 	{type=(a8),value=(a9)},

		    		-- },



				{
													-- ·ÉÉý1 ¼¶ --
					{
						{type=9,value=38},
			    		{type=11,value=78},
						{type=5,value=1300},
						{type=7,value=131},

		    		},
								-- ·ÉÉý2 ¼¶ --
					{
						{type=9,value=75},
			    		{type=11,value=157},
						{type=5,value=2600},
						{type=7,value=263},

		    		},
								-- ·ÉÉý3 ¼¶ --
					{
						{type=9,value=112},
			    		{type=11,value=235},
						{type=5,value=3900},
						{type=7,value=394},

		    		},
								-- ·ÉÉý4 ¼¶ --
					{
						{type=9,value=150},
			    		{type=11,value=314},
						{type=5,value=5200},
						{type=7,value=525},

		    		},
								-- ·ÉÉý5 ¼¶ --
					{
						{type=9,value=188},
			    		{type=11,value=393},
						{type=5,value=6240},
						{type=7,value=630},

		    		},
								-- ·ÉÉý6 ¼¶ --
					{
						{type=9,value=248},
			    		{type=11,value=519},
						{type=5,value=8320},
						{type=7,value=840},

		    		},
								-- ·ÉÉý7 ¼¶ --
					{
						{type=9,value=308},
			    		{type=11,value=645},
						{type=5,value=10400},
						{type=7,value=1051},

		    		},
								-- ·ÉÉý8 ¼¶ --
					{
						{type=9,value=368},
			    		{type=11,value=771},
						{type=5,value=12480},
						{type=7,value=1261},

		    		},
								-- ·ÉÉý9 ¼¶ --
					{
						{type=9,value=428},
			    		{type=11,value=897},
						{type=5,value=14560},
						{type=7,value=1471},

		    		},
								-- ·ÉÉý10 ¼¶ --
					{
						{type=9,value=488},
			    		{type=11,value=1023},
						{type=5,value=16640},
						{type=7,value=1681},

		    		},
								-- ·ÉÉý11 ¼¶ --
					{
						{type=9,value=573},
			    		{type=11,value=1202},
						{type=5,value=20020},
						{type=7,value=2022},

		    		},
								-- ·ÉÉý12 ¼¶ --
					{
						{type=9,value=660},
			    		{type=11,value=1384},
						{type=5,value=23400},
						{type=7,value=2364},

		    		},
								-- ·ÉÉý13 ¼¶ --
					{
						{type=9,value=746},
			    		{type=11,value=1566},
						{type=5,value=26780},
						{type=7,value=2705},

		    		},
								-- ·ÉÉý14 ¼¶ --
					{
						{type=9,value=833},
			    		{type=11,value=1748},
						{type=5,value=30160},
						{type=7,value=3046},

		    		},
								-- ·ÉÉý15 ¼¶ --
					{
						{type=9,value=920},
			    		{type=11,value=1932},
						{type=5,value=33280},
						{type=7,value=3362},

		    		},
								-- ·ÉÉý16 ¼¶ --
					{
						{type=9,value=1060},
			    		{type=11,value=2225},
						{type=5,value=39260},
						{type=7,value=3966},

		    		},
								-- ·ÉÉý17 ¼¶ --
					{
						{type=9,value=1200},
			    		{type=11,value=2518},
						{type=5,value=45240},
						{type=7,value=4570},

		    		},
								-- ·ÉÉý18 ¼¶ --
					{
						{type=9,value=1339},
			    		{type=11,value=2811},
						{type=5,value=51220},
						{type=7,value=5174},

		    		},
								-- ·ÉÉý19 ¼¶ --
					{
						{type=9,value=1479},
			    		{type=11,value=3104},
						{type=5,value=57200},
						{type=7,value=5778},

		    		},
								-- ·ÉÉý20 ¼¶ --
					{
						{type=9,value=1619},
			    		{type=11,value=3399},
						{type=5,value=62400},
						{type=7,value=6303},

		    		},
								-- ·ÉÉý21 ¼¶ --
					{
						{type=9,value=1823},
			    		{type=11,value=3828},
						{type=5,value=72800},
						{type=7,value=7354},

		    		},
								-- ·ÉÉý22 ¼¶ --
					{
						{type=9,value=2028},
			    		{type=11,value=4257},
						{type=5,value=83200},
						{type=7,value=8404},

		    		},
								-- ·ÉÉý23 ¼¶ --
					{
						{type=9,value=2232},
			    		{type=11,value=4686},
						{type=5,value=93600},
						{type=7,value=9455},

		    		},
								-- ·ÉÉý24 ¼¶ --
					{
						{type=9,value=2436},
			    		{type=11,value=5115},
						{type=5,value=104000},
						{type=7,value=10505},

		    		},
								-- ·ÉÉý25 ¼¶ --
					{
						{type=9,value=2640},
			    		{type=11,value=5544},
						{type=5,value=114400},
						{type=7,value=11556},

		    		},
						--·ÉÉý26¼¶
					{	
						{type=9,value=2817},
						{type=11,value=5973},
						{type=5,value=124800},
						{type=7,value=12607},
					},	
						--·ÉÉý27¼¶
					{	
						{type=9,value=2994},
						{type=11,value=6402},
						{type=5,value=135200},
						{type=7,value=13658},
					},	
						--·ÉÉý28¼¶
					{	
						{type=9,value=3171},
						{type=11,value=6831},
						{type=5,value=145600},
						{type=7,value=14709},
					},	
						--·ÉÉý29¼¶
					{	
						{type=9,value=3348},
						{type=11,value=7260},
						{type=5,value=156000},
						{type=7,value=15760},
					},	
						--·ÉÉý30¼¶
					{	
						{type=9,value=3525},
						{type=11,value=7689},
						{type=5,value=166400},
						{type=7,value=16811},
					},	
						--·ÉÉý31¼¶
					{	
						{type=9,value=3702},
						{type=11,value=8118},
						{type=5,value=176800},
						{type=7,value=17862},
					},	
						--·ÉÉý32¼¶
					{	
						{type=9,value=3879},
						{type=11,value=8547},
						{type=5,value=187200},
						{type=7,value=18913},
					},	
						--·ÉÉý33¼¶
					{	
						{type=9,value=4056},
						{type=11,value=8976},
						{type=5,value=197600},
						{type=7,value=19964},
					},	
						--·ÉÉý34¼¶
					{	
						{type=9,value=4233},
						{type=11,value=9405},
						{type=5,value=208000},
						{type=7,value=21015},
					},	
						--·ÉÉý35¼¶
					{	
						{type=9,value=4410},
						{type=11,value=9834},
						{type=5,value=218400},
						{type=7,value=22066},
					},	
						--·ÉÉý36¼¶
					{	
						{type=9,value=4587},
						{type=11,value=10263},
						{type=5,value=228800},
						{type=7,value=23117},
					},	
						--·ÉÉý37¼¶
					{	
						{type=9,value=4764},
						{type=11,value=10692},
						{type=5,value=239200},
						{type=7,value=24168},
					},	
						--·ÉÉý38¼¶
					{	
						{type=9,value=4941},
						{type=11,value=11121},
						{type=5,value=249600},
						{type=7,value=25219},
					},	
						--·ÉÉý39¼¶
					{	
						{type=9,value=5118},
						{type=11,value=11550},
						{type=5,value=260000},
						{type=7,value=26270},
					},	
						--·ÉÉý40¼¶
					{	
						{type=9,value=5295},
						{type=11,value=11979},
						{type=5,value=270400},
						{type=7,value=27321},
					},	
						--·ÉÉý41¼¶
					{	
						{type=9,value=5472},
						{type=11,value=12408},
						{type=5,value=280800},
						{type=7,value=28372},
					},	
						--·ÉÉý42¼¶
					{	
						{type=9,value=5649},
						{type=11,value=12837},
						{type=5,value=291200},
						{type=7,value=29423},
					},	
						--·ÉÉý43¼¶
					{	
						{type=9,value=5826},
						{type=11,value=13266},
						{type=5,value=301600},
						{type=7,value=30474},
					},	
						--·ÉÉý44¼¶
					{	
						{type=9,value=6003},
						{type=11,value=13695},
						{type=5,value=312000},
						{type=7,value=31525},
					},	
						--·ÉÉý45¼¶
					{	
						{type=9,value=6180},
						{type=11,value=14124},
						{type=5,value=322400},
						{type=7,value=32576},
					},	
						--·ÉÉý46¼¶
					{	
						{type=9,value=6357},
						{type=11,value=14553},
						{type=5,value=332800},
						{type=7,value=33627},
					},	
						--·ÉÉý47¼¶
					{	
						{type=9,value=6534},
						{type=11,value=14982},
						{type=5,value=343200},
						{type=7,value=34678},
					},	
						--·ÉÉý48¼¶
					{	
						{type=9,value=6711},
						{type=11,value=15411},
						{type=5,value=353600},
						{type=7,value=35729},
					},	
						--·ÉÉý49¼¶
					{	
						{type=9,value=6888},
						{type=11,value=15840},
						{type=5,value=364000},
						{type=7,value=36780},
					},	
						--·ÉÉý50¼¶
					{	
						{type=9,value=7065},
						{type=11,value=16269},
						{type=5,value=374400},
						{type=7,value=37831},
					},			    		
		    	},	 
		    	
		    	-- ·¨
				{
													-- ·ÉÉý1 ¼¶ --
					{
						{type=13,value=38},
			    		{type=15,value=78},
						{type=5,value=335},
						{type=7,value=1340},

		    		},
								-- ·ÉÉý2 ¼¶ --
					{
						{type=13,value=75},
			    		{type=15,value=157},
						{type=5,value=669},
						{type=7,value=2676},

		    		},
								-- ·ÉÉý3 ¼¶ --
					{
						{type=13,value=112},
			    		{type=15,value=235},
						{type=5,value=1003},
						{type=7,value=4012},

		    		},
								-- ·ÉÉý4 ¼¶ --
					{
						{type=13,value=150},
			    		{type=15,value=314},
						{type=5,value=1337},
						{type=7,value=5348},

		    		},
								-- ·ÉÉý5 ¼¶ --
					{
						{type=13,value=188},
			    		{type=15,value=393},
						{type=5,value=1605},
						{type=7,value=6420},

		    		},
								-- ·ÉÉý6 ¼¶ --
					{
						{type=13,value=248},
			    		{type=15,value=519},
						{type=5,value=2139},
						{type=7,value=8556},

		    		},
								-- ·ÉÉý7 ¼¶ --
					{
						{type=13,value=308},
			    		{type=15,value=645},
						{type=5,value=2674},
						{type=7,value=10696},

		    		},
								-- ·ÉÉý8 ¼¶ --
					{
						{type=13,value=368},
			    		{type=15,value=771},
						{type=5,value=3209},
						{type=7,value=12836},

		    		},
								-- ·ÉÉý9 ¼¶ --
					{
						{type=13,value=428},
			    		{type=15,value=897},
						{type=5,value=3743},
						{type=7,value=14972},

		    		},
								-- ·ÉÉý10 ¼¶ --
					{
						{type=13,value=488},
			    		{type=15,value=1023},
						{type=5,value=4278},
						{type=7,value=17112},

		    		},
								-- ·ÉÉý11 ¼¶ --
					{
						{type=13,value=573},
			    		{type=15,value=1202},
						{type=5,value=5147},
						{type=7,value=20588},

		    		},
								-- ·ÉÉý12 ¼¶ --
					{
						{type=13,value=660},
			    		{type=15,value=1384},
						{type=5,value=6016},
						{type=7,value=24064},

		    		},
								-- ·ÉÉý13 ¼¶ --
					{
						{type=13,value=746},
			    		{type=15,value=1566},
						{type=5,value=6885},
						{type=7,value=27540},

		    		},
								-- ·ÉÉý14 ¼¶ --
					{
						{type=13,value=833},
			    		{type=15,value=1748},
						{type=5,value=7754},
						{type=7,value=31016},

		    		},
								-- ·ÉÉý15 ¼¶ --
					{
						{type=13,value=920},
			    		{type=15,value=1932},
						{type=5,value=8556},
						{type=7,value=34224},

		    		},
								-- ·ÉÉý16 ¼¶ --
					{
						{type=13,value=1060},
			    		{type=15,value=2225},
						{type=5,value=10093},
						{type=7,value=40372},

		    		},
								-- ·ÉÉý17 ¼¶ --
					{
						{type=13,value=1200},
			    		{type=15,value=2518},
						{type=5,value=11630},
						{type=7,value=46520},

		    		},
								-- ·ÉÉý18 ¼¶ --
					{
						{type=13,value=1339},
			    		{type=15,value=2811},
						{type=5,value=13168},
						{type=7,value=52672},

		    		},
								-- ·ÉÉý19 ¼¶ --
					{
						{type=13,value=1479},
			    		{type=15,value=3104},
						{type=5,value=14705},
						{type=7,value=58820},

		    		},
								-- ·ÉÉý20 ¼¶ --
					{
						{type=13,value=1619},
			    		{type=15,value=3399},
						{type=5,value=16042},
						{type=7,value=64168},

		    		},
								-- ·ÉÉý21 ¼¶ --
					{
						{type=13,value=1823},
			    		{type=15,value=3828},
						{type=5,value=18715},
						{type=7,value=74860},

		    		},
								-- ·ÉÉý22 ¼¶ --
					{
						{type=13,value=2028},
			    		{type=15,value=4257},
						{type=5,value=21389},
						{type=7,value=85556},

		    		},
								-- ·ÉÉý23 ¼¶ --
					{
						{type=13,value=2232},
			    		{type=15,value=4686},
						{type=5,value=24062},
						{type=7,value=96248},

		    		},
								-- ·ÉÉý24 ¼¶ --
					{
						{type=13,value=2436},
			    		{type=15,value=5115},
						{type=5,value=26736},
						{type=7,value=106944},

		    		},
								-- ·ÉÉý25 ¼¶ --
					{
						{type=13,value=2640},
			    		{type=15,value=5544},
						{type=5,value=29409},
						{type=7,value=117636},

		    		},
						--·ÉÉý26¼¶	
					{		
						{type=13,value=2817},	
						{type=15,value=5973},	
						{type=5,value=32082},	
						{type=7,value=128328},	
					},		
						--·ÉÉý27¼¶	
					{		
						{type=13,value=2994},	
						{type=15,value=6402},	
						{type=5,value=34755},	
						{type=7,value=139020},	
					},		
						--·ÉÉý28¼¶	
					{		
						{type=13,value=3171},	
						{type=15,value=6831},	
						{type=5,value=37428},	
						{type=7,value=149712},	
					},		
						--·ÉÉý29¼¶	
					{		
						{type=13,value=3348},	
						{type=15,value=7260},	
						{type=5,value=40101},	
						{type=7,value=160404},	
					},		
						--·ÉÉý30¼¶	
					{		
						{type=13,value=3525},	
						{type=15,value=7689},	
						{type=5,value=42774},	
						{type=7,value=171096},	
					},		
						--·ÉÉý31¼¶	
					{		
						{type=13,value=3702},	
						{type=15,value=8118},	
						{type=5,value=45447},	
						{type=7,value=181788},	
					},		
						--·ÉÉý32¼¶	
					{		
						{type=13,value=3879},	
						{type=15,value=8547},	
						{type=5,value=48120},	
						{type=7,value=192480},	
					},		
						--·ÉÉý33¼¶	
					{		
						{type=13,value=4056},	
						{type=15,value=8976},	
						{type=5,value=50793},	
						{type=7,value=203172},	
					},		
						--·ÉÉý34¼¶	
					{		
						{type=13,value=4233},	
						{type=15,value=9405},	
						{type=5,value=53466},	
						{type=7,value=213864},	
					},		
						--·ÉÉý35¼¶	
					{		
						{type=13,value=4410},	
						{type=15,value=9834},	
						{type=5,value=56139},	
						{type=7,value=224556},	
					},		
						--·ÉÉý36¼¶	
					{		
						{type=13,value=4587},	
						{type=15,value=10263},	
						{type=5,value=58812},	
						{type=7,value=235248},	
					},		
						--·ÉÉý37¼¶	
					{		
						{type=13,value=4764},	
						{type=15,value=10692},	
						{type=5,value=61485},	
						{type=7,value=245940},	
					},		
						--·ÉÉý38¼¶	
					{		
						{type=13,value=4941},	
						{type=15,value=11121},	
						{type=5,value=64158},	
						{type=7,value=256632},	
					},		
						--·ÉÉý39¼¶	
					{		
						{type=13,value=5118},	
						{type=15,value=11550},	
						{type=5,value=66831},	
						{type=7,value=267324},	
					},		
						--·ÉÉý40¼¶	
					{		
						{type=13,value=5295},	
						{type=15,value=11979},	
						{type=5,value=69504},	
						{type=7,value=278016},	
					},		
						--·ÉÉý41¼¶	
					{		
						{type=13,value=5472},	
						{type=15,value=12408},	
						{type=5,value=72177},	
						{type=7,value=288708},	
					},		
						--·ÉÉý42¼¶	
					{		
						{type=13,value=5649},	
						{type=15,value=12837},	
						{type=5,value=74850},	
						{type=7,value=299400},	
					},		
						--·ÉÉý43¼¶	
					{		
						{type=13,value=5826},	
						{type=15,value=13266},	
						{type=5,value=77523},	
						{type=7,value=310092},	
					},		
						--·ÉÉý44¼¶	
					{		
						{type=13,value=6003},	
						{type=15,value=13695},	
						{type=5,value=80196},	
						{type=7,value=320784},	
					},		
						--·ÉÉý45¼¶	
					{		
						{type=13,value=6180},	
						{type=15,value=14124},	
						{type=5,value=82869},	
						{type=7,value=331476},	
					},		
						--·ÉÉý46¼¶	
					{		
						{type=13,value=6357},	
						{type=15,value=14553},	
						{type=5,value=85542},	
						{type=7,value=342168},	
					},		
						--·ÉÉý47¼¶	
					{		
						{type=13,value=6534},	
						{type=15,value=14982},	
						{type=5,value=88215},	
						{type=7,value=352860},	
					},		
						--·ÉÉý48¼¶	
					{		
						{type=13,value=6711},	
						{type=15,value=15411},	
						{type=5,value=90888},	
						{type=7,value=363552},	
					},		
						--·ÉÉý49¼¶	
					{		
						{type=13,value=6888},	
						{type=15,value=15840},	
						{type=5,value=93561},	
						{type=7,value=374244},	
					},		
						--·ÉÉý50¼¶	
					{		
						{type=13,value=7065},	
						{type=15,value=16269},	
						{type=5,value=96234},	
						{type=7,value=384936},	
					},		
		    		
		    	},	 
		    	
		    	-- µÀ
				{
													-- ·ÉÉý1 ¼¶ --
					{
						{type=17,value=38},
			    		{type=19,value=78},
						{type=5,value=727},
						{type=7,value=727},

		    		},
								-- ·ÉÉý2 ¼¶ --
					{
						{type=17,value=75},
			    		{type=19,value=157},
						{type=5,value=1453},
						{type=7,value=1453},

		    		},
								-- ·ÉÉý3 ¼¶ --
					{
						{type=17,value=112},
			    		{type=19,value=235},
						{type=5,value=2179},
						{type=7,value=2179},

		    		},
								-- ·ÉÉý4 ¼¶ --
					{
						{type=17,value=150},
			    		{type=19,value=314},
						{type=5,value=2906},
						{type=7,value=2906},

		    		},
								-- ·ÉÉý5 ¼¶ --
					{
						{type=17,value=188},
			    		{type=19,value=393},
						{type=5,value=3487},
						{type=7,value=3487},

		    		},
								-- ·ÉÉý6 ¼¶ --
					{
						{type=17,value=248},
			    		{type=19,value=519},
						{type=5,value=4649},
						{type=7,value=4649},

		    		},
								-- ·ÉÉý7 ¼¶ --
					{
						{type=17,value=308},
			    		{type=19,value=645},
						{type=5,value=5811},
						{type=7,value=5811},

		    		},
								-- ·ÉÉý8 ¼¶ --
					{
						{type=17,value=368},
			    		{type=19,value=771},
						{type=5,value=6973},
						{type=7,value=6973},

		    		},
								-- ·ÉÉý9 ¼¶ --
					{
						{type=17,value=428},
			    		{type=19,value=897},
						{type=5,value=8135},
						{type=7,value=8135},

		    		},
								-- ·ÉÉý10 ¼¶ --
					{
						{type=17,value=488},
			    		{type=19,value=1023},
						{type=5,value=9297},
						{type=7,value=9297},

		    		},
								-- ·ÉÉý11 ¼¶ --
					{
						{type=17,value=573},
			    		{type=19,value=1202},
						{type=5,value=11185},
						{type=7,value=11185},

		    		},
								-- ·ÉÉý12 ¼¶ --
					{
						{type=17,value=660},
			    		{type=19,value=1384},
						{type=5,value=13073},
						{type=7,value=13073},

		    		},
								-- ·ÉÉý13 ¼¶ --
					{
						{type=17,value=746},
			    		{type=19,value=1566},
						{type=5,value=14961},
						{type=7,value=14961},

		    		},
								-- ·ÉÉý14 ¼¶ --
					{
						{type=17,value=833},
			    		{type=19,value=1748},
						{type=5,value=16850},
						{type=7,value=16850},

		    		},
								-- ·ÉÉý15 ¼¶ --
					{
						{type=17,value=920},
			    		{type=19,value=1932},
						{type=5,value=18593},
						{type=7,value=18593},

		    		},
								-- ·ÉÉý16 ¼¶ --
					{
						{type=17,value=1060},
			    		{type=19,value=2225},
						{type=5,value=21933},
						{type=7,value=21933},

		    		},
								-- ·ÉÉý17 ¼¶ --
					{
						{type=17,value=1200},
			    		{type=19,value=2518},
						{type=5,value=25274},
						{type=7,value=25274},

		    		},
								-- ·ÉÉý18 ¼¶ --
					{
						{type=17,value=1339},
			    		{type=19,value=2811},
						{type=5,value=28615},
						{type=7,value=28615},

		    		},
								-- ·ÉÉý19 ¼¶ --
					{
						{type=17,value=1479},
			    		{type=19,value=3104},
						{type=5,value=31956},
						{type=7,value=31956},

		    		},
								-- ·ÉÉý20 ¼¶ --
					{
						{type=17,value=1619},
			    		{type=19,value=3399},
						{type=5,value=34861},
						{type=7,value=34861},

		    		},
								-- ·ÉÉý21 ¼¶ --
					{
						{type=17,value=1823},
			    		{type=19,value=3828},
						{type=5,value=40671},
						{type=7,value=40671},

		    		},
								-- ·ÉÉý22 ¼¶ --
					{
						{type=17,value=2028},
			    		{type=19,value=4257},
						{type=5,value=46481},
						{type=7,value=46481},

		    		},
								-- ·ÉÉý23 ¼¶ --
					{
						{type=17,value=2232},
			    		{type=19,value=4686},
						{type=5,value=52291},
						{type=7,value=52291},

		    		},
								-- ·ÉÉý24 ¼¶ --
					{
						{type=17,value=2436},
			    		{type=19,value=5115},
						{type=5,value=58101},
						{type=7,value=58101},

		    		},
								-- ·ÉÉý25 ¼¶ --
					{
						{type=17,value=2640},
			    		{type=19,value=5544},
						{type=5,value=63911},
						{type=7,value=63911},

		    		},
						--·ÉÉý26¼¶		
					{			
						{type=17,value=2817},		
						{type=19,value=5973},		
						{type=5,value=69721},		
						{type=7,value=69721},		
					},			
						--·ÉÉý27¼¶		
					{			
						{type=17,value=2994},		
						{type=19,value=6402},		
						{type=5,value=75531},		
						{type=7,value=75531},		
					},			
						--·ÉÉý28¼¶		
					{			
						{type=17,value=3171},		
						{type=19,value=6831},		
						{type=5,value=81341},		
						{type=7,value=81341},		
					},			
						--·ÉÉý29¼¶		
					{			
						{type=17,value=3348},		
						{type=19,value=7260},		
						{type=5,value=87151},		
						{type=7,value=87151},		
					},			
						--·ÉÉý30¼¶		
					{			
						{type=17,value=3525},		
						{type=19,value=7689},		
						{type=5,value=92961},		
						{type=7,value=92961},		
					},			
						--·ÉÉý31¼¶		
					{			
						{type=17,value=3702},		
						{type=19,value=8118},		
						{type=5,value=98771},		
						{type=7,value=98771},		
					},			
						--·ÉÉý32¼¶		
					{			
						{type=17,value=3879},		
						{type=19,value=8547},		
						{type=5,value=104581},		
						{type=7,value=104581},		
					},			
						--·ÉÉý33¼¶		
					{			
						{type=17,value=4056},		
						{type=19,value=8976},		
						{type=5,value=110391},		
						{type=7,value=110391},		
					},			
						--·ÉÉý34¼¶		
					{			
						{type=17,value=4233},		
						{type=19,value=9405},		
						{type=5,value=116201},		
						{type=7,value=116201},		
					},			
						--·ÉÉý35¼¶		
					{			
						{type=17,value=4410},		
						{type=19,value=9834},		
						{type=5,value=122011},		
						{type=7,value=122011},		
					},			
						--·ÉÉý36¼¶		
					{			
						{type=17,value=4587},		
						{type=19,value=10263},		
						{type=5,value=127821},		
						{type=7,value=127821},		
					},			
						--·ÉÉý37¼¶		
					{			
						{type=17,value=4764},		
						{type=19,value=10692},		
						{type=5,value=133631},		
						{type=7,value=133631},		
					},			
						--·ÉÉý38¼¶		
					{			
						{type=17,value=4941},		
						{type=19,value=11121},		
						{type=5,value=139441},		
						{type=7,value=139441},		
					},			
						--·ÉÉý39¼¶		
					{			
						{type=17,value=5118},		
						{type=19,value=11550},		
						{type=5,value=145251},		
						{type=7,value=145251},		
					},			
						--·ÉÉý40¼¶		
					{			
						{type=17,value=5295},		
						{type=19,value=11979},		
						{type=5,value=151061},		
						{type=7,value=151061},		
					},			
						--·ÉÉý41¼¶		
					{			
						{type=17,value=5472},		
						{type=19,value=12408},		
						{type=5,value=156871},		
						{type=7,value=156871},		
					},			
						--·ÉÉý42¼¶		
					{			
						{type=17,value=5649},		
						{type=19,value=12837},		
						{type=5,value=162681},		
						{type=7,value=162681},		
					},			
						--·ÉÉý43¼¶		
					{			
						{type=17,value=5826},		
						{type=19,value=13266},		
						{type=5,value=168491},		
						{type=7,value=168491},		
					},			
						--·ÉÉý44¼¶		
					{			
						{type=17,value=6003},		
						{type=19,value=13695},		
						{type=5,value=174301},		
						{type=7,value=174301},		
					},			
						--·ÉÉý45¼¶		
					{			
						{type=17,value=6180},		
						{type=19,value=14124},		
						{type=5,value=180111},		
						{type=7,value=180111},		
					},			
						--·ÉÉý46¼¶		
					{			
						{type=17,value=6357},		
						{type=19,value=14553},		
						{type=5,value=185921},		
						{type=7,value=185921},		
					},			
						--·ÉÉý47¼¶		
					{			
						{type=17,value=6534},		
						{type=19,value=14982},		
						{type=5,value=191731},		
						{type=7,value=191731},		
					},			
						--·ÉÉý48¼¶		
					{			
						{type=17,value=6711},		
						{type=19,value=15411},		
						{type=5,value=197541},		
						{type=7,value=197541},		
					},			
						--·ÉÉý49¼¶		
					{			
						{type=17,value=6888},		
						{type=19,value=15840},		
						{type=5,value=203351},		
						{type=7,value=203351},		
					},			
						--·ÉÉý50¼¶		
					{			
						{type=17,value=7065},		
						{type=19,value=16269},		
						{type=5,value=209161},		
						{type=7,value=209161},		
					},					    	
		    		
		    	},	 
			}, 
		},

		--³á°ò10
		{
			itemId = 7158,
			
			-- ³á°òÀàÐÍ£º1 Îª»ÃÓð³á°ò, 2 Îª¾ø°æ³á°ò
			swingType = 1,
			
			-- Ã¿½×µÄ³á°òÍâ¹Û
			--swingShowIds = {41,42,43,44,45},
			swingShowIds = {76,77,78,79,80,80,80,80,80,80}, 
			-- ÄÚ¹ÛÌØÐ§
			iconIds = {31143,31144,31145,31146,31147,31147,31147,31147,31147,31147}, 
			--³á°òid
			swingIds = {7166,7167,7168,7169,7170,7913,7914,7915,7916,7917},
			-- Éý½×ÏûºÄ³á°òÊýÁ¿(µÚ1¸ö´ú±í1½×)
			classConsumeCounts = { 1,4,8,16,32,64,128,256,512,800},
			
			-- Éý¼¶ÏûºÄ³á°ò½á¾§ÊýÁ¿
			levelConsumeCounts = {2,4,6,8,10,12,14,16,18,20,23,27,31,35,40,45,50,56,62,68,74,81,88,96,103,110,117,124,131,138,145,152,159,166,173,180,187,194,201,208,215,222,229,236,243,250,257,264,271,278},
			
			-- ½×¼¶ÊôÐÔ
			classAttrs = {
				-- Õ½
					-- -- (a1) --
					-- {
					-- 	{type=(a2),value=(a3)},
			    	-- 	{type=(a4),value=(a5)},
					-- 	{type=(a6),value=(a7)},

		    		-- },

				{

									-- 1½× --
					{
						{type=9,value=125},
			    		{type=11,value=262},
						{type=29,value=12},

		    		},
					-- 2½× --
					{
						{type=9,value=325},
			    		{type=11,value=682},
						{type=29,value=32},

		    		},
					-- 3½× --
					{
						{type=9,value=614},
			    		{type=11,value=1288},
						{type=29,value=64},

		    		},
					-- 4½× --
					{
						{type=9,value=1080},
			    		{type=11,value=2266},
						{type=29,value=120},

		    		},
					-- 5½× --
					{
						{type=9,value=1760},
			    		{type=11,value=3696},
						{type=29,value=220},

		    		},

					-- 6½× --
					{
						{type=9,value=2440},
						{type=11,value=5126},
						{type=29,value=320},

		    		},

					-- 7½× --
					{
						{type=9,value=3120},
						{type=11,value=6556},
						{type=29,value=420},

		    		},

					-- 8½× --
					{
						{type=9,value=3800},
						{type=11,value=7986},
						{type=29,value=520},
		    		},

					-- 9½× --
					{
						{type=9,value=4480},
						{type=11,value=9416},
						{type=29,value=620},
		    		},

					-- 10½× --
					{
						{type=9,value=5160},
						{type=11,value=10846},
						{type=29,value=720},
		    		},
			},

		    	
		    	-- ·¨
				{
					
									-- 1½× --
					{
						{type=13,value=125},
			    		{type=15,value=262},
						{type=29,value=12},

		    		},
					-- 2½× --
					{
						{type=13,value=325},
			    		{type=15,value=682},
						{type=29,value=32},

		    		},
					-- 3½× --
					{
						{type=13,value=614},
			    		{type=15,value=1288},
						{type=29,value=64},

		    		},
					-- 4½× --
					{
						{type=13,value=1080},
			    		{type=15,value=2266},
						{type=29,value=120},

		    		},
					-- 5½× --
					{
						{type=13,value=1760},
			    		{type=15,value=3696},
						{type=29,value=220},

		    		},

					-- 6½× --
					{
						{type=13,value=2440},
						{type=15,value=5126},
						{type=29,value=320},

		    		},

					-- 7½× --
					{
						{type=13,value=3120},
						{type=15,value=6556},
						{type=29,value=420},

		    		},

					-- 8½× --
					{
						{type=13,value=3800},
						{type=15,value=7986},
						{type=29,value=520},
		    		},

					-- 9½× --
					{
						{type=13,value=4480},
						{type=15,value=9416},
						{type=29,value=620},
		    		},

					-- 10½× --
					{
						{type=13,value=5160},
						{type=15,value=10846},
						{type=29,value=720},
		    		},
		    		
		    	},	 
		    	
		    	-- µÀ
				{
		
										-- 1½× --
					{
						{type=17,value=125},
			    		{type=19,value=262},
						{type=29,value=12},

		    		},
					-- 2½× --
					{
						{type=17,value=325},
			    		{type=19,value=682},
						{type=29,value=32},

		    		},
					-- 3½× --
					{
						{type=17,value=614},
			    		{type=19,value=1288},
						{type=29,value=64},

		    		},
					-- 4½× --
					{
						{type=17,value=1080},
			    		{type=19,value=2266},
						{type=29,value=120},

		    		},
					-- 5½× --
					{
						{type=17,value=1760},
			    		{type=19,value=3696},
						{type=29,value=220},

		    		},
					-- 6½× --
					{
						{type=17,value=2440},
						{type=19,value=5126},
						{type=29,value=320},

		    		},

					-- 7½× --
					{
						{type=17,value=3120},
						{type=19,value=6556},
						{type=29,value=420},

		    		},

					-- 8½× --
					{
						{type=17,value=3800},
						{type=19,value=7986},
						{type=29,value=520},
		    		},

					-- 9½× --
					{
						{type=17,value=4480},
						{type=19,value=9416},
						{type=29,value=620},
		    		},

					-- 10½× --
					{
						{type=17,value=5160},
						{type=19,value=10846},
						{type=29,value=720},
		    		},

		    		
		    	},	    	
		    	
			},
			
			-- µÈ¼¶ÊôÐÔ
			levelAttrs = {
				-- Õ½

									-- -- 	--Ä£¿é
								-- (a1) ¼¶ --
					-- {
					-- 	{type=(a2),value=(a3)},
			    	-- 	{type=(a4),value=(a5)},
					-- 	{type=(a6),value=(a7)},

		    		-- },
				{
													-- ·ÉÉý1 ¼¶ --
					{
						{type=9,value=38},
			    		{type=11,value=78},
						{type=29,value=5},

		    		},
								-- ·ÉÉý2 ¼¶ --
					{
						{type=9,value=75},
			    		{type=11,value=157},
						{type=29,value=10},

		    		},
								-- ·ÉÉý3 ¼¶ --
					{
						{type=9,value=112},
			    		{type=11,value=235},
						{type=29,value=15},

		    		},
								-- ·ÉÉý4 ¼¶ --
					{
						{type=9,value=150},
			    		{type=11,value=314},
						{type=29,value=20},

		    		},
								-- ·ÉÉý5 ¼¶ --
					{
						{type=9,value=188},
			    		{type=11,value=393},
						{type=29,value=24},

		    		},
								-- ·ÉÉý6 ¼¶ --
					{
						{type=9,value=248},
			    		{type=11,value=519},
						{type=29,value=32},

		    		},
								-- ·ÉÉý7 ¼¶ --
					{
						{type=9,value=308},
			    		{type=11,value=645},
						{type=29,value=40},

		    		},
								-- ·ÉÉý8 ¼¶ --
					{
						{type=9,value=368},
			    		{type=11,value=771},
						{type=29,value=48},

		    		},
								-- ·ÉÉý9 ¼¶ --
					{
						{type=9,value=428},
			    		{type=11,value=897},
						{type=29,value=56},

		    		},
								-- ·ÉÉý10 ¼¶ --
					{
						{type=9,value=488},
			    		{type=11,value=1023},
						{type=29,value=64},

		    		},
								-- ·ÉÉý11 ¼¶ --
					{
						{type=9,value=573},
			    		{type=11,value=1202},
						{type=29,value=77},

		    		},
								-- ·ÉÉý12 ¼¶ --
					{
						{type=9,value=660},
			    		{type=11,value=1384},
						{type=29,value=90},

		    		},
								-- ·ÉÉý13 ¼¶ --
					{
						{type=9,value=746},
			    		{type=11,value=1566},
						{type=29,value=103},

		    		},
								-- ·ÉÉý14 ¼¶ --
					{
						{type=9,value=833},
			    		{type=11,value=1748},
						{type=29,value=116},

		    		},
								-- ·ÉÉý15 ¼¶ --
					{
						{type=9,value=920},
			    		{type=11,value=1932},
						{type=29,value=128},

		    		},
								-- ·ÉÉý16 ¼¶ --
					{
						{type=9,value=1060},
			    		{type=11,value=2225},
						{type=29,value=151},

		    		},
								-- ·ÉÉý17 ¼¶ --
					{
						{type=9,value=1200},
			    		{type=11,value=2518},
						{type=29,value=174},

		    		},
								-- ·ÉÉý18 ¼¶ --
					{
						{type=9,value=1339},
			    		{type=11,value=2811},
						{type=29,value=197},

		    		},
								-- ·ÉÉý19 ¼¶ --
					{
						{type=9,value=1479},
			    		{type=11,value=3104},
						{type=29,value=220},

		    		},
								-- ·ÉÉý20 ¼¶ --
					{
						{type=9,value=1619},
			    		{type=11,value=3399},
						{type=29,value=240},

		    		},
								-- ·ÉÉý21 ¼¶ --
					{
						{type=9,value=1823},
			    		{type=11,value=3828},
						{type=29,value=280},

		    		},
								-- ·ÉÉý22 ¼¶ --
					{
						{type=9,value=2028},
			    		{type=11,value=4257},
						{type=29,value=320},

		    		},
								-- ·ÉÉý23 ¼¶ --
					{
						{type=9,value=2232},
			    		{type=11,value=4686},
						{type=29,value=360},

		    		},
								-- ·ÉÉý24 ¼¶ --
					{
						{type=9,value=2436},
			    		{type=11,value=5115},
						{type=29,value=400},

		    		},
								-- ·ÉÉý25 ¼¶ --
					{
						{type=9,value=2640},
			    		{type=11,value=5544},
						{type=29,value=440},

		    		},
							--·ÉÉý26¼¶	
						{		
							{type=9,value=2844},	
							{type=11,value=5973},	
							{type=29,value=480},		
						},		
							--·ÉÉý27¼¶	
						{		
							{type=9,value=3048},	
							{type=11,value=6402},	
							{type=29,value=520},		
						},		
							--·ÉÉý28¼¶	
						{		
							{type=9,value=3252},	
							{type=11,value=6831},	
							{type=29,value=560},		
						},		
							--·ÉÉý29¼¶	
						{		
							{type=9,value=3456},	
							{type=11,value=7260},	
							{type=29,value=600},		
						},		
							--·ÉÉý30¼¶	
						{		
							{type=9,value=3660},	
							{type=11,value=7689},	
							{type=29,value=640},		
						},		
							--·ÉÉý31¼¶	
						{		
							{type=9,value=3864},	
							{type=11,value=8118},	
							{type=29,value=680},		
						},		
							--·ÉÉý32¼¶	
						{		
							{type=9,value=4068},	
							{type=11,value=8547},	
							{type=29,value=720},		
						},		
							--·ÉÉý33¼¶	
						{		
							{type=9,value=4272},	
							{type=11,value=8976},	
							{type=29,value=760},		
						},		
							--·ÉÉý34¼¶	
						{		
							{type=9,value=4476},	
							{type=11,value=9405},	
							{type=29,value=800},		
						},		
							--·ÉÉý35¼¶	
						{		
							{type=9,value=4680},	
							{type=11,value=9834},	
							{type=29,value=840},		
						},		
							--·ÉÉý36¼¶	
						{		
							{type=9,value=4884},	
							{type=11,value=10263},	
							{type=29,value=880},		
						},		
							--·ÉÉý37¼¶	
						{		
							{type=9,value=5088},	
							{type=11,value=10692},	
							{type=29,value=920},		
						},		
							--·ÉÉý38¼¶	
						{		
							{type=9,value=5292},	
							{type=11,value=11121},	
							{type=29,value=960},		
						},		
							--·ÉÉý39¼¶	
						{		
							{type=9,value=5496},	
							{type=11,value=11550},	
							{type=29,value=1000},		
						},		
							--·ÉÉý40¼¶	
						{		
							{type=9,value=5700},	
							{type=11,value=11979},	
							{type=29,value=1040},		
						},		
							--·ÉÉý41¼¶	
						{		
							{type=9,value=5904},	
							{type=11,value=12408},	
							{type=29,value=1080},		
						},		
							--·ÉÉý42¼¶	
						{		
							{type=9,value=6108},	
							{type=11,value=12837},	
							{type=29,value=1120},		
						},		
							--·ÉÉý43¼¶	
						{		
							{type=9,value=6312},	
							{type=11,value=13266},	
							{type=29,value=1160},		
						},		
							--·ÉÉý44¼¶	
						{		
							{type=9,value=6516},	
							{type=11,value=13695},	
							{type=29,value=1200},		
						},		
							--·ÉÉý45¼¶	
						{		
							{type=9,value=6720},	
							{type=11,value=14124},	
							{type=29,value=1240},		
						},		
							--·ÉÉý46¼¶	
						{		
							{type=9,value=6924},	
							{type=11,value=14553},	
							{type=29,value=1280},		
						},		
							--·ÉÉý47¼¶	
						{		
							{type=9,value=7128},	
							{type=11,value=14982},	
							{type=29,value=1320},		
						},		
							--·ÉÉý48¼¶	
						{		
							{type=9,value=7332},	
							{type=11,value=15411},	
							{type=29,value=1360},		
						},		
							--·ÉÉý49¼¶	
						{		
							{type=9,value=7536},	
							{type=11,value=15840},	
							{type=29,value=1400},		
						},		
							--·ÉÉý50¼¶	
						{		
							{type=9,value=7740},	
							{type=11,value=16269},	
							{type=29,value=1440},		
						},		    		
		    	},	 
		    	
		    	-- ·¨
				{
												-- ·ÉÉý1 ¼¶ --
					{
						{type=13,value=38},
			    		{type=15,value=78},
						{type=29,value=5},

		    		},
								-- ·ÉÉý2 ¼¶ --
					{
						{type=13,value=75},
			    		{type=15,value=157},
						{type=29,value=10},

		    		},
								-- ·ÉÉý3 ¼¶ --
					{
						{type=13,value=112},
			    		{type=15,value=235},
						{type=29,value=15},

		    		},
								-- ·ÉÉý4 ¼¶ --
					{
						{type=13,value=150},
			    		{type=15,value=314},
						{type=29,value=20},

		    		},
								-- ·ÉÉý5 ¼¶ --
					{
						{type=13,value=188},
			    		{type=15,value=393},
						{type=29,value=24},

		    		},
								-- ·ÉÉý6 ¼¶ --
					{
						{type=13,value=248},
			    		{type=15,value=519},
						{type=29,value=32},

		    		},
								-- ·ÉÉý7 ¼¶ --
					{
						{type=13,value=308},
			    		{type=15,value=645},
						{type=29,value=40},

		    		},
								-- ·ÉÉý8 ¼¶ --
					{
						{type=13,value=368},
			    		{type=15,value=771},
						{type=29,value=48},

		    		},
								-- ·ÉÉý9 ¼¶ --
					{
						{type=13,value=428},
			    		{type=15,value=897},
						{type=29,value=56},

		    		},
								-- ·ÉÉý10 ¼¶ --
					{
						{type=13,value=488},
			    		{type=15,value=1023},
						{type=29,value=64},

		    		},
								-- ·ÉÉý11 ¼¶ --
					{
						{type=13,value=573},
			    		{type=15,value=1202},
						{type=29,value=77},

		    		},
								-- ·ÉÉý12 ¼¶ --
					{
						{type=13,value=660},
			    		{type=15,value=1384},
						{type=29,value=90},

		    		},
								-- ·ÉÉý13 ¼¶ --
					{
						{type=13,value=746},
			    		{type=15,value=1566},
						{type=29,value=103},

		    		},
								-- ·ÉÉý14 ¼¶ --
					{
						{type=13,value=833},
			    		{type=15,value=1748},
						{type=29,value=116},

		    		},
								-- ·ÉÉý15 ¼¶ --
					{
						{type=13,value=920},
			    		{type=15,value=1932},
						{type=29,value=128},

		    		},
								-- ·ÉÉý16 ¼¶ --
					{
						{type=13,value=1060},
			    		{type=15,value=2225},
						{type=29,value=151},

		    		},
								-- ·ÉÉý17 ¼¶ --
					{
						{type=13,value=1200},
			    		{type=15,value=2518},
						{type=29,value=174},

		    		},
								-- ·ÉÉý18 ¼¶ --
					{
						{type=13,value=1339},
			    		{type=15,value=2811},
						{type=29,value=197},

		    		},
								-- ·ÉÉý19 ¼¶ --
					{
						{type=13,value=1479},
			    		{type=15,value=3104},
						{type=29,value=220},

		    		},
								-- ·ÉÉý20 ¼¶ --
					{
						{type=13,value=1619},
			    		{type=15,value=3399},
						{type=29,value=240},

		    		},
								-- ·ÉÉý21 ¼¶ --
					{
						{type=13,value=1823},
			    		{type=15,value=3828},
						{type=29,value=280},

		    		},
								-- ·ÉÉý22 ¼¶ --
					{
						{type=13,value=2028},
			    		{type=15,value=4257},
						{type=29,value=320},

		    		},
								-- ·ÉÉý23 ¼¶ --
					{
						{type=13,value=2232},
			    		{type=15,value=4686},
						{type=29,value=360},

		    		},
								-- ·ÉÉý24 ¼¶ --
					{
						{type=13,value=2436},
			    		{type=15,value=5115},
						{type=29,value=400},

		    		},
								-- ·ÉÉý25 ¼¶ --
					{
						{type=13,value=2640},
			    		{type=15,value=5544},
						{type=29,value=440},

		    		},
	                            --·ÉÉý26¼¶	
						{		
							{type=13,value=2844},	
							{type=15,value=5973},	
							{type=29,value=480},		
						},		
							--·ÉÉý27¼¶	
						{		
							{type=13,value=3048},	
							{type=15,value=6402},	
							{type=29,value=520},		
						},		
							--·ÉÉý28¼¶	
						{		
							{type=13,value=3252},	
							{type=15,value=6831},	
							{type=29,value=560},		
						},		
							--·ÉÉý29¼¶	
						{		
							{type=13,value=3456},	
							{type=15,value=7260},	
							{type=29,value=600},		
						},		
							--·ÉÉý30¼¶	
						{		
							{type=13,value=3660},	
							{type=15,value=7689},	
							{type=29,value=640},		
						},		
							--·ÉÉý31¼¶	
						{		
							{type=13,value=3864},	
							{type=15,value=8118},	
							{type=29,value=680},		
						},		
							--·ÉÉý32¼¶	
						{		
							{type=13,value=4068},	
							{type=15,value=8547},	
							{type=29,value=720},		
						},		
							--·ÉÉý33¼¶	
						{		
							{type=13,value=4272},	
							{type=15,value=8976},	
							{type=29,value=760},		
						},		
							--·ÉÉý34¼¶	
						{		
							{type=13,value=4476},	
							{type=15,value=9405},	
							{type=29,value=800},		
						},		
							--·ÉÉý35¼¶	
						{		
							{type=13,value=4680},	
							{type=15,value=9834},	
							{type=29,value=840},		
						},		
							--·ÉÉý36¼¶	
						{		
							{type=13,value=4884},	
							{type=15,value=10263},	
							{type=29,value=880},		
						},		
							--·ÉÉý37¼¶	
						{		
							{type=13,value=5088},	
							{type=15,value=10692},	
							{type=29,value=920},		
						},		
							--·ÉÉý38¼¶	
						{		
							{type=13,value=5292},	
							{type=15,value=11121},	
							{type=29,value=960},		
						},		
							--·ÉÉý39¼¶	
						{		
							{type=13,value=5496},	
							{type=15,value=11550},	
							{type=29,value=1000},		
						},		
							--·ÉÉý40¼¶	
						{		
							{type=13,value=5700},	
							{type=15,value=11979},	
							{type=29,value=1040},		
						},		
							--·ÉÉý41¼¶	
						{		
							{type=13,value=5904},	
							{type=15,value=12408},	
							{type=29,value=1080},		
						},		
							--·ÉÉý42¼¶	
						{		
							{type=13,value=6108},	
							{type=15,value=12837},	
							{type=29,value=1120},		
						},		
							--·ÉÉý43¼¶	
						{		
							{type=13,value=6312},	
							{type=15,value=13266},	
							{type=29,value=1160},		
						},		
							--·ÉÉý44¼¶	
						{		
							{type=13,value=6516},	
							{type=15,value=13695},	
							{type=29,value=1200},		
						},		
							--·ÉÉý45¼¶	
						{		
							{type=13,value=6720},	
							{type=15,value=14124},	
							{type=29,value=1240},		
						},		
							--·ÉÉý46¼¶	
						{		
							{type=13,value=6924},	
							{type=15,value=14553},	
							{type=29,value=1280},		
						},		
							--·ÉÉý47¼¶	
						{		
							{type=13,value=7128},	
							{type=15,value=14982},	
							{type=29,value=1320},		
						},		
							--·ÉÉý48¼¶	
						{		
							{type=13,value=7332},	
							{type=15,value=15411},	
							{type=29,value=1360},		
						},		
							--·ÉÉý49¼¶	
						{		
							{type=13,value=7536},	
							{type=15,value=15840},	
							{type=29,value=1400},		
						},		
							--·ÉÉý50¼¶	
						{		
							{type=13,value=7740},	
							{type=15,value=16269},	
							{type=29,value=1440},		
						},		
		    		
		    	},	 
		    	
		    	-- µÀ
				{
													-- ·ÉÉý1 ¼¶ --
					{
						{type=17,value=38},
			    		{type=19,value=78},
						{type=29,value=5},

		    		},
								-- ·ÉÉý2 ¼¶ --
					{
						{type=17,value=75},
			    		{type=19,value=157},
						{type=29,value=10},

		    		},
								-- ·ÉÉý3 ¼¶ --
					{
						{type=17,value=112},
			    		{type=19,value=235},
						{type=29,value=15},

		    		},
								-- ·ÉÉý4 ¼¶ --
					{
						{type=17,value=150},
			    		{type=19,value=314},
						{type=29,value=20},

		    		},
								-- ·ÉÉý5 ¼¶ --
					{
						{type=17,value=188},
			    		{type=19,value=393},
						{type=29,value=24},

		    		},
								-- ·ÉÉý6 ¼¶ --
					{
						{type=17,value=248},
			    		{type=19,value=519},
						{type=29,value=32},

		    		},
								-- ·ÉÉý7 ¼¶ --
					{
						{type=17,value=308},
			    		{type=19,value=645},
						{type=29,value=40},

		    		},
								-- ·ÉÉý8 ¼¶ --
					{
						{type=17,value=368},
			    		{type=19,value=771},
						{type=29,value=48},

		    		},
								-- ·ÉÉý9 ¼¶ --
					{
						{type=17,value=428},
			    		{type=19,value=897},
						{type=29,value=56},

		    		},
								-- ·ÉÉý10 ¼¶ --
					{
						{type=17,value=488},
			    		{type=19,value=1023},
						{type=29,value=64},

		    		},
								-- ·ÉÉý11 ¼¶ --
					{
						{type=17,value=573},
			    		{type=19,value=1202},
						{type=29,value=77},

		    		},
								-- ·ÉÉý12 ¼¶ --
					{
						{type=17,value=660},
			    		{type=19,value=1384},
						{type=29,value=90},

		    		},
								-- ·ÉÉý13 ¼¶ --
					{
						{type=17,value=746},
			    		{type=19,value=1566},
						{type=29,value=103},

		    		},
								-- ·ÉÉý14 ¼¶ --
					{
						{type=17,value=833},
			    		{type=19,value=1748},
						{type=29,value=116},

		    		},
								-- ·ÉÉý15 ¼¶ --
					{
						{type=17,value=920},
			    		{type=19,value=1932},
						{type=29,value=128},

		    		},
								-- ·ÉÉý16 ¼¶ --
					{
						{type=17,value=1060},
			    		{type=19,value=2225},
						{type=29,value=151},

		    		},
								-- ·ÉÉý17 ¼¶ --
					{
						{type=17,value=1200},
			    		{type=19,value=2518},
						{type=29,value=174},

		    		},
								-- ·ÉÉý18 ¼¶ --
					{
						{type=17,value=1339},
			    		{type=19,value=2811},
						{type=29,value=197},

		    		},
								-- ·ÉÉý19 ¼¶ --
					{
						{type=17,value=1479},
			    		{type=19,value=3104},
						{type=29,value=220},

		    		},
								-- ·ÉÉý20 ¼¶ --
					{
						{type=17,value=1619},
			    		{type=19,value=3399},
						{type=29,value=240},

		    		},
								-- ·ÉÉý21 ¼¶ --
					{
						{type=17,value=1823},
			    		{type=19,value=3828},
						{type=29,value=280},

		    		},
								-- ·ÉÉý22 ¼¶ --
					{
						{type=17,value=2028},
			    		{type=19,value=4257},
						{type=29,value=320},

		    		},
								-- ·ÉÉý23 ¼¶ --
					{
						{type=17,value=2232},
			    		{type=19,value=4686},
						{type=29,value=360},

		    		},
								-- ·ÉÉý24 ¼¶ --
					{
						{type=17,value=2436},
			    		{type=19,value=5115},
						{type=29,value=400},

		    		},
								-- ·ÉÉý25 ¼¶ --
					{
						{type=17,value=2640},
			    		{type=19,value=5544},
						{type=29,value=440},

		    		},

	                                                                                                       --·ÉÉý26¼¶	
						{		
							{type=17,value=2844},	
							{type=19,value=5973},	
							{type=29,value=480},		
						},		
							--·ÉÉý27¼¶	
						{		
							{type=17,value=3048},	
							{type=19,value=6402},	
							{type=29,value=520},		
						},		
							--·ÉÉý28¼¶	
						{		
							{type=17,value=3252},	
							{type=19,value=6831},	
							{type=29,value=560},		
						},		
							--·ÉÉý29¼¶	
						{		
							{type=17,value=3456},	
							{type=19,value=7260},	
							{type=29,value=600},		
						},		
							--·ÉÉý30¼¶	
						{		
							{type=17,value=3660},	
							{type=19,value=7689},	
							{type=29,value=640},		
						},		
							--·ÉÉý31¼¶	
						{		
							{type=17,value=3864},	
							{type=19,value=8118},	
							{type=29,value=680},		
						},		
							--·ÉÉý32¼¶	
						{		
							{type=17,value=4068},	
							{type=19,value=8547},	
							{type=29,value=720},		
						},		
							--·ÉÉý33¼¶	
						{		
							{type=17,value=4272},	
							{type=19,value=8976},	
							{type=29,value=760},		
						},		
							--·ÉÉý34¼¶	
						{		
							{type=17,value=4476},	
							{type=19,value=9405},	
							{type=29,value=800},		
						},		
							--·ÉÉý35¼¶	
						{		
							{type=17,value=4680},	
							{type=19,value=9834},	
							{type=29,value=840},		
						},		
							--·ÉÉý36¼¶	
						{		
							{type=17,value=4884},	
							{type=19,value=10263},	
							{type=29,value=880},		
						},		
							--·ÉÉý37¼¶	
						{		
							{type=17,value=5088},	
							{type=19,value=10692},	
							{type=29,value=920},		
						},		
							--·ÉÉý38¼¶	
						{		
							{type=17,value=5292},	
							{type=19,value=11121},	
							{type=29,value=960},		
						},		
							--·ÉÉý39¼¶	
						{		
							{type=17,value=5496},	
							{type=19,value=11550},	
							{type=29,value=1000},		
						},		
							--·ÉÉý40¼¶	
						{		
							{type=17,value=5700},	
							{type=19,value=11979},	
							{type=29,value=1040},		
						},		
							--·ÉÉý41¼¶	
						{		
							{type=17,value=5904},	
							{type=19,value=12408},	
							{type=29,value=1080},		
						},		
							--·ÉÉý42¼¶	
						{		
							{type=17,value=6108},	
							{type=19,value=12837},	
							{type=29,value=1120},		
						},		
							--·ÉÉý43¼¶	
						{		
							{type=17,value=6312},	
							{type=19,value=13266},	
							{type=29,value=1160},		
						},		
							--·ÉÉý44¼¶	
						{		
							{type=17,value=6516},	
							{type=19,value=13695},	
							{type=29,value=1200},		
						},		
							--·ÉÉý45¼¶	
						{		
							{type=17,value=6720},	
							{type=19,value=14124},	
							{type=29,value=1240},		
						},		
							--·ÉÉý46¼¶	
						{		
							{type=17,value=6924},	
							{type=19,value=14553},	
							{type=29,value=1280},		
						},		
							--·ÉÉý47¼¶	
						{		
							{type=17,value=7128},	
							{type=19,value=14982},	
							{type=29,value=1320},		
						},		
							--·ÉÉý48¼¶	
						{		
							{type=17,value=7332},	
							{type=19,value=15411},	
							{type=29,value=1360},		
						},		
							--·ÉÉý49¼¶	
						{		
							{type=17,value=7536},	
							{type=19,value=15840},	
							{type=29,value=1400},		
						},		
							--·ÉÉý50¼¶	
						{		
							{type=17,value=7740},	
							{type=19,value=16269},	
							{type=29,value=1440},		
						},				    		
		    		
		    	},	 
			}, 
		},

		--³á°ò11
		{
			itemId = 7159,
			
			-- ³á°òÀàÐÍ£º1 Îª»ÃÓð³á°ò, 2 Îª¾ø°æ³á°ò
			swingType = 1,
			
			-- Ã¿½×µÄ³á°òÍâ¹Û
			--swingShowIds = {41,42,43,44,45},
			swingShowIds = {81,82,83,84,85,85,85,85,85,85}, 
			-- ÄÚ¹ÛÌØÐ§
			iconIds = {31148,31149,31150,31151,31152,31152,31152,31152,31152,31152}, 
			--³á°òid
			swingIds = {7171,7172,7173,7174,7175,7918,7919,7920,7921,7922},
			-- Éý½×ÏûºÄ³á°òÊýÁ¿(µÚ1¸ö´ú±í1½×)
			classConsumeCounts = { 1,4,8,16,32,64,128,256,512,800},
			
			-- Éý¼¶ÏûºÄ³á°ò½á¾§ÊýÁ¿
			levelConsumeCounts = {2,4,6,8,10,12,14,16,18,20,23,27,31,35,40,45,50,56,62,68,74,81,88,96,103,110,117,124,131,138,145,152,159,166,173,180,187,194,201,208,215,222,229,236,243,250,257,264,271,278},
			
			-- ½×¼¶ÊôÐÔ
			classAttrs = {

					-- -- (a1) --
					-- {
					-- 	{type=(a2),value=(a3)},
			    	-- 	{type=(a4),value=(a5)},
					-- 	{type=(a6),value=(a7)},

		    		-- },

				-- Õ½
				{
										-- 1½× --
					{
						{type=9,value=125},
			    		{type=11,value=262},
						{type=31,value=12},

		    		},
					-- 2½× --
					{
						{type=9,value=325},
			    		{type=11,value=682},
						{type=31,value=32},

		    		},
					-- 3½× --
					{
						{type=9,value=614},
			    		{type=11,value=1288},
						{type=31,value=64},

		    		},
					-- 4½× --
					{
						{type=9,value=1080},
			    		{type=11,value=2266},
						{type=31,value=120},

		    		},
					-- 5½× --
					{
						{type=9,value=1760},
			    		{type=11,value=3696},
						{type=31,value=220},

		    		},

					-- 6½× --
					{
						{type=9,value=2440},
						{type=11,value=5126},
						{type=31,value=320},

		    		},

					-- 7½× --
					{
						{type=9,value=3120},
						{type=11,value=6556},
						{type=31,value=420},

		    		},

					-- 8½× --
					{
						{type=9,value=3800},
						{type=11,value=7986},
						{type=31,value=520},
		    		},

					-- 9½× --
					{
						{type=9,value=4480},
						{type=11,value=9416},
						{type=31,value=620},
		    		},

					-- 10½× --
					{
						{type=9,value=5160},
						{type=11,value=10846},
						{type=31,value=720},
		    		},
		    		
		    	},	 
		    	
		    	-- ·¨
				{
										-- 1½× --
					{
						{type=13,value=125},
			    		{type=15,value=262},
						{type=31,value=12},

		    		},
					-- 2½× --
					{
						{type=13,value=325},
			    		{type=15,value=682},
						{type=31,value=32},

		    		},
					-- 3½× --
					{
						{type=13,value=614},
			    		{type=15,value=1288},
						{type=31,value=64},

		    		},
					-- 4½× --
					{
						{type=13,value=1080},
			    		{type=15,value=2266},
						{type=31,value=120},

		    		},
					-- 5½× --
					{
						{type=13,value=1760},
			    		{type=15,value=3696},
						{type=31,value=220},

		    		},

					-- 6½× --
					{
						{type=13,value=2440},
						{type=15,value=5126},
						{type=31,value=320},

		    		},

					-- 7½× --
					{
						{type=13,value=3120},
						{type=15,value=6556},
						{type=31,value=420},

		    		},

					-- 8½× --
					{
						{type=13,value=3800},
						{type=15,value=7986},
						{type=31,value=520},
		    		},

					-- 9½× --
					{
						{type=13,value=4480},
						{type=15,value=9416},
						{type=31,value=620},
		    		},

					-- 10½× --
					{
						{type=13,value=5160},
						{type=15,value=10846},
						{type=31,value=720},
		    		},

		    		
		    	},	 
		    	
		    	-- µÀ
				{
										-- 1½× --
					{
						{type=17,value=125},
			    		{type=19,value=262},
						{type=31,value=12},

		    		},
					-- 2½× --
					{
						{type=17,value=325},
			    		{type=19,value=682},
						{type=31,value=32},

		    		},
					-- 3½× --
					{
						{type=17,value=614},
			    		{type=19,value=1288},
						{type=31,value=64},

		    		},
					-- 4½× --
					{
						{type=17,value=1080},
			    		{type=19,value=2266},
						{type=31,value=120},

		    		},
					-- 5½× --
					{
						{type=17,value=1760},
			    		{type=19,value=3696},
						{type=31,value=220},

		    		},

					-- 6½× --
					{
						{type=17,value=2440},
						{type=19,value=5126},
						{type=31,value=320},

		    		},

					-- 7½× --
					{
						{type=17,value=3120},
						{type=19,value=6556},
						{type=31,value=420},

		    		},

					-- 8½× --
					{
						{type=17,value=3800},
						{type=19,value=7986},
						{type=31,value=520},
		    		},

					-- 9½× --
					{
						{type=17,value=4480},
						{type=19,value=9416},
						{type=31,value=620},
		    		},

					-- 10½× --
					{
						{type=17,value=5160},
						{type=19,value=10846},
						{type=31,value=720},
		    		},		    				    		
		    	},	    	
		    	
			},
			
			-- µÈ¼¶ÊôÐÔ
			levelAttrs = {
				-- Õ½

					-- -- (a1) ¼¶ --
					-- {
					-- 	{type=(a2),value=(a3)},
			    	-- 	{type=(a4),value=(a5)},
					-- 	{type=(a6),value=(a7)},
					-- 	{type=(a8),value=(a9)},
					-- 	{type=(a10),value=(a11)},
					-- 	{type=(a12),value=(a13)},

		    		-- },

				{
									-- ·ÉÉý1 --
					{
						{type=9,value=38},
			    		{type=11,value=78},
						{type=31,value=5},

		    		},
					-- ·ÉÉý2 --
					{
						{type=9,value=75},
			    		{type=11,value=157},
						{type=31,value=10},

		    		},
					-- ·ÉÉý3 --
					{
						{type=9,value=112},
			    		{type=11,value=235},
						{type=31,value=15},

		    		},
					-- ·ÉÉý4 --
					{
						{type=9,value=150},
			    		{type=11,value=314},
						{type=31,value=20},

		    		},
					-- ·ÉÉý5 --
					{
						{type=9,value=188},
			    		{type=11,value=393},
						{type=31,value=24},

		    		},
					-- ·ÉÉý6 --
					{
						{type=9,value=248},
			    		{type=11,value=519},
						{type=31,value=32},

		    		},
					-- ·ÉÉý7 --
					{
						{type=9,value=308},
			    		{type=11,value=645},
						{type=31,value=40},

		    		},
					-- ·ÉÉý8 --
					{
						{type=9,value=368},
			    		{type=11,value=771},
						{type=31,value=48},

		    		},
					-- ·ÉÉý9 --
					{
						{type=9,value=428},
			    		{type=11,value=897},
						{type=31,value=56},

		    		},
					-- ·ÉÉý10 --
					{
						{type=9,value=488},
			    		{type=11,value=1023},
						{type=31,value=64},

		    		},
					-- ·ÉÉý11 --
					{
						{type=9,value=573},
			    		{type=11,value=1202},
						{type=31,value=77},

		    		},
					-- ·ÉÉý12 --
					{
						{type=9,value=660},
			    		{type=11,value=1384},
						{type=31,value=90},

		    		},
					-- ·ÉÉý13 --
					{
						{type=9,value=746},
			    		{type=11,value=1566},
						{type=31,value=103},

		    		},
					-- ·ÉÉý14 --
					{
						{type=9,value=833},
			    		{type=11,value=1748},
						{type=31,value=116},

		    		},
					-- ·ÉÉý15 --
					{
						{type=9,value=920},
			    		{type=11,value=1932},
						{type=31,value=128},

		    		},
					-- ·ÉÉý16 --
					{
						{type=9,value=1060},
			    		{type=11,value=2225},
						{type=31,value=151},

		    		},
					-- ·ÉÉý17 --
					{
						{type=9,value=1200},
			    		{type=11,value=2518},
						{type=31,value=174},

		    		},
					-- ·ÉÉý18 --
					{
						{type=9,value=1339},
			    		{type=11,value=2811},
						{type=31,value=197},

		    		},
					-- ·ÉÉý19 --
					{
						{type=9,value=1479},
			    		{type=11,value=3104},
						{type=31,value=220},

		    		},
					-- ·ÉÉý20 --
					{
						{type=9,value=1619},
			    		{type=11,value=3399},
						{type=31,value=240},

		    		},
					-- ·ÉÉý21 --
					{
						{type=9,value=1823},
			    		{type=11,value=3828},
						{type=31,value=280},

		    		},
					-- ·ÉÉý22 --
					{
						{type=9,value=2028},
			    		{type=11,value=4257},
						{type=31,value=320},

		    		},
					-- ·ÉÉý23 --
					{
						{type=9,value=2232},
			    		{type=11,value=4686},
						{type=31,value=360},

		    		},
					-- ·ÉÉý24 --
					{
						{type=9,value=2436},
			    		{type=11,value=5115},
						{type=31,value=400},

		    		},
					-- ·ÉÉý25 --
					{
						{type=9,value=2640},
			    		{type=11,value=5544},
						{type=31,value=440},

		    		},

						--·ÉÉý26¼¶	
					{		
						{type=9,value=2844},	
						{type=11,value=5973},	
						{type=31,value=480},		
					},		
						--·ÉÉý27¼¶	
					{		
						{type=9,value=3048},	
						{type=11,value=6402},	
						{type=31,value=520},		
					},		
						--·ÉÉý28¼¶	
					{		
						{type=9,value=3252},	
						{type=11,value=6831},	
						{type=31,value=560},		
					},		
						--·ÉÉý29¼¶	
					{		
						{type=9,value=3456},	
						{type=11,value=7260},	
						{type=31,value=600},		
					},		
						--·ÉÉý30¼¶	
					{		
						{type=9,value=3660},	
						{type=11,value=7689},	
						{type=31,value=640},		
					},		
						--·ÉÉý31¼¶	
					{		
						{type=9,value=3864},	
						{type=11,value=8118},	
						{type=31,value=680},		
					},		
						--·ÉÉý32¼¶	
					{		
						{type=9,value=4068},	
						{type=11,value=8547},	
						{type=31,value=720},		
					},		
						--·ÉÉý33¼¶	
					{		
						{type=9,value=4272},	
						{type=11,value=8976},	
						{type=31,value=760},		
					},		
						--·ÉÉý34¼¶	
					{		
						{type=9,value=4476},	
						{type=11,value=9405},	
						{type=31,value=800},		
					},		
						--·ÉÉý35¼¶	
					{		
						{type=9,value=4680},	
						{type=11,value=9834},	
						{type=31,value=840},		
					},		
						--·ÉÉý36¼¶	
					{		
						{type=9,value=4884},	
						{type=11,value=10263},	
						{type=31,value=880},		
					},		
						--·ÉÉý37¼¶	
					{		
						{type=9,value=5088},	
						{type=11,value=10692},	
						{type=31,value=920},		
					},		
						--·ÉÉý38¼¶	
					{		
						{type=9,value=5292},	
						{type=11,value=11121},	
						{type=31,value=960},		
					},		
						--·ÉÉý39¼¶	
					{		
						{type=9,value=5496},	
						{type=11,value=11550},	
						{type=31,value=1000},		
					},		
						--·ÉÉý40¼¶	
					{		
						{type=9,value=5700},	
						{type=11,value=11979},	
						{type=31,value=1040},		
					},		
						--·ÉÉý41¼¶	
					{		
						{type=9,value=5904},	
						{type=11,value=12408},	
						{type=31,value=1080},		
					},		
						--·ÉÉý42¼¶	
					{		
						{type=9,value=6108},	
						{type=11,value=12837},	
						{type=31,value=1120},		
					},		
						--·ÉÉý43¼¶	
					{		
						{type=9,value=6312},	
						{type=11,value=13266},	
						{type=31,value=1160},		
					},		
						--·ÉÉý44¼¶	
					{		
						{type=9,value=6516},	
						{type=11,value=13695},	
						{type=31,value=1200},		
					},		
						--·ÉÉý45¼¶	
					{		
						{type=9,value=6720},	
						{type=11,value=14124},	
						{type=31,value=1240},		
					},		
						--·ÉÉý46¼¶	
					{		
						{type=9,value=6924},	
						{type=11,value=14553},	
						{type=31,value=1280},		
					},		
						--·ÉÉý47¼¶	
					{		
						{type=9,value=7128},	
						{type=11,value=14982},	
						{type=31,value=1320},		
					},		
						--·ÉÉý48¼¶	
					{		
						{type=9,value=7332},	
						{type=11,value=15411},	
						{type=31,value=1360},		
					},		
						--·ÉÉý49¼¶	
					{		
						{type=9,value=7536},	
						{type=11,value=15840},	
						{type=31,value=1400},		
					},		
						--·ÉÉý50¼¶	
					{		
						{type=9,value=7740},	
						{type=11,value=16269},	
						{type=31,value=1440},		
					},
		    		
		    	},	 
		    	
		    	-- ·¨
				{
									-- ·ÉÉý1 --
					{
						{type=13,value=38},
			    		{type=15,value=78},
						{type=31,value=5},

		    		},
					-- ·ÉÉý2 --
					{
						{type=13,value=75},
			    		{type=15,value=157},
						{type=31,value=10},

		    		},
					-- ·ÉÉý3 --
					{
						{type=13,value=112},
			    		{type=15,value=235},
						{type=31,value=15},

		    		},
					-- ·ÉÉý4 --
					{
						{type=13,value=150},
			    		{type=15,value=314},
						{type=31,value=20},

		    		},
					-- ·ÉÉý5 --
					{
						{type=13,value=188},
			    		{type=15,value=393},
						{type=31,value=24},

		    		},
					-- ·ÉÉý6 --
					{
						{type=13,value=248},
			    		{type=15,value=519},
						{type=31,value=32},

		    		},
					-- ·ÉÉý7 --
					{
						{type=13,value=308},
			    		{type=15,value=645},
						{type=31,value=40},

		    		},
					-- ·ÉÉý8 --
					{
						{type=13,value=368},
			    		{type=15,value=771},
						{type=31,value=48},

		    		},
					-- ·ÉÉý9 --
					{
						{type=13,value=428},
			    		{type=15,value=897},
						{type=31,value=56},

		    		},
					-- ·ÉÉý10 --
					{
						{type=13,value=488},
			    		{type=15,value=1023},
						{type=31,value=64},

		    		},
					-- ·ÉÉý11 --
					{
						{type=13,value=573},
			    		{type=15,value=1202},
						{type=31,value=77},

		    		},
					-- ·ÉÉý12 --
					{
						{type=13,value=660},
			    		{type=15,value=1384},
						{type=31,value=90},

		    		},
					-- ·ÉÉý13 --
					{
						{type=13,value=746},
			    		{type=15,value=1566},
						{type=31,value=103},

		    		},
					-- ·ÉÉý14 --
					{
						{type=13,value=833},
			    		{type=15,value=1748},
						{type=31,value=116},

		    		},
					-- ·ÉÉý15 --
					{
						{type=13,value=920},
			    		{type=15,value=1932},
						{type=31,value=128},

		    		},
					-- ·ÉÉý16 --
					{
						{type=13,value=1060},
			    		{type=15,value=2225},
						{type=31,value=151},

		    		},
					-- ·ÉÉý17 --
					{
						{type=13,value=1200},
			    		{type=15,value=2518},
						{type=31,value=174},

		    		},
					-- ·ÉÉý18 --
					{
						{type=13,value=1339},
			    		{type=15,value=2811},
						{type=31,value=197},

		    		},
					-- ·ÉÉý19 --
					{
						{type=13,value=1479},
			    		{type=15,value=3104},
						{type=31,value=220},

		    		},
					-- ·ÉÉý20 --
					{
						{type=13,value=1619},
			    		{type=15,value=3399},
						{type=31,value=240},

		    		},
					-- ·ÉÉý21 --
					{
						{type=13,value=1823},
			    		{type=15,value=3828},
						{type=31,value=280},

		    		},
					-- ·ÉÉý22 --
					{
						{type=13,value=2028},
			    		{type=15,value=4257},
						{type=31,value=320},

		    		},
					-- ·ÉÉý23 --
					{
						{type=13,value=2232},
			    		{type=15,value=4686},
						{type=31,value=360},

		    		},
					-- ·ÉÉý24 --
					{
						{type=13,value=2436},
			    		{type=15,value=5115},
						{type=31,value=400},

		    		},
					-- ·ÉÉý25 --
					{
						{type=13,value=2640},
			    		{type=15,value=5544},
						{type=31,value=440},

		    		},
						--·ÉÉý26¼¶	
					{		
						{type=13,value=2844},	
						{type=15,value=5973},	
						{type=31,value=480},		
					},		
						--·ÉÉý27¼¶	
					{		
						{type=13,value=3048},	
						{type=15,value=6402},	
						{type=31,value=520},		
					},		
						--·ÉÉý28¼¶	
					{		
						{type=13,value=3252},	
						{type=15,value=6831},	
						{type=31,value=560},		
					},		
						--·ÉÉý29¼¶	
					{		
						{type=13,value=3456},	
						{type=15,value=7260},	
						{type=31,value=600},		
					},		
						--·ÉÉý30¼¶	
					{		
						{type=13,value=3660},	
						{type=15,value=7689},	
						{type=31,value=640},		
					},		
						--·ÉÉý31¼¶	
					{		
						{type=13,value=3864},	
						{type=15,value=8118},	
						{type=31,value=680},		
					},		
						--·ÉÉý32¼¶	
					{		
						{type=13,value=4068},	
						{type=15,value=8547},	
						{type=31,value=720},		
					},		
						--·ÉÉý33¼¶	
					{		
						{type=13,value=4272},	
						{type=15,value=8976},	
						{type=31,value=760},		
					},		
						--·ÉÉý34¼¶	
					{		
						{type=13,value=4476},	
						{type=15,value=9405},	
						{type=31,value=800},		
					},		
						--·ÉÉý35¼¶	
					{		
						{type=13,value=4680},	
						{type=15,value=9834},	
						{type=31,value=840},		
					},		
						--·ÉÉý36¼¶	
					{		
						{type=13,value=4884},	
						{type=15,value=10263},	
						{type=31,value=880},		
					},		
						--·ÉÉý37¼¶	
					{		
						{type=13,value=5088},	
						{type=15,value=10692},	
						{type=31,value=920},		
					},		
						--·ÉÉý38¼¶	
					{		
						{type=13,value=5292},	
						{type=15,value=11121},	
						{type=31,value=960},		
					},		
						--·ÉÉý39¼¶	
					{		
						{type=13,value=5496},	
						{type=15,value=11550},	
						{type=31,value=1000},		
					},		
						--·ÉÉý40¼¶	
					{		
						{type=13,value=5700},	
						{type=15,value=11979},	
						{type=31,value=1040},		
					},		
						--·ÉÉý41¼¶	
					{		
						{type=13,value=5904},	
						{type=15,value=12408},	
						{type=31,value=1080},		
					},		
						--·ÉÉý42¼¶	
					{		
						{type=13,value=6108},	
						{type=15,value=12837},	
						{type=31,value=1120},		
					},		
						--·ÉÉý43¼¶	
					{		
						{type=13,value=6312},	
						{type=15,value=13266},	
						{type=31,value=1160},		
					},		
						--·ÉÉý44¼¶	
					{		
						{type=13,value=6516},	
						{type=15,value=13695},	
						{type=31,value=1200},		
					},		
						--·ÉÉý45¼¶	
					{		
						{type=13,value=6720},	
						{type=15,value=14124},	
						{type=31,value=1240},		
					},		
						--·ÉÉý46¼¶	
					{		
						{type=13,value=6924},	
						{type=15,value=14553},	
						{type=31,value=1280},		
					},		
						--·ÉÉý47¼¶	
					{		
						{type=13,value=7128},	
						{type=15,value=14982},	
						{type=31,value=1320},		
					},		
						--·ÉÉý48¼¶	
					{		
						{type=13,value=7332},	
						{type=15,value=15411},	
						{type=31,value=1360},		
					},		
						--·ÉÉý49¼¶	
					{		
						{type=13,value=7536},	
						{type=15,value=15840},	
						{type=31,value=1400},		
					},		
						--·ÉÉý50¼¶	
					{		
						{type=13,value=7740},	
						{type=15,value=16269},	
						{type=31,value=1440},		
					},
		    		
		    	},	 
		    	
		    	-- µÀ
				{
										-- ·ÉÉý1 --
					{
						{type=17,value=38},
			    		{type=19,value=78},
						{type=31,value=5},

		    		},
					-- ·ÉÉý2 --
					{
						{type=17,value=75},
			    		{type=19,value=157},
						{type=31,value=10},

		    		},
					-- ·ÉÉý3 --
					{
						{type=17,value=112},
			    		{type=19,value=235},
						{type=31,value=15},

		    		},
					-- ·ÉÉý4 --
					{
						{type=17,value=150},
			    		{type=19,value=314},
						{type=31,value=20},

		    		},
					-- ·ÉÉý5 --
					{
						{type=17,value=188},
			    		{type=19,value=393},
						{type=31,value=24},

		    		},
					-- ·ÉÉý6 --
					{
						{type=17,value=248},
			    		{type=19,value=519},
						{type=31,value=32},

		    		},
					-- ·ÉÉý7 --
					{
						{type=17,value=308},
			    		{type=19,value=645},
						{type=31,value=40},

		    		},
					-- ·ÉÉý8 --
					{
						{type=17,value=368},
			    		{type=19,value=771},
						{type=31,value=48},

		    		},
					-- ·ÉÉý9 --
					{
						{type=17,value=428},
			    		{type=19,value=897},
						{type=31,value=56},

		    		},
					-- ·ÉÉý10 --
					{
						{type=17,value=488},
			    		{type=19,value=1023},
						{type=31,value=64},

		    		},
					-- ·ÉÉý11 --
					{
						{type=17,value=573},
			    		{type=19,value=1202},
						{type=31,value=77},

		    		},
					-- ·ÉÉý12 --
					{
						{type=17,value=660},
			    		{type=19,value=1384},
						{type=31,value=90},

		    		},
					-- ·ÉÉý13 --
					{
						{type=17,value=746},
			    		{type=19,value=1566},
						{type=31,value=103},

		    		},
					-- ·ÉÉý14 --
					{
						{type=17,value=833},
			    		{type=19,value=1748},
						{type=31,value=116},

		    		},
					-- ·ÉÉý15 --
					{
						{type=17,value=920},
			    		{type=19,value=1932},
						{type=31,value=128},

		    		},
					-- ·ÉÉý16 --
					{
						{type=17,value=1060},
			    		{type=19,value=2225},
						{type=31,value=151},

		    		},
					-- ·ÉÉý17 --
					{
						{type=17,value=1200},
			    		{type=19,value=2518},
						{type=31,value=174},

		    		},
					-- ·ÉÉý18 --
					{
						{type=17,value=1339},
			    		{type=19,value=2811},
						{type=31,value=197},

		    		},
					-- ·ÉÉý19 --
					{
						{type=17,value=1479},
			    		{type=19,value=3104},
						{type=31,value=220},

		    		},
					-- ·ÉÉý20 --
					{
						{type=17,value=1619},
			    		{type=19,value=3399},
						{type=31,value=240},

		    		},
					-- ·ÉÉý21 --
					{
						{type=17,value=1823},
			    		{type=19,value=3828},
						{type=31,value=280},

		    		},
					-- ·ÉÉý22 --
					{
						{type=17,value=2028},
			    		{type=19,value=4257},
						{type=31,value=320},

		    		},
					-- ·ÉÉý23 --
					{
						{type=17,value=2232},
			    		{type=19,value=4686},
						{type=31,value=360},

		    		},
					-- ·ÉÉý24 --
					{
						{type=17,value=2436},
			    		{type=19,value=5115},
						{type=31,value=400},

		    		},
					-- ·ÉÉý25 --
					{
						{type=17,value=2640},
			    		{type=19,value=5544},
						{type=31,value=440},

		    		},
						--·ÉÉý26¼¶	
					{		
						{type=17,value=2844},	
						{type=19,value=5973},	
						{type=31,value=480},		
					},		
						--·ÉÉý27¼¶	
					{		
						{type=17,value=3048},	
						{type=19,value=6402},	
						{type=31,value=520},		
					},		
						--·ÉÉý28¼¶	
					{		
						{type=17,value=3252},	
						{type=19,value=6831},	
						{type=31,value=560},		
					},		
						--·ÉÉý29¼¶	
					{		
						{type=17,value=3456},	
						{type=19,value=7260},	
						{type=31,value=600},		
					},		
						--·ÉÉý30¼¶	
					{		
						{type=17,value=3660},	
						{type=19,value=7689},	
						{type=31,value=640},		
					},		
						--·ÉÉý31¼¶	
					{		
						{type=17,value=3864},	
						{type=19,value=8118},	
						{type=31,value=680},		
					},		
						--·ÉÉý32¼¶	
					{		
						{type=17,value=4068},	
						{type=19,value=8547},	
						{type=31,value=720},		
					},		
						--·ÉÉý33¼¶	
					{		
						{type=17,value=4272},	
						{type=19,value=8976},	
						{type=31,value=760},		
					},		
						--·ÉÉý34¼¶	
					{		
						{type=17,value=4476},	
						{type=19,value=9405},	
						{type=31,value=800},		
					},		
						--·ÉÉý35¼¶	
					{		
						{type=17,value=4680},	
						{type=19,value=9834},	
						{type=31,value=840},		
					},		
						--·ÉÉý36¼¶	
					{		
						{type=17,value=4884},	
						{type=19,value=10263},	
						{type=31,value=880},		
					},		
						--·ÉÉý37¼¶	
					{		
						{type=17,value=5088},	
						{type=19,value=10692},	
						{type=31,value=920},		
					},		
						--·ÉÉý38¼¶	
					{		
						{type=17,value=5292},	
						{type=19,value=11121},	
						{type=31,value=960},		
					},		
						--·ÉÉý39¼¶	
					{		
						{type=17,value=5496},	
						{type=19,value=11550},	
						{type=31,value=1000},		
					},		
						--·ÉÉý40¼¶	
					{		
						{type=17,value=5700},	
						{type=19,value=11979},	
						{type=31,value=1040},		
					},		
						--·ÉÉý41¼¶	
					{		
						{type=17,value=5904},	
						{type=19,value=12408},	
						{type=31,value=1080},		
					},		
						--·ÉÉý42¼¶	
					{		
						{type=17,value=6108},	
						{type=19,value=12837},	
						{type=31,value=1120},		
					},		
						--·ÉÉý43¼¶	
					{		
						{type=17,value=6312},	
						{type=19,value=13266},	
						{type=31,value=1160},		
					},		
						--·ÉÉý44¼¶	
					{		
						{type=17,value=6516},	
						{type=19,value=13695},	
						{type=31,value=1200},		
					},		
						--·ÉÉý45¼¶	
					{		
						{type=17,value=6720},	
						{type=19,value=14124},	
						{type=31,value=1240},		
					},		
						--·ÉÉý46¼¶	
					{		
						{type=17,value=6924},	
						{type=19,value=14553},	
						{type=31,value=1280},		
					},		
						--·ÉÉý47¼¶	
					{		
						{type=17,value=7128},	
						{type=19,value=14982},	
						{type=31,value=1320},		
					},		
						--·ÉÉý48¼¶	
					{		
						{type=17,value=7332},	
						{type=19,value=15411},	
						{type=31,value=1360},		
					},		
						--·ÉÉý49¼¶	
					{		
						{type=17,value=7536},	
						{type=19,value=15840},	
						{type=31,value=1400},		
					},		
						--·ÉÉý50¼¶	
					{		
						{type=17,value=7740},	
						{type=19,value=16269},	
						{type=31,value=1440},		
					},
		    		
		    	},	 
			}, 
		},

		--³á°ò12
		{
			itemId = 7160,
			
			-- ³á°òÀàÐÍ£º1 Îª»ÃÓð³á°ò, 2 Îª¾ø°æ³á°ò
			swingType = 1,
			
			-- Ã¿½×µÄ³á°òÍâ¹Û
			--swingShowIds = {41,42,43,44,45},
			swingShowIds = {71,72,73,74,75,75,75,75,75,75}, 
			-- ÄÚ¹ÛÌØÐ§
			iconIds = {31153,31154,31155,31156,31157,31157,31157,31157,31157,31157}, 
			--³á°òid
			swingIds = {7176,7177,7178,7179,7180,7923,7924,7925,7926,7927},
			-- Éý½×ÏûºÄ³á°òÊýÁ¿(µÚ1¸ö´ú±í1½×)
			classConsumeCounts = { 1,4,8,16,32,64,128,256,512,800},
			
			-- Éý¼¶ÏûºÄ³á°ò½á¾§ÊýÁ¿
			levelConsumeCounts = {2,4,6,8,10,12,14,16,18,20,23,27,31,35,40,45,50,56,62,68,74,81,88,96,103,110,117,124,131,138,145,152,159,166,173,180,187,194,201,208,215,222,229,236,243,250,257,264,271,278},
			
			-- ½×¼¶ÊôÐÔ
			classAttrs = {
				-- Õ½

				-- -- (a1) 
				-- 	{
				-- 		{type=(a2),value=(a3)},
			    -- 		{type=(a4),value=(a5)},
				-- 		{type=(a6),value=(a7)},
				-- 		{type=(a8),value=(a9)},

		    	-- 	},

				{
								-- 1½× 
					{
						{type=9,value=125},
			    		{type=11,value=262},
						{type=128,value=40},
						{type=129,value=624},

		    		},
				-- 2½× 
					{
						{type=9,value=325},
			    		{type=11,value=682},
						{type=128,value=80},
						{type=129,value=1664},

		    		},
				-- 3½× 
					{
						{type=9,value=614},
			    		{type=11,value=1288},
						{type=128,value=120},
						{type=129,value=3328},

		    		},
				-- 4½× 
					{
						{type=9,value=1080},
			    		{type=11,value=2266},
						{type=128,value=160},
						{type=129,value=6240},

		    		},
				-- 5½× 
					{
						{type=9,value=1760},
			    		{type=11,value=3696},
						{type=128,value=200},
						{type=129,value=11440},

		    		},
				-- 6½× 
					{
						{type=9,value=2440},
						{type=11,value=5126},
						{type=128,value=240},
						{type=129,value=16640},

		    		},
				-- 7½× 
					{
						{type=9,value=3120},
						{type=11,value=6556},
						{type=128,value=280},
						{type=129,value=21840},

		    		},
				-- 8½× 
					{
						{type=9,value=3800},
						{type=11,value=7986},
						{type=128,value=320},
						{type=129,value=27040},

		    		},
				-- 9½× 
					{
						{type=9,value=4480},
						{type=11,value=9416},
						{type=128,value=360},
						{type=129,value=32240},

		    		},
				-- 10½× 
					{
						{type=9,value=5160},
						{type=11,value=10846},
						{type=128,value=400},
						{type=129,value=37440},
		    		},		    		
		    		
		    	},	 
		    	
		    	-- ·¨
				{
									-- 1½× 
					{
						{type=13,value=125},
			    		{type=15,value=262},
						{type=128,value=40},
						{type=129,value=624},

		    		},
				-- 2½× 
					{
						{type=13,value=325},
			    		{type=15,value=682},
						{type=128,value=80},
						{type=129,value=1664},

		    		},
				-- 3½× 
					{
						{type=13,value=614},
			    		{type=15,value=1288},
						{type=128,value=120},
						{type=129,value=3328},

		    		},
				-- 4½× 
					{
						{type=13,value=1080},
			    		{type=15,value=2266},
						{type=128,value=160},
						{type=129,value=6240},

		    		},
				-- 5½× 
					{
						{type=13,value=1760},
			    		{type=15,value=3696},
						{type=128,value=200},
						{type=129,value=11440},

		    		},
				-- 6½× 
					{
						{type=13,value=2440},
						{type=15,value=5126},
						{type=128,value=240},
						{type=129,value=16640},

		    		},
				-- 7½× 
					{
						{type=13,value=3120},
						{type=15,value=6556},
						{type=128,value=280},
						{type=129,value=21840},

		    		},
				-- 8½× 
					{
						{type=13,value=3800},
						{type=15,value=7986},
						{type=128,value=320},
						{type=129,value=27040},

		    		},
				-- 9½× 
					{
						{type=13,value=4480},
						{type=15,value=9416},
						{type=128,value=360},
						{type=129,value=32240},

		    		},
				-- 10½× 
					{
						{type=13,value=5160},
						{type=15,value=10846},
						{type=128,value=400},
						{type=129,value=37440},
		    		},

		    		
		    	},	 
		    	
		    	-- µÀ
				{
									-- 1½× 
					{
						{type=17,value=125},
			    		{type=19,value=262},
						{type=128,value=40},
						{type=129,value=624},

		    		},
				-- 2½× 
					{
						{type=17,value=325},
			    		{type=19,value=682},
						{type=128,value=80},
						{type=129,value=1664},

		    		},
				-- 3½× 
					{
						{type=17,value=614},
			    		{type=19,value=1288},
						{type=128,value=120},
						{type=129,value=3328},

		    		},
				-- 4½× 
					{
						{type=17,value=1080},
			    		{type=19,value=2266},
						{type=128,value=160},
						{type=129,value=6240},

		    		},
				-- 5½× 
					{
						{type=17,value=1760},
			    		{type=19,value=3696},
						{type=128,value=200},
						{type=129,value=11440},

		    		},
				-- 6½× 
					{
						{type=17,value=2440},
						{type=19,value=5126},
						{type=128,value=240},
						{type=129,value=16640},

		    		},
				-- 7½× 
					{
						{type=17,value=3120},
						{type=19,value=6556},
						{type=128,value=280},
						{type=129,value=21840},

		    		},
				-- 8½× 
					{
						{type=17,value=3800},
						{type=19,value=7986},
						{type=128,value=320},
						{type=129,value=27040},

		    		},
				-- 9½× 
					{
						{type=17,value=4480},
						{type=19,value=9416},
						{type=128,value=360},
						{type=129,value=32240},

		    		},
				-- 10½× 
					{
						{type=17,value=5160},
						{type=19,value=10846},
						{type=128,value=400},
						{type=129,value=37440},
		    		},

		    		
		    	},	    	
		    	
			},
			
			-- µÈ¼¶ÊôÐÔ
			levelAttrs = {
				-- Õ½

					-- -- (a1) ¼¶ --
					-- {
					-- 	{type=(a2),value=(a3)},
			    	-- 	{type=(a4),value=(a5)},
					-- 	{type=(a6),value=(a7)},
					-- 	{type=(a8),value=(a9)},

		    		-- },

				{
					
					-- ·ÉÉý1 ¼¶ --
					{
						{type=9,value=38},
			    		{type=11,value=78},
						{type=128,value=10},
						{type=129,value=140},

		    		},

					-- ·ÉÉý2 ¼¶ --
					{
						{type=9,value=75},
			    		{type=11,value=157},
						{type=128,value=20},
						{type=129,value=280},

		    		},

					-- ·ÉÉý3 ¼¶ --
					{
						{type=9,value=112},
			    		{type=11,value=235},
						{type=128,value=30},
						{type=129,value=420},

		    		},

					-- ·ÉÉý4 ¼¶ --
					{
						{type=9,value=150},
			    		{type=11,value=314},
						{type=128,value=40},
						{type=129,value=560},

		    		},

					-- ·ÉÉý5 ¼¶ --
					{
						{type=9,value=188},
			    		{type=11,value=393},
						{type=128,value=50},
						{type=129,value=648},

		    		},

					-- ·ÉÉý6 ¼¶ --
					{
						{type=9,value=248},
			    		{type=11,value=519},
						{type=128,value=60},
						{type=129,value=944},

		    		},

					-- ·ÉÉý7 ¼¶ --
					{
						{type=9,value=308},
			    		{type=11,value=645},
						{type=128,value=70},
						{type=129,value=1240},

		    		},

					-- ·ÉÉý8 ¼¶ --
					{
						{type=9,value=368},
			    		{type=11,value=771},
						{type=128,value=80},
						{type=129,value=1536},

		    		},

					-- ·ÉÉý9 ¼¶ --
					{
						{type=9,value=428},
			    		{type=11,value=897},
						{type=128,value=90},
						{type=129,value=1832},

		    		},

					-- ·ÉÉý10 ¼¶ --
					{
						{type=9,value=488},
			    		{type=11,value=1023},
						{type=128,value=100},
						{type=129,value=2128},

		    		},

					-- ·ÉÉý11 ¼¶ --
					{
						{type=9,value=573},
			    		{type=11,value=1202},
						{type=128,value=110},
						{type=129,value=2684},

		    		},

					-- ·ÉÉý12 ¼¶ --
					{
						{type=9,value=660},
			    		{type=11,value=1384},
						{type=128,value=120},
						{type=129,value=3240},

		    		},

					-- ·ÉÉý13 ¼¶ --
					{
						{type=9,value=746},
			    		{type=11,value=1566},
						{type=128,value=130},
						{type=129,value=3796},

		    		},

					-- ·ÉÉý14 ¼¶ --
					{
						{type=9,value=833},
			    		{type=11,value=1748},
						{type=128,value=140},
						{type=129,value=4352},

		    		},

					-- ·ÉÉý15 ¼¶ --
					{
						{type=9,value=920},
			    		{type=11,value=1932},
						{type=128,value=150},
						{type=129,value=4856},

		    		},

					-- ·ÉÉý16 ¼¶ --
					{
						{type=9,value=1060},
			    		{type=11,value=2225},
						{type=128,value=160},
						{type=129,value=5932},

		    		},

					-- ·ÉÉý17 ¼¶ --
					{
						{type=9,value=1200},
			    		{type=11,value=2518},
						{type=128,value=170},
						{type=129,value=7008},

		    		},

					-- ·ÉÉý18 ¼¶ --
					{
						{type=9,value=1339},
			    		{type=11,value=2811},
						{type=128,value=180},
						{type=129,value=8084},

		    		},

					-- ·ÉÉý19 ¼¶ --
					{
						{type=9,value=1479},
			    		{type=11,value=3104},
						{type=128,value=190},
						{type=129,value=9160},

		    		},

					-- ·ÉÉý20 ¼¶ --
					{
						{type=9,value=1619},
			    		{type=11,value=3399},
						{type=128,value=200},
						{type=129,value=10080},

		    		},

					-- ·ÉÉý21 ¼¶ --
					{
						{type=9,value=1823},
			    		{type=11,value=3828},
						{type=128,value=210},
						{type=129,value=12040},

		    		},

					-- ·ÉÉý22 ¼¶ --
					{
						{type=9,value=2028},
			    		{type=11,value=4257},
						{type=128,value=220},
						{type=129,value=14000},

		    		},

					-- ·ÉÉý23 ¼¶ --
					{
						{type=9,value=2232},
			    		{type=11,value=4686},
						{type=128,value=230},
						{type=129,value=15960},

		    		},

					-- ·ÉÉý24 ¼¶ --
					{
						{type=9,value=2436},
			    		{type=11,value=5115},
						{type=128,value=240},
						{type=129,value=17920},

		    		},

					-- ·ÉÉý25 ¼¶ --
					{
						{type=9,value=2640},
			    		{type=11,value=5544},
						{type=128,value=250},
						{type=129,value=19880},

		    		},
						--·ÉÉý26¼¶			
					{				
						{type=9,value=2844},			
						{type=11,value=5973},			
						{type=128,value=260},			
						{type=129,value=21840},			
					},				
						--·ÉÉý27¼¶			
					{				
						{type=9,value=3048},			
						{type=11,value=6402},			
						{type=128,value=270},			
						{type=129,value=23800},			
					},				
						--·ÉÉý28¼¶			
					{				
						{type=9,value=3252},			
						{type=11,value=6831},			
						{type=128,value=280},			
						{type=129,value=25760},			
					},				
						--·ÉÉý29¼¶			
					{				
						{type=9,value=3456},			
						{type=11,value=7260},			
						{type=128,value=290},			
						{type=129,value=27720},			
					},				
						--·ÉÉý30¼¶			
					{				
						{type=9,value=3660},			
						{type=11,value=7689},			
						{type=128,value=300},			
						{type=129,value=29680},			
					},				
						--·ÉÉý31¼¶			
					{				
						{type=9,value=3864},			
						{type=11,value=8118},			
						{type=128,value=310},			
						{type=129,value=31640},			
					},				
						--·ÉÉý32¼¶			
					{				
						{type=9,value=4068},			
						{type=11,value=8547},			
						{type=128,value=320},			
						{type=129,value=33600},			
					},				
						--·ÉÉý33¼¶			
					{				
						{type=9,value=4272},			
						{type=11,value=8976},			
						{type=128,value=330},			
						{type=129,value=35560},			
					},				
						--·ÉÉý34¼¶			
					{				
						{type=9,value=4476},			
						{type=11,value=9405},			
						{type=128,value=340},			
						{type=129,value=37520},			
					},				
						--·ÉÉý35¼¶			
					{				
						{type=9,value=4680},			
						{type=11,value=9834},			
						{type=128,value=350},			
						{type=129,value=39480},			
					},				
						--·ÉÉý36¼¶			
					{				
						{type=9,value=4884},			
						{type=11,value=10263},			
						{type=128,value=360},			
						{type=129,value=41440},			
					},				
						--·ÉÉý37¼¶			
					{				
						{type=9,value=5088},			
						{type=11,value=10692},			
						{type=128,value=370},			
						{type=129,value=43400},			
					},				
						--·ÉÉý38¼¶			
					{				
						{type=9,value=5292},			
						{type=11,value=11121},			
						{type=128,value=380},			
						{type=129,value=45360},			
					},				
						--·ÉÉý39¼¶			
					{				
						{type=9,value=5496},			
						{type=11,value=11550},			
						{type=128,value=390},			
						{type=129,value=47320},			
					},				
						--·ÉÉý40¼¶			
					{				
						{type=9,value=5700},			
						{type=11,value=11979},			
						{type=128,value=400},			
						{type=129,value=49280},			
					},				
						--·ÉÉý41¼¶			
					{				
						{type=9,value=5904},			
						{type=11,value=12408},			
						{type=128,value=410},			
						{type=129,value=51240},			
					},				
						--·ÉÉý42¼¶			
					{				
						{type=9,value=6108},			
						{type=11,value=12837},			
						{type=128,value=420},			
						{type=129,value=53200},			
					},				
						--·ÉÉý43¼¶			
					{				
						{type=9,value=6312},			
						{type=11,value=13266},			
						{type=128,value=430},			
						{type=129,value=55160},			
					},				
						--·ÉÉý44¼¶			
					{				
						{type=9,value=6516},			
						{type=11,value=13695},			
						{type=128,value=440},			
						{type=129,value=57120},			
					},				
						--·ÉÉý45¼¶			
					{				
						{type=9,value=6720},			
						{type=11,value=14124},			
						{type=128,value=450},			
						{type=129,value=59080},			
					},				
						--·ÉÉý46¼¶			
					{				
						{type=9,value=6924},			
						{type=11,value=14553},			
						{type=128,value=460},			
						{type=129,value=61040},			
					},				
						--·ÉÉý47¼¶			
					{				
						{type=9,value=7128},			
						{type=11,value=14982},			
						{type=128,value=470},			
						{type=129,value=63000},			
					},				
						--·ÉÉý48¼¶			
					{				
						{type=9,value=7332},			
						{type=11,value=15411},			
						{type=128,value=480},			
						{type=129,value=64960},			
					},				
						--·ÉÉý49¼¶			
					{				
						{type=9,value=7536},			
						{type=11,value=15840},			
						{type=128,value=490},			
						{type=129,value=66920},			
					},				
						--·ÉÉý50¼¶			
					{				
						{type=9,value=7740},			
						{type=11,value=16269},			
						{type=128,value=500},			
						{type=129,value=68880},			
					},				

		    		
		    	},	 
		    	
		    	-- ·¨
				{
					
					-- ·ÉÉý1 ¼¶ --
					{
						{type=13,value=38},
			    		{type=15,value=78},
						{type=128,value=10},
						{type=129,value=140},

		    		},

					-- ·ÉÉý2 ¼¶ --
					{
						{type=13,value=75},
			    		{type=15,value=157},
						{type=128,value=20},
						{type=129,value=280},

		    		},

					-- ·ÉÉý3 ¼¶ --
					{
						{type=13,value=112},
			    		{type=15,value=235},
						{type=128,value=30},
						{type=129,value=420},

		    		},

					-- ·ÉÉý4 ¼¶ --
					{
						{type=13,value=150},
			    		{type=15,value=314},
						{type=128,value=40},
						{type=129,value=560},

		    		},

					-- ·ÉÉý5 ¼¶ --
					{
						{type=13,value=188},
			    		{type=15,value=393},
						{type=128,value=50},
						{type=129,value=648},

		    		},

					-- ·ÉÉý6 ¼¶ --
					{
						{type=13,value=248},
			    		{type=15,value=519},
						{type=128,value=60},
						{type=129,value=944},

		    		},

					-- ·ÉÉý7 ¼¶ --
					{
						{type=13,value=308},
			    		{type=15,value=645},
						{type=128,value=70},
						{type=129,value=1240},

		    		},

					-- ·ÉÉý8 ¼¶ --
					{
						{type=13,value=368},
			    		{type=15,value=771},
						{type=128,value=80},
						{type=129,value=1536},

		    		},

					-- ·ÉÉý9 ¼¶ --
					{
						{type=13,value=428},
			    		{type=15,value=897},
						{type=128,value=90},
						{type=129,value=1832},

		    		},

					-- ·ÉÉý10 ¼¶ --
					{
						{type=13,value=488},
			    		{type=15,value=1023},
						{type=128,value=100},
						{type=129,value=2128},

		    		},

					-- ·ÉÉý11 ¼¶ --
					{
						{type=13,value=573},
			    		{type=15,value=1202},
						{type=128,value=110},
						{type=129,value=2684},

		    		},

					-- ·ÉÉý12 ¼¶ --
					{
						{type=13,value=660},
			    		{type=15,value=1384},
						{type=128,value=120},
						{type=129,value=3240},

		    		},

					-- ·ÉÉý13 ¼¶ --
					{
						{type=13,value=746},
			    		{type=15,value=1566},
						{type=128,value=130},
						{type=129,value=3796},

		    		},

					-- ·ÉÉý14 ¼¶ --
					{
						{type=13,value=833},
			    		{type=15,value=1748},
						{type=128,value=140},
						{type=129,value=4352},

		    		},

					-- ·ÉÉý15 ¼¶ --
					{
						{type=13,value=920},
			    		{type=15,value=1932},
						{type=128,value=150},
						{type=129,value=4856},

		    		},

					-- ·ÉÉý16 ¼¶ --
					{
						{type=13,value=1060},
			    		{type=15,value=2225},
						{type=128,value=160},
						{type=129,value=5932},

		    		},

					-- ·ÉÉý17 ¼¶ --
					{
						{type=13,value=1200},
			    		{type=15,value=2518},
						{type=128,value=170},
						{type=129,value=7008},

		    		},

					-- ·ÉÉý18 ¼¶ --
					{
						{type=13,value=1339},
			    		{type=15,value=2811},
						{type=128,value=180},
						{type=129,value=8084},

		    		},

					-- ·ÉÉý19 ¼¶ --
					{
						{type=13,value=1479},
			    		{type=15,value=3104},
						{type=128,value=190},
						{type=129,value=9160},

		    		},

					-- ·ÉÉý20 ¼¶ --
					{
						{type=13,value=1619},
			    		{type=15,value=3399},
						{type=128,value=200},
						{type=129,value=10080},

		    		},

					-- ·ÉÉý21 ¼¶ --
					{
						{type=13,value=1823},
			    		{type=15,value=3828},
						{type=128,value=210},
						{type=129,value=12040},

		    		},

					-- ·ÉÉý22 ¼¶ --
					{
						{type=13,value=2028},
			    		{type=15,value=4257},
						{type=128,value=220},
						{type=129,value=14000},

		    		},

					-- ·ÉÉý23 ¼¶ --
					{
						{type=13,value=2232},
			    		{type=15,value=4686},
						{type=128,value=230},
						{type=129,value=15960},

		    		},

					-- ·ÉÉý24 ¼¶ --
					{
						{type=13,value=2436},
			    		{type=15,value=5115},
						{type=128,value=240},
						{type=129,value=17920},

		    		},

					-- ·ÉÉý25 ¼¶ --
					{
						{type=13,value=2640},
			    		{type=15,value=5544},
						{type=128,value=250},
						{type=129,value=19880},

		    		},
	                 --·ÉÉý26¼¶			
					{				
						{type=13,value=2844},			
						{type=15,value=5973},			
						{type=128,value=260},			
						{type=129,value=21840},			
					},				
						--·ÉÉý27¼¶			
					{				
						{type=13,value=3048},			
						{type=15,value=6402},			
						{type=128,value=270},			
						{type=129,value=23800},			
					},				
						--·ÉÉý28¼¶			
					{				
						{type=13,value=3252},			
						{type=15,value=6831},			
						{type=128,value=280},			
						{type=129,value=25760},			
					},				
						--·ÉÉý29¼¶			
					{				
						{type=13,value=3456},			
						{type=15,value=7260},			
						{type=128,value=290},			
						{type=129,value=27720},			
					},				
						--·ÉÉý30¼¶			
					{				
						{type=13,value=3660},			
						{type=15,value=7689},			
						{type=128,value=300},			
						{type=129,value=29680},			
					},				
						--·ÉÉý31¼¶			
					{				
						{type=13,value=3864},			
						{type=15,value=8118},			
						{type=128,value=310},			
						{type=129,value=31640},			
					},				
						--·ÉÉý32¼¶			
					{				
						{type=13,value=4068},			
						{type=15,value=8547},			
						{type=128,value=320},			
						{type=129,value=33600},			
					},				
						--·ÉÉý33¼¶			
					{				
						{type=13,value=4272},			
						{type=15,value=8976},			
						{type=128,value=330},			
						{type=129,value=35560},			
					},				
						--·ÉÉý34¼¶			
					{				
						{type=13,value=4476},			
						{type=15,value=9405},			
						{type=128,value=340},			
						{type=129,value=37520},			
					},				
						--·ÉÉý35¼¶			
					{				
						{type=13,value=4680},			
						{type=15,value=9834},			
						{type=128,value=350},			
						{type=129,value=39480},			
					},				
						--·ÉÉý36¼¶			
					{				
						{type=13,value=4884},			
						{type=15,value=10263},			
						{type=128,value=360},			
						{type=129,value=41440},			
					},				
						--·ÉÉý37¼¶			
					{				
						{type=13,value=5088},			
						{type=15,value=10692},			
						{type=128,value=370},			
						{type=129,value=43400},			
					},				
						--·ÉÉý38¼¶			
					{				
						{type=13,value=5292},			
						{type=15,value=11121},			
						{type=128,value=380},			
						{type=129,value=45360},			
					},				
						--·ÉÉý39¼¶			
					{				
						{type=13,value=5496},			
						{type=15,value=11550},			
						{type=128,value=390},			
						{type=129,value=47320},			
					},				
						--·ÉÉý40¼¶			
					{				
						{type=13,value=5700},			
						{type=15,value=11979},			
						{type=128,value=400},			
						{type=129,value=49280},			
					},				
						--·ÉÉý41¼¶			
					{				
						{type=13,value=5904},			
						{type=15,value=12408},			
						{type=128,value=410},			
						{type=129,value=51240},			
					},				
						--·ÉÉý42¼¶			
					{				
						{type=13,value=6108},			
						{type=15,value=12837},			
						{type=128,value=420},			
						{type=129,value=53200},			
					},				
						--·ÉÉý43¼¶			
					{				
						{type=13,value=6312},			
						{type=15,value=13266},			
						{type=128,value=430},			
						{type=129,value=55160},			
					},				
						--·ÉÉý44¼¶			
					{				
						{type=13,value=6516},			
						{type=15,value=13695},			
						{type=128,value=440},			
						{type=129,value=57120},			
					},				
						--·ÉÉý45¼¶			
					{				
						{type=13,value=6720},			
						{type=15,value=14124},			
						{type=128,value=450},			
						{type=129,value=59080},			
					},				
						--·ÉÉý46¼¶			
					{				
						{type=13,value=6924},			
						{type=15,value=14553},			
						{type=128,value=460},			
						{type=129,value=61040},			
					},				
						--·ÉÉý47¼¶			
					{				
						{type=13,value=7128},			
						{type=15,value=14982},			
						{type=128,value=470},			
						{type=129,value=63000},			
					},				
						--·ÉÉý48¼¶			
					{				
						{type=13,value=7332},			
						{type=15,value=15411},			
						{type=128,value=480},			
						{type=129,value=64960},			
					},				
						--·ÉÉý49¼¶			
					{				
						{type=13,value=7536},			
						{type=15,value=15840},			
						{type=128,value=490},			
						{type=129,value=66920},			
					},				
						--·ÉÉý50¼¶			
					{				
						{type=13,value=7740},			
						{type=15,value=16269},			
						{type=128,value=500},			
						{type=129,value=68880},			
					},	

		    		
		    	},	 
		    	
		    	-- µÀ
				{
				
					-- ·ÉÉý1 ¼¶ --
					{
						{type=17,value=38},
			    		{type=19,value=78},
						{type=128,value=10},
						{type=129,value=140},

		    		},

					-- ·ÉÉý2 ¼¶ --
					{
						{type=17,value=75},
			    		{type=19,value=157},
						{type=128,value=20},
						{type=129,value=280},

		    		},

					-- ·ÉÉý3 ¼¶ --
					{
						{type=17,value=112},
			    		{type=19,value=235},
						{type=128,value=30},
						{type=129,value=420},

		    		},

					-- ·ÉÉý4 ¼¶ --
					{
						{type=17,value=150},
			    		{type=19,value=314},
						{type=128,value=40},
						{type=129,value=560},

		    		},

					-- ·ÉÉý5 ¼¶ --
					{
						{type=17,value=188},
			    		{type=19,value=393},
						{type=128,value=50},
						{type=129,value=648},

		    		},

					-- ·ÉÉý6 ¼¶ --
					{
						{type=17,value=248},
			    		{type=19,value=519},
						{type=128,value=60},
						{type=129,value=944},

		    		},

					-- ·ÉÉý7 ¼¶ --
					{
						{type=17,value=308},
			    		{type=19,value=645},
						{type=128,value=70},
						{type=129,value=1240},

		    		},

					-- ·ÉÉý8 ¼¶ --
					{
						{type=17,value=368},
			    		{type=19,value=771},
						{type=128,value=80},
						{type=129,value=1536},

		    		},

					-- ·ÉÉý9 ¼¶ --
					{
						{type=17,value=428},
			    		{type=19,value=897},
						{type=128,value=90},
						{type=129,value=1832},

		    		},

					-- ·ÉÉý10 ¼¶ --
					{
						{type=17,value=488},
			    		{type=19,value=1023},
						{type=128,value=100},
						{type=129,value=2128},

		    		},

					-- ·ÉÉý11 ¼¶ --
					{
						{type=17,value=573},
			    		{type=19,value=1202},
						{type=128,value=110},
						{type=129,value=2684},

		    		},

					-- ·ÉÉý12 ¼¶ --
					{
						{type=17,value=660},
			    		{type=19,value=1384},
						{type=128,value=120},
						{type=129,value=3240},

		    		},

					-- ·ÉÉý13 ¼¶ --
					{
						{type=17,value=746},
			    		{type=19,value=1566},
						{type=128,value=130},
						{type=129,value=3796},

		    		},

					-- ·ÉÉý14 ¼¶ --
					{
						{type=17,value=833},
			    		{type=19,value=1748},
						{type=128,value=140},
						{type=129,value=4352},

		    		},

					-- ·ÉÉý15 ¼¶ --
					{
						{type=17,value=920},
			    		{type=19,value=1932},
						{type=128,value=150},
						{type=129,value=4856},

		    		},

					-- ·ÉÉý16 ¼¶ --
					{
						{type=17,value=1060},
			    		{type=19,value=2225},
						{type=128,value=160},
						{type=129,value=5932},

		    		},

					-- ·ÉÉý17 ¼¶ --
					{
						{type=17,value=1200},
			    		{type=19,value=2518},
						{type=128,value=170},
						{type=129,value=7008},

		    		},

					-- ·ÉÉý18 ¼¶ --
					{
						{type=17,value=1339},
			    		{type=19,value=2811},
						{type=128,value=180},
						{type=129,value=8084},

		    		},

					-- ·ÉÉý19 ¼¶ --
					{
						{type=17,value=1479},
			    		{type=19,value=3104},
						{type=128,value=190},
						{type=129,value=9160},

		    		},

					-- ·ÉÉý20 ¼¶ --
					{
						{type=17,value=1619},
			    		{type=19,value=3399},
						{type=128,value=200},
						{type=129,value=10080},

		    		},

					-- ·ÉÉý21 ¼¶ --
					{
						{type=17,value=1823},
			    		{type=19,value=3828},
						{type=128,value=210},
						{type=129,value=12040},

		    		},

					-- ·ÉÉý22 ¼¶ --
					{
						{type=17,value=2028},
			    		{type=19,value=4257},
						{type=128,value=220},
						{type=129,value=14000},

		    		},

					-- ·ÉÉý23 ¼¶ --
					{
						{type=17,value=2232},
			    		{type=19,value=4686},
						{type=128,value=230},
						{type=129,value=15960},

		    		},

					-- ·ÉÉý24 ¼¶ --
					{
						{type=17,value=2436},
			    		{type=19,value=5115},
						{type=128,value=240},
						{type=129,value=17920},

		    		},

					-- ·ÉÉý25 ¼¶ --
					{
						{type=17,value=2640},
			    		{type=19,value=5544},
						{type=128,value=250},
						{type=129,value=19880},

		    		},
	                                                                                        --·ÉÉý26¼¶			
					{				
						{type=17,value=2844},			
						{type=19,value=5973},			
						{type=128,value=260},			
						{type=129,value=21840},			
					},				
						--·ÉÉý27¼¶			
					{				
						{type=17,value=3048},			
						{type=19,value=6402},			
						{type=128,value=270},			
						{type=129,value=23800},			
					},				
						--·ÉÉý28¼¶			
					{				
						{type=17,value=3252},			
						{type=19,value=6831},			
						{type=128,value=280},			
						{type=129,value=25760},			
					},				
						--·ÉÉý29¼¶			
					{				
						{type=17,value=3456},			
						{type=19,value=7260},			
						{type=128,value=290},			
						{type=129,value=27720},			
					},				
						--·ÉÉý30¼¶			
					{				
						{type=17,value=3660},			
						{type=19,value=7689},			
						{type=128,value=300},			
						{type=129,value=29680},			
					},				
						--·ÉÉý31¼¶			
					{				
						{type=17,value=3864},			
						{type=19,value=8118},			
						{type=128,value=310},			
						{type=129,value=31640},			
					},				
						--·ÉÉý32¼¶			
					{				
						{type=17,value=4068},			
						{type=19,value=8547},			
						{type=128,value=320},			
						{type=129,value=33600},			
					},				
						--·ÉÉý33¼¶			
					{				
						{type=17,value=4272},			
						{type=19,value=8976},			
						{type=128,value=330},			
						{type=129,value=35560},			
					},				
						--·ÉÉý34¼¶			
					{				
						{type=17,value=4476},			
						{type=19,value=9405},			
						{type=128,value=340},			
						{type=129,value=37520},			
					},				
						--·ÉÉý35¼¶			
					{				
						{type=17,value=4680},			
						{type=19,value=9834},			
						{type=128,value=350},			
						{type=129,value=39480},			
					},				
						--·ÉÉý36¼¶			
					{				
						{type=17,value=4884},			
						{type=19,value=10263},			
						{type=128,value=360},			
						{type=129,value=41440},			
					},				
						--·ÉÉý37¼¶			
					{				
						{type=17,value=5088},			
						{type=19,value=10692},			
						{type=128,value=370},			
						{type=129,value=43400},			
					},				
						--·ÉÉý38¼¶			
					{				
						{type=17,value=5292},			
						{type=19,value=11121},			
						{type=128,value=380},			
						{type=129,value=45360},			
					},				
						--·ÉÉý39¼¶			
					{				
						{type=17,value=5496},			
						{type=19,value=11550},			
						{type=128,value=390},			
						{type=129,value=47320},			
					},				
						--·ÉÉý40¼¶			
					{				
						{type=17,value=5700},			
						{type=19,value=11979},			
						{type=128,value=400},			
						{type=129,value=49280},			
					},				
						--·ÉÉý41¼¶			
					{				
						{type=17,value=5904},			
						{type=19,value=12408},			
						{type=128,value=410},			
						{type=129,value=51240},			
					},				
						--·ÉÉý42¼¶			
					{				
						{type=17,value=6108},			
						{type=19,value=12837},			
						{type=128,value=420},			
						{type=129,value=53200},			
					},				
						--·ÉÉý43¼¶			
					{				
						{type=17,value=6312},			
						{type=19,value=13266},			
						{type=128,value=430},			
						{type=129,value=55160},			
					},				
						--·ÉÉý44¼¶			
					{				
						{type=17,value=6516},			
						{type=19,value=13695},			
						{type=128,value=440},			
						{type=129,value=57120},			
					},				
						--·ÉÉý45¼¶			
					{				
						{type=17,value=6720},			
						{type=19,value=14124},			
						{type=128,value=450},			
						{type=129,value=59080},			
					},				
						--·ÉÉý46¼¶			
					{				
						{type=17,value=6924},			
						{type=19,value=14553},			
						{type=128,value=460},			
						{type=129,value=61040},			
					},				
						--·ÉÉý47¼¶			
					{				
						{type=17,value=7128},			
						{type=19,value=14982},			
						{type=128,value=470},			
						{type=129,value=63000},			
					},				
						--·ÉÉý48¼¶			
					{				
						{type=17,value=7332},			
						{type=19,value=15411},			
						{type=128,value=480},			
						{type=129,value=64960},			
					},				
						--·ÉÉý49¼¶			
					{				
						{type=17,value=7536},			
						{type=19,value=15840},			
						{type=128,value=490},			
						{type=129,value=66920},			
					},				
						--·ÉÉý50¼¶			
					{				
						{type=17,value=7740},			
						{type=19,value=16269},			
						{type=128,value=500},			
						{type=129,value=68880},			
					},	

		    		
		    	},	 
			}, 
		},
		
		-----------

		--³á°ò13
		{
			itemId = 7805,
			
			-- ³á°òÀàÐÍ£º1 Îª»ÃÓð³á°ò, 2 Îª¾ø°æ³á°ò
			swingType = 2,
			
			-- Ã¿½×µÄ³á°òÍâ¹Û
			swingShowIds = {86}, 
			-- ÄÚ¹ÛÌØÐ§
			iconIds = {31478}, 
			--³á°òid
			swingIds = {7805},
			-- Éý½×ÏûºÄ³á°òÊýÁ¿(µÚ1¸ö´ú±í1½×)
			classConsumeCounts = { 1 },
			
			-- Éý¼¶ÏûºÄ³á°ò½á¾§ÊýÁ¿
			levelConsumeCounts = {},
			
			-- ½×¼¶ÊôÐÔ
			classAttrs = {
				-- Õ½				
				{
					-- 1½× 
					{
				{type=9,value=580},
				{type=11,value=1280},
				{type=5,value=38888},
				{type=161,value=500},
				{type=163,value=500},
				{type=165,value=500},
		    		},		    		
		    	},	 
		    	
		    	-- ·¨
				{
					-- 1½× 
					{
				{type=13,value=580},
				{type=15,value=1280},
				{type=5,value=38888},
				{type=161,value=500},
				{type=163,value=500},
				{type=165,value=500},
		    		},
		    	},	 
		    	
		    	-- µÀ
				{
					-- 1½× 
					{
				{type=17,value=580},
				{type=19,value=1280},
				{type=5,value=38888},
				{type=161,value=500},
				{type=163,value=500},
				{type=165,value=500},
		    		},		    		
		    	},		    	
			},
			
			-- µÈ¼¶ÊôÐÔ
			levelAttrs = {
				-- Õ½				
				{		    		
		    	},	 
		    	
		    	-- ·¨
				{
		    	},	 
		    	
		    	-- µÀ
				{				
		    	},	 
			}, 
		},
		
		--------


	},
	
}