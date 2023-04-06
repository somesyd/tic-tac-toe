# frozen_string_literal: true

require './lib/text'
require './lib/display'
require './lib/board'

class Game
  def initialize(output, board, turn, players)
    @output = output
    @board = board
    @turn = turn
    @players = players
  end

  def play
    display_welcome_message
    until @board.win?
      current_player = select_next_player(current_player)
      @turn.run(current_player)
    end
  end

  private

  def select_next_player(player)
    return @players[1] if player == @players[0]

    @players[0]
  end

  def display_welcome_message
    @output.pretty_print_text(WELCOME_MESSAGE)
  end
end
