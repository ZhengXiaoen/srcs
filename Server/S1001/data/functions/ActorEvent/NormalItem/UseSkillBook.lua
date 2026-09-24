--lua script
--使用技能书学习技能

--#include "data\config\item\SkillBookItemData.lua" once
--#include "data\functions\Activity\Common\Consumes.lua" once

--[[
--添加buff的物品
--sysarg:实体的指针
--itemidx: 物品的ID
--itemPtr: 物品的指针
--ItemTable: 配置的参数列表 
--]]
function UseBookLearnSkill(sysarg,itemidx,itemPtr,ItemTable)
	if(Actor.getItemCount(sysarg,ItemTable.item_id) == 0) then
		Actor.sendTipmsg( sysarg,Lang.ScriptTips.x00013,ttTipmsgWindow )
		return
	end
	
	local nJop = Actor.getIntProperty(sysarg, PROP_ACTOR_VOCATION)
	
	if nJop == 0 or nJop == ItemTable.jop_id then
		local skillLevel = Actor.getSkillLevel(sysarg,ItemTable.skill_id)
		if skillLevel < ItemTable.skill_Level then
			if skillLevel ~= (ItemTable.skill_Level - 1) then
				Actor.sendTipmsg( sysarg,Lang.ScriptTips.x00201,ttFlyTip )
				return
			end
            
			local nResult = Actor.learnSkill(sysarg,ItemTable.skill_id, ItemTable.skill_Level)

			if nResult == 0 and ItemTable.needConsume == true then
				Actor.removeItemByPtr(sysarg,itemPtr,1,true,"UseBookLearnSkill",5)
			end
			--如果是强化召唤术- 删除召唤术技能
            if ItemTable.delskill ~= nil then
                Actor.delSkill(sysarg,ItemTable.delskill)
            end
			if nResult == 0 then
				local msg = string.format(Lang.ScriptTips.x00213, Actor.getName(sysarg), System.getSkillNameById(ItemTable.skill_id), ItemTable.skill_Level)	
				System.broadcastTipmsg(msg,ttScreenCenterBigNotice)
			end
		else
			Actor.sendTipmsg( sysarg,Lang.ScriptTips.x00199,ttFlyTip )
			return
		end
	else
		Actor.sendTipmsg( sysarg,Lang.ScriptTips.x00198,ttFlyTip )
		return
	end
end

function AddItemBufferInit(sysarg)
  for i = 1,table.getn(SkillBoolConfig) do
	local x = SkillBoolConfig[i]
	GlobalItemFn[x.item_id] = { func = UseBookLearnSkill, params = x }
  end
end

table.insert(InitFnTable,AddItemBufferInit)