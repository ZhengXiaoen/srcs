local t = {

	--中级装备箱
	z = {
		{364,50},--散人剑⑤
		{365,50},--散人甲(男)⑤
		{366,50},--散人甲(女)⑤
		{367,50},--散人盔⑤
		{368,50},--散人链⑤
		{369,50},--散人镯⑤
		{370,50},--散人戒⑤
		{371,50},--散人带⑤
		{372,50},--散人靴⑤
		{394,50},--散人剑⑥
		{395,20},--散人甲(男)⑥
		{396,20},--散人甲(女)⑥
		{397,20},--散人盔⑥
		{398,20},--散人链⑥
		{399,20},--散人镯⑥
		{400,20},--散人戒⑥
		{401,20},--散人带⑥
		{402,20},--散人靴⑥
		{403,10},--散人剑⑦
		{404,10},--散人甲(男)⑦
		{405,10},--散人甲(女)⑦
		{406,10},--散人盔⑦
		{407,10},--散人链⑦
		{408,10},--散人镯⑦
		{409,10},--散人戒⑦
		{410,10},--散人带⑦
		{411,10},--散人靴⑦
	},
	--高级装备箱
	g = {
		{403,50},--散人剑⑦
		{404,50},--散人甲(男)⑦
		{405,50},--散人甲(女)⑦
		{406,50},--散人盔⑦
		{407,50},--散人链⑦
		{408,50},--散人镯⑦
		{409,50},--散人戒⑦
		{410,50},--散人带⑦
		{411,50},--散人靴⑦
		{412,50},--散人剑⑧
		{413,30},--散人甲(男)⑧
		{414,30},--散人甲(女)⑧
		{415,30},--散人盔⑧
		{416,30},--散人链⑧
		{417,30},--散人镯⑧
		{418,30},--散人戒⑧
		{419,30},--散人带⑧
		{420,30},--散人靴⑧
		{421,20},--散人剑⑨
		{422,20},--散人甲(男)⑨
		{423,20},--散人甲(女)⑨
		{424,20},--散人盔⑨
		{425,20},--散人链⑨
		{426,20},--散人镯⑨
		{427,20},--散人戒⑨
		{428,20},--散人带⑨
		{429,20},--散人靴⑨
		{430,10},--霸主之刃
		{431,10},--霸主之甲(男)
		{432,10},--霸主之甲(女)
		{433,10},--霸主之盔
		{434,10},--霸主之链
		{435,10},--霸主之镯
		{436,10},--霸主之戒
		{437,10},--霸主之带
		{438,10},--霸主之靴

	},

};

	--318 装备升阶石

