# frozen_string_literal: true

class Turn
  def initialize(output, board)
    @output = output
    @board = board
  end

  def run(player)
    display_board
    display_request_next_move(player)
    move = request_next_move(player)
    @board.add_move(move, player.token)
  end

  private

  def display_board
    @output.pretty_print_board(@board.current_board)
  end

  def display_request_next_move(player)
    @output.print_prompt("#{player.name}, #{REQUEST_MOVE_MESSAGE}")
  end

  def request_next_move(player)
    valid = false
    until valid
      move = player.make_move
      valid = true if validate_player_input(move)
    end
    move.to_i
  end

  def validate_player_input(input)
    return @output.print_prompt(BAD_INPUT_MESSAGE) unless number_in_range?(input)

    return @output.print_prompt(ILLEGAL_MOVE_MESSAGE) unless @board.legal_move?(input.to_i)

    true
  end

  def number_in_range?(input)
    /^[1-9]$/.match?(input)
  end
end
