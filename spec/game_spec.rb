# frozen_string_literal:true

require 'game'
require 'text'

RSpec.describe 'Game' do
  it 'displays a welcome message' do
    output = instance_double(Display)
    allow(output).to receive(:text)
    game = Game.new(output)

    game.play

    expect(output).to have_received(:text).with(WELCOME_MESSAGE)
  end
end
