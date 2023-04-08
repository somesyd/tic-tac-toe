# frozen_string_literal:true

class Board
  attr_accessor :current_board, :winner, :winner_array

  def initialize
    @current_board = '123456789'.chars
    @winner = nil
    @winner_array = []
  end

  def add_move(index, token)
    @current_board[index - 1] = token
  end

  def game_over?
    win? || board_full?
  end

  def board_full?
    @current_board.select { |space| space[/^[1-9]$/] }.empty?
  end

  def win?
    return row_win? if row_win?

    return column_win? if column_win?

    return diagonal_win? if diagonal_win?

    false
  end

  def row_win?
    3.times do |index|
      row = @current_board[(3 * index)..(3 * index) + 2]
      if find_three_matching_tokens(row)
        @winner_array = ((3 * index)..(3 * index) + 2).to_a
        return true
      end
    end
    false
  end

  def column_win?
    3.times do |col_index|
      column = []
      3.times do |row_index|
        column.push(@current_board[(3 * row_index) + col_index])
      end
      if find_three_matching_tokens(column)
        3.times do |r|
          @winner_array.push((3 * r) + col_index)
        end
        return true
      end
    end
    false
  end

  def diagonal_win?
    diagonals = [[1, 5, 9], [3, 5, 7]]
    diagonals.each do |indices|
      diagonal = []
      indices.each do |index|
        diagonal.push(@current_board[index - 1])
      end
      if find_three_matching_tokens(diagonal)
        indices.each do |i|
          @winner_array.push(i - 1)
        end
        return true
      end
    end
    false
  end

  def find_three_matching_tokens(token_array)
    token = token_array[0]
    matches = token_array.select { |val| val == token }
    if matches.count == 3
      @winner = token
      return true
    end
    false
  end
end
