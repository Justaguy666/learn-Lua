-- function returns the square and the square root of a number
local function calculate_square_and_square_root(number)
    local square = number * number
    local square_root = math.sqrt(number)
    return square, square_root
end

-- function to find the first less than or equal to a number
local function is_prime(number)
    if number < 2 then return false end
    if number == 2 then return true end
    if number % 2 == 0 then return false end
    for i = 3, math.sqrt(number) do
        if number % i == 0  then
            return false
        end
    end
    return true
end

local function find_largest_smaller_prime(number)
    local i = number - 1
    while i > 1 do
        if is_prime(i) then
            return i
        end 
    end
    return nil
end

-- function to find the fit value of stamp
local function find_stamps_value(number)
    local p = 0
    local q = 0

    while number >= 4 and number % 7 ~= 0 do
        number = number - 4
        q = q + 1
    end

    p = math.floor(number/7)

    return p, q
end

-- funtion to find related sum of two half of a number
local function find_related_sum(number)
    local str = tostring(number)
    local len = #str

    if len % 2 ~= 0 then
        return nil
    end

    local first_half = 0
    local second_half = 0
    for i = 1, len/2 do
        first_half = first_half + tonumber(str[i])
        second_half = second_half + tonumber(str[len - i + 1])
    end

    local relate = first_half - second_half

    return first_half, second_half, (relate == 0 and "=" or (relate > 0 and ">" or "<"))
end

-- function to calculate the equation
local function calculate_equation(val, ...)
    local result = 0

    local coeffs = {...}

    for i = 1, #coeffs do
        if type(coeffs[i]) ~= "number" then return nil end
    end

    for i = 1, #coeffs do
        result = result + coeffs[i] * (val ^ (i - 1))
    end
    return result
end