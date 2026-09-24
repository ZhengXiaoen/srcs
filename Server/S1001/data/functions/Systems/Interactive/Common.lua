
--#include "data\config\misc\Interact.lua" once --配置文件
--#include "data\functions\GlobalDefine.lua" once

--进入太虚灵泉时，初始化温泉特殊操作的次数
--InteractTimes会在每日重置为nil，
--递香皂改成抚摸，可替代道具是润肤乳（864）
--搓背改成按摩，可替代道具是肥皂（863）
function InitInteractDatas(sysarg)
	local config = InteractConfig
	local svar = Actor.getStaticVar(sysarg)
	local InteractTimes = svar.days.InteractTimes
	--InteractTimes = nil
	if not InteractTimes then
		svar.days.InteractTimes = {}
		
		svar.days.InteractTimes[1] = config[1][1]	--递香皂改成抚摸（每日免费次数）
		svar.days.InteractTimes[2] = config[2][1]	--搓背改成按摩（每日免费次数）
		svar.days.InteractTimes[3] = config[3][1]	--按摩改成同游（每日免费次数）
		svar.days.InteractTimes[4] = config[4][1]	--拥吻改成热吻（每日免费次数）

		svar.days.InteractTimes[11] = 0						--使用沐浴乳的次数
		svar.days.InteractTimes[21] = 0						--使用肥皂的次数
		
		InteractTimes = svar.days.InteractTimes
	end
	
	return InteractTimes
end

function ResetInteractDatas(sysarg)
	local config = InteractConfig
	local svar = Actor.getStaticVar(sysarg)
	svar.days.InteractTimes = {}
	svar.days.InteractTimes[1] = config[1][1]	--递香皂
	svar.days.InteractTimes[2] = config[2][1]	--搓背
	svar.days.InteractTimes[3] = config[3][1]	--按摩
	svar.days.InteractTimes[4] = config[4][1]	--拥吻
end

function GetInteractData(sysarg, type)
	local InteractTimes = InitInteractDatas(sysarg)
	return InteractTimes[type]
end

function CheckInteractData(sysarg, type)
	local InteractTimes = InitInteractDatas(sysarg)
	if InteractTimes[type] <= 0 then
		local item  = InteractConfig[type][2]
		if Actor.getItemCount(sysarg, item) > 0 then
			return true
		else
			Actor.messageBox(sysarg,0,0,Lang.Activity.a00190,Lang.Activity.a00191.."/BuyStoreItem,"..item,Lang.Activity.a00192.."/cancelFunc",nil)
			return false
		end
	end
	return true
end

--购买道具
function BuyStoreItem(sysarg, itemId)
	Actor.openDialogs(sysarg,diBuyAnItem,tostring(itemId))
end

function ReduceInteractData(sysarg, type)
	local type = tonumber(type)
	
	InitInteractDatas(sysarg)
	
	local svar = Actor.getStaticVar(sysarg)
	local InteractTimes = svar.days.InteractTimes
	if not InteractTimes[type] then return false,0 end
	if InteractTimes[type] <= 0 then
		local item  = InteractConfig[type][2]
		if item ~= 0 and Actor.getItemCount(sysarg, item) > 0 then
			if Actor.removeItem(sysarg, item, 1) < 1 then
				return false,0
			end
			return true, InteractTimes[type]
		else
			return false,0
		end
		
		-- local yb  = InteractConfig[type][3]
		-- local hasYb = Actor.getIntProperty(sysarg, PROP_ACTOR_YUANBAO)
		-- if yb ~= 0 and hasYb >= yb then
			-- if Actor.setUIntProperty(sysarg, PROP_ACTOR_YUANBAO, hasYb-yb) ~= true then
				-- return false,0
			-- end
			-- return true, InteractTimes[type]
		-- else
			-- return false,0
		-- end
	else
		InteractTimes[type] = InteractTimes[type] - 1
	end
	
	return true, InteractTimes[type]
end

function SendInteractData(sysarg, tbData)
	local pack = DataPack.allocPacket(sysarg,139,54)      
	if pack == nil then return end
	DataPack.writeByte(pack,table.getn(tbData))
	for k, v in ipairs(tbData) do
		DataPack.writeByte(pack,v.type)
		DataPack.writeByte(pack,v.count)
	end
	DataPack.flush(pack)
end

--初始化太虚灵泉部分数据(每次进入太虚灵泉)
function InitAutoAcceptFlag(sysarg)
	local svar = Actor.getStaticVar(sysarg)
	svar.autoAcceptSpringAction = 1		--默认自动接受对方玩家的互动请求
	return svar.autoAcceptSpringAction
end

--向客户端发送太虚灵泉部分数据
function SendAutoAcceptFlag(sysarg)
	local pack = DataPack.allocPacket(sysarg, LogicCmd.miscSys.sysId, LogicCmd.miscSys.sub.sAutoAcceptSpringAction)
	if pack == nil then return end
	local svar = Actor.getStaticVar(sysarg)
	DataPack.writeByte(pack, svar.autoAcceptSpringAction)
	DataPack.flush(pack)
end