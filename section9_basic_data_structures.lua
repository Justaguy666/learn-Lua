-- INTRODUCTION TO DATA STRUCTURES

-- Tables in Lua are not data structures; they are the data structures. In Lua, tables can efficiently represent various
-- data structures, such as arrays, records, lists, queues, and sets, which are commonly found in other programming languages.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- ARRAYS

-- We implement arrays in Lua simply by indexing tables with integers. Therefore, arrays do not have a fixed size, but grow as needed.
-- Usually, when we initialize the array we define its size indirectly.

-- array = {1, 2, 3, 4, 5} - #array to use the length of array
-- print(table.concat(array, ','))

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- MATRICES

-- In Lua, matrices can be implemented using tables of tables. Each element in the matrix is represented by a value in a table, and
-- rows are represented as sub-tables within the main table.