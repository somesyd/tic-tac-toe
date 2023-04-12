# frozen_string_literal: true

require 'board'

RSpec.describe Board do
  it 'begins as an array of indices 1-9' do
    arr = %w[1 2 3 4 5 6 7 8 9] # array of number strings
    expect(subject.current_board).to eq(arr)
  end

  describe '#add_move' do
    it 'positions the player token' do
      arr = %w[1 2 3 X 5 6 7 8 9]

      subject.add_move(4, 'X')

      expect(subject.current_board).to eq(arr)
    end
  end

  describe '#win' do
    it 'returns true if X takes first row' do
      add_moves([[1, 'X'], [2, 'X'], [3, 'X']])

      expect(subject.win?).to be true
      expect(subject.winner).to eq('X')
    end

    it 'returns true if O takes last row' do
      add_moves([[7, 'O'], [8, 'O'], [9, 'O']])

      expect(subject.win?).to be true
      expect(subject.winner).to eq('O')
    end

    it 'returns false if middle row is mixed' do
      add_moves([[4, 'O'], [5, 'X'], [6, 'O']])

      expect(subject.win?).to be false
      expect(subject.winner).to eq(nil)
    end

    it 'returns true if X takes first column' do
      add_moves([[7, 'X'], [4, 'X'], [1, 'X']])

      expect(subject.win?).to be true
      expect(subject.winner).to eq('X')
    end

    it 'returns true if O takes last column' do
      add_moves([[6, 'O'], [9, 'O'], [3, 'O']])

      expect(subject.win?).to be true
      expect(subject.winner).to eq('O')
    end

    it 'returns false if middle column is mixed' do
      add_moves([[2, 'O'], [8, 'O'], [5, 'X']])

      expect(subject.win?).to be false
      expect(subject.winner).to be_nil
    end

    it 'returns true if X takes left-to-right diagonal' do
      add_moves([[1, 'X'], [5, 'X'], [9, 'X']])

      expect(subject.win?).to be true
      expect(subject.winner).to eq('X')
    end

    it 'returns true if O takes right-to-left diagonal' do
      add_moves([[7, 'O'], [3, 'O'], [5, 'O']])

      expect(subject.win?).to be true
      expect(subject.winner).to eq('O')
    end
  end

  describe '#game_over?' do
    it 'returns true if there is a tie' do
      add_moves([[1, 'X'], [5, 'O'], [4, 'X'], [7, 'O'], [3, 'X'], [9, 'O'], [8, 'X'], [2, 'O'], [6, 'X']])

      expect(subject.game_over?).to be true
    end

    it 'returns true if there is a win' do
      add_moves([[1, 'X'], [2, 'O'], [5, 'X'], [9, 'O'], [7, 'X'], [6, 'O'], [4, 'X']])

      expect(subject.game_over?).to be true
    end

    it 'returns false if there is no win or tie' do
      add_moves([[1, 'X'], [5, 'O'], [2, 'X'], [3, 'O'], [7, 'X'], [4, 'O']])

      expect(subject.game_over?).to be false
    end
  end

  def add_moves(array)
    array.each do |move|
      position = move[0]
      token = move[1]
      subject.add_move(position, token)
    end
  end
end
