-- function to print all binary number patterns from 1 to n
local function binary_numbers(n)
    local queue = {"1"}

    for i = 1, n do
        local front = table.remove(queue, 1)
        print(front)
        table.insert(queue, front .. "0")
        table.insert(queue, front .. "1")
    end
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- function to simulate hot potato game
local function hot_potato(queue, k) 
    local pos = 1

    while #queue > 1 do
        pos = (pos + k - 1) % #queue
        if pos == 0 then pos = #queue end

        table.remove(queue, pos)
    end

    print("The winner is ".. queue[1] .. ".")
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- function to determine there is a matched pairs
local function is_matched(sequence, k)
    local queue = {}

    for i = 1, #sequence do
        local oponent = k - sequence[i]
        for j = 1, #queue do
            if sequence[i] == queue[j] then
                return "YES"
            end
        end
        table.insert(queue, oponent)
    end

    return "NO"
end
