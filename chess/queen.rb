require_relative "piece.rb"

class Queen < Piece

  include SlidingPiece

  def symbol
    "Q"
  end

  protected

  def move_dirs
    vertical_dirs + horizontal_dirs + diagonal_dirs
  end

  def symbol
    color == :white ? "\u2655" : "\u265B"
  end
end
