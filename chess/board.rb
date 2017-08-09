require_relative "piece.rb"
require_relative "null_piece.rb"
require_relative "king.rb"
require_relative "knight.rb"
require_relative "queen.rb"
require_relative "bishop.rb"
require_relative "rook.rb"
require_relative "pawn.rb"
require "byebug"

class Board
  def initialize

    @grid = Array.new(8){ Array.new(8) }
    @grid[0][0] = Rook.new([0,0], self, :black)
    @grid[0][1] = Knight.new([0,1], self, :black)
    @grid[0][2] = Bishop.new([0,2], self, :black)
    @grid[0][3] = King.new([0,3], self, :black)
    @grid[0][4] = Queen.new([0,4], self, :black)
    @grid[0][5] = Bishop.new([0,5], self, :black)
    @grid[0][6] = Knight.new([0,6], self, :black)
    @grid[0][7] = Rook.new([0,7], self, :black)

    8.times do |idx|
      @grid[1][idx] = Pawn.new([1,idx], self, :black, :down)
    end

    8.times do |idx|
      @grid[6][idx] = Pawn.new([6,idx], self, :white, :up)
    end

    @grid[7][0] = Rook.new([7,0], self, :white)
    @grid[7][1] = Knight.new([7,1], self, :white)
    @grid[7][2] = Bishop.new([7,2], self, :white)
    @grid[7][3] = King.new([7,3], self, :white)
    @grid[7][4] = Queen.new([7,4], self, :white)
    @grid[7][5] = Bishop.new([7,5], self, :white)
    @grid[7][6] = Knight.new([7,6], self, :white)
    @grid[7][7] = Rook.new([7,7], self, :white)

    @grid[2].map! do |row|
      NullPiece.instance
    end
    @grid[3].map! do |row|
      NullPiece.instance
    end
    @grid[4].map! do |row|
      NullPiece.instance
    end
    @grid[5].map! do |row|
      NullPiece.instance
    end

    ##initialize_black
    ##initialize_white

  end
  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, piece)
    row, col = pos
    @grid[row][col] = piece
    piece.pos = [row, col]
  end

  def dup()
  end

  def move_piece(color, start_pos, end_pos)
  end


  def move_piece!(start_pos, end_pos)
    current_piece = @grid[start_pos[0]][start_pos[1]]
    raise "no piece on starting position" if current_piece.is_a? NullPiece
    #raise "invalid position" unless @grid[end_pos[0]][end_pos[1]].valid_moves.include?(end_pos)
    @grid[end_pos[0]][end_pos[1]] = current_piece
  end

  def in_bounds(pos)
    row, col = pos
    row.between?(0, 7) && col.between?(0, 7)
  end


end
