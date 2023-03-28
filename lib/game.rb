# frozen_string_literal:true

require './lib/text'
require './lib/display'

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
