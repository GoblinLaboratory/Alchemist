-- 简易的blizzard.lua，若需要完整的blizzard.lua，可以使用jass2lua工具，自行转换。
local CJ = require "jass.common"
local BJ = {}

-- ===========================================================================
-- Blizzard.j ( define Jass2 functions that need to be in every map script )
-- ===========================================================================

-------------------------------------------------------------------------
-- Constants
--

-- Misc constants
BJ.bj_PI = 3.14159
BJ.bj_E = 2.71828
BJ.bj_CELLWIDTH = 128.0
BJ.bj_CLIFFHEIGHT = 128.0
BJ.bj_UNIT_FACING = 270.0
BJ.bj_RADTODEG = 180.0 / BJ.bj_PI
BJ.bj_DEGTORAD = BJ.bj_PI / 180.0
BJ.bj_TEXT_DELAY_QUEST = 20.00
BJ.bj_TEXT_DELAY_QUESTUPDATE = 20.00
BJ.bj_TEXT_DELAY_QUESTDONE = 20.00
BJ.bj_TEXT_DELAY_QUESTFAILED = 20.00
BJ.bj_TEXT_DELAY_QUESTREQUIREMENT = 20.00
BJ.bj_TEXT_DELAY_MISSIONFAILED = 20.00
BJ.bj_TEXT_DELAY_ALWAYSHINT = 12.00
BJ.bj_TEXT_DELAY_HINT = 12.00
BJ.bj_TEXT_DELAY_SECRET = 10.00
BJ.bj_TEXT_DELAY_UNITACQUIRED = 15.00
BJ.bj_TEXT_DELAY_UNITAVAILABLE = 10.00
BJ.bj_TEXT_DELAY_ITEMACQUIRED = 10.00
BJ.bj_TEXT_DELAY_WARNING = 12.00
BJ.bj_QUEUE_DELAY_QUEST = 5.00
BJ.bj_QUEUE_DELAY_HINT = 5.00
BJ.bj_QUEUE_DELAY_SECRET = 3.00
BJ.bj_HANDICAP_EASY = 60.00
BJ.bj_GAME_STARTED_THRESHOLD = 0.01
BJ.bj_WAIT_FOR_COND_MIN_INTERVAL = 0.10
BJ.bj_POLLED_WAIT_INTERVAL = 0.10
BJ.bj_POLLED_WAIT_SKIP_THRESHOLD = 2.00

-- Game constants
BJ.bj_MAX_INVENTORY = 6
BJ.bj_MAX_PLAYERS = 12
BJ.bj_PLAYER_NEUTRAL_VICTIM = 13
BJ.bj_PLAYER_NEUTRAL_EXTRA = 14
BJ.bj_MAX_PLAYER_SLOTS = 16
BJ.bj_MAX_SKELETONS = 25
BJ.bj_MAX_STOCK_ITEM_SLOTS = 11
BJ.bj_MAX_STOCK_UNIT_SLOTS = 11
BJ.bj_MAX_ITEM_LEVEL = 10

-- Ideally these would be looked up from Units/MiscData.txt,
-- but there is currently no script functionality exposed to do that
BJ.bj_TOD_DAWN = 6.00
BJ.bj_TOD_DUSK = 18.00

-- Melee game settings:
--   - Starting Time of Day (TOD)
--   - Starting Gold
--   - Starting Lumber
--   - Starting Hero Tokens (free heroes)
--   - Max heroes allowed per
--   - Max heroes allowed per hero type
--   - Distance from start loc to search for nearby mines
--
BJ.bj_MELEE_STARTING_TOD = 8.00
BJ.bj_MELEE_STARTING_GOLD_V0 = 750
BJ.bj_MELEE_STARTING_GOLD_V1 = 500
BJ.bj_MELEE_STARTING_LUMBER_V0 = 200
BJ.bj_MELEE_STARTING_LUMBER_V1 = 150
BJ.bj_MELEE_STARTING_HERO_TOKENS = 1
BJ.bj_MELEE_HERO_LIMIT = 3
BJ.bj_MELEE_HERO_TYPE_LIMIT = 1
BJ.bj_MELEE_MINE_SEARCH_RADIUS = 2000
BJ.bj_MELEE_CLEAR_UNITS_RADIUS = 1500
BJ.bj_MELEE_CRIPPLE_TIMEOUT = 120.00
BJ.bj_MELEE_CRIPPLE_MSG_DURATION = 20.00
BJ.bj_MELEE_MAX_TWINKED_HEROES_V0 = 3
BJ.bj_MELEE_MAX_TWINKED_HEROES_V1 = 1

-- Delay between a creep's death and the time it may drop an  .
BJ.bj_CREEP_ITEM_DELAY = 0.50

-- Timing settings for Marketplace inventories.
BJ.bj_STOCK_RESTOCK_INITIAL_DELAY = 120
BJ.bj_STOCK_RESTOCK_INTERVAL = 30
BJ.bj_STOCK_MAX_ITERATIONS = 20

-- Max events registered by a single "dest dies in  "  .
BJ.bj_MAX_DEST_IN_REGION_EVENTS = 64

-- Camera settings
BJ.bj_CAMERA_MIN_FARZ = 100
BJ.bj_CAMERA_DEFAULT_DISTANCE = 1650
BJ.bj_CAMERA_DEFAULT_FARZ = 5000
BJ.bj_CAMERA_DEFAULT_AOA = 304
BJ.bj_CAMERA_DEFAULT_FOV = 70
BJ.bj_CAMERA_DEFAULT_ROLL = 0
BJ.bj_CAMERA_DEFAULT_ROTATION = 90

-- Rescue
BJ.bj_RESCUE_PING_TIME = 2.00

-- Transmission behavior settings
BJ.bj_NOTHING_SOUND_DURATION = 5.00
BJ.bj_TRANSMISSION_PING_TIME = 1.00
BJ.bj_TRANSMISSION_IND_RED = 255
BJ.bj_TRANSMISSION_IND_BLUE = 255
BJ.bj_TRANSMISSION_IND_GREEN = 255
BJ.bj_TRANSMISSION_IND_ALPHA = 255
BJ.bj_TRANSMISSION_PORT_HANGTIME = 1.50

-- Cinematic mode settings
BJ.bj_CINEMODE_INTERFACEFADE = 0.50
BJ.bj_CINEMODE_GAMESPEED = CJ.MAP_SPEED_NORMAL

-- Cinematic mode volume levels
BJ.bj_CINEMODE_VOLUME_UNITMOVEMENT = 0.40
BJ.bj_CINEMODE_VOLUME_UNITSOUNDS = 0.00
BJ.bj_CINEMODE_VOLUME_COMBAT = 0.40
BJ.bj_CINEMODE_VOLUME_SPELLS = 0.40
BJ.bj_CINEMODE_VOLUME_UI = 0.00
BJ.bj_CINEMODE_VOLUME_MUSIC = 0.55
BJ.bj_CINEMODE_VOLUME_AMBIENTSOUNDS = 1.00
BJ.bj_CINEMODE_VOLUME_FIRE = 0.60

-- Speech mode volume levels
BJ.bj_SPEECH_VOLUME_UNITMOVEMENT = 0.25
BJ.bj_SPEECH_VOLUME_UNITSOUNDS = 0.00
BJ.bj_SPEECH_VOLUME_COMBAT = 0.25
BJ.bj_SPEECH_VOLUME_SPELLS = 0.25
BJ.bj_SPEECH_VOLUME_UI = 0.00
BJ.bj_SPEECH_VOLUME_MUSIC = 0.55
BJ.bj_SPEECH_VOLUME_AMBIENTSOUNDS = 1.00
BJ.bj_SPEECH_VOLUME_FIRE = 0.60

-- Smart pan settings
BJ.bj_SMARTPAN_TRESHOLD_PAN = 500
BJ.bj_SMARTPAN_TRESHOLD_SNAP = 3500

-- QueuedTriggerExecute settings
BJ.bj_MAX_QUEUED_TRIGGERS = 100
BJ.bj_QUEUED_TRIGGER_TIMEOUT = 180.00

-- Campaign indexing constants
BJ.bj_CAMPAIGN_INDEX_T = 0
BJ.bj_CAMPAIGN_INDEX_H = 1
BJ.bj_CAMPAIGN_INDEX_U = 2
BJ.bj_CAMPAIGN_INDEX_O = 3
BJ.bj_CAMPAIGN_INDEX_N = 4
BJ.bj_CAMPAIGN_INDEX_XN = 5
BJ.bj_CAMPAIGN_INDEX_XH = 6
BJ.bj_CAMPAIGN_INDEX_XU = 7
BJ.bj_CAMPAIGN_INDEX_XO = 8

-- Campaign offset constants (for mission indexing)
BJ.bj_CAMPAIGN_OFFSET_T = 0
BJ.bj_CAMPAIGN_OFFSET_H = 1
BJ.bj_CAMPAIGN_OFFSET_U = 2
BJ.bj_CAMPAIGN_OFFSET_O = 3
BJ.bj_CAMPAIGN_OFFSET_N = 4
BJ.bj_CAMPAIGN_OFFSET_XN = 0
BJ.bj_CAMPAIGN_OFFSET_XH = 1
BJ.bj_CAMPAIGN_OFFSET_XU = 2
BJ.bj_CAMPAIGN_OFFSET_XO = 3

