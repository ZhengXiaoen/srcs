--三味真火 2016/12/30 zer
--#include "data\config\equipSynthesis\EquipDragonCfg.lua" once
local t = {  --第一个是物品id， 第2个是物品王状态的属性idx, 第3个是回收和升级需求, 第4个是职业判定
	data={
		[1] = { 4618 , 1 , 3 , 1 , 250000 },
		[2] = { 4619 , 1 , 2 , 1 , 250000 },
		[3] = { 4620 , 1 , 2 , 1 , 250000 },
		[4] = { 4621 , 13 , 1 , 1 , 250000 },
		[5] = { 4622 , 13 , 1 , 1 , 250000 },
		[6] = { 4623 , 13 , 1 , 1 , 250000 },
		[7] = { 4624 , 13 , 1 , 1 , 250000 },
		[8] = { 4625 , 13 , 1 , 1 , 250000 },
		[9] = { 4626 , 13 , 1 , 1 , 250000 },
		
		[10] = { 4627 , 1 , 3 , 2 , 250000 },
		[11] = { 4628 , 1 , 2 , 2 , 250000 },
		[12] = { 4629 , 1 , 2 , 2 , 250000 },
		[13] = { 4630 , 13 , 1 , 2 , 250000 },
		[14] = { 4631 , 13 , 1 , 2 , 250000 },
		[15] = { 4632 , 13 , 1 , 2 , 250000 },
		[16] = { 4633 , 13 , 1 , 2 , 250000 },
		[17] = { 4634 , 13 , 1 , 2 , 250000 },
		[18] = { 4635 , 13 , 1 , 2 , 250000 },
		
		[19] = { 4636 , 1 , 3 , 3 , 250000 },
		[20] = { 4637 , 1 , 2 , 3 , 250000 },
		[21] = { 4638 , 1 , 2 , 3 , 250000 },
		[22] = { 4639 , 13 , 1 , 3 , 250000 },
		[23] = { 4640 , 13 , 1 , 3 , 250000 },
		[24] = { 4641 , 13 , 1 , 3 , 250000 },
		[25] = { 4642 , 13 , 1 , 3 , 250000 },
		[26] = { 4643 , 13 , 1 , 3 , 250000 },
		[27] = { 4644 , 13 , 1 , 3 , 250000 },
		
		[28] = { 4645 , 3 , 18 , 1 , 500000 },
		[29] = { 4646 , 3 , 12 , 1 , 500000 },
		[30] = { 4647 , 3 , 12 , 1 , 500000 },
		[31] = { 4648 , 15 , 6 , 1 , 500000 },
		[32] = { 4649 , 15 , 6 , 1 , 500000 },
		[33] = { 4650 , 15 , 6 , 1 , 500000 },
		[34] = { 4651 , 15 , 6 , 1 , 500000 },
		[35] = { 4652 , 15 , 6 , 1 , 500000 },
		[36] = { 4653 , 15 , 6 , 1 , 500000 },
		
		[37] = { 4654 , 3 , 18 , 2 , 500000 },
		[38] = { 4655 , 3 , 12 , 2 , 500000 },
		[39] = { 4656 , 3 , 12 , 2 , 500000 },
		[40] = { 4657 , 15 , 6 , 2 , 500000 },
		[41] = { 4658 , 15 , 6 , 2 , 500000 },
		[42] = { 4659 , 15 , 6 , 2 , 500000 },
		[43] = { 4660 , 15 , 6 , 2 , 500000 },
		[44] = { 4661 , 15 , 6 , 2 , 500000 },
		[45] = { 4662 , 15 , 6 , 2 , 500000 },
		
		[46] = { 4663 , 3 , 18 , 3 , 500000 },
		[47] = { 4664 , 3 , 12 , 3 , 500000 },
		[48] = { 4665 , 3 , 12 , 3 , 500000 },
		[49] = { 4666 , 15 , 6 , 3 , 500000 },
		[50] = { 4667 , 15 , 6 , 3 , 500000 },
		[51] = { 4668 , 15 , 6 , 3 , 500000 },
		[52] = { 4669 , 15 , 6 , 3 , 500000 },
		[53] = { 4670 , 15 , 6 , 3 , 500000 },
		[54] = { 4671 , 15 , 6 , 3 , 500000 },
		
		[55] = { 4672 , 5 , 54 , 1 , 1000000 },
		[56] = { 4673 , 5 , 36 , 1 , 1000000 },
		[57] = { 4674 , 5 , 36 , 1 , 1000000 },
		[58] = { 4675 , 17 , 18 , 1 , 1000000 },
		[59] = { 4676 , 17 , 18 , 1 , 1000000 },
		[60] = { 4677 , 17 , 18 , 1 , 1000000 },
		[61] = { 4678 , 17 , 18 , 1 , 1000000 },
		[62] = { 4679 , 17 , 18 , 1 , 1000000 },
		[63] = { 4680 , 17 , 18 , 1 , 1000000 },
		
		[64] = { 4681 , 5 , 54 , 2 , 1000000 },
		[65] = { 4682 , 5 , 36 , 2 , 1000000 },
		[66] = { 4683 , 5 , 36 , 2 , 1000000 },
		[67] = { 4684 , 17 , 18 , 2 , 1000000 },
		[68] = { 4685 , 17 , 18 , 2 , 1000000 },
		[69] = { 4686 , 17 , 18 , 2 , 1000000 },
		[70] = { 4687 , 17 , 18 , 2 , 1000000 },
		[71] = { 4688 , 17 , 18 , 2 , 1000000 },
		[72] = { 4689 , 17 , 18 , 2 , 1000000 },
		
		[73] = { 4690 , 5 , 54 , 3 , 1000000 },
		[74] = { 4691 , 5 , 36 , 3 , 1000000 },
		[75] = { 4692 , 5 , 36 , 3 , 1000000 },
		[76] = { 4693 , 17 , 18 , 3 , 1000000 },
		[77] = { 4694 , 17 , 18 , 3 , 1000000 },
		[78] = { 4695 , 17 , 18 , 3 , 1000000 },
		[79] = { 4696 , 17 , 18 , 3 , 1000000 },
		[80] = { 4697 , 17 , 18 , 3 , 1000000 },
		[81] = { 4698 , 17 , 18 , 3 , 1000000 },
		
		[82] = { 87 , 7 , 162 , 1 , 2000000 },
		[83] = { 88 , 7 , 108 , 1 , 2000000 },
		[84] = { 89 , 7 , 108 , 1 , 2000000 },
		[85] = { 90 , 19 , 54 , 1 , 2000000 },
		[86] = { 91 , 19 , 54 , 1 , 2000000 },
		[87] = { 92 , 19 , 54 , 1 , 2000000 },
		[88] = { 93 , 19 , 54 , 1 , 2000000 },
		[89] = { 94 , 19 , 54 , 1 , 2000000 },
		[90] = { 95 , 19 , 54 , 1 , 2000000 },
		
		[91] = { 96 , 7 , 162 , 2 , 2000000 },
		[92] = { 97 , 7 , 108 , 2 , 2000000 },
		[93] = { 98 , 7 , 108 , 2 , 2000000 },
		[94] = { 99 , 19 , 54 , 2 , 2000000 },
		[95] = { 100 , 19 , 54 , 2 , 2000000 },
		[96] = { 101 , 19 , 54 , 2 , 2000000 },
		[97] = { 102 , 19 , 54 , 2 , 2000000 },
		[98] = { 103 , 19 , 54 , 2 , 2000000 },
		[99] = { 104 , 19 , 54 , 2 , 2000000 },
		
		[100] = { 105 , 7 , 162 , 3 , 2000000 },
		[101] = { 106 , 7 , 108 , 3 , 2000000 },
		[102] = { 107 , 7 , 108 , 3 , 2000000 },
		[103] = { 108 , 19 , 54 , 3 , 2000000 },
		[104] = { 109 , 19 , 54 , 3 , 2000000 },
		[105] = { 110 , 19 , 54 , 3 , 2000000 },
		[106] = { 111 , 19 , 54 , 3 , 2000000 },
		[107] = { 112 , 19 , 54 , 3 , 2000000 },
		[108] = { 113 , 19 , 54 , 3 , 2000000 },
		
		[109] = { 114 , 9 , 486 , 1 , 4000000 },
		[110] = { 115 , 9 , 324 , 1 , 4000000 },
		[111] = { 116 , 9 , 324 , 1 , 4000000 },
		[112] = { 117 , 21 , 162 , 1 , 4000000 },
		[113] = { 118 , 21 , 162 , 1 , 4000000 },
		[114] = { 119 , 21 , 162 , 1 , 4000000 },
		[115] = { 120 , 21 , 162 , 1 , 4000000 },
		[116] = { 121 , 21 , 162 , 1 , 4000000 },
		[117] = { 122 , 21 , 162 , 1 , 4000000 },
		
		[118] = { 123 , 9 , 486 , 2 , 4000000 },
		[119] = { 124 , 9 , 324 , 2 , 4000000 },
		[120] = { 125 , 9 , 324 , 2 , 4000000 },
		[121] = { 126 , 21 , 162 , 2 , 4000000 },
		[122] = { 127 , 21 , 162 , 2 , 4000000 },
		[123] = { 128 , 21 , 162 , 2 , 4000000 },
		[124] = { 129 , 21 , 162 , 2 , 4000000 },
		[125] = { 130 , 21 , 162 , 2 , 4000000 },
		[126] = { 131 , 21 , 162 , 2 , 4000000 },
		
		[127] = { 132 , 9 , 486 , 3 , 4000000 },
		[128] = { 133 , 9 , 324 , 3 , 4000000 },
		[129] = { 134 , 9 , 324 , 3 , 4000000 },
		[130] = { 135 , 21 , 162 , 3 , 4000000 },
		[131] = { 136 , 21 , 162 , 3 , 4000000 },
		[132] = { 137 , 21 , 162 , 3 , 4000000 },
		[133] = { 138 , 21 , 162 , 3 , 4000000 },
		[134] = { 139 , 21 , 162 , 3 , 4000000 },
		[135] = { 140 , 21 , 162 , 3 , 4000000 },
		
		[136] = { 141 , 11 , 1458 , 1 , 8000000 },
		[137] = { 142 , 11 , 972 , 1 , 8000000 },
		[138] = { 143 , 11 , 972 , 1 , 8000000 },
		[139] = { 144 , 23 , 486 , 1 , 8000000 },
		[140] = { 145 , 23 , 486 , 1 , 8000000 },
		[141] = { 146 , 23 , 486 , 1 , 8000000 },
		[142] = { 147 , 23 , 486 , 1 , 8000000 },
		[143] = { 148 , 23 , 486 , 1 , 8000000 },
		[144] = { 149 , 23 , 486 , 1 , 8000000 },
		
		[145] = { 150 , 11 , 1458 , 2 , 8000000 },
		[146] = { 151 , 11 , 972 , 2 , 8000000 },
		[147] = { 152 , 11 , 972 , 2 , 8000000 },
		[148] = { 153 , 23 , 486 , 2 , 8000000 },
		[149] = { 154 , 23 , 486 , 2 , 8000000 },
		[150] = { 155 , 23 , 486 , 2 , 8000000 },
		[151] = { 156 , 23 , 486 , 2 , 8000000 },
		[152] = { 157 , 23 , 486 , 2 , 8000000 },
		[153] = { 158 , 23 , 486 , 2 , 8000000 },
		
		[154] = { 159 , 11 , 1458 , 3 , 8000000 },
		[155] = { 160 , 11 , 972 , 3 , 8000000 },
		[156] = { 161 , 11 , 972 , 3 , 8000000 },
		[157] = { 162 , 23 , 486 , 3 , 8000000 },
		[158] = { 163 , 23 , 486 , 3 , 8000000 },
		[159] = { 164 , 23 , 486 , 3 , 8000000 },
		[160] = { 165 , 23 , 486 , 3 , 8000000 },
		[161] = { 166 , 23 , 486 , 3 , 8000000 },
		[162] = { 167 , 23 , 486 , 3 , 8000000 },




		[163] = { 168 , 25 , 1458 , 1 , 12000000 },
		[164] = { 169 , 25 , 972 , 1 , 12000000 },
		[165] = { 170 , 25 , 972 , 1 , 12000000 },
		[166] = { 171 , 27 , 486 , 1 , 12000000 },
		[167] = { 172 , 27 , 486 , 1 , 12000000 },
		[168] = { 173 , 27 , 486 , 1 , 12000000 },
		[169] = { 174 , 27 , 486 , 1 , 12000000 },
		[170] = { 175 , 27 , 486 , 1 , 12000000 },
		[171] = { 176 , 27 , 486 , 1 , 12000000 },
		
		[172] = { 177 , 25 , 1458 , 2 , 12000000 },
		[173] = { 178 , 25 , 972 , 2 , 12000000 },
		[174] = { 179 , 25 , 972 , 2 , 12000000 },
		[175] = { 180 , 27 , 486 , 2 , 12000000 },
		[176] = { 181 , 27 , 486 , 2 , 12000000 },
		[177] = { 182 , 27 , 486 , 2 , 12000000 },
		[178] = { 183 , 27 , 486 , 2 , 12000000 },
		[179] = { 184 , 27 , 486 , 2 , 12000000 },
		[180] = { 185 , 27 , 486 , 2 , 12000000 },
		
		[181] = { 186 , 25 , 1458 , 3 , 12000000 },
		[182] = { 187 , 25 , 972 , 3 , 12000000 },
		[183] = { 188 , 25 , 972 , 3 , 12000000 },
		[184] = { 189 , 27 , 486 , 3 , 12000000 },
		[185] = { 190 , 27 , 486 , 3 , 12000000 },
		[186] = { 191 , 27 , 486 , 3 , 12000000 },
		[187] = { 192 , 27 , 486 , 3 , 12000000 },
		[188] = { 193 , 27 , 486 , 3 , 12000000 },
		[189] = { 194 , 27 , 486 , 3 , 12000000 },

	},
	classA = {
		{
			{ name = "上古战装", zslv = 4, wdlv = "王", wdid = 1, min = 1, max = 9, },
			{ name = "上古法装", zslv = 4, wdlv = "王", wdid = 1, min = 10, max = 18, },
			{ name = "上古道装", zslv = 4, wdlv = "王", wdid = 1, min = 19, max = 27, },
		},
		{
			{ name = "起源战装", zslv = 5, wdlv = "王", wdid = 1, min = 28, max = 36, },
			{ name = "起源法装", zslv = 5, wdlv = "王", wdid = 1, min = 37, max = 45, },
			{ name = "起源道装", zslv = 5, wdlv = "王", wdid = 1, min = 46, max = 54, },
		},
		{
			{ name = "誓言战装", zslv = 6, wdlv = "王", wdid = 1, min = 55, max = 63, },
			{ name = "誓言法装", zslv = 6, wdlv = "王", wdid = 1, min = 64, max = 72, },
			{ name = "誓言道装", zslv = 6, wdlv = "王", wdid = 1, min = 73, max = 81, },
		},
		{
			{ name = "冲天战装", zslv = 7, wdlv = "王", wdid = 1, min = 82, max = 90, },
			{ name = "冲天法装", zslv = 7, wdlv = "王", wdid = 1, min = 91, max = 99, },
			{ name = "冲天道装", zslv = 7, wdlv = "王", wdid = 1, min = 100, max = 108, },
		},
		{
			{ name = "菩提战装", zslv = 9, wdlv = "王", wdid = 1, min = 109, max = 117, },
			{ name = "菩提法装", zslv = 9, wdlv = "王", wdid = 1, min = 118, max = 126, },
			{ name = "菩提道装", zslv = 9, wdlv = "王", wdid = 1, min = 127, max = 135, },
		},
		{
			{ name = "无尘战装", zslv = 11, wdlv = "王", wdid = 1, min = 136, max = 144, },
			{ name = "无尘法装", zslv = 11, wdlv = "王", wdid = 1, min = 145, max = 153, },
			{ name = "无尘道装", zslv = 11, wdlv = "王", wdid = 1, min = 154, max = 162, },
		},
		{
			{ name = "芙蓉战装", zslv = 13, wdlv = "王", wdid = 1, min = 163, max = 171, },
			{ name = "芙蓉法装", zslv = 13, wdlv = "王", wdid = 1, min = 172, max = 180, },
			{ name = "芙蓉道装", zslv = 13, wdlv = "王", wdid = 1, min = 181, max = 189, },
		},
	},
	classB = {
		{
			{ name = "上古战装", zslv = 4, wdlv = "帝", wdid = 2, min = 1, max = 9, },
			{ name = "上古法装", zslv = 4, wdlv = "帝", wdid = 2, min = 10, max = 18, },
			{ name = "上古道装", zslv = 4, wdlv = "帝", wdid = 2, min = 19, max = 27, },
		},
		{
			{ name = "起源战装", zslv = 5, wdlv = "帝", wdid = 2, min = 28, max = 36, },
			{ name = "起源法装", zslv = 5, wdlv = "帝", wdid = 2, min = 37, max = 45, },
			{ name = "起源道装", zslv = 5, wdlv = "帝", wdid = 2, min = 46, max = 54, },
		},
		{
			{ name = "誓言战装", zslv = 6, wdlv = "帝", wdid = 2, min = 55, max = 63, },
			{ name = "誓言法装", zslv = 6, wdlv = "帝", wdid = 2, min = 64, max = 72, },
			{ name = "誓言道装", zslv = 6, wdlv = "帝", wdid = 2, min = 73, max = 81, },
		},
		{
			{ name = "冲天战装", zslv = 7, wdlv = "帝", wdid = 2, min = 82, max = 90, },
			{ name = "冲天法装", zslv = 7, wdlv = "帝", wdid = 2, min = 91, max = 99, },
			{ name = "冲天道装", zslv = 7, wdlv = "帝", wdid = 2, min = 100, max = 108, },
		},
		{
			{ name = "菩提战装", zslv = 9, wdlv = "帝", wdid = 2, min = 109, max = 117, },
			{ name = "菩提法装", zslv = 9, wdlv = "帝", wdid = 2, min = 118, max = 126, },
			{ name = "菩提道装", zslv = 9, wdlv = "帝", wdid = 2, min = 127, max = 135, },
		},
		{
			{ name = "无尘战装", zslv = 11, wdlv = "帝", wdid = 2, min = 136, max = 144, },
			{ name = "无尘法装", zslv = 11, wdlv = "帝", wdid = 2, min = 145, max = 153, },
			{ name = "无尘道装", zslv = 11, wdlv = "帝", wdid = 2, min = 154, max = 162, },
		},
		{
			{ name = "芙蓉战装", zslv = 13, wdlv = "帝", wdid = 2, min = 163, max = 171, },
			{ name = "芙蓉法装", zslv = 13, wdlv = "帝", wdid = 2, min = 172, max = 180, },
			{ name = "芙蓉道装", zslv = 13, wdlv = "帝", wdid = 2, min = 181, max = 189, },
		},
	},
	classC = {316,317,318},

};

