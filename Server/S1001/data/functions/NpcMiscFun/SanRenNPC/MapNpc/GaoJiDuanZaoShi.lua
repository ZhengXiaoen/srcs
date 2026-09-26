--#include "data\functions\VipRecovery.lua" once

local t = {
    --材料锻造数据
    clhcdata = {
        {465,464,3,500},
        {466,465,3,700},
        {467,466,3,900},
        {468,467,3,1200},

        {460,459,3,700}, --月纹强化石合成配置
        -- {461,460,3,800}, --日纹强化石合成配置
        -- {462,461,2,900}, --祖纹强化石合成配置
    },
--     need_itemid = 318,
--     data = {
-- [91]={430,421,204800,1,80},--霸主之刃
-- [92]={431,422,204800,1,80},--霸主之甲(男)
-- [93]={432,423,204800,1,80},--霸主之甲(女)
-- [94]={433,424,204800,1,80},--霸主之盔
-- [95]={434,425,204800,1,80},--霸主之链
-- [96]={435,426,204800,1,80},--霸主之镯
-- [97]={436,427,204800,1,80},--霸主之戒
-- [98]={437,428,204800,1,80},--霸主之带
-- [99]={438,429,204800,1,80},--霸主之靴
-- [100]={439,430,409600,2,80},--通天之刃
-- [101]={440,431,409600,2,80},--通天之甲(男)
-- [102]={441,432,409600,2,80},--通天之甲(女)
-- [103]={442,433,409600,2,80},--通天之盔
-- [104]={443,434,409600,2,80},--通天之链
-- [105]={444,435,409600,2,80},--通天之镯
-- [106]={445,436,409600,2,80},--通天之戒
-- [107]={446,437,409600,2,80},--通天之带
-- [108]={447,438,409600,2,81},--通天之靴
-- [109]={448,439,819200,4,80},--毁灭残纹
-- [110]={449,440,819200,4,80},--毁灭灵甲(男)
-- [111]={450,441,819200,4,80},--毁灭灵甲(女)
-- [112]={451,442,819200,4,80},--毁灭灵盔
-- [113]={452,443,819200,4,80},--毁灭灵链
-- [114]={453,444,819200,4,80},--毁灭灵镯
-- [115]={454,445,819200,4,80},--毁灭灵戒
-- [116]={455,446,819200,4,80},--毁灭灵带
-- [117]={456,447,819200,4,80},--毁灭灵靴
-- [118]={577,448,1638400,8,80},--奔雷金域棍
-- [119]={578,449,1638400,8,80},--奔雷域甲(男)
-- [120]={579,450,1638400,8,80},--奔雷域甲(女)
-- [121]={580,451,1638400,8,80},--奔雷域盔
-- [122]={581,452,1638400,8,80},--奔雷域链
-- [123]={582,453,1638400,8,80},--奔雷域镯
-- [124]={583,454,1638400,8,80},--奔雷域戒
-- [125]={584,455,1638400,8,80},--奔雷域带
-- [126]={585,456,1638400,8,80},--奔雷域靴
-- [127]={586,577,3276800,16,80},--雷神赤焰斩
-- [128]={587,578,3276800,16,80},--雷神焰甲(男)
-- [129]={588,579,3276800,16,80},--雷神焰甲(女)
-- [130]={589,580,3276800,16,80},--雷神焰盔
-- [131]={590,581,3276800,16,80},--雷神焰链
-- [132]={591,582,3276800,16,80},--雷神焰镯
-- [133]={592,583,3276800,16,80},--雷神焰戒
-- [134]={593,584,3276800,16,80},--雷神焰带
-- [135]={594,585,3276800,16,80},--雷神焰靴
-- [136]={595,586,6553600,32,80},--至尊血剑
-- [137]={596,587,6553600,32,80},--至尊血甲(男)
-- [138]={597,588,6553600,32,80},--至尊血甲(女)
-- [139]={598,589,6553600,32,80},--至尊血盔
-- [140]={599,590,6553600,32,80},--至尊血链
-- [141]={600,591,6553600,32,80},--至尊血镯
-- [142]={601,592,6553600,32,80},--至尊血戒
-- [143]={602,593,6553600,32,80},--至尊血带
-- [144]={603,594,6553600,32,80},--至尊血靴
--     },

    mhdata = {
[650] = {16, 32, 48, 64, 80},
[651] = {20, 40, 60, 80, 100},
[652] = {24, 48, 72, 96, 120},
[653] = {28, 56, 84, 112, 140},
[654] = {32, 64, 96, 128, 160},
[655] = {36, 72, 108, 144, 180},
[656] = {40, 80, 120, 160, 200},
[657] = {60, 120, 180, 240, 300},
[658] = {80, 160, 240, 320, 400},
[659] = {100, 200, 300, 400, 500},

[4715] = {16, 32, 48, 64, 80},
[4716] = {20, 40, 60, 80, 100},
[4717] = {24, 48, 72, 96, 120},
[4718] = {28, 56, 84, 112, 140},
[4719] = {32, 64, 96, 128, 160},
[4720] = {36, 72, 108, 144, 180},
[4721] = {40, 80, 120, 160, 200},
[4722] = {60, 120, 180, 240, 300},
[4723] = {80, 160, 240, 320, 400},
[4724] = {100, 200, 300, 400, 500},

    },
    SZmhdata = {
[660] = {16, 32, 48, 64, 80},
[661] = {20, 40, 60, 80, 100},
[662] = {24, 48, 72, 96, 120},
[663] = {28, 56, 84, 112, 140},
[664] = {32, 64, 96, 128, 160},
[665] = {36, 72, 108, 144, 180},
[666] = {40, 80, 120, 160, 200},
[667] = {60, 120, 180, 240, 300},
[668] = {80, 160, 240, 320, 400},
[669] = {100, 200, 300, 400, 500},

[4725] = {16, 32, 48, 64, 80},
[4726] = {20, 40, 60, 80, 100},
[4727] = {24, 48, 72, 96, 120},
[4728] = {28, 56, 84, 112, 140},
[4729] = {32, 64, 96, 128, 160},
[4730] = {36, 72, 108, 144, 180},
[4731] = {40, 80, 120, 160, 200},
[4732] = {60, 120, 180, 240, 300},
[4733] = {80, 160, 240, 320, 400},
[4734] = {100, 200, 300, 400, 500},

    },

    JFZB = {

            {3624,3625,100,},--神龙·裁决审判Lv1->神龙·裁决审判Lv2
            {3625,3626,200,},--神龙·裁决审判Lv2->神龙·裁决审判Lv3
            {3626,3627,400,},--神龙·裁决审判Lv3->神龙·裁决审判Lv4
            {3627,3628,1000,},--神龙·裁决审判Lv4->神龙·裁决审判LvMax
            {3628,3629,1500,},--神龙·裁决审判LvMax->神龙·圣界怒斩Lv1
            {3629,3630,2000,},--神龙·圣界怒斩Lv1->神龙·圣界怒斩Lv2
            {3630,3631,4000,},--神龙·圣界怒斩Lv2->神龙·圣界怒斩Lv3
            {3631,3632,6000,},--神龙·圣界怒斩Lv3->神龙·圣界怒斩Lv4
            {3632,3633,10000,},--神龙·圣界怒斩Lv4->神龙·圣界怒斩LvMax

            {3634,3635,100,},--伏魔·龙骨权杖Lv1->伏魔·龙骨权杖Lv2
            {3635,3636,200,},--伏魔·龙骨权杖Lv2->伏魔·龙骨权杖Lv3
            {3636,3637,400,},--伏魔·龙骨权杖Lv3->伏魔·龙骨权杖Lv4
            {3637,3638,1000,},--伏魔·龙骨权杖Lv4->伏魔·龙骨权杖LvMax
            {3638,3639,1500,},--伏魔·龙骨权杖LvMax->伏魔·圣界龙牙Lv1
            {3639,3640,2000,},--伏魔·圣界龙牙Lv1->伏魔·圣界龙牙Lv2
            {3640,3641,4000,},--伏魔·圣界龙牙Lv2->伏魔·圣界龙牙Lv3
            {3641,3642,6000,},--伏魔·圣界龙牙Lv3->伏魔·圣界龙牙Lv4
            {3642,3643,10000,},--伏魔·圣界龙牙Lv4->伏魔·圣界龙牙LvMax

            {3644,3645,100,},--灵兽·龙纹道意Lv1->灵兽·龙纹道意Lv2
            {3645,3646,200,},--灵兽·龙纹道意Lv2->灵兽·龙纹道意Lv3
            {3646,3647,400,},--灵兽·龙纹道意Lv3->灵兽·龙纹道意Lv4
            {3647,3648,1000,},--灵兽·龙纹道意Lv4->灵兽·龙纹道意LvMax
            {3648,3649,1500,},--灵兽·龙纹道意LvMax->灵兽·圣界逍遥Lv1
            {3649,3650,2000,},--灵兽·圣界逍遥Lv1->灵兽·圣界逍遥Lv2
            {3650,3651,4000,},--灵兽·圣界逍遥Lv2->灵兽·圣界逍遥Lv3
            {3651,3652,6000,},--灵兽·圣界逍遥Lv3->灵兽·圣界逍遥Lv4
            {3652,3653,10000,},--灵兽·圣界逍遥Lv4->灵兽·圣界逍遥LvMax

    },

    newzszb = {
        {4618, 577 },--上古开山 = 奔雷神斩
        {4619, 578 },--上古重甲(男) = 奔雷神甲(男)
        {4620, 579 },--上古重甲(女) = 奔雷神甲(女)
        {4621, 580 },--上古战盔 = 奔雷神盔
        {4622, 581 },--上古战链 = 奔雷神链
        {4623, 582 },--上古战镯 = 奔雷神镯
        {4624, 583 },--上古战戒 = 奔雷神戒
        {4625, 584 },--上古战带 = 奔雷神带
        {4626, 585 },--上古战靴 = 奔雷神靴
        {4627, 577 },--上古拂尘 = 奔雷神斩
        {4628, 578 },--上古魔袍(男) = 奔雷神甲(男)
        {4629, 579 },--上古魔袍(女) = 奔雷神甲(女)
        {4630, 580 },--上古法盔 = 奔雷神盔
        {4631, 581 },--上古法链 = 奔雷神链
        {4632, 582 },--上古法镯 = 奔雷神镯
        {4633, 583 },--上古法戒 = 奔雷神戒
        {4634, 584 },--上古法带 = 奔雷神带
        {4635, 585 },--上古法靴 = 奔雷神靴
        {4636, 577 },--上古霹雷 = 奔雷神斩
        {4637, 578 },--上古道衣(男) = 奔雷神甲(男)
        {4638, 579 },--上古道衣(女) = 奔雷神甲(女)
        {4639, 580 },--上古道盔 = 奔雷神盔
        {4640, 581 },--上古道链 = 奔雷神链
        {4641, 582 },--上古道镯 = 奔雷神镯
        {4642, 583 },--上古道戒 = 奔雷神戒
        {4643, 584 },--上古道带 = 奔雷神带
        {4644, 585 },--上古道靴 = 奔雷神靴
        {4645, 586 },--起源战刃 = 雷神王剑
        {4646, 587 },--起源战甲(男) = 雷神王甲(男)
        {4647, 588 },--起源战甲(女) = 雷神王甲(女)
        {4648, 589 },--起源战盔 = 雷神王盔
        {4649, 590 },--起源战链 = 雷神王链
        {4650, 591 },--起源战镯 = 雷神王镯
        {4651, 592 },--起源战戒 = 雷神王戒
        {4652, 593 },--起源战带 = 雷神王带
        {4653, 594 },--起源战靴 = 雷神王靴
        {4654, 586 },--起源法剑 = 雷神王剑
        {4655, 587 },--起源魔袍(男) = 雷神王甲(男)
        {4656, 588 },--起源魔袍(女) = 雷神王甲(女)
        {4657, 589 },--起源法盔 = 雷神王盔
        {4658, 590 },--起源法链 = 雷神王链
        {4659, 591 },--起源法镯 = 雷神王镯
        {4660, 592 },--起源法戒 = 雷神王戒
        {4661, 593 },--起源法带 = 雷神王带
        {4662, 594 },--起源法靴 = 雷神王靴
        {4663, 586 },--起源道剑 = 雷神王剑
        {4664, 587 },--起源道衣(男) = 雷神王甲(男)
        {4665, 588 },--起源道衣(女) = 雷神王甲(女)
        {4666, 589 },--起源道盔 = 雷神王盔
        {4667, 590 },--起源道链 = 雷神王链
        {4668, 591 },--起源道镯 = 雷神王镯
        {4669, 592 },--起源道戒 = 雷神王戒
        {4670, 593 },--起源道带 = 雷神王带
        {4671, 594 },--起源道靴 = 雷神王靴
        {4672, 595 },--誓言星王 = 至尊帝斩
        {4673, 596 },--誓言战甲(男) = 至尊帝甲(男)
        {4674, 597 },--誓言战甲(女) = 至尊帝甲(女)
        {4675, 598 },--誓言战盔 = 至尊帝盔
        {4676, 599 },--誓言战链 = 至尊帝链
        {4677, 600 },--誓言战镯 = 至尊帝镯
        {4678, 601 },--誓言战戒 = 至尊帝戒
        {4679, 602 },--誓言战带 = 至尊帝带
        {4680, 603 },--誓言战靴 = 至尊帝靴
        {4681, 595 },--誓言血饮 = 至尊帝斩
        {4682, 596 },--誓言魔袍(男) = 至尊帝甲(男)
        {4683, 597 },--誓言魔袍(女) = 至尊帝甲(女)
        {4684, 598 },--誓言法盔 = 至尊帝盔
        {4685, 599 },--誓言法链 = 至尊帝链
        {4686, 600 },--誓言法镯 = 至尊帝镯
        {4687, 601 },--誓言法戒 = 至尊帝戒
        {4688, 602 },--誓言法带 = 至尊帝带
        {4689, 603 },--誓言法靴 = 至尊帝靴
        {4690, 595 },--誓言天玑 = 至尊帝斩
        {4691, 596 },--誓言道衣(男) = 至尊帝甲(男)
        {4692, 597 },--誓言道衣(女) = 至尊帝甲(女)
        {4693, 598 },--誓言道盔 = 至尊帝盔
        {4694, 599 },--誓言道链 = 至尊帝链
        {4695, 600 },--誓言道镯 = 至尊帝镯
        {4696, 601 },--誓言道戒 = 至尊帝戒
        {4697, 602 },--誓言道带 = 至尊帝带
        {4698, 603 },--誓言道靴 = 至尊帝靴

    },
    zMHdz = {
{ 4715, 650, 4703, 20000,},--一级魔核(稀有)
{ 4716, 651, 4703, 40000,},--二级魔核(稀有)
{ 4717, 652, 4703, 60000,},--三级魔核(稀有)
{ 4718, 653, 4704, 80000,},--四级魔核(极品)
{ 4719, 654, 4704, 100000,},--五级魔核(极品)
{ 4720, 655, 4704, 120000,},--六级魔核(极品)
{ 4721, 656, 4705, 140000,},--七级魔核(上古)
{ 4722, 657, 4705, 160000,},--八级魔核(上古)
{ 4723, 658, 4705, 180000,},--九级魔核(上古)
{ 4724, 659, 4706, 200000,},--十级魔核(传说)
-- { 4725, 660, 4703, 20000,},--一级神装魔核(稀有)
-- { 4726, 661, 4703, 40000,},--二级神装魔核(稀有)
-- { 4727, 662, 4703, 60000,},--三级神装魔核(稀有)
-- { 4728, 663, 4704, 80000,},--四级神装魔核(极品)
-- { 4729, 664, 4704, 100000,},--五级神装魔核(极品)
-- { 4730, 665, 4704, 120000,},--六级神装魔核(极品)
-- { 4731, 666, 4705, 140000,},--七级神装魔核(上古)
-- { 4732, 667, 4705, 160000,},--八级神装魔核(上古)
-- { 4733, 668, 4705, 180000,},--九级神装魔核(上古)
-- { 4734, 669, 4706, 200000,},--十级神装魔核(传说)


    },

    --矿石兑换转生修为
    RebirthExp = {
        { 4703, 1, 6000}, 
        { 4704, 10, 60000}, 
        { 4705, 100, 600000}, 
        { 4706, 1000, 6000000}, 
    },

	--饰品合成与升级（合服之后显示）
	ShiPing = 
	{
		{
		5154,	--吊坠碎片
		5153,	--护肩碎片
		5152,	--面甲碎片
		5155,	--护膝碎片
		},
		{
		5140,	--主宰吊坠
		5141,	--主宰护肩
		5142,	--主宰面甲
		5143,	--主宰护膝
		},
		{
		5144,	--皓月吊坠
		5145,	--皓月护肩
		5146,	--皓月面甲
		5147,	--皓月护膝
		},
		{
		5148,	--热血吊坠
		5149,	--热血护肩
		5150,	--热血面甲
		5151,	--热血护膝
		},
	},
	
	
	--时装碎片兑换
	ShiZhuangDuiHuan=
	{
		{6691,6657,15}, --同样的碎片id ，孙悟空之魂id, 需要碎片数量
	},

	
	--兑换总
	duihuanAll=
	{
		{7046,7051,15,"三国时装碎片兑换",1}, --三国时装兑换
		{7039,6936,38,"至尊屠龙碎片兑换",1}, --至尊屠龙兑换
		
		{7557,6362,1,"至尊屠龙刀兑换",0}, --至尊屠龙兑换
		{7557,6945,1,"至尊屠龙甲兑换",0}, --至尊屠龙兑换
		{7557,6946,1,"至尊屠龙衣兑换",0}, --至尊屠龙兑换
        {7695,6947,1,"至尊屠龙盔兑换",0}, --至尊屠龙兑换
		{7695,6948,1,"至尊屠龙链兑换",0}, --至尊屠龙兑换
		{7695,6949,1,"至尊屠龙戒兑换",0}, --至尊屠龙兑换
        {7695,6950,1,"至尊屠龙镯兑换",0}, --至尊屠龙兑换
		{7695,6951,1,"至尊屠龙带兑换",0}, --至尊屠龙兑换
		{7695,6952,1,"至尊屠龙靴兑换",0}, --至尊屠龙兑换
		
		{7810,6371,15,"幻羽碎片兑换",1}, --幻羽碎片兑换
		{7811,7047,15,"坐骑碎片兑换",1}, --坐骑碎片兑换
		{7039,7557,88,"至尊屠龙令兑换",1}, --至尊屠龙碎片兑换至尊屠龙令
	},
	
};




