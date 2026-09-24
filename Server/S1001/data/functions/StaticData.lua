
LuaStaticData = {} --静态数据
LuaDyanmicData = {} --动态数据

LuaStaticData_is_dirty = false -- 静态数据是否已经修改


function set_static_data_dirty()
	LuaStaticData_is_dirty = true
end

function save_static_data()
	if LuaStaticData == nil then
		LuaStaticData = {}
	end

	LuaHelp.saveTable(LuaStaticData, "data/runtime/script/StaticData.lua") -- 保存 LuaStaticData
	LuaStaticData_is_dirty = false
end

function save_dyanmic_data()
	if LuaDyanmicData == nil then
		LuaDyanmicData = {}
	end
	
	LuaHelp.saveTable(LuaDyanmicData, "data/runtime/script/DyanmicData.lua") -- 保存 LuaDyanmicData
end

function load_script_from_file(filename)
	local file = io.open(filename, "r")
	if not file then
		--print("load_static_data_from_file error, open file fail, ".. filename)
		return nil
	end
	
	local str = file:read("*a")
	file:close()
	
	str = "return " .. str
	
	local func = loadstring(str)
	if type(func) ~= "function" then
		print("load_static_data_from_file error, err=-2")
		return nil
	end
	
	local result = func()
	if type(result) ~= "table" then
		print("load_static_data_from_file error, err=-3")
		return nil
	end
	
	return result
end

function load_static_data_from_file()
	LuaStaticData = load_script_from_file("data/runtime/script/StaticData.lua")
	if LuaStaticData == nil then
		LuaStaticData = {}	
	end
	
	LuaStaticData_is_dirty = false
end

function load_dyanmic_data_from_file()
	LuaDyanmicData = load_script_from_file("data/runtime/script/DyanmicData.lua")
	if LuaDyanmicData == nil then
		LuaDyanmicData = {}	
	end
end

function clear_dyanmic_data_file()
	-- 没有文件则新建，有则清空文件再写		
	local file = io.open("data/runtime/script/DyanmicData.lua", "w")
	if not file then
		return
	end
	
	file:close()
end

function static_data_on_timer(leftTimes)
	if LuaStaticData_is_dirty then
		save_static_data()
	end
end

function static_data_on_logic_server_started()
	load_static_data_from_file() -- 装载 LuaStaticData
	clear_dyanmic_data_file()
	
	-- 定时 3 分钟保存
	System.addTimer("static_data_on_timer", 3 * 60 * 1000, -1)
end