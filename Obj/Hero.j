<?local slk = require 'slk' ?>
function CreateHero takes nothing returns nothing
	<?
	Hero = {}
function Hero.CreatHeros(h, l)
	-- 英雄技能
	h.heroAbilList = ""
	-- 单位技能
	h.abilList = l.abilList
	-- 单位声音
	h.unitSound = l.unitSound
	-- 称谓
	h.Propernames = l.Propernames
	-- 称谓数量
	h.nameCount = l.nameCount
	-- 单位名字
	h.Name = l.Name
	-- 提示工具  唤醒
	h.Awakentip = l.Awakentip
	-- 提示工具  重生
	h.Revivetip = l.Revivetip
	-- 提示工具  基础
	h.Tip = l.Tip
	-- 提示工具  扩展
	h.Ubertip = l.Ubertip
	-- 热键
	h.Hotkey = l.Hotkey
	--模型
	h.file = l.file
	-- 模型缩放
	h.modelScale = l.modelScale
	--计分屏图标
	h.ScoreScreenIcon = l.ScoreScreenIcon
	--游戏界面图标
	h.Art = l.Art
	-- 死亡时间
	h.death = l.death
	-- 特殊效果
	h.Specialart = l.Specialart
	-- 附加动画
	h.Attachmentanimprops = l.Attachmentanimprops
	-- 动画 魔法施放点
	h.castpt = l.castpt
	-- 动画 魔法施回复
	h.castbsw = l.castbsw
	-- 动画 行走速度
	h.walk = l.walk
	-- 动画 混合时间
	h.blend = l.blend
	-- 动画 跑步速度
	h.run = l.run
	-- 动画 转向角度
	h.propWin = l.propWin
	-- 动画 转向补正
	h.orientInterp = l.orientInterp
	--基础移动速度
	h.spd = l.spd
	-- 转身速度
	h.turnRate = l.turnRate
	-- 装甲类型，只影响被攻击时音效
	h.armor = l.armor
	-- 投射物图像
	h.Missileart = l.Missileart
	-- 弹射速率
	h.Missilespeed = l.Missilespeed
	-- 攻击类型
	h.atkType1 = l.atkType1
	-- 弹射弧度
	h.Missilearc = l.Missilearc
	-- 允许自导
	h.MissileHoming = 1
	-- 武器类型
	h.weapTp1 = l.weapTp1
	-- 允许目标
	h.targs1 = "ground,structure,debris,air,item,ward"
	--武器声音
	h.weapType1 = l.weapType1 
	-- 动画回复点
	h.backSw1 = l.backSw1
	-- 动画伤害点
	h.dmgpt1 = l.dmgpt1
	-- 攻击范围
	h.rangeN1 = l.rangeN1
	--基础伤害
	h.dmgplus1 = l.dmgplus1
	--攻击间隔
	h.cool1 = l.cool1
	-- 种族
	h.race = l.race
	--占用人口
	h.fused = 0
	--最大库存
	h.stockMax = 1
	--修理时间
	h.reptm = 0
	--修理木材消耗
	h.lumberRep = 0
	--修理黄金消耗
	h.goldRep = 0
	--建造时间
	h.bldtm = 0
	--木材消耗
	h.lumbercost = 0
	--黄金消耗
	h.goldcost = 0
	-- 小地图隐藏
	h.hideHeroMinimap = 0
	-- 开始雇佣事件
	h.stockStart = 0
	--初始属性
	h.STR = l.STR
	h.AGI = l.AGI
	h.INT = l.INT
	--每级提升属性
	h.STRplus = l.STRplus
	h.AGIplus = l.AGIplus
	h.INTplus = l.INTplus
	--魔法最大值
	h.manaN = l.manaN
	--魔法回复
	h.regenMana = l.regenMana
	--初始魔法值
	h.mana0 = l.mana0
	--最大生命值
	h.HP = l.HP
	--生命回复
	h.regenHP = l.regenHP
	--主属性
	h.Primary = l.Primary
	end
	?>
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
	<?
	-- 士官长
	Hero["士官长数据"] ={
	-- 英雄技能
	heroAbilList = "",
	-- 单位技能
	abilList = "",
	-- 单位声音
	unitSound = "HighElfSwordsman",
	-- 称谓
	Propernames = "",
	-- 称谓数量
	nameCount = 1,
	-- 单位名字
	Name = "银色护卫者",
	-- 提示工具  唤醒
	Awakentip = "银色护卫者",
	-- 提示工具  重生
	Revivetip = "银色护卫者",
	-- 提示工具  基础
	Tip = "银色护卫者",
	-- 提示工具  扩展
	Ubertip = "一个落魄贵族的儿子，在父亲死后就继承了自己的贵族头衔并且外出闯荡。年轻的时候自己曾经组织过一个佣兵团，但是因为一次意外被全灭。后来哈格姆侥幸逃脱但是脸上留下了伤疤，目前正在和其他幸存的战友一起重建自己的佣兵团",
	-- 热键
	Hotkey = "L",
	--模型
	file = "units\\human\\TheCaptain\\TheCaptain",
	-- 模型缩放
	modelScale = 1,
	--计分屏图标
	ScoreScreenIcon = "ReplaceableTextures\\CommandButtons\\BTNTheCaptain.blp",
	--游戏界面图标
	Art = "ReplaceableTextures\\CommandButtons\\BTNTheCaptain.blp",
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
	orientInterp = 5,
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
	Hero["士官长"]= slk.unit.Hmkg:new 'RzSG'
	Hero.CreatHeros(Hero["士官长"], Hero["士官长数据"])
	?>
endfunction