-- Mission indexing constants
-- Tutorial
BJ.bj_MISSION_INDEX_T00 = BJ.bj_CAMPAIGN_OFFSET_T * 1000 + 0
BJ.bj_MISSION_INDEX_T01 = BJ.bj_CAMPAIGN_OFFSET_T * 1000 + 1
-- Human
BJ.bj_MISSION_INDEX_H00 = BJ.bj_CAMPAIGN_OFFSET_H * 1000 + 0
BJ.bj_MISSION_INDEX_H01 = BJ.bj_CAMPAIGN_OFFSET_H * 1000 + 1
BJ.bj_MISSION_INDEX_H02 = BJ.bj_CAMPAIGN_OFFSET_H * 1000 + 2
BJ.bj_MISSION_INDEX_H03 = BJ.bj_CAMPAIGN_OFFSET_H * 1000 + 3
BJ.bj_MISSION_INDEX_H04 = BJ.bj_CAMPAIGN_OFFSET_H * 1000 + 4
BJ.bj_MISSION_INDEX_H05 = BJ.bj_CAMPAIGN_OFFSET_H * 1000 + 5
BJ.bj_MISSION_INDEX_H06 = BJ.bj_CAMPAIGN_OFFSET_H * 1000 + 6
BJ.bj_MISSION_INDEX_H07 = BJ.bj_CAMPAIGN_OFFSET_H * 1000 + 7
BJ.bj_MISSION_INDEX_H08 = BJ.bj_CAMPAIGN_OFFSET_H * 1000 + 8
BJ.bj_MISSION_INDEX_H09 = BJ.bj_CAMPAIGN_OFFSET_H * 1000 + 9
BJ.bj_MISSION_INDEX_H10 = BJ.bj_CAMPAIGN_OFFSET_H * 1000 + 10
BJ.bj_MISSION_INDEX_H11 = BJ.bj_CAMPAIGN_OFFSET_H * 1000 + 11
-- Undead
BJ.bj_MISSION_INDEX_U00 = BJ.bj_CAMPAIGN_OFFSET_U * 1000 + 0
BJ.bj_MISSION_INDEX_U01 = BJ.bj_CAMPAIGN_OFFSET_U * 1000 + 1
BJ.bj_MISSION_INDEX_U02 = BJ.bj_CAMPAIGN_OFFSET_U * 1000 + 2
BJ.bj_MISSION_INDEX_U03 = BJ.bj_CAMPAIGN_OFFSET_U * 1000 + 3
BJ.bj_MISSION_INDEX_U05 = BJ.bj_CAMPAIGN_OFFSET_U * 1000 + 4
BJ.bj_MISSION_INDEX_U07 = BJ.bj_CAMPAIGN_OFFSET_U * 1000 + 5
BJ.bj_MISSION_INDEX_U08 = BJ.bj_CAMPAIGN_OFFSET_U * 1000 + 6
BJ.bj_MISSION_INDEX_U09 = BJ.bj_CAMPAIGN_OFFSET_U * 1000 + 7
BJ.bj_MISSION_INDEX_U10 = BJ.bj_CAMPAIGN_OFFSET_U * 1000 + 8
BJ.bj_MISSION_INDEX_U11 = BJ.bj_CAMPAIGN_OFFSET_U * 1000 + 9
-- Orc
BJ.bj_MISSION_INDEX_O00 = BJ.bj_CAMPAIGN_OFFSET_O * 1000 + 0
BJ.bj_MISSION_INDEX_O01 = BJ.bj_CAMPAIGN_OFFSET_O * 1000 + 1
BJ.bj_MISSION_INDEX_O02 = BJ.bj_CAMPAIGN_OFFSET_O * 1000 + 2
BJ.bj_MISSION_INDEX_O03 = BJ.bj_CAMPAIGN_OFFSET_O * 1000 + 3
BJ.bj_MISSION_INDEX_O04 = BJ.bj_CAMPAIGN_OFFSET_O * 1000 + 4
BJ.bj_MISSION_INDEX_O05 = BJ.bj_CAMPAIGN_OFFSET_O * 1000 + 5
BJ.bj_MISSION_INDEX_O06 = BJ.bj_CAMPAIGN_OFFSET_O * 1000 + 6
BJ.bj_MISSION_INDEX_O07 = BJ.bj_CAMPAIGN_OFFSET_O * 1000 + 7
BJ.bj_MISSION_INDEX_O08 = BJ.bj_CAMPAIGN_OFFSET_O * 1000 + 8
BJ.bj_MISSION_INDEX_O09 = BJ.bj_CAMPAIGN_OFFSET_O * 1000 + 9
BJ.bj_MISSION_INDEX_O10 = BJ.bj_CAMPAIGN_OFFSET_O * 1000 + 10
-- Night Elf
BJ.bj_MISSION_INDEX_N00 = BJ.bj_CAMPAIGN_OFFSET_N * 1000 + 0
BJ.bj_MISSION_INDEX_N01 = BJ.bj_CAMPAIGN_OFFSET_N * 1000 + 1
BJ.bj_MISSION_INDEX_N02 = BJ.bj_CAMPAIGN_OFFSET_N * 1000 + 2
BJ.bj_MISSION_INDEX_N03 = BJ.bj_CAMPAIGN_OFFSET_N * 1000 + 3
BJ.bj_MISSION_INDEX_N04 = BJ.bj_CAMPAIGN_OFFSET_N * 1000 + 4
BJ.bj_MISSION_INDEX_N05 = BJ.bj_CAMPAIGN_OFFSET_N * 1000 + 5
BJ.bj_MISSION_INDEX_N06 = BJ.bj_CAMPAIGN_OFFSET_N * 1000 + 6
BJ.bj_MISSION_INDEX_N07 = BJ.bj_CAMPAIGN_OFFSET_N * 1000 + 7
BJ.bj_MISSION_INDEX_N08 = BJ.bj_CAMPAIGN_OFFSET_N * 1000 + 8
BJ.bj_MISSION_INDEX_N09 = BJ.bj_CAMPAIGN_OFFSET_N * 1000 + 9
-- Expansion Night Elf
BJ.bj_MISSION_INDEX_XN00 = BJ.bj_CAMPAIGN_OFFSET_XN * 1000 + 0
BJ.bj_MISSION_INDEX_XN01 = BJ.bj_CAMPAIGN_OFFSET_XN * 1000 + 1
BJ.bj_MISSION_INDEX_XN02 = BJ.bj_CAMPAIGN_OFFSET_XN * 1000 + 2
BJ.bj_MISSION_INDEX_XN03 = BJ.bj_CAMPAIGN_OFFSET_XN * 1000 + 3
BJ.bj_MISSION_INDEX_XN04 = BJ.bj_CAMPAIGN_OFFSET_XN * 1000 + 4
BJ.bj_MISSION_INDEX_XN05 = BJ.bj_CAMPAIGN_OFFSET_XN * 1000 + 5
BJ.bj_MISSION_INDEX_XN06 = BJ.bj_CAMPAIGN_OFFSET_XN * 1000 + 6
BJ.bj_MISSION_INDEX_XN07 = BJ.bj_CAMPAIGN_OFFSET_XN * 1000 + 7
BJ.bj_MISSION_INDEX_XN08 = BJ.bj_CAMPAIGN_OFFSET_XN * 1000 + 8
BJ.bj_MISSION_INDEX_XN09 = BJ.bj_CAMPAIGN_OFFSET_XN * 1000 + 9
BJ.bj_MISSION_INDEX_XN10 = BJ.bj_CAMPAIGN_OFFSET_XN * 1000 + 10
-- Expansion Human
BJ.bj_MISSION_INDEX_XH00 = BJ.bj_CAMPAIGN_OFFSET_XH * 1000 + 0
BJ.bj_MISSION_INDEX_XH01 = BJ.bj_CAMPAIGN_OFFSET_XH * 1000 + 1
BJ.bj_MISSION_INDEX_XH02 = BJ.bj_CAMPAIGN_OFFSET_XH * 1000 + 2
BJ.bj_MISSION_INDEX_XH03 = BJ.bj_CAMPAIGN_OFFSET_XH * 1000 + 3
BJ.bj_MISSION_INDEX_XH04 = BJ.bj_CAMPAIGN_OFFSET_XH * 1000 + 4
BJ.bj_MISSION_INDEX_XH05 = BJ.bj_CAMPAIGN_OFFSET_XH * 1000 + 5
BJ.bj_MISSION_INDEX_XH06 = BJ.bj_CAMPAIGN_OFFSET_XH * 1000 + 6
BJ.bj_MISSION_INDEX_XH07 = BJ.bj_CAMPAIGN_OFFSET_XH * 1000 + 7
BJ.bj_MISSION_INDEX_XH08 = BJ.bj_CAMPAIGN_OFFSET_XH * 1000 + 8
BJ.bj_MISSION_INDEX_XH09 = BJ.bj_CAMPAIGN_OFFSET_XH * 1000 + 9
-- Expansion Undead
BJ.bj_MISSION_INDEX_XU00 = BJ.bj_CAMPAIGN_OFFSET_XU * 1000 + 0
BJ.bj_MISSION_INDEX_XU01 = BJ.bj_CAMPAIGN_OFFSET_XU * 1000 + 1
BJ.bj_MISSION_INDEX_XU02 = BJ.bj_CAMPAIGN_OFFSET_XU * 1000 + 2
BJ.bj_MISSION_INDEX_XU03 = BJ.bj_CAMPAIGN_OFFSET_XU * 1000 + 3
BJ.bj_MISSION_INDEX_XU04 = BJ.bj_CAMPAIGN_OFFSET_XU * 1000 + 4
BJ.bj_MISSION_INDEX_XU05 = BJ.bj_CAMPAIGN_OFFSET_XU * 1000 + 5
BJ.bj_MISSION_INDEX_XU06 = BJ.bj_CAMPAIGN_OFFSET_XU * 1000 + 6
BJ.bj_MISSION_INDEX_XU07 = BJ.bj_CAMPAIGN_OFFSET_XU * 1000 + 7
BJ.bj_MISSION_INDEX_XU08 = BJ.bj_CAMPAIGN_OFFSET_XU * 1000 + 8
BJ.bj_MISSION_INDEX_XU09 = BJ.bj_CAMPAIGN_OFFSET_XU * 1000 + 9
BJ.bj_MISSION_INDEX_XU10 = BJ.bj_CAMPAIGN_OFFSET_XU * 1000 + 10
BJ.bj_MISSION_INDEX_XU11 = BJ.bj_CAMPAIGN_OFFSET_XU * 1000 + 11
BJ.bj_MISSION_INDEX_XU12 = BJ.bj_CAMPAIGN_OFFSET_XU * 1000 + 12
BJ.bj_MISSION_INDEX_XU13 = BJ.bj_CAMPAIGN_OFFSET_XU * 1000 + 13

-- Expansion Orc
BJ.bj_MISSION_INDEX_XO00 = BJ.bj_CAMPAIGN_OFFSET_XO * 1000 + 0

-- Cinematic indexing constants
BJ.bj_CINEMATICINDEX_TOP = 0
BJ.bj_CINEMATICINDEX_HOP = 1
BJ.bj_CINEMATICINDEX_HED = 2
BJ.bj_CINEMATICINDEX_OOP = 3
BJ.bj_CINEMATICINDEX_OED = 4
BJ.bj_CINEMATICINDEX_UOP = 5
BJ.bj_CINEMATICINDEX_UED = 6
BJ.bj_CINEMATICINDEX_NOP = 7
BJ.bj_CINEMATICINDEX_NED = 8
BJ.bj_CINEMATICINDEX_XOP = 9
BJ.bj_CINEMATICINDEX_XED = 10

-- Alliance settings
BJ.bj_ALLIANCE_UNALLIED = 0
BJ.bj_ALLIANCE_UNALLIED_VISION = 1
BJ.bj_ALLIANCE_ALLIED = 2
BJ.bj_ALLIANCE_ALLIED_VISION = 3
BJ.bj_ALLIANCE_ALLIED_UNITS = 4
BJ.bj_ALLIANCE_ALLIED_ADVUNITS = 5
BJ.bj_ALLIANCE_NEUTRAL = 6
BJ.bj_ALLIANCE_NEUTRAL_VISION = 7

-- Keyboard Event Types
BJ.bj_KEYEVENTTYPE_DEPRESS = 0
BJ.bj_KEYEVENTTYPE_RELEASE = 1

-- Keyboard Event Keys
BJ.bj_KEYEVENTKEY_LEFT = 0
BJ.bj_KEYEVENTKEY_RIGHT = 1
BJ.bj_KEYEVENTKEY_DOWN = 2
BJ.bj_KEYEVENTKEY_UP = 3

-- Transmission timing methods
BJ.bj_TIMETYPE_ADD = 0
BJ.bj_TIMETYPE_SET = 1
BJ.bj_TIMETYPE_SUB = 2

-- Camera bounds adjustment methods
BJ.bj_CAMERABOUNDS_ADJUST_ADD = 0
BJ.bj_CAMERABOUNDS_ADJUST_SUB = 1

