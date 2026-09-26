--lua script
--处理宠物消耗相关的操作

--lua script
--处理宠物消耗相关的操作

--#include "data\config\ActorEvent\HeroEventCfg.lua" once			--英雄配置
--#include "data\config\ActorEvent\HeroExerciseCfg.lua" once	-- 英雄练体配置
--#include "data\config\hero\HeroCircle.lua" once --宠物的转生配置
--#include "data\config\hero\HeroSkill.lua" once --宠物技能配置
--#include "data\config\hero\HeroSkillLevelupConsume.lua" once --宠物技能等级升级的消耗



--#include "data\functions\HeroOperate\OperateFunctioins.lua" once --公告的函数
--#include "data\functions\HeroOperate\HeroCircle.lua" once --宠物转生
--#include "data\functions\HeroOperate\HeroLearnSkill.lua" once --宠物技能等级升级
--#include "data\config\equipSynthesis\HeroEquipSynthesisConfig.lua" once			--英雄装备合成配置
--#include "data\functions\FunctionGift\FunctionGift.lua" once



HeroOpFuncList = {}

function SendUplevelResult(sysarg, nSysCmd, eventId, ret)
	local npack = DataPack.allocPacket(sysarg, nSysCmd, eventId)
	if not npack then return end
	DataPack.writeByte(npack, ret)
	DataPack.flush(npack)
end

EventCallDispatcher.HandlerHeroOp = function (sysarg, args)
	if args[1] == nil then return end
	local func = HeroOpFuncList[args[1]]
	local ret = false;
	if func ~= nil then
		ret = func(sysarg, args);
	end

	if ret == false then
		if args[1] == 2 then
			SendUplevelResult(sysarg, 44, 26, 0)
		end

		if args[1] == 5 then
			SendUplevelResult(sysarg, 44, 28, 0);
		end
	end

	return ret;
end



HeroGetNextHeroInfo = function(sysarg,args)
	local btType = args;
	if btType == 1 then
		-- 等级
		local herolevel = Hero.getHeroLevel(sysarg)
		--if herolevel >= HeroListConfig.maxlev then
		--	return tonumber(0);
		--end

		local nextcfg = HeroListConfig.upgradecfg[herolevel + 1]
		if nextcfg == nil then
			if herolevel > 0 then -- 如果到了最高级则返回最高级(只是用到查看属性)
				nextcfg = HeroListConfig.upgradecfg[herolevel]
			end
		end

		if nextcfg == nil then return 0 end

		return tonumber(nextcfg.currid)
	else
		-- 练体等级
		local exerciseLevel = Hero.getHeroExerciseLevel(sysarg);
		if exerciseLevel >= HeroExerciseCfg.maxlev then
			return tonumber(0);
		end
		return tonumber(exerciseLevel + 1);
	end
end

--激活英雄
HeroOpFuncList[1] = function (sysarg,args)
	local actorlevel = Actor.getUIntProperty(sysarg, PROP_CREATURE_LEVEL)
	if actorlevel < HeroListConfig.actorLV then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.hero004, ttFlyTip);
		return false;
	end

	local herolevel = Hero.getHeroLevel(sysarg)
	if herolevel ~= nil and herolevel > 0 then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.hero003, ttFlyTip);
		return false;
	end

	local upgradecfg = HeroListConfig.upgradecfg[1];
	local ret = Hero.addHero(sysarg, 0, upgradecfg.currid, upgradecfg.ai, 1);
	if ret == 0 then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.hero004, ttFlyTip);
		return false;
	end

	Hero.setHeroExerciseLevel(sysarg, 1)			-- 战将练体等级
	--Hero.setHeroMana(sysarg, 0)							-- 战将灵力

	local npack = DataPack.allocPacket(sysarg, 44, 23)
	if not npack then return false; end
	DataPack.writeByte(npack, ret)
	DataPack.flush(npack)

	Hero.SendHeroProperty(sysarg, 0);
	local func = HeroOpFuncList[3];
	func(sysarg, args);
    OnCompleteGiftTask(sysarg,0)
	return true;
end

