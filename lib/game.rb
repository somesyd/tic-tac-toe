# frozen_string_literal:true

require_relative 'text'
require_relative 'display'

class Game
  def initialize(output)
    @output = output
  end

  def play
    display_welcome_message
  end

  def display_welcome_message
    @output.text(WELCOME_MESSAGE)
  end
end

game = Game.new(Display.new)
game.display_welcome_message
