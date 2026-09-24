--支线任务配置

BranchTaskConfig = {
	{
		needLevel = 57, --等级达到57级
		Award = {
				{type = 0, id = 541, count = 10,bind = 1},--精羽毛*10
				--{type = 5, id = 0, count = 3000000,bind = 1},--300万绑金
			    },  -- 完成支线的奖励
		condition = {type=6,params={}}, --支线完成的条件
		branchTaskDesc = "\\<(c0xFFFFFFF00)[支线任务]>\\<创建或者加入行会/@@showWin,7>\\<(c0xFFFFF0000)奖励:><(c0xFFFF07800)精羽毛*10><领奖/@@GetbranchAward,1>\\",
        broadcastDesc = "恭喜<(c0xFFF00ff00)%s>完成支线1任务,获得<(c0xFFF00ff00)精羽毛*10>的奖励!", --全服2048消息
       -- ttwindowDesc = "未知暗殿\\可爆出:60、65、70级装备",
       -- btnLink = "M卧龙城:185:184:未知暗殿", 
	},
	{
		needLevel = 68, --等级达到69级
		Award = {
				{type = 2, id = 0, count = 10000000,bind = 1},--1000万经验
				{type = 5, id = 0, count = 3000000,bind = 1},--300万绑金
			    },  -- 完成支线的奖励
		condition = {type=4,params={{69}}}, --支线完成的条件
		branchTaskDesc = "\\<(c0xFFFFFFF00)[支线任务]>\\<(c0xFFFFF0000)等级达到><(c0xFFF00FF00)69><(c0xFFFFF0000)级>%s\\<(c0xFFFFF0000)奖励:><(c0xFFFF07800)1000W经验、300W绑金><领奖/@@GetbranchAward,2>\\",
        broadcastDesc = "恭喜<(c0xFFF00ff00)%s>完成支线2任务,获得<(c0xFFF00ff00)1000W经验、300W绑金>的奖励!", --全服2048消息
       -- ttwindowDesc = "未知暗殿\\可爆出:60、65、70级装备",
       -- btnLink = "M卧龙城:185:184:未知暗殿", 
	},
	
	{
		needLevel = 69, --穿戴5件60级装备
		Award = {
				{type = 2, id = 0, count = 20000000,bind = 1},--2000万经验
				{type = 5, id = 0, count = 1000000,bind = 1},--100万绑金
			    },  -- 完成支线的奖励
		condition = {type=2,params={{60},{2}}}, --支线完成的条件
		branchTaskDesc = "\\<(c0xFFFFFFF00)[支线任务]>\\<(c0xFFFFF0000)穿戴><(c0xFFF00FF00)2件><(c0xFFFFF0000)60级以上装备>%s\\<(c0xFFFFF0000)奖励:><(c0xFFFF07800)2000W经验、100W绑金><领奖/@@GetbranchAward,3>\\<(c0xFFFFF0000)推荐:><王者礼包/@@showWin,158> <未知暗殿/M卧龙城:186:185:未知暗殿><(x卧龙城:186:185:未知暗殿)>\\",
                broadcastDesc = "恭喜<(c0xFFF00ff00)%s>完成支线3任务,获得<(c0xFFF00ff00)2000W经验、100W绑金>的奖励!", --全服2048消息
	},
	-----------------------------------------------
        
	{
		needLevel = 69, --穿戴5件60级装备
		Award = {
				{type = 2, id = 0, count = 50000000,bind = 1},--3000万经验
				{type = 5, id = 0, count = 3000000,bind = 1},--300万绑金
			    },  -- 完成支线的奖励
		condition = {type=2,params={{60},{5}}}, --支线完成的条件
		branchTaskDesc = "\\<(c0xFFFFFFF00)[支线任务]>\\<(c0xFFFFF0000)穿戴><(c0xFFF00FF00)5件><(c0xFFFFF0000)60级以上装备>%s\\<(c0xFFFFF0000)奖励:><(c0xFFFF07800)5000W经验、300W绑金><领奖/@@GetbranchAward,4>\\<(c0xFFFFF0000)推荐:><王者礼包/@@showWin,158> <未知暗殿/M卧龙城:186:185:未知暗殿><(x卧龙城:186:185:未知暗殿)>\\",
                broadcastDesc = "恭喜<(c0xFFF00ff00)%s>完成支线4任务,获得<(c0xFFF00ff00)5000W经验、300W绑金>的奖励!", --全服2048消息
	},
	-----------------------------------------------
	{
		needLevel = 69, --穿戴5件65级装备
		Award = {
				{type = 2, id = 0, count = 60000000,bind = 1},--5000万经验
			        {type = 5, id = 0, count = 4000000,bind = 1},--400万绑金
			    },  -- 完成支线的奖励
		condition = {type=2,params={{65},{5}}}, --支线完成的条件
		branchTaskDesc = "\\<(c0xFFFFFFF00)[支线任务]>\\<(c0xFFFFF0000)穿戴><(c0xFFF00FF00)5件><(c0xFFFFF0000)65级以上装备>%s\\<(c0xFFFFF0000)奖励:><(c0xFFFF07800)6000W经验、400W绑金><领奖/@@GetbranchAward,5>\\<(c0xFFFFF0000)推荐:><礼包/@@showWin,158> <未知暗殿/M卧龙城:186:185:未知暗殿><(x卧龙城:186:185:未知暗殿)> <合成/@@showWin,120>\\",
                broadcastDesc = "恭喜<(c0xFFF00ff00)%s>完成支线5任务,获得<(c0xFFF00ff00)6000W经验、400W绑金>的奖励!", --全服2048消息
	},
	-----------------------------------------------
	{
		needLevel = 69, --强化8件+5装备
		Award = {
				{type = 2, id = 0, count = 70000000,bind = 1},--超级经验丹
			        {type = 5, id = 0, count = 5000000,bind = 1},--800万绑金
			    },  -- 完成支线的奖励
		condition = {type=3,params={{5},{8}}}, --支线完成的条件
		branchTaskDesc = "\\<(c0xFFFFFFF00)[支线任务]>\\<(c0xFFFFF0000)强化><(c0xFFF00FF00)8件><(c0xFFFFF0000)+5的装备>%s\\<(c0xFFFFF0000)奖励:><(c0xFFFF07800)7000W经验、500W绑金><领奖/@@GetbranchAward,6>\\<(c0xFFFFF0000)推荐:><强化装备/@@showWin,5>\\",
	    broadcastDesc = "恭喜<(c0xFFF00ff00)%s>完成支线6任务,获得<(c0xFFF00ff00)7000W经验、500W绑金>的奖励!", --全服2048消息
	   -- ttwindowDesc = "堕落魔域\\可爆出:65、70、75级装备",
       -- btnLink = "M卧龙城:183:176:堕落魔域", 
	},
	-----------------------------------------------
--	{
--		needLevel = 69, --击杀1只堕落魔域BOSS
--		Award = {
--				{type = 2, id = 0, count = 80000000,bind = 1},--7000万经验
--			        {type = 5, id = 0, count = 6000000,bind = 1},--500万绑金
--			    },  -- 完成支线的奖励
--		condition = {type=1,params={{1},{192},{341,342,343,344,345}},}, --支线完成的条件  192表示堕落魔域场景id
--		branchTaskDesc = "<(c0xFFFFFFF00)[支线任务]>\\<(c0xFFFFF0000)消灭><(c0xFFF00FF00)1只><(c0xFFFFF0000)堕落魔域BOSS>%s\\<(c0xFFFFF0000)奖励:><(c0xFFFF07800)8000W经验、600W绑金><领奖/@@GetbranchAward,5>\\<(c0xFFFFF0000)推荐:><堕落魔域/M卧龙城:183:177:堕落魔域><(x卧龙城:183:177:堕落魔域)> <组队完成/@@showWin,30>\\",
--		broadcastDesc = "恭喜<(c0xFFF00ff00)%s>完成支线5任务,获得<(c0xFFF00ff00)8000W经验、600W绑金>的奖励!", --全服2048消息
--	},
	-----------------------------------------------
	{
		needLevel = 69, --穿戴5件70级装备
		Award = {
				{type = 2, id = 0, count = 90000000,bind = 1},--超级经验丹
			        {type = 5, id = 0, count = 7000000,bind = 1},--600万绑金
			    },  -- 完成支线的奖励
		condition = {type=2,params={{70},{5}}}, --支线完成的条件
		branchTaskDesc = "\\<(c0xFFFFFFF00)[支线任务]>\\<(c0xFFFFF0000)穿戴><(c0xFFF00FF00)5件><(c0xFFFFF0000)70级以上装备>%s\\<(c0xFFFFF0000)奖励:><(c0xFFFF07800)9000W经验、700W绑金><领奖/@@GetbranchAward,7>\\<(c0xFFFFF0000)推荐:><宝藏/@@showWin,31> <未知暗殿/M卧龙城:186:185:未知暗殿><(x卧龙城:186:185:未知暗殿)> <合成/@@showWin,120>\\",
                broadcastDesc = "恭喜<(c0xFFF00ff00)%s>完成支线7任务,获得<(c0xFFF00ff00)9000W经验、700W绑金>的奖励!", --全服2048消息
	},
	-----------------------------------------------
	{
		needLevel = 69, --穿戴5件75级装备
		Award = {
				{type = 2, id = 0, count = 100000000,bind = 1},--超级经验丹
			        {type = 5, id = 0, count = 8000000,bind = 1},--700万绑金
			    },  -- 完成支线的奖励
		condition = {type=2,params={{75},{5}}}, --支线完成的条件
		branchTaskDesc = "\\<(c0xFFFFFFF00)[支线任务]>\\<(c0xFFFFF0000)穿戴><(c0xFFF00FF00)5件><(c0xFFFFF0000)75级以上装备>%s\\<(c0xFFFFF0000)奖励:><(c0xFFFF07800)1亿经验、800W绑金><领奖/@@GetbranchAward,8>\\<(c0xFFFFF0000)推荐:><BOSS/@@showWin,96>  <合成/@@showWin,120>  <宝藏/@@showWin,31>\\",
                broadcastDesc = "恭喜<(c0xFFF00ff00)%s>完成支线8任务,获得<(c0xFFF00ff00)1亿经验、800W绑金>的奖励!", --全服2048消息
	},
	-----------------------------------------------

	{
		needLevel = 69, --击杀6只世界BOSS
		Award = {
				{type = 2, id = 0, count = 110000000,bind = 1},--超级经验丹
			        {type = 5, id = 0, count = 9000000,bind = 1},--800万绑金
			    },  -- 完成支线的奖励
		condition = {type=1,params={{6},{},{135,136,137,138,139,140,141,142,143,239,240,241,242,243,244,245,246,247,248}},}, --支线完成的条件
		branchTaskDesc = "\\<(c0xFFFFFFF00)[支线任务]>\\<(c0xFFFFF0000)消灭><(c0xFFF00FF00)6只><任意世界BOSS/@@showWin,96,1>%s\\<(c0xFFFFF0000)奖励:><(c0xFFFF07800)1.1亿经验、900W绑金><领奖/@@GetbranchAward,9>\\<(c0xFFFFF0000)推荐:><打开BOSS面板/@@showWin,96,1>\\",
	        broadcastDesc = "恭喜<(c0xFFF00ff00)%s>完成支线9任务,获得<(c0xFFF00ff00)1.1亿经验、900W绑金>的奖励!", --全服2048消息
	},
	-------------------------------------------------
	-------------------------------------------------
	{
		needLevel = 69, --击杀6只雷泽BOSS
		Award = {
				{type = 2, id = 0, count = 200000000,bind = 1},--超级经验丹
			        {type = 5, id = 0, count = 10000000,bind = 1},--1000万绑金
			    },  -- 完成支线的奖励
		condition = {type=1,params={{6},{},{323,324,325,326,327,328,329,330}},}, --支线完成的条件
		branchTaskDesc = "\\<(c0xFFFFFFF00)[支线任务]>\\<(c0xFFFFF0000)消灭><(c0xFFF00FF00)6只><雷泽BOSS/@@showWin,96,4>%s\\<(c0xFFFFF0000)奖励:><(c0xFFFF07800)2亿经验、1000W绑金><领奖/@@GetbranchAward,10>\\<(c0xFFFFF0000)推荐:><打开BOSS面板/@@showWin,96,4>\\",
	        broadcastDesc = "恭喜<(c0xFFF00ff00)%s>完成支线10任务,获得<(c0xFFF00ff00)2亿经验、1000W绑金>的奖励!", --全服2048消息
	},
	-------------------------------------------------
	{
		needLevel = 69, --穿戴5件2转装备
		Award = {
				{type = 2, id = 0, count = 300000000,bind = 1},--超级经验丹
			        {type = 5, id = 0, count = 12000000,bind = 1},--1200万绑金
			    },  -- 完成支线的奖励
		condition = {type=5,params={{2},{5}}}, --支线完成的条件
		branchTaskDesc = "\\<(c0xFFFFFFF00)[支线任务]>\\<(c0xFFFFF0000)穿戴><(c0xFFF00FF00)5件><(c0xFFFFF0000)2转以上装备>%s\\<(c0xFFFFF0000)奖励:><(c0xFFFF07800)3亿经验、1200W绑金><领奖/@@GetbranchAward,11>\\<(c0xFFFFF0000)推荐:><BOSS/@@showWin,96>  <宝藏/@@showWin,31>\\",
                broadcastDesc = "恭喜<(c0xFFF00ff00)%s>完成支线11任务,获得<(c0xFFF00ff00)2亿经验、1200W绑金>的奖励!", --全服2048消息
	},	
	
	-------------------------------------------------
	{
		needLevel = 69, --穿戴5件4转装备
		Award = {
				{type = 2, id = 0, count = 400000000,bind = 1},--超级经验丹
			        {type = 5, id = 0, count = 15000000,bind = 1},--1500万绑金
			    },  -- 完成支线的奖励
		condition = {type=5,params={{4},{5}}}, --支线完成的条件
		branchTaskDesc = "\\<(c0xFFFFFFF00)[支线任务]>\\<(c0xFFFFF0000)穿戴><(c0xFFF00FF00)5件><(c0xFFFFF0000)4转以上装备>%s\\<(c0xFFFFF0000)奖励:><(c0xFFFF07800)4亿经验、1500W绑金><领奖/@@GetbranchAward,12>\\<(c0xFFFFF0000)推荐:><BOSS/@@showWin,96>  <宝藏/@@showWin,31>\\",
                broadcastDesc = "恭喜<(c0xFFF00ff00)%s>完成支线12任务,获得<(c0xFFF00ff00)4亿经验、1500W绑金>的奖励!", --全服2048消息
	},	
	
	-------------------------------------------------
	{
		needLevel = 69, --击杀4只狂暴BOSS
		Award = {
				{type = 2, id = 0, count = 600000000,bind = 1},--超级经验丹
			        {type = 5, id = 0, count = 20000000,bind = 1},--1000万绑金
			    },  -- 完成支线的奖励
		condition = {type=1,params={{4},{49},{474,475,476,477,478,479,480,481}},}, --支线完成的条件
		branchTaskDesc = "\\<(c0xFFFFFFF00)[支线任务]>\\<(c0xFFFFF0000)消灭><(c0xFFF00FF00)4只><狂暴BOSS/@@showWin,96,5>%s\\<(c0xFFFFF0000)奖励:><(c0xFFFF07800)6亿经验、2000W绑金><领奖/@@GetbranchAward,13>\\<(c0xFFFFF0000)推荐:><打开BOSS面板/@@showWin,96,5>\\",
	        broadcastDesc = "恭喜<(c0xFFF00ff00)%s>完成支线13任务,获得<(c0xFFF00ff00)6亿经验、2000W绑金>的奖励!", --全服2048消息
	},
	-------------------------------------------------
	-- 日常经验珠 /@@GetbranchAward,100
	-- 日常经验珠弹窗 /@@GetbranchAward,101

	
}