local API = require 'library.API'
local CJ = require 'jass.common'
require 'library.Method.Method'
require 'blizzard.System.AttributeSystem'
EquipmentSystem = {}
-- 装备系统
-- 获取装备
function EquipmentSystem.GetWeaponryData(id, Custom)
    -- return self.ItemsList[Custom].Dota
    if CJ.IsUnitType(id, CJ.UNIT_TYPE_HERO) == true  then
        -- statements
        local u = API.GetUnit(id, true)
        local com = u:getComponent("BarComponents")
        local i = com:GetData(Custom)
        return i
    end
end
-- 设置装备数据
function EquipmentSystem.SetWeaponryData(id, item)
    if CJ.IsUnitType(id, CJ.UNIT_TYPE_HERO) == true  then
        -- statements
        local u = API.GetUnit(id, true)
        --local i = API.GetItemDota(item1)
        local com = u:getComponent("BarComponents")
        local com1 = item:getComponent("ItemAttributeComponents")
        local l = com1:GetData("类别")
        com:SetData(l, Method.clone(item))
        EquipmentSystem.AddPrototype(id, item)
    end

end
-- 移除装备数据
function EquipmentSystem.RemoveWeaponryData(id, item)
    if CJ.IsHeroUnitId(CJ.GetUnitTypeId(id)) == true then
        -- statements
        local u = API.GetUnit(id, true)
        --local i = API.GetItemDota(item1)
        local com = u:getComponent("BarComponents")
        local com1 = item:getComponent("ItemAttributeComponents")
        local l = com1:GetData("类别")
        com:SetData(l, 0)
        EquipmentSystem.RemovePrototype(id, item)
    end

end
-- 添加属性
function EquipmentSystem.AddPrototype(unit, item)
    local u = API.GetUnit(unit, true)
    --local it = API.GetItemDota(item)
    local com = u:getComponent("AttributeComponents")
    local com1 = item:getComponent("AttributeComponents")
    -- 魔兽属性
    for k, _ in pairs(com1.Data) do
        -- statements
        -- print(k)
        local i = com:GetData(k)
        com:SetData(k, i + com1:GetData(k))
        AttributeSystem.SetPrototype(unit, k, com1:GetData(k))
    end
    -- 附加属性
    local Extracom = u:getComponent("ExtraAttributeComponents")
    local Extracom1 = item:getComponent("ExtraAttributeComponents")
    for k, _ in pairs(Extracom.Data) do
        -- statements
        -- print(k)
        local i = Extracom:GetData(k)
        Extracom:SetData(k, i + Extracom1:GetData(k))
    end
end
function EquipmentSystem.RemovePrototype(unit, item)
    local u = API.GetUnit(unit, true)
    --local it = API.GetItemDota(item)
    local com = u:getComponent("AttributeComponents")
    local com1 = item:getComponent("AttributeComponents")
    -- 魔兽属性
    for k, _ in pairs(com1.Data) do
        -- statements
        -- print(k)
        local i = com:GetData(k)
        com:SetData(k, i - com1:GetData(k))
        AttributeSystem.SetPrototype(unit, k, 0 - com1:GetData(k))
    end
    -- 附加属性
    local Extracom = u:getComponent("ExtraAttributeComponents")
    local Extracom1 = item:getComponent("ExtraAttributeComponents")
    for k, _ in pairs(Extracom.Data) do
        -- statements
        -- print(k)
        local i = Extracom:GetData(k)
        Extracom:SetData(k, i - Extracom1:GetData(k))
    end
end
return EquipmentSystem
