--似水柔情77（完成任务去交任务）
{
  maxLevel = 80,
  triggerList =
  {
    { type = 1, valueList = {77,}},      --这个任务在做
  },


  --引导的步骤
  steps =
  {

    --第2步 指任务连接（NPC，交任务）
    {
      condList =
      {
        { type = 1,  helpId = 50, dataList = {0,} },    --任务追踪面板可见
        { type = 2,  helpId = 40, dataList = {0,} },    --npc对话框不可见
        { type = 5,  helpId = 50, dataList = {77,} },      --存在任务
        { type = 8,  helpId = 50, dataList = {77,} },    --任务完成
      },

      --指向任务寻路连接
      action = { type = 5, helpId = 77, data = Lang.GuideLang.name79, desc = Lang.GuideLang.desc2 },
    },

    --第3步 指向npc对话框 完成任务按钮
    {
      condList =
      {
        { type = 1,  helpId = 40, dataList = {0,} },    --npc对话框可见
        { type = 5,  helpId = 41, dataList = {77,} },      --存在任务
        { type = 19, helpId = 40, dataList = {Lang.GuideLang.name79,} },     --指定NPC
        { type = 8,  helpId = 41, dataList = {77,} },      --任务完成
      },

      --指向NPC对话框的完成按钮
      action = { type = 1, helpId = 41, data = 0, desc = Lang.GuideLang.desc3 },
    },

    --第5步 结束指引
    {
      condList =
      {
        { type = 2,  helpId = 40, dataList = {0,} },    --npc对话框不可见
        { type = 6,  helpId = 41, dataList = {77,} },      --不存在任务
      },

      --无内容
      action = { type = 0, helpId = 41, data = 0, desc = Lang.GuideLang.desc5 },
    },
  },
},