t.main = function(sysarg)

	local str = {
		"3件相同装备即可合成1件王级装备#王级装备增加大量生命值和暴击伤害",
		"3件相同的王级装备即可合成1件帝级装备#帝级装备增加大量生命值、暴击伤害、准确或闪避",
		"   <(ifragments#16#18)><(c0xFFb6946c)%s转:> <#c0xFFFF00FF#锻造%s·%s/@onDzwdZ,%s,%s,%s|%s>  <#c0xFFFF00FF#锻造%s·%s/@onDzwdZ,%s,%s,%s|%s>\\",
		"   <(ifragments#16#18)><(c0xFFb6946c)%s转:> <#c0xFFFF00FF#进阶获得%s/@onItemLvUp,%s,%s,%s|%s>  <#c0xFFFF00FF#进阶获得%s·%s/@onItemLvUp,%s,%s,%s|%s>\\",
		"王级装备加X界灵石可进阶为下级转生装备##例: 4转王级+X界灵石=5转普通装",
		"帝级装备加X界灵石可进阶为下级转生王级装备##例: 4转帝级+X界灵石=5转王级装备",
		"   <(ifragments#16#18)><(c0xFFb6946c)%s转:> <#c0xFFFF00FF#%s/@onDelItem,%s,%s,%s>  <#c0xFFFF00FF#%s·%s/@onDelItem,%s,%s,%s>  <#c0xFFFF00FF#%s·%s/@onDelItem,%s,%s,%s>\\",
	};

	local nCircle = Actor.getIntProperty(sysarg,PROP_ACTOR_CIRCLE);
	local nJob = Actor.getIntProperty(sysarg,PROP_ACTOR_VOCATION);
	
	local colorOfWord_red = "(c0xFFdb1313)"
	local colorOfWord_green = "(c0xFF00FF00)"
	local function r_or_green(index)
		if nCircle<index then 
			return colorOfWord_red
		else 
			return colorOfWord_green
		end
	end
	
	local e =""
	
	e = e.."		<(c0xFFffff00)4转以上装备可以进行锻造> <查看锻造说明/@sanweizhenhuotips>\\"
	
	local tips = "<(c0xFFb6946c)角色达到对应转生级别可以锻造高转装备.角色达到：>\\<(ifragments#16#18)><"..r_or_green(2).."2转可锻造4转装备.><(ifragments#16#18)><"..r_or_green(3).."3转可锻造5转装备.><(ifragments#16#18)><"..r_or_green(4).."4转可锻造6转装备.><(ifragments#16#18)><"..r_or_green(5).."5转可锻造7转装备.><(ifragments#16#18)><"..r_or_green(7).."7转可锻造9转装备.><(ifragments#16#18)><"..r_or_green(8).."8转可锻造11转装备><(ifragments#16#18)><"..r_or_green(9).."9转可锻造13转装备>\\";
	for i = 1,table.getn(t.classA) do
		local ca = t.classA[i][nJob];
		local cb = t.classB[i][nJob];
		if nCircle >= (ca.zslv - 2) or nCircle>=8  then --如果为8转，可以看见全部的
			e = e .. string.format(str[3], ca.zslv,  ca.wdlv,ca.name, ca.min, ca.max, ca.wdid, str[1], cb.wdlv,cb.name,  cb.min, cb.max, cb.wdid, str[2] );
		end
	end

	--e = e .. "\\<(idecoLine#330)>\\  <(c0xFFb6946c)请选择品级进阶的装备:><(直接获得更高级装备)>\\";
	--for i = 2,table.getn(t.classA) do
	--	local ca = t.classA[i][nJob];
	--	local cb = t.classB[i][nJob];
	--	if nCircle >= (ca.zslv - 2) then
	--		e = e .. string.format(str[4], ca.zslv, ca.name, ca.min, ca.max, ca.wdid, str[5], ca.name, ca.wdlv, ca.min, ca.max, ca.wdid + 1, str[6] );
	--	end
	--end
    --
	--local delItemId = t.classC[nJob];
	--e = e .. string.format("\\<(idecoLine#330)>\\  <(c0xFFb6946c)请选择需要回收炼化的装备:(回收炼化只会获得>%s<(c0xFFb6946c))>\\", Item.getItemLinkMsg(delItemId));
	--for i = 1,table.getn(t.classA) do
	--	local ca = t.classA[i][nJob];
	--	local cb = t.classB[i][nJob];
	--	if nCircle >= (ca.zslv - 2) then
	--		e = e .. string.format(str[7], ca.zslv, ca.name, ca.min, ca.max, ca.wdid, ca.name, ca.wdlv, ca.min, ca.max, ca.wdid + 1, ca.name, cb.wdlv, ca.min, ca.max, ca.wdid + 2 );
	--	end
	--end
	
	--e = e .."\\\\	<回收/@HuiShouNew>"
	
	--回收
	
	e = e.."<(idecoLine#350)>"
	
	
	local str2 = "   <(ifragments#16#18)><(c0xFFb6946c)%s转:> <#c0xFFFF00FF#回收%s·%s/@onHuiShouNew,%s,%s,%s>  <#c0xFFFF00FF#回收%s·%s/@onHuiShouNew,%s,%s,%s>\\"
	
	local nCircle = Actor.getIntProperty(sysarg,PROP_ACTOR_CIRCLE);
	local nJob = Actor.getIntProperty(sysarg,PROP_ACTOR_VOCATION);
	
	--计算显示颜色
	local colorOfWord_red = "(c0xFFdb1313)"
	local colorOfWord_green = "(c0xFF00FF00)"
	local function r_or_green(index)
		if nCircle<index then 
			return colorOfWord_red
		else 
			return colorOfWord_green
		end
	end
	
	--显示
	--e = e.."<(idecoLine#350)>\\<(ifragments#16#18)><"..r_or_green(2).."2转可回收4转王帝.><(ifragments#16#18)><"..r_or_green(3).."3转可回收5转王帝.><(ifragments#16#18)><"..r_or_green(4).."4转可回收6转王帝.>\\";
	tips =tips .."<(idecoLine#350)>\\<(ifragments#16#18)><"..r_or_green(2).."2转可回收4转王帝.><(ifragments#16#18)><"..r_or_green(3).."3转可回收5转王帝.><(ifragments#16#18)><"..r_or_green(4).."4转可回收6转王帝.>\\";
	for i = 1,table.getn(t.classA)-3 do
		local ca = t.classA[i][nJob];
		local cb = t.classB[i][nJob];
		if nCircle >= (ca.zslv - 2) then
			e = e .. string.format(str2, ca.zslv, ca.wdlv,ca.name,  ca.min, ca.max, ca.wdid, cb.wdlv,cb.name,  cb.min, cb.max, cb.wdid);
		end
	end
	
	-- if nCircle>=7 then 
	-- 	e = e .."<(idecoLine#350)>\\\\"
	-- 	--e = e .."	<(c0xFF00c0ff)可将冲天装备熔炼至菩提装备>	<前往熔炼/@QianWangRongLian,1>\\"
	-- 	if nCircle>=8 then 
	-- 	--	e = e .."	<(c0xFF00c0ff)可将菩提装备熔炼至无尘装备>	<前往熔炼/@QianWangRongLian,2>\\"
	-- 	end
	-- end	
	 e = e.."<(idecoLine#350)> <(c0xFF00c0ff)龍装系统><(c0xFFffff00)将龍之系列道具融合4转以上装备将获得大量增益属性>\\\\"
     e = e.." <龍装装备融合/@OnDragonEquipFuseList,1,1>  <龍装装备拆分/@OnDragonEquipFuseList,1,2>  <龍装道具合成/@OnDragonEquipComposeListEx> \\ 	<龍之道具来源:寻宝产出、材料合成>"  
	
	
	return e;
end
t.sanweizhenhuotips =function(sysarg)
	
	local nCircle = Actor.getIntProperty(sysarg,PROP_ACTOR_CIRCLE);
	local colorOfWord_red = "(c0xFFdb1313)"
	local colorOfWord_green = "(c0xFF00FF00)"
	local function r_or_green(index)
		if nCircle<index then 
			return colorOfWord_red
		else 
			return colorOfWord_green
		end
	end
	
	local tips = "<(c0xFFb6946c)角色达到对应转生级别可以锻造高转装备.角色达到：>\\<(ifragments#16#18)><"..r_or_green(2).."2转可锻造4转装备.><(ifragments#16#18)><"..r_or_green(3).."3转可锻造5转装备.><(ifragments#16#18)><"..r_or_green(4).."4转可锻造6转装备.><(ifragments#16#18)><"..r_or_green(5).."5转可锻造7转装备.><(ifragments#16#18)><"..r_or_green(7).."7转可锻造9转装备.><(ifragments#16#18)><"..r_or_green(8).."8转可锻造11转装备>.<(ifragments#16#18)><"..r_or_green(9).."9转可锻造13转装备>\\";
	tips =tips .."<(idecoLine#350)>\\<(ifragments#16#18)><"..r_or_green(2).."2转可回收4转王帝.><(ifragments#16#18)><"..r_or_green(3).."3转可回收5转王帝.><(ifragments#16#18)><"..r_or_green(4).."4转可回收6转王帝.>\\";
	Actor.sendTipmsg(sysarg,tips,4);
end

t.OnDragonEquipComposeListEx = function(sysarg)
   
     local cfg = EquipDragonCfg.Compose
    
     local str= "\\	<(c0xFF00c0ff)龍之道具来源:寻宝产出、材料合成>\\\\"
     for i = 1,#cfg do
        
        str = str.."	<"..cfg[i].name.."/@OnDragonEquipComposeList,"..i..">\\"
     end
	 str = str .."			<返回主页/@main> "
     return str
end
t.OnDragonEquipComposeList = function(sysarg,nIndex)
    nIndex = tonumber(nIndex)
    local cfg = EquipDragonCfg.Compose[nIndex].list
    local str= "\\	<(c0xFF00c0ff)龍之道具来源:寻宝产出、材料合成>\\\\"
    for i=1,#cfg do
        str = str..Item.getItemLinkMsg(cfg[i].itemid).." * "..cfg[i].count.." = "..Item.getItemLinkMsg(cfg[i].destid).."   	<合成/@OnDragonEquipCompose,"..nIndex..","..i..">\\"

    end
	str = str.."			\\			<返回上一页/@OnDragonEquipComposeListEx>"
    return str
end
t.OnDragonEquipCompose = function(sysarg,nIndex,i)
    nIndex = tonumber(nIndex)
    i = tonumber(i)
     local cfg = EquipDragonCfg.Compose[nIndex].list[i]
     if cfg == nil then return end 
     if Actor.getItemCount(sysarg, cfg.itemid) < cfg.count then
        Actor.sendTipmsg(sysarg, "材料不足,无法合成!", ttFlyTip)
        return
     end
     Actor.removeItem(sysarg, cfg.itemid, cfg.count, -1, -1, -1, "龙装合成",LogIds.longzuhanghecheng)
     Actor.addItem(sysarg,cfg.destid,0,0,1,0,0,"龙装合成",LogIds.longzuhanghecheng)
    
     Actor.sendTipmsg(sysarg, "合成成功!", ttFlyTip)

end
t.OnDragonEquipFuseList = function(sysarg,nIndex,nType)
    nType = tonumber(nType)
    local list= 
    {
        		"龍装Ⅰ",
         		"龍装Ⅱ",
                "龍装Ⅲ",
                "龍装Ⅳ",
                "龍装Ⅴ",
    }
    local sStr ="融合"
    if nType == 2 then sStr = "拆分" end
    local str = "<(idecoLine#350)> <(c0xFF00c0ff)龍装系统><(c0xFFffff00)将龍之系列道具融合4转以上装备将获得大量增益属性>\\\\		\\"
    for i =1,#list do
            str = str..string.format("	<%s%s/@OnDragonEquipFuse,%d,%d,%d>",list[i],sStr,i,nType,nIndex).."	\\\\"
    
    end 
	str = str .."\\\\			<返回主页/@main> "
    return str
end

