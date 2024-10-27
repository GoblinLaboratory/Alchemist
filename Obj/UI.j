<?local slk = require 'slk' ?>

//创建装备栏背景
function CreatZb1 takes nothing returns nothing
	//创建主手武器  1
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANcl:new("ZBA"..i)
	?>
	<?
	obj.Name = string.format("主手武器(|cffffcc00Z|r)[%03d]", i)
	obj.levels = 1
	obj.item = 0
	obj.Tip = "主手武器"
	obj.Ubertip = "未装备主手武器[点击主手武器类装备能进行装备]"
	obj.DataD1 = 0.00
	obj.DataB1 = 0
	obj.DataE1 = 0
	obj.DataC1 = 1
	obj.DataA1 = 0.00
	obj.DataF1 = "phoenixfire"
	obj.race = "orc"
	obj.hero = 0
	obj.Rng1 = 0.00
	obj.Requires = "R000"
	obj.Art = "ReplaceableTextures\\CommandButtons\\BTNArcaniteMelee.blp"
	obj.EffectArt = ""
	obj.TargetArt = ""
	obj.CasterArt = ""
	?>   
	<?
	end
	?>
	//
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANcl:new("ZWA"..i)
	?>
	<?
	obj.Name = string.format("主手武器(卸下)(|cffffcc00Z|r)[%03d]", i)
	obj.levels = 1
	obj.item = 0
	obj.Tip = "主手武器"
	obj.Ubertip = "主手武器"
	obj.DataD1 = 0.00
	obj.DataB1 = 0
	obj.DataE1 = 0
	obj.DataC1 = 1
	obj.DataA1 = 0.00
	obj.DataF1 = "phoenixfire"
	obj.race = "orc"
	obj.hero = 0
	obj.Rng1 = 0.00
	obj.Art = "ReplaceableTextures\\CommandButtons\\BTNArcaniteMelee.blp"
	obj.EffectArt = ""
	obj.TargetArt = ""
	obj.CasterArt = ""
	?>   
	<?
	end
	?>
	
	//副手装备  2 
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANcl:new("ZBB"..i)
	?>
	<?
	obj.Name = string.format("副手武器[%03d]", i)
	obj.levels = 1
	obj.item = 0
	obj.Tip = "副手武器"
	obj.Ubertip = "未装备副手武器[点击副手武器类装备能进行装备]"
	obj.DataD1 = 0.00
	obj.DataB1 = 0
	obj.DataE1 = 0
	obj.DataC1 = 1
	obj.DataA1 = 0.00
	obj.DataF1 = "parasite"
	obj.race = "orc"
	obj.hero = 0
	obj.Rng1 = 0.00
	obj.Requires = "R000"
	obj.Art = "ReplaceableTextures\\CommandButtons\\BTNGrimWard.blp"
	obj.EffectArt = ""
	obj.TargetArt = ""
	obj.CasterArt = ""
	?>   
	<?
	end
	?>
	
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANcl:new("ZWB"..i)
	?>
	<?
	obj.Name = string.format("副手武器(卸下)[%03d]", i)
	obj.levels = 1
	obj.item = 0
	obj.Tip = "副手武器"
	obj.Ubertip = "副手武器"
	obj.DataD1 = 0.00
	obj.DataB1 = 0
	obj.DataE1 = 0
	obj.DataC1 = 1
	obj.DataA1 = 0.00
	obj.DataF1 = "parasite"
	obj.race = "orc"
	obj.hero = 0
	obj.Rng1 = 0.00
	obj.Art = "ReplaceableTextures\\CommandButtons\\BTNGrimWard.blp"
	obj.EffectArt = ""
	obj.TargetArt = ""
	obj.CasterArt = ""
	?>   
	<?
	end
	?>
	
	//头盔   3
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANcl:new("ZBC"..i)
	?>
	<?
	obj.Name = string.format("头部装备[%03d]", i)
	obj.levels = 1
	obj.item = 0
	obj.Tip = "头部装备"
	obj.Ubertip = "未装备头部装备[点击头部装备进行装备]"
	obj.DataD1 = 0.00
	obj.DataB1 = 0
	obj.DataE1 = 0
	obj.DataC1 = 1
	obj.DataA1 = 0.00
	obj.DataF1 = "parasiteoff"
	obj.race = "orc"
	obj.hero = 0
	obj.Rng1 = 0.00
	obj.Requires = "R000"
	obj.Art = "ReplaceableTextures\\CommandButtons\\BTNUnholyAura.blp"
	obj.EffectArt = ""
	obj.TargetArt = ""
	obj.CasterArt = ""
	?>   
	<?
	end
	?>
	
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANcl:new("ZWC"..i)
	?>
	<?
	obj.Name = string.format("头部装备(卸下)[%03d]", i)
	obj.levels = 1
	obj.item = 0
	obj.Tip = "头部装备"
	obj.Ubertip = "头部装备"
	obj.DataD1 = 0.00
	obj.DataB1 = 0
	obj.DataE1 = 0
	obj.DataC1 = 1
	obj.DataA1 = 0.00
	obj.DataF1 = "parasiteoff"
	obj.race = "orc"
	obj.hero = 0
	obj.Rng1 = 0.00
	obj.Art = "ReplaceableTextures\\CommandButtons\\BTNUnholyAura.blp"
	obj.EffectArt = ""
	obj.TargetArt = ""
	obj.CasterArt = ""
	?>   
	<?
	end
	?>
	//铠甲   4
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANcl:new("ZBD"..i)
	?>
	<?
	obj.Name = string.format("胸部装备[%03d]", i)
	obj.levels = 1
	obj.item = 0
	obj.Tip = "胸部装备"
	obj.Ubertip = "未装备胸部装备[点击胸部装备进行装备]"
	obj.DataD1 = 0.00
	obj.DataB1 = 0
	obj.DataE1 = 0
	obj.DataC1 = 1
	obj.DataA1 = 0.00
	obj.DataF1 = "parasiteon"
	obj.race = "orc"
	obj.hero = 0
	obj.Rng1 = 0.00
	obj.Requires = "R000"
	obj.Art = "ReplaceableTextures\\CommandButtons\\BTNAdvancedMoonArmor.blp"
	obj.EffectArt = ""
	obj.TargetArt = ""
	obj.CasterArt = ""
	?>   
	<?
	end
	?>
	
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANcl:new("ZWD"..i)
	?>
	<?
	obj.Name = string.format("胸部装备(卸下)[%03d]", i)
	obj.levels = 1
	obj.item = 0
	obj.Tip = "胸部装备"
	obj.Ubertip = "胸部装备"
	obj.DataD1 = 0.00
	obj.DataB1 = 0
	obj.DataE1 = 0
	obj.DataC1 = 1
	obj.DataA1 = 0.00
	obj.DataF1 = "parasiteon"
	obj.race = "orc"
	obj.hero = 0
	obj.Rng1 = 0.00
	obj.Art = "ReplaceableTextures\\CommandButtons\\BTNAdvancedMoonArmor.blp"
	obj.EffectArt = ""
	obj.TargetArt = ""
	obj.CasterArt = ""
	?>   
	<?
	end
	?>
	//披风  5
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANcl:new("ZBE"..i)
	?>
	<?
	obj.Name = string.format("腰部装备[%03d]", i)
	obj.levels = 1
	obj.item = 0
	obj.Tip = "腰部装备"
	obj.Ubertip = "未装备腰部装备[点击腰部装备能进行装备]"
	obj.DataD1 = 0.00
	obj.DataB1 = 0
	obj.DataE1 = 0
	obj.DataC1 = 1
	obj.DataA1 = 0.00
	obj.DataF1 = "polymorph"
	obj.race = "orc"
	obj.hero = 0
	obj.Rng1 = 0.00
	obj.Requires = "R000"
	obj.Art = "ReplaceableTextures\\CommandButtons\\BTNRunedBracers.blp"
	obj.EffectArt = ""
	obj.TargetArt = ""
	obj.CasterArt = ""
	?>   
	<?
	end
	?>
	
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANcl:new("ZWE"..i)
	?>
	<?
	obj.Name = string.format("腰部装备(卸下)[%03d]", i)
	obj.levels = 1
	obj.item = 0
	obj.Tip = "腰部装备"
	obj.Ubertip = "腰部装备"
	obj.DataD1 = 0.00
	obj.DataB1 = 0
	obj.DataE1 = 0
	obj.DataC1 = 1
	obj.DataA1 = 0.00
	obj.DataF1 = "polymorph"
	obj.race = "orc"
	obj.hero = 0
	obj.Rng1 = 0.00
	obj.Art = "ReplaceableTextures\\CommandButtons\\BTNRunedBracers.blp"
	obj.EffectArt = ""
	obj.TargetArt = ""
	obj.CasterArt = ""
	?>   
	<?
	end
	?>
	//手套 6
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANcl:new("ZBF"..i)
	?>
	<?
	obj.Name = string.format("腿部装备[%03d]", i)
	obj.levels = 1
	obj.item = 0
	obj.Tip = "腿部装备"
	obj.Ubertip = "未装备腿部装备[点击腿部装备进行装备]"
	obj.DataD1 = 0.00
	obj.DataB1 = 0
	obj.DataE1 = 0
	obj.DataC1 = 1
	obj.DataA1 = 0.00
	obj.DataF1 = "possession"
	obj.race = "orc"
	obj.hero = 0
	obj.Rng1 = 0.00
	obj.Requires = "R000"
	obj.Art = "ReplaceableTextures\\CommandButtons\\BTNPackBeast.blp"
	obj.EffectArt = ""
	obj.TargetArt = ""
	obj.CasterArt = ""
	?>   
	<?
	end
	?>
	
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANcl:new("ZWF"..i)
	?>
	<?
	obj.Name = string.format("腿部装备(卸下)[%03d]", i)
	obj.levels = 1
	obj.item = 0
	obj.Tip = "腿部装备"
	obj.Ubertip = "腿部装备"
	obj.DataD1 = 0.00
	obj.DataB1 = 0
	obj.DataE1 = 0
	obj.DataC1 = 1
	obj.DataA1 = 0.00
	obj.DataF1 = "possession"
	obj.race = "orc"
	obj.hero = 0
	obj.Rng1 = 0.00
	obj.Art = "ReplaceableTextures\\CommandButtons\\BTNPackBeast.blp"
	obj.EffectArt = ""
	obj.TargetArt = ""
	obj.CasterArt = ""
	?>   
	<?
	end
	?>
	//鞋 7
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANcl:new("ZBG"..i)
	?>
	<?
	obj.Name = string.format("手部装备[%03d]", i)
	obj.levels = 1
	obj.item = 0
	obj.Tip = "手部装备"
	obj.Ubertip = "未装备手部装备[点击手部装备进行装备]"
	obj.DataD1 = 0.00
	obj.DataB1 = 0
	obj.DataE1 = 0
	obj.DataC1 = 1
	obj.DataA1 = 0.00
	obj.DataF1 = "preservation"
	obj.race = "orc"
	obj.hero = 0
	obj.Rng1 = 0.00
	obj.Requires = "R000"
	obj.Art = "ReplaceableTextures\\CommandButtons\\BTNGlove.blp"
	obj.EffectArt = ""
	obj.TargetArt = ""
	obj.CasterArt = ""
	?>   
	<?
	end
	?>
	
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANcl:new("ZWG"..i)
	?>
	<?
	obj.Name = string.format("手部装备(卸下)[%03d]", i)
	obj.levels = 1
	obj.item = 0
	obj.Tip = "手部装备"
	obj.Ubertip = "手部装备"
	obj.DataD1 = 0.00
	obj.DataB1 = 0
	obj.DataE1 = 0
	obj.DataC1 = 1
	obj.DataA1 = 0.00
	obj.DataF1 = "preservation"
	obj.race = "orc"
	obj.hero = 0
	obj.Rng1 = 0.00
	obj.Art = "ReplaceableTextures\\CommandButtons\\BTNGlove.blp"
	obj.EffectArt = ""
	obj.TargetArt = ""
	obj.CasterArt = ""
	?>   
	<?
	end
	?>
	
	//面具  8
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANcl:new("ZBH"..i)
	?>
	<?
	obj.Name = string.format("脚部装备[%03d]", i)
	obj.levels = 1
	obj.item = 0
	obj.Tip = "脚部装备"
	obj.Ubertip = "未装备脚部装备[点击脚部装备进行装备]"
	obj.DataD1 = 0.00
	obj.DataB1 = 0
	obj.DataE1 = 0
	obj.DataC1 = 1
	obj.DataA1 = 0.00
	obj.DataF1 = "purge"
	obj.race = "orc"
	obj.hero = 0
	obj.Rng1 = 0.00
	obj.Requires = "R000"
	obj.Art = "ReplaceableTextures\\CommandButtons\\BTNBootsOfSpeed.blp"
	obj.EffectArt = ""
	obj.TargetArt = ""
	obj.CasterArt = ""
	?>   
	<?
	end
	?>
	
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANcl:new("ZWH"..i)
	?>
	<?
	obj.Name = string.format("脚部装备(卸下)[%03d]", i)
	obj.levels = 1
	obj.item = 0
	obj.Tip = "脚部装备"
	obj.Ubertip = "脚部装备"
	obj.DataD1 = 0.00
	obj.DataB1 = 0
	obj.DataE1 = 0
	obj.DataC1 = 1
	obj.DataA1 = 0.00
	obj.DataF1 = "purge"
	obj.race = "orc"
	obj.hero = 0
	obj.Rng1 = 0.00
	obj.Art = "ReplaceableTextures\\CommandButtons\\BTNBootsOfSpeed.blp"
	obj.EffectArt = ""
	obj.TargetArt = ""
	obj.CasterArt = ""
	?>   
	<?
	end
	?>
	//项链  9
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANcl:new("ZBI"..i)
	?>
	<?
	obj.Name = string.format("项链[%03d]", i)
	obj.levels = 1
	obj.item = 0
	obj.Tip = "项链"
	obj.Ubertip = "未装备项链[点击项链类装备能进行装备]"
	obj.DataD1 = 0.00
	obj.DataB1 = 0
	obj.DataE1 = 0
	obj.DataC1 = 1
	obj.DataA1 = 0.00
	obj.DataF1 = "rainofchaos"
	obj.race = "orc"
	obj.hero = 0
	obj.Rng1 = 0.00
	obj.Requires = "R000"
	obj.Art = "ReplaceableTextures\\CommandButtons\\BTNPendantOfMana.blp"
	obj.EffectArt = ""
	obj.TargetArt = ""
	obj.CasterArt = ""
	?>   
	<?
	end
	?>
	
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANcl:new("ZWI"..i)
	?>
	<?
	obj.Name = string.format("项链(卸下)[%03d]", i)
	obj.levels = 1
	obj.item = 0
	obj.Tip = "项链"
	obj.Ubertip = "项链"
	obj.DataD1 = 0.00
	obj.DataB1 = 0
	obj.DataE1 = 0
	obj.DataC1 = 1
	obj.DataA1 = 0.00
	obj.DataF1 = "rainofchaos"
	obj.race = "orc"
	obj.hero = 0
	obj.Rng1 = 0.00
	obj.Art = "ReplaceableTextures\\CommandButtons\\BTNPendantOfMana.blp"
	obj.EffectArt = ""
	obj.TargetArt = ""
	obj.CasterArt = ""
	?>   
	<?
	end
	?>
	//饰品  10
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANcl:new("ZBJ"..i)
	?>
	<?
	obj.Name = string.format("戒指[%03d]", i)
	obj.levels = 1
	obj.item = 0
	obj.Tip = "戒指"
	obj.Ubertip = "未装备戒指[点击戒指进行装备]"
	obj.DataD1 = 0.00
	obj.DataB1 = 0
	obj.DataE1 = 0
	obj.DataC1 = 1
	obj.DataA1 = 0.00
	obj.DataF1 = "rainoffire"
	obj.race = "orc"
	obj.hero = 0
	obj.Rng1 = 0.00
	obj.Requires = "R000"
	obj.Art = "ReplaceableTextures\\CommandButtons\\BTNRingGreen.blp"
	obj.EffectArt = ""
	obj.TargetArt = ""
	obj.CasterArt = ""
	?>   
	<?
	end
	?>
	
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANcl:new("ZWJ"..i)
	?>
	<?
	obj.Name = string.format("戒指(卸下)[%03d]", i)
	obj.levels = 1
	obj.item = 0
	obj.Tip = "戒指"
	obj.Ubertip = "戒指"
	obj.DataD1 = 0.00
	obj.DataB1 = 0
	obj.DataE1 = 0
	obj.DataC1 = 1
	obj.DataA1 = 0.00
	obj.DataF1 = "rainoffire"
	obj.race = "orc"
	obj.hero = 0
	obj.Rng1 = 0.00
	obj.Art = "ReplaceableTextures\\CommandButtons\\BTNRingGreen.blp"
	obj.EffectArt = ""
	obj.TargetArt = ""
	obj.CasterArt = ""
	?>   
	<?
	end
	?>
	//戒指  11
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANcl:new("ZBK"..i)
	?>
	<?
	obj.Name = string.format("披风[%03d]", i)
	obj.levels = 1
	obj.item = 0
	obj.Tip = "披风"
	obj.Ubertip = "未装备披风[点击披风进行装备]"
	obj.DataD1 = 0.00
	obj.DataB1 = 0
	obj.DataE1 = 0
	obj.DataC1 = 1
	obj.DataA1 = 0.00
	obj.DataF1 = "raisedead"
	obj.race = "orc"
	obj.hero = 0
	obj.Rng1 = 0.00
	obj.Requires = "R000"
	obj.Art = "ReplaceableTextures\\CommandButtons\\BTNRobeOfTheMagi.blp"
	obj.EffectArt = ""
	obj.TargetArt = ""
	obj.CasterArt = ""
	?>   
	<?
	end
	?>
	
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANcl:new("ZWK"..i)
	?>
	<?
	obj.Name = string.format("披风(卸下)[%03d]", i)
	obj.levels = 1
	obj.item = 0
	obj.Tip = "披风"
	obj.Ubertip = "披风"
	obj.DataD1 = 0.00
	obj.DataB1 = 0
	obj.DataE1 = 0
	obj.DataC1 = 1
	obj.DataA1 = 0.00
	obj.DataF1 = "raisedead"
	obj.race = "orc"
	obj.hero = 0
	obj.Rng1 = 0.00
	obj.Art = "ReplaceableTextures\\CommandButtons\\BTNRobeOfTheMagi.blp"
	obj.EffectArt = ""
	obj.TargetArt = ""
	obj.CasterArt = ""
	?>   
	<?
	end
	?>
