
--每周工资系统 签到
SignInAndSalary =
{
	--每日签到
	signIn = {219,220,221,222,223},	--签到触发成就ID
	
	--发工资
	desc = "开服<(c0xFFFFFF00)1～21天>在线每小时可累积<(c0xFFFFFF00)4绑定元宝>与<(c0xFFFFFF00)200荣誉>\\开服<(c0xFFFFFF00)22～42天>在线每小时可累积<(c0xFFFFFF00)5绑定元宝>与<(c0xFFFFFF00)250荣誉>\\开服<(c0xFFFFFF00)43天后>在线每小时可累积<(c0xFFFFFF00)6绑定元宝>与<(c0xFFFFFF00)300荣誉>",
	awards =	--每小时初始奖励
	{
		{type=7,id=0,count=1},
		{type=21,id=0,count=50},
	},
	salary = 
	{
	
		{
			begin = 1,	--开服天数区间开始
			over = 21,	--开服天数区间结束 -1代表以后
			rate = 4,	--奖励加成倍率(必须为整形)
			desc = "你每天在线<(c0xFF00FF00)1小时>可累积<(c0xFFFFFF00)4绑定元宝>与<(c0xFFFFFF00)200荣誉>的工资",
			
		},
		{
			begin = 22,	--开服天数区间开始
			over = 42,	--开服天数区间结束 -1代表以后
			rate = 5,	--奖励加成倍率
			desc = "你每天在线<(c0xFF00FF00)1小时>可累积<(c0xFFFFFF00)5绑定元宝>与<(c0xFFFFFF00)250荣誉>的工资",
		},
		{
			begin = 43,	--开服天数区间开始
			over = -1,	--开服天数区间结束 -1代表以后
			rate = 6,	--奖励加成倍率
			desc = "你每天在线<(c0xFF00FF00)1小时>可累积<(c0xFFFFFF00)6绑定元宝>与<(c0xFFFFFF00)300荣誉>的工资",
		},
	}
	
}