#!/usr/bin/env ruby

# frozen_string_literal:true

require './lib/game'
require './lib/display'

game = Game.new(Display.new)
game.display_welcome_message
