local CJ = require "jass.common"
local BJ = require "blizzard"
require "EntityComponentSystem\\API"
json = require "Lib\\json\\json"
require "Warcraft3\\SL\\SLSystem"
require "Warcraft3\\SL\\PackedData"
Bl = require "EntityComponentSystem\\Warcraft\\Blizzard"
-- 存档  储存
local trig_Save = CJ.CreateTrigger()
CJ.TriggerRegisterPlayerChatEvent(trig_Save, CJ.Player(0), "-save", true)
CJ.TriggerRegisterPlayerChatEvent(trig_Save, CJ.Player(1), "-save", true)
CJ.TriggerAddCondition(trig_Save, CJ.Condition(function() return true end))
CJ.TriggerAddAction(trig_Save, function()
    -- local ev = EventTemplate:Instance()
    CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, "DamagedType[i].Name")
    --
    local id = BJ.GetConvertedPlayerId(CJ.GetTriggerPlayer()) -- 触发玩家ID
    -- 获取玩家
    local o = PackedData.GetData(id)
    -- 以附加的方式打开只写文件
    local file = io.open("save\\test.txt", "w")
    -- 在文件最后一行添加 Lua 注释
    file:write(o)

    -- 关闭打开的文件
    file:close()
    -- SLSystem.Pre_SaveStart()
    -- SLSystem.Pre_SaveInt(1,324)
    -- SLSystem.Pre_SaveStr(2,"dsafdas电放费")
    -- -- SLSystem.Pre_SaveInt(1,#o)
    -- -- for i = 1, #o, 1 do
    -- --     SLSystem.Pre_SaveStr(i+1,o[i])
    -- -- end
    -- SLSystem.Pre_SaveEnd()
    -- CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, s)
    -- print(s)
    -- local o = "fdsfsdgffsdgfdg"
    -- SL.StringToFile(o, "Save\\ORPG.txt", CJ.GetTriggerPlayer())
end)

local trig_Read = CJ.CreateTrigger()
CJ.TriggerRegisterPlayerChatEvent(trig_Read, CJ.Player(0), "-load", true)
CJ.TriggerRegisterPlayerChatEvent(trig_Read, CJ.Player(1), "-load", true)
CJ.TriggerAddCondition(trig_Read, CJ.Condition(function() return true end))
CJ.TriggerAddAction(trig_Read, function()
    -- 以只读方式打开文件
    local file = io.open("save\\test.txt", "r")
    local s = file:read("*all")
    file:close()
    PackedData.JsonToObject(s)
    print(s)
    --print(io.read())
    -- local ev = EventTemplate:Instance()
    -- CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, "-Load")
    -- local s = SL.GetString(Bl.SLGC,CJ.GetTriggerPlayer())
    -- CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0, s)
    -- SL.StringToFile("gfgfg", "Save\\ORPG\\ORPG.txt", CJ.GetTriggerPlayer())
    -- SLSystem.Pre_LoadStart()
    -- -- 读取整数
    -- local n = SLSystem.Pre_LoadInt(1)
    -- print(n)
    -- local s = SLSystem.Pre_LoadStr(2)
    -- print(s)
    -- local str = ""
    -- for i = 1, n, 1 do
    --     -- statements
    --     str = str .. SLSystem.Pre_LoadStr(i + 1)
    -- end
    -- SLSystem.Pre_LoadEnd()
    -- print(str)
end)
