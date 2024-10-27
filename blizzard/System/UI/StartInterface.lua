-- 地图初始化
local CJ = require "jass.common"
local BJ = require "blizzard"
local API = require 'library.API'
require "blizzard.System.UI.MainInterface"

StartInterface = {}
function  StartInterface.Chick(u,n)
    local id = BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(u)) -- 触发玩家ID
    local player = API.GetPlayer(id)
    local com = player:getComponent("PlayerComponents")
    if (n == 9) then
        MainInterface.ChoiceHero(u)
        com:SetData("界面状态", "选择职业")
    end
end
return StartInterface