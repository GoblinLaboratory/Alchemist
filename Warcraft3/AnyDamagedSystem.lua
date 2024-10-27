local CJ = require "jass.common"
local BJ = require "blizzard"
require "EntityComponentSystem\\Method\\Maths"
require "EntityComponentSystem\\Event\\EventTemplate"
require "Warcraft3\\library\\Library"
require "EntityComponentSystem\\API"
-- 任意单位伤害

local trig_AnyDamagedSystem = CJ.CreateTrigger()

-- 任意单位进入地图
BJ.TriggerRegisterEnterRectSimple(trig_AnyDamagedSystem, BJ.GetPlayableMapRect())

CJ.TriggerAddCondition(trig_AnyDamagedSystem,
                       CJ.Condition(function() return true end))

CJ.TriggerAddAction(trig_AnyDamagedSystem, function()
    CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, '注册伤害事件')
    -- EventTemplate.AddUnit:Fire(CJ.GetTriggerUnit())
    API.AddUnit(CJ.GetTriggerUnit())
    -- 创建一个触发器
    local rTrg = CJ.CreateTrigger()
    Library.AddEquipmentBar(CJ.GetTriggerUnit())
    CJ.TriggerRegisterUnitEvent(rTrg, CJ.GetTriggerUnit(), CJ.EVENT_UNIT_DAMAGED)
    -- 添加条件
    CJ.TriggerAddCondition(rTrg, CJ.Condition(function() return true end))

    CJ.TriggerAddAction(rTrg, function()
        -- 发送消息
        EventTemplate.AnyUnitDamaged:Fire() -- 发送消息
        print("fasongxiaoxi")
        -- CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, '发送消息')
        -- damageType = CJ.ConvertDamageType(japi.EXGetEventDamageData(4))
        -- CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, '单位受到伤害')
        --    if 0 ~= japi.EXGetEventDamageData(2) then
        --        CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, '攻击伤害')
        --    else
        --        CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, '不是攻击伤害')
        --    end
        --       if 0 ~= japi.EXGetEventDamageData(1) then
        --           CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, '物理伤害')
        --      else
        --           CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, '魔法伤害')
        --       end
        --    if 0 ~= japi.EXGetEventDamageData(3) then
        --        CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, '远程伤害')
        --    else
        --        CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, '近战伤害')
        --    end
    end)

end)
