-- 天神之力(改为了捐献金币)排行榜, 所又注入经验理解为捐献金币
--#include "data\config\modules\inject_exp_ranking_cfg.lua" once

InjectExpRanking = {}

-- 12 个 buff(3个职业，每个职业1到4个)
InjectExpRanking_minBuffId = 112
InjectExpRanking_maxBuffId = 123

InjectExpRankingMsgS2C = {
	GetData = 1, --获取信息
	InjectExpResult = 2, --注入经验结果
}

function InjectExpRanking_load()
	local curTime = System.getCurrMiniTime()
	if curTime <= 0 then -- 如果是lua引擎没有启动完
		return
	end

	--print("----------- 开始装载捐献排行榜 -----------")
	InjectExpRanking = {} -- 清空

	local file = io.open("data/runtime/ranking/InjectExpRanking.txt", "r")
	if not file then
		--print("没有 捐献金币排行榜 文件：ranking/InjectExpRanking.txt")
		return
	end

	local bom = file:read(3) -- read BOM
	if not bom or string.len(bom) < 3 then
		file:close()
		--print("error, 装载 捐献金币排行榜 失败(BOM error)")
		return
	end

	-- 0:成功并继续解析下一行；1:失败并继续解析下一行；2:旧排行榜数据
	local parseResult = 0

	local line
    local nLoopIndex = 0
	while true do
		line = file:read()
		if not line then break end

		parseResult = InjectExpRanking_parse_line(line, parseResult)
		if parseResult == 1 then
			--print("error, InjectExpRanking_parse_line")
			--print(line) -- 把信息打印出来，免得覆盖就没了
		end
         nLoopIndex = nLoopIndex + 1
        if nLoopIndex > 10000 then
                System.trace("LoopIndex InjectExpRanking_load")
                break
        end
	end

	file:close()

	local count = #InjectExpRanking
	if count == 0 then
		--print("装载 捐献金币排行榜 成功, 上榜人数0")
		return
	end

	-- 排序，从大到小
	table.sort(InjectExpRanking, InjectExpRanking_comps)

	if count > 10 then
		for i=count, 11, -1 do
			table.remove(InjectExpRanking)
		end

		count = 10
		InjectExpRanking_save()
	end

	--print("装载 捐献金币排行榜 成功, 上榜人数"..count)
end

function InjectExpRanking_save()
	-- 没有文件则新建，有则清空文件再写
	local file = io.open("data/runtime/ranking/InjectExpRanking.txt", "w")
	if not file then
		--print("------------ error, open InjectExpRanking.txt fail")
		return
	end

	local curTime = System.getCurrMiniTime() -- 保存时间，以便检查是否跨天
	if curTime <= 0 then return end

	local header = "time=" .. tostring(curTime) .. "#ActorId#InjectExp#ActorName\n"

	file:write(string.format("%c%c%c", 0xEF, 0xBB, 0xBF)) -- write BOM
	file:write(header) -- 写标题

	local count = 0
	for i, v in ipairs(InjectExpRanking) do
		if InjectExpRanking_write_line(file, v) then
			count = count + 1
			if count >= 10 then
				break
			end
		end
	end

	file:close()

	--print("保存 捐献金币排行榜 成功, 上榜人数"..count)
end

-- 排序算法
function InjectExpRanking_comps(a, b)
	return a.exp > b.exp
end

-- 解析时间，失败返回 0
function InjectExpRanking_parse_time(line)
	local pos1 = string.find(line, "time=", 1)
	if not pos1 then return 0 end

	local pos2 = string.find(line, '#', pos1 + 5)
	if not pos2 then return 0 end

	local substr = string.sub(line, pos1 + 5, pos2 - 1)
	local time = tonumber(substr)
	return time
end

function InjectExpRanking_is_old_data(line)
	local time = InjectExpRanking_parse_time(line)
	if time <= 0 then return true end

	local curTime = System.getCurrMiniTime()
	if curTime <= 0 then -- 如果是lua引擎没有启动完
		--print("----- error InjectExpRanking_parse_time lua引擎没有启动完")
		return false
	end

	if System.isSameDay(time, curTime) then
		return false
	end

	return true
end

