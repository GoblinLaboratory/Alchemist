require "blizzard.System.Bonus"
local CJ = require 'jass.common'
AttributeSystem = {
    Types = {
        ["护甲"] = 1,
        ["攻击力"] = 2,
        ["魔法回复速度"] = 3,
        ["生命回复速度"] = 4,
        ["攻击速度"] = 5,
        ["生命值"] = 6,
        ["魔法值"] = 7,
        ["力量"] = 8,
        ["敏捷"] = 9,
        ["智力"] = 10,
        ["移动速度"] = 11
    }
}
AttributeSystem.SetPrototype = function(u, Type, Number)
    -- if Number ~= 0 then
    --     local bu = Bonus:Instance()
    --     -- statements
    --     if AttributeSystem.Types[Type] < 11 then
    --         -- statements
    --         bu:UnitAddBonus(u, AttributeSystem.Types[Type], Number)
    --     elseif AttributeSystem.Types[Type] == 11 then
    --         -- statements
    --         bu:SetUnitSeed(u, Number)
    --     else
    --         print("无法添加这项属性。")
    --     end

    -- end
    if Number ~= 0 then
        -- statements
        if AttributeSystem.Types[Type] < 11 then
            local bu = Bonus:Instance()
            if Type == "力量" or Type == "敏捷" or Type == "智力" then
                -- statements
                if CJ.IsUnitType(u, CJ.UNIT_TYPE_HERO) == true then
                    -- statements
                    bu:UnitAddBonus(u, AttributeSystem.Types[Type], Number)
                end
            else
                bu:UnitAddBonus(u, AttributeSystem.Types[Type], Number)
            end
        elseif AttributeSystem.Types[Type] == 11 then
            local bu = Bonus:Instance()
            bu:SetUnitSeed(u, Number)
        else
            print("无法添加这项属性。")
        end
    end
end

return AttributeSystem
