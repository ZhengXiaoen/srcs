--存在可接任务
{
  maxLevel = 40,
  triggerList =
	{
		{ type = 3, valueList = {497,}},      --这个任务在做
	},


  --引导的步骤
  steps =
	{
    --第1步 指向导航标签
    {
      condList =
      {
				{ type = 1,  helpId = 50, dataList = {0,} },		--任务追踪面板可见
				{ type = 1,  helpId = 50, dataList = {0,} },			--存在任务
				{ type = 11, helpId = 0, dataList = {1,}},
      },

      action = { type = 2, helpId = 50, data = 1, desc = Lang.GuideLang.desc1 },  --指向任务追踪面板第一项
    },

    --第2步 指可接任务连接
    {
      condList =
      {
	 { type = 1,  helpId = 50, dataList = {0,} },     --任务追踪面板可见
	 { type = 1,  helpId = 50, dataList = {0,} },     --任务追踪面板选中第2项
	 { type = 2,  helpId = 40, dataList = {0,} },	  --npc对话框不可见
	 { type = 11,  helpId = 0, dataList = {1,} },	--存在可接任务
      },

      --指向任务寻路连接
      action = { type = 5, helpId = 50, data = Lang.GuideLang.name2, desc = Lang.GuideLang.desc6 },
    },

    --第3步 指任务连接（NPC，交任务）
    {
      condList = 
      {
	 { type = 1,  helpId = 40, dataList = {0,} },	  --npc对话框可见
	 { type = 11,  helpId = 0, dataList = {1,} },	--存在可接任务
      },

      --指向任务寻路连接
      action = { type = 1, helpId = 41, data = 0, desc = Lang.GuideLang.desc6 },
    },



    --第4步 结束指引
    {
      condList = 
      {
	 { type = 6,  helpId = 0, dataList = {1,} }, --不存在任务
      },

      --无内容
      action = { type = 0, helpId = 20, data = 0, desc = Lang.GuideLang.desc5 },
    },
	},
},