endfunction


//创建工程升级
function CreatGC takes nothing returns nothing
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANeg:new("ZGA"..i)
	?>
	<?
	obj.Name = string.format("主手武器 工程升级)[%03d]", i)
	obj.DataA1 = 0.00
	obj.levels = 1
	obj.item = 0
	obj.hero = 0
	obj.DataB1 = 0.00
	obj.DataC1 = "ZBA"..i..",".."ZWA"..i
	obj.DataD1 = ""
	obj.DataE1 = ""
	obj.DataF1 = ""
	obj.race = "orc"
	?>   
	<?
	end
	?>
	
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANeg:new("ZGB"..i)
	?>
	<?
	obj.Name = string.format("副手武器 工程升级)[%03d]", i)
	obj.DataA1 = 0.00
	obj.levels = 1
	obj.item = 0
	obj.hero = 0
	obj.DataB1 = 0.00
	obj.DataC1 = "ZBB"..i..",".."ZWB"..i
	obj.DataD1 = ""
	obj.DataE1 = ""
	obj.DataF1 = ""
	obj.race = "orc"
	?>   
	<?
	end
	?>
	/////头盔
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANeg:new("ZGC"..i)
	?>
	<?
	obj.Name = string.format("头盔 工程升级)[%03d]", i)
	obj.DataA1 = 0.00
	obj.levels = 1
	obj.item = 0
	obj.hero = 0
	obj.DataB1 = 0.00
	obj.DataC1 = "ZBC"..i..",".."ZWC"..i
	obj.DataD1 = ""
	obj.DataE1 = ""
	obj.DataF1 = ""
	obj.race = "orc"
	?>   
	<?
	end
	?>
	/////铠甲
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANeg:new("ZGD"..i)
	?>
	<?
	obj.Name = string.format("胸部装备 工程升级)[%03d]", i)
	obj.DataA1 = 0.00
	obj.levels = 1
	obj.item = 0
	obj.hero = 0
	obj.DataB1 = 0.00
	obj.DataC1 = "ZBD"..i..",".."ZWD"..i
	obj.DataD1 = ""
	obj.DataE1 = ""
	obj.DataF1 = ""
	obj.race = "orc"
	?>   
	<?
	end
	?>
	/////披风
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANeg:new("ZGE"..i)
	?>
	<?
	obj.Name = string.format("腰部装备 工程升级)[%03d]", i)
	obj.DataA1 = 0.00
	obj.levels = 1
	obj.item = 0
	obj.hero = 0
	obj.DataB1 = 0.00
	obj.DataC1 = "ZBE"..i..",".."ZWE"..i
	obj.DataD1 = ""
	obj.DataE1 = ""
	obj.DataF1 = ""
	obj.race = "orc"
	?>   
	<?
	end
	?>
	/////手套
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANeg:new("ZGF"..i)
	?>
	<?
	obj.Name = string.format("腿部装备 工程升级)[%03d]", i)
	obj.DataA1 = 0.00
	obj.levels = 1
	obj.item = 0
	obj.hero = 0
	obj.DataB1 = 0.00
	obj.DataC1 = "ZBF"..i..",".."ZWF"..i
	obj.DataD1 = ""
	obj.DataE1 = ""
	obj.DataF1 = ""
	obj.race = "orc"
	?>   
	<?
	end
	?>
	/////鞋
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANeg:new("ZGG"..i)
	?>
	<?
	obj.Name = string.format("手部装备 工程升级)[%03d]", i)
	obj.DataA1 = 0.00
	obj.levels = 1
	obj.item = 0
	obj.hero = 0
	obj.DataB1 = 0.00
	obj.DataC1 = "ZBG"..i..",".."ZWG"..i
	obj.DataD1 = ""
	obj.DataE1 = ""
	obj.DataF1 = ""
	obj.race = "orc"
	?>   
	<?
	end
	?>
	/////面具
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANeg:new("ZGH"..i)
	?>
	<?
	obj.Name = string.format("脚部装备 工程升级)[%03d]", i)
	obj.DataA1 = 0.00
	obj.levels = 1
	obj.item = 0
	obj.hero = 0
	obj.DataB1 = 0.00
	obj.DataC1 = "ZBH"..i..",".."ZWH"..i
	obj.DataD1 = ""
	obj.DataE1 = ""
	obj.DataF1 = ""
	obj.race = "orc"
	?>   
	<?
	end
	?>
	/////项链
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANeg:new("ZGI"..i)
	?>
	<?
	obj.Name = string.format("项链 工程升级)[%03d]", i)
	obj.DataA1 = 0.00
	obj.levels = 1
	obj.item = 0
	obj.hero = 0
	obj.DataB1 = 0.00
	obj.DataC1 = "ZBI"..i..",".."ZWI"..i
	obj.DataD1 = ""
	obj.DataE1 = ""
	obj.DataF1 = ""
	obj.race = "orc"
	?>   
	<?
	end
	?>
	/////饰品
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANeg:new("ZGJ"..i)
	?>
	<?
	obj.Name = string.format("戒指 工程升级)[%03d]", i)
	obj.DataA1 = 0.00
	obj.levels = 1
	obj.item = 0
	obj.hero = 0
	obj.DataB1 = 0.00
	obj.DataC1 = "ZBJ"..i..",".."ZWJ"..i
	obj.DataD1 = ""
	obj.DataE1 = ""
	obj.DataF1 = ""
	obj.race = "orc"
	?>   
	<?
	end
	?>
	/////戒指
	<? 
	for i = 0, 9 do
	local obj = slk.ability.ANeg:new("ZGK"..i)
	?>
	<?
	obj.Name = string.format("披风 工程升级)[%03d]", i)
	obj.DataA1 = 0.00
	obj.levels = 1
	obj.item = 0
	obj.hero = 0
	obj.DataB1 = 0.00
	obj.DataC1 = "ZBK"..i..",".."ZWK"..i
	obj.DataD1 = ""
	obj.DataE1 = ""
	obj.DataF1 = ""
	obj.race = "orc"
	?>   
	<?
	end
	?>
