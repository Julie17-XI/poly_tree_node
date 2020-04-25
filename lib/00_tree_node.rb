class PolyTreeNode
    attr_reader :value, :parent, :children
    def initialize(val)
        @value = val
        @parent = nil
        @children = []
    end

    def parent= (node = nil)
        @parent = node

        if node != nil
            if (!node.children.include?(self))
                node.children << self
            end
        end
    end

end