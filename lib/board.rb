# frozen_string_literal:true

class Board
  attr_accessor :current_board

  def initialize
    @current_board = '123456789'.chars
  end

  def add_move(index, token)
    @current_board[index - 1] = token
  end

  def win?
    # placeholder to stop after 3 moves
    @current_board.count('X') + @current_board.count('O') > 2
  end
end
