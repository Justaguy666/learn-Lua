-- Lua is a high-level scripting language that was developed in Brazil in the early 1990s.

-- Lua is known for its simplicity, flexibility and extensiblity, making it a popular choice for various applications.

-- Lua is used in various domains and applications, including:
--[[
    1. Game development: Lua is widely used in the game industry as a scripting language for game engines and frameworks.
    Popular games like World of warcraft and Angry Birds was imployed Lua for their scripting needs.

    2. Embedded systems: Lua is lightweight nature makes it suitable for embedded systems and IoT devices.

    3. Sripting and automation: Lua is usually used as a scripting language for automating tasks, providing an easy-to-use
    interface.

    4. Web development: Lua has frameworks that allow developers to create high-performance web applications by embedding Lua within web servers.
]]

-- function to calculate the factorial of a number
local function factorial (n)
    if n == 0 then
        return 1
    else 
        return n * factorial(n - 1)
    end
end

-- ask the user for a number
print("Enter a number to calculate its factorial:")
local input = io.read()
local number = tonumber(input)

if number then
    local result = factorial(number)
    print("The factorial of " .. number .. " is " .. result .. ".")
else
    print("Please enter a valid number.")
end