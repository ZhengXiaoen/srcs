{ --材料副本--宝石副本
	--副本id
	fbid = 21,
	--副本的适合等级(推荐等级)，
	recommandLevel = 60,
	destoryTime = 1,	--副本当没人的时候的销毁时间，如果副本没配置，则默认为全局的，单位秒
	--这个副本需要用到的场景列表
	scenes ={
--#include "scene93.lua"
	},
fbProgressTitles=
	{
		Lang.FBTalk.t00021,
	},

	fbProgressTips = Lang.FBTalk.ts00021,

},