-- Quest creation states
BJ.bj_QUESTTYPE_REQ_DISCOVERED = 0
BJ.bj_QUESTTYPE_REQ_UNDISCOVERED = 1
BJ.bj_QUESTTYPE_OPT_DISCOVERED = 2
BJ.bj_QUESTTYPE_OPT_UNDISCOVERED = 3

-- Quest message types
BJ.bj_QUESTMESSAGE_DISCOVERED = 0
BJ.bj_QUESTMESSAGE_UPDATED = 1
BJ.bj_QUESTMESSAGE_COMPLETED = 2
BJ.bj_QUESTMESSAGE_FAILED = 3
BJ.bj_QUESTMESSAGE_REQUIREMENT = 4
BJ.bj_QUESTMESSAGE_MISSIONFAILED = 5
BJ.bj_QUESTMESSAGE_ALWAYSHINT = 6
BJ.bj_QUESTMESSAGE_HINT = 7
BJ.bj_QUESTMESSAGE_SECRET = 8
BJ.bj_QUESTMESSAGE_UNITACQUIRED = 9
BJ.bj_QUESTMESSAGE_UNITAVAILABLE = 10
BJ.bj_QUESTMESSAGE_ITEMACQUIRED = 11
BJ.bj_QUESTMESSAGE_WARNING = 12

-- Leaderboard sorting methods
BJ.bj_SORTTYPE_SORTBYVALUE = 0
BJ.bj_SORTTYPE_SORTBYPLAYER = 1
BJ.bj_SORTTYPE_SORTBYLABEL = 2

-- Cinematic fade filter methods
BJ.bj_CINEFADETYPE_FADEIN = 0
BJ.bj_CINEFADETYPE_FADEOUT = 1
BJ.bj_CINEFADETYPE_FADEOUTIN = 2

-- Buff removal methods
BJ.bj_REMOVEBUFFS_POSITIVE = 0
BJ.bj_REMOVEBUFFS_NEGATIVE = 1
BJ.bj_REMOVEBUFFS_ALL = 2
BJ.bj_REMOVEBUFFS_NONTLIFE = 3

-- Buff properties - polarity
BJ.bj_BUFF_POLARITY_POSITIVE = 0
BJ.bj_BUFF_POLARITY_NEGATIVE = 1
BJ.bj_BUFF_POLARITY_EITHER = 2

-- Buff properties - resist type
BJ.bj_BUFF_RESIST_MAGIC = 0
BJ.bj_BUFF_RESIST_PHYSICAL = 1
BJ.bj_BUFF_RESIST_EITHER = 2
BJ.bj_BUFF_RESIST_BOTH = 3

-- Hero stats
BJ.bj_HEROSTAT_STR = 0
BJ.bj_HEROSTAT_AGI = 1
BJ.bj_HEROSTAT_INT = 2

-- Hero skill point modification methods
BJ.bj_MODIFYMETHOD_ADD = 0
BJ.bj_MODIFYMETHOD_SUB = 1
BJ.bj_MODIFYMETHOD_SET = 2

-- Unit state adjustment methods (for replaced units)
BJ.bj_UNIT_STATE_METHOD_ABSOLUTE = 0
BJ.bj_UNIT_STATE_METHOD_RELATIVE = 1
BJ.bj_UNIT_STATE_METHOD_DEFAULTS = 2
BJ.bj_UNIT_STATE_METHOD_MAXIMUM = 3

-- Gate operations
BJ.bj_GATEOPERATION_CLOSE = 0
BJ.bj_GATEOPERATION_OPEN = 1
BJ.bj_GATEOPERATION_DESTROY = 2

-- Game cache value types
BJ.bj_GAMECACHE_BOOLEAN = 0
BJ.bj_GAMECACHE_INTEGER = 1
BJ.bj_GAMECACHE_REAL = 2
BJ.bj_GAMECACHE_UNIT = 3
BJ.bj_GAMECACHE_STRING = 4

-- Hashtable value types
BJ.bj_HASHTABLE_BOOLEAN = 0
BJ.bj_HASHTABLE_INTEGER = 1
BJ.bj_HASHTABLE_REAL = 2
BJ.bj_HASHTABLE_STRING = 3
BJ.bj_HASHTABLE_HANDLE = 4

-- Item status types
BJ.bj_ITEM_STATUS_HIDDEN = 0
BJ.bj_ITEM_STATUS_OWNED = 1
BJ.bj_ITEM_STATUS_INVULNERABLE = 2
BJ.bj_ITEM_STATUS_POWERUP = 3
BJ.bj_ITEM_STATUS_SELLABLE = 4
BJ.bj_ITEM_STATUS_PAWNABLE = 5

-- Itemcode status types
BJ.bj_ITEMCODE_STATUS_POWERUP = 0
BJ.bj_ITEMCODE_STATUS_SELLABLE = 1
BJ.bj_ITEMCODE_STATUS_PAWNABLE = 2

-- Minimap ping styles
BJ.bj_MINIMAPPINGSTYLE_SIMPLE = 0
BJ.bj_MINIMAPPINGSTYLE_FLASHY = 1
BJ.bj_MINIMAPPINGSTYLE_ATTACK = 2

-- Corpse creation settings
BJ.bj_CORPSE_MAX_DEATH_TIME = 8.00

-- Corpse creation styles
BJ.bj_CORPSETYPE_FLESH = 0
BJ.bj_CORPSETYPE_BONE = 1

-- Elevator pathing-blocker
BJ.bj_ELEVATOR_BLOCKER_CODE = 'DTep'
BJ.bj_ELEVATOR_CODE01 = 'DTrf'
BJ.bj_ELEVATOR_CODE02 = 'DTrx'

-- Elevator wall codes
BJ.bj_ELEVATOR_WALL_TYPE_ALL = 0
BJ.bj_ELEVATOR_WALL_TYPE_EAST = 1
BJ.bj_ELEVATOR_WALL_TYPE_NORTH = 2
BJ.bj_ELEVATOR_WALL_TYPE_SOUTH = 3
BJ.bj_ELEVATOR_WALL_TYPE_WEST = 4

-------------------------------------------------------------------------
-- Variables
--

-- Force predefs
BJ.bj_FORCE_ALL_PLAYERS = nil
BJ.bj_FORCE_PLAYER = {}

BJ.bj_MELEE_MAX_TWINKED_HEROES = 0

-- Map area rects
BJ.bj_mapInitialPlayableArea = nil
BJ.bj_mapInitialCameraBounds = nil

-- Utility function BJ.vars
BJ.bj_forLoopAIndex = 0
BJ.bj_forLoopBIndex = 0
BJ.bj_forLoopAIndexEnd = 0
BJ.bj_forLoopBIndexEnd = 0

BJ.bj_slotControlReady = false
BJ.bj_slotControlUsed = {}
BJ.bj_slotControl = {}

-- Game started detection vars
BJ.bj_gameStartedTimer = nil
BJ.bj_gameStarted = false
BJ.bj_volumeGroupsTimer = CJ.CreateTimer()

-- Singleplayer check
BJ.bj_isSinglePlayer = false

-- Day/Night Cycle vars
BJ.bj_dncSoundsDay = nil
BJ.bj_dncSoundsNight = nil
BJ.bj_dayAmbientSound = nil
BJ.bj_nightAmbientSound = nil
BJ.bj_dncSoundsDawn = nil
BJ.bj_dncSoundsDusk = nil
BJ.bj_dawnSound = nil
BJ.bj_duskSound = nil
BJ.bj_useDawnDuskSounds = true
BJ.bj_dncIsDaytime = false

-- Triggered sounds
--               bj_pingMinimapSound         = nil
BJ.bj_rescueSound = nil
BJ.bj_questDiscoveredSound = nil
BJ.bj_questUpdatedSound = nil
BJ.bj_questCompletedSound = nil
BJ.bj_questFailedSound = nil
BJ.bj_questHintSound = nil
BJ.bj_questSecretSound = nil
BJ.bj_questItemAcquiredSound = nil
BJ.bj_questWarningSound = nil
BJ.bj_victoryDialogSound = nil
BJ.bj_defeatDialogSound = nil

-- Marketplace vars
BJ.bj_stockItemPurchased = nil
BJ.bj_stockUpdateTimer = nil
BJ.bj_stockAllowedPermanent = {}
BJ.bj_stockAllowedCharged = {}
BJ.bj_stockAllowedArtifact = {}
BJ.bj_stockPickedItemLevel = 0
BJ.bj_stockPickedItemType = nil

-- Melee vars
BJ.bj_meleeVisibilityTrained = nil
BJ.bj_meleeVisibilityIsDay = true
BJ.bj_meleeGrantHeroItems = false
BJ.bj_meleeNearestMineToLoc = nil
BJ.bj_meleeNearestMine = nil
BJ.bj_meleeNearestMineDist = 0.00
BJ.bj_meleeGameOver = false
BJ.bj_meleeDefeated = {}
BJ.bj_meleeVictoried = {}
BJ.bj_ghoul = {}
BJ.bj_crippledTimer = {}
BJ.bj_crippledTimerWindows = {}
BJ.bj_playerIsCrippled = {}
BJ.bj_playerIsExposed = {}
BJ.bj_finishSoonAllExposed = false
BJ.bj_finishSoonTimerDialog = nil
BJ.bj_meleeTwinkedHeroes = {}

-- Rescue behavior vars
BJ.bj_rescueUnitBehavior = nil
BJ.bj_rescueChangeColorUnit = true
BJ.bj_rescueChangeColorBldg = true

-- Transmission vars
BJ.bj_cineSceneEndingTimer = nil
BJ.bj_cineSceneLastSound = nil
BJ.bj_cineSceneBeingSkipped = nil

-- Cinematic mode vars
BJ.bj_cineModePriorSpeed = CJ.MAP_SPEED_NORMAL
BJ.bj_cineModePriorFogSetting = false
BJ.bj_cineModePriorMaskSetting = false
BJ.bj_cineModeAlreadyIn = false
BJ.bj_cineModePriorDawnDusk = false
BJ.bj_cineModeSavedSeed = 0

-- Cinematic fade vars
BJ.bj_cineFadeFinishTimer = nil
BJ.bj_cineFadeContinueTimer = nil
BJ.bj_cineFadeContinueRed = 0
BJ.bj_cineFadeContinueGreen = 0
BJ.bj_cineFadeContinueBlue = 0
BJ.bj_cineFadeContinueTrans = 0
BJ.bj_cineFadeContinueDuration = 0
BJ.bj_cineFadeContinueTex = ""

-- QueuedTriggerExecute vars
BJ.bj_queuedExecTotal = 0
BJ.bj_queuedExecTriggers = {}
BJ.bj_queuedExecUseConds = {}
BJ.bj_queuedExecTimeoutTimer = CJ.CreateTimer()
BJ.bj_queuedExecTimeout = nil

