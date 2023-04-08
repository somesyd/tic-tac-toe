# frozen_string_literal: true
#

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
    @outlet.send(text)
  end

  def pretty_print_board(board, colorize_array = [], color = nil)
    @outlet.send(@board_formatter.format_board(board, @last_width, colorize_array, color))
  end

  def print_text(content)
    @outlet.send(content)
  end

  def print_prompt(content)
    @outlet.send_without_newline(content)
  end
end
