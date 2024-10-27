-- PlayerComponents = {}
-- return PlayerComponents
require 'library.lib.lib'
local Component = require 'library.Core.Components'
local class = lib.class
local PlayerComponents = class("PlayerComponents", Component)
-- testComponents = {}
function PlayerComponents:initialize()
    -- print("组件被创建")
    Component.initialize(self,"PlayerComponents", "PlayerComponents")
    --self:Information()
    self.name = "PlayerComponents"
    -- self.depends_ = functions.checktable(depends)
    self.Data = {
        ["装备图标"] = {Tag = {}, Value = 0},
        ["当前选择英雄ID"] = {Tag = {}, Value = 0},
        ["UI图标"] = {Tag = {}, Value = 0},
        ["选择英雄"] = {Tag = {}, Value = 0},
        ["界面状态"] = {Tag = {}, Value = 0},
        ["游戏状态"] = {Tag = {}, Value = 0},
    }
end
-- PlayerComponents.Data = {
--     ["装备图标"] = {Tag = {}, Value = 0},
--     ["当前选择英雄ID"] = {Tag = {}, Value = 0},
--     ["UI图标"] = {Tag = {}, Value = 0},
--     ["选择英雄"] = {Tag = {}, Value = 0}
-- }
return PlayerComponents
