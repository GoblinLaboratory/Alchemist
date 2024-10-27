-- BarComponents

require 'library.lib.lib'
local Component = require 'library.Core.Components'
local class = lib.class
local BarComponents = class("BarComponents",Component)
--testComponents = {}
function BarComponents:initialize()
    --print("组件被创建")
    Component.initialize(self,"BarComponents","BarComponents")
    --self:Information()
    self.name = "BarComponents"
    --self.depends_ = functions.checktable(depends)
    self.Data = {
        ["主手装备"] = {Tag = {}, Value = 0},
        ["副手装备"] = {Tag = {}, Value = 0},
        ["头部装备"] = {Tag = {}, Value = 0},
        ["胸部装备"] = {Tag = {}, Value = 0},
        ["腰部装备"] = {Tag = {}, Value = 0},
        ["腿部装备"] = {Tag = {}, Value = 0},
        ["手部装备"] = {Tag = {}, Value = 0},
        ["脚部装备"] = {Tag = {}, Value = 0},
        ["项链"] = {Tag = {}, Value = 0},
        ["戒指"] = {Tag = {}, Value = 0},
        ["披风"] = {Tag = {}, Value = 0}
    }
end
-- BarComponents.Data = {
--     ["主手装备"] = {Tag = {}, Value = 0},
--     ["副手装备"] = {Tag = {}, Value = 0},
--     ["头部装备"] = {Tag = {}, Value = 0},
--     ["胸部装备"] = {Tag = {}, Value = 0},
--     ["腰部装备"] = {Tag = {}, Value = 0},
--     ["腿部装备"] = {Tag = {}, Value = 0},
--     ["脚部装备"] = {Tag = {}, Value = 0},
--     ["项链"] = {Tag = {}, Value = 0},
--     ["戒指"] = {Tag = {}, Value = 0},
--     ["披风"] = {Tag = {}, Value = 0}
-- }
-- function BarComponents:SetData(data, value)
--     -- statements
--     Component:SetData(data, value)
--     --self.Data[data].Value = value
-- end
return BarComponents