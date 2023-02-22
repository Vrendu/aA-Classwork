require_relative 'pieces'

class Board 
    attr_reader :board
    def initialize 
        @board = Array.new(8) {Array.new(8, nil)}
        fillBoard
    end 

    def fillBoard
        board.each_with_index do |row,i|
            if i.between?(0,1) || i.between?(6,7)
                row.each_with_index {|ele, j| board[i][j] = Piece.new('black', self, [i,j])} 
            end 
        end
    end

    def move_piece(start_pos, end_pos)
        raise 'error' if self[start_pos] == nil 
        raise 'error' if !end_pos[0].between?(0,7) || !end_pos[1].between?(0,7)
        value = self[start_pos]
        self[end_pos] = value 
        self[start_pos] = nil
    end 

    def []= (position, value)
        row, col = position 
        board[row][col] = value 
    end

    def [] (position)
        row, col = position 
        board[row][col]
    end


end 
