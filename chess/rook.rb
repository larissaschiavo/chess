require_relative "piece.rb"

class Rook < Piece
  include SlidingPiece
  def symbol
    color == :white ? "\u2656" : "\u265C"
  end

  protected
  def move_dirs
    vertical_dirs + horizontal_dirs
  end
end
