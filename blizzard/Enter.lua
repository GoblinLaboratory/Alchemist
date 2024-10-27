-- 任意单位进入地图
local CJ = require "jass.common"
local BJ = require "blizzard"
require "blizzard.Code"
local API = require 'library.API'

local trig_Enter = CJ.CreateTrigger()
BJ.TriggerRegisterEnterRectSimple(trig_Enter, BJ.GetPlayableMapRect())
CJ.TriggerAddCondition(trig_Enter, CJ.Condition(function() return true end))

CJ.TriggerAddAction(trig_Enter, function()
    CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, '有单位进入地图')
    -- EventTemplate.AddUnit:Fire(CJ.GetTriggerUnit())
    -- 触发单位
    local u = CJ.GetTriggerUnit()
    if CJ.IsUnitType(u, CJ.UNIT_TYPE_HERO) then
        -- statements
        Code.AddEquipmentBar(u)
        API.CreatUnit(u, true)
    else
        API.CreatUnit(u, false)
    end
    -- 创建单位伤害触发器
    local rTrg = CJ.CreateTrigger()
    CJ.TriggerRegisterUnitEvent(rTrg, CJ.GetTriggerUnit(), CJ.EVENT_UNIT_DAMAGED)
    -- 添加条件
    CJ.TriggerAddCondition(rTrg, CJ.Condition(function() return true end))

    CJ.TriggerAddAction(rTrg, function()
        -- 发送消息
        --EventTemplate.AnyUnitDamaged:Fire() -- 发送消息
        --print("fasongxiaoxi")
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
