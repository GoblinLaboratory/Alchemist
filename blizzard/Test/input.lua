local CJ = require "jass.common"
local BJ = require "blizzard"
require "Maths"
local trig_inputtest = CJ.CreateTrigger()
CJ.TriggerRegisterPlayerChatEvent(trig_inputtest, CJ.Player(0), "-Unit", true)
CJ.TriggerRegisterPlayerChatEvent(trig_inputtest, CJ.Player(1), "-Unit", true)
CJ.TriggerAddCondition(trig_inputtest, CJ.Condition(function() return true end))
-- BJ.TriggerRegisterPlayerEventEndCinematic(trig_inputtest, CJ.Player(0))
CJ.TriggerAddCondition(trig_inputtest, CJ.Condition(
                           function()
        -- |xxxx|不是一个标准的lua语法，而是ydwe lua的扩展语法，值和jass里'xxxx'一样
        -- 注意，在lua里'xxxx'是一个字符串，和"xxxx"一样。

        -- return CJ.GetSpellAbilityId() == 1095264354 --'AHhb'
        local id = BJ.GetConvertedPlayerId(CJ.GetTriggerPlayer()) -- 触发玩家ID
        BJ.CreateNUnitsAtLoc(1, Maths.GetId('Hpal'), CJ.Player(id - 1),
                             BJ.GetRectCenter(BJ.GetPlayableMapRect()), 270.0)
    end))