local RongLian = 
{
	--7转换9转
	{
		--战士
		{
			{87,114,"冲天战刀","菩提彻地斩"},
			{88,115,"冲天战甲(男)","菩提战狂甲(男)"},
			{89,116,"冲天战甲(女)","菩提战狂甲(女)"},
			{90,117,"冲天战盔","菩提战狂盔"},
			{91,118,"冲天战链","菩提战狂链"},
			{92,119,"冲天战腕","菩提战狂腕"},
			{93,120,"冲天战戒","菩提战狂戒"},
			{94,121,"冲天战带","菩提战狂带"},
			{95,122,"冲天战靴","菩提战狂靴"},
			
			
		}
		,
		--法师
		{
			{96,123,"冲天魔杖","菩提骷髅杖"},
			{97,124,"冲天魔袍(男)","菩提法痴袍(男)"},
			{98,125,"冲天魔袍(女)","菩提法痴袍(女)"},
			{99,126,"冲天魔盔","菩提法痴盔"},
			{100,127,"冲天魔链","菩提法痴链"},
			{101,128,"冲天魔腕","菩提法痴腕"},
			{102,129,"冲天魔戒","菩提法痴戒"},
			{103,130,"冲天魔带","菩提法痴带"},
			{104,131,"冲天魔靴","菩提法痴靴"},
		}
		,
		--道士
		{
			{105,132,"冲天道剑","菩提金纹剑"},
			{106,133,"冲天道衣(男)","菩提道仙衣(男)"},
			{107,134,"冲天道衣(女)","菩提道仙衣(女)"},
			{108,135,"冲天道盔","菩提道仙盔"},
			{109,136,"冲天道链","菩提道仙链"},
			{110,137,"冲天道腕","菩提道仙腕"},
			{111,138,"冲天道戒","菩提道仙戒"},
			{112,139,"冲天道带","菩提道仙带"},
			{113,140,"冲天道靴","菩提道仙靴"},
		}
		,
	},
	
		--9转换11转
	{
		--战士
		{
			{87,114,"冲天战刀","菩提彻地斩"},
			{88,115,"冲天战甲(男)","菩提战狂甲(男)"},
			{89,116,"冲天战甲(女)","菩提战狂甲(女)"},
			{90,117,"冲天战盔","菩提战狂盔"},
			{91,118,"冲天战链","菩提战狂链"},
			{92,119,"冲天战腕","菩提战狂腕"},
			{93,120,"冲天战戒","菩提战狂戒"},
			{94,121,"冲天战带","菩提战狂带"},
			{95,122,"冲天战靴","菩提战狂靴"},
			
			
		}
		,
		--法师
		{
			{96,123,"冲天魔杖","菩提骷髅杖"},
			{97,124,"冲天魔袍(男)","菩提法痴袍(男)"},
			{98,125,"冲天魔袍(女)","菩提法痴袍(女)"},
			{99,126,"冲天魔盔","菩提法痴盔"},
			{100,127,"冲天魔链","菩提法痴链"},
			{101,128,"冲天魔腕","菩提法痴腕"},
			{102,129,"冲天魔戒","菩提法痴戒"},
			{103,130,"冲天魔带","菩提法痴带"},
			{104,131,"冲天魔靴","菩提法痴靴"},
		}
		,
		--道士
		{
			{105,132,"冲天道剑","菩提金纹剑"},
			{106,133,"冲天道衣(男)","菩提道仙衣(男)"},
			{107,134,"冲天道衣(女)","菩提道仙衣(女)"},
			{108,135,"冲天道盔","菩提道仙盔"},
			{109,136,"冲天道链","菩提道仙链"},
			{110,137,"冲天道腕","菩提道仙腕"},
			{111,138,"冲天道戒","菩提道仙戒"},
			{112,139,"冲天道带","菩提道仙带"},
			{113,140,"冲天道靴","菩提道仙靴"},
		}
		,
	}
}

--从id得到data上的Index
t.getDataIndexById = function(sysarg,id)
	id= tonumber(id)
	for i=1,#t.data do 
		if t.data[i][1] ==id then 
			return i
		end
	end
	--没有配置的话
	return 0
end

--前往熔炼
t.QianWangRongLian = function(sysarg,n)
	n = tonumber(n)
	local e = ""
	local nJob = Actor.getIntProperty(sysarg,PROP_ACTOR_VOCATION)
	if RongLian[n]==nil then 
		return "配置为空"
	end
	local  cfg = RongLian[n][nJob]
	e = e.."\\<(c0xFF00c0ff)可通过冲天·王与帝装备加><购买熔炼石/@buyrls><(c0xFF00c0ff)熔炼成菩提装备.>\\\\"
	for i=1,#cfg do 
		e = e .."     <熔炼"..cfg[i][4].."/@DoRongLian,"..i..",1,"..n.."|需要"..cfg[i][3].."·王和1颗熔炼石>"    ..    "   	<熔炼"..cfg[i][4].."·王/@DoRongLian,"..i..",2,"..n.."|需要"..cfg[i][3].."·帝和3颗熔炼石>  \\\\" 
	end
	
	e = e.."\\			<返回主页/@main>"
	return e
end

t.buyrls = function(sysarg)
	Actor.openDialogs(sysarg,diBuyAnItem,5938);
end
--做熔炼
t.DoRongLian =function(sysarg,i,index,n)
	if n==nil then 
		n=1
	end
	n = tonumber(n)
	--熔炼配置的索引
	i= tonumber(i)
	--熔炼王(1)，还是帝(2)
	index = tonumber(index)
	
	--熔炼石
	local needRLstoreCount = 1
	if index==2 then 
		needRLstoreCount =3
	end
	local itemCount = Actor.getItemCount(sysarg,5938)
	if itemCount < needRLstoreCount then
		Actor.sendTipmsg(sysarg,"熔炼石数量不足，请购买",ttFlyTip)
		return t.QianWangRongLian(sysarg,n)
	end
	
	local bagCount = Item.getBagItemCount(sysarg);
	local needItem =nil
    
	local nJob = Actor.getIntProperty(sysarg,PROP_ACTOR_VOCATION)
	if RongLian[n]==nil then 
		return "配置为空"
	end
	local cfg = RongLian[n][nJob]
	local baseItemId = cfg[i][1] --需要的物品的原始id
	local toItemId = cfg[i][2]--生成的物品的原始id
	
	if t.getDataIndexById(sysarg,baseItemId) ==0 then 
		Actor.sendTipmsg(sysarg,"配置错误",ttFlyTip)
		return 
	end
	
	--取到极品属性值
	local proIdx =0
	if index==1 then 
		proIdx = t.data[t.getDataIndexById(sysarg,baseItemId)][2]	
	elseif index ==2 then 
		proIdx =t.data[t.getDataIndexById(sysarg,baseItemId)][2]+1
	end
	
	
	--如果背包里面有这件物品，那就拿出来
	for i = 1,bagCount do 
		local itemPrt = Item.getItemPtrByIndex(sysarg,i - 1);
		if itemPrt then 
			if Item.getItemId(itemPrt) == baseItemId and Item.getItemProperty(sysarg,itemPrt,Item.ipItemSuperAttrLevel) == proIdx and Item.getItemProperty(sysarg,itemPrt,Item.ipDragonEquipLevel) == 0 then
				needItem=itemPrt
				break
			end
		end
	end
	
	--没有这件物品
    if needItem ==nil then
		Actor.sendTipmsg(sysarg, string.format("您的背包里没有足够的熔炼材料"), 256)
        return 
    end
	local zhaoHuanQiangDu = 0
	if Item.removeItem(sysarg, needItem,1, "熔炼删除", LogIds.ronglian) == 1 then 
		Actor.removeItem(sysarg,5938,needRLstoreCount,-1,-1,-1,"熔炼删除",LogIds.ronglian)
		if index ==1 then	--练出普通的东西
			--Actor.addItem(sysarg,toItemId,0,0,1,0,0,"熔炼获得",LogIds.ronglian)
			if nJob==3 then
				zhaoHuanQiangDu = 1 + System.getRandomNumber(6); --产生0~5
			end
			local nNewItem = Item.createItem(toItemId,1,0,0,0,0)
			if nNewItem ~= nil then 
				Item.addItem(sysarg,nNewItem,"熔炼获得",LogIds.ronglian)
				Item.setItemProperty(sysarg,nNewItem,Item.ipTaoStrong,zhaoHuanQiangDu)
			end
		elseif index ==2 then 	--练出王
			
			if t.data[t.getDataIndexById(sysarg,baseItemId)][4]==3 then
				zhaoHuanQiangDu = 3 + System.getRandomNumber(4); --产生0~3
			end
			local nNewItem = Item.createItem(toItemId,1,0,0,0,0,t.data[t.getDataIndexById(sysarg,toItemId)][2])
			if nNewItem ~= nil then 
				Item.addItem(sysarg,nNewItem,"熔炼获得",LogIds.ronglian)
				Item.setItemProperty(sysarg,nNewItem,Item.ipTaoStrong,zhaoHuanQiangDu)
			end
		end
		
		
		local NpcName = Actor.getTalkNpcName(sysarg);
		local StrNpcE = string.format("<%s/M沙漠土城:159:116:%s><(x沙漠土城:159:116:%s)>",NpcName,NpcName,NpcName);
		if index==1 then 
			System.broadcastTipmsg(string.format("玩家<(n%s)>通过%s锻造出%s.", Actor.getName(sysarg), StrNpcE, "<#c0x00FF00FF#"..Item.getItemName(toItemId).."/v1,"..toItemId..",0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"..zhaoHuanQiangDu..",0,0,0,0,0>"),128);
		else
			System.broadcastTipmsg(string.format("玩家<(n%s)>通过%s锻造出%s.", Actor.getName(sysarg), StrNpcE, "<#c0x00FF00FF#王·"..Item.getItemName(toItemId).."/v1,"..toItemId..",0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"..t.data[t.getDataIndexById(sysarg,toItemId)][2]..",0,0,0,0,"..zhaoHuanQiangDu..",0,0,0,0,0>"),128);
		end
	
	end
end


--新的回收方法
--t.HuiShouNew = function(sysarg)
--
--	--local str2 = "   <(ifragments#16#18)><(c0xFFb6946c)%s转:> <#c0xFFFF00FF#回收%s·%s/@onHuiShouNew,%s,%s,%s>  <#c0xFFFF00FF#回收%s·%s/@onHuiShouNew,%s,%s,%s>\\"
--	--
--	--local nCircle = Actor.getIntProperty(sysarg,PROP_ACTOR_CIRCLE);
--	--local nJob = Actor.getIntProperty(sysarg,PROP_ACTOR_VOCATION);
--	--
--	----计算显示颜色
--	--local colorOfWord_red = "(c0xFFdb1313)"
--	--local colorOfWord_green = "(c0xFF00FF00)"
--	--local function r_or_green(index)
--	--	if nCircle<index then 
--	--		return colorOfWord_red
--	--	else 
--	--		return colorOfWord_green
--	--	end
--	--end
--	--
--	----显示
--	--local e = "\\   <(ifragments#16#18)><"..r_or_green(2).."2转时,可显示回收4转王与帝装备.>\\   <(ifragments#16#18)><"..r_or_green(3).."3转时,可显示回收5转王与帝装备.>\\   <(ifragments#16#18)><"..r_or_green(4).."4转时,可显示回收6转王与帝装备.>\\\\";
--	--for i = 1,table.getn(t.classA)-2 do
--	--	local ca = t.classA[i][nJob];
--	--	local cb = t.classB[i][nJob];
--	--	if nCircle >= (ca.zslv - 2) then
--	--		e = e .. string.format(str2, ca.zslv, ca.name, ca.wdlv, ca.min, ca.max, ca.wdid, cb.name, cb.wdlv, cb.min, cb.max, cb.wdid);
--	--	end
--	--end
--    --
--	--e = e .."\\\\	<返回/@main>"
--	--return e
--end

--点击了回收按钮
t.onHuiShouNew = function(sysarg,a,b,c)
		
	a,b,c = tonumber(a),tonumber(b),tonumber(c);
	local d = t.data;
	local e = "\\  <(c0xFFb6946c)请选择需要回收的装备>,<(c0xFF00c0ff)每次只可回收一件:> <返  回/@main>\\\\";
		
	--每一把武器都计算一下
    for i = a,b do
		local proIdx = d[i][2];
		local zhaoHuanQiangDu = 0;
		if d[i][4] == 3 then
			zhaoHuanQiangDu = 3;
		end
		
		
		--计算价格
		local itemId = d[i][1]
		local info = nil
		local index = {16,17,18,19}
		for i=index[1],index[4] do 
			for j=1,#RecycledItems[i].list do 
				if RecycledItems[i].list[j].itemid == itemId then 
					info = RecycledItems[i].list[j]
					break
				end
				if info~=nil then 
					break
				end
			end
		end
		
		if info==nil then 
			print("没有出售的价格，信息")
			return 
		end
		
		local addExp = info.exp
		local addgold = info.gold
		local addhufu = info.hufu
		if addExp== nil or addgold ==nil or addhufu==nil then 
			print("没有出售的价格2，信息")
			return 
		end
	
		--计算倍数		
		if c == 2 then 
			addExp = addExp *9
			addgold = addgold *9
			addhufu = addhufu *9
		else -- c == 1 
			c = 1
			addExp = addExp *3
			addgold = addgold *3
			addhufu = addhufu *3
		end
	
		
		if c == 1 then --回收王的
			if addhufu~=0  then 
				e = e .. string.format("  <回收"..Item.getItemName(d[i][1]).."·王".."/@onHuiShouNew_only,%s,%s,%s,%s,%s,%s|每个装备回收可得到 %s 经验, %s金币 %s 护符碎片>\\\\",d[i][1],proIdx,c,addExp,addgold,addhufu,addExp,addgold,addhufu);
			else 
				e = e .. string.format("  <回收"..Item.getItemName(d[i][1]).."·王".."/@onHuiShouNew_only,%s,%s,%s,%s,%s,%s|每个装备回收可得到 %s 经验, %s金币>\\\\",d[i][1],proIdx,c,addExp,addgold,addhufu,addExp,addgold);
			end
		else	--回收帝的
			if addhufu~=0  then
				e = e .. string.format("  <回收"..Item.getItemName(d[i][1]).."·帝".."/@onHuiShouNew_only,%s,%s,%s,%s,%s,%s|每个装备回收可得到 %s 经验, %s金币 %s 护符碎片>\\\\",d[i][1],proIdx,c,addExp,addgold,addhufu,addExp,addgold,addhufu);
			else 
				e = e .. string.format("  <回收"..Item.getItemName(d[i][1]).."·帝".."/@onHuiShouNew_only,%s,%s,%s,%s,%s,%s|每个装备回收可得到 %s 经验, %s金币>\\\\",d[i][1],proIdx,c,addExp,addgold,addhufu,addExp,addgold);
			end
		end
	end
    return e;

end

--点击回收某一件物品
t.onHuiShouNew_only = function(sysarg,itemId,proIdx,c,addExp,addgold,addhufu)
	itemId =tonumber(itemId)
	proIdx =tonumber(proIdx)--王的极品属性
	addExp = tonumber(addExp)
	addgold = tonumber(addgold)
	addhufu = tonumber(addhufu)
	c=tonumber(c) --1为王，2为帝
	
	-------------- xsp
	if c ~= 2 then c = 1 end
	
	local _idx = t.getDataIndexById(sysarg, itemId)
	if _idx == 0 then
		return
	end
	
	local d = t.data;
	local _itemcfg = d[_idx]
	
	proIdx = _itemcfg[2];
	
	--计算价格
	local info = nil
	local index = {16,17,18,19}
	for i=index[1],index[4] do 
		for j=1,#RecycledItems[i].list do 
			if RecycledItems[i].list[j].itemid == itemId then 
				info = RecycledItems[i].list[j]
				break
			end
			if info~=nil then 
				break
			end
		end
	end
	
	if info==nil then 
		print("没有出售的价格，信息")
		return 
	end
	
	addExp = info.exp
	addgold = info.gold
	addhufu = info.hufu
	if addExp== nil or addgold ==nil or addhufu==nil then 
		print("没有出售的价格2，信息")
		return 
	end

	--计算倍数		
	if c == 2 then 
		addExp = addExp *9
		addgold = addgold *9
		addhufu = addhufu *9
	else -- c == 1 
		c = 1
		addExp = addExp *3
		addgold = addgold *3
		addhufu = addhufu *3
	end
		
	-------------- xsp
	
	if c== 2 then 
		proIdx = proIdx + 1 
	end
	
	local haveItemCount = 0;
	local bagCount = Item.getBagItemCount(sysarg);
	local needItem ={};
    
	--如果背包里面有这件物品，那就拿出来
	for i = 1,bagCount do 
		local itemPrt = Item.getItemPtrByIndex(sysarg,i - 1);
		if itemPrt then 
			if Item.getItemId(itemPrt) == itemId and Item.getItemProperty(sysarg,itemPrt,Item.ipItemSuperAttrLevel) == proIdx and Item.getItemProperty(sysarg,itemPrt,Item.ipDragonEquipLevel) == 0 then
				haveItemCount = haveItemCount + 1;
				table.insert(needItem,itemPrt);
			end
		end
	end
	
	--没有这件物品
    if haveItemCount < 1 then
		Actor.sendTipmsg(sysarg, string.format("您的背包里没有这件物品,回收失败.."), 256)
        return 
    end
	
	
	
	--实现回收
	local strlog = "三昧真火回收"
	if Item.removeItem(sysarg, needItem[1], 1, strlog, LogIds.sanweizhenhuoHuiShou) == 1 then 
		Actor.changeMoney(sysarg,1,addgold,105,"回收收购物品");
		Actor.addExp(sysarg, addExp, "回收给经验");
		if addhufu > 0 then
			local jadeNum = Actor.getUIntProperty(sysarg, 124)
			jadeNum = jadeNum + addhufu
			Actor.setUIntProperty(sysarg, 124, jadeNum);
			Actor.sendTipmsg(sysarg, string.format("<获得> <(c0xFFFF7755)%s护符碎片>", addhufu), 1);
		end
	end

