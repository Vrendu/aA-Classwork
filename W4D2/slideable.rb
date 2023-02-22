require 'byebug'
module Slideable
    
    HORIZONTAL_AND_VERTICAL_DIRS = [ [1,0], [-1,0], [0,1], [0,-1]]
    
    DIAGONAL_DIRS = [[1,1], [-1,-1], [-1,1], [1,-1]]
    

    def horizontal_and_vertical_dirs
    # getter for HORIZONTAL_AND_VERTICAL_DIRS
        HORIZONTAL_AND_VERTICAL_DIRS
    end

    def diagonal_dirs
    # getter for DIAGONAL_DIRS
        DIAGONAL_DIRS
    end


  # should return an array of places a Piece can move to
    def moves
    # create array to collect moves
        moves = [] 
        self.move_dirs.each do |move|
            dx, dy = move 
            moves.concat(grow_unblocked_moves_in_dir(dx, dy))
        end
    # iterate over each of the directions in which a slideable piece can move
      # use the Piece subclass' `#move_dirs` method to get this info
      # for each direction, collect all possible moves in that direction
        # and add them to your moves array 
        # (use the `grow_unblocked_moves_in_dir` helper method)
        moves 
    # return the final array of moves (containing all possible moves in all directions)
    end


    private

    def move_dirs
        # subclass implements this
        raise NotImplementedError # this only executes if not implemented by class that includes this module
    end


  # this helper method is only responsible for collecting all moves in a given direction
  # the given direction is represented by two args, the combination of a dx and dy
    def grow_unblocked_moves_in_dir(dx, dy) #1,1
    # create an array to collect moves
        moves = [] 
    # get the piece's current row and current column #2,2
    #debugger 
        row, col = self.pos 
    # in a loop:
      # continually increment the piece's current row and current column to generate a new position #4,4
      # stop looping if the new position is invalid (not on the board); the piece can't move in this direction
      # if the new position is empty, the piece can move here, so add the new position to the moves array
      # if the new position is occupied with a piece of the opposite color, the piece can move here (to capture the opposing piece), so add the new position to the moves array
        # but, the piece cannot continue to move past this piece, so stop looping
      # if the new position is occupied with a piece of the same color, stop looping
        loop do 
            row += dx 
            col += dy
           
            if row > 7 || row < 0 || col > 7 || col < 0 || @board[[row,col]].color == self.color 
                break  
            elsif @board[[row,col]].color != self.color && @board[[row, col]].color != nil
                moves << [row,col]
                break   
            else   
                moves << [row, col]  
            end 
        end 

        moves 
    # return the final moves array
    end
end