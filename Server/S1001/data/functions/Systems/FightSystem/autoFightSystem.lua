
--读取玩家挂机数据 
function loadActorFightData(sysarg,msgid)
	-- 前端说不需要这个协议了, 这里的代码可能有问题, 以后打开时要检查下
	--[[
  local var = Actor.getStaticVar( sysarg )
  local hook = var.hook
  if hook == nil or hook == {} then
	  --print("hook is nil !!")
	  local npack = DataPack.allocPacket(sysarg,129,msgid)  --申请一个数据包
	  if npack == nil then
		print("npack:nil")
		return
	  end
	  DataPack.writeInt(npack,0)
	  DataPack.flush(npack)
	  return
  end
  local npack = DataPack.allocPacket(sysarg,129,msgid)  --申请一个数据包
  if npack == nil then
	--print("npack:nil")
	return
  end
  local ncount = hook[1]
  --print("ncount:"..ncount)
  DataPack.writeInt(npack,ncount)
  for i = 1 ,ncount*2 do
  
  if hook[i+1] ~= nil then 
  	DataPack.writeInt(npack,hook[i+1])
  else
  	DataPack.writeInt(npack,0)
  end
	
	--print("hook[]:"..hook[i+1])
  end
  DataPack.flush(npack)
  --]]
end
--保存挂机数据 
function saveActorFightData(sysarg,msgid,pack)
  --print("save actor fight data!!")
  
  -- 前端说没有上传过这个协议, 所以这里屏蔽它, 原来的打开的, 并且没有检查发来的数量, 造成保存的数据太大, 所以这里清除它吧
  local var = Actor.getStaticVar( sysarg )
  var.hook = nil
  
  --[[
  local nCount = DataPack.readInt(pack)
  -- 不要相信前端的数据, 否则这里可能是一个很大的值, 造成保存的数据太大
  if nCount > 10 then nCount = 10 end
  
  local var = Actor.getStaticVar( sysarg )
  local hook =var.hook
  if hook == nil then
		var.hook = {}
		hook = var.hook
  end
  if pack == nil then 
  	print("pack is nil !!")
  end
  
  hook[1] = nCount
  --print("Count:"..nCount)
  for i = 1,nCount*2 do -- 这里为什么要 * 2 ?
	  hook[i+1] = DataPack.readInt(pack)
    --print("hook:"..hook[i])
  end
  --]]
end

-- 退出挂机地图
function _exitHookMap(sysarg,msgid,pack)
	local sceneId = Actor.getSceneId(sysarg)
	
	local isHookMap = false
	local hookMapList = GlobalConfig.hookMapList
	for i = 1, #hookMapList do
		if sceneId == hookMapList[i] then
			isHookMap = true
			break
		end
	end
	
	if isHookMap == false then
		print("error!! sceneId["..sceneId.."] 不是挂机地图")
		return
	end
	
	--[[ 暂时不实现
	--是否多倍经验领取
	local expMultiple = DataPack.readByte(pack)
	
	local addUpExp = 0
	local var = Actor.getStaticVar(sysarg);

	if var.AddUpExp ~= nil then
		addUpExp = math.floor(tonumber(var.AddUpExp))
		var.AddUpExp = nil
	end
	
	addUpExp = addUpExp * expMultiple
	
	-- 消耗金钱多倍经验领取
	--]]
	
	-- 记录退出挂机地图时累计经验
	local var = Actor.getStaticVar(sysarg);
	local name = Actor.getName(sysarg)
	local nActorId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
	local addUpExp = 0
	if var.AddUpExp ~= nil then
		addUpExp = math.floor(tonumber(var.AddUpExp))
	end
	if addUpExp ~= 0 then
		System.sendCommonLog(GameLog.cGuajiExp,nActorId,name,0,0,0,'','','','','','','',tostring(addUpExp))
	end
	

	-- 退出挂机地图
	Actor.enterScene(sysarg, GlobalConfig.initSceneId, GlobalConfig.initScenePosX, GlobalConfig.initScenePosY, 15, 20) -- 退出到卧龙城
end

function FightDataSystem(sysarg, systemid, msgid, packet)
  if msgid == 1 then
    loadActorFightData(sysarg,msgid)
  elseif msgid == 2 then
    saveActorFightData(sysarg,msgid,packet)
  elseif msgid == 3 then
    _exitHookMap(sysarg,msgid,packet)
  end
end
SystemHandlerDispatcher.registerSystemHander(BaseTypes.SystemId.autoFightSystem, FightDataSystem)