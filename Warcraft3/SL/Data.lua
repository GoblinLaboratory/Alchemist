require "EntityComponentSystem\\Data\\ComponentData"
json = require "Lib\\json\\json"
require "EntityComponentSystem\\Method\\Method"
require "EntityComponentSystem\\Global"
Data = {
    -- --版本
    -- --Version = 0,
    -- -- 玩家属性
    -- -- 玩家名
    -- PlayerName = "",
    -- -- 金币
    -- Gold = 0,
    -- -- 木材
    -- Wood = 0,
    -- ["Hero"] = {
    --     -- 单位ID
    --     ID= "",
    --     -- 等级
    --     Level = 0,
    --     -- 经验值
    --     EXP = 0
    -- }
}
-- Data.Version = 0
function Data:new(o)
    o = o or {}
    setmetatable(o, self)
    -- o.__index = self
    -----
    -- 版本
    o.Version = Global.Version
    -- 玩家名
    o.PlayerName = ""
    -- 金币
    o.Gold = 0
    -- 木材
    o.Wood = 0
    o["Hero"] = {
        -- 单位ID
        ID = 0,
        -- 等级
        Level = 0,
        -- 经验值
        EXP = 0
    }
    -- 装备
    o["Weaponry"] = {
        ["Mainhandweapon"] = {["判断值"] = true},
        ["OffHandWeapon"] = {["判断值"] = true},
        ["HeadEquipment"] = {["判断值"] = true},
        ["ChestEquipment"] = {["判断值"] = true},
        ["WaistEquipment"] = {["判断值"] = true},
        ["LegEquipment"] = {["判断值"] = true},
        ["HandEquipment"] = {["判断值"] = true},
        ["FootEquipment"] = {["判断值"] = true},
        ["Necklace"] = {["判断值"] = true},
        ["Ring"] = {["判断值"] = true},
        ["Cloak"] = {["判断值"] = true}
    }
    -- o["Mainhandweapon"] = {
    --     ["判断值"] = true
    -- }
    -- o["OffHandWeapon"] = {
    --     ["判断值"] = true
    -- }
    -- o["HeadEquipment"] = {
    --     ["判断值"] = true
    -- }
    -- o["ChestEquipment"] = {
    --     ["判断值"] = true
    -- }
    -- o["WaistEquipment"] = {
    --     ["判断值"] = true
    -- }
    -- o["LegEquipment"] = {
    --     ["判断值"] = true
    -- }
    -- o["HandEquipment"] = {
    --     ["判断值"] = true
    -- }
    -- o["FootEquipment"] = {
    --     ["判断值"] = true
    -- }
    -- o["Necklace"] = {
    --     ["判断值"] = true
    -- }
    -- o["Ring"] = {
    --     ["判断值"] = true
    -- }
    -- o["Cloak"] = {
    --     ["判断值"] = true
    -- }
    -----
    return o
end
Data.__index = Data
function Data:AddComponent(t, c)
    -- statements
    self["Weaponry"][t][c] = {}
end
function Data:AddValue(t, c, s, v)
    -- statements
    self["Weaponry"][t][c][s] = v
end
return Data
-- local d = Data:new(nil)
-- print(json.encode(d))
-- d.Version = 1.1
-- print(json.encode(d))
-- print("\")   call SetPlayerName(Player(15),\"" .. "value" ..
-- "\")  call SetPlayerTechMaxAllowed(Player(13)," ..
-- "CJ.I2S(SLSystem.Key)" .. "," .. "CJ.I2S(key)" ..
-- ") call ExecuteFunc(\"Pre_SaveStr_Get\")//")
