class Rook < Piece 
 include Slideable

    def initialize

    end 

    private def move_dirs
        HORIZONTAL_AND_VERTICAL_DIRS
    end 
end 