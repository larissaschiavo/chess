require_relative "piece.rb"

class Rook < Piece
  include SlidingPiece
  def symbol
    :rook
  end

  protected
  def move_dirs
    
  end
end
