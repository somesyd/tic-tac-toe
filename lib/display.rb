# frozen_string_literal: true

require './lib/pretty_print'
require './lib/stringify_board'

class Display
  def initialize(text_formatter, board_formatter)
    @text_formatter = text_formatter
    @board_formatter = board_formatter
  end

  def pretty_print_text(content)
    puts @text_formatter.format_text(content)
  end

  def pretty_print_board(board, match_width = nil)
    @board_formatter.match_width = match_width if match_width
    puts @board_formatter.format_board(board)
  end
end
