local CJ = require 'jass.common'
local BJ = require 'blizzard'
require "Warcraft3\\library\\RoleManager"
-- 野怪刷新系统
MonsterRefresh = {}
MonsterRefresh.Data = {}
MonsterRefresh.DanWeZu = nil -- 单位组
-- 选取已存在的全图野怪 玩家12
function MonsterRefresh.SetGroup()
    -- statements
    -- BJ.ForGroupBJ(BJ.GetUnitsInRectMatching(BJ.GetPlayableMapRect(),
    --                                         CJ.Condition(function() end)),
    --               function() end)
    MonsterRefresh.DanWeZu = BJ.GetUnitsInRectMatching(BJ.GetPlayableMapRect(),
                                                       CJ.Condition(
                                                           function()
            return CJ.GetOwningPlayer(CJ.GetFilterUnit()) == CJ.Player(11) and
                       CJ.IsHeroUnitId(CJ.GetUnitTypeId(CJ.GetFilterUnit())) ==
                       false
        end))
end
-- 储存单位信息
function MonsterRefresh.SaveUnitData()
    -- statements
    BJ.ForGroupBJ( MonsterRefresh.DanWeZu, function()
        local u = CJ.GetEnumUnit()
        local d = {}
        d["单位"] = u
        d["类型"] = CJ.GetUnitTypeId(u)
        d["位置"] = CJ.GetUnitLoc(u)
        d["方向"] = CJ.GetUnitFacing(u)
        RoleManager.SetRole(u)
        print(CJ.GetUnitName(u))
        CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, CJ.GetUnitName(u))
        table.insert(MonsterRefresh.Data,d)
    end)
end
function MonsterRefresh.Inti()
    -- statements
    MonsterRefresh.SetGroup()
    MonsterRefresh.SaveUnitData()
end
function MonsterRefresh.GetUnit(u)
    -- statements
    for i, _ in ipairs(MonsterRefresh.Data) do
        if MonsterRefresh.Data[i]["单位"] == u then
            -- statements
            return MonsterRefresh.Data[i]
        end
    end
    return nil
end
return MonsterRefresh