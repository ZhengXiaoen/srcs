

--格式化数字
function PraseNumDesc(value)
	local fmt = ""
	if value >= 10000 then
		fmt = string.format(Lang.ScriptTips.c000174, value/10000)
	else
		fmt = string.format("%d", value)
	end
	return fmt
end


function getStrBackNopStr(Str, nLen)
	local i
	local nopstr = ""
	
	for i = 1, nLen - string.len(Str) do
		if i % 3 == 0 then
			nopstr = nopstr .. "  "
		end
	end

	return nopstr
end

-- functions/Activity/Common/Awards.lua 中有定义
function StringFromAwardType(awardType)
	awardStringTable = {
		--[0] = "物品"，
		[1] = "修为",
		[2] = "经验",
		[3] = "帮派贡献值",
		[4] = "阵营贡献值",
		[5] = "绑定金币",
		[6] = "金币",
		[7] = "绑定元宝",
		[8] = "称谓",
		--[9] = "技能",
		[10] = "战魂值",
		[11] = "成就点",
		[12] = "声望",
		[13] = "宠物",
		[14] = "活跃度",
		[15] = "元宝",
		[16] = "繁荣度",
		[17] = "行会玥石",
		[18] = "技能XP值",
		[19] = "竞技积分",
		[20] = "经验",
		[21] = "荣誉",
		[22] = "转生灵魄",
		[23] = "怒气",
		[24] = "刷出BOSS",
		[25] = "等级提升",
		[26] = "宝宝升级",
		[27] = "行会资金",
		[28] = "提升师徒亲密度",
		[29] = "魅力",
		[30] = "英雄的经验",
		[31] = "提升英雄等级",
		[32] = "提升坐骑星级",
		[33] = "魔珠",
		[34] = "灵力",
		[35] = "战勋",
		[36] = "能量",
		[37] = "魔晶值",
		[38] = "战功值",
		[39] = "帮派积分",
		[40] = "衣橱经验",
		[41] = "功勋值",
		[42] = "圣珠结晶",
		[43] = "乾坤碎片数量",
		[44] = "精羽毛",
		[45] = "护盾结晶",
		[46] = "护符碎片",
		[47] = "宝石结晶",
		[48] = "特戒结晶",
		[49] = "炼金值",
		[50] = "金刚石",
		[51] = "战将灵力",
		--[52] = "跟据性别奖励物品 {男,女}",
		--[53] = "跟据职业奖励物品 {战士, 法师, 道士}",
		--[54] = "跟据性别和职业奖励物品 { 男:{战士, 法师, 道士}, 女:{战士, 法师, 道士}}",
		--[55] = "",
		[56] = "佣兵经验",
		[71] = "注魂值",
	}
		
	return awardStringTable[awardType]		
end

function BuildStringFromAwardItem(_type, id, count, param)
	if count == 0 then return end
	
	local name
	
	if _type == 0 then
		--if param ~= nil and type(param) ~= 'number' then
		--	id = Item.getItemProperty(sysarg, param, Item.ipItemID, 0)  --获得物品的ID 
		--end
		
		name = Item.getItemName(id)
	elseif _type == 52 then --跟据性别奖励物品
		-- 0:男；1:女
		--local nSex = Actor.getIntProperty(sysarg,PROP_ACTOR_SEX)				
		--name = Item.getItemName(id[nSex + 1])
		return nil
	elseif _type == 53 then --跟据职业奖励物品
		-- 1:战士；2:法师；3:道士
		--local nJob = Actor.getIntProperty(sysarg,PROP_ACTOR_VOCATION)
		--name = Item.getItemName(id[nJob])
		return nil
	elseif _type == 54 then --跟据性别和职业奖励物品
		--local nSex = Actor.getIntProperty(sysarg,PROP_ACTOR_SEX)
		--local nJob = Actor.getIntProperty(sysarg,PROP_ACTOR_VOCATION)
		--local itemids = id[nSex + 1]
		--if itemids == nil then return end
		
		--name = Item.getItemName(itemids[nJob])
		return nil
	else
		name = StringFromAwardType(_type)
	end
	
	if name == nil then return end
	
	if count >= 10000 and (math.floor(count/10000) * 10000 == count) then
		return string.format("<(c0xFF00FF00)%s>+<(c0xFF00FF00)%d万>", name, math.floor(count/10000))
	else
		return string.format("<(c0xFF00FF00)%s>+<(c0xFF00FF00)%d>", name, count)
	end
end

function BuildStringFromAllAwards(awards)
	if not awards then return "" end	
	
	local msg = ""
	for k,v in pairs(awards) do
		local str = BuildStringFromAwardItem(v.type, v.id, v.count, v.param)
		if str ~= nil then
			if msg == "" then
				msg = str
			else
				msg = msg .. "," .. str
			end
		end
	end
	
	return msg
end
