--灵兽献瑞副本
--#include "data\envir\FubenConfig\LingShouXianRui.lua" once
--#include "data\functions\lua_utils.lua" once
--#include "data\functions\Activity\Common\Awards.lua" once
--#include "data\functions\Consume.lua" once --消耗

function LSXR_IsHitHuff(item_cfg)
	local randNum = System.getRandomNumber(100)+1  -- [1, 100]
	return (randNum <= item_cfg.huff_rate)
end

function LSXR_InAttackArea(sysarg)
	local attack_area = LingShouXianRuiFubenCfg.attack_area
	local x = Actor.getIntProperty(sysarg, PROP_ENTITY_POSX)
	
	if x < attack_area[1][1] or x > attack_area[2][1] then
		return false
	end
	
	local y = Actor.getIntProperty(sysarg, PROP_ENTITY_POSY)
	
	if y < attack_area[1][2] or y > attack_area[2][2] then
		return false
	end
	
	return true
end

function LSXR_GiveAward(sysarg, award, isHuffStatus)
	local my_award

	if isHuffStatus then -- 双倍奖励
		my_award = table.deepcopy(award)
		for k, v in ipairs (my_award) do
			if v.count ~= nil then
				v.count = v.count * 2
			end
		end
	else
		my_award = award
	end

	if Awards.CheckBagGridCount(sysarg, my_award) ~= true then
		return false
	end
	
	Awards.Give(sysarg, my_award, 1, Lang.LogTips.f0001)
	return true
end

function LSXR_GetTarget(sysarg)
--[[
	if Actor.getTargetId(sysarg) ~= LingShouXianRuiFubenCfg.monster_id then		
		return
	end
	local hTarget = Actor.getTargetHandle(sysarg)
	local targetPtr = Actor.getEntity(hTarget)
	if targetPtr == nil then return end
	
	local x, y = Actor.getEntityPosition(targetPtr, 0, 0);
	return hTarget, targetPtr, x, y  
--]]
	
	local sceneid = Actor.getSceneId(sysarg)
	local fbHandle = Actor.getFubenHandle(sysarg)
	local hscene = Fuben.getSceneHandleById(sceneid, fbHandle)
	local targetPtr = Fuben.getMonsterPtrById(hscene, LingShouXianRuiFubenCfg.monster_id)	
	if targetPtr == nil then return end
	
	local hTarget = Actor.getHandle(targetPtr)	
	local x, y = Actor.getEntityPosition(targetPtr, 0, 0);
	return hTarget, targetPtr, x, y  
end

--[[function UseTianLeiDanItem(sysarg,itemidx,itemPtr,param,delType)
	local item_idx = param
	--local fbPtr = Actor.getFubenPrt(sysarg)
	--if fbPtr == nil then return false end
	local fubenId = Actor.getFubenId(sysarg)
	if fubenId ~= LingShouXianRuiFubenCfg.fuben_id then --灵兽献瑞副本
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.fuben045, ttFlyTip)
		return true 
	end
	
	--是否在攻击范围内
	if not LSXR_InAttackArea(sysarg) then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.fuben047, ttFlyTip)
		return true
	end
	
	local myId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
	local var = Actor.getStaticVar(sysarg)
	if var.buyAstNum == nil then
		var.buyAstNum = 0
	end
	if var.buyAstNum >= LingShouXianRuiFubenCfg.max_use_count then
		local msg = string.format(Lang.ScriptTips.fuben044, LingShouXianRuiFubenCfg.max_use_count)
		Actor.sendTipmsg(sysarg, msg, ttFlyTip)
		return true
	end
	
	--是否选择了灵兽
	local hTarget, targetPtr, x, y = LSXR_GetTarget(sysarg)
	if hTarget == nil or hTarget == 0 then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.fuben046, ttFlyTip)
		return true
	end
	
	local item_cfg = LingShouXianRuiFubenCfg.item_cfg[param]
	
	--删除双击的那个物品
	--local removeCount = Actor.removeItem(sysarg, item_cfg.item_id, 1, -1, -1, -1, "", 2)
	local removeCount = Item.removeItem(sysarg, itemPtr, 1, "", 2)
	if removeCount < 1 then return true end
	
	local isHuffStatus = false	
	local hasHuffBuff = Actor.hasBuffById(targetPtr, LingShouXianRuiFubenCfg.huff_buff_id)
	local isHitHuff = LSXR_IsHitHuff(item_cfg)
	if isHitHuff then
		isHuffStatus = true
	else
		isHuffStatus = hasHuffBuff
	end
		
	--使用技能					      
	local skill_cfg = LingShouXianRuiFubenCfg.skill_cfg	
	local ec = Actor.useSkillToTarget(sysarg, skill_cfg.skill_id, hTarget, true, x, y, false, skill_cfg.skill_level);
	
	--添加发怒buff
	if isHitHuff and hasHuffBuff == false then
		Actor.addBuffById(targetPtr, LingShouXianRuiFubenCfg.huff_buff_id)
	end
		
	local randNum = System.getRandomNumber(100)+1  -- [1, 100]

	for k, v in ipairs (LingShouXianRuiFubenCfg.item_cfg[item_idx].awards) do
		if randNum >= v.rate[1] and randNum <= v.rate[2] then
			LSXR_GiveAward(sysarg, v.award, isHuffStatus)
			break
		end
	end
	
	var.buyAstNum = var.buyAstNum + 1
	return true
