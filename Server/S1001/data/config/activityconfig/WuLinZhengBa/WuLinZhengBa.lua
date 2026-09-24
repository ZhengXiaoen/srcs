--lua script
--#include "data\language\LangCode.txt" once   --语言包

--武林争霸

WuLinZhengBaConfig = 
{
	minLevel = 70,				--高级武林争霸赛参加的最低等级
	
	lastTime = 1800,			--单位秒 活动持续时间

	lowSceenId = 80,			--争霸赛的场景id

	wMapX = {33,60},				--进入的x坐标
	wMapY = {23,51},				--进入的y坐标

	outSceenId = 9,				--退出的争霸赛的场景id
	outMapX = {134,145},			--退出的x坐标
	outMapY = {156,172},			--退出的y坐标
	
	RankName = "WuLinZhengBa",		--保存的武林争霸信息
	RankTxt = "WuLinZhengBaConfig.txt",	--保存到的文件名

	titleId = 26,				--武林盟主的称号id

	RankColumn = 	--排行榜列标题表
	{
		{columnName = "name", ShowFlag = 0}, 	--姓名
		{columnName = "state", ShowFlag = 0},	--状态
	},

		--[[
		qatEquipment=0,             //物品或者装备
		qatXiuwei = 1,	            //修为
		qatExp = 2,                	//角色经验值
		qatGuildContribution = 3,	//帮派贡献值
		qatZYContribution = 4,		//阵营贡献
		qatBindMoney = 5,           //绑定银两
		qatMoney = 6,	            //银两
		qatBindYb = 7,	            //绑定元宝
		qatTitle = 8,	            //称谓
		qatSkill = 9,	            //技能
		qatZhanhun = 10,	        //战魂
		qatAchievePoint =11,        //成就点
		qatRenown=12,                //声望
		qatPet =13,                  //奖励宠物
		qatActivity = 14,			//奖励活跃度
		qatYuanbao =15,              //元宝
		qatGuildFr = 16,			//繁荣度
		qatGuildYs = 17,			//玥石	
		qatXPVal=18,				// XP值	
		qatCombatScore = 19,		//竞技积分
		qatAddExp = 20,				//按经验配置表加经验 id:奖励库ID count:普通加成率 quality:vip加成率 加成率使用以1000为基数的整形 即n/1000
		qatHonor = 21,				//荣誉
	]]
	
	--每过5分钟发放一次奖励

	LoopTime = 3 * 60 * 1000,		--单位为毫秒
	
	Awards = 
	{
		--第一个5分钟
		{
			--绑定元宝
			{ type = 7, id = 0, count = 5, strong = 0, quality = 0, bind = 1 },			
			--荣誉
			{ type = 21, id = 0, count = 727, strong = 0, quality = 0, bind = 1 },	 
		},
		
		--第二个5分钟
		{
			--绑定元宝
			{ type = 7, id = 0, count = 11, strong = 0, quality = 0, bind = 1 },			
			--荣誉
			{ type = 21, id = 0, count = 1455, strong = 0, quality = 0, bind = 1 },	 
		},

		--第三个5分钟
		{
			--绑定元宝
			{ type = 7, id = 0, count = 16, strong = 0, quality = 0, bind = 1 },			
			--荣誉
			{ type = 21, id = 0, count = 2182, strong = 0, quality = 0, bind = 1 },	
		},

		--第四个5分钟
		{
			--绑定元宝
			{ type = 7, id = 0, count = 22, strong = 0, quality = 0, bind = 1 },			
			--荣誉
			{ type = 21, id = 0, count = 2909, strong = 0, quality = 0, bind = 1 },	 
		},

		--第五个5分钟
		{
			--绑定元宝
			{ type = 7, id = 0, count = 27, strong = 0, quality = 0, bind = 1 },			
			--荣誉
			{ type = 21, id = 0, count = 3636, strong = 0, quality = 0, bind = 1 },	 
		},

		--第六个5分钟
		{
			--绑定元宝
			{ type = 7, id = 0, count = 33, strong = 0, quality = 0, bind = 1 },			
			--荣誉
			{ type = 21, id = 0, count = 4364, strong = 0, quality = 0, bind = 1 },	 
		},

		--第七个5分钟
		{
			--绑定元宝
			{ type = 7, id = 0, count = 38, strong = 0, quality = 0, bind = 1 },			
			--荣誉
			{ type = 21, id = 0, count = 5091, strong = 0, quality = 0, bind = 1 },	
		},

		--第八个5分钟
		{
			--绑定元宝
			{ type = 7, id = 0, count = 44, strong = 0, quality = 0, bind = 1 },			
			--荣誉
			{ type = 21, id = 0, count = 5818, strong = 0, quality = 0, bind = 1 },	
		},

		--第九个5分钟
		{
			--绑定元宝
			{ type = 7, id = 0, count = 49, strong = 0, quality = 0, bind = 1 },			
			--荣誉
			{ type = 21, id = 0, count = 6545, strong = 0, quality = 0, bind = 1 },	
		},

		--第十个5分钟
		{
			--绑定元宝
			{ type = 7, id = 0, count = 55, strong = 0, quality = 0, bind = 1 },			
			--荣誉
			{ type = 21, id = 0, count = 7273, strong = 0, quality = 0, bind = 1 },	
		},
--[[
		--第十一个5分钟
		{
			--绑定元宝
			{ type = 7, id = 0, count = 50, strong = 0, quality = 0, bind = 1 },			
			--荣誉
			{ type = 21, id = 0, count = 700, strong = 0, quality = 0, bind = 1 },	
		},
]]
	},
	
	--奖励武林盟主
	awardsMaster =
	{
		-- --5000万经验券
		-- { type = 0, id = 590, count = 1, strong = 0, quality = 0, bind = 0 },	
		--元宝1000
		{ type = 15, id = 0, count = 1000, strong = 0, quality = 0, bind = 0 },	

	},
	
	fRate = 0.1,

	--所有属性加成10%
	MasterBuff =
	{

	},

	--2倍打怪经验增加
	AddBuff = 
	{
		{buffType= 64, value=1, buffGroup= 205,times =-1,interval= 21,needDelete = true,timeOverlay = true,buffName = Lang.Activity.w00026,}, 
	}
}

