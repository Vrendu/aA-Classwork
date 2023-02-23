module Stepable 
    def moves
        moves = [] 
        self.move_diffs.each do |move|
            dx, dy = move 
            x, y = self.pos
            if x + dx >= 0 && x + dx <= 7 && y + dy >= 0 && y + dy <= 7
                moves << [dx, dy]
            end
        end

        moves
    end

    def move_diffs
    end
end 