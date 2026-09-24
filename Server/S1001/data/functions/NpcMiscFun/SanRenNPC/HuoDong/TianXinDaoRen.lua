--#include "data\functions\Activity\GuildBiaoChe\GuildBiaoCheEx.lua"
--#include "data\config\guild\GuildBiaocheCfg.lua" once
--#include "data\functions\guildOperate\GuildOnTimeFuc.lua" once
local t = {}
t.main = function(sysarg)
	local echo = [[
  <(c0xFF00c0ff)活动参与条件:> <(c0xFFb6946c)王城成员> <(c0xFF00FF00)]]..GuildBiaoCheCfg.YuanBao..[[元宝押金>
  <(c0xFF00c0ff)活动时间范围:> <(c0xFF00FF00)攻城结束后的21:05 - 21:20>

<(idecoLine#315)>
  <(ifragments#16#18)><(c0xFFb6946c) 王城所属行会内任意玩家所需><(c0xFF00FF00)花费]]..GuildBiaoCheCfg.YuanBao..[[元宝><(c0xFFb6946c)便可接取(押送成功后将><(c0xFF00FF00)返还]]..GuildBiaoCheCfg.YuanBao..[[元宝><(c0xFFb6946c)),每次攻城活动结束后方可接取一次;>

  <(ifragments#16#18)><(c0xFFb6946c) 镖车范围所需王城成员存在,才可以自动寻路>

  <(ifragments#16#18)><(c0xFFb6946c) 镖车押送到><(c0xFF00FF00)热血王城-九殿下><(c0xFFb6946c)处后,王城成员可获得><(c0xFF00FF00)]]..GuildBiaoCheCfg.GongXuan..[[点功勋值><(c0xFFb6946c),需要前往九殿下处领取;>

  <(ifragments#16#18)><(c0xFFb6946c) 若镖车被某行会劫取,><(c0xFF00FF00)]]..GuildBiaoCheCfg.YuanBao..[[元宝押金掉落><(c0xFFb6946c),该行会可前往><(c0xFF00FF00)热血王城-九殿下><(c0xFFb6946c)处领取奖励,其行会成员均可获得><(c0xFF00FF00)]]..GuildBiaoCheCfg.GongXuan..[[点功勋;>

  <(ifragments#16#18)><(c0xFFb6946c) 接取镖车之后，需在2小时内押送到九殿下处,超时镖车则消失,并且将><(c0xFF00FF00)]]..GuildBiaoCheCfg.YuanBao..[[元宝><(c0xFFb6946c)掉落在地上,见者可得！>

 <#BN押镖/@startYaBiao>]];

	if get_d_val(sysarg,130) == 3 then

		echo = [[
<(c0xFFb6946c)
  什么秘密?秘密没有,不过我倒是有一个宝贝,简直操碎了心..

  这个宝贝就是我女儿龙清秋,她一直想去外面见见市面,可是我担心她有危险.

  所以我就教了她我的独门秘籍分身术,打算让她本体留家,分身跟随你前去闯荡见识.

  相信你也是小有实力了,就让你带着小女这一分身去吧.

>
  <#c0xFFFFFF00#好,令媛跟着我不会有事的!/@onYinCangRW,1>

  <#c0xFFFFFF00#我不要拖油瓶../@exit>

]];
	end

	if get_d_val(sysarg,130) == 4 and Pet.getPetCountById(sysarg, 774) ~= 0 then

		echo = [[
<(c0xFFb6946c)
  好好照顾我女儿,虽然只是分身,但是也望不要马虎.. 
>
]];

	end

    if get_d_val(sysarg,130) == 4 and Pet.getPetCountById(sysarg, 774) == 0 then

        local echos = "妈蛋,说好了照顾好我的宝贝女儿的呢?我不想和你说话!";
        Actor.sendTipmsg(sysarg,echos,128)
    end

	return echo;

end

t.onYinCangRW = function(sysarg,idx)
	if not idx then return; end
	idx = tonumber(idx);
	if idx == 1 and get_d_val(sysarg,130) == 3 then
        Pet.addPet(sysarg,774,1,319);
		set_d_val(sysarg, 130, 4);
		return t.main(sysarg);
	end
end

t.startYaBiao = function(sysarg)
    --是否是王城城主
    local nActorId = Guild.getSbkCityOwner()
     local week = System.getDayOfWeek()

    if not CheckSbkGuildWarTime() then 
         Actor.sendTipmsg(sysarg,"只允许在攻城战结束后押镖!",ttFlyTip)
        return
    end
    --活动时间是否已到
    local nHour,nMin,nSec = System.getTime()
    local nYear,nMon,nDay = System.getDate()
    if not System.isInDateRange(nYear,nMon,nDay,21,5,0,nYear,nMon,nDay,21,20,0) then 
         Actor.sendTipmsg(sysarg,"活动时间未到,无法押行会镖车!",ttFlyTip)
        return
    end
    if Actor.getGuildId(sysarg) == 0 then
        Actor.sendTipmsg(sysarg,"您还未加入行会，无法押行会镖车!",ttFlyTip)
        return
    end
    if Actor.getGuildId(sysarg) ~= System.getSbkGuildId() then
        Actor.sendTipmsg(sysarg,"您不是王城成员，无法押行会镖车!",ttFlyTip)
        return
    end
    
    local sVar = System.getDyanmicVar()
  
    if sVar.guildChe ~= nil and sVar.guildChe.Ptr ~= nil then
           Actor.sendTipmsg(sysarg,"已经接镖，无法再次接镖!",ttFlyTip)
        return
    end
    --镖车已被打死
    if sVar.guildbiaochegive ~= nil  then
        Actor.sendTipmsg(sysarg,"只能接一次镖",ttFlyTip)
        return
    end
    --检查元宝
    local nNeedMoney = GuildBiaoCheCfg.YuanBao
    if Actor.getMoneyCount(sysarg,mtYuanbao) < nNeedMoney then
        Actor.sendTipmsg(sysarg,"元宝不足"..nNeedMoney..",无法押镖!",ttFlyTip)
        return
    end
    Actor.changeMoney(sysarg,mtYuanbao,-nNeedMoney,LogIds.guildyabiao,"行会押镖")

    --创建镖车
    local nSceneId = Actor.getSceneId(sysarg)
    local hScene = Fuben.getSceneHandleById(nSceneId, 0)  --获得场景句柄 普通场景0

	local pPtr = Fuben.createMonster(hScene,GuildBiaoCheCfg.MonsterId, GuildBiaoCheCfg.x, GuildBiaoCheCfg.y, 0)
    Guild.setMonsterOwenrGuildId(pPtr,Actor.getGuildId(sysarg)) --设置该怪物所属行会id
    local sGuildName = Guild.getGuildName(Actor.getGuildId(sysarg))
    local sMonsterName = Actor.getName(pPtr).."\\"..sGuildName
    Actor.setMonsterName(pPtr,sMonsterName)
    
    --记录到全局变量
    sVar.guildChe = {}
    sVar.guildChe.masterId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
    sVar.guildChe.win = nil --胜利的行会id
    sVar.guildChe.Ptr = Actor.getHandle(pPtr)
  
  
    --触发目标点定时器
    System.addTimer("GuildCheRunTime",1000,-1)
    local str = "<(n%s)>有钱就是任性,毫不犹豫的接取了皇家镖车,传闻皇家镖车携带大量功勋.试问谁敢一夺？"
    System.broadcastTipmsg(string.format(str,Actor.getName(sysarg)),ttChatWindow)
    --添加延时消失定时器
    System.addTimer("GuildCheDelayTime",GuildBiaoCheCfg.DelayTime,1)
    Guild.broadcastTipmsg(Actor.getGuildId(sysarg),"行会镖车已经出发，请行会成员前去支援护送镖车达到热血王城",ttChatWindow)

end

--二个小时了
function GuildCheDelayTime()
    local sVar = System.getDyanmicVar()
    System.deleteTimer("GuildCheRunTime")
    if sVar.guildChe ~= nil then
        local ptr = sVar.guildChe.Ptr
        local pMonster = Actor.getEntity(ptr)
        if pMonster ~= nil then
             EndGuildBiaoChe(pMonster)
             Fuben.clearMonster(ptr)
        end
       
       
        System.broadcastTipmsg("震惊!皇家镖车竟然未能在2小时内押送至王城,结果元宝掉了一地,可惜啊可惜！",ttChatWindow)
    end

end
--行会镖车活动开始
function StartGuildChe()
	if System.isCrossServer() ==true then
		return 
	end
     --local week = System.getDayOfWeek()
    if not CheckSbkGuildWarTime() then 
        return
    end
    System.broadcastTipmsg("皇家镖车装载完毕,王城行会所有成员需在21:05-21:20之间将镖车护送至热血王城-九殿下处可获得"..GuildBiaoCheCfg.GongXuan.."点功勋.前往威龙城-天心道人处接取<(x威龙城:157:147:[传])> ",ttChatWindow)
   
end

function GetNpcTianXinDaoRen() return t end