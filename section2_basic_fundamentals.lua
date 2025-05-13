-- LEXICAL CONVENTIONS

-- Identidiers of lua can be any string of letters, digits, and underscores, not starting with a digit.

-- We should avoid identifiers that start with an underscore and are followed by a capital letter, as they are reserved for special use.

-- Usually, the identifier '_' is used for anonymous variables.

-- The following words cannot be used as identifiers:
-- and, end , if, or, until, break, false, in, repeat, while, do, for, local, return, then, else, function, not, goto, nil, true, elseif.

-- Lua is a case-sensitive language, so 'myVar' and 'myvar' are considered different identifiers.

-- A comment in Lua starts anywhere with a two consecutive hyphens '--' and continues to the end of the line.
-- Lua also offers long comments, which start with two hyphens followed by two opening square brackets and run until the first two closing square brackets.

-- Lua needs no semicolon at the end of a statement, but it is allowed.
-- line breaks are not significant in Lua, so a statement can be split across multiple lines.
-- These four lines are equivalent:
--[[
    a = 1
    b = a * 2
]]

--[[
    a = 1;
    b = a * 2;
]]

--[[
    a = 1; b = a * 2
]]

--[[
    a = 1 b = a * 2
]]

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- TYPES AND VALUES

-- Lua is a dynamically-typed language, meaning that the type of a variable is checked during run-time.
-- On the other hand, statically-typed language like C, C++, Javaf, etc. check the type of a variable at compile-time instead of run-time.

-- Lua is also a weakly-typed language, when it does not require the explicity specification of different types of objects and variables.
-- On the other hand, a language is strongly typed if it demand the specification of data tytpes.

-- There are 8 basic types in Lua:
-- 1. nil: represents the absence of a value or a non-existent variable.
-- 2. boolean: represents a truth value, either true or false.
-- 3. number: represents a numeric value, which can be an integer or a floating-point number.
-- 4. string: represents a sequence of characters, enclosed in single or double quotes.
-- 5. function: represents a function, which is a block of code that can be executed.
-- 6. userdata: represents a data structure that is not natively supported by Lua, allowing for the creation of custom data types.
-- 7. thread: represents a separate thread of execution, allowing for concurrent programming.
-- 8. table: represents a collection of key-value pairs, similar to arrays or dictionaries in other programming languages.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- BOOLEANS AND LOFICAL OPERATORS

-- Lua supports a conventional set of logical operators: and, or, and not.
-- The result of the and operator is the first operand if that operand is false; otherwise, the result is the second operand.
-- The result of the or operator is the first operand if that operand is true; otherwise, the result is the second operand.

-- The useful Lua idiom is x = x or v, which equivalent to "if not x then x = v end".

-- Another useful idiom is (a and b or c), which is equivalent to "if a then b else c end".
-- For instance, we can select the maximum of two numbers x and y with the expression (x > y) and x or y.
-- When x > y, the first expression of the and is true, so the and results in its second operand (x), which is always true (because it is a number),
-- and then the or expression results in the value of its first operand (x). When x > y is false, the and expression is false and so the or results in
-- its second operand (y).

-- The not operator always gives a boolean value. (not 0 -> false, not "" -> false, not {} -> false, not function() end -> false)

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- INPUT AND OUTPUT

-- Input: we can use the io.read() function to read input form the user via the standard input stream. This function allows us to read a line of text from the user.
-- There are different options for the io.read() function:
-- 1. io.read("*number")/io.read("*n") - reads a number from the input.
-- 2. io.read("*line")/io.read("*l") - reads a line of text from the input.
-- 3. io.read("*all")/io.read("*a") - reads all the input until EOF (end of file).
-- 4. io.read() - reads a line of text from the input, but the newline.

-- Output: we can use the print() function to display output to the user. If we want to print without a newline, we can use the io.write() function.
-- To insert a value of a variable into a string, we can use the string concatenation operator (..) or comma to concatenate strings and variables together. For example:
--[[
    local name = "John"
    print("Hello, " .. name .. "!") -- Output: Hello, John!
]]
--[[
    local age = 25
    print("You are ", age, " years old.") -- Output: You are 25 years old.
]]
-- Or you can use the string.format() function to format strings with placeholders. For example:
--[[
    local name = "John"
    local age = 25
    print(string.format("Hello, %s! You are %d years old.", name, age)) -- Output: Hello, John! You are 25 years old.
]]