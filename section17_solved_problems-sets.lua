-- function to find all unique elements
local function print_set(sequence)
    for num, _ in pairs(sequence) do
        print(num)
    end
end

local function find_unique_elements(sequence)
    local set = {}

    for _, num in pairs(sequence) do
        if set[num] == nil then
            set[num] = true
        end
    end

    return set
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- function to find all common elements
local function find_common_elements(s1, s2)
    local tmpset = find_unique_elements(s1)
    local set = {}

    for _, num in pairs(s2) do
        if tmpset[num] ~= nil then
            set[num] = true
        end
    end

    return set
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- function to identify invasive species
local function identify_invasive_species(natives, invasives)
    local native_characteristics = {}

    for _,characteristics in pairs(natives) do
        for _,characteristic in ipairs(characteristics) do
            if native_characteristics[characteristic] == nil then
                native_characteristics[characteristic] = true
            end
        end
    end

    local result = {}
    for species,characteristics in pairs(invasives) do
        local threat = true
        for _,characteristic in ipairs(characteristics) do
            if native_characteristics[characteristic] then
                threat = false
                break
            end
        end
        if threat then
            result[species] = true
        end
    end

    return result
end
