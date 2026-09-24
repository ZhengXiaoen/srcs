
local t = {}
t.main = function(sysarg)
	local echo = [[


  <(c0xFF00c0ff)活动时间:> <(c0xFF00FF00)攻城战开启时便可购买.
        首次开区第三日,往后每周二,四,六的20：00-21.00>
        
  <(c0xFF00c0ff)石车售价:> <(c0xFFff9000)价格为500元宝>

<(idecoLine#315)>

  <(ifragments#16#18)><(c0xFFb6946c) 每一个行会只可购买一个,每次只能召唤1辆投石车，投石车被打掉后可以再次召唤>
  <(ifragments#16#18)><(c0xFFb6946c) 最多可放置8架石车,太多了雕像受不了>
  <(ifragments#16#18)><(c0xFFb6946c) 投石车可自动攻击城主雕像,加快进攻的速度>

    <#BN购买投石车/@BuyWarWeapon>
]];

    
	return echo;

end


--购买投石车
t.BuyWarWeapon = function(sysarg)
    local point =
    {
        {x=87,y=71,},
        {x=92,y=75,},
        {x=93,y=81,},
        {x=92,y=87,},
        {x=87,y=90,},
        {x=82,y=87,},
        {x=79,y=81,},
        {x=82,y=75,},
    }
    local guild = Actor.getGuildId(sysarg)
    local gVar = System.getDyanmicVar()
	
    if gVar.StartSbkWarFlag ~= 1 then
        Actor.sendTipmsg(sysarg,"攻城战尚未开启，无法购买投石车!",ttFlyTip)
        return
    end
    if guild == 0 then
        Actor.sendTipmsg(sysarg,"还未加入行会，无法购买投石车!",ttFlyTip)
        return
    end
    local sGuildName = Actor.getGuildName(sysarg)
    local nSceneId = Actor.getSceneId(sysarg)
    local hscene = Fuben.getSceneHandleById(nSceneId,0)
    if guild == System.getSbkGuildId() then
        Actor.sendTipmsg(sysarg,"王城成员无法购买投石车!",ttFlyTip)
        return
    end
    --取当前场景是否存在雕像
    if  Fuben.getMonsterPtrById(hscene,714) == nil then
        Actor.sendTipmsg(sysarg,"雕像已被击杀，无法购买投石车!",ttFlyTip)
        return
    end
    --元宝不足
    local nNeedMoney = 500
    if Actor.getMoneyCount(sysarg,mtYuanbao) < nNeedMoney then
        Actor.sendTipmsg(sysarg,"元宝不足500，无法购买投石车!",ttFlyTip)
        return
    end
    --扣除元宝
    Actor.changeMoney(sysarg,mtYuanbao,-nNeedMoney,LogIds.buysbkweapon,"sbkweapon")
    local listMonster = LuaHelp.getSceneMonsterListById(Actor.getScenePtr(sysarg),778)
  
    
    local nIndex = 0
    if listMonster ~= nil then
        nIndex = #listMonster
        for i=1,#listMonster do
            local pMonsterPtr = listMonster[i]
            if Guild.getMonsterOwnerGuildId(pMonsterPtr) == guild then
                 Actor.sendTipmsg(sysarg,"本行会已购买投石车，请勿重复购买!",ttFlyTip)
                return
            end
        end
    end
   
    nIndex = nIndex + 1
    if nIndex > table.getn(point) then
         Actor.sendTipmsg(sysarg,"投石车已满，无法购买!",ttFlyTip)
         return
    end

    local nSceneId = Actor.getSceneId(sysarg)
    local hScene = Fuben.getSceneHandleById(nSceneId, 0)  --获得场景句柄 普通场景0
	local x = point[nIndex].x
	local y = point[nIndex].y
	local pPtr = Fuben.createMonster(hScene, 778, x, y, 0)
    Guild.setMonsterOwenrGuildId(pPtr,guild) --设置该怪物所属行会id

    Actor.setMonsterName(pPtr,"攻城车("..sGuildName..")")
end

function GetNpcJunHuoShangRen() return t end