require "math"
math.randomseed(tostring(os.time()):reverse():sub(1, 7))
-- (x-10)^2/10
function Binary()
    -- statements
    --local i1 = 10 - Ellipse()
    --local i2 = 10 - Ellipse()
    --local i = i1 + i2
    local n = 0
    for i = 1, 5, 1 do
        -- statements
        n = n + 10 - Ellipse()
    end
    return math.floor(n/5)
end
function Ellipse()
    -- statements
    -- 椭圆公式
    local a = 1000000000
    local r = math.random(1, a)
    local b = 10
    local n = a^2 - r^2
    local x = b^2/a^2
    local i =  math.sqrt(n*x)
    return math.floor(i)
end
-- 加速度公式
function Acceleration()
    -- statements
    local s = 10000000
    local r = math.random(1, s)
    local t = 10
    local a = 2*s/t^2
    local x = math.sqrt(2*r/a)
    return math.floor(x)
end
local l = {
    [0] = 0,
    [1] = 0,
    [2] = 0,
    [3] = 0,
    [4] = 0,
    [5] = 0,
    [6] = 0,
    [7] = 0,
    [8] = 0,
    [9] = 0,
    [10] = 0
}
for i = 1, 100000, 1 do
    -- statements
    -- print(Binary())
    local n = Binary()
    --print(n)
    l[n] = l[n] + 1
end
for i = #l, 0, -1 do
    -- statements
    print(i .. "概率:" .. l[i] / 1000)
end
