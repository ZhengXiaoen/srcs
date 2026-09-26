--特权
--#include "data\config\SpecialTitleCfg.lua" once
--#include "data\config\item\RecycledItems.lua" once
--玩家登录
function SpecialTitle_OnActorLogin(sysarg)
    
    --检查过期时间
    local bAllHave = true
	--local var = GetSpecialTitleVar(sysarg)
    -- for i =1,table.getn(SpecialTitleCfg.title) do
    --    if not IsSpeciaTitleVip(sysarg,SpecialTitleCfg.title[i].id) then
    --        bAllHave = false
    --    end
    -- end
	bAllHave=IsSpeciaTitleVipAll(sysarg)
	
     --是否拥有所有特权vip- 给予称号
     if bAllHave == true then
        Actor.setTopTitle(sysarg,SpecialTitleCfg.headtitleid,true)
        
     end
	
	local myJob = Actor.getIntProperty( sysarg, PROP_ACTOR_VOCATION )
		
	 --添加buff
	if IsSpeciaTitleVip(sysarg,1)==true then 
		for i=1,#SpecialTitleCfg.title[1].buffid do 
			if Actor.hasBuffById(sysarg,SpecialTitleCfg.title[1].buffid[i])== false then --没有这个buff就添加上
				Actor.addBuffById(sysarg,SpecialTitleCfg.title[1].buffid[i])
			end
		end
		if Actor.hasBuffById(sysarg,SpecialTitleCfg.title[1].buffid2[myJob])== false then --没有这个buff就添加上
			Actor.addBuffById(sysarg,SpecialTitleCfg.title[1].buffid2[myJob])
		end	
	else --删除buff
		for i=1,#SpecialTitleCfg.title[1].buffid do 
			if Actor.hasBuffById(sysarg,SpecialTitleCfg.title[1].buffid[i])== true then --没有这个buff就添加上
				Actor.delBuffById(sysarg,SpecialTitleCfg.title[1].buffid[i])
			end
		end
		if Actor.hasBuffById(sysarg,SpecialTitleCfg.title[1].buffid2[myJob])== true then --没有这个buff就添加上
			Actor.delBuffById(sysarg,SpecialTitleCfg.title[1].buffid2[myJob])
		end	
	end
	
	
	if IsSpeciaTitleVip(sysarg,2)==true then 
		for i=1,#SpecialTitleCfg.title[2].buffid do 
			if Actor.hasBuffById(sysarg,SpecialTitleCfg.title[2].buffid[i])== false then --没有这个buff就添加上
				Actor.addBuffById(sysarg,SpecialTitleCfg.title[2].buffid[i])
			end
		end
		if Actor.hasBuffById(sysarg,SpecialTitleCfg.title[2].buffid2[myJob])== false then --没有这个buff就添加上
			Actor.addBuffById(sysarg,SpecialTitleCfg.title[2].buffid2[myJob])
		end	
	else 
		for i=1,#SpecialTitleCfg.title[2].buffid do 
			if Actor.hasBuffById(sysarg,SpecialTitleCfg.title[2].buffid[i])== true then --没有这个buff就添加上
				Actor.delBuffById(sysarg,SpecialTitleCfg.title[2].buffid[i])
			end
		end
		if Actor.hasBuffById(sysarg,SpecialTitleCfg.title[2].buffid2[myJob])== true then --没有这个buff就添加上
			Actor.delBuffById(sysarg,SpecialTitleCfg.title[2].buffid2[myJob])
		end	
	end
	
	
	if IsSpeciaTitleVip(sysarg,3)==true then 
		for i=1,#SpecialTitleCfg.title[3].buffid do 
			if Actor.hasBuffById(sysarg,SpecialTitleCfg.title[3].buffid[i])== false then --没有这个buff就添加上
				Actor.addBuffById(sysarg,SpecialTitleCfg.title[3].buffid[i])
			end
		end
		if Actor.hasBuffById(sysarg,SpecialTitleCfg.title[3].buffid2[myJob])== false then --没有这个buff就添加上
			Actor.addBuffById(sysarg,SpecialTitleCfg.title[3].buffid2[myJob])
		end	
	else 
		for i=1,#SpecialTitleCfg.title[3].buffid do 
			if Actor.hasBuffById(sysarg,SpecialTitleCfg.title[3].buffid[i])== true then --没有这个buff就添加上
				Actor.delBuffById(sysarg,SpecialTitleCfg.title[3].buffid[i])
			end
		end
		if Actor.hasBuffById(sysarg,SpecialTitleCfg.title[3].buffid2[myJob])== true then --没有这个buff就添加上
			Actor.delBuffById(sysarg,SpecialTitleCfg.title[3].buffid2[myJob])
		end	
        local var = Actor.getStaticVar(sysarg)
        --删除自动回收
        for i = 2,12 do
		    local d = RecycledItems[i];
		    --(跳过上古战装,起源套装,誓言套装)
		    if d.title ~= "上古套装" and  d.title ~= "起源套装" and  d.title ~= "誓言套装" then 
			    local v = 117 + i;
			    set_d_val(sysarg,v,0)
		    end
	    end

        for i=13,19 do 
		    local d = RecycledItems[i];
		    --(跳过上古战装,起源套装,誓言套装)
		    if d.title ~= "上古套装" and  d.title ~= "起源套装" and  d.title ~= "誓言套装" then 
			    local v = i;
			    
			    if var.dealAutoSell ==nil then 
				    var.dealAutoSell={}
			    end
                var.dealAutoSell[v] = 0
		    end
	    end
        var.autorecoyhufu = nil
        var.autoUseGemFragments = nil
        var.autoUseHolyPearlFragments = nil
        var.autoUseMaterials = 0
	end
	
	Actor.deleteTimer(sysarg,31)
    Actor.addTimer(sysarg,31,1000 * 60)
end

--增加特权时间
--id= 1.青铜 2.白银 3.黄金
--time 秒
function AddSpecialTitleTime(sysarg,id,time)
    local var = GetSpecialTitleVar(sysarg)
    if var[id] == nil then var[id] = 0 end
    --开始计时
    if var[id] == 0 then
        var[id] = System.getCurrMiniTime() + time
    else --续期
        var[id] = var[id] + time
    end
end

--获取特权剩余时间- 返回: 剩余秒,剩余天
function GetSpecialTitleSurplusTime(sysarg,id)
    local var = GetSpecialTitleVar(sysarg)
    if var[id] == nil or var[id] == 0 then return 0 end
    local sec = var[id] - System.getCurrMiniTime()
	if sec<=0 then 
		return 0,0
	else 
		return sec,math.ceil((sec) / 1000 / 60 / 24)
	end
end
--是否特权vip id= 1.青铜 2.白银 3.黄金
function IsSpeciaTitleVip(sysarg,id)
    local var = GetSpecialTitleVar(sysarg)
    if var[id] == nil or var[id] == 0 then  return false end
    if System.getCurrMiniTime() > var[id] then 
        var[id] = 0
        return false
    end
    return true
end

--是否拥有全部特权
function IsSpeciaTitleVipAll(sysarg)
	
	for i =1,table.getn(SpecialTitleCfg.title) do
		local var = GetSpecialTitleVar(sysarg)
		if var[i] == nil or var[i] == 0 then  return false end
		if System.getCurrMiniTime() > var[i] then 
			var[i] = 0
			return false
		end
	end
	return true
end

--获取特权变量
function GetSpecialTitleVar(sysarg)
    local var = Actor.getStaticVar(sysarg)
    if var.specialTitle == nil then  var.specialTitle = {} end
    return var.specialTitle
end