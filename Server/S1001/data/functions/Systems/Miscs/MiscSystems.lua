--杂项子系统消息实现 

--子消息号的用的表
local MiscsImplement = 
{
} 
MiscsImplement.main = function (sysarg, systemid, msgid, packet)

  if MiscsImplement[msgid] then
    MiscsImplement[msgid](sysarg, msgid, packet)
  end
end    

--[[
    注册杂项子系统消息处理函数，函数的形式为function (sysarg, msgid, packet)
]]
MiscsImplement.registerMsgHandler = function (msgid, proc)
  if MiscsImplement[msgid] then
    return false
  else
    MiscsImplement[msgid] = proc
    return true
  end
end
--[[
    取消已注册的子系统消息处理函数
]]
MiscsImplement.unregisterMsgHandler = function (msgid, proc)
  if MiscsImplement[msgid] == proc then
    MiscsImplement[msgid] = nil
    return true
  else
    return false
  end
end     

	--#include "FBRewardMsgHandler.lua" once    
	--#include "ArchiveTitleHandler.lua" once
	--#include "EnterChallengeSceneHandler.lua" once
--#include "QuestTargetSpaceMoveHandler.lua" once
--#include "RemoveScriptDelayMsg.lua" once
	--#include "GetLogOutCountMsg.lua" once
--#include "GetLogOutExpMsg.lua" once
	--#include "SetUpSystemDataMsg.lua" once
	--#include "StageChuanSongHandler.lua" once
--#include "BossOnTimeToClienMsg.lua" once			--发Boss状态给前端
--#include "GetAdvanceRewardHandler.lua" once
--#include "FlowerMsgHandler.lua" once
	--#include "ModifyCampDeclaration.lua" once
	--#include "OpenCampTask.lua" once
	--#include "TelToCampEquipNPC.lua" once
	--#include "SlotMachineGetWealth.lua" once	--老虎机开奖
--#include "ChangeIcon.lua" once
	--#include "impeachCampKing.lua" once
	--#include "ApplyLeaderConquest.lua" once
--#include "VIPSystem.lua" once
	--#include "CombatSpiritExchangeHandler.lua" once
--#include "ActorReliveHandler.lua" once
--#include "GetActivityAward.lua" once
	--#include "CampDartClienMsg.lua" once
--#include "SPUpdateInfo.lua" once
	--#include "WuLinZhengBaHandler.lua" once
	--#include "AthleticsPointHandler.lua" once 
--#include "SaveGameAddress.lua" once

--#include "LeaveActivityScene.lua" once

--#include "NewBieGuilde.lua" once

--#include "SpecialInteract.lua" once	--特殊交互
--#include "GetWorkDayAward.lua" once	--快乐上班领取
--#include "Voucher.lua" once	--代金劵
--#include "..\PaySalesSystem\PaySales.lua" once --
--#include "Festival.lua" once	--节日活动

--#include "..\TimeReward\Salary.lua" once --工资 
--#include "..\TimeReward\LotterySubSys.lua" once --在线抽奖
--#include "data\functions\Activity\MagicSky\NetMS.lua" once --魔幻星空的轮盘
--#include "CircleSubsys.lua" once --转身子系统
--#include "PreferentialGoods.lua" once --领取特惠礼包
--#include "data\functions\Activity\LoginToolsGift.lua" once --登录器礼包
--#include "data\functions\Activity\EveryDayPeyGift.lua" once --每日充值大礼包

--#include "GetFirstRechargeGift.lua" once --首充礼包

--#include "data\functions\Activity\GetGrowGiftBag.lua" once --成长礼包
--#include "data\functions\Activity\GetGrowGfitNum.lua" once --已领取成长礼包数量
--#include "data\functions\Activity\RechargeGift.lua" once --充值赠送礼包
--#include "data\functions\Activity\EveryDayCheck.lua" once --每日签到奖品
--#include "data\functions\Activity\BigGiftBag.lua" once --大礼包
--#include "data\functions\Activity\RatherActivity.lua" once --春节活动,热热闹闹齐欢聚
--#include "data\functions\Activity\phoneAwards.lua" once

--#include "ActivityHandler.lua" once --活动提示

