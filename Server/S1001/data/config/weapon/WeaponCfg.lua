
-- 里面的文本，请写在语言包里
WeaponCfg = {
	Title = "天兵神器";
	-- 六大神戒
	[1] = {
		Title = "六大神戒";
		{
			Item = 1;
			-- tags
			[1] = {
				Title = "神戒能力";
				Left = {
					Title = "吖吖";
					Tips = "出来";
				};
				Right = {
					Title = "";
					Tips = "";
				}
			};
			[2] = {
				Title = "获得途径";
				BOSS = {
					{
						monster = 2;
						tips = "88888888"; -- 这里有一些东西要读取生成
					};
					{
						monster = 2;
						tips = "88888888";
					};
					-- ...
				};
				Other = { 
					{
						Up = {
							Title = "VIP10独享";
							Tips = "达到VIP10直接领取"
						};
						Down = {
							Title = "盗梦空间";
							Tips = "达到VIP10直接领取"
						};
					};
					-- ...
				}
			}
		};
		-- ... 其余5个
	};
	-- 八大勋章
	[2] = {
		Title = "八大勋章";
		{						
			Item = 1;
			-- tags
			[1] = {
				Title = "勋章能力";
				{
					{
						Left = {
							Title = "";
							Tips = "";
						}
						Right = {
							Title = "";
							Tips = "";
						}						
					};
					-- ... 
				}
			};
			[2] = {
				Title = "获得途径";
				{
					{
						Logo = ""; -- 是路径还是什么，待定
						Up = {
							Title = "VIP10独享";
							Tips = "达到VIP10直接领取"
						};
						Middle = {
							Title = "VIP10独享";
							Tips = "达到VIP10直接领取"
						};
						Down = {
							Title = "盗梦空间";
							Tips = "达到VIP10直接领取"
						};						
					};
					-- ...
				}
			}
		};
		-- ... 其余7个
	};
	-- 史诗神器
	[3] = {
		Title = "史诗神器";
		{
			{
				Title = "战士";
				{
					{
						Item = 1;
						NeedItem = {1,2,3,4}; -- 需要材料
						Rate = 100; -- 合成成功率
						NeedCoin = 8888; -- 需要金币
						-- 已合成
					};
					-- ...
				}
			};
			{
				Title = "法师";
				{
					{
						Item = 1;
						NeedItem = {1,2,3,4}; -- 需要材料
						Rate = 100; -- 合成成功率
						NeedCoin = 8888; -- 需要金币
						-- 已合成
					};
					-- ...
				}
			};
			{
				Title = "道士";
				{
					{
						Item = 1;
						NeedItem = {1,2,3,4};
						Rate = 100; -- 合成成功率
						NeedCoin = 8888; -- 需要金币
						-- 已合成
					};
					-- ...
				}
			};
		}
	};	
}