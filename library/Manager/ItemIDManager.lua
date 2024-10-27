require "library.Method.Maths"
-- require 'library.Generator.WeaponryGenerator'
-- require "ECS\\Global"
ItemIDManager = {
    -- 装备ID列表
    IDList = {},
    -- 使用中的ID
    UseIDList = {}
    -- 生成的装备库.itme表
    -- Dota = {}
}
-- 创建类
function ItemIDManager:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    --
    -- self:Int()
    o:Int()
    --
    return o
end
ItemIDManager.__index = ItemIDManager

-- 单件模式
function ItemIDManager:Instance()
    if self.instance == nil then self.instance = self:new() end
    return self.instance
end
-- 初始化
function ItemIDManager:Int()
    local x = "ZB00"
    for i = 0, 899 do
        table.insert(self.IDList, Maths.GetId(x))
        x = Maths.GetNextStrId(x)
        -- Global.Log(i)
    end
end
-- 从物品池获得一个物品ID
function ItemIDManager:GetEquipment()
    local n = #self.IDList
    local s = #self.UseIDList

    table.insert(self.UseIDList, self.IDList[n])
    -- 删除最后一个元素
    table.remove(self.IDList)

    return self.UseIDList[s + 1]
end
-- 将回收的物品ID加入物品池
function ItemIDManager:SetEquipment(num1)
    local count = 0
    for i = #self.IDList, 1, -1 do
        if self.IDList[i] == num1 then count = 1 end
    end
    if count == 0 then table.insert(self.IDList, num1) end
    ------------------------------------
    for i = #self.UseIDList, 1, -1 do
        if self.UseIDList[i] == num1 then table.remove(self.UseIDList, i) end
    end
end
-- -- 根据物品ID获得物品数据
-- function ItemManager:GetItemDota(num1)
--     for i = #self.Dota, 1, -1 do
--         if self.Dota[i].ID == num1 then return self.Dota[i] end
--     end
--     return 0
-- end
-- 删除指定物品
-- function ItemManager:RemoveItem(item)
--     self:SetEquipment(item.ID)
--     for i = #self.Dota, 1, -1 do
--         if self.Dota[i].ID == item.ID then table.remove(self.Dota, i) end
--     end
-- end
-- 删除指定ID物品
-- function ItemManager:RemoveIDItem(ID)
--     self:SetEquipment(ID)
--     for i = #self.Dota, 1, -1 do
--         if self.Dota[i].ID == ID then table.remove(self.Dota, i) end
--     end
-- end
-- 创建随机物品
-- 参数 lucky:物品爆率, level:装备等级
-- function ItemManager:CreateRandomItem(lucky, level)
--     local item1 = RandomWeaponry.CreateWeaponry(lucky, level)
--     item1.ID = self:GetEquipment()

--     table.insert(self.Dota, item1)
--     return item1
-- end
-- -- -- 创建物品
-- function ItemManager:CreateItem(xd)
--     local item1 = Method.clone(xd)
--     item1.ID = self:GetEquipment()
--     table.insert(self.Dota, item1)
--     return item1
--     -- xd.ID = self:GetEquipment()
--     -- return  xd
-- end
-- -- 创建空物品
-- function ItemManager:CreateNItem()
--     -- statements
--     local item1 = Factory.WeaponryFactory()
--     item1.ID = self:GetEquipment()
--     table.insert(self.Dota, item1)
--     return item1
-- end
return ItemIDManager
