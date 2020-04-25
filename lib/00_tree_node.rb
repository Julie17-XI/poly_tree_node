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

    def add_child(node)
        node.parent= self
        if !self.children.include?(node)
            self.children << node
        end
    end

    def remove_child(node)
        raise "not a child" if !self.children.include?(node)
        node.parent= nil
    end

    def inspect
        { 'value'=>@value,'parent_value'=>@parent.value }.inspect
    end

    def dfs(target)
        return self if self.value == target
        self.children.each do |child|
            search_result = child.dfs(target)
            return search_result unless search_result.nil?
        end
        nil
    end

    def bfs(target)
        arr = []
        arr << self
        until arr.empty?
            current = arr.shift 
            if current.value == target
                return current 
            else
                arr += current.children
            end
        end
        nil
    end
end
