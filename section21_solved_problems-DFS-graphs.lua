-- DEPTH-FIRST SEARCH (DFS)

-- Depth-first search (DFS) is an algorithm for traversing or searching
-- graph data structure.

-- The algorithm starts at the root node (selecting some arbitrary node
-- as the root node in the case of a graph) and explores as far as possibble
-- along each branch before backtracking.

-- Extra memory, usually a stack, is needed to keep track of the nodes visited
-- so far along a specified branch which helps in backtracking of the graph.

----------
local function init_for_map(input)
    local map_m, map_n = input[1]:match("^(%d+)%s+(%d+)$")
    map_m, map_n = tonumber(map_m), tonumber(map_n)

    local map = {}
    for i = 2, 1 + map_m do
        table.insert(map, input[i])
    end

    local init_i, init_j = input[#input]:match("^(%d+)%s+(%d+)$")
    init_i, init_j = tonumber(init_i), tonumber(init_j)

    return map_m, map_n, map, init_i, init_j
end

----------
-- function to determine treasure can be reach or not
local function found_treasure(input)
    local map_m, map_n, map, init_i, init_j = init_for_map(input)

    local stack = {}
    table.insert(stack, {init_i, init_j})

    local visited = {}
    visited[init_i .. "," .. init_j] = true

    local dirs = {
        {1, 0},
        {-1, 0},
        {0, 1},
        {0, -1}
    }

    while #stack > 0 do
        local current = table.remove(stack)
        local i, j = current[1], current[2]

        local cell = map[i]:sub(j, j)
        if cell == 't' then
            return "yes"
        end

        for _, dir in ipairs(dirs) do
            local ni, nj = i + dir[1], j + dir[2]
            
            if ni >= 1 and ni <= map_m and nj >= 1 and nj <= map_n then
                local next_cell = map[ni]:sub(nj, nj)
                local key = ni .. "," .. nj

                if (next_cell == '.' or next_cell == 't') and not visited[key] then
                    table.insert(stack, {ni, nj})
                    visited[key] = true
                end
            end
        end
    end

    return "no"
end

----------
-- function to count the number of treasure can be found
local function count_treasure(input)
    local map_m, map_n, map, init_i, init_j = init_for_map(input)

    local stack = {}
    table.insert(stack, {init_i, init_j})

    local visited = {}
    visited[init_i .. "," .. init_j] = true

    local dirs = {
        {1, 0},
        {-1, 0},
        {0, 1},
        {0, -1}
    }

    local count = 0
    while #stack > 0 do
        local current = table.remove(stack)
        local i, j = current[1], current[2]

        local cell = map[i]:sub(j, j)
        if cell == 't' then
            count = count + 1
        end

        for _, dir in ipairs(dirs) do
            local ni, nj = i + dir[1], j + dir[2]
            
            if ni >= 1 and ni <= map_m and nj >= 1 and nj <= map_n then
                local next_cell = map[ni]:sub(nj, nj)
                local key = ni .. "," .. nj

                if (next_cell == '.' or next_cell == 't') and not visited[key] then
                    table.insert(stack, {ni, nj})
                    visited[key] = true
                end
            end
        end
    end
    
    return count
end

----------
local function init_for_graph(input)
    local graph = {}
    local n_v, n_e

    local nums = {}
    for num in input:gmatch("(%d+)") do
        table.insert(nums, tonumber(num))
    end

    n_v = nums[1]
    n_e = nums[2]

    for i = 0, n_v - 1 do
        graph[i] = {}
    end

    for i = 1, n_e do
        local u = nums[2 + 2 * (i - 1) + 1]
        local v = nums[2 + 2 * (i - 1) + 2]

        table.insert(graph[u], v)
        table.insert(graph[v], u)
    end

    return graph, n_v, n_e
end

----------
-- function to count the number of trees of the graph
local function count_tree(input)
    local graph, n_v, _ = init_for_graph(input)

    local visited = {}
    local count = 0

    local function has_cycled(u, parent)
        visited[u] = true
        for _,v in ipairs(graph[u]) do
            if not visited[v] then
                if has_cycled(v, u) then
                    return true
                end
            elseif v ~= parent then
                return true
            end
        end
        return false
    end

    for u = 0, n_v - 1 do
        if not visited[u] then
            if not has_cycled(u, -1) then
                count = count + 1
            end
        end
    end

    return count
end

----------
-- function to determine if the graph is bipartite
local function is_bipartite(input)
    local graph, n_v, _ = init_for_graph(input)

    local color = {}

    local function dfs(u, c)
        color[u] = c

        for _,v in pairs(graph[u]) do
            if not color[v] then
                if not dfs(v, 1 - c) then
                    return false
                end
            elseif color[v] == c then
                return false
            end
        end

        return true
    end

    for u = 0, n_v - 1 do
        if not color[u] then
            if not dfs(u, 0) then
                return false
            end
        end
    end

    return true
end
