--¸变异怪物 接任务
{
  maxLevel = 60,
  triggerList =
  {
    { type = 3, valueList = {28,}},      --Õâ¸öÈÎÎñÔÚ×ö
  },


  --Òýµ¼µÄ²½Öè
  steps =
  {

    --µÚ2²½ Ö¸ÈÎÎñÁ¬½Ó£¨NPC£¬½»ÈÎÎñ£©
    {
      condList =
      {
        { type = 1,  helpId = 50, dataList = {0,} },    --ÈÎÎñ×·×ÙÃæ°å¿É¼û
        { type = 2,  helpId = 40, dataList = {0,} },    --npc¶Ô»°¿ò²»¿É¼û
        { type = 11,  helpId = 50, dataList = {28} },      --´æÔÚ¿É½ÓÈÎÎñ
      },

      --Ö¸ÏòÈÎÎñÑ°Â·Á¬½Ó
      action = { type = 5, helpId = 28, data = Lang.GuideLang.desc5, desc = Lang.GuideLang.desc2 },
    },

    --µÚ3²½ Ö¸Ïònpc¶Ô»°¿ò ½ÓÊÜÈÎÎñ°´Å¥
    {
      condList =
      {
        { type = 1,  helpId = 40, dataList = {0,} },    --npc¶Ô»°¿ò¿É¼û
        { type = 11,  helpId = 41, dataList = {28,} },      --´æÔÚ¿É½ÓÈÎÎñ
        { type = 19, helpId = 40, dataList = {Lang.GuideLang.name37,} },     --Ö¸¶¨NPC
      },

      --Ö¸ÏòNPC¶Ô»°¿òµÄ½ÓÊÜÈÎÎñ
      action = { type = 1, helpId = 41, data = 0, desc = Lang.GuideLang.desc5 },

    },

    --µÚ5²½ ½áÊøÖ¸Òý
    {
      condList =
      {
        { type = 2,  helpId = 40, dataList = {0,} },    --npc¶Ô»°¿ò²»¿É¼û
        { type = 12,  helpId = 0, dataList = {28,} },   --²»´æÔÚ¿É½ÓÈÎÎñ
      },



      --ÎÞÄÚÈÝ
      action = { type = 0, helpId = 41, data = 0, desc = Lang.GuideLang.desc5 },
    },
  },
},