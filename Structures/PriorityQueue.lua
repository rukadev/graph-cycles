local Heap = require("Heap")

local PriorityQueue = {}
PriorityQueue.__index = PriorityQueue

function PriorityQueue.new()
    return setmetatable({
        heap = Heap.new(15),
        map = {}
    }, PriorityQueue)
end

function PriorityQueue:insertWithPriority(v, p)
    self.map[p] = v
    self.heap:insert(p)
end

function PriorityQueue:pullHighestPriority()
    local highest = self.heap:getMin()
    local mapped = self.map[highest]
    for _, element in pairs(mapped) do
        print("element :", element)
    end
end

function PriorityQueue:isEmpty()
    return self.heap:isEmpty()
end

function PriorityQueue:changePriority()
    
end

return PriorityQueue