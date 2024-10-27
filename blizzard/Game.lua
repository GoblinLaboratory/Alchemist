require "blizzard\\Game\\GameStatus"
Game = {Scene = GameStatus.Scene["选择英雄"]}
function Game:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    --
    --
    return o
end
Game.__index = Game

-- 单件模式
function Game:Instance()
    if self.instance == nil then self.instance = self:new() end
    return self.instance
end
-- 设置游戏模式
-- 设置游戏场景
function  Game:SetGameStatus(n)
    self.Scene = n
end
return Game