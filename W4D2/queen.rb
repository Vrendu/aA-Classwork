require_relative 'piece'
class Queen < Piece 
    include Slideable

    
    private def move_dirs
        HORIZONTAL_AND_VERTICAL_DIRS.concat(DIAGONAL_DIRS)
    end 
end 