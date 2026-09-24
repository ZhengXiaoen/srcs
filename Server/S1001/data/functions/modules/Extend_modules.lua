--#include "data\functions\NpcMiscFun\SanRenNPC\MapNpc\YouXiTuiGuangYuan.lua" once
function on_msg_Extend(sysarg,sysid, packet)
	if sysid ~= LogicCmd.miscSys.sub.cExtend then
		print("error on_msg_Extend, sysid="..sysid)
		return
	end
	local name = DataPack.readString(packet)
  
	local actor = System.getActorPtr(name)
	
	if Actor.getName(sysarg) == name then
		Actor.sendTipmsg(sysarg,"无法向自己发送推荐请求",ttFlyTip)
		return 
	end
    if actor == nil then
        Actor.sendTipmsg(sysarg,"无该玩家或已离线！",ttFlyTip)
        return
    end
    local actorid=  Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
    local cfg = GetExtendInfo(actorid)
    local var = Actor.getStaticVar(sysarg)
    if  cfg.downactorname ~= "无" then --一定是非法封包传上来的。
        return
    end
    --不允许相互推荐
    if cfg.downactorname == name then 
        Actor.sendTipmsg(sysarg,"不允许相互推荐",ttFlyTip)
        return 
    end
    local targetactorid = Actor.getIntProperty(actor,PROP_ENTITY_ID)
  
    local acfg = GetExtendInfo(targetactorid)
    if acfg.uptag == 1 then
  
		if   acfg.upactorname == Actor.getName(sysarg) then 
			Actor.sendTipmsg(sysarg,"您已与该玩家解除下线关系,无法再次推荐!",ttFlyTip)
		else 
			Actor.sendTipmsg(sysarg,"该玩家已被推荐,无法再次推荐!",ttFlyTip)
		end
        return
    end
    acfg.upactorname = Actor.getName(sysarg)
    acfg.upactorid = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
    acfg.uptag = 0
    acfg = GetExtendInfo(targetactorid)
 
    Actor.sendTipmsg(sysarg,"已发送推荐请求!",ttFlyTip)
	
	local actorID = Actor.getIntProperty(actor, PROP_ENTITY_ID)
	local str = string.format("玩家%s请求您成为他(她)的下线，达成部分条件便有高级技能书赠送！快前往<(c0xFFff0000)威龙城-游戏推广员>处查看吧！",Actor.getName(sysarg))
	System.AddMail(actorID, 3, 0, "游戏推广员", str)
end

