class PolyTreeNode
    attr_reader :value, :parent, :children
    def initialize(val)
        @value = val
        @parent = nil
        @children = []
    end

    def parent= (node)
        @parent = node
        if !node.children.include?(self)
            node.children << self
        end
    end

end