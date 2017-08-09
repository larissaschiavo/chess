require "colorize"
require_relative "cursor.rb"
require_relative "piece.rb"
require_relative "null_piece.rb"
require "byebug"
class Display
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
    @selected_piece = nil
    @highlighted_pos = []
  end

  def render
    system("clear")
    8.times do |row|
      individual_row = []
      8.times do |col|
        background = (row + col).even? ? :light_black : :default
        if @highlighted_pos.include?([row, col])
          background = :yellow
        end

        if @cursor.cursor_pos == [row,col]
          background = :green
        end
        if @selected_piece == [row, col]
          background = :light_red
        end
        piece = @board[[row, col]]
        print piece.to_s.colorize(:color => piece.color, :background => background)
      end
      puts
      #row_render = individual_row.join(" ")
      #p row_render
    end
  end

  def move(new_pos)
    piece = @board[@selected_piece]
    if piece.moves.include?(new_pos)
      @board[new_pos] = piece
      @board[@selected_piece] = NullPiece.instance
    end
  end

  def render_loop
    while true
      render
      loc_var = @cursor.get_input
      if loc_var != nil
        if @selected_piece.nil?
          piece = @board[loc_var]
          unless piece.is_a?(NullPiece)
          @selected_piece = loc_var

          @highlighted_pos = piece.moves
        end
        else
          move(loc_var)
          @selected_piece = nil
          @highlighted_pos = []
        end
      end
      puts
    end
  end
end
