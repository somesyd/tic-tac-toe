# frozen_string_literal: true

require './lib/pretty_print'

class Display
  def initialize(outlet, text_formatter, board_formatter)
    @outlet = outlet
    @text_formatter = text_formatter
    @board_formatter = board_formatter
    @last_width = nil
  end

  def pretty_print_text(content)
    text = @text_formatter.format_text(content)
    @last_width = text.split("\n").max_by(&:length).length
    @outlet.display(text)
  end

  def pretty_print_board(board)
    @outlet.display(@board_formatter.format_board(board, @last_width))
  end
end
