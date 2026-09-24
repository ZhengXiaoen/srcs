--lua script
--Do something about space copy
--LocalDT.TeamCopyMap = {}
--LocalDT.PlayerDieCopyMap = {}


--#include "data\functions\FuBenNpcFunc\OnEnterFubenFunc.lua" once
--#include "data\functions\FuBenNpcFunc\FubenCommonFunc.lua" once
--#include "data\functions\Systems\PaTaSystem\PaTaCommon.lua" once
--#include "data\functions\Activity\Meet\RandNpcShopCommon.lua" once


--（没用到）  用于进入队伍副本的条件判断
local enterTeamFubenF = function (sysarg,arg)
	--local FbID =arg[1]     --副本的ID
	local FbID =tonumber(arg[1])
	--print("FbID:"..FbID)
	local fbmode = GetMode(sysarg,FbID)
	--print("fbmode:"..fbmode)
	local TeamMemb = LuaHelp.getTeamMemberList(sysarg)		--获取该队伍的成员
	if TeamMemb == nil then return end
	
	--print("type:"..table.getn(TeamMemb))
	--print(type(TeamMemb[1]))

	local actorid = Actor.getIntProperty(TeamMemb[1],PROP_ENTITY_ID)
	--print("actorid:"..actorid)
	
	local fbdata = FuBen[FbID]
	
	for i = 1,table.getn(TeamMemb) do
		local memblevel = Actor.getIntProperty(TeamMemb[i],PROP_CREATURE_LEVEL) --获取玩家的等级
		--print("memblevel:"..memblevel)
		local membfbcount = Actor.getDayFubenCount(TeamMemb[i],fbmode)   --获取玩家进入副本的剩余次数
		--print("membfbcount:"..membfbcount)
		if memblevel < fbdata.minLevel then
			Actor.sendTipmsg(sysarg,Lang.ScriptTips.f00006,ttDialog)
			return false
		end
		if membfbcount < 1 then
			Actor.sendTipmsg(sysarg,Lang.ScriptTips.f00006,ttDialog)
			return false
		end
	end
	
	if ( fbdata == nil ) then
		--print("Enter team fu ben envir config empty."..FbID)
		return
	end
	if table.getn(TeamMemb) < fbdata.minPlayCount then		--判断队伍的人数是否满足条件
		                                            		--队伍人数不够，不能进入副本。
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.f00001,ttDialog)
		return false
	end
	
	if table.getn(TeamMemb) >fbdata.maxPlayCount then
		--Actor.sendTipmsgWithId(sysarg,tpTeamMemberFull) 		--队伍人数超过最多人数，不能进入副本
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.f00002,ttDialog)
		return false
	end

   Hfuben = Fuben.createFuBen(FbID)
	for i = 1,table.getn(TeamMemb) do		--如果满足条件将队伍的成员逐个传送到副本场景				
		Actor.enterFuBen(TeamMemb[i],Hfuben,-1,-1,-1)
		--print("enterFuBen:")
		Actor.subDaySingleCount(TeamMemb[i],fbmode)	--并将当日进入相应副本的次数减1
		Actor.closeDialogs(TeamMemb[i],diFubenTeam)
		local copyEnterFunc = OnEnterCopyMap[FbID]	--进入各种副本的个性化处理
		if ( copyEnterFunc ~= nil ) then copyEnterFunc( sysarg,arg, Hfuben ) end
	end
end
--判断能否使用副本挑战书 
function canUseFubenChallengeBook(sysarg)
  
end


--加入队伍副本时的函数

EventCallDispatcher.handlerJoinTeamFubenFunc = function (sysarg,arg)
	if (arg == nil) then
		return false
	end
	local challengeid = Actor.getChallenge(sysarg)
	if challengeid ~= 0 then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.f00019,ttFlyTip) 
		return
	end
	if Actor.isInTeam(sysarg) then
		 Actor.exitTeam(sysarg)
	end
	local TeamId = arg[1]     --队伍的ID
	--print("arg[1]:"..arg[1])
	
	local state = Fuben.getTeamFubenStatus(TeamId)
	if state == 2 then return end
	
	local TeamCount = Fuben.getTeamMaxMemberCount(TeamId)
	--print("TeamCount:"..TeamCount)
	local Teamnumb = Fuben.getTeamOnlineMemberCount(arg[1]) + 1
	if Teamnumb > TeamCount then 
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.f00012,ttDialog)
		return
	end
	--print("Teamnumb:"..Teamnumb)
	local FbID = Fuben.getTeamFubenId(arg[1])
	--print("fbid:"..FbID)
	local fbdata = FuBen[FbID]
	if ( fbdata == nil ) then
		--print("Join team fu ben envir config empty."..FbID)
		return
	end

	if Teamnumb > fbdata.maxPlayCount then 
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.f00014,ttDialog) 				--该队伍人数已满，进入不了队伍
		return false 																		--返回错误
	end
	--print("-------------------:")
	--local FbMode = Fuben.getFubenMode(FbID)	    --副本的类型
	local sysLevel = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)     --获取玩家的等级
	
  local groupid = fbdata.groupId
  local var = Actor.getStaticVar(sysarg)
  local fb = var.fb
  local fbcount = fb[groupid]      --获取玩家进入副本的剩余次数
  if fbcount == nil then return end
  
	local actorfbid = Actor.getFubenId(sysarg)
	if actorfbid > 0 then return end
  
  if sysLevel >= fbdata.minLevel then
		if fbcount > 0 then
			 Actor.addToTeam(sysarg,arg[1])					--条件都符合，将玩家加入到队伍中。
		else Actor.sendTipmsg(sysarg,Lang.ScriptTips.f00015,ttDialog)           --输出提示由于次数问题进入不了副本
			 return false					--返回错误，不可以加入队伍
		end
  else Actor.sendTipmsg(sysarg,Lang.ScriptTips.f00011,ttFlyTip)                   --输出提示由于等级不够进入不了副本
  		 return false 						--返回错误，不可以加入队伍
	end
