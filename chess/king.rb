require_relative "piece.rb"

class King < Piece
  include SteppingPiece

  DELTAS = [[-1, -1], [-1, 0], [-1, 1], [0, 1], [1, 1], [1, 0], [1, -1], [0, - 1]]

  def move_diffs
    coords = DELTAS.map do |delta|
      x = delta[0] + pos[0]
      y = delta[1] + pos[1]
      [x, y]
    end

    coords.select{|x| x[0].between?(0, 7) && x[1].between?(0, 7)}

  end

  def symbol
    color == :white ? "\u2654" : "\u265A"
  end


end
