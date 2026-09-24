--#include "data\config\activity\activity\FuBenShuaGuai.lua" once
--材料副本
function ShuaGuai(sysarg,FubenIndex,index)
	SpecialQuest_UpdatePic(sysarg,FubenMonsterData[FubenIndex].cgf[index].picId)
	local nHandle = Actor.getSceneHandle(sysarg)
	Fuben.createMonsters(nHandle, FubenMonsterData[FubenIndex].cgf[index].monsterId, FubenMonsterData[FubenIndex].cgf[index].x1, FubenMonsterData[FubenIndex].cgf[index].x2, FubenMonsterData[FubenIndex].cgf[index].y1, FubenMonsterData[FubenIndex].cgf[index].monsterCount,5000)--重新刷boss
end

function OnKillFubenMonster(sysarg)

	local dVar = Actor.getDyanmicVar(sysarg)
	local nowSceneId = Actor.getSceneId(sysarg)
	local FubenIndex=nowSceneId-90
	
	if nowSceneId==427 then	
		FubenIndex = 8 
	end
	
	if nowSceneId==643 then	
		FubenIndex = 9 
	end
	
	if nowSceneId==649 then	
		FubenIndex = 10 
	end
	
	if nowSceneId==665 then	
		FubenIndex = 11 
	end
	
	if nowSceneId==696 then	
		FubenIndex = 12
	end
	
	local MaxBoshu = 0
	MaxBoshu = #FubenMonsterData[FubenIndex].cgf
	local rem_mon = Actor.getLiveMonsterCount(sysarg,0)
	if rem_mon == 0 then 
		if dVar.FubenBoshu >= MaxBoshu then --完成
			OnFinish(sysarg)
		else
			dVar.FubenBoshu=dVar.FubenBoshu+1
			ShuaGuai(sysarg,FubenIndex,dVar.FubenBoshu)
			 --Actor.openguajiGuide(sysarg,1)
			--Actor.autoFindPathToKillMonster(sysarg, nowSceneId , FubenMonsterData[FubenIndex].cgf[dVar.FubenBoshu].x1 ,FubenMonsterData[FubenIndex].cgf[dVar.FubenBoshu].y1 , FubenMonsterData[FubenIndex].cgf[dVar.FubenBoshu].monsterId)
		end
	end
	SentKillTheMonsterOnFuBen(sysarg)
	--else 
	--	--如果boss死就为0
	--	local rem_mon = Actor.getLiveMonsterCount(sysarg,0)
	--	if rem_mon == 0 then 
	--		print("完成")
	--	else 
	--		local leftMonsterNumber = 0
	--		for i=dVar.FubenBoshu+1,#FubenMonsterData[FubenIndex]do 
	--			leftMonsterNumber=leftMonsterNumber+FubenMonsterData[FubenIndex][i].monsterCount
	--		end
	--		if rem_mon <= leftMonsterNumber then--杀完了这一波的怪物
	--			dVar.FubenBoshu=dVar.FubenBoshu+1
	--			Actor.autoFindPathToKillMonster(sysarg, nowSceneId , FubenMonsterData[FubenIndex][dVar.FubenBoshu].x1 ,FubenMonsterData[FubenIndex][dVar.FubenBoshu].y1 , FubenMonsterData[FubenIndex][dVar.FubenBoshu].monsterId)
	--			SpecialQuest_UpdatePic(sysarg,FubenMonsterData[FubenIndex][dVar.FubenBoshu].picId)
	--		end
	--	end	
	--end
	
	
end

function OnEnterFuben(sysarg,fubenIndex,leftSecond)
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sUpdateFubenData)
	DataPack.writeByte(netPack, 1) -- 进入副本
	DataPack.writeByte(netPack, fubenIndex)
	DataPack.writeUInt(netPack, leftSecond)
	DataPack.flush(netPack)
end

function SentKillTheMonsterOnFuBen(sysarg)
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sUpdateFubenData)
	DataPack.writeByte(netPack, 3) -- 杀怪
	DataPack.flush(netPack)
end

function OnFinish(sysarg)
	local var = Actor.getDyanmicVar(sysarg) 
	var.onFcailiaoFB=1--标记材料副本完成了
	
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sUpdateFubenData)
	DataPack.writeByte(netPack, 2) -- 完成副本
	DataPack.flush(netPack)
end

function OnSendTheResultOfAwards(sysarg,n)
	local n = tonumber(n)
	local netPack = DataPack.allocPacket(sysarg, 139, LogicCmd.miscSys.sub.sUpdateFubenData)
	DataPack.writeByte(netPack, 4) -- 发送奖励结果
	DataPack.writeByte(netPack, n) --0不成功，1成功
	DataPack.flush(netPack)
end

