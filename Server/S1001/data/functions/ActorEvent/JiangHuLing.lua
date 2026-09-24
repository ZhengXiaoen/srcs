function JiangHuLing(sysarg, sysid, packet)
	
	if sysid ~= LogicCmd.miscSys.sub.cJiangHuLing then
		return
	end
	
	local name = DataPack.readString(packet)
	
	local actor = System.getActorPtr(name)
	
	if Actor.getName(sysarg) == name then
		Actor.sendTipmsg(sysarg,"请不要追踪自己哦",ttFlyTip)
		return 
	end
    if actor == nil then
        Actor.sendTipmsg(sysarg,"无该玩家或已离线！",ttFlyTip)
        return
    end
	if Actor.removeItem(sysarg,547,1) == 1 then 
		local sceneid = Actor.getSceneId(actor)
		local sceneName = Fuben.getSceneNameById(sceneid)
		local posx = Actor.getIntProperty(actor,PROP_ENTITY_POSX)
		local posy = Actor.getIntProperty(actor,PROP_ENTITY_POSY)
		
		Actor.messageBox(sysarg,0,0,string.format("“%s”玩家在%s,坐标(%s,%s)",name,sceneName,posx,posy),"确定/donothing" , nil, NULL, 0)
	end
end

--不能删，上面的按钮框要用到
function donothing(sysarg)
	
end

MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cJiangHuLing, JiangHuLing)

