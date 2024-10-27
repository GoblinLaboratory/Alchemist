function CTI(c)
    -- statements
    local zfc = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    local i = 1
    local j = string.len(zfc)
    print(j)
    while  c ~= string.sub(zfc, i, i)  do
        -- statements
        print("i"..string.sub(zfc, i , i))
        i = i + 1
    end
    print(i)
    return i
end
print("start")
print(CTI("g"))
print(CTI("Z"))