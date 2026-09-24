--Õð¾ª£¨ÈÎÎñÈ¥½»ÈÎÎñ£©
{
  maxLevel = 60,
  triggerList =
  {
    { type = 1, valueList = {97,}},      --Õâ¸öÈÎÎñÔÚ×ö
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
        { type = 5,  helpId = 50, dataList = {97,} },      --´æÔÚÈÎÎñ
        { type = 8,  helpId = 50, dataList = {97,} },    --ÈÎÎñÍê³É
      },

      --Ö¸ÏòÈÎÎñÑ°Â·Á¬½Ó
      action = { type = 5, helpId = 97, data = Lang.GuideLang.name251, desc = Lang.GuideLang.desc2 },
    },

    --µÚ3²½ Ö¸Ïònpc¶Ô»°¿ò Íê³ÉÈÎÎñ°´Å¥
    {
      condList =
      {
        { type = 1,  helpId = 40, dataList = {0,} },    --npc¶Ô»°¿ò¿É¼û
        { type = 5,  helpId = 41, dataList = {97,} },      --´æÔÚÈÎÎñ
        { type = 19, helpId = 40, dataList = {Lang.GuideLang.name251,} },     --Ö¸¶¨NPC
        { type = 8,  helpId = 41, dataList = {97,} },      --ÈÎÎñÍê³É
      },

      --Ö¸ÏòNPC¶Ô»°¿òµÄÍê³É°´Å¥
      action = { type = 1, helpId = 41, data = 0, desc = Lang.GuideLang.desc3 },
    },

    --µÚ5²½ ½áÊøÖ¸Òý
    {
      condList =
      {
        { type = 2,  helpId = 40, dataList = {0,} },    --npc¶Ô»°¿ò²»¿É¼û
        { type = 6,  helpId = 41, dataList = {97,} },      --²»´æÔÚÈÎÎñ
      },

      --ÎÞÄÚÈÝ
      action = { type = 0, helpId = 41, data = 0, desc = Lang.GuideLang.desc5 },
    },
  },
},