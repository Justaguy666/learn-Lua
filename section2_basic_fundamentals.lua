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

-- TYPES AND VALUES
