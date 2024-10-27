-- 地图初始化
local CJ = require "jass.common"
local BJ = require "blizzard"
local API = require 'library.API'
require "blizzard.System.UI.MainInterface"

-- 创建触发器
local Trigint = CJ.CreateTrigger()
-- 触发事件，当游戏开始十秒
BJ.TriggerRegisterTimerEventSingle(Trigint, 10.00)

CJ.TriggerAddCondition(Trigint, CJ.Condition(
                           function()
        CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, "初始化结束，请不要进行任何操作")
        return true
    end))

    CJ.TriggerAddAction(Trigint, function()
        -- CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, "地图初始化。。。")
        -- CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, "加载事件系统")
        for i=10,1,-1 do
            local player = API.GetPlayer(i)
            local com = player:getComponent("PlayerComponents")
            com:SetData("游戏状态", "初始化")
            local mj = com:GetData("UI图标")
            MainInterface.StartSence(mj)
            --MainInterface.ChoiceHero(mj)
            BJ.SelectUnitForPlayerSingle(mj, CJ.Player(i- 1))
            print(i)
        end
    end)

-- StartScene = {}

-- function StartScene.Start()
--     -- statements
--     CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0,
--                            "初始化结束，请不要进行任何操作")
--     for i = 1, 10 do
--         if CJ.GetPlayerController(CJ.Player(i - 1)) == CJ.MAP_CONTROL_USER then
--             -- statements
--             local player = API.GetPlayer(i)
--             local com = player:getComponent("PlayerComponents")
--             local mj = com:GetData("UI图标")
--             -- if (CJ.GetLocalPlayer() == CJ.Player(i - 1)) then

--             --     CJ.ClearSelection()
--             --     CJ.SelectUnit(mj, true)
--             -- end
--             BJ.SelectUnitForPlayerSingle(mj, CJ.Player(i - 1))
--             -- print(i)
--         end
--     end
-- end

-- -- function StartScene.StartPlayer(i)
-- --     -- statements
-- --     local player = API.GetPlayer(i)
-- --     local com = player:getComponent("PlayerComponents")
-- --     local mj = com:GetData("UI图标")
-- --     BJ.SelectUnitForPlayerSingle(mj, CJ.Player(i - 1))
-- -- end

-- return StartScene
