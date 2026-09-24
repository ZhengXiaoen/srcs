--圣装合成
LightEquipCfg =
{
	--------------------------------------------------------------------------《武器类》
	{
		equipIds = {735}, --霸者之刃
		consume = {{type=0,count=120,id=722},--金丝
		           {type=0,count=120,id=724}},--陨铁
		rate = 6000, --成功概率60%
		protect = {{type = 0, count = 5, id = 720},},--x幸运符
		awardIds = {1217}, --圣·霸者之刃
	},
	{
		equipIds = {736}, --王者霸者之刃
		consume = {{type=0,count=240,id=722},--金丝
		           {type=0,count=240,id=724}},--陨铁
		rate = 5000, --成功概率60%
		protect = {{type = 0, count = 8, id = 720},},--x幸运符
		awardIds = {1218}, --圣·王者霸者之刃
	},
	{
		equipIds = {737}, --主宰霸者之刃
		consume = {{type=0,count=480,id=722},--金丝
		           {type=0,count=480,id=724}},--陨铁
		rate = 4000, --成功概率60%
		protect = {{type = 0, count = 12, id = 720},},--x幸运符
		awardIds = {1219}, --圣·主宰霸者之刃
	},
	{
		equipIds = {738}, --至尊霸者之刃
		consume = {{type=0,count=960,id=722},--金丝
		           {type=0,count=960,id=724}},--陨铁
		rate = 3000, --成功概率60%
		protect = {{type = 0, count = 18, id = 720},},--x幸运符
		awardIds = {1220}, --圣·至尊霸者之刃
	},
	
	
----------------------------------------------------------------------------------《衣服类》
	{
		equipIds = {760,761}, --霸者神甲
		consume = {{type=0,count=100,id=722},--金丝
		           {type=0,count=100,id=724}},--陨铁
		rate = 6000, --成功概率60
		protect = {{type = 0, count = 5, id = 720},},
		awardIds = {1221,1222}, --圣·霸者神甲
	},
	{
		equipIds = {762,763}, --王者霸者神甲
		consume = {{type=0,count=200,id=722},--金丝
		           {type=0,count=200,id=724}},--陨铁
		rate = 5000, --成功概率60
		protect = {{type = 0, count = 8, id = 720},},
		awardIds = {1223,1224}, --圣·王者霸者神甲
	},
	{
		equipIds = {764,765}, --主宰霸者神甲
		consume = {{type=0,count=400,id=722},--金丝
		           {type=0,count=400,id=724}},--陨铁
		rate = 4000, --成功概率60
		protect = {{type = 0, count = 12, id = 720},},
		awardIds = {1225,1226}, --圣·主宰霸者神甲
	},
	{
		equipIds = {766,767}, --至尊霸者神甲
		consume = {{type=0,count=800,id=722},--金丝
		           {type=0,count=800,id=724}},--陨铁
		rate = 3000, --成功概率60
		protect = {{type = 0, count = 18, id = 720},},
		awardIds = {1227,1228}, --圣·至尊霸者神甲
	},
	

--------------------------------------------------------------------------《首饰类》
	---------1级霸者四件套
	{
		equipIds = {653,654,655,656}, --1级
		consume = {{type=0,count=50,id=722},--金丝
		           {type=0,count=50,id=724}},--陨铁
		rate = 6000, --成功概率60
		protect = {{type = 0, count = 4, id = 720},},
		awardIds = {1229,1230,1231,1232}, --1级圣
	},
	---------2级霸者四件套
	{
		equipIds = {657,658,659,660}, --2级
		consume = {{type=0,count=100,id=722},--金丝
		           {type=0,count=100,id=724}},--陨铁
		rate = 5000, --成功概率60
		protect = {{type = 0, count = 6, id = 720},},
		awardIds = {1233,1234,1235,1236}, --2级圣
	},
	---------3级霸者四件套
	{
		equipIds = {661,662,663,664}, --3级
		consume = {{type=0,count=200,id=722},--金丝
		           {type=0,count=200,id=724}},--陨铁
		rate = 4000, --成功概率60
		protect = {{type = 0, count = 8, id = 720},},
		awardIds = {1237,1238,1239,1240}, --3级圣
	},
	---------4级霸者四件套
	{
		equipIds = {665,666,667,668}, --4级
		consume = {{type=0,count=400,id=722},--金丝
		           {type=0,count=400,id=724}},--陨铁
		rate = 3000, --成功概率60
		protect = {{type = 0, count = 10, id = 720},},
		awardIds = {1241,1242,1243,1244}, --4级圣
	},
	---------5级霸者四件套
	{
		equipIds = {669,670,671,672}, --5级
		consume = {{type=0,count=800,id=722},--金丝
		           {type=0,count=800,id=724}},--陨铁
		rate = 2000, --成功概率60
		protect = {{type = 0, count = 12, id = 720},},
		awardIds = {1245,1246,1247,1248}, --5级圣
	},


}

