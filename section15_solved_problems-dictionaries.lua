-- function to simulate a casino
local function casino(input)
    local players = {}
    local insides = {}

    for line in input:gmatch("[^\r\n]+") do
        local name, action, amount = line:match("^(%S+)%s(%S+)%s?(%-?%d*)$")

        if action == "enters" then
            if insides[name] then
               print(name .. " is already in the casino.") 
            else
                insides[name] = true
                players[name] = 0
            end
        elseif action == "wins" then
            if insides[name] then
                players[name] = players[name] + tonumber(amount)
            else
                print(name .. " is not in the casion.")
            end
        elseif action == "leaves" then
            if insides[name] then
                print(name .. " has won " .. players[name])
                insides[name] = nil
            else
                print(name .. " is not in the casion.")
            end
        end
    end

    print("----------")

    local remaining_players = {}
    for name, _ in pairs(insides) do
        table.insert(remaining_players, name)
    end

    table.sort(remaining_players)

    for _, name in ipairs(remaining_players) do
        print(name .. " is winning " .. players[name])
    end
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
--function to simulate the bag of words game
local function find_max(map)
    local max_key
    local max_val = nil
    for k, v in pairs(map) do
        if not max_val or v > max_val then
            max_key, max_val = k, v
        end
    end
    return max_key, max_val
end 

local function find_min(map)
    local min_key
    local min_val = nil
    for k, v in pairs(map) do
        if not min_val or v < min_val then
            min_key, min_val = k, v
        end
    end
    return min_key, min_val
end

local function bag_of_words(input)
    local bag = {}

    for line in input:gmatch("[^\r\n]+") do
        local action, word = line:match("^(%S+)%s*(%S*)$")

        if action == "minimum?" then
            if next(bag) == nil then
                print("indefinite minimum.")
            else
                local min_word, min_time = find_min(bag)
                print("minimum: " .. min_word .. ", " .. min_time .. " time(s).")
            end
        elseif action == "maximum?" then
            if next(bag) == nil then
                print("indefinite maximum.")
            else
                local max_word, max_time = find_max(bag)
                print("maximum: " .. max_word .. ", " .. max_time .. " time(s).")
            end
        elseif action == "store" then
            if bag[word] then
                bag[word] = bag[word] + 1
            else
                bag[word] = 1
            end
        elseif action == "delete" then
            if bag[word] then
                bag[word] = bag[word] - 1
                if bag[word] == 0 then
                    bag[word] = nil
                end
            end
        end
    end
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- function to perform word code
local function code(input)
    local words = {}

    for line in input:gmatch("[^\r\n]+") do
        local code, word = line:match("^(%S+)%s*(%S+)$")

        if code == "a" then
            if words[word] then
                words[word] = words[word] + 1
            else
                words[word] = 1
            end
        elseif code == "f" then
            if words[word] then
                print(words[word])
            else
                print(0)
            end
        end
    end
end
