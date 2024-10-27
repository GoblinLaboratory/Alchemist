<?
-- 游荡者
Hero["游荡者数据"] ={
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
Name = "游荡者",
-- 提示工具  唤醒
Awakentip = "游荡者",
-- 提示工具  重生
Revivetip = "游荡者",
-- 提示工具  基础
Tip = "游荡者",
-- 提示工具  扩展
Ubertip = "黑森堡背靠一片庞大的黑森林，这里的土质不好，农作物产量不高，相比农民，人民更多的从事一些猎户的工作，因此极端尚武，很多人贩卖毛皮和野味为生，与此同时，杰克的爷爷发现把当地人组织起来建立雇佣兵比单纯的毛皮生意赚钱的多，于是建立了有名的黑森佣兵团，包括优质弓箭手和不错的长枪兵，佣兵生意和人民五五分成，获得了不少的收入，也靠贩卖武德和鲜血获得了一支久经考验的精锐部队，当地盛产一种叫紫衫的名贵木材，可以用来生产一种远超普通弓的优质长弓，很多农民甚至愿意把自己家产卖掉换这么一把弓来加入佣兵团搏一搏前程",
-- 热键
Hotkey = "L",
--模型
--file = "units\\human\\TheCaptain\\TheCaptain",
file = "war3mapImported\\VrykulWarriorV5Optimized.mdl",
-- 模型缩放
modelScale = 0.8,
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
Hero["游荡者"]= slk.unit.Hmkg:new 'RzYD'
Hero.CreatHeros(Hero["游荡者"], Hero["游荡者数据"])
?>