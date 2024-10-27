-- 地图初始化
local CJ = require "jass.common"
local BJ = require "blizzard"
-- local japi = require "jass.japi"
require "Warcraft3\\library\\Library"
require "EntityComponentSystem\\Event\\EventManager"
require "Warcraft3\\library\\Bonus"
local Init = require "EntityComponentSystem\\initialization"
require "Warcraft3\\library\\MonsterRefresh"
local trigint = CJ.CreateTrigger()

BJ.TriggerRegisterTimerEventSingle(trigint, 1.1)
CJ.TriggerAddCondition(trigint, CJ.Condition(
                           function()
        -- CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, "初始化，请不要进行任何操作")
        return true
    end))
CJ.TriggerAddAction(trigint, function()

    -- CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, "地图初始化。。。")
    -- CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, "加载事件系统")
    -- 初始化ECS系统
    Init.Int()
    -- 初始化事件系统
    -- local ev = EventManager:Instance()
    EventManager:Instance()
    -- 初始化万能属性系统
    local bu = Bonus:Instance()
    bu:Int()
    CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, "加载马甲系统")
    -- 装备马甲
    Library.CreateVest()
    -- 创建天赋马甲
    Library.CreateUIVest()
    -- 初始化野怪刷新系统
    MonsterRefresh.Inti()
end)
