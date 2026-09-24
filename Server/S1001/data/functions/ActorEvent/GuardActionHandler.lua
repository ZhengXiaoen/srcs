--lua script
--To do something about Login and Logout
--#include "data\config\activityconfig\Dart\DartConfig.lua"  once  --基本设置
--#include "data\functions\Activity\Dart\ApplyDartCommon.lua" once
--护送美女限制                       
-------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------

-- 上线
EventCallDispatcher.LoginGuardTip = function(sysarg, arg)	
	--跨服限制
	if OnCsActorLoginLmt() == true then return end
	
	local sVar = Actor.getStaticVar(sysarg)	
	local dvar = Actor.getDyanmicVar(sysarg)
    local sysvar = System.getStaticVar()
    if sysvar.officebiaoche == nil then
        sysvar.officebiaoche ={}
        sysvar.officebiaoche.count = 0
        sysvar.officebiaoche.l = {}
    end
	if (sVar.ybstate ~= nil) and sVar.bcpz ~= nil then
		if  sVar.ybstate == 1 then
            if sVar.ActorDartTime == nil then
                sVar.ybstate = nil
                sVar.bcpz = nil
                
                if Actor.getIsDartFlag(sysarg) == 1 then -- 普通押镖
			    	Actor.setDartFlag(sysarg, 0) --设置不在押镖状态
				end
	
                return
            end
			local cfg = StdActivityCfg.DuoBeiYaSong;
			local nTime = System.getCurrMiniTime()
			local lastTime = sVar.ActorDartTime + cfg.time - nTime
            local nActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
            local nTag = 0
            for i =1, sysvar.officebiaoche.count do
                if sysvar.officebiaoche.l[i] ~= nil and sysvar.officebiaoche.l[i].id == nActorId then
                    nTag = sysvar.officebiaoche.l[i].tag
                    sysvar.officebiaoche.l[i] = nil 
                    break
                end
            end
			if lastTime <= 0 then
                --if sVar.bcpoint ~= nil  and sVar.bcpoint.bcHandle ~= nil then
                    if nTag == 1 then --押镖超时
                        OnActorDartFailed(sysarg, cfg.DartSetup.CampDartFailExpired);
                    elseif nTag == 2 then --被击杀
                        OnActorDartFailed(sysarg, StdActivityCfg.DuoBeiYaSong.DartSetup.CampDartFailObjDie,nil,nil)
                    end

                    
                --end
				
            else
                local bcpz = sVar.bcpz
			    local bccfg = cfg.tBiaoche[bcpz]
			    if bccfg ~= nil then
				    Actor.onTakeOffRide(sysarg)		--下坐骑
				    --local x, y = Actor.getEntityPosition(sysarg, 0, 0)		--获取实体X Y坐标
                    if sVar.bcpoint == nil then
                    	sVar.bcpoint={}
                        sVar.bcpoint.x,sVar.bcpoint.y = Actor.getEntityPosition(sysarg, 0, 0)
                        sVar.bcpoint.sceneid = 0
                    end
                    local x = sVar.bcpoint.x
                    local y = sVar.bcpoint.y
                    local nSceneId = sVar.bcpoint.sceneid
                    --离线期间镖车被击杀- 
                    local monsterPtr =  Actor.getEntity(sVar.bcpoint.bcHandle)
                    if monsterPtr == nil then
                        OnActorDartFailed(sysarg, StdActivityCfg.DuoBeiYaSong.DartSetup.CampDartFailObjDie,nil,nil)
                    else
                         -- 创建镖车
				        if CreateDartCar(sysarg, cfg, bccfg, x, y, lastTime,nSceneId,sVar.bcpoint.bcHandle) == true then
					        UpdateDartInfo(sysarg, sVar, cfg, sVar.bcpz, sVar.ActorDartDelayTime);
				        end
                    end
				   
			    end   
			end

			
		end
    else
        --不在押镖状态-刷了镖车等级 清除
        if sVar.bcpz ~= nil then
            sVar.bcpz = nil
        end
        
        sVar.ybstate = nil
        
        if Actor.getIsDartFlag(sysarg) == 1 then -- 普通押镖
	    	Actor.setDartFlag(sysarg, 0) --设置不在押镖状态
		end
	end
end

-- 下线了
EventCallDispatcher.LogoutGuardHandler = function(sysarg, arg)

--下线不销毁镖车
--	local sval = Actor.getStaticVar(sysarg)
--	local monsHandle = sval.bcHandle or 0
--	if monsHandle > 0 then
--		local pack = DataPack.allocPacket(sysarg, 139, 13)
--		DataPack.writeInt64(pack, sval.bcHandle)
--		DataPack.flush(pack)
--		Fuben.clearMonster(monsHandle, false)
--	end
end

EventCallDispatcher.OnFollowedFailedHandler = function(sysarg, arg)	
	--local param_count = #arg
	--if (param_count > 0) then
	--	--print(arg[1])
	--end
	
	if (arg[1] == nil) then 
		--print("!!! get follower failed, param is nil")
		return 
	end
	
	if not System.isCrossServer() then
		
		local svar = Actor.getStaticVar(sysarg)
		if (svar.ybstate ~= nil) then
			local followerHdl = Actor.getHandle(arg[1])
			if (svar.bcHandle == followerHdl) then  -- 是跟随怪			
				local nHandle = Fuben.getSceneHandleById(Actor.getSceneId(sysarg),0)
				--改为距离远了自动把镖车送到玩家身边
				--local ACtorDartMon = Actor.getEntity(svar.bcHandle)
				--local selfPosX, selfPosY = Actor.getEntityPosition(sysarg, 0, 0)
				--Actor.enterScene(ACtorDartMon,Actor.getSceneId(sysarg),selfPosX,selfPosY,0,0)
				--要改为距离远镖车自动停下来提示玩家就屏蔽上面,放出下面
				Actor.addTimer(sysarg,ActorTimerIds.DartFollow,1000)
			end		
		end
	else
		-- 改为了手动押镖，所以这里就屏蔽定时器
--		local dVar = Actor.getDyanmicVar(sysarg)
--		local yuanGuBCHandle = dVar.YuanGuBCHandle
--		if yuanGuBCHandle ~= nil then
--			local followerHdl = Actor.getHandle(arg[1])
--			if yuanGuBCHandle == followerHdl then -- 远古镖车跟随失败
--				if not Actor.existTimer(sysarg, ActorTimerIds.CrossDartFollow) then
--					Actor.addTimer(sysarg, ActorTimerIds.CrossDartFollow, 1000)
--				end
--			end
--		end
		
	end
end


EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeUserLogin, EventCallDispatcher.LoginGuardTip)
EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeUserLogout, EventCallDispatcher.LogoutGuardHandler)
EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeOnFollowedFailed, EventCallDispatcher.OnFollowedFailedHandler)