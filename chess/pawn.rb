require_relative "piece.rb"
require "byebug"

class Pawn < Piece



  def initialize(pos, board, color, direction)
    @direction = direction
    super pos, board, color
    @start_pos = pos
  end

  def symbol
    color == :white ? "\u2659" : "\u265F"
  end

  def moves
    forward_steps + side_attacks
  end

  protected
  def at_start_row?
    pos[0] == @start_pos[0]
  end

  def forward_dir
    @direction
  end

  def forward_steps
    forward_moves = []
    if @direction == :down
      byebug
      if board[[pos[0]+1, pos[1]]].is_a?(NullPiece)
        if at_start_row? && board[[pos[0]+2, pos[1]]].is_a?(NullPiece)
          forward_moves << [pos[0]+2, pos[1]]
        end
          forward_moves << [pos[0]+1, pos[1]]
      end
    elsif @direction == :up
      if board[[pos[0]-1, pos[1]]].is_a?(NullPiece)
        if at_start_row? && board[[pos[0]-2, pos[1]]].is_a?(NullPiece)
          forward_moves << [pos[0]-2, pos[1]]
        end
        forward_moves << [pos[0]-1, pos[1]]
      end
    end
    forward_moves
  end

  def side_attacks
    side_moves = []
    if @direction == :down
      if board[[pos[0]+1, pos[1]+1]].is_a?(NullPiece)
        side_moves << [pos[0]+1, pos[1]+1]
      end
      if board[[pos[0]+1, pos[1]-1]].is_a?(NullPiece)
        side_moves << [pos[0]+1, pos[1]-1]
      end
    elsif @direction == :up
      if board[[pos[0]-1, pos[1]-1]].is_a?(NullPiece)
        side_moves << [pos[0]-1, pos[1]-1]
      end
      if board[[pos[0]-1, pos[1]+1]].is_a?(NullPiece)
        side_moves << [pos[0]-1, pos[1]+1]
      end
    end
    side_moves
  end

end
