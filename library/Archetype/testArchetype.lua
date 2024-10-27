require 'library.lib.lib'
require 'library.lib.Guid'
--require 'library.Data.Attribute'
require 'library.Method.Method'
local GameObject = require 'library.Core.GameObject'
local class = lib.class
testArchetype = class('testArchetype', GameObject)
function testArchetype:initialize()
    GameObject.initialize(self)
    self:addComponent("testComponents")
    self:addComponent("BaseCompenents")
    -- self.ID = id
    -- self.Guid = Guid.New()
    self.name = 0
    -- self.Type = 0
    -- self.Custom = 0
    self["测试"] = "测试。。。"
    -- self["装备栏"] = Method.clone(Attribute["装备栏"])
    -- self["物品属性"] = Method.clone(Attribute["物品属性"])
end
return testArchetype
