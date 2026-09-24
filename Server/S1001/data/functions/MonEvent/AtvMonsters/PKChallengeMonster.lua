
--#include "data\functions\Activity\PKChallenge\PKChallengeCommon.lua" once

function MonDieDispatcher.PkChallengeMonstersDie(monster, sysarg, monId)
	local expVal = Actor.getActivityExp(sysarg, PKChallengeConfig.TableIndex, PKChallengeConfig.ExpRate, PKChallengeConfig.VipAddRate)
	if expVal > 0 then
		Actor.addExp(sysarg, expVal, 0, 0)
	end
	if Actor.changeMoney(sysarg, mtCoin, PKChallengeConfig.GiveCoin, GameLog.clEquipUpQualityMoney, Lang.LogTips.yb012) then
	end	
end

-- BossId = 186 恶魔岭中也有这个怪，因为这个活动屏蔽了，为了避免在恶魔岭中杀死这个怪后加钱加经验，所以这里注释了
--MonDieDispatcher.register(PKChallengeConfig.BossId, MonDieDispatcher.PkChallengeMonstersDie)