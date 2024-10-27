require 'library.Data.Setting'
Formula = {}
-- 流放之路护甲算法
-- （#%伤害减免 = 护甲 / （ 护甲 + 所受物理伤害 * 10 ））
-- return a/(a + b*5)
function Formula.ArmorFormula(a, b)
    -- return a/(a + b*5)
    return a * 0.6 / (1 + b * 0.6)
end
-- 获取物品名称
function Formula.GetItemName(item)
    local com = item:getComponent("ItemAttributeComponents")
    local id = com:GetData("稀有度")
    local rarity = Setting["品质"][id].Name
    local Color = Setting["品质"][id].Color
    local com1 = item:getComponent("BaseCompenents")
    local name = com1:GetData("Name")
    local Ep = Color .. name .. "(" .. rarity .. ")" .. "|r"
    return Ep
end
function Formula.GetItemExplain(item)
    local Ep = "" -- "|n"
    local com1 = item:getComponent("BaseCompenents")
    local com2 = item:getComponent("ItemAttributeComponents")
    local com3 = item:getComponent("AttributeComponents")
    local com4 = item:getComponent("ExtraAttributeComponents")
    -- 物品等级
    Ep = Ep .. "|cffcc99ff" .. "物品等级" .. "   " ..
             tostring(com1:GetData("等级")) .. "      " ..
             tostring(com2:GetData("类别")) .. "|r|n"
    -- 添加攻击力
    if com3:GetData("攻击力") ~= 0 then
        -- statements
        Ep = Ep .. "提升" .. com3:GetData("攻击力") .. "点攻击力" ..
                 "|n"
    end
    -- 添加法术强度
    if com4:GetData("法术强度") ~= 0 then
        -- statements
        Ep =
            Ep .. "提升" .. com4:GetData("法术强度") .. "点法术强度" ..
                "|n"
    end
    -- 添加护甲
    if com3:GetData("护甲") ~= 0 then
        -- statements
        Ep = Ep .. "提升" .. com3:GetData("护甲") .. "点护甲" .. "|n"
    end
    -- 添加属性
    local Attribute = false
    if (com3:GetData("力量") ~= 0) then
        Ep = Ep .. "|cffffff00" .. "+" .. com3:GetData("力量") .. "力量" ..
                 "|r" .. "   "
        Attribute = true
    end
    if (com3:GetData("敏捷") ~= 0) then
        Ep = Ep .. "|cffffff00" .. "+" .. com3:GetData("敏捷") .. "敏捷" ..
                 "|r" .. "   "
        Attribute = true
    end
    if (com3:GetData("智力") ~= 0) then
        Ep = Ep .. "|cffffff00" .. "+" .. com3:GetData("智力") .. "智力" ..
                 "|r" .. "   "
        Attribute = true
    end
    if Attribute == true then Ep = Ep .. "|n" end
    -- 添加混合属性
    local UAttribute = false
    -- 生命值
    if (com3:GetData("生命值") ~= 0) then
        Ep = Ep .. "|cffffff00" .. "+" .. com3:GetData("生命值") ..
                 "点生命值" .. "|r" .. "   "
        UAttribute = true
    end
    -- 魔法值
    if (com3:GetData("魔法值") ~= 0) then
        Ep = Ep .. "|cffffff00" .. "增加" .. com3:GetData("魔法值") ..
                 "点魔法值" .. "|r" .. "   "
        UAttribute = true
    end
    if UAttribute == true then Ep = Ep .. "|n" end
    -- 添加魔法抗性
    if (com4:GetData("魔法抗性") ~= 0) then
        Ep = Ep .. "|cffcc99ff" .. "增加" .. com4:GetData("魔法抗性") ..
                 "%魔法抗性" .. "|r|n"
    end
    -- 添加生命恢复速度
    if (com3:GetData("生命回复速度") ~= 0) then
        Ep = Ep .. "|cffcc99ff" .. "增加" ..
                 com3:GetData("生命回复速度") ..
                 "点每秒生命回复速度" .. "|r|n"
    end
    -- 添加魔法恢复速度
    if (com3:GetData("魔法回复速度") ~= 0) then
        Ep = Ep .. "|cffcc99ff" .. "增加" ..
                 com3:GetData("魔法回复速度") .. "%魔法回复速度" ..
                 "|r|n"
    end
    -- 增加攻击速度
    if (com3:GetData("攻击速度") ~= 0) then
        Ep = Ep .. "|cffcc99ff" .. "增加" .. com3:GetData("攻击速度") ..
                 "点攻击速度" .. "|r|n"
    end
    -- 增加移动速度
    if (com3:GetData("移动速度") ~= 0) then
        Ep = Ep .. "|cffcc99ff" .. "增加" .. com3:GetData("移动速度") ..
                 "点移动速度" .. "|r|n"
    end
    Ep = Ep .. "|n"
    return Ep
end
-- 获取图标
function Formula.GetItemIcon(item1)
    -- statements
    -- return item1["装备属性"]["图标"].Value
    local com = item1:getComponent("ItemAttributeComponents")
    return com:GetData("图标")
end
--- test ----
local i = Formula.ArmorFormula(200, 100)
print(i)
return Formula
