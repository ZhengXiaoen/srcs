--仓库管理员
--#include "data\config\item\BagConfig.lua" once

local t = {}

t.main = function(sysarg)
	local echo = [[
<(c0xFFb6946c)
    您可以把一些重要的东西寄存在我这里.
    然后你需要兑换金条的话,我也可以帮到你哟.
>
    <(iitem#82#1)> <兑换金条/@jt,1|需要非绑定金币: 202,000> 
    <(iitem#83#1)> <兑换金砖/@jt,2|需要非绑定金币: 606,000>
    <(iitem#84#1)> <兑换大金砖/@jt,3|需要非绑定金币: 1,010,000>

<#BN打开仓库/@ShowStorageWin>
	]];

	if get_d_val(sysarg,130) == 1 then

		echo = [[
<(c0xFFb6946c)
  哈喽,你好哇,有什么可以帮你的呢?

  你居然是那个老玻璃喊来的帮手?真是无耻至极啊,那老玻璃偷看我洗澡被我发现之下还恶人先告状说我偷了他的破拐杖,现在居然还叫你过来气我...

  哎呀,好气啊啊啊#＠＄##＄#％％...
>
  <#c0xFFFFFF00#我只是路过,并非那个老混蛋的帮手,不要误会啊!/@onYinCangRW,1>

  <#c0xFFFFFF00#哎哟,小娘子,看看又有何妨,又不会少块肉呢./@onYinCangRW,2>

]];
	end

	if get_d_val(sysarg,130) == 2 then

		echo = [[
<(c0xFFb6946c)
  算了不提这个事情了,想想就生气..

  我最近在研究那个>]]..Item.getItemLinkMsg(491)..[[<(c0xFFb6946c),你能去帮我弄2张过来吗?

  事后你去找找威龙城的天心道人吧,别忘了哟..
>
  <#c0xFFFFFF00#我已经找到了,这就给你../@onYinCangRW,3>

  <#c0xFFFFFF00#我现在就去找./@exit>

]];
	end

	local current = Item.getBagItemCount(sysarg) + Item.getBagEmptyGridCount(sysarg)
	if current >= 72 and current < BagConfig.max then
		local count = math.min(8, BagConfig.max - current)
		local price = count * BagConfig.growPrice.default[2]
		echo = echo .. string.format("\n<#BL扩容背包%d格/@expandBag|消耗%d元宝，当前%d/%d格>", count, price, current, BagConfig.max)
	end
	return echo;
end

t.onYinCangRW = function(sysarg,idx)
	if not idx then return; end
	idx = tonumber(idx);
	if idx == 2 then
		Actor.addEffect(sysarg, 13, 6, 2500, 0);
		local hp = Actor.getIntProperty(sysarg,PROP_CREATURE_HP);
		local sethp = hp - 10000;
		if sethp <= 0 then
			sethp = 0;
		end
		Actor.setIntProperty(sysarg,PROP_CREATURE_HP, sethp);
		Actor.sendTipmsg(sysarg, "劈死你个混蛋! 无耻! 淫贼!", 4);
		if sethp <= 0 then
			System.broadcastTipmsg(string.format("<%s>被仓库管理员召唤的天雷劈死了..", Actor.getName(sysarg)), ttChatWindow);
		else
			System.broadcastTipmsg(string.format("<%s>被仓库管理员召唤天雷劈了,减少1万点生命值..", Actor.getName(sysarg)), ttChatWindow);
		end
	end
	if idx == 1 then
		set_d_val(sysarg, 130, 2);
		return t.main(sysarg);
	end
	if idx == 3 then
	    System.trace("onYinCangRW "..Actor.getIntProperty(sysarg,PROP_ENTITY_ID))
--		if Actor.getItemCount(sysarg,  491) < 2 then
--            Actor.sendTipmsg(sysarg, string.format("说好的<%s>张<%s>呢?", 2, Item.getItemName(491)), 4);
--            return ;
--        end

--		Actor.changeMoney(sysarg, 1, 1000008, 114, "主线任务奖励金钱");
--		Actor.removeItem(sysarg, 491, 2, -1,-1,-1);

		set_d_val(sysarg, 130, 3);
--		Actor.sendTipmsg(sysarg, "\\非常感谢你,这点金币给你作为报酬吧.\\出门在外,没钱不行的..\\\\对了,威龙城的天心道人身上有藏着大秘密..\\拯救世界维护世界和平的任务就交给你了!", 4);
--		System.broadcastTipmsg(string.format("<%s>帮助<仓库管理员>获得<%s>金币任务奖励.", Actor.getName(sysarg), 1000008), ttChatWindow);
		return t.main(sysarg);
	end
end

t.expandBag = function(sysarg)
	local current = Item.getBagItemCount(sysarg) + Item.getBagEmptyGridCount(sysarg)
	if current < 72 then
		Actor.sendTipmsg(sysarg, "请先通过原有方式开启背包至72格", 4)
		return t.main(sysarg)
	end
	if current >= BagConfig.max then
		Actor.sendTipmsg(sysarg, "背包已达到256格上限", 4)
		return t.main(sysarg)
	end

	local count = math.min(8, BagConfig.max - current)
	local price = count * BagConfig.growPrice.default[2]
	if Actor.getMoneyCount(sysarg, 3) < price or
		not Actor.changeMoney(sysarg, 3, -price, GameLog.clStoreBuyMoney, "背包扩容") then
		Actor.sendTipmsg(sysarg, string.format("扩容需要%d元宝", price), 4)
		return t.main(sysarg)
	end
	if not Actor.enlargeBag(sysarg, count) then
		Actor.changeMoney(sysarg, 3, price, GameLog.clStoreBuyMoney, "背包扩容失败退款")
		Actor.sendTipmsg(sysarg, "背包扩容失败，元宝已退回", 4)
		return t.main(sysarg)
	end
	Actor.sendTipmsg(sysarg, string.format("背包已扩容至%d格", current + count), 4)
	return t.main(sysarg)
end

t.jt = function(sysarg,idx)
	if not idx then return; end
	idx = tonumber(idx);
	local itemid,gold = 0,0;
	if idx == 1 then
		itemid = 82;
		gold = 202000;
	end
	if idx == 2 then
		itemid = 83;
		gold = 606000;
	end
	if idx == 3 then
		itemid = 84;
		gold = 1010000;
	end
	if Actor.getMoneyCount(sysarg,1) < gold then Actor.sendTipmsg(sysarg,string.format("您的金币不足 <%s> ,兑换失败...",gold), 256); return; end
	if Item.getBagEmptyGridCount(sysarg) < 1 then Actor.sendTipmsg(sysarg,string.format("您的包裹格子空格数不足%s,兑换失败...",1), 256); return; end
	Actor.changeMoney(sysarg,1,-gold,101,"仓库管理员");
	Actor.addItem(sysarg,itemid,0,0,1,0,"strongduihuan",1);
	Actor.sendTipmsg(sysarg, "兑换成功.", 256);
end

function GetNpcCangKuNPC() return t end