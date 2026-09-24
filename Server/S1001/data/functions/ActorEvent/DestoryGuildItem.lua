--403-411  八荒
--412-420 九宫
--421-429 十方 
function DestoryGuildItemInit(sysarg)
	local e = "<title/行会仓库摧毁>\\  <(c0xFFeabc78)您可以通过这里来操作您行会仓库内的装备销毁.>\\\\<(idecoLine#330)>\\\\";
	e = e.."	<一键销毁行会仓库所有 八荒装备("..CalTheCount(sysarg,1)..")/@OnDestoryGuildItem,1>\\\\"
	e = e.."	<一键销毁行会仓库所有 九宫装备("..CalTheCount(sysarg,2)..")/@OnDestoryGuildItem,2>\\\\"
	e = e.."	<一键销毁行会仓库所有 十方装备("..CalTheCount(sysarg,3)..")/@OnDestoryGuildItem,3>\\\\"
	e = e.."	<一键销毁行会仓库所有 60级装备("..CalTheCount(sysarg,4)..")/@OnDestoryGuildItem,4>\\\\"
	e = e.."	<一键销毁行会仓库所有 70级装备("..CalTheCount(sysarg,5)..")/@OnDestoryGuildItem,5>\\\\"
	e = e.."	<一键销毁行会仓库所有 80级装备("..CalTheCount(sysarg,6)..")/@OnDestoryGuildItem,6>\\\\"
	return e
end

function OnDestoryGuildItem(sysarg,index)
	local DestoyData = 
	{
		{403, 411, "八荒装备"},
		{412, 420, "九宫装备"},
		{421, 429, "十方装备"},
		{5736, 5762, "60级装备"},
		{5763, 5789, "70级装备"},
		{5790, 5816, "80级装备"},
	}
	--判断是否是会长
	local nGuildID = Actor.getIntProperty(sysarg,PROP_ACTOR_GUILD_ID)
	local nActorID = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
	if Guild.getGuildLeaderId(nGuildID) ~= nActorID then
        Actor.sendTipmsg(sysarg,"您不是行会会长，无法摧毁物品",ttFlyTip)
        return
    end
	
	--使用c++的接口摧毁
	index = tonumber(index)
    local nCoin = 0
	for i=DestoyData[index][1],DestoyData[index][2] do
		nCoin = nCoin + Guild.DeleteDepotItemById(sysarg,i,false)
	end
    Guild.NotifyUpdateDepot(sysarg)
    if nCoin > 0 then
        Actor.changeGuildCoin(sysarg,nCoin)
    end
    
	return DestoryGuildItemInit(sysarg)
end
function CalTheCount(sysarg,index)
	local DestoyData = 
	{
		{403, 411, "八荒装备"},
		{412, 420, "九宫装备"},
		{421, 429, "十方装备"},
		{5736, 5762, "60级装备"},
		{5763, 5789, "70级装备"},
		{5790, 5816, "80级装备"},
	}
	index = tonumber(index)
	local count = 0
	for i=DestoyData[index][1],DestoyData[index][2] do
		if Guild.GetDepotItemCountById(sysarg,i) ~= -1 then 
			count = count+ Guild.GetDepotItemCountById(sysarg,i)
		end
	end
	return count
end