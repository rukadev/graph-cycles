local PriorityQueue = require("./Structures/PriorityQueue")

local function dijkstra(g, n, s)
    local vis = {}
    local dist = {}
    local prev = {}

    for i = 1, n do
        vis[i] = false
        dist[i] = math.huge
        prev[i] = nil
    end

    dist[s] = 0
    local pq = PriorityQueue.new()
    pq:insertWithPriority(s, 0)
    while not pq:isEmpty() do
        local index, minDist = pq:pullHighestPriority()
        vis[index] = true

        for _, id in pairs(g.adj[index]) do
            local edge = {from = index, to = id, cost = 1}
            if not vis[edge.to] then
                local newDist = dist[index] + edge.cost
                if newDist < dist[edge.to] then
                    prev[edge.to] = index
                    dist[edge.to] = newDist
                    pq:insertWithPriority(edge.to, newDist)
                end
            end
        end
    end

    return dist, prev
end

-- shortest path between two nodes
local function shortestPath(g, n, s, e)
    local dist, prev = dijkstra(g, n, s)
    local path = {}
    if dist[e] == math.huge then
        return path
    end
    local at = e
    while at ~= nil do
        table.insert(path, at)
        at = prev[at]
    end

    local reverse = {}
    for i = #path, 1, -1 do
        table.insert(reverse, path[i])
    end
    for _, node in pairs(reverse) do
        print(node)
    end
    print("Dist: ", dist[4])
    return path
end

return shortestPath