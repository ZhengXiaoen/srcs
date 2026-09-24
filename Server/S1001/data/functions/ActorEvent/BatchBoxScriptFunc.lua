BatchBoxFunc = {}

BatchBoxFunc.main = function()
	local dlgStr = "No BatchBox Function Name";
	return dlgStr;
end
---------------------------------------------------------------------------------------------------------------------
--回收神器时装

local HSjf = {
	{636,5000,158},
	{637,5000,158},
	{638,5000,158},
	{639,5000,158},


	{665,25000,158},
	{666,25000,158},
	{671,125000,158},
	{672,125000,158},
	{677,625000,158},
	{678,625000,158},

	{640,2000,157},
	{641,2000,157},
	{642,2000,157},
	{643,2000,157},
	{644,2000,157},
	{645,2000,157},
	{646,2000,157},
	{647,2000,157},
	{729,2000,157},
	{730,2000,157},

	{667,10000,157},
	{668,10000,157},
	{669,10000,157},
	{670,10000,157},
	{673,50000,157},
	{674,50000,157},
	{675,50000,157},
	{676,50000,157},
	{679,250000,157},
	{680,250000,157},
	{681,250000,157},
	{682,250000,157},
};

BatchBoxFunc.SQSZHSSM = function(sysarg,ItemTable)
	local e = [[
多余的神器和时装可以<(c0xFFFF0000)回收>成对应的积分.

]];

	for i = 1,#HSjf do
		local a = "神器";
		if HSjf[i][3] == 157 then a = "时装"; end
		e = e .. string.format("<(c0xFFFF0000)%s>普通的可回收<(c0xFFFF0000)%s>点<(c0xFFFF0000)%s>积分\\",Item.getItemName(HSjf[i][1]),HSjf[i][2],a);
	end

	e = e .. [[

<(c0xFF888888)强化过的装备回收后获得><(c0xFF00FF00)对应强化符><(c0xFF888888)1张.>
<(c0xFF888888)极品等级越高,回收得到的><(c0xFF00FF00)对应积分><(c0xFF888888)就越高.>

]];
	Actor.sendTipmsg(sysarg,e,4);
end

BatchBoxFunc.HuiShouShenQiShiZhuang = function(sysarg,ItemTable)
	local str = {
		"请放入需要回收的时装或神器.",
		"您放入的物品无法回收为神器积分或时装积分.",
		"时装神器",
		"恭喜您成功的回收了%s,神器积分增加%s点(当前总%s点).",
		"恭喜您成功的回收了%s,时装积分增加%s点(当前总%s点).",
	};
	if not ItemTable[1] then Actor.sendTipmsg(sysarg,str[1],4); ItemTable = {}; return; end
	local ItemId = Item.getItemId(ItemTable[1]);
	
	local HSid = 0;
	local HSnum = 0;
	local HStp = 0;
	for i = 1,#HSjf do
		if HSjf[i][1] == ItemId then
			HSid = ItemId;
			HSnum = HSjf[i][2];
			HStp = HSjf[i][3];
			break;
		end
	end

	if HSnum == 0 then Actor.sendTipmsg(sysarg,str[2],4); return; end

	local ipItemSharp = Item.getItemProperty(sysarg,ItemTable[1],Item.ipItemSharp,0);
	local ipItemStrong = Item.getItemProperty(sysarg,ItemTable[1],Item.ipItemStrong,0);

	local StrongItem = 326 + ipItemStrong;
	
	if ipItemSharp > 0 then
		for u = 1,ipItemSharp do
			HSnum = HSnum + (u * 5 + 10);
		end
	end

	local var = Actor.getStaticVar(sysarg);
	local d = var.d;

	if StrongItem ~= 326 then
		Actor.addItem(sysarg,StrongItem,0,0,1,1,0,"HuiShouShenQi",1);
	end
	d[HStp] = d[HStp] + HSnum;

	Item.removeItem(sysarg,ItemTable[1],1,str[3],2);

	local a = str[4];
	if HStp == 157 then a = str[5]; end
	Actor.sendTipmsg(sysarg,string.format(a,Item.getItemName(ItemId),HSnum,d[HStp]),256+128);
	ItemTable = {};
end

---------------------------------------------------------------------------------------------------------------------
BatchBoxFunc.QuanShui104 = function(sysarg,ItemTable)
	local str = {
		"请在第1格到第5格内放入满的泉水罐,在第6格里放入需要提升的装备!",
		"您放入的第%s个泉水罐不是满的.\\等你去采集满了之后再来找我兑换吧!",
		"您放入的%s无法提升,请检查是否放错物品了!\\只有<(c0xFFFF0000)%s>,<(c0xFFFF0000)%s>,<(c0xFFFF0000)%s>可以提升.",
		"泉水",
		"恭喜您兑换%s成功!",
		"<(c0xFFd4ab6f)[><(c0xFF00ff00)%s><(c0xFFd4ab6f)]在[><(c0xFF00ff00)土城泉水涌现><(c0xFFd4ab6f)]兑换了[>%s<(c0xFFd4ab6f)],大家恭喜他吧!>",
	};
	if not ItemTable[1] then Actor.sendTipmsg(sysarg,str[1],4); ItemTable = {}; return; end
	if #ItemTable ~= 6 then Actor.sendTipmsg(sysarg,str[1],4); ItemTable = {}; return; end
	for i = 1,#ItemTable do
		if i < 6 then
			if Item.getItemId(ItemTable[i]) ~= 592 then
				Actor.sendTipmsg(sysarg,str[1],4);
				return;
			end
		end
	end
	for i = 1,#ItemTable do
		if i < 6 then
			local ipItemDua = Item.getItemProperty(sysarg,ItemTable[i],Item.ipItemDua,0);
			local ipItemDuaMax = Item.getItemProperty(sysarg,ItemTable[i],Item.ipItemDuaMax,0);
			--if ipItemDua ~= ipItemDuaMax then Actor.sendTipmsg(sysarg,string.format(str[2],i),4); return; end
			if ipItemDua <= 49000 then Actor.sendTipmsg(sysarg,string.format(str[2],i),4); return; end
		end
	end
	local ItemId6 = Item.getItemId(ItemTable[6]);
	local NewItem = {{618,621},{619,622},{620,623}};
	local nItemId = 0;
	for i = 1,#NewItem do
		if ItemId6 == NewItem[i][1] then
			nItemId = i;
			break;
		end
	end
	if nItemId == 0 then Actor.sendTipmsg(sysarg,string.format(str[3],Item.getItemName(ItemId6),Item.getItemName(NewItem[1][1]),Item.getItemName(NewItem[2][1]),Item.getItemName(NewItem[3][1])),4); return; end
	local znItemId = NewItem[nItemId][2];
	local ipItemStrong = Item.getItemProperty(sysarg,ItemTable[6],Item.ipItemStrong,0);
	local ipItemStrongLimit = Item.getItemProperty(sysarg,ItemTable[6],Item.ipItemStrongLimit,0);
	local ItemttNew = Item.createItem(znItemId,1,ipItemStrong,0,0,0);
	Item.modifyItemProperty(ItemttNew,Item.ipItemStrongLimit,ipItemStrongLimit);
	for i = 1,#ItemTable do Item.removeItem(sysarg,ItemTable[i],1,str[4],2); end
	Item.addItem(sysarg,ItemttNew,0,0,1);
	Actor.sendTipmsg(sysarg,string.format(str[5],Item.getItemLinkMsg(znItemId)),4);
	System.broadcastTipmsg(string.format(str[6],Actor.getName(sysarg),Item.getItemLinkMsg(znItemId)),128);
	ItemTable = {};
end

BatchBoxFunc.QuanShui100 = function(sysarg,ItemTable) SpringWaterEquipment(sysarg,ItemTable,615); end
BatchBoxFunc.QuanShui101 = function(sysarg,ItemTable) SpringWaterEquipment(sysarg,ItemTable,616); end
BatchBoxFunc.QuanShui102 = function(sysarg,ItemTable) SpringWaterEquipment(sysarg,ItemTable,617); end
BatchBoxFunc.QuanShui103 = function(sysarg,ItemTable) SpringWaterEquipment(sysarg,ItemTable,588); end