-- Helper vars (for Filter and Enum funcs)
BJ.bj_destInRegionDiesCount = 0
BJ.bj_destInRegionDiesTrig = nil
BJ.bj_groupCountUnits = 0
BJ.bj_forceCountPlayers = 0
BJ.bj_groupEnumTypeId = 0
BJ.bj_groupEnumOwningPlayer = nil
BJ.bj_groupAddGroupDest = nil
BJ.bj_groupRemoveGroupDest = nil
BJ.bj_groupRandomConsidered = 0
BJ.bj_groupRandomCurrentPick = nil
BJ.bj_groupLastCreatedDest = nil
BJ.bj_randomSubGroupGroup = nil
BJ.bj_randomSubGroupWant = 0
BJ.bj_randomSubGroupTotal = 0
BJ.bj_randomSubGroupChance = 0
BJ.bj_destRandomConsidered = 0
BJ.bj_destRandomCurrentPick = nil
BJ.bj_elevatorWallBlocker = nil
BJ.bj_elevatorNeighbor = nil
BJ.bj_itemRandomConsidered = 0
BJ.bj_itemRandomCurrentPick = nil
BJ.bj_forceRandomConsidered = 0
BJ.bj_forceRandomCurrentPick = nil
BJ.bj_makeUnitRescuableUnit = nil
BJ.bj_makeUnitRescuableFlag = true
BJ.bj_pauseAllUnitsFlag = true
BJ.bj_enumDestructableCenter = nil
BJ.bj_enumDestructableRadius = 0
BJ.bj_setPlayerTargetColor = nil
BJ.bj_isUnitGroupDeadResult = true
BJ.bj_isUnitGroupEmptyResult = true
BJ.bj_isUnitGroupInRectResult = true
BJ.bj_isUnitGroupInRectRect = nil
BJ.bj_changeLevelShowScores = false
BJ.bj_changeLevelMapName = nil
BJ.bj_suspendDecayFleshGroup = CJ.CreateGroup()
BJ.bj_suspendDecayBoneGroup = CJ.CreateGroup()
BJ.bj_delayedSuspendDecayTimer = CJ.CreateTimer()
BJ.bj_delayedSuspendDecayTrig = nil
BJ.bj_livingPlayerUnitsTypeId = 0
BJ.bj_lastDyingWidget = nil

-- Random distribution vars
BJ.bj_randDistCount = 0
BJ.bj_randDistID = {}
BJ.bj_randDistChance = {}

-- Last X'd vars
BJ.bj_lastCreatedUnit = nil
BJ.bj_lastCreatedItem = nil
BJ.bj_lastRemovedItem = nil
BJ.bj_lastHauntedGoldMine = nil
BJ.bj_lastCreatedDestructable = nil
BJ.bj_lastCreatedGroup = CJ.CreateGroup()
BJ.bj_lastCreatedFogModifier = nil
BJ.bj_lastCreatedEffect = nil
BJ.bj_lastCreatedWeatherEffect = nil
BJ.bj_lastCreatedTerrainDeformation = nil
BJ.bj_lastCreatedQuest = nil
BJ.bj_lastCreatedQuestItem = nil
BJ.bj_lastCreatedDefeatCondition = nil
BJ.bj_lastStartedTimer = CJ.CreateTimer()
BJ.bj_lastCreatedTimerDialog = nil
BJ.bj_lastCreatedLeaderboard = nil
BJ.bj_lastCreatedMultiboard = nil
BJ.bj_lastPlayedSound = nil
BJ.bj_lastPlayedMusic = ""
BJ.bj_lastTransmissionDuration = 0
BJ.bj_lastCreatedGameCache = nil
BJ.bj_lastCreatedHashtable = nil
BJ.bj_lastLoadedUnit = nil
BJ.bj_lastCreatedButton = nil
BJ.bj_lastReplacedUnit = nil
BJ.bj_lastCreatedTextTag = nil
BJ.bj_lastCreatedLightning = nil
BJ.bj_lastCreatedImage = nil
BJ.bj_lastCreatedUbersplat = nil

-- Filter function BJ.vars
BJ.filterIssueHauntOrderAtLocBJ = nil
BJ.filterEnumDestructablesInCircleBJ = nil
BJ.filterGetUnitsInRectOfPlayer = nil
BJ.filterGetUnitsOfTypeIdAll = nil
BJ.filterGetUnitsOfPlayerAndTypeId = nil
BJ.filterMeleeTrainedUnitIsHeroBJ = nil
BJ.filterLivingPlayerUnitsOfTypeId = nil

-- Memory cleanup vars
BJ.bj_wantDestroyGroup = false

BJ.bj_MAX_PLAYER_SLOTS = 16
function BJ.TriggerRegisterAnyUnitEventBJ(trig, event)
    for i = 0, BJ.bj_MAX_PLAYER_SLOTS - 1 do
        CJ.TriggerRegisterPlayerUnitEvent(trig, CJ.Player(i), event, nil)
    end
end

function BJ.GetConvertedPlayerId(whichPlayer)
    return CJ.GetPlayerId(whichPlayer) + 1
end

function BJ.TriggerRegisterPlayerEventEndCinematic(trig, whichPlayer)
    return CJ.TriggerRegisterPlayerEvent(trig, whichPlayer,
                                         CJ.EVENT_PLAYER_END_CINEMATIC)
end

function BJ.CreateItemLoc(itemId, loc)
    BJ.bj_lastCreatedItem = CJ.CreateItem(itemId, CJ.GetLocationX(loc),
                                          CJ.GetLocationY(loc))
    return BJ.bj_lastCreatedItem
end
function BJ.GetLastCreatedItem() return BJ.bj_lastCreatedItem end

function BJ.SetPlayerAbilityAvailableBJ(avail, abilid, whichPlayer)
    CJ.SetPlayerAbilityAvailable(whichPlayer, abilid, avail)
end

function BJ.ExplodeUnitBJ(whichUnit)
    CJ.SetUnitExploded(whichUnit, true)
    CJ.KillUnit(whichUnit)
end
-- ===========================================================================CreateNUnitsAtLoc
function BJ.CreateNUnitsAtLoc(count, unitId, whichPlayer, loc, face)
    CJ.GroupClear(BJ.bj_lastCreatedGroup)
    while true do
        count = count - 1
        if count < 0 then break end
        BJ.CreateUnitAtLocSaveLast(whichPlayer, unitId, loc, face)
        CJ.GroupAddUnit(BJ.bj_lastCreatedGroup, BJ.bj_lastCreatedUnit)
    end
    return BJ.bj_lastCreatedGroup
end
function BJ.CreateUnitAtLocSaveLast(id, unitid, loc, face)
    if (unitid == 'ugol') then
        BJ.bj_lastCreatedUnit = CJ.CreateBlightedGoldmine(id,
                                                          CJ.GetLocationX(loc),
                                                          CJ.GetLocationY(loc),
                                                          face)
    else
        BJ.bj_lastCreatedUnit = CJ.CreateUnitAtLoc(id, unitid, loc, face)
    end

    return BJ.bj_lastCreatedUnit
end

function BJ.GetLastCreatedUnit() return BJ.bj_lastCreatedUnit end

-- ===========================================================================
function BJ.CreateNUnitsAtLocFacingLocBJ(count, unitId, whichPlayer, loc, lookAt)
    return CJ.CreateNUnitsAtLoc(count, unitId, whichPlayer, loc,
                                BJ.AngleBetweenPoints(loc, lookAt))
end

-- ===========================================================================
function BJ.AngleBetweenPoints(locA, locB)
    return BJ.bj_RADTODEG *
               CJ.Atan2(CJ.GetLocationY(locB) - CJ.GetLocationY(locA),
                        CJ.GetLocationX(locB) - CJ.GetLocationX(locA))
end

function BJ.UnitRemoveItemSwapped(whichItem, whichHero)
    BJ.bj_lastRemovedItem = whichItem
    CJ.UnitRemoveItem(whichHero, whichItem)
end

function BJ.UnitAddItemByIdSwapped(itemId, whichHero)
    -- Create the   at the hero's feet first, and then give it to him.
    -- This is to ensure that the   will be left at the hero's feet if
    -- his inventory is full.
    BJ.bj_lastCreatedItem = CJ.CreateItem(itemId, CJ.GetUnitX(whichHero),
                                          CJ.GetUnitY(whichHero))
    CJ.UnitAddItem(whichHero, BJ.bj_lastCreatedItem)
    return BJ.bj_lastCreatedItem
end

function BJ.TriggerRegisterPlayerSelectionEventBJ(trig, whichPlayer, selected)
    if selected then
        return CJ.TriggerRegisterPlayerUnitEvent(trig, whichPlayer,
                                                 CJ.EVENT_PLAYER_UNIT_SELECTED,
                                                 nil)
    else
        return CJ.TriggerRegisterPlayerUnitEvent(trig, whichPlayer,
                                                 CJ.EVENT_PLAYER_UNIT_DESELECTED,
                                                 nil)
    end
end

function BJ.UnitHasBuffBJ(whichUnit, buffcode)
    return (CJ.GetUnitAbilityLevel(whichUnit, buffcode) > 0)
end
-- ***************************************************************************
-- *
-- *  Unit Utility Functions
-- *
-- ***************************************************************************

-- ===========================================================================
function BJ.UnitId2OrderIdBJ(unitId) return unitId end

-- ===========================================================================
function BJ.String2UnitIdBJ(unitIdString) return CJ.UnitId(unitIdString) end

-- ===========================================================================
function BJ.UnitId2StringBJ(unitId)
    local unitString = CJ.UnitId2String(unitId)

    if (unitString ~= nil) then return unitString end

    -- The unitId was not recognized - return an empty  .
    return ""
end

-- ===========================================================================
function BJ.String2OrderIdBJ(orderIdString)
    local orderId

    -- Check to see if it's a generic order.
    orderId = CJ.OrderId(orderIdString)
    if (orderId ~= 0) then return orderId end

    -- Check to see if it's a (train)   order.
    orderId = CJ.UnitId(orderIdString)
    if (orderId ~= 0) then return orderId end

    -- Unrecognized - return 0
    return 0
end

-- ===========================================================================
function BJ.OrderId2StringBJ(orderId)
    local orderString

    -- Check to see if it's a generic order.
    orderString = CJ.OrderId2String(orderId)
    if (orderString ~= nil) then return orderString end

    -- Check to see if it's a (train)   order.
    orderString = CJ.UnitId2String(orderId)
    if (orderString ~= nil) then return orderString end

    -- Unrecognized - return an empty  .
    return ""
end

-- ===========================================================================
-- ===========================================================================
function BJ.GetIssuedOrderIdBJ() return CJ.GetIssuedOrderId() end

-- ===========================================================================
function BJ.GetKillingUnitBJ() return CJ.GetKillingUnit() end

-- ===========================================================================

-- ===========================================================================
function BJ.TriggerRegisterTimerEventPeriodic(trig, timeout)
    return CJ.TriggerRegisterTimerEvent(trig, timeout, true)
end

-- ===========================================================================
function BJ.TriggerRegisterTimerEventSingle(trig, timeout)
    return CJ.TriggerRegisterTimerEvent(trig, timeout, false)
end

-- ===========================================================================
function BJ.TriggerRegisterTimerExpireEventBJ(trig, t)
    return CJ.TriggerRegisterTimerExpireEvent(trig, t)
end

