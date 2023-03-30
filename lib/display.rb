# frozen_string_literal: true

require 'pretty_print'
require 'stringify_board'

class Display
  def initialize(text_string_builder, board_string_builder)
    @text_string_builder = text_string_builder
    @board_string_builder = board_string_builder
  end

  def pretty_print_text(content)
    puts text_string_builder(content).message
  end

  def pretty_print_board(board)
    puts 'I have a board!'
  end
end
