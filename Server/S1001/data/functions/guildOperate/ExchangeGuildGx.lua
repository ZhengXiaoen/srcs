--lua script
--帮派贡献兑换
function GuildExchangeGx( sysarg, args )
	local itemId = args[2]
	local nCount = args[3]
	
	local nIndex = 0
	for i=1,table.getn(GuildGxItemConfig.items) do
		if GuildGxItemConfig.items[i].nItemId == itemId then
			nIndex = i
			break
		end
	end

	if nIndex <= 0 then
		print("guild shop no item:"..itemId)
		return
	end
	
	local nShopConfig = GuildGxItemConfig.items[nIndex]

	local nGuild = Actor.getIntProperty( sysarg, PROP_ACTOR_GUILD_ID)
	if nGuild <= 0 then return end

	local gLevel = System.getGuildbuildingLev(nGuild,2)
	if gLevel <=0 or gLevel > table.getn(GuildMainHall.moonBox) then return end

	--需要判断行会商店的等级是否满足
	if gLevel < nShopConfig.needLev then
		Actor.sendTipmsg(sysarg,Lang.GuildLang.jz0009,ttFlyTip)
		return
	end

	local mGx = Actor.getGuildScore(sysarg)

	--帮派贡献不够
	if mGx < nShopConfig.price then
		Actor.sendTipmsg(sysarg,Lang.GuildLang.jz0010,ttFlyTip)
		return
	end

	--背包不够
	local nGridCount= Item.getBagEmptyGridCount(sysarg)
	local nNeedGrid = Item.getAddItemNeedGridCount(sysarg,itemId,nCount,nShopConfig.quality,nShopConfig.strong)
	if(nNeedGrid > nGridCount) then
		local tipmsg= string.format(Lang.ScriptTips.x00074,nNeedGrid) --通知用户，需要空出多少个空格
		Actor.sendTipmsg( sysarg, tipmsg,ttFlyTip )
		return
	end

	Actor.addItem(sysarg,nShopConfig.nItemId,nShopConfig.quality,nShopConfig.strong,nCount,nShopConfig.bind,0,Lang.GuildLang.jz0011,901)

	Actor.changeGuildScore(sysarg,-nShopConfig.price)
end