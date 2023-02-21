local Graph = require("Graph")
local Topological = require("Topological")
local Stack = require("Stack")
local Queue = require("Queue")
local BST = require("BST")




local bst = BST.new()
bst:insert(10)
bst:insert(15)
bst:insert(5)
bst:insert(8)
bst:insert(3)
bst:insert(6)
bst:insert(9)

--[[
local graph = Graph.new()
Topological(graph)
]]

--[[
local stack = Stack.new()
stack:push(23)
stack:push(35)
stack:pop()
print(stack:size())
print(stack:top())
]]

--[[
local queue = Queue.new()
queue:enqueue(23)
queue:enqueue(45)
print(queue:front())
print(queue:rear())
print(queue:size())
queue:dequeue()
print(queue:front())
queue:dequeue()
print(queue:isEmpty())
--]]
