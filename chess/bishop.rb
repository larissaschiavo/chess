require_relative "piece.rb"

class Bishop < Piece

  include SlidingPiece

  def symbol
    :bishop
  end

  protected

  def move_dirs
    diagonal_dirs
  end

  def symbol
    color == :white ? "\u2657" : "\u265D"
  end
end
