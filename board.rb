require_relative 'node'

class Board
    attr_accessor :board, :square
 
    def initialize
      @board = Array.new(8){|x| Array.new(8) {|y| Node.new([x,y]) } }
    end #initialize
 
    def setstate(pos, newstate)
 #-1 : unvisited
 # 1 : visited
 # 2 : discovered
 # pos : 2d array giving a node in the board,ie, [1,1] is left bottom corner.
      @board[pos[0]][pos[1]].state  = newstate
    end

    def getnode(pos)
      @board[pos[0]][pos[1]]
    end
 
    def printboard
     @board.each do |row|
       p row
     end
     puts "\n"
    end
 end
