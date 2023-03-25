# frozen_string_literal:true

require_relative 'display'

class Game
  def initialize
    @welcome_message = "Welcome! Let's play a game of TIC-TAC-TOE!"
  end

  def play
    display_welcome_message
  end

  def display_welcome_message
    box = Embox.new(@welcome_message)
    puts box.message
  end
end

game = Game.new
game.display_welcome_message
