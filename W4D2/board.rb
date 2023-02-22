require_relative 'pieces'

class Board 
    attr_reader :board
    def initialize 
        @board = Array.new(8) {Array.new(8, nil)}
        fillBoard
    end 

    def fillBoard
        board.each_with_index do |row,i|
            if i == 1 
                row.each_with_index {|ele, j| board[i][j] = Pawn.new('black', self, [i,j])} 
            elsif  i == 6
                row.each_with_index {|ele, j| board[i][j] = Pawn.new('white', self, [i,j])} 
            elsif i == 0
                row.each_with_index do |ele, j|
                    if j == 0 || j == 7
                        board[i][j] = Rook.new('black', self, [i, j])
                    elsif j == 1 || j == 6
                        board[i][j] = Knight.new('black', self, [i, j])
                    elsif j == 2 || j == 5
                        board[i][j] = Bishop.new('black', self, [i, j])
                    elsif j == 3 
                        board[i][j] = King.new('black', self, [i, j])
                    elsif j == 4
                        board[i][j] = Queen.new('black', self, [i, j])
                    end
                end
            elsif i == 6
                row.each_with_index do |ele, j|
                    if j == 0 || j == 7
                        board[i][j] = Rook.new('white', self, [i, j])
                    elsif j == 1 || j == 6
                        board[i][j] = Knight.new('white', self, [i, j])
                    elsif j == 2 || j == 5
                        board[i][j] = Bishop.new('white', self, [i, j])
                    elsif j == 3 
                        board[i][j] = Queen.new('white', self, [i, j])
                    elsif j == 4
                        board[i][j] = King.new('white', self, [i, j])
                    end
                end
            else
                row.each_with_index {|ele, j| board[i][j] = NullPiece.instance}
            end 
        end
    end

    def move_piece(start_pos, end_pos)
        raise 'error' if self[start_pos] == nil 
        raise 'error' if !end_pos[0].between?(0,7) || !end_pos[1].between?(0,7)
        value = self[start_pos]
        self[end_pos] = value 
        self[start_pos] = NullPiece.instance
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
