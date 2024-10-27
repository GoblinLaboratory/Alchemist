require 'library.lib.lib'
-- require 'library.lib.Guid'
local GameObject = require 'library.Core.GameObject'
local class = lib.class
Unit = class('Unit', GameObject)
function Unit:initialize()
    GameObject.initialize(self)
    self:addComponent("BaseCompenents")
    --self:addComponent("AttributeComponents")
    self:addComponent("ExtraAttributeComponents")
end
return Unit