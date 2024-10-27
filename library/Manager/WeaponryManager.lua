require "library.Data.Setting"
require "library.Manager.ItemIDManager"
require "library.Generator.WeaponryGenerator"
require "library.Method.Method"
-- require "ECS\\Global"
WeaponryManager = {
    -- 生成的装备库.itme表
    Dota = {}
}
-- 创建类
function WeaponryManager:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    --
    -- self:Int()
    --
    return o
end
WeaponryManager.__index = WeaponryManager

-- 单件模式
function WeaponryManager:Instance()
    if self.instance == nil then self.instance = self:new() end
    return self.instance
end
-- 从物品池获得一个物品ID
-- function WeaponryManager:GetEquipment()
--     local IM = ItemManager:Instance()
--     local o = IM:GetEquipment()
--     return o
-- end
-- -- 根据物品ID获得物品数据
function WeaponryManager:GetItemDota(num1)
    for i = #self.Dota, 1, -1 do
        if self.Dota[i].ID == num1 then return self.Dota[i] end
    end
    return 0
end
-- -- 删除指定物品
function WeaponryManager:RemoveItem(item)
    local IM = ItemIDManager:Instance()
    IM:SetEquipment(item.ID)
    for i = #self.Dota, 1, -1 do
        if self.Dota[i].ID == item.ID then table.remove(self.Dota, i) end
    end
end
-- -- 删除指定ID物品
function WeaponryManager:RemoveIDItem(ID)
    local IM = ItemIDManager:Instance()
    IM:SetEquipment(ID)
    for i = #self.Dota, 1, -1 do
        if self.Dota[i].ID == ID then table.remove(self.Dota, i) end
    end
end
-- -- 创建随机物品
-- -- 参数 lucky:物品爆率, level:装备等级
function WeaponryManager:CreateRandomItem(level, rarity, position)
    local IM = ItemIDManager:Instance()
    local o = WeaponryGenerator.CreateRandomWeaponry(level, rarity, position)
    o.ID = IM:GetEquipment()
    table.insert(self.Dota, o)
    return o
end
-- 创建物品
function WeaponryManager:CreateItem(xd)
    -- statements
    local IM = ItemIDManager:Instance()
    local o = Method.clone(xd)
    o.ID = IM:GetEquipment()
    table.insert(self.Dota, o)
    return o
end
-- -- 创建空物品
-- function WeaponryManager.CreateNItem()
--     -- statements
--     local IM = ItemManager:Instance()
--     local o = IM:CreateNItem()
--     return o
-- end
return WeaponryManager
