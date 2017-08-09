require_relative "piece.rb"
require 'singleton'

class NullPiece < Piece

  include Singleton

  def initialize
  end

  def moves
    []
  end

  # def color
  #   :no_color
  # end
  #
  def symbol
    "\u0020"
  end

end
