-- for loops

-- The for statement has two variants: the numerical for and the generic for.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- The numerical for

--[[
    for var = exp1, exp2, exp3 do
        body
    end
]]

-- This loop will execute the body for each value of var from exp1 to exp2 using exp3 as the step
-- to increment var.

-- The third expression is optional. When absent, Lua assumes one as the step value.

-- A very important aspect of the numerical is that the control variable is a local variable declared by the for statement, and it is visible
-- only inside the loop. A common mistake is to assume that the variable still exists after the loop ends.

-- We can access the value of the control variable anytime we want by save it in a variable declared outside the loop.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- The generic for

-- Iterator funtion
--[[
    function iterator(collection)
        - Initialization code

        - The iterator function returns the next value during each iteration
        
        return function()
            - Logic to generate and return the next value

            - Stop iteration wjen there are no more values
        end
    end
]]

-- Closure
--[[
    function outerFunction(x)
        return function()
            print(x)
        end
    end

    local innerFunction = outerFunction(42)
    innerFunction() -- prints 42
]]

-- The generic for loop traverses all values returned by an iterator function.

-- The generic for is very powerful -> we can traverses almost anything in the readable fashion.

-- Unlike the numerical for, the generic for can have multiple variables.

local function myIterator(s)
    local index = 0
    local length = #s

    return function()
        index = index + 1
        if index <= length then
            return s[index], index
        end
    end
end

local function genericFor(s)
    -- Iterate over the collection using the generic "for" loop

    for item in myIterator(s) do
        print(item)
    end

end

--genericFor({1, 2, 3, 4, 5})

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- while loops

-- The while loop repeats its body while a condition is true.

-- Lua first tests the while condition. If the condition is false, then the loop ends.
-- Otherwise, Lua executes the body of the loop and repeats the process.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- repeat statement

-- A repeat-until statement repeats its body until its condition is true.

-- This statement does the test after the body, so that it always executes the body at least once.

-- The repeat-until statement has the following syntax:
--[[
    repeat
        code block
    until condition_to_exit
]]