-- --#include "data\functions\Activity\NationalDay.lua" once --国庆活动
--#include "data\functions\Activity\LivenessActivity.lua" once --活跃度活动
--#include "data\functions\Activity\HistoryTask.lua" once --昨天未完成的任务
--#include "data\functions\Activity\PublicTest.lua" once --公测活动
--#include "data\functions\Activity\ChristmasAndNewYear.lua" once -- 双蛋活动
--#include "data\functions\modules\InjectExpRanking.lua" once -- 天神之力 排行榜
--#include "data\functions\modules\wangling.lua" once -- 王陵
--#include "data\functions\Activity\SpringFestivalActivity.lua" once -- 春节活动
--#include "data\functions\modules\garden.lua" once -- 果园
--#include "data\functions\modules\practice_room.lua" once -- 练功房
--#include "data\functions\modules\goldbowl.lua" once -- 聚宝盆
--#include "data\functions\modules\challenge_fuben.lua" once -- 勇者闯关
--#include "data\functions\modules\headtitle.lua" once -- 称号
--#include "data\functions\modules\legion_modules.lua" once --军团
--#include "data\functions\modules\Extend_modules.lua" once --推广
--MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cNationalDayActivity, OnNationalDayActivity) --国庆活动
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cCharItemsExchange, OnMsgCharItemsExchange) -- 集字活动字帖兑换
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cLivenessActivity, OnLivenessActivity) -- 活跃度活动
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cHistoryTask, OnHistoryTaskMsg) -- 昨天未完成的任务
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cPublicTest, OnMsgPublicTest) -- 公测活动
--MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cChristmasAndNewYear, OnMsgDoubleEgg) -- 双蛋活动
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cInjectExpRanking, OnMsgInjectExpRanking) -- 天神之力 排行榜(改为了捐献金币)
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cWangling, on_msg_wangling) -- 王陵
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cSpringFestivalActivity, on_msg_spring_festival_activity) -- 春节活动
--MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cGardenModule, on_msg_garden) -- 果园
--MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cPracticeRoomModule, on_msg_practice_room) -- 练功房
--MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cGoldbowlModule, on_msg_goldbowl) -- 聚宝盆
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cChallengeFubenModule, on_msg_challenge_fuben) -- 勇者闯关
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cHeadTitleModule, onmsg_headtitle) -- 称号
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cLegionDonate,on_msg_legionDonate) --军团捐献
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cExtend,on_msg_Extend)
