--#include "data\config\SuperLuckStarCfg.lua" once
--超级幸运星活动实现


--发送玩家超级幸运星信息
function HandSendSuperStarPlayerInfo(sysarg)
    HandlInitSuperLuckStarInfo(sysarg)
    local var = Actor.getStaticVar(sysarg)
    local pack = DataPack.allocPacket(sysarg,151,62)
    DataPack.writeUInt(pack,var.days.PeyNum)
    DataPack.writeWord(pack,var.superstar.luckvalue)
    for i =1,#SuperLuckStarCfg.Level do
        DataPack.writeByte(pack,var.superstar.level[i].star)
        DataPack.writeByte(pack,var.superstar.level[i].isgive)
    end
    DataPack.flush(pack)
end

--
--初始化玩家超级幸运星信息
function HandlInitSuperLuckStarInfo(sysarg)
    local var = Actor.getStaticVar(sysarg)
    if var.superstar == nil then
        var.superstar = {}
        var.superstar.level ={}
        var.superstar.luckvalue =0 --幸运积分
        var.superstar.drawcount = 0--累计抽奖次数
        var.superstar.drawitem = {}
        var.superstar.drawitem.count = 0  --
        var.superstar.drawitem.item={}        --已经抽到的物品id
        local year,month,day = System.getDate()
        var.superstar.month = month
        
        for i = 1,#SuperLuckStarCfg.Level do
            var.superstar.level[i] = {}
            var.superstar.level[i].star = 0 --等级
            var.superstar.level[i].isgive = 0 --今天是否已经升级
        end
    end

end
--玩家跨天
function HandSuperLuckStarPlayerCrossDay(sysarg)
    local var = Actor.getStaticVar(sysarg)
    HandlInitSuperLuckStarInfo(sysarg)

    local year,month,day = System.getDate()
    --跨月,重新初始化
    if var.superstar.month ~= month  then
        var.superstar = nil
        HandlInitSuperLuckStarInfo(sysarg)
    else --每天升级标识
        for i = 1,#SuperLuckStarCfg.Level do
            var.superstar.level[i].isgive = 0 --今天是否已经升级
        end

    end
   
   
end

--玩家充值
function HandSuperLuckStarPayYuanBao(sysarg)
    HandlInitSuperLuckStarInfo(sysarg)
    
    local nAddValue = 0
    local var = Actor.getStaticVar(sysarg)
    local nPeyCount = var.days.PeyNum
    local bSend = false
    for i=1,#SuperLuckStarCfg.Level do
        if nPeyCount >= SuperLuckStarCfg.Level[i].payYuanBao then
            if var.superstar.level[i].isgive == 0 and var.superstar.level[i].star < SuperLuckStarCfg.Level[i].maxStar then
                var.superstar.level[i].star = var.superstar.level[i].star + 1
                var.superstar.luckvalue = var.superstar.luckvalue + SuperLuckStarCfg.Level[i].luckValue
                nAddValue = nAddValue + SuperLuckStarCfg.Level[i].luckValue
                var.superstar.level[i].isgive = 1
                bSend = true
            end
        end
    end
    if bSend == true then
        HandSendSuperStarPlayerInfo(sysarg)
    end
    if nAddValue > 0 then
        Actor.sendTipmsg(sysarg,string.format("充值满足需求获得%d幸运积分，总幸运积分%d",nAddValue,var.superstar.luckvalue),ttFlyTip)
    end
  
end

function setAAA(sysarg,name,count)

    local pActor = Actor.getActorPtrByName(name)
    if pActor ~= nil then
        HandlInitSuperLuckStarInfo(pActor)
        local var = Actor.getStaticVar(pActor)
        var.superstar.luckvalue = var.superstar.luckvalue + tonumber(count)
        
        Actor.sendTipmsg(sysarg,"成功",ttFlyTip)
    end
end
function setPlayLuckValue(sysarg,count)
    local var = Actor.getStaticVar(sysarg)
    var.superstar.luckvalue = tonumber(count)
