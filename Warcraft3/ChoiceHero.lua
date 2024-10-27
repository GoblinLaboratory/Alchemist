-- 玩家选择使用的英雄
local CJ = require "jass.common"
local BJ = require "blizzard"
require "EntityComponentSystem\\Method\\Maths"
local trig_ChoiceHero = CJ.CreateTrigger()
BJ.TriggerRegisterAnyUnitEventBJ(trig_ChoiceHero, CJ.EVENT_PLAYER_UNIT_SELL)
CJ.TriggerAddCondition(trig_ChoiceHero, CJ.Condition(
                           function()
        -- |xxxx|不是一个标准的lua语法，而是ydwe lua的扩展语法，值和jass里'xxxx'一样
        -- 注意，在lua里'xxxx'是一个字符串，和"xxxx"一样。
        if (CJ.IsUnitType(CJ.GetSoldUnit(), CJ.UNIT_TYPE_HERO) == true and
            CJ.GetUnitTypeId(CJ.GetBuyingUnit()) == Maths.GetId("hsz1")) then
            return true
        else
            return false
        end
    end))

CJ.TriggerAddAction(trig_ChoiceHero, function()
    local BU = CJ.GetBuyingUnit() -- 购买者
    BJ.ExplodeUnitBJ(BU) -- 使单位爆炸
end)
