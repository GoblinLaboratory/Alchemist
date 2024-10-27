require 'library.lib.lib'
-- require 'library.lib.Guid'
local GameObject = require 'library.Core.GameObject'
local class = lib.class
Item = class('Item', GameObject)
function Item:initialize()
    GameObject.initialize(self)
    self:addComponent("BaseCompenents")
    self:addComponent("AttributeComponents")
    self:addComponent("ExtraAttributeComponents")
    self:addComponent("ItemAttributeComponents")
end
return Item