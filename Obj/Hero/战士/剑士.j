<?
	-- 剑士
	Hero["剑士数据"] ={
	-- 英雄技能
	heroAbilList = "",
	-- 单位技能
	abilList = "",
	-- 单位声音
	unitSound = "Footman",
	-- 称谓
	Propernames = "",
	-- 称谓数量
	nameCount = 1,
	-- 单位名字
	Name = "剑士",
	-- 提示工具  唤醒
	Awakentip = "剑士",
	-- 提示工具  重生
	Revivetip = "剑士",
	-- 提示工具  基础
	Tip = "剑士",
	-- 提示工具  扩展
	Ubertip = "生活在厄鲁亚克斯某个小部落的山民青年，出身于一个猎户家庭。刚健有力，自幼就练习剑术，小有所成。由于得知阿尔金的军队已经到达此处，所向披靡，于是前去加入他的军队，希望能够建立功业。",
	-- 热键
	Hotkey = "L",
	--模型
	file = "units\\human\\Footman\\Footman",
	-- 模型缩放
	modelScale = 1,
	--计分屏图标
	ScoreScreenIcon = "ReplaceableTextures\\CommandButtons\\BTNFootman.blp",
	--游戏界面图标
	Art = "ReplaceableTextures\\CommandButtons\\BTNFootman.blp",
	-- 死亡时间
	death = 3.04,
	-- 特殊效果
	Specialart = "Objects\\Spawnmodels\\Human\\HumanLargeDeathExplode\\HumanLargeDeathExplode.mdl",
	-- 附加动画
	Attachmentanimprops = "",
	-- 动画 魔法施放点
	castpt = 0.3,
	-- 动画 魔法施回复
	castbsw = 0.51,
	-- 动画 行走速度
	walk = 210,
	-- 动画 混合时间
	blend = 0.15,
	-- 动画 跑步速度
	run = 210,
	-- 动画 转向角度
	propWin = 60,
	-- 动画 转向补正
	orientInterp = 0,
	--基础移动速度
	spd = 270,
	-- 转身速度
	turnRate = 0.6,
	-- 装甲类型，只影响被攻击时音效
	armor = "Metal",
	-- 投射物图像
	Missileart = "",
	-- 弹射速率
	Missilespeed = 0,
	-- 攻击类型
	atkType1 = "hero",
	-- 弹射弧度
	Missilearc = 0,
	-- 允许自导
	MissileHoming = 1,
	-- 武器类型
	weapTp1 = "missile",
	-- 允许目标
	targs1 = "ground,structure,debris,air,item,ward",
	--武器声音
	weapType1 = "MetalMediumSlice",
	-- 动画回复点
	backSw1 = 0.5,
	-- 动画伤害点
	dmgpt1 = 0.5,
	-- 攻击范围
	rangeN1 = 128,
	--基础伤害
	dmgplus1 = 6,
	--攻击间隔
	cool1 = 1.35,
	-- 种族
	race = "human",
	--占用人口
	fused = 0,
	--最大库存
	stockMax = 1,
	--修理时间
	reptm = 0,
	--修理木材消耗
	lumberRep = 0,
	--修理黄金消耗
	goldRep = 0,
	--建造时间
	bldtm = 0,
	--木材消耗
	lumbercost = 0,
	--黄金消耗
	goldcost = 0,
	-- 小地图隐藏
	hideHeroMinimap = 0,
	-- 开始雇佣事件
	stockStart = 0,
	--初始属性
	STR = 5,
	AGI = 3,
	INT = 1,
	--每级提升属性
	STRplus = 2.3,
	AGIplus = 1.6,
	INTplus = 0.5,
	--魔法最大值
	manaN = 0,
	--魔法回复
	regenMana = 0,
	--初始魔法值
	mana0 = 0,
	--最大生命值
	HP = 320,
	--生命回复
	regenHP = 0.5,
	--主属性
	Primary = "STR"
	}
	Hero["剑士"]= slk.unit.Hmkg:new 'RzZh'
	Hero.CreatHeros(Hero["剑士"], Hero["剑士数据"])
	?>