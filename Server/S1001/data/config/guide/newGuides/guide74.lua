--杀母之仇（完成任务去交任务）
{
  maxLevel = 40,
  triggerList =
	{
		{ type = 1, valueList = {27,}},      --这个任务在做
	},


  --引导的步骤
  steps =
	{
    --第1步 指向导航标签
    {
      condList =
      {
				{ type = 1,  helpId = 50, dataList = {0,} },		--任务追踪面板可见
				{ type = 4,  helpId = 51, dataList = {1,} },		--任务追踪面板没有选中第一项
				{ type = 5,  helpId = 0, dataList = {27,} },			--存在任务
      },

      action = { type = 2, helpId = 51, data = 1, desc = Lang.GuideLang.desc1 },  --指向任务追踪面板第一项
    },

    --第2步 指任务连接（杀怪）
     {
      condList =
      {
				{ type = 1,  helpId = 50, dataList = {0,} },		--任务追踪面板可见
				{ type = 2,  helpId = 40, dataList = {0,} },	  --npc对话框不可见
				{ type = 5,  helpId = 0, dataList = {27,} },			--存在任务
      },

      --指向任务寻路连接
      action = { type = 5, helpId = 27, data = Lang.GuideLang.name13, desc = Lang.GuideLang.desc2 },
    },

    
    --第3步 指任务连接（NPC，交任务）
    {
      condList =
      {
				{ type = 1,  helpId = 40, dataList = {0,} },	  --npc对话框可见
				{ type = 5,  helpId = 0, dataList = {27,} },			--存在任务
				{ type = 19, helpId = 40, dataList = {Lang.GuideLang.name13,} },     --指定NPC
				{ type = 8,  helpId = 0, dataList = {27,} },			--任务完成
      },

      --指向NPC对话框的完成按钮
      action = { type = 1, helpId = 41, data = 0, desc = Lang.GuideLang.desc3 },
    },


    --第4步 指向npc对话框 完成任务按钮
    	{
      condList =
      {
				{ type = 2,  helpId = 40, dataList = {0,} },	  --npc对话框不可见
				{ type = 6,  helpId = 0, dataList = {27,} },			--不存在任务
      },

      --无内容
      action = { type = 0, helpId = 20, data = 0, desc = Lang.GuideLang.desc5 },
		},
	},
},