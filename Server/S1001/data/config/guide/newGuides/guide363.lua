--学习降妖除魔（接任务）
{
  maxLevel = 80,
  triggerList =
  {
    { type = 3, valueList = {127,}},      --这个任务在做
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
        { type = 11,  helpId = 50, dataList = {127} },      --存在可接任务
      },

      --指向任务寻路连接
      action = { type = 5, helpId = 127, data = Lang.GuideLang.desc5, desc = Lang.GuideLang.desc2 },
    },

    --第3步 指向npc对话框 接受任务按钮
    {
      condList =
      {
        { type = 1,  helpId = 40, dataList = {0,} },    --npc对话框可见
        { type = 11,  helpId = 41, dataList = {127,} },      --存在可接任务
        { type = 19, helpId = 40, dataList = {Lang.GuideLang.name227,} },     --指定NPC
      },

      --指向NPC对话框的接受任务
      action = { type = 1, helpId = 41, data = 0, desc = Lang.GuideLang.desc5 },

    },

    --第5步 结束指引
    {
      condList =
      {
        { type = 2,  helpId = 40, dataList = {0,} },    --npc对话框不可见
        { type = 12,  helpId = 0, dataList = {127,} },   --不存在可接任务
      },



      --无内容
      action = { type = 0, helpId = 41, data = 0, desc = Lang.GuideLang.desc5 },
    },
  },
},