function SpringWaterEquipment(sysarg,ItemTable,NewItemId)
--	local ipItemDua = Item.getItemProperty(sysarg,ItemTable[1],Item.ipItemDua,0);
--	local ItemttNew = Item.createItem(592,1,0,0,0,0);
--	Item.modifyItemProperty(ItemttNew,Item.ipItemDua,49001);
--	Item.addItem(sysarg,ItemttNew,0,0,10);

	local str = {
		"请放入满的泉水罐.",
		"您放入的不是泉水罐!!!",
		"您放入的泉水罐不是满的.\\等你去采集满了之后再来找我兑换吧!",
		"泉水",
		"恭喜您兑换%s成功!",
		"<(c0xFFd4ab6f)[><(c0xFF00ff00)%s><(c0xFFd4ab6f)]在[><(c0xFF00ff00)土城泉水涌现><(c0xFFd4ab6f)]兑换了[>%s<(c0xFFd4ab6f)],大家恭喜他吧!>",
	};
	if not ItemTable[1] then Actor.sendTipmsg(sysarg,str[1],4); ItemTable = {}; return; end
	local ItemId = Item.getItemId(ItemTable[1]);
	if ItemId ~= 592 then Actor.sendTipmsg(sysarg,str[2],4); return; end
	local ipItemDua = Item.getItemProperty(sysarg,ItemTable[1],Item.ipItemDua,0);
	local ipItemDuaMax = Item.getItemProperty(sysarg,ItemTable[1],Item.ipItemDuaMax,0);
	--if ipItemDua ~= ipItemDuaMax then Actor.sendTipmsg(sysarg,str[3],4); return; end
	if ipItemDua <= 49000 then Actor.sendTipmsg(sysarg,str[3],4); return; end
	Item.removeItem(sysarg,ItemTable[1],1,str[4],2);
	Actor.addItem(sysarg,NewItemId,0,0,1,1,0,"quan shui",1);
	Actor.sendTipmsg(sysarg,string.format(str[5],Item.getItemLinkMsg(NewItemId)),4);
	System.broadcastTipmsg(string.format(str[6],Actor.getName(sysarg),Item.getItemLinkMsg(NewItemId)),128);
	ItemTable = {};
end

BatchBoxFunc.QuanShui100 = function(sysarg,ItemTable) SpringWaterEquipment(sysarg,ItemTable,615); end
BatchBoxFunc.QuanShui101 = function(sysarg,ItemTable) SpringWaterEquipment(sysarg,ItemTable,616); end
BatchBoxFunc.QuanShui102 = function(sysarg,ItemTable) SpringWaterEquipment(sysarg,ItemTable,617); end
BatchBoxFunc.QuanShui103 = function(sysarg,ItemTable) SpringWaterEquipment(sysarg,ItemTable,588); end

---------------------------------------------------------------------------------------------------------------------
local tData = {
	{
		{"白银战套","黄金战套",19,46,2000,0},
		{"白银法套","黄金法套",28,55,2000,0},
		{"白银道套","黄金道套",37,64,2000,0},
	},
	{
		{"黄金战套","黑玉套装",46,73,5000,0},
		{"黄金法套","红玉套装",55,82,5000,0},
		{"黄金道套","蓝玉套装",64,91,5000,0},
	},		                     
	{		                     
		{"黑玉套装","乌攻套装",73,100,10000,1},
		{"红玉套装","恶驱套装",82,109,10000,1},
		{"蓝玉套装","巨儒套装",91,118,10000,1},
	},		                     
	{		                     
		{"乌攻套装","天狼套装",100,127,20000,3},
		{"恶驱套装","幻影套装",109,136,20000,3},
		{"巨儒套装","花吻套装",118,145,20000,3},
	},		                     
	{		                     
		{"天狼套装","杀神套装",127,154,30000,5},
		{"幻影套装","斗法套装",136,163,30000,5},
		{"花吻套装","八卦套装",145,172,30000,5},
	},		                     
	{		                     
		{"杀神套装","劫焰套装",154,181,50000,7},
		{"斗法套装","镇龙套装",163,190,50000,7},
		{"八卦套装","圣烨套装",172,199,50000,7},
	},
};

BatchBoxFunc.EquippedWithSyntheticS = function(sysarg,ItemTable)
	local err = {
		"请放入需要合成的装备和材料.",
		"",
		"合成消耗日志:\\\\",
		"您的绑金或金币不足%s,合成失败...",
		"您的淬炼结晶不足%s,合成失败...",
		"金    币",
		"绑定金币",
		"消耗:淬炼结晶  数量:%s\\",
		"消耗:%s  数量:%s\\",
		"消耗:%s  数量:3\\----------------------------\\",
		"(VIP惊喜奖励,此装备获得强化+%s)",
		"<(c0xFFd4ab6f)[><(n%s)><(c0xFFd4ab6f)]在[><(c0xFF00ff00)装备合成><(c0xFFd4ab6f)]处合成了[>%s<(c0xFFd4ab6f)]%s,大家恭喜他吧!>",
		"<(c0xFFFF0000)您放入的物品没有可合成的组合,请查看合成说明后放入可合成的装备进行合成操作!!!>",
	};
	if not ItemTable or #ItemTable < 3 then Actor.sendTipmsg(sysarg,err[1],4); ItemTable = {}; end
	local DataList = {};
	for i = 1,#ItemTable do
		local Pointer = ItemTable[i];
		local ItemId = Item.getItemId(Pointer);
		local ItemName = Item.getItemName(ItemId);
		table.insert(DataList, { ptr = Pointer , id = ItemId, name = ItemName,});
	end
	local e = err[3];
	for i = 1,#tData do
		local nTable1 = tData[i];
		for u = 1,#tData[i] do
			local nTable2 = nTable1[u];
			for n = 1,9 do
				local nId = nTable2[3] + n - 1;
				local NewItemId = nId + 27;
				if TakeItemNumber(DataList,nId) >= 3 then
					local MC = 2;
					if Actor.getMoneyCount(sysarg,1) >= nTable2[5] then MC = 1; end
					if Actor.getMoneyCount(sysarg,0) >= nTable2[5] then MC = 0; end
					if MC == 2 then
						Actor.sendTipmsg(sysarg,string.format(err[4],nTable2[5]),4);
						return;
					end
					if Actor.getItemCount(sysarg,511,0,0,-1) < nTable2[6] then
						Actor.sendTipmsg(sysarg,string.format(err[5],nTable2[6]),4);
						return;
					end
					local str2 = err[6]; if MC == 0 then str2 = err[7]; end
					Actor.removeItem(sysarg,511,nTable2[6]);
					Actor.changeMoney(sysarg,MC,-nTable2[5]);
					for RM = 1,3 do DataList = ReMoveItemForPtr(sysarg,DataList,nId); end
					if nTable2[6] ~= 0 then e = e .. string.format(err[8],nTable2[6]); end
					e = e .. string.format(err[9],str2,nTable2[5]);
					e = e .. string.format(err[10],Item.getItemName(nId));
					local ipItemStrong = 0;
					local str1 = err[2];
					local vLv = Actor.getIntProperty(sysarg,PROP_ACTOR_VIP_GRADE);
					if vLv > 0 then
						ipItemStrong = math.random(0,3);
						if ipItemStrong > 0 then
							str1 = string.format(err[11],ipItemStrong);
						end
					end
					Actor.addItem(sysarg,NewItemId,0,ipItemStrong,1,1,0,"HeChengShuiJing",1);
					System.broadcastTipmsg(string.format(err[12],Actor.getName(sysarg),Item.getItemLinkMsg(NewItemId),str1),128);
					---------------------------------------------------------------------------------------------------------------
					--支线任务
					local var = Actor.getStaticVar(sysarg);
					local d = var.d;
					if d[81] == 9 then
						d[81] = 10;
						Quest_ShuaXin(sysarg,5002,nil,d[30],"百草园",d[32],20);
						Actor.addEffect(sysarg,161,6,600,0);
						Actor.addExp(sysarg,1000000,"支线奖励",0);
						Actor.sendTipmsg(sysarg,string.format("[%s]任务完成,奖励经验%s","合成一件装备",1000000),256);
					end
					---------------------------------------------------------------------------------------------------------------
				end
			end
		end
	end
	if e ~= err[3] then Actor.sendTipmsg(sysarg,e,4); else Actor.sendTipmsg(sysarg,err[13],4); end
