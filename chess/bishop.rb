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
end
