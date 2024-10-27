local CJ = require 'jass.common'
local BJ = require 'blizzard'
local japi = require 'jass.japi'
require "EntityComponentSystem\\Method\\Maths"
-- require "EntityComponentSystem\\Event\\EventTemplate"
require "EntityComponentSystem\\API"
require "EntityComponentSystem\\Global"
require "Warcraft3\\UI\\MainInterface"
Library = {}
-- 添加装备栏
function Library.AddEquipmentBar(u)
    -- statements
    if CJ.IsHeroUnitId(CJ.GetUnitTypeId(u)) == true then
        -- local HM = HeroManager:Instance()
        -- 添加装备栏
        local j = "ZBL" ..
                      tostring(BJ.GetConvertedPlayerId(CJ.GetOwningPlayer(u)) -
                                   1)
        CJ.UnitAddAbility(u, Maths.GetId(j))
    end
end
-- 设置物品UI说明
function Library.ItemUI(id, name, explain, icon)
    -- statements
    -- 设置名称 说明
    japi.EXSetItemDataString(id, 4, name)
    japi.EXSetItemDataString(id, 3, explain)
    japi.EXSetItemDataString(id, 1, icon)
end
-- 设置技能UI说明
function Library.SkillUI(u, s, name, explain, icon)
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
function Library.CreateVest()
    -- statements
    -- 装备马甲
    local mj = "hsz2"
    local i = 1
    CJ.TimerStart(CJ.CreateTimer(), 0.3, true, function()
        if i == 11 then
            CJ.DestroyTimer(CJ.GetExpiredTimer())
        else
            BJ.CreateNUnitsAtLoc(1, Maths.GetId(mj), CJ.Player(i - 1),
                                 CJ.Location(Global.SpotX, Global.SpotY), 270.0)
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

            local p = API.GetPlayer(i)
            print("i = " .. i)
            p["玩家属性"]["装备马甲"]["Value"] = ZbMJ
            p["玩家属性"]["选择英雄"]["Value"] = false
            -- GM.MajiID["玩家" .. tostring(i)].Equipment_Maji = ZbMJ
            i = i + 1
        end
    end)
end
-- 创建天赋马甲
function Library.CreateUIVest()
    -- statements
    local mj = "hsz3"
    local i = 1
    CJ.TimerStart(CJ.CreateTimer(), 0.3, true, function()
        if i == 11 then
            CJ.DestroyTimer(CJ.GetExpiredTimer())
        else
            BJ.CreateNUnitsAtLoc(1, Maths.GetId(mj), CJ.Player(i - 1),
                                 CJ.Location(Global.SpotX, Global.SpotY), 270.0)
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

            local p = API.GetPlayer(i)
            print("opppGUID" .. p.GUID)
            p["玩家属性"]["UI马甲"]["Value"] = ZbMJ
            -- GM.MajiID["玩家" .. tostring(i)].Equipment_Maji = ZbMJ
            --MainInterface.Fire(ZbMJ)
            i = i + 1
        end
    end)
end
-- 获取单位魔法强度
function Library.GetSpellPower(u)
    -- statements
    local i = API.GetUnit(u)
    local l = i["单位属性"]["法术强度"]["Value"]
    if CJ.IsUnitType(u, CJ.UNIT_TYPE_HERO) == true then
        local z = CJ.GetHeroInt(u, true)
        local s = 2 * z + l
        return s
    else
        return l
    end
end
-- 去除单位身上的负面效果
function Library.RemoveDebuff(u)
    -- statements
    local DeBuff = {"ABZD","ABDG"}
    for i = #DeBuff, 1, -1 do
        -- statements
        if CJ.GetUnitAbilityLevel(u, Maths.GetId(DeBuff[i])) > 0 then
            CJ.UnitRemoveAbility(u, Maths.GetId(DeBuff[i]))
        end
    end
end
-- 对单位造成物理伤害
-- function Library.PhysicalInjury(u)
--     -- statements
-- end
return Library
