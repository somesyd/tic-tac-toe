# frozen_string_literal:true

class Board
  attr_accessor :current_board

  def initialize
    @current_board = '123456789'.chars
    @vertical_char = '¦'
    @horizontal_char = '-'
  end

  def pretty_print
    @current_board
  end
end
