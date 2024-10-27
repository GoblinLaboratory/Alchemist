local CJ = require 'jass.common'
local BJ = require 'blizzard'
require "Warcraft3\\UI\\MainInterface"
require "EntityComponentSystem\\API"
require "EntityComponentSystem\\Method\\Maths"
json = require "Lib\\json\\json"
local trig_Control = CJ.CreateTrigger()

BJ.TriggerRegisterPlayerSelectionEventBJ(trig_Control, CJ.Player(0), true)
BJ.TriggerRegisterPlayerSelectionEventBJ(trig_Control, CJ.Player(1), true)
BJ.TriggerRegisterPlayerSelectionEventBJ(trig_Control, CJ.Player(2), true)
BJ.TriggerRegisterPlayerSelectionEventBJ(trig_Control, CJ.Player(3), true)
BJ.TriggerRegisterPlayerSelectionEventBJ(trig_Control, CJ.Player(4), true)
BJ.TriggerRegisterPlayerSelectionEventBJ(trig_Control, CJ.Player(5), true)
BJ.TriggerRegisterPlayerSelectionEventBJ(trig_Control, CJ.Player(6), true)
BJ.TriggerRegisterPlayerSelectionEventBJ(trig_Control, CJ.Player(7), true)
BJ.TriggerRegisterPlayerSelectionEventBJ(trig_Control, CJ.Player(8), true)
BJ.TriggerRegisterPlayerSelectionEventBJ(trig_Control, CJ.Player(9), true)
---------------

CJ.TriggerAddCondition(trig_Control, CJ.Condition(
                           function()

        -- local id = BJ.GetConvertedPlayerId(
        --                CJ.GetOwningPlayer(CJ.GetTriggerUnit())) -- 触发玩家ID
        -- CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0,CJ.GetUnitName(CJ.GetTriggerUnit()))
        print("iiiiiiiiiiiii")
        return (CJ.GetUnitTypeId(CJ.GetTriggerUnit()) == Maths.GetId('hsz3'))
    end))

CJ.TriggerAddAction(trig_Control, function()

    local u = CJ.GetTriggerUnit() -- 触发单位
    -- local id = BJ.GetConvertedPlayerId(CJ.GetTriggerPlayer()) -- 触发玩家ID
    -- local p = API.GetPlayer(id)
    print("iiiiiiiiiiiii")
    MainInterface.Fire(u)
    -- p["玩家属性"]["界面状态"] = "主界面"
end)

local trig_MainControl = CJ.CreateTrigger()
BJ.TriggerRegisterAnyUnitEventBJ(trig_MainControl,
                                 CJ.EVENT_PLAYER_UNIT_ISSUED_ORDER)
CJ.TriggerAddCondition(trig_MainControl, CJ.Condition(
                           function()
        -- 主手武器 A
        return BJ.GetIssuedOrderIdBJ() == BJ.String2OrderIdBJ('wispharvest') or
                   BJ.GetIssuedOrderIdBJ() == BJ.String2OrderIdBJ('windwalk') or
                   BJ.GetIssuedOrderIdBJ() == BJ.String2OrderIdBJ('whirlwind') or
                   BJ.GetIssuedOrderIdBJ() == BJ.String2OrderIdBJ('webon') or
                   BJ.GetIssuedOrderIdBJ() == BJ.String2OrderIdBJ('weboff') or
                   BJ.GetIssuedOrderIdBJ() == BJ.String2OrderIdBJ('web') or
                   BJ.GetIssuedOrderIdBJ() ==
                   BJ.String2OrderIdBJ('wateryminion') or
                   BJ.GetIssuedOrderIdBJ() ==
                   BJ.String2OrderIdBJ('waterlemental') or
                   BJ.GetIssuedOrderIdBJ() == BJ.String2OrderIdBJ('ward') or
                   BJ.GetIssuedOrderIdBJ() == BJ.String2OrderIdBJ('voodoo') or
                   BJ.GetIssuedOrderIdBJ() == BJ.String2OrderIdBJ('volcano') or
                   BJ.GetIssuedOrderIdBJ() ==
                   BJ.String2OrderIdBJ('unstableconcoction')
    end))
