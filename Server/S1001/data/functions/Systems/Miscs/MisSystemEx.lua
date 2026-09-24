--杂项子系统消息实现 

--子消息号的用的表
MiscsImplementEx = 
{
} 
MiscsImplementEx.main = function (sysarg, systemid, msgid, packet)
  if MiscsImplementEx[msgid] then
    MiscsImplementEx[msgid](sysarg, msgid, packet)
  end
end    

--[[
    注册杂项子系统消息处理函数，函数的形式为function (sysarg, msgid, packet)
]]
MiscsImplementEx.registerMsgHandler = function (msgid, proc)
  if MiscsImplementEx[msgid] then
    return false
  else
    MiscsImplementEx[msgid] = proc
    return true
  end
end
--[[
    取消已注册的子系统消息处理函数
]]
MiscsImplementEx.unregisterMsgHandler = function (msgid, proc)
  if MiscsImplementEx[msgid] == proc then
    MiscsImplementEx[msgid] = nil
    return true
  else
    return false
  end
end     

--#include "data\functions\Activity\TTT.lua" once
--#include "data\functions\modules\MiscEx.lua" once -- 杂七杂八
--#include "data\functions\ActorEvent\HeChengShiPing.lua" once  --合成
--#include "data\functions\Activity\EndMonthActivity.lua" once --月末活动
--#include "data\functions\EquipEnhance\JungGu.lua" --军鼓s
--#include "data\functions\Activity\QingDianActivity.lua" once
--#include "data\functions\modules\MoRenKuaiJieYu.lua" once --快捷语
--#include "data\functions\EquipEnhance\MianJu.lua" once 斗笠
--#include "data\functions\Activity\SevenDayCosume.lua" once 7日消费奖励
--#include "data\functions\modules\kill_boss.lua" once 单挑BOSS
--#include "data\functions\YuanGuFanPai.lua" once --远古翻牌
--#include "data\functions\Systems\Platforms\SouGouPlatforms.lua" once --搜狗平台
--#include "data\functions\ActorEvent\TianJiangHongBao_B.lua" once --天降红包b
--#include "data\functions\Activity\NationalDayActivity.lua" once --国庆活动
--#include "data\functions\Activity\YuanGuBiaoChe.lua" once  --远古押镖
--#include "data\functions\Activity\ShengXiaoGongDian.lua" once  --生肖宫殿
--#include "data\functions\guildOperate\GuildXiangYaoChuMo.lua" once --行会降妖除魔
--#include "data\functions\EquipEnhance\BrotherRing.lua" once --结拜戒指
--#include "data\functions\modules\TreasureSystem.lua" once	--法宝系统
--#include "data\functions\Activity\NeujahrActivity.lua" once --元旦活动
--#include "data\functions\EquipEnhance\FuHunHandle.lua" once --附魂操作
--#include "data\functions\ActorEvent\HeChengNeedGridHandle.lua" --合成需要序列号
--#include "data\functions\EquipEnhance\RingGodSystem.lua" once --戒灵	
--#include "data\functions\EquipEnhance\ShenDunSystem.lua" once --神盾系统
SystemHandlerDispatcher.registerSystemHander(BaseTypes.SystemId.miscsSystemEx, MiscsImplementEx.main)

