# frozen_string_literal:true

class Board
  attr_accessor :current_board

  def initialize
    @current_board = '123456789'.chars
  end
end
