-- require "Warcraft3\\SL\\Data"
json = require "Lib\\json\\json"
-- require "EntityComponentSystem\\Entity\\Entity"
-- require "EntityComponentSystem\\Entity\\World"
-- require "EntityComponentSystem\\Method\\Method"
require "EntityComponentSystem\\API"
require "EntityComponentSystem\\Data\\ComponentData"
require "EntityComponentSystem\\Method\\Maths"
require "EntityComponentSystem\\Method\\Method"
require "Warcraft3\\SL\\Data"
local CJ = require "jass.common"
local BJ = require 'blizzard'
BL = require "EntityComponentSystem\\Warcraft\\Blizzard"
PackedData = {}
-- function PackedData.WeaponryFactory()
--     local o = World:CreateEntity()
--     local COM = Data:Instance()
--     o:AddComponent(COM:GetComponent("基础属性"))
--     o:AddComponent(COM:GetComponent("单位属性"))
--     o:AddComponent(COM:GetComponent("抗性属性"))
--     o:AddComponent(COM:GetComponent("英雄属性"))
--     o:AddComponent(COM:GetComponent("装备属性"))
--     --o["技能"] = {}
--     return o
-- end
-- --return PackedData

-- local s = PackedData.WeaponryFactory()
-- print(json.encode(s))
-- 参数 id 玩家ID
function PackedData.GetData(id)
    -- statements
    local d = PackedData.GetWeaponryData(id)
    -- local s = json.encode(u)
    -- print(s)
    -- local o = PackedData.JsonToString(json.encode(d))
    return json.encode(d)
