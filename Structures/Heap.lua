local Heap = {}
Heap.__index = Heap

function Heap.new(maxsize)
    local self = {}
    self.maxsize = maxsize
    self.size = 0
    self.Heap = {}
    self.FRONT = 1

    for i = 1, self.maxsize + 1 do
        self.Heap[i] = 0
    end
    self.Heap[0] = -1 * math.huge

    return setmetatable(self, Heap)
end

function Heap:parent(pos)
    return math.floor(pos/2)
end

function Heap:leftChild(pos)
    return 2 * pos
end

function Heap:rightChild(pos)
    return (2 * pos) + 1
end

function Heap:isLeaf(pos)
    return pos*2 > self.size
end

function Heap:swap(fpos, spos)
    self.Heap[fpos], self.Heap[spos] = self.Heap[spos], self.Heap[fpos]
end

function Heap:minHeapify(pos)
    if not self:isLeaf(pos) then
        if self.Heap[pos] > self.Heap[self:leftChild(pos)] or
            self.Heap[pos] > self.Heap[self:rightChild(pos)] then
            if self.Heap[self:leftChild(pos)] < self.Heap[self:rightChild(pos)] then
                self:swap(pos, self:leftChild(pos))
                self:minHeapify(self:leftChild(pos))
            else
                self:swap(pos, self:rightChild(pos))
                self:minHeapify(self:rightChild(pos))
            end
        end
    end
end

function Heap:insert(element)
    if self.size >= self.maxsize then
        return
    end

    self.size = self.size + 1
    self.Heap[self.size] = element

    local current = self.size

    while self.Heap[current] < self.Heap[self:parent(current)] do
        self:swap(current, self:parent(current))
        current = self:parent(current)
    end
end

function Heap:minHeap()
    for pos = math.floor(self.size/2), 0, -1 do
        self:minHeapify(pos)
    end
end

function Heap:remove()
    self.Heap[self.FRONT] = self.Heap[self.size]
    self.size = self.size - 1
    self:minHeapify(self.FRONT)
end

function Heap:getMin()
    return self.Heap[self.FRONT]
end

function Heap:Print()
    for i = 1, math.floor((self.size/2)+1) do
        print("Parent: ", self.Heap[i], "Left: ", self.Heap[2*i], "Right: ", self.Heap[2*i+1])
    end
end

function Heap:isEmpty()
    
end

return Heap
