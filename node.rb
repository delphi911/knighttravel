class Node
    #think this class as one unique square defined by its position on the board.
    attr_reader :pos
    attr_accessor :parent, :children, :state
  #-1 : unvisited
  # 1 : visited
  # 2 : discovered   we mark the node as discovered when it first appear as allowed positon for moving. So we do not bother to evaluate that node in our search.
    def initialize(pos, parent=nil, children=nil, state=-1)
      @pos = pos
      @state = state
      @parent = parent 
      @children = children
    end
 end