endfunction

//创建装备栏
function Test1 takes nothing returns nothing
	//创建装备栏
	<? 
	for i = 0, 9 do
	local obj = slk.ability.Aspb:new("ZBL"..i)
	?>
	<?
	obj.Name = string.format("装备栏(|cffffcc00Z|r)[%03d]", i)
	obj.levels = 1
	obj.item = 0
	obj.DataD1 = 11
	obj.DataC1 = 11
	obj.Tip = "装备栏(|cffffcc00Z|r)"
	obj.Art = "ReplaceableTextures\\CommandButtons\\BTNPackBeast.blp"
	obj.DataE1 = "stampede"
	obj.DataA1 = "ZBA"..i..",".."ZBB"..i..",".."ZBC"..i..",".."ZBD"..i..",".."ZBE"..i..",".."ZBF"..i..",".."ZBG"..i..",".."ZBH"..i..",".."ZBI"..i..",".."ZBJ"..i..",".."ZBK"..i
	?>   
	<?
	end
	?>
	//使用装备技能
	<? local obj1 = slk.ability.ANbr:new 'ZSZB' ?>
	// 以'AHtb'(风暴之锤)为模板，创建一个新的技能对象'A233'。不过你在保存后需要重新打开地图才能看到它。
	// 把这个新的对象记下来，等会儿还要用到它
	<?
	obj1.Name = "使用装备"
	obj1.levels = 1
	obj1.DataA1 = 0.00
	obj1.race = "orc"
	obj1.hero = 0
	obj1.Cool1 = 0.01
	obj1.targs1 = "none"
	obj1.Dur1 = 0.001
	obj1.HeroDur1 = 0.001
	obj1.Cost1 = 0
	obj1.Area1 = 0.00
	obj1.item = 1
	?>
