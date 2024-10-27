local CJ = require 'jass.common'
local japi = require 'jass.japi'
-- local BJ = require 'blizzard'
require "blizzard.System.AttributeSystem"
-- 角色管理器
RoleManager = {}
RoleManager.Base = {
    ["伤害升级奖励"] = 3,
    ["生命升级奖励"] = 50,
    ["魔法升级奖励"] = 30,
    ["防御升级奖励"] = 2
}
RoleManager.Data = {
    ["小蜘蛛"] = {Level = {1, 2, 3}, AbilList = {}, Type = "Base"},
    ["蜘蛛"] = {Level = {2, 3, 4}, AbilList = {}, Type = "Base"},
    ["獠牙蜘蛛"] = {Level = {6, 7, 8, 9}, AbilList = {}, Type = "BOSS"},
    ["小狼蛛"] = {Level = {12, 13, 14}, AbilList = {}, Type = "Base"},
    ["洞穴蜘蛛"] = {Level = {14, 15, 16}, AbilList = {}, Type = "Base"},
    ["毒液蜘蛛"] = {Level = {14, 15, 16}, AbilList = {}, Type = "Base"},
    ["狼蛛"] = {Level = {14, 15, 16}, AbilList = {}, Type = "Base"},
    ["织网者"] = {Level = {24, 25, 26}, AbilList = {}, Type = "Base"},
    ["浴血之母"] = {Level = {18, 19, 20}, AbilList = {}, Type = "BOSS"},
    ["育母蜘蛛"] = {Level = {23, 24, 25}, AbilList = {}, Type = "BOSS"},
    ["黑寡妇"] = {Level = {33, 34, 35}, AbilList = {}, Type = "BOSS"},
    ["蜘蛛女王"] = {Level = {43, 44, 45}, AbilList = {}, Type = "BOSS"},
    ["噬脑"] = {Level = {58, 59, 60}, AbilList = {}, Type = "BOSS"},
    ["水元素"] = {Level = {1, 2, 3}, AbilList = {}, Type = "Base"},
    ["巨大水元素"] = {Level = {4, 5, 6}, AbilList = {}, Type = "Base"},
    ["水元素领主"] = {Level = {7, 8, 9}, AbilList = {}, Type = "Base"},
    ["狂暴水元素"] = {Level = {3, 4, 5}, AbilList = {}, Type = "Base"},
    ["巨大狂暴水元素"] = {
        Level = {6, 7, 8},
        AbilList = {},
        Type = "Base"
    },
    ["狂暴水元素领主"] = {
        Level = {9, 10, 11},
        AbilList = {},
        Type = "Base"
    },
    ["火元素"] = {Level = {2, 3, 4}, AbilList = {}, Type = "Base"},
    ["巨大火元素"] = {Level = {5, 6, 7}, AbilList = {}, Type = "Base"},
    ["火元素领主"] = {Level = {8, 9, 10}, AbilList = {}, Type = "Base"},
    ["火焰巨魔"] = {Level = {14, 15, 16}, AbilList = {}, Type = "BOSS"},
    --------------------------------------------
    -- 鱼人
    --------------------------------------------
    ["穆格尔潮汐战士"] = {
        Level = {13, 14, 15},
        AbilList = {},
        Type = "Base"
    },
    ["穆格尔滩行者"] = {
        Level = {15, 16, 17},
        AbilList = {},
        Type = "Base"
    },
    ["穆格尔猎潮者"] = {
        Level = {17, 18, 19},
        AbilList = {},
        Type = "Base"
    },
    ["穆格尔血女巫"] = {
        Level = {21, 22, 23},
        AbilList = {},
        Type = "Base"
    },
    ["穆格尔影子法师"] = {
        Level = {23, 24, 25},
        AbilList = {},
        Type = "Base"
    },
    ["冰鳞"] = {Level = {27, 28, 29}, AbilList = {}, Type = "BOSS"},
    ["老瞎眼"] = {Level = {28, 29, 30}, AbilList = {}, Type = "BOSS"},
    ["斯克拉"] = {Level = {28, 29, 30}, AbilList = {}, Type = "BOSS"},
    ["布克拉"] = {Level = {29, 30, 31}, AbilList = {}, Type = "BOSS"},
    --------------------------------------------
    -- 海龟
    --------------------------------------------
    ["小海龟"] = {Level = {5, 6, 7}, AbilList = {}, Type = "Base"},
    ["大海龟"] = {Level = {8, 9, 10}, AbilList = {}, Type = "Base"},
    ["龙龟"] = {Level = {12, 13, 14}, AbilList = {}, Type = "Base"},
    ["巨龟"] = {Level = {14, 15, 16}, AbilList = {}, Type = "Base"},
    ["巨龙龟"] = {Level = {17, 18, 19}, AbilList = {}, Type = "Base"},
    ["海巨人"] = {Level = {27, 28, 29}, AbilList = {}, Type = "BOSS"},
    ["暴躁的本希"] = {Level = {12, 13, 14}, AbilList = {}, Type = "BOSS"},
    ["铁背龟"] = {Level = {22, 23, 24}, AbilList = {}, Type = "BOSS"},
    ["鳞须"] = {Level = {32, 33, 34}, AbilList = {}, Type = "BOSS"},
    --------------------------------------------
    -- 娜迦
    --------------------------------------------
    ["娜迦血咒者"] = {Level = {32, 33, 34}, AbilList = {}, Type = "Base"},
    ["娜迦海妖"] = {Level = {31, 32, 33}, AbilList = {}, Type = "Base"},
    ["深水护卫"] = {Level = {36, 37, 38}, AbilList = {}, Type = "Base"},
    ["海潮护卫"] = {Level = {32, 33, 34}, AbilList = {}, Type = "Base"},
    ["海潮领主"] = {Level = {39, 40, 41}, AbilList = {}, Type = "Base"},
    ["皇家护卫"] = {Level = {39, 41, 43}, AbilList = {}, Type = "Base"},
    ["弗罗将军"] = {Level = {44, 45, 46}, AbilList = {}, Type = "BOSS"},
    ["塞拉"] = {Level = {44, 45, 46}, AbilList = {}, Type = "BOSS"},
    ["海潮之王鲁尔加斯"] = {
        Level = {44, 45, 46},
        AbilList = {},
        Type = "BOSS"
    },
    ["萨利维丝"] = {Level = {45, 46, 47}, AbilList = {}, Type = "BOSS"},
    ["薇丝普拉"] = {Level = {45, 46, 47}, AbilList = {}, Type = "BOSS"},
    ["薇丝比娅"] = {Level = {45, 46, 47}, AbilList = {}, Type = "BOSS"},
    ["弗亚希王女"] = {Level = {48, 49, 50}, AbilList = {}, Type = "BOSS"},
    --------------------------------------------
    -- 树人
    --------------------------------------------
    ["堕落的黑木树人"] = {
        Level = {2, 3, 4},
        AbilList = {},
        Type = "Base"
    },
    ["枯萎的黑木树人"] = {
        Level = {4, 5, 6},
        AbilList = {},
        Type = "Base"
    },
    ["毒性树人"] = {Level = {7, 8, 9}, AbilList = {}, Type = "Base"},
    ["灾祸树人"] = {Level = {10, 11, 12}, AbilList = {}, Type = "Base"},
    ["战争古树"] = {Level = {13, 14, 15}, AbilList = {}, Type = "BOSS"},
    ["灾祸古树"] = {Level = {14, 15, 16}, AbilList = {}, Type = "BOSS"},
    --------------------------------------------
	-- 萨特
    --------------------------------------------
    ["赛特斯之魔法师"] = {Level = {16, 17, 18}, AbilList = {}, Type = "Base"},
    ["赛特斯之黑暗舞者"] = {Level = {20, 21, 22}, AbilList = {}, Type = "Base"},
    ["赛特斯之灵魂盗贼"] = {Level = {24, 25, 27}, AbilList = {}, Type = "Base"},
    ["赛特斯之隐形刺客"] = {Level = {28, 29, 30}, AbilList = {}, Type = "Base"},
    ["赛特斯之地狱使者"] = {Level = {29, 30, 31}, AbilList = {}, Type = "BOSS"},
    --------------------------------------------
	-- 堕落德鲁伊
    --------------------------------------------
    ["堕落的利爪德鲁伊"] = {Level = {31, 32, 33}, AbilList = {}, Type = "Base"},
    ["发狂的利爪德鲁伊"] = {Level = {34, 35, 36}, AbilList = {}, Type = "Base"},
    ["堕落的猛禽德鲁伊"] = {Level = {38, 40, 42}, AbilList = {}, Type = "Base"},
    ["图拉克"] = {Level = {38, 39, 40}, AbilList = {}, Type = "BOSS"},
    ["柯维恩"] = {Level = {40, 42, 44}, AbilList = {}, Type = "BOSS"},
    ["贾布"] = {Level = {40, 42, 44}, AbilList = {}, Type = "BOSS"},
    ["污秽"] = {Level = {44, 45, 46}, AbilList = {}, Type = "BOSS"},
    ["秽物"] = {Level = {44, 45, 47}, AbilList = {}, Type = "BOSS"},
    --------------------------------------------
	-- 豺狼人
    --------------------------------------------
    ["豺狼偷猎者"] = {Level = {1, 2, 3}, AbilList = {}, Type = "Base"},
    ["豺狼刺客"] = {Level = {3, 4, 5}, AbilList = {}, Type = "Base"},
    ["豺狼追猎者"] = {Level = {2, 3, 4}, AbilList = {}, Type = "Base"},
    ["豺狼恐吓者"] = {Level = {3, 4, 5}, AbilList = {}, Type = "Base"},
    ["豺狼守望者"] = {Level = {8, 9, 10}, AbilList = {}, Type = "Base"},
    ["詹格"] = {Level = {13, 14, 15}, AbilList = {}, Type = "BOSS"},
    ["霍格"] = {Level = {15, 16, 17}, AbilList = {}, Type = "BOSS"},
    ["斑皮"] = {Level = {15, 16, 18}, AbilList = {}, Type = "BOSS"},
    --------------------------------------------
	-- 天灾
    --------------------------------------------
    ["狂暴守卫"] = {Level = {12, 13, 14}, AbilList = {}, Type = "Base"},
    ["血恶魔"] = {Level = {17, 18, 19}, AbilList = {}, Type = "BOSS"},
    ["地狱犬"] = {Level = {21, 22, 23}, AbilList = {}, Type = "Base"},
    ["邪恶漫步者"] = {Level = {23, 24, 25}, AbilList = {}, Type = "Base"},
    ["狂暴洗劫者"] = {Level = {26, 26, 27}, AbilList = {}, Type = "Base"},
    ["食尸鬼"] = {Level = {27, 28, 29}, AbilList = {}, Type = "Base"},
    ["狂暴食尸鬼"] = {Level = {23, 24, 25}, AbilList = {}, Type = "BOSS"},
    ["食尸鬼王"] = {Level = {30, 31, 32}, AbilList = {}, Type = "BOSS"},
    ["憎恶"] = {Level = {32, 33,34}, AbilList = {}, Type = "Base"},
    ["屠夫"] = {Level = {33, 34,35}, AbilList = {}, Type = "BOSS"},
    ["缝合怪"] = {Level = {36, 37,38}, AbilList = {}, Type = "BOSS"},
    ["僵尸"] = {Level = {37, 38,39}, AbilList = {}, Type = "Base"},
    ["巨大的僵尸"] = {Level = {40, 41,42}, AbilList = {}, Type = "Base"},
    ["骷髅战士"] = {Level = {40, 41,42}, AbilList = {}, Type = "Base"},
    ["骷髅王"] = {Level = {40, 41,42}, AbilList = {}, Type = "BOSS"},
    ["骷髅法师"] = {Level = {40, 41,42}, AbilList = {}, Type = "Base"},
    ["遗忘法师"] = {Level = {40, 41,42}, AbilList = {}, Type = "BOSS"},
    ["死灵法师"] = {Level = {43, 44,45}, AbilList = {}, Type = "Base"},
    ["雷納塔基"] = {Level = {43, 44,45}, AbilList = {}, Type = "BOSS"},
    ["斯塔拉格"] = {Level = {43, 44,45}, AbilList = {}, Type = "BOSS"},
    ["主教洛欧塞布"] = {Level = {44, 45,46}, AbilList = {}, Type = "BOSS"},
    --------------------------------------------
	-- 强盗
    --------------------------------------------
    ["强盗"] = {Level = {3, 4,5}, AbilList = {}, Type = "Base"},
    ["土匪"] = {Level = {4, 5,6}, AbilList = {}, Type = "Base"},
    ["强盗首领"] = {Level = {8, 9,10}, AbilList = {}, Type = "BOSS"},
    --------------------------------------------
	-- 野猪人
    --------------------------------------------
    ["豪猪猎手"] = {Level = {1, 2,3}, AbilList = {}, Type = "Base"},
    ["豪猪追踪者"] = {Level = {3, 4,5}, AbilList = {}, Type = "Base"},
    ["尖毛兽侦察兵"] = {Level = {5, 6,7}, AbilList = {}, Type = "Base"},
    ["尖毛兽野蛮人"] = {Level = {8, 9,10}, AbilList = {}, Type = "Base"},
    ["尖毛兽酋长"] = {Level = {12, 13,14}, AbilList = {}, Type = "BOSS"},
    ["钢鬃"] = {Level = {14, 15,16}, AbilList = {}, Type = "BOSS"},
    ["刺背"] = {Level = {14, 15,16}, AbilList = {}, Type = "BOSS"},
    ["刺肋"] = {Level = {15, 16,17}, AbilList = {}, Type = "BOSS"},
    --------------------------------------------
	-- 双足飞龙 boss
    --------------------------------------------
    ["辛德瑞尔"] = {Level = {22, 24,24}, AbilList = {}, Type = "BOSS"},
    --------------------------------------------
	-- 邪恶兽族
    --------------------------------------------
    ["邪恶的兽族步兵"] = {Level = {20, 21,22}, AbilList = {}, Type = "Base"},
    ["邪恶的兽族掠夺者"] = {Level = {23, 24,25}, AbilList = {}, Type = "Base"},
    ["邪恶的兽族巫师"] = {Level = {27, 28,29}, AbilList = {}, Type = "Base"},
    ["兽族战争首领"] = {Level = {37, 38,39}, AbilList = {}, Type = "Base"},
    ["格鲁尔"] = {Level = {25, 26,27}, AbilList = {}, Type = "BOSS"},
    ["黑石剑圣"] = {Level = {34, 35,36}, AbilList = {}, Type = "BOSS"},
    ["恶魔术士"] = {Level = {36, 38,40}, AbilList = {}, Type = "BOSS"},
    ["红龙"] = {Level = {43, 44,45}, AbilList = {}, Type = "BOSS"}
}

