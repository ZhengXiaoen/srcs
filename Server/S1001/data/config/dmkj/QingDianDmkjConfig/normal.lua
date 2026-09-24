--第二层表,为合服控制的表,第一个表是未合服的
--notice = 0不提示,1为寻宝传说,2为全服提示
--庆典寻宝
{
	--非合区表
	{
		openday = 9999,		--开服天数, X天之内存在,进入这个表后就不再进入下一个表
		items = 
		{
			--战士
			{

				{
					money = 0,	--寻宝花费数大于此值才会进入此表
					limit = -1,		--限制进入次数,-1为不限制
					prob = 1,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
--{itemid = 6362, prob = 198888, count = 1, notice = 2, broadcast = true, hundred = 50998, qiangdu = 1}, --屠龙刀						
{itemid = 168, prob = 58888, count = 1, notice = 2, broadcast = true, hundred = 51004, qiangdu = 1}, --芙蓉金龙斩      
{itemid = 169, prob = 58888, count = 1, notice = 2, broadcast = true, hundred = 51005, qiangdu = 1}, --芙蓉金龙甲(男)
{itemid = 170, prob = 58888, count = 1, notice = 2, broadcast = true, hundred = 51006, qiangdu = 1}, --芙蓉金龙甲(女)
{itemid = 171, prob = 45888, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --芙蓉金龙盔    
{itemid = 172, prob = 45888, count = 1, notice = 2, broadcast = true, hundred = 50300, qiangdu = 1}, --芙蓉金龙链    
{itemid = 173, prob = 45888, count = 1, notice = 2, broadcast = true, hundred = 50301, qiangdu = 1}, --芙蓉金龙腕    
{itemid = 174, prob = 45888, count = 1, notice = 2, broadcast = true, hundred = 50302, qiangdu = 1}, --芙蓉金龙戒    
{itemid = 175, prob = 45888, count = 1, notice = 2, broadcast = true, hundred = 50303, qiangdu = 1}, --芙蓉金龙带    
{itemid = 176, prob = 45888, count = 1, notice = 2, broadcast = true, hundred = 50304, qiangdu = 1}, --芙蓉金龙靴  

{itemid = 141, prob = 25888, count = 1, notice = 2, broadcast = true, hundred = 51004, qiangdu = 1}, --无尘怒斩      
{itemid = 142, prob = 25998, count = 1, notice = 2, broadcast = true, hundred = 51005, qiangdu = 1}, --无尘战幻甲(男)
{itemid = 143, prob = 25000, count = 1, notice = 2, broadcast = true, hundred = 51006, qiangdu = 1}, --无尘战幻甲(女)
   

{itemid = 114, prob = 18996, count = 1, notice = 2, broadcast = true, hundred = 51004, qiangdu = 1}, --菩提彻地斩
{itemid = 115, prob = 18998, count = 1, notice = 2, broadcast = true, hundred = 51005, qiangdu = 1}, --菩提战狂甲(男)
{itemid = 116, prob = 18000, count = 1, notice = 2, broadcast = true, hundred = 51006, qiangdu = 1}, --菩提战狂甲(女)
-- {itemid = 117, prob = 13798, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --菩提战狂盔
-- {itemid = 118, prob = 13800, count = 1, notice = 2, broadcast = true, hundred = 50300, qiangdu = 1}, --菩提战狂链
-- {itemid = 119, prob = 13802, count = 1, notice = 2, broadcast = true, hundred = 50301, qiangdu = 1}, --菩提战狂腕
-- {itemid = 120, prob = 13804, count = 1, notice = 2, broadcast = true, hundred = 50302, qiangdu = 1}, --菩提战狂戒
-- {itemid = 121, prob = 13806, count = 1, notice = 2, broadcast = true, hundred = 50303, qiangdu = 1}, --菩提战狂带
-- {itemid = 122, prob = 13808, count = 1, notice = 2, broadcast = true, hundred = 50304, qiangdu = 1}, --菩提战狂靴

{itemid = 87, prob = 13043, count = 1, notice = 2, broadcast = true, hundred = 12043, qiangdu = 1}, --冲天战刀
{itemid = 88, prob = 13044, count = 1, notice = 2, broadcast = true, hundred = 12044, qiangdu = 1}, --冲天战甲(男)
{itemid = 89, prob = 13045, count = 1, notice = 2, broadcast = true, hundred = 12045, qiangdu = 1}, --冲天战甲(女)
-- {itemid = 90, prob = 13853, count = 1, notice = 2, broadcast = true, hundred = 12853, qiangdu = 1}, --冲天战盔
-- {itemid = 91, prob = 13854, count = 1, notice = 2, broadcast = true, hundred = 12854, qiangdu = 1}, --冲天战链
-- {itemid = 92, prob = 13855, count = 1, notice = 2, broadcast = true, hundred = 12855, qiangdu = 1}, --冲天战腕
-- {itemid = 93, prob = 13856, count = 1, notice = 2, broadcast = true, hundred = 12856, qiangdu = 1}, --冲天战戒
-- {itemid = 94, prob = 13857, count = 1, notice = 2, broadcast = true, hundred = 12857, qiangdu = 1}, --冲天战带
-- {itemid = 95, prob = 13858, count = 1, notice = 2, broadcast = true, hundred = 12858, qiangdu = 1}, --冲天战靴

{itemid = 4690, prob = 6007, count = 1, notice = 2, broadcast = false, hundred = 6007, qiangdu = 1}, --誓言天玑
{itemid = 4691, prob = 6008, count = 1, notice = 2, broadcast = false, hundred = 6008, qiangdu = 1}, --誓言道衣(男)
{itemid = 4692, prob = 6009, count = 1, notice = 2, broadcast = false, hundred = 6009, qiangdu = 1}, --誓言道衣(女)
{itemid = 4693, prob = 6620, count = 1, notice = 2, broadcast = false, hundred = 6620, qiangdu = 1}, --誓言道盔
{itemid = 4694, prob = 6619, count = 1, notice = 2, broadcast = false, hundred = 6619, qiangdu = 1}, --誓言道链
{itemid = 4695, prob = 6618, count = 1, notice = 2, broadcast = false, hundred = 6618, qiangdu = 1}, --誓言道镯
{itemid = 4696, prob = 6617, count = 1, notice = 2, broadcast = false, hundred = 6617, qiangdu = 1}, --誓言道戒
{itemid = 4697, prob = 6616, count = 1, notice = 2, broadcast = false, hundred = 6616, qiangdu = 1}, --誓言道带
{itemid = 4698, prob = 6615, count = 1, notice = 2, broadcast = false, hundred = 6615, qiangdu = 1}, --誓言道靴

{itemid = 4681, prob = 6007, count = 1, notice = 2, broadcast = false, hundred = 6007, qiangdu = 1}, --誓言血饮
{itemid = 4682, prob = 6008, count = 1, notice = 2, broadcast = false, hundred = 6008, qiangdu = 1}, --誓言魔袍(男)
{itemid = 4683, prob = 6009, count = 1, notice = 2, broadcast = false, hundred = 6009, qiangdu = 1}, --誓言魔袍(女)
{itemid = 4684, prob = 6620, count = 1, notice = 2, broadcast = false, hundred = 6620, qiangdu = 1}, --誓言法盔
{itemid = 4685, prob = 6619, count = 1, notice = 2, broadcast = false, hundred = 6619, qiangdu = 1}, --誓言法链
{itemid = 4686, prob = 6618, count = 1, notice = 2, broadcast = false, hundred = 6618, qiangdu = 1}, --誓言法镯
{itemid = 4687, prob = 6617, count = 1, notice = 2, broadcast = false, hundred = 6617, qiangdu = 1}, --誓言法戒
{itemid = 4688, prob = 6616, count = 1, notice = 2, broadcast = false, hundred = 6616, qiangdu = 1}, --誓言法带
{itemid = 4689, prob = 6615, count = 1, notice = 2, broadcast = false, hundred = 6615, qiangdu = 1}, --誓言法靴

{itemid = 4672, prob = 6007, count = 1, notice = 2, broadcast = false, hundred = 6007, qiangdu = 1}, --誓言星王
{itemid = 4673, prob = 6008, count = 1, notice = 2, broadcast = false, hundred = 6008, qiangdu = 1}, --誓言战甲(男)
{itemid = 4674, prob = 6009, count = 1, notice = 2, broadcast = false, hundred = 6009, qiangdu = 1}, --誓言战甲(女)
{itemid = 4675, prob = 6620, count = 1, notice = 2, broadcast = false, hundred = 6620, qiangdu = 1}, --誓言战盔
{itemid = 4676, prob = 6619, count = 1, notice = 2, broadcast = false, hundred = 6619, qiangdu = 1}, --誓言战链
{itemid = 4677, prob = 6618, count = 1, notice = 2, broadcast = false, hundred = 6618, qiangdu = 1}, --誓言战镯
{itemid = 4678, prob = 6617, count = 1, notice = 2, broadcast = false, hundred = 6617, qiangdu = 1}, --誓言战戒
{itemid = 4679, prob = 6616, count = 1, notice = 2, broadcast = false, hundred = 6616, qiangdu = 1}, --誓言战带
{itemid = 4680, prob = 6615, count = 1, notice = 2, broadcast = false, hundred = 6615, qiangdu = 1}, --誓言战靴

{itemid = 4663, prob = 4043, count = 1, notice = 2, broadcast = false, hundred = 4043, qiangdu = 1}, --起源道剑
{itemid = 4664, prob = 4044, count = 1, notice = 2, broadcast = false, hundred = 4044, qiangdu = 1}, --起源道衣(男)
{itemid = 4665, prob = 4045, count = 1, notice = 2, broadcast = false, hundred = 4045, qiangdu = 1}, --起源道衣(女)
{itemid = 4666, prob = 4018, count = 1, notice = 2, broadcast = false, hundred = 4018, qiangdu = 1}, --起源道盔
{itemid = 4667, prob = 4017, count = 1, notice = 2, broadcast = false, hundred = 4017, qiangdu = 1}, --起源道链
{itemid = 4668, prob = 4016, count = 1, notice = 2, broadcast = false, hundred = 4016, qiangdu = 1}, --起源道镯
{itemid = 4669, prob = 4015, count = 1, notice = 2, broadcast = false, hundred = 4015, qiangdu = 1}, --起源道戒
{itemid = 4670, prob = 4013, count = 1, notice = 2, broadcast = false, hundred = 4013, qiangdu = 1}, --起源道带
{itemid = 4671, prob = 4012, count = 1, notice = 2, broadcast = false, hundred = 4012, qiangdu = 1}, --起源道靴

{itemid = 4654, prob = 4043, count = 1, notice = 2, broadcast = false, hundred = 4043, qiangdu = 1}, --起源法剑
{itemid = 4655, prob = 4044, count = 1, notice = 2, broadcast = false, hundred = 4044, qiangdu = 1}, --起源魔袍(男)
{itemid = 4656, prob = 4045, count = 1, notice = 2, broadcast = false, hundred = 4045, qiangdu = 1}, --起源魔袍(女)
{itemid = 4657, prob = 4018, count = 1, notice = 2, broadcast = false, hundred = 4018, qiangdu = 1}, --起源法盔
{itemid = 4658, prob = 4017, count = 1, notice = 2, broadcast = false, hundred = 4017, qiangdu = 1}, --起源法链
{itemid = 4659, prob = 4016, count = 1, notice = 2, broadcast = false, hundred = 4016, qiangdu = 1}, --起源法镯
{itemid = 4660, prob = 4015, count = 1, notice = 2, broadcast = false, hundred = 4015, qiangdu = 1}, --起源法戒
{itemid = 4661, prob = 4013, count = 1, notice = 2, broadcast = false, hundred = 4013, qiangdu = 1}, --起源法带
{itemid = 4662, prob = 4012, count = 1, notice = 2, broadcast = false, hundred = 4012, qiangdu = 1}, --起源法靴

{itemid = 4645, prob = 4043, count = 1, notice = 2, broadcast = false, hundred = 4043, qiangdu = 1}, --起源战刃
{itemid = 4646, prob = 4044, count = 1, notice = 2, broadcast = false, hundred = 4044, qiangdu = 1}, --起源战甲(男)
{itemid = 4647, prob = 4045, count = 1, notice = 2, broadcast = false, hundred = 4045, qiangdu = 1}, --起源战甲(女)
{itemid = 4648, prob = 4018, count = 1, notice = 2, broadcast = false, hundred = 4018, qiangdu = 1}, --起源战盔
{itemid = 4649, prob = 4017, count = 1, notice = 2, broadcast = false, hundred = 4017, qiangdu = 1}, --起源战链
{itemid = 4650, prob = 4016, count = 1, notice = 2, broadcast = false, hundred = 4016, qiangdu = 1}, --起源战镯
{itemid = 4651, prob = 4015, count = 1, notice = 2, broadcast = false, hundred = 4015, qiangdu = 1}, --起源战戒
{itemid = 4652, prob = 4013, count = 1, notice = 2, broadcast = false, hundred = 4013, qiangdu = 1}, --起源战带
{itemid = 4653, prob = 4012, count = 1, notice = 2, broadcast = false, hundred = 4012, qiangdu = 1}, --起源战靴

{itemid = 4618, prob = 1616, count = 1, notice = 2, broadcast = false, hundred = 1616, qiangdu = 1}, --上古开山
{itemid = 4619, prob = 1617, count = 1, notice = 2, broadcast = false, hundred = 1617, qiangdu = 1}, --上古重甲(男)
{itemid = 4620, prob = 1618, count = 1, notice = 2, broadcast = false, hundred = 1618, qiangdu = 1}, --上古重甲(女)
{itemid = 4621, prob = 1018, count = 1, notice = 2, broadcast = false, hundred = 1018, qiangdu = 1}, --上古战盔
{itemid = 4622, prob = 1017, count = 1, notice = 2, broadcast = false, hundred = 1017, qiangdu = 1}, --上古战链
{itemid = 4623, prob = 1016, count = 1, notice = 2, broadcast = false, hundred = 1016, qiangdu = 1}, --上古战镯
{itemid = 4624, prob = 1015, count = 1, notice = 2, broadcast = false, hundred = 1015, qiangdu = 1}, --上古战戒
{itemid = 4625, prob = 1013, count = 1, notice = 2, broadcast = false, hundred = 1013, qiangdu = 1}, --上古战带
{itemid = 4626, prob = 1012, count = 1, notice = 2, broadcast = false, hundred = 1012, qiangdu = 1}, --上古战靴

{itemid = 4636, prob = 1616, count = 1, notice = 2, broadcast = false, hundred = 1616, qiangdu = 1}, --上古霹雷
{itemid = 4637, prob = 1617, count = 1, notice = 2, broadcast = false, hundred = 1617, qiangdu = 1}, --上古道衣(男)
{itemid = 4638, prob = 1618, count = 1, notice = 2, broadcast = false, hundred = 1618, qiangdu = 1}, --上古道衣(女)
{itemid = 4639, prob = 1018, count = 1, notice = 2, broadcast = false, hundred = 1018, qiangdu = 1}, --上古道盔
{itemid = 4640, prob = 1017, count = 1, notice = 2, broadcast = false, hundred = 1017, qiangdu = 1}, --上古道链
{itemid = 4641, prob = 1016, count = 1, notice = 2, broadcast = false, hundred = 1016, qiangdu = 1}, --上古道镯
{itemid = 4642, prob = 1015, count = 1, notice = 2, broadcast = false, hundred = 1015, qiangdu = 1}, --上古道戒
{itemid = 4643, prob = 1013, count = 1, notice = 2, broadcast = false, hundred = 1013, qiangdu = 1}, --上古道带
{itemid = 4644, prob = 1012, count = 1, notice = 2, broadcast = false, hundred = 1012, qiangdu = 1}, --上古道靴

{itemid = 4627, prob = 1616, count = 1, notice = 2, broadcast = false, hundred = 1616, qiangdu = 1}, --上古拂尘
{itemid = 4628, prob = 1617, count = 1, notice = 2, broadcast = false, hundred = 1617, qiangdu = 1}, --上古魔袍(男)
{itemid = 4629, prob = 1618, count = 1, notice = 2, broadcast = false, hundred = 1618, qiangdu = 1}, --上古魔袍(女)
{itemid = 4630, prob = 1018, count = 1, notice = 2, broadcast = false, hundred = 1018, qiangdu = 1}, --上古法盔
{itemid = 4631, prob = 1017, count = 1, notice = 2, broadcast = false, hundred = 1017, qiangdu = 1}, --上古法链
{itemid = 4632, prob = 1016, count = 1, notice = 2, broadcast = false, hundred = 1016, qiangdu = 1}, --上古法镯
{itemid = 4633, prob = 1015, count = 1, notice = 2, broadcast = false, hundred = 1015, qiangdu = 1}, --上古法戒
{itemid = 4634, prob = 1013, count = 1, notice = 2, broadcast = false, hundred = 1013, qiangdu = 1}, --上古法带
{itemid = 4635, prob = 1012, count = 1, notice = 2, broadcast = false, hundred = 1012, qiangdu = 1}, --上古法靴

{itemid = 5125, prob = 108, count = 1, notice = 0, broadcast = false, hundred = 108, qiangdu = 0}, --初级BOSS挑战卷
{itemid = 5126, prob = 158, count = 1, notice = 2, broadcast = false, hundred = 158, qiangdu = 0}, --中级BOSS挑战卷
{itemid = 5127, prob = 258, count = 1, notice = 2, broadcast = false, hundred = 258, qiangdu = 0}, --高级BOSS挑战卷
{itemid = 6127, prob = 258, count = 1, notice = 2, broadcast = false, hundred = 258, qiangdu = 0}, --军魂BOSS召唤令

{itemid = 451, prob = 899, count = 1, notice = 2, broadcast = false, hundred = 899, qiangdu = 1}, --毁灭灵盔
{itemid = 452, prob = 898, count = 1, notice = 2, broadcast = false, hundred = 898, qiangdu = 1}, --毁灭灵链
{itemid = 453, prob = 897, count = 1, notice = 2, broadcast = false, hundred = 897, qiangdu = 1}, --毁灭灵镯
{itemid = 454, prob = 896, count = 1, notice = 2, broadcast = false, hundred = 896, qiangdu = 1}, --毁灭灵戒
{itemid = 455, prob = 895, count = 1, notice = 2, broadcast = false, hundred = 895, qiangdu = 1}, --毁灭灵带
{itemid = 456, prob = 893, count = 1, notice = 2, broadcast = false, hundred = 893, qiangdu = 1}, --毁灭灵靴
{itemid = 448, prob = 799, count = 1, notice = 2, broadcast = false, hundred = 799, qiangdu = 1}, --毁灭灵斩
{itemid = 449, prob = 798, count = 1, notice = 2, broadcast = false, hundred = 798, qiangdu = 1}, --毁灭灵甲(男)
{itemid = 450, prob = 797, count = 1, notice = 2, broadcast = false, hundred = 797, qiangdu = 1}, --毁灭灵甲(女)

{itemid = 442, prob = 688, count = 1, notice = 2, broadcast = false, hundred = 688, qiangdu = 1}, --通天神盔
{itemid = 443, prob = 689, count = 1, notice = 2, broadcast = false, hundred = 689, qiangdu = 1}, --通天神链
{itemid = 444, prob = 687, count = 1, notice = 2, broadcast = false, hundred = 687, qiangdu = 1}, --通天神镯
{itemid = 445, prob = 686, count = 1, notice = 2, broadcast = false, hundred = 686, qiangdu = 1}, --通天神戒
{itemid = 446, prob = 685, count = 1, notice = 2, broadcast = false, hundred = 685, qiangdu = 1}, --通天神带
{itemid = 447, prob = 683, count = 1, notice = 2, broadcast = false, hundred = 683, qiangdu = 1}, --通天神靴
{itemid = 439, prob = 477, count = 1, notice = 2, broadcast = false, hundred = 477, qiangdu = 1}, --通天神棍
{itemid = 440, prob = 475, count = 1, notice = 2, broadcast = false, hundred = 475, qiangdu = 1}, --通天神甲(男)
{itemid = 441, prob = 474, count = 1, notice = 2, broadcast = false, hundred = 474, qiangdu = 1}, --通天神甲(女)

{itemid = 433, prob = 520, count = 1, notice = 2, broadcast = false, hundred = 520, qiangdu = 1}, --霸主血盔
{itemid = 434, prob = 519, count = 1, notice = 2, broadcast = false, hundred = 519, qiangdu = 1}, --霸主血链
{itemid = 435, prob = 518, count = 1, notice = 2, broadcast = false, hundred = 518, qiangdu = 1}, --霸主血镯
{itemid = 436, prob = 516, count = 1, notice = 2, broadcast = false, hundred = 516, qiangdu = 1}, --霸主血戒
{itemid = 437, prob = 513, count = 1, notice = 2, broadcast = false, hundred = 513, qiangdu = 1}, --霸主血带
{itemid = 438, prob = 511, count = 1, notice = 2, broadcast = false, hundred = 511, qiangdu = 1}, --霸主血靴
{itemid = 430, prob = 253, count = 1, notice = 2, broadcast = false, hundred = 253, qiangdu = 1}, --霸主血剑
{itemid = 431, prob = 251, count = 1, notice = 2, broadcast = false, hundred = 251, qiangdu = 1}, --霸主血甲(男)
{itemid = 432, prob = 250, count = 1, notice = 2, broadcast = false, hundred = 250, qiangdu = 1}, --霸主血甲(女)

{itemid = 7197, prob = 99, count = 1, notice = 2, broadcast = false, hundred = 88, qiangdu = 0}, --玛法晶块
{itemid = 493, prob = 88, count = 1, notice = 2, broadcast = false, hundred = 88, qiangdu = 0}, --翅膀魂石·白虎
{itemid = 494, prob = 89, count = 1, notice = 2, broadcast = false, hundred = 89, qiangdu = 0}, --翅膀魂石·青龙
{itemid = 495, prob = 90, count = 1, notice = 2, broadcast = false, hundred = 90, qiangdu = 0}, --翅膀魂石·朱雀
{itemid = 6736, prob = 38, count = 1, notice = 2, broadcast = false, hundred = 58, qiangdu = 0}, --突破丹

-- {itemid = 421, prob = 45, count = 1, notice = 0, broadcast = false, hundred = 45, qiangdu = 1}, --十方刃
-- {itemid = 422, prob = 46, count = 1, notice = 0, broadcast = false, hundred = 46, qiangdu = 1}, --十方甲(男)
-- {itemid = 423, prob = 47, count = 1, notice = 0, broadcast = false, hundred = 47, qiangdu = 1}, --十方甲(女)
-- {itemid = 424, prob = 48, count = 1, notice = 0, broadcast = false, hundred = 48, qiangdu = 1}, --十方盔
-- {itemid = 425, prob = 49, count = 1, notice = 0, broadcast = false, hundred = 49, qiangdu = 1}, --十方链
-- {itemid = 426, prob = 50, count = 1, notice = 0, broadcast = false, hundred = 50, qiangdu = 1}, --十方镯
-- {itemid = 427, prob = 51, count = 1, notice = 0, broadcast = false, hundred = 51, qiangdu = 1}, --十方戒
-- {itemid = 428, prob = 52, count = 1, notice = 0, broadcast = false, hundred = 52, qiangdu = 1}, --十方带
-- {itemid = 429, prob = 53, count = 1, notice = 0, broadcast = false, hundred = 53, qiangdu = 1}, --十方靴
{itemid = 5651, prob = 38, count = 1, notice = 0, broadcast = false, hundred = 20, qiangdu = 0}, --来
{itemid = 5652, prob = 37, count = 1, notice = 0, broadcast = false, hundred = 17, qiangdu = 0}, --袭
{itemid = 5650, prob = 28, count = 1, notice = 0, broadcast = false, hundred = 15, qiangdu = 0}, --典
{itemid = 5649, prob = 26, count = 1, notice = 0, broadcast = false, hundred = 13, qiangdu = 0}, --庆
{itemid = 511, prob = 1, count = 1, notice = 0, broadcast = false, hundred = 1, qiangdu = 0}, --经验

					},
				},
                               {
					count = 250,	--寻宝次数大于此值才会进入
					maxcount = 9999,	--寻宝次数等于此值必定进入
					limit = 1,		--限制进入次数,-1为不限制
					prob = 5,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 5656, prob = 50, count = 1, notice = true, hundred = 26},  --服
						{itemid = 5655, prob = 58, count = 1, notice = true, hundred = 10},  --全
						{itemid = 5654, prob = 5 , count = 1, notice = true, hundred = 3 },  --爆
						{itemid = 5653, prob = 4 , count = 1, notice = true, hundred = 1 },  --嗨
					},
				},

				{
					money = 30000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
{itemid = 7078, prob = 30, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --雷神锤
{itemid = 7079, prob = 20, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --雷神甲
{itemid = 7080, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --雷神盔
{itemid = 7081, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --雷神项链
{itemid = 7082, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --雷神手镯
{itemid = 7083, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --雷神戒指
{itemid = 7084, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --雷神腰带
{itemid = 7085, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --雷神靴子


					},
				},


				{
					money = 7500,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
{itemid = 7052, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --凡·南明离火

					},
				},

				{
					money = 30000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
{itemid = 7057, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --魔躯
{itemid = 7058, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --血瞳
{itemid = 7059, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --鬼爪
{itemid = 7060, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --圣角

					},
				},
{
					money = 50000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
{itemid = 6888, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --蓝凤凰
{itemid = 6892, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1398, qiangdu = 0}, --深海鱼王
{itemid = 6896, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1397, qiangdu = 0}, --远古苍龙
{itemid = 6900, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1396, qiangdu = 0}, --灵狐武者
{itemid = 6941, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1396, qiangdu = 0}, --远古麒麟
					},
				},
				{
					money = 40000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
{itemid = 6888, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --蓝凤凰
{itemid = 6892, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1398, qiangdu = 0}, --深海鱼王
{itemid = 6896, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1397, qiangdu = 0}, --远古苍龙
{itemid = 6900, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1396, qiangdu = 0}, --灵狐武者
{itemid = 6941, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1396, qiangdu = 0}, --远古麒麟

					},
				},
				{
					money = 50000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
{itemid = 90, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 12853, qiangdu = 1}, --冲天战盔
{itemid = 91, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 12854, qiangdu = 1}, --冲天战链
{itemid = 92, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 12855, qiangdu = 1}, --冲天战腕
{itemid = 93, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 12856, qiangdu = 1}, --冲天战戒
{itemid = 94, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 12857, qiangdu = 1}, --冲天战带
{itemid = 95, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 12858, qiangdu = 1}, --冲天战靴
					},
				},
				{
					money = 180000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 2,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
{itemid = 117, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --菩提战狂盔
{itemid = 118, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50300, qiangdu = 1}, --菩提战狂链
{itemid = 119, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50301, qiangdu = 1}, --菩提战狂腕
{itemid = 120, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50302, qiangdu = 1}, --菩提战狂戒
{itemid = 121, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50303, qiangdu = 1}, --菩提战狂带
{itemid = 122, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50304, qiangdu = 1}, --菩提战狂靴
					},
				},

				{
					money = 360000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 2,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
{itemid = 144, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --无尘战幻盔    
{itemid = 145, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50300, qiangdu = 1}, --无尘战幻链    
{itemid = 146, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50301, qiangdu = 1}, --无尘战幻腕    
{itemid = 147, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50302, qiangdu = 1}, --无尘战幻戒    
{itemid = 148, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50303, qiangdu = 1}, --无尘战幻带    
{itemid = 149, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50304, qiangdu = 1}, --无尘战幻靴 
					},
				},

				{
					money = 100000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 300,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
{itemid = 6362, prob = 300, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --至尊屠龙刀 
{itemid = 6945, prob = 300, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --至尊屠龙甲   
{itemid = 6946, prob = 300, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --至尊屠龙甲   
					},
				},

{
					money = 80000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 200,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
{itemid = 6947, prob = 200, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --至尊屠龙盔  
{itemid = 6948, prob = 200, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --至尊屠龙项链   
{itemid = 6949, prob = 200, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --至尊屠龙戒 
{itemid = 6950, prob = 200, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --至尊屠龙手镯 
{itemid = 6951, prob = 200, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --至尊屠龙腰带 
{itemid = 6952, prob = 200, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --至尊屠龙靴子 
					},
				},


			},
			--法师
			{

				{
					money = 0,	--寻宝花费数大于此值才会进入此表
					limit = -1,		--限制进入次数,-1为不限制
					prob = 1,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
--{itemid = 6362, prob = 198888, count = 1, notice = 2, broadcast = true, hundred = 50998, qiangdu = 1}, --屠龙刀						
{itemid = 177, prob = 58888, count = 1, notice = 2, broadcast = true, hundred = 51004, qiangdu = 1}, --芙蓉噬魂杖      
{itemid = 178, prob = 58888, count = 1, notice = 2, broadcast = true, hundred = 51005, qiangdu = 1}, --芙蓉法影袍(男)
{itemid = 179, prob = 58888, count = 1, notice = 2, broadcast = true, hundred = 51006, qiangdu = 1}, --芙蓉法影袍(女)
{itemid = 180, prob = 45888, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --芙蓉法虹盔   
{itemid = 181, prob = 45888, count = 1, notice = 2, broadcast = true, hundred = 50300, qiangdu = 1}, --芙蓉法虹链   
{itemid = 182, prob = 45888, count = 1, notice = 2, broadcast = true, hundred = 50301, qiangdu = 1}, --芙蓉法虹腕    
{itemid = 183, prob = 45888, count = 1, notice = 2, broadcast = true, hundred = 50302, qiangdu = 1}, --芙蓉法虹戒    
{itemid = 184, prob = 45888, count = 1, notice = 2, broadcast = true, hundred = 50303, qiangdu = 1}, --芙蓉法虹带  
{itemid = 185, prob = 45888, count = 1, notice = 2, broadcast = true, hundred = 50304, qiangdu = 1}, --芙蓉法虹靴 

{itemid = 150, prob = 25888, count = 1, notice = 2, broadcast = true, hundred = 51004, qiangdu = 1}, --无尘禅杖      
{itemid = 151, prob = 25998, count = 1, notice = 2, broadcast = true, hundred = 51005, qiangdu = 1}, --无尘法幻袍(男)
{itemid = 152, prob = 25000, count = 1, notice = 2, broadcast = true, hundred = 51006, qiangdu = 1}, --无尘法幻袍(女)
 
{itemid = 123, prob = 18996, count = 1, notice = 2, broadcast = true, hundred = 51001, qiangdu = 1}, --菩提骷髅杖
{itemid = 124, prob = 18998, count = 1, notice = 2, broadcast = true, hundred = 51002, qiangdu = 1}, --菩提法痴袍(男)
{itemid = 125, prob = 18000, count = 1, notice = 2, broadcast = true, hundred = 51003, qiangdu = 1}, --菩提法痴袍(女)
-- {itemid = 126, prob = 13798, count = 1, notice = 2, broadcast = true, hundred = 50305, qiangdu = 1}, --菩提法痴盔
-- {itemid = 127, prob = 13800, count = 1, notice = 2, broadcast = true, hundred = 50306, qiangdu = 1}, --菩提法痴链
-- {itemid = 128, prob = 13802, count = 1, notice = 2, broadcast = true, hundred = 50307, qiangdu = 1}, --菩提法痴腕
-- {itemid = 129, prob = 13804, count = 1, notice = 2, broadcast = true, hundred = 50308, qiangdu = 1}, --菩提法痴戒
-- {itemid = 130, prob = 13806, count = 1, notice = 2, broadcast = true, hundred = 50309, qiangdu = 1}, --菩提法痴带
-- {itemid = 131, prob = 13808, count = 1, notice = 2, broadcast = true, hundred = 50310, qiangdu = 1}, --菩提法痴靴

{itemid = 96 , prob = 13043, count = 1, notice = 2, broadcast = true, hundred = 12043, qiangdu = 1}, --冲天魔杖
{itemid = 97 , prob = 13044, count = 1, notice = 2, broadcast = true, hundred = 12044, qiangdu = 1}, --冲天魔袍(男)
{itemid = 98 , prob = 13045, count = 1, notice = 2, broadcast = true, hundred = 12045, qiangdu = 1}, --冲天魔袍(女)
-- {itemid = 99 , prob = 13853, count = 1, notice = 2, broadcast = true, hundred = 12853, qiangdu = 1}, --冲天魔盔
-- {itemid = 100, prob = 13854, count = 1, notice = 2, broadcast = true, hundred = 12854, qiangdu = 1}, --冲天魔链
-- {itemid = 101, prob = 13855, count = 1, notice = 2, broadcast = true, hundred = 12855, qiangdu = 1}, --冲天魔腕
-- {itemid = 102, prob = 13856, count = 1, notice = 2, broadcast = true, hundred = 12856, qiangdu = 1}, --冲天魔戒
-- {itemid = 103, prob = 13857, count = 1, notice = 2, broadcast = true, hundred = 12857, qiangdu = 1}, --冲天魔带
-- {itemid = 104, prob = 13858, count = 1, notice = 2, broadcast = true, hundred = 12858, qiangdu = 1}, --冲天魔靴

{itemid = 4690, prob = 6007, count = 1, notice = 2, broadcast = false, hundred = 6007, qiangdu = 1}, --誓言天玑
{itemid = 4691, prob = 6008, count = 1, notice = 2, broadcast = false, hundred = 6008, qiangdu = 1}, --誓言道衣(男)
{itemid = 4692, prob = 6009, count = 1, notice = 2, broadcast = false, hundred = 6009, qiangdu = 1}, --誓言道衣(女)
{itemid = 4693, prob = 6620, count = 1, notice = 2, broadcast = false, hundred = 6620, qiangdu = 1}, --誓言道盔
{itemid = 4694, prob = 6619, count = 1, notice = 2, broadcast = false, hundred = 6619, qiangdu = 1}, --誓言道链
{itemid = 4695, prob = 6618, count = 1, notice = 2, broadcast = false, hundred = 6618, qiangdu = 1}, --誓言道镯
{itemid = 4696, prob = 6617, count = 1, notice = 2, broadcast = false, hundred = 6617, qiangdu = 1}, --誓言道戒
{itemid = 4697, prob = 6616, count = 1, notice = 2, broadcast = false, hundred = 6616, qiangdu = 1}, --誓言道带
{itemid = 4698, prob = 6615, count = 1, notice = 2, broadcast = false, hundred = 6615, qiangdu = 1}, --誓言道靴

{itemid = 4681, prob = 6007, count = 1, notice = 2, broadcast = false, hundred = 6007, qiangdu = 1}, --誓言血饮
{itemid = 4682, prob = 6008, count = 1, notice = 2, broadcast = false, hundred = 6008, qiangdu = 1}, --誓言魔袍(男)
{itemid = 4683, prob = 6009, count = 1, notice = 2, broadcast = false, hundred = 6009, qiangdu = 1}, --誓言魔袍(女)
{itemid = 4684, prob = 6620, count = 1, notice = 2, broadcast = false, hundred = 6620, qiangdu = 1}, --誓言法盔
{itemid = 4685, prob = 6619, count = 1, notice = 2, broadcast = false, hundred = 6619, qiangdu = 1}, --誓言法链
{itemid = 4686, prob = 6618, count = 1, notice = 2, broadcast = false, hundred = 6618, qiangdu = 1}, --誓言法镯
{itemid = 4687, prob = 6617, count = 1, notice = 2, broadcast = false, hundred = 6617, qiangdu = 1}, --誓言法戒
{itemid = 4688, prob = 6616, count = 1, notice = 2, broadcast = false, hundred = 6616, qiangdu = 1}, --誓言法带
{itemid = 4689, prob = 6615, count = 1, notice = 2, broadcast = false, hundred = 6615, qiangdu = 1}, --誓言法靴

{itemid = 4672, prob = 6007, count = 1, notice = 2, broadcast = false, hundred = 6007, qiangdu = 1}, --誓言星王
{itemid = 4673, prob = 6008, count = 1, notice = 2, broadcast = false, hundred = 6008, qiangdu = 1}, --誓言战甲(男)
{itemid = 4674, prob = 6009, count = 1, notice = 2, broadcast = false, hundred = 6009, qiangdu = 1}, --誓言战甲(女)
{itemid = 4675, prob = 6620, count = 1, notice = 2, broadcast = false, hundred = 6620, qiangdu = 1}, --誓言战盔
{itemid = 4676, prob = 6619, count = 1, notice = 2, broadcast = false, hundred = 6619, qiangdu = 1}, --誓言战链
{itemid = 4677, prob = 6618, count = 1, notice = 2, broadcast = false, hundred = 6618, qiangdu = 1}, --誓言战镯
{itemid = 4678, prob = 6617, count = 1, notice = 2, broadcast = false, hundred = 6617, qiangdu = 1}, --誓言战戒
{itemid = 4679, prob = 6616, count = 1, notice = 2, broadcast = false, hundred = 6616, qiangdu = 1}, --誓言战带
{itemid = 4680, prob = 6615, count = 1, notice = 2, broadcast = false, hundred = 6615, qiangdu = 1}, --誓言战靴

{itemid = 4663, prob = 4043, count = 1, notice = 2, broadcast = false, hundred = 4043, qiangdu = 1}, --起源道剑
{itemid = 4664, prob = 4044, count = 1, notice = 2, broadcast = false, hundred = 4044, qiangdu = 1}, --起源道衣(男)
{itemid = 4665, prob = 4045, count = 1, notice = 2, broadcast = false, hundred = 4045, qiangdu = 1}, --起源道衣(女)
{itemid = 4666, prob = 4018, count = 1, notice = 2, broadcast = false, hundred = 4018, qiangdu = 1}, --起源道盔
{itemid = 4667, prob = 4017, count = 1, notice = 2, broadcast = false, hundred = 4017, qiangdu = 1}, --起源道链
{itemid = 4668, prob = 4016, count = 1, notice = 2, broadcast = false, hundred = 4016, qiangdu = 1}, --起源道镯
{itemid = 4669, prob = 4015, count = 1, notice = 2, broadcast = false, hundred = 4015, qiangdu = 1}, --起源道戒
{itemid = 4670, prob = 4013, count = 1, notice = 2, broadcast = false, hundred = 4013, qiangdu = 1}, --起源道带
{itemid = 4671, prob = 4012, count = 1, notice = 2, broadcast = false, hundred = 4012, qiangdu = 1}, --起源道靴

{itemid = 4654, prob = 4043, count = 1, notice = 2, broadcast = false, hundred = 4043, qiangdu = 1}, --起源法剑
{itemid = 4655, prob = 4044, count = 1, notice = 2, broadcast = false, hundred = 4044, qiangdu = 1}, --起源魔袍(男)
{itemid = 4656, prob = 4045, count = 1, notice = 2, broadcast = false, hundred = 4045, qiangdu = 1}, --起源魔袍(女)
{itemid = 4657, prob = 4018, count = 1, notice = 2, broadcast = false, hundred = 4018, qiangdu = 1}, --起源法盔
{itemid = 4658, prob = 4017, count = 1, notice = 2, broadcast = false, hundred = 4017, qiangdu = 1}, --起源法链
{itemid = 4659, prob = 4016, count = 1, notice = 2, broadcast = false, hundred = 4016, qiangdu = 1}, --起源法镯
{itemid = 4660, prob = 4015, count = 1, notice = 2, broadcast = false, hundred = 4015, qiangdu = 1}, --起源法戒
{itemid = 4661, prob = 4013, count = 1, notice = 2, broadcast = false, hundred = 4013, qiangdu = 1}, --起源法带
{itemid = 4662, prob = 4012, count = 1, notice = 2, broadcast = false, hundred = 4012, qiangdu = 1}, --起源法靴

{itemid = 4645, prob = 4043, count = 1, notice = 2, broadcast = false, hundred = 4043, qiangdu = 1}, --起源战刃
{itemid = 4646, prob = 4044, count = 1, notice = 2, broadcast = false, hundred = 4044, qiangdu = 1}, --起源战甲(男)
{itemid = 4647, prob = 4045, count = 1, notice = 2, broadcast = false, hundred = 4045, qiangdu = 1}, --起源战甲(女)
{itemid = 4648, prob = 4018, count = 1, notice = 2, broadcast = false, hundred = 4018, qiangdu = 1}, --起源战盔
{itemid = 4649, prob = 4017, count = 1, notice = 2, broadcast = false, hundred = 4017, qiangdu = 1}, --起源战链
{itemid = 4650, prob = 4016, count = 1, notice = 2, broadcast = false, hundred = 4016, qiangdu = 1}, --起源战镯
{itemid = 4651, prob = 4015, count = 1, notice = 2, broadcast = false, hundred = 4015, qiangdu = 1}, --起源战戒
{itemid = 4652, prob = 4013, count = 1, notice = 2, broadcast = false, hundred = 4013, qiangdu = 1}, --起源战带
{itemid = 4653, prob = 4012, count = 1, notice = 2, broadcast = false, hundred = 4012, qiangdu = 1}, --起源战靴

{itemid = 4618, prob = 1616, count = 1, notice = 2, broadcast = false, hundred = 1616, qiangdu = 1}, --上古开山
{itemid = 4619, prob = 1617, count = 1, notice = 2, broadcast = false, hundred = 1617, qiangdu = 1}, --上古重甲(男)
{itemid = 4620, prob = 1618, count = 1, notice = 2, broadcast = false, hundred = 1618, qiangdu = 1}, --上古重甲(女)
{itemid = 4621, prob = 1018, count = 1, notice = 2, broadcast = false, hundred = 1018, qiangdu = 1}, --上古战盔
{itemid = 4622, prob = 1017, count = 1, notice = 2, broadcast = false, hundred = 1017, qiangdu = 1}, --上古战链
{itemid = 4623, prob = 1016, count = 1, notice = 2, broadcast = false, hundred = 1016, qiangdu = 1}, --上古战镯
{itemid = 4624, prob = 1015, count = 1, notice = 2, broadcast = false, hundred = 1015, qiangdu = 1}, --上古战戒
{itemid = 4625, prob = 1013, count = 1, notice = 2, broadcast = false, hundred = 1013, qiangdu = 1}, --上古战带
{itemid = 4626, prob = 1012, count = 1, notice = 2, broadcast = false, hundred = 1012, qiangdu = 1}, --上古战靴

{itemid = 4636, prob = 1616, count = 1, notice = 2, broadcast = false, hundred = 1616, qiangdu = 1}, --上古霹雷
{itemid = 4637, prob = 1617, count = 1, notice = 2, broadcast = false, hundred = 1617, qiangdu = 1}, --上古道衣(男)
{itemid = 4638, prob = 1618, count = 1, notice = 2, broadcast = false, hundred = 1618, qiangdu = 1}, --上古道衣(女)
{itemid = 4639, prob = 1018, count = 1, notice = 2, broadcast = false, hundred = 1018, qiangdu = 1}, --上古道盔
{itemid = 4640, prob = 1017, count = 1, notice = 2, broadcast = false, hundred = 1017, qiangdu = 1}, --上古道链
{itemid = 4641, prob = 1016, count = 1, notice = 2, broadcast = false, hundred = 1016, qiangdu = 1}, --上古道镯
{itemid = 4642, prob = 1015, count = 1, notice = 2, broadcast = false, hundred = 1015, qiangdu = 1}, --上古道戒
{itemid = 4643, prob = 1013, count = 1, notice = 2, broadcast = false, hundred = 1013, qiangdu = 1}, --上古道带
{itemid = 4644, prob = 1012, count = 1, notice = 2, broadcast = false, hundred = 1012, qiangdu = 1}, --上古道靴

{itemid = 4627, prob = 1616, count = 1, notice = 2, broadcast = false, hundred = 1616, qiangdu = 1}, --上古拂尘
{itemid = 4628, prob = 1617, count = 1, notice = 2, broadcast = false, hundred = 1617, qiangdu = 1}, --上古魔袍(男)
{itemid = 4629, prob = 1618, count = 1, notice = 2, broadcast = false, hundred = 1618, qiangdu = 1}, --上古魔袍(女)
{itemid = 4630, prob = 1018, count = 1, notice = 2, broadcast = false, hundred = 1018, qiangdu = 1}, --上古法盔
{itemid = 4631, prob = 1017, count = 1, notice = 2, broadcast = false, hundred = 1017, qiangdu = 1}, --上古法链
{itemid = 4632, prob = 1016, count = 1, notice = 2, broadcast = false, hundred = 1016, qiangdu = 1}, --上古法镯
{itemid = 4633, prob = 1015, count = 1, notice = 2, broadcast = false, hundred = 1015, qiangdu = 1}, --上古法戒
{itemid = 4634, prob = 1013, count = 1, notice = 2, broadcast = false, hundred = 1013, qiangdu = 1}, --上古法带
{itemid = 4635, prob = 1012, count = 1, notice = 2, broadcast = false, hundred = 1012, qiangdu = 1}, --上古法靴

{itemid = 5125, prob = 108, count = 1, notice = 0, broadcast = false, hundred = 108, qiangdu = 0}, --初级BOSS挑战卷
{itemid = 5126, prob = 158, count = 1, notice = 2, broadcast = false, hundred = 158, qiangdu = 0}, --中级BOSS挑战卷
{itemid = 5127, prob = 258, count = 1, notice = 2, broadcast = false, hundred = 258, qiangdu = 0}, --高级BOSS挑战卷
{itemid = 6127, prob = 258, count = 1, notice = 2, broadcast = false, hundred = 258, qiangdu = 0}, --军魂BOSS召唤令

{itemid = 451, prob = 899, count = 1, notice = 2, broadcast = false, hundred = 899, qiangdu = 1}, --毁灭灵盔
{itemid = 452, prob = 898, count = 1, notice = 2, broadcast = false, hundred = 898, qiangdu = 1}, --毁灭灵链
{itemid = 453, prob = 897, count = 1, notice = 2, broadcast = false, hundred = 897, qiangdu = 1}, --毁灭灵镯
{itemid = 454, prob = 896, count = 1, notice = 2, broadcast = false, hundred = 896, qiangdu = 1}, --毁灭灵戒
{itemid = 455, prob = 895, count = 1, notice = 2, broadcast = false, hundred = 895, qiangdu = 1}, --毁灭灵带
{itemid = 456, prob = 893, count = 1, notice = 2, broadcast = false, hundred = 893, qiangdu = 1}, --毁灭灵靴
{itemid = 448, prob = 799, count = 1, notice = 2, broadcast = false, hundred = 799, qiangdu = 1}, --毁灭灵斩
{itemid = 449, prob = 798, count = 1, notice = 2, broadcast = false, hundred = 798, qiangdu = 1}, --毁灭灵甲(男)
{itemid = 450, prob = 797, count = 1, notice = 2, broadcast = false, hundred = 797, qiangdu = 1}, --毁灭灵甲(女)

{itemid = 442, prob = 688, count = 1, notice = 2, broadcast = false, hundred = 688, qiangdu = 1}, --通天神盔
{itemid = 443, prob = 689, count = 1, notice = 2, broadcast = false, hundred = 689, qiangdu = 1}, --通天神链
{itemid = 444, prob = 687, count = 1, notice = 2, broadcast = false, hundred = 687, qiangdu = 1}, --通天神镯
{itemid = 445, prob = 686, count = 1, notice = 2, broadcast = false, hundred = 686, qiangdu = 1}, --通天神戒
{itemid = 446, prob = 685, count = 1, notice = 2, broadcast = false, hundred = 685, qiangdu = 1}, --通天神带
{itemid = 447, prob = 683, count = 1, notice = 2, broadcast = false, hundred = 683, qiangdu = 1}, --通天神靴
{itemid = 439, prob = 477, count = 1, notice = 2, broadcast = false, hundred = 477, qiangdu = 1}, --通天神棍
{itemid = 440, prob = 475, count = 1, notice = 2, broadcast = false, hundred = 475, qiangdu = 1}, --通天神甲(男)
{itemid = 441, prob = 474, count = 1, notice = 2, broadcast = false, hundred = 474, qiangdu = 1}, --通天神甲(女)

{itemid = 433, prob = 520, count = 1, notice = 2, broadcast = false, hundred = 520, qiangdu = 1}, --霸主血盔
{itemid = 434, prob = 519, count = 1, notice = 2, broadcast = false, hundred = 519, qiangdu = 1}, --霸主血链
{itemid = 435, prob = 518, count = 1, notice = 2, broadcast = false, hundred = 518, qiangdu = 1}, --霸主血镯
{itemid = 436, prob = 516, count = 1, notice = 2, broadcast = false, hundred = 516, qiangdu = 1}, --霸主血戒
{itemid = 437, prob = 513, count = 1, notice = 2, broadcast = false, hundred = 513, qiangdu = 1}, --霸主血带
{itemid = 438, prob = 511, count = 1, notice = 2, broadcast = false, hundred = 511, qiangdu = 1}, --霸主血靴
{itemid = 430, prob = 253, count = 1, notice = 2, broadcast = false, hundred = 253, qiangdu = 1}, --霸主血剑
{itemid = 431, prob = 251, count = 1, notice = 2, broadcast = false, hundred = 251, qiangdu = 1}, --霸主血甲(男)
{itemid = 432, prob = 250, count = 1, notice = 2, broadcast = false, hundred = 250, qiangdu = 1}, --霸主血甲(女)
{itemid = 7197, prob = 99, count = 1, notice = 2, broadcast = false, hundred = 88, qiangdu = 0}, --玛法晶块
{itemid = 493, prob = 88, count = 1, notice = 2, broadcast = false, hundred = 88, qiangdu = 0}, --翅膀魂石·白虎
{itemid = 494, prob = 89, count = 1, notice = 2, broadcast = false, hundred = 89, qiangdu = 0}, --翅膀魂石·青龙
{itemid = 495, prob = 90, count = 1, notice = 2, broadcast = false, hundred = 90, qiangdu = 0}, --翅膀魂石·朱雀
{itemid = 6736, prob = 38, count = 1, notice = 2, broadcast = false, hundred = 58, qiangdu = 0}, --突破丹

-- {itemid = 421, prob = 45, count = 1, notice = 0, broadcast = false, hundred = 45, qiangdu = 1}, --十方刃
-- {itemid = 422, prob = 46, count = 1, notice = 0, broadcast = false, hundred = 46, qiangdu = 1}, --十方甲(男)
-- {itemid = 423, prob = 47, count = 1, notice = 0, broadcast = false, hundred = 47, qiangdu = 1}, --十方甲(女)
-- {itemid = 424, prob = 48, count = 1, notice = 0, broadcast = false, hundred = 48, qiangdu = 1}, --十方盔
-- {itemid = 425, prob = 49, count = 1, notice = 0, broadcast = false, hundred = 49, qiangdu = 1}, --十方链
-- {itemid = 426, prob = 50, count = 1, notice = 0, broadcast = false, hundred = 50, qiangdu = 1}, --十方镯
-- {itemid = 427, prob = 51, count = 1, notice = 0, broadcast = false, hundred = 51, qiangdu = 1}, --十方戒
-- {itemid = 428, prob = 52, count = 1, notice = 0, broadcast = false, hundred = 52, qiangdu = 1}, --十方带
-- {itemid = 429, prob = 53, count = 1, notice = 0, broadcast = false, hundred = 53, qiangdu = 1}, --十方靴
{itemid = 5651, prob = 38, count = 1, notice = 0, broadcast = false, hundred = 20, qiangdu = 0}, --来
{itemid = 5652, prob = 37, count = 1, notice = 0, broadcast = false, hundred = 17, qiangdu = 0}, --袭
{itemid = 5650, prob = 28, count = 1, notice = 0, broadcast = false, hundred = 15, qiangdu = 0}, --典
{itemid = 5649, prob = 26, count = 1, notice = 0, broadcast = false, hundred = 13, qiangdu = 0}, --庆
{itemid = 511, prob = 1, count = 1, notice = 0, broadcast = false, hundred = 1, qiangdu = 0}, --经验

					},
				},
                               {
					count = 250,	--寻宝次数大于此值才会进入
					maxcount = 9999,	--寻宝次数等于此值必定进入
					limit = 1,		--限制进入次数,-1为不限制
					prob = 5,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 5656, prob = 50, count = 1, notice = true, hundred = 26},  --服
						{itemid = 5655, prob = 58, count = 1, notice = true, hundred = 10},  --全
						{itemid = 5654, prob = 5 , count = 1, notice = true, hundred = 3 },  --爆
						{itemid = 5653, prob = 4 , count = 1, notice = true, hundred = 1 },  --嗨
					},
				},
				{
					money = 30000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
{itemid = 7078, prob = 30, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --雷神锤
{itemid = 7079, prob = 20, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --雷神甲
{itemid = 7080, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --雷神盔
{itemid = 7081, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --雷神项链
{itemid = 7082, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --雷神手镯
{itemid = 7083, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --雷神戒指
{itemid = 7084, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --雷神腰带
{itemid = 7085, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --雷神靴子


					},
				},
				{
					money = 7500,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
{itemid = 7052, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --凡·南明离火

					},
				},

				{
					money = 30000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
{itemid = 7057, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --魔躯
{itemid = 7058, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --血瞳
{itemid = 7059, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --鬼爪
{itemid = 7060, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --圣角

					},
				},
{
					money = 50000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
{itemid = 6888, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --蓝凤凰
{itemid = 6892, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1398, qiangdu = 0}, --深海鱼王
{itemid = 6896, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1397, qiangdu = 0}, --远古苍龙
{itemid = 6900, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1396, qiangdu = 0}, --灵狐武者
{itemid = 6941, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1396, qiangdu = 0}, --远古麒麟
					},
				},
				{
					money = 40000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
{itemid = 6888, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --蓝凤凰
{itemid = 6892, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1398, qiangdu = 0}, --深海鱼王
{itemid = 6896, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1397, qiangdu = 0}, --远古苍龙
{itemid = 6900, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1396, qiangdu = 0}, --灵狐武者
{itemid = 6941, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1396, qiangdu = 0}, --远古麒麟

					},
				},
				{
					money = 50000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
{itemid = 99, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 12853, qiangdu = 1}, --冲天魔盔
{itemid = 100, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 12854, qiangdu = 1}, --冲天魔链
{itemid = 101, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 12855, qiangdu = 1}, --冲天魔腕
{itemid = 102, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 12856, qiangdu = 1}, --冲天魔戒
{itemid = 103, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 12857, qiangdu = 1}, --冲天魔带
{itemid = 104, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 12858, qiangdu = 1}, --冲天魔靴
					},
				},

{
					money = 180000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 2,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
{itemid = 126, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50305, qiangdu = 1}, --菩提法痴盔
{itemid = 127, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50306, qiangdu = 1}, --菩提法痴链
{itemid = 128, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50307, qiangdu = 1}, --菩提法痴腕
{itemid = 129, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50308, qiangdu = 1}, --菩提法痴戒
{itemid = 130, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50309, qiangdu = 1}, --菩提法痴带
{itemid = 131, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50310, qiangdu = 1}, --菩提法痴靴
					},
				},

				{
					money = 360000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 2,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
{itemid = 153, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50305, qiangdu = 1}, --无尘法幻盔    
{itemid = 154, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50306, qiangdu = 1}, --无尘法幻链    
{itemid = 155, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50307, qiangdu = 1}, --无尘法幻腕    
{itemid = 156, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50308, qiangdu = 1}, --无尘法幻戒    
{itemid = 157, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50309, qiangdu = 1}, --无尘法幻带    
{itemid = 158, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50310, qiangdu = 1}, --无尘法幻靴   
					},
				},

				{
					money = 100000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 300,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
{itemid = 6362, prob = 300, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --至尊屠龙刀 
{itemid = 6945, prob = 300, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --至尊屠龙甲   
{itemid = 6946, prob = 300, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --至尊屠龙甲   
					},
				},

{
					money = 80000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 200,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
{itemid = 6947, prob = 200, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --至尊屠龙盔  
{itemid = 6948, prob = 200, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --至尊屠龙项链   
{itemid = 6949, prob = 200, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --至尊屠龙戒 
{itemid = 6950, prob = 200, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --至尊屠龙手镯 
{itemid = 6951, prob = 200, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --至尊屠龙腰带 
{itemid = 6952, prob = 200, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --至尊屠龙靴子 
					},
				},

			},
			--道士
			{

				{
					money = 0,	--寻宝花费数大于此值才会进入此表
					limit = -1,		--限制进入次数,-1为不限制
					prob = 1,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
--{itemid = 6362, prob = 198888, count = 1, notice = 2, broadcast = true, hundred = 50998, qiangdu = 1}, --屠龙刀

{itemid = 186, prob = 58888, count = 1, notice = 2, broadcast = true, hundred = 51004, qiangdu = 1}, --芙蓉幽冥剑      
{itemid = 187, prob = 58888, count = 1, notice = 2, broadcast = true, hundred = 51005, qiangdu = 1}, --芙蓉道影衣(男)
{itemid = 188, prob = 58888, count = 1, notice = 2, broadcast = true, hundred = 51006, qiangdu = 1}, --芙蓉道影衣(女)
{itemid = 189, prob = 45888, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --芙蓉道骨盔   
{itemid = 190, prob = 45888, count = 1, notice = 2, broadcast = true, hundred = 50300, qiangdu = 1}, --芙蓉道骨链   
{itemid = 191, prob = 45888, count = 1, notice = 2, broadcast = true, hundred = 50301, qiangdu = 1}, --芙蓉道骨腕    
{itemid = 192, prob = 45888, count = 1, notice = 2, broadcast = true, hundred = 50302, qiangdu = 1}, --芙蓉道骨戒    
{itemid = 193, prob = 45888, count = 1, notice = 2, broadcast = true, hundred = 50303, qiangdu = 1}, --芙蓉道骨带  
{itemid = 194, prob = 45888, count = 1, notice = 2, broadcast = true, hundred = 50304, qiangdu = 1}, --芙蓉道骨靴 

{itemid = 159, prob = 25888, count = 1, notice = 2, broadcast = true, hundred = 51004, qiangdu = 1}, --无尘血剑      
{itemid = 160, prob = 25998, count = 1, notice = 2, broadcast = true, hundred = 51005, qiangdu = 1}, --无尘道幻衣(男)
{itemid = 161, prob = 25000, count = 1, notice = 2, broadcast = true, hundred = 51006, qiangdu = 1}, --无尘道幻衣(女)
 

{itemid = 132, prob = 18996, count = 1, notice = 2, broadcast = true, hundred = 50998, qiangdu = 1}, --菩提金纹剑
{itemid = 133, prob = 18998, count = 1, notice = 2, broadcast = true, hundred = 50999, qiangdu = 1}, --菩提道仙衣(男)
{itemid = 134, prob = 18000, count = 1, notice = 2, broadcast = true, hundred = 51000, qiangdu = 1}, --菩提道仙衣(女)
-- {itemid = 135, prob = 13798, count = 1, notice = 2, broadcast = true, hundred = 50311, qiangdu = 1}, --菩提道仙盔
-- {itemid = 136, prob = 13800, count = 1, notice = 2, broadcast = true, hundred = 50312, qiangdu = 1}, --菩提道仙链
-- {itemid = 137, prob = 13802, count = 1, notice = 2, broadcast = true, hundred = 50313, qiangdu = 1}, --菩提道仙腕
-- {itemid = 138, prob = 13804, count = 1, notice = 2, broadcast = true, hundred = 50314, qiangdu = 1}, --菩提道仙戒
-- {itemid = 139, prob = 13806, count = 1, notice = 2, broadcast = true, hundred = 50315, qiangdu = 1}, --菩提道仙带
-- {itemid = 140, prob = 13808, count = 1, notice = 2, broadcast = true, hundred = 50316, qiangdu = 1}, --菩提道仙靴

{itemid = 105, prob = 13043, count = 1, notice = 2, broadcast = true, hundred = 12043, qiangdu = 1}, --冲天道剑
{itemid = 106, prob = 13044, count = 1, notice = 2, broadcast = true, hundred = 12044, qiangdu = 1}, --冲天道衣(男)
{itemid = 107, prob = 13045, count = 1, notice = 2, broadcast = true, hundred = 12045, qiangdu = 1}, --冲天道衣(女)
-- {itemid = 108, prob = 13853, count = 1, notice = 2, broadcast = true, hundred = 12853, qiangdu = 1}, --冲天道盔
-- {itemid = 109, prob = 13854, count = 1, notice = 2, broadcast = true, hundred = 12854, qiangdu = 1}, --冲天道链
-- {itemid = 110, prob = 13855, count = 1, notice = 2, broadcast = true, hundred = 12855, qiangdu = 1}, --冲天道腕
-- {itemid = 111, prob = 13856, count = 1, notice = 2, broadcast = true, hundred = 12856, qiangdu = 1}, --冲天道戒
-- {itemid = 112, prob = 13857, count = 1, notice = 2, broadcast = true, hundred = 12857, qiangdu = 1}, --冲天道带
-- {itemid = 113, prob = 13858, count = 1, notice = 2, broadcast = true, hundred = 12858, qiangdu = 1}, --冲天道靴

{itemid = 4690, prob = 6007, count = 1, notice = 2, broadcast = false, hundred = 6007, qiangdu = 1}, --誓言天玑
{itemid = 4691, prob = 6008, count = 1, notice = 2, broadcast = false, hundred = 6008, qiangdu = 1}, --誓言道衣(男)
{itemid = 4692, prob = 6009, count = 1, notice = 2, broadcast = false, hundred = 6009, qiangdu = 1}, --誓言道衣(女)
{itemid = 4693, prob = 6620, count = 1, notice = 2, broadcast = false, hundred = 6620, qiangdu = 1}, --誓言道盔
{itemid = 4694, prob = 6619, count = 1, notice = 2, broadcast = false, hundred = 6619, qiangdu = 1}, --誓言道链
{itemid = 4695, prob = 6618, count = 1, notice = 2, broadcast = false, hundred = 6618, qiangdu = 1}, --誓言道镯
{itemid = 4696, prob = 6617, count = 1, notice = 2, broadcast = false, hundred = 6617, qiangdu = 1}, --誓言道戒
{itemid = 4697, prob = 6616, count = 1, notice = 2, broadcast = false, hundred = 6616, qiangdu = 1}, --誓言道带
{itemid = 4698, prob = 6615, count = 1, notice = 2, broadcast = false, hundred = 6615, qiangdu = 1}, --誓言道靴

{itemid = 4681, prob = 6007, count = 1, notice = 2, broadcast = false, hundred = 6007, qiangdu = 1}, --誓言血饮
{itemid = 4682, prob = 6008, count = 1, notice = 2, broadcast = false, hundred = 6008, qiangdu = 1}, --誓言魔袍(男)
{itemid = 4683, prob = 6009, count = 1, notice = 2, broadcast = false, hundred = 6009, qiangdu = 1}, --誓言魔袍(女)
{itemid = 4684, prob = 6620, count = 1, notice = 2, broadcast = false, hundred = 6620, qiangdu = 1}, --誓言法盔
{itemid = 4685, prob = 6619, count = 1, notice = 2, broadcast = false, hundred = 6619, qiangdu = 1}, --誓言法链
{itemid = 4686, prob = 6618, count = 1, notice = 2, broadcast = false, hundred = 6618, qiangdu = 1}, --誓言法镯
{itemid = 4687, prob = 6617, count = 1, notice = 2, broadcast = false, hundred = 6617, qiangdu = 1}, --誓言法戒
{itemid = 4688, prob = 6616, count = 1, notice = 2, broadcast = false, hundred = 6616, qiangdu = 1}, --誓言法带
{itemid = 4689, prob = 6615, count = 1, notice = 2, broadcast = false, hundred = 6615, qiangdu = 1}, --誓言法靴

{itemid = 4672, prob = 6007, count = 1, notice = 2, broadcast = false, hundred = 6007, qiangdu = 1}, --誓言星王
{itemid = 4673, prob = 6008, count = 1, notice = 2, broadcast = false, hundred = 6008, qiangdu = 1}, --誓言战甲(男)
{itemid = 4674, prob = 6009, count = 1, notice = 2, broadcast = false, hundred = 6009, qiangdu = 1}, --誓言战甲(女)
{itemid = 4675, prob = 6620, count = 1, notice = 2, broadcast = false, hundred = 6620, qiangdu = 1}, --誓言战盔
{itemid = 4676, prob = 6619, count = 1, notice = 2, broadcast = false, hundred = 6619, qiangdu = 1}, --誓言战链
{itemid = 4677, prob = 6618, count = 1, notice = 2, broadcast = false, hundred = 6618, qiangdu = 1}, --誓言战镯
{itemid = 4678, prob = 6617, count = 1, notice = 2, broadcast = false, hundred = 6617, qiangdu = 1}, --誓言战戒
{itemid = 4679, prob = 6616, count = 1, notice = 2, broadcast = false, hundred = 6616, qiangdu = 1}, --誓言战带
{itemid = 4680, prob = 6615, count = 1, notice = 2, broadcast = false, hundred = 6615, qiangdu = 1}, --誓言战靴

{itemid = 4663, prob = 4043, count = 1, notice = 2, broadcast = false, hundred = 4043, qiangdu = 1}, --起源道剑
{itemid = 4664, prob = 4044, count = 1, notice = 2, broadcast = false, hundred = 4044, qiangdu = 1}, --起源道衣(男)
{itemid = 4665, prob = 4045, count = 1, notice = 2, broadcast = false, hundred = 4045, qiangdu = 1}, --起源道衣(女)
{itemid = 4666, prob = 4018, count = 1, notice = 2, broadcast = false, hundred = 4018, qiangdu = 1}, --起源道盔
{itemid = 4667, prob = 4017, count = 1, notice = 2, broadcast = false, hundred = 4017, qiangdu = 1}, --起源道链
{itemid = 4668, prob = 4016, count = 1, notice = 2, broadcast = false, hundred = 4016, qiangdu = 1}, --起源道镯
{itemid = 4669, prob = 4015, count = 1, notice = 2, broadcast = false, hundred = 4015, qiangdu = 1}, --起源道戒
{itemid = 4670, prob = 4013, count = 1, notice = 2, broadcast = false, hundred = 4013, qiangdu = 1}, --起源道带
{itemid = 4671, prob = 4012, count = 1, notice = 2, broadcast = false, hundred = 4012, qiangdu = 1}, --起源道靴

{itemid = 4654, prob = 4043, count = 1, notice = 2, broadcast = false, hundred = 4043, qiangdu = 1}, --起源法剑
{itemid = 4655, prob = 4044, count = 1, notice = 2, broadcast = false, hundred = 4044, qiangdu = 1}, --起源魔袍(男)
{itemid = 4656, prob = 4045, count = 1, notice = 2, broadcast = false, hundred = 4045, qiangdu = 1}, --起源魔袍(女)
{itemid = 4657, prob = 4018, count = 1, notice = 2, broadcast = false, hundred = 4018, qiangdu = 1}, --起源法盔
{itemid = 4658, prob = 4017, count = 1, notice = 2, broadcast = false, hundred = 4017, qiangdu = 1}, --起源法链
{itemid = 4659, prob = 4016, count = 1, notice = 2, broadcast = false, hundred = 4016, qiangdu = 1}, --起源法镯
{itemid = 4660, prob = 4015, count = 1, notice = 2, broadcast = false, hundred = 4015, qiangdu = 1}, --起源法戒
{itemid = 4661, prob = 4013, count = 1, notice = 2, broadcast = false, hundred = 4013, qiangdu = 1}, --起源法带
{itemid = 4662, prob = 4012, count = 1, notice = 2, broadcast = false, hundred = 4012, qiangdu = 1}, --起源法靴

{itemid = 4645, prob = 4043, count = 1, notice = 2, broadcast = false, hundred = 4043, qiangdu = 1}, --起源战刃
{itemid = 4646, prob = 4044, count = 1, notice = 2, broadcast = false, hundred = 4044, qiangdu = 1}, --起源战甲(男)
{itemid = 4647, prob = 4045, count = 1, notice = 2, broadcast = false, hundred = 4045, qiangdu = 1}, --起源战甲(女)
{itemid = 4648, prob = 4018, count = 1, notice = 2, broadcast = false, hundred = 4018, qiangdu = 1}, --起源战盔
{itemid = 4649, prob = 4017, count = 1, notice = 2, broadcast = false, hundred = 4017, qiangdu = 1}, --起源战链
{itemid = 4650, prob = 4016, count = 1, notice = 2, broadcast = false, hundred = 4016, qiangdu = 1}, --起源战镯
{itemid = 4651, prob = 4015, count = 1, notice = 2, broadcast = false, hundred = 4015, qiangdu = 1}, --起源战戒
{itemid = 4652, prob = 4013, count = 1, notice = 2, broadcast = false, hundred = 4013, qiangdu = 1}, --起源战带
{itemid = 4653, prob = 4012, count = 1, notice = 2, broadcast = false, hundred = 4012, qiangdu = 1}, --起源战靴

{itemid = 4618, prob = 1616, count = 1, notice = 2, broadcast = false, hundred = 1616, qiangdu = 1}, --上古开山
{itemid = 4619, prob = 1617, count = 1, notice = 2, broadcast = false, hundred = 1617, qiangdu = 1}, --上古重甲(男)
{itemid = 4620, prob = 1618, count = 1, notice = 2, broadcast = false, hundred = 1618, qiangdu = 1}, --上古重甲(女)
{itemid = 4621, prob = 1018, count = 1, notice = 2, broadcast = false, hundred = 1018, qiangdu = 1}, --上古战盔
{itemid = 4622, prob = 1017, count = 1, notice = 2, broadcast = false, hundred = 1017, qiangdu = 1}, --上古战链
{itemid = 4623, prob = 1016, count = 1, notice = 2, broadcast = false, hundred = 1016, qiangdu = 1}, --上古战镯
{itemid = 4624, prob = 1015, count = 1, notice = 2, broadcast = false, hundred = 1015, qiangdu = 1}, --上古战戒
{itemid = 4625, prob = 1013, count = 1, notice = 2, broadcast = false, hundred = 1013, qiangdu = 1}, --上古战带
{itemid = 4626, prob = 1012, count = 1, notice = 2, broadcast = false, hundred = 1012, qiangdu = 1}, --上古战靴

{itemid = 4636, prob = 1616, count = 1, notice = 2, broadcast = false, hundred = 1616, qiangdu = 1}, --上古霹雷
{itemid = 4637, prob = 1617, count = 1, notice = 2, broadcast = false, hundred = 1617, qiangdu = 1}, --上古道衣(男)
{itemid = 4638, prob = 1618, count = 1, notice = 2, broadcast = false, hundred = 1618, qiangdu = 1}, --上古道衣(女)
{itemid = 4639, prob = 1018, count = 1, notice = 2, broadcast = false, hundred = 1018, qiangdu = 1}, --上古道盔
{itemid = 4640, prob = 1017, count = 1, notice = 2, broadcast = false, hundred = 1017, qiangdu = 1}, --上古道链
{itemid = 4641, prob = 1016, count = 1, notice = 2, broadcast = false, hundred = 1016, qiangdu = 1}, --上古道镯
{itemid = 4642, prob = 1015, count = 1, notice = 2, broadcast = false, hundred = 1015, qiangdu = 1}, --上古道戒
{itemid = 4643, prob = 1013, count = 1, notice = 2, broadcast = false, hundred = 1013, qiangdu = 1}, --上古道带
{itemid = 4644, prob = 1012, count = 1, notice = 2, broadcast = false, hundred = 1012, qiangdu = 1}, --上古道靴

{itemid = 4627, prob = 1616, count = 1, notice = 2, broadcast = false, hundred = 1616, qiangdu = 1}, --上古拂尘
{itemid = 4628, prob = 1617, count = 1, notice = 2, broadcast = false, hundred = 1617, qiangdu = 1}, --上古魔袍(男)
{itemid = 4629, prob = 1618, count = 1, notice = 2, broadcast = false, hundred = 1618, qiangdu = 1}, --上古魔袍(女)
{itemid = 4630, prob = 1018, count = 1, notice = 2, broadcast = false, hundred = 1018, qiangdu = 1}, --上古法盔
{itemid = 4631, prob = 1017, count = 1, notice = 2, broadcast = false, hundred = 1017, qiangdu = 1}, --上古法链
{itemid = 4632, prob = 1016, count = 1, notice = 2, broadcast = false, hundred = 1016, qiangdu = 1}, --上古法镯
{itemid = 4633, prob = 1015, count = 1, notice = 2, broadcast = false, hundred = 1015, qiangdu = 1}, --上古法戒
{itemid = 4634, prob = 1013, count = 1, notice = 2, broadcast = false, hundred = 1013, qiangdu = 1}, --上古法带
{itemid = 4635, prob = 1012, count = 1, notice = 2, broadcast = false, hundred = 1012, qiangdu = 1}, --上古法靴

{itemid = 5125, prob = 108, count = 1, notice = 0, broadcast = false, hundred = 108, qiangdu = 0}, --初级BOSS挑战卷
{itemid = 5126, prob = 158, count = 1, notice = 2, broadcast = false, hundred = 158, qiangdu = 0}, --中级BOSS挑战卷
{itemid = 5127, prob = 258, count = 1, notice = 2, broadcast = false, hundred = 258, qiangdu = 0}, --高级BOSS挑战卷
{itemid = 6127, prob = 258, count = 1, notice = 2, broadcast = false, hundred = 258, qiangdu = 0}, --军魂BOSS召唤令

{itemid = 451, prob = 899, count = 1, notice = 2, broadcast = false, hundred = 899, qiangdu = 1}, --毁灭灵盔
{itemid = 452, prob = 898, count = 1, notice = 2, broadcast = false, hundred = 898, qiangdu = 1}, --毁灭灵链
{itemid = 453, prob = 897, count = 1, notice = 2, broadcast = false, hundred = 897, qiangdu = 1}, --毁灭灵镯
{itemid = 454, prob = 896, count = 1, notice = 2, broadcast = false, hundred = 896, qiangdu = 1}, --毁灭灵戒
{itemid = 455, prob = 895, count = 1, notice = 2, broadcast = false, hundred = 895, qiangdu = 1}, --毁灭灵带
{itemid = 456, prob = 893, count = 1, notice = 2, broadcast = false, hundred = 893, qiangdu = 1}, --毁灭灵靴
{itemid = 448, prob = 799, count = 1, notice = 2, broadcast = false, hundred = 799, qiangdu = 1}, --毁灭灵斩
{itemid = 449, prob = 798, count = 1, notice = 2, broadcast = false, hundred = 798, qiangdu = 1}, --毁灭灵甲(男)
{itemid = 450, prob = 797, count = 1, notice = 2, broadcast = false, hundred = 797, qiangdu = 1}, --毁灭灵甲(女)

{itemid = 442, prob = 688, count = 1, notice = 2, broadcast = false, hundred = 688, qiangdu = 1}, --通天神盔
{itemid = 443, prob = 689, count = 1, notice = 2, broadcast = false, hundred = 689, qiangdu = 1}, --通天神链
{itemid = 444, prob = 687, count = 1, notice = 2, broadcast = false, hundred = 687, qiangdu = 1}, --通天神镯
{itemid = 445, prob = 686, count = 1, notice = 2, broadcast = false, hundred = 686, qiangdu = 1}, --通天神戒
{itemid = 446, prob = 685, count = 1, notice = 2, broadcast = false, hundred = 685, qiangdu = 1}, --通天神带
{itemid = 447, prob = 683, count = 1, notice = 2, broadcast = false, hundred = 683, qiangdu = 1}, --通天神靴
{itemid = 439, prob = 477, count = 1, notice = 2, broadcast = false, hundred = 477, qiangdu = 1}, --通天神棍
{itemid = 440, prob = 475, count = 1, notice = 2, broadcast = false, hundred = 475, qiangdu = 1}, --通天神甲(男)
{itemid = 441, prob = 474, count = 1, notice = 2, broadcast = false, hundred = 474, qiangdu = 1}, --通天神甲(女)

{itemid = 433, prob = 520, count = 1, notice = 2, broadcast = false, hundred = 520, qiangdu = 1}, --霸主血盔
{itemid = 434, prob = 519, count = 1, notice = 2, broadcast = false, hundred = 519, qiangdu = 1}, --霸主血链
{itemid = 435, prob = 518, count = 1, notice = 2, broadcast = false, hundred = 518, qiangdu = 1}, --霸主血镯
{itemid = 436, prob = 516, count = 1, notice = 2, broadcast = false, hundred = 516, qiangdu = 1}, --霸主血戒
{itemid = 437, prob = 513, count = 1, notice = 2, broadcast = false, hundred = 513, qiangdu = 1}, --霸主血带
{itemid = 438, prob = 511, count = 1, notice = 2, broadcast = false, hundred = 511, qiangdu = 1}, --霸主血靴
{itemid = 430, prob = 253, count = 1, notice = 2, broadcast = false, hundred = 253, qiangdu = 1}, --霸主血剑
{itemid = 431, prob = 251, count = 1, notice = 2, broadcast = false, hundred = 251, qiangdu = 1}, --霸主血甲(男)
{itemid = 432, prob = 250, count = 1, notice = 2, broadcast = false, hundred = 250, qiangdu = 1}, --霸主血甲(女)
{itemid = 7197, prob = 99, count = 1, notice = 2, broadcast = false, hundred = 88, qiangdu = 0}, --玛法晶块
{itemid = 493, prob = 88, count = 1, notice = 2, broadcast = false, hundred = 88, qiangdu = 0}, --翅膀魂石·白虎
{itemid = 494, prob = 89, count = 1, notice = 2, broadcast = false, hundred = 89, qiangdu = 0}, --翅膀魂石·青龙
{itemid = 495, prob = 90, count = 1, notice = 2, broadcast = false, hundred = 90, qiangdu = 0}, --翅膀魂石·朱雀
{itemid = 6736, prob = 38, count = 1, notice = 2, broadcast = false, hundred = 58, qiangdu = 0}, --突破丹

-- {itemid = 421, prob = 45, count = 1, notice = 0, broadcast = false, hundred = 45, qiangdu = 1}, --十方刃
-- {itemid = 422, prob = 46, count = 1, notice = 0, broadcast = false, hundred = 46, qiangdu = 1}, --十方甲(男)
-- {itemid = 423, prob = 47, count = 1, notice = 0, broadcast = false, hundred = 47, qiangdu = 1}, --十方甲(女)
-- {itemid = 424, prob = 48, count = 1, notice = 0, broadcast = false, hundred = 48, qiangdu = 1}, --十方盔
-- {itemid = 425, prob = 49, count = 1, notice = 0, broadcast = false, hundred = 49, qiangdu = 1}, --十方链
-- {itemid = 426, prob = 50, count = 1, notice = 0, broadcast = false, hundred = 50, qiangdu = 1}, --十方镯
-- {itemid = 427, prob = 51, count = 1, notice = 0, broadcast = false, hundred = 51, qiangdu = 1}, --十方戒
-- {itemid = 428, prob = 52, count = 1, notice = 0, broadcast = false, hundred = 52, qiangdu = 1}, --十方带
-- {itemid = 429, prob = 53, count = 1, notice = 0, broadcast = false, hundred = 53, qiangdu = 1}, --十方靴
{itemid = 5651, prob = 38, count = 1, notice = 0, broadcast = false, hundred = 20, qiangdu = 0}, --来
{itemid = 5652, prob = 37, count = 1, notice = 0, broadcast = false, hundred = 17, qiangdu = 0}, --袭
{itemid = 5650, prob = 28, count = 1, notice = 0, broadcast = false, hundred = 15, qiangdu = 0}, --典
{itemid = 5649, prob = 26, count = 1, notice = 0, broadcast = false, hundred = 13, qiangdu = 0}, --庆
{itemid = 511, prob = 1, count = 1, notice = 0, broadcast = false, hundred = 1, qiangdu = 0}, --经验

					},
				},
                               {
					count = 250,	--寻宝次数大于此值才会进入
					maxcount = 9999,	--寻宝次数等于此值必定进入
					limit = 1,		--限制进入次数,-1为不限制
					prob = 5,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 5656, prob = 50, count = 1, notice = true, hundred = 26},  --服
						{itemid = 5655, prob = 58, count = 1, notice = true, hundred = 10},  --全
						{itemid = 5654, prob = 5 , count = 1, notice = true, hundred = 3 },  --爆
						{itemid = 5653, prob = 4 , count = 1, notice = true, hundred = 1 },  --嗨
					},
				},
				{
					money = 30000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
{itemid = 7078, prob = 30, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --雷神锤
{itemid = 7079, prob = 20, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --雷神甲
{itemid = 7080, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --雷神盔
{itemid = 7081, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --雷神项链
{itemid = 7082, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --雷神手镯
{itemid = 7083, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --雷神戒指
{itemid = 7084, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --雷神腰带
{itemid = 7085, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --雷神靴子


					},
				},
				{
					money = 7500,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
{itemid = 7052, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --凡·南明离火

					},
				},

				{
					money = 30000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
{itemid = 7057, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --魔躯
{itemid = 7058, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --血瞳
{itemid = 7059, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --鬼爪
{itemid = 7060, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --圣角

					},
				},
{
					money = 50000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
{itemid = 6888, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --蓝凤凰
{itemid = 6892, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1398, qiangdu = 0}, --深海鱼王
{itemid = 6896, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1397, qiangdu = 0}, --远古苍龙
{itemid = 6900, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1396, qiangdu = 0}, --灵狐武者
{itemid = 6941, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1396, qiangdu = 0}, --远古麒麟
					},
				},
				{
					money = 40000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
{itemid = 6888, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --蓝凤凰
{itemid = 6892, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1398, qiangdu = 0}, --深海鱼王
{itemid = 6896, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1397, qiangdu = 0}, --远古苍龙
{itemid = 6900, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1396, qiangdu = 0}, --灵狐武者
{itemid = 6941, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1396, qiangdu = 0}, --远古麒麟

					},
				},
				{
					money = 50000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
{itemid = 108, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 12853, qiangdu = 1}, --冲天道盔
{itemid = 109, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 12854, qiangdu = 1}, --冲天道链
{itemid = 110, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 12855, qiangdu = 1}, --冲天道腕
{itemid = 111, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 12856, qiangdu = 1}, --冲天道戒
{itemid = 112, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 12857, qiangdu = 1}, --冲天道带
{itemid = 113, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 12858, qiangdu = 1}, --冲天道靴
					},
				},
{
					money = 180000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 2,

					--道具列表
					items = 
					{
						--id,概率,数量,广播

{itemid = 135, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50311, qiangdu = 1}, --菩提道仙盔
{itemid = 136, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50312, qiangdu = 1}, --菩提道仙链
{itemid = 137, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50313, qiangdu = 1}, --菩提道仙腕
{itemid = 138, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50314, qiangdu = 1}, --菩提道仙戒
{itemid = 139, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50315, qiangdu = 1}, --菩提道仙带
{itemid = 140, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50316, qiangdu = 1}, --菩提道仙靴
					},
				},

{
					money = 360000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 2,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
{itemid = 162, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50311, qiangdu = 1}, --无尘道幻盔    
{itemid = 163, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50312, qiangdu = 1}, --无尘道幻链    
{itemid = 164, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50313, qiangdu = 1}, --无尘道幻腕    
{itemid = 165, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50314, qiangdu = 1}, --无尘道幻戒    
{itemid = 166, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50315, qiangdu = 1}, --无尘道幻带    
{itemid = 167, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50316, qiangdu = 1}, --无尘道幻靴   
					},
				},

				{
					money = 100000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 300,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
{itemid = 6362, prob = 300, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --至尊屠龙刀 
{itemid = 6945, prob = 300, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --至尊屠龙甲   
{itemid = 6946, prob = 300, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --至尊屠龙甲   
					},
				},

{
					money = 80000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 200,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
{itemid = 6947, prob = 200, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --至尊屠龙盔  
{itemid = 6948, prob = 200, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --至尊屠龙项链   
{itemid = 6949, prob = 200, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --至尊屠龙戒 
{itemid = 6950, prob = 200, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --至尊屠龙手镯 
{itemid = 6951, prob = 200, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --至尊屠龙腰带 
{itemid = 6952, prob = 200, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --至尊屠龙靴子 
					},
				},

			},
		},
	},

	--合区表格
	{
		openday = 9999,
		items = 
		{
			--战士
			{

				{
					money = 0,	--寻宝花费数大于此值才会进入此表
					limit = -1,		--限制进入次数,-1为不限制
					prob = 1,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
--{itemid = 6362, prob = 198888, count = 1, notice = 2, broadcast = true, hundred = 50998, qiangdu = 1}, --屠龙刀
{itemid = 168, prob = 58888, count = 1, notice = 2, broadcast = true, hundred = 51004, qiangdu = 1}, --芙蓉金龙斩      
{itemid = 169, prob = 58888, count = 1, notice = 2, broadcast = true, hundred = 51005, qiangdu = 1}, --芙蓉金龙甲(男)
{itemid = 170, prob = 58888, count = 1, notice = 2, broadcast = true, hundred = 51006, qiangdu = 1}, --芙蓉金龙甲(女)
{itemid = 171, prob = 45888, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --芙蓉金龙盔    
{itemid = 172, prob = 45888, count = 1, notice = 2, broadcast = true, hundred = 50300, qiangdu = 1}, --芙蓉金龙链    
{itemid = 173, prob = 45888, count = 1, notice = 2, broadcast = true, hundred = 50301, qiangdu = 1}, --芙蓉金龙腕    
{itemid = 174, prob = 45888, count = 1, notice = 2, broadcast = true, hundred = 50302, qiangdu = 1}, --芙蓉金龙戒    
{itemid = 175, prob = 45888, count = 1, notice = 2, broadcast = true, hundred = 50303, qiangdu = 1}, --芙蓉金龙带    
{itemid = 176, prob = 45888, count = 1, notice = 2, broadcast = true, hundred = 50304, qiangdu = 1}, --芙蓉金龙靴  

{itemid = 141, prob = 25888, count = 1, notice = 2, broadcast = true, hundred = 51004, qiangdu = 1}, --无尘怒斩      
{itemid = 142, prob = 25998, count = 1, notice = 2, broadcast = true, hundred = 51005, qiangdu = 1}, --无尘战幻甲(男)
{itemid = 143, prob = 25000, count = 1, notice = 2, broadcast = true, hundred = 51006, qiangdu = 1}, --无尘战幻甲(女)
   

{itemid = 114, prob = 18996, count = 1, notice = 2, broadcast = true, hundred = 51004, qiangdu = 1}, --菩提彻地斩
{itemid = 115, prob = 18998, count = 1, notice = 2, broadcast = true, hundred = 51005, qiangdu = 1}, --菩提战狂甲(男)
{itemid = 116, prob = 18000, count = 1, notice = 2, broadcast = true, hundred = 51006, qiangdu = 1}, --菩提战狂甲(女)
-- {itemid = 117, prob = 13798, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --菩提战狂盔
-- {itemid = 118, prob = 13800, count = 1, notice = 2, broadcast = true, hundred = 50300, qiangdu = 1}, --菩提战狂链
-- {itemid = 119, prob = 13802, count = 1, notice = 2, broadcast = true, hundred = 50301, qiangdu = 1}, --菩提战狂腕
-- {itemid = 120, prob = 13804, count = 1, notice = 2, broadcast = true, hundred = 50302, qiangdu = 1}, --菩提战狂戒
-- {itemid = 121, prob = 13806, count = 1, notice = 2, broadcast = true, hundred = 50303, qiangdu = 1}, --菩提战狂带
-- {itemid = 122, prob = 13808, count = 1, notice = 2, broadcast = true, hundred = 50304, qiangdu = 1}, --菩提战狂靴

{itemid = 87, prob = 13043, count = 1, notice = 2, broadcast = true, hundred = 12043, qiangdu = 1}, --冲天战刀
{itemid = 88, prob = 13044, count = 1, notice = 2, broadcast = true, hundred = 12044, qiangdu = 1}, --冲天战甲(男)
{itemid = 89, prob = 13045, count = 1, notice = 2, broadcast = true, hundred = 12045, qiangdu = 1}, --冲天战甲(女)
-- {itemid = 90, prob = 13853, count = 1, notice = 2, broadcast = true, hundred = 12853, qiangdu = 1}, --冲天战盔
-- {itemid = 91, prob = 13854, count = 1, notice = 2, broadcast = true, hundred = 12854, qiangdu = 1}, --冲天战链
-- {itemid = 92, prob = 13855, count = 1, notice = 2, broadcast = true, hundred = 12855, qiangdu = 1}, --冲天战腕
-- {itemid = 93, prob = 13856, count = 1, notice = 2, broadcast = true, hundred = 12856, qiangdu = 1}, --冲天战戒
-- {itemid = 94, prob = 13857, count = 1, notice = 2, broadcast = true, hundred = 12857, qiangdu = 1}, --冲天战带
-- {itemid = 95, prob = 13858, count = 1, notice = 2, broadcast = true, hundred = 12858, qiangdu = 1}, --冲天战靴


{itemid = 4690, prob = 6007, count = 1, notice = 2, broadcast = false, hundred = 6007, qiangdu = 1}, --誓言天玑
{itemid = 4691, prob = 6008, count = 1, notice = 2, broadcast = false, hundred = 6008, qiangdu = 1}, --誓言道衣(男)
{itemid = 4692, prob = 6009, count = 1, notice = 2, broadcast = false, hundred = 6009, qiangdu = 1}, --誓言道衣(女)
{itemid = 4693, prob = 6620, count = 1, notice = 2, broadcast = false, hundred = 6620, qiangdu = 1}, --誓言道盔
{itemid = 4694, prob = 6619, count = 1, notice = 2, broadcast = false, hundred = 6619, qiangdu = 1}, --誓言道链
{itemid = 4695, prob = 6618, count = 1, notice = 2, broadcast = false, hundred = 6618, qiangdu = 1}, --誓言道镯
{itemid = 4696, prob = 6617, count = 1, notice = 2, broadcast = false, hundred = 6617, qiangdu = 1}, --誓言道戒
{itemid = 4697, prob = 6616, count = 1, notice = 2, broadcast = false, hundred = 6616, qiangdu = 1}, --誓言道带
{itemid = 4698, prob = 6615, count = 1, notice = 2, broadcast = false, hundred = 6615, qiangdu = 1}, --誓言道靴

{itemid = 4681, prob = 6007, count = 1, notice = 2, broadcast = false, hundred = 6007, qiangdu = 1}, --誓言血饮
{itemid = 4682, prob = 6008, count = 1, notice = 2, broadcast = false, hundred = 6008, qiangdu = 1}, --誓言魔袍(男)
{itemid = 4683, prob = 6009, count = 1, notice = 2, broadcast = false, hundred = 6009, qiangdu = 1}, --誓言魔袍(女)
{itemid = 4684, prob = 6620, count = 1, notice = 2, broadcast = false, hundred = 6620, qiangdu = 1}, --誓言法盔
{itemid = 4685, prob = 6619, count = 1, notice = 2, broadcast = false, hundred = 6619, qiangdu = 1}, --誓言法链
{itemid = 4686, prob = 6618, count = 1, notice = 2, broadcast = false, hundred = 6618, qiangdu = 1}, --誓言法镯
{itemid = 4687, prob = 6617, count = 1, notice = 2, broadcast = false, hundred = 6617, qiangdu = 1}, --誓言法戒
{itemid = 4688, prob = 6616, count = 1, notice = 2, broadcast = false, hundred = 6616, qiangdu = 1}, --誓言法带
{itemid = 4689, prob = 6615, count = 1, notice = 2, broadcast = false, hundred = 6615, qiangdu = 1}, --誓言法靴

{itemid = 4672, prob = 6007, count = 1, notice = 2, broadcast = false, hundred = 6007, qiangdu = 1}, --誓言星王
{itemid = 4673, prob = 6008, count = 1, notice = 2, broadcast = false, hundred = 6008, qiangdu = 1}, --誓言战甲(男)
{itemid = 4674, prob = 6009, count = 1, notice = 2, broadcast = false, hundred = 6009, qiangdu = 1}, --誓言战甲(女)
{itemid = 4675, prob = 6620, count = 1, notice = 2, broadcast = false, hundred = 6620, qiangdu = 1}, --誓言战盔
{itemid = 4676, prob = 6619, count = 1, notice = 2, broadcast = false, hundred = 6619, qiangdu = 1}, --誓言战链
{itemid = 4677, prob = 6618, count = 1, notice = 2, broadcast = false, hundred = 6618, qiangdu = 1}, --誓言战镯
{itemid = 4678, prob = 6617, count = 1, notice = 2, broadcast = false, hundred = 6617, qiangdu = 1}, --誓言战戒
{itemid = 4679, prob = 6616, count = 1, notice = 2, broadcast = false, hundred = 6616, qiangdu = 1}, --誓言战带
{itemid = 4680, prob = 6615, count = 1, notice = 2, broadcast = false, hundred = 6615, qiangdu = 1}, --誓言战靴

{itemid = 4663, prob = 4043, count = 1, notice = 2, broadcast = false, hundred = 4043, qiangdu = 1}, --起源道剑
{itemid = 4664, prob = 4044, count = 1, notice = 2, broadcast = false, hundred = 4044, qiangdu = 1}, --起源道衣(男)
{itemid = 4665, prob = 4045, count = 1, notice = 2, broadcast = false, hundred = 4045, qiangdu = 1}, --起源道衣(女)
{itemid = 4666, prob = 4018, count = 1, notice = 2, broadcast = false, hundred = 4018, qiangdu = 1}, --起源道盔
{itemid = 4667, prob = 4017, count = 1, notice = 2, broadcast = false, hundred = 4017, qiangdu = 1}, --起源道链
{itemid = 4668, prob = 4016, count = 1, notice = 2, broadcast = false, hundred = 4016, qiangdu = 1}, --起源道镯
{itemid = 4669, prob = 4015, count = 1, notice = 2, broadcast = false, hundred = 4015, qiangdu = 1}, --起源道戒
{itemid = 4670, prob = 4013, count = 1, notice = 2, broadcast = false, hundred = 4013, qiangdu = 1}, --起源道带
{itemid = 4671, prob = 4012, count = 1, notice = 2, broadcast = false, hundred = 4012, qiangdu = 1}, --起源道靴

{itemid = 4654, prob = 4043, count = 1, notice = 2, broadcast = false, hundred = 4043, qiangdu = 1}, --起源法剑
{itemid = 4655, prob = 4044, count = 1, notice = 2, broadcast = false, hundred = 4044, qiangdu = 1}, --起源魔袍(男)
{itemid = 4656, prob = 4045, count = 1, notice = 2, broadcast = false, hundred = 4045, qiangdu = 1}, --起源魔袍(女)
{itemid = 4657, prob = 4018, count = 1, notice = 2, broadcast = false, hundred = 4018, qiangdu = 1}, --起源法盔
{itemid = 4658, prob = 4017, count = 1, notice = 2, broadcast = false, hundred = 4017, qiangdu = 1}, --起源法链
{itemid = 4659, prob = 4016, count = 1, notice = 2, broadcast = false, hundred = 4016, qiangdu = 1}, --起源法镯
{itemid = 4660, prob = 4015, count = 1, notice = 2, broadcast = false, hundred = 4015, qiangdu = 1}, --起源法戒
{itemid = 4661, prob = 4013, count = 1, notice = 2, broadcast = false, hundred = 4013, qiangdu = 1}, --起源法带
{itemid = 4662, prob = 4012, count = 1, notice = 2, broadcast = false, hundred = 4012, qiangdu = 1}, --起源法靴

{itemid = 4645, prob = 4043, count = 1, notice = 2, broadcast = false, hundred = 4043, qiangdu = 1}, --起源战刃
{itemid = 4646, prob = 4044, count = 1, notice = 2, broadcast = false, hundred = 4044, qiangdu = 1}, --起源战甲(男)
{itemid = 4647, prob = 4045, count = 1, notice = 2, broadcast = false, hundred = 4045, qiangdu = 1}, --起源战甲(女)
{itemid = 4648, prob = 4018, count = 1, notice = 2, broadcast = false, hundred = 4018, qiangdu = 1}, --起源战盔
{itemid = 4649, prob = 4017, count = 1, notice = 2, broadcast = false, hundred = 4017, qiangdu = 1}, --起源战链
{itemid = 4650, prob = 4016, count = 1, notice = 2, broadcast = false, hundred = 4016, qiangdu = 1}, --起源战镯
{itemid = 4651, prob = 4015, count = 1, notice = 2, broadcast = false, hundred = 4015, qiangdu = 1}, --起源战戒
{itemid = 4652, prob = 4013, count = 1, notice = 2, broadcast = false, hundred = 4013, qiangdu = 1}, --起源战带
{itemid = 4653, prob = 4012, count = 1, notice = 2, broadcast = false, hundred = 4012, qiangdu = 1}, --起源战靴

{itemid = 4618, prob = 1616, count = 1, notice = 2, broadcast = false, hundred = 1616, qiangdu = 1}, --上古开山
{itemid = 4619, prob = 1617, count = 1, notice = 2, broadcast = false, hundred = 1617, qiangdu = 1}, --上古重甲(男)
{itemid = 4620, prob = 1618, count = 1, notice = 2, broadcast = false, hundred = 1618, qiangdu = 1}, --上古重甲(女)
{itemid = 4621, prob = 1018, count = 1, notice = 2, broadcast = false, hundred = 1018, qiangdu = 1}, --上古战盔
{itemid = 4622, prob = 1017, count = 1, notice = 2, broadcast = false, hundred = 1017, qiangdu = 1}, --上古战链
{itemid = 4623, prob = 1016, count = 1, notice = 2, broadcast = false, hundred = 1016, qiangdu = 1}, --上古战镯
{itemid = 4624, prob = 1015, count = 1, notice = 2, broadcast = false, hundred = 1015, qiangdu = 1}, --上古战戒
{itemid = 4625, prob = 1013, count = 1, notice = 2, broadcast = false, hundred = 1013, qiangdu = 1}, --上古战带
{itemid = 4626, prob = 1012, count = 1, notice = 2, broadcast = false, hundred = 1012, qiangdu = 1}, --上古战靴

{itemid = 4636, prob = 1616, count = 1, notice = 2, broadcast = false, hundred = 1616, qiangdu = 1}, --上古霹雷
{itemid = 4637, prob = 1617, count = 1, notice = 2, broadcast = false, hundred = 1617, qiangdu = 1}, --上古道衣(男)
{itemid = 4638, prob = 1618, count = 1, notice = 2, broadcast = false, hundred = 1618, qiangdu = 1}, --上古道衣(女)
{itemid = 4639, prob = 1018, count = 1, notice = 2, broadcast = false, hundred = 1018, qiangdu = 1}, --上古道盔
{itemid = 4640, prob = 1017, count = 1, notice = 2, broadcast = false, hundred = 1017, qiangdu = 1}, --上古道链
{itemid = 4641, prob = 1016, count = 1, notice = 2, broadcast = false, hundred = 1016, qiangdu = 1}, --上古道镯
{itemid = 4642, prob = 1015, count = 1, notice = 2, broadcast = false, hundred = 1015, qiangdu = 1}, --上古道戒
{itemid = 4643, prob = 1013, count = 1, notice = 2, broadcast = false, hundred = 1013, qiangdu = 1}, --上古道带
{itemid = 4644, prob = 1012, count = 1, notice = 2, broadcast = false, hundred = 1012, qiangdu = 1}, --上古道靴

{itemid = 4627, prob = 1616, count = 1, notice = 2, broadcast = false, hundred = 1616, qiangdu = 1}, --上古拂尘
{itemid = 4628, prob = 1617, count = 1, notice = 2, broadcast = false, hundred = 1617, qiangdu = 1}, --上古魔袍(男)
{itemid = 4629, prob = 1618, count = 1, notice = 2, broadcast = false, hundred = 1618, qiangdu = 1}, --上古魔袍(女)
{itemid = 4630, prob = 1018, count = 1, notice = 2, broadcast = false, hundred = 1018, qiangdu = 1}, --上古法盔
{itemid = 4631, prob = 1017, count = 1, notice = 2, broadcast = false, hundred = 1017, qiangdu = 1}, --上古法链
{itemid = 4632, prob = 1016, count = 1, notice = 2, broadcast = false, hundred = 1016, qiangdu = 1}, --上古法镯
{itemid = 4633, prob = 1015, count = 1, notice = 2, broadcast = false, hundred = 1015, qiangdu = 1}, --上古法戒
{itemid = 4634, prob = 1013, count = 1, notice = 2, broadcast = false, hundred = 1013, qiangdu = 1}, --上古法带
{itemid = 4635, prob = 1012, count = 1, notice = 2, broadcast = false, hundred = 1012, qiangdu = 1}, --上古法靴

{itemid = 5125, prob = 108, count = 1, notice = 0, broadcast = false, hundred = 108, qiangdu = 0}, --初级BOSS挑战卷
{itemid = 5126, prob = 158, count = 1, notice = 2, broadcast = false, hundred = 158, qiangdu = 0}, --中级BOSS挑战卷
{itemid = 5127, prob = 258, count = 1, notice = 2, broadcast = false, hundred = 258, qiangdu = 0}, --高级BOSS挑战卷
{itemid = 6127, prob = 258, count = 1, notice = 2, broadcast = false, hundred = 258, qiangdu = 0}, --军魂BOSS召唤令

{itemid = 451, prob = 899, count = 1, notice = 2, broadcast = false, hundred = 899, qiangdu = 1}, --毁灭灵盔
{itemid = 452, prob = 898, count = 1, notice = 2, broadcast = false, hundred = 898, qiangdu = 1}, --毁灭灵链
{itemid = 453, prob = 897, count = 1, notice = 2, broadcast = false, hundred = 897, qiangdu = 1}, --毁灭灵镯
{itemid = 454, prob = 896, count = 1, notice = 2, broadcast = false, hundred = 896, qiangdu = 1}, --毁灭灵戒
{itemid = 455, prob = 895, count = 1, notice = 2, broadcast = false, hundred = 895, qiangdu = 1}, --毁灭灵带
{itemid = 456, prob = 893, count = 1, notice = 2, broadcast = false, hundred = 893, qiangdu = 1}, --毁灭灵靴
{itemid = 448, prob = 799, count = 1, notice = 2, broadcast = false, hundred = 799, qiangdu = 1}, --毁灭灵斩
{itemid = 449, prob = 798, count = 1, notice = 2, broadcast = false, hundred = 798, qiangdu = 1}, --毁灭灵甲(男)
{itemid = 450, prob = 797, count = 1, notice = 2, broadcast = false, hundred = 797, qiangdu = 1}, --毁灭灵甲(女)

{itemid = 442, prob = 688, count = 1, notice = 2, broadcast = false, hundred = 688, qiangdu = 1}, --通天神盔
{itemid = 443, prob = 689, count = 1, notice = 2, broadcast = false, hundred = 689, qiangdu = 1}, --通天神链
{itemid = 444, prob = 687, count = 1, notice = 2, broadcast = false, hundred = 687, qiangdu = 1}, --通天神镯
{itemid = 445, prob = 686, count = 1, notice = 2, broadcast = false, hundred = 686, qiangdu = 1}, --通天神戒
{itemid = 446, prob = 685, count = 1, notice = 2, broadcast = false, hundred = 685, qiangdu = 1}, --通天神带
{itemid = 447, prob = 683, count = 1, notice = 2, broadcast = false, hundred = 683, qiangdu = 1}, --通天神靴
{itemid = 439, prob = 477, count = 1, notice = 2, broadcast = false, hundred = 477, qiangdu = 1}, --通天神棍
{itemid = 440, prob = 475, count = 1, notice = 2, broadcast = false, hundred = 475, qiangdu = 1}, --通天神甲(男)
{itemid = 441, prob = 474, count = 1, notice = 2, broadcast = false, hundred = 474, qiangdu = 1}, --通天神甲(女)

{itemid = 433, prob = 520, count = 1, notice = 2, broadcast = false, hundred = 520, qiangdu = 1}, --霸主血盔
{itemid = 434, prob = 519, count = 1, notice = 2, broadcast = false, hundred = 519, qiangdu = 1}, --霸主血链
{itemid = 435, prob = 518, count = 1, notice = 2, broadcast = false, hundred = 518, qiangdu = 1}, --霸主血镯
{itemid = 436, prob = 516, count = 1, notice = 2, broadcast = false, hundred = 516, qiangdu = 1}, --霸主血戒
{itemid = 437, prob = 513, count = 1, notice = 2, broadcast = false, hundred = 513, qiangdu = 1}, --霸主血带
{itemid = 438, prob = 511, count = 1, notice = 2, broadcast = false, hundred = 511, qiangdu = 1}, --霸主血靴
{itemid = 430, prob = 253, count = 1, notice = 2, broadcast = false, hundred = 253, qiangdu = 1}, --霸主血剑
{itemid = 431, prob = 251, count = 1, notice = 2, broadcast = false, hundred = 251, qiangdu = 1}, --霸主血甲(男)
{itemid = 432, prob = 250, count = 1, notice = 2, broadcast = false, hundred = 250, qiangdu = 1}, --霸主血甲(女)
{itemid = 7197, prob = 99, count = 1, notice = 2, broadcast = false, hundred = 88, qiangdu = 0}, --玛法晶块
{itemid = 493, prob = 88, count = 1, notice = 2, broadcast = false, hundred = 88, qiangdu = 0}, --翅膀魂石·白虎
{itemid = 494, prob = 89, count = 1, notice = 2, broadcast = false, hundred = 89, qiangdu = 0}, --翅膀魂石·青龙
{itemid = 495, prob = 90, count = 1, notice = 2, broadcast = false, hundred = 90, qiangdu = 0}, --翅膀魂石·朱雀
{itemid = 6736, prob = 38, count = 1, notice = 2, broadcast = false, hundred = 58, qiangdu = 0}, --突破丹

-- {itemid = 421, prob = 45, count = 1, notice = 0, broadcast = false, hundred = 45, qiangdu = 1}, --十方刃
-- {itemid = 422, prob = 46, count = 1, notice = 0, broadcast = false, hundred = 46, qiangdu = 1}, --十方甲(男)
-- {itemid = 423, prob = 47, count = 1, notice = 0, broadcast = false, hundred = 47, qiangdu = 1}, --十方甲(女)
-- {itemid = 424, prob = 48, count = 1, notice = 0, broadcast = false, hundred = 48, qiangdu = 1}, --十方盔
-- {itemid = 425, prob = 49, count = 1, notice = 0, broadcast = false, hundred = 49, qiangdu = 1}, --十方链
-- {itemid = 426, prob = 50, count = 1, notice = 0, broadcast = false, hundred = 50, qiangdu = 1}, --十方镯
-- {itemid = 427, prob = 51, count = 1, notice = 0, broadcast = false, hundred = 51, qiangdu = 1}, --十方戒
-- {itemid = 428, prob = 52, count = 1, notice = 0, broadcast = false, hundred = 52, qiangdu = 1}, --十方带
-- {itemid = 429, prob = 53, count = 1, notice = 0, broadcast = false, hundred = 53, qiangdu = 1}, --十方靴
{itemid = 5651, prob = 38, count = 1, notice = 0, broadcast = false, hundred = 20, qiangdu = 0}, --来
{itemid = 5652, prob = 37, count = 1, notice = 0, broadcast = false, hundred = 17, qiangdu = 0}, --袭
{itemid = 5650, prob = 28, count = 1, notice = 0, broadcast = false, hundred = 15, qiangdu = 0}, --典
{itemid = 5649, prob = 26, count = 1, notice = 0, broadcast = false, hundred = 13, qiangdu = 0}, --庆
{itemid = 511, prob = 1, count = 1, notice = 0, broadcast = false, hundred = 1, qiangdu = 0}, --经验

					},
				},
                               {
					count = 250,	--寻宝次数大于此值才会进入
					maxcount = 9999,	--寻宝次数等于此值必定进入
					limit = 1,		--限制进入次数,-1为不限制
					prob = 5,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 5656, prob = 50, count = 1, notice = true, hundred = 26},  --服
						{itemid = 5655, prob = 58, count = 1, notice = true, hundred = 10},  --全
						{itemid = 5654, prob = 5 , count = 1, notice = true, hundred = 3 },  --爆
						{itemid = 5653, prob = 4 , count = 1, notice = true, hundred = 1 },  --嗨
					},
				},
				{
					money = 30000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
{itemid = 7078, prob = 30, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --雷神锤
{itemid = 7079, prob = 20, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --雷神甲
{itemid = 7080, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --雷神盔
{itemid = 7081, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --雷神项链
{itemid = 7082, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --雷神手镯
{itemid = 7083, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --雷神戒指
{itemid = 7084, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --雷神腰带
{itemid = 7085, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --雷神靴子


					},
				},
				{
					money = 7500,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
{itemid = 7052, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --凡·南明离火

					},
				},

				{
					money = 30000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
{itemid = 7057, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --魔躯
{itemid = 7058, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --血瞳
{itemid = 7059, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --鬼爪
{itemid = 7060, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --圣角

					},
				},
{
					money = 50000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
{itemid = 6888, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --蓝凤凰
{itemid = 6892, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1398, qiangdu = 0}, --深海鱼王
{itemid = 6896, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1397, qiangdu = 0}, --远古苍龙
{itemid = 6900, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1396, qiangdu = 0}, --灵狐武者
{itemid = 6941, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1396, qiangdu = 0}, --远古麒麟
					},
				},
				{
					money = 40000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
{itemid = 6888, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --蓝凤凰
{itemid = 6892, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1398, qiangdu = 0}, --深海鱼王
{itemid = 6896, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1397, qiangdu = 0}, --远古苍龙
{itemid = 6900, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1396, qiangdu = 0}, --灵狐武者
{itemid = 6941, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1396, qiangdu = 0}, --远古麒麟

					},
				},
				{
					money = 50000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
{itemid = 90, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 12853, qiangdu = 1}, --冲天战盔
{itemid = 91, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 12854, qiangdu = 1}, --冲天战链
{itemid = 92, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 12855, qiangdu = 1}, --冲天战腕
{itemid = 93, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 12856, qiangdu = 1}, --冲天战戒
{itemid = 94, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 12857, qiangdu = 1}, --冲天战带
{itemid = 95, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 12858, qiangdu = 1}, --冲天战靴
					},
				},

{
					money = 180000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 2,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
{itemid = 117, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --菩提战狂盔
{itemid = 118, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50300, qiangdu = 1}, --菩提战狂链
{itemid = 119, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50301, qiangdu = 1}, --菩提战狂腕
{itemid = 120, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50302, qiangdu = 1}, --菩提战狂戒
{itemid = 121, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50303, qiangdu = 1}, --菩提战狂带
{itemid = 122, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50304, qiangdu = 1}, --菩提战狂靴
					},
				},

{
					money = 360000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 2,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
{itemid = 144, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --无尘战幻盔    
{itemid = 145, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50300, qiangdu = 1}, --无尘战幻链    
{itemid = 146, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50301, qiangdu = 1}, --无尘战幻腕    
{itemid = 147, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50302, qiangdu = 1}, --无尘战幻戒    
{itemid = 148, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50303, qiangdu = 1}, --无尘战幻带    
{itemid = 149, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50304, qiangdu = 1}, --无尘战幻靴   
					},
				},
							{
					money = 100000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 300,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
{itemid = 6362, prob = 300, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --至尊屠龙刀 
{itemid = 6945, prob = 300, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --至尊屠龙甲   
{itemid = 6946, prob = 300, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --至尊屠龙甲   
					},
				},

{
					money = 80000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 200,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
{itemid = 6947, prob = 200, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --至尊屠龙盔  
{itemid = 6948, prob = 200, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --至尊屠龙项链   
{itemid = 6949, prob = 200, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --至尊屠龙戒 
{itemid = 6950, prob = 200, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --至尊屠龙手镯 
{itemid = 6951, prob = 200, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --至尊屠龙腰带 
{itemid = 6952, prob = 200, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --至尊屠龙靴子 
					},
				},

			},
			--法师
			{

				{
					money = 0,	--寻宝花费数大于此值才会进入此表
					limit = -1,		--限制进入次数,-1为不限制
					prob = 1,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
--{itemid = 6362, prob = 198888, count = 1, notice = 2, broadcast = true, hundred = 50998, qiangdu = 1}, --屠龙刀					
{itemid = 177, prob = 58888, count = 1, notice = 2, broadcast = true, hundred = 51004, qiangdu = 1}, --芙蓉噬魂杖      
{itemid = 178, prob = 58888, count = 1, notice = 2, broadcast = true, hundred = 51005, qiangdu = 1}, --芙蓉法影袍(男)
{itemid = 179, prob = 58888, count = 1, notice = 2, broadcast = true, hundred = 51006, qiangdu = 1}, --芙蓉法影袍(女)
{itemid = 180, prob = 45888, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --芙蓉法虹盔   
{itemid = 181, prob = 45888, count = 1, notice = 2, broadcast = true, hundred = 50300, qiangdu = 1}, --芙蓉法虹链   
{itemid = 182, prob = 45888, count = 1, notice = 2, broadcast = true, hundred = 50301, qiangdu = 1}, --芙蓉法虹腕    
{itemid = 183, prob = 45888, count = 1, notice = 2, broadcast = true, hundred = 50302, qiangdu = 1}, --芙蓉法虹戒    
{itemid = 184, prob = 45888, count = 1, notice = 2, broadcast = true, hundred = 50303, qiangdu = 1}, --芙蓉法虹带  
{itemid = 185, prob = 45888, count = 1, notice = 2, broadcast = true, hundred = 50304, qiangdu = 1}, --芙蓉法虹靴 

{itemid = 150, prob = 25888, count = 1, notice = 2, broadcast = true, hundred = 51004, qiangdu = 1}, --无尘禅杖      
{itemid = 151, prob = 25998, count = 1, notice = 2, broadcast = true, hundred = 51005, qiangdu = 1}, --无尘法幻袍(男)
{itemid = 152, prob = 25000, count = 1, notice = 2, broadcast = true, hundred = 51006, qiangdu = 1}, --无尘法幻袍(女)
  

{itemid = 123, prob = 18996, count = 1, notice = 2, broadcast = true, hundred = 51001, qiangdu = 1}, --菩提骷髅杖
{itemid = 124, prob = 18998, count = 1, notice = 2, broadcast = true, hundred = 51002, qiangdu = 1}, --菩提法痴袍(男)
{itemid = 125, prob = 18000, count = 1, notice = 2, broadcast = true, hundred = 51003, qiangdu = 1}, --菩提法痴袍(女)
-- {itemid = 126, prob = 13798, count = 1, notice = 2, broadcast = true, hundred = 50305, qiangdu = 1}, --菩提法痴盔
-- {itemid = 127, prob = 13800, count = 1, notice = 2, broadcast = true, hundred = 50306, qiangdu = 1}, --菩提法痴链
-- {itemid = 128, prob = 13802, count = 1, notice = 2, broadcast = true, hundred = 50307, qiangdu = 1}, --菩提法痴腕
-- {itemid = 129, prob = 13804, count = 1, notice = 2, broadcast = true, hundred = 50308, qiangdu = 1}, --菩提法痴戒
-- {itemid = 130, prob = 13806, count = 1, notice = 2, broadcast = true, hundred = 50309, qiangdu = 1}, --菩提法痴带
-- {itemid = 131, prob = 13808, count = 1, notice = 2, broadcast = true, hundred = 50310, qiangdu = 1}, --菩提法痴靴

{itemid = 96 , prob = 13043, count = 1, notice = 2, broadcast = true, hundred = 12043, qiangdu = 1}, --冲天魔杖
{itemid = 97 , prob = 13044, count = 1, notice = 2, broadcast = true, hundred = 12044, qiangdu = 1}, --冲天魔袍(男)
{itemid = 98 , prob = 13045, count = 1, notice = 2, broadcast = true, hundred = 12045, qiangdu = 1}, --冲天魔袍(女)
-- {itemid = 99 , prob = 13853, count = 1, notice = 2, broadcast = true, hundred = 12853, qiangdu = 1}, --冲天魔盔
-- {itemid = 100, prob = 13854, count = 1, notice = 2, broadcast = true, hundred = 12854, qiangdu = 1}, --冲天魔链
-- {itemid = 101, prob = 13855, count = 1, notice = 2, broadcast = true, hundred = 12855, qiangdu = 1}, --冲天魔腕
-- {itemid = 102, prob = 13856, count = 1, notice = 2, broadcast = true, hundred = 12856, qiangdu = 1}, --冲天魔戒
-- {itemid = 103, prob = 13857, count = 1, notice = 2, broadcast = true, hundred = 12857, qiangdu = 1}, --冲天魔带
-- {itemid = 104, prob = 13858, count = 1, notice = 2, broadcast = true, hundred = 12858, qiangdu = 1}, --冲天魔靴

{itemid = 4690, prob = 6007, count = 1, notice = 2, broadcast = false, hundred = 6007, qiangdu = 1}, --誓言天玑
{itemid = 4691, prob = 6008, count = 1, notice = 2, broadcast = false, hundred = 6008, qiangdu = 1}, --誓言道衣(男)
{itemid = 4692, prob = 6009, count = 1, notice = 2, broadcast = false, hundred = 6009, qiangdu = 1}, --誓言道衣(女)
{itemid = 4693, prob = 6620, count = 1, notice = 2, broadcast = false, hundred = 6620, qiangdu = 1}, --誓言道盔
{itemid = 4694, prob = 6619, count = 1, notice = 2, broadcast = false, hundred = 6619, qiangdu = 1}, --誓言道链
{itemid = 4695, prob = 6618, count = 1, notice = 2, broadcast = false, hundred = 6618, qiangdu = 1}, --誓言道镯
{itemid = 4696, prob = 6617, count = 1, notice = 2, broadcast = false, hundred = 6617, qiangdu = 1}, --誓言道戒
{itemid = 4697, prob = 6616, count = 1, notice = 2, broadcast = false, hundred = 6616, qiangdu = 1}, --誓言道带
{itemid = 4698, prob = 6615, count = 1, notice = 2, broadcast = false, hundred = 6615, qiangdu = 1}, --誓言道靴

{itemid = 4681, prob = 6007, count = 1, notice = 2, broadcast = false, hundred = 6007, qiangdu = 1}, --誓言血饮
{itemid = 4682, prob = 6008, count = 1, notice = 2, broadcast = false, hundred = 6008, qiangdu = 1}, --誓言魔袍(男)
{itemid = 4683, prob = 6009, count = 1, notice = 2, broadcast = false, hundred = 6009, qiangdu = 1}, --誓言魔袍(女)
{itemid = 4684, prob = 6620, count = 1, notice = 2, broadcast = false, hundred = 6620, qiangdu = 1}, --誓言法盔
{itemid = 4685, prob = 6619, count = 1, notice = 2, broadcast = false, hundred = 6619, qiangdu = 1}, --誓言法链
{itemid = 4686, prob = 6618, count = 1, notice = 2, broadcast = false, hundred = 6618, qiangdu = 1}, --誓言法镯
{itemid = 4687, prob = 6617, count = 1, notice = 2, broadcast = false, hundred = 6617, qiangdu = 1}, --誓言法戒
{itemid = 4688, prob = 6616, count = 1, notice = 2, broadcast = false, hundred = 6616, qiangdu = 1}, --誓言法带
{itemid = 4689, prob = 6615, count = 1, notice = 2, broadcast = false, hundred = 6615, qiangdu = 1}, --誓言法靴

{itemid = 4672, prob = 6007, count = 1, notice = 2, broadcast = false, hundred = 6007, qiangdu = 1}, --誓言星王
{itemid = 4673, prob = 6008, count = 1, notice = 2, broadcast = false, hundred = 6008, qiangdu = 1}, --誓言战甲(男)
{itemid = 4674, prob = 6009, count = 1, notice = 2, broadcast = false, hundred = 6009, qiangdu = 1}, --誓言战甲(女)
{itemid = 4675, prob = 6620, count = 1, notice = 2, broadcast = false, hundred = 6620, qiangdu = 1}, --誓言战盔
{itemid = 4676, prob = 6619, count = 1, notice = 2, broadcast = false, hundred = 6619, qiangdu = 1}, --誓言战链
{itemid = 4677, prob = 6618, count = 1, notice = 2, broadcast = false, hundred = 6618, qiangdu = 1}, --誓言战镯
{itemid = 4678, prob = 6617, count = 1, notice = 2, broadcast = false, hundred = 6617, qiangdu = 1}, --誓言战戒
{itemid = 4679, prob = 6616, count = 1, notice = 2, broadcast = false, hundred = 6616, qiangdu = 1}, --誓言战带
{itemid = 4680, prob = 6615, count = 1, notice = 2, broadcast = false, hundred = 6615, qiangdu = 1}, --誓言战靴

{itemid = 4663, prob = 4043, count = 1, notice = 2, broadcast = false, hundred = 4043, qiangdu = 1}, --起源道剑
{itemid = 4664, prob = 4044, count = 1, notice = 2, broadcast = false, hundred = 4044, qiangdu = 1}, --起源道衣(男)
{itemid = 4665, prob = 4045, count = 1, notice = 2, broadcast = false, hundred = 4045, qiangdu = 1}, --起源道衣(女)
{itemid = 4666, prob = 4018, count = 1, notice = 2, broadcast = false, hundred = 4018, qiangdu = 1}, --起源道盔
{itemid = 4667, prob = 4017, count = 1, notice = 2, broadcast = false, hundred = 4017, qiangdu = 1}, --起源道链
{itemid = 4668, prob = 4016, count = 1, notice = 2, broadcast = false, hundred = 4016, qiangdu = 1}, --起源道镯
{itemid = 4669, prob = 4015, count = 1, notice = 2, broadcast = false, hundred = 4015, qiangdu = 1}, --起源道戒
{itemid = 4670, prob = 4013, count = 1, notice = 2, broadcast = false, hundred = 4013, qiangdu = 1}, --起源道带
{itemid = 4671, prob = 4012, count = 1, notice = 2, broadcast = false, hundred = 4012, qiangdu = 1}, --起源道靴

{itemid = 4654, prob = 4043, count = 1, notice = 2, broadcast = false, hundred = 4043, qiangdu = 1}, --起源法剑
{itemid = 4655, prob = 4044, count = 1, notice = 2, broadcast = false, hundred = 4044, qiangdu = 1}, --起源魔袍(男)
{itemid = 4656, prob = 4045, count = 1, notice = 2, broadcast = false, hundred = 4045, qiangdu = 1}, --起源魔袍(女)
{itemid = 4657, prob = 4018, count = 1, notice = 2, broadcast = false, hundred = 4018, qiangdu = 1}, --起源法盔
{itemid = 4658, prob = 4017, count = 1, notice = 2, broadcast = false, hundred = 4017, qiangdu = 1}, --起源法链
{itemid = 4659, prob = 4016, count = 1, notice = 2, broadcast = false, hundred = 4016, qiangdu = 1}, --起源法镯
{itemid = 4660, prob = 4015, count = 1, notice = 2, broadcast = false, hundred = 4015, qiangdu = 1}, --起源法戒
{itemid = 4661, prob = 4013, count = 1, notice = 2, broadcast = false, hundred = 4013, qiangdu = 1}, --起源法带
{itemid = 4662, prob = 4012, count = 1, notice = 2, broadcast = false, hundred = 4012, qiangdu = 1}, --起源法靴

{itemid = 4645, prob = 4043, count = 1, notice = 2, broadcast = false, hundred = 4043, qiangdu = 1}, --起源战刃
{itemid = 4646, prob = 4044, count = 1, notice = 2, broadcast = false, hundred = 4044, qiangdu = 1}, --起源战甲(男)
{itemid = 4647, prob = 4045, count = 1, notice = 2, broadcast = false, hundred = 4045, qiangdu = 1}, --起源战甲(女)
{itemid = 4648, prob = 4018, count = 1, notice = 2, broadcast = false, hundred = 4018, qiangdu = 1}, --起源战盔
{itemid = 4649, prob = 4017, count = 1, notice = 2, broadcast = false, hundred = 4017, qiangdu = 1}, --起源战链
{itemid = 4650, prob = 4016, count = 1, notice = 2, broadcast = false, hundred = 4016, qiangdu = 1}, --起源战镯
{itemid = 4651, prob = 4015, count = 1, notice = 2, broadcast = false, hundred = 4015, qiangdu = 1}, --起源战戒
{itemid = 4652, prob = 4013, count = 1, notice = 2, broadcast = false, hundred = 4013, qiangdu = 1}, --起源战带
{itemid = 4653, prob = 4012, count = 1, notice = 2, broadcast = false, hundred = 4012, qiangdu = 1}, --起源战靴

{itemid = 4618, prob = 1616, count = 1, notice = 2, broadcast = false, hundred = 1616, qiangdu = 1}, --上古开山
{itemid = 4619, prob = 1617, count = 1, notice = 2, broadcast = false, hundred = 1617, qiangdu = 1}, --上古重甲(男)
{itemid = 4620, prob = 1618, count = 1, notice = 2, broadcast = false, hundred = 1618, qiangdu = 1}, --上古重甲(女)
{itemid = 4621, prob = 1018, count = 1, notice = 2, broadcast = false, hundred = 1018, qiangdu = 1}, --上古战盔
{itemid = 4622, prob = 1017, count = 1, notice = 2, broadcast = false, hundred = 1017, qiangdu = 1}, --上古战链
{itemid = 4623, prob = 1016, count = 1, notice = 2, broadcast = false, hundred = 1016, qiangdu = 1}, --上古战镯
{itemid = 4624, prob = 1015, count = 1, notice = 2, broadcast = false, hundred = 1015, qiangdu = 1}, --上古战戒
{itemid = 4625, prob = 1013, count = 1, notice = 2, broadcast = false, hundred = 1013, qiangdu = 1}, --上古战带
{itemid = 4626, prob = 1012, count = 1, notice = 2, broadcast = false, hundred = 1012, qiangdu = 1}, --上古战靴

{itemid = 4636, prob = 1616, count = 1, notice = 2, broadcast = false, hundred = 1616, qiangdu = 1}, --上古霹雷
{itemid = 4637, prob = 1617, count = 1, notice = 2, broadcast = false, hundred = 1617, qiangdu = 1}, --上古道衣(男)
{itemid = 4638, prob = 1618, count = 1, notice = 2, broadcast = false, hundred = 1618, qiangdu = 1}, --上古道衣(女)
{itemid = 4639, prob = 1018, count = 1, notice = 2, broadcast = false, hundred = 1018, qiangdu = 1}, --上古道盔
{itemid = 4640, prob = 1017, count = 1, notice = 2, broadcast = false, hundred = 1017, qiangdu = 1}, --上古道链
{itemid = 4641, prob = 1016, count = 1, notice = 2, broadcast = false, hundred = 1016, qiangdu = 1}, --上古道镯
{itemid = 4642, prob = 1015, count = 1, notice = 2, broadcast = false, hundred = 1015, qiangdu = 1}, --上古道戒
{itemid = 4643, prob = 1013, count = 1, notice = 2, broadcast = false, hundred = 1013, qiangdu = 1}, --上古道带
{itemid = 4644, prob = 1012, count = 1, notice = 2, broadcast = false, hundred = 1012, qiangdu = 1}, --上古道靴

{itemid = 4627, prob = 1616, count = 1, notice = 2, broadcast = false, hundred = 1616, qiangdu = 1}, --上古拂尘
{itemid = 4628, prob = 1617, count = 1, notice = 2, broadcast = false, hundred = 1617, qiangdu = 1}, --上古魔袍(男)
{itemid = 4629, prob = 1618, count = 1, notice = 2, broadcast = false, hundred = 1618, qiangdu = 1}, --上古魔袍(女)
{itemid = 4630, prob = 1018, count = 1, notice = 2, broadcast = false, hundred = 1018, qiangdu = 1}, --上古法盔
{itemid = 4631, prob = 1017, count = 1, notice = 2, broadcast = false, hundred = 1017, qiangdu = 1}, --上古法链
{itemid = 4632, prob = 1016, count = 1, notice = 2, broadcast = false, hundred = 1016, qiangdu = 1}, --上古法镯
{itemid = 4633, prob = 1015, count = 1, notice = 2, broadcast = false, hundred = 1015, qiangdu = 1}, --上古法戒
{itemid = 4634, prob = 1013, count = 1, notice = 2, broadcast = false, hundred = 1013, qiangdu = 1}, --上古法带
{itemid = 4635, prob = 1012, count = 1, notice = 2, broadcast = false, hundred = 1012, qiangdu = 1}, --上古法靴

{itemid = 5125, prob = 108, count = 1, notice = 0, broadcast = false, hundred = 108, qiangdu = 0}, --初级BOSS挑战卷
{itemid = 5126, prob = 158, count = 1, notice = 2, broadcast = false, hundred = 158, qiangdu = 0}, --中级BOSS挑战卷
{itemid = 5127, prob = 258, count = 1, notice = 2, broadcast = false, hundred = 258, qiangdu = 0}, --高级BOSS挑战卷
{itemid = 6127, prob = 258, count = 1, notice = 2, broadcast = false, hundred = 258, qiangdu = 0}, --军魂BOSS召唤令

{itemid = 451, prob = 899, count = 1, notice = 2, broadcast = false, hundred = 899, qiangdu = 1}, --毁灭灵盔
{itemid = 452, prob = 898, count = 1, notice = 2, broadcast = false, hundred = 898, qiangdu = 1}, --毁灭灵链
{itemid = 453, prob = 897, count = 1, notice = 2, broadcast = false, hundred = 897, qiangdu = 1}, --毁灭灵镯
{itemid = 454, prob = 896, count = 1, notice = 2, broadcast = false, hundred = 896, qiangdu = 1}, --毁灭灵戒
{itemid = 455, prob = 895, count = 1, notice = 2, broadcast = false, hundred = 895, qiangdu = 1}, --毁灭灵带
{itemid = 456, prob = 893, count = 1, notice = 2, broadcast = false, hundred = 893, qiangdu = 1}, --毁灭灵靴
{itemid = 448, prob = 799, count = 1, notice = 2, broadcast = false, hundred = 799, qiangdu = 1}, --毁灭灵斩
{itemid = 449, prob = 798, count = 1, notice = 2, broadcast = false, hundred = 798, qiangdu = 1}, --毁灭灵甲(男)
{itemid = 450, prob = 797, count = 1, notice = 2, broadcast = false, hundred = 797, qiangdu = 1}, --毁灭灵甲(女)

{itemid = 442, prob = 688, count = 1, notice = 2, broadcast = false, hundred = 688, qiangdu = 1}, --通天神盔
{itemid = 443, prob = 689, count = 1, notice = 2, broadcast = false, hundred = 689, qiangdu = 1}, --通天神链
{itemid = 444, prob = 687, count = 1, notice = 2, broadcast = false, hundred = 687, qiangdu = 1}, --通天神镯
{itemid = 445, prob = 686, count = 1, notice = 2, broadcast = false, hundred = 686, qiangdu = 1}, --通天神戒
{itemid = 446, prob = 685, count = 1, notice = 2, broadcast = false, hundred = 685, qiangdu = 1}, --通天神带
{itemid = 447, prob = 683, count = 1, notice = 2, broadcast = false, hundred = 683, qiangdu = 1}, --通天神靴
{itemid = 439, prob = 477, count = 1, notice = 2, broadcast = false, hundred = 477, qiangdu = 1}, --通天神棍
{itemid = 440, prob = 475, count = 1, notice = 2, broadcast = false, hundred = 475, qiangdu = 1}, --通天神甲(男)
{itemid = 441, prob = 474, count = 1, notice = 2, broadcast = false, hundred = 474, qiangdu = 1}, --通天神甲(女)

{itemid = 433, prob = 520, count = 1, notice = 2, broadcast = false, hundred = 520, qiangdu = 1}, --霸主血盔
{itemid = 434, prob = 519, count = 1, notice = 2, broadcast = false, hundred = 519, qiangdu = 1}, --霸主血链
{itemid = 435, prob = 518, count = 1, notice = 2, broadcast = false, hundred = 518, qiangdu = 1}, --霸主血镯
{itemid = 436, prob = 516, count = 1, notice = 2, broadcast = false, hundred = 516, qiangdu = 1}, --霸主血戒
{itemid = 437, prob = 513, count = 1, notice = 2, broadcast = false, hundred = 513, qiangdu = 1}, --霸主血带
{itemid = 438, prob = 511, count = 1, notice = 2, broadcast = false, hundred = 511, qiangdu = 1}, --霸主血靴
{itemid = 430, prob = 253, count = 1, notice = 2, broadcast = false, hundred = 253, qiangdu = 1}, --霸主血剑
{itemid = 431, prob = 251, count = 1, notice = 2, broadcast = false, hundred = 251, qiangdu = 1}, --霸主血甲(男)
{itemid = 432, prob = 250, count = 1, notice = 2, broadcast = false, hundred = 250, qiangdu = 1}, --霸主血甲(女)
{itemid = 7197, prob = 99, count = 1, notice = 2, broadcast = false, hundred = 88, qiangdu = 0}, --玛法晶块
{itemid = 493, prob = 88, count = 1, notice = 2, broadcast = false, hundred = 88, qiangdu = 0}, --翅膀魂石·白虎
{itemid = 494, prob = 89, count = 1, notice = 2, broadcast = false, hundred = 89, qiangdu = 0}, --翅膀魂石·青龙
{itemid = 495, prob = 90, count = 1, notice = 2, broadcast = false, hundred = 90, qiangdu = 0}, --翅膀魂石·朱雀
{itemid = 6736, prob = 38, count = 1, notice = 2, broadcast = false, hundred = 58, qiangdu = 0}, --突破丹

-- {itemid = 421, prob = 45, count = 1, notice = 0, broadcast = false, hundred = 45, qiangdu = 1}, --十方刃
-- {itemid = 422, prob = 46, count = 1, notice = 0, broadcast = false, hundred = 46, qiangdu = 1}, --十方甲(男)
-- {itemid = 423, prob = 47, count = 1, notice = 0, broadcast = false, hundred = 47, qiangdu = 1}, --十方甲(女)
-- {itemid = 424, prob = 48, count = 1, notice = 0, broadcast = false, hundred = 48, qiangdu = 1}, --十方盔
-- {itemid = 425, prob = 49, count = 1, notice = 0, broadcast = false, hundred = 49, qiangdu = 1}, --十方链
-- {itemid = 426, prob = 50, count = 1, notice = 0, broadcast = false, hundred = 50, qiangdu = 1}, --十方镯
-- {itemid = 427, prob = 51, count = 1, notice = 0, broadcast = false, hundred = 51, qiangdu = 1}, --十方戒
-- {itemid = 428, prob = 52, count = 1, notice = 0, broadcast = false, hundred = 52, qiangdu = 1}, --十方带
-- {itemid = 429, prob = 53, count = 1, notice = 0, broadcast = false, hundred = 53, qiangdu = 1}, --十方靴
{itemid = 5651, prob = 38, count = 1, notice = 0, broadcast = false, hundred = 20, qiangdu = 0}, --来
{itemid = 5652, prob = 37, count = 1, notice = 0, broadcast = false, hundred = 17, qiangdu = 0}, --袭
{itemid = 5650, prob = 28, count = 1, notice = 0, broadcast = false, hundred = 15, qiangdu = 0}, --典
{itemid = 5649, prob = 26, count = 1, notice = 0, broadcast = false, hundred = 13, qiangdu = 0}, --庆
{itemid = 511, prob = 1, count = 1, notice = 0, broadcast = false, hundred = 1, qiangdu = 0}, --经验


					},
				},
                               {
					count = 250,	--寻宝次数大于此值才会进入
					maxcount = 9999,	--寻宝次数等于此值必定进入
					limit = 1,		--限制进入次数,-1为不限制
					prob = 5,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 5656, prob = 50, count = 1, notice = true, hundred = 26},  --服
						{itemid = 5655, prob = 58, count = 1, notice = true, hundred = 10},  --全
						{itemid = 5654, prob = 5 , count = 1, notice = true, hundred = 3 },  --爆
						{itemid = 5653, prob = 4 , count = 1, notice = true, hundred = 1 },  --嗨
					},
				},
				{
					money = 30000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
{itemid = 7078, prob = 30, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --雷神锤
{itemid = 7079, prob = 20, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --雷神甲
{itemid = 7080, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --雷神盔
{itemid = 7081, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --雷神项链
{itemid = 7082, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --雷神手镯
{itemid = 7083, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --雷神戒指
{itemid = 7084, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --雷神腰带
{itemid = 7085, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --雷神靴子


					},
				},
				{
					money = 7500,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
{itemid = 7052, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --凡·南明离火

					},
				},

				{
					money = 30000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
{itemid = 7057, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --魔躯
{itemid = 7058, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --血瞳
{itemid = 7059, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --鬼爪
{itemid = 7060, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --圣角

					},
				},
{
					money = 50000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
{itemid = 6888, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --蓝凤凰
{itemid = 6892, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1398, qiangdu = 0}, --深海鱼王
{itemid = 6896, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1397, qiangdu = 0}, --远古苍龙
{itemid = 6900, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1396, qiangdu = 0}, --灵狐武者
{itemid = 6941, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1396, qiangdu = 0}, --远古麒麟
					},
				},
				{
					money = 40000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
{itemid = 6888, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --蓝凤凰
{itemid = 6892, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1398, qiangdu = 0}, --深海鱼王
{itemid = 6896, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1397, qiangdu = 0}, --远古苍龙
{itemid = 6900, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1396, qiangdu = 0}, --灵狐武者
{itemid = 6941, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1396, qiangdu = 0}, --远古麒麟

					},
				},
				{
					money = 50000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
{itemid = 99, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 12853, qiangdu = 1}, --冲天魔盔
{itemid = 100, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 12854, qiangdu = 1}, --冲天魔链
{itemid = 101, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 12855, qiangdu = 1}, --冲天魔腕
{itemid = 102, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 12856, qiangdu = 1}, --冲天魔戒
{itemid = 103, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 12857, qiangdu = 1}, --冲天魔带
{itemid = 104, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 12858, qiangdu = 1}, --冲天魔靴
					},
				},

{
					money = 180000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 2,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
{itemid = 126, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50305, qiangdu = 1}, --菩提法痴盔
{itemid = 127, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50306, qiangdu = 1}, --菩提法痴链
{itemid = 128, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50307, qiangdu = 1}, --菩提法痴腕
{itemid = 129, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50308, qiangdu = 1}, --菩提法痴戒
{itemid = 130, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50309, qiangdu = 1}, --菩提法痴带
{itemid = 131, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50310, qiangdu = 1}, --菩提法痴靴
					},
				},

{
					money = 360000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 2,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
{itemid = 153, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50305, qiangdu = 1}, --无尘法幻盔    
{itemid = 154, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50306, qiangdu = 1}, --无尘法幻链    
{itemid = 155, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50307, qiangdu = 1}, --无尘法幻腕    
{itemid = 156, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50308, qiangdu = 1}, --无尘法幻戒    
{itemid = 157, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50309, qiangdu = 1}, --无尘法幻带    
{itemid = 158, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50310, qiangdu = 1}, --无尘法幻靴  
					},
				},
							{
					money = 100000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 300,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
{itemid = 6362, prob = 300, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --至尊屠龙刀 
{itemid = 6945, prob = 300, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --至尊屠龙甲   
{itemid = 6946, prob = 300, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --至尊屠龙甲   
					},
				},

{
					money = 80000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 200,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
{itemid = 6947, prob = 200, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --至尊屠龙盔  
{itemid = 6948, prob = 200, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --至尊屠龙项链   
{itemid = 6949, prob = 200, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --至尊屠龙戒 
{itemid = 6950, prob = 200, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --至尊屠龙手镯 
{itemid = 6951, prob = 200, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --至尊屠龙腰带 
{itemid = 6952, prob = 200, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --至尊屠龙靴子 
					},
				},


			},
			--道士
			{

				{
					money = 0,	--寻宝花费数大于此值才会进入此表
					limit = -1,		--限制进入次数,-1为不限制
					prob = 1,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
--{itemid = 6362, prob = 198888, count = 1, notice = 2, broadcast = true, hundred = 50998, qiangdu = 1}, --屠龙刀  
{itemid = 186, prob = 58888, count = 1, notice = 2, broadcast = true, hundred = 51004, qiangdu = 1}, --芙蓉幽冥剑      
{itemid = 187, prob = 58888, count = 1, notice = 2, broadcast = true, hundred = 51005, qiangdu = 1}, --芙蓉道影衣(男)
{itemid = 188, prob = 58888, count = 1, notice = 2, broadcast = true, hundred = 51006, qiangdu = 1}, --芙蓉道影衣(女)
{itemid = 189, prob = 45888, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --芙蓉道骨盔   
{itemid = 190, prob = 45888, count = 1, notice = 2, broadcast = true, hundred = 50300, qiangdu = 1}, --芙蓉道骨链   
{itemid = 191, prob = 45888, count = 1, notice = 2, broadcast = true, hundred = 50301, qiangdu = 1}, --芙蓉道骨腕    
{itemid = 192, prob = 45888, count = 1, notice = 2, broadcast = true, hundred = 50302, qiangdu = 1}, --芙蓉道骨戒    
{itemid = 193, prob = 45888, count = 1, notice = 2, broadcast = true, hundred = 50303, qiangdu = 1}, --芙蓉道骨带  
{itemid = 194, prob = 45888, count = 1, notice = 2, broadcast = true, hundred = 50304, qiangdu = 1}, --芙蓉道骨靴 

{itemid = 159, prob = 25888, count = 1, notice = 2, broadcast = true, hundred = 51004, qiangdu = 1}, --无尘血剑      
{itemid = 160, prob = 25998, count = 1, notice = 2, broadcast = true, hundred = 51005, qiangdu = 1}, --无尘道幻衣(男)
{itemid = 161, prob = 25000, count = 1, notice = 2, broadcast = true, hundred = 51006, qiangdu = 1}, --无尘道幻衣(女)
 

{itemid = 132, prob = 18996, count = 1, notice = 2, broadcast = true, hundred = 50998, qiangdu = 1}, --菩提金纹剑
{itemid = 133, prob = 18998, count = 1, notice = 2, broadcast = true, hundred = 50999, qiangdu = 1}, --菩提道仙衣(男)
{itemid = 134, prob = 18000, count = 1, notice = 2, broadcast = true, hundred = 51000, qiangdu = 1}, --菩提道仙衣(女)
-- {itemid = 135, prob = 13798, count = 1, notice = 2, broadcast = true, hundred = 50311, qiangdu = 1}, --菩提道仙盔
-- {itemid = 136, prob = 13800, count = 1, notice = 2, broadcast = true, hundred = 50312, qiangdu = 1}, --菩提道仙链
-- {itemid = 137, prob = 13802, count = 1, notice = 2, broadcast = true, hundred = 50313, qiangdu = 1}, --菩提道仙腕
-- {itemid = 138, prob = 13804, count = 1, notice = 2, broadcast = true, hundred = 50314, qiangdu = 1}, --菩提道仙戒
-- {itemid = 139, prob = 13806, count = 1, notice = 2, broadcast = true, hundred = 50315, qiangdu = 1}, --菩提道仙带
-- {itemid = 140, prob = 13808, count = 1, notice = 2, broadcast = true, hundred = 50316, qiangdu = 1}, --菩提道仙靴

{itemid = 105, prob = 13043, count = 1, notice = 2, broadcast = true, hundred = 12043, qiangdu = 1}, --冲天道剑
{itemid = 106, prob = 13044, count = 1, notice = 2, broadcast = true, hundred = 12044, qiangdu = 1}, --冲天道衣(男)
{itemid = 107, prob = 13045, count = 1, notice = 2, broadcast = true, hundred = 12045, qiangdu = 1}, --冲天道衣(女)
-- {itemid = 108, prob = 13853, count = 1, notice = 2, broadcast = true, hundred = 12853, qiangdu = 1}, --冲天道盔
-- {itemid = 109, prob = 13854, count = 1, notice = 2, broadcast = true, hundred = 12854, qiangdu = 1}, --冲天道链
-- {itemid = 110, prob = 13855, count = 1, notice = 2, broadcast = true, hundred = 12855, qiangdu = 1}, --冲天道腕
-- {itemid = 111, prob = 13856, count = 1, notice = 2, broadcast = true, hundred = 12856, qiangdu = 1}, --冲天道戒
-- {itemid = 112, prob = 13857, count = 1, notice = 2, broadcast = true, hundred = 12857, qiangdu = 1}, --冲天道带
-- {itemid = 113, prob = 13858, count = 1, notice = 2, broadcast = true, hundred = 12858, qiangdu = 1}, --冲天道靴

{itemid = 4690, prob = 6007, count = 1, notice = 2, broadcast = false, hundred = 6007, qiangdu = 1}, --誓言天玑
{itemid = 4691, prob = 6008, count = 1, notice = 2, broadcast = false, hundred = 6008, qiangdu = 1}, --誓言道衣(男)
{itemid = 4692, prob = 6009, count = 1, notice = 2, broadcast = false, hundred = 6009, qiangdu = 1}, --誓言道衣(女)
{itemid = 4693, prob = 6620, count = 1, notice = 2, broadcast = false, hundred = 6620, qiangdu = 1}, --誓言道盔
{itemid = 4694, prob = 6619, count = 1, notice = 2, broadcast = false, hundred = 6619, qiangdu = 1}, --誓言道链
{itemid = 4695, prob = 6618, count = 1, notice = 2, broadcast = false, hundred = 6618, qiangdu = 1}, --誓言道镯
{itemid = 4696, prob = 6617, count = 1, notice = 2, broadcast = false, hundred = 6617, qiangdu = 1}, --誓言道戒
{itemid = 4697, prob = 6616, count = 1, notice = 2, broadcast = false, hundred = 6616, qiangdu = 1}, --誓言道带
{itemid = 4698, prob = 6615, count = 1, notice = 2, broadcast = false, hundred = 6615, qiangdu = 1}, --誓言道靴

{itemid = 4681, prob = 6007, count = 1, notice = 2, broadcast = false, hundred = 6007, qiangdu = 1}, --誓言血饮
{itemid = 4682, prob = 6008, count = 1, notice = 2, broadcast = false, hundred = 6008, qiangdu = 1}, --誓言魔袍(男)
{itemid = 4683, prob = 6009, count = 1, notice = 2, broadcast = false, hundred = 6009, qiangdu = 1}, --誓言魔袍(女)
{itemid = 4684, prob = 6620, count = 1, notice = 2, broadcast = false, hundred = 6620, qiangdu = 1}, --誓言法盔
{itemid = 4685, prob = 6619, count = 1, notice = 2, broadcast = false, hundred = 6619, qiangdu = 1}, --誓言法链
{itemid = 4686, prob = 6618, count = 1, notice = 2, broadcast = false, hundred = 6618, qiangdu = 1}, --誓言法镯
{itemid = 4687, prob = 6617, count = 1, notice = 2, broadcast = false, hundred = 6617, qiangdu = 1}, --誓言法戒
{itemid = 4688, prob = 6616, count = 1, notice = 2, broadcast = false, hundred = 6616, qiangdu = 1}, --誓言法带
{itemid = 4689, prob = 6615, count = 1, notice = 2, broadcast = false, hundred = 6615, qiangdu = 1}, --誓言法靴

{itemid = 4672, prob = 6007, count = 1, notice = 2, broadcast = false, hundred = 6007, qiangdu = 1}, --誓言星王
{itemid = 4673, prob = 6008, count = 1, notice = 2, broadcast = false, hundred = 6008, qiangdu = 1}, --誓言战甲(男)
{itemid = 4674, prob = 6009, count = 1, notice = 2, broadcast = false, hundred = 6009, qiangdu = 1}, --誓言战甲(女)
{itemid = 4675, prob = 6620, count = 1, notice = 2, broadcast = false, hundred = 6620, qiangdu = 1}, --誓言战盔
{itemid = 4676, prob = 6619, count = 1, notice = 2, broadcast = false, hundred = 6619, qiangdu = 1}, --誓言战链
{itemid = 4677, prob = 6618, count = 1, notice = 2, broadcast = false, hundred = 6618, qiangdu = 1}, --誓言战镯
{itemid = 4678, prob = 6617, count = 1, notice = 2, broadcast = false, hundred = 6617, qiangdu = 1}, --誓言战戒
{itemid = 4679, prob = 6616, count = 1, notice = 2, broadcast = false, hundred = 6616, qiangdu = 1}, --誓言战带
{itemid = 4680, prob = 6615, count = 1, notice = 2, broadcast = false, hundred = 6615, qiangdu = 1}, --誓言战靴

{itemid = 4663, prob = 4043, count = 1, notice = 2, broadcast = false, hundred = 4043, qiangdu = 1}, --起源道剑
{itemid = 4664, prob = 4044, count = 1, notice = 2, broadcast = false, hundred = 4044, qiangdu = 1}, --起源道衣(男)
{itemid = 4665, prob = 4045, count = 1, notice = 2, broadcast = false, hundred = 4045, qiangdu = 1}, --起源道衣(女)
{itemid = 4666, prob = 4018, count = 1, notice = 2, broadcast = false, hundred = 4018, qiangdu = 1}, --起源道盔
{itemid = 4667, prob = 4017, count = 1, notice = 2, broadcast = false, hundred = 4017, qiangdu = 1}, --起源道链
{itemid = 4668, prob = 4016, count = 1, notice = 2, broadcast = false, hundred = 4016, qiangdu = 1}, --起源道镯
{itemid = 4669, prob = 4015, count = 1, notice = 2, broadcast = false, hundred = 4015, qiangdu = 1}, --起源道戒
{itemid = 4670, prob = 4013, count = 1, notice = 2, broadcast = false, hundred = 4013, qiangdu = 1}, --起源道带
{itemid = 4671, prob = 4012, count = 1, notice = 2, broadcast = false, hundred = 4012, qiangdu = 1}, --起源道靴

{itemid = 4654, prob = 4043, count = 1, notice = 2, broadcast = false, hundred = 4043, qiangdu = 1}, --起源法剑
{itemid = 4655, prob = 4044, count = 1, notice = 2, broadcast = false, hundred = 4044, qiangdu = 1}, --起源魔袍(男)
{itemid = 4656, prob = 4045, count = 1, notice = 2, broadcast = false, hundred = 4045, qiangdu = 1}, --起源魔袍(女)
{itemid = 4657, prob = 4018, count = 1, notice = 2, broadcast = false, hundred = 4018, qiangdu = 1}, --起源法盔
{itemid = 4658, prob = 4017, count = 1, notice = 2, broadcast = false, hundred = 4017, qiangdu = 1}, --起源法链
{itemid = 4659, prob = 4016, count = 1, notice = 2, broadcast = false, hundred = 4016, qiangdu = 1}, --起源法镯
{itemid = 4660, prob = 4015, count = 1, notice = 2, broadcast = false, hundred = 4015, qiangdu = 1}, --起源法戒
{itemid = 4661, prob = 4013, count = 1, notice = 2, broadcast = false, hundred = 4013, qiangdu = 1}, --起源法带
{itemid = 4662, prob = 4012, count = 1, notice = 2, broadcast = false, hundred = 4012, qiangdu = 1}, --起源法靴

{itemid = 4645, prob = 4043, count = 1, notice = 2, broadcast = false, hundred = 4043, qiangdu = 1}, --起源战刃
{itemid = 4646, prob = 4044, count = 1, notice = 2, broadcast = false, hundred = 4044, qiangdu = 1}, --起源战甲(男)
{itemid = 4647, prob = 4045, count = 1, notice = 2, broadcast = false, hundred = 4045, qiangdu = 1}, --起源战甲(女)
{itemid = 4648, prob = 4018, count = 1, notice = 2, broadcast = false, hundred = 4018, qiangdu = 1}, --起源战盔
{itemid = 4649, prob = 4017, count = 1, notice = 2, broadcast = false, hundred = 4017, qiangdu = 1}, --起源战链
{itemid = 4650, prob = 4016, count = 1, notice = 2, broadcast = false, hundred = 4016, qiangdu = 1}, --起源战镯
{itemid = 4651, prob = 4015, count = 1, notice = 2, broadcast = false, hundred = 4015, qiangdu = 1}, --起源战戒
{itemid = 4652, prob = 4013, count = 1, notice = 2, broadcast = false, hundred = 4013, qiangdu = 1}, --起源战带
{itemid = 4653, prob = 4012, count = 1, notice = 2, broadcast = false, hundred = 4012, qiangdu = 1}, --起源战靴

{itemid = 4618, prob = 1616, count = 1, notice = 2, broadcast = false, hundred = 1616, qiangdu = 1}, --上古开山
{itemid = 4619, prob = 1617, count = 1, notice = 2, broadcast = false, hundred = 1617, qiangdu = 1}, --上古重甲(男)
{itemid = 4620, prob = 1618, count = 1, notice = 2, broadcast = false, hundred = 1618, qiangdu = 1}, --上古重甲(女)
{itemid = 4621, prob = 1018, count = 1, notice = 2, broadcast = false, hundred = 1018, qiangdu = 1}, --上古战盔
{itemid = 4622, prob = 1017, count = 1, notice = 2, broadcast = false, hundred = 1017, qiangdu = 1}, --上古战链
{itemid = 4623, prob = 1016, count = 1, notice = 2, broadcast = false, hundred = 1016, qiangdu = 1}, --上古战镯
{itemid = 4624, prob = 1015, count = 1, notice = 2, broadcast = false, hundred = 1015, qiangdu = 1}, --上古战戒
{itemid = 4625, prob = 1013, count = 1, notice = 2, broadcast = false, hundred = 1013, qiangdu = 1}, --上古战带
{itemid = 4626, prob = 1012, count = 1, notice = 2, broadcast = false, hundred = 1012, qiangdu = 1}, --上古战靴

{itemid = 4636, prob = 1616, count = 1, notice = 2, broadcast = false, hundred = 1616, qiangdu = 1}, --上古霹雷
{itemid = 4637, prob = 1617, count = 1, notice = 2, broadcast = false, hundred = 1617, qiangdu = 1}, --上古道衣(男)
{itemid = 4638, prob = 1618, count = 1, notice = 2, broadcast = false, hundred = 1618, qiangdu = 1}, --上古道衣(女)
{itemid = 4639, prob = 1018, count = 1, notice = 2, broadcast = false, hundred = 1018, qiangdu = 1}, --上古道盔
{itemid = 4640, prob = 1017, count = 1, notice = 2, broadcast = false, hundred = 1017, qiangdu = 1}, --上古道链
{itemid = 4641, prob = 1016, count = 1, notice = 2, broadcast = false, hundred = 1016, qiangdu = 1}, --上古道镯
{itemid = 4642, prob = 1015, count = 1, notice = 2, broadcast = false, hundred = 1015, qiangdu = 1}, --上古道戒
{itemid = 4643, prob = 1013, count = 1, notice = 2, broadcast = false, hundred = 1013, qiangdu = 1}, --上古道带
{itemid = 4644, prob = 1012, count = 1, notice = 2, broadcast = false, hundred = 1012, qiangdu = 1}, --上古道靴

{itemid = 4627, prob = 1616, count = 1, notice = 2, broadcast = false, hundred = 1616, qiangdu = 1}, --上古拂尘
{itemid = 4628, prob = 1617, count = 1, notice = 2, broadcast = false, hundred = 1617, qiangdu = 1}, --上古魔袍(男)
{itemid = 4629, prob = 1618, count = 1, notice = 2, broadcast = false, hundred = 1618, qiangdu = 1}, --上古魔袍(女)
{itemid = 4630, prob = 1018, count = 1, notice = 2, broadcast = false, hundred = 1018, qiangdu = 1}, --上古法盔
{itemid = 4631, prob = 1017, count = 1, notice = 2, broadcast = false, hundred = 1017, qiangdu = 1}, --上古法链
{itemid = 4632, prob = 1016, count = 1, notice = 2, broadcast = false, hundred = 1016, qiangdu = 1}, --上古法镯
{itemid = 4633, prob = 1015, count = 1, notice = 2, broadcast = false, hundred = 1015, qiangdu = 1}, --上古法戒
{itemid = 4634, prob = 1013, count = 1, notice = 2, broadcast = false, hundred = 1013, qiangdu = 1}, --上古法带
{itemid = 4635, prob = 1012, count = 1, notice = 2, broadcast = false, hundred = 1012, qiangdu = 1}, --上古法靴

{itemid = 5125, prob = 108, count = 1, notice = 0, broadcast = false, hundred = 108, qiangdu = 0}, --初级BOSS挑战卷
{itemid = 5126, prob = 158, count = 1, notice = 2, broadcast = false, hundred = 158, qiangdu = 0}, --中级BOSS挑战卷
{itemid = 5127, prob = 258, count = 1, notice = 2, broadcast = false, hundred = 258, qiangdu = 0}, --高级BOSS挑战卷
{itemid = 6127, prob = 258, count = 1, notice = 2, broadcast = false, hundred = 258, qiangdu = 0}, --军魂BOSS召唤令

{itemid = 451, prob = 899, count = 1, notice = 2, broadcast = false, hundred = 899, qiangdu = 1}, --毁灭灵盔
{itemid = 452, prob = 898, count = 1, notice = 2, broadcast = false, hundred = 898, qiangdu = 1}, --毁灭灵链
{itemid = 453, prob = 897, count = 1, notice = 2, broadcast = false, hundred = 897, qiangdu = 1}, --毁灭灵镯
{itemid = 454, prob = 896, count = 1, notice = 2, broadcast = false, hundred = 896, qiangdu = 1}, --毁灭灵戒
{itemid = 455, prob = 895, count = 1, notice = 2, broadcast = false, hundred = 895, qiangdu = 1}, --毁灭灵带
{itemid = 456, prob = 893, count = 1, notice = 2, broadcast = false, hundred = 893, qiangdu = 1}, --毁灭灵靴
{itemid = 448, prob = 799, count = 1, notice = 2, broadcast = false, hundred = 799, qiangdu = 1}, --毁灭灵斩
{itemid = 449, prob = 798, count = 1, notice = 2, broadcast = false, hundred = 798, qiangdu = 1}, --毁灭灵甲(男)
{itemid = 450, prob = 797, count = 1, notice = 2, broadcast = false, hundred = 797, qiangdu = 1}, --毁灭灵甲(女)

{itemid = 442, prob = 688, count = 1, notice = 2, broadcast = false, hundred = 688, qiangdu = 1}, --通天神盔
{itemid = 443, prob = 689, count = 1, notice = 2, broadcast = false, hundred = 689, qiangdu = 1}, --通天神链
{itemid = 444, prob = 687, count = 1, notice = 2, broadcast = false, hundred = 687, qiangdu = 1}, --通天神镯
{itemid = 445, prob = 686, count = 1, notice = 2, broadcast = false, hundred = 686, qiangdu = 1}, --通天神戒
{itemid = 446, prob = 685, count = 1, notice = 2, broadcast = false, hundred = 685, qiangdu = 1}, --通天神带
{itemid = 447, prob = 683, count = 1, notice = 2, broadcast = false, hundred = 683, qiangdu = 1}, --通天神靴
{itemid = 439, prob = 477, count = 1, notice = 2, broadcast = false, hundred = 477, qiangdu = 1}, --通天神棍
{itemid = 440, prob = 475, count = 1, notice = 2, broadcast = false, hundred = 475, qiangdu = 1}, --通天神甲(男)
{itemid = 441, prob = 474, count = 1, notice = 2, broadcast = false, hundred = 474, qiangdu = 1}, --通天神甲(女)

{itemid = 433, prob = 520, count = 1, notice = 2, broadcast = false, hundred = 520, qiangdu = 1}, --霸主血盔
{itemid = 434, prob = 519, count = 1, notice = 2, broadcast = false, hundred = 519, qiangdu = 1}, --霸主血链
{itemid = 435, prob = 518, count = 1, notice = 2, broadcast = false, hundred = 518, qiangdu = 1}, --霸主血镯
{itemid = 436, prob = 516, count = 1, notice = 2, broadcast = false, hundred = 516, qiangdu = 1}, --霸主血戒
{itemid = 437, prob = 513, count = 1, notice = 2, broadcast = false, hundred = 513, qiangdu = 1}, --霸主血带
{itemid = 438, prob = 511, count = 1, notice = 2, broadcast = false, hundred = 511, qiangdu = 1}, --霸主血靴
{itemid = 430, prob = 253, count = 1, notice = 2, broadcast = false, hundred = 253, qiangdu = 1}, --霸主血剑
{itemid = 431, prob = 251, count = 1, notice = 2, broadcast = false, hundred = 251, qiangdu = 1}, --霸主血甲(男)
{itemid = 432, prob = 250, count = 1, notice = 2, broadcast = false, hundred = 250, qiangdu = 1}, --霸主血甲(女)
{itemid = 7197, prob = 99, count = 1, notice = 2, broadcast = false, hundred = 88, qiangdu = 0}, --玛法晶块
{itemid = 493, prob = 88, count = 1, notice = 2, broadcast = false, hundred = 88, qiangdu = 0}, --翅膀魂石·白虎
{itemid = 494, prob = 89, count = 1, notice = 2, broadcast = false, hundred = 89, qiangdu = 0}, --翅膀魂石·青龙
{itemid = 495, prob = 90, count = 1, notice = 2, broadcast = false, hundred = 90, qiangdu = 0}, --翅膀魂石·朱雀
{itemid = 6736, prob = 38, count = 1, notice = 2, broadcast = false, hundred = 58, qiangdu = 0}, --突破丹

-- {itemid = 421, prob = 45, count = 1, notice = 0, broadcast = false, hundred = 45, qiangdu = 1}, --十方刃
-- {itemid = 422, prob = 46, count = 1, notice = 0, broadcast = false, hundred = 46, qiangdu = 1}, --十方甲(男)
-- {itemid = 423, prob = 47, count = 1, notice = 0, broadcast = false, hundred = 47, qiangdu = 1}, --十方甲(女)
-- {itemid = 424, prob = 48, count = 1, notice = 0, broadcast = false, hundred = 48, qiangdu = 1}, --十方盔
-- {itemid = 425, prob = 49, count = 1, notice = 0, broadcast = false, hundred = 49, qiangdu = 1}, --十方链
-- {itemid = 426, prob = 50, count = 1, notice = 0, broadcast = false, hundred = 50, qiangdu = 1}, --十方镯
-- {itemid = 427, prob = 51, count = 1, notice = 0, broadcast = false, hundred = 51, qiangdu = 1}, --十方戒
-- {itemid = 428, prob = 52, count = 1, notice = 0, broadcast = false, hundred = 52, qiangdu = 1}, --十方带
-- {itemid = 429, prob = 53, count = 1, notice = 0, broadcast = false, hundred = 53, qiangdu = 1}, --十方靴
{itemid = 5651, prob = 38, count = 1, notice = 0, broadcast = false, hundred = 20, qiangdu = 0}, --来
{itemid = 5652, prob = 37, count = 1, notice = 0, broadcast = false, hundred = 17, qiangdu = 0}, --袭
{itemid = 5650, prob = 28, count = 1, notice = 0, broadcast = false, hundred = 15, qiangdu = 0}, --典
{itemid = 5649, prob = 26, count = 1, notice = 0, broadcast = false, hundred = 13, qiangdu = 0}, --庆
{itemid = 511, prob = 1, count = 1, notice = 0, broadcast = false, hundred = 1, qiangdu = 0}, --经验

					},
				},
                               {
					count = 250,	--寻宝次数大于此值才会进入
					maxcount = 9999,	--寻宝次数等于此值必定进入
					limit = 1,		--限制进入次数,-1为不限制
					prob = 5,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
						{itemid = 5656, prob = 50, count = 1, notice = true, hundred = 26},  --服
						{itemid = 5655, prob = 58, count = 1, notice = true, hundred = 10},  --全
						{itemid = 5654, prob = 5 , count = 1, notice = true, hundred = 3 },  --爆
						{itemid = 5653, prob = 4 , count = 1, notice = true, hundred = 1 },  --嗨
					},
				},
				{
					money = 30000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
{itemid = 7078, prob = 30, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --雷神锤
{itemid = 7079, prob = 20, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --雷神甲
{itemid = 7080, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --雷神盔
{itemid = 7081, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --雷神项链
{itemid = 7082, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --雷神手镯
{itemid = 7083, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --雷神戒指
{itemid = 7084, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --雷神腰带
{itemid = 7085, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --雷神靴子


					},
				},
				{
					money = 7500,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
{itemid = 7052, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --凡·南明离火

					},
				},

				{
					money = 30000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
{itemid = 7057, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --魔躯
{itemid = 7058, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --血瞳
{itemid = 7059, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --鬼爪
{itemid = 7060, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --圣角

					},
				},
				{
					money = 50000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
{itemid = 6888, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --蓝凤凰
{itemid = 6892, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1398, qiangdu = 0}, --深海鱼王
{itemid = 6896, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1397, qiangdu = 0}, --远古苍龙
{itemid = 6900, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1396, qiangdu = 0}, --灵狐武者
{itemid = 6941, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1396, qiangdu = 0}, --远古麒麟
					},
				},

				{
					money = 40000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
{itemid = 6888, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1399, qiangdu = 0}, --蓝凤凰
{itemid = 6892, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1398, qiangdu = 0}, --深海鱼王
{itemid = 6896, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1397, qiangdu = 0}, --远古苍龙
{itemid = 6900, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1396, qiangdu = 0}, --灵狐武者
{itemid = 6941, prob = 10, count = 1, notice = 2, broadcast = true, hundred = 1396, qiangdu = 0}, --远古麒麟

					},
				},
				{
					money = 50000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 10,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
{itemid = 108, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 12853, qiangdu = 1}, --冲天道盔
{itemid = 109, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 12854, qiangdu = 1}, --冲天道链
{itemid = 110, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 12855, qiangdu = 1}, --冲天道腕
{itemid = 111, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 12856, qiangdu = 1}, --冲天道戒
{itemid = 112, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 12857, qiangdu = 1}, --冲天道带
{itemid = 113, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 12858, qiangdu = 1}, --冲天道靴
					},
				},

{
					money = 180000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 2,

					--道具列表
					items = 
					{
						--id,概率,数量,广播

{itemid = 135, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50311, qiangdu = 1}, --菩提道仙盔
{itemid = 136, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50312, qiangdu = 1}, --菩提道仙链
{itemid = 137, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50313, qiangdu = 1}, --菩提道仙腕
{itemid = 138, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50314, qiangdu = 1}, --菩提道仙戒
{itemid = 139, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50315, qiangdu = 1}, --菩提道仙带
{itemid = 140, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50316, qiangdu = 1}, --菩提道仙靴
					},
				},


				{
					money = 360000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 2,

					--道具列表
					items = 
					{
						--id,概率,数量,广播

{itemid = 162, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50311, qiangdu = 1}, --无尘道幻盔    
{itemid = 163, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50312, qiangdu = 1}, --无尘道幻链    
{itemid = 164, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50313, qiangdu = 1}, --无尘道幻腕    
{itemid = 165, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50314, qiangdu = 1}, --无尘道幻戒    
{itemid = 166, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50315, qiangdu = 1}, --无尘道幻带    
{itemid = 167, prob = 18, count = 1, notice = 2, broadcast = true, hundred = 50316, qiangdu = 1}, --无尘道幻靴   
					},
				},
						{
					money = 100000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 300,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
{itemid = 6362, prob = 300, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --至尊屠龙刀 
{itemid = 6945, prob = 300, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --至尊屠龙甲   
{itemid = 6946, prob = 300, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --至尊屠龙甲   
					},
				},

{
					money = 80000,	--寻宝花费数大于此值才会进入此表
					limit = 1,		--限制进入次数,-1为不限制
					prob = 200,

					--道具列表
					items = 
					{
						--id,概率,数量,广播
{itemid = 6947, prob = 200, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --至尊屠龙盔  
{itemid = 6948, prob = 200, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --至尊屠龙项链   
{itemid = 6949, prob = 200, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --至尊屠龙戒 
{itemid = 6950, prob = 200, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --至尊屠龙手镯 
{itemid = 6951, prob = 200, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --至尊屠龙腰带 
{itemid = 6952, prob = 200, count = 1, notice = 2, broadcast = true, hundred = 50299, qiangdu = 1}, --至尊屠龙靴子 
					},
				},

			},
		},
	},
},