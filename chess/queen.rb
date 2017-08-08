require_relative "piece.rb"

class Queen < Piece

  include SlidingPiece

  def symbol
    :queen
  end

  protected

  def move_dirs
    vertical_dirs + horizontal_dirs + diagonal_dirs
  end
end
