-- ExtraAttributeComponents
require 'library.lib.lib'
local Component = require 'library.Core.Components'
local class = lib.class
local ExtraAttributeComponents = class("ExtraAttributeComponents", Component)
-- testComponents = {}
function ExtraAttributeComponents:initialize()
    -- print("组件被创建")
    Component.initialize(self, "ExtraAttributeComponents",
                         "ExtraAttributeComponents")
    -- self:Information()
    self.name = "ExtraAttributeComponents"
    -- self.depends_ = functions.checktable(depends)
    self.Data = {
        ["魔法抗性"] = {Tag = {}, Value = 0},
        ["法术强度"] = {Tag = {}, Value = 0},
        ["闪避"] = {Tag = {}, Value = 0},
        ["格挡"] = {Tag = {}, Value = 0},
        ["招架"] = {Tag = {}, Value = 0},
        ["反弹"] = {Tag = {}, Value = 0},
        ["幸运"] = {Tag = {}, Value = 0},
        ["体质"] = {Tag = {}, Value = 0},
        ["感知"] = {Tag = {}, Value = 0},
        ["魅力"] = {Tag = {}, Value = 0},
        ------------------------------------------------------------
        ["精神"] = {Tag = {}, Value = 0},
        ["耐力"] = {Tag = {}, Value = 0},
        ["命中"] = {Tag = {}, Value = 0},
        ["韧性"] = {Tag = {}, Value = 0},
        ["急速"] = {Tag = {}, Value = 0},
        ["精准"] = {Tag = {}, Value = 0},
        -------------------------------------------------------------
        ["伤害减免"] = {Tag = {}, Value = 0},
        ["物理伤害吸收"] = {Tag = {}, Value = 0},
        ["法术伤害吸收"] = {Tag = {}, Value = 0},
        ["火焰抗性"] = {Tag = {}, Value = 0},
        ["冰霜抗性"] = {Tag = {}, Value = 0},
        ["暗影抗性"] = {Tag = {}, Value = 0},
        ["神圣抗性"] = {Tag = {}, Value = 0},
        ["邪能抗性"] = {Tag = {}, Value = 0},
        ["毒素抗性"] = {Tag = {}, Value = 0},
        ["雷电抗性"] = {Tag = {}, Value = 0},
        ["自然抗性"] = {Tag = {}, Value = 0},
        ----------------------------------------------------------------
        ["吸血"] = {Tag = {}, Value = 0},
        ["法术吸血"] = {Tag = {}, Value = 0},
        ["反馈"] = {Tag = {}, Value = 0},
        ["无视防御"] = {Tag = {}, Value = 0},
        ["装备爆率"] = {Tag = {}, Value = 0},
        ["法术穿透"] = {Tag = {}, Value = 0},
        ----------------------------------------------------------------
        -- 武器专精
        ["剑专精"] = {Tag = {}, Value = 0},
        ["单手剑专精"] = {Tag = {}, Value = 0},
        ["双手剑专精"] = {Tag = {}, Value = 0},
        ["锤专精"] = {Tag = {}, Value = 0},
        ["单手锤专精"] = {Tag = {}, Value = 0},
        ["双手锤专精"] = {Tag = {}, Value = 0},
        ["斧专精"] = {Tag = {}, Value = 0},
        ["单手斧专精"] = {Tag = {}, Value = 0},
        ["双手斧专精"] = {Tag = {}, Value = 0},
        ["匕首专精"] = {Tag = {}, Value = 0},
        ["长柄武器专精"] = {Tag = {}, Value = 0},
        ["法杖专精"] = {Tag = {}, Value = 0},
        ["魔杖专精"] = {Tag = {}, Value = 0},
        -- 护甲专精
        ["板甲专精"] = {Tag = {}, Value = 0},
        ["皮甲专精"] = {Tag = {}, Value = 0},
        ["布甲专精"] = {Tag = {}, Value = 0}
    }
end
-- ExtraAttributeComponents.Data = {
--     ["魔法抗性"] = {Tag = {}, Value = 0},
--     ["法术强度"] = {Tag = {}, Value = 0},
--     ["闪避"] = {Tag = {}, Value = 0},
--     ["格挡"] = {Tag = {}, Value = 0},
--     ["招架"] = {Tag = {}, Value = 0},
--     ["反弹"] = {Tag = {}, Value = 0},
--     ["幸运"] = {Tag = {}, Value = 0},
--     ["体质"] = {Tag = {}, Value = 0},
--     ["感知"] = {Tag = {}, Value = 0},
--     ["魅力"] = {Tag = {}, Value = 0},
--     ------------------------------------------------------------
--     ["精神"] = {Tag = {}, Value = 0},
--     ["耐力"] = {Tag = {}, Value = 0},
--     ["命中"] = {Tag = {}, Value = 0},
--     ["韧性"] = {Tag = {}, Value = 0},
--     ["急速"] = {Tag = {}, Value = 0},
--     ["精准"] = {Tag = {}, Value = 0},
--     -------------------------------------------------------------
--     ["伤害减免"] = {Tag = {}, Value = 0},
--     ["物理伤害吸收"] = {Tag = {}, Value = 0},
--     ["法术伤害吸收"] = {Tag = {}, Value = 0},
--     ["火焰抗性"] = {Tag = {}, Value = 0},
--     ["冰霜抗性"] = {Tag = {}, Value = 0},
--     ["暗影抗性"] = {Tag = {}, Value = 0},
--     ["神圣抗性"] = {Tag = {}, Value = 0},
--     ["邪能抗性"] = {Tag = {}, Value = 0},
--     ["毒素抗性"] = {Tag = {}, Value = 0},
--     ["雷电抗性"] = {Tag = {}, Value = 0},
--     ["自然抗性"] = {Tag = {}, Value = 0},
--     ----------------------------------------------------------------
--     ["吸血"] = {Tag = {}, Value = 0},
--     ["法术吸血"] = {Tag = {}, Value = 0},
--     ["反馈"] = {Tag = {}, Value = 0},
--     ["无视防御"] = {Tag = {}, Value = 0},
--     ["装备爆率"] = {Tag = {}, Value = 0},
--     ["法术穿透"] = {Tag = {}, Value = 0}
-- }
return ExtraAttributeComponents
