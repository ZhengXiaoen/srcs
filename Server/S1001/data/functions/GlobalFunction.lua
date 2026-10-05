--[[File: GloabalFunction.lua]]

--全局NPC的脚本文件，游戏重要的语法逻辑全部挂在这个NPC下面

thisNPC = nil
InitFnTable = {}
FinaFnTable = {}
MainFnTable = {}

--脚本子模块使用的局部函数或常量存放位置，避免使用全局对象 
local LocalDT = {}



--#include "data\functions\WarRecovery.lua" once --战装回收
--#include "data\language\LangCode.txt" once
--#include "LogIds.lua" once     --脚本日志ID定义
--#include "ActorTimerIds.lua" once     --玩家定时器ID定义
--#include "StaticData.lua" once     --静态数据
--#include "GlobalMisc.lua" once     --全局的杂项函数 

--#include "BaseDef\BaseTypes.lua" once          

--#include "data\functions\BaseDef\LuaEventId.lua" once
--#include "data\functions\LuaEventDispatcher.lua" once

--#include "ActorEvent\ActorEventDispatcher.lua" once
--#include "NpcMiscFun\NpcEventDispatcher.lua" once

--#include "data\functions\BackStageCmd.lua" once		--后台命令

--#include "Systems\SystemHandlerDispatcher.lua" once
--#include "CrossServerEvent\CSHandlerDispatcher.lua" once
--#include "data\functions\Activity\GuildBiaoChe\GuildDartDie.lua" once
 --#include "Tasks\taskInclude.lua" once
--#include "CampKingNPC\CampKingNpcChangeName.lua" once

--#include "OnTimeRunFunction.lua" once     --定时执行的函数 
--#include "data\functions\Activity\Festival\SpringFestivalActivities.lua" once -- 驱年兽
--#include "data\functions\Activity\NewYearCountdown\NewYearCountdown.lua" once -- 新年倒计时

--#include "data\functions\guildOperate\GuildOnTimeFuc.lua" once
--#include "data\functions\Activity\OpenTenDaysActivity\TenDaysActivity.lua" once
--#include "data\functions\Activity\SbkBiaoChe\SbkBiaoCheOnTime.lua" once

--#include "data\functions\Activity\Boss\Boss_Init.lua" once		--世界boss
--#include "data\functions\ExpandFunc\MonsterRank\MonsterRankInit.lua" once --怪物排行榜

--#include "data\functions\ExpandFunc\AutoRunFunc.lua" once	--自动执行函数
--#include "data\functions\ExpandFunc\ActivityTipsFunc.lua" once --活动开启提示公告
--#include "data\functions\ExpandFunc\RankFunc.lua" once	--排行榜相关
--#include "data\functions\Fuben\Fuben.lua" once		--副本相关
--#include "data\functions\Server.lua" once		--服务器相关
--#include "data\config\version.lua" once  --逻辑服务器版本号
--#include "data\functions\VipRecovery.lua" once    --vip回收
--#include "data\functions\ZodiacRecovery.lua" once
--#include "data\functions\TreasureRecovery.lua" once 
--#include "data\functions\ActorEvent\DestoryGuildItem.lua" once --销毁行会物品
--#include "data\functions\WarriorEquipMake.lua" once
--#include "data\functions\GuildFubenBossFunc.lua" once --行会boss
--#include "data\functions\LongTengMake.lua" once --龙腾合成
--#include "data\functions\ShenDunMake.lua" once --神盾合成
--#include "data\functions\AppearanceMake.lua" once
--#include "data\functions\ImmortalEquipMake.lua" once --仙装合成
function main(sysarg)
	return "global"
end


--[[初始化函数]]--
function initialization(npcobj)
	thisNPC = npcobj
	for i = 1, table.getn(InitFnTable) do
		InitFnTable[i]( npcobj )
	end
end

--[[析构化函数]]--
function finalization(npcobj)
	for i = 1, table.getn(FinaFnTable) do
		FinaFnTable[i]( npcobj )
	end
	thisNPC = nil
end