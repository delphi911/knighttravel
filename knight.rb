class Knight
  attr_accessor :pos
  attr_reader :allowedpositions
  
  def initialize(pos)
    @pos = pos
    @canmove = [[-1,2], [1,2], [-2,-1], [2,1],[-2,1],[2,-1],[-1,-2],[1,-2]]
    calculateallowedpositions
  end
   
  def calculateallowedpositions(pos=@pos)
    @allowedpositions = []
    @canmove.each do |move|
      @allowedpositions  << [move[0]+pos[0], move[1]+pos[1]] if ((move[0]+pos[0])>-1 &&  (move[0]+pos[0])<8) && ((move[1]+pos[1])>-1 &&  (move[1]+pos[1])<8)
    end
  end
end #class Knight
