# frozen_string_literal: true

require './lib/text'

ErrorReport = Struct.new(:valid, :error_message)

class Validate
  def check(input, board_array)
    return ErrorReport.new(false, BAD_INPUT_MESSAGE) unless number_in_range?(input)

    return ErrorReport.new(false, ILLEGAL_MOVE_MESSAGE) unless legal_move?(input, board_array)

    ErrorReport.new(true, nil)
  end

  private

  def number_in_range?(input)
    /^[1-9]$/.match?(input)
  end

  def legal_move?(input, board_array)
    /^[1-9]$/.match?(board_array[input.to_i - 1])
  end
end
