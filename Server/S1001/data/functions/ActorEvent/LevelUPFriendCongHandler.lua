--lua script

local LevelUp = {
[10] = 108,
[15] = 648,
[20] = 1188,
[25] = 1728,
[30] = 2268,
[35] = 2808,
[40] = 3348,
[41] = 3456,
[42] = 3564,
[43] = 3672,
[44] = 3780,
[45] = 3888,
[46] = 3996,
[47] = 4104,
[48] = 4212,
[49] = 4320,
[50] = 4428,
[51] = 4536,
[52] = 4644,
[53] = 4752,
[54] = 4860,
[55] = 4968,
[56] = 5076,
[57] = 5184,
[58] = 5292,
[59] = 5400,
[60] = 5508,
}

 --升级提示和加修为 
EventCallDispatcher._TipsAndAddXiuwei = function (sysarg,arg)
	local level = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
	if Lang.ExpWarmTips[level] == nil then
		--print("no Tips!!!")
	else
  	Actor.sendTipmsg(sysarg,Lang.ExpWarmTips[level],ttWarmTip)
  end
end
--好友祝贺

EventCallDispatcher._FriendCongratulation = function (sysarg)
   --print("friend congratulation!")
  local level = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL)
  if LevelUp[level] == nil then return end
  local friendcount = Actor.getActorFriendsCount(sysarg)
  --print("friendcount:"..friendcount)
  local name = Actor.getName(sysarg)
  for i=0,friendcount-1 do
    local actorid = Actor.getActorFriend(sysarg,i)
    local actorPtr = System.getEntityPtrByActorID(actorid) 
	  if actorPtr ~= nil then
      local nowHp = Actor.getIntProperty( actorPtr, PROP_CREATURE_HP )
      --修改 好友升级祝贺 当好友死亡时，不发送要求祝贺信息
		  if nowHp > 0 then  --如果祝贺角色已死，则不能发送祝福  
			  local var = Actor.getStaticVar(actorPtr)                             --获取剩下的祝贺次数 
			  local friendCong = var.friendCong
			  if friendCong == nil then
			    var.friendCong = {}
			    friendCong = var.friendCong
	        friendCong[1] = 20
	        friendCong[2] = System.getTomorrow()
	      end 
	      if friendCong[1] == nil then friendCong[1] = 20 end
	      if friendCong[2] == nil then friendCong[2] = System.getTomorrow() end
	      if friendCong[2] ~= nil then
	        local t = System.getCurrMiniTime()
	        --print("t and fr[2]:"..t.." "..friendCong[2])
	        if friendCong[2] < t then 
	          friendCong[1] = 20
	          friendCong[2] = System.getTomorrow() 
	        end 
	      end
	      if friendCong[1] == nil then friendCong[1] = 20 end
	      if friendCong[1] >= 1 then 
				  local str = string.format(Lang.ScriptTips.x00022,name,level,friendCong[1])
				  local sysargid = Actor.getIntProperty( sysarg, PROP_ENTITY_ID )
				  Actor.messageBox(sysarg,0,actorid,str,Lang.ScriptTips.x00064.."/sendCongratulation,"..sysargid..","..level.."",Lang.ScriptTips.x00065.."/noSendCongratulation",NULL,0,1,Lang.ScriptTips.x00064)
	      end
      end   
    end
  end
end 

function sendCongratulation(sysarg,actorid,level)
  --print(tonumber(actorid))                    
  local friendid = tonumber(actorid)
  local friendPtr = System.getEntityPtrByActorID(friendid)
  --local level = Actor.getIntProperty(friendPtr,PROP_CREATURE_LEVEL)
  local level = tonumber(level)
  local name = Actor.getName(sysarg)
  if LevelUp[level] == nil then return end
  local Conlmsg = string.format(Lang.ScriptTips.x00023,name,LevelUp[level])
  Actor.sendTipmsg(friendPtr,Conlmsg,ttScreenCenter)
 	local allmsg = string.format(Lang.ScriptTips.x00024,LevelUp[level])
  Actor.sendTipmsg(sysarg,allmsg,ttScreenCenter)
  local friendCong = Actor.getStaticVar(sysarg).friendCong
  if  friendCong then
     friendCong[1] = friendCong[1] - 1
  end
  Actor.addExp(friendPtr,LevelUp[level],0,0)
  Actor.addExp(sysarg,LevelUp[level],0,0)
end

function noSendCongratulation(sysarg)
end

EventCallDispatcher.handlerLevelUpFriendCong = function (sysarg,arg)
  EventCallDispatcher._TipsAndAddXiuwei(sysarg,arg)
  EventCallDispatcher._FriendCongratulation(sysarg)
end

EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeLevel, EventCallDispatcher.handlerLevelUpFriendCong)




--[[
function WarmTipsFunc(sysarg)          --[参数arg:上次播放温馨提示的索引]
	local index = 0
	--print("index:"..index)
  local Warmtips = getActorData(sysarg,6)
  if (Warmtips ~= nil and Warmtips[1]~= nil) then
  	index = Warmtips[1]
  end
	local TipsCount = table.getn(Lang.WarmTips)
	local rand = 0
	repeat rand = math.random(1,TipsCount)
	until rand ~= index
	--print("rand:"..rand)
	local str = Lang.WarmTips[rand]
	Actor.sendTipmsg(sysarg,str,ttDialog)
	setActorData(sysarg,6,{rand})
end
--]]