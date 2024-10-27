-- TaskCardComponents
require 'library.lib.lib'
local Component = require 'library.Core.Components'
local class = lib.class
local TaskCardComponents = class("TaskCardComponents", Component)
-- testComponents = {}
function TaskCardComponents:initialize()
    -- print("组件被创建")
    Component.initialize(self, "TaskCardComponents", "TaskCardComponents")
    -- self:Information()
    self.name = "TaskCardComponents"
    -- self.depends_ = functions.checktable(depends)
    self.Data = {
        ["姓氏"] = {Tag = {}, Value = 0},
        ["名字"] = {Tag = {}, Value = 0},
        ["性别"] = {Tag = {}, Value = 0},
        ["种族"] = {Tag = {}, Value = 0},
        ["身份"] = {Tag = {}, Value = 0},
        ["阵营"] = {Tag = {}, Value = 0},
        ["信仰"] = {Tag = {}, Value = 0},
        ["外观"] = {Tag = {}, Value = 0},
        ["职业"] = {Tag = {}, Value = 0},
        ["出身"] = {Tag = {}, Value = 0},
        ["势力"] = {Tag = {}, Value = 0},
        ["人际关系"] = {Tag = {}, Value = 0},
        ["语言"] = {Tag = {}, Value = 0}
    }
end
-- TaskCardComponents.Data = {
--     ["姓氏"] = {Tag = {}, Value = 0},
--     ["名字"] = {Tag = {}, Value = 0},
--     ["性别"] = {Tag = {}, Value = 0},
--     ["种族"] = {Tag = {}, Value = 0},
--     ["身份"] = {Tag = {}, Value = 0},
--     ["阵营"] = {Tag = {}, Value = 0},
--     ["信仰"] = {Tag = {}, Value = 0},
--     ["外观"] = {Tag = {}, Value = 0},
--     ["职业"] = {Tag = {}, Value = 0},
--     ["出身"] = {Tag = {}, Value = 0},
--     ["势力"] = {Tag = {}, Value = 0},
--     ["人际关系"] = {Tag = {}, Value = 0},
--     ["语言"] = {Tag = {}, Value = 0},
-- }
return TaskCardComponents
