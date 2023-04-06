# frozen_string_literal: true

class Turn
  def initialize(output, board, validator)
    @output = output
    @board = board
    @validator = validator
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
    error_report = @validator.check(input, @board.current_board)
    @output.print_prompt(error_report.error_message) unless error_report.valid
    error_report.valid
  end
end
