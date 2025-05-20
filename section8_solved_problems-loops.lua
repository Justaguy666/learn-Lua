-- function to print the multiplication table of n
local function print_multiplication_table(n)
    if n < 1 and n > 10 then return nil end

    local result_list = {}
    for i = 1, 10 do
        result_list[#result_list + 1] = n * i
    end

    for i = 1, 10 do
        print(n.. " * " ..i.. " = " ..result_list[i])        
    end

    return result_list
end

--print_multiplication_table(8)

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- function to calculate sum of squares
local function calculate_sum_of_square(n)
    if n <= 0 then return nil end
    
    local result = 0
    for i = 1, n do
        result = result + (i ^ 2)
    end

    return result
end

--print(calculate_sum_of_square(5))

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- function to count number of digit
local function count_digit(n)
    if n == 0 then return 1 end

    local count = 0
    local temp = math.abs(n)

    while temp ~= 0 do
        count = count + 1
        temp = temp // 10
    end 

    return count
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- function to reverse a number
local function reverse(n)
    if n < 0 then
        return nil
    end
    
    local result = 0
    local temp = n

    while temp ~= 0 do
        local digit = temp % 10
        result = result * 10 + digit
        temp = temp // 10
    end

    return result
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- function to determine a number is cool or not
local function is_cool(n)
    local str = tostring(n)
    local odd_pos_sum = 0

    for i = 1, #str do
        if i % 2 == 0 then goto continue end
        odd_pos_sum = odd_pos_sum + tonumber(string.sub(str, i, i))
        ::continue::
    end

    return odd_pos_sum % 2 == 0
end
