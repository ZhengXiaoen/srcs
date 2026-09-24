--脚本用到的定时执行的一些逻辑的配置
--比如定时发公告，定时执行脚本
--month表示月份，{}表示匹配所有,其他有效范围是[1,12],比如1月3月执行用{1,3}
--day表示一个月的哪天有效，{}表示匹配所有,其他有效范围是[1,31]，1日和3日用{1,3}
--week就是一个星期的哪几天有效，{}表示匹配所有，其他有效范围是[0,6]注意周日是0，1表示周1,比如周1和周日执行就是{1,0}
--hour 表示那个时间点,{}表示匹配所有，其他有效范围是[0,23]，比如1点和3点,5点执行就是{1,3,5}
--minute 表示是哪个分钟，{}空表示所有，那么每分钟都将执行,{0,1,2}表示0,1,2分执行，有效范围[0,59]
--npcid 如果0表示全局NPC执行回调函数，大于0表示在npc的ID下执行回调函数
--npcFunc表示在该npc身上执行的函数，支持带参数的，单数一,分隔，比如TestBroadCast,1,2,"ss"之类的
--openserverdays 开服的第几天可用
--notopenserverdays ={1,2,3}表示开服的第1 ，2,3天不能用，其他时间都可以用
--combineserverdays 合服第几天可用
--notcombineserverdays 表示合服第几天不可用
--beforeCombineday 合服前第几天可用
--notBeforeCombineday 表示合服前第几天不可用

--！！Note2 因为实现方式的限制，一个括号里只能最多容纳8个，如果有特殊情况超过8个，请分2个来配置

