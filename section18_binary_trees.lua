-- INTRODUCTION TO BINARY TREES

-- Binary tree is a data structure in which each node can have a left child
-- and a right child. They cannot have more than two children.

-- Commom uses of binary trees are binary search trees, binary heaps, and Huffman
-- coding.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- IMPLEMENTATION OF BINARY TREES

local node = {}
node.__index = node

function node.new(value)
    local self = setmetatable({}, node)
    self.value = value
    self.left = nil
    self.right = nil
    return self
end

local root = node.new(10)
root.left = node.new(5)
root.right = node.new(15)
root.left.left = node.new(3)
root.left.right = node.new(7)
root.right.left = node.new(12)
root.right.right = node.new(20)

print("Value of root node: " .. root.value)