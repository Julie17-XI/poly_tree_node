class PolyTreeNode
    attr_reader :value, :parent, :children
    def initialize(val)
        @value = val
        @parent = nil
        @children = []
    end
end