-- ===========================================================================
function BJ.TriggerRegisterPlayerUnitEventSimple(trig, whichPlayer, whichEvent)
    return CJ.TriggerRegisterPlayerUnitEvent(trig, whichPlayer, whichEvent, nil)
end

-- ===========================================================================

-- ===========================================================================
function BJ.QuestMessageBJ(f, messageType, message)
    if (CJ.IsPlayerInForce(CJ.GetLocalPlayer(), f)) then
        -- Use only local   (no net traffic) within this block to avoid desyncs.

        if (messageType == BJ.bj_QUESTMESSAGE_DISCOVERED) then
            CJ.DisplayTimedTextToPlayer(CJ.GetLocalPlayer(), 0, 0,
                                        BJ.bj_TEXT_DELAY_QUEST, " ")
            CJ.DisplayTimedTextToPlayer(CJ.GetLocalPlayer(), 0, 0,
                                        BJ.bj_TEXT_DELAY_QUEST, message)
            CJ.StartSound(BJ.bj_questDiscoveredSound)
            CJ.FlashQuestDialogButton()

        elseif (messageType == BJ.bj_QUESTMESSAGE_UPDATED) then
            CJ.DisplayTimedTextToPlayer(CJ.GetLocalPlayer(), 0, 0,
                                        BJ.bj_TEXT_DELAY_QUESTUPDATE, " ")
            CJ.DisplayTimedTextToPlayer(CJ.GetLocalPlayer(), 0, 0,
                                        BJ.bj_TEXT_DELAY_QUESTUPDATE, message)
            CJ.StartSound(BJ.bj_questUpdatedSound)
            CJ.FlashQuestDialogButton()

        elseif (messageType == BJ.bj_QUESTMESSAGE_COMPLETED) then
            CJ.DisplayTimedTextToPlayer(CJ.GetLocalPlayer(), 0, 0,
                                        BJ.bj_TEXT_DELAY_QUESTDONE, " ")
            CJ.DisplayTimedTextToPlayer(CJ.GetLocalPlayer(), 0, 0,
                                        BJ.bj_TEXT_DELAY_QUESTDONE, message)
            CJ.StartSound(BJ.bj_questCompletedSound)
            CJ.FlashQuestDialogButton()

        elseif (messageType == BJ.bj_QUESTMESSAGE_FAILED) then
            CJ.DisplayTimedTextToPlayer(CJ.GetLocalPlayer(), 0, 0,
                                        BJ.bj_TEXT_DELAY_QUESTFAILED, " ")
            CJ.DisplayTimedTextToPlayer(CJ.GetLocalPlayer(), 0, 0,
                                        BJ.bj_TEXT_DELAY_QUESTFAILED, message)
            CJ.StartSound(BJ.bj_questFailedSound)
            CJ.FlashQuestDialogButton()

        elseif (messageType == BJ.bj_QUESTMESSAGE_REQUIREMENT) then
            CJ.DisplayTimedTextToPlayer(CJ.GetLocalPlayer(), 0, 0,
                                        BJ.bj_TEXT_DELAY_QUESTREQUIREMENT,
                                        message)

        elseif (messageType == BJ.bj_QUESTMESSAGE_MISSIONFAILED) then
            CJ.DisplayTimedTextToPlayer(CJ.GetLocalPlayer(), 0, 0,
                                        BJ.bj_TEXT_DELAY_MISSIONFAILED, " ")
            CJ.DisplayTimedTextToPlayer(CJ.GetLocalPlayer(), 0, 0,
                                        BJ.bj_TEXT_DELAY_MISSIONFAILED, message)
            CJ.StartSound(BJ.bj_questFailedSound)

        elseif (messageType == BJ.bj_QUESTMESSAGE_HINT) then
            CJ.DisplayTimedTextToPlayer(CJ.GetLocalPlayer(), 0, 0,
                                        BJ.bj_TEXT_DELAY_HINT, " ")
            CJ.DisplayTimedTextToPlayer(CJ.GetLocalPlayer(), 0, 0,
                                        BJ.bj_TEXT_DELAY_HINT, message)
            CJ.StartSound(BJ.bj_questHintSound)

        elseif (messageType == BJ.bj_QUESTMESSAGE_ALWAYSHINT) then
            CJ.DisplayTimedTextToPlayer(CJ.GetLocalPlayer(), 0, 0,
                                        BJ.bj_TEXT_DELAY_ALWAYSHINT, " ")
            CJ.DisplayTimedTextToPlayer(CJ.GetLocalPlayer(), 0, 0,
                                        BJ.bj_TEXT_DELAY_ALWAYSHINT, message)
            CJ.StartSound(BJ.bj_questHintSound)

        elseif (messageType == BJ.bj_QUESTMESSAGE_SECRET) then
            CJ.DisplayTimedTextToPlayer(CJ.GetLocalPlayer(), 0, 0,
                                        BJ.bj_TEXT_DELAY_SECRET, " ")
            CJ.DisplayTimedTextToPlayer(CJ.GetLocalPlayer(), 0, 0,
                                        BJ.bj_TEXT_DELAY_SECRET, message)
            CJ.StartSound(BJ.bj_questSecretSound)

        elseif (messageType == BJ.bj_QUESTMESSAGE_UNITACQUIRED) then
            CJ.DisplayTimedTextToPlayer(CJ.GetLocalPlayer(), 0, 0,
                                        BJ.bj_TEXT_DELAY_UNITACQUIRED, " ")
            CJ.DisplayTimedTextToPlayer(CJ.GetLocalPlayer(), 0, 0,
                                        BJ.bj_TEXT_DELAY_UNITACQUIRED, message)
            CJ.StartSound(BJ.bj_questHintSound)

        elseif (messageType == BJ.bj_QUESTMESSAGE_UNITAVAILABLE) then
            CJ.DisplayTimedTextToPlayer(CJ.GetLocalPlayer(), 0, 0,
                                        BJ.bj_TEXT_DELAY_UNITAVAILABLE, " ")
            CJ.DisplayTimedTextToPlayer(CJ.GetLocalPlayer(), 0, 0,
                                        BJ.bj_TEXT_DELAY_UNITAVAILABLE, message)
            CJ.StartSound(BJ.bj_questHintSound)

        elseif (messageType == BJ.bj_QUESTMESSAGE_ITEMACQUIRED) then
            CJ.DisplayTimedTextToPlayer(CJ.GetLocalPlayer(), 0, 0,
                                        BJ.bj_TEXT_DELAY_ITEMACQUIRED, " ")
            CJ.DisplayTimedTextToPlayer(CJ.GetLocalPlayer(), 0, 0,
                                        BJ.bj_TEXT_DELAY_ITEMACQUIRED, message)
            CJ.StartSound(BJ.bj_questItemAcquiredSound)

        elseif (messageType == BJ.bj_QUESTMESSAGE_WARNING) then
            CJ.DisplayTimedTextToPlayer(CJ.GetLocalPlayer(), 0, 0,
                                        BJ.bj_TEXT_DELAY_WARNING, " ")
            CJ.DisplayTimedTextToPlayer(CJ.GetLocalPlayer(), 0, 0,
                                        BJ.bj_TEXT_DELAY_WARNING, message)
            CJ.StartSound(BJ.bj_questWarningSound)

        else
            -- Unrecognized message type - ignore the request.
        end
    end
end
function BJ.GetPlayersAll() return BJ.bj_FORCE_ALL_PLAYERS end

-- ===========================================================================
function BJ.GetCurrentCameraBoundsMapRectBJ()
    return CJ.Rect(CJ.GetCameraBoundMinX(), CJ.GetCameraBoundMinY(),
                   CJ.GetCameraBoundMaxX(), CJ.GetCameraBoundMaxY())
end

function BJ.InitMapRects()
    BJ.bj_mapInitialPlayableArea = CJ.Rect(
                                       CJ.GetCameraBoundMinX() -
                                           CJ.GetCameraMargin(
                                               CJ.CAMERA_MARGIN_LEFT),
                                       CJ.GetCameraBoundMinY() -
                                           CJ.GetCameraMargin(
                                               CJ.CAMERA_MARGIN_BOTTOM),
                                       CJ.GetCameraBoundMaxX() +
                                           CJ.GetCameraMargin(
                                               CJ.CAMERA_MARGIN_RIGHT),
                                       CJ.GetCameraBoundMaxY() +
                                           CJ.GetCameraMargin(
                                               CJ.CAMERA_MARGIN_TOP))
    BJ.bj_mapInitialCameraBounds = BJ.GetCurrentCameraBoundsMapRectBJ()
end

-- ===========================================================================

function BJ.GetPlayableMapRect()
    -- return bj_mapInitialPlayableArea
    return CJ.Rect(CJ.GetCameraBoundMinX() -
                       CJ.GetCameraMargin(CJ.CAMERA_MARGIN_LEFT),
                   CJ.GetCameraBoundMinY() -
                       CJ.GetCameraMargin(CJ.CAMERA_MARGIN_BOTTOM),
                   CJ.GetCameraBoundMaxX() +
                       CJ.GetCameraMargin(CJ.CAMERA_MARGIN_RIGHT),
                   CJ.GetCameraBoundMaxY() +
                       CJ.GetCameraMargin(CJ.CAMERA_MARGIN_TOP))
end
function BJ.TriggerRegisterEnterRectSimple(trig, r)
    local rectRegion = CJ.CreateRegion()
    CJ.RegionAddRect(rectRegion, r)
    return CJ.TriggerRegisterEnterRegion(trig, rectRegion, nil)
end

BJ.CountUnitsInGroupEnum = function()
    BJ.bj_groupCountUnits = BJ.bj_groupCountUnits + 1
end

BJ.CountUnitsInGroup = function(g)

    local wantDestroy = BJ.bj_wantDestroyGroup
    BJ.bj_wantDestroyGroup = false
    BJ.bj_groupCountUnits = 0
    CJ.ForGroup(g, BJ.CountUnitsInGroupEnum)

    if (wantDestroy) then CJ.DestroyGroup(g) end
    do return BJ.bj_groupCountUnits end
end

BJ.ForGroupBJ = function(whichGroup, callback)

    local wantDestroy = BJ.bj_wantDestroyGroup
    BJ.bj_wantDestroyGroup = false
    CJ.ForGroup(whichGroup, callback)

    if (wantDestroy) then CJ.DestroyGroup(whichGroup) end
end

BJ.GroupAddUnitSimple = function(whichUnit, whichGroup)
    CJ.GroupAddUnit(whichGroup, whichUnit)
end

BJ.GroupRemoveUnitSimple = function(whichUnit, whichGroup)
    CJ.GroupRemoveUnit(whichGroup, whichUnit)
end

BJ.GroupAddGroupEnum = function()
    CJ.GroupAddUnit(BJ.bj_groupAddGroupDest, CJ.GetEnumUnit())
end

BJ.GroupAddGroup = function(sourceGroup, destGroup)

    local wantDestroy = BJ.bj_wantDestroyGroup
    BJ.bj_wantDestroyGroup = false
    BJ.bj_groupAddGroupDest = destGroup
    CJ.ForGroup(sourceGroup, BJ.GroupAddGroupEnum)

    if (wantDestroy) then CJ.DestroyGroup(sourceGroup) end
end

