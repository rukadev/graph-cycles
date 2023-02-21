local UnionFind = require("./Structures/UnionFind")

return function (g)
    local sorted = g.edges
    table.sort(sorted, function(a,b)
        return a.cost < b.cost
    end)

    local sum = 0
    local uf = UnionFind.new(4)
    local edges = {}

    for _, edge in pairs(sorted) do
        if uf:find(edge.from) ~= uf:find(edge.to) then

            uf:union(edge.from, edge.to)
            table.insert(edges, edge)
            sum = sum + edge.cost

            if uf:getSize() == 1 then -- means there is only one set
                break
            end
        end
    end

    return sum, edges
end