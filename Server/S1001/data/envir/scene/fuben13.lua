{ --1转BOSS挑战
	--副本id
	fbid = 13,
	--副本的适合等级(推荐等级)，
	recommandLevel = 30,
	destoryTime = 1,	--副本当没人的时候的销毁时间，如果副本没配置，则默认为全局的，单位秒
	--这个副本需要用到的场景列表
	scenes ={
--#include "scene209.lua"
	},
fbProgressTitles=
	{
		Lang.FBTalk.t00013,
	},

	fbProgressTips = Lang.FBTalk.ts00013,

},