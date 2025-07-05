-- BREADTH-FIRST SEARCH (BFS)

-- Depth-first search (BFS) is an algorithm for traversing or searching
-- graph data structure.

-- The algorithm starts at the root node (selecting some arbitrary node
-- as the root node in the case of a graph) and explores all nodes at the
-- present depth prior to moving on to the next depth level.

-- Extra memory, usually a queue, is needed to keep track of the nodes 
-- that were encountered but not yet explored.

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
-- function to find minimum distance from start to treasure
local function find_minimum_distance_to_treasure(input)
    local map_m, map_n, map, init_i, init_j = init_for_map(input)

    local queue = {}
    table.insert(queue, {init_i, init_j, 0})

    local visited = {}
    visited[init_i .. "," .. init_j] = true

    local dirs = {
        {1, 0},
        {-1, 0},
        {0, 1},
        {0, -1}
    }

    while #queue > 0 do
        local current = table.remove(queue, 1)
        local i, j, d = current[1], current[2], current[3]

        local cell = map[i]:sub(j, j)
        if cell == 't' then
            return d
        end

        for _,dir in ipairs(dirs) do
            local ni, nj = i + dir[1], j + dir[2]
            
            if ni >= 1 and ni <= map_m and nj >= 1 and nj <= map_n then
                local next_cell = map[ni]:sub(nj, nj)
                local key = ni .. "," .. nj


                if (next_cell == '.' or next_cell == 't') and not visited[key] then
                    table.insert(queue, {ni, nj, d + 1})
                    visited[key] = true
                end
            end
        end
    end

    return "not found"
end

----------
-- function to find maximum distance from start to treasure
local function find_furthest_treasure(input)
    local map_m, map_n, map, init_i, init_j = init_for_map(input)

    local queue = {}
    table.insert(queue, {init_i, init_j, 0})

    local visited = {}
    visited[init_i .. "," .. init_j] = true

    local dirs = {
        {1, 0},
        {-1, 0},
        {0, 1},
        {0, -1}
    }

    local max_dist = -1
    while #queue > 0 do
        local current = table.remove(queue, 1)
        local i, j, d = current[1], current[2], current[3]

        local cell = map[i]:sub(j, j)
        if cell == 't' then
            max_dist = math.max(max_dist, d)
        end

        for _,dir in ipairs(dirs) do
            local ni, nj = i + dir[1], j + dir[2]
            
            if ni >= 1 and ni <= map_m and nj >= 1 and nj <= map_n then
                local next_cell = map[ni]:sub(nj, nj)
                local key = ni .. "," .. nj


                if (next_cell == '.' or next_cell == 't') and not visited[key] then
                    table.insert(queue, {ni, nj, d + 1})
                    visited[key] = true
                end
            end
        end
    end

    if max_dist >= 0 then return max_dist else return "not found" end
end