end
function ReMoveItemForPtr(sysarg,DataList,nId)
	for i = 1,#DataList do
		local Pointer = DataList[i].ptr;
		local ItemId = DataList[i].id;
		if ItemId == nId then
			--local ipItemCircleFor = Item.getItemProperty(sysarg,Pointer,Item.ipItemCircleFor,0);
			--if ipItemCircleFor > 0 then return DataList; end
			Item.removeItem(sysarg,Pointer,1);
			table.remove(DataList,i);
			return DataList;
		end
	end
end
function TakeItemNumber(DataList,nId)
	local n = 0;
	for i = 1,#DataList do
		local ItemId = DataList[i].id;
		if ItemId == nId then n = n + 1; end
	end
	return n;
end
---------------------------------------------------------------------------------------------------------------------
BatchBoxFunc.ZhuangBeiHCSM = function(sysarg,ItemTable)
	local e = "装备合成规则: 3件相同(3档到8档)装备+若干金币+若干淬炼结晶=高级装备\\\\";
	for i = 1,#tData do
		for k = 1,#tData[i] do
			local a,b = math.modf(k / 3);
			local c = "";
			if b == 0 then c = "\\"; end
			e = e .. "相同的"..(i+2).."档<(c0xFF00aaff)"..tData[i][k][1]..">3件 ＋ <(c0xFF00aaff)"..tData[i][k][5]..">绑金或金币 ＋ <(c0xFF00aaff)"..tData[i][k][6]..">颗淬炼结晶 ＝ 1件"..(i+3).."档<(c0xFFFF0000)"..tData[i][k][2]..">("..((i+4)*10).."级佩戴)\\"..c;
		end
	end
	e = e .. "\\VIP玩家有几率合成出<(c0xFF00FF00)带强化属性>的装备.\\";
	Actor.sendTipmsg(sysarg,e,4);
end

--BatchBoxFunc.BDCLJJOKS = function(sysarg,ItemTable)
--	if not ItemTable[1] then
--		Actor.sendTipmsg(sysarg,"请放入需要绑定的淬炼结晶.",4);
--		return;
--	end
--
--	local ipItemBind = Item.getItemProperty(sysarg,ItemTable[1],Item.ipItemBind,0);
--	if ipItemBind == 1 then Actor.sendTipmsg(sysarg,"您所放入的淬炼结晶已经绑定过了,无法再次绑定!",4); return; end
--
--	local ItemId1 = Item.getItemId(ItemTable[1]);
--
--	if ItemId1 == 511 then
--		local ipItemCount = Item.getItemProperty(sysarg,ItemTable[1],Item.ipItemCount,0);
--		Item.setItemProperty(sysarg,ItemTable[1],Item.ipItemBind,1);
--		Actor.addbatchbox(sysarg,0,"放入需要绑定的淬炼结晶",1,1,1,"确定绑定/BDCLJJOKS",nil,nil,nil,nil);
--		Actor.sendTipmsg(sysarg,"绑定成功!",256);
--	else
--		Actor.sendTipmsg(sysarg,"您放入的不是淬炼结晶!",4);
--	end
--	ItemTable = {};
--end

