require 'library.lib.lib'
-- require 'library.lib.Guid'
local GameObject = require 'library.Core.GameObject'
local class = lib.class
Player = class('Player', GameObject)
function Player:initialize()
    GameObject.initialize(self)
    self:addComponent("PlayerComponents")
end
return Player
