local CJ = require 'jass.common'
local BJ = require 'blizzard'
local japi = require 'jass.japi'
require "Maths"
local API = require 'library.API'

Code = {}
-- 添加装备栏
function Code.AddEquipmentBar(u)
    -- statements
    if CJ.IsHeroUnitId(CJ.GetUnitTypeId(u)) == true then
        -- 添加装备栏
        local j = "ZBL" ..
                      tostring(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(u)) -
                                   1)
        CJ.UnitAddAbility(u, Maths.GetId(j))
    end
end
-- 设置物品UI说明
function Code.ItemUI(id, name, explain, icon)
    -- statements
    -- 设置名称 说明
    japi.EXSetItemDataString(id, 4, name)
    japi.EXSetItemDataString(id, 3, explain)
    japi.EXSetItemDataString(id, 1, icon)
end
-- 设置技能UI说明
function Code.SkillUI(u, s, name, explain, icon)
    -- statements
    japi.EXSetAbilityDataString(japi.EXGetUnitAbility(u, Maths.GetId(s)), 1,
                                215, name)
    japi.EXSetAbilityDataString(japi.EXGetUnitAbility(u, Maths.GetId(s)), 1,
                                218, explain)
    -- CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, IM:GetExplain(x1))
    japi.EXSetAbilityDataString(japi.EXGetUnitAbility(u, Maths.GetId(s)), 1,
                                204, icon)
end
-- 创建马甲单位
-- 装备图标马甲
function Code.CreateVest()
    -- statements
    -- 装备马甲
    local mj = "hsz2"
    local i = 1
    CJ.TimerStart(CJ.CreateTimer(), 0.3, true, function()
        if i == 11 then
            CJ.DestroyTimer(CJ.GetExpiredTimer())
        else
            -- BJ.CreateNUnitsAtLoc(1, Maths.GetId(mj), CJ.Player(i - 1),
            --                      CJ.Location(Global.SpotX, Global.SpotY), 270.0)
            BJ.CreateNUnitsAtLoc(1, Maths.GetId(mj), CJ.Player(i - 1),
                                 BJ.GetRectCenter(BJ.GetPlayableMapRect()),
                                 270.0)
            local ZbMJ = BJ.GetLastCreatedUnit()
            CJ.UnitAddAbility(ZbMJ, Maths.GetId("ZWA" .. tostring(i - 1)))
            CJ.UnitAddAbility(ZbMJ, Maths.GetId("ZWB" .. tostring(i - 1)))
            CJ.UnitAddAbility(ZbMJ, Maths.GetId("ZWC" .. tostring(i - 1)))
            CJ.UnitAddAbility(ZbMJ, Maths.GetId("ZWD" .. tostring(i - 1)))
            CJ.UnitAddAbility(ZbMJ, Maths.GetId("ZWE" .. tostring(i - 1)))
            CJ.UnitAddAbility(ZbMJ, Maths.GetId("ZWF" .. tostring(i - 1)))
            CJ.UnitAddAbility(ZbMJ, Maths.GetId("ZWG" .. tostring(i - 1)))
            CJ.UnitAddAbility(ZbMJ, Maths.GetId("ZWH" .. tostring(i - 1)))
            CJ.UnitAddAbility(ZbMJ, Maths.GetId("ZWI" .. tostring(i - 1)))
            CJ.UnitAddAbility(ZbMJ, Maths.GetId("ZWJ" .. tostring(i - 1)))
            CJ.UnitAddAbility(ZbMJ, Maths.GetId("ZWK" .. tostring(i - 1)))
            CJ.UnitAddAbility(ZbMJ, Maths.GetId("Avul"))

            local player = API.GetPlayer(i)
            local com = player:getComponent("PlayerComponents")
            com:SetData("装备图标", ZbMJ)
            com:SetData("选择英雄", false)
            -- p["玩家属性"]["装备马甲"]["Value"] = ZbMJ
            -- p["玩家属性"]["选择英雄"]["Value"] = false
            -- GM.MajiID["玩家" .. tostring(i)].Equipment_Maji = ZbMJ
            i = i + 1
        end
    end)
end
-- 创建天赋马甲
function Code.CreateUIVest()
    -- statements
    local mj = "hsz3"
    local i = 1
    CJ.TimerStart(CJ.CreateTimer(), 0.3, true, function()
        if i == 11 then
            CJ.DestroyTimer(CJ.GetExpiredTimer())
        else
            -- BJ.CreateNUnitsAtLoc(1, Maths.GetId(mj), CJ.Player(i - 1),
            --                      CJ.Location(Global.SpotX, Global.SpotY), 270.0)
            BJ.CreateNUnitsAtLoc(1, Maths.GetId(mj), CJ.Player(i - 1),
            BJ.GetRectCenter(BJ.GetPlayableMapRect()), 270.0)
            local ZbMJ = BJ.GetLastCreatedUnit()
            -- CJ.UnitAddAbility(ZbMJ, Maths.GetId("ZWA" .. tostring(i - 1)))
            -- CJ.UnitAddAbility(ZbMJ, Maths.GetId("ZWB" .. tostring(i - 1)))
            -- CJ.UnitAddAbility(ZbMJ, Maths.GetId("ZWC" .. tostring(i - 1)))
            -- CJ.UnitAddAbility(ZbMJ, Maths.GetId("ZWD" .. tostring(i - 1)))
            -- CJ.UnitAddAbility(ZbMJ, Maths.GetId("ZWE" .. tostring(i - 1)))
            -- CJ.UnitAddAbility(ZbMJ, Maths.GetId("ZWF" .. tostring(i - 1)))
            -- CJ.UnitAddAbility(ZbMJ, Maths.GetId("ZWG" .. tostring(i - 1)))
            -- CJ.UnitAddAbility(ZbMJ, Maths.GetId("ZWH" .. tostring(i - 1)))
            -- CJ.UnitAddAbility(ZbMJ, Maths.GetId("ZWI" .. tostring(i - 1)))
            -- CJ.UnitAddAbility(ZbMJ, Maths.GetId("ZWJ" .. tostring(i - 1)))
            -- CJ.UnitAddAbility(ZbMJ, Maths.GetId("ZWK" .. tostring(i - 1)))
            CJ.UnitAddAbility(ZbMJ, Maths.GetId("Avul"))

            -- local p = API.GetPlayer(i)
            -- print("opppGUID" .. p.GUID)
            -- p["玩家属性"]["UI马甲"]["Value"] = ZbMJ

            local player = API.GetPlayer(i)
            local com = player:getComponent("PlayerComponents")
            com:SetData("UI图标", ZbMJ)
            --StartScene.StartPlayer(i)
            --BJ.SelectUnitForPlayerSingle(ZbMJ, CJ.Player(i - 1))
            i = i + 1
        end
    end)
end
return Code
