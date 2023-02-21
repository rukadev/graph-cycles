local Stack = {}
Stack.__index = Stack

function Stack.new()
    return setmetatable({
        values = {}
    }, Stack)
end

function Stack:push(value)
    table.insert(self.values, value)
end

function Stack:pop()
    table.remove(self.values, #self.values)
end

function Stack:top()
    return self.values[#self.values]
end

function Stack:size()
    return #self.values
end

function Stack:isEmpty()
    return self:size() == 0
end

return Stack