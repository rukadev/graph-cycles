local UnionFind = {}
UnionFind.__index = UnionFind

function UnionFind.new(n)
    local parent = {}
    for i = 1, n do
        parent[i] = i
        --parent[string.char(64 + i)] = string.char(64 + i)
    end
    return setmetatable({
        parent = parent,
        size = n
    }, UnionFind)
end

function UnionFind:find(i)
    if self.parent[i] == i then
        return i
    end
    return self:find(self.parent[i])
end

function UnionFind:union(i, j)
    local parent_i = self:find(i)
    local parent_j = self:find(j)
    if parent_j ~= parent_i then
        self.size = self.size - 1
        self.parent[parent_i] = parent_j
    end
end

function UnionFind:getSize()
    return self.size
end

return UnionFind

