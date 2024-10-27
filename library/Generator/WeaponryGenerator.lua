require "math"
-- require "Lib\\table"
require 'library.Data.Setting'
require "library.Data.Picture"
require "library.Archetype.Entity"
-- local Random = require "library.Lib.Random"
local WeaponryData = require "library.Data.WeaponryData"
WeaponryGenerator = {}
-- 参数  level 等级 int
-- 参数  rarity 稀有度 int
-- 参数  position 部位 int
function WeaponryGenerator.CreateWeaponry(level, rarity, position)
    -- statements
    -- math.randomseed(tostring(os.time()):reverse():sub(1, 7))
    local i = Entity.Item:new()
    -- 设置部位类别
    WeaponryGenerator.SetPosition(i, position)
    -- 设置稀有度
    WeaponryGenerator.Rarity(i, rarity)
    -- 设置等级
    WeaponryGenerator.SetItemsLevel(i, level)
    -- 设置装备图标
    -- local s = i:getComponent("ItemAttributeComponents")
    -- s:SetData("类型", "戒指")
    WeaponryGenerator.SetPicture(i)
    return i
end
-- 设置等级
function WeaponryGenerator.SetItemsLevel(item1, l)
    local s = item1:getComponent("BaseCompenents")
    s:SetData("等级", l)
end
-------------------------------------------------------------
-- 设置稀有度
function WeaponryGenerator.Rarity(item1, rarity)
    local s = item1:getComponent("ItemAttributeComponents")
    -- s:SetData("稀有度", Setting["品质"][rarity].Name)
    s:SetData("稀有度", rarity)
    for i = 1, Setting["品质"][rarity].Strengthen, 1 do
        -- statements
        WeaponryGenerator.SetAffix(item1)
    end
end
-- 添加词缀
function WeaponryGenerator.SetAffix(item1)
    -- statements
    local it = WeaponryData.Affix[math.random(1, #WeaponryData.Affix)]
    for i = #it, 1, -1 do
        if it[i].Type == "基础属性" then
            -- statements
            for j = #it[i], 1, -1 do
                -- statements
                -- local com = item1:getComponent("BaseCompenents")
                -- com:SetData(it[i][j].Type, it[i][j].Value)
                if it[i][j].Type == "Name" then
                    -- statements
                    local com = item1:getComponent("ItemAttributeComponents")
                    com:SetData("词缀",
                                com:GetData("词缀") .. " " .. it[i][j].Value)
                end
            end
        elseif it[i].Type == "属性" then
            -- statements
            for j = #it[i], 1, -1 do
                -- statements
                local com = item1:getComponent("AttributeComponents")
                com:SetData(it[i][j].Type, it[i][j].Value)
            end
        elseif it[i].Type == "附加属性" then
            -- statements
            for j = #it[i], 1, -1 do
                -- statements
                local com = item1:getComponent("ExtraAttributeComponents")
                com:SetData(it[i][j].Type, it[i][j].Value)
            end
        end
    end
end
-------------------------------------------------------------
-- 设置部位类别
function WeaponryGenerator.SetPosition(item1, n)
    -- item1["物品属性"]["类别"]["Value"] = Setting["类别"][n].Name
    local s = item1:getComponent("ItemAttributeComponents")
    s:SetData("类别", Setting["类别"][n]["说明"])
    WeaponryGenerator.SetPrototype(item1, n)
    WeaponryGenerator.SetNaming(item1)
end
-- 设置Item基础属性 -- 设置装备底材
function WeaponryGenerator.SetPrototype(item1, n)
    -- local com = item1:getComponent("ItemAttributeComponents")
    -- local w = WeaponryData[Setting["类别"][n].Name]
    -- local it = w[math.random(1, #w)]
    local it = WeaponryData[Setting["类别"][n].Name][math.random(1,
                                                                   #WeaponryData[Setting["类别"][n]
                                                                       .Name])]
    for i = #it, 1, -1 do
        if it[i].Type == "基础属性" then
            -- statements
            for j = #it[i], 1, -1 do
                -- statements
                local com = item1:getComponent("BaseCompenents")
                com:SetData(it[i][j].Type, it[i][j].Value)
            end
        elseif it[i].Type == "装备属性" then
            -- statements
            for j = #it[i], 1, -1 do
                -- statements
                local com = item1:getComponent("ItemAttributeComponents")
                com:SetData(it[i][j].Type, it[i][j].Value)
            end
        elseif it[i].Type == "属性" then
            -- statements
            for j = #it[i], 1, -1 do
                -- statements
                local com = item1:getComponent("AttributeComponents")
                com:SetData(it[i][j].Type, it[i][j].Value)
            end
        elseif it[i].Type == "附加属性" then
            -- statements
            for j = #it[i], 1, -1 do
                -- statements
                local com = item1:getComponent("ExtraAttributeComponents")
                com:SetData(it[i][j].Type, it[i][j].Value)
            end
        end
    end
    return item1
end
-- 装备冠名
function WeaponryGenerator.SetNaming(item1)
    -- local it = WeaponryData[math.random(1, table.getn(WeaponryData.Naming))]
    local w = WeaponryData.Naming -- WeaponryData[Setting["类别"][n].Name]
    local it = w[math.random(1, #w)]
    -- local it = w[Random.Get(1, #w)]
    for i = #it, 1, -1 do
        if it[i].Type == "基础属性" then
            -- statements
            for j = #it[i], 1, -1 do
                -- statements
                -- local com = item1:getComponent("BaseCompenents")
                -- com:SetData(it[i][j].Type, it[i][j].Value)
                if it[i][j].Type == "Name" then
                    -- statements
                    local com = item1:getComponent("BaseCompenents")
                    com:SetData("Name", it[i][j].Value .. com:GetData("Name"))
                end
            end
        elseif it[i].Type == "属性" then
            -- statements
            for j = #it[i], 1, -1 do
                -- statements
                local com = item1:getComponent("AttributeComponents")
                com:SetData(it[i][j].Type, it[i][j].Value)
            end
        elseif it[i].Type == "附加属性" then
            -- statements
            for j = #it[i], 1, -1 do
                -- statements
                local com = item1:getComponent("ExtraAttributeComponents")
                com:SetData(it[i][j].Type, it[i][j].Value)
            end
        end
    end
    return item1
end
-------------------------------------------------------------
-- 设置装备图标
function WeaponryGenerator.SetPicture(item1)
    -- statements
    local PM = Picture:Instance()
    local s = item1:getComponent("ItemAttributeComponents")
    local p = PM:getIcon(s:GetData("类型"))
    s:SetData("图标", p)
end
------------------------------------------------------
------------------------------------------------------
------------------------------------------------------
-- -- 随机装备
-- function  WeaponryGenerator.Random(level)
--     -- statements
-- end
-- 参数  level 等级 int
-- 参数  rarity 稀有度 int
-- 参数  position 部位 int
function WeaponryGenerator.CreateRandomWeaponry(level, rarity, position)
    -- statements
    -- math.randomseed(tostring(os.time()):reverse():sub(1, 7))
    local i = Entity.Item:new()
    -- 设置部位类别
    WeaponryGenerator.SetPosition(i, position)
    -- 设置稀有度
    WeaponryGenerator.Rarity(i, rarity)
    -- 设置等级
    WeaponryGenerator.SetItemsLevel(i, level)
    -- 设置装备图标
    WeaponryGenerator.SetPicture(i)
    return i
end
return WeaponryGenerator
