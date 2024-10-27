-- 经验系统
local CJ = require 'jass.common'
local BJ = require 'blizzard'
local trigExp = CJ.CreateTrigger()

BJ.TriggerRegisterAnyUnitEventBJ(trigExp, CJ.EVENT_PLAYER_UNIT_DEATH)

CJ.TriggerAddCondition(trigExp, CJ.Condition(
                           function()
        return ((CJ.GetUnitRace(CJ.GetTriggerUnit()) == CJ.ConvertRace(8)))
    end))
CJ.TriggerAddAction(trigExp, function()
    -- local DanWeiZu = CJ.CreateGroup()
    -- local DanWeiZu = BJ.GetUnitsInRangeOfLocMatching(Global.exparea,
    --                                                  CJ.GetUnitLoc(
    --                                                      CJ.TriggerUnit),
    --                                                  CJ.Condition(
    --                                                      function()
    --         return CJ.IsUnitEnemy(CJ.GetFilterUnit(),
    --                               CJ.GetOwningPlayer(CJ.TriggerUnit)) == true and
    --                    CJ.IsUnitType(CJ.GetEnumUnit(), CJ.UNIT_TYPE_STRUCTURE) ==
    --                    false
    --     end))
    --     BJ.ForGroupBJ(DanWeiZu, function()
    --         local x = CJ.GetEnumUnit()
    --         CJ.AddHeroXP(x, 1000, true)
    --     end)
    BJ.ForGroupBJ(BJ.GetUnitsInRangeOfLocMatching(512, CJ.GetUnitLoc(
                                                      CJ.GetTriggerUnit()),
                                                  CJ.Condition(
                                                      function()
            return
                CJ.IsHeroUnitId(CJ.GetUnitTypeId(CJ.GetFilterUnit())) == true and
                    CJ.IsUnitEnemy(CJ.GetFilterUnit(),
                                   CJ.GetOwningPlayer(CJ.GetTriggerUnit())) ==
                    true and
                    CJ.GetUnitState(CJ.GetFilterUnit(), CJ.UNIT_STATE_LIFE) > 0
        end)), function()
        local x = CJ.GetEnumUnit()
        CJ.AddHeroXP(x, 1000, true)
    end)
end)
