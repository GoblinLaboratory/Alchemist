local CJ = require 'jass.common'
local BJ = require 'blizzard'
--local japi = require 'jass.japi'
--require "EntityComponentSystem\\Manager\\UnitsManager"
--require "EntityComponentSystem\\Manager\\WeaponryManager"
require "EntityComponentSystem\\Method\\Maths"
require "EntityComponentSystem\\Method\\Method"
require "EntityComponentSystem\\Event\\EventTemplate"
require "EntityComponentSystem\\API"
require "Warcraft3\\Library\\Library"
--require "Game"
-- 装备系统，使用装备
local trig1 = CJ.CreateTrigger()

BJ.TriggerRegisterAnyUnitEventBJ(trig1, CJ.EVENT_PLAYER_UNIT_USE_ITEM)

-- 下面大量使用了函数定义后直接使用的技巧，这样甚至不需要给函数安一个名字，所以称之为‘匿名函数’。
-- 好处是代码结构更加紧密，也省去了给函数想名字的烦恼。
-- zinc也有匿名函数，如果你使用过zinc，应该不会陌生。
CJ.TriggerAddCondition(trig1, CJ.Condition(
                           function()
        -- print('h111122a!')
        -- |xxxx|不是一个标准的lua语法，而是ydwe lua的扩展语法，值和jass里'xxxx'一样
        -- 注意，在lua里'xxxx'是一个字符串，和"xxxx"一样。
        -- print(CJ.GetItemTypeId(CJ.GetManipulatedItem()))

        -- return CJ.GetSpellAbilityId() == 1515412034
        -- return CJ.GetItemTypeId(CJ.GetManipulatedItem()) == 1227894832
        return CJ.GetWidgetLife(CJ.GetManipulatedItem()) > 99
    end))

CJ.TriggerAddAction(trig1, function()
    if CJ.GetWidgetLife(CJ.GetManipulatedItem()) == 100 then
        --local IM = WeaponryManager:Instance()
        --local GM = Game:Instance()
        --local UM = UnitsManager
        -- 触发单位
        local u = CJ.GetTriggerUnit()
        -- 触发单位名称
        -- local s = CJ.GetUnitName(CJ.GetTriggerUnit())
        -- 触发玩家ID
        local id = BJ.GetConvertedPlayerId(
                       CJ.GetOwningPlayer(CJ.GetTriggerUnit()))
        -- 物品ID
        local itemid = CJ.GetItemTypeId(CJ.GetManipulatedItem())
        -- 被操作物品
        local it = CJ.GetManipulatedItem()
        -- 物品数据
        local x1 = API.GetItemDota(itemid)
        --local x1 = EventTemplate.GetItemDota:Fire(itemid)
        if x1 ~= 0 then
            -- statements
            -- print(x1["Base"]["自定义值"].Value)
            -- 装备图标技能
            local j =
                'ZG' .. Method.GetCustom(x1["基础属性"]["自定义值"].Value) ..
                    tostring(id - 1)
            -- 丢弃物品
            BJ.UnitRemoveItemSwapped(it, u)

            if CJ.GetUnitAbilityLevel(u, Maths.GetId(j)) ~= 1 then
                -- 设置工程升级
                -- 添加工程升级技能
                CJ.UnitAddAbility(u, Maths.GetId(j))
                -- 设置技能永久性
                CJ.UnitMakeAbilityPermanent(u, true, Maths.GetId(j))
                BJ.SetPlayerAbilityAvailableBJ(false, Maths.GetId(j),
                                               CJ.GetOwningPlayer(u))
            else
                -- 获取已装备的物品数据
                local xd = API.GetWeaponryData(u, x1["基础属性"]["自定义值"]["Value"])
                --local xd = EventTemplate.GetWeaponryData:Fire(u, x1["基础属性"]["自定义值"].Value)
                -- 创建物品数据
                local xc = API.CreateItem(xd)
                --local xc = EventTemplate.CreateItem:Fire(xd)
                -- 设置图标
               --japi.EXSetItemDataString(xc.ID, 1, EventTemplate.GetItemIcon:Fire(xc))
                -- 在物品栏创建物品
                --BJ.UnitAddItemByIdSwapped(xc.ID, u)
                -- 设置名称 说明
                Library.ItemUI(xc.ID,API.GetItemName(xc), API.GetItemExplain(xc), API.GetItemIcon(xc))
                -- 在物品栏创建物品
                BJ.UnitAddItemByIdSwapped(xc.ID, u)
                -- japi.EXSetItemDataString(xc.ID, 4, EventTemplate.GetItemName:Fire(xc))
                -- japi.EXSetItemDataString(xc.ID, 3, EventTemplate.GetItemExplain:Fire(xc))
                -- japi.EXSetItemDataString(xc.ID, 1, EventTemplate.GetItemIcon:Fire(xc))
                -- 移除英雄装备数据
                --UM.RemoveWeaponry(u, xc)
                API.RemoveWeaponryData(u, xc)
                --EventTemplate.RemoveWeaponryData:Fire(u, xc)
                --japi.EXSetItemDataString(xc.ID, 1, EventTemplate.GetItemIcon:Fire(xc))
            end
            -- 添加英雄装备数据
            --UM.SetWeaponry(u, x1)
            API.SetWeaponryData(u, x1)
            --EventTemplate.SetWeaponryData:Fire(u, x1)
            -- 替换装备说明
            local mj = API.GetPlayer(id)["玩家属性"]["装备马甲"]["Value"]
            local mjjn = 'ZW' ..Method.GetCustom(x1["基础属性"]["自定义值"]["Value"]) ..tostring(id - 1)
            Library.SkillUI(mj, mjjn,API.GetItemName(x1), API.GetItemExplain(x1), API.GetItemIcon(x1))
            -- japi.EXSetAbilityDataString(japi.EXGetUnitAbility(mj,
            --                                                   Maths.GetId(mjjn)),
            --                             1, 215, API.GetItemName(x1))
            -- japi.EXSetAbilityDataString(japi.EXGetUnitAbility(mj,
            --                                                   Maths.GetId(mjjn)),
            --                             1, 218, API.GetItemExplain(x1))
            -- -- CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, IM:GetExplain(x1))
            -- japi.EXSetAbilityDataString(japi.EXGetUnitAbility(mj,
            --                                                   Maths.GetId(mjjn)),
            --                             1, 204, API.GetItemIcon(x1))
            -- 物品管理器删除物品
            --IM:Remove(x1)
            API.RemoveItem(x1)
            CJ.RemoveItem(it)
            -- 删除物品
            --EventTemplate.RemoveItem:Fire(itemid)
        end

    end
end)
