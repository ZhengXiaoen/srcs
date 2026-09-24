--BUFF道具配置表
--因为某些BUFF涉及到活动引用 用于判断是否有重复BUFF组

local AtvExpBuffGroups = {130,}		  --活动经验BUFF组表 	--用于区分活动BUFF 防止重叠
local AtvXiuWeiBuffGroups = {130,}	--活动修为BUFF组表	--用于区分活动BUFF 防止重叠

--常规BUFF道具 <修改需要程序支持>
AddBuffItems = 
{
	{item_id = 1562, buffType= 83, value=1, buffGroup= 85,times =1,interval= 3600,needDelete =true,timeOverlay =true,buffName = "",},  --pk保护的物品，复活符
	{item_id = 1669, buffType= 15, value=100, buffGroup= 86,times =1,interval= 10,needDelete =true,timeOverlay =true,buffName = "",},
}


--经验丹
AddExpBuffItems = 
{
	{item_id = 1440, buffType= 71, value=1, buffGroup= 84,times =1,interval= 3600,needDelete =true,timeOverlay =true,buffName = "",},
	{item_id = 1588, buffType= 71, value=0.5, buffGroup= 83,times =1,interval= 3600,needDelete =true,timeOverlay =true,buffName = "",},
	{item_id = 2092, buffType= 71, value=0.2, buffGroup= 96,times =1,interval= 3600,needDelete =true,timeOverlay =true,buffName = "",},
	{item_id = 2163, buffType= 71, value=1.5, buffGroup= 98,times =1,interval= 3600,needDelete =true,timeOverlay =true,buffName = "",},
	{item_id = 2164, buffType= 71, value=2.0, buffGroup= 99,times =1,interval= 3600,needDelete =true,timeOverlay =true,buffName = "",},
}

--修为丹
AddXiuWeiBuffItems = 
{
	{item_id = 1441, buffType= 67, value=15, buffGroup= 84,times =1,interval= 3600,needDelete =true,timeOverlay =true,buffName = "",},
}

--擂台篝火BUFF道具
AddWineBuffItems =
{
	{
		item_id = 2308,
		needDelete =true,
		buff =
		{
			{buffType= 92, value=0.8, buffGroup= 104,times =1,interval= 3600,timeOverlay =true,buffName = "",},
			{buffType= 93, value=0.8, buffGroup= 104,times =1,interval= 3600,timeOverlay =true,buffName = "",},
		}
	},
	{
		item_id = 2309,
		needDelete =true,
		buff =
		{
			{buffType= 92, value=1.3, buffGroup= 105,times =1,interval= 3600,timeOverlay =true,buffName = "",},
			{buffType= 93, value=1.3, buffGroup= 105,times =1,interval= 3600,timeOverlay =true,buffName = "",},
		}
	},
	{
		item_id = 2310,
		needDelete =true,
		buff =
		{
			{buffType= 92, value=1.8, buffGroup= 106,times =1,interval= 3600,timeOverlay =true,buffName = "",},
			{buffType= 93, value=1.8, buffGroup= 106,times =1,interval= 3600,timeOverlay =true,buffName = "",},
		}
	},
}