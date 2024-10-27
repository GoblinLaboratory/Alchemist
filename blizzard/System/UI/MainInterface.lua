-- 地图初始化
local CJ = require "jass.common"
local BJ = require "blizzard"
local API = require 'library.API'

require "blizzard.System.UI.UI"
require "blizzard.Data.Data"
MainInterface = {}
function MainInterface.StartSence(u)
    -- statements
    -- 清空界面
    local id = BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(u)) -- 触发玩家ID
    local player = API.GetPlayer(id)
    UI.RemoveAbility(u, id)
    -- 新建角色
    UI.display(8, u, id, "创建新英雄", "为您创建一个新的英雄。",
               "ReplaceableTextures\\CommandButtons\\BTNSpell_New.blp")
    -- 储存
    UI.display(9, u, id, "存储英雄", "为您存储当前英雄。",
               "ReplaceableTextures\\CommandButtons\\BTNINV_Save.blp")
    -- 读取
    UI.display(10, u, id, "读取英雄",
               "为您读取一个新的存档英雄。",
               "ReplaceableTextures\\CommandButtons\\BTNINV_Read.blp")
    -- 删除
    UI.display(11, u, id, "删除英雄", "为您删除一个存档英雄。",
               "ReplaceableTextures\\CommandButtons\\BTNSpell_Remove.blp")
    -- 世界观
    UI.display(0, u, id, "上古封印  世界观",
               "为英雄的技能增加效果符文。",
               "ReplaceableTextures\\CommandButtons\\BTNStone.blp")
    -- 玩法说明
    UI.display(1, u, id, "玩法说明", "任务列表。",
               "ReplaceableTextures\\CommandButtons\\BTNSpy.blp")
    -- 福利
    UI.display(2, u, id, "福利", "生活技能。",
               "ReplaceableTextures\\CommandButtons\\BTNBarrel.blp")
    -- 福利
    UI.display(3, u, id, "制作者", "生活技能。",
               "ReplaceableTextures\\CommandButtons\\BTNBarrel.blp")
    -- player["玩家属性"]["界面状态"]["Value"] = "主界面"
    local com = player:getComponent("PlayerComponents")
    com:SetData("界面状态", "初始界面")
end
-- 选择职业界面
function MainInterface.ChoiceHero(u)
    local id = BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(u)) -- 触发玩家ID
    local player = API.GetPlayer(id)
    -- 清空界面
    UI.RemoveAbility(u, id)
    for i = 1, 9 do
        -- statements
        UI.display(i - 1, u, id, Data["职业"][i].Name,
                   Data["职业"][i].Explain, Data["职业"][i].Art)
    end
    -- 返回
    UI.display(11, u, id, "返回", "返回上一菜单",
               "ReplaceableTextures\\CommandButtons\\BTNCancel.blp")
    local com = player:getComponent("PlayerComponents")
    com:SetData("界面状态", "选择职业界面")
end
return MainInterface
