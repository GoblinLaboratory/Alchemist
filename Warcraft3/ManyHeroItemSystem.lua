local CJ = require 'jass.common'
local BJ = require 'blizzard'
local japi = require 'jass.japi'
require "EntityComponentSystem\\API"
require "EntityComponentSystem\\Method\\Maths"
json = require "Lib\\json\\json"
local trig_ManyHeroItemSystem = CJ.CreateTrigger()

BJ.TriggerRegisterPlayerSelectionEventBJ(trig_ManyHeroItemSystem, CJ.Player(0),
                                         true)
BJ.TriggerRegisterPlayerSelectionEventBJ(trig_ManyHeroItemSystem, CJ.Player(1),
                                         true)
BJ.TriggerRegisterPlayerSelectionEventBJ(trig_ManyHeroItemSystem, CJ.Player(2),
                                         true)
BJ.TriggerRegisterPlayerSelectionEventBJ(trig_ManyHeroItemSystem, CJ.Player(3),
                                         true)
BJ.TriggerRegisterPlayerSelectionEventBJ(trig_ManyHeroItemSystem, CJ.Player(4),
                                         true)
BJ.TriggerRegisterPlayerSelectionEventBJ(trig_ManyHeroItemSystem, CJ.Player(5),
                                         true)
BJ.TriggerRegisterPlayerSelectionEventBJ(trig_ManyHeroItemSystem, CJ.Player(6),
                                         true)
BJ.TriggerRegisterPlayerSelectionEventBJ(trig_ManyHeroItemSystem, CJ.Player(7),
                                         true)
BJ.TriggerRegisterPlayerSelectionEventBJ(trig_ManyHeroItemSystem, CJ.Player(8),
                                         true)
BJ.TriggerRegisterPlayerSelectionEventBJ(trig_ManyHeroItemSystem, CJ.Player(9),
                                         true)
---------------

---------------

CJ.TriggerAddCondition(trig_ManyHeroItemSystem, CJ.Condition(
                           function()

        local id = BJ.GetConvertedPlayerId(
                       CJ.GetOwningPlayer(CJ.GetTriggerUnit())) -- 触发玩家ID
        -- CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0,CJ.GetUnitName(CJ.GetTriggerUnit()))
        return CJ.IsUnitType(CJ.GetTriggerUnit(), CJ.UNIT_TYPE_HERO) == true and
                   CJ.GetUnitAbilityLevel(CJ.GetTriggerUnit(), Maths.GetId(
                                              'ZBL' .. tostring(id - 1))) > 0 and
                   BJ.GetConvertedPlayerId(
                       CJ.GetOwningPlayer(CJ.GetTriggerUnit())) ==
                   BJ.GetConvertedPlayerId(CJ.GetTriggerPlayer())
    end))

CJ.TriggerAddAction(trig_ManyHeroItemSystem, function()

    local u = CJ.GetTriggerUnit() -- 触发单位
    local id = BJ.GetConvertedPlayerId(CJ.GetTriggerPlayer()) -- 触发玩家ID
    print("触发玩家ID"..id)
    --CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, CJ.GetUnitTypeId(u))
    --local UM = UnitsManager
    --local IM = WeaponryManager:Instance()
    --local mj = GM.MajiID["玩家" .. tostring(id)].Equipment_Maji

    --GM.MajiID["玩家" .. tostring(id)].Hero_ID = u
    -- 获取玩家
    local p = API.GetPlayer(id)
    p["玩家属性"]["当前选择英雄ID"]["Value"] =u
    local mj = p["玩家属性"]["装备马甲"]["Value"]
    local s = string.byte('A', 1)
    local ss = {
        'Mainhandweapon', 'OffHandWeapon', 'HeadEquipment', 'ChestEquipment',
        'WaistEquipment', 'LegEquipment', 'HandEquipment', 'FootEquipment',
        'Necklace', 'Ring', 'Cloak'
    }
    for i = 1, 11 do
        --local x1 = UM.GetEquipment(string.char(s)) -- 获取已装备的物品数据
        local x1 = API.GetWeaponryData(u,ss[i]) -- 获取已装备的物品数据
        print("i = "..i)
        if x1.ID ~= 0 then
            -- statements
            local mjjn = 'ZW' .. string.char(s) ..
                             tostring(id - 1)
            japi.EXSetAbilityDataString(japi.EXGetUnitAbility(mj, Maths.GetId(
                                                                  mjjn)), 1,
                                        215, API.GetItemName(x1))
            japi.EXSetAbilityDataString(japi.EXGetUnitAbility(mj, Maths.GetId(
                                                                  mjjn)), 1,
                                        218, API.GetItemExplain(x1))
            -- CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, IM:GetExplain(x1))
            japi.EXSetAbilityDataString(japi.EXGetUnitAbility(mj, Maths.GetId(
                                                                  mjjn)), 1,
                                        204, API.GetItemIcon(x1))
        end
        s = s + 1
    end
end)
