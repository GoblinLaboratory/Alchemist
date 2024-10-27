-- 技能触发
local CJ = require 'jass.common'
local BJ = require 'blizzard'
require "EntityComponentSystem\\Method\\Maths"
require "math"
-- local japi = require 'jass.japi'
require "EntityComponentSystem\\Warcraft\\Blizzard"
require "EntityComponentSystem\\Warcraft\\Algorithm\\Charge"
require "EntityComponentSystem\\Warcraft\\Skill"
-- 人族战士  顶盾
local trig_RenzuZhanshiDD = CJ.CreateTrigger()
BJ.TriggerRegisterAnyUnitEventBJ(trig_RenzuZhanshiDD,
                                 CJ.EVENT_PLAYER_UNIT_ISSUED_ORDER)
CJ.TriggerAddCondition(trig_RenzuZhanshiDD,
                       CJ.Condition(function() return true end))
CJ.TriggerAddAction(trig_RenzuZhanshiDD, function()
    local u = CJ.GetTriggerUnit() -- 触发单位
    if CJ.IsUnitType(u, CJ.UNIT_TYPE_HERO) == true then
        if BJ.GetIssuedOrderIdBJ() == BJ.String2OrderIdBJ('defend') then
            CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, '举盾')
            -- UM:GetUnit(u).defend = true
            Blizzard.AddBuff(u, "ZSDD")
        end
        if BJ.GetIssuedOrderIdBJ() == BJ.String2OrderIdBJ('undefend') then
            CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, '落盾')
            -- UM:GetUnit(u).defend = true
            Blizzard.RemoveBuff(u, "ZSDD")
        end
    end
end)
-- 冲锋
local trig_RenzuZhanshiCF = CJ.CreateTrigger()
BJ.TriggerRegisterAnyUnitEventBJ(trig_RenzuZhanshiCF,
                                 CJ.EVENT_PLAYER_UNIT_SPELL_EFFECT)
CJ.TriggerAddCondition(trig_RenzuZhanshiCF, CJ.Condition(
                           function()
        return CJ.GetSpellAbilityId() == Maths.GetId('ZScf')
    end))
CJ.TriggerAddAction(trig_RenzuZhanshiCF, function()
    print("chongfeng")
    local u = CJ.GetTriggerUnit() -- 触发单位
    local s = CJ.GetSpellTargetUnit() -- 技能施放目标
    local l = 800 --    距离
    local c = Charge:new(nil, u, s, l, 0.03,
                         "Abilities\\Spells\\NightElf\\FaerieDragonInvis\\FaerieDragon_Invis.mdl")
    c:Fire()
end)
-- 嗜血
local trig_RenzuZhanshiShiXue = CJ.CreateTrigger()
BJ.TriggerRegisterAnyUnitEventBJ(trig_RenzuZhanshiShiXue,
                                 CJ.EVENT_PLAYER_UNIT_ATTACKED)
CJ.TriggerAddCondition(trig_RenzuZhanshiShiXue, CJ.Condition(
                           function()
        return
            CJ.GetUnitAbilityLevel(CJ.GetTriggerUnit(), Maths.GetId("RZSX")) > 0
    end))
CJ.TriggerAddAction(trig_RenzuZhanshiShiXue, function()
    -- print("chongfeng")
    local u = CJ.GetTriggerUnit() -- 触发单位
    local i = math.random(1, 100)
    if CJ.GetUnitAbilityLevel(u, Maths.GetId("TXSX")) > 0 then
        -- statements
        print("...")
    else
        if CJ.GetUnitAbilityLevel(u, Maths.GetId("RZSX")) == 3 then
            -- statements
            if i < 30 then
                -- statements
                -- 添加技能
                CJ.UnitAddAbility(u, Maths.GetId("TXSX"))
            end
        else
            if i < 16 then
                -- statements
                -- 添加技能
                CJ.UnitAddAbility(u, Maths.GetId("TXSX"))
            end
        end
    end
end)
-- 战士  斩杀
local trig_RenzuZhanshiZhanSha = CJ.CreateTrigger()
BJ.TriggerRegisterAnyUnitEventBJ(trig_RenzuZhanshiZhanSha,
                                 CJ.EVENT_PLAYER_UNIT_ATTACKED)
CJ.TriggerAddCondition(trig_RenzuZhanshiZhanSha, CJ.Condition(
                           function()
        return CJ.GetUnitAbilityLevel(CJ.GetAttacker(), Maths.GetId("RZZS")) > 0
    end))
CJ.TriggerAddAction(trig_RenzuZhanshiZhanSha, function()
    -- print("chongfeng")
    local u = CJ.GetTriggerUnit() -- 触发单位
    local g = CJ.GetAttacker()
    if CJ.GetUnitAbilityLevel(g, Maths.GetId("RZZS")) == 1 then
        -- statements
        if CJ.GetUnitState(u, CJ.UNIT_STATE_LIFE) <
            CJ.GetUnitState(u, CJ.UNIT_STATE_MAX_LIFE) * 0.15 then
            -- statements
            CJ.UnitDamageTarget(g, u, 10000, true, false, CJ.ATTACK_TYPE_NORMAL,
                                CJ.DAMAGE_DEFENSIVE, CJ.WEAPON_TYPE_WHOKNOWS)
        end
    elseif CJ.GetUnitAbilityLevel(g, Maths.GetId("RZZS")) == 2 then
        -- statements
        if CJ.GetUnitState(u, CJ.UNIT_STATE_LIFE) <
            CJ.GetUnitState(u, CJ.UNIT_STATE_MAX_LIFE) * 0.15 then
            -- statements
            CJ.UnitDamageTarget(g, u, 10000, true, false, CJ.ATTACK_TYPE_NORMAL,
                                CJ.DAMAGE_DEFENSIVE, CJ.WEAPON_TYPE_WHOKNOWS)
            local s = CJ.CreateUnitAtLoc(CJ.GetOwningPlayer(g),
                                         Maths.GetId('jnmj'), CJ.GetUnitLoc(u),
                                         0)
            CJ.ShowUnit(s, false)
            CJ.UnitAddAbility(s, Maths.GetId('SBKD'))
            --CJ.SetUnitAbilityLevel(s, Maths.GetId('SBKD'), 1)
            CJ.UnitApplyTimedLife(s, Maths.GetId('BHwe'), 1.00)
            CJ.IssueTargetOrder(s, "bloodlust", g)
        end
    elseif CJ.GetUnitAbilityLevel(g, Maths.GetId("RZZS")) == 3 then
        if CJ.GetUnitState(u, CJ.UNIT_STATE_LIFE) <
            CJ.GetUnitState(u, CJ.UNIT_STATE_MAX_LIFE) * 0.15 then
            -- statements
            CJ.UnitDamageTarget(g, u, 10000, true, false, CJ.ATTACK_TYPE_NORMAL,
                                CJ.DAMAGE_DEFENSIVE, CJ.WEAPON_TYPE_WHOKNOWS)
            Skill["治疗"](g, CJ.GetUnitState(u, CJ.CJ.UNIT_STATE_MAX_LIFE) *
                                0.25)
        end
    else
        if CJ.GetUnitState(u, CJ.UNIT_STATE_LIFE) <
            CJ.GetUnitState(u, CJ.UNIT_STATE_MAX_LIFE) * 0.25 then
            -- statements
            CJ.UnitDamageTarget(g, u, 10000, true, false, CJ.ATTACK_TYPE_NORMAL,
                                CJ.DAMAGE_DEFENSIVE, CJ.WEAPON_TYPE_WHOKNOWS)
        end
    end
end)
