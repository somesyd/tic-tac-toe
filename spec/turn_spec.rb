# frozen_string_literal: true

require 'turn'

RSpec.describe Turn do
  # default variables
  let(:board_array) { %w[1 2 3 4 5 6 7 8 9] }
  let(:player) { double('Player', name: 'P1', token: 'X', make_move: '1') }
  let(:report) { double('ErrorReport', valid: true, error_message: 'some text') }

  # instance variables
  let(:output) { double('Display', pretty_print_board: nil, print_prompt: nil) }
  let(:board) { double('Board', add_move: nil, legal_move?: true, current_board: board_array) }
  let(:validate) { double('Validate', check: report) }

  let(:turn) { Turn.new(output, board, validate) }

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

  it 'checks that player input is valid' do
    expect(validate).to receive(:check).with('1', board.current_board)
    turn.run(player)
  end
end