end
function PackedData.GetWeaponryData(id)
    -- statements
    local p = API.GetPlayer(id)
    local u = p["玩家属性"]["当前选择英雄ID"].Value
    -- local u = API.GetUnit(mj)
    local d = Data:new(nil)
    d.PlayerName = CJ.GetPlayerName(CJ.GetTriggerPlayer())
    d.Gold = CJ.GetPlayerState(CJ.GetTriggerPlayer(),
                               CJ.PLAYER_STATE_RESOURCE_GOLD)
    d.Wood = CJ.GetPlayerState(CJ.GetTriggerPlayer(),
                               CJ.PLAYER_STATE_RESOURCE_LUMBER)
    -- CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, mj)
    d["Hero"].ID = Maths.GetStrId(CJ.GetUnitTypeId(u))
    d["Hero"].Level = CJ.GetUnitLevel(u)
    d["Hero"].EXP = CJ.GetHeroXP(u)
    -- 装备
    for i = 1, #Method.WeaponryList, 1 do
        -- statements
        local x = API.GetWeaponryData(u, Method.WeaponryList[i])
        if x.ID ~= 0 then
            -- statements
            d["Weaponry"][Method.WeaponryList[i]]["判断值"] = true
            -- 基础属性
            CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0,
                                   x["基础属性"]["名称"].Value)
            local s = PackedData.trim(x["基础属性"]["名称"].Value)
            print(s)
            -- print(PackedData.Sub(s, 1, #s))
            d:AddComponent(Method.WeaponryList[i], "基础属性")
            d:AddValue(Method.WeaponryList[i], "基础属性", "名称", s)
            d:AddValue(Method.WeaponryList[i], "基础属性", "等级",
                       x["基础属性"]["等级"].Value)
            d:AddValue(Method.WeaponryList[i], "基础属性", "类型",
                       x["基础属性"]["类型"].Value)
            d:AddValue(Method.WeaponryList[i], "基础属性", "自定义值",
                       x["基础属性"]["自定义值"].Value)
            -- d:AddValue(Method.WeaponryList[i], "基础属性","等级",x["基础属性"]["等级"].Value)
            -- 单位属性
            d:AddComponent(Method.WeaponryList[i], "单位属性")
            for k, _ in pairs(x["单位属性"]) do --
                if k ~= "Name" then
                    if x["单位属性"][k].Value ~= 0 then
                        -- statements
                        d:AddValue(Method.WeaponryList[i], "单位属性", k,
                                   x["单位属性"][k].Value)
                    end
                end
            end
            -- 英雄属性
            d:AddComponent(Method.WeaponryList[i], "英雄属性")
            for k, _ in pairs(x["英雄属性"]) do --
                if k ~= "Name" then
                    if x["英雄属性"][k].Value ~= 0 then
                        -- statements
                        d:AddValue(Method.WeaponryList[i], "英雄属性", k,
                                   x["英雄属性"][k].Value)
                    end
                end
            end
            -- 抗性属性
            d:AddComponent(Method.WeaponryList[i], "抗性属性")
            for k, _ in pairs(x["抗性属性"]) do --
                if k ~= "Name" then
                    if x["抗性属性"][k].Value ~= 0 then
                        -- statements
                        d:AddValue(Method.WeaponryList[i], "抗性属性", k,
                                   x["抗性属性"][k].Value)
                    end
                end
            end
            -- 装备属性
            d:AddComponent(Method.WeaponryList[i], "装备属性")
            d:AddValue(Method.WeaponryList[i], "装备属性", "品质",
                       x["装备属性"]["品质"].Value)
            d:AddValue(Method.WeaponryList[i], "装备属性", "Position",
                       x["装备属性"]["Position"].Value)
            d:AddValue(Method.WeaponryList[i], "装备属性", "星",
                       x["装备属性"]["星"].Value)
            d:AddValue(Method.WeaponryList[i], "装备属性", "词缀",
                       x["装备属性"]["词缀"].Value)
            d:AddValue(Method.WeaponryList[i], "装备属性", "强化",
                       x["装备属性"]["强化"].Value)
            d:AddValue(Method.WeaponryList[i], "装备属性", "图标",
                       x["装备属性"]["图标"].Value)
            -- print(x["装备属性"]["图标"].Value)
        else
            d["Weaponry"][Method.WeaponryList[i]]["判断值"] = false
        end
    end
    return d
end
function PackedData.JsonToString(s)
    -- statements
    local o = {}
    local s1 = PackedData.trim(s) -- string.format("%q", PackedData.trim(s))
    ---print(s1)
    local i = 1
    while #s1 > 0 do
        -- statements
        if #s1 > 20 then
            -- statements
            -- o[i] = string.sub(s1, 1, 16)
            o[i] = PackedData.Sub(s1, 1, 20)
            s1 = PackedData.Sub(s1, 21, #s1)
            -- s1 = PackedData.SubUTF8String(s1,17, #s1)
        else
            -- o[i] = string.sub(s1, 1, #s1)
            o[i] = s1
            s1 = ""
        end
        -- print("哦 = " .. o[i])
        i = i + 1
    end
    return o
end
function PackedData.trim(s)
    -- return (string.gsub(s, "^%s*(.-)%s*$", "%1"))
    -- local l = string.gsub(s, "/r/n", "")
    local m = string.gsub(s, "%s+", "")
    return m
end
function PackedData.SubUTF8String(s, n)
    local dropping = string.byte(s, n + 1)
    if not dropping then return s end
    if dropping >= 128 and dropping < 192 then
        return PackedData.SubUTF8String(s, n - 1)
    end
    return string.sub(s, 1, n)
end
function PackedData.GetBytes(char)
    if not char then return 0 end
    local code = string.byte(char)
    if code < 127 then
        return 1
    elseif code <= 223 then
        return 2
    elseif code <= 239 then
        return 3
    elseif code <= 247 then
        return 4
    else
        -- 讲道理不会走到这里^_^
        return 0
    end
end
function PackedData.Sub(str, startIndex, endIndex)
    local tempStr = str
    local byteStart = 1 -- string.sub截取的开始位置
    local byteEnd = -1 -- string.sub截取的结束位置
    local index = 0 -- 字符记数
    local bytes = 0 -- 字符的字节记数

    startIndex = math.max(startIndex, 1)
    endIndex = endIndex or -1
    while string.len(tempStr) > 0 do
        if index == startIndex - 1 then
            byteStart = bytes + 1;
        elseif index == endIndex then
            byteEnd = bytes;
            break
        end
        bytes = bytes + PackedData.GetBytes(tempStr)
        tempStr = string.sub(str, bytes + 1)

        index = index + 1
    end
    return string.sub(str, byteStart, byteEnd)
end
function PackedData.JsonToObject(str)
    -- statements
    -- 创建英雄
    local decoded = json.decode(str)
    -- BL.CreatHero(decoded.Hero.ID,decoded.Hero.EXP)
    local u = CJ.CreateUnitAtLoc(CJ.GetTriggerPlayer(),
                                 Maths.GetId(decoded.Hero.ID),
                                 CJ.Location(0, 0), 0)
    CJ.SetHeroXP(u, decoded.Hero.EXP, false)
    local id = BJ.GetConvertedPlayerId(CJ.GetTriggerPlayer()) -- 触发玩家ID
    local si = API.GetUnit(u)
    -- 装备系统
    print("...de" .. #decoded.Weaponry)
    for _, v in pairs(decoded.Weaponry) do
        -- print("..."..i)
        if v["判断值"] then
            -- statements
            local item = API.CreateNItem()
            -- 基础属性
            item["基础属性"]["名称"].Value = v["基础属性"]["名称"]
            item["基础属性"]["等级"].Value = v["基础属性"]["等级"]
            item["基础属性"]["类型"].Value = v["基础属性"]["类型"]
            item["基础属性"]["自定义值"].Value =
                v["基础属性"]["自定义值"]
            -- 单位属性
            for k1, v1 in pairs(v["单位属性"]) do --
                item["单位属性"][k1].Value = v1
            end
            -- 英雄属性
            for k2, v2 in pairs(v["英雄属性"]) do --
                item["英雄属性"][k2].Value = v2
            end
            -- 抗性属性
            for k3, v3 in pairs(v["抗性属性"]) do --
                item["抗性属性"][k3].Value = v3
            end
            -- 装备属性
            item["装备属性"]["品质"].Value = v["装备属性"]["品质"]
            item["装备属性"]["Position"].Value =
                v["装备属性"]["Position"]
            item["装备属性"]["星"].Value = v["装备属性"]["星"]
            item["装备属性"]["词缀"].Value = v["装备属性"]["词缀"]
            item["装备属性"]["强化"].Value = v["装备属性"]["强化"]
            item["装备属性"]["图标"].Value = v["装备属性"]["图标"]
            print("panduanzhi")
            -- 使用装备
            -- 装备图标技能
            local j = 'ZG' ..
                          Method.GetCustom(
                              item["基础属性"]["自定义值"].Value) ..
                          tostring(id - 1)
            if CJ.GetUnitAbilityLevel(u, Maths.GetId(j)) ~= 1 then
                -- 设置工程升级
                -- 添加工程升级技能
                CJ.UnitAddAbility(u, Maths.GetId(j))
                -- 设置技能永久性
                CJ.UnitMakeAbilityPermanent(u, true, Maths.GetId(j))
                BJ.SetPlayerAbilityAvailableBJ(false, Maths.GetId(j),
                                               CJ.GetOwningPlayer(u))
            end
            -- 添加英雄装备数据
            -- UM.SetWeaponry(u, x1)
            API.SetWeaponryData(u, item)
            -- 替换装备说明
            local mj = API.GetPlayer(id)["玩家属性"]["装备马甲"]
            local mjjn = 'ZW' ..
                             Method.GetCustom(
                                 item["基础属性"]["自定义值"]["Value"]) ..
                             tostring(id - 1)
            Library.SkillUI(mj, mjjn, API.GetItemName(item),
                            API.GetItemExplain(item), API.GetItemIcon(item))
            API.RemoveItem(item)
        end
    end
end
return PackedData
-- API.AddUnit(1)
-- local o = PackedData.JsonToString(ComponentData[3])
-- local p = ""
-- for i = 1,#o, 1 do
--     -- statements
--     print(o[i])
--     p = p .. o[i]
-- end
-- print("p..." .. p)
-- print(PackedData.trim(ComponentData[3]))
-- print(string.format("%q", PackedData.trim(ComponentData[3])))
-- print(ComponentData[3])
