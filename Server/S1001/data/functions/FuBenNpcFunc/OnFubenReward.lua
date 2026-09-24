--lua script

--#include "data\functions\GlobalDefine.lua" once
--#include "data\envir\FuBenTongGuan.lua" once
--#include "data\envir\FuBen.txt" once
--#include "data\config\quest\MiscQuest.lua" once
--#include "data\config\Activity\GameFubenCfg.lua"
--#include "data\functions\modules\challenge_fuben.lua" once -- 勇者闯关


function GetFubenInfoByFubenId(fubenId)
	for i, v in ipairs(GameFubenCfg.fubenList) do
		if v.fubenId == fubenId then
			return v, i
		end
	end
	
	return nil, nil
end

function OnFubenPass(sysarg, fbid)
	local fbPtr = Actor.getFubenPrt(sysarg)
	if fbPtr == nil then return end
	
	if fbid == challenge_fuben_cfg.fubenId then -- 勇者闯关副本
		on_challenge_fuben_pass(sysarg)
		return
	end
	
	--已经是通关副本了
	if Fuben.getFubenProgress(fbPtr) == FB_FS_GETAWARD then return end	
	
	print("OnFubenPass id=" .. fbid .. " actorId=" .. Actor.getIntProperty(sysarg,PROP_ENTITY_ID))
	
	--设置其在领奖的状态了，其他状态下不能领奖，避免副本超时玩家退出副本
	Fuben.setFubenProgress(fbPtr,FB_FS_GETAWARD)
	
	-- 通知前端，副本通关
	local fbcfg = GetFubenInfoByFubenId(fbid)
	SendFubenPassMsg(sysarg, fbid, fbcfg)	
	
	if (get_taskflags_val(sysarg) == 86 and  fbid ==100) or  (get_taskflags_val(sysarg) == 92 and  fbid ==101) or (get_taskflags_val(sysarg) == 97 and  fbid ==102) then 
		local netPack = DataPack.allocPacket(sysarg,139,LogicCmd.miscSys.sub.sGeRenFuBenDaoShu)
        DataPack.flush(netPack)
	end
end

-- 通知前端，副本通关
function SendFubenPassMsg(sysarg, fbid, fbcfg)
	if fbcfg == nil then return end
	
	--local fbPtr = Actor.getFubenPrt(sysarg)		
		
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sSendFubenPassAward)
	
	DataPack.writeByte(netPack, fbid)	
			
	DataPack.flush(netPack)
end

function CanGetFubenPassAward(sysarg)
	if sysarg == nil then return false end
	
	local fubenId = Actor.getFubenId(sysarg)	
	if fubenId <= 0 then return false end -- 不在副本中
	
	local fbPtr = Actor.getFubenPrt(sysarg)
	local fbVar = Fuben.getDyanmicVar(fbPtr)
	local actorId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
	if fbVar == nil then
		print("error CanGetFubenPassAward fbVar==nil ActorId=" .. actorId)
		return false
	end
	
	if Fuben.getFubenProgress(fbPtr) ~= FB_FS_GETAWARD then return false end
	
	local nMonsterNum = Fuben.getMonsterNum(sysarg)
	if nMonsterNum > 0 then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf647,ttFlyTip)
		return false
	end	
	
	if fbVar.AwardActors == nil then return true end
	
	if fbVar.AwardActors[actorId] == nil then return true end
		
	Actor.sendTipmsg(sysarg,Lang.ScriptTips.c000181,ttFlyTip)
	return false -- 已经领过了
end

--设置已经领过副本奖励了
function SetGotFubenPassAward(sysarg)
	if sysarg == nil then return false end
	
	local fbPtr = Actor.getFubenPrt(sysarg)
	local fbVar = Fuben.getDyanmicVar(fbPtr)
	local actorId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
	
	if fbVar == nil then
		print("error SetGotFubenPassAward fbVar==nil ActorId=" .. actorId)
		return false
	end
	
	if fbVar.AwardActors == nil then
		fbVar.AwardActors = {}
	end
	
	fbVar.AwardActors[actorId] = 1
	return true
end