end


t.onDelItem = function(sysarg,a,b,c)
	a,b,c = tonumber(a),tonumber(b),tonumber(c);
	local d = t.data;
	local e = "\\  <(c0xFFb6946c)请选择需要回收的装备:> <返  回/@main>\\\\";
	local nJob = Actor.getIntProperty(sysarg,PROP_ACTOR_VOCATION);
	local delItemId = t.classC[nJob];
    for i = a,b do
		local proIdx = 0;
		local nAddLs = d[i][3];
		local sHouZui = "";
		if c == 2 then
			nAddLs = d[i][3] * 2;
			sHouZui = "王·";
			proIdx = d[i][2];
		end
		if c == 3 then
			nAddLs = d[i][3] * 4;
			sHouZui = "帝·";
			proIdx = d[i][2] + 1;
		end
		local SitemLinkMsg = string.format("%s%s", sHouZui,Item.getItemName(d[i][1]) );
		e = e .. string.format("  <点击回收%s/@onDelItem_only,%s,%s> <(c0xFFb6946c)获得> %s<(c0xFFb6946c) %s 颗>\\\\", SitemLinkMsg, i, c, Item.getItemLinkMsg(delItemId), nAddLs);	
	end
    return e;
end


t.onDelItem_only = function(sysarg,a,c)  --c代表是王，还是帝的合成 
    if not a then return; end
	c = tonumber(c)
    local i = tonumber(a);
    local d = t.data;
	local nJob = Actor.getIntProperty(sysarg,PROP_ACTOR_VOCATION);
	local delItemId = t.classC[nJob];
	local proIdx = 0;
	local nAddLs = d[i][3];
	local sHouZui = "";
	if c == 2 then
		nAddLs = d[i][3] * 2;
		sHouZui = "王·";
		proIdx = d[i][2];
	end
	if c == 3 then
		nAddLs = d[i][3] * 4;
		sHouZui = "帝·";
		proIdx = d[i][2] + 1;
	end
	local getId = d[i][1];


	local haveItemCount = 0;
	local bagCount = Item.getBagItemCount(sysarg);
	local needItem ={};

	for i = 1,bagCount do 
		local itemPrt = Item.getItemPtrByIndex(sysarg,i - 1);
		if itemPrt then 
			if Item.getItemId(itemPrt) == getId and Item.getItemProperty(sysarg,itemPrt,Item.ipItemSuperAttrLevel) == proIdx and Item.getItemProperty(sysarg,itemPrt,Item.ipDragonEquipLevel) == 0 then
				haveItemCount = haveItemCount + 1;
				table.insert(needItem,itemPrt);
			end
		end
	end
	
    if haveItemCount < 1 then
		Actor.sendTipmsg(sysarg, string.format("您的 <%s> 不足 <%s> ,回收失败..",sHouZui..Item.getItemName(getId), 1), 256)
        return ;
    end

	local emptyCount = Item.getBagEmptyGridCount(sysarg);
	if Item.getAddItemNeedGridCount(sysarg, delItemId, nAddLs) > emptyCount then 
		Actor.sendTipmsg(sysarg, "背包所需空间不足,回收失败.", 256);
		return ;
	end

	local strlog = "SWZHL_HuiShou"

	local ndelitem = Item.removeItem(sysarg, needItem[1], 1, strlog, LogIds.sanweizhenhuoHuiShou);
	if ndelitem ~= 1 then return ; end

	Actor.addItem(sysarg,delItemId,0,0,nAddLs,0,0, strlog, LogIds.sanweizhenhuoHuiShou);

	local NpcName = Actor.getTalkNpcName(sysarg);
	local StrNpcE = string.format("<%s/M沙漠土城:159:116:%s><(x沙漠土城:159:116:%s)>",NpcName,NpcName,NpcName);
	local sTipmsg = "玩家<(n%s)>通过%s回收了<%s>获得%s<%s>颗.";
	System.broadcastTipmsg(string.format(sTipmsg, Actor.getName(sysarg), StrNpcE, Item.getItemName(getId)..sHouZui, Item.getItemLinkMsg(delItemId), nAddLs ),128 + 2);
    return;
end

t.onItemLvUp = function(sysarg,a,b,c)
	a,b,c = tonumber(a),tonumber(b),tonumber(c);
	local d = t.data;
	local e = "\\  <(c0xFFb6946c)请选择品级进阶的装备:> <返  回/@main>\\\\";
	local nJob = Actor.getIntProperty(sysarg,PROP_ACTOR_VOCATION);
	local delItemId = t.classC[nJob];
    for i = a,b do
		local proIdx = d[i][2];
		local getId = d[i-27][1];
		local zhaoHuanQiangDu = 0;
		if d[i][4] == 3 then
			zhaoHuanQiangDu = 3;
		end
		if c == 1 then
			e = e .. string.format("  %s  <点击获得/@onItemLvUp_only,%s,%s|需要材料:#%s + %s%s颗 + %s万绑金或金币>\\\\", Item.getItemLinkMsg(d[i][1]), i, c, Item.getItemName(getId).."·王", Item.getItemName(delItemId), math.floor(d[i][3] / 2), d[i][5] );
		else
			e = e .. string.format("  %s  <点击获得/@onItemLvUp_only,%s,%s|需要材料:#%s + %s%s颗 + %s万绑金或金币>\\\\", "<#c0x00FF00FF#"..Item.getItemName(d[i][1]).."·王".."/v1,"..d[i][1]..",0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,".. proIdx ..",0,0,0,0,"..zhaoHuanQiangDu..",0,0,0,0,0>", i, c, Item.getItemName(getId).."·帝", Item.getItemName(delItemId), math.floor(d[i][3]*3/2), d[i][5] );
		end
	end
    return e;
end

t.onItemLvUp_only = function(sysarg,a,c)  --c代表是王，还是帝的合成 
    if not a then return; end
	c = tonumber(c)
    local i = tonumber(a);
    local d = t.data;
    local add_nitem = d[i][1];
	local proIdx = d[i][2];
	local getproIdx = d[i-27][2];
    local item_count = 1;
	local getId = d[i-27][1];

	local haveItemCount = 0
	local bagCount = Item.getBagItemCount(sysarg)
	local needItem ={}

	local nJob = Actor.getIntProperty(sysarg,PROP_ACTOR_VOCATION);
	local delItemId = t.classC[nJob];
	local getDelIn = math.floor(d[i][3] / 2);
	if c == 2 then
		getDelIn = math.floor(d[i][3] * 3 / 2);
	end

	local del_ngold = d[i][5];
    local MC = 2;
    if Actor.getMoneyCount(sysarg,1) >= del_ngold then MC = 1; end
    if Actor.getMoneyCount(sysarg,0) >= del_ngold then MC = 0; end
    if MC == 2 then
        Actor.sendTipmsg(sysarg, string.format("您的绑金或金币不足 <%s>.",del_ngold), 256);
        return ;
    end

	if Actor.getItemCount(sysarg,  delItemId) < getDelIn then
		Actor.sendTipmsg(sysarg, string.format("您的 <%s> 不足 <%s> ,进阶失败..", Item.getItemName(delItemId), getDelIn), 256);
		return ;
	end

	for i = 1,bagCount do 
		local itemPrt = Item.getItemPtrByIndex(sysarg,i - 1);
		if itemPrt then 
			if c == 1 then --王换普通
				if Item.getItemId(itemPrt) == getId and Item.getItemProperty(sysarg,itemPrt,Item.ipItemSuperAttrLevel) == getproIdx and Item.getItemProperty(sysarg,itemPrt,Item.ipDragonEquipLevel) == 0 then --id一样，并且属性一样（王）才确认是这件物品
					haveItemCount = haveItemCount +1
					table.insert(needItem,itemPrt)
				end
			else 	--帝换王
				if Item.getItemId(itemPrt) == getId and Item.getItemProperty(sysarg,itemPrt,Item.ipItemSuperAttrLevel) == (getproIdx + 1) and Item.getItemProperty(sysarg,itemPrt,Item.ipDragonEquipLevel) == 0 then --id一样，并且属性一样（帝）才确认是这件物品
					haveItemCount = haveItemCount +1
					table.insert(needItem,itemPrt)
				end
			end
		end
	end
	
    if haveItemCount < 1 then
		if c == 1 then --王换普通
			Actor.sendTipmsg(sysarg, string.format("您的 <%s> 不足 <%s> ,进阶失败..", Item.getItemName(getId).."·王", 1), 256)
		else 	--帝换王
			Actor.sendTipmsg(sysarg, string.format("您的 <%s> 不足 <%s> ,进阶失败..", Item.getItemName(getId).."·帝", 1), 256)
		end
        return ;
    end

	local strlog = "SWZHL_JinJie"

	local ndelitem = Item.removeItem(sysarg, needItem[1], 1, strlog, LogIds.sanweizhenhuoJinJie);
	if ndelitem ~= 1 then return ; end
	Actor.removeItem(sysarg, delItemId, getDelIn, -1, -1, -1, strlog, LogIds.sanweizhenhuoJinJie);
	Actor.changeMoney(sysarg, MC, -del_ngold, strlog, LogIds.sanweizhenhuoJinJie);

	if c == 1 then 
		proIdx = 0;
	end

	local zhaoHuanQiangDu = 0;
	if d[i][4] == 3 then
		zhaoHuanQiangDu = 3 + System.getRandomNumber(4); --产生0~3
	end
	local nNewItem = Item.createItem(add_nitem,1,0,0,0,0,proIdx);
	if nNewItem ~= nil then 
		Item.addItem(sysarg,nNewItem,strlog,LogIds.sanweizhenhuoJinJie);
		Item.setItemProperty(sysarg,nNewItem,Item.ipTaoStrong,zhaoHuanQiangDu);
	end

	local NpcName = Actor.getTalkNpcName(sysarg);
	local StrNpcE = string.format("<%s/M沙漠土城:159:116:%s><(x沙漠土城:159:116:%s)>",NpcName,NpcName,NpcName);
	if c == 1 then 
		System.broadcastTipmsg(string.format("玩家<(n%s)>通过%s进阶获得%s.", Actor.getName(sysarg), StrNpcE, "<#c0x00FF00FF#"..Item.getItemName(d[i][1]).."/v1,"..d[i][1]..",0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"..zhaoHuanQiangDu..",0,0,0,0,0>"),128);
		System.broadcastTipmsg(string.format("玩家<(n%s)>通过%s进阶获得%s.", Actor.getName(sysarg), StrNpcE, Item.getItemName(add_nitem)),2);
	else
		System.broadcastTipmsg(string.format("玩家<(n%s)>通过%s进阶获得%s.", Actor.getName(sysarg), StrNpcE, "<#c0x00FF00FF#"..Item.getItemName(d[i][1]).."·王".."/v1,"..d[i][1]..",0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"..proIdx ..",0,0,0,0,"..zhaoHuanQiangDu..",0,0,0,0,0>"),128);
		System.broadcastTipmsg(string.format("玩家<(n%s)>通过%s进阶获得%s.", Actor.getName(sysarg), StrNpcE, Item.getItemName(add_nitem).."·王"),2);
	end
    return;
end







t.onDzwdZ = function(sysarg,a,b,c)
	a,b,c = tonumber(a),tonumber(b),tonumber(c);
	local d = t.data;
	local e = "\\  <(c0xFFb6946c)请选择需要锻造的装备:> <返  回/@main>\\\\";
    for i = a,b do
		local proIdx = d[i][2];
		local zhaoHuanQiangDu = 0;
		if d[i][4] == 3 then
			zhaoHuanQiangDu = 3;
		end
		if c == 1 then 
			e = e .. string.format("  %s  <点击锻造/@onDzwdZ_only,%s,%s|需要材料:#%s x3 + %s绑金或金币>\\\\", "<#c0x00FF00FF#王·"..Item.getItemName(d[i][1]).."/v1,"..d[i][1]..",0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"..proIdx..",0,0,0,0,"..zhaoHuanQiangDu..",0,0,0,0,0>", i,c, Item.getItemName(d[i][1]), d[i][5]);
		else	
			e = e .. string.format("  %s  <点击锻造/@onDzwdZ_only,%s,%s|需要材料:#%s x3 + %s绑金或金币>\\\\", "<#c0x00FF00FF#帝·"..Item.getItemName(d[i][1]).."/v1,"..d[i][1]..",0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"..proIdx+1 ..",0,0,0,0,"..zhaoHuanQiangDu..",0,0,0,0,0>", i,c, Item.getItemName(d[i][1]).."·王", d[i][5]);
		end
	end
    return e;
end

