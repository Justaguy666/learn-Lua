-- INTRODUCTION TO SETS

-- A set is a data structure that represents an unordered collection of distinct elements.
-- The key characteristic of sets is that they do not allow duplicate elements,
-- meaning each element can only appear once within a set.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- IMPLEMENTATION OF SETS

-- A set can be represented as a table in Lua, where the keys of the table represent the elements
-- of the set. Since keys in a table are unique, duplicate are automatically handled.

local function new ()
    local set = {}
    return set
end

local function contains(set, element)
    return set[element] ~= nil
end

local function add(set, element)
    set[element] = true
end

local function remove(set, element)
    set[element] = nil
end

local function size(set)
    local count = 0
    for _ in pairs(set) do
        count = count + 1
    end
    return count
end