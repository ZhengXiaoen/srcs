
--实体属性计算回调
--参数说明
--sysarg 实体归属玩家
--petPtr 宠物实体指针
--nMaxHp 最大血量增加
--nMaxMp 最大魔法增加
--nPhysicalAttackMin 最小物攻增加
--nPhysicalAttackMax 最大物攻增加
--nMagicAttackMin  最小魔攻增加
--nMagicAttackMax  最大魔攻增加
--nTaoAttackMin  最小道攻增加
--nTaoAttackMax 最大道攻增加
--nDefenseMin 最小物理防御
--nDefenseMax 最大物理防御
--nMagixDefenseMin 最小魔法防御
--nMacgicDefenseMax 最大魔法防御
--nMoveSpeed 移动速度
--nAttackSpeed  攻击速度
function OnPetRerestProperty(sysarg,petPtr,nMaxHp,nMaxMp,nPhysicalAttackMin,nPhysicalAttackMax,nMagicAttackMin,nMagicAttackMax,nTaoAttackMin,nTaoAttackMax,nDefenseMin,nDefenseMax,nMagixDefenseMin,nMacgicDefenseMax,nMoveSpeed,nAttackSpeed)

    --否是道士宝宝
    if Pet.isTao(petPtr) and sysarg ~= nil  and petPtr ~= nil then

		local EffectIntegralWeapons = {

						{id = 3644, type = 3, data = 10, },--灵兽·龙纹道意Lv1
						{id = 3645, type = 3, data = 20, },--灵兽·龙纹道意Lv2
						{id = 3646, type = 3, data = 30, },--灵兽·龙纹道意Lv3
						{id = 3647, type = 3, data = 40, },--灵兽·龙纹道意Lv4
						{id = 3648, type = 3, data = 50, },--灵兽·龙纹道意LvMax
						{id = 3649, type = 3, data = 60, },--灵兽·圣界逍遥Lv1
						{id = 3650, type = 3, data = 70, },--灵兽·圣界逍遥Lv2
						{id = 3651, type = 3, data = 80, },--灵兽·圣界逍遥Lv3
						{id = 3652, type = 3, data = 90, },--灵兽·圣界逍遥Lv4
						{id = 3653, type = 3, data = 100, },--灵兽·圣界逍遥LvMax

			};
            local nTAKdouble = 1;
            local sTaoStrong = "";
		local itemPtr = Item.getEquipByPos(sysarg, 49);
		if itemPtr then
			local ItemID = Item.getItemId(itemPtr);
			for i = 1,#EffectIntegralWeapons do
                if EffectIntegralWeapons[i].id == ItemID and EffectIntegralWeapons[i].type == 3 then
                    nTAKdouble = 1 + EffectIntegralWeapons[i].data / 100;
                    Actor.sendTipmsg(sysarg, string.format("<(c0xFF00FF00)灵兽:> <(c0xFFFFFF00)召唤强度提升百分之%s>", EffectIntegralWeapons[i].data), 1);
                    sTaoStrong = string.format("(＋%s％)", EffectIntegralWeapons[i].data);
                    break;
                end
            end
        end

           --装备属性强化点
           local nTaoStrong = Actor.getEquipTaoStrong(sysarg)
           -- 加上 坐骑装备强化属性点
           nTaoStrong = nTaoStrong + Actor.getHorseTaoStrong(sysarg)
		   
		   --加上翅膀装备的召唤强度
		   local swingEquipment = Actor.getUIntProperty(sysarg, PROP_ACTOR_SWINGEQUITMNET)
		   for i=1,4 do 	
				local zhaoHuanQiangDu = System.getIntByte(swingEquipment, i - 1) > 0 and 6 or 0
				nTaoStrong = nTaoStrong + zhaoHuanQiangDu
		   end
		   
		   
		   
		   
		   
           
           local nAttackMin = nTaoStrong * (100 * nTAKdouble)
           local nAttackMax = nTaoStrong * (200 * nTAKdouble)
           local nHp = nTaoStrong * (50000 * nTAKdouble)

           nMaxHp = nMaxHp + nHp
           nPhysicalAttackMin = nPhysicalAttackMin + nAttackMin
           nPhysicalAttackMax = nPhysicalAttackMax + nAttackMax
           nMagicAttackMin = nMagicAttackMin + nAttackMin
           nMagicAttackMax = nMagicAttackMax + nAttackMax
           nTaoAttackMin = nTaoAttackMin + nAttackMin
           nTaoAttackMax = nTaoAttackMax + nAttackMax

           --强化召唤术的情况下
           local nHpRate = 5
            nMaxHp = nMaxHp + Actor.getIntProperty(sysarg,PROP_CREATURE_MAXHP) * nHpRate
           local nAttackRate = 0.3
           local nMonsterId = Actor.getIntProperty(petPtr,PROP_ENTITY_ID)
           if nMonsterId ~= 375 then

                nAttackMin = Actor.getIntProperty(sysarg,PROP_CREATURE_WIZARD_ATTACK_MIN) * nAttackRate
                nAttackMax = Actor.getIntProperty(sysarg,PROP_CREATURE_WIZARD_ATTACK_MAX) * nAttackRate
            
                nPhysicalAttackMin = nPhysicalAttackMin + nAttackMin
                nPhysicalAttackMax = nPhysicalAttackMax + nAttackMax
                nMagicAttackMin = nMagicAttackMin + nAttackMin
                nMagicAttackMax = nMagicAttackMax + nAttackMax
                nTaoAttackMin = nTaoAttackMin + nAttackMin
                nTaoAttackMax = nTaoAttackMax + nAttackMax
           end

           local monId = Actor.getIntProperty(petPtr,PROP_ENTITY_ID);
           local monName = System.getMonsterNameById(monId);
           
           --PROP_CREATURE_LUCK 这个值怪物不会有，拿来做标记，防止每次重新计算属性的时候给满血
           if Actor.getIntProperty(petPtr,PROP_CREATURE_LUCK) == 0 then
                   local bbstr = string.format([[
<(c0xFFff5a00)总血量:> <(c0xFF00ff00)%s>
<(c0xFFff5a00)总攻击:> <(c0xFF00ff00)%s-%s>
<(c0xFFff5a00)召唤强度:> <(c0xFF00ff00)%s%s>
<(c0xFFff5a00)强度加血:> <(c0xFF00ff00)%s>
<(c0xFFff5a00)强度加攻:> <(c0xFF00ff00)%s-%s>
]], math.modf(nMaxHp), math.modf(nPhysicalAttackMin), math.modf(nPhysicalAttackMax), nTaoStrong, sTaoStrong, math.modf(nTaoStrong * (2000 * nTAKdouble)), math.modf(nTaoStrong * (100 * nTAKdouble)), math.modf(nTaoStrong * (200 * nTAKdouble)) );
           Actor.sendTipmsg(sysarg, bbstr , 1)
          
           
           

           end
   

    end
    return nMaxHp,nMaxMp,nPhysicalAttackMin,nPhysicalAttackMax,nMagicAttackMin,nMagicAttackMax,nTaoAttackMin,nTaoAttackMax,nDefenseMin,nDefenseMax,nMagixDefenseMin,nMacgicDefenseMax