function RoleManager.SetRole(u)
    -- statements
    local Name = CJ.GetUnitName(u)
    local l = RoleManager.Data[Name].Level[math.random(1,
                                                       #RoleManager.Data[Name]
                                                           .Level)]
    -- local l = RoleManager.Data["小蜘蛛S"].Level[math.random(1,
    --                                                            #RoleManager.Data["小蜘蛛S"]
    --                                                                .Level)]
    japi.SetUnitState(u, CJ.ConvertUnitState(0x13), RoleManager.Base["伤害升级奖励"] * l)
    japi.SetUnitState(u, CJ.ConvertUnitState(0x20), RoleManager.Base["防御升级奖励"] * l)
    -- AttributeSystem.SetPrototype(u, "攻击力",
    --                              RoleManager.Base["伤害升级奖励"] * l)
    -- AttributeSystem.SetPrototype(u, "护甲",
    --                              RoleManager.Base["防御升级奖励"] * l)
    AttributeSystem.SetPrototype(u, "生命值",
                                 RoleManager.Base["生命升级奖励"] * l)
    AttributeSystem.SetPrototype(u, "魔法值",
                                 RoleManager.Base["魔法升级奖励"] * l)
end
function RoleManager.trim(str)
    return (string.gsub(str, "^%s*(.-)%s*$", "%1"))
 end
return RoleManager
