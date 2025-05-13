-- INTRODUCTION TO TABLES

-- Tables are a fundamental and powerful data structure in Lua.
-- They serve as the primary way to represent arrays, dictionaries, sets, etc.
-- A table is an array that accepts not only numbers as indices, but also strings or any other Lua value except nil.
-- Tables in Lua are neither values nor variables, they are objects.

-- Tables are mutable objects, meaning that we can change their contents at any time.
-- and they are passed by reference, not by value.
local a = {}
a[1] = 10

local b = a
b[2] = 20
--print(a[2])

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- TABLE INDICES

-- Each table can store values with different types of indices, and it grows as needed to accommodate new entries.
-- The indices can be numbers, strings, or even functions.

local t = {} -- empty table

-- Table with a number as indexes
t[1] = 10 
t[2] = 20

--print(#t) -- prints 2, the number of elements in the table

-- Table with a string as index
local exam = {}

exam["Alphonse"] = 10
exam["Edward"] = 20

--print(exam["Alphonse"]) -- prints 10
--print(exam["Edward"]) -- prints 20

-- Table with a variable as index
local name = "Hohenheim"

exam[name] = 30
--print(exam[name]) -- prints 30
--print(exam["Hohenheim"]) -- prints 30

-- Table with a function as index
local function f()
    return "The Father"
end

t[f()] = 40
t[40] = f()

--print(t[f()])
--print(t[40])
--print(t["The Father"])

-- In Lua we can represent structures with tables.
-- Lua supports this representation by providing t.name as syntactic sugar for t["name"].

-- A common mistake for bigginers is to confuse t.x with t[x]. The first one reprents t["x"], that is, a table indexed by the string "x".
-- The second one is a table indexed by the value of the variable x.

-- Finally, when used as a key, any float value that can be converted to an integer is converted. For instance, 1.0 is converted to 1.
-- This means that t[1.0] and t[1] are the same entry in the table. Float values that cannot be converted to integers remain unaltered.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- TABLE CONSTRUCTORS

-- Constructors are expressions that build and set up tables. they represent a unique aspect of Lua and are among its most valuable and flexible mechanisms.
-- The most basic constructor is the empty constructor, represented by {} as demonstrated earlier. Constructors can also initialize lists.

-- Lua also offers a special syntax to initialize a record-like table.
-- A record-like table in Lua refers to a table that is used to represent structured data with named fields or attributes.
-- This is similar to a struct in C or a class in object-oriented programming languages.

local person = {
    name = "John",
    age = 30,
    occupation = "Engineer"
}

--print(person.name) -- prints "John"
--print(person.age) -- prints 30
--print(person.occupation) -- prints "Engineer"

-- We can also mix record-style with list-style initialization. For example:
local polygon = {
    color = "red",
    npoints = 3,
    {x = 0, y = 0}, -- [1]
    {x = 1, y = 0}, -- [2]
    {x = 0, y = 1} -- [3]
}

--print(polygon[0].x) -- error: attempt to index a nil value

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- LOCAL AND GLOBAL VARIABLES

-- In Lua, all variables are global by default. However, we can create local variables using the local keyword.
-- Local variables are only accessible within the block of code where the are defined, like a loop, function or file, ...
-- Global variables are accessible from anywhere in the program, but they can lead to naming conflicts and make the code harder to understand.

-- Local variables make the code more readable and maintainable, as they limit the scope of the variable to a specific block of code.
-- Local variables are also faster than global variables, as they are stored in a different memory area.
-- Local variables are also garbage collected when they go out of scope, while global variables remain in memory until the program ends.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- ARRAYS, LISTS AND SEQUENCES

-- To represent a conventional array or a list, we simply use a table with integer keys.
-- Lua uses 1-based indexing, meaning that the first element of an array is at index 1, not 0.
-- There is neither a way nor a need to declare a size, we just initialize the elements we need.

--[[
local a = {}
for i = 1, 5 do
    a[i] = io.read()
end

for i = 1,5 do
    print(a[i])
end
]]

-- Usually, when we manipulate a list we should know its length.
-- The length operator # returns the number of elements in a list, but it only works for sequences.
-- A sequence is a list with no holes, meaning that the elements are stored in consecutive positions.
-- A table is a sequence if the first n elements are not nil, and the next element is nil.
-- Formally, a sequence is a table with integer keys starting from 1 and going up to n, where n is the length of the sequence.

-- The length operator also provides a useful idiom for manipulating sequences.

t = {}
t[1] = 10
t[2] = 20
t[3] = 30

t[#t + 1] = 40 -- adds a new element to the end of the sequence

print(#t)
print(t[4]) -- prints 40