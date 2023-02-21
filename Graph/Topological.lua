local function dfs(graph, vertex, cur, marked)
    marked[vertex] = true

    for _, vert in pairs(graph:getAdj(vertex)) do
        if not marked[vert] then
            dfs(graph, vert, cur, marked)
        end
    end

    table.insert(cur, vertex)
end

local function sort(graph)
    local marked = {}
    local vertices = graph:getVertices()
    local res = {}
    local back = #vertices
    
    for _, vertex in pairs(vertices) do
        if not marked[vertex] then
            local cur = {}
            dfs(graph, vertex, cur, marked)
            for _, vert in pairs(cur) do
                res[back] = vert
                back = back - 1
            end
        end
    end

    return res
end

return sort