--提升英雄等级
HeroOpFuncList[2] = function (sysarg, args)
	local herolevel = Hero.getHeroLevel(sysarg);
	if not herolevel or herolevel <= 0 then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.hero008, ttFlyTip);
		return false;
	end

	if herolevel >= HeroListConfig.maxlev then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.hero001, ttFlyTip);
		return false;
	end

	local upgradecfg = HeroListConfig.upgradecfg[herolevel];
	if not upgradecfg then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.COM0002, ttFlyTip);
		return false;
	end

	local nextupgradecfg = HeroListConfig.upgradecfg[herolevel + 1];
	if not nextupgradecfg then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.hero001, ttFlyTip);
		return false;
	end
	
	--改为两种钱混合在一起用
	local moneyCount0 = Actor.getMoneyCount(sysarg, 0)
	local moneyCount1 = Actor.getMoneyCount(sysarg, 1)
	if moneyCount0+moneyCount1 < upgradecfg.value then  --两种钱加起来不够的
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.hero009, ttFlyTip)
		return false
	end
	
	if moneyCount0< upgradecfg.value then  --绑定的不够
		if moneyCount0~= 0 then 
			if Actor.changeMoney(sysarg, 0, -moneyCount0, GameLog.clHeroUpgrade, "提升战将等级") == false then
				return 
			end
			if Actor.changeMoney(sysarg, 1, -(upgradecfg.value-moneyCount0), GameLog.clHeroUpgrade, "提升战将等级") == false then
				return 
			end
		else  --完全没有绑定金币的
			if Actor.changeMoney(sysarg, 1, -upgradecfg.value, GameLog.clHeroUpgrade, "提升战将等级") == false then
				return 
			end
		end
		
	else --绑定的足够
		if Actor.changeMoney(sysarg, 0, -upgradecfg.value, GameLog.clHeroUpgrade, "提升战将等级") == false then
			return 
		end
	end

	--if Actor.changeMoney(sysarg, mtBindCoin, -upgradecfg.value, GameLog.clHeroUpgrade, "提升战将等级") == false then
	--	if Actor.changeMoney(sysarg, 1, -upgradecfg.value, GameLog.clHeroUpgrade, "提升战将等级") == false then
	--		Actor.sendTipmsg(sysarg, Lang.ScriptTips.hero009, ttFlyTip);
	--		return false;
	--	end
	--end

	local toLevel = herolevel + 1
	if Hero.SetHeroLevel(sysarg, herolevel + 1, nextupgradecfg.currid, nextupgradecfg.ai)==1 then  --战将升级成功，提升等级
		System.sendCommonLog(GameLog.clHeroUpgrade,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,toLevel.."提升战将等级")
	end
	
	--全服公告
	--System.broadcastTipmsg(string.format(Lang.ScriptTips.hero005, Actor.getName(sysarg), herolevel + 1), ttScreenCenter+ttChatWindow)
	local heroName = Hero.getHeroName(sysarg,nextupgradecfg.currid)	
	Actor.sendTipmsg(sysarg, Lang.ScriptTips.hero006, ttFlyTip)
	
	if toLevel == 5 or toLevel == 10 or toLevel == 15 or toLevel >= 20 then
		System.broadcastTipmsg( string.format("恭喜<(n%s)>玩家将战将提升至<%s>!<前往提升/@@showWin,118>", Actor.getName(sysarg), heroName), 128 )
	end

	SendUplevelResult(sysarg, 44, 26, 1);

	local func = HeroOpFuncList[3];
	func(sysarg, args);
	return true;
end


-- 升级练体
HeroOpFuncList[5] = function (sysarg, args)
	local level = Hero.getHeroExerciseLevel(sysarg);
	if level >= HeroExerciseCfg.maxlev then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.hero010, ttFlyTip);
		return false;
	end

	local nextupgradecfg = HeroExerciseCfg.upgradecfg[level];
	if not nextupgradecfg then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.COM0002, ttFlyTip);
		return false;
	end

	local nCurrMana = Hero.getHeroMana(sysarg);
	--print(nCurrMana,nextupgradecfg.mana)
	if nCurrMana < nextupgradecfg.mana then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.hero011, ttFlyTip);
		return false;
	end

	nCurrMana = nCurrMana - nextupgradecfg.mana;
	level = level + 1;
	Hero.setHeroMana(sysarg, nCurrMana);
	Hero.setHeroExerciseLevel(sysarg, level);
	Hero.SendHeroProperty(sysarg, 0);
	
	System.sendCommonLog(LogIds.zhanJiangLianTiShengji,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),0,0,0,level.."战将炼体升级")
	
	Actor.sendTipmsg(sysarg, string.format(Lang.ScriptTips.zf124, "战将练体", level.."级"), ttFlyTip);
	
	if level == 5 or level == 10 or level == 15 or level >= 20 then
		System.broadcastTipmsg( string.format("恭喜<(n%s)>玩家将战将练体提升至%d级！<前往提升/@@showWin,118>", Actor.getName(sysarg), level), 128 )
	end
	
	SendUplevelResult(sysarg, 44, 28, 1);
	local func = HeroOpFuncList[3];
	func(sysarg, args);
	return true;
end