end

--实体属性计算回调
--参数说明
--sysarg 实体归属玩家
--heroPtr 英雄实体指针
--nMaxHp 最大血量增加
--nMaxMp 最大魔法增加
--nPhysicalAttackMin 最小物攻增加
--nPhysicalAttackMax 最大物攻增加
--nMagicAttackMin  最小魔攻增加
--nMagicAttackMax  最大魔攻增加
--nTaoAttackMin  最小道攻增加
--nTaoAttackMax 最大道攻增加
--nDefenseMin 最小物理防御
--nDefenseMax 最大物理防御
--nMagixDefenseMin 最小魔法防御
--nMacgicDefenseMax 最大魔法防御
--nMoveSpeed 移动速度
--nAttackSpeed  攻击速度
function OnHeroRerestProperty(sysarg,heroPtr,nMaxHp,nMaxMp,nPhysicalAttackMin,nPhysicalAttackMax,nMagicAttackMin,nMagicAttackMax,nTaoAttackMin,nTaoAttackMax,nDefenseMin,nDefenseMax,nMagixDefenseMin,nMacgicDefenseMax,nMoveSpeed,nAttackSpeed)

    return nMaxHp,nMaxMp,nPhysicalAttackMin,nPhysicalAttackMax,nMagicAttackMin,nMagicAttackMax,nTaoAttackMin,nTaoAttackMax,nDefenseMin,nDefenseMax,nMagixDefenseMin,nMacgicDefenseMax
end