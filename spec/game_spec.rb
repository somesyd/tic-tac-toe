# frozen_string_literal:true

require 'game'
require 'text'

RSpec.describe Game do
  # instance variables
  let(:output) { double('Display', pretty_print_text: nil) }
  let(:board) { double('Board', win?: true) }
  let(:turn) { double('Turn', run: nil) }

  # players array instance variable
  let(:player1) { double('Player') }
  let(:player2) { double('Player') }
  let(:players) { [player1, player2] }

  let(:game) { Game.new(output, board, turn, players) }

  it 'displays a welcome message' do
    expect(output).to receive(:pretty_print_text).with(WELCOME_MESSAGE)
    game.play
  end

  it 'selects player2 if player1 has finished turn' do
    allow(board).to receive(:win?).and_return(false, false, true)

    expect(turn).to receive(:run).with(player1).ordered
    expect(turn).to receive(:run).with(player2).ordered

    game.play
  end

  it 'selects player1 if player2 has finished turn' do
    allow(board).to receive(:win?).and_return(false, false, false, true)

    expect(turn).to receive(:run).with(player1).ordered
    expect(turn).to receive(:run).with(player2).ordered
    expect(turn).to receive(:run).with(player1).ordered

    game.play
  end
end
