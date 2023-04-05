# frozen_string_literal:true

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

  describe '#legal_move?' do
    it 'returns true if move is valid' do
      subject.add_move(3, 'X')
      subject.add_move(6, 'O')

      expect(subject.legal_move?(4)).to eq(true)
    end

    it 'returns false if index is already occupied' do
      subject.add_move(3, 'X')
      subject.add_move(6, 'O')

      expect(subject.legal_move?(3)).to eq(false)
    end
  end
end
