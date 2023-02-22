require_relative 'piece'

class NullPiece < Piece 
include Singleton 
    attr_reader :color :symbol
    def initialize(color = 'purple')
        @color = color
        @symbol = :X
    end 
    
    def empty?
        true 
    end 
end