BJ.GroupRemoveGroupEnum = function()
    CJ.GroupRemoveUnit(BJ.bj_groupRemoveGroupDest, CJ.GetEnumUnit())
end

BJ.GroupRemoveGroup = function(sourceGroup, destGroup)

    local wantDestroy = BJ.bj_wantDestroyGroup
    BJ.bj_wantDestroyGroup = false
    BJ.bj_groupRemoveGroupDest = destGroup
    CJ.ForGroup(sourceGroup, BJ.GroupRemoveGroupEnum)

    if (wantDestroy) then CJ.DestroyGroup(sourceGroup) end
end

BJ.ForceAddPlayerSimple = function(whichPlayer, whichForce)
    CJ.ForceAddPlayer(whichForce, whichPlayer)
end

BJ.ForceRemovePlayerSimple = function(whichPlayer, whichForce)
    CJ.ForceRemovePlayer(whichForce, whichPlayer)
end

BJ.GetUnitsInRangeOfLocMatching = function(radius, whichLocation, filter)
    local g = CJ.CreateGroup()
    CJ.GroupEnumUnitsInRangeOfLoc(g, whichLocation, radius, filter)
    CJ.DestroyBoolExpr(filter)
    do return g end
end

BJ.DistanceBetweenPoints = function(locA, locB)
    local dx = CJ.GetLocationX(locB) - CJ.GetLocationX(locA)
    local dy = CJ.GetLocationY(locB) - CJ.GetLocationY(locA)
    do return CJ.SquareRoot(dx * dx + dy * dy) end
end

---------------------------
BJ.RMinBJ = function(a, b)
    if (a < b) then
        do return a end
    else
        do return b end
    end
end

BJ.RMinBJ = function(a, b)
    if (a < b) then
        do return a end
    else
        do return b end
    end
end

BJ.RMaxBJ = function(a, b)
    if (a < b) then
        do return b end
    else
        do return a end
    end
end

BJ.RAbsBJ = function(a)
    if (a >= 0) then
        do return a end
    else
        do return -a end
    end
end

BJ.RSignBJ = function(a)
    if (a >= 0.0) then
        do return 1.0 end
    else
        do return -1.0 end
    end
end

BJ.IMinBJ = function(a, b)
    if (a < b) then
        do return a end
    else
        do return b end
    end
end

BJ.IMaxBJ = function(a, b)
    if (a < b) then
        do return b end
    else
        do return a end
    end
end

BJ.IAbsBJ = function(a)
    if (a >= 0) then
        do return a end
    else
        do return -a end
    end
end

BJ.ISignBJ = function(a)
    if (a >= 0) then
        do return 1 end
    else
        do return -1 end
    end
end

BJ.SinBJ = function(degrees) do return BJ.Sin(degrees * BJ.bj_DEGTORAD) end end

BJ.CosBJ = function(degrees) do return BJ.Cos(degrees * BJ.bj_DEGTORAD) end end

BJ.TanBJ = function(degrees) do return BJ.Tan(degrees * BJ.bj_DEGTORAD) end end

BJ.AsinBJ =
    function(degrees) do return BJ.Asin(degrees) * BJ.bj_RADTODEG end end

BJ.AcosBJ =
    function(degrees) do return BJ.Acos(degrees) * BJ.bj_RADTODEG end end

BJ.AtanBJ =
    function(degrees) do return BJ.Atan(degrees) * BJ.bj_RADTODEG end end

BJ.Atan2BJ = function(y, x) do return BJ.Atan2(y, x) * BJ.bj_RADTODEG end end

BJ.SetUnitLifeBJ = function(whichUnit, newValue)
    CJ.SetUnitState(whichUnit, CJ.UNIT_STATE_LIFE, BJ.RMaxBJ(0, newValue))
end

BJ.UnitRemoveBuffBJ = function(buffcode, whichUnit)
    do return CJ.UnitRemoveAbility(whichUnit, buffcode) end

end

BJ.GetRectCenter = function(whichRect)
    do
        return CJ.Location(CJ.GetRectCenterX(whichRect),
                           CJ.GetRectCenterY(whichRect))
    end
end
BJ.IsUnitDeadBJ = function(whichUnit)
    do return CJ.GetUnitState(whichUnit, CJ.UNIT_STATE_LIFE) <= 0 end
end
BJ.GetAttackedUnitBJ = function() do return CJ.GetTriggerUnit() end end

BJ.TextTagSize2Height = function(size) do return size * 0.023 / 10 end end

BJ.TextTagSpeed2Velocity = function(speed) do return speed * 0.071 / 128 end end

-- 缓存
BJ.InitGameCacheBJ = function(campaignFile)
    BJ.bj_lastCreatedGameCache = CJ.InitGameCache(campaignFile)
    do return BJ.bj_lastCreatedGameCache end
end

BJ.SaveGameCacheBJ = function(cache) do return CJ.SaveGameCache(cache) end end

BJ.GetLastCreatedGameCacheBJ = function()
    do return BJ.bj_lastCreatedGameCache end
end
BJ.SelectUnitForPlayerSingle = function(whichUnit, whichPlayer)
    if (CJ.GetLocalPlayer() == whichPlayer) then

        CJ.ClearSelection()
        CJ.SelectUnit(whichUnit, true)
    end
end
BJ.PanCameraToTimedLocForPlayer = function(whichPlayer, loc, duration)
    if (CJ.GetLocalPlayer() == whichPlayer) then

        CJ.PanCameraToTimed(CJ.GetLocationX(loc), CJ.GetLocationY(loc), duration)
    end
end
BJ.GetUnitsInRectMatching = function(r, filter)
    local g = CJ.CreateGroup()
    CJ.GroupEnumUnitsInRect(g, r, filter)
    CJ.DestroyBoolExpr(filter)
    do return g end
end
-- InitHashtableBJ = function()
--     bj_lastCreatedHashtable = InitHashtable()
--     do return bj_lastCreatedHashtable end
-- end

-- GetLastCreatedHashtableBJ = function() do return bj_lastCreatedHashtable end end

-- StoreRealBJ = function(value, key, missionKey, cache)
--     StoreReal(cache, missionKey, key, value)
-- end

-- StoreIntegerBJ = function(value, key, missionKey, cache)
--     StoreInteger(cache, missionKey, key, value)
-- end

-- StoreBooleanBJ = function(value, key, missionKey, cache)
--     StoreBoolean(cache, missionKey, key, value)
-- end

-- StoreStringBJ = function(value, key, missionKey, cache)
--     do return StoreString(cache, missionKey, key, value) end
-- end

-- StoreUnitBJ = function(whichUnit, key, missionKey, cache)
--     do return StoreUnit(cache, missionKey, key, whichUnit) end
-- end

-- SaveRealBJ = function(value, key, missionKey, table)
--     SaveReal(table, missionKey, key, value)
-- end

-- SaveIntegerBJ = function(value, key, missionKey, table)
--     SaveInteger(table, missionKey, key, value)
-- end

-- SaveBooleanBJ = function(value, key, missionKey, table)
--     SaveBoolean(table, missionKey, key, value)
-- end

-- SaveStringBJ = function(value, key, missionKey, table)
--     do return SaveStr(table, missionKey, key, value) end
-- end

-- SavePlayerHandleBJ = function(whichPlayer, key, missionKey, table)
--     do return SavePlayerHandle(table, missionKey, key, whichPlayer) end
-- end

-- SaveWidgetHandleBJ = function(whichWidget, key, missionKey, table)
--     do return SaveWidgetHandle(table, missionKey, key, whichWidget) end
-- end

-- SaveDestructableHandleBJ = function(whichDestructable, key, missionKey, table)
--     do
--         return SaveDestructableHandle(table, missionKey, key, whichDestructable)
--     end
-- end

-- SaveItemHandleBJ = function(whichItem, key, missionKey, table)
--     do return SaveItemHandle(table, missionKey, key, whichItem) end
-- end

-- SaveUnitHandleBJ = function(whichUnit, key, missionKey, table)
--     do return SaveUnitHandle(table, missionKey, key, whichUnit) end
-- end

-- SaveAbilityHandleBJ = function(whichAbility, key, missionKey, table)
--     do return SaveAbilityHandle(table, missionKey, key, whichAbility) end
-- end

-- SaveTimerHandleBJ = function(whichTimer, key, missionKey, table)
--     do return SaveTimerHandle(table, missionKey, key, whichTimer) end
-- end

-- SaveTriggerHandleBJ = function(whichTrigger, key, missionKey, table)
--     do return SaveTriggerHandle(table, missionKey, key, whichTrigger) end
-- end

-- SaveTriggerConditionHandleBJ = function(whichTriggercondition, key, missionKey,
--                                         table)
--     do
--         return SaveTriggerConditionHandle(table, missionKey, key,
--                                           whichTriggercondition)
--     end
-- end

-- SaveTriggerActionHandleBJ = function(whichTriggeraction, key, missionKey, table)
--     do
--         return SaveTriggerActionHandle(table, missionKey, key,
--                                        whichTriggeraction)
--     end
-- end

-- SaveTriggerEventHandleBJ = function(whichEvent, key, missionKey, table)
--     do return SaveTriggerEventHandle(table, missionKey, key, whichEvent) end
-- end

-- SaveForceHandleBJ = function(whichForce, key, missionKey, table)
--     do return SaveForceHandle(table, missionKey, key, whichForce) end
-- end

-- SaveGroupHandleBJ = function(whichGroup, key, missionKey, table)
--     do return SaveGroupHandle(table, missionKey, key, whichGroup) end
-- end

-- SaveLocationHandleBJ = function(whichLocation, key, missionKey, table)
--     do return SaveLocationHandle(table, missionKey, key, whichLocation) end
-- end

-- SaveRectHandleBJ = function(whichRect, key, missionKey, table)
--     do return SaveRectHandle(table, missionKey, key, whichRect) end
-- end

-- SaveBooleanExprHandleBJ = function(whichBoolexpr, key, missionKey, table)
--     do return SaveBooleanExprHandle(table, missionKey, key, whichBoolexpr) end
-- end

-- SaveSoundHandleBJ = function(whichSound, key, missionKey, table)
--     do return SaveSoundHandle(table, missionKey, key, whichSound) end
-- end

-- SaveEffectHandleBJ = function(whichEffect, key, missionKey, table)
--     do return SaveEffectHandle(table, missionKey, key, whichEffect) end
-- end

-- SaveUnitPoolHandleBJ = function(whichUnitpool, key, missionKey, table)
--     do return SaveUnitPoolHandle(table, missionKey, key, whichUnitpool) end
-- end

-- SaveItemPoolHandleBJ = function(whichItempool, key, missionKey, table)
--     do return SaveItemPoolHandle(table, missionKey, key, whichItempool) end
-- end

-- SaveQuestHandleBJ = function(whichQuest, key, missionKey, table)
--     do return SaveQuestHandle(table, missionKey, key, whichQuest) end
-- end

-- SaveQuestItemHandleBJ = function(whichQuestitem, key, missionKey, table)
--     do return SaveQuestItemHandle(table, missionKey, key, whichQuestitem) end
-- end

