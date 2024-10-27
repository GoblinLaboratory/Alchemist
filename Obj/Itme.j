<?local slk = require 'slk' ?>

//物品
function ChuangjianWUPin takes nothing returns nothing
	<? 
function GetNextStrId(id) 
	local str = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	local str1 = string.sub(id, 1, 1)
	local str2 = string.sub(id, 2, 2)
	local str3 = string.sub(id, 3, 3)
	local str4 = string.sub(id, 4, 4)
	
	
	if(str4 == "Z") then
		str4 = string.sub(str, 1, 1)
		if(str3 == "Z") then
			str3 = string.sub(str, 1, 1)           
			if(str2 == "Z") then
				str2 = string.sub(str, 1, 1)
				local j1 = string.find(str, str1)
				str1 = string.sub(str, j1 + 1, j1 + 1)
			else
				local j2 = string.find(str, str2)
				str2 = string.sub(str, j2 + 1, j2 + 1)
				end
			else
				local j3 = string.find(str, str3)
				str3 = string.sub(str, j3 + 1, j3 + 1)
    end
			else 
    local j4 = string.find(str, str4)
    str4 = string.sub(str, j4 + 1, j4 + 1)  
				end
				return str1..str2..str3..str4
				end
				?>
    <? 
				local x = "ZB00"
				for i = 0, 899 do
				local item1 = slk.item.ssil:new(x)
				?>
				<?
				x = GetNextStrId(x) 
				item1.Name = string.format("装备马甲(|cffffcc00Z|r)[%03d]", i)
				item1.abilList = "ZSZB"
				item1.Description = "这是一件可以穿戴的装备."
				item1.HP = 100
				?>
				<?
				end
				?>
endfunction
