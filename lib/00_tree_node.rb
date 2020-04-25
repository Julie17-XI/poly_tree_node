class PolyTreeNode
    attr_reader :value, :parent, :children
    def initialize(val)
        @value = val
        @parent = nil
        @children = []
    end

    def parent= (node = nil)
        if !self.parent.nil?
            old_parent = self.parent
            old_parent.children.delete(self)
        end

        @parent = node

        if node != nil
            if (!node.children.include?(self))
                node.children << self
            end
        end
    end

end