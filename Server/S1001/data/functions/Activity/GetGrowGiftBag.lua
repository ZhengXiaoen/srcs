--#include "data\config\activity\LevelGrowthReward.lua" once
--#include "data\functions\Activity\Common\Awards.lua" once

--领取成长礼包
local function GetGrowGiftBag(sysarg,GiftId)
    GiftId = tonumber(GiftId)
    if GiftId > table.getn(LevelGrowthReward) then return end 
	if not LevelGrowthReward[GiftId] or LevelGrowthReward[GiftId].type == -1 then return end
	
	local LevelConfig = LevelGrowthReward[GiftId]
	--获取玩家静态变量
	local var = Actor.getStaticVar(sysarg)
	local levelGiftBag = var.levelGiftBag
	if not levelGiftBag then
		var.levelGiftBag = {}
		levelGiftBag = var.levelGiftBag
	end
	--获取全局静态变量
	local Globalvar = System.getStaticVar()
	local GloballevelGiftBag = Globalvar.GlevelGiftBag
	if not GloballevelGiftBag then
		Globalvar.GlevelGiftBag = {}
		GloballevelGiftBag = Globalvar.GlevelGiftBag
	end

	--再次领取已领取的礼包
	if levelGiftBag[GiftId] ~= nil and levelGiftBag[GiftId] > 0 then 
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf540,ttFlyTip)
		return
	end
	
	
	--该礼包领取数量已满
	if LevelConfig.MaxActorNum > -1 then
		if GloballevelGiftBag[GiftId] and GloballevelGiftBag[GiftId] >= LevelConfig.MaxActorNum then
			Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf539,ttFlyTip)
			return
		end
	end

	--人物处于死亡状态
	local ActorState = Actor.hasState(sysarg,esStateDeath)
	if ActorState then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf545,ttFlyTip)
		return
	end

	--获取玩家的等级和转数
	local myLevel = Actor.getIntProperty(sysarg, PROP_CREATURE_LEVEL)
	local myCircle = Actor.getIntProperty(sysarg,PROP_ACTOR_CIRCLE)
	--判断领取礼包的等级或者转生次数是否符合
	--if LevelConfig.type == 0 and  myLevel < LevelConfig.Require and myCircle == 0 then
	if LevelConfig.type == 0 and  myLevel < LevelConfig.Require then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf541,ttFlyTip)
		return
	elseif LevelConfig.type == 1 and myCircle < LevelConfig.Require then
		Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf542,ttFlyTip)
		return
	end

	
	GiftConfig = LevelConfig.reward
	--print(GiftId.."        "..GiftConfig.type)
	--检查背包空格是否足够
	if not Awards.CheckBagGridCount(sysarg, GiftConfig) then
		return
	end
	
	--奖品一个物品给玩家
	Awards.Give(sysarg, GiftConfig, 989, Lang.LogTips.l00215)
	levelGiftBag[GiftId] = 1	--标示1为已领取
	Globalvar.GlevelGiftBag[GiftId] = (Globalvar.GlevelGiftBag[GiftId] or 0)+1   --领取礼包人数+1
	
	local name  = Actor.getName(sysarg)
	
	--Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf543,name,Item.getItemLinkMsg(GiftConfig[1].id)),128+2)
	
	--下发客户端成功领取
	local netPack = DataPack.allocPacket(sysarg, 139, 85)
	DataPack.writeByte(netPack, 0)
	DataPack.flush(netPack)
	return true;

end

--领取成长礼包接口  暂时屏蔽
MiscsImplement.handleGetGiftBagOp = function (sysarg, msgid,packet)
	if not packet then return false end
	local GetTypeID = DataPack.readByte(packet)
	GetTypeID=tonumber(GetTypeID)
	if GetTypeID > 0 and GetTypeID <= #LevelGrowthReward then
		GetGrowGiftBag(sysarg, GetTypeID)
	end
end

--注册回调函数	
MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cGrowGiftBag, MiscsImplement.handleGetGiftBagOp)