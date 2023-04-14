class PolyTreeNode
    attr_reader :value, :parent, :children
  def initialize(value, parent = nil)
    @value = value
    @parent = parent
    @children = []
  end

  # for children, change @parent to the passed node
  # for the parent, add child to @children, p

  def parent=(new_parent)
        if new_parent == nil 
            @parent = nil 
        else
            if @parent == nil 
                @parent = new_parent
                new_parent.children << self if !new_parent.children.include?(self)
            else
                @parent.children.delete(self)
                @parent = new_parent
                new_parent.children << self if !new_parent.children.include?(self)
            end 
        end
    end

    def add_child(child)
        child.parent = self 
    end

    def remove_child(child)
        
        if child.parent.children.include?(child)
            child.parent = nil 
        else
            raise 'Not a child'
        end
    end

    require 'byebug'
# Part 2

    def dfs(target)
        #base cases 
        
        return self if target == self.value
        return nil if self.children.empty?
        self.children.each do |child|
            stack = child.dfs(target)
            if stack
                return stack 
            end
        end
        nil
    
    end

    def bfs(target)
        return self if self.value == target
        queue = self.children.dup #[ root's children]
        #iterate thorugh the queue, if not target, add children to queue
        while queue.length > 0
            next_up = queue.shift
            if next_up.value == target
                return next_up
            else
                next_up.children.each { |gchild| queue << gchild}
            end
        end
        nil 

    end
end 