-- SaveDefeatConditionHandleBJ = function(whichDefeatcondition, key, missionKey,
--                                        table)
--     do
--         return SaveDefeatConditionHandle(table, missionKey, key,
--                                          whichDefeatcondition)
--     end
-- end

-- SaveTimerDialogHandleBJ = function(whichTimerdialog, key, missionKey, table)
--     do return SaveTimerDialogHandle(table, missionKey, key, whichTimerdialog) end
-- end

-- SaveLeaderboardHandleBJ = function(whichLeaderboard, key, missionKey, table)
--     do return SaveLeaderboardHandle(table, missionKey, key, whichLeaderboard) end
-- end

-- SaveMultiboardHandleBJ = function(whichMultiboard, key, missionKey, table)
--     do return SaveMultiboardHandle(table, missionKey, key, whichMultiboard) end
-- end

-- SaveMultiboardItemHandleBJ = function(whichMultiboarditem, key, missionKey,
--                                       table)
--     do
--         return SaveMultiboardItemHandle(table, missionKey, key,
--                                         whichMultiboarditem)
--     end
-- end

-- SaveTrackableHandleBJ = function(whichTrackable, key, missionKey, table)
--     do return SaveTrackableHandle(table, missionKey, key, whichTrackable) end
-- end

-- SaveDialogHandleBJ = function(whichDialog, key, missionKey, table)
--     do return SaveDialogHandle(table, missionKey, key, whichDialog) end
-- end

-- SaveButtonHandleBJ = function(whichButton, key, missionKey, table)
--     do return SaveButtonHandle(table, missionKey, key, whichButton) end
-- end

-- SaveTextTagHandleBJ = function(whichTexttag, key, missionKey, table)
--     do return SaveTextTagHandle(table, missionKey, key, whichTexttag) end
-- end

-- SaveLightningHandleBJ = function(whichLightning, key, missionKey, table)
--     do return SaveLightningHandle(table, missionKey, key, whichLightning) end
-- end

-- SaveImageHandleBJ = function(whichImage, key, missionKey, table)
--     do return SaveImageHandle(table, missionKey, key, whichImage) end
-- end

-- SaveUbersplatHandleBJ = function(whichUbersplat, key, missionKey, table)
--     do return SaveUbersplatHandle(table, missionKey, key, whichUbersplat) end
-- end

-- SaveRegionHandleBJ = function(whichRegion, key, missionKey, table)
--     do return SaveRegionHandle(table, missionKey, key, whichRegion) end
-- end

-- SaveFogStateHandleBJ = function(whichFogState, key, missionKey, table)
--     do return SaveFogStateHandle(table, missionKey, key, whichFogState) end
-- end

-- SaveFogModifierHandleBJ = function(whichFogModifier, key, missionKey, table)
--     do return SaveFogModifierHandle(table, missionKey, key, whichFogModifier) end
-- end

-- SaveAgentHandleBJ = function(whichAgent, key, missionKey, table)
--     do return SaveAgentHandle(table, missionKey, key, whichAgent) end
-- end

-- SaveHashtableHandleBJ = function(whichHashtable, key, missionKey, table)
--     do return SaveHashtableHandle(table, missionKey, key, whichHashtable) end
-- end

-- GetStoredRealBJ = function(key, missionKey, cache)

--     do return GetStoredReal(cache, missionKey, key) end
-- end

-- GetStoredIntegerBJ = function(key, missionKey, cache)

--     do return GetStoredInteger(cache, missionKey, key) end
-- end

-- GetStoredBooleanBJ = function(key, missionKey, cache)

--     do return GetStoredBoolean(cache, missionKey, key) end
-- end

-- GetStoredStringBJ = function(key, missionKey, cache)
--     local s

--     s = GetStoredString(cache, missionKey, key)
--     if (s == nil) then
--         do return "" end
--     else
--         do return s end
--     end
-- end

-- LoadRealBJ = function(key, missionKey, table)

--     do return LoadReal(table, missionKey, key) end
-- end

-- LoadIntegerBJ = function(key, missionKey, table)

--     do return LoadInteger(table, missionKey, key) end
-- end

-- LoadBooleanBJ = function(key, missionKey, table)

--     do return LoadBoolean(table, missionKey, key) end
-- end

-- LoadStringBJ = function(key, missionKey, table)
--     local s

--     s = LoadStr(table, missionKey, key)
--     if (s == nil) then
--         do return "" end
--     else
--         do return s end
--     end
-- end

-- LoadPlayerHandleBJ = function(key, missionKey, table)
--     do return LoadPlayerHandle(table, missionKey, key) end
-- end

-- LoadWidgetHandleBJ = function(key, missionKey, table)
--     do return LoadWidgetHandle(table, missionKey, key) end
-- end

-- LoadDestructableHandleBJ = function(key, missionKey, table)
--     do return LoadDestructableHandle(table, missionKey, key) end
-- end

-- LoadItemHandleBJ = function(key, missionKey, table)
--     do return LoadItemHandle(table, missionKey, key) end
-- end

-- LoadUnitHandleBJ = function(key, missionKey, table)
--     do return LoadUnitHandle(table, missionKey, key) end
-- end

-- LoadAbilityHandleBJ = function(key, missionKey, table)
--     do return LoadAbilityHandle(table, missionKey, key) end
-- end

-- LoadTimerHandleBJ = function(key, missionKey, table)
--     do return LoadTimerHandle(table, missionKey, key) end
-- end

-- LoadTriggerHandleBJ = function(key, missionKey, table)
--     do return LoadTriggerHandle(table, missionKey, key) end
-- end

-- LoadTriggerConditionHandleBJ = function(key, missionKey, table)
--     do return LoadTriggerConditionHandle(table, missionKey, key) end
-- end

-- LoadTriggerActionHandleBJ = function(key, missionKey, table)
--     do return LoadTriggerActionHandle(table, missionKey, key) end
-- end

-- LoadTriggerEventHandleBJ = function(key, missionKey, table)
--     do return LoadTriggerEventHandle(table, missionKey, key) end
-- end

-- LoadForceHandleBJ = function(key, missionKey, table)
--     do return LoadForceHandle(table, missionKey, key) end
-- end

-- LoadGroupHandleBJ = function(key, missionKey, table)
--     do return LoadGroupHandle(table, missionKey, key) end
-- end

-- LoadLocationHandleBJ = function(key, missionKey, table)
--     do return LoadLocationHandle(table, missionKey, key) end
-- end

-- LoadRectHandleBJ = function(key, missionKey, table)
--     do return LoadRectHandle(table, missionKey, key) end
-- end

-- LoadBooleanExprHandleBJ = function(key, missionKey, table)
--     do return LoadBooleanExprHandle(table, missionKey, key) end
-- end

-- LoadSoundHandleBJ = function(key, missionKey, table)
--     do return LoadSoundHandle(table, missionKey, key) end
-- end

-- LoadEffectHandleBJ = function(key, missionKey, table)
--     do return LoadEffectHandle(table, missionKey, key) end
-- end

-- LoadUnitPoolHandleBJ = function(key, missionKey, table)
--     do return LoadUnitPoolHandle(table, missionKey, key) end
-- end

-- LoadItemPoolHandleBJ = function(key, missionKey, table)
--     do return LoadItemPoolHandle(table, missionKey, key) end
-- end

-- LoadQuestHandleBJ = function(key, missionKey, table)
--     do return LoadQuestHandle(table, missionKey, key) end
-- end

-- LoadQuestItemHandleBJ = function(key, missionKey, table)
--     do return LoadQuestItemHandle(table, missionKey, key) end
-- end

-- LoadDefeatConditionHandleBJ = function(key, missionKey, table)
--     do return LoadDefeatConditionHandle(table, missionKey, key) end
-- end

-- LoadTimerDialogHandleBJ = function(key, missionKey, table)
--     do return LoadTimerDialogHandle(table, missionKey, key) end
-- end

-- LoadLeaderboardHandleBJ = function(key, missionKey, table)
--     do return LoadLeaderboardHandle(table, missionKey, key) end
-- end

-- LoadMultiboardHandleBJ = function(key, missionKey, table)
--     do return LoadMultiboardHandle(table, missionKey, key) end
-- end

-- LoadMultiboardItemHandleBJ = function(key, missionKey, table)
--     do return LoadMultiboardItemHandle(table, missionKey, key) end
-- end

-- LoadTrackableHandleBJ = function(key, missionKey, table)
--     do return LoadTrackableHandle(table, missionKey, key) end
-- end

-- LoadDialogHandleBJ = function(key, missionKey, table)
--     do return LoadDialogHandle(table, missionKey, key) end
-- end

-- LoadButtonHandleBJ = function(key, missionKey, table)
--     do return LoadButtonHandle(table, missionKey, key) end
-- end

-- LoadTextTagHandleBJ = function(key, missionKey, table)
--     do return LoadTextTagHandle(table, missionKey, key) end
-- end

-- LoadLightningHandleBJ = function(key, missionKey, table)
--     do return LoadLightningHandle(table, missionKey, key) end
-- end

-- LoadImageHandleBJ = function(key, missionKey, table)
--     do return LoadImageHandle(table, missionKey, key) end
-- end

-- LoadUbersplatHandleBJ = function(key, missionKey, table)
--     do return LoadUbersplatHandle(table, missionKey, key) end
-- end

-- LoadRegionHandleBJ = function(key, missionKey, table)
--     do return LoadRegionHandle(table, missionKey, key) end
-- end

-- LoadFogStateHandleBJ = function(key, missionKey, table)
--     do return LoadFogStateHandle(table, missionKey, key) end
-- end

-- LoadFogModifierHandleBJ = function(key, missionKey, table)
--     do return LoadFogModifierHandle(table, missionKey, key) end
-- end

-- LoadHashtableHandleBJ = function(key, missionKey, table)
--     do return LoadHashtableHandle(table, missionKey, key) end
-- end

-- RestoreUnitLocFacingAngleBJ = function(key, missionKey, cache, forWhichPlayer,
--                                        loc, facing)

--     bj_lastLoadedUnit = RestoreUnit(cache, missionKey, key, forWhichPlayer,
--                                     GetLocationX(loc), GetLocationY(loc), facing)
--     do return bj_lastLoadedUnit end
-- end

-- RestoreUnitLocFacingPointBJ = function(key, missionKey, cache, forWhichPlayer,
--                                        loc, lookAt)

--     do
--         return RestoreUnitLocFacingAngleBJ(key, missionKey, cache,
--                                            forWhichPlayer, loc,
--                                            AngleBetweenPoints(loc, lookAt))
--     end
-- end

-- GetLastRestoredUnitBJ = function() do return bj_lastLoadedUnit end end

-- FlushGameCacheBJ = function(cache) FlushGameCache(cache) end

-- FlushStoredMissionBJ = function(missionKey, cache)
--     FlushStoredMission(cache, missionKey)
-- end

-- FlushParentHashtableBJ = function(table) FlushParentHashtable(table) end

-- FlushChildHashtableBJ = function(missionKey, table)
--     FlushChildHashtable(table, missionKey)
-- end