--#include "data\functions\Activity\CDKeyGift.lua" once --序列号卡
--#include "QuestOtherAward.lua" once
--#include "GetCoinItemUseCount.lua" once
--#include "data\functions\Activity\ClickPanelFlag.lua" once --活动图标光效显示标识
--#include "data\functions\Fuben\LingShouXianRui.lua" once --发射和购买天雷弹
--#include "Deify.lua" once --封神
--#include "data\functions\ActorEvent\GameFund.lua" once		--逐日基金
--#include "NewServerEightDays.lua" once   --新区八天
--#include "data\functions\Activity\GetMergerGift.lua" once --合服活动
--#include "data\functions\Activity\MergerServer\DisCountShop.lua" once --打折商店
--#include "data\functions\Systems\Platforms\Platforms.lua" once --平台消息
--#include "data\functions\EquipEnhance\EquipConvertShield.lua" once --兑换盾牌
----#include "data\functions\ActorEvent\DiamondSoulUpHandle.lua" once --升级
--#include "data\functions\Fuben\EnterBossScene.lua" once  --进入BOSS所在场景
--#include "data\functions\EquipEnhance\GiveSpecialEquip.lua" once --免费领取赠送武器
--#include "data\functions\FunctionGift\FunctionGiftEx.lua" once  --功能礼包
--#include "data\functions\TreasureTrove\TreasureTroveEx.lua" once
--#include "GetBottlesExp.lua" once --领取经验瓶的经验
--#include "data\functions\Activity\GetAllPayMoneyAward.lua" once --领取累积充值奖励
  ----#include "data\functions\Activity\GetLoginAward.lua" once --领取七天登陆奖励
--#include "data\functions\Activity\EnterActivityScene.lua" once --活动面板进入活动场景
--#include "data\functions\Activity\OpenServerAward.lua" once --开服全民竞技奖励
--#include "data\functions\EquipEnhance\BuyShieldEquip.lua" once --购买盾牌
--#include "data\functions\LingShi\LingShiOperation.lua" once --灵石操作
--#include "data\functions\GodEquip\GodEquip.lua" once --神装操作
--#include "data\functions\BossListInfo\BossListInfo.lua" --BOSS面板信息
--#include "data\functions\BossListInfo\KillBossListInfo.lua" --可击杀BOSS面板信息
--#include "data\functions\Robot\Robot.lua" once    --机器人装备
--#include "data\functions\EquipEnhance\MaterialRelated.lua" once --血炼石、升级石操作
--#include "data\functions\EquipEnhance\EquipStove.lua" once --锻造炉装备操作
--#include "data\functions\Fuben\TianGuanScene.lua" once   --进入天关
--#include "data\functions\Activity\OneHundredActivity.lua" once --百服活动
--#include "data\functions\Activity\ExpRefining.lua" once --精炼经验
--#include "data\functions\Activity\GameFuben.lua" once --副本
--#include "data\functions\Activity\NewEveryDayPeyGift.lua" once --新每日充值礼包
--#include "data\functions\Activity\LaborActivity.lua" once --51活动
--#include "data\functions\Activity\QuestBuyExp.lua" once --主线购买经验
--#include "data\functions\Activity\DemonInvade.lua" once --魔族入侵活动
--#include "data\functions\Activity\MsgHandler.lua" once --活动消息处理器
--#include "data\functions\EquipEnhance\EquipExchange.lua" once		--盾牌、宝石、灵珠兑换盾灵、结晶、碎片
--#include "data\functions\GetHander.lua" once --玩家请求获取
--#include "data\functions\modules\warpath.lua" once -- 征途
--#include "data\functions\modules\InjectExpRanking.lua" once -- 天神之力 排行榜
--#include "data\functions\modules\wardrobe.lua" once -- 衣橱
--#include "data\functions\Systems\Platforms\TencentMarket.lua" once	--腾讯任务集市
--#include "data\functions\modules\office.lua" once -- 军印
--#include "data\functions\modules\misc.lua" once -- 杂七杂八
--#include "data\functions\Activity\SevenDaysActivity.lua" once --7日活动
--#include "data\functions\ActorEvent\ShenLuoShenJieSystem.lua" once --森罗神戒
--#include "data\functions\ActorEvent\JiangHuLing.lua" once --江湖令
--#include "data\functions\ActorEvent\FuWenChange.lua" --兑换符文
--#include "data\functions\ActorEvent\BenPaoXiongDiBuff.lua" --奔跑兄弟buf
--#include "data\functions\ActorEvent\SpecialRight.lua" once --特权
--#include "data\functions\ActorEvent\Mineral.lua" once 挖矿系统
--#include "data\functions\ActorEvent\Duobaoqibinbuff.lua" once 夺宝奇兵buff
--#include "data\functions\ActorEvent\ExpBottle.lua" 经验瓶
--#include "data\functions\ActorEvent\NewDayFirstYB.lua" once 每日首冲
--#include "data\functions\ActorEvent\TianJiangHongBao.lua" once --天降红包
--#include "data\functions\Activity\HeFuActivuty.lua" once --新合服活动
--#include "data\functions\Activity\FatherDayActivity.lua" once --父亲节活动
--#include "data\functions\Activity\VipGuaJiDiTu.lua" once --vip挂机地图
--#include "data\functions\Activity\JingJiLiBao.lua" --once --新的竞技礼包
--#include "data\functions\modules\fashion_dress.lua" once -- 时装


SystemHandlerDispatcher.registerSystemHander(BaseTypes.SystemId.miscsSystem, MiscsImplement.main)