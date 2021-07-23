class PolyTreeNode
    attr_reader :value, :parent, :children

    def initialize(init_value, parent = nil, children = [])
        @value = init_value
        @parent = parent
        @children = children
    end

    def inspect
        p "#Node: #{self.object_id}"
    end

    def parent=(new_parent)
        
        @parent.children.delete(self) if @parent != nil
        if new_parent != nil && !new_parent.children.include?(self)
            new_parent.children << self 
        end
        @parent = new_parent
    end

    def add_child(child)
        child.parent = self
    end

    def remove_child(child)
        raise "#{child} is not a child of this node" if !@children.include?(child)
        child.parent = nil
    end

    def dfs(target)
        return self if @value == target 
            
        @children.each do |child|
            child_search = child.dfs(target)
            if child_search != nil
                return child_search
            end
        end 
        
        return nil
    end

    # Depth First Search
    # 1) Check if node is target
    # 2) Iterate over node's children
    #    a) Call DFS on child
    #    b) if result != nil, return node
    # 3) return nil

    def bfs(target)
        arr = [self]
        until arr.empty?
            node = arr.shift
            if node.value == target
                return node
            else
                node.children.each { |child| arr << child }
            end
        end
        return nil
    end
    # Breadth First Search
    # 1) Create queue with root node
    # 2) Until queue empty
    #     a) dequeue node
    #     b) check if node matches target
    #     c) if not, add children to queue
    # 3) if queue empty, return nil

end