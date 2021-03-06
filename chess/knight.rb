require_relative "piece.rb"

class Knight < Piece
  include SteppingPiece

  DELTAS = [[-2, -1], [-2, 1], [-1, -2], [1, -2], [2, -1], [2, 1], [-1, 2], [1, 2]]

  def move_diffs
    coords = DELTAS.map do |delta|
      x = delta[0] + pos[0]
      y = delta[1] + pos[1]
      [x, y]
    end

    coords.select{|x| x[0].between?(0, 7) && x[1].between?(0, 7)}

  end

  def symbol
    color == :white ? "\u2658" : "\u265e"
  end


end
