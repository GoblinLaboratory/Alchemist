-- BaseCompenents = {}
-- BaseCompenents.Name = "基础属性"
-- BaseCompenents["ID"] = {Name = "ID", Explain = "", Tag = {}, Value = 0}
-- BaseCompenents["名称"] = {Name = "名称", Explain = "", Tag = {}, Value = 0}
-- BaseCompenents["类型"] = {Name = "类型", Explain = "", Tag = {}, Value = 0}
-- BaseCompenents["自定义值"] = {
--     Name = "自定义值",
--     Explain = "",
--     Tag = {},
--     Value = 0
-- }
-- BaseCompenents["说明"] = {Name = "说明", Explain = "", Tag = {}, Value = 0}
-- BaseCompenents["等级"] = {Name = "等级", Explain = "", Tag = {}, Value = 0}
-- print(BaseCompenents.Name)
-- print(BaseCompenents["类型"].Name)
-- return BaseCompenents
require 'library.lib.lib'
local Component = require 'library.Core.Components'
--require 'library.Core.Registe'
local class = lib.class
local BaseCompenents = class("BaseCompenents",Component)
--testComponents = {}
function BaseCompenents:initialize()
    --print("组件被创建")
    Component.initialize(self,"BaseCompenents","BaseCompenents")
    --self:Information()
    self.name = "BaseCompenents"
    --self.depends_ = functions.checktable(depends)
    self.Data = {
        ["ID"] = {Tag = {}, Value = 0},
        ["Name"] = {Tag = {}, Value = 0},
        ["Types"] = {Tag = {}, Value = 0},
        ["等级"] = {Tag = {}, Value = 0},
        ["说明"] = {Tag = {}, Value = 0},
        ["自定义值"] = {Tag = {}, Value = 0}
    }
end
-- function BaseCompenents:addComponent(name)
--     print("添加了组件")
--     --local R = Registry:Instance()
--     local R = Registe:Instance()
--     --local component = Registry.newObject(name)
--     local component = R:newObject(name)
--     self.components_[name] = component
--     --self.components_[ID] = component
--     --component:bind_(self)
--     return component
-- end
-- BaseCompenents.Data = {
--     ["ID"] = {Tag = {}, Value = 0},
--     ["Name"] = {Tag = {}, Value = 0},
--     ["Types"] = {Tag = {}, Value = 0},
--     ["等级"] = {Tag = {}, Value = 0},
--     ["说明"] = {Tag = {}, Value = 0},
--     ["自定义值"] = {Tag = {}, Value = 0}
-- }
return BaseCompenents