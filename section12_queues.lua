-- INTRODUCTION TO QUEUES

-- A queue is a linear data structure that follows the "First-In-First-Out"
-- (FIFO) principle. It represents a collection of elements in which items are
-- added at the rear (enqueue) and removed from the front (dequeue).

-- Imagine it like a queue of people waiting in line, where the person who
-- arrives first gets served first.

-- Some common examples of queues in computer science include print spoolers,
-- task scheduling, process management, network data packets, and more.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- IMPLEMENTATION OF QUEUES

local queue = {}

local function create ()
    return {front = 1, rear = 0}
end

local function is_empty ()
    return queue.front > queue.rear
end

local function enqueue(item)
    queue.rear = queue.rear + 1
    queue[queue.rear] = item
end

local function dequeue()
    if not is_empty() then 
        local item = queue[queue.front]
        queue[queue.front] = nil
        queue.front = queue.front + 1
        return item
    end
end

local function front()
    if not is_empty() then
        return queue[queue.front]
    end
end

local function size()
    return queue.rear - queue.front + 1
end