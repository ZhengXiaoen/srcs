--行会贡献度兑换
function GuildStoreInit(sysarg)
    --Actor.setIntProperty(sysarg,PROP_ACTOR_GUILDEXP,500000);
    --\\游戏目前贡献度比例： 50000金币 = 1点贡献度 = 25元宝
    --\\经验，羽毛，护符碎片，护盾碎片，内功经验，药品（王城和皇宫地图无法兑换），战将灵力
    local contribution = Actor.getIntProperty(sysarg,PROP_ACTOR_GUILDEXP);
    local openday = System.getDaysSinceOpenServer();
    local e = "<title/行会贡献值兑换>";
    local str = {
        "今天是新区开放第 %s 天##新区前 3 天统一兑换经验为 1 点贡献值兑换 100,000 经验#新区第 4 天开始兑换经验为 1 点贡献值兑换 500,000 经验##鼠标轻轻的来点我一下就可以兑换啦",
        "每 2 点贡献值可兑换 5 根 1级羽毛#更高级的羽毛可到 威龙城 的 万事通NPC 处兑换升级获得",
        "每 100 点贡献值可兑换 5,000,000 内功经验值",
        "每 1 点贡献值可兑换 50 护符碎片(自动吃掉的)",
        "每 1 点贡献值可兑换 50 护盾碎片(自动吃掉的)",
        "每 200 点贡献值可兑换 250,000 战将灵力值(用于提升战将炼体属性)",
        "每 1000 点贡献值可兑换 10 瓶疗伤药#(如果您在王城皇宫则无法兑换)",
        "每 300 点贡献值可兑换 10 个万年人参#(如果您在王城皇宫则无法兑换)",
    };

