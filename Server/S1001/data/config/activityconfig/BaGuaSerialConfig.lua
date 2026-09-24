--八卦连环阵配置
BaGuaSerialConfig = {
	SceneId = 91,		--首次进入的场景ID
	SceneName = Lang.SceneName.s00091,		--所在场景名称
	nInterval = 9100,		--怪物存活时间
	returnArea = {sid = 5, x = 152, y = 182},	--返回区域

	pointsCenter = {
		{156,87},
	},
	MinLevel = 70,		--提示该等级以上的

	BaGuaScenes = {
		[1] = {sceneId = 91,mosters = {
										{244,1},
									},rand = {x = 28,y = 23,Range = 10},
				},
		[2] = {sceneId = 92,mosters = {
										{244,1},
									},rand = {x = 28,y = 23,Range = 10},
				},
		[3] = {sceneId = 93,mosters = {
										{244,1},
									},rand = {x = 28,y = 23,Range = 10},
				},
		[4] = {sceneId = 94,mosters = {
										{244,1},
									},rand = {x = 28,y = 23,Range = 10},
				},
		[5] = {sceneId = 95,mosters = {
										{244,1},
									},rand = {x = 28,y = 23,Range = 10},
				},
		[6] = {sceneId = 96,mosters = {
										{244,1},
									},rand = {x = 28,y = 23,Range = 10},
				},
		[7] = {sceneId = 97,mosters = {
										{244,1},
									},rand = {x = 28,y = 23,Range = 10},
				},
		[8] = {sceneId = 98,mosters = {
										{244,1},
									},rand = {x = 28,y = 23,Range = 15},
				},
		[9] = {sceneId = 99,mosters = {
										{244,1},
									},rand = {x = 28,y = 23,Range = 10},
				},
		[10] = {sceneId = 100,mosters = {
										{244,1},
									},rand = {x = 28,y = 23,Range = 10},
				},
		[11] = {sceneId = 101,mosters = {
										{244,1},
									},rand = {x = 28,y = 23,Range = 10},
				},
		[12] = {sceneId = 102,mosters = {
										{244,1},
									},rand = {x = 28,y = 23,Range = 10},
				},
		[13] = {sceneId = 103,mosters = {
										{244,1},
									},rand = {x = 28,y = 23,Range = 10},
				},
		[14] = {sceneId = 104,mosters = {
										{244,1},
									},rand = {x = 28,y = 23,Range = 10},
				},
		[15] = {sceneId = 105,mosters = {
										{244,1},
									},rand = {x = 28,y = 23,Range = 10},
				},
	},
	BaGuaTeleport = {
		[92]={ posx =  39, posy = 36},  --1层
		[93]={ posx =  39, posy = 36},  --2层
		[94]={ posx =  39, posy = 36},  --3层
		[95]={ posx =  39, posy = 36},  --4层
		[96]={ posx =  39, posy = 36},  --5层
		[97]={ posx =  39, posy = 36},  --6层
		[98]={ posx =  39, posy = 36},  --7层
		[99]={ posx =  39, posy = 36},  --8层
		[100]={ posx =  39, posy = 36},  --9层
		[101]={ posx =  39, posy = 36},  --10层
		[102]={ posx =  39, posy = 36},  --11层
		[103]={ posx =  39, posy = 36},  --12层
		[104]={ posx =  39, posy = 36},  --13层
		[105]={ posx =  39, posy = 36},  --14层
	}
}