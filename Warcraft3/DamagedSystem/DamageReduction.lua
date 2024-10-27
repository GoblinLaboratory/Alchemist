-- 伤害减免
local CJ = require "jass.common"
require "math"
local BJ = require "blizzard"
--local japi = require "jass.japi"
require "EntityComponentSystem\\Method\\Maths"
require "EntityComponentSystem\\Event\\EventTemplate"
Blizzard = require "EntityComponentSystem\\Warcraft\\Blizzard"
require "EntityComponentSystem\\Warcraft\\Skill"
DamageReduction = {}

function DamageReduction.GetDamageValue(v,u,s)
    -- statements
    local DamageValue = v
    -- 计算护甲
    if 0 ~= japi.EXGetEventDamageData(1) then
        -- 物理伤害
        -- 计算护甲
        local hj = japi.GetUnitState(u, CJ.ConvertUnitState(0x20)) -- 获取护甲
        -- Damage = Damage*Damage/(Damage+hj*3)
        -- 战士破甲
        if BJ.UnitHasBuffBJ(u, 'MLG4') then
            -- statements
            local i = math.random(1, 100)
            if i < 30 then
                -- statements
                DamageValue = DamageValue * 1
            else
                DamageValue = DamageValue * DamageValue /
                              (DamageValue + hj * 3)
            end
        end
    else
        --魔法伤害
        DamageValue = DamageValue * 0.75
    end
    -- 战士顶盾
    if CJ.GetUnitAbilityLevel(u, Maths.GetId("ZSDD")) > 0 then
        -- statements
        if CJ.GetUnitAbilityLevel(u, Maths.GetId("ZSDD")) == 1 then
            -- statements
            DamageValue = DamageValue * 0.7
        elseif CJ.GetUnitAbilityLevel(u, Maths.GetId("ZSDD")) == 2 then
            -- statements
            DamageValue = DamageValue * 0.5
        elseif CJ.GetUnitAbilityLevel(u, Maths.GetId("ZSDD")) == 3 then
            -- statements
            local i = math.random(1, 100)
            -- 格挡
            if i < 30 then
                -- statements
                DamageValue = 0
            else
                DamageValue = DamageValue * 0.7
            end
        else
            DamageValue = DamageValue * 0.7
        end
    end
    -- 战士怒吼
    if BJ.UnitHasBuffBJ(s, 'PDNH') then
        -- statements
        local i = math.random(1, 100)
        if i < 25 then
            -- statements
            DamageValue = 0
        end
    end
    -- 闪避
    if BJ.UnitHasBuffBJ(s, 'MLG3') then
        -- statements
        print("无法闪避")
    else
        print("可以闪避")
    end
    return DamageValue
end
return DamageReduction