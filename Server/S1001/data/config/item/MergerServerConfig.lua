--#include "..\..\language\LangCode.txt"

MergerServerCfg = 
{
	--登录奖励
	LoginAward = 
	{
		needLevel = 70,
		needCircle = 0,
		award =
		{
			{
				-- {type = 0, id = 518, count = 2, quality = 0, strong = 0, bind = 1},--100绑定元宝*2
				-- {type = 0, id = 509, count = 2, quality = 0, strong = 0, bind = 1},--金条大*2	
				-- {type = 0, id = 679, count = 2, quality = 0, strong = 0, bind = 1},--屠魔令*2
				-- {type = 0, id = 457, count = 1, quality = 0, strong = 0, bind = 1},--雷泽神殿卷*1				
				-- {type = 0, id = 678, count = 2, quality = 0, strong = 0, bind = 1},--副本传送卷*2					
			},
			{
				-- {type = 0, id = 518, count = 2, quality = 0, strong = 0, bind = 1},--100绑定元宝*2
				-- {type = 0, id = 509, count = 2, quality = 0, strong = 0, bind = 1},--金条大*2	
				-- {type = 0, id = 679, count = 2, quality = 0, strong = 0, bind = 1},--屠魔令*2
				-- {type = 0, id = 457, count = 1, quality = 0, strong = 0, bind = 1},--雷泽神殿卷*1				
				-- {type = 0, id = 678, count = 2, quality = 0, strong = 0, bind = 1},--副本传送卷*2					
			},
			{
				-- {type = 0, id = 518, count = 2, quality = 0, strong = 0, bind = 1},--100绑定元宝*2
				-- {type = 0, id = 509, count = 2, quality = 0, strong = 0, bind = 1},--金条大*2	
				-- {type = 0, id = 679, count = 2, quality = 0, strong = 0, bind = 1},--屠魔令*2
				-- {type = 0, id = 457, count = 1, quality = 0, strong = 0, bind = 1},--雷泽神殿卷*1				
				-- {type = 0, id = 678, count = 2, quality = 0, strong = 0, bind = 1},--副本传送卷*2					
			},
			{
				-- {type = 0, id = 518, count = 2, quality = 0, strong = 0, bind = 1},--100绑定元宝*2
				-- {type = 0, id = 509, count = 2, quality = 0, strong = 0, bind = 1},--金条大*2	
				-- {type = 0, id = 679, count = 2, quality = 0, strong = 0, bind = 1},--屠魔令*2
				-- {type = 0, id = 457, count = 1, quality = 0, strong = 0, bind = 1},--雷泽神殿卷*1				
				-- {type = 0, id = 678, count = 2, quality = 0, strong = 0, bind = 1},--副本传送卷*2					
			},
			{
				-- {type = 0, id = 518, count = 2, quality = 0, strong = 0, bind = 1},--100绑定元宝*2
				-- {type = 0, id = 509, count = 2, quality = 0, strong = 0, bind = 1},--金条大*2	
				-- {type = 0, id = 679, count = 2, quality = 0, strong = 0, bind = 1},--屠魔令*2
				-- {type = 0, id = 457, count = 1, quality = 0, strong = 0, bind = 1},--雷泽神殿卷*1				
				-- {type = 0, id = 678, count = 2, quality = 0, strong = 0, bind = 1},--副本传送卷*2					
			},												
		}
	},
	
	--累积充值
	CumulativeAward = 
	{
	        --100元档
--		{
--			needCumulative = 10000,--100元
--			award = 
--			{
--				{type = 0, id = 646, count = 1, quality = 0, strong = 0, bind = 1},--7级血炼石（7440元宝）	
--				{type = 0, id = 529, count = 1, quality = 0, strong = 0, bind = 1},--绿晶石 X 1	
--				{type = 0, id = 537, count = 20, quality = 0, strong = 0, bind = 1},--钻晶 X 20	
--				{type = 0, id = 952, count = 1, quality = 0, strong = 0, bind = 1},--低级BOSS召唤卷 X 1  				
--			},
--		},
--		--300元档
--		{
--			needCumulative = 30000,--300元
--			award = 
--			{
--				{type = 0, id = 647, count = 1, quality = 0, strong = 0, bind = 1},--8级血炼石（10410元宝）	
--				{type = 0, id = 529, count = 2, quality = 0, strong = 0, bind = 1},--绿晶石 X 2	
--				{type = 0, id = 537, count = 40, quality = 0, strong = 0, bind = 1},--钻晶 X 40	
--				{type = 0, id = 952, count = 2, quality = 0, strong = 0, bind = 1},--低级BOSS召唤卷 X 2	  				
--			},
--		},
--		--500元档
--		{
--			needCumulative = 50000,
--			award = 
--			{
--				{type = 0, id = 648, count = 1, quality = 0, strong = 0, bind = 1},--9级血炼石（13530元宝）
--				{type = 0, id = 529, count = 3, quality = 0, strong = 0, bind = 1},--绿晶石 X 3	
--				{type = 0, id = 538, count = 1, quality = 0, strong = 0, bind = 1},--钻晶包 X 1	
--				{type = 0, id = 953, count = 3, quality = 0, strong = 0, bind = 1},--中级BOSS召唤卷 X 3					
--			},
--		},
--		--1000元档
--		{
--			needCumulative = 100000,
--			award = 
--			{
--				{type = 0, id = 649, count = 1, quality = 0, strong = 0, bind = 1},--10级血炼石（16230元宝）	
--				{type = 0, id = 528, count = 3, quality = 0, strong = 0, bind = 1},--紫晶石 X 3	
--				{type = 0, id = 538, count = 2, quality = 0, strong = 0, bind = 1},--钻晶包 X 2	
--				{type = 0, id = 954, count = 4, quality = 0, strong = 0, bind = 1},--高级BOSS召唤卷 X 4	
--			
--			},
--		},
--		--2000元档
--		{
--			needCumulative = 200000,
--			award = 
--			{
--				{type = 0, id = 650, count = 1, quality = 0, strong = 0, bind = 1},--11级血炼石（17850元宝）	
--				{type = 0, id = 688, count = 3, quality = 0, strong = 0, bind = 1},--勋章之心 X 3	
--				{type = 0, id = 538, count = 4, quality = 0, strong = 0, bind = 1},--钻晶包 X 4	
--				{type = 0, id = 955, count = 5, quality = 0, strong = 0, bind = 1},--特级BOSS召唤卷 X 5				
--			},
--		},
--		--5000元档
--		{
--			needCumulative = 500000,
--			award = 
--			{
--				{type = 0, id = 651, count = 1, quality = 0, strong = 0, bind = 1},--12级血炼石（19635元宝）	
--				{type = 0, id = 689, count = 3, quality = 0, strong = 0, bind = 1},--蚩尤之角 X 3	
--				{type = 0, id = 538, count = 10, quality = 0, strong = 0, bind = 1},--钻晶包 X 10	
--				{type = 0, id = 955, count = 10, quality = 0, strong = 0, bind = 1},--特级BOSS召唤卷 X 10					
--			},
--		},
--		--10000元档
--		{
--			needCumulative = 1000000,
--			award = 
--			{
--				{type = 0, id = 651, count = 2, quality = 0, strong = 0, bind = 1},--12级血炼石（19635元宝）	
--				{type = 0, id = 938, count = 2, quality = 0, strong = 0, bind = 1},--100颗金刚石	
--				{type = 0, id = 538, count = 20, quality = 0, strong = 0, bind = 1},--钻晶包 X 20	
--				{type = 0, id = 955, count = 20, quality = 0, strong = 0, bind = 1},--特级BOSS召唤卷 X 20					
--			},
--		},
	},
	
	--王城争霸
	CityWarAward = 
	{
		Leader = 
		{
			-- {type = 0, id = 972, count = 1, quality = 0, strong = 0, bind = 1},	
		},
		Masses = 
		{
			-- {type = 0, id = 973, count = 1, quality = 0, strong = 0, bind = 1},	
		},
	},
	
	--超值礼包
	SuperBag = 
	{
		--飞升大礼包----预计价值70元
--		{
--			type = 1,
--			money = 2888,
--			items = 
--			{
--				
--				{type = 0, id = 816, count = 2, quality = 0, strong = 0, bind = 1},--声望卷 X 2
--				{type = 0, id = 641, count = 10, quality = 0, strong = 0, bind = 1},--2级血炼石 X 10	
--				{type = 0, id = 538, count = 1, quality = 0, strong = 0, bind = 1},--钻晶包 X1	
--				{type = 0, id = 527, count = 1, quality = 0, strong = 0, bind = 1},--特戒结晶 X 1	
--			},
--		},
--		--霸主大礼包--预计价值400元
--		{
--			type = 2,
--			money = 18888,
--			items = 
--			{
--			        {type = 0, id = 817, count = 2, quality = 0, strong = 0, bind = 1},--高级声望卷 X 2
--				{type = 0, id = 643, count = 10, quality = 0, strong = 0, bind = 1},--4级血炼石 X 10		
--				{type = 0, id = 538, count = 2, quality = 0, strong = 0, bind = 1},--钻晶包 X2	
--				{type = 0, id = 527, count = 10, quality = 0, strong = 0, bind = 1},--特戒结晶 X 10	
--			},
--		},
--		--主宰大礼包--预计价值2千元
--		{
--			type = 3,
--			money = 38888,
--			items = 
--			{
--				{type = 0, id = 836, count = 2, quality = 0, strong = 0, bind = 1},--超级声望卷 X 2	
--				{type = 0, id = 645, count = 10, quality = 0, strong = 0, bind = 1},--6级血炼石 X 10	
--				{type = 0, id = 538, count = 5, quality = 0, strong = 0, bind = 1},--钻晶包 X 5	
--				{type = 0, id = 527, count = 30, quality = 0, strong = 0, bind = 1},--特戒结晶 X 30	 
--			},
--		},	
--		--主宰大礼包--预计价值2千元
--		{
--			type = 4,
--			money = 88888,
--			items = 
--			{
--				{type = 0, id = 836, count = 5, quality = 0, strong = 0, bind = 1},--超级声望卷 X 5	
--				{type = 0, id = 647, count = 10, quality = 0, strong = 0, bind = 1},--8级血炼石 X 10	
--				{type = 0, id = 538, count = 10, quality = 0, strong = 0, bind = 1},--钻晶包 X 10	
--				{type = 0, id = 527, count = 50, quality = 0, strong = 0, bind = 1},--特戒结晶 X 50	 
--			},
--		},			
	},
	
	--合区抽奖
	Lottery = 
	{
		needScore = 50,
		items = 
		{
--			{
--				{type = 0, id = 936, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 1725},--金刚石---------7
--				{type = 0, id = 934, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 240},--超级祝福油-----1
--				{type = 0, id = 937, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 970},--10颗金刚石-----4
--				{type = 0, id = 528, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 480},--紫晶石----------2
--				{type = 0, id = 543, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 1460},--转生修为丹------6
--				{type = 0, id = 645, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 730},--6级血炼石------3
--				{type = 0, id = 530, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 1460},--盾灵卷轴-------6
--				{type = 0, id = 687, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 1725},--升级石碎片-----7
--				{type = 0, id = 642, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 1210},--3级血炼石------5
--			},
--			{
--			        {type = 0, id = 934, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 150},--超级祝福油-----1
--				{type = 0, id = 529, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 600},--绿晶石----------2
--				{type = 0, id = 816, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 1530},--声望卷---------5
--				{type = 0, id = 699, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 1200},--1级升级石------4
--				{type = 0, id = 643, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 900},--4级血炼石------3
--				{type = 0, id = 527, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 1600},--特戒结晶-------5
--				{type = 0, id = 543, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 1600},--转生修为丹------5
--				{type = 0, id = 646, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 600},--7级血炼石------2
--				{type = 0, id = 936, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 1820},--金刚石---------6
--			},
--			{
--				{type = 0, id = 687, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 1955},--升级石碎片------6
--				{type = 0, id = 676, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 1290},--超级经验丹------4
--				{type = 0, id = 688, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 320},--勋章之心---------1
--				{type = 0, id = 937, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 960},--10颗金刚石------3
--				{type = 0, id = 700, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 640},--2级升级石-------2
--				{type = 0, id = 529, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 640},--绿晶石-----------2
--				{type = 0, id = 971, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 1955},--真元丹包--------6
--				{type = 0, id = 527, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 1600},--特戒结晶--------5
--				{type = 0, id = 647, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 640},--8级血炼石-------2
--			},
--			{
--				{type = 0, id = 699, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 1050},--1级升级石-------3
--				{type = 0, id = 937, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 1400},--10颗金刚石------4
--				{type = 0, id = 689, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 350},--蚩尤之角---------1
--				{type = 0, id = 644, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 1050},--5级血炼石-------3
--				{type = 0, id = 543, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 1500},--转生修为丹-------4
--				{type = 0, id = 530, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 1500},--盾灵卷轴--------4
--				{type = 0, id = 528, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 700},--紫晶石-----------2
--				{type = 0, id = 648, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 700},--9级血炼石-------2
--				{type = 0, id = 936, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 1750},--金刚石----------5
--			},
--			{
--				{type = 0, id = 538, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 1050},--钻晶包-----------3
--				{type = 0, id = 562, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 1500},--高级圣魂丹------4
--				{type = 0, id = 651, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 700},--12级血炼石--------2
--				{type = 0, id = 528, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 700},--紫晶石------------2
--				{type = 0, id = 687, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 1750},--升级石碎片-------5
--				{type = 0, id = 934, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 350},--超级祝福油-------1
--				{type = 0, id = 971, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 1750},--真元丹包---------5
--				{type = 0, id = 643, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 1500},--4级血炼石--------4
--				{type = 0, id = 529, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 700},--绿晶石------------2
--			},
--			{
--				{type = 0, id = 937, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 1570},--10颗金刚石-------5
--				{type = 0, id = 563, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 900},--超级圣魂丹-------3
--				{type = 0, id = 650, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 600},--11级血炼石--------2
--				{type = 0, id = 529, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 600},--绿晶石------------2
--				{type = 0, id = 543, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 1500},--转生修为丹--------5
--				{type = 0, id = 971, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 1910},--真元丹包---------6
--				{type = 0, id = 644, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 1200},--5级血炼石--------4
--				{type = 0, id = 700, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 150},--2级升级石-------1
--				{type = 0, id = 816, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 1570},--声望卷-----------5
--			},
--			{
--				{type = 0, id = 645, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 1300},--6级血炼石---------3
--				{type = 0, id = 530, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 1650},--盾灵卷轴----------4
--				{type = 0, id = 538, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 1200},--钻晶包-------------3
--				{type = 0, id = 688, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 800},--勋章之心-----------2
--				{type = 0, id = 563, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 150},--超级圣魂丹-------1
--				{type = 0, id = 700, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 800},--2级升级石---------2
--				{type = 0, id = 689, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 400},--蚩尤之角-----------1
--				{type = 0, id = 816, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 1700},--声望卷------------4
--				{type = 0, id = 936, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 2100},--金刚石------------5
--			},
--			{
--				{type = 0, id = 527, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 1480},--特戒结晶----------4
--				{type = 0, id = 538, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 1110},--钻晶包-------------3
--				{type = 0, id = 937, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 1120},--10颗金刚石--------3
--				{type = 0, id = 689, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 370},--蚩尤之角-----------1
--				{type = 0, id = 543, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 1480},--转生修为丹----------4
--				{type = 0, id = 936, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 1850},--金刚石-------------5
--				{type = 0, id = 648, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 740},--9级血炼石---------2
--				{type = 0, id = 529, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 740},--绿晶石-------------2
--				{type = 0, id = 699, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 1110},--1级升级石---------3
--			},
--			{
--				{type = 0, id = 528, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 740},--紫晶石-------------2
--				{type = 0, id = 971, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 1870},--真元丹包----------5
--				{type = 0, id = 836, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 1110},--超级声望卷----------3
--				{type = 0, id = 529, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 740},--绿晶石--------------2
--				{type = 0, id = 538, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 150},--钻晶包-----------1
--				{type = 0, id = 676, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 1210},--超级经验丹---------3
--				{type = 0, id = 700, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 740},--2级升级石----------2
--				{type = 0, id = 816, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 1580},--声望卷-------------4
--				{type = 0, id = 936, count = 1, quality = 0, strong = 0, bind = 0,nPersent = 1860},--金刚石-------------5
--			},
		},
	},
	
	--boss场景
	SceneInfo = 
	{
--		sceneId = 144,
--		needLevel = 75,
--		needCircle = 0,
	},
	
	CombineFirstPay = {
		{
			needPayMoney = 1000,
			items = 
			{
				-- {type = 0, id = 699, count = 1, quality = 0, strong = 0, bind = 1},--10万灵力丹*1
				-- {type = 0, id = 954, count = 1, quality = 0, strong = 0, bind = 1},--高级BOSS召唤卷 X 1
				-- {type = 0, id = 530, count = 1, quality = 0, strong = 0, bind = 1},--盾灵卷轴*1
				-- {type = 0, id = 519, count = 1, quality = 0, strong = 0, bind = 1},--500绑定元宝*1
				-- {type = 0, id = 696, count = 1, quality = 0, strong = 0, bind = 1},--翅膀魂石宝箱 X 1
			},
		},
		{
			needPayMoney = 5000,
			items = 
			{
				-- {type = 0, id = 700, count = 1, quality = 0, strong = 0, bind = 1},--20万灵力丹*1
				-- {type = 0, id = 954, count = 1, quality = 0, strong = 0, bind = 1},--高级BOSS召唤卷 X 1	
				-- {type = 0, id = 530, count = 1, quality = 0, strong = 0, bind = 1},--盾灵卷轴*1
				-- {type = 0, id = 451, count = 1, quality = 0, strong = 0, bind = 1},--灵宠卷轴*1
				-- {type = 0, id = 696, count = 2, quality = 0, strong = 0, bind = 1},--翅膀魂石宝箱 X 2				
			},
		},
		{
			needPayMoney = 10000,
			items = 
			{
				-- {type = 0, id = 701, count = 1, quality = 0, strong = 0, bind = 1},--50万灵力丹*1
				-- {type = 0, id = 954, count = 2, quality = 0, strong = 0, bind = 1},--高级BOSS召唤卷 X 2	
				-- {type = 0, id = 451, count = 2, quality = 0, strong = 0, bind = 1},--灵宠卷轴*2
				-- {type = 0, id = 530, count = 2, quality = 0, strong = 0, bind = 1},--盾灵卷轴*2
				-- {type = 0, id = 696, count = 3, quality = 0, strong = 0, bind = 1},--翅膀魂石宝箱 X 3
			},
		},
	},
	
	-- 合服商店
	CombineShop = {
		-- 刷新物品扣除元宝
		refreshNeedYb = 68,
		
		-- 不能超过255个物品
		itemList = {
			-- {物品ID, 叠加数量, 原价(叠加后), 现价(叠加后)}
			-- { itemId = 527, count = 10, bind = 1, origPrice = 1000, curPrice = 800 },---特戒结晶*10
			-- { itemId = 520, count = 1, bind = 1, origPrice = 500, curPrice = 400 },--1000绑定元宝
			-- { itemId = 530, count = 1, bind = 1, origPrice = 1000, curPrice = 800 },--盾灵卷轴
			-- { itemId = 537, count = 10, bind = 1, origPrice = 1000, curPrice = 800 },--宝石结晶*10
			-- { itemId = 816, count = 10, bind = 1, origPrice = 1000, curPrice = 800 },--灵珠碎片*10
            --             { itemId = 562, count = 1, bind = 1, origPrice = 2000, curPrice = 1600 },--高级圣魂丹
			-- { itemId = 700, count = 1, bind = 1, origPrice = 1800, curPrice = 1440 },--20万灵力丹
			-- { itemId = 540, count = 1, bind = 1, origPrice = 498, curPrice = 400 },--历练卷轴
			-- { itemId = 542, count = 1, bind = 1, origPrice = 1000, curPrice = 800 },--转生修为丹小
			-- { itemId = 544, count = 1, bind = 1, origPrice = 6000, curPrice = 4800 },--转生修为丹大
			-- { itemId = 458, count = 1, bind = 1, origPrice = 800, curPrice = 640 },--狂暴之巅卷
			-- { itemId = 679, count = 10, bind = 1, origPrice = 1200, curPrice = 960 },--屠魔令*10
			-- { itemId = 812, count = 1, bind = 1, origPrice = 1888, curPrice = 1500 },--6倍押镖令
			-- { itemId = 693, count = 1, bind = 1, origPrice = 1800, curPrice = 1440 },--足迹4
			-- { itemId = 694, count = 1, bind = 1, origPrice = 3200, curPrice = 2560 },--足迹5
			-- { itemId = 695, count = 1, bind = 1, origPrice = 6800, curPrice = 5440 },--足迹6
			-- { itemId = 520, count = 1, bind = 1, origPrice = 500, curPrice = 400 },--1000绑定元宝
			-- { itemId = 509, count = 10, bind = 1, origPrice = 1780, curPrice = 1420 },--金条大*10
			-- { itemId = 541, count = 10, bind = 1, origPrice = 1000, curPrice = 800 },--精羽毛*10
			-- { itemId = 702, count = 1, bind = 1, origPrice = 9000, curPrice = 7200 },--100万灵力丹
			-- { itemId = 451, count = 1, bind = 1, origPrice = 1000, curPrice = 800 },--灵宠卷轴
			-- { itemId = 676, count = 10, bind = 1, origPrice = 5000, curPrice = 4000 },--超级经验丹*10
			-- { itemId = 536, count = 100, bind = 1, origPrice = 5000, curPrice = 4000 },--符魄盒大*100
			-- { itemId = 481, count = 10, bind = 1, origPrice = 2000, curPrice = 1600 },--高级经验珠*10
            --             { itemId = 527, count = 10, bind = 1, origPrice = 1000, curPrice = 800 },---特戒结晶*10
			-- { itemId = 520, count = 1, bind = 1, origPrice = 500, curPrice = 400 },--1000绑定元宝
			-- { itemId = 530, count = 1, bind = 1, origPrice = 1000, curPrice = 800 },--盾灵卷轴
			-- { itemId = 537, count = 10, bind = 1, origPrice = 1000, curPrice = 800 },--宝石结晶*10
			-- { itemId = 816, count = 10, bind = 1, origPrice = 1000, curPrice = 800 },--灵珠碎片*10
            --             { itemId = 562, count = 1, bind = 1, origPrice = 2000, curPrice = 1600 },--高级圣魂丹
			-- { itemId = 700, count = 1, bind = 1, origPrice = 1800, curPrice = 1440 },--20万灵力丹
			-- { itemId = 540, count = 1, bind = 1, origPrice = 498, curPrice = 400 },--历练卷轴
			-- { itemId = 542, count = 1, bind = 1, origPrice = 1000, curPrice = 800 },--转生修为丹小
			-- { itemId = 544, count = 1, bind = 1, origPrice = 6000, curPrice = 4800 },--转生修为丹大
			-- { itemId = 458, count = 1, bind = 1, origPrice = 800, curPrice = 640 },--狂暴之巅卷
			-- { itemId = 679, count = 10, bind = 1, origPrice = 1200, curPrice = 960 },--屠魔令*10
			-- { itemId = 812, count = 1, bind = 1, origPrice = 1888, curPrice = 1500 },--6倍押镖令
			-- { itemId = 693, count = 1, bind = 1, origPrice = 1800, curPrice = 1440 },--足迹4
			-- { itemId = 694, count = 1, bind = 1, origPrice = 3200, curPrice = 2560 },--足迹5
			-- { itemId = 695, count = 1, bind = 1, origPrice = 6800, curPrice = 5440 },--足迹6
			-- { itemId = 520, count = 1, bind = 1, origPrice = 500, curPrice = 400 },--1000绑定元宝
			-- { itemId = 509, count = 10, bind = 1, origPrice = 1780, curPrice = 1420 },--金条大*10
			-- { itemId = 541, count = 10, bind = 1, origPrice = 1000, curPrice = 800 },--精羽毛*10
			-- { itemId = 702, count = 1, bind = 1, origPrice = 9000, curPrice = 7200 },--100万灵力丹
			-- { itemId = 451, count = 1, bind = 1, origPrice = 1000, curPrice = 800 },--灵宠卷轴
			-- { itemId = 676, count = 10, bind = 1, origPrice = 5000, curPrice = 4000 },--超级经验丹*10
			-- { itemId = 536, count = 100, bind = 1, origPrice = 5000, curPrice = 4000 },--符魄盒大*100
			-- { itemId = 481, count = 10, bind = 1, origPrice = 2000, curPrice = 1600 },--高级经验珠*10
			-- { itemId = 687, count = 5, bind = 1, origPrice = 2995, curPrice = 2596 },--翅膀魂石（攻）*5
			-- { itemId = 688, count = 5, bind = 1, origPrice = 2995, curPrice = 2596 },--翅膀魂石（防）*5
			-- { itemId = 689, count = 5, bind = 1, origPrice = 2995, curPrice = 2596 },--翅膀魂石（血）*5
		},
	},
}