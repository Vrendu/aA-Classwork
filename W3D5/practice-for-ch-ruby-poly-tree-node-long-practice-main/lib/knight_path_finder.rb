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
        build_move_tree 
    end

    def new_move_positions(pos)
        new_moves = KnightPathFinder.valid_moves(pos).select {|pos| !@considered_positions.include?(pos)}
        @considered_positions.concat(new_moves)
        new_moves
    end

    def find_path(end_pos)
        end_node = @root_node.dfs(end_pos)
        trace_path_back(end_node)
    end 

    def trace_path_back(end_node)
        path = [] 
        current_node = end_node
        until current_node.nil? 
            path << current_node.value 
            current_node = current_node.parent 
        end 

        path.reverse 
    end 

    def build_move_tree
        node_q = [@root_node]

        until node_q.empty? 
            node = node_q.shift 
            new_move_positions(node.value).each do |pos|
                child = PolyTreeNode.new(pos)
                child.parent = node
                node_q << child 
            end             
        end
        
    end
    


end