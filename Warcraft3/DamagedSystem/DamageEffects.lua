-- 发动效果
local CJ = require "jass.common"
require "math"
local BJ = require "blizzard"
-- local japi = require "jass.japi"
require "EntityComponentSystem\\Method\\Maths"
require "EntityComponentSystem\\Event\\EventTemplate"
Blizzard = require "EntityComponentSystem\\Warcraft\\Blizzard"
require "EntityComponentSystem\\Warcraft\\Skill"
DamageEffects = {}
function DamageEffects.Run(v, u, s)
    -- statements
    -- 战士嗜血
    if CJ.GetUnitAbilityLevel(s, Maths.GetId("TXSX")) > 0 then
        -- statements
        if CJ.GetUnitAbilityLevel(s, Maths.GetId("RZSX")) == 2 then
            -- statements
            local l = v * 1.5
            Skill["吸血"](l)
            CJ.UnitRemoveAbility(s, Maths.GetId("TXSX"))
        elseif CJ.GetUnitAbilityLevel(s, Maths.GetId("RZSX")) == 4 then
            -- statements
            if CJ.GetUnitState(s, CJ.UNIT_STATE_LIFE) <
                CJ.GetUnitState(s, CJ.UNIT_STATE_MAX_LIFE) * 0.2 then
                -- statements
                local l = v * 0.5 + CJ.GetUnitState(s, CJ.UNIT_STATE_MAX_LIFE) *
                              0.03
                Skill["吸血"](l)
                CJ.UnitRemoveAbility(s, Maths.GetId("TXSX"))
            else
                -- statements
                local l = v * 0.5
                Skill["吸血"](l)
                CJ.UnitRemoveAbility(s, Maths.GetId("TXSX"))
            end
        else
            local l = v * 0.5
            Skill["吸血"](l)
            CJ.UnitRemoveAbility(s, Maths.GetId("TXSX"))
        end
    end
end
return DamageEffects
