# frozen_string_literal: true

require 'turn'
require 'text'

RSpec.describe Turn do
  # default variables
  let(:board_array) { %w[1 2 3 4 5 6 7 8 9] }
  let(:player) { double('Player', name: 'P1', token: 'X', make_move: '1') }

  # instance variables
  let(:output) { double('Display', pretty_print_board: nil, print_prompt: nil) }
  let(:board) { double('Board', add_move: nil, legal_move?: true, current_board: board_array) }

  let(:turn) { Turn.new(output, board) }

  it 'displays the board' do
    expect(output).to receive(:pretty_print_board).with(board_array)
    turn.run(player)
  end

  it 'displays a move request to player' do
    expect(output).to receive(:print_prompt)
    turn.run(player)
  end

  it 'makes the player enter a move' do
    expect(player).to receive(:make_move)
    turn.run(player)
  end

  it 'sends player move to update the board' do
    expect(board).to receive(:add_move).with(1, 'X')
    turn.run(player)
  end

  describe 'error handling' do
    it 'sends error message to player if move is out of range' do
      allow(player).to receive(:make_move).and_return('10', '4')

      expect(output).to receive(:print_prompt).with(BAD_INPUT_MESSAGE)
      turn.run(player)
    end

    it 'sends error message to player if chosen space is occupied' do
      allow(board).to receive(:legal_move?).and_return(false, true)
      allow(player).to receive(:make_move).and_return('3', '4')

      expect(output).to receive(:print_prompt).with(ILLEGAL_MOVE_MESSAGE)
      turn.run(player)
    end
  end
end
