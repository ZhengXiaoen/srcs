{ --恶魔岭(双线)
	--副本id
	fbid = 66,
	--是否手动开始副本(默认false)
	isAutoActive = true,
	--副本的适合等级(推荐等级)，
	recommandLevel = 65,
	--destoryTime = 1800,	--副本当没人的时候的销毁时间，如果副本没配置，则默认为全局的，单位秒
	--这个副本需要用到的场景列表
	scenes =
	{
--#include "scene176.lua"
	},

	fbProgressTitles=
	{
		Lang.FBTalk.t00004,
		Lang.FBTalk.t00005,
	},

	fbProgressTips = Lang.FBTalk.ts0013,


},