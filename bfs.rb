class SolvebyBFS

    def initialize(start, finish, board, piece)
      #start and finish is 2d array in the form of [x,y] coordinate of the square on the board [0,0] is bottom left corner
      #piece is the moving piece. On this project our only piece is knight.
      @startnode = board.getnode(start) #the node representing the start square
      firstnode = @startnode.clone
      @endingpos = finish #piece should end on this square 
      @piece = piece  #this is the knight object.
      @board = board
      @queue = []
      makechildren(firstnode) 
      checkchildren(firstnode)
    end
  
    def bfs()
      @found = false
      currentnode = @queue.shift #@startnode
      @piece.pos = currentnode.pos
      @piece.calculateallowedpositions #set the kings position to this position
      until @queue.empty? or @found
        makechildren(currentnode) #getchildren(currentnode)
        checkchildren(currentnode)
        currentnode = @queue.shift
        @piece.pos = currentnode.pos
        @piece.calculateallowedpositions
      end    
    end #bfs
   
    def makechildren(currentnode)
      childnodes = []
      @piece.allowedpositions.each do |pos| 
        evaluatenode = @board.getnode(pos)
        if evaluatenode.state == -1
          childnodes << evaluatenode  
          evaluatenode.state = 2 # set to discovered
        end
      end #do
      childnodes.map {|node| node.parent = currentnode}
      currentnode.children = childnodes
      currentnode.state = 1 #mark it as visited
    end
  
    def checkchildren(node)
      unless [nil].include?(node.children)
        node.children.each do |child|
          if child.pos == @endingpos
            found_finish(child, node)
          else
            @queue << child
          end      
        end #do
      end #unless
    end #checkchildren
  
    def found_finish(node, parent)
      @found = true
      print_solution(recursive_get_steps(node))   
    end
  
    def recursive_get_steps(finish, path =[], steps=0)
      current = finish #.pos
      unless current.parent.nil?
        path << current.pos
        recursive_get_steps(current.parent.clone, path, steps)
      else
        path << @startnode.pos
      end
    end
    
    def print_solution(path)
      result = []
      steps = 0
      path.reverse!.each do |pos|
        unless pos == path.last 
          result << "#{pos} -> "
        else
          result << "#{pos}"
        end
        steps += 1
      end #do
       puts "Path found in #{steps - 1} steps for moving from #{@startnode.pos} to #{@endingpos}"
       puts result.join
    end
  end #class bfs
