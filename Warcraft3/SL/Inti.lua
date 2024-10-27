require "EntityComponentSystem\\Global"
Bl = require "EntityComponentSystem\\Warcraft\\Blizzard"
--require "Warcraft3\\SL\\SL"
local CJ = require "jass.common"
local BJ = require "blizzard"
require "Warcraft3\\SL\\SLSystem"
-- 存档  储存
local trig_SLInti = CJ.CreateTrigger()
BJ.TriggerRegisterTimerEventSingle(trig_SLInti, 0.00)
CJ.TriggerAddCondition(trig_SLInti, CJ.Condition(function() return true end))

CJ.TriggerAddAction(trig_SLInti, function()
    -- local ev = EventTemplate:Instance()
    -- BJ.InitGameCacheBJ("ORPG.w3v")
    -- CJ.FlushGameCache(BJ.GetLastCreatedGameCacheBJ())
    -- BJ.InitGameCacheBJ("ORPG.w3v")
    -- --
    -- Bl.SLGC = BJ.GetLastCreatedGameCacheBJ()
    -- SL.FileToString(Global.SLFN, Bl.SLGC)
    --SL.LoadFile("Save\\Test\\ORPG.sav",Bl.SLGC)
    --SLSystem.Pre_Init()
    --Pre_LocalLoadJudge()
    if SLSystem.Pre_LocalLoadJudge() then
        -- statements
        CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0,  "显示Debug信息: 玩家已注册过...")
    else
        CJ.DisplayTextToPlayer(CJ.Player(0), 0, 0,  "显示Debug信息: 玩家未注册过...")
    end
end)
