require "library.Archetype.Entity"
require "library.Global"
PlayerManager = {PlayerList = {}}
function PlayerManager:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    --
    self:Init(10)
    --local x = Entity.Player:new()
    --
    return o
end

PlayerManager.__index = PlayerManager

-- 单件模式
function PlayerManager:Instance()
    if self.instance == nil then self.instance = self:new() end
    return self.instance
end
-- 初始化
function PlayerManager:Init(n)
    -- statements
    for i = 1, n do
        -- statements
        self.PlayerList[i] = Entity.Player:new()
        --self.PlayerList[i].ID = n
        print("CreatePlayer"..i)
        print("GUID"..self:GetPleyer(i).Guid)
    end
end
function PlayerManager:GetPleyer(n)
    -- statements
    return self.PlayerList[n]
end
-- test
--local p = PlayerManager:Instance()
return PlayerManager