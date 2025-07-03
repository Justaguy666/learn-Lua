local function push(stack, element)
    table.insert(stack, element)
end

local function pop(stack)
    local top = stack[#stack]
    table.remove(stack)
    return top
end

local function is_empty(stack)
    return #stack == 0
end

local function top(stack)
    if is_empty() then
        return nil
    else
        return stack[#stack]
    end
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- function to check if a sequence is palindromic
local function is_palindromic(sequence)
    local str = tostring(sequence)
    local stack = {}
    for _, num in ipairs(str) do
        table.insert(stack, num)
    end

    for _, num in ipairs(str) do
        local popped = table.remove(stack)
        if popped ~= num then
            return "NO"
        end
    end
    return "YES"
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- function to check if a sequence of brackets is correct
local function is_correct_bracket(sequence)
    local open_to_close = {
        ['('] = ')',
        ['['] = ']',
        ['{'] = '}'
    }

    local close_to_open = {
        [')'] = '(',
        [']'] = '[',
        ['}'] = '{'
    }

    local stack = {}
    for i = 1, #sequence do
        local letter = string.sub(sequence, i, i)

        if open_to_close[letter] then
            table.insert(stack, {char = letter, pos = i})
        
        elseif close_to_open[letter] then
            if #stack == 0 then
                return "incorrect", i
            end

            local top = table.remove(stack)
            if top.char ~= close_to_open[letter] then
                return "incorrect", i
            end
        end
    end

    if #stack > 0 then
        return "incorrect", stack[#stack].pos
    end

    return "correct"
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- find a sequence of smaller on the left
local function find_smaller_on_the_left(sequence)
    local stack = {}
    local smaller = {}

    for i = 1, #sequence do
        while not is_empty(stack) and stack[#stack] >= sequence[i] do
            table.remove(stack)
        end

        if is_empty(stack) then
            table.insert(smaller, -1)
        else
            table.insert(smaller, stack[#stack])
        end

        table.insert(stack, sequence[i])
    end

    return smaller
end
