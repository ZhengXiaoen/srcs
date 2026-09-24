--开服后公告配置信息   w   w w .  c   n 1 2 1      . c o m
--2017.2.20
--系统提示的类型
--enum tagTipmsgType
--{
--	ttInvalidTmType = -1, // 无效的Tipmsg类型
--	ttTipmsgWindow =1, //只在右侧提示栏显示
--	ttScreenCenter=2, //屏幕中央，用于xxx把xxx强化到6级之类的全服公告
--	ttDialog =4,      //弹出框
--	ttBroadcast =8,  //公告栏，用于GM发通知
--	ttMessage = 16,	//短消息，在屏幕中央悬挂，点击后查看内容，
--	ttWarmTip  =32,   //温馨提示
--	ttGmTip = 64,	// Gm提示信息
--	ttChatWindow =128, //左侧聊天栏里，用于一些系统公告在聊天栏显示
--	ttFlyTip	= 256,	//人物飘出
--	ttPropertyTip = 512,	//属性tip
--	ttScreenCenterBigNotice = 2048,	//屏幕上方大文字公告		
--	//ttMaxTmType,		// 最大Tipmsg类型
--};
NoticeTipsCfg =
{
    {
        IntervalTick = 10,    --秒
        Text = "这一天简直就像一个星期那样漫长。",
        ShowType = 128,    --提示类型，可叠加 参考：tagTipmsgType
    },
    {
        IntervalTick = 10,    --秒
        Text = "两肋插刀，还是两面三刀？我们的人生由选择定义。",
        ShowType = 128,    --提示类型，可叠加 参考：tagTipmsgType
    },
}
function InitNoticeTips()
    
    --System.addTimer("RunNoiceTips",1000,-1)
end

function RunNoiceTips(leftTimes)
    local sVar = System.getStaticVar()
   if sVar.noticecount == nil then
        sVar.noticecount = 1
        sVar.noticetick = System.getTick() + NoticeTipsCfg[sVar.noticecount].IntervalTick * 1000
    end
 
    if sVar.noticetick ~= nil and System.getTick() > sVar.noticetick then
        System.broadcastTipmsg(NoticeTipsCfg[sVar.noticecount].Text,NoticeTipsCfg[sVar.noticecount].ShowType)
        sVar.noticecount = sVar.noticecount + 1
        if sVar.noticecount > table.getn(NoticeTipsCfg) then
            --System.deleteTimer("RunNoiceTips")
            --sVar.noticetick = nil
            --return
            --循环发送公告
            sVar.noticecount = 1
         end
        
        sVar.noticetick = System.getTick() + NoticeTipsCfg[sVar.noticecount].IntervalTick * 1000

    end

end