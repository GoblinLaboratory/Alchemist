require "Warcraft3\\UI"
local BJ = require "blizzard"
local CJ = require "jass.common"
require "EntityComponentSystem\\API"
require "EntityComponentSystem\\Warcraft\\Data\\Race"
require "EntityComponentSystem\\Warcraft\\Data\\Hero"
MainInterface = {}

function MainInterface.Fire(u)
    -- statements
    -- 清空界面
    local id = BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(u)) -- 触发玩家ID
    local p = API.GetPlayer(id)

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
    -- 选择技能符文
    UI.display(0, u, id, "选择技能符文",
               "为英雄的技能增加效果符文。",
               "ReplaceableTextures\\CommandButtons\\BTNStone.blp")
    -- 任务
    UI.display(1, u, id, "任务", "任务列表。",
               "ReplaceableTextures\\CommandButtons\\BTNSpy.blp")
    -- 生活技能
    UI.display(2, u, id, "生活技能", "生活技能。",
               "ReplaceableTextures\\CommandButtons\\BTNBarrel.blp")
    p["玩家属性"]["界面状态"]["Value"] = "主界面"
end
-- 种族选择
function MainInterface.Race(u)
    -- statements
    -- 清空界面
    local id = BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(u)) -- 触发玩家ID
    local p = API.GetPlayer(id)

    UI.RemoveAbility(u, id)
    for i = #Race, 1, -1 do
        -- statements
        UI.display(i - 1, u, id, Race[i].Name, Race[i].Explain, Race[i].Art)
    end
    -- 返回
    UI.display(11, u, id, "返回", "返回上一菜单",
               "ReplaceableTextures\\CommandButtons\\BTNCancel.blp")
    p["玩家属性"]["界面状态"]["Value"] = "新建种族"
end
-- 职业选择
function MainInterface.Vocation(u, v)
    -- statements
    local id = BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(u)) -- 触发玩家ID
    local p = API.GetPlayer(id)
    if Race.Count >= v then
        -- statements
        UI.RemoveAbility(u, id)
        for i = #Hero[Race[v].Name], 1, -1 do
            -- statements
            UI.display(i - 1, u, id, Hero[Race[v].Name][i].Name,
                       Hero[Race[v].Name][i].Explain, Hero[Race[v].Name][i].Art)
        end
    end
    -- 返回
    UI.display(11, u, id, "返回", "返回上一菜单",
               "ReplaceableTextures\\CommandButtons\\BTNCancel.blp")
    p["玩家属性"]["界面状态"]["Value"] = "新建-职业"
    p["玩家属性"]["界面状态"]["Tag"]["种族"] = v
end
-- 创建英雄
function MainInterface.CreatHero(u, v)
    -- statements
    local id = BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(u)) -- 触发玩家ID
    local p = API.GetPlayer(id)
    local i = p["玩家属性"]["界面状态"]["Tag"]["种族"]

    if Hero[Race[i].Name].Count >= v then
        -- statements
        BJ.CreateNUnitsAtLoc(1, Maths.GetId(Hero[Race[i].Name][v].ID),
                             CJ.Player(id - 1),
                             CJ.Location(Global.HumanSpotX, Global.HumanSpotY),
                             270.0)
        local m = BJ.GetLastCreatedUnit()
        BJ.SelectUnitForPlayerSingle(m, CJ.Player(id - 1))
        BJ.PanCameraToTimedLocForPlayer(CJ.Player(id - 1), CJ.Location(
                                            Global.HumanSpotX, Global.HumanSpotY),
                                        0)
        if p["玩家属性"]["选择英雄"]["Value"] == true then
            -- statements
            local sm = p["玩家属性"]["当前选择英雄ID"]["Value"]
            CJ.RemoveUnit(sm)
        end
        p["玩家属性"]["选择英雄"]["Value"] = true
    end
end
return MainInterface
