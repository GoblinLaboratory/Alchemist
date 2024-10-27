-- 玩家输入命令
local CJ = require "jass.common"
local BJ = require "blizzard"
local japi = require 'jass.japi'
require "EntityComponentSystem\\API"
require "math"
local trig_Com = CJ.CreateTrigger()
CJ.TriggerRegisterPlayerChatEvent(trig_Com, CJ.Player(0), "-get", false)

CJ.TriggerAddCondition(trig_Com, CJ.Condition(function() return true end))

CJ.TriggerAddAction(trig_Com, function()
    -- local ev = EventTemplate:Instance()
    CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, "DamagedType[i].Name")
    --
    local id = BJ.GetConvertedPlayerId(CJ.GetTriggerPlayer())
    local str = string.sub(CJ.GetEventPlayerChatString(), 5, -1) -- CJ.GetEventPlayerChatString()
    if str == "护甲" then
        -- statements
        -- 获取玩家
        local p = API.GetPlayer(id)
        CJ.DisplayTextToPlayer(CJ.Player(id - 1), 0, 0, "护甲为" ..
        math.ceil(japi.GetUnitState(p["玩家属性"]["当前选择英雄ID"]["Value"],
                                                     CJ.ConvertUnitState(0x20))))
    end
    if str == "基础伤害" then
        -- statements
        -- 获取玩家
        local p = API.GetPlayer(id)
        CJ.DisplayTextToPlayer(CJ.Player(id - 1), 0, 0, "基础伤害" ..
        math.ceil(japi.GetUnitState(p["玩家属性"]["当前选择英雄ID"]["Value"],
                                                     CJ.ConvertUnitState(0x12))))
    end
    if str == "附加伤害" then
        -- statements
        -- 获取玩家
        local p = API.GetPlayer(id)
        CJ.DisplayTextToPlayer(CJ.Player(id - 1), 0, 0, "附加伤害" ..
        math.ceil(japi.GetUnitState(p["玩家属性"]["当前选择英雄ID"]["Value"],
                                                     CJ.ConvertUnitState(0x13))))
    end
    if str == "攻击力" then
        -- statements
        -- 获取玩家
        local p = API.GetPlayer(id)
        local g =  japi.GetUnitState(p["玩家属性"]["当前选择英雄ID"]["Value"],
        CJ.ConvertUnitState(0x12)) +  japi.GetUnitState(p["玩家属性"]["当前选择英雄ID"]["Value"],
        CJ.ConvertUnitState(0x13))
        CJ.DisplayTextToPlayer(CJ.Player(id - 1), 0, 0, "攻击力" ..
        math.ceil(g))
    end
    if str == "移动速度" then
        -- statements
        -- 获取玩家
        local p = API.GetPlayer(id)
        CJ.DisplayTextToPlayer(CJ.Player(id - 1), 0, 0, "附加伤害" ..
        math.ceil(CJ.GetUnitMoveSpeed(p["玩家属性"]["当前选择英雄ID"]["Value"])))
    end
end)
