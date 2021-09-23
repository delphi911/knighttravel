require_relative 'board'
require_relative 'knight'
require_relative 'bfs'
class Main
    def initialize
      puts "Ana program başlatılıyor..."
    end
  
    def knight_moves(startmove, endmove)
      brd = Board.new #initialize the board and mark evey square(node) unvisited.
      at = Knight.new(startmove) #knight initialized on square startmove([x,y]). It knows where it is on the board. and 
      #also knows where it may move from its current position.
      cozum = SolvebyBFS.new(startmove, endmove, brd, at)
      cozum.bfs()
    end
end

app = Main.new
app.knight_moves([0,0], [6,6])
app.knight_moves([0,0], [1,2])
app.knight_moves([3,3], [0,0])
app.knight_moves([0,0], [1,1])
app.knight_moves([0,0], [2,2])
app.knight_moves([0,0], [3,3])
app.knight_moves([0,0], [4,4])
app.knight_moves([0,0], [5,5])
app.knight_moves([0,0], [7,7])
