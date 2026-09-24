--财神的配置

--lua script
--#include "..\..\language\LangCode.txt"

GodWealthConfig = 
{
	freeTimes = 10,			--免费投骰子的次数
	bindYb = 5,				--增加摇骰子次数需要的绑定元宝
	nYb = 2,				--增加摇骰子次数需要的元宝

	clearTimebindYb = 0,		--清除冷却时间需要的绑定元宝
	clearTimeNeedYb = 3,		--清除冷却时间需要的元宝

	reSetEventNeedBindYb = 0,		--重置事件需要的绑定元宝
	reSetEventNeedYb = 10,			--重置事件需要的元宝
	
	reSetTip = Lang.Activity.resettip,                  --重置按钮提示
	playDiceTip = Lang.Activity.playDiceTip,               --投骰子按钮提示
	cooldownTip = Lang.Activity.cooldownTip,               --秒冷却时间提示
	addTickTip = Lang.Activity.addTickTip,                --增加次数按钮提示
	chuangGuanText = Lang.Activity.chuangGuanText,                                 --闯关说明
	

	--所有关卡
	CheckPoints = 
	{
		--第一关
		{
			title = Lang.Activity.cs0001,      --关卡的名称
			eventCount = 5,						--事件的个数

			endPointDesc = Lang.Activity.lb0001,                 --终点礼包提示
			nextPointDesc = Lang.Activity.gk0001,                --下一关提示
			
			--显示下一关的情况,第一个是箭头,第二个是问号
			endPoint =
			{
				{x=3, y=0, needArrow=true, arrowDir=6},
				{x=2, y=0, needArrow=false, arrowDir=0},
			},
			--可走的点
			points = 
			{
				--x, y就是坐标,从0开始    needArrow 是否需要箭头   arrowDir  箭头的方向 0上 2右 4下 6左
				{x=0, y=5, needArrow=false, arrowDir=0},
				{x=1, y=5, needArrow=true, arrowDir=2},
				{x=2, y=5, needArrow=false, arrowDir=0},
				{x=2, y=6, needArrow=false, arrowDir=0},
				{x=2, y=7, needArrow=false, arrowDir=0},
				{x=2, y=8, needArrow=true, arrowDir=4},
				{x=2, y=9, needArrow=false, arrowDir=0},
				{x=2, y=10, needArrow=false, arrowDir=0},
				{x=2, y=11, needArrow=false, arrowDir=0},
				{x=3, y=11, needArrow=false, arrowDir=0},
				{x=4, y=11, needArrow=false, arrowDir=0},
				{x=5, y=11, needArrow=true, arrowDir=2},
				{x=6, y=11, needArrow=false, arrowDir=0},
				{x=7, y=11, needArrow=false, arrowDir=0},
				{x=8, y=11, needArrow=false, arrowDir=0},
				{x=9, y=11, needArrow=true, arrowDir=2},
				{x=10, y=11, needArrow=false, arrowDir=0},
				{x=11, y=11, needArrow=false, arrowDir=0},
				{x=11, y=10, needArrow=false, arrowDir=0},
				{x=11, y=9, needArrow=false, arrowDir=0},
				{x=11, y=8, needArrow=false, arrowDir=0},
				{x=11, y=7, needArrow=false, arrowDir=0},
				{x=11, y=6, needArrow=true, arrowDir=0},
				{x=11, y=5, needArrow=false, arrowDir=0},
				{x=11, y=4, needArrow=false, arrowDir=0},
				{x=11, y=3, needArrow=false, arrowDir=0},
				{x=11, y=2, needArrow=false, arrowDir=0},
				{x=11, y=1, needArrow=false, arrowDir=0},
				{x=11, y=0, needArrow=false, arrowDir=0},
				{x=10, y=0, needArrow=false, arrowDir=0},
				{x=9, y=0, needArrow=false, arrowDir=0},
				{x=8, y=0, needArrow=true, arrowDir=6},
				{x=7, y=0, needArrow=false, arrowDir=0},
				{x=6, y=0, needArrow=false, arrowDir=0},
				{x=5, y=0, needArrow=false, arrowDir=0},
				{x=4, y=0, needArrow=false, arrowDir=0},
				
				
			},
		},

		--第二关
		{
			title = Lang.Activity.cs0002,      --关卡的名称
			eventCount = 5,						--事件的个数
			
      endPointDesc = Lang.Activity.lb0002,                 --终点礼包提示
			nextPointDesc = Lang.Activity.gk0002,                --下一关提示  
			
			--显示下一关的情况,第一个是箭头,第二个是问号
			endPoint =
			{
				{x=10, y=0, needArrow=true, arrowDir=2},
				{x=11, y=0, needArrow=false, arrowDir=0},
			},

			--可走的点
			points = 
			{
				--x, y就是坐标,从0开始    needArrow 是否需要箭头   arrowDir  箭头的方向 0上 2右 4下 6左
				{x=0, y=5, needArrow=false, arrowDir=0},
				{x=1, y=5, needArrow=true, arrowDir=2},
				{x=2, y=5, needArrow=false, arrowDir=0},
				{x=2, y=6, needArrow=false, arrowDir=0},
				{x=2, y=7, needArrow=false, arrowDir=0},
				{x=1, y=7, needArrow=false, arrowDir=0},
				{x=1, y=8, needArrow=true, arrowDir=4},
				{x=1, y=9, needArrow=false, arrowDir=0},
				{x=1, y=10, needArrow=false, arrowDir=0},
				{x=2, y=10, needArrow=false, arrowDir=0},
				{x=2, y=11, needArrow=false, arrowDir=0},
				{x=3, y=11, needArrow=false, arrowDir=0},
				{x=4, y=11, needArrow=true, arrowDir=2},
				{x=5, y=11, needArrow=false, arrowDir=0},
				{x=6, y=11, needArrow=false, arrowDir=0},
				{x=7, y=11, needArrow=false, arrowDir=0},
				{x=8, y=11, needArrow=true, arrowDir=2},
				{x=9, y=11, needArrow=false, arrowDir=0},
				{x=9, y=10, needArrow=false, arrowDir=0},		
				{x=9, y=9, needArrow=false, arrowDir=0},
				{x=10, y=9, needArrow=false, arrowDir=0},
				{x=11, y=9, needArrow=false, arrowDir=0},
				{x=11, y=8, needArrow=false, arrowDir=0},
				{x=11, y=7, needArrow=false, arrowDir=0},
				{x=11, y=6, needArrow=false, arrowDir=0},
				{x=11, y=5, needArrow=true, arrowDir=0},
				{x=11, y=4, needArrow=false, arrowDir=0},
				{x=11, y=3, needArrow=false, arrowDir=0},
				{x=11, y=2, needArrow=false, arrowDir=0},
				{x=10, y=2, needArrow=false, arrowDir=0},
				{x=9,  y=2, needArrow=false, arrowDir=0},
				{x=8, y=2, needArrow=true, arrowDir=6},
				{x=7, y=2, needArrow=false, arrowDir=0},
				{x=6, y=2, needArrow=false, arrowDir=0},
				{x=5, y=2, needArrow=false, arrowDir=0},
				{x=4, y=2, needArrow=false, arrowDir=0},
				{x=4, y=1, needArrow=true, arrowDir=0},
				{x=4, y=0, needArrow=false, arrowDir=0},
				{x=5, y=0, needArrow=false, arrowDir=0},
				{x=6, y=0, needArrow=false, arrowDir=0},
				{x=7, y=0, needArrow=true, arrowDir=2},
				{x=8, y=0, needArrow=false, arrowDir=0},
				{x=9, y=0, needArrow=false, arrowDir=0},
			},
		},

		--第三关
		{
			title = Lang.Activity.cs0003,      --关卡的名称
			eventCount = 5,						--事件的个数
			
			endPointDesc = Lang.Activity.lb0003,                 --终点礼包提示
			nextPointDesc = Lang.Activity.gk0003,                --下一关提示
			
			--显示下一关的情况,第一个是箭头,第二个是问号
			endPoint =
			{
				--{x=11, y=6, needArrow=true, arrowDir=4},
				--{x=11, y=7, needArrow=false, arrowDir=4},
			},

			--可走的点
			points = 
			{
				--x, y就是坐标,从0开始    needArrow 是否需要箭头   arrowDir  箭头的方向 0上 2右 4下 6左
				{x=0, y=5, needArrow=false, arrowDir=0},
				{x=1, y=5, needArrow=true, arrowDir=2},
				{x=2, y=5, needArrow=false, arrowDir=0},
				{x=2, y=6, needArrow=false, arrowDir=0},
				{x=2, y=7, needArrow=false, arrowDir=0},
				{x=2, y=8, needArrow=true, arrowDir=4},
				{x=2, y=9, needArrow=false, arrowDir=0},
				{x=2, y=10, needArrow=false, arrowDir=0},
				{x=2, y=11, needArrow=false, arrowDir=0},
				{x=3, y=11, needArrow=false, arrowDir=0},
				{x=4, y=11, needArrow=false, arrowDir=0},
				{x=5, y=11, needArrow=true, arrowDir=2},
				{x=6, y=11, needArrow=false, arrowDir=0},
				{x=7, y=11, needArrow=false, arrowDir=0},
				{x=8, y=11, needArrow=false, arrowDir=0},
				{x=9, y=11, needArrow=false, arrowDir=0},
				{x=9, y=10, needArrow=false, arrowDir=0},
				--{x=9, y=10, needArrow=false, arrowDir=0},
				{x=9, y=9, needArrow=true, arrowDir=0},
				{x=9, y=8, needArrow=false, arrowDir=0},
				{x=9, y=7, needArrow=false, arrowDir=0},
				{x=9, y=6, needArrow=false, arrowDir=0},
				{x=9, y=5, needArrow=false, arrowDir=0},
				{x=9, y=4, needArrow=true, arrowDir=0},
				{x=9, y=3, needArrow=false, arrowDir=0},
				{x=9, y=2, needArrow=false, arrowDir=0},
				{x=8, y=2, needArrow=false, arrowDir=0},
				{x=7, y=2, needArrow=true, arrowDir=6},
				{x=6, y=2, needArrow=false, arrowDir=0},
				{x=5, y=2, needArrow=false, arrowDir=0},
				{x=4, y=2, needArrow=false, arrowDir=0},
				{x=3, y=2, needArrow=false, arrowDir=0},
				{x=3, y=1, needArrow=true, arrowDir=0},
				{x=3, y=0, needArrow=false, arrowDir=0},
				{x=4, y=0, needArrow=false, arrowDir=0},
				{x=5, y=0, needArrow=false, arrowDir=0},
				{x=6, y=0, needArrow=true, arrowDir=2},
				{x=7, y=0, needArrow=false, arrowDir=0},
				{x=8, y=0, needArrow=false, arrowDir=0},
				{x=9, y=0, needArrow=false, arrowDir=0},
				{x=10, y=0, needArrow=true, arrowDir=2},
				{x=11, y=0, needArrow=false, arrowDir=0},
				{x=11, y=1, needArrow=false, arrowDir=0},
				{x=11, y=2, needArrow=true, arrowDir=4},
				{x=11, y=3, needArrow=false, arrowDir=0},
				{x=11, y=4, needArrow=false, arrowDir=0},
				{x=11, y=5, needArrow=false, arrowDir=0},
				
				
			},
		},
	},
	
	--所有事件配置
	allEvent = 
	{
--#include "GodWealthEvent.lua"
	},
}