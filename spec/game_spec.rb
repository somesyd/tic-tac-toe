# frozen_string_literal:true

require 'game'
require 'text'

RSpec.describe 'Game#play' do
  it 'displays a welcome message' do
    output = instance_double('display')
    allow(output).to receive(:text)
    game = Game.new(output)

    game.play

    expect(output).to have_received(:text).with(WELCOME_MESSAGE)
  end

  it 'displays a blank board' do
    output = instance_double('display')
    allow(output).to receive(:text)
    allow(output).to receive(:display_board)
    game = Game.new(output)

    game.play

    expect(output).to have_received(:display_board).with(Array.new(10, ''))
  end
end
