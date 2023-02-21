local Heap = require("./Structures/Heap")

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
    local p = self.heap:getMin()
    self.heap:remove()
    local v = self.map[p]
    return v, p
end

function PriorityQueue:peekHighestPriority()
    
end

function PriorityQueue:isEmpty()
    return self.heap:isEmpty()
end

function PriorityQueue:getSize()
    return self.heap:getSize()
end

function PriorityQueue:changePriority()
    
end

return PriorityQueue