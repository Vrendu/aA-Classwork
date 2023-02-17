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

    end 

    def remove_child(childe_node)

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