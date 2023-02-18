class KnightPathFinder

    attr_reader :position, :root_node

    def self.valid_moves(pos)
        row, col = pos 
        moves = [[-1,-2],[-2,-1],[-2,1], [-1, 2],[1,-2],[2,-1],[2,1],[1,2]]

        moves.each do |move|
            move[0] = move[0] + row 
            move[1] = move[1] + col 
        end
        moves.select do |pos| 
            row, col = pos
            row <= 7 && row >= 0 && col <= 7 && col >= 0
        end
    end

    def initialize (position)
        @position = position 
        @root_node = PolyTreeNode.new(position) 
        @considered_positions = [position]
        #build_move_tree(@root_node)
    end

    def new_move_positions(pos)
        
    end


    def find_path(position)

    end
    


end