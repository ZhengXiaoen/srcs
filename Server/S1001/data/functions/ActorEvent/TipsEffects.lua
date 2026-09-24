--#include "data\functions\GlobalDefine.lua" once

--[[static public const Right_Top_Active                		 :int = 8; // 福利按钮
static public const Right_Top_HangUp                		 :int = 9; // 挂机按钮
static public const Right_Top_OpenServer                  	 :int = 10; // 开服嘉年华
static public const Right_Top_Target                 		 :int = 11; // 目标
static public const Right_Top_Auction	                	 :int = 12; // 拍卖	
static public const Right_Top_Quest                		 	 :int = 13; // 日常按钮
static public const Right_Top_FirstChange               	 :int = 14; // 首次充值
static public const Right_Top_Dream                			 :int = 15; // 探索宝胀
static public const Right_Top_Online                 		 :int = 16; // 在线奖励
static public const Right_Top_Treasure                		 :int = 17; // 珍宝
static public const Right_Top_ItemRecover              		 :int = 18; // 诛魔结阵
static public const Right_Top_Raids                	 		 :int = 19; // 战神史册
static public const Right_Top_MasterGift	               	 :int = 20; // 桃李天下   徒弟出师
static public const Right_Top_PupilGift               		 :int = 21; // 教导有方   徒弟升级
static public const Rigth_Top_DiscipleGift			    	 :int = 22;	//良马腾飞   徒弟升级奖励
static public const Right_Top_Slg              	 			 :int = 24; // 战力竞技
static public const Right_Top_Secretary                	     :int = 25; // 新手帮助
static public const Rigth_Top_LandingReward                	 :int = 26; // 登陆奖励
static public const Rigth_Top_Clien_Btn						 :int = 27;	//登陆器右上的按钮
static public const Right_Top_All_People					 :int = 28;	//全民奖励
static public const Right_Top_Mount							 :int = 29;	//坐骑礼包
static public const Right_Top_Rock							 :int = 30;	//魂石礼包
static public const Right_Top_Hero							 :int = 31;	//英雄礼包
static public const Right_Top_PhaseRecharge					 :int = 32;  //阶段充值
static public const Right_Top_CombineActive					 :int = 36;	//合服回馈
static public const Right_Top_Combine						 :int = 37;	//合服礼包
static public const Right_HundredActive						 :int = 39;	//百服活动
static public const Right_Top_HoliDay						 :int = 41;	//节日活动
static public const Right_Top_Christ						 :int = 42;	//圣诞礼包
static public const Right_Top_YuanDan						 :int = 43;	//元旦礼包
static public const Right_Top_Salar							 :int = 44;	//工资
static public const Right_Top_FeedBack						 :int = 46;	//惊喜回馈礼包	
static public const Right_Top_Rich							 :int = 47;	//惊喜回馈礼包
static public const Right_Top_LuckLottery          			 :int = 48;	//新年祝福活动 幸运大抽奖
static public const Right_Top_BenisonFirst         			 :int = 49;	//新年祝福活动 祝福第一奖励
static public const Right_Top_OldPlayerBack        			 :int = 50;	//老友回归活动
static public const Right_Top_NewServiceAct        			 :int = 51;	//新服活动
static public const Right_Top_RefreshQuest					 :int = 55; //天书任务
static public const Right_Top_Sbk                            :int = 59;//行会沙巴克
static public const Right_Top_Boss                           :int = 60;//导航Boss面板 
static public const Right_Top_Activity_Hall                  :int = 61//活动大厅
static public const Right_Top_Fortune_Plaza                  :int = 62//财富广场
--]]

--以上为前端按钮ID
--激活按钮特效提示
function IsTipsEffects(sysarg,buttonID)
	--print("buttonID"..buttonID)
	local netPack = DataPack.allocPacket(sysarg, LogicCmd.miscSys.sysId, LogicCmd.miscSys.sub.sTipsEffects)  --申请一个数据包
	if netPack then
		DataPack.writeByte(netPack, buttonID)
		DataPack.writeByte(netPack, 1)
		DataPack.flush(netPack)
		--print(buttonID)
	end
end