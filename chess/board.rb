require_relative "piece.rb"
require_relative "null_piece.rb"

class Board
  def initialize
    @grid = Array.new(8){ Array.new(8) }
    @grid[0].map! do |row|
      Piece.new
    end
    @grid[1].map! do |row|
      Piece.new
    end
    @grid[6].map! do |row|
      Piece.new
    end
    @grid[7].map! do |row|
      Piece.new
    end
    @grid[2].map! do |row|
      NullPiece.new
    end
    @grid[3].map! do |row|
      NullPiece.new
    end
    @grid[4].map! do |row|
      NullPiece.new
    end
    @grid[5].map! do |row|
      NullPiece.new
    end
    ##initialize_black
    ##initialize_white
  end
  def [](pos)
    row, col = pos
    @grid[row][col]
  end


  def move_piece(start_pos, end_pos)
    current_piece = @grid[start_pos[0]][start_pos[1]]
    raise "no piece on starting position" if current_piece.is_a? NullPiece
    #raise "invalid position" unless @grid[end_pos[0]][end_pos[1]].valid_moves.include?(end_pos)
    @grid[end_pos[0]][end_pos[1]] = current_piece

  end
end
