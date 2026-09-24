--#include "data\config\equipSynthesis\EquipSlotGemDataCfg.lua" once
NpcDialog[390] = {}

NpcDialog[390].main = function(sysarg)
	--//主显示内容
local openServerDay = System.getDaysSinceOpenServer()
	if openServerDay<=6 then 
		echo = [[


	           <(c0xFFb6946c)今天是开区第><(c0xFF00FF00)]]..openServerDay..[[><(c0xFFb6946c)天>
	           <(idecoLine#350)>

  <(c0xFFb6946c)只有开区第><(c0xFF00FF00)7><(c0xFFb6946c)天开始才开放><(c0xFF00FF00)宝石升级与互换功能><(c0xFFb6946c),到第><(c0xFF00FF00)7><(c0xFFb6946c)天再来找我吧,先赶紧去提升你的实力吧！>
  



		]]
		return echo
	end

	local echo = [[


     <(c0xFFb6946c)我是宝石大师！
     我这里可以互换其他宝石，还可以合成高级宝石！>
     <(idecoLine#350)>

       <#c0xFFFFFF00#宝石升级/@GemUpLevelStr> <(c0xFFb6946c)使用><(c0xFF00FF00)四个相同等级属性><(c0xFFb6946c)宝石可以升级为><(c0xFF00FF00)高级同属性宝石><(c0xFFb6946c)，不过需要收取><(c0xFF00FF00)一定绑金><(c0xFFb6946c)或><(c0xFF00FF00)金币><(c0xFFb6946c)哦~>   

<(idecoLine#330)>

       <#c0xFFFFFF00#宝石互换/@GemExChangeStrEx> <(c0xFFb6946c)花费><(c0xFF00FF00)一定元宝><(c0xFFb6946c)和><(c0xFF00FF00)指定等级属性宝石><(c0xFFb6946c)可互换一种><(c0xFF00FF00)其他同等级属性宝石>
       


]]

	 return echo;
end

NpcDialog[390].GemUpLevelStrEx= function(sysarg)
    local cfg = EquipSlotGemDataCfg.GemSet
    local nCount = EquipSlotGemDataCfg.GemUpLevel.count
    local str =[[ 
    <(c0xFFb6946c)消耗><(c0xFF00FF00)四个相同等级属性宝石><(c0xFFb6946c)可以升级为><(c0xFF00FF00)高级同属性宝石><(c0xFFb6946c)，需支付><(c0xFF00FF00)绑金><(c0xFFb6946c)或><(c0xFF00FF00)金币><(c0xFFb6946c)！> 
    <(c0xFFb6946c)请选择您要升级的宝石：><(idecoLine#350)>
     ]]
    str =str..Item.getItemLinkMsg(cfg[1][6].itemid).."   <#"..NpcDialog[390].GetItemColor(sysarg,cfg[1][5].itemid,nCount).."#升级/@GemUpLevel,1,6,1|需要：5阶攻击宝石*4 +150w绑金>       "..Item.getItemLinkMsg(cfg[6][6].itemid).." <#"..NpcDialog[390].GetItemColor(sysarg,cfg[6][5].itemid,nCount).."#升级/@GemUpLevel,6,6,1|需要：5阶闪避宝石*4 +150w绑金>\n"
    str =str.."     "..Item.getItemLinkMsg(cfg[1][7].itemid).."   <#"..NpcDialog[390].GetItemColor(sysarg,cfg[1][6].itemid,nCount).."#升级/@GemUpLevel,1,7,1|需要：6阶攻击宝石*4 +300w绑金>       "..Item.getItemLinkMsg(cfg[6][7].itemid).." <#"..NpcDialog[390].GetItemColor(sysarg,cfg[6][6].itemid,nCount).."#升级/@GemUpLevel,6,7,1|需要：6阶闪避宝石*4 +300w绑金>\n"
    str =str.."     "..Item.getItemLinkMsg(cfg[1][8].itemid).."   <#"..NpcDialog[390].GetItemColor(sysarg,cfg[1][7].itemid,nCount).."#升级/@GemUpLevel,1,8,1|需要：7阶攻击宝石*4 +500w绑金>       "..Item.getItemLinkMsg(cfg[6][8].itemid).." <#"..NpcDialog[390].GetItemColor(sysarg,cfg[6][7].itemid,nCount).."#升级/@GemUpLevel,6,8,1|需要：7阶闪避宝石*4 +500w绑金>\n"
    str =str.."     "..Item.getItemLinkMsg(cfg[1][9].itemid).."   <#"..NpcDialog[390].GetItemColor(sysarg,cfg[1][8].itemid,nCount).."#升级/@GemUpLevel,1,9,1|需要：8阶攻击宝石*4 +800w绑金>       "..Item.getItemLinkMsg(cfg[6][9].itemid).." <#"..NpcDialog[390].GetItemColor(sysarg,cfg[6][8].itemid,nCount).."#升级/@GemUpLevel,6,9,1|需要：8阶闪避宝石*4 +800w绑金>\n"
    str =str.."     "..Item.getItemLinkMsg(cfg[1][10].itemid).."   <#"..NpcDialog[390].GetItemColor(sysarg,cfg[1][9].itemid,nCount).."#升级/@GemUpLevel,1,10,1|需要：9阶攻击宝石*4 +1200w绑金>       "..Item.getItemLinkMsg(cfg[6][10].itemid).." <#"..NpcDialog[390].GetItemColor(sysarg,cfg[6][9].itemid,nCount).."#升级/@GemUpLevel,6,10|需要：9阶闪避宝石*4 +1200w绑金>\n"

    str =str.."     "..Item.getItemLinkMsg(cfg[5][6].itemid).."   <#"..NpcDialog[390].GetItemColor(sysarg,cfg[5][5].itemid,nCount).."#升级/@GemUpLevel,5,6,1|需要：5阶准确宝石*4 +150w绑金>       "..Item.getItemLinkMsg(cfg[4][6].itemid).." <#"..NpcDialog[390].GetItemColor(sysarg,cfg[4][5].itemid,nCount).."#升级/@GemUpLevel,4,6,1|需要：5阶暴击宝石*4 +150w绑金>\n"
    str =str.."     "..Item.getItemLinkMsg(cfg[5][7].itemid).."   <#"..NpcDialog[390].GetItemColor(sysarg,cfg[5][6].itemid,nCount).."#升级/@GemUpLevel,5,7,1|需要：6阶准确宝石*4 +300w绑金>       "..Item.getItemLinkMsg(cfg[4][7].itemid).." <#"..NpcDialog[390].GetItemColor(sysarg,cfg[4][6].itemid,nCount).."#升级/@GemUpLevel,4,7,1|需要：6阶暴击宝石*4 +300w绑金>\n"
    str =str.."     "..Item.getItemLinkMsg(cfg[5][8].itemid).."   <#"..NpcDialog[390].GetItemColor(sysarg,cfg[5][7].itemid,nCount).."#升级/@GemUpLevel,5,8,1|需要：7阶准确宝石*4 +500w绑金>       "..Item.getItemLinkMsg(cfg[4][8].itemid).." <#"..NpcDialog[390].GetItemColor(sysarg,cfg[4][7].itemid,nCount).."#升级/@GemUpLevel,4,8,1|需要：7阶暴击宝石*4 +500w绑金>\n"
    str =str.."     "..Item.getItemLinkMsg(cfg[5][9].itemid).."   <#"..NpcDialog[390].GetItemColor(sysarg,cfg[5][8].itemid,nCount).."#升级/@GemUpLevel,5,9,1|需要：8阶准确宝石*4 +800w绑金>       "..Item.getItemLinkMsg(cfg[4][9].itemid).." <#"..NpcDialog[390].GetItemColor(sysarg,cfg[4][8].itemid,nCount).."#升级/@GemUpLevel,4,9,1|需要：8阶暴击宝石*4 +800w绑金>\n"
    str =str.."     "..Item.getItemLinkMsg(cfg[5][10].itemid).."   <#"..NpcDialog[390].GetItemColor(sysarg,cfg[5][9].itemid,nCount).."#升级/@GemUpLevel,5,10,1|需要：9阶准确宝石*4 +1200w绑金>       "..Item.getItemLinkMsg(cfg[4][10].itemid).." <#"..NpcDialog[390].GetItemColor(sysarg,cfg[4][9].itemid,nCount).."#升级/@GemUpLevel,4,10,1|需要：9阶暴击宝石*4 +1200w绑金>\n"    
   
    str =str.."     "..Item.getItemLinkMsg(cfg[2][6].itemid).."   <#"..NpcDialog[390].GetItemColor(sysarg,cfg[2][5].itemid,nCount).."#升级/@GemUpLevel,2,6,1|需要：5阶物防宝石*4 +150w绑金>       "..Item.getItemLinkMsg(cfg[3][6].itemid).." <#"..NpcDialog[390].GetItemColor(sysarg,cfg[3][5].itemid,nCount).."#升级/@GemUpLevel,3,6,1|需要：5阶魔防宝石*4 +150w绑金>\n"
    str =str.."     "..Item.getItemLinkMsg(cfg[2][7].itemid).."   <#"..NpcDialog[390].GetItemColor(sysarg,cfg[2][6].itemid,nCount).."#升级/@GemUpLevel,2,7,1|需要：6阶物防宝石*4 +300w绑金>       "..Item.getItemLinkMsg(cfg[3][7].itemid).." <#"..NpcDialog[390].GetItemColor(sysarg,cfg[3][6].itemid,nCount).."#升级/@GemUpLevel,3,7,1|需要：6阶魔防宝石*4 +300w绑金>\n"
    str =str.."     "..Item.getItemLinkMsg(cfg[2][8].itemid).."   <#"..NpcDialog[390].GetItemColor(sysarg,cfg[2][7].itemid,nCount).."#升级/@GemUpLevel,2,8,1|需要：7阶物防宝石*4 +500w绑金>       "..Item.getItemLinkMsg(cfg[3][8].itemid).." <#"..NpcDialog[390].GetItemColor(sysarg,cfg[3][7].itemid,nCount).."#升级/@GemUpLevel,3,8,1|需要：7阶魔防宝石*4 +500w绑金>\n"
    str =str.."     "..Item.getItemLinkMsg(cfg[2][9].itemid).."   <#"..NpcDialog[390].GetItemColor(sysarg,cfg[2][8].itemid,nCount).."#升级/@GemUpLevel,2,9,1|需要：8阶物防宝石*4 +800w绑金>       "..Item.getItemLinkMsg(cfg[3][9].itemid).." <#"..NpcDialog[390].GetItemColor(sysarg,cfg[3][8].itemid,nCount).."#升级/@GemUpLevel,3,9,1|需要：8阶魔防宝石*4 +800w绑金>\n"
    str =str.."     "..Item.getItemLinkMsg(cfg[2][10].itemid).."   <#"..NpcDialog[390].GetItemColor(sysarg,cfg[2][9].itemid,nCount).."#升级/@GemUpLevel,2,10,1|需要：9阶物防宝石*4 +1200w绑金>       "..Item.getItemLinkMsg(cfg[3][10].itemid).." <#"..NpcDialog[390].GetItemColor(sysarg,cfg[3][9].itemid,nCount).."#升级/@GemUpLevel,3,10,1|需要：9阶魔防宝石*4 +1200w绑金>\n"  
   
   str=str..[[
	                  <返 回/@main> <上一页/@GemUpLevelStr>]]

   return str

end
--宝石升级
NpcDialog[390].GemUpLevelStr = function(sysarg)
    
    
    local cfg = EquipSlotGemDataCfg.GemSet
    local nCount = EquipSlotGemDataCfg.GemUpLevel.count
    local str =[[ 
    <(c0xFFb6946c)消耗><(c0xFF00FF00)四个相同等级属性宝石><(c0xFFb6946c)可以升级为><(c0xFF00FF00)高级同属性宝石><(c0xFFb6946c)，需支付><(c0xFF00FF00)绑金><(c0xFFb6946c)或><(c0xFF00FF00)金币><(c0xFFb6946c)！> 
    <(c0xFFb6946c)请选择您要升级的宝石：><(idecoLine#350)>
     ]]
    --str = Item.getItemLinkMsg(cfg[1][1].itemid).."*1   <升级/@GemUpLevel,1,1>       "..Item.getItemLinkMsg(cfg[6][1].itemid).."*1 <升级/@GemUpLevel,6,1>\n"
 str =str..Item.getItemLinkMsg(cfg[1][2].itemid).."   <#"..NpcDialog[390].GetItemColor(sysarg,cfg[1][1].itemid,nCount).."#升级/@GemUpLevel,1,2|需要：1阶攻击宝石*4 +10w绑金>       "..Item.getItemLinkMsg(cfg[6][2].itemid).." <#"..NpcDialog[390].GetItemColor(sysarg,cfg[6][1].itemid,nCount).."#升级/@GemUpLevel,6,2|需要：1阶闪避宝石*4 +10w绑金>\n"
    str =str.."     "..Item.getItemLinkMsg(cfg[1][3].itemid).."   <#"..NpcDialog[390].GetItemColor(sysarg,cfg[1][2].itemid,nCount).."#升级/@GemUpLevel,1,3|需要：2阶攻击宝石*4 +30w绑金>       "..Item.getItemLinkMsg(cfg[6][3].itemid).." <#"..NpcDialog[390].GetItemColor(sysarg,cfg[6][2].itemid,nCount).."#升级/@GemUpLevel,6,3|需要：2阶闪避宝石*4 +30w绑金>\n"
    str =str.."     "..Item.getItemLinkMsg(cfg[1][4].itemid).."   <#"..NpcDialog[390].GetItemColor(sysarg,cfg[1][3].itemid,nCount).."#升级/@GemUpLevel,1,4|需要：3阶攻击宝石*4 +50w绑金>       "..Item.getItemLinkMsg(cfg[6][4].itemid).." <#"..NpcDialog[390].GetItemColor(sysarg,cfg[6][3].itemid,nCount).."#升级/@GemUpLevel,6,4|需要：3阶闪避宝石*4 +50w绑金>\n"
    str =str.."     "..Item.getItemLinkMsg(cfg[1][5].itemid).."   <#"..NpcDialog[390].GetItemColor(sysarg,cfg[1][4].itemid,nCount).."#升级/@GemUpLevel,1,5|需要：4阶攻击宝石*4 +100w绑金>       "..Item.getItemLinkMsg(cfg[6][5].itemid).." <#"..NpcDialog[390].GetItemColor(sysarg,cfg[6][4].itemid,nCount).."#升级/@GemUpLevel,6,5|需要：4阶闪避宝石*4 +100w绑金>\n\n"

   -- str =str..Item.getItemLinkMsg(cfg[5][1].itemid).."*1   <升级/@GemUpLevel,5,1>       "..Item.getItemLinkMsg(cfg[4][1].itemid).."*1 <升级/@GemUpLevel,4,1>\n"
    str =str.."     "..Item.getItemLinkMsg(cfg[5][2].itemid).."   <#"..NpcDialog[390].GetItemColor(sysarg,cfg[5][1].itemid,nCount).."#升级/@GemUpLevel,5,2|需要：1阶准确宝石*4 +10w绑金>       "..Item.getItemLinkMsg(cfg[4][2].itemid).." <#"..NpcDialog[390].GetItemColor(sysarg,cfg[4][1].itemid,nCount).."#升级/@GemUpLevel,4,2|需要：1阶暴击宝石*4 +10w绑金>\n"
    str =str.."     "..Item.getItemLinkMsg(cfg[5][3].itemid).."   <#"..NpcDialog[390].GetItemColor(sysarg,cfg[5][2].itemid,nCount).."#升级/@GemUpLevel,5,3|需要：2阶准确宝石*4 +30w绑金>       "..Item.getItemLinkMsg(cfg[4][3].itemid).." <#"..NpcDialog[390].GetItemColor(sysarg,cfg[4][2].itemid,nCount).."#升级/@GemUpLevel,4,3|需要：2阶暴击宝石*4 +30w绑金>\n"
    str =str.."     "..Item.getItemLinkMsg(cfg[5][4].itemid).."   <#"..NpcDialog[390].GetItemColor(sysarg,cfg[5][3].itemid,nCount).."#升级/@GemUpLevel,5,4|需要：3阶准确宝石*4 +50w绑金>       "..Item.getItemLinkMsg(cfg[4][4].itemid).." <#"..NpcDialog[390].GetItemColor(sysarg,cfg[4][3].itemid,nCount).."#升级/@GemUpLevel,4,4|需要：3阶暴击宝石*4 +50w绑金>\n"
    str =str.."     "..Item.getItemLinkMsg(cfg[5][5].itemid).."   <#"..NpcDialog[390].GetItemColor(sysarg,cfg[5][4].itemid,nCount).."#升级/@GemUpLevel,5,5|需要：4阶准确宝石*4 +100w绑金>       "..Item.getItemLinkMsg(cfg[4][5].itemid).." <#"..NpcDialog[390].GetItemColor(sysarg,cfg[4][4].itemid,nCount).."#升级/@GemUpLevel,4,5|需要：4阶暴击宝石*4 +100w绑金>\n\n"    
   
    --str =str..Item.getItemLinkMsg(cfg[2][1].itemid).."*1   <升级/@GemUpLevel,2,1>       "..Item.getItemLinkMsg(cfg[3][1].itemid).."*1 <升级/@GemUpLevel,3,1>\n"
    str =str.."     "..Item.getItemLinkMsg(cfg[2][2].itemid).."   <#"..NpcDialog[390].GetItemColor(sysarg,cfg[2][1].itemid,nCount).."#升级/@GemUpLevel,2,2|需要：1阶物防宝石*4 +10w绑金>       "..Item.getItemLinkMsg(cfg[3][2].itemid).." <#"..NpcDialog[390].GetItemColor(sysarg,cfg[3][1].itemid,nCount).."#升级/@GemUpLevel,3,2|需要：1阶魔防宝石*4 +10w绑金>\n"
    str =str.."     "..Item.getItemLinkMsg(cfg[2][3].itemid).."   <#"..NpcDialog[390].GetItemColor(sysarg,cfg[2][2].itemid,nCount).."#升级/@GemUpLevel,2,3|需要：2阶物防宝石*4 +30w绑金>       "..Item.getItemLinkMsg(cfg[3][3].itemid).." <#"..NpcDialog[390].GetItemColor(sysarg,cfg[3][2].itemid,nCount).."#升级/@GemUpLevel,3,3|需要：2阶魔防宝石*4 +30w绑金>\n"
    str =str.."     "..Item.getItemLinkMsg(cfg[2][4].itemid).."   <#"..NpcDialog[390].GetItemColor(sysarg,cfg[2][3].itemid,nCount).."#升级/@GemUpLevel,2,4|需要：3阶物防宝石*4 +50w绑金>       "..Item.getItemLinkMsg(cfg[3][4].itemid).." <#"..NpcDialog[390].GetItemColor(sysarg,cfg[3][3].itemid,nCount).."#升级/@GemUpLevel,3,4|需要：3阶魔防宝石*4 +50w绑金>\n"
    str =str.."     "..Item.getItemLinkMsg(cfg[2][5].itemid).."   <#"..NpcDialog[390].GetItemColor(sysarg,cfg[2][4].itemid,nCount).."#升级/@GemUpLevel,2,5|需要：4阶物防宝石*4 +100w绑金>       "..Item.getItemLinkMsg(cfg[3][5].itemid).." <#"..NpcDialog[390].GetItemColor(sysarg,cfg[3][4].itemid,nCount).."#升级/@GemUpLevel,3,5|需要：4阶魔防宝石*4 +100w绑金>\n\n"  
   
   str=str..[[
	                  <返 回/@main> <下一页/@GemUpLevelStrEx>]]

   return str

end
NpcDialog[390].GemUpLevel = function(sysarg,gem,index,page)
    gem = tonumber(gem)
    index = tonumber(index)
    
    if page == nil then page = 0 end
    page = tonumber(page)
  
    local needCfg = EquipSlotGemDataCfg.GemUpLevel.needMoney
    if gem < 0 or gem > table.getn(EquipSlotGemDataCfg.GemSet) then return end
    if index < 0 or index > table.getn(EquipSlotGemDataCfg.GemSet[1])  then return end
    local delItemId = EquipSlotGemDataCfg.GemSet[gem][index-1].itemid
    local nAwardItemId = EquipSlotGemDataCfg.GemSet[gem][index ].itemid
     if Actor.getItemCount(sysarg,delItemId) < EquipSlotGemDataCfg.GemUpLevel.count then
        Actor.sendTipmsg(sysarg,"包裹"..Item.getItemLinkMsg(delItemId).."数量不足"..EquipSlotGemDataCfg.GemUpLevel.count.."个，升级失败！",ttFlyTip)
        return
    end
     --包裹格子是否足够
    if Item.getBagEmptyGridCount(sysarg) == 0 then
         Actor.sendTipmsg(sysarg, "包裹空间不足,请清理1格!!", ttFlyTip)
        return
    end
    if Actor.getMoneyCount(sysarg,mtBindCoin) < needCfg[index] then
        if Actor.getMoneyCount(sysarg,mtCoin) < needCfg[index] then
            Actor.sendTipmsg(sysarg,"绑定金币或金币不足"..needCfg[index].."，兑换失败！",ttFlyTip)
            return
        else 
            Actor.changeMoney(sysarg,mtCoin,-needCfg[index],LogIds.gemuplevel,"宝石升级") 
        end
        
    else
        Actor.changeMoney(sysarg,mtBindCoin,-needCfg[index],LogIds.gemuplevel,"宝石升级")   
    end

  
    Actor.removeItem(sysarg,delItemId,EquipSlotGemDataCfg.GemUpLevel.count,-1,-1,-1,"宝石升级",LogIds.gemuplevel)
    --随机给予一个宝石
    local nNum = 1
    for i =1,10 do
       nNum = System.getRandomNumber(table.getn(EquipSlotGemDataCfg.GemSet))+1
    end
   
   
    Actor.addItem(sysarg,nAwardItemId,0,0,1,1,0,"宝石升级",LogIds.gemuplevel)
    Actor.sendTipmsg(sysarg,"升级成功！",ttFlyTip)
    local str = "<(n%s)>成功升阶获得%s!我也要去<(x威龙城:120:147:[传])>"
    str = str.format(str,Actor.getName(sysarg),Item.getItemLinkMsg(nAwardItemId))
    System.broadcastTipmsg(str,ttChatWindow)
    if page == 1 then
        return NpcDialog[390].GemUpLevelStrEx(sysarg)
    end
    return NpcDialog[390].GemUpLevelStr(sysarg)
end

NpcDialog[390].GemExChangeStrEx = function(sysarg)
    local str =
    [[

     <(c0xFFb6946c)我是宝石大师！>
     <(c0xFFb6946c)请选择你要互换的宝石：><(idecoLine#350)>
     <#c0xFFFFFF00#攻击宝石互换/@GemExChangeStr,1|攻击宝石 + 元宝 = 其他同等级属性宝石><(c0xFFb6946c)（可指定攻击宝石互换其他属性的宝石）>
     <#c0xFFFFFF00#物防宝石互换/@GemExChangeStr,2|物防宝石 + 元宝 = 其他同等级属性宝石><(c0xFFb6946c)（可指定物防宝石互换其他属性的宝石）>
     <#c0xFFFFFF00#魔防宝石互换/@GemExChangeStr,3|魔防宝石 + 元宝 = 其他同等级属性宝石><(c0xFFb6946c)（可指定魔防宝石互换其他属性的宝石）>
     <#c0xFFFFFF00#准确宝石互换/@GemExChangeStr,5|准确宝石 + 元宝 = 其他同等级属性宝石><(c0xFFb6946c)（可指定准确宝石互换其他属性的宝石）>
     <#c0xFFFFFF00#闪避宝石互换/@GemExChangeStr,6|闪避宝石 + 元宝 = 其他同等级属性宝石><(c0xFFb6946c)（可指定闪避宝石互换其他属性的宝石）>
     <#c0xFFFFFF00#暴击宝石互换/@GemExChangeStr,4|暴击宝石 + 元宝 = 其他同等级属性宝石><(c0xFFb6946c)（可指定暴击宝石互换其他属性的宝石）><(idecoLine#350)>
     <PS: ><(c0xFFb6946c)只能互换><(c0xFF00FF00)同等级><(c0xFFb6946c)的宝石，且需要一定><(c0xFF00FF00)元宝>
 <(c0xFFb6946c)1级宝石转换需要><(c0xFF00FF00)128><(c0xFFb6946c)元宝>  <(c0xFFb6946c)6级宝石转换需要><(c0xFF00FF00)48888><(c0xFFb6946c)元宝>
 <(c0xFFb6946c)2级宝石转换需要><(c0xFF00FF00)518><(c0xFFb6946c)元宝>  <(c0xFFb6946c)7级宝石转换需要><(c0xFF00FF00)58888><(c0xFFb6946c)元宝>
 <(c0xFFb6946c)3级宝石转换需要><(c0xFF00FF00)2058><(c0xFFb6946c)元宝>  <(c0xFFb6946c)8级宝石转换需要><(c0xFF00FF00)68888><(c0xFFb6946c)元宝>
 <(c0xFFb6946c)4级宝石转换需要><(c0xFF00FF00)8888><(c0xFFb6946c)元宝>  <(c0xFFb6946c)9级宝石转换需要><(c0xFF00FF00)78888><(c0xFFb6946c)元宝>
 <(c0xFFb6946c)5级宝石转换需要><(c0xFF00FF00)38888><(c0xFFb6946c)元宝>  <(c0xFFb6946c)10级宝石转换需要><(c0xFF00FF00)88888><(c0xFFb6946c)元宝>

                          <返 回/@main>

    ]]
    return str
end

NpcDialog[390].GetItemCountColor =function(sysarg,gemIndex,itemIndex)
    gemIndex = tonumber(gemIndex)
    itemIndex = tonumber(itemIndex)
  
    local itemId = EquipSlotGemDataCfg.GemSet[gemIndex][itemIndex].itemid
   
    local nCount =  Actor.getItemCount(sysarg,itemId)
    if nCount <= 0 then
        
        return "c0xFF888888",nCount
    end
    return "c0xFF04FB1D",nCount

end
NpcDialog[390].GetColorFunc =function(sysarg,itemId,ii,index,j)
        local str ="    "..Item.getItemLinkMsg(itemId)
        
        local sColor,nCount = NpcDialog[390].GetItemCountColor(sysarg,index,j)
        local szTips = "花费%s元宝可互换%s属性"
        szTips = string.format(szTips,EquipSlotGemDataCfg.GemExChangeNeedYuanBao[j],Item.getItemName(itemId))
        str= str.."<("..sColor..")*"..nCount..">   <#"..sColor.."#互换/@GemExChange,"..ii..","..j.."|"..szTips..">"
        return str
end

--宝石互换
NpcDialog[390].GemExChangeStr=function(sysarg,index,nStart)
    local cfg = EquipSlotGemDataCfg.GemSet
    local dVar = Actor.getDyanmicVar(sysarg)
    index = tonumber(index)
    if nStart == nil then nStart = 1 end
    nStart = tonumber(nStart)
    dVar.gemexchangeindex = index
    dVar.gemexnStartindex = nStart
    local str = [[
    <(c0xFF00FF00)花费一定元宝可改变宝石属性!>
    <(c0xFFb6946c)请选择你要互换的宝石：><(idecoLine#350)>]] 

    
    local i = 1
    while true do
        if i > table.getn(cfg) then break end
        if i ~= dVar.gemexchangeindex then
            local aaa = 1
            --print("len:"..table.getn(cfg[i]))
            for j = nStart,nStart+4 do --table.getn(cfg[i])
                str = str..NpcDialog[390].GetColorFunc(sysarg,cfg[i][j].itemid,i,index,j)
                while true do
                    if i + aaa ~= dVar.gemexchangeindex then
                        break
                    end
                    aaa = aaa + 1

                end
                if  i+aaa <= table.getn(cfg) then
                    str = str..NpcDialog[390].GetColorFunc(sysarg,cfg[i+aaa][j].itemid,i+aaa,index,j).."\n"
                else
                    str = str.."\n"
                end
            end
            i = i + aaa + 1
            str = str.."\n"
        else 
            i = i + 1
        end

    end
   
    str=str..[[	                   <返 回/@GemExChangeStrEx>]]
    if nStart == 1 then
        str=str.."  <下一页/@GemExChangeStr,"..dVar.gemexchangeindex..",6>"
    else 
        str=str.."  <上一页/@GemExChangeStr,"..dVar.gemexchangeindex..",1>"
    end


   return str
end

NpcDialog[390].GetItemColor = function(sysarg,itemId,count)
    if count == nil then count = 1 end
   
    if itemId == nil or Actor.getItemCount(sysarg,itemId) < count then
        return "c0xFF888888"
    end
    
    return "c0xFF04FB1D"
end
--兑换
NpcDialog[390].GemExChange = function(sysarg,gem,index)
   local dVar = Actor.getDyanmicVar(sysarg)
   if dVar.gemexchangeindex == nil then 
        Actor.sendTipmsg(sysarg,"互换失败,未知的错误！",ttFlyTip)
        return 
   end 
    --dVar.gemexchangeindex = tonumber(index)
    gem = tonumber(gem)
    index = tonumber(index)
    if gem < 0 or gem > table.getn(EquipSlotGemDataCfg.GemSet) then return end
    if index < 0 or index > table.getn(EquipSlotGemDataCfg.GemSet[1])  then return end
    local needCfg = EquipSlotGemDataCfg.GemExChangeNeedYuanBao
    local nItemId = EquipSlotGemDataCfg.GemSet[dVar.gemexchangeindex][index].itemid
    if Actor.getItemCount(sysarg,nItemId) <= 0 then
        Actor.sendTipmsg(sysarg,"包裹里没有"..Item.getItemLinkMsg(nItemId).."，互换失败！",ttFlyTip)
        return
    end
    if Actor.getMoneyCount(sysarg,mtYuanbao) < needCfg[index] then
        Actor.sendTipmsg(sysarg,"元宝不足"..needCfg[index].."，互换失败！",ttFlyTip)
        return
    end
    --包裹格子是否足够
    if Item.getBagEmptyGridCount(sysarg) == 0 then
         Actor.sendTipmsg(sysarg, "包裹空间不足,请清理1格!!", ttFlyTip)
        return
    end
    --扣除元宝
    Actor.changeMoney(sysarg,mtYuanbao,-needCfg[index],LogIds.gemexchange,"互换宝石") 
    Actor.removeItem(sysarg,nItemId,1,-1,-1,-1,"互换宝石",LogIds.gemexchange)
    --随机给予一个宝石
 --   local nNum = 1
--    local nGiveItemId = nItemId
--    while true do
--       nNum = System.getRandomNumber(table.getn(EquipSlotGemDataCfg.GemSet))+1
--       nGiveItemId = EquipSlotGemDataCfg.GemSet[nNum][index].itemid
--       if nGiveItemId ~= nItemId then
--            break
--       end
--    end
    local nGiveItemId =  EquipSlotGemDataCfg.GemSet[gem][index].itemid
   
    Actor.addItem(sysarg,nGiveItemId,0,0,1,1,0,"互换宝石",LogIds.gemexchange)
    Actor.sendTipmsg(sysarg,"互换成功！",ttFlyTip)
    --return NpcDialog[390].GemExChangeStrEx(sysarg)
    return NpcDialog[390].GemExChangeStr(sysarg,dVar.gemexchangeindex,dVar.gemexnStartindex)
end
