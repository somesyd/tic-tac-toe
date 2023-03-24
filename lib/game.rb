# frozen_string_literal:true

require_relative 'welcome'

class Game
  def initialize
    @welcome_message = "Welcome! Let's play a game of TIC-TAC-TOE!"
  end

  def play
    display_welcome_message
  end

  def display_welcome_message
    message = Embox.new(@welcome_message)
    message.print_box_message
  end
end

game = Game.new
game.play