endfunction
//界面
function Chuangjiandanwei takes nothing returns nothing
	<? 
	for i = 0, 9 do
	local objA = slk.ability.ANcl:new("FW"..i.."A")
	local objB = slk.ability.ANcl:new("FW"..i.."B")
	local objC = slk.ability.ANcl:new("FW"..i.."C")
	local objD = slk.ability.ANcl:new("FW"..i.."D")
	local objE = slk.ability.ANcl:new("FW"..i.."E")
	local objF = slk.ability.ANcl:new("FW"..i.."F")
	local objG = slk.ability.ANcl:new("FW"..i.."G")
	local objH = slk.ability.ANcl:new("FW"..i.."H")
	local objI = slk.ability.ANcl:new("FW"..i.."I")
	local objJ = slk.ability.ANcl:new("FW"..i.."J")
	local objK = slk.ability.ANcl:new("FW"..i.."K")
	local objL = slk.ability.ANcl:new("FW"..i.."L")
	?>
	<?
	objA.Name = string.format("符文A[%03d]", i)
	objA.levels = 1
	objA.item = 0
	objA.Tip = "符文"
	objA.Ubertip = "符文"
	objA.DataD1 = 0.00
	objA.DataB1 = 0
	objA.DataE1 = 0
	objA.DataC1 = 1
	objA.DataA1 = 0.00
	objA.Buttonpos_1 = 0
	objA.Buttonpos_2 = 0
	objA.DataF1 = "wispharvest"
	objA.race = "orc"
	objA.hero = 0
	objA.Rng1 = 0.00
	objA.Art = "ReplaceableTextures\\CommandButtons\\BTNEnchantedGemstone.blp"
	objA.EffectArt = ""
	objA.TargetArt = ""
	objA.CasterArt = ""
	
	objB.Name = string.format("符文B[%03d]", i)
	objB.levels = 1
	objB.item = 0
	objB.Tip = "符文"
	objB.Ubertip = "符文"
	objB.DataD1 = 0.00
	objB.DataB1 = 0
	objB.DataE1 = 0
	objB.DataC1 = 1
	objB.DataA1 = 0.00
	objB.Buttonpos_1 = 1
	objB.Buttonpos_2 = 0
	objB.DataF1 = "windwalk"
	objB.race = "orc"
	objB.hero = 0
	objB.Rng1 = 0.00
	objB.Art = "ReplaceableTextures\\CommandButtons\\BTNEnchantedGemstone.blp"
	objB.EffectArt = ""
	objB.TargetArt = ""
	objB.CasterArt = ""
	
	
	
	objC.Name = string.format("符文C[%03d]", i)
	objC.levels = 1
	objC.item = 0
	objC.Tip = "符文"
	objC.Ubertip = "符文"
	objC.DataD1 = 0.00
	objC.DataB1 = 0
	objC.DataE1 = 0
	objC.DataC1 = 1
	objC.DataA1 = 0.00
	objC.Buttonpos_1 = 2
	objC.Buttonpos_2 = 0
	objC.DataF1 = "whirlwind"
	objC.race = "orc"
	objC.hero = 0
	objC.Rng1 = 0.00
	objC.Art = "ReplaceableTextures\\CommandButtons\\BTNEnchantedGemstone.blp"
	objC.EffectArt = ""
	objC.TargetArt = ""
	objC.CasterArt = ""
	
	
	
	objD.Name = string.format("符文D[%03d]", i)
	objD.levels = 1
	objD.item = 0
	objD.Tip = "符文"
	objD.Ubertip = "符文"
	objD.DataD1 = 0.00
	objD.DataB1 = 0
	objD.DataE1 = 0
	objD.DataC1 = 1
	objD.DataA1 = 0.00
	objD.Buttonpos_1 = 3
	objD.Buttonpos_2 = 0
	objD.DataF1 = "webon"
	objD.race = "orc"
	objD.hero = 0
	objD.Rng1 = 0.00
	objD.Art = "ReplaceableTextures\\CommandButtons\\BTNEnchantedGemstone.blp"
	objD.EffectArt = ""
	objD.TargetArt = ""
	objD.CasterArt = ""
	
	
	
	objE.Name = string.format("符文E[%03d]", i)
	objE.levels = 1
	objE.item = 0
	objE.Tip = "符文"
	objE.Ubertip = "符文"
	objE.DataD1 = 0.00
	objE.DataB1 = 0
	objE.DataE1 = 0
	objE.DataC1 = 1
	objE.DataA1 = 0.00
	objE.Buttonpos_1 = 0
	objE.Buttonpos_2 = 1
	objE.DataF1 = "weboff"
	objE.race = "orc"
	objE.hero = 0
	objE.Rng1 = 0.00
	objE.Art = "ReplaceableTextures\\CommandButtons\\BTNEnchantedGemstone.blp"
	objE.EffectArt = ""
	objE.TargetArt = ""
	objE.CasterArt = ""
	
	
	
	objF.Name = string.format("符文F[%03d]", i)
	objF.levels = 1
	objF.item = 0
	objF.Tip = "符文"
	objF.Ubertip = "符文"
	objF.DataD1 = 0.00
	objF.DataB1 = 0
	objF.DataE1 = 0
	objF.DataC1 = 1
	objF.DataA1 = 0.00
	objF.Buttonpos_1 = 1
	objF.Buttonpos_2 = 1
	objF.DataF1 = "web"
	objF.race = "orc"
	objF.hero = 0
	objF.Rng1 = 0.00
	objF.Art = "ReplaceableTextures\\CommandButtons\\BTNEnchantedGemstone.blp"
	objF.EffectArt = ""
	objF.TargetArt = ""
	objF.CasterArt = ""
	
	
	
	objG.Name = string.format("符文G[%03d]", i)
	objG.levels = 1
	objG.item = 0
	objG.Tip = "符文"
	objG.Ubertip = "符文"
	objG.DataD1 = 0.00
	objG.DataB1 = 0
	objG.DataE1 = 0
	objG.DataC1 = 1
	objG.DataA1 = 0.00
	objG.Buttonpos_1 = 2
	objG.Buttonpos_2 = 1
	objG.DataF1 = "wateryminion"
	objG.race = "orc"
	objG.hero = 0
	objG.Rng1 = 0.00
	objG.Art = "ReplaceableTextures\\CommandButtons\\BTNEnchantedGemstone.blp"
	objG.EffectArt = ""
	objG.TargetArt = ""
	objG.CasterArt = ""
	
	
	
	objH.Name = string.format("符文H[%03d]", i)
	objH.levels = 1
	objH.item = 0
	objH.Tip = "符文"
	objH.Ubertip = "符文"
	objH.DataD1 = 0.00
	objH.DataB1 = 0
	objH.DataE1 = 0
	objH.DataC1 = 1
	objH.DataA1 = 0.00
	objH.Buttonpos_1 = 3
	objH.Buttonpos_2 = 1
	objH.DataF1 = "waterelemental"
	objH.race = "orc"
	objH.hero = 0
	objH.Rng1 = 0.00
	objH.Art = "ReplaceableTextures\\CommandButtons\\BTNEnchantedGemstone.blp"
	objH.EffectArt = ""
	objH.TargetArt = ""
	objH.CasterArt = ""
	
	
	
	objI.Name = string.format("符文I[%03d]", i)
	objI.levels = 1
	objI.item = 0
	objI.Tip = "符文"
	objI.Ubertip = "符文"
	objI.DataD1 = 0.00
	objI.DataB1 = 0
	objI.DataE1 = 0
	objI.DataC1 = 1
	objI.DataA1 = 0.00
	objI.Buttonpos_1 = 0
	objI.Buttonpos_2 = 2
	objI.DataF1 = "ward"
	objI.race = "orc"
	objI.hero = 0
	objI.Rng1 = 0.00
	objI.Art = "ReplaceableTextures\\CommandButtons\\BTNEnchantedGemstone.blp"
	objI.EffectArt = ""
	objI.TargetArt = ""
	objI.CasterArt = ""
	
	
	
	objJ.Name = string.format("符文J[%03d]", i)
	objJ.levels = 1
	objJ.item = 0
	objJ.Tip = "符文"
	objJ.Ubertip = "符文"
	objJ.DataD1 = 0.00
	objJ.DataB1 = 0
	objJ.DataE1 = 0
	objJ.DataC1 = 1
	objJ.DataA1 = 0.00
	objJ.Buttonpos_1 = 1
	objJ.Buttonpos_2 = 2
	objJ.DataF1 = "voodoo"
	objJ.race = "orc"
	objJ.hero = 0
	objJ.Rng1 = 0.00
	objJ.Art = "ReplaceableTextures\\CommandButtons\\BTNEnchantedGemstone.blp"
	objJ.EffectArt = ""
	objJ.TargetArt = ""
	objJ.CasterArt = ""
	
	
	
	objK.Name = string.format("符文K[%03d]", i)
	objK.levels = 1
	objK.item = 0
	objK.Tip = "符文"
	objK.Ubertip = "符文"
	objK.DataD1 = 0.00
	objK.DataB1 = 0
	objK.DataE1 = 0
	objK.DataC1 = 1
	objK.DataA1 = 0.00
	objK.Buttonpos_1 = 2
	objK.Buttonpos_2 = 2
	objK.DataF1 = "volcano"
	objK.race = "orc"
	objK.hero = 0
	objK.Rng1 = 0.00
	objK.Art = "ReplaceableTextures\\CommandButtons\\BTNEnchantedGemstone.blp"
	objK.EffectArt = ""
	objK.TargetArt = ""
	objK.CasterArt = ""
	
	
	
	objL.Name = string.format("符文L[%03d]", i)
	objL.levels = 1
	objL.item = 0
	objL.Tip = "符文"
	objL.Ubertip = "符文"
	objL.DataD1 = 0.00
	objL.DataB1 = 0
	objL.DataE1 = 0
	objL.DataC1 = 1
	objL.DataA1 = 0.00
	objL.Buttonpos_1 = 3
	objL.Buttonpos_2 = 2
	objL.DataF1 = "unstableconcoction"
	objL.race = "orc"
	objL.hero = 0
	objL.Rng1 = 0.00
	objL.Art = "ReplaceableTextures\\CommandButtons\\BTNEnchantedGemstone.blp"
	objL.EffectArt = ""
	objL.TargetArt = ""
	objL.CasterArt = ""
	
	?>   
	<?
	end
	?>
	
	
endfunction