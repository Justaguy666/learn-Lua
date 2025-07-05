local node = {}
node.__index = node

function node.new(val)
    local self = setmetatable({}, node)
    self.left = nil
    self.right = nil
    self.val = val
    return self
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- function to get the size of binary tree
local function size(root)
    if root == nil then
        return 0
    end

    return 1 + size(root.left) + size(root.right)
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- function to get the height of binary tree
local function height(root)
    if root == nil then
        return 0
    end

    return 1 + math.max(height(root.left), height(root.right))
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- function to determine if two binary trees are equivalent
local function are_equivalent(r1, r2)
    if r1 == nil and r2 == nil then
        return true
    end

    if r1 == nil or r2 == nil then
        return false
    end

    if r1.val ~= r2.val then
        return false
    end

    return are_equivalent(r1.left, r2.left) and are_equivalent(r1.right, r2.right)
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- function to determine if two binary trees are isomorphic
local function are_isomorphic(r1, r2)
    if r1 == nil and r2 == nil then
        return true
    end

    if r1 == nil or r2 == nil then
        return false
    end

    if r1.val ~= r2.val then
        return false
    end

    local no_flip = are_isomorphic(r1.left, r2.left) and are_isomorphic(r1.right, r2.right)
    local flip = are_isomorphic(r1.left, r2.right) and are_isomorphic(r1.right, r2.left)

    return no_flip or flip
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- function to traverse binary tree in pre-order
local function preorder(root)
    if root == nil then
        return
    end

    print(root.val)
    preorder(root.left)
    preorder(root.right)
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
--function to traverse binary tree in post-order
local function postorder(root)
    if root == nil then
        return
    end

    preorder(root.left)
    preorder(root.right)
    print(root.val)
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- function to traverse binary tree in in-order
local function inorder(root)
    if root == nil then
        return
    end

    preorder(root.left)
    print(root.val)
    preorder(root.right)
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- function to return the minimum value in the binary tree
local function minimum(root)
    if root == nil then
        return math.huge
    end

    local left = minimum(root.left)
    local right = minimum(root.right)

    return math.min(root.val, left, right)
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- function to print all paths from root to leaf of the binary tree
local function print_table(t)
    for _,num in ipairs(t) do
        io.write(num .. " ")
    end
    io.write("\n")
end

local function paths(root, path)
    if root == nil then
        return
    end

    table.insert(path, root.val)

    if root.left == nil and root.right == nil then
        print_table(path)
    else
        paths(root.left, path)
        paths(root.right, path)
    end

    table.remove(path)
end
