local Graph = {}
Graph.__index = Graph

function Graph.new()
    local self = {}
    self.edges = {}
    self.vertices = {4,2,3,1}
    self.adj = {
        [1] = {2},
        [2] = {3,4},
        [3] = {4},
        [4] = {}
    }

    return setmetatable(self, Graph)
end

function Graph:addEdge(edge)
    table.insert(self.edges, edge)
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