-- 返回值：0:成功并继续解析下一行；1:失败并继续解析下一行；2:旧排行榜数据
function InjectExpRanking_parse_line(line, lastParseResult)
	if line == "" then return lastParseResult end

	-- ActorId InjectExp ActorName
	-- 如果玩家名字含有 '\t' 呢？所以这里一个一个分隔
	--[[
	local items = string_split(line, '\t')
	if #items ~= 3 then return false end

	local actorId = tonumber(items[1])
	local injectExp = tonumber(items[2])
	local actorName = items[3]
	if actorId <= 0 or injectExp <= 0 then
		return false
	end
	--]]

	local pos = string.find(line, '\t', 1)
	if not pos then
		-- 当标题解析
		if InjectExpRanking_is_old_data(line) then
			return 2
		else
			return 0
		end
	end

	if lastParseResult == 2 then -- 旧排行榜数据
		return 2
	end

	local substr = string.sub(line, 1, pos - 1)
	local actorId = tonumber(substr)
	if actorId <= 0 then return 1 end

	local i = pos + 1
	pos = string.find(line, '\t', i)
	if not pos then return 1 end

	substr = string.sub(line, i, pos - 1)
	local injectExp = tonumber(substr)
	if injectExp <= 0 then return 1 end

	-- 剩下的就都是名称

	local item = {id=actorId, exp=injectExp, name=string.sub(line, pos + 1)}

	table.insert(InjectExpRanking, item)
	return 0
end

function InjectExpRanking_write_line(file, item)
	if item.id <= 0 or item.exp <= 0 then return false end

	-- item.exp 为 64 位，不能用 %d
	--local line = string.format("%d	%d	%s\n", item.id, item.exp, item.name)
	local line = tostring(item.id).."	"..tostring(item.exp).."	"..item.name.."\n"

	file:write(line)

	return true
end

function InjectExpRanking_check_size()
	-- 保险点，重新取数组大小
	local count = #InjectExpRanking
	if count <= 10 then return end

	local actorList = {}
	for i=count, 11, -1 do
		local v = InjectExpRanking[i]
		local ptr = System.getEntityPtrByActorID(v.id)
		if ptr ~= nil then
			table.insert(actorList, ptr)
		end

		table.remove(InjectExpRanking)
	end

	count = 10

	for i, v in ipairs(actorList) do
		Actor.delBuffByIdRange(v, InjectExpRanking_minBuffId, InjectExpRanking_maxBuffId)
		
		--发送邮件，告知退出捐献排行榜
		local actorID = Actor.getIntProperty(v, PROP_ENTITY_ID)
		local str = "真是遗憾，您的努力我们看得到，但是有人比你更努力，我们被迫将您移除捐献榜单，继续加油吧！"
		System.AddMail(actorID, 3, 0, "捐献排行榜", str)
		
		OnInjectExpRankingSetPlayerRanking(v, 0)
	end
end


-- 查找插入的位置，返回: 新位置（0则不需要插入），旧位置（0则不在）, 数组大小(新位置不等于0时有效)
function InjectExpRanking_find_insert_pos(actorId, _exp)
	if _exp <= 0 then return 0,0,0 end

	local newPos = 0
	local oldPos = 0
	local count = 0
	for i, v in ipairs(InjectExpRanking) do
		if actorId == v.id then
			oldPos = i
		end

		if _exp > v.exp and newPos == 0 then
			newPos = i
		end

		count = count + 1
	end

	if count < 10 and newPos == 0 then
		newPos = count + 1
	end

	return newPos, oldPos, count
end

-- -----------------------------------------------------

function SendInjectExpRankingData(sysarg)
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sInjectExpRanking)
	DataPack.writeByte(netPack, InjectExpRankingMsgS2C.GetData)

	local actorId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
	local myRanking = 0

	local count = #InjectExpRanking
	if count > 10 then count = 10 end

	DataPack.writeByte(netPack, count)

	for i, v in ipairs(InjectExpRanking) do
		if i > 10 then break end

		--DataPack.writeUInt(netPack, v.id)
		DataPack.writeString(netPack, v.name)
		DataPack.writeString(netPack, tostring(v.exp)) -- 64 位（还不支持），所以当字符串传

		if actorId == v.id then
			myRanking = i
		end
	end

	DataPack.writeByte(netPack, myRanking)

	-- 本人注入的经验
	local var = Actor.getStaticVar(sysarg)
	local injectExp = var.InjectExp
	if injectExp == nil then injectExp = 0 end

	DataPack.writeString(netPack, tostring(injectExp))

	DataPack.flush(netPack)