--获取英雄经验
HeroOpFuncList[3] = function (sysarg,args)
    if System.isCrossServer() == true then return end
	local npack = DataPack.allocPacket(sysarg, 44, 24)
	if not npack then return false; end

	local herolevel = Hero.getHeroLevel(sysarg);
	if not herolevel or herolevel <= 0 then
		return false;
	end

	local exerciseLevel = Hero.getHeroExerciseLevel(sysarg);

	local nCurrMana = Hero.getHeroMana(sysarg);

	local nMaxMana = 0;
	local upgradecfg = HeroExerciseCfg.upgradecfg[exerciseLevel];
	if upgradecfg ~= nil then
		nMaxMana = upgradecfg.mana;
	end

	local nMaxMoney = 0;
	local levelcfg = HeroListConfig.upgradecfg[herolevel];
	if levelcfg ~= nil then
		nMaxMoney = levelcfg.value;
	end

	DataPack.writeByte(npack, herolevel)
	DataPack.writeByte(npack, exerciseLevel)
	DataPack.writeInt(npack, nCurrMana)
	DataPack.writeInt(npack, nMaxMana)
	DataPack.writeInt(npack, nMaxMoney)
	DataPack.writeByte(npack, #HeroListConfig.upgradecfg)
	DataPack.writeByte(npack, HeroExerciseCfg.maxlev)
	DataPack.flush(npack)
	return true;
end
		--英雄装备合成
HeroOpFuncList[4] = function (sysarg,args)

	local nType = args[2] -- 兑换的类型
	local nIndex = args[3] --兑换物品的索引
	local nItemId = args[4] --要兑换的ID
	--print("装备合成")
--	Actor.openquestarrowsguide(sysarg,"降妖除魔")
	local nJob = Actor.getIntProperty(sysarg, PROP_ACTOR_VOCATION)

	--print(nType,nIndex,nItemId)
	--判断参数是否正确
	if nIndex < 0 and nIndex > 5 then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.COM0001,ttFlyTip)
		return false;
	end

	--判断配置是否存在
	local config = HeroEquipSynthesisConfig[nType]
	if config == nil then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.COM0002, ttFlyTip)
		return false;
	end

	local synthesisCfg = config.synthesis
	if synthesisCfg == nil then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.COM0002, ttFlyTip)
		return false;
	end

	local award = synthesisCfg[nIndex].award

	if award.id ~= nItemId then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.COM0001, ttFlyTip)
		return false;
	end

	local consume = synthesisCfg[nIndex].consume

	local consumeData = {}
	local ret = CheckAllConsume(sysarg, false, consume, true, consumeData)
	if ret == false or not ret then
		return false;
	end

	--扣费
	ret = DeductOneConsume(sysarg, false, consume[2], GameLog.cNewEquipSynthesisConsume)
	if ret == false or not ret then
		return false;
	end

	local nStrong = 0
	local nBlood = 0
	local nStrongLimit = 12
	local nSuperLevel = 0
	for i = 1,consume[1].count do
		local nMaterialItem = Item.getBagItemPtrById(sysarg,consume[1].id)
		if nMaterialItem then
			if Item.getItemProperty(sysarg,nMaterialItem,Item.ipItemStrong) > nStrong then
				nStrong = Item.getItemProperty(sysarg,nMaterialItem,Item.ipItemStrong)
				nStrongLimit = Item.getItemProperty(sysarg,nMaterialItem,Item.ipItemStrongLimit)
			end
			if Item.getItemProperty(sysarg,nMaterialItem,Item.ipItemAppraisal) > nBlood then
				nBlood = Item.getItemProperty(sysarg,nMaterialItem,Item.ipItemAppraisal)
			end
			if Item.getItemProperty(sysarg,nMaterialItem,Item.ipItemSuperAttrLevel) > nSuperLevel then
				nSuperLevel = Item.getItemProperty(sysarg,nMaterialItem,Item.ipItemSuperAttrLevel)
			end

			if Actor.removeItemByPtr(sysarg,nMaterialItem,1) ~= 1 then
				print("removePtr error")
				return false;
			end
		end
	end

	local nNewItem = Item.createItem(award.id,award.count,nStrong,0,award.bind,0)
	Item.addItem(sysarg,nNewItem,"合成面板锻造",53)
	Item.setItemProperty(sysarg, nNewItem, Item.ipItemStrongLimit, nStrongLimit)
	Item.setItemProperty(sysarg, nNewItem, Item.ipItemAppraisal, nBlood)
	Item.setItemProperty(sysarg, nNewItem, Item.ipItemSuperAttrLevel, nSuperLevel)

	Actor.sendTipmsg( sysarg,Lang.ScriptTips.zf650,ttFlyTip)
	if config.notice == false then return false end
	local name = Actor.getName(sysarg)
	local itemName = Item.getItemName(consume[1].id)
	local successName = Item.getItemName(award.id)
	local result = string.format(Lang.ScriptTips.zf651,name,itemName,successName)
	System.broadcastTipmsg(result,2048)
	return true;
end

HeroOpFuncList[6] = function(sysarg, args)
	-- 扣除附体令
	local removeCount = Actor.removeItem(sysarg, HeroListConfig.mergeid, 1,-1,-1,-1, "战将附体消耗", LogIds.HeroMergeConsume);
	if removeCount == 0 then
		Actor.sendTipmsg(sysarg, Lang.ScriptTips.hero014, ttFlyTip);
		return false;
	end
	return true;
end

EventCallDispatcher.registerEventCall(BaseTypes.ActorEventId.aeHero, EventCallDispatcher.HandlerHeroOp)