--   <兑换经验/@oncontribution_DH,1|]]..string.format(str[1],openday)..[[> <兑换羽毛/@oncontribution_DH,2|]]..str[2]..[[> <兑换内功经验/@oncontribution_DH,3|]]..str[3]..[[>

--   <兑换护符碎片/@oncontribution_DH,4|]]..str[4]..[[> <兑换护盾碎片/@oncontribution_DH,5|]]..str[5]..[[> <兑换战将灵力值/@oncontribution_DH,6|]]..str[6]..[[>

-- <兑换5个万年人参/@oncontribution_DH,8|]]..str[8]..[[>

    e = e .. [[

  <(c0xFFeabc78)您当前拥有贡献值:> <(c0xFF00FF00)]]..contribution..[[>
  <(c0xFF888888)(行会捐献或多余装备丢到行会仓库中会或得贡献值)>

<(idecoLine#315)>

  <兑换10瓶疗伤药/@oncontribution_DH,7|]]..str[7]..[[>

    ]];
    return e;
end

function oncontribution_DH(sysarg,idx)
    if not idx then return; end
    idx = tonumber(idx);
    local contribution = Actor.getIntProperty(sysarg,PROP_ACTOR_GUILDEXP);
    if idx ~= 7 then
        System.trace("外挂刷东西oncontribution_DH idx:"..idx.."contribution:"..contribution.."name:"..Actor.getName(sysarg))
        return
    end
    if idx == 1 then
        local dev = 1;
        local addExp = 100000;
        if contribution < dev then
            Actor.sendTipmsg(sysarg,string.format("您的贡献值不足 <%s> ,兑换失败...",dev), 256);
            return;
        end
        local openday = System.getDaysSinceOpenServer();
        if openday >= 4 then addExp = 500000; end
        Actor.setIntProperty(sysarg,PROP_ACTOR_GUILDEXP,contribution - dev);
    	Actor.addExp(sysarg, addExp);
	    Actor.sendTipmsg(sysarg,"兑换经验成功.",256);
    elseif idx == 2 then
        local dev = 2;
        local addym = 5;
        if contribution < dev then
            Actor.sendTipmsg(sysarg,string.format("您的贡献值不足 <%s> ,兑换失败...",dev), 256);
            return;
        end
        local emptyCount = Item.getBagEmptyGridCount(sysarg)
        if Item.getAddItemNeedGridCount(sysarg, 464, addym) > emptyCount then 
            Actor.sendTipmsg(sysarg, "背包所需空间不足,兑换失败.", 256);
            return;
        end
        Actor.setIntProperty(sysarg,PROP_ACTOR_GUILDEXP,contribution - dev);
    	Actor.addItem(sysarg,464,0,0,addym,1,0,"功勋值兑换羽毛",1)
	    Actor.sendTipmsg(sysarg,"兑换羽毛成功.",256);
    elseif idx == 3 then
        local dev = 100;
        local addNgExp = 5000000;
        if contribution < dev then
            Actor.sendTipmsg(sysarg,string.format("您的贡献值不足 <%s> ,兑换失败...",dev), 256);
            return;
        end
        Actor.setIntProperty(sysarg,PROP_ACTOR_GUILDEXP,contribution - dev);
        Actor.addInnerExp(sysarg, addNgExp);
	    Actor.sendTipmsg(sysarg,"兑换内功经验值成功.",256);
    elseif idx == 4 then
        local dev = 1;
        local addnnn = 50;
        local pr = 124;
        local ps = "护符碎片";
        if contribution < dev then
            Actor.sendTipmsg(sysarg,string.format("您的贡献值不足 <%s> ,兑换失败...",dev), 256);
            return;
        end
        Actor.setIntProperty(sysarg,PROP_ACTOR_GUILDEXP,contribution - dev);
        local val = Actor.getUIntProperty(sysarg, pr);
        val = val + addnnn;
        Actor.setUIntProperty(sysarg, pr, val)
	    Actor.sendTipmsg(sysarg,"兑换"..ps.."成功.",256);
        Actor.sendTipmsg(sysarg,string.format("<(c0xFF00ff00)获得> <(c0xFF00aaff)%s%s>", addnnn, ps),1);
    elseif idx == 5 then
        local dev = 1;
        local addnnn = 50;
        local pr = 126;
        local ps = "护盾碎片";
        if contribution < dev then
            Actor.sendTipmsg(sysarg,string.format("您的贡献值不足 <%s> ,兑换失败...",dev), 256);
            return;
        end
        Actor.setIntProperty(sysarg,PROP_ACTOR_GUILDEXP,contribution - dev);
        local val = Actor.getUIntProperty(sysarg, pr);
        val = val + addnnn;
        Actor.setUIntProperty(sysarg, pr, val)
	    Actor.sendTipmsg(sysarg,"兑换"..ps.."成功.",256);
        Actor.sendTipmsg(sysarg,string.format("<(c0xFF00ff00)获得> <(c0xFF00aaff)%s%s>", addnnn, ps),1);
    elseif idx == 6 then
        local dev = 200;
        local addnnn = 250000;
        local ps = "战将灵力值";
        if contribution < dev then
            Actor.sendTipmsg(sysarg,string.format("您的贡献值不足 <%s> ,兑换失败...",dev), 256);
            return;
        end
        Actor.setIntProperty(sysarg,PROP_ACTOR_GUILDEXP,contribution - dev);
        local nCurrMana = Hero.getHeroMana(sysarg);
        nCurrMana = nCurrMana + addnnn;
        if nCurrMana > 4294967295 then
            nCurrMana = 4294967295;
        end
        Hero.setHeroMana(sysarg, nCurrMana);
	    Actor.sendTipmsg(sysarg,"兑换"..ps.."成功.",256);
        Actor.sendTipmsg(sysarg,string.format("<(c0xFF00ff00)获得> <(c0xFF00aaff)%s%s>", addnnn, ps),1);
    elseif idx == 7 then
        local dev = 1000;
        local addnnn = 10;
        local additemid = 80;
        local additemname = Item.getItemName(additemid);
        if contribution < dev then
            Actor.sendTipmsg(sysarg,string.format("您的贡献值不足 <%s> ,兑换失败...",dev), 256);
            return;
        end
        local mid = Actor.getSceneId(sysarg);
        if mid == 11 then
            Actor.sendTipmsg(sysarg,"本地图内无法兑换此药品,尽请谅解.",256);
            return;
        end
        local emptyCount = Item.getBagEmptyGridCount(sysarg)
        if Item.getAddItemNeedGridCount(sysarg, additemid, addnnn) > emptyCount then 
            Actor.sendTipmsg(sysarg, "背包所需空间不足,兑换失败.", 256);
            return;
        end
        Actor.setIntProperty(sysarg,PROP_ACTOR_GUILDEXP,contribution - dev);
        Actor.addItem(sysarg,additemid,0,0,addnnn,1,0,"贡献值兑换"..additemname,1);
	    Actor.sendTipmsg(sysarg,"兑换"..additemname.."成功.",256);
		
		System.sendCommonLog(460,Actor.getIntProperty(sysarg, PROP_ENTITY_ID),Actor.getName(sysarg),0,contribution, contribution - dev, "","","","","","","","")
    elseif idx == 8 then
        local dev = 300;
        local addnnn = 10;
        local additemid = 81;
        local additemname = Item.getItemName(additemid);
        if contribution < dev then
            Actor.sendTipmsg(sysarg,string.format("您的贡献值不足 <%s> ,兑换失败...",dev), 256);
            return;
        end
        local mid = Actor.getSceneId(sysarg);
        if mid == 11 then
            Actor.sendTipmsg(sysarg,"本地图内无法兑换此药品,尽请谅解.",256);
            return;
        end
        local emptyCount = Item.getBagEmptyGridCount(sysarg)
        if Item.getAddItemNeedGridCount(sysarg, additemid, addnnn) > emptyCount then 
            Actor.sendTipmsg(sysarg, "背包所需空间不足,兑换失败.", 256);
            return;
        end
        Actor.setIntProperty(sysarg,PROP_ACTOR_GUILDEXP,contribution - dev);
        Actor.addItem(sysarg,additemid,0,0,addnnn,1,0,"贡献值兑换"..additemname,1);
	    Actor.sendTipmsg(sysarg,"兑换"..additemname.."成功.",256);
    end
	
	
    return GuildStoreInit(sysarg);
end
