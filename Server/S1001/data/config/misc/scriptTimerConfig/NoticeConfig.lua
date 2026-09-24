--[[
	//系统提示的类型
	enum tagTipmsgType
	{
		ttInvalidTmType = -1, // 无效的Tipmsg类型
		ttTipmsgWindow =1, //只在右侧提示栏显示
		ttScreenCenter=2, //屏幕中央，用于xxx把xxx强化到6级之类的全服公告
		ttDialog =4,      //弹出框
		ttBroadcast =8,  //公告栏，用于GM发通知
		ttMessage = 16,	//短消息，在屏幕中央悬挂，点击后查看内容，
		ttWarmTip  =32,   //温馨提示
		ttGmTip = 64,	// Gm提示信息
		ttChatWindow =128, //左侧聊天栏里，用于一些系统公告在聊天栏显示
		//ttMaxTmType,		// 最大Tipmsg类型
	};
--]]
--公告表 
--用于自动执行所需的公告
--注意：项只能向后添加，就算以后没用到的项都要保留不能删除或用{}占位，防止index错乱
NoticeMsg = 
{
	--世界BOSS公告
	[1] = {"魔幻星宫活动将在5分钟之后开启，请各位玩家做好准备！"},
}
