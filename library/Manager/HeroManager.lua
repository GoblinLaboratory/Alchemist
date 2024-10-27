require "library.Archetype.Entity"
HeroManager = {HeroList = {}}

function HeroManager:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    --
    --
    return o
end

HeroManager.__index = HeroManager

-- 单件模式
function HeroManager:Instance()
    if self.instance == nil then self.instance = self:new() end
    return self.instance
end
-- 判断单位是否存在
function HeroManager:IsUnit(id)
    for i = #self.HeroList, 1, -1 do
        if self.HeroList[i].ID == id then return true end
    end
    return false
end
-- 获取单位
function HeroManager:GetUnit(id)
    if self:IsUnit(id) == false then self:CreatUnit(id) end

    for i = #self.HeroList, 1, -1 do
        if self.HeroList[i].ID == id then return self.HeroList[i] end
    end
end
-- 添加单位
function HeroManager:CreatUnit(id)
    if self:IsUnit(id) == false then
        local x = Entity.Hero:new()
        x.ID = id
        table.insert(self.HeroList, x)
    end
end
-- 移除单位
function HeroManager:RemoveUnit(id)
    for i = #self.HeroList, 1, -1 do
        if self.HeroList[i].ID == id then
            table.remove(self.HeroList, i)
            --World:RemoveEntity(self.HeroList[i].GUID)
        end
    end
end
-- -- test
-- local h = HeroManager:Instance()
-- h:CreatUnit(465)
return HeroManager
