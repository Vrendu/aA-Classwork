require_relative 'piece'
class Rook < Piece 
 include Slideable
    

    private def move_dirs
        HORIZONTAL_AND_VERTICAL_DIRS
    end 
end 