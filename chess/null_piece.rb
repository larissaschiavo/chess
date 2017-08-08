require_relative "piece.rb"

class NullPiece < Piece

  include Singleton

  def initialize
  end

  def moves
    nil
  end

  def color
    :no_color
  end

  def symbol
    :null
  end

end
