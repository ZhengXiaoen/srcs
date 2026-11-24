--#include "data\config\CrossServerConfig.lua" once

LocalDT.LocalCrossEnabled = function()
    return CrossServerConfig.LocalPlay and not System.isCrossServer() and not System.isCommonServer()
end

-- 单机按原战力档位使用每档的主线场景。
LocalDT.LocalCrossGroups = {
    [0] = CrossServerConfig.EnterScene,
    [1] = CrossServerConfig.BiaoCheEnterScene,
    [4] = CrossServerConfig.GuildEnterScene,
}

LocalDT.LocalCrossScenes = {}
for activity, groups in pairs(LocalDT.LocalCrossGroups) do
    for index, cfg in ipairs(groups) do
        LocalDT.LocalCrossScenes[cfg.nSceneId[1]] = { activity = activity, index = index, cfg = cfg }
    end
end

LocalDT.LocalCrossScene = function(sceneId)
    if LocalDT.LocalCrossEnabled() then
        return LocalDT.LocalCrossScenes[sceneId]
    end
end

LocalDT.CrossBattlePower = function(actor)
    local power = Actor.getMyTopBattle(actor)
    if power == nil or power <= 0 then
        power = Actor.getIntProperty(actor, PROP_ACTOR_BATTLE_POWER)
    end
    return power
end

LocalDT.CrossGroupByPower = function(groups, power)
    for index, cfg in ipairs(groups) do
        if power >= cfg.minBattlePower and (cfg.maxBattlePower == -1 or power <= cfg.maxBattlePower) then
            return index, cfg
        end
    end
end

LocalDT.LocalGuildCrossOpen = function()
    local weekday = System.getDayOfWeek()
    local hour, minute = System.getTime(0, 0, 0)
    return System.getDaysSinceOpenServer() >= 5
        and (weekday == 0 or weekday == 1 or weekday == 3 or weekday == 5)
        and (hour == 10 or hour == 14 or hour == 19) and minute < 20
end

LocalDT.LocalCrossExit = function(actor)
    return Actor.enterScene(actor, 9, 150, 140)
end

LocalDT.HandleLocalCrossRequest = function(actor, _, packet)
    if not LocalDT.LocalCrossEnabled() then
        Actor.sendTipmsg(actor, "本服活动入口当前未开放", ttFlyTip)
        return
    end

    local activity = DataPack.readByte(packet)
    local current = LocalDT.LocalCrossScene(Actor.getSceneId(actor))
    if activity == 5 then
        if not current then return end
        if current.activity == 1 and GetCrossYaBiaoState(actor) == 1 then
            Actor.sendTipmsg(actor, "押镖中，请先交镖或放弃护送", ttFlyTip)
            return
        end
        LocalDT.LocalCrossExit(actor)
        return
    end

    local groups = LocalDT.LocalCrossGroups[activity]
    if not groups then return end
    if current then
        Actor.sendTipmsg(actor, current.activity == activity and "已在该活动地图" or "请先离开当前活动地图", ttFlyTip)
        return
    end
    if Actor.hasState(actor, esStateDeath) then
        Actor.sendTipmsg(actor, "请复活后再进入活动地图", ttFlyTip)
        return
    end
    if Actor.getFubenId(actor) > 0 then
        Actor.sendTipmsg(actor, "请先退出当前副本", ttFlyTip)
        return
    end
    if Actor.getIsDartFlag(actor) > 0 then
        Actor.sendTipmsg(actor, "请先结束当前押镖", ttFlyTip)
        return
    end
    if not IsActorCanEnterCrossServer(actor, activity) then return end
    if Actor.getIntProperty(actor, PROP_ACTOR_CIRCLE) < 3 then
        Actor.sendTipmsg(actor, "转生等级不足3转", ttFlyTip)
        return
    end

    local _, cfg = LocalDT.CrossGroupByPower(groups, LocalDT.CrossBattlePower(actor))
    if not cfg then
        Actor.sendTipmsg(actor, "战力未达到入场要求", ttFlyTip)
        return
    end

    local sceneId = cfg.nSceneId[1]
    local handle = Fuben.getSceneHandleById(sceneId, 0)
    if not handle or handle == 0 or not Actor.enterScene(actor, sceneId, cfg.posx, cfg.posy) then
        Actor.sendTipmsg(actor, "活动地图暂时无法进入", ttFlyTip)
    end
end

LocalDT.LocalEscortOpen = function()
    return not StdActivityCfg.KuafuYaSong.isDelete
        and System.getDaysSinceOpenServer() >= CrossServerConfig.YuanGuYaBiAoOpenDay
        and checkActivityTime(StdActivityCfg.KuafuYaSong.tOpenTime.times) ~= 0
end

LocalDT.SendLocalEscortPanel = function(actor, activity)
    local packet = DataPack.allocPacket(actor, LogicCmd.miscSysEx.sysId, LogicCmd.miscSysEx.sub.sEnterCrossType)
    DataPack.writeByte(packet, activity)
    DataPack.flush(packet)
end

LocalDT.OnLocalCrossSceneChange = function(actor, args)
    if args[1] == args[2] or not Actor.IsActorInited(actor) then return end
    local previous = LocalDT.LocalCrossScene(args[1])
    local current = LocalDT.LocalCrossScene(args[2])
    if previous and previous.activity == 1 then
        local state = Actor.getDyanmicVar(actor)
        local reason = state.localEscortExitReason or (GetCrossYaBiaoState(actor) == 1 and 2 or 0)
        state.localEscortExitReason = nil
        LocalDT.FinishLocalEscort(actor, args[1])
        SendCrossYaBiaoState(actor, reason)
        LocalDT.SendLocalEscortPanel(actor, 0)
    end
    LocalDT.ShowLocalCrossScene(actor, current)
end

LocalDT.ShowLocalCrossScene = function(actor, scene)
    if not scene then return end
    if scene.activity == 1 then
        LocalDT.SendLocalEscortPanel(actor, 1)
        SendCrossYaBiaoInfo(actor, 1)
    else
        RefreshCrossBossInfoUIToActor(actor)
    end
end

LocalDT.ExitLocalCrossGroup = function(activity)
    if not LocalDT.LocalCrossEnabled() then return end
    for _, cfg in ipairs(LocalDT.LocalCrossGroups[activity]) do
        for _, actor in ipairs(LuaHelp.getSceneActorListById(cfg.nSceneId[1]) or {}) do
            if activity == 1 then
                EndYuanGuYaBiaoAndExit(actor, 1)
            else
                LocalDT.LocalCrossExit(actor)
            end
        end
    end
end
