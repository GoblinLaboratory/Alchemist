require 'library.lib.lib'
-- require 'library.lib.Guid'
local GameObject = require 'library.Core.GameObject'
local class = lib.class
Hero = class('Hero', GameObject)
function Hero:initialize()
    GameObject.initialize(self)
    self:addComponent("BaseCompenents")
    self:addComponent("AttributeComponents")
    self:addComponent("ExtraAttributeComponents")
    self:addComponent("BarComponents")
end
return Hero