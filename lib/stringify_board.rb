# frozen_string_literal:true

require 'colorize'

class StringifyBoard
  attr_accessor :vertical_char, :horizontal_char

  def initialize(vertical_char = '¦', horizontal_char = '-')
    @board = []
    @vertical_char = vertical_char
    @horizontal_char = horizontal_char
    @vertical_padding = 5
  end

  def format_board(board, match_width, color_by_index = nil)
    @board = board.dup
    build_board_string(color_by_index, match_width)
  end

  private

  def build_board_string(color_by_index, center_on_width = nil)
    board_string = build_player_row(0, color_by_index)
    board_string += horizontal_line
    board_string += build_player_row(1, color_by_index)
    board_string += horizontal_line
    board_string += build_player_row(2, color_by_index)
    pad_board_string(board_string, center_on_width) if center_on_width
  end

  def pad_board_string(board_string, center_on_width)
    left_padding = (center_on_width - board_width) / 2
    lines = board_string.split("\n")
    lines.each_with_index do |line, index|
      lines[index] = "#{' ' * left_padding}#{line}"
    end
    lines.join("\n")
  end

  def build_player_row(row_num, color_by_index)
    block = empty_vertical_line
    block += vertical_player_line(row_num * 3, color_by_index)
    block += empty_vertical_line
    block
  end

  def empty_vertical_line
    "#{' ' * @vertical_padding}#{@vertical_char}#{' ' * @vertical_padding}#{@vertical_char}\n"
  end

  def vertical_player_line(start_index, color_by_index)
    line = ''
    3.times do |i|
      line += ' ' * player_padding
      # line += @board[start_index + i]
      line += player_index_string(start_index + i, color_by_index)
      line += ' ' * player_padding
      line += @vertical_char if i < 2
    end
    "#{line}\n"
  end

  def player_index_string(index, color_by_index)
    return @board[index].colorize(color_by_index.color) if index_should_have_color?(index, color_by_index)

    @board[index]
  end

  def index_should_have_color?(index, color_by_index)
    return false if color_by_index.nil?

    return true if color_by_index.index_array.include?(index)

    false
  end

  def board_width
    (3 * @vertical_padding) + 2
  end

  def horizontal_line
    "#{@horizontal_char * board_width}\n"
  end

  def player_padding
    (@vertical_padding - 1) / 2
  end
end