--[[
	--自动执行公告函数
	tipsType: 公告类型 (1世界公告，2场景公告，3阵营公告)
	
	nLocation:
		显示的位置：如果是右侧提示栏是1，屏幕中央是2，如果2个地方都要显示就填3
		ttTipmsgWindow =1, //只在右侧提示栏显示
		ttScreenCenter=2, //屏幕中央，用于xxx把xxx强化到6级之类的全服公告
		ttDialog =4,      //弹出框
		ttBroadcast =8,  //公告栏，用于GM发通知
		ttMessage = 16,	//短消息，在屏幕中央悬挂，点击后查看内容，
		ttWarmTip  =32,   //温馨提示
		ttGmTip = 64,	// Gm提示信息
		ttChatWindow =128, //左侧聊天栏里，用于一些系统公告在聊天栏显示
	
	nTargetParam:	 目标参数 (例如：阵营公告时填入阵营ID，场景公告时填入场景ID) 无用则置-1
	
	nLevel:          接收这个消息的最低等级
	
	noticeIndex:	 为表 NoticeMsg中的项号
	
	
	...：提示参数
	
	NoticeAutoRun(tipsType,nLocation,nTargetParam,nLevel,noticeIndex,...)
	
	------------------
	--自动刷怪函数 
	index为表 CreateMonster中的组号
	bRand:	是否进行随机刷怪 会在组中随机选择一个进行刷怪 1不随机 否则随机
	CreateMonstersAutoRun(index,bRand)
	----------------------
	--刷怪加公告函数 
	tipsType: 公告类型 (1世界公告，2场景公告，3阵营公告)
	nLocation: 
	nParam:	 额外参数 (例如：阵营公告时填入阵营ID，场景公告时填入场景ID)
	noticeIndex: 为表 NoticeMsg中的项号
	mobIndex: 为表 CreateMonster中的项号
	bRand:	是否进行随机刷怪	1不随机 否则随机
	CreateMonstersAndNoticeAutoRun(tipsType,nLocation,nParam,noticeIndex,mobIndex,bRand)
	
	-----------------------
	--注册定时 刷怪加公告函数 
	--
	nInterval：执行间隔
	nTimes：执行次数
	tipsType: 公告类型 (1世界公告，2场景公告，3阵营公告)
	tipmsgID: 提示的ID (填0)
	nParam:	 额外参数 (例如：阵营公告时填入阵营ID，场景公告时填入场景ID)
	noticeIndex: 为表 NoticeMsg中的项号
	mobIndex: 为表 CreateMonster中的项号
	bRand:	是否进行随机刷怪
	RegCreateMonstersAndNoticeAutoRun(nInterval, nTimes, tipsType,tipmsgID,nParam,noticeIndex,mobIndex,bRand)
	
	--活动开启提示公告函数
	--configId 配置的ID
	--index    活动的第几场，0表示第1场，1表示第2场
	OnActivityTipsFunc(configId,index)
	--活动开启提示公告函数（跨服版） 需放到--跨服服务器配置下
	--configId 配置的ID
	--index    活动的第几场，默认0，表示按名字去查找配置，如果有多场，1表示第1场，2表示第2场
	OnActivityTipsFuncCs(configId,index)
--]]
--#ifndef _COMMON_SERVER_
--普通逻辑服配置
TimerConfig=
{

	
	--土城刷经验猪1	
	--{ month={},day={},week={},hour={12},minute ={15},second={0},npcScene="sys",npcName="function",npcFunc= "StartExpPigActivityNotice"}, --开始预告
	--{ month={},day={},week={},hour={12},minute ={20},second={0},npcScene="sys",npcName="function",npcFunc= "StartExpPigActivity"}, --正式开始
	--{ month={},day={},week={},hour={12},minute ={35},second={0},npcScene="sys",npcName="function",npcFunc= "EndExpPigActivityNotice"}, --结束预告
	--{ month={},day={},week={},hour={12},minute ={40},second={0},npcScene="sys",npcName="function",npcFunc= "EndExpPigActivity"}, --结束
        --土城刷经验猪2	
	--{ month={},day={},week={},hour={16},minute ={0},second={0},npcScene="sys",npcName="function",npcFunc= "StartExpPigActivityNotice"}, --开始预告
	--{ month={},day={},week={},hour={16},minute ={5},second={0},npcScene="sys",npcName="function",npcFunc= "StartExpPigActivity"}, --正式开始
	--{ month={},day={},week={},hour={16},minute ={20},second={0},npcScene="sys",npcName="function",npcFunc= "EndExpPigActivityNotice"}, --结束预告
	--{ month={},day={},week={},hour={16},minute ={25},second={0},npcScene="sys",npcName="function",npcFunc= "EndExpPigActivity"}, --结束
	--土城刷经验猪3	
	--{ month={},day={},week={},hour={23},minute ={35},second={0},npcScene="sys",npcName="function",npcFunc= "StartExpPigActivityNotice"}, --开始预告
	--{ month={},day={},week={},hour={23},minute ={40},second={0},npcScene="sys",npcName="function",npcFunc= "StartExpPigActivity"}, --正式开始
	--{ month={},day={},week={},hour={23},minute ={54},second={0},npcScene="sys",npcName="function",npcFunc= "EndExpPigActivityNotice"}, --结束预告
	--{ month={},day={},week={},hour={23},minute ={59},second={0},npcScene="sys",npcName="function",npcFunc= "EndExpPigActivity"}, --结束
	
	--{ month={},day={},week={},hour={11},minute ={3},npcScene="sys",npcName="function",npcFunc= "WuLinZhengBaNotice"},	--武林争霸开始预告
	--{ month={},day={},week={},hour={10},minute ={46},npcScene=Lang.SceneName.s00058,npcName=Lang.EntityName.n00267,npcFunc= "StartWuLinZhengBa"}, --活动开始
	--{ month={},day={},week={},hour={16},minute ={10},npcScene=Lang.SceneName.s00058,npcName=Lang.EntityName.n00267,npcFunc= "OnWuLinZhengBaTenMin"}, --开始10分钟不能进入
	--{ month={},day={},week={},hour={16},minute ={30},npcScene=Lang.SceneName.s00058,npcName=Lang.EntityName.n00267,npcFunc= "EndWuLinZhengBa"},	--活动结束

	--八卦连环阵
	--{ month={},day={},week={},hour={16},minute ={25},second={0},npcid=218,npcScene="sys",npcName="function",npcFunc= "OpenNotice"},
	--{ month={},day={},week={},hour={16},minute ={30},second={0},npcid=218,npcScene="sys",npcName="function",npcFunc= "StartBaGuaSerial"},
	--{ month={},day={},week={},hour={17},minute ={55},second={0},npcid=218,npcScene="sys",npcName="function",npcFunc= "EndNotice"},
	--{ month={},day={},week={},hour={18},minute ={0},second={0},npcid=218,npcScene="sys",npcName="function",npcFunc= "EndBaGuaSerial"},

	--夺宝奇兵
	--{ month={},day={},week={},hour={22},minute ={25},second={0},npcScene="sys",npcName="function",npcFunc= "StartQiBingDuoBaoFuncrNotice"},	  --夺宝奇兵预告
	--{ month={},day={},week={},hour={22},minute ={30},second={0},npcid=272,npcScene="sys",npcName="function",npcFunc= "OnStartQiBingDuoBaoFunc"}, --夺宝奇兵开启
	--{ month={},day={},week={},hour={23},minute ={25},second={0},npcScene="sys",npcName="function",npcFunc= "EndQiBingDuoBaoFuncrNotice"},	  --夺宝奇兵结束预告
	--{ month={},day={},week={},hour={23},minute ={30},second={0},npcid=272,npcScene="sys",npcName="function",npcFunc= "OnEndQiBingDuoBaoFunc"},	  --夺宝奇兵结束


--	--春节活动抽奖前五分钟的提示
--	{month={1},day={30},week={},hour={17},minute ={55},second={0},npcid="sys",npcFunc= "ActivityNotice,5"},			--18:00 抽取30名玩家，每位奖励100万绑金
--	{month={1},day={30},week={},hour={19},minute ={55},second={0},npcid="sys",npcFunc= "ActivityNotice,4"},			--20:00 抽取20位玩家，每位奖励500万绑金
--	{month={1},day={30},week={},hour={21},minute ={55},second={0},npcid="sys",npcFunc= "ActivityNotice,3"},			--22:00 抽取 10位玩家，每位奖励5000绑定元宝
--	{month={1},day={30},week={},hour={23},minute ={23},second={0},npcid="sys",npcFunc= "ActivityNotice,2"},	--23:08  23:28  23:48 每次抽取5位玩家，每位奖励 5000元宝
--	{month={1},day={30},week={},hour={23},minute ={55},second={0},npcid="sys",npcFunc= "ActivityNotice,1"},			--00:00 抽取1位玩家，每位奖励10000元宝和“幸运星”称号
--	--春节活动,热热闹闹齐欢聚抽奖,			--最后的参数标志\data\config\activity\RatherActivitityConfig.lua 文件里的ActivitiesLuckDraw数组里面的索引
--	{month={1},day={30},week={},hour={18},minute ={0},second={0},npcid="sys",npcFunc= "ActivityLuckDraw,5"},		--18:00 抽取30名玩家，每位奖励100万绑金
--	{month={1},day={30},week={},hour={20},minute ={0},second={0},npcid="sys",npcFunc= "ActivityLuckDraw,4"},		--20:00 抽取20位玩家，每位奖励500万绑金
--	{month={1},day={30},week={},hour={22},minute ={0},second={0},npcid="sys",npcFunc= "ActivityLuckDraw,3"},		--22:00 抽取 10位玩家，每位奖励5000绑定元宝
--	{month={1},day={30},week={},hour={23},minute ={28},second={0},npcid="sys",npcFunc= "ActivityLuckDraw,2"},	--23:08  23:28  23:48 每次抽取5位玩家，每位奖励 5000元宝
--	{month={1},day={31},week={},hour={0},minute ={0},second={0},npcid="sys",npcFunc= "ActivityLuckDraw,1"},			--00:00 抽取1位玩家，每位奖励10000元宝和“幸运星”称号
--	--春节活动,热热闹闹齐欢聚加经验			*****小明同学,加了一个参数,这个是类型,2是经验****
--	--{month={1},day={30},week={},hour={0},minute ={0},second={0},npcid="sys",npcFunc= "ActivityStart,2,18000"},--活动期间，土城安全区每1秒增加玩家XXXX点经验
--	--{month={2},day={19},week={},hour={0},minute ={0},second={0},npcid="sys",npcFunc= "ActivityEnd"},--结束活动


	
	--{ month={},day={},week={},hour={19},minute ={5},second={0},npcScene="sys",npcName="function",npcFunc= "startLingShouNotice"},	--灵兽献瑞开始预告
	--{ month={},day={},week={},hour={19},minute ={10},second={0},npcid=283,npcFunc= "startLingShou"},				--开启灵兽献瑞
	--{ month={},day={},week={},hour={19},minute ={25},second={0},npcScene="sys",npcName="function",npcFunc= "endLingShouNotice"},	--灵兽献瑞结束预告
	--{ month={},day={},week={},hour={19},minute ={30},second={0},npcid=283,npcFunc= "endLingShou"},					--结束灵兽献瑞

--	{ month={},day={},week={},hour={16},minute ={20},npcScene="sys",npcName="function",npcFunc= "OnActivityTipsFunc,2,0"},		--PK挑战
	--{ month={},day={},week={},hour={19},minute ={0},npcScene="sys",npcName="function",npcFunc= "OnActivityTipsFunc,3,0"},		--玫瑰争夺战
--	{ month={},day={},week={},hour={14},minute ={30},npcScene="sys",npcName="function",npcFunc= "OnActivityTipsFunc,4,0"},		--勇士角斗场
--	{ month={},day={},week={},hour={18},minute ={0},npcScene="sys",npcName="function",npcFunc= "OnActivityTipsFunc,5,0"},		--魔幻星宫
--	{ month={},day={},week={},hour={16},minute ={0},npcScene="sys",npcName="function",npcFunc= "OnActivityTipsFunc,6,0"},		--战神争霸
--	{ month={},day={},week={},hour={12},minute ={30},npcScene="sys",npcName="function",npcFunc= "OnActivityTipsFunc,7,0"},		--行会争夺战
--	{ month={},day={},week={},hour={0},minute ={0},npcScene="sys",npcName="function",npcFunc= "OnActivityTipsFunc,8,1"},		--土城抗魔
--	{ month={},day={},week={},hour={11},minute ={0},npcScene="sys",npcName="function",npcFunc= "OnActivityTipsFunc,8,2"},		--土城抗魔
--	{ month={},day={},week={},hour={17},minute ={0},npcScene="sys",npcName="function",npcFunc= "OnActivityTipsFunc,8,3"},		--土城抗魔
--	{ month={},day={},week={},hour={15},minute ={30},npcScene="sys",npcName="function",npcFunc= "OnActivityTipsFunc,9,0"},		--热血赛马
--	{ month={},day={},week={},hour={13},minute ={40},npcScene="sys",npcName="function",npcFunc= "OnActivityTipsFunc,10,0"},		--太虚灵泉
--	{ month={},day={},week={},hour={16},minute ={30},npcScene="sys",npcName="function",npcFunc= "OnActivityTipsFunc,11,0"},		--双倍护送
	
--	{ month={},day={},week={},hour={12},minute ={0},npcScene="sys",npcName="function",npcFunc= "OnActivityTipsFunc,13,0"},		--智力答题
--	{ month={},day={},week={2,4},hour={18},minute ={30},npcScene="sys",npcName="function",npcFunc= "OnActivityTipsFunc,14,0"},	--战队竞技
--	{ month={},day={},week={},hour={12},minute ={10},npcScene="sys",notopenserverdays ={1,2,3},npcName="function",npcFunc= "OnActivityTipsFunc,15,0"},	--双倍膜拜
--	{ month={},day={},week={6},hour={18},minute ={30},npcScene="sys",npcName="function",npcFunc= "OnActivityTipsFunc,16,0"},	--狩猎大会
--	{ month={},day={},week={},hour={11},minute ={30},npcScene="sys",npcName="function",npcFunc= "OnActivityTipsFunc,17,1"},		--熔岩火龙
--	{ month={},day={},week={},hour={23},minute ={40},npcScene="sys",npcName="function",npcFunc= "OnActivityTipsFunc,17,2"},		--熔岩火龙
--	{ month={},day={},week={6},hour={22},minute ={20},npcScene="sys",npcName="function",npcFunc= "OnActivityTipsFunc,18,102"},		--跨服天下第一
--	{ month={},day={},week={2},hour={22},minute ={20},npcScene="sys",npcName="function",npcFunc= "OnActivityTipsFunc,19,103"},		--跨服BOSS
--	{ month={},day={},week={4},hour={20},minute ={0},npcScene="sys",npcName="function",npcFunc= "OnActivityTipsFunc,20,101"},		--跨服沙城
--	{ month={},day={},week={},hour={12},minute ={30},npcScene="sys",npcName="function",npcFunc= "OnActivityTipsFunc,21"},		--资源荒地
--	{ month={},day={},week={},hour={12},minute ={25},npcScene="sys",npcName="function",npcFunc= "PreStartResDesert"},		--资源荒地
--	{ month={},day={},week={},hour={12},minute ={30},npcScene="sys",npcName="function",npcFunc= "StartResDesert"},		--资源荒地
--	{ month={},day={},week={},hour={12},minute ={55},npcScene="sys",npcName="function",npcFunc= "PreEndResDesert"},		--资源荒地
--	{ month={},day={},week={},hour={13},minute ={0},npcScene="sys",npcName="function",npcFunc= "EndResDesert"},		--资源荒地	
--	{ month={},day={},week={},hour={0},minute ={0},npcScene="sys",npcName="function",npcFunc= "ClearResRank"},		--资源荒地 - 清除排行榜
	
	
	-- 降魔战场
	--[[ 暂时不开~
	{ month={},day={},week={},hour={14},minute ={0},second={0},npcScene="sys",npcName="function",npcFunc= "OnActivityTipsFunc,21,101"},		--跨服战场
	{month={},day={},week={},hour={14},minute={0},second={0},npcScene="sys",npcName="function",npcFunc= "CrossBattlefieldOpen"},	--跨服战场开启
	{month={},day={},week={},hour={23},minute={59},second={0},npcScene="sys",npcName="function",npcFunc= "CrossBattlefieldClose"},	--关闭跨服战场入口
	{month={},day={},week={},hour={23},minute={30},second={0},npcScene="sys",npcName="function",npcFunc= "CrossBattlefieldForbid"},	--关闭跨服战场报名
	--]]
	--每天刷新商城
--	{ month={},day={},week={},hour={12},minute ={0},openserverdays={},notopenserverdays ={},npcScene="sys",npcName="function",npcFunc= "refreshStore,2"},	--0元抢购
--	{ month={},day={},week={},hour={12},minute ={0},npcScene="sys",npcName="function",npcFunc= "refreshStore,3"},	--1元抢购
--	--{ month={},day={},week={},hour={0},minute ={1},npcScene="sys",npcName="function",npcFunc= "refreshStore,1"},     --限时抢购
--	{ month={},day={},week={},hour={0},minute ={1},notBeforeCombineday={1,2,3,4,5,6,7,8,9,10},npcScene="sys",npcName="function",npcFunc= "refreshStore,1"},     --限时抢购
--	{ month={},day={},week={},hour={0,2,4,6,8,10,12,14,16,18,20,22},minute ={1},beforeCombineday={1,2,3,4,5,6,7,8,9,10},npcScene="sys",npcName="function",npcFunc= "refreshStore,1"},     --限时抢购
	

--	--世界Boss
----异形魔尊 50 邪恶虫洞四层
--	{ month={},day={},week={},hour={14},minute ={45},npcScene="sys",npcName="function",npcFunc= "StartBossNotice,1,15"},	--15分钟倒计时
--	{ month={},day={},week={},hour={14},minute ={50},npcScene="sys",npcName="function",npcFunc= "StartBossNotice,1,10"},	--10分钟倒计时
--	{ month={},day={},week={},hour={14},minute ={55},npcScene="sys",npcName="function",npcFunc= "StartBossNotice,1,5"},	--5分钟倒计时
--	{ month={},day={},week={},hour={15},minute ={0},npcScene="sys",npcName="function",npcFunc= "FlushWorldBoss,1"},	--刷新时间
--	
--	
----熔岩火龙王 55 熔岩火龙洞（特殊地图）
--	{ month={},day={},week={},hour={22},minute ={45},npcScene="sys",npcName="function",npcFunc= "StartBossNotice,2,15"},	--15分钟倒计时
--	{ month={},day={},week={},hour={22},minute ={50},npcScene="sys",npcName="function",npcFunc= "StartBossNotice,2,10"},	--10分钟倒计时
--	{ month={},day={},week={},hour={22},minute ={55},npcScene="sys",npcName="function",npcFunc= "StartBossNotice,2,5"},	--5分钟倒计时
--	{ month={},day={},week={},hour={23},minute ={0},npcScene="sys",npcName="function",npcFunc= "FlushWorldBoss,2"},	---刷新时间
--	
--	
--	--火凤 60 熔岩森林四层
--	{ month={},day={},week={},hour={16},minute ={30},npcScene="sys",npcName="function",npcFunc= "StartBossNotice,3,15"},	--15分钟倒计时
--	{ month={},day={},week={},hour={16},minute ={35},npcScene="sys",npcName="function",npcFunc= "StartBossNotice,3,10"},	--10分钟倒计时
--	{ month={},day={},week={},hour={16},minute ={40},npcScene="sys",npcName="function",npcFunc= "StartBossNotice,3,5"},	--5分钟倒计时
--	{ month={},day={},week={},hour={16},minute ={45},npcScene="sys",npcName="function",npcFunc= "FlushWorldBoss,3"},	---刷新时间
--	
--		--冥轮王蛇 60 王城郊外
--	{ month={},day={},week={},hour={10},minute ={15},npcScene="sys",npcName="function",npcFunc= "StartBossNotice,4,15"},	--15分钟倒计时
--	{ month={},day={},week={},hour={10},minute ={20},npcScene="sys",npcName="function",npcFunc= "StartBossNotice,4,10"},	--10分钟倒计时
--	{ month={},day={},week={},hour={10},minute ={25},npcScene="sys",npcName="function",npcFunc= "StartBossNotice,4,5"},	--5分钟倒计时
--	{ month={},day={},week={},hour={10},minute ={30},npcScene="sys",npcName="function",npcFunc= "FlushWorldBoss,4"},	---刷新时间
--	
--		
--		--牛魔王 60 撼天城郊外
--	{ month={},day={},week={},hour={9},minute ={15},npcScene="sys",npcName="function",npcFunc= "StartBossNotice,5,15"},	--15分钟倒计时
--	{ month={},day={},week={},hour={9},minute ={20},npcScene="sys",npcName="function",npcFunc= "StartBossNotice,5,10"},	--10分钟倒计时
--	{ month={},day={},week={},hour={9},minute ={25},npcScene="sys",npcName="function",npcFunc= "StartBossNotice,5,5"},	--5分钟倒计时
--	{ month={},day={},week={},hour={9},minute ={30},npcScene="sys",npcName="function",npcFunc= "FlushWorldBoss,5"},	---刷新时间
--
--		--冰麒麟 60 蛮荒四层
--	{ month={},day={},week={},hour={18},minute ={45},npcScene="sys",npcName="function",npcFunc= "StartBossNotice,6,15"},	--15分钟倒计时
--	{ month={},day={},week={},hour={18},minute ={50},npcScene="sys",npcName="function",npcFunc= "StartBossNotice,6,10"},	--10分钟倒计时
--	{ month={},day={},week={},hour={18},minute ={55},npcScene="sys",npcName="function",npcFunc= "StartBossNotice,6,5"},	--5分钟倒计时
--	{ month={},day={},week={},hour={19},minute ={0},npcScene="sys",npcName="function",npcFunc= "FlushWorldBoss,6"},	---刷新时间
--
--		--冰骨魔龙 70 海底世界四层
--	{ month={},day={},week={},hour={13},minute ={00},npcScene="sys",npcName="function",npcFunc= "StartBossNotice,7,15"},	--15分钟倒计时
--	{ month={},day={},week={},hour={13},minute ={05},npcScene="sys",npcName="function",npcFunc= "StartBossNotice,7,10"},	--10分钟倒计时
--	{ month={},day={},week={},hour={13},minute ={10},npcScene="sys",npcName="function",npcFunc= "StartBossNotice,7,5"},	--5分钟倒计时
--	{ month={},day={},week={},hour={13},minute ={15},npcScene="sys",npcName="function",npcFunc= "FlushWorldBoss,7"},	---刷新时间
--
--	


--	--五倍经验的火开启
--	{ month={},day={},week={},hour={0,12,13,17,19,22,23},minute ={0},npcScene=Lang.SceneName.s00008,npcName=Lang.EntityName.n00051,npcFunc= "fiveExpFire"},

	--新区八天活动
	--第一天(练级达人)
	--{ month={},day={},week={},hour={23},minute ={0},second={0},openserverdays ={1},npcScene="sys",npcName="function",npcFunc= "EndLevelingActivty"},
	--第二天(第一神器)
	--{ month={},day={},week={},hour={23},minute ={0},second={0},openserverdays ={2},npcScene="sys",npcName="function",npcFunc= "EndFirstWeaponActivty"},
	--第三天(第一坐骑)
	--{ month={},day={},week={},hour={23},minute ={0},second={0},openserverdays ={3},npcScene="sys",npcName="function",npcFunc= "OnAccountRide"},
	--第四天(第一翅膀)
	--{ month={},day={},week={},hour={23},minute ={0},second={0},openserverdays ={4},npcScene="sys",npcName="function",npcFunc= "AccountSwingTpoicActivity"},
	--第五天(王城城主)
	--{ month={},day={},week={},hour={23},minute ={0},second={0},openserverdays ={5},npcScene="sys",npcName="function",npcFunc= "EndSbkTopicActivity"},
	--第六天(第一法宝)
	--{ month={},day={},week={},hour={23},minute ={0},second={0},openserverdays ={6},npcScene="sys",npcName="function",npcFunc= "OnAccountMagicTopicRank"},
	--第七天(第一佣兵)
	--{ month={},day={},week={},hour={23},minute ={0},second={0},openserverdays ={7},npcScene="sys",npcName="function",npcFunc= "OnAccountMercenarTopicRank"},
	--第八天(第一会员)
	--{ month={},day={},week={},hour={23},minute ={0},second={0},openserverdays ={8},npcScene="sys",npcName="function",npcFunc= "OnAccountVipTopicRank"},


	--PK挑战
	--{ month={},day={},week={},hour={22},minute ={25},npcScene=Lang.SceneName.s00008,npcName=Lang.EntityName.n00079,npcFunc= "ReadNotice"},		     --5分钟前公告
	--{ month={},day={},week={},hour={22},minute ={30},npcScene=Lang.SceneName.s00008,npcName=Lang.EntityName.n00079,npcFunc= "StartPKChallenge"},          --正式开始(包含开始公告)
	--{ month={},day={},week={},hour={23},minute ={5},npcScene=Lang.SceneName.s00008,npcName=Lang.EntityName.n00079,npcFunc= "EndPKChallenge"},	     --结束活动(包含结束公告)

--	--玫瑰争夺战
--	--{ month={},day={},week={},hour={18},minute ={55},npcScene=Lang.SceneName.s00008,npcName=Lang.EntityName.n00078,npcFunc= "ReadNotice"},		     --5分钟前公告
--	--{ month={},day={},week={},hour={19},minute ={0},npcScene=Lang.SceneName.s00008,npcName=Lang.EntityName.n00078,npcFunc= "StartRobRose"},          --正式开始(包含开始公告)
--	--{ month={},day={},week={},hour={19},minute ={30},npcScene=Lang.SceneName.s00008,npcName=Lang.EntityName.n00078,npcFunc= "OverRobRose"},	     --结束活动(包含结束公告)
--
--	--勇士角斗场
--	{ month={},day={},week={},hour={14},minute ={25},npcScene=Lang.SceneName.s00002,npcName=Lang.EntityName.n00014,npcFunc= "ArenaStartNotice"},	--开始前的预告
--	{ month={},day={},week={},hour={14},minute ={30},npcScene=Lang.SceneName.s00002,npcName=Lang.EntityName.n00014,npcFunc= "OnArenaStart"},	--活动开始
--	{ month={},day={},week={},hour={15},minute ={0},npcScene=Lang.SceneName.s00002,npcName=Lang.EntityName.n00014,npcFunc= "OnArenaEnd"},		--活动结束
--	{ month={},day={},week={},hour={14},minute ={35,45,55},npcScene=Lang.SceneName.s00002,npcName=Lang.EntityName.n00014,npcFunc= "CallArenaBoss"},	--活动开始5分钟召唤
--	--{ month={},day={},week={},hour={16},minute ={5},npcScene=Lang.SceneName.s00002,npcName=Lang.EntityName.n00014,npcFunc= "CallArenaBoss"},
--	{ month={},day={},week={},hour={3},minute ={0},npcScene=Lang.SceneName.s00002,npcName=Lang.EntityName.n00014,npcFunc= "SaveCultureToFile"},		--保存世界文明度文件
--
--	{ month={},day={},week={},hour={14},minute ={31},npcScene=Lang.SceneName.s00002,npcName=Lang.EntityName.n00014,npcFunc= "GiveExpToActor"},	--每过5秒开始给玩家经验
--	
--	--魔幻星空
--	{ month={},day={},week={},hour={17},minute ={55},npcScene="sys",npcName="function",npcFunc= "NoticeAutoRun,1,130,-1,1,1"},	--开始前的预告
--	{ month={},day={},week={},hour={18},minute ={0},npcScene=Lang.SceneName.s00008,npcName=Lang.EntityName.n00073,npcFunc= "StartMagicSky"},	--活动开始
--	{ month={},day={},week={},hour={20},minute ={0},npcScene=Lang.SceneName.s00008,npcName=Lang.EntityName.n00073,npcFunc= "OverMagicSky"},	--活动结束

	--战神争霸
	--{ month={},day={},week={},hour={10},minute ={45},npcScene=Lang.SceneName.s00058,npcName=Lang.EntityName.n00267,npcFunc= "WuLinZhengBaNotice"}, --开始前5分钟预告

	

--	--刷新消费排行
--	{ month={},day={},week={},hour={23},minute ={59},npcScene="sys",npcName="function",npcFunc= "YbConsumeRankFresh"},
--
--	--爬塔
--	{ month={},day={},week={},hour={0},minute ={1},npcScene="sys",npcName="function",npcFunc= "GivePaTaMasterAward"},
--	{ month={},day={},week={0},hour={23},minute ={59},npcScene="sys",npcName="function",npcFunc= "GivePaTaRankAward"},
--

	
--	--排行榜雕像
--	{ month={},day={},week={},hour={},minute ={57},npcScene="sys",npcName="function",npcFunc= "SaveCsRank"},		--保存跨服排行榜
--	{ month={},day={},week={},hour={},minute ={59},npcScene="sys",npcName="function",npcFunc= "LoadCsRank"},		--加载跨服排行榜
--	
--	--重置雕像数据
--	{ month={},day={},week={},hour={21},minute ={59},npcScene=Lang.SceneName.s00002,npcName=Lang.EntityName.n00084,npcFunc= "ResetWorshipData"},		--重置数据
--	{ month={},day={},week={},hour={12},minute ={5},notopenserverdays ={1,2,3},npcScene=Lang.SceneName.s00002,npcName=Lang.EntityName.n00084,npcFunc= "BroadWorshipTips"},			--双倍膜拜提前5分钟公告
--	{ month={},day={},week={},hour={12},minute ={10},notopenserverdays ={1,2,3},npcScene=Lang.SceneName.s00002,npcName=Lang.EntityName.n00084,npcFunc= "StartDoubleWorship"},	--双倍膜拜开启
--
--	--行会争夺战
--	{ month={},day={},week={},hour={12},minute ={25},npcScene=Lang.SceneName.s00003,npcName=Lang.EntityName.n00124,npcFunc= "GuildBattleNotice"},	--预告
--	{ month={},day={},week={},hour={12},minute ={30},npcScene=Lang.SceneName.s00003,npcName=Lang.EntityName.n00124,npcFunc= "StartGuildBattle"},	--开始
--	{ month={},day={},week={},hour={13},minute ={30},npcScene=Lang.SceneName.s00003,npcName=Lang.EntityName.n00124,npcFunc= "EndGuildBattle"},	--结束
--
--	--祈福头衔设置
--	{ month={},day={},week={1},hour={0},minute ={0},npcScene=Lang.SceneName.s00008,npcName=Lang.EntityName.n00095,npcFunc= "ResetRanking"},
--
--	--怪物攻城及鉴定宗师
--	{ month={},day={},week={},hour={10},minute ={50},notopenserverdays = {},npcScene=Lang.SceneName.s00008,npcName=Lang.EntityName.n00174,npcFunc= "IdentifyNotice,1"},		
--		--预告
--	{ month={},day={},week={},hour={10},minute ={55},notopenserverdays = {},npcScene=Lang.SceneName.s00008,npcName=Lang.EntityName.n00174,npcFunc= "IdentifyNotice,2"},		
--		--预告
--	{ month={},day={},week={},hour={11},minute ={0},notopenserverdays = {},npcScene=Lang.SceneName.s00008,npcName=Lang.EntityName.n00174,npcFunc= "StartIdentifyActivity"},		--活动开始
--	{ month={},day={},week={},hour={12},minute ={0},notopenserverdays = {},npcScene=Lang.SceneName.s00008,npcName=Lang.EntityName.n00174,npcFunc= "IdentifyActvityOver"},		--活动结束
--
--	{ month={},day={},week={},hour={16},minute ={50},notopenserverdays = {},npcScene=Lang.SceneName.s00008,npcName=Lang.EntityName.n00174,npcFunc= "IdentifyNotice,1"},		--预告
--	{ month={},day={},week={},hour={16},minute ={55},notopenserverdays = {},npcScene=Lang.SceneName.s00008,npcName=Lang.EntityName.n00174,npcFunc= "IdentifyNotice,2"},		--预告
--	{ month={},day={},week={},hour={17},minute ={0},notopenserverdays = {},npcScene=Lang.SceneName.s00008,npcName=Lang.EntityName.n00174,npcFunc= "StartIdentifyActivity"},		--活动开始
--	{ month={},day={},week={},hour={18},minute ={0},notopenserverdays = {},npcScene=Lang.SceneName.s00008,npcName=Lang.EntityName.n00174,npcFunc= "IdentifyActvityOver"},		--活动结束
--
--	{ month={},day={},week={},hour={23},minute ={50},notopenserverdays = {},npcScene=Lang.SceneName.s00008,npcName=Lang.EntityName.n00174,npcFunc= "IdentifyNotice,1"},		--预告
--	{ month={},day={},week={},hour={23},minute ={55},notopenserverdays = {},npcScene=Lang.SceneName.s00008,npcName=Lang.EntityName.n00174,npcFunc= "IdentifyNotice,2"},		--预告
--	{ month={},day={},week={},hour={0},minute ={0},notopenserverdays = {},npcScene=Lang.SceneName.s00008,npcName=Lang.EntityName.n00174,npcFunc= "StartIdentifyActivity"},		--活动开始
--	{ month={},day={},week={},hour={1},minute ={0},notopenserverdays = {},npcScene=Lang.SceneName.s00008,npcName=Lang.EntityName.n00174,npcFunc= "IdentifyActvityOver"},		--活动结束
--
--
--	--第一天 练级狂人（烟花）
--	{ month={},day={},week={},hour={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22},minute ={5},openserverdays={1},notopenserverdays ={},npcScene="sys",npcName="function",npcFunc= "FirstWhloeActivityNotice"},		--全民活动播报
--	{ month={},day={},week={},hour={10,11,12,13,14,15,16,17,20,21,},minute ={2},openserverdays={1},notopenserverdays ={},npcScene="sys",npcName="function",npcFunc= "LevelingNotice"},		--从开服后的每个整点都进行活动宣传播报：
--	--{ month={},day={},week={},hour={19,20,21},minute ={0},openserverdays={1},notopenserverdays ={},npcScene="sys",npcName="function",npcFunc= "LevelingStartNotice"},								--当19:01以后
--	--{ month={},day={},week={},hour={22},minute ={0,5,10,15,20,25,30,35,40,45,50,55},openserverdays={1},notopenserverdays ={},npcScene="sys",npcName="function",npcFunc= "LevelingLastNotice"},		--22点后倒计时
--	{ month={},day={},week={},hour={},minute ={1},openserverdays={1,2,3,4,5},notopenserverdays ={},npcScene="sys",npcName="function",npcFunc= "UpdateLevelMainRank"},	--更新第一天等级排名的名单
--	{ month={},day={},week={},hour={23},minute ={0},openserverdays={1},notopenserverdays ={},npcScene="sys",npcName="function",npcFunc= "EndLevelingActivty"},	
--	--23点全名活动结束	
--	{ month={},day={},week={},hour={22},minute ={59},openserverdays={5},notopenserverdays ={},npcScene="sys",npcName="function",npcFunc= "EndFirstDayActivty"},	
--	{ month={},day={},week={},hour={23},minute ={0,6,12,18,24},openserverdays={5},notopenserverdays ={},npcScene="sys",npcName="function",npcFunc= "BroadLevelingMsg"},		--23后，每6分钟播放一次		
--
--	--第二天 最炫翅膀（经验Buff）
--	--预告
--	{month={},day={},week={},hour={23},minute={30,40,50},openserverdays={1,2,3,4,5,6,7,8,9},notopenserverdays={},npcScene="sys",npcName="function", npcFunc= "PreBroadSwingNotice"},		--提前一天预告主题活动
--	{month={},day={},week={},hour={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18},minute={0},openserverdays={2},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "BroadSwingTopicMsgOnTime"},
--	{month={},day={},week={},hour={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22},minute={5},openserverdays={2},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "ThdWhloeActivityNotice"},
--	{month={},day={},week={},hour={19,20,21},minute={0},openserverdays={2},notopenserverdays={},npcScene="sys",npcName="function", npcFunc= "BroadLeadSwingName"},
--	{month={},day={},week={},hour={22},minute={0,5,10,15,20,25,30,35,40,45,50,55},openserverdays={2},notopenserverdays={},npcScene="sys",npcName="function", npcFunc= "BroadLeadSwingName"},
--	--23点 播报本日获得争夺战的行会首领获得奖励
--	{month={},day={},week={},hour={23},minute={6,12,18,24},openserverdays={2},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "EndSwingLevelTopicMsg"},
--	{month={},day={},week={},hour={23},minute={0},openserverdays={2},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "AccountSwingTpoicActivity"},
--
--
--	--第三天 经典沙巴克城战（烟花）
--	--{ month={},day={},week={},hour={23},minute ={30,40,50},openserverdays={1},notopenserverdays ={},npcScene="sys",npcName="function",npcFunc= "PreDayNotice"},											--提前一天预告主题活动
--	{ month={},day={},week={},hour={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18},minute ={0},openserverdays={3},notopenserverdays ={},npcScene="sys",npcName="function",npcFunc= "TopicActivityNotice"},
--	{ month={},day={},week={},hour={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22},minute ={5},openserverdays={3},notopenserverdays ={},npcScene="sys",npcName="function",npcFunc= "SecWhloeActivityNotice"},		--全民活动播报
--	{ month={},day={},week={},hour={23},minute ={0,6,12,28,24},openserverdays={3},notopenserverdays ={},npcScene="sys",npcName="function",npcFunc= "EndSbkTopicActivity"},	
--
--	--第四天 拉风坐骑（经验Buff）
--	--{month={},day={},week={},hour={23},minute={30,40,50},openserverdays={3},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "PreToxicTopicNotice"},	
--	{month={},day={},week={},hour={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18},minute={0},openserverdays={4},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "BroadRideTopicNotice"},	--预告
--	{month={},day={},week={},hour={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22},minute={5},openserverdays={4},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "FourWhloeActivityNotice"},	--全名播报
--	{month={},day={},week={},hour={19,20,21},minute={0},openserverdays={4},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "OnTopicRideBroadcast"},			--19点后的播报
--	{month={},day={},week={},hour={22},minute={0,5,10,15,20,25,30,35,40,45,50,55},openserverdays={4},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "OnTopicRideBroadcast"},			--19点后的播报
--	{month={},day={},week={},hour={23},minute={0},openserverdays={4},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "OnAccountRide"},							--23点结算
--	{month={},day={},week={},hour={23},minute={6,12,18,24},openserverdays={4},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "OnBroadAfterRide"},				--23刷新
--	{month={},day={},week={},hour={0},minute={0},openserverdays={},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "FreshToxicFlags"},	
--
--	--第五天 消费排行榜（掉宝BOSS）
--	--预告当天主题活动
--	--{month={},day={},week={},hour={23},minute={30,40,50},openserverdays={4},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "PreConsumeBroadMsg"},
--	{month={},day={},week={},hour={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18},minute={0},openserverdays={5},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "BroadConsumeTopicNotice"},
--	{month={},day={},week={},hour={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22},minute={5},openserverdays={5},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "FiveWhloeActivityNotice"},
--	--19点后的提示
--	{month={},day={},week={},hour={19,20,21},minute={0},openserverdays={5},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "OnActorConsumeNotice"},
--	--22点后提示
--	{month={},day={},week={},hour={22},minute={0,5,10,15,29,25,30,35,40,45,50,55},openserverdays={5},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "OnActorConsumeLastNotice"},
--	--23点结算
--	{month={},day={},week={},hour={23},minute={0},openserverdays={5},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "OnAccountConsumeRank"},
--	--23点后没6分钟播放一次
--	{month={},day={},week={},hour={23},minute={6,12,18,24},openserverdays={5},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "BroadConsumePerMinute"},
--	--刷boss
--	{month={},day={},week={},hour={23},minute={1},openserverdays={5},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "FreshAwardBoss"},
--
--	--第六天 魂石（掉宝BOSS）
--	--{month={},day={},week={},hour={23},minute={30,40,50},openserverdays={6},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "PreDiamondNotice"},
--	{month={},day={},week={},hour={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18},minute={0},openserverdays={6},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "BroadDiamondTopicNotice"},
--	{month={},day={},week={},hour={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22},minute={5},openserverdays={6},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "SixWhloeActivityNotice"},
--	{month={},day={},week={},hour={19,20,21},minute={0},openserverdays={6},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "LastBroadDiamondNotice"},
--	{month={},day={},week={},hour={22},minute={0,5,10,15,29,25,30,35,40,45,50,55},openserverdays={6},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "LastBroadDiamondNotice"}, 
--	{month={},day={},week={},hour={23},minute={0},openserverdays={6},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "OnAccountDiamond"},
--	{month={},day={},week={},hour={23},minute={6,12,18,24},openserverdays={6},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "OnBroadAfterStoneMsg"},
--	{month={},day={},week={},hour={23},minute={1},openserverdays={6},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "FreshAwardStoneBoss"},
--
--	--第七天 装备大师竞赛（烟花）
--	--{month={},day={},week={},hour={23},minute={30,40,50},openserverdays={5},notopenserverdays={},npcScene=Lang.SceneName.s00008,npcName=Lang.EntityName.n00057,npcFunc= "PreWulinTopicNotice"},
--	{month={},day={},week={},hour={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18},minute={0},openserverdays={7},notopenserverdays={},npcScene=Lang.SceneName.s00008,npcName=Lang.EntityName.n00024,npcFunc= "ZmBroadTopicNotice"},
--	{month={},day={},week={},hour={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22},minute={5},openserverdays={7},notopenserverdays={},npcScene=Lang.SceneName.s00008,npcName=Lang.EntityName.n00024,npcFunc= "SevWhloeActivityNotice"},
--	--19点后的播报
--	{month={},day={},week={},hour={19,20,21},minute={0},openserverdays={7},notopenserverdays={},npcScene=Lang.SceneName.s00008,npcName=Lang.EntityName.n00024,npcFunc= "BroadZmLastTimeNotice"},
--	--22点后的播报
--	{month={},day={},week={},hour={22},minute={0,5,10,15,20,25,30,35,40,45,50,55},openserverdays={7},notopenserverdays={},npcScene=Lang.SceneName.s00008,npcName=Lang.EntityName.n00024,npcFunc= "OnTopicZmNotice"},
--	--23点结算
--	{month={},day={},week={},hour={23},minute={0},openserverdays={7},notopenserverdays={},npcScene=Lang.SceneName.s00008,npcName=Lang.EntityName.n00024,npcFunc= "OnAccountZmTopic"},
--	--结算后的播报
--	{month={},day={},week={},hour={23},minute={6,12,18,24},openserverdays={7},notopenserverdays={},npcScene=Lang.SceneName.s00008,npcName=Lang.EntityName.n00024,npcFunc= "OnBroadAccountZm"},
--	--刷奖励boss
--	{month={},day={},week={},hour={23},minute={1},openserverdays={7},notopenserverdays={},npcScene=Lang.SceneName.s00008,npcName=Lang.EntityName.n00024,npcFunc= "OnFreshZmBoss"},
--
--
--	--第八天 最强英雄（掉宝BOSS）
--	--{month={},day={},week={},hour={23},minute={30,40,50},openserverdays={8},notopenserverdays={},npcScene=Lang.SceneName.s00008,npcName=Lang.EntityName.n00024,npcFunc= "PreBroadZmNotice"},
--	{month={},day={},week={},hour={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18},minute={0},openserverdays={8},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "BroadHeroTopicNotice"},
--	{month={},day={},week={},hour={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22},minute={5},openserverdays={8},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "EightWhloeActivityNotice"},
--	--19点后的播报
--	{month={},day={},week={},hour={19,20,21},minute={0},openserverdays={8},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "BroadHeroLeadNotice"},
--	--22点后的播报
--	{month={},day={},week={},hour={22},minute={0,5,10,15,20,25,30,35,40,45,50,55},openserverdays={8},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "BroadHeroLeadNotice"},
--	--23点结算
--	{month={},day={},week={},hour={23},minute={0},openserverdays={8},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "OnAccountHeroTopic"},
--	--结算后的播报
--	{month={},day={},week={},hour={23},minute={6,12,18,24},openserverdays={8},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "OnBroadAccountHreo"},
--	--刷奖励boss
--	{month={},day={},week={},hour={23},minute={1},openserverdays={8},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "OnFreshHeroBoss"},
--
--	--第九天 鉴定宗师（经验buff）
--	--{month={},day={},week={},hour={23},minute={30,40,50},openserverdays={7},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "PreBroadAfterAccount"},
--	{month={},day={},week={},hour={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18},minute={0},openserverdays={9},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "TopicIdenfityNotice"},
--	{month={},day={},week={},hour={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22},minute={5},openserverdays={9},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "NightWhloeActivityNotice"},
--	{month={},day={},week={},hour={19,20,21},minute={0},openserverdays={9},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "LastTopicIdentifyNotice"},
--	{month={},day={},week={},hour={22},minute={0,5,10,15,20,25,30,35,40,45,50,55},openserverdays={9},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "TopickNotifyBroadcast"},
--	{month={},day={},week={},hour={23},minute={0},openserverdays={9},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "AccountIdentifyActivity"},
--	{month={},day={},week={},hour={23},minute={6,12,18,24},openserverdays={9},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "BroadAfterAccount"},
--
--	--免费答题
--	{ month={},day={},week={},hour={11},minute ={25},npcScene=Lang.SceneName.s00002,npcName=Lang.EntityName.n00135,npcFunc= "NoticeFreeAnswer"},		--公告免费答题
--	{ month={},day={},week={},hour={11},minute ={30},npcScene=Lang.SceneName.s00002,npcName=Lang.EntityName.n00135,npcFunc= "BeginFreeAnswer"},			--开始免费答题
--	{ month={},day={},week={0},hour={23},minute ={59},npcScene=Lang.SceneName.s00002,npcName=Lang.EntityName.n00135,npcFunc= "ResetAnswerRank"},		--重置数据
--
--	--第十天 职业战力比拼（烟花）
--	{month={},day={},week={},hour={23},minute={30,40,50},openserverdays={9},notopenserverdays={},npcScene= "sys",npcName="function", npcFunc= "PreBattleNotice"},		--提前一天预告主题活动
--	{month={},day={},week={},hour={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18},minute={0},openserverdays={10},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "BroadBattleTopicNotice"},
--	{month={},day={},week={},hour={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22},minute={5},openserverdays={10},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "TenWhloeActivityNotice"},
--	--19点后播报当前领先的玩家
--	{month={},day={},week={},hour={19,20,21},minute={0},openserverdays={10},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "BroadBattleActorToClient"},
--	--22点后播报
--	{month={},day={},week={},hour={22},minute={0,5,10,15,20,25,30,35,40,45,50,55},openserverdays={10},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "BroadBattleActorToClient"},
--	--23点结算
--	{month={},day={},week={},hour={23},minute={0},openserverdays={10},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "BroadBattleActorToClient"},
--	--23点后的播报
--	{month={},day={},week={},hour={23},minute={6,12,18,24},openserverdays={10},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "AfterAccountNotice"},
--	{month={},day={},week={},hour={23},minute={0},openserverdays={10},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "BroadAccountAwardEffect"},
--	
--	--皇后提前预告
--	{month={},day={},week={},hour={22},minute={05},openserverdays={},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "BroadSbkBiaoChePre"},
--	{month={},day={},week={},hour={22},minute={10},openserverdays={},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "StartSbkBiaoChe"},	--皇后开始
--
--	{month={},day={},week={},hour={12,15,18},minute={0},openserverdays={},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "FreshLuckyBox"},
--	
--	--种植玫瑰 喜从天降
--	--{month={},day={},week={},hour={12},minute={0},openserverdays={},notopenserverdays={},npcScene=Lang.SceneName.s00002,npcName=Lang.EntityName.n00096,npcFunc= "GrowRoseCalc"},
--	--{month={},day={},week={},hour={12},minute={10},openserverdays={},notopenserverdays={},npcScene=Lang.SceneName.s00002,npcName=Lang.EntityName.n00096,npcFunc= "GrowRoseExtraAward"},
--	
--	--赛马
--	{month={},day={},week={},hour={15},minute={25},openserverdays={},notopenserverdays={},npcScene=Lang.SceneName.s00002,npcName=Lang.EntityName.n00152,npcFunc= "ForcastNotice,1,5"},	--赛区预告 type: 1开启前公告 2 预备是公告 time:时间
--	{month={},day={},week={},hour={15},minute={30},openserverdays={},notopenserverdays={},npcScene=Lang.SceneName.s00002,npcName=Lang.EntityName.n00152,npcFunc= "StartHorseRace"},
--	{month={},day={},week={},hour={15},minute={32},openserverdays={},notopenserverdays={},npcScene=Lang.SceneName.s00002,npcName=Lang.EntityName.n00152,npcFunc= "ForcastNotice,2,1"},	--赛区预告 type: 1开启前公告 2 预备是公告 time:时间
--	{month={},day={},week={},hour={16},minute={0},openserverdays={},notopenserverdays={},npcScene=Lang.SceneName.s00002,npcName=Lang.EntityName.n00152,npcFunc= "OverHorseRace"},
--	
--
--	--拍卖
--	--[[
--	* Param INT_PTR nPrice: 起拍价
--	* Param INT_PTR nTime: 拍卖时限(秒)
--	* Param INT_PTR nItemId: 拍卖物品ID
--	* Param INT_PTR nCount: 拍卖数量
--	SetAuction(nPrice, nTime, nItemId, nCount, nQuality, nStrong, nBind)
--	--]]
--	--开服第一天拍卖商品（龙鳞圣骑灵魄【10天】）
--	{ month={},day={},week={},hour={12},minute ={00},openserverdays={1},notopenserverdays={},notcombineserverdays={1,2,3,4,5},npcScene="sys",npcName="function",npcFunc= "SetAuction,150,7200,735,1,0,0,0"}, ---刷新时间
--	{ month={},day={},week={},hour={15},minute ={00},openserverdays={1},notopenserverdays={},notcombineserverdays={1,2,3,4,5},npcScene="sys",npcName="function",npcFunc= "SetAuction,150,7200,735,1,0,0,0"}, ---刷新时间
--	{ month={},day={},week={},hour={18},minute ={00},openserverdays={1},notopenserverdays={},notcombineserverdays={1,2,3,4,5},npcScene="sys",npcName="function",npcFunc= "SetAuction,150,7200,735,1,0,0,0"}, ---刷新时间
--	{ month={},day={},week={},hour={20},minute ={00},openserverdays={1},notopenserverdays={},notcombineserverdays={1,2,3,4,5},npcScene="sys",npcName="function",npcFunc= "SetAuction,150,7200,735,1,0,0,0"}, ---刷新时间
--
--	--开服第二天拍卖商品（8倍经验神符）
--	{ month={},day={},week={},hour={12},minute ={00},openserverdays={2},notopenserverdays={},notcombineserverdays={1,2,3,4,5},npcScene="sys",npcName="function",npcFunc= "SetAuction,50,7200,1120,1,0,0,0"}, ---刷新时间
--	{ month={},day={},week={},hour={15},minute ={00},openserverdays={2},notopenserverdays={},notcombineserverdays={1,2,3,4,5},npcScene="sys",npcName="function",npcFunc= "SetAuction,50,7200,1120,1,0,0,0"}, ---刷新时间
--	{ month={},day={},week={},hour={18},minute ={00},openserverdays={2},notopenserverdays={},notcombineserverdays={1,2,3,4,5},npcScene="sys",npcName="function",npcFunc= "SetAuction,50,7200,1120,1,0,0,0"}, ---刷新时间
--
--	--开服第三天拍卖商品（强效攻击药水）
--	{ month={},day={},week={},hour={12},minute ={00},openserverdays={3},notopenserverdays={},notcombineserverdays={1,2,3,4,5},npcScene="sys",npcName="function",npcFunc= "SetAuction,300,7200,1021,1,0,0,0"}, ---刷新时间
--	{ month={},day={},week={},hour={15},minute ={00},openserverdays={3},notopenserverdays={},notcombineserverdays={1,2,3,4,5},npcScene="sys",npcName="function",npcFunc= "SetAuction,300,7200,1021,1,0,0,0"}, ---刷新时间
--	{ month={},day={},week={},hour={18},minute ={00},openserverdays={3},notopenserverdays={},notcombineserverdays={1,2,3,4,5},npcScene="sys",npcName="function",npcFunc= "SetAuction,300,7200,1021,1,0,0,0"}, ---刷新时间
--	{ month={},day={},week={},hour={20},minute ={00},openserverdays={3},notopenserverdays={},notcombineserverdays={1,2,3,4,5},npcScene="sys",npcName="function",npcFunc= "SetAuction,300,7200,1021,1,0,0,0"}, ---刷新时间
--
--	--开服第四天拍卖商品（四级灵珠×3）
--	{ month={},day={},week={},hour={12},minute ={00},openserverdays={4},notopenserverdays={},notcombineserverdays={1,2,3,4,5},npcScene="sys",npcName="function",npcFunc= "SetAuction,300,7200,283,3,0,0,0"}, ---刷新时间
--	{ month={},day={},week={},hour={15},minute ={00},openserverdays={4},notopenserverdays={},notcombineserverdays={1,2,3,4,5},npcScene="sys",npcName="function",npcFunc= "SetAuction,300,7200,283,3,0,0,0"}, ---刷新时间
--	{ month={},day={},week={},hour={18},minute ={00},openserverdays={4},notopenserverdays={},notcombineserverdays={1,2,3,4,5},npcScene="sys",npcName="function",npcFunc= "SetAuction,300,7200,283,3,0,0,0"}, ---刷新时间
--	{ month={},day={},week={},hour={22},minute ={00},openserverdays={4},notopenserverdays={},notcombineserverdays={1,2,3,4,5},npcScene="sys",npcName="function",npcFunc= "SetAuction,300,7200,283,3,0,0,0"}, ---刷新时间
--
--
--	--开服第五天拍卖商品（8倍经验神符）
--	{ month={},day={},week={},hour={12},minute ={00},openserverdays={5},notopenserverdays={},notcombineserverdays={1,2,3,4,5},npcScene="sys",npcName="function",npcFunc= "SetAuction,50,7200,1120,1,0,0,0"}, ---刷新时间
--	{ month={},day={},week={},hour={15},minute ={00},openserverdays={5},notopenserverdays={},notcombineserverdays={1,2,3,4,5},npcScene="sys",npcName="function",npcFunc= "SetAuction,50,7200,1120,1,0,0,0"}, ---刷新时间
--	{ month={},day={},week={},hour={18},minute ={00},openserverdays={5},notopenserverdays={},notcombineserverdays={1,2,3,4,5},npcScene="sys",npcName="function",npcFunc= "SetAuction,50,7200,1120,1,0,0,0"}, ---刷新时间
--
--	--开服第六天拍卖商品（机甲铜狮灵魄【7天】）
--	{ month={},day={},week={},hour={12},minute ={00},openserverdays={6},notopenserverdays={},notcombineserverdays={1,2,3,4,5},npcScene="sys",npcName="function",npcFunc= "SetAuction,200,7200,737,1,0,0,0"}, ---刷新时间
--	{ month={},day={},week={},hour={15},minute ={00},openserverdays={6},notopenserverdays={},notcombineserverdays={1,2,3,4,5},npcScene="sys",npcName="function",npcFunc= "SetAuction,200,7200,737,1,0,0,0"}, ---刷新时间
--	{ month={},day={},week={},hour={18},minute ={00},openserverdays={6},notopenserverdays={},notcombineserverdays={1,2,3,4,5},npcScene="sys",npcName="function",npcFunc= "SetAuction,200,7200,737,1,0,0,0"}, ---刷新时间
--
--	--开服第七天拍卖商品（四级灵珠×3）
--	{ month={},day={},week={},hour={12},minute ={00},openserverdays={7},notopenserverdays={},notcombineserverdays={1,2,3,4,5},npcScene="sys",npcName="function",npcFunc= "SetAuction,300,7200,283,3,0,0,0"}, ---刷新时间
--	{ month={},day={},week={},hour={15},minute ={00},openserverdays={7},notopenserverdays={},notcombineserverdays={1,2,3,4,5},npcScene="sys",npcName="function",npcFunc= "SetAuction,300,7200,283,3,0,0,0"}, ---刷新时间
--	{ month={},day={},week={},hour={18},minute ={00},openserverdays={7},notopenserverdays={},notcombineserverdays={1,2,3,4,5},npcScene="sys",npcName="function",npcFunc= "SetAuction,300,7200,283,3,0,0,0"}, ---刷新时间
--
--	--开服第八天拍卖商品（英雄金蚕王）
--	{ month={},day={},week={},hour={12},minute ={00},openserverdays={8},notopenserverdays={},notcombineserverdays={1,2,3,4,5},npcScene="sys",npcName="function",npcFunc= "SetAuction,999,7200,920,1,0,0,0"}, ---刷新时间
--	{ month={},day={},week={},hour={15},minute ={00},openserverdays={8},notopenserverdays={},notcombineserverdays={1,2,3,4,5},npcScene="sys",npcName="function",npcFunc= "SetAuction,999,7200,920,1,0,0,0"}, ---刷新时间
--	{ month={},day={},week={},hour={18},minute ={00},openserverdays={8},notopenserverdays={},notcombineserverdays={1,2,3,4,5},npcScene="sys",npcName="function",npcFunc= "SetAuction,999,7200,920,1,0,0,0"}, ---刷新时间
--
--	--开服第九天拍卖商品（五级灵珠×3）
--	{ month={},day={},week={},hour={12},minute ={00},openserverdays={9},notopenserverdays={},notcombineserverdays={1,2,3,4,5},npcScene="sys",npcName="function",npcFunc= "SetAuction,600,7200,1402,3,0,0,0"}, ---刷新时间
--	{ month={},day={},week={},hour={15},minute ={00},openserverdays={9},notopenserverdays={},notcombineserverdays={1,2,3,4,5},npcScene="sys",npcName="function",npcFunc= "SetAuction,600,7200,1402,3,0,0,0"}, ---刷新时间
--	{ month={},day={},week={},hour={18},minute ={00},openserverdays={9},notopenserverdays={},notcombineserverdays={1,2,3,4,5},npcScene="sys",npcName="function",npcFunc= "SetAuction,600,7200,1402,3,0,0,0"}, ---刷新时间
--
--	--开服第十天拍卖商品（特殊材料）
--	{ month={},day={},week={},hour={12},minute ={00},openserverdays={10},notopenserverdays={},notcombineserverdays={1,2,3,4,5},npcScene="sys",npcName="function",npcFunc= "SetAuction,999,7200,456,1,0,0,0"}, ---刷新时间
--	{ month={},day={},week={},hour={15},minute ={00},openserverdays={10},notopenserverdays={},notcombineserverdays={1,2,3,4,5},npcScene="sys",npcName="function",npcFunc= "SetAuction,999,7200,457,1,0,0,0"}, ---刷新时间
--	{ month={},day={},week={},hour={18},minute ={00},openserverdays={10},notopenserverdays={},notcombineserverdays={1,2,3,4,5},npcScene="sys",npcName="function",npcFunc= "SetAuction,999,7200,458,1,0,0,0"}, ---刷新时间
--
--	--合服拍卖
--	 --合服第一天（永久头衔）
--	{ month={},day={},week={},hour={12},minute ={00},combineserverdays={1},notopenserverdays={1,2,3,4,5,6,7,8,9,10},npcScene="sys",npcName="function",npcFunc= "SetAuction,100,7200,1522,1,0,0,0"}, ---刷新时间
--	{ month={},day={},week={},hour={15},minute ={00},combineserverdays={1},notopenserverdays={1,2,3,4,5,6,7,8,9,10},npcScene="sys",npcName="function",npcFunc= "SetAuction,100,7200,1523,1,0,0,0"}, ---刷新时间
--	{ month={},day={},week={},hour={18},minute ={00},combineserverdays={1},notopenserverdays={1,2,3,4,5,6,7,8,9,10},npcScene="sys",npcName="function",npcFunc= "SetAuction,100,7200,1522,1,0,0,0"}, ---刷新时间
--	{ month={},day={},week={},hour={22},minute ={00},combineserverdays={1},notopenserverdays={1,2,3,4,5,6,7,8,9,10},npcScene="sys",npcName="function",npcFunc= "SetAuction,100,7200,1523,1,0,0,0"}, ---刷新时间
--
--	--合服第二天（龙鳞圣骑灵魄【10天】）
--	{ month={},day={},week={},hour={12},minute ={00},combineserverdays={2},notopenserverdays={1,2,3,4,5,6,7,8,9,10},npcScene="sys",npcName="function",npcFunc= "SetAuction,150,7200,735,1,0,0,0"}, ---刷新时间
--	{ month={},day={},week={},hour={15},minute ={00},combineserverdays={2},notopenserverdays={1,2,3,4,5,6,7,8,9,10},npcScene="sys",npcName="function",npcFunc= "SetAuction,150,7200,735,1,0,0,0"}, ---刷新时间
--	{ month={},day={},week={},hour={18},minute ={00},combineserverdays={2},notopenserverdays={1,2,3,4,5,6,7,8,9,10},npcScene="sys",npcName="function",npcFunc= "SetAuction,150,7200,735,1,0,0,0"}, ---刷新时间
--
--	--合服第三天（强效攻击药水）
--	{ month={},day={},week={},hour={12},minute ={00},combineserverdays={3},notopenserverdays={1,2,3,4,5,6,7,8,9,10},npcScene="sys",npcName="function",npcFunc= "SetAuction,300,7200,1021,1,0,0,0"}, ---刷新时间
--	{ month={},day={},week={},hour={15},minute ={00},combineserverdays={3},notopenserverdays={1,2,3,4,5,6,7,8,9,10},npcScene="sys",npcName="function",npcFunc= "SetAuction,300,7200,1021,1,0,0,0"}, ---刷新时间
--	{ month={},day={},week={},hour={18},minute ={00},combineserverdays={3},notopenserverdays={1,2,3,4,5,6,7,8,9,10},npcScene="sys",npcName="function",npcFunc= "SetAuction,300,7200,1021,1,0,0,0"}, ---刷新时间
--	{ month={},day={},week={},hour={20},minute ={00},combineserverdays={3},notopenserverdays={1,2,3,4,5,6,7,8,9,10},npcScene="sys",npcName="function",npcFunc= "SetAuction,300,7200,1021,1,0,0,0"}, ---刷新时间
--
--	--合服第四天（机甲铜狮灵魄【7天】）
--	{ month={},day={},week={},hour={12},minute ={00},combineserverdays={4},notopenserverdays={1,2,3,4,5,6,7,8,9,10},npcScene="sys",npcName="function",npcFunc= "SetAuction,200,7200,737,1,0,0,0"}, ---刷新时间
--	{ month={},day={},week={},hour={15},minute ={00},combineserverdays={4},notopenserverdays={1,2,3,4,5,6,7,8,9,10},npcScene="sys",npcName="function",npcFunc= "SetAuction,200,7200,737,1,0,0,0"}, ---刷新时间
--	{ month={},day={},week={},hour={18},minute ={00},combineserverdays={4},notopenserverdays={1,2,3,4,5,6,7,8,9,10},npcScene="sys",npcName="function",npcFunc= "SetAuction,200,7200,737,1,0,0,0"}, ---刷新时间
--
--	--合服第五天（五级灵珠×3）
--	{ month={},day={},week={},hour={12},minute ={00},combineserverdays={5},notopenserverdays={1,2,3,4,5,6,7,8,9,10},npcScene="sys",npcName="function",npcFunc= "SetAuction,600,7200,1402,3,0,0,0"}, ---刷新时间
--	{ month={},day={},week={},hour={15},minute ={00},combineserverdays={5},notopenserverdays={1,2,3,4,5,6,7,8,9,10},npcScene="sys",npcName="function",npcFunc= "SetAuction,600,7200,1402,3,0,0,0"}, ---刷新时间
--	{ month={},day={},week={},hour={18},minute ={00},combineserverdays={5},notopenserverdays={1,2,3,4,5,6,7,8,9,10},npcScene="sys",npcName="function",npcFunc= "SetAuction,600,7200,1402,3,0,0,0"}, ---刷新时间
--	
--
--	--周一拍卖商品（8倍经验神符）
--	{ month={},day={},week={1},hour={12},minute ={00},openserverdays={},notopenserverdays={1,2,3,4,5,6,7,8,9,10},notcombineserverdays={1,2,3,4,5},npcScene="sys",npcName="function",npcFunc= "SetAuction,50,7200,1120,1,0,0,0"}, ---刷新时间
--	{ month={},day={},week={1},hour={15},minute ={00},openserverdays={},notopenserverdays={1,2,3,4,5,6,7,8,9,10},notcombineserverdays={1,2,3,4,5},npcScene="sys",npcName="function",npcFunc= "SetAuction,50,7200,1120,1,0,0,0"}, ---刷新时间
--	{ month={},day={},week={1},hour={18},minute ={00},openserverdays={},notopenserverdays={1,2,3,4,5,6,7,8,9,10},notcombineserverdays={1,2,3,4,5},npcScene="sys",npcName="function",npcFunc= "SetAuction,50,7200,1120,1,0,0,0"}, ---刷新时间
--
--	--周二拍卖商品（冰原战熊灵魄【7天】）
--	{ month={},day={},week={2},hour={12},minute ={00},openserverdays={},notopenserverdays={1,2,3,4,5,6,7,8,9,10},notcombineserverdays={1,2,3,4,5},npcScene="sys",npcName="function",npcFunc= "SetAuction,30,7200,1513,1,0,0,0"}, ---刷新时间
--	{ month={},day={},week={2},hour={15},minute ={00},openserverdays={},notopenserverdays={1,2,3,4,5,6,7,8,9,10},notcombineserverdays={1,2,3,4,5},npcScene="sys",npcName="function",npcFunc= "SetAuction,30,7200,1513,1,0,0,0"}, ---刷新时间
--	{ month={},day={},week={2},hour={18},minute ={00},openserverdays={},notopenserverdays={1,2,3,4,5,6,7,8,9,10},notcombineserverdays={1,2,3,4,5},npcScene="sys",npcName="function",npcFunc= "SetAuction,30,7200,1513,1,0,0,0"}, ---刷新时间
--
--	--周三拍卖商品（五级灵珠×3）
--	{ month={},day={},week={3},hour={12},minute ={00},openserverdays={},notopenserverdays={1,2,3,4,5,6,7,8,9,10},notcombineserverdays={1,2,3,4,5},npcScene="sys",npcName="function",npcFunc= "SetAuction,600,7200,1402,3,0,0,0"}, ---刷新时间
--	{ month={},day={},week={3},hour={18},minute ={00},openserverdays={},notopenserverdays={1,2,3,4,5,6,7,8,9,10},notcombineserverdays={1,2,3,4,5},npcScene="sys",npcName="function",npcFunc= "SetAuction,600,7200,1402,3,0,0,0"}, ---刷新时间
--
--	--周四拍卖商品（圣魔麒麟灵魄【7天】）
--	{ month={},day={},week={4},hour={12},minute ={00},openserverdays={},notopenserverdays={1,2,3,4,5,6,7,8,9,10},notcombineserverdays={1,2,3,4,5},npcScene="sys",npcName="function",npcFunc= "SetAuction,50,7200,1514,1,0,0,0"}, ---刷新时间
--	{ month={},day={},week={4},hour={15},minute ={00},openserverdays={},notopenserverdays={1,2,3,4,5,6,7,8,9,10},notcombineserverdays={1,2,3,4,5},npcScene="sys",npcName="function",npcFunc= "SetAuction,50,7200,1514,1,0,0,0"}, ---刷新时间
--	{ month={},day={},week={4},hour={18},minute ={00},openserverdays={},notopenserverdays={1,2,3,4,5,6,7,8,9,10},notcombineserverdays={1,2,3,4,5},npcScene="sys",npcName="function",npcFunc= "SetAuction,50,7200,1514,1,0,0,0"}, ---刷新时间
--
--	--周五拍卖商品（英雄金蚕王）
--	{ month={},day={},week={5},hour={12},minute ={00},openserverdays={},notopenserverdays={1,2,3,4,5,6,7,8,9,10},notcombineserverdays={1,2,3,4,5},npcScene="sys",npcName="function",npcFunc= "SetAuction,999,7200,920,1,0,0,0"}, ---刷新时间
--	{ month={},day={},week={5},hour={18},minute ={00},openserverdays={},notopenserverdays={1,2,3,4,5,6,7,8,9,10},notcombineserverdays={1,2,3,4,5},npcScene="sys",npcName="function",npcFunc= "SetAuction,999,7200,920,1,0,0,0"}, ---刷新时间
--
--	--周六拍卖商品（龙鳞圣骑灵魄【10天】）
--	{ month={},day={},week={6},hour={12},minute ={00},openserverdays={},notopenserverdays={1,2,3,4,5,6,7,8,9,10},notcombineserverdays={1,2,3,4,5},npcScene="sys",npcName="function",npcFunc= "SetAuction,150,7200,735,1,0,0,0"}, ---刷新时间
--	{ month={},day={},week={6},hour={18},minute ={00},openserverdays={},notopenserverdays={1,2,3,4,5,6,7,8,9,10},notcombineserverdays={1,2,3,4,5},npcScene="sys",npcName="function",npcFunc= "SetAuction,150,7200,735,1,0,0,0"}, ---刷新时间
--
--	--周日拍卖商品（缓慢材料）
--	{ month={},day={},week={0},hour={12},minute ={00},openserverdays={},notopenserverdays={1,2,3,4,5,6,7,8,9,10},notcombineserverdays={1,2,3,4,5},npcScene="sys",npcName="function",npcFunc= "SetAuction,999,7200,456,1,0,0,0"}, ---刷新时间
--	{ month={},day={},week={0},hour={15},minute ={00},openserverdays={},notopenserverdays={1,2,3,4,5,6,7,8,9,10},notcombineserverdays={1,2,3,4,5},npcScene="sys",npcName="function",npcFunc= "SetAuction,999,7200,457,1,0,0,0"}, ---刷新时间
--	{ month={},day={},week={0},hour={18},minute ={00},openserverdays={},notopenserverdays={1,2,3,4,5,6,7,8,9,10},notcombineserverdays={1,2,3,4,5},npcScene="sys",npcName="function",npcFunc= "SetAuction,999,7200,458,1,0,0,0"}, ---刷新时间
--
--
--	--充值促销系统
--	{ month={},day={},week={},hour={0},minute ={0},openserverdays={3},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "PaySalesStart"}, --开始时间
--	{ month={},day={},week={},hour={0},minute ={0},openserverdays={5},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "PaySalesStart"}, --开始时间
--	{ month={},day={},week={},hour={0},minute ={0},openserverdays={7},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "PaySalesStart"}, --开始时间
--	{ month={},day={},week={},hour={0},minute ={0},combineserverdays={1},npcScene="sys",npcName="function",npcFunc= "PaySalesStart"}, --开始时间
--
--
--	--玫瑰花排名结算
--	{ month={},day={},week={1},hour={0},minute ={0},npcScene=Lang.SceneName.s00002,npcName=Lang.EntityName.n00096,npcFunc= "ResetRoseRanking"},	--结束
--
--	--战队竞技活动
--	{ month={},day={},week={2,4},hour={18},minute ={25},npcScene=Lang.SceneName.s00008,npcName=Lang.EntityName.n00154,npcFunc= "PreStartCorpsBattle"}, --预告
--	{ month={},day={},week={2,4},hour={18},minute ={30},npcScene=Lang.SceneName.s00008,npcName=Lang.EntityName.n00154,npcFunc= "StartCorpsBattle"},	--开始
--	{ month={},day={},week={2,4},hour={19},minute ={0},npcScene=Lang.SceneName.s00008,npcName=Lang.EntityName.n00154,npcFunc= "EndCorpsBattle"},	--结束
--
--	--黑市商人等偶遇怪
--	--{ month={},day={},week={},hour={9,12,15,18,21,0,},minute ={30},npcScene="sys",npcName="function",npcFunc= "FlushRandomNpcShop"},	 --出现黑市商人
--	--{ month={},day={},week={},hour={10,13,16,19,22,1,},minute ={40},npcScene="sys",npcName="function",npcFunc= "FlushTryBattleFb"},	 --出现试练副本
--	{ month={},day={},week={},hour={11,12,13,14,15,16,17,18,19,23,0,1,},minute ={10},npcScene="sys",npcName="function",npcFunc= "FlushGetPetMonsters"}, --随从怪
--	{ month={},day={},week={},hour={5,11,17,23,},minute ={20},npcScene="sys",npcName="function",npcFunc= "FlushBuffMonsters"},   --增益类怪
--	{ month={},day={},week={},hour={12,13,14,15,16,17,18,19,23,0,1,2,},minute ={25},npcScene="sys",npcName="function",npcFunc= "FlushKillMonster"},    --击杀类怪
--
--	--定时领取战力竞技的奖励
--	{month={},day={},week={},hour={23},minute={0},openserverdays={},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "CombatAwardPerDayRefresh"},
--	{month={},day={},week={},hour={},minute={30},openserverdays={},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "GiveCombatExpOnTime"},  --给战力竞技前10名的玩家奖励
--	
--	--英雄系统开启
--	{month={},day={},week={},hour={0},minute={0},openserverdays={5},notopenserverdays={},npcScene=Lang.SceneName.s00008,npcName=Lang.EntityName.n00161,npcFunc= "HeroSystemOpen"},
--
--	--{month={},day={},week={},hour={},minute={35},openserverdays={},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "CountActorSceneNum"},	--统计玩家在地图地人数
--	{month={},day={},week={},hour={1},minute={45},openserverdays={},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "CountMonsterDeadToLog"},   --发送怪的死亡次数到后台
--	{month={},day={},week={},hour={2},minute={45},openserverdays={},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "CountItemOutPutToLog"},	--发送物品产出统计
--
--	{month={},day={},week={},hour={0,2,4,6,8,10,12,14,16,18,20,22},minute={0},combineserverdays={1,2,3,4,5},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "FreshMysticOnTime"},			--定时刷新神秘商店
--	
--	{month={},day={},week={},hour={0},minute={0},combineserverdays={6},npcScene="sys",npcName="function",npcFunc= "OnAccountCombineActivity"},		--合区第五天24点结算
--	{month={},day={},week={},hour={23},minute={59},combineserverdays={1,2,3,4,5},npcScene="sys",npcName="function",npcFunc= "OnFreshCombineLevelRank"},	--合区前5天刷新合区等级排名
--	{month={},day={},week={},hour={},minute={30},combineserverdays={1,2,3,4,5},npcScene="sys",npcName="function",npcFunc= "OnFreshCombineBattleRank"},
--

--	
--	--九天冰宫 深渊烈域 刷钥匙怪
--	{ month={},day={},week={},hour={0,2,4,6,8,10,12,14,16},minute ={40},npcScene=Lang.SceneName.s00008,npcName=Lang.EntityName.n00179,npcFunc= "CreateHeavenKeyBoss"},	--飞天龟头
--	{ month={},day={},week={},hour={1,3,5,7,9,11,13,15,17},minute ={40},npcScene=Lang.SceneName.s00008,npcName=Lang.EntityName.n00180,npcFunc= "CreateHellKeyBoss"},	--遁地龟头
--
--	{month={},day={},week={},hour={},minute={0,30},openserverdays={1},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "OnOpenBroadDoubleExpMsg"},
--
--	{ month={},day={},week={6},hour={18},minute ={25},npcScene=Lang.SceneName.s00002,npcName=Lang.EntityName.n00205,npcFunc= "NoticePreHunting"},	--提前5分钟预告
--	{ month={},day={},week={6},hour={18},minute ={30},npcScene=Lang.SceneName.s00002,npcName=Lang.EntityName.n00205,npcFunc= "OpenHuntingAct"},	--开启狩猎大会
--	{ month={},day={},week={6},hour={19},minute ={30},npcScene=Lang.SceneName.s00002,npcName=Lang.EntityName.n00205,npcFunc= "CloseHuntingAct"},	--关闭狩猎大会
--	{ month={},day={},week={6},hour={23},minute ={59},npcScene=Lang.SceneName.s00002,npcName=Lang.EntityName.n00205,npcFunc= "ClearHuntingInfo"},  --0点清空
--	
--	--节日活动
--	{ month={},day={},week={},hour={10,11,12,13,14,15,16,17,18,19,20},minute ={0},npcScene=Lang.SceneName.s00002,npcName=Lang.EntityName.n00205,npcFunc= "BeginWishBottle"},
--	{ month={},day={},week={},hour={22},minute ={59},npcScene=Lang.SceneName.s00002,npcName=Lang.EntityName.n00205,npcFunc= "EndWishNotice"},
--	{ month={},day={},week={},hour={23},minute ={0},npcScene=Lang.SceneName.s00002,npcName=Lang.EntityName.n00205,npcFunc= "EndWishBottle"},
--
--	--祈福树
--	{ month={},day={},week={},hour={22},minute ={0},npcScene=Lang.SceneName.s00008,npcName=Lang.EntityName.n00211,npcFunc= "StartBlessDoubleExp"},   --开启双倍祈福
--	{ month={},day={},week={},hour={23},minute ={0},npcScene=Lang.SceneName.s00008,npcName=Lang.EntityName.n00211,npcFunc= "EndBlessDoubleExp"},	 --关闭双倍祈福
--	{ month={},day={},week={},hour={23},minute ={59},npcScene=Lang.SceneName.s00008,npcName=Lang.EntityName.n00211,npcFunc= "calcTodayWishVal"},	 --计算今天祝福值
--
--	{ month={2},day={28},week={},hour={23},minute ={59},npcScene=Lang.SceneName.s00008,npcName=Lang.EntityName.n00211,npcFunc= "CloseHolidayAct"},	 --关闭节日活动
--	{ month={},day={},week={},hour={22},minute ={0},npcScene=Lang.SceneName.s00008,npcName=Lang.EntityName.n00211,npcFunc= "NoticeFstFireAward"},	 --春节抽奖
--	{ month={},day={},week={},hour={22},minute ={1,6,11,16,21,26,31,36,41,46},npcScene=Lang.SceneName.s00008,npcName=Lang.EntityName.n00211,npcFunc= "FestivalFireAward"},	 --鞭炮10点抽奖
--	{ month={},day={},week={},hour={23},minute ={59},npcScene=Lang.SceneName.s00008,npcName=Lang.EntityName.n00211,npcFunc= "ResetFestivalFireRank"},	 --春节抽奖
--	
--	{ month={},day={},week={},hour={23},minute ={59},npcScene=Lang.SceneName.s00008,npcName=Lang.EntityName.n00211,npcFunc="CalcWithDrawAward"},		--新春提取元宝反馈结算
--
--	{month={},day={},week={},hour={23},minute={59},openserverdays={},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "ResetDayHundredServerRank"},   --百服昨天消费清空
--	
--	--世界贡献度
--	{month={},day={},week={},hour={0},minute={1},openserverdays={},notopenserverdays={},npcScene=Lang.SceneName.s00008,npcName=Lang.EntityName.n00095,npcFunc= "ClearWCRank"},	--清空排行榜
--	
--	--定时保存文件
--	{month={},day={},week={},hour={5},minute={15},openserverdays={},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "SaveFiles"},   --定时文件存盘
--
--	--火龙熔岩
--	{ month={},day={},week={},hour={11},minute ={25},npcScene=Lang.SceneName.s00008,npcName=Lang.EntityName.n00212,npcFunc= "NoticeWorld"},
--	{ month={},day={},week={},hour={11},minute ={30},npcScene=Lang.SceneName.s00008,npcName=Lang.EntityName.n00212,npcFunc= "BeginFireDragon"},	 --开启火龙熔岩
--	{ month={},day={},week={},hour={11},minute ={51},npcScene=Lang.SceneName.s00008,npcName=Lang.EntityName.n00212,npcFunc= "EndFireDragon"},	 --结束火龙熔岩
--
--	{ month={},day={},week={},hour={23},minute ={35},npcScene=Lang.SceneName.s00008,npcName=Lang.EntityName.n00212,npcFunc= "NoticeWorld"},
--	{ month={},day={},week={},hour={23},minute ={40},npcScene=Lang.SceneName.s00008,npcName=Lang.EntityName.n00212,npcFunc= "BeginFireDragon"},	 --开启火龙熔岩
--	{ month={},day={},week={},hour={0},minute ={1},npcScene=Lang.SceneName.s00008,npcName=Lang.EntityName.n00212,npcFunc= "EndFireDragon"},	 --结束火龙熔岩
--
--	{ month={},day={},week={2},hour={22},minute ={9},notopenserverdays ={1,2,3,4,5,6,7,8,9,10},npcScene="sys",npcName="function",npcFunc= "CanEnterCrossBoss"},						--跨服boss战场入口开启
--	{ month={},day={},week={2},hour={23},minute ={10},notopenserverdays ={1,2,3,4,5,6,7,8,9,10},npcScene="sys",npcName="function",npcFunc= "CloseCrossBoss"},							--跨服boss战场入口关闭
--
--	{ month={},day={},week={6},hour={22},minute ={9},notopenserverdays ={1,2,3,4,5,6,7,8,9,10},npcScene="sys",npcName="function",npcFunc= "StartCrossWorldOne"},						--跨服天下第一战场入口开启
--	{ month={},day={},week={6},hour={23},minute ={10},notopenserverdays ={1,2,3,4,5,6,7,8,9,10},npcScene="sys",npcName="function",npcFunc= "EndCrossWorldOne"},						--跨服天下第一战场入口关闭
--
--	--跨服沙巴克
--	{month={},day={},week={4},hour={0},minute={1},openserverdays={},notopenserverdays ={1,2,3,4,5,6,7,8,9,10},npcScene="sys",npcName="function",npcFunc= "OnSendCrossSbkGuild"},		--发送跨服沙巴克给其他逻辑服
--	{month={},day={},week={4},hour={19},minute={30},openserverdays={},notopenserverdays ={1,2,3,4,5,6,7,8,9,10},npcScene="sys",npcName="function",npcFunc= "CanEnterGuildCrossSbk"},	--跨服沙巴克开启
--	{month={},day={},week={4},hour={22},minute={0},openserverdays={},notopenserverdays ={1,2,3,4,5,6,7,8,9,10},npcScene="sys",npcName="function",npcFunc= "CloseSbkEnter"},	--关闭跨服入口
--	{month={},day={},week={},hour={19},minute={15},openserverdays={},notopenserverdays ={},npcScene="sys",npcName="function",npcFunc= "OnSendGuildListToCross"},		--发送行会列表给跨服服务器
--
--	-- 驱年兽
--	{month={},day={},week={},hour={1,17,19},minute={35},openserverdays={},notopenserverdays ={},npcScene="sys",npcName="function",npcFunc= "QuNianShouPre"},	--驱年兽预告
--	{month={},day={},week={},hour={1,17,19},minute={40},openserverdays={},notopenserverdays ={},npcScene="sys",npcName="function",npcFunc= "QuNianShou"},	--驱年兽开始
--	{month={},day={},week={},hour={2,18,20},minute={40},openserverdays={},notopenserverdays ={},npcScene="sys",npcName="function",npcFunc= "QuNianShouClose"},	--驱年兽结束
--	{month={},day={},week={},hour={1,17,19},minute={40},openserverdays={},notopenserverdays ={},npcScene="sys",npcName="function",npcFunc= "QuNianShouShuaguai"},	--驱年兽刷怪
--	
--	-- 新年倒计时
--	{month={2},day={9},week={},hour={23},minute={52},openserverdays={},npcScene="sys",npcName="function",npcFunc= "NewYearPre10"},	--前8分钟公告
--	{month={2},day={9},week={},hour={23},minute={57},openserverdays={},npcScene="sys",npcName="function",npcFunc= "NewYearPre5"},	--前3分钟公告
--	{month={2},day={9},week={},hour={23},minute={59},openserverdays={},npcScene="sys",npcName="function",npcFunc= "NewYearPre1"},	--前1分钟公告
--	{month={2},day={10},week={},hour={0},minute={0},openserverdays={},npcScene="sys",npcName="function",npcFunc= "NewYear"},	--00:00 大年初一了
--	{month={2},day={10},week={},hour={0},minute={1},openserverdays={},npcScene="sys",npcName="function",npcFunc= "NewYearPost1"},	--后1分钟发元宝
--
--	{month={},day={},week={},hour={23},minute={59},openserverdays={},npcScene=Lang.SceneName.s00002,npcName=Lang.EntityName.n00012,npcFunc= "ClearExpRuneData"}, -- 兑换经验神符清零
--	--{month={},day={},week={},hour={},minute={5,35},openserverdays={},npcScene="sys",npcName="function",npcFunc= "SaveMoneyComsumeLog"},	--每半小时保存金币、元宝等日志
--	
--	--转生装备升级
--	{ month={},day={},week={},hour={17},minute ={30},npcScene=Lang.SceneName.s00002,npcName=Lang.EntityName.n00247,npcFunc= "OpenCircleNpc"},
--	{ month={},day={},week={},hour={18},minute ={59},npcScene=Lang.SceneName.s00002,npcName=Lang.EntityName.n00247,npcFunc= "CloseCircleNpc"},


------------------------------------------------------------------------------新春砸年兽活动
--	{ month={1},day={27,28,29,30,31},      week={},hour={0,10,14,19,22},minute ={0,10,20,30},second={0},openserverdays={},npcScene="sys",npcName="function",npcFunc= "StartBornMonster"}, --新春年兽活动刷怪
--	{ month={2},day={1,2,3,4,5,6,7,8,9,10},week={},hour={0,10,14,19,22},minute ={0,10,20,30},second={0},openserverdays={},npcScene="sys",npcName="function",npcFunc= "StartBornMonster"}, --新春年兽活动刷怪
--
--	{ month={1},day={26,27,28,29,30,31},   week={},hour={23},minute ={55},second={0},openserverdays={},npcScene="sys",npcName="function",npcFunc= "StartBornMonsterReportOne"}, --0点第一波预报
--	{ month={2},day={1,2,3,4,5,6,7,8,9},   week={},hour={23},minute ={55},second={0},openserverdays={},npcScene="sys",npcName="function",npcFunc= "StartBornMonsterReportOne"}, --0点第一波预报
--	{ month={1},day={27,28,29,30,31},      week={},hour={9,13,18,21},minute ={55},second={0},openserverdays={},npcScene="sys",npcName="function",npcFunc= "StartBornMonsterReportOne"}, --第一波预报
--	{ month={2},day={1,2,3,4,5,6,7,8,9,10},week={},hour={9,13,18,21},minute ={55},second={0},openserverdays={},npcScene="sys",npcName="function",npcFunc= "StartBornMonsterReportOne"}, --第一波预报
--
--	{ month={1},day={27,28,29,30,31},      week={},hour={0,10,14,19,22},minute ={5},second={0},openserverdays={},npcScene="sys",npcName="function",npcFunc= "StartBornMonsterReportTwo"}, --第二波预报
--	{ month={2},day={1,2,3,4,5,6,7,8,9,10},week={},hour={0,10,14,19,22},minute ={5},second={0},openserverdays={},npcScene="sys",npcName="function",npcFunc= "StartBornMonsterReportTwo"}, --第二波预报
--
--	{ month={1},day={27,28,29,30,31},      week={},hour={0,10,14,19,22},minute ={15},second={0},openserverdays={},npcScene="sys",npcName="function",npcFunc= "StartBornMonsterReportThree"}, --第三波预报
--	{ month={2},day={1,2,3,4,5,6,7,8,9,10},week={},hour={0,10,14,19,22},minute ={15},second={0},openserverdays={},npcScene="sys",npcName="function",npcFunc= "StartBornMonsterReportThree"}, --第三波预报
--
--	{ month={1},day={27,28,29,30,31},      week={},hour={0,10,14,19,22},minute ={25},second={0},openserverdays={},npcScene="sys",npcName="function",npcFunc= "StartBornMonsterReportFour"}, --最后一波预报
--	{ month={2},day={1,2,3,4,5,6,7,8,9,10},week={},hour={0,10,14,19,22},minute ={25},second={0},openserverdays={},npcScene="sys",npcName="function",npcFunc= "StartBornMonsterReportFour"}, --最后一波预报
----------------------------------------------------------------------------新春砸年兽活动


------------------------------------------------合服累积充值
	--{month={},day={},week={},hour={0},minute={0},second={0},combineserverdays={6},npcScene="sys",npcName="function",npcFunc= "SendOffLineAward"},		--合区第六天0点发放
------------------------------------------------合服累积充值

--------------------------------------------------黄金满屋活动--------------------------------------------
						
--	{ month={},day={},week={},hour={15},minute ={30},second={0},npcScene="sys",npcName="function",npcFunc= "StartPrestigeActivity,1"},
--	{ month={},day={},week={},hour={15},minute ={40},second={0},npcScene="sys",npcName="function",npcFunc= "StartPrestigeActivity,2"},
--	{ month={},day={},week={},hour={15},minute ={50},second={0},npcScene="sys",npcName="function",npcFunc= "StartPrestigeActivity,3"},
	
	
-----------------------------------------------七星珠-------------------------------------------------------------
--	{ month={},day={},week={1},hour={13},minute ={5},second={0},npcScene="sys",npcName="function",npcFunc= "CreateStarBeadsMonster,1"},
--	{ month={},day={},week={2},hour={13},minute ={5},second={0},npcScene="sys",npcName="function",npcFunc= "CreateStarBeadsMonster,2"},
--	{ month={},day={},week={3},hour={13},minute ={5},second={0},npcScene="sys",npcName="function",npcFunc= "CreateStarBeadsMonster,3"},
--	{ month={},day={},week={4},hour={13},minute ={5},second={0},npcScene="sys",npcName="function",npcFunc= "CreateStarBeadsMonster,4"},
--	{ month={},day={},week={5},hour={13},minute ={5},second={0},npcScene="sys",npcName="function",npcFunc= "CreateStarBeadsMonster,5"},
--	{ month={},day={},week={6},hour={13},minute ={5},second={0},npcScene="sys",npcName="function",npcFunc= "CreateStarBeadsMonster,6"},
--	{ month={},day={},week={0},hour={13},minute ={5},second={0},npcScene="sys",npcName="function",npcFunc= "CreateStarBeadsMonster,7"},
	
-----------------------------------------------全服双倍经验-------------------------------------------------------------
	--{ month={},day={},week={},hour={13},minute ={30},second={0},npcScene="sys",npcName="function",npcFunc= "StartDoubleExpTime,1"},
	--{ month={},day={},week={},hour={16},minute ={30},second={0},npcScene="sys",npcName="function",npcFunc= "EndDoubleExpTime,1"},
	--{ month={},day={},week={},hour={19},minute ={0},second={0},npcScene="sys",npcName="function",npcFunc= "StartDoubleExpTime,2"},
	--{ month={},day={},week={},hour={21},minute ={0},second={0},npcScene="sys",npcName="function",npcFunc= "EndDoubleExpTime,2"},
		
-----------------------------------------------王城危机-------------------------------------------------------------	
--	{ month={},day={},week={},hour={21},minute ={0},second={0},npcScene="sys",npcName="function",npcFunc= "FreshSbkMonsterOnTime"},	
	
-----------------------------------------------黑龙来袭-------------------------------------------------------------	
--	{ month={},day={},week={},hour={16},minute ={30},second={0},npcScene="sys",npcName="function",npcFunc= "StartMonsterRaid"},
--	{ month={},day={},week={},hour={17},minute ={0},second={0},npcScene="sys",npcName="function",npcFunc= "EndMonsterRaid"},
	
-----------------------------------------------圣境开启-------------------------------------------------------------
	--{ month={},day={},week={},hour={},minute ={30},second={0},npcScene="sys",npcName="function",npcFunc= "startCelestine"},
	--{ month={},day={},week={},hour={},minute ={40},second={0},npcScene="sys",npcName="function",npcFunc= "endCelestine"},
	


-----------------------------------------------土城富贵兽献瑞----------------------------------------------------------------------
	----10:30-10:50
	--{ month={},day={},week={},hour={10},minute={25},second={0},npcScene="sys",npcName="function",npcFunc= "StartFuGuiShouActivityNotice"},--开始预告
	--{ month={},day={},week={},hour={10},minute={30},second={0},npcScene="sys",npcName="function",npcFunc= "StartFuGuiShouActivity,1"},--正式开始
	--{ month={},day={},week={},hour={10},minute={45},second={0},npcScene="sys",npcName="function",npcFunc= "EndFuGuiShouActivityNotice"},--结束预告
	--{ month={},day={},week={},hour={10},minute={50},second={0},npcScene="sys",npcName="function",npcFunc= "EndFuGuiShouActivity"},--结束预告
	----14:00-14:20
	--{ month={},day={},week={},hour={13},minute={55},second={0},npcScene="sys",npcName="function",npcFunc= "StartFuGuiShouActivityNotice"},--开始预告
	--{ month={},day={},week={},hour={14},minute={00},second={0},npcScene="sys",npcName="function",npcFunc= "StartFuGuiShouActivity,5"},--正式开始
	--{ month={},day={},week={},hour={14},minute={15},second={0},npcScene="sys",npcName="function",npcFunc= "EndFuGuiShouActivityNotice"},--结束预告
	--{ month={},day={},week={},hour={14},minute={20},second={0},npcScene="sys",npcName="function",npcFunc= "EndFuGuiShouActivity"},--结束预告
	----22:10-22:30
	--{ month={},day={},week={},hour={22},minute={5},second={0},npcScene="sys",npcName="function",npcFunc= "StartFuGuiShouActivityNotice"},--开始预告
	--{ month={},day={},week={},hour={22},minute={10},second={0},npcScene="sys",npcName="function",npcFunc= "StartFuGuiShouActivity,12"},--正式开始
	--{ month={},day={},week={},hour={22},minute={25},second={0},npcScene="sys",npcName="function",npcFunc= "EndFuGuiShouActivityNotice"},--结束预告
	--{ month={},day={},week={},hour={22},minute={30},second={0},npcScene="sys",npcName="function",npcFunc= "EndFuGuiShouActivity"},--结束预告


	
----------------------------------------------招财宝箱--------------------------------------------------------------------------
	--{ month={},day={},week={},hour={13,14,15,16,17,18,19,20,21,22,23},minute ={0},second={0},npcScene="sys",npcName="function",npcFunc= "StartZhaoCaiBox"},



-------------------------------------------------行会争霸-----------------------------------------------------------------------------
--	{ month={},day={},week={},hour={14},minute ={40},second={0},npcScene="sys",npcName="function",npcFunc= "StartGuildCompete"},
--	{ month={},day={},week={},hour={14},minute ={50},second={0},npcScene="sys",npcName="function",npcFunc= "CloseEnterGuildCompete"},	
--	{ month={},day={},week={},hour={15},minute ={10},second={0},npcScene="sys",npcName="function",npcFunc= "EndGuildCompete"},
-------------------------------------------------全民竞技-----------------------------------------------------------------------------
	--屏蔽，已经另外实现了
	--{month={},day={},week={},hour={23},minute={0},openserverdays={3},npcScene="sys",npcName="function",npcFunc= "EndLevelingActivty"},
	--{month={},day={},week={},hour={23},minute={0},openserverdays={4},npcScene="sys",npcName="function",npcFunc= "EndChopActivty"},
	--{month={},day={},week={},hour={23},minute={0},openserverdays={5},npcScene="sys",npcName="function",npcFunc= "OnAccountRide"},
	--{month={},day={},week={},hour={23},minute={0},openserverdays={6},npcScene="sys",npcName="function",npcFunc= "AccountSwingTpoicActivity"},
--------------------------------------------------------泉水活动------------------------------------------------------
--	{ month={},day={},week={},hour={18},minute ={35},second={0},npcScene="sys",npcName="function",npcFunc= "StartFountainFuncrNotice"},	--喷泉开始预告
--	{ month={},day={},week={},hour={18},minute ={40},second={0},npcid=269,npcScene="sys",npcName="function",npcFunc= "OnStartFountainFunc"},	--喷泉开启
--	{ month={},day={},week={},hour={18},minute ={43},second={0},npcid=269,npcFunc= "flushFountainBoss"},				--开始刷怪
--	{ month={},day={},week={},hour={18},minute ={47},second={0},npcid=269,npcFunc= "flushFountainBoss"},				--开始刷怪
--	{ month={},day={},week={},hour={18},minute ={50},second={0},npcScene="sys",npcName="function",npcFunc= "EndFountainFuncrNotice"},	        --喷泉结束预告
--	{ month={},day={},week={},hour={18},minute ={55},second={0},npcid=269,npcScene="sys",npcName="function",npcFunc= "OnEndFountainFunc"},	--喷泉结束

----------------------------------------------------------佛光普照---------------------------------------------------
--	{ month={},day={},week={},hour={13},minute ={25},second={0},npcScene="sys",npcName="function",npcFunc= "startFoGuangNotice"},	--仙女散花开始预告
--	{ month={},day={},week={},hour={13},minute ={30},second={0},npcScene="sys",npcName="function",npcFunc= "startFoGuang,16"},--开启仙女散花
--	{ month={},day={},week={},hour={13},minute ={33},second={0},npcid=268,npcFunc= "flushFoGuangBoss"},					--开始刷怪
--	{ month={},day={},week={},hour={13},minute ={37},second={0},npcid=268,npcFunc= "flushFoGuangBoss"},					--开始刷怪
--	{ month={},day={},week={},hour={13},minute ={40},second={0},npcScene="sys",npcName="function",npcFunc= "endFoGuangNotice"},	--仙女散花结束预告
--	{ month={},day={},week={},hour={13},minute ={45},second={0},npcScene="sys",npcName="function",npcFunc= "endFoGuang"},--结束仙女散花


--	{ month={},day={},week={},hour={22},minute ={40},second={0},npcScene="sys",npcName="function",npcFunc= "startFoGuangNotice"},	--仙女散花开始预告
--	{ month={},day={},week={},hour={22},minute ={45},second={0},npcScene="sys",npcName="function",npcFunc= "startFoGuang,17"},--开启仙女散花
--	{ month={},day={},week={},hour={22},minute ={48},second={0},npcid=268,npcFunc= "flushFoGuangBoss"},					--开始刷怪
--	{ month={},day={},week={},hour={22},minute ={52},second={0},npcid=268,npcFunc= "flushFoGuangBoss"},					--开始刷怪
--	{ month={},day={},week={},hour={22},minute ={55},second={0},npcScene="sys",npcName="function",npcFunc= "endFoGuangNotice"},	--仙女散花结束预告
--	{ month={},day={},week={},hour={22},minute ={0},second={0},npcScene="sys",npcName="function",npcFunc= "endFoGuang"},--结束仙女散花
	
-----------------------------------------------双蛋活动"天天有鱼BOSS"-------------------------------------------------------------
--	{ month={12},day={25,26,27,28,29,30,31},week={},hour={20},minute ={0},second={0},npcScene="sys",npcName="function",npcFunc= "CreateDoubleEggMonster"},
--	{ month={1},day={1,2,3},week={},hour={20},minute ={0},second={0},npcScene="sys",npcName="function",npcFunc= "CreateDoubleEggMonster"},

----------------------------------------------- 开区前4天晚上"天天有鱼BOSS"-------------------------------------------------------------
--	{ month={},day={},week={},hour={20},minute ={0},second={0},openserverdays={1,2,3,4},npcScene="sys",npcName="function",npcFunc= "CreateDoubleEggMonster"},
	
--	----------------------------------------------- 百服活动：魔尊来袭-------------------------------------------------------------
--	{ month={},day={},week={},hour={9,12,15,18,21,23},minute ={0},second={0},npcScene="sys",npcName="function",npcFunc= "CreateHundredMonster"},
--	
--	----------------------------------------------- 五一活动：暗黑劳模-------------------------------------------------------------
--	{ month={5},day={1,2,3,4,5,6,7},week={},hour={10,16,20},minute ={0},second={0},npcScene="sys",npcName="function",npcFunc= "CreateLaborBoss"},	
--	
--	----------------------------------------------- 每日刷新打折商店-------------------------------------------------------------
--	{ month={},day={},week={},hour={0},minute ={0},second={0},npcScene="sys",npcName="function",npcFunc= "InitRandomItemInfo"},

--	----------------------------------------------- 魔族入侵活动-------------------------------------------------------------

	
	--	----------------------------------------------- 武林争霸-------------------------------------------------------------
	--{ month={},day={},week={},hour={12},minute ={40},second={0},npcScene="sys",npcName="function",npcFunc= "WuLinZhengBaSignUp"},
	--武林争霸开始预告
	--{ month={},day={},week={},hour={12},minute ={45},second={0},npcScene="sys",npcName="function",npcFunc= "WuLinZhengBaNotice"},
	--活动开始
	--{ month={},day={},week={},hour={12},minute ={50},second={0},npcid=267,npcScene="sys",npcName="function",npcFunc= "StartWuLinZhengBa"},
	--开始不能进入
	--{ month={},day={},week={},hour={13},minute ={10},second={0},npcScene="sys",npcName="function",npcFunc= "OnWuLinZhengBaTenMin"},	  
	--活动结束预告
	--{ month={},day={},week={},hour={13},minute ={15},second={0},npcid="sys",npcScene="sys",npcName="function",npcFunc= "EndWLZBNotice"},	
	--活动结束
	--{ month={},day={},week={},hour={13},minute ={20},second={0},npcid="sys",npcScene="sys",npcName="function",npcFunc= "EndWuLinZhengBa"},	
	--{ month={},day={},week={},hour={13},minute ={25},second={0},npcid="sys",npcScene="sys",npcName="function",npcFunc= "ClearWiLinScene"},

	-- --	----------------------------------------------- 多倍押送-------------------------------------------------------------
	{ month={},day={},week={},hour={10},minute ={55},second={0},npcScene="sys",npcName="function",npcFunc= "onBroadcast_DuoBeiYaSong_StartBefore5"},--预告时间
	{ month={},day={},week={},hour={11},minute ={00},second={0},npcScene="sys",npcName="function",npcFunc= "onBroadcast_DuoBeiYaSong_Start"},
	{ month={},day={},week={},hour={11},minute ={30},second={0},npcScene="sys",npcName="function",npcFunc= "OnBroadcast_DuoBeiYaSong_End"},
	{ month={},day={},week={},hour={16},minute ={55},second={0},npcScene="sys",npcName="function",npcFunc= "onBroadcast_DuoBeiYaSong_StartBefore5"},--预告时间
	{ month={},day={},week={},hour={17},minute ={00},second={0},npcScene="sys",npcName="function",npcFunc= "onBroadcast_DuoBeiYaSong_Start"},
	{ month={},day={},week={},hour={17},minute ={30},second={0},npcScene="sys",npcName="function",npcFunc= "OnBroadcast_DuoBeiYaSong_End"},
	{ month={},day={},week={},hour={21},minute ={20},second={0},npcScene="sys",npcName="function",npcFunc= "onBroadcast_DuoBeiYaSong_StartBefore5"},--预告时间
	{ month={},day={},week={},hour={21},minute ={25},second={0},npcScene="sys",npcName="function",npcFunc= "onBroadcast_DuoBeiYaSong_Start"},
	{ month={},day={},week={},hour={21},minute ={55},second={0},npcScene="sys",npcName="function",npcFunc= "OnBroadcast_DuoBeiYaSong_End"},
	-- { month={},day={},week={},hour={18},minute ={0},second={0},npcScene="sys",npcName="function",npcFunc= "onBroadcast_DuoBeiYaSong_Start"},
	-- { month={},day={},week={},hour={18},minute ={30},second={0},npcScene="sys",npcName="function",npcFunc= "OnBroadcast_DuoBeiYaSong_End"},


		-- --	----------------------------------------------- 跨服押送-------------------------------------------------------------
		--[[
			{ month={},day={},week={},hour={11},minute ={10},second={0},npcScene="sys",npcName="function",npcFunc= "onBroadcast_kuafuYaSong_StartBefore5"},--预告时间
	{ month={},day={},week={},hour={11},minute ={15},second={0},npcScene="sys",npcName="function",npcFunc= "onBroadcast_kuafuYaSong_Start"},
	{ month={},day={},week={},hour={11},minute ={45},second={0},npcScene="sys",npcName="function",npcFunc= "OnBroadcast_kuafuYaSong_End"},
	{ month={},day={},week={},hour={17},minute ={10},second={0},npcScene="sys",npcName="function",npcFunc= "onBroadcast_kuafuYaSong_StartBefore5"},--预告时间
	{ month={},day={},week={},hour={17},minute ={15},second={0},npcScene="sys",npcName="function",npcFunc= "onBroadcast_kuafuYaSong_Start"},
	{ month={},day={},week={},hour={17},minute ={45},second={0},npcScene="sys",npcName="function",npcFunc= "OnBroadcast_kuafuYaSong_End"},
	{ month={},day={},week={},hour={21},minute ={35},second={0},npcScene="sys",npcName="function",npcFunc= "onBroadcast_kuafuYaSong_StartBefore5"},--预告时间
	{ month={},day={},week={},hour={21},minute ={40},second={0},npcScene="sys",npcName="function",npcFunc= "onBroadcast_kuafuYaSong_Start"},
	{ month={},day={},week={},hour={22},minute ={10},second={0},npcScene="sys",npcName="function",npcFunc= "OnBroadcast_kuafuYaSong_End"},
	--]]

	--	----------------------------------------------- 新的武林争霸-------------------------------------------------------------
	{ month={},day={},week={1,3,5},hour={13},minute ={15},second={0},npcScene="sys",npcName="function",npcFunc= "on_activity_wlzb_before10"},---预告时间
	{ month={},day={},week={1,3,5},hour={13},minute ={20},second={0},npcScene="sys",npcName="function",npcFunc= "StartActivity_wlzb"},
	{ month={},day={},week={1,3,5},hour={13},minute ={50},second={0},npcScene="sys",npcName="function",npcFunc= "EndActivity_wlzb"},
	
		--	----------------------------------------------- 军团战活动 2017.6.23 屏蔽军团战-------------------------------------------------------------
--	{ month={},day={},week={},hour={18},minute ={55},second={0},npcScene="sys",npcName="function",npcFunc= "FiveMinsBeforeStart"}, ---预告时间
--	{ month={},day={},week={},hour={19},minute ={00},secon	d={0},npcScene="sys",npcName="function",npcFunc= "StartActivity_juntuanzhan"},
--	{ month={},day={},week={},hour={19},minute ={10},second={0},npcScene="sys",npcName="function",npcFunc= "ThirtySecondsBeforeCloseActivity"},
--	{ month={},day={},week={},hour={19},minute ={20},second={0},npcScene="sys",npcName="function",npcFunc= "EndActivity_juntuanzhan"},

     ---激情大本营活动 --如果全行会资金池大于100点，则开始激情大本营活动，否则开启军团战活动
--    { month={},day={},week={},hour={18},minute ={55},second={0},npcScene="sys",npcName="function",npcFunc= "ArdourCampBeforeStart"}, ---预告时间
--    { month={},day={},week={},hour={19},minute ={00},second={0},npcScene="sys",npcName="function",npcFunc= "StartArdourCamp"},
--    { month={},day={},week={},hour={19},minute ={20},second={0},npcScene="sys",npcName="function",npcFunc= "EndArdourCamp"},

--	----------------------------------------------- 皇宫大乱斗活动 -------------------------------------------------------------
	{ month={},day={},week={},hour={19},minute ={0},second={0},npcScene="sys",npcName="function",npcFunc= "PalaceFighting_Start"}, -- 皇宫大乱斗活动开始
	{ month={},day={},week={},hour={19},minute ={1},second={0},npcScene="sys",npcName="function",npcFunc= "PalaceFighting_Tip"}, -- 皇宫大乱斗活动提示
	{ month={},day={},week={},hour={19},minute ={2},second={0},npcScene="sys",npcName="function",npcFunc= "PalaceFighting_Tip"}, -- 皇宫大乱斗活动提示
	{ month={},day={},week={},hour={19},minute ={15},second={0},npcScene="sys",npcName="function",npcFunc= "PalaceFighting_End"}, -- 皇宫大乱斗活动结束

	--	----------------------------------------------- 奔跑吧兄弟活动-------------------------------------------------------------
	{ month={},day={},week={},hour={13},minute ={55},second={0},npcScene="sys",npcName="function",npcFunc= "StartActivity_bpbxdBefore5"}, --预告时间
	{ month={},day={},week={},hour={14},minute ={00},second={0},npcScene="sys",npcName="function",npcFunc= "StartActivity_bpbxd"},
	{ month={},day={},week={},hour={14},minute ={30},second={0},npcScene="sys",npcName="function",npcFunc= "EndActivity_bpbxd"},
	
	--	----------------------------------------------- 秘境之旅活动-------------------------------------------------------------
--	{ month={},day={},week={1,5},hour={19},minute ={55},second={0},npcScene="sys",npcName="function",npcFunc= "StartActivity_MiJingZhiLvBefore5"}, ---预告时间
--	{ month={},day={},week={1,5},hour={20},minute ={00},second={0},npcScene="sys",npcName="function",npcFunc= "StartActivity_MiJingZhiLv"},
--	{ month={},day={},week={1,5},hour={21},minute ={00},second={0},npcScene="sys",npcName="function",npcFunc= "EndActivity_MiJingZhiLv"},
	
	--	-----------------------------------------------新夺宝奇兵-------------------------------------------------------------
	{ month={},day={},week={},hour={21},minute ={00},second={0},npcScene="sys",npcName="function",npcFunc= "StartActivity_duobaoqibingBefore5"},---预告时间
	{ month={},day={},week={},hour={21},minute ={05},second={0},npcScene="sys",npcName="function",npcFunc= "StartActivity_duobaoqibing"},
	{ month={},day={},week={},hour={21},minute ={20},second={0},npcScene="sys",npcName="function",npcFunc= "EndActivity_duobaoqibing"},
	
	------------------------------------------------------世界boss------------------------------------------------------------------------
    { month={},day={},week={},hour={19},minute ={25},second={0},npcScene="sys",npcName="function",npcFunc= "StartActivity_WorldBoss"},
    { month={},day={},week={},hour={19},minute ={35},second={0},npcScene="sys",npcName="function",npcFunc= "EndActivity_WorldBoss"},
		--	-----------------------------------------------双倍炼狱-------------------------------------------------------------
	-- { month={},day={},week={},hour={15},minute ={00},second={0},npcScene="sys",npcName="function",npcFunc= "onBroadcast_ShuangBeiLianYu_StartBefore5"}, ---预告时间
	-- { month={},day={},week={},hour={15},minute ={05},second={0},npcScene="sys",npcName="function",npcFunc= "onBroadcast_ShuangBeiLianYu_Start"},
	-- { month={},day={},week={},hour={16},minute ={05},second={0},npcScene="sys",npcName="function",npcFunc= "OnBroadcast_ShuangBeiLianYu_End"},
	
			----------------------------------------------- 抵御入侵活动-------------------------------------------------------------
--	{ month={},day={},week={0,3},hour={19},minute ={55},second={0},npcScene="sys",npcName="function",npcFunc= "onstartguildfight_Before5"},---预告时间
--	{ month={},day={},week={0,3},hour={20},minute ={0},second={0},npcScene="sys",npcName="function",npcFunc= "onstartguildfight"},
--	{ month={},day={},week={0,3},hour={21},minute ={0},second={0},npcScene="sys",npcName="function",npcFunc= "onstopguildfight"},
	
	
	--	----------------------------------------------- 闭关修炼活动-------------------------------------------------------------
	--{ month={},day={},week={},hour={9},minute ={50},second={0},npcScene="sys",npcName="function",npcFunc= "StartActivity_BGXL, 1"},
	--{ month={},day={},week={},hour={10},minute ={0},second={0},npcScene="sys",npcName="function",npcFunc= "EndActivity_BGXL, 1"},
	--{ month={},day={},week={},hour={14},minute ={50},second={0},npcScene="sys",npcName="function",npcFunc= "StartActivity_BGXL, 2"},
	--{ month={},day={},week={},hour={15},minute ={0},second={0},npcScene="sys",npcName="function",npcFunc= "EndActivity_BGXL, 2"},
	--{ month={},day={},week={},hour={23},minute ={50},second={0},npcScene="sys",npcName="function",npcFunc= "StartActivity_BGXL, 3"},
	--{ month={},day={},week={},hour={23},minute ={59},second={59},npcScene="sys",npcName="function",npcFunc= "EndActivity_BGXL, 3"},
	
	--	----------------------------------------------- 巨魔之巢活动-------------------------------------------------------------
	--{ month={},day={},week={},hour={10},minute ={30},second={0},npcScene="sys",npcName="function",npcFunc= "StartActivity_JMZC, 1"},
	--{ month={},day={},week={},hour={12},minute ={30},second={0},npcScene="sys",npcName="function",npcFunc= "EndActivity_JMZC, 1"},
	--{ month={},day={},week={},hour={21},minute ={30},second={0},npcScene="sys",npcName="function",npcFunc= "StartActivity_JMZC, 2"},
	--{ month={},day={},week={},hour={23},minute ={30},second={0},npcScene="sys",npcName="function",npcFunc= "EndActivity_JMZC, 2"},
	
	--	----------------------------------------------- 全服双倍经验活动--改为怒刷白猪-------------------------------------------------------------
	-- { month={},day={},week={},hour={18},minute ={00},second={0},npcScene="sys",npcName="function",npcFunc= "StartActivity_DoubleExp, 1"},
	-- { month={},day={},week={},hour={18},minute ={45},second={0},npcScene="sys",npcName="function",npcFunc= "EndActivity_DoubleExp, 1"},
	-- -- { month={},day={},week={},hour={17},minute ={35},second={0},npcScene="sys",npcName="function",npcFunc= "StartActivity_DoubleExp, 2"},
	-- -- { month={},day={},week={},hour={18},minute ={35},second={0},npcScene="sys",npcName="function",npcFunc= "EndActivity_DoubleExp, 2"},
	-- -- { month={},day={},week={},hour={21},minute ={30},second={0},npcScene="sys",npcName="function",npcFunc= "StartActivity_DoubleExp, 3"},
	-- -- { month={},day={},week={},hour={22},minute ={30},second={0},npcScene="sys",npcName="function",npcFunc= "EndActivity_DoubleExp, 3"},	
	
	--	----------------------------------------------- 神威狱-------------------------------------------------------------
	{ month={},day={},week={},hour={09},minute ={55},second={0},npcScene="sys",npcName="function",npcFunc= "StartActivity_JMZCBefore5"}, ----预告时间
	{ month={},day={},week={},hour={10},minute ={00},second={0},npcScene="sys",npcName="function",npcFunc= "StartActivity_JMZC"},
	{ month={},day={},week={},hour={11},minute ={30},second={0},npcScene="sys",npcName="function",npcFunc= "EndActivity_JMZC"},
	{ month={},day={},week={},hour={21},minute ={55},second={0},npcScene="sys",npcName="function",npcFunc= "StartActivity_JMZCBefore5"}, ----预告时间
	{ month={},day={},week={},hour={22},minute ={00},second={0},npcScene="sys",npcName="function",npcFunc= "StartActivity_JMZC"},
	{ month={},day={},week={},hour={23},minute ={30},second={0},npcScene="sys",npcName="function",npcFunc= "EndActivity_JMZC"},
	
	
	--	----------------------------------------------- 激情闭关-------------------------------------------------------------
	{ month={},day={},week={},hour={14},minute ={55},second={0},npcScene="sys",npcName="function",npcFunc= "StartActivity_BGXLBefore5"}, ----预告时间
	{ month={},day={},week={},hour={15},minute ={0},second={0},npcScene="sys",npcName="function",npcFunc= "StartActivity_BGXL"}, 
	--{ month={},day={},week={},hour={11},minute ={15},second={0},npcScene="sys",npcName="function",npcFunc= "Start_multipleAwake"},
	{ month={},day={},week={},hour={15},minute ={20},second={0},npcScene="sys",npcName="function",npcFunc= "EndActivity_BGXL"},
	
	
	----------------------------------------------------合服全服双倍-------------------------------------------------------------------
	{ month={},day={},week={},hour={0},minute ={0},second={1},combineserverdays={1,2,3,4,5},npcScene="sys",npcName="function",npcFunc= "StartHeFuShuangBeiExp"},
	{ month={},day={},week={},hour={8},minute ={0},second={0},combineserverdays={1,2,3,4,5},npcScene="sys",npcName="function",npcFunc= "EndHeFuShuangBeiExp"},
	-----------------------------------------------------------------------------------------------------------------------------------
	
	----------------------------------------------------父亲节全服双倍-------------------------------------------------------------------
	{ month={6},day={18,19,20},week={},hour={12},minute ={0},second={1},npcScene="sys",npcName="function",npcFunc= "FatherDayQuanFuShuangbei_OPEN"},
	{ month={6},day={18,19,20},week={},hour={18},minute ={0},second={0},npcScene="sys",npcName="function",npcFunc= "FatherDayQuanFuShuangbei_CLOSE"},
	-----------------------------------------------------------------------------------------------------------------------------------
	
		----------------------------------------------------元旦全服双倍-------------------------------------------------------------------
	{ month={1},day={1,2,3},week={},hour={12},minute ={0},second={0},npcScene="sys",npcName="function",npcFunc= "NeujahrActivityQuanFuShuangbei_OPEN"},
	{ month={1},day={1,2,3},week={},hour={18},minute ={0},second={0},npcScene="sys",npcName="function",npcFunc= "NeujahrActivityQuanFuShuangbei_CLOSE"},
	


	--	----------------------------------------------- 世界BOSS-------------------------------------------------------------
	--{ month={},day={},week={},hour={16},minute ={42},second={0},npcScene="sys",npcName="function",npcFunc= "StartActivity_BGXLBefore5"}, ----预告时间
	--{ month={},day={},week={},hour={16},minute ={45},second={0},npcScene="sys",npcName="function",npcFunc= "StartActivity_BGXL"}, 
	--{ month={},day={},week={},hour={16},minute ={55},second={0},npcScene="sys",npcName="function",npcFunc= "EndActivity_BGXL"},


	--	----------------------------------------------- 饕餮神殿-------------------------------------------------------------
--	{ month={},day={},week={},hour={9},minute ={55},second={0},npcScene="sys",npcName="function",npcFunc= "StartActivity_TTSDCBefore5"}, ----预告时间
--	{ month={},day={},week={},hour={10},minute ={0},second={0},npcScene="sys",npcName="function",npcFunc= "StartActivity_TTSD"}, 
--	{ month={},day={},week={},hour={10},minute ={30},second={0},npcScene="sys",npcName="function",npcFunc= "EndActivity_TTSD"},

--	{ month={},day={},week={},hour={15},minute ={25},second={0},npcScene="sys",npcName="function",npcFunc= "StartActivity_TTSDCBefore5"}, ----预告时间
--	{ month={},day={},week={},hour={15},minute ={30},second={0},npcScene="sys",npcName="function",npcFunc= "StartActivity_TTSD"}, 
--	{ month={},day={},week={},hour={16},minute ={0},second={0},npcScene="sys",npcName="function",npcFunc= "EndActivity_TTSD"},

    ---------------------------------------------------行会 抵御入侵---------------------------------------------------------
    --{month={},day={},week={3,5},hour={20},minute ={0},second={0},npcScene="sys",npcName="function",npcFunc= "StartGuildFight"},
    --{month={},day={},week={3,5},hour={20},minute ={30},second={0},npcScene="sys",npcName="function",npcFunc= "EndGuildFight"},
	--膜拜城主活动结束后删除buff
    { month={},day={},week={},hour={12},minute ={30},second={0},npcScene="sys",npcName="function",npcFunc= "EndWorshipCity"},
    { month={},day={},week={},hour={18},minute ={30},second={0},npcScene="sys",npcName="function",npcFunc= "EndWorshipCity"},

		----------------------------------------------- 膜拜城主活动-------------------------------------------------------------
	-- { month={},day={},week={},hour={12},minute ={00},second={0},npcScene="sys",npcName="function",npcFunc= "StartActivity_Worship, 1"},
	-- { month={},day={},week={},hour={12},minute ={30},second={0},npcScene="sys",npcName="function",npcFunc= "EndActivity_Worship, 1"},
	-- { month={},day={},week={},hour={18},minute ={00},second={0},npcScene="sys",npcName="function",npcFunc= "StartActivity_Worship, 2"},
	-- { month={},day={},week={},hour={18},minute ={30},second={0},npcScene="sys",npcName="function",npcFunc= "EndActivity_Worship, 2"},
	
	--	----------------------------------------------- 阵营战活动-------------------------------------------------------------
	--{ month={},day={},week={},hour={18},minute ={55},second={0},npcScene="sys",npcName="function",npcFunc= "StartActivity_camp_battle"},
	--{ month={},day={},week={},hour={19},minute ={25},second={0},npcScene="sys",npcName="function",npcFunc= "EndActivity_camp_battle"},
	

	--攻城战
	{ month={},day={},week={0,1,2,3,5,6},hour={20},minute ={0},second={0},notopenserverdays ={1,2},notcombineserverdays = {1,2},npcScene="sys",npcName="function",npcFunc= "OnActivityTipsFunc,12,0"},
	--清除离线玩家数据
	{ month={},day={},week={},hour={},minute ={56},second={0},npcScene="sys",npcName="function",npcFunc= "ClearOfflineActorsData"},
	--	--刷新盗梦库
	--{month={},day={},week={},hour={0},minute={0},second={0},openserverdays={},notopenserverdays={},npcScene="sys",npcName="function",npcFunc= "RefreshDmkjLib"},
	-- 每日活动
	--{ month={},day={},week={},hour={16},minute ={0},second={0},npcScene="sys",npcName="function",npcFunc= "StartDemonInvadeActivity,1,17"}, --第1波
	--{ month={},day={},week={},hour={16},minute ={10},second={0},npcScene="sys",npcName="function",npcFunc= "StartDemonInvadeActivity,2,17"}, --第2波
	--{ month={},day={},week={},hour={16},minute ={20},second={0},npcScene="sys",npcName="function",npcFunc= "StartDemonInvadeActivity,3,17"}, --第3波
	--{ month={},day={},week={},hour={16},minute ={30},second={0},npcScene="sys",npcName="function",npcFunc= "StartDemonInvadeActivity,4,17"}, --第4波
	--{ month={},day={},week={},hour={16},minute ={40},second={0},npcScene="sys",npcName="function",npcFunc= "StartDemonInvadeActivity,5,17"}, --第5波
	-- 开服1到3天活动
	--{ month={},day={},week={},hour={20},minute ={0},second={0},openserverdays={1,2,3},npcScene="sys",npcName="function",npcFunc= "StartDemonInvadeActivity,1,21"},
	--{ month={},day={},week={},hour={20},minute ={10},second={0},openserverdays={1,2,3},npcScene="sys",npcName="function",npcFunc= "StartDemonInvadeActivity,2,21"},
	--{ month={},day={},week={},hour={20},minute ={20},second={0},openserverdays={1,2,3},npcScene="sys",npcName="function",npcFunc= "StartDemonInvadeActivity,3,21"},
	--{ month={},day={},week={},hour={20},minute ={30},second={0},openserverdays={1,2,3},npcScene="sys",npcName="function",npcFunc= "StartDemonInvadeActivity,4,21"},
	--{ month={},day={},week={},hour={20},minute ={40},second={0},openserverdays={1,2,3},npcScene="sys",npcName="function",npcFunc= "StartDemonInvadeActivity,5,21"},
	
--	----------------------------------------------- 神威幻境活动-------------------------------------------------------------
	--{ month={},day={},week={},hour={10},minute ={30},second={0},npcScene="sys",npcName="function",npcFunc= "StartActivity_SWHJ,1"},
	--{ month={},day={},week={},hour={11},minute ={30},second={0},npcScene="sys",npcName="function",npcFunc= "EndActivity_SWHJ,1"},
	--{ month={},day={},week={},hour={14},minute ={30},second={0},npcScene="sys",npcName="function",npcFunc= "StartActivity_SWHJ,2"},
	--{ month={},day={},week={},hour={15},minute ={30},second={0},npcScene="sys",npcName="function",npcFunc= "EndActivity_SWHJ,2"},
	--{ month={},day={},week={},hour={22},minute ={30},second={0},npcScene="sys",npcName="function",npcFunc= "StartActivity_SWHJ,3"},
	--{ month={},day={},week={},hour={23},minute ={30},second={0},npcScene="sys",npcName="function",npcFunc= "EndActivity_SWHJ,3"},
	
	--	-----------------------------------------------元宝嘉年华活动-开服三天后开启------------------------------------------------------------
	{ month={},day={},week={},hour={15},minute ={55},second={0},notopenserverdays ={1,2},npcScene="sys",npcName="function",npcFunc= "StartActivity_YBJNHBefore5_New"},------预告时间
	{ month={},day={},week={},hour={16},minute ={00},second={0},notopenserverdays ={1,2},npcScene="sys",npcName="function",npcFunc= "StartActivity_YBJNH_New"},
	{ month={},day={},week={},hour={16},minute ={30},second={0},notopenserverdays ={1,2},npcScene="sys",npcName="function",npcFunc= "EndActivity_YBJNH_New"},


	--	----------------------------------------------- 春节活动 圣诞树物品刷新
	--{month={},day={},week={},hour={0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23},minute={0},second={0},openserverdays={},notopenserverdays ={},npcScene="sys",npcName="function",npcFunc= "on_spring_festival_refresh_items"},
	--	-----------------------------------------------	
------------------------------------------------0点刷新每日数据-----------------------------------------------------------------------------
	{ month={},day={},week={},hour={0},minute ={0},second={0},openserverdays={},notopenserverdays ={},npcScene="sys",npcName="function",npcFunc= "refreshZero"},	

----------------------------------------------开服第一天LED公告------------------------------------------------------------
	--{ month={},day={},week={},hour={},minute ={0,5,10,15,20,25,30,35,40,45,50,55},second={0},openserverdays ={1},npcScene="sys",npcName="function",npcFunc= "OnOpenServerOneDay"},

----------------------------------------------除开服第一天以外的每日LED公告------------------------------------------------------------
	--{ month={},day={},week={},hour={},minute ={0,5,10,15,20,25,30,35,40,45,50,55},second={0},notopenserverdays = {1},npcScene="sys",npcName="function",npcFunc= "OnEveryDayBulletin"},
	
	--每日清除行会双倍活动使用次数
	{ month={},day={},week={},hour={23},minute ={59},second={0},npcScene="sys",npcName="function",npcFunc= "GuildPerDayRefreshDoubleActive"},
	
	------------------------------------------------沙巴克攻城战(config/guild/Guild.lua 也要同步修改)----------------------------------------------------------------------------
	{ month={},day={},week={},hour={19},minute ={30},second={0},notopenserverdays ={1,2},notcombineserverdays ={1,2},npcScene="sys",npcName="function",npcFunc= "SbkGuildWarNoticeBefor30"},	--沙巴克战预告
	{ month={},day={},week={},hour={19},minute ={50},second={0},notopenserverdays ={1,2},notcombineserverdays ={1,2},npcScene="sys",npcName="function",npcFunc= "SbkGuildWarNotice"},	--沙巴克战预告
	{ month={},day={},week={},hour={20},minute ={0},second={0},notopenserverdays ={1,2},notcombineserverdays ={1,2},npcScene="sys",npcName="function",npcFunc= "StartSbkGuildWar"},	--沙巴克战开始
	{ month={},day={},week={},hour={20},minute ={30},second={0},notopenserverdays ={1,2},notcombineserverdays ={1,2},npcScene="sys",npcName="function",npcFunc= "SbkGuildWarNoticeEight"},	--沙巴克20:30全服激励
	{ month={},day={},week={},hour={20},minute ={45},second={0},notopenserverdays ={1,2},notcombineserverdays ={1,2},npcScene="sys",npcName="function",npcFunc= "SbkGuildWarNoticeNine"},	--沙巴克21:00全服激励
	{ month={},day={},week={},hour={20},minute ={50},second={0},notopenserverdays ={1,2},notcombineserverdays ={1,2},npcScene="sys",npcName="function",npcFunc= "EndSbkGuildWarNotice"},	--沙巴克战结束预告
	{ month={},day={},week={},hour={21},minute ={0},second={0},notopenserverdays ={1,2},notcombineserverdays ={1,2},npcScene="sys",npcName="function",npcFunc= "EndSbkGuildWarOp"},	--沙巴克结束
	{ month={},day={},week={},hour={19},minute ={50},second={0},notopenserverdays ={1},notcombineserverdays ={1},npcScene="sys",npcName="function",npcFunc= "SbkGuildStateFresh"},     --更新报名数据
	{ month={},day={},week={},hour={20},minute ={5},second={0},notopenserverdays ={1,2},notcombineserverdays ={1,2},npcScene="sys",npcName="function",npcFunc= "SkbStartFiveMins"},			--沙巴克开始5分钟的处理


    --开区第三天 沙巴克活动
--     { month={},day={},hour={19},minute ={30},second={0},openserverdays={3},npcScene="sys",npcName="function",npcFunc= "SbkGuildWarNoticeBefor30"},	--沙巴克战预告
--    { month={},day={},hour={19},minute ={50},second={0},openserverdays={3},npcScene="sys",npcName="function",npcFunc= "SbkGuildWarNotice"},	--沙巴克战预告
--	{ month={},day={},hour={20},minute ={0},second={0},openserverdays={3},npcScene="sys",npcName="function",npcFunc= "StartSbkGuildWar"},	--沙巴克战开始
--	{ month={},day={},hour={20},minute ={30},second={0},openserverdays={3},npcScene="sys",npcName="function",npcFunc= "SbkGuildWarNoticeEight"},	--沙巴克20:30全服激励
--	{ month={},day={},hour={20},minute ={45},second={0},openserverdays={3},npcScene="sys",npcName="function",npcFunc= "SbkGuildWarNoticeNine"},	--沙巴克21:00全服激励
--	{ month={},day={},hour={20},minute ={50},second={0},openserverdays={3},npcScene="sys",npcName="function",npcFunc= "EndSbkGuildWarNotice"},	--沙巴克战结束预告
--	{ month={},day={},hour={21},minute ={0},second={0},openserverdays={3},npcScene="sys",npcName="function",npcFunc= "EndSbkGuildWarOp"},	--沙巴克结束
--	{ month={},day={},hour={20},minute ={5},second={0},openserverdays={3},npcScene="sys",npcName="function",npcFunc= "SkbStartFiveMins"},			--沙巴克开始5分钟的处理

    --行会镖车活动开启
    { month={},day={},hour={21},minute ={05},second={0},npcScene="sys",npcName="function",npcFunc= "StartGuildChe"}, --行会镖车活动
    { month={},day={},hour={21},minute ={30},second={0},npcScene="sys",npcName="function",npcFunc= "GuildCheRunTime"}, --行会镖车活动


    --  合服王城boss
    { month={},day={},hour={19},minute ={49},second={0},combineserverdays={1,2,3,4,5},npcScene="sys",npcName="function",npcFunc= "CombineKingCityBossing,1"}, --前1分钟预告
    { month={},day={},hour={19},minute ={48},second={0},combineserverdays={1,2,3,4,5},npcScene="sys",npcName="function",npcFunc= "CombineKingCityBossing,2"}, --前2分钟预告
    { month={},day={},hour={19},minute ={47},second={0},combineserverdays={1,2,3,4,5},npcScene="sys",npcName="function",npcFunc= "CombineKingCityBossing,3"}, --前3分钟预告
    { month={},day={},hour={19},minute ={50},second={0},combineserverdays={1,2,3,4,5},npcScene="sys",npcName="function",npcFunc= "CombineKingCityBossStart"}, --活动开始
    { month={},day={},hour={20},minute ={09},second={0},combineserverdays={1,2,3,4,5},npcScene="sys",npcName="function",npcFunc= "CombineKingCityBossEnding"}, --活动结束倒计时
    { month={},day={},hour={20},minute ={10},second={0},combineserverdays={1,2,3,4,5},npcScene="sys",npcName="function",npcFunc= "CombineKingCityBossEnd"}, --活动结束
    
	
	--庆典活动的庆典boss
	{ month={},day={},hour={19},minute ={34},second={0},npcScene="sys",npcName="function",npcFunc= "QianDianActivityBossing,1"}, --前1分钟预告
    { month={},day={},hour={19},minute ={33},second={0},npcScene="sys",npcName="function",npcFunc= "QianDianActivityBossing,2"}, --前2分钟预告
    { month={},day={},hour={19},minute ={32},second={0},npcScene="sys",npcName="function",npcFunc= "QianDianActivityBossing,3"}, --前3分钟预告
    { month={},day={},hour={19},minute ={35},second={0},npcScene="sys",npcName="function",npcFunc= "QianDianActivityBossingStart"}, --活动开始
    -- { month={},day={},hour={19},minute ={54},second={0},npcScene="sys",npcName="function",npcFunc= "QianDianActivityBossingEnding"}, --活动结束倒计时
    { month={},day={},hour={19},minute ={55},second={0},npcScene="sys",npcName="function",npcFunc= "QianDianActivityBossingEnd"}, --活动结束
	
	
	--国庆活动，国庆boss
	{ month={},day={},hour={19},minute ={44},second={0},npcScene="sys",npcName="function",npcFunc= "NalDayActivityBossings,1"}, --前1分钟预告
    { month={},day={},hour={19},minute ={43},second={0},npcScene="sys",npcName="function",npcFunc= "NalDayActivityBossings,2"}, --前2分钟预告
    { month={},day={},hour={19},minute ={42},second={0},npcScene="sys",npcName="function",npcFunc= "NalDayActivityBossings,3"}, --前3分钟预告
    { month={},day={},hour={19},minute ={45},second={0},npcScene="sys",npcName="function",npcFunc= "NalDayActivityBossingStart"}, --活动开始
    { month={},day={},hour={20},minute ={05},second={0},npcScene="sys",npcName="function",npcFunc= "NalDayActivityBossingEnd"}, --活动结束
	
	
    --------远古押镖------------
    ---前五分钟预告
    { month={},day={},hour={10},minute ={55},second={0},notopenserverdays={1,2,3,4},npcScene="sys",npcName="function",npcFunc= "YuanGuYaBiaoYuGao"},
    { month={},day={},hour={16},minute ={55},second={0},notopenserverdays={1,2,3,4},npcScene="sys",npcName="function",npcFunc= "YuanGuYaBiaoYuGao"},
    { month={},day={},hour={21},minute ={20},second={0},notopenserverdays={1,2,3,4},npcScene="sys",npcName="function",npcFunc= "YuanGuYaBiaoYuGao"},
    --远古押镖开始
    { month={},day={},hour={11},minute ={00},second={0},notopenserverdays={1,2,3,4},npcScene="sys",npcName="function",npcFunc= "YuanGuYaBiaoStart"},
    { month={},day={},hour={17},minute ={00},second={0},notopenserverdays={1,2,3,4},npcScene="sys",npcName="function",npcFunc= "YuanGuYaBiaoStart"},
    { month={},day={},hour={21},minute ={25},second={0},notopenserverdays={1,2,3,4},npcScene="sys",npcName="function",npcFunc= "YuanGuYaBiaoStart"},
    --远古押镖结束
    { month={},day={},hour={11},minute ={30},second={0},notopenserverdays={1,2,3,4},npcScene="sys",npcName="function",npcFunc= "YuanGuYaBiaoEnd"},
    { month={},day={},hour={17},minute ={30},second={0},notopenserverdays={1,2,3,4},npcScene="sys",npcName="function",npcFunc= "YuanGuYaBiaoEnd"},
    { month={},day={},hour={21},minute ={55},second={0},notopenserverdays={1,2,3,4},npcScene="sys",npcName="function",npcFunc= "YuanGuYaBiaoEnd"},

    --3v3竞技开始
    { month={},day={},hour={12},minute ={30},second={0},notopenserverdays={1,2,3,4},npcScene="sys",npcName="function",npcFunc= "MateRankStart,0"},
    { month={},day={},hour={19},minute ={30},second={0},notopenserverdays={1,2,3,4},npcScene="sys",npcName="function",npcFunc= "MateRankStart,0"},

    { month={},day={},hour={13},minute ={00},second={0},notopenserverdays={1,2,3,4},npcScene="sys",npcName="function",npcFunc= "MateRankEnd,0"},
    { month={},day={},hour={20},minute ={00},second={0},notopenserverdays={1,2,3,4},npcScene="sys",npcName="function",npcFunc= "MateRankEnd,0"},
	
    --个人竞技
   
    { month={},day={},week={2,4,6},hour={10},minute ={00},second={0},notopenserverdays={1,2,3,4},npcScene="sys",npcName="function",npcFunc= "MateRankStart,1"},
    { month={},day={},week={2,4,6},hour={14},minute ={00},second={0},notopenserverdays={1,2,3,4},npcScene="sys",npcName="function",npcFunc= "MateRankStart,1"},
    { month={},day={},week={2,4,6},hour={19},minute ={00},second={0},notopenserverdays={1,2,3,4},npcScene="sys",npcName="function",npcFunc= "MateRankStart,1"},

    { month={},day={},week={2,4,6},hour={11},minute ={00},second={0},notopenserverdays={1,2,3,4},npcScene="sys",npcName="function",npcFunc= "MateRankEnd,1"},
    { month={},day={},week={2,4,6},hour={15},minute ={00},second={0},notopenserverdays={1,2,3,4},npcScene="sys",npcName="function",npcFunc= "MateRankEnd,1"},
    { month={},day={},week={2,4,6},hour={20},minute ={00},second={0},notopenserverdays={1,2,3,4},npcScene="sys",npcName="function",npcFunc= "MateRankEnd,1"},
	--远古战场开始与结束
	{ month={},day={},hour={9},minute ={00},second={0},notopenserverdays={1,2,3,4},npcScene="sys",npcName="function",npcFunc= "YuanGuZhanChangStart"},
    { month={},day={},hour={15},minute ={00},second={0},notopenserverdays={1,2,3,4},npcScene="sys",npcName="function",npcFunc= "YuanGuZhanChangStart"},
	{ month={},day={},hour={21},minute ={00},second={0},notopenserverdays={1,2,3,4},npcScene="sys",npcName="function",npcFunc= "YuanGuZhanChangStart"},

    { month={},day={},hour={11},minute ={00},second={0},notopenserverdays={1,2,3,4},npcScene="sys",npcName="function",npcFunc= "YuanGuZhanChangEnd"},
    { month={},day={},hour={17},minute ={00},second={0},notopenserverdays={1,2,3,4},npcScene="sys",npcName="function",npcFunc= "YuanGuZhanChangEnd"},
	{ month={},day={},hour={23},minute ={00},second={0},notopenserverdays={1,2,3,4},npcScene="sys",npcName="function",npcFunc= "YuanGuZhanChangEnd"},

    --一分钟后再执行一次，跨服与逻辑服会有时间差间隔，把钻时间差进入的玩家也踢出去
	{ month={},day={},hour={11},minute ={01},second={0},notopenserverdays={1,2,3,4},npcScene="sys",npcName="function",npcFunc= "YuanGuZhanChangEnd,1"},
    { month={},day={},hour={17},minute ={01},second={0},notopenserverdays={1,2,3,4},npcScene="sys",npcName="function",npcFunc= "YuanGuZhanChangEnd,1"},
	{ month={},day={},hour={23},minute ={01},second={0},notopenserverdays={1,2,3,4},npcScene="sys",npcName="function",npcFunc= "YuanGuZhanChangEnd,1"},
	

    ----行会远古
    { month={},day={},hour={10},minute ={00},second={0},notopenserverdays={1,2,3,4},npcScene="sys",npcName="function",npcFunc= "YuanGuZhanChangGuildStart"},
    { month={},day={},hour={14},minute ={00},second={0},notopenserverdays={1,2,3,4},npcScene="sys",npcName="function",npcFunc= "YuanGuZhanChangGuildStart"},
	{ month={},day={},hour={19},minute ={00},second={0},notopenserverdays={1,2,3,4},npcScene="sys",npcName="function",npcFunc= "YuanGuZhanChangGuildStart"},

    { month={},day={},hour={11},minute ={00},second={0},notopenserverdays={1,2,3,4},npcScene="sys",npcName="function",npcFunc= "YuanGuZhanChangGuildEnd"},
    { month={},day={},hour={15},minute ={00},second={0},notopenserverdays={1,2,3,4},npcScene="sys",npcName="function",npcFunc= "YuanGuZhanChangGuildEnd"},
	{ month={},day={},hour={20},minute ={00},second={0},notopenserverdays={1,2,3,4},npcScene="sys",npcName="function",npcFunc= "YuanGuZhanChangGuildEnd"},

    --一分钟后再执行一次，跨服与逻辑服会有时间差间隔，把钻时间差进入的玩家也踢出去
	{ month={},day={},hour={11},minute ={01},second={0},notopenserverdays={1,2,3,4},npcScene="sys",npcName="function",npcFunc= "YuanGuZhanChangGuildEnd,1"},
    { month={},day={},hour={15},minute ={01},second={0},notopenserverdays={1,2,3,4},npcScene="sys",npcName="function",npcFunc= "YuanGuZhanChangGuildEnd,1"},
	{ month={},day={},hour={20},minute ={01},second={0},notopenserverdays={1,2,3,4},npcScene="sys",npcName="function",npcFunc= "YuanGuZhanChangGuildEnd,1"},
	
	
	
--	{ month={},day={},hour={23},minute ={55},second={0},npcScene="sys",npcName="function",npcFunc= "CrossServerClose"}, --跨服关闭入口
--    { month={},day={},hour={00},minute ={05},second={0},npcScene="sys",npcName="function",npcFunc= "CrossServerOpen"}, --跨服开启入口
	
	
	------庆典活动的时候，鸿运当头，开奖
	{ month={},day={},hour={21},minute ={00},second={0},npcScene="sys",npcName="function",npcFunc= "HongYunDangTou_Run"}, --活动结束
	
	{ month={},day={},hour={21},minute ={00},second={0},npcScene="sys",npcName="function",npcFunc= "OneYearHongYunDangTou_Run"}, --活动结束
	
	------春节活动的时候，鸿运当头，开奖
	{ month={},day={},hour={21},minute ={00},second={0},npcScene="sys",npcName="function",npcFunc= "SpringHongYunDangTou_Run"}, --春节
	
	
    --行会boss
    { month={},day={},hour={00},minute ={00},second={0},npcScene="sys",npcName="function",npcFunc= "GuildFubenBossStart"}, 
    { month={},day={},hour={23},minute ={30},second={0},npcScene="sys",npcName="function",npcFunc= "GuildFubenBossEnd"}, 
	--行会镖车

    ---激情行会报名
  --  { month={},day={},week={0},hour={19},minute ={50},second={0},npcScene="sys",npcName="function",npcFunc= "StartJiQingGuildSignUp"},
  --  { month={},day={},week={0},hour={20},minute ={10},second={0},npcScene="sys",npcName="function",npcFunc= "EndJiQingGuildSignUp"},
    --激情行会开始
  --  { month={},day={},week={0},hour={20},minute ={00},second={0},npcScene="sys",npcName="function",npcFunc= "StartJiQingGuild"},
   -- { month={},day={},week={0},hour={21},minute ={00},second={0},npcScene="sys",npcName="function",npcFunc= "EndJiQingGuild"}, --激情行会结束



	--{ month={},day={},week={2,4,6},hour={20},minute ={5},second={0},notopenserverdays ={1,2},notcombineserverdays ={1,2},npcScene="sys",npcName="function",npcFunc= "SkbStartFiveMins"},			--沙巴克开始5分钟的处理
	--{ month={},day={},week={2,4,6},hour={20},minute ={5},second={0},notopenserverdays ={1,2},notcombineserverdays ={1,2},npcScene="sys",npcName="function",npcFunc= "SkbStartFiveMins"},			--沙巴克开始5分钟的处理		

	-----------------------------------------------黑龙魔君散宝-------------------------------------------------------------	
	--{ month={},day={},week={},hour={19},minute ={5},second={0},npcScene="sys",npcName="function",npcFunc= "PreStartTreasureBoss"},
	--{ month={},day={},week={},hour={19},minute ={10},second={0},npcScene="sys",npcName="function",npcFunc= "StartKillTreasureBoss"}, 
	--{ month={},day={},week={},hour={19},minute ={35},second={0},npcScene="sys",npcName="function",npcFunc= "DragonEscape"}, 
	--{ month={},day={},week={},hour={19},minute ={40},second={0},npcScene="sys",npcName="function",npcFunc= "EndKillTreasureBoss"},


    --开服活动- 充值 
    --充值第一轮开始
    --{ month={},day={},week={},hour={00},minute ={00},second={00},openserverdays ={2},npcScene="sys",npcName="function",npcFunc= "Pay_Rank_Activity_Start,1"},
    ----充值第一轮结束	
    --{ month={},day={},week={},hour={08},minute ={00},second={00},openserverdays ={2},npcScene="sys",npcName="function",npcFunc= "Pay_Rank_Activity_Stop"},
    ----充值第二轮开始
    --{ month={},day={},week={},hour={08},minute ={00},second={00},openserverdays ={2},npcScene="sys",npcName="function",npcFunc= "Pay_Rank_Activity_Start,2"},		
    -- --充值第二轮结束
    --{ month={},day={},week={},hour={16},minute ={00},second={00},openserverdays ={2},npcScene="sys",npcName="function",npcFunc= "Pay_Rank_Activity_Stop"}, 
    ----充值第三轮开始	
    --{ month={},day={},week={},hour={16},minute ={00},second={00},openserverdays ={2},npcScene="sys",npcName="function",npcFunc= "Pay_Rank_Activity_Start,3"},
    ----充值第三轮结束
    --{ month={},day={},week={},hour={00},minute ={00},second={00},openserverdays ={3},npcScene="sys",npcName="function",npcFunc= "Pay_Rank_Activity_Stop"},
    ----充值第四轮开始
    --{ month={},day={},week={},hour={00},minute ={00},second={00},openserverdays ={3},npcScene="sys",npcName="function",npcFunc= "Pay_Rank_Activity_Start,4"},
    ----充值第四轮结束
    --{ month={},day={},week={},hour={08},minute ={00},second={00},openserverdays ={3},npcScene="sys",npcName="function",npcFunc= "Pay_Rank_Activity_Stop"},
    ----充值第五轮开始
    --{ month={},day={},week={},hour={08},minute ={00},second={00},openserverdays ={3},npcScene="sys",npcName="function",npcFunc= "Pay_Rank_Activity_Start,5"},
    ----充值第五轮结束
    --{ month={},day={},week={},hour={16},minute ={00},second={00},openserverdays ={3},npcScene="sys",npcName="function",npcFunc= "Pay_Rank_Activity_Stop"},
    ----充值第六轮开始
    --{ month={},day={},week={},hour={16},minute ={00},second={00},openserverdays ={3},npcScene="sys",npcName="function",npcFunc= "Pay_Rank_Activity_Start,5"},
    ----充值第六轮结束
    --{ month={},day={},week={},hour={00},minute ={00},second={00},openserverdays ={4},npcScene="sys",npcName="function",npcFunc= "Pay_Rank_Activity_Stop"},

	-- 圣诞BOSS：(圣诞来袭)
	{ month={},day={},hour={19},minute ={45},second={0},npcScene="sys",npcName="function",npcFunc= "ChristmasBossActivity_Run"},
}


