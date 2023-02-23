require_relative 'piece'

class Pawn < Piece
    def symbol
        '♟'.colorize(self.color)
    end
    
    def moves
        
    end

    private

    def at_start_row?
        if (self.pos[0] == 1 && self.color == 'black') || (self.pos[0] == 6 && self.color == 'white')
            return true
        end

        false
    end

    def forward_dir
        
        #returns 1 or -1
    end

    def forward_steps
    end

    def side_attacks
    end

end 