--掉落装备（物品）全服公告回调函数
--掉落后需要全服提示的物品在Stditems文件
--每个物品配置中的flags里面添加 (broadcast = true)这个字段后，怪物掉落物品后就可以发出全服公告了
--策划只需要在Stditems的某个物品的flags里面添加broadcast = true 即可


EventCallDispatcher.dropBroadcast = function (sysarg, args)
	if not args then return false end
	local MonsterName = args[1]   --怪物名
	local SceneName = args[2]	  --场景名
	local ItemName = args[3]	  --物品名
	local x = args[4]             --掉落下来的X Y坐标
	local y = args[5]

	local msg = string.format(Lang.ScriptTips.zf560,MonsterName,SceneName,ItemName,x,y)
	
	System.broadcastTipmsg(msg, ttScreenCenter+ttChatWindow)
	
end

EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeBroadcast, EventCallDispatcher.dropBroadcast)  