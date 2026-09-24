--游戏推广员
local t = {}
local bookid= 
{
    --战士技能书
    [1] = 
    {
        67,313,374,373,373,373    --彻地钉和逐日剑
    },
    --法师技能书
    [2] =
    {
        68,314,374,373,373,373    --群体雷电术和灭天炎
    },
    --道士技能书
    [3] =
    {
        69,315,374,373,373,373    --飓风破和群毒术
    },
}

--领取条件
--type 1为需要vip等级 2为需要等级
local needGive = 
{
    {type = 1,v = 2},
    {type = 2,v = 85},
    {type = 2,v = 75},
    {type = 2,v = 80},
    {type = 2,v = 81,},
    {type = 2,v = 82,},

}
--按照对应职业显示和领取

-- 64	彻地钉1级 2x2范围的80%物理伤害
-- 65	群体雷电术1级 3x3范围的100%魔法伤害+200点对怪物伤害
-- 66	飓风破1级 2x2范围的105%道术伤害

-- 67	彻地钉2级 3x3范围的85%物理伤害
-- 68	群体雷电术2级 3x3范围的100%魔法伤害+500点对怪物伤害
-- 69	飓风破2级 2x2范围的110%道术伤害

-- 70	彻地钉3级 3x3范围的90%物理伤害
-- 71	群体雷电术3级 4x4范围的100%魔法伤害+700点对怪物伤害
-- 72	飓风破3级 3x3范围的115%道术伤害

-- 73	彻地钉4级 4x4范围的95%物理伤害
-- 74	群体雷电术4级 5x5范围的100%魔法伤害+900点对怪物伤害
-- 75	飓风破4级 4x4范围的120%道术伤害

-- 76	彻地钉5级 5x5范围的100%物理伤害
-- 77	群体雷电术5级 6x6范围的100%魔法伤害+1100点对怪物伤害
-- 78	飓风破5级 5x5范围的125%道术伤害

-- 313	逐日剑1级 110%的物理伤害
-- 314	灭天炎1级 2x2范围的110%魔法伤害
-- 315	群毒术1级 2x2范围的范围施毒CD6400毫秒

-- 379	逐日剑2级 120%的物理伤害
-- 380	灭天炎2级 3x3范围的115%魔法伤害
-- 381	群毒术2级 3x3范围的范围施毒CD3200毫秒

-- 382	逐日剑3级 130%的物理伤害
-- 383	灭天炎3级 3x3范围的120%魔法伤害
-- 384	群毒术3级 3x3范围的范围施毒CD1600毫秒

-- 385	逐日剑4级 140%的物理伤害
-- 386	灭天炎4级 3x3范围的125%魔法伤害
-- 387	群毒术4级 4x4范围的范围施毒CD840毫秒

-- 388	逐日剑5级 150%的物理伤害
-- 389	灭天炎5级 3x3范围的130%魔法伤害
-- 390	群毒术5级 5x5范围的范围施毒CD420毫秒



