-- AttributeComponents
require 'library.lib.lib'
local Component = require 'library.Core.Components'
local class = lib.class
local AttributeComponents = class("AttributeComponents",Component)
--testComponents = {}
function AttributeComponents:initialize()
    --print("组件被创建")
    Component.initialize(self,"AttributeComponents","AttributeComponents")
    --self:Information()
    self.name = "AttributeComponents"
    --self.depends_ = functions.checktable(depends)
    self.Data = {
        ["力量"] = {Tag = {}, Value = 0},
        ["敏捷"] = {Tag = {}, Value = 0},
        ["智力"] = {Tag = {}, Value = 0},
        ["生命值"] = {Tag = {}, Value = 0},
        ["生命回复速度"] = {Tag = {}, Value = 0},
        ["魔法值"] = {Tag = {}, Value = 0},
        ["魔法回复速度"] = {Tag = {}, Value = 0},
        ["护甲"] = {Tag = {}, Value = 0},
        ["攻击力"] = {Tag = {}, Value = 0},
        ["移动速度"] = {Tag = {}, Value = 0},
        ["攻击速度"] = {Tag = {}, Value = 0}
    }
end
-- AttributeComponents.Data = {
--     ["力量"] = {Tag = {}, Value = 0},
--     ["敏捷"] = {Tag = {}, Value = 0},
--     ["智力"] = {Tag = {}, Value = 0},
--     ["生命值"] = {Tag = {}, Value = 0},
--     ["生命回复速度"] = {Tag = {}, Value = 0},
--     ["魔法值"] = {Tag = {}, Value = 0},
--     ["魔法回复速度"] = {Tag = {}, Value = 0},
--     ["护甲"] = {Tag = {}, Value = 0},
--     ["攻击力"] = {Tag = {}, Value = 0},
--     ["移动速度"] = {Tag = {}, Value = 0},
--     ["攻击速度"] = {Tag = {}, Value = 0}
-- }
return AttributeComponents