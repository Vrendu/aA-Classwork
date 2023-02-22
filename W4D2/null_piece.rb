require_relative 'piece'
require 'singleton'

class NullPiece < Piece 
    include Singleton 
    attr_reader :color, :symbol
    def initialize(color = nil)
        @color = color
        @symbol = :X
    end 
    
    def empty?
        true 
    end 
end