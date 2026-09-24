--lua script

--#include "data\config\guild\GuildBossCfg.lua"  once  --基本设置

-- 下发行会BOSS信息
function SendGuildBossInfo(sysarg)
  local guildPtr = Actor.getGuildPtr(sysarg)
  if guildPtr == nil then return end

  local isok, bossId, bossCallTimes, bossExp = Guild.getGuildBossInfo(guildPtr)
  if isok == false then return end

  local remainTime = 0 -- 副本剩余时间
  local hfb = Guild.getFuBenHandle(guildPtr)
  if hfb > 0 then
    local fbptr = Fuben.getFubenPtr(hfb)
    remainTime = Fuben.getFbTime(fbptr)
  end

  local pack = DataPack.allocPacket(sysarg,10,89) -- sSendGuildBossInfo
  DataPack.writeByte(pack,bossId)
  DataPack.writeWord(pack,bossCallTimes)
  DataPack.writeInt(pack,bossExp)
  DataPack.writeUInt(pack,remainTime)

  DataPack.flush(pack)
end

-- 饲养行会BOSS
function BreedGuildBoss(sysarg)
  local guildPtr = Actor.getGuildPtr(sysarg)
  if guildPtr == nil then return end

  local isok, bossId, bossCallTimes, bossExp = Guild.getGuildBossInfo(guildPtr)
  if isok == false then return end

  local bossCfg = GuildBossCfg.Levels[bossId]
  if bossCfg == nil then return end

  if bossExp >= bossCfg.maxExp then
    Actor.sendTipmsg(sysarg,"成长值已满，您可以进入圣地，召唤BOSS来增加召唤次数",ttFlyTip)
    return
  end

  local expItemId = GuildBossCfg.ExpItemId
  local itemName = Item.getItemName(expItemId)
  if Actor.getItemCount(sysarg, expItemId) < 1 then
    Actor.sendTipmsg(sysarg, "您没有物品 " .. itemName, ttFlyTip)
    return
  end

  if Actor.removeItem(sysarg,expItemId,1,-1,-1,-1,itemName,LogIds.BreedGuildBoss) < 1 then
		return
	end

  bossExp = bossExp + GuildBossCfg.ExpItemAddExp
  if bossExp > bossCfg.maxExp then
      bossExp = bossCfg.maxExp
  end

  Guild.setGuildBossExp(guildPtr, bossExp)

  -- 下发行会BOSS信息
  SendGuildBossInfo(sysarg)
end

--进入行会BOSS副本
function EnterGuildBossFuben(sysarg)
  local guildPtr = Actor.getGuildPtr(sysarg)
  if guildPtr == nil then return end

  if Actor.getFubenId(sysarg) == GuildBossCfg.fubenId then
    return
  end

  local hfb = Guild.getFuBenHandle(guildPtr)
  if hfb <= 0 then
    local isok, bossId, bossCallTimes, bossExp = Guild.getGuildBossInfo(guildPtr)
    if isok == false then return end

    local bossCfg = GuildBossCfg.Levels[bossId]
    if bossCfg == nil then return end

    if bossExp < bossCfg.maxExp then
      Actor.sendTipmsg(sysarg,"BOSS成长值还没满，您现在还不能进入圣地",ttFlyTip)
      return
    end
  end

  --可以进入圣地
  --local isNewFb = hfb <= 0
  if hfb <= 0 then
      hfb = Fuben.createFuBen(GuildBossCfg.fubenId)
      if hfb <= 0 then
        Actor.sendTipmsg(sysarg,"创建行会副本失败",ttFlyTip)
        return
      end

      Guild.setFuBenHandle(guildPtr, hfb)
  end

  local ret = Actor.enterFuBen(sysarg,hfb,GuildBossCfg.fubenSceneId,GuildBossCfg.enterX,GuildBossCfg.enterY)

end

--召唤行会BOSS
function CallGuildBoss(sysarg)
  local guildPtr = Actor.getGuildPtr(sysarg)
  if guildPtr == nil then return end

  local nPos = Actor.getGuildPos(sysarg)
  if nPos <= 0 or nPos > 6	then
    Actor.sendTipmsg(sysarg, "您没有权限进行此操作", ttFlyTip)
    return
  end

  local isok, bossId, bossCallTimes, bossExp = Guild.getGuildBossInfo(guildPtr)
  if isok == false then return end

  local bossCfg = GuildBossCfg.Levels[bossId]
  if bossCfg == nil then return end

  if bossExp < bossCfg.maxExp then
    Actor.sendTipmsg(sysarg,"BOSS成长值还没满，您现在还不能召唤行会BOSS",ttFlyTip)
    return
  end

  local nGuildCoin = Actor.getGuildCoin(sysarg)
  if nGuildCoin < bossCfg.needGuildCoin then		--行会资金不够
    Actor.sendTipmsg(sysarg, string.format(Lang.GuildLang.z00012, bossCfg.needGuildCoin), ttFlyTip)
    return
  end

  local hfb = Guild.getFuBenHandle(guildPtr)
  if hfb <= 0 then
    Actor.sendTipmsg(sysarg, "请先进入圣地", ttFlyTip)
    return
  end

  if Actor.getFubenId(sysarg) ~= GuildBossCfg.fubenId then
    Actor.sendTipmsg(sysarg, "请先进入圣地", ttFlyTip)
    return
  end

  local hScene = Fuben.getSceneHandleById(GuildBossCfg.fubenSceneId, hfb)
  if hScene <= 0 then return end

  if Fuben.getLiveMonsterCount(hScene, bossCfg.bossId) > 0 then
      Actor.sendTipmsg(sysarg, "不能重复召唤行会BOSS", ttFlyTip)
      return
  end

  -- 创建行会BOSS
	local bossPtr = Fuben.createMonster(hScene, bossCfg.bossId, bossCfg.bossX, bossCfg.bossY, 3600)
  if bossPtr == nil then
      Actor.sendTipmsg(sysarg, "创建行会BOSS失败", ttFlyTip)
      return
  end

  -- 召唤成功
  Fuben.setFubenTime(hfb, 3600) -- 重置副本时间（因为副本可能是旧的）
  Actor.changeGuildCoin(sysarg, -bossCfg.needGuildCoin)
  bossCallTimes = bossCallTimes + 1
  bossExp = 0

  local isUpgradeBoss = false
  if bossCallTimes >= bossCfg.callTimes and GuildBossCfg.Levels[bossId + 1] ~= nil then
    isUpgradeBoss = true

    bossId = bossId + 1
    bossCallTimes = 0
  end

  if isUpgradeBoss then
    Guild.setGuildBossId(guildPtr, bossId)
  end

  Guild.setGuildBossCallTimes(guildPtr, bossCallTimes)
  Guild.setGuildBossExp(guildPtr, 0)

  -- 下发行会BOSS信息
  SendGuildBossInfo(sysarg)

	-- 窗口ID现在还不知道是多少,先用 7
  local msg = string.format("<(c0xFF00FF00)%s>在BOSS圣地里召唤了行会BOSS <我要进入/@@showWin,7>", Actor.getName(sysarg))
  Actor.sendGuildMsg(sysarg, smGuildCommon, msg, ttChatWindow)
end

--退出行会BOSS副本
function ExitGuildBossFuben(sysarg)
	if Actor.getFubenId(sysarg) ~= GuildBossCfg.fubenId then
		return -- 不在行会BOSS副本
	end
	
	Actor.exitFuben(sysarg)
end