class PolyTreeNode
    
    attr_reader :value, :parent, :children
    
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(parent)
        self.parent.children.delete(self) if self.parent

        @parent = parent

        if parent
            parent.children << self if !parent.children.include?(self)
        end
    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        child_node.parent = nil
        raise "not a child!" if !@children.include?(child_node)
    end

    def dfs(target_value)
        return self if self.value == target_value

        if !self.children.empty?
            self.children.each do |child|
                search_result = child.dfs(target_value)
                return search_result if !search_result.nil?
            end
        end

        nil
    end

    def bfs(target_value)
        queue = [self]

        until queue.empty?
            first = queue.shift
            return first if first.value == target_value
            if first.children
                first.children.each { |child| queue.push(child) }
            end
        end
        nil
    end

end