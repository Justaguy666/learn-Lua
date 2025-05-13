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
