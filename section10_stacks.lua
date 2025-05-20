-- INTRODUCTION TO STACKS

-- A stack is a linear data structure that only allows inserting, deleting and querying
-- elements at one of its ends, which we call the top.

-- LIFO type structure (Last In, First Out), in which the last element that enters
-- is the first element that leaves.

-- In C++ we declared a stack using stack<T> where T is a defined type.

-- Insert is called push.

-- Removing the top element is called pop.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- IMPLEMENTATION OF STACKS

-- Stacks can be implemented in Lua using tables.

-- Since stacks follow the LIFO principle, we can use Lua table to mimic this bevhavior.

local stack = {}

local function push(element)
    table.insert(stack, element)
end

local function pop()
    local top = stack[#stack]
    table.remove(stack)
    return top
end

local function is_empty()
    return #stack == 0
end

local function top()
    if is_empty() then
        return nil
    else
        return stack[#stack]
    end
end