CJ.TriggerAddAction(trig_MainControl, function()
    local id = BJ.GetConvertedPlayerId(CJ.GetTriggerPlayer()) -- 触发玩家ID
    local p = API.GetPlayer(id)
    local Str = BJ.OrderId2StringBJ(BJ.GetIssuedOrderIdBJ())
    local u = CJ.GetTriggerUnit() -- 触发单位
    local zdy
    if (Str == 'wispharvest') then
        zdy = 1
    elseif (Str == 'windwalk') then
        zdy = 2
    elseif (Str == 'whirlwind') then
        zdy = 3
    elseif (Str == 'webon') then
        zdy = 4
    elseif (Str == 'weboff') then
        zdy = 5
    elseif (Str == 'web') then
        zdy = 6
    elseif (Str == 'wateryminion') then
        zdy = 7
    elseif (Str == 'waterlemental') then
        zdy = 8
    elseif (Str == 'ward') then
        zdy = 9
    elseif (Str == 'voodoo') then
        zdy = 10
    elseif (Str == 'volcano') then
        zdy = 11
    elseif (Str == 'unstableconcoction') then
        zdy = 12
    else
        zdy = 0
    end
    -- CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, zdy)
    if (zdy == 1) then
        if p["玩家属性"]["界面状态"]["Value"] == "新建种族" then
            -- statements
            -- MainInterface.Race(u)
            MainInterface.Vocation(u, 1)
            print("...1")
        elseif p["玩家属性"]["界面状态"]["Value"] == "新建-职业" then
            -- statements
            -- MainInterface.Race(u)
            MainInterface.CreatHero(u, 1)
        else
            print("1")
        end
        print("1")
    end
    if (zdy == 2) then
        if p["玩家属性"]["界面状态"]["Value"] == "新建种族" then
            -- statements
            -- MainInterface.Race(u)
            MainInterface.Vocation(u, 2)
            print("...1")
        elseif p["玩家属性"]["界面状态"]["Value"] == "新建-职业" then
            -- statements
            -- MainInterface.Race(u)
            MainInterface.CreatHero(u, 2)
        else
            print("1")
        end
        print(2)
    end
    if (zdy == 3) then
        if p["玩家属性"]["界面状态"]["Value"] == "新建种族" then
            -- statements
            -- MainInterface.Race(u)
            MainInterface.Vocation(u, 3)
            print("...1")
        elseif p["玩家属性"]["界面状态"]["Value"] == "新建-职业" then
            -- statements
            -- MainInterface.Race(u)
            MainInterface.CreatHero(u, 3)
        else
            print("1")
        end
        print(3)
    end
    if (zdy == 4) then
        if p["玩家属性"]["界面状态"]["Value"] == "新建种族" then
            -- statements
            -- MainInterface.Race(u)
            MainInterface.Vocation(u, 4)
            print("...1")
        elseif p["玩家属性"]["界面状态"]["Value"] == "新建-职业" then
            -- statements
            -- MainInterface.Race(u)
            MainInterface.CreatHero(u, 4)
        else
            print("1")
        end
        print(4)
    end
    if (zdy == 5) then
        if p["玩家属性"]["界面状态"]["Value"] == "新建种族" then
            -- statements
            -- MainInterface.Race(u)
            MainInterface.Vocation(u, 5)
            print("...1")
        elseif p["玩家属性"]["界面状态"]["Value"] == "新建-职业" then
            -- statements
            -- MainInterface.Race(u)
            MainInterface.CreatHero(u, 5)
        else
            print("1")
        end
        print(5)
    end
    if (zdy == 6) then
        if p["玩家属性"]["界面状态"]["Value"] == "新建种族" then
            -- statements
            -- MainInterface.Race(u)
            MainInterface.Vocation(u, 6)
            print("...1")
        elseif p["玩家属性"]["界面状态"]["Value"] == "新建-职业" then
            -- statements
            -- MainInterface.Race(u)
            MainInterface.CreatHero(u, 6)
        else
            print("1")
        end
        print(6)
    end
    if (zdy == 7) then
        if p["玩家属性"]["界面状态"]["Value"] == "新建种族" then
            -- statements
            -- MainInterface.Race(u)
            MainInterface.Vocation(u, 7)
            print("...1")
        elseif p["玩家属性"]["界面状态"]["Value"] == "新建-职业" then
            -- statements
            -- MainInterface.Race(u)
            MainInterface.CreatHero(u, 7)
        else
            print("1")
        end
        print(7)
    end
    if (zdy == 8) then
        if p["玩家属性"]["界面状态"]["Value"] == "新建种族" then
            -- statements
            -- MainInterface.Race(u)
            MainInterface.Vocation(u, 8)
            print("...1")
        elseif p["玩家属性"]["界面状态"]["Value"] == "新建-职业" then
            -- statements
            -- MainInterface.Race(u)
            MainInterface.CreatHero(u, 8)
        else
            print("1")
        end
        print(8)
    end
    --
    if (zdy == 9) then
        if p["玩家属性"]["界面状态"]["Value"] == "主界面" then
            -- statements
            MainInterface.Race(u)
        elseif p["玩家属性"]["界面状态"]["Value"] == "新建种族" then
            -- statements
            -- MainInterface.Race(u)
            print("9-1")
            MainInterface.Vocation(u, 9)
        elseif p["玩家属性"]["界面状态"]["Value"] == "新建-职业" then
            -- statements
            -- MainInterface.Race(u)
            MainInterface.CreatHero(u, 9)
            print("9-2")
        else
            print("1")
        end
        print(9)
    end
    if (zdy == 10) then
        if p["玩家属性"]["界面状态"]["Value"] == "新建种族" then
            -- statements
            -- MainInterface.Race(u)
            MainInterface.Vocation(u, 10)
            print("...1")
        elseif p["玩家属性"]["界面状态"]["Value"] == "新建-职业" then
            -- statements
            -- MainInterface.Race(u)
            MainInterface.CreatHero(u, 10)
        else
            print("1")
        end
        print(10)
    end
    if (zdy == 11) then
        if p["玩家属性"]["界面状态"]["Value"] == "新建种族" then
            -- statements
            -- MainInterface.Race(u)
            MainInterface.Vocation(u, 11)
            print("...1")
        elseif p["玩家属性"]["界面状态"]["Value"] == "新建-职业" then
            -- statements
            -- MainInterface.Race(u)
            MainInterface.CreatHero(u, 11)
        else
            print("1")
        end
        print(11)
    end
    if (zdy == 12) then
        if p["玩家属性"]["界面状态"]["Value"] == "新建种族" then
            -- statements
            MainInterface.Fire(u)
        elseif p["玩家属性"]["界面状态"]["Value"] == "新建-职业" then
            -- statements
            MainInterface.Race(u)
        end
        print(12)
    end
end)
