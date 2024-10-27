local functions = require 'library.Core.functions'
-- require "library.Archetype.testArchetype"
--Registry   = functions.import("..Registry")
local Registry = require 'library.Core.Registry'
--require 'library.Core.Registe'
require 'library.Component.testComponents'
require 'library.Component.BaseCompenents'
require 'library.Component.AttributeComponents'
require 'library.Component.ExtraAttributeComponents'
require 'library.Component.ItemAttributeComponents'
require 'library.Component.BarComponents'
require 'library.Component.PlayerComponents'

local initialization = {}
function initialization.Int()
    -- statements
    -- local R = Registry:Instance()
    Registry.add(functions.import('library.Component.testComponents'))
    Registry.add(functions.import('library.Component.BaseCompenents'))
    Registry.add(functions.import('library.Component.AttributeComponents'))
    Registry.add(functions.import('library.Component.ExtraAttributeComponents'))
    Registry.add(functions.import('library.Component.ItemAttributeComponents'))
    Registry.add(functions.import('library.Component.BarComponents'))
    Registry.add(functions.import('library.Component.PlayerComponents'))
end
return initialization

