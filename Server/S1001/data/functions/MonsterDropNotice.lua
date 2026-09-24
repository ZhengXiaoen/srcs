
s_BossDrop = {
                maxCount = 300,
                count = 0,
                text={},
               }
--怪物掉落公告
function OnMonsterDropNotice(pActor,pMonster,pItem,sceneName)
    if pActor == nil  or pMonster == nil or pItem == nil then return end 
    if sceneName == nil then sceneName = "" end
    local szActorName = Actor.getName(pActor)
    local szMonsterName = Actor.getName(pMonster)
    local nItemId = Item.getItemId(pItem) 
    local y, m, d = System.getDate();
    local h,mm,s = System.getTime()
    
    --local str = string.format("<(c0xFFFF0000)【%d-%d %d:%d】>      <(c0xFF00c0FF)【%s】> <(C0xFFd7CCAC)在> <(c0xFF00FF00)%s> <(C0xFFd7CCAC)击杀> <(c0xFFFF0000)%s> <(C0xFFd7CCAC)掉落> [%s]",m,d,h,mm,szActorName,sceneName,szMonsterName,Item.getItemLinkMsg(nItemId,pItem))

    local cfg = {}
    cfg.time = string.format("<(c0xFFFF0000)【%d-%d %d:%d】>",m,d,h,mm)
    cfg.monstername= string.format("<(c0xFFFF0000)%s>",szMonsterName)
    cfg.scenename = string.format("<(C0xFFd7CCAC)在><(c0xFF00FF00)%s>",sceneName)
    cfg.itemname = string.format("<(C0xFFd7CCAC)掉落>[%s]",Item.getItemLinkMsg(nItemId,pItem))
    if s_BossDrop.count > s_BossDrop.maxCount then
        s_BossDrop.text[s_BossDrop.maxCount] = nil
       
        s_BossDrop.count = s_BossDrop.maxCount - 1
    end
    table.insert(s_BossDrop.text,1,cfg)
    s_BossDrop.count = s_BossDrop.count + 1
   --调试
	-- System.trace("srrefreshmonster drop actorsceneid:"..Actor.getSceneId(pActor).."monstersceneid:"..Actor.getSceneId(pMonster).."monsterid:"..Actor.getIntProperty(pMonster,PROP_ENTITY_ID).."actorid:"..Actor.getIntProperty(pActor,PROP_ENTITY_ID))
	local bossid = Actor.getIntProperty(pMonster,PROP_ENTITY_ID)
	if bossid>=1113 and bossid<=1125 then 
		System.trace("kill shengxiao monsterid:"..bossid.."  dorp:"..nItemId)
	end
end

--获取BOSS掉落公告
function GetMonsterDropNotice(sysarg,page)

    local nIndex = (page - 1) * 15 + 1
   
    local netPack = DataPack.allocPacket(sysarg, 139, 203)
    DataPack.writeWord(netPack,s_BossDrop.count)
    local nCount = 0
    for i = nIndex,nIndex + 14 do
        if s_BossDrop.text[i] == nil then break end
        nCount = nCount + 1
       
    end
    DataPack.writeByte(netPack,nCount)
    for i = nIndex,nIndex + 15 do
        if s_BossDrop.text[i] == nil then break end
        local cfg = s_BossDrop.text[i]
       DataPack.writeString(netPack,cfg.time)
       DataPack.writeString(netPack,cfg.monstername)
       DataPack.writeString(netPack,cfg.scenename)
       DataPack.writeString(netPack,cfg.itemname)
        --DataPack.writeString(netPack,s_BossDrop.text[i]) 
    end
    
   DataPack.flush(netPack)


end