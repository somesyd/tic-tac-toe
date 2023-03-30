# frozen_string_literal:true

class StringifyBoard
  attr_reader :board_string

  def initialize(board, vertical_char = '¦', horizontal_char = '-')
    @board = board.dup
    @vertical_char = vertical_char
    @horizontal_char = horizontal_char
    @vertical_padding = 5
    @board_string = ''
    build_board_string
  end

  def build_board_string
    @board_string = build_player_row(0)
    @board_string += horizontal_line
    @board_string += build_player_row(1)
    @board_string += horizontal_line
    @board_string += build_player_row(2)
  end

  def build_player_row(row_num)
    block = empty_vertical_line
    block += vertical_player_line(row_num * 3)
    block += empty_vertical_line
    block
  end

  def empty_vertical_line
    "#{' ' * @vertical_padding}#{@vertical_char}#{' ' * @vertical_padding}#{@vertical_char}\n"
  end

  def vertical_player_line(start_index)
    line = ''
    3.times do |i|
      line += ' ' * player_padding
      line += @board[start_index + i]
      line += ' ' * player_padding
      line += @vertical_char if i < 2
    end
    "#{line}\n"
  end

  def horizontal_line
    width = (3 * @vertical_padding) + 2
    "#{@horizontal_char * width}\n"
  end

  def player_padding
    (@vertical_padding - 1) / 2
  end
end
