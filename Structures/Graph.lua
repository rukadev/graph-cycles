local Graph = {}
Graph.__index = Graph

local Edge = {}
Edge.__index = Edge

function Edge.new(from, to, cost)
    return {
        from = from,
        to = to,
        cost = cost
    }
end

function Graph.new()
    local self = {}
    self.edges = {}
    self.vertices = {}
    self.adj = {}

    return setmetatable(self, Graph)
end

function Graph:addEdge(from, to, cost)
    table.insert(self.edges, Edge.new(from, to, cost))
end

function Graph:createAdjacency()
    for _, edge in pairs(self.edges) do
        if not self.adj[edge.from] then
            self.adj[edge.from] = {}
        end
        if not self.adj[edge.to] then
            self.adj[edge.to] = {}
        end
        table.insert(self.adj[edge.from], edge.to)
        table.insert(self.adj[edge.to], edge.from)
    end
end

function Graph:addVertex(vertex, adj)
    table.insert(self.vertices, vertex)
end

function Graph:getEdges()
    return self.edges
end

function Graph:getAdj(vertex)
    return self.adj[vertex]
end

function Graph:getVertices()
    return self.vertices
end

return Graph