end

function SendInjectExpResult(sysarg, ranking, exp)
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sInjectExpRanking)
	DataPack.writeByte(netPack, InjectExpRankingMsgS2C.InjectExpResult)

	DataPack.writeByte(netPack, ranking)
	DataPack.writeString(netPack, tostring(exp))

	DataPack.flush(netPack)
end

function InjectExpRankingUpdateBuff(beginIdx, endIdx)
	for i = beginIdx, endIdx do
		local item = InjectExpRanking[i]
		if item ~= nil then
			local ptr = System.getEntityPtrByActorID(item.id)
			if ptr ~= nil then
				local job = Actor.getIntProperty(ptr, PROP_ACTOR_VOCATION)
				if i >= 1 and i <= 10 and job >= 1 and job <= 3 then
					local lvl = i <= 3 and i or 4
					local bufId = InjectExpRanking_minBuffId + (lvl - 1) * 3 + (job - 1)
					local old_bufid = Actor.hasBuffByIdRange(ptr, InjectExpRanking_minBuffId, InjectExpRanking_maxBuffId)
					if old_bufid ~= bufId then
						if old_bufid ~= 0 then
							Actor.delBuffByIdRange(ptr, InjectExpRanking_minBuffId, InjectExpRanking_maxBuffId)
						end
						Actor.addBuffById(ptr, bufId)
                       
					end
                     --更新头衔排名
                     OnInjectExpRankingSetPlayerRanking(ptr,i)
				end
			end
		end
	end
end

-- @gfunc InjectExpRankingPrint
function InjectExpRankingprint()
	for i, v in ipairs(InjectExpRanking) do
		local item = InjectExpRanking[i]
		if item ~= nil then
			local ptr = System.getEntityPtrByActorID(item.id)
			if ptr ~= nil then
				local bufid = Actor.hasBuffByIdRange(ptr, InjectExpRanking_minBuffId, InjectExpRanking_maxBuffId)
				if bufid ~= 0 then
					bufid = bufid - InjectExpRanking_minBuffId + 1
					local lvl = 0
					if bufid >= 1 and bufid <= 3 then
						lvl = 1
					elseif bufid >= 4 and bufid <= 6 then
						lvl = 2
					elseif bufid >= 7 and bufid <= 9 then
						lvl = 3
					elseif bufid >= 10 and bufid <= 12 then
						lvl = 4
					end
					----print("----------rank="..lvl..",name="..item.name)
				end
			end
		end
	end
end

-- @gfunc _IExpRACN 16780136 "abc"
function _IExpRACN(actorId, actorName) -- InjectExpRankingActorChangedName
	actorId = tonumber(actorId)
	actorName = tostring(actorName)

	if actorId == 0 or actorName == "" then
		return
	end
	
	for i, v in ipairs(InjectExpRanking) do
		if v.id == actorId then
			v.name = actorName
			InjectExpRanking_save()
			print("_IExpRACN newName="..actorName)
			break
		end
	end
end

