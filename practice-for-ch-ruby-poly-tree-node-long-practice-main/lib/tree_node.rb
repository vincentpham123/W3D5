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
    endgit
end

# Part 2

