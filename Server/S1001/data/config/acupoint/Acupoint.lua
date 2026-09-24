--lua script

--经脉相关的配置

--#include "..\..\language\LangCode.txt"
Acupoints =
{
	{
		jmId = 1,		--经脉id
		jmName = Lang.JingMai.s0001,	--经脉名称“任脉”，注意这个要用语言包
		jmDesc = Lang.JingMai.s0001desc,	--经脉描述，这个字段不知道有没有用，先定义
		--本经脉下的穴位
		points = {
--#include "1.lua"
--#include "2.lua"
--#include "3.lua"
--#include "4.lua"
--#include "5.lua"
--#include "6.lua"
--#include "7.lua"
--#include "8.lua"
--#include "9.lua"
--#include "10.lua"

			},
	},

	{
		jmId = 2,		--经脉id
		jmName = Lang.JingMai.s0002,	--经脉名称“督脉”，注意这个要用语言包
		jmDesc = Lang.JingMai.s0002desc,	--经脉描述，这个字段不知道有没有用，先定义
		--本经脉下的穴位
		points = {
--#include "11.lua"
--#include "12.lua"
--#include "13.lua"
--#include "14.lua"
--#include "15.lua"
--#include "16.lua"
--#include "17.lua"
--#include "18.lua"
--#include "19.lua"
--#include "20.lua"

			},
	},

	{
		jmId = 3,		--经脉id
		jmName = Lang.JingMai.s0003,	--经脉名称“阴脉”，注意这个要用语言包
		jmDesc = Lang.JingMai.s0003desc,	--经脉描述，这个字段不知道有没有用，先定义
		--本经脉下的穴位
		points = {
--#include "21.lua"
--#include "22.lua"
--#include "23.lua"
--#include "24.lua"
--#include "25.lua"
--#include "26.lua"

			},
	},

	{
		jmId = 4,		--经脉id
		jmName = Lang.JingMai.s0004,	--经脉名称“阳脉”，注意这个要用语言包
		jmDesc = Lang.JingMai.s0004desc,	--经脉描述，这个字段不知道有没有用，先定义
		--本经脉下的穴位
		points = {
--#include "27.lua"
--#include "28.lua"
--#include "29.lua"
--#include "30.lua"
--#include "31.lua"
--#include "32.lua"
			},
	},
}