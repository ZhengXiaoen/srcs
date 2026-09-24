--#include "data\language\LangCode.txt" once			--语言包
CrossBattlefieldCfg = {

	ActivityTime = 20 ; -- 每场活动持续时间，单位：分钟	
	-- 报名判断条件
	CondictionType = {
		Level = 1;   -- 允许报名等级
		Coin = 2; 	-- 报名需要多少金币
		-- 缺少的提示
		[1] = Lang.Activity.kfzc0002; -- 等级不够的提示
		[2] = Lang.Activity.kfzc0003; 
	};
	ApplyCondictions = {
		-- type是上面CondictionType里面的类型
		{type = 1, Count = 55};
		{type = 2, Count = 10000};
	};
	TriggerNewActivity = 30; -- 报名人数达到多少人时，触发新一场活动
	NewActivityPlayers = 20; -- 每场活动多少人？平分为降魔、猎妖2个阵营
	CountDown = 30; -- 进入战场倒计时，单位:秒
	FubenId = 22;	-- 副本id
	SceneId = 33;	-- 场景id
	XiangMoPos = {1,2}; -- 降魔阵营进入新战场坐标
	LieYaoPos = {1,2}; -- 猎妖阵营进入新战场坐标
	QizhiId = 700;	-- 旗帜id
	ShouweiId = 222; -- 守卫的id
	AddBattleScoreInterval = 5; -- 定期在增加本队战场积分的时间间隔，单位：秒
	AddBattleScore = 1; -- 每个周期增加本队战场积分量，单位：秒
	AddBattleScoreWhenKillOther = 2; -- 杀死对方，本队添加多少积分
	AddShadirongyuWhen = 10; -- 杀死对方，添加多少杀敌荣誉
	EndBattleScore = 1000; -- 达到多少积分，活动结束
	FrontPlayers = 10; -- 排行榜取前多少名
}