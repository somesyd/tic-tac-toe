# frozen_string_literal:true

class Board
  attr_accessor :current_board

  def initialize
    @current_board = Array.new(9, '')
  end
end
