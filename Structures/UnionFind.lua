local UnionFind = {}
UnionFind.__index = UnionFind

function UnionFind.new(n)
    local parent = {}
    for i = 1, n do
        parent[string.char(64 + i)] = string.char(64 + i)
    end
    return setmetatable({
        parent = parent
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
    self.parent[parent_i] = parent_j
end

return UnionFind

