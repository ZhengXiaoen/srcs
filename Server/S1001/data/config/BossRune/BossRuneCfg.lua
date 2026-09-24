--boss符文配置
BossRuneCfg =
    {
        semenitemid = 3623, --符文精华道具id
        semenexchange = 1, --每个符文精华增加多少符文盘经验
        
        attr =
        {
            --1级符文盘
            {
                --需要转生等级
                needCircle = 1,
                --符文盘槽位对应道具id
                slot =
                {
                    --天、地、水、火、雷、山、风、泽
                    3551, 3552, 3553, 3554, 3555, 3556, 3557, 3558,
                },
                --符文盘套装属性
                suit =
                {
                    {{type = 144, value = 1000}, }, --1级套装
                    {{type = 144, value = 2000}, }, --2级套装
                    {{type = 144, value = 3000}, }, --3级套装
                    {{type = 144, value = 4000}, }, --4级套装
                    {{type = 144, value = 5000}, }, --5级套装
                    {{type = 144, value = 6000}, }, --6级套装
                    {{type = 144, value = 7000}, }, --7级套装
                    {{type = 144, value = 8000}, }, --8级套装
                    {{type = 144, value = 9000}, }, --9级套装
                    {{type = 144, value = 10000}, }, --10级套装

                    {{type = 144, value = 11000}, }, --11级套装
                    {{type = 144, value = 12000}, }, --12级套装
                    {{type = 144, value = 13000}, }, --13级套装
                    {{type = 144, value = 14000}, }, --14级套装
                    {{type = 144, value = 15000}, }, --15级套装
                    {{type = 144, value = 16000}, }, --16级套装
                    {{type = 144, value = 17000}, }, --17级套装
                    {{type = 144, value = 18000}, }, --18级套装
                    {{type = 144, value = 19000}, }, --19级套装
                    {{type = 144, value = 20000}, }, --20级套装
                    {{type = 144, value = 21000}, }, --21级套装
                    {{type = 144, value = 22000}, }, --22级套装
                    {{type = 144, value = 23000}, }, --23级套装
                    {{type = 144, value = 24000}, }, --24级套装
                    {{type = 144, value = 25000}, }, --25级套装
                    {{type = 144, value = 26000}, }, --26级套装
                    {{type = 144, value = 27000}, }, --27级套装
                    {{type = 144, value = 28000}, }, --28级套装
                    {{type = 144, value = 29000}, }, --29级套装
                    {{type = 144, value = 30000}, }, --30级套装
                    {{type = 144, value = 31000}, }, --31级套装
                    {{type = 144, value = 32000}, }, --32级套装
                    {{type = 144, value = 33000}, }, --33级套装
                    {{type = 144, value = 34000}, }, --34级套装
                    {{type = 144, value = 35000}, }, --35级套装
                    {{type = 144, value = 36000}, }, --36级套装
                    {{type = 144, value = 37000}, }, --37级套装
                    {{type = 144, value = 38000}, }, --38级套装
                    {{type = 144, value = 39000}, }, --39级套装
                    {{type = 144, value = 40000}, }, --40级套装
                    {{type = 144, value = 41000}, }, --41级套装
                    {{type = 144, value = 42000}, }, --42级套装
                    {{type = 144, value = 43000}, }, --43级套装
                    {{type = 144, value = 44000}, }, --44级套装
                    {{type = 144, value = 45000}, }, --45级套装
                    {{type = 144, value = 46000}, }, --46级套装
                    {{type = 144, value = 47000}, }, --47级套装
                    {{type = 144, value = 48000}, }, --48级套装
                    {{type = 144, value = 49000}, }, --49级套装
                    {{type = 144, value = 50000}, }, --50级套装
                    {{type = 144, value = 51000}, }, --51级套装
                    {{type = 144, value = 52000}, }, --52级套装
                    {{type = 144, value = 53000}, }, --53级套装
                    {{type = 144, value = 54000}, }, --54级套装
                    {{type = 144, value = 55000}, }, --55级套装
                    {{type = 144, value = 56000}, }, --56级套装
                    {{type = 144, value = 57000}, }, --57级套装
                    {{type = 144, value = 58000}, }, --58级套装
                    {{type = 144, value = 59000}, }, --59级套装
                    {{type = 144, value = 60000}, }, --60级套装
                    {{type = 144, value = 61000}, }, --61级套装
                    {{type = 144, value = 62000}, }, --62级套装
                    {{type = 144, value = 63000}, }, --63级套装
                    {{type = 144, value = 64000}, }, --64级套装
                    {{type = 144, value = 65000}, }, --65级套装
                    {{type = 144, value = 66000}, }, --66级套装
                    {{type = 144, value = 67000}, }, --67级套装
                    {{type = 144, value = 68000}, }, --68级套装
                    {{type = 144, value = 69000}, }, --69级套装
                    {{type = 144, value = 70000}, }, --70级套装
                
                },
                --符文盘每级升级经验
               ----type说明:0.道具 1.符文精华  
                uplevexp =
                {
                --1-10
                    {type =1,value = 20},
                    {type =1,value = 30},
                    {type =1,value = 40},
                    {type =1,value = 50},
                    {type =1,value = 60},
                    {type =1,value = 70},
                    {type =1,value = 80},
                    {type =1,value = 90},
                    {type =1,value = 100}, 
                    --10-20
                    -- {type =0,Itemid = (a1),count = (a2),value = (a3)},

{type =0,Itemid = 6703,count = 2,value = 110},
{type =0,Itemid = 6703,count = 2,value = 120},
{type =0,Itemid = 6703,count = 2,value = 130},
{type =0,Itemid = 6703,count = 2,value = 140},
{type =0,Itemid = 6703,count = 2,value = 150},
{type =0,Itemid = 6703,count = 2,value = 160},
{type =0,Itemid = 6703,count = 2,value = 170},
{type =0,Itemid = 6703,count = 2,value = 180},
{type =0,Itemid = 6703,count = 2,value = 190},
{type =0,Itemid = 6703,count = 2,value = 200},
{type =0,Itemid = 6703,count = 2,value = 210},
{type =0,Itemid = 6704,count = 1,value = 211},
{type =0,Itemid = 6704,count = 1,value = 212},
{type =0,Itemid = 6704,count = 1,value = 213},
{type =0,Itemid = 6704,count = 1,value = 214},
{type =0,Itemid = 6704,count = 1,value = 215},
{type =0,Itemid = 6704,count = 1,value = 216},
{type =0,Itemid = 6704,count = 1,value = 217},
{type =0,Itemid = 6704,count = 1,value = 218},
{type =0,Itemid = 6704,count = 1,value = 219},
{type =0,Itemid = 6704,count = 1,value = 220},
{type =0,Itemid = 6705,count = 1,value = 221},
{type =0,Itemid = 6705,count = 1,value = 222},
{type =0,Itemid = 6705,count = 1,value = 223},
{type =0,Itemid = 6705,count = 1,value = 224},
{type =0,Itemid = 6705,count = 1,value = 225},
{type =0,Itemid = 6705,count = 1,value = 226},
{type =0,Itemid = 6705,count = 1,value = 227},
{type =0,Itemid = 6705,count = 1,value = 228},
{type =0,Itemid = 6705,count = 1,value = 229},
{type =0,Itemid = 6705,count = 1,value = 230},
{type =0,Itemid = 6706,count = 1,value = 231},
{type =0,Itemid = 6706,count = 1,value = 232},
{type =0,Itemid = 6706,count = 1,value = 233},
{type =0,Itemid = 6706,count = 1,value = 234},
{type =0,Itemid = 6706,count = 1,value = 235},
{type =0,Itemid = 6706,count = 1,value = 236},
{type =0,Itemid = 6706,count = 1,value = 237},
{type =0,Itemid = 6706,count = 1,value = 238},
{type =0,Itemid = 6706,count = 1,value = 239},
{type =0,Itemid = 6706,count = 1,value = 240},
{type =0,Itemid = 6707,count = 1,value = 241},
{type =0,Itemid = 6707,count = 1,value = 242},
{type =0,Itemid = 6707,count = 1,value = 243},
{type =0,Itemid = 6707,count = 1,value = 244},
{type =0,Itemid = 6707,count = 1,value = 245},
{type =0,Itemid = 6707,count = 1,value = 246},
{type =0,Itemid = 6707,count = 1,value = 247},
{type =0,Itemid = 6707,count = 1,value = 248},
{type =0,Itemid = 6707,count = 1,value = 249},
{type =0,Itemid = 6707,count = 1,value = 250},
{type =0,Itemid = 6708,count = 1,value = 251},
{type =0,Itemid = 6708,count = 1,value = 252},
{type =0,Itemid = 6708,count = 1,value = 253},
{type =0,Itemid = 6708,count = 1,value = 254},
{type =0,Itemid = 6708,count = 1,value = 255},
{type =0,Itemid = 6708,count = 1,value = 256},
{type =0,Itemid = 6708,count = 1,value = 257},
{type =0,Itemid = 6708,count = 1,value = 258},
{type =0,Itemid = 6708,count = 1,value = 259},
{type =0,Itemid = 6708,count = 1,value = 260},



                
                },
            },
            --2级符文盘
            {
                --需要转生等级
                needCircle = 1,
                --符文盘槽位对应道具id
                slot =
                {
                    --天、地、水、火、雷、山、风、泽
                    3559, 3560, 3561, 3562, 3563, 3564, 3565, 3566,
                },
                --符文盘套装属性
                suit =
                {
                    {{type = 144, value = 1200}, }, --1级套装
{{type = 144, value = 2400}, }, --2级套装
{{type = 144, value = 3600}, }, --3级套装
{{type = 144, value = 4800}, }, --4级套装
{{type = 144, value = 6000}, }, --5级套装
{{type = 144, value = 7200}, }, --6级套装
{{type = 144, value = 8400}, }, --7级套装
{{type = 144, value = 9600}, }, --8级套装
{{type = 144, value = 10800}, }, --9级套装
{{type = 144, value = 12000}, }, --10级套装
{{type = 144, value = 13200}, }, --11级套装
{{type = 144, value = 14400}, }, --12级套装
{{type = 144, value = 15600}, }, --13级套装
{{type = 144, value = 16800}, }, --14级套装
{{type = 144, value = 18000}, }, --15级套装
{{type = 144, value = 19200}, }, --16级套装
{{type = 144, value = 20400}, }, --17级套装
{{type = 144, value = 21600}, }, --18级套装
{{type = 144, value = 22800}, }, --19级套装
{{type = 144, value = 24000}, }, --20级套装
{{type = 144, value = 25200}, }, --21级套装
{{type = 144, value = 26400}, }, --22级套装
{{type = 144, value = 27600}, }, --23级套装
{{type = 144, value = 28800}, }, --24级套装
{{type = 144, value = 30000}, }, --25级套装
{{type = 144, value = 31200}, }, --26级套装
{{type = 144, value = 32400}, }, --27级套装
{{type = 144, value = 33600}, }, --28级套装
{{type = 144, value = 34800}, }, --29级套装
{{type = 144, value = 36000}, }, --30级套装
{{type = 144, value = 37200}, }, --31级套装
{{type = 144, value = 38400}, }, --32级套装
{{type = 144, value = 39600}, }, --33级套装
{{type = 144, value = 40800}, }, --34级套装
{{type = 144, value = 42000}, }, --35级套装
{{type = 144, value = 43200}, }, --36级套装
{{type = 144, value = 44400}, }, --37级套装
{{type = 144, value = 45600}, }, --38级套装
{{type = 144, value = 46800}, }, --39级套装
{{type = 144, value = 48000}, }, --40级套装
{{type = 144, value = 49200}, }, --41级套装
{{type = 144, value = 50400}, }, --42级套装
{{type = 144, value = 51600}, }, --43级套装
{{type = 144, value = 52800}, }, --44级套装
{{type = 144, value = 54000}, }, --45级套装
{{type = 144, value = 55200}, }, --46级套装
{{type = 144, value = 56400}, }, --47级套装
{{type = 144, value = 57600}, }, --48级套装
{{type = 144, value = 58800}, }, --49级套装
{{type = 144, value = 60000}, }, --50级套装
{{type = 144, value = 61200}, }, --51级套装
{{type = 144, value = 62400}, }, --52级套装
{{type = 144, value = 63600}, }, --53级套装
{{type = 144, value = 64800}, }, --54级套装
{{type = 144, value = 66000}, }, --55级套装
{{type = 144, value = 67200}, }, --56级套装
{{type = 144, value = 68400}, }, --57级套装
{{type = 144, value = 69600}, }, --58级套装
{{type = 144, value = 70800}, }, --59级套装
{{type = 144, value = 72000}, }, --60级套装
{{type = 144, value = 73200}, }, --61级套装
{{type = 144, value = 74400}, }, --62级套装
{{type = 144, value = 75600}, }, --63级套装
{{type = 144, value = 76800}, }, --64级套装
{{type = 144, value = 78000}, }, --65级套装
{{type = 144, value = 79200}, }, --66级套装
{{type = 144, value = 80400}, }, --67级套装
{{type = 144, value = 81600}, }, --68级套装
{{type = 144, value = 82800}, }, --69级套装
{{type = 144, value = 84000}, }, --70级套装
                
                
                },
                --符文盘每级升级经验
                uplevexp =
                {

                 --1-10
                    {type =1,value = 40},
                    {type =1,value = 60},
                    {type =1,value = 80},
                    {type =1,value = 100},
                    {type =1,value = 120},
                    {type =1,value = 140},
                    {type =1,value = 160},
                    {type =1,value = 180},
                    {type =1,value = 200}, 
                    --10-20
                    {type =0,Itemid = 6703,count = 2,value = 201},
{type =0,Itemid = 6703,count = 2,value = 202},
{type =0,Itemid = 6703,count = 2,value = 203},
{type =0,Itemid = 6703,count = 2,value = 204},
{type =0,Itemid = 6703,count = 2,value = 205},
{type =0,Itemid = 6703,count = 2,value = 206},
{type =0,Itemid = 6703,count = 2,value = 207},
{type =0,Itemid = 6703,count = 2,value = 208},
{type =0,Itemid = 6703,count = 2,value = 209},
{type =0,Itemid = 6703,count = 2,value = 210},
{type =0,Itemid = 6703,count = 2,value = 211},
{type =0,Itemid = 6704,count = 1,value = 212},
{type =0,Itemid = 6704,count = 1,value = 213},
{type =0,Itemid = 6704,count = 1,value = 214},
{type =0,Itemid = 6704,count = 1,value = 215},
{type =0,Itemid = 6704,count = 1,value = 216},
{type =0,Itemid = 6704,count = 1,value = 217},
{type =0,Itemid = 6704,count = 1,value = 218},
{type =0,Itemid = 6704,count = 1,value = 219},
{type =0,Itemid = 6704,count = 1,value = 220},
{type =0,Itemid = 6704,count = 1,value = 221},
{type =0,Itemid = 6705,count = 1,value = 222},
{type =0,Itemid = 6705,count = 1,value = 223},
{type =0,Itemid = 6705,count = 1,value = 224},
{type =0,Itemid = 6705,count = 1,value = 225},
{type =0,Itemid = 6705,count = 1,value = 226},
{type =0,Itemid = 6705,count = 1,value = 227},
{type =0,Itemid = 6705,count = 1,value = 228},
{type =0,Itemid = 6705,count = 1,value = 229},
{type =0,Itemid = 6705,count = 1,value = 230},
{type =0,Itemid = 6705,count = 1,value = 231},
{type =0,Itemid = 6706,count = 1,value = 232},
{type =0,Itemid = 6706,count = 1,value = 233},
{type =0,Itemid = 6706,count = 1,value = 234},
{type =0,Itemid = 6706,count = 1,value = 235},
{type =0,Itemid = 6706,count = 1,value = 236},
{type =0,Itemid = 6706,count = 1,value = 237},
{type =0,Itemid = 6706,count = 1,value = 238},
{type =0,Itemid = 6706,count = 1,value = 239},
{type =0,Itemid = 6706,count = 1,value = 240},
{type =0,Itemid = 6706,count = 1,value = 241},
{type =0,Itemid = 6707,count = 1,value = 242},
{type =0,Itemid = 6707,count = 1,value = 243},
{type =0,Itemid = 6707,count = 1,value = 244},
{type =0,Itemid = 6707,count = 1,value = 245},
{type =0,Itemid = 6707,count = 1,value = 246},
{type =0,Itemid = 6707,count = 1,value = 247},
{type =0,Itemid = 6707,count = 1,value = 248},
{type =0,Itemid = 6707,count = 1,value = 249},
{type =0,Itemid = 6707,count = 1,value = 250},
{type =0,Itemid = 6707,count = 1,value = 251},
{type =0,Itemid = 6708,count = 1,value = 252},
{type =0,Itemid = 6708,count = 1,value = 253},
{type =0,Itemid = 6708,count = 1,value = 254},
{type =0,Itemid = 6708,count = 1,value = 255},
{type =0,Itemid = 6708,count = 1,value = 256},
{type =0,Itemid = 6708,count = 1,value = 257},
{type =0,Itemid = 6708,count = 1,value = 258},
{type =0,Itemid = 6708,count = 1,value = 259},
{type =0,Itemid = 6708,count = 1,value = 260},
{type =0,Itemid = 6708,count = 1,value = 261},

                
                },
            },
            --3级符文盘
            {
                --需要转生等级
                needCircle = 1,            
                    --符文盘槽位对应道具id
                slot =
                {
                    --天、地、水、火、雷、山、风、泽
                    3567, 3568, 3569, 3570, 3571, 3572, 3573, 3574,
                },
                --符文盘套装属性
                suit =
                {
                    {{type = 144, value = 1500}, }, --1级套装
{{type = 144, value = 2900}, }, --2级套装
{{type = 144, value = 4300}, }, --3级套装
{{type = 144, value = 5700}, }, --4级套装
{{type = 144, value = 7100}, }, --5级套装
{{type = 144, value = 8500}, }, --6级套装
{{type = 144, value = 9900}, }, --7级套装
{{type = 144, value = 11300}, }, --8级套装
{{type = 144, value = 12700}, }, --9级套装
{{type = 144, value = 14100}, }, --10级套装
{{type = 144, value = 15500}, }, --11级套装
{{type = 144, value = 16900}, }, --12级套装
{{type = 144, value = 18300}, }, --13级套装
{{type = 144, value = 19700}, }, --14级套装
{{type = 144, value = 21100}, }, --15级套装
{{type = 144, value = 22500}, }, --16级套装
{{type = 144, value = 23900}, }, --17级套装
{{type = 144, value = 25300}, }, --18级套装
{{type = 144, value = 26700}, }, --19级套装
{{type = 144, value = 28100}, }, --20级套装
{{type = 144, value = 29500}, }, --21级套装
{{type = 144, value = 30900}, }, --22级套装
{{type = 144, value = 32300}, }, --23级套装
{{type = 144, value = 33700}, }, --24级套装
{{type = 144, value = 35100}, }, --25级套装
{{type = 144, value = 36500}, }, --26级套装
{{type = 144, value = 37900}, }, --27级套装
{{type = 144, value = 39300}, }, --28级套装
{{type = 144, value = 40700}, }, --29级套装
{{type = 144, value = 42100}, }, --30级套装
{{type = 144, value = 43500}, }, --31级套装
{{type = 144, value = 44900}, }, --32级套装
{{type = 144, value = 46300}, }, --33级套装
{{type = 144, value = 47700}, }, --34级套装
{{type = 144, value = 49100}, }, --35级套装
{{type = 144, value = 50500}, }, --36级套装
{{type = 144, value = 51900}, }, --37级套装
{{type = 144, value = 53300}, }, --38级套装
{{type = 144, value = 54700}, }, --39级套装
{{type = 144, value = 56100}, }, --40级套装
{{type = 144, value = 57500}, }, --41级套装
{{type = 144, value = 58900}, }, --42级套装
{{type = 144, value = 60300}, }, --43级套装
{{type = 144, value = 61700}, }, --44级套装
{{type = 144, value = 63100}, }, --45级套装
{{type = 144, value = 64500}, }, --46级套装
{{type = 144, value = 65900}, }, --47级套装
{{type = 144, value = 67300}, }, --48级套装
{{type = 144, value = 68700}, }, --49级套装
{{type = 144, value = 70100}, }, --50级套装
{{type = 144, value = 71500}, }, --51级套装
{{type = 144, value = 72900}, }, --52级套装
{{type = 144, value = 74300}, }, --53级套装
{{type = 144, value = 75700}, }, --54级套装
{{type = 144, value = 77100}, }, --55级套装
{{type = 144, value = 78500}, }, --56级套装
{{type = 144, value = 79900}, }, --57级套装
{{type = 144, value = 81300}, }, --58级套装
{{type = 144, value = 82700}, }, --59级套装
{{type = 144, value = 84100}, }, --60级套装
{{type = 144, value = 85500}, }, --61级套装
{{type = 144, value = 86900}, }, --62级套装
{{type = 144, value = 88300}, }, --63级套装
{{type = 144, value = 89700}, }, --64级套装
{{type = 144, value = 91100}, }, --65级套装
{{type = 144, value = 92500}, }, --66级套装
{{type = 144, value = 93900}, }, --67级套装
{{type = 144, value = 95300}, }, --68级套装
{{type = 144, value = 96700}, }, --69级套装
{{type = 144, value = 98100}, }, --70级套装
                
                
                },
                --符文盘每级升级经验
                uplevexp =
                {

                     --1-10
                    {type =1,value = 60},
                    {type =1,value = 90},
                    {type =1,value = 120},
                    {type =1,value = 150},
                    {type =1,value = 180},
                    {type =1,value = 210},
                    {type =1,value = 240},
                    {type =1,value = 270},
                    {type =1,value = 300}, 
                    --10-20
                   {type =0,Itemid = 6703,count = 2,value = 301},
{type =0,Itemid = 6703,count = 2,value = 302},
{type =0,Itemid = 6703,count = 2,value = 303},
{type =0,Itemid = 6703,count = 2,value = 304},
{type =0,Itemid = 6703,count = 2,value = 305},
{type =0,Itemid = 6703,count = 2,value = 306},
{type =0,Itemid = 6703,count = 2,value = 307},
{type =0,Itemid = 6703,count = 2,value = 308},
{type =0,Itemid = 6703,count = 2,value = 309},
{type =0,Itemid = 6703,count = 2,value = 310},
{type =0,Itemid = 6703,count = 2,value = 311},
{type =0,Itemid = 6704,count = 1,value = 312},
{type =0,Itemid = 6704,count = 1,value = 313},
{type =0,Itemid = 6704,count = 1,value = 314},
{type =0,Itemid = 6704,count = 1,value = 315},
{type =0,Itemid = 6704,count = 1,value = 316},
{type =0,Itemid = 6704,count = 1,value = 317},
{type =0,Itemid = 6704,count = 1,value = 318},
{type =0,Itemid = 6704,count = 1,value = 319},
{type =0,Itemid = 6704,count = 1,value = 320},
{type =0,Itemid = 6704,count = 1,value = 321},
{type =0,Itemid = 6705,count = 1,value = 322},
{type =0,Itemid = 6705,count = 1,value = 323},
{type =0,Itemid = 6705,count = 1,value = 324},
{type =0,Itemid = 6705,count = 1,value = 325},
{type =0,Itemid = 6705,count = 1,value = 326},
{type =0,Itemid = 6705,count = 1,value = 327},
{type =0,Itemid = 6705,count = 1,value = 328},
{type =0,Itemid = 6705,count = 1,value = 329},
{type =0,Itemid = 6705,count = 1,value = 330},
{type =0,Itemid = 6705,count = 1,value = 331},
{type =0,Itemid = 6706,count = 1,value = 332},
{type =0,Itemid = 6706,count = 1,value = 333},
{type =0,Itemid = 6706,count = 1,value = 334},
{type =0,Itemid = 6706,count = 1,value = 335},
{type =0,Itemid = 6706,count = 1,value = 336},
{type =0,Itemid = 6706,count = 1,value = 337},
{type =0,Itemid = 6706,count = 1,value = 338},
{type =0,Itemid = 6706,count = 1,value = 339},
{type =0,Itemid = 6706,count = 1,value = 340},
{type =0,Itemid = 6706,count = 1,value = 341},
{type =0,Itemid = 6707,count = 1,value = 342},
{type =0,Itemid = 6707,count = 1,value = 343},
{type =0,Itemid = 6707,count = 1,value = 344},
{type =0,Itemid = 6707,count = 1,value = 345},
{type =0,Itemid = 6707,count = 1,value = 346},
{type =0,Itemid = 6707,count = 1,value = 347},
{type =0,Itemid = 6707,count = 1,value = 348},
{type =0,Itemid = 6707,count = 1,value = 349},
{type =0,Itemid = 6707,count = 1,value = 350},
{type =0,Itemid = 6707,count = 1,value = 351},
{type =0,Itemid = 6708,count = 1,value = 352},
{type =0,Itemid = 6708,count = 1,value = 353},
{type =0,Itemid = 6708,count = 1,value = 354},
{type =0,Itemid = 6708,count = 1,value = 355},
{type =0,Itemid = 6708,count = 1,value = 356},
{type =0,Itemid = 6708,count = 1,value = 357},
{type =0,Itemid = 6708,count = 1,value = 358},
{type =0,Itemid = 6708,count = 1,value = 359},
{type =0,Itemid = 6708,count = 1,value = 360},
{type =0,Itemid = 6708,count = 1,value = 361},

                
                },
            },
            --4级符文盘
            {
                --需要转生等级
                needCircle = 4,  
                --符文盘槽位对应道具id
                slot =
                {
                    --天、地、水、火、雷、山、风、泽
                    3575, 3576, 3577, 3578, 3579, 3580, 3581, 3582,
                },
                --符文盘套装属性
                suit =
                {
                    {{type = 144, value = 1800}, }, --1级套装
{{type = 144, value = 3500}, }, --2级套装
{{type = 144, value = 5200}, }, --3级套装
{{type = 144, value = 6900}, }, --4级套装
{{type = 144, value = 8600}, }, --5级套装
{{type = 144, value = 10300}, }, --6级套装
{{type = 144, value = 12000}, }, --7级套装
{{type = 144, value = 13700}, }, --8级套装
{{type = 144, value = 15400}, }, --9级套装
{{type = 144, value = 17100}, }, --10级套装
{{type = 144, value = 18800}, }, --11级套装
{{type = 144, value = 20500}, }, --12级套装
{{type = 144, value = 22200}, }, --13级套装
{{type = 144, value = 23900}, }, --14级套装
{{type = 144, value = 25600}, }, --15级套装
{{type = 144, value = 27300}, }, --16级套装
{{type = 144, value = 29000}, }, --17级套装
{{type = 144, value = 30700}, }, --18级套装
{{type = 144, value = 32400}, }, --19级套装
{{type = 144, value = 34100}, }, --20级套装
{{type = 144, value = 35800}, }, --21级套装
{{type = 144, value = 37500}, }, --22级套装
{{type = 144, value = 39200}, }, --23级套装
{{type = 144, value = 40900}, }, --24级套装
{{type = 144, value = 42600}, }, --25级套装
{{type = 144, value = 44300}, }, --26级套装
{{type = 144, value = 46000}, }, --27级套装
{{type = 144, value = 47700}, }, --28级套装
{{type = 144, value = 49400}, }, --29级套装
{{type = 144, value = 51100}, }, --30级套装
{{type = 144, value = 52800}, }, --31级套装
{{type = 144, value = 54500}, }, --32级套装
{{type = 144, value = 56200}, }, --33级套装
{{type = 144, value = 57900}, }, --34级套装
{{type = 144, value = 59600}, }, --35级套装
{{type = 144, value = 61300}, }, --36级套装
{{type = 144, value = 63000}, }, --37级套装
{{type = 144, value = 64700}, }, --38级套装
{{type = 144, value = 66400}, }, --39级套装
{{type = 144, value = 68100}, }, --40级套装
{{type = 144, value = 69800}, }, --41级套装
{{type = 144, value = 71500}, }, --42级套装
{{type = 144, value = 73200}, }, --43级套装
{{type = 144, value = 74900}, }, --44级套装
{{type = 144, value = 76600}, }, --45级套装
{{type = 144, value = 78300}, }, --46级套装
{{type = 144, value = 80000}, }, --47级套装
{{type = 144, value = 81700}, }, --48级套装
{{type = 144, value = 83400}, }, --49级套装
{{type = 144, value = 85100}, }, --50级套装
{{type = 144, value = 86800}, }, --51级套装
{{type = 144, value = 88500}, }, --52级套装
{{type = 144, value = 90200}, }, --53级套装
{{type = 144, value = 91900}, }, --54级套装
{{type = 144, value = 93600}, }, --55级套装
{{type = 144, value = 95300}, }, --56级套装
{{type = 144, value = 97000}, }, --57级套装
{{type = 144, value = 98700}, }, --58级套装
{{type = 144, value = 100400}, }, --59级套装
{{type = 144, value = 102100}, }, --60级套装
{{type = 144, value = 103800}, }, --61级套装
{{type = 144, value = 105500}, }, --62级套装
{{type = 144, value = 107200}, }, --63级套装
{{type = 144, value = 108900}, }, --64级套装
{{type = 144, value = 110600}, }, --65级套装
{{type = 144, value = 112300}, }, --66级套装
{{type = 144, value = 114000}, }, --67级套装
{{type = 144, value = 115700}, }, --68级套装
{{type = 144, value = 117400}, }, --69级套装
{{type = 144, value = 119100}, }, --70级套装
                
                
                },
                --符文盘每级升级经验
                uplevexp =
                {

                     --1-10
                    {type =1,value = 80},
                    {type =1,value = 120},
                    {type =1,value = 160},
                    {type =1,value = 200},
                    {type =1,value = 240},
                    {type =1,value = 280},
                    {type =1,value = 320},
                    {type =1,value = 360},
                    {type =1,value = 400}, 
                    --10-20
                   {type =0,Itemid = 6703,count = 2,value = 401},
{type =0,Itemid = 6703,count = 2,value = 402},
{type =0,Itemid = 6703,count = 2,value = 403},
{type =0,Itemid = 6703,count = 2,value = 404},
{type =0,Itemid = 6703,count = 2,value = 405},
{type =0,Itemid = 6703,count = 2,value = 406},
{type =0,Itemid = 6703,count = 2,value = 407},
{type =0,Itemid = 6703,count = 2,value = 408},
{type =0,Itemid = 6703,count = 2,value = 409},
{type =0,Itemid = 6703,count = 2,value = 410},
{type =0,Itemid = 6703,count = 2,value = 411},
{type =0,Itemid = 6704,count = 1,value = 412},
{type =0,Itemid = 6704,count = 1,value = 413},
{type =0,Itemid = 6704,count = 1,value = 414},
{type =0,Itemid = 6704,count = 1,value = 415},
{type =0,Itemid = 6704,count = 1,value = 416},
{type =0,Itemid = 6704,count = 1,value = 417},
{type =0,Itemid = 6704,count = 1,value = 418},
{type =0,Itemid = 6704,count = 1,value = 419},
{type =0,Itemid = 6704,count = 1,value = 420},
{type =0,Itemid = 6704,count = 1,value = 421},
{type =0,Itemid = 6705,count = 1,value = 422},
{type =0,Itemid = 6705,count = 1,value = 423},
{type =0,Itemid = 6705,count = 1,value = 424},
{type =0,Itemid = 6705,count = 1,value = 425},
{type =0,Itemid = 6705,count = 1,value = 426},
{type =0,Itemid = 6705,count = 1,value = 427},
{type =0,Itemid = 6705,count = 1,value = 428},
{type =0,Itemid = 6705,count = 1,value = 429},
{type =0,Itemid = 6705,count = 1,value = 430},
{type =0,Itemid = 6705,count = 1,value = 431},
{type =0,Itemid = 6706,count = 1,value = 432},
{type =0,Itemid = 6706,count = 1,value = 433},
{type =0,Itemid = 6706,count = 1,value = 434},
{type =0,Itemid = 6706,count = 1,value = 435},
{type =0,Itemid = 6706,count = 1,value = 436},
{type =0,Itemid = 6706,count = 1,value = 437},
{type =0,Itemid = 6706,count = 1,value = 438},
{type =0,Itemid = 6706,count = 1,value = 439},
{type =0,Itemid = 6706,count = 1,value = 440},
{type =0,Itemid = 6706,count = 1,value = 441},
{type =0,Itemid = 6707,count = 1,value = 442},
{type =0,Itemid = 6707,count = 1,value = 443},
{type =0,Itemid = 6707,count = 1,value = 444},
{type =0,Itemid = 6707,count = 1,value = 445},
{type =0,Itemid = 6707,count = 1,value = 446},
{type =0,Itemid = 6707,count = 1,value = 447},
{type =0,Itemid = 6707,count = 1,value = 448},
{type =0,Itemid = 6707,count = 1,value = 449},
{type =0,Itemid = 6707,count = 1,value = 450},
{type =0,Itemid = 6707,count = 1,value = 451},
{type =0,Itemid = 6708,count = 1,value = 452},
{type =0,Itemid = 6708,count = 1,value = 453},
{type =0,Itemid = 6708,count = 1,value = 454},
{type =0,Itemid = 6708,count = 1,value = 455},
{type =0,Itemid = 6708,count = 1,value = 456},
{type =0,Itemid = 6708,count = 1,value = 457},
{type =0,Itemid = 6708,count = 1,value = 458},
{type =0,Itemid = 6708,count = 1,value = 459},
{type =0,Itemid = 6708,count = 1,value = 460},
{type =0,Itemid = 6708,count = 1,value = 461},

                
                },
            },
            --5级符文盘
            {
                --需要转生等级
                needCircle = 4, 
                --符文盘槽位对应道具id
                slot =
                {
                    --天、地、水、火、雷、山、风、泽
                    3583, 3584, 3585, 3586, 3587, 3588, 3589, 3590,
                },
                --符文盘套装属性
                suit =
                {
                    {{type = 144, value = 2200}, }, --1级套装
{{type = 144, value = 4200}, }, --2级套装
{{type = 144, value = 6200}, }, --3级套装
{{type = 144, value = 8200}, }, --4级套装
{{type = 144, value = 10200}, }, --5级套装
{{type = 144, value = 12200}, }, --6级套装
{{type = 144, value = 14200}, }, --7级套装
{{type = 144, value = 16200}, }, --8级套装
{{type = 144, value = 18200}, }, --9级套装
{{type = 144, value = 20200}, }, --10级套装
{{type = 144, value = 22200}, }, --11级套装
{{type = 144, value = 24200}, }, --12级套装
{{type = 144, value = 26200}, }, --13级套装
{{type = 144, value = 28200}, }, --14级套装
{{type = 144, value = 30200}, }, --15级套装
{{type = 144, value = 32200}, }, --16级套装
{{type = 144, value = 34200}, }, --17级套装
{{type = 144, value = 36200}, }, --18级套装
{{type = 144, value = 38200}, }, --19级套装
{{type = 144, value = 40200}, }, --20级套装
{{type = 144, value = 42200}, }, --21级套装
{{type = 144, value = 44200}, }, --22级套装
{{type = 144, value = 46200}, }, --23级套装
{{type = 144, value = 48200}, }, --24级套装
{{type = 144, value = 50200}, }, --25级套装
{{type = 144, value = 52200}, }, --26级套装
{{type = 144, value = 54200}, }, --27级套装
{{type = 144, value = 56200}, }, --28级套装
{{type = 144, value = 58200}, }, --29级套装
{{type = 144, value = 60200}, }, --30级套装
{{type = 144, value = 62200}, }, --31级套装
{{type = 144, value = 64200}, }, --32级套装
{{type = 144, value = 66200}, }, --33级套装
{{type = 144, value = 68200}, }, --34级套装
{{type = 144, value = 70200}, }, --35级套装
{{type = 144, value = 72200}, }, --36级套装
{{type = 144, value = 74200}, }, --37级套装
{{type = 144, value = 76200}, }, --38级套装
{{type = 144, value = 78200}, }, --39级套装
{{type = 144, value = 80200}, }, --40级套装
{{type = 144, value = 82200}, }, --41级套装
{{type = 144, value = 84200}, }, --42级套装
{{type = 144, value = 86200}, }, --43级套装
{{type = 144, value = 88200}, }, --44级套装
{{type = 144, value = 90200}, }, --45级套装
{{type = 144, value = 92200}, }, --46级套装
{{type = 144, value = 94200}, }, --47级套装
{{type = 144, value = 96200}, }, --48级套装
{{type = 144, value = 98200}, }, --49级套装
{{type = 144, value = 100200}, }, --50级套装
{{type = 144, value = 102200}, }, --51级套装
{{type = 144, value = 104200}, }, --52级套装
{{type = 144, value = 106200}, }, --53级套装
{{type = 144, value = 108200}, }, --54级套装
{{type = 144, value = 110200}, }, --55级套装
{{type = 144, value = 112200}, }, --56级套装
{{type = 144, value = 114200}, }, --57级套装
{{type = 144, value = 116200}, }, --58级套装
{{type = 144, value = 118200}, }, --59级套装
{{type = 144, value = 120200}, }, --60级套装
{{type = 144, value = 122200}, }, --61级套装
{{type = 144, value = 124200}, }, --62级套装
{{type = 144, value = 126200}, }, --63级套装
{{type = 144, value = 128200}, }, --64级套装
{{type = 144, value = 130200}, }, --65级套装
{{type = 144, value = 132200}, }, --66级套装
{{type = 144, value = 134200}, }, --67级套装
{{type = 144, value = 136200}, }, --68级套装
{{type = 144, value = 138200}, }, --69级套装
{{type = 144, value = 140200}, }, --70级套装
                
                },
                --符文盘每级升级经验
                uplevexp =
                {

                    --1-10
                    {type =1,value = 100},
                    {type =1,value = 150},
                    {type =1,value = 200},
                    {type =1,value = 250},
                    {type =1,value = 300},
                    {type =1,value = 350},
                    {type =1,value = 400},
                    {type =1,value = 450},
                    {type =1,value = 500}, 
                    --10-20
                   {type =0,Itemid = 6703,count = 2,value = 501},
{type =0,Itemid = 6703,count = 2,value = 502},
{type =0,Itemid = 6703,count = 2,value = 503},
{type =0,Itemid = 6703,count = 2,value = 504},
{type =0,Itemid = 6703,count = 2,value = 505},
{type =0,Itemid = 6703,count = 2,value = 506},
{type =0,Itemid = 6703,count = 2,value = 507},
{type =0,Itemid = 6703,count = 2,value = 508},
{type =0,Itemid = 6703,count = 2,value = 509},
{type =0,Itemid = 6703,count = 2,value = 510},
{type =0,Itemid = 6703,count = 2,value = 511},
{type =0,Itemid = 6704,count = 1,value = 512},
{type =0,Itemid = 6704,count = 1,value = 513},
{type =0,Itemid = 6704,count = 1,value = 514},
{type =0,Itemid = 6704,count = 1,value = 515},
{type =0,Itemid = 6704,count = 1,value = 516},
{type =0,Itemid = 6704,count = 1,value = 517},
{type =0,Itemid = 6704,count = 1,value = 518},
{type =0,Itemid = 6704,count = 1,value = 519},
{type =0,Itemid = 6704,count = 1,value = 520},
{type =0,Itemid = 6704,count = 1,value = 521},
{type =0,Itemid = 6705,count = 1,value = 522},
{type =0,Itemid = 6705,count = 1,value = 523},
{type =0,Itemid = 6705,count = 1,value = 524},
{type =0,Itemid = 6705,count = 1,value = 525},
{type =0,Itemid = 6705,count = 1,value = 526},
{type =0,Itemid = 6705,count = 1,value = 527},
{type =0,Itemid = 6705,count = 1,value = 528},
{type =0,Itemid = 6705,count = 1,value = 529},
{type =0,Itemid = 6705,count = 1,value = 530},
{type =0,Itemid = 6705,count = 1,value = 531},
{type =0,Itemid = 6706,count = 1,value = 532},
{type =0,Itemid = 6706,count = 1,value = 533},
{type =0,Itemid = 6706,count = 1,value = 534},
{type =0,Itemid = 6706,count = 1,value = 535},
{type =0,Itemid = 6706,count = 1,value = 536},
{type =0,Itemid = 6706,count = 1,value = 537},
{type =0,Itemid = 6706,count = 1,value = 538},
{type =0,Itemid = 6706,count = 1,value = 539},
{type =0,Itemid = 6706,count = 1,value = 540},
{type =0,Itemid = 6706,count = 1,value = 541},
{type =0,Itemid = 6707,count = 1,value = 542},
{type =0,Itemid = 6707,count = 1,value = 543},
{type =0,Itemid = 6707,count = 1,value = 544},
{type =0,Itemid = 6707,count = 1,value = 545},
{type =0,Itemid = 6707,count = 1,value = 546},
{type =0,Itemid = 6707,count = 1,value = 547},
{type =0,Itemid = 6707,count = 1,value = 548},
{type =0,Itemid = 6707,count = 1,value = 549},
{type =0,Itemid = 6707,count = 1,value = 550},
{type =0,Itemid = 6707,count = 1,value = 551},
{type =0,Itemid = 6708,count = 1,value = 552},
{type =0,Itemid = 6708,count = 1,value = 553},
{type =0,Itemid = 6708,count = 1,value = 554},
{type =0,Itemid = 6708,count = 1,value = 555},
{type =0,Itemid = 6708,count = 1,value = 556},
{type =0,Itemid = 6708,count = 1,value = 557},
{type =0,Itemid = 6708,count = 1,value = 558},
{type =0,Itemid = 6708,count = 1,value = 559},
{type =0,Itemid = 6708,count = 1,value = 560},
{type =0,Itemid = 6708,count = 1,value = 561},

                
                },
            },
            --6级符文盘
            {
                --需要转生等级
                needCircle = 4, 
                --符文盘槽位对应道具id
                slot =
                {
                    --天、地、水、火、雷、山、风、泽
                    3591, 3592, 3593, 3594, 3595, 3596, 3597, 3598,
                },
                --符文盘套装属性
                suit =
                {
                   {{type = 144, value = 2200}, }, --1级套装
{{type = 144, value = 4200}, }, --2级套装
{{type = 144, value = 6200}, }, --3级套装
{{type = 144, value = 8200}, }, --4级套装
{{type = 144, value = 10200}, }, --5级套装
{{type = 144, value = 12200}, }, --6级套装
{{type = 144, value = 14200}, }, --7级套装
{{type = 144, value = 16200}, }, --8级套装
{{type = 144, value = 18200}, }, --9级套装
{{type = 144, value = 20200}, }, --10级套装
{{type = 144, value = 22200}, }, --11级套装
{{type = 144, value = 24200}, }, --12级套装
{{type = 144, value = 26200}, }, --13级套装
{{type = 144, value = 28200}, }, --14级套装
{{type = 144, value = 30200}, }, --15级套装
{{type = 144, value = 32200}, }, --16级套装
{{type = 144, value = 34200}, }, --17级套装
{{type = 144, value = 36200}, }, --18级套装
{{type = 144, value = 38200}, }, --19级套装
{{type = 144, value = 40200}, }, --20级套装
{{type = 144, value = 42200}, }, --21级套装
{{type = 144, value = 44200}, }, --22级套装
{{type = 144, value = 2600}, }, --1级套装
{{type = 144, value = 5000}, }, --2级套装
{{type = 144, value = 7400}, }, --3级套装
{{type = 144, value = 9800}, }, --4级套装
{{type = 144, value = 12200}, }, --5级套装
{{type = 144, value = 14600}, }, --6级套装
{{type = 144, value = 17000}, }, --7级套装
{{type = 144, value = 19400}, }, --8级套装
{{type = 144, value = 21800}, }, --9级套装
{{type = 144, value = 24200}, }, --10级套装
{{type = 144, value = 26600}, }, --11级套装
{{type = 144, value = 29000}, }, --12级套装
{{type = 144, value = 31400}, }, --13级套装
{{type = 144, value = 33800}, }, --14级套装
{{type = 144, value = 36200}, }, --15级套装
{{type = 144, value = 38600}, }, --16级套装
{{type = 144, value = 41000}, }, --17级套装
{{type = 144, value = 43400}, }, --18级套装
{{type = 144, value = 45800}, }, --19级套装
{{type = 144, value = 48200}, }, --20级套装
{{type = 144, value = 50600}, }, --21级套装
{{type = 144, value = 53000}, }, --22级套装
{{type = 144, value = 55400}, }, --23级套装
{{type = 144, value = 57800}, }, --24级套装
{{type = 144, value = 60200}, }, --25级套装
{{type = 144, value = 62600}, }, --26级套装
{{type = 144, value = 65000}, }, --27级套装
{{type = 144, value = 67400}, }, --28级套装
{{type = 144, value = 69800}, }, --29级套装
{{type = 144, value = 72200}, }, --30级套装
{{type = 144, value = 74600}, }, --31级套装
{{type = 144, value = 77000}, }, --32级套装
{{type = 144, value = 79400}, }, --33级套装
{{type = 144, value = 81800}, }, --34级套装
{{type = 144, value = 84200}, }, --35级套装
{{type = 144, value = 86600}, }, --36级套装
{{type = 144, value = 89000}, }, --37级套装
{{type = 144, value = 91400}, }, --38级套装
{{type = 144, value = 93800}, }, --39级套装
{{type = 144, value = 96200}, }, --40级套装
{{type = 144, value = 98600}, }, --41级套装
{{type = 144, value = 101000}, }, --42级套装
{{type = 144, value = 103400}, }, --43级套装
{{type = 144, value = 105800}, }, --44级套装
{{type = 144, value = 108200}, }, --45级套装
{{type = 144, value = 110600}, }, --46级套装
{{type = 144, value = 113000}, }, --47级套装
{{type = 144, value = 115400}, }, --48级套装
{{type = 144, value = 117800}, }, --49级套装
{{type = 144, value = 120200}, }, --50级套装
{{type = 144, value = 122600}, }, --51级套装
{{type = 144, value = 125000}, }, --52级套装
{{type = 144, value = 127400}, }, --53级套装
{{type = 144, value = 129800}, }, --54级套装
{{type = 144, value = 132200}, }, --55级套装
{{type = 144, value = 134600}, }, --56级套装
{{type = 144, value = 137000}, }, --57级套装
{{type = 144, value = 139400}, }, --58级套装
{{type = 144, value = 141800}, }, --59级套装
{{type = 144, value = 144200}, }, --60级套装
{{type = 144, value = 146600}, }, --61级套装
{{type = 144, value = 149000}, }, --62级套装
{{type = 144, value = 151400}, }, --63级套装
{{type = 144, value = 153800}, }, --64级套装
{{type = 144, value = 156200}, }, --65级套装
{{type = 144, value = 158600}, }, --66级套装
{{type = 144, value = 161000}, }, --67级套装
{{type = 144, value = 163400}, }, --68级套装
{{type = 144, value = 165800}, }, --69级套装
{{type = 144, value = 168200}, }, --70级套装
                
                
                },
                --符文盘每级升级经验
                uplevexp =
                {

                     --1-10
                    {type =1,value = 120},
                    {type =1,value = 180},
                    {type =1,value = 240},
                    {type =1,value = 300},
                    {type =1,value = 360},
                    {type =1,value = 420},
                    {type =1,value = 480},
                    {type =1,value = 540},
                    {type =1,value = 600}, 
                    --10-20
                    {type =0,Itemid = 6703,count = 2,value = 601},
{type =0,Itemid = 6703,count = 2,value = 602},
{type =0,Itemid = 6703,count = 2,value = 603},
{type =0,Itemid = 6703,count = 2,value = 604},
{type =0,Itemid = 6703,count = 2,value = 605},
{type =0,Itemid = 6703,count = 2,value = 606},
{type =0,Itemid = 6703,count = 2,value = 607},
{type =0,Itemid = 6703,count = 2,value = 608},
{type =0,Itemid = 6703,count = 2,value = 609},
{type =0,Itemid = 6703,count = 2,value = 610},
{type =0,Itemid = 6703,count = 2,value = 611},
{type =0,Itemid = 6704,count = 1,value = 612},
{type =0,Itemid = 6704,count = 1,value = 613},
{type =0,Itemid = 6704,count = 1,value = 614},
{type =0,Itemid = 6704,count = 1,value = 615},
{type =0,Itemid = 6704,count = 1,value = 616},
{type =0,Itemid = 6704,count = 1,value = 617},
{type =0,Itemid = 6704,count = 1,value = 618},
{type =0,Itemid = 6704,count = 1,value = 619},
{type =0,Itemid = 6704,count = 1,value = 620},
{type =0,Itemid = 6704,count = 1,value = 621},
{type =0,Itemid = 6705,count = 1,value = 622},
{type =0,Itemid = 6705,count = 1,value = 623},
{type =0,Itemid = 6705,count = 1,value = 624},
{type =0,Itemid = 6705,count = 1,value = 625},
{type =0,Itemid = 6705,count = 1,value = 626},
{type =0,Itemid = 6705,count = 1,value = 627},
{type =0,Itemid = 6705,count = 1,value = 628},
{type =0,Itemid = 6705,count = 1,value = 629},
{type =0,Itemid = 6705,count = 1,value = 630},
{type =0,Itemid = 6705,count = 1,value = 631},
{type =0,Itemid = 6706,count = 1,value = 632},
{type =0,Itemid = 6706,count = 1,value = 633},
{type =0,Itemid = 6706,count = 1,value = 634},
{type =0,Itemid = 6706,count = 1,value = 635},
{type =0,Itemid = 6706,count = 1,value = 636},
{type =0,Itemid = 6706,count = 1,value = 637},
{type =0,Itemid = 6706,count = 1,value = 638},
{type =0,Itemid = 6706,count = 1,value = 639},
{type =0,Itemid = 6706,count = 1,value = 640},
{type =0,Itemid = 6706,count = 1,value = 641},
{type =0,Itemid = 6707,count = 1,value = 642},
{type =0,Itemid = 6707,count = 1,value = 643},
{type =0,Itemid = 6707,count = 1,value = 644},
{type =0,Itemid = 6707,count = 1,value = 645},
{type =0,Itemid = 6707,count = 1,value = 646},
{type =0,Itemid = 6707,count = 1,value = 647},
{type =0,Itemid = 6707,count = 1,value = 648},
{type =0,Itemid = 6707,count = 1,value = 649},
{type =0,Itemid = 6707,count = 1,value = 650},
{type =0,Itemid = 6707,count = 1,value = 651},
{type =0,Itemid = 6708,count = 1,value = 652},
{type =0,Itemid = 6708,count = 1,value = 653},
{type =0,Itemid = 6708,count = 1,value = 654},
{type =0,Itemid = 6708,count = 1,value = 655},
{type =0,Itemid = 6708,count = 1,value = 656},
{type =0,Itemid = 6708,count = 1,value = 657},
{type =0,Itemid = 6708,count = 1,value = 658},
{type =0,Itemid = 6708,count = 1,value = 659},
{type =0,Itemid = 6708,count = 1,value = 660},
{type =0,Itemid = 6708,count = 1,value = 661},

                
                },
            },
            --7级符文盘
            {
                --需要转生等级
                needCircle = 7, 
                --符文盘槽位对应道具id
                slot =
                {
                    --天、地、水、火、雷、山、风、泽
                    3599, 3600, 3601, 3602, 3603, 3604, 3605, 3606,
                },
                --符文盘套装属性
                suit =
                {
                    {{type = 144, value = 3000}, }, --1级套装
{{type = 144, value = 5900}, }, --2级套装
{{type = 144, value = 8800}, }, --3级套装
{{type = 144, value = 11700}, }, --4级套装
{{type = 144, value = 14600}, }, --5级套装
{{type = 144, value = 17500}, }, --6级套装
{{type = 144, value = 20400}, }, --7级套装
{{type = 144, value = 23300}, }, --8级套装
{{type = 144, value = 26200}, }, --9级套装
{{type = 144, value = 29100}, }, --10级套装
{{type = 144, value = 32000}, }, --11级套装
{{type = 144, value = 34900}, }, --12级套装
{{type = 144, value = 37800}, }, --13级套装
{{type = 144, value = 40700}, }, --14级套装
{{type = 144, value = 43600}, }, --15级套装
{{type = 144, value = 46500}, }, --16级套装
{{type = 144, value = 49400}, }, --17级套装
{{type = 144, value = 52300}, }, --18级套装
{{type = 144, value = 55200}, }, --19级套装
{{type = 144, value = 58100}, }, --20级套装
{{type = 144, value = 61000}, }, --21级套装
{{type = 144, value = 63900}, }, --22级套装
{{type = 144, value = 66800}, }, --23级套装
{{type = 144, value = 69700}, }, --24级套装
{{type = 144, value = 72600}, }, --25级套装
{{type = 144, value = 75500}, }, --26级套装
{{type = 144, value = 78400}, }, --27级套装
{{type = 144, value = 81300}, }, --28级套装
{{type = 144, value = 84200}, }, --29级套装
{{type = 144, value = 87100}, }, --30级套装
{{type = 144, value = 90000}, }, --31级套装
{{type = 144, value = 92900}, }, --32级套装
{{type = 144, value = 95800}, }, --33级套装
{{type = 144, value = 98700}, }, --34级套装
{{type = 144, value = 101600}, }, --35级套装
{{type = 144, value = 104500}, }, --36级套装
{{type = 144, value = 107400}, }, --37级套装
{{type = 144, value = 110300}, }, --38级套装
{{type = 144, value = 113200}, }, --39级套装
{{type = 144, value = 116100}, }, --40级套装
{{type = 144, value = 119000}, }, --41级套装
{{type = 144, value = 121900}, }, --42级套装
{{type = 144, value = 124800}, }, --43级套装
{{type = 144, value = 127700}, }, --44级套装
{{type = 144, value = 130600}, }, --45级套装
{{type = 144, value = 133500}, }, --46级套装
{{type = 144, value = 136400}, }, --47级套装
{{type = 144, value = 139300}, }, --48级套装
{{type = 144, value = 142200}, }, --49级套装
{{type = 144, value = 145100}, }, --50级套装
{{type = 144, value = 148000}, }, --51级套装
{{type = 144, value = 150900}, }, --52级套装
{{type = 144, value = 153800}, }, --53级套装
{{type = 144, value = 156700}, }, --54级套装
{{type = 144, value = 159600}, }, --55级套装
{{type = 144, value = 162500}, }, --56级套装
{{type = 144, value = 165400}, }, --57级套装
{{type = 144, value = 168300}, }, --58级套装
{{type = 144, value = 171200}, }, --59级套装
{{type = 144, value = 174100}, }, --60级套装
{{type = 144, value = 177000}, }, --61级套装
{{type = 144, value = 179900}, }, --62级套装
{{type = 144, value = 182800}, }, --63级套装
{{type = 144, value = 185700}, }, --64级套装
{{type = 144, value = 188600}, }, --65级套装
{{type = 144, value = 191500}, }, --66级套装
{{type = 144, value = 194400}, }, --67级套装
{{type = 144, value = 197300}, }, --68级套装
{{type = 144, value = 200200}, }, --69级套装
{{type = 144, value = 203100}, }, --70级套装
                
                },
                --符文盘每级升级经验
                uplevexp =
                {

                     --1-10
                    {type =1,value = 140},
                    {type =1,value = 210},
                    {type =1,value = 280},
                    {type =1,value = 350},
                    {type =1,value = 420},
                    {type =1,value = 490},
                    {type =1,value = 560},
                    {type =1,value = 630},
                    {type =1,value = 700}, 
                    --10-20
                  {type =0,Itemid = 6703,count = 2,value = 701},
{type =0,Itemid = 6703,count = 2,value = 702},
{type =0,Itemid = 6703,count = 2,value = 703},
{type =0,Itemid = 6703,count = 2,value = 704},
{type =0,Itemid = 6703,count = 2,value = 705},
{type =0,Itemid = 6703,count = 2,value = 706},
{type =0,Itemid = 6703,count = 2,value = 707},
{type =0,Itemid = 6703,count = 2,value = 708},
{type =0,Itemid = 6703,count = 2,value = 709},
{type =0,Itemid = 6703,count = 2,value = 710},
{type =0,Itemid = 6703,count = 2,value = 711},
{type =0,Itemid = 6704,count = 1,value = 712},
{type =0,Itemid = 6704,count = 1,value = 713},
{type =0,Itemid = 6704,count = 1,value = 714},
{type =0,Itemid = 6704,count = 1,value = 715},
{type =0,Itemid = 6704,count = 1,value = 716},
{type =0,Itemid = 6704,count = 1,value = 717},
{type =0,Itemid = 6704,count = 1,value = 718},
{type =0,Itemid = 6704,count = 1,value = 719},
{type =0,Itemid = 6704,count = 1,value = 720},
{type =0,Itemid = 6704,count = 1,value = 721},
{type =0,Itemid = 6705,count = 1,value = 722},
{type =0,Itemid = 6705,count = 1,value = 723},
{type =0,Itemid = 6705,count = 1,value = 724},
{type =0,Itemid = 6705,count = 1,value = 725},
{type =0,Itemid = 6705,count = 1,value = 726},
{type =0,Itemid = 6705,count = 1,value = 727},
{type =0,Itemid = 6705,count = 1,value = 728},
{type =0,Itemid = 6705,count = 1,value = 729},
{type =0,Itemid = 6705,count = 1,value = 730},
{type =0,Itemid = 6705,count = 1,value = 731},
{type =0,Itemid = 6706,count = 1,value = 732},
{type =0,Itemid = 6706,count = 1,value = 733},
{type =0,Itemid = 6706,count = 1,value = 734},
{type =0,Itemid = 6706,count = 1,value = 735},
{type =0,Itemid = 6706,count = 1,value = 736},
{type =0,Itemid = 6706,count = 1,value = 737},
{type =0,Itemid = 6706,count = 1,value = 738},
{type =0,Itemid = 6706,count = 1,value = 739},
{type =0,Itemid = 6706,count = 1,value = 740},
{type =0,Itemid = 6706,count = 1,value = 741},
{type =0,Itemid = 6707,count = 1,value = 742},
{type =0,Itemid = 6707,count = 1,value = 743},
{type =0,Itemid = 6707,count = 1,value = 744},
{type =0,Itemid = 6707,count = 1,value = 745},
{type =0,Itemid = 6707,count = 1,value = 746},
{type =0,Itemid = 6707,count = 1,value = 747},
{type =0,Itemid = 6707,count = 1,value = 748},
{type =0,Itemid = 6707,count = 1,value = 749},
{type =0,Itemid = 6707,count = 1,value = 750},
{type =0,Itemid = 6707,count = 1,value = 751},
{type =0,Itemid = 6708,count = 1,value = 752},
{type =0,Itemid = 6708,count = 1,value = 753},
{type =0,Itemid = 6708,count = 1,value = 754},
{type =0,Itemid = 6708,count = 1,value = 755},
{type =0,Itemid = 6708,count = 1,value = 756},
{type =0,Itemid = 6708,count = 1,value = 757},
{type =0,Itemid = 6708,count = 1,value = 758},
{type =0,Itemid = 6708,count = 1,value = 759},
{type =0,Itemid = 6708,count = 1,value = 760},
{type =0,Itemid = 6708,count = 1,value = 761},

                
                },
            },
            --9级符文盘
            {
                --需要转生等级
                needCircle = 7, 
                --符文盘槽位对应道具id
                slot =
                {
                    --天、地、水、火、雷、山、风、泽
                    3607, 3608, 3609, 3610, 3611, 3612, 3613, 3614,
                },
                --符文盘套装属性
                suit =
                {
                    {{type = 144, value = 3500}, }, --1级套装
{{type = 144, value = 7000}, }, --2级套装
{{type = 144, value = 10500}, }, --3级套装
{{type = 144, value = 14000}, }, --4级套装
{{type = 144, value = 17500}, }, --5级套装
{{type = 144, value = 21000}, }, --6级套装
{{type = 144, value = 24500}, }, --7级套装
{{type = 144, value = 28000}, }, --8级套装
{{type = 144, value = 31500}, }, --9级套装
{{type = 144, value = 35000}, }, --10级套装
{{type = 144, value = 38500}, }, --11级套装
{{type = 144, value = 42000}, }, --12级套装
{{type = 144, value = 45500}, }, --13级套装
{{type = 144, value = 49000}, }, --14级套装
{{type = 144, value = 52500}, }, --15级套装
{{type = 144, value = 56000}, }, --16级套装
{{type = 144, value = 59500}, }, --17级套装
{{type = 144, value = 63000}, }, --18级套装
{{type = 144, value = 66500}, }, --19级套装
{{type = 144, value = 70000}, }, --20级套装
{{type = 144, value = 73500}, }, --21级套装
{{type = 144, value = 77000}, }, --22级套装
{{type = 144, value = 80500}, }, --23级套装
{{type = 144, value = 84000}, }, --24级套装
{{type = 144, value = 87500}, }, --25级套装
{{type = 144, value = 91000}, }, --26级套装
{{type = 144, value = 94500}, }, --27级套装
{{type = 144, value = 98000}, }, --28级套装
{{type = 144, value = 101500}, }, --29级套装
{{type = 144, value = 105000}, }, --30级套装
{{type = 144, value = 108500}, }, --31级套装
{{type = 144, value = 112000}, }, --32级套装
{{type = 144, value = 115500}, }, --33级套装
{{type = 144, value = 119000}, }, --34级套装
{{type = 144, value = 122500}, }, --35级套装
{{type = 144, value = 126000}, }, --36级套装
{{type = 144, value = 129500}, }, --37级套装
{{type = 144, value = 133000}, }, --38级套装
{{type = 144, value = 136500}, }, --39级套装
{{type = 144, value = 140000}, }, --40级套装
{{type = 144, value = 143500}, }, --41级套装
{{type = 144, value = 147000}, }, --42级套装
{{type = 144, value = 150500}, }, --43级套装
{{type = 144, value = 154000}, }, --44级套装
{{type = 144, value = 157500}, }, --45级套装
{{type = 144, value = 161000}, }, --46级套装
{{type = 144, value = 164500}, }, --47级套装
{{type = 144, value = 168000}, }, --48级套装
{{type = 144, value = 171500}, }, --49级套装
{{type = 144, value = 175000}, }, --50级套装
{{type = 144, value = 178500}, }, --51级套装
{{type = 144, value = 182000}, }, --52级套装
{{type = 144, value = 185500}, }, --53级套装
{{type = 144, value = 189000}, }, --54级套装
{{type = 144, value = 192500}, }, --55级套装
{{type = 144, value = 196000}, }, --56级套装
{{type = 144, value = 199500}, }, --57级套装
{{type = 144, value = 203000}, }, --58级套装
{{type = 144, value = 206500}, }, --59级套装
{{type = 144, value = 210000}, }, --60级套装
{{type = 144, value = 213500}, }, --61级套装
{{type = 144, value = 217000}, }, --62级套装
{{type = 144, value = 220500}, }, --63级套装
{{type = 144, value = 224000}, }, --64级套装
{{type = 144, value = 227500}, }, --65级套装
{{type = 144, value = 231000}, }, --66级套装
{{type = 144, value = 234500}, }, --67级套装
{{type = 144, value = 238000}, }, --68级套装
{{type = 144, value = 241500}, }, --69级套装
{{type = 144, value = 245000}, }, --70级套装
                
                },
                --符文盘每级升级经验
                uplevexp =
                {

                     --1-10
                    {type =1,value = 180},
                    {type =1,value = 270},
                    {type =1,value = 360},
                    {type =1,value = 450},
                    {type =1,value = 540},
                    {type =1,value = 630},
                    {type =1,value = 720},
                    {type =1,value = 810},
                    {type =1,value = 900}, 

                    --10-20
                   {type =0,Itemid = 6703,count = 2,value = 901},
{type =0,Itemid = 6703,count = 2,value = 902},
{type =0,Itemid = 6703,count = 2,value = 903},
{type =0,Itemid = 6703,count = 2,value = 904},
{type =0,Itemid = 6703,count = 2,value = 905},
{type =0,Itemid = 6703,count = 2,value = 906},
{type =0,Itemid = 6703,count = 2,value = 907},
{type =0,Itemid = 6703,count = 2,value = 908},
{type =0,Itemid = 6703,count = 2,value = 909},
{type =0,Itemid = 6703,count = 2,value = 910},
{type =0,Itemid = 6703,count = 2,value = 911},
{type =0,Itemid = 6704,count = 1,value = 912},
{type =0,Itemid = 6704,count = 1,value = 913},
{type =0,Itemid = 6704,count = 1,value = 914},
{type =0,Itemid = 6704,count = 1,value = 915},
{type =0,Itemid = 6704,count = 1,value = 916},
{type =0,Itemid = 6704,count = 1,value = 917},
{type =0,Itemid = 6704,count = 1,value = 918},
{type =0,Itemid = 6704,count = 1,value = 919},
{type =0,Itemid = 6704,count = 1,value = 920},
{type =0,Itemid = 6704,count = 1,value = 921},
{type =0,Itemid = 6705,count = 1,value = 922},
{type =0,Itemid = 6705,count = 1,value = 923},
{type =0,Itemid = 6705,count = 1,value = 924},
{type =0,Itemid = 6705,count = 1,value = 925},
{type =0,Itemid = 6705,count = 1,value = 926},
{type =0,Itemid = 6705,count = 1,value = 927},
{type =0,Itemid = 6705,count = 1,value = 928},
{type =0,Itemid = 6705,count = 1,value = 929},
{type =0,Itemid = 6705,count = 1,value = 930},
{type =0,Itemid = 6705,count = 1,value = 931},
{type =0,Itemid = 6706,count = 1,value = 932},
{type =0,Itemid = 6706,count = 1,value = 933},
{type =0,Itemid = 6706,count = 1,value = 934},
{type =0,Itemid = 6706,count = 1,value = 935},
{type =0,Itemid = 6706,count = 1,value = 936},
{type =0,Itemid = 6706,count = 1,value = 937},
{type =0,Itemid = 6706,count = 1,value = 938},
{type =0,Itemid = 6706,count = 1,value = 939},
{type =0,Itemid = 6706,count = 1,value = 940},
{type =0,Itemid = 6706,count = 1,value = 941},
{type =0,Itemid = 6707,count = 1,value = 942},
{type =0,Itemid = 6707,count = 1,value = 943},
{type =0,Itemid = 6707,count = 1,value = 944},
{type =0,Itemid = 6707,count = 1,value = 945},
{type =0,Itemid = 6707,count = 1,value = 946},
{type =0,Itemid = 6707,count = 1,value = 947},
{type =0,Itemid = 6707,count = 1,value = 948},
{type =0,Itemid = 6707,count = 1,value = 949},
{type =0,Itemid = 6707,count = 1,value = 950},
{type =0,Itemid = 6707,count = 1,value = 951},
{type =0,Itemid = 6708,count = 1,value = 952},
{type =0,Itemid = 6708,count = 1,value = 953},
{type =0,Itemid = 6708,count = 1,value = 954},
{type =0,Itemid = 6708,count = 1,value = 955},
{type =0,Itemid = 6708,count = 1,value = 956},
{type =0,Itemid = 6708,count = 1,value = 957},
{type =0,Itemid = 6708,count = 1,value = 958},
{type =0,Itemid = 6708,count = 1,value = 959},
{type =0,Itemid = 6708,count = 1,value = 960},
{type =0,Itemid = 6708,count = 1,value = 961},

                
                },
            },
            --11级符文盘
            {
                --需要转生等级
                needCircle =8, 
                --符文盘槽位对应道具id
                slot =
                {
                    --天、地、水、火、雷、山、风、泽
                    3615, 3616, 3617, 3618, 3619, 3620, 3621, 3622,
                },
                --符文盘套装属性
                suit =
                {
                   {{type = 144, value = 4000}, }, --1级套装
{{type = 144, value = 8200}, }, --2级套装
{{type = 144, value = 12400}, }, --3级套装
{{type = 144, value = 16600}, }, --4级套装
{{type = 144, value = 20800}, }, --5级套装
{{type = 144, value = 25000}, }, --6级套装
{{type = 144, value = 29200}, }, --7级套装
{{type = 144, value = 33400}, }, --8级套装
{{type = 144, value = 37600}, }, --9级套装
{{type = 144, value = 41800}, }, --10级套装
{{type = 144, value = 46000}, }, --11级套装
{{type = 144, value = 50200}, }, --12级套装
{{type = 144, value = 54400}, }, --13级套装
{{type = 144, value = 58600}, }, --14级套装
{{type = 144, value = 62800}, }, --15级套装
{{type = 144, value = 67000}, }, --16级套装
{{type = 144, value = 71200}, }, --17级套装
{{type = 144, value = 75400}, }, --18级套装
{{type = 144, value = 79600}, }, --19级套装
{{type = 144, value = 83800}, }, --20级套装
{{type = 144, value = 88000}, }, --21级套装
{{type = 144, value = 92200}, }, --22级套装
{{type = 144, value = 96400}, }, --23级套装
{{type = 144, value = 100600}, }, --24级套装
{{type = 144, value = 104800}, }, --25级套装
{{type = 144, value = 109000}, }, --26级套装
{{type = 144, value = 113200}, }, --27级套装
{{type = 144, value = 117400}, }, --28级套装
{{type = 144, value = 121600}, }, --29级套装
{{type = 144, value = 125800}, }, --30级套装
{{type = 144, value = 130000}, }, --31级套装
{{type = 144, value = 134200}, }, --32级套装
{{type = 144, value = 138400}, }, --33级套装
{{type = 144, value = 142600}, }, --34级套装
{{type = 144, value = 146800}, }, --35级套装
{{type = 144, value = 151000}, }, --36级套装
{{type = 144, value = 155200}, }, --37级套装
{{type = 144, value = 159400}, }, --38级套装
{{type = 144, value = 163600}, }, --39级套装
{{type = 144, value = 167800}, }, --40级套装
{{type = 144, value = 172000}, }, --41级套装
{{type = 144, value = 176200}, }, --42级套装
{{type = 144, value = 180400}, }, --43级套装
{{type = 144, value = 184600}, }, --44级套装
{{type = 144, value = 188800}, }, --45级套装
{{type = 144, value = 193000}, }, --46级套装
{{type = 144, value = 197200}, }, --47级套装
{{type = 144, value = 201400}, }, --48级套装
{{type = 144, value = 205600}, }, --49级套装
{{type = 144, value = 209800}, }, --50级套装
{{type = 144, value = 214000}, }, --51级套装
{{type = 144, value = 218200}, }, --52级套装
{{type = 144, value = 222400}, }, --53级套装
{{type = 144, value = 226600}, }, --54级套装
{{type = 144, value = 230800}, }, --55级套装
{{type = 144, value = 235000}, }, --56级套装
{{type = 144, value = 239200}, }, --57级套装
{{type = 144, value = 243400}, }, --58级套装
{{type = 144, value = 247600}, }, --59级套装
{{type = 144, value = 251800}, }, --60级套装
{{type = 144, value = 256000}, }, --61级套装
{{type = 144, value = 260200}, }, --62级套装
{{type = 144, value = 264400}, }, --63级套装
{{type = 144, value = 268600}, }, --64级套装
{{type = 144, value = 272800}, }, --65级套装
{{type = 144, value = 277000}, }, --66级套装
{{type = 144, value = 281200}, }, --67级套装
{{type = 144, value = 285400}, }, --68级套装
{{type = 144, value = 289600}, }, --69级套装
{{type = 144, value = 293800}, }, --70级套装
                
                },
                --符文盘每级升级经验
                uplevexp =
                {
                      --1-10
                    {type =1,value = 220},
                    {type =1,value = 330},
                    {type =1,value = 440},
                    {type =1,value = 550},
                    {type =1,value = 660},
                    {type =1,value = 770},
                    {type =1,value = 880},
                    {type =1,value = 990},
                    {type =1,value = 1100}, 

                    --10-20
                  {type =0,Itemid = 6703,count = 2,value = 1101},
{type =0,Itemid = 6703,count = 2,value = 1102},
{type =0,Itemid = 6703,count = 2,value = 1103},
{type =0,Itemid = 6703,count = 2,value = 1104},
{type =0,Itemid = 6703,count = 2,value = 1105},
{type =0,Itemid = 6703,count = 2,value = 1106},
{type =0,Itemid = 6703,count = 2,value = 1107},
{type =0,Itemid = 6703,count = 2,value = 1108},
{type =0,Itemid = 6703,count = 2,value = 1109},
{type =0,Itemid = 6703,count = 2,value = 1110},
{type =0,Itemid = 6703,count = 2,value = 1111},
{type =0,Itemid = 6704,count = 1,value = 1112},
{type =0,Itemid = 6704,count = 1,value = 1113},
{type =0,Itemid = 6704,count = 1,value = 1114},
{type =0,Itemid = 6704,count = 1,value = 1115},
{type =0,Itemid = 6704,count = 1,value = 1116},
{type =0,Itemid = 6704,count = 1,value = 1117},
{type =0,Itemid = 6704,count = 1,value = 1118},
{type =0,Itemid = 6704,count = 1,value = 1119},
{type =0,Itemid = 6704,count = 1,value = 1120},
{type =0,Itemid = 6704,count = 1,value = 1121},
{type =0,Itemid = 6705,count = 1,value = 1122},
{type =0,Itemid = 6705,count = 1,value = 1123},
{type =0,Itemid = 6705,count = 1,value = 1124},
{type =0,Itemid = 6705,count = 1,value = 1125},
{type =0,Itemid = 6705,count = 1,value = 1126},
{type =0,Itemid = 6705,count = 1,value = 1127},
{type =0,Itemid = 6705,count = 1,value = 1128},
{type =0,Itemid = 6705,count = 1,value = 1129},
{type =0,Itemid = 6705,count = 1,value = 1130},
{type =0,Itemid = 6705,count = 1,value = 1131},
{type =0,Itemid = 6706,count = 1,value = 1132},
{type =0,Itemid = 6706,count = 1,value = 1133},
{type =0,Itemid = 6706,count = 1,value = 1134},
{type =0,Itemid = 6706,count = 1,value = 1135},
{type =0,Itemid = 6706,count = 1,value = 1136},
{type =0,Itemid = 6706,count = 1,value = 1137},
{type =0,Itemid = 6706,count = 1,value = 1138},
{type =0,Itemid = 6706,count = 1,value = 1139},
{type =0,Itemid = 6706,count = 1,value = 1140},
{type =0,Itemid = 6706,count = 1,value = 1141},
{type =0,Itemid = 6707,count = 1,value = 1142},
{type =0,Itemid = 6707,count = 1,value = 1143},
{type =0,Itemid = 6707,count = 1,value = 1144},
{type =0,Itemid = 6707,count = 1,value = 1145},
{type =0,Itemid = 6707,count = 1,value = 1146},
{type =0,Itemid = 6707,count = 1,value = 1147},
{type =0,Itemid = 6707,count = 1,value = 1148},
{type =0,Itemid = 6707,count = 1,value = 1149},
{type =0,Itemid = 6707,count = 1,value = 1150},
{type =0,Itemid = 6707,count = 1,value = 1151},
{type =0,Itemid = 6708,count = 1,value = 1152},
{type =0,Itemid = 6708,count = 1,value = 1153},
{type =0,Itemid = 6708,count = 1,value = 1154},
{type =0,Itemid = 6708,count = 1,value = 1155},
{type =0,Itemid = 6708,count = 1,value = 1156},
{type =0,Itemid = 6708,count = 1,value = 1157},
{type =0,Itemid = 6708,count = 1,value = 1158},
{type =0,Itemid = 6708,count = 1,value = 1159},
{type =0,Itemid = 6708,count = 1,value = 1160},
{type =0,Itemid = 6708,count = 1,value = 1161},

                
                },
            },
        },
        --道具掉落附加属性几率
        drop =
        {
            {
                --道具id
                item = {3551, 3552, 3553, 3554, 3555, 3556, 3557, 3558}, --1转碎片
                attr =
                {
                    --type 类型 value=附加属性随机最大值 rate=几率/万分比
                    {type = 5, value = {500, 550, 600, 650, 700, 750, 800}, rate = {3000, 2000, 1800, 1500, 1200, 300, 200}, },
                    {type = 7, value = {500, 550, 600, 650, 700, 750, 800}, rate = {3000, 2000, 1800, 1500, 1200, 300, 200}, },
                
                
                },
            },
            {
                --道具id
                item = {3559, 3560, 3561, 3562, 3563, 3564, 3565, 3566}, --2转碎片
                attr =
                {
                    --type 类型 value=附加属性随机最大值 rate=几率/万分比
                    {type = 23, value = {50, 55, 60, 65, 70, 75, 80}, rate = {3000, 2000, 1800, 1500, 1200, 300, 200}, },
                    {type = 27, value = {50, 55, 60, 65, 70, 75, 80}, rate = {3000, 2000, 1800, 1500, 1200, 300, 200}, },
                
                
                },
            },
            {
                --道具id
                item = {3567, 3568, 3569, 3570, 3571, 3572, 3573, 3574}, --3转碎片
                attr =
                {
                    --type 类型 value=附加属性随机最大值 rate=几率/万分比
                    {type = 11, value = {60, 70, 80, 90, 100, 110, 120}, rate = {3000, 2000, 1800, 1500, 1200, 300, 200}, },
                    {type = 15, value = {60, 70, 80, 90, 100, 110, 120}, rate = {3000, 2000, 1800, 1500, 1200, 300, 200}, },
                    {type = 19, value = {60, 70, 80, 90, 100, 110, 120}, rate = {3000, 2000, 1800, 1500, 1200, 300, 200}, },
                
                },
            },
            {
                --道具id
                item = {3575, 3576, 3577, 3578, 3579, 3580, 3581, 3582}, --4转碎片
                attr =
                {
                    --type 类型 value=附加属性随机最大值 rate=几率/万分比
                    {type = 5, value = {1000, 1100, 1200, 1300, 1400, 1500, 1600}, rate = {3000, 2000, 1800, 1500, 1200, 300, 200}, },
                    {type = 7, value = {1000, 1100, 1200, 1300, 1400, 1500, 1600}, rate = {3000, 2000, 1800, 1500, 1200, 300, 200}, },
                
                
                },
            },
            {
                --道具id
                item = {3583, 3584, 3585, 3586, 3587, 3588, 3589, 3590}, --5转碎片
                attr =
                {
                    --type 类型 value=附加属性随机最大值 rate=几率/万分比
                    {type = 23, value = {100, 110, 120, 130, 140, 150, 160}, rate = {3000, 2000, 1800, 1500, 1200, 300, 200}, },
                    {type = 27, value = {100, 110, 120, 130, 140, 150, 160}, rate = {3000, 2000, 1800, 1500, 1200, 300, 200}, },
                
                
                },
            },
            {
                --道具id
                item = {3591, 3592, 3593, 3594, 3595, 3596, 3597, 3598}, --6转碎片
                attr =
                {
                    --type 类型 value=附加属性随机最大值 rate=几率/万分比
                    {type = 11, value = {120, 140, 160, 180, 200, 220, 240}, rate = {3000, 2000, 1800, 1500, 1200, 300, 200}, },
                    {type = 15, value = {120, 140, 160, 180, 200, 220, 240}, rate = {3000, 2000, 1800, 1500, 1200, 300, 200}, },
                    {type = 19, value = {120, 140, 160, 180, 200, 220, 240}, rate = {3000, 2000, 1800, 1500, 1200, 300, 200}, },
                
                
                },
            },
            {
                --道具id
                item = {3599, 3600, 3601, 3602, 3603, 3604, 3605, 3606}, --7转碎片
                attr =
                {
                    --type 类型 value=附加属性随机最大值 rate=几率/万分比
                    {type = 5, value = {2000, 2200, 2400, 2600, 2800, 3000, 3200}, rate = {3000, 2000, 1800, 1500, 1200, 300, 200}, },
                    {type = 7, value = {2000, 2200, 2400, 2600, 2800, 3000, 3200}, rate = {3000, 2000, 1800, 1500, 1200, 300, 200}, },
                
                },
            },
            {
                --道具id
                item = {3607, 3608, 3609, 3610, 3611, 3612, 3613, 3614}, --9转碎片
                attr =
                {
                    --type 类型 value=附加属性随机最大值 rate=几率/万分比
                    {type = 23, value = {200, 220, 240, 260, 280, 300, 320}, rate = {3000, 2000, 1800, 1500, 1200, 300, 200}, },
                    {type = 27, value = {200, 220, 240, 260, 280, 300, 320}, rate = {3000, 2000, 1800, 1500, 1200, 300, 200}, },
                
                },
            },
            {
                --道具id
                item = {3615, 3616, 3617, 3618, 3619, 3620, 3621, 3622}, --11转碎片
                attr =
                {
                    --type 类型 value=附加属性随机最大值 rate=几率/万分比
                    {type = 11, value = {240, 280, 320, 360, 400, 440, 480}, rate = {3000, 2000, 1800, 1500, 1200, 300, 200}, },
                    {type = 15, value = {240, 280, 320, 360, 400, 440, 480}, rate = {3000, 2000, 1800, 1500, 1200, 300, 200}, },
                    {type = 19, value = {240, 280, 320, 360, 400, 440, 480}, rate = {3000, 2000, 1800, 1500, 1200, 300, 200}, },
                
                },
            },
        },
        exchange = --符文碎片兑换符文精华
        {
            {
                item = {3551, 3552, 3553, 3554, 3555, 3556, 3557, 3558}, --1转碎片
                value = 1, --一个道具兑换的符文精华数量
            },
            {
                item = {3559, 3560, 3561, 3562, 3563, 3564, 3565, 3566}, --2转碎片
                value = 2, --一个道具兑换的符文精华数量
            },
            {
                item = {3567, 3568, 3569, 3570, 3571, 3572, 3573, 3574}, --3转碎片
                value = 3, --一个道具兑换的符文精华数量
            },
            {
                item = {3575, 3576, 3577, 3578, 3579, 3580, 3581, 3582}, --4转碎片
                value = 4, --一个道具兑换的符文精华数量
            },
            {
                item = {3583, 3584, 3585, 3586, 3587, 3588, 3589, 3590}, --5转碎片
                value = 5, --一个道具兑换的符文精华数量
            },
            {
                item = {3591, 3592, 3593, 3594, 3595, 3596, 3597, 3598}, --6转碎片
                value = 6, --一个道具兑换的符文精华数量
            },
            {
                item = {3599, 3600, 3601, 3602, 3603, 3604, 3605, 3606}, --7转碎片
                value = 7, --一个道具兑换的符文精华数量
            },
            {
                item = {}, --8转碎片-----------留空
                value = 0, --一个道具兑换的符文精华数量
            },
            {
                item = {3607, 3608, 3609, 3610, 3611, 3612, 3613, 3614}, --9转碎片
                value = 9, --一个道具兑换的符文精华数量
            },
            {
                item = {}, --10转碎片-----------留空
                value = 0, --一个道具兑换的符文精华数量
            },
            {
                item = {3615, 3616, 3617, 3618, 3619, 3620, 3621, 3622}, --11转碎片
                value = 11, --一个道具兑换的符文精华数量
            },
        }
    }
