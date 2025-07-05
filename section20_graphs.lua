-- INTRODUCTION TO GRAPHS

-- Graph is a pair (V, A) with V being a finite non-empty set
-- and A a set of pairs that represent the edges of the graph.
--  The elements of V are called vertices (or nodes).
--  The elements of A are called edges.
--  The number of vertices |V| is called order of G.
--  The number of edges |A| is called size of G.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- REPRESENTATION OF A GRAPH

-- Adjacency list of a graph G = (V, A)
-- Let v1, v2, .., vn be the vertices of G. The adjacency list of G
-- is a list of length n where at position i is the set of vertices
-- adjacency to vi, for all i ∈ [n].

-- Adjacency matrix of G is the matrix
-- is the matrix MA = MA(G) of type nxn, such that the element mij of
-- the row i and column j is
-- mij = 1, if vi ~ vj
-- mij = 0, otherwise
-- properties:
--  MA is binary, with zeros in the diagonal and symmetric.
--  The number of one (1) in the row i is the degree of vi.
--  It is not unique, it depends on the order that is chosen in the set of vertices.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- IMPLEMENTATION OF GRAPHS

-- Graphs can be represented in Lua using various data structures,
-- but one of the most common approaches is to use adjacency lists.

local graph = {}

function graph.new()
    return {vertices = {}, edges = {}}
end

function graph.add_vertex(g, v)
    g.vertices[v] = true
    g.edges[v] = g.edges[v] or {}
end

function graph.add_edge(g, v1, v2)
    g.edges[v1][v2] = true
    g.edges[v2][v1] = true
end

function graph.get_adjacencies(g, v)
    local adjacencies = {}
    for adj, _ in pairs(g.edges[v]) do
        table.insert(adjacencies, adj)
    end
    return adjacencies
end