end

function UseTianLeiDanItemFunc(sysarg)
	for k, v in ipairs (LingShouXianRuiFubenCfg.item_cfg) do
		GlobalItemFn[v.item_id] = { func = UseTianLeiDanItem, params = k };
	end
end

table.insert(InitFnTable,UseTianLeiDanItemFunc)

--]]

MiscsImplement.GetBuyBombAndLaunchBomb = function(sysarg, msgid, packet)

	local ButtonType = DataPack.readByte(packet) -- 按钮类型 ：1 购买  2 发射
	local BombType = DataPack.readByte(packet)   -- 炸弹类型 ：1 小天雷弹  2 中天雷弹  3 大天雷弹 
	local BombID = DataPack.readByte(packet)     -- 炸弹ID：1  经验天雷弹  2 金钱天雷弹   3 材料天雷弹
	
	if not ButtonType or not BombType or not BombID then return false end
	
	local config = LingShouXianRuiFubenCfg.item_cfg
	local var = Actor.getStaticVar(sysarg)
	local dVar = Actor.getDyanmicVar(sysarg)
	local nNowDt = 0
	if ButtonType == 1 then
		
		if not var.BombNum then var.BombNum = {} end
		
		if not var.freeBomb then var.freeBomb = {} end
		if not var.freeBomb[BombType] then 
			var.freeBomb[BombType] = {} 
		end	
		
		if not var.freeBomb[BombType][BombID] then var.freeBomb[BombType][BombID] = 0 end
	
		if not config[BombType] or BombType < 2 then return false end 
			
		if var.freeBomb[BombType][BombID] > 0 then
			Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf596,ttFlyTip)
			return false 
		end 
		
		local buyBombCfg = config[BombType][BombID].buy_money
		local consumesdata = {}
		
		local result = CheckOneConsume(sysarg, false, buyBombCfg, true, consumesdata)
		if not result then return end 
		
		result = DeductOneConsume(sysarg, false, buyBombCfg, GameLog.cBuyBombAndLaunchBombConsume)
		if not result then return end 
		
		if not var.BombNum[BombType] then var.BombNum[BombType] = {} end
		
		if not var.BombNum[BombType][BombID] then var.BombNum[BombType][BombID] = 0 end
		
		var.BombNum[BombType][BombID] = config[BombType].BuyNum
		var.freeBomb[BombType][BombID] = 1
		local netPack = DataPack.allocPacket(sysarg, 139, 110)
		if not netPack then return false end

		for i = 1 ,#LingShouXianRuiFubenCfg.item_cfg do
		if not var.BombNum[i] then var.BombNum[i] = {} end
			for j = 1,#config[i] do
				if not var.BombNum[i][j] then 
					var.BombNum[i][j] = 0
				end
				DataPack.writeByte(netPack, var.BombNum[i][j])
			end
		end
		DataPack.flush(netPack)
		
	elseif ButtonType == 2 then
	
		nNowDt = System.getCurrMiniTime()
		local bresurt = false
		
		if dVar.cooling == nil then 
			dVar.cooling = nNowDt
			bresurt = true
		end
		
		if nNowDt < dVar.cooling and bresurt == false then
			Actor.sendTipmsg(sysarg,Lang.ScriptTips.zf590,ttFlyTip)
			return false
		end
		local fubenId = Actor.getFubenId(sysarg)
		if fubenId ~= LingShouXianRuiFubenCfg.fuben_id then --灵兽献瑞副本
			Actor.sendTipmsg(sysarg, Lang.ScriptTips.fuben045, ttFlyTip)
			return true 
		end
		
			--是否在攻击范围内
		if not LSXR_InAttackArea(sysarg) then
			Actor.sendTipmsg(sysarg, Lang.ScriptTips.fuben047, ttFlyTip)
			return true
		end
		
			--是否选择了灵兽
		local hTarget, targetPtr, x, y = LSXR_GetTarget(sysarg)
		if hTarget == nil or hTarget == 0 then
			Actor.sendTipmsg(sysarg, Lang.ScriptTips.fuben046, ttFlyTip)
			return true
		end

		if not var.BombNum or not var.BombNum[BombType] or not var.BombNum[BombType][BombID] then return end
	
		if var.BombNum[BombType][BombID] < 1 then 
			Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.zf595,config[BombType][BombID].name), ttFlyTip)
			return 
		end
	
		--使用技能					      
		local skill_cfg = LingShouXianRuiFubenCfg.skill_cfg	
		local ec = Actor.useSkillToTarget(sysarg, skill_cfg.skill_id, hTarget, true, x, y, false, skill_cfg.skill_level);
	
		local award = config[BombType][BombID].awards
		if BombID == 3 then
			local randNum = math.random(1,#award)
			if Awards.CheckBagGridCount(sysarg, award[randNum]) ~= true then
				return false
			end
			Awards.Give(sysarg, award[randNum], 1, Lang.LogTips.f0001)
			for key,value in ipairs(award[randNum]) do
				if value.type == 0 then
					local name = Item.getItemName(value.id)
					Actor.sendTipmsg(sysarg,string.format(Lang.ScriptTips.zf594,value.count,name),128+2)
				end
			end
		else
			if Awards.CheckBagGridCount(sysarg, award) ~= true then
				return false
			end
			if not var.days.allreward then
				var.days.allreward = {}
				var.days.allreward[0] = 0
				var.days.allreward[1] = 0
			end
			Awards.Give(sysarg, award, 1, Lang.LogTips.f0001)
			local msg = ""
			if award[1].type == 2 then
				msg = string.format(Lang.ScriptTips.zf592,award[1].count)
				var.days.allreward[0] = var.days.allreward[0] + award[1].count
			elseif award[1].type == 5 then
				msg = string.format(Lang.ScriptTips.zf593,award[1].count)
				var.days.allreward[1] = var.days.allreward[1] + award[1].count
			end

			Actor.changeActivityProgress(sysarg,tonumber(var.days.allreward[0]),tonumber(var.days.allreward[1]))
			Actor.sendTipmsg(sysarg,msg,128+2)
		end
		Actor.addEffect(sysarg,171,6,1000)
		Actor.addEffect(targetPtr,173,6,1000)
		
		var.BombNum[BombType][BombID] = var.BombNum[BombType][BombID] - 1
		local netPack = DataPack.allocPacket(sysarg, 139, 110)
		if not netPack then return false end
		for i = 1 ,#LingShouXianRuiFubenCfg.item_cfg do
			if not var.BombNum[i] then var.BombNum[i] = {} end
			for j = 1,#config[i] do
				if not var.BombNum[i][j] then 
					var.BombNum[i][j] = 0
				end
				DataPack.writeByte(netPack, var.BombNum[i][j])
			end
		end
		DataPack.flush(netPack)
	end
	dVar.cooling = nNowDt+3
	bresurt = false
end

--MiscsImplement.registerMsgHandler(LogicCmd.miscSys.sub.cBuyBombAndLaunchBomb, MiscsImplement.GetBuyBombAndLaunchBomb)