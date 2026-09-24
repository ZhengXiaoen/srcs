--挑战虹膜（指引玩家去接任务）
{
  maxLevel = 80,
  triggerList =
  {
		{ type = 3, valueList = {122,}},      --有这个可接任务
  },


  --引导的步骤
  steps =
  {


    --第2步 指可接任务连接
    {
      condList =
      {
				{ type = 1,  helpId = 50, dataList = {0,} },		--任务追踪面板可见
				{ type = 3,  helpId = 51, dataList = {2,} },		--任务追踪面板选中第2项
				{ type = 2,  helpId = 40, dataList = {0,} },		--npc对话框不可见
				{ type = 11,  helpId = 0, dataList = {122,} },		--存在可接任务
      },

      --指向可接任务寻路连接
      action = { type = 9, helpId = 122, data = Lang.GuideLang.name227, desc = Lang.GuideLang.desc2 },
    },

     --第3步 指向npc对话框 接受任务按钮
    {
      condList =
      {
				{ type = 1,  helpId = 40, dataList = {0,} },	  --npc对话框可见
				{ type = 11,  helpId = 0, dataList = {122,} },		--存在可接任务
				{ type = 19, helpId = 40, dataList = {Lang.GuideLang.name227,} },     --指定NPC
      },

      --指向对话框的接受按钮
      action = { type = 1, helpId = 41, data = 0, desc = Lang.GuideLang.desc5 },
    },

    --第4步 结束指引
    {
      condList =
      {
				{ type = 2,  helpId = 40, dataList = {0,} },	  --npc对话框不可见
				{ type = 12,  helpId = 0, dataList = {122,} },		--不存在可接任务
      },

      --无内容
      action = { type = 0, helpId = 122, data = 0, desc = Lang.GuideLang.desc5 },
    },
	},
},