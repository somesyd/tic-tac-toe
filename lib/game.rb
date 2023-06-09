# frozen_string_literal: true

require 'colorize'
require './lib/text'
require './lib/display'
require './lib/board'
require './lib/color_by_index'

class Game
  include Text

  def initialize(output, board, turn, players)
    @output = output
    @board = board
    @turn = turn
    @players = players
  end

  def play
    display_welcome_message
    until @board.game_over?
      current_player = select_next_player(current_player)
      @turn.run(current_player)
    end
    display_game_end_message
  end

  private

  def select_next_player(player)
    return @players[1] if player == @players[0]

    @players[0]
  end

  def display_welcome_message
    @output.pretty_print_text(WELCOME_MESSAGE)
  end

  def display_game_end_message
    if @board.win?
      winner = determine_winner
      color_by_index = ColorByIndex.new(@board.winner_array, :green)
      @output.pretty_print_text(game_over_winner(winner.name))
      @output.pretty_print_board(@board.current_board, color_by_index)
    else
      @output.pretty_print_text(GAME_OVER_TIED)
      @output.pretty_print_board(@board.current_board)
    end
  end

  def determine_winner
    @players.select { |player| player.token == @board.winner }[0]
  end
end
