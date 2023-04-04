# fro   zen_string_litera
# :true

require './lib/text'
require './lib/display'
require './lib/board'

class Game
  def initialize(output, board, players)
    @output = output
    @board = board
    @players = players
  end

  def play
    display_welcome_message
    display_board
    current_player = select_next_player(nil)
    display_request_next_move(current_player)
    move = request_next_move(current_player)
    @board.add_move(move, 'X')
    display_board
  end

  def display_board
    @output.pretty_print_board(@board.current_board)
  end

  private

  def display_request_next_move(player)
    @output.print_prompt("#{player.name}, #{REQUEST_MOVE_MESSAGE}")
  end

  def request_next_move(player)
    valid = false
    until valid
      move = player.request_move
      valid = true if player_input_valid?(move)
    end
    move.to_i
  end

  def select_next_player(player)
    return @players[1] if player == @players[0]

    @players[0]
  end

  def player_input_valid?(input)
    return @output.print_prompt(BAD_INPUT_MESSAGE) unless number_in_range?(input)

    true
  end

  def number_in_range?(input)
    /^[1-9]$/.match?(input)
  end

  def display_welcome_message
    @output.pretty_print_text(WELCOME_MESSAGE)
  end
end