function InjectExpRankingInjectExp(sysarg, _exp, moneyType, money)
	if _exp <= 0 then return end

	local actorId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
	local actorName = Actor.getName(sysarg)

	local var = Actor.getStaticVar(sysarg)
	local oldInjectExp = var.InjectExp
	if oldInjectExp == nil then oldInjectExp = 0 end

	local newInjectExp = oldInjectExp + _exp
	var.InjectExp = newInjectExp

	local msg
	local logId = LogIds.InjectExpRanking
	if moneyType == mtCoin then
		logId = LogIds.UseCoinInjectExpRanking
		msg = "您成功捐献了<(c0xFF00ff00)".. money .. ">金币,当前捐献总数为<(c0xFF00ff00)"..tostring(newInjectExp)..">"
	elseif moneyType == mtBindCoin then
		logId = LogIds.UseBindCoinInjectExpRanking
		msg = "您成功捐献了<(c0xFF00ff00)".. money .. ">绑定金币,当前捐献总数为<(c0xFF00ff00)"..tostring(newInjectExp)..">"
	elseif moneyType == mtYuanbao then
		logId = LogIds.UseYbInjectExpRanking
		msg = "您成功捐献了<(c0xFF00ff00)".. money .. ">元宝,当前捐献总数为<(c0xFF00ff00)"..tostring(newInjectExp)..">"
	else
		logId = LogIds.InjectExpRanking
		msg = "您已成功注入<(c0xFF00ff00)".._exp..">经验,当前经验注入总数为<(c0xFF00ff00)"..tostring(newInjectExp)..">"
	end
	
	OnFinish_Liveness(sysarg,17)
	
	System.sendCommonLog(logId, actorId, actorName, moneyType,money,0, "","",tostring(oldInjectExp), "","",tostring(_exp), "",tostring(newInjectExp))

	local newPos, oldPos, count = InjectExpRanking_find_insert_pos(actorId, newInjectExp)
	if newPos == 0 then
		OnInjectExpRankingSetPlayerRanking(sysarg, 0)
		SendInjectExpResult(sysarg, 0, newInjectExp)
		return
	end

	local LvlIdx = 0
	if newPos == oldPos then
		InjectExpRanking[oldPos].exp = newInjectExp
		LvlIdx = 0
	else
		local item = {id=actorId, exp=newInjectExp, name=actorName}
		table.insert(InjectExpRanking, newPos, item)

		if oldPos > 0 then
			if newPos <= oldPos then
				table.remove(InjectExpRanking, oldPos + 1)
			else
				table.remove(InjectExpRanking, oldPos)
			end
		else
			count = count + 1 -- 新增
		end

		if newPos >= 4 and newPos <= 10 and oldPos >= 4 and oldPos <= 10 then
			LvlIdx = 0
		else
			if newPos >= 1 and newPos <= 3 then
				LvlIdx = newPos
			elseif newPos >= 4 and newPos <= 10 then
				LvlIdx = 4
			else
				LvlIdx = 0
			end
		end
	end

	if LvlIdx ~= 0 then
		Actor.delBuffByIdRange(sysarg, InjectExpRanking_minBuffId, InjectExpRanking_maxBuffId)

		local job = Actor.getIntProperty(sysarg, PROP_ACTOR_VOCATION)
		if job == 1 or job == 2 or job == 3 then
			local bufId = InjectExpRanking_minBuffId + (LvlIdx - 1) * 3 + (job - 1)
			Actor.addBuffById(sysarg, bufId)
		end
	end

	-- 排行改变
	if newPos ~= oldPos then
        InjectExpRankingUpdateBuff(1, 10)
        --越级改变后排行榜刷新显示有误- 改为重新排序
--		if oldPos == 0 then
--			if newPos < 10 then
--				InjectExpRankingUpdateBuff(newPos + 1, 10)
--			end
--		else
--			if newPos < oldPos then
--				InjectExpRankingUpdateBuff(newPos + 1, oldPos)
--			else
--				InjectExpRankingUpdateBuff(oldPos, newPos - 1)
--			end
--		end
	end

	-- 删除挤出排行榜的
	if count > 10 then
		InjectExpRanking_check_size()
	end

	InjectExpRanking_save()

	local newRanking = 0
	if newPos >= 1 and newPos <= 10 then
		newRanking = newPos
	end
	OnInjectExpRankingSetPlayerRanking(sysarg, newRanking)

	-- 返回结果给前端
	SendInjectExpResult(sysarg, newPos, newInjectExp)



	Actor.sendTipmsg(sysarg,msg,256)



	-- 提示
	if newPos ~= oldPos and newPos >= 1 and newPos <= 10 then
		local numbers = {"一", "二", "三", "四", "五", "六", "七", "八","九", "十"}
		local attrAddStrs = {"20%","15%","10%","5%","5%","5%","5%","5%","5%","5%"}
		local msg2 = string.format("玩家<(c0xFF00FF00)%s>捐献排行第%s,获得%s攻击加成！", actorName, numbers[newPos], attrAddStrs[newPos])
		System.broadcastTipmsg(msg2, ttScreenCenterBigNotice)
	end
	
	-->排行榜前三变动播报 
	if newPos ~= oldPos and newPos < 4 then
	  System.broadcastTipmsg( string.format("玩家<(n%s)>玩家一掷千金，冲上了捐献排行榜前三位，获得攻击BUFF！<前往捐献/@@showWin,164>", actorName), 128 )
	end
end

