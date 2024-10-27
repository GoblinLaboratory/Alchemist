local CJ = require 'jass.common'
local BJ = require 'blizzard'
require "Maths"
local API = require 'library.API'
require "blizzard.Code"
require 'library.Data.Setting'
require "blizzard.System.EquipmentSystem.EquipmentSystem"
-- local japi = require 'jass.japi'
-- require "EntityComponentSystem\\Manager\\UnitsManager"
-- require "EntityComponentSystem\\Manager\\WeaponryManager"
-- require "EntityComponentSystem\\Method\\Maths"
-- require "EntityComponentSystem\\Method\\Method"
-- require "EntityComponentSystem\\Event\\EventTemplate"
-- require "EntityComponentSystem\\API"
-- require "Warcraft3\\Library\\Library"
local trig_RemoveEquipment = CJ.CreateTrigger()
BJ.TriggerRegisterAnyUnitEventBJ(trig_RemoveEquipment,
                                 CJ.EVENT_PLAYER_UNIT_ISSUED_ORDER)

CJ.TriggerAddCondition(trig_RemoveEquipment, CJ.Condition(
                           function()
        -- 主手武器 A
        return BJ.GetIssuedOrderIdBJ() == BJ.String2OrderIdBJ('phoenixfire') or
            -- 副手武器 B
                   BJ.GetIssuedOrderIdBJ() == BJ.String2OrderIdBJ('parasite') or
            -- 头部装备3
                   BJ.GetIssuedOrderIdBJ() == BJ.String2OrderIdBJ('parasiteoff') or
            -- 胸部装备4
                   BJ.GetIssuedOrderIdBJ() == BJ.String2OrderIdBJ('parasiteon') or
            -- 腰部装备5
                   BJ.GetIssuedOrderIdBJ() == BJ.String2OrderIdBJ('polymorph') or
            -- 腿部装备6
                   BJ.GetIssuedOrderIdBJ() == BJ.String2OrderIdBJ('possession') or
            -- 手部装备7
                   BJ.GetIssuedOrderIdBJ() ==
                   BJ.String2OrderIdBJ('preservation') or
            -- 脚部装备8
                   BJ.GetIssuedOrderIdBJ() == BJ.String2OrderIdBJ('purge') or
            -- 项链9
                   BJ.GetIssuedOrderIdBJ() == BJ.String2OrderIdBJ('rainofchaos') or
            -- 戒指10
                   BJ.GetIssuedOrderIdBJ() == BJ.String2OrderIdBJ('rainoffire') or
            -- 披风11
                   BJ.GetIssuedOrderIdBJ() == BJ.String2OrderIdBJ('raisedead')
    end))
CJ.TriggerAddAction(trig_RemoveEquipment, function()
    local Str = BJ.OrderId2StringBJ(BJ.GetIssuedOrderIdBJ())
    local zdy
    if (Str == 'phoenixfire') then
        zdy = '主手装备'
    elseif (Str == 'parasite') then
        zdy = '副手装备'
    elseif (Str == 'parasiteoff') then
        zdy = '头部装备'
    elseif (Str == 'parasiteon') then
        zdy = '胸部装备'
    elseif (Str == 'polymorph') then
        zdy = '腰部装备'
    elseif (Str == 'possession') then
        zdy = '腿部装备'
    elseif (Str == 'preservation') then
        zdy = '手部装备'
    elseif (Str == 'purge') then
        zdy = '脚部装备'
    elseif (Str == 'rainofchaos') then
        zdy = '项链'
    elseif (Str == 'rainoffire') then
        zdy = '戒指'
    elseif (Str == 'raisedead') then
        zdy = '披风'
    else
        zdy = 'L'
    end
    -- CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, zdy)
    if (zdy ~= 'L') then
        -- local s1 = WeaponryManager:Instance()
        -- local GM = Game:Instance()
        -- local UM = UnitsManager
        -- 触发单位
        local u = CJ.GetTriggerUnit()
        -- local s = CJ.GetUnitName(CJ.GetTriggerUnit()) --触发单位名称
        -- 触发玩家ID
        local id = BJ.GetConvertedPlayerId(
                       CJ.GetOwningPlayer(CJ.GetTriggerUnit()))

        -- local xd = GM:GetHero(u):GetEquipment(zdy)--获取已装备的物品数据
        -- 获取已装备的物品数据
        -- local xd = UM.GetEquipment(u,zdy)
        local xd = EquipmentSystem.GetWeaponryData(u, zdy)
        --local com = xd:getComponent("ItemAttributeComponents")
        -- 创建物品数据
        local xc = API.CreateItem(xd)
        -- local xc = s1:CreateAppointItem(xd)
        -- 删除工程升级
        local j = 'ZG' .. Setting.WeaponryCustom[zdy] .. tostring(id - 1)
        CJ.UnitRemoveAbility(u, Maths.GetId(j))

        -- 在物品栏创建物品
        Code.ItemUI(xc.ID, API.GetItemName(xc), API.GetItemExplain(xc),
                       API.GetItemIcon(xc))
        BJ.UnitAddItemByIdSwapped(xc.ID, u)
        -- japi.EXSetItemDataString(xc.ID, 4, s1:GetName(xc))
        -- japi.EXSetItemDataString(xc.ID, 3, s1:GetExplain(xc))
        -- japi.EXSetItemDataString(xc.ID, 1, s1:GetIcon(xc))
        -- CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0,"装备物品图标".. xc.TuBiao)
        -- GM:GetHero(id):RemoveItemprototype(xc)--移除英雄装备数据
        -- UM.RemoveWeaponry(u,xc)
        EquipmentSystem.RemoveWeaponryData(u, xc)
        -- 移除英雄装备数据
    end
end)
