require_relative 'tree_node'
require 'byebug'
class KnightPathFinder

    attr_reader :position, :root_node, :considered_positions

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
        KnightPathFinder.valid_moves(position)
        #build_move_tree(@root_node)
    end

    def new_move_positions(pos)
        new_moves = KnightPathFinder.valid_moves(pos).select {|pos| !@considered_positions.include?(pos)}
        @considered_positions.concat(new_moves)
        new_moves
    end
    def find_path(position)
    end
    def build_move_tree
        # debugger
        node_q = []
        moves = new_move_positions(@position)
        moves.each do |move|
          new_node = PolyTreeNode.new(move)  
          new_node.parent = @root_node
          node_q << new_node
        end
        
        p node_q
    end
    


end