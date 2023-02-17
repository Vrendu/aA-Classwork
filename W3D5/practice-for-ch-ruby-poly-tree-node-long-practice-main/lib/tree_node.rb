class PolyTreeNode
  
    def initialize(value)
        @parent = nil  
        @value = value 
        @children = []
    end 

    def parent 
        @parent 
    end

    def children 
        @children
    end

    def value 
        @value 
    end 

    def parent= (parent)
      
       old_parent = @parent  
        @parent = parent
        
        old_parent.children.delete(self) unless old_parent.nil? 
        parent.children << self unless parent.nil? || parent.children.include?(self)
    end

    def add_child(child_node) 
        child_node.parent = self

    end 

    def remove_child(child_node)
        raise 'not a child' if child_node.parent == nil 
        child_node.parent = nil
    end 
    def dfs(target_value)
        return self if self.value == target_value

        children.each do |child|
            result = child.dfs(target_value)
            return result unless result.nil?
        end
        nil
    end
    def bfs(target_value)
        node_queue = [self]
        until node_queue.empty?
            node = node_queue.shift
            return node if node.value == target_value
            node_queue.concat(node.children)
        end
        nil
    end
end

# n1 = PolyTreeNode.new("root1")
# n2 = PolyTreeNode.new("root2")
# n3 = PolyTreeNode.new("root3")


# # connect n3 to n1
# n3.parent = n1
# # connect n3 to n2
# n3.parent = n2

# # this should work
# raise "Bad parent=!" unless n3.parent == n2
# raise "Bad parent=!" unless n2.children == [n3]

# # this probably doesn't
# raise "Bad parent=!" unless n1.children == []n3.