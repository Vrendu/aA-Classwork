require_relative 'piece'

class King < Piece 
    include Stepable
    def symbol
        '♚'.colorize(self.color)
    end

    protected
    def move_diffs
        deltas ={[1,1], [-1,1], [-1,-1], [1,-1]}
    end
end 