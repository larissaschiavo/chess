require_relative "./board.rb"

class Piece
attr_reader :pos, :board

  def initialize(pos, board, color)
    @pos = pos
    @board = board
    @color = color
  end

  def empty?
  end

  def symbol

  end

  def valid_moves
  end

  def to_s
    return symbol.to_s
  end

  private

  def move_into_check(to_pos)
  end

end

module SlidingPiece
  def moves
    move_dirs
  end

  private
  def move_dirs

  end

  def vertical_dirs
    vertical_moves = []

    aux_row, aux_col = pos.dup
    aux_row += 1
    while board.in_bounds([aux_row, aux_col])
      vertical_moves << [aux_row, aux_col]
      break unless board[[aux_row, aux_col]].is_a?(NullPiece)
      aux_row += 1
    end

    aux_row, aux_col = pos.dup
    aux_row -= 1
    while board.in_bounds([aux_row, aux_col])
      vertical_moves << [aux_row, aux_col]
      break unless board[[aux_row, aux_col]].is_a?(NullPiece)
      aux_row -= 1
    end

    vertical_moves
  end

  def horizontal_dirs
    horizontal_moves = []

    aux_row, aux_col = pos.dup
    aux_col += 1
    while board.in_bounds([aux_row, aux_col])
      horizontal_moves << [aux_row, aux_col]
      break unless board[[aux_row, aux_col]].is_a?(NullPiece)
      aux_col += 1
    end

    aux_row, aux_col = pos.dup
    aux_col -= 1
    while board.in_bounds([aux_row, aux_col])
      horizontal_moves << [aux_row, aux_col]
      break unless board[[aux_row, aux_col]].is_a?(NullPiece)
      aux_col -= 1
    end

    horizontal_moves
  end

  def diagonal_dirs
    diagonal_moves = []


    aux_row, aux_col = pos.dup
    aux_row -= 1
    aux_col -= 1
    while board.in_bounds([aux_row, aux_col])
      diagonal_moves << [aux_row, aux_col]
      break unless board[[aux_row, aux_col]].is_a?(NullPiece)
      aux_row -= 1
      aux_col -= 1
    end

    aux_row, aux_col = pos.dup
    aux_row -= 1
    aux_col += 1
    while board.in_bounds([aux_row, aux_col])
      diagonal_moves << [aux_row, aux_col]
      break unless board[[aux_row, aux_col]].is_a?(NullPiece)
      aux_row -= 1
      aux_col += 1
    end


    aux_row, aux_col = pos.dup
    aux_row += 1
    aux_col += 1
    while board.in_bounds([aux_row, aux_col])
      diagonal_moves << [aux_row, aux_col]
      break unless board[[aux_row, aux_col]].is_a?(NullPiece)
      aux_row += 1
      aux_col += 1
    end


    aux_row, aux_col = pos.dup
    aux_row += 1
    aux_col -= 1
    while board.in_bounds([aux_row, aux_col])
      diagonal_moves << [aux_row, aux_col]
      break unless board[[aux_row, aux_col]].is_a?(NullPiece)
      aux_row += 1
      aux_col -= 1
    end

    diagonal_moves
  end

  def grow_unblocked_moves_in_dir(dx, dy)
  end
end


module SteppingPiece
end
