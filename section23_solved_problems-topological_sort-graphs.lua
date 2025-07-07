-- NOTIONS: A directed acyclic graph is usually called a dag.

-- TOPOLOGICAL SORT

-- A topological sort of a dag G = (V, E) is a sequence v1,v2,...,vn
-- such that V = {v1,v2,...,vn} and if (vi,vj) ∈ E, then i < j.

-- A dag can more than one topological sort.

-- Repeat until there are no vertices left.
-- 1. Find a vertex u with entry degree 0.
-- 2. Write u and delete it from the graph.

-- If the graph has n vertices:
--  Searching for a vertex with entry degree 0 costs O(n).
--  The previous step is repeated n times.
--  Total cost: O(n^2)

-- Kahn's Algorithm:
-- 1. Calculate in-degree for each vertex.
-- 2. Put zero-in-degree vertices into the queue.
-- 3. Repeat:
--    - Pop vertex u out of the queue.
--    - Put u into the result.
--    - Decrease adjacent vertices' in-degree.
--    - If there is any zero-in-degree vertices, put it
--      into the queue.
-- Complexity: O(n + m)

----------
local function init_task(input)
    local graph = {}
    local names = {}
    local in_degs = {}

    local n_v = tonumber(input[1])
    for name in input[2]:gmatch("%S+") do
        graph[name] = {}
        in_degs[name] = 0
        table.insert(names, name)
    end

    local n_e = tonumber(input[3])
    for i = 1, n_e do
        local u, v = input[3 + i]:match("^(%S+)%s+(%S+)$")
        table.insert(graph[u], v)
        in_degs[v] = in_degs[v] + 1
    end

    return graph, in_degs, names
end

----------
-- function to identify tasks ordering
local function identify_ordering(input)
    local graph, in_degs, names = init_task(input)
    local queue = {}
    local result = {}

    for _,name in ipairs(names) do
        if in_degs[name] == 0 then
            table.insert(queue, name)
        end
    end

    while #queue > 0 do
        table.sort(queue)
        local u = table.remove(queue, 1)
        table.insert(result, u)

        for _,v in ipairs(graph[u]) do
            in_degs[v] = in_degs[v] - 1
            if in_degs[v] == 0 then
                table.insert(queue, v)
            end
        end
    end

    return result
end

----------
-- function to determine if the tasks can be finished
local function can_finish(n, prerequisites)
    local graph = {}
    local in_degs = {}

    for i = 0,n-1 do
        graph[i] = {}
        in_degs[i] = 0
    end

    for _, pair in ipairs(prerequisites) do
        local u,v = pair[1],pair[2]
        table.insert(graph[v], u)
        in_degs[u] = in_degs[u] + 1
    end

    local queue = {}
    for i = 0,n-1 do
        if in_degs[i] == 0 then
            table.insert(queue, i)
        end
    end

    local count = 0
    while #queue > 0 do
        local u = table.remove(queue, 1)
        count = count + 1

        for _,v in pairs(graph[u]) do
            in_degs[v] = in_degs[v] - 1
            if in_degs[v] == 0 then
                table.insert(queue, v)
            end
        end
    end

    return count == n
end
