--使用道具刷怪
UseItemCreateMonster =
{
-----------------------------------------------
  --------五灵玄天阵 
  --五灵珠之水灵珠 
	{
	  item_id = 1881,  --使用物品ID 
	  delayTime = 3000, --延迟时间（秒） 
	  delayTips = Lang.FBTalk.f00025,  --延迟界面显示 
	  needDelete = true,   --是否删除使用物品 
	  useArea = {sid = 144, x1 = 63, x2 = 65, y1 = 25, y2 = 25,},  --使用区域 {sid场景ID, x1 x左坐标, x2 x右坐标, y1 y上坐标, y2 y下坐标} 
	  wrongUseAreaTips = Lang.FBTalk.f00026, --错误使用位置 提示 
	  createMon = {mid = 386, sid = 144, x1 = 64, x2 = 64, y = 25, num = 1, live = 3600,}, --创建怪物 {mid怪物ID, sid怪物出现场景ID,x1 x左坐标, x2 x右坐标, y y坐标, num数量, live生存期  } 
	  sucessTips = Lang.FBTalk.f00027,  --成功使用 提示 
	  tipsType = 1,  --公告类型 1副本公告 2场景公告 3世界公告 4个人公告
    callBackFunc = function(sysarg,ItemTable) --使用成功后调用的附加回调 
									   checkWuLingZhu(sysarg,ItemTable)		
                   end,   
  },
  --五灵珠之火灵珠
  {
	  item_id = 1882,
	  delayTime = 3000,
	  delayTips = Lang.FBTalk.f00028,
	  needDelete = true,
	  useArea = {sid = 144, x1 = 61, x2 = 63, y1 = 29, y2 = 29,},
	  wrongUseAreaTips = Lang.FBTalk.f00029,
	  createMon = {mid = 387, sid = 144, x1 = 62, x2 = 62, y = 29, num = 1, live = 3600,},
	  sucessTips = Lang.FBTalk.f00030,
	  tipsType = 1,  --公告类型 1副本公告 2场景公告 3世界公告 4个人公告
	  callBackFunc = function(sysarg,ItemTable) --使用成功后调用的附加回调
									   checkWuLingZhu(sysarg,ItemTable)
                   end,
  },
  --五灵珠之土灵珠
  {
	  item_id = 1883,
	  delayTime = 3000,
	  delayTips = Lang.FBTalk.f00031,
	  needDelete = true,
	  useArea = {sid = 144, x1 = 55, x2 = 57, y1 = 29, y2 = 29,},
	  wrongUseAreaTips = Lang.FBTalk.f00032,
	  createMon = {mid = 418, sid = 144, x1 = 56, x2 = 56, y = 29, num = 1, live = 3600,},
	  sucessTips = Lang.FBTalk.f00033,
	  tipsType = 1,  --公告类型 1副本公告 2场景公告 3世界公告 4个人公告
	  callBackFunc = function(sysarg,ItemTable) --使用成功后调用的附加回调
									   checkWuLingZhu(sysarg,ItemTable)
                   end,
  },
  --五灵珠之风灵珠
  {
	  item_id = 1884,
	  delayTime = 3000,
	  delayTips = Lang.FBTalk.f00034,
	  needDelete = true,
	  useArea = {sid = 144, x1 = 58, x2 = 60, y1 = 22, y2 = 22,},
	  wrongUseAreaTips = Lang.FBTalk.f00035,
	  createMon = {mid = 419, sid = 144, x1 = 59, x2 = 59, y = 22, num = 1, live = 3600,},
	  sucessTips = Lang.FBTalk.f00036,
	  tipsType = 1,  --公告类型 1副本公告 2场景公告 3世界公告 4个人公告
	  callBackFunc = function(sysarg,ItemTable) --使用成功后调用的附加回调
									   checkWuLingZhu(sysarg,ItemTable)
                   end,
  },
  -- 五灵珠之雷灵珠
  {
	  item_id = 1885,
	  delayTime = 3000,
	  delayTips = Lang.FBTalk.f00037,
	  needDelete = true,
	  useArea = {sid = 144, x1 = 53, x2 = 55, y1 = 25, y2 = 25,},
	  wrongUseAreaTips = Lang.FBTalk.f00038,
	  createMon = {mid = 420, sid = 144, x1 = 54, x2 = 54, y = 25, num = 1, live = 3600,},
	  sucessTips = Lang.FBTalk.f00039,
	  tipsType = 1,  --公告类型 1副本公告 2场景公告 3世界公告 4个人公告
	  callBackFunc = function(sysarg,ItemTable) --使用成功后调用的附加回调
									   checkWuLingZhu(sysarg,ItemTable)
                   end,
  },
    -- 五灵珠之雷灵珠
  {
	  item_id = 1885,
	  delayTime = 3000,
	  delayTips = Lang.FBTalk.f00037,
	  needDelete = true,
	 -- useArea = {sid = -1, x1 = -1, x2 = -1, y1 = -1, y2 = -1,},
	  wrongUseAreaTips = Lang.FBTalk.f00038,
	  createMon = {mid = 70, sid = -1, x1 = -1, x2 = -1, y = -1, num = 1, live = 3600,},
	  sucessTips = Lang.FBTalk.f00039,
	  tipsType = 3,  --公告类型 1副本公告 2场景公告 3世界公告 4个人公告
	  callBackFunc = function(sysarg,ItemTable) --使用成功后调用的附加回调
									   
                   end,
  },
  ----------------------------------------------------------- 
}


--[[
    函数名称：checkWuLingZhu
    函数描述：检测五灵珠是否放置齐 
    参数 sysarg 的描述：
]]
function checkWuLingZhu(sysarg,ItemTable)
  local hFuben = Actor.getFubenHandle(sysarg)
  local sid = Actor.getSceneId(sysarg)
	local hScene = Fuben.getSceneHandleById(sid, hFuben)
	if  Fuben.getLiveMonsterCount(hScene, 386) > 0
	and Fuben.getLiveMonsterCount(hScene, 387) > 0
	and Fuben.getLiveMonsterCount(hScene, 418) > 0
	and Fuben.getLiveMonsterCount(hScene, 419) > 0
	and Fuben.getLiveMonsterCount(hScene, 420) > 0 then
	  Fuben.createMonsters(hScene,385,69,69,33,1,3600)
	  Fuben.sendMsgToFb(hFuben, Lang.FBTalk.f00040, ttScreenCenter)
	end  
end