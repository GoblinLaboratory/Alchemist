-- 技能触发
local CJ = require 'jass.common'
local BJ = require 'blizzard'
require "blizzard\\System\\MonsterRefresh"
require "blizzard\\System\\RoleManager"
local trig_MonsterRefreshTrigger = CJ.CreateTrigger()

BJ.TriggerRegisterAnyUnitEventBJ(trig_MonsterRefreshTrigger,
                                 CJ.EVENT_PLAYER_UNIT_DEATH)
CJ.TriggerAddCondition(trig_MonsterRefreshTrigger, CJ.Condition(
                           function()
        local u = CJ.GetTriggerUnit() -- 触发单位
        return CJ.GetOwningPlayer(u) == CJ.Player(11) and
                   CJ.IsHeroUnitId(CJ.GetUnitTypeId(u)) == false
    end))
CJ.TriggerAddAction(trig_MonsterRefreshTrigger, function()
    local u = CJ.GetTriggerUnit() -- 触发单位
    local o = MonsterRefresh.GetUnit(u)
    if o ~= nil  then
        -- statements
        local t = CJ.CreateTimer()
        local i = 0
        CJ.TimerStart(t, 1, true, function()
            if i > 30 then
                -- 计时器到期 创建单位
                local s = CJ.CreateUnitAtLoc(CJ.Player(11), o["类型"],
                                             o["位置"], o["方向"])
                o["单位"] = s
                RoleManager.SetRole(s)
                CJ.DestroyTimer(t)
            else
                i = i + 1
            end
        end)
    end
end)
