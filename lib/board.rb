# frozen_string_literal:true

class Board
  attr_accessor :current_board

  def initialize
    @current_board = '123456789'.chars
  end

  def add_move(index, token)
    @current_board[index - 1] = token
  end

  def legal_move?(index)
    /^[1-9]$/.match?(@current_board[index - 1])
  end
end
