# frozen_string_literal:true

require './lib/text'
require './lib/display'
require './lib/board'

class Game
  def initialize(output, board)
    @output = output
    @board = board
  end

  def play
    display_welcome_message
    display_board
  end

  def display_welcome_message
    @output.text(WELCOME_MESSAGE)
  end

  def display_board
    @output.board(@board.current_board)
  end
end
