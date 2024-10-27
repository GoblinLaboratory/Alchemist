--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("Cyan\\lualib_bundle");
Greeter = __TS__Class()
Greeter.name = "Greeter"
function Greeter.prototype.____constructor(self, message)
    self.greeting = message
end
function Greeter.prototype.greet(self)
    return "Hello, " .. self.greeting
end
greeter = __TS__New(Greeter, "world")
-- greeter:greet()
print(greeter:greet())