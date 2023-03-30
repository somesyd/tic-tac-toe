# frozen_string_literal:true

require 'game'
require 'text'
require 'board'

RSpec.describe 'Game#play' do
  let(:output) { instance_double('Display', pretty_print_text: nil, pretty_print_board: nil) }
  let(:game) { Game.new(output, Board.new) }

  it 'displays a welcome message' do
    expect(output).to receive(:pretty_print_text).with(WELCOME_MESSAGE)
    game.play
  end

  it 'displays a blank board' do
    arr = '123456789'.chars
    expect(output).to receive(:pretty_print_board).with(arr)
    game.play
  end
end
