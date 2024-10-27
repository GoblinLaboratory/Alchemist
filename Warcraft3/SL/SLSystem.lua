local CJ = require "jass.common"
require "EntityComponentSystem\\Global"
SLSystem = {}
-- library PreSystem initializer Pre_Init

-- globals

SLSystem.Key = 1
SLSystem.Str_temp = ""
SLSystem.HT = 0
-- private string MapName = "preload" //存档名
-- private integer Key
-- private string Str_temp
-- private hashtable HT

-- endglobals

-- function Pre_SaveInt takes integer key, integer value returns nothing
-- if value >= 0 then
-- call Preload("\" )
-- call SetPlayerTechMaxAllowed(Player(14),"+I2S(key)+",1)
-- call SetPlayerTechMaxAllowed(Player(15),"+I2S(key)+","+I2S(value)+")
-- //")
-- else
-- call Preload("\" )
-- call SetPlayerTechMaxAllowed(Player(14),"+I2S(key)+",2)
-- call SetPlayerTechMaxAllowed(Player(15),"+I2S(key)+","+I2S(-value)+")
-- //")
-- endif
-- endfunction
function SLSystem.Pre_SaveInt(key, value)
    -- statements
    if value >= 0 then
        -- statements
        CJ.Preload("\" )\n   call SetPlayerTechMaxAllowed(Player(14)," ..
                       CJ.I2S(key) ..
                       ",1)\n  call SetPlayerTechMaxAllowed(Player(15)," ..
                       CJ.I2S(key) .. "," .. CJ.I2S(value) .. ")\n //")
    else
        CJ.Preload("\" )\n    call SetPlayerTechMaxAllowed(Player(14)," ..
                       CJ.I2S(key) ..
                       ",2)\n   call SetPlayerTechMaxAllowed(Player(15)," ..
                       CJ.I2S(key) .. "," .. CJ.I2S(-value) .. ")\n  //")
    end
end

-- function Pre_SaveStr_Get takes nothing returns nothing
-- call SaveStr(HT, Key, GetPlayerTechMaxAllowed(Player(13),Key), GetPlayerName(Player(15)))
-- endfunction
function SLSystem.Pre_SaveStr_Get()
    -- statements
    CJ.SaveStr(SLSystem.HT, SLSystem.Key,
               CJ.GetPlayerTechMaxAllowed(CJ.Player(13), SLSystem.Key),
               CJ.GetPlayerName(CJ.Player(15)))
end
-- function Pre_SaveStr takes integer key, string value returns nothing
-- call Preload("\" )
-- call SetPlayerName(Player(15),\""+value+"\")
-- call SetPlayerTechMaxAllowed(Player(13),"+I2S(Key)+","+I2S(key)+")
-- call ExecuteFunc(\"Pre_SaveStr_Get") //")

-- endfunction
function SLSystem.Pre_SaveStr(key, value)
    -- statements
    CJ.Preload("\" )\n    call SetPlayerName(Player(15),\"" .. value ..
                   "\")\n   call SetPlayerTechMaxAllowed(Player(13)," ..
                   CJ.I2S(SLSystem.Key) .. "," .. CJ.I2S(key) ..
                   ")\n   //")
end
-- function Pre_SaveStart takes nothing returns nothing
-- call PreloadGenClear()
-- call PreloadGenStart()
-- endfunction
function SLSystem.Pre_SaveStart()
    -- statements
    CJ.PreloadGenClear()
    CJ.PreloadGenStart()
end
-- function Pre_SaveEnd takes nothing returns nothing
-- call PreloadGenEnd("save\\"+MapName+"\\Data.txt") //注意你读取的路径要和你存档的路径一致
-- endfunction
function SLSystem.Pre_SaveEnd()
    -- statements
    CJ.PreloadGenEnd("save\\" .. Global.MapName .. "\\Data.txt") -- 注意你读取的路径要和你存档的路径一致
end
-- function Pre_LoadInt takes integer key returns integer
-- local integer var_type = GetPlayerTechMaxAllowed(Player(14), key)

-- if var_type == 1 then
-- return GetPlayerTechMaxAllowed(Player(15), key)
-- elseif var_type == 2 then
-- return -GetPlayerTechMaxAllowed(Player(15), key)
-- else
-- return 0
-- endif
-- endfunction
function SLSystem.Pre_LoadInt(key)
    -- statements
    local var_type = CJ.GetPlayerTechMaxAllowed(CJ.Player(14), key)
    if var_type == 1 then
        -- statements
        return CJ.GetPlayerTechMaxAllowed(CJ.Player(15), key)
    elseif var_type == 2 then
        -- statements
        return 0 - CJ.GetPlayerTechMaxAllowed(CJ.Player(15), key)
    else
        return 0
    end
end
-- function Pre_LoadStr takes integer key returns string
-- return LoadStr(HT, Key, key)
-- endfunction
function SLSystem.Pre_LoadStr(key)
    -- statements
    local s = CJ.LoadStr(SLSystem.HT, SLSystem.Key, key)
    SLSystem.Pre_SaveStr_Get()
    return s
end
-- function Pre_LoadStart takes nothing returns nothing
-- set Str_temp = GetPlayerName(Player(15))
-- call Preloader("save\\"+MapName+"\\Data.txt") //这里可以填写任意你想要写存档的路径
-- endfunction
function SLSystem.Pre_LoadStart()
    -- statements
    SLSystem.Str_temp = CJ.GetPlayerName(CJ.Player(15))
    CJ.Preloader("save\\" .. Global.MapName .. "\\Data.txt") -- 这里可以填写任意你想要写存档的路径
end
-- function Pre_LoadEnd takes nothing returns nothing
-- call SetPlayerName(Player(15),Str_temp)
-- call FlushChildHashtable(HT, Key)
-- endfunction
function SLSystem.Pre_LoadEnd()
    -- statements
    CJ.SetPlayerName(CJ.Player(15), SLSystem.Str_temp)
    CJ.FlushChildHashtable(SLSystem.HT, SLSystem.Key)
end
-- function Pre_LocalLoadJudge takes nothing returns boolean
-- call PreloadGenClear()
-- call PreloadGenStart()
-- call Pre_SaveInt(0, 1)
-- call PreloadGenEnd("save\\"+MapName+"\\Test.txt")
-- call Preloader("save\\"+MapName+"\\Test.txt")
-- return Pre_LoadInt(0) == 1
-- endfunction
function SLSystem.Pre_LocalLoadJudge()
    -- statements
    CJ.PreloadGenClear()
    CJ.PreloadGenStart()
    SLSystem.Pre_SaveInt(0, 1)
    CJ.PreloadGenEnd("save\\" .. Global.MapName .. "\\Test.txt")
    CJ.Preloader("save\\" .. Global.MapName .. "\\Test.txt")
    return SLSystem.Pre_LoadInt(0) == 1
end
-- function Pre_Init takes nothing returns nothing
-- set HT = InitHashtable()
-- set Key = StringHash(MapName)
-- if Key < 0 then
-- set Key = -Key
-- endif

-- endfunction
function SLSystem.Pre_Init()
    -- statements
    SLSystem.HT = CJ.InitHashtable()
    SLSystem.Key = CJ.StringHash(Global.MapName)
    if SLSystem.Key < 0 then
        -- statements
        SLSystem.Key = 0 - SLSystem.Key
    end
end
-- endlibrary

return SLSystem
