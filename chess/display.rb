require "colorize"
require_relative "cursor.rb"

class Display
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    8.times do |row|
      individual_row = []
      8.times do |col|
        if @cursor.cursor_pos == [row,col]
          individual_row << @board[[row, col]].to_s.colorize(:blue)
        else
          individual_row << @board[[row, col]].to_s.colorize(:red)
        end
      end
      row_render = individual_row.join("|")
      puts row_render
    end
  end

  def render_loop
    while true
      render
      @cursor.get_input
      puts 
    end
  end
end
