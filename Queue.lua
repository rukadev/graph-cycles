local Queue = {}
Queue.__index = Queue

function Queue.new()
    return setmetatable({
        values = {},
        first = 1,
        last = 1
    }, Queue)
end

function Queue:enqueue(value)
    self.values[self.first] = value
    self.first = self.first + 1
end

function Queue:dequeue()
    if self:isEmpty() then
        return
    end

    local value = self.values[self.last]
    self.values[self.last] = nil
    self.last = self.last + 1
    return value
end

function Queue:size()
    return self.first - self.last
end

function Queue:isEmpty()
    return self.first == self.last
end

function Queue:front()
    return self.values[self.first-1]
end

function Queue:rear()
    return self.values[self.last]
end

return Queue