t.onDzwdZ_only = function(sysarg,a,c)  --c代表是王，还是帝的合成 
    if not a then return; end
	c = tonumber(c)
    local i = tonumber(a);
    local d = t.data;
    local add_nitem = d[i][1];
	local proIdx = d[i][2];
    local item_count = 1;

	local haveItemCount = 0
	local bagCount = Item.getBagItemCount(sysarg)
	local needItem ={}
	--print("add_nitem="..add_nitem)

	local del_ngold = d[i][5];
    local MC = 2;
    if Actor.getMoneyCount(sysarg,1) >= del_ngold then MC = 1; end
    if Actor.getMoneyCount(sysarg,0) >= del_ngold then MC = 0; end
    if MC == 2 then
        Actor.sendTipmsg(sysarg, string.format("您的绑金或金币不足 <%s>.",del_ngold), 256);
        return ;
    end

	for i=1,bagCount do 
		local itemPrt = Item.getItemPtrByIndex(sysarg,i-1)
		if itemPrt then 
            local nValue = 0
            if Item.getItemProperty(sysarg,itemPrt,Item.ipItemCount,nValue) <= 0 then
                System.trace("刷装备"..Actor.getName(sysarg))    
                return
            end
            
			if c==1 then --王的合成
				if Item.getItemId(itemPrt) == add_nitem and Item.getItemProperty(sysarg,itemPrt,Item.ipItemSuperAttrLevel)==0 and Item.getItemProperty(sysarg,itemPrt,Item.ipDragonEquipLevel) == 0 then --id一样，并且属性一样（普通）才确认是这件物品
					haveItemCount = haveItemCount +1
					table.insert(needItem,itemPrt)
				end
			else 
				if Item.getItemId(itemPrt) == add_nitem and Item.getItemProperty(sysarg,itemPrt,Item.ipItemSuperAttrLevel)==proIdx and Item.getItemProperty(sysarg,itemPrt,Item.ipDragonEquipLevel) == 0 then --id一样，并且属性一样（王）才确认是这件物品
					haveItemCount = haveItemCount +1
					table.insert(needItem,itemPrt)
				end
			end
		end
	end
	
    if haveItemCount < 3 then
		if c==1 then --王的合成
			Actor.sendTipmsg(sysarg, string.format("您的 <%s> 不足 <%s> ,锻造失败..", Item.getItemName(add_nitem), 3), 256)
		else 
			Actor.sendTipmsg(sysarg, string.format("您的 <%s> 不足 <%s> ,锻造失败..", Item.getItemName(add_nitem).."·王", 3), 256)
		end
        return ;
    end

	local strlog = "三昧真火普通"
	local strlog2 = "三昧真火王"
	if c~=1 then 
		strlog = "三昧真火王"
		strlog2 = "三昧真火帝"
	end
	
	--找出最高的附魂等级和经验
	local topFuHunLv = 0
	local topFunHunExp =0
	for i=1,3 do 
		local delItemPrt = needItem[i]
		--local delItemFHlv = Item.getFuHunInfo(delItemPrt,1)
		--local delItemFHexp = Item.getFuHunInfo(delItemPrt,2)
		--if delItemFHlv<topFuHunLv then --不做操作
		--	
		--elseif delItemFHlv>topFuHunLv then --直接保存
		--	topFuHunLv = delItemFHlv
		--	topFunHunExp = delItemFHexp
		--elseif delItemFHlv==topFuHunLv then --判断经验
		--	if delItemFHexp>topFuHunLv then 
		--		topFuHunLv = delItemFHlv
		--		topFunHunExp = delItemFHexp
		--	end
		--end
		--topFuHunLv = topFuHunLv + delItemFHlv   --全部叠加
		--topFunHunExp = topFunHunExp + delItemFHexp
		
		
		local delItemFHexp = Item.getFuHunInfo(delItemPrt,2)
		local delItemUseexp = calFuHunLevelUpUsedExp(sysarg,delItemPrt)
		topFunHunExp =topFunHunExp + delItemFHexp + delItemUseexp
	end
	
	for i=1,3 do 
		if Item.removeItem(sysarg,needItem[i],1,strlog,LogIds.sanweizhenhuoHeCheng)~=1 then 
			System.trace("sanweizhenhuo del fail :"..i.."itemid:"..add_nitem.."actorid:"..Actor.getIntProperty(sysarg,PROP_ENTITY_ID))
			return 
		end
	end
	if c==2 then 
		proIdx = proIdx +1
	end
	Actor.changeMoney(sysarg, MC, -del_ngold,  LogIds.sanweizhenhuoHeCheng,strlog);
	local zhaoHuanQiangDu = 0
	if d[i][4] == 3 then
		zhaoHuanQiangDu = 3 + System.getRandomNumber(4); --产生0~3
	end
	local nNewItem = Item.createItem(add_nitem,1,0,0,0,0,proIdx)
	if nNewItem ~= nil then 
	
		if topFunHunExp>0 then 
			local cfg = findFuHunConfig(nNewItem)
			if cfg~=nil then 
				for i=1,#cfg do 
					topFunHunExp  = topFunHunExp -cfg[i].lvUpNeedExp
					if topFunHunExp<0 then 
						topFunHunExp = topFunHunExp +cfg[i].lvUpNeedExp
						break
					end
					topFuHunLv =  i
				end
				
				Item.setFuHunInfo(sysarg,nNewItem,1,topFuHunLv)
				Item.setFuHunInfo(sysarg,nNewItem,2,topFunHunExp) 
				
				System.sendCommonLog(LogIds.zhuanbeifuhunLvChange,Actor.getIntProperty(sysarg, PROP_ENTITY_ID),Actor.getName(sysarg),0,0, topFuHunLv, "","","王帝合成继承","","",Item.getItemGuidStr(nNewItem),"",Item.getItemName(nNewItem))
				System.sendCommonLog(LogIds.zhuanbeifuhunExpChange,Actor.getIntProperty(sysarg, PROP_ENTITY_ID),Actor.getName(sysarg),0,0, topFunHunExp, "","","王帝合成继承","","",Item.getItemGuidStr(nNewItem),"",Item.getItemName(nNewItem))
			end
		end
		
		Item.addItem(sysarg,nNewItem,strlog2,LogIds.sanweizhenhuoHeCheng)
		Item.setItemProperty(sysarg,nNewItem,Item.ipTaoStrong,zhaoHuanQiangDu)
	end

	local NpcName = Actor.getTalkNpcName(sysarg);
	local StrNpcE = string.format("<%s/M沙漠土城:159:116:%s><(x沙漠土城:159:116:%s)>",NpcName,NpcName,NpcName);
	if c==1 then 
		System.broadcastTipmsg(string.format("玩家<(n%s)>通过%s锻造出%s.", Actor.getName(sysarg), StrNpcE, "<#c0x00FF00FF#王·"..Item.getItemName(d[i][1]).."/v1,"..d[i][1]..",0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"..proIdx..",0,0,0,0,"..zhaoHuanQiangDu..",0,0,0,0,0>"),128);
		System.broadcastTipmsg(string.format("玩家<(n%s)>通过%s锻造出%s.", Actor.getName(sysarg), StrNpcE, "王·"..Item.getItemName(add_nitem)),2);
	else
		System.broadcastTipmsg(string.format("玩家<(n%s)>通过%s锻造出%s.", Actor.getName(sysarg), StrNpcE, "<#c0x00FF00FF#帝·"..Item.getItemName(d[i][1]).."/v1,"..d[i][1]..",0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"..proIdx ..",0,0,0,0,"..zhaoHuanQiangDu..",0,0,0,0,0>"),128);
		System.broadcastTipmsg(string.format("玩家<(n%s)>通过%s锻造出%s.", Actor.getName(sysarg), StrNpcE, "帝·"..Item.getItemName(add_nitem)),2);
	end
    return;
end



