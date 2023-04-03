# frozen_string_literal: true

require './lib/pretty_print'
require './lib/stringify_board'

class Display
  def initialize(text_formatter, board_formatter)
    @text_formatter = text_formatter
    @board_formatter = board_formatter
    @last_width = nil
  end

  def pretty_print_text(content)
    text = @text_formatter.format_text(content)
    @last_width = text.split("\n").max_by(&:length).length
    puts text
  end

  def pretty_print_board(board)
    puts @board_formatter.format_board(board, @last_width)
  end
end