-- HaveStoredValue = function(key, valueType, missionKey, cache)
--     if (valueType == bj_GAMECACHE_BOOLEAN) then
--         do return HaveStoredBoolean(cache, missionKey, key) end
--     elseif (valueType == bj_GAMECACHE_INTEGER) then
--         do return HaveStoredInteger(cache, missionKey, key) end
--     elseif (valueType == bj_GAMECACHE_REAL) then
--         do return HaveStoredReal(cache, missionKey, key) end
--     elseif (valueType == bj_GAMECACHE_UNIT) then
--         do return HaveStoredUnit(cache, missionKey, key) end
--     elseif (valueType == bj_GAMECACHE_STRING) then
--         do return HaveStoredString(cache, missionKey, key) end
--     else

--         do return false end
--     end
-- end

-- HaveSavedValue = function(key, valueType, missionKey, table)
--     if (valueType == bj_HASHTABLE_BOOLEAN) then
--         do return HaveSavedBoolean(table, missionKey, key) end
--     elseif (valueType == bj_HASHTABLE_INTEGER) then
--         do return HaveSavedInteger(table, missionKey, key) end
--     elseif (valueType == bj_HASHTABLE_REAL) then
--         do return HaveSavedReal(table, missionKey, key) end
--     elseif (valueType == bj_HASHTABLE_STRING) then
--         do return HaveSavedString(table, missionKey, key) end
--     elseif (valueType == bj_HASHTABLE_HANDLE) then
--         do return HaveSavedHandle(table, missionKey, key) end
--     else

--         do return false end
--     end
-- end

-- ShowCustomCampaignButton = function(show, whichButton)
--     SetCustomCampaignButtonVisible(whichButton - 1, show)
-- end

-- IsCustomCampaignButtonVisibile = function(whichButton)
--     do return GetCustomCampaignButtonVisible(whichButton - 1) end
-- end

-- LoadGameBJ = function(loadFileName, doScoreScreen)
--     LoadGame(loadFileName, doScoreScreen)
-- end

-- SaveAndChangeLevelBJ = function(saveFileName, newLevel, doScoreScreen)
--     SaveGame(saveFileName)
--     ChangeLevel(newLevel, doScoreScreen)
-- end

-- SaveAndLoadGameBJ = function(saveFileName, loadFileName, doScoreScreen)
--     SaveGame(saveFileName)
--     LoadGame(loadFileName, doScoreScreen)
-- end

-- RenameSaveDirectoryBJ = function(sourceDirName, destDirName)
--     do return RenameSaveDirectory(sourceDirName, destDirName) end
-- end

-- RemoveSaveDirectoryBJ = function(sourceDirName)
--     do return RemoveSaveDirectory(sourceDirName) end
-- end

-- CopySaveGameBJ = function(sourceSaveName, destSaveName)
--     do return CopySaveGame(sourceSaveName, destSaveName) end
-- end

-- GetPlayerStartLocationX = function(whichPlayer)
--     do return GetStartLocationX(GetPlayerStartLocation(whichPlayer)) end
-- end

-- GetPlayerStartLocationY = function(whichPlayer)
--     do return GetStartLocationY(GetPlayerStartLocation(whichPlayer)) end
-- end

-- GetPlayerStartLocationLoc = function(whichPlayer)
--     do return GetStartLocationLoc(GetPlayerStartLocation(whichPlayer)) end
-- end

-- GetRectCenter = function(whichRect)
--     do return Location(GetRectCenterX(whichRect), GetRectCenterY(whichRect)) end
-- end

-- IsPlayerSlotState = function(whichPlayer, whichState)
--     do return GetPlayerSlotState(whichPlayer) == whichState end
-- end

-- GetFadeFromSeconds = function(seconds)
--     if (seconds ~= 0) then do return math.modf(128 / R2I(seconds)) end end
--     do return 10000 end
-- end

-- GetFadeFromSecondsAsReal = function(seconds)
--     if (seconds ~= 0) then do return 128.00 / seconds end end
--     do return 10000.00 end
-- end

-- AdjustPlayerStateSimpleBJ = function(whichPlayer, whichPlayerState, delta)
--     SetPlayerState(whichPlayer, whichPlayerState,
--                    GetPlayerState(whichPlayer, whichPlayerState) + delta)
-- end

-- AdjustPlayerStateBJ = function(delta, whichPlayer, whichPlayerState)

--     if (delta > 0) then
--         if (whichPlayerState == PLAYER_STATE_RESOURCE_GOLD) then
--             AdjustPlayerStateSimpleBJ(whichPlayer, PLAYER_STATE_GOLD_GATHERED,
--                                       delta)
--         elseif (whichPlayerState == PLAYER_STATE_RESOURCE_LUMBER) then
--             AdjustPlayerStateSimpleBJ(whichPlayer, PLAYER_STATE_LUMBER_GATHERED,
--                                       delta)
--         end
--     end
--     AdjustPlayerStateSimpleBJ(whichPlayer, whichPlayerState, delta)
-- end

-- SetPlayerStateBJ = function(whichPlayer, whichPlayerState, value)
--     local oldValue = GetPlayerState(whichPlayer, whichPlayerState)
--     AdjustPlayerStateBJ(value - oldValue, whichPlayer, whichPlayerState)
-- end

-- SetPlayerFlagBJ = function(whichPlayerFlag, flag, whichPlayer)
--     SetPlayerState(whichPlayer, whichPlayerFlag, IntegerTertiaryOp(flag, 1, 0))
-- end

-- SetPlayerTaxRateBJ = function(rate, whichResource, sourcePlayer, otherPlayer)
--     SetPlayerTaxRate(sourcePlayer, otherPlayer, whichResource, rate)
-- end

-- GetPlayerTaxRateBJ = function(whichResource, sourcePlayer, otherPlayer)
--     do return GetPlayerTaxRate(sourcePlayer, otherPlayer, whichResource) end
-- end

-- IsPlayerFlagSetBJ = function(whichPlayerFlag, whichPlayer)
--     do return GetPlayerState(whichPlayer, whichPlayerFlag) == 1 end
-- end

-- AddResourceAmountBJ = function(delta, whichUnit)
--     AddResourceAmount(whichUnit, delta)
-- end

-- GetConvertedPlayerId = function(whichPlayer)
--     do return GetPlayerId(whichPlayer) + 1 end
-- end

-- ConvertedPlayer = function(convertedPlayerId)
--     do return Player(convertedPlayerId - 1) end
-- end

-- GetRectWidthBJ = function(r) do return GetRectMaxX(r) - GetRectMinX(r) end end

-- GetRectHeightBJ = function(r) do return GetRectMaxY(r) - GetRectMinY(r) end end

-- BlightGoldMineForPlayerBJ = function(goldMine, whichPlayer)
--     local mineX
--     local mineY
--     local mineGold
--     local newMine

--     if GetUnitTypeId(goldMine) ~= 1852272492 then do return nil end end

--     mineX = GetUnitX(goldMine)
--     mineY = GetUnitY(goldMine)
--     mineGold = GetResourceAmount(goldMine)
--     RemoveUnit(goldMine)

--     newMine = CreateBlightedGoldmine(whichPlayer, mineX, mineY, bj_UNIT_FACING)
--     SetResourceAmount(newMine, mineGold)
--     do return newMine end
-- end

-- BlightGoldMineForPlayer = function(goldMine, whichPlayer)
--     bj_lastHauntedGoldMine = BlightGoldMineForPlayerBJ(goldMine, whichPlayer)
--     do return bj_lastHauntedGoldMine end
-- end

-- GetLastHauntedGoldMine = function() do return bj_lastHauntedGoldMine end end

-- IsPointBlightedBJ = function(where)
--     do return IsPointBlighted(GetLocationX(where), GetLocationY(where)) end
-- end

-- SetPlayerColorBJEnum = function()
--     SetUnitColor(GetEnumUnit(), bj_setPlayerTargetColor)
-- end

-- SetPlayerColorBJ = function(whichPlayer, color, changeExisting)
--     local g
--     SetPlayerColor(whichPlayer, color)
--     if changeExisting then
--         bj_setPlayerTargetColor = color
--         g = CreateGroup()
--         GroupEnumUnitsOfPlayer(g, whichPlayer, nil)
--         ForGroup(g, SetPlayerColorBJEnum)
--         DestroyGroup(g)
--     end
-- end

-- SetPlayerUnitAvailableBJ = function(unitId, allowed, whichPlayer)
--     if allowed then
--         SetPlayerTechMaxAllowed(whichPlayer, unitId, -1)
--     else
--         SetPlayerTechMaxAllowed(whichPlayer, unitId, 0)
--     end
-- end

-- LockGameSpeedBJ = function() SetMapFlag(MAP_LOCK_SPEED, true) end

-- UnlockGameSpeedBJ = function() SetMapFlag(MAP_LOCK_SPEED, false) end

-- IssueTargetOrderBJ = function(whichUnit, order, targetWidget)
--     do return IssueTargetOrder(whichUnit, order, targetWidget) end
-- end

-- IssuePointOrderLocBJ = function(whichUnit, order, whichLocation)
--     do return IssuePointOrderLoc(whichUnit, order, whichLocation) end
-- end

-- IssueTargetDestructableOrder = function(whichUnit, order, targetWidget)
--     do return IssueTargetOrder(whichUnit, order, targetWidget) end
-- end
-- IssueTargetItemOrder = function(whichUnit, order, targetWidget)
--     do return IssueTargetOrder(whichUnit, order, targetWidget) end
-- end

-- IssueImmediateOrderBJ = function(whichUnit, order)
--     do return IssueImmediateOrder(whichUnit, order) end
-- end

-- GroupTargetOrderBJ = function(whichGroup, order, targetWidget)
--     do return GroupTargetOrder(whichGroup, order, targetWidget) end
-- end

-- GroupPointOrderLocBJ = function(whichGroup, order, whichLocation)
--     do return GroupPointOrderLoc(whichGroup, order, whichLocation) end
-- end

-- GroupImmediateOrderBJ = function(whichGroup, order)
--     do return GroupImmediateOrder(whichGroup, order) end
-- end

-- GroupTargetDestructableOrder = function(whichGroup, order, targetWidget)
--     do return GroupTargetOrder(whichGroup, order, targetWidget) end
-- end
-- GroupTargetItemOrder = function(whichGroup, order, targetWidget)
--     do return GroupTargetOrder(whichGroup, order, targetWidget) end
-- end

-- GetDyingDestructable = function() do return GetTriggerDestructable() end end

-- SetUnitRallyPoint = function(whichUnit, targPos)
--     IssuePointOrderLocBJ(whichUnit, "setrally", targPos)
-- end

-- SetUnitRallyUnit = function(whichUnit, targUnit)
--     IssueTargetOrder(whichUnit, "setrally", targUnit)
-- end

-- SetUnitRallyDestructable = function(whichUnit, targDest)
--     IssueTargetOrder(whichUnit, "setrally", targDest)
-- end

-- SaveDyingWidget = function() bj_lastDyingWidget = GetTriggerWidget() end

-- SetBlightRectBJ = function(addBlight, whichPlayer, r)
--     SetBlightRect(whichPlayer, r, addBlight)
-- end

-- SetBlightRadiusLocBJ = function(addBlight, whichPlayer, loc, radius)
--     SetBlightLoc(whichPlayer, loc, radius, addBlight)
-- end
return BJ
