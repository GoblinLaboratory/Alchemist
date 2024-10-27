-- ItemAttributeComponents
require 'library.lib.lib'
local Component = require 'library.Core.Components'
local class = lib.class
local ItemAttributeComponents = class("ItemAttributeComponents", Component)
-- testComponents = {}
function ItemAttributeComponents:initialize()
    -- print("组件被创建")
    Component.initialize(self, "ItemAttributeComponents",
                         "ItemAttributeComponents")
    -- self:Information()
    self.name = "ItemAttributeComponents"
    -- self.depends_ = functions.checktable(depends)
    self.Data = {
        ["品质"] = {Tag = {}, Value = 0},
        -- 装备部位
        ["类别"] = {Tag = {}, Value = 0},
        ["星"] = {Tag = {}, Value = 0},
        ["词缀"] = {Tag = {}, Value = ""},
        ["强化"] = {Tag = {}, Value = 0},
        ["图标"] = {Tag = {}, Value = 0},
        ["稀有度"] = {Tag = {}, Value = 0},
        -- 装备类型
        ["类型"] = {Tag = {}, Value = 0}
    }
end
-- ItemAttributeComponents.Data = {
--     ["品质"] = {Tag = {}, Value = 0},
--     -- 装备部位
--     ["类别"] = {Tag = {}, Value = 0},
--     ["星"] = {Tag = {}, Value = 0},
--     ["词缀"] = {Tag = {}, Value = ""},
--     ["强化"] = {Tag = {}, Value = 0},
--     ["图标"] = {Tag = {}, Value = 0},
--     ["稀有度"] = {Tag = {}, Value = 0},
--     -- 装备类型
--     ["类型"] = {Tag = {}, Value = 0}
-- }
return ItemAttributeComponents
