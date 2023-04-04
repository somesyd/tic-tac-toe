# frozen_string_literal:true

require 'game'
require 'text'
require 'board'

RSpec.describe 'Game#play' do
  let(:board_array) { %w[1 2 3 4 5 6 7 8 9] }

  let(:player1) { double('Player', name: 'P1', request_move: '1') }
  let(:player2) { double('Player', name: 'P2', request_move: '2') }
  let(:output) { double('Display', pretty_print_text: nil, pretty_print_board: nil, print_prompt: nil) }
  let(:board) { double('Board', current_board: board_array, add_move: nil) }
  let(:game) { Game.new(output, board, [player1, player2]) }

  it 'displays a welcome message' do
    expect(output).to receive(:pretty_print_text).with(WELCOME_MESSAGE)
    game.play
  end

  it 'displays a blank board' do
    expect(output).to receive(:pretty_print_board).with(board_array)
    game.display_board
  end

  it 'asks first player to pick new position' do
    message = "#{player1.name}, #{REQUEST_MOVE_MESSAGE}"

    expect(output).to receive(:print_prompt).with(message)
    expect(player1).to receive(:request_move).and_return('1')

    game.play
  end

  it 'prompts player for new input if input is bad' do
    allow(player1).to receive(:request_move).and_return('10', 'x', '9')

    expect(output).to receive(:print_prompt).twice.with(BAD_INPUT_MESSAGE)

    game.play
  end

  it 'updates the board when player moves' do
    arr = %w[X 2 3 4 5 6 7 8 9]

    expect(board).to receive(:add_move).with('1')

    game.play
  end
end