t.main = function(sysarg)
	local var = Actor.getStaticVar(sysarg);
	local bx = var.bx;
	if bx == nil then var.bx = {}; bx = var.bx; end
	local ts = "开启则消耗1个宝箱#然后刷新奖品列表#然后就可以随机领取1件奖品##每个宝箱可随机领取5次##(宝箱可以通过新区特惠活动购买获得或是通过其他活动或BOSS)";
	local sss = "";
	local ooo = "";
	
	if bx[13] then
		if bx[13] <= 5 and bx[13] > 0 then
			ooo = string.format("当前还可领取 <%s> / 5 次<(c0xFF888888)(首次领取免费)>\\\\", bx[13]);
		end
	end

	if #bx > 0 then
		sss = "<#BN随机领取1件/@onZBXLQ>";
	else
		sss = "";
	end

	if bx[13] then
		if bx[13] < 5 then
			if bx[13] <= 0 then
				var.bx = {};
				bx = var.bx;
				sss = "";
			else
				sss = string.format("<#BN%s元宝随机1件/@onZBXLQ>", (5 - bx[13])*100);
			end
		end
	end

	local e = [[

  <(c0xFF705e45)请选择您想要开启的宝箱,免费开启的哟.>
  <#BP开启中阶装备箱/@onOpenBX,1/24/52/]]..ts..[[>  <#BP开启高阶装备箱/@onOpenBX,2/166/52/]]..ts..[[>
  

  <(c0xFF705e45)领取以下随机一件装备.>

<(idecoLine#330)>	

]]


	for i = 1,#bx do
		if bx[i] then
			if i==6 then 
				e=e..string.format("  \\") 
			end 
			--e = e .. string.format("  %s\\", Item.getItemLinkMsg(bx[i]));
			e=e..string.format("  <(iitem#%s#%s#)>",bx[i],1);
		end
	end


	e = e .. sss..[[
	
	
	
	
	
	
	
	
								
          ]]..ooo;
	return e;
end

t.onZBXLQ = function(sysarg)
	if Item.getBagEmptyGridCount(sysarg) < 1 then Actor.sendTipmsg(sysarg, "您的背包已满,清理背包后再来吧.", 256); return t.main(sysarg); end

	local var = Actor.getStaticVar(sysarg);
	local bx = var.bx;
	if bx == nil then var.bx = {}; bx = var.bx; end

	local del_ngold = (5 - bx[13]) * 100;
	if Actor.getMoneyCount(sysarg,3) < del_ngold then
		Actor.sendTipmsg(sysarg, string.format("您的元宝不足 <%s> ,领取失败..",del_ngold), 256);
		return t.main(sysarg);
	end

	if bx[13] > 0 and bx[#bx-1] then
		bx[13] = bx[13] - 1;
		local sjs = math.random(1,#bx);
		if not bx[sjs] then sjs = 1; end
		if bx[sjs] <= 5 then sjs = 1; end
		local id = bx[sjs];
		Actor.changeMoney(sysarg, 3, -del_ngold,2607,"开启装备箱");
		if del_ngold==0 then 
			Actor.addItem(sysarg, id, 0, 0, 1,1,0,"开启装备箱",1,-1,0,-1,1,System.getRandomNumber(6)+1);
		else 
			Actor.addItem(sysarg, id, 0, 0, 1,0,0,"开启装备箱",1,-1,0,-1,1,System.getRandomNumber(6)+1);
		end
	end
	return t.main(sysarg);
end

t.onOpenBX = function(sysarg,idx)
	if not idx then return; end
	idx = tonumber(idx);
	local var = Actor.getStaticVar(sysarg);
	local bx = var.bx;
	--var.bx = {};
	--bx = var.bx;

	if idx == 1 then
		local item = 374;
		if Actor.getItemCount(sysarg, item) < 1 then
			Actor.sendTipmsg(sysarg, string.format("您的 <%s> 不足,开启失败.", Item.getItemName(item)), 256);
			return t.main(sysarg);
		end
		if bx[13]~=nil and bx[13] >0 then 
			WhenonOpenBX_and_SomeBXleft(sysarg,bx[13],1)
		else 
			opennewone_sureFunc(sysarg,1)
		end
		
		--Actor.removeItem(sysarg, item, 1, -1,-1,-1);
		--local z = t.z;
		--local a = {};
		--for i = 1,#z do
		--	local j = math.random(1,100);
		--	if j <= z[i][2] then
		--		table.insert( a, z[i][1]);
		--	end
		--end
		--for i = 1,#a do
		--	if i <= 10 then
		--		bx[i] = a[i];
		--	end
		--end
		--bx[13] = 5;
	end
	if idx == 2 then
		local item = 373;
		if Actor.getItemCount(sysarg, item) < 1 then
			Actor.sendTipmsg(sysarg, string.format("您的 <%s> 不足,开启失败.", Item.getItemName(item)), 256);
			return t.main(sysarg);
		end
		
		if bx[13]~=nil and bx[13] >0 then 
			WhenonOpenBX_and_SomeBXleft(sysarg,bx[13],2)
		else 
			opennewone_sureFunc(sysarg,2)
		end
		
		
		--Actor.removeItem(sysarg, item, 1, -1,-1,-1);
		--local z = t.g;
		--local a = {};
		--for i = 1,#z do
		--	local j = math.random(1,100);
		--	if j <= z[i][2] then
		--		table.insert( a, z[i][1]);
		--	end
		--end
		--for i = 1,#a do
		--	if i <= 10 then
		--		bx[i] = a[i];
		--	end
		--end
		--bx[13] = 5;
	end
	--Actor.sendTipmsg(sysarg, "宝箱扣除成功,奖品列表已刷新,请选择.", 256);
	--return t.main(sysarg);
end

function WhenonOpenBX_and_SomeBXleft(sysarg,leftTime,index)
	local okBtn = string.format("%s/opennewone_sureFunc,%s", "确定",index)
	local cancelBtn = string.format("%s/opennewone_cancelBtn,%s", "取消",index)
	local str = "还有5次领取机会（首次免费），是否要放弃?"
	if leftTime<5 then 
		str="还有"..leftTime.."次领取机会，是否要放弃？"
	end
	Actor.messageBox(sysarg, 0, 0, str, okBtn, cancelBtn, NULL)
end

function opennewone_sureFunc(sysarg,index)

	index=tonumber(index)
	local var = Actor.getStaticVar(sysarg);
	local bx = var.bx;
	var.bx = {};
	bx = var.bx;
	local item = nil 
	local z = t.z;
	
	if index ==1 then 
		item = 374;
	elseif index ==2 then
		item = 373;
		z = t.g;
	end	

	Actor.removeItem(sysarg, item, 1, -1,-1,-1);
	
	local a = {};
	for i = 1,#z do
		local j = math.random(1,100);
		if j <= z[i][2] then
			table.insert( a, z[i][1]);
		end
	end
	
	while(#a<6)--保证至少也有6个物品开出
	do
		for i = 1,#z do
			local j = math.random(1,100);
			if j <= z[i][2] then
				local eventhas =0 
				for _,v in ipairs (a) do --遍历，已经有的就不再添加
					if v == z[i][1] then 
						eventhas=1 
					end
				end
				if eventhas == 0 then 
					table.insert( a, z[i][1])
				end
			end
			if #a>=6 then 
				break
			end
		end
	end
	
	for i = 1,#a do
		if i <= 10 then
			bx[i] = a[i];
		end
	end
	bx[13] = 5;
	
	local netPack = DataPack.allocPacket(sysarg, 0, 11)
	DataPack.writeByte(netPack, 1)
	DataPack.writeInt64(netPack, Actor.getNpc(sysarg))-- 更新数据的类型
	DataPack.writeString(netPack,GetNpcZhuangBeiBaoXiang().main(sysarg))
	DataPack.flush(netPack)

	Actor.sendTipmsg(sysarg, "宝箱扣除成功,奖品列表已刷新,请选择.", 256);
end

function opennewone_cancelBtn(sysarg,index)
	
	local netPack = DataPack.allocPacket(sysarg, 0, 11)
	DataPack.writeByte(netPack, 1)
	DataPack.writeInt64(netPack, Actor.getNpc(sysarg))-- 更新数据的类型
	DataPack.writeString(netPack,GetNpcZhuangBeiBaoXiang().main(sysarg))
	DataPack.flush(netPack)

end


---------------------------------------------------------------------------
function GetNpcZhuangBeiBaoXiang() return t end