--#else
--跨服服务器配置
TimerConfig=
{

	--跨服BOSS战
	{ month={},day={},week={2},hour={22},minute ={20},second={0},notopenserverdays ={},npcScene="sys",npcName="function",npcFunc= "StartCrossBoss"},				--创建跨服boss开始
	{ month={},day={},week={2},hour={23},minute ={20},second={0},notopenserverdays ={},npcScene="sys",npcName="function",npcFunc= "EndCrossBoss"},				--结束跨服boss
	{ month={},day={},week={2},hour={23},minute ={30},second={0},notopenserverdays ={},npcScene="sys",npcName="function",npcFunc= "RebackRawServer"},				--踢回玩家回原来的服 

	--跨服天下第一
	{ month={},day={},week={6},hour={22},minute ={20},second={0},notopenserverdays ={},npcScene=Lang.SceneName.s00147,npcName=Lang.EntityName.n00221,npcFunc= "StartCrossWorldWar"},			--天下第一开始
	{ month={},day={},week={6},hour={23},minute ={20},second={0},notopenserverdays ={},npcScene=Lang.SceneName.s00147,npcName=Lang.EntityName.n00221,npcFunc= "EndCrossWorldWar"},			--天下第一结束

	{ month={},day={},week={6},hour={22},minute ={25},second={0},notopenserverdays ={},npcScene=Lang.SceneName.s00147,npcName=Lang.EntityName.n00221,npcFunc= "CrossWorldFiveMun"},			--天下第一第五分钟
	{ month={},day={},week={6},hour={22},minute ={50},second={0},notopenserverdays ={},npcScene=Lang.SceneName.s00147,npcName=Lang.EntityName.n00221,npcFunc= "CrossWorldHalfHour"},		--天下第一半个小时的处理

	--要关闭跨服
	{ month={},day={},week={6},hour={23},minute ={15},second={0},npcScene=Lang.SceneName.s00147,npcName=Lang.EntityName.n00221,npcFunc= "BroadLastCloaseCoss,1"},
	{ month={},day={},week={6},hour={23},minute ={19},second={0},npcScene=Lang.SceneName.s00147,npcName=Lang.EntityName.n00221,npcFunc= "BroadLastCloaseCoss,2"},

	{ month={},day={},week={6},hour={23},minute ={30},second={0},notopenserverdays ={},npcScene="sys",npcName="function",npcFunc= "RebackRawServer"},				--踢回玩家回原来的服 
	
	{month={},day={},week={2},hour={22},minute={0},second={0},notopenserverdays ={},npcScene="sys",npcName="function",npcFunc= "OnClearCrossGuildList"},	--清除跨服沙城战的攻城列表

	{month={},day={},week={4},hour={19},minute={50},second={0},notopenserverdays ={},npcScene="sys",npcName="function",npcFunc= "OnCrossSbkBroadTips"},	--跨服沙巴克开始的预告
	{month={},day={},week={4},hour={20},minute={0},second={0},notopenserverdays ={},npcScene="sys",npcName="function",npcFunc= "OnStartCrossGuildSbk"},	--开始跨服沙巴克
	{month={},day={},week={4},hour={20},minute={10},second={0},notopenserverdays ={},npcScene="sys",npcName="function",npcFunc= "OnTenMinCrossOp"},		--跨服开始十分钟
	{month={},day={},week={4},hour={22},minute={0},second={0},notopenserverdays ={},npcScene="sys",npcName="function",npcFunc= "OnEndCrossGuildSbk"},		--跨服沙巴克结束

	{ month={},day={},week={4},hour={22},minute ={30},second={0},notopenserverdays ={},npcScene="sys",npcName="function",npcFunc= "RebackRawServer"},				--踢回玩家回原来的服 

	{ month={},day={},week={4},hour={20},minute ={15,30,45},second={0},npcScene="sys",npcName="function",npcFunc= "FreshCrossSbkMonsterOnTime"},		--沙巴克怪物进攻方案
	{ month={},day={},week={4},hour={21},minute ={0,15,30},second={0},npcScene="sys",npcName="function",npcFunc= "FreshCrossSbkMonsterOnTime"},		--沙巴克怪物进攻方案
}
--#endif