end

--退出副本的函数
function exitFubenFunc(sysarg)
  local FbID = Actor.getFubenId(sysarg)
  local TeamMemb = LuaHelp.getTeamMemberList(sysarg)		--获取该队伍的成员
  local TeamCount = Actor.getOnlineTeamMemberCount(sysarg)
  --local TeamCount = table.getn(TeamMemb)
  --print("TeamCount:")
  --print("FbID-----------:"..FbID)
  local fbdata = FuBen[FbID]
  local mode = GetMode(sysarg,FbID)
  ----print("mode:"..mode)
  if mode == fmCommon then			--如果是在普通场景，则什么都不做！
   return
  end
  if mode == fmSingle then			--如果是单人副本，直接退出副本
   Actor.exitFuben(sysarg)
  else
   if Actor.isInTeam(sysarg) then
    if TeamCount <= fbdata.minPlayCount then
    	for i=1 ,TeamCount do
    	Actor.exitTeam(TeamMemb[i])				--如果是队伍副本，就退出队伍
    	Actor.exitFuben(TeamMemb[i])
    	end
    else
    	Actor.exitTeam(sysarg)
      Actor.exitFuben(sysarg)
    end
   else 
      Actor.exitFuben(sysarg)
   end

    Actor.exitTeam(sysarg)				--如果是队伍副本，就退出队伍
  end
  Actor.clearKillMonsterCount(sysarg)
end


--玩家创建副本队伍
EventCallDispatcher.handlerCreateFubenTeamFunc = function (sysarg,arg)
	if (arg == nil) then
		return false
	end
	local challengeid = Actor.getChallenge(sysarg)
	if challengeid ~= 0 then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.f00019,ttFlyTip) 
		return
	end
	local FbID = tonumber(arg[1])     --副本的ID
  	--print("FbID:"..FbID)
	local fbdata = FuBen[FbID]
	local groupid = fbdata.groupId
	if ( fbdata == nil ) then
		--print("Enter single fu ben envir config empty."..FbID)
		return
	end
  --print("FbMode:"..FbMode)
	local sysLevel = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL) --获取玩家的等级
		--print("sysLevel:"..sysLevel)
  local var = Actor.getStaticVar(sysarg)
  local fb = var.fb
  local fbcount = fb[groupid]      --获取玩家进入副本的剩余次数
	--local fbncount = Actor.getDayFubenCount(sysarg,FbMode)   --获取玩家进入副本的剩余次数
	local fbAddCount = 0
	if (fbdata.fbtype == 0) then
		fbAddCount = getFBAddCount(sysarg)
	end
	fbcount = fbcount + fbAddCount
  if fbcount < 1 then
    Actor.sendTipmsg(sysarg,Lang.ScriptTips.f00015,ttDialog)           --输出提示由于次数问题进入不了副本
		return false
	end
	
	if sysLevel < fbdata.minLevel then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.f00011,ttFlyTip)
		return false
	end
	
	local TeamMemb = LuaHelp.getTeamMemberList(sysarg)		--获取该队伍的成员
	local TeamCount = Actor.getTeamMemberCount(sysarg)
	if TeamMemb ~= nil then 
		if table.getn(TeamMemb) < TeamCount then
			Actor.sendTipmsg(sysarg,Lang.ScriptTips.f00010,ttDialog)
			return 
		end
		--print(table.getn(TeamMemb))
		for i = 1,table.getn(TeamMemb) do
			local memblevel = Actor.getIntProperty(TeamMemb[i],PROP_CREATURE_LEVEL) --获取玩家的等级
			--print("memblevel:"..memblevel)
	    local var = Actor.getStaticVar(TeamMemb[i])
	    local fb = var.fb
	    local membfbcount = fb[groupid]      --获取玩家进入副本的剩余次数
		local memFbAddCount = 0
		if (fbdata.fbtype == 0) then
			memFbAddCount = getFBAddCount(TeamMemb[i])
		end
		membfbcount = membfbcount + memFbAddCount
	  	if memblevel < fbdata.minLevel then
				Actor.messageBox(sysarg,0,0,Lang.ScriptTips.f00039,""..Lang.ScriptTips.x00050.."/getoutTeamMember,"..FbID.."",""..Lang.ScriptTips.x00051.."/cancelCreateFuben",nil)
				return false
			end
			if membfbcount < 1 then
				Actor.messageBox(sysarg,0,0,Lang.ScriptTips.f00039,""..Lang.ScriptTips.x00050.."/getoutTeamMember,"..FbID.."",""..Lang.ScriptTips.x00051.."/cancelCreateFuben",nil)
				return false
			end
		end
	end
	Actor.createFubenTeam(sysarg,FbID)
