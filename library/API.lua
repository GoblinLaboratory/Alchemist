local Coreint = require 'library.Core.initialization'
require "library.Manager.HeroManager"
require "library.Manager.UnitManager"
require "library.Manager.WeaponryManager"
require "library.Manager.PlayerManager"
require "library.Method.Formula"
require "library.Manager.ItemIDManager"
require "math"
API = {}
function API.Int()
    -- statements
    -- 属性初始化
    math.randomseed(tonumber(tostring(os.time()):reverse():sub(1, 7)))
    Coreint.Int()
    PlayerManager:Instance()
    ItemIDManager:Instance()
    print("初始化完毕。。。")
end
-- 获取单位
function API.GetUnit(id, t)
    if t == true then
        -- statements
        local h = HeroManager:Instance()
        return h:GetUnit(id)
    else
        local h = UnitManager:Instance()
        return h:GetUnit(id)
    end
end
-- 添加单位
function API.CreatUnit(id, t)
    if t == true then
        -- statements
        local h = HeroManager:Instance()
        return h:CreatUnit(id)
    else
        local h = UnitManager:Instance()
        return h:CreatUnit(id)
    end
end
-- 移除单为
function API.RemoveUnit(id, t)
    if t == true then
        -- statements
        local h = HeroManager:Instance()
        return h:RemoveUnit(id)
    else
        local h = UnitManager:Instance()
        return h:RemoveUnit(id)
    end
end
-- 根据物品ID获得物品数据
function API.GetItemDota(id)
    local w = WeaponryManager:Instance()
    return w:GetItemDota(id)
end
-- 删除指定物品
function API.RemoveItem(item)
    local w = WeaponryManager:Instance()
    w:RemoveItem(item)
end
-- 删除指定ID物品
function API.RemoveIDItem(ID)
    local w = WeaponryManager:Instance()
    w:RemoveIDItem(ID)
end
-- 创建随机物品
-- 参数 lucky:物品爆率, level:装备等级
function API.CreateRandomItem(level, rarity, position)
    local w = WeaponryManager:Instance()
    return w:CreateRandomItem(level, rarity, position)
end
-- 创建物品
function API.CreateItem(xd)
    local w = WeaponryManager:Instance()
    return w:CreateItem(xd)
end
-- 获取玩家数据
function API.GetPlayer(id)
    local p = PlayerManager:Instance()
    return p:GetPleyer(id)
end
-- 获取物品名称
function API.GetItemName(item)
    return Formula.GetItemName(item)
end
-- 获取物品说明
function API.GetItemExplain(item)
    return Formula.GetItemExplain(item)
end
-- 获取物品图标
function API.GetItemIcon(item1)
    return Formula.GetItemIcon(item1)
end
-- test
--API.Int()
-- API.CreatUnit(465, true)
-- local x = API.GetUnit(465, true)
-- print("测试HeroManager管理器" .. x.ID)
--local item = API.CreateRandomItem(60, 1, 2)
--print(Formula.GetItemExplain(item))
--print(Formula.GetItemIcon(item))
--local player = API.GetPlayer(1)
--local com = player:getComponent("PlayerComponents")
--com:SetData("选择英雄", false)
-- for i = 1, 100, 1 do
--     -- statements
--     print(i)
--     local item = API.CreateRandomItem(60, 6, 1)
--     print(API.GetItemName(item))
--     print(API.GetItemExplain(item))
--     print(item.ID)
-- end
return API
