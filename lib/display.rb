# frozen_string_literal: true

require './lib/pretty_print'
require './lib/stringify_board'

class Display
  def pretty_print_text(content)
    puts PrettyPrint.new(content).message
  end

  def pretty_print_board(board)
    puts 'I have a board!'
  end
end