------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
-- --神装拆解
-----------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
ResolvingLightEquipCfg = 
{
	
	-----------------------------------------------------------武器类
	
	{
		equipIds = {1217}, 
		material = {{type=0,count=120,id=722,bind=0},
		            {type=0,count=120,id=724,bind=0}},
		awardIds = {735}, 
	},
	{
		equipIds = {1218}, 
		material = {{type=0,count=240,id=722,bind=0},
		            {type=0,count=240,id=724,bind=0}},
		awardIds = {736}, 
	},
	{
		equipIds = {1219}, 
		material = {{type=0,count=480,id=722,bind=0},
		            {type=0,count=480,id=724,bind=0}},
		awardIds = {737}, 
	},
	{
		equipIds = {1220}, 
		material = {{type=0,count=960,id=722,bind=0},
		            {type=0,count=960,id=724,bind=0}},
		awardIds = {738}, 
	},
	
	--------------------------------------------------------------衣服类
	{
		equipIds = {1221,1222}, 
		material = {{type=0,count=100,id=722,bind=0},
		            {type=0,count=100,id=724,bind=0}},
		awardIds = {760,761}, 
	},
	{
		equipIds = {1223,1224}, 
		material = {{type=0,count=200,id=722,bind=0},
		            {type=0,count=200,id=724,bind=0}},
		awardIds = {762,763}, 
	},
	{
		equipIds = {1225,1226}, 
		material = {{type=0,count=400,id=722,bind=0},
		            {type=0,count=400,id=724,bind=0}},
		awardIds = {764,765}, 
	},
	{
		equipIds = {1227,1228}, 
		material = {{type=0,count=800,id=722,bind=0},
		            {type=0,count=800,id=724,bind=0}},
		awardIds = {766,767}, 
	},
	

	--------------------------------------------------------------首饰类
	{
		equipIds = {1229,1230,1231,1232},
		material = {{type=0,count=50,id=722,bind=0},
		            {type=0,count=50,id=724,bind=0}},
		awardIds = {653,654,655,656},
	},
	{
		equipIds = {1233,1234,1235,1236},
		material = {{type=0,count=100,id=722,bind=0},
		            {type=0,count=100,id=724,bind=0}},
		awardIds = {657,658,659,660},
	},
	{
		equipIds = {1237,1238,1239,1240},
		material = {{type=0,count=200,id=722,bind=0},
		            {type=0,count=200,id=724,bind=0}},
		awardIds = {661,662,663,664},
	},
	{
		equipIds = {1241,1242,1243,1244},
		material = {{type=0,count=400,id=722,bind=0},
		            {type=0,count=400,id=724,bind=0}},
		awardIds = {665,666,667,668},
	},
	{
		equipIds = {1245,1246,1247,1248},
		material = {{type=0,count=800,id=722,bind=0},
		            {type=0,count=800,id=724,bind=0}},
		awardIds = {669,670,671,672},
	},
	
}
