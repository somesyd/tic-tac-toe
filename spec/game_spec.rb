# frozen_string_literal:true

require 'game'
require 'text'
require 'board'

RSpec.describe 'Game#play' do
  let(:output) { instance_double('Display', text: nil, board: nil) }
  let(:game) { Game.new(output, Board.new) }

  it 'displays a welcome message' do
    expect(output).to receive(:text).with(WELCOME_MESSAGE)
    game.play
  end

  it 'displays a blank board' do
    expect(output).to receive(:board).with(Array.new(9, ''))
    game.play
  end
end