end

 
--发送超级幸运星抽奖日志
function HandSendSuperLuckStarLogInfo(sysarg)
    if g_SuperLuckStarLog == nil then g_SuperLuckStarLog = {} end
    local pack = DataPack.allocPacket(sysarg,151,64)
    DataPack.writeByte(pack,#g_SuperLuckStarLog)
   --print("count:"..#g_SuperLuckStarLog)
    for i =1,#g_SuperLuckStarLog do
        --print("str1:"..g_SuperLuckStarLog[i])
        DataPack.writeString(pack,g_SuperLuckStarLog[i])
    end
    DataPack.flush(pack)
end
--增加超级幸运星抽奖日志
function AddSuperLuckStarLog(sysarg)
    if g_SuperLuckStarLog == nil then g_SuperLuckStarLog = {} end

    local var = Actor.getStaticVar(sysarg)
    if var.givesuperstar ~= nil then
          local str = ""
          if var.givesuperstar.money > 0 then
           --   str = string.format("<(n%s)> 获得价值 %d 元宝的 %sx%d",Actor.getName(sysarg),var.givesuperstar.money,Item.getItemLinkMsg(var.givesuperstar.itemid),var.givesuperstar.count)
               str = string.format("<(n%s)> 获得 %sx%d",Actor.getName(sysarg),Item.getItemLinkMsg(var.givesuperstar.itemid),var.givesuperstar.count)
          else
              str = string.format("<(n%s)> 获得 价值连城 的%sx%d",Actor.getName(sysarg),Item.getItemLinkMsg(var.givesuperstar.itemid),var.givesuperstar.count)
          end

          
          table.insert(g_SuperLuckStarLog,str)
          if #g_SuperLuckStarLog > 50 then
            table.remove(g_SuperLuckStarLog,1)
         end
         
    end
    

end

--载入超级幸运星抽奖日志
function LoadSuperLuckStarLog()
    if g_SuperLuckStarLog == nil then g_SuperLuckStarLog = {} end
    local file = io.open("data/runtime/SuperLuckStarLog.txt", "r")
	if not file then
		--print("没有 [元宝消耗]排行榜 文件：ranking/SuperLuckStarLog.txt")
		return
	end
    local bom = file:read(3) -- read BOM
	if not bom or string.len(bom) < 3 then
		file:close()
		print("error, 装载 [超级幸运星日志文件]排行榜 失败(BOM error)")
		return
	end	
	local line 
    for line in file:lines() do
        if not line then break end
		table.insert(g_SuperLuckStarLog,line)	
    end
	
	file:close()
end

--保存超级幸运星抽奖日志
function SaveSuperLuckStarLog()
    if g_SuperLuckStarLog == nil then g_SuperLuckStarLog = {} end
    local file = io.open("data/runtime/SuperLuckStarLog.txt", "w")
	if not file then
		print("------------ error, open SuperLuckStarLog.txt fail")
		return
	end
    file:write(string.format("%c%c%c", 0xEF, 0xBB, 0xBF)) -- write BOM	
    for i =1,#g_SuperLuckStarLog do	
	    file:write(g_SuperLuckStarLog[i].."\n")
    end
    file:close()
end
function HandSuperLuckStarGive(sysarg)
    local var = Actor.getStaticVar(sysarg)
    if var.givesuperstar ~= nil then
        if Item.getBagEmptyGridCount( sysarg ) < 1 then
            local actor_id = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
            System.AddMail(actor_id,6,0,"超级幸运星","超级幸运星奖励",0,0,var.givesuperstar.itemid..","..var.givesuperstar.count..",1")
        else
            Actor.addItem(sysarg,var.givesuperstar.itemid,0,0,var.givesuperstar.count,var.givesuperstar.bind,0,"超级幸运星",LogIds.superluckstargiveitem)
        end
      
       
        local str = "恭喜<(n%s)>从幸运转盘获得[%s]！<我也要获得/@@showWin,242>"
        System.broadcastTipmsg(string.format(str,Actor.getName(sysarg),Item.getItemLinkMsg(var.givesuperstar.itemid)),ttChatWindow)
        
        AddSuperLuckStarLog(sysarg)
        
        
        var.givesuperstar = nil
    end
    HandSendSuperLuckStarLogInfo(sysarg)
end
--抽奖
function HandSuperLuckStarLuckDraw(sysarg)
    local var = Actor.getStaticVar(sysarg)
    
    HandlInitSuperLuckStarInfo(sysarg)
    HandSuperLuckStarGive(sysarg) --意外断线，没有领取奖励的情况-
 
    if var.superstar.luckvalue < SuperLuckStarCfg.LuckDraw.needLuckValue then
        Actor.sendTipmsg(sysarg,"幸运积分不足!",ttFlyTip)
        local pack = DataPack.allocPacket(sysarg,151,63)
        DataPack.writeByte(pack,0)
        DataPack.flush(pack)
        return
    end
   
    if Item.getBagEmptyGridCount( sysarg ) < 1 then
        Actor.sendTipmsg(sysarg,"背包格子剩余不足1格，抽奖失败！",ttFlyTip)
        local pack = DataPack.allocPacket(sysarg,151,63)
        DataPack.writeByte(pack,0)
        DataPack.flush(pack)
        return
    end

    local cfg = {}
   
   
    if var.superstar.drawcount >= #SuperLuckStarCfg.LuckDraw.award[2] + #SuperLuckStarCfg.LuckDraw.award[1] then
        Actor.sendTipmsg(sysarg,"这个月的奖励已经抽完！",ttFlyTip)
        return
    end
    if var.superstar.drawcount >= SuperLuckStarCfg.LuckDraw.countTwo then
        cfg = SuperLuckStarCfg.LuckDraw.award[2]
        
    else
         cfg = SuperLuckStarCfg.LuckDraw.award[1]
    end
    
     
   local t = {}
    for i =1,#cfg do
        table.insert(t,cfg[i])
    end
    for i =#t,1,-1 do
        for j = 1,var.superstar.drawitem.count do
            if t[i] ~= nil and t[i].itemid == var.superstar.drawitem.item[j] then
                table.remove(t,i)
                break
            end
        end
    end
    
    local nIndex = -1
    local n = 0
    while n < 1000 do
        for i =1,#t do
            
            if t[i].rate <= System.getRandomNumber(10000) + 1 then
                nIndex = i
                n = -1
                break
            end
       
        end
        if n == -1 then break end
        n= n + 1
    end
     
    if nIndex == -1 then
        nIndex = System.getRandomNumber(#t) + 1
    end
     
    if t[nIndex] == nil then 
        Actor.sendTipmsg(sysarg,"未知错误!",ttFlyTip)
        local pack = DataPack.allocPacket(sysarg,151,63)
        DataPack.writeByte(pack,0)
        DataPack.flush(pack)
        return 
    end
    var.superstar.drawcount = var.superstar.drawcount + 1
    var.superstar.drawitem.count = var.superstar.drawitem.count + 1
    var.superstar.drawitem.item[var.superstar.drawitem.count] = t[nIndex].itemid
    var.superstar.luckvalue = var.superstar.luckvalue - SuperLuckStarCfg.LuckDraw.needLuckValue
    --Actor.addItem(sysarg,t[nIndex].itemid,0,0,t[nIndex].count,t[nIndex].bind,0,"超级幸运星",LogIds.superluckstargiveitem)
    var.givesuperstar = {}
    var.givesuperstar.itemid = t[nIndex].itemid
    var.givesuperstar.count = t[nIndex].count
    var.givesuperstar.bind = t[nIndex].bind
    var.givesuperstar.money = t[nIndex].money
    local pack = DataPack.allocPacket(sysarg,151,63)
    DataPack.writeByte(pack,1)
    DataPack.writeWord(pack,t[nIndex].itemid)
    DataPack.writeWord(pack,var.superstar.luckvalue)
    DataPack.flush(pack)
end