end

--取消创建副本
function cancelCreateFuben(sysarg)

end
--创建副本时有队员不符合条件，踢掉队员
function getoutTeamMember(sysarg,FbID)
	local FbId = tonumber(FbID) 
	
	--print("fbid:"..FbId)
	--local FbMode = 	GetMode(sysarg,FbId)    --获取副本的类型
	local TeamMemb = LuaHelp.getTeamMemberList(sysarg)		--获取该队伍的成员
	if TeamMemb == nil then return end
	local fbdata = FuBen[FbId]
	local groupid = fbdata.groupId
	for i = 1,table.getn(TeamMemb) do
		local memblevel = Actor.getIntProperty(TeamMemb[i],PROP_CREATURE_LEVEL) --获取玩家的等级
		local var = Actor.getStaticVar(TeamMemb[i])
    local fb = var.fb
    local membfbcount = fb[groupid]      --获取玩家进入副本的剩余次数
    
	local memFbAddCount = 0
	if (fbdata.fbtype == 0) then
		memFbAddCount = getFBAddCount(TeamMemb[i])
	end
	membfbcount = membfbcount + memFbAddCount
		
		--local membfbcount = Actor.getDayFubenCount(TeamMemb[i],FbMode)   --获取玩家进入副本的剩余次数
		if (memblevel < fbdata.minLevel or membfbcount < 1 )then
			Actor.exitTeam(TeamMemb[i])	
		end
	end
	Actor.createFubenTeam(sysarg,FbId)
end


function EventCallDispatcher.TeamTimer( sysarg, arg )
	local teamId = tonumber(arg[1])
	local captainPtr = TeamFun.getTeamCaptain( teamId )
	if captainPtr then
		local var = TeamFun.getDyanmicVar(teamId)
		local fbId = var.enterFbId
		if fbId then
			enterTeamFbByLeader( captainPtr, fbId )
		end
	end
end

function EventCallDispatcher.handlerExitFuben( sysarg, arg )
	local fubenId = tonumber(arg[1])
	local curFbId = Actor.getFubenId(sysarg)
	if curFbId ~= fubenId then
		return
	end
	
	onExitFubenFunc(sysarg)
end

function EventCallDispatcher.handGetFBTimes(sysarg, arg )
	SendEnterFbTimes(sysarg)
end

function EventCallDispatcher.handPataFubenMasterAward( sysarg, arg )
	local bType = arg[1]
	local fubenId = arg[2]
	return GiveMyMasterAward( sysarg, bType, fubenId)
end

function EventCallDispatcher.handStoryFBItem( sysarg, arg )
	OnGetStoryFbItem(sysarg)
end

function EventCallDispatcher.handBuyRandNpcItem( sysarg, arg )
	local idx = arg[1]
	local itemId = arg[2]
	local count = arg[3]
	OnBuyNpcShopItem( sysarg, idx,itemId, count)
end

function EventCallDispatcher.handMoGoogMopOp(sysarg, arg)
	print("EventCallDispatcher.handMoGoogMopOp",sysarg,arg[1],arg[2],Actor.getEntityType(sysarg))
	local type = arg[1]
	local fdId = arg[2]
	if OnMoGoogMopOp[type] then
		OnMoGoogMopOp[type](sysarg,fdId)	
	end
end

EventCallDispatcher.readyEnterFB = readyEnterFB
EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeTeamTimer, EventCallDispatcher.TeamTimer)
EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeEnterFuben,EventCallDispatcher.readyEnterFB)
EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeAddToFubenTeam,EventCallDispatcher.handlerJoinTeamFubenFunc)
EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeCreateFubenTeam,EventCallDispatcher.handlerCreateFubenTeamFunc)
EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeExitFuben,EventCallDispatcher.handlerExitFuben)
EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeEnterFbTimes, EventCallDispatcher.handGetFBTimes)
EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeGetPaTaMasterAward, EventCallDispatcher.handPataFubenMasterAward)
EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeGetStoryFBItem, EventCallDispatcher.handStoryFBItem)
EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeBuyNpcShopItem, EventCallDispatcher.handBuyRandNpcItem)
EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeMoGoogMopOp, EventCallDispatcher.handMoGoogMopOp)