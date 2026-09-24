--#include "..\..\language\LangCode.txt"
--[[
	//这里表示DB读出的排行榜类型
	enum RankType 
	{
		rtBattlePower = 0,			//战力排行
		rtWarriorBp,				//战士战力排行
		rtMagicianBp,				//法师战力排行
		rtWizardBp,					//道士战力排行
		rtLevel,					//等级排行
		rtWarriorLevel,				//战士等级排行
		rtMagicianLevel,			//法师等级排行
		rtWizardLevel,				//道士等级排行
		rtCoin,						//金币排行
		rtGirlCharm,				//女性魅力排行榜
		rtBoyCharm,					//男性帅气排行榜
		
	}
--]]


--[[
	TitleId =
	{
		[0] = "第一战士",   --战士战力排名第一
		[1] = "第一法师",   --法师战力排名第一
		[2] = "第一道士",   --道士战力排名第一
	}
--]]

--称号配置,头衔配置,散人称号配置,散人头衔配置,配置HeadTitle  
--现最多支持0-96 个头衔
HeadTitle =
{
----#include "headTitle/headTitle0.lua"----未用(id:0) 			激活方式：登录便可获得
--#include "headTitle/headTitle1.lua"----第一战士(id:1) 			激活方式：排行榜(等级榜)中最高等级的战士
--#include "headTitle/headTitle2.lua"----第一法师(id:2) 			激活方式：排行榜(等级榜)中最高等级的法师
--#include "headTitle/headTitle3.lua"----第一道士(id:3) 			激活方式：排行榜(等级榜)中最高等级的道士
--#include "headTitle/headTitle4.lua"----天下第一(id:4) 			激活方式：排行榜(战力榜)中排行第一
----#include "headTitle/headTitle5.lua"----定个小目标(id:5) 	激活方式：充值0/1元宝
--#include "headTitle/headTitle6.lua"----壕(id:6) 					激活方式：单笔充值达到500000元宝
--#include "headTitle/headTitle7.lua"----一掷萬金(id:7) 			激活方式：开服5天内,累计消费达到0/100000元宝
--#include "headTitle/headTitle8.lua"----有品味的VIP(id:8)	激活方式：VIP等级达到1/6VIP
--#include "headTitle/headTitle9.lua"----万人斩(id:9) 			激活方式：阵营战(活动)中累计击杀达到0/1000人
----#include "headTitle/headTitle10.lua"----大富翁(id:10) 			激活方式：累计获得达到0/500000绑定元宝
--#include "headTitle/headTitle11.lua"----热血青年(id:11) 		激活方式：累积登陆游戏0/4天
--#include "headTitle/headTitle12.lua"----寻寳不归路(id:12) 	激活方式：探索宝藏累计消费达到0/1000000元宝
--#include "headTitle/headTitle13.lua"----無翼伦比(id:13) 		激活方式：开服7天内,翅膀进阶至0/7阶
----#include "headTitle/headTitle14.lua"----珠光宝气(id:14) 		激活方式：开服7天内,圣珠装备提升至0/20阶
----#include "headTitle/headTitle15.lua"----铄石流金(id:15) 		激活方式：开服7天内,宝石装备提升至0/20阶
--#include "headTitle/headTitle16.lua" ----雷霆军团长(id:16)   
--#include "headTitle/headTitle17.lua" ----光芒军团长(id:17) 
--#include "headTitle/headTitle18.lua" ----烈焰军团长(id:18) 
----#include "headTitle/headTitle19.lua" -----毁天灭地(id:19)  废弃	
----#include "headTitle/headTitle20.lua" ---死亡召唤(id:20)  废弃	  
--#include "headTitle/headTitle21.lua" ----指导员达人(id:21)  
----#include "headTitle/headTitle22.lua" ----BOSS克星(id34) 	废弃
--#include "headTitle/headTitle23.lua" ----最高等级(id:23) 
--#include "headTitle/headTitle24.lua" ----补刀王(id:24) 
--#include "headTitle/headTitle25.lua"  --持宝人（id：25）
--#include "headTitle/headTitle26.lua"----武林盟主(id:26) 		激活方式：武林争霸(活动)中胜利的玩家
--#include "headTitle/headTitle28.lua"  --威风凛凛（id：28）
--#include "headTitle/headTitle29.lua"----沙城枭雄(id:29)			激活方式：王城大战(活动)中胜利的行会成员
--#include "headTitle/headTitle30.lua"----王城至尊(id:30) 		激活方式：王城大战(活动)中胜利的行会会长

--#include "headTitle/headTitle31.lua" ----装备全靠打(id:31) 	激活方式：登录便可获得
--#include "headTitle/headTitle32.lua" -----毁天灭地(id:32) 	激活方式：开服活动租赁
--#include "headTitle/headTitle33.lua" ---死亡召唤(id:33) 	   激活方式：开服活动租赁
--#include "headTitle/headTitle34.lua" ----BOSS克星(id34) 	激活方式：开服活动租赁
----#include "headTitle/headTitle35.lua" ----玩游戏上搜狗(id35) 	--搜狗

--#include "headTitle/headTitle36.lua" ----花好月圆(id36) 	--激活方式：购买
--#include "headTitle/headTitle37.lua" ----欢度国庆(id37) 	--激活方式：烟花兑换

--#include "headTitle/headTitle38.lua" ----青铜	
--#include "headTitle/headTitle39.lua" ----白银 	
--#include "headTitle/headTitle40.lua" ----黄金	
--#include "headTitle/headTitle41.lua" ----钻石	
--#include "headTitle/headTitle42.lua" ----王者	
--#include "headTitle/headTitle43.lua" ----荣耀	

--#include "headTitle/headTitle44.lua" ----鸿运当头	
--#include "headTitle/headTitle45.lua" ----百元大户	
----#include "headTitle/headTitle46.lua" ----7k7k  --7k平台

----#include "headTitle/headTitle47.lua" ----玩散人就上哎奇异
----#include "headTitle/headTitle48.lua" ----爱奇艺影视VIP用户
----#include "headTitle/headTitle49.lua" ----酷趣的玩游戏

--#include "headTitle/headTitle50.lua" ----51大厅称号
--#include "headTitle/headTitle51.lua" ----51大厅称号
--#include "headTitle/headTitle52.lua" ----51大厅称号
--#include "headTitle/headTitle53.lua" ----51大厅称号
--#include "headTitle/headTitle54.lua" ----51大厅称号
--#include "headTitle/headTitle55.lua" ----51大厅称号

--#include "headTitle/headTitle56.lua" ----结义金兰男称号
--#include "headTitle/headTitle57.lua" ----结义金兰女称号
--#include "headTitle/headTitle58.lua" ----51超级会员称号
----#include "headTitle/headTitle59.lua" ----7477称号
----#include "headTitle/headTitle60.lua" ----9377s称号

--#include "headTitle/headTitle61.lua" ----名人堂唯我独尊
--#include "headTitle/headTitle62.lua" ----名人堂叱咤风云
--#include "headTitle/headTitle63.lua" ----名人堂名扬天下

--#include "headTitle/headTitle64.lua" ----抢红包济世菩萨
--#include "headTitle/headTitle65.lua" ----抢红包乐善好义
--#include "headTitle/headTitle66.lua" ----抢红包轻才好施

--#include "headTitle/headTitle67.lua" ----无敌幸运星
--#include "headTitle/headTitle68.lua" ----春节称号

--#include "headTitle/headTitle69.lua" ----战士
--#include "headTitle/headTitle70.lua" ----法师
--#include "headTitle/headTitle71.lua" ----道士

--#include "headTitle/headTitle72.lua" ----周年庆称号龙的传人

----#include "headTitle/headTitle73.lua" ----玩散人传说就上酷爱玩

--#include "headTitle/headTitle74.lua" ----个人竞技冠军
--#include "headTitle/headTitle75.lua" ----个人竞技亚军
--#include "headTitle/headTitle76.lua" ----个人竞技4强
--#include "headTitle/headTitle77.lua" ----个人竞技8强
--#include "headTitle/headTitle78.lua" ----个人竞技16强
--#include "headTitle/headTitle79.lua" ----个人竞技32强
--#include "headTitle/headTitle80.lua" ----个人竞技64强
--#include "headTitle/headTitle81.lua" ----个人竞技500强
--#include "headTitle/headTitle82.lua" ----森罗天照

--#include "headTitle/headTitle83.lua" ----森罗天照
--#include "headTitle/headTitle84.lua" ----森罗天照
--#include "headTitle/headTitle85.lua" ----森罗天照
--#include "headTitle/headTitle86.lua" ----森罗天照
--#include "headTitle/headTitle87.lua" ----森罗天照
--#include "headTitle/headTitle88.lua" ----森罗天照
--#include "headTitle/headTitle89.lua" ----森罗天照
--#include "headTitle/headTitle90.lua" ----森罗天照
--#include "headTitle/headTitle91.lua" ----森罗天照
--#include "headTitle/headTitle92.lua" ----森罗天照
--#include "headTitle/headTitle93.lua" ----森罗天照

--#include "headTitle/headTitle94.lua" ----森罗天照
--#include "headTitle/headTitle95.lua" ----森罗天照
--#include "headTitle/headTitle96.lua" ----森罗天照
--#include "headTitle/headTitle97.lua" ----森罗天照
--#include "headTitle/headTitle98.lua" ----森罗天照
--#include "headTitle/headTitle99.lua" ----森罗天照

--#include "headTitle/headTitle100.lua" ----春节称号


}