t.main = function(sysarg)

    local var = Actor.getStaticVar(sysarg)
    if var.extend == nil then
        var.extend = {}
    end
	local actorid=  Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
    local cfg = GetExtendInfo(actorid)

	--改名卡的情况下- 矫正名称
   
    if cfg.upactorid ~= 0 then
        local pActor = System.getEntityPtrByActorID(cfg.upactorname)
        if pActor ~= nil then
            cfg.upactorname = Actor.getName(pActor)
        end
    end
    if cfg.downactorid ~= 0 then
        local pActor = System.getEntityPtrByActorID(cfg.downactorid)
        if pActor ~= nil then
            cfg.downactorname = Actor.getName(pActor)
        end
    end
	--//一个玩家只能被推荐1次 和推荐1名玩家, 无法解除此关系. 这类奖励只可领取1次, 领取时给予全服公告, XXX玩家在XXX处领取了XXX. 
	local echo = [[

    <(c0xFFb6946c)安利一位小伙伴进来就有惊喜好礼哟.>
    <(c0xFFb6946c)更多高级技能前往><(c0xFFff9000)沙漠土城-秦始皇陵><(c0xFFb6946c)处查询.>

<(idecoLine#315)>

    <(c0xFFb6946c)您的上线:>]] 

    if cfg.upactorname == "无" then
        echo = echo.." <(c0xFFeabc78)无>\\"
    else
        echo = echo.." <(n"..cfg.upactorname..")>"
        if cfg.uptag == 0 then
            echo = echo.." <接受/@recall,1> <拒绝/@recall,2>\\"
        else
            echo = echo.."\\"
        end
    end
    echo = echo.."    <(c0xFFb6946c)您的下线:> "
    if cfg.downactorname == "无" then
         echo = echo.."<(c0xFFeabc78)无>"
    else
        echo = echo.."<(n"..cfg.downactorname..")>"
		echo = echo.."   <解除下线/@jiechuxianxian>\\"
    end
	

	echo = echo..[[\\    <填写我推荐的好友(您的下线)游戏名/@onTXMZ|按以下步骤来:##&fada8b&1. 填写您推荐的玩家游戏名#2. 等待您推荐的玩家来这里点击NPC确认#3. 您推荐的玩家达到指定要求#4. 领取对应的奖励>

<(idecoLine#315)>\\]]
      local job = Actor.getIntProperty(sysarg,PROP_ACTOR_VOCATION)
      local tab =  bookid[job]
      if tab == nil then return echo end
      for i = 1,table.getn(tab) do
        echo = echo.."    "..Item.getItemLinkMsg(tab[i]).."  <点击领取/@onLQJL,"..i..">  <(c0xFFb6946c)需要您的下线"..""
        local hhf = "";
        if i == 2 then hhf = "\\"; end
        if needGive[i].type == 1 then
            echo = echo.."成为> <(c0xFFfddc00)VIP"..needGive[i].v..">\\"..hhf  
        else
           echo = echo.."达到> <(c0xFFfddc00)"..needGive[i].v.."级>\\"..hhf  
        end
      end  

	return echo;
end

t.jiechuxianxian =function(sysarg)

--	local var = Actor.getStaticVar(sysarg)
--    local pActor = System.getEntityPtrByActorID(var.extend.downid)
--    if pActor == nil then
--        Actor.sendTipmsg(sysarg,"您的下线没有在线，无法解除！",ttFlyTip)
--        return 
--    end

--    local targetVar = Actor.getStaticVar(pActor)
--    targetVar.extend.upname = nil
--    var.extend.downname = nil
--    Actor.sendTipmsg(sysarg,"解除下线成功！",ttFlyTip)
--	return t.main(sysarg)
    local actorid=  Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
    local cfg = GetExtendInfo(actorid)

    local cfgdown = GetExtendInfo( cfg.downactorid)
    cfg.downactorid = 0
    cfg.downactorname = "无"

    cfgdown.upactorid = 0
    cfgdown.upactorname = "无"
     Actor.sendTipmsg(sysarg,"解除下线成功！",ttFlyTip)
    return t.main(sysarg)
end

--type 1 接受
-- 2 拒绝
t.recall = function(sysarg,type)
    local actorid=  Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
    local cfg = GetExtendInfo(actorid)
    local var = Actor.getStaticVar(sysarg)
    type = tonumber(type)
    if type == 1 and cfg.uptag == 0 then
        local actor = System.getEntityPtrByActorID(cfg.upactorid)
        if actor == nil then
            Actor.sendTipmsg(sysarg,"玩家已离线,无法接受!",ttFlyTip)
            return
        end
        cfg.uptag = 1
       
        Actor.sendTipmsg(sysarg,"已接受"..cfg.upactorname.."的推荐",ttFlyTip)


        local upcfg = GetExtendInfo(cfg.upactorid)
        upcfg.downactorname =  Actor.getName(sysarg)
        upcfg.downactorid =  Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
     
        Actor.sendTipmsg(actor,upcfg.downactorname.."已成为了你的下线!",ttFlyTip)
		System.AddMail(cfg.upactorid, 0, 0, "推广消息 ", "尊敬的玩家您好,\\\\"..upcfg.downactorname.."已成为了你的下线!");
    elseif type == 2 then
        Actor.sendTipmsg(sysarg,"已拒绝"..cfg.upactorname.."的推荐",ttFlyTip)
        
        local actor =  System.getEntityPtrByActorID(cfg.upactorid)
        local myname=Actor.getName(sysarg)
        Actor.sendTipmsg(actor,myname.."已拒绝你的推荐",ttFlyTip)
        cfg.upactorname = "无"
        cfg.upactorid = 0
      
    end

    return t.main(sysarg)
end

t.onTXMZ = function(sysarg)
    local actorid=  Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
    local cfg = GetExtendInfo(actorid)
    if cfg.downactorname ~= "无" then
       Actor.sendTipmsg(sysarg,"已有推荐玩家,无法再次推荐!",ttFlyTip)
       return
    end

    local netPack = DataPack.allocPacket(sysarg,LogicCmd.miscSys.sysId,LogicCmd.miscSys.sub.sExtend)
	DataPack.flush(netPack)
end

function GetExtendInfo(actorid)
   -- local actorid =
   local pActor = System.getEntityPtrByActorID(actorid)
    local sVar= System.getStaticVar()
    if sVar.Extend == nil then 
        sVar.Extend = {} 
        sVar.Extend.count =0
        sVar.Extend.Table = {}
    end
    for i = 1,sVar.Extend.count do
        local cfg = sVar.Extend.Table[i]
        if cfg.actorid == actorid then
            return cfg
        end

    end
    --添加空白推荐信息
    sVar.Extend.count = sVar.Extend.count+1
    sVar.Extend.Table[sVar.Extend.count] = {}
    cfg = sVar.Extend.Table[sVar.Extend.count]
    cfg.actorid = actorid
    cfg.upactorid = 0
    cfg.upactorname = "无"
    cfg.downactorid = 0
    cfg.downactorname = "无"
    cfg.vip = Actor.getIntProperty(pActor,PROP_ACTOR_VIP_GRADE)
    cfg.level = Actor.getIntProperty(pActor,PROP_CREATURE_LEVEL)
    cfg.give={}
    for i = 1,table.getn(needGive) do
        cfg.give[i] = 0
    end
    cfg.uptag = 0
    return cfg

end

--合服后第一次启动，加载游戏推广员信息
function LoadYouXiTuiGuangYuanInfo()
    local sVar= System.getStaticVar()
    System.trace("LoadYouXiTuiGuangYuanInfo Start")
    
    local szRankName = "tuiguangyuan" 
    local pRank =  Ranking.getRanking(szRankName)
    if pRank == nil then
        pRank = Ranking.add(szRankName,100000)
        if pRank ~= nil then
            Ranking.load(pRank,szRankName..".txt")
        end
        
    end
    if pRank == nil then System.trace("加载游戏推广员排行榜失败") return end
    sVar.Extend = {} 
    sVar.Extend.count =0
    sVar.Extend.Table = {}
    local count = Ranking.getRankItemCount(pRank);
	for i = 0, count-1 do
        local pRankItem = Ranking.getItemFromIndex(pRank, i);
        if pRankItem ~= nil then
            local szValue = Ranking.getSub(pRankItem,0)
            local nActorId  = 0
            if szValue ~= "-" then
                   nActorId = tonumber(szValue)
            end
            

            if nActorId ~= nil  or nActorId > 0 then
                sVar.Extend.count = sVar.Extend.count + 1
                sVar.Extend.Table[sVar.Extend.count] = {}
                local cfg = sVar.Extend.Table[sVar.Extend.count]
                cfg.actorid = nActorId
                szValue = Ranking.getSub(pRankItem,1)
                cfg.upactorid = 0
                if szValue ~= "-" then
                    cfg.upactorid = tonumber(szValue)
                end
                
                cfg.upactorname = Ranking.getSub(pRankItem,2)
                szValue =Ranking.getSub(pRankItem,3)
                cfg.downactorid = 0
                if szValue ~= "-" then
                    cfg.downactorid = tonumber(szValue)
                end
                
                cfg.downactorname = Ranking.getSub(pRankItem,4)
                szValue =Ranking.getSub(pRankItem,5)

                cfg.vip = 0
                if szValue ~= "-" then
                     cfg.vip = tonumber(szValue)
                end
                cfg.level = 0
                szValue =Ranking.getSub(pRankItem,6)
                if szValue ~= "-" then
                    cfg.level = tonumber(szValue)  
                end
                
                cfg.give={}
                local nIndex = 7
                for j = 1,table.getn(needGive) do
                    szValue = Ranking.getSub(pRankItem,nIndex)
                    cfg.give[j] = 0
                    if szValue ~= "-" then
                        cfg.give[j] = tonumber(szValue)
                    end
                    
                    nIndex = nIndex + 1
                end
                cfg.uptag = 0
                szValue =Ranking.getSub(pRankItem,nIndex)
                if szValue ~= "-" then
                    cfg.uptag = tonumber(szValue)
                end
                

            end
        end
    end
    System.trace("LoadYouXiTuiGuangYuanInfo End..count:"..count)
    Ranking.clear_ranking(pRank,false)
end
--保存推广员数据到排行榜，用于合服
function SaveYouXiTuiGuangYuanInfo()
     System.trace("SaveYouXiTuiGuangYuanInfo")
    local sVar= System.getStaticVar()
    if sVar.Extend == nil then 
        sVar.Extend = {} 
        sVar.Extend.count =0
        sVar.Extend.Table = {}
        System.trace("SaveYouXiTuiGuangYuanInfo nil，not save。")
        return
    end
    if sVar.Extend.count <= 0 then  System.trace("SaveYouXiTuiGuangYuanInfo count == 0，，not save。") return end
    local szRankName = "tuiguangyuan"
    local pRank = Ranking.getRanking(szRankName)
    if pRank == nil then 
        pRank = Ranking.add(szRankName,100000) 
        if pRank == nil then System.trace("SaveYouXiTuiGuangYuanInfo create rank error") return end
        Ranking.addColumn(pRank,"actorid")
        Ranking.addColumn(pRank,"upactorid")
        Ranking.addColumn(pRank,"upactorname")
        Ranking.addColumn(pRank,"downactorid")
        Ranking.addColumn(pRank,"downactorname")
        Ranking.addColumn(pRank,"vip")
        Ranking.addColumn(pRank,"level")
        for i = 1,table.getn(needGive) do
                Ranking.addColumn(pRank,"give"..i)
        end
        Ranking.addColumn(pRank,"uptag")
    else
        Ranking.clearRanking(pRank)
    end
    
    for i = 1,sVar.Extend.count do
        local cfg = sVar.Extend.Table[i]
        if cfg ~= nil  or cfg.actorid ~= nil and cfg.upactorid ~= nil and cfg.downactorid ~= nil then 
            if cfg.upactorid > 0 and cfg.downactorid  > 0 then
                local pRankItem = Ranking.addItem(pRank,cfg.actorid,0)
                if pRankItem ~= nil then
                    Ranking.setSub(pRankItem,0,tostring(cfg.actorid))
                    Ranking.setSub(pRankItem,1,tostring(cfg.upactorid))
                    Ranking.setSub(pRankItem,2,cfg.upactorname)
                    Ranking.setSub(pRankItem,3,tostring(cfg.downactorid))
                    Ranking.setSub(pRankItem,4,cfg.downactorname)
                    Ranking.setSub(pRankItem,5,tostring(cfg.vip))
                    Ranking.setSub(pRankItem,6,tostring(cfg.level))
                    local nIndex = 7
                    for j =1,table.getn(needGive) do
                        local nGive = 0
                        if cfg.give[j] ~= nil then
                            nGive = cfg.give[j]
                        end
                    
                        Ranking.setSub(pRankItem,nIndex,tostring(nGive))
                        nIndex = nIndex + 1
                    end
                    Ranking.setSub(pRankItem,nIndex,tostring(cfg.uptag))
                
                end
            end
            
        end
    end
    System.trace("SaveYouXiTuiGuangYuanInfo，count="..sVar.Extend.count)
    Ranking.save(pRank,"tuiguangyuan.txt",true)
end
--领取奖励
t.onLQJL = function(sysarg,index)
    local actorid=  Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
    local cfg =  GetExtendInfo(actorid)
  
    if cfg.downactorname == "无" then
        Actor.sendTipmsg(sysarg,"还没有推荐玩家,无法领取奖励.",ttFlyTip)
        return
    end
    index = tonumber(index)
  
    local job = Actor.getIntProperty(sysarg,PROP_ACTOR_VOCATION)
    local tab =  bookid[job]
    if  cfg.give[index] == nil then  cfg.give[i] = 0 end
    if  cfg.give[index] == 1 then 
        Actor.sendTipmsg(sysarg,"您已经领取过该奖励了!",ttFlyTip)
        return
    end
    --检测该玩家是否在线和符合要求
    
    local actor = System.getEntityPtrByActorID(cfg.downactorid)
    local acfg = GetExtendInfo(cfg.downactorid)
    local vip = acfg.vip
    local level =acfg.level
    if actor ~= nil then
       -- Actor.sendTipmsg(sysarg,"下线玩家已离线,无法领取奖励.",ttFlyTip)
       vip = Actor.getIntProperty(actor,PROP_ACTOR_VIP_GRADE)
        level = Actor.getIntProperty(actor,PROP_CREATURE_LEVEL)
    end
    v = level
    if needGive[index].type == 1 then
        v = vip
    end

    if v < needGive[index].v then
        Actor.sendTipmsg(sysarg,"下线玩家不符合要求,无法领取奖励.",ttFlyTip)
        return
    end
  
    if Actor.addItem(sysarg,tab[index],0,0,1,1,0,"tuijian",1) == 0 then
        Actor.sendTipmsg(sysarg,"领取奖励失败,请检查包裹是否已满.",ttFlyTip)
        return
    end
    cfg.give[index] = 1

    Actor.sendTipmsg(sysarg,"领取奖励成功!",ttFlyTip)

	local NpcName = Actor.getTalkNpcName(sysarg);
	local StrNpcE = string.format("<%s/M威龙城:118:155:%s><(x威龙城:118:155:%s)>",NpcName,NpcName,NpcName);
    System.broadcastTipmsg( string.format("<(n%s)>在%s处领取了%s", Actor.getName(sysarg), StrNpcE, Item.getItemLinkMsg(tab[index]) ) , 128);
end
function GetNpcYouXiTuiGuangYuan() return t end