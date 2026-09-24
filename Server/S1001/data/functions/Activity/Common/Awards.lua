

--奖励相关接口
--[[
	awards = 
	{
		{type = 0, id = 2429, count = 1, quality = -1, strong = -1, bind = 1, param = 0},
		{type = 6, id = 0, count = 100},
	}
--]]


Awards =
{
	--检测背包空间 awards:奖励表 
	CheckBagGridCount = function (sysarg, awards,tips)
		if not awards then return false, 1000000 end
		local needCount = 0
		for k,v in pairs(awards) do
			if v.type == 0 or v.type == 52 or v.type == 53 or v.type == 54 then
				local quality = v.quality or 0
				local strong = v.strong or 0
				local bind = v.bind or 0
				local param = v.param or nil
				local guid = 0
				local count = math.floor(v.count)
				local id = v.id
				
				if v.type == 0 then
					if type(param) ~= 'number' and param ~= nil then
						id = Item.getItemProperty(sysarg, param, Item.ipItemID, 0)  --获得物品的ID 
					end
					
					if v.sex then
						local nSex = Actor.getIntProperty(sysarg,PROP_ACTOR_SEX)
						if nSex ~= v.sex and v.sex ~= -1 then
							count = 0
						end
					end
					if v.job then
						local nJob = Actor.getIntProperty(sysarg,PROP_ACTOR_VOCATION)
						if nJob ~= v.job and v.job ~= 0 then
							count = 0
						end
					end					
				elseif v.type == 52 then --跟据性别奖励物品
					-- 0:男；1:女
					local nSex = Actor.getIntProperty(sysarg,PROP_ACTOR_SEX)
					id = v.id[nSex + 1]
				elseif v.type == 53 then --跟据职业奖励物品
					-- 1:战士；2:法师；3:道士
					local nJob = Actor.getIntProperty(sysarg,PROP_ACTOR_VOCATION)
					id = v.id[nJob]
				elseif v.type == 54 then --跟据性别和职业奖励物品
					local nSex = Actor.getIntProperty(sysarg,PROP_ACTOR_SEX)
					local nJob = Actor.getIntProperty(sysarg,PROP_ACTOR_VOCATION)
					local itemids = v.id[nSex + 1]
					if itemids == nil then return false, 1000000 end
					
					id = itemids[nJob]
				end
				
				if id == nil or type(id) ~= 'number' then return false, 1000000 end					
				
				if count > 0 then
					needCount = needCount + Item.getAddItemNeedGridCount(sysarg, id, count, quality, strong, bind, guid)
				end
			end
		end
		
		if needCount <= 0 then return true, needCount end 
		
		local hasCount = Item.getBagEmptyGridCount(sysarg)
		if hasCount >= needCount then return true, needCount end
		
		-- 没有指定提示则显示默认提示
		if not tips then 
			Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.mt00001, needCount), ttFlyTip)			
		end
		return false, needCount
	end,
	
	CheckBagNeedGridCount = function (sysarg, needCount)
		if needCount <= 0 then return false end
		
		local hasCount = Item.getBagEmptyGridCount(sysarg)
		if hasCount < needCount then 
			Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.mt00001, needCount), ttFlyTip)
			return false
		end
		return true
	end,


	--给予奖励，调用前要先调用 Awards.CheckBagGridCount() awards:奖励表 logId:日志ID logStr:日志表述
	
	GiveNoCheck = function (sysarg, awards, logId, logStr, wayId)
		if not awards then return false end	
				
		local giveCount = 0;
		
		for k,v in pairs(awards) do
			local quality = v.quality or 0
			local strong = v.strong or 0
			local bind = v.bind or 1
			local param = v.param or nil
			local guid = v.param  or 0
			wayId = wayId or -1
			local circle = v.circle or 0
			local sex = v.sex or -1
			local job = v.job or 0
			
			local id = v.id
			
			if v.type == 0 then
				if type(param) ~= 'number' and param ~= nil then
					id = Item.getItemProperty(sysarg, param, Item.ipItemID, 0)  --获得物品的ID 
				end
			elseif v.type == 52 then --跟据性别奖励物品
				-- 0:男；1:女
				local nSex = Actor.getIntProperty(sysarg,PROP_ACTOR_SEX)
				id = v.id[nSex + 1]
			elseif v.type == 53 then --跟据职业奖励物品
				-- 1:战士；2:法师；3:道士
				local nJob = Actor.getIntProperty(sysarg,PROP_ACTOR_VOCATION)
				id = v.id[nJob]
			elseif v.type == 54 then --跟据性别和职业奖励物品
				local nSex = Actor.getIntProperty(sysarg,PROP_ACTOR_SEX)
				local nJob = Actor.getIntProperty(sysarg,PROP_ACTOR_VOCATION)
				local itemids = v.id[nSex + 1]
				if itemids == nil then return false end
				
				id = itemids[nJob]
			end
			
			if id == nil or type(id) ~= 'number' then return false end
			
			local count = math.floor(v.count)
			
			
			--军鼓值奖励特殊处理(因为在c++那边不作处理，并且返回Actor.giveAward必定返回真，所以不用管下面的代码)
			if v.type== 67 then
				local var = Actor.getStaticVar(sysarg)
				if var.JunGuZhi ==nil then  var.JunGuZhi =0 end
				if var.JunGuZhi<=0 then var.JunGuZhi=0 end 
				var.JunGuZhi = count + var.JunGuZhi
				SendJunGuInfo(sysarg)
			elseif v.type== 68 then  --斗笠值奖励特殊处理
				local var = Actor.getStaticVar(sysarg)
				if var.MianJinZhi ==nil then  var.MianJinZhi =0 end
				if var.MianJinZhi<=0 then var.MianJinZhi=0 end 
				var.MianJinZhi=var.MianJinZhi+count
				SendMianJuInfo(sysarg)
			end
		
			
			if Actor.giveAward(sysarg, v.type, id, count, quality, strong, bind, guid, logId, logStr, wayId,circle,sex,job) ~= true then
				local actorId = Actor.getIntProperty(sysarg, PROP_ENTITY_ID)
				System.trace(string.format("Error:Give award error! actorId = %d, logId = %d, give type = %d, id = %d, count = %d, giveAwardCount = %d", actorId, logId, v.type, id, count, giveCount))
								
				--如果已经给了一部分奖励，避免玩家刷奖励，则返回 true，然后手工处理
				return (giveCount ~= 0) and true or false
			end
			
			if v.type ==46 then 
				Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)获得> <(c0xFF0090ff)%s%s>", count, "护符碎片"), 1);
			elseif  v.type ==45 then 
				Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)获得> <(c0xFF0090ff)%s%s>", count, "护盾碎片"), 1);
			elseif  v.type ==47 then 
				Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)获得> <(c0xFF0090ff)%s%s>", count, "宝石结晶"), 1);
			elseif  v.type ==42 then 
				Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)获得> <(c0xFF0090ff)%s%s>", count, "圣珠结晶"), 1);
			elseif  v.type ==11 then 
				Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)获得> <(c0xFF0090ff)%s%s>", count, "成就值"), 1);
			elseif  v.type ==67 then 
				Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)获得> <(c0xFF0090ff)%s%s>", count, "军魂值"), 1);
			elseif  v.type ==68 then 
				Actor.sendTipmsg(sysarg, string.format("<(c0xFFb90303)获得> <(c0xFF0090ff)%s%s>", count, "斗笠精华"), 1);				
			end
			
			giveCount = giveCount + 1			
			
		end		
				
		return true
	end,
	
	-- 给予奖励（包含了检查） awards:奖励表 logId:日志ID logStr:日志表述
	Give = function (sysarg, awards, logId, logStr, wayId)
		if not awards then return false end	
		if Awards.CheckBagGridCount(sysarg, awards) ~= true then return false end
		
		return Awards.GiveNoCheck(sysarg, awards, logId, logStr, wayId)
	end,

	-- 充值领奖专用：调用者须把 progress 保存在角色静态变量中。
	-- 保持 Give/GiveNoCheck 的旧语义；这里只把单个明确成功的项目记为完成。
	-- 原生接口与静态变量保存并非原子事务；抛出异常或遗留进行中标记时停止自动重试。
	PrepareTracked = function (awards, progress)
		if type(progress) ~= "table" then return false, "invalid_progress" end
		if progress.items == nil then
			if type(awards) ~= "table" or #awards == 0 then return false, "empty_awards" end
			-- 冻结清单，避免配置调整后用旧完成序号跳过新物品或重复发放旧物品。
			local function copyValue(value)
				if type(value) ~= "table" then
					local valueType = type(value)
					if valueType ~= "number" and valueType ~= "string" and valueType ~= "boolean" and valueType ~= "nil" then
						error("tracked reward contains a non-persistent value")
					end
					return value
				end
				local result = {}
				for key, item in pairs(value) do result[key] = copyValue(item) end
				return result
			end
			local ok, items = pcall(copyValue, awards)
			if not ok then return false, "invalid_awards" end
			for index = 1, #items do
				local item = items[index]
				if type(item) ~= "table" or type(item.type) ~= "number" or type(item.count) ~= "number" or math.floor(item.count) <= 0 then
					return false, "invalid_awards"
				end
				if item.bind == nil then item.bind = 1 end
			end
			progress.items = items
			progress.done = {}
		end
		return true
	end,

	GiveTracked = function (sysarg, awards, progress, logId, logStr, wayId)
		if type(progress) ~= "table" then return false, "invalid_progress" end
		if progress.needsReview or progress.inFlight ~= nil then
			progress.needsReview = true
			Actor.sendTipmsg(sysarg, "这笔奖励需要核对发放记录，请联系客服；已发项目不会自动重发", ttFlyTip)
			return false, "needs_review"
		end
		local prepared, reason = Awards.PrepareTracked(awards, progress)
		if not prepared then return false, reason end
		if progress.done == nil then progress.done = {} end

		local remaining = {}
		for index, item in ipairs(progress.items) do
			if progress.done[index] ~= true then remaining[#remaining + 1] = item end
		end
		if #remaining == 0 then return true end
		if Awards.CheckBagGridCount(sysarg, remaining) ~= true then return false, "bag_full" end

		for index, item in ipairs(progress.items) do
			if progress.done[index] ~= true then
				progress.inFlight = index
				local ok, result = pcall(Awards.GiveNoCheck, sysarg, {item}, logId, logStr, wayId)
				if not ok then
					progress.needsReview = true
					System.trace("Tracked reward needs review: logId="..tostring(logId)..", item="..index..", error="..tostring(result))
					Actor.sendTipmsg(sysarg, "奖励发放异常，请联系客服核对；这笔奖励不会自动重复发放", ttFlyTip)
					return false, "needs_review"
				end
				if result ~= true then
					-- 这两种旧奖励会先修改 Lua 属性，原生接口失败时不能自动重试。
					if item.type == 67 or item.type == 68 then
						progress.needsReview = true
						Actor.sendTipmsg(sysarg, "奖励需要核对发放记录，请联系客服", ttFlyTip)
						return false, "needs_review"
					end
					Actor.sendTipmsg(sysarg, "奖励尚未全部发放，请稍后重试；已成功发放的项目不会重复领取", ttFlyTip)
					progress.inFlight = nil
					return false, "grant_failed"
				end
				progress.done[index] = true
				progress.inFlight = nil
			end
		end
		return true
	end,
}

