local CJ = require "jass.common"
local BJ = require "blizzard"
local API = require 'library.API'
require "blizzard.System.UI.MainInterface"
-- 职业选择界面
ChoiceHeroInterface = {}
function  ChoiceHeroInterface.Chick(u,n)
    local id = BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(u)) -- 触发玩家ID
    local player = API.GetPlayer(id)
    local com = player:getComponent("PlayerComponents")
    if (n == 12) then
        MainInterface.StartSence(u)
        com:SetData("界面状态", "初始界面")
    end
end
return ChoiceHeroInterface