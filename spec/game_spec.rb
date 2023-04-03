# frozen_string_literal:true

require 'game'
require 'text'
require 'board'

RSpec.describe 'Game#play' do
  let(:output) { double('Display', pretty_print_text: nil, pretty_print_board: nil) }
  let(:game) { Game.new(output, Board.new) }

  it 'displays a welcome message' do
    expect(output).to receive(:pretty_print_text).with(WELCOME_MESSAGE)
    game.play
  end

  it 'displays a blank board' do
    arr = %w[1 2 3 4 5 6 7 8 9]
    expect(output).to receive(:pretty_print_board).with(arr)
    game.play
  end
end