--[[
	消耗与奖励类型定义与项意义:
enum tagAwardType
{
	qatEquipment=0,             //物品或者装备 id:物品ID count:物品数量 quality:物品品质 strong:强化等级 bind:绑定状态 param:物品指针 
	qatXiuwei = 1,	            //修为	count:修为值
	qatExp = 2,                	//角色经验值 count:经验值 param:如果是任务，这个就填写任务的ID，其他的话填关键的有意义的参数，如果没有就填写0
	qatGuildContribution = 3,	//帮派贡献值 count:帮派贡献值
	qatZYContribution = 4,		//阵营贡献 count:阵营贡献值
	qatBindMoney = 5,           //绑定银两 count:绑定银两值
	qatMoney = 6,	            //银两	count:银两
	qatBindYb = 7,	            //绑定元宝 count:绑定元宝
	qatTitle = 8,	            //称谓 count:称谓ID
	qatSkill = 9,	            //技能 count:技能ID param:技能等级
	qatZhanhun = 10,	        //战魂 count:战魂值
	qatAchievePoint =11,        //成就点 count:成就点
	qatRenown=12,                //声望  count:声望值
	qatPet =13,                  //奖励宠物 
	qatActivity = 14,			//奖励活跃度 count:奖励活跃度
	qatYuanbao =15,              //元宝 count:元宝
	qatGuildFr = 16,			//繁荣度 count:奖励繁荣度值
	qatGuildYs = 17,			//玥石 count:帮派玥石值
	qatXPVal=18,				// XP值	 count:XP值
	qatCombatScore = 19,		//竞技积分 count:竞技积分值
	qatAddExp = 20,				//按经验配置表加经验 id:奖励库ID count:普通加成率 quality:vip加成率 加成率使用以1000为基数的整形 即n/1000
	qatHonor = 21,				//荣誉  (暂时不用)
	qatCircleSoul = 22,			//转生灵魄  转生修为
	qatAnger = 23,				//怒气
	qatBoss =24,                //boss
	qatUpgrade = 25,			//玩家升级
	qatPetUpgrade = 26,			//宝宝升级
	qatGuildCoin = 27,			//行会资金
	qatIntimacy = 28,			//师徒亲密度
	qatAwardCharm = 29,			// 魅力/帅气
	qatAwardHeroExp= 30,		//增加英雄的经验
	qatHeroUpgrade = 31,		//增加出战英雄等级
	qatRideStarIndex = 32,		//增加坐骑星级
	qatMagicBead = 33,			//魔珠
	qatMagicPower = 34,			//灵力
	qatZhanXun = 35,			//战勋
	qatEnergy = 36,				//能量
	qatCrystal = 37,			//魔晶值
	qatSpiritValue = 38,		//战功值
	qatGuildScore = 39,			//帮派积分值
	qatWardrobeExp = 40,		//衣橱经验
	qatHonorVaule = 41,			//荣誉值 功勋
	qatMeritVaule = 42,			//声望值(灵珠碎片) 圣珠结晶
	qatPlumage = 44,			//精羽毛 (羽毛)
	qatSpiritShield = 45,		//盾灵 护盾结晶
	qatFuSoulValue = 46,		//符魄值 护符碎片
	qatDiamond = 47,			//钻晶 宝石结晶
	qatRingCrystal = 48,		//特戒结晶
	qatAlchemy = 49,			//炼金值  (暂时不用)
	qatKingKongStone = 50,		//金刚石  (暂时不用)
	qatRealDollars = 51,		//真元值 战神灵力
	qatItemSex = 52,			//跟据性别奖励物品 {男,女}
	qatItemJob = 53,			//跟据职业奖励物品 {战士, 法师, 道士}
	qatItemSexJob = 54,			//跟据性别和职业奖励物品 { 男:{战士, 法师, 道士}, 女:{战士, 法师, 道士}}
	qatZodiacAura = 56,			//灵宠值
	qatInnerExp = 57,			//内功经验
	qatStrongStone = 58,		//强化石(前端占位)
	qatBossScore = 59,			//boss积分(前端占位)
	qatFBTeleportBook = 60,		//副本传送卷(前端占位)
	qatRose = 61,				//玫瑰(前端占位)
	qatGoldDebris = 62,			//碎金(前端占位)
	qatMaterial = 63,			//各种材料(前端占位)
	qatAllEquip = 64,			//各类装备(前端占位)
	qatXiaoFeiXie = 65,			//小飞鞋(前端占位)	
	qaJunGuZhi =66,				//军鼓值
	qaMianJuZhi=67,				//斗笠值
	qaMianJuZhi=68,				//面具值
	qaYuanguPoint = 69,			//远古积分
	qaLingliValue = 70,			//灵力值
	qaSoulValue = 71,			//注魂值
	73, 						//仙钻资源 var.xianzuan
	qatCustomize = 127,		    //自定义奖励

};

--]]
