--#ifndef _SYSTEM_HANDLER_DISPATCHER_IMPLEMENT_INCLIDED_ 
--#define _SYSTEM_HANDLER_DISPATCHER_IMPLEMENT_INCLIDED_

--[[
  由脚本处理的客户端消息分派表，表下标是子系统ID
]]
local SystemHandlerDispatcher = { }

--[[
    函数名称：SystemHandlerDispatcher.registerSystemHander
    函数描述：注册一个子系统消息处理函数
    参数 sysId 的描述：子系统ID
    参数 proc 的描述： 系统消息的处理函数，函数形式为function (sysarg, sysId, msgid, packet)
]]
SystemHandlerDispatcher.registerSystemHander = function (sysId, proc)
  --print("sysId:"..sysId)
  if not SystemHandlerDispatcher[sysId] then
    SystemHandlerDispatcher[sysId] = { proc }
  else
    local i
    local sysIdTable = SystemHandlerDispatcher[sysId]
    for i = 1, #sysIdTable do
      if sysIdTable[i] == proc then
        return
      end
    end
    --这里不能用局部table插入，否则不会修改到SystemHandlerDispatchers中
    table.insert(SystemHandlerDispatcher[sysId], proc)
  end
end

--[[
    函数名称：SystemHandlerDispatcher.unregisterSystemHander
    函数描述：移除一个注册的系统消息处理函数
    参数 sysId 的描述：系统ID
    参数 proc 的描述： 系统消息处理函数
]]
SystemHandlerDispatcher.unregisterSystemHander = function (sysId, proc)
  if SystemHandlerDispatcher[sysId] then
    local i
    local sysIdTable = SystemHandlerDispatcher[sysId]
    for i = 1, #sysIdTable do
      if sysIdTable[i] == proc then
        --这里不能从局部table中删除，否则不会修改到SystemHandlerDispatchers中
        table.remove(SystemHandlerDispatcher[sysId], i)
        break
      end
    end
  end
end

--客户端的数据包到达[子系统ID,消息号ID,数据指针]
SystemHandlerDispatcher.dispatcher = function (sysarg, args)
  --print("SystemHandlerDispatcher.dispatcher("..args[1]..","..args[2]..")")
  -- print("arg[1],,arg[2]:"..args[1].." "..args[2])

  if sysarg == nil then  
     System.trace("print(SystemHandlerDispatcher.dispatcher(entiry empty)")
     return
  end
  if args[1] == nil then
    System.trace("print(SystemHandlerDispatcher.dispatcher(arg[1] empty)")
     return
  end
  
  --网络数据到达 必须要有系统id 与协议id
   if args[1] == 18 and args[2] == nil then
    System.trace("print(SystemHandlerDispatcher.dispatcher(arg[2] empty)")
     return
  end
  local handlers = SystemHandlerDispatcher[args[1]]     
  if handlers then
    local i
    for i = 1, #handlers do
      handlers[i](sysarg, args[1], args[2], args[3])
    end
  end
end

--#endif //end of _SYSTEM_HANDLER_DISPATCHER_IMPLEMENT_INCLIDED_