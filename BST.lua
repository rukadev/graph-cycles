
local Node = {}

function Node.new(value)
    return {
        value = value,
        left = nil,
        right = nil
    }
end

local BST = {}
BST.__index = BST

function BST.new()
    return setmetatable({

    }, BST)
end

function BST:find(value)
    local node = self.root
    local parent = nil

    while node do
        if value > node.value then
            parent = node
            node = node.right
        elseif value < node.value then
            parent = node
            node = node.left
        else
            return node, parent
        end
    end
end

function BST:insert(value)
    if self:isEmpty() then
        self.root = Node.new(value)
        return
    end

    local node = self.root

    while node do
        if value > node.value then
            if not node.right then
                node.right = Node.new(value)
                break
            else
                node = self.root.right
            end
        elseif value < node.value then
            if not node.left then
                node.left = Node.new(value)
                break
            else
                node = node.left
            end
        else
            break
        end
    end
end

function BST:isEmpty()
    return not self.root
end

function BST:size()
    local Stack = require("Stack")
    local stack = Stack.new()

    local ctr = 0
    stack:push(self.root)

    while not stack:isEmpty() do
        ctr = ctr + 1
        local node = stack:top()
        stack:pop()
        stack:push(node.left)
        stack:push(node.right)
    end

    return ctr
end

function BST:remove(value)
    if self:isEmpty() then
        return
    end

    local node, parent = self:find(value)

    -- Case 1: leaf node
    if not node.left and not node.right then
        if parent.left == node then
            parent.left = nil
        else
            parent.right = nil
        end
        return
    end

    -- Case 2: right subtree
    if not node.left and node.right then
        if parent.left == node then
            parent.left = node.right
        else
            parent.right = node.right
        end
        return
    end

    -- Case 3: left subtree
    if node.left and not node.right then
        if parent.left == node then
            parent.left = node.left
        else
            parent.right = node.left
        end
        return
    end

    -- Case 4: both subtrees
    local p = node
    local n = node.right
    while n do
        if not n.left then
            if p ~= node then
                p.left = nil
            end
            
            n.right = node.right
            n.left = node.left

            if parent.left == node then
                parent.left = n
            else
                parent.right = n
            end
            break
        end

        p = n
        n = n.left
    end
end

return BST