--<#c0xFFFFFF00#合成神装魔核/@onHCMoHeSZ|需要消耗普通魔核#各危险地图小怪掉落魔核.> 
t.buyzm = function(sysarg,id)
    id = tonumber(id);
	Actor.openDialogs(sysarg,diBuyAnItem,id);
end
t.main = function(sysarg)
    -- for i = 1,10 do
    --     Actor.addItem(sysarg,649+i,0,0,250)
    -- end
    local data = t.data;
    local iSJS = Item.getItemName(t.need_itemid);
    --已废弃的
 --<兑换金条/@jt,1|需要非绑定金币: 202,000> <兑换金砖/@jt,2|需要非绑定金币: 606,000> <兑换大金砖/@jt,3|需要非绑定金币: 1,010,000>--废弃

 --<#c0xFFFFFF00#提升成长武器/@onTiShengJFWQ|新版神器已出,优势大于成长武器.><(神龙-伏魔-灵兽系列)>  <#c0xFFFFFF00#成长武器回收/@onOldGodRecord|新版本神器具有超强攻击力+准确提升打人不闪避,你值得拥有！#神器唯一的升级方式就是需要神魂,通过成长武器回收可获得大量神魂.>
 --<(c0xFFb6946c)当前BOSS积分：><]]..get_d_val(sysarg,116).."> <一键兑换神魂/@exchangesoul|2点BOSS积分可兑换一点神魂,神魂是升级神器的唯一材料.> "..[[
    --<打开仓库/@ShowStorageWin>
	local e = [[
<(idecoLine#330)>
 <女娲神石：
        传闻是曾经补天剩下的神石,具有无限神力,集齐99颗便可兑换女娲宝藏,那可是好东西呦！>
                        <兑换宝藏/@duihuannvwashi>
                <(c0xFF00c0ff)女娲神石在各活动期间内产出>
<(idecoLine#330)>
    <(c0xFFb6946c)矿石兑奖:> <#c0xFFFFFF00#黑铁矿/@onRebirthExp,1|在矿区挖矿获得#点击随机获得转生修为或绑定金币> <#c0xFFFFFF00#青金石矿/@onRebirthExp,2|在矿区挖矿获得#点击随机获得转生修为或绑定金币> <#c0xFFFFFF00#绿宝石矿/@onRebirthExp,3|在矿区挖矿获得#点击随机获得转生修为或绑定金币> <#c0xFFFFFF00#钻石矿/@onRebirthExp,4|在矿区挖矿获得#点击随机获得转生修为或绑定金币>
      <(c0xFF846f57)挖矿获得的矿石可以兑换获得转生修为或绑定金币> 
<(idecoLine#330)>   <碎片兑换：>   <(c0xFF00c0ff)各碎片在各活动期间内产出>
    <西游时装碎片兑换/@onduihuanshizhuang|15个西游时装碎片可随机兑换一个西游成品,可在角色-时装处激活> <三国时装兑换/@suihuanAllFunc,1|15个三国时装碎片可随机兑换一个三国时装成品,可佩戴在角色-时装中>  <至尊屠龙碎片兑换/@suihuanAllFunc,2|38个至尊屠龙碎片可兑换一个至尊屠龙首饰盒,碎片来源于活动>\   <至尊屠龙令兑换/@suihuanAllFunc,14|88个至尊屠龙碎片可兑换一个至尊屠龙令,可用于兑换至尊屠龙刀、甲或衣>\   <幻羽兑换/@suihuanAllFunc,12|15个幻羽碎片可随机兑换一个幻羽礼箱,可在翅膀-幻羽处激活>   <坐骑兑换/@suihuanAllFunc,13|15个坐骑碎片可随机兑换一个坐骑礼盒,可在坐骑-幻化处激活>
<(idecoLine#330)>   <至尊屠龙部件兑换：>     <(c0xFF00c0ff)至尊屠龙令可由88个碎片兑换，至尊屠龙牌在其他活动中产出>
                    <至尊屠龙部件兑换/@duihuanye>
<(idecoLine#330)>  <(c0xFF00c0ff)至尊屠龙衣服互换： 所需消耗88800元宝>
	    <至尊屠龙甲> <(c0xFFeabc78)→> <至尊屠龙衣> <互换/@onchangeGoods,1|每次兑换所需消耗88800元宝>
            <至尊屠龙衣> <(c0xFFeabc78)→> <至尊屠龙甲> <互换/@onchangeGoods,2|每次兑换所需消耗88800元宝>
	
]];


--<至尊屠龙刀兑换/@suihuanAllFunc,3|1至尊屠龙令可兑换一个至尊屠龙刀,屠龙令来源于庆典转盘> <至尊屠龙甲兑换/@suihuanAllFunc,4|1至尊屠龙令可兑换一个至尊屠龙甲,屠龙令来源于庆典转盘> <至尊屠龙衣兑换/@suihuanAllFunc,5|1至尊屠龙令可兑换一个至尊屠龙衣,屠龙令来源于庆典转盘>

--end


--兑换衣服
t.onchangeGoods =function(sysarg,index)

	index =tonumber(index)
	local item1= 0
	local item2= 0
	if index==1 then 
		item1 =6945  
		item2 =6946
	elseif index==2 then 
		item2 =6945  
		item1 =6946
	end
	
	local itemCount = Actor.getItemCount(sysarg,item1,-1,-1,-1)
	if itemCount<1 then 
		Actor.sendTipmsg(sysarg,"背包里没有至尊屠龙,没法换啊！",ttFlyTip)
		return 
	end
	
	if not Actor.changeMoney(sysarg, 3, -88800, LogIds.changezhizhuntulong, "至尊屠龙兑换") then
		Actor.sendTipmsg(sysarg,"元宝不足,兑换失败", ttFlyTip);
		return
	end
	
	if Actor.removeItem(sysarg, item1, 1, -1, -1, -1, "至尊屠龙兑换",LogIds.changezhizhuntulong) <1 then
		Actor.sendTipmsg(sysarg,"扣除物品失败", ttFlyTip);
		return
	end
	
	Actor.addItem(sysarg,item2,0,0,1,0,0,"至尊屠龙兑换",LogIds.changezhizhuntulong)
	Actor.sendTipmsg(sysarg,"兑换成功",ttFlyTip)
	
end

	--是否是合服后
---	local CombineDays = System.getDaysSinceCombineServer()
---	if CombineDays>0 then 
---		e = e .. [[
---<(idecoLine#330)>
---    <(c0xFFb6946c)饰品碎片合成饰品:> <主宰饰品合成/@shipinghecheng,1 |10个饰品碎片可合成一件主宰饰品>		
---
---    <(c0xFFb6946c)饰品升级:>   <升级为皓月饰品/@shipinghecheng,2 |4件主宰饰品可合成一件皓月饰品> 
---                 <升级为热血饰品/@shipinghecheng,3 |4件皓月饰品可合成一件热血饰品>
---
---    <(c0xFFb6946c)饰品来源：><探索宝藏/@@showWin,31|主宰饰品只限于合服活动5天内寻宝产出  >  <(c0xFFb6946c)饰品碎片来源：><(c0xFF00FF00)转生地宫首领掉落> 
---    
---
---
---    ]]
---	
---	end
    return e;
end


t.duihuanye= function(sysarg)
	local e ="\\             "
	for i=3,11 do 
		e =e..Item.getItemLinkMsg(t.duihuanAll[i][1]) .."   <(c0xFFb6946c)*>    <(c0xFFb6946c)"..t.duihuanAll[i][3] ..">   <(c0xFFb6946c)=>    " ..Item.getItemLinkMsg(t.duihuanAll[i][2]) .." <兑换/@suihuanAllFunc,"..i..">\\\\             "
	end

	e=e.."                  <返回上一页/@main>\\"
	return e
	
end

t.suihuanAllFunc =function(sysarg,index)
	index =tonumber(index)
	if index<1 and index>#t.duihuanAll then 
		return 
	end
	
	local cgf =nil
	if index ==1 then 
	   cgf= t.duihuanAll[1]
	elseif index ==2 then 
		cgf= t.duihuanAll[2]
	elseif index ==3 then 
		cgf= t.duihuanAll[3]
	elseif index ==4 then 
		cgf= t.duihuanAll[4]
	elseif index ==5 then 
		cgf= t.duihuanAll[5]
	else	
		cgf= t.duihuanAll[index]
	end
	
	--判断是否够材料
	if Actor.getItemCount(sysarg,cgf[1]) < cgf[3] then 
		Actor.sendTipmsg(sysarg,"背包里面的"..Item.getItemName(cgf[1]).."不足"..cgf[3]..",操作失败",ttFlyTip)
		return 
	end

	--判断背包空间
	local bagIdxs = Item.getBagEmptyGridCount(sysarg)
	if bagIdxs <= 0 then
		Actor.sendTipmsg(sysarg, "背包空间不足",ttFlyTip)
		return 
	end

	local logid = 1
	if index ==1 then 
		logid = LogIds.duihuansanguoshizhuanghun
	elseif index==2 or index==14 then
		logid =LogIds.duihuanzhizhuntulong
	end

	--扣除材料
	if Actor.removeItem(sysarg,cgf[1],cgf[3],-1,-1,-1,cgf[4],logid) == cgf[3] then
		Actor.addItem(sysarg, cgf[2], 0, 0, 1,cgf[5],0,cgf[4],logid)
		
		if index>=3 and index<=11 then
		local msg = string.format("玩家<(n%s)>使用至尊屠龙令兑换了%s,有钱真的可以为所欲为.  <我也要兑换/M威龙城:128:139:>", Actor.getName(sysarg),Item.getItemLinkMsg(cgf[2]))
			if index>5 then 
				msg = string.format("玩家<(n%s)>使用至尊屠龙牌兑换了%s,有钱真的可以为所欲为.  <我也要兑换/M威龙城:128:139:>", Actor.getName(sysarg),Item.getItemLinkMsg(cgf[2]))
			end
			System.broadcastTipmsg(msg, ttChatWindow )
		end
	end
end

--时装碎片兑换
t.onduihuanshizhuang =function(sysarg)
	--local e = [[\\]]
	--
	--for i=1,#t.ShiZhuangDuiHuan do 
	--	e=e..Item.getItemLinkMsg(t.ShiZhuangDuiHuan[i][1]).."<(c0xFF00c0ff)*"..t.ShiZhuangDuiHuan[i][3].." >→ "..Item.getItemLinkMsg(t.ShiZhuangDuiHuan[i][2]).."      <兑换/@doshizhuangduihuan,"..i..">\\\\"
	--end 
	--		
    --      
	--	e=e..[[\\                     <返回上一层/@main>
	--  ]]
	--  return e
	local nRandamPos = math.random(#t.ShiZhuangDuiHuan)
	t.doshizhuangduihuan(sysarg,nRandamPos)
end


--时装碎片兑换
t.doshizhuangduihuan =function(sysarg,index)
	index =tonumber(index)
	local cgf = t.ShiZhuangDuiHuan[index]
	
	--判断是否够材料
	if Actor.getItemCount(sysarg,cgf[1]) < cgf[3] then 
		Actor.sendTipmsg(sysarg,"背包里面的"..Item.getItemName(cgf[1]).."不足"..cgf[3]..",操作失败",ttFlyTip)
		return 
	end
	
	--判断背包空间
	local bagIdxs = Item.getBagEmptyGridCount(sysarg)
	if bagIdxs <= 0 then
		Actor.sendTipmsg(sysarg, "背包空间不足",ttFlyTip)
		return 
	end
	
	--扣除材料
	if Actor.removeItem(sysarg,cgf[1],cgf[3],-1,-1,-1,"兑换时装魂",LogIds.duihuanshizhuanghun) == cgf[3] then
		Actor.addItem(sysarg, cgf[2], 0, 0, 1,1,0,"兑换时装魂",LogIds.duihuanshizhuanghun)
	end

end

--女娲石兑换
t.duihuannvwashi = function(sysarg)
	local needId = 6660
	local needCount  = 99 
	local giveId = 6675
	
	--判断是否够材料
	if Actor.getItemCount(sysarg,needId) < needCount then 
		Actor.sendTipmsg(sysarg,"背包里面的"..Item.getItemName(needId).."不足"..needCount..",操作失败",ttFlyTip)
		return 
	end
	
	--判断背包空间
	local bagIdxs = Item.getBagEmptyGridCount(sysarg)
	if bagIdxs <= 0 then
		Actor.sendTipmsg(sysarg, "背包空间不足",ttFlyTip)
		return 
	end
	
	--扣除材料
	if Actor.removeItem(sysarg,needId,needCount,-1,-1,-1,"兑换女娲石",LogIds.duihuannvwashi) == needCount then
		Actor.addItem(sysarg, giveId, 0, 0, 1,1,0,"兑换女娲石",LogIds.duihuannvwashi);
		
		local str = "<n%s>玩家历经千辛万苦凑齐99颗%s,在万事通处兑换了一个<女娲宝藏>,传闻里面有非常极品的道具！ 我也要兑换<(x威龙城:126:141:[传])>"
        str = str.format(str,Actor.getName(sysarg),Item.getItemLinkMsg(needId))
        System.broadcastTipmsg(str,ttChatWindow)
	end
end

t.senluoshenjieraco = function(sysarg)

    local YUANBAO = 1888
    local sVar = Actor.getStaticVar(sysarg)
    local nStartTime = System.encodeNumTime(2017,9,25,0,0,0)
    local nLastLogin = Actor.getLastLogoutTime(sysarg)
    if sVar.bGivegodring == nil then sVar.bGivegodring = true end
    if nLastLogin < nStartTime then
        sVar.bGivegodring = false
    end
    if sVar.bGivegodring == false then
         Actor.sendTipmsg(sysarg, "森罗神戒的回收改为9月25号以后登录的用户才可以领取。25号之前登录的，没有领取资格。", ttFlyTip)
        return
    end
    if sVar.SLSJc ==nil then 
			sVar.SLSJc =0 
	end
    if sVar.SLSJc == 0 then
        Actor.sendTipmsg(sysarg, "没有可以回收的森罗神戒", ttFlyTip)
        return
    end
    local equipItem_ptr = Item.getEquipByPos(sysarg, 48)
	if equipItem_ptr~=nil then 
		Item.removeEquip(sysarg,equipItem_ptr,"森罗神戒回收",LogIds.SenLuoShenJieHuiShou)
	end
    local nYuanBao = YUANBAO * sVar.SLSJc
    Actor.changeMoney(sysarg,mtYuanbao,nYuanBao,LogIds.SenLuoShenJieHuiShou,"森罗神戒回收"..sVar.SLSJc.."级")

  
    Actor.sendTipmsg(sysarg, "成功回收森罗神戒,当前等级:"..sVar.SLSJc.."获得元宝:"..nYuanBao, ttFlyTip)
    sVar.SLSJc = 0
end

--老神器回收
t.onOldGodRecord = function(sysarg,param)

    local cfg = 
    {
        {
            nItemId = 3624,
            nGodSoul = 30,
        },
        {
            nItemId = 3625,
            nGodSoul = 60,
        },
        {
            nItemId = 3626,
            nGodSoul = 120,
        },
        {
            nItemId = 3627,
            nGodSoul = 240,
        },
        {
            nItemId = 3628,
            nGodSoul = 600,
        },
        {
            nItemId = 3629,
            nGodSoul = 900,
        },
        {
            nItemId = 3630,
            nGodSoul = 1200,
        },
        {
            nItemId = 3631,
            nGodSoul = 2400,
        },
        {
            nItemId = 3632,
            nGodSoul = 3600,
        },
        {
            nItemId = 3633,
            nGodSoul = 6000,
        },
        {
            nItemId = 3634,
            nGodSoul = 30,
        },
        {
            nItemId = 3635,
            nGodSoul = 60,
        },
        {
            nItemId = 3636,
            nGodSoul = 120,
        },
        {
            nItemId = 3637,
            nGodSoul = 240,
        },
        {
            nItemId = 3638,
            nGodSoul = 600,
        },
        {
            nItemId = 3639,
            nGodSoul = 900,
        },
        {
            nItemId = 3640,
            nGodSoul = 1200,
        },
        {
            nItemId = 3641,
            nGodSoul = 2400,
        },
        {
            nItemId = 3642,
            nGodSoul = 3600,
        },
        {
            nItemId = 3643,
            nGodSoul = 6000,
        },
        {
            nItemId = 3644,
            nGodSoul = 30,
        },
        {
            nItemId = 3645,
            nGodSoul = 60,
        },
        {
            nItemId = 3646,
            nGodSoul = 120,
        },
        {
            nItemId = 3647,
            nGodSoul = 240,
        },
        {
            nItemId = 3648,
            nGodSoul = 600,
        },
        {
            nItemId = 3649,
            nGodSoul = 900,
        },
        {
            nItemId = 3650,
            nGodSoul = 1200,
        },
        {
            nItemId = 3651,
            nGodSoul = 2400,
        },
        {
            nItemId = 3652,
            nGodSoul = 3600,
        },
        {
            nItemId = 3653,
            nGodSoul = 6000,
        },


    }
    ----没有购买新神器不允许回收

    local var = Actor.getStaticVar(sysarg)

    if var.godSoulValue == nil then var.godSoulValue = 0 end
    local pItem = Item.getEquipByPos(sysarg,itPayWeaponPos)
    local sItemName = "未佩戴"
     local nGodSoulValue= 0
    if pItem ~= nil then
       local nItemId = Item.getItemProperty(sysarg,pItem,Item.ipItemID,0)
       sItemName = Item.getItemName(nItemId)
       for i = 1,table.getn(cfg) do
        if cfg[i].nItemId == nItemId then
            nGodSoulValue = cfg[i].nGodSoul
            break
        end
       end
    end
        if var.buyoldgod == nil then
    local str=[[     不能兑换%s
需购买散人神装礼包，才可进行回收！
去购买礼包！<购买/@@showWin,205>]]
str = string.format(str,sItemName)
        Actor.sendTipmsg(sysarg,str,ttDialog)
        return
    end
    if param == nil then
        local str = [[
       
        <(c0xFFb6946c)当前佩戴成长武器:> <%s>
       
        <(c0xFFb6946c)回收可获得神魂数量：><%d>   <回收/@onOldGodRecord,1>

        <(c0xFFc4c7ca)神魂是新版神器成长所需的唯一资源>   

        <查看新版神器系统/@@showWin,200>  <(c0xFF00c0ff)点击打开神装系统界面>]]..
        [[
                  
        
        
        <#BN返回/@main>
    ]]
        str = string.format(str,sItemName,nGodSoulValue)
        return str
    else
        if pItem == nil then
            Actor.sendTipmsg(sysarg,"没有穿戴老版神器，无法回收！",ttFlyTip) 
            return
        end
        if nGodSoulValue == 0  then
            Actor.sendTipmsg(sysarg,"已经是新版神器，无法回收！",ttFlyTip) 
            return
        end
        var.godSoulValue = var.godSoulValue + nGodSoulValue
        Actor.sendTipmsg(sysarg,"回收成功,获得神魂值："..nGodSoulValue,ttFlyTip)
         local nItemId = Item.getItemProperty(sysarg,pItem,ipItemID) 
        Item.removeEquip(sysarg,pItem,"老版神器回收",LogIds.oldGodRecord)

        local str = "有人将%s兑换获得了%d个神魂!我也要去<(x威龙城:126:141:[传])>"
        str = str.format(str,Item.getItemLinkMsg(nItemId),nGodSoulValue)
        System.broadcastTipmsg(str,ttChatWindow)
        return t.main(sysarg)
    end

end

t.exchangesoul = function(sysarg)
   
    if get_d_val(sysarg,116) < 2 then
        Actor.sendTipmsg(sysarg,"Boss积分不足,无法兑换！",ttFlyTip) 
        return
    end
    local nAllValue= get_d_val(sysarg,116)
    if nAllValue % 2 == 1 then 
        nAllValue = nAllValue - 1
    end
    del_d_val(sysarg,116,nAllValue)
    local var = Actor.getStaticVar(sysarg)
    if var.godSoulValue == nil then var.godSoulValue = 0 end
    local nOldSoul = var.godSoulValue
    var.godSoulValue = var.godSoulValue + nAllValue / 2
   
    Actor.sendTipmsg(sysarg,"兑换成功,当前神魂值:"..var.godSoulValue,ttFlyTip) 
    local str = "<(n%s)>玩家兑换了所有BOSS积分,获得大量神魂,神魂可直接提升神器神甲.我也要兑换<(x威龙城:123:139:[传])>"
    str = string.format(str,Actor.getName(sysarg))
    System.broadcastTipmsg(str,ttChatWindow)

    local nActorId = Actor.getIntProperty(sysarg,nActorId)
    System.sendCommonLog(LogIds.exchangesoul,nActorId,Actor.getName(sysarg),nOldSoul,var.godSoulValue,nAllValue / 2)
    return t.main(sysarg)
end
--合成饰品

t.shipinghecheng = function(sysarg,index)
	index = tonumber(index)

	if index== 1 then 
     e = [[ 

    <(c0xFFb6946c)请选择您要合成的饰品:>]]
		..[[ 
<(idecoLine#350)>

    ]]..Item.getItemLinkMsg(t.ShiPing[2][1])..[[ <点击合成/@onshipinghecheng,1,1 |主宰吊坠合成#所需 吊坠碎片*10 >  
                                   
    ]]..Item.getItemLinkMsg(t.ShiPing[2][2])..[[ <点击合成/@onshipinghecheng,1,2 |主宰护肩合成#所需 护肩碎片*10 >    
                                     
    ]]..Item.getItemLinkMsg(t.ShiPing[2][3])..[[ <点击合成/@onshipinghecheng,1,3 |主宰面甲合成#所需 面甲碎片*10 > 
                                     
    ]]..Item.getItemLinkMsg(t.ShiPing[2][4])..[[ <点击合成/@onshipinghecheng,1,4 |主宰护膝合成#所需 护膝碎片*10 >
<(idecoLine#350)>

     <(c0xFFb6946c)饰品碎片来源：> <(c0xFF00FF00)转生地宫首领掉落>  

    ]]

	elseif index== 2 then 
		e = [[ 

    <(c0xFFb6946c)请选择您要升级的饰品:>
    ]]
        ..[[
<(idecoLine#350)>

    ]]..Item.getItemLinkMsg(t.ShiPing[3][1])..[[ <点击升级/@onshipinghecheng,2,1 |皓月吊坠合成#所需 主宰吊坠*4 > 
                                      
    ]]..Item.getItemLinkMsg(t.ShiPing[3][2])..[[ <点击升级/@onshipinghecheng,2,2 |皓月护肩合成#所需 主宰护肩*4 >
                                        
    ]]..Item.getItemLinkMsg(t.ShiPing[3][3])..[[ <点击升级/@onshipinghecheng,2,3 |皓月面甲合成#所需 主宰面甲*4 > 
                                       
    ]]..Item.getItemLinkMsg(t.ShiPing[3][4])..[[ <点击升级/@onshipinghecheng,2,4 |皓月护膝合成#所需 主宰护膝*4 >
<(idecoLine#350)>

    <(c0xFFb6946c)饰品来源:>  <探索宝藏/@@showWin,31|主宰饰品只限于合服活动5天内寻宝产出  >    <主宰饰品合成/@shipinghecheng,1 |饰品碎片*10>

    ]]
	elseif index== 3 then 
		e = [[  

    <(c0xFFb6946c)请选择您要升级的饰品:>]]
        ..[[
<(idecoLine#350)>

    ]]..Item.getItemLinkMsg(t.ShiPing[4][1])..[[ <点击升级/@onshipinghecheng,3,1 |热血吊坠合成#所需 皓月吊坠*4 > 
                                         
    ]]..Item.getItemLinkMsg(t.ShiPing[4][2])..[[ <点击升级/@onshipinghecheng,3,2 |热血护肩合成#所需 皓月护肩*4 >
                                          
    ]]..Item.getItemLinkMsg(t.ShiPing[4][3])..[[ <点击升级/@onshipinghecheng,3,3 |热血面甲合成#所需 皓月面甲*4 > 
                                         
    ]]..Item.getItemLinkMsg(t.ShiPing[4][4])..[[ <点击升级/@onshipinghecheng,3,4 |热血护膝合成#所需 皓月护膝*4 >
<(idecoLine#350)>

    <(c0xFFb6946c)饰品来源:>  <探索宝藏/@@showWin,31|主宰饰品只限于合服活动5天内寻宝产出  >    <皓月饰品合成/@shipinghecheng,2 |主宰饰品*4>

    ]]
	end
	
	e=e..[[
	
	
	
	
	
	<#BN返回/@main>]]
	return e
end

t.onshipinghecheng =function(sysarg,i,j)
	i = tonumber(i)
	j = tonumber(j)
	local needItemId = t.ShiPing[i][j]
	local addItemId = t.ShiPing[i+1][j]
	if needItemId == nil or addItemId == nil then return end
	
	local needItemCount =4 
	if i==1 then needItemCount = 10 end 
	
	--判断是否够材料
	if Actor.getItemCount(sysarg,needItemId) < needItemCount then --10合1
		Actor.sendTipmsg(sysarg,"背包里面的"..Item.getItemName(needItemId).."不足"..needItemCount..",操作失败",ttFlyTip)
		return 
	end
	
	--判断背包空间
	local bagIdxs = Item.getBagEmptyGridCount(sysarg)
	if bagIdxs <= 0 then
		Actor.sendTipmsg(sysarg, "背包空间不足",ttFlyTip)
		return 
	end
	
	--扣除材料
	if Actor.removeItem(sysarg,needItemId,needItemCount,-1,-1,-1,"饰品合成",2670) == needItemCount then
		--给物品
		--Actor.addItem(sysarg, addItemId, 0, 0, 1, 0, 0, "饰品合成", 2670);
		local nNewItem = Item.createItem(addItemId,1,0,0,0,0);
		if nNewItem ~= nil then 
			Item.addItem(sysarg,nNewItem,"饰品合成",2670);
			local zhaoHuanQiangDu = 2 + System.getRandomNumber(5); --产生0~3
			Item.setItemProperty(sysarg,nNewItem,Item.ipTaoStrong,zhaoHuanQiangDu);
		end
		
	end
end


-- <(idecoLine#330)>
 
--   <#c0xFFFFFF00#锻造真·魔核必加最高伤害/@onHCzMoHe|需要消耗魔核和稀有以上的矿石#此类魔核使用后直接给装备加上最高属性> 

t.onRebirthExp = function(sysarg,i)
    if not i then return; end
    i = tonumber(i);
    local d = t.RebirthExp[i];
    if not d then return; end
    local itemid = d[1];
	local hasCount = Actor.getItemCount(sysarg,  itemid)
    
    if Actor.getItemCount(sysarg,  itemid) == 0 then
        Actor.sendTipmsg(sysarg, string.format("您的包裹内没有<%s>,兑换失败.", Item.getItemName(itemid), 1), 256);
        return;
    end
    local addxwCount = 0
    local addgoldCount = 0
    if Actor.removeItem(sysarg, itemid, hasCount, -1,-1,-1) then
        for i =1,hasCount do
            if System.getRandomNumber(10000) <= 5000 then
                local addxw = d[2] ;
                if addxw == 0 then addxw = 1 end
                addxwCount = addxwCount + addxw
                local NowExp = Actor.getIntProperty(sysarg, PROP_ACTOR_CIRCLE_SOUL);
                Actor.setIntProperty(sysarg, PROP_ACTOR_CIRCLE_SOUL, (NowExp+addxw) );
                local nActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
                System.sendCommonLog(LogIds.shiyongzhuanshengxiuweidan,nActorId,Actor.getName(sysarg),0,NowExp-addxw,NowExp,"矿石换修为")
            else
                local addgold =  d[3] ;
                addgoldCount = addgoldCount + addgold
                Actor.changeMoney(sysarg, 0, addgold, "矿石换绑定金币", LogIds.kuangshihuanjinbi);
            end
        end
        local NowExp = Actor.getIntProperty(sysarg, PROP_ACTOR_CIRCLE_SOUL);
        Actor.sendTipmsg(sysarg,string.format("<(c0xFFFFFF00)%s当前总数%s>", "转生修为", NowExp), 1 );
        Actor.sendTipmsg(sysarg,string.format("<(c0xFFFFFF00)%s增加%s,%s增加%s.>", "转生修为", addxwCount, "绑定金币", addgoldCount), 256);
        local NpcName = Actor.getTalkNpcName(sysarg);
        local StrNpcE = string.format("<%s/M威龙城:124:140:%s><(x威龙城:124:140:%s)>",NpcName,NpcName,NpcName);
        local sNotict = string.format("<(n%s)>在%s使用%s兑换了", Actor.getName(sysarg), StrNpcE, Item.getItemLinkMsg(itemid))
        if addgoldCount > 0 then
            sNotict = sNotict..string.format("<%s>枚<绑定金币>",addgoldCount)
            if addxwCount > 0 then
                sNotict = sNotict.."和"
            end
        end

        if addxwCount > 0 then
             sNotict = sNotict..string.format("<%s>点<转生修为>.",addxwCount)
        end
         System.broadcastTipmsg(sNotict,128)
       -- System.broadcastTipmsg(string.format("<(n%s)>在%s使用%s兑换了<%s>枚<绑定金币>和<%s>点<转生修为>.", Actor.getName(sysarg), StrNpcE, Item.getItemLinkMsg(itemid), addgoldCount, addxwCount ),128);
    end

--    if hasCount > 1 then
--        if Actor.removeItem(sysarg, itemid, hasCount, -1,-1,-1) then
--            local addxw = math.floor(d[2]*hasCount / 2);
--            local addgold = math.floor(hasCount * d[3] / 1);
--            Actor.changeMoney(sysarg, 0, addgold, "矿石换绑定金币", LogIds.kuangshihuanjinbi);
--            local NowExp = Actor.getIntProperty(sysarg, PROP_ACTOR_CIRCLE_SOUL);
--            Actor.setIntProperty(sysarg, PROP_ACTOR_CIRCLE_SOUL, (NowExp+addxw) );

--            NowExp = Actor.getIntProperty(sysarg, PROP_ACTOR_CIRCLE_SOUL);
--            local nActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
--            System.sendCommonLog(LogIds.shiyongzhuanshengxiuweidan,nActorId,Actor.getName(sysarg),0,NowExp-addxw,NowExp,"矿石换修为")
--            Actor.sendTipmsg(sysarg,string.format("<(c0xFFFFFF00)%s当前总数%s>", "转生修为", NowExp), 1 );
--            Actor.sendTipmsg(sysarg,string.format("<(c0xFFFFFF00)%s增加%s,%s增加%s.>", "转生修为", addxw, "绑定金币", addgold), 256);
--            local NpcName = Actor.getTalkNpcName(sysarg);
--            local StrNpcE = string.format("<%s/M威龙城:124:140:%s><(x威龙城:124:140:%s)>",NpcName,NpcName,NpcName);
--            System.broadcastTipmsg(string.format("<(n%s)>在%s使用%s兑换了<%s>枚<绑定金币>和<%s>点<转生修为>.", Actor.getName(sysarg), StrNpcE, Item.getItemLinkMsg(itemid), addgold, addxw ),128);
--        end
--    else

--        if Actor.removeItem(sysarg, itemid, hasCount, -1,-1,-1) then
--            local addgold = hasCount * d[3];
--            Actor.changeMoney(sysarg, 0, addgold, "矿石换绑定金币", LogIds.kuangshihuanjinbi);
--            local NpcName = Actor.getTalkNpcName(sysarg);
--            Actor.sendTipmsg(sysarg,string.format("<(c0xFFFFFF00)%s增加%s.>", "绑定金币", addgold), 256);
--            local StrNpcE = string.format("<%s/M威龙城:124:140:%s><(x威龙城:124:140:%s)>",NpcName,NpcName,NpcName);
--            System.broadcastTipmsg(string.format("<(n%s)>在%s使用%s兑换了<%s>枚<绑定金币>.", Actor.getName(sysarg), StrNpcE, Item.getItemLinkMsg(itemid), addgold ),128);
--        end
--    end
    return t.main(sysarg);

end

t.onHCzMoHe = function(sysarg)
    local d = t.zMHdz;
    local e = "\\  <(c0xFFb6946c)请选择您要锻造的真·魔核,矿石在矿洞挖矿获得.> <返回/@main>\\\\";

    for i = 1,#d do
        local _,b = math.modf(i/2);
        local hhf = " ";
        if b == 0 then hhf = "\\\\"; end
        e = e .. string.format("  <锻造%s/@onHCzMoHeEx,%s|需要 %s 10颗加上 %s1块#以及%s绑金或金币的手工打造费用.>"..hhf, Item.getItemName(d[i][1]), i, Item.getItemName(d[i][2]), Item.getItemName(d[i][3]), d[i][4]);

    end
    return e;
end

t.onHCzMoHeEx = function(sysarg,i)
    if not i then return; end
    i = tonumber(i);
    local d = t.zMHdz[i];
    if not d then return; end
    local takeid1 = d[2];
    local takeid2 = d[3];
    local del_ngold = d[4];
    local giveid = d[1];

    MC = 2;
    if Actor.getMoneyCount(sysarg,1) >= del_ngold then MC = 1; end
    if Actor.getMoneyCount(sysarg,0) >= del_ngold then MC = 0; end
    if MC == 2 then
        Actor.sendTipmsg(sysarg, string.format("您的绑金或金币不足 <%s> ,锻造失败..",del_ngold), 256);
        return ;
    end

    if Actor.getItemCount(sysarg,  takeid1) < 10 then
        Actor.sendTipmsg(sysarg, string.format("您的 <%s> 不足 <%s> ,锻造失败..", Item.getItemName(takeid1), 10), 256);
        return ;
    end
    if Actor.getItemCount(sysarg,  takeid2) < 1 then
        Actor.sendTipmsg(sysarg, string.format("您的 <%s> 不足 <%s> ,锻造失败..", Item.getItemName(takeid2), 1), 256);
        return ;
    end

    Actor.changeMoney(sysarg, MC, -del_ngold, 127, "合成真·魔核消耗");
    Actor.removeItem(sysarg, takeid1, 10, -1,-1,-1);
    Actor.removeItem(sysarg, takeid2, 1, -1,-1,-1);
    Actor.addItem(sysarg, giveid, 0, 0, 1);

	local NpcName = Actor.getTalkNpcName(sysarg);
	local StrNpcE = string.format("<%s/M威龙城:124:140:%s><(x威龙城:124:140:%s)>",NpcName,NpcName,NpcName);
	System.broadcastTipmsg(string.format("<(n%s)>在%s使用%s加%s锻造获得%s.", Actor.getName(sysarg), StrNpcE, Item.getItemLinkMsg(takeid1), Item.getItemLinkMsg(takeid2), Item.getItemLinkMsg(giveid) ),128);
end


t.onTiShengJFWQ = function(sysarg)
    local JFZB = t.JFZB;
    local e = "\\  <(c0xFFb6946c)当前BOSS积分:><(c0xFF00FF00)"..get_d_val(sysarg,116).."><(c0xFFb6946c)点> <返回/@main>\\\\<(idecoLine#330)>\\\\";
    local itemPtr = Item.getEquipByPos(sysarg, 49);
    local ck = 0;
    if itemPtr then
        local ItemID = Item.getItemId(itemPtr);
        for i = 1,#JFZB do
            if JFZB[i][1] == ItemID then
                ck = 1;
                local xh = JFZB[i][3];
                local newid = JFZB[i][2];
                if newid == 0 then
                     e = e .. "  <当前首充成长武器已满级.>\\"; 
                else
                     e = e .. string.format([[
  <(c0xFFb6946c)当前佩戴首充成长武器:> <%s>

  <(c0xFFb6946c)升级需要消耗BOSS积分:> <(c0xFF00FF00)%s点>

  <(c0xFFb6946c)升级后获高级成长武器:> %s

  <(c0xFFc4c7ca)成长武器还可以通过击杀游戏中怪物来积累成长进度~>
<#BN升级武器/@onUPJFWQ,%s>
]], Item.getItemName(ItemID), xh, Item.getItemLinkMsg(newid), i);
                end
               
                break;
            end
        end
    end
    if ck == 0 then e = e .. "  <您还没佩戴首充成长武器,或是已经升满了?>\\\\  <(c0xFFc4c7ca)成长武器还可以通过击杀游戏中怪物来积累成长进度~>\\ "; end
    return e.."<(idecoLine#330)>\\\\  ";
end
--   <#c0xFFFFFF00#给装备注入魔核/@onAddMoHe|可增加身上装备的真实伤害属性> <(c0xFF888888)魔核在各地图小怪身上掉落>

--   <#c0xFFFF00FF#给神装注入魔核/@onAddMoHeSZ|可增加身上神装的真实伤害属性>

t.onUPJFWQ = function(sysarg,i)
    if not i then return; end
    i = tonumber(i);
    local JFZB = t.JFZB[i];
    local itemPtr = Item.getEquipByPos(sysarg, 49);
    local ck = 0;
    if itemPtr then
        local ItemID = Item.getItemId(itemPtr);
        local WeaponName = Item.getItemName(ItemID);
        if JFZB[1] == ItemID then
            ck = 1;
            local xh = JFZB[3];
            local newid = JFZB[2];

            if get_d_val(sysarg,116) < xh then
                Actor.sendTipmsg(sysarg, "BOSS积分不足"..xh.."点哟,升级失败.", 256);
                return t.onTiShengJFWQ(sysarg);
            end


            --if Item.getBagEmptyGridCount(sysarg) > 0 then
                del_d_val(sysarg, 116, xh);
                --Item.removeEquip(sysarg, itemPtr);
                local nBangd = 1;
                if newid == 87 or newid == 96 or newid == 105 then
                    nBangd = 0;
                end
                --local pNewItem = Item.createItem(newid,1,0,0,nBangd);
                local nJob = Actor.getIntProperty(sysarg,PROP_ACTOR_VOCATION);
                -- if nJob == 3 then
                --     Item.setItemProperty(sysarg,pNewItem,ipTaoStrong,6);
                -- end
                Item.setItemProperty(sysarg,itemPtr,Item.ipItemID,newid);
                -- Item.addItem(sysarg,pNewItem,"首充武器成长",2617);
                -- Actor.useItem(sysarg,pNewItem);
                Actor.collectOperate(sysarg,0); -- 重新计算角色属性
                Actor.sendTipmsg(sysarg, string.format("恭喜您的首充成长武器[%s]成功升级为[%s]", WeaponName, Item.getItemName(newid)), 256);
                System.broadcastTipmsg(string.format("恭喜<(n%s)>使用<BOSS积分>将首充成长武器升级为[%s].", Actor.getName(sysarg), Item.getItemLinkMsg(newid)), 128);
            -- else
            --     Actor.sendTipmsg(sysarg, "先把包裹清一清再来哟.", 4);
            -- end
            return t.onTiShengJFWQ(sysarg);
            
        end

        if ck == 0 then
            Actor.sendTipmsg(sysarg, "你这把武器可升级不了哟,你是不是偷偷换了把武器?", 4);
        end
    else
        Actor.sendTipmsg(sysarg, "你武器都不拿,还想来骗我?", 4);
    end

end

-- t.onTiShengJFWQ = function(sysarg)
--     local job = Actor.getIntProperty(sysarg,PROP_ACTOR_VOCATION);
--     local jfitem = t.JFZB[job];
--     local e = "\\  <(c0xFFb6946c)当前BOSS积分:><(c0xFF00FF00)"..get_d_val(sysarg,116).."><(c0xFFb6946c)点> <返回/@main>\\  <(c0xFFb6946c)点击以下黄色下划线字即可进行升级.>\\\\<(idecoLine#330)>\\\\";
--     for i = 1,#jfitem do
--         local _,b = math.modf(i/2);
--         local hhf = "";
--         if b == 0 then hhf = "\\\\"; end
--         e = e .. string.format("  <#c0xFFFFFF00#升级为/@onUPJFWQ,%s|升级需要包裹内有 %s 1把#还需要消耗 %s 点BOSS积分>"..Item.getItemLinkMsg(jfitem[i][2]).." %s",  i, Item.getItemName(jfitem[i][1]), jfitem[i][3], hhf);
--     end

--      e = e .. [[


-- <(idecoLine#330)>

--   <#c0xFFFFFF00#购买积分尸王卷/@buyzm,305|杀死随机掉落80-120点BOSS积分> <#c0xFFFFFF00#购买积分白野猪卷/@buyzm,306|杀死随机掉落450-550点BOSS积分> <#c0xFFFFFF00#购买积分祖玛教主卷/@buyzm,307|杀死随机掉落900-1100点BOSS积分>

-- <(idecoLine#330)>

-- ]];
--     return e;
-- end
-- --   <#c0xFFFFFF00#给装备注入魔核/@onAddMoHe|可增加身上装备的真实伤害属性> <(c0xFF888888)魔核在各地图小怪身上掉落>

-- --   <#c0xFFFF00FF#给神装注入魔核/@onAddMoHeSZ|可增加身上神装的真实伤害属性>

-- t.onUPJFWQ = function(sysarg,i)
--     if not i then return; end
--     i = tonumber(i);
--     local job = Actor.getIntProperty(sysarg,PROP_ACTOR_VOCATION);
--     local JFZB = t.JFZB[job][i];
--     if not JFZB then return; end
--     local xh = JFZB[3];
--     local newid = JFZB[2];
--     local takeid = JFZB[1];
--     if Actor.getItemCount(sysarg,  takeid) == 0 then
--         Actor.sendTipmsg(sysarg, string.format("您的包裹内没有<%s>,升级失败..", Item.getItemName(takeid), 1), 256);
--         return;
--     end
--     if get_d_val(sysarg,116) < xh then
--         Actor.sendTipmsg(sysarg, string.format("BOSS积分不足<%s>点,升级失败.", xh), 256);
--         return;
--     end

--     if Actor.removeItem(sysarg, takeid, 1, -1,-1,-1) then
--         del_d_val(sysarg, 116, xh);
--         Actor.addItem(sysarg, newid, 0, 0, 1, 1, 0, "首充武器成长", 2617);
--         Actor.sendTipmsg(sysarg, string.format("恭喜您的首充成长武器[%s]成功升级为[%s]", Item.getItemName(takeid), Item.getItemName(newid)), 256);
--         System.broadcastTipmsg(string.format("恭喜<(n%s)>使用<BOSS积分>将首充成长武器升级为[%s].", Actor.getName(sysarg), Item.getItemLinkMsg(newid)), 128);
--     end
--     return t.onTiShengJFWQ(sysarg);
-- end

t.onAddMoHeSZ = function(sysarg)
    local d = t.SZmhdata;
    local e = "\\  <(c0xFFb6946c)请选择您要注入的神装魔核:>\\  <(c0xFFb6946c)选择神装魔核之后选择身上神装即可注入成功.>\\\\<(idecoLine#330)>\\\\";

    for i = 660,669 do
        local numformh = Actor.getItemCount(sysarg,  i);
        e = e .. string.format("  <#c0xFFFF00FF#注入%s(%s)/@onAddMoHeSZEx,%s> <(c0xFF888888)给神装增加><(c0xFF0099FF)%s><(c0xFF888888)到><(c0xFF0099FF)%s><(c0xFF888888)点真实伤害.>\\", Item.getItemName(i), numformh, i, d[i][1], d[i][5]);
    end

    return e .. "\\<(idecoLine#330)>\\\\  <返回/@main>";
end

t.onAddMoHeSZEx = function(sysarg,idx)
    if not idx then return; end
    local i = tonumber(idx);
    local d = t.SZmhdata;
    if not d[i] then return; end
    local numformh = Actor.getItemCount(sysarg,  i);
    local e = "\\  <(c0xFFb6946c)请选择您要注入><"..Item.getItemName(i).."("..numformh..")><(c0xFFb6946c)的神装:>\\  <(c0xFFb6946c)随机增加><(c0xFF0099FF)"..d[i][1].."><(c0xFFb6946c)到><(c0xFF0099FF)"..d[i][5].."><(c0xFFb6946c)点真实伤害.>\\\\<(idecoLine#330)>\\\\";
    local ItemPos = {15,13,40,41,42,43,44,45,46,47};
    for k = 1,#ItemPos do
        local itemPtr = Item.getEquipByPos(sysarg, ItemPos[k]);
        if itemPtr then
            local ItemID = Item.getItemId(itemPtr);
            local rDamage = Item.getItemProperty(sysarg, itemPtr, Item.ipRealInjury);
            e = e .. string.format("  <#c0xFFFF00FF#给%s注入魔核/@onAddMoHeSZExFor,%s,%s> <(c0xFFb6946c)当前:><(c0xFF0099FF)%s点真实伤害>\\", Item.getItemName(ItemID), i, ItemPos[k], rDamage );
        end
    end
    return e .. "\\<(idecoLine#330)>\\\\  <*友情提示: 点慢一点,别着急..>\\  <返回/@onAddMoHeSZ>";
end

t.onAddMoHeSZExFor = function(sysarg,idx,ItemPos)
    if not idx then return; end
    if not ItemPos then return; end
    local i = tonumber(idx);
    ItemPos = tonumber(ItemPos);
    local d = t.SZmhdata;
    if not d[i] then return; end
    local itemPtr = Item.getEquipByPos(sysarg, ItemPos);
    if not itemPtr then return; end
    local ItemID = Item.getItemId(itemPtr);
    local rDamage = Item.getItemProperty(sysarg, itemPtr, Item.ipRealInjury);
    if rDamage >= d[i][5] then
		Actor.sendTipmsg(sysarg, string.format("您佩戴的<%s>的<真实伤害>属性已经达到<%s>的最高值了.", Item.getItemName(ItemID), Item.getItemName(i)), 4);
		return ;
    end
    if Actor.getItemCount(sysarg,  i) == 0 then
        Actor.sendTipmsg(sysarg, string.format("您的 <%s> 不足 <%s> ,注入失败..", Item.getItemName(i), 1), 256);
        return ;
    end
    Actor.removeItem(sysarg, i, 1, -1,-1,-1);

    local addrDamage = 0;
    local probability = {100,50,20,5,1};
    local u = 0;
    for k = 1,5 do
        local py = math.random(1, probability[k]);
        if py == probability[k] then
            local n = (6 - k);
            addrDamage = d[i][n];
            u = n;
            break;
        end
    end
    Item.setItemProperty(sysarg, itemPtr, Item.ipRealInjury, addrDamage);
    Actor.collectOperate(sysarg,0); --刷新汇总属性
    if u >= 4 then
        local sss = "恭喜您注入成功,<%s>的真实伤害为<(c0xFF0099FF)%s>点.";
        Actor.sendTipmsg(sysarg, string.format(sss, Item.getItemName(ItemID), addrDamage), 4);
        Actor.sendTipmsg(sysarg, string.format(sss, Item.getItemName(ItemID), addrDamage), 256);
    else
        Actor.sendTipmsg(sysarg, string.format("恭喜您注入成功,<%s>的真实伤害为<%s>点.", Item.getItemName(ItemID), addrDamage), 256);
    end
    return t.onAddMoHeSZEx(sysarg,i);
end

t.onHCMoHeSZ = function(sysarg)
    local e = "\\  <(c0xFFb6946c)请选择需要合成的神装魔核:>\\  <(c0xFFb6946c)每次合成需要手续费:><10000绑金或金币>\\\\<(idecoLine#330)>\\\\";

    for i = 660,669 do
        local delItemId = i - 10;
        local addItemId = i;
        local str = "";
        if i ~= 660 then
            str = string.format("<(c0xFF888888)到><(c0xFF0099FF)%s><(c0xFF888888)各>", Item.getItemName(delItemId));
        end
        local numformh = 0;
        for k = 660,i do
            k = k - 10;
            if Actor.getItemCount(sysarg, k) < 10 then
                numformh = 1;
            end
        end
        local xstr = "<#c0xFF888888#合成%s";
        if numformh == 0 then
            xstr = "<#c0xFFFF00FF#合成%s";
        end
        e = e .. string.format("  "..xstr.."/@onHCMoHeSZEx,%s> <(c0xFF888888)需要><(c0xFF0099FF)%s>%s<(c0xFF888888)1颗>\\", Item.getItemName(addItemId), i, Item.getItemName(650), str);
    end

    return e .. "\\<(idecoLine#330)>\\\\  <返回/@main>";
end

t.onHCMoHeSZEx = function(sysarg,i)
    if not i then return; end
    i = tonumber(i);
    local del_ngold = 10000;
    MC = 2;
    if Actor.getMoneyCount(sysarg,1) >= del_ngold then MC = 1; end
    if Actor.getMoneyCount(sysarg,0) >= del_ngold then MC = 0; end
    if MC == 2 then
        Actor.sendTipmsg(sysarg, string.format("您的绑金或金币不足 <%s> ,合成失败..",del_ngold), 256);
        return ;
    end
    for k = 660,i do
        local k = k - 10;
        if Actor.getItemCount(sysarg,  k) < 1 then
            Actor.sendTipmsg(sysarg, string.format("您的 <%s> 不足 <%s> ,合成失败..", Item.getItemName(k), 1), 256);
            return ;
        end
    end
    Actor.changeMoney(sysarg, MC, -del_ngold, 127, "合成神装魔核消耗");
    for k = 660,i do
        local k = k - 10;
        Actor.removeItem(sysarg, k, 1, -1,-1,-1);
    end
    Actor.addItem(sysarg, i, 0, 0, 1);
    return t.onHCMoHeSZ(sysarg);
end

t.onAddMoHe = function(sysarg)
    local d = t.mhdata;
    local e = "\\  <(c0xFFb6946c)请选择您要注入的魔核:>\\  <(c0xFFb6946c)选择魔核之后选择身上装备即可注入成功.>\\\\<(idecoLine#330)>\\\\";

    for i = 650,659 do
        local numformh = Actor.getItemCount(sysarg,  i);
        e = e .. string.format("  <#c0xFFFFFF00#注入%s(%s)/@onAddMoHeEx,%s> <(c0xFF888888)给装备增加><(c0xFF0099FF)%s><(c0xFF888888)到><(c0xFF0099FF)%s><(c0xFF888888)点真实伤害.>\\", Item.getItemName(i), numformh, i, d[i][1], d[i][5]);
    end

    return e .. "\\<(idecoLine#330)>\\\\  <返回/@main>";
end

t.onAddMoHeEx = function(sysarg,idx,itemName)
    if not idx then return; end
    local i = tonumber(idx);
    local d = t.mhdata;
    if not d[i] then return; end
    local numformh = Actor.getItemCount(sysarg,  i);
    local e = "";
    if itemName then e = e .. "<title/"..itemName..">"; end
    e = e .. "\\  <(c0xFFb6946c)请选择您要注入><"..Item.getItemName(i).."("..numformh..")><(c0xFFb6946c)的装备:>\\  <(c0xFFb6946c)随机增加><(c0xFF0099FF)"..d[i][1].."><(c0xFFb6946c)到><(c0xFF0099FF)"..d[i][5].."><(c0xFFb6946c)点真实伤害.>\\\\<(idecoLine#330)>\\\\";
    local ItemPos = {
        {"武器", 0},
        {"衣服", 1},
        {"头盔", 2},
        {"项链", 3},
        {"左手镯", 5},
        {"右手镯", 6},
        {"左戒指", 7},
        {"右戒指", 8},
        {"腰带", 9},
        {"靴子", 10},
    };
    for k = 1,#ItemPos do
        local itemPtr = Item.getEquipByPos(sysarg, ItemPos[k][2]);
        if itemPtr then
            local ItemID = Item.getItemId(itemPtr);
            local rDamage = Item.getItemProperty(sysarg, itemPtr, Item.ipRealInjury);
            e = e .. string.format("  <#c0xFFFFFF00#给%s注入魔核/@onAddMoHeExFor,%s,%s> <(c0xFFb6946c)当前:><(c0xFF0099FF)%s点真实伤害>\\", Item.getItemName(ItemID), i, ItemPos[k][2], rDamage );
        end
    end
    return e .. "\\<(idecoLine#330)>\\\\  <*友情提示: 点慢一点,别着急..>\\  <返回/@onAddMoHe>";
end

function onAddMoHeExFor(sysarg,idx,ItemPos)
    t.onAddMoHeExFor(sysarg,idx,ItemPos);
end

t.onAddMoHeExFor = function(sysarg,idx,ItemPos)
    if not idx then return; end
    if not ItemPos then return; end
    local i = tonumber(idx);
    ItemPos = tonumber(ItemPos);
    local d = t.mhdata;
    if not d[i] then return; end
    local itemPtr = Item.getEquipByPos(sysarg, ItemPos);
    if not itemPtr then return; end
    local ItemID = Item.getItemId(itemPtr);
    local rDamage = Item.getItemProperty(sysarg, itemPtr, Item.ipRealInjury);
    if rDamage >= d[i][5] then
		Actor.sendTipmsg(sysarg, string.format("您佩戴的<%s>的<真实伤害>属性已经达到<%s>的最高值了.", Item.getItemName(ItemID), Item.getItemName(i)), 4);
		return ;
    end
    if Actor.getItemCount(sysarg,  i) == 0 then
        Actor.sendTipmsg(sysarg, string.format("您的 <%s> 不足 <%s> ,注入失败..", Item.getItemName(i), 1), 256);
        return ;
    end
    Actor.removeItem(sysarg, i, 1, -1,-1,-1);

    local addrDamage = 0;
    local probability = {100,50,20,5,1};
    local u = 0;
    for k = 1,5 do
        local py = math.random(1, probability[k]);
        if py == 1 then
            local n = (6 - k);
            addrDamage = d[i][n];
            u = n;
            break;
        end
    end
    Item.setItemProperty(sysarg, itemPtr, Item.ipRealInjury, addrDamage);
    Actor.collectOperate(sysarg,0); --刷新汇总属性
    if u >= 4 then
        local sss = "恭喜您注入成功,<%s>的真实伤害为<(c0xFF0099FF)%s>点.";
        Actor.sendTipmsg(sysarg, string.format(sss, Item.getItemName(ItemID), addrDamage), 4);
        Actor.sendTipmsg(sysarg, string.format(sss, Item.getItemName(ItemID), addrDamage), 256);
    else
        Actor.sendTipmsg(sysarg, string.format("恭喜您注入成功,<%s>的真实伤害为<%s>点.", Item.getItemName(ItemID), addrDamage), 256);
    end
    return t.onAddMoHeEx(sysarg,i);
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
	Actor.changeMoney(sysarg,1,-gold,101,"万事通");
	Actor.addItem(sysarg,itemid,0,0,1,0,"strongduihuan",1);
	Actor.sendTipmsg(sysarg, "兑换成功.", 256);
end

-- t.main = function(sysarg)
--     local data = t.data;
--     local iSJS = Item.getItemName(t.need_itemid);
--     local e = [[

--   <(c0xFFb6946c)请选择您要锻造的装备:>

-- <(idecoLine#330)>

--   <进行霸主合成/@hecheng,91,99>  <(c0xFF705e45)需求:> <(c0xFFeabc78)十方装备> <(c0xFF705e45)＋> <(c0xFFeabc78)]]..iSJS..[[>\
--   <进行通天合成/@hecheng,100,108>  <(c0xFF705e45)需求:> <(c0xFFeabc78)霸主装备> <(c0xFF705e45)＋> <(c0xFFeabc78)]]..iSJS..[[>\
--   <进行毁灭合成/@hecheng,109,117>  <(c0xFF705e45)需求:> <(c0xFFeabc78)通天装备> <(c0xFF705e45)＋> <(c0xFFeabc78)]]..iSJS..[[>\
--   <进行奔雷合成/@hecheng,118,126>  <(c0xFF705e45)需求:> <(c0xFFeabc78)毁灭装备> <(c0xFF705e45)＋> <(c0xFFeabc78)]]..iSJS..[[>\
--   <进行雷神合成/@hecheng,127,135>  <(c0xFF705e45)需求:> <(c0xFFeabc78)奔雷装备> <(c0xFF705e45)＋> <(c0xFFeabc78)]]..iSJS..[[>\
--   <进行至尊合成/@hecheng,136,144>  <(c0xFF705e45)需求:> <(c0xFFeabc78)雷神装备> <(c0xFF705e45)＋> <(c0xFFeabc78)]]..iSJS..[[> 

-- <(idecoLine#330)>

--   <锻造高级羽毛/@cailiaohc>  <装备升阶石兑换羽毛/@aaa|1颗装备升阶石兑换20根1级羽毛>
--   <(c0xFFb6946c)10阶BOSS以上均可掉落 装备升阶石.>

 
--     ]];
--     return e;
-- end

-- <购买1颗]]..iSJS..[[/@onBuySJS|十阶BOSS死亡5分之1几率掉落此材料>  <(c0xFF705e45)需求:> <(c0xFFeabc78)200元宝>
t.aaa = function(sysarg)

	if Actor.getItemCount(sysarg, 318) <1 then 
		Actor.sendTipmsg(sysarg, "装备升阶石不足,兑换失败.", 256);
		return t.main(sysarg)
	end

	local emptyCount = Item.getBagEmptyGridCount(sysarg)
	if Item.getAddItemNeedGridCount(sysarg, 464, 20)>emptyCount then 
		Actor.sendTipmsg(sysarg, "背包所需空间不足,兑换失败.", 256);
		return t.main(sysarg)
	end

	Actor.removeItem(sysarg, 318, 1, -1,-1,-1,"升阶石兑换羽毛");
	Actor.addItem(sysarg,464,0,0,20,0,0,"升阶石兑换羽毛",1)
	Actor.sendTipmsg(sysarg, "兑换成功!", 256);
	return t.main(sysarg)
end

-- t.onBuySJS = function(sysarg)
--     if Actor.getMoneyCount(sysarg,3) < 200 then
--         Actor.sendTipmsg(sysarg, string.format("您的元宝不足 <%s> ,购买失败..",200), 256);
--     else
--         Actor.changeMoney(sysarg, 3, -200,2600,"购买升阶石");
--         Actor.addItem(sysarg, t.need_itemid, 0, 0, 1);
--         Actor.sendTipmsg(sysarg, "购买成功!", 256);
--     end
-- end

t.hecheng = function(sysarg,a,b)
    if not a then return; end
    if not b then return; end
    a = tonumber(a);
    b = tonumber(b);
    local d = t.data;
    local nId = t.need_itemid;
    local pLv = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL);
    local nLv = d[a][5];
    if pLv < nLv then
        Actor.sendTipmsg(sysarg,string.format("您的等级不足 <(c0xFFfff000)%s> 级,还无法查看此类装备合成.",nLv),4);
        return t.main(sysarg);
    end
    local echo = "\\  <(c0xFFb6946c)选择你想合成的装备吧.> <返  回/@main>\\\\";
    for i = a,b do
        echo = echo .. string.format("  %s  <点击合成/@onhconly,%s|需要材料:#%s x2#%s x%s#金币 x2000>\\\\", Item.getItemLinkMsg(d[i][1]), i, Item.getItemName(d[i][2]), Item.getItemName(nId), d[a][4]);
    end
    return echo;
end

t.onhconly = function(sysarg,a)
    if not a then return; end
    local i = tonumber(a);
    local d = t.data;
    local add_nitem = d[i][1];
    local remove_nitem = d[i][2];
    local item_count = 1;
    local del_ngold = item_count * 2000;
    local u = 0;
    local nId = t.need_itemid;

    local pLv = Actor.getIntProperty(sysarg,PROP_CREATURE_LEVEL);
    local nLv = d[i][5];

    if pLv < nLv then
        Actor.sendTipmsg(sysarg,string.format("您的等级不足 <%s> 级,还无法使用此类装备合成.",nLv),4);
        return;
    end

    if Actor.getItemCount(sysarg, remove_nitem) < 2 then
        Actor.sendTipmsg(sysarg, string.format("您的 <%s> 不足 <%s> ,合成失败..", Item.getItemName(remove_nitem), 2), 256);
        return ;
    end

    local MC = 2;
    if Actor.getMoneyCount(sysarg,1) >= del_ngold then MC = 1; end
    if Actor.getMoneyCount(sysarg,0) >= del_ngold then MC = 0; end
    if MC == 2 then
        Actor.sendTipmsg(sysarg, string.format("您的绑金或金币不足 <%s> ,合成失败..",del_ngold), 256);
        return ;
    end

    local sjd_count = d[i][4] * item_count;
    if Actor.getItemCount(sysarg, nId) < sjd_count then
        Actor.sendTipmsg(sysarg, string.format("您的 <%s> 不足 <%s> ,合成失败..", Item.getItemName(nId), sjd_count), 256);
        return ;
    end

    Actor.changeMoney(sysarg, MC, -del_ngold,127,"装备合成消耗金钱");
    Actor.removeItem(sysarg, nId, sjd_count, -1,-1,-1);
    Actor.removeItem(sysarg, remove_nitem, (item_count*2), -1,-1,-1);
    Actor.addItem(sysarg, add_nitem, 0, 0, item_count);

    return;
end

t.cailiaohc = function(sysarg)
    local echo = "\\  <(c0xFF705e45)我可是万能锻造师哟.> <返回/@main>\\  <(c0xFF705e45)请选择您要锻造的物品:> \\\\<(idecoLine#330)>\\\\";
    local d = t.clhcdata;
    for i = 1,#d do
        if i == 5 then
            echo = echo .. "<(idecoLine#330)>\\\\";
        end
        echo = echo .. string.format("  <锻造1个%s/@clhc,%s|需求: %s x%s ＋ 金币 x%s>   <一次锻造20个%s/@clhc,%s,20|需求: %s x%s ＋ 金币 x%s> \\\\", Item.getItemName(d[i][1]), i, Item.getItemName(d[i][2]), d[i][3], d[i][4], Item.getItemName(d[i][1]), i, Item.getItemName(d[i][2]), d[i][3]*20, d[i][4]*20);
    end

    
    return echo;
end

t.clhc = function(sysarg,a,j)
    if not a then return; end
    local i = tonumber(a);
    --print(j)
    if j then j = tonumber(j); else j = 1; end
    --print(j)
    if j < 1 then return; end
    local d = t.clhcdata;
    local add_nitem = d[i][1];
    local remove_nitem = d[i][2];
    local item_count = 1 * j;
    local del_count = d[i][3] * j;
    local del_ngold = item_count * d[i][4];

    if Actor.getItemCount(sysarg, remove_nitem) < del_count then
        Actor.sendTipmsg(sysarg, string.format("您的 <%s> 不足 <%s> ,锻造失败.", Item.getItemName(remove_nitem), del_count), 256);
        return ;
    end

    local MC = 2;
    if Actor.getMoneyCount(sysarg,1) >= del_ngold then MC = 1; end
    if Actor.getMoneyCount(sysarg,0) >= del_ngold then MC = 0; end
    if MC == 2 then
        Actor.sendTipmsg(sysarg, string.format("您的绑金或金币不足 <%s> ,锻造失败.",del_ngold), 256);
        return ;
    end

    Actor.changeMoney(sysarg, MC, -del_ngold,127,"装备合成消耗金钱");
    Actor.removeItem(sysarg, remove_nitem, del_count, -1,-1,-1);
    Actor.addItem(sysarg, add_nitem, 0, 0, item_count, 1);
    if j > 1 then
		local NpcName = Actor.getTalkNpcName(sysarg);
		local StrNpcE = string.format("<%s/M威龙城:124:140:%s><(x威龙城:124:140:%s)>",NpcName,NpcName,NpcName);
		System.broadcastTipmsg(string.format("<(n%s)>在%s获得%sx%s.", Actor.getName(sysarg), StrNpcE, Item.getItemLinkMsg(add_nitem), item_count ),128);
    end

end

-- t.VipRecoveryInit = function(sysarg)

--     local echo = ""
--     echo = echo ..[[
 
--   <(c0xFFff9000)第一步: 特色存放> <(c0xFFb6946c)霸主,通天,毁灭,奔雷,雷神,至尊套>
--   <快速存放包裹内以上所有装备/@VipRecoveryInit_chucun|点击后自动储存在专属纯装备仓库内#vip2玩家可享受随身回收以及锻造#vip5玩家每天0点-7点挂机时自动存储热血类装备>

-- <(idecoLine#330)>
--   <(c0xFFff9000)特殊步: VIP特权> <(c0xFFb6946c)赞助游戏研发的回报>

--   <(c0xFFc1bdb7)vip2玩家可享受包裹内随身回收以及锻造>
--   <(c0xFFc1bdb7)vip5玩家每天0点-7点挂机会自动存储以上高级装备>

-- <(idecoLine#330)>
--   <(c0xFFff9000)第二步: 一键锻造> <(c0xFFb6946c)高级套装采用2合1加升阶石规则>
--   <点击锻造以上高级类套装/@Page3|用多余装备来锻造高级装备>

-- <(idecoLine#330)>
--   <(c0xFFff9000)第三步: 随意换取> <(c0xFFb6946c)存个戒指进去,取件衣服出来~>

-- ]]

-- 	for i = 16,22 do
-- 		k = i - 6;
--         if i==18 or i == 21 then 
-- 			--if get_d_val(sysarg,99 + k)~=0 then 
-- 				echo = echo .. string.format("  <%s(%s)件/@VipRecoveryInit_tiqu,%s|可以任意取出此类套装内任何一个部件>", HuiShouData[i][5], get_d_val(sysarg,99 + k), i).."\\\\"
-- 			--else 
-- 				--echo = echo .. string.format("    <(c0xFF888888)%s(%s)件>", HuiShouData[i][5], get_d_val(sysarg,99 + k)).."\\\\"
-- 			--end
-- 		else 
-- 			--if get_d_val(sysarg,99 + k)~=0 then 
-- 				echo = echo .. string.format("  <%s(%s)件/@VipRecoveryInit_tiqu,%s|可以任意取出此类套装内任何一个部件>", HuiShouData[i][5], get_d_val(sysarg,99 + k), i)
-- 			--else 
-- 				--echo = echo .. string.format("    <(c0xFF888888)%s(%s)件>", HuiShouData[i][5], get_d_val(sysarg,99 + k))
-- 			--end
-- 		end
-- 	end
-- 	return echo;
   
-- end
-- t.VipRecoveryInit_chucun = function(sysarg,i)
--    return VipRecoveryInit_chucun(sysarg,i)
-- end

-- t.Page3 =function(sysarg)

--     local echo = "";
--     echo = echo ..[[

--   <(c0xFFff9000)一键锻造:>

--   <(c0xFFb6946c)1.><(c0xFFb6946c)只要库存装备数量大于2时,便可锻造更高级的装备>
--   <(c0xFFb6946c)2.><(c0xFFb6946c)拥有了高级装备数时,在提取服务中兑换你满意的部件>
--   <(c0xFFb6946c)3.><(c0xFFb6946c)每次锻造所需2000绑金/金币,以及若干><(c0xFFFF0000)装备升阶石><(c0xFFb6946c)>

-- <(idecoLine#330)>

-- ]]
--     local sGoldstr = {};
--     local sNeedGold = {};
--     for i = 16,21 do
--         k = i - 6;
--         -- sGoldstr[i] = string.format("&ff0000&%s&ffffff& 每件可回收获得 &ff0000&%s&ffffff& 绑定金币", HuiShouData[i][5], HuiShouData[i][3]);
--         sGoldstr[i] = string.format("&ff0000&%s&ffffff& 每件可回收获得 &ff0000&%s&ffffff& 绑定金币 ＋ &ff0000&%s&ffffff& 金币#", HuiShouData[i][5], HuiShouData[i][3], HuiShouData[i][4]);
--         sNeedGold[i] = string.format("&ffffff&所需&ff0000&%s&ffffff&2件,当前库存&ff0000&%s&ffffff&件,每次锻造消耗 &ff0000&%s&ffffff& 金币#(优先扣除绑定金币,绑定金币不足则扣金币)#高级装备锻造每次额外消耗 &ff0000&装备升阶石 %s 颗", HuiShouData[i][5],get_d_val(sysarg,99 + k), 2000, 2 ^ (i-16) / 2 * 2);
--         if i==18 or i==21 then 
-- 			echo = echo .. string.format("  <锻造[%s]/@VipRecoveryInit_hc2,%s|%s>\\\\",  t.hsdata[i+1][5], k+1, sNeedGold[i])
-- 		else 
-- 			echo = echo .. string.format("  <锻造[%s]/@VipRecoveryInit_hc2,%s|%s>",   t.hsdata[i+1][5], k+1, sNeedGold[i])
-- 		end
--     end
-- 	echo = echo .. "  <(c0xFFff9000)至尊装备已经是顶级套装了>\\  <(c0xFFff9000)如果还想要提升先转生之后去土城看看吧> \\\\";
--     echo = echo .."<(idecoLine#315)>\\\\                                          <返回上层/@VipRecoveryInit>"
--     return echo

-- end

-- --t.checkIsCan_HC=function(sysarg,i)
-- --	i = tonumber(i);
-- --    local val = 99 + i;
-- --    if get_d_val(sysarg, val-1) >= 2 then
-- --        local a,b = math.modf(get_d_val(sysarg, val-1) / 2);
-- --        local del_ngold = a * 2000;
-- --        local MC = 2;
-- --        if Actor.getMoneyCount(sysarg,1) >= del_ngold then MC = 1; end
-- --        if Actor.getMoneyCount(sysarg,0) >= del_ngold then MC = 0; end
-- --        if MC == 2 then
-- --            return 0
-- --        end
-- --        local needi = 2 ^ (i-10) / 2 * a;
-- --        if Actor.getItemCount(sysarg, 318) < needi then
-- --            return 0
-- --        end
-- --	else 
-- --		return 0
-- --	end
-- --	return 1
-- --end


-- t.VipRecoveryInit_tiqu_on = function(sysarg,i,k)
--     if not i then return; end
--     if not k then return; end
--     i = tonumber(i);
--     k = tonumber(k);
--     local val = i - 6 + 99;
--     if Item.getBagEmptyGridCount(sysarg)>0 then 
--         if get_d_val(sysarg, val) >= 1 then
--             del_d_val(sysarg, val, 1);
--             Actor.addItem(sysarg, k, 0, 0, 1);
--         else
--             Actor.sendTipmsg(sysarg,"您没有可提取的此类装备.",256);
--         end
--         return t.VipRecoveryInit_tiqu(sysarg,i);
--     else 
--         Actor.sendTipmsg(sysarg,"您的背包空间不足.",256);
--     end
-- end
-- t.VipRecoveryInit_tiqu = function(sysarg,i)
--     if not i then return; end
--     i = tonumber(i);

--     local e = string.format("\\  <(c0xFFff9000)随意换取> <(c0xFFb6946c)此类装备库存:> <(c0xFF06ff00)".. get_d_val(sysarg, i-6+99) .."><(c0xFFb6946c)件>\\\\")
--     for k = HuiShouData[i][1],HuiShouData[i][2] do
--         e = e .. string.format("  <点击取出1件/@VipRecoveryInit_tiqu_on,%s,%s> %s \\\\",  i, k , Item.getItemLinkMsg(k));
--     end
--     e = e .. "                                          <返回上页/@VipRecoveryInit>";
--     return e;
-- end

-- t.VipRecoveryInit_huishou = function(sysarg,k,u)
--     VipRecoveryInit_huishou(sysarg,k,u)
--     return t.VipRecoveryInit(sysarg)
-- end

-- t.VipRecoveryInit_hc = function(sysarg,i)
-- if not i then return; end
--     i = tonumber(i);
--     local val = 99 + i;
--     if get_d_val(sysarg, val-1) >= 2 then
--         local a,b = math.modf(get_d_val(sysarg, val-1) / 2);
--         local del_ngold = a * 200;
--         local MC = 2;
--         if Actor.getMoneyCount(sysarg,1) >= del_ngold then MC = 1; end
--         if Actor.getMoneyCount(sysarg,0) >= del_ngold then MC = 0; end
--         if MC == 2 then
--             Actor.sendTipmsg(sysarg, string.format("您的绑金或金币不足 <%s> ,锻造失败..",del_ngold), 256);
--             return ;
--         end
--         Actor.changeMoney(sysarg, MC, -del_ngold);
--         del_d_val(sysarg, val-1, a*2);
--         add_d_val(sysarg, val, a);
--         Actor.sendTipmsg(sysarg,"恭喜您锻造了"..a.."件装备.",256);
--     else
--         Actor.sendTipmsg(sysarg,"没有可锻造的装备.(锻造所需要的装备数量大于2)",256);
--     end
--     return t.Page2(sysarg);
-- end


-- t.VipRecoveryInit_hc2 =function(sysarg,i)
-- if not i then return; end
--     i = tonumber(i);
--     local val = 99 + i;
--     if get_d_val(sysarg, val-1) >= 2 then
--         --local a,b = math.modf(get_d_val(sysarg, val-1) / 2);
-- 		local a=1  --改成单件锻造
--         local del_ngold = a * 2000;
--         local MC = 2;
--         if Actor.getMoneyCount(sysarg,1) >= del_ngold then MC = 1; end
--         if Actor.getMoneyCount(sysarg,0) >= del_ngold then MC = 0; end
--         if MC == 2 then
--             Actor.sendTipmsg(sysarg, string.format("可锻造 <%s> 件此类装备 , 您的绑金或金币不足 <%s> ,锻造失败..",a,del_ngold), 256);
--             return ;
--         end
--         local needi = 2 ^ (i-10) / 2 * a;
--         if Actor.getItemCount(sysarg, 318) < needi then
--             Actor.sendTipmsg(sysarg, string.format("可锻造 <%s> 件此类装备 , 您的 <%s> 不足 <%s> , 锻造失败..",a,Item.getItemName(318), needi), 256);
--             return;
--         end
--         Actor.removeItem(sysarg, 318, needi, -1,-1,-1);
--         Actor.changeMoney(sysarg, MC, -del_ngold);
--         del_d_val(sysarg, val-1, a*2);
--         add_d_val(sysarg, val, a);
--         Actor.sendTipmsg(sysarg,"恭喜您锻造了 <"..a.."> 件装备.",256+1);
-- 		OnFinish_Liveness(sysarg,20)
--     else
--         Actor.sendTipmsg(sysarg,"没有可锻造的装备.(锻造所需要的装备数量大于2)",256);
--     end
--     return t.Page3(sysarg);
-- end

-- -- t.VipRecoveryInit_Auto = function(sysarg,itemId)
-- --     return VipRecoveryInit_Auto(sysarg,itemId)
-- -- end

-- -- t.VipRecoveryInit_Equip = function(sysarg,isNpc)
-- --     return VipRecoveryInit_Equip(sysarg,isNpc)
-- -- end

-- t.VipRecoveryInit_chucun = function(sysarg,i)
--    --return VipRecoveryInit_chucun(sysarg,i)
--    for i = 17,22 do
--         k = i - 6;
--         local a,b = HuiShouData[i][1],HuiShouData[i][2];
      
--         for i = a,b do
--             local n = Actor.getItemCount(sysarg,i);
--             if n > 0 then
--                 Actor.removeItem(sysarg,i,n,-1,-1,-1);
--                 add_d_val(sysarg, 99 + k, n);
--             end
            
--         end
--     end
    
-- end

-- t.VipRecoveryInit_chucun = function (sysarg)
--      VipRecoveryInit_chucun(sysarg)
--     return t.VipRecoveryInit(sysarg)
-- end


-- t.VipRecoveryInit1 = function(sysarg)
--     return VipRecoveryInit1(sysarg)
-- end
---------------------------------------------------------------------------------------------------------------------------------------------
--双击魔核调用:
function onAllAddMoHeEx(sysarg,idx,itemName,max)
    if not max then return; end
    max = tonumber(max);
    if not idx then return; end
    --print(idx)
    local i = tonumber(idx);
    local d = t.mhdata;
    if not d[i] then return; end
    local numformh = Actor.getItemCount(sysarg,  i);
    local e = "";
    if itemName then e = e .. "<title/"..itemName..">"; end
    --\\  <(c0xFFb6946c)随机增加><(c0xFF0099FF)"..d[i][1].."><(c0xFFb6946c)到><(c0xFF0099FF)"..d[i][5].."><(c0xFFb6946c)点真实伤害.>
    e = e .. "\\  <(c0xFFb6946c)请选择您要注入><"..Item.getItemName(i).."><(c0xFFb6946c)(剩余"..numformh..")的装备:>\\\\";
    local ItemPos = {
        {"武器", 0},
        {"衣服", 1},
        {"头盔", 2},
        {"项链", 3},
        {"左手镯", 5},
        {"右手镯", 6},
        {"左戒指", 7},
        {"右戒指", 8},
        {"腰带", 9},
        {"靴子", 10},
    };
    for k = 1,#ItemPos do
        local itemPtr = Item.getEquipByPos(sysarg, ItemPos[k][2]);
        if itemPtr then
            local ItemID = Item.getItemId(itemPtr);
            local rDamage = Item.getItemProperty(sysarg, itemPtr, Item.ipRealInjury);
            e = e .. string.format("  <#c0xFFFFFF00#给%s注入魔核/@onAddAllMoHeExFor,%s,%s,%s,%s> <(c0xFFb6946c)当前:><(c0xFFFF00FF)真实伤害  +%s>\\\\", Item.getItemName(ItemID), i, ItemPos[k][2], itemName, max, rDamage );
        end
    end
    -- .. "\\<(idecoLine#330)>\\\\  <*友情提示: 点慢一点,别着急..>\\"
    return e;
end

function onAddAllMoHeExFor(sysarg,idx,ItemPos,itemName,max)
    if not max then return; end
    max = tonumber(max);

    if not idx then return; end
    if not ItemPos then return; end
    local i = tonumber(idx);
    ItemPos = tonumber(ItemPos);
    local d = t.mhdata;
    if not d[i] then return; end
    local itemPtr = Item.getEquipByPos(sysarg, ItemPos);
    if not itemPtr then return; end
    local ItemID = Item.getItemId(itemPtr);
    local rDamage = Item.getItemProperty(sysarg, itemPtr, Item.ipRealInjury);
    if rDamage >= d[i][5] then
		Actor.sendTipmsg(sysarg, string.format("您佩戴的<%s>的<真实伤害>属性已经达到<%s>的最高值了.", Item.getItemName(ItemID), Item.getItemName(i)), 4);
		return ;
    end
    if Actor.getItemCount(sysarg,  i) == 0 then
        Actor.sendTipmsg(sysarg, string.format("您的 <%s> 不足 <%s> ,注入失败..", Item.getItemName(i), 1), 256);
        return ;
    end
    Actor.removeItem(sysarg, i, 1, -1,-1,-1);

    local addrDamage = 0;
    local probability = {100,50,20,5,1};
    local u = 0;
    for k = 1,5 do
        local py = math.random(1, probability[k]);
        if py == 1 then
            local n = (6 - k);
            addrDamage = d[i][n];
            u = n;
            break;
        end
    end
    if max == 1 then
        addrDamage = d[i][5];
    end
    Item.setItemProperty(sysarg, itemPtr, Item.ipRealInjury, addrDamage);
    Actor.collectOperate(sysarg,0); --刷新汇总属性
    if u >= 4 and max == 0 then
        local sss = "恭喜您注入成功,<%s>的真实伤害为<(c0xFF0099FF)%s>点.";
        Actor.sendTipmsg(sysarg, string.format(sss, Item.getItemName(ItemID), addrDamage), 4);
        Actor.sendTipmsg(sysarg, string.format(sss, Item.getItemName(ItemID), addrDamage), 256);
    else
        Actor.sendTipmsg(sysarg, string.format("恭喜您注入成功,<%s>的真实伤害为<%s>点.", Item.getItemName(ItemID), addrDamage), 256);
    end
    if max == 1 then
        System.broadcastTipmsg(string.format("<(n%s)>使用%s给<%s>注入了<%s>点真实伤害.", Actor.getName(sysarg), Item.getItemLinkMsg(i), Item.getItemName(ItemID), addrDamage), 128);
    end
    
    return onAllAddMoHeEx(sysarg,idx,itemName,max);
end

function onAddMoHeSZEx(sysarg,idx,itemName,max)
    if not max then return; end
    max = tonumber(max);

    if not idx then return; end
    local i = tonumber(idx);
    local d = t.SZmhdata;
    if not d[i] then return; end
    local numformh = Actor.getItemCount(sysarg,  i);
    local e = "";
    if itemName then e = e .. "<title/"..itemName..">"; end
    e = e .. "\\  <(c0xFFb6946c)请选择您要注入><"..Item.getItemName(i).."("..numformh..")><(c0xFFb6946c)的神装:>\\\\";
    local ItemPos = {15,13,40,41,42,43,44,45,46,47};
    for k = 1,#ItemPos do
        local itemPtr = Item.getEquipByPos(sysarg, ItemPos[k]);
        if itemPtr then
            local ItemID = Item.getItemId(itemPtr);
            local rDamage = Item.getItemProperty(sysarg, itemPtr, Item.ipRealInjury);
            e = e .. string.format("  <#c0xFFFFFF00#给%s注入魔核/@onAddMoHeSZExFor,%s,%s,%s,%s> <(c0xFFb6946c)当前:><(c0xFFFF00FF)真实伤害  +%s>\\\\", Item.getItemName(ItemID), i, ItemPos[k], itemName, max, rDamage );
        end
    end
    return e;
end

function onAddMoHeSZExFor(sysarg,idx,ItemPos,itemName,max)
    if not max then return; end
    max = tonumber(max);

    if not idx then return; end
    if not ItemPos then return; end
    local i = tonumber(idx);
    ItemPos = tonumber(ItemPos);
    local d = t.SZmhdata;
    if not d[i] then return; end
    local itemPtr = Item.getEquipByPos(sysarg, ItemPos);
    if not itemPtr then return; end
    local ItemID = Item.getItemId(itemPtr);
    local rDamage = Item.getItemProperty(sysarg, itemPtr, Item.ipRealInjury);
    if rDamage >= d[i][5] then
		Actor.sendTipmsg(sysarg, string.format("您佩戴的<%s>的<真实伤害>属性已经达到<%s>的最高值了.", Item.getItemName(ItemID), Item.getItemName(i)), 4);
		return ;
    end
    if Actor.getItemCount(sysarg,  i) == 0 then
        Actor.sendTipmsg(sysarg, string.format("您的 <%s> 不足 <%s> ,注入失败..", Item.getItemName(i), 1), 256);
        return ;
    end
    Actor.removeItem(sysarg, i, 1, -1,-1,-1);

    local addrDamage = 0;
    local probability = {100,50,20,5,1};
    local u = 0;
    for k = 1,5 do
        local py = math.random(1, probability[k]);
        if py == probability[k] then
            local n = (6 - k);
            addrDamage = d[i][n];
            u = n;
            break;
        end
    end
    if max == 1 then
        addrDamage = d[i][5];
    end
    Item.setItemProperty(sysarg, itemPtr, Item.ipRealInjury, addrDamage);
    Actor.collectOperate(sysarg,0); --刷新汇总属性
    if u >= 4 and max == 0 then
        local sss = "恭喜您注入成功,<%s>的真实伤害为<(c0xFF0099FF)%s>点.";
        Actor.sendTipmsg(sysarg, string.format(sss, Item.getItemName(ItemID), addrDamage), 4);
        Actor.sendTipmsg(sysarg, string.format(sss, Item.getItemName(ItemID), addrDamage), 256);
    else
        Actor.sendTipmsg(sysarg, string.format("恭喜您注入成功,<%s>的真实伤害为<%s>点.", Item.getItemName(ItemID), addrDamage), 256);
    end
    if max == 1 then
        System.broadcastTipmsg(string.format("<(n%s)>使用%s给<%s>注入了<%s>点真实伤害.", Actor.getName(sysarg), Item.getItemLinkMsg(i), Item.getItemName(ItemID), addrDamage), 128);
    end

    return onAddMoHeSZEx(sysarg,i,itemName,max);
end



---------------------------------------------------------------------------
function GetNpcWanShiTong() return t end