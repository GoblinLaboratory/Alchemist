-- 引入初始化模块
local int = require 'library.Core.initialization'
-- 引入实体模块
require "library.Archetype.Entity"
-- 引入注册模块
require 'library.Core.Registry'
-- 调用初始化函数
int.Int()

-- 创建一个空表用于存储实体
local d = {}

-- 使用循环创建10个实体，并为它们设置不同的属性值
for i = 1, 10, 1 do
    -- 创建一个新的实体对象
    local p1 = Entity.Item:new()
    -- 设置实体的ID
    p1.ID = i
    -- 获取实体的属性组件
    local com = p1:getComponent("AttributeComponents")
    -- 设置属性组件的智力值
    com:SetData("智力", i)
    -- 设置属性组件的力量值
    com:SetData("力量", i)
    -- 设置属性组件的ID
    com.ID = i
    -- 获取实体的基础组件
    local com1 = p1:getComponent("BaseCompenents")
    -- 设置基础组件的ID
    com1:SetData("ID", i)
    -- 将实体添加到表中
    table.insert(d, p1)
end

-- 遍历表中的实体，输出它们的属性值
for i = 1, #d, 1 do
    -- 输出实体的ID
    print(d[i].ID)
    -- 获取实体的属性组件
    local com = d[i]:getComponent("AttributeComponents")
    -- 输出属性组件的智力值
    print(com:GetData("智力"))
    -- 输出属性组件的力量值
    print("力量"..com:GetData("力量"))
    -- 输出属性组件的ID
    print(com.ID)
    -- 获取实体的基础组件
    local com1 = d[i]:getComponent("BaseCompenents")
    -- 输出基础组件的ID
    print(com1:GetData("ID"))
    -- 输出实体的Guid
    print(d[i].Guid)
    -- 输出基础组件的Guid
    print(com1.Guid)
    -- 获取基础组件的数据表
    local dota = com1.Data
    -- 遍历数据表，输出所有键值对
    for k, v in pairs(dota) do
        -- 输出键值对
        print(k)
    end
    -- 输出分割线
    print("---------------------")
end