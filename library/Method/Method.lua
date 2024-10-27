Method = {}
-- 拷贝类
function Method.clone(object)
    local lookup_table = {}
    local function _copy(object)
        if type(object) ~= "table" then
            return object
        elseif lookup_table[object] then
            return lookup_table[object]
        end
        local new_table = {}
        lookup_table[object] = new_table
        for key, value in pairs(object) do
            new_table[_copy(key)] = _copy(value)
        end
        return setmetatable(new_table, getmetatable(object))
    end
    return _copy(object)
end
-- 判断表中是否有key
function Method.is_include(Key, tab)
    -- statements
    -- print("Key1="..Key)
    for k, _ in pairs(tab) do
        -- print("Key="..k)
        -- print("volue="..v)
        if k == Key then return true end
    end
    return false
end
-- 武器系统序列值
Method.WeaponryCustom = {
    ['Mainhandweapon'] = "A",
    ['OffHandWeapon'] = "B",
    ['HeadEquipment'] = "C",
    ['ChestEquipment'] = "D",
    ['WaistEquipment'] = "E",
    ['LegEquipment'] = "F",
    ['HandEquipment'] = "G",
    ['FootEquipment'] = "H",
    ['Necklace'] = "I",
    ['Ring'] = "J",
    ['Cloak'] = "K"
}
Method.WeaponryList = {
    [1] = 'Mainhandweapon',
    [2] = 'OffHandWeapon',
    [3] = 'HeadEquipment',
    [4] = 'ChestEquipment',
    [5] = 'WaistEquipment',
    [6] = 'LegEquipment',
    [7] = 'HandEquipment',
    [8] = 'FootEquipment',
    [9] = 'Necklace',
    [10] = 'Ring',
    [11] = 'Cloak'
}
function Method.GetCustom(o) return Method.WeaponryCustom[o] end
-- 目标类型
Method.TargetRType = {
    [1] = "单位",
    [2] = "点",
    [3] = "区域",
    [4] = "单位或点",
    [5] = "无"
}
return Method
