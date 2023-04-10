# frozen_string_literal:true

require 'game'

RSpec.describe Game do
  let(:current_board) { %w[1 2 3 4 5 6 7 8 9] }

  # instance variables
  let(:output) { double('Display', pretty_print_text: nil, pretty_print_board: nil) }
  let(:board) { double('Board', game_over?: true, win?: false, current_board:) }
  let(:turn) { double('Turn', run: nil) }

  # players array instance variable
  let(:player1) { double('Player', token: 'X', name: 'P1') }
  let(:player2) { double('Player', token: 'O', name: 'P2') }
  let(:players) { [player1, player2] }

  let(:game) { Game.new(output, board, turn, players) }

  it 'displays a welcome message' do
    expect(output).to receive(:pretty_print_text).with(Text::WELCOME_MESSAGE)
    game.play
  end

  it 'selects player2 if player1 has finished turn' do
    allow(board).to receive(:game_over?).and_return(false, false, true)

    expect(turn).to receive(:run).with(player1).ordered
    expect(turn).to receive(:run).with(player2).ordered

    game.play
  end

  it 'selects player1 if player2 has finished turn' do
    allow(board).to receive(:game_over?).and_return(false, false, false, true)

    expect(turn).to receive(:run).with(player1).ordered
    expect(turn).to receive(:run).with(player2).ordered
    expect(turn).to receive(:run).with(player1).ordered

    game.play
  end

  it 'displays a message at end of game with winner' do
    board = double('Board',
                   game_over?: true,
                   win?: true,
                   winner: 'X',
                   winner_array: [1, 4, 7],
                   current_board: %w[X O X O 6 X 8 9])
    game = Game.new(output, board, turn, players)

    expect(output).to receive(:pretty_print_text)
    expect(output).to receive(:pretty_print_board)

    game.play
  end

  it 'displays a message at end of game with tie' do
    expect(output).to receive(:pretty_print_text).with(Text::GAME_OVER_TIED)
    expect(output).to receive(:pretty_print_board)

    game.play
  end
end
