Setting = {}
-- 装备品质
Setting["品质"] = {
    [1] = {
        Name = "普通",
        -- 强化
        Strengthen = 0,
        -- 颜色 灰
        Color = "|cffC0C0C0",
        -- 权重
        Weight = 1000
        -- 爆率75%
        -- Rate = 0
    },
    [2] = {
        Name = "精良",
        -- 强化
        Strengthen = 1,
        -- 颜色 白
        Color = "|cffFFFFFF",
        -- 权重
        Weight = 0
    },
    [3] = {
        Name = "优秀",
        -- 强化
        Strengthen = 3,
        -- 颜色 绿
        Color = "|cff00FF00",
        -- 权重
        Weight = 0
    },
    [4] = {
        Name = "稀有",
        -- 强化
        Strengthen = 4,
        -- 颜色 蓝
        Color = "|c000000FF",
        -- 权重
        Weight = 0
    },
    [5] = {
        Name = "史诗",
        -- 强化
        Strengthen = 6,
        -- 颜色 紫
        Color = "|c77700077",
        -- 权重
        Weight = 0
    },
    [6] = {
        Name = "传说",
        -- 强化
        Strengthen = 9,
        -- 颜色 橙
        Color = "|cffFF7D36",
        -- 权重
        Weight = 0
    },
    [7] = {
        Name = "远古",
        -- 强化
        Strengthen = 13,
        -- 颜色 青
        Color = "|c000EEEEE",
        -- 权重
        Weight = 0
    },
    [8] = {
        Name = "不朽",
        -- 强化
        Strengthen = 17,
        -- 颜色 金
        Color = "|cffFFD700",
        -- 权重
        Weight = 0
    },
    [9] = {
        Name = "圣物",
        -- 强化
        Strengthen = 23,
        -- 颜色 暗金
        Color = "|cffFFD700",
        -- 权重
        Weight = 0
    },
    [10] = {
        Name = "神器",
        -- 强化
        Strengthen = 30,
        -- 颜色 红
        Color = "|cFFF00000",
        -- 权重
        Weight = 0
    }
}
Setting["类别"] = {
    [1] = {
        -- 主手武器
        Name = "Mainhandweapon",
        ["说明"] = "主手装备"
    },
    [2] = {
        -- 副手武器
        Name = "OffHandWeapon",
        ["说明"] = "副手装备"
    },
    [3] = {
        -- 头部装备
        Name = "HeadEquipment",
        ["说明"] = "头部装备"
    },
    [4] = {
        -- 胸部装备
        Name = "ChestEquipment",
        ["说明"] = "胸部装备"
    },
    [5] = {
        -- 腰部装备
        Name = "WaistEquipment",
        ["说明"] = "腰部装备"
    },
    [6] = {
        -- 腿部装备
        Name = "LegEquipment",
        ["说明"] = "腿部装备"
    },
    [7] = {
        -- 手部装备
        Name = "HandEquipment",
        ["说明"] = "手部装备"
    },
    [8] = {
        -- 脚部装备
        Name = "FootEquipment",
        ["说明"] = "脚部装备"
    },
    [9] = {
        -- 项链
        Name = "Necklace",
        ["说明"] = "项链"
    },
    [10] = {
        -- 戒指
        Name = "Ring",
        ["说明"] = "戒指"
    },
    [11] = {
        -- 披风
        Name = "Cloak",
        ["说明"] = "披风"
    }
}
Setting["掉落组合"] = {}
Setting["怪物等级"] = {
    [1] = {
        Name = "弱小",
        ["说明"] = "弱小的怪物,可以被轻松杀死。"
    },
    [2] = {
        Name = "普通",
        ["说明"] = "大部分野外怪物都是普通级的怪物,数量不多的话可以轻松击败。"
    },
    [3] = {
        Name = "强大",
        ["说明"] = "大部分野外怪物都是普通级的怪物,数量不多的话可以轻松击败。"
    },
    [4] = {Name = "精英"},
    [5] = {Name = "传说"},
    [6] = {Name = "远古"},
    [7] = {Name = "神赐"},
    [8] = {Name = "不朽"},
    [9] = {Name = "不可名状"}
}
Setting["怪物头衔"] = {
    [1] = {Name = "狂热的"},
    [2] = {Name = "狂爆的"},
    [3] = {Name = "疯狂的"},
    [4] = {Name = "幽灵"},
    [5] = {Name = "稀有"},
    [6] = {Name = "随从"}
}
-- 武器系统序列值
Setting.WeaponryCustom = {
    ['主手装备'] = "A",
    ['副手装备'] = "B",
    ['头部装备'] = "C",
    ['胸部装备'] = "D",
    ['腰部装备'] = "E",
    ['腿部装备'] = "F",
    ['手部装备'] = "G",
    ['脚部装备'] = "H",
    ['项链'] = "I",
    ['戒指'] = "J",
    ['披风'] = "K"
}
return Setting
