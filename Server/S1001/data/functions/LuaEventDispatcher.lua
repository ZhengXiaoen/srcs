LuaEventCallDispatcher =
{
	-- [eventId] = {函数1,函数2, ... };
}

--注册一个事件回调函数
function registerLuaEventCallback(eventId, proc)
	if not proc then
		print("[error] registerLuaEventCall proc is nil")
		return false
	end
	
	local fnTable = LuaEventCallDispatcher[eventId]
	if not fnTable then
		LuaEventCallDispatcher[eventId] = {}
		fnTable = LuaEventCallDispatcher[eventId]
	end		
	
	for i, v in ipairs(fnTable) do
		if v == proc then
			return false
		end
	end
	  
	table.insert(fnTable, proc)
	return true
end

--移除一个已注册的事件回调函数
function unregisterLuaEventCallback(eventId, proc)
	if not proc then
		print("[error] unregisterLuaEventCall proc is nil")
		return false
	end
	
	local fnTable = LuaEventCallDispatcher[eventId]
	if not fnTable then return false end
	
	for i, v in ipairs(fnTable) do
		if v == proc then
			table.remove(fnTable, i)
			return true
		end
	end
	
	return false
end

function OnLuaEvent(eventId, sysarg, ...)
	local fnTable = LuaEventCallDispatcher[eventId]
	if fnTable then 	  
		for i, func in ipairs(fnTable) do
			func(sysarg, arg)
		end
	end
end