-- 改为了捐献金币
--[[
function OnInjectExpRankingInjectExp(sysarg, packet)
	local _exp = DataPack.readUInt(packet)

	if _exp <= 0 or _exp < inject_exp_ranking_cfg.min_exp then
		Actor.sendTipmsg(sysarg, string.format("每次至少需要注入 %d 经验", inject_exp_ranking_cfg.min_exp), ttFlyTip)
		return
	end

	local actorLevel = Actor.getIntProperty(sysarg, PROP_CREATURE_LEVEL)
	if actorLevel < inject_exp_ranking_cfg.need_level then
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.zf198, inject_exp_ranking_cfg.need_level), ttFlyTip)
		return
	end

	-- 玩家经验为64位长度
	local nCurrentExp = Actor.getUIntProperty(sysarg,PROP_ACTOR_EXP)
	local nHighExp = Actor.getUIntProperty(sysarg,PROP_ACTOR_EXP+1)
	----print("---------nHighExp="..nHighExp)
	if nHighExp == 0 and nCurrentExp < _exp then -- 如果高位大于 0 则肯定比32位的值大
		Actor.sendTipmsg(sysarg, "经验不足", ttFlyTip)
		return
	end

	Actor.addExp(sysarg, -_exp, LogIds.InjectExpRanking, 0) -- 扣经验

	InjectExpRankingInjectExp(sysarg, _exp, -1, 0)

end

-- 使用元宝注入经验
function OnInjectExpRankingUseYbInjectExp(sysarg, packet)
	local yb = DataPack.readUInt(packet)
	yb = math.floor(yb/100) -- 以 100 块为单位

	if yb <= 0 then
		Actor.sendTipmsg(sysarg, "每次至少需要注入 100 元宝", ttFlyTip)
		return
	end

	local actorLevel = Actor.getIntProperty(sysarg, PROP_CREATURE_LEVEL)
	if actorLevel < inject_exp_ranking_cfg.need_level then
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.zf198, inject_exp_ranking_cfg.need_level), ttFlyTip)
		return
	end

	local myYb = Actor.getUIntProperty(sysarg, PROP_ACTOR_YUANBAO)
	if myYb < (yb * 100) then
		SendRecommendTips(sysarg,"1")
		return
	end

	if Actor.changeMoney(sysarg, mtYuanbao, -(yb * 100), LogIds.YbInjectExpRankingConsume, 0) == false then
		return
	end

	local _exp = yb * inject_exp_ranking_cfg.yb_exp * 10000 -- yb_exp 的单位是 100 块元宝多少万经验

	InjectExpRankingInjectExp(sysarg, _exp, mtYuanbao, yb * 100)

end
--]]

-- 捐献金钱
function OnInjectExpRankingDonateMoney(sysarg, moneyType, money)
	if money <= 0 then
		return -- 玩家修改了数据
	end
	---* 校验捐献数量 *---
	--变成了自由输入
  --if moneyType==mtYuanbao then    
  --  if money==100 or money==1000 or money==10000 then else return end
  --elseif moneyType==mtCoin or moneyType==mtBindCoin then
  --  if money==100 or money==10000 or money==1000000 or money==10000000 then else return end
  --end 

	if moneyType ~= mtYuanbao and money < inject_exp_ranking_cfg.min_coin then
		Actor.sendTipmsg(sysarg, "每次至少需要注入 "..inject_exp_ranking_cfg.min_coin.." 金币", ttFlyTip)
		return
	end

	local actorLevel = Actor.getIntProperty(sysarg, PROP_CREATURE_LEVEL)
	if actorLevel < inject_exp_ranking_cfg.need_level then
		Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.zf198, inject_exp_ranking_cfg.need_level), ttFlyTip)
		return
	end

	if moneyType == mtYuanbao then
		local myYb = Actor.getUIntProperty(sysarg, PROP_ACTOR_YUANBAO)
		if myYb < money then
			SendRecommendTips(sysarg,"1")
			Actor.sendTipmsg(sysarg,"元宝不足",ttFlyTip)
			return
		end
	elseif moneyType == mtCoin then
		local myCoin = Actor.getUIntProperty(sysarg, PROP_ACTOR_COIN)
		if myCoin < money then
			Actor.sendTipmsg(sysarg,"金币不足",ttFlyTip)
			return
		end
	elseif moneyType == mtBindCoin then
		local myBindCoin = Actor.getUIntProperty(sysarg, PROP_ACTOR_BIND_COIN)
		if myBindCoin < money then
			Actor.sendTipmsg(sysarg,"绑定金币不足",ttFlyTip)
			return
		end
	else
		return
	end

	if Actor.changeMoney(sysarg, moneyType, -money, LogIds.YbInjectExpRankingConsume, "捐献排行") == false then
		return
	end

	local _exp = money
	if moneyType == mtYuanbao then
		_exp = money * inject_exp_ranking_cfg.coin_1yb -- 元宝兑换成金币
	end

	InjectExpRankingInjectExp(sysarg, _exp, moneyType, money)

