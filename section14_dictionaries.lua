-- INTRODUCTION TO DICTIONARIES

-- A dictionary is a general-purpose data structure for storing a
-- group of objects.

-- A dictionary has a set of keys and each key has a single associated
-- value.

-- When presented with a key the dictionary will return the associated value.

-- A dictionary is also called a map in different programming languages.

-- For example:
local results = {
    ['Charles'] = 8,
    ['Anna'] = 8,
    ['Luis'] = 8,
    ['Hawk'] = 8
}

-- The keys in dictionary must be simple types (such as integers or strings)
-- while the values can be of any type.

-- Dictionaries are often implemented as hash table.

-- Keys in a dictionary must be unique an attempt to create a duplicate key
-- will typically overwrite the existing value for that key.

-- Dictionary is an abstract data structure that supports the following operations:
-- search(k), insert(k, v), delete(k).

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- IMPLEMENTATION OF DICTIONARIES

-- In Lua, the dictionary data structure is implemented using tables.

local map = {}

map["key"] = "value"

-- map["key"] - to check the key if it exists

map["key"] = nil -- remove key,value

for k,v in ipairs(map) do -- iterate
    print(k, v)
end

