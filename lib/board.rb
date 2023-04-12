# frozen_string_literal: true

require './lib/winning_sequences'

class Board
  include WinningSequences

  attr_reader :current_board, :winner, :winner_array

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

  def win?
    SEQUENCES.each do |sequence|
      sequence_tokens = map_position_to_board_token(sequence)
      next unless find_three_matching_tokens(sequence_tokens)

      @winner_array = map_position_to_index(sequence)
      return true
    end
    false
  end

  private

  def map_position_to_board_token(sequence_array)
    sequence_array.map { |position| @current_board[position - 1] }
  end

  def map_position_to_index(array)
    array.map { |position| position - 1 }
  end

  def board_full?
    @current_board.select { |space| space[/^[1-9]$/] }.empty?
  end

  def find_three_matching_tokens(token_array)
    token = token_array[0]
    if token_array.uniq.count == 1
      @winner = token
      return true
    end
    false
  end
end