t.FenJie = function(sysarg,index)  --index控制王，帝分解
	index =tonumber(index)
	local myCircle = Actor.getIntProperty(sysarg,PROP_ACTOR_CIRCLE)
	local echo = "\\  <(c0xFFb6946c)我只是个炉子,我并不会讲话..>\\";
	--王的显示
	if index==1 then 
	echo = echo .. [[

<(idecoLine#330)>

  <分解上古战装·王/@onFenJie,1,9,1|4转战士装备#1件上古装备·王即可分解为2件上古装备> <分解上古法装·王/@onFenJie,10,18,1|4转法师装备#1件上古装备·王即可分解为2件上古装备> <分解上古道装·王/@onFenJie,19,27,1|4转道士装备#1件上古装备·王即可分解为2件上古装备> 

  <分解起源战装·王/@onFenJie,28,36,1|5转战士装备#1件起源装备·王即可分解为2件起源装备> <分解起源法装·王/@onFenJie,37,45,1|5转法师装备#1件起源装备·王即可分解为2件起源装备> <分解起源道装·王/@onFenJie,46,54,1|5转道士装备#1件起源装备·王即可分解为2件起源装备> 

  <分解誓星战装·王/@onFenJie,55,63,1|6转战士装备#1件誓星装备·王即可分解为2件誓星装备> <分解誓星法装·王/@onFenJie,64,72,1|6转法师装备#1件誓星装备·王即可分解为2件誓星装备> <分解誓星道装·王/@onFenJie,73,81,1|6转道士装备#1件誓星装备·王即可分解为2件誓星装备>

<(idecoLine#330)>]]
if myCircle >=6 then 
	echo = echo .. [[    <分解冲天战装·王/@onFenJie,82,90,1|7转战士装备#1件冲天装备·王即可分解为2件冲天装备> <分解冲天法装·王/@onFenJie,91 ,99,1|7转法师装备#1件冲天装备·王即可分解为2件冲天装备> <分解冲天道装·王/@onFenJie,100,108,1|7转道士装备#1件冲天装备·王即可分解为2件冲天装备> 

]]
else 
echo = echo .. [[


]]
end

if myCircle >=7 then 
	echo = echo .. [[  <分解菩提战装·王/@onFenJie,109 ,117,1|9转战士装备#1件菩提装备·王即可分解为2件菩提装备> <分解菩提法装·王/@onFenJie,118,126,1|9转法师装备#1件菩提装备·王即可分解为2件菩提装备> <分解菩提道装·王/@onFenJie,127,135,1|9转道士装备#1件菩提装备·王即可分解为2件菩提装备> 

]]
else 
echo = echo .. [[


]]
end

if myCircle >=10 then 
	--echo = echo .. [[  <分解无尘战装·王/@onFenJie,136 ,144,1|11转战士装备#1件无尘装备·王即可分解为2件无尘装备> <分解无尘法装·王/@onFenJie,145,153,1|11转法师装备#1件无尘装备·王即可分解为2件无尘装备> <分解无尘道装·王/@onFenJie,154,162,1|11转道士装备#1件无尘装备·王即可分解为2件无尘装备> 

--]]
else 
echo = echo .. [[


]]
end
	else 
	--帝的分解显示
		echo = echo .. [[

<(idecoLine#330)>

  <分解帝·上古战装/@onFenJie,1,9,2|4转战士装备#1件上古装备·帝即可分解为7件上古装备> <分解上古法装·帝/@onFenJie,10,18,2|4转法师装备#1件上古装备·帝即可分解为7件上古装备> <分解上古道装·帝/@onFenJie,19,27,2|4转道士装备#1件上古装备·帝即可分解为7件上古装备> 

  <分解起源战装·帝/@onFenJie,28,36,2|5转战士装备#1件起源装备·帝即可分解为7件起源装备> <分解起源法装·帝/@onFenJie,37,45,2|5转法师装备#1件起源装备·帝即可分解为7件起源装备> <分解起源道装·帝/@onFenJie,46,54,2|5转道士装备#1件起源装备·帝即可分解为7件起源装备> 

  <分解誓星战装·帝/@onFenJie,55,63,2|6转战士装备#1件誓星装备·帝即可分解为7件誓星装备> <分解誓星法装·帝/@onFenJie,64,72,2|6转法师装备#1件誓星装备·帝即可分解为7件誓星装备> <分解誓星道装·帝/@onFenJie,73,81,2|6转道士装备#1件誓星装备·帝即可分解为7件誓星装备>

<(idecoLine#330)>]]
if myCircle >=6 then 
	echo = echo .. [[    <分解冲天战装·帝/@onFenJie,82,90,2|7转战士装备#1件冲天装备·帝即可分解为7件冲天装备> <分解冲天法装·帝/@onFenJie,91 ,99,2|7转法师装备#1件冲天装备·帝即可分解为7件冲天装备> <分解冲天道装·帝/@onFenJie,100,108,2|7转道士装备#1件冲天装备·帝即可分解为7件冲天装备> 

]]
else 
echo = echo .. [[


]]
end

if myCircle >=7 then 
	echo = echo .. [[  <分解菩提战装·帝/@onFenJie,109 ,117,2|9转战士装备#1件菩提装备·帝即可分解为7件菩提装备> <分解菩提·帝法装/@onFenJie,118,126,2|9转法师装备#1件菩提装备·帝即可分解为7件菩提装备> <分解菩提道装·帝/@onFenJie,127,135,2|9转道士装备#1件菩提装备·帝即可分解为7件菩提装备> 

]]
else 
echo = echo .. [[


]]
end

if myCircle >=10 then 
	--echo = echo .. [[  <分解无尘战装·帝/@onFenJie,136 ,144,2|11转战士装备#1件无尘装备·帝即可分解为7件无尘装备> <分解无尘法装·帝/@onFenJie,145,153,2|11转法师装备#1件无尘装备·帝即可分解为7件无尘装备> <分解无尘道装·帝/@onFenJie,154,162,2|11转道士装备#1件无尘装备·帝即可分解为7件无尘装备> 

--]]
else 
echo = echo .. [[


]]
end
	
	end
  
  echo =echo ..[[	<返  回/@main>
]];
	return echo;
end



t.onFenJie =function(sysarg,a,b,index)
	index = tonumber(index)
	a,b = tonumber(a),tonumber(b);
	local d = t.data;
	local e = "\\  <(c0xFFb6946c)请选择您要分解的装备:> <返  回/@FenJie,"..index..">\\\\";
    for i = a,b do
		local proIdx = d[i][2]
		if index ==1 then 
			e = e .. string.format("  %s  <点击分解/@onFenJie_only,%s,%s|需要材料:#%s x1>\\\\", "<#c0x00FF00FF#".."王·"..Item.getItemName(d[i][1]).."/v1,"..d[i][1]..",0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"..proIdx..",0,0,0,0,0,0,0,0,0,0>", i,index, "王·"..Item.getItemName(d[i][1]));
		else	
			e = e .. string.format("  %s  <点击分解/@onFenJie_only,%s,%s|需要材料:#%s x1>\\\\", "<#c0x00FF00FF#".."帝·"..Item.getItemName(d[i][1]).."/v1,"..d[i][1]..",0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"..proIdx+1 ..",0,0,0,0,0,0,0,0,0,0>", i,index, "帝·"..Item.getItemName(d[i][1]));
		end
    end
    return e;
end
--
--
t.onFenJie_only = function(sysarg,a,index)
	index =tonumber(index)
	if not a then return; end
    local i = tonumber(a);
    local d = t.data;
    local add_nitem = d[i][1];
	local proIdx = d[i][2];
	local item_count =2
	
	local haveItemCount = 0
	local bagCount = Item.getBagItemCount(sysarg)
	local needItem ={}
	--print("add_nitem="..add_nitem)
	
	for i=1,bagCount do 
		local itemPrt = Item.getItemPtrByIndex(sysarg,i-1)
		if itemPrt then 
			if index==1 then --王的分解
				if Item.getItemId(itemPrt) == add_nitem and Item.getItemProperty(sysarg,itemPrt,Item.ipItemSuperAttrLevel)==proIdx and Item.getItemProperty(sysarg,itemPrt,Item.ipDragonEquipLevel) == 0 then --id一样，并且属性一样（普通）才确认是这件物品
					haveItemCount = haveItemCount +1
					table.insert(needItem,itemPrt)
				end
			else 
				if Item.getItemId(itemPrt) == add_nitem and Item.getItemProperty(sysarg,itemPrt,Item.ipItemSuperAttrLevel)==proIdx+1 and Item.getItemProperty(sysarg,itemPrt,Item.ipDragonEquipLevel) == 0 then --id一样，并且属性一样（王）才确认是这件物品
					haveItemCount = haveItemCount +1
					table.insert(needItem,itemPrt)
				end
			end
		end
	end
	
	
	
	if haveItemCount < 1 then
		if index==1 then 
			Actor.sendTipmsg(sysarg, string.format("您的 <%s> 不足 <%s> ,分解失败..", "王·"..Item.getItemName(add_nitem), 1), 256)
		else 
			Actor.sendTipmsg(sysarg, string.format("您的 <%s> 不足 <%s> ,分解失败..", "帝·"..Item.getItemName(add_nitem), 1), 256)
		end
        return ;
    end
	
	if index==2 then 
		item_count =7
	end
	
	--背包空位数量
	local bagIdxs = Item.getBagEmptyGridCount(sysarg)
	if bagIdxs < item_count then 
		Actor.sendTipmsg(sysarg, "背包空间不足以容纳分解得到的物品", ttFlyTip)
		return 
	end
	
	local strlog = "三昧真火普通"
	local strlog2 = "三昧真火王"
	if index ~=1 then 
		strlog2 = "三昧真火帝"
	end
	
	Item.removeItem(sysarg,needItem[1],1,strlog2,LogIds.sanweizhenhuoFenJie);
    Actor.addItem(sysarg, add_nitem, 0, 0, item_count,0,0,strlog,LogIds.sanweizhenhuoFenJie);
	
end


























--王，帝是不是一件物品了，是动态加上属性，以前的写法不行！！！
--local t = {
--
--	data = {
--[1] = {1850,87},--王·冲天战刀
--[2] = {1851,88},--王·冲天战甲(男)
--[3] = {1852,89},--王·冲天战甲(女)
--[4] = {1853,90},--王·冲天战盔
--[5] = {1854,91},--王·冲天战链
--[6] = {1855,92},--王·冲天战腕
--[7] = {1856,93},--王·冲天战戒
--[8] = {1857,94},--王·冲天战带
--[9] = {1858,95},--王·冲天战靴
--
--[10] = {1859,96},--王·冲天魔杖
--[11] = {1860,97},--王·冲天魔袍(男)
--[12] = {1861,98},--王·冲天魔袍(女)
--[13] = {1862,99},--王·冲天魔盔
--[14] = {1863,100},--王·冲天魔链
--[15] = {1864,101},--王·冲天魔腕
--[16] = {1865,102},--王·冲天魔戒
--[17] = {1866,103},--王·冲天魔带
--[18] = {1867,104},--王·冲天魔靴
--
--[19] = {1868,105},--王·冲天道剑
--[20] = {1869,106},--王·冲天道衣(男)
--[21] = {1870,107},--王·冲天道衣(女)
--[22] = {1871,108},--王·冲天道盔
--[23] = {1872,109},--王·冲天道链
--[24] = {1873,110},--王·冲天道腕
--[25] = {1874,111},--王·冲天道戒
--[26] = {1875,112},--王·冲天道带
--[27] = {1876,113},--王·冲天道靴
--
--[28] = {1877,114},--王·菩提彻地斩
--[29] = {1878,115},--王·菩提战狂甲(男)
--[30] = {1879,116},--王·菩提战狂甲(女)
--[31] = {1880,117},--王·菩提战狂盔
--[32] = {1881,118},--王·菩提战狂链
--[33] = {1882,119},--王·菩提战狂腕
--[34] = {1883,120},--王·菩提战狂戒
--[35] = {1884,121},--王·菩提战狂带
--[36] = {1885,122},--王·菩提战狂靴
--
--[37] = {1886,123},--王·菩提骷髅杖
--[38] = {1887,124},--王·菩提法痴袍(男)
--[39] = {1888,125},--王·菩提法痴袍(女)
--[40] = {1889,126},--王·菩提法痴盔
--[41] = {1890,127},--王·菩提法痴链
--[42] = {1891,128},--王·菩提法痴腕
--[43] = {1892,129},--王·菩提法痴戒
--[44] = {1893,130},--王·菩提法痴带
--[45] = {1894,131},--王·菩提法痴靴
--
--[46] = {1895,132},--王·菩提金纹剑
--[47] = {1896,133},--王·菩提道仙衣(男)
--[48] = {1897,134},--王·菩提道仙衣(女)
--[49] = {1898,135},--王·菩提道仙盔
--[50] = {1899,136},--王·菩提道仙链
--[51] = {1900,137},--王·菩提道仙腕
--[52] = {1901,138},--王·菩提道仙戒
--[53] = {1902,139},--王·菩提道仙带
--[54] = {1903,140},--王·菩提道仙靴
--
--[55] = {1904,141},--王·无尘怒斩
--[56] = {1905,142},--王·无尘战幻甲(男)
--[57] = {1906,143},--王·无尘战幻甲(女)
--[58] = {1907,144},--王·无尘战幻盔
--[59] = {1908,145},--王·无尘战幻链
--[60] = {1909,146},--王·无尘战幻腕
--[61] = {1910,147},--王·无尘战幻戒
--[62] = {1911,148},--王·无尘战幻带
--[63] = {1912,149},--王·无尘战幻靴
--
--[64] = {1913,150},--王·无尘禅杖
--[65] = {1914,151},--王·无尘法幻袍(男)
--[66] = {1915,152},--王·无尘法幻袍(女)
--[67] = {1916,153},--王·无尘法幻盔
--[68] = {1917,154},--王·无尘法幻链
--[69] = {1918,155},--王·无尘法幻腕
--[70] = {1919,156},--王·无尘法幻戒
--[71] = {1920,157},--王·无尘法幻带
--[72] = {1921,158},--王·无尘法幻靴
--
--[73] = {1922,159},--王·无尘血剑
--[74] = {1923,160},--王·无尘道幻衣(男)
--[75] = {1924,161},--王·无尘道幻衣(女)
--[76] = {1925,162},--王·无尘道幻盔
--[77] = {1926,163},--王·无尘道幻链
--[78] = {1927,164},--王·无尘道幻腕
--[79] = {1928,165},--王·无尘道幻戒
--[80] = {1929,166},--王·无尘道幻带
--[81] = {1930,167},--王·无尘道幻靴
--
--[82] = {1985,1850,1},--帝·冲天战刀
--[83] = {1986,1851,2},--帝·冲天战甲(男)
--[84] = {1987,1852,3},--帝·冲天战甲(女)
--[85] = {1988,1853,4},--帝·冲天战盔
--[86] = {1989,1854,5},--帝·冲天战链
--[87] = {1990,1855,6},--帝·冲天战腕
--[88] = {1991,1856,7},--帝·冲天战戒
--[89] = {1992,1857,8},--帝·冲天战带
--[90] = {1993,1858,9},--帝·冲天战靴
--
--[91] = {1994,1859,10},--帝·冲天魔杖
--[92] = {1995,1860,11},--帝·冲天魔袍(男)
--[93] = {1996,1861,12},--帝·冲天魔袍(女)
--[94] = {1997,1862,13},--帝·冲天魔盔
--[95] = {1998,1863,14},--帝·冲天魔链
--[96] = {1999,1864,15},--帝·冲天魔腕
--[97] = {2000,1865,16},--帝·冲天魔戒
--[98] = {2001,1866,17},--帝·冲天魔带
--[99] = {2002,1867,18},--帝·冲天魔靴
--
--[100] = {2003,1868,19},--帝·冲天道剑
--[101] = {2004,1869,20},--帝·冲天道衣(男)
--[102] = {2005,1870,21},--帝·冲天道衣(女)
--[103] = {2006,1871,22},--帝·冲天道盔
--[104] = {2007,1872,23},--帝·冲天道链
--[105] = {2008,1873,24},--帝·冲天道腕
--[106] = {2009,1874,25},--帝·冲天道戒
--[107] = {2010,1875,26},--帝·冲天道带
--[108] = {2011,1876,27},--帝·冲天道靴
--
--[109] = {2012,1877,28},--帝·菩提彻地斩
--[110] = {2013,1878,29},--帝·菩提战狂甲(男)
--[111] = {2014,1879,30},--帝·菩提战狂甲(女)
--[112] = {2015,1880,31},--帝·菩提战狂盔
--[113] = {2016,1881,32},--帝·菩提战狂链
--[114] = {2017,1882,33},--帝·菩提战狂腕
--[115] = {2018,1883,34},--帝·菩提战狂戒
--[116] = {2019,1884,35},--帝·菩提战狂带
--[117] = {2020,1885,36},--帝·菩提战狂靴
--
--[118] = {2021,1886,37},--帝·菩提骷髅杖
--[119] = {2022,1887,38},--帝·菩提法痴袍(男)
--[120] = {2023,1888,39},--帝·菩提法痴袍(女)
--[121] = {2024,1889,40},--帝·菩提法痴盔
--[122] = {2025,1890,41},--帝·菩提法痴链
--[123] = {2026,1891,42},--帝·菩提法痴腕
--[124] = {2027,1892,43},--帝·菩提法痴戒
--[125] = {2028,1893,44},--帝·菩提法痴带
--[126] = {2029,1894,45},--帝·菩提法痴靴
--
--[127] = {2030,1895,46},--帝·菩提金纹剑
--[128] = {2031,1896,47},--帝·菩提道仙衣(男)
--[129] = {2032,1897,48},--帝·菩提道仙衣(女)
--[130] = {2033,1898,49},--帝·菩提道仙盔
--[131] = {2034,1899,50},--帝·菩提道仙链
--[132] = {2035,1900,51},--帝·菩提道仙腕
--[133] = {2036,1901,52},--帝·菩提道仙戒
--[134] = {2037,1902,53},--帝·菩提道仙带
--[135] = {2038,1903,54},--帝·菩提道仙靴
--
--[136] = {2039,1904,55},--帝·无尘怒斩
--[137] = {2040,1905,56},--帝·无尘战幻甲(男)
--[138] = {2041,1906,57},--帝·无尘战幻甲(女)
--[139] = {2042,1907,58},--帝·无尘战幻盔
--[140] = {2043,1908,59},--帝·无尘战幻链
--[141] = {2044,1909,60},--帝·无尘战幻腕
--[142] = {2045,1910,61},--帝·无尘战幻戒
--[143] = {2046,1911,62},--帝·无尘战幻带
--[144] = {2047,1912,63},--帝·无尘战幻靴
--
--[145] = {2048,1913,64},--帝·无尘禅杖
--[146] = {2049,1914,65},--帝·无尘法幻袍(男)
--[147] = {2050,1915,66},--帝·无尘法幻袍(女)
--[148] = {2051,1916,67},--帝·无尘法幻盔
--[149] = {2052,1917,68},--帝·无尘法幻链
--[150] = {2053,1918,69},--帝·无尘法幻腕
--[151] = {2054,1919,70},--帝·无尘法幻戒
--[152] = {2055,1920,71},--帝·无尘法幻带
--[153] = {2056,1921,72},--帝·无尘法幻靴
--
--[154] = {2057,1922,73},--帝·无尘血剑
--[155] = {2058,1923,74},--帝·无尘道幻衣(男)
--[156] = {2059,1924,75},--帝·无尘道幻衣(女)
--[157] = {2060,1925,76},--帝·无尘道幻盔
--[158] = {2061,1926,77},--帝·无尘道幻链
--[159] = {2062,1927,78},--帝·无尘道幻腕
--[160] = {2063,1928,79},--帝·无尘道幻戒
--[161] = {2064,1929,80},--帝·无尘道幻带
--[162] = {2065,1930,81},--帝·无尘道幻靴
--
--
--	},
--
--}
--t.main = function(sysarg)
--	local echo = "\\  <(c0xFFb6946c)我只是个炉子,我并不会讲话..>\\";
--	echo = echo .. [[
--
--<(idecoLine#330)>
--
--  <锻造王·冲天战装/@onDzwdZ,1,9|7转战士装备#3件冲天装备即可锻造为1件王·冲天装备> <锻造王·冲天法装/@onDzwdZ,10,18|7转法师装备#3件冲天装备即可锻造为1件王·冲天装备> <锻造王·冲天道装/@onDzwdZ,19,27|7转道士装备#3件冲天装备即可锻造为1件王·冲天装备> 
--
--  <锻造王·菩提战装/@onDzwdZ,28,36|9转战士装备#3件菩提装备即可锻造为1件王·菩提装备> <锻造王·菩提法装/@onDzwdZ,37,45|9转法师装备#3件菩提装备即可锻造为1件王·菩提装备> <锻造王·菩提道装/@onDzwdZ,46,54|9转道士装备#3件菩提装备即可锻造为1件王·菩提装备> 
--
--  <锻造王·无尘战装/@onDzwdZ,55,63|11转战士装备#3件无尘装备即可锻造为1件王·无尘装备> <锻造王·无尘法装/@onDzwdZ,64,72|11转法师装备#3件无尘装备即可锻造为1件王·无尘装备> <锻造王·无尘道装/@onDzwdZ,73,81|11转道士装备#3件无尘装备即可锻造为1件王·无尘装备> 
--
--<(idecoLine#330)>
--
--  <锻造帝·冲天战装/@onDzwdZ,82,90|7转战士装备#3件王·冲天装备即可锻造为1件帝·冲天装备> <锻造帝·冲天法装/@onDzwdZ,91,99|7转法师装备#3件王·冲天装备即可锻造为1件帝·冲天装备> <锻造帝·冲天道装/@onDzwdZ,100,108|7转道士装备#3件王·冲天装备即可锻造为1件帝·冲天装备> 
--
--  <锻造帝·菩提战装/@onDzwdZ,109,117|9转战士装备#3件王·菩提装备即可锻造为1件帝·菩提装备> <锻造帝·菩提法装/@onDzwdZ,118,126|9转法师装备#3件王·菩提装备即可锻造为1件帝·菩提装备> <锻造帝·菩提道装/@onDzwdZ,127,135|9转道士装备#3件王·菩提装备即可锻造为1件帝·菩提装备> 
--
--  <锻造帝·无尘战装/@onDzwdZ,136,144|11转战士装备#3件王·无尘装备即可锻造为1件帝·无尘装备> <锻造帝·无尘法装/@onDzwdZ,145,153|11转法师装备#3件王·无尘装备即可锻造为1件帝·无尘装备> <锻造帝·无尘道装/@onDzwdZ,154,162|11转道士装备#3件王·无尘装备即可锻造为1件帝·无尘装备> 
--
--<(idecoLine#330)>
--
--  <(c0xFFb6946c)对应转生地图的BOSS掉落对应的转生装备.>
--  
--  <分解装备/@FenJie>
--]];
--	return echo;
--end
--
--t.onDzwdZ = function(sysarg,a,b)
--	a,b = tonumber(a),tonumber(b);
--	local d = t.data;
--	local e = "\\  <(c0xFFb6946c)请选择您要锻造的装备:> <返  回/@main>\\\\";
--    for i = a,b do
--        e = e .. string.format("  %s  <点击锻造/@onDzwdZ_only,%s|需要材料:#%s x3>\\\\", Item.getItemLinkMsg(d[i][1]), i, Item.getItemName(d[i][2]));
--    end
--    return e;
--end
--
--t.onDzwdZ_only = function(sysarg,a)
--    if not a then return; end
--    local i = tonumber(a);
--    local d = t.data;
--    local add_nitem = d[i][1];
--    local remove_nitem = d[i][2];
--    local item_count = 1;
--
--
--    if Actor.getItemCount(sysarg, remove_nitem) < 3 then
--        Actor.sendTipmsg(sysarg, string.format("您的 <%s> 不足 <%s> ,锻造失败..", Item.getItemName(remove_nitem), 3), 256);
--        return ;
--    end
--
--    Actor.removeItem(sysarg, remove_nitem, (item_count*3), -1,-1,-1);
--    Actor.addItem(sysarg, add_nitem, 0, 0, item_count,0,0,"sanweizhenhuo",1);
--	local NpcName = Actor.getTalkNpcName(sysarg);
--	local StrNpcE = string.format("<%s/M沙漠土城:159:116:%s><(x沙漠土城:159:116:%s)>",NpcName,NpcName,NpcName);
--	System.broadcastTipmsg(string.format("玩家<(n%s)>通过%s锻造出%s.", Actor.getName(sysarg), StrNpcE, Item.getItemLinkMsg(add_nitem)),128);
--	System.broadcastTipmsg(string.format("玩家<(n%s)>通过%s锻造出%s.", Actor.getName(sysarg), StrNpcE, Item.getItemName(add_nitem)),2);
--    return;
--end
--
------------------------------------------------------------------------------------------以上是锻造
--
------------------------------------------------------------------------------------------以下是分解
--t.FenJie = function(sysarg)
--	local echo = "\\  <(c0xFFb6946c)我只是个炉子,我并不会讲话..>\\";
--	echo = echo .. [[
--
--<(idecoLine#330)>
--
--  <分解王·冲天战装/@onFenJie,1,9|7转战士装备#1件王·冲天装备即可分解为2件冲天装备> <分解王·冲天法装/@onFenJie,10,18|7转法师装备#1件王·冲天装备即可分解为2件冲天装备> <分解王·冲天道装/@onFenJie,19,27|7转道士装备#1件王·冲天装备即可分解为2件冲天装备> 
--
--  <分解王·菩提战装/@onFenJie,28,36|9转战士装备#1件王·菩提装备即可分解为2件菩提装备> <分解王·菩提法装/@onFenJie,37,45|9转法师装备#1件王·菩提装备即可分解为2件菩提装备> <分解王·菩提道装/@onFenJie,46,54|9转道士装备#1件王·菩提装备即可分解为2件菩提装备> 
--
--  <分解王·无尘战装/@onFenJie,55,63|11转战士装备#1件王·无尘装备即可分解为2件无尘装备> <分解王·无尘法装/@onFenJie,64,72|11转法师装备#1件王·无尘装备即可分解为2件无尘装备> <分解王·无尘道装/@onFenJie,73,81|11转道士装备#1件王·无尘装备即可分解为2件无尘装备> 
--
--<(idecoLine#330)>
--
--  <分解帝·冲天战装/@onFenJie,82,90|7转战士装备#1件帝·冲天装备即可分解为7件冲天装备> <分解帝·冲天法装/@onFenJie,91,99|7转法师装备#1件帝·冲天装备即可分解为7件冲天装备> <分解帝·冲天道装/@onFenJie,100,108|7转道士装备#1件帝·冲天装备即可分解为7件冲天装备> 
--
--  <分解帝·菩提战装/@onFenJie,109,117|9转战士装备#1件帝·菩提装备即可分解为7件菩提装备> <分解帝·菩提法装/@onFenJie,118,126|9转法师装备#1件帝·菩提装备即可分解为7件菩提装备> <分解帝·菩提道装/@onFenJie,127,135|9转道士装备#1件帝·菩提装备即可分解为7件菩提装备> 
--
--  <分解帝·无尘战装/@onFenJie,136,144|11转战士装备#1件帝·无尘装备即可分解为7件无尘装备> <分解帝·无尘法装/@onFenJie,145,153|11转法师装备#1件帝·无尘装备即可分解为7件无尘装备> <分解帝·无尘道装/@onFenJie,154,162|11转道士装备#1件帝·无尘装备即可分解为7件无尘装备> 
--
--<(idecoLine#330)>
--  
--  <返  回/@main>
--]];
--	return echo;
--end
--
--t.onFenJie =function(sysarg,a,b)
--	a,b = tonumber(a),tonumber(b);
--	local d = t.data;
--	local e = "\\  <(c0xFFb6946c)请选择您要分解的装备:> <返  回/@FenJie>\\\\";
--    for i = a,b do
--        e = e .. string.format("  %s  <点击分解/@onFenJie_only,%s|需要材料:#%s x1>\\\\", Item.getItemLinkMsg(d[i][1]), i, Item.getItemName(d[i][1]));
--    end
--    return e;
--end
--
--
--t.onFenJie_only = function(sysarg,a)
--	if not a then return; end
--    local i = tonumber(a);
--    local d = t.data;
--    local add_nitem = d[i][2];
--    local remove_nitem = d[i][1];
--    local item_count = 2;
--	
--	--这些都是帝套装
--	if i>=82 then
--		item_count = 7 
--		add_nitem = d[d[i][3]][2]
--	end
--	
--	if Actor.getItemCount(sysarg, remove_nitem) < 1 then
--        Actor.sendTipmsg(sysarg, string.format("您的 <%s> 不足 <%s> ,分解失败..", Item.getItemName(remove_nitem), 1), 256);
--        return ;
--    end
--	
--	--背包空位数量
--	local bagIdxs = Item.getBagEmptyGridCount( sysarg )
--	if bagIdxs < item_count-1 then 
--		Actor.sendTipmsg(sysarg, "背包空间不足以容纳分解得到的物品", ttFlyTip)
--		return 
--	end
--	
--	Actor.removeItem(sysarg, remove_nitem,1);
--    Actor.addItem(sysarg, add_nitem, 0, 0, item_count,0,0,"sanweizhenhuoFJ",1);
--	
--end



-- t.main = function(sysarg)
-- 	local echo = "\\  <(c0xFF705e45)我只是个炉子,我并不会讲话..>\\";
-- 	local str = "只有转生地图BOSS掉落或锻造获得";
-- 	echo = echo .. [[

-- <(idecoLine#330)>

--   <锻造冲天战装/@sldz,1|1转战士装备#]]..str..[[>    <锻造冲天法装/@sldz,10|1转法师装备#]]..str..[[>    <锻造冲天道装/@sldz,19|1转道士装备#]]..str..[[>

--   <锻造菩提战装/@sldz,28|2转战士装备#]]..str..[[>    <锻造菩提法装/@sldz,37|2转法师装备#]]..str..[[>    <锻造菩提道装/@sldz,46|2转道士装备#]]..str..[[>

--   <锻造无尘战装/@sldz,55|5转战士装备#]]..str..[[#当前游戏顶级装备>    <锻造无尘法装/@sldz,64|5转法师装备#]]..str..[[#当前游戏顶级装备>    <锻造无尘道装/@sldz,73|5转道士装备#]]..str..[[#当前游戏顶级装备>

-- <(idecoLine#330)>

--   <装备升阶石兑换冲天之魂/@cldh,1|36个装备升阶石兑换1个冲天之魂#点击则立刻兑换#注意包裹留好空的格子!> <冲天之魂 合成 菩提之魂/@cldh,2|2个冲天之魂兑换1个菩提之魂#点击则立刻兑换#注意包裹留好空的格子!>

--   <冲天类装备兑换冲天之魂/@cldh,3> <菩提类装备兑换菩提之魂/@cldh,4>

-- <(idecoLine#330)>

--   <回收冲天之魂/@hshcl,1> <(c0xFF705e45)每颗回收获得> <250> <(c0xFF705e45)元宝>

--   <回收菩提之魂/@hshcl,2> <(c0xFF705e45)每颗回收获得> <500> <(c0xFF705e45)元宝>

--   <转生地图小怪掉落以上2种魂魄,寻宝也出,寻宝还出特戒结晶.>
-- ]]

-- 	return echo;
-- end

-- t.cldh = function(sysarg,idx)
-- 	if not idx then return; end
-- 	idx = tonumber(idx);
-- 	if idx == 1 then 
-- 		if Actor.getItemCount(sysarg,318) >= 36 then
-- 			Actor.removeItem(sysarg,318,36,-1,-1,-1);
-- 			Actor.addItem(sysarg, t.item_cth_id, 0, 0, 1);
-- 		else
-- 			Actor.sendTipmsg(sysarg, string.format("您的 <%s> 不足 <%s>,兑换失败.",Item.getItemName(318),36), 256);
-- 			return;
-- 		end
-- 	elseif idx == 2 then
-- 		if Actor.getItemCount(sysarg,t.item_cth_id) >= 2 then
-- 			Actor.removeItem(sysarg,t.item_cth_id,2,-1,-1,-1);
-- 			Actor.addItem(sysarg, t.item_pth_id, 0, 0, 1);
-- 		else
-- 			Actor.sendTipmsg(sysarg, string.format("您的 <%s> 不足 <%s>,兑换失败.",Item.getItemName(t.item_cth_id),2), 256);
-- 			return;
-- 		end
-- 	elseif idx == 3 then
-- 		local d = t.data;
-- 		local e = "\\  <(c0xFF705e45)请问您想拿哪件来兑换?>\\  <(c0xFF705e45)鼠标移动到名字上即可查看详细信息.>\\\\<(idecoLine#330)>\\\\";

-- 		for i = 1,27 do
-- 			if d[i] then
-- 				local a,b = math.modf(i/3);
-- 				local hhf = "    ";
-- 				if b == 0 then hhf = "\\"; end
-- 				if i == 9 or i == 18 then hhf = "\\\\"; end
-- 				e = e .. string.format("  <%s/@oncldh,%s|点击一下获得%s个冲天之魂#然后你包裹里这件装备就被收走啦..>%s", Item.getItemName(d[i].itemid), i, d[i].hscth, hhf);
-- 			end
-- 		end
-- 		e = e .. "\\<(idecoLine#330)>\\\\                                    <返回主页/@main|摆的不好看怪我咯~>";
-- 		return e;
-- 	elseif idx == 4 then
-- 		local d = t.data;
-- 		local e = "\\  <(c0xFF705e45)请问您想拿哪件来兑换?>\\  <(c0xFF705e45)鼠标移动到名字上即可查看详细信息.>\\\\<(idecoLine#330)>\\\\";

-- 		for i = 28,54 do
-- 			if d[i] then
-- 				local a,b = math.modf(i/3);
-- 				local hhf = "    ";
-- 				if b == 0 then hhf = "\\"; end
-- 				if i == 36 or i == 45 then hhf = "\\\\"; end
-- 				e = e .. string.format("  <%s/@oncldh,%s|点击一下获得%s个菩提之魂#然后你包裹里这件装备就被收走啦..>%s", Item.getItemName(d[i].itemid), i, d[i].hspth, hhf);
-- 			end
-- 		end
-- 		e = e .. "\\<(idecoLine#330)>\\\\                                    <返回主页/@main|摆的不好看怪我咯~>";
-- 		return e;
-- 	end
-- end

-- t.hshcl = function(sysarg,i)
-- 	if not i then return; end
-- 	i = tonumber(i);
-- 	local sid = 0;
-- 	local sgold = 0;
-- 	if i == 1 then
-- 		sid = t.item_cth_id;
-- 		sgold = 250;
-- 	elseif i == 2 then
-- 		sid = t.item_pth_id;
-- 		sgold = 500;
-- 	end
-- 	if Actor.getItemCount(sysarg, sid) >= 1 then
-- 		Actor.removeItem(sysarg, sid,1,-1,-1,-1);
-- 		Actor.changeMoney(sysarg, 3, sgold);
-- 		Actor.sendTipmsg(sysarg, "回收成功!", 256);
-- 	else
-- 		Actor.sendTipmsg(sysarg, string.format("亲,您的包裹内没有 <%s> ,回收失败.",Item.getItemName(sid)), 256);
-- 		return;
-- 	end
-- end

-- t.oncldh = function(sysarg,i)
-- 	if not i then return; end
-- 	i = tonumber(i);
-- 	local d = t.data;
-- 	if not d[i] then return; end
-- 	local itemid = d[i].itemid;
-- 	local hscth = d[i].hscth;
-- 	local hspth = d[i].hspth;
-- 	if Actor.getItemCount(sysarg, itemid) >= 1 then
-- 		Actor.removeItem(sysarg, itemid,1,-1,-1,-1);
-- 		Actor.addItem(sysarg, t.item_cth_id, 0, 0, hscth);
-- 		Actor.addItem(sysarg, t.item_pth_id, 0, 0, hspth);
-- 	else
-- 		Actor.sendTipmsg(sysarg, string.format("亲,您的包裹内没有 <%s> ,兑换失败.",Item.getItemName(itemid)), 256);
-- 		return;
-- 	end
-- end

-- t.sldz = function(sysarg,a)
-- 	if not a then return; end
-- 	a = tonumber(a);
-- 	local b = a + 4;
-- 	local d = t.data;
-- 	if not d[a] then return; end
-- 	local cthid = t.item_cth_id;
-- 	local pthid = t.item_pth_id;
-- 	local e = "\\  <(c0xFF705e45)请选择您想锻造的部位:>\\  <(c0xFF705e45)鼠标移动到锻造按钮上即可查看锻造需求.>\\\\<(idecoLine#330)>\\\\";
-- 	for i = a,b do
-- 		local sgold = (d[i].needgold / 10000) .. "万";
-- 		if a >= 1 and a <= 27 then
-- 			e = e .. string.format("  <(iitem#%s#1)>%s <点击进行锻造/@onsldz,%s|以下是合成此装备的材料需求##&3db8ff&1. %s x%s#&3db8ff&2. 绑定或金币 x%s#&3db8ff&3. %s x1##&fff000&看清楚需求#点错概不负责#虽然我只是个炉子但我说话算数>\\", d[i].itemid, Item.getItemLinkMsg(d[i].itemid), i, Item.getItemName(cthid), d[i].needcth, sgold, Item.getItemName(d[i].needitemid));
-- 		elseif a >= 28 and a <= 54 then
-- 			e = e .. string.format("  <(iitem#%s#1)>%s <点击进行锻造/@onsldz,%s|以下是合成此装备的材料需求##&3db8ff&1. %s x%s#&3db8ff&2. 绑定或金币 x%s#&3db8ff&3. %s x1##&fff000&看清楚需求#点错概不负责#虽然我只是个炉子但我说话算数>\\", d[i].itemid, Item.getItemLinkMsg(d[i].itemid), i, Item.getItemName(pthid), d[i].needpth, sgold, Item.getItemName(d[i].needitemid));
-- 		elseif a >= 55 and a <= 81 then
-- 			e = e .. string.format("  <(iitem#%s#1)>%s <点击进行锻造/@onsldz,%s|以下是合成此装备的材料需求##&3db8ff&1. %s x%s#&3db8ff&2. %s x%s#&3db8ff&3. 绑定或金币 x%s#&3db8ff&4. %s x1##&fff000&看清楚需求#点错概不负责#虽然我只是个炉子但我说话算数>\\", d[i].itemid, Item.getItemLinkMsg(d[i].itemid), i, Item.getItemName(cthid), d[i].needcth, Item.getItemName(pthid), d[i].needpth, sgold, Item.getItemName(d[i].needitemid));
-- 		end
-- 	end
-- 	local snex = "下一页";
-- 	local n,m = math.modf((a + 8) / 9);
-- 	if m ~= 0 then snex = "上一页"; b = a - 4; end
-- 	e = e .. string.format("<(idecoLine#330)>\\\\                            <%s/@sldz,%s> <返回主页/@main>", snex, b);
-- 	return e;
-- end

-- t.onsldz = function(sysarg,i)
-- 	if not i then return; end
-- 	i = tonumber(i);
-- 	local d = t.data;
-- 	if not d[i] then return; end
-- 	local cthid = t.item_cth_id;
-- 	local pthid = t.item_pth_id;
-- 	local itemid = d[i].itemid;
-- 	local needitemid = d[i].needitemid;
-- 	local needgold = d[i].needgold;
-- 	local needcth = d[i].needcth;
-- 	local needpth = d[i].needpth;
-- 	local MC = 2;
-- 	if Actor.getMoneyCount(sysarg,1) >= needgold then MC = 1; end
-- 	if Actor.getMoneyCount(sysarg,0) >= needgold then MC = 0; end
-- 	if MC == 2 then
-- 		Actor.sendTipmsg(sysarg, string.format("您的绑金或金币不足 <%s> ,锻造失败..",needgold), 256);
-- 		return;
-- 	end
-- 	if Actor.getItemCount(sysarg,needitemid) == 0 then
-- 		Actor.sendTipmsg(sysarg, string.format("您的包裹内没有 <%s> ,锻造失败.",Item.getItemName(needitemid)), 256);
-- 		return;
-- 	end
-- 	if needcth ~= 0 then
-- 		if Actor.getItemCount(sysarg,cthid) < needcth then
-- 			Actor.sendTipmsg(sysarg, string.format("您的 <%s> 不足 <%s>,锻造失败.",Item.getItemName(cthid),needcth), 256);
-- 			return;
-- 		end
-- 	end
-- 	if needpth ~= 0 then
-- 		if Actor.getItemCount(sysarg,pthid) < needpth then
-- 			Actor.sendTipmsg(sysarg, string.format("您的 <%s> 不足 <%s>,锻造失败.",Item.getItemName(pthid),needpth), 256);
-- 			return;
-- 		end
-- 	end
-- 	Actor.changeMoney(sysarg, MC, -needgold);
-- 	Actor.removeItem(sysarg,needitemid,1,-1,-1,-1);
-- 	if needcth ~= 0 then
-- 		Actor.removeItem(sysarg,cthid,needcth,-1,-1,-1);
-- 	end
-- 	if needpth ~= 0 then
-- 		Actor.removeItem(sysarg,pthid,needpth,-1,-1,-1);
-- 	end
-- 	Actor.addItem(sysarg, itemid, 0, 0, 1);
-- 	local NpcName = Actor.getTalkNpcName(sysarg);
-- 	local StrNpcE = string.format("<%s/M沙漠土城:159:116:%s><(x沙漠土城:159:116:%s)>",NpcName,NpcName,NpcName);
-- 	System.broadcastTipmsg(string.format("玩家<(n%s)>通过%s锻造出%s.", Actor.getName(sysarg), StrNpcE, Item.getItemLinkMsg(itemid)),128+2);
-- end

t.OnDragonEquipFuse = function(sysarg,nIndex,nType,nOneIndex)
    nIndex = tonumber(nIndex)
 
     if nIndex <= 0 or nIndex > #EquipDragonCfg.Fuse then return "wtf!!" end
    local cfg = EquipDragonCfg.Fuse[nIndex]
 
    local str ="\\<(c0xFFffff00)龍之道具通过寻宝产出,可用于融合4转以上装备>\\\\"
    for i =1,#cfg do
       
        str = str.."      <"..cfg[i].Name.."/@onDragonEquipFuseEx,"..nIndex..","..i..","..nType..","..nOneIndex..">"
        if i % 3 == 0 then str = str.."\\\\<(idecoLine#330)>\\" else str = str.."    " end
    end
   
    str = str.."\\\\\\\\\\			<返回上一页/@OnDragonEquipFuseList,"..nOneIndex..","..nType..">"
 
    return str
end
--锻造指定装备道具
t.onDragonEquipFuseEx = function(sysarg,nIndex,nItemIndex,nType,nOneIndex)
     nIndex = tonumber(nIndex)
     nItemIndex = tonumber(nItemIndex)
     nType = tonumber(nType)

     if nIndex <= 0 or nIndex > #EquipDragonCfg.Fuse then return "wtf!!" end
     if nItemIndex <= 0 or nItemIndex > #EquipDragonCfg.Fuse[nIndex] then return "wtf111!!" end
     local cfg = EquipDragonCfg.Fuse[nIndex][nItemIndex].Item
     local str ="\\<(c0xFFffff00)请选择您要融合的装备部件.如果不满意还可以拆分.>\\\\"
     for i =1,#cfg do
        if nType == 1 then
            str = str..  "  	<"..cfg[i].Name.."/@onDragonEquipFuseExEx,"..nIndex..","..nItemIndex..","..i..","..nType..","..nOneIndex..">";
        else --拆分
            str = str..  "  	<"..cfg[i].Name.."/@onDragonEquipSplitExEx,"..nIndex..","..nItemIndex..","..i..","..nType..","..nOneIndex..">";
        end

        if i % 2 == 0 then str = str.."\\" else str = str.."     " end
     end

	 str = str.."		\\			<返回上一页/@OnDragonEquipFuse,"..nIndex..","..nType..","..nOneIndex..">"
	 
     return str
	
end
t.onDragonEquipSplitExEx = function(sysarg,nIndex,nItemIndex,n,nType,nOneIndex)
     nIndex = tonumber(nIndex)
     nItemIndex = tonumber(nItemIndex)
     n = tonumber(n)
    
     if nIndex <= 0 or nIndex > #EquipDragonCfg.Fuse then return "wtf!!" end
     if nItemIndex <= 0 or nItemIndex > #EquipDragonCfg.Fuse[nIndex] then return "wtf111!!" end
     local cfg = EquipDragonCfg.Fuse[nIndex][nItemIndex].Item
     if n <= 0 or n > #cfg then return "wtf!!!!!!"end 
     cfg = cfg[n].List
     local str ="      " --"..EquipDragonCfg.Fuse[nIndex][nItemIndex].Name.."拆分<(idecoLine#330)>\\
     local szTypeName={"I","II","III","IV", "V"}
    
     for i=1,#cfg do
      
       local szName = Item.getItemName(cfg[i].id)
        szName = string.sub(szName,1,6)
        local king = ""
        if cfg[i].pro == 1 then
            king = "王·"
        elseif cfg[i].pro == 2 then
            king = "帝·"
        end
        if king == "" then
            szName = king..szName.."·"
        else
             szName = king..szName
        end
       
        local nItemIndexSave = nItemIndex
        local nItemIndex = Item.getItemPropertyById(cfg[i].id,Item.ipItemType)
     
        if string.find(Item.getItemName(cfg[i].id),"女") ~= nil then
            nItemIndex = 5

        end
        local szId = "<#c0x00FF00FF#"..king..Item.getItemName(cfg[i].id).."/v1,"..cfg[i].id..",0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"..cfg[i].pro..",0,0,0,0,0,0,0,0,0,0>"
        szName = szName..EquipDragonCfg.TypeName[nItemIndex]
        szName = szName..szTypeName[nIndex]
        local szLinkMsg = "\\<(ifragments#16#18)><#c0x00FF00FF#"..szName.."/v1,"..cfg[i].id..",0,0,0,0,1,0,0,0,0,0,0,0,0,0,"..nIndex..",0,0,0,0,0,0,0,"..cfg[i].pro..",0,0,0,0,0,0,0,0,0,0>"
        str =  str..szLinkMsg.."+"..cfg[i].money.."元宝<拆分为>"..szId.."与"..Item.getItemLinkMsg(cfg[i].id2).." <拆分/@onDragonEquipSplitExExEx,"..cfg[i].id..","..cfg[i].id2..","..cfg[i].pro..","..nIndex..","..cfg[i].money..","..nItemIndexSave..","..n..","..i..">\\"

     end
	 	str = str.."\\			<返回上一页/@onDragonEquipFuseEx,"..nIndex..","..nItemIndex..","..nType..","..nOneIndex..">"
     return str

end
t.onDragonEquipFuseExEx = function(sysarg,nIndex,nItemIndex,n,nType,nOneIndex)
     nIndex = tonumber(nIndex)
     nItemIndex = tonumber(nItemIndex)
     n = tonumber(n)
    
     if nIndex <= 0 or nIndex > #EquipDragonCfg.Fuse then return "wtf!!" end
     if nItemIndex <= 0 or nItemIndex > #EquipDragonCfg.Fuse[nIndex] then return "wtf111!!" end
     local cfg = EquipDragonCfg.Fuse[nIndex][nItemIndex].Item
     if n <= 0 or n > #cfg then return "wtf!!!!!!"end 
     cfg = cfg[n].List
     local str ="     "  -- "..EquipDragonCfg.Fuse[nIndex][nItemIndex].Name.."融合\\
     local szTypeName={"I","II","III","IV", "V"}
    
     for i=1,#cfg do
       
        local szName = Item.getItemName(cfg[i].id)
        szName = string.sub(szName,1,6)
        local king = ""
        if cfg[i].pro == 1 then
            king = "王·"
        elseif cfg[i].pro == 2 then
            king = "帝·"
        end
         if king == "" then
            szName = king..szName.."·"
        else
             szName = king..szName
        end
       
        local nItemIndexSave = nItemIndex
        local nItemIndex = Item.getItemPropertyById(cfg[i].id,Item.ipItemType)
       
        if string.find(Item.getItemName(cfg[i].id),"女") ~= nil then
            nItemIndex = 5
        end
        
        szName = szName..EquipDragonCfg.TypeName[nItemIndex]
        szName = szName..szTypeName[nIndex]
        local szLinkMsg = "<#c0x00FF00FF#"..szName.."/v1,"..cfg[i].id..",0,0,0,0,1,0,0,0,0,0,0,0,0,0,"..nIndex..",0,0,0,0,0,0,0,"..cfg[i].pro..",0,0,0,0,0,0,0,0,0,0>"
        local szId = " \\ <(ifragments#16#18)><#c0x00FF00FF#"..king..Item.getItemName(cfg[i].id).."/v1,"..cfg[i].id..",0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,"..cfg[i].pro..",0,0,0,0,0,0,0,0,0,0>"
        
        str = str..szId.." + "..Item.getItemLinkMsg(cfg[i].id2).."="..szLinkMsg.."  <融合/@onDragonEquipFuseExExEx,"..cfg[i].id..","..cfg[i].id2..","..cfg[i].pro..","..nIndex..","..nItemIndexSave..","..n..","..i..">\\"
		
	 end
	 	str = str.."\\			<返回上一页/@onDragonEquipFuseEx,"..nIndex..","..nItemIndex..","..nType..","..nOneIndex..">"
     return str
end
t.onDragonEquipFuseExExEx = function(sysarg,nId,nId2,nPro,nLevel,_nItemIndex,_n,_i)
	----- xsp
	local _nIndex = tonumber(nLevel)
	_nItemIndex = tonumber(_nItemIndex)
	_n = tonumber(_n)
	_i = tonumber(_i)
	
	if _nIndex <= 0 or _nIndex > #EquipDragonCfg.Fuse then return  end
     if _nItemIndex <= 0 or _nItemIndex > #EquipDragonCfg.Fuse[_nIndex] then return  end
     local _cfg = EquipDragonCfg.Fuse[_nIndex][_nItemIndex].Item
     if _n <= 0 or _n > #_cfg then return end 
     _cfg = _cfg[_n].List
     
     if _i <= 0 or _i > #_cfg then return end
     local _itemcfg = _cfg[_i]
     
	------ xsp
    nId = _itemcfg.id --tonumber(nId)
    nId2 = _itemcfg.id2 --tonumber(nId2)
    nPro = _itemcfg.pro --tonumber(nPro)
    nLevel = tonumber(nLevel)
    --材料id
    if Actor.getItemCount(sysarg,nId2) <= 0 then
        Actor.sendTipmsg(sysarg,Item.getItemName(nId2).."不足1个,无法融合！",ttFlyTip);
        return
    end
    local pItemPtr = nil
    local bagCount = Item.getBagItemCount( sysarg )  --玩家背包装备数
    local sTypeName = ""
    local nFuHunLev = -1
    for i = 1, bagCount do
		local bagEquipPtr = Item.getBagItemBySortID( sysarg, i )
		if bagEquipPtr then
            if Item.getItemProperty(sysarg,bagEquipPtr,Item.ipItemID) == nId then
                local nSuperLevel = Item.getItemProperty(sysarg,bagEquipPtr,Item.ipItemSuperAttrLevel)
                if nPro == 0 and Item.getItemProperty(sysarg,bagEquipPtr,Item.ipDragonEquipLevel) == 0 and nSuperLevel == 0 then
                    --pItemPtr = bagEquipPtr
                    if Item.getFuHunInfo(bagEquipPtr,1) > nFuHunLev then
                        pItemPtr = bagEquipPtr
                        nFuHunLev = Item.getFuHunInfo(pItemPtr,1)
                    end
                    --break
                elseif nPro == 1 then --王
                    if nSuperLevel > 0 
                        and nSuperLevel % 2 ==1 
                        and Item.getItemProperty(sysarg,bagEquipPtr,Item.ipDragonEquipLevel) == 0 then
                        --pItemPtr = bagEquipPtr                       
                        --break
                        if Item.getFuHunInfo(bagEquipPtr,1) > nFuHunLev then
                            pItemPtr = bagEquipPtr
                            nFuHunLev = Item.getFuHunInfo(pItemPtr,1)
                        end
                    end
                     sTypeName = "王·"
                elseif nPro == 2 then --帝
                     if nSuperLevel > 0  
                        and nSuperLevel % 2 ==0  
                        and Item.getItemProperty(sysarg,bagEquipPtr,Item.ipDragonEquipLevel) == 0  then
                            if Item.getFuHunInfo(bagEquipPtr,1) > nFuHunLev then
                                pItemPtr = bagEquipPtr
                                nFuHunLev = Item.getFuHunInfo(pItemPtr,1)
                            end
                        --pItemPtr = bagEquipPtr
                        --break
                    end   
                    sTypeName = "帝·"                
                end
            end
        end
    end
    if pItemPtr == nil then
        if sTypeName == "" then
            if nPro == 1 then 
                sTypeName = "王·"
            elseif nPro == 2 then
                sTypeName = "帝·"
            end

        end
        Actor.sendTipmsg(sysarg,sTypeName..Item.getItemName(nId).."不足1个,无法融合！",ttFlyTip);
        return
    end
    Actor.removeItem(sysarg,nId2,1,-1,-1,-1,"龍装融合",LogIds.DragonEquipFuse)
    local nActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
   
    Item.setItemProperty(sysarg,pItemPtr,Item.ipDragonEquipLevel,nLevel)
    local nGuild = Item.getItemGuid(pItemPtr)
  
    -- System.sendCommonLog(LogIds.DragonEquipFuse,nActorId,Actor.getName(sysarg),Item.getItemProperty(sysarg,pItemPtr,Item.ipItemID),nLevel,0,"","龙装融合",tostring(nGuild),"","","","",Item.GetItemNameEx(pItemPtr))
    Item.SendItemLog(sysarg,pItemPtr,"龙装融合",LogIds.DragonEquipFuse)
    Actor.sendTipmsg(sysarg,"融合成功,获得"..Item.GetItemNameEx(pItemPtr)..".",ttFlyTip);
    local nItemId = Item.getItemProperty(sysarg,pItemPtr,Item.ipItemID)
    local szLinkMsg = "<#c0x00FF00FF#"..Item.GetItemNameEx(pItemPtr).."/v1,"..nItemId..",0,0,0,0,1,0,0,0,0,0,0,0,0,0,"..nLevel..",0,0,0,0,0,0,0,"..nPro..",0,0,0,0,0,0,0,0,0,0>"
   
    local str = string.format("<(n%s)>玩家将%s融合成%s,我也要融合<(x沙漠土城:172:124:三昧真火炉)> ",Actor.getName(sysarg),Item.getItemLinkMsg(nId),szLinkMsg)
    System.broadcastTipmsg(str,ttChatWindow )
    str = string.format("<(n%s)>玩家将<(c0xffff0000)%s>融合成%s",Actor.getName(sysarg),Item.getItemName(nId),szLinkMsg)
    System.broadcastTipmsg(str,ttScreenCenter )
    --随机召唤强度
--    if Item.getItemProperty(sysarg,pItemPtr,Item.ipItemNeedVocation) == 3 then

--    end
   -- System.sendCommonLog(LogIds.DragonEquipFuse,Actor.getIntProperty(sysarg,PROP_ENTITY_ID),Actor.getName(sysarg),nId,0,0,Item.getItemGuid(pItemPtr))
   -- Actor.collectOperate(sysarg,0)
end

t.onDragonEquipSplitExExEx =  function(sysarg,nId,nId2,nPro,nLevel,nMoney,_nItemIndex, _n, _i)
	--------- xsp
	_nItemIndex = tonumber(_nItemIndex)
	_n = tonumber(_n)
	_i = tonumber(_i)
	local _nIndex = tonumber(nLevel)
	if _nIndex <= 0 or _nIndex > #EquipDragonCfg.Fuse then return  end
     if _nItemIndex <= 0 or _nItemIndex > #EquipDragonCfg.Fuse[_nIndex] then return  end
     local _cfg = EquipDragonCfg.Fuse[_nIndex][_nItemIndex].Item
     if _n <= 0 or _n > #_cfg then return "wtf!!!!!!"end 
     _cfg = _cfg[_n].List
     if (_i <= 0 or _i > #_cfg) then return end
     
     local _itemcfg = _cfg[_i]
     
	--------- xsp
	
    nId = _itemcfg.id --tonumber(nId)
    nId2 = _itemcfg.id2 --tonumber(nId2)
    nPro = _itemcfg.pro --tonumber(nPro)
    nMoney = _itemcfg.money --tonumber(nMoney)
    
    if Item.getBagEmptyGridCount(sysarg) <= 0 then
        Actor.sendTipmsg(sysarg,"包裹空间不足一格，无法拆分！",ttFlyTip);
        return
    end
    if Actor.getMoneyCount(sysarg,mtYuanbao) < nMoney then
        Actor.sendTipmsg(sysarg,"元宝不足"..nMoney.."，无法拆分！",ttFlyTip);
        return
    end
    local pItemPtr = nil
    local bagCount = Item.getBagItemCount( sysarg )  --玩家背包装备数
    for i = 1, bagCount do
		local bagEquipPtr = Item.getBagItemBySortID( sysarg, i )
		if bagEquipPtr then
            if Item.getItemProperty(sysarg,bagEquipPtr,Item.ipItemID) == nId and  Item.getItemProperty(sysarg,bagEquipPtr,Item.ipDragonEquipLevel) == tonumber(nLevel)   then

                local nSuperLevel = Item.getItemProperty(sysarg,bagEquipPtr,Item.ipItemSuperAttrLevel)
                if nPro == 0 and nSuperLevel == 0 then
                    pItemPtr = bagEquipPtr
                    break
                elseif nPro == 1 then --王
                    if nSuperLevel > 0 
                        and nSuperLevel % 2 ==1  then
                        pItemPtr = bagEquipPtr
                        break
                    end
                elseif nPro == 2 then --帝
                     if nSuperLevel > 0 
                        and nSuperLevel % 2 ==0   then
                        pItemPtr = bagEquipPtr
                        break
                    end                   
                end
            end
        end
    end
    if pItemPtr == nil then
        Actor.sendTipmsg(sysarg,"材料不足,无法拆分！",ttFlyTip);
        return
    end
    --扣元宝
    Actor.changeMoney(sysarg,mtYuanbao,-nMoney,LogIds.DragonEquipSplit,"龍装拆分")
    local nLevel = Item.getItemProperty(sysarg,pItemPtr,Item.ipDragonEquipLevel)
    local nActorId = Actor.getIntProperty(sysarg,PROP_ENTITY_ID)
   -- System.sendCommonLog(LogIds.DragonEquipSplit,nActorId,Actor.getName(sysarg),Item.getItemProperty(sysarg,pItemPtr,Item.ipItemID),nLevel,0,"","龙装拆分",tonumber(Item.getItemGuid(pItemPtr)),"","","","",Item.GetItemNameEx(pItemPtr))
    Item.setItemProperty(sysarg,pItemPtr,Item.ipDragonEquipLevel,0)
    Item.SendItemLog(sysarg,pItemPtr,"龙装拆分",LogIds.DragonEquipSplit)
    Actor.addItem(sysarg,nId2,0,0,1,0,0,"龍装拆分",LogIds.DragonEquipSplit)
    local str ="拆分成功,获得:"..Item.GetItemNameEx(pItemPtr).."+"..Item.getItemName(nId2)
    Actor.sendTipmsg(sysarg,str,ttFlyTip);
   
end

function GetNpcSanWeiZhenHuo() return t end
