--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
____exports.Guid = __TS__Class()
local Guid = ____exports.Guid
Guid.name = "Guid"
function Guid.prototype.____constructor(self, guid)
    if not guid then
        error(
            __TS__New(TypeError, "Invalid argument; `value` has no value."),
            0
        )
    end
    self.value = ____exports.Guid.EMPTY
    if guid and ____exports.Guid:isGuid(guid) then
        self.value = guid
    end
end
function Guid.isGuid(self, guid)
    local value = tostring(guid)
    return guid and (__TS__InstanceOf(guid, ____exports.Guid) or ____exports.Guid.validator:test(value))
end
function Guid.create(self)
    return __TS__New(
        ____exports.Guid,
        table.concat(
            {
                ____exports.Guid:gen(2),
                ____exports.Guid:gen(1),
                ____exports.Guid:gen(1),
                ____exports.Guid:gen(1),
                ____exports.Guid:gen(3)
            },
            "-" or ","
        )
    )
end
function Guid.createEmpty(self)
    return __TS__New(____exports.Guid, "emptyguid")
end
function Guid.parse(self, guid)
    return __TS__New(____exports.Guid, guid)
end
function Guid.raw(self)
    return table.concat(
        {
            ____exports.Guid:gen(2),
            ____exports.Guid:gen(1),
            ____exports.Guid:gen(1),
            ____exports.Guid:gen(1),
            ____exports.Guid:gen(3)
        },
        "-" or ","
    )
end
function Guid.gen(self, count)
    local out = ""
    do
        local i = 0
        while i < count do
            out = out .. __TS__StringSubstring(
                __TS__NumberToString(
                    bit.bor(
                        (1 + math.random()) * 65536,
                        0
                    ),
                    16
                ),
                1
            )
            i = i + 1
        end
    end
    return out
end
function Guid.prototype.equals(self, other)
    return ____exports.Guid:isGuid(other) and (self.value == tostring(other))
end
function Guid.prototype.isEmpty(self)
    return self.value == ____exports.Guid.EMPTY
end
function Guid.prototype.__tostring(self)
    return self.value
end
function Guid.prototype.toJSON(self)
    return {value = self.value}
end
Guid.validator = __TS__New(RegExp, "^[a-z0-9]{8}-[a-z0-9]{4}-[a-z0-9]{4}-[a-z0-9]{4}-[a-z0-9]{12}$", "i")
Guid.EMPTY = "00000000-0000-0000-0000-000000000000"
return ____exports
