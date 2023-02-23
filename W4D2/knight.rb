require_relative 'piece'

class Knight < Piece
    include Stepable
    def symbol
        '♞'.colorze(self.color)
    end

    protected
    def move_diffs
        deltas = [[2, -1], [2, 1], [-2, 1], [-2, -1], [1, 2], [1, -2], [-1, -2], [-1, 2]]

    end
end 