end

-- 设置玩家排名(头顶要显示:捐献排行第X名), 0 为没有上榜
function OnInjectExpRankingSetPlayerRanking(sysarg, ranking)
	-- PROP_ACTOR_CURRENT_HEAD_TITLE（byte0:头衔1[0为没有选择],byte1:头衔2[0为没有选择],byte2:捐献排行[0为没有上榜])
	local headtitleVal = Actor.getUIntProperty(sysarg, PROP_ACTOR_CURRENT_HEAD_TITLE)
	headtitleVal = System.setIntByte(headtitleVal, 2, ranking)
   
	Actor.setUIntProperty(sysarg, PROP_ACTOR_CURRENT_HEAD_TITLE, headtitleVal)
end

-- 服务器跨天
function OnInjectExpRankingNewDayArrive()

	for i, v in ipairs(InjectExpRanking) do
		local ptr = System.getEntityPtrByActorID(v.id)
		if ptr ~= nil then
			Actor.delBuffByIdRange(ptr, InjectExpRanking_minBuffId, InjectExpRanking_maxBuffId)
			OnInjectExpRankingSetPlayerRanking(ptr, 0)
		end
	end

	local isSave = false
	if #InjectExpRanking > 0 then
		isSave = true
	end

	InjectExpRanking = {}

	if isSave then
		InjectExpRanking_save()
	end
end

--玩家登陆
function OnInjectExpRankingPlayerLogin(sysarg, isCrossDay, var)
	--玩家跨天登陆
	if isCrossDay ~= 0 then
		var.InjectExp = nil
		return
	end
   
	local minInjectExp = 0
	if InjectExpRanking[10] ~= nil then
		minInjectExp = InjectExpRanking[10].exp
	else
		local count = #InjectExpRanking
		if count > 0 then
			minInjectExp = InjectExpRanking[count].exp
		end
	end

	if minInjectExp == 0 then return end -- 排行榜空

	local injectExp = var.InjectExp
	if injectExp == nil or injectExp < minInjectExp then
		return -- 未上榜
	end

	local actorId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)

	local pos = 0
	for i, v in ipairs(InjectExpRanking) do
		if v.id == actorId then
			pos = i
			break
		end
	end

	if pos == 0 then return end -- 未上榜

	local LvlIdx = 0
	if pos == 1 or pos == 2 or pos == 3 then
		LvlIdx = pos
	elseif pos >= 4 and pos <= 10 then
		LvlIdx = 4
	else
		return
	end

	local job = Actor.getIntProperty(sysarg, PROP_ACTOR_VOCATION)
	if job == 1 or job == 2 or job == 3 then
		local bufId = InjectExpRanking_minBuffId + (LvlIdx - 1) * 3 + (job - 1)
		Actor.addBuffById(sysarg, bufId)
	end
   
	OnInjectExpRankingSetPlayerRanking(sysarg, pos)
end

-- 客户端消息
function OnMsgInjectExpRanking(sysarg, sysid, packet)

	if sysid ~= LogicCmd.miscSys.sub.cInjectExpRanking then
		--print("error OnMsgInjectExpRanking, sysid="..sysid)
		return
	end

	local msgid = DataPack.readByte(packet)

	if msgid == 1 then -- 获得排行榜数据
		SendInjectExpRankingData(sysarg)
	elseif msgid == 2 then -- 捐献元宝
		local money = DataPack.readUInt(packet)
		OnInjectExpRankingDonateMoney(sysarg, mtYuanbao, money)
	elseif msgid == 3 then -- 捐献金币
		local money = DataPack.readUInt(packet)
		OnInjectExpRankingDonateMoney(sysarg, mtCoin, money)
	elseif msgid == 4 then -- 捐献绑金
		local money = DataPack.readUInt(packet)
		OnInjectExpRankingDonateMoney(sysarg, mtBindCoin, money)
	else
		--print("error OnMsgInjectExpRanking, unknown msgid="..msgid)
		return
	end

end

-- 服务器启动或者 @rsf 时重新装载
InjectExpRanking_load()