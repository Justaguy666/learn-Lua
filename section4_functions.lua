-- INTRODUCTION TO FUNCTIONS

-- Functions are named blocks of code that performs a specific task or operation.

-- Think of a function as a mini-program within your larger program. Just like you can break down a complex task into smaller subtasks,
-- functions allow you to break down your code into smaller, manageable pieces.

-- Function are the main mechanism for abstraction of statements and expressions in Lua.

-- They can both carry out a specific task or compute and return a value. In the first case, we use a function call as a statement; in the
-- second case, we use it as an expression.

-- In Lua, functions are considered "first-class citizens", meaning they can be assigned to variables, passed as arguments, stored in tables,
-- and treated like any other data type.

-- A list of arguments enclosed in parentheses denotes the call, if the call has no arguments, we still must write an empty list () to denote it.
-- There is a special case to this rule: if the function has one single argument and that argument is either a literal string or a table, then 
-- the parentheses is optional.

--print("Hello, World!")
--print "Hello, World!"

-- As we saw in other examnples, a function definition in Lua has a conventional syntax, like here:
--[[
function function_name (arg1, arg2, ...)
    -- function body
    return result
end


--[[
local function calculate_sum(sequence)
    local sum = 0
    for i = 1, #sequence do
        sum = sum + sequence[i]
    end
    return sum
end
]]

--print(calculate_sum(({1, 2, 3, 4, 5})))

-- In Lua, it is possible to call a function with a different number of arguments compared to the number of parameters specified in the function definition.
-- Lua handles this situation by adjusting the number of arguments to match the number of parameters. If there are more arguments than parameters, Lua simply
-- discards the extra arguments. Conversely, if there are parameters than arguments, Lua assigns the additional parameters the value nil.

local function f(a, b, c)
    print(a, b, c)
end

--f(1, 2)
--print("----")
--f()

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- FUNCTIONS WITH MULTIPLE RESULTS

-- A quite convenient feature of Lua is that functions can return multiple results. For instance, suppose we have a sequence and we want to find its maximum value
-- and the location where it takes place.

local function find_max(sequence)
    local max_index = 1
    local max_value = sequence[max_index]


    for i = 2, #sequence do
        if sequence[i] > max_value then
            max_value = sequence[i]
            max_index = i
        end
    end

    return max_index, max_value
end

--local idx, val = find_max({1, 2, 3, 4, 5})
--print("Index: " .. idx .. ", Value: " .. val) -- prints Index: 5, Value: 5

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- VARIADIC FUNTIONS

-- A function in Lua can be variadic, that is, it can take a variable number of argumennts.

-- As a simple example, the following function returns the summation of all its arguments:

local function calculate_sum(...)
    local sum = 0
    local args = {...}

    for i, v in ipairs(args) do
        sum = sum + v
    end

    return sum
end

print(calculate_sum(1, 2, 3, 4, 5))

-- In Lua, the ipairs iterator returns two value during each iteration: the index and the corresponding value of a table. It is used to traverse arrays
-- or tables with consecutive integer keys starting from 1.

-- The three dots (...) in the parameter list indicate that teh function is variadic.