--BatchBoxFunc.ZhuangBeiHC = function(sysarg,ItemTable)
--	if not ItemTable[1] then
--		Actor.sendTipmsg(sysarg,"请放入需要合成的装备和材料.",4);
--		ItemTable = {};
--		return;
--	end
--
--	if #ItemTable < 3 then
--		Actor.sendTipmsg(sysarg,"请放入3件同样的装备.\\将合成材料放在最后1格.",4);
--		return;
--	end
--
--	local ipItemCircleFor = Item.getItemProperty(sysarg,ItemTable[1],Item.ipItemCircleFor,0);
--	if ipItemCircleFor > 0 then Actor.sendTipmsg(sysarg,"我这里目前没法帮您合成转生过的装备,不好意思..",4); return; end
--
--
--	local ItemId1 = Item.getItemId(ItemTable[1]);
--	local ItemId2 = Item.getItemId(ItemTable[2]);
--	local ItemId3 = Item.getItemId(ItemTable[3]);
--
--	if (ItemId1 == ItemId2 and ItemId2 == ItemId3) then
--		if ItemId1 >= tData[1][1][3] and ItemId1 < tData[#tData][3][4] then
--			local nNTG = 0;
--			local nCLJ = 0;
--			for i = 1,#tData do
--				for k = 1,#tData[i] do
--					if ItemId1 >= tData[i][k][3] and ItemId1 < tData[i][k][4] then
--						nNTG = tData[i][k][5];
--						nCLJ = tData[i][k][6];
--					end
--				end
--			end
--			local ItemId4 = 0;
--			if nCLJ > 0 then
--				ItemId4 = Item.getItemId(ItemTable[4]);
--				if ItemId4 == 511 then
--					local ipItemCount = Item.getItemProperty(sysarg,ItemTable[4],Item.ipItemCount,0);
--					if ipItemCount < nCLJ then
--						Actor.sendTipmsg(sysarg,string.format("请在第4格内放入%s颗淬炼结晶.",nCLJ),4);
--						return;
--					end
--				else
--					Actor.sendTipmsg(sysarg,string.format("请在第4格内放入%s颗淬炼结晶.",nCLJ),4);
--					return;
--				end
--			end
--
--			local MC = 2;
--			if Actor.getMoneyCount(sysarg,1) >= nNTG then MC = 1; end
--			if Actor.getMoneyCount(sysarg,0) >= nNTG then MC = 0; end
--			if MC == 2 then
--				Actor.sendTipmsg(sysarg,string.format("您的绑金或金币不足%s,合成失败...",nNTG),4);
--				return;
--			end
--			local str1 = "";
--			local str2 = "";
--			local str3 = "";
--			if ItemId4 ~= 0 then
--				Item.removeItem(sysarg,ItemTable[4],nCLJ,"装备合成",2);
--				str1 = string.format("消耗了%s颗淬炼结晶.\\",nCLJ);
--			end
--			Actor.changeMoney(sysarg,MC,-nNTG,2,"装备合成");
--			Item.removeItem(sysarg,ItemTable[1],1,"装备合成",2);
--			Item.removeItem(sysarg,ItemTable[2],1,"装备合成",2);
--			Item.removeItem(sysarg,ItemTable[3],1,"装备合成",2);
--			local NewItemId = ItemId1 + 27;
--
--			local ipItemStrong = 0;
--			local vLv = Actor.getIntProperty(sysarg,PROP_ACTOR_VIP_GRADE);
--			if vLv > 0 then
--				ipItemStrong = math.random(0,3);
--				if ipItemStrong > 0 then
--					str3 = "+"..ipItemStrong;
--					str2 = string.format("<(c0xFF00FF00)VIP惊喜奖励,此装备获得强化+%s>",ipItemStrong);
--				end
--			end
--
--			Actor.addItem(sysarg,NewItemId,0,ipItemStrong,1);
--			Actor.sendTipmsg(sysarg,string.format("恭喜您合成%s成功!\\"..str1..str2,Item.getItemLinkMsg(NewItemId)),4);
--
--			local var = Actor.getStaticVar(sysarg);
--			local d = var.d;
--			if d[81] == 9 then
--				d[81] = 10;
--				Quest_ShuaXin(sysarg,5002,nil,d[30],"百草园",d[32],20);
--				Actor.addEffect(sysarg,161,6,600,0);
--				Actor.addExp(sysarg,1000000,"支线奖励",0);
--				Actor.sendTipmsg(sysarg,string.format("[%s]任务完成,奖励经验%s","合成一件装备",1000000),256);
--			end
--
--			if d[77] == 1 then
--				Actor.addbatchbox(sysarg,0,"装备合成",1,3,1,"确定合成/ZhuangBeiHC",nil,nil,nil,nil);
--				Actor.addbatchbox(sysarg,0,"装备合成",1,3,0,"确定合成/ZhuangBeiHC",nil,nil,nil,nil);
--			elseif d[77] == 2 then
--				Actor.addbatchbox(sysarg,0,"装备合成",1,4,1,"确定合成/ZhuangBeiHC",nil,nil,nil,nil);
--				Actor.addbatchbox(sysarg,0,"装备合成",1,4,0,"确定合成/ZhuangBeiHC",nil,nil,nil,nil);
--			elseif d[77] == 3 then
--				Actor.addbatchbox(sysarg,0,"VIP随身装备合成",1,4,1,"确定合成/ZhuangBeiHC","查看合成说明/ZhuangBeiHCSM",nil,nil,nil);
--				Actor.addbatchbox(sysarg,0,"VIP随身装备合成",1,4,0,"确定合成/ZhuangBeiHC","查看合成说明/ZhuangBeiHCSM",nil,nil,nil);
--			end
--
--			if nCLJ > 0 then
--				if d[77] == 3 then
--					System.broadcastTipmsg(string.format("<(c0xFFd4ab6f)[><(n%s)><(c0xFFd4ab6f)]在[><(c0xFF00ff00)VIP随身特权%s><(c0xFFd4ab6f)]合成了[><(c0xFF00ff00)%s"..str3.."><(c0xFFd4ab6f)],大家恭喜他吧!>",Actor.getName(sysarg),"装备合成",Item.getItemName(NewItemId)),128);
--				else
--					System.broadcastTipmsg(string.format("<(c0xFFd4ab6f)[><(n%s)><(c0xFFd4ab6f)]在[><(c0xFF00ff00)%s><(c0xFFd4ab6f)]处合成了[><(c0xFF00ff00)%s"..str3.."><(c0xFFd4ab6f)],大家恭喜他吧!>",Actor.getName(sysarg),"装备合成",Item.getItemName(NewItemId)),128);
--				end
--			end
--		else
--			Actor.sendTipmsg(sysarg,"您所放入的物品无法合成!",4);
--		end
--	else
--		Actor.sendTipmsg(sysarg,"您放入的装备没有可合成的哦~",4);
--	end
--	ItemTable = {};
--end

---------------------------------------------------------------------------------------------------------------------
BatchBoxFunc.TeShuJieZhiHC = function(sysarg,ItemTable)
	if not ItemTable[1] then
		Actor.sendTipmsg(sysarg,"请放入3件同样的特殊戒指和淬炼结晶.",4);
		ItemTable = {};
		return;
	end
	if #ItemTable < 3 then
		Actor.sendTipmsg(sysarg,"请放入3件同样的特殊戒指.\\将淬炼结晶放在最后1格.",4);
		return;
	end
	local ipItemCircleFor = Item.getItemProperty(sysarg,ItemTable[1],Item.ipItemCircleFor,0);
	if ipItemCircleFor > 0 then Actor.sendTipmsg(sysarg,"我这里目前没法帮您合成转生过的装备,不好意思..",4); return; end
	local ItemId1 = Item.getItemId(ItemTable[1]);
	local ItemId2 = Item.getItemId(ItemTable[2]);
	local ItemId3 = Item.getItemId(ItemTable[3]);
	if (ItemId1 == ItemId2 and ItemId2 == ItemId3) then
		if ItemId1 == 434 or ItemId1 == 444 or ItemId1 == 454 then Actor.sendTipmsg(sysarg,"此神器已经提升到顶级了,无法再提升了!",4); return; end
		if ItemId1 >= 425 and ItemId1 < 454 then
			local NewItemId = ItemId1 + 1;
			local NeedClian = 100;
			local tj = {425,435,445};
			for i = 1,9 do
				for u = 1,3 do
					local tid =tj[u]+i-1;
					if ItemId1 == tid then NeedClian = i * 8; break; end
				end
			end
			local ItemId4 = Item.getItemId(ItemTable[4]);
			local TiShi1 = "请在第4格内放入%s颗淬炼结晶.";
			if ItemId4 == 511 then
				local ipItemCount = Item.getItemProperty(sysarg,ItemTable[4],Item.ipItemCount,0);
				if ipItemCount < NeedClian then Actor.sendTipmsg(sysarg,string.format(TiShi1,NeedClian),4); return;
				end
			else
				Actor.sendTipmsg(sysarg,string.format(TiShi1,NeedClian),4); return;
			end
			local MC = 2;
			if Actor.getMoneyCount(sysarg,1) >= 100000 then MC = 1; end
			if Actor.getMoneyCount(sysarg,0) >= 100000 then MC = 0; end
			if MC == 2 then
				Actor.sendTipmsg(sysarg,string.format("您的绑金或金币不足%s.",100000),4);
				return;
			end
			Actor.changeMoney(sysarg,MC,-100000,0,"特戒");
			Item.removeItem(sysarg,ItemTable[4],NeedClian,"特戒",2);
			Item.removeItem(sysarg,ItemTable[1],1,"特戒",2);
			Item.removeItem(sysarg,ItemTable[2],1,"特戒",2);
			Item.removeItem(sysarg,ItemTable[3],1,"特戒",2);
			Actor.addItem(sysarg,NewItemId,0,0,1,1,0,"ShenQiHeCheng",1);
			System.broadcastTipmsg(string.format("<(c0xFFd4ab6f)恭喜玩家[><(n%s)><(c0xFFd4ab6f)]在NPC[><(c0xFF00ff00)%s><(c0xFFd4ab6f)]这里合成了1枚神器[>%s<(c0xFFd4ab6f)]>",Actor.getName(sysarg),"特戒合成",Item.getItemLinkMsg(NewItemId)),128);
			Actor.addbatchbox(sysarg,0,"特殊神器戒指兑换合成",1,4,1,"确定合成/TeShuJieZhiHC",nil,nil,nil,nil);
			Actor.addbatchbox(sysarg,0,"特殊神器戒指兑换合成",1,4,0,"确定合成/TeShuJieZhiHC",nil,nil,nil,nil);
		end
	end
	ItemTable = {};
end
---------------------------------------------------------------------------------------------------------------------
local BZJFDHDATA = {
	all = {
		{154,127,50},
		{163,136,50},
		{172,145,50},
		{181,154,80},
		{190,163,80},
		{199,172,80},
		{208,181,300},
		{217,190,300},
		{226,199,300},
		{155,128,35},
		{156,129,35},
		{164,137,35},
		{165,138,35},
		{173,146,35},
		{174,147,35},
		{182,155,55},
		{183,156,55},
		{191,164,55},
		{192,165,55},
		{200,173,55},
		{201,174,55},
		{209,182,210},
		{210,183,210},
		{218,191,210},
		{219,192,210},
		{227,200,210},
		{228,201,210},
		{158,131,7},
		{160,133,7},
		{161,134,7},
		{162,135,7},
		{167,140,7},
		{169,142,7},
		{170,143,7},
		{171,144,7},
		{176,149,7},
		{178,151,7},
		{179,152,7},
		{180,153,7},
		{184,157,11},
		{186,159,11},
		{188,161,11},
		{189,162,11},
		{193,166,11},
		{195,168,11},
		{197,170,11},
		{198,171,11},
		{202,175,11},
		{204,177,11},
		{206,179,11},
		{207,180,11},
		{211,184,70},
		{212,185,70},
		{213,186,70},
		{214,187,70},
		{220,193,70},
		{221,194,70},
		{222,195,70},
		{223,196,70},
		{229,202,70},
		{230,203,70},
		{231,204,70},
		{232,205,70},
	},
	hh = {
		{128,129,1},
		{129,128,1},
		{137,138,1},
		{138,137,1},
		{146,147,1},
		{147,146,1},
		{155,156,2},
		{156,155,2},
		{164,165,2},
		{165,164,2},
		{173,174,2},
		{174,173,2},
		{182,183,3},
		{183,182,3},
		{191,192,3},
		{192,191,3},
		{200,201,3},
		{201,200,3},
		{209,210,5},
		{210,209,5},
		{218,219,5},
		{219,218,5},
		{227,228,5},
		{228,227,5},

	},
	HH1 = {
		{208,217,10},
		{209,218,10},
		{210,219,10},
		{211,220,5},
		{212,221,5},
		{213,222,5},
		{214,223,5},
		{215,224,5},
		{216,225,5},
		{208,226,10},
		{209,227,10},
		{210,228,10},
		{211,229,5},
		{212,230,5},
		{213,231,5},
		{214,232,5},
		{215,233,5},
		{216,234,5},
	},
	HH2 = {
		{217,208,10},
		{218,209,10},
		{219,210,10},
		{220,211,5},
		{221,212,5},
		{222,213,5},
		{223,214,5},
		{224,215,5},
		{225,216,5},
		{217,226,10},
		{218,227,10},
		{219,228,10},
		{220,229,5},
		{221,230,5},
		{222,231,5},
		{223,232,5},
		{224,233,5},
		{225,234,5},
	},
	HH3 = {
		{226,208,10},
		{227,209,10},
		{228,210,10},
		{229,211,5},
		{230,212,5},
		{231,213,5},
		{232,214,5},
		{233,215,5},
		{234,216,5},
		{226,217,10},
		{227,218,10},
		{228,219,10},
		{229,220,5},
		{230,221,5},
		{231,222,5},
		{232,223,5},
		{233,224,5},
		{234,225,5},
	},
};
BatchBoxFunc.BaoZangJfDhItem = function(sysarg,ItemTable)
	if not ItemTable[1] then
		Actor.sendTipmsg(sysarg,"请放入需要升级兑换的装备.",4);
		ItemTable = {};
		return;
	end
	local ipItemCircleFor = Item.getItemProperty(sysarg,ItemTable[1],Item.ipItemCircleFor,0);
	if ipItemCircleFor > 0 then Actor.sendTipmsg(sysarg,"转生装备我暂时还没研究透彻,无法帮您升级,不好意思...",4); return; end

	local all = BZJFDHDATA.all;
	if ItemTable[1] then
		local id = Item.getItemId(ItemTable[1]);
		local ck = 5000;
		for i = 1,#all do if id == all[i][2] then ck = i; break; end end
		if ck == 5000 then
			local itemname = Item.getItemName(id);
			Actor.sendTipmsg(sysarg,"请放入需要升级的装备,此物品无法使用宝藏积分升级.",4);
			ItemTable = {};
			return;
		end
		if Item.getBagEmptyGridCount(sysarg) <= 0 then Actor.sendTipmsg(sysarg,"您的包裹已经满了,请清理一下再来吧!",4); return; end
		local ItemId = all[ck][1];
		local oldItemId = all[ck][2];
		local ItemName = Item.getItemName(ItemId);
		local oldItemName = Item.getItemName(oldItemId);
		local nBzNum = all[ck][3];
		local var = Actor.getStaticVar(sysarg);
		if not var.TreasureHuntValue then var.TreasureHuntValue = 0; end
		if var.TreasureHuntValue < nBzNum then Actor.sendTipmsg(sysarg,string.format("您当前宝藏积分少于[%s]点,升级兑换[%s]失败.\\当前剩余宝藏积分:<(c0xFF00ff00)%s>点\\<(c0xFFff0000)(NPC页面显示为未刷新数据,以此处显示为准)>",nBzNum,ItemName,var.TreasureHuntValue),4); return; end
		if id ~= oldItemId then Actor.sendTipmsg(sysarg,"异常错误,请联系管理员.",4); return; end
		local ipItemStrong = Item.getItemProperty(sysarg,ItemTable[1],Item.ipItemStrong,0);
		local ipItemStrongLimit = Item.getItemProperty(sysarg,ItemTable[1],Item.ipItemStrongLimit,0);
		local ItemttNew = Item.createItem(ItemId,1,ipItemStrong,0,0,0);
		Item.modifyItemProperty(ItemttNew,Item.ipItemStrongLimit,ipItemStrongLimit);
		var.TreasureHuntValue = var.TreasureHuntValue - nBzNum;
		Item.removeItem(sysarg,ItemTable[1],1);
		Item.addItem(sysarg,ItemttNew,0,0,1);
		local str1 = "";
		if ipItemStrong > 0 then str1 = "+"..ipItemStrong; end
		Actor.sendTipmsg(sysarg,string.format("恭喜您使用<(c0xFF00ff00)%s>点宝藏积分成功的兑换了<(c0xFF00ff00)%s%s>.\\当前剩余宝藏积分:<(c0xFF00ff00)%s>点\\<(c0xFFff0000)(NPC页面显示为未刷新数据,以此处显示为准)>",nBzNum,ItemName,str1,var.TreasureHuntValue),4);
		System.broadcastTipmsg(string.format("恭喜玩家<(n%s)>在<(c0xFF00ff00)%s>使用<(c0xFF00ff00)%s>点宝藏积分成功的兑换了%s%s,大家恭喜他吧!",Actor.getName(sysarg),"福利官员",nBzNum,Item.getItemLinkMsg(ItemId),str1),128);
	end
end
BatchBoxFunc.BaoZangJfDhItemS = function(sysarg,ItemTable)
	if not ItemTable[1] then
		Actor.sendTipmsg(sysarg,"请放入需要互换的衣服.",4);
		ItemTable = {};
		return;
	end
	local ipItemCircleFor = Item.getItemProperty(sysarg,ItemTable[1],Item.ipItemCircleFor,0);
	if ipItemCircleFor > 0 then Actor.sendTipmsg(sysarg,"转生装备我暂时还没研究透彻,无法帮您升级,不好意思...",4); return; end

	local all = BZJFDHDATA.hh;
	if ItemTable[1] then
		local id = Item.getItemId(ItemTable[1]);
		local ck = 5000;
		for i = 1,#all do if id == all[i][2] then ck = i; break; end end
		if ck == 5000 then
			local itemname = Item.getItemName(id);
			Actor.sendTipmsg(sysarg,"请放入需要互换的衣服,此物品无法使用宝藏积分转换.",4);
			ItemTable = {};
			return;
		end
		if Item.getBagEmptyGridCount(sysarg) <= 0 then Actor.sendTipmsg(sysarg,"您的包裹已经满了,请清理一下再来吧!",4); return; end
		local ItemId = all[ck][1];
		local oldItemId = all[ck][2];
		local ItemName = Item.getItemName(ItemId);
		local oldItemName = Item.getItemName(oldItemId);
		local nBzNum = all[ck][3];
		local var = Actor.getStaticVar(sysarg);
		if not var.TreasureHuntValue then var.TreasureHuntValue = 0; end
		if var.TreasureHuntValue < nBzNum then Actor.sendTipmsg(sysarg,string.format("您当前宝藏积分少于[%s]点,转换[%s]失败.\\当前剩余宝藏积分:<(c0xFF00ff00)%s>点\\<(c0xFFff0000)(NPC页面显示为未刷新数据,以此处显示为准)>",nBzNum,ItemName,var.TreasureHuntValue),4); return; end
		if id ~= oldItemId then Actor.sendTipmsg(sysarg,"异常错误,请联系管理员.",4); return; end
		local ipItemStrong = Item.getItemProperty(sysarg,ItemTable[1],Item.ipItemStrong,0);
		local ipItemStrongLimit = Item.getItemProperty(sysarg,ItemTable[1],Item.ipItemStrongLimit,0);
		local ItemttNew = Item.createItem(ItemId,1,ipItemStrong,0,0,0);
		Item.modifyItemProperty(ItemttNew,Item.ipItemStrongLimit,ipItemStrongLimit);
		var.TreasureHuntValue = var.TreasureHuntValue - nBzNum;
		Item.removeItem(sysarg,ItemTable[1],1);
		Item.addItem(sysarg,ItemttNew,0,0,1);
		local str1 = "";
		if ipItemStrong > 0 then str1 = "+"..ipItemStrong; end
		Actor.sendTipmsg(sysarg,string.format("恭喜您使用<(c0xFF00ff00)%s>点宝藏积分成功的兑换了<(c0xFF00ff00)%s%s>.\\当前剩余宝藏积分:<(c0xFF00ff00)%s>点\\<(c0xFFff0000)(NPC页面显示为未刷新数据,以此处显示为准)>",nBzNum,ItemName,str1,var.TreasureHuntValue),4);
		System.broadcastTipmsg(string.format("恭喜玩家<(n%s)>在<(c0xFF00ff00)%s>使用<(c0xFF00ff00)%s>点宝藏积分成功的兑换了%s%s,大家恭喜他吧!",Actor.getName(sysarg),"福利官员",nBzNum,Item.getItemLinkMsg(ItemId),str1),128);
	end
end
BatchBoxFunc.BaoZangJfDhItemS1 = function(sysarg,ItemTable)
	if not ItemTable[1] then
		Actor.sendTipmsg(sysarg,"请放入需要互换的装备.",4);
		ItemTable = {};
		return;
	end
	local ipItemCircleFor = Item.getItemProperty(sysarg,ItemTable[1],Item.ipItemCircleFor,0);
	if ipItemCircleFor > 0 then Actor.sendTipmsg(sysarg,"转生装备我暂时还没研究透彻,无法帮您升级,不好意思...",4); return; end

	local all = BZJFDHDATA.HH1;
	if ItemTable[1] then
		local id = Item.getItemId(ItemTable[1]);
		local ck = 5000;
		for i = 1,#all do if id == all[i][2] then ck = i; break; end end
		if ck == 5000 then
			local itemname = Item.getItemName(id);
			Actor.sendTipmsg(sysarg,"请放入需要互换的装备,此物品无法使用宝藏积分转换.",4);
			ItemTable = {};
			return;
		end
		if Item.getBagEmptyGridCount(sysarg) <= 0 then Actor.sendTipmsg(sysarg,"您的包裹已经满了,请清理一下再来吧!",4); return; end
		local ItemId = all[ck][1];
		local oldItemId = all[ck][2];
		local ItemName = Item.getItemName(ItemId);
		local oldItemName = Item.getItemName(oldItemId);
		local nBzNum = all[ck][3];
		local var = Actor.getStaticVar(sysarg);
		if not var.TreasureHuntValue then var.TreasureHuntValue = 0; end
		if var.TreasureHuntValue < nBzNum then Actor.sendTipmsg(sysarg,string.format("您当前宝藏积分少于[%s]点,转换[%s]失败.\\当前剩余宝藏积分:<(c0xFF00ff00)%s>点\\<(c0xFFff0000)(NPC页面显示为未刷新数据,以此处显示为准)>",nBzNum,ItemName,var.TreasureHuntValue),4); return; end
		if id ~= oldItemId then Actor.sendTipmsg(sysarg,"异常错误,请联系管理员.",4); return; end
		local ipItemStrong = Item.getItemProperty(sysarg,ItemTable[1],Item.ipItemStrong,0);
		local ipItemStrongLimit = Item.getItemProperty(sysarg,ItemTable[1],Item.ipItemStrongLimit,0);
		local ItemttNew = Item.createItem(ItemId,1,ipItemStrong,0,0,0);
		Item.modifyItemProperty(ItemttNew,Item.ipItemStrongLimit,ipItemStrongLimit);
		var.TreasureHuntValue = var.TreasureHuntValue - nBzNum;
		Item.removeItem(sysarg,ItemTable[1],1);
		Item.addItem(sysarg,ItemttNew,0,0,1);
		local str1 = "";
		if ipItemStrong > 0 then str1 = "+"..ipItemStrong; end
		Actor.sendTipmsg(sysarg,string.format("恭喜您使用<(c0xFF00ff00)%s>点宝藏积分成功的兑换了<(c0xFF00ff00)%s%s>.\\当前剩余宝藏积分:<(c0xFF00ff00)%s>点\\<(c0xFFff0000)(NPC页面显示为未刷新数据,以此处显示为准)>",nBzNum,ItemName,str1,var.TreasureHuntValue),4);
		System.broadcastTipmsg(string.format("恭喜玩家<(n%s)>在<(c0xFF00ff00)%s>使用<(c0xFF00ff00)%s>点宝藏积分成功的兑换了%s%s,大家恭喜他吧!",Actor.getName(sysarg),"福利官员",nBzNum,Item.getItemLinkMsg(ItemId),str1),128);
	end
end
BatchBoxFunc.BaoZangJfDhItemS2 = function(sysarg,ItemTable)
	if not ItemTable[1] then
		Actor.sendTipmsg(sysarg,"请放入需要互换的装备.",4);
		ItemTable = {};
		return;
	end
	local ipItemCircleFor = Item.getItemProperty(sysarg,ItemTable[1],Item.ipItemCircleFor,0);
	if ipItemCircleFor > 0 then Actor.sendTipmsg(sysarg,"转生装备我暂时还没研究透彻,无法帮您升级,不好意思...",4); return; end

	local all = BZJFDHDATA.HH2;
	if ItemTable[1] then
		local id = Item.getItemId(ItemTable[1]);
		local ck = 5000;
		for i = 1,#all do if id == all[i][2] then ck = i; break; end end
		if ck == 5000 then
			local itemname = Item.getItemName(id);
			Actor.sendTipmsg(sysarg,"请放入需要互换的装备,此物品无法使用宝藏积分转换.",4);
			ItemTable = {};
			return;
		end
		if Item.getBagEmptyGridCount(sysarg) <= 0 then Actor.sendTipmsg(sysarg,"您的包裹已经满了,请清理一下再来吧!",4); return; end
		local ItemId = all[ck][1];
		local oldItemId = all[ck][2];
		local ItemName = Item.getItemName(ItemId);
		local oldItemName = Item.getItemName(oldItemId);
		local nBzNum = all[ck][3];
		local var = Actor.getStaticVar(sysarg);
		if not var.TreasureHuntValue then var.TreasureHuntValue = 0; end
		if var.TreasureHuntValue < nBzNum then Actor.sendTipmsg(sysarg,string.format("您当前宝藏积分少于[%s]点,转换[%s]失败.\\当前剩余宝藏积分:<(c0xFF00ff00)%s>点\\<(c0xFFff0000)(NPC页面显示为未刷新数据,以此处显示为准)>",nBzNum,ItemName,var.TreasureHuntValue),4); return; end
		if id ~= oldItemId then Actor.sendTipmsg(sysarg,"异常错误,请联系管理员.",4); return; end
		local ipItemStrong = Item.getItemProperty(sysarg,ItemTable[1],Item.ipItemStrong,0);
		local ipItemStrongLimit = Item.getItemProperty(sysarg,ItemTable[1],Item.ipItemStrongLimit,0);
		local ItemttNew = Item.createItem(ItemId,1,ipItemStrong,0,0,0);
		Item.modifyItemProperty(ItemttNew,Item.ipItemStrongLimit,ipItemStrongLimit);
		var.TreasureHuntValue = var.TreasureHuntValue - nBzNum;
		Item.removeItem(sysarg,ItemTable[1],1);
		Item.addItem(sysarg,ItemttNew,0,0,1);
		local str1 = "";
		if ipItemStrong > 0 then str1 = "+"..ipItemStrong; end
		Actor.sendTipmsg(sysarg,string.format("恭喜您使用<(c0xFF00ff00)%s>点宝藏积分成功的兑换了<(c0xFF00ff00)%s%s>.\\当前剩余宝藏积分:<(c0xFF00ff00)%s>点\\<(c0xFFff0000)(NPC页面显示为未刷新数据,以此处显示为准)>",nBzNum,ItemName,str1,var.TreasureHuntValue),4);
		System.broadcastTipmsg(string.format("恭喜玩家<(n%s)>在<(c0xFF00ff00)%s>使用<(c0xFF00ff00)%s>点宝藏积分成功的兑换了%s%s,大家恭喜他吧!",Actor.getName(sysarg),"福利官员",nBzNum,Item.getItemLinkMsg(ItemId),str1),128);
	end
end
BatchBoxFunc.BaoZangJfDhItemS3 = function(sysarg,ItemTable)
	if not ItemTable[1] then
		Actor.sendTipmsg(sysarg,"请放入需要互换的装备.",4);
		ItemTable = {};
		return;
	end
	local ipItemCircleFor = Item.getItemProperty(sysarg,ItemTable[1],Item.ipItemCircleFor,0);
	if ipItemCircleFor > 0 then Actor.sendTipmsg(sysarg,"转生装备我暂时还没研究透彻,无法帮您升级,不好意思...",4); return; end

	local all = BZJFDHDATA.HH3;
	if ItemTable[1] then
		local id = Item.getItemId(ItemTable[1]);
		local ck = 5000;
		for i = 1,#all do if id == all[i][2] then ck = i; break; end end
		if ck == 5000 then
			local itemname = Item.getItemName(id);
			Actor.sendTipmsg(sysarg,"请放入需要互换的装备,此物品无法使用宝藏积分转换.",4);
			ItemTable = {};
			return;
		end
		if Item.getBagEmptyGridCount(sysarg) <= 0 then Actor.sendTipmsg(sysarg,"您的包裹已经满了,请清理一下再来吧!",4); return; end
		local ItemId = all[ck][1];
		local oldItemId = all[ck][2];
		local ItemName = Item.getItemName(ItemId);
		local oldItemName = Item.getItemName(oldItemId);
		local nBzNum = all[ck][3];
		local var = Actor.getStaticVar(sysarg);
		if not var.TreasureHuntValue then var.TreasureHuntValue = 0; end
		if var.TreasureHuntValue < nBzNum then Actor.sendTipmsg(sysarg,string.format("您当前宝藏积分少于[%s]点,转换[%s]失败.\\当前剩余宝藏积分:<(c0xFF00ff00)%s>点\\<(c0xFFff0000)(NPC页面显示为未刷新数据,以此处显示为准)>",nBzNum,ItemName,var.TreasureHuntValue),4); return; end
		if id ~= oldItemId then Actor.sendTipmsg(sysarg,"异常错误,请联系管理员.",4); return; end
		local ipItemStrong = Item.getItemProperty(sysarg,ItemTable[1],Item.ipItemStrong,0);
		local ipItemStrongLimit = Item.getItemProperty(sysarg,ItemTable[1],Item.ipItemStrongLimit,0);
		local ItemttNew = Item.createItem(ItemId,1,ipItemStrong,0,0,0);
		Item.modifyItemProperty(ItemttNew,Item.ipItemStrongLimit,ipItemStrongLimit);
		var.TreasureHuntValue = var.TreasureHuntValue - nBzNum;
		Item.removeItem(sysarg,ItemTable[1],1);
		Item.addItem(sysarg,ItemttNew,0,0,1);
		local str1 = "";
		if ipItemStrong > 0 then str1 = "+"..ipItemStrong; end
		Actor.sendTipmsg(sysarg,string.format("恭喜您使用<(c0xFF00ff00)%s>点宝藏积分成功的兑换了<(c0xFF00ff00)%s%s>.\\当前剩余宝藏积分:<(c0xFF00ff00)%s>点\\<(c0xFFff0000)(NPC页面显示为未刷新数据,以此处显示为准)>",nBzNum,ItemName,str1,var.TreasureHuntValue),4);
		System.broadcastTipmsg(string.format("恭喜玩家<(n%s)>在<(c0xFF00ff00)%s>使用<(c0xFF00ff00)%s>点宝藏积分成功的兑换了%s%s,大家恭喜他吧!",Actor.getName(sysarg),"福利官员",nBzNum,Item.getItemLinkMsg(ItemId),str1),128);
	end
end


SpecialItem = {
	{430,440,1000000,10},
	{431,441,2000000,20},
	{432,442,3000000,30},
	{433,443,4000000,40},
	{434,444,5000000,50},
	{440,430,1000000,10},
	{441,431,2000000,20},
	{442,432,3000000,30},
	{443,433,4000000,40},
	{444,434,5000000,50},
};

BatchBoxFunc.SpecialTransformation = function(sysarg,ItemTable)
	if not ItemTable[1] then
		Actor.sendTipmsg(sysarg,"请放入需要互换的特戒.",4);
		ItemTable = {};
		return;
	end

	local all = SpecialItem;
	if ItemTable[1] then
		local id = Item.getItemId(ItemTable[1]);
		local ck = 5000;
		for i = 1,#all do if id == all[i][2] then ck = i; break; end end
		if ck == 5000 then
			local itemname = Item.getItemName(id);
			Actor.sendTipmsg(sysarg,"请放入需要互换的装备,此物品无法使用宝藏积分转换.",4);
			ItemTable = {};
			return;
		end
		if Item.getBagEmptyGridCount(sysarg) < 1 then Actor.sendTipmsg(sysarg,"您的包裹已经满了,请清理一下再来吧!",4); return; end
		local ItemId = all[ck][1];
		local oldItemId = all[ck][2];
		local ItemName = Item.getItemName(ItemId);
		local oldItemName = Item.getItemName(oldItemId);
		local nGoldCoins = all[ck][3];
		local nCrystallization = all[ck][4];

		local MC = 2;
		if Actor.getMoneyCount(sysarg,1) >= nGoldCoins then MC = 1; end
		if Actor.getMoneyCount(sysarg,0) >= nGoldCoins then MC = 0; end
		if MC == 2 then
			Actor.sendTipmsg(sysarg,string.format("您的绑金或金币不足%s.",nGoldCoins),256);
			return;
		end

		if Actor.getItemCount(sysarg,511,0,0,-1) < nCrystallization then
			Actor.sendTipmsg(sysarg,string.format("您的<(c0xFFFF0000)淬炼结晶>数量不足<(c0xFFFF0000)%s>,转换失败.",nCrystallization),256);
			return;
		end

		if id ~= oldItemId then Actor.sendTipmsg(sysarg,"异常错误,请联系管理员.",4); return; end
		local ipItemCircleFor = Item.getItemProperty(sysarg,ItemTable[1],Item.ipItemCircleFor,0);
		local ipItemStrong = Item.getItemProperty(sysarg,ItemTable[1],Item.ipItemStrong,0);
		local ipItemStrongLimit = Item.getItemProperty(sysarg,ItemTable[1],Item.ipItemStrongLimit,0);
		local ItemttNew = Item.createItem(ItemId,1,ipItemStrong,0,0,0);
		Item.modifyItemProperty(ItemttNew,Item.ipItemStrongLimit,ipItemStrongLimit);
		Item.modifyItemProperty(ItemttNew,Item.ipItemCircleFor,ipItemCircleFor);
		Actor.changeMoney(sysarg,MC,-nGoldCoins,0,"特戒互换");
		Actor.removeItem(sysarg,511,nCrystallization);
		Item.removeItem(sysarg,ItemTable[1],1);
		Item.addItem(sysarg,ItemttNew,0,0,1);
		Actor.sendTipmsg(sysarg,string.format("恭喜您将%s转换成为%s.",Item.getItemName(oldItemId),Item.getItemName(ItemId)),256);
		System.broadcastTipmsg(string.format("恭喜玩家<(n%s)>在<(c0xFF00ff00)%s>将%s转换成了%s,大家恭喜他吧!",Actor.getName(sysarg),"土城特戒大师",Item.getItemLinkMsg(oldItemId),Item.getItemLinkMsg(ItemId)),128);
	end
end
---------------------------------------------------------------------------------------------------------------------
BatchBoxFunc.ZhuangBeiHSSM = function(sysarg,ItemTable)
	local e = [[
用不到的转生装备都可以找我来<(c0xFFFF0000)回收>掉了.

]];

	for i = 1,6 do
		local BangJin = (i ^ 3 * 1000 + 700);
		local JingYan = (i ^ 3 * 10000 + 3000);
		e = e .. string.format("<(c0xFFFF0000)%s档>装备每件: <(c0xFF00aaff)绑金＋%s,经验＋%s>\\",(i+4),BangJin,JingYan);
	end

	e = e .. [[

<(c0xFF888888)强化过的装备每级强化就多附加><(c0xFF00FF00)20%><(c0xFF888888)的奖励.>
<(c0xFF888888)转生过的装备每级转生就多附加><(c0xFF00FF00)300%><(c0xFF888888)的奖励.>

]];
	Actor.sendTipmsg(sysarg,e,4);
end

BatchBoxFunc.ZhuangBeiHSOK = function(sysarg,ItemTable)
	local StartId = 73;
	local nT = 6;	--套数
	local Num = 0;
	local BangJin = 0;
	local JingYan = 0;
	local a,b = 0,0;
	local c,d = 0,0;

	if not ItemTable[1] then
		Actor.sendTipmsg(sysarg,"请放入需要回收的装备.",256);
		ItemTable = {};
		return;
	end



	if ItemTable[1] then
		local id = Item.getItemId(ItemTable[1]);
		local errS = 1;
		if id >= StartId or id < (nT * 27 + StartId) then errS = 2; end
		if errS == 1 then
			local itemname = Item.getItemName(id);
			Actor.sendTipmsg(sysarg,"我这里只能回收5档到10档的转生装备.\\请放入可回收的装备.\\\\<(c0xFFFF0000)"..itemname..">无法回收,请关掉回收窗口重新打开继续操作.",4);
			ItemTable = {};
			return;
		end
	end

	for i = 1,#ItemTable do
		local ptr = ItemTable[i];
		local id = Item.getItemId(ItemTable[i]);
		local itemname = Item.getItemName(id);
		local ipItemStrong = Item.getItemProperty(sysarg,ptr,Item.ipItemStrong,0);
		local ipItemCircleFor = Item.getItemProperty(sysarg,ptr,Item.ipItemCircleFor,0);
		for k1 = 1,nT do
			for k2 = 1,3 do
				a = StartId + 27 * (k1 - 1) + (k2 - 1) * 9;
				b = a + 9;
				if id >= a and id < b then
					if ipItemCircleFor < 1 then Actor.sendTipmsg(sysarg,"我这里只能回收5档到10档的转生装备.请放入可回收的转生装备.",256); return; end
					Item.removeItem(sysarg,ptr,1,"装备回收",2);
					Num = Num + 1;
					c = ((k1+2) ^ 3 * 1000 + 700);
					d = ((k1+2) ^ 3 * 10000 + 3000);
					if ipItemCircleFor > 0 then
						c = c * ipItemCircleFor * 3;
						d = d * ipItemCircleFor * 3;
					end
					if ipItemStrong > 0 then
						c = math.ceil(c + c * (ipItemStrong / 5));
						d = math.ceil(d + d * (ipItemStrong / 5));
					end
					BangJin = BangJin + c;
					JingYan = JingYan + d;
				end
			end
		end

	end
	if BangJin == 0 and JingYan == 0 then
		Actor.sendTipmsg(sysarg,"我这里只能回收5档到10档的转生装备,请放入可回收的装备.",256);
		ItemTable = {};
		return;
	end
	Actor.changeMoney(sysarg,0,BangJin,0,"装备回收");
	Actor.addExp(sysarg,JingYan,"装备回收",0);
	Actor.sendTipmsg(sysarg,string.format("<(c0xFFd4ab6f)回收%s件装备成功.绑金＋><(c0xFF00ff00)%s><(c0xFFd4ab6f),经验＋><(c0xFF00ff00)%s>",Num,BangJin,JingYan),256);


	if BangJin >= 200000 then
		local var = Actor.getStaticVar(sysarg);
		local d = var.d;
		if d[77] == 4 then
			System.broadcastTipmsg(string.format("<(c0xFFd4ab6f)玩家><(n%s)><(c0xFFd4ab6f)在><(c0xFF00ff00)VIP随身特权%s><(c0xFFd4ab6f)这里回收了><(c0xFF00ff00)%s><(c0xFFd4ab6f)件转生装备,绑金＋><(c0xFF00ff00)%s><(c0xFFd4ab6f),经验＋><(c0xFF00ff00)%s>",Actor.getName(sysarg),"装备回收",Num,BangJin,JingYan),128);
		else
			local StrNpcE = string.format("<%s/M卧龙城:144:121:%s><(x卧龙城:144:121:%s)>","装备回收","装备回收","装备回收");
			System.broadcastTipmsg(string.format("<(c0xFFd4ab6f)玩家><(n%s)><(c0xFFd4ab6f)在>%s<(c0xFFd4ab6f)这里回收了><(c0xFF00ff00)%s><(c0xFFd4ab6f)件转生装备,绑金＋><(c0xFF00ff00)%s><(c0xFFd4ab6f),经验＋><(c0xFF00ff00)%s>",Actor.getName(sysarg),StrNpcE,Num,BangJin,JingYan),128);
		end
	end
	ItemTable = {};
end

--
--BatchBoxFunc.ZSZhuangBeiHSSM = function(sysarg,ItemTable)
--	local e = [[
--转生装备分解:
--
--<(c0xFFFF0000)首饰>装备每1转生即可分解获得<(c0xFF00FF00)1>颗淬炼结晶
--<(c0xFFFF0000)衣服>装备每1转生即可分解获得<(c0xFF00FF00)2>颗淬炼结晶
--<(c0xFFFF0000)武器>装备每1转生即可分解获得<(c0xFF00FF00)3>颗淬炼结晶
--
--
--<(c0xFFFF0000)分解后装备消失,具体以实际获得到的分解数量为准.>
--]];
--	Actor.sendTipmsg(sysarg,e,4);
--end

BatchBoxFunc.ZSZhuangBeiHS = function(sysarg,ItemTable)
end

BatchBoxFunc.xinchun7111 = function(sysarg,ItemTable)
	local str = {
		"请放入满的福袋",
		"您放入的第%s个福袋不是满的.\\等你去采集满了之后再来找我兑换吧!",
		"您放入的%s无法提升,请检查是否放错物品了!\\只有<(c0xFFFF0000)%s>,<(c0xFFFF0000)%s>,<(c0xFFFF0000)%s>可以提升.",
		"福袋",
		"恭喜您兑换%s成功!",
		"<(c0xFFd4ab6f)[><(c0xFF00ff00)%s><(c0xFFd4ab6f)]在[><新年开运大使/M卧龙城:115:130:新年开运大使><(c0xFFd4ab6f)]兑换了[>%s<(c0xFFd4ab6f)],大家恭喜他吧!>",
	};
	local fd = {
	12,
	721,
	49000,
	646,

	}
	if not ItemTable[1] then Actor.sendTipmsg(sysarg,str[1],4); ItemTable = {}; return; end

	if #ItemTable ~= fd[1] then Actor.sendTipmsg(sysarg,str[1],4); ItemTable = {}; return; end

	for i = 1,#ItemTable do
		if i <=  fd[1] then
			if Item.getItemId(ItemTable[i]) ~= fd[2] then
				Actor.sendTipmsg(sysarg,str[1],4);
				return;
			end
		end
	end

	for i = 1,#ItemTable do
		if i <=  fd[1] then
			local ipItemDua = Item.getItemProperty(sysarg,ItemTable[i],Item.ipItemDua,0);
			local ipItemDuaMax = Item.getItemProperty(sysarg,ItemTable[i],Item.ipItemDuaMax,0);
			--if ipItemDua ~= ipItemDuaMax then Actor.sendTipmsg(sysarg,string.format(str[2],i),4); return; end
			if ipItemDua <= fd[3] then Actor.sendTipmsg(sysarg,string.format(str[2],i),4); return; end
		end
	end

	for i = 1,#ItemTable do Item.removeItem(sysarg,ItemTable[i],1,str[4],2); end
	Item.addItem(sysarg,fd[4],0,0,1);
	Actor.sendTipmsg(sysarg,string.format(str[5],Item.getItemLinkMsg(fd[4])),4);
	System.broadcastTipmsg(string.format(str[6],Actor.getName(sysarg),Item.getItemLinkMsg(fd[4])),128);
	ItemTable = {};
end