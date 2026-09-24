--红名玩家复活处理

--lua script
--#include "data\language\LangCode.txt" once --语言包 
--#include "data\config\pk\PkConfig.lua" once
--#include "data\functions\FuBenNpcFunc\FubenCommonFunc.lua" once


--红名传送到红名村
function TranRedActorToRedSceen(sysarg,bFlag)
	
	--if GlobalConfig.nEnterJailPkValue < 0 then return false end
		
	local pkValue = Actor.getIntProperty(sysarg,PROP_ACTOR_PK_VALUE)

	if pkValue >= GlobalConfig.nEnterJailPkValue then	--红名
		local nHandle = Actor.getFubenHandle(sysarg)
		local nSceneId = Actor.getSceneId(sysarg)

		local hScene = Fuben.getSceneHandleById(nSceneId, nHandle)
		onExitFubenFunc(sysarg)
		Actor.enterFuBen(sysarg,hScene,GlobalConfig.nJailSceneId,PkConfig.nEnterRange[1],PkConfig.nEnterRange[2])
		if bFlag == true then
			Actor.sendTipmsg(sysarg,Lang.Activity.t00038,2+128)
		end
		return true
	end

	return false
end
